Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3B86F99C5
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F0110E241;
	Sun,  7 May 2023 16:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F8A10E222
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:37 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDW-0001xC-Ki; Sun, 07 May 2023 18:26:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDV-001nD8-5p; Sun, 07 May 2023 18:26:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDU-002AhG-EI; Sun, 07 May 2023 18:26:32 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Qiang Yu <yuq825@gmail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 25/53] drm/lima: Convert to platform remove callback returning
 void
Date: Sun,  7 May 2023 18:25:48 +0200
Message-Id: <20230507162616.1368908-26-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=OU5nFZW1U8xX89GdpL66XMcT2yhVtZa5NvsVX95pBFo=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9EBTfSJKMY8B8QbF2127le+WXSjvxK3UQFEj
 yfNq3oy7CKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRAQAKCRCPgPtYfRL+
 TiqeB/0Q+vRB9mbunHmpEQ6VVsVIUIJ/+zOj7HHDJeb7jXx0L7s9sieNP9k7S2lc5EE//o4LSbH
 9CdDGPytV8owd/MIhFnlPRcOjsb9MfgymSAq4+Ek1vcD1i5cGyoL+FCSP6E0qgyi9AKIAb8Chzx
 0E3gOrJLHVsuJi7mFJj7bHw+hMLDMvpF3YKqH77pPsL9+MQe4mx+TmI8/UgUhXm1dF0a/wxSE7/
 KMHCe7m1f/054gFRo52RIZaoGN3DkVTF4lKXjHJh+2HZGdcgzUxza72fPu5abxu1ZowjNbqJepb
 c/5rzxx8fdDi2i1ZzrEWUxT1UlEXsC1evGfxJ6N+X9mk08sc
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
Cc: kernel@pengutronix.de, lima@lists.freedesktop.org,
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
 drivers/gpu/drm/lima/lima_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index 7b8d7178d09a..a272eace8f25 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -439,7 +439,7 @@ static int lima_pdev_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int lima_pdev_remove(struct platform_device *pdev)
+static void lima_pdev_remove(struct platform_device *pdev)
 {
 	struct lima_device *ldev = platform_get_drvdata(pdev);
 	struct drm_device *ddev = ldev->ddev;
@@ -457,7 +457,6 @@ static int lima_pdev_remove(struct platform_device *pdev)
 
 	drm_dev_put(ddev);
 	lima_sched_slab_fini();
-	return 0;
 }
 
 static const struct of_device_id dt_match[] = {
@@ -474,7 +473,7 @@ static const struct dev_pm_ops lima_pm_ops = {
 
 static struct platform_driver lima_platform_driver = {
 	.probe      = lima_pdev_probe,
-	.remove     = lima_pdev_remove,
+	.remove_new = lima_pdev_remove,
 	.driver     = {
 		.name   = "lima",
 		.pm	= &lima_pm_ops,
-- 
2.39.2

