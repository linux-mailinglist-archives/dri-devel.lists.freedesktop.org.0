Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5E245483B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 15:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E919E6E415;
	Wed, 17 Nov 2021 14:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7306E3EC
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:09:11 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 99D885C0172;
 Wed, 17 Nov 2021 09:09:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 17 Nov 2021 09:09:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=QUBzORKW5uhW8
 xviuIs0BLqSWj1POkhQLQ+yTael9uk=; b=XJJxteYEGKUdKiHw3E1mLCoimO0r+
 d6Z1jtaWaQzsm/ATH3vCNgZMN8aF2ScHrQZULXLEB9yLa1+tbLgNzWQDFuCllo7j
 9eAxFPHQiz0hXJzFLcz5r8TVIyb4IENX1wMJCKJXUuzrMB+G4laKmG9qkrPnLhNK
 FAPX4q4hUtN1i8WGkBtmYDzsAVAtEglLxxEeRvCptNVK4XXYAdAYYoOuiycVPtnW
 3fbMovklmmBRODC6gyjdRn102zWc9nQrGLBiwvo2rFPktgE3G5ry7K4DhvJ6drVM
 D+SoeV5Hv6VKK0vUCiL5OfsF9iERBk8+hGyblSXJ6l/dwSQanE2LXtc9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=QUBzORKW5uhW8xviuIs0BLqSWj1POkhQLQ+yTael9uk=; b=aVEXcGHR
 Ou+CCw4C7BM98zEU7YgjEX4QtWxVtwKdMNnZQLkraDjo2CIXetPhHLLry/XyqTyz
 0WdrdtPHI3ApxKv7Bpkx4AoJUnpmF6SYiqGxry1q99+tuD/ZW+cLu1g6P7SsCGdF
 EmBktsV2rJheCes/g21L1AejW7BExnqKLpGpJK8+FpXA4Ub3m15bMWW9a07yexeT
 27mVPcbezYHMyL3e56yGhcz1BDUTkR1YjN0CsT2yE4KSGwrFJnb+aLVOiS/gpdVa
 cMoksJpQdna8leyYSJ77s6Uu0CrlJimL06r/x3KSvFZTbvit3ps89mfhjUmZW9zp
 HWqytQaOzpPQsw==
X-ME-Sender: <xms:Bg2VYRdN2Ca2KxnT-VMMh0TrPkVlg4iWgy9TpXYb1ad0XZdCFh2Ntg>
 <xme:Bg2VYfOYhSo_QocH0adOhw2c-OYskcOM7QhO4hy1YgE-mEqc1iyw4ylzUlxelnsaU
 vLluP4SC4KrvBaEv6w>
X-ME-Received: <xmr:Bg2VYajJsNMsL-xKFcu1kfMGif9TRErVl6NzBFHEpXENyO4ALb4PYQ7p04AZNlQF8DOnc7OxCB05S8ftIwmLIS4F3BO8f2IOU_ZbACVs_tI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeggdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Bg2VYa84NtOTRVWUSGWYswPp5GiLsBE0fJ0OXcL7pDWmYZLFlUIsHw>
 <xmx:Bg2VYdsgm-Sy2ieM749PmbVS6QozIhjPayM7Hnt8yY4EeIAAoe8ZPg>
 <xmx:Bg2VYZFbXGpUFftf-u7nVE44AiTgool4Ct-cZ9KsnspUPYtwcER9Jw>
 <xmx:Bg2VYTBsRblnJx6G0T8_Hn2SCcUR_UOFbJ2DWlAK5Icq3PbrbrCGOw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 09:09:09 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 2/3] drm/vc4: plane: Add support for DRM_FORMAT_P030
Date: Wed, 17 Nov 2021 15:08:59 +0100
Message-Id: <20211117140900.313181-3-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_plane.c | 98 ++++++++++++++++++++++++---------
 1 file changed, 71 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index ac761c683663..41823248a024 100644
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
@@ -764,45 +771,67 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 		uint32_t param = fourcc_mod_broadcom_param(fb->modifier);
 		u32 tile_w, tile, x_off, pix_per_tile;
 
-		hvs_format = HVS_PIXEL_FORMAT_H264;
+		if (fb->format->format == DRM_FORMAT_P030) {
+			/*
+			 * Spec says: bits [31:4] of the given address should point to
+			 * the 128-bit word containing the desired starting pixel,
+			 * and bits[3:0] should be between 0 and 11, indicating which
+			 * of the 12-pixels in that 128-bit word is the first pixel to be used
+			 */
+	                u32 remaining_pixels = vc4_state->src_x % 96;
+			u32 aligned = remaining_pixels / 12;
+			u32 last_bits = remaining_pixels % 12;
 
-		switch (base_format_mod) {
-		case DRM_FORMAT_MOD_BROADCOM_SAND64:
-			tiling = SCALER_CTL0_TILING_64B;
-			tile_w = 64;
-			break;
-		case DRM_FORMAT_MOD_BROADCOM_SAND128:
+			x_off = aligned * 16 + last_bits;
+			hvs_format = HVS_PIXEL_FORMAT_YCBCR_10BIT;
 			tiling = SCALER_CTL0_TILING_128B;
 			tile_w = 128;
-			break;
-		case DRM_FORMAT_MOD_BROADCOM_SAND256:
-			tiling = SCALER_CTL0_TILING_256B_OR_T;
-			tile_w = 256;
-			break;
-		default:
-			break;
-		}
+			pix_per_tile = 96;
+		} else {
+			hvs_format = HVS_PIXEL_FORMAT_H264;
 
+			switch (base_format_mod) {
+			case DRM_FORMAT_MOD_BROADCOM_SAND64:
+				tiling = SCALER_CTL0_TILING_64B;
+				tile_w = 64;
+				break;
+			case DRM_FORMAT_MOD_BROADCOM_SAND128:
+				tiling = SCALER_CTL0_TILING_128B;
+				tile_w = 128;
+				break;
+			case DRM_FORMAT_MOD_BROADCOM_SAND256:
+				tiling = SCALER_CTL0_TILING_256B_OR_T;
+				tile_w = 256;
+				break;
+			default:
+				break;
+			}
+			pix_per_tile = tile_w / fb->format->cpp[0];
+			x_off = (vc4_state->src_x % pix_per_tile) /
+				(i ? h_subsample : 1) * fb->format->cpp[i];
+		}
 		if (param > SCALER_TILE_HEIGHT_MASK) {
-			DRM_DEBUG_KMS("SAND height too large (%d)\n", param);
+			DRM_DEBUG_KMS("SAND height too large (%d)\n",
+				      param);
 			return -EINVAL;
 		}
-
-		pix_per_tile = tile_w / fb->format->cpp[0];
 		tile = vc4_state->src_x / pix_per_tile;
-		x_off = vc4_state->src_x % pix_per_tile;
-
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
@@ -955,7 +984,8 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 
 	/* Pitch word 1/2 */
 	for (i = 1; i < num_planes; i++) {
-		if (hvs_format != HVS_PIXEL_FORMAT_H264) {
+		if (hvs_format != HVS_PIXEL_FORMAT_H264 &&
+		    hvs_format != HVS_PIXEL_FORMAT_YCBCR_10BIT) {
 			vc4_dlist_write(vc4_state,
 					VC4_SET_FIELD(fb->pitches[i],
 						      SCALER_SRC_PITCH));
@@ -1315,6 +1345,13 @@ static bool vc4_format_mod_supported(struct drm_plane *plane,
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
@@ -1347,8 +1384,11 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
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
@@ -1363,13 +1403,17 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
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

