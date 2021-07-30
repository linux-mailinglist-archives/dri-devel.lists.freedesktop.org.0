Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FF53DBFF4
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 22:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644FE6F4AB;
	Fri, 30 Jul 2021 20:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DCA6F4A8;
 Fri, 30 Jul 2021 20:41:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJuq44eYRQq8WdUYCktsIuEjiaUR+lXDfMHjD9xHN2yJturvBR6Z3d1zcKGDWBrnv5NTIHgVAQ7AF1CfknfrLYiXljG2zDvHGf95kpmQpMYyaFZPbLZ1xiymcJiS7tcIn7Syq0oLtIERSwsDTOBIYeirLIMiLBFx/gnDq3ejHra+/CO8T21I/8I6RMLrVGOFAOtV1Ix8IfSiOwHCj9/JeqbsnflsBqgOszGu5zv6NJ8nat0Ga+mcFG9JuTb5MIFpXs3QTytEqP0mIAy28LBYrbCqf+51tLY+858m3SfABB+rhV72YH7Dif4IyTcu3nfW1VOGGN9JNRqYASLLC9Idng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkUh7d2GERCWBxLBSxvRspCsv9o4fWzCCu3DSfi4Iwg=;
 b=GRiu1py02GJZdCszpaPf1VWveaQRDhJaOr2BPhKu5/CvLZ29L8imFJ8iEzVrML3ggb8evjBGFdCkyRibzfj2W2Flc9LOXmy0af/NaGV0IUjlwZBDQu0zI2bKM9p98XnVbEGSTq+BbsyKrGirRIl2fCS/1oORbsp2FJVJKiEwrK7muWbSSRqEkTRWUdUL1Ts6JurTItZAGQOTtucAP35udjdpxEUFUsvLavLv1H/u1lQhK1XkbK96VMqI9dii1NAcLgG8AzaA2EtY9OApFeNd/YSLGGut2TDMNyrvsujdhsEbOwAXwpq950rcHAU3PuRDimVr4H4cvwRz1+LFBJWyuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkUh7d2GERCWBxLBSxvRspCsv9o4fWzCCu3DSfi4Iwg=;
 b=Y/8sseXhH5YcReg474I3+RJc70vf3CbeM8EV+PgoOsWicAjYYPHgVxv8hKL18Gst2pkM8YO3JAQu7BC/0L+ZNGGlccB/0nTr/nbBLy+ppjeeBwcd8qzCnv3+RwZHaRLhcOs4HVbXiv5he4YvsgQlq29DKBY8awL+enSacMYy8YA=
