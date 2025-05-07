Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1665AAE190
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F301710E802;
	Wed,  7 May 2025 13:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bbvvXK6F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1595E10E7F6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 13:54:55 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso38969905e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 06:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746626093; x=1747230893; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fzdvmCLce4oUcBREEUqYsUXlRBTvwlUXQiKFXpxsJBU=;
 b=bbvvXK6F6OoEprHs75w79Bel3V5L/XucRd7Ik25S6cUJx11LVx1scZA0mw9OZKKuHl
 CoawUpTRWwZ/Sd3ST5WJaIC9oiXHUQzYoDHKMpDZn8PUnKpGF22kilH+gA6sEb2mg1aa
 Lv6uV9At/uEBES6JmpMc8wj/QVsfG2vBDx3DimQ8yXctIoEsxLSMz/gdgYqzEf1hsTso
 LH1mZqxi+iIBYK9oh50A91EEFzI53FIMbma0HU2GSEccnxiBHqHueLLTSK4D7q+HbY7V
 Cr7JAr6dG3FDGXvyqp1e1d+9ZFKJRNzK/yaPMTGI9MGtmSAA5jYTBN/wcBj2538BBOwx
 d6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746626093; x=1747230893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fzdvmCLce4oUcBREEUqYsUXlRBTvwlUXQiKFXpxsJBU=;
 b=h8TVWQ+rJPiAmVT3YQ4n7dYVPQ8aMRcvOPFLCtcGY6TeokV6uPwuYFPMYHRjn1J7wL
 CyNZ1qy9gA9HH7Tx20uXELCSspIdsJ2Iw1rIgqp+i5IHxXYeOaxnsXV1Hebp+8fjYdEq
 VsDfr8jOzWLTNx+d+r/5FRReyVcli4+QXPE6la6e6iF+1Pj/EbyDXRFlZKxaMt5NRDad
 QhjRn7OtsHON+lOMTl91jXXKCtgXIsl2KNdUDfePL7nRBUwBSKX1hSuySX7XhIXbOJmJ
 BJai3S+kjLtborUnYS+4Z9A9/fAfVDmXU0ongdSU+ngAjfP71IBH5ITweBoDcUe2LIIG
 KR1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx0kpEl4j2ZsIze+OFMVkFAszL8u21kPJpWIupGNNMZcBDIRSXJRGZ348VC1ZH/YJodfBMnszvIQc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqgcERVMfljs2gVr3Hag4+Xee3nwz/LIXs8zvLk55EnWA2Tm8q
 7k9wLP56OcFjtGTTT9pUbjPL5L7byaDUXzuKdQ5mkOpcAsiraz+o
X-Gm-Gg: ASbGncsc3sUk0hSa5zpoy6z2TGJ7UCpgj5PurN86OkARX8DwHIvHTGQ1jCcFemienVD
 T8coylSSXy5P/VN5BMATogh9/fWzzFHwuhcS7V++Rnh0iaHlXGvyFP7y2E7s0ROcgQskWB9jtyW
 +Zo0KdMlYupgcdWkWlrA15f7vAsktfaHuDfgarkZVxKHE7texipj3OPi6v+C7vadUa8UY7ZtWs/
 IX3t49V0AaRt4Rr+EBO1ADc+DtrtrsAHKRHdMAa/8Jcr5dUftgch6nR5CVcvBJqLtY6AocPB/x0
 6sgoDKpA6CfLhTqtp5LIPCY8Xmoxv8VlClewvi/uLMVSQlxzH0uO
X-Google-Smtp-Source: AGHT+IGG3bL+HhaYPGibrPLd/2a7+yGl8/1xq0TZv315cjbB4Waj3XNS0Wp4HEItbsdlFXjWXRoA/g==
X-Received: by 2002:a05:600c:1d08:b0:43d:abd:ad0e with SMTP id
 5b1f17b1804b1-441d44c7e3cmr26903405e9.18.1746626093462; 
 Wed, 07 May 2025 06:54:53 -0700 (PDT)
Received: from fedora.. ([94.73.35.165]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 06:54:52 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v5 15/16] drm/vkms: Allow to update the connector status
Date: Wed,  7 May 2025 15:54:30 +0200
Message-ID: <20250507135431.53907-16-jose.exposito89@gmail.com>
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

Implement the drm_connector_funcs.detect() callback to update the
connector status by returning the status stored in the configuration.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_connector.c | 28 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_connector.h |  3 +++
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index 48b10cba322a..89fa8d9d739b 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -5,9 +5,37 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 
+#include "vkms_config.h"
 #include "vkms_connector.h"
 
+static enum drm_connector_status vkms_connector_detect(struct drm_connector *connector,
+						       bool force)
+{
+	struct drm_device *dev = connector->dev;
+	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
+	struct vkms_connector *vkms_connector;
+	enum drm_connector_status status;
+	struct vkms_config_connector *connector_cfg;
+
+	vkms_connector = drm_connector_to_vkms_connector(connector);
+
+	/*
+	 * The connector configuration might not exist if its configfs directory
+	 * was deleted. Therefore, use the configuration if present or keep the
+	 * current status if we can not access it anymore.
+	 */
+	status = connector->status;
+
+	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
+		if (connector_cfg->connector == vkms_connector)
+			status = vkms_config_connector_get_status(connector_cfg);
+	}
+
+	return status;
+}
+
 static const struct drm_connector_funcs vkms_connector_funcs = {
+	.detect = vkms_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
index c9149c1b7af0..90f835f70b3b 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -5,6 +5,9 @@
 
 #include "vkms_drv.h"
 
+#define drm_connector_to_vkms_connector(target) \
+	container_of(target, struct vkms_connector, base)
+
 /**
  * struct vkms_connector - VKMS custom type wrapping around the DRM connector
  *
-- 
2.49.0

