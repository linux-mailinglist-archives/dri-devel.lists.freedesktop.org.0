Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 701FD91295B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F199810F1EF;
	Fri, 21 Jun 2024 15:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="fqGpuetr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f99.google.com (mail-ed1-f99.google.com
 [209.85.208.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB6710F1E5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:37 +0000 (UTC)
Received: by mail-ed1-f99.google.com with SMTP id
 4fb4d7f45d1cf-57cfe600cbeso2562724a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983296; x=1719588096;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c1D9gVygL/n1WBkdldJJKn0Kbc2QmnGAhxh7b0g2IHQ=;
 b=fqGpuetrkqXxDK6mJhupfaOIQNrRJPk8UIG4Q56EasWtjrqfLoqz2pT8U5PcgdoCzU
 bzBWxnFhJ7/VKVpcN23EQXPnvTqx8861XPCQGI85R0Mu1/jpJaLWWY9QK0Q1YXxhyyCE
 qVxFTSqqVtNEqqrf/y7JJzMVbBPwx4auP/m6EJEvWkOWQoDVyvkUw75wP0rbmapySn2r
 5yZNwiDYpMIlOzrd44voqfNsm8k2WOkcbfVni6vf6A3eD+zGGD1u3oz1EytNvAWM2Apn
 OS0p+MjhlYNDV+hdHG8VUDXSm0nTHF/6mbw6uDWY9W6Cw3RWxyd/1wKHM1UrNVxod32j
 qkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983296; x=1719588096;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c1D9gVygL/n1WBkdldJJKn0Kbc2QmnGAhxh7b0g2IHQ=;
 b=vvOTO5kWBlGsiFHebiaS7TeKMalKdwab9nggTNM5z2894oxvmcRrJH391g53nB0p1c
 NBly9eEj+IMZ8ZjQtBG1hcRELkwNndqkLIVYyTVbXeQWYOS0G8q0IZ9ynmE0MO0J5Pez
 5X1ujMm7liywDRow/R3PcG9RzHmgM4FVn+QAG2ZjsYF+SccSYjaCIS3COWy4PUL/1vqj
 MNtlr1a6Ji7iH737mLtG5wRkgZOlYefiLu7BDGhh+gAQT7Z/LjxJDmFBSOHQLbOiSm2d
 w1hYrZLl99r0hhTJHxg99ICw3S9k0yPqbcpq4ozzDAbwncQD3yiWOAi1AH3iiRYDTJkw
 yRFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV8Li8luAKq0uUSBbURh/3lEH831CKNpwWV9/r/cIh0i/Gww5D7Do9vLrYF2M8QGVtkbilKaj7i3rjQ2pTZIT9GZEIEnkymVt0YkWI16nW
X-Gm-Message-State: AOJu0Yy5vdmULeLO7tVwmztAo013U0DWtj00+6gtwPh1911Ut+PiNUXL
 GK38uyKSeoPTeIWl+LOr/l1AijCSPg70LOjLefJoBzfQgbdjB4N5PdpO7gDCcZ95G7rjHCTRGgq
 /Z5XtJA4sR2NNfNiXmOqRvOsIqv5INq1x
X-Google-Smtp-Source: AGHT+IGOcIz5m3K0DS9CCyAgvWLsWjmHV7Oh60v+nEHLOXf4noBBLkXfTOuTe21CIfQUzd9cK30Mp0GCD3Ic
X-Received: by 2002:a50:d74a:0:b0:57c:9cd3:4f96 with SMTP id
 4fb4d7f45d1cf-57d07ee78e3mr4730994a12.40.1718983295796; 
 Fri, 21 Jun 2024 08:21:35 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 4fb4d7f45d1cf-57d3287ff10sm23717a12.13.2024.06.21.08.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:35 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 09/31] drm/vc4: hvs: More logging for dlist generation
Date: Fri, 21 Jun 2024 16:20:33 +0100
Message-Id: <20240621152055.4180873-10-dave.stevenson@raspberrypi.com>
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

DLIST generation can get pretty tricky and there's not a lot of debug in
the driver to help. Let's add a few more to track the generated DLIST
size.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 267c9fde7362..189d00fcf4c2 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -456,11 +456,21 @@ int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	if (hweight32(crtc_state->connector_mask) > 1)
 		return -EINVAL;
 
-	drm_atomic_crtc_state_for_each_plane_state(plane, plane_state, crtc_state)
-		dlist_count += vc4_plane_dlist_size(plane_state);
+	drm_atomic_crtc_state_for_each_plane_state(plane, plane_state, crtc_state) {
+		u32 plane_dlist_count = vc4_plane_dlist_size(plane_state);
+
+		drm_dbg_driver(dev, "[CRTC:%d:%s] Found [PLANE:%d:%s] with DLIST size: %u\n",
+			       crtc->base.id, crtc->name,
+			       plane->base.id, plane->name,
+			       plane_dlist_count);
+
+		dlist_count += plane_dlist_count;
+	}
 
 	dlist_count++; /* Account for SCALER_CTL0_END. */
 
+	drm_dbg_driver(dev, "[CRTC:%d:%s] Allocating DLIST block with size: %u\n",
+		       crtc->base.id, crtc->name, dlist_count);
 	spin_lock_irqsave(&vc4->hvs->mm_lock, flags);
 	ret = drm_mm_insert_node(&vc4->hvs->dlist_mm, &vc4_state->mm,
 				 dlist_count);
-- 
2.34.1

