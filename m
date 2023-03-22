Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AFB6C5190
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 18:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12FD10E9A3;
	Wed, 22 Mar 2023 17:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859E510E3E9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 17:02:30 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf1r1-0000PU-Rp; Wed, 22 Mar 2023 18:02:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf1r1-005xjx-4z; Wed, 22 Mar 2023 18:02:27 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf1r0-0075pT-Do; Wed, 22 Mar 2023 18:02:26 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 03/12] drm/tegra: dc: Convert to platform remove callback
 returning void
Date: Wed, 22 Mar 2023 18:02:14 +0100
Message-Id: <20230322170223.410376-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
References: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=8CVItIwYzK3rZXS6aH5yKeL14hWmec5ZIR7iH6JSpuE=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkGzSRgRx7UW6hEDVhHgcaH8qbMVTrkfZhaYsv+
 NzFaTOuQG2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBs0kQAKCRCPgPtYfRL+
 ThmsCACzElK1kL3IKjcabYXCE+AFMFWhTfA3Jh3Lf3REWp/8nIKq23DZ5S3g9dF6I2wy2ByuQSs
 ss3qNUyp90/hU/5M7B6A78x3i4olxQKlMZWAQwE9YXI6TDQPGFysL4EmPi/UjbX7v3C8AXtqFib
 CU0NND3yAHNMZO5wKFzd4MMSTf+BMnKuQsx+u1/0W8JUt1V/El5KaifdLhL9OxZdSOiDuqjoGcd
 HxaKLYB84ypwUSGqOaSciTo85kh6m+a7ipAFGLfOcgoyPo+btvqA5/BxE7EwQexV4phhnjIwUzl
 ik0sOCg3MeLWAdfdpfnyCoUg0DMyhaVIXJ9aZoSIL8qOC7em
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
 drivers/gpu/drm/tegra/dc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 6bf1b2bc43b1..53630b673029 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -3263,7 +3263,7 @@ static int tegra_dc_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int tegra_dc_remove(struct platform_device *pdev)
+static void tegra_dc_remove(struct platform_device *pdev)
 {
 	struct tegra_dc *dc = platform_get_drvdata(pdev);
 
@@ -3272,8 +3272,6 @@ static int tegra_dc_remove(struct platform_device *pdev)
 	tegra_dc_rgb_remove(dc);
 
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 struct platform_driver tegra_dc_driver = {
@@ -3282,5 +3280,5 @@ struct platform_driver tegra_dc_driver = {
 		.of_match_table = tegra_dc_of_match,
 	},
 	.probe = tegra_dc_probe,
-	.remove = tegra_dc_remove,
+	.remove_new = tegra_dc_remove,
 };
-- 
2.39.2

