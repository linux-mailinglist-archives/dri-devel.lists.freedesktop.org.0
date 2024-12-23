Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF979FA978
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 03:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AEB10E2FB;
	Mon, 23 Dec 2024 02:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t4M4yp0r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDF110E2FB
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 02:59:23 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-30037784fceso39662571fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 18:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734922762; x=1735527562; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1M6HwiDjtz6MVhwJBxGtnK97LOfqJCVvtnZY32TOfk0=;
 b=t4M4yp0rzSjGYeeejTf8v3HjxfD1sMABjEdcMUhd3bIWVYoFcdzI9E1G5OzSD5RJ12
 9Scf00IVXfujFDPE47U6Zctmtunqsaa/khWtv42Yb3EaT5uoVRgTlHku5mOaiIRRILYY
 juzdtBTubKGL2X9BMURpYzE03unYD2BzLcupxJHr6xSGUVyX70HE+0t/jd/XoxFWKrsf
 z7G5XUoYAjcliYmw1tUKSwFjaW2/4gda1SQSELuqU+aQ7ybJgH4cbNBoVHTt2KEqFu7K
 5KAmI2S3gTDe2Z8SvAfTJX6IT/QVWefxRnEh0oyhXJJySrgyPKKYQiIy0QsnGFoL8Tsy
 8C+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734922762; x=1735527562;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1M6HwiDjtz6MVhwJBxGtnK97LOfqJCVvtnZY32TOfk0=;
 b=FAyfcOxsFk7dIoSZaAnoK8Rt+QP4SeQkfnt0PzWczLBkFSXpi3v8aQttkbawgf0WWE
 /DeiJOTUq4XhblGt1cppriV4NMMRqvQAQMOWB2J8+sgL9t3Q4adKNz/gKkBCz+oICo8C
 vKkC81wF2+DxcHnmitN+abU6bVUOgMiu5E1Ct9psTYnKGkL02NuIGTPB6z0r7D7cKZN2
 rQ/CIfGlQk5fmes+lvS2gf4/gSujnwVZg1Dudhjd3EqwKd6SkAF0MQ7Q8Pu/aBJR0I/F
 L4AOvwmeB9ObXdeV0jUxP1H9tot13i3qv8vI1WZ+H/ygKeimMkqF3nC/gpKG8/kO0mmR
 5MWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDKXD/74qxKT1ubHs1iqtQ6ifVVujBMFcJiu90YPzZkbHKtw3Lh8oexUpo1rpNt+BEeLxxfZY/IN4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxxd3raZxXZat9vt7CcCQwlnVG/uHGm15hZRHoZUozLoLplnMoH
 lTgaq0aFPOtxFtkNSuLof31BocKXvKrjzElvKjcxDx6VsowrclP9ewvEkMHVS/U=
X-Gm-Gg: ASbGncsXU4GZGdNdriD/cZDxq8Fu81wcSNdNNXENxyluskLhF8PjHfQRfvMWRKaAyeE
 vuFUyJ1EvwsUxF4Au0RuKpuMhyJ8p4NjYca5ZtGN5Bo9+5qte4+yiqAFNlorJ4QhGiMq2/lMGgC
 kNSGOo73u3DUUmVw4FOdRbfIDR39AkkILJSG2LyphbI7PTcS7seUXga/9f0vkabjY8nyLt/JBj3
 ByF0vprFA/uB8OBam/BJxIp8BdBA6kViv6yu8Mm3dqyTqNqhflnxAVdJKr3vgYx
X-Google-Smtp-Source: AGHT+IGXP4rXvq7W3fLpzfisWqyUJAOUer76ywuuwhoE5fp8LHSToAxEcbOqHJy2piepiuWIG7rxUA==
X-Received: by 2002:ac2:4e07:0:b0:540:25a6:c342 with SMTP id
 2adb3069b0e04-54229525435mr3832068e87.4.1734922762189; 
 Sun, 22 Dec 2024 18:59:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f658csm1124639e87.44.2024.12.22.18.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2024 18:59:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 23 Dec 2024 04:59:00 +0200
Subject: [PATCH v9 09/10] drm/vc4: hdmi: stop rereading EDID in get_modes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-drm-bridge-hdmi-connector-v9-9-6ce16bcedb8b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1990;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zd/Y8mBxMdBApDi5CzqJHH1RW7mj7RyJYMvyUl/+gqU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaNHxS+CfU4MvBlw2osJl83QA+wZ5kGncYgdoc
 JR2tU6eRoKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2jR8QAKCRCLPIo+Aiko
 1TOJCACrRFuRB+oY+c98sRz7Ma4pmcP9hkSpViEb1HhcqhQ+wSNrwsLQ11Regmd4mJBK79nOzwT
 Nfpri3HXgX0HS3qFYrZcUzi+B68x6wvwU60GwKMd/PZvyFIX8OxvcXzgOk2EQ/3yygWo8fFGThO
 X2MGTJqbpeegKvCKA3d3otC6Eu9/QitcjoKBNIh5HDbkAMlRMwzWQ2lriSa9FMiZYkSuA8vpt76
 bPSe/sIipmve9fE5crzyrvzklzHGaOofu5vsyHZI8cgf3TMNtOEi0MelWz3Xs3r09Ix2sCQ34be
 pLuk4G41OLEBneTNS266BoRuUdJI0xxWKkNROz1buEXtKh/I
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

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 24199b511f2ee1bc3aa5f4a30e9d3d928d556ff1..5282dd765cc9478361a705dca85f615015b12e8e 100644
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

