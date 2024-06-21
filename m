Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF417912968
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D282010F1E8;
	Fri, 21 Jun 2024 15:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="KnUfbw3t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f97.google.com (mail-ej1-f97.google.com
 [209.85.218.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7CC10F1ED
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:48 +0000 (UTC)
Received: by mail-ej1-f97.google.com with SMTP id
 a640c23a62f3a-a6f8ebbd268so538970266b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983306; x=1719588106;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u4r5vzkCdgWS85bZ5yYoBEblfwPlxcJTNVQ5JHlLB9Y=;
 b=KnUfbw3tHMD3BIBym15G3K+4ObJo3dP1BB6rWhkoSyr3q2sqKj5Shk45rubONv7U7B
 q36Zyu2JHD+CysODxgPJqCjk6SAixs7tvbEnn1Su3KvOqEI+U+5lMhqqvoJWJxSl2HXd
 t8X3oK6IJJ//1AvB+eIHziQHRKI4R7zlaH8qK0Hc/tKWdcCg0HdTnBdSQGww4qjzENxi
 ce25JBp5U5yMy5Og5ecb9s6yh+wtcVMZq3EnLo8szyZgwJ8zHIpQrgqHv3bn5LKZLgEs
 foaeWvxth1TJNxqz014TPvigW5FBoQiBYVrnqOLY2aaslqTX3R1HC3KTpEsXhasewvGy
 uMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983306; x=1719588106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u4r5vzkCdgWS85bZ5yYoBEblfwPlxcJTNVQ5JHlLB9Y=;
 b=K0XMwaVjQYxdlCiJ5W4KSFvepfX7nbVghrUNAaX+2Rt2yvgOwY/QCidPawM9VSBNB5
 SA0JZJXZYDHFTKEObDDqplPTn4HTb/XdwQdPUMXVPrb3JGf6CGj9EQtQUnAssToiOYw1
 /rrqUB2bOxCH0+xwQXvb6gY/Ihe/7+D0Hxp/eCO2TLlsUzcLl5NFNr1SPTBQlEWyR+wW
 eRHRDOW260efxuccpH1A9AbNVMHxpMM5iurJJdKBAxmxpOIBMH1qagPai7I5DZ9xjYqi
 zc4+qkJpW6ZycZGxvbVdgZ7JMhdDOyBFII7e5KpaCjxYWNUqqTtOsajDqtuy1cqf3aJu
 VYNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvCnk1Taf97IDWFG4cFUEQcQJapGRW7ZTYTrnIUbHqIbtGnbp5iTdva/fC7GkafttMNrz6BTwGuTRw2E+siKEAivADaIMWX+voy97hZZzd
X-Gm-Message-State: AOJu0Yy0eMDDp7PdFyu+wDXF+KEY+KOVY/O+cPic+xgBLloywUS3OEDC
 JBR8K7h6sR5D3iOyCuuNBGxRMHatTw/Sf6r9ixfLP5B14laiW+tdVT1b8sgmUW6GRxGTVxPYiGa
 cRHBYZ8Ox4aX5pcOb7dpWYFp2StQRKX+E
X-Google-Smtp-Source: AGHT+IE0ytzD5ls9symVDUclNO+8P+GxHxkW6l0GiKM0JeKnGcngMCQVARAl1wpkt5GcekxB7dZBj2rQxi92
X-Received: by 2002:a17:906:bf42:b0:a6e:feb8:eb15 with SMTP id
 a640c23a62f3a-a6fdb6e1fa0mr7766366b.38.1718983306624; 
 Fri, 21 Jun 2024 08:21:46 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6fcf427c38sm5726466b.22.2024.06.21.08.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:46 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 29/31] drm/vc4: plane: Move the buffer offset out of the
 vc4_plane_state
Date: Fri, 21 Jun 2024 16:20:53 +0100
Message-Id: <20240621152055.4180873-30-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
References: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
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

The offset fields in vc4_plane_state are described as being
the offset for each buffer in the bo, however it is used to
store the complete DMA address that is then written into the
register.

