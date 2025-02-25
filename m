Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F377EA44943
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 19:00:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E06210E724;
	Tue, 25 Feb 2025 18:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e4xmTF3m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E409510E6EE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:59:54 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43996e95114so39389545e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740506393; x=1741111193; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aWiThvun9v9oBFVV2WdtDnI+lemWxWkbnKGuQol7/Nk=;
 b=e4xmTF3mkw8GNd1WN8L/LCZIhg6DEkE0gIb0YwN6syWlY6sFF+904RmoDDjQyHqeFO
 JjdCKN7xGbBvIuKvJZMCakEo95QJ0i2cxHaPsjsOzuqo3zQrDKrCItwc4snQTMRTusfb
 Q6edwTnKcAH4R9EXJlytpmKNfB88fLaBnyoxDBYyoVJw/+Ok6L3U4pKvujkifTOn3RxM
 cQe6ALwpEjKvuF/Mb00SHXhXM4PTQ+Dy7wZeIO4R/UMyFXifqMAsPeLtT3Z0K670oe0C
 Bi1XBIJoLwVG4RBrnHXktUaP+mc5p7EjKGZkjF7Y0ngCaugT4Pb1N+rGGqFMJXQ41FeS
 sMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506393; x=1741111193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aWiThvun9v9oBFVV2WdtDnI+lemWxWkbnKGuQol7/Nk=;
 b=UNcacylLCeCO+qqS+wpZ2CFgGfjL6ZG1DZX/TsPjyggytdr7Mcm1VdKJIIkIiPl7ru
 Lz4PvQd5QJV3d4eEiPs32BpviLGHMgE/MpcYQ1J3F6NzKrplYjiNFDjqkCBv1xyx6Eo8
 ILN90e1zpc3OgBnLdShPwQtyDN11MoWodunmMHEyc4eCPKiG1IGpeiXEpTHX1qDqVR/H
 7tXH3XzIePyuA/ofObLVK+2JwVJ/Fk5dBBTu9Aog6tKSrHZ/prz+lMwOpdnYCb49s6sD
 OmnpRgRuyrPvut9Ypp7oq5bMp0JUdZIhxuif7+P0FfQSrcTCnTZqwDZLQONKfuv7uuEq
 6zlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZtG2i0ZTCRNFEGXS9IMxtQcGTtdi3ovbRwq3r+LtChiGS9e2hldajtJnhF1NioCaVcYWp/CfGf/Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyq5W0PW87Gt8xDJ6UROmmn1PYVvLDF8+B7OdQ2D0LuILmuimaC
 bgbrIlI1cRWVq/vS7YmqkG+z32WvjPpfsRnmKbsSwG0hGRMphgNp
X-Gm-Gg: ASbGncs0HjshxZpe0nijZqihIzy4M11nlBP9OndzM9DXAkpxvBK4BWxXLSkM7yeZ9Ph
 guw/2IXMbW/3EzXW6c73CcJ2xaeJ5THmDyqx6X7AO4Q/9/Q4HbcFO5G/Hys9n9ndBzT15R47LiK
 aF07rPggjrXkkI4nXLt3WhevUuLuo24F5JgRh9xBqmlrrW9tjG/ukROJUuy7p1GDBq3x3+1ThAd
 1P3j60ypA5ii2jgAMpydSjgyyd8UgtpXJWDM3Hy+NkF2GwLuJDvX+MZiTE4I5qABHgBzmbgefA9
 tCOp4byX4GYD6EQPUcSZZWDVc19K
X-Google-Smtp-Source: AGHT+IG/QEmeDgGP8pEbID7bpFqeuH4nVI6f0hc07wTpQeF5+mhgQ8WHTlsm2+zkpyEBsYCIYCDp0w==
X-Received: by 2002:a05:600c:19ce:b0:439:94ef:3766 with SMTP id
 5b1f17b1804b1-439aebc3138mr147139015e9.19.1740506393230; 
 Tue, 25 Feb 2025 09:59:53 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f3e15sm149063655e9.22.2025.02.25.09.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:59:52 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 11/16] drm/vkms: Allow to attach connectors and encoders
 via configfs
