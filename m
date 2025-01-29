Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18176A21B85
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112D310E7A1;
	Wed, 29 Jan 2025 11:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IMGGpoPC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC89610E7A2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:01:07 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so73918505e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738148466; x=1738753266; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9S+7C5eQRPWzuHKFjKrS6n1FuYqDvplaGUQ2TD3AN7Y=;
 b=IMGGpoPCT0u5r31xPJpnjUsubmt5C8Kz9wSRP8DC6acoIxw/w+mj++l4jpCd12IU2i
 HFKp2dCpGkQ0zWVEJuVMJ1OlNOQkNdPPL9gdSF2WR/TbFuTPct6nHIgm9WRc2nSH9Ed7
 uxN6u/2n7OnBhutLDyZak5oe2YJslvEUmR5NceqT05krKWTWRPGI/ZUsM4U4D6DDtTKS
 43q7n6dwIoL1+Ss2MugsD9acan4E5OYunj3lHQR+PFxXAPC5RjelAjNCycpk/SdKp32p
 MkJaXvKSRiUj6Ki/xrm9Ur8RLVhZqgAl4lZN107VcIsLMEjrdeiY/nE/29hZjZUhST1q
 il4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738148466; x=1738753266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9S+7C5eQRPWzuHKFjKrS6n1FuYqDvplaGUQ2TD3AN7Y=;
 b=JUN9rb+d/cJUFHCewo83BSV0J6Ucyab4SlK9Aj/jyFabeTyhZQW6D4ZOzj0XlNo4Pk
 tIsQhY1VQwU4Xg74R0T9XERTkM0c2nJAmTbIGAAkVbXafAjV75UpAmTSyCd9+UCI9uNI
 cG8Jz4wC2IEHXOhJVDt29JyaIKbRMBY/nKohIE0DJu6w9eIN5kwCm7B5CCh6SoFnNuWK
 WxvpGSZHlU0R4RhsZIDaQVXnRemThClfP5DF6iyAfUrgP4j8dB4DtwUceg5zAzlBul5g
 oNn8AgeIeerPh7CslQsToW9A8HYy3h27BORD40Bsik3L8V3M4N0maeyIW2fVxTJHcYsG
 nBLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0kvnO7Gsy8coJH58V3hE8hbo9xCmHF+ZOFhbcI7SMteH+nmjKOf4bVR/ySf+/rLrJRBz+qZDwZ1E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxW5EOa1/jwgPlELqYlJqP44qvDvH8Oz5oJhrJow7tm0L/+5iBA
 Hba7MWWYa6eVBV5nOxxDuzZ5bIiFz4LiZspCVvG0ePSYF+8RRWcS
X-Gm-Gg: ASbGnctuVQAZ1jG54AmA6q0kJ+1T4+KKfIm1y2DpAKfdK06j8QD55KeTdFZ5NV2yd0y
 H+/MfpGXp5bNj5R3gUiLFTU8iKz3gdyuqndyupFdCPyUaBcJs/W9Mi+Fm7ObPlpBpAPHuD0iXj5
 RUaZuVXTxElczwRC6aZqst+rJlLVMquGLEzlXS6kkT/J+nqchIFLUVSO/cSuJ62zp30nNnWOYdq
 SSrqOAADAchheV5v8yT5ZMtsmTg0vY489eGI2VD1o5j4kzU+KMhh6sNqVYVc5OwwrHXylGlA55C
 hoL9BsCKJIl4zrsK
X-Google-Smtp-Source: AGHT+IGHXcYWBGVD149ms+rmsIFUA7ZyRH6Ih7lsGoiLaHzrNT56I8mZyx+mQ+eMvA8IwLloDChjhg==
X-Received: by 2002:a05:600c:3b94:b0:434:ff45:cbbe with SMTP id
 5b1f17b1804b1-438dc3cba35mr22656875e9.18.1738148465987; 
 Wed, 29 Jan 2025 03:01:05 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a176434sm16947113f8f.13.2025.01.29.03.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 03:01:05 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 01/13] drm/vkms: Extract vkms_connector header
Date: Wed, 29 Jan 2025 12:00:47 +0100
Message-ID: <20250129110059.12199-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129110059.12199-1-jose.exposito89@gmail.com>
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
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

Up until now, the logic to manage connectors was in vkms_output.c.

