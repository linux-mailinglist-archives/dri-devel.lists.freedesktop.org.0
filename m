Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C01DAAE193
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C122110E808;
	Wed,  7 May 2025 13:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kF7wqTqh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A39010E7F6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 13:54:56 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so47554645e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 06:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746626095; x=1747230895; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CWH4UBR5sUqGo9LtpqRAJPm/Evlyrb/fSWQLAWS3kVY=;
 b=kF7wqTqhLknt/WoUOwxgAZzpRR1Ia5yghUKmdWqT5FjZv2g0EYBi4APpYzcYcjfEWu
 RKPflZCRLfeBbbQZoip54XSzx8cYA8Y8Hm9ZQlfF7BYw05HJOsohdMKS0gzbzAkjXcem
 pBg8YEAF/XXw89SkumybgHnwyScVDejI8j3tDhRAqqdhBMrokburVGlZebi7PZ/5lEwb
 GkLriQ6LFz1bx7XjbfQ61ToosLOd9m/NhTf2lSKGkoYmgT9CtE0g4UlRDdbzcbIzvHaH
 DSW0IZkD1PO86ysryZZuD7Q6y+dcvBEiePqIIMLoY+Ec4pgFpYhKiTX4mlmkPsakJARc
 JF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746626095; x=1747230895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CWH4UBR5sUqGo9LtpqRAJPm/Evlyrb/fSWQLAWS3kVY=;
 b=IdNhR7XkgDkCZgCeIoG57VcAjTseFmWD21hp6UVqVxUDN6Z2pMUxlkQneXkYUkTaRt
 Ubf8bwk1T5Zf22+KJe83+MkF90hxA1dizeDcCFxXcd4NZR7f+m5ra63Tlmb3+Wc0k+YE
 mBWBPxMUxF7Qhbay4eGFOfAPPLqEK0+V7+IcqSBCmV7NGpZ8JL/U/CQa+ETzk7r5yuhe
 is6AaUiVS2mNS82uN4cEvJloIG778r9P5AxvVoTWyiKu716u1l4tGkVpQJS8dKJMg2yo
 8SJMQjDuNKuC217CljlZHt0r7xKAC5pwSkx5GR/ZiN68Sw5tlU11QnOT5JqHOkXxbY9U
 rMaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUbQ9d9Et12jKQvcEUt0Q+0NGgeTg5vRShVvthgSJFh//FP6FaU0Gwxv27rCj8hC3RPCEb1vm47wQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHM5hpJoZGKacnEQ1vN3NQtRwqQk0wjf9zVksB1pgHcMjnObPW
 M1CwnXim3nvsLo6i7Czkuusc2Du5T+4bEcUc9nTrL5Tkzrcox9D5
X-Gm-Gg: ASbGncs/CdyGgCc3EHUfxzRC6rrAYrxFOTdWIWMwy+zskA+f4yrkgbbXVEJIj5ZCRea
 8w550dsNuZi+c8lPbKCHkNCcfbk/rHMILo1ViObe2YuW9vzBlwCmyTpyXfSEvwT7GrJLy1sSQTR
 TtXkfZcGEvM9cdPFVF3274II5hHgz5iBMnl6S+mHPORj+SpUs65NqbsikVynZVn7WDyrLs0+AE8
 9y385+lt6Yn8BhczZ79RdllZh9wCi51/odzqOk5v1R6d9FtJPVD2eLJWUVNDnAyAv1oqiUkViwQ
 JmPkYVp09DVU+Sb5PJQM2tF7v+wOrCBZHXWryiZwRw==
X-Google-Smtp-Source: AGHT+IF80fmLVPbtDN3yjIpualYTNgWYYcwvkaJ7VTuW/EM6ksm+G1Qlmrwr48Na58FQ8fjTwc/qvg==
X-Received: by 2002:a05:600c:5307:b0:43d:585f:ebf5 with SMTP id
 5b1f17b1804b1-441d44bc56emr27403975e9.1.1746626094564; 
 Wed, 07 May 2025 06:54:54 -0700 (PDT)
Received: from fedora.. ([94.73.35.165]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 06:54:53 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v5 16/16] drm/vkms: Allow to configure connector status via
 configfs
Date: Wed,  7 May 2025 15:54:31 +0200
Message-ID: <20250507135431.53907-17-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507135431.53907-1-jose.exposito89@gmail.com>
References: <20250507135431.53907-1-jose.exposito89@gmail.com>
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
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
2.49.0

