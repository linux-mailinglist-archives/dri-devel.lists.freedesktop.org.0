Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730F6D1AB1A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 18:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD26E10E528;
	Tue, 13 Jan 2026 17:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870A310E523
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:44:54 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-64d4d8b3ad7so12668450a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 09:44:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768326293; x=1768931093;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=v2l8wIBjsApl5lsjMAOqlkMIbLPfjDWiLseIy2qbcjU=;
 b=bsBJGnOus5GpTeHVvEFPAZPMryw0rCTe/123g99w5aVomYjX7emaUTV0NizUqJpK+Z
 7J7+Bdaxrc0UT4qTb9B9SnzsGsrMIbcpfrFxu4CCrGGqtWaWp+AxAMuRJw90k90usg5r
 mhzIjXuW4y60vl7/4HL0o5muh7PeIPe7F9yGq7aqRz1qO49XLKLiVBSMgIsVc8/eAp+6
 9ZGQ8ff+aqr8He2qqeXRFwKVzXrSCEFJc9R6FtZK+qBhBtNharCRhcy0PYavHnx/PmrH
 lvRxiVffdmj0ciJR4XgFMmtB9CEPhK3Js/KHRB8/HPTN+d16k2A2EVNtFNfLygXm7Zf/
 DRSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4gYAV8Po/qnJ3NJttittNhJCaiY6UznQWWVRg844kW4YizJ9apXFKcb6C3LPbYwGgGudT8BDY/ZQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywk2ZPDPAFF4a/nKMky1nCyTWp5tLuuM1g8Tt6EQkBye6Kd7qAp
 TuaHBd0PcM8H5wiz14nCjdTRKrOCk4igfWv58TEfW69vFdBci9G3O+S/
X-Gm-Gg: AY/fxX5QHPZOUhyufZB/e/IuXyR1BmI2MruGJW9xw/pI4PM/9BNLqLyXwAYaCHeqYOV
 068b7PGbopLZ5b5uL1TCSwEUsZBaEXC4sXklh+9wKExUOV8Wac5RpwGQq/dHjBK4/ax/bDb3aRV
 aXr6OoMJ8j+f69piE4XyY1fk3u3DlNG7VXv9Q52eYIEvC7wD2kZHUFYPIn4wD/tr31Zk1cgcENB
 hCToxygQMH9nDYPYsXVW+nNsEvUXsKMqRtPzO/i2zE0G2N3AgQQb5+UrlFIWNjbRYAKaT1Qjp8L
 DUwTfyrBzBCvL8hB3386i45kCwTXAexl+w0wY9t7eFI94b/FyEx0bWYxvzQHP6+OiO1DWNi0qAB
 nEwQlQbCbKhEeVOcoJ/RjEnrGzTQJrSRkmvjwLIqpQO/aqx7C7iyRZJDNjn6KL49WlURJtSVkey
 AIEFgGwZvEb/JOrq+zsQcrVPCGC/scddlkJwCKJBxz5UsNGg==
X-Google-Smtp-Source: AGHT+IGYYREEN/5lBbERJSEIoYk6+xX8TKQHB6V6QK9t02Hm3hex4r4o0KRxPxU4VDxzdmDeNKmVmQ==
X-Received: by 2002:a05:6402:1e92:b0:653:9cd7:2004 with SMTP id
 4fb4d7f45d1cf-6539cd72323mr1132657a12.28.1768326292719; 
 Tue, 13 Jan 2026 09:44:52 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-36-231.cust.vodafone.cz. [46.135.36.231])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507be655aesm20873259a12.17.2026.01.13.09.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 09:44:52 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 13 Jan 2026 18:44:37 +0100
Subject: [PATCH 3/5] accel/thames: Add IOCTLs for BO creation and mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-thames-v1-3-99390026937c@tomeuvizoso.net>
References: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
In-Reply-To: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
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

Uses the SHMEM DRM helpers, mapping on creation to the device as all
created buffers are expected to be accessed by the DSPs. We map to all
DSPs because we cannot know upfront what DSP cores will run a given job.

Buffers are mapped for the device by the DSPs themselves, as each
contains a MMU.

