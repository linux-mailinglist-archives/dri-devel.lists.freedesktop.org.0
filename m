Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C097B8BAF83
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 17:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87ADA1130F4;
	Fri,  3 May 2024 15:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9101130A6
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 15:12:11 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1s2uZR-0004C0-K6; Fri, 03 May 2024 17:11:33 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1s2uZN-00FjHY-Qs; Fri, 03 May 2024 17:11:29 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: [PATCH 05/14] drm/bridge: analogix_dp: remove unused
 analogix_dp_remove
Date: Fri,  3 May 2024 17:11:20 +0200
Message-Id: <20240503151129.3901815-6-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503151129.3901815-1-l.stach@pengutronix.de>
References: <20240503151129.3901815-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Now that the clock is handled dynamically through
analogix_dp_resume/suspend and it isn't statically enabled in the
driver probe routine, there is no need for the remove function anymore.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 -----
 drivers/gpu/drm/exynos/exynos_dp.c                 | 3 ---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 9 +--------
 include/drm/bridge/analogix_dp.h                   | 1 -
 4 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 9e3308257586..9f1dfa6f2175 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1813,11 +1813,6 @@ void analogix_dp_unbind(struct analogix_dp_device *dp)
 }
 EXPORT_SYMBOL_GPL(analogix_dp_unbind);
 
-void analogix_dp_remove(struct analogix_dp_device *dp)
-{
-}
-EXPORT_SYMBOL_GPL(analogix_dp_remove);
-
 int analogix_dp_start_crc(struct drm_connector *connector)
 {
 	struct analogix_dp_device *dp = to_dp(connector);
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 30c8750187ad..097f8c4617de 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -251,10 +251,7 @@ static int exynos_dp_probe(struct platform_device *pdev)
 
 static void exynos_dp_remove(struct platform_device *pdev)
 {
-	struct exynos_dp_device *dp = platform_get_drvdata(pdev);
-
 	component_del(&pdev->dev, &exynos_dp_ops);
-	analogix_dp_remove(dp->adp);
 }
 
 static int exynos_dp_suspend(struct device *dev)
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 8214265f1497..362c7951ca4a 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -414,21 +414,14 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 
 	ret = component_add(dev, &rockchip_dp_component_ops);
 	if (ret)
-		goto err_dp_remove;
+		return ret;
 
 	return 0;
-
-err_dp_remove:
-	analogix_dp_remove(dp->adp);
-	return ret;
 }
 
 static void rockchip_dp_remove(struct platform_device *pdev)
 {
-	struct rockchip_dp_device *dp = platform_get_drvdata(pdev);
-
 	component_del(&pdev->dev, &rockchip_dp_component_ops);
-	analogix_dp_remove(dp->adp);
 }
 
 static int rockchip_dp_suspend(struct device *dev)
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 8709b6a74c0f..6002c5666031 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -44,7 +44,6 @@ struct analogix_dp_device *
 analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data);
 int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev);
 void analogix_dp_unbind(struct analogix_dp_device *dp);
-void analogix_dp_remove(struct analogix_dp_device *dp);
 
 int analogix_dp_start_crc(struct drm_connector *connector);
 int analogix_dp_stop_crc(struct drm_connector *connector);
-- 
2.39.2

