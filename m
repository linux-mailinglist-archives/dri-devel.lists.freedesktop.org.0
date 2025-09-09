Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA02B4FD53
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 15:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1488410E23F;
	Tue,  9 Sep 2025 13:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="1jEy5fcx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652B610E23F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 13:36:38 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-3e2055ce8b7so2087338f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 06:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757424997; x=1758029797;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=A3K2CGHvkwip2S9fXZslbCnN2dA9eSP+jmcVGuT7SlY=;
 b=1jEy5fcxHmQU/RktK615WTrMJXfUdILEraj6Tuo1Kd2lkfI0P7TwJXlN6b5r2brXL1
 qNZRLfa96IsmQFMMEhU43CxP2isO+rgl5wb2xArgGUpQjK8TQk7tJaPMBgwYrsdkQMxD
 2uWz0PEdSvsGGTAWBTT31cudTXqxglsoIxeDIN21MoubnU0avOgGgD3PPggEc78fYsEW
 /IBAe7bs5yaBFbZ1zPRrh3wc1wjnl+sszJj/cbHqgU3b54Mgyrv93C15SeXqQBuB2FVm
 4HRdNZOH3xzrE2q4cnYQK/Ml0KI7O0rf5MX6/yzj1v+1MxvyWAA29wQzSkmMJKtL41Od
 gPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757424997; x=1758029797;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A3K2CGHvkwip2S9fXZslbCnN2dA9eSP+jmcVGuT7SlY=;
 b=AnLT4iicctxsS6LJc1h6u8ccvMHD+5mXXqPmN2zIE6u0IfhGIBrV3EoYzxgJALh1yQ
 Oca3EHD554OgSPXYcedoHqu4ZXDXTMO7MeXu2dg+7qGZY72x4rlBCF2zXNaeueHlZU9q
 1JHRULpookfSMuMFb53f7jVuDsMt48W9PEnyWt4JK34ejx7tMfk0t7VezyG5PatCgsOd
 2n/+4d0F6Ivy3dSTip7pAHTPVIx39AYzKLU3ia1xnrgaE0Yk6yz3/BimG52WNKAf7Yee
 jdCUcflI6T3dg0Ffx9not8jyE92lMgTpJT8g1/pkCY2usENZC7HMMgJeGeEVMsMHqHDn
 4EVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVq3lMKP+sKZOomLqxQGqsSKvB27e/BJ+rTZ5+/fP05GJYtRQos7bDJq76FPuZK0BPF4KsM5rI/1o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHaymzHb55MSsZKQiS3sHwlaG8F44Od+ruqBdGNmBmzzdKEHMN
 LakA4f+XRZc/gpwpmOtYuNdlgwtVnnGvXBqFEPDIPvRXTPrRYuZdEPLscu17IFtj+51SfxnwfWR
 3dSVDI37fOLAf39GUsw==
