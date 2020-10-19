Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0480D292FB3
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 22:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055A56EA98;
	Mon, 19 Oct 2020 20:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB766EA98;
 Mon, 19 Oct 2020 20:45:39 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id h2so406880pll.11;
 Mon, 19 Oct 2020 13:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x2ttR3YbRc7ZkDDRV6Xh9q9XbpPFalzSaZjshdY64+Y=;
 b=TOhsBLCY9vqJS7rDvq+ox90PVZRASxk1goedv3e8Nd68l+ZDpRdVyumNOHcP+6ir2I
 xJADRcwvNjxA+1etGBCgAVJ6xE9QdRqybv1lbUIwqD3cGTr1lsuOki+y/nU3FAsI1y9+
 N9SOo3LfD2iNJ5flL5coj82lDVidbIrtYDBw+gCF3zUsNX4FYb4PcMc+ssSuh3ZbPVhw
 lEZa7siIamuFHlp/dKKPUn2+lYqlqr0UvnGJoOr/jjnb6j58DQd3dFSJoRXMRnQQ/8PZ
 SHMIbdx845kvZ9P6ZTJM7DgTFkwvgTf07RlPbA3jxifWaqS+oTVeQaG81Qqn4BNipNwI
 vquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x2ttR3YbRc7ZkDDRV6Xh9q9XbpPFalzSaZjshdY64+Y=;
 b=EYxAH7+FdfbCKupi9o1r+z4V36dN7XeCluAIQkgh+Vu+9Lbdtk8pzunKihSytK7ujp
 tWNk5mnHWHOW7x7yCMgDhswUVXZv9t4uA8cLuH82xyY01hrZWzeZfNSKtP2kuQw1ojB6
 IPVuQOeaNCMTMsig1Hg5dIzBK/pqA6rXQAgUcTjMRHDX8UExdy39tT5NvDPZYc6kpt3/
 WRjK0/UpQ35ddLcoQpvNl6+81Nc1w7R4CwWmgfPFPwNibcrYIB+hu0YMRq0m2c6rvQ56
 V3itsXCy44Db6tfniAFya+OHDwehjs3x2z4au3K2uM0CuXb/sNqXPK9c7cTNPtRkeA+p
 nFLw==
X-Gm-Message-State: AOAM530DEZtJpJfRKMfxOhDMoXl2FjOW2Q8ZGdAILLY5UuA9pWZqpnlS
 cUr7gjWvyP0DQPw4c8+v2hVTCKkUKj96pg==
X-Google-Smtp-Source: ABdhPJyYYb3WKJSsrkwwCwh05IhQqWlH0q7cuf6VjnpcgnO8WFbmR6tZO+wFfW5LZkr+BLrU7Qt6eg==
X-Received: by 2002:a17:902:9f94:b029:d5:aad0:d18a with SMTP id
 g20-20020a1709029f94b02900d5aad0d18amr1634421plq.69.1603140338001; 
 Mon, 19 Oct 2020 13:45:38 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id f4sm331129pjs.8.2020.10.19.13.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:45:37 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 04/23] drm/msm/gem: Move prototypes to msm_gem.h
Date: Mon, 19 Oct 2020 13:46:05 -0700
Message-Id: <20201019204636.139997-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>, Rob Clark <robdclark@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sean Paul <sean@poorly.run>, Rajendra Nayak <rnayak@codeaurora.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Brian Masney <masneyb@onstation.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c |  1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c        |  1 +
 drivers/gpu/drm/msm/msm_drv.h             | 54 ----------------------
 drivers/gpu/drm/msm/msm_fbdev.c           |  1 +
 drivers/gpu/drm/msm/msm_gem.h             | 56 +++++++++++++++++++++++
 6 files changed, 60 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index a0253297bc76..b65b2329cc8d 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -11,6 +11,7 @@
 #include <drm/drm_vblank.h>
 
 #include "mdp4_kms.h"
+#include "msm_gem.h"
 
 struct mdp4_crtc {
 	struct drm_crtc base;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index c39dad151bb6..81fbd52ad7e7 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -15,6 +15,7 @@
 #include <drm/drm_vblank.h>
 
 #include "mdp5_kms.h"
+#include "msm_gem.h"
 
 #define CURSOR_WIDTH	64
 #define CURSOR_HEIGHT	64
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index cee5c50c8e52..71160b4d77a0 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -26,6 +26,7 @@
 #include "sfpb.xml.h"
 #include "dsi_cfg.h"
 #include "msm_kms.h"
+#include "msm_gem.h"
 
 #define DSI_RESET_TOGGLE_DELAY_MS 20
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 7fbcdaebeff8..713a0ae28125 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -273,28 +273,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 void msm_gem_shrinker_init(struct drm_device *dev);
 void msm_gem_shrinker_cleanup(struct drm_device *dev);
 
-int msm_gem_mmap_obj(struct drm_gem_object *obj,
-			struct vm_area_struct *vma);
-int msm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
-vm_fault_t msm_gem_fault(struct vm_fault *vmf);
-uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
-int msm_gem_get_iova(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace, uint64_t *iova);
-int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace, uint64_t *iova,
-		u64 range_start, u64 range_end);
-int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace, uint64_t *iova);
-uint64_t msm_gem_iova(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace);
-void msm_gem_unpin_iova(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace);
-struct page **msm_gem_get_pages(struct drm_gem_object *obj);
-void msm_gem_put_pages(struct drm_gem_object *obj);
-int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
-		struct drm_mode_create_dumb *args);
-int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
-		uint32_t handle, uint64_t *offset);
 struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj);
 void *msm_gem_prime_vmap(struct drm_gem_object *obj);
 void msm_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
