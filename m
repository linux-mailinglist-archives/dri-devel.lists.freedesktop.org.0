Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B426D9FC2C7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 00:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92DF910E2AF;
	Tue, 24 Dec 2024 23:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="J3DQrRRQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF7A10E2AF
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 23:10:28 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-3011c7b39c7so62372151fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 15:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735081827; x=1735686627; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=S7U9m2UAtvR0vrRqhfic+TwuHs1eVqtQ6Xbp0YLelcE=;
 b=J3DQrRRQjvBO1o/Q/5w9SGD3mMjDYjAmYyO3hLmXBu5x1HHCfWTmqZ78u+MgJAL/bh
 WufObg84fXu95WscsDldjhhYE3V0UZi1qjCdrUkHrPvGOCR8Afn2I2rxI/vdvAcPluh1
 O4e+2ae+EwJ0vVwaK33ALff3hYyfeczlPECeHNh+S440Km8h9CMUPqsHu9sJA+YtTM31
 PEu8KjdVh8TQHMVVnYvSz40qVPcyao0x/d8UsARD0QxbjxKWbfU6kHWLL5wsTspVJgVO
 huG73MaQLheRgKYhqThLPrRPZ2G5KEsgQQfoMWw5jIitG4YPIPKI7C+NsbzDb7+WzKEc
 JXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735081827; x=1735686627;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S7U9m2UAtvR0vrRqhfic+TwuHs1eVqtQ6Xbp0YLelcE=;
 b=afFWIj81pKILa2zZkpcQTwBHIjkvKenMW9brThs+CuHbBEWyuFVZMIag1yQu4ak/JD
 VU9kHQB8pDI5iox6UgpA4yBZqYa3tYFy8sQ98277WLPOKwQ2sLz2OccFwpcMDdOkea+S
 kEk32DpQRUgHMl/qkNFYEFEXyi4+lBuG/HZ6b850PrvzD/4KfLNFLTwZzilM+6cOqmiW
 Q/42QAlNxY0rkEnCEsxbyeH56gVAXlRwywuvHl7KOrowrZE6YNmLlko7hZWv5vYDRSvq
 wfxHub8r8SFyJZ0mbuOhPD5ODC5d6c6XU1L3zkB7QwvHnqelKblwm+sin3OlzzpBqHwj
 pUFg==
X-Gm-Message-State: AOJu0YzGs8kfENR3ZgernMZNm/uJbvHyENCcDRJoFh1wXaLAWzZHZeRF
 RO9t0MNZAEKhsCz+GaMYgM/biQjPhqN/VvAE0nRQRE4rYpa0Xf5COyKwDuXZdwU=
X-Gm-Gg: ASbGnctk0+QtEHFquCLMltDXIGsR7n4DRyxwCzh8QZbttsAkmrNqyKoWZ7ulfCZTUL8
 WaoGTR+CI6IhkyAss8ehuNQnpGzevhpLeSNy2kpQkglZcIy1EBAHu3Sru5MA0xaYawfTPkXYbyj
 ndnf4jhPxXdHrRQ5EekmB7SJ4Ux9s5zTyPmH1IV2evYprdEJ92UZHVFFYQUK28cr59lvjAS2CFx
 4raZigs7rufMd/5n8ZAe7bH4T+DJx5aGIVwqoFybqQkKxTYRmotL/t1pbEI/ryU
X-Google-Smtp-Source: AGHT+IHen8WkbHetDjZQUHCGpSfWfZ2iTSRPneMJChbm/PXpW+1mtg547OwR/8sNyzK9Lh4FmC+TOA==
X-Received: by 2002:a05:6512:3f20:b0:540:1c8e:b3eb with SMTP id
 2adb3069b0e04-54229561a02mr5987873e87.44.1735081826847; 
 Tue, 24 Dec 2024 15:10:26 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f5f74sm1721283e87.43.2024.12.24.15.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 15:10:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 25 Dec 2024 01:10:12 +0200
Subject: [PATCH RFC/RFT 4/9] drm/vc4: hdmi: switch to generic CEC helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241225-drm-hdmi-connector-cec-v1-4-b80380c67221@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8623;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5qzeIIyAF5KQwVBCVNabcKuWk55QXl7IXd/PJzxgS7A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaz9V94IWHdtqnQ/XR0V2LAXDTDF6YL/gnHeH7
 2vDr06yQQqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2s/VQAKCRCLPIo+Aiko
 1Qd/B/4pOMGvhxbD5fGVxfcAFDZ86b5wCbg1KYCV7feH72+tNDtUUaE6GvGJiAfKdsgADhc7zr+
 QfcErHhSE6hwtTtSFXpIF1gRZ8ZHAbzKJpjB5bJd4/94ZcH0kA5kGkHgYF21HLU7egiEg+NwprW
 WyeS36N6fkdBtW3+7Lz21pufyh8Yjw/jTTrWxwkEnGdfioRVkGi/FS3hbfPFDGaPSkDfYERe67m
 cE5hHfQ/9YlPFsl7WhHJU8ab8WEvCejUeLxXNCMuK7WEksnmuJPtTglBXu11Pv67CHtlMu+p5R4
 WWuLmZDlAHQCEIB4iz4sU14sGJKF1PIHEl7LIH3JDOtNBamz
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