X-Google-Smtp-Source: AGHT+IGELjPGrMVoKzyVUw7RU0RDMDA/udhduYMsi2Ny05IaHAZWA9G7vbWFWV28nhJqeqUpd5PBZtW0fZu0Yc0=
X-Received: from wmsr5.prod.google.com ([2002:a05:600c:8b05:b0:45d:e24a:b2c0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:584c:0:b0:3c8:29eb:732e with SMTP id
 ffacd0b85a97d-3e6441e514cmr9781857f8f.59.1757424996971; 
 Tue, 09 Sep 2025 06:36:36 -0700 (PDT)
Date: Tue, 09 Sep 2025 13:36:22 +0000
In-Reply-To: <20250909-vmbo-defer-v2-0-9835d7349089@google.com>
Mime-Version: 1.0
References: <20250909-vmbo-defer-v2-0-9835d7349089@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=10349; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=WI82kuEYUQ/DPEWsSvq70ZbnanfAbLU9MPBdQKjIz5Q=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBowC1ihsTIK0KfmYoahEtBClUCqBDpZSy4eSBFW
 bn6h/piDMWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaMAtYgAKCRAEWL7uWMY5
 Rg3OEACk8y9W/LM++xVMHDgjaYE0tPI91cweb2VqlDz/FHHEbJyCXHYd4I1FmJqEEpJjOq8bqKu
 6ZuD1M0R4/c7f33VUiduDBgSdKAehQ+qoJsMR1bxN812IuFv4OlqTTW7kyJSC85DKH75rvAimzJ
 +FW/7RTsE9z15EVuhNxWw+XE1fiydOtL+dJJa5LG5EcSDKzcSHgU9BwMRL0DHxgy9fXvtbWqBK8
 5OVp8yPx9igDr31b0iC4jPA20LjBSGenGjmnNHnZBxsubgvNR6s7xS7rW5eOTQYEc4ChvaU6s3A
 aaF+EOZcjk0Lgq1MxRWSR95VNaEAzJkTFs4QvsKrLyYVCtXspZtaiMYFgVjpx8l8b6FwkamhQzT
 YXZRTFDCsZbocLyKll9Ie2eOTe9FQKFvChHeUltbEgigLbsVsG2kOyFy3PSzJDT6BZP85BPkRu1
 0zHWZBrOWMIjzB+Kith0F/hY01kp8aEqjHbtSVzfkecKYW/L8mHfXMOhh4z3iwUpbu4+aR8NO18
 viHv5hj9IcIEbYFVEDA6CNVnrsdPRrWZBhImFyeoLegHuzR6+u8wUHVESGYZ+RMraseqlLyyrMX
 6IwAIWGGJoJP+3m0PWup08/LqNaTLjpoPasBUkGi/yBl6TzlrN27zy28HOTi4eAePPKyEfJwhSo
 Vcs8YIidK1Al+Vw==
X-Mailer: b4 0.14.2
Message-ID: <20250909-vmbo-defer-v2-1-9835d7349089@google.com>
Subject: [PATCH v2 1/2] drm/gpuvm: add deferred vm_bo cleanup
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 "=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
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

When using GPUVM in immediate mode, it is necessary to call
drm_gpuvm_unlink() from the fence signalling critical path. However,
unlink may call drm_gpuvm_bo_put(), which causes some challenges:

1. drm_gpuvm_bo_put() often requires you to take resv locks, which you
   can't do from the fence signalling critical path.
2. drm_gpuvm_bo_put() calls drm_gem_object_put(), which is often going
   to be unsafe to call from the fence signalling critical path.

To solve these issues, add a deferred version of drm_gpuvm_unlink() that
adds the vm_bo to a deferred cleanup list, and then clean it up later.

The new methods take the GEMs GPUVA lock internally rather than letting
the caller do it because it also needs to perform an operation after
releasing the mutex again. This is to prevent freeing the GEM while
holding the mutex (more info as comments in the patch). This means that
the new methods can only be used with DRM_GPUVM_IMMEDIATE_MODE.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 174 ++++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_gpuvm.h     |  26 +++++++
 2 files changed, 200 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 78a1a4f095095e9379bdf604d583f6c8b9863ccb..5aa8b3813019705f70101950af2d8fe4e648e9d0 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -876,6 +876,27 @@ __drm_gpuvm_bo_list_add(struct drm_gpuvm *gpuvm, spinlock_t *lock,
 	cond_spin_unlock(lock, !!lock);
 }
 
+/**
+ * drm_gpuvm_bo_is_dead() - check whether this vm_bo is scheduled for cleanup
+ * @vm_bo: the &drm_gpuvm_bo
+ *
+ * When a vm_bo is scheduled for cleanup using the bo_defer list, it is not
+ * immediately removed from the evict and extobj lists if they are protected by
+ * the resv lock, as we can't take that lock during run_job() in immediate
+ * mode. Therefore, anyone iterating these lists should skip entries that are
+ * being destroyed.
+ *
+ * Checking the refcount without incrementing it is okay as long as the lock
+ * protecting the evict/extobj list is held for as long as you are using the
+ * vm_bo, because even if the refcount hits zero while you are using it, freeing
+ * the vm_bo requires taking the list's lock.
+ */
+static bool
+drm_gpuvm_bo_is_dead(struct drm_gpuvm_bo *vm_bo)
+{
+	return !kref_read(&vm_bo->kref);
+}
+
 /**
  * drm_gpuvm_bo_list_add() - insert a vm_bo into the given list
  * @__vm_bo: the &drm_gpuvm_bo
@@ -1081,6 +1102,9 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	INIT_LIST_HEAD(&gpuvm->evict.list);
 	spin_lock_init(&gpuvm->evict.lock);
 
+	INIT_LIST_HEAD(&gpuvm->bo_defer.list);
+	spin_lock_init(&gpuvm->bo_defer.lock);
+
 	kref_init(&gpuvm->kref);
 
 	gpuvm->name = name ? name : "unknown";
@@ -1122,6 +1146,8 @@ drm_gpuvm_fini(struct drm_gpuvm *gpuvm)
 		 "Extobj list should be empty.\n");
 	drm_WARN(gpuvm->drm, !list_empty(&gpuvm->evict.list),
 		 "Evict list should be empty.\n");
+	drm_WARN(gpuvm->drm, !list_empty(&gpuvm->bo_defer.list),
+		 "VM BO cleanup list should be empty.\n");
 
 	drm_gem_object_put(gpuvm->r_obj);
 }
@@ -1217,6 +1243,9 @@ drm_gpuvm_prepare_objects_locked(struct drm_gpuvm *gpuvm,
 
 	drm_gpuvm_resv_assert_held(gpuvm);
 	list_for_each_entry(vm_bo, &gpuvm->extobj.list, list.entry.extobj) {
+		if (drm_gpuvm_bo_is_dead(vm_bo))
+			continue;
+
 		ret = exec_prepare_obj(exec, vm_bo->obj, num_fences);
 		if (ret)
 			break;
@@ -1460,6 +1489,9 @@ drm_gpuvm_validate_locked(struct drm_gpuvm *gpuvm, struct drm_exec *exec)
 
 	list_for_each_entry_safe(vm_bo, next, &gpuvm->evict.list,
 				 list.entry.evict) {
+		if (drm_gpuvm_bo_is_dead(vm_bo))
+			continue;
+
 		ret = ops->vm_bo_validate(vm_bo, exec);
 		if (ret)
 			break;
@@ -1560,6 +1592,7 @@ drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
 
 	INIT_LIST_HEAD(&vm_bo->list.entry.extobj);
 	INIT_LIST_HEAD(&vm_bo->list.entry.evict);
+	INIT_LIST_HEAD(&vm_bo->list.entry.bo_defer);
 
 	return vm_bo;
 }
@@ -1621,6 +1654,113 @@ drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo)
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_bo_put);
 
+static void
+drm_gpuvm_bo_defer_locked(struct kref *kref)
+{
+	struct drm_gpuvm_bo *vm_bo = container_of(kref, struct drm_gpuvm_bo,
+						  kref);
+	struct drm_gpuvm *gpuvm = vm_bo->vm;
+
+	if (!drm_gpuvm_resv_protected(gpuvm)) {
+		drm_gpuvm_bo_list_del(vm_bo, extobj, true);
+		drm_gpuvm_bo_list_del(vm_bo, evict, true);
+	}
+
+	list_del(&vm_bo->list.entry.gem);
+}
+
+static void
+drm_gpuvm_bo_defer(struct kref *kref)
+{
+	struct drm_gpuvm_bo *vm_bo = container_of(kref, struct drm_gpuvm_bo,
+						  kref);
+
+	mutex_lock(&vm_bo->obj->gpuva.lock);
+	drm_gpuvm_bo_defer_locked(kref);
+	mutex_unlock(&vm_bo->obj->gpuva.lock);
+
+	/*
+	 * It's important that the GEM stays alive for the duration in which we
+	 * hold the mutex, but the instant we add the vm_bo to bo_defer,
+	 * another thread might call drm_gpuvm_bo_deferred_cleanup() and put
+	 * the GEM. Therefore, to avoid kfreeing a mutex we are holding, we add
+	 * the vm_bo to bo_defer *after* releasing the GEM's mutex.
+	 */
+	drm_gpuvm_bo_list_add(vm_bo, bo_defer, true);
+}
+
+/**
+ * drm_gpuvm_bo_put_deferred() - drop a struct drm_gpuvm_bo reference with
+ * deferred cleanup
+ * @vm_bo: the &drm_gpuvm_bo to release the reference of
+ *
+ * This releases a reference to @vm_bo.
+ *
+ * This might take and release the GEMs GPUVA lock. You should call
+ * drm_gpuvm_bo_deferred_cleanup() later to complete the cleanup process.
+ *
+ * Returns: true if vm_bo is being destroyed, false otherwise.
+ */
+bool
+drm_gpuvm_bo_put_deferred(struct drm_gpuvm_bo *vm_bo)
+{
+	if (!vm_bo)
+		return false;
+
+	drm_WARN_ON(vm_bo->vm->drm, !drm_gpuvm_immediate_mode(vm_bo->vm));
+
+	return !!kref_put(&vm_bo->kref, drm_gpuvm_bo_defer);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_put_deferred);
+
+/**
+ * drm_gpuvm_bo_deferred_cleanup() - clean up BOs in the deferred list
+ * deferred cleanup
+ * @gpuvm: the VM to clean up
+ *
+ * Cleans up &drm_gpuvm_bo instances in the deferred cleanup list.
+ */
+void
+drm_gpuvm_bo_deferred_cleanup(struct drm_gpuvm *gpuvm)
+{
+	const struct drm_gpuvm_ops *ops = gpuvm->ops;
+	struct drm_gpuvm_bo *vm_bo;
+	struct drm_gem_object *obj;
+	LIST_HEAD(bo_defer);
+
+	spin_lock(&gpuvm->bo_defer.lock);
+	list_replace_init(&gpuvm->bo_defer.list, &bo_defer);
+	spin_unlock(&gpuvm->bo_defer.lock);
+
+	if (list_empty(&bo_defer))
+		return;
+
+	if (drm_gpuvm_resv_protected(gpuvm)) {
+		dma_resv_lock(drm_gpuvm_resv(gpuvm), NULL);
+		list_for_each_entry(vm_bo, &bo_defer, list.entry.bo_defer) {
+			drm_gpuvm_bo_list_del(vm_bo, extobj, false);
+			drm_gpuvm_bo_list_del(vm_bo, evict, false);
+		}
+		dma_resv_unlock(drm_gpuvm_resv(gpuvm));
+	}
+
+	while (!list_empty(&bo_defer)) {
+		vm_bo = list_first_entry(&bo_defer,
+			struct drm_gpuvm_bo, list.entry.bo_defer);
+		obj = vm_bo->obj;
+
+		list_del(&vm_bo->list.entry.bo_defer);
+		if (ops && ops->vm_bo_free)
+			ops->vm_bo_free(vm_bo);
+		else
+			kfree(vm_bo);
+
+		drm_gpuvm_put(gpuvm);
+		drm_gem_object_put(obj);
+	}
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_deferred_cleanup);
+
 static struct drm_gpuvm_bo *
 __drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
 		    struct drm_gem_object *obj)
