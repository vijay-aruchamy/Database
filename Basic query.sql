 Create Database Student;
show databases;
use student;
-- RENAME DATABASE Student TO Student1;   
create table Stud_Details (s_ID int, S_Name varchar(25) );
alter table Stud_Details add column (age int);
alter table Stud_Details add column email varchar(50) after s_ID  ;
select * from Stud_Details;
alter table Stud_Details add column email varchar(50) first  ;

update Stud_Details set age=20 where s_id=2;
TRUNCATE TABLE stud_Details;
select * from Stud_Details;
alter table Stud_Details modify column age varchar(100);
insert into Stud_Details  values('1','vijay@gmail.com','vijay',20);
insert into Stud_Details  values('2','paul@gmail.com','paul',30);
alter table Stud_Details modify column age varchar(10);
-- alter table Stud_Details modify column s_name int;--cannot be changed-- 
insert into Stud_Details  values('3','deepak@gmail.com','deepak',20),(4,'sara@gmail.com','saravanan',20);
insert into Stud_Details (s_ID,email) values('5','david@gmail.com');
drop table stud_details;
savepoint saravanan;
delete from stud_details;
rollback to saravanan ;

create table Stud_Details1 (s_ID int, S_Name varchar(25) );
alter table Stud_Details1 add column (age int);
alter table Stud_Details1 add column email varchar(50) after s_ID  ;
insert into Stud_Details1  values('4','vijay');
insert into Stud_Details1  values('','paul@gmail.com','paul',30);
insert into stud_details1(select s_id,s_Name from stud_details );

select s_Name,count(s_name) as 'no of names' from Stud_details1 group by s_name having count(s_name)>1;
select min(s_id) as 'min of stud' from stud_details1;


-- like statement
select s_name from stud_details where s_name like 'p%';
select s_name from stud_details where s_name like '%k';

-- And and or
select s_name  from stud_details where s_name='vijay' and s_id='1';
select *  from stud_details where s_name='vijay' or s_name='deepak';

select * from stud_details where s_id in(1,2) ;

-- using order by in mulitple columns
select * from stud_details order by s_id asc , s_name desc;


delete from stud_details where s_id=5;
alter table stud_details add primary key (s_id);

create table Stud_Details2 (s_ID int , District varchar(25) ,phone varchar(10),foreign key(s_id) references stud_details(s_id));

insert into stud_details2 values(1,'coimbatore',12345),(2,'chennai',23456),(3,'coimbatore',34567);



--  join 

select * from stud_details s1 inner join stud_details2 s2 on s1.s_ID=s2.s_ID;
select * from stud_details s1 left join stud_details2 s2 on s1.s_ID=s2.s_ID;
select * from stud_details s1 right join stud_details2 s2 on s1.s_ID=s2.s_ID;
select * from stud_details s1 cross join stud_details2 s2 ;



create table Stud_Demo (s_ID int, S_Name varchar(25) );
alter table Stud_Demo add column (age int);
alter table Stud_Demo add column email varchar(50) after s_ID  ;
insert into stud_demo  values('4','paul@gmail.com','ajai',30);

alter table stud_details modify s_id int AUTO_INCREMENT;
describe stud_details;

select * from stud_details union  (select * from stud_demo);

select * from stud_details union all (select * from stud_demo);


-- in any all

select s_id from stud_details where S_id in(select s_ID from stud_details2);

-- works even one condition sastify
select s_id from stud_details where S_id > any(select s_ID from stud_details2);

-- works when all the condition sastify
select s_id from stud_details where S_id > all(select s_ID from stud_details2);

