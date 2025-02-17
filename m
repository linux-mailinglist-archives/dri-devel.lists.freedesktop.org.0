Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 378C7A37F2B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 11:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE52810E3E0;
	Mon, 17 Feb 2025 10:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hHOlVkRH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D180510E3C2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 10:01:30 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-38f2c4382d1so1522951f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 02:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739786489; x=1740391289; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LmDfaEOjc70HjJgnj7sLGaZRyHuUKTvYVGnXm2VRbiY=;
 b=hHOlVkRHIyZWBEASiOOlZ82JpH27/TbsTH61bTAlXimFC/CPvewTTzqbn84IdjmiHe
 /JLonYmjNo7Dz1kSr1erE6F56c/55d3HZpUEH1osUSGaRC9sBSSM9UndcuCUacYic/jR
 bNDRHdIEX/g7dcE2M8KORMq4Ke/6Tc2Iez1UTCzaj7DYRmNPyOMB6VfdIvs3BihFBrYo
 AKeV3b+7WKVktYHxdgfq114SM2uqr9U5ZhRj6iLW2qgtK0yJoUFqr+pV9UcHRuesnmui
 rrVwMQi+oRqnMqfQDdwijjcDEbOnvt11TTfZpdxNLh1tjE3Xfmc/JVcF+hjO6ArbDu9q
 B+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739786489; x=1740391289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LmDfaEOjc70HjJgnj7sLGaZRyHuUKTvYVGnXm2VRbiY=;
 b=I2H1K9szUs+uai0g18Z1pIJ0FiRNyUaXzurKiNLk2iCd+NfdMr9eds9rzZ4p+TJot/
 yXQbz/johW7o41Xwa601l3kMM68DanEM5ukompE7+N5jhu9NPA4N60Q3nkjKcR5K+k2U
 /uKuTuccbrglWLfTG3WxpaotdGq9YBj8n+ktvyEVp0VV0Og+fQu0Z2McFZDO5nRC9wXE
 J50tHozDUFPRsAM9I/vx0Bbd7yrdaMMNiay/pTqugrZcukFm3SK0/hpAM7IMoSqe/03l
 w/6WwxcCoQIxritHweWZSKAS3F5ojWNh9Bme/uqnEzC3OkDPBNNKjxLC1pm94ChKXAjk
 GvaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX912D0vlsjjBHv5yAtfPzYdSIyKXd1FZ9sndSFNEcbYgaIrz475PEpJU/EAgVqMV9xt6KxNBa62w4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxZmKPTW4vI1Xxo+Wm0b+jIIp2guPWRDcFUIZNqJyCEU8+GO5+
 7zCdjuwIdRfwjysfys2ogrBoJoNxo3S6qxx7dz57t7P5S8MTJ1Zu
X-Gm-Gg: ASbGnctshSvAg/Q14Y0PQVq3bqtXm9dEyp8C7Jzfkv4xYe0YK0FGCwVz7cEbnq4G2JR
 ilk3ntt0qe+gBCqEFQT5KMYsn0v3jOzhV9q085cfKm2+pLs9GJoqTNIj/ZbR0HyUZbsDezkBwxx
 Vg851o26+ev/QEDFLyoeLVoQXvqA959dTajF5oU/jo5PMPJOB6zI19ZOv19qSAjp+ge85phIW4w
 bB137gv9DctD8O1VrxXRAvVktfqSGp3Dl+OV02oqyvkNLpiU9ngDZA8LMH7AoMMnogsnOiMyX/8
 +kThkcTCRHxTE8RR+A==
X-Google-Smtp-Source: AGHT+IHstdjpSigFhN2igJJ+uFQJmFbHjahhv3wT/oTulr2cNaKb5gAC3MJK+5fY4aO6oDo3PD9wcQ==
X-Received: by 2002:a05:6000:154b:b0:38d:a695:6daf with SMTP id
 ffacd0b85a97d-38f33c20c39mr9565959f8f.19.1739786488810; 
 Mon, 17 Feb 2025 02:01:28 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f7fe6sm11591901f8f.86.2025.02.17.02.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 02:01:28 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3 04/14] drm/vkms: Extract vkms_config header
