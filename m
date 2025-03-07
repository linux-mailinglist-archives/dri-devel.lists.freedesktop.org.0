Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26920A56DD8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 17:34:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628C710EBFA;
	Fri,  7 Mar 2025 16:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FwQZSS34";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C747410EBF8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 16:34:22 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-390ec449556so2537558f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 08:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741365261; x=1741970061; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xK4w0zRijqvJSQy92+j3ZDq7C+G47BlmHwixThFbhJo=;
 b=FwQZSS34AWrgntnMMbX0yhWp+14JUBRLhfJ71KsQEiwFrj7geWpv0BEe1qqSyb8dkk
 S8ia06uOlNEjMAXMPL0LUr7igSyhMLHPNIvyeq0UysOT2mg1ROZU+t3jjBD/xuCyTf5u
 ObS08vgz2tf8zmj1R1/YQJgjs8vwL/3tDF3h0dKmOVeKXDd7xvfEO03jjeoLmXluLUfi
 f1SzPj+ZiVj0zGSmrDzYrH/6bAyEdB+ZUJ49OYL5VYIIKIRGND2kTN5N/QpGr2g+zjn0
 67zIfUJyVDMSiTUcJqaD6uGYvG40p7LYoF4YknGGPQ/jMrIfB/kTx9iFaHLEo6x6K7Rw
 jeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741365261; x=1741970061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xK4w0zRijqvJSQy92+j3ZDq7C+G47BlmHwixThFbhJo=;
 b=lJUkv2qiB+trjzS9KhexG+h5ZahG0QIxRl1pm9iFDRwysHcfhYY0d2fNtbi6kCDaqR
 p1k0+IB5T+/Ck6JRDtA+CFVaeZlDsehBcINX2U7eRMBw/lQtFnsxvyvjE6ak7HH7vNsS
 SxMaeKI/bo1enebQIbVYlGT5uTjAWf/3xF2Ly2mHiOzaOVdJfCnsuOCkrnG/QtoiaAmp
 qatV6QmrLLmTTIrfUMw2ZhQYz+EuxlZ7NhF3g0tRMLbuoW9kD1G4RyYQ3kohG69RKm6F
 5Z4DWpvjvwqYtVaiLgFpgXCWwSV4K9S1yGNQ+Y2/x5bSTisjXAhEk/DcsvJU0LZuuzv2
 nyhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+u+aTvi59e+4n5+Cgf+3n34OjGYjnC4d8SEaADzp2QfBY5XizmoBTcVr3LhfDHajEmjt1A4ZC3e0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8lyau+inn2HE16gWC3styogxT0CoYqIeZ3OV428WDtjbRvzrF
 ++UCmJOuT2Nnw0s0soWezF4caSdPWMaVhuS+vDRBypRTjFMErsfW
X-Gm-Gg: ASbGncs5luwR3JkvdOwdzXMnImQvOmxOYpD8zxovZ3iAbtH3UggBCCqjRkb6njryWBC
 NNMjIDzX4T5hXvwRQh/7YNcOygSybyl40CStmWpCwcN6x6uq2YkU8iD0MJKC313lJocGe1moWhu
 FKah9HtMpt+f4/V6wCI8w2VFGszOzNVxjhVzo0MU3bNwuxPBFlu+uF0cIJTtFQncOvEjsPUmBmd
 5UFn5POL1vOe81x8jSJ+CVhlJdHDsnV8vIAYXHHyZuG21lokdSUqdCSN7TMiEWpabQel54GzC8E
 Q5xnWUvZ1NP6IV03iGMcUolp7YdThxcb2rH8K+qHFq4PMb4=
X-Google-Smtp-Source: AGHT+IFIs9tK6Ia3HZmasKFOBkOZ5DkA964+wt56EXCns6wInJJjqFt3Tdwt5ChZJns81z6POSdXoQ==
X-Received: by 2002:a5d:588a:0:b0:391:298c:d673 with SMTP id
 ffacd0b85a97d-39132da2286mr4274440f8f.40.1741365261208; 
 Fri, 07 Mar 2025 08:34:21 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c019557sm6031436f8f.50.2025.03.07.08.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 08:34:20 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3 16/16] drm/vkms: Allow to configure connector status via
 configfs
