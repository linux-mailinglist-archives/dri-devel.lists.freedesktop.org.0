Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FB7473280
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 17:56:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9B810E7E2;
	Mon, 13 Dec 2021 16:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F80410E79F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 16:56:39 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id DF3035C0190;
 Mon, 13 Dec 2021 11:56:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 13 Dec 2021 11:56:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=aHNuEHnSYj0GM
 tDycOt+mGduWjam5L7koIQv57blUbk=; b=QGDEbPJBtHKq1Lu5gPow33jM36zMx
 B+puqgbsmp2mpk3gJZZ+uvTt4sPWGAV8U/FK9j1WQSarioFgXZfePqCej2sbAXev
 DNx7VVmPdmGelXnBLDHZeZDIO2geZdcvFCuyESKPXxR8foI48rbvCPOzHqqIRfuF
 a31zNkVCey712N7zsCrv1gl8jZBRGV1Y6nbLx0/ey8Gk4gr3e1jrYRF1YaKcpqmP
 9c3Dr8yOZZhXrkJXlDTFcBVjD7Xdmx1ZxhW8AAAKC0J6ltxI9wX2+nH4QyacKGxO
 sRzkkG55iLnrOAjwM8BPSyTGvs7YQmWq+TQrvx9el35xGL7SIAN49YkKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=aHNuEHnSYj0GMtDycOt+mGduWjam5L7koIQv57blUbk=; b=cMrA/azo
 z7XmSrGdVjqbQJD2lni6kBZo5cY3KIrBuybYJMBK3cBfE/Z6xoa2h4zUxlVW39O6
 a8Uh/wZoewbzOanydlrReOvkWPYH0OM/rnwHuToXDHhqrlugMyED6H9i8GEW3m4e
 BuFogcmCA/sMmV4IVHzTShMm68MdKuGxIXq6e/Tq6t3p/4GylQb2D1s05u32SEdK
 zI0TO3dkrBvxzupmSfPUp5qb3FELi3ppimM7nnyUDl6C/poE+eG/ViToO/mDpNFy
 SzX5NOza6ZrzRzfgezNILbkugiVEYgFVM1T8yH9rB/kH4b7T8kQSK+Ql+cwv1Hzr
 wljjKuItcmTamA==
X-ME-Sender: <xms:Rnu3YaPJ6A3nfAZ099nVllkLH2i3ptZNmBUwz2MIzgqLIvypaoJMRQ>
 <xme:Rnu3YY9ogJUjepcFAgg598GXq_A529_5pleSQnbA5pRhJqw3XekRw88M3kMbv-6sE
 uibsttU9ZSy1V5c1tE>
X-ME-Received: <xmr:Rnu3YRRX0WJBWSc6r2dpkft0QwkXQic5WiyXI3V2P2YAedkCWd7PMZoQBALq1MpZzvqqQ9GH0vXHx871Hshc-cQ5yv_ZIZx_klSlwLFP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Rnu3Yat3sQoqcSc5R3rrQbqOdAza7YorlfAFvWhSD5Z-yMc2QeH_9w>
 <xmx:Rnu3YSda-9bY8c_uT01w-311a1tqMzom2jrogpRYxkpkDhI2JW0j-w>
 <xmx:Rnu3Ye0I38pqCIWlWvd1t7W-HqGfzOTAVOR-3JSreHE8rZ3X_a2frg>
 <xmx:Rnu3YZwslObvxyaL1teWu_UA3JkDUlREcfxdES2XbXyNvDASUUqZAg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Dec 2021 11:56:38 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 2/3] drm/vc4: plane: Add support for DRM_FORMAT_P030
Date: Mon, 13 Dec 2021 17:56:31 +0100
Message-Id: <20211213165632.255283-3-maxime@cerno.tech>
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

The P030 format, used with the DRM_FORMAT_MOD_BROADCOM_SAND128 modifier,
is a format output by the video decoder on the BCM2711.