Date: Mon, 17 Feb 2025 11:01:10 +0100
Message-ID: <20250217100120.7620-5-jose.exposito89@gmail.com>
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

Creating a new vkms_config structure will be more complex once we
start adding more options.

Extract the vkms_config structure to its own header and source files
and add functions to create and delete a vkms_config and to initialize
debugfs.

Refactor, no functional changes.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/Makefile                 |  3 +-
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 13 +++++
 drivers/gpu/drm/vkms/vkms_config.c            | 50 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 47 +++++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.c               | 34 +++----------
 drivers/gpu/drm/vkms/vkms_drv.h               | 15 +-----
 drivers/gpu/drm/vkms/vkms_output.c            |  1 +
 7 files changed, 121 insertions(+), 42 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_config.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_config.h

diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index c23eee2f3df4..d657865e573f 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -7,7 +7,8 @@ vkms-y := \
 	vkms_crtc.o \
 	vkms_composer.o \
 	vkms_writeback.o \
-	vkms_connector.o
+	vkms_connector.o \
+	vkms_config.o
 
 obj-$(CONFIG_DRM_VKMS) += vkms.o
 obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += tests/
diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 1177e62e19cb..a7060504f3dc 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -2,9 +2,22 @@
 
 #include <kunit/test.h>
 
+#include "../vkms_config.h"
+
 MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 
+static void vkms_config_test_empty_config(struct kunit *test)
+{
+	struct vkms_config *config;
+
+	config = vkms_config_create();
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	vkms_config_destroy(config);
+}
+
 static struct kunit_case vkms_config_test_cases[] = {
+	KUNIT_CASE(vkms_config_test_empty_config),
 	{}
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
new file mode 100644
index 000000000000..42caa421876e
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/slab.h>
+
+#include <drm/drm_print.h>
+#include <drm/drm_debugfs.h>
+#include <kunit/visibility.h>
+
+#include "vkms_config.h"
+
+struct vkms_config *vkms_config_create(void)
+{
+	struct vkms_config *config;
+
+	config = kzalloc(sizeof(*config), GFP_KERNEL);
+	if (!config)
+		return ERR_PTR(-ENOMEM);
+
+	return config;
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_create);
+
+void vkms_config_destroy(struct vkms_config *config)
+{
+	kfree(config);
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy);
+
+static int vkms_config_show(struct seq_file *m, void *data)
+{
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
+	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
+
+	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
+	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
+	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
+
+	return 0;
+}
+
+static const struct drm_debugfs_info vkms_config_debugfs_list[] = {
+	{ "vkms_config", vkms_config_show, 0 },
+};
+
+void vkms_config_register_debugfs(struct vkms_device *vkms_device)
+{
+	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
+			      ARRAY_SIZE(vkms_config_debugfs_list));
+}
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
new file mode 100644
index 000000000000..ced10f56a812
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _VKMS_CONFIG_H_
+#define _VKMS_CONFIG_H_
+
+#include <linux/types.h>
+
+#include "vkms_drv.h"
+
+/**
+ * struct vkms_config - General configuration for VKMS driver
+ *
+ * @writeback: If true, a writeback buffer can be attached to the CRTC
+ * @cursor: If true, a cursor plane is created in the VKMS device
+ * @overlay: If true, NUM_OVERLAY_PLANES will be created for the VKMS device
+ * @dev: Used to store the current VKMS device. Only set when the device is instantiated.
+ */
+struct vkms_config {
+	bool writeback;
+	bool cursor;
+	bool overlay;
+	struct vkms_device *dev;
+};
+
+/**
+ * vkms_config_create() - Create a new VKMS configuration
+ *
+ * Returns:
+ * The new vkms_config or an error. Call vkms_config_destroy() to free the
+ * returned configuration.
+ */
+struct vkms_config *vkms_config_create(void);
+
+/**
+ * vkms_config_destroy() - Free a VKMS configuration
+ * @config: vkms_config to free
+ */
+void vkms_config_destroy(struct vkms_config *config);
+
+/**
+ * vkms_config_register_debugfs() - Register a debugfs file to show the device's
+ * configuration
+ * @vkms_device: Device to register
+ */
+void vkms_config_register_debugfs(struct vkms_device *vkms_device);
+
+#endif /* _VKMS_CONFIG_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index b6de91134a22..37de0658e6ee 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -27,11 +27,9 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_vblank.h>
 
