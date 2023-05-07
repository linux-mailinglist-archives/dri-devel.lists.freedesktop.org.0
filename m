Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FE56F99D3
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26F510E267;
	Sun,  7 May 2023 16:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B53810E236
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:43 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDc-0002Jh-FM; Sun, 07 May 2023 18:26:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDb-001nEg-NA; Sun, 07 May 2023 18:26:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDb-002AiV-2v; Sun, 07 May 2023 18:26:39 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 44/53] drm/tegra: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:26:07 +0200
Message-Id: <20230507162616.1368908-45-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=6Tyw8Au9KpeTmv6RYa0mwqi6I44JPDfcpUHMvWx+Rmc=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9EXNwL7pp3dWiytKFnM4XC2oa/JVP0OTwaHl
 urBYj6kcB+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRFwAKCRCPgPtYfRL+
 Tu6VB/0cqMnaIjWL2FW5NonzbDFKrECGuIwQ3qn45j3OKE0whwo0lp1k46AMAfmx7z6OboLwqI8
 mzMh9APc426bSrFJJjIEIi5/WEn4AZTGwR4olk2MzNYgujWL0m+xElanH1f5z6A/wW/i16x90E/
 il/5AGzjeKGC7G4BXG7GvmJdDDGtdNqmcJ3l7vYf5Z0rzvZZcxQwIab9GdVsuq3RgcaOUARKRvH
 bvtDbWVWGhzfG6raSRcv5YE61xiDLkrReAtlX4ViDN+5DFSg/N4lLx4BVNh3iI+HPr2jDPWy70o
 wu3kTtwHiN5f/rB54kd3dnLru9QaI+kZ817JAemu8bWKu0vj
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
 drivers/gpu/drm/tegra/dpaux.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 3c84e73d5051..4d2677dcd831 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -579,7 +579,7 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra_dpaux_remove(struct platform_device *pdev)
+static void tegra_dpaux_remove(struct platform_device *pdev)
 {
 	struct tegra_dpaux *dpaux = platform_get_drvdata(pdev);
 
@@ -594,8 +594,6 @@ static int tegra_dpaux_remove(struct platform_device *pdev)
 	mutex_lock(&dpaux_lock);
 	list_del(&dpaux->list);
 	mutex_unlock(&dpaux_lock);
-
-	return 0;
 }
 
 static int tegra_dpaux_suspend(struct device *dev)
@@ -695,7 +693,7 @@ struct platform_driver tegra_dpaux_driver = {
 		.pm = pm_ptr(&tegra_dpaux_pm_ops),
 	},
 	.probe = tegra_dpaux_probe,
-	.remove = tegra_dpaux_remove,
+	.remove_new = tegra_dpaux_remove,
 };
 
 struct drm_dp_aux *drm_dp_aux_find_by_of_node(struct device_node *np)
-- 
2.39.2

