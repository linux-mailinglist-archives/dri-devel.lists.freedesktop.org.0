Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DDDA44942
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 19:00:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02D510E69E;
	Tue, 25 Feb 2025 18:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IZ++wBVS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F3710E4C9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:59:46 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43995b907cfso37450395e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740506385; x=1741111185; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g4KkuzN3YdsW2noIqZOCpqoqa4GrMlri4rj4Q/z0qqo=;
 b=IZ++wBVSSzrJ6zuTMVoZMFcRo4YuWs+q7BUb6WTptS8Klgzhqd+S7Oz/3Db5j6xG5I
 T5hlxjyg2/uhbX6Pzrfm5BX/QOJ/ycqLzFghzltTS4zsAmB5Nf+RQoYsrHjG4ADZ6so+
 IWo/jAPFvk8b8ql051Vjy210JO9twP0rmP5NckZzUt3g8jPxLOsFoKeGzoI25rr04urF
 Vzl45As68KqCah1hOLXu8u1r0Gw/vQ5jhoqnm9LlfIh4sz9aCgsznvr06zg7eNrYBdkk
 t78Bst+A9cNz/unu3GMi/m4TCnoCpR8sWHPCOrmcqFKjIMZu3O3AYq/9NWwoNN5NCddy
 7W8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506385; x=1741111185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g4KkuzN3YdsW2noIqZOCpqoqa4GrMlri4rj4Q/z0qqo=;
 b=QDj0vbRxzbVwGhayY+P4U2/rb3FNNZ1+dy9GvLzDA1uveC0D72EpD7p1Llfat6vIms
 UIHouLKfUk1JpGZUXWw/5pTz31nfxcP/jzQ8u6up/KdFY+n1HPEt/SALUEPMeXdEwvSJ
 Wq/rCzRnKZG12rL/mBmhXbTtuFbJh6WoOcBQX3KaXGKHcydYDFCs/NuFrwTKlgPHRxmk
 7XrxnjbJ5viPmJHQ179v1W+D6MPAYizyzBi6FyrRc9Eh5i6BhuHHSR8Gq3yxVBPb4hzT
 blxUP34PWjFRPrZJqZBrQeJZbeqTVQ8cS8lDK8VhJPpGNsSM4doKGlrSBxGvoMiGdI6w
 lPuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN9Vpo3TxhAuRqTpY0NNLuE6mMS1XzXmi1OmHv76INinSYkTk4W/D50/ryAhp7MvxdvdePbSjEtIQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyN7+Bjqn7KM7AVUayNC4fZhZEuL0tIkrXPt+frZ5tYA2XsUAg0
 HwRvqQVc7agpKnSBE2LodUkjwR6HJwYsrno5ITn2nMY8Rd4U+D2Y
X-Gm-Gg: ASbGncts4YDxq1Jc5MY2OjHmhUtCXWrgbLhpAKa5tM5cu6K8QQRPu6qqj4Kx8NvSKBh
 qfUsdqfirAlRFyRRKQ97BON3s+pwx87NTjf87uN7I/TzlWhzWUbg2CM4wG0xuCq70UjPu8HXwoA
 NFp50bcx4S6r0549AlLTXLt/wfC3dBCoO3iEs58EOX+OBVb3fCdoKKNx3meNGKvuh1w496lignS
 KIf7cJ0KgsqlR3syb0IckYAXuwWL7UK++LtOWszIeQ0cs00EYMgjVx4C7qqJ/XKJppaKuYvc+hH
 +XR5orztIHD3teJJebi/8SjUQZND
X-Google-Smtp-Source: AGHT+IHo42lY7FnvR0p1Ete6FL/ExPhlesqNSGcsVd2G9FTBSK+yI0MIu82ukvvcb1oHod4TNQdN6A==
X-Received: by 2002:a05:600c:198e:b0:439:9e53:49d8 with SMTP id
 5b1f17b1804b1-43ab0f979cdmr45977615e9.30.1740506384463; 
 Tue, 25 Feb 2025 09:59:44 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f3e15sm149063655e9.22.2025.02.25.09.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:59:43 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 03/16] drm/vkms: Allow to configure multiple planes via
 configfs
Date: Tue, 25 Feb 2025 18:59:23 +0100
Message-ID: <20250225175936.7223-4-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225175936.7223-1-jose.exposito89@gmail.com>
References: <20250225175936.7223-1-jose.exposito89@gmail.com>
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           | 16 ++++-
 drivers/gpu/drm/vkms/vkms_configfs.c | 87 ++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+), 1 deletion(-)

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
index 92512d52ddae..4f9d3341e6c0 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -16,6 +16,7 @@ static bool is_configfs_registered;
  *
  * @group: Top level configuration group that represents a VKMS device.
  * Initialized when a new directory is created under "/config/vkms/"
+ * @planes_group: Default subgroup of @group at "/config/vkms/planes"
  * @lock: Lock used to project concurrent access to the configuration attributes
  * @config: Protected by @lock. Configuration of the VKMS device
  * @enabled: Protected by @lock. The device is created or destroyed when this
@@ -23,16 +24,98 @@ static bool is_configfs_registered;
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
+	guard(mutex)(lock);
+	vkms_config_destroy_plane(plane->config);
+	kfree(plane);
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
+
+	dev = child_group_to_vkms_configfs_device(group);
+
+	guard(mutex)(&dev->lock);
+
+	if (dev->enabled)
+		return ERR_PTR(-EBUSY);
+
+	plane = kzalloc(sizeof(*plane), GFP_KERNEL);
+	if (!plane)
+		return ERR_PTR(-ENOMEM);
+
+	plane->dev = dev;
+
+	plane->config = vkms_config_create_plane(dev->config);
+	if (IS_ERR(plane->config)) {
+		kfree(plane);
+		return ERR_CAST(plane->config);
+	}
+
+	config_group_init_type_name(&plane->group, name, &plane_item_type);
+
+	return &plane->group;
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
@@ -125,6 +208,10 @@ static struct config_group *make_device_group(struct config_group *group,
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

