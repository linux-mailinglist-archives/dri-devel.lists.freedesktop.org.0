Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 458716F6A6B
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 13:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2895E10E115;
	Thu,  4 May 2023 11:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9436F10E0DD;
 Thu,  4 May 2023 11:52:06 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-94ef0a8546fso60449866b.1; 
 Thu, 04 May 2023 04:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683201125; x=1685793125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=y9Z4fPS9NipU5jPNYXvRUqxF3renCIazuJPCaz6TINY=;
 b=O1ykTp6x58bHC0qnACMJMOv4fg2kv3+jYi3wgZ/OdV4BK+MfyD36tDm+5HNQyVOxyv
 gpQmnC+TPq2vE88ZhruWbsLxpFCIODQEF4WKSV+WGc0NHMjloWSESxB3+Dhix6rd3NHx
 1oaIta5M+V/JLMk6RP1nxBPOT42+2M22kpgA4W4j1PNuq6k2GGs+vWrebxfWsSbi5a/C
 9C9vctyaJPemlQBcamcah2TwMf3BjeW4YIhqOdfstVmzrCEIrjiKDkxXxRrwsxl566TE
 sr38gu+f+0WDeVnP1KXVnTs9xJviDs5SP8Zc9tDn9tyJlzx81RPzNrwwNwszHUkVtkpC
 iR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683201125; x=1685793125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y9Z4fPS9NipU5jPNYXvRUqxF3renCIazuJPCaz6TINY=;
 b=YMTF+bBOgBPK7ns1on2KWW9LfqO9mvrRgG3q9NP5wRjKXZPANwf4gtK+RUtc5Xggn0
 9jng09htL4wg9O3+jAi/6ufEzz1/Pfdt3eo9XCJR5QJNOLhpHgAQx2iaxZYAifHGFe2d
 pad3V9bWaVLIi6YyYiEu0acsyaYq752noiA7zT7BAMegpX7jOTD844NbKoW6plpwKNTg
 gMC4X6G4PcLw7JCTAHcBDn+aOcqJV4Jpy+axdwoCb8dkITDuN3WzA3o9QRdWHCxlY8lp
 3NBF8bhXkqKDFxvWT38HQsJQ+IZLIezZ+oI8SN5rD4En4YRDsD/j8t+xYWNJX+7TYDdy
 qKkg==
X-Gm-Message-State: AC+VfDwsBlt5oO9N1P8diy2bYX6vH2fq3CU96G96M0ouo92LtO+c6Fx5
 vog8D975J3ysrILg8uizJ/w=
X-Google-Smtp-Source: ACHHUZ4asDP0EpfRaNgQW8JXGaTqFAQLuL7AU4Tbv+Zm2JiK0Xuksg5LK7hwbH5f/sxPYTPU8g7zOQ==
X-Received: by 2002:a17:906:6a15:b0:95e:ce4b:b333 with SMTP id
 qw21-20020a1709066a1500b0095ece4bb333mr6981661ejc.53.1683201124521; 
 Thu, 04 May 2023 04:52:04 -0700 (PDT)
Received: from able.fritz.box (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 hx27-20020a170906847b00b009659ecdf29fsm1061741ejc.1.2023.05.04.04.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 04:52:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: francois.dugast@intel.com, felix.kuehling@amd.com,
 arunpravin.paneerselvam@amd.com, thomas_os@shipmail.org, dakr@redhat.com,
 luben.tuikov@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 01/13] drm: execution context for GEM buffers v4
Date: Thu,  4 May 2023 13:51:47 +0200
Message-Id: <20230504115159.2245-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230504115159.2245-1-christian.koenig@amd.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This adds the infrastructure for an execution context for GEM buffers
which is similar to the existing TTMs execbuf util and intended to replace
it in the long term.

The basic functionality is that we abstracts the necessary loop to lock
many different GEM buffers with automated deadlock and duplicate handling.

v2: drop xarray and use dynamic resized array instead, the locking
    overhead is unecessary and measurable.
v3: drop duplicate tracking, radeon is really the only one needing that.
v4: fixes issues pointed out by Danilo, some typos in comments and a
    helper for lock arrays of GEM objects.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 Documentation/gpu/drm-mm.rst |  12 ++
 drivers/gpu/drm/Kconfig      |   6 +
 drivers/gpu/drm/Makefile     |   2 +
 drivers/gpu/drm/drm_exec.c   | 278 +++++++++++++++++++++++++++++++++++
 include/drm/drm_exec.h       | 119 +++++++++++++++
 5 files changed, 417 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_exec.c
 create mode 100644 include/drm/drm_exec.h

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index a79fd3549ff8..a52e6f4117d6 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -493,6 +493,18 @@ DRM Sync Objects
 .. kernel-doc:: drivers/gpu/drm/drm_syncobj.c
    :export:
 
