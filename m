Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7672A9FA97A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 03:59:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF55410E2F4;
	Mon, 23 Dec 2024 02:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VXVi2vc+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DC810E2EB
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 02:59:18 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-54021daa6cbso3985824e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 18:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734922757; x=1735527557; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hqnxj6s3/EgjVuNjxM9/sx/Q8vGKE4sDTiUqotmlFDQ=;
 b=VXVi2vc+yxH8ujhxYHGGa2bm8cxhoH7PerXqxO2KXMG2f4uBD689UnLnbjNbSxQXhm
 XEEtUlVzboVaO5P0kBKPpDDpBoH7edDNhBPU7l6uSYhOT8ZLtvKQIilU/sHIwVyT6/BW
 lRWO9688a3U2ysyRoZw6zx+71c2u7HVontZX+2gjOYZs1novUGvSo9285wEq0HnJ8aoT
 hx71bqfArLc7ojvzpyeN32II7I9ieBCLwQsK7/watmY402C0ukeCWqIK/SwbT7bXtZM1
 7ksvdaOgjNtK5FrPEaP2Uvxn9ShzjHhSyrJBjLJM+bSz2FaEq6H7ItZUUNjqzwYNL9PQ
 +GqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734922757; x=1735527557;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hqnxj6s3/EgjVuNjxM9/sx/Q8vGKE4sDTiUqotmlFDQ=;
 b=d7dvY/nDg6WPNSLB6kjvhts4NNZZmlLLAl2uh+PSWXCznkymtc9BOu0y7HqXB3Ivf3
 IlPdgH6YFdf5XWo/5nXuqdUwY/oOcVdWal9sAFzjlpNENakfRoQ7xNvDFu58yu2mKtSz
 9p56OKyEVZ38a7CoTnsb/GHkhkrUW3NhUjdhh3e2Of1TcGdZKRyNqqZALy6afod77lrd
 0j1i/wh6v/ZQkrozDz+a4XPwq8QvEgXrTKMMNQ84vO+Lsn1pQhTdKDyJRRmr8DO2FEl5
 ns8ouQ+zve9nNwwmRPB9lzwF4w9qjuYHxTcCK5so7UsRhSCyhz8uNxSvS8yXlJdhhqIK
 /8CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDwA1g4gs0N77sntcTEg4mRmd1HAJ9+UjawzZEKlmaCuJgNQ32yusXsz5AMP+ijUg+4P+WEc+yRC8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy59JkNF34WoL8Kf26QaMqFqwKJ54ae0lcPMHQEPuFU2tg1EU83
 qEfrdp6e858x50+tQkjil2/pOqm6fdshs0eQDXHTV59yglaNX2cJe9Fs4XAMcco=
X-Gm-Gg: ASbGncukzjV1b9gF8a7afF7yIbZYF5wB5DhgeBzVtBczPzwuj8tPD953VMkgSFo/9RD
 1AuAN7wNP7cfe6+Wut22Dxuk8SgztHda3vVX4ZGlu9oA/jc+2sW4fHla0jN6yMLIx513uZzhUdr
 RoWlN2UiehBwMzy30WCWMn32y75uJSGSu1fsC7vul/Xwytk6OZRZegi/XGMxM/Dndu5iCHZKt0R
 M/QQAP+raFLkxcroZ5oE0uh61wpY8cXkdITvnD89tM5JDbYgAfHhkh84mlwZkOe
X-Google-Smtp-Source: AGHT+IEsAJNSOOaV9y+nIfiI5YFrovLlSSoOsQwRPv3DQ9rP0DXXCsbsdQs9e6lOh7MvObzo8vwB4A==
X-Received: by 2002:a05:6512:10cd:b0:542:2a20:e696 with SMTP id
 2adb3069b0e04-5422a20e763mr3184995e87.12.1734922757058; 
 Sun, 22 Dec 2024 18:59:17 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f658csm1124639e87.44.2024.12.22.18.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2024 18:59:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 23 Dec 2024 04:58:58 +0200
Subject: [PATCH v9 07/10] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_hotplug()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-drm-bridge-hdmi-connector-v9-7-6ce16bcedb8b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4313;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qie1G35P6Yl7cippcpWCMVmv6O7BDmJcfLKNOKKg6kE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaNHxc64kwoBabpycJjPJSrQzZBWx0rjDhWX0g
 hu7SI/TS3yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2jR8QAKCRCLPIo+Aiko
 1cRAB/0Y9MaFBTfXRl+OHwE9mEz9kBDl4uUf9S6zWWs5/Zspm3g4ocdNYQPOVPvzfLv3YzIz4yx
 07/Txug+JO/W7Gc8yBtcurFBnkP9QHxdv3R6RXY50q1W2f3vYxo13mVHjvUjRH8ARihdxR1sl3B
 Vi+VFMo928lRyBfodzdLdjEpD7Q5GAVwjtKAiA6kyt6UBaL0HagIRPmPPd/hz7LvUu79Detl5Rk
 6xGL1yl5xvss0d2T4mlB9aMCNSgKrF+9qFBRcUSYwyqwjq7t2bRd/Bqg2EkROAPFELoBK18uEEZ
 2mVg1jyCMy06rHFflzxviEd1a/5+MhQjaHaBrksBliJeH57c
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
index cc955ee008d843d73fedb891e97143a4168fd311..66e4ab81fa0c2717490193e896389757f0a903f2 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -17,6 +17,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
@@ -180,11 +181,15 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
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
@@ -203,6 +208,16 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
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
@@ -231,6 +246,7 @@ static void drm_bridge_connector_reset(struct drm_connector *connector)
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.reset = drm_bridge_connector_reset,
 	.detect = drm_bridge_connector_detect,
+	.force = drm_bridge_connector_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -276,6 +292,14 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
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
@@ -368,10 +392,25 @@ static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
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

