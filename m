Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BE79E6B93
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 11:17:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE69D10F09E;
	Fri,  6 Dec 2024 10:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CMv7MUgO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D66B10F093
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 10:16:59 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53e22458fb5so1710053e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 02:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733480217; x=1734085017; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GHXQ08P5B8mUzCAvgp3K0OAFdV2V7CRGE9vgNvuacPg=;
 b=CMv7MUgOLtxfA0Cz97o0nSx0aEsjByRQVA0kA/r/0uq/vvHXOYZbNg4jmU7f0fhm8+
 mtSo9F2VNhHhFc417CsUY1/U/Jt3bZoaFaFkCLIDd7xqqysvLUfKWo7bPGCXofigkgAC
 PFKMeRkP9DHhtNRrtuG5sVaoXNkQqbUq8SSTfyanHRh75fkEplo2fi8pcBzdvnRO2qvd
 XwAAaz9iwaOClrDMCqwsZHSWM2fjP5WO3jJLrh2EiOEJaFwvMHtT+wsN6UERvISEds7C
 aMJ49xhzuJqe4Lm3zgH1TeKwWhYDvU2Qgf4go/cSUIkQSU38P3kFQDnqWuoBo9uSGT67
 33FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733480217; x=1734085017;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GHXQ08P5B8mUzCAvgp3K0OAFdV2V7CRGE9vgNvuacPg=;
 b=DsOV2CcpljSh2PJadfjlYFkwGaN5sNE9dfx0f++SIFwdnxnm+O69dbcL1A13hgqpMM
 rNSWz8LxHGWstsSIKTQmBBQk00SuufLxLWJ7y6sh7xvi5IqWtJVn1YtRPv4/NCSkzQHK
 3YmLdFxHCRs0q2zHZjzi0AiY9+qvcWKaOm42VcxyxL9e6GQdnZor5sFy4Vtxiyx3Axnd
 Mj48nFwt+fnZ4wO+R1V5o/HL8UIxwx+RxsMihJJ6rdJqE6qvuuURSiF6jlG1tW6pQHi8
 E9mNj8Zq5jWpevl2HCiJpGrqmdlSrUeskkpB/b1PdK6XRf8K5887dlQZ1MwZl6HOtRzm
 OIpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqdnEXMSZJuRAYrLf1reZKg3f28L9wlB/Vz032lXRD0pAOJR8e5nfhLumxOfbgO6JfB5UhhPHUo1w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvTp31HaJJ8v3gms21TH094hdDABcz9wZOD0t9x6XYlP7S9Nhg
 CaGWfQewnaOwZGTyLAKX3lLYgBzEHt+qI75Y76E0gPaHJgXYrsZgnjgQiAO7a5Y=
X-Gm-Gg: ASbGncv7uQ1FTy4DQ/kc1MlMVRk+9A9WDzKckoJE7Jmtm+gXZLvSvg1hBvmJaju2R8n
 e92gkoQhKwFBz3LaoMsBbR/zgitH/4EMa2gfVRLffEptYTda/uluaDNFhGFsXWsOheGXWnJ0dBU
 CEMtqavhka9Sijeih75cQJK2w+vnjRHdxcTL/NTS+tK60TNfAq+bn610Xo9Nrc/2v95gpDIRrKg
 IWwntji7jpn/QJESg2+ltNC142nAOy5Q6KgcwehPOZWTRgAwgCHZ/P6JQ==
X-Google-Smtp-Source: AGHT+IHBBgF3TADMfzDewRh0RnUMlgyT5sj2IpwAyXtVR/5eduL7M8O2TXvbBzwVKqS3LKRU2nISMQ==
X-Received: by 2002:a05:6512:3b06:b0:53d:ef60:ca9d with SMTP id
 2adb3069b0e04-53e2c2ededcmr746863e87.55.1733480217491; 
 Fri, 06 Dec 2024 02:16:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e2294738fsm462355e87.52.2024.12.06.02.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 02:16:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 12:16:00 +0200
