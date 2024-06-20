Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7635910A66
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8103088C11;
	Thu, 20 Jun 2024 15:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="XP76Jc0Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f98.google.com (mail-ej1-f98.google.com
 [209.85.218.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAFE10EA72
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:46:40 +0000 (UTC)
Received: by mail-ej1-f98.google.com with SMTP id
 a640c23a62f3a-a6ef64b092cso120228266b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898399; x=1719503199;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GLOzuMLaXl+Uytcx8tcLjxE+cAqpQuNtsWbYYytP+IY=;
 b=XP76Jc0QuHp2+l2uBo+Z5sFmrO6zu4ZfsE8gvNSIEIga7QwjDAyMlosXtwn/Qv2726
 vDva+xhN9w7YzYuZVyg+dqZ6aPAS7ZFza3cl0i0bkoJ2ZGs3zLwyVyeKtKzuHI9hkzOW
 LXZE8AtLqqzeBji21Etyd98+6A8Hj9qE5bfbbIIU/Vo5RMxmOhN38M0O7KW+kK4Kn+Yo
 aBD9UbcYoEZl1ZUcWeKDcF9dl+I/lYo/BHefo5Cx7hfTTEehIQUeZ9CGDlKGxvm7FCZT
 BQLP0mNsgiFffDofy/HUzBHx6E+iVPBLjfluVr2uA+HGFbHmAz2bq9XViIDjkAuUbuup
 FD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898399; x=1719503199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GLOzuMLaXl+Uytcx8tcLjxE+cAqpQuNtsWbYYytP+IY=;
 b=EJ0t+7zedc1hfrQT8u6qB4dSTniPxylD+G7Y8unzYyaZmucpQCRl4DxpGNKQ2YrD5T
 ixQdEqZMvsVCGbtiRgSYeqCBTLmdHf5o84o86bRWBOzCR1mCOnQ6WqXWsmd4GogHKsBu
 IceYibOVYa+crvZ5CZKLq3VhMhX0u5Lom2aTxC3Lv7ZaZGNJtxdE1KYD5ic52Jc7zLfP
 T02mYkKRbX+ddAN8U+xa/YKAXt5eaiZPVoCf0J/cnaRb9aJgAESoVEW5v3DUuc2SICSX
 XZ4ykNQz8l4vkKlfKtd2Xqf2WYmHwftXaO2qGa7H/MW84RMV7xzIUo+QiVijPgRyjHg+
 JM7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/AQL+Hm+zublL+doLZWeBCQlZ4zV2QRtjIEW9XK2HtRsIOiPS5VVLMxLEq+Qs3V64QHTt+JgnkUgUMWB1Gu99jiqTKhQZryn7ad62trBd
X-Gm-Message-State: AOJu0YzaTkgByBSeeR5up+KaYhj+XInxp/alEQRU3Ne25kiBIgNDOlsi
 P+bihS/0YCUCo4aCSCTJlc3KssYt5jpeUQUOIlrBZ7Y/xSsCzqncCdDCH4n7df8Tu4ml2qxmDRB
 6Sj+BCp4Rt5apeOvKy/+vn5YOjuIQaH3b
X-Google-Smtp-Source: AGHT+IE3jctrJY9Z2pCbPvzRgUjJe2nRfDKf5m0P4SuxgY5Jnmcnh/xdRrF3Cc0Ownh+wePmKirkyJDM3Qf/
X-Received: by 2002:a17:907:c283:b0:a6f:593f:d334 with SMTP id
 a640c23a62f3a-a6fab77a293mr376779566b.51.1718898399099; 
 Thu, 20 Jun 2024 08:46:39 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6f56f209dcsm27797566b.264.2024.06.20.08.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:46:39 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 02/31] drm/vc4: Handle fractional coordinates using the phase
 field
Date: Thu, 20 Jun 2024 16:46:03 +0100
Message-Id: <20240620154632.4125308-3-dave.stevenson@raspberrypi.com>
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

Apply fractional source co-ordinates into the scaling filters.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 87 ++++++++++++++++++++++++++++-----
 1 file changed, 76 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index e0df210bedcb..b8c68d4688c8 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -532,14 +532,61 @@ static void vc4_write_tpz(struct vc4_plane_state *vc4_state, u32 src, u32 dst)
 			VC4_SET_FIELD(recip, SCALER_TPZ1_RECIP));
 }
 
