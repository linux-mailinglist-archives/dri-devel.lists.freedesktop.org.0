Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3BE41FCCC
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 17:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9DF6E831;
	Sat,  2 Oct 2021 15:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAF76E831
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 15:45:49 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id o13so1721694qvm.4
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 08:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4gOYVh6Yva2alEH7ZGpOOHZ9N2b/UBMnX114WFSqsEk=;
 b=V/jgQoRV4RGYOWHs2+Gq4Oe+r7BvB1P55AMrEjzALOvS967ylGVeD7NzZMdFlf5i6h
 xclngoThNvtXbmw1VsM/FFmMxZwj2caxC/JyP9uwb+VnG9AR3VGwbNrT2q6bUXHGQcad
 eIkVuYwQiiXDQjX5rN9nnlrVWYA+xaNk7BNa/h+PWnAXkhs5Uvgpuyrv8Bwl2FRLOG7v
 3NCKGqNUEaZ8pT/I2nv7OTHJkSvdOBDesC3NDNfH1Uq7l6OoawitdN7J245m/6EtMdfb
 WXLf4V/ptdc5vjlfBKni78019+Y5fKjg8kO4Q5+VybjS+zE1sw22uebEcXr59IgtZzig
 4zMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4gOYVh6Yva2alEH7ZGpOOHZ9N2b/UBMnX114WFSqsEk=;
 b=4qjWyM1oZRTI/lV+9xK0exDQxtaF8SCA/b91+BDSWLTxD9HsYz5Jfw7VN4NxN/cddS
 oF9iZaFX7finNOSVm9PO5FWDMNVv56ktv0RzdG+nY5h1T74Qt8Mn2tUD8+2VnfG87F7j
 0MFeBBNF2F7HC9MCaJlhQCercc5lWlqAd2pu75rfHDXUedhu7Oq91orbxpxiWhz+2S58
 2N9YlkNkEWr9o0yUmVqDjXcH2IhNsD8cJXERg/eqipDu84a0srNwpjs3jf6lfv2sWpkY
 p7fzWPN3f8R/4yM3xaBtD90Jkfw5zglyCnllCXs43dl5g1nTnzCUnIio12GQTVC+5WDz
 kQbg==
X-Gm-Message-State: AOAM530Nwa9Afrq6r3cWa+oZJkROU0ZwbtcHyZQA+DtdgFdJGLSQNcG3
 VHrc7Q0UYAYfX+s3wN3iRvjzh7cEzWbtug==
X-Google-Smtp-Source: ABdhPJzWnFP4rWeaYExIBXzFlmMX/X/61BBpsdiYJWY1FOcPnGx3lWZO3CAKo1uYvQHDAVtpyZuzAg==
X-Received: by 2002:a0c:8e45:: with SMTP id w5mr14209532qvb.17.1633189548622; 
 Sat, 02 Oct 2021 08:45:48 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id o21sm5384011qtq.43.2021.10.02.08.45.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 02 Oct 2021 08:45:48 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Fernando Ramos <greenfoo@u92.eu>
Subject: [PATCH 04/16] Revert "drm/i915: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN() part 2"
Date: Sat,  2 Oct 2021 11:45:30 -0400
Message-Id: <20211002154542.15800-4-sean@poorly.run>
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

This reverts commit 984c9949f1c4cf36c35aa2de5ee2b65c39379fd9.

This patchset breaks on intel platforms and was previously NACK'd by
Ville.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fernando Ramos <greenfoo@u92.eu>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/i915/display/intel_overlay.c | 40 ++++++++++----------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index c623738c59c8..c0ee135e5499 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -1105,7 +1105,6 @@ int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
 	struct drm_crtc *drmmode_crtc;
 	struct intel_crtc *crtc;
 	struct drm_i915_gem_object *new_bo;
-	struct drm_modeset_acquire_ctx ctx;
 	int ret;
 
 	overlay = dev_priv->overlay;
@@ -1114,24 +1113,24 @@ int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
 		return -ENODEV;
 	}
 
-	if (params->flags & I915_OVERLAY_ENABLE) {
-
-		drmmode_crtc = drm_crtc_find(dev, file_priv, params->crtc_id);
-		if (!drmmode_crtc)
-			return -ENOENT;
-		crtc = to_intel_crtc(drmmode_crtc);
+	if (!(params->flags & I915_OVERLAY_ENABLE)) {
+		drm_modeset_lock_all(dev);
+		ret = intel_overlay_switch_off(overlay);
+		drm_modeset_unlock_all(dev);
 
-		new_bo = i915_gem_object_lookup(file_priv, params->bo_handle);
-		if (!new_bo)
-			return -ENOENT;
+		return ret;
 	}
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drmmode_crtc = drm_crtc_find(dev, file_priv, params->crtc_id);
+	if (!drmmode_crtc)
+		return -ENOENT;
+	crtc = to_intel_crtc(drmmode_crtc);
 
-	if (!(params->flags & I915_OVERLAY_ENABLE)) {
-		ret = intel_overlay_switch_off(overlay);
-		goto out_unlock;
-	}
+	new_bo = i915_gem_object_lookup(file_priv, params->bo_handle);
+	if (!new_bo)
+		return -ENOENT;
+
+	drm_modeset_lock_all(dev);
 
 	if (i915_gem_object_is_tiled(new_bo)) {
 		drm_dbg_kms(&dev_priv->drm,
@@ -1196,11 +1195,14 @@ int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
 	if (ret != 0)
 		goto out_unlock;
 
-out_unlock:
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+	drm_modeset_unlock_all(dev);
+	i915_gem_object_put(new_bo);
+
+	return 0;
 
-	if (params->flags & I915_OVERLAY_ENABLE)
-		i915_gem_object_put(new_bo);
+out_unlock:
+	drm_modeset_unlock_all(dev);
+	i915_gem_object_put(new_bo);
 
 	return ret;
 }
-- 
Sean Paul, Software Engineer, Google / Chromium OS

