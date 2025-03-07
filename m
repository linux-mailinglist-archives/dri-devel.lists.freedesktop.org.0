Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A092A56DD0
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 17:34:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58ADF10EBF4;
	Fri,  7 Mar 2025 16:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NvMZxTTj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6C610EBF0
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 16:34:15 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-39104c1cbbdso1080969f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 08:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741365254; x=1741970054; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pkjoxigyIPAGM4bWibC29uQWmfsXcpbtj5sqbZDQnLA=;
 b=NvMZxTTjF5A8DEj9RuSZF1GbBHvLf+R2NBPbMVm6FVSfmlDYEzslChJCuI5d/ODNwl
 S4TPm1phdlit+xDbPVYHj2mqHJ9vvNMsLjyYDY5LRN295lLOs5eZtteHm4ztkXPOPPJk
 lpNqHgrPr7T31WN9zbB4lEuffyFC3X+qPxrxyyO1/VtfwPUDmt2Ps1upY3AcDv2hE3nQ
 y2NPuSmjTGKrbm7tyHji5suThJWkQeAcmr8I5hGK3UIG7KNgxVpRbHZr8XfGZiTp32kd
 uJbV8zZbtZFXApYSDur6NdtmxjKLLILxiYNgU/dW2Pvq8ovadPnjqxg6WnrUpmzWNqCW
 zfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741365254; x=1741970054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pkjoxigyIPAGM4bWibC29uQWmfsXcpbtj5sqbZDQnLA=;
 b=w159ZXl3M+31Q/alLspmJJPTrvydQMZbt2PfaZcncU/xH8vfHFv59oJsyu1MrD8xr+
 pBGpFMGX1SQ5RczBlt8CEHD93TGk7usv1BayYpmudg2un2qy/O+bMDzXXyuWu6o5oLjj
 94oMRBq0T4D3gqXxNplA2Mx9NxaCnoI5xNpAPArkz2GLOf6Kq+XFJ+IDosjbJZLjgz+J
 4gO7X4rzhVNrypWO90Io71COo9f0Yw0SsI16JdlfoKxFHPrtl7JzfoqIsWXF9AM+JaBX
 20AtHydrCdoqx1Dm32JbyFky+uU7abI9gC7/pZzxxyNelfwqrfVLt5gzyWDsHcud3B7P
 lZgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD/68OruxkcN5aIRFipIt6kn+ZZ408s0Xk9xScZyKHseERQ05o2HEoyKSW95e5qBhczpCT9rmGbrc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxv2RUfJInWOnQW01LBAXsRRyufIAZXLNxaFAOhj9OKPEBq+oga
 wWoQTDkk541LoAT888AWI3f/HKQC2lPIybG3DmgBY0JH82mBFtUj
X-Gm-Gg: ASbGncsul3kMp5jMBUTyVmTELv0V+pjphhEiv5qy3d+RISL+y3kd+NuiQelBAZ1XJux
 leLH2JqslrNIUF49Re8hIJLK4DPa22w38/woePsTpv9BFCie9m70TC7BlHaofXMl/0k9ffUaL1h
 tXN7YbKvnDBmSkz73dwxZHbmrgl9sxRa1c/jN6ZnPDagCk6qLX/6qXoFnOf4MRnbsPPJ+cLfq80
 5gxRjLklbTiaohv4efxoaPoJMmJ6l7mqZV0rZltGTBOV9hX5p4FSfHkCWinAgVITWdLbnQ4CXop
 HAThxqph+AbDAR6njq/xDTCUC/B3zrhQFfYV/QCUYYzMPOY=
X-Google-Smtp-Source: AGHT+IESNA23In2kHjqdFJ6dx0smo1M6kzDdgbcUv2LBI727vsHZMdwd4dUthvuCgUPRlt36reWHvA==
X-Received: by 2002:a05:6000:4185:b0:391:306f:57d1 with SMTP id
 ffacd0b85a97d-39132dd6d3cmr2539139f8f.35.1741365254331; 
 Fri, 07 Mar 2025 08:34:14 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c019557sm6031436f8f.50.2025.03.07.08.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 08:34:13 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3 11/16] drm/vkms: Allow to attach connectors and encoders
 via configfs
Date: Fri,  7 Mar 2025 17:33:48 +0100
Message-ID: <20250307163353.5896-12-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307163353.5896-1-jose.exposito89@gmail.com>
References: <20250307163353.5896-1-jose.exposito89@gmail.com>
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
 drivers/gpu/drm/vkms/vkms_configfs.c | 62 ++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

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
index 692e1b708012..8e90acbebd6a 100644
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
@@ -528,6 +535,55 @@ static const struct config_item_type connector_item_type = {
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
+	scoped_guard(mutex, &connector->dev->lock) {
+		if (connector->dev->enabled)
+			return -EBUSY;
+
+		ret = vkms_config_connector_attach_encoder(connector->config,
+							   encoder->config);
+	}
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
+	scoped_guard(mutex, &connector->dev->lock) {
+		vkms_config_connector_detach_encoder(connector->config,
+						     encoder->config);
+	}
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
@@ -554,6 +610,12 @@ static struct config_group *make_connector_group(struct config_group *group,
 
 		config_group_init_type_name(&connector->group, name,
 					    &connector_item_type);
+
+		config_group_init_type_name(&connector->possible_encoders_group,
+					    "possible_encoders",
+					    &connector_possible_encoders_group_type);
+		configfs_add_default_group(&connector->possible_encoders_group,
+					   &connector->group);
 	}
 
 	return &connector->group;
-- 
2.48.1

