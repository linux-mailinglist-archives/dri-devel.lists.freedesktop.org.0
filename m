Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A22D7D40BF
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 22:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB0210E243;
	Mon, 23 Oct 2023 20:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD86910E243
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 20:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698092264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7hSscpcnnPSQS3rXsN9HqvAGkbQzp/wahn/vWNuLZF0=;
 b=a1ouEu59BFSJl9iODjqFcrARCxvhCZG+l9WvouTSTbMIPdfk2lghYujCgaUCjhav0gO+/4
 Yxw36RASk7jsp1WT8LBm24Hz9Ww5hnvUTVnGuk0Chz7Bb+bx5fYvgvGIAnaslB9NqHbhI7
 9jzv9Nl6EwCjRBFIU2On9XEx8XqZD0I=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-pOBAsiR_NXaQnU9nBNTt8A-1; Mon, 23 Oct 2023 16:17:27 -0400
X-MC-Unique: pOBAsiR_NXaQnU9nBNTt8A-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-99c8bbc902eso233255766b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 13:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698092244; x=1698697044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7hSscpcnnPSQS3rXsN9HqvAGkbQzp/wahn/vWNuLZF0=;
 b=P/9jKIX3FmwVBOjtWc1u8ofecD+eBVY0TkfGOp3DdddJZXrNJl4xYYv7EyeCb3RpeM
 GWkp6wph/whVMwYwRMMYFImSP6Z8TBy1rVI2rgBqXA4FxXxjjjX2+Q2C2x72Vn34fXo1
 vEkfA8ZKP05I4KN8e0/cY8OrF5+fucwUl+t5zEat7Hsn9kZ5beSM+3crLX8sCSk8I9gj
 gWkGY+egYDaZpkfOwN0ERPFV8MNjuanb0BXyVEmwGq6uu2cTVJQ9EjVfl5GqcZ74bgSr
 JgmYEqcmzq8ypjIOHWr7wXx5PBPS0gzlM/LgkyySdzWf4SH+SUyoQMxKTlhxFJXf3oqr
 w7Ww==
X-Gm-Message-State: AOJu0Ywsagnip9FwFb0B5/fy+eKshxQ14a2yeHHPcmT4xuqbecTG7GoL
 NTzM/5DIv3aMCE9PI4QjoJiQ6r/Kb3cqNdhElSY5UZyGgH1m3dBZrRnWQVbEUG7EbdDtF8Xpbyt
 IbiIg5GZjLsLADkBEWXfC9cO7ZUDD
X-Received: by 2002:a17:906:fe4c:b0:9ba:a38:f2b2 with SMTP id
 wz12-20020a170906fe4c00b009ba0a38f2b2mr8716849ejb.41.1698092243960; 
 Mon, 23 Oct 2023 13:17:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEM//M3WUTDWfoR1L568s5bFEy/dY/93hGXzKb3BWWP9OS5GvlWuzCkO+0ZuoIQ7BxJH5z1Cg==
X-Received: by 2002:a17:906:fe4c:b0:9ba:a38:f2b2 with SMTP id
 wz12-20020a170906fe4c00b009ba0a38f2b2mr8716807ejb.41.1698092243312; 
 Mon, 23 Oct 2023 13:17:23 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a17090607c200b009c6a4a5ac80sm7019548ejc.169.2023.10.23.13.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 13:17:22 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Subject: [PATCH drm-misc-next v7 5/7] drm/gpuvm: track/lock/validate
 external/evicted objects
Date: Mon, 23 Oct 2023 22:16:51 +0200
Message-ID: <20231023201659.25332-6-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231023201659.25332-1-dakr@redhat.com>
References: <20231023201659.25332-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the DRM GPUVM offers common infrastructure to track GPU VA
allocations and mappings, generically connect GPU VA mappings to their
backing buffers and perform more complex mapping operations on the GPU VA
space.

However, there are more design patterns commonly used by drivers, which
can potentially be generalized in order to make the DRM GPUVM represent
a basis for GPU-VM implementations. In this context, this patch aims
at generalizing the following elements.

1) Provide a common dma-resv for GEM objects not being used outside of
   this GPU-VM.

2) Provide tracking of external GEM objects (GEM objects which are
   shared with other GPU-VMs).

3) Provide functions to efficiently lock all GEM objects dma-resv the
   GPU-VM contains mappings of.

4) Provide tracking of evicted GEM objects the GPU-VM contains mappings
   of, such that validation of evicted GEM objects is accelerated.

5) Provide some convinience functions for common patterns.

Big thanks to Boris Brezillon for his help to figure out locking for
drivers updating the GPU VA space within the fence signalling path.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 633 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_gpuvm.h     | 250 ++++++++++++++
 2 files changed, 883 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 7f4f5919f84c..01cbeb98755a 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -82,6 +82,21 @@
  * &drm_gem_object list of &drm_gpuvm_bos for an existing instance of this
  * particular combination. If not existent a new instance is created and linked
  * to the &drm_gem_object.
