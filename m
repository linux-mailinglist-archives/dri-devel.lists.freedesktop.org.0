Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 951064F07BC
	for <lists+dri-devel@lfdr.de>; Sun,  3 Apr 2022 07:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102FB10F334;
	Sun,  3 Apr 2022 05:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA1F10F334
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Apr 2022 05:17:23 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id h24so1761084pfo.6
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Apr 2022 22:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id;
 bh=uZOv2/2KAQ0z7EgFkhznivo9kV6ZnMeD1XPwFhqWHQE=;
 b=E5ZI58OdcnFKpaAcoI2jGMDAaoo3a/RNUk9X/CzXq8iYqKHaMxh8XYYzp00U5T35FN
 byk5ErK68h5wyVkmGg/7cs/9K2OGlSxww5yq8hKyn5qhDwRUkRa/ET6No+qeFC52v8dP
 ZFetFrl8OIej5w2zhGPeedydxV0rPCLvi0j11GGO2u2R28e3yKkb1Ws2eTu6m73G1mHp
 sRmpEGd+6SL+Fm8rWjrevGlydw9Sckt4NFVBWSt3osE3cBEiyz0AzLq+HFRXyZg6P35k
 Ebh18iZKlKyBie7omMZ5/+wrU2qRAxOUiHrVjBm2SypRI1K+vjcdkWrDIaizuKLEu7eK
 97Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=uZOv2/2KAQ0z7EgFkhznivo9kV6ZnMeD1XPwFhqWHQE=;
 b=Pa/KjKsS3dGEcC0t28hEnpGJaWZ/+Tn+KG7PTmZdUeK6FZ2vR0xYXi1Kqtm7wEJhxZ
 p2psvgr7cO6ulSD+kPSdn+0e9Otz2li1HN9KncPGtGsMHMay0gSQ24BFXCpfNmd99xUd
 oQCVzMjqKUWp4hjShWOrXp9LKIjtjctRv3E4odEKgjF7PyuKQ5JyXd/T4VcChdks/DJT
 jdVDvh+DNbMNn4nysagd1B3VaijuM0BJG/yzYDui9jX6QK1iUsyLJFjZJi2HTHmLdfVt
 XcdsPZq0l5urTXjTkNrhFbGUg8a/iyfPdEx2A8iaFkSVAqWItVL04PEiIFrhcePS/l5g
 XO0A==
X-Gm-Message-State: AOAM533dtRT9skaNP3mrOUZTHMcU8am8yX/tUral+ijsIELLhoEMkACB
 zJS+0l7xQYWivRw2SlpiIsw=
X-Google-Smtp-Source: ABdhPJwvmn74zIo24v1AGLNhDXxcRrTz1Yeo5dVp3dWboHc4Bfnn9l+D0DwlmDlKIDlbkMVN/HErMw==
X-Received: by 2002:a63:3e01:0:b0:386:3916:182f with SMTP id
 l1-20020a633e01000000b003863916182fmr21089749pga.435.1648963043267; 
 Sat, 02 Apr 2022 22:17:23 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 c21-20020a637255000000b003822e80f132sm6467263pgn.12.2022.04.02.22.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Apr 2022 22:17:23 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dave Airlie <airlied@redhat.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Maxime Ripard <maxime@cerno.tech>, Miaoqian Lin <linmq006@gmail.com>,
 Lyude Paul <lyude@redhat.com>, Inki Dae <inki.dae@samsung.com>,
 Yakir Yang <kuankuan.y@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: Fix error handling in analogix_dp_probe
Date: Sun,  3 Apr 2022 05:17:11 +0000
Message-Id: <20220403051714.21212-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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

In the error handling path, the clk_prepare_enable() function
call should be balanced by a corresponding 'clk_disable_unprepare()'
call , as already done in the remove function.

Fixes: 3424e3a4f844 ("drm: bridge: analogix/dp: split exynos dp driver to bridge directory")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c  | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index eb590fb8e8d0..2c0f582b4d32 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1698,7 +1698,10 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
 	dp->reg_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(dp->reg_base))
+	if (IS_ERR(dp->reg_base)) {
+		ret = PTR_ERR(dp->reg_base);
+		goto err_disable_clk;
+	}
 		return ERR_CAST(dp->reg_base);
 
 	dp->force_hpd = of_property_read_bool(dev->of_node, "force-hpd");
@@ -1711,7 +1714,8 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 	if (IS_ERR(dp->hpd_gpiod)) {
 		dev_err(dev, "error getting HDP GPIO: %ld\n",
 			PTR_ERR(dp->hpd_gpiod));
-		return ERR_CAST(dp->hpd_gpiod);
+		ret = PTR_ERR(dp->hpd_gpiod);
+		goto err_disable_clk;
 	}
 
 	if (dp->hpd_gpiod) {
@@ -1731,7 +1735,8 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 
 	if (dp->irq == -ENXIO) {
 		dev_err(&pdev->dev, "failed to get irq\n");
-		return ERR_PTR(-ENODEV);
+		ret = -ENODEV;
+		goto err_disable_clk;
 	}
 
 	ret = devm_request_threaded_irq(&pdev->dev, dp->irq,
@@ -1740,11 +1745,15 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 					irq_flags, "analogix-dp", dp);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to request irq\n");
-		return ERR_PTR(ret);
+		goto err_disable_clk;
 	}
 	disable_irq(dp->irq);
 
 	return dp;
+
+err_disable_clk:
+	clk_disable_unprepare(dp->clock);
+	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(analogix_dp_probe);
 
-- 
2.17.1

