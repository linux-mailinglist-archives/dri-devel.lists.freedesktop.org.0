Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B78AA4494C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 19:00:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3686110E78A;
	Tue, 25 Feb 2025 18:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bXt2rXoK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495CB10E69E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:59:59 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-38f29a1a93bso4753927f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740506398; x=1741111198; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NfdjeoHNn9vAEGMDN9L94Mho5GfMjQgvCgSJKDEGohI=;
 b=bXt2rXoKcfauQWxwZXZ38pGQYh1rI2ap8JInlQeQwyRKaRVegsICWyfRkzJfjD+RH2
 8W8rl861zsK1idLzcZZIBrm9TPNeHtLVIzWADs8mrKeF/OqyQ/e7dq8B2CyuRQKCG9F0
 etqhQQZuLxUl8Il2rf++kDDIa0jbUsoa+LPETt74SS+Lgv7a/v/waHJiL6D8zh9CWdhD
 a1UCEwj7HJNcs9U9b9LUd4ftMEM9io05fS2sK66R7g6ps+9fag1jjgB8iMS6/rZBJgX8
 IYf1famfOCgeP7qd+hf6tfWZFKCWcFT28NsS6A37tJ+o684zNWRS3I7EC9y8PrTukhXY
 N5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506398; x=1741111198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NfdjeoHNn9vAEGMDN9L94Mho5GfMjQgvCgSJKDEGohI=;
 b=BIAGBfhQu0NFu/t8fYuY6CmvEywOToddr0s3sPTQL9FBXSZ5ITNnl2IHuo42shpz1d
 RCXL3cnQL6eo5PfuN1cr87a5PIah2FcYfQeBsXBeklocN+WCuWq101CpqLqjA5TRAWxX
 LWbT0WDAKfZqKImmx1A9E86czRnSFpvw6NALF5e8tAHteIsnnZfs+mZ3xbo6KqOArfcw
 RSQbgSpyWoBpZmvudIdiWFowZjbktJjf1L7PKLXTOfHNl4AcWERrTnOXhqcgn6Yu5XaU
 HLYFmzfH/T4htNRlIb81V5h7GY5WNlAiY1v8OVfBTJjX2gpR/fot7DPFtzKxIzZEqfZy
 4fTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTwlSsFTHN1+W7diAjHem0utjy+whgj+u6EWN+MDriEO1gGkibpPVfeXqbmNFoKYVq3SbcaPjKk4w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhbCVA17FgHuyDKcKG7vV1fBAymhGmUGYLdp/EUP5PTvGRv6Ek
 woXPXkAux0s9tvRsCUv7tbotBx5kQzuv7IpjfhqUI3seHzNOpbe/
X-Gm-Gg: ASbGncvABVST5OhZQ/2GXroFskHzmCqv1HyVMHKd66JDcMQ2glPR09MtjZe1qhZgQ+w
 V7lq63F+W0ZjNxU3Ah1JgmHHN/up/thjQfOQkU+FqUpNIPMdWWuk2rXppDxZLMrQs8FuynazLIV
 /0NSJ7JdgjG/smFMfpQWBH1bLTflhFmkxpxk5Zgm7+LWZfXy9kpFCrJvb/0CU7w2ZVfALet3ps7
 JRvMH5RtuH1dSIsWKKYv66XnqnT35vrzPszvPZK8JQoZQtKSFB5h5EsVQMcmbvhvu+qB2s7lJxn
 wg2gxlZ5F4FL5VrFYo/iGsOcVNGF
X-Google-Smtp-Source: AGHT+IFmy3TLi8XjtwOwVQRKla+t9XcozrFfuQ2APFo1NcW327AwNtnvk589f2rdg/oiUJGtDZCmlg==
X-Received: by 2002:a5d:6483:0:b0:38f:465d:fdf5 with SMTP id
 ffacd0b85a97d-390d4f4310emr170501f8f.26.1740506397599; 
 Tue, 25 Feb 2025 09:59:57 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f3e15sm149063655e9.22.2025.02.25.09.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:59:57 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 15/16] drm/vkms: Allow to update the connector status
Date: Tue, 25 Feb 2025 18:59:35 +0100
Message-ID: <20250225175936.7223-16-jose.exposito89@gmail.com>
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

Implement the drm_connector_funcs.detect() callback to update the
connector status by returning the status stored in the configuration.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_connector.c | 19 ++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_connector.h | 12 +++++++++++-
 drivers/gpu/drm/vkms/vkms_output.c    |  2 +-
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index 48b10cba322a..b03a00b5803a 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -5,9 +5,23 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 
+#include "vkms_config.h"
 #include "vkms_connector.h"
 
+static enum drm_connector_status vkms_connector_detect(struct drm_connector *connector,
+						       bool force)
+{
+	struct vkms_connector *vkms_connector;
+	enum drm_connector_status status;
+
+	vkms_connector = drm_connector_to_vkms_connector(connector);
+	status = vkms_config_connector_get_status(vkms_connector->connector_cfg);
+
+	return status;
+}
+
 static const struct drm_connector_funcs vkms_connector_funcs = {
+	.detect = vkms_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
@@ -40,7 +54,8 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 	.best_encoder = vkms_conn_best_encoder,
 };
 
-struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
+struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
+					   struct vkms_config_connector *connector_cfg)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 	struct vkms_connector *connector;
@@ -50,6 +65,8 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
 	if (!connector)
 		return ERR_PTR(-ENOMEM);
 
+	connector->connector_cfg = connector_cfg;
+
 	ret = drmm_connector_init(dev, &connector->base, &vkms_connector_funcs,
 				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
 	if (ret)
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
index c9149c1b7af0..5ab8a6d65182 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -5,22 +5,32 @@
 
 #include "vkms_drv.h"
 
+struct vkms_config_connector;
+
+#define drm_connector_to_vkms_connector(target) \
+	container_of(target, struct vkms_connector, base)
+
 /**
  * struct vkms_connector - VKMS custom type wrapping around the DRM connector
  *
  * @drm: Base DRM connector
+ * @connector_cfg: Connector configuration
  */
 struct vkms_connector {
 	struct drm_connector base;
+
+	struct vkms_config_connector *connector_cfg;
 };
 
 /**
  * vkms_connector_init() - Initialize a connector
  * @vkmsdev: VKMS device containing the connector
+ * @connector_cfg: Configuration for the connector
  *
  * Returns:
  * The connector or an error on failure.
  */
-struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev);
+struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
+					   struct vkms_config_connector *connector_cfg);
 
 #endif /* _VKMS_CONNECTOR_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 8d7ca0cdd79f..3af95983026e 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -87,7 +87,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		struct vkms_config_encoder *possible_encoder;
 		unsigned long idx = 0;
 
-		connector_cfg->connector = vkms_connector_init(vkmsdev);
+		connector_cfg->connector = vkms_connector_init(vkmsdev, connector_cfg);
 		if (IS_ERR(connector_cfg->connector)) {
 			DRM_ERROR("Failed to init connector\n");
 			return PTR_ERR(connector_cfg->connector);
-- 
2.48.1