@@ -303,38 +281,8 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg);
 int msm_gem_prime_pin(struct drm_gem_object *obj);
 void msm_gem_prime_unpin(struct drm_gem_object *obj);
-void *msm_gem_get_vaddr(struct drm_gem_object *obj);
-void *msm_gem_get_vaddr_active(struct drm_gem_object *obj);
-void msm_gem_put_vaddr(struct drm_gem_object *obj);
-int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv);
-int msm_gem_sync_object(struct drm_gem_object *obj,
-		struct msm_fence_context *fctx, bool exclusive);
-void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu);
-void msm_gem_active_put(struct drm_gem_object *obj);
-int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout);
-int msm_gem_cpu_fini(struct drm_gem_object *obj);
-void msm_gem_free_object(struct drm_gem_object *obj);
-int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
-		uint32_t size, uint32_t flags, uint32_t *handle, char *name);
-struct drm_gem_object *msm_gem_new(struct drm_device *dev,
-		uint32_t size, uint32_t flags);
-struct drm_gem_object *msm_gem_new_locked(struct drm_device *dev,
-		uint32_t size, uint32_t flags);
-void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size,
-		uint32_t flags, struct msm_gem_address_space *aspace,
-		struct drm_gem_object **bo, uint64_t *iova);
-void *msm_gem_kernel_new_locked(struct drm_device *dev, uint32_t size,
-		uint32_t flags, struct msm_gem_address_space *aspace,
-		struct drm_gem_object **bo, uint64_t *iova);
-void msm_gem_kernel_put(struct drm_gem_object *bo,
-		struct msm_gem_address_space *aspace, bool locked);
-struct drm_gem_object *msm_gem_import(struct drm_device *dev,
-		struct dma_buf *dmabuf, struct sg_table *sgt);
 void msm_gem_free_work(struct work_struct *work);
 
-__printf(2, 3)
-void msm_gem_object_set_name(struct drm_gem_object *bo, const char *fmt, ...);
-
 int msm_framebuffer_prepare(struct drm_framebuffer *fb,
 		struct msm_gem_address_space *aspace);
 void msm_framebuffer_cleanup(struct drm_framebuffer *fb,
@@ -447,8 +395,6 @@ void __init msm_dpu_register(void);
 void __exit msm_dpu_unregister(void);
 
 #ifdef CONFIG_DEBUG_FS
-void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m);
-void msm_gem_describe_objects(struct list_head *list, struct seq_file *m);
 void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m);
 int msm_debugfs_late_init(struct drm_device *dev);
 int msm_rd_debugfs_init(struct drm_minor *minor);
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 47235f8c5922..678dba1725a6 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -9,6 +9,7 @@
 #include <drm/drm_fourcc.h>
 
 #include "msm_drv.h"
+#include "msm_gem.h"
 #include "msm_kms.h"
 
 extern int msm_gem_mmap_obj(struct drm_gem_object *obj,
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index f6482154e8bb..fbad08badf43 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -93,6 +93,62 @@ struct msm_gem_object {
 };
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
+int msm_gem_mmap_obj(struct drm_gem_object *obj,
+			struct vm_area_struct *vma);
+int msm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
+vm_fault_t msm_gem_fault(struct vm_fault *vmf);
+uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
+int msm_gem_get_iova(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace, uint64_t *iova);
+int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace, uint64_t *iova,
+		u64 range_start, u64 range_end);
+int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace, uint64_t *iova);
+uint64_t msm_gem_iova(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace);
+void msm_gem_unpin_iova(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace);
+struct page **msm_gem_get_pages(struct drm_gem_object *obj);
+void msm_gem_put_pages(struct drm_gem_object *obj);
+int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
+		struct drm_mode_create_dumb *args);
+int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
+		uint32_t handle, uint64_t *offset);
+void *msm_gem_get_vaddr(struct drm_gem_object *obj);
+void *msm_gem_get_vaddr_active(struct drm_gem_object *obj);
+void msm_gem_put_vaddr(struct drm_gem_object *obj);
+int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv);
+int msm_gem_sync_object(struct drm_gem_object *obj,
+		struct msm_fence_context *fctx, bool exclusive);
+void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu);
+void msm_gem_active_put(struct drm_gem_object *obj);
+int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout);
+int msm_gem_cpu_fini(struct drm_gem_object *obj);
+void msm_gem_free_object(struct drm_gem_object *obj);
+int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
+		uint32_t size, uint32_t flags, uint32_t *handle, char *name);
+struct drm_gem_object *msm_gem_new(struct drm_device *dev,
+		uint32_t size, uint32_t flags);
+struct drm_gem_object *msm_gem_new_locked(struct drm_device *dev,
+		uint32_t size, uint32_t flags);
+void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size,
+		uint32_t flags, struct msm_gem_address_space *aspace,
+		struct drm_gem_object **bo, uint64_t *iova);
+void *msm_gem_kernel_new_locked(struct drm_device *dev, uint32_t size,
+		uint32_t flags, struct msm_gem_address_space *aspace,
+		struct drm_gem_object **bo, uint64_t *iova);
+void msm_gem_kernel_put(struct drm_gem_object *bo,
+		struct msm_gem_address_space *aspace, bool locked);
+struct drm_gem_object *msm_gem_import(struct drm_device *dev,
+		struct dma_buf *dmabuf, struct sg_table *sgt);
+__printf(2, 3)
+void msm_gem_object_set_name(struct drm_gem_object *bo, const char *fmt, ...);
+#ifdef CONFIG_DEBUG_FS
+void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m);
+void msm_gem_describe_objects(struct list_head *list, struct seq_file *m);
+#endif
+
 static inline void
 msm_gem_lock(struct drm_gem_object *obj)
 {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
