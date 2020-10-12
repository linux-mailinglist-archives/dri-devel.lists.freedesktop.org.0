Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6F428ABA5
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 04:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7B96E1D8;
	Mon, 12 Oct 2020 02:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0846E1D8;
 Mon, 12 Oct 2020 02:08:53 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id y14so12115447pfp.13;
 Sun, 11 Oct 2020 19:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hhbdajz6aII8kCOttV+DZEeHN2D3wgXXxPE8UzNjZ0o=;
 b=ImVpx2qzdud9P/qiJMlO95dfOZHex7S0Q9b1NpjJipbeAb7g/gVXNP6tBNd3q/G3EN
 elD/xhxgNyoUaYXyf+GaMoC/k7QP26FrHnocJQ0QKruYOPTOujQEg8Iut87ZU4badZwa
 SQYOnqNpmmZr0r/Zy61YSfX12EBNw1Rd0/sN5gUjZkSJD11m6FtJtkRo36UikiogFi5/
 K+TcpE+gIGbo+mvYFTDiNbguuSJvXWnNKEmvPi051ypfaE2Wh1ZZEUbV4j1qPopPshxh
 aloi2kboOuMji6dsJcL7T2PbBGgeMxQUdwZvxutfSsZe3OwOLXgWe4zvkltuMjf2wtCh
 K7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hhbdajz6aII8kCOttV+DZEeHN2D3wgXXxPE8UzNjZ0o=;
 b=Ss/jfyph7UUcFY3dkQcaWh1dQozAyOmS+zYT+4NWgmYPYKJ08ZcX1wcfKvgk5669zX
 7hVlROYdPDAf+NWI0gwgkxPY60pt17CzjdW5b8N0J/qG3ng5asSDxzoE7lf/WngpAIPt
 vdMcZdYbfInVR8XuYwTls4u/0f8YWOxTxmC02UjZzhvhBNajou4RWP7qLjsNECmLDbSz
 xYO/w7YEz9RYSFVWpn9hCInQ0JM1WURKa9Be+xv6smRNEIW9sJaQS4uQ4SAnGE3ID46d
 kBvmEHD8IeGVDSN97/0qkrfff/KtfByUJTrmxrxj+gGtQrE6wL6JRT0F392xyy1la7pD
 u3XQ==
X-Gm-Message-State: AOAM531u2sxuACWt62i/1Mfw9G6+RmTgjBumbB3/DHBvkbrqElSX1Ngb
 pmOUAtwxhB1/4NkITXzbO8Do3DpsVhrzWyDp
X-Google-Smtp-Source: ABdhPJy4zR1YrP0tZaFrOu6lZbyt4LyeJn/5LBtWEYyz8l4zcyGFNkOgZ+CNTlRjsAgfCVC35yu3Ag==
X-Received: by 2002:a17:90a:bf8c:: with SMTP id
 d12mr18101532pjs.157.1602468532430; 
 Sun, 11 Oct 2020 19:08:52 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 x5sm18259999pfp.113.2020.10.11.19.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 19:08:51 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/22] drm/msm/gem: Move prototypes to msm_gem.h
Date: Sun, 11 Oct 2020 19:09:30 -0700
Message-Id: <20201012020958.229288-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Rajendra Nayak <rnayak@codeaurora.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Harigovindan P <harigovi@codeaurora.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Brian Masney <masneyb@onstation.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>
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
index b17ac6c27554..5e7cdc11c764 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -26,6 +26,7 @@
 #include "sfpb.xml.h"
 #include "dsi_cfg.h"
 #include "msm_kms.h"
+#include "msm_gem.h"
 
 #define DSI_RESET_TOGGLE_DELAY_MS 20
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index b9dd8f8f4887..79ee7d05b363 100644
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
