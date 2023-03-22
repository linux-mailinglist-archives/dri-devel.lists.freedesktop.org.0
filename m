Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046806C51AA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 18:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D930C10E107;
	Wed, 22 Mar 2023 17:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BC210E3E9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 17:02:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf1r3-0000SK-AG; Wed, 22 Mar 2023 18:02:29 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf1r2-005xkJ-CJ; Wed, 22 Mar 2023 18:02:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf1r1-0075pe-3E; Wed, 22 Mar 2023 18:02:27 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 06/12] drm/tegra: gr2d: Convert to platform remove callback
 returning void
Date: Wed, 22 Mar 2023 18:02:17 +0100
Message-Id: <20230322170223.410376-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
References: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=CQz9b2NSiX+2jjTGrZPGc/kuxWTPqT+RcMSyckr+Kdk=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkGzSV22gnMh8s2IqFKtdqDpF3h5ilRYcKCI5Em
 1yPuKih8XyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBs0lQAKCRCPgPtYfRL+
 TkvJB/4hbrIOlZSlZHJjP6OY+3mxwOZL1cgvs2/4LMiU3/0yCevg7ojoCCjVcfmzvwTCBW6kpTm
 0YQN/TeKKFXwJ2sCHwrl2Teg2DSu54cezi35gD4TB3HQb2fQm3Ytuz+QI1u6Q+GyR64AjEX2veH
 nOheS0j6PKMR3AH2Pfn/in3kPcckkQ+lEiHXlvmTvQTxiqK//F9lJCqNBQ3crVtMcCK5J1aItqf
 yp6IUIkGkg89t6hYChp+8/eO1r27DzBjVbXj/zrP+DzWcxQufpBigP47RpcWyY0961ih0+IP3wy
 81i0g1oiFfnDOP2B1qTNHvQNqSZMuYWLBfTlxAptZOUrMnHj
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
Cc: linux-tegra@vger.kernel.org, kernel@pengutronix.de,
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
 drivers/gpu/drm/tegra/gr2d.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 49b8d4953e7f..50f77fddda54 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -295,13 +295,11 @@ static int gr2d_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int gr2d_remove(struct platform_device *pdev)
+static void gr2d_remove(struct platform_device *pdev)
 {
 	struct gr2d *gr2d = platform_get_drvdata(pdev);
 
 	host1x_client_unregister(&gr2d->client.base);
-
-	return 0;
 }
 
 static int __maybe_unused gr2d_runtime_suspend(struct device *dev)
@@ -397,5 +395,5 @@ struct platform_driver tegra_gr2d_driver = {
 		.pm = &tegra_gr2d_pm,
 	},
 	.probe = gr2d_probe,
-	.remove = gr2d_remove,
+	.remove_new = gr2d_remove,
 };
-- 
2.39.2

