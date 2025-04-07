Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A06A3A7D752
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 10:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E655010E3A5;
	Mon,  7 Apr 2025 08:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YXM1DIQ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCF810E3A1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 08:14:45 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so23268495e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 01:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744013684; x=1744618484; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JM/Fi/DDU9FwBSZywjo1FgF2AvwYFEClN7Cv+XzGCRQ=;
 b=YXM1DIQ3U+EndY0nehbmJL11i1Tjmlf58MiDqGrWZvvfnibzrNhKcYb4984gDiLLOT
 KYTG3Ib9R+7dIXbh+5ZAameX7hZ3UWafDDqk7/oCRb84/Ef5pHKLl5tn8phIGXzs5W2v
 nDB2dIfoNGQFmdKfkIC+vw5Y8cQEXBvggctfc2ESC169ccBW69MalDSv98/BMd9NxcSk
 G1skX77JI6mV7bHkdRVn7g8WLFovWtvIJXwCiWvXmrdg3hoBORJazuBxSuTef6qbe6by
 pR2TYt+5a0vcru1gSBrJuC8Mb/yOMfHQL3Ji1ZUAdiY8Wm6I+ZAXT6/IEodWkoXJ4rfm
 BF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744013684; x=1744618484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JM/Fi/DDU9FwBSZywjo1FgF2AvwYFEClN7Cv+XzGCRQ=;
 b=vLmgAbw18jjpi2cTHk2TniZn2T+hjMG6Gh3+P8JeQMzSyw65GHehjyLR50x56D14Jh
 1i9VlldfXIYCGj+hxg0zZGlpHyDyFia0ZOagI02SolTqsckiZ2Ibq5oxIK7XlwsUv+Q+
 26oorRJ0cyS7gPElNuFCwvjy0Vw3IH2HlZvi1Cjady5sV0KBq1Nrem5m5/7aGzq1yPYx
 oUN07b0pOxBhhHaCQ3uLqLMcS9GRacryOH4QSFaXLTSJ8cZQ3Y7jhU7x03PzUKJorHxY
 X1b+I8mzSmBUthx5f9W6/iR0dNQ35MI+bRKLPcaAO/Oo2L3gWbpVGFHUNztt89NiOe9f
 JpNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXajIaUyt1uWPMGL341DRf5mt5MrQch+Qf/qU/xD2j9R9G09isbauVu6O4gaiiu4mcCAfUS0wkTiwE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmANBKc7DQGdi73E8gOeHSGXtttrW5lWZwxqhiX6NY9jqSN5y4
 yAUNzxyKo/tCYyGZTeTTmWW0IJaVyCLAIe+jZidP59OpwfGvawgj
X-Gm-Gg: ASbGncsfV8bFdSXo5ovvInaeVKKdG1Hsq8IW3grl+S6Z6hKxegN+zeQQ01I/ukRZ5hU
 LtwNtuiLZkDgOTYxfBJUr6qhIUW5EvwAcB7VA/Hm6Kr1+xCw8LL2nsETGOZwBSuMnogZUuRi6ef
 qTbcLcLpCBh8iZGSFJZ3jvFpO6Gm6e24TfCFNDkNeLi2bUGnpmW3lwplVPK0X5QY+BA7PMVwYmP
 TjTsW2vXm8zh/1NQF2BSEopyTt6UxMTPWrZlKfQuAmfcfdp4+fLHF1vGklIUBX67JbyLnnvo4sv
 JFYTOhU79+HnSAEfKTitEr/moZlCRIp+edVnP9pdzD9u
X-Google-Smtp-Source: AGHT+IEqDaM4S78b8UTDQYDDTn9k2Pc7xmCPXPXr8Ca/VQfBfIMtDZuyf5gdnsmRTVyBe5Ehu1j0+A==
X-Received: by 2002:a05:600c:510d:b0:43d:fa58:700e with SMTP id
 5b1f17b1804b1-43ee0789b05mr60393725e9.33.1744013683916; 
 Mon, 07 Apr 2025 01:14:43 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 01:14:43 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 09/16] drm/vkms: Allow to attach encoders and CRTCs via
 configfs
Date: Mon,  7 Apr 2025 10:14:18 +0200
Message-ID: <20250407081425.6420-10-jose.exposito89@gmail.com>
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
/config/vkms/encoders/encoder/possible_crtcs that will contain symbolic
links to the possible CRTCs for the encoder.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  2 +
 drivers/gpu/drm/vkms/vkms_configfs.c | 58 ++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index e24767448775..650dbfa76f59 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -106,6 +106,7 @@ Next, create one or more encoders::
 To finish the configuration, link the different pipeline items::
 
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
+  sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/encoders/encoder0/possible_crtcs
 
 Since at least one primary plane is required, make sure to set the right type::
 
@@ -122,6 +123,7 @@ Finally, you can remove the VKMS instance disabling it::
 And removing the top level directory and its subdirectories::
 
   sudo rm /config/vkms/my-vkms/planes/*/possible_crtcs/*
+  sudo rm /config/vkms/my-vkms/encoders/*/possible_crtcs/*
   sudo rmdir /config/vkms/my-vkms/planes/*
   sudo rmdir /config/vkms/my-vkms/crtcs/*
   sudo rmdir /config/vkms/my-vkms/encoders/*
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 0df86e63570a..7de601e39d2b 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -70,11 +70,13 @@ struct vkms_configfs_crtc {
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
@@ -100,6 +102,10 @@ struct vkms_configfs_encoder {
 	container_of(to_config_group((item)), struct vkms_configfs_encoder, \
 		     group)
 
+#define encoder_possible_crtcs_item_to_vkms_configfs_encoder(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_encoder, \
+		     possible_crtcs_group)
+
 static ssize_t crtc_writeback_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_crtc *crtc;
@@ -364,6 +370,52 @@ static const struct config_item_type plane_group_type = {
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
+	scoped_guard(mutex, &encoder->dev->lock) {
+		if (encoder->dev->enabled)
+			return -EBUSY;
+
+		ret = vkms_config_encoder_attach_crtc(encoder->config, crtc->config);
+	}
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
+	scoped_guard(mutex, &encoder->dev->lock)
+		vkms_config_encoder_detach_crtc(encoder->config, crtc->config);
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
@@ -413,6 +465,12 @@ static struct config_group *make_encoder_group(struct config_group *group,
 
 		config_group_init_type_name(&encoder->group, name,
 					    &encoder_item_type);
+
+		config_group_init_type_name(&encoder->possible_crtcs_group,
+					    "possible_crtcs",
+					    &encoder_possible_crtcs_group_type);
+		configfs_add_default_group(&encoder->possible_crtcs_group,
+					   &encoder->group);
 	}
 
 	return &encoder->group;
-- 
2.48.1

