Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7D1A08F51
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 12:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAF910E10D;
	Fri, 10 Jan 2025 11:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UkrAyrUx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9F310E10D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 11:28:54 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-30227ccf803so15667851fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 03:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736508532; x=1737113332; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=d0vao2kszZEOdw8Rw0H4k+cRcCSPFR9JmZje0hGSkB0=;
 b=UkrAyrUxUYRPUw2bExI7AfLgwG8p+4iTB70zO7DK7VysAFTAmSbWMDPBOccgpzo074
 MxRl4eg4h/HruJGWZby8doHRSmbbOppuC2aXmpY/bgIsPg3Co+N5AxLHfXXN7wJLhBue
 uZiS7yRKwOG4dd5MJcRtgYfK3LWJ0F+O9K+1vbOODd5k1HwWiCaGJk3AQ8hAkT9zvO/v
 3Koat6kStxIknx35b2llrhyruKpmBewN6u2RiAU82iLj/lxgosETyJu+LKMAzOL0Esuy
 hMUsdQJNHSgLtwGSvmdDsg14a7fPYKr64kRh4jHudbfz8GQXsk7iUvGFqyinoefVeAdV
 gxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736508532; x=1737113332;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d0vao2kszZEOdw8Rw0H4k+cRcCSPFR9JmZje0hGSkB0=;
 b=wrX3UcUNmFGhzknxqCjOV5RcTLmzPCCcBPrFqD72zmNRKv/7l9YlI9A5aI6S82xGoQ
 f4WGX/qzJmGON7DKib5gHBLMh5pNcIXJi44s2KHTk3wXOfD3H1OF6XGrhrm+82DrzG4g
 pkmDFpfPpQOkxBeliqUIZDvBPEtBIFiOUI/eGTUp5Hs1J9S4it80AJUahoJZVvK/S7ZJ
 AYqSwoYalbYXxEBaOegQnyXwws7EKhQqc/A0r+ybSSeZuAYOjjt2kkJYt5S2f2WSwrsA
 UNMUQMKObWELXdAendHSYe+AaCwC8WW6wlECHaDKUWCq8VtjMRIrDGslqtFm/GmAuwEC
 /AMQ==
X-Gm-Message-State: AOJu0YzR6yrDTK4rLc/Pp5SgW75zWpccUC0TIZTijc9PiHU7PSgwJsZl
 X61bN2T6ajnVMWt1a6/JO+cYiC0urWUgV/7W7iIH204LIJMy58/HHlLm7O8NzPk=
X-Gm-Gg: ASbGncv4YyXUCyHH+j0A/edHzCu8DdAy+3Bmkz2TIzi0suSF4DEgmBtcGTDExMRSNMV
 OWkahQwhRIyh5i056rlrlJFWu2jqjpb2oFMkQyvF/WXLkCD0vmQqyd+GaRRv1xu2MepAFiR6nK5
 PlkYUGGwM4uPzlD8oT1nmUReXadEprGJ/DrDhJIAc02/KPJOqauqYlYWSUZcRLGvLXIPCo+W2/X
 ZZnpkv3WbXcrbzSscPKIYJf1tYgi9INKkCRaZpLXT9i/MIb1ia3nRIGAxZlBLz+
X-Google-Smtp-Source: AGHT+IFq2Z+1hncub4AWL3RFD0wdO8EZoDd5lrO7r7RLlPYAnsU1t4IN+aU/L5cOw5xszRkkuOIqeA==
X-Received: by 2002:a2e:bea8:0:b0:302:1b18:2c09 with SMTP id
 38308e7fff4ca-305f45ba080mr33912761fa.27.1736508532537; 
 Fri, 10 Jan 2025 03:28:52 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff1c78e8sm4711081fa.86.2025.01.10.03.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 03:28:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 10 Jan 2025 13:28:44 +0200
Subject: [PATCH RFC/RFT v2 1/8] drm/connector: add CEC-related fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-drm-hdmi-connector-cec-v2-1-9067c8f34663@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4115;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=exgmtXH0OIK6SdS9CCUitkYz/uNC3k7yD8vdgvaJocQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBngQRu7ntUsyUqEneqm2g2HPWApf+peseyOwvvh
 gO4anRBflSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4EEbgAKCRCLPIo+Aiko
 1UhOB/9tLLGv24SNNG70JoNw3S7167gU88XGOGIVikq6nxtFGNDDNcPIuQTG095LMLScPVhJi+/
 m7eWbJBCRO1pY4xvbcvm78R+Hny0RWJvuWAJ0IN+FjvJTdMLCOTHmKmJsVWJkJovs14hCnMVb7j
 TICa6T9JKM+8rfRUmA3Z7A/lAFr3eQlCFj+DZ+znLEzFwiDj0c1K3UWDetCg4iEI3BEih9VaLJq
 mnGggk+LPhS4wIxdZKegKFLm6gnyiEtridK3I7L8ktoZB2SX6T+B1qmtZYCLLU3B4TdwJUGtxpV
 Ic34Y3W1kIJeZ96J5CnR+wpdK+SqzdGays2dYJSw3VzzLJRY
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
 drivers/gpu/drm/drm_connector.c | 13 ++++++++++++
 include/drm/drm_connector.h     | 44 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 1383fa9fff9bcf31488453e209a36c6fe97be2f1..fffb718b09eaaac200e6abc7524bbfe98c4741f4 100644
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
@@ -698,6 +699,16 @@ static void drm_mode_remove(struct drm_connector *connector,
 	drm_mode_destroy(connector->dev, mode);
 }
 
+static void drm_connector_cec_unregister(struct drm_connector *connector)
+{
+	mutex_lock(&connector->cec.mutex);
+
+	if (connector->cec.funcs->unregister)
+		connector->cec.funcs->unregister(connector);
+
+	mutex_unlock(&connector->cec.mutex);
+}
+
 /**
  * drm_connector_cleanup - cleans up an initialised connector
  * @connector: connector to cleanup
@@ -718,6 +729,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
 
 	platform_device_unregister(connector->hdmi_audio.codec_pdev);
 
+	drm_connector_cec_unregister(connector);
+
 	if (connector->privacy_screen) {
 		drm_privacy_screen_put(connector->privacy_screen);
 		connector->privacy_screen = NULL;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f13d597370a30dc1b14c630ee00145256052ba56..6da840673b1209c84bbc396643c6033679a7ec74 100644
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
@@ -1191,6 +1192,19 @@ struct drm_connector_hdmi_audio_funcs {
 			   bool enable, int direction);
 };
 
+/**
+ * struct drm_connector_cec_funcs - drm_hdmi_connector control functions
+ */
+struct drm_connector_cec_funcs {
+	/**
+	 * @adap_unregister: unregister CEC adapter / notifier.
+	 *
+	 * The callback to unregister CEC adapter or notifier, so that the core
+	 * DRM layer doesn't depend on the CEC_CORE.
+	 */
+	void (*unregister)(struct drm_connector *connector);
+};
+
 /**
  * struct drm_connector_hdmi_funcs - drm_hdmi_connector control functions
  */
@@ -1832,6 +1846,31 @@ struct drm_connector_hdmi {
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
+	 * @funcs: CEC Control Functions
+	 */
+	const struct drm_connector_cec_funcs *funcs;
+};
+
 /**
  * struct drm_connector - central DRM connector control structure
  *
@@ -2253,6 +2292,11 @@ struct drm_connector {
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

-- 
2.39.5

