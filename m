Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC5C19D87A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 16:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDA36EC07;
	Fri,  3 Apr 2020 13:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA056EBE3
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:59:26 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id c7so8635788wrx.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dBbU/1DUmgoM/eSyEXqxtgd6PSIU46nzMH7G+4o78Rk=;
 b=EKncV+XCHFFf8DQmkpH3BityYd28F9pNuoqalNY5C0YkGQ7/VGmSoh1DMQPF+7sNot
 FnhUqfAnEfs1Da499YBiixbtuaeJci6oWec2MjPFP3IFM38WHQUDWEWOzz99Msw5TxRv
 oD8BN51suQq+HIYylrWHPYtaLjxD+gxyYR1C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dBbU/1DUmgoM/eSyEXqxtgd6PSIU46nzMH7G+4o78Rk=;
 b=pHGnc7lcOCqOQ2itmWrZXwDP/NvVe+Sy6o3IJjF37WyGJkfBP6TZQNAVQkmlbl/FxH
 2umOPK3IGnRBRzTsfNPOhA5/SoaENQNNVMdPb7PsJKneIwGMidUFD1J6AX3cmA+dFl9a
 aYQ/i+2aA+QigWs4l980EMygtus3geUnloz03nd5UftICUBrnKkn9iQOo4qUWRWNM5kR
 03Qe6T0+xIgvEQv8wJJP16voFTAYuVc6s8/O84tIYmPl9lDi/PV3QIeAZeOYKB0tZiOx
 zzFvfhjhegbEio6/qMo4E16EUrE6KLm+Q96G6b5bVGwGCZtxHZuZ+X0L3wOmWgCttbHh
 ijLA==
X-Gm-Message-State: AGi0PuapGSOYYk+c+J/Y0CEtb3LDQN36DksT3VHII65CK1kdDhu58pVg
 qz5U+DHIq1mEM6nqFaXbJS/aS5HPKw9YCg==
X-Google-Smtp-Source: APiQypILF9QC0H+EFGQbO0BGyFKGRea3UNGoE4JB5AM4A9nYt5nFYqWGmjfO4ezyWq9GJ5fiJYobyQ==
X-Received: by 2002:adf:fcc8:: with SMTP id f8mr9692998wrs.132.1585922364410; 
 Fri, 03 Apr 2020 06:59:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:59:23 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 44/44] drm/managed: Cleanup of unused functions and polishing
 docs
Date: Fri,  3 Apr 2020 15:58:28 +0200
Message-Id: <20200403135828.2542770-45-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following functions are only used internally, not by drivers:
- drm_dev_init
- devm_drm_dev_init
- drmm_add_final_kfree

Also, now that we have a very slick and polished way to allocate a
drm_device with devm_drm_dev_alloc, update all the docs to reflect the
new reality. Mostly this consists of deleting old and misleading
hints. Two main ones:

- it is no longer required that the drm_device base class is first in
  the structure. devm_drm_dev_alloc can cope with it being anywhere

