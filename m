Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959D7A30972
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 12:09:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF74710E665;
	Tue, 11 Feb 2025 11:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kyoa6wQs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A56C10E665
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 11:09:22 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-38dc33931d3so2370845f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 03:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739272160; x=1739876960; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=prbaD9EEGSsUeJKiTeBVWVOJfwbyTxNyFRLpyPWOntc=;
 b=kyoa6wQsKcmZMnKCQZrA/uMbJvSGZbuNT4BCVDcXYOy4bDujJ6uz+aD0keAsgZqSBZ
 Mu4/Q3M2bc6vbOo9mUUg/lgMLUDZ5Q3M5mNoHB4B7M0aRga6980Hw8ox/arQcmaYXDsi
 Yhyi6bE6j0fLOEX4uE7h2TriDDh8ILy6wC31WtRDJoPdneMiudd9205PNOEayEjwtD+O
 yyl+cUTeaS1z95ckaorkxya+6eDzjb5DSMRsV8XcHwuYFI7wU0meT7IEJVS5e2vua/ul
 bT9TxaRGN188c/pcNcih0hyMjpNYFHWZpSMGbEjUfpYdiv4C17kA43+FuOvvNGD6nPDm
 NuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739272160; x=1739876960;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=prbaD9EEGSsUeJKiTeBVWVOJfwbyTxNyFRLpyPWOntc=;
 b=we2L+n3Z1PwwOy6yNBkE+2vWnS6kAuYpzLOJ+NUOEI97ILoBeCBBfFw2RmNK6ZVjzi
 wejEn1PftDhUyxBWqWvDMGoGI8snzwF06ya3jfF6s5yldpoyn1cBoh28i3UHmYkiBJw5
 jO8uzFv2xkB/ysRwEPhYzQt1cIS3nUjwCeLaVkxcNBT6J2VxuR59lFfsWqc376OcmCDV
 EJi6nlDFX0yiL6pdmGysGs/+a2NnEwNxs+ydUJZvI19LGNuHqIW5d7ku7yi6vCJfkXN5
 QTm6FH8vTnES9w8PV2eTTLysaJmcSsNhxAb2Q7M+4ozVVgxLJi/B+ELY/wVVcPIn9996
 NVVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqUXKNihfZOYlB0Vh9K3SpVUOk27iVD6mXN2SzhpMEP+WiLD51SMa1/GJLTlLseFeUB0sc6JX9/n0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxefxjdMWlBNftZM+xmDZDSpAv02RqhmKMF97OJ+XXz5FWKlthZ
 bqOG4m66OgB8XPRcsfgeUNR/FT9JDwZnQIeXTw8Cu04IjRnpe7My
X-Gm-Gg: ASbGncs0C/8d6FEc8a2KXaJGaZh/HzYg/GNFQThSj/3k07dHLJm3GRTwyRMzaZpn/YC
 UK7MgFl7Ojl1hWwhLqrJcvoGPuwPbmOKwyJ2FSJxhn28aRbE+2eJVhCGx/9gApzxveOmNOuxAZp
 tGxOKbCzPVcmZnx5icMuRsfZdj11OJZsG/EIZdqHwPjzW0BNprxFa+bqDnA83IeNzUdxOS/VKlo
 BL4NsSM7tgE+JSLubFDItFGQJr+EyeiNJrfbUHV8q8JyMgBFGQeag+3vadVjf9jZhmwuUt0K4s/
 cNQnGWTq66xZkQJc
X-Google-Smtp-Source: AGHT+IEisoGk6NyTYRg9Nzt3NhsjvTdsTtmM67osH1eZt5tSPgY4xDQE9dG1ITKt+LUP+bKxOTSPXQ==
X-Received: by 2002:a5d:6d04:0:b0:38d:e401:fd61 with SMTP id
 ffacd0b85a97d-38de401feb4mr3038917f8f.49.1739272160471; 
 Tue, 11 Feb 2025 03:09:20 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcb55b7a5sm11814417f8f.14.2025.02.11.03.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 03:09:19 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 03/15] drm/vkms: Create vkms_connector struct
Date: Tue, 11 Feb 2025 12:09:00 +0100
Message-ID: <20250211110912.15409-4-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211110912.15409-1-jose.exposito89@gmail.com>
References: <20250211110912.15409-1-jose.exposito89@gmail.com>
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

Create a structure wrapping the drm_connector.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_connector.c |  8 ++++----
 drivers/gpu/drm/vkms/vkms_connector.h | 11 ++++++++++-
 drivers/gpu/drm/vkms/vkms_output.c    |  4 ++--
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index fc97f265dea6..ab8b52a84151 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -29,22 +29,22 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 	.get_modes    = vkms_conn_get_modes,
 };
 
-struct drm_connector *vkms_connector_init(struct vkms_device *vkmsdev)
+struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
 {
 	struct drm_device *dev = &vkmsdev->drm;
-	struct drm_connector *connector;
+	struct vkms_connector *connector;
 	int ret;
 
 	connector = drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
 	if (!connector)
 		return ERR_PTR(-ENOMEM);
 
-	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
+	ret = drmm_connector_init(dev, &connector->base, &vkms_connector_funcs,
 				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
 	if (ret)
 		return ERR_PTR(ret);
 
-	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
+	drm_connector_helper_add(&connector->base, &vkms_conn_helper_funcs);
 
 	return connector;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
index beb5ebe09155..c9149c1b7af0 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -5,6 +5,15 @@
 
 #include "vkms_drv.h"
 
+/**
+ * struct vkms_connector - VKMS custom type wrapping around the DRM connector
+ *
+ * @drm: Base DRM connector
+ */
+struct vkms_connector {
+	struct drm_connector base;
+};
+
 /**
  * vkms_connector_init() - Initialize a connector
  * @vkmsdev: VKMS device containing the connector
@@ -12,6 +21,6 @@
  * Returns:
  * The connector or an error on failure.
  */
-struct drm_connector *vkms_connector_init(struct vkms_device *vkmsdev);
+struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev);
 
 #endif /* _VKMS_CONNECTOR_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index b01c3e9289d0..4b5abe159add 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -7,7 +7,7 @@
 int vkms_output_init(struct vkms_device *vkmsdev)
 {
 	struct drm_device *dev = &vkmsdev->drm;
-	struct drm_connector *connector;
+	struct vkms_connector *connector;
 	struct drm_encoder *encoder;
 	struct vkms_output *output;
 	struct vkms_plane *primary, *overlay, *cursor = NULL;
@@ -69,7 +69,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 	encoder->possible_crtcs = drm_crtc_mask(&output->crtc);
 
 	/* Attach the encoder and the connector */
-	ret = drm_connector_attach_encoder(connector, encoder);
+	ret = drm_connector_attach_encoder(&connector->base, encoder);
 	if (ret) {
 		DRM_ERROR("Failed to attach connector to encoder\n");
 		return ret;
-- 
2.48.1

