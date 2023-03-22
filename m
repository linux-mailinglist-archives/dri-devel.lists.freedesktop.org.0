Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 710EC6C51A3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 18:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C31110E9A8;
	Wed, 22 Mar 2023 17:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D238910E9A7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 17:02:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf1r4-0000Tt-1t; Wed, 22 Mar 2023 18:02:30 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf1r3-005xkc-8Y; Wed, 22 Mar 2023 18:02:29 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf1r1-0075pn-GD; Wed, 22 Mar 2023 18:02:27 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 08/12] drm/tegra: hdmi: Convert to platform remove callback
 returning void
Date: Wed, 22 Mar 2023 18:02:19 +0100
Message-Id: <20230322170223.410376-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
References: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1596;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=qZn3RkAYMqPppqU8msqmAMRxBly/iTMmu8tjV/SB/1Q=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkGzSXGlwTPAJ+GWqYapGk8eX5ZDY+OpWdDyqzf
 9NyS6j6c8GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBs0lwAKCRCPgPtYfRL+
 TuhoCACrVUxACiVjogTOJY3Ry6Yl2nIR7RTxqXww2SMCpqS8O5UNZg9eeDcKJRgV/Sdv7MiIRs8
 k3Q3pfWSazuCwtAM+KQwHudPjK1s//hw7fxMvqzkmXQUr/lYJrJ4cAum45WTReExzZ0HTR7hMIc
 MlTgBjLsDnAqe01YLvSs/apxNa5kjvWvqy6nHpo7X8YGhUgq7ZTrfmjTOwE0lhEjFGy5lOUTe5f
 bkkO6K6wwuVd2Ah2IV0MngaWcBpfHWT8W+OIgW4i48pGGT2k455kmcnIrnIfUsFO83PWVISmNZH
 GdBhYv1JifLiY0qwL7r0b/Wf0PwNPQHSnMIVVt7+5oTyo2Pj
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
 drivers/gpu/drm/tegra/hdmi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 6798eea317df..6eac54ae1205 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1874,15 +1874,13 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra_hdmi_remove(struct platform_device *pdev)
+static void tegra_hdmi_remove(struct platform_device *pdev)
 {
 	struct tegra_hdmi *hdmi = platform_get_drvdata(pdev);
 
 	host1x_client_unregister(&hdmi->client);
 
 	tegra_output_remove(&hdmi->output);
-
-	return 0;
 }
 
 struct platform_driver tegra_hdmi_driver = {
@@ -1891,5 +1889,5 @@ struct platform_driver tegra_hdmi_driver = {
 		.of_match_table = tegra_hdmi_of_match,
 	},
 	.probe = tegra_hdmi_probe,
-	.remove = tegra_hdmi_remove,
+	.remove_new = tegra_hdmi_remove,
 };
-- 
2.39.2

