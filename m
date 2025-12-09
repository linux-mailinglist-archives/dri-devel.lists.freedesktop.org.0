Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB521CB0251
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9186A10E5EE;
	Tue,  9 Dec 2025 14:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEA010E5DF
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 14:02:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 30FE13381B;
 Tue,  9 Dec 2025 14:01:53 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 124B43EA63;
 Tue,  9 Dec 2025 14:01:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KIafAtArOGm1OgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Dec 2025 14:01:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, ogabbay@kernel.org,
 mamin506@gmail.com, lizhi.hou@amd.com, maciej.falkowski@linux.intel.com,
 karol.wachowski@linux.intel.com, tomeu@tomeuvizoso.net,
 frank.binns@imgtec.com, matt.coster@imgtec.com, yuq825@gmail.com,
 robh@kernel.org, steven.price@arm.com, adrian.larumbe@collabora.com,
 liviu.dudau@arm.com, mwen@igalia.com, kraxel@redhat.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-doc@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/13] drm/gem-uma: Remove unused interfaces
Date: Tue,  9 Dec 2025 14:42:01 +0100
Message-ID: <20251209140141.94407-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209140141.94407-1-tzimmermann@suse.de>
References: <20251209140141.94407-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 30FE13381B
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 
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

Copying from GEM-SHMEM duplicated a number of interfaces that are not
required. Remove them.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_uma_helper.c | 111 ---------------------------
 include/drm/drm_gem_uma_helper.h     |  16 ----
 2 files changed, 127 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_uma_helper.c b/drivers/gpu/drm/drm_gem_uma_helper.c
index d617cfd981e1..2b88e21b1db9 100644
--- a/drivers/gpu/drm/drm_gem_uma_helper.c
+++ b/drivers/gpu/drm/drm_gem_uma_helper.c
@@ -18,7 +18,6 @@
 #include <drm/drm.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_gem_uma_helper.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_print.h>
@@ -466,29 +465,6 @@ void drm_gem_uma_vunmap_locked(struct drm_gem_uma_object *uma, struct iosys_map
 }
 EXPORT_SYMBOL_GPL(drm_gem_uma_vunmap_locked);
 
-static int
-drm_gem_uma_create_with_handle(struct drm_file *file_priv,
-			       struct drm_device *dev, size_t size,
-			       uint32_t *handle)
-{
-	struct drm_gem_uma_object *uma;
-	int ret;
-
-	uma = drm_gem_uma_create(dev, size);
-	if (IS_ERR(uma))
-		return PTR_ERR(uma);
-
-	/*
-	 * Allocate an id of idr table where the obj is registered
-	 * and handle has the id what user can see.
-	 */
-	ret = drm_gem_handle_create(file_priv, &uma->base, handle);
-	/* drop reference from allocate - handle holds it now. */
-	drm_gem_object_put(&uma->base);
-
-	return ret;
-}
-
 /* Update madvise status, returns true if not purged, else
  * false or -errno.
  */
@@ -537,36 +513,6 @@ void drm_gem_uma_purge_locked(struct drm_gem_uma_object *uma)
 }
 EXPORT_SYMBOL_GPL(drm_gem_uma_purge_locked);
 
-/**
- * drm_gem_uma_dumb_create - Create a dumb UMA buffer object
- * @file: DRM file structure to create the dumb buffer for
- * @dev: DRM device
- * @args: IOCTL data
- *
- * This function computes the pitch of the dumb buffer and rounds it up to an
- * integer number of bytes per pixel. Drivers for hardware that doesn't have
- * any additional restrictions on the pitch can directly use this function as
- * their &drm_driver.dumb_create callback.
- *
- * For hardware with additional restrictions, drivers can adjust the fields
- * set up by userspace before calling into this function.
- *
- * Returns:
- * 0 on success or a negative error code on failure.
- */
-int drm_gem_uma_dumb_create(struct drm_file *file, struct drm_device *dev,
-			    struct drm_mode_create_dumb *args)
-{
-	int ret;
-
-	ret = drm_mode_size_dumb(dev, args, SZ_8, 0);
-	if (ret)
-		return ret;
-
-	return drm_gem_uma_create_with_handle(file, dev, args->size, &args->handle);
-}
-EXPORT_SYMBOL_GPL(drm_gem_uma_dumb_create);
-
 static vm_fault_t drm_gem_uma_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
