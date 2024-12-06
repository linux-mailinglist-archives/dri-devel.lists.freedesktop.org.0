Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F099E6B97
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 11:17:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFCA10F0A1;
	Fri,  6 Dec 2024 10:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a30XJmSF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4AE710F0A1
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 10:17:06 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53e1be0ec84so2193010e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 02:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733480225; x=1734085025; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lFa29zGokenJpe5mqg9zveoS4Rwgzi3mBzBv5L26SAE=;
 b=a30XJmSFXqN0YG0RDTC7VpSRJzpYDJOyjq3K/F9A143qXJRgbYEavHdEOqgmEt13g7
 wZEpwDefur5y2c5by273JzlTdZanLgK27E6PVxPkAxxTgykjDt0eVRb7haPoD6trrk6A
 gyoMgSiitEODHgX6VcztGHfpkrXEcJU5rscYN+tGUs8KceFHkmvHoAABtW2zHJecurFt
 WYR+AN0XaeZY/oMYiRFBlJWxdwmN0uFuXTuaIE6AakmwAu58TUkhTrkTeCdmhdfC4lls
 XQhwDSFeBZSNCdEoEm2T8C6mckm+O3olMxkQnZDDvQuJPLM42519npiCjps+uYljN9XM
 ELvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733480225; x=1734085025;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lFa29zGokenJpe5mqg9zveoS4Rwgzi3mBzBv5L26SAE=;
 b=sB2/ndJIonoIElBbwMDX3V5vA3rTFh66mT5fyNE+GLA2gvrceofZhOcW9nkozRn8Tm
 AZl0NbzMV5Z4mE3esR1A8jU2Ep6pmOaMExnYiySsmJNnBUQNW0LwAVnkxyQuiKtcy7a3
 Z0kNAIzlbcRIUP84pY/BWP7Dob77UiGATerwqePmpbWULJd5hF6aBh8bPTA9e/YiLurK
 N59BhAwPVJQg23mw0aeWrjapNddVytmVQvXNle5fAV/geqdN0GUmQkKCW1XRcvdDo2lB
 ximy7idKmEyKCEFOUnU2/8gbZYOaulD3tEy63Lb5wh0jZdrlUx8f/hSg1zN+GR9lPli1
 ftFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0EpgkbwO5ZJxmjXHJXQT4QU44Y30PZNT8vzmM5+buxrVW4cXlz//7+UzVMzxbIS30Hq4Y7Lvb1jk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzo0EHPGR/3yhxiThKBNN/43BFYyfuAg5+xVZOPQQmL1KpPKHTq
 0iUrod37dYUf1Rye6/t4Gi+Y83mgWkdhezYk0+09APkMvVOSFg8W7Lp+En2Yn2E=
X-Gm-Gg: ASbGncs8Pqx5j3UVxiCu4zdoLKc6upVfHOqOOghm3VZ5NT+YmXDv5my5HpjDum83IcP
 bM4rY5krOHueysLX+qQgVsyffSXNKPoYxeQE1avQfr9EOvDuMFSYw9Z3CsJ7tV0COInzoXmYDn9
 HZy0X8Tgh9W4IvZyogM7J+53/7oGCmZOu4lTH5kGWiYVyi5kLz2skMib39tBTWxbB52DCepMTz8
 JkzYunSNs5mJzhFvE02ZsAgQuCqj4NSt71B2lswWihaKbstUy5+71KxxA==
X-Google-Smtp-Source: AGHT+IHNpBuRwgKK1CNP9DRuR/Gs67kp3cCMnKwV+VXX45IVym/LnbP/Ke7fYrgOf+QZmiMXYQapcQ==
X-Received: by 2002:a05:6512:6cd:b0:53d:d17f:9c82 with SMTP id
 2adb3069b0e04-53e2c2eb825mr792722e87.41.1733480224767; 
 Fri, 06 Dec 2024 02:17:04 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e2294738fsm462355e87.52.2024.12.06.02.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 02:17:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 12:16:03 +0200
Subject: [PATCH v6 09/10] drm/vc4: hdmi: stop rereading EDID in get_modes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-bridge-hdmi-connector-v6-9-50dc145a9c06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1884;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=j2kemq017HscgmDjZnV9e0NQWZYYUNRM9WTXAZ5h3gA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUs8K05s0noSk+VgReu16bZ6zGhMIKEKZYWvMH
 cWDBoC5MeeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LPCgAKCRCLPIo+Aiko
 1egSB/0eK1psxHQsYpRADr6zCNmEK9ALrprmuzg9K5OGMiQy4CeKh8wWSI8ng+ZMiQrN0gysIOa
 gP4xcWyhTKvzseLul6LUz7vNnN2oLBaT6a9kOqq7zHzZ5BC1htBwJHDvvs6gyNE328fVF96Vz1X
 o1rKdI0JsvDb7LgVYbZkcTMIWCAQjEs/CRHfthdOxmJLdTMad0FkWzEOQfDpKEXyPfaSLg3PpFX
 6Vso3jxPVmBwM97QKw3Y/jVXRDBDC/Ltjr/SR4rwzm+rasXspSzT4DM52M5bK4BhVxBYMiNjtv4
 TzyaS5rLJ4DQdUBsTW0TJ+Y66IYpoCUW/OdPh+fArsVpGgLm
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

The vc4_hdmi_connector_detect_ctx() via vc4_hdmi_handle_hotplug()
already reads EDID and propagates it to the drm_connector. Stop
rereading EDID as a part of the .get_modes() callback and just update
the list of modes. This matches the behaviour of the i915 driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index e5ab42f72f618b90f956482db6c9c8074c1e3bf1..3364ef90968dad3074800f02926300ffceb75c69 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -470,31 +470,10 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
 
 static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
-	const struct drm_edid *drm_edid;
 	int ret = 0;
 
-	/*
-	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
-	 * results in reentrancy issues since cec_s_phys_addr() might call
-	 * .adap_enable, which leads to that funtion being called with our mutex
-	 * held.
-	 *
-	 * Concurrency isn't an issue at the moment since we don't share
-	 * any state with any of the other frameworks so we can ignore
-	 * the lock for now.
-	 */
-
-	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
-	drm_edid_connector_update(connector, drm_edid);
-	cec_s_phys_addr(vc4_hdmi->cec_adap,
-			connector->display_info.source_physical_address, false);
-	if (!drm_edid)
-		return 0;
-
 	ret = drm_edid_connector_add_modes(connector);
-	drm_edid_free(drm_edid);
 
 	if (!vc4->hvs->vc5_hdmi_enable_hdmi_20) {
 		struct drm_device *drm = connector->dev;

-- 
2.39.5

