Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 710B8A3A396
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 18:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4741B10E09D;
	Tue, 18 Feb 2025 17:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hTjJuv+3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DB310E04F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 17:08:16 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-38f378498b0so2569689f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 09:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739898495; x=1740503295; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xhlZKEVK2CmNkJTJqhmNOGWOzMxjDVOcBuJnC6zguE0=;
 b=hTjJuv+3Ny59qALIL2fpqc0E2oKaznzBaEIcfG/d5X1c1vxs6js2yy53nozBuwKq8T
 m6lM1s1kRX8NRBZQgMHHbZmSCFFg3Nto7IJBrBQt1y/FHJidmYTYO6XMUDzMdOQdDmpx
 vU7TQaySNgHucu3lc5omtPUW0ab1X+BP5DMUNgFsrC/+CdKQavJT6FBUxYVw582AYxaw
 NkcX+1EIP7vB6r+9EtddFR+/FD7kI/BCTnBSztIgfHBkFIYE9FWS2MkPqz3y2sQFgjV0
 dxMmXb84zzGJ8oUB/wusbgsHtHO/L9zw5TjufmCEe+pO1gshFxbUhaK46xsv8nxlu9wS
 kF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739898495; x=1740503295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xhlZKEVK2CmNkJTJqhmNOGWOzMxjDVOcBuJnC6zguE0=;
 b=IjhRMIxMMoB2oeukNa8a+CTzRpPsWFWegqyT5xrJynADbIV0YtSSUYosHW7kh3dvHM
 5gqgGakWLoB6qqH6YMVI+u1LLORjy+QnXgk40WN8C2AxAdE5OkfwH8/vB/vmIoTfzDRB
 0MgjZ0CV2gNXmECggw3lAhs4n9FLj6peSRbkjKKtcIoYuLzVjlVgS+hFFjzfxq4K5NPw
 qztrnag0T3WaQ2aSz5w9BEK9AJndaJPi1NsewU7mIvzP2KCc9PT2NQD77iyVhWnfDU5S
 y5Df5VTbtKAH/JjJEc7cpuNhi7o+gJRV6mdhrtZ85swnZ/e8p2NH1MOOVkG4Lgb1JBpA
 oP4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNNiQEN8hmo8IvOzbH91kfuzjyxwm8LL9PqUAMfZPUaqOXK30SMFQ8A/exH/s59cIpELKWDQ3tQhw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcbHumE/a+miaCFGcK1z6Z61mE7P67lJRcyEZJdTlJDZClO9/B
 1x3rpx+XCrBYmaJMAu1lhf8bI1hX7j2t5rfDs/tedG1N3n6raWyE
X-Gm-Gg: ASbGncuVmHqDFrIoFCIUmMfMLqtqjkft16zDdPsB8B15DHSS5ehBH5XHQlb5lFDCfkH
 xgve5BuBnMc+FudEwCn6thLT2s25U9ey8M6ALGdO4QOMCuPu1CQVAvf4zc15vSTPhKhjthNmA9b
 LIXp2PwGudRL4/xsNGL8gVm0h5fS4Bts6NuT3Bqxv1QFYfL4NHAGBvmrx8nIfgqTBQLC8haubeX
 eC49PumMK6uQgIVW2vsaMIofYm+RdJcUGuhFy4jBxx7DlocHmTBvDctucdhDTfZEGVI9wkLEohJ
 YhpFGCGNch2wMyPbkg==
X-Google-Smtp-Source: AGHT+IH8icho+L38oeOKMswgW+BxTpG0fhVPgZJOh4fltmkYl59ah50mSmw2PXO/3y6I7QpnfIlb1g==
X-Received: by 2002:a05:6000:400c:b0:38f:2a32:abbb with SMTP id
 ffacd0b85a97d-38f58781d2bmr229666f8f.4.1739898494867; 
 Tue, 18 Feb 2025 09:08:14 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439941bd54bsm24680135e9.11.2025.02.18.09.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 09:08:14 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 02/16] drm/vkms: Add and remove VKMS instances via configfs
Date: Tue, 18 Feb 2025 18:07:54 +0100
Message-ID: <20250218170808.9507-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218170808.9507-1-jose.exposito89@gmail.com>
References: <20250218170808.9507-1-jose.exposito89@gmail.com>
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

Allow to create, enable, disable and destroy VKMS instances using
configfs.

