Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B87E16C44EF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 09:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85AE310E8B8;
	Wed, 22 Mar 2023 08:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2044.outbound.protection.outlook.com [40.107.212.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CDA10E8A5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 08:30:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqPzbkNFuUgpK5M9C/ofFD75eF8qQN0kZJk/7En9Uzj7xdZtq9297UV8Zy8+uZYHe9plosnSIQXdAXlQUgRX0B1U6ANStGt4S9gfIMj4ZY01tw/Mc6t9eB6U7Pcx+Si+7G/4JSERHt16bZ/I3XpPCWyxs0dp6T2fzpme6QhmRr8ThfvNOcfXi+SIZDz7e00tPH/x2ifby8GXppmZqNqcIs2bfznf7v59wdhvcqviTYzqTx+IZ5oXAL08a/rj7zdj/mQQ6zdvAxv6GfBNWan0fVJyFTYdRObJlt7H3DD9LeCdsMdOGjKLyOeverXZ3dxdWWI7a8iB9POftSLRlVyfkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSdPUHrA/N0rkl+L2wqjrazeGVqFguGv20n41x52/do=;
 b=n+emCjQlcKNXaB8NpvfVlaz8xcqWHx+vC5qORpnUVcEB+2j3Iv1YBo006W7sEn8ZasY7db+OmE/Gp+cFfvNzGcEcLFkzOIH+xOAtqaXnRxhc55z2v65vTES6JEyxz7bol1ENFMWDKc98chW771aY+SX4ksr8PyMCQfM32HHpSzMPUTL6gDjFQVWXTE6QyZ3/E+IGZ04n66eHyCs84HIERB18w7HTj0H4GyJ2dNlYxQjd+QrU7kfN+gaX5PZ9JJxHMna3POljo0MizdX0VkSLDzxlXKJdC0Mjmm+0oh9r+A5NETHMc8Wrx3UDx7mCZ0lF5n9BC9vJjSZTaPB3ZqPkXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSdPUHrA/N0rkl+L2wqjrazeGVqFguGv20n41x52/do=;
 b=gwmBzTN21ww2b11ewskG5zGjRU1FD3k4OqnaQb2xM5ltWUsnr7qkuptms9rSBRd6F/jDJJK7Yo2X428YV7mnwYXyPUnGsUDVC0COKHb8GSxDCAr7RJy7ccmVqNDBNorfzPAsfSsJf3I/joCbUKKrj7ELND8e8F6wZsP+xbl+fsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by MN2PR03MB4944.namprd03.prod.outlook.com (2603:10b6:208:1b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 08:30:48 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::96e3:3428:3a5b:5872]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::96e3:3428:3a5b:5872%8]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 08:30:48 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 2/2] Documentation/gpu: Add Synaptics tiling formats
 documentation
Date: Wed, 22 Mar 2023 16:29:10 +0800
Message-Id: <20230322082910.115371-3-randy.li@synaptics.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322082910.115371-1-randy.li@synaptics.com>
References: <20230322082910.115371-1-randy.li@synaptics.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0151.namprd03.prod.outlook.com
 (2603:10b6:a03:338::6) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|MN2PR03MB4944:EE_
