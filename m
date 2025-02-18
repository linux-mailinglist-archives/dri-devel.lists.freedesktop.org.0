Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A48E9A3A3A2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 18:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F90810E45D;
	Tue, 18 Feb 2025 17:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PtxY3Vnt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A36810E418
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 17:08:27 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4396f579634so20766715e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 09:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739898505; x=1740503305; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ve8gYYXgy7/64VPreNjA6gL3Ezxa0nJl8754eZoTxPM=;
 b=PtxY3VntcANCkd6/nZtlteZWqSncm26RcxRBMab/jqW7ErfDAukws4DeSISlrMCoHe
 r2e17GgqHzNbXB/vgWtrM/Rk1RRGUDYGaJl9DPRladxUMRmbdD2i4N40YFMSE5Qc8Yo1
 iZxA3zOGcG+tmZeLClri6LPBw0ePVL/Kp2yh0qglI6z2NnFJ8X3S1+hsHSZ0+TFOyJdb
 mzIFUfSz+q56HfxXmqr6KrN43qMvFfjycQw+TV4FIp/fcwGEjya7AH3ay6eCwDtZx81Q
 aTdWS9uWtf/sJPm0m7ZDEsC+SOX0T5GvJPzF7s3ONXjb0lnkrXG+F9FOw2ISfoKRsfcp
 15VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739898505; x=1740503305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ve8gYYXgy7/64VPreNjA6gL3Ezxa0nJl8754eZoTxPM=;
 b=Mnn8udpWmqyClAQTyJZLGPyYLgauQn+DD6PGQC8eJOPA4K5UCTp+V+YrZC96maA9NC
 nRLlq8lCGWUTl0TGRL2Qg93kM/3Btd16L7a45sNV9mF2nlu1KYBQGphOOK3s5Tps4pKI
 LdXyEaX8A0vkzmJeDNLmcrWju5Z+AuYHGvp+0FpfMGqzt+rp+TMlHKOWWz0gAIxDRq8W
 arLYQ8HCWqtnkhn9MICybV+dPxBYj6ajGBUAaP/bAj6sc8pYjfwlJOuQnEwAICGxL/ad
 3x79VrS0A5PPfpPVCDtvGpLgx0f1GCG3Izfe0oY8HHsCWtX8QRHrHHLcj/K4uly5PXcR
 T0qQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRvuSTu9q8CiAvxHk/0+xA3RC+fRj3v04LvyEH8GBAKL4aCPgZoXeeYxSPk1Mw6/VTFuQoU4cnktA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxybb2Gcxblpho0MroO4d3/B8f3cllEqA8VyckTChTkqEuBb1gR
 MpPsGYAQFs2jSdfPAfRAWPhrPkMbgi1xYp3Fd6g18906ypoVnrXU
X-Gm-Gg: ASbGncs34jVBdM43/BdxOPEebxFfuNhFHVw09Ry/MDXgtdnrHDj0CAi1AN7n+DIuQbw
 d0JA47hK8P/1IT47pT4wzsGund1S23ul+yYO8UAavXm1R/2YZTfpJVKJ9c44j4RGoBbKWz8w4yD
 oflhvMrDv9wSPl/Vr70M7kO7eWRP8zOQmGIhDdIgteHipIqcCN+9c8BmSuoJ0PJutI+zkTxoiJ5
 tu6WR17FgKOj6c66KN/r5EwKKg0JtFOPv92Rb/ZC/ykmdutXCJOOiFrkKMT+/fPONMgyhBM/yfP
 3w3vOkqEWL/gTa+qBg==
X-Google-Smtp-Source: AGHT+IGmly+ynTiNsVzHpyu5bN60h1mqH3TEwz4cVT9xPOFUwl9vP/Rmkjriv0H/tD9iti+dt9LUDQ==
X-Received: by 2002:a05:600c:354c:b0:439:9951:1220 with SMTP id
 5b1f17b1804b1-43999da7d5emr4465085e9.13.1739898505333; 
 Tue, 18 Feb 2025 09:08:25 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439941bd54bsm24680135e9.11.2025.02.18.09.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 09:08:24 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 10/16] drm/vkms: Allow to configure multiple connectors via
 configfs
