Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E412A4493D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 18:59:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38AC810E69F;
	Tue, 25 Feb 2025 17:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dV3kkkU7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2F510E4C9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:59:48 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43998deed24so56447295e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740506387; x=1741111187; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nC1+hzLjpAD0CpG9te0z8ab5IM3YNOmmBls2ySCSckA=;
 b=dV3kkkU7hwvhUxNKmRD5ycvozh3uLf7MI4QzmyYtyfIfxHYqoBRGdoFFhnzWH7oTCQ
 LSuBizuqQQyR7A293f0s67rIZFKC30m6mKJyylxjyGaSXlRjjWPPeTXIzhtDcUOzXDZi
 FXQ2bopESduf2/ned0nE6E5xJu7DzgsPQ3vocleukD9vmKzGLq8l/j3fZy7IApLmJJTc
 yYZEm/jr1QmJIDqpO9aGWdaWNkyBvJdt0ilE7yob4+hWx3jAG8Jb/LxTkJg/hdSElpN6
 LV9TyIxGwu13Q+xjREtw9Y1omLkkeCneQ7fqNjBWLKWLDHAHCnFF4MeFHn97uOnhmLIu
 OW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506387; x=1741111187;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nC1+hzLjpAD0CpG9te0z8ab5IM3YNOmmBls2ySCSckA=;
 b=h7hsdpXTVKmHiUQAsz7PMwR9WMb0YhK4mSdd0XOBRJ6qNPaa3aqzRsz5kGlQVoxuhH
 nPlnZN6BDNHb+8jcvRRKgFv/GAQr5aR/8F0y6qJBXtqgwWU9YgW1zNun6HSv6qEAbnCU
 KpDx6Oy37qGiN4H835tzMPq6rKHXd1qYE65mc+89nNUAG48Tdeb+6zW60B8exlWnKz15
 z74h7HteCAwR6GWd2B6DIioiJp88fmcfwypa7qB5pr3xkkxeV1ikihJpy+166lf9Q/pY
 aX+hy44vH7TsJSKJcVzQIHx5GaZxnP4tik1vnDc0+MMPMC/LJZCVaFGXNjGAKmX6BoUJ
 EwzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtURJ6d0tzmEhdML5b2EEFjYir9SEJ3jGRhK3dfCYYeNwQiO4cEftEh34YEa+Bzi22+Ax+juPd1I8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfePQxA0DdAHpBhvipM1/q9nRs3WJFvtAigbBWrVCLzrksKhjX
 6ioi10sMND7kTt3RMfjLg9wIWnmXI88Q2CiTC78ZX6+1WPbpR72G
X-Gm-Gg: ASbGncu61gV5LiR8HtzW5v6cMZps0xTqm/4FyuXsIexXt0WszDglUeEJyzjIYA+HOJl
 VCcx8NeiZULdbifRlyEClAz5EhozC8k1lQ4XZz20fO2tyN3w1/4O89xGC89Q1+wZonBLAIRXXiK
 mJ+vpkh/BJTxr3MXpYHKoeTCyBw8zJmb0rjDgKX9Y+lahaHM7cFEcZ0RqDskGaqCN2+C8OEY3xi
 dFIyGNTI5VhUVUoHpk4FW9Rv3lgxckzYmW90INSqPAloCSNlNF+FsWt+NTEzm4l8ZpKQ426GNmh
 cuZEC8IVk4AClEr1jkiUtKPPruuE
X-Google-Smtp-Source: AGHT+IGyYnb11gZgclvRVsL9ItAF6/JENZwu39j6igcuRB0HwP1x3A2vZbkH/rqQYAL9dpUt1LRpVg==
X-Received: by 2002:a05:600c:450d:b0:439:9a43:dd62 with SMTP id
 5b1f17b1804b1-439aebb2d6fmr119679735e9.24.1740506386934; 
 Tue, 25 Feb 2025 09:59:46 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f3e15sm149063655e9.22.2025.02.25.09.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:59:46 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 05/16] drm/vkms: Allow to configure multiple CRTCs via
 configfs
Date: Tue, 25 Feb 2025 18:59:25 +0100
Message-ID: <20250225175936.7223-6-jose.exposito89@gmail.com>
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

Create a default subgroup at /config/vkms/crtcs to allow to create as
many CRTCs as required.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  6 ++
 drivers/gpu/drm/vkms/vkms_configfs.c | 84 ++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index a87e0925bebb..e0699603ef53 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -74,6 +74,7 @@ By default, the instance is disabled::
 And directories are created for each configurable item of the display pipeline::
 
   tree /config/vkms/my-vkms
+  ├── crtcs
   ├── enabled
   └── planes
 
@@ -89,6 +90,10 @@ Planes have 1 configurable attribute:
 - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
   exposed by the "type" property of a plane)
 
