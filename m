Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7559FB878
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 02:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BAB10E43B;
	Tue, 24 Dec 2024 01:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HV/LZ7mL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F1810E43B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 01:49:19 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-54025432becso4958923e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 17:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735004898; x=1735609698; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/nB23mOz5XEcaTKeAQs8DsK3CUkW4s4+le/27BZ2Xdw=;
 b=HV/LZ7mLu4ypC34LzcgRmTo2Oqb2kNCzRn91uLjD4Sr9H2HA8p4+3EyQ8ktNmlIepz
 ZGmD/G9dnJ+29v5IQYBsHN5rqy55O0W1oFcb04LG/OiPJsEulFkt3qn+cjOGegeOu3mN
 5zPoskaj2aFwQNrj7YOpD2ODxH+GMoaXn73dQs1yoOlRkVTTFi5h+iYIFpD/Vc3zsl5j
 rgNycai3WwITGIDRaWd2nf+q8aImupENoH5SQeTaasZ3S+hGC7R246UALHTytN+kulvU
 /FEkNfs4Yn261MuKffYDnEhCFPn8Gh6GhmxJJCyG3zuM+PXjrGCr7a1JTmTWIylza8gi
 mZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735004898; x=1735609698;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/nB23mOz5XEcaTKeAQs8DsK3CUkW4s4+le/27BZ2Xdw=;
 b=PU4mw3ERpxzgV2eDm9l6Bv3jx3eQvIsfMowuD0N/nORyKGhpc/7zUJuacGgxMZR0Rp
 MUFqp6lEiP7tNbQSKfJhAQG3ogRNBaHSR38tGg7TEq0CQmVTuJejnnnx+lRfI6zU/Qqn
 Rk9VYsr2b5v5kqueWwTIib2J8VprtgsbyhEAhdwzNHQrf6j4O2xN84TT1IMkyF8ISQWR
 H5yzbvxoatNL6/QzrbZx8vCujzQEPTlhc4M5m9AEL0qcFiaU7GyDTRbd+H38u8s2b+ED
 gZkWAS1xIrusohdBPLg0xHWKMlK6qqnkfqkE2cxMEf+6EoHG1iIJHa43eHxoC1gHFSGo
 ugwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCNLGaENSys2sOzRiwQqEy8iaB0byw3hHFj1nA4xD7+xa2nPAmxRG1AmupHjzcC85DO/C+k4lpUL0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNDobXNBSshgnXG2449ejMIj3RtdbHcZzcTUPO4lEV+TuPJml2
 gKvLIZ6m/zCq7MY9aSJ14t6IhFdVAelKKJapEg/y0yMQ4pHFLDR2q+A73bt6wEk=
X-Gm-Gg: ASbGncvR/NAMjw/33F7DxWyobA20KRlyObbRpOA3LZEFgpxBc8V7Uei0/fgDYyeeH0N
 C2daXsnojFy2FvB08jtnL8HY65wrxr2j5NZKnS5jCPiLNtcTEdl/nmIaWMD7gcEh2rgiHua61I4
 eZMknalc6tm/CDOZKUs/47Ig/ygwh3D0uq7YPxAKtBezBRd2Bjch1013V0FM8/cl0dmf7+6uvQf
 Rp6gfNyn2/LvIIBCkI+zocWMyjEzS++2zf3B/tnHriCsjxvH70gBKCP4OZMNBGY
X-Google-Smtp-Source: AGHT+IGPqkn30jxniIP++g3DHBL/bjgtZ0I3v3hoP6RoKeGURCaPTg5NoNi6aq19h5jln67MzBZcug==
X-Received: by 2002:a05:6512:683:b0:542:2f0f:66d9 with SMTP id
 2adb3069b0e04-5422f0f69d8mr3459595e87.16.1735004897679; 
 Mon, 23 Dec 2024 17:48:17 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f6509sm1425988e87.25.2024.12.23.17.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 17:48:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 03:47:59 +0200
