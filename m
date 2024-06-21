Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 902C8912973
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE5510F1F8;
	Fri, 21 Jun 2024 15:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="NGQzFLc2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f100.google.com (mail-ed1-f100.google.com
 [209.85.208.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F5610F1EB
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:39 +0000 (UTC)
Received: by mail-ed1-f100.google.com with SMTP id
 4fb4d7f45d1cf-57d2fc03740so822904a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983298; x=1719588098;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=76APJzI3IfbE2bsc4vX1RUczw0mDm49A7pScM+/6mNI=;
 b=NGQzFLc2o13PSKFVjMXxbN/s24N0bPZEVEaJhNPnNvtb61DNQJJuC3IVutvbnyq28A
 Jt2guYcSkhAPigxKlPb4IVsmaYuTeQ3wEmMYFUMc0zldhBXwVpo92YFNVrRNYfui0Wk7
 8a0SbqutJ3yAUZRUQ9vhBnhKWlt1i5aqtUO6Ylrbs7Xt+pHIzXPbeDfsSBgkR1YLPaok
 B5dF7v2aGU5tAE0HW5ZNM37gENpPdeqPcZyLkglJv8VybmeNz4LWF0IfB5jMkCho0MZT
 1xS9bVVU9fHd1EDXH09NBvxLN3A6Q4JJWrPUenM8HmEIaFg4/jW4DFUwMsAxgI3orV5g
 C2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983298; x=1719588098;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=76APJzI3IfbE2bsc4vX1RUczw0mDm49A7pScM+/6mNI=;
 b=b9f/m5hM5duEdBbmTqOmW1KXJtI7BuPIMuB6fdpACsI9tjIFRS4zn6NDplSldR755a
 mBQbnePLe9pCQFOn1kecUErIee4UU4dl5VRwPU6YotIN39b62YGzQDDAsG1O3Y2XRQF/
 tjn9d5oeEiHzRR//eLIppgwwS+Upd9P12h8rkVNJWmgiVo+31WHh+R8RwvGbxCUpMYSl
 DmdHMj/p10C4Jit8QbOadQ8g1Z25YjF/cGUQXxYV7qmF48m8FcYBZgGSjutxo7r8G29X
 Xbh3ByXc+EDiM+DQYELyyxomZg3s1B6m4bfvTBzVcP7rXNFYdC1hTQijTEqvbGZ/1AOL
 UDmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFV+v2cJvlB0605LmxZuLP5++1vyIveSFBiC/fziBONjW3mIU/vo/9gG1AUlGLEb1O7OoNUl/VPTOr3o3+6qMyY5MVGR8cXiAdm7gpkM5N
X-Gm-Message-State: AOJu0YwkOEs2W6+IKmGN03gRyEn5xM9AzzxNfFjYnSh+p19Al90cE/42
 KYctlMO5wOHmhcBNf8nzex23E/okzvuKZEPvMrgvNb7j1AA+Sl+8RYeyt8ifEBzWvVaDFZDBAc8
 NquaHudH5z/nravmIfcErDx3ki0N7Yvax
X-Google-Smtp-Source: AGHT+IF8gj413xziC7kDhpixjv7aFcLt5Dl9nSekKyxsdJwst5MceS2kmPpzMAUM5pbWAt9oPBHG6NXw9Pzn
X-Received: by 2002:a17:907:a64a:b0:a6f:ae81:172 with SMTP id
 a640c23a62f3a-a6fae810724mr583115366b.65.1718983298291; 
 Fri, 21 Jun 2024 08:21:38 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6fcf485dafsm5128966b.95.2024.06.21.08.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:38 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 13/31] drm/vc4: crtc: Move assigned_channel to a variable
Date: Fri, 21 Jun 2024 16:20:37 +0100
Message-Id: <20240621152055.4180873-14-dave.stevenson@raspberrypi.com>
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

From: Maxime Ripard <mripard@kernel.org>

We access multiple times the vc4_crtc_state->assigned_channel variable
in the vc4_crtc_get_scanout_position() function, so let's store it in a
local variable.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 1d54176cf811..ef5ad0ca4c2d 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -105,6 +105,7 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
 	struct vc4_hvs *hvs = vc4->hvs;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct vc4_crtc_state *vc4_crtc_state = to_vc4_crtc_state(crtc->state);
+	unsigned int channel = vc4_crtc_state->assigned_channel;
 	unsigned int cob_size;
 	u32 val;
 	int fifo_lines;
@@ -121,7 +122,7 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
 	 * Read vertical scanline which is currently composed for our
 	 * pixelvalve by the HVS, and also the scaler status.
 	 */
-	val = HVS_READ(SCALER_DISPSTATX(vc4_crtc_state->assigned_channel));
+	val = HVS_READ(SCALER_DISPSTATX(channel));
 
 	/* Get optional system timestamp after query. */
 	if (etime)
@@ -137,11 +138,11 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
 		*vpos /= 2;
 
 		/* Use hpos to correct for field offset in interlaced mode. */
-		if (vc4_hvs_get_fifo_frame_count(hvs, vc4_crtc_state->assigned_channel) % 2)
+		if (vc4_hvs_get_fifo_frame_count(hvs, channel) % 2)
 			*hpos += mode->crtc_htotal / 2;
 	}
 
-	cob_size = vc4_crtc_get_cob_allocation(vc4, vc4_crtc_state->assigned_channel);
+	cob_size = vc4_crtc_get_cob_allocation(vc4, channel);
 	/* This is the offset we need for translating hvs -> pv scanout pos. */
 	fifo_lines = cob_size / mode->crtc_hdisplay;
 
-- 
2.34.1

