Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1C69FA979
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 03:59:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D4C10E2E9;
	Mon, 23 Dec 2024 02:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ERnGxWdY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9580810E2E9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 02:59:26 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb4so4216646e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 18:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734922765; x=1735527565; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+6v2ksJ04CWu1mQJ1yZzlo4VCCiYvzQqRtU1InzFo7k=;
 b=ERnGxWdY0x1H8S99T6a5ZtZCb3zZrZ/NHmtoJI6jdg1SfMxey58nLCFaRQPs3LmtY4
 yiZcsvVl5pvtDn3nMtKEqLAP5/K1yY0h1GRwQ917O6IxqRg0SOWBtnlCDwxJEEgVJq7K
 NNqfEf5DOZoKc8eoljHV3F6WUAs/72NNVi9gV6uL0g/RbRLgxUpsTcWBfQ5Kbl7JmX6I
 Hr9iUGm5IqtMRyry9Q2PYxkDz99ajxNaVNLdvhFbdqLRW3Y9CxAYi/uQOcZ0OlN7ZOiS
 nmq1DkEylbpgMKsl7cT21t+psP1iZnuVdQIrZJefwQOopDL95GkCyd3b2EOrSlegexGq
 fTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734922765; x=1735527565;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+6v2ksJ04CWu1mQJ1yZzlo4VCCiYvzQqRtU1InzFo7k=;
 b=ShP0SzhA/7j8YolaK9g+rpf35yAw+zq2B+zkCrFBObntOYFxBTkEUXTZOptxx79tAo
 zfHfyk0h8IMJyEXBGmGtB/Y7J+bApquCcCwzqL/mH6B5S4/we6Q4qm3DPRg8UhKfTL4w
 7UycGBBXch/etpAaI5Iomki50KSpRKCd+/tqOfmC7xNh2LDDvgcpVOmpXfU9AT+qAuUs
 ufO+P1hmGS7FJEzPNFvfV9n25yWFyYmjAQUTx16UnK/CWWfvvSpYbJUgukwuSl0VWpJY
 aM40s88jcLfTdvuoKqg4pbTkbXyI0vF4y1kdr+0ajTfuISKtzI/dKsK24TUPpZp70o9v
 kmQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCURuUQcKXTbk+Y97FOzCUHa35BLUvJvbWu00xNDtI0sepZWc2mjYH3HGIrB8VQoRsV7NVE4U9Iho48=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqGSqME2l8e9y9gFfcYMEZZLGUimxcbDAlKcL1pzMovZrQBxDy
 rQO/65+RXjXT4lPkHNrcLoiANJEAtftYy4oIR5jaBm4eVo36ovZwYAAn6I2tOTs=
X-Gm-Gg: ASbGncskeX3RWwhqV0wA0lHeN9JFVGPOb6xAJvvMFE72onmHHlAgcwO5muzu8x5CaXr
 5zGvOxxaONhpwP5uVV3le3d/yectsDY0Cn1llQo3arWky5ZgNgLoYPYcWjQEgorOm0kjawhjOwu
 wtvvJlFIpzKOP4DL3ggW1qbUMQOLCWhlhsydz0j+ZAgXv7TMe3+iIhrwrQfufDIB3/LTxdGYAx5
 KZonSNO/CPlO8ZBZEtuAT3Ijj7nhBcpbMuFNFZBSzPa6UnmOWzufcnjIXUXfYrJ
X-Google-Smtp-Source: AGHT+IELf7Q9dKbwaApXTdiac6rXIdbml/bGXuPDMlX/oPVs9y7YxdDq3vkjKfSAR1daoK1hDBNZTw==
X-Received: by 2002:a05:6512:e8c:b0:542:2905:ae52 with SMTP id
 2adb3069b0e04-54229582562mr3253920e87.45.1734922764852; 
 Sun, 22 Dec 2024 18:59:24 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f658csm1124639e87.44.2024.12.22.18.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2024 18:59:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 23 Dec 2024 04:59:01 +0200
Subject: [PATCH v9 10/10] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_hotplug()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-drm-bridge-hdmi-connector-v9-10-6ce16bcedb8b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1974;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XEE5uVlLO0AwRnx9UbXjwAPIkR4mEqLYJ4bDyDXWCRU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaNHx7x+4SbLumBUmOEkbtu6Fr6hU1V56PPenf
 rTlgrJow96JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2jR8QAKCRCLPIo+Aiko
 1evYB/9rPAzB3kkXRyr5OKaHMHSiShXf4rybV/gUkj3QflXjD9f8CPYW/cyNWoJQtSWoK8S9WTG
 Hfj6UgBsGVxS2w97497ZGuAlKy/qxgFdBiXqhOUD7TcjvPJwX/QX57ZzOuDajdo8WqeLrDtYU0s
 nxyhgsO1hqWEZ6EhXrJJQrwsgZWJyArs3jqtvSNURojm1mh3pntNVs0ZPYtB0DZvAeVNN+F3Iqu
 ftO2or9x4WGL8Bi2fIxxRaweVXdxK7nLNQH6PvvOeJnKAC1cD0oBV896Z9tP2SAFpG3WmCD4Pzd
 f/F/DTBdG0+u6dDWeil9xt7qN2QO/kPVNagQ1xbmxphKStOP
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

Use the helper function to update the connector's information. This
makes sure that HDMI-related events are handled in a generic way.
Currently it is limited to the HDMI state reporting to the sound system.

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5282dd765cc9478361a705dca85f615015b12e8e..82eeb08c183420b000b351da1e05f9a47baeda90 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -383,7 +383,6 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 				    enum drm_connector_status status)
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
-	const struct drm_edid *drm_edid;
 	int ret;
 
 	/*
@@ -405,17 +404,14 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 		return;
 	}
 
-	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
+	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-	drm_edid_connector_update(connector, drm_edid);
 	cec_s_phys_addr(vc4_hdmi->cec_adap,
 			connector->display_info.source_physical_address, false);
 
-	if (!drm_edid)
+	if (status != connector_status_connected)
 		return;
 
-	drm_edid_free(drm_edid);
-
 	for (;;) {
 		ret = vc4_hdmi_reset_link(connector, ctx);
 		if (ret == -EDEADLK) {
@@ -549,6 +545,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
+	.force = drm_atomic_helper_connector_hdmi_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,

-- 
2.39.5

