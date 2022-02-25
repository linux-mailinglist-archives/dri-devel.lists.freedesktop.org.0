Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 192DC4C4606
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 14:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249EA10E4A6;
	Fri, 25 Feb 2022 13:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A266010E3D5;
 Fri, 25 Feb 2022 13:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645795337; x=1677331337;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uMbpACJcAbRsd//hSfssVqdEtmlKEeNenIZjwLQPQug=;
 b=MA9qyINiRNslVytuTAsnCG4oPYsBkVj5VNS1xqEqgngzGf0D53Ep66xt
 hBfK9SlYFTcdS8P/5AnltaayLTcz7dFtzmfwa6RpINSpG+tdfzqKz2sBP
 au+vyn7hEs7lup+YhxlTsfNRpF2V4srbQj51bsdmf13j9mBy2/eUlfG3n
 34ishO9JS03V30tByqn/q6vw/rjJ4XTCajyZHB5mLpHcf9REAQLG8u8M+
 sk6iuaajVk+sNFerzWQbRbOg2z7PFTs4dU7xduU/NSy3VHQdJtTD1/FrX
 HUneqrUVtu90EPMAplsdytb1yLHzOpypMs0LcFTUE2Qwn24FyRenuxyA2 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="236000578"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="236000578"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 05:22:17 -0800
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="544050481"
Received: from asaechnx-mobl2.ccr.corp.intel.com (HELO
 hades.ger.corp.intel.com) ([10.252.49.63])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 05:22:15 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/doc: Fix typos and update outdated structure and API
 names
Date: Fri, 25 Feb 2022 15:22:11 +0200
Message-Id: <20220225132213.1435026-1-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It fixes typo and updates outdated struct and API names that are currently
deprecated or in use but have changed on the kernel documents of DRM section
and comments.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 Documentation/gpu/drm-mm.rst          |  8 ++++----
 drivers/gpu/drm/drm_file.c            | 10 +++++-----
 drivers/gpu/drm/drm_gem_vram_helper.c | 18 ++++++++----------
 drivers/gpu/drm/ttm/ttm_pool.c        |  2 +-
 include/drm/drm_device.h              |  8 ++++++--
 include/drm/drm_drv.h                 |  6 +++---
 include/drm/drm_gem_cma_helper.h      |  2 +-
 include/drm/drm_gem_vram_helper.h     |  1 -
 8 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 198bcc1affa1..0451e6ca7402 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -266,13 +266,13 @@ argument.
 The GEM core provides a helper method drm_gem_mmap() to
 handle object mapping. The method can be set directly as the mmap file
 operation handler. It will look up the GEM object based on the offset
-value and set the VMA operations to the :c:type:`struct drm_driver
-<drm_driver>` gem_vm_ops field. Note that drm_gem_mmap() doesn't map memory to
+value and set the VMA operations to the :c:type:`struct drm_gem_object_funcs
+<drm_gem_object_funcs>` vm_ops field. Note that drm_gem_mmap() doesn't map memory to
 userspace, but relies on the driver-provided fault handler to map pages
 individually.
 
-To use drm_gem_mmap(), drivers must fill the struct :c:type:`struct drm_driver
-<drm_driver>` gem_vm_ops field with a pointer to VM operations.
+To use drm_gem_mmap(), drivers must fill the struct :c:type:`struct drm_gem_object_funcs
+<drm_gem_object_funcs>` vm_ops field with a pointer to VM operations.
 
 The VM operations is a :c:type:`struct vm_operations_struct <vm_operations_struct>`
 made up of several fields, the more interesting ones being:
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index ed25168619fc..21ca97cf7670 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -553,8 +553,8 @@ EXPORT_SYMBOL(drm_release_noglobal);
  * means all modern display drivers must use it.
  *
  * @offset is ignored, DRM events are read like a pipe. Therefore drivers also
- * must set the &file_operation.llseek to no_llseek(). Polling support is
- * provided by drm_poll().
+ * must set the &file_operation.llseek to no_llseek() or noop_llseek().
+ * Polling support is provided by drm_poll().
  *
  * This function will only ever read a full event. Therefore userspace must
  * supply a big enough buffer to fit any event to ensure forward progress. Since
@@ -640,7 +640,7 @@ EXPORT_SYMBOL(drm_read);
  * @filp: file pointer
  * @wait: poll waiter table
  *
- * This function must be used by drivers as their &file_operations.read method
+ * This function must be used by drivers as their &file_operations.poll method
  * if they use DRM events for asynchronous signalling to userspace.  Since
  * events are used by the KMS API for vblank and page flip completion this means
  * all modern display drivers must use it.
@@ -674,7 +674,7 @@ EXPORT_SYMBOL(drm_poll);
  *
  * This function prepares the passed in event for eventual delivery. If the event
  * doesn't get delivered (because the IOCTL fails later on, before queuing up
- * anything) then the even must be cancelled and freed using
+ * anything) then the event must be cancelled and freed using
  * drm_event_cancel_free(). Successfully initialized events should be sent out
  * using drm_send_event() or drm_send_event_locked() to signal completion of the
  * asynchronous event to userspace.
@@ -716,7 +716,7 @@ EXPORT_SYMBOL(drm_event_reserve_init_locked);
  *
  * This function prepares the passed in event for eventual delivery. If the event
  * doesn't get delivered (because the IOCTL fails later on, before queuing up
- * anything) then the even must be cancelled and freed using
+ * anything) then the event must be cancelled and freed using
  * drm_event_cancel_free(). Successfully initialized events should be sent out
  * using drm_send_event() or drm_send_event_locked() to signal completion of the
  * asynchronous event to userspace.
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index dc7f938bfff2..a43c550900ec 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -39,25 +39,23 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
  * provide an implementation that suits the hardware. If the hardware device
  * contains dedicated video memory, the DRM driver can use the VRAM helper
  * library. Each active buffer object is stored in video RAM. Active
