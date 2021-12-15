Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 553764754FC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 10:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF35310E266;
	Wed, 15 Dec 2021 09:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAA010E263
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 09:17:51 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B971F5C0107;
 Wed, 15 Dec 2021 04:17:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 15 Dec 2021 04:17:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=SWKkoJ3u7gNv2
 b6mk3yQuHxlVLhBuzsDbHL5T7+761M=; b=Hupe2UPWICPtg6F9fTycUTK4DzqH7
 5e08qXryT21vxtU2pc/rPYaHmwF/+zX1lKlr+c5vImWEJz36bBo8YeSXPGnjdlmN
 U3FMmED3BqGeUC+w+ODTyAfHtfQsffpWbPbncYSzNSir0pU9MNysJnXCOx7fNhLJ
 TAfuChfK5EbULfEjJdWIf28abd7RUvmW/X0ScOod7ZySswMHAiB/34opoUjol5xS
 Syfd2ZpNwxfNws9bFqYHH595IutD388s8ZryVCF5OWsYrNtshr/SABfhwq4Rog8g
 lf5HrhVFNTjvlWJKeFxF9HTXV7yk1jnQtVcwf3nfpl0yYujIgJWkWCt+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=SWKkoJ3u7gNv2b6mk3yQuHxlVLhBuzsDbHL5T7+761M=; b=brmx8iAU
 MIC8K8cpcNW3AF5F7H5DOo2Z4Iaifv9x67fB/R9zUuhAAtC/KXM64vFGfCJFSI7j
 hnQgmkSADvenLozaayhtjaxoKNXvBAxiSqu08/SLd3yjxlFfXdnCgKEUEdqDbxfS
 g9xL7m2sWUy9yM82cjYgkYRXkvOXX4x5RlxrnmJVKkX3Ais8s/XVPQupsJCvM0aN
 YYTohEBnvRJzgq+woa2AeeOMKtcz4LQ2rswxREBHnycl+CAldQ/DvahfOPCUuwti
 Gyogo5gnd1WNG2I/BO2nwCoMFmRQnPt58pipdRGqvRlr56R+H6JGJWyZ7gCh9hgi
 zbnvfWSLpqTrCw==
X-ME-Sender: <xms:vrK5YRmESXi2fvZndXPpdY7ipcN6Hrj-OVdC7FPS8iDTLHe9cUVKdA>
 <xme:vrK5Yc3Q_QC3HqFve5eTeNrKAzzlHXdvvMei2grPtZMvyrxVxO90FqWV2daQs4q_M
 cnedJrQGRYXTdw8yVw>
X-ME-Received: <xmr:vrK5YXptBrBWur0yuuezxqTLR8Kbh_6N7LYnC61GCVASmGZYX0slOyZkTPEDweFl9k4CUM46sbkd-MVX2GJkA9_658Kg9rXBk5621Jw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:vrK5YRmlc7Z6_BYpqO6Y8zji7FjD0GHd4PpuS8HIHA3S7N0cRfRBYQ>
 <xmx:vrK5Yf2F4bK7yRPTLrgUn_l7VW8F_NryfLZWMBHewbmdlsW4cUbB2w>
 <xmx:vrK5YQv3iTT5rATuV8YwehJKP2U4aFBAHYRPLDdBOFo8sDtQPgG3Nw>
 <xmx:vrK5YYKoc1FVvGoMfVcbDyO26zeinoaXhSjEUx5IkyxfAbHqELmvKw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 04:17:50 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 3/3] drm/vc4: plane: Add support for YUV color encodings
 and ranges
Date: Wed, 15 Dec 2021 10:17:39 +0100
Message-Id: <20211215091739.135042-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215091739.135042-1-maxime@cerno.tech>
References: <20211215091739.135042-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The BT601/BT709 color encoding and limited vs full
range properties were not being exposed, defaulting
always to BT601 limited range.

Expose the parameters and set the registers appropriately.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 71 +++++++++++++++++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_regs.h  | 19 ++++++---
 2 files changed, 82 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 022cd12f561e..920a9eefe426 100644
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
@@ -1017,9 +1062,20 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 
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
@@ -1448,6 +1504,15 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
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