Buffers belong to a context, which is used by the DSP to switch to the
page table that mapped the buffers for the user of the job to execute.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/thames/Makefile       |   1 +
 drivers/accel/thames/thames_drv.c   |   5 +-
 drivers/accel/thames/thames_gem.c   | 355 ++++++++++++++++++++++++++++++++++++
 drivers/accel/thames/thames_gem.h   |  41 +++++
 drivers/accel/thames/thames_rpmsg.c |  69 +++++++
 5 files changed, 470 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/thames/Makefile b/drivers/accel/thames/Makefile
index 7ccd8204f0f5ea800f30e84b319f355be948109d..0051e319f2e4966de72bc342d5b6e40b2890c006 100644
--- a/drivers/accel/thames/Makefile
+++ b/drivers/accel/thames/Makefile
@@ -6,4 +6,5 @@ thames-y := \
 	thames_core.o \
 	thames_device.o \
 	thames_drv.o \
+	thames_gem.o \
 	thames_rpmsg.o
diff --git a/drivers/accel/thames/thames_drv.c b/drivers/accel/thames/thames_drv.c
index a288e6ef05d7b1a21741ac0ca9cc8981f33969e4..29a80b9747ae84778b09f5dbd5b8d6d596f1947a 100644
--- a/drivers/accel/thames/thames_drv.c
+++ b/drivers/accel/thames/thames_drv.c
@@ -13,6 +13,7 @@
 
 #include "thames_drv.h"
 #include "thames_core.h"
+#include "thames_gem.h"
 #include "thames_ipc.h"
 
 static struct platform_device *drm_dev;
@@ -54,7 +55,8 @@ static void thames_postclose(struct drm_device *dev, struct drm_file *file)
 
 static const struct drm_ioctl_desc thames_drm_driver_ioctls[] = {
 #define THAMES_IOCTL(n, func) DRM_IOCTL_DEF_DRV(THAMES_##n, thames_ioctl_##func, 0)
-
+	THAMES_IOCTL(BO_CREATE, bo_create),
+	THAMES_IOCTL(BO_MMAP_OFFSET, bo_mmap_offset),
 };
 
 DEFINE_DRM_ACCEL_FOPS(thames_accel_driver_fops);