Date: Tue, 18 Feb 2025 18:08:02 +0100
Message-ID: <20250218170808.9507-11-jose.exposito89@gmail.com>
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

Create a default subgroup at
/config/vkms/connectors to allow to create as many connectors as
required.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |   6 ++
 drivers/gpu/drm/vkms/vkms_configfs.c | 100 +++++++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 6a15af0b7317..3dd55c3e8900 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -74,6 +74,7 @@ By default, the instance is disabled::
 And directories are created for each configurable item of the display pipeline::
 
   tree /config/vkms/my-vkms
+  ├── connectors
   ├── crtcs
   ├── enabled
   ├── encoders
@@ -102,6 +103,10 @@ Next, create one or more encoders::
 
   sudo mkdir /config/vkms/my-vkms/encoders/encoder0
 
+Last but not least, create one or more connectors::
+
+  sudo mkdir /config/vkms/my-vkms/connectors/connector0
+
 To finish the configuration, link the different pipeline items::
 
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
@@ -126,6 +131,7 @@ And removing the top level directory and its subdirectories::
   sudo rmdir /config/vkms/my-vkms/planes/*
   sudo rmdir /config/vkms/my-vkms/crtcs/*
   sudo rmdir /config/vkms/my-vkms/encoders/*
+  sudo rmdir /config/vkms/my-vkms/connectors/*
   sudo rmdir /config/vkms/my-vkms
 
 Testing With IGT
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 66c8a66f7b2b..cd8a164bda3d 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -18,6 +18,7 @@ static bool is_configfs_registered;
  * @planes_group: Default subgroup of @group at "/config/vkms/planes"
  * @crtcs_group: Default subgroup of @group at "/config/vkms/crtcs"
  * @encoders_group: Default subgroup of @group at "/config/vkms/encoders"
+ * @connectors_group: Default subgroup of @group at "/config/vkms/connectors"
  * @lock: Lock used to project concurrent access to the configuration attributes
  * @config: Protected by @lock. Configuration of the VKMS device
  * @enabled: Protected by @lock. The device is created or destroyed when this
@@ -28,6 +29,7 @@ struct vkms_configfs_device {
 	struct config_group planes_group;
 	struct config_group crtcs_group;
 	struct config_group encoders_group;
+	struct config_group connectors_group;
 
 	struct mutex lock;
 	struct vkms_config *config;
@@ -80,6 +82,20 @@ struct vkms_configfs_encoder {
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
@@ -105,6 +121,10 @@ struct vkms_configfs_encoder {
 	container_of(to_config_group((item)), struct vkms_configfs_encoder, \
 		     possible_crtcs_group)
 
+#define connector_item_to_vkms_configfs_connector(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_connector, \
+		     group)
+
 static ssize_t crtc_writeback_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_crtc *crtc;
@@ -540,6 +560,82 @@ static const struct config_item_type encoder_group_type = {
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
+	mutex_lock(lock);
+	vkms_config_destroy_connector(connector->config);
+	kfree(connector);
+	mutex_unlock(lock);
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
+	connector = kzalloc(sizeof(*connector), GFP_KERNEL);
+	if (!connector) {
+		ret = -ENOMEM;
+		goto err_unlock;
+	}
+
+	connector->dev = dev;
+
+	connector->config = vkms_config_create_connector(dev->config);
+	if (IS_ERR(connector->config)) {
+		ret = PTR_ERR(connector->config);
+		goto err_free;
+	}
+
+	config_group_init_type_name(&connector->group, name,
+				    &connector_item_type);
+
+	mutex_unlock(&dev->lock);
+
+	return &connector->group;
+
+err_free:
+	kfree(connector);
+err_unlock:
+	mutex_unlock(&dev->lock);
+	return ERR_PTR(ret);
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
@@ -657,6 +753,10 @@ static struct config_group *make_device_group(struct config_group *group,
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

