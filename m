Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 331075770A2
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 20:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1245113BD0;
	Sat, 16 Jul 2022 18:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3039E113BD0
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 18:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=Y2EBEMOUkjRYIPPCsw9QRzUwY0jsSZ1lhOMjP5+onwk=;
 b=XyFefESDWFSsfXkOUooFiAdi3glUJRG/Z/PPEQnouo8+8sTeWz+ujFG8MTrLV7c0x9zb0RDG0aMFO
 I54PdDWFLjG60uXvDO4CfZB0aSPRuDRq85yiXrqW9JIT6/xhl0Xjhrt/iDi8XQMbjw4IZwJh9uSjS2
 dbVFhU4LzlVsx0lMFsbepAcH+j1i+RX86BYrbB9c0AEdkGKctSClWEJH/p9Mfe8OgagqPkiLq2/rI+
 W+Ji66Ra5Z0KRorZ/isRE8Iy6R5OELvXNrW034/3L8f8Y6ToEydQ13BYoKlbHTy9aXN2eAmlrqlrCG
 5FFQQ3ZsTAi69pFBgb3Cvgm2UfeKXcg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=Y2EBEMOUkjRYIPPCsw9QRzUwY0jsSZ1lhOMjP5+onwk=;
 b=4/3voBOUj1wZUSu1Wdo61M5fGiB0/4qKzEfZMUAJkQ9gT/nfUBxPDnALYzs8D0rq4J8Yita8tb0ck
 jBM6s4CBg==
X-HalOne-Cookie: 09117c8d1a6b2a81d59a3bc01a8874914c5b513a
X-HalOne-ID: a3d2efa7-0533-11ed-a917-d0431ea8a290
Received: from mailproxy1.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id a3d2efa7-0533-11ed-a917-d0431ea8a290;
 Sat, 16 Jul 2022 18:18:06 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 01/11] drm: rename DRIVER_LEGACY to DRIVER_DRI1
Date: Sat, 16 Jul 2022 20:17:40 +0200
Message-Id: <20220716181750.3874838-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220716181750.3874838-1-sam@ravnborg.org>
References: <20220716181750.3874838-1-sam@ravnborg.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"legacy" is a general term - be specific and use the term dri1.
The first step is to rename DRIVER_LEGACY to DRIVER_DRI1.

Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_agpsupport.c    |  4 ++--
 drivers/gpu/drm/drm_bufs.c          | 22 +++++++++++-----------
 drivers/gpu/drm/drm_context.c       | 24 ++++++++++++------------
 drivers/gpu/drm/drm_dma.c           |  4 ++--
 drivers/gpu/drm/drm_drv.c           |  2 +-
 drivers/gpu/drm/drm_file.c          |  8 ++++----
 drivers/gpu/drm/drm_ioctl.c         |  2 +-
 drivers/gpu/drm/drm_irq.c           |  6 +++---
 drivers/gpu/drm/drm_legacy_misc.c   |  2 +-
 drivers/gpu/drm/drm_lock.c          |  6 +++---
 drivers/gpu/drm/drm_pci.c           |  8 ++++----
 drivers/gpu/drm/drm_scatter.c       |  6 +++---
 drivers/gpu/drm/drm_vblank.c        |  4 ++--
 drivers/gpu/drm/i810/i810_drv.c     |  2 +-
 drivers/gpu/drm/mga/mga_drv.c       |  2 +-
 drivers/gpu/drm/r128/r128_drv.c     |  2 +-
 drivers/gpu/drm/savage/savage_drv.c |  2 +-
 drivers/gpu/drm/sis/sis_drv.c       |  2 +-
 drivers/gpu/drm/tdfx/tdfx_drv.c     |  2 +-
 drivers/gpu/drm/via/via_dri1.c      |  2 +-
 include/drm/drm_device.h            |  2 +-
 include/drm/drm_drv.h               |  6 +++---
 22 files changed, 60 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/drm_agpsupport.c b/drivers/gpu/drm/drm_agpsupport.c
index a4ad6fd13abc..b7f6bbe7e340 100644
--- a/drivers/gpu/drm/drm_agpsupport.c
+++ b/drivers/gpu/drm/drm_agpsupport.c
@@ -422,7 +422,7 @@ EXPORT_SYMBOL(drm_legacy_agp_init);
  * intact so it can still be used. It is safe to call this if AGP is disabled or
  * was already removed.
  *
