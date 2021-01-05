Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A522EBB5A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 09:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6AE289D4F;
	Wed,  6 Jan 2021 08:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5184C899F2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 12:39:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: benjamin.gaignard)
 with ESMTPSA id 69EED1F44F69
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/agpsupport: Fix warning in functions documentation
Date: Tue,  5 Jan 2021 13:39:05 +0100
Message-Id: <20210105123905.90330-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 06 Jan 2021 08:52:53 +0000
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
Cc: kernel@collabora.com, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the warnings reported in functions documentation when compiling with W=1

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/gpu/drm/drm_agpsupport.c | 111 ++++++++++++++++---------------
 1 file changed, 59 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/drm_agpsupport.c b/drivers/gpu/drm/drm_agpsupport.c
index 4c7ad46fdd21..db610db9303c 100644
--- a/drivers/gpu/drm/drm_agpsupport.c
+++ b/drivers/gpu/drm/drm_agpsupport.c
@@ -46,16 +46,16 @@
 #include "drm_legacy.h"
 
 /**
- * Get AGP information.
+ * drm_agp_info - Get AGP information.
  *
- * \param inode device inode.
- * \param file_priv DRM file private.
- * \param cmd command.
- * \param arg pointer to a (output) drm_agp_info structure.
- * \return zero on success or a negative number on failure.
+ * @dev: DRM device
+ * @info: drm_agp_info structure to be fill
  *
  * Verifies the AGP device has been initialized and acquired and fills in the
  * drm_agp_info structure with the information in drm_agp_head::agp_info.
+ *
+ * Returns:
+ * zero on success or a negative number on failure.
  */
 int drm_agp_info(struct drm_device *dev, struct drm_agp_info *info)
 {
@@ -93,13 +93,15 @@ int drm_agp_info_ioctl(struct drm_device *dev, void *data,
 }
 
 /**
- * Acquire the AGP device.
+ * drm_agp_acquire - Acquire the AGP device.
  *
- * \param dev DRM device that is to acquire AGP.
- * \return zero on success or a negative number on failure.
+ * @dev: DRM device that is to acquire AGP.
  *
  * Verifies the AGP device hasn't been acquired before and calls
  * \c agp_backend_acquire.
+ *
+ * Returns:
+ * zero on success or a negative number on failure.
  */
 int drm_agp_acquire(struct drm_device *dev)
 {
@@ -116,16 +118,17 @@ int drm_agp_acquire(struct drm_device *dev)
 EXPORT_SYMBOL(drm_agp_acquire);
 
 /**
- * Acquire the AGP device (ioctl).
+ * drm_agp_acquire_ioctl - Acquire the AGP device (ioctl).
  *
- * \param inode device inode.
- * \param file_priv DRM file private.
- * \param cmd command.
- * \param arg user argument.
- * \return zero on success or a negative number on failure.
+ * @dev: DRM device
+ * @data: private data
+ * @file_priv: DRM file private.
  *
  * Verifies the AGP device hasn't been acquired before and calls
  * \c agp_backend_acquire.
+ *
+ * Returns:
+ * zero on success or a negative number on failure.
  */
 int drm_agp_acquire_ioctl(struct drm_device *dev, void *data,
 			  struct drm_file *file_priv)
@@ -134,12 +137,14 @@ int drm_agp_acquire_ioctl(struct drm_device *dev, void *data,
 }
 
 /**
- * Release the AGP device.
+ * drm_agp_release - Release the AGP device.
  *
- * \param dev DRM device that is to release AGP.
- * \return zero on success or a negative number on failure.
+ * @dev: DRM device that is to release AGP.
  *
  * Verifies the AGP device has been acquired and calls \c agp_backend_release.
+ *
+ * Returns:
+ * zero on success or a negative number on failure.
  */
 int drm_agp_release(struct drm_device *dev)
 {
@@ -158,14 +163,16 @@ int drm_agp_release_ioctl(struct drm_device *dev, void *data,
 }
 
 /**
- * Enable the AGP bus.
+ * drm_agp_enable - Enable the AGP bus.
  *
- * \param dev DRM device that has previously acquired AGP.
- * \param mode Requested AGP mode.
- * \return zero on success or a negative number on failure.
+ * @dev: DRM device that has previously acquired AGP.
+ * @mode: Requested AGP mode.
  *
  * Verifies the AGP device has been acquired but not enabled, and calls
  * \c agp_enable.
+ *
+ * Returns:
+ * zero on success or a negative number on failure.
  */
 int drm_agp_enable(struct drm_device *dev, struct drm_agp_mode mode)
 {
@@ -188,16 +195,16 @@ int drm_agp_enable_ioctl(struct drm_device *dev, void *data,
 }
 
 /**
- * Allocate AGP memory.
+ * drm_agp_alloc - Allocate AGP memory.
  *
- * \param inode device inode.
- * \param file_priv file private pointer.
- * \param cmd command.
- * \param arg pointer to a drm_agp_buffer structure.
- * \return zero on success or a negative number on failure.
+ * @dev: DRM device
+ * @request: memory allocation request
  *
  * Verifies the AGP device is present and has been acquired, allocates the
  * memory via agp_allocate_memory() and creates a drm_agp_mem entry for it.
+ *
+ * Returns:
+ * zero on success or a negative number on failure.
  */
 int drm_agp_alloc(struct drm_device *dev, struct drm_agp_buffer *request)
 {
@@ -243,13 +250,14 @@ int drm_agp_alloc_ioctl(struct drm_device *dev, void *data,
 }
 
 /**
- * Search for the AGP memory entry associated with a handle.
+ * drm_agp_lookup_entry - Search for the AGP memory entry associated with a handle.
  *
- * \param dev DRM device structure.
- * \param handle AGP memory handle.
- * \return pointer to the drm_agp_mem structure associated with \p handle.
+ * @dev: DRM device structure.
+ * @handle: AGP memory handle.
  *
  * Walks through drm_agp_head::memory until finding a matching handle.
+ *
+ * Returns: pointer to the drm_agp_mem structure associated with \p handle.
  */
 static struct drm_agp_mem *drm_agp_lookup_entry(struct drm_device *dev,
 						unsigned long handle)
@@ -264,16 +272,15 @@ static struct drm_agp_mem *drm_agp_lookup_entry(struct drm_device *dev,
 }
 
 /**
- * Unbind AGP memory from the GATT (ioctl).
+ * drm_agp_unbind - Unbind AGP memory from the GATT (ioctl).
  *
- * \param inode device inode.
- * \param file_priv DRM file private.
- * \param cmd command.
- * \param arg pointer to a drm_agp_binding structure.
- * \return zero on success or a negative number on failure.
+ * @dev: DRM device structure.
+ * @request: binding request
  *
  * Verifies the AGP device is present and acquired, looks-up the AGP memory
  * entry and passes it to the unbind_agp() function.
+ *
+ * Returns: zero on success or a negative number on failure.
  */
 int drm_agp_unbind(struct drm_device *dev, struct drm_agp_binding *request)
 {
@@ -302,17 +309,16 @@ int drm_agp_unbind_ioctl(struct drm_device *dev, void *data,
 }
 
 /**
- * Bind AGP memory into the GATT (ioctl)
+ * drm_agp_bind- Bind AGP memory into the GATT (ioctl)
  *
- * \param inode device inode.
- * \param file_priv DRM file private.
- * \param cmd command.
- * \param arg pointer to a drm_agp_binding structure.
- * \return zero on success or a negative number on failure.
+ * @dev: DRM device structure.
+ * @request: binding request
  *
  * Verifies the AGP device is present and has been acquired and that no memory
  * is currently bound into the GATT. Looks-up the AGP memory entry and passes
  * it to bind_agp() function.
+ *
+ * Returns: zero on success or a negative number on failure.
  */
 int drm_agp_bind(struct drm_device *dev, struct drm_agp_binding *request)
 {
@@ -346,18 +352,17 @@ int drm_agp_bind_ioctl(struct drm_device *dev, void *data,
 }
 
 /**
- * Free AGP memory (ioctl).
+ * drm_agp_free - Free AGP memory (ioctl).
  *
- * \param inode device inode.
- * \param file_priv DRM file private.
- * \param cmd command.
- * \param arg pointer to a drm_agp_buffer structure.
- * \return zero on success or a negative number on failure.
+ * @dev: DRM device structure.
+ * @request: memory request to be released
  *
  * Verifies the AGP device is present and has been acquired and looks up the
  * AGP memory entry. If the memory is currently bound, unbind it via
  * unbind_agp(). Frees it via free_agp() as well as the entry itself
  * and unlinks from the doubly linked list it's inserted in.
+ *
+ * Returns: zero on success or a negative number on failure.
  */
 int drm_agp_free(struct drm_device *dev, struct drm_agp_buffer *request)
 {
@@ -389,9 +394,9 @@ int drm_agp_free_ioctl(struct drm_device *dev, void *data,
 }
 
 /**
- * Initialize the AGP resources.
+ * drm_agp_init - Initialize the AGP resources.
  *
- * \return pointer to a drm_agp_head structure.
+ * @dev: DRM device structure.
  *
  * Gets the drm_agp_t structure which is made available by the agpgart module
  * via the inter_module_* functions. Creates and initializes a drm_agp_head
@@ -399,6 +404,8 @@ int drm_agp_free_ioctl(struct drm_device *dev, void *data,
  *
  * Note that final cleanup of the kmalloced structure is directly done in
  * drm_pci_agp_destroy.
+ *
+ * Returns: pointer to a drm_agp_head structure.
  */
 struct drm_agp_head *drm_agp_init(struct drm_device *dev)
 {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