+DRM Execution context
+=====================
+
+.. kernel-doc:: drivers/gpu/drm/drm_exec.c
+   :doc: Overview
+
+.. kernel-doc:: include/drm/drm_exec.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/drm_exec.c
+   :export:
+
 GPU Scheduler
 =============
 
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index ba3fb04bb691..2dc81eb062eb 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -201,6 +201,12 @@ config DRM_TTM
 	  GPU memory types. Will be enabled automatically if a device driver
 	  uses it.
 
+config DRM_EXEC
+	tristate
+	depends on DRM
+	help
+	  Execution context for command submissions
+
 config DRM_BUDDY
 	tristate
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index a33257d2bc7f..9c6446eb3c83 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -78,6 +78,8 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 #
 # Memory-management helpers
 #
+#
+obj-$(CONFIG_DRM_EXEC) += drm_exec.o
 
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
 
diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
new file mode 100644
index 000000000000..18071bff20f4
--- /dev/null
+++ b/drivers/gpu/drm/drm_exec.c
@@ -0,0 +1,278 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#include <drm/drm_exec.h>
+#include <drm/drm_gem.h>
+#include <linux/dma-resv.h>
+
+/**
+ * DOC: Overview
+ *
+ * This component mainly abstracts the retry loop necessary for locking
+ * multiple GEM objects while preparing hardware operations (e.g. command
+ * submissions, page table updates etc..).
+ *
+ * If a contention is detected while locking a GEM object the cleanup procedure
+ * unlocks all previously locked GEM objects and locks the contended one first
+ * before locking any further objects.
+ *
+ * After an object is locked fences slots can optionally be reserved on the
+ * dma_resv object inside the GEM object.
+ *
+ * A typical usage pattern should look like this::
+ *
+ *	struct drm_gem_object *obj;
+ *	struct drm_exec exec;
+ *	unsigned long index;
+ *	int ret;
+ *
+ *	drm_exec_init(&exec, true);
+ *	drm_exec_while_not_all_locked(&exec) {
+ *		ret = drm_exec_prepare_obj(&exec, boA, 1);
+ *		drm_exec_continue_on_contention(&exec);
+ *		if (ret)
+ *			goto error;
+ *
+ *		ret = drm_exec_prepare_obj(&exec, boB, 1);
+ *		drm_exec_continue_on_contention(&exec);
+ *		if (ret)
+ *			goto error;
+ *	}
+ *
+ *	drm_exec_for_each_locked_object(&exec, index, obj) {
+ *		dma_resv_add_fence(obj->resv, fence, DMA_RESV_USAGE_READ);
+ *		...
+ *	}
+ *	drm_exec_fini(&exec);
+ *
+ * See struct dma_exec for more details.
+ */
+
+/* Dummy value used to initially enter the retry loop */
+#define DRM_EXEC_DUMMY (void*)~0
+
+/* Unlock all objects and drop references */
+static void drm_exec_unlock_all(struct drm_exec *exec)
+{
+	struct drm_gem_object *obj;
+	unsigned long index;
+
+	drm_exec_for_each_locked_object(exec, index, obj) {
+		dma_resv_unlock(obj->resv);
+		drm_gem_object_put(obj);
+	}
+
+	drm_gem_object_put(exec->prelocked);
+	exec->prelocked = NULL;
+}
+
+/**
+ * drm_exec_init - initialize a drm_exec object
+ * @exec: the drm_exec object to initialize
+ * @interruptible: if locks should be acquired interruptible
+ *
+ * Initialize the object and make sure that we can track locked objects.
+ */
+void drm_exec_init(struct drm_exec *exec, bool interruptible)
+{
+	exec->interruptible = interruptible;
+	exec->objects = kmalloc(PAGE_SIZE, GFP_KERNEL);
+
+	/* If allocation here fails, just delay that till the first use */
+	exec->max_objects = exec->objects ? PAGE_SIZE / sizeof(void *) : 0;
+	exec->num_objects = 0;
+	exec->contended = DRM_EXEC_DUMMY;
+	exec->prelocked = NULL;
+}
+EXPORT_SYMBOL(drm_exec_init);
+
+/**
+ * drm_exec_fini - finalize a drm_exec object
+ * @exec: the drm_exec object to finalize
+ *
+ * Unlock all locked objects, drop the references to objects and free all memory
+ * used for tracking the state.
+ */
+void drm_exec_fini(struct drm_exec *exec)
+{
+	drm_exec_unlock_all(exec);
+	kvfree(exec->objects);
+	if (exec->contended != DRM_EXEC_DUMMY) {
+		drm_gem_object_put(exec->contended);
+		ww_acquire_fini(&exec->ticket);
+	}
+}
+EXPORT_SYMBOL(drm_exec_fini);
+
+/**
+ * drm_exec_cleanup - cleanup when contention is detected
+ * @exec: the drm_exec object to cleanup
+ *
+ * Cleanup the current state and return true if we should stay inside the retry
+ * loop, false if there wasn't any contention detected and we can keep the
+ * objects locked.
+ */
+bool drm_exec_cleanup(struct drm_exec *exec)
+{
+	if (likely(!exec->contended)) {
+		ww_acquire_done(&exec->ticket);
+		return false;
+	}
+
+	if (likely(exec->contended == DRM_EXEC_DUMMY)) {
+		exec->contended = NULL;
+		ww_acquire_init(&exec->ticket, &reservation_ww_class);
+		return true;
+	}
+
+	drm_exec_unlock_all(exec);
+	exec->num_objects = 0;
+	return true;
+}
+EXPORT_SYMBOL(drm_exec_cleanup);
+
+/* Track the locked object in the array */
+static int drm_exec_obj_locked(struct drm_exec *exec,
+			       struct drm_gem_object *obj)
+{
+	if (unlikely(exec->num_objects == exec->max_objects)) {
+		size_t size = exec->max_objects * sizeof(void *);
+		void *tmp;
+
+		tmp = kvrealloc(exec->objects, size, size + PAGE_SIZE,
+				GFP_KERNEL);
+		if (!tmp)
+			return -ENOMEM;
+
+		exec->objects = tmp;
+		exec->max_objects += PAGE_SIZE / sizeof(void *);
+	}
+	drm_gem_object_get(obj);
+	exec->objects[exec->num_objects++] = obj;
+
+	return 0;
+}
+
+/* Make sure the contended object is locked first */
+static int drm_exec_lock_contended(struct drm_exec *exec)
+{
+	struct drm_gem_object *obj = exec->contended;
+	int ret;
+
+	if (likely(!obj))
+		return 0;
+
+	if (exec->interruptible) {
+		ret = dma_resv_lock_slow_interruptible(obj->resv,
+						       &exec->ticket);
+		if (unlikely(ret))
+			goto error_dropref;
+	} else {
+		dma_resv_lock_slow(obj->resv, &exec->ticket);
+	}
+
+	ret = drm_exec_obj_locked(exec, obj);
+	if (unlikely(ret)) {
+		dma_resv_unlock(obj->resv);
+		goto error_dropref;
+	}
+
+	swap(exec->prelocked, obj);
+
+error_dropref:
+	/* Always cleanup the contention so that error handling can kick in */
+	drm_gem_object_put(obj);
+	exec->contended = NULL;
+	return ret;
+}
+
+/**
+ * drm_exec_prepare_obj - prepare a GEM object for use
+ * @exec: the drm_exec object with the state
+ * @obj: the GEM object to prepare
+ * @num_fences: how many fences to reserve
+ *
+ * Prepare a GEM object for use by locking it and reserving fence slots. All
+ * successfully locked objects are put into the locked container.
+ *
+ * Returns: -EDEADLK if a contention is detected, -EALREADY when object is
+ * already locked, -ENOMEM when memory allocation failed and zero for success.
+ */
+int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
+			 unsigned int num_fences)
+{
+	int ret;
+
+	ret = drm_exec_lock_contended(exec);
+	if (unlikely(ret))
+		return ret;
+
+	if (exec->prelocked == obj) {
+		drm_gem_object_put(exec->prelocked);
+		exec->prelocked = NULL;
+
+		return dma_resv_reserve_fences(obj->resv, num_fences);
+	}
+
+	if (exec->interruptible)
+		ret = dma_resv_lock_interruptible(obj->resv, &exec->ticket);
+	else
+		ret = dma_resv_lock(obj->resv, &exec->ticket);
+
+	if (unlikely(ret == -EDEADLK)) {
+		drm_gem_object_get(obj);
+		exec->contended = obj;
+		return -EDEADLK;
+	}
+
+	if (unlikely(ret))
+		return ret;
+
+	ret = drm_exec_obj_locked(exec, obj);
+	if (ret)
+		goto error_unlock;
+
+	/* Keep locked when reserving fences fails */
+	return dma_resv_reserve_fences(obj->resv, num_fences);
+
+error_unlock:
+	dma_resv_unlock(obj->resv);
+	return ret;
+}
+EXPORT_SYMBOL(drm_exec_prepare_obj);
+
+/**
+ * drm_exec_prepare_array - helper to prepare an array of objects
+ * @exec: the drm_exec object with the state
+ * @objects: array of GEM object to prepare
+ * @num_objects: number of GEM objects in the array
+ * @num_fences: number of fences to reserve on each GEM object
+ *
+ * Prepares all GEM objects in an array, handles contention but aports on first
+ * error otherwise. Reserves @num_fences on each GEM object after locking it.
+ *
+ * Returns: -EALREADY when object is already locked, -ENOMEM when memory
+ * allocation failed and zero for success.
+ */
+int drm_exec_prepare_array(struct drm_exec *exec,
+			   struct drm_gem_object **objects,
+			   unsigned int num_objects,
+			   unsigned int num_fences)
+{
+	int ret;
+
+	drm_exec_while_not_all_locked(exec) {
+		for (unsigned int i = 0; i < num_objects; ++i) {
+			ret = drm_exec_prepare_obj(exec, objects[i],
+						   num_fences);
+			drm_exec_break_on_contention(exec);
+			if (unlikely(ret))
+				return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_exec_prepare_array);
+
+MODULE_DESCRIPTION("DRM execution context");
+MODULE_LICENSE("Dual MIT/GPL");
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
new file mode 100644
index 000000000000..7c7481ed088a
--- /dev/null
+++ b/include/drm/drm_exec.h
@@ -0,0 +1,119 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef __DRM_EXEC_H__
+#define __DRM_EXEC_H__
+
+#include <linux/ww_mutex.h>
+
+struct drm_gem_object;
+
+/**
+ * struct drm_exec - Execution context
+ */
+struct drm_exec {
+	/**
+	 * @interruptible: If locks should be taken interruptible
+	 */
+	bool			interruptible;
+
+	/**
+	 * @ticket: WW ticket used for acquiring locks
+	 */
+	struct ww_acquire_ctx	ticket;
+
+	/**
+	 * @num_objects: number of objects locked
+	 */
+	unsigned int		num_objects;
+
+	/**
+	 * @max_objects: maximum objects in array
+	 */
+	unsigned int		max_objects;
+
+	/**
+	 * @objects: array of the locked objects
+	 */
+	struct drm_gem_object	**objects;
+
+	/**
+	 * @contended: contended GEM object we backed off for
+	 */
+	struct drm_gem_object	*contended;
+
+	/**
+	 * @prelocked: already locked GEM object due to contention
+	 */
+	struct drm_gem_object *prelocked;
+};
+
+/**
+ * drm_exec_for_each_locked_object - iterate over all the locked objects
+ * @exec: drm_exec object
+ * @index: unsigned long index for the iteration
+ * @obj: the current GEM object
+ *
+ * Iterate over all the locked GEM objects inside the drm_exec object.
+ */
+#define drm_exec_for_each_locked_object(exec, index, obj)	\
+	for (index = 0, obj = (exec)->objects[0];		\
+	     index < (exec)->num_objects;			\
+	     ++index, obj = (exec)->objects[index])
+
+/**
+ * drm_exec_while_not_all_locked - loop until all GEM objects are prepared
+ * @exec: drm_exec object
+ *
+ * Core functionality of the drm_exec object. Loops until all GEM objects are
+ * prepared and no more contention exists.
+ *
+ * At the beginning of the loop it is guaranteed that no GEM object is locked.
+ */
+#define drm_exec_while_not_all_locked(exec)	\
+	while (drm_exec_cleanup(exec))
+
+/**
+ * drm_exec_continue_on_contention - continue the loop when we need to cleanup
+ * @exec: drm_exec object
+ *
+ * Control flow helper to continue when a contention was detected and we need to
+ * clean up and re-start the loop to prepare all GEM objects.
+ */
+#define drm_exec_continue_on_contention(exec)		\
+	if (unlikely(drm_exec_is_contended(exec)))	\
+		continue
+
+/**
+ * drm_exec_break_on_contention - break a subordinal loop on contention
+ * @exec: drm_exec object
+ *
+ * Control flow helper to break a subordinal loop when a contention was detected
+ * and we need to clean up and re-start the loop to prepare all GEM objects.
+ */
+#define drm_exec_break_on_contention(exec)		\
+	if (unlikely(drm_exec_is_contended(exec)))	\
+		break
+
+/**
+ * drm_exec_is_contended - check for contention
+ * @exec: drm_exec object
+ *
+ * Returns true if the drm_exec object has run into some contention while
+ * locking a GEM object and needs to clean up.
+ */
+static inline bool drm_exec_is_contended(struct drm_exec *exec)
+{
+	return !!exec->contended;
+}
+
+void drm_exec_init(struct drm_exec *exec, bool interruptible);
+void drm_exec_fini(struct drm_exec *exec);
+bool drm_exec_cleanup(struct drm_exec *exec);
+int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
+			 unsigned int num_fences);
+int drm_exec_prepare_array(struct drm_exec *exec,
+			   struct drm_gem_object **objects,
+			   unsigned int num_objects,
+			   unsigned int num_fences);
+
+#endif
-- 
2.34.1