Received: from CO2PR18CA0057.namprd18.prod.outlook.com (2603:10b6:104:2::25)
 by MN2PR12MB3856.namprd12.prod.outlook.com (2603:10b6:208:168::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Fri, 30 Jul
 2021 20:41:49 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:2:cafe::4a) by CO2PR18CA0057.outlook.office365.com
 (2603:10b6:104:2::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Fri, 30 Jul 2021 20:41:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 20:41:49 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 30 Jul
 2021 15:41:44 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 30 Jul
 2021 13:41:44 -0700
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Fri, 30 Jul 2021 15:41:43 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ppaalanen@gmail.com>, <sebastian@sebastianwick.net>, <mcasas@google.com>,
 <jshargo@google.com>, <Shashank.Sharma@amd.com>
CC: <Deepak.Sharma@amd.com>, <Shirish.S@amd.com>, <Vitaly.Prosyak@amd.com>,
 <aric.cyr@amd.com>, <Bhawanpreet.Lakha@amd.com>, <Krunoslav.Kovac@amd.com>,
 <hersenxs.wu@amd.com>, <Nicholas.Kazlauskas@amd.com>,
 <laurentiu.palcu@oss.nxp.com>, <ville.syrjala@linux.intel.com>, "Harry
 Wentland" <harry.wentland@amd.com>
Subject: [RFC PATCH v3 5/6] drm/color: Add color space plane property
Date: Fri, 30 Jul 2021 16:41:33 -0400
Message-ID: <20210730204134.21769-6-harry.wentland@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210730204134.21769-1-harry.wentland@amd.com>
References: <20210730204134.21769-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb9de49d-7975-48dd-1890-08d9539a746c
X-MS-TrafficTypeDiagnostic: MN2PR12MB3856:
X-Microsoft-Antispam-PRVS: <MN2PR12MB385667F995AAE144EDB5A9728CEC9@MN2PR12MB3856.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xPz4y6EcWbYuUYKQ773kp2hQGAoq/xr7opcc0TjAYUWcOXF7rfHy81+u8kHYSEv0OncANRD5epJXHJCwhXFeu349Iyj5ZlRE1D7WRkZkUNzNizcb6A0PENQOSYlL7N+ZuNxqie6mXM6OEcbMld5Npz0xvJQcsu4azu41pBjqcEC7tAHZTKkO7B3TSXNFZjUsv+Bxui0FhSdmTEBkoSJLp7RHnNFFIHW/Zk1u83fcb7o2B9Sri5xL8sOzVjhJnjHiYXaGN0hiQOO3T087JmtE+8IMAEYN4/Hqf4Mdi3Zjh/3z9AeNQoUwEvK0p9f2QKUEo11yFkl1iD1IDFvSYSj8S0b655OXj+CNwC6N5EWMFMEvlujOkXJapztATv0VqTZFwd1k7JMXT9tIwZswVtr+PahqzNl3xwLZ2S1YMMDoimRx6/VPRoFiB+yyi9rLfypsiO1VH/rK6wwxTe8YtUcX/3nid2+EMO87q1+7lOjt4S4UeL/B0FFyu5HN0yByFM2DGFurY6fQQF0mwzwHJ9hWwg6YywP5EKrnuNc9DfLi/Jxc0nS0NAptJAHy2qrMDQrq+qRJXDxEqGmSvN6jF0PA5ETmzgnyEMt1+Q1EwGO0LQqjqOmdShR0fTw3Od4nHwiKbhtkWk5Qsp1CvuzOFkg37a21Q5+9u9CCno0W7PCgcAW7ZSPfOV0JLKbdGeKNqKQRovPGsZYn4vLEND4i2UsESLd/JqyPXykluFhQL6f92Vo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(36840700001)(46966006)(478600001)(82310400003)(36756003)(316002)(26005)(2906002)(6636002)(1076003)(81166007)(82740400003)(5660300002)(30864003)(6666004)(186003)(44832011)(2616005)(336012)(70206006)(36860700001)(356005)(4326008)(110136005)(47076005)(8676002)(70586007)(8936002)(426003)(54906003)(83380400001)(86362001)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 20:41:49.1366 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9de49d-7975-48dd-1890-08d9539a746c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3856
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

Add color space definitions for BT601, BT709, BT2020, and DCI-P3.

Default to BT709, the sRGB color space.

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +
 .../gpu/drm/arm/display/komeda/komeda_plane.c |  2 +
 drivers/gpu/drm/arm/malidp_planes.c           |  4 +-
 drivers/gpu/drm/armada/armada_overlay.c       |  2 +
 drivers/gpu/drm/drm_color_mgmt.c              | 58 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_sprite.c   |  2 +
 .../drm/i915/display/skl_universal_plane.c    |  2 +
 drivers/gpu/drm/nouveau/dispnv04/overlay.c    |  2 +
 drivers/gpu/drm/omapdrm/omap_plane.c          |  2 +
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  6 +-
 drivers/gpu/drm/tidss/tidss_plane.c           |  4 ++
 include/drm/drm_color_mgmt.h                  | 16 +++++
 include/drm/drm_plane.h                       | 16 +++++
 13 files changed, 113 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b6d072211bf9..a6dbf1f26787 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7276,8 +7276,10 @@ static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 			BIT(DRM_COLOR_YCBCR_BT2020),
 			BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 			BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+			BIT(DRM_COLOR_SPACE_BT709),
 			BIT(DRM_TF_SRGB),
 			DRM_COLOR_YCBCR_BT709, DRM_COLOR_YCBCR_LIMITED_RANGE,
+			DRM_COLOR_SPACE_BT709,
 			DRM_TF_SRGB);
 	}
 
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
index 811f79ab6d32..4fb3ad4c691e 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
@@ -302,9 +302,11 @@ static int komeda_plane_add(struct komeda_kms_dev *kms,
 			BIT(DRM_COLOR_YCBCR_BT2020),
 			BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 			BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+			BIT(DRM_COLOR_SPACE_BT709),
 			BIT(DRM_TF_UNDEFINED),
 			DRM_COLOR_YCBCR_BT601,
 			DRM_COLOR_YCBCR_LIMITED_RANGE,
+			DRM_COLOR_SPACE_BT709,
 			DRM_TF_UNDEFINED);
 	if (err)
 		goto cleanup;
diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 98d308262880..0bc809435555 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -1023,6 +1023,7 @@ int malidp_de_planes_init(struct drm_device *drm)
 			/* default encoding for YUV->RGB is BT601 NARROW */
 			enum drm_color_encoding enc = DRM_COLOR_YCBCR_BT601;
 			enum drm_color_range range = DRM_COLOR_YCBCR_LIMITED_RANGE;
+			enum drm_color_space space = DRM_COLOR_SPACE_BT709;
 
 			ret = drm_plane_create_color_properties(&plane->base,
 					BIT(DRM_COLOR_YCBCR_BT601) | \
@@ -1030,8 +1031,9 @@ int malidp_de_planes_init(struct drm_device *drm)
 					BIT(DRM_COLOR_YCBCR_BT2020),
 					BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) | \
 					BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+					BIT(DRM_COLOR_SPACE_BT709),
 					BIT(DRM_TF_UNDEFINED),
-					enc, range,
+					enc, range, space,
 					DRM_TF_UNDEFINED);
 			if (!ret)
 				/* program the HW registers */
diff --git a/drivers/gpu/drm/armada/armada_overlay.c b/drivers/gpu/drm/armada/armada_overlay.c
index f7792444cb73..e66f2fa72830 100644
--- a/drivers/gpu/drm/armada/armada_overlay.c
+++ b/drivers/gpu/drm/armada/armada_overlay.c
@@ -596,9 +596,11 @@ int armada_overlay_plane_create(struct drm_device *dev, unsigned long crtcs)
 						BIT(DRM_COLOR_YCBCR_BT601) |
 						BIT(DRM_COLOR_YCBCR_BT709),
 						BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
+						BIT(DRM_COLOR_SPACE_BT709),
 						BIT(DRM_TF_UNDEFINED),
 						DEFAULT_ENCODING,
 						DRM_COLOR_YCBCR_LIMITED_RANGE,
+						DRM_COLOR_SPACE_BT709,
 						DRM_TF_UNDEFINED);
 
 	return ret;
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 44842ba0454d..75e6dbbd0081 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -526,6 +526,13 @@ static const char * const color_range_name[] = {
 	[DRM_COLOR_YCBCR_LIMITED_RANGE] = "YCbCr limited range",
 };
 
+static const char * const color_space_name[] = {
+	[DRM_COLOR_SPACE_BT601] = "ITU-R BT.601 RGB",
+	[DRM_COLOR_SPACE_BT709] = "ITU-R BT.709 RGB",
+	[DRM_COLOR_SPACE_BT2020] = "ITU-R BT.2020 RGB",
+	[DRM_COLOR_SPACE_P3] = "DCI-P3",
+};
+
 /**
  * drm_get_color_encoding_name - return a string for color encoding
  * @encoding: color encoding to compute name of
@@ -556,6 +563,21 @@ const char *drm_get_color_range_name(enum drm_color_range range)
 	return color_range_name[range];
 }
 
+/**
+ * drm_get_color_space_name - return a string for color space
+ * @space: color space to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_color_space_name(enum drm_color_space space)
+{
+	if (WARN_ON(space >= ARRAY_SIZE(color_space_name)))
+		return "unknown";
+
+	return color_space_name[space];
+}
+
 int drm_plane_create_sdr_white_level_property(struct drm_plane *plane){
 
 	struct drm_property *prop;
@@ -592,23 +614,28 @@ const char *drm_get_transfer_function_name(enum drm_transfer_function tf)
  * @plane: plane object
  * @supported_encodings: bitfield indicating supported color encodings
  * @supported_ranges: bitfileld indicating supported color ranges
+ * @supported_spaces: bitfield indicating supported color spaces
  * @supported_tfs: bitfield indicating supported transfer functions
  * @default_encoding: default color encoding
  * @default_range: default color range
+ * @default_space: default color space
  * @default_tf: default color transfer function
  *
- * Create and attach plane specific COLOR_ENCODING, COLOR_RANGE and TRANSFER_FUNCTION
- * properties to @plane. The supported encodings, ranges  and tfs should
- * be provided in supported_encodings, supported_ranges and supported_tfs bitmasks.
+ * Create and attach plane specific COLOR_ENCODING, COLOR_RANGE, COLOR_SPACE,
+ * and TRANSFER_FUNCTION properties to @plane. The supported encodings, ranges,
+ * spaces, and tfs should be provided in supported_encodings, supported_ranges,
+ * supported_spaces, and supported_tfs bitmasks.
  * Each bit set in the bitmask indicates that its number as enum
  * value is supported.
  */
 int drm_plane_create_color_properties(struct drm_plane *plane,
 				      u32 supported_encodings,
 				      u32 supported_ranges,
+				      u32 supported_spaces,
 				      u32 supported_tfs,
 				      enum drm_color_encoding default_encoding,
 				      enum drm_color_range default_range,
+				      enum drm_color_space default_space,
 				      enum drm_transfer_function default_tf)
 {
 	struct drm_device *dev = plane->dev;
@@ -628,6 +655,11 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
 		    (supported_ranges & BIT(default_range)) == 0))
 		return -EINVAL;
 
