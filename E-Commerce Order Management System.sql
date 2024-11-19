create database ecoms;
use ecoms;

create table Customer(
customer_id int primary key,
first_name varchar(100),
last_name varchar(100),
email varchar(100),
phone decimal(10),
address_id varchar(100),
registration_date date);
INSERT INTO Customer(customer_id, first_name, last_name, email, phone, address_id, registration_date) VALUES
(101, 'Amit', 'Sharma', 'amit.sharma@email.com', '9123456789', 11, '2023-10-10'),
(102, 'Rohit', 'Verma', 'rohit.verma@email.com', '9123456790', 12, '2023-10-12'),
(103, 'Priya', 'Mehta', 'priya.mehta@email.com', '9123456791', 13, '2023-10-15'),
(104, 'Sneha', 'Rao', 'sneha.rao@email.com', '9123456792', 14, '2023-10-18'),
(105, 'Vikas', 'Patel', 'vikas.patel@email.com', '9123456793', 15, '2023-10-20'),
(106, 'Neha', 'Shah', 'neha.shah@email.com', '9123456794', 16, '2023-10-25'),
(107, 'Karan', 'Singh', 'karan.singh@email.com', '9123456795', 17, '2023-10-28'),
(108, 'Anita', 'Desai', 'anita.desai@email.com', '9123456796', 18, '2023-11-01'),
(109, 'Suresh', 'Iyer', 'suresh.iyer@email.com', '9123456797', 19, '2023-11-05'),
(000, 'Rina', 'Gupta', 'rina.gupta@email.com', '9123456798', 20, '2023-11-10'),
(111, 'Manish', 'Chopra', 'manish.chopra@email.com', '9123456799', 21, '2023-11-12'),
(112, 'Deepa', 'Pandey', 'deepa.pandey@email.com', '9123456800', 22, '2023-11-15'),
(113, 'Rahul', 'Kumar', 'rahul.kumar@email.com', '9123456801', 23, '2023-11-18'),
(114, 'Pooja', 'Bajaj', 'pooja.bajaj@email.com', '9123456802', 24, '2023-11-20'),
(115, 'Vivek', 'Mishra', 'vivek.mishra@email.com', '9123456803', 25, '2023-11-25'),
(116, 'Simran', 'Nair', 'simran.nair@email.com', '9123456804', 26, '2023-11-30');
select*from customer;
select*from addresses;
--------------------------------------------------------------
create table Products(
product_id int primary key,
name varchar(100),
description varchar(100),
price int,
stock_quantity int,
category_id int);
INSERT INTO products (product_id, name, description, price, stock_quantity, category_id) VALUES
(201, 'அரிசி (Rice)', 'High quality long grain rice.', 40.50, 100, 1101),
(202, 'துஅரிசி (Sona Masoori Rice)', 'Popular Indian variety of rice.', 55.00, 50, 1102),
(203, 'சாம்பார் மசாலா (Sambar Masala)', 'Spice blend for making Sambar.', 30.00, 200, 1101),
(204, 'மிளகு (Pepper)', 'Freshly ground black pepper.', 75.00, 80, 1102),
(205, 'தொக்கு (Tamarind)', 'Tamarind pulp for cooking.', 20.00, 150, 1103),
(206, 'உப்பு (Salt)', 'Natural sea salt.', 10.00, 500, 1101),
(207, 'முட்டை (Eggs)', 'Fresh organic eggs.', 5.00, 300, 1102),
(208, 'பால் (Milk)', 'Fresh cow’s milk.', 40.00, 200, 1103),
(209, 'தக்காளி (Tomato)', 'Fresh red tomatoes.', 25.00, 180, 1101),
(210, 'காய்கறி (Vegetables)', 'Mixed seasonal vegetables.', 60.00, 120, 1102),
(211, 'மல்லிகை (Jasmine)', 'Fresh jasmine flowers.', 50.00, 70, 1103),
(212, 'இஞ்சி (Ginger)', 'Fresh ginger root.', 45.00, 90, 1101),
(213, 'தனியா (Coriander)', 'Fresh coriander leaves.', 35.00, 200, 1102),
(214, 'சீனிக்காய்கள் (Chilies)', 'Fresh green chilies.', 30.00, 160, 1101),
(215, 'பொட்டுக்குட்டு (Pulses)', 'Variety of dried pulses.', 80.00, 75, 1102);
select*from products;
----------------------------------------------------------------

