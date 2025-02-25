Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2BDA44949
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 19:00:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943B010E787;
	Tue, 25 Feb 2025 18:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qn3H1HqM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB58D10E6EE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:59:53 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4399ee18a57so362735e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740506392; x=1741111192; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0WseHHM1e/WuDgTg/fwsfkleyEd/vJ3pyq4Ce8rsGHo=;
 b=Qn3H1HqMe4BKymNIfsKvPiv4GCFRfwypG67GzXU1f2X2+qDzAAxqZp+qyZvuGWhmwc
 lHfwtIN64zPvV9Pfw1KhwQhzZsc29mdX6ga3Zi2e+XCLa9qUa27LG8px0JA6MBF2VlZs
 J7uU0g+Bx5/Rt2ZMtAuq/IcBsL8RMcH2roIaEndsTJEGaCxCI7QuQMGvJm/WRGg5n4K+
 xTOgefhCaCSDCOWm75g54KXltbUdNl6DkXrErH2U8wEcxurDqo5reoybnx33/BzKDVF/
 OQ3CXP/H9NOt2vLZgSrP4ZVOc0per/sq71fuKl89Za97s0K01T4hPS9nr6fwniXmAkkq
 g+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506392; x=1741111192;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0WseHHM1e/WuDgTg/fwsfkleyEd/vJ3pyq4Ce8rsGHo=;
 b=D6yHeHD0AUlakQ28EdVLFNtZ16PiKEoXTgeNYqMIuugDvrPjPb81fHyGQk+/swNxpt
 FNccWFua8DTm+tRz6Xd/UwxKzNG/QjuzXbjeKW/R0OQF7LuxSxyhIYv0I5Zi0TJWZUm0
 KR8MSI0fPmgKzBUfcN+XcNovwdkhPxds6lDAKkFwSU1iSu0HW29pPWOJrxFimatUSDRZ
 IDQYFQ1Gn5jArazBO6K7jUHRhQr8KVwUgH+hFknBrr1AaobAtOjseh/nV5XQtreJxU+P
 k8y8hD2xbZgNDlp16yviRSqhD7CfDaiWNk1CFrkovfpXGlmfj5XU0bo8oLKsLld1Xx9U
 ApNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLE55YTgQe9qQF/ss+pqRreFPkSMiVNp9jdt/6d8slCqXWnoDBFUkPwmyuPAN/lsTPrrtlfTFf/KY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlRXAI4sOsCcyFl2wzX5Ags1dDQGC46hNWv4RmCLv9jfH/sDtu
 hVk7WYZSe5H/l/d3opEYOHX5bXjkQ2nZ9KPlnorpjAmy/bUHSHnd
X-Gm-Gg: ASbGncuhUBvfydBTd/ldUTZRV91YDowDIbDJ1Dbq50roLGtJ+mF2HtfcwpAmNAJl5n5
 FUH+Rdv5mPRpyjfC53/ekciprNS2WOVGgOJ0vzzyMJ9HktHoPYyWGaLjOIZ9V/+RcyH9xwI6plr
 Jcqvfy2V81eWdBXpq9F4uU44kABsJGt2fmpMxWq0r8rjSGy+rhiiftDLO/CAO7PIr+ADHCoos2V
 krHhRl4AJPaYCo/ytc7w5ih2lCuMnXifrmPRD0MQxY4Kb3uszIUX7D2LCa2KcDTy5qWzyonRcpl
 78naXKWUFxYYi0q0qO3daR0BK5cc
X-Google-Smtp-Source: AGHT+IFMAiFjDJbbuzZZaSIag4FnPbXCSWUSYHSMiX/Uiybv87JNBZ27yyUVQxEKr+V2yQ7kikWXmw==
X-Received: by 2002:a05:600c:88a:b0:439:91c7:895a with SMTP id
 5b1f17b1804b1-439a30af6edmr185928635e9.7.1740506392239; 
 Tue, 25 Feb 2025 09:59:52 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f3e15sm149063655e9.22.2025.02.25.09.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:59:51 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 10/16] drm/vkms: Allow to configure multiple connectors via
 configfs
Date: Tue, 25 Feb 2025 18:59:30 +0100
Message-ID: <20250225175936.7223-11-jose.exposito89@gmail.com>
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

Create a default subgroup at
/config/vkms/connectors to allow to create as many connectors as
required.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  6 ++
 drivers/gpu/drm/vkms/vkms_configfs.c | 86 ++++++++++++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 650dbfa76f59..744e2355db23 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -74,6 +74,7 @@ By default, the instance is disabled::
 And directories are created for each configurable item of the display pipeline::
 
   tree /config/vkms/my-vkms
+  ├── connectors
   ├── crtcs
   ├── enabled
   ├── encoders
@@ -103,6 +104,10 @@ Next, create one or more encoders::
 
   sudo mkdir /config/vkms/my-vkms/encoders/encoder0
 
