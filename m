Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DAC2A6123
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 11:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A9F6E98B;
	Wed,  4 Nov 2020 10:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BF96E98C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 10:04:40 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x7so21389420wrl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 02:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1AdBIa0cBhVp3S3an6xeKcOswcKY99MgBh5ON+nH5iI=;
 b=QnYDYXTZQeVE4/fWKmIcmAbVahRJcqJsSnqP+WfCL/2wGTbiihFqwg86iALWEeRYwD
 M6Rd3EjuwNpMzdM2FgSaE0EDFZwJawtgcRTOYEwnDJ/Uzd5nQgoIUBqro8LQVBvrZvHW
 Cy9whySLQJFhe0Bw7WenonsDYHueDh2QYZ+rE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1AdBIa0cBhVp3S3an6xeKcOswcKY99MgBh5ON+nH5iI=;
 b=mo+Hhe5lDZPKMO+q6CRR4MQw07dlk363Ncs170NyQLpaiJyHsiFPnTFgclykvI72Ml
 1VCFWXUl/VuM+bBdbAOXgVlkrKLOeRhWUe8rdNdFfamHLZxerRokuXK8sO2ypIf+E9fl
 XMEFvFo8AuJMQRd4KSOlQsF77ADOEGEMqvCMlQWAbpcaSI2kFg4s+TEdZ3b/1e5b34Kg
 2349jQd0qgR8qMa4mSQjCz+Y6usuMNevf7psD+APT6sGurTNYhXohb+MC9bUxTnl+MZj
 Kud6nJGKSUTRyxuGxYAof4tG+joxp6tKJ3jJeDE2xkkMpQpqHTyT9meIJt2+jR2P6wDv
 4w0g==
X-Gm-Message-State: AOAM5312Utq3niyrBbv4yPqqm995fPIvPAXqNg2/9hmV9uuU3HaWm83N
 lBm15ukrfM2GS7ca63MtxxvvVP3iF0MV058s
X-Google-Smtp-Source: ABdhPJyH8Bg576XH91njO4S+mkY3X/aDBHm/tsBcgW3WKw3eAEkZBXpPyWxJ/uMWw5FdOZ1zEWSqtA==
X-Received: by 2002:adf:8366:: with SMTP id 93mr2549745wrd.321.1604484278506; 
 Wed, 04 Nov 2020 02:04:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n23sm120113wmk.24.2020.11.04.02.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 02:04:37 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 6/6] drm/amdgpu: Make struct drm_driver const
Date: Wed,  4 Nov 2020 11:04:25 +0100
Message-Id: <20201104100425.1922351-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201104100425.1922351-1-daniel.vetter@ffwll.ch>
References: <20201104100425.1922351-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Luben Tuikov <luben.tuikov@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Luben Tuikov <luben.tuikov@amd.com>

Make the definition of struct drm_driver
a constant, to follow the latest developments
in the DRM layer.

Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
[danvet: Rebase onto devm_drm_dev_alloc patch and drop the freesync
ioctl line again that escaped from internal trees.]
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 31 +++++++++++++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 24 +------------------
 2 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 8b30915aa972..d6fced7a9a03 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -40,6 +40,7 @@
 #include "amdgpu.h"
 #include "amdgpu_irq.h"
 #include "amdgpu_dma_buf.h"
+#include "amdgpu_sched.h"
 
 #include "amdgpu_amdkfd.h"
 
@@ -1094,7 +1095,7 @@ static const struct pci_device_id pciidlist[] = {
 
 MODULE_DEVICE_TABLE(pci, pciidlist);
 
-static struct drm_driver kms_driver;
+static const struct drm_driver amdgpu_kms_driver;
 
 static int amdgpu_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *ent)
@@ -1165,7 +1166,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	adev = devm_drm_dev_alloc(&pdev->dev, &kms_driver, typeof(*adev), ddev);
+	adev = devm_drm_dev_alloc(&pdev->dev, &amdgpu_kms_driver, typeof(*adev), ddev);
 	if (IS_ERR(adev))
 		return PTR_ERR(adev);
 
@@ -1509,7 +1510,29 @@ int amdgpu_file_to_fpriv(struct file *filp, struct amdgpu_fpriv **fpriv)
 	return 0;
 }
 