@@ -63,6 +65,7 @@ static const struct drm_driver thames_drm_driver = {
 	.driver_features = DRIVER_COMPUTE_ACCEL | DRIVER_GEM,
 	.open = thames_open,
 	.postclose = thames_postclose,
+	.gem_create_object = thames_gem_create_object,
 	.ioctls = thames_drm_driver_ioctls,
 	.num_ioctls = ARRAY_SIZE(thames_drm_driver_ioctls),
 	.fops = &thames_accel_driver_fops,
diff --git a/drivers/accel/thames/thames_gem.c b/drivers/accel/thames/thames_gem.c
new file mode 100644
index 0000000000000000000000000000000000000000..a153e73a15253e0f955d74020b4765a1fa833fc4
--- /dev/null
+++ b/drivers/accel/thames/thames_gem.c
@@ -0,0 +1,355 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright 2026 Texas Instruments Incorporated - https://www.ti.com/ */
+
+#include "drm/drm_gem_shmem_helper.h"
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_print.h>
+#include <drm/drm_utils.h>
+#include <drm/thames_accel.h>
+#include <linux/dma-mapping.h>
+#include <linux/idr.h>
+
+#include "thames_gem.h"
+#include "thames_device.h"
+#include "thames_drv.h"
+#include "thames_rpmsg.h"
+
+#define THAMES_BO_FLAGS DRM_THAMES_BO_NO_MMAP
+
+/*
+ * DSP MMU permission flags for buffer object mappings.
+ * These control read/write/execute permissions in the DSP's address space.
+ */
+#define THAMES_BO_PERM_READ (1 << 0)
+#define THAMES_BO_PERM_WRITE (1 << 1)
+#define THAMES_BO_PERM_EXEC (1 << 2)
+#define THAMES_BO_PERM_RWX (THAMES_BO_PERM_READ | THAMES_BO_PERM_WRITE | THAMES_BO_PERM_EXEC)
+
+static u64 thames_alloc_vaddr(struct thames_device *tdev, struct thames_gem_object *bo, size_t size)
+{
+	int ret;
+
+	size = ALIGN(size, SZ_1M);
+
+	mutex_lock(&tdev->mm_lock);
+	ret = drm_mm_insert_node(&tdev->mm, &bo->mm, size);
+	mutex_unlock(&tdev->mm_lock);
+
+	if (ret)
+		return 0;
+
+	return bo->mm.start;
+}
+
+static void thames_free_vaddr(struct thames_device *tdev, struct thames_gem_object *bo)
+{
+	if (!drm_mm_node_allocated(&bo->mm))
+		return;
+
+	mutex_lock(&tdev->mm_lock);
+	drm_mm_remove_node(&bo->mm);
+	mutex_unlock(&tdev->mm_lock);
+}
+
+static int thames_context_destroy_on_core(struct thames_file_priv *priv, struct thames_core *core)
+{
+	struct thames_device *tdev = priv->tdev;
+	int ret;
+
+	ret = thames_rpmsg_send_destroy_context(core, priv->context_id);
+	if (ret)
+		dev_warn(tdev->ddev.dev, "Failed to destroy context on core %d: %d", core->index,
+			 ret);
+
+	return ret;
+}
+
+static int thames_context_create_on_core(struct thames_file_priv *priv, struct thames_core *core)
+{
+	struct thames_device *tdev = priv->tdev;
+	int ret;
+
+	ret = thames_rpmsg_send_create_context(core, priv->context_id);
+	if (ret)
+		dev_warn(tdev->ddev.dev, "Failed to create context on core %d: %d", core->index,
+			 ret);
+
+	return ret;
+}
+
+int thames_context_create(struct thames_file_priv *priv)
+{
+	struct thames_device *tdev = priv->tdev;
+	int i, ret;
+
+	ret = ida_alloc_min(&tdev->ctx_ida, 1, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	priv->context_id = ret;
+	priv->context_valid = false;
+
+	if (!tdev->num_cores) {
+		dev_err(tdev->ddev.dev, "No cores available\n");
+		ret = -ENODEV;
+		goto err_free_id;
+	}
+
+	for (i = 0; i < tdev->num_cores; i++) {
+		ret = thames_context_create_on_core(priv, &tdev->cores[i]);
+		if (ret) {
+			dev_err(tdev->ddev.dev, "Failed to create context on core %d: %d\n", i,
+				ret);
+			goto err_destroy_contexts;
+		}
+	}
+
+	priv->context_valid = true;
+	return 0;
+
+err_destroy_contexts:
+	for (i = i - 1; i >= 0; i--)
+		thames_context_destroy_on_core(priv, &tdev->cores[i]);
+err_free_id:
+	ida_free(&tdev->ctx_ida, priv->context_id);
+	return ret;
+}
+
+void thames_context_destroy(struct thames_file_priv *priv)
+{
+	struct thames_device *tdev = priv->tdev;
+	int i;
+
+	if (!priv->context_valid)
+		return;
+
+	for (i = 0; i < tdev->num_cores; i++)
+		thames_context_destroy_on_core(priv, &tdev->cores[i]);
+
+	ida_free(&tdev->ctx_ida, priv->context_id);
+	priv->context_valid = false;
+}
+
+static int thames_bo_map_to_core(struct thames_gem_object *bo, struct thames_file_priv *file_priv,
+				 struct thames_core *core, u64 vaddr, u64 paddr, u64 size,
+				 u32 flags)
+{
+	struct thames_device *tdev = file_priv->tdev;
+	int ret;
+
+	ret = thames_rpmsg_send_map_bo(core, file_priv->context_id, bo->id, vaddr, paddr, size);
+	if (ret)
+		dev_warn(tdev->ddev.dev, "Failed to map buffer on core %d: %d", core->index, ret);
+
+	return ret;
+}
+
+static int thames_bo_map_to_device(struct thames_gem_object *bo, struct thames_file_priv *file_priv)
+{
+	struct thames_device *tdev = file_priv->tdev;
+	struct sg_table *sgt;
+	dma_addr_t dma_addr;
+	int i, ret;
+
+	if (bo->iova)
+		return 0;
+
+	if (!file_priv->context_valid)
+		return -EINVAL;
+
+	if (!tdev->num_cores)
+		return -ENODEV;
+
+	sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
+	if (IS_ERR(sgt))
+		return PTR_ERR(sgt);
+
+	dma_addr = sg_dma_address(sgt->sgl);
+	if (!dma_addr) {
+		ret = -EINVAL;
+		goto err_put_pages;
+	}
+
+	bo->iova = thames_alloc_vaddr(tdev, bo, bo->base.base.size);
+	if (!bo->iova) {
+		ret = -ENOMEM;
+		goto err_put_pages;
+	}
+
+	bo->context_id = file_priv->context_id;
+
+	for (i = 0; i < tdev->num_cores; i++) {
+		ret = thames_bo_map_to_core(bo, file_priv, &tdev->cores[i], bo->iova, dma_addr,
+					    bo->base.base.size, THAMES_BO_PERM_RWX);
+		if (ret) {
+			while (--i >= 0)
+				thames_rpmsg_send_unmap_bo(&tdev->cores[i], bo->context_id, bo->id);
+			goto err_free_vaddr;
+		}
+	}
+
+	return 0;
+
+err_free_vaddr:
+	thames_free_vaddr(tdev, bo);
+	bo->iova = 0;
+err_put_pages:
+	dma_resv_lock(bo->base.base.resv, NULL);
+	drm_gem_shmem_put_pages_locked(&bo->base);
+	dma_resv_unlock(bo->base.base.resv);
+	return ret;
+}
+
+static void thames_bo_unmap_from_device(struct thames_gem_object *bo, struct thames_device *tdev)
+{
+	int i, ret, failed_unmaps = 0;
+
+	if (!bo->iova)
+		return;
+
+	for (i = 0; i < tdev->num_cores; i++) {
+		ret = thames_rpmsg_send_unmap_bo(&tdev->cores[i], bo->context_id, bo->id);
+		if (ret) {
+			dev_err(tdev->ddev.dev, "Failed to unmap BO %u from core %d: %d\n", bo->id,
+				i, ret);
+			failed_unmaps++;
+		}
+	}
+
+	if (failed_unmaps)
+		drm_WARN(&tdev->ddev, failed_unmaps > 0,
+			 "BO %u: %d core(s) failed unmap, potential DSP-side leak\n", bo->id,
+			 failed_unmaps);
+
+	thames_free_vaddr(tdev, bo);
+	bo->iova = 0;
+
+	dma_resv_lock(bo->base.base.resv, NULL);
+	drm_gem_shmem_put_pages_locked(&bo->base);
+	dma_resv_unlock(bo->base.base.resv);
+}
+
+static void thames_gem_bo_free(struct drm_gem_object *obj)
+{
+	struct thames_gem_object *bo = to_thames_bo(obj);
+	struct thames_device *tdev = to_thames_device(obj->dev);
+
+	drm_WARN_ON(obj->dev, refcount_read(&bo->base.pages_use_count) > 1);
+
+	if (bo->iova)
+		thames_bo_unmap_from_device(bo, tdev);
+
+	ida_free(&tdev->bo_ida, bo->id);
+
+	drm_gem_free_mmap_offset(&bo->base.base);
+	drm_gem_shmem_free(&bo->base);
+}
+
+static const struct drm_gem_object_funcs thames_gem_funcs = {
+	.free = thames_gem_bo_free,
+	.print_info = drm_gem_shmem_object_print_info,
+	.pin = drm_gem_shmem_object_pin,
+	.unpin = drm_gem_shmem_object_unpin,
+	.get_sg_table = drm_gem_shmem_object_get_sg_table,
+	.vmap = drm_gem_shmem_object_vmap,
+	.vunmap = drm_gem_shmem_object_vunmap,
+	.mmap = drm_gem_shmem_object_mmap,
+	.vm_ops = &drm_gem_shmem_vm_ops,
+};
+
+struct drm_gem_object *thames_gem_create_object(struct drm_device *dev, size_t size)
+{
+	struct thames_device *tdev = to_thames_device(dev);
+	struct thames_gem_object *obj;
+	int bo_id;
+
+	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
+	if (!obj)
+		return ERR_PTR(-ENOMEM);
+
+	obj->base.base.funcs = &thames_gem_funcs;
+
+	bo_id = ida_alloc_min(&tdev->bo_ida, 1, GFP_KERNEL);
+	if (bo_id < 0) {
+		kfree(obj);
+		return ERR_PTR(bo_id);
+	}
+	obj->id = bo_id;
+
+	return &obj->base.base;
+}
+
+int thames_ioctl_bo_create(struct drm_device *ddev, void *data, struct drm_file *file)
+{
+	struct thames_file_priv *file_priv = file->driver_priv;
+	struct drm_thames_bo_create *args = data;
+	struct drm_gem_shmem_object *mem;
+	struct thames_gem_object *bo;
+	int cookie, ret;
+
+	if (!drm_dev_enter(ddev, &cookie))
+		return -ENODEV;
+
+	if (args->handle || args->iova) {
+		ret = -EINVAL;
+		goto err_exit;
+	}
+
+	if (!args->size || (args->flags & ~THAMES_BO_FLAGS)) {
+		ret = -EINVAL;
+		goto err_exit;
+	}
+
+	mem = drm_gem_shmem_create(ddev, args->size);
+	if (IS_ERR(mem))
+		return PTR_ERR(mem);
+
+	bo = to_thames_bo(&mem->base);
+
+	ret = drm_gem_handle_create(file, &mem->base, &args->handle);
+	drm_gem_object_put(&mem->base);
+	if (ret) {
+		dev_err(ddev->dev, "Failed to create gem handle: %d", ret);
+		goto err_free;
+	}
+
+	ret = thames_bo_map_to_device(bo, file_priv);
+	if (ret) {
+		dev_err(ddev->dev, "Failed to map buffer to DSP on creation: %d", ret);
+		goto err_free;
+	}
+
+	args->size = bo->base.base.size;
+	args->iova = bo->iova;
+
+	drm_dev_exit(cookie);
+
+	return 0;
+
+err_free:
+	drm_gem_shmem_object_free(&mem->base);
+
+err_exit:
+	drm_dev_exit(cookie);
+
+	return ret;
+}
+
+int thames_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data, struct drm_file *file)
+{
+	struct drm_thames_bo_mmap_offset *args = data;
+	struct drm_gem_object *obj;
+
+	if (args->pad)
+		return -EINVAL;
+
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	args->offset = drm_vma_node_offset_addr(&obj->vma_node);
+	drm_gem_object_put(obj);
+
+	return 0;
+}
diff --git a/drivers/accel/thames/thames_gem.h b/drivers/accel/thames/thames_gem.h
new file mode 100644
index 0000000000000000000000000000000000000000..785843c40a89a9e84ab634aad77e9ec46111693e
--- /dev/null
+++ b/drivers/accel/thames/thames_gem.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright 2026 Texas Instruments Incorporated - https://www.ti.com/ */
+
+#ifndef __THAMES_GEM_H__
+#define __THAMES_GEM_H__
+
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_mm.h>
+
+struct thames_device;
+
+struct thames_gem_object {
+	struct drm_gem_shmem_object base;
+
+	struct thames_file_priv *driver_priv;
+
+	struct drm_mm_node mm;
+
+	u32 id;
+	u32 context_id;
+	u64 iova;
+	size_t size;
+	size_t offset;
+};
+
+struct drm_gem_object *thames_gem_create_object(struct drm_device *dev, size_t size);
+
+int thames_ioctl_bo_create(struct drm_device *ddev, void *data, struct drm_file *file);
+
+int thames_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data, struct drm_file *file);
+
+int thames_context_create(struct thames_file_priv *priv);
+
+void thames_context_destroy(struct thames_file_priv *priv);
+
+static inline struct thames_gem_object *to_thames_bo(struct drm_gem_object *obj)
+{
+	return container_of(to_drm_gem_shmem_obj(obj), struct thames_gem_object, base);
+}
+
+#endif
diff --git a/drivers/accel/thames/thames_rpmsg.c b/drivers/accel/thames/thames_rpmsg.c
index ebc34f49353e5e7959734da8e8a935573c130e79..a25465295a177877c5ca2b3c93f52d8288863797 100644
--- a/drivers/accel/thames/thames_rpmsg.c
+++ b/drivers/accel/thames/thames_rpmsg.c
@@ -63,6 +63,14 @@ static int thames_rpmsg_callback(struct rpmsg_device *rpdev, void *data, int len
 		break;
 	}
 
