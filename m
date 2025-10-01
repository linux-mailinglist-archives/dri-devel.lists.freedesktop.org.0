Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A971EBB008E
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 12:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CEE10E34A;
	Wed,  1 Oct 2025 10:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="gIKsUCbX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com
 [209.85.218.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E0410E341
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 10:41:50 +0000 (UTC)
Received: by mail-ej1-f74.google.com with SMTP id
 a640c23a62f3a-afcb7338319so584328966b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 03:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759315309; x=1759920109;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=QBpG64BMA+n3mUB7jPVwGE8MpSp12Y17XaQpGfu9n7I=;
 b=gIKsUCbXAoM2oVfb+J2XQXdIAt76Gcb+cqA3z6C0Cd4eKMFn5jCwWkLv9W4+Q5CPev
 8XM7oLag1KWY32EIFjTRzC5v0fgGP/OHDDLqhJlQHLmrGGOgs6SyK8Gli2rpsXleTE8Y
 LIAYAwybG+q5GhQdhNt2RQQxgsN9gnb4U8/mJiWjs/qFZLvV0zj+xzBGaX/Sl4Y8yv64
 O3wAAa2oyTBvtCVNLWCk21JpK536kXk3GrIKRgkzZOLpP3EBv6gy3FmTvHXn1N1cvQcw
 IMNPSJ+d+tLL7yZwSAAo9Oov8/sAX5tOFSSd1LVZxhW0wHh5/2BR/J5BPFHU/uZK5xpf
 CLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759315309; x=1759920109;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QBpG64BMA+n3mUB7jPVwGE8MpSp12Y17XaQpGfu9n7I=;
 b=arLh+AycaMCBH438787A2ZihWkgZVdG5iygVKvV/X0kaI5QKg22mhOKbUe9BnHdCXG
 0Dmn7VaknO0XfyxNMWF6gKr7It78K/t+TIC1dVxJY2KElzJa14QYusT91Bk9cAsqqDzt
 yzPJhn18RCEGxCT60V42JuZw36PAZoYlk1/PVXWVlPNe+qgEahMYhuvJkHL7diXraMzf
 YaF4rbrU/rsXgDYo0C00s5jfiFOGcsDLqn3gSvqNXDo/okT8ozbYkQCc6Uz9fDM/bTI/
 gGPpWBE8Jm4O85DWwbPRk5RUjSeE5pK+g7h4SHcqs7sJ6Rfo5ZDXqrBr8lC7kroBQIby
 4tBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX94QPaq2Q0fqwcWSfPA/pJAzz8O3ASG8o/FyGB2yONcbkjEnoUFjB1OzAYvgprx2KfsOSImp3z/iU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxtibdKbVIxtQrKyqllN8l+GJS7ypWTIV27PQwzPNrLLHwWfVO
 ZgjK6fag1OJ/pc38e1g66FTeJaRAoq9oeLtD0aYRQgpMBnIDncYHTFrk18NP4C9m0WFq386EbO3
 /hgdUYhAOVodFKVTa8w==
X-Google-Smtp-Source: AGHT+IFlcRonXnEVXM7LiFkcI8yiCsyrjiVhLgytwJ4+7gyIbeVhDSedPQb647sB4Ho+OROeap4q9Pvclg7Ig3o=
X-Received: from ejzk25.prod.google.com ([2002:a17:906:a399:b0:b3e:29cf:4535])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3ea1:b0:b44:2d0:e05f with SMTP id
 a640c23a62f3a-b46e6339e30mr379109666b.33.1759315309379; 
 Wed, 01 Oct 2025 03:41:49 -0700 (PDT)
Date: Wed, 01 Oct 2025 10:41:36 +0000
In-Reply-To: <20251001-vmbo-defer-v3-0-a3fe6b6ae185@google.com>
Mime-Version: 1.0
References: <20251001-vmbo-defer-v3-0-a3fe6b6ae185@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=10607; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=xbXmpmRdsU8b8NZ3taDqhMtUywk4XL8xmoamv/7M38M=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBo3QVqUkkzy4DuMBpN9FQPoar2swWTfjVpaVFb/
 tFNDOIKugSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaN0FagAKCRAEWL7uWMY5
 Rs0TD/9lrVMbSb4Cr2bI0B3d2ON1GMlTQwPaSe7Jwepe16hCvKFW2G/SjlzKsjIFJ1+teLGpc3o
 lOlvb4B2qbXyYyhFaArhitXEHGUbZX5jUdJlh2oQsoZZhFK5zSb9ficDKxp1mqZSKLLL9OdTk3G
 hMO2vxf0+kRuGMtefOLUzdrpJqscCFJOYQ7tMBJraj/sPbbI9spLKj3IMKh/GRweK+6MWHjxCKh
 Ezd/RgC+OUWW8ZeFL10blrlXlUYT+jEm6+nLlt5W1U+n5+BcIZ1l3cv7vJvQdYdAjuP+EviNUi5
 SvlzTnfJurhGiEBBdexzNrJCqLE44pkQaJpopb6JWZxgoDcrYI5KmHjX/eJ7TJ+kRJPjtMiSed+
 ndrLNLUYIVp7vvS1DIKe1FheQ1Q3LPZs6NU6loL4S4akIOpoQMClMDkYGc5kQC8fT0o5XYdRfK+
 k99W1J92rgcXnEOJKMzgsuQrjTmrlA7ehmf6kt4C5qe5IjPBRXh/ylVK5M1V99X5zPjLo6+uY91
 ND/DJABBqAqXw71CAJL+i+OTwrnfUoI3DcMlDsd3SpcZ1ESwbMMF0SaJb+/KdnLPxhJLhs0O1WH
 A+gF2b/Z7pdrUTMd8x9T8/Li+8vjk4TxwtAg9yJLBwUGIomqZua8kU1PS5+pHhbYiZTboLn7KqX
 qY66LN4E/jfJgmg==
X-Mailer: b4 0.14.2
Message-ID: <20251001-vmbo-defer-v3-1-a3fe6b6ae185@google.com>
Subject: [PATCH v3 1/2] drm/gpuvm: add deferred vm_bo cleanup
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

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 184 ++++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_gpuvm.h     |  16 ++++
 2 files changed, 200 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index a52e95555549a16c062168253477035679d4775b..a530cf0864c5dd837840f31d3e698d4a82c58d3c 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -876,6 +876,27 @@ __drm_gpuvm_bo_list_add(struct drm_gpuvm *gpuvm, spinlock_t *lock,
 	cond_spin_unlock(lock, !!lock);
 }
 
+/**
+ * drm_gpuvm_bo_is_zombie() - check whether this vm_bo is scheduled for cleanup
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
+drm_gpuvm_bo_is_zombie(struct drm_gpuvm_bo *vm_bo)
+{
+	return !kref_read(&vm_bo->kref);
+}
+
 /**
  * drm_gpuvm_bo_list_add() - insert a vm_bo into the given list
  * @__vm_bo: the &drm_gpuvm_bo
@@ -1081,6 +1102,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	INIT_LIST_HEAD(&gpuvm->evict.list);
 	spin_lock_init(&gpuvm->evict.lock);
 
+	init_llist_head(&gpuvm->bo_defer);
+
 	kref_init(&gpuvm->kref);
 
 	gpuvm->name = name ? name : "unknown";
@@ -1122,6 +1145,8 @@ drm_gpuvm_fini(struct drm_gpuvm *gpuvm)
 		 "Extobj list should be empty.\n");
 	drm_WARN(gpuvm->drm, !list_empty(&gpuvm->evict.list),
 		 "Evict list should be empty.\n");
+	drm_WARN(gpuvm->drm, !llist_empty(&gpuvm->bo_defer),
+		 "VM BO cleanup list should be empty.\n");
 
 	drm_gem_object_put(gpuvm->r_obj);
 }
@@ -1217,6 +1242,9 @@ drm_gpuvm_prepare_objects_locked(struct drm_gpuvm *gpuvm,
 
 	drm_gpuvm_resv_assert_held(gpuvm);
 	list_for_each_entry(vm_bo, &gpuvm->extobj.list, list.entry.extobj) {
+		if (drm_gpuvm_bo_is_zombie(vm_bo))
+			continue;
+
 		ret = exec_prepare_obj(exec, vm_bo->obj, num_fences);
 		if (ret)
 			break;
@@ -1460,6 +1488,9 @@ drm_gpuvm_validate_locked(struct drm_gpuvm *gpuvm, struct drm_exec *exec)
 
 	list_for_each_entry_safe(vm_bo, next, &gpuvm->evict.list,
 				 list.entry.evict) {
+		if (drm_gpuvm_bo_is_zombie(vm_bo))
+			continue;
+
 		ret = ops->vm_bo_validate(vm_bo, exec);
 		if (ret)
 			break;
@@ -1560,6 +1591,7 @@ drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
 
 	INIT_LIST_HEAD(&vm_bo->list.entry.extobj);
 	INIT_LIST_HEAD(&vm_bo->list.entry.evict);
+	init_llist_node(&vm_bo->list.entry.bo_defer);
 
 	return vm_bo;
 }
@@ -1621,6 +1653,124 @@ drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo)
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_bo_put);
 
+/*
+ * Must be called with GEM mutex held. After releasing GEM mutex,
+ * drm_gpuvm_bo_defer_free_unlocked() must be called.
+ */
+static void
+drm_gpuvm_bo_defer_free_locked(struct kref *kref)
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
+/*
+ * GEM mutex must not be held. Called after drm_gpuvm_bo_defer_free_locked().
+ */
+static void
+drm_gpuvm_bo_defer_free_unlocked(struct drm_gpuvm_bo *vm_bo)
+{
+	struct drm_gpuvm *gpuvm = vm_bo->vm;
+
+	llist_add(&vm_bo->list.entry.bo_defer, &gpuvm->bo_defer);
+}
+
+static void
+drm_gpuvm_bo_defer_free(struct kref *kref)
+{
+	struct drm_gpuvm_bo *vm_bo = container_of(kref, struct drm_gpuvm_bo,
+						  kref);
+
+	mutex_lock(&vm_bo->obj->gpuva.lock);
+	drm_gpuvm_bo_defer_free_locked(kref);
+	mutex_unlock(&vm_bo->obj->gpuva.lock);
+
+	/*
+	 * It's important that the GEM stays alive for the duration in which we
+	 * hold the mutex, but the instant we add the vm_bo to bo_defer,
+	 * another thread might call drm_gpuvm_bo_deferred_cleanup() and put
+	 * the GEM. Therefore, to avoid kfreeing a mutex we are holding, we add
+	 * the vm_bo to bo_defer *after* releasing the GEM's mutex.
+	 */
+	drm_gpuvm_bo_defer_free_unlocked(vm_bo);
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
+	return !!kref_put(&vm_bo->kref, drm_gpuvm_bo_defer_free);
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
+	struct llist_node *bo_defer;
+
+	bo_defer = llist_del_all(&gpuvm->bo_defer);
+	if (!bo_defer)
+		return;
+
+	if (drm_gpuvm_resv_protected(gpuvm)) {
+		dma_resv_lock(drm_gpuvm_resv(gpuvm), NULL);
+		llist_for_each_entry(vm_bo, bo_defer, list.entry.bo_defer) {
+			drm_gpuvm_bo_list_del(vm_bo, extobj, false);
+			drm_gpuvm_bo_list_del(vm_bo, evict, false);
+		}
+		dma_resv_unlock(drm_gpuvm_resv(gpuvm));
+	}
+
+	while (bo_defer) {
+		vm_bo = llist_entry(bo_defer,
+			struct drm_gpuvm_bo, list.entry.bo_defer);
+		bo_defer = bo_defer->next;
+		obj = vm_bo->obj;
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
@@ -1948,6 +2098,40 @@ drm_gpuva_unlink(struct drm_gpuva *va)
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
+	should_defer_bo = kref_put(&vm_bo->kref, drm_gpuvm_bo_defer_free_locked);
+	mutex_unlock(&obj->gpuva.lock);
+	if (should_defer_bo)
+		drm_gpuvm_bo_defer_free_unlocked(vm_bo);
+
+	va->vm_bo = NULL;
+}
+EXPORT_SYMBOL_GPL(drm_gpuva_unlink_defer);
+
 /**
  * drm_gpuva_find_first() - find the first &drm_gpuva in the given range
  * @gpuvm: the &drm_gpuvm to search in
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 8890ded1d90752a2acbb564f697aa5ab03b5d052..81cc7672cf2d5362c637abfa2a75471e5274ed08 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -27,6 +27,7 @@
 
 #include <linux/dma-resv.h>
 #include <linux/list.h>
+#include <linux/llist.h>
 #include <linux/rbtree.h>
 #include <linux/types.h>
 
@@ -152,6 +153,7 @@ void drm_gpuva_remove(struct drm_gpuva *va);
 
 void drm_gpuva_link(struct drm_gpuva *va, struct drm_gpuvm_bo *vm_bo);
 void drm_gpuva_unlink(struct drm_gpuva *va);
+void drm_gpuva_unlink_defer(struct drm_gpuva *va);
 
 struct drm_gpuva *drm_gpuva_find(struct drm_gpuvm *gpuvm,
 				 u64 addr, u64 range);
@@ -331,6 +333,11 @@ struct drm_gpuvm {
 		 */
 		spinlock_t lock;
 	} evict;
+
+	/**
+	 * @bo_defer: structure holding vm_bos that need to be destroyed
+	 */
+	struct llist_head bo_defer;
 };
 
 void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
@@ -714,6 +721,12 @@ struct drm_gpuvm_bo {
 			 * &drm_gpuvms evict list.
 			 */
 			struct list_head evict;
+
+			/**
+			 * @list.entry.bo_defer: List entry to attach to
+			 * the &drm_gpuvms bo_defer list.
+			 */
+			struct llist_node bo_defer;
 		} entry;
 	} list;
 };
@@ -746,6 +759,9 @@ drm_gpuvm_bo_get(struct drm_gpuvm_bo *vm_bo)
 
 bool drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo);
 
+bool drm_gpuvm_bo_put_deferred(struct drm_gpuvm_bo *vm_bo);
+void drm_gpuvm_bo_deferred_cleanup(struct drm_gpuvm *gpuvm);
+
 struct drm_gpuvm_bo *
 drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
 		  struct drm_gem_object *obj);

-- 
2.51.0.618.g983fd99d29-goog

