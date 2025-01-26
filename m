Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B0EA1C7F9
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 14:29:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBB010E0AC;
	Sun, 26 Jan 2025 13:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wwojAVLw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72F910E0AC
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 13:29:14 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5426fcb3c69so3038028e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 05:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737898153; x=1738502953; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=d0vao2kszZEOdw8Rw0H4k+cRcCSPFR9JmZje0hGSkB0=;
 b=wwojAVLwphNJf3D7nwKoaYfU6a/PtFE+GECbnFDlF/Oi3ydpEQudvXJzq2GIrSm7MP
 JupYnHqdzGD13TI6tzaB1MfyCvKfgWeNSmdPNdpMYl+lbdK6dgIRoRwaEWMsOIL/SRd6
 C0vZFofnaErtEv3WOKDJYEYYGBmsRbSVFZxAeC7MaELrgHWTEVPnV+2Fiz0+PQ/cDR9t
 1RN/Ahh5CiAsM8mWgiAki4Vn8JKpOZ67aSn14pWhO7HGQh26nxc2uLcfEBK3DvExXEZp
 xXLNsMDi7Mc75Up1IxZ3SzBNEYaFTbYClNIyzLSK5KpUf0vukLcexOoe6jH/5xhfqqjt
 LY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737898153; x=1738502953;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d0vao2kszZEOdw8Rw0H4k+cRcCSPFR9JmZje0hGSkB0=;
 b=Mb5/kQZ8fK0tQ0uGN0/0gN3/3TMyQadzpnvezoeP4gkB5Hmo78uFx0p0Rav4lmmYEt
 9OH55HqBcEPdmAOTQmOobhqeGCWGIguShIVkEqjuKVrqVNaNC+aRgRjlRjViChGoS8Oz
 4tauU7NKm9oQmEQR1tCA0EPto4AYoRuM0C71da+8VC672TJccfGFgkRIyUHoYkUrEvpi
 flCnZ17BD14+BgsJZqwxCRsPgwfXiW0+V3tfUw5h5TjhOvYmfVOL5FGJS/Rvyqk6vYKa
 73jjm7B+t2M3bpjkuP4ddYVN17KTBVJUGNet8Q+X6J7FkcDcMl+lbEol5u10TQPJLbd+
 QS8w==
X-Gm-Message-State: AOJu0YzIZL94CUJQQOr8yQCbmOo1dS6nDaNBCzqfJ9SLY96If1sio4H7
 ltP8jmOtOqeXHEV4dA3ZroHT5To6gs+Vp5mAhwia98+T0Lh6duilTSVn/hSumVo=
X-Gm-Gg: ASbGnctyQbKREexSXf3fHvRpNTPrNxlP89GwbnQg0ndwm2tcp3/1K95JmCyhQccerpN
 r2UuXf5eAm2RTzQSiH5H6H1FQUuT/C8RSRXbiMpaT5fZ2orKuPZBkcOHiXSDo/vJtpTtF2+MWe5
 g3cbiLrvaRhaoEjAAjHWunj7BXCDxSgKEOHstnZTKRv5beQRgyqs29jxxrGhhVo4sh/EnOl7S+V
 ukZMvPjLwoNzrfTqvIEIbgzVxszarUnaNsn3ap8VEzozNzTbVPrcEcqa4d9A3PoBzBBmoYGdkMj
 UqSPwU/eYbGJ
X-Google-Smtp-Source: AGHT+IGHXX6eQwoZuNh8Wk+TR7mHmi2RdsLJwtN5r6hdBZJ8DQ89NZtSCk1G2dpZieRiC9k4AVWh8w==
X-Received: by 2002:a05:6512:b94:b0:542:7217:361a with SMTP id
 2adb3069b0e04-5439c22c3bemr11810436e87.10.1737898153055; 
 Sun, 26 Jan 2025 05:29:13 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543cbbd4cf8sm770488e87.201.2025.01.26.05.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 05:29:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 26 Jan 2025 15:29:06 +0200
Subject: [PATCH v3 01/10] drm/connector: add CEC-related fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250126-drm-hdmi-connector-cec-v3-1-5b5b2d4956da@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4115;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=exgmtXH0OIK6SdS9CCUitkYz/uNC3k7yD8vdgvaJocQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnljijuKtQNpzaqioCpIWl2z6NyiaPvixrODXyD
 1u4ZXv5VxuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5Y4owAKCRCLPIo+Aiko
 1b5vCACKsF4hItIWVpOk1JfLTGh8G41DIxMQamsfYrT1qdtn3d5VVVXpzRZirdrQqwC7/McDgBm
 vEIbBpCSl9AtzlRcUWsH2DkwxT58Dd8qo4J1ETnwScI03fs/vh4G8raZXfnb6+BJxkHp0ZZuuDK
 0FI18HdZHNyqSdhN+BjailOTRJg4JLTQzHkPa3hDj8xG+iplikXvS4YJJEqoATiVdpbyKNGLSXZ
 MQ7swXp9NNbTKEfCuKPZorEkxeo9UjHdKpbcxgj8qquImsFEttRlPEs2b4okP7hN+XVKxLO69mu
 Ptyx97RCkoafOZjhlHRb3f64euUQa4fn1VuV+30vT7sy+/hS
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

