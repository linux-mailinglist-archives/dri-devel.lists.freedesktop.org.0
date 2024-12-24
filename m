Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7A79FC2CA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 00:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF0910E1B9;
	Tue, 24 Dec 2024 23:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vm1IUzbV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CD010E1B9
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 23:10:21 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5401b7f7141so4891982e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 15:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735081819; x=1735686619; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gkEAYK8kPNECxsGkRJpsJ7xiXmTY2irxwmm/stUUQ/U=;
 b=vm1IUzbV/3YpHhLGQPRdsnc6doAHPKcYWmsjHq40d8lJrM9hHENRysMFAGLdp6o8hS
 gaCtZAWPukN8jWDa0jmaqG27k71HbSX0kW/aqHI1xSV6v1kkkZlTxGmHUYDObmrYMSvB
 ZO6/9PSHPjvz1HtHyuxsXvwTJ7SrCMVoOwwyf9sUTUhcJvhdOZIerSr98mtEFhK3Rakt
 4nEpgZQ9jHKeTrS5Y3OsodCKWlMwdhWibveO+L6PzK0UGIkbS27ctbi4j9IMrwNDb8Xj
 CgrC7e1BXU7BHvExUbZlPmU5qiPE2JiEVUuBdogWf7+ukxioJSvLIsdvtshe1gyIu6KH
 XQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735081819; x=1735686619;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gkEAYK8kPNECxsGkRJpsJ7xiXmTY2irxwmm/stUUQ/U=;
 b=RxcMnl8TIGQ6cA7i9yCK7cy/UyBfNB8OdX3F5PDcG1RMYA6y5X6HquNP/yAlDTKtz1
 KcDxggtfLXIICJcZF6WKhQsGiYQP/5TvMe2sdmwOP1p24cNO1tfbeUNJnhX96OuK2nKh
 ESQcxfyLuDV5ZRPZvimzqxbe0bvVqR/YoiuKlI7xAOE1vYeHiuiPQALRj9IY8K15pyYF
 dbBAmcwOVGrcFsaB3DPTjJCp7K97gKxcCvtqRpcKOOI+Pv/lKV/Dfr024PQKldciRRhf
 NDd/nybIYhjm3jzZcrNSm2cAqZzryRFcaNPrzfPc3+CaSkMQtVJu7xrPHVOUZy3uD8x4
 f8Hw==
X-Gm-Message-State: AOJu0YzV3Wh7+P/8uaHqWsKcEGEtydQdO1BdKuDPqWhWRJxQCq2WrcBn
 7+NlmIZ52ezaSYFDydKR2bTHsE3Bj61k8H0EVhPPKAZaeQJPn/tw9Z7ezO8iw4L4mlrZaF225p5
 +
X-Gm-Gg: ASbGncsBHrNqiwyo6AVFcJn2UUZT3AB4UD/KIrNvSlYMUTgULu5na64YtlFvgAt9AP0
 zgW+37d2V7c4WM+ToIkSH87V82kIEbu/D3D/LZOWrYQMS2a8ye3IwlnAfUlZDpcxNqXquib8s6V
 7EET8Zjt+GPcwB1UPcHxAzVdN10uCTc0/nq+6tdoAxgYfLpH2+XUQaR8ptEEetGvAu7kqzRnego
 J+bHxKxcXtjlEfjoCDRnN2U4G8tAXTzFo0MU+8/bAxJOP4XuiBM7IXjxgh7OvV0
X-Google-Smtp-Source: AGHT+IEwyLXiTl6HwqZYINQzprUx9IZAjXK9evHUTV0H4dLVrHUyChVy+Pe58BeM4nIcvMJsFNUKTA==
X-Received: by 2002:a05:6512:239b:b0:53e:44a4:34e0 with SMTP id
 2adb3069b0e04-5422953306amr6782564e87.16.1735081819558; 
 Tue, 24 Dec 2024 15:10:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f5f74sm1721283e87.43.2024.12.24.15.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 15:10:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 25 Dec 2024 01:10:09 +0200
Subject: [PATCH RFC/RFT 1/9] drm/connector: add CEC-related fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241225-drm-hdmi-connector-cec-v1-1-b80380c67221@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4628;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zAP9ylKK8F/k8ADKJQaYiAs3G6twCNuwzluDDLOa0/w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaz9VkF4oX+7gjkZP8Y1yKMqgeZkKR90iM2yAs
 HhTV8Tw6NqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2s/VQAKCRCLPIo+Aiko
 1XUoCACouGUa5oAtjD5GnC3gjruGwotvNm5gGr85SrA2/2pOOxq9l+xKlniMFWQJUctZSR4hwUw
 z0FsPogNoXzjPlpIbcOy8l0yL2OqeY67nIRTP+dn2BPL6hu7Z/p1WLqJ+hZ65DN/FCYC2Wd4TrW
 5qY5PssSUpxywdZIow7P62xhJvUcMleK8wob+tB9b4ObCb6IjBJDEdT3+3+JBfXP5aV5CgwrEUP
 3uN3u9K4Xu4JgIDHBR2y9E0wMjOkPr5X71LPX8QRkhXC+eSJdFyqEtx2tZzgUR34lPLW8ZGf8xL
 ygyhLgFERD3wYyQXapYukJPLcrwhdQLUDKmWmX83FUAxvjvc
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

