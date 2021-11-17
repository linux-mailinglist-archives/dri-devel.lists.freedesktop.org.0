Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD67F45483A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 15:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F6B6E3EC;
	Wed, 17 Nov 2021 14:09:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E461C6E3EC
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:09:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1440D580882;
 Wed, 17 Nov 2021 09:09:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 17 Nov 2021 09:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=jhq30Qx9nA7O1
 Q6mgp6jUmPaffbpK2Uj7ozmF4XBLKM=; b=GsRzSGmZVnEoiMfA6KR0slsTCNhsq
 vvDWld/DRCSfIqQl0xUS4jhFBSh6h8BcVngbmvWMgSPODnNi+xQznsBxA4LAShHX
 m4eIR1vEMORp2ZyNJPfd7eVMKb6C1QyPxLSOxzDRkw1sNq8lMlGEwSL/71dgLPB0
 /uzzAmi9mkW5ns370wvrqfY+00xUcqKFVgsF9/O8YSwpk6k1ronuZmqfd4pvnpFT
 RhVOCOBPC7t1DSVTyBb58TnTFKjvwkx2wy3cdZgkJYaEGjRR64Yem9eoN9cmWWib
 vqt71cO8Rh1D9jLc0CIzgOO//p86HQ+mUTTd1okPQ7+TNeWjEvCdhvqNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=jhq30Qx9nA7O1Q6mgp6jUmPaffbpK2Uj7ozmF4XBLKM=; b=am2DMPF3
 Pf7BzUaKW/N0okH3mmCUMxtwgq3ziYrw67K429cvCbnmTsUKnNUc/ewHw+NoOE6b
 V49aeVAA/QVz4WqV2lS/UEH+Q/j37ccacK6i6U9DeM+EuSuRB9B027KIqcGQ3XkE
 f5LF6Qml3qRPpsSiPZpnU+n1yL2aKP0K08OrvL4WCeF/jiYKP99Uuu5CEgQDSF5Z
 stv7XA9rOX7tMB5sa5YNfKZm/KP7dMpDrNRPri9aV602wOi2xmwKxYVFY9n9DLCA
 0qtj3jjyH4KaTChhn7597pQ5VoC4ylXKIYS9BCc7h1R4GniD3vbteQnhMOVklzJW
 9d4WewpplbuGfA==
X-ME-Sender: <xms:CA2VYWMT22Ms3864p2Ir_ELzK1JIVR4h_fzGT-Zo99UMozt0m79CZg>
 <xme:CA2VYU9P7Fgwhj5yirxi4chLfb-CjF9RpfMhm85WUObLHXpdJfRvB4x7k3qyYpxEk
 LMyzDxcbfrLRaSkUAc>
X-ME-Received: <xmr:CA2VYdQWE8I4CLgDxvmIYQpZuEvd_aJ-2xoYI4rHWVfgCqiTp8lss3jH7BDu-BKYfbd5Y-0AAxLfDnvadt_T3ezH19pEAI2Wc5pDSOg0AXs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeggdehiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:CA2VYWuc9vBZ5UJYSHCB5Tbeomgr-ay6ki0etmOu8aaMhLMYvtwAXQ>
 <xmx:CA2VYed_cGKzYLHTRM2yzJGCrDSlieiR-b2N1t52Qtd_rvdJ63PJ2Q>
 <xmx:CA2VYa2bqrgNeNs7gMgzGziO4xmwohuZuLcAzDqgB1CnijNgkAb_uA>
 <xmx:CQ2VYe6tZznY3oAbnmjlLvuKzzbsxMAPaHRAnoUxHxKNqMf_XK9UVQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 09:09:12 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 3/3] drm/vc4: plane: Add support for YUV color encodings and
 ranges
Date: Wed, 17 Nov 2021 15:09:00 +0100
Message-Id: <20211117140900.313181-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211117140900.313181-1-maxime@cerno.tech>
References: <20211117140900.313181-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.org>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

The BT601/BT709 color encoding and limited vs full
range properties were not being exposed, defaulting
always to BT601 limited range.

Expose the parameters and set the registers appropriately.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 71 +++++++++++++++++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_regs.h  | 19 ++++++---
 2 files changed, 82 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 41823248a024..4fac03b36fea 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -623,6 +623,51 @@ static int vc4_plane_allocate_lbm(struct drm_plane_state *state)
 	return 0;
 }
 
+/*
+ * The colorspace conversion matrices are held in 3 entries in the dlist.
+ * Create an array of them, with entries for each full and limited mode, and
+ * each supported colorspace.
+ */
+static const u32 colorspace_coeffs[2][DRM_COLOR_ENCODING_MAX][3] = {
+	{
+		/* Limited range */
+		{
+			/* BT601 */
+			SCALER_CSC0_ITR_R_601_5,
+			SCALER_CSC1_ITR_R_601_5,
+			SCALER_CSC2_ITR_R_601_5,
+		}, {
+			/* BT709 */
+			SCALER_CSC0_ITR_R_709_3,
+			SCALER_CSC1_ITR_R_709_3,
+			SCALER_CSC2_ITR_R_709_3,
+		}, {
+			/* BT2020 */
+			SCALER_CSC0_ITR_R_2020,
+			SCALER_CSC1_ITR_R_2020,
+			SCALER_CSC2_ITR_R_2020,
+		}
+	}, {
+		/* Full range */
+		{
+			/* JFIF */
+			SCALER_CSC0_JPEG_JFIF,
+			SCALER_CSC1_JPEG_JFIF,
+			SCALER_CSC2_JPEG_JFIF,
+		}, {
+			/* BT709 */
+			SCALER_CSC0_ITR_R_709_3_FR,
+			SCALER_CSC1_ITR_R_709_3_FR,
+			SCALER_CSC2_ITR_R_709_3_FR,
+		}, {
+			/* BT2020 */
+			SCALER_CSC0_ITR_R_2020_FR,
+			SCALER_CSC1_ITR_R_2020_FR,
+			SCALER_CSC2_ITR_R_2020_FR,
+		}
+	}
+};
+
 /* Writes out a full display list for an active plane to the plane's
  * private dlist state.
  */
