Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A88168C15
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 03:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A676F5BC;
	Sat, 22 Feb 2020 02:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC626F5C4;
 Sat, 22 Feb 2020 02:43:33 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id b185so2253361pfb.7;
 Fri, 21 Feb 2020 18:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zmu9+9eRFyNY15h9Ek3Z+76nUFKQGmj+zanQeEr6WEg=;
 b=CyObTePIC42njRlTMpIZ5jbV07vgmVzwQlIiClf8yxmuRae7p5rmPK3RHoGWUE6mkk
 UzllkCHvhzvt7xJeIXgotAX4N0urh0fusNlyXvE7soJ3jqUTaD2H3TvbAM0MRJq7UDUK
 AaNJLBmXC2yJo03J1uSp6YEyYbywQiMhQzFK79fByFG5hWbs376E1Wy3Qr0oQizMIxph
 R7MjdGqFOb3hoejatRsG9B+ZrhD5tsUWUOzAWgFoNNgROmPyzO6RSdqRf+R51mRMg2+Q
 7CG+ZMuNBgUyKNliZ2Z6qM/WB8h6d4zd5yyCRoQtealQsMcxy3ERJkGSa+XzXACOw1bW
 HiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zmu9+9eRFyNY15h9Ek3Z+76nUFKQGmj+zanQeEr6WEg=;
 b=SfIr8M5GIeETLcx/eWSJyGbZ97nYp9ucP4ZU6+QDVR67yOJvyK9xQ19orX0oLL4JzM
 sJu1kScGzfwMEmcKreQfO9W/M48PzEGuQbf4jPMFFslFKsxJYHYU0g8vJvCfmSFRc+uI
 CyBxeIgtwDfIMm8YFcqe16BwuPHqYZf3UNxPPOLJEd36t6VkBMRMjedSvCrzo3Z9vGgI
 /enU6NAeoiBdJGaRIV996k7frtHuIHCQYmhuQMl2c6kSfq/8YJDuwhQF5JyBKPpmsbun
 enEzl2SHAxR4US54RlWxvFJkoJqW3i6VoRHc7NhqjAscitShyKvjM3MkMZj85mC4DOXg
 +Uew==
X-Gm-Message-State: APjAAAVeIOlNq5GJmxoyR4KHXrichrK35qwKJM0c31ZKqdCZpidHIHv2
 Fs9QJulvy/h7w2ta39NPizPVh8dbDyMxTA==
X-Google-Smtp-Source: APXvYqwdgtryziiyB3qwd3ITAq/0Lqdj/vlMbD6j/DyX5dGHIYAmpNW5eZYvU/00f14I634rGNHvOw==
X-Received: by 2002:aa7:957c:: with SMTP id x28mr40685571pfq.157.1582339412254; 
 Fri, 21 Feb 2020 18:43:32 -0800 (PST)
Received: from localhost.localdomain ([103.219.195.110])
 by smtp.gmail.com with ESMTPSA id u13sm3797317pjn.29.2020.02.21.18.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 18:43:31 -0800 (PST)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/lima: add LIMA_BO_FLAG_FORCE_VA
Date: Sat, 22 Feb 2020 10:42:10 +0800
Message-Id: <20200222024210.18697-6-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200222024210.18697-1-yuq825@gmail.com>
References: <20200222024210.18697-1-yuq825@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andreas Baierl <ichgeh@imkreisrum.de>,
 Qiang Yu <yuq825@gmail.com>, Icenowy Zheng <icenowy@aosc.io>,
 Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

