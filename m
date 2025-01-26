Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BF0A1C7FA
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 14:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D85810E1CB;
	Sun, 26 Jan 2025 13:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="loYJy0QZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5869410E1CB
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 13:29:17 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-540218726d5so3907197e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 05:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737898155; x=1738502955; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mtOuCADvqxiQ8qskiTg6RnzWChalNaUWo6+lKfRYGWM=;
 b=loYJy0QZvi4GhY+1Lt/07yaiUN4kkXSVJlpQjK3oPthmC73FMtI63a24dcKkkTREp3
 Fe+fOgxnb8JspfZ4i1gpaPTc4mqx/kAHFtFXvUlFBvDxLIZN+ZEiDmuyIAFYlfI9s3d9
 My8eudCHkoopPcYIM2exvfE5UFnmd8tlRyCcgjFgLUIm8TUsxrz9qGMahrKLHMHkMvVy
 0a6WhAdUDsNPB3iACXiTK5aHhImSST9zDC6tg7hzcxudT67ykslEF6bhfsP0pLJ+1n6i
 vX8XTR1ZrLy5QByDV+IAEyGB/v5uPuSoroI4vEO4xxLOd+pbmGIMjt0uAX1Oed1WnbEk
 V9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737898155; x=1738502955;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mtOuCADvqxiQ8qskiTg6RnzWChalNaUWo6+lKfRYGWM=;
 b=X+PtxUcMJKrZBUwreYrcZoUvdE8JytEICE7xjSHUzIYL55cWo1ScZT+nWflKE1egd7
 Li5uMSGVWGDvtoUJ0Dn7xelsuoWv633OFRCiYUGimeo8ai0K0SzbmUAKKY5kSkHOwyzg
 TxpdrY+jea8uJPPBLTcEmmRGR8IIGdCeBhNizXHXNrE5+M2xrTum6c0jQNSzJ0nfzyLS
 +6+YNxPyzCQceLd67FiOS07ZPlGwSaqpYUyTKhs34iU7a6IRidv5adKIFQe7SS8eQyv1
 afkVN1hg55/r3hGiJsh4jbNGZ31+G4qgm4UjIj50qbYkNexWQnYbvc5wkJkPWd15uwhw
 x1iA==
X-Gm-Message-State: AOJu0YyTGMwe2QxlhIgAhJLgVeSZMl3tpb2qrxvQkAY5Ku24PdpwD1T0
 qID/TWlB3UhOwMCrGolMAWgGb5upPrnBdeZtHvo+ETjXuRmmT6tsu1Q1eaFH3UQ=
X-Gm-Gg: ASbGncv3E3r7OlgF08z2mfDRnhLWUBSKQioyMoAmNpOWmiDmxjSWzZuDchzZI8gxddK
 JsIq5amugh0jJfbA/GxLWo2Hv4aIAmUtTfCUnZqbDWFtlsPAf10rtJgwlUn5ijCITRKR5RBrkwV
 CQk+tR/NmXymq6vGXWsTwvgCZTk0GhS+ybN+n/4os4rmu9EwLYaMpWfIyHQ9rd87Ry66Il9SigZ
 fhl3IHfSbEgDLpy152nV0Y8t5tLk7erpX8n6V/7GC2SBHrWdPtxWDXiHo/Dq0NPePZ8weRIPaNz
 723hwMKRJAfO
X-Google-Smtp-Source: AGHT+IFOVh39CoIeKAxiwxGLv30P4T5xgVBKdF914T+dQZYy4EUSVW/1GagTDS2LlI1AwCUC6vC8Yw==
X-Received: by 2002:a19:5519:0:b0:540:1b2d:8ef3 with SMTP id
 2adb3069b0e04-5439c28854fmr10983563e87.52.1737898155497; 
 Sun, 26 Jan 2025 05:29:15 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543cbbd4cf8sm770488e87.201.2025.01.26.05.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 05:29:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 26 Jan 2025 15:29:07 +0200