+ *
+ * &drm_gpuvm_bo structures, since unique for a given &drm_gpuvm, are also used
+ * as entry for the &drm_gpuvm's lists of external and evicted objects. Those
+ * lists are maintained in order to accelerate locking of dma-resv locks and
+ * validation of evicted objects bound in a &drm_gpuvm. For instance, all
+ * &drm_gem_object's &dma_resv of a given &drm_gpuvm can be locked by calling
+ * drm_gpuvm_exec_lock(). Once locked drivers can call drm_gpuvm_validate() in
+ * order to validate all evicted &drm_gem_objects. It is also possible to lock
+ * additional &drm_gem_objects by providing the corresponding parameters to
+ * drm_gpuvm_exec_lock() as well as open code the &drm_exec loop while making
+ * use of helper functions such as drm_gpuvm_prepare_range() or
+ * drm_gpuvm_prepare_objects().
+ *
+ * Every bound &drm_gem_object is treated as external object when its &dma_resv
+ * structure is different than the &drm_gpuvm's common &dma_resv structure.
  */
 
 /**
@@ -429,6 +444,20 @@
  * Subsequent calls to drm_gpuvm_bo_obtain() for the same &drm_gpuvm and
  * &drm_gem_object must be able to observe previous creations and destructions
  * of &drm_gpuvm_bos in order to keep instances unique.
+ *
+ * The &drm_gpuvm's lists for keeping track of external and evicted objects are
+ * protected against concurrent insertion / removal and iteration internally.
+ *
+ * However, drivers still need ensure to protect concurrent calls to functions
+ * iterating those lists, namely drm_gpuvm_prepare_objects() and
+ * drm_gpuvm_validate().
+ *
+ * Alternatively, drivers can set the &DRM_GPUVM_RESV_PROTECTED flag to indicate
+ * that the corresponding &dma_resv locks are held in order to protect the
+ * lists. If &DRM_GPUVM_RESV_PROTECTED is set, internal locking is disabled and
+ * the corresponding lockdep checks are enabled. This is an optimization for
+ * drivers which are capable of taking the corresponding &dma_resv locks and
+ * hence do not require internal locking.
  */
 
 /**
@@ -641,6 +670,201 @@
  *	}
  */
 
