Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AA8766FEE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 16:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2C610E70D;
	Fri, 28 Jul 2023 14:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3633110E70D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 14:58:35 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qPOvI-00030N-Eg; Fri, 28 Jul 2023 16:58:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qPOvH-002jOA-PO; Fri, 28 Jul 2023 16:58:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qPOvG-008WkM-VO; Fri, 28 Jul 2023 16:58:30 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/3] drm/ssd130x: Print the PWM's label instead of its number
Date: Fri, 28 Jul 2023 16:58:22 +0200
Message-Id: <20230728145824.616687-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728145824.616687-1-u.kleine-koenig@pengutronix.de>
References: <20230728145824.616687-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=989;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=9uB1OXNNW+zwAUhmyEf2cN1xF00OtdK5L16qJeKgSQM=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkw9eJT4BCwPcaZJGa4Q/dqalhhcq0hMX6If5wb
 Jllnj0VezCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMPXiQAKCRCPgPtYfRL+
 Tj1cB/4ggve2JqBzDjsNtkvhToVeWOqiO8T7twsKR1y5BRuRfE2pdpP6ixKkBCtS6Abifcxx6cV
 cgiK4k6QpG7P/tYK2cGFcVzj6YZ1TZ8IHh91WIvDjeddzlwkb3ekAO+Pev3rN1lUj7oe94PnnlR
 25+/DTQz6CZ4I0hooCXQ72RcCLW1pW8YWy717AUWfRMl88NXHIhMmul1bI7j6d7Cfkli69Ighwy
 S1Wlu5c0P7hoF7XYKOx8Ds4he2o6a+RJjf/KjKRmi5Fdw5DjD/A5O6jJVmSnmkbpXY5WjTRewyA
 RAAIvvHKzjWxlRq81Pf2XbfNovG7NB5aXsOnhfYOI6xhoVco
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct pwm_device::pwm is a write-only variable in the pwm core and used
nowhere apart from this and another dev_dbg. So it isn't useful to
identify the used PWM. Emit the PWM's label instead in the debug
message.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/solomon/ssd130x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 8cbf5aa66e19..6aa3baefabe4 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -244,8 +244,8 @@ static int ssd130x_pwm_enable(struct ssd130x_device *ssd130x)
 	/* Enable the PWM */
 	pwm_enable(ssd130x->pwm);
 
-	dev_dbg(dev, "Using PWM%d with a %lluns period.\n",
-		ssd130x->pwm->pwm, pwm_get_period(ssd130x->pwm));
+	dev_dbg(dev, "Using PWM %s with a %lluns period.\n",
+		ssd130x->pwm->label, pwm_get_period(ssd130x->pwm));
 
 	return 0;
 }
-- 
2.39.2

