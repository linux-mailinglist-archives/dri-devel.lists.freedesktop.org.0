Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB636C5194
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 18:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E16B10E98D;
	Wed, 22 Mar 2023 17:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A34710E98D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 17:02:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf1r3-0000Sv-EQ; Wed, 22 Mar 2023 18:02:29 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf1r2-005xkO-KX; Wed, 22 Mar 2023 18:02:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf1r1-0075pq-Mh; Wed, 22 Mar 2023 18:02:27 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 09/12] drm/tegra: hub: Convert to platform remove callback
 returning void
Date: Wed, 22 Mar 2023 18:02:20 +0100
Message-Id: <20230322170223.410376-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
References: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1737;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=3wdphDo4ZxC+Mq2PaezqP4DzAoIloiZ1wlsISjek/f0=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkGzSYb5Q9MPG2FrJJcO6xYquHy9/qFOs1cTtEQ
 +qL7srmw+WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBs0mAAKCRCPgPtYfRL+
 TjhRCACj06gZPJ9jK3i9RgdCBvq3zgFqT8fJmJS3ZBwT4Bu0hffskZpfCjMhtGyvgqv7RyB1vne
 cutJXdPsGfYAdYyIAyRTRcOzfticvQFVAGChnlv2kV8Vxjr54yOBGfEh9eLupoyuOVYAOIrBfSr
 1i8aZSMC+VDrJoWqkd7OQLTPB1bHBEIe93/9AdRxMXSDBtg2Cv4hnHItc7o1EKo7Ik0PNzoPHZr
 F0Bjun8SSOYoSBW/EUqugUvSmEKU3qXwDxVBpCYWjt2Ri7HrPgVTJkganIjy7XB0DLN5lssGxiG
 SJg6lXcihCI3oj/u3k9OkWyKEnRJhoyAa9nYGBCM1lgv0MG/
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
 drivers/gpu/drm/tegra/hub.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 2c91dc444085..916857361a91 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -1174,7 +1174,7 @@ static int tegra_display_hub_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int tegra_display_hub_remove(struct platform_device *pdev)
+static void tegra_display_hub_remove(struct platform_device *pdev)
 {
 	struct tegra_display_hub *hub = platform_get_drvdata(pdev);
 	unsigned int i;
@@ -1188,8 +1188,6 @@ static int tegra_display_hub_remove(struct platform_device *pdev)
 	}
 
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct tegra_display_hub_soc tegra186_display_hub = {
@@ -1221,5 +1219,5 @@ struct platform_driver tegra_display_hub_driver = {
 		.of_match_table = tegra_display_hub_of_match,
 	},
 	.probe = tegra_display_hub_probe,
-	.remove = tegra_display_hub_remove,
+	.remove_new = tegra_display_hub_remove,
 };
-- 
2.39.2

