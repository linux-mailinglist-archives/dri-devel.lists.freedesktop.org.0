Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 056666BFC52
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 20:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B35010E496;
	Sat, 18 Mar 2023 19:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DABF10E4A5
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 19:08:45 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbue-0001nv-N2; Sat, 18 Mar 2023 20:08:20 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbud-0054Dy-BG; Sat, 18 Mar 2023 20:08:19 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbuc-005wZ6-BM; Sat, 18 Mar 2023 20:08:18 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 07/19] drm/bridge: imx8qxp-ldb: Convert to platform remove
 callback returning void
Date: Sat, 18 Mar 2023 20:07:52 +0100
Message-Id: <20230318190804.234610-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
References: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1895;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=tDb9FqDrK4Shm1y3uWjkDohHnxzyl/h9mI2imlay544=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhhQxHkZeJyOOdXOW2IgxN6aFRnyKccncxGT3y1f24UyxE
 wphF706GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZiIXBD7Pz3neS//9ZjYB7GE
 ryu8HP/S5exyj4hO/odcQW5vdDbHPem4yJWRoWUpI2TIzfSZ63TN2R7DnMQYG65dLS5NG5QO2Ml
 POlpksV7bz79j9m1/F3/Tmva9JYFPbz6YJH+uSi32SP4Nwe12Wc5XN/+48zV0pYqf0T7tQGGxd2
 sFipdc4y7I3XDGz6dhTqOvTFL7xssZs5SroyPPseSuOH/7S0VIl/CH7WfvCFjsz2xT1sqoPPf8w
 l7fOZ18b/x3csrHu6nttUzhTDXlb2CvSnCZfvMP5/PjVyb61yS4eUdocBXsuPWkf/1N0feO/1Y+
 n9ukanPHbX8Aq0btm/JzL+qsxepaK3dvzs2d2T5JigkA
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
index 63948d5d20fd..c806576b1e22 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
@@ -667,7 +667,7 @@ static int imx8qxp_ldb_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int imx8qxp_ldb_remove(struct platform_device *pdev)
+static void imx8qxp_ldb_remove(struct platform_device *pdev)
 {
 	struct imx8qxp_ldb *imx8qxp_ldb = platform_get_drvdata(pdev);
 	struct ldb *ldb = &imx8qxp_ldb->base;
@@ -675,8 +675,6 @@ static int imx8qxp_ldb_remove(struct platform_device *pdev)
 	ldb_remove_bridge_helper(ldb);
 
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static int __maybe_unused imx8qxp_ldb_runtime_suspend(struct device *dev)
@@ -708,7 +706,7 @@ MODULE_DEVICE_TABLE(of, imx8qxp_ldb_dt_ids);
 
 static struct platform_driver imx8qxp_ldb_driver = {
 	.probe	= imx8qxp_ldb_probe,
-	.remove = imx8qxp_ldb_remove,
+	.remove_new = imx8qxp_ldb_remove,
 	.driver	= {
 		.pm = &imx8qxp_ldb_pm_ops,
 		.name = DRIVER_NAME,
-- 
2.39.2