Subject: [PATCH v3 02/10] drm/display: add CEC helpers code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250126-drm-hdmi-connector-cec-v3-2-5b5b2d4956da@linaro.org>
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
In-Reply-To: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10695;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OcWcKf/InZviT08C0ZhI5Jo5qPbyiNWwLd10i7D2BeE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnljijFPF1RqGbrj/r74mBNTqY1s66/05q/E0iq
 VnBUdiy+0GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5Y4owAKCRCLPIo+Aiko
 1e4sB/wPzL9K3r1QUEY7NhESKMiCvc/+0HlGVb4HZXsMysrdeJTY9sY9SWpZpI1LxC+//yGvtJb
 H22w+cqi5ShIgmDqz0s06NOvBQOE/6dxX0x07ey7nEG7r9wLvHmKZhUQY4vHLdcttNSR+X9Qo0E
 4BH8O9m5K2+lHQnAc0BBxcY46lC3KzDWbaEAimxKF7SFgNku478Jrik5qFkrfnXxrBdpewXCGMR
 Oi5sJvfxeNADyKSneN/0aJsOBssrXTyue6BhEqGPvI2T9nkvpL1HLSoEXny3NjGeXMURMf29vdV
 uEkkyyaa6IM11JTsp5nbU/GlFOPZqMF5fWVZWg2gQHswJ2zn
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

Add generic CEC helpers to be used by HDMI drivers. Both notifier and
and adapter are supported for registration. Once registered, the driver
can call common set of functions to update physical address, to
invalidate it or to unregister CEC data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/Kconfig               |   5 +
 drivers/gpu/drm/display/Makefile              |   2 +
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c | 209 ++++++++++++++++++++++++++
 include/drm/display/drm_hdmi_cec_helper.h     |  61 ++++++++
 4 files changed, 277 insertions(+)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 8d22b7627d41f7bc015decf24ae02a05bc00f055..49da9b768acf3e5f84f2cefae4bb042cfd57a50c 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -82,6 +82,11 @@ config DRM_DISPLAY_HDMI_AUDIO_HELPER
 	  DRM display helpers for HDMI Audio functionality (generic HDMI Codec
 	  implementation).
 
+config DRM_DISPLAY_HDMI_CEC_HELPER
+	bool
+	help
+	  DRM display helpers for HDMI CEC implementation.
+
 config DRM_DISPLAY_HDMI_HELPER
 	bool
 	help
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index b17879b957d5401721396e247fa346387cf6c48a..2cd078e2b81c1a9e6b336c4187b444bcb8a50e51 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -16,6 +16,8 @@ drm_display_helper-$(CONFIG_DRM_DISPLAY_DSC_HELPER) += \
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDCP_HELPER) += drm_hdcp_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_AUDIO_HELPER) += \
 	drm_hdmi_audio_helper.o
+drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_CEC_HELPER) += \
+	drm_hdmi_cec_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) += \
 	drm_hdmi_helper.o \
 	drm_scdc_helper.o
diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
new file mode 100644
index 0000000000000000000000000000000000000000..a6ed5f0fc3835b013a83308f5285ea0819c5702c
--- /dev/null
+++ b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (c) 2024 Linaro Ltd
+ */
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
+#include <drm/display/drm_hdmi_cec_helper.h>
+
+#include <linux/mutex.h>
+
+#include <media/cec.h>
+#include <media/cec-notifier.h>
+
+void drm_connector_hdmi_cec_unregister(struct drm_connector *connector)
+{
+	cec_unregister_adapter(connector->cec.adapter);
+	connector->cec.adapter = NULL;
+
+	cec_notifier_conn_unregister(connector->cec.notifier);
+	connector->cec.notifier = NULL;
+
+	connector->cec.funcs = NULL;
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_unregister);
+
+static const struct drm_connector_cec_funcs drm_connector_hdmi_cec_funcs = {
+	.unregister = drm_connector_hdmi_cec_unregister,
+};
+
+int drm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
+					     const char *port_name,
+					     struct device *dev)
+{
+	struct cec_connector_info conn_info;
+	struct cec_notifier *notifier;
+	int ret;
+
+	mutex_lock(&connector->cec.mutex);
+
+	if (connector->cec.funcs) {
+		ret = -EBUSY;
+		goto err_unlock;
+	}
+
+	cec_fill_conn_info_from_drm(&conn_info, connector);
+
+	notifier = cec_notifier_conn_register(dev, port_name, &conn_info);
+	if (!notifier) {
+		ret = -ENOMEM;
+		goto err_unlock;
+	}
+
+	connector->cec.notifier = notifier;
+	connector->cec.funcs = &drm_connector_hdmi_cec_funcs;
+
+	mutex_unlock(&connector->cec.mutex);
+
+	return 0;
+
+err_unlock:
+	mutex_unlock(&connector->cec.mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_notifier_register);
+
+#define to_hdmi_cec_adapter_ops(ops) \
+	container_of(ops, struct drm_connector_hdmi_cec_adapter_ops, base)
+
+static int drm_connector_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
+{
+	struct drm_connector *connector = cec_get_drvdata(adap);
+	struct drm_connector_hdmi_cec_adapter_ops *ops =
+		to_hdmi_cec_adapter_ops(connector->cec.funcs);
+
+	return ops->enable(connector, enable);
+}
+
+static int drm_connector_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 logical_addr)
+{
+	struct drm_connector *connector = cec_get_drvdata(adap);
+	struct drm_connector_hdmi_cec_adapter_ops *ops =
+		to_hdmi_cec_adapter_ops(connector->cec.funcs);
+
+	return ops->log_addr(connector, logical_addr);
+}
+
+static int drm_connector_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
+						u32 signal_free_time, struct cec_msg *msg)
+{
+	struct drm_connector *connector = cec_get_drvdata(adap);
+	struct drm_connector_hdmi_cec_adapter_ops *ops =
+		to_hdmi_cec_adapter_ops(connector->cec.funcs);
+
+	return ops->transmit(connector, attempts, signal_free_time, msg);
+}
+
+static const struct cec_adap_ops drm_connector_hdmi_cec_adap_ops = {
+	.adap_enable = drm_connector_hdmi_cec_adap_enable,
+	.adap_log_addr = drm_connector_hdmi_cec_adap_log_addr,
+	.adap_transmit = drm_connector_hdmi_cec_adap_transmit,
+};
+
+int drm_connector_hdmi_cec_register(struct drm_connector *connector,
+				    const struct drm_connector_hdmi_cec_adapter_ops *ops,
+				    const char *name,
+				    u8 available_las,
+				    struct device *dev)
+{
+	struct cec_connector_info conn_info;
+	struct cec_adapter *cec_adap;
+	int ret;
+
+	if (!ops->base.unregister ||
+	    !ops->init || !ops->enable || !ops->log_addr || !ops->transmit)
+		return -EINVAL;
+
+	mutex_lock(&connector->cec.mutex);
+
+	if (connector->cec.funcs) {
+		ret = -EBUSY;
+		goto err_unlock;
+	}
+
+	cec_adap = cec_allocate_adapter(&drm_connector_hdmi_cec_adap_ops, connector, name,
+					CEC_CAP_DEFAULTS | CEC_CAP_CONNECTOR_INFO,
+					available_las ? : CEC_MAX_LOG_ADDRS);
+	ret = PTR_ERR_OR_ZERO(cec_adap);
+	if (ret < 0)
+		goto err_unlock;
+
+	cec_fill_conn_info_from_drm(&conn_info, connector);
+	cec_s_conn_info(cec_adap, &conn_info);
+
+	connector->cec.adapter = cec_adap;
+	connector->cec.funcs = &ops->base;
+
+	ret = ops->init(connector);
+	if (ret < 0)
+		goto err_delete_adapter;
+
+	ret = cec_register_adapter(cec_adap, dev);
+	if (ret < 0)
+		goto err_delete_adapter;
+
+	mutex_unlock(&connector->cec.mutex);
+
+	return 0;
+
+err_delete_adapter:
+	cec_delete_adapter(cec_adap);
+
+	connector->cec.adapter = NULL;
+
+err_unlock:
+	mutex_unlock(&connector->cec.mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_register);
+
+void drm_connector_hdmi_cec_received_msg(struct drm_connector *connector,
+					 struct cec_msg *msg)
+{
+	cec_received_msg(connector->cec.adapter, msg);
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_received_msg);
+
+void drm_connector_hdmi_cec_transmit_attempt_done(struct drm_connector *connector,
+						  u8 status)
+{
+	cec_transmit_attempt_done(connector->cec.adapter, status);
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_transmit_attempt_done);
+
+void drm_connector_hdmi_cec_transmit_done(struct drm_connector *connector,
+					  u8 status,
+					  u8 arb_lost_cnt, u8 nack_cnt,
+					  u8 low_drive_cnt, u8 error_cnt)
+{
+	cec_transmit_done(connector->cec.adapter, status,
+			  arb_lost_cnt, nack_cnt, low_drive_cnt, error_cnt);
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_transmit_done);
+
+void drm_connector_hdmi_cec_phys_addr_invalidate(struct drm_connector *connector)
+{
+	mutex_lock(&connector->cec.mutex);
+
+	cec_phys_addr_invalidate(connector->cec.adapter);
+	cec_notifier_phys_addr_invalidate(connector->cec.notifier);
+
+	mutex_unlock(&connector->cec.mutex);
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_phys_addr_invalidate);
+
+void drm_connector_hdmi_cec_phys_addr_set(struct drm_connector *connector)
+{
+	mutex_lock(&connector->cec.mutex);
+
+	cec_s_phys_addr(connector->cec.adapter,
+			connector->display_info.source_physical_address, false);
+	cec_notifier_set_phys_addr(connector->cec.notifier,
+				   connector->display_info.source_physical_address);
+
+	mutex_unlock(&connector->cec.mutex);
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_phys_addr_set);
diff --git a/include/drm/display/drm_hdmi_cec_helper.h b/include/drm/display/drm_hdmi_cec_helper.h
new file mode 100644
index 0000000000000000000000000000000000000000..cd6274e4ee9b3e41a2d85289c4a420b854340e19
--- /dev/null
+++ b/include/drm/display/drm_hdmi_cec_helper.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef DRM_DISPLAY_HDMI_CEC_HELPER
+#define DRM_DISPLAY_HDMI_CEC_HELPER
+
+#include <drm/drm_connector.h>
+
+#include <linux/types.h>
+
+struct drm_connector;
+
+struct cec_msg;
+struct device;
+
+struct drm_connector_hdmi_cec_adapter_ops {
+	struct drm_connector_cec_funcs base;
+
+	int (*init)(struct drm_connector *connector);
+	void (*uninit)(struct drm_connector *connector);
+
+	int (*enable)(struct drm_connector *connector, bool enable);
+	int (*log_addr)(struct drm_connector *connector, u8 logical_addr);
+	int (*transmit)(struct drm_connector *connector, u8 attempts,
+			u32 signal_free_time, struct cec_msg *msg);
+};
+
+int drm_connector_hdmi_cec_register(struct drm_connector *connector,
+				    const struct drm_connector_hdmi_cec_adapter_ops *ops,
+				    const char *name,
+				    u8 available_las,
+				    struct device *dev);
+
+int drm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
+					     const char *port_name,
+					     struct device *dev);
+
+void drm_connector_hdmi_cec_unregister(struct drm_connector *connector);
+
+void drm_connector_hdmi_cec_received_msg(struct drm_connector *connector,
+					 struct cec_msg *msg);
+
+void drm_connector_hdmi_cec_transmit_done(struct drm_connector *connector,
+					  u8 status,
+					  u8 arb_lost_cnt, u8 nack_cnt,
+					  u8 low_drive_cnt, u8 error_cnt);
+
+void drm_connector_hdmi_cec_transmit_attempt_done(struct drm_connector *connector,
+						  u8 status);
+/*
+ * These functions are used by the state helper, so we end up linking to the
+ * same module. Define stubs to simplify the code.
+ */
+#ifdef CONFIG_DRM_DISPLAY_HDMI_CEC_HELPER
+void drm_connector_hdmi_cec_phys_addr_invalidate(struct drm_connector *connector);
+void drm_connector_hdmi_cec_phys_addr_set(struct drm_connector *connector);
+#else
+static inline void drm_connector_hdmi_cec_phys_addr_invalidate(struct drm_connector *connector) {}
+static inline void drm_connector_hdmi_cec_phys_addr_set(struct drm_connector *connector) {}
+#endif
+
+#endif

-- 
2.39.5