Date: Tue, 25 Feb 2025 18:59:31 +0100
Message-ID: <20250225175936.7223-12-jose.exposito89@gmail.com>
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
/config/vkms/connectors/connector/possible_encoders that will contain
symbolic links to the possible encoders for the connector.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  2 +
 drivers/gpu/drm/vkms/vkms_configfs.c | 58 ++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 744e2355db23..74126d2e32e4 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -112,6 +112,7 @@ To finish the configuration, link the different pipeline items::
 
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/encoders/encoder0/possible_crtcs
+  sudo ln -s /config/vkms/my-vkms/encoders/encoder0 /config/vkms/my-vkms/connectors/connector0/possible_encoders
 
 Since at least one primary plane is required, make sure to set the right type::
 
@@ -129,6 +130,7 @@ And removing the top level directory and its subdirectories::
 
   sudo rm /config/vkms/my-vkms/planes/*/possible_crtcs/*
   sudo rm /config/vkms/my-vkms/encoders/*/possible_crtcs/*
+  sudo rm /config/vkms/my-vkms/connectors/*/possible_encoders/*
   sudo rmdir /config/vkms/my-vkms/planes/*
   sudo rmdir /config/vkms/my-vkms/crtcs/*
   sudo rmdir /config/vkms/my-vkms/encoders/*
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index bcbf91fbcd44..d4d36d2c8f3d 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -88,11 +88,14 @@ struct vkms_configfs_encoder {
  *
  * @group: Top level configuration group that represents a connector.
  * Initialized when a new directory is created under "/config/vkms/connectors"
+ * @possible_encoders_group: Default subgroup of @group at
+ * "connector/possible_encoders"
  * @dev: The vkms_configfs_device this connector belongs to
  * @config: Configuration of the VKMS connector
  */
 struct vkms_configfs_connector {
 	struct config_group group;
+	struct config_group possible_encoders_group;
 	struct vkms_configfs_device *dev;
 	struct vkms_config_connector *config;
 };
@@ -126,6 +129,10 @@ struct vkms_configfs_connector {
 	container_of(to_config_group((item)), struct vkms_configfs_connector, \
 		     group)
 
+#define connector_possible_encoders_item_to_vkms_configfs_connector(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_connector, \
+		     possible_encoders_group)
+
 static ssize_t crtc_writeback_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_crtc *crtc;
@@ -511,6 +518,51 @@ static const struct config_item_type connector_item_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static int connector_possible_encoders_allow_link(struct config_item *src,
+						  struct config_item *target)
+{
+	struct vkms_configfs_connector *connector;
+	struct vkms_configfs_encoder *encoder;
+
+	if (target->ci_type != &encoder_item_type)
+		return -EINVAL;
+
+	connector = connector_possible_encoders_item_to_vkms_configfs_connector(src);
+	encoder = encoder_item_to_vkms_configfs_encoder(target);
+
+	guard(mutex)(&connector->dev->lock);
+
+	if (connector->dev->enabled)
+		return -EBUSY;
+
+	return vkms_config_connector_attach_encoder(connector->config,
+						    encoder->config);
+}
+
+static void connector_possible_encoders_drop_link(struct config_item *src,
+						  struct config_item *target)
+{
+	struct vkms_configfs_connector *connector;
+	struct vkms_configfs_encoder *encoder;
+
+	connector = connector_possible_encoders_item_to_vkms_configfs_connector(src);
+	encoder = encoder_item_to_vkms_configfs_encoder(target);
+
+	guard(mutex)(&connector->dev->lock);
+	vkms_config_connector_detach_encoder(connector->config,
+					     encoder->config);
+}
+
+static struct configfs_item_operations connector_possible_encoders_item_operations = {
+	.allow_link	= connector_possible_encoders_allow_link,
+	.drop_link	= connector_possible_encoders_drop_link,
+};
+
+static const struct config_item_type connector_possible_encoders_group_type = {
+	.ct_item_ops	= &connector_possible_encoders_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
 static struct config_group *make_connector_group(struct config_group *group,
 						 const char *name)
 {
@@ -539,6 +591,12 @@ static struct config_group *make_connector_group(struct config_group *group,
 	config_group_init_type_name(&connector->group, name,
 				    &connector_item_type);
 
+	config_group_init_type_name(&connector->possible_encoders_group,
+				    "possible_encoders",
+				    &connector_possible_encoders_group_type);
+	configfs_add_default_group(&connector->possible_encoders_group,
+				   &connector->group);
+
 	return &connector->group;
 }
 
-- 
2.48.1

