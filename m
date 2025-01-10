Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 171E2A08F5E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 12:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4A310E4F8;
	Fri, 10 Jan 2025 11:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SOH5a55A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18BA10E4F8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 11:29:56 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-3003c82c95cso13821591fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 03:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736508535; x=1737113335; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=E+zsDCZfFigYSgeVB6rzkjLbqhGSHEHUBpHs4Qh2FwU=;
 b=SOH5a55AWa/4QCUsbuXmTkqzznU090Ak8riBSruRXpulgtxstWYsEvJtBgNq5pXXfW
 CCCELT0u6cW3CKHh003yiIuMWZeWg0ASPqfZvvAT8d943nDZd0mO9lA6zHjrlWziYTOX
 0YJUSRtF9FCJWPzbDlEb7JofFdnsQNeRVjhZ33xeAmlUN1Kmjb2TADg0wY+A2qoicrfj
 t1HRwB5ucu08OmlRC6fNit1HSfccrSCHmRx1O3Lr4jkcxAWf7tVkswgEqjEgBLJCEwLb
 akuPSDi/9KHefJx/l0oS0veOdNB7oT/khIHnvpDAa8tosG2po+4cG24TnJMF3Mbq04pO
 GLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736508535; x=1737113335;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E+zsDCZfFigYSgeVB6rzkjLbqhGSHEHUBpHs4Qh2FwU=;
 b=qdy1nvY7olGNYNQQhAFvSI5ERggP4MTwf8ZM8C2TZdvriSycaZB8d+Ms8KIHKo5BXm
 aJqQjHnG1Unq6XcFEiVeTNrb7L7D/qnxeQy9f6iTuF/Wn0m4lzhbkuS7T35nHFYhShVV
 fhLZj16FHtcGH4+nShhdi7vVD314ZGCBg2UDWQsK9sOZGSCSz1scviG6XbL5+rP6y1lx
 HhfuUxh0m6fgJTv+Pa9Vh9vqL2esGUcGeKUTLnUMCn8M7KGYmAbrvMQBRaknNZIRd6Rd
 6WSJIyIeHJokmeVw44YRnLAaF4CKu2VVLmrYwVWJKOYkgkqnIvt1US0ix12X9h0HnTh1
 9ESA==
X-Gm-Message-State: AOJu0YzmQ7kHjZKpCHh9cnmlXBERvLbXsKCXLryzbRueWeiRPhXStmBF
 vjafNzAHn9hGIEceb22EAn2meF/wdxl5qigdeO7jGn9nwrU2bp9cWdJC8jtbqfU=
X-Gm-Gg: ASbGncuS+BXeFNa1IvLjTNXaS8K7TdSpZMktOBYTjcgloE7c1vzl82lhA0ubrDAnQkE
 6NBCB5hAwlDStY1WYXBLlUIz0LqqICulH+bJIblfYmKiD57YokLOjwNBi85gm74JQBWk0y3DKzt
 l8qJ7pE24aHb/I5rcem0lbozYdqg3JE44dgJVhjFoOyDvcfJ0k+FUHBApm8kzYME/wh94QbW+Jz
 UW5si0VWEtAG3jBpPXGdFZGvLZCwaJEbJCraKtdmVGz2A5+poiwgi+xIfwhPJU/
X-Google-Smtp-Source: AGHT+IG/t0YcxmPdoJ6ISqYYZH4iCdobwBVzdCsRkfIZj0ncdGkwuaaaKlCp32XDmBXWyFepH3EjlA==
X-Received: by 2002:a05:651c:543:b0:2fb:cc0:2a05 with SMTP id
 38308e7fff4ca-305f462586cmr32040641fa.37.1736508534986; 
 Fri, 10 Jan 2025 03:28:54 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff1c78e8sm4711081fa.86.2025.01.10.03.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 03:28:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 10 Jan 2025 13:28:45 +0200
Subject: [PATCH RFC/RFT v2 2/8] drm/display: add CEC helpers code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-drm-hdmi-connector-cec-v2-2-9067c8f34663@linaro.org>
References: <20250110-drm-hdmi-connector-cec-v2-0-9067c8f34663@linaro.org>
In-Reply-To: <20250110-drm-hdmi-connector-cec-v2-0-9067c8f34663@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10706;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3qw0nxZ6Zp0DIwWrz9kstqe0BFq7IIVKp+gE/6lrOcE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBngQRuuGhtVUXT3QTJqE0B1Is1C6Uha61gULrG6
 B408Fm3EKuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4EEbgAKCRCLPIo+Aiko
 1cGeB/47b+BAHqAZ0QS13y5qzjvXXSTVA0fAmZ9Z6r5KnCO/RcfTHTjcpMNPwbidEPlShNi/2/q
 lXCCk209+Qca/WgRCyZb0AcX0KNDNtZPItDbx1sia/cDZJQ82mfPilKMbIt8YL4JEfXaRy13SYL
 pbWNelvCA/Ap4GaBstcmSgqS6E3ShluQ2u7bwLOTipiF1la+/Rr3RV4hLZGM8bXFuHSY16cc0JM
 o9h2oK8inqEHIRGkHWZOW8q9LLwJv3+RyBuoMB4aWODI9sOi9h2LsAOkQQKtCwTOQsqlGtqPJec
 FRMBm4X5eJUfnS1k2kYOFswgIvU3OO2+NLe9lEz6tOR1rWKN
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
index 0000000000000000000000000000000000000000..8f6d66d813ca1981d827147d951aafe596151d97
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
+int drm_connector_hdmi_cec_adapter_register(struct drm_connector *connector,
+					    const struct drm_connector_hdmi_cec_adapter_ops *ops,
+					    const char *name,
+					    u8 available_las,
+					    struct device *dev)
+{
+	struct cec_connector_info conn_info;
+	struct cec_adapter *cec_adap;
+	int ret;
+
+	mutex_lock(&connector->cec.mutex);
+
+	if (connector->cec.funcs) {
+		ret = -EBUSY;
+		goto err_unlock;
+	}
+
+	if (!ops->base.unregister ||
+	    !ops->init || !!ops->enable || !ops->log_addr || !ops->transmit)
+		return -EINVAL;
+
+	cec_adap = cec_allocate_adapter(&drm_connector_hdmi_cec_adap_ops, connector, name,
+					CEC_CAP_DEFAULTS | CEC_CAP_CONNECTOR_INFO,
+					available_las);
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
+EXPORT_SYMBOL(drm_connector_hdmi_cec_adapter_register);
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
index 0000000000000000000000000000000000000000..b4d76b605017e4824ba2050018c05c7138bee258
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
+int drm_connector_hdmi_cec_adapter_register(struct drm_connector *connector,
+					    const struct drm_connector_hdmi_cec_adapter_ops *ops,
+					    const char *name,
+					    u8 available_las,
+					    struct device *dev);
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

