Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD813DBFF9
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 22:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C3B6F4AE;
	Fri, 30 Jul 2021 20:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2066.outbound.protection.outlook.com [40.107.95.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D82A6F4AC;
 Fri, 30 Jul 2021 20:41:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDiYX/uxf+kQZQOPRUk4iF3u3sDeSJgori0/W8M25vr3ldxa0idNR/GmCkytM4ql+66CdbTW9OcI3MSX6TKpoqaIcjSpmdlG3858FA7WBrwNQC/p0fdUBnJQyzZmhQEIhzesMAjoNdEPztp75odo0nwmnUX5eSoaR3U2Ss6V35yCW/A6ESCB5+K7It8mPFNYT/dmz/8BHLQhkMxP/qCVEtf2UCeyMWMmmz+FvMCgfrWXOZFOH3/2r4hfNfA5iiOnVZVIKumitDiZKaJA+tInwqHJgNwtDUndy3xup2Fti8PpUUTc9KVGO4w/esSjUQ9UaZppb1bgJCB4yfA8cv7HbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WS6j2w3ibOn08CX5uhqesiXQtF5RyGESr+EQhsiuNI=;
 b=f9Ku0rpEMVv2np7Kv3mdGoH8RubY5FdhhUyVxDBd3kfayxINpk9JzBGWPcaAvZ8MjCNuLoR3w3GxnpXAMd0CHngi27xm/7iVUae4HTSLfAqTZeRmy4ZVK+9l0teZCP7b+IfKUi1/RWa9NZ0oLcgQJSFcablWmq4MfUIzzXgiE+1GjTs32ujvMMEI/QDqJo9sg7LO3SLySnH6+OropnZUMeIdNGqd+uR1GHhhyMQZbAxFaBlhjvKOD8EewNzOvHWnGbN9nlse6MTtaTC8au5gyH0N/64UF3rHb0MYaLnT8fbS9uLLaF9tJ1QrlIN3tJpmCYzBQab8I/UhPdN6YNRfDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WS6j2w3ibOn08CX5uhqesiXQtF5RyGESr+EQhsiuNI=;
 b=HN4ISt9OGXP0IMnEtfjxlAN1R1XKutfsqHIKcG+BjIV1HoFE8uCaqJaEX6LpQNiyFI1XYl0Q2YHEpU/R/a+93/5P1vQrEi+J4n0tDr2oHBH5VbV063DpCZ6d4JoeLzHp2/eYjUyiRwaf1Q+Ij4NhrJADHVdCnBDzXRBEjsHV7W0=
Received: from DM5PR21CA0022.namprd21.prod.outlook.com (2603:10b6:3:ac::32) by
 PH0PR12MB5450.namprd12.prod.outlook.com (2603:10b6:510:e8::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18; Fri, 30 Jul 2021 20:41:47 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ac:cafe::4e) by DM5PR21CA0022.outlook.office365.com
 (2603:10b6:3:ac::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.1 via Frontend
 Transport; Fri, 30 Jul 2021 20:41:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 20:41:47 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 30 Jul
 2021 15:41:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 30 Jul
 2021 13:41:40 -0700
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Fri, 30 Jul 2021 15:41:39 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ppaalanen@gmail.com>, <sebastian@sebastianwick.net>, <mcasas@google.com>,
 <jshargo@google.com>, <Shashank.Sharma@amd.com>
CC: <Deepak.Sharma@amd.com>, <Shirish.S@amd.com>, <Vitaly.Prosyak@amd.com>,
 <aric.cyr@amd.com>, <Bhawanpreet.Lakha@amd.com>, <Krunoslav.Kovac@amd.com>,
 <hersenxs.wu@amd.com>, <Nicholas.Kazlauskas@amd.com>,
 <laurentiu.palcu@oss.nxp.com>, <ville.syrjala@linux.intel.com>, "Harry
 Wentland" <harry.wentland@amd.com>
Subject: [RFC PATCH v3 2/6] drm/color: Add transfer functions for HDR/SDR on
 drm_plane
Date: Fri, 30 Jul 2021 16:41:30 -0400
Message-ID: <20210730204134.21769-3-harry.wentland@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210730204134.21769-1-harry.wentland@amd.com>
References: <20210730204134.21769-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ba9306e-05f6-4fea-c85d-08d9539a737a
X-MS-TrafficTypeDiagnostic: PH0PR12MB5450:
X-Microsoft-Antispam-PRVS: <PH0PR12MB54507CFC01783EC53B4A8E548CEC9@PH0PR12MB5450.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BEvkyRbxhDS/VCgajc8OA9fKNzzXcL2gH1j/qo4EtIAaAqvZm2aBPtS0EX1CgvU29+5rOS/7lcAUAQFpnIz80yrQbWik3p4qN8QUmL14AMDSDCrOHWojF4noP8DmqUUDPsDBl9aDcXUb5eCl+tn6i+QbcSRWpBii1ELfLNk8vJri2E4bcp7XiltDV8QOA5fwlEfMcqO6HeaGB7LckqZkq8IIaEqfguigtdC2mwbsHWFYZHv0k3A7uqF8w3xBbm3TL9MoytKPDYTMn1XJdbbwwH1Sv0PlnEhn+1Y1ld6/RMOMxLeab23Ri3PEzKm/z/JyZP8Yc3/5amLvZE2ZgNYF7J2acnvE3b0g84P4Kr00QQYdkjEKNsiKwCs14uDzjKCe5zfCVYFXSVQghv25cfQHhdy6qRdrsU1hMJ0rs3B1vZkqMbhayP8ClfaYcvaBevOv6dx7KpKM2Dhx3zyWg3UKEa+EpNo20wUqtGiYp7a1zNxu8m4apKlIzNQObvrAij8rfrKE2fgaNBs/yw8mAW0+/ES5AyLe4W7/PDucd/Z9LajwywBlQDk/+3gCCZs1Y/KM11uIyEJr73RkHOqq5Itq0D52tIySHxMQlC9bmpxKBf1iPfiIUsFskKdK3V9sGf5RlxIRzd5DZfs2Hwq7cX5e6c5dGGkaYWQCkOpENS2VVxPfSYGawDxCyplPnmYam2xpmcjbE7WDA6SvrqESmqIVNogjKjSQHBspxRTD5GUXxyA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(36840700001)(46966006)(316002)(70206006)(2906002)(6666004)(47076005)(70586007)(478600001)(83380400001)(8676002)(86362001)(54906003)(356005)(4326008)(6636002)(44832011)(81166007)(30864003)(336012)(110136005)(1076003)(8936002)(26005)(82310400003)(2616005)(82740400003)(36860700001)(5660300002)(7696005)(186003)(36756003)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 20:41:47.6141 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba9306e-05f6-4fea-c85d-08d9539a737a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5450
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

Due to the way displays and human vision work it is most effective to
encode luminance information in a non-linear space.

For SDR this non-linear mapping is assumed to roughly use a gamma 2.2 curve.
This was due to the way CRTs worked and was fine for SDR content with a
low luminance range.

The large luminance range (0-10,000 nits) for HDR exposes some
short-comings of a simple gamma curve that have been addressed
through various Electro-Optical Transfer Functions (EOTFs).

Rather than assuming how framebuffer content is encoded we want to
make sure userspace presenting HDR content is explicit about the
EOTF of the content, so a driver can decide whether the content
can be supported or not.

This Patch adds common transfer functions for SDR/HDR. These can
be used to communicate with the driver regarding the transformation to
use for a given plane.

enums added:
	DRM_TF_UNDEFINED
		the legacy case where the TF in/out of blending space is
		undefined
	DRM_TF_SRGB
		roughly 2.4 gamma with initial linear section
	DRM_TF_BT709
		Similar to Gamma 2.2-2.8
	DRM_TF_PQ2084
		most common tf used for HDR video (HDR10/Dolby). Can support up
		to 10,000 nits

The usage is similar to color_encoding and color_range where the driver
can specify the default and supported tfs and pass it into
drm_plane_create_color_properties().

v2:
 - drop "color" from transfer function name (Harry)
 - add DRM_TF_UNDEFINED enum as legacy default (Harry)

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +-
 .../gpu/drm/arm/display/komeda/komeda_plane.c |  4 +-
 drivers/gpu/drm/arm/malidp_planes.c           |  4 +-
 drivers/gpu/drm/armada/armada_overlay.c       |  4 +-
 drivers/gpu/drm/drm_atomic_uapi.c             |  4 ++
 drivers/gpu/drm/drm_color_mgmt.c              | 64 +++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_sprite.c   |  4 +-
 .../drm/i915/display/skl_universal_plane.c    |  4 +-
 drivers/gpu/drm/nouveau/dispnv04/overlay.c    |  4 +-
 drivers/gpu/drm/omapdrm/omap_plane.c          |  4 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  4 +-
 drivers/gpu/drm/tidss/tidss_plane.c           |  6 +-
 include/drm/drm_color_mgmt.h                  | 18 +++++-
 include/drm/drm_plane.h                       | 16 +++++
 14 files changed, 128 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b5b5ccf0ed71..63ddae9c5abe 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7276,7 +7276,9 @@ static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 			BIT(DRM_COLOR_YCBCR_BT2020),
 			BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 			BIT(DRM_COLOR_YCBCR_FULL_RANGE),
-			DRM_COLOR_YCBCR_BT709, DRM_COLOR_YCBCR_LIMITED_RANGE);
+			BIT(DRM_TF_SRGB),
+			DRM_COLOR_YCBCR_BT709, DRM_COLOR_YCBCR_LIMITED_RANGE,
+			DRM_TF_SRGB);
 	}
 
 	supported_rotations =
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
index d63d83800a8a..811f79ab6d32 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
@@ -302,8 +302,10 @@ static int komeda_plane_add(struct komeda_kms_dev *kms,
 			BIT(DRM_COLOR_YCBCR_BT2020),
 			BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 			BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+			BIT(DRM_TF_UNDEFINED),
 			DRM_COLOR_YCBCR_BT601,
-			DRM_COLOR_YCBCR_LIMITED_RANGE);
+			DRM_COLOR_YCBCR_LIMITED_RANGE,
+			DRM_TF_UNDEFINED);
 	if (err)
 		goto cleanup;
 
diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 8c2ab3d653b7..98d308262880 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -1030,7 +1030,9 @@ int malidp_de_planes_init(struct drm_device *drm)
 					BIT(DRM_COLOR_YCBCR_BT2020),
 					BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) | \
 					BIT(DRM_COLOR_YCBCR_FULL_RANGE),
-					enc, range);
+					BIT(DRM_TF_UNDEFINED),
+					enc, range,
+					DRM_TF_UNDEFINED);
 			if (!ret)
 				/* program the HW registers */
 				malidp_de_set_color_encoding(plane, enc, range);
diff --git a/drivers/gpu/drm/armada/armada_overlay.c b/drivers/gpu/drm/armada/armada_overlay.c
index d3e3e5fdc390..f7792444cb73 100644
--- a/drivers/gpu/drm/armada/armada_overlay.c
+++ b/drivers/gpu/drm/armada/armada_overlay.c
@@ -596,8 +596,10 @@ int armada_overlay_plane_create(struct drm_device *dev, unsigned long crtcs)
 						BIT(DRM_COLOR_YCBCR_BT601) |
 						BIT(DRM_COLOR_YCBCR_BT709),
 						BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
+						BIT(DRM_TF_UNDEFINED),
 						DEFAULT_ENCODING,
-						DRM_COLOR_YCBCR_LIMITED_RANGE);
+						DRM_COLOR_YCBCR_LIMITED_RANGE,
+						DRM_TF_UNDEFINED);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 7e48d40600ff..9582515dd12e 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -596,6 +596,8 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		state->color_encoding = val;
 	} else if (property == plane->color_range_property) {
 		state->color_range = val;
+	} else if (property == plane->transfer_function_property) {
+		state->transfer_function = val;
 	} else if (property == config->prop_fb_damage_clips) {
 		ret = drm_atomic_replace_property_blob_from_id(dev,
 					&state->fb_damage_clips,
@@ -662,6 +664,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = state->color_encoding;
 	} else if (property == plane->color_range_property) {
 		*val = state->color_range;
+	} else if (property == plane->transfer_function_property) {
+		*val = state->transfer_function;
 	} else if (property == config->prop_fb_damage_clips) {
 		*val = (state->fb_damage_clips) ?
 			state->fb_damage_clips->base.id : 0;
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index bb14f488c8f6..daf62fb090a6 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -106,6 +106,11 @@
  * 	Optional plane enum property to support different non RGB
  * 	color parameter ranges. The driver can provide a subset of
  * 	standard enum values supported by the DRM plane.
+ *
+ * "COLOR_TRANFER_FUNCTION":
+ * 	Optional plane enum property to support different
+ * 	color luminance mappings. The driver can provide a subset of
+ * 	standard enum values supported by the DRM plane.
  */
 
 /**
@@ -476,6 +481,11 @@ static const char * const color_range_name[] = {
 	[DRM_COLOR_YCBCR_LIMITED_RANGE] = "YCbCr limited range",
 };
 
+static const char * const tf_name[] = {
+	[DRM_TF_UNDEFINED] = "undefined",
+	[DRM_TF_SRGB] = "sRGB",
+	[DRM_TF_PQ2084] = "PQ2084",
+};
 /**
  * drm_get_color_encoding_name - return a string for color encoding
  * @encoding: color encoding to compute name of
@@ -506,30 +516,49 @@ const char *drm_get_color_range_name(enum drm_color_range range)
 	return color_range_name[range];
 }
 
+/**
+ * drm_get_transfer_function - return a string for transfer function
+ * @tf: transfer function to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_transfer_function_name(enum drm_transfer_function tf)
+{
+	if (WARN_ON(tf >= ARRAY_SIZE(tf_name)))
+		return "unknown";
+
+	return tf_name[tf];
+}
 /**
  * drm_plane_create_color_properties - color encoding related plane properties
  * @plane: plane object
  * @supported_encodings: bitfield indicating supported color encodings
  * @supported_ranges: bitfileld indicating supported color ranges
+ * @supported_tfs: bitfield indicating supported transfer functions
  * @default_encoding: default color encoding
  * @default_range: default color range
+ * @default_tf: default color transfer function
  *
- * Create and attach plane specific COLOR_ENCODING and COLOR_RANGE
- * properties to @plane. The supported encodings and ranges should
- * be provided in supported_encodings and supported_ranges bitmasks.
+ * Create and attach plane specific COLOR_ENCODING, COLOR_RANGE and TRANSFER_FUNCTION
+ * properties to @plane. The supported encodings, ranges  and tfs should
+ * be provided in supported_encodings, supported_ranges and supported_tfs bitmasks.
  * Each bit set in the bitmask indicates that its number as enum
  * value is supported.
  */
 int drm_plane_create_color_properties(struct drm_plane *plane,
 				      u32 supported_encodings,
 				      u32 supported_ranges,
+				      u32 supported_tfs,
 				      enum drm_color_encoding default_encoding,
-				      enum drm_color_range default_range)
+				      enum drm_color_range default_range,
+				      enum drm_transfer_function default_tf)
 {
 	struct drm_device *dev = plane->dev;
 	struct drm_property *prop;
 	struct drm_prop_enum_list enum_list[max_t(int, DRM_COLOR_ENCODING_MAX,
-						       DRM_COLOR_RANGE_MAX)];
+						       max_t(int, DRM_COLOR_RANGE_MAX,
+							     DRM_TF_MAX))];
 	int i, len;
 
 	if (WARN_ON(supported_encodings == 0 ||
@@ -542,6 +571,11 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
 		    (supported_ranges & BIT(default_range)) == 0))
 		return -EINVAL;
 
