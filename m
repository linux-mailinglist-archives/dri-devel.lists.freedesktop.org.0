Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8AE36B834
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 19:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FB76E869;
	Mon, 26 Apr 2021 17:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770050.outbound.protection.outlook.com [40.107.77.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992776E862;
 Mon, 26 Apr 2021 17:39:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RI71Kwgt/z4hwvSymOY1AAIgX0pBkcoIHsjxIzvySLNpziTUic5XVmclUeL4zKVx/XopesvuUDyL0AGjAfzD8DabF25SG4PD4HakwhQzt2v5TMeffUx6wo/XIwSCSftfR87lXKJ4oLfWSRNG1fH+EDWCyhtXmUBzsMRLLht+Z/sssn0cPfOgz3qbTJ3+zEu+yPcLT82smbXHANYETJSLNJfn9IpGTTkQ3zGsJGzSt2t2AyBCJCIcmAkjPJygZfhEhjs35zAxah6ftLPa3Vt+USDGyIlDpcuHUw7GLUsGbhG49bzWvqNmvTNyQqkzlgyp0sWt7Baxe7D8zoR/UZxr/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXTuO0AWbZ6knhh+WJeJ1F2Z4rHLdNZDvyztog7Twew=;
 b=nYlPdrLP3D9P/Y77C/HD0mZaqH27NFnlSCjZfsglN4v+PJT/Dk/BgCT1buOaXFs7TSf97JW6C5QP1s4OgKpnIPV2n+d5mSmHx0OX1mvzMepzwQ3I/MvlKNN2ObyzksC2Z9tIsiJdbAmiduVqKNwjLwusRjlbke5Cq7EIQfrcQMW2hxfE04ma5lFnBD8KyMP54R6Y+cO+ZCIaI8PlD7YiCu5coDECOBP/DGdGCAgc++TFi7Rjr+aRVx6nxvIsY4vn21siS5h7W34aQUb5fZPRoRtVamGZKLeAuTpQ4cUP3/rUsQBqI0Yy57yn7K7rrSKxa3l18urnbI9kUVCdB9xu0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXTuO0AWbZ6knhh+WJeJ1F2Z4rHLdNZDvyztog7Twew=;
 b=uEmJMhPzQ9BBtqP61InrlDINfFitd3HpyLi4JIAuCJOZRIJ6OpZwAAyIGDDN9M6J1dUsMOgmBDL2UWe4uf8PkF4L/sJ/qdLd7X0m0CMUqfiXnPftxL5x6KJD25T9OKpaI2xfTN0ncXZbfZ1Z+HVE+Qv7KBq+GOGFGRS32tH6zjg=
Received: from MW4PR04CA0091.namprd04.prod.outlook.com (2603:10b6:303:83::6)
 by BN6PR1201MB0065.namprd12.prod.outlook.com (2603:10b6:405:4e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Mon, 26 Apr
 2021 17:39:01 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::79) by MW4PR04CA0091.outlook.office365.com
 (2603:10b6:303:83::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22 via Frontend
 Transport; Mon, 26 Apr 2021 17:39:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4065.21 via Frontend Transport; Mon, 26 Apr 2021 17:39:01 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Apr
 2021 12:39:00 -0500
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 26 Apr 2021 12:38:59 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ppaalanen@gmail.com>, <sebastian@sebastianwick.net>, <mcasas@google.com>
Subject: [RFC PATCH 2/3] drm/color: Add Color transfer functions for HDR/SDR
Date: Mon, 26 Apr 2021 13:38:51 -0400
Message-ID: <20210426173852.484368-3-harry.wentland@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210426173852.484368-1-harry.wentland@amd.com>
References: <20210426173852.484368-1-harry.wentland@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5260b9ee-22bf-4632-fab5-08d908da2db3
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0065:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB006517024264A7D5EC2217478C429@BN6PR1201MB0065.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /2eZyvx4ZJ4fihvP9urRT+MlT2en4kqk2AwM0sLp/17R3mkiujIWPnYNpjNXWsmd+sO6YoZdRFAH5QxbErUCNGScjCPMZziFF6W6hEI57HdNkDxdm16swCkyxa+T61BY6tzyqF4EAOuhZvW3gyckz5EjUisNfpP+IELIBkt2vk9gJwN+JwWowa/zx46DUi12UT5RXS/8Q8yiEERHdpSYZLUliNmtcUpkPOBF1r4XZYY5xMRn9t26NP7di0UNfYuzKFZEm8tccMI15oFCGxpgkz6ucyS52eQ/4/IaujDhNABraYH5YHU0ST9hyuTJ7RKSvF83UGP4lmfhM+w81Br2Oobjk61KLkmOR3UO7La/hUXSTVCtTH95mmrm9o+K0ip6b/+GlDC9tJ4mXq80jEoRXwE2pf2i2zT3UsoICVBfBNZOTi25I3qhsedkiXmj0IxI70cEn+W1D7cqdBqniGaFDhZZltAv2HfjpYdkvqo7aASHhkJe6PsUZS45aV5b2qcZQaSDpdQOjQ5G7AqP8QD0+kEpr9xQMFsPtpf7cNZL/zzMJYfO84hqiDXc4EE9lNa8SPWXVWAsNXsbSfCl+Yl2PIcKnFKZUveJMlNQoufovY+9pTrHhWTojAALhR+tcM1QwtlV0mR4p1hDL3EnW0u5XpK7UsDxVbusIWzKxZqoWybtxLDsuQhXJAZqrip/clyw
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(36840700001)(46966006)(86362001)(30864003)(110136005)(70206006)(70586007)(54906003)(5660300002)(426003)(7696005)(336012)(2616005)(4326008)(8936002)(8676002)(82310400003)(6666004)(2906002)(36756003)(356005)(82740400003)(81166007)(26005)(186003)(316002)(44832011)(36860700001)(1076003)(478600001)(83380400001)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 17:39:01.0699 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5260b9ee-22bf-4632-fab5-08d908da2db3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0065
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

This Patch adds common color transfer functions for SDR/HDR. These can
be used to communicate with the driver regarding the transformation to
use for a given plane.

enums added:
	DRM_COLOR_TF_SRGB
		roughly 2.4 gamma with initial linear section
	DRM_COLOR_TF_BT709
		Similar to Gamma 2.2-2.8
	DRM_COLOR_TF_PQ2084
		most common tf used for HDR video (HDR10/Dolby). Can support up
		to 10,000 nits

The usage is similar to color_encoding and color_range where the driver
can specify the default and supported tfs and pass it into
drm_plane_create_color_properties().

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +-
 .../gpu/drm/arm/display/komeda/komeda_plane.c |  4 +-
 drivers/gpu/drm/arm/malidp_planes.c           |  4 +-
 drivers/gpu/drm/armada/armada_overlay.c       |  4 +-
 drivers/gpu/drm/drm_atomic_uapi.c             |  4 ++
 drivers/gpu/drm/drm_color_mgmt.c              | 63 +++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_sprite.c   |  4 +-
 .../drm/i915/display/skl_universal_plane.c    |  4 +-
 drivers/gpu/drm/nouveau/dispnv04/overlay.c    |  4 +-
 drivers/gpu/drm/omapdrm/omap_plane.c          |  4 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  4 +-
 drivers/gpu/drm/tidss/tidss_plane.c           |  6 +-
 include/drm/drm_color_mgmt.h                  | 15 ++++-
 include/drm/drm_plane.h                       | 16 +++++
 14 files changed, 124 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6985362c367d..28481540327f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7127,7 +7127,9 @@ static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 			BIT(DRM_COLOR_YCBCR_BT2020),
 			BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 			BIT(DRM_COLOR_YCBCR_FULL_RANGE),
-			DRM_COLOR_YCBCR_BT709, DRM_COLOR_YCBCR_LIMITED_RANGE);
+			BIT(DRM_COLOR_TF_SRGB),
+			DRM_COLOR_YCBCR_BT709, DRM_COLOR_YCBCR_LIMITED_RANGE,
+			DRM_COLOR_TF_SRGB);
 	}
 
 	supported_rotations =
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
index 2d5066ea270c..eb8ccf805408 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
@@ -299,8 +299,10 @@ static int komeda_plane_add(struct komeda_kms_dev *kms,
 			BIT(DRM_COLOR_YCBCR_BT2020),
 			BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 			BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+			BIT(DRM_COLOR_TF_SRGB),
 			DRM_COLOR_YCBCR_BT601,
-			DRM_COLOR_YCBCR_LIMITED_RANGE);
+			DRM_COLOR_YCBCR_LIMITED_RANGE,
+			DRM_COLOR_TF_SRGB);
 	if (err)
 		goto cleanup;
 
diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 351a85088d0e..0d77a2c0c829 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -1020,7 +1020,9 @@ int malidp_de_planes_init(struct drm_device *drm)
 					BIT(DRM_COLOR_YCBCR_BT2020),
 					BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) | \
 					BIT(DRM_COLOR_YCBCR_FULL_RANGE),
-					enc, range);
+					BIT(DRM_COLOR_SRGB),
+					enc, range,
+					DRM_COLOR_SRGB);
 			if (!ret)
 				/* program the HW registers */
 				malidp_de_set_color_encoding(plane, enc, range);
diff --git a/drivers/gpu/drm/armada/armada_overlay.c b/drivers/gpu/drm/armada/armada_overlay.c
index 6346b890279a..ad3a743242f0 100644
--- a/drivers/gpu/drm/armada/armada_overlay.c
+++ b/drivers/gpu/drm/armada/armada_overlay.c
@@ -589,8 +589,10 @@ int armada_overlay_plane_create(struct drm_device *dev, unsigned long crtcs)
 						BIT(DRM_COLOR_YCBCR_BT601) |
 						BIT(DRM_COLOR_YCBCR_BT709),
 						BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
+						BIT(DRM_COLOR_TF_SRGB),
 						DEFAULT_ENCODING,
-						DRM_COLOR_YCBCR_LIMITED_RANGE);
+						DRM_COLOR_YCBCR_LIMITED_RANGE,
+						DRM_COLOR_TF_SRGB);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 268bb69c2e2f..ea95c1224253 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -595,6 +595,8 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		state->color_encoding = val;
 	} else if (property == plane->color_range_property) {
 		state->color_range = val;
+	} else if (property == plane->color_tf_property) {
+		state->color_tf = val;
 	} else if (property == config->prop_fb_damage_clips) {
 		ret = drm_atomic_replace_property_blob_from_id(dev,
 					&state->fb_damage_clips,
@@ -661,6 +663,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = state->color_encoding;
 	} else if (property == plane->color_range_property) {
 		*val = state->color_range;
+	} else if (property == plane->color_tf_property) {
+		*val = state->color_tf;
 	} else if (property == config->prop_fb_damage_clips) {
 		*val = (state->fb_damage_clips) ?
 			state->fb_damage_clips->base.id : 0;
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index a183ebae2941..2404b07046c5 100644
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
@@ -480,6 +485,10 @@ static const char * const color_range_name[] = {
 	[DRM_COLOR_YCBCR_LIMITED_RANGE] = "YCbCr limited range",
 };
 
+static const char * const color_tf_name[] = {
+	[DRM_COLOR_TF_SRGB] = "sRGB",
+	[DRM_COLOR_TF_PQ2084] = "PQ2084",
+};
 /**
  * drm_get_color_encoding_name - return a string for color encoding
  * @encoding: color encoding to compute name of
@@ -510,30 +519,49 @@ const char *drm_get_color_range_name(enum drm_color_range range)
 	return color_range_name[range];
 }
 
+/**
+ * drm_get_color_transfer_function - return a string for color transfer function
+ * @tf: transfer function to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_color_transfer_function_name(enum drm_color_transfer_function tf)
+{
+	if (WARN_ON(tf >= ARRAY_SIZE(color_tf_name)))
+		return "unknown";
+
+	return color_tf_name[tf];
+}
 /**
  * drm_plane_create_color_properties - color encoding related plane properties
  * @plane: plane object
  * @supported_encodings: bitfield indicating supported color encodings
  * @supported_ranges: bitfileld indicating supported color ranges
+ * @supported_tfs: bitfileld indicating supported color transfer functions
  * @default_encoding: default color encoding
  * @default_range: default color range
+ * @default_tf: default color transfer function
  *
- * Create and attach plane specific COLOR_ENCODING and COLOR_RANGE
- * properties to @plane. The supported encodings and ranges should
- * be provided in supported_encodings and supported_ranges bitmasks.
+ * Create and attach plane specific COLOR_ENCODING, COLOR_RANGE and COLOR_TRANSFER_FUNCTION
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
+				      enum drm_color_transfer_function default_tf)
 {
 	struct drm_device *dev = plane->dev;
 	struct drm_property *prop;
 	struct drm_prop_enum_list enum_list[max_t(int, DRM_COLOR_ENCODING_MAX,
-						       DRM_COLOR_RANGE_MAX)];
+						       max_t(int, DRM_COLOR_RANGE_MAX,
+							     DRM_COLOR_TF_MAX))];
 	int i, len;
 
 	if (WARN_ON(supported_encodings == 0 ||
@@ -546,6 +574,11 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
 		    (supported_ranges & BIT(default_range)) == 0))
 		return -EINVAL;
 
+	if (WARN_ON(supported_tfs == 0 ||
+		    (supported_tfs & -BIT(DRM_COLOR_TF_MAX)) != 0 ||
+		    (supported_tfs & BIT(default_tf)) == 0))
+		return -EINVAL;
+
 	len = 0;
 	for (i = 0; i < DRM_COLOR_ENCODING_MAX; i++) {
 		if ((supported_encodings & BIT(i)) == 0)
@@ -584,6 +617,26 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
 	if (plane->state)
 		plane->state->color_range = default_range;
 
+
+	len = 0;
+	for (i = 0; i < DRM_COLOR_TF_MAX; i++) {
+		if ((supported_tfs & BIT(i)) == 0)
+			continue;
+
+		enum_list[len].type = i;
+		enum_list[len].name = color_tf_name[i];
+		len++;
+	}
+
+	prop = drm_property_create_enum(dev, 0, "COLOR_TRANSFER_FUNCTION",
+					enum_list, len);
+	if (!prop)
+		return -ENOMEM;
+	plane->color_tf_property = prop;
+	drm_object_attach_property(&plane->base, prop, default_tf);
+	if (plane->state)
+		plane->state->color_tf = default_tf;
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_color_properties);
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 4cbdb8fd4bb1..2208c3d82246 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -1881,8 +1881,10 @@ intel_sprite_plane_create(struct drm_i915_private *dev_priv,
 					  BIT(DRM_COLOR_YCBCR_BT709),
 					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+					  BIT(DRM_COLOR_TF_SRGB),
 					  DRM_COLOR_YCBCR_BT709,
-					  DRM_COLOR_YCBCR_LIMITED_RANGE);
+					  DRM_COLOR_YCBCR_LIMITED_RANGE,
+					  DRM_COLOR_TF_SRGB);
 
 	zpos = sprite + 1;
 	drm_plane_create_zpos_immutable_property(&plane->base, zpos);
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 1f335cb09149..c2d64ef9ae3b 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2091,8 +2091,10 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 					  supported_csc,
 					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+					  BIT(DRM_COLOR_TF_SRGB),
 					  DRM_COLOR_YCBCR_BT709,
-					  DRM_COLOR_YCBCR_LIMITED_RANGE);
+					  DRM_COLOR_YCBCR_LIMITED_RANGE,
+					  DRM_COLOR_TF_SRGB);
 
 	drm_plane_create_alpha_property(&plane->base);
 	drm_plane_create_blend_mode_property(&plane->base,
diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
index 37e63e98cd08..fe40e24469d1 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
@@ -345,8 +345,10 @@ nv10_overlay_init(struct drm_device *device)
 					  BIT(DRM_COLOR_YCBCR_BT601) |
 					  BIT(DRM_COLOR_YCBCR_BT709),
 					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
+					  BIT(DRM_COLOR_TF_SRGB),
 					  DRM_COLOR_YCBCR_BT601,
-					  DRM_COLOR_YCBCR_LIMITED_RANGE);
+					  DRM_COLOR_YCBCR_LIMITED_RANGE,
+					  DRM_COLOR_TF_SRGB);
 
 	plane->set_params = nv10_set_params;
 	nv10_set_params(plane);
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index 51dc24acea73..0929e1c39653 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -319,8 +319,10 @@ struct drm_plane *omap_plane_init(struct drm_device *dev,
 						  BIT(DRM_COLOR_YCBCR_BT709),
 						  BIT(DRM_COLOR_YCBCR_FULL_RANGE) |
 						  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
+						  BIT(DRM_COLOR_TF_SRGB),
 						  DRM_COLOR_YCBCR_BT601,
-						  DRM_COLOR_YCBCR_FULL_RANGE);
+						  DRM_COLOR_YCBCR_FULL_RANGE,
+						  DRM_COLOR_TF_SRGB);
 
 	return plane;
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 8abb59e2f0c0..d15267db2274 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -584,8 +584,10 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	ret = drm_plane_create_color_properties(&layer->plane,
 						supported_encodings,
 						supported_ranges,
+						BIT(DRM_COLOR_TF_SRGB),
 						DRM_COLOR_YCBCR_BT709,
-						DRM_COLOR_YCBCR_LIMITED_RANGE);
+						DRM_COLOR_YCBCR_LIMITED_RANGE,
+						DRM_COLOR_TF_SRGB);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't add encoding and range properties!\n");
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index 35067ae674ea..e50857cfd212 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -179,8 +179,10 @@ struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
 			       BIT(DRM_COLOR_YCBCR_BT709));
 	u32 color_ranges = (BIT(DRM_COLOR_YCBCR_FULL_RANGE) |
 			    BIT(DRM_COLOR_YCBCR_LIMITED_RANGE));
+	u32 color_tfs = BIT(DRM_COLOR_TF_SRGB;
 	u32 default_encoding = DRM_COLOR_YCBCR_BT601;
 	u32 default_range = DRM_COLOR_YCBCR_FULL_RANGE;
+	u32 default_tf = DRM_COLOR_TF_SRGB;;
 	u32 blend_modes = (BIT(DRM_MODE_BLEND_PREMULTI) |
 			   BIT(DRM_MODE_BLEND_COVERAGE));
 	int ret;
@@ -210,8 +212,10 @@ struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
 	ret = drm_plane_create_color_properties(&tplane->plane,
 						color_encodings,
 						color_ranges,
+						color_tfs,
 						default_encoding,
-						default_range);
+						default_range,
+						default_tf);
 	if (ret)
 		goto err;
 
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 3043dd73480c..f59806366855 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -91,11 +91,24 @@ enum drm_color_range {
 	DRM_COLOR_RANGE_MAX,
 };
 
+/**
+ * enum drm_color_transfer_function - common transfer function used for sdr/hdr formats
+ *
+ * DRM_COLOR_TF_SRGB - Based on gamma curve and is used for printer/monitors/web
+ * DRM_COLOR_TF_PQ2084 - Used for HDR and allows for up to 10,000 nit support.
+*/
+enum drm_color_transfer_function {
+	DRM_COLOR_TF_SRGB,
+	DRM_COLOR_TF_PQ2084,
+	DRM_COLOR_TF_MAX,
+};
 int drm_plane_create_color_properties(struct drm_plane *plane,
 				      u32 supported_encodings,
 				      u32 supported_ranges,
+				      u32 supported_tf,
 				      enum drm_color_encoding default_encoding,
-				      enum drm_color_range default_range);
+				      enum drm_color_range default_range,
+				      enum drm_color_transfer_function default_tf);
 
 /**
  * enum drm_color_lut_tests - hw-specific LUT tests to perform
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 95ab14a4336a..c85c59501a7a 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -179,6 +179,14 @@ struct drm_plane_state {
 	 */
 	enum drm_color_range color_range;
 
+	/**
+	 * @color_transfer_function:
+	 *
+	 * Transfer function for HDR color/luminance mapping. This will allow the
+	 * driver to know what transfer function should be used to for the current
+	 * format for a proper HDR color/luminance output.
+	 */
+	enum drm_color_transfer_function color_tf;
 	/**
 	 * @fb_damage_clips:
 	 *
@@ -741,6 +749,14 @@ struct drm_plane {
 	 * See drm_plane_create_color_properties().
 	 */
 	struct drm_property *color_range_property;
+	/**
+	 * @color_tf_property:
+	 *
+	 * Optional "COLOR_TRANSFER_FUNCTION" enum property for specifying
+	 * color transfer function for non RGB formats, mostly used for HDR.
+	 * See drm_plane_create_color_properties().
+	 */
+	struct drm_property *color_tf_property;
 
 	/**
 	 * @scaling_filter_property: property to apply a particular filter while
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
