Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E7699A216
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 12:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B8710EAB9;
	Fri, 11 Oct 2024 10:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="i/DZoci1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6EB810EAB9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 10:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728644153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ANqILxotiED1/GGZoUPDmxT06E87jltrqS2Ragcq/a0=;
 b=i/DZoci1oGLmPdJZAaBvU2sArv1BEWMA2J+5xCFmF24pt088SFSUi1iM9ngz3AVOwtpPsc
 X3vsT1+1sMQs9bAQBWLhPY885KaGvaFNJV49KtS2jwqtuQKThH2gATfn/0XnVKi5dG5226
 XVQQgtxfJYFd6n3nox+sszCmIvX/V8s=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-590-OWiDEwc6OXmqMuwdcV9g8g-1; Fri,
 11 Oct 2024 06:55:48 -0400
X-MC-Unique: OWiDEwc6OXmqMuwdcV9g8g-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6D5191944F00; Fri, 11 Oct 2024 10:55:45 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.224])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4905919560AA; Fri, 11 Oct 2024 10:55:40 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/7] [NOT FOR REVIEW] drm/client,
 squash of drm client pending series
Date: Fri, 11 Oct 2024 12:49:58 +0200
Message-ID: <20241011105526.615812-2-jfalempe@redhat.com>
In-Reply-To: <20241011105526.615812-1-jfalempe@redhat.com>
References: <20241011105526.615812-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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

From: Thomas Zimmermann <tzimmermann@suse.de>

squashed patch of v3 of drm: Introduce DRM client library
https://patchwork.freedesktop.org/series/139219/
---
 Documentation/gpu/drm-client.rst              |   3 +
 drivers/gpu/drm/Kconfig                       |  41 +++-
 drivers/gpu/drm/Makefile                      |  20 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  22 +-
 drivers/gpu/drm/drm_client.c                  | 121 -----------
 drivers/gpu/drm/drm_client_event.c            | 197 ++++++++++++++++++
 drivers/gpu/drm/drm_client_setup.c            |   3 +
 drivers/gpu/drm/drm_debugfs.c                 |   1 -
 drivers/gpu/drm/drm_drv.c                     |   2 +-
 drivers/gpu/drm/drm_fb_helper.c               |  31 ---
 drivers/gpu/drm/drm_fbdev_client.c            |  30 ++-
 drivers/gpu/drm/drm_file.c                    |   2 +-
 drivers/gpu/drm/drm_internal.h                |  15 ++
 drivers/gpu/drm/drm_kms_helper_common.c       |  38 ++++
 drivers/gpu/drm/drm_modeset_helper.c          |  14 +-
 drivers/gpu/drm/drm_probe_helper.c            |   2 +-
 drivers/gpu/drm/i915/Kconfig                  |   1 +
 .../drm/i915/display/intel_display_driver.c   |   2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c     |   8 +-
 drivers/gpu/drm/nouveau/nouveau_vga.c         |   2 +-
 drivers/gpu/drm/radeon/radeon_device.c        |  19 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c         |   6 -
 drivers/gpu/drm/radeon/radeon_mode.h          |   3 -
 drivers/gpu/drm/xe/Kconfig                    |   1 +
 include/drm/drm_client.h                      |  41 +++-
 include/drm/drm_client_event.h                |  27 +++
 27 files changed, 434 insertions(+), 219 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_client_event.c
 create mode 100644 include/drm/drm_client_event.h

diff --git a/Documentation/gpu/drm-client.rst b/Documentation/gpu/drm-client.rst
index 58b5a1d1219d..cbcfe30de777 100644
--- a/Documentation/gpu/drm-client.rst
+++ b/Documentation/gpu/drm-client.rst
@@ -13,3 +13,6 @@ Kernel clients
 
 .. kernel-doc:: drivers/gpu/drm/drm_client_modeset.c
    :export:
+
+.. kernel-doc:: drivers/gpu/drm/drm_client_event.c
+   :export:
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 1df4e627e3d3..a9055c0b9a1a 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -9,9 +9,6 @@ menuconfig DRM
 	tristate "Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)"
 	depends on (AGP || AGP=n) && !EMULATED_CMPXCHG && HAS_DMA
 	select DRM_PANEL_ORIENTATION_QUIRKS
-	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
-	select FB_CORE if DRM_FBDEV_EMULATION
-	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	select HDMI
 	select I2C
 	select DMA_SHARED_BUFFER
@@ -210,10 +207,28 @@ config DRM_DEBUG_MODESET_LOCK
 
 	  If in doubt, say "N".
 
-config DRM_CLIENT_SELECTION
+config DRM_CLIENT
 	bool
 	depends on DRM
-	select DRM_CLIENT_SETUP if DRM_FBDEV_EMULATION
+	help
+	  Enables support for DRM clients. DRM drivers that need
+	  struct drm_client_dev and its interfaces should select this
+	  option. Drivers that support the default clients should
+	  select DRM_CLIENT_SELECTION instead.
+
+config DRM_CLIENT_LIB
+	tristate
+	depends on DRM
+	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
+	select FB_CORE if DRM_FBDEV_EMULATION
+	help
+	  This option enables the DRM client library and selects all
+	  modules and components according to the enabled clients.
+
+config DRM_CLIENT_SELECTION
+	tristate
+	depends on DRM
+	select DRM_CLIENT_LIB if DRM_FBDEV_EMULATION
 	help
 	  Drivers that support in-kernel DRM clients have to select this
 	  option.
