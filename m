Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F888910A7D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3D410EAA4;
	Thu, 20 Jun 2024 15:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="oy2E3tJ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f97.google.com (mail-ej1-f97.google.com
 [209.85.218.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33DE10EAA3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:47:14 +0000 (UTC)
Received: by mail-ej1-f97.google.com with SMTP id
 a640c23a62f3a-a6f9fe791f8so180905966b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898433; x=1719503233;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GFmToTbkhMOjpvTO829+k1V610uGM3yWecF5+/o28+I=;
 b=oy2E3tJ3bUYYVw4LB0Ypj0KkGe7PhsWovO4RvUSG1aiFeRPFaAFt7KjopxK165nsmZ
 s/sH0xxzSnf5eiJ0mYUbYmmxEwyl1r5QHialcBZtLfouZ8B8J0+kGr4KgKSw1Qzu1KSa
 s7lDScVdc9m9FeUzf6JtxznEg0BqDp5CXiBm+8US9Zp6eu2zNjdShDyhiVsQfsG5RcGS
 nutObHvmDz0S/i7f+IPAsYhisqChit+rfVN7+ksVIPx8idVGQSvHn6IQTlw1rgQnsvr3
 wEn4cHNl0at4qndQc7jzCDc9w40SD69Vfhsgr5KjD1q2OwRZENuAMMgQi9DXG4somk3G
 cfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898433; x=1719503233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GFmToTbkhMOjpvTO829+k1V610uGM3yWecF5+/o28+I=;
 b=LgRqusvBptIwkQh7DIwcr5qCX++kROWS9uA9x5YAvxvV3XSVo/eGunBVPNY2OMD3Hk
 953qD5iWJN2YnOUFxLdRxXngO/n0asBVEfys2/Ry9PwE5EF+hcUd0iDwbQVoUTjpaEFj
 sKTKr0Het4awt1KCSrX6n1Qq07rAF2LjBBbJgwHZNfFlVOscZTrADNsC6B/soDRnw6UE
 o0sXt7AyB2rlA+HGQuEhnbAJBShpGF1FOSXBhxzNlZtFddSNIo02TTNttTWHP1616EKA
 AHT9QbspPXxHgraT9BJpRX9pBZnl0OWC5e9nFUlSY8+scMScYu2zy42OyGOVpuXPwbQb
 8dKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7SQZdjDbiq5FRuoSZoTU6Bb10j7RaXttOoNtQFv1VmHfANt/HMetYg+VzunhrRCBC65FpS61k31AB5NxIEVfTZeTu4Gc/3S94U7nJOzxl
X-Gm-Message-State: AOJu0YwPy/J8H9KbghBBxTDLCVDbqj2CKgS5A3krBpN+0EOQFTUQYrgp
 rC23XvqUQlHByg/izDFnGfTaF6PAmGP+itn1zPgJOjzFULD1FLtBQkAK7iiXpMvibzKZZEPV1eW
 LoWPJjw72+CnDzbLRUu5ZavBSTFH/ZDtH
X-Google-Smtp-Source: AGHT+IEh1knl1LGl+tqxkktAgzgc6l7ZsSdn2UuGoBrxGEzMf2dYVheKxqFogm4fd4STnQhhO6fquI1oQNjI
X-Received: by 2002:a17:906:114d:b0:a6f:a2aa:a4c7 with SMTP id
 a640c23a62f3a-a6fa2aaa594mr413859466b.3.1718898433239; 
 Thu, 20 Jun 2024 08:47:13 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6f56e560a8sm29948266b.144.2024.06.20.08.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:47:13 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <maxime@cerno.tech>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 27/31] drm/vc4: plane: Change ptr0_offset to an array
Date: Thu, 20 Jun 2024 16:46:28 +0100
Message-Id: <20240620154632.4125308-28-dave.stevenson@raspberrypi.com>
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

From: Maxime Ripard <maxime@cerno.tech>

The BCM2712 will have a fairly different dlist, that will feature one
Pointer 0 word for each plane.

Let's prepare by changing the ptr0_offset variable that holds the offset
in a dlist of the pointer 0 word to an array.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h   |  3 ++-
 drivers/gpu/drm/vc4/vc4_plane.c | 18 +++++++++---------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 294858d59e27..559118824bf7 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -15,6 +15,7 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_mm.h>
