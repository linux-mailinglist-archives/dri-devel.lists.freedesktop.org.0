Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA7C50E96E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 21:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA91210E26B;
	Mon, 25 Apr 2022 19:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFAD8928F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 19:23:20 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nj4Il-0003v6-VV; Mon, 25 Apr 2022 21:23:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nj4Im-005Cmn-4b; Mon, 25 Apr 2022 21:23:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nj4Ik-005aUh-3F; Mon, 25 Apr 2022 21:23:14 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH] drm/ssd130x: Make ssd130x_remove() return void
Date: Mon, 25 Apr 2022 21:23:06 +0200
Message-Id: <20220425192306.59800-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2241; h=from:subject;
 bh=elsgzsCQSieRPNO1I+wFjsOM8p8SdLrk0Z5FhxWlA64=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiZvUWlQeLp3N6v5OSwAMx0lLCbkJoBcQieACxF/f0
 EKErcg+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYmb1FgAKCRDB/BR4rcrsCQy2B/
 9QvCcUILfOGFjereK7KVRlD6gkgNRAyXKfmhRoKYOW4adqeT0f9SS5Gg0RsxOajsh7riDM9c/xO6Zk
 r5JNwR2/5iGTHkVMvs2N0bpRx4yFwuu6/PzGzUpqhxR+Ty/2qVo/J3WD3CroVzYSgsHPUvMxEUvUjG
 7OpwtA9fD1iM4YaKKuNrf4Knj8NVWWDps2Q2mCdk6N7A/9sCs2n1oSr8aByCSPJ4qnRge716G7Em66
 F4Elc4TG5zTjWAyk+kvYVdL3mHDIdEvoO9YmSz0iUoGGtcgz2JNa4tYM/fQSFCCoWqz5loIZ8nepsx
 TT8FAJKYZEeonpddiXm9vgrEICzsTA
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
Cc: David Airlie <airlied@linux.ie>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function returns zero unconditionally, so there isn't any benefit
of returning a value. Make it return void to be able to see at a glance
that the return value of ssd130x_i2c_remove() is always zero.

This patch is a preparation for making i2c remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/solomon/ssd130x-i2c.c | 4 +++-
 drivers/gpu/drm/solomon/ssd130x.c     | 4 +---
 drivers/gpu/drm/solomon/ssd130x.h     | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solomon/ssd130x-i2c.c
index 3126aeda4ced..54c8e2e4d9dd 100644
--- a/drivers/gpu/drm/solomon/ssd130x-i2c.c
+++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c
@@ -43,7 +43,9 @@ static int ssd130x_i2c_remove(struct i2c_client *client)
 {
 	struct ssd130x_device *ssd130x = i2c_get_clientdata(client);
 
-	return ssd130x_remove(ssd130x);
+	ssd130x_remove(ssd130x);
+
+	return 0;
 }
 
 static void ssd130x_i2c_shutdown(struct i2c_client *client)
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index ce4dc20412e0..e6feb2a166a6 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -824,11 +824,9 @@ struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
 }
 EXPORT_SYMBOL_GPL(ssd130x_probe);
 
-int ssd130x_remove(struct ssd130x_device *ssd130x)
+void ssd130x_remove(struct ssd130x_device *ssd130x)
 {
 	drm_dev_unplug(&ssd130x->drm);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(ssd130x_remove);
 
diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
index cd21cdccb566..f633bac84477 100644
--- a/drivers/gpu/drm/solomon/ssd130x.h
+++ b/drivers/gpu/drm/solomon/ssd130x.h
@@ -70,7 +70,7 @@ struct ssd130x_device {
 };
 
 struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap);
-int ssd130x_remove(struct ssd130x_device *ssd130x);
+void ssd130x_remove(struct ssd130x_device *ssd130x);
 void ssd130x_shutdown(struct ssd130x_device *ssd130x);
 
 #endif /* __SSD1307X_H__ */

base-commit: 3123109284176b1532874591f7c81f3837bbdc17
-- 
2.35.1