@@ -221,10 +236,18 @@ config DRM_CLIENT_SELECTION
 config DRM_CLIENT_SETUP
 	bool
 	depends on DRM_CLIENT_SELECTION
+	help
+	  Enables the DRM client selection. DRM drivers that support the
+	  default clients should select DRM_CLIENT_SELECTION instead.
+
+menu "Supported DRM clients"
+	depends on DRM_CLIENT_SELECTION
 
 config DRM_FBDEV_EMULATION
 	bool "Enable legacy fbdev support for your modesetting driver"
-	depends on DRM
+	depends on DRM_CLIENT_SELECTION
+	select DRM_CLIENT
+	select DRM_CLIENT_SETUP
 	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
 	default FB
 	help
@@ -263,6 +286,8 @@ config DRM_FBDEV_LEAK_PHYS_SMEM
 	  If in doubt, say "N" or spread the word to your closed source
 	  library vendor.
 
+endmenu
+
 config DRM_LOAD_EDID_FIRMWARE
 	bool "Allow to specify an EDID data set instead of probing for it"
 	depends on DRM
@@ -332,19 +357,21 @@ config DRM_TTM_HELPER
 	tristate
 	depends on DRM
 	select DRM_TTM
+	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	help
 	  Helpers for ttm-based gem objects
 
 config DRM_GEM_DMA_HELPER
 	tristate
 	depends on DRM
-	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
+	select FB_DMAMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	help
 	  Choose this if you need the GEM DMA helper functions
 
 config DRM_GEM_SHMEM_HELPER
 	tristate
 	depends on DRM && MMU
+	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	help
 	  Choose this if you need the GEM shmem helper functions
 
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 3894f43f6d47..edfd2ebaf153 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -41,8 +41,6 @@ drm-y := \
 	drm_blend.o \
 	drm_bridge.o \
 	drm_cache.o \
-	drm_client.o \
-	drm_client_modeset.o \
 	drm_color_mgmt.o \
 	drm_connector.o \
 	drm_crtc.o \
@@ -76,6 +74,10 @@ drm-y := \
 	drm_vblank_work.o \
 	drm_vma_manager.o \
 	drm_writeback.o
+drm-$(CONFIG_DRM_CLIENT) += \
+	drm_client.o \
+	drm_client_event.o \
+	drm_client_modeset.o
 drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
 drm-$(CONFIG_COMPAT) += drm_ioc32.o
 drm-$(CONFIG_DRM_PANEL) += drm_panel.o
@@ -143,13 +145,19 @@ drm_kms_helper-y := \
 	drm_probe_helper.o \
 	drm_self_refresh_helper.o \
 	drm_simple_kms_helper.o
-drm_kms_helper-$(CONFIG_DRM_CLIENT_SETUP) += \
-	drm_client_setup.o
 drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
-drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += \
+obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
+
+#
+# DRM clients
+#
+
+drm_client_lib-y := \
+	drm_client_setup.o
+drm_client_lib-$(CONFIG_DRM_FBDEV_EMULATION) += \
 	drm_fbdev_client.o \
 	drm_fb_helper.o
-obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
+obj-$(CONFIG_DRM_CLIENT_LIB) += drm_client_lib.o
 
 #
 # Drivers and the rest
diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index 680a94c361ba..41fa3377d9cf 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -5,6 +5,7 @@ config DRM_AMDGPU
 	depends on DRM && PCI && MMU
 	depends on !UML
 	select FW_LOADER
+	select DRM_CLIENT
 	select DRM_CLIENT_SELECTION
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_DSC_HELPER
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index fd853dc843e9..9c40d620a658 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -37,8 +37,8 @@
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_event.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/amdgpu_drm.h>
 #include <linux/device.h>
@@ -4711,13 +4711,13 @@ int amdgpu_device_prepare(struct drm_device *dev)
  * amdgpu_device_suspend - initiate device suspend
  *
  * @dev: drm dev pointer
- * @fbcon : notify the fbdev of suspend
+ * @notify_clients: notify in-kernel DRM clients
  *
  * Puts the hw in the suspend state (all asics).
  * Returns 0 for success or an error on failure.
  * Called at driver suspend.
  */
-int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
+int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
 {
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	int r = 0;
@@ -4737,8 +4737,8 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
 	if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D3))
 		DRM_WARN("smart shift update failed\n");
 
-	if (fbcon)
-		drm_fb_helper_set_suspend_unlocked(adev_to_drm(adev)->fb_helper, true);
+	if (notify_clients)
+		drm_client_dev_suspend(adev_to_drm(adev), false);
 
 	cancel_delayed_work_sync(&adev->delayed_init_work);
 
@@ -4773,13 +4773,13 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
  * amdgpu_device_resume - initiate device resume
  *
  * @dev: drm dev pointer
- * @fbcon : notify the fbdev of resume
+ * @notify_clients: notify in-kernel DRM clients
  *
  * Bring the hw back to operating state (all asics).
  * Returns 0 for success or an error on failure.
  * Called at driver resume.
  */