@@ -1948,6 +2088,40 @@ drm_gpuva_unlink(struct drm_gpuva *va)
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_unlink);
 
+/**
+ * drm_gpuva_unlink_defer() - unlink a &drm_gpuva with deferred vm_bo cleanup
+ * @va: the &drm_gpuva to unlink
+ *
+ * Similar to drm_gpuva_unlink(), but uses drm_gpuvm_bo_put_deferred() and takes
+ * the lock for the caller.
+ */
+void
+drm_gpuva_unlink_defer(struct drm_gpuva *va)
+{
+	struct drm_gem_object *obj = va->gem.obj;
+	struct drm_gpuvm_bo *vm_bo = va->vm_bo;
+	bool should_defer_bo;
+
+	if (unlikely(!obj))
+		return;
+
+	drm_WARN_ON(vm_bo->vm->drm, !drm_gpuvm_immediate_mode(vm_bo->vm));
+
+	mutex_lock(&obj->gpuva.lock);
+	list_del_init(&va->gem.entry);
+
+	/*
+	 * This is drm_gpuvm_bo_put_deferred() except we already hold the mutex.
+	 */
+	should_defer_bo = kref_put(&vm_bo->kref, drm_gpuvm_bo_defer_locked);
+	mutex_unlock(&obj->gpuva.lock);
+	if (should_defer_bo)
+		drm_gpuvm_bo_list_add(vm_bo, bo_defer, true);
+
+	va->vm_bo = NULL;
+}
+EXPORT_SYMBOL_GPL(drm_gpuva_unlink_defer);
+
 /**
  * drm_gpuva_find_first() - find the first &drm_gpuva in the given range
  * @gpuvm: the &drm_gpuvm to search in
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 727b8f336fad0d853998e4379cbd374155468e18..1f80389e14312f552a8abc95d12f52f83beb9be8 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -152,6 +152,7 @@ void drm_gpuva_remove(struct drm_gpuva *va);
 
 void drm_gpuva_link(struct drm_gpuva *va, struct drm_gpuvm_bo *vm_bo);
 void drm_gpuva_unlink(struct drm_gpuva *va);
+void drm_gpuva_unlink_defer(struct drm_gpuva *va);
 
 struct drm_gpuva *drm_gpuva_find(struct drm_gpuvm *gpuvm,
 				 u64 addr, u64 range);
@@ -331,6 +332,22 @@ struct drm_gpuvm {
 		 */
 		spinlock_t lock;
 	} evict;
