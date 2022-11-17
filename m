Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF97D62D400
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 08:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDB310E008;
	Thu, 17 Nov 2022 07:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE9010E008
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 07:22:04 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ovZDk-0006pm-A6; Thu, 17 Nov 2022 08:22:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ovZDi-004o2U-38; Thu, 17 Nov 2022 08:21:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ovZDi-00HDlY-6h; Thu, 17 Nov 2022 08:21:58 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH] backlight: pwm_bl: Drop support for legacy PWM probing
Date: Thu, 17 Nov 2022 08:21:51 +0100
Message-Id: <20221117072151.3789691-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2504;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=rSqok1k4GUjtAWeSAyFWtQ9yZyvrbmXx+GAVnwVQK7U=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjdeEJwIfzABoyAsEpLbMq3vER8M/vKHHUdwIlvheh
 rgvLFW+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY3XhCQAKCRDB/BR4rcrsCV0AB/
 oCGu1BnxfECZOLO6M3AVdlDI867ImIggjUXeq4vMaxX9R73D/rOkVaKrmsp5nS1jLSdBmIEwEamNxE
 D/xd8KzJsqdK3tLMIP+ig3TkZo+TUae1i4SjeJuZ0WvYO44lefTwz3C/JfgCLwoz1G3sz6sa6bHIvQ
 KXaPggRyfIGuMeyd9C7AyptL9SnGqs5sZNTuiT+h+4QhbcWS6jWM0pBG5IkEp6uvexHs3D8OG5xmDc
 D1+6JxNHTwu3xbBGS4oGC2aZxAQLfSZnUvlBC4werJrWD/QCWpi00v6DXMUyT+Lb8dc6IcSNaqvUeI
 r0VshUIRi4rhAyrOGFQBuboRKV3+4n
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
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no in-tree user left which relies on legacy probing. So drop
support for it which removes another user of the deprecated
pwm_request() function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/video/backlight/pwm_bl.c | 12 ------------
 include/linux/pwm_backlight.h    |  1 -
 2 files changed, 13 deletions(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index c0523a0269ee..d0b22158cd70 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -28,7 +28,6 @@ struct pwm_bl_data {
 	struct regulator	*power_supply;
 	struct gpio_desc	*enable_gpio;
 	unsigned int		scale;
-	bool			legacy;
 	unsigned int		post_pwm_on_delay;
 	unsigned int		pwm_off_delay;
 	int			(*notify)(struct device *,
@@ -455,7 +454,6 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 	struct platform_pwm_backlight_data defdata;
 	struct backlight_properties props;
 	struct backlight_device *bl;
-	struct device_node *node = pdev->dev.of_node;
 	struct pwm_bl_data *pb;
 	struct pwm_state state;
 	unsigned int i;
@@ -506,12 +504,6 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 	}
 
 	pb->pwm = devm_pwm_get(&pdev->dev, NULL);
-	if (IS_ERR(pb->pwm) && PTR_ERR(pb->pwm) != -EPROBE_DEFER && !node) {
-		dev_err(&pdev->dev, "unable to request PWM, trying legacy API\n");
-		pb->legacy = true;
-		pb->pwm = pwm_request(data->pwm_id, "pwm-backlight");
-	}
-
 	if (IS_ERR(pb->pwm)) {
 		ret = PTR_ERR(pb->pwm);
 		if (ret != -EPROBE_DEFER)
@@ -604,8 +596,6 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 	if (IS_ERR(bl)) {
 		dev_err(&pdev->dev, "failed to register backlight\n");
 		ret = PTR_ERR(bl);
-		if (pb->legacy)
-			pwm_free(pb->pwm);
 		goto err_alloc;
 	}
 
@@ -639,8 +629,6 @@ static int pwm_backlight_remove(struct platform_device *pdev)
 
 	if (pb->exit)
 		pb->exit(&pdev->dev);
-	if (pb->legacy)
-		pwm_free(pb->pwm);
 
 	return 0;
 }
diff --git a/include/linux/pwm_backlight.h b/include/linux/pwm_backlight.h
index 06086cb93b6f..cdd2ac366bc7 100644
--- a/include/linux/pwm_backlight.h
+++ b/include/linux/pwm_backlight.h
@@ -8,7 +8,6 @@
 #include <linux/backlight.h>
 
 struct platform_pwm_backlight_data {
-	int pwm_id;
 	unsigned int max_brightness;
 	unsigned int dft_brightness;
 	unsigned int lth_brightness;

base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
-- 
2.38.1

