Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E739A30975
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 12:09:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E710210E669;
	Tue, 11 Feb 2025 11:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kfWrYFkm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA8210E669
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 11:09:25 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-38dd14c99d3so2850565f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 03:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739272164; x=1739876964; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w8lum8pBLYhiQh7v0U0rbZpEXVJRkT5bnyUgOR4qD6o=;
 b=kfWrYFkmR8mM5WBk+EWHDroHaFhPLoFR+DF++zYAP1bsgeDy2/ilNaBgyayWCkwZ+o
 RZEqn2mZji2Is5lDV4caAgketH8OjrbI47JrHipEGBcHz6uAEA7tFGDWWgdfxyUQnojC
 qo6k0sWUZbpVfMxBQsaTkgZRKRU4meN9Bvi1qlvrCOcEmA91ybqOLVvuSN8L1ETwVrXI
 6BdFHDD4VzZIJTEEwfwUH7wvEBjPzTyqCJRKckipUVDPWZ9R9OS74dG/j/5KZx0KPYW9
 IMXm+CPyb31Vn/PE9gul94f4CxbhNRKpTZ5K8tRS8KEk2a0rPl5wJso0Xq73uMLPb+Yb
 R3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739272164; x=1739876964;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w8lum8pBLYhiQh7v0U0rbZpEXVJRkT5bnyUgOR4qD6o=;
 b=Klco04H2ULiy7596PI7zuJjVjC/5Auq2E4D3D113Cus63cYqGTMTtBgd6r3XR/vf1I
 jZtZRzfPohgoWEB5jC2MI8Leq8ex2KRqIAPLxaE8Hp6Rr39xawPDuHavehdc6/MLUSyA
 f0PEU8vWIrvj0nCsHDsNmt1U7pxIoJPOtUM5ARaDSWaEvpo16MzjEgmQbKWOF/d3pToR
 UbjnLImyT30C1AgSSCEdscTl1ae/hLnEydNWqh0aaP0C3p5gIRp40CuOXM5n9Yv7rfJv
 7YKve+ruN7TaQWliJZBWUKf/CIGbdxG9eu+FhgJIk7G0TKEDlgGUjA7FoMSKTYIgG079
 fg0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7ZuuhsP34jG/izcKLxSV+TcfE+T6whhKQ4E5pnA6KY5HosHQmF4qTFs1G2jPjG1yCxjTpUxLWwN0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztWJ7+eUxBk49LQtxoAkwKqca7pkfIkLCHlMJ8CuYFldH4J3w+
 cyTBSpCLgjpZCHLw0VlIS90XekrkgAR6GW2Lus99r3ArlqbgfsAE
X-Gm-Gg: ASbGncu2BmrbBUInmC0PZwefC+l56DIExtPV6VqG31N1u2Jdrg/GQSQLxep9j1V/AyY
 aMtWnYmy6MRzuTla/oagtz4q0LSKXd3WBGxur6Z1CCK/21B0OI5cNg+yWlLyy9KE7znsXjYSM38
 U0gnyNSRTIF0hyj1ClyA4inFwZd5Z4eZAT1xMMNPZpIiNmmVJ1v4EvfzizdIxiWvlq5i6XuKBuB
 YVXoWM3Iin6YCuMiN4RimSmqN56G7E9f0/4tD7AHUpUei8AWI+/oasQcCEIMMC5wr1FICgXxRK9
 zks/I65IzKDGuRTw
X-Google-Smtp-Source: AGHT+IEKnWUo5eUZtrzRBT+jHHy0k5gsRkTO/HlKIycGcSYkywT85kSZQR1n34vGrpV/GF0O9mtKGg==
X-Received: by 2002:a5d:6d87:0:b0:38d:d93b:5899 with SMTP id
 ffacd0b85a97d-38dd93b5a82mr8411507f8f.21.1739272163582; 
 Tue, 11 Feb 2025 03:09:23 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcb55b7a5sm11814417f8f.14.2025.02.11.03.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 03:09:22 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 05/15] drm/vkms: Extract vkms_config header
Date: Tue, 11 Feb 2025 12:09:02 +0100
Message-ID: <20250211110912.15409-6-jose.exposito89@gmail.com>
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

Creating a new vkms_config structure will be more complex once we
start adding more options.

Extract the vkms_config structure to its own header and source files
and add functions to create and delete a vkms_config and to initialize
debugfs.

Refactor, no functional changes.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/Makefile                 |  3 +-
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 13 +++++
 drivers/gpu/drm/vkms/vkms_config.c            | 47 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 47 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.c               | 34 +++-----------
 drivers/gpu/drm/vkms/vkms_drv.h               | 15 +-----
 drivers/gpu/drm/vkms/vkms_output.c            |  1 +
 7 files changed, 118 insertions(+), 42 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_config.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_config.h

diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index 45ef4b89379e..9bf6b8f94daf 100644
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
 obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += tests/
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
index 000000000000..152b2ecd6aef
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/slab.h>
+
+#include <drm/drm_print.h>
+#include <drm/drm_debugfs.h>
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
+
+void vkms_config_destroy(struct vkms_config *config)
+{
+	kfree(config);
+}
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

