Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3275E41FCD7
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 17:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5316F4B2;
	Sat,  2 Oct 2021 15:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B99F6F4B0
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 15:46:00 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id i132so12240765qke.1
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 08:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qygAcBAWFsoOhpHahIhQmNbnPqS/eGrHT7CMxH+Ayqw=;
 b=COBVGE27xTU+QE8WQmBhKLRmiBNgibqSp2qtJrQhCcxHMkQkjYyeyNlUdl6C+AQfu1
 BcQE6uQfty834vUeGqdmq/HBMnIcUZ6VWPCwoeooMzZii7WKFYWgyEQzEUoI/u2Y9RQq
 ewAjO9gpuDXgNRJ/Ioyx2THP358a58QmsPki88noKirgQqlzLhShAbaaUxU7BQkPLZon
 si8IMaTm/akhBY3cJ+QtM/HLLzaHbC+uzG6T/GHPjvh7UVKRnbmQkvXUNIxkpALnAgHU
 xa4KsAs4oa9OMFQWOG1XN8SVZ0rutaAMBjncgerAVGtVgCfIlp6ZeC9tLvhm1aCHtgJE
 2fCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qygAcBAWFsoOhpHahIhQmNbnPqS/eGrHT7CMxH+Ayqw=;
 b=gtaUwu0GLTbcU2g7mDtKOZq/2uXLRJ9zBXVDL8rmBWDcdpeInqqcXyfemOq3kO8xZ+
 Z9+ONPXwJfiDFH7YxtM17UDY6qKeCVwy7rPT76sdCXOh+16e2gvLexS0qVRptv0IAIxi
 TCZjfUCVquQ4ebE9xSj/GuPtZ8H2YDD/fBH9dy378TTQ0Kccjo/pdPWnxqCkUeJVH2IC
 mjt5Hr1VgVyCQYAorgHJ5VjobbyrvCaI3ePyk9DUiOfBO7Nrlv8L7tjbWubK9R9+a6n4
 7BuFsD4xoRUvIRNFJVT/X6tkqrQmYQOxh/bAaGkN9pHJ0MKtuhULAw1M6N9ib0wMv0Eo
 LDvQ==
X-Gm-Message-State: AOAM532l0DjVKfFUAFpgmer5+K+3SRRduZJDU6NfiMTQzyW+qE/yqCcH
 al/ErgUc7+jUw7xtwa7dpESxVhKvNZIMTw==
X-Google-Smtp-Source: ABdhPJwv1l3CExyL+wooUQcn8ZX5fAr3rg3gs7CqKxwLP1rzUdNcsOS4+oRtv5hxoil7py1dWGCldA==
X-Received: by 2002:a37:a985:: with SMTP id s127mr2860534qke.214.1633189559583; 
 Sat, 02 Oct 2021 08:45:59 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id u189sm4725214qkh.14.2021.10.02.08.45.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 02 Oct 2021 08:45:59 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Fernando Ramos <greenfoo@u92.eu>
Subject: [PATCH 12/16] Revert "drm/vmwgfx: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()"
Date: Sat,  2 Oct 2021 11:45:38 -0400
Message-Id: <20211002154542.15800-12-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211002154542.15800-1-sean@poorly.run>
References: <20211002154542.15800-1-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Sean Paul <seanpaul@chromium.org>

This reverts commit 6b92e77156c5adf6606c8ad825c71404417d88af.

This patchset breaks on intel platforms and was previously NACK'd by
Ville.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fernando Ramos <greenfoo@u92.eu>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c | 11 ++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c   | 12 ++++--------
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
index 7df35c6f1458..28af34ab6ed6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
@@ -28,7 +28,6 @@
 #include "vmwgfx_drv.h"
 #include "vmwgfx_devcaps.h"
 #include <drm/vmwgfx_drm.h>