+/**
+ * get_next_vm_bo_from_list() - get the next vm_bo element
+ * @__gpuvm: the &drm_gpuvm
+ * @__list_name: the name of the list we're iterating on
+ * @__local_list: a pointer to the local list used to store already iterated items
+ * @__prev_vm_bo: the previous element we got from get_next_vm_bo_from_list()
+ *
+ * This helper is here to provide lockless list iteration. Lockless as in, the
+ * iterator releases the lock immediately after picking the first element from
+ * the list, so list insertion deletion can happen concurrently.
+ *
+ * Elements popped from the original list are kept in a local list, so removal
+ * and is_empty checks can still happen while we're iterating the list.
+ */
+#define get_next_vm_bo_from_list(__gpuvm, __list_name, __local_list, __prev_vm_bo)	\
+	({										\
+		struct drm_gpuvm_bo *__vm_bo = NULL;					\
+											\
+		drm_gpuvm_bo_put(__prev_vm_bo);						\
+											\
+		spin_lock(&(__gpuvm)->__list_name.lock);				\
+		if (!(__gpuvm)->__list_name.local_list)					\
+			(__gpuvm)->__list_name.local_list = __local_list;		\
+		else									\
+			drm_WARN_ON((__gpuvm)->drm,					\
+				    (__gpuvm)->__list_name.local_list != __local_list);	\
+											\
+		while (!list_empty(&(__gpuvm)->__list_name.list)) {			\
+			__vm_bo = list_first_entry(&(__gpuvm)->__list_name.list,	\
+						   struct drm_gpuvm_bo,			\
+						   list.entry.__list_name);		\
+			if (kref_get_unless_zero(&__vm_bo->kref)) {			\
+				list_move_tail(&(__vm_bo)->list.entry.__list_name,	\
+					       __local_list);				\
+				break;							\
+			} else {							\
+				list_del_init(&(__vm_bo)->list.entry.__list_name);	\
+				__vm_bo = NULL;						\
+			}								\
+		}									\
+		spin_unlock(&(__gpuvm)->__list_name.lock);				\
+											\
+		__vm_bo;								\
+	})
+
+/**
+ * for_each_vm_bo_in_list() - internal vm_bo list iterator
+ * @__gpuvm: the &drm_gpuvm
+ * @__list_name: the name of the list we're iterating on
+ * @__local_list: a pointer to the local list used to store already iterated items
+ * @__vm_bo: the struct drm_gpuvm_bo to assign in each iteration step
+ *
+ * This helper is here to provide lockless list iteration. Lockless as in, the
+ * iterator releases the lock immediately after picking the first element from the
+ * list, hence list insertion and deletion can happen concurrently.
+ *
+ * It is not allowed to re-assign the vm_bo pointer from inside this loop.
+ *
+ * Typical use:
+ *
+ *	struct drm_gpuvm_bo *vm_bo;
+ *	LIST_HEAD(my_local_list);
+ *
+ *	ret = 0;
+ *	for_each_vm_bo_in_list(gpuvm, <list_name>, &my_local_list, vm_bo) {
+ *		ret = do_something_with_vm_bo(..., vm_bo);
+ *		if (ret)
+ *			break;
+ *	}
+ *	// Drop ref in case we break out of the loop.
+ *	drm_gpuvm_bo_put(vm_bo);
+ *	restore_vm_bo_list(gpuvm, <list_name>, &my_local_list);
+ *
+ *
+ * Only used for internal list iterations, not meant to be exposed to the outside
+ * world.
+ */
+#define for_each_vm_bo_in_list(__gpuvm, __list_name, __local_list, __vm_bo)	\
+	for (__vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, NULL);		\
+	     __vm_bo;								\
+	     __vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, __vm_bo))
+
+static void
+__restore_vm_bo_list(struct drm_gpuvm *gpuvm, spinlock_t *lock,
+		     struct list_head *list, struct list_head **local_list)
+{
+	/* Merge back the two lists, moving local list elements to the
+	 * head to preserve previous ordering, in case it matters.
+	 */
+	spin_lock(lock);
+	if (*local_list) {
+		list_splice(*local_list, list);
+		*local_list = NULL;
+	}
+	spin_unlock(lock);
+}
+
+/**
+ * restore_vm_bo_list() - move vm_bo elements back to their original list
+ * @__gpuvm: the &drm_gpuvm
+ * @__list_name: the name of the list we're iterating on
+ *
+ * When we're done iterating a vm_bo list, we should call restore_vm_bo_list()
+ * to restore the original state and let new iterations take place.
+ */
+#define restore_vm_bo_list(__gpuvm, __list_name)			\
+	__restore_vm_bo_list((__gpuvm), &(__gpuvm)->__list_name.lock,	\
+			     &(__gpuvm)->__list_name.list,		\
+			     &(__gpuvm)->__list_name.local_list)
+
+static void
+cond_spin_lock(spinlock_t *lock, bool cond)
+{
+	if (cond)
+		spin_lock(lock);
+}
+
+static void
+cond_spin_unlock(spinlock_t *lock, bool cond)
+{
+	if (cond)
+		spin_unlock(lock);
+}
+
+static void
+__drm_gpuvm_bo_list_add(struct drm_gpuvm *gpuvm, spinlock_t *lock,
+			struct list_head *entry, struct list_head *list)
+{
+	cond_spin_lock(lock, !!lock);
+	if (list_empty(entry))
+		list_add_tail(entry, list);
+	cond_spin_unlock(lock, !!lock);
+}
+
+/**
+ * drm_gpuvm_bo_list_add() - insert a vm_bo into the given list
+ * @__vm_bo: the &drm_gpuvm_bo
+ * @__list_name: the name of the list to insert into
+ * @__lock: whether to lock with the internal spinlock
+ *
+ * Inserts the given @__vm_bo into the list specified by @__list_name.
+ */
+#define drm_gpuvm_bo_list_add(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_add((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				&(__vm_bo)->vm->__list_name.list)
+
+static void
+__drm_gpuvm_bo_list_del(struct drm_gpuvm *gpuvm, spinlock_t *lock,
+			struct list_head *entry, bool init)
+{
+	cond_spin_lock(lock, !!lock);
+	if (init) {
+		if (!list_empty(entry))
+			list_del_init(entry);
+	} else {
+		list_del(entry);
+	}
+	cond_spin_unlock(lock, !!lock);
+}
+
+/**
+ * drm_gpuvm_bo_list_del_init() - remove a vm_bo from the given list
+ * @__vm_bo: the &drm_gpuvm_bo
+ * @__list_name: the name of the list to insert into
+ * @__lock: whether to lock with the internal spinlock
+ *
+ * Removes the given @__vm_bo from the list specified by @__list_name.
+ */
+#define drm_gpuvm_bo_list_del_init(__vm_bo, __list_name, __lock)		\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				true)
+
+/**
+ * drm_gpuvm_bo_list_del() - remove a vm_bo from the given list
+ * @__vm_bo: the &drm_gpuvm_bo
+ * @__list_name: the name of the list to insert into
+ * @__lock: whether to lock with the internal spinlock
+ *
+ * Removes the given @__vm_bo from the list specified by @__list_name.
+ */
+#define drm_gpuvm_bo_list_del(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				false)
+
 #define to_drm_gpuva(__node)	container_of((__node), struct drm_gpuva, rb.node)
 
 #define GPUVA_START(node) ((node)->va.addr)
@@ -763,6 +987,12 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	gpuvm->rb.tree = RB_ROOT_CACHED;
 	INIT_LIST_HEAD(&gpuvm->rb.list);
 
+	INIT_LIST_HEAD(&gpuvm->extobj.list);
+	spin_lock_init(&gpuvm->extobj.lock);
+
+	INIT_LIST_HEAD(&gpuvm->evict.list);
+	spin_lock_init(&gpuvm->evict.lock);
+
 	gpuvm->name = name ? name : "unknown";
 	gpuvm->flags = flags;
 	gpuvm->ops = ops;
@@ -805,10 +1035,352 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
 	drm_WARN(gpuvm->drm, !RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
 		 "GPUVA tree is not empty, potentially leaking memory.\n");
 