Since more options will be added to connectors in the future, extract
the code to its own file.

Refactor, no functional changes.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/Makefile         |  3 +-
 drivers/gpu/drm/vkms/vkms_connector.c | 50 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_connector.h | 26 ++++++++++++++
 drivers/gpu/drm/vkms/vkms_output.c    | 45 ++++--------------------
 4 files changed, 84 insertions(+), 40 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_connector.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_connector.h

diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index 1b28a6a32948..6b0615c424f2 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -6,6 +6,7 @@ vkms-y := \
 	vkms_formats.o \
 	vkms_crtc.o \
 	vkms_composer.o \
-	vkms_writeback.o
+	vkms_writeback.o \
+	vkms_connector.o
 
 obj-$(CONFIG_DRM_VKMS) += vkms.o
diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
new file mode 100644
index 000000000000..ab8b52a84151
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_probe_helper.h>
+
+#include "vkms_connector.h"
+
+static const struct drm_connector_funcs vkms_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int vkms_conn_get_modes(struct drm_connector *connector)
+{
+	int count;
+
+	/* Use the default modes list from DRM */
+	count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
+	drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
+
+	return count;
+}
+
+static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
+	.get_modes    = vkms_conn_get_modes,
+};
+
+struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
+{
+	struct drm_device *dev = &vkmsdev->drm;
+	struct vkms_connector *connector;
+	int ret;
+
+	connector = drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
+	if (!connector)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drmm_connector_init(dev, &connector->base, &vkms_connector_funcs,
+				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+
+	drm_connector_helper_add(&connector->base, &vkms_conn_helper_funcs);
+
+	return connector;
+}
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
new file mode 100644
index 000000000000..c9149c1b7af0
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _VKMS_CONNECTOR_H_
+#define _VKMS_CONNECTOR_H_
+
+#include "vkms_drv.h"
+
+/**
+ * struct vkms_connector - VKMS custom type wrapping around the DRM connector
+ *
+ * @drm: Base DRM connector
+ */
+struct vkms_connector {
+	struct drm_connector base;
+};
+
+/**
+ * vkms_connector_init() - Initialize a connector
+ * @vkmsdev: VKMS device containing the connector
+ *
+ * Returns:
+ * The connector or an error on failure.
+ */
+struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev);
+
+#endif /* _VKMS_CONNECTOR_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 22f0d678af3a..4b5abe159add 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -1,37 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include "vkms_connector.h"
 #include "vkms_drv.h"
-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
-#include <drm/drm_probe_helper.h>
-
-static const struct drm_connector_funcs vkms_connector_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static int vkms_conn_get_modes(struct drm_connector *connector)
-{
-	int count;
-
-	/* Use the default modes list from DRM */
-	count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
-	drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
-
-	return count;
-}
-
-static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
-	.get_modes    = vkms_conn_get_modes,
-};
 
 int vkms_output_init(struct vkms_device *vkmsdev)
 {
 	struct drm_device *dev = &vkmsdev->drm;
-	struct drm_connector *connector;
+	struct vkms_connector *connector;
 	struct drm_encoder *encoder;
 	struct vkms_output *output;
 	struct vkms_plane *primary, *overlay, *cursor = NULL;
@@ -73,21 +49,12 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		}
 	}
 
-	connector = drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
-	if (!connector) {
-		DRM_ERROR("Failed to allocate connector\n");
-		return -ENOMEM;
-	}
-
-	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
-				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
-	if (ret) {
+	connector = vkms_connector_init(vkmsdev);
+	if (IS_ERR(connector)) {
 		DRM_ERROR("Failed to init connector\n");
-		return ret;
+		return PTR_ERR(connector);
 	}
 
-	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
-
 	encoder = drmm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
 	if (!encoder) {
 		DRM_ERROR("Failed to allocate encoder\n");
@@ -102,7 +69,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 	encoder->possible_crtcs = drm_crtc_mask(&output->crtc);
 
 	/* Attach the encoder and the connector */
-	ret = drm_connector_attach_encoder(connector, encoder);
+	ret = drm_connector_attach_encoder(&connector->base, encoder);
 	if (ret) {
 		DRM_ERROR("Failed to attach connector to encoder\n");
 		return ret;
-- 
2.48.1

