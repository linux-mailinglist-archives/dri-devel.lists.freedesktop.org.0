Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D92BA37F2C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 11:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E845610E3D0;
	Mon, 17 Feb 2025 10:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MJ77jEsY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEED610E3C2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 10:01:27 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-38f3ac22948so613759f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 02:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739786486; x=1740391286; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=prbaD9EEGSsUeJKiTeBVWVOJfwbyTxNyFRLpyPWOntc=;
 b=MJ77jEsYkiIQzIFwH1tfgPVUe5E8ikv6BammqNf1nF3Ib7DI89qTTf+eVTA0hRatYc
 Bl4WiScHNMwmcK3CyRoFhEDQWgc4XGxOmirSqSmN/yayDzMMNmI5Gam/LRrgypk0UZRZ
 L8zrpI9o0V1WMCVdK0qyFipSuGLfTxX5purpyV2cFQQDx3lCnDfiyUtehY92z4CeZjxz
 MOnUQNAPcepUAqkuGZPiCpkBS1cuOffUVqXj6vbhD2HKkiSvYAzd5sWPS9FDaqlcYPHE
 OMwHzAwuM8LpVtehWPkL2Xf5HTNVyXJOYYzRQ6Fc5UZMFljgWMTevQ6R7La2avdrh9as
 NV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739786486; x=1740391286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=prbaD9EEGSsUeJKiTeBVWVOJfwbyTxNyFRLpyPWOntc=;
 b=PE45ZUfsmVh78plV157C9lOa1K6Zf3XnswNZ5fr5FvBZWaZh9LcvWpwkcBvXq2is+3
 GHP9HGPTnMbefiufD4OYtyE03LLNQ603w8ReTuTLevEGVmFYSHLLjjOzU+A6KvVxfUhe
 MQXjLK1QbJphJcBuBdR0WCkBA4lINdo/RDzA+4qzBYNWJVd6sCfAjUr+xk9RK+sqJ5L0
 L/31njfB7uoJDoNZIp8ZT8qJXB3z3m+Sdh1cbvfeW6P0xH1Fq6msldhRrSD9TM/hYGae
 /vv4ip4GXfuBxqRjvVX/Nu6IBMzMzJ9x7BQsNOCESzMyYi3ypaodMCDEhqv6Jsa8EVqv
 XG4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjRRwY7tumybgOSLunmZ6q1SGWmdshAbGeLmrqUyxsaKRLbrRgkJJ/mZbfvf+DbfMTOhkoJIbe6tw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAnSExaszvp+YhB+7JkfDxcQGBPv9P5drAQDx2UgE/eEjUQW3V
 n0Vxh9cf+bzrOX9MhEXWlAsqcbSPo+cmkaLqs+COtrN4sc8oJ9uW
X-Gm-Gg: ASbGncvDGJ6fPmv9l061eqOc70Mm0n4TlOGdxNVNbjfBQM7hAfik3hupvKc9Sovs0XN
 LxkD6WaYdRI8ARK6mrCqG84uikBnuNlUco8k5wvGuve0+ZqqSw+64an2LP46ZFyS4JrPm/+DQCa
 psXqunP7zrANKfbW24FsxyubYUF34jU7RW2r8IYZdkry3xdJc8gLw91SjV8VWhAMwDtTOzdVH6K
 KgSZLIMg72MomvkplcPNeh6SJqthbS8q5JKhaiSOpObPbhYhodf+mjJ07xz+KUL+aO270YOoGL4
 ApAgSfiCnMUsXpocmA==
X-Google-Smtp-Source: AGHT+IEdub1ENivcRK+0XnYHr4w7hyC6AU7B2PacCu2x37x4fKN/+Z9glwiYOFaDq7cRKGtz5fNHfw==
X-Received: by 2002:a5d:6d06:0:b0:38f:4cdc:5d36 with SMTP id
 ffacd0b85a97d-38f4cdc605bmr768718f8f.43.1739786486004; 
 Mon, 17 Feb 2025 02:01:26 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f7fe6sm11591901f8f.86.2025.02.17.02.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 02:01:25 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3 02/14] drm/vkms: Create vkms_connector struct
Date: Mon, 17 Feb 2025 11:01:08 +0100
Message-ID: <20250217100120.7620-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217100120.7620-1-jose.exposito89@gmail.com>
References: <20250217100120.7620-1-jose.exposito89@gmail.com>
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

