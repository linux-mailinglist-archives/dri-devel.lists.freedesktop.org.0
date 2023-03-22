Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D41196C51B0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 18:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5D710E9AE;
	Wed, 22 Mar 2023 17:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CD210E98D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 17:02:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf1r3-0000Tc-UV; Wed, 22 Mar 2023 18:02:29 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf1r3-005xkV-4L; Wed, 22 Mar 2023 18:02:29 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf1r2-0075px-4q; Wed, 22 Mar 2023 18:02:28 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 11/12] drm/tegra: sor: Convert to platform remove callback
 returning void
Date: Wed, 22 Mar 2023 18:02:22 +0100
Message-Id: <20230322170223.410376-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
References: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=fGqGHLUiDg9uEoAElkwDcbRQaGigQX3abZ7Lukw8B6c=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkGzSa336iK10c0Y56cTt/UhQtR7J6b1Eq2IPxg
 WztzTcRia+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBs0mgAKCRCPgPtYfRL+
 TutoB/wMMgA4KsCGT2bWf4QyxYPBgydWgc6d8HnPFnq2tYz5bseRAds+7DvdWPgQIWQaxixUphF
 5+nImP517gpdqZQuCaYZZ7AW4FHAHyfTmZ3IWfS1SR5Yp6SIyErcTIFR+Z2Dja0TBv+Xem3FQhW
 de94K9oeT1cibUauyo69rbg0zxvWtmi7a33p/58iWZMJBKmDFoodXwOC4kS0ZuO7h3eh58yFGmY
 I5cyVWmmCthGgEQXLZHySoPmI0Xn1/0LHWSAOCUHHAfVuMA7XwirEg5fKblriGLH6XeuscG9ey4
 kZudG7DZM5zemR4CqF/VmAox6JfhkZEhbvfq3oryXOqa36ls
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
 drivers/gpu/drm/tegra/sor.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index d067b2d01b2e..e617d55f6f3c 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3978,7 +3978,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int tegra_sor_remove(struct platform_device *pdev)
+static void tegra_sor_remove(struct platform_device *pdev)
 {
 	struct tegra_sor *sor = platform_get_drvdata(pdev);
 
@@ -3992,8 +3992,6 @@ static int tegra_sor_remove(struct platform_device *pdev)
 	}
 
 	tegra_output_remove(&sor->output);
-
-	return 0;
 }
 
 static int __maybe_unused tegra_sor_suspend(struct device *dev)
@@ -4053,5 +4051,5 @@ struct platform_driver tegra_sor_driver = {
 		.pm = &tegra_sor_pm_ops,
 	},
 	.probe = tegra_sor_probe,
-	.remove = tegra_sor_remove,
+	.remove_new = tegra_sor_remove,
 };
-- 
2.39.2

