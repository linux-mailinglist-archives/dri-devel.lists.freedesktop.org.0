Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E6C473281
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 17:56:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091A310E7F0;
	Mon, 13 Dec 2021 16:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32FC610E7F0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 16:56:41 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 863DE5C008D;
 Mon, 13 Dec 2021 11:56:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 13 Dec 2021 11:56:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=mX67aZZUfeMyw
 1KzTgTD6Fuux2UJ8/4oQHjsbv3CjeQ=; b=b63T5gLb9aqG7zqpsYhwNQoDl2OsQ
 7+iL6AGHit3ETFw/rbuR27OzE3P1W6cDle/UBCyFdsSwsXm6yLZm5aZBaysu3ItJ
 SE/c1JL11KCE871n9yIIAE14w4xHVe4xvQdzaBLuFyJzCXr60XFmotR4Ax0c0pDm
 CXuCMfFuA5JvUFc7QpqZ4GtZKDcwmoE03BlS5Zuf+Y8N/vNoc5zaBcR3Pe671p11
 tSfEUkGNrytMA9pICEXB+IZyNFV4e5NMsTrClMcDZmfdS3/OWPSjtBL898PCSoPm
 tCpSpDN3gmzRPOlBFm6/TV4Sh/FOpvuSAQpUM6wMGjbRd7CUO+YrihdSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=mX67aZZUfeMyw1KzTgTD6Fuux2UJ8/4oQHjsbv3CjeQ=; b=e3SqmfIk
 cuKjTLF02DjhV6jmjLikLnEEItTonyAH1JZZAWefNvg1Zcr5omLRtWK7QECCAquq
 qa1kCUmtjSQygdfrvFHXvxhWaYQzzgkbTQlUDDyrEJfIicGRbsiAdwq83scE2Oym
 f7RdbLYalVBnG6KVGYVMynuLSB9jWmn83zHBVPDvGqYcWCnP2hvZEuMkxRH3N3hu
 xAnamoidtC1UcKZ1bvmn15dLy04QjXkog2yqlapo1LWw/xi5wCjyq0BbE3J2lllC
 YPL6JH2YjFg5vzFSn3iwxHjJnmPEnUb/63+aVB4iikMONrHlFpdQq/CkMcSSQQLj
 NaDTvMGkuS1F5w==
X-ME-Sender: <xms:SHu3YU_sHGTKzr65RF8D3T0-neO9lgv1ck3wI9orugsXlw2sauu0Yw>
 <xme:SHu3YcuzaT85H3KptF-8jaOpaE15koThVlOSYCykCRT5JTkp1c91obR007ZMmy2EZ
 UsujHDjtgUlfwVQlp4>
X-ME-Received: <xmr:SHu3YaBHDrjKjNW22zs9sOGMtPx7hs_GH0pJAbazlupmuF-MXWiVZ5B9QZvDHqvTCeFaLA_QreUmlJsczGojXRepjaTZBBeNJ6i6U8ME>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:SHu3YUer0T6MBK00hCAH_IZZaoBaRJLw6WKF_EMKAcTsQRMrBZ6COw>
 <xmx:SHu3YZN739I8r-F4pJka-aYFYYlBBV1AUMyloq7Y6aNWf84p-Svh7w>
 <xmx:SHu3YelLmHhuIsGU3Iz03I2yfSFAW74K-AU1Y2kfihAVYcIMwmGpqw>
 <xmx:SHu3YShYXoTXyyT6DYnHw7gmMJ1Z37oUSBYVOalYaZw65nk_OV74hw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Dec 2021 11:56:40 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 3/3] drm/vc4: plane: Add support for YUV color encodings
 and ranges
Date: Mon, 13 Dec 2021 17:56:32 +0100
Message-Id: <20211213165632.255283-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211213165632.255283-1-maxime@cerno.tech>
References: <20211213165632.255283-1-maxime@cerno.tech>
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
index 18627b240a55..1155b0beb620 100644
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
@@ -1018,9 +1063,20 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 
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
@@ -1449,6 +1505,15 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
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

