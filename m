Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE83507E0A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 03:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9359310E594;
	Wed, 20 Apr 2022 01:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F7D10E59B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 01:16:53 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id z16so468067pfh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 18:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=awQ89Q2eVIn5YtdJtEsw9K0fnZEisfTylDK7brSxfAI=;
 b=ZvuY6hhlzcCFNr5CrpHawrlh8ladPMknFoA86rFmUlkTMZDJDbdfPhhew6+FHWnpCk
 +FDTGNRKSL6QIZ2xIqtNOC/sETeJGWJUe0bPBqKynQWjbQslUqxhDEmyp1BlOL5IRviC
 BWNZTni9zkFf4LKtey1D+xcV8Yfo0Bg3jcI13oyBC3+Lup3dxUHY38P9sSDTNrtrvrvv
 TWKtpwT3B9Ga+HRSAp1CTjrdePoEprxGUxWsPSfW21CHJtUO8AGG/w1ySQ4fwygBSRNv
 Ga2bIo0qevA5EnuVJd1qATgck/fPo1TUk+pgAOBC3bHMrXG1LsedU9JnXS4qFxK03Q89
 5yng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=awQ89Q2eVIn5YtdJtEsw9K0fnZEisfTylDK7brSxfAI=;
 b=Bv0bd9R1JNcT6hMmm+kmaUVa3CStgm4f9WfQgd5aOuGlpSVJj4yALvIsxRsuz77+TF
 i1dQ2pMtQguhK6yODh9CEY64qdQaJ8qO3IKildeAb9UBFfi4t7pDQYHGalvOV9iKmar+
 QgDQqmx/NgVKObN10kbb7VTQNrr2P7URDjgIIvo1tiX3T/iXdRHzPwHnv2BIpACyGxJ7
 FzMYdz+MDRt3YfdVteK905DtnEgiWoAoBKWlyiSX+bwhA51Gxt36vfGCHP/0OXN87Mkz
 B4q5l2Sy5fHsg/zaJYGCEu65NoVw7DpMUY7cvEvBxtkZDbIzwinTG72kS4C2ypMLVBeS
 IJ4w==
X-Gm-Message-State: AOAM5313f9Jk1nEhsDMGugV1oduPEA090Tk5/wwpejGba88FZJFRYYHf
 oVRQ+HdcCla3Qmq8lfRYehI=
X-Google-Smtp-Source: ABdhPJzjbFBIwom0FEvdj81aRBOLVKoduObhzayfRfK9ccXI226pDSUG4+046qvUgjNopJQGP1k6rQ==
X-Received: by 2002:a65:6657:0:b0:381:1b99:3f04 with SMTP id
 z23-20020a656657000000b003811b993f04mr16771033pgv.512.1650417413525; 
 Tue, 19 Apr 2022 18:16:53 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 f33-20020a631021000000b0039dbae3fce0sm17926598pgl.43.2022.04.19.18.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 18:16:53 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, Miaoqian Lin <linmq006@gmail.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <maxime@cerno.tech>,
 Yakir Yang <kuankuan.y@gmail.com>, Inki Dae <inki.dae@samsung.com>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/bridge: Fix error handling in analogix_dp_probe
Date: Wed, 20 Apr 2022 01:16:40 +0000
Message-Id: <20220420011644.25730-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <202204031935.5SkYsM2M-lkp@intel.com>
References: <202204031935.5SkYsM2M-lkp@intel.com>
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
changes in v2:
- remove the wrong return statement.
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index eb590fb8e8d0..474ef88015ae 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1698,8 +1698,10 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
 	dp->reg_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(dp->reg_base))
-		return ERR_CAST(dp->reg_base);
+	if (IS_ERR(dp->reg_base)) {
+		ret = PTR_ERR(dp->reg_base);
+		goto err_disable_clk;
+	}
 
 	dp->force_hpd = of_property_read_bool(dev->of_node, "force-hpd");
 
@@ -1711,7 +1713,8 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 	if (IS_ERR(dp->hpd_gpiod)) {
 		dev_err(dev, "error getting HDP GPIO: %ld\n",
 			PTR_ERR(dp->hpd_gpiod));
-		return ERR_CAST(dp->hpd_gpiod);
+		ret = PTR_ERR(dp->hpd_gpiod);
+		goto err_disable_clk;
 	}
 
 	if (dp->hpd_gpiod) {
@@ -1731,7 +1734,8 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 
 	if (dp->irq == -ENXIO) {
 		dev_err(&pdev->dev, "failed to get irq\n");
-		return ERR_PTR(-ENODEV);
+		ret = -ENODEV;
+		goto err_disable_clk;
 	}
 
 	ret = devm_request_threaded_irq(&pdev->dev, dp->irq,
@@ -1740,11 +1744,15 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
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

