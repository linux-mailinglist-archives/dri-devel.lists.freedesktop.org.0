Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 598DBA3A39B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 18:08:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A356610E3F4;
	Tue, 18 Feb 2025 17:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zo7VAzlq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF0E10E2B8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 17:08:21 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43996e95114so5925855e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 09:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739898500; x=1740503300; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2duRuE/yZVXOXN/jBplEXsWwBrq6X3padZ2YIHFcxIY=;
 b=Zo7VAzlqmHPMRRGjVlIbqfcqVdIypDf3mdIyke/RUyUMXLiZ7dFhtBPPKAnF1ityXV
 mWIHtPfS69u4LkiKFUvCMJhd1YcMlJYO5Umbv78PK6ARoZNnwda4WFUpeh9CpePN69Kb
 I1yWhPRKZOo7Ud4aLz73jRMJooQxZOT0qsmtdsb/jnvzXmb6LpQmj07pUtdweRcksIIM
 5yE0mVgecSp2sErydHlFFbwFoVTgzSUENeE3f+05BUVzcL0afvxiraS7sGyQZoBDMFzV
 rIgOCF146Ag2/xBVpZyL5EhHt+xVvA7H9sIKwKFMSaPD4gb4gJWr8Wuj/b9ghFuL1O05
 jaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739898500; x=1740503300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2duRuE/yZVXOXN/jBplEXsWwBrq6X3padZ2YIHFcxIY=;
 b=FmrkMrCRWFoIGO8upq/UtaXopL8x6hVtclelsWQmXKb31PxXYn5rTQIZ8PFEDaHksO
 Kw7e1lUnuMjj4d6jxlfMe8fhzyjfY26T260473PujToVSwdp6FEeGeatZhmsLIhnUd7M
 +bSRyvJKZm5tNzV92MRziYcjFv37/59Dhdm64BPiUVkMhwzQgG4pIGS3Pz5A36vVOSiQ
 /nJaUr/BZxZhFaOfVEBSH13AbiBxIXjX7QsPR23JVjYewec8F2IdJt+E8orz/lt3w+t5
 ddDeW/unlMrom/JSPOTYFil0W0sBYMEXsAg/4BMVsy+Q245QxhyvCUTvFsQ5mGdpjEFv
 JR3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXybVLcL948w2zJKCgxLJQi2GH4DOc34PppHkota2RJ//JNOi0U7RjqnqfdtcF0H+6EcX0Kfo4/luk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy70Z9OZ2j4sxjKO1j80xI5xrZL7tcZBJNhTTma6+PWgR93Uj3g
 h1eC+SWAm2QBjCYrGOdzmtU3P7to3avMwxAMas/RouZpYGMmt+Ea
X-Gm-Gg: ASbGnct8pJeZz6DDv0KuebLCrZgqZR3mG8CHeqJ9lCYxHk2hpdi3npBAYEUYqBlj7ER
 YadRDFYjyhuWa6HIZZRl9dNDVR55J5ZtIhPLJwp8Ipj9iY9tekeu3e86MRdkbK889hG21Z1/eqC
 xBBDjls8teA/Xe6BXQQc8VD3VWftQkdyQX4Lfy4KboCbCjhLQaTBa4SgW4KnsYNEzL0AABpXn2L
 ADxWbutG/xHDWRqcd0FhtjxVw8EPRd8MTy7HZphXcfD3iSqPkJn5+MDBndHAWWwQsjITlHWbtOY
 EA17MK1P2htiLS1xVg==
X-Google-Smtp-Source: AGHT+IExW6UuaTDCAVrVvvER/ec1B5FRhWSiJKQBV1MNTPXbV9fjpuD31Qx9KXMPB/93kGDF8ru3hQ==
X-Received: by 2002:a05:600c:354f:b0:439:6b57:c6b with SMTP id
 5b1f17b1804b1-4396e700738mr127330165e9.17.1739898499450; 
 Tue, 18 Feb 2025 09:08:19 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439941bd54bsm24680135e9.11.2025.02.18.09.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 09:08:18 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 05/16] drm/vkms: Allow to configure multiple CRTCs via configfs
Date: Tue, 18 Feb 2025 18:07:57 +0100
Message-ID: <20250218170808.9507-6-jose.exposito89@gmail.com>
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

Create a default subgroup at /config/vkms/crtcs to allow to create as
many CRTCs as required.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  6 ++
 drivers/gpu/drm/vkms/vkms_configfs.c | 98 ++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index d95f228de05b..da5157adfd79 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -74,6 +74,7 @@ By default, the instance is disabled::
 And directories are created for each configurable item of the display pipeline::
 
   tree /config/vkms/my-vkms
+  ├── crtcs
   ├── enabled
   └── planes
 
@@ -88,6 +89,10 @@ Planes have 1 configurable attribute:
 
 - type: Plane type: 0 overlay, 1 primary, 2 cursor
 
+Continue by creating one or more CRTCs::
+
+  sudo mkdir /config/vkms/my-vkms/crtcs/crtc0
+
 Once you are done configuring the VKMS instance, enable it::
 
   echo "1" | sudo tee /config/vkms/my-vkms/enabled
@@ -99,6 +104,7 @@ Finally, you can remove the VKMS instance disabling it::
 And removing the top level directory and its subdirectories::
 
   sudo rmdir /config/vkms/my-vkms/planes/*
+  sudo rmdir /config/vkms/my-vkms/crtcs/*
   sudo rmdir /config/vkms/my-vkms
 
 Testing With IGT
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 093735f47858..52205a8a9cb4 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -16,6 +16,7 @@ static bool is_configfs_registered;
  * @group: Top level configuration group that represents a VKMS device.
  * Initialized when a new directory is created under "/config/vkms/"
  * @planes_group: Default subgroup of @group at "/config/vkms/planes"
+ * @crtcs_group: Default subgroup of @group at "/config/vkms/crtcs"
  * @lock: Lock used to project concurrent access to the configuration attributes
  * @config: Protected by @lock. Configuration of the VKMS device
  * @enabled: Protected by @lock. The device is created or destroyed when this
@@ -24,6 +25,7 @@ static bool is_configfs_registered;
 struct vkms_configfs_device {
 	struct config_group group;
 	struct config_group planes_group;
+	struct config_group crtcs_group;
 
 	struct mutex lock;
 	struct vkms_config *config;
@@ -44,6 +46,20 @@ struct vkms_configfs_plane {
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
@@ -54,6 +70,84 @@ struct vkms_configfs_plane {
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
+	mutex_lock(lock);
+	vkms_config_destroy_crtc(crtc->dev->config, crtc->config);
+	kfree(crtc);
+	mutex_unlock(lock);
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
+	crtc = kzalloc(sizeof(*crtc), GFP_KERNEL);
+	if (!crtc) {
+		ret = -ENOMEM;
+		goto err_unlock;
+	}
+
+	crtc->dev = dev;
+
+	crtc->config = vkms_config_create_crtc(dev->config);
+	if (IS_ERR(crtc->config)) {
+		ret = PTR_ERR(crtc->config);
+		goto err_free;
+	}
+
+	config_group_init_type_name(&crtc->group, name, &crtc_item_type);
+
+	mutex_unlock(&dev->lock);
+
+	return &crtc->group;
+
+err_free:
+	kfree(crtc);
+err_unlock:
+	mutex_unlock(&dev->lock);
+	return ERR_PTR(ret);
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
@@ -289,6 +383,10 @@ static struct config_group *make_device_group(struct config_group *group,
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

