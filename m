Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E6376B284
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 13:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E083A10E3C9;
	Tue,  1 Aug 2023 11:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB6110E3BF
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 11:02:47 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9I-0006eu-HN; Tue, 01 Aug 2023 13:02:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9H-000MYt-Ps; Tue, 01 Aug 2023 13:02:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9H-009bbJ-05; Tue, 01 Aug 2023 13:02:43 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 05/12] drm/ingenic: Convert to platform remove callback
 returning void
Date: Tue,  1 Aug 2023 13:02:32 +0200
Message-Id: <20230801110239.831099-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230801110239.831099-1-u.kleine-koenig@pengutronix.de>
References: <20230801110239.831099-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2991;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=QsfehW8ezjUN08uPi6B/PUxytJsI7RQqYsdVg8dQLo8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkyOW5X0wrdRdNmXLWrRUk3FcIxTOnCbRPWyz8K
 3t2wQGkTlaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMjluQAKCRCPgPtYfRL+
 TqMrB/9qujLInsuxJ98a/BJo58kLNEaDiYQ8uC1IjnHrUI71dHFlYQAYmoGi3j+6oNpdplV903h
 u+8hpH5m7vJ7fPmLiPsFUKSakLrx96se/SaouivS+3wSNs1uMrMweMlvaHa3b1ewl42fZBcTH4i
 3gD1KoX81UoGcDE2ssxgZ5oVAn9E2VYFPMw7DQGTHhxQEc6trF1T7wNmf1tDZU7bCTtOLnCrSaT
 loL7GbRlpR00WH65RrzmFaeZtH+QvA066JzKoUotLVM6qBKRDicqxs5m1RCGX2+RFNYvlUndm7p
 cO6PFGEWqTofrDKPk5bIrjIoTpmeoaKkzlDRHV4PK0PiHwNc
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
Cc: kernel@pengutronix.de, Thomas Zimmermann <tzimmermann@suse.de>,
 Jyri Sarha <jyri.sarha@iki.fi>, linux-mips@vger.kernel.org,
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

Trivially convert the ingenic drm drivers from always returning zero in
the remove callback to the void returning variant.

Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 6 ++----
 drivers/gpu/drm/ingenic/ingenic-ipu.c     | 5 ++---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 8dbd4847d3a6..c2547d48d6aa 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1449,7 +1449,7 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 	return component_master_add_with_match(dev, &ingenic_master_ops, match);
 }
 
-static int ingenic_drm_remove(struct platform_device *pdev)
+static void ingenic_drm_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 
@@ -1457,8 +1457,6 @@ static int ingenic_drm_remove(struct platform_device *pdev)
 		ingenic_drm_unbind(dev);
 	else
 		component_master_del(dev, &ingenic_master_ops);
-
-	return 0;
 }
 
 static int ingenic_drm_suspend(struct device *dev)
@@ -1611,7 +1609,7 @@ static struct platform_driver ingenic_drm_driver = {
 		.of_match_table = of_match_ptr(ingenic_drm_of_match),
 	},
 	.probe = ingenic_drm_probe,
-	.remove = ingenic_drm_remove,
+	.remove_new = ingenic_drm_remove,
 };
 
 static int ingenic_drm_init(void)
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 6d236547f611..5bd9072352b5 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -922,10 +922,9 @@ static int ingenic_ipu_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &ingenic_ipu_ops);
 }
 
-static int ingenic_ipu_remove(struct platform_device *pdev)
+static void ingenic_ipu_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &ingenic_ipu_ops);
-	return 0;
 }
 
 static const u32 jz4725b_ipu_formats[] = {
@@ -992,7 +991,7 @@ static struct platform_driver ingenic_ipu_driver = {
 		.of_match_table = ingenic_ipu_of_match,
 	},
 	.probe = ingenic_ipu_probe,
-	.remove = ingenic_ipu_remove,
+	.remove_new = ingenic_ipu_remove,
 };
 
 struct platform_driver *ingenic_ipu_driver_ptr = &ingenic_ipu_driver;
-- 
2.39.2