Date: Fri,  7 Mar 2025 17:33:53 +0100
Message-ID: <20250307163353.5896-17-jose.exposito89@gmail.com>
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

When a connector is created, add a `status` file to allow to update the
connector status to:

 - 1 connector_status_connected
 - 2 connector_status_disconnected
 - 3 connector_status_unknown

If the device is enabled, updating the status hot-plug or unplugs the
connector.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst            |  5 +++
 drivers/gpu/drm/vkms/vkms_configfs.c  | 48 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_connector.c |  7 ++++
 drivers/gpu/drm/vkms/vkms_connector.h |  6 ++++
 4 files changed, 66 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index c551241fe873..7c54099b1dc6 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -108,6 +108,11 @@ Last but not least, create one or more connectors::
 
   sudo mkdir /config/vkms/my-vkms/connectors/connector0
 
+Connectors have 1 configurable attribute:
+
+- status: Connection status: 1 connected, 2 disconnected, 3 unknown (same values
+  as those exposed by the "status" property of a connector)
+
 To finish the configuration, link the different pipeline items::
 
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 8e90acbebd6a..07ab794e1052 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -7,6 +7,7 @@
 #include "vkms_drv.h"
 #include "vkms_config.h"
 #include "vkms_configfs.h"
+#include "vkms_connector.h"
 
 /* To avoid registering configfs more than once or unregistering on error */
 static bool is_configfs_registered;
@@ -512,6 +513,52 @@ static const struct config_item_type encoder_group_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static ssize_t connector_status_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_connector *connector;
+	enum drm_connector_status status;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	scoped_guard(mutex, &connector->dev->lock)
+		status = vkms_config_connector_get_status(connector->config);
+
+	return sprintf(page, "%u", status);
+}
+
+static ssize_t connector_status_store(struct config_item *item,
+				      const char *page, size_t count)
+{
+	struct vkms_configfs_connector *connector;
+	enum drm_connector_status status;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	if (kstrtouint(page, 10, &status))
+		return -EINVAL;
+
+	if (status != connector_status_connected &&
+	    status != connector_status_disconnected &&
+	    status != connector_status_unknown)
+		return -EINVAL;
+
+	scoped_guard(mutex, &connector->dev->lock) {
+		vkms_config_connector_set_status(connector->config, status);
+
+		if (connector->dev->enabled)
+			vkms_trigger_connector_hotplug(connector->dev->config->dev);
+	}
+
+	return (ssize_t)count;
+}
+
+CONFIGFS_ATTR(connector_, status);
+
+static struct configfs_attribute *connector_item_attrs[] = {
+	&connector_attr_status,
+	NULL,
+};
+
 static void connector_release(struct config_item *item)
 {
 	struct vkms_configfs_connector *connector;
@@ -531,6 +578,7 @@ static struct configfs_item_operations connector_item_operations = {
 };
 
 static const struct config_item_type connector_item_type = {
+	.ct_attrs	= connector_item_attrs,
 	.ct_item_ops	= &connector_item_operations,
 	.ct_owner	= THIS_MODULE,
 };
diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index 89fa8d9d739b..b0a6b212d3f4 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -87,3 +87,10 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
 
 	return connector;
 }
+
+void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev)
+{
+	struct drm_device *dev = &vkmsdev->drm;
+
+	drm_kms_helper_hotplug_event(dev);
+}
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
index 90f835f70b3b..35f2adf97e32 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -26,4 +26,10 @@ struct vkms_connector {
  */
 struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev);
 
+/**
+ * struct vkms_device *vkmsdev() - Update the device's connectors status
+ * @vkmsdev: VKMS device to update
+ */
+void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev);
+
 #endif /* _VKMS_CONNECTOR_H_ */
-- 
2.48.1

