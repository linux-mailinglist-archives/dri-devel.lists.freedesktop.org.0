Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 847BA9FC2CE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 00:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EF110E2B2;
	Tue, 24 Dec 2024 23:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="R1CqiW2t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5143410E2B1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 23:10:38 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53e384e3481so5067323e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 15:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735081837; x=1735686637; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BCaN0AnQNgYbXUjxYsj4Dfl7LjnUIb+yQn6Obl4zIV0=;
 b=R1CqiW2tFGFjMMQ3P7jObi+XKGRrCIJu+He1O/uR0Wh33pIqvDDV1uW+MMbK/XdJxT
 5ADm6uEEnycQDRQSqU2IGC24euqm6CQqm/ipHuOh4+1pQUWmyb8NjJ3QyFHgut2NpQoC
 H4VxxuARBYQh8ioba3v/NZv+X4cmUIG1BhMt7E41LnS9u7n44CXJ8LMWUtalatm98uVq
 qzDFZDJWvg31ha7m6taSFPgmCYdYleyVEXywbTiQqtTza9Lp0Q2jqS+48jHbDQWMucV4
 fL56+lc5ptpN/9MclYGXCtn1dZllwgCfSP+Fw4wf5d8T2dPNBoO4empB1jjpSqWr+VQS
 XJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735081837; x=1735686637;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BCaN0AnQNgYbXUjxYsj4Dfl7LjnUIb+yQn6Obl4zIV0=;
 b=h5FxxCoIxSlGQcDLlVebYxAr39ivIVlIB8bBiOPpIJKmX4OaYr1sEwxGmlY07IE2nV
 lxA2F3WDxWmGwJR3gc3IAyrb/x+IIjW/+Pk+aGfCINfHbtHQkkx57MMUITtiQuEK39O9
 mmzSHoFYptn2sZ67EwV63tiUGcfJwYxjA92MNDMlF0Z1EW+hkn2/ogQrUCWrxXFBm2SN
 PI+rnkl6d2QpSW9gsDPm1mPsSvN49tCvaS5j9+QHqipTwJFz/mEXdbJmv72uNRBU2JLV
 LjLEqReTSmiKnBujn+h+wUcASHT/+Btq894/Y7PFGQYIguKOu32MAdV1pU9zrehMHfz4
 /bhg==
X-Gm-Message-State: AOJu0YxKpuvxILpFgYf+xZ+wGAi4Zb8pF89GPcEsOPkOnnLlgueUGqNM
 f3dsn2yl1ZjvFSd55gD1dBF+Uz83/2mLsyzxHWpRJ58r7Jv6mXojlnRofxtPauk=
X-Gm-Gg: ASbGncujEuSxHqjX/GUl2N/3T/MF+0cNrENO1g/Ut+3mEX+0ngBxVMqSXtBASc0TAcy
 xJBxZpQbQFBZaK4btlT+gNWUOEENFa+ZAyhao8s6XcsvPof6hqN8ujFq0BzlaA3A9ep6Muc0ctB
 2b+kvdi4vZLrnOGIaWXNsDNGEotoUpMBSarmq71GAsXu4jP8PKYXgz7T1stN+4EPBS9mom1xBIB
 iq3VXTrUTKl66wO7HA6/xFfHiLWIp4SKL0dlrcuGDRzxhJPAzrFnqWBim0gufLB
X-Google-Smtp-Source: AGHT+IFVrzVeCp6RMk6VBemfxzPgO1kh+EDDGjra7lj5L6m71WVsinWmKcRRmBsISaTMnTyHjGjfmg==
X-Received: by 2002:a05:6512:114f:b0:540:1d37:e6e with SMTP id
 2adb3069b0e04-542295434f9mr6247183e87.33.1735081836626; 
 Tue, 24 Dec 2024 15:10:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f5f74sm1721283e87.43.2024.12.24.15.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 15:10:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 25 Dec 2024 01:10:16 +0200