@@ -996,9 +1041,20 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 
 	/* Colorspace conversion words */
 	if (vc4_state->is_yuv) {
-		vc4_dlist_write(vc4_state, SCALER_CSC0_ITR_R_601_5);
-		vc4_dlist_write(vc4_state, SCALER_CSC1_ITR_R_601_5);
-		vc4_dlist_write(vc4_state, SCALER_CSC2_ITR_R_601_5);
+		enum drm_color_encoding color_encoding = state->color_encoding;
+		enum drm_color_range color_range = state->color_range;
+		const u32 *ccm;
+
+		if (color_encoding >= DRM_COLOR_ENCODING_MAX)
+			color_encoding = DRM_COLOR_YCBCR_BT601;
+		if (color_range >= DRM_COLOR_RANGE_MAX)
+			color_range = DRM_COLOR_YCBCR_LIMITED_RANGE;
+
+		ccm = colorspace_coeffs[color_range][color_encoding];
+
+		vc4_dlist_write(vc4_state, ccm[0]);
+		vc4_dlist_write(vc4_state, ccm[1]);
+		vc4_dlist_write(vc4_state, ccm[2]);
 	}
 
 	vc4_state->lbm_offset = 0;
@@ -1427,6 +1483,15 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 					   DRM_MODE_REFLECT_X |
 					   DRM_MODE_REFLECT_Y);
 
+	drm_plane_create_color_properties(plane,
+					  BIT(DRM_COLOR_YCBCR_BT601) |
+					  BIT(DRM_COLOR_YCBCR_BT709) |
+					  BIT(DRM_COLOR_YCBCR_BT2020),
+					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+					  DRM_COLOR_YCBCR_BT709,
+					  DRM_COLOR_YCBCR_LIMITED_RANGE);
+
 	return plane;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 489f921ef44d..7538b84a6dca 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -975,7 +975,10 @@ enum hvs_pixel_format {
 #define SCALER_CSC0_COEF_CR_OFS_SHIFT		0
 #define SCALER_CSC0_ITR_R_601_5			0x00f00000
 #define SCALER_CSC0_ITR_R_709_3			0x00f00000
+#define SCALER_CSC0_ITR_R_2020			0x00f00000
 #define SCALER_CSC0_JPEG_JFIF			0x00000000
+#define SCALER_CSC0_ITR_R_709_3_FR		0x00000000
+#define SCALER_CSC0_ITR_R_2020_FR		0x00000000
 
 /* S2.8 contribution of Cb to Green */
 #define SCALER_CSC1_COEF_CB_GRN_MASK		VC4_MASK(31, 22)
@@ -990,8 +993,11 @@ enum hvs_pixel_format {
 #define SCALER_CSC1_COEF_CR_BLU_MASK		VC4_MASK(1, 0)
 #define SCALER_CSC1_COEF_CR_BLU_SHIFT		0
 #define SCALER_CSC1_ITR_R_601_5			0xe73304a8
-#define SCALER_CSC1_ITR_R_709_3			0xf2b784a8
-#define SCALER_CSC1_JPEG_JFIF			0xea34a400
+#define SCALER_CSC1_ITR_R_709_3			0xf27784a8
+#define SCALER_CSC1_ITR_R_2020			0xf43594a8
+#define SCALER_CSC1_JPEG_JFIF			0xea349400
+#define SCALER_CSC1_ITR_R_709_3_FR		0xf4388400
+#define SCALER_CSC1_ITR_R_2020_FR		0xf5b6d400
 
 /* S2.8 contribution of Cb to Red */
 #define SCALER_CSC2_COEF_CB_RED_MASK		VC4_MASK(29, 20)
@@ -1002,9 +1008,12 @@ enum hvs_pixel_format {
 /* S2.8 contribution of Cb to Blue */
 #define SCALER_CSC2_COEF_CB_BLU_MASK		VC4_MASK(19, 10)
 #define SCALER_CSC2_COEF_CB_BLU_SHIFT		10
-#define SCALER_CSC2_ITR_R_601_5			0x00066204
-#define SCALER_CSC2_ITR_R_709_3			0x00072a1c
-#define SCALER_CSC2_JPEG_JFIF			0x000599c5
+#define SCALER_CSC2_ITR_R_601_5			0x00066604
+#define SCALER_CSC2_ITR_R_709_3			0x00072e1d
+#define SCALER_CSC2_ITR_R_2020			0x0006b624
+#define SCALER_CSC2_JPEG_JFIF			0x00059dc6
+#define SCALER_CSC2_ITR_R_709_3_FR		0x00064ddb
+#define SCALER_CSC2_ITR_R_2020_FR		0x0005e5e2
 
 #define SCALER_TPZ0_VERT_RECALC			BIT(31)
 #define SCALER_TPZ0_SCALE_MASK			VC4_MASK(28, 8)
-- 
2.33.1