+	drm_WARN(gpuvm->drm, !list_empty(&gpuvm->extobj.list),
+		 "Extobj list should be empty.\n");
+	drm_WARN(gpuvm->drm, !list_empty(&gpuvm->evict.list),
+		 "Evict list should be empty.\n");
+
 	drm_gem_object_put(gpuvm->r_obj);
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
 
+static int
+__drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
+			    struct drm_exec *exec,
+			    unsigned int num_fences)
+{
+	struct drm_gpuvm_bo *vm_bo;
+	LIST_HEAD(extobjs);
+	int ret = 0;
+
+	for_each_vm_bo_in_list(gpuvm, extobj, &extobjs, vm_bo) {
+		ret = drm_exec_prepare_obj(exec, vm_bo->obj, num_fences);
+		if (ret)
+			break;
+	}
+	/* Drop ref in case we break out of the loop. */
+	drm_gpuvm_bo_put(vm_bo);
+	restore_vm_bo_list(gpuvm, extobj);
+
+	return ret;
+}
+
+static int
+drm_gpuvm_prepare_objects_locked(struct drm_gpuvm *gpuvm,
+				 struct drm_exec *exec,
+				 unsigned int num_fences)
+{
+	struct drm_gpuvm_bo *vm_bo;
+	int ret = 0;
+
+	drm_gpuvm_resv_assert_held(gpuvm);
+	list_for_each_entry(vm_bo, &gpuvm->extobj.list, list.entry.extobj) {
+		ret = drm_exec_prepare_obj(exec, vm_bo->obj, num_fences);
+		if (ret)
+			break;
+
+		if (vm_bo->evicted)
+			drm_gpuvm_bo_list_add(vm_bo, evict, false);
+	}
+
+	return ret;
+}
+
+/**
+ * drm_gpuvm_prepare_objects() - prepare all assoiciated BOs
+ * @gpuvm: the &drm_gpuvm
+ * @exec: the &drm_exec locking context
+ * @num_fences: the amount of &dma_fences to reserve
+ *
+ * Calls drm_exec_prepare_obj() for all &drm_gem_objects the given
+ * &drm_gpuvm contains mappings of.
+ *
+ * Using this function directly, it is the drivers responsibility to call
+ * drm_exec_init() and drm_exec_fini() accordingly.
+ *
+ * Note: This function is safe against concurrent insertion and removal of
+ * external objects, however it is not safe against concurrent usage itself.
+ *
+ * Drivers need to make sure to protect this case with either an outer VM lock
+ * or by calling drm_gpuvm_prepare_vm() before this function within the
+ * drm_exec_until_all_locked() loop, such that the GPUVM's dma-resv lock ensures
+ * mutual exclusion.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+int
+drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
+			  struct drm_exec *exec,
+			  unsigned int num_fences)
+{
+	if (drm_gpuvm_resv_protected(gpuvm))
+		return drm_gpuvm_prepare_objects_locked(gpuvm, exec,
+							num_fences);
+	else
+		return __drm_gpuvm_prepare_objects(gpuvm, exec, num_fences);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_prepare_objects);
+
+/**
+ * drm_gpuvm_prepare_range() - prepare all BOs mapped within a given range
+ * @gpuvm: the &drm_gpuvm
+ * @exec: the &drm_exec locking context
+ * @addr: the start address within the VA space
+ * @range: the range to iterate within the VA space
+ * @num_fences: the amount of &dma_fences to reserve
+ *
+ * Calls drm_exec_prepare_obj() for all &drm_gem_objects mapped between @addr
+ * and @addr + @range.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+int
+drm_gpuvm_prepare_range(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
+			u64 addr, u64 range, unsigned int num_fences)
+{
+	struct drm_gpuva *va;
+	u64 end = addr + range;
+	int ret;
+
+	drm_gpuvm_for_each_va_range(va, gpuvm, addr, end) {
+		struct drm_gem_object *obj = va->gem.obj;
+
+		ret = drm_exec_prepare_obj(exec, obj, num_fences);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_prepare_range);
+
+/**
+ * drm_gpuvm_exec_lock() - lock all dma-resv of all assoiciated BOs
+ * @vm_exec: the &drm_gpuvm_exec wrapper
+ *
+ * Acquires all dma-resv locks of all &drm_gem_objects the given
+ * &drm_gpuvm contains mappings of.
+ *
+ * Addionally, when calling this function with struct drm_gpuvm_exec::extra
+ * being set the driver receives the given @fn callback to lock additional
+ * dma-resv in the context of the &drm_gpuvm_exec instance. Typically, drivers
+ * would call drm_exec_prepare_obj() from within this callback.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+int
+drm_gpuvm_exec_lock(struct drm_gpuvm_exec *vm_exec)
+{
+	struct drm_gpuvm *gpuvm = vm_exec->vm;
+	struct drm_exec *exec = &vm_exec->exec;
+	unsigned int num_fences = vm_exec->num_fences;
+	int ret;
+
+	drm_exec_init(exec, vm_exec->flags);
+
+	drm_exec_until_all_locked(exec) {
+		ret = drm_gpuvm_prepare_vm(gpuvm, exec, num_fences);
+		drm_exec_retry_on_contention(exec);
+		if (ret)
+			goto err;
+
+		ret = drm_gpuvm_prepare_objects(gpuvm, exec, num_fences);
+		drm_exec_retry_on_contention(exec);
+		if (ret)
+			goto err;
+
+		if (vm_exec->extra.fn) {
+			ret = vm_exec->extra.fn(vm_exec);
+			drm_exec_retry_on_contention(exec);
+			if (ret)
+				goto err;
+		}
+	}
+
+	return 0;
+
+err:
+	drm_exec_fini(exec);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_exec_lock);
+
+static int
+fn_lock_array(struct drm_gpuvm_exec *vm_exec)
+{
+	struct {
+		struct drm_gem_object **objs;
+		unsigned int num_objs;
+	} *args = vm_exec->extra.priv;
+
+	return drm_exec_prepare_array(&vm_exec->exec, args->objs,
+				      args->num_objs, vm_exec->num_fences);
+}
+
+/**
+ * drm_gpuvm_exec_lock_array() - lock all dma-resv of all assoiciated BOs
+ * @vm_exec: the &drm_gpuvm_exec wrapper
+ * @objs: additional &drm_gem_objects to lock
+ * @num_objs: the number of additional &drm_gem_objects to lock
+ *
+ * Acquires all dma-resv locks of all &drm_gem_objects the given &drm_gpuvm
+ * contains mappings of, plus the ones given through @objs.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+int
+drm_gpuvm_exec_lock_array(struct drm_gpuvm_exec *vm_exec,
+			  struct drm_gem_object **objs,
+			  unsigned int num_objs)
+{
+	struct {
+		struct drm_gem_object **objs;
+		unsigned int num_objs;
+	} args;
+
+	args.objs = objs;
+	args.num_objs = num_objs;
+
+	vm_exec->extra.fn = fn_lock_array;
+	vm_exec->extra.priv = &args;
+
+	return drm_gpuvm_exec_lock(vm_exec);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_exec_lock_array);
+
+/**
+ * drm_gpuvm_exec_lock_range() - prepare all BOs mapped within a given range
+ * @vm_exec: the &drm_gpuvm_exec wrapper
+ * @addr: the start address within the VA space
+ * @range: the range to iterate within the VA space
+ *
+ * Acquires all dma-resv locks of all &drm_gem_objects mapped between @addr and
+ * @addr + @range.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+int
+drm_gpuvm_exec_lock_range(struct drm_gpuvm_exec *vm_exec,
+			  u64 addr, u64 range)
+{
+	struct drm_gpuvm *gpuvm = vm_exec->vm;
+	struct drm_exec *exec = &vm_exec->exec;
+	int ret;
+
+	drm_exec_init(exec, vm_exec->flags);
+
+	drm_exec_until_all_locked(exec) {
+		ret = drm_gpuvm_prepare_range(gpuvm, exec, addr, range,
+					      vm_exec->num_fences);
+		drm_exec_retry_on_contention(exec);
+		if (ret)
+			goto err;
+	}
+
+	return ret;
+
+err:
+	drm_exec_fini(exec);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_exec_lock_range);
+
+static int
+__drm_gpuvm_validate(struct drm_gpuvm *gpuvm, struct drm_exec *exec)
+{
+	const struct drm_gpuvm_ops *ops = gpuvm->ops;
+	struct drm_gpuvm_bo *vm_bo;
+	LIST_HEAD(evict);
+	int ret = 0;
+
+	for_each_vm_bo_in_list(gpuvm, evict, &evict, vm_bo) {
+		ret = ops->vm_bo_validate(vm_bo, exec);
+		if (ret)
+			break;
+	}
+	/* Drop ref in case we break out of the loop. */
+	drm_gpuvm_bo_put(vm_bo);
+	restore_vm_bo_list(gpuvm, evict);
+
+	return ret;
+}
+
+static int
+drm_gpuvm_validate_locked(struct drm_gpuvm *gpuvm, struct drm_exec *exec)
+{
+	const struct drm_gpuvm_ops *ops = gpuvm->ops;
+	struct drm_gpuvm_bo *vm_bo, *next;
+	int ret = 0;
+
+	drm_gpuvm_resv_assert_held(gpuvm);
+
+	list_for_each_entry_safe(vm_bo, next, &gpuvm->evict.list,
+				 list.entry.evict) {
+		ret = ops->vm_bo_validate(vm_bo, exec);
+		if (ret)
+			break;
+
+		dma_resv_assert_held(vm_bo->obj->resv);
+		if (!vm_bo->evicted)
+			drm_gpuvm_bo_list_del_init(vm_bo, evict, false);
+	}
+
+	return ret;
+}
+
+/**
+ * drm_gpuvm_validate() - validate all BOs marked as evicted
+ * @gpuvm: the &drm_gpuvm to validate evicted BOs
+ * @exec: the &drm_exec instance used for locking the GPUVM
+ *
+ * Calls the &drm_gpuvm_ops::vm_bo_validate callback for all evicted buffer
+ * objects being mapped in the given &drm_gpuvm.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+int
+drm_gpuvm_validate(struct drm_gpuvm *gpuvm, struct drm_exec *exec)
+{
+	const struct drm_gpuvm_ops *ops = gpuvm->ops;
+
+	if (unlikely(!ops || !ops->vm_bo_validate))
+		return -ENOTSUPP;
+
+	if (drm_gpuvm_resv_protected(gpuvm))
+		return drm_gpuvm_validate_locked(gpuvm, exec);
+	else
+		return __drm_gpuvm_validate(gpuvm, exec);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_validate);
+
+/**
+ * drm_gpuvm_resv_add_fence - add fence to private and all extobj
+ * dma-resv
+ * @gpuvm: the &drm_gpuvm to add a fence to
+ * @exec: the &drm_exec locking context
+ * @fence: fence to add
+ * @private_usage: private dma-resv usage
+ * @extobj_usage: extobj dma-resv usage
+ */
+void
+drm_gpuvm_resv_add_fence(struct drm_gpuvm *gpuvm,
+			 struct drm_exec *exec,
+			 struct dma_fence *fence,
+			 enum dma_resv_usage private_usage,
+			 enum dma_resv_usage extobj_usage)
+{
+	struct drm_gem_object *obj;
+	unsigned long index;
+
+	drm_exec_for_each_locked_object(exec, index, obj) {
+		dma_resv_assert_held(obj->resv);
+		dma_resv_add_fence(obj->resv, fence,
+				   drm_gpuvm_is_extobj(gpuvm, obj) ?
+				   extobj_usage : private_usage);
+	}
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_resv_add_fence);
+
 /**
  * drm_gpuvm_bo_create() - create a new instance of struct drm_gpuvm_bo
  * @gpuvm: The &drm_gpuvm the @obj is mapped in.
@@ -842,6 +1414,9 @@ drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
 	INIT_LIST_HEAD(&vm_bo->list.gpuva);
 	INIT_LIST_HEAD(&vm_bo->list.entry.gem);
 
+	INIT_LIST_HEAD(&vm_bo->list.entry.extobj);
+	INIT_LIST_HEAD(&vm_bo->list.entry.evict);
+
 	return vm_bo;
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_bo_create);
@@ -859,6 +1434,9 @@ drm_gpuvm_bo_destroy(struct kref *kref)
 	if (!lock)
 		drm_gpuvm_resv_assert_held(gpuvm);
 
+	drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
+	drm_gpuvm_bo_list_del(vm_bo, evict, lock);
+
 	drm_gem_gpuva_assert_lock_held(obj);
 	list_del(&vm_bo->list.entry.gem);
 
@@ -997,6 +1575,61 @@ drm_gpuvm_bo_obtain_prealloc(struct drm_gpuvm_bo *__vm_bo)
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain_prealloc);
 
+/**
+ * drm_gpuvm_bo_extobj_add() - adds the &drm_gpuvm_bo to its &drm_gpuvm's
+ * extobj list
+ * @vm_bo: The &drm_gpuvm_bo to add to its &drm_gpuvm's the extobj list.
+ *
+ * Adds the given @vm_bo to its &drm_gpuvm's extobj list if not on the list
+ * already and if the corresponding &drm_gem_object is an external object,
+ * actually.
+ */
+void
+drm_gpuvm_bo_extobj_add(struct drm_gpuvm_bo *vm_bo)
+{
+	struct drm_gpuvm *gpuvm = vm_bo->vm;
+	bool lock = !drm_gpuvm_resv_protected(gpuvm);
+
+	if (!lock)
+		drm_gpuvm_resv_assert_held(gpuvm);
+
+	if (drm_gpuvm_is_extobj(gpuvm, vm_bo->obj))
+		drm_gpuvm_bo_list_add(vm_bo, extobj, lock);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_extobj_add);
+
+/**
+ * drm_gpuvm_bo_evict() - add / remove a &drm_gpuvm_bo to / from the &drm_gpuvms
+ * evicted list
+ * @vm_bo: the &drm_gpuvm_bo to add or remove
+ * @evict: indicates whether the object is evicted
+ *
+ * Adds a &drm_gpuvm_bo to or removes it from the &drm_gpuvms evicted list.
+ */
+void
+drm_gpuvm_bo_evict(struct drm_gpuvm_bo *vm_bo, bool evict)
+{
+	struct drm_gpuvm *gpuvm = vm_bo->vm;
+	struct drm_gem_object *obj = vm_bo->obj;
+	bool lock = !drm_gpuvm_resv_protected(gpuvm);
+
+	dma_resv_assert_held(obj->resv);
+	vm_bo->evicted = evict;
+
+	/* Can't add external objects to the evicted list directly if not using
+	 * internal spinlocks, since in this case the evicted list is protected
+	 * with the VM's common dma-resv lock.
+	 */
+	if (drm_gpuvm_is_extobj(gpuvm, obj) && !lock)
+		return;
+
+	if (evict)
+		drm_gpuvm_bo_list_add(vm_bo, evict, lock);
+	else
+		drm_gpuvm_bo_list_del_init(vm_bo, evict, lock);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_evict);
+
 static int
 __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva *va)
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 466fdd76c71a..3f883d2e12d4 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -32,6 +32,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_exec.h>
 
 struct drm_gpuvm;
 struct drm_gpuvm_bo;
