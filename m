Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C11C6BFC4B
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 20:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB7710E491;
	Sat, 18 Mar 2023 19:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E225B10E297
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 19:08:39 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbuf-0001nt-UR; Sat, 18 Mar 2023 20:08:21 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbud-0054Dq-5L; Sat, 18 Mar 2023 20:08:19 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbub-005wYs-Kn; Sat, 18 Mar 2023 20:08:17 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH 03/19] drm/bridge: cdns-mhdp8546: Convert to platform remove
 callback returning void
Date: Sat, 18 Mar 2023 20:07:48 +0100
Message-Id: <20230318190804.234610-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
References: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1913;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=lAllu844QScjLsOP9N5RrxCTXbJjqpETgiW9RI092UE=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFgv9aJ+zXwzWYcGZHz9YUlRGXov0fEzBCAjKg
 NwIz3FtdHuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBYL/QAKCRCPgPtYfRL+
 Tr+QCACWGrkN7voLFvGAe5HagzLtqcQf5vWTwBVMPk/psFC7pE+0+51+oUGgToZWaxBD4JeNP77
 emDCCQGiVSEaiFHcWK61OxdVeYmRRfKiivThMTWnaO2ew7P6XkXkA6dsPg53EDWp4ArQeYpVXhy
 3G+7o56S/fFXoN3Vj691qXrSf1/2zgbfieKWhbOUsgpLKw3g0rRBpMSoTjzI+mHkSwG5cl0LRHC
 o3WXIQNFZjewmssRH+ZPaxZQoQYgCfz24p95v+smVm/W04+K1029tGR/tb/66jPiBSmtRmtN43U
 J058o6/w5o5KVJ8iJMSaC0jyGC28RcpJbAaOqAyf1B90U8nJ
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>
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
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index d74c6fa30ccc..45d52baa1adc 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2570,7 +2570,7 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int cdns_mhdp_remove(struct platform_device *pdev)
+static void cdns_mhdp_remove(struct platform_device *pdev)
 {
 	struct cdns_mhdp_device *mhdp = platform_get_drvdata(pdev);
 	unsigned long timeout = msecs_to_jiffies(100);
@@ -2608,8 +2608,6 @@ static int cdns_mhdp_remove(struct platform_device *pdev)
 	/* Ignoring mhdp->hdcp.check_work and mhdp->hdcp.prop_work here. */
 
 	clk_disable_unprepare(mhdp->clk);
-
-	return 0;
 }
 
 static const struct of_device_id mhdp_ids[] = {
@@ -2632,7 +2630,7 @@ static struct platform_driver mhdp_driver = {
 		.of_match_table	= of_match_ptr(mhdp_ids),
 	},
 	.probe	= cdns_mhdp_probe,
-	.remove	= cdns_mhdp_remove,
+	.remove_new = cdns_mhdp_remove,
 };
 module_platform_driver(mhdp_driver);
 
-- 
2.39.2

