Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD242F1E8B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA2989DA9;
	Mon, 11 Jan 2021 19:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5016F89DA9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:06:39 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id 11so513556pfu.4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EIyCJKDhvNH8KI19OBGyEbU3SM6tfKfgJa5ae5NSM3Y=;
 b=fbBQ87YXU2W7qZDXQ1APvYVhLACLHf0jqMewwV/mDRFvsSnfDR+pwWoyh4/S8kfYEr
 1v15ZzSqtbMtuxVJ93UgiM9geBLlm24aatkaJ46T+OIhDX/o1j8LIL/OFMR+HEPOi129
 U+Vv+bKDDYHP3UjdaHrav+ZaYUgfFHlcdTB6ByfQTDv8Um2jMzF93zkyh9W8p/YKV/Eq
 wzBLRUy+TUWGEJz8XSRBzXooRBuDMZsn6sW8tb1Ug3USDb2O6nzlWdZxwrR3vx3X+v8n
 QDPzkfut4F6mh+N35Uu5lEHC+srr0z8Z2CnKATrRU2lJss3KHqTPjhUA7lW3CNkCIJnX
 K98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EIyCJKDhvNH8KI19OBGyEbU3SM6tfKfgJa5ae5NSM3Y=;
 b=S59PaDJ0YAOE/F+rXyneoP9M4LuHBGUVfMzf6XhADpDua98pIQlQ4xBtTqg29pecIe
 dXvj1S9faFjRZDQiw5OUeiMyoP6OMtskC1EHNOLXnTK1flst4rr8N8ui0ymY+umMUlnw
 kzRvm5e2yLh2WSy+TMdESvkXw/d1rc1fG9JH83oIAW1/JDxU+jyPUmdq0Zd4P588U+/d
 85ZJa5VcbjLVFQn+oK/9Y91X2uVh2bd17VTjZ8Bsg4lvWJFVtW1DZFdwyk9igAuUenl3
 N7UO3w9Rljnwbpe2zSBCQ3dwRi8ysBiwOU8qxYr7HBUZETMUtQLsJJUotFwGxUMmNQpY
 P6XQ==
X-Gm-Message-State: AOAM532diLgY+gCOcOFnLv+lg95OeTV05C6M+s9A1HtWpL29quZUZ/PU
 6YDHO15DxZrBrD8gTCWxAfM=
X-Google-Smtp-Source: ABdhPJy72E4kZERS5fyGJBoAmidZTicX5DyA8rEAIZftM2cNodlBIkh5xPC0RV4QEiPze/JN3b005w==
X-Received: by 2002:a63:2cd:: with SMTP id 196mr947417pgc.398.1610391998845;
 Mon, 11 Jan 2021 11:06:38 -0800 (PST)
Received: from adolin ([49.207.206.164])
 by smtp.gmail.com with ESMTPSA id b18sm370264pfi.173.2021.01.11.11.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:06:38 -0800 (PST)
Date: Tue, 12 Jan 2021 00:36:34 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: melissa.srw@gmail.com
Subject: [PATCH V5 1/3] drm/vkms: Add vkms_config type
Message-ID: <a090ad29b826185df30f80c66932dd2173d7b060.1610391685.git.sylphrenadin@gmail.com>
References: <cover.1610391685.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1610391685.git.sylphrenadin@gmail.com>
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
is added, device configuration will be tracked by configfs and only vkms
device lifetime will be handled by vkms_init and vkms_exit functions.

Modify usage of enable_cursor feature to reflect the changes in
relevant files.

Co-developed-by: Daniel Vetter <danvet.vetter@ffwl.ch>
Signed-off-by: Daniel Vetter <danvet.vetter@ffwl.ch>
Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c    | 40 ++++++++++++++++++++++++------
 drivers/gpu/drm/vkms/vkms_drv.h    | 12 +++++++--
 drivers/gpu/drm/vkms/vkms_output.c |  4 +--
 3 files changed, 44 insertions(+), 12 deletions(-)

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
index 5ed91ff08cb3..6a27bd8875f2 100644
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
@@ -82,10 +80,19 @@ struct vkms_output {
 	spinlock_t composer_lock;
 };
 
+struct vkms_device;
+
+struct vkms_config {
+	bool cursor;
+	/* only set when instantiated */
+	struct vkms_device *dev;
+};
+
 struct vkms_device {
 	struct drm_device drm;
 	struct platform_device *platform;
 	struct vkms_output output;
+	const struct vkms_config *config;
 };
 
 #define drm_crtc_to_vkms_output(target) \
@@ -124,3 +131,4 @@ void vkms_set_composer(struct vkms_output *out, bool enabled);
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
 
 #endif /* _VKMS_DRV_H_ */
+
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