+Last but not least, create one or more connectors::
+
+  sudo mkdir /config/vkms/my-vkms/connectors/connector0
+
 To finish the configuration, link the different pipeline items::
 
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
@@ -127,6 +132,7 @@ And removing the top level directory and its subdirectories::
   sudo rmdir /config/vkms/my-vkms/planes/*
   sudo rmdir /config/vkms/my-vkms/crtcs/*
   sudo rmdir /config/vkms/my-vkms/encoders/*
+  sudo rmdir /config/vkms/my-vkms/connectors/*
   sudo rmdir /config/vkms/my-vkms
 
 Testing With IGT
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 64aa10cd3156..bcbf91fbcd44 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -19,6 +19,7 @@ static bool is_configfs_registered;
  * @planes_group: Default subgroup of @group at "/config/vkms/planes"
  * @crtcs_group: Default subgroup of @group at "/config/vkms/crtcs"
  * @encoders_group: Default subgroup of @group at "/config/vkms/encoders"
+ * @connectors_group: Default subgroup of @group at "/config/vkms/connectors"
  * @lock: Lock used to project concurrent access to the configuration attributes
  * @config: Protected by @lock. Configuration of the VKMS device
  * @enabled: Protected by @lock. The device is created or destroyed when this
@@ -29,6 +30,7 @@ struct vkms_configfs_device {
 	struct config_group planes_group;
 	struct config_group crtcs_group;
 	struct config_group encoders_group;
+	struct config_group connectors_group;
 
 	struct mutex lock;
 	struct vkms_config *config;
@@ -81,6 +83,20 @@ struct vkms_configfs_encoder {
 	struct vkms_config_encoder *config;
 };
 
+/**
+ * struct vkms_configfs_connector - Configfs representation of a connector
+ *
+ * @group: Top level configuration group that represents a connector.
+ * Initialized when a new directory is created under "/config/vkms/connectors"
+ * @dev: The vkms_configfs_device this connector belongs to
+ * @config: Configuration of the VKMS connector
+ */
+struct vkms_configfs_connector {
+	struct config_group group;
+	struct vkms_configfs_device *dev;
+	struct vkms_config_connector *config;
+};
+
 #define device_item_to_vkms_configfs_device(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_device, \
 		     group)
@@ -106,6 +122,10 @@ struct vkms_configfs_encoder {
 	container_of(to_config_group((item)), struct vkms_configfs_encoder, \
 		     possible_crtcs_group)
 
+#define connector_item_to_vkms_configfs_connector(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_connector, \
+		     group)
+
 static ssize_t crtc_writeback_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_crtc *crtc;
@@ -469,6 +489,68 @@ static const struct config_item_type encoder_group_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static void connector_release(struct config_item *item)
+{
+	struct vkms_configfs_connector *connector;
+	struct mutex *lock;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+	lock = &connector->dev->lock;
+
+	guard(mutex)(lock);
+	vkms_config_destroy_connector(connector->config);
+	kfree(connector);
+}
+
+static struct configfs_item_operations connector_item_operations = {
+	.release	= &connector_release,
+};
+
+static const struct config_item_type connector_item_type = {
+	.ct_item_ops	= &connector_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *make_connector_group(struct config_group *group,
+						 const char *name)
+{
+	struct vkms_configfs_device *dev;
+	struct vkms_configfs_connector *connector;
+
+	dev = child_group_to_vkms_configfs_device(group);
+
+	guard(mutex)(&dev->lock);
+
+	if (dev->enabled)
+		return ERR_PTR(-EBUSY);
+
+	connector = kzalloc(sizeof(*connector), GFP_KERNEL);
+	if (!connector)
+		return ERR_PTR(-ENOMEM);
+
+	connector->dev = dev;
+
+	connector->config = vkms_config_create_connector(dev->config);
+	if (IS_ERR(connector->config)) {
+		kfree(connector);
+		return ERR_CAST(connector->config);
+	}
+
+	config_group_init_type_name(&connector->group, name,
+				    &connector_item_type);
+
+	return &connector->group;
+}
+
+static struct configfs_group_operations connectors_group_operations = {
+	.make_group	= &make_connector_group,
+};
+
+static const struct config_item_type connector_group_type = {
+	.ct_group_ops	= &connectors_group_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
 static ssize_t device_enabled_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_device *dev;
@@ -573,6 +655,10 @@ static struct config_group *make_device_group(struct config_group *group,
 				    &encoder_group_type);
 	configfs_add_default_group(&dev->encoders_group, &dev->group);
 
+	config_group_init_type_name(&dev->connectors_group, "connectors",
+				    &connector_group_type);
+	configfs_add_default_group(&dev->connectors_group, &dev->group);
+
 	return &dev->group;
 }
 
-- 
2.48.1