create table ProductCategories(
category_id int primary key,
category_name varchar(100),
description varchar(100)
);
INSERT INTO ProductCategories (category_id, category_name, description) VALUES
(1101, '(Staples)', 'Essential food items for everyday cooking.'),
(1102, '(Dairy & Eggs)', 'Dairy products and eggs for nutritional needs.'),
(1103, '(Spices)', 'A variety of spices used in cooking.'),
(1104, '(Vegetables)', 'Fresh vegetables for healthy meals.'),
(1105, '(Fruits)', 'Seasonal and exotic fruits.'),
(1106, '(Condiments)', 'Sauces and condiments for flavor enhancement.'),
(1107, '(Snacks)', 'Variety of snacks for quick bites.'),
(1108, '(Gravies)', 'Ready-to-cook gravies for convenience.'),
(1109, '(Rice)', 'Different varieties of rice for cooking.'),
(1110, '(Baked Goods)', 'Bread, pastries, and other baked items.'),
(1111, ' (Ingredients)', 'Basic ingredients for cooking.'),
(1112, 'Legumes)', 'Varieties of lentils and beans.'),
(1113, '(Salts & Sugars)', 'Different types of salts and sugars for cooking.');
select*from productcategories;
CREATE INDEX idx_products_category_id ON products(category_id);
desc productcategories;
set foreign_key_checks=0;
ALTER TABLE productcategories ADD CONSTRAINT fk_manpc FOREIGN KEY (category_id) REFERENCES products(category_id);
desc productcategories;
desc products;
--------------------------------------------------------------
create table Orders(
order_id int Primary Key,
customer_id int,
order_date date,
total_amount decimal(10,3),
status varchar(100),
shipping_address_id varchar(100),
payment_id int);
INSERT INTO Orders (order_id, customer_id, order_date, total_amount, status, shipping_address_id, payment_id) VALUES
(2201, 101, '2024-10-01', 1500.75, 'pending', 1, 301),
(2202, 102, '2024-10-02', 2500.50, 'shipped', 2, 302),
(2203, 103, '2024-10-03', 1200.00, 'delivered', 3, 303),
(2204, 104, '2024-10-04', 1750.30, 'canceled', 4, 304),
(2205, 105, '2024-10-05', 900.25, 'pending', 5, 305),
(2206, 106, '2024-10-06', 800.40, 'shipped', 6, 306),
(2207, 107, '2024-10-07', 3000.00, 'delivered', 7, 307),
(2208, 108, '2024-10-08', 450.80, 'pending', 8, 308),
(2209, 109, '2024-10-09', 2200.90, 'shipped', 9, 309),
(2210, 110, '2024-10-10', 350.75, 'delivered', 10, 310),
(2211, 111, '2024-10-11', 650.50, 'pending', 11, 311),
(2212, 112, '2024-10-12', 500.00, 'shipped', 12, 312),
(2213, 113, '2024-10-13', 1200.15, 'delivered', 13, 313),
(2214, 114, '2024-10-14', 750.30, 'canceled', 14, 314),
(2215, 115, '2024-10-15', 1800.60, 'pending', 15, 315);
select*from orders;
select*from addresses;
desc orders;
alter table orders modify column shipping_address_id int;
CREATE INDEX idx_orders_addresses_id ON addresses(address_id);
alter table orders add constraint fk_orders foreign key(shipping_address_id) references addresses(address_id);
alter table orders add constraint fk_orders1 foreign key(payment_id) references payments(payment_id);
desc orders;
-----------------------------------------------------------------
create table OrderDetails(
order_detail_id int Primary Key,
order_id int,
product_id int,
quantity int,
unit_price decimal(10,5),
discount decimal(10,0)
);
alter table orderdetails add constraint fk_od foreign key(order_id) references orders(order_id);
alter table orderdetails add constraint fk_od1 foreign key(product_id) references products(product_id);
INSERT INTO OrderDetails (order_detail_id, order_id, product_id, quantity, unit_price, discount) VALUES
(3201, 2203, 203, 2, 40.50, 5.00),
(3202, 2203, 204, 1, 55.00, 0.00),  
(3203, 2204, 205, 3, 30.00, 3.00),
(3204, 2205, 206, 4, 20.00, 2.00),
(3205, 2206, 207, 5, 75.00, 10.00),
(3206, 2207, 208, 2, 10.00, 1.00),
(3207, 2208, 209, 1, 40.00, 0.00),
(3208, 2209, 210, 3, 30.00, 2.00),   
(3209, 2210, 211, 2, 650.50, 5.00),  
(3210, 2211, 212, 1, 500.00, 0.00),  
(3211, 2212, 213, 4, 1200.15, 100.00), 
(3212, 2213, 214, 3, 1800.60, 50.00), 
(3213, 2214, 215, 2, 750.30, 5.00), 
(3214, 2215, 216, 1, 450.80, 0.00),  
(3215, 2215, 217, 5, 650.50, 10.00);
select*from orderdetails;
-----------------------------------------------------------------
create table Payments(
payment_id int Primary Key,
order_id int,
payment_method varchar(100),
payment_date date,
payment_status date
);
alter table payments add constraint fk_pay1 foreign key(order_id) references orders(order_id);
desc payments;
alter table payments modify column payment_status varchar(100);
INSERT INTO Payments (payment_id, order_id, payment_method, payment_date, payment_status) VALUES
(4401, 2201, 'Credit Card', '2024-10-01', 'successful'),
(4402, 2202, 'PayPal', '2024-10-02', 'successful'),
(4403, 2203, 'Cash', '2024-10-03', 'successful'),
(4404, 2204, 'Credit Card', '2024-10-04', 'failed'),
(4405, 2205, 'PayPal', '2024-10-05', 'successful'),
(4406, 2206, 'Cash', '2024-10-06', 'successful'),
(4407, 2207, 'Credit Card', '2024-10-07', 'successful'),
(4408, 2208, 'PayPal', '2024-10-08', 'failed'),
(4409, 2209, 'Cash', '2024-10-09', 'successful'),
(4410, 2210, 'Credit Card', '2024-10-10', 'successful'),
(4411, 2211, 'PayPal', '2024-10-11', 'successful'),
(4412, 2212, 'Cash', '2024-10-12', 'failed'),
(4413, 2213, 'Credit Card', '2024-10-13', 'successful'),
(4414, 2214, 'PayPal', '2024-10-14', 'successful'),
(4415, 2215, 'Cash', '2024-10-15', 'successful');
select*from payments;
----------------------------------------------------------------
create table ShippingDetails(
shipping_id int Primary Key,
order_id int,
shipping_method varchar(100),
shipping_cost int,
tracking_number int,
shipment_date date,
delivery_date date
); 
INSERT INTO ShippingDetails (shipping_id, order_id, shipping_method, shipping_cost, tracking_number, shipment_date, delivery_date) VALUES
(11101, 2201, 'Standard', 50, 10001, '2024-01-02', '2024-01-05'),
(11102, 2202, 'Express', 100, 10002, '2024-01-03', '2024-01-04'),
(11103, 2203, 'Standard', 50, 10003, '2024-01-04', '2024-01-07'),
(11104, 2204, 'Overnight', 150, 10004, '2024-01-05', '2024-01-06'),
(11105, 2205, 'Standard', 50, 10005, '2024-01-06', '2024-01-09'),
(11106, 2206, 'Express', 100, 10006, '2024-01-07', '2024-01-08'),
(11107, 2207, 'Standard', 50, 10007, '2024-01-08', '2024-01-11'),
(11108, 2208, 'Overnight', 150, 10008, '2024-01-09', '2024-01-10'),
(11109, 2209, 'Standard', 50, 10009, '2024-01-10', '2024-01-13'),
(11110, 2210, 'Express', 100, 10010, '2024-01-11', '2024-01-12'),
(11111, 2211, 'Standard', 50, 10011, '2024-01-12', '2024-01-15'),
(11112, 2212, 'Overnight', 150, 10012, '2024-01-13', '2024-01-14'),
(11113, 2213, 'Standard', 50, 10013, '2024-01-14', '2024-01-17'),
(11114, 2214, 'Express', 100, 10014, '2024-01-15', '2024-01-16'),
(11115, 2215, 'Standard', 50, 10015, '2024-01-16', '2024-01-19'),
(11116, 2216, 'Overnight', 150, 10016, '2024-01-17', '2024-01-18');

