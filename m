Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A41DA7D753
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 10:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9548510E3A7;
	Mon,  7 Apr 2025 08:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k9P4PKwf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C3510E3A1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 08:14:47 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so2207058f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 01:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744013686; x=1744618486; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=30g7j8THiH5G3j4prRnrzSzWMrdBeS/8zYzHDTqKqNo=;
 b=k9P4PKwflRnr3Y6dpNCo6VLMlCXexCQaRy2OptwCYeb1kH/whoTqRK7iwyM2U/ubdn
 FU8jzPb8W053XkVgJ6utEQWzAeOtSTfYmS7pbVt2RVKZQi1qUFrE2V0EdCswuBb9kEWe
 0vbxker4MNlBhphOfryBZQDDHH1AltD/Cwl8eM4J2RmS8IT8ljvvkDm+W5JjVRUsCX7x
 NupxSYIZTCGgJdg05xAf8dMtJi0GtwO22JrnsQzRV1EpWBeINaawIyLVwyhZ4z/nVRXe
 XBZ0S9gakKef+u52raIQQsrKeWNUhieSKv1BivEF2OswFmh3bApydYVcwY1w0+bxcaJx
 L2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744013686; x=1744618486;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=30g7j8THiH5G3j4prRnrzSzWMrdBeS/8zYzHDTqKqNo=;
 b=lrhacmncaHvMuJCKWzyUwW8FNh7hk0z6ZYjHMtT0kRosqvTOTXfQUx+pkjaXnLaIpR
 n5kIgzb1UxMrH41DcrIteviZu2SADNegzNHYyA/0k5I8/kEQbYJohG3kPBBqNGaw/Q5C
 CCoYedZkN+8ONK/Sz8F7SayJh+iCiN6V5lADFWmKksLP59/rHf2kzcn0XWGf/KpwNShQ
 qR/AE8Q6uGeQ1I/dzmp8lBx0RtPPjfePJtLKoTIlK/PiFwg+n6wbfuAlIQdlzpCHtZcl
 hr38Idjt56OXGn37rd/ES4YWrCzO5308GcdtNlMjLcDnJnDVBb9fWY3auUYi0Uyy7y4C
 eOkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcu+RspVK7yghviXXV6S64OFarrB2qd37vXldcmZTycR7lROTscKU1Y87DjWZjZOqolmp+elieMZE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzr/msMI4HxwqOwReKR6Ka9VXxgNQicC1Ix7uPIuKVi19/d+uO0
 8Zthm7oLV8WqFeSsHzhTvayO4GojNoE/tP1sqWDXtEUgTPaJnjtO
X-Gm-Gg: ASbGnctHQR3IbZH2Oysfae96ci69C+xxjNvoqVbk5GAF7cS2jkVS805yOuHo9M/Rm7X
 n/bAIe7hBaDDfxTVquNT8iida5r7TBxkv51f3Jl/aujodJQEByZUcvUe2tM9gtmR3DT8PByqsCP
 anqUtAC9NYl4I60mEPVUgQpm9ea32H8gIKq2oXV0KOQRzChmuSOffTz1msmQB0LKzExQssSRhBX
 Iv5ippEAmF0UgkXgHta9f/WZMMFH/Qv0JrvSpSFZ1LGUy+wpFFzt08FyxkitlLsSUfK9qlhas8N
 7LGkYMHuhTeWByZAqMgqtySrfztXvDU4dICeK+wPHrienTnOFHeWkEk=
X-Google-Smtp-Source: AGHT+IHfD6WX+Bf3OS6nFCMzxsgLn+PXcybie2ZXiokzoVzxIvqAtscNt4JuusKeP7/Vs5fEVsEjNw==
X-Received: by 2002:a05:6000:2907:b0:39c:1404:42df with SMTP id
 ffacd0b85a97d-39d0de3a383mr9421132f8f.30.1744013685893; 
 Mon, 07 Apr 2025 01:14:45 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 01:14:45 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 11/16] drm/vkms: Allow to attach connectors and encoders
 via configfs
Date: Mon,  7 Apr 2025 10:14:20 +0200
Message-ID: <20250407081425.6420-12-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407081425.6420-1-jose.exposito89@gmail.com>
References: <20250407081425.6420-1-jose.exposito89@gmail.com>
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

Create a default subgroup at
/config/vkms/connectors/connector/possible_encoders that will contain
symbolic links to the possible encoders for the connector.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
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