-static void vc4_write_ppf(struct vc4_plane_state *vc4_state, u32 src, u32 dst)
+/* phase magnitude bits */
+#define PHASE_BITS 6
+
+static void vc4_write_ppf(struct vc4_plane_state *vc4_state, u32 src, u32 dst,
+			  u32 xy, int channel)
 {
-	u32 scale = (1 << 16) * src / dst;
+	u32 scale = src / dst;
+	s32 offset, offset2;
+	s32 phase;
+
+	/*
+	 * Start the phase at 1/2 pixel from the 1st pixel at src_x.
+	 * 1/4 pixel for YUV.
+	 */
+	if (channel) {
+		/*
+		 * The phase is relative to scale_src->x, so shift it for
+		 * display list's x value
+		 */
+		offset = (xy & 0x1ffff) >> (16 - PHASE_BITS) >> 1;
+		offset += -(1 << PHASE_BITS >> 2);
+	} else {
+		/*
+		 * The phase is relative to scale_src->x, so shift it for
+		 * display list's x value
+		 */
+		offset = (xy & 0xffff) >> (16 - PHASE_BITS);
+		offset += -(1 << PHASE_BITS >> 1);
+
+		/*
+		 * This is a kludge to make sure the scaling factors are
+		 * consistent with YUV's luma scaling. We lose 1-bit precision
+		 * because of this.
+		 */
+		scale &= ~1;
+	}
+
+	/*
+	 * There may be a also small error introduced by precision of scale.
+	 * Add half of that as a compromise
+	 */
+	offset2 = src - dst * scale;
+	offset2 >>= 16 - PHASE_BITS;
+	phase = offset + (offset2 >> 1);
+
+	/* Ensure +ve values don't touch the sign bit, then truncate negative values */
+	if (phase >= 1 << PHASE_BITS)
+		phase = (1 << PHASE_BITS) - 1;
+
+	phase &= SCALER_PPF_IPHASE_MASK;
 
 	vc4_dlist_write(vc4_state,
 			SCALER_PPF_AGC |
 			VC4_SET_FIELD(scale, SCALER_PPF_SCALE) |
-			VC4_SET_FIELD(0, SCALER_PPF_IPHASE));
+			VC4_SET_FIELD(phase, SCALER_PPF_IPHASE));
 }
 
 static u32 vc4_lbm_size(struct drm_plane_state *state)
@@ -597,27 +644,27 @@ static void vc4_write_scaling_parameters(struct drm_plane_state *state,
 
 	/* Ch0 H-PPF Word 0: Scaling Parameters */
 	if (vc4_state->x_scaling[channel] == VC4_SCALING_PPF) {
-		vc4_write_ppf(vc4_state,
-			      vc4_state->src_w[channel], vc4_state->crtc_w);
+		vc4_write_ppf(vc4_state, vc4_state->src_w[channel],
+			      vc4_state->crtc_w, vc4_state->src_x, channel);
 	}
 
 	/* Ch0 V-PPF Words 0-1: Scaling Parameters, Context */
 	if (vc4_state->y_scaling[channel] == VC4_SCALING_PPF) {
-		vc4_write_ppf(vc4_state,
-			      vc4_state->src_h[channel], vc4_state->crtc_h);
+		vc4_write_ppf(vc4_state, vc4_state->src_h[channel],
+			      vc4_state->crtc_h, vc4_state->src_y, channel);
 		vc4_dlist_write(vc4_state, 0xc0c0c0c0);
 	}
 
 	/* Ch0 H-TPZ Words 0-1: Scaling Parameters, Recip */
 	if (vc4_state->x_scaling[channel] == VC4_SCALING_TPZ) {
-		vc4_write_tpz(vc4_state,
-			      vc4_state->src_w[channel], vc4_state->crtc_w);
+		vc4_write_tpz(vc4_state, vc4_state->src_w[channel],
+			      vc4_state->crtc_w);
 	}
 
 	/* Ch0 V-TPZ Words 0-2: Scaling Parameters, Recip, Context */
 	if (vc4_state->y_scaling[channel] == VC4_SCALING_TPZ) {
-		vc4_write_tpz(vc4_state,
-			      vc4_state->src_h[channel], vc4_state->crtc_h);
+		vc4_write_tpz(vc4_state, vc4_state->src_h[channel],
+			      vc4_state->crtc_h);
 		vc4_dlist_write(vc4_state, 0xc0c0c0c0);
 	}
 }
@@ -1052,6 +1099,24 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
+	/* fetch an extra pixel if we don't actually line up with the left edge. */
+	if ((vc4_state->src_x & 0xffff) && vc4_state->src_x < (state->fb->width << 16))
+		width++;
+
+	/* same for the right side */
+	if (((vc4_state->src_x + vc4_state->src_w[0]) & 0xffff) &&
+	    vc4_state->src_x + vc4_state->src_w[0] < (state->fb->width << 16))
+		width++;
+
+	/* now for the top */
+	if ((vc4_state->src_y & 0xffff) && vc4_state->src_y < (state->fb->height << 16))
+		height++;
+
+	/* and the bottom */
+	if (((vc4_state->src_y + vc4_state->src_h[0]) & 0xffff) &&
+	    vc4_state->src_y + vc4_state->src_h[0] < (state->fb->height << 16))
+		height++;
+
 	/* Don't waste cycles mixing with plane alpha if the set alpha
 	 * is opaque or there is no per-pixel alpha information.
 	 * In any case we use the alpha property value as the fixed alpha.
-- 
2.34.1

