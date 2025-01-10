Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 695C6A08F60
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 12:30:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A12B10F075;
	Fri, 10 Jan 2025 11:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uUK/W7Sd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE40F10F076
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 11:30:00 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-303548a933aso14526951fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 03:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736508539; x=1737113339; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jXLvAulPpr4jkjumE6jfbPSF3GlWNhWiDNTbhYjkW2k=;
 b=uUK/W7SdIZAsDZpH7vf+GVwQ1Jf7wwhTG7drG0P1o5L3hBFAHrPL7N6MU1R9ZzkKhB
 rApQKUxuxJ8VYHwtiPH3J8zqiUwl/NtVbeLRGErtJb151nuY1yuhzbCyvA0CuT65MGbj
 2bcDA1d3tKYkuTqBwI8te9XQiBZqQVHDakBWL9EbUbVX+usxdu6W7KnN36uq91Rg+ivg
 FWp2eBPTH/vrxznvxBtCs3QL5zuK8PW4Av3cp/8re46ewkB83FIgztOmmtXHy3PEr7YI
 oFUHTc/q6ixepKpX2wWwogBPl58JIf3ez+C0Vj56BWY7FucqqkQfSSDVwdM3ybgHXg4A
 1UkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736508539; x=1737113339;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jXLvAulPpr4jkjumE6jfbPSF3GlWNhWiDNTbhYjkW2k=;
 b=VIpKpeIrlf7sCo22AgJQTy8vwTzbiHX+ptj2Xfan30GlMof5Rre/Wjbl/i8NRxor2E
 ALwHaIzsWxM0vAJn/+kliEMGjndzDzV+8W+N9A+9Ib1fu5zUSS5TL4usHtVbxS21XJGV
 3FZl/gr8mSTkE5Kt+lmIf3HiF7alVaQ1CLyRdY6Qhd5s9zf4d/FoB4XKPH/keCNIdglG
 Pc87CqG1HbQNKyJmwLlMDazag/ciIQLmiSySoF0aG6GU9KhK0UsWRJ89+3YSuqMU7fsi
 Y+2iAG2MbGvzdIipO0G33lAHIKG4M2k09nczGRTcxA0xkb1y7kPwMgxtyX4pnNutRUQO
 n3Ag==
X-Gm-Message-State: AOJu0Yz1u6uQkTlnkeAoyZeMOoyLYPlea2wEKiPBNWr7Vkssrdm/3uGt
 WEucoVR4TPJDOYyzxmFvDrvhS443ty7eKqypSnFe4MsLqNwy/CnpLwSfn8kZC0s=
X-Gm-Gg: ASbGncvwAbEVezIqBLrmh2gHv0er+kHFBOhuL+xVYy49mGqpFkAl98prdzGanaLq440
 FNfmhtVvGkvorNw5J+IZ0C5+PDU1iuxvO/K8EIJ82ZSBOlczbe+9cuyo7Yz6rOwPsJEn6TWP3VA
 TIti7fZoPCnDh08sm5bEQmK+Fq5tea5kQeXHCfCAxAc4itGBnkfpqSG8uLE3W7phlvVuN2mFsHH
 Y0zDfgFhkdEJaR7PRLGmF5RlcPJQW4M4uFzWkweBDFDlGwNuYeQVzS93gg25yaw
X-Google-Smtp-Source: AGHT+IEe1K9Q7LiO1WkxXo1d8T5/rhk/cZHPgTBbPrPWZ9Xj7fuG8rwuRZTzyYxyigjgNMULiW+q2A==
X-Received: by 2002:a2e:be09:0:b0:300:3a15:8f19 with SMTP id
 38308e7fff4ca-305f45dc70dmr36643481fa.32.1736508538963; 
 Fri, 10 Jan 2025 03:28:58 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff1c78e8sm4711081fa.86.2025.01.10.03.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 03:28:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 10 Jan 2025 13:28:47 +0200
Subject: [PATCH RFC/RFT v2 4/8] drm/vc4: hdmi: switch to generic CEC
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-drm-hdmi-connector-cec-v2-4-9067c8f34663@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10580;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0ZotjbV1DxJPJdFPgp8OMTa7xwQM2FkLyaMbbSKa+Ac=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBngQRuDaGPSc1Bs32NHcUSP8ln1ODjEg3O3TU4n
 SyazyxHlcyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4EEbgAKCRCLPIo+Aiko
 1cVSB/wJwYDjKbpqen8xiMj1HCeZbe+k4NGmoKngk6nej+LHzjGepw6Rus4XTEAR2CVlT3PsGEs
 IbWi0Z3ByIANS4alzcFA9WSe/VCjq2L4dfnz3ctbO6iSmPy+rt2EKE1sDsr3pTjivXENpS9/1Gu
 PZRlr5AIbcEm85zqR0C7y/MF9VqRMIw7ELfzRHKZ9k5YD/qoOLOALi2HQ72kqZtW13EuNrwjsn9
 FQ9/bfHwhQLTvCiPgORgQ4iesRlrHDR7rMUtP9xV87ZW0qbvsnI3msPQX887nUGqBw7Bk3vS5a1
 eAGRrALsEJMfyUjP00JmY0bJiOeK0QZS/OHpo7KXLRHymleJ
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
 drivers/gpu/drm/vc4/Kconfig    |   1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c | 132 ++++++++++++++++-------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |   1 -
 3 files changed, 52 insertions(+), 82 deletions(-)

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
index 47d9ada98430634cfd8c1e21c2a4d00d501bab7e..755c6454b3b71c753f8afc4651e74ec81dc5c6dc 100644
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
 
