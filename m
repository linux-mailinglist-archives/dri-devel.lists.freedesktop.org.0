Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A9A6AFFF9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 08:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356FA10E5A4;
	Wed,  8 Mar 2023 07:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58EB10E58F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 07:39:57 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZoOv-0007RO-EF; Wed, 08 Mar 2023 08:39:53 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZoOu-002fIe-4W; Wed, 08 Mar 2023 08:39:52 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZoOt-003EMM-CS; Wed, 08 Mar 2023 08:39:51 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 09/13] backlight: mt6370-backlight: Convert to platform remove
 callback returning void
Date: Wed,  8 Mar 2023 08:39:41 +0100
Message-Id: <20230308073945.2336302-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
References: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1754;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=izMl9qYZIjLfU5gY6yLq3ubZeeyc6JGvz++8GSEQJW0=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkCDuuUSpDDhEM7P5ntBvd6sGNC7ioJLTDFxq90
 V60T6nzE3SJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAg7rgAKCRDB/BR4rcrs
 Cc6oB/9WVJQFnIaDmnFEvpsCEp0G6K57Xf6TiCfAC7Jd+ERnAtUpHicrWrRBgZUNtxQL5wfepUv
 n+fEoQ3U8C5H3J/GsRo/Vvtvh8oe8F35YNtbwTKV6zUCLK/nCa5nGkkM1aHhDNCMty0reJxulh2
 wTu6Kh9FqHqjUUN73Asvf1u3anMDk4fcmwYDLC3tDPcED9D/xwx+A0rE9A2arGu9J6y0bBmqZ/P
 1AlmcACUajW1dL5NqPTch8fsxeRczOkX3719pRpStb4dmE0u96AoT0T1So38TH6E2CwCkE7qkxS
 OwC84dvY7InkTwU1CTclS7SlTp2h8HkMn2OC9mupMeJCrce4
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
 drivers/video/backlight/mt6370-backlight.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/mt6370-backlight.c b/drivers/video/backlight/mt6370-backlight.c
index 623d4f2baca2..94422c956453 100644
--- a/drivers/video/backlight/mt6370-backlight.c
+++ b/drivers/video/backlight/mt6370-backlight.c
@@ -318,15 +318,13 @@ static int mt6370_bl_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mt6370_bl_remove(struct platform_device *pdev)
+static void mt6370_bl_remove(struct platform_device *pdev)
 {
 	struct mt6370_priv *priv = platform_get_drvdata(pdev);
 	struct backlight_device *bl_dev = priv->bl;
 
 	bl_dev->props.brightness = 0;
 	backlight_update_status(priv->bl);
-
-	return 0;
 }
 
 static const struct of_device_id mt6370_bl_of_match[] = {
@@ -342,7 +340,7 @@ static struct platform_driver mt6370_bl_driver = {
 		.of_match_table = mt6370_bl_of_match,
 	},
 	.probe = mt6370_bl_probe,
-	.remove = mt6370_bl_remove,
+	.remove_new = mt6370_bl_remove,
 };
 module_platform_driver(mt6370_bl_driver);
 
-- 
2.39.1