@@ -400,7 +401,7 @@ struct vc4_plane_state {
 	 */
 	u32 pos0_offset;
 	u32 pos2_offset;
-	u32 ptr0_offset;
+	u32 ptr0_offset[DRM_FORMAT_MAX_PLANES];
 	u32 lbm_offset;
 
 	/* Offset where the plane's dlist was last stored in the
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index a61a29f02be0..a4965226595d 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1256,7 +1256,7 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 	 *
 	 * The pointers may be any byte address.
 	 */
-	vc4_state->ptr0_offset = vc4_state->dlist_count;
+	vc4_state->ptr0_offset[0] = vc4_state->dlist_count;
 	for (i = 0; i < num_planes; i++)
 		vc4_dlist_write(vc4_state, vc4_state->offsets[i]);
 
@@ -1460,13 +1460,13 @@ void vc4_plane_async_set_fb(struct drm_plane *plane, struct drm_framebuffer *fb)
 	 * scanout will start from this address as soon as the FIFO
 	 * needs to refill with pixels.
 	 */
-	writel(addr, &vc4_state->hw_dlist[vc4_state->ptr0_offset]);
+	writel(addr, &vc4_state->hw_dlist[vc4_state->ptr0_offset[0]]);
 
 	/* Also update the CPU-side dlist copy, so that any later
 	 * atomic updates that don't do a new modeset on our plane
 	 * also use our updated address.
 	 */
-	vc4_state->dlist[vc4_state->ptr0_offset] = addr;
+	vc4_state->dlist[vc4_state->ptr0_offset[0]] = addr;
 
 	drm_dev_exit(idx);
 }
@@ -1530,8 +1530,8 @@ static void vc4_plane_atomic_async_update(struct drm_plane *plane,
 		new_vc4_state->dlist[vc4_state->pos0_offset];
 	vc4_state->dlist[vc4_state->pos2_offset] =
 		new_vc4_state->dlist[vc4_state->pos2_offset];
-	vc4_state->dlist[vc4_state->ptr0_offset] =
-		new_vc4_state->dlist[vc4_state->ptr0_offset];
+	vc4_state->dlist[vc4_state->ptr0_offset[0]] =
+		new_vc4_state->dlist[vc4_state->ptr0_offset[0]];
 
 	/* Note that we can't just call vc4_plane_write_dlist()
 	 * because that would smash the context data that the HVS is
@@ -1541,8 +1541,8 @@ static void vc4_plane_atomic_async_update(struct drm_plane *plane,
 	       &vc4_state->hw_dlist[vc4_state->pos0_offset]);
 	writel(vc4_state->dlist[vc4_state->pos2_offset],
 	       &vc4_state->hw_dlist[vc4_state->pos2_offset]);
-	writel(vc4_state->dlist[vc4_state->ptr0_offset],
-	       &vc4_state->hw_dlist[vc4_state->ptr0_offset]);
+	writel(vc4_state->dlist[vc4_state->ptr0_offset[0]],
+	       &vc4_state->hw_dlist[vc4_state->ptr0_offset[0]]);
 
 	drm_dev_exit(idx);
 }
@@ -1569,7 +1569,7 @@ static int vc4_plane_atomic_async_check(struct drm_plane *plane,
 	if (old_vc4_state->dlist_count != new_vc4_state->dlist_count ||
 	    old_vc4_state->pos0_offset != new_vc4_state->pos0_offset ||
 	    old_vc4_state->pos2_offset != new_vc4_state->pos2_offset ||
-	    old_vc4_state->ptr0_offset != new_vc4_state->ptr0_offset ||
+	    old_vc4_state->ptr0_offset[0] != new_vc4_state->ptr0_offset[0] ||
 	    vc4_lbm_size(plane->state) != vc4_lbm_size(new_plane_state))
 		return -EINVAL;
 
@@ -1579,7 +1579,7 @@ static int vc4_plane_atomic_async_check(struct drm_plane *plane,
 	for (i = 0; i < new_vc4_state->dlist_count; i++) {
 		if (i == new_vc4_state->pos0_offset ||
 		    i == new_vc4_state->pos2_offset ||
-		    i == new_vc4_state->ptr0_offset ||
+		    i == new_vc4_state->ptr0_offset[0] ||
 		    (new_vc4_state->lbm_offset &&
 		     i == new_vc4_state->lbm_offset))
 			continue;
-- 
2.34.1