Switch VC4 driver to using CEC helpers code, simplifying hotplug and
registration / cleanup. The existing vc4_hdmi_cec_release() is kept for
now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/Kconfig    |  1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c | 92 ++++++++++++++++++++----------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  1 -
 3 files changed, 44 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
index 6cc7b7e6294a1bfa54137ca65296cd47e46b1e1e..360fbe755951cc40fecb4f9d643a096a6cf92b8e 100644
--- a/drivers/gpu/drm/vc4/Kconfig
+++ b/drivers/gpu/drm/vc4/Kconfig
@@ -34,6 +34,7 @@ config DRM_VC4_HDMI_CEC
 	bool "Broadcom VC4 HDMI CEC Support"
 	depends on DRM_VC4
 	select CEC_CORE
+	select DRM_DISPLAY_HDMI_CEC_HELPER
 	help
 	  Choose this option if you have a Broadcom VC4 GPU
 	  and want to use CEC.
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 47d9ada98430634cfd8c1e21c2a4d00d501bab7e..3086c2ad3bb2e8fafdc1f37ba985aa5785d49f9a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -32,6 +32,7 @@
  */
 
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 #include <drm/display/drm_scdc_helper.h>
@@ -400,16 +401,8 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 	 * the lock for now.
 	 */
 
-	if (status == connector_status_disconnected) {
-		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
-		return;
-	}
-
 	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-	cec_s_phys_addr(vc4_hdmi->cec_adap,
-			connector->display_info.source_physical_address, false);
-
 	if (status != connector_status_connected)
 		return;
 
@@ -2388,7 +2381,7 @@ static irqreturn_t vc4_cec_irq_handler_rx_thread(int irq, void *priv)
 	struct vc4_hdmi *vc4_hdmi = priv;
 
 	if (vc4_hdmi->cec_rx_msg.len)