@@ -278,6 +279,50 @@ struct drm_gpuvm {
 	 * @r_obj: Resv GEM object; representing the GPUVM's common &dma_resv.
 	 */
 	struct drm_gem_object *r_obj;
+
+	/**
+	 * @extobj: structure holding the extobj list
+	 */
+	struct {
+		/**
+		 * @list: &list_head storing &drm_gpuvm_bos serving as
+		 * external object
+		 */
+		struct list_head list;
+
+		/**
+		 * @local_list: pointer to the local list temporarily storing
+		 * entries from the external object list
+		 */
+		struct list_head *local_list;
+
+		/**
+		 * @lock: spinlock to protect the extobj list
+		 */
+		spinlock_t lock;
+	} extobj;
+
+	/**
+	 * @evict: structure holding the evict list and evict list lock
+	 */
+	struct {
+		/**
+		 * @list: &list_head storing &drm_gpuvm_bos currently being
+		 * evicted
+		 */
+		struct list_head list;
+
+		/**
+		 * @local_list: pointer to the local list temporarily storing
+		 * entries from the evicted object list
+		 */
+		struct list_head *local_list;
+
+		/**
+		 * @lock: spinlock to protect the evict list
+		 */
+		spinlock_t lock;
+	} evict;
 };
 
 void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
