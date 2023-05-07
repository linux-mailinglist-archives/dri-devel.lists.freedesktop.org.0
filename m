Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E68936F99ED
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6414C10E29D;
	Sun,  7 May 2023 16:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC4910E222
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:44 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDd-0002Nj-Pe; Sun, 07 May 2023 18:26:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDd-001nF8-1H; Sun, 07 May 2023 18:26:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDc-002Aip-DD; Sun, 07 May 2023 18:26:40 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 49/53] drm/tiny: Convert to platform remove callback returning
 void
Date: Sun,  7 May 2023 18:26:12 +0200
Message-Id: <20230507162616.1368908-50-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2584;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=dYYyyo4+LY/VFUeJLkEEbZWS3DQydlOZFHCyvkhaKYA=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9EddWGFQBeefgXyua+MHnBKutu6XfSOK8+3g
 sT2WAENx4mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRHQAKCRCPgPtYfRL+
 ThsnB/4ycJgfp8m++ktlHzN5yXTLJPI3wCW7OeujkfNaVq+de7BFsMqPvLanj1vBuQq5AEYzyRs
 J1bN3b0TmZiXpy2tqMJleLIbAVA+Ukd4YnqlIs1HzY4f/aVxbtQzAOpf9VTAKm2PhqyJ6G2d6jS
 ZEg2YwpU3nZkmvy8RRaj4dMs8rPM5niGdwccEq3yTVim9qkZfJEVRAJyXtD20vMZf/2zg220ja0
 6t2zZC004S2x5yqRH9A4m6GX/gOFyDfm85Xi+lOGfOaPPjjN9nn/uJwRpFH7rvoC11QP+m7kcSu
 vH2T6C5DVcrfaxjjv6sSiEKSCQRNUQX+fMVpoWAJPmBONaGD
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

Trivially convert the tiny drm drivers from always returning zero in the
remove callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/tiny/ofdrm.c     | 6 ++----
 drivers/gpu/drm/tiny/simpledrm.c | 6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 6e349ca42485..e110f2e2c2a5 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -1373,13 +1373,11 @@ static int ofdrm_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int ofdrm_remove(struct platform_device *pdev)
+static void ofdrm_remove(struct platform_device *pdev)
 {
 	struct drm_device *dev = platform_get_drvdata(pdev);
 
 	drm_dev_unplug(dev);
-
-	return 0;
 }
 
 static const struct of_device_id ofdrm_of_match_display[] = {
@@ -1394,7 +1392,7 @@ static struct platform_driver ofdrm_platform_driver = {
 		.of_match_table = ofdrm_of_match_display,
 	},
 	.probe = ofdrm_probe,
-	.remove = ofdrm_remove,
+	.remove_new = ofdrm_remove,
 };
 
 module_platform_driver(ofdrm_platform_driver);
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 63881a3754f8..369c236a2fad 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -875,14 +875,12 @@ static int simpledrm_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int simpledrm_remove(struct platform_device *pdev)
+static void simpledrm_remove(struct platform_device *pdev)
 {
 	struct simpledrm_device *sdev = platform_get_drvdata(pdev);
 	struct drm_device *dev = &sdev->dev;
 
 	drm_dev_unplug(dev);
-
-	return 0;
 }
 
 static const struct of_device_id simpledrm_of_match_table[] = {
@@ -897,7 +895,7 @@ static struct platform_driver simpledrm_platform_driver = {
 		.of_match_table = simpledrm_of_match_table,
 	},
 	.probe = simpledrm_probe,
-	.remove = simpledrm_remove,
+	.remove_new = simpledrm_remove,
 };
 
 module_platform_driver(simpledrm_platform_driver);
-- 
2.39.2

