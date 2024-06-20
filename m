Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F0E910A5B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7E610EA74;
	Thu, 20 Jun 2024 15:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="kXLb0QWh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f99.google.com (mail-lf1-f99.google.com
 [209.85.167.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A7910EA72
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:46:40 +0000 (UTC)
Received: by mail-lf1-f99.google.com with SMTP id
 2adb3069b0e04-52bc29c79fdso1164463e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898398; x=1719503198;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PBz1EVjZX10UGoQO9utYRwzPCZrzadGDiBXAWlLvQ+o=;
 b=kXLb0QWh3zWcRM/RIokk9dSUTtG2pXXzZ0Lcb0ZR2CzBMgm9pb6oLUVJRKzaz1/IOT
 iEs/j7Y+XK6tU3TWjRQBpy5KKToPx5paWLhrEmzymvbjQbOq22BB0LuctLLpFA7Vh4Xm
 BQhDyQrqCMmcZcyeeNqnlsOpEDS7XEzbnV4fRGxgrTtbDLhd+dOdU6BBtHYtyY8TtDxd
 x+gSiK/6ituZUj1iQz7fqmaxoHhYSb7Qx6xuPqIEt6br3V0MdhmjQsyo1uLkMyntX9Bw
 PBvxFbi5K9tYF/E9HmMI3b4fayO+fjUNAMJweZptl6gdvV4G7C7Yn3as1s/SQVSLkMqB
 j/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898398; x=1719503198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PBz1EVjZX10UGoQO9utYRwzPCZrzadGDiBXAWlLvQ+o=;
 b=r9jOd+nIi11Vm4G98mcofRW6StwyXO/1qCzXBsDTufHWl4BHURDLgzNOff2ZH+z3WG
 hkvltqtpUCJdnPRwb0rP5aE7AknX00n/TGBBQRMt/px5A2K9zrFNpMyf79JTLRaVuq4y
 3l8TkEusaRglnKK86k+UL+4TTut0UrTYlvCMz7cIqWvUfo+aDVPSeuhRm0uzVXIKeZxT
 zDeyRzbw1R54EUZ50ewVH557wAbuk/FXX6htx846C3yDTPUDm7oiYRCPRexFNbF7kAmk
 J4XpV6kAYfytsHs2PAb6OHMMO+8hzwzTO1lzDSrIqa9VSBgJ3EBTsl1SNh8Ss09DG3Sx
 w4Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlfsN6Uh30HaypkPOE8Lryxnjwqs/pKXUFtPuHknGWsgJZjy9ugjFQ2u7YHEJayrhi7p0a0LpkrSDQyhz5NThXu3IE6M16mQf9noXVyFvC
X-Gm-Message-State: AOJu0YyaSENfLg0ccmIs0x9f/ECUVQcK2OxtYm5IY9EjsosCiT9vnzqq
 CIL6MV34KQZn5UYMKvcEArwBaUHRGavKb9tZZUUny/1VXhq2lXictaEVxQHtq3/MRDX5QMh5RJu
 QDz6AF9bLO4oI8YfcePMftSzuh6VtEdCg
X-Google-Smtp-Source: AGHT+IGlhafXvuRnajfXgmkYTzDCdjouU52ha/3TphMZakP1jecyiJfbqPto2pjSjSf+2HUJKV3AvygyEmDL
X-Received: by 2002:a19:3844:0:b0:52c:999b:5306 with SMTP id
 2adb3069b0e04-52ccaa32cfamr4562617e87.17.1718898398431; 
 Thu, 20 Jun 2024 08:46:38 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 2adb3069b0e04-52ca2888476sm222924e87.139.2024.06.20.08.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:46:38 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 01/31] drm/vc4: vc4_plane: Keep fractional source coords
 inside state
Date: Thu, 20 Jun 2024 16:46:02 +0100
Message-Id: <20240620154632.4125308-2-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dom Cobley <popcornmix@gmail.com>

