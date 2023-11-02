Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A977DF81D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 17:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20B810E945;
	Thu,  2 Nov 2023 16:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69EB510E942
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 16:57:24 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0H-00035D-Sr; Thu, 02 Nov 2023 17:57:09 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0G-0067F6-HY; Thu, 02 Nov 2023 17:57:08 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0G-00Bjc9-86; Thu, 02 Nov 2023 17:57:08 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 06/16] drm/bridge: tpd12s015: Convert to platform remove
 callback returning void
Date: Thu,  2 Nov 2023 17:56:47 +0100
Message-ID: <20231102165640.3307820-24-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1798;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=kMMTJ6OVL/KVeGt2Z4+EJ0OcXp0Lp2oSXH2HDGf4ueM=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlQ9TQnF3tIwfB82YqWiWBSXux7zt//yPN0rWta
 Sy9S8SzVViJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUPU0AAKCRCPgPtYfRL+
 TkCmB/4m6K55Ex8+H3zLD1CrgzFoR+vfu1aD5t2nd44TitEVp0Vyvxs7DDv8UOxT2VNDWrbfWPP
 14/nQbTzcsdyIpDYvLAJ+CuKrgP+4br3w8d2xglI593P2LWBIHhxKQAuFYRFWwvZxPlK+FvVpv+
 H5wHaQD7N6kutc5RpBvizZuA8sxIn1S0BGxnoe45tfcJt/zYWlVnj0KklcXg2kTRJHyYUbIXXiS
 +i7hqsDao7U6LdYqzs/R4E3CBON60USwrWmYLC9hZ73bzggZ67gBrIf98sZ1rglEl2kIvh9dJ/X
 NpbBLDcH/YiZ23xh9LU/9QM30wI9Y3y+qfOCHDysygk/WsQe
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>
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
 drivers/gpu/drm/bridge/ti-tpd12s015.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tpd12s015.c b/drivers/gpu/drm/bridge/ti-tpd12s015.c
index b588fea12502..f9fb35683a27 100644
--- a/drivers/gpu/drm/bridge/ti-tpd12s015.c
+++ b/drivers/gpu/drm/bridge/ti-tpd12s015.c
@@ -179,13 +179,11 @@ static int tpd12s015_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tpd12s015_remove(struct platform_device *pdev)
+static void tpd12s015_remove(struct platform_device *pdev)
 {
 	struct tpd12s015_device *tpd = platform_get_drvdata(pdev);
 
 	drm_bridge_remove(&tpd->bridge);
-
-	return 0;
 }
 
 static const struct of_device_id tpd12s015_of_match[] = {
@@ -197,7 +195,7 @@ MODULE_DEVICE_TABLE(of, tpd12s015_of_match);
 
 static struct platform_driver tpd12s015_driver = {
 	.probe	= tpd12s015_probe,
-	.remove = tpd12s015_remove,
+	.remove_new = tpd12s015_remove,
 	.driver	= {
 		.name	= "tpd12s015",
 		.of_match_table = tpd12s015_of_match,
-- 
2.42.0

