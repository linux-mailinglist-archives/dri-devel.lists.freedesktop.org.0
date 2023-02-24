Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 731FE6A241B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 23:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D266910E257;
	Fri, 24 Feb 2023 22:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20D610E257
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 22:14:47 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pVgKu-0006ta-8Q; Fri, 24 Feb 2023 23:14:40 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pVgKs-0002Db-5G; Fri, 24 Feb 2023 23:14:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pVgKq-0003DH-RM; Fri, 24 Feb 2023 23:14:36 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/tests: helpers: Drop empty platform remove function
Date: Fri, 24 Feb 2023 23:14:17 +0100
Message-Id: <20230224221417.1712368-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=1H6lw6oCKoWlrYoQpwn/sx3oNqZcomqaU7Uvca9/zT8=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj+Ta1BPXKfYB/eVvHm0CfAx4emo0jIB8i2RQpG
 JJeJIiq9d+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY/k2tQAKCRDB/BR4rcrs
 CUS+B/9lO7bekfQm+0yIsnKC9TgkR7nh46UscI5v/9PRv2lQWvk6YAcvUyMKRzdx5g/wghx9M+A
 Omdj9g2R+lMNTE11o2RpMgrs3GAXfbmiBFlyOs+Fg1zx3qQMRjQHbJp+d6jMmdFnrrtVR97sUUt
 Ico5YEDBn6BJcWIanY8xHYGScb4yqENle5IhqbSFhtlKlX6Z4Nq5ly2hQ9H8bPN/icSZHWkzWOU
 H/YLTHE6XQxY8xMr9i0ZyRNdFydfnnHcP3A3TTpyxhe0fhTGpM4UvBx6xvc2mbuZ+7lB1hyvGfs
 IYJXwgGY8G7CKQQKo3GbAALznKLKi2ej70IfXq8fUOC6aaaB
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
Cc: kernel@pengutronix.de, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A remove callback just returning 0 is equivalent to no remove callback
at all. So drop the useless function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

the remove function was introduced in commit 57a84a97bbda ("drm/tests:
helpers: Make sure the device is bound").

Best regards
Uwe

 drivers/gpu/drm/tests/drm_kunit_helpers.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index e98b4150f556..4df47071dc88 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -19,14 +19,8 @@ static int fake_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int fake_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 static struct platform_driver fake_platform_driver = {
 	.probe	= fake_probe,
-	.remove	= fake_remove,
 	.driver = {
 		.name	= KUNIT_DEVICE_NAME,
 	},
-- 
2.39.1

