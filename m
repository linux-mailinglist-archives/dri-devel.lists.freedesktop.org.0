Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 151D2A3A3A1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 18:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF3610E457;
	Tue, 18 Feb 2025 17:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D/fn/ae0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A07310E418
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 17:08:27 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso64224785e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 09:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739898506; x=1740503306; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xxl4nD/rAmawJnGv7wGWIydakUQ3xQq8ck/CP82D2ZE=;
 b=D/fn/ae0mo1mZZrXe/WtLnIsnul8m7vHMZFh2gfeLjN4+p9fK+yhR3992V9PlcK5Lx
 8sAAXVnVcDXvaomB7+FI1m6JgZ194QiVHVIC5HyKzguWxnnnsNOkInL15Ef3gve6+tMX
 +PoHOCmSoZcmp87Bp3TS3MAfHS0dBsp18hKNiaY4qJHLXkobyYH6GCoyFngyjyZgUJp/
 g9/mFxRNleNIRYiwTA3zYvk9GbZbeocTWa5lmJ4gde91Lsd/qMGp9QKvzce1z4nZiNES
 F5pe5GlGRueVr7y6uMCIcyBKcCBnGaK1xtE3or6jNCV2hOEEPOuSQzMYD+6pFSjTuTL8
 Wzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739898506; x=1740503306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xxl4nD/rAmawJnGv7wGWIydakUQ3xQq8ck/CP82D2ZE=;
 b=lEIFLbBfRMl669lU7khP0OPlJd3zgsr8XWYY8k8aE91ogUBg539JJoM7rLVdf9ePIY
 nJlKzqlogGCEyGtoHJpsJVYIX7rDAdgZ3chlKyS55xgEcSRLBYwDsxC/h+5Usn32BH67
 yyom/Aw1oa/PkIcTiBRzBrnffGh0eeKaXK8q0KwYF83ZUd3hYB95+jfMWF024Z+aqoR8
 8GATCTTeQBtt4PTiSDGsudxNsfC6dRwfZRCnxZpIXokYMqRXpdAEq3qYjq1av+eRX22i
 TaKNEQRub+yUImNs0rB6IXRL18rLAhZRNccJkLIYwgafEOxu52kROewno3As4CgFWyJC
 PQ+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCURoMaPiE3A7MDMKzItfdjk6N7NmXhWrhAh/MsCn9DG8U5HWmBkTtqjy1OiU/l+fkcBWpqH8ly6mY0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4nbODz7pwYfhJqZ0hk6ngorEZvRNT+vE+vTTBp6hRejI1o0br
 U3Yd7dwNLiDIHjfCSJ3wJMb8sWwnSt4ZlSTyN6Box/bAQQcsfuNP
X-Gm-Gg: ASbGncvi9nIWl7DlK2Q9CVwGrM9Yp647I/85LWm/kFVJX2EPHlctidpyr7ZV+YLzo8O
 sfHmFqMMxtQCmMbVbvEAa5G76eAxY3uHX3YazvfGHwSvhuijRKyAhphIMd5IdhDaKqMgDXxOvbl
 OxsdiYYppvQnDGXvNIXEzQUqFgDZDZNiDt6rxCVgvRxiwLDUSZmnEj0PRl+ULCyvjEm3DYIT5QG
 0btTAZMRO9teMhqgu2aBB6j4nOUBp+UdiYZLM7FsprQPjZKrXPOEPNtT8WTKUCldvNWVH2ckVop
 jqtjPl7k7lcOwadTCQ==
X-Google-Smtp-Source: AGHT+IFOp5iSe+2jxXvP5iADRB2bGk089MQxVl+L+ViO/4h4dBkCGWhr8Swc12hrEHrxNb5s4GEhDQ==
X-Received: by 2002:a05:600c:3b8c:b0:431:5c3d:1700 with SMTP id
 5b1f17b1804b1-4396e716f3dmr134120115e9.21.1739898504233; 
 Tue, 18 Feb 2025 09:08:24 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439941bd54bsm24680135e9.11.2025.02.18.09.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 09:08:23 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 09/16] drm/vkms: Allow to attach encoders and CRTCs via
 configfs
Date: Tue, 18 Feb 2025 18:08:01 +0100
Message-ID: <20250218170808.9507-10-jose.exposito89@gmail.com>
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
/config/vkms/encoders/encoder/possible_crtcs that will contain symbolic
links to the possible CRTCs for the encoder.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  2 +
 drivers/gpu/drm/vkms/vkms_configfs.c | 63 ++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 24f40128e8f3..6a15af0b7317 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -105,6 +105,7 @@ Next, create one or more encoders::
 To finish the configuration, link the different pipeline items::
 
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
+  sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/encoders/encoder0/possible_crtcs
 
 Since at least one primary plane is required, make sure to set the right type::
 
