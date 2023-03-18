Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6AE6BFC48
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 20:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D3810E47C;
	Sat, 18 Mar 2023 19:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA86310E058
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 19:08:31 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbuh-0001uM-Jc; Sat, 18 Mar 2023 20:08:23 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbug-0054Ez-LQ; Sat, 18 Mar 2023 20:08:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbuf-005wZu-Ip; Sat, 18 Mar 2023 20:08:21 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 19/19] drm/bridge: ti-tfp410: Convert to platform remove
 callback returning void
Date: Sat, 18 Mar 2023 20:08:04 +0100
Message-Id: <20230318190804.234610-20-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
References: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1598;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Kb/3WrDogc45V9gw8JVjdCX72OlQk/IE4c2ji/cx3cM=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFgwP1uGbUwOK/jVuc4L4F9HI2SRuxOkIH3T6i
 +Jj9eTjmoqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBYMDwAKCRCPgPtYfRL+
 Tid9B/9N3WcGlq/m8n2Lr5QaQdZ6yt02659zpJrCA36DJu+kzoCOmif+bZZKm6+Zp5JbH1T36CR
 VZEKLNW6fsH0SXud7S7IhHHI5OesHyw3QMa4ArBchXjC695o5f0ROE6kemhb1tctJHKZelnc+Wl
 OugYOEX/OzjBNpqXrOJI3fet+93dzaDZS2c+P0/Tt+m5Lf24PLVBNJLhjKUIAJm7BTQxr0YS2Zk
 K96PCeJA421kXmQ6HImtHyvZMvmmcNIUqp5YWSidRlAZNeLtDa9h+fZXJIPWPiBWIB3Uwx9V2fv
 UwJG0JhKZ7pUChvDGsiSSb+deI+ddyjL/A2O9SyxRPex9pcp
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
 drivers/gpu/drm/bridge/ti-tfp410.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 6db69df0e18b..ab63225cd635 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -355,11 +355,9 @@ static int tfp410_probe(struct platform_device *pdev)
 	return tfp410_init(&pdev->dev, false);
 }
 
-static int tfp410_remove(struct platform_device *pdev)
+static void tfp410_remove(struct platform_device *pdev)
 {
 	tfp410_fini(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id tfp410_match[] = {
@@ -370,7 +368,7 @@ MODULE_DEVICE_TABLE(of, tfp410_match);
 
 static struct platform_driver tfp410_platform_driver = {
 	.probe	= tfp410_probe,
-	.remove	= tfp410_remove,
+	.remove_new = tfp410_remove,
 	.driver	= {
 		.name		= "tfp410-bridge",
 		.of_match_table	= tfp410_match,
-- 
2.39.2