The DMA address including the fb ofset can be retrieved
using drm_fb_dma_get_gem_addr, and the offset adjustment due to
clipping is local to vc4_plane_mode_set.
Drop the offset field from the state, and compute the complete
DMA address in vc4_plane_mode_set.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h   |  5 ----
 drivers/gpu/drm/vc4/vc4_plane.c | 51 +++++++++++++--------------------
 2 files changed, 20 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 7a9faea748e6..c6be1997f1c7 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -421,11 +421,6 @@ struct vc4_plane_state {
 	bool is_unity;
 	bool is_yuv;
 
-	/* Offset to start scanning out from the start of the plane's
-	 * BO.
-	 */
-	u32 offsets[3];
-
 	/* Our allocation in LBM for temporary storage during scaling. */
 	struct drm_mm_node lbm;
 
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 4c61ef4f4142..ba6e86d62a77 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -450,12 +450,11 @@ static int vc4_plane_setup_clipping_and_scaling(struct drm_plane_state *state)
 {
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
 	struct drm_framebuffer *fb = state->fb;
-	struct drm_gem_dma_object *bo;
 	int num_planes = fb->format->num_planes;
 	struct drm_crtc_state *crtc_state;
 	u32 h_subsample = fb->format->hsub;
 	u32 v_subsample = fb->format->vsub;
-	int i, ret;
+	int ret;
 
 	crtc_state = drm_atomic_get_existing_crtc_state(state->state,
 							state->crtc);
@@ -469,11 +468,6 @@ static int vc4_plane_setup_clipping_and_scaling(struct drm_plane_state *state)
 	if (ret)
 		return ret;
 
-	for (i = 0; i < num_planes; i++) {
-		bo = drm_fb_dma_get_gem_obj(fb, i);
-		vc4_state->offsets[i] = bo->dma_addr + fb->offsets[i];
-	}
-
 	vc4_state->src_x = state->src.x1;
 	vc4_state->src_y = state->src.y1;
 	vc4_state->src_w[0] = state->src.x2 - vc4_state->src_x;
@@ -902,6 +896,7 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 	u32 width, height;
 	u32 hvs_format = format->hvs;
 	unsigned int rotation;
+	u32 offsets[3] = { 0 };
 	int ret, i;
 
 	if (vc4_state->dlist_initialized)
@@ -949,13 +944,8 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 		 * out.
 		 */
 		for (i = 0; i < num_planes; i++) {
-			vc4_state->offsets[i] += src_y /
-						 (i ? v_subsample : 1) *
-						 fb->pitches[i];
-
-			vc4_state->offsets[i] += src_x /
-						 (i ? h_subsample : 1) *
-						 fb->format->cpp[i];
+			offsets[i] += src_y / (i ? v_subsample : 1) * fb->pitches[i];
+			offsets[i] += src_x / (i ? h_subsample : 1) * fb->format->cpp[i];
 		}
 
 		break;
@@ -1010,19 +1000,18 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 			   VC4_SET_FIELD(y_off, SCALER_PITCH0_TILE_Y_OFFSET) |
 			   VC4_SET_FIELD(tiles_l, SCALER_PITCH0_TILE_WIDTH_L) |
 			   VC4_SET_FIELD(tiles_r, SCALER_PITCH0_TILE_WIDTH_R));
-		vc4_state->offsets[0] += tiles_t * (tiles_w << tile_size_shift);
-		vc4_state->offsets[0] += subtile_y << 8;
-		vc4_state->offsets[0] += utile_y << 4;
+		offsets[0] += tiles_t * (tiles_w << tile_size_shift);
+		offsets[0] += subtile_y << 8;
+		offsets[0] += utile_y << 4;
 
 		/* Rows of tiles alternate left-to-right and right-to-left. */
 		if (tiles_t & 1) {
 			pitch0 |= SCALER_PITCH0_TILE_INITIAL_LINE_DIR;
-			vc4_state->offsets[0] += (tiles_w - tiles_l) <<
-						 tile_size_shift;
-			vc4_state->offsets[0] -= (1 + !tile_y) << 10;
+			offsets[0] += (tiles_w - tiles_l) << tile_size_shift;
+			offsets[0] -= (1 + !tile_y) << 10;
 		} else {
-			vc4_state->offsets[0] += tiles_l << tile_size_shift;
-			vc4_state->offsets[0] += tile_y << 10;
+			offsets[0] += tiles_l << tile_size_shift;
+			offsets[0] += tile_y << 10;
 		}
 
 		break;
@@ -1111,11 +1100,9 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 
 			tile = src_x / pix_per_tile;
 
-			vc4_state->offsets[i] += param * tile_w * tile;
-			vc4_state->offsets[i] += src_y /
-						 (i ? v_subsample : 1) *
-						 tile_w;
-			vc4_state->offsets[i] += x_off & ~(i ? 1 : 0);
+			offsets[i] += param * tile_w * tile;
+			offsets[i] += src_y / (i ? v_subsample : 1) * tile_w;
+			offsets[i] += x_off & ~(i ? 1 : 0);
 		}
 
 		pitch0 = VC4_SET_FIELD(param, SCALER_TILE_HEIGHT);
@@ -1261,8 +1248,12 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 	 * The pointers may be any byte address.
 	 */
 	vc4_state->ptr0_offset[0] = vc4_state->dlist_count;
-	for (i = 0; i < num_planes; i++)
-		vc4_dlist_write(vc4_state, vc4_state->offsets[i]);
+
+	for (i = 0; i < num_planes; i++) {
+		struct drm_gem_dma_object *bo = drm_fb_dma_get_gem_obj(fb, i);
+
+		vc4_dlist_write(vc4_state, bo->dma_addr + fb->offsets[i] + offsets[i]);
+	}
 
 	/* Pointer Context Word 0/1/2: Written by the HVS */
 	for (i = 0; i < num_planes; i++)
@@ -1525,8 +1516,6 @@ static void vc4_plane_atomic_async_update(struct drm_plane *plane,
 	       sizeof(vc4_state->y_scaling));
 	vc4_state->is_unity = new_vc4_state->is_unity;
 	vc4_state->is_yuv = new_vc4_state->is_yuv;
-	memcpy(vc4_state->offsets, new_vc4_state->offsets,
-	       sizeof(vc4_state->offsets));
 	vc4_state->needs_bg_fill = new_vc4_state->needs_bg_fill;
 
 	/* Update the current vc4_state pos0, pos2 and ptr0 dlist entries. */
-- 
2.34.1