+	if (WARN_ON(supported_tfs == 0 ||
+		    (supported_tfs & -BIT(DRM_TF_MAX)) != 0 ||
+		    (supported_tfs & BIT(default_tf)) == 0))
+		return -EINVAL;
+
 	len = 0;
 	for (i = 0; i < DRM_COLOR_ENCODING_MAX; i++) {
 		if ((supported_encodings & BIT(i)) == 0)
@@ -580,6 +614,26 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
 	if (plane->state)
 		plane->state->color_range = default_range;
 
+
+	len = 0;
+	for (i = 0; i < DRM_TF_MAX; i++) {
+		if ((supported_tfs & BIT(i)) == 0)
+			continue;
+
+		enum_list[len].type = i;
+		enum_list[len].name = tf_name[i];
+		len++;
+	}
+
+	prop = drm_property_create_enum(dev, 0, "TRANSFER_FUNCTION",
+					enum_list, len);
+	if (!prop)
+		return -ENOMEM;
+	plane->transfer_function_property = prop;
+	drm_object_attach_property(&plane->base, prop, default_tf);
+	if (plane->state)
+		plane->state->transfer_function = default_tf;
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_color_properties);
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 4ae9a7455b23..b3f7aca3795b 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -1850,8 +1850,10 @@ intel_sprite_plane_create(struct drm_i915_private *dev_priv,
 					  BIT(DRM_COLOR_YCBCR_BT709),
 					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+					  BIT(DRM_TF_UNDEFINED),
 					  DRM_COLOR_YCBCR_BT709,
-					  DRM_COLOR_YCBCR_LIMITED_RANGE);
+					  DRM_COLOR_YCBCR_LIMITED_RANGE,
+					  DRM_TF_UNDEFINED);
 
 	zpos = sprite + 1;
 	drm_plane_create_zpos_immutable_property(&plane->base, zpos);
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 92a4fd508e92..df596431151d 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2160,8 +2160,10 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 					  supported_csc,
 					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+					  BIT(DRM_TF_UNDEFINED),
 					  DRM_COLOR_YCBCR_BT709,