Add native support to the KMS planes for that format.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 128 ++++++++++++++++++++++++--------
 1 file changed, 97 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index ac761c683663..18627b240a55 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -33,6 +33,7 @@ static const struct hvs_format {
 	u32 hvs; /* HVS_FORMAT_* */
 	u32 pixel_order;
 	u32 pixel_order_hvs5;
+	bool hvs5_only;
 } hvs_formats[] = {
 	{
 		.drm = DRM_FORMAT_XRGB8888,
@@ -128,6 +129,12 @@ static const struct hvs_format {
 		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV422_2PLANE,
 		.pixel_order = HVS_PIXEL_ORDER_XYCRCB,
 	},
+	{
+		.drm = DRM_FORMAT_P030,
+		.hvs = HVS_PIXEL_FORMAT_YCBCR_10BIT,
+		.pixel_order = HVS_PIXEL_ORDER_XYCBCR,
+		.hvs5_only = true,
+	},
 };
 
 static const struct hvs_format *vc4_get_hvs_format(u32 drm_format)
@@ -762,47 +769,91 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 	case DRM_FORMAT_MOD_BROADCOM_SAND128:
 	case DRM_FORMAT_MOD_BROADCOM_SAND256: {
 		uint32_t param = fourcc_mod_broadcom_param(fb->modifier);
-		u32 tile_w, tile, x_off, pix_per_tile;
-
-		hvs_format = HVS_PIXEL_FORMAT_H264;
-
-		switch (base_format_mod) {
-		case DRM_FORMAT_MOD_BROADCOM_SAND64:
-			tiling = SCALER_CTL0_TILING_64B;
-			tile_w = 64;
-			break;
-		case DRM_FORMAT_MOD_BROADCOM_SAND128:
-			tiling = SCALER_CTL0_TILING_128B;
-			tile_w = 128;
-			break;
-		case DRM_FORMAT_MOD_BROADCOM_SAND256:
-			tiling = SCALER_CTL0_TILING_256B_OR_T;
-			tile_w = 256;
-			break;
-		default:
-			break;
-		}
 
 		if (param > SCALER_TILE_HEIGHT_MASK) {
-			DRM_DEBUG_KMS("SAND height too large (%d)\n", param);
+			DRM_DEBUG_KMS("SAND height too large (%d)\n",
+				      param);
 			return -EINVAL;
 		}
 
-		pix_per_tile = tile_w / fb->format->cpp[0];
-		tile = vc4_state->src_x / pix_per_tile;
-		x_off = vc4_state->src_x % pix_per_tile;
+		if (fb->format->format == DRM_FORMAT_P030) {
+			hvs_format = HVS_PIXEL_FORMAT_YCBCR_10BIT;
+			tiling = SCALER_CTL0_TILING_128B;
+		} else {
+			hvs_format = HVS_PIXEL_FORMAT_H264;
+
+			switch (base_format_mod) {
+			case DRM_FORMAT_MOD_BROADCOM_SAND64:
+				tiling = SCALER_CTL0_TILING_64B;
+				break;
+			case DRM_FORMAT_MOD_BROADCOM_SAND128:
+				tiling = SCALER_CTL0_TILING_128B;
+				break;
+			case DRM_FORMAT_MOD_BROADCOM_SAND256:
+				tiling = SCALER_CTL0_TILING_256B_OR_T;
+				break;
+			default:
+				return -EINVAL;
+				break;
+			}
+		}
 
 		/* Adjust the base pointer to the first pixel to be scanned
 		 * out.
+		 *
+		 * For P030, y_ptr [31:4] is the 128bit word for the start pixel
+		 * y_ptr [3:0] is the pixel (0-11) contained within that 128bit
+		 * word that should be taken as the first pixel.
+		 * Ditto uv_ptr [31:4] vs [3:0], however [3:0] contains the
+		 * element within the 128bit word, eg for pixel 3 the value
+		 * should be 6.
 		 */
 		for (i = 0; i < num_planes; i++) {
+			u32 tile_w, tile, x_off, pix_per_tile;
+
+			if (fb->format->format == DRM_FORMAT_P030) {
+				/*
+				 * Spec says: bits [31:4] of the given address
+				 * should point to the 128-bit word containing
+				 * the desired starting pixel, and bits[3:0]
+				 * should be between 0 and 11, indicating which
+				 * of the 12-pixels in that 128-bit word is the
+				 * first pixel to be used
+				 */
+				u32 remaining_pixels = vc4_state->src_x % 96;
+				u32 aligned = remaining_pixels / 12;
+				u32 last_bits = remaining_pixels % 12;
+
+				x_off = aligned * 16 + last_bits;
+				tile_w = 128;
+				pix_per_tile = 96;
+			} else {
+				switch (base_format_mod) {
+				case DRM_FORMAT_MOD_BROADCOM_SAND64:
+					tile_w = 64;
+					break;
+				case DRM_FORMAT_MOD_BROADCOM_SAND128:
+					tile_w = 128;
+					break;
+				case DRM_FORMAT_MOD_BROADCOM_SAND256:
+					tile_w = 256;
+					break;
+				default:
+					break;
+				}
+				pix_per_tile = tile_w / fb->format->cpp[0];
+				x_off = (vc4_state->src_x % pix_per_tile) /
+					(i ? h_subsample : 1) *
+					fb->format->cpp[i];
+			}
+
+			tile = vc4_state->src_x / pix_per_tile;
+
 			vc4_state->offsets[i] += param * tile_w * tile;
 			vc4_state->offsets[i] += src_y /
 						 (i ? v_subsample : 1) *
 						 tile_w;
-			vc4_state->offsets[i] += x_off /
-						 (i ? h_subsample : 1) *
-						 fb->format->cpp[i];
+			vc4_state->offsets[i] += x_off & ~(i ? 1 : 0);
 		}
 
 		pitch0 = VC4_SET_FIELD(param, SCALER_TILE_HEIGHT);
@@ -955,7 +1006,8 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 
 	/* Pitch word 1/2 */
 	for (i = 1; i < num_planes; i++) {
-		if (hvs_format != HVS_PIXEL_FORMAT_H264) {
+		if (hvs_format != HVS_PIXEL_FORMAT_H264 &&
+		    hvs_format != HVS_PIXEL_FORMAT_YCBCR_10BIT) {
 			vc4_dlist_write(vc4_state,
 					VC4_SET_FIELD(fb->pitches[i],
 						      SCALER_SRC_PITCH));
@@ -1315,6 +1367,13 @@ static bool vc4_format_mod_supported(struct drm_plane *plane,
 		default:
 			return false;
 		}
+	case DRM_FORMAT_P030:
+		switch (fourcc_mod_broadcom_mod(modifier)) {
+		case DRM_FORMAT_MOD_BROADCOM_SAND128:
+			return true;
+		default:
+			return false;
+		}
 	case DRM_FORMAT_RGBX1010102:
 	case DRM_FORMAT_BGRX1010102:
 	case DRM_FORMAT_RGBA1010102:
@@ -1347,8 +1406,11 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 	struct drm_plane *plane = NULL;
 	struct vc4_plane *vc4_plane;
 	u32 formats[ARRAY_SIZE(hvs_formats)];
+	int num_formats = 0;
 	int ret = 0;
 	unsigned i;
+	bool hvs5 = of_device_is_compatible(dev->dev->of_node,
+					    "brcm,bcm2711-vc5");
 	static const uint64_t modifiers[] = {
 		DRM_FORMAT_MOD_BROADCOM_VC4_T_TILED,
 		DRM_FORMAT_MOD_BROADCOM_SAND128,
@@ -1363,13 +1425,17 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 	if (!vc4_plane)
 		return ERR_PTR(-ENOMEM);
 
-	for (i = 0; i < ARRAY_SIZE(hvs_formats); i++)
-		formats[i] = hvs_formats[i].drm;
+	for (i = 0; i < ARRAY_SIZE(hvs_formats); i++) {
+		if (!hvs_formats[i].hvs5_only || hvs5) {
+			formats[num_formats] = hvs_formats[i].drm;
+			num_formats++;
+		}
+	}
 
 	plane = &vc4_plane->base;
 	ret = drm_universal_plane_init(dev, plane, 0,
 				       &vc4_plane_funcs,
-				       formats, ARRAY_SIZE(formats),
+				       formats, num_formats,
 				       modifiers, type, NULL);
 	if (ret)
 		return ERR_PTR(ret);
-- 
2.33.1