- * Cleanup is only done for drivers who have DRIVER_LEGACY set.
+ * Cleanup is only done for drivers who have DRIVER_DRI1 set.
  */
 void drm_legacy_agp_clear(struct drm_device *dev)
 {
@@ -430,7 +430,7 @@ void drm_legacy_agp_clear(struct drm_device *dev)
 
 	if (!dev->agp)
 		return;
-	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_DRI1))
 		return;
 
 	list_for_each_entry_safe(entry, tempe, &dev->agp->memory, head) {
diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index fcca21e8efac..8cc134d1c26a 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -424,7 +424,7 @@ int drm_legacy_addmap_ioctl(struct drm_device *dev, void *data,
 		return -EPERM;
 
 	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	    !drm_core_check_feature(dev, DRIVER_DRI1))
 		return -EOPNOTSUPP;
 
 	err = drm_addmap_core(dev, map->offset, map->size, map->type,
@@ -470,7 +470,7 @@ int drm_legacy_getmap_ioctl(struct drm_device *dev, void *data,
 	int i;
 
 	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	    !drm_core_check_feature(dev, DRIVER_DRI1))
 		return -EOPNOTSUPP;
 
 	idx = map->offset;
@@ -571,7 +571,7 @@ EXPORT_SYMBOL(drm_legacy_rmmap_locked);
 void drm_legacy_rmmap(struct drm_device *dev, struct drm_local_map *map)
 {
 	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	    !drm_core_check_feature(dev, DRIVER_DRI1))
 		return;
 
 	mutex_lock(&dev->struct_mutex);
@@ -584,7 +584,7 @@ void drm_legacy_master_rmmaps(struct drm_device *dev, struct drm_master *master)
 {
 	struct drm_map_list *r_list, *list_temp;
 
-	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_DRI1))
 		return;
 
 	mutex_lock(&dev->struct_mutex);
@@ -629,7 +629,7 @@ int drm_legacy_rmmap_ioctl(struct drm_device *dev, void *data,
 	int ret;
 
 	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	    !drm_core_check_feature(dev, DRIVER_DRI1))
 		return -EOPNOTSUPP;
 
 	mutex_lock(&dev->struct_mutex);
@@ -1276,7 +1276,7 @@ int drm_legacy_addbufs(struct drm_device *dev, void *data,
 	struct drm_buf_desc *request = data;
 	int ret;
 
-	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_DRI1))
 		return -EOPNOTSUPP;
 
 	if (!drm_core_check_feature(dev, DRIVER_HAVE_DMA))
@@ -1322,7 +1322,7 @@ int __drm_legacy_infobufs(struct drm_device *dev,
 	int i;
 	int count;
 
-	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_DRI1))
 		return -EOPNOTSUPP;
 
 	if (!drm_core_check_feature(dev, DRIVER_HAVE_DMA))
@@ -1412,7 +1412,7 @@ int drm_legacy_markbufs(struct drm_device *dev, void *data,
 	int order;
 	struct drm_buf_entry *entry;
 
-	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_DRI1))
 		return -EOPNOTSUPP;
 
 	if (!drm_core_check_feature(dev, DRIVER_HAVE_DMA))
@@ -1460,7 +1460,7 @@ int drm_legacy_freebufs(struct drm_device *dev, void *data,
 	int idx;
 	struct drm_buf *buf;
 
-	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_DRI1))
 		return -EOPNOTSUPP;
 
 	if (!drm_core_check_feature(dev, DRIVER_HAVE_DMA))
@@ -1516,7 +1516,7 @@ int __drm_legacy_mapbufs(struct drm_device *dev, void *data, int *p,
 	unsigned long virtual;
 	int i;
 
-	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_DRI1))
 		return -EOPNOTSUPP;
 
 	if (!drm_core_check_feature(dev, DRIVER_HAVE_DMA))
@@ -1607,7 +1607,7 @@ int drm_legacy_mapbufs(struct drm_device *dev, void *data,
 int drm_legacy_dma_ioctl(struct drm_device *dev, void *data,
 		  struct drm_file *file_priv)
 {
-	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_DRI1))
 		return -EOPNOTSUPP;
 
 	if (dev->driver->dma_ioctl)
