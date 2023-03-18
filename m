Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D236BFDDA
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:56:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF6710E4EB;
	Sat, 18 Mar 2023 23:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7102510E4B1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:54:55 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNv-0004Os-Rl; Sun, 19 Mar 2023 00:54:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNu-0056cx-68; Sun, 19 Mar 2023 00:54:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNt-005zWc-GQ; Sun, 19 Mar 2023 00:54:49 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH 47/51] video: fbdev: via: Convert to platform remove callback
 returning void
Date: Sun, 19 Mar 2023 00:54:24 +0100
Message-Id: <20230318235428.272091-48-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2742;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=nRUKepkuc8birmSosnSrBVBu9UYDmgMqTl2f4T6Kqnc=;
 b=owEBbAGT/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk8W+mD/goTxhMKQhsX6uNUduvd/DJ8rGfj93
 aowx3o5vJ2JATIEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZPFgAKCRCPgPtYfRL+
 Tt+HB/jMmttqsZvPBjzv/AIh/Zila4Q6jU2ev/DakReXx8OsuM7SDnlNjMWA280x+sJvDPgzy7X
 Lvy8+1FTMBt6KWIBBLC7fb7mUZp+dt6IFY0bxIoaHKvBc1xbfM/JpAIEi50iIEPbD7e1x7omlgp
 0+LOkqsIBstyL+h+7rnuSpYUgoqEMstmDsbbyUyhpAUv3AsPWnFrbbtWVpaBwn0vwVPNeWyugYo
 9bJYodWUg9944GzT0ch8cETXIZNQ9rd+bGpVyQVl/SEoXDjZUGgPLYHYcPjEsXmh6KQ+BofuDEa
 aVmkjYjfK/p5sf0C9GjzIcD6/1l2KU9OUCgC9brdfSioj7w=
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
Cc: linux-fbdev@vger.kernel.org, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org
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
 drivers/video/fbdev/via/via-gpio.c | 5 ++---
 drivers/video/fbdev/via/via_i2c.c  | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/via/via-gpio.c b/drivers/video/fbdev/via/via-gpio.c
index febb2aadd822..f1b670397c02 100644
--- a/drivers/video/fbdev/via/via-gpio.c
+++ b/drivers/video/fbdev/via/via-gpio.c
@@ -262,7 +262,7 @@ static int viafb_gpio_probe(struct platform_device *platdev)
 }
 
 
-static int viafb_gpio_remove(struct platform_device *platdev)
+static void viafb_gpio_remove(struct platform_device *platdev)
 {
 	unsigned long flags;
 	int i;
@@ -285,7 +285,6 @@ static int viafb_gpio_remove(struct platform_device *platdev)
 		viafb_gpio_disable(viafb_gpio_config.active_gpios[i]);
 	viafb_gpio_config.gpio_chip.ngpio = 0;
 	spin_unlock_irqrestore(&viafb_gpio_config.vdev->reg_lock, flags);
-	return 0;
 }
 
 static struct platform_driver via_gpio_driver = {
@@ -293,7 +292,7 @@ static struct platform_driver via_gpio_driver = {
 		.name = "viafb-gpio",
 	},
 	.probe = viafb_gpio_probe,
-	.remove = viafb_gpio_remove,
+	.remove_new = viafb_gpio_remove,
 };
 
 int viafb_gpio_init(void)
diff --git a/drivers/video/fbdev/via/via_i2c.c b/drivers/video/fbdev/via/via_i2c.c
index c7e63ab47c39..c35e530e0ec9 100644
--- a/drivers/video/fbdev/via/via_i2c.c
+++ b/drivers/video/fbdev/via/via_i2c.c
@@ -246,7 +246,7 @@ static int viafb_i2c_probe(struct platform_device *platdev)
 	return 0;
 }
 
-static int viafb_i2c_remove(struct platform_device *platdev)
+static void viafb_i2c_remove(struct platform_device *platdev)
 {
 	int i;
 
@@ -259,7 +259,6 @@ static int viafb_i2c_remove(struct platform_device *platdev)
 		if (i2c_stuff->is_active)
 			i2c_del_adapter(&i2c_stuff->adapter);
 	}
-	return 0;
 }
 
 static struct platform_driver via_i2c_driver = {
@@ -267,7 +266,7 @@ static struct platform_driver via_i2c_driver = {
 		.name = "viafb-i2c",
 	},
 	.probe = viafb_i2c_probe,
-	.remove = viafb_i2c_remove,
+	.remove_new = viafb_i2c_remove,
 };
 
 int viafb_i2c_init(void)
-- 
2.39.2