+	if (WARN_ON(supported_spaces == 0 ||
+		    (supported_spaces & -BIT(DRM_COLOR_SPACE_MAX)) != 0 ||
+		    (supported_spaces & BIT(default_space)) == 0))
+		return -EINVAL;
+
 	if (WARN_ON(supported_tfs == 0 ||
 		    (supported_tfs & -BIT(DRM_TF_MAX)) != 0 ||
 		    (supported_tfs & BIT(default_tf)) == 0))
@@ -672,6 +704,26 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
 		plane->state->color_range = default_range;
 
 
+	len = 0;
+	for (i = 0; i < DRM_COLOR_SPACE_MAX; i++) {
+		if ((supported_spaces & BIT(i)) == 0)
+			continue;
+
+		enum_list[len].type = i;
+		enum_list[len].name = color_space_name[i];
+		len++;
+	}
+
+	prop = drm_property_create_enum(dev, 0,	"COLOR_SPACE",
+					enum_list, len);
+	if (!prop)
+		return -ENOMEM;
+	plane->color_space_property = prop;
+	drm_object_attach_property(&plane->base, prop, default_space);
+	if (plane->state)
+		plane->state->color_space = default_space;
+
+
 	len = 0;
 	for (i = 0; i < DRM_TF_MAX; i++) {
 		if ((supported_tfs & BIT(i)) == 0)
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index b3f7aca3795b..76637b1aa5dc 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -1850,9 +1850,11 @@ intel_sprite_plane_create(struct drm_i915_private *dev_priv,
 					  BIT(DRM_COLOR_YCBCR_BT709),
 					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+					  BIT(DRM_COLOR_SPACE_BT709),
 					  BIT(DRM_TF_UNDEFINED),
 					  DRM_COLOR_YCBCR_BT709,
 					  DRM_COLOR_YCBCR_LIMITED_RANGE,
+					  DRM_COLOR_SPACE_BT709,
 					  DRM_TF_UNDEFINED);
 
 	zpos = sprite + 1;
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index df596431151d..3ed65e527dde 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2160,9 +2160,11 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 					  supported_csc,
 					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+					  BIT(DRM_COLOR_SPACE_BT709),
 					  BIT(DRM_TF_UNDEFINED),
 					  DRM_COLOR_YCBCR_BT709,
 					  DRM_COLOR_YCBCR_LIMITED_RANGE,
+					  DRM_COLOR_SPACE_BT709,
 					  DRM_TF_UNDEFINED);
 
 	drm_plane_create_alpha_property(&plane->base);
diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
index 64e1793212b4..dc350245c98b 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
@@ -345,9 +345,11 @@ nv10_overlay_init(struct drm_device *device)
 					  BIT(DRM_COLOR_YCBCR_BT601) |
 					  BIT(DRM_COLOR_YCBCR_BT709),
 					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
+					  BIT(DRM_COLOR_SPACE_BT709),
 					  BIT(DRM_TF_UNDEFINED),
 					  DRM_COLOR_YCBCR_BT601,
 					  DRM_COLOR_YCBCR_LIMITED_RANGE,