+#include "vkms_config.h"
 #include "vkms_drv.h"
 
-#include <drm/drm_print.h>
-#include <drm/drm_debugfs.h>
-
 #define DRIVER_NAME	"vkms"
 #define DRIVER_DESC	"Virtual Kernel Mode Setting"
 #define DRIVER_MAJOR	1
@@ -81,23 +79,6 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
 	drm_atomic_helper_cleanup_planes(dev, old_state);
 }
 
-static int vkms_config_show(struct seq_file *m, void *data)
-{
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
-	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
-
-	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
-	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
-	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
-
-	return 0;
-}
-
-static const struct drm_debugfs_info vkms_config_debugfs_list[] = {
-	{ "vkms_config", vkms_config_show, 0 },
-};
-
 static const struct drm_driver vkms_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
 	.fops			= &vkms_driver_fops,
@@ -208,8 +189,7 @@ static int vkms_create(struct vkms_config *config)
 	if (ret)
 		goto out_devres;
 
-	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
-			      ARRAY_SIZE(vkms_config_debugfs_list));
+	vkms_config_register_debugfs(vkms_device);
 
 	ret = drm_dev_register(&vkms_device->drm, 0);
 	if (ret)
@@ -231,9 +211,9 @@ static int __init vkms_init(void)
 	int ret;
 	struct vkms_config *config;
 
-	config = kmalloc(sizeof(*config), GFP_KERNEL);
-	if (!config)
-		return -ENOMEM;
+	config = vkms_config_create();
+	if (IS_ERR(config))
+		return PTR_ERR(config);
 
 	config->cursor = enable_cursor;
 	config->writeback = enable_writeback;
@@ -241,7 +221,7 @@ static int __init vkms_init(void)
 
 	ret = vkms_create(config);
 	if (ret) {
-		kfree(config);
+		vkms_config_destroy(config);
 		return ret;
 	}
 
@@ -275,7 +255,7 @@ static void __exit vkms_exit(void)
 		return;
 
 	vkms_destroy(default_config);
-	kfree(default_config);
+	vkms_config_destroy(default_config);
 }
 
 module_init(vkms_init);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index abbb652be2b5..af7081c940d6 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -189,20 +189,7 @@ struct vkms_output {
 	spinlock_t composer_lock;
 };
 
-/**
- * struct vkms_config - General configuration for VKMS driver
- *
- * @writeback: If true, a writeback buffer can be attached to the CRTC
- * @cursor: If true, a cursor plane is created in the VKMS device
- * @overlay: If true, NUM_OVERLAY_PLANES will be created for the VKMS device
- * @dev: Used to store the current VKMS device. Only set when the device is instantiated.
- */
-struct vkms_config {
-	bool writeback;
-	bool cursor;
-	bool overlay;
-	struct vkms_device *dev;
-};
+struct vkms_config;
 
 /**
  * struct vkms_device - Description of a VKMS device
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 4b5abe159add..068a7f87ecec 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include "vkms_config.h"
 #include "vkms_connector.h"
 #include "vkms_drv.h"
 #include <drm/drm_managed.h>
-- 
2.48.1

