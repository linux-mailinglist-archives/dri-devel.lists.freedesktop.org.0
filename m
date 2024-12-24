Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 277779FC2CC
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 00:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22F810E2A1;
	Tue, 24 Dec 2024 23:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gvRhpd2Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1337610E2A1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 23:10:24 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-3003943288bso61443261fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 15:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735081822; x=1735686622; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KX9VHwXLWT0YXb/R/ow61sjiLOZURcf2NMX0NiYRIEM=;
 b=gvRhpd2Qpwbx/QElG78JlmiCKWB6LZ0N4IoFXYJ0z4Mb2+USSfZhkD26smmvydQrs4
 RSUvRxiJgJ2NTSrJ2j9irWMsfZ1PJzfyNIq1a4QfcYuEuU8GzDSq8jBsIs7SBul5uGbB
 sCPIvHEUeoQkMzuLVgaxo8oam9nqbEzCGHw8R2AxQI1Sh6w9ATRko9FDacLwK8jMcitF
 yejLancvd+U5jjwqZqBkz1dbHYOwftEsy5XO42CQvN9WLkD3twegh391fLy55/Ic7cbP
 OYma0g5X2dxvTF/nCvO+3vnUYnFxVkEmqt4yFswbQi7ra1RUQUQL2iKkFdEKXmfxdju0
 rgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735081822; x=1735686622;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KX9VHwXLWT0YXb/R/ow61sjiLOZURcf2NMX0NiYRIEM=;
 b=Z2iFlsuwjU4jfeb6vfwR04DepOJQ8h+pWlQXLfhi7lsIqWcP8U8I4psAvvdo/UOPqJ
 JyWh2Xo5YXG+snOA+TG8LK4t/nBmjOtRdDMOR3Yxy4OG0eG+PxNekPns6rmUr0wLZnJX
 RMtI2ZWh8WCZvrh82oFRk9V+AfOeoJ6cYTdRd0FCkS2xUnyKCOovY7M+yLFfaG7CayOU
 zYcj+amnfbBVucJSGB5Z1yEvKEiwMRQOYBtzVm6IV1CH9ubFzR8lFlN2xTDmzaE72zP8
 cydyuPk3cmVPZo8jOL/Bbra0iGt/DiVQfIqH17ltlicLqdqVDfL2PLvdIEiDCsXIN1r0
 jWxA==
X-Gm-Message-State: AOJu0YzzVyJ3KSRvQK0Q01WyLQ3F8PDDeO0r9RiS/UPtknjrVXwhn+PG
 fXcdgcLzhCGS1MeKfR5csxX7lhVNjEExbNzsHyzm+NYLifF3ysCL8t+WWrVAhMM=
X-Gm-Gg: ASbGncu7Se8RdOODwDBH2Y6bbR1HNQpKXlTU+Ngi+IZ2RbTL8FN+SUGU3poP+c1iIkN
 u1qUAB1GPFC4Hf8QedhaO4hiN9sJypu5otBlfqxrc/tfLhfIFGQG1fQOYcBlBvRft1nJvEP9rvI
 okx2vjaPpMLkJjFXN8aSoor9leD82zXBqfYtrR0U491JPrhozufoCzZrzji3s2Osmudfkqv5BBg
 DBj7wycHjKEqyppceaCjXNflVDQVkSXUH4oTsxZ9BzBUdFjzXljPQG+U1R24OwQ
X-Google-Smtp-Source: AGHT+IG972DXnJb1escms0CYD4KMALk35eIDWaRXFeinstt5fliin23jsUMKxcsnmxW5LlakxR0NMQ==
X-Received: by 2002:a05:6512:3d16:b0:53e:ca48:776e with SMTP id
 2adb3069b0e04-54229562a17mr6138588e87.36.1735081821954; 
 Tue, 24 Dec 2024 15:10:21 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f5f74sm1721283e87.43.2024.12.24.15.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 15:10:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 25 Dec 2024 01:10:10 +0200
