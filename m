Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E40A37F2F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 11:01:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060B810E3E8;
	Mon, 17 Feb 2025 10:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kfBiTJ2u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A920410E3D6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 10:01:32 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-38f1e8efe82so4545441f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 02:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739786491; x=1740391291; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TJKka9BGXo5aWskaWZaSFDrSIvgDMiHYo6XxF9H8dkw=;
 b=kfBiTJ2uGQpFtxe7AmAGOdn/JBWNBB97QNwDN0lGr4xRvj1cAR2pPMp4phazCDd6CC
 s7hiWNGQ1QxhQhTs8cE4Wa2vSttLfrCNEpFNEp3doEjKnlvUQhNy15JoVcEkfMADG5Qt
 mG395B75oVfUwiiH4N2oAjECSiFXWB4cxRD75yo/coiGfoLPCnZ5l4FGLDwxvbE0Loj+
 XslttuaHeLmg2FVes7MSEIHUIRFVu75YxaM0kHwPOgvxJrcJRBylE/8lsEynhiEp4e1L
 ypItkpdXwnlY2LNemHmq1jp5iR4x4yyTgb5px8RQoSmQXzcNX6Y+JW+JlsxnCfwh48RU
 dRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739786491; x=1740391291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TJKka9BGXo5aWskaWZaSFDrSIvgDMiHYo6XxF9H8dkw=;
 b=sXvsGPQpZs7v803booTe9q7KtFU2smM18PdnnjrnxE/4AzF027H9v6U+VxjM9KxKae
 d5gzM9xw8VsfH4jEaEpS2bpUXbrUXFYivwMigKE+33VqpQGqdx8nbYJ5drhiMuXw4I/X
 U15ufIYmmSmww0V1LwD0EhdoAg4iKrsq9I53INJWAYi2HCkuZXdGSevA9UiqLzqEdvlZ
 UEmgM1ic9Dtt5LxhT5zyK8foJz2MyvPOsN42OqQvHwRdty671M9xPTP1DdrELJmiz0nP
 CdHcA1i+UWaNEUY+cTCYC8gz82OSk26KKPy8VLIHWUB9mrl4/5bIkWXSXCkuopd/lpsY
 aeEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZt2s/inGAvLBEttOKP/NI9HGjbpOl03doPYlW//Bg8kZ9Fx29tYn0MouJ5LVMQ6KxrAwHUfpXDIQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRrfPnY7NEE8U2+sjYNx3Y4+Vxc2LgVxR/WfRlC5fWFZQtouiE
 1hdvVoNW28HNjxxlt2J1mYk15C6I6MB2niBpQnw7tvdluyYvipNE
X-Gm-Gg: ASbGncv9rnlGlloWOZqVqV+2QvuTqBn3UGFF/78ABbuAJNEJ6/spJWUA/mOK391JOKk
 SExuc7Nc8AXpFH7Q22d+QjsXyWNgSH3sR/cSgyaLUSdTZnLkusV9e3gq7brTnU/MH+rh2zND5db
 Skfib/XjsAfkAUpYTI3Y2bBbfwHl4R8qjC5gk3Bu3o4uScK35+6I5LnvjESh77NqW+DHI6CxoVR
 9bHHxsc//aP3OobPCJKgcRrEs/pqYYIJrdgSxyOnvWDEa8kM3JfGVvmDDHMovjciRheTQmEq1Us
 R2w3d5VBnEimqUgoyA==
X-Google-Smtp-Source: AGHT+IEvXRu7nQr9abk46p9Flqt3U0L5kaXWVWty1aavdlHs6R4PCjETBRhWfdtHHenUEDLZusXffQ==
X-Received: by 2002:a5d:438c:0:b0:38f:2856:7dc4 with SMTP id
 ffacd0b85a97d-38f33f62c72mr7168453f8f.55.1739786491049; 
 Mon, 17 Feb 2025 02:01:31 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f7fe6sm11591901f8f.86.2025.02.17.02.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 02:01:30 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3 06/14] drm/vkms: Set device name from vkms_config
Date: Mon, 17 Feb 2025 11:01:12 +0100
Message-ID: <20250217100120.7620-7-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217100120.7620-1-jose.exposito89@gmail.com>
References: <20250217100120.7620-1-jose.exposito89@gmail.com>
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
index 0af8e6dc0a01..9fb08d94a351 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -8,7 +8,7 @@
 
 #include "vkms_config.h"
 
-struct vkms_config *vkms_config_create(void)
+struct vkms_config *vkms_config_create(const char *dev_name)
 {
 	struct vkms_config *config;
 
@@ -16,6 +16,12 @@ struct vkms_config *vkms_config_create(void)
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
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_create);
@@ -26,7 +32,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 {
 	struct vkms_config *config;
 
-	config = vkms_config_create();
+	config = vkms_config_create(DEFAULT_DEVICE_NAME);
 	if (IS_ERR(config))
 		return config;
 
@@ -40,6 +46,7 @@ EXPORT_SYMBOL_IF_KUNIT(vkms_config_default_create);
 
 void vkms_config_destroy(struct vkms_config *config)
 {
+	kfree_const(config->dev_name);
 	kfree(config);
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy);
@@ -49,7 +56,10 @@ static int vkms_config_show(struct seq_file *m, void *data)
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

