Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B4376B28D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 13:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896A710E3D3;
	Tue,  1 Aug 2023 11:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7721010E3B8
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 11:02:49 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9I-0006es-HM; Tue, 01 Aug 2023 13:02:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9H-000MYk-6n; Tue, 01 Aug 2023 13:02:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9G-009bb8-CY; Tue, 01 Aug 2023 13:02:42 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 02/12] drm/etnaviv: Convert to platform remove callback
 returning void
Date: Tue,  1 Aug 2023 13:02:29 +0200
Message-Id: <20230801110239.831099-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230801110239.831099-1-u.kleine-koenig@pengutronix.de>
References: <20230801110239.831099-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2645;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=yjEDXr+Sc74PPur7Ff34fL8m9rPU07C2STabqkRcfus=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkyOW2cX9D00klhT7ewgJ06N2/K651B+Wo38T+b
 UzfvMAILiuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMjltgAKCRCPgPtYfRL+
 Tss/B/9K9+V7aw5GBnFnWX2bjgW7KxUaexkfDxWHiCn8JUpMORT6od1EmcfNCUT3Hw3847t5Tjs
 +BCGenr0Fpvcd/f+ahULgea2ErzWQkLzgwbs29Mq4h19T4/4lN4YsRY907TvhZw9aGLXPl4Eixr
 H4C7NoqzGBJxhDb7TfGgNHaJ8MX4IHGjJjRAjGbVje7FHPIjuhFcZZVZF17NF+Dy1JgrWNlgXSr
 h894QeOFPcT/Lm/+u/oxJUyFyxDn1Ii279Wa9RvpKlX4x7N01mL+YtV//iUcgUPjQXPr+9s03/Y
 Spst5Brqa7s6hm3GP9Um+XeeDp0AIeMAnfYq/9cusWaFfscR
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>, Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert the etnaviv drm driver from always returning zero in
the remove callback to the void returning variant.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 6 ++----
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 5 ++---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index ea55f6b7b744..20305df01b57 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -638,16 +638,14 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 	return component_master_add_with_match(dev, &etnaviv_master_ops, match);
 }
 
-static int etnaviv_pdev_remove(struct platform_device *pdev)
+static void etnaviv_pdev_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &etnaviv_master_ops);
-
-	return 0;
 }
 
 static struct platform_driver etnaviv_platform_driver = {
 	.probe      = etnaviv_pdev_probe,
-	.remove     = etnaviv_pdev_remove,
+	.remove_new = etnaviv_pdev_remove,
 	.driver     = {
 		.name   = "etnaviv",
 	},
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index bbc9c54871f4..43426ffe4d77 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1892,11 +1892,10 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int etnaviv_gpu_platform_remove(struct platform_device *pdev)
+static void etnaviv_gpu_platform_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &gpu_ops);
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
 
 static int etnaviv_gpu_rpm_suspend(struct device *dev)
@@ -1954,6 +1953,6 @@ struct platform_driver etnaviv_gpu_driver = {
 		.of_match_table = etnaviv_gpu_match,
 	},
 	.probe = etnaviv_gpu_platform_probe,
-	.remove = etnaviv_gpu_platform_remove,
+	.remove_new = etnaviv_gpu_platform_remove,
 	.id_table = gpu_ids,
 };
-- 
2.39.2

