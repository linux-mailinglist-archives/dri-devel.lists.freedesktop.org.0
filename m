Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C44A1A30978
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 12:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6DF10E66C;
	Tue, 11 Feb 2025 11:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TabJgxvy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F1A10E66A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 11:09:28 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-38dcf8009f0so1930607f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 03:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739272167; x=1739876967; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9pIxRugrT9zIlGotEeERPrS4hzRH4JozFA5lgU8/+aE=;
 b=TabJgxvyOeknZIUDBAcc962DISF5FOwM21YVMmGX0RrNDWA1sKG7nbzwJEt050Z8Gd
 qMNS7ZaxlE30Ra2QHCpIvnF5WNSY3+ZelPddeR90uCyblf/XSP7NLCRxBnOD/Nju4ur0
 hmHmT4MC/uFNFFhVHqCXhWCl8RBkmUDLk0ZxH+i3m7G22WQpNgM+y9LD/UE5UPATd/Jd
 VDGfuuhaQqDYKbQqkQJqrCPL4ZXHcba+/o6/QOB6cu408PHRpDCtXbgsgYK8hyhvXrL3
 EoDK71nPtrSb6k5AE3975DAbFCpFYMhho5FiaUMYjh7ic6sVF2AGcM0psLO0mPnjWbJk
 wnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739272167; x=1739876967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9pIxRugrT9zIlGotEeERPrS4hzRH4JozFA5lgU8/+aE=;
 b=Ylp2OM6Bz6IO+fV2xVASVWKe69dCVY3pJ9keWvXglvI85JmMhmQy/EY1b71QvFm8Vy
 EKoWSmIdcOLYuu74XeG+ReVdmYVxfhHzAFaIpOgHeGcJIjLVvlQdu4EqvNC/wqyoEg2M
 hh48IncoYRvgfhFEnpOaDGvUVlz67PueuqHPOCpLqgROYxvbF6Ou426pRsXcdulV8SUP
 UsQDhkFIoSeVBjYwhuEmJNFq/7pghcJOX8eNzHfxDxlbH6Ax0VUQhIlypRSO/PAUTMQm
 2i5wXgaYLh2nA9Iv+zepUaASS9Je3RF20VTXQGVdzSDHBxbCHwJFmqcwAH04vbpS/8Qv
 lF+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb6RglEmpQrVlUMqwOMEDX1WcA1k0OoS7Dx0fo+vMs+Tr3oPK8+I9UiLN5KxTO5RaHuE8PMxkDNm8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqHPMOr2rZ7MT49rPiBwbBo/Z5heNerWHbrcw+a4cW4HHCiWcn
 mE/vjpcj/5IU/l6ClHP4Fk9CqBdpel1Eat9JWjZZh7Dav0RFMQ1K
X-Gm-Gg: ASbGncsRPXTa2v49VYSfuMeHlaaj++Z6xMRu9o2p9VKtuLBWP3YEpN8QYrn8U5/PAOj
 td36WYjVR207cVIrZeoNh9zzhST6IBoIQFgxhHoSpLfW3Kf4r5gPWnWM6m2dvoU11/nCDQxVeqk
 B/CH/ZN6tU1nYQN3KazbsnrtWWnX51ViOfaTXVCLfT9CiI0TBhBgyXHiPNsrQX2eVXJlL5oQk5t
 r+uXAymvkD/zojqA+PT61o5aHCL4fCDrkLgRgJF5HsSus1pEqYlf8Xdc+qUSxZR4FKtm8iz2J4p
 VwugBnEhBtrVh/Zu
X-Google-Smtp-Source: AGHT+IHfwznOgYooE54sdnp62NB27Tm8mgqt4Q4HujPdLIkP4bQFsppMEJaJNOMzhaePFvi0XctSXw==
X-Received: by 2002:a05:6000:18ab:b0:38c:5d42:1516 with SMTP id
 ffacd0b85a97d-38dc935dd04mr13336108f8f.34.1739272166602; 
 Tue, 11 Feb 2025 03:09:26 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcb55b7a5sm11814417f8f.14.2025.02.11.03.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 03:09:25 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 07/15] drm/vkms: Set device name from vkms_config
Date: Tue, 11 Feb 2025 12:09:04 +0100
Message-ID: <20250211110912.15409-8-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211110912.15409-1-jose.exposito89@gmail.com>
References: <20250211110912.15409-1-jose.exposito89@gmail.com>
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

In order to be able to create multiple devices, the device name needs to
be unique.