-int amdgpu_device_resume(struct drm_device *dev, bool fbcon)
+int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
 {
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	int r = 0;
@@ -4835,8 +4835,8 @@ int amdgpu_device_resume(struct drm_device *dev, bool fbcon)
 	/* Make sure IB tests flushed */
 	flush_delayed_work(&adev->delayed_init_work);
 
-	if (fbcon)
-		drm_fb_helper_set_suspend_unlocked(adev_to_drm(adev)->fb_helper, false);
+	if (notify_clients)
+		drm_client_dev_resume(adev_to_drm(adev), false);
 
 	amdgpu_ras_resume(adev);
 
@@ -5448,7 +5448,7 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
 				if (r)
 					goto out;
 
-				drm_fb_helper_set_suspend_unlocked(adev_to_drm(tmp_adev)->fb_helper, false);
+				drm_client_dev_resume(adev_to_drm(tmp_adev), false);
 
 				/*
 				 * The GPU enters bad state once faulty pages
@@ -5734,7 +5734,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		 */
 		amdgpu_unregister_gpu_instance(tmp_adev);
 
-		drm_fb_helper_set_suspend_unlocked(adev_to_drm(tmp_adev)->fb_helper, true);
+		drm_client_dev_suspend(adev_to_drm(tmp_adev), false);
 
 		/* disable ras on ALL IPs */
 		if (!need_emergency_restart &&
diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index bfedcbf516db..549b28a5918c 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -10,7 +10,6 @@
 #include <linux/slab.h>
 
 #include <drm/drm_client.h>
-#include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
@@ -172,99 +171,6 @@ void drm_client_release(struct drm_client_dev *client)
 }
 EXPORT_SYMBOL(drm_client_release);
 
-/**
- * drm_client_dev_unregister - Unregister clients
- * @dev: DRM device
- *
- * This function releases all clients by calling each client's
- * &drm_client_funcs.unregister callback. The callback function
- * is responsibe for releaseing all resources including the client
- * itself.
- *
- * The helper drm_dev_unregister() calls this function. Drivers
- * that use it don't need to call this function themselves.
- */
-void drm_client_dev_unregister(struct drm_device *dev)
-{
-	struct drm_client_dev *client, *tmp;
-
-	if (!drm_core_check_feature(dev, DRIVER_MODESET))
-		return;
-
-	mutex_lock(&dev->clientlist_mutex);
-	list_for_each_entry_safe(client, tmp, &dev->clientlist, list) {
-		list_del(&client->list);
-		if (client->funcs && client->funcs->unregister) {
-			client->funcs->unregister(client);
-		} else {
-			drm_client_release(client);
-			kfree(client);
-		}
-	}
-	mutex_unlock(&dev->clientlist_mutex);
-}
-EXPORT_SYMBOL(drm_client_dev_unregister);
-
-/**
- * drm_client_dev_hotplug - Send hotplug event to clients
- * @dev: DRM device
- *
- * This function calls the &drm_client_funcs.hotplug callback on the attached clients.
- *
- * drm_kms_helper_hotplug_event() calls this function, so drivers that use it
- * don't need to call this function themselves.
- */
-void drm_client_dev_hotplug(struct drm_device *dev)
-{
-	struct drm_client_dev *client;
-	int ret;
-
-	if (!drm_core_check_feature(dev, DRIVER_MODESET))
-		return;
-
-	if (!dev->mode_config.num_connector) {
-		drm_dbg_kms(dev, "No connectors found, will not send hotplug events!\n");
-		return;
-	}
-
-	mutex_lock(&dev->clientlist_mutex);
-	list_for_each_entry(client, &dev->clientlist, list) {
-		if (!client->funcs || !client->funcs->hotplug)
-			continue;
-
-		if (client->hotplug_failed)
-			continue;
-
-		ret = client->funcs->hotplug(client);
-		drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
-		if (ret)
-			client->hotplug_failed = true;
-	}
-	mutex_unlock(&dev->clientlist_mutex);
-}
-EXPORT_SYMBOL(drm_client_dev_hotplug);
-
-void drm_client_dev_restore(struct drm_device *dev)
-{
-	struct drm_client_dev *client;
-	int ret;
-
-	if (!drm_core_check_feature(dev, DRIVER_MODESET))
-		return;
-
-	mutex_lock(&dev->clientlist_mutex);
-	list_for_each_entry(client, &dev->clientlist, list) {
-		if (!client->funcs || !client->funcs->restore)
-			continue;
-
-		ret = client->funcs->restore(client);
-		drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
-		if (!ret) /* The first one to return zero gets the privilege to restore */
-			break;
-	}
-	mutex_unlock(&dev->clientlist_mutex);
-}
-
 static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
 {
 	if (buffer->gem) {
@@ -584,30 +490,3 @@ int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_re
 					0, 0, NULL, 0);
 }
 EXPORT_SYMBOL(drm_client_framebuffer_flush);
-
-#ifdef CONFIG_DEBUG_FS
-static int drm_client_debugfs_internal_clients(struct seq_file *m, void *data)
-{
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
-	struct drm_printer p = drm_seq_file_printer(m);
-	struct drm_client_dev *client;
-
-	mutex_lock(&dev->clientlist_mutex);
-	list_for_each_entry(client, &dev->clientlist, list)
-		drm_printf(&p, "%s\n", client->name);
-	mutex_unlock(&dev->clientlist_mutex);
-
-	return 0;
-}
-
-static const struct drm_debugfs_info drm_client_debugfs_list[] = {
-	{ "internal_clients", drm_client_debugfs_internal_clients, 0 },
-};
-
-void drm_client_debugfs_init(struct drm_device *dev)
-{
-	drm_debugfs_add_files(dev, drm_client_debugfs_list,
-			      ARRAY_SIZE(drm_client_debugfs_list));
-}
-#endif
diff --git a/drivers/gpu/drm/drm_client_event.c b/drivers/gpu/drm/drm_client_event.c
new file mode 100644
index 000000000000..e303de564485
--- /dev/null
+++ b/drivers/gpu/drm/drm_client_event.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/*
+ * Copyright 2018 Noralf Trønnes
+ */
+
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/seq_file.h>
+
+#include <drm/drm_client.h>
+#include <drm/drm_client_event.h>
+#include <drm/drm_debugfs.h>
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_print.h>
+
+#include "drm_internal.h"
+
+/**
+ * drm_client_dev_unregister - Unregister clients
+ * @dev: DRM device
+ *
+ * This function releases all clients by calling each client's
+ * &drm_client_funcs.unregister callback. The callback function
+ * is responsibe for releaseing all resources including the client
+ * itself.
+ *
+ * The helper drm_dev_unregister() calls this function. Drivers
+ * that use it don't need to call this function themselves.
+ */
+void drm_client_dev_unregister(struct drm_device *dev)
+{
+	struct drm_client_dev *client, *tmp;
+
+	if (!drm_core_check_feature(dev, DRIVER_MODESET))
+		return;
+
+	mutex_lock(&dev->clientlist_mutex);
+	list_for_each_entry_safe(client, tmp, &dev->clientlist, list) {
+		list_del(&client->list);
+		if (client->funcs && client->funcs->unregister) {
+			client->funcs->unregister(client);
+		} else {
+			drm_client_release(client);
+			kfree(client);
+		}
+	}
+	mutex_unlock(&dev->clientlist_mutex);
+}
+EXPORT_SYMBOL(drm_client_dev_unregister);
+
+/**
+ * drm_client_dev_hotplug - Send hotplug event to clients
+ * @dev: DRM device
+ *
+ * This function calls the &drm_client_funcs.hotplug callback on the attached clients.
+ *
+ * drm_kms_helper_hotplug_event() calls this function, so drivers that use it
+ * don't need to call this function themselves.
+ */
+void drm_client_dev_hotplug(struct drm_device *dev)
+{
+	struct drm_client_dev *client;
+	int ret;
+
+	if (!drm_core_check_feature(dev, DRIVER_MODESET))
+		return;
+
+	if (!dev->mode_config.num_connector) {
+		drm_dbg_kms(dev, "No connectors found, will not send hotplug events!\n");
+		return;
+	}
+
+	mutex_lock(&dev->clientlist_mutex);
+	list_for_each_entry(client, &dev->clientlist, list) {
+		if (!client->funcs || !client->funcs->hotplug)
+			continue;
+
+		if (client->hotplug_failed)
+			continue;
+
+		ret = client->funcs->hotplug(client);
+		drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
+		if (ret)
+			client->hotplug_failed = true;
+	}
+	mutex_unlock(&dev->clientlist_mutex);
+}
+EXPORT_SYMBOL(drm_client_dev_hotplug);
+
+void drm_client_dev_restore(struct drm_device *dev)
+{
+	struct drm_client_dev *client;
+	int ret;
+
+	if (!drm_core_check_feature(dev, DRIVER_MODESET))
+		return;
+
+	mutex_lock(&dev->clientlist_mutex);
+	list_for_each_entry(client, &dev->clientlist, list) {
+		if (!client->funcs || !client->funcs->restore)
+			continue;
+
+		ret = client->funcs->restore(client);
+		drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
+		if (!ret) /* The first one to return zero gets the privilege to restore */
+			break;
+	}
+	mutex_unlock(&dev->clientlist_mutex);
+}
+
+static int drm_client_suspend(struct drm_client_dev *client, bool holds_console_lock)
+{
+	struct drm_device *dev = client->dev;
+	int ret = 0;
+
+	if (drm_WARN_ON_ONCE(dev, client->suspended))
+		return 0;
+
+	if (client->funcs && client->funcs->suspend)
+		ret = client->funcs->suspend(client, holds_console_lock);
+	drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
+
+	client->suspended = true;
+
+	return ret;
+}
+
+void drm_client_dev_suspend(struct drm_device *dev, bool holds_console_lock)
+{
+	struct drm_client_dev *client;
+
+	mutex_lock(&dev->clientlist_mutex);
+	list_for_each_entry(client, &dev->clientlist, list) {
+		if (!client->suspended)
+			drm_client_suspend(client, holds_console_lock);
+	}
+	mutex_unlock(&dev->clientlist_mutex);
+}
+EXPORT_SYMBOL(drm_client_dev_suspend);
+
+static int drm_client_resume(struct drm_client_dev *client, bool holds_console_lock)
+{
+	struct drm_device *dev = client->dev;
+	int ret = 0;
+
+	if (drm_WARN_ON_ONCE(dev, !client->suspended))
+		return 0;
+
+	if (client->funcs && client->funcs->resume)
+		ret = client->funcs->resume(client, holds_console_lock);
+	drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
+
+	client->suspended = false;
+
+	return ret;
+}
+
+void drm_client_dev_resume(struct drm_device *dev, bool holds_console_lock)
+{
+	struct drm_client_dev *client;
+
+	mutex_lock(&dev->clientlist_mutex);
+	list_for_each_entry(client, &dev->clientlist, list) {
+		if  (client->suspended)
+			drm_client_resume(client, holds_console_lock);
+	}
+	mutex_unlock(&dev->clientlist_mutex);
+}
+EXPORT_SYMBOL(drm_client_dev_resume);
+
+#ifdef CONFIG_DEBUG_FS
+static int drm_client_debugfs_internal_clients(struct seq_file *m, void *data)
+{
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct drm_client_dev *client;
+
+	mutex_lock(&dev->clientlist_mutex);
+	list_for_each_entry(client, &dev->clientlist, list)
+		drm_printf(&p, "%s\n", client->name);
+	mutex_unlock(&dev->clientlist_mutex);
+
+	return 0;
+}
+
+static const struct drm_debugfs_info drm_client_debugfs_list[] = {
+	{ "internal_clients", drm_client_debugfs_internal_clients, 0 },
+};
+
+void drm_client_debugfs_init(struct drm_device *dev)
+{
+	drm_debugfs_add_files(dev, drm_client_debugfs_list,
+			      ARRAY_SIZE(drm_client_debugfs_list));
+}
+#endif
diff --git a/drivers/gpu/drm/drm_client_setup.c b/drivers/gpu/drm/drm_client_setup.c
index 5969c4ffe31b..c14221ca5a0d 100644
--- a/drivers/gpu/drm/drm_client_setup.c
+++ b/drivers/gpu/drm/drm_client_setup.c
@@ -64,3 +64,6 @@ void drm_client_setup_with_color_mode(struct drm_device *dev, unsigned int color
 	drm_client_setup_with_fourcc(dev, fourcc);
 }
 EXPORT_SYMBOL(drm_client_setup_with_color_mode);
+
+MODULE_DESCRIPTION("In-kernel DRM clients");
+MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 5c99322a4c6f..d9c1be6457e9 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -32,7 +32,6 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_auth.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_client.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index ac30b0ec9d93..c2c172eb25df 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -38,7 +38,7 @@
 
 #include <drm/drm_accel.h>
 #include <drm/drm_cache.h>
-#include <drm/drm_client.h>
+#include <drm/drm_client_event.h>
 #include <drm/drm_color_mgmt.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d5e8994345bb..004f7c437897 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -46,37 +46,6 @@
 #include "drm_internal.h"
 #include "drm_crtc_internal.h"
 
-static bool drm_fbdev_emulation = true;
-module_param_named(fbdev_emulation, drm_fbdev_emulation, bool, 0600);
-MODULE_PARM_DESC(fbdev_emulation,
-		 "Enable legacy fbdev emulation [default=true]");
-
-static int drm_fbdev_overalloc = CONFIG_DRM_FBDEV_OVERALLOC;
-module_param(drm_fbdev_overalloc, int, 0444);
-MODULE_PARM_DESC(drm_fbdev_overalloc,
-		 "Overallocation of the fbdev buffer (%) [default="
-		 __MODULE_STRING(CONFIG_DRM_FBDEV_OVERALLOC) "]");
-
-/*
- * In order to keep user-space compatibility, we want in certain use-cases
- * to keep leaking the fbdev physical address to the user-space program
- * handling the fbdev buffer.
- *
- * This is a bad habit, essentially kept to support closed-source OpenGL
- * drivers that should really be moved into open-source upstream projects
- * instead of using legacy physical addresses in user space to communicate
- * with other out-of-tree kernel modules.
- *
- * This module_param *should* be removed as soon as possible and be
- * considered as a broken and legacy behaviour from a modern fbdev device.
- */
-static bool drm_leak_fbdev_smem;
-#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
-module_param_unsafe(drm_leak_fbdev_smem, bool, 0600);
-MODULE_PARM_DESC(drm_leak_fbdev_smem,
-		 "Allow unsafe leaking fbdev physical smem address [default=false]");
-#endif
-
 static LIST_HEAD(kernel_fb_helper_list);
 static DEFINE_MUTEX(kernel_fb_helper_lock);
 
diff --git a/drivers/gpu/drm/drm_fbdev_client.c b/drivers/gpu/drm/drm_fbdev_client.c
index a09382afe2fb..246fb63ab250 100644
--- a/drivers/gpu/drm/drm_fbdev_client.c
+++ b/drivers/gpu/drm/drm_fbdev_client.c
@@ -61,11 +61,37 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
 	return ret;
 }
 