-					  DRM_COLOR_YCBCR_LIMITED_RANGE);
+					  DRM_COLOR_YCBCR_LIMITED_RANGE,
+					  DRM_TF_UNDEFINED);
 
 	drm_plane_create_alpha_property(&plane->base);
 	drm_plane_create_blend_mode_property(&plane->base,
diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
index 37e63e98cd08..64e1793212b4 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
@@ -345,8 +345,10 @@ nv10_overlay_init(struct drm_device *device)
 					  BIT(DRM_COLOR_YCBCR_BT601) |
 					  BIT(DRM_COLOR_YCBCR_BT709),
 					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
+					  BIT(DRM_TF_UNDEFINED),
 					  DRM_COLOR_YCBCR_BT601,
-					  DRM_COLOR_YCBCR_LIMITED_RANGE);
+					  DRM_COLOR_YCBCR_LIMITED_RANGE,
+					  DRM_TF_UNDEFINED);
 
 	plane->set_params = nv10_set_params;
 	nv10_set_params(plane);
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index 801da917507d..ca7559824dcd 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -325,8 +325,10 @@ struct drm_plane *omap_plane_init(struct drm_device *dev,
 						  BIT(DRM_COLOR_YCBCR_BT709),
 						  BIT(DRM_COLOR_YCBCR_FULL_RANGE) |
 						  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
+						  BIT(DRM_TF_UNDEFINED),
 						  DRM_COLOR_YCBCR_BT601,
-						  DRM_COLOR_YCBCR_FULL_RANGE);
+						  DRM_COLOR_YCBCR_FULL_RANGE,
+						  DRM_TF_UNDEFINED);
 
 	return plane;
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 1c86c2dd0bbf..eda8f51bafd7 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -600,8 +600,10 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	ret = drm_plane_create_color_properties(&layer->plane,
 						supported_encodings,
 						supported_ranges,
+						BIT(DRM_TF_UNDEFINED),
 						DRM_COLOR_YCBCR_BT709,
-						DRM_COLOR_YCBCR_LIMITED_RANGE);
+						DRM_COLOR_YCBCR_LIMITED_RANGE,
+						DRM_TF_UNDEFINED);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't add encoding and range properties!\n");
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index 1acd15aa4193..a1336ecd5fd5 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -186,8 +186,10 @@ struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
 			       BIT(DRM_COLOR_YCBCR_BT709));
 	u32 color_ranges = (BIT(DRM_COLOR_YCBCR_FULL_RANGE) |
 			    BIT(DRM_COLOR_YCBCR_LIMITED_RANGE));