alter table shippingdetails add constraint fk_sd1 foreign key(order_id) references orders(order_id);
--------------------------------------------------------------
create table Addresses(
address_id int Primary Key,
customer_id int,
address_line1 int,
address_line2 int,
city varchar(100),
state varchar(100),
postal_code decimal(10,0),
country varchar(100)
);
truncate addresses;
INSERT INTO Addresses (address_id, customer_id, address_line1, address_line2, city, state, postal_code, country) VALUES
(20, 101, 123, 456, 'Mumbai', 'Maharashtra', 400001, 'India'),
(22, 102, 789, 101, 'Delhi', 'Delhi', 110001, 'India'),
(31, 103, 234, 567, 'Bangalore', 'Karnataka', 560001, 'India'),
(41, 104, 890, 234, 'Chennai', 'Tamil Nadu', 600001, 'India'),
(25, 105, 345, 678, 'Hyderabad', 'Telangana', 500001, 'India'),
(36, 106, 123, 456, 'Kolkata', 'West Bengal', 700001, 'India'),
(17, 107, 789, 101, 'Ahmedabad', 'Gujarat', 380001, 'India'),
(18, 108, 234, 567, 'Pune', 'Maharashtra', 411001, 'India'),
(19, 109, 890, 234, 'Jaipur', 'Rajasthan', 302001, 'India'),
(10, 110, 345, 678, 'Lucknow', 'Uttar Pradesh', 226001, 'India'),
(11, 111, 123, 456, 'Patna', 'Bihar', 800001, 'India'),
(12, 112, 789, 101, 'Chandigarh', 'Punjab', 160001, 'India'),
(13, 113, 234, 567, 'Bhopal', 'Madhya Pradesh', 462001, 'India'),
(14, 114, 890, 234, 'Thiruvananthapuram', 'Kerala', 695001, 'India'),
(15, 115, 345, 678, 'Guwahati', 'Assam', 781001, 'India'),
(16, 116, 123, 456, 'Panaji', 'Goa', 403001, 'India');
select*from addresses;
alter table addresses add constraint fk_a1 foreign key(customer_id) references customers(custometr_id);
--------------------------------------------------------------------
create table Cart(
cart_id int Primary Key,
customer_id int ,
creation_date date
);
alter table cart add constraint fk_cart foreign key(customer_id) references customers(customer_id);
INSERT INTO Cart (cart_id, customer_id, creation_date) VALUES
(1, 202, '2024-01-01'),
(2, 203, '2024-01-03'),
(3, 204, '2024-01-05'),
(4, 205, '2024-01-07'),
(5, 206, '2024-01-09'),
(6, 207, '2024-01-11'),
(7, 208, '2024-01-13'),
(8, 209, '2024-01-15'),
(9, 210, '2024-01-17'),
(10, 211, '2024-01-19'),
(11, 212, '2024-01-21'),
(12, 213, '2024-01-23'),
(13, 214, '2024-01-25');
select*from cart;
--------------------------------------------------------------------
create table CartItems(
cart_item_id int Primary Key,
cart_id int,
product_id int,
quantity int
);
alter table cartitems add constraint fk_ct1 foreign key(cart_id) references cart(cart_id);
alter table cartitems add constraint fk_ct2 foreign key(product_id) references product(product_id);
INSERT INTO CartItems (cart_item_id, cart_id, product_id, quantity) VALUES
(1, 1, 201, 2),
(2, 1, 202, 1),
(3, 1, 203, 3),
(4, 1, 204, 1),
(5, 1, 205, 5),
(6, 1, 206, 2),
(7, 1, 207, 4),
(8, 1, 208, 2),
(9, 1, 209, 1),
(10, 1, 210, 3),
(11, 1, 211, 1),
(12, 1, 212, 6),
(13, 1, 213, 2);
select*from cartitems;
--------------------------------------------------------------------
create table Reviews(
review_id int Primary Key,
customer_id int,
product_id int,
rating int,
review_text varchar(100),
review_date date
);
alter table reviews add constraint fk_re1 foreign key(customer_id) references customers(customer_id);
alter table reviews add constraint fk_re2 foreign key(product_id) references product(product_id);
INSERT INTO Reviews (review_id, customer_id, product_id, rating, review_text, review_date) VALUES
(1, 101, 201, 5, 'Excellent product!', '2024-01-02'),
(2, 102, 202, 4, 'Very good, satisfied.', '2024-01-04'),
(3, 103, 203, 3, 'Average quality.', '2024-01-06'),
(4, 104, 204, 2, 'Not what I expected.', '2024-01-08'),
(5, 105, 205, 1, 'Poor quality.', '2024-01-10'),
(6, 106, 206, 5, 'Amazing value for money!', '2024-01-12'),
(7, 107, 207, 4, 'Good product, fast delivery.', '2024-01-14'),
(8, 108, 208, 3, 'Decent, but could be better.', '2024-01-16'),
(9, 109, 209, 2, 'Disappointed with the quality.', '2024-01-18'),
(10, 110, 210, 5, 'Highly recommend this product!', '2024-01-20'),
(11, 111, 211, 4, 'Good for the price.', '2024-01-22'),
(12, 112, 212, 3, 'Okay product, nothing special.', '2024-01-24'),
(13, 113, 213, 5, 'Fantastic product, will buy again!', '2024-01-26');