For the moment, it is not possible to add pipeline items, so trying to
enable the device will fail printing an informative error to the log.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  32 +++++
 drivers/gpu/drm/vkms/Kconfig         |   1 +
 drivers/gpu/drm/vkms/Makefile        |   3 +-
 drivers/gpu/drm/vkms/vkms_configfs.c | 181 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_configfs.h |   8 ++
 drivers/gpu/drm/vkms/vkms_drv.c      |   7 ++
 6 files changed, 231 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.h

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index ba04ac7c2167..423bdf86b5b1 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -51,6 +51,38 @@ To disable the driver, use ::
 
   sudo modprobe -r vkms
 
+Configuring With Configfs
+=========================
+
+It is possible to create and configure multiple VKMS instances via configfs.
+
+Start by mounting configfs and loading VKMS::
+
+  sudo mount -t configfs none /config
+  sudo modprobe vkms
+
+Once VKMS is loaded, ``/config/vkms`` is created automatically. Each directory
+under ``/config/vkms`` represents a VKMS instance, create a new one::
+
+  sudo mkdir /config/vkms/my-vkms
+
+By default, the instance is disabled::
+
+  cat /config/vkms/my-vkms/enabled
+  0
+
+Once you are done configuring the VKMS instance, enable it::
+
+  echo "1" | sudo tee /config/vkms/my-vkms/enabled
+
+Finally, you can remove the VKMS instance disabling it::
+
+  echo "0" | sudo tee /config/vkms/my-vkms/enabled
+
+And removing the top level directory::
+
+  sudo rmdir /config/vkms/my-vkms
+
 Testing With IGT
 ================
 
diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
index 3c02f928ffe6..3977bbb99f7d 100644
--- a/drivers/gpu/drm/vkms/Kconfig
+++ b/drivers/gpu/drm/vkms/Kconfig
@@ -7,6 +7,7 @@ config DRM_VKMS
 	select DRM_KMS_HELPER
 	select DRM_GEM_SHMEM_HELPER
 	select CRC32
+	select CONFIGFS_FS
 	default n
 	help
 	  Virtual Kernel Mode-Setting (VKMS) is used for testing or for
diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index d657865e573f..939991fc8233 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -8,7 +8,8 @@ vkms-y := \
 	vkms_composer.o \
 	vkms_writeback.o \
 	vkms_connector.o \
