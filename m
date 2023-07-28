Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8F3766FF3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 16:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1DB10E711;
	Fri, 28 Jul 2023 14:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A18310E711
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 14:58:47 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qPOvL-00030O-ON; Fri, 28 Jul 2023 16:58:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qPOvH-002jOE-W9; Fri, 28 Jul 2023 16:58:32 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qPOvH-008WkP-D3; Fri, 28 Jul 2023 16:58:31 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jilin Yuan <yuanjilin@cdjrlc.com>
Subject: [PATCH 2/3] video: fbdev: ssd1307fb: Print the PWM's label instead of
 its number
Date: Fri, 28 Jul 2023 16:58:23 +0200
Message-Id: <20230728145824.616687-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728145824.616687-1-u.kleine-koenig@pengutronix.de>
References: <20230728145824.616687-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=0P1/KpGQ9f8J6bY99RI2pVsdqUOU6FI+1+net6ZiEy4=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkw9eKLLisLuS+D7TCHzgyRAnVPUSEs/f6CMa59
 mfDk0tQp5OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMPXigAKCRCPgPtYfRL+
 Tp7nB/4ud4oh/0jcHDyNPNBCOVkB7D5/nUUG87YrdL+ja3WHQHXhqfOln5fZEYDcwGa/5e4qKp3
 xZZL9uWd+6+82o0Lbk8fWHgpN1DPfPXU4/B95qbpsBxTpPfMQTXekgEGrAravU9C1xxTDu2+ibG
 XnzQRGTD54M+OuCWdzu+o6qgmx26LU6uTjGKK/Mna2KEnNYSSJ5PFo7GoZAKehNRhG2w3O/+OLr
 sPPgyujzVBmwopYr6j07RxQyWiJvBGaPyOmPYXbC02lGldp4WhuNUJ5AuEk7ElR6L7zYC1PCqmB
 jnCRTDpVZrmyCrL220uHKYEIvR8cgAiMlbVqpPdMhQlId4dY
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

struct pwm_device::pwm is a write-only variable in the pwm core and used
nowhere apart from this and another dev_dbg. So it isn't useful to
identify the used PWM. Emit the PWM's label instead in the debug
message.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/video/fbdev/ssd1307fb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 11c373798279..46881a691549 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -399,8 +399,8 @@ static int ssd1307fb_init(struct ssd1307fb_par *par)
 		/* Enable the PWM */
 		pwm_enable(par->pwm);
 
-		dev_dbg(&par->client->dev, "Using PWM%d with a %lluns period.\n",
-			par->pwm->pwm, pwm_get_period(par->pwm));
+		dev_dbg(&par->client->dev, "Using PWM %s with a %lluns period.\n",
+			par->pwm->label, pwm_get_period(par->pwm));
 	}
 
 	/* Set initial contrast */
-- 
2.39.2