Allow to set it in the VKMS configuration.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c |  7 ++++++-
 drivers/gpu/drm/vkms/vkms_config.c            | 14 ++++++++++++--
 drivers/gpu/drm/vkms/vkms_config.h            | 18 +++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_drv.c               |  4 +++-
 drivers/gpu/drm/vkms/vkms_drv.h               |  2 ++
 5 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index d8644a1e3e18..92798590051b 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -15,10 +15,15 @@ struct default_config_case {
 static void vkms_config_test_empty_config(struct kunit *test)
 {
 	struct vkms_config *config;
+	const char *dev_name = "test";
 
-	config = vkms_config_create();
+	config = vkms_config_create(dev_name);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
 
+	/* The dev_name string and the config have different lifetimes */
+	dev_name = NULL;
+	KUNIT_EXPECT_STREQ(test, vkms_config_get_device_name(config), "test");
+
 	vkms_config_destroy(config);
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 30ce4b23553f..11b0e539920b 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -7,7 +7,7 @@
 
 #include "vkms_config.h"
 
-struct vkms_config *vkms_config_create(void)
+struct vkms_config *vkms_config_create(const char *dev_name)
 {
 	struct vkms_config *config;
 
@@ -15,6 +15,12 @@ struct vkms_config *vkms_config_create(void)
 	if (!config)
 		return ERR_PTR(-ENOMEM);
 
+	config->dev_name = kstrdup_const(dev_name, GFP_KERNEL);
+	if (!config->dev_name) {
+		kfree(config);
+		return ERR_PTR(-ENOMEM);
+	}
+
 	return config;
 }
 
@@ -24,7 +30,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 {
 	struct vkms_config *config;
 
-	config = vkms_config_create();
+	config = vkms_config_create(DEFAULT_DEVICE_NAME);
 	if (IS_ERR(config))
 		return config;
 
@@ -37,6 +43,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 
 void vkms_config_destroy(struct vkms_config *config)
 {
+	kfree_const(config->dev_name);
 	kfree(config);
 }
 
@@ -45,7 +52,10 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	struct drm_debugfs_entry *entry = m->private;
 	struct drm_device *dev = entry->dev;
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
+	const char *dev_name;
 
+	dev_name = vkms_config_get_device_name((struct vkms_config *)vkmsdev->config);
+	seq_printf(m, "dev_name=%s\n", dev_name);
 	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
 	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
 	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index d0868750826a..fcaa909fb2e0 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -10,12 +10,14 @@
 /**
  * struct vkms_config - General configuration for VKMS driver
  *
+ * @dev_name: Name of the device
  * @writeback: If true, a writeback buffer can be attached to the CRTC
  * @cursor: If true, a cursor plane is created in the VKMS device
  * @overlay: If true, NUM_OVERLAY_PLANES will be created for the VKMS device
  * @dev: Used to store the current VKMS device. Only set when the device is instantiated.
  */
 struct vkms_config {
+	const char *dev_name;
 	bool writeback;
 	bool cursor;
 	bool overlay;
@@ -24,12 +26,13 @@ struct vkms_config {
 
 /**
  * vkms_config_create() - Create a new VKMS configuration
+ * @dev_name: Name of the device
  *
  * Returns:
  * The new vkms_config or an error. Call vkms_config_destroy() to free the
  * returned configuration.
  */
-struct vkms_config *vkms_config_create(void);
+struct vkms_config *vkms_config_create(const char *dev_name);
 
 /**
  * vkms_config_default_create() - Create the configuration for the default device
@@ -51,6 +54,19 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
  */
 void vkms_config_destroy(struct vkms_config *config);
 
+/**
+ * vkms_config_get_device_name() - Return the name of the device
+ * @config: Configuration to get the device name from
+ *
+ * Returns:
+ * The device name. Only valid while @config is valid.
+ */
+static inline const char *
+vkms_config_get_device_name(struct vkms_config *config)
+{
+	return config->dev_name;
+}
+
 /**
  * vkms_config_register_debugfs() - Register a debugfs file to show the device's
  * configuration
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 582d5825f42b..ba977ef09b2b 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -151,8 +151,10 @@ static int vkms_create(struct vkms_config *config)
 	int ret;
 	struct platform_device *pdev;
 	struct vkms_device *vkms_device;
+	const char *dev_name;
 
-	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
+	dev_name = vkms_config_get_device_name(config);
+	pdev = platform_device_register_simple(dev_name, -1, NULL, 0);
 	if (IS_ERR(pdev))
 		return PTR_ERR(pdev);
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index af7081c940d6..a74a7fc3a056 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -12,6 +12,8 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_writeback.h>
 
+#define DEFAULT_DEVICE_NAME "vkms"
+
 #define XRES_MIN    10
 #define YRES_MIN    10
 
-- 
2.48.1

