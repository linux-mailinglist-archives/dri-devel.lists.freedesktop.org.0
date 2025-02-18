Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1FEA3985E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 11:12:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5AF810E65E;
	Tue, 18 Feb 2025 10:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZAD2Iah0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158E910E655
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 10:12:29 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-38f22fe8762so2649158f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 02:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739873547; x=1740478347; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TJKka9BGXo5aWskaWZaSFDrSIvgDMiHYo6XxF9H8dkw=;
 b=ZAD2Iah0Yrj9WA/3D/r7O/XQS1cM9Otg2PG2DxDBiDdLs9kvwihuvqpVdApJEMPZNO
 phbeJvqQRDi4NCETLkKYu98GbAlXQ8vZrBUDCtL4VFSBVaC5iYuJR+9GG2yTAIEW9mdm
 LpgFuQmNRbDxq9Aa3fnLYnNXeYS5Kp7IWAKG5VLjmnvO2SBLd0hGLw2DqvBsVa3P+pm0
 oihZznwbCcQm+Y/mqPzX9DAWm3TBu7u45lVWBV9A0sUSs5kPMHIJ0Yhcx5bcjzYEr6y6
 SCXIHM1YWZRort6BPv0H4/Hbky6V6o3U+lvpYKQrj74rBIEY69YrLX3aakzAuiNvfdLR
 fZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739873547; x=1740478347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TJKka9BGXo5aWskaWZaSFDrSIvgDMiHYo6XxF9H8dkw=;
 b=vUO1qWOpzM52gZboKJvN7lVKluHX+RFM/7465vzzm15cuFr8xa4suc/nilEeRbzd9W
 nhBgiKKL91gVnLyCSiOutxTUfmbhD6mxER0MBexvLzLN669X5p0568kNv2Yf/8M/EEum
 1/hjk9DgN2JEH8iDPjOS74ffLwcJmjBuCZ6+9KIThJCSNbUuDk76dhKtVTIqu637SNa7
 dhRqglAIbX6D2W5hJAcy/w7LcTzJhT7qeN/5yKuOoPEqMdfoLQvGEF1pdfI/ILbz91Iv
 q2XtxvhaFXFe+bHoG76Cd+EdRqpsAP6OvOmsQMrV8B1IoZ91jIh3lbO4T3eXZ1H1m0Yg
 7Xdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbsyxC5+UNI8vBq1UBW+cnYT+iTVQ6i5koe5dyfHjLHC+I6FrD50tNS9GVfz3RiHmSFuBhABG79+w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9ekGfVZ51xhLbdz1Hi69KyGeY5Z7c8nz0qFZwNeqVgaxZj2J9
 CGfCGyKqi4OFWflGl8IKhE3vXBeu9pX7PCvQ6Zd56k/0h5+ETThRS1Q2Tzh2
X-Gm-Gg: ASbGncsfmddlsrXqooZLMz7dvfay4+Ud1U4g17jQU8S00w0lli76ce/ur3j9I5pStkI
 r6e752lRiI99nckVDy7Hyq1CjQmM4cJgfLEiwuY7JXS7adtdmpdNkHJfM7xiM7HX5qejKOu89Qw
 jP+yZ1GKmWFtIC01ILY9nBBqAcljm44Iq0SqRcqVjnE+HnaZvbvdpMgRfWkC9Vz4c23qI7I5HUB
 dE0GmlczJ9S5n5XsS57I8c2JqYdd8pVcivOZ+5gJnW+j9ndxhCI9jwS+f7iDu9bEMJ/ILjFK3S1
 GQbw7kzvMkgog7v+YQ==
X-Google-Smtp-Source: AGHT+IGWzSNr3kxbNV50jtbq0xbVL8YqiJgdejwz9FCOvAxbLEogzuxer5MPdYZcMn4JCJdbLY2+eg==
X-Received: by 2002:a5d:5a11:0:b0:38f:32a7:b6f3 with SMTP id
 ffacd0b85a97d-38f33f4b858mr9937330f8f.40.1739873547398; 
 Tue, 18 Feb 2025 02:12:27 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e92sm14749720f8f.66.2025.02.18.02.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 02:12:27 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 06/14] drm/vkms: Set device name from vkms_config
Date: Tue, 18 Feb 2025 11:12:06 +0100
Message-ID: <20250218101214.5790-7-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218101214.5790-1-jose.exposito89@gmail.com>
References: <20250218101214.5790-1-jose.exposito89@gmail.com>
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

