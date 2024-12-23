Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5219FA975
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 03:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9934110E2EB;
	Mon, 23 Dec 2024 02:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IsDbCms2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D1C10E2EB
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 02:59:16 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5401d3ea5a1so3825223e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 18:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734922754; x=1735527554; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7p88hGbKo1uih9Z+JpGgwcv2sHMDRbjp3gmcwjLlOTk=;
 b=IsDbCms2Blf+R0qhxPMaNw6H43b5rH9vuxQ7D1SdGN3NrOFXtCPz9AWfuVECb489Xv
 dRekk93Spz/oLNlnzSIEra4/LMeyZ6DXs7UOb9WTapg0mhre/vOhhcFaLNHbA/G8dOiY
 Yi5ysNG/O2KSAX6TYYB+U5ZgZJbFXctSLX6bJIV5ncYTbTZV0H8Ik7q532aTlQmv2wec
 D+enfEGO4J1lG2s1BgcnOGHtwfjNct1WngXKRrazhgvyHG9yikLvowck0EYiCpX442vo
 uV5DNNeH3AU7GN3TLZ28EIgfE91TszZhpKMiT5gKXNOJnSZi6x1ezqSc1YWwR7qjMmdK
 SZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734922754; x=1735527554;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7p88hGbKo1uih9Z+JpGgwcv2sHMDRbjp3gmcwjLlOTk=;
 b=FjlaqhveGP87ccm2PXALWpkua14mvXohtmulSamGQ/6Ei1nMCiD90gDun323zVnA7R
 B+JOzbPQqFTJxdeEc8xSBUIjYCaHML5o9LC4nahMYYpuaJfgYP9xVnC8AAOa8TJOvgIP
 Fjofuj3GL63nmM4487pL4JcvEbJV3ta3KThCdadBSKT3zvZqRb1BD73gk4CMOWW2P42k
 X4xyzVKFwGuXQNKrJnJLbYAB2gJSXBMHUzUtAtEVw543G7A13g+hhkvqG5znbwXEBRFP
 F5R4OyImrX2QycgMTaFxTHPgaHxnxQ5em1Toz2qEKQonhDANAbVSuoEcL4k5xU4F9k6v
 r2jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMtTuQ6qngYeWCjOp+WYuBlh7PriUht4Z9m5hxyMwa7oIUrVj+J6mRCaDzWDk2zigoxCnDvgnshlA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQC174CzB4Vyf7jcYk+uU9nj9CjbFW1GRZq4zRJvfUBrmXqj+J
 hTZFatcyDOnpWBBpuCbl9LOloovZ7/RR4fkG8E6Z7Rb6+S1tFdTEdsuJECdH1wg=
X-Gm-Gg: ASbGncttikUV9xbIF87hw6Dv6ue/S+V2JNognF4LM1g/6/XxikvfBtcAVAn26SYNWW6
 d7HLyyi+JFjfosVbXI7mUvVvGLZwbcgrj2lfBjJ71SOPiE8y1eq4eICuu7/hhYhzYGuIZafqgD4
 v9u0iE3Hd+JW+BwCdqwWTqc6rhEMxoxty0MUrfZRBMMB2PqoqbM3qxpKMO0QXqIxvn8fm00R2fN
 gKRYdaZpPnmy47mPi3MGvtm5zcUo2atvvXJWVz1f8iABlZOpbYgCqrsvnu1082F
X-Google-Smtp-Source: AGHT+IElKH4AKPUYEYwbRiJbo0TOgI8/1Bub9raYIL6A6gVp2y+xa77oR6tX2ceL196VX8lXaSaG7w==
X-Received: by 2002:a05:6512:12c9:b0:53e:389d:8ce4 with SMTP id
 2adb3069b0e04-54229549444mr2872252e87.34.1734922754488; 
 Sun, 22 Dec 2024 18:59:14 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f658csm1124639e87.44.2024.12.22.18.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2024 18:59:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 23 Dec 2024 04:58:57 +0200
Subject: [PATCH v9 06/10] drm/display/hdmi: implement hotplug functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-drm-bridge-hdmi-connector-v9-6-6ce16bcedb8b@linaro.org>
References: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
In-Reply-To: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6334;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8xjDZrREhEUluDXr5YjpzwQecn9uFR1J/BTqu2XC7qY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaNHxgulOkyvS3PYhadszFeaFieSG8X644nZnu
 CWX+02hF7yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2jR8QAKCRCLPIo+Aiko
 1QwuCACGZvQYsz8/sLbdD0s10ZUattTKxi/7AUUbQTKEj6EQ+TxiRZzfVdSHi85mEUbfGJUBAEV
 uydF9Xt3g9HkdjXCuRitamdw+qya9RquK8AcM1VDsoOokR4Vvcx7Gfj5osj/MsRA7Aj/dgKR1wu
 zI0QgvO2bxCoAr6R0C60yyeKtXOvlzVIOut/+i2vXyvz//CtVTUxcypHhiHQ85td15mo+i5rTx+
 0RBVpVdLMQAftM98QEK5cobNjDi2y3l6jvyg+25Z4HhW8doBp991mxbvwR9OJi8JktoXFwrTYUs
 86Ozq4Ok193yS0LxJa2x0+jWLImFw8ggzgWiFWnI/hESo4f1
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

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/Kconfig                 |  1 +
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 56 +++++++++++++++++++++++++
 include/drm/display/drm_hdmi_state_helper.h     |  5 +++
 include/drm/drm_connector.h                     | 16 +++++++
 4 files changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 2619fa2476eb149e1befc3135131ed5aaeb5bb4c..8d22b7627d41f7bc015decf24ae02a05bc00f055 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -89,6 +89,7 @@ config DRM_DISPLAY_HDMI_HELPER
 
 config DRM_DISPLAY_HDMI_STATE_HELPER
 	bool