As a preparation to adding HDMI CEC helper code, add CEC-related fields
to the struct drm_connector. Include both cec_adapter and cec_notifier,
allowing drivers to select which one to use. The unregister callback
is provided to let drivers unregister CEC-related data in a generic way
without polluting drm_connector.c with dependencies on the CEC
functions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_connector.c | 23 ++++++++++++++++++++++
 include/drm/drm_connector.h     | 43 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 1383fa9fff9bcf31488453e209a36c6fe97be2f1..ef299733041e2c64bebd73c3fe21d4492bc07d3a 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -279,6 +279,7 @@ static int drm_connector_init_only(struct drm_device *dev,
 	INIT_LIST_HEAD(&connector->probed_modes);
 	INIT_LIST_HEAD(&connector->modes);
 	mutex_init(&connector->mutex);
+	mutex_init(&connector->cec.mutex);
 	mutex_init(&connector->eld_mutex);
 	mutex_init(&connector->edid_override_mutex);
 	mutex_init(&connector->hdmi.infoframes.lock);
@@ -698,6 +699,26 @@ static void drm_mode_remove(struct drm_connector *connector,
 	drm_mode_destroy(connector->dev, mode);
 }
 
+/**
+ * drm_connector_cec_unregister - clean up CEC registration
+ * @connector: connector to cleanup
+ *
+ * Reverse corresponding CEC registration. This function is supposed to be
+ * called only by bridge drivers which need to handle CEC manually. Normally
+ * CEC adapter or notifier are automatically unregistered during drm_connector
+ * teardown.
+ */
+void drm_connector_cec_unregister(struct drm_connector *connector)
+{
+	mutex_lock(&connector->cec.mutex);
+
+	if (connector->cec.unregister)
+		connector->cec.unregister(connector);
+
+	mutex_unlock(&connector->cec.mutex);
+}
+EXPORT_SYMBOL(drm_connector_cec_unregister);
+
 /**
  * drm_connector_cleanup - cleans up an initialised connector
  * @connector: connector to cleanup
@@ -718,6 +739,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
 
 	platform_device_unregister(connector->hdmi_audio.codec_pdev);
 
+	drm_connector_cec_unregister(connector);
+
 	if (connector->privacy_screen) {
 		drm_privacy_screen_put(connector->privacy_screen);
 		connector->privacy_screen = NULL;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f13d597370a30dc1b14c630ee00145256052ba56..feecd02e7c698cc0c553b79048c9130f69121012 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -46,6 +46,7 @@ struct drm_property_blob;
 struct drm_printer;
 struct drm_privacy_screen;
 struct drm_edid;
+struct cec_adapter;
 struct edid;
 struct hdmi_codec_daifmt;
 struct hdmi_codec_params;
@@ -1832,6 +1833,41 @@ struct drm_connector_hdmi {
 	} infoframes;
 };
 
+/**
+ * struct drm_connector_cec - DRM Connector CEC-related structure
+ */
+struct drm_connector_cec {
+	/**
+	 * @mutex: protects all CEC-related fields
+	 */
+	struct mutex mutex;
+
+	/**
+	 * @adap: CEC adapter corresponding to the DRM connector.
+	 */
+	struct cec_adapter *adapter;
+
+	/**
+	 * @notifier: CEC notifier corresponding to the DRM connector.
+	 */
+	struct cec_notifier *notifier;
+
+	/**
+	 * @adap_unregister: unregister CEC adapter / notifier.
+	 *
+	 * The callback to unregister CEC adapter or notifier, so that the core
+	 * DRM layer doesn't depend on the CEC_CORE.
+	 */
+	void (*unregister)(struct drm_connector *connector);
+
+	/**
+	 * @uninit_cec_cb: teardown CEC adapter
+	 *
+	 * Perform additional tasks to teardown the CEC adapter.
+	 */
+	void (*uninit_cec)(struct drm_connector *connector);
+};
+
 /**
  * struct drm_connector - central DRM connector control structure
  *
@@ -2253,6 +2289,11 @@ struct drm_connector {
 	 * @hdmi_audio: HDMI codec properties and non-DRM state.
 	 */
 	struct drm_connector_hdmi_audio hdmi_audio;
+
+	/**
+	 * @cec: CEC-related data.
+	 */
+	struct drm_connector_cec cec;
 };
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)
@@ -2294,6 +2335,8 @@ int drm_connector_attach_encoder(struct drm_connector *connector,
 
 void drm_connector_cleanup(struct drm_connector *connector);
 
+void drm_connector_cec_unregister(struct drm_connector *connector);
+
 static inline unsigned int drm_connector_index(const struct drm_connector *connector)
 {
 	return connector->index;

-- 
2.39.5