Subject: [PATCH RFC/RFT 2/9] drm/display: add CEC helpers code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241225-drm-hdmi-connector-cec-v1-2-b80380c67221@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7698;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TXbfNS4WNhmW98nls+Q/o0v6k1eUVeztIzkOAy5ZwIE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaz9VzbgIsXwGp4Xf8rPMw0gjWs+nKOS9ukA/L
 ma5Akr/5EWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2s/VQAKCRCLPIo+Aiko
 1WpUB/9yAcMX4COUKb5mTuTykvEREiVKw8IKEoJLLJbNGnPsoXsO0WELpmQOU0ULFA5lP+J04wS
 2YsT60IOP7OboojHe+pvH9LXKj2hSabm0efZJZBA2YyciRno0vfoUSwUF/2UPB2Hh+myDIHvA5H
 RWpkR6EeKCroYhXk+fT7CfghC2cg5qgM2+qBNXhtwEqH6K7n7recDcR63nxbly9MZp3ICdGJqvE
 3kGu7WLrvmPRpKSCgHPh57zCkPy5rewL34dtl1dWRegtysd784AiP7eY/OA2iam1fWYwpl88s16
 9Zn2VwYXyPnRRmFmJhfkmozesPCM3gcUSIuB5FbeeQgu9zTD
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
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c | 145 ++++++++++++++++++++++++++
 include/drm/display/drm_hdmi_cec_helper.h     |  38 +++++++
 4 files changed, 190 insertions(+)

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
index 0000000000000000000000000000000000000000..2a3832e68232fa3b839a3c7457b2013779cada86
--- /dev/null
+++ b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
@@ -0,0 +1,145 @@
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
+static void drm_connector_hdmi_cec_adapter_unregister(struct drm_connector *connector)
+{
+	cec_unregister_adapter(connector->cec.adapter);
+	connector->cec.adapter = NULL;
+	connector->cec.unregister = NULL;
+}
+
+int drm_connector_hdmi_cec_adapter_register(struct drm_connector *connector,
+					    const struct cec_adap_ops *ops,
+					    const char *name,
+					    u8 available_las,
+					    int (*init_cec)(struct drm_connector *connector),
+					    void (*uninit_cec)(struct drm_connector *connector),
+					    struct device *dev)
+{
+	struct cec_connector_info conn_info;
+	struct cec_adapter *cec_adap;
+	int ret;
+
+	mutex_lock(&connector->cec.mutex);
+
+	if (connector->cec.unregister) {
+		ret = -EBUSY;
+		goto err_unlock;
+	}
+
+	cec_adap = cec_allocate_adapter(ops, connector, name,
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
+
+	ret = init_cec(connector);
+	if (ret < 0)
+		goto err_delete_adapter;
+
+	ret = cec_register_adapter(cec_adap, dev);
+	if (ret < 0)
+		goto err_delete_adapter;
+
+	connector->cec.unregister = drm_connector_hdmi_cec_adapter_unregister;
+	connector->cec.uninit_cec = uninit_cec;
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
+static void drm_connector_hdmi_cec_notifier_unregister(struct drm_connector *connector)
+{
+	cec_notifier_conn_unregister(connector->cec.notifier);
+	connector->cec.notifier = NULL;
+	connector->cec.unregister = NULL;
+}
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
+	if (connector->cec.unregister) {
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
+	connector->cec.unregister = drm_connector_hdmi_cec_notifier_unregister;
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
index 0000000000000000000000000000000000000000..75e6476498a31a05af5a813f1df138e7786520be
--- /dev/null
+++ b/include/drm/display/drm_hdmi_cec_helper.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef DRM_DISPLAY_HDMI_CEC_HELPER
+#define DRM_DISPLAY_HDMI_CEC_HELPER
+
+#include <linux/types.h>
+
+struct drm_connector;
+
+struct cec_adap_ops;
+struct cec_adapter;
+struct device;
+
+int drm_connector_hdmi_cec_adapter_register(struct drm_connector *connector,
+					    const struct cec_adap_ops *ops,
+					    const char *name,
+					    u8 available_las,
+					    int (*init_cec)(struct drm_connector *connector),
+					    void (*uninit_cec)(struct drm_connector *connector),
+					    struct device *dev);
+
+int drm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
+					     const char *port_name,
+					     struct device *dev);
+
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

