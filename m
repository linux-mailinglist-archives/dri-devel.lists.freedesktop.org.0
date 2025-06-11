Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D625AD6314
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 00:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CA210E747;
	Wed, 11 Jun 2025 22:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="BmzjtkT/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DC710E74A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 22:52:21 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-742c27df0daso339032b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 15:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1749682341; x=1750287141;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZL7bJXlrc4QuKLK+LAdR7e7yY1tvCUZtU7oEuPGARqU=;
 b=BmzjtkT/ofOh5cbrxcYUwfppbdAlcxKoDJ/S3mf7TXy6Wxb+3F3dwHzzMmgq/MkWqd
 CjRubUcCi0v1ZlqJRsiO7z//qKtx+Z0+mCQvdCys811s8EFk5IXOpdAAJdPFlocQEdME
 w3tva1CkDj82zFItube1gJNqvEALJtUuKh1e8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749682341; x=1750287141;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZL7bJXlrc4QuKLK+LAdR7e7yY1tvCUZtU7oEuPGARqU=;
 b=Xs+s6GY44czYXUTqcOOvp1FVMnZsLfVR9506819toviAUDioOLBRCxHZnrWP2OIJj1
 ksEG2wzMsIG3gUEU/rQLi5Gw8FYVa/DJpMIKt/LQENECiFAx+z6WRYN92xNzLbN5m+Rt
 oZPe39rNkfu3OCWFGOWBpkvIjkBTZQMOOE8QkMz0YL0seRkYSpzZ85KnvGIejEdFguvf
 8bsdH70H7GK4hvc56zSbizUrmljKlAU1olu44cwq6z/b7xfisNJs4qL0UFhIHhHwkVcH
 Kpfnaht2HtCUZczPt2qdBFXkuwJbYe0XZsqedVF7uYUCDZB4kbO9wvXKbEv+rSdtFy6+
 y8wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIWIMltULqt2F3m8H8k4pno6PaYtLdut6J6epIU6sRc8DNXbsWNGJTmgaWp3TBQNo/qqbXn0J2VBY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyfoo0B2YNsOG6qVqCKvgNxKXLS8JowyN4SSSCxIvvrxGjxcOPC
 HyDWW66iV2PNW9Dd+C11Nm+iruYsy/+8ewy3gBtlPhlvNqqwD+WF2WqykQdA0Y3uVw==
X-Gm-Gg: ASbGncs+31EUyUpEMYPclfDaXBEkQCxg/sO852MA3nOEfxCgJYINSC02ACWV/3Mn1GF
 zhCDGMl9XTSmhHab+quyXYDkIS5B0xEY46+VNlfoLXb1FKZNvXEgVfpYO/1dINHtn2GoHhTjTsP
 X5VHtq2Idg6lcsp+wnMr1WnYikEZVeP10dAzFa4bWIO/I7dcftCQi8V4LR0VTe/mhyf7ps5yTjp
 1TPxwAixxO7aUZZjUtYoer3Os+PEIx/RzGqpawt0ud0Fe3wRT/1kXT7NoxtHMTtGyyBmSQC7HaD
 TkDdts5exCdqTHERmKUEMgLmfuJaDsb695wVsci/rtp0i7JZTZbB/tj21Rpo9V+QxpbL8HEuxGL
 Zn2Nux9Mg+zqjn+PZwJPlXTrD/RyemAMd2XVgyAhnF95tuOeQVys=
X-Google-Smtp-Source: AGHT+IGHrL2te5ihrUuSVrWd9Wurw58yUglqWTjphT5nGaKOd907H3nFWcTEOlXwRmthLOhSnxLKSA==
X-Received: by 2002:a05:6a00:4f93:b0:748:2fa4:14c0 with SMTP id
 d2e1a72fcca58-7486ca40308mr6133459b3a.0.1749682340668; 
 Wed, 11 Jun 2025 15:52:20 -0700 (PDT)
Received: from justonli3.c.googlers.com.com
 (11.103.168.34.bc.googleusercontent.com. [34.168.103.11])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74880a0bf68sm90555b3a.163.2025.06.11.15.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:52:20 -0700 (PDT)
From: Juston Li <justonli@chromium.org>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Yiwei Zhang <zzyiwei@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Juston Li <justonli@chromium.org>
Subject: [PATCH v4 2/2] drm/xe/bo: add GPU memory trace points
Date: Wed, 11 Jun 2025 15:51:24 -0700
Message-ID: <20250611225145.1739201-2-justonli@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250611225145.1739201-1-justonli@chromium.org>
References: <20250611225145.1739201-1-justonli@chromium.org>
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

