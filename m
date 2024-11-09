Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644AF9C2D5A
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 13:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BD910E33D;
	Sat,  9 Nov 2024 12:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XBUaSJYJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDED10E33D
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 12:48:47 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53b34ed38easo3071828e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Nov 2024 04:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731156526; x=1731761326; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=I0No8ap6yrBgF/zpJhH8LFZGYsC9p4wbKlDOOUj0WtE=;
 b=XBUaSJYJhDFN4ewyFSjS/O4hv1JK2l6isgCZ/8CoZWX+AlZx2vfyciGBNI/vqydJl2
 gWssMnaBg8y3N2cG1JYZN6M5w/W7uClKjS05301G2bW2pqYknwN5/2ERp3QNYwJIvVV4
 5dzm/17j/Fu9n8ucu8J4LUy5I9QpvVb43FkpfI1o5bomvI0BknkVQTaS9Mnc8nsYiBre
 hAorUJAuc6aDTEJWKqfPHu3C/Or1GOg0IHmJD+sp7lWyq6D+Y3g+XcOkuapUO2GaOZPj
 kmmjExEk1FvXbJk8+YZRxxMKMMt6eRdCJ6upq458BjNZJi8A4eZMQgKHbz1Cl9UXhWSo
 3+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731156526; x=1731761326;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I0No8ap6yrBgF/zpJhH8LFZGYsC9p4wbKlDOOUj0WtE=;
 b=JbE3cJ/kOJHyoNH07YAKoyP0VZwZAC0arO4KYnMt1MFm9KUmcqzLKTdgJSL8d56ewM
 R4fAF5vrlEOM7e1/A9yg/FyBxyMJUfUCAlU5POzXHOEUgLgr8wjSl0yXzQ/0L9rq3unN
 +DygfN7M3BDwJQVCmFy8nPuOCTyFc5DG5j6/DuSEmPzplYG9UEQbtG3DFBxDV/6P9y9q
 78BCk6972WHvUOijgr+pII313tk5TE9l74T60ZhWDJCM+JBbpMyeWPM2iYH9Hoar3xbd
 tzzZLki7/Btac5lNLx8tnSQrDtbKGyQBRlEn097tSYsMFB+99pjVlP0Y6M48R/3D57r+
 cOFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHH7uiwwEOKSgqkT3f5rbW62/3zVGNeU4s52OZQonwfHGg92Q7RHnaJFw7sD8qNfQED7zJcNlwi28=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy73lYwUl0SN1nexkx6uc1O6fTKnwJrXFhAYsQwSuY2y0VKZw75
 7V1csOK3P3PVQV0L4kRPJYtDy53l9ZuUNheZfH6nywiVmCTN+jifTkubdFc3Gjw=
X-Google-Smtp-Source: AGHT+IF1snp8hmbIprhuLbAaPklMzRONrEfLzKFk3MHXaYlX7Kfdq5ocDentIlF/eo4E/8CWA9vtDg==
X-Received: by 2002:a05:6512:3c97:b0:539:e776:71f2 with SMTP id
 2adb3069b0e04-53d862eb5bamr3254572e87.52.1731156525731; 
 Sat, 09 Nov 2024 04:48:45 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d826a9b76sm929967e87.172.2024.11.09.04.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 04:48:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Nov 2024 14:48:32 +0200
Subject: [PATCH v3 6/7] drm/display/hdmi: implement connector update functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-drm-bridge-hdmi-connector-v3-6-c15afdca5884@linaro.org>
References: <20241109-drm-bridge-hdmi-connector-v3-0-c15afdca5884@linaro.org>
In-Reply-To: <20241109-drm-bridge-hdmi-connector-v3-0-c15afdca5884@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3860;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0rIRHIOV78l4xOlDNT90+qbvGFV0Mz2FHXQAMpwi9s8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnL1oeIblR/unQZIwmnM6WdC96PZBguzu1woQcD
 SVQdlnYBieJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy9aHgAKCRCLPIo+Aiko
 1ZOyB/9p6aVrjmHtzLjrNly9np+bYEQfuJ0QIYM/EXaWea+FP44i4iA6sf8TWgd/MRGZSJNjwWn
 pOuP30YciUdt6CB0jFvYmqKXQSFfDKvHj4qsgQl5dlC4J/1NXp/H+ndbMA6LtyFbnPcotAEad+1
 405gfgt8h8uIOTegJXrH2jon/Tz5gLToAX/76eQEDXYRAArBK6m3jfQpLW0Dt6eb7iQ1r7wOFGF
 ZMt5zjfqbobPGkXshJrL3DysSuhsEbVuY66N0oCjBlexOXcdIL7p3QRNBseAQIGqcZ1W4NAxpB4
 tKJ5Xpn2k6sPIaiV85FgyP1bO84YR/aNqxQdf2VVWprNjybJ
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

The HDMI Connectors need to perform a variety of tasks when the HDMI
connector state changes. Such tasks include setting or invalidating CEC
address, notifying HDMI codec driver, updating scrambler data, etc.

Implementing such tasks in a driver-specific callbacks is error prone.
Start implementing the generic helper function (currently handling only
the HDMI Codec framework) to be used by driver utilizing HDMI Connector
framework.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 59 +++++++++++++++++++++++++
 include/drm/display/drm_hdmi_state_helper.h     |  4 ++
 2 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index feb7a3a759811aed70c679be8704072093e2a79b..91073456cadb4a48caacf661cbc8236c7857de9d 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -748,3 +748,62 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	return ret;
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
+
+/**
+ * __drm_atomic_helper_connector_hdmi_update_edid - Update the HDMI Connector basing on passed EDID
+ * @connector: A pointer to the HDMI connector
+ * @drm_edid: EDID to process
+ *
+ * This function should be called as a part of the .detect() / .detect_ctx()
+ * and .force() callbacks, updating the HDMI-specific connector's data. Most of
+ * the drivers should be able to use @drm_atomic_helper_connector_hdmi_update()
+ * instead.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int
+drm_atomic_helper_connector_hdmi_update_edid(struct drm_connector *connector,
+					     const struct drm_edid *drm_edid)
+{
+	drm_edid_connector_update(connector, drm_edid);
+
+	if (!drm_edid) {
+		drm_connector_hdmi_codec_plugged_notify(connector, false);
+
+		// TODO: also handle CEC and scramber, HDMI sink disconnected.
+
+		return 0;
+	}
+
+	drm_connector_hdmi_codec_plugged_notify(connector, true);
+
+	// TODO: also handle CEC and scramber, HDMI sink is now connected.
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update_edid);
+
+/**
+ * drm_atomic_helper_connector_hdmi_update - Update the HDMI Connector after reading the EDID
+ * @connector: A pointer to the HDMI connector
+ *
+ * This function should be called as a part of the .detect() / .detect_ctx()
+ * and .force() callbacks, updating the HDMI-specific connector's data.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int
+drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector)
+{
+	const struct drm_edid *drm_edid;
+	int ret;
+
+	drm_edid = drm_edid_read(connector);
+	ret = drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
+	drm_edid_free(drm_edid);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update);
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index 2d45fcfa461985065a5e5ad67eddc0b1c556d526..9698351307eb3d3dd69bafdff8e321a90a15495f 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -20,4 +20,8 @@ int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector
 int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
 						       struct drm_atomic_state *state);
 
+int drm_atomic_helper_connector_hdmi_update_edid(struct drm_connector *connector,
+						 const struct drm_edid *drm_edid);
+int drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector);
+
 #endif // DRM_HDMI_STATE_HELPER_H_

-- 
2.39.5

