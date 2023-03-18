Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F826BFC47
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 20:09:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12DB10E481;
	Sat, 18 Mar 2023 19:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F0810E297
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 19:08:35 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbue-0001nw-N2; Sat, 18 Mar 2023 20:08:20 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbud-0054Dz-Bm; Sat, 18 Mar 2023 20:08:19 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbuc-005wZ9-HR; Sat, 18 Mar 2023 20:08:18 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 08/19] drm/bridge: imx8qxp-pixel-combiner: Convert to platform
 remove callback returning void
Date: Sat, 18 Mar 2023 20:07:53 +0100
Message-Id: <20230318190804.234610-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
References: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=r3zersQEkZmIgUIcev9EC6h07ZBLkgO+cDjgY5HorSU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFgwDmha8rlpjg/XzVI6TNwmD7EXf428FEpxDW
 wpukvCn+jCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBYMAwAKCRCPgPtYfRL+
 Tpp+B/9BBtqzDu7N9K88mrEtOlsT18gtpuKXLkVLAbWYZLCHjuT8aX5jkgnLZSA/P1MYIDZjlcM
 /HJqee9zWHmC9i0OzXx4H+gUa5ExBBkbmdg63rO0Cqf1TZgOkKNm0pWvys2abcCpE5uzjM7e0j8
 M+x2XvKh6HaVmhBCW/O4eNbILp2FZJ0k+ijH5yCwWp18zpNEN4R4hJiXxg3GhYTmRha8g293ubB
 ulrlHmwrZW0bJsf4ZUG7XQUniqHkR/ZYd5fUq6LEt5pl5/swzEcDoGxyuzX9hRrT1tkvhp/BiJp
 JB1ehbhGSt5VI8fkLv3VSYshtccCHe7sr9mHam1T7v/sQwQZ
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
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
index 503bd8db8afe..d0868a6ac6c9 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -357,7 +357,7 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int imx8qxp_pc_bridge_remove(struct platform_device *pdev)
+static void imx8qxp_pc_bridge_remove(struct platform_device *pdev)
 {
 	struct imx8qxp_pc *pc = platform_get_drvdata(pdev);
 	struct imx8qxp_pc_channel *ch;
@@ -374,8 +374,6 @@ static int imx8qxp_pc_bridge_remove(struct platform_device *pdev)
 	}
 
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static int __maybe_unused imx8qxp_pc_runtime_suspend(struct device *dev)
@@ -435,7 +433,7 @@ MODULE_DEVICE_TABLE(of, imx8qxp_pc_dt_ids);
 
 static struct platform_driver imx8qxp_pc_bridge_driver = {
 	.probe	= imx8qxp_pc_bridge_probe,
-	.remove = imx8qxp_pc_bridge_remove,
+	.remove_new = imx8qxp_pc_bridge_remove,
 	.driver	= {
 		.pm = &imx8qxp_pc_pm_ops,
 		.name = DRIVER_NAME,
-- 
2.39.2