---------------------------------------------------------------------
create table Inventory(
inventory_id int Primary Key,
product_id int,
quantity_available int,
last_updated int
);
alter table inventory add constraint fk_in foreign key(product_id) references product(product_id);
INSERT INTO Inventory (inventory_id, product_id, quantity_available, last_updated) VALUES
(5501, 201, 50, 20240101),
(5502, 202, 30, 20240102),
(5503, 203, 20, 20240103),
(5504, 204, 60, 20240104),
(5505, 205, 40, 20240105),
(5506, 206, 25, 20240106),
(5507, 207, 35, 20240107),
(5508, 208, 15, 20240108),
(5509, 209, 45, 20240109),
(5510, 210, 55, 20240110),
(5511, 211, 65, 20240111),
(5512, 212, 75, 20240112),
(5513, 213, 85, 20240113);

--------------------------------------------------------------------- 
create table Suppliers(
supplier_id int Primary Key,
supplier_name varchar(100),
contact_name varchar(100),
contact_phone decimal(10,0),
contact_email varchar(100),
address_id int
);
alter table suppliers add constraint fk_sup foreign key(address_id) references addresses(address_id);
INSERT INTO Suppliers (supplier_id, supplier_name, contact_name, contact_phone, contact_email, address_id) VALUES
(6601, 'Tech Supplies Co.', 'Rahul Mehta', '9876543210', 'rahul.mehta@techsupplies.com', 1),
(6602, 'Gadgets Inc.', 'Priya Nair', '9876543211', 'priya.nair@gadgetsinc.com', 2),
(6603, 'Electro Mart', 'Aarav Reddy', '9876543212', 'aarav.reddy@electromart.com', 3),
(6604, 'Quality Goods', 'Sanya Gupta', '9876543213', 'sanya.gupta@qualitygoods.com', 4),
(6605, 'Smart Tech', 'Kunal Singh', '9876543214', 'kunal.singh@smarttech.com', 5),
(6606, 'Innovate Solutions', 'Kavya Verma', '9876543215', 'kavya.verma@innovatesolutions.com', 6),
(6607, 'Gadget World', 'Isha Joshi', '9876543216', 'isha.joshi@gadgetworld.com', 7),
(6608, 'Elite Electronics', 'Rohan Malhotra', '9876543217', 'rohan.malhotra@eliteelectronics.com', 8),
(6609, 'Max Technologies', 'Diya Kapoor', '9876543218', 'diya.kapoor@maxtechnologies.com', 9),
(6610, 'Future Innovations', 'Tarun Rao', '9876543219', 'tarun.rao@futureinnovations.com', 10),
(6611, 'NextGen Devices', 'Neha Patil', '9876543220', 'neha.patil@nextgendevices.com', 11),
(6612, 'Digital Hub', 'Manish Bhatia', '9876543221', 'manish.bhatia@digitalhub.com', 12),
(6613, 'Cyber Equipments', 'Sakshi Desai', '9876543222', 'sakshi.desai@cyberequipments.com', 13);