@@ -2388,8 +2381,8 @@ static irqreturn_t vc4_cec_irq_handler_rx_thread(int irq, void *priv)
 	struct vc4_hdmi *vc4_hdmi = priv;
 
 	if (vc4_hdmi->cec_rx_msg.len)
-		cec_received_msg(vc4_hdmi->cec_adap,
-				 &vc4_hdmi->cec_rx_msg);
+		drm_connector_hdmi_cec_received_msg(&vc4_hdmi->connector,
+						    &vc4_hdmi->cec_rx_msg);
 
 	return IRQ_HANDLED;
 }
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
@@ -2564,9 +2557,9 @@ static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
 	return ret;
 }
 
-static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
+static int vc4_hdmi_cec_enable(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	/* clock period in microseconds */
 	const u32 usecs = 1000000 / CEC_CLOCK_FREQ;
@@ -2631,9 +2624,9 @@ static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 	return 0;
 }
 
-static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
+static int vc4_hdmi_cec_disable(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	int idx;
@@ -2667,17 +2660,17 @@ static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
 	return 0;
 }
 
-static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
+static int vc4_hdmi_cec_adap_enable(struct drm_connector *connector, bool enable)
 {
 	if (enable)
-		return vc4_hdmi_cec_enable(adap);
+		return vc4_hdmi_cec_enable(connector);
 	else
-		return vc4_hdmi_cec_disable(adap);
+		return vc4_hdmi_cec_disable(connector);
 }
 
-static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
+static int vc4_hdmi_cec_adap_log_addr(struct drm_connector *connector, u8 log_addr)
 {
-	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	int idx;
@@ -2703,10 +2696,10 @@ static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 	return 0;
 }
 
-static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
+static int vc4_hdmi_cec_adap_transmit(struct drm_connector *connector, u8 attempts,
 				      u32 signal_free_time, struct cec_msg *msg)
 {
-	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *dev = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	u32 val;
@@ -2749,84 +2742,66 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 	return 0;
 }
 
-static const struct cec_adap_ops vc4_hdmi_cec_adap_ops = {
-	.adap_enable = vc4_hdmi_cec_adap_enable,
-	.adap_log_addr = vc4_hdmi_cec_adap_log_addr,
-	.adap_transmit = vc4_hdmi_cec_adap_transmit,
-};
-
-static void vc4_hdmi_cec_release(void *ptr)
-{
-	struct vc4_hdmi *vc4_hdmi = ptr;
-
-	cec_unregister_adapter(vc4_hdmi->cec_adap);
-	vc4_hdmi->cec_adap = NULL;
-}
-
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
-	if (ret < 0)
-		goto err_delete_cec_adap;
+	return 0;
+}
+
+static const struct drm_connector_hdmi_cec_adapter_ops vc4_hdmi_cec_adap_ops = {
+	.base.unregister = drm_connector_hdmi_cec_unregister,
+	.init = vc4_hdmi_cec_init,
+	.enable = vc4_hdmi_cec_adap_enable,
+	.log_addr = vc4_hdmi_cec_adap_log_addr,
+	.transmit = vc4_hdmi_cec_adap_transmit,
+};
+
+static int vc4_hdmi_cec_register(struct vc4_hdmi *vc4_hdmi)
+{
+	struct platform_device *pdev = vc4_hdmi->pdev;
+	struct device *dev = &pdev->dev;
+
+	if (!of_property_present(dev->of_node, "interrupts")) {
+		dev_warn(dev, "'interrupts' DT property is missing, no CEC\n");
+		return 0;
+	}
 
 	/*
-	 * NOTE: Strictly speaking, we should probably use a DRM-managed
-	 * registration there to avoid removing the CEC adapter by the
-	 * time the DRM driver doesn't have any user anymore.
+	 * NOTE: the CEC adapter will be unregistered from
+	 * drm_connector_cleanup(), which is called from drm_dev_unplug()
+	 * during device unbind.
 	 *
 	 * However, the CEC framework already cleans up the CEC adapter
 	 * only when the last user has closed its file descriptor, so we
 	 * don't need to handle it in DRM.
 	 *
-	 * By the time the device-managed hook is executed, we will give
-	 * up our reference to the CEC adapter and therefore don't
-	 * really care when it's actually freed.
-	 *
 	 * There's still a problematic sequence: if we unregister our
 	 * CEC adapter, but the userspace keeps a handle on the CEC
 	 * adapter but not the DRM device for some reason. In such a
@@ -2837,19 +2812,14 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 	 * the CEC framework already handles this too, by calling
 	 * cec_is_registered() in cec_ioctl() and cec_poll().
 	 */
-	ret = devm_add_action_or_reset(dev, vc4_hdmi_cec_release, vc4_hdmi);
-	if (ret)
-		return ret;
-
-	return 0;
-
-err_delete_cec_adap:
-	cec_delete_adapter(vc4_hdmi->cec_adap);
-
-	return ret;
+	return drm_connector_hdmi_cec_adapter_register(&vc4_hdmi->connector,
+						       &vc4_hdmi_cec_adap_ops,
+						       vc4_hdmi->variant->card_name,
+						       1,
+						       &pdev->dev);
 }
 #else
-static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
+static int vc4_hdmi_cec_register(struct vc4_hdmi *vc4_hdmi)
 {
 	return 0;
 }
@@ -3271,7 +3241,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
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

