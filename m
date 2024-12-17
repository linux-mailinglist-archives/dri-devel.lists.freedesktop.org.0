Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D729F3EEF
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 01:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9818010E7FF;
	Tue, 17 Dec 2024 00:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pGgacUgo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D1510E7FE
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 00:40:52 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53e399e3310so5614188e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 16:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734396051; x=1735000851; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yOV9LGB+7crRuSYkJueJAduPKSeD1LHvXO2AOg6QFD8=;
 b=pGgacUgom0ps6ciSz7GVCdylKY9K1s1zikpBi+ocodVwYGeutHiF6dxUHofeeSJZNY
 gziuD+xwXRa7lE2obsWDpLsUhi+/HSl9eerx/0m8rx0UwNhWwYummKWMmRBEzbcO61Yi
 jhcPd/pseW/nDS/aI3Kj/3VfG1puvTNBUaSA9pPcMrMA1nn0QW2jXRkZh8yKw8v3+R4u
 rYwe+vjjKqz8/7GKTa10IXFgKlutesG6cnPPH1oY4h4rP36kQry1arxs2VDRNYV2Wp/m
 BhzTQ1wfT+IlyEVFZJe68rXQXQsHPOSVOceG0rQRONwjmUKKPCGR92Es0Xj2D6OYheBo
 KM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734396051; x=1735000851;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yOV9LGB+7crRuSYkJueJAduPKSeD1LHvXO2AOg6QFD8=;
 b=ONFsAe+5+fs3jX8KLyZMM7YyJnr7C0uY3KUwUT4j3YJc5JbQAk3F6xICNBFDDYvwmn
 ECEpD4kEVDNUL6Pi+FDzz2ACqmtFfD06w12hdC5PKZVYbtT/vWe8gDWbR10mAaeo9Nqu
 kBVaOUC9jQeN9LfMpE8qPCsndNZ3JZ7dOQ44lnBlauDscDtclrGxsXSGmsBZR+dPERGM
 Y57eh8TrN4SoUjfrvxpJ54T0AUzUfrinErKROWAgmwtPUNCd75R1UBiAiyZthbGNLCVn
 jQQ1pmg6M/E6QZBfL1bJUNUPaAaAzVHsMzf1AJLjhabkGzRNGoElrpl2Base3ESIFool
 O+Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZeqfHbEaP3/uD9AYkouGP+68PcQHV2quSoNoqVIS3blIXgniChA8sHIeNjPWzivydGOL73cGBciE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbGPnU1O5hvaWVuaxOKGp9LlkTdHoMZgKdeV6d0fCAhJMAzgMC
 vMM1wITWRzy57JgpIy++uKkUDVYBlPHQ6YcRQaey2qwnQwIykb9VXd3vOUKh6ic=
X-Gm-Gg: ASbGnctkPUB/qfxjxe1HqPX2nXy1G98mGXkDhyUID7trahKowgp1eOJZc0nk6VHQn2h
 BNt1h7K3k8ErFhhTcq0PtI75exn0DpqEcCUeSiXbFpcDTphdjdcPmrqJ3dY9VlHK0oVvBC2I/5e
 +3zAM65qkNkqfy+s/f0DBntqrKtL689w3MCfl1ps4IuXVy+eAjvY13P84izLq/acHRlpX7b9sfr
 Mu/aADruaZh7DW0q8XgL/NEyJAqp3xL49fPTBkrOGs2s5O5LCVV7CxADjbwx24p
X-Google-Smtp-Source: AGHT+IHw7VXjrPeZhfVp33UgiptzZosNfvLSX3nNYvM2KHEjnFm3we6xTly89BdAPcurVBRYJ3TzIg==
X-Received: by 2002:a05:6512:3d8a:b0:540:75d3:95c0 with SMTP id
 2adb3069b0e04-54099b6aeb9mr4716425e87.47.1734396050964; 
 Mon, 16 Dec 2024 16:40:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120ba9ab2sm1009122e87.74.2024.12.16.16.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 16:40:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Dec 2024 02:40:31 +0200
Subject: [PATCH v7 09/10] drm/vc4: hdmi: stop rereading EDID in get_modes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-drm-bridge-hdmi-connector-v7-9-cb9df2b6a515@linaro.org>
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
In-Reply-To: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
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
 bh=Pn3jlKOdfQqOhTgwlNovK0Mjhw+ujx5JcQ8ESvBRcTY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnYMh5AcX6vqsmyTSEOah3v/NRfb59bBLsVA0Am
 5PF/UeNbMuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2DIeQAKCRCLPIo+Aiko
 1UYkB/4nmHMFle4w74ujOB7redDUAjj366h2sS6n0SYJQS5bY63lKUrcybdCpnPcp6IQgM7zPJT
 KI3Zu9Z+K2ZvACjsEqw5/l2aXc0xEcmWTAKox52w1HpK+mxERTYSNrKnEpHylqTK2aOcQrkwpGb
 90JB3CO4lyUmqID7sOLHsfS3eqBnYJiWYmplzScjqHDslUzYcE6rjuZaD3MtRPP2RLHo2S1yGht
 YfwBKu2NZ6YKX0LN9PAhJb6RXOuJ0S37kgoycJB4XyXb/p3yPs0dM1IhItwoki1nGLfBOB3xKEY
 EjldH/ijsNmTlfSrYitzNGnCyz43NBBdHpkVVJnf44FwvI7z
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
index 2a2aca7017994779a7163935df3fc87ca312d6dd..bb5e8738845c74d975c1e0e1262ced46e4ef8fde 100644
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

