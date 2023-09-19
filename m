Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E91117A5FD3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 12:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA9410E283;
	Tue, 19 Sep 2023 10:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB0E10E283
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 10:40:00 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qiY8x-0006CG-3S; Tue, 19 Sep 2023 12:39:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qiY8u-007Qv7-JZ; Tue, 19 Sep 2023 12:39:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qiY8u-002yC8-9d; Tue, 19 Sep 2023 12:39:44 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] drm: exynos: dsi: Convert to platform remove callback
 returning void
Date: Tue, 19 Sep 2023 12:39:39 +0200
Message-Id: <20230919103939.1367659-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3223;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=FjFx/LVU9PE3vwV/50OeJXfNJBAMNy6UXN+FBq5aQ84=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCXpqPTavkc66ZJK1HM6buF4WqzRIYWSsTqibd
 4Zq4QmUt9iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQl6agAKCRCPgPtYfRL+
 Thc+CACKqEieg7a+u/8TQmOnZfs820fWGEOzs1ICJnoom5J4Y1m5HZejhPeglCOzEdXL0p5fpze
 N4MJkdWMdkDhImf+9O29v3o22NkoKE9yD+khh5oEW7IwPnbh4j0CbPFbQBcVs/lcQTOrzEVniVP
 txLJUcAvhHsLQpl4JJinbDwI7tbCkUqFkhMSeOG83B8P6VdVSscVcjVsm+XdsHRqTYWrmz1s0fV
 zNo+/zaJS4PLUeZJQJmjj5dbq7Gs2gtT3hgDMDPzthCisL36BrOVthPz2/oEcfWkjYAX2eAa4RP
 w+Xo1qIQiI2xjPonoZuxrHC/oKKIxOp/FhQK35NzEEXvy56G
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 kernel@pengutronix.de, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.
To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() is renamed to .remove().

samsung_dsim_remove() returned 0 unconditionally. Make it return void
instead to convert the two related platform drivers to use
.remove_new().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/bridge/samsung-dsim.c   | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 +-
 include/drm/bridge/samsung-dsim.h       | 2 +-
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index b1df91e37b1b..2b56a5bfe273 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1998,7 +1998,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(samsung_dsim_probe);
 
-int samsung_dsim_remove(struct platform_device *pdev)
+void samsung_dsim_remove(struct platform_device *pdev)
 {
 	struct samsung_dsim *dsi = platform_get_drvdata(pdev);
 
@@ -2006,8 +2006,6 @@ int samsung_dsim_remove(struct platform_device *pdev)
 
 	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->unregister_host)
 		dsi->plat_data->host_ops->unregister_host(dsi);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(samsung_dsim_remove);
 
@@ -2107,7 +2105,7 @@ MODULE_DEVICE_TABLE(of, samsung_dsim_of_match);
 
 static struct platform_driver samsung_dsim_driver = {
 	.probe = samsung_dsim_probe,
-	.remove = samsung_dsim_remove,
+	.remove_new = samsung_dsim_remove,
 	.driver = {
 		   .name = "samsung-dsim",
 		   .pm = &samsung_dsim_pm_ops,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 69ea33cae651..2fe0e5f3f638 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -181,7 +181,7 @@ MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
 
 struct platform_driver dsi_driver = {
 	.probe = samsung_dsim_probe,
-	.remove = samsung_dsim_remove,
+	.remove_new = samsung_dsim_remove,
 	.driver = {
 		   .name = "exynos-dsi",
 		   .owner = THIS_MODULE,
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 6fc9bb2979e4..3f8050d523eb 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -116,7 +116,7 @@ struct samsung_dsim {
 };
 
 extern int samsung_dsim_probe(struct platform_device *pdev);
-extern int samsung_dsim_remove(struct platform_device *pdev);
+extern void samsung_dsim_remove(struct platform_device *pdev);
 extern const struct dev_pm_ops samsung_dsim_pm_ops;
 
 #endif /* __SAMSUNG_DSIM__ */

base-commit: 0663e1da5ba8e6459e3555ac12c62741668c0d30
-- 
2.40.1