Subject: [PATCH RFC/RFT 8/9] drm/display: hdmi-cec-helper: add
 bridge-related functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241225-drm-hdmi-connector-cec-v1-8-b80380c67221@linaro.org>
References: <20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org>
In-Reply-To: <20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5683;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7t8N+meJkwqjJEAn7i1o2Y6T8jyDOQeiyIXpOu8i+xc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaz9WGJm8rCdTIkETaImddvza2ifHFNozBK3UT
 klZZOM/+xyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2s/VgAKCRCLPIo+Aiko
 1f6lB/0a1gIGKUgRbL2RzO61mKzyulTDa78dCT9iHzkTg/bYdyu3Pvk5DOWi76iM/XSrgAPZCZG
 2JX4ueHs5bj8Gsh005sL5+fzjVFPBUTp8kpj0yxKiAzcGMW2dxFRyvXYRb7nkcv6Ur2nEQpmDQG
 4hAlaCAFU3Vez1OhojmdYV2CZKk0nE8MNIni3GYkO28hW6/uAqdoJCyFhHEZ46Thkyu3XIKq5nG
 1YDfkyJk6RVXJT+7LgIELQHvv6XcjJ3TG9PoyczfKTGdzdyH2S/35u7+Bbwior3oiDUYnKw8LSA
 Fqw6W3za7slpt5/OL00DyPgB+l/uuQ3vHGdmBOJWqWIg6AWF
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Let drm_bridge drivers handle CEC adapters in a generic way. Add a set
of helper functions to be called by DRM bridge drivers to report CEC
message-related events.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c | 37 +++++++++++++++++++++++++++
 drivers/gpu/drm/drm_bridge.c                  | 16 ++++++++++++
 include/drm/display/drm_hdmi_cec_helper.h     | 10 ++++++++
 include/drm/drm_bridge.h                      | 13 ++++++++++
 4 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
index 2a3832e68232fa3b839a3c7457b2013779cada86..f54142c6b656b0708e60b009c21ee7584c79a130 100644
--- a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
@@ -143,3 +143,40 @@ void drm_connector_hdmi_cec_phys_addr_set(struct drm_connector *connector)
 	mutex_unlock(&connector->cec.mutex);
 }
 EXPORT_SYMBOL(drm_connector_hdmi_cec_phys_addr_set);
+
+void drm_bridge_cec_transmit_done(struct drm_bridge *bridge, u8 status,
+				  u8 arb_lost_cnt, u8 nack_cnt,
+				  u8 low_drive_cnt, u8 error_cnt)
+{
+	mutex_lock(&bridge->cec_mutex);
+
+	if (bridge->cec_adapter)
+		cec_transmit_done(bridge->cec_adapter, status, arb_lost_cnt,
+				  nack_cnt, low_drive_cnt, error_cnt);
+
+	mutex_unlock(&bridge->cec_mutex);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_cec_transmit_done);
+
+void drm_bridge_cec_transmit_attempt_done(struct drm_bridge *bridge, u8 status)
+{
+	mutex_lock(&bridge->cec_mutex);
+
+	if (bridge->cec_adapter)
+		cec_transmit_attempt_done(bridge->cec_adapter, status);
+
+	mutex_unlock(&bridge->cec_mutex);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_cec_transmit_attempt_done);
+
+void drm_bridge_cec_received_msg(struct drm_bridge *bridge,
+				 struct cec_msg *msg)
+{
+	mutex_lock(&bridge->cec_mutex);
+
+	if (bridge->cec_adapter)
+		cec_received_msg(bridge->cec_adapter, msg);
+
+	mutex_unlock(&bridge->cec_mutex);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_cec_received_msg);
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c6af46dd02bfa9e15b59e4c460debdd7fd84be44..c7522e20009977632d9fcd0327d856b9d60893d0 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -206,6 +206,7 @@ static LIST_HEAD(bridge_list);
 void drm_bridge_add(struct drm_bridge *bridge)
 {
 	mutex_init(&bridge->hpd_mutex);
+	mutex_init(&bridge->cec_mutex);
 
 	mutex_lock(&bridge_lock);
 	list_add_tail(&bridge->list, &bridge_list);
@@ -248,6 +249,7 @@ void drm_bridge_remove(struct drm_bridge *bridge)
 	mutex_unlock(&bridge_lock);
 
 	mutex_destroy(&bridge->hpd_mutex);
+	mutex_destroy(&bridge->cec_mutex);
 }
 EXPORT_SYMBOL(drm_bridge_remove);
 