+	u32 transfer_functions = BIT(DRM_TF_UNDEFINED;
 	u32 default_encoding = DRM_COLOR_YCBCR_BT601;
 	u32 default_range = DRM_COLOR_YCBCR_FULL_RANGE;
+	u32 default_tf = DRM_TF_UNDEFINED;;
 	u32 blend_modes = (BIT(DRM_MODE_BLEND_PREMULTI) |
 			   BIT(DRM_MODE_BLEND_COVERAGE));
 	int ret;
@@ -217,8 +219,10 @@ struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
 	ret = drm_plane_create_color_properties(&tplane->plane,
 						color_encodings,
 						color_ranges,
+						transfer_functions,
 						default_encoding,
-						default_range);
+						default_range,
+						default_tf);
 	if (ret)
 		goto err;
 
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 81c298488b0c..370bbc55b744 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -87,11 +87,27 @@ enum drm_color_range {
 	DRM_COLOR_RANGE_MAX,
 };
 
+/**
+ * enum drm_transfer_function - common transfer function used for sdr/hdr formats
+ *
+ * DRM_TF_UNDEFINED - The legacy case where a TF in and out of the blending
+ *                    space is undefined
+ * DRM_TF_SRGB - Based on gamma curve and is used for printer/monitors/web
+ * DRM_TF_PQ2084 - Used for HDR and allows for up to 10,000 nit support.
+*/
+enum drm_transfer_function {
+	DRM_TF_UNDEFINED,
+	DRM_TF_SRGB,
+	DRM_TF_PQ2084,
+	DRM_TF_MAX,
+};
 int drm_plane_create_color_properties(struct drm_plane *plane,
 				      u32 supported_encodings,
 				      u32 supported_ranges,
+				      u32 supported_tf,
 				      enum drm_color_encoding default_encoding,
-				      enum drm_color_range default_range);
+				      enum drm_color_range default_range,
+				      enum drm_transfer_function default_tf);
 
 /**
  * enum drm_color_lut_tests - hw-specific LUT tests to perform
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 1294610e84f4..cff56994513f 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -179,6 +179,14 @@ struct drm_plane_state {
 	 */
 	enum drm_color_range color_range;
 
+	/**
+	 * @transfer_function:
+	 *
+	 * Transfer function for HDR color/luminance mapping. This will allow the
+	 * driver to know what transfer function should be used to for the current
+	 * format for a proper HDR color/luminance output.
+	 */
+	enum drm_transfer_function transfer_function;
 	/**
 	 * @fb_damage_clips:
 	 *
@@ -741,6 +749,14 @@ struct drm_plane {
 	 * See drm_plane_create_color_properties().
 	 */
 	struct drm_property *color_range_property;
+	/**
+	 * @transfer_function_property:
+	 *
+	 * Optional "TRANSFER_FUNCTION" enum property for specifying
+	 * color transfer function for non RGB formats, mostly used for HDR.
+	 * See drm_plane_create_color_properties().
+	 */
+	struct drm_property *transfer_function_property;
 
 	/**
 	 * @scaling_filter_property: property to apply a particular filter while
-- 
2.32.0

