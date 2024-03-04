Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066F186FCB3
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 10:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A8010F2F6;
	Mon,  4 Mar 2024 09:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F1710F383
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 09:06:37 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rh4Gz-0001Qd-8Y; Mon, 04 Mar 2024 10:06:13 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rh4Gx-004Jh7-1g; Mon, 04 Mar 2024 10:06:11 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rh4Gw-00GV5E-32;
 Mon, 04 Mar 2024 10:06:10 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, Liu Ying <victor.liu@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/bridge: imx8mp-hdmi-pvi: Convert to platform remove
 callback returning void
Date: Mon,  4 Mar 2024 10:05:56 +0100
Message-ID: <20240304090555.716327-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2070;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=L2oQ/vpbvrsgqjGlIqLZic9br8aQK83599Mm2I4cAFg=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl5Y7zxh4me8p/QL0pXjlngp8Ilt1Vl34Zua8R0
 KoJtzczmWOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZeWO8wAKCRCPgPtYfRL+
 Tjz0B/4iKOETufTEfhd0muGamZHg7vD989wvZKJBCgMzYmHQlYL6MbcOhbENWnQwXCU5017RoWm
 CxHk1XYnJ0PxBFxwU9NXM/Rz48U9TK01u9MedNFIJ/2mjfGG7hBd6VGdKDqUWUcTNpbsStU/6lV
 d+DFiQFDMANpyWIVEgSW7vJD5qZEgWMzakIa9pNLTfY6y6wBwgKbxQbUKBlgL617d5YeDVrcdQc
 PkxOzPMEilZNwk4qcfnFTxAg08SVkCaWPYBM8OkLi6JQc1wQ1FyDUW4fo74a80sX2f7nLwcHUHj
 PPUcIApX6mB7uv0Awyh1yJK2hiGne/1BvzKz9dqAdcWyZ62C
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

note this driver is currently only available in next.

Best regards
Uwe

 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
index f2a09c879e3d..073e64dc200c 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
@@ -173,15 +173,13 @@ static int imx8mp_hdmi_pvi_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int imx8mp_hdmi_pvi_remove(struct platform_device *pdev)
+static void imx8mp_hdmi_pvi_remove(struct platform_device *pdev)
 {
 	struct imx8mp_hdmi_pvi *pvi = platform_get_drvdata(pdev);
 
 	drm_bridge_remove(&pvi->bridge);
 
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id imx8mp_hdmi_pvi_match[] = {
@@ -195,7 +193,7 @@ MODULE_DEVICE_TABLE(of, imx8mp_hdmi_pvi_match);
 
 static struct platform_driver imx8mp_hdmi_pvi_driver = {
 	.probe	= imx8mp_hdmi_pvi_probe,
-	.remove	= imx8mp_hdmi_pvi_remove,
+	.remove_new = imx8mp_hdmi_pvi_remove,
 	.driver		= {
 		.name = "imx-hdmi-pvi",
 		.of_match_table	= imx8mp_hdmi_pvi_match,

base-commit: 67908bf6954b7635d33760ff6dfc189fc26ccc89
-- 
2.43.0

