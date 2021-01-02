Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE0D2E8734
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jan 2021 12:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FE189590;
	Sat,  2 Jan 2021 11:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054ED89590
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jan 2021 11:56:02 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id q4so12014622plr.7
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Jan 2021 03:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=WxjX0UmWYF9l+jonWgitnMPY1zkNXmWL8YxBiNPdRlo=;
 b=H//CIGR5OdJaWJjwohCevwUvteD0enuv0KXwr2gdhDzgZomlEErBcLzIsqStKyko58
 7/zRiwuW1JxMsnSn4+Iyyaq91fVFEAsKunkVr+bEvi8nFVdBWiLOVzJYRI0F7A66Eb7+
 K7JWNs68WKyjUqM0QqtWvLzDQiFCR38rVLwTsiHscb+YmsJo8Gq9P7yWfArGeQXX1Xsr
 lDmuWFZCZqZN4HmftLtp+mmM9MdYVzL0z14G9hmyRaeukym9l83GwvRvkeI5UlpfoLf1
 BdellNJVfnoMR1v9pC3JKFv6EtMq9uTKCXr7IAVO4UmLbNtb979YbSA967AK2pl2Ubg5
 uGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=WxjX0UmWYF9l+jonWgitnMPY1zkNXmWL8YxBiNPdRlo=;
 b=fqa4UVi9gVVTx/6CC8XC0rmAxVhjAicJmnj25LOqyO0nyPSi69jzSt714zti4E+hMu
 cXZ6MZmUCE4rt/H0BZ6RHQ6fN6HV9gS14fE8FuKV/qNFMoENePxCYFbGeqQEF0H7DAz/
 11W96poxk+gyUFkBouHgwAHDJDL/hh00T+HJGyL6arqScLYB5Ei3Com6yPWMGXZxKMOX
 DLuxDlsSLxm+ZIWVsx5ByDHcx8wHVKsa/C1fJqTloXrTrv3V8NJTlC4Li/ukZT6NcGCo
 r+vR0C56i2x3Vlv94mHp9rtFJ+AFYHQ/VDlz1VHjHmXmq52N6Dm5PzaWR4Q036ZHwcRp
 fdqQ==
X-Gm-Message-State: AOAM532F7DMS3lqS1+lXtk1Zc1vSAOFivbQSb6760xulyA7KVUl9iI/d
 ibQReVINyFQ4xWWhLG+hCKY=
X-Google-Smtp-Source: ABdhPJx9BCaIisMtSl8Sl9P82bswjvPATtbuBiHqMdrhgYRnkjCuU310jIQnBBpwR6qEyJO/ASjCoA==
X-Received: by 2002:a17:90b:242:: with SMTP id
 fz2mr22013520pjb.39.1609588562546; 
 Sat, 02 Jan 2021 03:56:02 -0800 (PST)
Received: from adolin ([49.207.202.93])
 by smtp.gmail.com with ESMTPSA id 7sm50248901pfh.142.2021.01.02.03.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 03:56:02 -0800 (PST)
Date: Sat, 2 Jan 2021 17:25:57 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: melissa.srw@gmail.com
Subject: [PATCH V2] drm/vkms: Decouple config data for configfs
Message-ID: <20210102115557.qqfhohlx6yeo27vh@adolin>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, data for the device instance is held by vkms_device.
Add a separate type, vkms_config to contain configuration details
for the device and various modes to be later used by configfs.
This config data stays constant once the device is created.

Accordingly, add vkms_create and vkms_destroy to initialize/destroy
device through configfs. Currently, they are being called from vkms_init
and vkms_exit, but will be evoked from configfs later on. When configfs
is added, device configuration- enabling/disabling features will
be tracked by configfs and only vkms device lifetime will be kept track of
by vkms_init and vkms_exit functions.

Modify usage of enable_cursor feature to reflect the changes in
relevant files.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
Co-developed-by: Daniel Vetter <danvet.vetter@ffwl.ch>
---
Changes in v2:
- add Co-developed-by tag