select*from addresses;
-------------------------------------------------------------------
create table SupplierProducts(
supplier_product_id int Primary Key,
supplier_id int,
product_id int,
cost_price int,
supply_date date
);
alter table supplierproducts add constraint fk_sp foreign key(supplier_id) references suppliers(supplier_id);
alter table supplierproducts add constraint fk_sp1 foreign key(product_id) references products(product_id);
INSERT INTO SupplierProducts (supplier_product_id, supplier_id, product_id, cost_price, supply_date) VALUES
(1, 6601, 201, 800, '2024-01-02'),
(2, 6601, 202, 1200, '2024-01-04'),
(3, 6601, 203, 1500, '2024-01-06'),
(4, 6602, 204, 700, '2024-01-08'),
(5, 6602, 205, 1300, '2024-01-10'),
(6, 6603, 206, 900, '2024-01-12'),
(7, 6603, 207, 1100, '2024-01-14'),
(8, 6604, 208, 950, '2024-01-16'),
(9, 6604, 209, 850, '2024-01-18'),
(10, 6605, 210, 1200, '2024-01-20'),
(11, 6605, 211, 1400, '2024-01-22'),
(12, 6606, 212, 1050, '2024-01-24'),
(13, 6606, 213, 1150, '2024-01-26');

--------------------------------------------------------------------
create table Wishlists(
wishlist_id int Primary Key,
customer_id int,
product_id int,
added_date date
);
alter table wishlists add constraint fk_wl1 foreign key(product_id) references products(product_id);
SHOW TABLES LIKE 'wistlists';
SHOW TABLES LIKE 'wishlists';  -- Alternative name
ALTER TABLE wishlists ADD CONSTRAINT fk_wait2 FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