-#include <drm/drm_drv.h>
 #include "vmwgfx_kms.h"
 
 int vmw_getparam_ioctl(struct drm_device *dev, void *data,
@@ -173,7 +172,6 @@ int vmw_present_ioctl(struct drm_device *dev, void *data,
 	struct drm_vmw_rect __user *clips_ptr;
 	struct drm_vmw_rect *clips = NULL;
 	struct drm_framebuffer *fb;
-	struct drm_modeset_acquire_ctx ctx;
 	struct vmw_framebuffer *vfb;
 	struct vmw_resource *res;
 	uint32_t num_clips;
@@ -205,7 +203,7 @@ int vmw_present_ioctl(struct drm_device *dev, void *data,
 		goto out_no_copy;
 	}
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_lock_all(dev);
 
 	fb = drm_framebuffer_lookup(dev, file_priv, arg->fb_id);
 	if (!fb) {
@@ -233,7 +231,7 @@ int vmw_present_ioctl(struct drm_device *dev, void *data,
 out_no_surface:
 	drm_framebuffer_put(fb);
 out_no_fb:
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+	drm_modeset_unlock_all(dev);
 out_no_copy:
 	kfree(clips);
 out_clips:
@@ -252,7 +250,6 @@ int vmw_present_readback_ioctl(struct drm_device *dev, void *data,
 	struct drm_vmw_rect __user *clips_ptr;
 	struct drm_vmw_rect *clips = NULL;
 	struct drm_framebuffer *fb;
-	struct drm_modeset_acquire_ctx ctx;
 	struct vmw_framebuffer *vfb;
 	uint32_t num_clips;
 	int ret;
@@ -283,7 +280,7 @@ int vmw_present_readback_ioctl(struct drm_device *dev, void *data,
 		goto out_no_copy;
 	}
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_lock_all(dev);
 
 	fb = drm_framebuffer_lookup(dev, file_priv, arg->fb_id);
 	if (!fb) {
@@ -306,7 +303,7 @@ int vmw_present_readback_ioctl(struct drm_device *dev, void *data,
 out_no_ttm_lock:
 	drm_framebuffer_put(fb);
 out_no_fb:
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+	drm_modeset_unlock_all(dev);
 out_no_copy:
 	kfree(clips);
 out_clips:
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 268095cb8c84..74fa41909213 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -33,7 +33,6 @@
 #include <drm/drm_rect.h>
 #include <drm/drm_sysfs.h>
 #include <drm/drm_vblank.h>
-#include <drm/drm_drv.h>
 
 #include "vmwgfx_kms.h"
 
@@ -244,17 +243,15 @@ void vmw_kms_legacy_hotspot_clear(struct vmw_private *dev_priv)
 	struct drm_device *dev = &dev_priv->drm;
 	struct vmw_display_unit *du;
 	struct drm_crtc *crtc;
-	struct drm_modeset_acquire_ctx ctx;
-	int ret;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_lock_all(dev);
 	drm_for_each_crtc(crtc, dev) {
 		du = vmw_crtc_to_du(crtc);
 
 		du->hotspot_x = 0;
 		du->hotspot_y = 0;
 	}
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+	drm_modeset_unlock_all(dev);
 }
 
 void vmw_kms_cursor_post_execbuf(struct vmw_private *dev_priv)
@@ -1015,10 +1012,9 @@ static int vmw_framebuffer_bo_dirty(struct drm_framebuffer *framebuffer,
 	struct vmw_framebuffer_bo *vfbd =
 		vmw_framebuffer_to_vfbd(framebuffer);
 	struct drm_clip_rect norect;
-	struct drm_modeset_acquire_ctx ctx;
 	int ret, increment = 1;
 
-	DRM_MODESET_LOCK_ALL_BEGIN((&dev_priv->drm), ctx, 0, ret);
+	drm_modeset_lock_all(&dev_priv->drm);
 
 	if (!num_clips) {
 		num_clips = 1;
@@ -1044,7 +1040,7 @@ static int vmw_framebuffer_bo_dirty(struct drm_framebuffer *framebuffer,
 
 	vmw_cmd_flush(dev_priv, false);
 
-	DRM_MODESET_LOCK_ALL_END((&dev_priv->drm), ctx, ret);
+	drm_modeset_unlock_all(&dev_priv->drm);
 
 	return ret;
 }
-- 
Sean Paul, Software Engineer, Google / Chromium OS