-	vkms_config.o
+	vkms_config.o \
+	vkms_configfs.o
 
 obj-$(CONFIG_DRM_VKMS) += vkms.o
 obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += tests/
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
new file mode 100644
index 000000000000..306f571559b7
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -0,0 +1,181 @@
+// SPDX-License-Identifier: GPL-2.0+
+#include <linux/configfs.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+
+#include "vkms_drv.h"
+#include "vkms_config.h"
+#include "vkms_configfs.h"
+
+/* To avoid registering configfs more than once or unregistering on error */
+static bool is_configfs_registered;
+
+/**
+ * struct vkms_configfs_device - Configfs representation of a VKMS device
+ *
+ * @group: Top level configuration group that represents a VKMS device.
+ * Initialized when a new directory is created under "/config/vkms/"
+ * @lock: Lock used to project concurrent access to the configuration attributes
+ * @config: Protected by @lock. Configuration of the VKMS device
+ * @enabled: Protected by @lock. The device is created or destroyed when this
+ * option changes
+ */
+struct vkms_configfs_device {
+	struct config_group group;
+
+	struct mutex lock;
+	struct vkms_config *config;
+	bool enabled;
+};
+
+#define device_item_to_vkms_configfs_device(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_device, \
+		     group)
+
+static ssize_t device_enabled_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_device *dev;
+	bool enabled;
+
+	dev = device_item_to_vkms_configfs_device(item);
+
+	mutex_lock(&dev->lock);
+	enabled = dev->enabled;
+	mutex_unlock(&dev->lock);
+
+	return sprintf(page, "%d\n", enabled);
+}
+
+static ssize_t device_enabled_store(struct config_item *item, const char *page,
+				    size_t count)
+{
+	struct vkms_configfs_device *dev;
+	bool enabled;
+	int ret = 0;
+
+	dev = device_item_to_vkms_configfs_device(item);
+
+	if (kstrtobool(page, &enabled))
+		return -EINVAL;
+
+	mutex_lock(&dev->lock);
+
+	if (!dev->enabled && enabled) {
+		if (!vkms_config_is_valid(dev->config)) {
+			ret = -EINVAL;
+			goto err_unlock;
+		}
+
+		ret = vkms_create(dev->config);
+	} else if (dev->enabled && !enabled) {
+		vkms_destroy(dev->config);
+	}
+
+	if (ret)
+		goto err_unlock;
+
+	dev->enabled = enabled;
+
+	mutex_unlock(&dev->lock);
+
+	return (ssize_t)count;
+
+err_unlock:
+	mutex_unlock(&dev->lock);
+	return ret;
+}
+
+CONFIGFS_ATTR(device_, enabled);
+
+static struct configfs_attribute *device_item_attrs[] = {
+	&device_attr_enabled,
+	NULL,
+};
+
+static void device_release(struct config_item *item)
+{
+	struct vkms_configfs_device *dev;
+
+	dev = device_item_to_vkms_configfs_device(item);
+
+	if (dev->enabled)
+		vkms_destroy(dev->config);
+
+	mutex_destroy(&dev->lock);
+	vkms_config_destroy(dev->config);
+	kfree(dev);
+}
+
+static struct configfs_item_operations device_item_operations = {
+	.release	= &device_release,
+};
+
+static const struct config_item_type device_item_type = {
+	.ct_attrs	= device_item_attrs,
+	.ct_item_ops	= &device_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *make_device_group(struct config_group *group,
+					      const char *name)
+{
+	struct vkms_configfs_device *dev;
+
+	if (strcmp(name, DEFAULT_DEVICE_NAME) == 0)
+		return ERR_PTR(-EINVAL);
+
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return ERR_PTR(-ENOMEM);
+
+	dev->config = vkms_config_create(name);
+	if (IS_ERR(dev->config)) {
+		kfree(dev);
+		return ERR_CAST(dev->config);
+	}
+
+	config_group_init_type_name(&dev->group, name, &device_item_type);
+	mutex_init(&dev->lock);
+
+	return &dev->group;
+}
+
+static struct configfs_group_operations device_group_ops = {
+	.make_group = &make_device_group,
+};
+
+static const struct config_item_type device_group_type = {
+	.ct_group_ops	= &device_group_ops,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct configfs_subsystem vkms_subsys = {
+	.su_group = {
+		.cg_item = {
+			.ci_name = "vkms",
+			.ci_type = &device_group_type,
+		},
+	},
+	.su_mutex = __MUTEX_INITIALIZER(vkms_subsys.su_mutex),
+};
+
+int vkms_configfs_register(void)
+{
+	int ret;
+
+	if (is_configfs_registered)
+		return 0;
+
+	config_group_init(&vkms_subsys.su_group);
+	ret = configfs_register_subsystem(&vkms_subsys);
+
+	is_configfs_registered = ret == 0;
+
+	return ret;
+}
+
+void vkms_configfs_unregister(void)
+{
+	if (is_configfs_registered)
+		configfs_unregister_subsystem(&vkms_subsys);
+}
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.h b/drivers/gpu/drm/vkms/vkms_configfs.h
new file mode 100644
index 000000000000..e9020b0043db
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_configfs.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+#ifndef _VKMS_CONFIGFS_H_
+#define _VKMS_CONFIGFS_H_
+
+int vkms_configfs_register(void);
+void vkms_configfs_unregister(void);
+
+#endif /* _VKMS_CONFIGFS_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 23817c7b997e..5bcfbcb6c0c5 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -28,6 +28,7 @@
 #include <drm/drm_vblank.h>
 
 #include "vkms_config.h"
+#include "vkms_configfs.h"
 #include "vkms_drv.h"
 
 #define DRIVER_NAME	"vkms"
@@ -214,6 +215,10 @@ static int __init vkms_init(void)
 	int ret;
 	struct vkms_config *config;
 
+	ret = vkms_configfs_register();
+	if (ret)
+		return ret;
+
 	config = vkms_config_default_create(enable_cursor, enable_writeback, enable_overlay);
 	if (IS_ERR(config))
 		return PTR_ERR(config);
@@ -250,6 +255,8 @@ void vkms_destroy(struct vkms_config *config)
 
 static void __exit vkms_exit(void)
 {
+	vkms_configfs_unregister();
+
 	if (!default_config)
 		return;
 
-- 
2.48.1

