Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2E538129C
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 23:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D1D6F46B;
	Fri, 14 May 2021 21:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540006E442;
 Fri, 14 May 2021 21:07:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fxibc6q4RffJaexxnnsunz6Qq94G/+/hyvzkzhzLxVfPoKRdyeqbaQB5UxZmxg7ow+aaSU/O2nJngFpgNMrCkCJ5IehxnC3odX/RolK1kmaqFMX4Bx+66mzlzMPV08PsHxpyzBN5FbaU8Uoz6KfadGOFcZgX0XR5rdh2DK0kxAAd08ndg/uqZgavW4w10qULBgsNnSe0jPXUSNCUAPl167g7/ec2iPPTz3/tCJ8ZtsG3Qj9kUA3Rhb5a+DdP5MupZdfpFIC4+MPh2kU4Gw2z1SYMVW75qQ4NIZNOkX6SxTFQn9oBAHLfM9k9ibL5mqpRKqWbs7f8lgMO9D1oIesdeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nM99r8d3jlRTN9S5z71W4to6kAZIpIX1zDTaG68z3Co=;
 b=K+Ly92kc7Kcbgg/PpIJC0jZB+NssTNzf2pXOwq2gQVzrvKca3HMdSdFpfLG1kWjzIWFtS+yRSeu7Uucbn3+A+71V//fu4sf0VNxUVXr9qmS/eP+rMaevGR3HREX1vxAPAeNDXKGrFYNNo/3JzduL3mF+x0Q5JY4Myc102APZqLQu/Imuke00ECmH6WpZCW54HkgQQP2BLlv/Yd3YKmwStsSkh0Wr9lIK16VoFSFem+fyTWBKD8om0WMfCAniLhcoYblX5H4eweg50r7nnBJxKDIiiP5gKR+P3XgJEY66Uyx8UbbpJ/MiRWrV3kAbIC2Z8BU7CagDDfyzkHmSBRAodg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nM99r8d3jlRTN9S5z71W4to6kAZIpIX1zDTaG68z3Co=;
 b=JQrGPyzHBhkscWy6j9P7CjfshwnZ7toQxrzTxb9py0ttwU2l0FRLifj7U+I+gxKW316MkLjvFeG2XPapDNNEyijbh2LOyS4d+adohhmD2GLFkgzrg80j172CtTgVRwK8sK/gvJ7SRSGi6AQijfAN3uvEIH+uy7KS6gsrP1vX7OM=
Received: from BN9PR03CA0727.namprd03.prod.outlook.com (2603:10b6:408:110::12)
 by DM6PR12MB3900.namprd12.prod.outlook.com (2603:10b6:5:1c9::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 14 May
 2021 21:07:33 +0000
Received: from BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:110:cafe::56) by BN9PR03CA0727.outlook.office365.com
 (2603:10b6:408:110::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Fri, 14 May 2021 21:07:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT027.mail.protection.outlook.com (10.13.177.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.25 via Frontend Transport; Fri, 14 May 2021 21:07:33 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 14 May
 2021 16:07:32 -0500
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 14 May 2021 16:07:31 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ppaalanen@gmail.com>, <sebastian@sebastianwick.net>, <mcasas@google.com>
Subject: [RFC PATCH v2 2/6] drm/color: Add transfer functions for HDR/SDR on
 drm_plane
Date: Fri, 14 May 2021 17:07:16 -0400
Message-ID: <20210514210720.157892-3-harry.wentland@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210514210720.157892-1-harry.wentland@amd.com>
References: <20210514210720.157892-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f903fcb-c3ef-4ccf-9f7d-08d9171c4ade
X-MS-TrafficTypeDiagnostic: DM6PR12MB3900:
X-Microsoft-Antispam-PRVS: <DM6PR12MB39009D6D498136B4FFF8580C8C509@DM6PR12MB3900.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nidl2xtvg9WGRTH3ZEJ/xHwKyNZryoS52+PIznmtyOQ/9lwZ2/VKOg9AqaKTXUHa76fouLzy6id/o1ti0ohM0z04rBSDyaXKbSQwQf8DtlR1AG+HtrN9iLn7soxLRZvXywFkA/0foD34e6yE7bduZx3otmJLbSKKX0wkvh/XutcX3r3zuImbGeJJQA2T2Fr+V9xkmoHeCL0nlt445xvPq66a4LRSn3ahubmO81mDc2tOKNKD12l6ZAs34T3AlKBtNfCJl60TRJC2RzxquO+gys56dhrlxYidpqPwYMO1i4s478g6x0/p3NenHkwxmRnHY+oUEZWexeaOgSG18NZ21g8YDnEZID69o387l3JT4j4vxm8WMfog0JoJ3Z2S7p3QOwEwbRsdx2a5AT0bPW6yUx5IaVXJ3jo18ljkda/H2greoPaeeimRLLk45dUJ4Du2rBRIZpUk4hpSeXOjF9/X6DIV3sugrhyDXbUNiNLZh1poxFcH3+bmgMp0iRAU8+OG2+6rdAFfH81Oge5ZJhhrzPudSXOBf9FkjynwT4FBhHmY2KGesK+K3R8QuZxX2wYOtqYcVw0BHoYgBZcvBOI86GDyAQ0m+wrBaTuBlZKYPUop41KGqCFc9PH0iN2dqQCfcsvLNRVM0yw2AjWo7NagGa4PZWh8pkYTYXDPMZD0q9emJbAhFkte9KFBw4MMaV6Q
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966006)(36840700001)(36756003)(5660300002)(1076003)(4326008)(7696005)(47076005)(478600001)(82310400003)(82740400003)(30864003)(81166007)(356005)(86362001)(110136005)(54906003)(36860700001)(336012)(83380400001)(6666004)(186003)(426003)(70206006)(26005)(316002)(70586007)(8676002)(44832011)(2906002)(8936002)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 21:07:33.1813 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f903fcb-c3ef-4ccf-9f7d-08d9171c4ade
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3900
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, Shashank.Sharma@amd.com,
 Shirish.S@amd.com, hersenxs.wu@amd.com, Vitaly.Prosyak@amd.com,
 laurentiu.palcu@oss.nxp.com, Bhawanpreet.Lakha@amd.com,
 Nicholas.Kazlauskas@amd.com
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
index 389eff96fcf6..041576945a0d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7072,7 +7072,9 @@ static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
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
index ddbba67f0283..8be0d40db2e5 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -1025,7 +1025,9 @@ int malidp_de_planes_init(struct drm_device *drm)
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
index 268bb69c2e2f..42f8fd577d36 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -595,6 +595,8 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		state->color_encoding = val;
 	} else if (property == plane->color_range_property) {
 		state->color_range = val;
+	} else if (property == plane->transfer_function_property) {
+		state->transfer_function = val;
 	} else if (property == config->prop_fb_damage_clips) {
 		ret = drm_atomic_replace_property_blob_from_id(dev,
 					&state->fb_damage_clips,
@@ -661,6 +663,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
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
index acbf4e63b245..85b7efc43a8b 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -1849,8 +1849,10 @@ intel_sprite_plane_create(struct drm_i915_private *dev_priv,
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
index 7ffd7b570b54..f1abf74cef48 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2044,8 +2044,10 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
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
index 46420780db59..e0dd7132b920 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -594,8 +594,10 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
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
2.31.1