Fractional source co-ordinates can be used to setup the scaling
filters, so retain the information.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h   |  2 +-
 drivers/gpu/drm/vc4/vc4_plane.c | 68 ++++++++++++++++-----------------
 2 files changed, 34 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 08e29fa82563..697e9b7c9d0e 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -404,7 +404,7 @@ struct vc4_plane_state {
 
 	/* Clipped coordinates of the plane on the display. */
 	int crtc_x, crtc_y, crtc_w, crtc_h;
-	/* Clipped area being scanned from in the FB. */
+	/* Clipped area being scanned from in the FB in u16.16 format */
 	u32 src_x, src_y;
 
 	u32 src_w[2], src_h[2];
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 07caf2a47c6c..e0df210bedcb 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -251,9 +251,9 @@ static const struct hvs_format *vc4_get_hvs_format(u32 drm_format)
 
 static enum vc4_scaling_mode vc4_get_scaling_mode(u32 src, u32 dst)
 {
-	if (dst == src)
+	if (dst == src >> 16)
 		return VC4_SCALING_NONE;
-	if (3 * dst >= 2 * src)
+	if (3 * dst >= 2 * (src >> 16))
 		return VC4_SCALING_PPF;
 	else
 		return VC4_SCALING_TPZ;
@@ -462,15 +462,10 @@ static int vc4_plane_setup_clipping_and_scaling(struct drm_plane_state *state)
 		vc4_state->offsets[i] = bo->dma_addr + fb->offsets[i];
 	}
 
-	/*
-	 * We don't support subpixel source positioning for scaling,
-	 * but fractional coordinates can be generated by clipping
-	 * so just round for now
-	 */
-	vc4_state->src_x = DIV_ROUND_CLOSEST(state->src.x1, 1 << 16);
-	vc4_state->src_y = DIV_ROUND_CLOSEST(state->src.y1, 1 << 16);
-	vc4_state->src_w[0] = DIV_ROUND_CLOSEST(state->src.x2, 1 << 16) - vc4_state->src_x;
-	vc4_state->src_h[0] = DIV_ROUND_CLOSEST(state->src.y2, 1 << 16) - vc4_state->src_y;
+	vc4_state->src_x = state->src.x1;
+	vc4_state->src_y = state->src.y1;
+	vc4_state->src_w[0] = state->src.x2 - vc4_state->src_x;
+	vc4_state->src_h[0] = state->src.y2 - vc4_state->src_y;
 
 	vc4_state->crtc_x = state->dst.x1;
 	vc4_state->crtc_y = state->dst.y1;
@@ -523,7 +518,7 @@ static void vc4_write_tpz(struct vc4_plane_state *vc4_state, u32 src, u32 dst)
 {
 	u32 scale, recip;
 
-	scale = (1 << 16) * src / dst;
+	scale = src / dst;
 
 	/* The specs note that while the reciprocal would be defined
 	 * as (1<<32)/scale, ~0 is close enough.
@@ -569,7 +564,7 @@ static u32 vc4_lbm_size(struct drm_plane_state *state)
 	if (vc4_state->x_scaling[0] == VC4_SCALING_TPZ)
 		pix_per_line = vc4_state->crtc_w;
 	else
-		pix_per_line = vc4_state->src_w[0];
+		pix_per_line = vc4_state->src_w[0] >> 16;
 
 	if (!vc4_state->is_yuv) {
 		if (vc4_state->y_scaling[0] == VC4_SCALING_TPZ)
@@ -660,7 +655,8 @@ static void vc4_plane_calc_load(struct drm_plane_state *state)
 	for (i = 0; i < fb->format->num_planes; i++) {
 		/* Even if the bandwidth/plane required for a single frame is
 		 *
-		 * vc4_state->src_w[i] * vc4_state->src_h[i] * cpp * vrefresh
+		 * (vc4_state->src_w[i] >> 16) * (vc4_state->src_h[i] >> 16) *
+		 *  cpp * vrefresh
 		 *
 		 * when downscaling, we have to read more pixels per line in
 		 * the time frame reserved for a single line, so the bandwidth
@@ -669,11 +665,11 @@ static void vc4_plane_calc_load(struct drm_plane_state *state)
 		 * load by this number. We're likely over-estimating the read
 		 * demand, but that's better than under-estimating it.
 		 */
-		vscale_factor = DIV_ROUND_UP(vc4_state->src_h[i],
+		vscale_factor = DIV_ROUND_UP(vc4_state->src_h[i] >> 16,
 					     vc4_state->crtc_h);
-		vc4_state->membus_load += vc4_state->src_w[i] *
-					  vc4_state->src_h[i] * vscale_factor *
-					  fb->format->cpp[i];
+		vc4_state->membus_load += (vc4_state->src_w[i] >> 16) *
+					  (vc4_state->src_h[i] >> 16) *
+					  vscale_factor * fb->format->cpp[i];
 		vc4_state->hvs_load += vc4_state->crtc_h * vc4_state->crtc_w;
 	}
 
@@ -826,7 +822,8 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 	bool mix_plane_alpha;
 	bool covers_screen;
 	u32 scl0, scl1, pitch0;
-	u32 tiling, src_y;
+	u32 tiling, src_x, src_y;
+	u32 width, height;
 	u32 hvs_format = format->hvs;
 	unsigned int rotation;
 	int ret, i;
@@ -838,6 +835,9 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	width = vc4_state->src_w[0] >> 16;
+	height = vc4_state->src_h[0] >> 16;
+
 	/* SCL1 is used for Cb/Cr scaling of planar formats.  For RGB
 	 * and 4:4:4, scl1 should be set to scl0 so both channels of
 	 * the scaler do the same thing.  For YUV, the Y plane needs
@@ -858,9 +858,11 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 					 DRM_MODE_REFLECT_Y);
 
 	/* We must point to the last line when Y reflection is enabled. */
-	src_y = vc4_state->src_y;
+	src_y = vc4_state->src_y >> 16;
 	if (rotation & DRM_MODE_REFLECT_Y)
-		src_y += vc4_state->src_h[0] - 1;
+		src_y += height - 1;
+
+	src_x = vc4_state->src_x >> 16;
 
 	switch (base_format_mod) {
 	case DRM_FORMAT_MOD_LINEAR:
@@ -875,7 +877,7 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 						 (i ? v_subsample : 1) *
 						 fb->pitches[i];
 
-			vc4_state->offsets[i] += vc4_state->src_x /
+			vc4_state->offsets[i] += src_x /
 						 (i ? h_subsample : 1) *
 						 fb->format->cpp[i];
 		}
@@ -898,7 +900,7 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 		 *	pitch * tile_h == tile_size * tiles_per_row
 		 */
 		u32 tiles_w = fb->pitches[0] >> (tile_size_shift - tile_h_shift);
-		u32 tiles_l = vc4_state->src_x >> tile_w_shift;
+		u32 tiles_l = src_x >> tile_w_shift;
 		u32 tiles_r = tiles_w - tiles_l;
 		u32 tiles_t = src_y >> tile_h_shift;
 		/* Intra-tile offsets, which modify the base address (the
@@ -908,7 +910,7 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 		u32 tile_y = (src_y >> 4) & 1;
 		u32 subtile_y = (src_y >> 2) & 3;
 		u32 utile_y = src_y & 3;
-		u32 x_off = vc4_state->src_x & tile_w_mask;
+		u32 x_off = src_x & tile_w_mask;
 		u32 y_off = src_y & tile_h_mask;
 
 		/* When Y reflection is requested we must set the
@@ -1004,7 +1006,7 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 				 * of the 12-pixels in that 128-bit word is the
 				 * first pixel to be used
 				 */
-				u32 remaining_pixels = vc4_state->src_x % 96;
+				u32 remaining_pixels = src_x % 96;
 				u32 aligned = remaining_pixels / 12;
 				u32 last_bits = remaining_pixels % 12;
 
@@ -1026,12 +1028,12 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 					return -EINVAL;
 				}
 				pix_per_tile = tile_w / fb->format->cpp[0];
-				x_off = (vc4_state->src_x % pix_per_tile) /
+				x_off = (src_x % pix_per_tile) /
 					(i ? h_subsample : 1) *
 					fb->format->cpp[i];
 			}
 
