Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2BF6F99FD
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC18710E2C4;
	Sun,  7 May 2023 16:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D1D10E263
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:49 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDd-0002Mg-5Q; Sun, 07 May 2023 18:26:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDc-001nEt-BZ; Sun, 07 May 2023 18:26:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDb-002Aia-BC; Sun, 07 May 2023 18:26:39 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <maxime@cerno.tech>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?utf-8?q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH 45/53] drm/tests: helpers: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:26:08 +0200
Message-Id: <20230507162616.1368908-46-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1411;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=/Wl1/d5wmThPaeOs36gLx2V+XCXAjo2ehAY2HF9yWDE=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9EYb0QBN/wqquX3jsjGowxwv+JNlGwVkVCj+
 P1xIHfd8ZaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRGAAKCRCPgPtYfRL+
 TuXeCACzZ27KjfHbWEtcx383YThpSo1MYVf9ddv5eiwVrgxYRusuF4Bjx99YoKRk9TwP1IN0+9t
 AP97kdZrUvEqc711/l0uKqTuypHL4KE6i8XBPpMdwg4PoMlYwbpm5ghb+htkRFb5xJ6nDoImh0i
 jxs/gYgApz7wm40J1czgLkY1ijUoKs14z5sslLtofl2hGUxSfjGdAbU2Nh1oeVaMTQyNHEDEKTB
 mkChMrPoH/EepAscZPA/okqL3VScmH/5Hl2AYwOmPro0khmLgQCBAH/Vx4X9Yo2gUnxsqHvCjA8
 LeiWP03/nAGMa8K7cHmBHQNQ5c23mI+WhcBfOW8bZohVreYT
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
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index e98b4150f556..049b98daedbb 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -19,14 +19,13 @@ static int fake_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int fake_remove(struct platform_device *pdev)
+static void fake_remove(struct platform_device *pdev)
 {
-	return 0;
 }
 
 static struct platform_driver fake_platform_driver = {
 	.probe	= fake_probe,
-	.remove	= fake_remove,
+	.remove_new = fake_remove,
 	.driver = {
 		.name	= KUNIT_DEVICE_NAME,
 	},
-- 
2.39.2

