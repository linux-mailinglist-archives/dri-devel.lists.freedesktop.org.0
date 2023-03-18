Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F01446BFC4F
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 20:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C231510E4AD;
	Sat, 18 Mar 2023 19:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3D610E2CA
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 19:08:35 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbue-0001ny-NC; Sat, 18 Mar 2023 20:08:20 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbud-0054E9-Mp; Sat, 18 Mar 2023 20:08:19 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbuc-005wZ3-5z; Sat, 18 Mar 2023 20:08:18 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 06/19] drm/bridge: imx8qm-ldb: Convert to platform remove
 callback returning void
Date: Sat, 18 Mar 2023 20:07:51 +0100
Message-Id: <20230318190804.234610-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
References: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1876;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=MlegqPpSfMx4Fgd4awNNReLTJh+Lp2Co3f89uEpsKnI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFgwAZvkZZVqA3kFfRzIfaYwlzso3GovhNwP7J
 /1HdoWd5lSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBYMAAAKCRCPgPtYfRL+
 Tv4nCAC5y4OwWb1OI/vXjyGR9rRuCP6BdeVmixJ5YHorzFZPSUtyBGUGiCOUAyZUVt4L0yJtxd4
 K6QEkDfdCjbay1p2T9bILHHZ4KmVpgXODN64gPQyBytSQqJBI+XzNmv2ApfzqhQd7FNMnvNmVvr
 /651IkM87phxcLI+1h1CYUK3fiMVrn3bdWlTtZk85pl6GTBuhTKdt//8pm8JkuhifAt483gjnUf
 bD+BGMCb80qnsI6pZKgBTdH3B69eOYIHtitHR2ogRx2pDuiEHnj4DKkyj8UAKhZZWiAjVdDrSYM
 Cf6lFbkBVvjT3vfPFYJjYGboCGwChSyPlfPyu4AkitpXkZRR
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
 drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c b/drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c
index 178af8d2d80b..386032a02599 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c
@@ -532,7 +532,7 @@ static int imx8qm_ldb_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int imx8qm_ldb_remove(struct platform_device *pdev)
+static void imx8qm_ldb_remove(struct platform_device *pdev)
 {
 	struct imx8qm_ldb *imx8qm_ldb = platform_get_drvdata(pdev);
 	struct ldb *ldb = &imx8qm_ldb->base;
@@ -540,8 +540,6 @@ static int imx8qm_ldb_remove(struct platform_device *pdev)
 	ldb_remove_bridge_helper(ldb);
 
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static int __maybe_unused imx8qm_ldb_runtime_suspend(struct device *dev)
@@ -573,7 +571,7 @@ MODULE_DEVICE_TABLE(of, imx8qm_ldb_dt_ids);
 
 static struct platform_driver imx8qm_ldb_driver = {
 	.probe	= imx8qm_ldb_probe,
-	.remove = imx8qm_ldb_remove,
+	.remove_new = imx8qm_ldb_remove,
 	.driver	= {
 		.pm = &imx8qm_ldb_pm_ops,
 		.name = DRIVER_NAME,
-- 
2.39.2