+
+	/**
+	 * @bo_defer: structure holding vm_bos that need to be destroyed
+	 */
+	struct {
+		/**
+		 * @bo_defer.list: &list_head storing &drm_gpuvm_bos that need
+		 * to be destroyed
+		 */
+		struct list_head list;
+
+		/**
+		 * @bo_defer.lock: spinlock to protect the bo_defer list
+		 */
+		spinlock_t lock;
+	} bo_defer;
 };
 
 void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
@@ -714,6 +731,12 @@ struct drm_gpuvm_bo {
 			 * &drm_gpuvms evict list.
 			 */
 			struct list_head evict;
+
+			/**
+			 * @list.entry.bo_defer: List entry to attach to
+			 * the &drm_gpuvms bo_defer list.
+			 */
+			struct list_head bo_defer;
 		} entry;
 	} list;
 };
@@ -746,6 +769,9 @@ drm_gpuvm_bo_get(struct drm_gpuvm_bo *vm_bo)
 
 bool drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo);
 
+bool drm_gpuvm_bo_put_deferred(struct drm_gpuvm_bo *vm_bo);
+void drm_gpuvm_bo_deferred_cleanup(struct drm_gpuvm *gpuvm);
+
 struct drm_gpuvm_bo *
 drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
 		  struct drm_gem_object *obj);

-- 
2.51.0.384.g4c02a37b29-goog

