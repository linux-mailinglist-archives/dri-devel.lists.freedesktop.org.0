Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E35BACD00F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 00:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF35B10E14B;
	Tue,  3 Jun 2025 22:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Lf/XEPcN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9381110E14B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 22:51:56 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-3109f106867so7688610a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 15:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1748991116; x=1749595916;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pQtIm8Qw2Jo2k5WXtPniCbCagu3ANcvBrhcV6bIayS0=;
 b=Lf/XEPcNGxo6UdGsWKYN2Ef+BXJyja1NQ6pqWAvk6lnWW6JnfECvHk1o0NLh+x7hI9
 /cW72Z7/B7f83teNIyEhFCwf23jeNlMGx6tR01kVXyTbXKs80a/3H6jdYcvXPaUzE7bP
 qrvOd4NyLH+o/zaIhWNT4/EVTDXeHTfvMl01Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748991116; x=1749595916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pQtIm8Qw2Jo2k5WXtPniCbCagu3ANcvBrhcV6bIayS0=;
 b=Y5k04ZIUrEglAR5/HQHwIHuk28h8FugjGUnpGvPM+Ld09R2rvrN6lV37wvnc5O/fCA
 Hg0qSyaTK3I5wSti1mk0lcvCEHWcmiN8/j5AaFevYdyvh54qjmRGUnhTameDGYi+xFyu
 pSKy/H7IMclQQtwnvhjWBnG1azBvok3eRsr6Q5wZa1Oz/ufJY6PafzRpNFUX3yP9qitK
 N78M4McvTEJjU4zrxDzCNYPzBb09lyIbiYcymSMhNQGIPmAIG/gkuHqxJiP3wEqjA0m3
 4UZRvPCoKHFlsEVGbS7Z0jBVHVgoCA3ll93smLJ9oe1u6T9Imo/3HfzeZA9IGt//ZEE2
 xqIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQo1wgbjKg3J6fOVn7Uw9B50FtFJXTbFFGLYdl5xCZheq1OAgqgVq4VzYzHbxNN3oIdDuAl1ReyVQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyI1E2f7xAGc7uv+nIBsDIU0/8hcKyKjaVvCE9ZAkfGCoAZd/H/
 FcasjnjaqREysyTGJQVbkBNAmTepFxlQaS3V9UGioIeYMfQ+fUOlvBRmUD9kbUksZQ==
X-Gm-Gg: ASbGnctSKSv7+VyDpsLh7oh7GZ3S6WBQGuDFWmiSJPiB2rNAmV/4lUQoxZiEhzJ2Oin
 aTvP6MALwPbwBBL2WHiFEtwFStr5Pq8cQBcUdeG6J8+akzj7rWKvDsD5AZ+sWe4soxU3SxVRTdW
 yGdKxOu4xlaib053IUIMtTCN+rqGN6N+o+6PQetudzKoJvzWzKDCb8hUWs7I/ZX4SnvH7Ih80Su
 8PH96FQ0M9Od/NmZX3gAF9sWm2ihDTXNG67/tF9AzE+V5BkLS2S4YvETW5xNsArIWG4nclyh697
 2wvuXz8jTpDOYF4jybe7BOoxm9f3dbQksIgGjH3TJeAzeDT1bb80VBOMCJrTGT99XIU49uYpV+w
 8rWsWGp+0gb0FVhbG3OhBs08pKQvP0aEZLVr/+Idp
X-Google-Smtp-Source: AGHT+IHfYyZjLrw1JxdKJ89BHLxE4INazE6QYEzAdgzgkzH2cy3KJUO8DdmKwexaYfz8UOKq8tzMug==
X-Received: by 2002:a17:90b:5290:b0:312:1c83:58ec with SMTP id
 98e67ed59e1d1-3130cd14d19mr1458809a91.12.1748991116310; 
 Tue, 03 Jun 2025 15:51:56 -0700 (PDT)
Received: from justonli3.c.googlers.com.com
 (11.103.168.34.bc.googleusercontent.com. [34.168.103.11])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e29fcecsm7723706a91.4.2025.06.03.15.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 15:51:55 -0700 (PDT)
From: Juston Li <justonli@chromium.org>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Yiwei Zhang <zzyiwei@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Juston Li <justonli@chromium.org>
Subject: [PATCH v3 2/2] drm/xe/bo: add GPU memory trace points
Date: Tue,  3 Jun 2025 15:50:07 -0700
Message-ID: <20250603225123.2535767-2-justonli@chromium.org>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
In-Reply-To: <20250603225123.2535767-1-justonli@chromium.org>
References: <20250603225123.2535767-1-justonli@chromium.org>
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
index 61d208c852814..cb5f5821b1818 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -19,6 +19,8 @@
 
 #include <kunit/static_stub.h>
 
+#include <trace/events/gpu_mem.h>
+
 #include "xe_device.h"
 #include "xe_dma_buf.h"
 #include "xe_drm_client.h"
@@ -420,6 +422,35 @@ static void xe_ttm_tt_account_subtract(struct ttm_tt *tt)
 		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, -(long)tt->num_pages, 0);
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
@@ -528,6 +559,7 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 
 	xe_tt->purgeable = false;
 	xe_ttm_tt_account_add(tt);
+	update_global_total_pages(ttm_dev, tt->num_pages);
 
 	return 0;
 }
@@ -542,6 +574,7 @@ static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt *tt)
 
 	ttm_pool_free(&ttm_dev->pool, tt);
 	xe_ttm_tt_account_subtract(tt);
+	update_global_total_pages(ttm_dev, -(long)tt->num_pages);
 }
 
 static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
@@ -1652,6 +1685,15 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
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
@@ -1664,6 +1706,8 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
 		ttm_bo_set_bulk_move(&bo->ttm, NULL);
 		xe_bo_unlock(bo);
 	}
+
+	update_process_mem(file_priv, -obj->size);
 }
 
 static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
@@ -1761,6 +1805,9 @@ static const struct vm_operations_struct xe_gem_vm_ops = {
 
 static const struct drm_gem_object_funcs xe_gem_object_funcs = {
 	.free = xe_gem_object_free,
+#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
+	.open = xe_gem_object_open,
+#endif
 	.close = xe_gem_object_close,
 	.mmap = drm_gem_ttm_mmap,
 	.export = xe_gem_prime_export,
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 043515f8c068b..c94becaa12d25 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -643,6 +643,14 @@ struct xe_device {
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
@@ -704,6 +712,14 @@ struct xe_file {
 
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
2.49.0.1204.g71687c7c1d-goog

