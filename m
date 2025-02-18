Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC8AA3A39C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 18:08:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D7910E2B8;
	Tue, 18 Feb 2025 17:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="glwXB9/+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FB710E40E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 17:08:18 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-439950a45daso6149295e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 09:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739898497; x=1740503297; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yjhuBRdxXqW/2QEKLkzw2I4K7vjGSpOOdxc8AYlfvfY=;
 b=glwXB9/+JUMfmRCGSWocgNQ+oWCTaWUPb1G4CWJsDNEmV6Dv92MWKUwx4IJu4Q8rkQ
 Y7FczsGu3YZtjeUkK9GTcPXFMMXzXfT8Ze1Be7/xFnVi5wkaJ0OEbAm1FQB8jLb09O3h
 15oEJG1q6Nfh6IWvL1wo4FAOGth18aKE0EmXQGKIZYGKCZHlrvwWnsfMV4EtRKl88AnS
 Hw7NtRM1voiigSQFgyBegSIooqzj4P/Sw5tC6cAv7eZaDncSw980DKyz1pVvbVxe8g5K
 tCX/Y9ol9jm1rBNkRKbLHvcqiFcICHn+cvDN3wyWHutrBqG174yIPQDgPF8Zyxly5UiU
 8Hhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739898497; x=1740503297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yjhuBRdxXqW/2QEKLkzw2I4K7vjGSpOOdxc8AYlfvfY=;
 b=ckyo6v4xr8w+irB3K77cOrAvpZFbDHk3HtwfoawaUstA7qLMqs4Vj9tqul1snO2KDk
 zHH9mZOn9vNbGcrGpmRgpw5uzEt5F42BxlUQQBzd7Dqz9oHEie/VgdB0TOAhZSL08FUW
 FrtsbGBZSc/P2+pbPI4ySoFqeF/UQ5HjS7JzGGbapKgKKXzwhfS5mcCLfVvHbWTqzrr7
 OIgs3ga80DCkbdydVcxaChTb4ncGweFnpcNdQiJu/lTd5IRljYzZSaKLEY2LKwJgRNGU
 rHo7UVAYIvwzUKF9QpmUJ1Ia4O+rTazBbpInjwSUYZXRQmL+IaHVxRYY+wEF6fiqpFW/
 p4cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwMkAGpBZe0uskbPH4ApOzuzeITqrsFNCTWH3+xVkjeNRkQfVBxH3L8onjgj9RwBGDPIufntfvNQU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzSRsrX39fvv4dYdfhRnYk9N/vM0P4JTh77ur65gaXPGX31khZ
 3ptsAfG+JnAh/aN3QqOlvXNxrMoJZBUkUU1c9r4jnwVdp+4uECo4
X-Gm-Gg: ASbGncs8fHTAtH1qcsrKcM2x6zC/RWfOoIQ1a2Ii2ig7lELHm86Q9qW14xN38f5JL10
 IpoKCGNHjJX3H1HoSDGP7ZmXFYn9AJTPheNgbSe7hh0oWkVohk3/FI4xwfzDpJS3zj0RpI446rY
 zrj6+zrinDy3jKbnjY0MbniOpkWDQl9cGbS62z9AYS9/dMDo5r3uRsFn/bpxTOly9fQbVXR4ie5
 y3sBzvPSNmDJoiCzlxYrW8pcYZBXRVmLWJHWQY9QVO1hyYc1+jhDMeWIzTYDzlCOUh0G0+pcqiu
 7snlInIsTtE5NB/kXw==
X-Google-Smtp-Source: AGHT+IFbJF9e5WdqgLAejew7B490btdgXX9pwq+ZzgR0AWX/aBt0neIv4ytIpTTz6pcQA9tCEhfsdA==
X-Received: by 2002:a05:600c:1e11:b0:439:86fb:7324 with SMTP id
 5b1f17b1804b1-43986fb738amr67674355e9.4.1739898496776; 
 Tue, 18 Feb 2025 09:08:16 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439941bd54bsm24680135e9.11.2025.02.18.09.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 09:08:15 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 03/16] drm/vkms: Allow to configure multiple planes via
 configfs
Date: Tue, 18 Feb 2025 18:07:55 +0100
Message-ID: <20250218170808.9507-4-jose.exposito89@gmail.com>
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

Create a default subgroup at /config/vkms/planes to allow to create as
many planes as required.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  16 ++++-
 drivers/gpu/drm/vkms/vkms_configfs.c | 101 +++++++++++++++++++++++++++
 2 files changed, 116 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 423bdf86b5b1..bf23d0da33fe 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -71,6 +71,19 @@ By default, the instance is disabled::
   cat /config/vkms/my-vkms/enabled
   0
 