diff --git a/drivers/gpu/drm/drm_context.c b/drivers/gpu/drm/drm_context.c
index c6e6a3e7219a..97564097d130 100644
--- a/drivers/gpu/drm/drm_context.c
+++ b/drivers/gpu/drm/drm_context.c
@@ -60,7 +60,7 @@ struct drm_ctx_list {
 void drm_legacy_ctxbitmap_free(struct drm_device * dev, int ctx_handle)
 {
 	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	    !drm_core_check_feature(dev, DRIVER_DRI1))
 		return;
 
 	mutex_lock(&dev->struct_mutex);
@@ -98,7 +98,7 @@ static int drm_legacy_ctxbitmap_next(struct drm_device * dev)
 void drm_legacy_ctxbitmap_init(struct drm_device * dev)
 {
 	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	    !drm_core_check_feature(dev, DRIVER_DRI1))
 		return;
 
 	idr_init(&dev->ctx_idr);
@@ -115,7 +115,7 @@ void drm_legacy_ctxbitmap_init(struct drm_device * dev)
 void drm_legacy_ctxbitmap_cleanup(struct drm_device * dev)
 {
 	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	    !drm_core_check_feature(dev, DRIVER_DRI1))
 		return;
 
 	mutex_lock(&dev->struct_mutex);
@@ -137,7 +137,7 @@ void drm_legacy_ctxbitmap_flush(struct drm_device *dev, struct drm_file *file)
 	struct drm_ctx_list *pos, *tmp;
 
 	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	    !drm_core_check_feature(dev, DRIVER_DRI1))
 		return;
 
 	mutex_lock(&dev->ctxlist_mutex);
@@ -183,7 +183,7 @@ int drm_legacy_getsareactx(struct drm_device *dev, void *data,
 	struct drm_map_list *_entry;
 
 	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	    !drm_core_check_feature(dev, DRIVER_DRI1))
 		return -EOPNOTSUPP;
 
 	mutex_lock(&dev->struct_mutex);
@@ -231,7 +231,7 @@ int drm_legacy_setsareactx(struct drm_device *dev, void *data,
 	struct drm_map_list *r_list = NULL;
 
 	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	    !drm_core_check_feature(dev, DRIVER_DRI1))
 		return -EOPNOTSUPP;
 
 	mutex_lock(&dev->struct_mutex);