Add TRACE_GPU_MEM tracepoints for tracking global and per-process GPU
memory usage.

These are required by VSR on Android 12+ for reporting GPU driver memory
allocations.

v3:
 - Use now configurable CONFIG_TRACE_GPU_MEM instead of adding a
   per-driver Kconfig (Lucas)

v2:
 - Use u64 as preferred by checkpatch (Tvrtko)
 - Fix errors in comments/Kconfig description (Tvrtko)
 - drop redundant "CONFIG" in Kconfig

Signed-off-by: Juston Li <justonli@chromium.org>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 47 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h | 16 ++++++++++
 2 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4e39188a021ab..89a3d23e3b800 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -19,6 +19,8 @@
 
 #include <kunit/static_stub.h>
 
+#include <trace/events/gpu_mem.h>
+
 #include "xe_device.h"
 #include "xe_dma_buf.h"
 #include "xe_drm_client.h"
@@ -418,6 +420,35 @@ static void xe_ttm_tt_account_subtract(struct xe_device *xe, struct ttm_tt *tt)
 		xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages, 0);
 }
 
+#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
+static void update_global_total_pages(struct ttm_device *ttm_dev, long num_pages)
+{
+	struct xe_device *xe = ttm_to_xe_device(ttm_dev);
+	u64 global_total_pages =
+		atomic64_add_return(num_pages, &xe->global_total_pages);
+
+	trace_gpu_mem_total(0, 0, global_total_pages << PAGE_SHIFT);
+}
+
+static void update_process_mem(struct drm_file *file, ssize_t size)
+{
+	struct xe_file *xef = to_xe_file(file);
+	u64 process_mem = atomic64_add_return(size, &xef->process_mem);
+
+	rcu_read_lock(); /* Locks file->pid! */
+	trace_gpu_mem_total(0, pid_nr(rcu_dereference(file->pid)), process_mem);
+	rcu_read_unlock();
+}
+#else
+static inline void update_global_total_pages(struct ttm_device *ttm_dev, long num_pages)
+{
+}
+
+static inline void update_process_mem(struct drm_file *file, ssize_t size)
+{
+}
+#endif
+
 static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 				       u32 page_flags)
 {
@@ -525,6 +556,7 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 
 	xe_tt->purgeable = false;
 	xe_ttm_tt_account_add(ttm_to_xe_device(ttm_dev), tt);
+	update_global_total_pages(ttm_dev, tt->num_pages);
 
 	return 0;
 }
@@ -541,6 +573,7 @@ static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt *tt)
 
 	ttm_pool_free(&ttm_dev->pool, tt);
 	xe_ttm_tt_account_subtract(xe, tt);
+	update_global_total_pages(ttm_dev, -(long)tt->num_pages);
 }
 
 static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
@@ -1653,6 +1686,15 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
 	ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
 }
 
+#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
+static int xe_gem_object_open(struct drm_gem_object *obj,
+			      struct drm_file *file_priv)
+{
+	update_process_mem(file_priv, obj->size);
+	return 0;
+}
+#endif
+
 static void xe_gem_object_close(struct drm_gem_object *obj,
 				struct drm_file *file_priv)
 {
@@ -1665,6 +1707,8 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
 		ttm_bo_set_bulk_move(&bo->ttm, NULL);
 		xe_bo_unlock(bo);
 	}
+
+	update_process_mem(file_priv, -obj->size);
 }
 
 static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
@@ -1762,6 +1806,9 @@ static const struct vm_operations_struct xe_gem_vm_ops = {
 
 static const struct drm_gem_object_funcs xe_gem_object_funcs = {
 	.free = xe_gem_object_free,
+#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
+	.open = xe_gem_object_open,
+#endif
 	.close = xe_gem_object_close,
 	.mmap = drm_gem_ttm_mmap,
 	.export = xe_gem_prime_export,
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index e5d02a47a5287..b797e766ccbc2 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -641,6 +641,14 @@ struct xe_device {
 		unsigned int fsb_freq, mem_freq, is_ddr3;
 	};
 #endif
+
+#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
+	/**
+	 * @global_total_pages: global GPU page usage tracked for gpu_mem
+	 * tracepoints
+	 */
+	atomic64_t global_total_pages;
+#endif
 };
 
 /**
@@ -702,6 +710,14 @@ struct xe_file {
 
 	/** @refcount: ref count of this xe file */
 	struct kref refcount;
+
+#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
+	/**
+	 * @process_mem: per-process GPU memory usage tracked for gpu_mem
+	 * tracepoints
+	 */
+	atomic64_t process_mem;
+#endif
 };
 
 #endif
-- 
2.50.0.rc1.591.g9c95f17f64-goog

