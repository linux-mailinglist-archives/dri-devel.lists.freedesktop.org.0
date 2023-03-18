Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 233336BFC4A
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 20:09:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DD510E49D;
	Sat, 18 Mar 2023 19:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE2310E0CC
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 19:08:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbue-0001nu-K9; Sat, 18 Mar 2023 20:08:20 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbud-0054Ds-6o; Sat, 18 Mar 2023 20:08:19 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbub-005wZ0-Vn; Sat, 18 Mar 2023 20:08:17 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 05/19] drm/bridge: fsl-ldb: Convert to platform remove
 callback returning void
Date: Sat, 18 Mar 2023 20:07:50 +0100
Message-Id: <20230318190804.234610-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
References: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=WmJGj5zZgjZTb/hhWzS7CvlrE+edWWq2LiMSrtRIhAI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFgv/dX6600O1qKeJwmA1NMRWVg/sCsVDmT8FM
 krZAeUrb8aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBYL/wAKCRCPgPtYfRL+
 Th6GB/wI+TYOZWWEJpYRcVrCtcf3UZ0ScZnkFxgeZ5MW0jwcYApV17ihDUC7Vplkyteojrk5HpE
 1dn2UDp5fLlK2Lzf92ct7XGAtdBSWuqK5aCuUdcAu7J4cLwHJ2HjrIxWrcTB8ud4573HoSB7x2v
 tEL6nKtvsG+xhT102y79GnR5ZhgajT34SfXj23oOHHiYb0RmOg/fT7M19U4u1Rk5xGGyNy5wNup
 qgWf/44KVdLJpvPNTh2+2UILouEG6ZoKC7xYTa+Su6aFNzemNPfyVBKNUyimgxIT8rAA2VOfD90
 ZWT5bRJJ3wjkaoUXvfc1u+LI/LYhxDa3UfWV0nr/E+x+i8Nr
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
 drivers/gpu/drm/bridge/fsl-ldb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 6bac160b395b..450b352914f4 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -347,13 +347,11 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int fsl_ldb_remove(struct platform_device *pdev)
+static void fsl_ldb_remove(struct platform_device *pdev)
 {
 	struct fsl_ldb *fsl_ldb = platform_get_drvdata(pdev);
 
 	drm_bridge_remove(&fsl_ldb->bridge);
-
-	return 0;
 }
 
 static const struct of_device_id fsl_ldb_match[] = {
@@ -367,7 +365,7 @@ MODULE_DEVICE_TABLE(of, fsl_ldb_match);
 
 static struct platform_driver fsl_ldb_driver = {
 	.probe	= fsl_ldb_probe,
-	.remove	= fsl_ldb_remove,
+	.remove_new = fsl_ldb_remove,
 	.driver		= {
 		.name		= "fsl-ldb",
 		.of_match_table	= fsl_ldb_match,
-- 
2.39.2