@@ -336,7 +336,7 @@ int drm_legacy_resctx(struct drm_device *dev, void *data,
 	int i;
 
 	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	    !drm_core_check_feature(dev, DRIVER_DRI1))
 		return -EOPNOTSUPP;
 
 	if (res->count >= DRM_RESERVED_CONTEXTS) {
@@ -371,7 +371,7 @@ int drm_legacy_addctx(struct drm_device *dev, void *data,
 	int tmp_handle;
 
 	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	    !drm_core_check_feature(dev, DRIVER_DRI1))
 		return -EOPNOTSUPP;
 
 	tmp_handle = drm_legacy_ctxbitmap_next(dev);
@@ -420,7 +420,7 @@ int drm_legacy_getctx(struct drm_device *dev, void *data,
 	struct drm_ctx *ctx = data;
 
 	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	    !drm_core_check_feature(dev, DRIVER_DRI1))
 		return -EOPNOTSUPP;
 
 	/* This is 0, because we don't handle any context flags */
@@ -446,7 +446,7 @@ int drm_legacy_switchctx(struct drm_device *dev, void *data,
 	struct drm_ctx *ctx = data;
 
 	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	    !drm_core_check_feature(dev, DRIVER_DRI1))
 		return -EOPNOTSUPP;
 
 	DRM_DEBUG("%d\n", ctx->handle);
@@ -470,7 +470,7 @@ int drm_legacy_newctx(struct drm_device *dev, void *data,
 	struct drm_ctx *ctx = data;
 
 	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	    !drm_core_check_feature(dev, DRIVER_DRI1))
 		return -EOPNOTSUPP;
 
 	DRM_DEBUG("%d\n", ctx->handle);
@@ -496,7 +496,7 @@ int drm_legacy_rmctx(struct drm_device *dev, void *data,
 	struct drm_ctx *ctx = data;
 
 	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	    !drm_core_check_feature(dev, DRIVER_DRI1))
 		return -EOPNOTSUPP;
 
 	DRM_DEBUG("%d\n", ctx->handle);
diff --git a/drivers/gpu/drm/drm_dma.c b/drivers/gpu/drm/drm_dma.c
index eb6b741a6f99..c6b80a618e5e 100644
--- a/drivers/gpu/drm/drm_dma.c
+++ b/drivers/gpu/drm/drm_dma.c
@@ -54,7 +54,7 @@ int drm_legacy_dma_setup(struct drm_device *dev)
 	int i;
 
 	if (!drm_core_check_feature(dev, DRIVER_HAVE_DMA) ||
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	    !drm_core_check_feature(dev, DRIVER_DRI1))
 		return 0;
 
 	dev->buf_use = 0;
@@ -85,7 +85,7 @@ void drm_legacy_dma_takedown(struct drm_device *dev)
 	int i, j;
 
 	if (!drm_core_check_feature(dev, DRIVER_HAVE_DMA) ||
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	    !drm_core_check_feature(dev, DRIVER_DRI1))
 		return;
 
 	if (!dma)
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8214a0b1ab7f..45e6a48ac110 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -933,7 +933,7 @@ EXPORT_SYMBOL(drm_dev_register);
  */
 void drm_dev_unregister(struct drm_device *dev)
 {
-	if (drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (drm_core_check_feature(dev, DRIVER_DRI1))
 		drm_lastclose(dev);
 
 	dev->registered = false;
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index ed25168619fc..c6781afe41cf 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -63,7 +63,7 @@ bool drm_dev_needs_global_mutex(struct drm_device *dev)
 	 * bother. They also still need BKL locking for their ioctls, so better
 	 * safe than sorry.
 	 */
-	if (drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (drm_core_check_feature(dev, DRIVER_DRI1))
 		return true;
 
 	/*
@@ -256,12 +256,12 @@ void drm_file_free(struct drm_file *file)
 		  atomic_read(&dev->open_count));
 
 #ifdef CONFIG_DRM_LEGACY
-	if (drm_core_check_feature(dev, DRIVER_LEGACY) &&
+	if (drm_core_check_feature(dev, DRIVER_DRI1) &&
 	    dev->driver->preclose)
 		dev->driver->preclose(dev, file);
 #endif
 
-	if (drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (drm_core_check_feature(dev, DRIVER_DRI1))
 		drm_legacy_lock_release(dev, file->filp);
 
 	if (drm_core_check_feature(dev, DRIVER_HAVE_DMA))
@@ -461,7 +461,7 @@ void drm_lastclose(struct drm_device * dev)
 		dev->driver->lastclose(dev);
 	DRM_DEBUG("driver lastclose completed\n");
 
-	if (drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (drm_core_check_feature(dev, DRIVER_DRI1))
 		drm_legacy_dev_reinit(dev);
 
 	drm_client_dev_restore(dev);
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index ca2a6e6101dc..ab36c689f19f 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -783,7 +783,7 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 		return retcode;
 
 	/* Enforce sane locking for modern driver ioctls. */
-	if (likely(!drm_core_check_feature(dev, DRIVER_LEGACY)) ||
+	if (likely(!drm_core_check_feature(dev, DRIVER_DRI1)) ||
 	    (flags & DRM_UNLOCKED))
 		retcode = func(dev, kdata, file_priv);
 	else {
diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
index d327638e15ee..ac7042db24dc 100644
--- a/drivers/gpu/drm/drm_irq.c
+++ b/drivers/gpu/drm/drm_irq.c
@@ -102,7 +102,7 @@ static int drm_legacy_irq_install(struct drm_device *dev, int irq)
 
 	if (ret < 0) {
 		dev->irq_enabled = false;
-		if (drm_core_check_feature(dev, DRIVER_LEGACY))
+		if (drm_core_check_feature(dev, DRIVER_DRI1))
 			vga_client_unregister(to_pci_dev(dev->dev));
 		free_irq(irq, dev);
 	} else {
@@ -148,7 +148,7 @@ int drm_legacy_irq_uninstall(struct drm_device *dev)
 
 	DRM_DEBUG("irq=%d\n", dev->irq);
 
-	if (drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (drm_core_check_feature(dev, DRIVER_DRI1))
 		vga_client_unregister(to_pci_dev(dev->dev));
 
 	if (dev->driver->irq_uninstall)
@@ -173,7 +173,7 @@ int drm_legacy_irq_control(struct drm_device *dev, void *data,
 
 	if (!drm_core_check_feature(dev, DRIVER_HAVE_IRQ))
 		return 0;
-	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_DRI1))
 		return 0;
 	/* UMS was only ever supported on pci devices. */
 	if (WARN_ON(!dev_is_pci(dev->dev)))
diff --git a/drivers/gpu/drm/drm_legacy_misc.c b/drivers/gpu/drm/drm_legacy_misc.c
index d4c5434062d7..a33e4adf6974 100644
--- a/drivers/gpu/drm/drm_legacy_misc.c
+++ b/drivers/gpu/drm/drm_legacy_misc.c
@@ -59,7 +59,7 @@ int drm_legacy_setup(struct drm_device * dev)
 	int ret;
 
 	if (dev->driver->firstopen &&
-	    drm_core_check_feature(dev, DRIVER_LEGACY)) {
+	    drm_core_check_feature(dev, DRIVER_DRI1)) {
 		ret = dev->driver->firstopen(dev);
 		if (ret != 0)
 			return ret;
diff --git a/drivers/gpu/drm/drm_lock.c b/drivers/gpu/drm/drm_lock.c
index 1efbd5389d89..c2ad6b34f247 100644
--- a/drivers/gpu/drm/drm_lock.c
+++ b/drivers/gpu/drm/drm_lock.c
@@ -169,7 +169,7 @@ int drm_legacy_lock(struct drm_device *dev, void *data,
 	struct drm_master *master = file_priv->master;
 	int ret = 0;
 
-	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_DRI1))
 		return -EOPNOTSUPP;
 
 	++file_priv->lock_count;
@@ -259,7 +259,7 @@ int drm_legacy_unlock(struct drm_device *dev, void *data, struct drm_file *file_
 	struct drm_lock *lock = data;
 	struct drm_master *master = file_priv->master;
 
-	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_DRI1))
 		return -EOPNOTSUPP;
 
 	if (lock->context == DRM_KERNEL_CONTEXT) {
@@ -354,7 +354,7 @@ void drm_legacy_lock_release(struct drm_device *dev, struct file *filp)
 
 void drm_legacy_lock_master_cleanup(struct drm_device *dev, struct drm_master *master)
 {
-	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_DRI1))
 		return;
 
 	/*
diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index 39d35fc3a43b..eb0656db08a2 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -107,7 +107,7 @@ int drm_legacy_irq_by_busid(struct drm_device *dev, void *data,
 {
 	struct drm_irq_busid *p = data;
 
-	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_DRI1))
 		return -EOPNOTSUPP;
 
 	/* UMS was only ever support on PCI devices. */
@@ -171,7 +171,7 @@ static int drm_legacy_get_pci_dev(struct pci_dev *pdev,
 	if (ret)
 		goto err_agp;
 
-	if (drm_core_check_feature(dev, DRIVER_LEGACY)) {
+	if (drm_core_check_feature(dev, DRIVER_DRI1)) {
 		mutex_lock(&legacy_dev_list_lock);
 		list_add_tail(&dev->legacy_dev_list, &legacy_dev_list);
 		mutex_unlock(&legacy_dev_list_lock);
@@ -205,7 +205,7 @@ int drm_legacy_pci_init(const struct drm_driver *driver,
 
 	DRM_DEBUG("\n");
 
-	if (WARN_ON(!(driver->driver_features & DRIVER_LEGACY)))
+	if (WARN_ON(!(driver->driver_features & DRIVER_DRI1)))
 		return -EINVAL;
 
 	/* If not using KMS, fall back to stealth mode manual scanning. */
@@ -249,7 +249,7 @@ void drm_legacy_pci_exit(const struct drm_driver *driver,
 
 	DRM_DEBUG("\n");
 
-	if (!(driver->driver_features & DRIVER_LEGACY)) {
+	if (!(driver->driver_features & DRIVER_DRI1)) {
 		WARN_ON(1);
 	} else {
 		mutex_lock(&legacy_dev_list_lock);
diff --git a/drivers/gpu/drm/drm_scatter.c b/drivers/gpu/drm/drm_scatter.c
index f4e6184d1877..bc213ffb98e7 100644
--- a/drivers/gpu/drm/drm_scatter.c
+++ b/drivers/gpu/drm/drm_scatter.c
@@ -64,7 +64,7 @@ static void drm_sg_cleanup(struct drm_sg_mem * entry)
 void drm_legacy_sg_cleanup(struct drm_device *dev)
 {
 	if (drm_core_check_feature(dev, DRIVER_SG) && dev->sg &&
-	    drm_core_check_feature(dev, DRIVER_LEGACY)) {
+	    drm_core_check_feature(dev, DRIVER_DRI1)) {
 		drm_sg_cleanup(dev->sg);
 		dev->sg = NULL;
 	}
@@ -84,7 +84,7 @@ int drm_legacy_sg_alloc(struct drm_device *dev, void *data,
 
 	DRM_DEBUG("\n");
 
-	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_DRI1))
 		return -EOPNOTSUPP;
 
 	if (!drm_core_check_feature(dev, DRIVER_SG))
@@ -200,7 +200,7 @@ int drm_legacy_sg_free(struct drm_device *dev, void *data,
 	struct drm_scatter_gather *request = data;
 	struct drm_sg_mem *entry;
 
-	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_DRI1))
 		return -EOPNOTSUPP;
 
 	if (!drm_core_check_feature(dev, DRIVER_SG))
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 2ff31717a3de..a03b03edc6d4 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1594,7 +1594,7 @@ int drm_legacy_modeset_ctl_ioctl(struct drm_device *dev, void *data,
 		return 0;
 
 	/* KMS drivers handle this internally */
-	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_DRI1))
 		return 0;
 
 	pipe = modeset->crtc;
@@ -1740,7 +1740,7 @@ static void drm_wait_vblank_reply(struct drm_device *dev, unsigned int pipe,
 static bool drm_wait_vblank_supported(struct drm_device *dev)
 {
 #if IS_ENABLED(CONFIG_DRM_LEGACY)
-	if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
+	if (unlikely(drm_core_check_feature(dev, DRIVER_DRI1)))
 		return dev->irq_enabled;
 #endif
 	return drm_dev_has_vblank(dev);
diff --git a/drivers/gpu/drm/i810/i810_drv.c b/drivers/gpu/drm/i810/i810_drv.c
index 0e53a066d4db..fceb9a38c0ee 100644
--- a/drivers/gpu/drm/i810/i810_drv.c
+++ b/drivers/gpu/drm/i810/i810_drv.c
@@ -57,7 +57,7 @@ static const struct file_operations i810_driver_fops = {
 };
 
 static struct drm_driver driver = {
-	.driver_features = DRIVER_USE_AGP | DRIVER_HAVE_DMA | DRIVER_LEGACY,
+	.driver_features = DRIVER_USE_AGP | DRIVER_HAVE_DMA | DRIVER_DRI1,
 	.dev_priv_size = sizeof(drm_i810_buf_priv_t),
 	.load = i810_driver_load,
 	.lastclose = i810_driver_lastclose,
diff --git a/drivers/gpu/drm/mga/mga_drv.c b/drivers/gpu/drm/mga/mga_drv.c
index 71128e6f6ae9..0fc3f3a2d9d7 100644
--- a/drivers/gpu/drm/mga/mga_drv.c
+++ b/drivers/gpu/drm/mga/mga_drv.c
@@ -55,7 +55,7 @@ static const struct file_operations mga_driver_fops = {
 
 static struct drm_driver driver = {
 	.driver_features =
-	    DRIVER_USE_AGP | DRIVER_PCI_DMA | DRIVER_LEGACY |
+	    DRIVER_USE_AGP | DRIVER_PCI_DMA | DRIVER_DRI1 |
 	    DRIVER_HAVE_DMA | DRIVER_HAVE_IRQ,
 	.dev_priv_size = sizeof(drm_mga_buf_priv_t),
 	.load = mga_driver_load,
diff --git a/drivers/gpu/drm/r128/r128_drv.c b/drivers/gpu/drm/r128/r128_drv.c
index e35a3a1449bd..6f90627be21b 100644
--- a/drivers/gpu/drm/r128/r128_drv.c
+++ b/drivers/gpu/drm/r128/r128_drv.c
@@ -59,7 +59,7 @@ static const struct file_operations r128_driver_fops = {
 
 static struct drm_driver driver = {
 	.driver_features =
-	    DRIVER_USE_AGP | DRIVER_PCI_DMA | DRIVER_SG | DRIVER_LEGACY |
+	    DRIVER_USE_AGP | DRIVER_PCI_DMA | DRIVER_SG | DRIVER_DRI1 |
 	    DRIVER_HAVE_DMA | DRIVER_HAVE_IRQ,
 	.dev_priv_size = sizeof(drm_r128_buf_priv_t),
 	.load = r128_driver_load,
diff --git a/drivers/gpu/drm/savage/savage_drv.c b/drivers/gpu/drm/savage/savage_drv.c
index 799bd11adb9c..66494500d7fd 100644
--- a/drivers/gpu/drm/savage/savage_drv.c
+++ b/drivers/gpu/drm/savage/savage_drv.c
@@ -49,7 +49,7 @@ static const struct file_operations savage_driver_fops = {
 
 static struct drm_driver driver = {
 	.driver_features =
-	    DRIVER_USE_AGP | DRIVER_HAVE_DMA | DRIVER_PCI_DMA | DRIVER_LEGACY,
+	    DRIVER_USE_AGP | DRIVER_HAVE_DMA | DRIVER_PCI_DMA | DRIVER_DRI1,
 	.dev_priv_size = sizeof(drm_savage_buf_priv_t),
 	.load = savage_driver_load,
 	.firstopen = savage_driver_firstopen,
diff --git a/drivers/gpu/drm/sis/sis_drv.c b/drivers/gpu/drm/sis/sis_drv.c
index e35e719cf315..9206ded39462 100644
--- a/drivers/gpu/drm/sis/sis_drv.c
+++ b/drivers/gpu/drm/sis/sis_drv.c
@@ -101,7 +101,7 @@ static void sis_driver_postclose(struct drm_device *dev, struct drm_file *file)
 }
 
 static struct drm_driver driver = {
-	.driver_features = DRIVER_USE_AGP | DRIVER_LEGACY,
+	.driver_features = DRIVER_USE_AGP | DRIVER_DRI1,
 	.load = sis_driver_load,
 	.unload = sis_driver_unload,
 	.open = sis_driver_open,
diff --git a/drivers/gpu/drm/tdfx/tdfx_drv.c b/drivers/gpu/drm/tdfx/tdfx_drv.c
index 58c185c299f4..ec1326973b6c 100644
--- a/drivers/gpu/drm/tdfx/tdfx_drv.c
+++ b/drivers/gpu/drm/tdfx/tdfx_drv.c
@@ -57,7 +57,7 @@ static const struct file_operations tdfx_driver_fops = {
 };
 
 static const struct drm_driver driver = {
-	.driver_features = DRIVER_LEGACY,
+	.driver_features = DRIVER_DRI1,
 	.fops = &tdfx_driver_fops,
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
diff --git a/drivers/gpu/drm/via/via_dri1.c b/drivers/gpu/drm/via/via_dri1.c
index d695d9291ece..c5708a3f4530 100644
--- a/drivers/gpu/drm/via/via_dri1.c
+++ b/drivers/gpu/drm/via/via_dri1.c
@@ -3579,7 +3579,7 @@ static const struct file_operations via_driver_fops = {
 
 static struct drm_driver driver = {
 	.driver_features =
-	    DRIVER_USE_AGP | DRIVER_HAVE_IRQ | DRIVER_LEGACY,
+	    DRIVER_USE_AGP | DRIVER_HAVE_IRQ | DRIVER_DRI1,
 	.load = via_driver_load,
 	.unload = via_driver_unload,
 	.open = via_driver_open,
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 9923c7a6885e..bbf7ff8aa492 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -138,7 +138,7 @@ struct drm_device {
 	 * Lock for others (not &drm_minor.master and &drm_file.is_master)
 	 *
 	 * WARNING:
-	 * Only drivers annotated with DRIVER_LEGACY should be using this.
+	 * Only drivers annotated with DRIVER_DRI1 should be using this.
 	 */
 	struct mutex struct_mutex;
 
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index f6159acb8856..e9725295686b 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -105,11 +105,11 @@ enum drm_driver_feature {
 	 */
 	DRIVER_USE_AGP			= BIT(25),
 	/**
-	 * @DRIVER_LEGACY:
+	 * @DRIVER_DRI1:
 	 *
-	 * Denote a legacy driver using shadow attach. Do not use.
+	 * Denote a DRI1 driver using shadow attach. Do not use.
 	 */
-	DRIVER_LEGACY			= BIT(26),
+	DRIVER_DRI1			= BIT(26),
 	/**
 	 * @DRIVER_PCI_DMA:
 	 *
-- 
2.34.1

