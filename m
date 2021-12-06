Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAED4694AC
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 12:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E8E7375A;
	Mon,  6 Dec 2021 11:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F413B7375B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 11:01:54 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 7261332009F3;
 Mon,  6 Dec 2021 06:01:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 06 Dec 2021 06:01:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=aHNuEHnSYj0GM
 tDycOt+mGduWjam5L7koIQv57blUbk=; b=bO8rpsVH8AArdECnxq0QHKthGnC5u
 kmW6CWCl+Q0mHb7TLKgJw505Gba4/arij1PHlCYGPuBl2UZvKl3jYQgEfFg1rk0J
 a8IsqRy8yR8TRhrDMtKyoE4rO9AATHJ7uyaCr8LI9XW33ESzWDZrnta225cNVnJL
 JuP1wE1lYwz/9pIPej1/7Jht+O/Yo7W08NJALjzoh8pJrYs+FJLF+x/2CxB/SNk4
 p3ulwZkUWFcRRggolIN8rb+gCoiF5K7rD8e0PrrmKfRwIOkzcDQXocWNoLG6W9L9
 rRBLJJd6b8Xr5YxJeCZJ+VlLBo9YTeSHtjZehz83ZIJQ6lq0skqhM04kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=aHNuEHnSYj0GMtDycOt+mGduWjam5L7koIQv57blUbk=; b=A+nKwGQI
 HI8Xny71dfcbe5T9ITfv1TmGix/W5f8lzLGwH4eYgJ8Y/e52i6/HWtzQsVjM042J
 MJ28hWqVBFKxeAap7WHk+H8nocfQg+1JFIQipoDSEy2LaNrFwZwU0vlzdtdIXhHg
 v90YdfTAEM3hcvChypY2KGk6cgV3gS/lB5tWaZpTXSMsrMbVxViFYzJURMduR62U
 EGIRWQrCVkcdbAXL0ZZEEsbT88v1bAbrv3q2QZ+WfxIWO8WG0+TfWuXmny6IpY20
 08qNRb1dr9nQ1ugtaQlqPuT/u2q4dp9XrIibhKmzgTaRNgyseNoykZV9zGAw1LLo
 o+v2YDADZsE9Dw==
X-ME-Sender: <xms:oO2tYS9TV__8AiZ3XhKYxgUNWaXCinu8RxIfeQ1XOlwvP4x7vU542Q>
 <xme:oO2tYSvBNOYmx3M-O12c-t8-ygo6TyqSWLkoRoXcJnn4zwH3pS1d1pspSFtU27xR9
 OnPh_SFiKPlR3vqwtM>
X-ME-Received: <xmr:oO2tYYA5B78UZpjyMaWzja2PYyZx-AJYPrQyalVytcQyQTsbK2NoOkqIq0tV4kAbUJY7T7d7nku9Kd9YbvFsdRRymCHQpojRJ_zDAyPfTmBynw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrjeefgddvvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oO2tYafnnxoK1f5vVa1qWLKB6VCW0HEJ2BPFXo1wlEl6oGFnULLPpA>
 <xmx:oO2tYXNwbZwEJYaFGMCo8p4fHPRMUfWy8Hj3O0UUrUglHdNic-JdiQ>
 <xmx:oO2tYUnPitIm_xGACZKfkcQiafUk97HblnxWOHzOAFv4Mn5dmmzUrw>
 <xmx:oO2tYQiC99RmFK1769hjLzBgsYXcv4qVfNFiyFSY3dxFNtp9RXSmqg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Dec 2021 06:01:51 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 2/3] drm/vc4: plane: Add support for DRM_FORMAT_P030
Date: Mon,  6 Dec 2021 12:01:39 +0100
Message-Id: <20211206110140.119650-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211206110140.119650-1-maxime@cerno.tech>
References: <20211206110140.119650-1-maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
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