+	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	help
 	  DRM KMS state helpers for HDMI.
diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index d678c635a6935050ca9c1ccafbb0865f21df5d4e..f4935b3e630cd89ec6373eb67b06e6a3a3b3a55a 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -777,3 +777,59 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	return ret;
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
+
+static void
+drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
+					enum drm_connector_status status)
+{
+	const struct drm_edid *drm_edid;
+
+	if (status == connector_status_disconnected) {
+		// TODO: also handle CEC and scramber, HDMI sink disconnected.
+		drm_connector_hdmi_audio_plugged_notify(connector, false);
+	}
+
+	if (connector->hdmi.funcs->read_edid)
+		drm_edid = connector->hdmi.funcs->read_edid(connector);
+	else
+		drm_edid = drm_edid_read(connector);
+
+	drm_edid_connector_update(connector, drm_edid);
+
+	drm_edid_free(drm_edid);
+
+	if (status == connector_status_connected) {
+		// TODO: also handle CEC and scramber, HDMI sink is now connected.
+		drm_connector_hdmi_audio_plugged_notify(connector, true);
+	}
+}
+
+/**
+ * drm_atomic_helper_connector_hdmi_hotplug - Handle the hotplug event for the HDMI connector
+ * @connector: A pointer to the HDMI connector
+ * @status: Connection status
+ *
+ * This function should be called as a part of the .detect() / .detect_ctx()
+ * callbacks, updating the HDMI-specific connector's data.
+ */
+void drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
+					      enum drm_connector_status status)
+{
+	drm_atomic_helper_connector_hdmi_update(connector, status);
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hotplug);
+
+/**
+ * drm_atomic_helper_connector_hdmi_force - HDMI Connector implementation of the force callback
+ * @connector: A pointer to the HDMI connector
+ *
+ * This function implements the .force() callback for the HDMI connectors. It
+ * can either be used directly as the callback or should be called from within
+ * the .force() callback implementation to maintain the HDMI-specific
+ * connector's data.
+ */
+void drm_atomic_helper_connector_hdmi_force(struct drm_connector *connector)
+{
+	drm_atomic_helper_connector_hdmi_update(connector, connector->status);
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_force);
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index d6d65da6d8f9ee46de33114cce2d6fbe6098a862..9ae19f3caf727f9a0fe06e6afe5fc46db924444f 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -8,6 +8,8 @@ struct drm_connector;
 struct drm_connector_state;
 struct hdmi_audio_infoframe;
 
+enum drm_connector_status;
+
 void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
 					      struct drm_connector_state *new_conn_state);
 
@@ -19,6 +21,9 @@ int drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector
 int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *connector);
 int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
 						       struct drm_atomic_state *state);
+void drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
+					      enum drm_connector_status status);
+void drm_atomic_helper_connector_hdmi_force(struct drm_connector *connector);
 
 enum drm_mode_status
 drm_hdmi_connector_mode_valid(struct drm_connector *connector,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 19e4256296657b0f1d203266d152cbba42f9726a..dac8048c82f913b9cfaf785cafe85080a9b2655c 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -45,6 +45,7 @@ struct drm_property;
 struct drm_property_blob;
 struct drm_printer;
 struct drm_privacy_screen;
+struct drm_edid;
 struct edid;
 struct hdmi_codec_daifmt;
 struct hdmi_codec_params;
@@ -1247,6 +1248,21 @@ struct drm_connector_hdmi_funcs {
 	int (*write_infoframe)(struct drm_connector *connector,
 			       enum hdmi_infoframe_type type,
 			       const u8 *buffer, size_t len);
+
+	/**
+	 * @read_edid:
+	 *
+	 * This callback is used by the framework as a replacement for reading
+	 * the EDID from connector->ddc. It is still recommended to provide
+	 * connector->ddc instead of implementing this callback. Returned EDID
+	 * should be freed via the drm_edid_free().
+	 *
+	 * The @read_edid callback is optional.
+	 *
+	 * Returns:
+	 * Valid EDID on success, NULL in case of failure.
+	 */
+	const struct drm_edid *(*read_edid)(struct drm_connector *connector);
 };
 
 /**

-- 
2.39.5