---
 drivers/gpu/drm/vkms/vkms_drv.c    | 40 ++++++++++++++++++++++++------
 drivers/gpu/drm/vkms/vkms_drv.h    | 11 +++++---
 drivers/gpu/drm/vkms/vkms_output.c |  4 +--
 3 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index aef29393b811..6b33975a5cb2 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -34,9 +34,9 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
-static struct vkms_device *vkms_device;
+static struct vkms_config *default_config;
 
-bool enable_cursor = true;
+static bool enable_cursor = true;
 module_param_named(enable_cursor, enable_cursor, bool, 0444);
 MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
 
@@ -122,10 +122,11 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	return vkms_output_init(vkmsdev, 0);
 }
 
-static int __init vkms_init(void)
+static int vkms_create(struct vkms_config *config)
 {
 	int ret;
 	struct platform_device *pdev;
+	struct vkms_device *vkms_device;
 
 	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
 	if (IS_ERR(pdev))
@@ -143,6 +144,8 @@ static int __init vkms_init(void)
 		goto out_devres;
 	}
 	vkms_device->platform = pdev;
+	vkms_device->config = config;
+	config->dev = vkms_device;
 
 	ret = dma_coerce_mask_and_coherent(vkms_device->drm.dev,
 					   DMA_BIT_MASK(64));
@@ -179,21 +182,42 @@ static int __init vkms_init(void)
 	return ret;
 }
 
-static void __exit vkms_exit(void)
+static int __init vkms_init(void)
+{
+	struct vkms_config *config = kmalloc(sizeof(*config), GFP_KERNEL);
+
+	default_config = config;
+
+	config->cursor = enable_cursor;
+
+	return vkms_create(config);
+}
+
+static void vkms_destroy(struct vkms_config *config)
 {
 	struct platform_device *pdev;
 
-	if (!vkms_device) {
+	if (!config->dev) {
 		DRM_INFO("vkms_device is NULL.\n");
 		return;
 	}
 
-	pdev = vkms_device->platform;
+	pdev = config->dev->platform;
 
-	drm_dev_unregister(&vkms_device->drm);
-	drm_atomic_helper_shutdown(&vkms_device->drm);
+	drm_dev_unregister(&config->dev->drm);
+	drm_atomic_helper_shutdown(&config->dev->drm);
 	devres_release_group(&pdev->dev, NULL);
 	platform_device_unregister(pdev);
+
+	config->dev = NULL;
+}
+
+static void __exit vkms_exit(void)
+{
+	if (default_config->dev)
+		vkms_destroy(default_config);
+
+	kfree(default_config);
 }
 
 module_init(vkms_init);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 5ed91ff08cb3..2fa0c52f1dd8 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -19,8 +19,6 @@
 #define XRES_MAX  8192
 #define YRES_MAX  8192
 
-extern bool enable_cursor;
-
 struct vkms_composer {
 	struct drm_framebuffer fb;
 	struct drm_rect src, dst;
@@ -82,10 +80,17 @@ struct vkms_output {
 	spinlock_t composer_lock;
 };
 
+struct vkms_device;
+struct vkms_config {
+	bool cursor;
+	/* only set when instantiated */
+	struct vkms_device *dev;
+};
 struct vkms_device {
 	struct drm_device drm;
 	struct platform_device *platform;
 	struct vkms_output output;
+	const struct vkms_config *config;
 };
 
 #define drm_crtc_to_vkms_output(target) \
@@ -123,4 +128,4 @@ void vkms_set_composer(struct vkms_output *out, bool enabled);
 /* Writeback */
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
 
-#endif /* _VKMS_DRV_H_ */
+#endif /* _VKMS_DRV_H_ */
\ No newline at end of file
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 4a1848b0318f..8f3ffb28b9d1 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -46,7 +46,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
 
-	if (enable_cursor) {
+	if (vkmsdev->config->cursor) {
 		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
 		if (IS_ERR(cursor)) {
 			ret = PTR_ERR(cursor);
@@ -98,7 +98,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	drm_crtc_cleanup(crtc);
 
 err_crtc:
-	if (enable_cursor)
+	if (vkmsdev->config->cursor)
 		drm_plane_cleanup(cursor);
 
 err_cursor:
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