@@ -121,6 +122,7 @@ Finally, you can remove the VKMS instance disabling it::
 And removing the top level directory and its subdirectories::
 
   sudo rm /config/vkms/my-vkms/planes/*/possible_crtcs/*
+  sudo rm /config/vkms/my-vkms/encoders/*/possible_crtcs/*
   sudo rmdir /config/vkms/my-vkms/planes/*
   sudo rmdir /config/vkms/my-vkms/crtcs/*
   sudo rmdir /config/vkms/my-vkms/encoders/*
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index d7efa50a3fba..66c8a66f7b2b 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -69,11 +69,13 @@ struct vkms_configfs_crtc {
  *
  * @group: Top level configuration group that represents a encoder.
  * Initialized when a new directory is created under "/config/vkms/encoders"
+ * @possible_crtcs_group: Default subgroup of @group at "encoder/possible_crtcs"
  * @dev: The vkms_configfs_device this encoder belongs to
  * @config: Configuration of the VKMS encoder
  */
 struct vkms_configfs_encoder {
 	struct config_group group;
+	struct config_group possible_crtcs_group;
 	struct vkms_configfs_device *dev;
 	struct vkms_config_encoder *config;
 };
@@ -99,6 +101,10 @@ struct vkms_configfs_encoder {
 	container_of(to_config_group((item)), struct vkms_configfs_encoder, \
 		     group)
 
+#define encoder_possible_crtcs_item_to_vkms_configfs_encoder(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_encoder, \
+		     possible_crtcs_group)
+
 static ssize_t crtc_writeback_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_crtc *crtc;
@@ -402,6 +408,57 @@ static const struct config_item_type plane_group_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static int encoder_possible_crtcs_allow_link(struct config_item *src,
+					     struct config_item *target)
+{
+	struct vkms_configfs_encoder *encoder;
+	struct vkms_configfs_crtc *crtc;
+	int ret;
+
+	if (target->ci_type != &crtc_item_type)
+		return -EINVAL;
+
+	encoder = encoder_possible_crtcs_item_to_vkms_configfs_encoder(src);
+	crtc = crtc_item_to_vkms_configfs_crtc(target);
+
+	mutex_lock(&encoder->dev->lock);
+
+	if (encoder->dev->enabled) {
+		mutex_unlock(&encoder->dev->lock);
+		return -EPERM;
+	}
+
+	ret = vkms_config_encoder_attach_crtc(encoder->config, crtc->config);
+
+	mutex_unlock(&encoder->dev->lock);
+
+	return ret;
+}
+
+static void encoder_possible_crtcs_drop_link(struct config_item *src,
+					     struct config_item *target)
+{
+	struct vkms_configfs_encoder *encoder;
+	struct vkms_configfs_crtc *crtc;
+
+	encoder = encoder_possible_crtcs_item_to_vkms_configfs_encoder(src);
+	crtc = crtc_item_to_vkms_configfs_crtc(target);
+
+	mutex_lock(&encoder->dev->lock);
+	vkms_config_encoder_detach_crtc(encoder->config, crtc->config);
+	mutex_unlock(&encoder->dev->lock);
+}
+
+static struct configfs_item_operations encoder_possible_crtcs_item_operations = {
+	.allow_link	= encoder_possible_crtcs_allow_link,
+	.drop_link	= encoder_possible_crtcs_drop_link,
+};
+
+static const struct config_item_type encoder_possible_crtcs_group_type = {
+	.ct_item_ops	= &encoder_possible_crtcs_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
 static void encoder_release(struct config_item *item)
 {
 	struct vkms_configfs_encoder *encoder;
@@ -457,6 +514,12 @@ static struct config_group *make_encoder_group(struct config_group *group,
 
 	config_group_init_type_name(&encoder->group, name, &encoder_item_type);
 
+	config_group_init_type_name(&encoder->possible_crtcs_group,
+				    "possible_crtcs",
+				    &encoder_possible_crtcs_group_type);
+	configfs_add_default_group(&encoder->possible_crtcs_group,
+				   &encoder->group);
+
 	mutex_unlock(&dev->lock);
 
 	return &encoder->group;
-- 
2.48.1

