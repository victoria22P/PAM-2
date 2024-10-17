import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Ensure you have imported the package for CupertinoIcons

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Header
              _buildHeaderSection(),

              // Home Card
              _buildHomeCard(),

              // Search and Filter Section
              _buildSearchAndFilter(),

              // Nearest Barbershop Section
              _buildNearestBarbershopSection(),

              // Most Recommended Section
              _buildMostRecommendedSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Header Section
  Widget _buildHeaderSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30), // Space to move the text down
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.grey),
                  SizedBox(width: 4), // Space between icon and text
                  Text(
                    'Yogyakarta',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18, // Text size
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4), // Space between city and name
              Text(
                'Joe Samanta',
                style: TextStyle(
                  fontSize: 24, // Text size for name
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 20), // Space to move the image down
              ClipOval( // Add ClipOval to maintain round shape
                child: Image.network(
                  'https://s3-alpha-sig.figma.com/img/ff32/d850/cd2e99d2642cbd554370487b5ad945ce?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=O2V1GQ3~liK6smCKf0cGXOS9CEgJI1fTXG~qfqPXrs1HaVRObUu5tHEtZH5V4aRwj-iSyyeuiJ0YatVS3hYoTCDmv8Eyx0z2JWw7rNT8kOKHOQW-d5BSC6AupNsB89atjTBpHFHLIw~Gk3qC7hn9~SmADvyK7zWxo2eSIQ0Tx00Pzg4yN793uBUv0MAyCq4W1OS4yltsbL80HeLm~fA74LlhOGpUDnjlQUHR7FJhsZQq6zqfJ89TbrM7~yFZdD8jH500GFicNG515BoI7WSaC-Sm40uwKa0D7bsp0G~8MPpdktGSt~8g71LVTI6wOuxTfo9KC1IsYfBfje9I9ajQfQ__',
                  width: 48, // Width of the image
                  height: 48, // Height of the image
                  fit: BoxFit.cover, // Ensure the image fits in oval
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHomeCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Reduce padding around the card
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Rounded corners
        ),
        child: Column(
          children: [
            SizedBox(height: 8), // Small space at the top
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
              child: Image.asset(
                'assets/HomeCard.png', // Ensure this path is correct
                fit: BoxFit.cover, // Image resizing
                height: 250, // Desired height
                width: double.infinity, // Full width
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Search and Filter Section
  Widget _buildSearchAndFilter() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Search field
          Expanded(
            child: Container(
              height: 44, // Fixed height of the search field
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search barber\'s, haircut services...',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.search), // Search icon on the left
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8), // Radius
                    borderSide: BorderSide(color: Colors.grey), // Border color
                  ),
                  filled: true,
                  fillColor: Color(0xFFEBF0F5), // Background color
                  contentPadding: EdgeInsets.fromLTRB(16, 12, 16, 12), // Adjusted padding
                ),
              ),
            ),
          ),
          SizedBox(width: 12), // Space between the search box and filter button

          // Filter button
          Container(
            width: 44, // Width of the button
            height: 44, // Height of the button
            decoration: BoxDecoration(
              color: Color(0xFF363062), // Button color
              borderRadius: BorderRadius.circular(8), // Corner radius
            ),
            child: IconButton(
              onPressed: () {
                // Action for filter button
              },
              icon: Icon(
                Icons.filter_list, // Icon for the filter button
                color: Colors.white, // Icon color
              ),
            ),
          ),
        ],
      ),
    );
  }

// Nearest Barbershop Section
  Widget _buildNearestBarbershopSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Nearest Barbershop',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 12), // Gap before the first item

        // First Barbershop
        _buildBarbershopTile(
          'Alana Barbershop – Haircut massage & Spa',
          'Banguntapan (5 km)',
          '4.5',
          'assets/imag1.png',
        ),
        SizedBox(height: 12), // Gap between items

        // Second Barbershop
        _buildBarbershopTile(
          'Hercha Barbershop – Haircut & Styling',
          'Jalan Kaliurang (8 km)',
          '5.0',
          'assets/imag2.png',
        ),
        SizedBox(height: 12), // Gap between items

        // Third Barbershop
        _buildBarbershopTile(
          'Barberking – Haircut styling & massage',
          'Jogja Expo Centre (12 km)',
          '4.8',
          'assets/imag3.png',
        ),
        SizedBox(height: 12), // Gap before the next section
      ],
    );
  }

  Widget _buildBarbershopTile(String title, String location, String rating,
      String imagePath) {
    return Container(
      width: 339, // Fixed width for the container
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8), // Rounded corners
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 100, // Increased image height
            width: 100, // Increased image width
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4), // Space between title and location

            // Row for location
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between items
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on, size: 16), // Location icon
                      SizedBox(width: 4), // Space between icon and text
                      Expanded(
                        child: Text(
                          location,
                          style: TextStyle(color: Colors.purple),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 4), // Space between location and rating

            // Row for rating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between items
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.star, size: 16, color: Colors.purple), // Star icon
                      SizedBox(width: 4), // Space between icon and text
                      Expanded(
                        child: Text(rating, style: TextStyle(color: Colors.purple)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  // Most Recommended Section
  Widget _buildMostRecommendedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Most Recommended',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 12), // Gap before the first recommended item

        // First Recommended Item - Large Image
        _buildLargeRecommendedTile(
          'Modern Barbershop – Trendy haircuts',
          'Jalan Terang (2 km)',
          '5.0',
          'assets/imag4.png',
        ),
        SizedBox(height: 12), // Gap between items

        // Recommended Items - Regular Size
        _buildRecommendedTile(
          'Master piece Barbershop – Haircut styling',
          'Joga Expo Centre (2 km)',
          '5.0',
          'assets/imag4.png',
        ),
        SizedBox(height: 12), // Gap between items
        // You can add more recommended items here using _buildRecommendedTile as needed
      ],
    );
  }

// Widget for the first recommended item with a large image
  Widget _buildLargeRecommendedTile(String title, String subtitle, String rating, String imagePath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          width: double.infinity, // Full width
          height: 200, // Adjust the height as needed
          fit: BoxFit.cover, // Cover the space
        ),
        SizedBox(height: 8), // Space between image and details
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: Colors.purple), // Map pin icon
                  SizedBox(width: 4),
                  Text(subtitle, style: TextStyle(color: Colors.purple)), // Display location
                ],
              ),
              Row(
                children: [
                  Icon(Icons.star, size: 16, color: Colors.purple), // Star icon
                  SizedBox(width: 4),
                  Text(rating, style: TextStyle(color: Colors.purple)), // Display rating
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

// Widget for regular recommended items
  Widget _buildRecommendedTile(String title, String location, String rating, String imagePath) {
    return Container(
      width: 339, // Fixed width for the container
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8), // Rounded corners
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 100, // Increased image height
            width: 100, // Increased image width
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4), // Space between title and location
            Row(
              children: [
                Icon(Icons.location_on, size: 16), // Location icon
                SizedBox(width: 4), // Space between icon and text
                Text(
                  location,
                  style: TextStyle(color: Colors.purple),
                ),
              ],
            ),
            SizedBox(height: 4), // Space between location and rating
            Row(
              children: [
                Icon(Icons.star, size: 16, color: Colors.purple), // Star icon
                SizedBox(width: 4), // Space between icon and text
                Text(rating, style: TextStyle(color: Colors.purple)), // Rating text
              ],
            ),
          ],
        ),
      ),
    );
  }
}