@@ -836,63 +782,6 @@ drm_gem_uma_prime_import_sg_table(struct drm_device *dev,
 }
 EXPORT_SYMBOL_GPL(drm_gem_uma_prime_import_sg_table);
 
-/**
- * drm_gem_uma_prime_import_no_map - Import dmabuf without mapping its sg_table
- * @dev: Device to import into
- * @dma_buf: dma-buf object to import
- *
- * Drivers that use the GEM UMA helpers but also wants to import dmabuf without
- * mapping its sg_table can use this as their &drm_driver.gem_prime_import
- * implementation.
- */
-struct drm_gem_object *drm_gem_uma_prime_import_no_map(struct drm_device *dev,
-						       struct dma_buf *dma_buf)
-{
-	struct dma_buf_attachment *attach;
-	struct drm_gem_uma_object *uma;
-	struct drm_gem_object *obj;
-	size_t size;
-	int ret;
-
-	if (drm_gem_is_prime_exported_dma_buf(dev, dma_buf)) {
-		/*
-		 * Importing dmabuf exported from our own gem increases
-		 * refcount on gem itself instead of f_count of dmabuf.
-		 */
-		obj = dma_buf->priv;
-		drm_gem_object_get(obj);
-		return obj;
-	}
-
-	attach = dma_buf_attach(dma_buf, dev->dev);
-	if (IS_ERR(attach))
-		return ERR_CAST(attach);
-
-	get_dma_buf(dma_buf);
-
-	size = PAGE_ALIGN(attach->dmabuf->size);
-
-	uma = __drm_gem_uma_create(dev, size, true, NULL);
-	if (IS_ERR(uma)) {
-		ret = PTR_ERR(uma);
-		goto fail_detach;
-	}
-
-	drm_dbg_prime(dev, "size = %zu\n", size);
-
-	uma->base.import_attach = attach;
-	uma->base.resv = dma_buf->resv;
-
-	return &uma->base;
-
-fail_detach:
-	dma_buf_detach(dma_buf, attach);
-	dma_buf_put(dma_buf);
-
-	return ERR_PTR(ret);
-}
-EXPORT_SYMBOL_GPL(drm_gem_uma_prime_import_no_map);
-
 MODULE_DESCRIPTION("DRM UMA memory-management helpers");
 MODULE_IMPORT_NS("DMA_BUF");
 MODULE_LICENSE("GPL");
diff --git a/include/drm/drm_gem_uma_helper.h b/include/drm/drm_gem_uma_helper.h
index e7722c625fab..3d6de27efe79 100644
--- a/include/drm/drm_gem_uma_helper.h
+++ b/include/drm/drm_gem_uma_helper.h
@@ -13,7 +13,6 @@
 #include <drm/drm_prime.h>
 
 struct dma_buf_attachment;
-struct drm_mode_create_dumb;
 struct drm_printer;
 struct sg_table;
 
@@ -290,20 +289,5 @@ struct drm_gem_object *
 drm_gem_uma_prime_import_sg_table(struct drm_device *dev,
 				  struct dma_buf_attachment *attach,
 				  struct sg_table *sgt);
-int drm_gem_uma_dumb_create(struct drm_file *file, struct drm_device *dev,
-			    struct drm_mode_create_dumb *args);
-struct drm_gem_object *drm_gem_uma_prime_import_no_map(struct drm_device *dev,
-						       struct dma_buf *buf);
-
-/**
- * DRM_GEM_UMA_DRIVER_OPS - Default GEM UMA operations
- *
- * This macro provides a shortcut for setting the GEM UMA operations
- * in the &drm_driver structure. Drivers that do not require an s/g table
- * for imported buffers should use this.
- */
-#define DRM_GEM_UMA_DRIVER_OPS \
-	.gem_prime_import       = drm_gem_uma_prime_import_no_map, \
-	.dumb_create            = drm_gem_uma_dumb_create
 
 #endif /* __DRM_GEM_UMA_HELPER_H__ */
-- 
2.52.0