- * buffer are used for drawing the current frame, typically something like
+ * buffers are used for drawing the current frame, typically something like
  * the frame's scanout buffer or the cursor image. If there's no more space
  * left in VRAM, inactive GEM objects can be moved to system memory.
  *
- * To initialize the VRAM helper library call drmm_vram_helper_alloc_mm().
+ * To initialize the VRAM helper library call drmm_vram_helper_init().
  * The function allocates and initializes an instance of &struct drm_vram_mm
  * in &struct drm_device.vram_mm . Use &DRM_GEM_VRAM_DRIVER to initialize
- * &struct drm_driver and  &DRM_VRAM_MM_FILE_OPERATIONS to initialize
+ * &struct drm_driver and  &DEFINE_DRM_GEM_FOPS to initialize
  * &struct file_operations; as illustrated below.
  *
  * .. code-block:: c
  *
- *	struct file_operations fops ={
- *		.owner = THIS_MODULE,
- *		DRM_VRAM_MM_FILE_OPERATION
- *	};
+ *	DEFINE_DRM_GEM_FOPS(drv_fops);
+ *
  *	struct drm_driver drv = {
  *		.driver_feature = DRM_ ... ,
- *		.fops = &fops,
+ *		.fops = &drv_fops,
  *		DRM_GEM_VRAM_DRIVER
  *	};
  *
@@ -71,7 +69,7 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
  *		// setup device, vram base and size
  *		// ...
  *
- *		ret = drmm_vram_helper_alloc_mm(dev, vram_base, vram_size);
+ *		ret = drmm_vram_helper_init(dev, vram_base, vram_size);
  *		if (ret)
  *			return ret;
  *		return 0;
@@ -84,7 +82,7 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
  * to userspace.
  *
  * You don't have to clean up the instance of VRAM MM.
- * drmm_vram_helper_alloc_mm() is a managed interface that installs a
+ * drmm_vram_helper_init() is a managed interface that installs a
  * clean-up handler to run during the DRM device's release.
  *
  * For drawing or scanout operations, rsp. buffer objects have to be pinned
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 1bba0a0ed3f9..44aaec083763 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -453,7 +453,7 @@ EXPORT_SYMBOL(ttm_pool_alloc);
  * @pool: Pool to give pages back to.
  * @tt: ttm_tt object to unpopulate
  *
- * Give the packing pages back to a pool or free them
+ * Give the backing pages back to a pool or free them
  */
 void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
 {
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 9923c7a6885e..2ea4b8692bd7 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -135,7 +135,9 @@ struct drm_device {
 	/**
 	 * @struct_mutex:
 	 *
-	 * Lock for others (not &drm_minor.master and &drm_file.is_master)
+	 * Lock for others (not &drm_file.was_master, &drm_file.is_master,
+	 * &drm_file.master, &drm_device.master, &drm_master.unique,
+	 * &drm_master.unique_len and &drm_master.magic_map)
 	 *
 	 * WARNING:
 	 * Only drivers annotated with DRIVER_LEGACY should be using this.
@@ -145,7 +147,9 @@ struct drm_device {
 	/**
 	 * @master_mutex:
 	 *
-	 * Lock for &drm_minor.master and &drm_file.is_master
+	 * Lock for &drm_file.was_master, &drm_file.is_master, &drm_file.master,
+	 * &drm_device.master, &drm_master.unique, &drm_master.unique_len and
+	 * &drm_master.magic_map
 	 */
 	struct mutex master_mutex;
 
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index f6159acb8856..1a5463984334 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -46,7 +46,7 @@ struct sg_table;
 /**
  * enum drm_driver_feature - feature flags
  *
- * See &drm_driver.driver_features, drm_device.driver_features and
+ * See &drm_driver.driver_features, &drm_device.driver_features and
  * drm_core_check_feature().
  */
 enum drm_driver_feature {
@@ -229,8 +229,8 @@ struct drm_driver {
 	 *
 	 * All legacy drivers use this callback to de-initialize the hardware.
 	 * This is purely because of the shadow-attach model, where the DRM
-	 * kernel driver does not really own the hardware. Instead ownershipe is
-	 * handled with the help of userspace through an inheritedly racy dance
+	 * kernel driver does not really own the hardware. Instead ownership is
+	 * handled with the help of userspace through an inherited racy dance
 	 * to set/unset the VT into raw mode.
 	 *
 	 * Legacy drivers initialize the hardware in the @firstopen callback,
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index fbda4ce5d5fb..d9a63d5d3851 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -160,7 +160,7 @@ drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
  * &drm_driver structure.
  *
  * This macro is a variant of DRM_GEM_CMA_DRIVER_OPS for drivers that
- * override the default implementation of &struct rm_driver.dumb_create. Use
+ * override the default implementation of &struct drm_driver.dumb_create. Use
  * DRM_GEM_CMA_DRIVER_OPS if possible. Drivers that require a virtual address
  * on imported buffers should use
  * DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE() instead.
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index c083a1d71cf4..0565c2624b0a 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -46,7 +46,6 @@ struct vm_area_struct;
  * operations. So a buffer object that has been pinned N times with
  * drm_gem_vram_pin() must be unpinned N times with
  * drm_gem_vram_unpin(). The same applies to pairs of
- * drm_gem_vram_kmap() and drm_gem_vram_kunmap(), as well as pairs of
  * drm_gem_vram_vmap() and drm_gem_vram_vunmap().
  */
 struct drm_gem_vram_object {
-- 
2.34.1