X-MS-Office365-Filtering-Correlation-Id: 680d1211-6e80-4f0c-9f86-08db2aafbcf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LU5QhdtzOvWivZwRWxXww9iiSUwNvE9bcbwKJdKa555hApksEDAx1k3vqZ61K6tYTVCBy1grL5v94RahS4bAuEgi8IX0tys2agv1+I3abQXi8O/k6Cf4Y0BrKg16+bq8UpTJ0I3bmgZ6Pw0yKr5wsquZvloPzG0MJdvRsqWfXNOscctyF89Z4NBF8DhMxkjIFS1YhKBhq8Z2LvHz+qWAI7zI7D2iAII1McjH4vxK+NRcJxa/kahWxZ3/Pm6Iwcb1daXyJjcuk79m0G7pVWmgH8n3PlFwA8xjk1QTpDH1dbOwdwiZn09lJeJQ8p9a1Ag8WCXHCOBCC0wjxOage3XqY0cU0tyEoQPFYdhEHyzLUca0YB2+OE4Gtle88fqZfGszXOV3TnKq3CnsaRb8wARxJdSGswKwV8GdHqivKeca+Fxa/DTLGH981UscZyZsEwXvHCrc0/uwsAMSQpphQza1NfFqaGZiavvXXfsdgxY2/0eTRGvfvS+GyvpWDBHQUluKoX004683Ip/KMBwRsHBENzzkO6KOI/Nbrhm5jq7T5FBMRsRRNxlufoHKcukYRQGkRRuMKpei46O0XWX6HTKCOmj6dOowZ71o1ZVsizcCGi1/yh6ftG84orOm2P9KRvZF0VjKfpph9KTKNlxkmKzX0xweFaeD/QMsIW/nRoU+6J8IamHiGb5NuMiKc/OgM+Bw0RfdhBbEz4gd9/D6xNyHb0un8XlONbmMf60lk0gTacaH+J0zoPg3a1qK5a/s4PLE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199018)(2616005)(52116002)(6666004)(186003)(6486002)(4326008)(83380400001)(478600001)(107886003)(316002)(66556008)(6916009)(8676002)(66946007)(66476007)(6506007)(26005)(1076003)(5660300002)(6512007)(8936002)(7416002)(2906002)(41300700001)(38350700002)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ySPm9j83rj6H3/u5iACPKuF35cUr6mTPzOr2lMeAe/MTN8ULV4IV9746/cBy?=
 =?us-ascii?Q?gY/bXzXI5j01hYFduyTuIXYb6sjtuyamR0VzJe4J7LRsslw0yHGl2zL9+yEU?=
 =?us-ascii?Q?LfXhG/yK2kdwi72UVTZK4QHc/A3fssTXwdfYGLFxsGkOOR6btOdNsYcsoS2P?=
 =?us-ascii?Q?bZ9UAgMDSEeJH7OWTXGiuHYduXWP06xmJPI9ZuzGYN1Ff72w7LFuPS5a3Q+W?=
 =?us-ascii?Q?ZuiknKoDy5rgEC6yECp8971NnOm5CabxoE8hgZ0mWxAVGrD6TY3q2txTEZs8?=
 =?us-ascii?Q?yltvW/CwQngbmbF8FTdYc6VaD66SjjmwkxfkPESigJHWPFQojQwrs4LTtD6K?=
 =?us-ascii?Q?cqUUejXbh8WQs7fI0eWpsZxBDnVOzSsu+xP9yQ9bTwAd7iY92ht+1amjI7SE?=
 =?us-ascii?Q?W5+3ZNCRoFYg7dzGwN2ZwdtJ/CcMAgqiBZA+fUTezithD7ndtX/TPQ0AO/b8?=
 =?us-ascii?Q?jjld8o93d03gmf4lLZFwssK+gALLxgGuVnsBU7f2w7k6b591cfLne7BZdyOS?=
 =?us-ascii?Q?j0LblOonueuhQEBKqAj5JrRQTiFFxZysd6eFaI8DJeLuJX1CC2UYVKto8Vvj?=
 =?us-ascii?Q?plrAxYmiZWgtVESDDsOyr07ulCP79VPXSbbgR1t1RGGppXvAiT7uvY1XU8lS?=
 =?us-ascii?Q?7Q+axeHasb/KC1eKNfkdPBz9k0ONWPmQf8V7U2mJPl2/DdnM2BqZ51glBgly?=
 =?us-ascii?Q?bEtGSFWUga3M3ciA3dFR9GVSQLnm2qiGwiprxVdWiKETzcj6CXkIE3WSid/q?=
 =?us-ascii?Q?gV7pvJWygv9VlhdC+vJ6smLxAL/2kBMZZD+pGzzEo5ir9xgyN8WTAaHzs1KH?=
 =?us-ascii?Q?RHIW6UgL/Abi81IK4PNNMG+AwcQ7D6ZiRUtiPQSi7RFnnUWtI3kH3mr3t2Vv?=
 =?us-ascii?Q?bGVVBk0fygJg64F1As3FToEd0ndPf9Udd9/c0e0aZUbAUoyfVYbRxzwVAnIa?=
 =?us-ascii?Q?mWVvMsmEJsd8cIIS9piVM1urfN1/s77afejsCIXm8iyBCRitjZHyzKwCheUr?=
 =?us-ascii?Q?O/OphJaYYQ+1BhgfwvbziW7sMXR03hZ7sxfhB2DAU74qYawwOjFgwtgiVRDQ?=
 =?us-ascii?Q?HBw7Khf9VM2KiG4LtN3JuoWLW/ua3Q4ZiMBWGSIhRdiADpe5XUntH8doslhv?=
 =?us-ascii?Q?Q54lVLxTm+32+LidoC3+8RaZCjpPIxLZ9KO/DIy9/TYcvK/HSm0o1kDQ/01/?=
 =?us-ascii?Q?8dDnJFUTeAK+BYiyRGFpyzdTyEYm6JhweJpnK4k9T5GZu0pczG642381SVEF?=
 =?us-ascii?Q?vSjDaJ6fjlyPaQ95YBB3thncc6TI+8SiIgyDuTcW/UhiZuV2lFvr3m4Rh6vq?=
 =?us-ascii?Q?BVFN4H0BoY2KIQvYAXtQvViH6P8AtR0eu86W5YnylbXP9O/J5Fv4hHDel0s0?=
 =?us-ascii?Q?ZhETFN1wrZ9aWnVqtiCogshzUCvWNu6ucuxoqN97zrFukutbXSryB8iHYvUw?=
 =?us-ascii?Q?sEX7n3cFq1bRO6qCioXGj7lPgEfdTq5K5wYfvrlagVPW5BTxzvBq380ha8lx?=
 =?us-ascii?Q?JP9bwIla3lw9gWFBlYnsn/qGdTmd7X0lXlKaJt/oEAvvB1Yl+M4Ar2Bthuhj?=
 =?us-ascii?Q?M+FVsX3GDXa90MYBTneXm6sQ2v6urFYwz7BF5nxl?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 680d1211-6e80-4f0c-9f86-08db2aafbcf5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 08:30:48.3570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4d5/9pVdffmpsWKvE3JQTmcdihcdPs36ZEwmSJRklwew+JzL8P2YaXL1pCUSgESwhwx5KFiboneF02pxfLYiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4944
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: tzimmermann@suse.de, ayaka@soulik.info, linux-kernel@vger.kernel.org,
 tfiga@chromium.org, Hsia-Jun Li <randy.li@synaptics.com>,
 laurent.pinchart@ideasonboard.com, ribalda@chromium.org, nicolas@ndufresne.ca
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Randy Li <ayaka@soulik.info>