@@ -1302,6 +1304,20 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
 
+void drm_bridge_cec_adapter_set(struct drm_bridge *bridge,
+				struct cec_adapter *cec_adapter)
+{
+	if (!(bridge->ops & DRM_BRIDGE_OP_HDMI))
+		return;
+
+	mutex_lock(&bridge->cec_mutex);
+
+	bridge->cec_adapter = cec_adapter;
+
+	mutex_unlock(&bridge->cec_mutex);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_cec_adapter_set);
+
 #ifdef CONFIG_OF
 /**
  * of_drm_find_bridge - find the bridge corresponding to the device node in
diff --git a/include/drm/display/drm_hdmi_cec_helper.h b/include/drm/display/drm_hdmi_cec_helper.h
index 75e6476498a31a05af5a813f1df138e7786520be..8d31f9e2e4bd3a62a8b92ebcd1e4672daf8f585e 100644
--- a/include/drm/display/drm_hdmi_cec_helper.h
+++ b/include/drm/display/drm_hdmi_cec_helper.h
@@ -5,10 +5,12 @@
 
 #include <linux/types.h>
 
+struct drm_bridge;
 struct drm_connector;
 
 struct cec_adap_ops;
 struct cec_adapter;
+struct cec_msg;
 struct device;
 
 int drm_connector_hdmi_cec_adapter_register(struct drm_connector *connector,
@@ -35,4 +37,12 @@ static inline void drm_connector_hdmi_cec_phys_addr_invalidate(struct drm_connec
 static inline void drm_connector_hdmi_cec_phys_addr_set(struct drm_connector *connector) {}
 #endif
 
+void drm_bridge_cec_transmit_done(struct drm_bridge *bridge, u8 status,
+				  u8 arb_lost_cnt, u8 nack_cnt,
+				  u8 low_drive_cnt, u8 error_cnt);
+void drm_bridge_cec_transmit_attempt_done(struct drm_bridge *bridge, u8 status);
+
+void drm_bridge_cec_received_msg(struct drm_bridge *bridge,
+				 struct cec_msg *msg);
+
 #endif
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 348778f233b06265a6ae577762c6558e69cdb396..a848ab63cc8e9c917e7ca3fe4e279bcf2a83cbb2 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -32,6 +32,7 @@
 #include <drm/drm_mode_object.h>
 #include <drm/drm_modes.h>
 
+struct cec_adapter;
 struct device_node;
 
 struct drm_bridge;
@@ -939,6 +940,15 @@ struct drm_bridge {
 	 * @hpd_cb.
 	 */
 	void *hpd_data;
+
+	/**
+	 * @cec_mutex: Protects the @cec_adapter field.
+	 */
+	struct mutex cec_mutex;
+	/**
+	 * @cec_adapter: Private data to be used by the CEC callbacks.
+	 */
+	struct cec_adapter *cec_adapter;
 };
 
 static inline struct drm_bridge *
@@ -1062,6 +1072,9 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge);
 void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 			   enum drm_connector_status status);
 
+void drm_bridge_cec_adapter_set(struct drm_bridge *bridge,
+				struct cec_adapter *cec_adapter);
+
 #ifdef CONFIG_DRM_PANEL_BRIDGE
 bool drm_bridge_is_panel(const struct drm_bridge *bridge);
 struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);

-- 
2.39.5