+Continue by creating one or more CRTCs::
+
+  sudo mkdir /config/vkms/my-vkms/crtcs/crtc0
+
 Once you are done configuring the VKMS instance, enable it::
 
   echo "1" | sudo tee /config/vkms/my-vkms/enabled
@@ -100,6 +105,7 @@ Finally, you can remove the VKMS instance disabling it::
 And removing the top level directory and its subdirectories::
 
   sudo rmdir /config/vkms/my-vkms/planes/*
+  sudo rmdir /config/vkms/my-vkms/crtcs/*
   sudo rmdir /config/vkms/my-vkms
 
 Testing With IGT
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index c2e1eef75906..1483f47244e6 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -17,6 +17,7 @@ static bool is_configfs_registered;
  * @group: Top level configuration group that represents a VKMS device.
  * Initialized when a new directory is created under "/config/vkms/"
  * @planes_group: Default subgroup of @group at "/config/vkms/planes"
+ * @crtcs_group: Default subgroup of @group at "/config/vkms/crtcs"
  * @lock: Lock used to project concurrent access to the configuration attributes
  * @config: Protected by @lock. Configuration of the VKMS device
  * @enabled: Protected by @lock. The device is created or destroyed when this
@@ -25,6 +26,7 @@ static bool is_configfs_registered;
 struct vkms_configfs_device {
 	struct config_group group;
 	struct config_group planes_group;
+	struct config_group crtcs_group;
 
 	struct mutex lock;
 	struct vkms_config *config;
@@ -45,6 +47,20 @@ struct vkms_configfs_plane {
 	struct vkms_config_plane *config;
 };
 
+/**
+ * struct vkms_configfs_crtc - Configfs representation of a CRTC
+ *
+ * @group: Top level configuration group that represents a CRTC.
+ * Initialized when a new directory is created under "/config/vkms/crtcs"
+ * @dev: The vkms_configfs_device this CRTC belongs to
+ * @config: Configuration of the VKMS CRTC
+ */
+struct vkms_configfs_crtc {
+	struct config_group group;
+	struct vkms_configfs_device *dev;
+	struct vkms_config_crtc *config;
+};
+
 #define device_item_to_vkms_configfs_device(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_device, \
 		     group)
@@ -55,6 +71,70 @@ struct vkms_configfs_plane {
 #define plane_item_to_vkms_configfs_plane(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_plane, group)
 
+#define crtc_item_to_vkms_configfs_crtc(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_crtc, group)
+
+static void crtc_release(struct config_item *item)
+{
+	struct vkms_configfs_crtc *crtc;
+	struct mutex *lock;
+
+	crtc = crtc_item_to_vkms_configfs_crtc(item);
+	lock = &crtc->dev->lock;
+
+	guard(mutex)(lock);
+	vkms_config_destroy_crtc(crtc->dev->config, crtc->config);
+	kfree(crtc);
+}
+
+static struct configfs_item_operations crtc_item_operations = {
+	.release	= &crtc_release,
+};
+
+static const struct config_item_type crtc_item_type = {
+	.ct_item_ops	= &crtc_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *make_crtc_group(struct config_group *group,
+					    const char *name)
+{
+	struct vkms_configfs_device *dev;
+	struct vkms_configfs_crtc *crtc;
+
+	dev = child_group_to_vkms_configfs_device(group);
+
+	guard(mutex)(&dev->lock);
+
+	if (dev->enabled)
+		return ERR_PTR(-EBUSY);
+
+	crtc = kzalloc(sizeof(*crtc), GFP_KERNEL);
+	if (!crtc)
+		return ERR_PTR(-ENOMEM);
+
+	crtc->dev = dev;
+
+	crtc->config = vkms_config_create_crtc(dev->config);
+	if (IS_ERR(crtc->config)) {
+		kfree(crtc);
+		return ERR_CAST(crtc->config);
+	}
+
+	config_group_init_type_name(&crtc->group, name, &crtc_item_type);
+
+	return &crtc->group;
+}
+
+static struct configfs_group_operations crtcs_group_operations = {
+	.make_group	= &make_crtc_group,
+};
+
+static const struct config_item_type crtc_group_type = {
+	.ct_group_ops	= &crtcs_group_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
 static ssize_t plane_type_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_plane *plane;
@@ -255,6 +335,10 @@ static struct config_group *make_device_group(struct config_group *group,
 				    &plane_group_type);
 	configfs_add_default_group(&dev->planes_group, &dev->group);
 
+	config_group_init_type_name(&dev->crtcs_group, "crtcs",
+				    &crtc_group_type);
+	configfs_add_default_group(&dev->crtcs_group, &dev->group);
+
 	return &dev->group;
 }
 
-- 
2.48.1