+static int drm_fbdev_client_suspend(struct drm_client_dev *client, bool holds_console_lock)
+{
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+
+	if (holds_console_lock)
+		drm_fb_helper_set_suspend(fb_helper, true);
+	else
+		drm_fb_helper_set_suspend_unlocked(fb_helper, true);
+
+	return 0;
+}
+
+static int drm_fbdev_client_resume(struct drm_client_dev *client, bool holds_console_lock)
+{
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+
+	if (holds_console_lock)
+		drm_fb_helper_set_suspend(fb_helper, false);
+	else
+		drm_fb_helper_set_suspend_unlocked(fb_helper, false);
+
+	return 0;
+}
+
 static const struct drm_client_funcs drm_fbdev_client_funcs = {
 	.owner		= THIS_MODULE,
 	.unregister	= drm_fbdev_client_unregister,
 	.restore	= drm_fbdev_client_restore,
 	.hotplug	= drm_fbdev_client_hotplug,
+	.suspend	= drm_fbdev_client_suspend,
+	.resume		= drm_fbdev_client_resume,
 };
 
 /**
@@ -76,8 +102,8 @@ static const struct drm_client_funcs drm_fbdev_client_funcs = {
  *
  * This function sets up fbdev emulation. Restore, hotplug events and
  * teardown are all taken care of. Drivers that do suspend/resume need
- * to call drm_fb_helper_set_suspend_unlocked() themselves. Simple
- * drivers might use drm_mode_config_helper_suspend().
+ * to call drm_client_dev_suspend() and drm_client_dev_resume() by
+ * themselves. Simple drivers might use drm_mode_config_helper_suspend().
  *
  * This function is safe to call even when there are no connectors present.
  * Setup will be retried on the next hotplug event.
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 2ee1c3233b0c..9011f8e16099 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -40,7 +40,7 @@
 #include <linux/slab.h>
 #include <linux/vga_switcheroo.h>
 
-#include <drm/drm_client.h>
+#include <drm/drm_client_event.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 1705bfc90b1e..0bfcba6949b0 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -48,12 +48,27 @@ struct drm_prime_file_private;
 struct drm_printer;
 struct drm_vblank_crtc;
 
+/* drm_client_event.c */
+#if defined(CONFIG_DRM_CLIENT)
+void drm_client_debugfs_init(struct drm_device *dev);
+#else
+static inline void drm_client_debugfs_init(struct drm_device *dev)
+{ }
+#endif
+
 /* drm_file.c */
 extern struct mutex drm_global_mutex;
 bool drm_dev_needs_global_mutex(struct drm_device *dev);
 struct drm_file *drm_file_alloc(struct drm_minor *minor);
 void drm_file_free(struct drm_file *file);
 
