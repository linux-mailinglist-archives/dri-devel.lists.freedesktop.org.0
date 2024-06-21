Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C17912958
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229F210F1E7;
	Fri, 21 Jun 2024 15:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="FCMSIf3r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f97.google.com (mail-ej1-f97.google.com
 [209.85.218.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F74610F1E3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:33 +0000 (UTC)
Received: by mail-ej1-f97.google.com with SMTP id
 a640c23a62f3a-a63359aaaa6so305632266b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983292; x=1719588092;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GLOzuMLaXl+Uytcx8tcLjxE+cAqpQuNtsWbYYytP+IY=;
 b=FCMSIf3r6q/Fgc6DYPzDGR8niITTMJdeexQL2qOIuyFJjajKwXZF+3uyWh2Nclh1UQ
 taJIVsZV/IwGTHLJbruO75iI65bE7/tJEef/iRdERDPNBcRVOq64srs5tINVRSixJzsq
 N9UixM95LZtpvF7gXrAMY+/OMwtWWQXYZu1nGdjdwxjSfSxMN34e7j3+87op7bRDdrYE
 dcTIc4leMUgrzelXo/ws0CVNVrxRBkQ4pJBYJbxp8V9MxT3JkVNKNAHWK2VPD4MxigKt
 ZQRsN41SVdslrAiazgmnx4gNujDSf7FSnjt9/pJ8MJ1dBw6oncTaguyewxUhXc8AyT0W
 F4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983292; x=1719588092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GLOzuMLaXl+Uytcx8tcLjxE+cAqpQuNtsWbYYytP+IY=;
 b=Gew4EtObnbHE025ayueo4nxRZ/YB9yS9xwMNkAZE0eLXJ6PWnbivzBmo5g7vaztfHq
 +Qypbf1iqGGij5te1I1aWiCkt+XHTTwvkW/ELe50J29Xr0PTvg96r6/1k6FbY7ENUYEG
 UELFZaDCu9V+s4x40CKJ+C5uqwPlyNF4p32trgjr5YQ0Hvhdb525F/gWtRCwBnorPiPf
 Rwsb4S3Tzj0nvgxCZf4rziw313Rcw9L9lnJIp8SAw+BG2rKB795vnYZwFjwGKxa5a+Uh
 iRR2LivoIpIb8n2kURhmiJzUikdG9chr2WdQVNkThqOfUzj/SOBLs1QkW7kxhQdS0exu
 TsFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHbf1QFyb/PXMCbv/sMoY0ZMERub/NrUX1MRwKUon57h+ouPJUwEXUDVVAq7LuHWnwe6rRNCgKVhobJ1COsbFk9S2I0oaMxeuR5MPoKjN2
X-Gm-Message-State: AOJu0YyyNOeJ6gR2QJ1r9H87HMbkZuuff2QiL5smMpOnhPWZqCOWNTSa
 CqzoftvJuX6LgUe6GOattU8b9MQOno2DoeuV0cP06LTmMtLvXoO41EL3WRojiWr66mg2V7NSiop
 r8hvzXZ8cjFycwtqxM1aiEzXI0ARxGowE
X-Google-Smtp-Source: AGHT+IEVCaF1mMbyqVgH77sDCByw9LYEHoYHlvRjrSadcw5j5D+w/T+QMLOF1i/IuJq3+2GmoWYy1uSoJfaf
X-Received: by 2002:a17:907:8a85:b0:a6f:acf8:2f88 with SMTP id
 a640c23a62f3a-a6facf82ff0mr558559766b.21.1718983291566; 
 Fri, 21 Jun 2024 08:21:31 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6fcf427d36sm5656466b.44.2024.06.21.08.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:31 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 02/31] drm/vc4: plane: Handle fractional coordinates using
 the phase field
Date: Fri, 21 Jun 2024 16:20:26 +0100
Message-Id: <20240621152055.4180873-3-dave.stevenson@raspberrypi.com>
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