-		cec_received_msg(vc4_hdmi->cec_adap,
+		cec_received_msg(vc4_hdmi->connector.cec.adapter,
 				 &vc4_hdmi->cec_rx_msg);
 
 	return IRQ_HANDLED;
@@ -2399,14 +2392,14 @@ static irqreturn_t vc4_cec_irq_handler_tx_thread(int irq, void *priv)
 	struct vc4_hdmi *vc4_hdmi = priv;
 
 	if (vc4_hdmi->cec_tx_ok) {
-		cec_transmit_done(vc4_hdmi->cec_adap, CEC_TX_STATUS_OK,
+		cec_transmit_done(vc4_hdmi->connector.cec.adapter, CEC_TX_STATUS_OK,
 				  0, 0, 0, 0);
 	} else {
 		/*
 		 * This CEC implementation makes 1 retry, so if we
 		 * get a NACK, then that means it made 2 attempts.
 		 */
-		cec_transmit_done(vc4_hdmi->cec_adap, CEC_TX_STATUS_NACK,
+		cec_transmit_done(vc4_hdmi->connector.cec.adapter, CEC_TX_STATUS_NACK,
 				  0, 2, 0, 0);
 	}
 	return IRQ_HANDLED;
@@ -2566,7 +2559,8 @@ static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
 
 static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 {
-	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
+	struct drm_connector *connector = cec_get_drvdata(adap);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	/* clock period in microseconds */
 	const u32 usecs = 1000000 / CEC_CLOCK_FREQ;
@@ -2633,7 +2627,8 @@ static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 
 static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
 {
-	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
+	struct drm_connector *connector = cec_get_drvdata(adap);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	int idx;
@@ -2677,7 +2672,8 @@ static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
 
 static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 {
-	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
+	struct drm_connector *connector = cec_get_drvdata(adap);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	int idx;
@@ -2706,7 +2702,8 @@ static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 				      u32 signal_free_time, struct cec_msg *msg)
 {
-	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
+	struct drm_connector *connector = cec_get_drvdata(adap);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *dev = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	u32 val;
@@ -2757,62 +2754,64 @@ static const struct cec_adap_ops vc4_hdmi_cec_adap_ops = {
 
 static void vc4_hdmi_cec_release(void *ptr)
 {
-	struct vc4_hdmi *vc4_hdmi = ptr;
+	struct drm_connector *connector = ptr;
 
-	cec_unregister_adapter(vc4_hdmi->cec_adap);
-	vc4_hdmi->cec_adap = NULL;
+	drm_connector_cec_unregister(connector);
 }
 
-static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
+static int vc4_hdmi_cec_init(struct drm_connector *connector)
 {
-	struct cec_connector_info conn_info;
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct platform_device *pdev = vc4_hdmi->pdev;
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	if (!of_property_present(dev->of_node, "interrupts")) {
-		dev_warn(dev, "'interrupts' DT property is missing, no CEC\n");
-		return 0;
-	}
-
-	vc4_hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
-						  vc4_hdmi,
-						  vc4_hdmi->variant->card_name,
-						  CEC_CAP_DEFAULTS |
-						  CEC_CAP_CONNECTOR_INFO, 1);
-	ret = PTR_ERR_OR_ZERO(vc4_hdmi->cec_adap);
-	if (ret < 0)
-		return ret;
-
-	cec_fill_conn_info_from_drm(&conn_info, &vc4_hdmi->connector);
-	cec_s_conn_info(vc4_hdmi->cec_adap, &conn_info);
-
 	if (vc4_hdmi->variant->external_irq_controller) {
 		ret = devm_request_threaded_irq(dev, platform_get_irq_byname(pdev, "cec-rx"),
 						vc4_cec_irq_handler_rx_bare,
 						vc4_cec_irq_handler_rx_thread, 0,
 						"vc4 hdmi cec rx", vc4_hdmi);
 		if (ret)
-			goto err_delete_cec_adap;
+			return ret;
 
 		ret = devm_request_threaded_irq(dev, platform_get_irq_byname(pdev, "cec-tx"),
 						vc4_cec_irq_handler_tx_bare,
 						vc4_cec_irq_handler_tx_thread, 0,
 						"vc4 hdmi cec tx", vc4_hdmi);
 		if (ret)
-			goto err_delete_cec_adap;
+			return ret;
 	} else {
 		ret = devm_request_threaded_irq(dev, platform_get_irq(pdev, 0),
 						vc4_cec_irq_handler,
 						vc4_cec_irq_handler_thread, 0,
 						"vc4 hdmi cec", vc4_hdmi);
 		if (ret)
-			goto err_delete_cec_adap;
+			return ret;
 	}
 
-	ret = cec_register_adapter(vc4_hdmi->cec_adap, &pdev->dev);
+	return 0;
+}
+
+static int vc4_hdmi_cec_register(struct vc4_hdmi *vc4_hdmi)
+{
+	struct platform_device *pdev = vc4_hdmi->pdev;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	if (!of_property_present(dev->of_node, "interrupts")) {
+		dev_warn(dev, "'interrupts' DT property is missing, no CEC\n");
+		return 0;
+	}
+
+	ret = drm_connector_hdmi_cec_adapter_register(&vc4_hdmi->connector,
+						      &vc4_hdmi_cec_adap_ops,
+						      vc4_hdmi->variant->card_name,
+						      1,
+						      vc4_hdmi_cec_init,
+						      NULL,
+						      &pdev->dev);
 	if (ret < 0)
-		goto err_delete_cec_adap;
+		return ret;
 
 	/*
 	 * NOTE: Strictly speaking, we should probably use a DRM-managed
@@ -2842,14 +2841,9 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 		return ret;
 
 	return 0;
-
-err_delete_cec_adap:
-	cec_delete_adapter(vc4_hdmi->cec_adap);
-
-	return ret;
 }
 #else
-static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
+static int vc4_hdmi_cec_register(struct vc4_hdmi *vc4_hdmi)
 {
 	return 0;
 }
@@ -3271,7 +3265,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		goto err_put_runtime_pm;
 
-	ret = vc4_hdmi_cec_init(vc4_hdmi);
+	ret = vc4_hdmi_cec_register(vc4_hdmi);
 	if (ret)
 		goto err_put_runtime_pm;
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index e3d989ca302b72533c374dfa3fd0d5bd7fe64a82..5acbe27fb57659d02f32ca571dd3ded4a1a0d9dc 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -146,7 +146,6 @@ struct vc4_hdmi {
 	 */
 	bool disable_wifi_frequencies;
 
-	struct cec_adapter *cec_adap;
 	struct cec_msg cec_rx_msg;
 	bool cec_tx_ok;
 	bool cec_irq_was_rx;

-- 
2.39.5