+					  DRM_COLOR_SPACE_BT709,
 					  DRM_TF_UNDEFINED);
 
 	plane->set_params = nv10_set_params;
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index ca7559824dcd..3eb52e78e08d 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -325,9 +325,11 @@ struct drm_plane *omap_plane_init(struct drm_device *dev,
 						  BIT(DRM_COLOR_YCBCR_BT709),
 						  BIT(DRM_COLOR_YCBCR_FULL_RANGE) |
 						  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
+						  BIT(DRM_COLOR_SPACE_BT709),
 						  BIT(DRM_TF_UNDEFINED),
 						  DRM_COLOR_YCBCR_BT601,
 						  DRM_COLOR_YCBCR_FULL_RANGE,
+						  DRM_COLOR_SPACE_BT709,
 						  DRM_TF_UNDEFINED);
 
 	return plane;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index eda8f51bafd7..c0115783c6a6 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -543,7 +543,7 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					       struct sun8i_mixer *mixer,
 					       int index)
 {
-	u32 supported_encodings, supported_ranges;
+	u32 supported_encodings, supported_ranges, supported_spaces;
 	unsigned int plane_cnt, format_count;
 	struct sun8i_vi_layer *layer;
 	const u32 *formats;
@@ -597,12 +597,16 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 			   BIT(DRM_COLOR_YCBCR_FULL_RANGE);
 
+	supported_spaces = BIT(DRM_COLOR_SPACE_BT709);
+
 	ret = drm_plane_create_color_properties(&layer->plane,
 						supported_encodings,
 						supported_ranges,
+						supported_spaces,
 						BIT(DRM_TF_UNDEFINED),
 						DRM_COLOR_YCBCR_BT709,
 						DRM_COLOR_YCBCR_LIMITED_RANGE,
+						DRM_COLOR_SPACE_BT709,
 						DRM_TF_UNDEFINED);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't add encoding and range properties!\n");
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index a1336ecd5fd5..367a14616756 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -186,9 +186,11 @@ struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
 			       BIT(DRM_COLOR_YCBCR_BT709));
 	u32 color_ranges = (BIT(DRM_COLOR_YCBCR_FULL_RANGE) |
 			    BIT(DRM_COLOR_YCBCR_LIMITED_RANGE));
+	u32 color_spaces = BIT(DRM_COLOR_SPACE_BY709);
 	u32 transfer_functions = BIT(DRM_TF_UNDEFINED;
 	u32 default_encoding = DRM_COLOR_YCBCR_BT601;
 	u32 default_range = DRM_COLOR_YCBCR_FULL_RANGE;
+	u32 default_space = DRM_COLOR_SPACE_BT709;
 	u32 default_tf = DRM_TF_UNDEFINED;;
 	u32 blend_modes = (BIT(DRM_MODE_BLEND_PREMULTI) |
 			   BIT(DRM_MODE_BLEND_COVERAGE));
@@ -219,9 +221,11 @@ struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
 	ret = drm_plane_create_color_properties(&tplane->plane,
 						color_encodings,
 						color_ranges,
+						color_spaces,
 						transfer_functions,
 						default_encoding,
 						default_range,
+						default_space,
 						default_tf);
 	if (ret)
 		goto err;
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 2a356a9601df..575427650542 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -99,6 +99,9 @@ static inline int drm_color_lut_size(const struct drm_property_blob *blob)
 	return blob->length / sizeof(struct drm_color_lut);
 }
 
+/**
+ * drm_color_encoding - describes the coefficient for YCbCr-RGB conversion
+ */
 enum drm_color_encoding {
 	DRM_COLOR_YCBCR_BT601,
 	DRM_COLOR_YCBCR_BT709,
@@ -112,12 +115,25 @@ enum drm_color_range {
 	DRM_COLOR_RANGE_MAX,
 };
 
+/**
+ * drm_color_space - describes the color space (primaries & white point)
+ */
+enum drm_color_space {
+	DRM_COLOR_SPACE_BT601,
+	DRM_COLOR_SPACE_BT709,
+	DRM_COLOR_SPACE_BT2020,
+	DRM_COLOR_SPACE_P3,
+	DRM_COLOR_SPACE_MAX,
+};
+
 int drm_plane_create_color_properties(struct drm_plane *plane,
 				      u32 supported_encodings,
 				      u32 supported_ranges,
+				      u32 supported_spaces,
 				      u32 supported_tf,
 				      enum drm_color_encoding default_encoding,
 				      enum drm_color_range default_range,
+				      enum drm_color_space default_space,
 				      enum drm_transfer_function default_tf);
 
 /**
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 93ee308a46af..8c9fe6350ead 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -179,6 +179,13 @@ struct drm_plane_state {
 	 */
 	enum drm_color_range color_range;
 
+	/**
+	 * @color_space
+	 *
+	 * Color space (primaries & white point) of the plane
+	 */
+	enum drm_color_space color_space;
+
 	/**
 	 * @transfer_function:
 	 *
@@ -754,6 +761,15 @@ struct drm_plane {
 	 * See drm_plane_create_color_properties().
 	 */
 	struct drm_property *color_range_property;
+	/**
+	 * @color_space_property:
+	 *
+	 * Optional "COLOR_SPACE" enum property for specifying
+	 * the color space (i.e. primaries and white point) of
+	 * the plane.
+	 * See drm_plane_create_color_properties().
+	 */
+	struct drm_property *color_space_property;
 	/**
 	 * @transfer_function_property:
 	 *
-- 
2.32.0