+/* drm_kms_helper_common.c */
+#if defined(CONFIG_DRM_FBDEV_EMULATION)
+extern bool drm_fbdev_emulation;
+extern int drm_fbdev_overalloc;
+extern bool drm_leak_fbdev_smem;
+#endif
+
 #ifdef CONFIG_PCI
 
 /* drm_pci.c */
diff --git a/drivers/gpu/drm/drm_kms_helper_common.c b/drivers/gpu/drm/drm_kms_helper_common.c
index 0c7550c0462b..ecff0b1414ac 100644
--- a/drivers/gpu/drm/drm_kms_helper_common.c
+++ b/drivers/gpu/drm/drm_kms_helper_common.c
@@ -27,6 +27,44 @@
 
 #include <linux/module.h>
 
+#include "drm_internal.h"
+
+#if defined(CONFIG_DRM_FBDEV_EMULATION)
+bool drm_fbdev_emulation = true;
+EXPORT_SYMBOL(drm_fbdev_emulation);
+module_param_named(fbdev_emulation, drm_fbdev_emulation, bool, 0600);
+MODULE_PARM_DESC(fbdev_emulation,
+		 "Enable legacy fbdev emulation [default=true]");
+
+int drm_fbdev_overalloc = CONFIG_DRM_FBDEV_OVERALLOC;
+EXPORT_SYMBOL(drm_fbdev_overalloc);
+module_param(drm_fbdev_overalloc, int, 0444);
+MODULE_PARM_DESC(drm_fbdev_overalloc,
+		 "Overallocation of the fbdev buffer (%) [default="
+		 __MODULE_STRING(CONFIG_DRM_FBDEV_OVERALLOC) "]");
+
+/*
+ * In order to keep user-space compatibility, we want in certain use-cases
+ * to keep leaking the fbdev physical address to the user-space program
+ * handling the fbdev buffer.
+ *
+ * This is a bad habit, essentially kept to support closed-source OpenGL
+ * drivers that should really be moved into open-source upstream projects
+ * instead of using legacy physical addresses in user space to communicate
+ * with other out-of-tree kernel modules.
+ *
+ * This module_param *should* be removed as soon as possible and be
+ * considered as a broken and legacy behaviour from a modern fbdev device.
+ */
+bool drm_leak_fbdev_smem;
+EXPORT_SYMBOL(drm_leak_fbdev_smem);
+#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
+module_param_unsafe(drm_leak_fbdev_smem, bool, 0600);
+MODULE_PARM_DESC(drm_leak_fbdev_smem,
+		 "Allow unsafe leaking fbdev physical smem address [default=false]");
+#endif
+#endif
+
 MODULE_AUTHOR("David Airlie, Jesse Barnes");
 MODULE_DESCRIPTION("DRM KMS helper");
 MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