@@ -337,6 +382,22 @@ drm_gpuvm_resv_protected(struct drm_gpuvm *gpuvm)
 #define drm_gpuvm_resv_assert_held(gpuvm__) \
 	dma_resv_assert_held(drm_gpuvm_resv(gpuvm__))
 
+/**
+ * drm_gpuvm_is_extobj() - indicates whether the given &drm_gem_object is an
+ * external object
+ * @gpuvm: the &drm_gpuvm to check
+ * @obj: the &drm_gem_object to check
+ *
+ * Returns: true if the &drm_gem_object &dma_resv differs from the
+ * &drm_gpuvms &dma_resv, false otherwise
+ */
+static inline bool
+drm_gpuvm_is_extobj(struct drm_gpuvm *gpuvm,
+		    struct drm_gem_object *obj)
+{
+	return obj && obj->resv != drm_gpuvm_resv(gpuvm);
+}
+
 static inline struct drm_gpuva *
 __drm_gpuva_next(struct drm_gpuva *va)
 {
@@ -415,6 +476,144 @@ __drm_gpuva_next(struct drm_gpuva *va)
 #define drm_gpuvm_for_each_va_safe(va__, next__, gpuvm__) \
 	list_for_each_entry_safe(va__, next__, &(gpuvm__)->rb.list, rb.entry)
 
+/**
+ * struct drm_gpuvm_exec - &drm_gpuvm abstraction of &drm_exec
+ *
+ * This structure should be created on the stack as &drm_exec should be.
+ *
+ * Optionally, @extra can be set in order to lock additional &drm_gem_objects.
+ */
+struct drm_gpuvm_exec {
+	/**
+	 * @exec: the &drm_exec structure
+	 */
+	struct drm_exec exec;
+
+	/**
+	 * @flags: the flags for the struct drm_exec
+	 */
+	uint32_t flags;
+
+	/**
+	 * @vm: the &drm_gpuvm to lock its DMA reservations
+	 */
+	struct drm_gpuvm *vm;
+
+	/**
+	 * @num_fences: the number of fences to reserve for the &dma_resv of the
+	 * locked &drm_gem_objects
+	 */
+	unsigned int num_fences;
+
+	/**
+	 * @extra: Callback and corresponding private data for the driver to
+	 * lock arbitrary additional &drm_gem_objects.
+	 */
+	struct {
+		/**
+		 * @fn: The driver callback to lock additional &drm_gem_objects.
+		 */
+		int (*fn)(struct drm_gpuvm_exec *vm_exec);
+
+		/**
+		 * @priv: driver private data for the @fn callback
+		 */
+		void *priv;
+	} extra;
+};
+
+/**
+ * drm_gpuvm_prepare_vm() - prepare the GPUVMs common dma-resv
+ * @gpuvm: the &drm_gpuvm
+ * @exec: the &drm_exec context
+ * @num_fences: the amount of &dma_fences to reserve
+ *
+ * Calls drm_exec_prepare_obj() for the GPUVMs dummy &drm_gem_object.
+ *
+ * Using this function directly, it is the drivers responsibility to call
+ * drm_exec_init() and drm_exec_fini() accordingly.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+static inline int
+drm_gpuvm_prepare_vm(struct drm_gpuvm *gpuvm,
+		     struct drm_exec *exec,
+		     unsigned int num_fences)
+{
+	return drm_exec_prepare_obj(exec, gpuvm->r_obj, num_fences);
+}
+
+int drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
+			      struct drm_exec *exec,
+			      unsigned int num_fences);
+
+int drm_gpuvm_prepare_range(struct drm_gpuvm *gpuvm,
+			    struct drm_exec *exec,
+			    u64 addr, u64 range,
+			    unsigned int num_fences);
+
+int drm_gpuvm_exec_lock(struct drm_gpuvm_exec *vm_exec);
+
+int drm_gpuvm_exec_lock_array(struct drm_gpuvm_exec *vm_exec,
+			      struct drm_gem_object **objs,
+			      unsigned int num_objs);
+
+int drm_gpuvm_exec_lock_range(struct drm_gpuvm_exec *vm_exec,
+			      u64 addr, u64 range);
+
+/**
+ * drm_gpuvm_exec_unlock() - lock all dma-resv of all assoiciated BOs
+ * @vm_exec: the &drm_gpuvm_exec wrapper
+ *
+ * Releases all dma-resv locks of all &drm_gem_objects previously acquired
+ * through drm_gpuvm_exec_lock() or its variants.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+static inline void
+drm_gpuvm_exec_unlock(struct drm_gpuvm_exec *vm_exec)
+{
+	drm_exec_fini(&vm_exec->exec);
+}
+
+int drm_gpuvm_validate(struct drm_gpuvm *gpuvm, struct drm_exec *exec);
+void drm_gpuvm_resv_add_fence(struct drm_gpuvm *gpuvm,
+			      struct drm_exec *exec,
+			      struct dma_fence *fence,
+			      enum dma_resv_usage private_usage,
+			      enum dma_resv_usage extobj_usage);
+
+/**
+ * drm_gpuvm_exec_resv_add_fence()
+ * @vm_exec: the &drm_gpuvm_exec wrapper
+ * @fence: fence to add
+ * @private_usage: private dma-resv usage
+ * @extobj_usage: extobj dma-resv usage
+ *
+ * See drm_gpuvm_resv_add_fence().
+ */
+static inline void
+drm_gpuvm_exec_resv_add_fence(struct drm_gpuvm_exec *vm_exec,
+			      struct dma_fence *fence,
+			      enum dma_resv_usage private_usage,
+			      enum dma_resv_usage extobj_usage)
+{
+	drm_gpuvm_resv_add_fence(vm_exec->vm, &vm_exec->exec, fence,
+				 private_usage, extobj_usage);
+}
+
+/**
+ * drm_gpuvm_exec_validate()
+ * @vm_exec: the &drm_gpuvm_exec wrapper
+ *
+ * See drm_gpuvm_validate().
+ */
+static inline int
+drm_gpuvm_exec_validate(struct drm_gpuvm_exec *vm_exec)
+{
+	return drm_gpuvm_validate(vm_exec->vm, &vm_exec->exec);
+}
+
 /**
  * struct drm_gpuvm_bo - structure representing a &drm_gpuvm and
  * &drm_gem_object combination
@@ -450,6 +649,12 @@ struct drm_gpuvm_bo {
 	 */
 	struct drm_gem_object *obj;
 
+	/**
+	 * @evicted: Indicates whether the &drm_gem_object is evicted; field
+	 * protected by the &drm_gem_object's dma-resv lock.
+	 */
+	bool evicted;
+
 	/**
 	 * @kref: The reference count for this &drm_gpuvm_bo.
 	 */
@@ -474,6 +679,18 @@ struct drm_gpuvm_bo {
 			 * gpuva list.
 			 */
 			struct list_head gem;
+
+			/**
+			 * @evict: List entry to attach to the &drm_gpuvms
+			 * extobj list.
+			 */
+			struct list_head extobj;
+
+			/**
+			 * @evict: List entry to attach to the &drm_gpuvms evict
+			 * list.
+			 */
+			struct list_head evict;
 		} entry;
 	} list;
 };