-			tile = vc4_state->src_x / pix_per_tile;
+			tile = src_x / pix_per_tile;
 
 			vc4_state->offsets[i] += param * tile_w * tile;
 			vc4_state->offsets[i] += src_y /
@@ -1092,10 +1094,8 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 		vc4_dlist_write(vc4_state,
 				(mix_plane_alpha ? SCALER_POS2_ALPHA_MIX : 0) |
 				vc4_hvs4_get_alpha_blend_mode(state) |
-				VC4_SET_FIELD(vc4_state->src_w[0],
-					      SCALER_POS2_WIDTH) |
-				VC4_SET_FIELD(vc4_state->src_h[0],
-					      SCALER_POS2_HEIGHT));
+				VC4_SET_FIELD(width, SCALER_POS2_WIDTH) |
+				VC4_SET_FIELD(height, SCALER_POS2_HEIGHT));
 
 		/* Position Word 3: Context.  Written by the HVS. */
 		vc4_dlist_write(vc4_state, 0xc0c0c0c0);
@@ -1148,10 +1148,8 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 		/* Position Word 2: Source Image Size */
 		vc4_state->pos2_offset = vc4_state->dlist_count;
 		vc4_dlist_write(vc4_state,
-				VC4_SET_FIELD(vc4_state->src_w[0],
-					      SCALER5_POS2_WIDTH) |
-				VC4_SET_FIELD(vc4_state->src_h[0],
-					      SCALER5_POS2_HEIGHT));
+				VC4_SET_FIELD(width, SCALER5_POS2_WIDTH) |
+				VC4_SET_FIELD(height, SCALER5_POS2_HEIGHT));
 
 		/* Position Word 3: Context.  Written by the HVS. */
 		vc4_dlist_write(vc4_state, 0xc0c0c0c0);
-- 
2.34.1

