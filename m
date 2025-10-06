Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77837BBDF52
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 14:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C231910E35C;
	Mon,  6 Oct 2025 12:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="RNf0uxvi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com
 [209.85.218.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF6210E345
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 12:06:11 +0000 (UTC)
Received: by mail-ej1-f74.google.com with SMTP id
 a640c23a62f3a-b3afaf5defdso658581666b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 05:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759752370; x=1760357170;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=+avJvr9qHTui6/t6mkvG30ul8Hf9FzTQwxpscMpl3Wg=;
 b=RNf0uxvi6u09sKLGPmZnXPNFq4zOOfC6ZVfF7W5r9wowKGU8/Xw0H0w+KOfXlyQSKv
 wNXDGG6uzlIA9ETegYyauegYDAyz0VdCXSz3Knqsfx6FaigyOpUqjji3hZPKBYi2mdFq
 dtzudOtzYlDcIsBJ7Jitw2lqwQ+PlYOZjZ/9uIQzGnIUUdaz5H2mn6o/1KduR8X/5nOY
 mw492PiLgXI96Jv/y1Gl0h1zG8KV3JB5NgPHDBUAorwc5YHIRxsyG8jGx4MxRip+VnXk
 Fw3HoJK53/n6ew2Pr9wITTt0Nd8gPFeBtmMUEDlIUodjY+ieBo+Ks2rhewEFkaDJ+ZjG
 2o9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759752370; x=1760357170;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+avJvr9qHTui6/t6mkvG30ul8Hf9FzTQwxpscMpl3Wg=;
 b=uGRrcaZPxP5sq7ZQLG8h7GbZGBxkKp0YiK7MPRC4Ep4Elb2nniiE68UsCrmsVILpro
 UP2QmwlBa0mzPh7399inxb1dgu7nZ04dHf4aVROxZ90+74lGOT2X7XqGze7bcLRFjclu
 nYnJaLQbJoKeS7d8LUl4FNIdhaVCsgpsxqYElgscKutSu831EfJ9/3KexGCTH03xIbjf
 EhLMVlbLZAACepyxce+W5fhZloGO+KhhfO9xPg/SyFnmbxyPi0Dl/QVUkpotR0ZfAuKA
 caavkvYVE5pAsnF6qJPaSy34OrGn2UtewaC1p7xqCGG4cdplDA2kcFK4JNYUH72CyuV2
 LJMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWjUJ7ccnEhr5bQ7YOJvopeArdMEIRNRNnZVoHK137nYvDh3/qBy2BNN53wKVpC9TEXyuIQWSDi20=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzn/cvvRk9uFxd54uUE6b7L12qmnu0bhozpQh7Lm37zsPrYlJTZ
 dhKI5WGzCu5tD82/RqihOivfXzkG8cryhCrFpqKL9m0UH8jAyaF0WqoLaqdvEYDWHSkf83nz0Zf
 0iGtO3bnFtIw72LMVfw==
X-Google-Smtp-Source: AGHT+IFvLiD42OGt36SndhEMpwjSuAzNVRazefCk+LMvJT6Et56n51/4WpFfl1PtkT72t2cUyXjwaHJ7oZrUFRE=
X-Received: from ejcd15.prod.google.com ([2002:a17:906:370f:b0:b3d:f163:3222])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:97d4:b0:b3a:b949:3059 with SMTP id
 a640c23a62f3a-b49c1c67172mr1561962866b.18.1759752365311; 
 Mon, 06 Oct 2025 05:06:05 -0700 (PDT)
Date: Mon, 06 Oct 2025 12:05:55 +0000
In-Reply-To: <20251006-vmbo-defer-v4-0-30cbd2c05adb@google.com>
Mime-Version: 1.0
References: <20251006-vmbo-defer-v4-0-30cbd2c05adb@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=11134; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=X9XvTfpmljc3gVCDXjYNuVozEoHXm5UengKNoVRaL34=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBo47CqmlTYJqcNzTbKdrkH/q6MrV5EQneZEsAx6
 HvvUx6BVf2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaOOwqgAKCRAEWL7uWMY5
 Rm2oD/0SWLzZTXtk60RZJOLtU+Vt5d5uESzeRSFfLdlp56u5/5SOR41FQlOtuG2nB5IArpOGVQm
 nd7m85m4c7uFUuuTK3cZI7mpcoyg5q0RVVP7s81Kn14vK5tLkOT0+8EuFg2i8y1gU+5U1YdwO35
 tJ75HfaWQFi99a28xnkrbROydHiyIVct4Mx/cjC5Us46Rzef0T/YvW6j1cHhtPRcHt1zod69kRc
 SUQQMhmZGtDnH8yiE4ET+olAQjC6yvHwg2KkTYC1eMVdDDetr05f4EHMZrY5TXD/CAjfoMsz2mU
 acsiVyUV4Y/1VY7x47deO5/qLXxN+GeuTCpSfNUjTYigxbl/OrLKtFFXTe7GHWITKvIXt0Ti0fV
 nHSM+YDpp+6/w5T0mCkFNSK/jT9AdUD4Uc+i2TvcwqeL2DOrQgStkIBM35sONgnMdxGwBQACwmv
 g7uLWDZbgLFP2d8txt7laZFtSB7yKMJRQW/yO2qR8yN94RpTVmhtJAaL+MkqvwUOG1jZN4vWYIv
 lXtFUpouW7o/Diz6WAQgUwnpekOMyH/UgqPyawMU2+MGYwgfEMQUmKXULw36puCMKM4R2ucUClr
 ZCMiOmWRGjEBcP5cAqs56bkD5/w8uqShbtU4HnI9ZNkc8B5x+cTteBi8LTHgLFOuaWwCBauBm+H
 uk69vaRwkg/BwDw==
X-Mailer: b4 0.14.2
Message-ID: <20251006-vmbo-defer-v4-1-30cbd2c05adb@google.com>
Subject: [PATCH v4 1/2] drm/gpuvm: add deferred vm_bo cleanup
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
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 191 ++++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_gpuvm.h     |  16 ++++
 2 files changed, 207 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index a52e95555549a16c062168253477035679d4775b..c36f1b8b68d2435628bbdbd03a3c8d3a3f0c123f 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -876,6 +876,31 @@ __drm_gpuvm_bo_list_add(struct drm_gpuvm *gpuvm, spinlock_t *lock,
 	cond_spin_unlock(lock, !!lock);
 }
 
+/**
+ * drm_gpuvm_bo_is_zombie() - check whether this vm_bo is scheduled for cleanup
+ * @vm_bo: the &drm_gpuvm_bo
+ *
+ * When a vm_bo is scheduled for cleanup using the bo_defer list, it is not
+ * immediately removed from the evict and extobj lists. Therefore, anyone
+ * iterating these lists should skip entries that are being destroyed.
+ *
+ * Checking the refcount without incrementing it is okay as long as the lock
+ * protecting the evict/extobj list is held for as long as you are using the
+ * vm_bo, because even if the refcount hits zero while you are using it, freeing
+ * the vm_bo requires taking the list's lock.
+ *
+ * Zombie entries can be observed on the evict and extobj lists regardless of
+ * whether DRM_GPUVM_RESV_PROTECTED is used, but they remain on the lists for a
+ * longer time when the resv lock is used because we can't take the resv lock
+ * during run_job() in immediate mode, meaning that they need to remain on the
+ * lists until drm_gpuvm_bo_deferred_cleanup() is called.
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
@@ -1081,6 +1106,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	INIT_LIST_HEAD(&gpuvm->evict.list);
 	spin_lock_init(&gpuvm->evict.lock);
 
+	init_llist_head(&gpuvm->bo_defer);
+
 	kref_init(&gpuvm->kref);
 
 	gpuvm->name = name ? name : "unknown";
@@ -1122,6 +1149,8 @@ drm_gpuvm_fini(struct drm_gpuvm *gpuvm)
 		 "Extobj list should be empty.\n");
 	drm_WARN(gpuvm->drm, !list_empty(&gpuvm->evict.list),
 		 "Evict list should be empty.\n");
+	drm_WARN(gpuvm->drm, !llist_empty(&gpuvm->bo_defer),
+		 "VM BO cleanup list should be empty.\n");
 
 	drm_gem_object_put(gpuvm->r_obj);
 }
@@ -1217,6 +1246,9 @@ drm_gpuvm_prepare_objects_locked(struct drm_gpuvm *gpuvm,
 
 	drm_gpuvm_resv_assert_held(gpuvm);
 	list_for_each_entry(vm_bo, &gpuvm->extobj.list, list.entry.extobj) {
+		if (drm_gpuvm_bo_is_zombie(vm_bo))
+			continue;
+
 		ret = exec_prepare_obj(exec, vm_bo->obj, num_fences);
 		if (ret)
 			break;
@@ -1460,6 +1492,9 @@ drm_gpuvm_validate_locked(struct drm_gpuvm *gpuvm, struct drm_exec *exec)
 
 	list_for_each_entry_safe(vm_bo, next, &gpuvm->evict.list,
 				 list.entry.evict) {
+		if (drm_gpuvm_bo_is_zombie(vm_bo))
+			continue;
+
 		ret = ops->vm_bo_validate(vm_bo, exec);
 		if (ret)
 			break;
@@ -1560,6 +1595,7 @@ drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
 
 	INIT_LIST_HEAD(&vm_bo->list.entry.extobj);
 	INIT_LIST_HEAD(&vm_bo->list.entry.evict);
+	init_llist_node(&vm_bo->list.entry.bo_defer);
 
 	return vm_bo;
 }
@@ -1621,6 +1657,127 @@ drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo)
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_bo_put);
 
+/*
+ * drm_gpuvm_bo_into_zombie() - called when the vm_bo becomes a zombie due to
+ * deferred cleanup
+ *
+ * If deferred cleanup is used, then this must be called right after the vm_bo
+ * refcount drops to zero. Must be called with GEM mutex held. After releasing
+ * the GEM mutex, drm_gpuvm_bo_defer_zombie_cleanup() must be called.
+ */
+static void
+drm_gpuvm_bo_into_zombie(struct kref *kref)
+{
+	struct drm_gpuvm_bo *vm_bo = container_of(kref, struct drm_gpuvm_bo,
+						  kref);
+
+	if (!drm_gpuvm_resv_protected(vm_bo->vm)) {
+		drm_gpuvm_bo_list_del(vm_bo, extobj, true);
+		drm_gpuvm_bo_list_del(vm_bo, evict, true);
+	}
+
+	list_del(&vm_bo->list.entry.gem);
+}
+
+/*
+ * drm_gpuvm_bo_defer_zombie_cleanup() - adds a new zombie vm_bo to the
+ * bo_defer list
+ *
+ * Called after drm_gpuvm_bo_into_zombie(). GEM mutex must not be held.
+ *
+ * It's important that the GEM stays alive for the duration in which we hold
+ * the mutex, but the instant we add the vm_bo to bo_defer, another thread
+ * might call drm_gpuvm_bo_deferred_cleanup() and put the GEM. Therefore, to
+ * avoid kfreeing a mutex we are holding, the GEM mutex must be released
+ * *before* calling this function.
+ */
+static void
+drm_gpuvm_bo_defer_zombie_cleanup(struct drm_gpuvm_bo *vm_bo)
+{
+	llist_add(&vm_bo->list.entry.bo_defer, &vm_bo->vm->bo_defer);
+}
+
+static void
+drm_gpuvm_bo_defer_free(struct kref *kref)
+{
+	struct drm_gpuvm_bo *vm_bo = container_of(kref, struct drm_gpuvm_bo,
+						  kref);
+
+	drm_gpuvm_bo_into_zombie(kref);
+	mutex_unlock(&vm_bo->obj->gpuva.lock);
+	drm_gpuvm_bo_defer_zombie_cleanup(vm_bo);
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
+	return !!kref_put_mutex(&vm_bo->kref,
+				drm_gpuvm_bo_defer_free,
+				&vm_bo->obj->gpuva.lock);
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
@@ -1948,6 +2105,40 @@ drm_gpuva_unlink(struct drm_gpuva *va)
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
+	should_defer_bo = kref_put(&vm_bo->kref, drm_gpuvm_bo_into_zombie);
+	mutex_unlock(&obj->gpuva.lock);
+	if (should_defer_bo)
+		drm_gpuvm_bo_defer_zombie_cleanup(vm_bo);
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