index 2c582020cb42..5565464c1734 100644
--- a/drivers/gpu/drm/drm_modeset_helper.c
+++ b/drivers/gpu/drm/drm_modeset_helper.c
@@ -21,7 +21,7 @@
  */
 
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_client_event.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_modeset_helper.h>
@@ -185,7 +185,7 @@ EXPORT_SYMBOL(drm_crtc_init);
  * Zero on success, negative error code on error.
  *
  * See also:
- * drm_kms_helper_poll_disable() and drm_fb_helper_set_suspend_unlocked().
+ * drm_kms_helper_poll_disable() and drm_client_dev_suspend().
  */
 int drm_mode_config_helper_suspend(struct drm_device *dev)
 {
@@ -199,10 +199,11 @@ int drm_mode_config_helper_suspend(struct drm_device *dev)
 	if (dev->mode_config.poll_enabled)
 		drm_kms_helper_poll_disable(dev);
 
-	drm_fb_helper_set_suspend_unlocked(dev->fb_helper, 1);
+	drm_client_dev_suspend(dev, false);
 	state = drm_atomic_helper_suspend(dev);
 	if (IS_ERR(state)) {
-		drm_fb_helper_set_suspend_unlocked(dev->fb_helper, 0);
+		drm_client_dev_resume(dev, false);
+
 		/*
 		 * Don't enable polling if it was never initialized
 		 */
@@ -230,7 +231,7 @@ EXPORT_SYMBOL(drm_mode_config_helper_suspend);
  * Zero on success, negative error code on error.
  *
  * See also:
- * drm_fb_helper_set_suspend_unlocked() and drm_kms_helper_poll_enable().
+ * drm_client_dev_resume() and drm_kms_helper_poll_enable().
  */
 int drm_mode_config_helper_resume(struct drm_device *dev)
 {
@@ -247,7 +248,8 @@ int drm_mode_config_helper_resume(struct drm_device *dev)
 		DRM_ERROR("Failed to resume (%d)\n", ret);
 	dev->mode_config.suspend_state = NULL;
 
-	drm_fb_helper_set_suspend_unlocked(dev->fb_helper, 0);
+	drm_client_dev_resume(dev, false);
+
 	/*
 	 * Don't enable polling if it is not initialized
 	 */
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 92f21764246f..96b266b37ba4 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -33,7 +33,7 @@
 #include <linux/moduleparam.h>
 
 #include <drm/drm_bridge.h>
-#include <drm/drm_client.h>
+#include <drm/drm_client_event.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index db400aad88fa..1158a6b97f9a 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -10,6 +10,7 @@ config DRM_I915
 	# the shmem_readpage() which depends upon tmpfs
 	select SHMEM
 	select TMPFS
+	select DRM_CLIENT_SELECTION
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_DSC_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 069426d9260b..44de2d8591cd 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -11,7 +11,7 @@
 #include <acpi/video.h>
 #include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client.h>
+#include <drm/drm_client_event.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_privacy_screen_consumer.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index e2fd561cd23f..619a3efbe8c8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -28,8 +28,8 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_event.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
@@ -804,8 +804,7 @@ nouveau_display_suspend(struct drm_device *dev, bool runtime)
 {
 	struct nouveau_display *disp = nouveau_display(dev);
 
-	/* Disable console. */
-	drm_fb_helper_set_suspend_unlocked(dev->fb_helper, true);
+	drm_client_dev_suspend(dev, false);
 
 	if (drm_drv_uses_atomic_modeset(dev)) {
 		if (!runtime) {
@@ -836,8 +835,7 @@ nouveau_display_resume(struct drm_device *dev, bool runtime)
 		}
 	}
 
-	/* Enable console. */
-	drm_fb_helper_set_suspend_unlocked(dev->fb_helper, false);
+	drm_client_dev_resume(dev, false);
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index ab4e11dc0b8a..a6c375a24154 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -2,7 +2,7 @@
 #include <linux/vgaarb.h>
 #include <linux/vga_switcheroo.h>
 
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_client_event.h>
 
 #include "nouveau_drv.h"
 #include "nouveau_acpi.h"
diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 554b236c2328..6f071e61f764 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -35,6 +35,7 @@
 #include <linux/vgaarb.h>
 
 #include <drm/drm_cache.h>
+#include <drm/drm_client_event.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
@@ -1542,7 +1543,7 @@ void radeon_device_fini(struct radeon_device *rdev)
  * Called at driver suspend.
  */
 int radeon_suspend_kms(struct drm_device *dev, bool suspend,
-		       bool fbcon, bool freeze)
+		       bool notify_clients, bool freeze)
 {
 	struct radeon_device *rdev;
 	struct pci_dev *pdev;
@@ -1634,9 +1635,9 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
 		pci_set_power_state(pdev, PCI_D3hot);
 	}
 
-	if (fbcon) {
+	if (notify_clients) {
 		console_lock();
-		radeon_fbdev_set_suspend(rdev, 1);
+		drm_client_dev_suspend(dev, true);
 		console_unlock();
 	}
 	return 0;
@@ -1649,7 +1650,7 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
  * Returns 0 for success or an error on failure.
  * Called at driver resume.
  */
-int radeon_resume_kms(struct drm_device *dev, bool resume, bool fbcon)
+int radeon_resume_kms(struct drm_device *dev, bool resume, bool notify_clients)
 {
 	struct drm_connector *connector;
 	struct radeon_device *rdev = dev->dev_private;
@@ -1660,14 +1661,14 @@ int radeon_resume_kms(struct drm_device *dev, bool resume, bool fbcon)
 	if (dev->switch_power_state == DRM_SWITCH_POWER_OFF)
 		return 0;
 
-	if (fbcon) {
+	if (notify_clients) {
 		console_lock();
 	}
 	if (resume) {
 		pci_set_power_state(pdev, PCI_D0);
 		pci_restore_state(pdev);
 		if (pci_enable_device(pdev)) {
-			if (fbcon)
+			if (notify_clients)
 				console_unlock();
 			return -1;
 		}
@@ -1730,7 +1731,7 @@ int radeon_resume_kms(struct drm_device *dev, bool resume, bool fbcon)
 	/* reset hpd state */
 	radeon_hpd_init(rdev);
 	/* blat the mode back in */
-	if (fbcon) {
+	if (notify_clients) {
 		drm_helper_resume_force_mode(dev);
 		/* turn on display hw */
 		drm_modeset_lock_all(dev);
@@ -1746,8 +1747,8 @@ int radeon_resume_kms(struct drm_device *dev, bool resume, bool fbcon)
 	if ((rdev->pm.pm_method == PM_METHOD_DPM) && rdev->pm.dpm_enabled)
 		radeon_pm_compute_clocks(rdev);
 
-	if (fbcon) {
-		radeon_fbdev_set_suspend(rdev, 0);
+	if (notify_clients) {
+		drm_client_dev_resume(dev, true);
 		console_unlock();
 	}
 
diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index 0aa20c8df546..d4a58bd679db 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -288,12 +288,6 @@ int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	return ret;
 }
 
-void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state)
-{
-	if (rdev_to_drm(rdev)->fb_helper)
-		drm_fb_helper_set_suspend(rdev_to_drm(rdev)->fb_helper, state);
-}
-
 bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj)
 {
 	struct drm_fb_helper *fb_helper = rdev_to_drm(rdev)->fb_helper;
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 12a1d99a1815..4063d3801e81 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -942,13 +942,10 @@ int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 				    struct drm_fb_helper_surface_size *sizes);
 #define RADEON_FBDEV_DRIVER_OPS \
 	.fbdev_probe = radeon_fbdev_driver_fbdev_probe
-void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state);
 bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj);
 #else
 #define RADEON_FBDEV_DRIVER_OPS \
 	.fbdev_probe = NULL
-static inline void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state)
-{ }
 static inline bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj)
 {
 	return false;
diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index ebd0879e04d4..bac96c0dd66e 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -8,6 +8,7 @@ config DRM_XE
 	select SHMEM
 	select TMPFS
 	select DRM_BUDDY
+	select DRM_CLIENT_SELECTION
 	select DRM_EXEC
 	select DRM_KMS_HELPER
 	select DRM_KUNIT_TEST_HELPERS if DRM_XE_KUNIT_TEST != n
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index bc0e66f9c425..3b13cf29ed55 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -63,6 +63,34 @@ struct drm_client_funcs {
 	 * This callback is optional.
 	 */
 	int (*hotplug)(struct drm_client_dev *client);
+
+	/**
+	 * @suspend:
+	 *
+	 * Called when suspending the device.
+	 *
+	 * This callback is optional.
+	 *
+	 * FIXME: Some callers hold the console lock when invoking this
+	 *        function. This interferes with fbdev emulation, which
+	 *        also tries to acquire the lock. Push the console lock
+	 *        into the callback and remove 'holds_console_lock'.
+	 */
+	int (*suspend)(struct drm_client_dev *client, bool holds_console_lock);
+
+	/**
+	 * @resume:
+	 *
+	 * Called when resuming the device from suspend.
+	 *
+	 * This callback is optional.
+	 *
+	 * FIXME: Some callers hold the console lock when invoking this
+	 *        function. This interferes with fbdev emulation, which
+	 *        also tries to acquire the lock. Push the console lock
+	 *        into the callback and remove 'holds_console_lock'.
+	 */
+	int (*resume)(struct drm_client_dev *client, bool holds_console_lock);
 };
 
 /**
@@ -107,6 +135,13 @@ struct drm_client_dev {
 	 */
 	struct drm_mode_set *modesets;
 
+	/**
+	 * @suspended:
+	 *
+	 * The client has been suspended.
+	 */
+	bool suspended;
+
 	/**
 	 * @hotplug_failed:
 	 *
@@ -121,10 +156,6 @@ int drm_client_init(struct drm_device *dev, struct drm_client_dev *client,
 void drm_client_release(struct drm_client_dev *client);
 void drm_client_register(struct drm_client_dev *client);
 
-void drm_client_dev_unregister(struct drm_device *dev);
-void drm_client_dev_hotplug(struct drm_device *dev);
-void drm_client_dev_restore(struct drm_device *dev);
-
 /**
  * struct drm_client_buffer - DRM client buffer
  */
@@ -205,6 +236,4 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode);
 	drm_for_each_connector_iter(connector, iter) \
 		if (connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
 
-void drm_client_debugfs_init(struct drm_device *dev);
-
 #endif
diff --git a/include/drm/drm_client_event.h b/include/drm/drm_client_event.h
new file mode 100644
index 000000000000..99863554b055
--- /dev/null
+++ b/include/drm/drm_client_event.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+
+#ifndef _DRM_CLIENT_EVENT_H_
+#define _DRM_CLIENT_EVENT_H_
+
+struct drm_device;
+
+#if defined(CONFIG_DRM_CLIENT)
+void drm_client_dev_unregister(struct drm_device *dev);
+void drm_client_dev_hotplug(struct drm_device *dev);
+void drm_client_dev_restore(struct drm_device *dev);
+void drm_client_dev_suspend(struct drm_device *dev, bool holds_console_lock);
+void drm_client_dev_resume(struct drm_device *dev, bool holds_console_lock);
+#else
+static inline void drm_client_dev_unregister(struct drm_device *dev)
+{ }
+static inline void drm_client_dev_hotplug(struct drm_device *dev)
+{ }
+static inline void drm_client_dev_restore(struct drm_device *dev)
+{ }
+static inline void drm_client_dev_suspend(struct drm_device *dev, bool holds_console_lock)
+{ }
+static inline void drm_client_dev_resume(struct drm_device *dev, bool holds_console_lock)
+{ }
+#endif
+
+#endif
-- 
2.46.2