+	case THAMES_MSG_CONTEXT_OP_RESPONSE:
+		ida_free(&core->tdev->ipc_seq_ida, hdr->seq);
+		break;
+
+	case THAMES_MSG_BO_OP_RESPONSE:
+		ida_free(&core->tdev->ipc_seq_ida, hdr->seq);
+		break;
+
 	default:
 		dev_warn(&rpdev->dev, "Unknown message type: %u\n", hdr->type);
 		break;
@@ -122,6 +130,67 @@ int thames_rpmsg_send_ping(struct thames_core *core, u32 ping_data, u32 *sequenc
 	return thames_rpmsg_send_raw(core, &ping_msg, sizeof(ping_msg));
 }
 
+int thames_rpmsg_send_create_context(struct thames_core *core, u32 context_id)
+{
+	struct thames_msg_context_op msg = {};
+
+	msg.hdr.type = THAMES_MSG_CONTEXT_OP;
+	msg.hdr.seq = ida_alloc(&core->tdev->ipc_seq_ida, GFP_KERNEL);
+	msg.hdr.len = sizeof(msg);
+	msg.op = THAMES_CONTEXT_CREATE;
+	msg.context_id = context_id;
+
+	return thames_rpmsg_send_raw(core, &msg, sizeof(msg));
+}
+
+int thames_rpmsg_send_destroy_context(struct thames_core *core, u32 context_id)
+{
+	struct thames_msg_context_op msg = {};
+
+	msg.hdr.type = THAMES_MSG_CONTEXT_OP;
+	msg.hdr.seq = ida_alloc(&core->tdev->ipc_seq_ida, GFP_KERNEL);
+	msg.hdr.len = sizeof(msg);
+	msg.op = THAMES_CONTEXT_DESTROY;
+	msg.context_id = context_id;
+
+	return thames_rpmsg_send_raw(core, &msg, sizeof(msg));
+}
+
+int thames_rpmsg_send_map_bo(struct thames_core *core, u32 context_id, u32 bo_id, u64 vaddr,
+			     u64 paddr, u64 size)
+{
+	struct thames_msg_bo_op msg = {};
+
+	msg.hdr.type = THAMES_MSG_BO_OP;
+	msg.hdr.seq = ida_alloc(&core->tdev->ipc_seq_ida, GFP_KERNEL);
+	msg.hdr.len = sizeof(msg);
+	msg.op = THAMES_BO_MAP;
+	msg.context_id = context_id;
+	msg.bo_id = bo_id;
+	msg.vaddr = vaddr;
+	msg.paddr = paddr;
+	msg.size = size;
+
+	return thames_rpmsg_send_raw(core, &msg, sizeof(msg));
+}
+
+int thames_rpmsg_send_unmap_bo(struct thames_core *core, u32 context_id, u32 bo_id)
+{
+	struct thames_msg_bo_op msg = {};
+
+	msg.hdr.type = THAMES_MSG_BO_OP;
+	msg.hdr.seq = ida_alloc(&core->tdev->ipc_seq_ida, GFP_KERNEL);
+	msg.hdr.len = sizeof(msg);
+	msg.op = THAMES_BO_UNMAP;
+	msg.context_id = context_id;
+	msg.bo_id = bo_id;
+	msg.vaddr = 0;
+	msg.paddr = 0;
+	msg.size = 0;
+
+	return thames_rpmsg_send_raw(core, &msg, sizeof(msg));
+}
+
 int thames_rpmsg_ping_test(struct thames_core *core)
 {
 	const u32 test_data = THAMES_PING_TEST_PATTERN;

-- 
2.52.0

