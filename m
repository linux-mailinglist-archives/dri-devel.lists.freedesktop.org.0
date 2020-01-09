Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C94135FBC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:51:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E322E6E92E;
	Thu,  9 Jan 2020 17:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019726E3C1;
 Thu,  9 Jan 2020 09:06:55 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a5so1996554wmb.0;
 Thu, 09 Jan 2020 01:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7k+Tp+4UTtICC+lCn58vYCXG/ReVDDdw2k8DzM6Ih5o=;
 b=lwdVWDH9iJdTkyL+UybQQ5Rk5NgJZRhgXMyA5NyyOEyiMZRZxKKLEWNgp+ojE1kJq7
 wmBdWeqDMsEG9rWcJZNl2IGcUOIemGIP8KNe8fwfkW/VvyQcRYGIIpZoa8lpnrCl35lS
 /J6wJNiqm7WaSxMn36vc2jufXLGZ+asIqKYMN0XaGDCOa+QVgshIth1y8tzIxOII2OAb
 i9hxqyV8O9GCDxbA4qFfHbTCC8vfAiqmjpQAqrfG4P9RecZLSOlH2+zvsxzrSL8wrJ/F
 kF07Kh0828ZRb3LZSRl4L864SQmvG8Ke4Smj0BF0jDhDJwfyJh+4HyyEigfTxO5GkP4g
 ALpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7k+Tp+4UTtICC+lCn58vYCXG/ReVDDdw2k8DzM6Ih5o=;
 b=Zve0Q7ykSDpof5DY1aSVxYmR/FXDTMqqy7qt6N8N2Blu9c3tFnSs5LXQD9sNz9/hoS
 3cbcCFuw+jqBUcUdNeX08wUUetnW0Zq0FTC/7y0fOaiF+Va3rJS+OMnPluIXn6Ky7jqI
 FvSuEM4A0JNbJo/xelgWJXeWbdhwZcaU3uDY3Fu4pxkIIsGSsLYMMJYG/LGRabcgX+WA
 NwIa+xHcrN2s6wATYX1nm1FEJViJM64GBiDPkfn8lpPRJ0ZtSNvgGGy88M1JqQNtXUTW
 0GefjWiuBaSPwr6Ioh3OrWH33RlCG5bomTjGrRVadzqj0I2VQV2ey1TiKd7R5hNeKtUc
 t/yg==
X-Gm-Message-State: APjAAAVj7KPUxOafriqg95kJYQU/EcD7T4HRjYLI47dk9u1JCgOhPVFE
 H6T7UhTeHE+hA5v3A+7YTzw=
X-Google-Smtp-Source: APXvYqwmtKE9R2Zakz4/sgAkRAoPFL3mtxwfw6xzl1oEAW/bAgV5Z6cMIN/cXpUQ8Xg7sIHEKpj3dA==
X-Received: by 2002:a1c:6588:: with SMTP id z130mr3621266wmb.0.1578560814630; 
 Thu, 09 Jan 2020 01:06:54 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id i8sm8004734wro.47.2020.01.09.01.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 01:06:54 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 1/5] drm/i915: conversion to new logging macros in
 i915/i915_vgpu.c
Date: Thu,  9 Jan 2020 12:06:42 +0300
Message-Id: <45e8bffff8cbffd72ed41901c3db9f7f6dbe79f3.1578560355.git.wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1578560355.git.wambui.karugax@gmail.com>
References: <cover.1578560355.git.wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jan 2020 17:51:28 +0000
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the use of printk based logging macros with the struct
drm_device based macros in i915/i915_vgpu.c

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/i915_vgpu.c | 41 +++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vgpu.c b/drivers/gpu/drm/i915/i915_vgpu.c
index 968be26735c5..4afe21662266 100644
--- a/drivers/gpu/drm/i915/i915_vgpu.c
+++ b/drivers/gpu/drm/i915/i915_vgpu.c
@@ -77,7 +77,8 @@ void i915_detect_vgpu(struct drm_i915_private *dev_priv)
 
 	shared_area = pci_iomap_range(pdev, 0, VGT_PVINFO_PAGE, VGT_PVINFO_SIZE);
 	if (!shared_area) {
-		DRM_ERROR("failed to map MMIO bar to check for VGT\n");
+		drm_err(&dev_priv->drm,
+			"failed to map MMIO bar to check for VGT\n");
 		return;
 	}
 
@@ -87,7 +88,7 @@ void i915_detect_vgpu(struct drm_i915_private *dev_priv)
 
 	version_major = readw(shared_area + vgtif_offset(version_major));
 	if (version_major < VGT_VERSION_MAJOR) {
-		DRM_INFO("VGT interface version mismatch!\n");
+		drm_info(&dev_priv->drm, "VGT interface version mismatch!\n");
 		goto out;
 	}
 
@@ -95,7 +96,7 @@ void i915_detect_vgpu(struct drm_i915_private *dev_priv)
 
 	dev_priv->vgpu.active = true;
 	mutex_init(&dev_priv->vgpu.lock);