Subject: [PATCH v10 07/10] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_hotplug()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-drm-bridge-hdmi-connector-v10-7-dc89577cd438@linaro.org>
References: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
In-Reply-To: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4313;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hK86h8tSIYG4gNCwBsALiUu4fy8l5FoieDOZ0a2t+ng=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnahLNlKk1pyY18Usd0pAsYgRQhoxcr7VaL4Ngy
 mqv7/G60TqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2oSzQAKCRCLPIo+Aiko
 1UzgB/wLQTAl/PBvsBI087pXZoO4Xtg0wcjMMQ32OkBKFjWYFinkJTEVHSPdZ8RJl1HOBQiKBqP
 C0EP7jbuqRBtzkhax4sAkGMsZF5OmcJwMgvPlt0nGAWOtoH0jAJiVPDcR3Fs/D/MyZ4fS9ZZTWL
 GfzbiAIF39GTPL8myW0yoY4YIL+N6llV0uZ0yYejHvwFUV6D6/B4CFN9yLdUFOH4xpWo5YaZMcL
 Pk1jZXYaE09n/bNPxO+CkLslE4AlzgvszVNANChOpIwinIWkIAghEIGEZXGoa0XHdTd3anUV7kQ
 5DfNw5Xi4L8P8aAF97ZE4DEcrniGkLQU1O61s1IoP3YHcCUn
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

Extend drm_bridge_connector code to read the EDID and use it to update
connector status if the bridge chain implements HDMI bridge. Performing
it from the generic location minimizes individual bridge's code and
enforces standard behaviour from all corresponding drivers.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 39 ++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 3f18495c30a4a7fcdaf93b161cf1d30020788772..c4a1476c8bffb86b34e86bb9051194bcd912ae1f 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -17,6 +17,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
@@ -181,11 +182,15 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *detect = bridge_connector->bridge_detect;
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
 	enum drm_connector_status status;
 
 	if (detect) {
 		status = detect->funcs->detect(detect);
 
+		if (hdmi)
+			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
+
 		drm_bridge_connector_hpd_notify(connector, status);
 	} else {
 		switch (connector->connector_type) {
@@ -204,6 +209,16 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 	return status;
 }
 
+static void drm_bridge_connector_force(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
+
+	if (hdmi)
+		drm_atomic_helper_connector_hdmi_force(connector);
+}
+
 static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
 					      struct dentry *root)
 {
@@ -232,6 +247,7 @@ static void drm_bridge_connector_reset(struct drm_connector *connector)
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.reset = drm_bridge_connector_reset,
 	.detect = drm_bridge_connector_detect,
+	.force = drm_bridge_connector_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -277,6 +293,14 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *bridge;
 
+	/*
+	 * If there is a HDMI bridge, EDID has been updated as a part of
+	 * the .detect(). Just update the modes here.
+	 */
+	bridge = bridge_connector->bridge_hdmi;
+	if (bridge)
+		return drm_edid_connector_add_modes(connector);
+
 	/*
 	 * If display exposes EDID, then we parse that in the normal way to
 	 * build table of supported modes.
@@ -369,10 +393,25 @@ static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
 	return bridge->funcs->hdmi_write_infoframe(bridge, type, buffer, len);
 }
 
+static const struct drm_edid *
+drm_bridge_connector_read_edid(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_edid;
+	if (!bridge)
+		return NULL;
+
+	return drm_bridge_edid_read(bridge, connector);
+}
+
 static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
 	.tmds_char_rate_valid = drm_bridge_connector_tmds_char_rate_valid,
 	.clear_infoframe = drm_bridge_connector_clear_infoframe,
 	.write_infoframe = drm_bridge_connector_write_infoframe,
+	.read_edid = drm_bridge_connector_read_edid,
 };
 
 static int drm_bridge_connector_audio_startup(struct drm_connector *connector)

-- 
2.39.5

