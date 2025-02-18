Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44443A3A3A4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 18:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77FC10E460;
	Tue, 18 Feb 2025 17:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WWlQ9C+E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EA310E418
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 17:08:28 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so3788467f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 09:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739898506; x=1740503306; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zMh+KUfn1etWGOIGMQruCkQ1YBGyd1feerZxvX24mUE=;
 b=WWlQ9C+ErMv1iwjEwzBcqmrg/ZGrd7WG/T2j3VgwmUpPTSS7QJ1JrKOJ/odS8DR4LK
 Isntv5AdqqxYVm1sMBtN0luOcjpqSGRoH5fp2ol5PTvckW+F0CPCXktu2fSBoqww0JgG
 6N67sDEZ62B1/rM4Zr/HBLEjGl2tleDUCCAjIgP60hWQHrobDs6cO2qYQUuQPxrfQGmu
 cb6wOqJTpQKsdshKXmoQVgx3VYvV/6VHWNXn34Zv/WSuDDrLSpUnJFP1yA2K8H70XZqG
 uTLBlrbDaLveq82LZyUk4ovBb/W9C4BXPuXXVURECegMfL/9CmRrnOARY77HStnd6vhq
 gkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739898506; x=1740503306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zMh+KUfn1etWGOIGMQruCkQ1YBGyd1feerZxvX24mUE=;
 b=oHO8nz6kQoMuDps100NG0x24jB/2/UpZn5Ps5EfvQAWNpFY6lClwHeMf/2vl4qFRDh
 Podor1h43erFjbq0Til21L77tPu9jf6lAFrO0Dqtgn6FfiSKxBDfkshgp0ZcnSuqwnUs
 Jm/7S7BKuPuPHxzmNNdZymoO20em3JrlWB8opYkT8nGsWAXqZ0dTd+jiR1I3gDvETB+I
 tbryG01pWp7zRntUv9lEyjPYJ27LRCFo8EmZ0dwLpQP70u4qiHd6CDDLMEb0zPREMR4o
 Lk9W2cBgCbZWiBEzkT4VuLS5JPfsNxrIlnIax5vW2iad2xy6jnvJJFYLgsDVLkoOQmpv
 mgBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjc7IlA9FtD3OBspXtP9Bj+sWd0ICrQVQCQx9sBiSq6cUqggN8vQ/oxa/M2aolRKwU5MdL0l7nx+w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZNq3WQDWOBh1tW8ugzxWZQYnnM7MJrO3PMncfAlmiyA5Pz1Vm
 Qv7wkzkp7gm2v59D1ssIM1UA574RRtykD+5rE9kZ2TayKsVfWRhL
X-Gm-Gg: ASbGnctSdlSk2VCWAdglMfdE1StB94TqQAY0ZY0yU/BzYALlA8aQBiBZ1gqc4NXJJk/
 HJ5w/4299pTTQpqvbPQo/BZ8p4JYfej0f9do3NhfQyfZksLMGCObeE7kGPtuWbVkRPTLqOst1s2
 eE27/3nZELl6F++lNRq8Wq6mbHZzj43pj7Clb1wthvLZnuPEZdfuzEqtHQ1o5D28J7oUYGHMTyJ
 2DhGGo7HVg6H1oCl59OsY80b46RTNA1QcXE+c1DT7hBTwu/2dUeSpMqEwjwxhgt2KoaP8MEuKk5
 VhogAa98Nyqh+K8H0A==
X-Google-Smtp-Source: AGHT+IFyFS3GiZT59tCTqcUuta/dOVRknOAV/MGyTCdLGGBN9rKzilnjOpZ3GrgUo/1tmo6lnG8kkg==
X-Received: by 2002:a5d:47c6:0:b0:38f:3ea6:1b98 with SMTP id
 ffacd0b85a97d-38f3ea62215mr10025877f8f.31.1739898506471; 
 Tue, 18 Feb 2025 09:08:26 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439941bd54bsm24680135e9.11.2025.02.18.09.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 09:08:26 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 11/16] drm/vkms: Allow to attach connectors and encoders via
 configfs
Date: Tue, 18 Feb 2025 18:08:03 +0100
Message-ID: <20250218170808.9507-12-jose.exposito89@gmail.com>
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
/config/vkms/connectors/connector/possible_encoders that will contain
symbolic links to the possible encoders for the connector.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  2 +
 drivers/gpu/drm/vkms/vkms_configfs.c | 66 ++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 3dd55c3e8900..0212e99e12dd 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -111,6 +111,7 @@ To finish the configuration, link the different pipeline items::
 
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/encoders/encoder0/possible_crtcs
+  sudo ln -s /config/vkms/my-vkms/encoders/encoder0 /config/vkms/my-vkms/connectors/connector0/possible_encoders
 
 Since at least one primary plane is required, make sure to set the right type::
 
@@ -128,6 +129,7 @@ And removing the top level directory and its subdirectories::
 
   sudo rm /config/vkms/my-vkms/planes/*/possible_crtcs/*
   sudo rm /config/vkms/my-vkms/encoders/*/possible_crtcs/*
+  sudo rm /config/vkms/my-vkms/connectors/*/possible_encoders/*
   sudo rmdir /config/vkms/my-vkms/planes/*
   sudo rmdir /config/vkms/my-vkms/crtcs/*
   sudo rmdir /config/vkms/my-vkms/encoders/*
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index cd8a164bda3d..9036d9983078 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -87,11 +87,14 @@ struct vkms_configfs_encoder {
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
@@ -125,6 +128,10 @@ struct vkms_configfs_connector {
 	container_of(to_config_group((item)), struct vkms_configfs_connector, \
 		     group)
 
+#define connector_possible_encoders_item_to_vkms_configfs_connector(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_connector, \
+		     possible_encoders_group)
+
 static ssize_t crtc_writeback_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_crtc *crtc;
@@ -583,6 +590,59 @@ static const struct config_item_type connector_item_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static int connector_possible_encoders_allow_link(struct config_item *src,
+						  struct config_item *target)
+{
+	struct vkms_configfs_connector *connector;
+	struct vkms_configfs_encoder *encoder;
+	int ret;
+
+	if (target->ci_type != &encoder_item_type)
+		return -EINVAL;
+
+	connector = connector_possible_encoders_item_to_vkms_configfs_connector(src);
+	encoder = encoder_item_to_vkms_configfs_encoder(target);
+
+	mutex_lock(&connector->dev->lock);
+
+	if (connector->dev->enabled) {
+		mutex_unlock(&connector->dev->lock);
+		return -EPERM;
+	}
+
+	ret = vkms_config_connector_attach_encoder(connector->config,
+						   encoder->config);
+
+	mutex_unlock(&connector->dev->lock);
+
+	return ret;
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
+	mutex_lock(&connector->dev->lock);
+	vkms_config_connector_detach_encoder(connector->config,
+					     encoder->config);
+	mutex_unlock(&connector->dev->lock);
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
@@ -616,6 +676,12 @@ static struct config_group *make_connector_group(struct config_group *group,
 	config_group_init_type_name(&connector->group, name,
 				    &connector_item_type);
 
+	config_group_init_type_name(&connector->possible_encoders_group,
+				    "possible_encoders",
+				    &connector_possible_encoders_group_type);
+	configfs_add_default_group(&connector->possible_encoders_group,
+				   &connector->group);
+
 	mutex_unlock(&dev->lock);
 
 	return &connector->group;
-- 
2.48.1