-	DRM_INFO("Virtual GPU for Intel GVT-g detected.\n");
+	drm_info(&dev_priv->drm, "Virtual GPU for Intel GVT-g detected.\n");
 
 out:
 	pci_iounmap(pdev, shared_area);
@@ -120,13 +121,15 @@ static struct _balloon_info_ bl_info;
 static void vgt_deballoon_space(struct i915_ggtt *ggtt,
 				struct drm_mm_node *node)
 {
+	struct drm_i915_private *dev_priv = ggtt->vm.i915;
 	if (!drm_mm_node_allocated(node))
 		return;
 
-	DRM_DEBUG_DRIVER("deballoon space: range [0x%llx - 0x%llx] %llu KiB.\n",
-			 node->start,
-			 node->start + node->size,
-			 node->size / 1024);
+	drm_dbg(&dev_priv->drm,
+		"deballoon space: range [0x%llx - 0x%llx] %llu KiB.\n",
+		node->start,
+		node->start + node->size,
+		node->size / 1024);
 
 	ggtt->vm.reserved -= node->size;
 	drm_mm_remove_node(node);
@@ -141,12 +144,13 @@ static void vgt_deballoon_space(struct i915_ggtt *ggtt,
  */
 void intel_vgt_deballoon(struct i915_ggtt *ggtt)
 {
+	struct drm_i915_private *dev_priv = ggtt->vm.i915;
 	int i;
 
 	if (!intel_vgpu_active(ggtt->vm.i915))
 		return;
 
-	DRM_DEBUG("VGT deballoon.\n");
+	drm_dbg(&dev_priv->drm, "VGT deballoon.\n");
 
 	for (i = 0; i < 4; i++)
 		vgt_deballoon_space(ggtt, &bl_info.space[i]);
@@ -156,13 +160,15 @@ static int vgt_balloon_space(struct i915_ggtt *ggtt,
 			     struct drm_mm_node *node,
 			     unsigned long start, unsigned long end)
 {
+	struct drm_i915_private *dev_priv = ggtt->vm.i915;
 	unsigned long size = end - start;
 	int ret;
 
 	if (start >= end)
 		return -EINVAL;
 
-	DRM_INFO("balloon space: range [ 0x%lx - 0x%lx ] %lu KiB.\n",
+	drm_info(&dev_priv->drm,
+		 "balloon space: range [ 0x%lx - 0x%lx ] %lu KiB.\n",
 		 start, end, size / 1024);
 	ret = i915_gem_gtt_reserve(&ggtt->vm, node,
 				   size, start, I915_COLOR_UNEVICTABLE,
@@ -219,7 +225,8 @@ static int vgt_balloon_space(struct i915_ggtt *ggtt,
  */
 int intel_vgt_balloon(struct i915_ggtt *ggtt)
 {
-	struct intel_uncore *uncore = &ggtt->vm.i915->uncore;
+	struct drm_i915_private *dev_priv = ggtt->vm.i915;
+	struct intel_uncore *uncore = &dev_priv->uncore;
 	unsigned long ggtt_end = ggtt->vm.total;
 
 	unsigned long mappable_base, mappable_size, mappable_end;
@@ -241,16 +248,18 @@ int intel_vgt_balloon(struct i915_ggtt *ggtt)
 	mappable_end = mappable_base + mappable_size;
 	unmappable_end = unmappable_base + unmappable_size;
 
-	DRM_INFO("VGT ballooning configuration:\n");
-	DRM_INFO("Mappable graphic memory: base 0x%lx size %ldKiB\n",
+	drm_info(&dev_priv->drm, "VGT ballooning configuration:\n");
+	drm_info(&dev_priv->drm,
+		 "Mappable graphic memory: base 0x%lx size %ldKiB\n",
 		 mappable_base, mappable_size / 1024);
-	DRM_INFO("Unmappable graphic memory: base 0x%lx size %ldKiB\n",
+	drm_info(&dev_priv->drm,
+		 "Unmappable graphic memory: base 0x%lx size %ldKiB\n",
 		 unmappable_base, unmappable_size / 1024);
 
 	if (mappable_end > ggtt->mappable_end ||
 	    unmappable_base < ggtt->mappable_end ||
 	    unmappable_end > ggtt_end) {
-		DRM_ERROR("Invalid ballooning configuration!\n");
+		drm_err(&dev_priv->drm, "Invalid ballooning configuration!\n");
 		return -EINVAL;
 	}
 
@@ -287,7 +296,7 @@ int intel_vgt_balloon(struct i915_ggtt *ggtt)
 			goto err_below_mappable;
 	}
 
-	DRM_INFO("VGT balloon successfully\n");
+	drm_info(&dev_priv->drm, "VGT balloon successfully\n");
 	return 0;
 
 err_below_mappable:
@@ -297,6 +306,6 @@ int intel_vgt_balloon(struct i915_ggtt *ggtt)
 err_upon_mappable:
 	vgt_deballoon_space(ggtt, &bl_info.space[2]);
 err:
-	DRM_ERROR("VGT balloon fail\n");
+	drm_err(&dev_priv->drm, "VGT balloon fail\n");
 	return ret;
 }
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