Subject: [PATCH v6 06/10] drm/display/hdmi: implement hotplug functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-bridge-hdmi-connector-v6-6-50dc145a9c06@linaro.org>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
In-Reply-To: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
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
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4668;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=cLr7rcMCKctpWvNtnt4BFuThw021W03l57sijxoziRQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUs8J3TYcPOcFa14DxHDG+xCfnhUgeaSE3pmsZ
 R3RuvxUPtiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LPCQAKCRCLPIo+Aiko
 1bY7B/4+CK2IPr0ZGyjRDhrjaTsOqjmocrfgRtyl3xVEfwHzU9LuHdX6kQQeAuBpj8yrhP95Lrc
 mJaqwUlGlJVWI2p41ZWrO45zfQXvGkclr3viN4DqtVp1wOkUrySmjzdDtwWb8O955/CXSlOkPj4
 shNBlMA/0EzPl4Sey9z5n5owN0nB1SFzkv7pXmLDh+ueroDtWgyLV6lM8aK/oC2d2vB3p5NonFj
 iq5QAwa4io9tByWFbLUrhaD3YP49rrj6olPhm2uUF+4vE+bhp+jb5smE9iwO6URvP0KGtG7W5Y8
 gww2J/ZuOGHRT1+pbIcV3exbZQ1jdd0TnTjcc8oprf9DeMWO
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
the HDMI Codec framework) to be used by drivers utilizing HDMI Connector
framework.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 61 +++++++++++++++++++++++++
 include/drm/display/drm_hdmi_state_helper.h     |  8 ++++
 2 files changed, 69 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 80bf2829ba89b5f84fed4fa9eb1d6302e10a4f9e..4cdeb63688b9e48acd8e8ae87a45b6253f7dd12b 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -769,3 +769,64 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	return ret;
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
+
+/**
+ * drm_atomic_helper_connector_hdmi_hotplug_edid - Handle the hotplug event for the HDMI connector passing custom EDID
+ * @connector: A pointer to the HDMI connector
+ * @status: Connection status
+ * @drm_edid: EDID to process
+ *
+ * This function should be called as a part of the .detect() / .detect_ctx()
+ * and .force() callbacks, updating the HDMI-specific connector's data. Most
+ * drivers should be able to use @drm_atomic_helper_connector_hdmi_hotplug()
+ * instead.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int
+drm_atomic_helper_connector_hdmi_hotplug_edid(struct drm_connector *connector,
+					      enum drm_connector_status status,
+					      const struct drm_edid *drm_edid)
+{
+	if (status == connector_status_disconnected) {
+		// TODO: also handle CEC and scramber, HDMI sink disconnected.
+		drm_connector_hdmi_codec_plugged_notify(connector, false);
+	}
+
+	drm_edid_connector_update(connector, drm_edid);
+
+	if (status == connector_status_connected) {
+		// TODO: also handle CEC and scramber, HDMI sink is now connected.
+		drm_connector_hdmi_codec_plugged_notify(connector, true);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hotplug_edid);
+
+/**
+ * drm_atomic_helper_connector_hdmi_hotplug - Handle the hotplug event for the HDMI connector
+ * @connector: A pointer to the HDMI connector
+ * @status: Connection status
+ *
+ * This function should be called as a part of the .detect() / .detect_ctx()
+ * and .force() callbacks, updating the HDMI-specific connector's data.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int
+drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
+					 enum drm_connector_status status)
+{
+	const struct drm_edid *drm_edid;
+	int ret;
+
+	drm_edid = drm_edid_read(connector);
+	ret = drm_atomic_helper_connector_hdmi_hotplug_edid(connector, status, drm_edid);
+	drm_edid_free(drm_edid);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hotplug);
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index d6d65da6d8f9ee46de33114cce2d6fbe6098a862..4ffd40d73d50d89449508b7a5ce5836a596638a1 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -6,8 +6,11 @@
 struct drm_atomic_state;
 struct drm_connector;
 struct drm_connector_state;
+struct drm_edid;
 struct hdmi_audio_infoframe;
 
+enum drm_connector_status;
+
 void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
 					      struct drm_connector_state *new_conn_state);
 
@@ -19,6 +22,11 @@ int drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector
 int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *connector);
 int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
 						       struct drm_atomic_state *state);
+int drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
+					     enum drm_connector_status status);
+int drm_atomic_helper_connector_hdmi_hotplug_edid(struct drm_connector *connector,
+						  enum drm_connector_status status,
+						  const struct drm_edid *drm_edid);
 
 enum drm_mode_status
 drm_hdmi_connector_mode_valid(struct drm_connector *connector,

-- 
2.39.5

