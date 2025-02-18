Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FE3A3A3A3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 18:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6978010E458;
	Tue, 18 Feb 2025 17:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LnI3LcVE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA52910E117
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 17:08:30 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4396f579634so20767195e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 09:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739898509; x=1740503309; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NfdjeoHNn9vAEGMDN9L94Mho5GfMjQgvCgSJKDEGohI=;
 b=LnI3LcVEeFQKcl3WaAk2JTBQ0s6i6s4UIhvk4xwAOBl7pSo2p7QUyXs6BoS3ET/y27
 xIjoOXcmo2yL5aosP6x37Cb0rsx7km/eFXIdxgGnv0kEWDRp3sI7n1ILa2qAuBL44L8M
 sNbD6qYSpGj5QKbUREw5lvJ5qzg5JfgiwNBFhYteGM4/kHvTAZ3MvKSgXiySro1KaRdb
 Vwie/l0v51KCrrgyLaDjKUIy+NN0+HNxrxFFexsmUmxHU8mqM8Tqisj0q7jMOd+ukWO/
 BAlgf1Y+Ggj1NgKojTpBaRcvD6ee+qWp2vprhzzzKykMUJ78V6mxHNmjBU20vqSmF9GL
 hWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739898509; x=1740503309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NfdjeoHNn9vAEGMDN9L94Mho5GfMjQgvCgSJKDEGohI=;
 b=TjtskKGojEZ7iw9RcXEpjoQZOg+qcWCGZZ7G3GKNwW31uvSVUR5bwFm7HFMzuDXiyp
 gu4LMBheXAWU4TXy+CQQ4gTs4T/otkVw94yDhAH3muF0ZP+Hq+v8XUguyCQADrHvLBA1
 tvaazWpnXChaY+315teAZlphACpmVBrTAh06f1wkVdtQZ4MpWHiFzIeyvN9PRF8LAG5b
 N9rXIqu6nAB4ORGMTwtXfmqsR0m1emiHCfLZolEW6CSIonIXc6XxMm5MZQoSeroyU3+5
 xsNc2izayGE0xUgCfIY26tUyVz9y3DE5l5HHt+w5uXU0ueZEzHa+ULl1zdzlDRmsXS57
 Pm7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKv0mYBF2jHmAwNa5DysN4TyEGOKiVCrgpXiny1Uwd9WhyVppR1eeE53E9bdk7bA73Zv1GJp3Pjg4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWXKlKc7iRjAB0dN9ep33l7HQLzEP/PTuNZMhn4lSf+KXm7lHZ
 jMsFK0C02VhdMSX2hIjVRqZowSx2pF5vxBISfbA/urIhjJiP1H8w
X-Gm-Gg: ASbGncurDr/YIYEIP4ChRrm8OoCqBZ44kJVqnfn+GGtf/EYx/NrmVjirFTGOBirr04g
 8PyLmzdvQqytzNx32WXSVoQ46rbsdD6V9esWxOtm0eZWad38VXWKLpvqIMmQd2U/+l04wFqrw6v
 XItYd1RV0fZVs1nD8eVxCOaWM+sXVcn2sfeCqHWK4gaq3Hw/lTmDgcTddfN/WRdE/+BV4UYzqON
 Kn2chAcis26vs4+y8sHkhx1bWZWlheggaPr+dGKPOACuhwz9VKn5L42caXWDBZWN+8HMZjHZxGs
 3xmVaUxeZpVBp4tWkg==
X-Google-Smtp-Source: AGHT+IE1eFPl5+Oyx/1vusPe9+rS4AS9gxivs8zXH8Jex7fZs4KuM1ByBapfkEHksqciSOncUv53jg==
X-Received: by 2002:a05:600c:1c18:b0:434:fa55:eb56 with SMTP id
 5b1f17b1804b1-43999d923a9mr5039395e9.7.1739898509206; 
 Tue, 18 Feb 2025 09:08:29 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439941bd54bsm24680135e9.11.2025.02.18.09.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 09:08:28 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 13/16] drm/vkms: Allow to update the connector status
Date: Tue, 18 Feb 2025 18:08:05 +0100
Message-ID: <20250218170808.9507-14-jose.exposito89@gmail.com>
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

