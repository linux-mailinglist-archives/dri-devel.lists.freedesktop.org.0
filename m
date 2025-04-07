Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5F9A7D758
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 10:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F70C10E3A9;
	Mon,  7 Apr 2025 08:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ip4qdrOW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C0710E3AF
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 08:14:53 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso26300365e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 01:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744013692; x=1744618492; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xK4w0zRijqvJSQy92+j3ZDq7C+G47BlmHwixThFbhJo=;
 b=Ip4qdrOWFTzbvZNJhvSBicrfWwk5faPhWvmiIEPKC6r5XazwY+FoK3n9McpbHQ7KIi
 5htVP7r1yCQ59rLcqmQQPP+dHw40w84t0SXBvqS8iSt4wlmSma69aSILC/T3AcQCH4kw
 GZUnFqdRlVUOOVeLILs8KEIzDAB1plRRp54NulwlBtC+LvIyJulsC2g1S3yzW1CeeyBI
 WJqwXI7jW72C2n3HhydziqCdG1v9zMkZJrQLmotxjcS1qp+NA4wfy6YiQPvv+h3L3QnF
 yDBJbqQb3oH4haFXOOGAbPwRUqlPrLc/03Dl+qj5yV2YM2Fxh6GWR7vcqDFr2HytxmM6
 abew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744013692; x=1744618492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xK4w0zRijqvJSQy92+j3ZDq7C+G47BlmHwixThFbhJo=;
 b=bPLcRpWsPtf/uOMLuSOAScdcOtKL/omYjP3HCAcgKSTkr6IsuQTTI7AAL31bOdk03M
 IJSEIHqffxiSiUzJb1v3gm5T5TJwQwV/LlzUWFmpRkbd7FhIYEW47J0/tlf9PM5Bcs+L
 1oYwgJaW5cMDfqCHuJeOSr8x6iFLclhdidr9AMAdS4SkMVk4xDV6UGQEDE6r2txCCJRt
 PUX6d/98aYQr/Ph6/T8iJ2D2ZsLwXgLVFVylxOZqiz26kgi3YWfPsrZzJRP4i0JHbzMH
 iS8AJKr72Ev8PjWcODKoRYjFzssaicdSgYnCRhGnfP7/plKhPMRyNsZRow5FHowG4KeB
 rxyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf93HPCv8iRbaIgpUOay952aPjuQFmjm7Tx0OOW7WSDn8nigxDdpd9YAaydpRof1yVgspXXhE9I9A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2VgDV0c5norIf++7GDMNjoQU3xujqfRTwepY5RoeVq+bvz4Ze
 HptNP5FBkB/T07TjbUhmK1OdmLGmFazuf5petPuLQE+ZrxefLT8g
X-Gm-Gg: ASbGnct4JM2u6SJVxNCQz36Z4g7hU/0lyIFMr89lYIuvyct3Fj6hl0jpXr3PfXex5tM
 3SUbho5kd8v+P9MUiVp668lx+6YSEPzVa3RB5seJnCVDO/wb1Z3azQfUeBdpcZs7DcTDrr1zjfj
 fD5AxJbNQ3ZQV8BFN3tkp5VjDDwvieiVrA2G+zBZHqB5SPvr+0RmfOr5ck1AtyEKGCQ1qvpmGu2
 UWkF2rgKwpApin/YJIp2k+KRtxxkBXJ6uRtIclk36U9fhnVgoVdlVcSwPAIKfqGKL21eXur0493
 lBkBXX3pwNgUva55vdbJwPtncsVSQyIkpnIO4rRBhPj/
X-Google-Smtp-Source: AGHT+IGsQmQgOtBj5506Lq6aE02Cl59kHYz8T4g9MsZc1IMQIr6Edi6OTut4/mxeXQ0ztbCMSJbOSQ==
X-Received: by 2002:a05:600c:3111:b0:43c:ef13:7e5e with SMTP id
 5b1f17b1804b1-43ecf9c4691mr96175985e9.26.1744013691702; 
 Mon, 07 Apr 2025 01:14:51 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 01:14:50 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 16/16] drm/vkms: Allow to configure connector status via
 configfs
Date: Mon,  7 Apr 2025 10:14:25 +0200
Message-ID: <20250407081425.6420-17-jose.exposito89@gmail.com>
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