- obviously embedded no needs devm_drm_dev_alloc

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 .../driver-api/driver-model/devres.rst        |   2 +-
 drivers/gpu/drm/drm_drv.c                     | 119 ++++--------------
 drivers/gpu/drm/drm_internal.h                |   1 +
 drivers/gpu/drm/drm_managed.c                 |  15 +--
 include/drm/drm_device.h                      |   2 +-
 include/drm/drm_drv.h                         |  20 +--
 6 files changed, 34 insertions(+), 125 deletions(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 46c13780994c..74a4a3fa8c52 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -263,7 +263,7 @@ DMA
   dmam_pool_destroy()
 
 DRM
-  devm_drm_dev_init()
+  devm_drm_dev_alloc()
 
 GPIO
   devm_gpiod_get()
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 9e60b784b3ac..64e20c630aa7 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -240,13 +240,13 @@ void drm_minor_release(struct drm_minor *minor)
  * DOC: driver instance overview
  *
  * A device instance for a drm driver is represented by &struct drm_device. This
- * is initialized with drm_dev_init(), usually from bus-specific ->probe()
- * callbacks implemented by the driver. The driver then needs to initialize all
- * the various subsystems for the drm device like memory management, vblank
- * handling, modesetting support and intial output configuration plus obviously
- * initialize all the corresponding hardware bits. Finally when everything is up
- * and running and ready for userspace the device instance can be published
- * using drm_dev_register().
+ * is allocated and initialized with devm_drm_dev_alloc(), usually from
+ * bus-specific ->probe() callbacks implemented by the driver. The driver then
+ * needs to initialize all the various subsystems for the drm device like memory
+ * management, vblank handling, modesetting support and intial output
+ * configuration plus obviously initialize all the corresponding hardware bits.
+ * Finally when everything is up and running and ready for userspace the device
+ * instance can be published using drm_dev_register().
  *
  * There is also deprecated support for initalizing device instances using
  * bus-specific helpers and the &drm_driver.load callback. But due to
@@ -274,7 +274,7 @@ void drm_minor_release(struct drm_minor *minor)
  *
  * The following example shows a typical structure of a DRM display driver.
  * The example focus on the probe() function and the other functions that is
- * almost always present and serves as a demonstration of devm_drm_dev_init().
+ * almost always present and serves as a demonstration of devm_drm_dev_alloc().
  *
  * .. code-block:: c
  *
@@ -294,22 +294,12 @@ void drm_minor_release(struct drm_minor *minor)
  *		struct drm_device *drm;
  *		int ret;
  *
- *		// devm_kzalloc() can't be used here because the drm_device '
- *		// lifetime can exceed the device lifetime if driver unbind
- *		// happens when userspace still has open file descriptors.
- *		priv = kzalloc(sizeof(*priv), GFP_KERNEL);
- *		if (!priv)
- *			return -ENOMEM;
- *
+ *		priv = devm_drm_dev_alloc(&pdev->dev, &driver_drm_driver,
+ *					  struct driver_device, drm);
+ *		if (IS_ERR(priv))
+ *			return PTR_ERR(priv);
  *		drm = &priv->drm;
  *
- *		ret = devm_drm_dev_init(&pdev->dev, drm, &driver_drm_driver);
- *		if (ret) {
- *			kfree(priv);
- *			return ret;
- *		}
- *		drmm_add_final_kfree(drm, priv);
- *
  *		ret = drmm_mode_config_init(drm);
  *		if (ret)
  *			return ret;
@@ -550,9 +540,9 @@ static void drm_fs_inode_free(struct inode *inode)
  * following guidelines apply:
  *
  *  - The entire device initialization procedure should be run from the
- *    &component_master_ops.master_bind callback, starting with drm_dev_init(),
- *    then binding all components with component_bind_all() and finishing with
- *    drm_dev_register().
+ *    &component_master_ops.master_bind callback, starting with
+ *    devm_drm_dev_alloc(), then binding all components with
+ *    component_bind_all() and finishing with drm_dev_register().
  *
  *  - The opaque pointer passed to all components through component_bind_all()
  *    should point at &struct drm_device of the device instance, not some driver
@@ -583,43 +573,9 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
 	drm_legacy_destroy_members(dev);
 }
 
-/**
- * drm_dev_init - Initialise new DRM device
- * @dev: DRM device
- * @driver: DRM driver
- * @parent: Parent device object
- *
- * Initialize a new DRM device. No device registration is done.
- * Call drm_dev_register() to advertice the device to user space and register it
- * with other core subsystems. This should be done last in the device
- * initialization sequence to make sure userspace can't access an inconsistent
- * state.
- *
- * The initial ref-count of the object is 1. Use drm_dev_get() and
- * drm_dev_put() to take and drop further ref-counts.
- *
- * It is recommended that drivers embed &struct drm_device into their own device
- * structure.
- *
- * Drivers that do not want to allocate their own device struct
- * embedding &struct drm_device can call drm_dev_alloc() instead. For drivers
- * that do embed &struct drm_device it must be placed first in the overall
- * structure, and the overall structure must be allocated using kmalloc(): The
- * drm core's release function unconditionally calls kfree() on the @dev pointer
- * when the final reference is released. To override this behaviour, and so
- * allow embedding of the drm_device inside the driver's device struct at an
- * arbitrary offset, you must supply a &drm_driver.release callback and control
- * the finalization explicitly.
- *
- * Note that drivers must call drmm_add_final_kfree() after this function has
- * completed successfully.
- *
- * RETURNS:
- * 0 on success, or error code on failure.
- */
-int drm_dev_init(struct drm_device *dev,
-		 struct drm_driver *driver,
-		 struct device *parent)
+static int drm_dev_init(struct drm_device *dev,
+			struct drm_driver *driver,
+			struct device *parent)
 {
 	int ret;
 
@@ -699,31 +655,15 @@ int drm_dev_init(struct drm_device *dev,
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_dev_init);
 
 static void devm_drm_dev_init_release(void *data)
 {
 	drm_dev_put(data);
 }
 
-/**
- * devm_drm_dev_init - Resource managed drm_dev_init()
- * @parent: Parent device object
- * @dev: DRM device
- * @driver: DRM driver
- *
- * Managed drm_dev_init(). The DRM device initialized with this function is
- * automatically put on driver detach using drm_dev_put().
- *
- * Note that drivers must call drmm_add_final_kfree() after this function has
- * completed successfully.
- *
- * RETURNS:
- * 0 on success, or error code on failure.
- */
-int devm_drm_dev_init(struct device *parent,
-		      struct drm_device *dev,
-		      struct drm_driver *driver)
+static int devm_drm_dev_init(struct device *parent,
+			     struct drm_device *dev,
+			     struct drm_driver *driver)
 {
 	int ret;
 
@@ -737,7 +677,6 @@ int devm_drm_dev_init(struct device *parent,
 
 	return ret;
 }
-EXPORT_SYMBOL(devm_drm_dev_init);
 
 void* __devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
 			   size_t size, size_t offset)
@@ -767,19 +706,9 @@ EXPORT_SYMBOL(__devm_drm_dev_alloc);
  * @driver: DRM driver to allocate device for
  * @parent: Parent device object
  *
- * Allocate and initialize a new DRM device. No device registration is done.
- * Call drm_dev_register() to advertice the device to user space and register it
- * with other core subsystems. This should be done last in the device
- * initialization sequence to make sure userspace can't access an inconsistent
- * state.
- *
- * The initial ref-count of the object is 1. Use drm_dev_get() and
- * drm_dev_put() to take and drop further ref-counts.
- *
- * Note that for purely virtual devices @parent can be NULL.
- *
- * Drivers that wish to subclass or embed &struct drm_device into their
- * own struct should look at using drm_dev_init() instead.
+ * This is the deprecated version of devm_drm_dev_alloc(), which doesn not support
+ * subclassing through embedding the struct &drm_device in a driver private
+ * structure, and which does not support automatic cleanup through devres.
  *
  * RETURNS:
  * Pointer to new DRM device, or ERR_PTR on failure.
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 2470a352730b..79f11d3c525e 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -91,6 +91,7 @@ void drm_minor_release(struct drm_minor *minor);
 
 /* drm_managed.c */
 void drm_managed_release(struct drm_device *dev);
+void drmm_add_final_kfree(struct drm_device *dev, void *container);
 
 /* drm_vblank.c */
 void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe);
diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index 9cebfe370a65..a2a0c5b7ab78 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -25,7 +25,7 @@
  * be done directly with drmm_kmalloc() and the related functions. Everything
  * will be released on the final drm_dev_put() in reverse order of how the
  * release actions have been added and memory has been allocated since driver
- * loading started with drm_dev_init().
+ * loading started with devm_drm_dev_alloc().
  *
  * Note that release actions and managed memory can also be added and removed
  * during the lifetime of the driver, all the functions are fully concurrent
@@ -123,18 +123,6 @@ static void add_dr(struct drm_device *dev, struct drmres *dr)
 		       dr, dr->node.name, (unsigned long) dr->node.size);
 }
 
-/**
- * drmm_add_final_kfree - add release action for the final kfree()
- * @dev: DRM device
- * @container: pointer to the kmalloc allocation containing @dev
- *
- * Since the allocation containing the struct &drm_device must be allocated
- * before it can be initialized with drm_dev_init() there's no way to allocate
- * that memory with drmm_kmalloc(). To side-step this chicken-egg problem the
- * pointer for this final kfree() must be specified by calling this function. It
- * will be released in the final drm_dev_put() for @dev, after all other release
- * actions installed through drmm_add_action() have been processed.
- */
 void drmm_add_final_kfree(struct drm_device *dev, void *container)
 {
 	WARN_ON(dev->managed.final_kfree);
@@ -142,7 +130,6 @@ void drmm_add_final_kfree(struct drm_device *dev, void *container)
 	WARN_ON(dev + 1 > (struct drm_device *) (container + ksize(container)));
 	dev->managed.final_kfree = container;
 }
-EXPORT_SYMBOL(drmm_add_final_kfree);
 
 int __drmm_add_action(struct drm_device *dev,
 		      drmres_release_t action,
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index a55874db9dd4..ee9e20ce9b85 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -92,7 +92,7 @@ struct drm_device {
 	 * NULL.
 	 *
 	 * Instead of using this pointer it is recommended that drivers use
-	 * drm_dev_init() and embed struct &drm_device in their larger
+	 * devm_drm_dev_alloc() and embed struct &drm_device in their larger
 	 * per-device structure.
 	 */
 	void *dev_private;
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 26776be5a21e..2806cc5eae3a 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -163,13 +163,12 @@ struct drm_driver {
 	/**
 	 * @load:
 	 *
-	 * Backward-compatible driver callback to complete
-	 * initialization steps after the driver is registered.  For
-	 * this reason, may suffer from race conditions and its use is
-	 * deprecated for new drivers.  It is therefore only supported
-	 * for existing drivers not yet converted to the new scheme.
-	 * See drm_dev_init() and drm_dev_register() for proper and
-	 * race-free way to set up a &struct drm_device.
+	 * Backward-compatible driver callback to complete initialization steps
+	 * after the driver is registered.  For this reason, may suffer from
+	 * race conditions and its use is deprecated for new drivers.  It is
+	 * therefore only supported for existing drivers not yet converted to
+	 * the new scheme.  See devm_drm_dev_alloc() and drm_dev_register() for
+	 * proper and race-free way to set up a &struct drm_device.
 	 *
 	 * This is deprecated, do not use!
 	 *
@@ -619,13 +618,6 @@ struct drm_driver {
 	int dev_priv_size;
 };
 
-int drm_dev_init(struct drm_device *dev,
-		 struct drm_driver *driver,
-		 struct device *parent);
-int devm_drm_dev_init(struct device *parent,
-		      struct drm_device *dev,
-		      struct drm_driver *driver);
-
 void* __devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
 			   size_t size, size_t offset);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
