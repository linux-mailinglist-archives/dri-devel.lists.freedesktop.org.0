Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 278FDA3A3A5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 18:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3ECB10E45F;
	Tue, 18 Feb 2025 17:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OUYmp//T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE7D10E117
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 17:08:31 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso37668155e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 09:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739898510; x=1740503310; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HlEG/chzPR/lrdsujZEdOLY/tag0kKNloUyKVadlYPE=;
 b=OUYmp//TbdJ7iEfXegOqLnsLW6i5kdqdzp7ha9mxtVIQrbU16AOvns4uZuo5R51i74
 EkekCj1luW+jdOH1/fdnKohZsY97z0EY+GiNE/ymAAJfPXMNzqXH/ZDJ+fo4hBIcR8++
 /Vcp5JmJ+VMR+Ai9awFSjAVSsSTtw1jNjaraW5mkO+P+nd3epii8u6S6MLubXNNZfdpf
 gv2IeTFuaIQRG86FPUn6T5xScdnXktfNzMuZIdfxn1MN0O/l9lIlcoGk6IMP2nAhDJ3x
 Xo6kvXP58o5Y4XJEQixNWZTqDD3PuL1CLC+HJfY49/oK36DjY2azPsVpookw39BoiFFZ
 4ouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739898510; x=1740503310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HlEG/chzPR/lrdsujZEdOLY/tag0kKNloUyKVadlYPE=;
 b=RCkV1tqoGJ4Wph1lre6tyOcUqbfi+tVkqCvI1qnec41On3ctqjDTVyCsW3gpu2hEAJ
 b4eiJqGCsP6kLg6eAZcJvSKfaOwjOtah3y2bhmhJ3HqWmEVy3y3+fWZ70KU3nqiHUTaE
 ZorppC8TgGRSqG/6X3ARaRYUGptWppDkF4O2cvUQsZURAw4ukTx7wTeTGtceAY484YnZ
 Qfx0bUImFvDsG1A8Ux4dWgBgzq8i5TkHHAaQ8moau6bpI6ITJpNsEh2RTPE2ADx17KJa
 CXgjWOMdGKhXRiWmmOJCX7LZ0IsUBGUPUZ5e0TKSiL2p7rAFijYcI0AEh/fh+SElITQa
 9Wjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRLP7+l1O9g3AnBFJAh/0i34Ck9aRpK2beC6U2e+3v/Bohl2pstBW1mKUbrqIPOGjNrA4LwXGrJcg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOvCaJTvYOpNa8fgfTOtVs308jfwTKCpOTdfPx/68Jwx23J84K
 dh4q8QskwtW7IBceUEEhm0fpZN0k8KvAU0slPBIKiWoPLXQvHGov
X-Gm-Gg: ASbGncv65NQ4++CPnwWNRl459ksSzqwNEnh0Ow1VVosi+8na9wUmpXS6o5mHKz+2Jf+
 udETD6PX2gyKfw1BI6jMJbrx3tsG9oFyAlBK5biQna+syHxplg4snw0dbhOnwmeaQN96aHLx1vz
 y2Ku5dTSLNJcOGweO6HIpHn8M7zm7pUY68Qz5iAY8KTdUqzoNIDUb7y+EL4H1WMFf/670dKCUNw
 EP1+OLrI3oZVX2SPfFyqWaxNRHX6IU9Fyv1OmrntVwd23XfH+odjLUrKdNLtAuxgkP/JkILfh9x
 f0cWjOI+So8y98SLWw==
X-Google-Smtp-Source: AGHT+IHJmx9NR3wfEj00ecrWtmWoVJ6ofaJLqeLW5MRWaQuX9F66y4B2x+CLpKatjE9UzUn3+3O1BQ==
X-Received: by 2002:a05:600c:1c86:b0:439:9863:e876 with SMTP id
 5b1f17b1804b1-4399863e985mr13677105e9.24.1739898510369; 
 Tue, 18 Feb 2025 09:08:30 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439941bd54bsm24680135e9.11.2025.02.18.09.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 09:08:29 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 14/16] drm/vkms: Allow to configure connector status via
 configfs
Date: Tue, 18 Feb 2025 18:08:06 +0100
Message-ID: <20250218170808.9507-15-jose.exposito89@gmail.com>
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

When a connector is created, add a `status` file to allow to update the
connector status to:

 - 1 connector_status_connected
 - 2 connector_status_disconnected
 - 3 connector_status_unknown

If the device is enabled, updating the status hot-plug or unplugs the
connector.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst            |  4 +++
 drivers/gpu/drm/vkms/vkms_configfs.c  | 51 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_connector.c |  7 ++++
 drivers/gpu/drm/vkms/vkms_connector.h |  6 ++++
 4 files changed, 68 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 0212e99e12dd..3068879ce1fc 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -107,6 +107,10 @@ Last but not least, create one or more connectors::
 
   sudo mkdir /config/vkms/my-vkms/connectors/connector0
 
+Connectors have 1 configurable attribute:
+
+- status: Connection status: 1 connected, 2 disconnected, 3 unknown
+
 To finish the configuration, link the different pipeline items::
 
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 9036d9983078..f0813536be12 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -6,6 +6,7 @@
 #include "vkms_drv.h"
 #include "vkms_config.h"
 #include "vkms_configfs.h"
+#include "vkms_connector.h"
 
 /* To avoid registering configfs more than once or unregistering on error */
 static bool is_configfs_registered;
@@ -567,6 +568,55 @@ static const struct config_item_type encoder_group_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static ssize_t connector_status_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_connector *connector;
+	enum drm_connector_status status;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	mutex_lock(&connector->dev->lock);
+	status = vkms_config_connector_get_status(connector->config);
+	mutex_unlock(&connector->dev->lock);
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
+	mutex_lock(&connector->dev->lock);
+
+	vkms_config_connector_set_status(connector->config, status);
+
+	if (connector->dev->enabled)
+		vkms_trigger_connector_hotplug(connector->dev->config->dev);
+
+	mutex_unlock(&connector->dev->lock);
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
@@ -586,6 +636,7 @@ static struct configfs_item_operations connector_item_operations = {
 };
 
 static const struct config_item_type connector_item_type = {
+	.ct_attrs	= connector_item_attrs,
 	.ct_item_ops	= &connector_item_operations,
 	.ct_owner	= THIS_MODULE,
 };
diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index b03a00b5803a..ed99270c590f 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -76,3 +76,10 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
 
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
index 5ab8a6d65182..7865f54a313c 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -33,4 +33,10 @@ struct vkms_connector {
 struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
 					   struct vkms_config_connector *connector_cfg);
 
+/**
+ * struct vkms_device *vkmsdev() - Update the device's connectors status
+ * @vkmsdev: VKMS device to update
+ */
+void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev);
+
 #endif /* _VKMS_CONNECTOR_H_ */
-- 
2.48.1

