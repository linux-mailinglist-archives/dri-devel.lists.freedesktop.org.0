Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A4D86FCC5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 10:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8C510FD2E;
	Mon,  4 Mar 2024 09:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C978610FD2E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 09:10:23 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rh4Kp-0002N6-15; Mon, 04 Mar 2024 10:10:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rh4Kn-004K0d-Mv; Mon, 04 Mar 2024 10:10:09 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rh4Kn-00GVK0-1u;
 Mon, 04 Mar 2024 10:10:09 +0100
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
Subject: [PATCH] drm/bridge: imx8mp-hdmi-tx: Convert to platform remove
 callback returning void
Date: Mon,  4 Mar 2024 10:10:06 +0100
Message-ID: <20240304091005.717012-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2046;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=lcXeO+a9WrkMUrUIy22M2pZ4uTZS3MLLTRm/+F7o40w=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhtSn/e+EQxd62jnME1t4asukxctXTJ5yYGZJb5+H1G47v
 hAmxuD1nYzGLAyMXAyyYoos9o1rMq2q5CI71/67DDOIlQlkCgMXpwBMZKECB0OX07JZV7TkH/8I
 TdogqXvRqnWHVv/9KdWd6lMmXCjJV3VhOaYSfNvOWrDbrLHGrrK0ZeLvlGvci44Ynb7qcuT1/IS
 oV7GhTQd7GQ8ounvMfdny7aaH3LN9H78L+OUx2Im2djsrRjcIBuctX3ZOT67bYO3dnjgplcVCzL
 43J/4wSZPt+/L2uFotu3qNafP/tMW6Xplf+JikzRvsrd9t/8mZ4Mya68ZSkt25I1Nh71MDVpOAl
 xbFbPfvF2zauNbxdf2BA/c/WaRNWvaFNbnx/PqTdlUG/HrCT89P3WgkMe+52puHL4p7UhPqJvFm
 rF7mXHROYuMrTtF6dtWNkxf8mRHVfnlKQ64Sy901z3W0AA==
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

 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
index 89fc432ac611..13bc570c5473 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
@@ -104,13 +104,11 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int imx8mp_dw_hdmi_remove(struct platform_device *pdev)
+static void imx8mp_dw_hdmi_remove(struct platform_device *pdev)
 {
 	struct imx8mp_hdmi *hdmi = platform_get_drvdata(pdev);
 
 	dw_hdmi_remove(hdmi->dw_hdmi);
-
-	return 0;
 }
 
 static int __maybe_unused imx8mp_dw_hdmi_pm_suspend(struct device *dev)
@@ -140,7 +138,7 @@ MODULE_DEVICE_TABLE(of, imx8mp_dw_hdmi_of_table);
 
 static struct platform_driver imx8mp_dw_hdmi_platform_driver = {
 	.probe		= imx8mp_dw_hdmi_probe,
-	.remove		= imx8mp_dw_hdmi_remove,
+	.remove_new	= imx8mp_dw_hdmi_remove,
 	.driver		= {
 		.name	= "imx8mp-dw-hdmi-tx",
 		.of_match_table = imx8mp_dw_hdmi_of_table,

base-commit: 67908bf6954b7635d33760ff6dfc189fc26ccc89
-- 
2.43.0