INSERT INTO Wishlists (wishlist_id, customer_id, product_id, added_date) VALUES
(1, 101, 201, '2024-01-02'),
(2, 101, 202, '2024-01-03'),
(3, 101, 203, '2024-01-04'),
(4, 102, 204, '2024-01-05'),
(5, 102, 205, '2024-01-06'),
(6, 103, 206, '2024-01-07'),
(7, 103, 207, '2024-01-08'),
(8, 104, 208, '2024-01-09'),
(9, 104, 209, '2024-01-10'),
(10, 105, 210, '2024-01-11'),
(11, 105, 211, '2024-01-12'),
(12, 106, 212, '2024-01-13'),
(13, 106, 213, '2024-01-14');

select*from customer;
select*from addresses;

--------------------------------------------------------------------------------
#Foreign Key
ALTER TABLE productcategories ADD CONSTRAINT fk_manpc FOREIGN KEY (category_id) REFERENCES products(category_id);
alter table orders add constraint fk_orders foreign key(shipping_address_id) references addresses(address_id);
alter table orders add constraint fk_orders1 foreign key(payment_id) references payments(payment_id);
ALTER TABLE productcategories ADD CONSTRAINT fk_manpc FOREIGN KEY (category_id) REFERENCES products(category_id);
alter table orderdetails add constraint fk_od foreign key(order_id) references orders(order_id);
alter table orderdetails add constraint fk_od1 foreign key(product_id) references products(product_id);
alter table reviews add constraint fk_re1 foreign key(customer_id) references customers(customer_id);
alter table reviews add constraint fk_re2 foreign key(product_id) references product(product_id);
alter table inventory add constraint fk_in foreign key(product_id) references product(product_id);
alter table supplierproducts add constraint fk_sp foreign key(supplier_id) references suppliers(supplier_id);
alter table supplierproducts add constraint fk_sp1 foreign key(product_id) references products(product_id);
alter table wishlists add constraint fk_wl1 foreign key(product_id) references products(product_id);
SHOW TABLES LIKE 'wistlists';
SHOW TABLES LIKE 'wishlists';  -- Alternative name
ALTER TABLE wishlists ADD CONSTRAINT fk_wait2 FOREIGN KEY (customer_id) REFERENCES customer(customer_id);


alter table suppliers add column product_id int;
 update suppliers set product_id=211 where  supplier_id=6610;
 update suppliers set product_id=213 where  supplier_id=6611;
 update suppliers set product_id=215 where  supplier_id=6612;
 update suppliers set product_id=216 where  supplier_id=6613;
 update suppliers set product_id=214 where  supplier_id=6614;
 update suppliers set product_id=219 where  supplier_id=6615;
 update suppliers set product_id=212 where  supplier_id=6616;
 update suppliers set product_id=220 where  supplier_id=6617;
 update suppliers set product_id=221 where  supplier_id=6618;
 alter table suppliers add constraint fk_conid foreign key(product_id) references products(product_id);
 set foreign_key_checks=1;