-static struct drm_driver kms_driver = {
+int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp);
+
+const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
+	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_CREATE, amdgpu_gem_create_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_CTX, amdgpu_ctx_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_VM, amdgpu_vm_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_SCHED, amdgpu_sched_ioctl, DRM_MASTER),
+	DRM_IOCTL_DEF_DRV(AMDGPU_BO_LIST, amdgpu_bo_list_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_FENCE_TO_HANDLE, amdgpu_cs_fence_to_handle_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	/* KMS */
+	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_MMAP, amdgpu_gem_mmap_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_WAIT_IDLE, amdgpu_gem_wait_idle_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_CS, amdgpu_cs_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_INFO, amdgpu_info_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_WAIT_CS, amdgpu_cs_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_WAIT_FENCES, amdgpu_cs_wait_fences_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_METADATA, amdgpu_gem_metadata_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_VA, amdgpu_gem_va_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_OP, amdgpu_gem_op_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_USERPTR, amdgpu_gem_userptr_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+};
+
+static const struct drm_driver amdgpu_kms_driver = {
 	.driver_features =
 	    DRIVER_ATOMIC |
 	    DRIVER_GEM |
@@ -1520,6 +1543,7 @@ static struct drm_driver kms_driver = {
 	.lastclose = amdgpu_driver_lastclose_kms,
 	.irq_handler = amdgpu_irq_handler,
 	.ioctls = amdgpu_ioctls_kms,
+	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
 	.dumb_create = amdgpu_mode_dumb_create,
 	.dumb_map_offset = amdgpu_mode_dumb_mmap,
 	.fops = &amdgpu_driver_kms_fops,
@@ -1572,7 +1596,6 @@ static int __init amdgpu_init(void)
 		goto error_fence;
 
 	DRM_INFO("amdgpu kernel modesetting enabled.\n");
-	kms_driver.num_ioctls = amdgpu_max_kms_ioctl;
 	amdgpu_register_atpx_handler();
 
 	/* Ignore KFD init failures. Normal when CONFIG_HSA_AMD is not set. */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index efda38349a03..ab6d9f1186c2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -29,7 +29,6 @@
 #include "amdgpu.h"
 #include <drm/drm_debugfs.h>
 #include <drm/amdgpu_drm.h>
-#include "amdgpu_sched.h"
 #include "amdgpu_uvd.h"
 #include "amdgpu_vce.h"
 #include "atom.h"
@@ -480,7 +479,7 @@ static int amdgpu_hw_ip_info(struct amdgpu_device *adev,
  * etc. (all asics).
  * Returns 0 on success, -EINVAL on failure.
  */
-static int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
+int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 {
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_amdgpu_info *info = data;
@@ -1243,27 +1242,6 @@ void amdgpu_disable_vblank_kms(struct drm_crtc *crtc)
 	amdgpu_irq_put(adev, &adev->crtc_irq, idx);
 }
 
-const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
-	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_CREATE, amdgpu_gem_create_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_CTX, amdgpu_ctx_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_VM, amdgpu_vm_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_SCHED, amdgpu_sched_ioctl, DRM_MASTER),
-	DRM_IOCTL_DEF_DRV(AMDGPU_BO_LIST, amdgpu_bo_list_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_FENCE_TO_HANDLE, amdgpu_cs_fence_to_handle_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	/* KMS */
-	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_MMAP, amdgpu_gem_mmap_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_WAIT_IDLE, amdgpu_gem_wait_idle_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_CS, amdgpu_cs_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_INFO, amdgpu_info_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_WAIT_CS, amdgpu_cs_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_WAIT_FENCES, amdgpu_cs_wait_fences_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_METADATA, amdgpu_gem_metadata_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_VA, amdgpu_gem_va_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_OP, amdgpu_gem_op_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_USERPTR, amdgpu_gem_userptr_ioctl, DRM_AUTH|DRM_RENDER_ALLOW)
-};
-const int amdgpu_max_kms_ioctl = ARRAY_SIZE(amdgpu_ioctls_kms);
-
 /*
  * Debugfs info
  */
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
