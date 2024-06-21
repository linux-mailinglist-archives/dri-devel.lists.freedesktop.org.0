Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F6891296E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3CB810F1FA;
	Fri, 21 Jun 2024 15:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="HMIwVgR3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f97.google.com (mail-ej1-f97.google.com
 [209.85.218.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D18510F1FE
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:46 +0000 (UTC)
Received: by mail-ej1-f97.google.com with SMTP id
 a640c23a62f3a-a6efae34c83so247807466b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983305; x=1719588105;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZYJwtcOqwrnKVFfORvu/VqdSy/K8m8HV2ZVw+Di+eNc=;
 b=HMIwVgR3vcJrx9WAX+6vyuLtI0GKlXR7eKDk7AelbOM3HEV0mnRiHjmZNsO9uZTHb8
 DfHdflnbn9fYEa58CiWjkb9aAuYnHK2k9p3nXk+33bV9uGhs5Mc+AFTrViGVxxQ6R/z1
 178/3OUSPX3pQBeVrxJL4ETCykgVj2I143wURnQGCmJfknLUfc/+HvGZpWsu3bIfbLge
 qlWtUS3TiMIwJdlNI00vDDRpwXx1nlcsSL6tLfcJ21PXhG4gXsdTQlGHXQk07PA5aKkF
 ApA4TFhzIECwF5XjwNdx1NbMNG8luy8kChnP4qpuOAIYPJnc5sRP+DHNYySKM7M5Kocg
 OTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983305; x=1719588105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZYJwtcOqwrnKVFfORvu/VqdSy/K8m8HV2ZVw+Di+eNc=;
 b=YQr49hHd7eByjliU3eQ20MnDKKVFsssgpexkNGBmJWyWDCbWchCe8YYAWm8gx6PZbg
 5cHvnnfjbyH+/GJ0ToB06Lu0Rig4fg9hbfmefjuv7aN688qWL9FViRLXHGhe+fT7aFf0
 aiCw+CTyPJrDEA2GuUEKC9ZcG+sEjW0w1wXcMyO4z2B5SfawWwFwoAPrU/WTcQ98GvYr
 s+U2U9jl/Ueao3ohI2+0DMVUusXxXyGXmbF8miunTv5gm06IIIzFpViArqdpbC4IEEjs
 ayQi/uPGx3LL4OVoe5eYXmjtLKW7BP7sj8oF+W0uV4Tl0FM0sj/Qgd+Vzp9L2zQWinio
 pwvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwhSAohd5HyhZC/J7z4bW5WM0JxF+n2uBggl1sQBgth5R4Catczz18QYPG+SkHAdQA4pJhaIg9dT71fEVdWtoSZIbO7zufGh2WWsFh13E2
X-Gm-Message-State: AOJu0YwDajN192IX/jQIITD2YEVKdAWI0mm1lr9O9p6XbBVTBIKcVc2i
 DZaW2YYaFMAAMpP+pWuveMXUjfIYTIff/XtdWXO4QSSBiP6RXXU4DPoMdYmMrOfhMcfHA6b7UBp
 5/ufGsHHCMkat1AhIWj3Xgag0dOnfEf9Z
X-Google-Smtp-Source: AGHT+IF75Fl07AydNIYzBpypOLKRs8lzR0slbwcQZEadjilH7h56lbRSEBcPecXku40Z0AqVpaE6r4gRjtPO
X-Received: by 2002:a17:906:ba84:b0:a6f:4c39:8aeb with SMTP id
 a640c23a62f3a-a6fab779ba8mr525626766b.50.1718983305090; 
 Fri, 21 Jun 2024 08:21:45 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6fcf5491fcsm5289566b.130.2024.06.21.08.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:45 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 26/31] drm/vc4: plane: Change ptr0_offset to an array
Date: Fri, 21 Jun 2024 16:20:50 +0100
Message-Id: <20240621152055.4180873-27-dave.stevenson@raspberrypi.com>
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