+And directories are created for each configurable item of the display pipeline::
+
+  tree /config/vkms/my-vkms
+  ├── enabled
+  └── planes
+
+To add items to the display pipeline, create one or more directories under the
+available paths.
+
+Start by creating one or more planes::
+
+  sudo mkdir /config/vkms/my-vkms/planes/plane0
+
 Once you are done configuring the VKMS instance, enable it::
 
   echo "1" | sudo tee /config/vkms/my-vkms/enabled
@@ -79,8 +92,9 @@ Finally, you can remove the VKMS instance disabling it::
 
   echo "0" | sudo tee /config/vkms/my-vkms/enabled
 
-And removing the top level directory::
+And removing the top level directory and its subdirectories::
 
+  sudo rmdir /config/vkms/my-vkms/planes/*
   sudo rmdir /config/vkms/my-vkms
 
 Testing With IGT
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 306f571559b7..dd9dfe51eb3a 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -15,6 +15,7 @@ static bool is_configfs_registered;
  *
  * @group: Top level configuration group that represents a VKMS device.
  * Initialized when a new directory is created under "/config/vkms/"
+ * @planes_group: Default subgroup of @group at "/config/vkms/planes"
  * @lock: Lock used to project concurrent access to the configuration attributes
  * @config: Protected by @lock. Configuration of the VKMS device
  * @enabled: Protected by @lock. The device is created or destroyed when this
@@ -22,16 +23,112 @@ static bool is_configfs_registered;
  */
 struct vkms_configfs_device {
 	struct config_group group;
+	struct config_group planes_group;
 
 	struct mutex lock;
 	struct vkms_config *config;
 	bool enabled;
 };
 
+/**
+ * struct vkms_configfs_plane - Configfs representation of a plane
+ *
+ * @group: Top level configuration group that represents a plane.
+ * Initialized when a new directory is created under "/config/vkms/planes"
+ * @dev: The vkms_configfs_device this plane belongs to
+ * @config: Configuration of the VKMS plane
+ */
+struct vkms_configfs_plane {
+	struct config_group group;
+	struct vkms_configfs_device *dev;
+	struct vkms_config_plane *config;
+};
+
 #define device_item_to_vkms_configfs_device(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_device, \
 		     group)
 
+#define child_group_to_vkms_configfs_device(group) \
+	device_item_to_vkms_configfs_device((&(group)->cg_item)->ci_parent)
+
+#define plane_item_to_vkms_configfs_plane(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_plane, group)
+
+static void plane_release(struct config_item *item)
+{
+	struct vkms_configfs_plane *plane;
+	struct mutex *lock;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+	lock = &plane->dev->lock;
+
+	mutex_lock(lock);
+	vkms_config_destroy_plane(plane->config);
+	kfree(plane);
+	mutex_unlock(lock);
+}
+
+static struct configfs_item_operations plane_item_operations = {
+	.release	= &plane_release,
+};
+
+static const struct config_item_type plane_item_type = {
+	.ct_item_ops	= &plane_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *make_plane_group(struct config_group *group,
+					     const char *name)
+{
+	struct vkms_configfs_device *dev;
+	struct vkms_configfs_plane *plane;
+	int ret;
+
+	dev = child_group_to_vkms_configfs_device(group);
+
+	mutex_lock(&dev->lock);
+
+	if (dev->enabled) {
+		ret = -EINVAL;
+		goto err_unlock;
+	}
+
+	plane = kzalloc(sizeof(*plane), GFP_KERNEL);
+	if (!plane) {
+		ret = -ENOMEM;
+		goto err_unlock;
+	}
+
+	plane->dev = dev;
+
+	plane->config = vkms_config_create_plane(dev->config);
+	if (IS_ERR(plane->config)) {
+		ret = PTR_ERR(plane->config);
+		goto err_free;
+	}
+
+	config_group_init_type_name(&plane->group, name, &plane_item_type);
+
+	mutex_unlock(&dev->lock);
+
+	return &plane->group;
+
+err_free:
+	kfree(plane);
+err_unlock:
+	mutex_unlock(&dev->lock);
+	return ERR_PTR(ret);
+}
+
+static struct configfs_group_operations planes_group_operations = {
+	.make_group	= &make_plane_group,
+};
+
+static const struct config_item_type plane_group_type = {
+	.ct_group_ops	= &planes_group_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
 static ssize_t device_enabled_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_device *dev;
@@ -137,6 +234,10 @@ static struct config_group *make_device_group(struct config_group *group,
 	config_group_init_type_name(&dev->group, name, &device_item_type);
 	mutex_init(&dev->lock);
 
+	config_group_init_type_name(&dev->planes_group, "planes",
+				    &plane_group_type);
+	configfs_add_default_group(&dev->planes_group, &dev->group);
+
 	return &dev->group;
 }
 
-- 
2.48.1