Signed-off-by: Randy Li <ayaka@soulik.info>
Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
---
 Documentation/gpu/synaptics.rst | 81 +++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/gpu/synaptics.rst

diff --git a/Documentation/gpu/synaptics.rst b/Documentation/gpu/synaptics.rst
new file mode 100644
index 000000000000..4185ca536bf1
--- /dev/null
+++ b/Documentation/gpu/synaptics.rst
@@ -0,0 +1,81 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+================
+Synaptics Tiling
+================
+
+The tiling pixel formats in Synpatics Video Smart platform have
+many variants. Tiles could form the group of tiles, pixels within
+the group (nearest) width and height are stored into tile.
+Meanwhile, the tile in a group may not follow dimension layout,
+tile could form a small group of tiles, then that (sub)group
+of tiles would form a bigger group. We won't describe the dimension
+layout inside the group of tiles here. The layout of the group
+of tiles is fixed with the group width and height parameters
+in the same generation of the platform.
+
+Compression
+===========
+The proprietary lossless image compression protocol in Synaptics
+could minimizes the amount of data transferred (less memory bandwidth
+consumption) between devices. It would usually apply to the tiling
+pixel format.
+
+Each component would request an extra page aligned length buffer
+for storing the compression meta data. Also a 32 bytes parameters
+set would come with a compression meta data buffer.
+
+The component here corresponds to a signal type (i.e. Luma, chroma).
+They could be encoded into one or multiple metadata planes, but
+their compression parameters still would be individual.
+
+Pixel format modifiers
+======================
+Addition alignment requirement for stride and size of a memory plane
+could apply beyond what has been mentioned below. Remember always
+negotiating with all the devices in pipeline before allocation.
+
+.. flat-table:: Synpatics Image Format Modifiers
+
+	* - Identifier
+	  - Fourcc
+	  - Details
+
+	* - DRM_FORMAT_MOD_SYNA_V4H1
+	  - DRM_FORMAT_NV12
+	  - The plain uncompressed 8 bits tile format. It sounds similar to
+	Intel's Y-tile. but it won't take any pixel from the next X direction
+	in a tile group. The line stride and image height must be aligned to
+	a multiple of 16. The height of chrominance plane would plus 8.
+
+	* - DRM_FORMAT_MOD_SYNA_V4H3P8
+	  - DRM_FORMAT_NV15
+	  - The plain uncompressed 10 bits tile format. It stores pixel in 2D
+	3x4 tiles with a 8bits padding to each of tile. Then a tile is in a
+	128 bits cache line.
+
+	* - DRM_FORMAT_MOD_SYNA_V4H1_64L4_COMPRESSED
+	  - DRM_FORMAT_NV12
+	  - Group of tiles and compressed variant of ``DRM_FORMAT_MOD_SYNA_V4H1``.
+    A group of tiles would contain 64x4 pixels, where a tile has 1x4
+    pixel.
+
+	* - DRM_FORMAT_MOD_SYNA_V4H3P8_64L4_COMPRESSED
+	  - DRM_FORMAT_NV15
+	  - Group of tiles and compressed variant of ``DRM_FORMAT_MOD_SYNA_V4H3P8``.
+     A group of tiles would contains 48x4 pixels, where a tile has 3x4 pixels
+     and a 8 bits padding in the end of a tile. A group of tiles would
+     be 256 bytes.
+
+	* - ``DRM_FORMAT_MOD_SYNA_V4H1_128L128_COMPRESSED``
+	  - DRM_FORMAT_NV12
+	  - Group of tiles and compressed variant of ``DRM_FORMAT_MOD_SYNA_V4H1``.
+    A group of tiles would contain 128x32 pixels, where a tile has 1x4
+    pixel.
+
+	* - ``DRM_FORMAT_MOD_SYNA_V4H3P8_128L128_COMPRESSED``
+	  - DRM_FORMAT_NV15
+	  - Group of tiles and compressed variant of ``DRM_FORMAT_MOD_SYNA_V4H3P8``.
+     A group of tiles would contains 96x128 pixels, where a tile has 3x4 pixels
+     and a 8 bits padding in the end of a tile. A group of tiles would
+     be 16 KiB.
-- 
2.17.1

