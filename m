Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B17A56DD3
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 17:34:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6509210EBF7;
	Fri,  7 Mar 2025 16:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YK8xuiw4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8AE310EBF7
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 16:34:21 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso24150545e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 08:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741365260; x=1741970060; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PnVpWku238hbA4Nkq9IkwuoRE17xKzZpiURAgcmw2aY=;
 b=YK8xuiw4vMtGxxyi5qbal1XHeQV0oRnYhMnGDM1LKRH5Tu5KHlZWJqUr8Tp531+OOX
 ADb5Pk2TP+QS7ZLL+BjLWUOolVGJrzWHwuv72S076vjydm/SxTrO3OAesPo0foXwrMaa
 gAEzvmLXb5TYZZzRc7FTJHRz/Xw1CeyzMNDhyf7wLW6deSgf0Kp05Bl3iB8o3sDko/97
 7VRZHMqyKf/I2zGjWEHnhywMlMnD74OIFjQ8ehrUeoAxGpLluJy+BHqT1+or18j2z2km
 +4wgMCoB42VqFKBnTBGrCCLgG21jTZcXgBmSLw0M3T+Lux9szhj7d7ZZ873A7/ObUEPV
 yVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741365260; x=1741970060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PnVpWku238hbA4Nkq9IkwuoRE17xKzZpiURAgcmw2aY=;
 b=fCUleQVhQXrGsQcuth9Xt/jq63RfaQISM0trkWRUI6P71P+laL8DVWKal0Tfc5TaLT
 gGeIkePl3VBRihSTRTOsYuojVRXySk1qm0XDMEayb1OWsGf74I+uP3BUPEPXJX1ZouwC
 ybeUsjP8OQwcNg0C4GzjpEzkAueAHNz+2XCoflvZ1N8stGnRPupH/i+aCFKSqG1ZIzld
 jYOklbKGleBwcpdBqt651Xq5xcPmuPnJoQCU9Cu61QO3lo/AIdb6b7sjQjUVvHpoc/Nf
 Bo3WriDlGtKHBxeOjqirKzt8CnACd12HkRqErpD3BCQQayv0jZM8Lcbcbu53Bf5A/8h6
 ItkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5bu033pHVjawXsbfBRgPBU/1+WmhaUgnPmiO6LTsmkeF5SMBOqHGMU9EUm+n3fjyUBYe4afnI3XI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgXNBDjZhaDlZLGc4BIx5VgXETJLTh1B5njdacpGwo3xB9Pqh2
 OKnMGch9SNxv2EW/1xCDPvo2DM33PMd12RT/1+xvtU3T9MNxPeK8
X-Gm-Gg: ASbGncu67ScoPw+1MgaLca34q/jmzSwFgqVROI6jJS1yNAj51LCGKJZwZ1Fj2YcGGO7
 ZR4dobBCEG4zx6H2XbMlPilF2zglGYcDoT8iJQQC6ijHok58X/keDIZ64JjWkMIoxZaWg3fnJnc
 zkG+iU1/O4bo5mEJ/zxca8+bI2KDNO7SUEZx3dipk7WOkcTAwzGMfF9hhqbp9xMqVsU+PCMfgEB
 S69NDib0iDW4wUGRUTBHy7wPy7DT3Yq57xM50kZT+/gSBvcxN9e/VLOx2Q7F3XyDXZblk2az1cU
 L/7P43PMgBOsddLEKRX5P8HypCUst9+QAkoMpHGO2N9kM1g=
X-Google-Smtp-Source: AGHT+IF9VU28XVk26daC2mTqspzNuZbNjUdKZ9qIjQPsZn1hhFXRxmxu6k5LBVmtgB181vLER+ecvg==
X-Received: by 2002:a05:600c:3b88:b0:43b:da79:582b with SMTP id
 5b1f17b1804b1-43c601d67edmr41758015e9.18.1741365259880; 
 Fri, 07 Mar 2025 08:34:19 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c019557sm6031436f8f.50.2025.03.07.08.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 08:34:18 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3 15/16] drm/vkms: Allow to update the connector status
Date: Fri,  7 Mar 2025 17:33:52 +0100
Message-ID: <20250307163353.5896-16-jose.exposito89@gmail.com>
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

Implement the drm_connector_funcs.detect() callback to update the
connector status by returning the status stored in the configuration.

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
2.48.1

