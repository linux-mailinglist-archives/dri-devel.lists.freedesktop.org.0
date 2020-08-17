Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6232477C4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 21:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751C68984E;
	Mon, 17 Aug 2020 19:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0134C8984E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 19:58:52 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id 2so16107533qkf.10
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 12:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=xU/OG6O79qAJpRUJHqCBtq8zJaVc3EZyZVdl+5wcZRM=;
 b=Ko4qegpWNtFSVLEeQI4gXqPbS8llypdR84EVgC3gY4CMu+A100ob3JNemmxAABbqk3
 G5E4ty8S0zoJB7/ciDC6/5/hYKri7FdVmcn7tYCUrE88d3L0euuwzIanbSYGKpRJ9LQi
 TgkY0sCCRiJct8GRsjWFcczcs6ErkzltXtL43Ez3niR1X0a13YiWQfG9H3BrGFJdoDsL
 bcAVZLeqi8HTlc8ytpiLpkafA6uu2aYk3PfISy/HGQMfGGnQ0p1JMonSsa1m5E6dCHTz
 Mg84cpt57IsjDSufU06nt/94y9cof1jcAyeF5OuMl7erca2qi1wT/jk7s9RRwV2/RZmM
 zpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xU/OG6O79qAJpRUJHqCBtq8zJaVc3EZyZVdl+5wcZRM=;
 b=uLLL4Tv8BFvbxGvQOnL3vEaHtTBJ3/G7+FP+N0qgR8Nyu3YhNfdQQiKcef8THXX3dZ
 yPqPXg2H7NpbV9c/xh9ZTqRFV/cVnHwGLYWpW/lX874TInPC14oslAS4XzQIMT1FtASt
 vTtws9Au2Q0RESRdwvArBUn2GgGW3Ds2ZvRJooQ1gRtDQ1c+VaIhfHHIO7l5wdSr5/BD
 B7gKY5TqExboYd6SYKxBcoWNXGTbVOJHDf864ZOY0gGbeBDWsLISKwy238k1xqQA2BAC
 VyfGdwU1AJeVPD1GFu8ssfJf4q2q6N22RHFY8iFM+npYn7UV3uLGhyz+Rk11wV8g2Sb3
 LJBw==
X-Gm-Message-State: AOAM530gOHkVDXd7DYkTdeSDmw0ORhkGvbYuUFDDa2vHNXxnXKWOxl4G
 rDAH0zRMUZf8UofGR+Yg3wqsnm4AmfduVg==
X-Google-Smtp-Source: ABdhPJzBYAedRoy68cQ0vEr2YM3vkFw8UixJcb006ITTDtCA7o6bIk9pvIQafxDkxq6fGfGJ4rBQ8Q==
X-Received: by 2002:a37:afc3:: with SMTP id y186mr14469113qke.36.1597694331908; 
 Mon, 17 Aug 2020 12:58:51 -0700 (PDT)
Received: from localhost (mobile-166-170-57-110.mycingular.net.
 [166.170.57.110])
 by smtp.gmail.com with ESMTPSA id k55sm20463099qtf.17.2020.08.17.12.58.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Aug 2020 12:58:51 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/qxl: Fix build errors
Date: Mon, 17 Aug 2020 15:58:38 -0400
Message-Id: <20200817195846.14076-1-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
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
Cc: David Airlie <airlied@linux.ie>, virtualization@lists.linux-foundation.org,
 Sean Paul <seanpaul@chromium.org>, Gerd Hoffmann <kraxel@redhat.com>,
 spice-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Sidong Yang <realwakka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Introduced in the patch below, the END macro was missing 'dev' and BEGIN
macro needs drm_drv_uses_atomic_modeset() from drm_drv.h

Fixes: bbaac1354cc9 ("drm/qxl: Replace deprecated function in qxl_display")
Cc: Sidong Yang <realwakka@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: virtualization@lists.linux-foundation.org
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/qxl/qxl_display.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index fa79688013b7..5b4fd6952b53 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -28,6 +28,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
@@ -186,7 +187,7 @@ void qxl_display_read_client_monitors_config(struct qxl_device *qdev)
 
 	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret);
 	qxl_update_offset_props(qdev);
-	DRM_MODESET_LOCK_ALL_END(ctx, ret);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 	if (!drm_helper_hpd_irq_event(dev)) {
 		/* notify that the monitor configuration changed, to
 		   adjust at the arbitrary resolution */
@@ -431,7 +432,7 @@ static int qxl_framebuffer_surface_dirty(struct drm_framebuffer *fb,
 			  clips, num_clips, inc, 0);
 
 out_lock_end:
-	DRM_MODESET_LOCK_ALL_END(ctx, ret);
+	DRM_MODESET_LOCK_ALL_END(fb->dev, ctx, ret);
 
 	return 0;
 }
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