@@ -508,6 +725,27 @@ struct drm_gpuvm_bo *
 drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
 		  struct drm_gem_object *obj);
 
+void drm_gpuvm_bo_evict(struct drm_gpuvm_bo *vm_bo, bool evict);
+
+/**
+ * drm_gpuvm_bo_gem_evict()
+ * @obj: the &drm_gem_object
+ * @evict: indicates whether @obj is evicted
+ *
+ * See drm_gpuvm_bo_evict().
+ */
+static inline void
+drm_gpuvm_bo_gem_evict(struct drm_gem_object *obj, bool evict)
+{
+	struct drm_gpuvm_bo *vm_bo;
+
+	drm_gem_gpuva_assert_lock_held(obj);
+	drm_gem_for_each_gpuvm_bo(vm_bo, obj)
+		drm_gpuvm_bo_evict(vm_bo, evict);
+}
+
+void drm_gpuvm_bo_extobj_add(struct drm_gpuvm_bo *vm_bo);
+
 /**
  * drm_gpuvm_bo_for_each_va() - iterator to walk over a list of &drm_gpuva
  * @va__: &drm_gpuva structure to assign to in each iteration step
@@ -874,6 +1112,18 @@ struct drm_gpuvm_ops {
 	 */
 	void (*vm_bo_free)(struct drm_gpuvm_bo *vm_bo);
 
+	/**
+	 * @vm_bo_validate: called from drm_gpuvm_validate()
+	 *
+	 * Drivers receive this callback for every evicted &drm_gem_object being
+	 * mapped in the corresponding &drm_gpuvm.
+	 *
+	 * Typically, drivers would call their driver specific variant of
+	 * ttm_bo_validate() from within this callback.
+	 */
+	int (*vm_bo_validate)(struct drm_gpuvm_bo *vm_bo,
+			      struct drm_exec *exec);
+
 	/**
 	 * @sm_step_map: called from &drm_gpuvm_sm_map to finally insert the
 	 * mapping once all previous steps were completed
-- 
2.41.0