User can force created buffer to be mapped to GPU VM at a user
specified address. This is used for debug tools in user space to
replay some task.

Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_drv.c | 26 +++++++++++++++++++-------
 drivers/gpu/drm/lima/lima_gem.c |  7 +++++--
 drivers/gpu/drm/lima/lima_gem.h |  4 +++-
 drivers/gpu/drm/lima/lima_vm.c  | 13 ++++++++++++-
 include/uapi/drm/lima_drm.h     |  9 +++++++--
 5 files changed, 46 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index 8c5adc025902..f65021ea9598 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -73,16 +73,27 @@ static int lima_ioctl_gem_create(struct drm_device *dev, void *data, struct drm_
 {
 	struct drm_lima_gem_create *args = data;
 
-	if (args->pad)
-		return -EINVAL;
-
-	if (args->flags & ~(LIMA_BO_FLAG_HEAP))
+	if (args->flags & ~(LIMA_BO_FLAG_HEAP | LIMA_BO_FLAG_FORCE_VA))
 		return -EINVAL;
 
 	if (args->size == 0)
 		return -EINVAL;
 
-	return lima_gem_create_handle(dev, file, args->size, args->flags, &args->handle);
+	if (args->flags & LIMA_BO_FLAG_FORCE_VA) {
+		u64 max = (u64)args->va + (u64)args->size;
+
+		if (max > LIMA_VA_RESERVE_START)
+			return -EINVAL;
+
+		if (!IS_ALIGNED(args->va, PAGE_SIZE))
+			return -EINVAL;
+	} else {
+		if (args->va)
+			return -EINVAL;
+	}
+
+	return lima_gem_create_handle(dev, file, args->size, args->flags,
+				      &args->handle, args->va);
 }
 
 static int lima_ioctl_gem_info(struct drm_device *dev, void *data, struct drm_file *file)
@@ -253,6 +264,7 @@ DEFINE_DRM_GEM_FOPS(lima_drm_driver_fops);
  * Changelog:
  *
  * - 1.1.0 - add heap buffer support
+ * - 1.2.0 - add force va support
  */
 
 static struct drm_driver lima_drm_driver = {
@@ -264,9 +276,9 @@ static struct drm_driver lima_drm_driver = {
 	.fops               = &lima_drm_driver_fops,
 	.name               = "lima",
 	.desc               = "lima DRM",
-	.date               = "20191231",
+	.date               = "20200215",
 	.major              = 1,
-	.minor              = 1,
+	.minor              = 2,
 	.patchlevel         = 0,
 
 	.gem_create_object  = lima_gem_create_object,
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 5404e0d668db..c28d90756584 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -95,7 +95,7 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
 }
 
 int lima_gem_create_handle(struct drm_device *dev, struct drm_file *file,
-			   u32 size, u32 flags, u32 *handle)
+			   u32 size, u32 flags, u32 *handle, u32 va)
 {
 	int err;
 	gfp_t mask;
@@ -116,8 +116,11 @@ int lima_gem_create_handle(struct drm_device *dev, struct drm_file *file,
 	mask |= __GFP_DMA32;
 	mapping_set_gfp_mask(obj->filp->f_mapping, mask);
 
+	bo = to_lima_bo(obj);
+	bo->flags = flags;
+	bo->force_va = va;
+
 	if (is_heap) {
-		bo = to_lima_bo(obj);
 		err = lima_heap_alloc(bo, NULL);
 		if (err)
 			goto out;
diff --git a/drivers/gpu/drm/lima/lima_gem.h b/drivers/gpu/drm/lima/lima_gem.h
index ccea06142f4b..2a6db0c0be89 100644
--- a/drivers/gpu/drm/lima/lima_gem.h
+++ b/drivers/gpu/drm/lima/lima_gem.h
@@ -15,6 +15,8 @@ struct lima_bo {
 	struct mutex lock;
 	struct list_head va;
 
+	u32 flags;
+	u32 force_va;
 	size_t heap_size;
 };
 
@@ -37,7 +39,7 @@ static inline struct dma_resv *lima_bo_resv(struct lima_bo *bo)
 int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm);
 struct drm_gem_object *lima_gem_create_object(struct drm_device *dev, size_t size);
 int lima_gem_create_handle(struct drm_device *dev, struct drm_file *file,
-			   u32 size, u32 flags, u32 *handle);
+			   u32 size, u32 flags, u32 *handle, u32 va);
 int lima_gem_get_info(struct drm_file *file, u32 handle, u32 *va, u64 *offset);
 int lima_gem_submit(struct drm_file *file, struct lima_submit *submit);
 int lima_gem_wait(struct drm_file *file, u32 handle, u32 op, s64 timeout_ns);
diff --git a/drivers/gpu/drm/lima/lima_vm.c b/drivers/gpu/drm/lima/lima_vm.c
index 5b92fb82674a..be0510032538 100644
--- a/drivers/gpu/drm/lima/lima_vm.c
+++ b/drivers/gpu/drm/lima/lima_vm.c
@@ -3,6 +3,7 @@
 
 #include <linux/slab.h>
 #include <linux/dma-mapping.h>
+#include <drm/lima_drm.h>
 
 #include "lima_device.h"
 #include "lima_vm.h"
@@ -93,6 +94,7 @@ int lima_vm_bo_add(struct lima_vm *vm, struct lima_bo *bo, bool create)
 	struct lima_bo_va *bo_va;
 	struct sg_dma_page_iter sg_iter;
 	int offset = 0, err;
+	u64 start, end;
 
 	mutex_lock(&bo->lock);
 
@@ -120,7 +122,16 @@ int lima_vm_bo_add(struct lima_vm *vm, struct lima_bo *bo, bool create)
 
 	mutex_lock(&vm->lock);
 
-	err = drm_mm_insert_node(&vm->mm, &bo_va->node, lima_bo_size(bo));
+	if (bo->flags & LIMA_BO_FLAG_FORCE_VA) {
+		start = bo->force_va;
+		end = start + lima_bo_size(bo);
+	} else {
+		start = 0;
+		end = U64_MAX;
+	}
+
+	err = drm_mm_insert_node_in_range(&vm->mm, &bo_va->node, lima_bo_size(bo),
+					  0, 0, start, end, 0);
 	if (err)
 		goto err_out1;
 
diff --git a/include/uapi/drm/lima_drm.h b/include/uapi/drm/lima_drm.h
index 1ec58d652a5a..3e699bb78394 100644
--- a/include/uapi/drm/lima_drm.h
+++ b/include/uapi/drm/lima_drm.h
@@ -37,7 +37,12 @@ struct drm_lima_get_param {
  * due to lack of heap memory. size field of heap buffer is an up bound of
  * the backup memory which can be set to a fairly large value.
  */
-#define LIMA_BO_FLAG_HEAP  (1 << 0)
+#define LIMA_BO_FLAG_HEAP        (1 << 0)
+/*
+ * force buffer GPU virtual address to be drm_lima_gem_create.va, this is
+ * used to replay some task with fixed GPU virtual address
+ */
+#define LIMA_BO_FLAG_FORCE_VA    (1 << 1)
 
 /**
  * create a buffer for used by GPU
@@ -46,7 +51,7 @@ struct drm_lima_gem_create {
 	__u32 size;    /* in, buffer size */
 	__u32 flags;   /* in, buffer flags */
 	__u32 handle;  /* out, GEM buffer handle */
-	__u32 pad;     /* pad, must be zero */
+	__u32 va;      /* in, buffer va */
 };
 
 /**
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
