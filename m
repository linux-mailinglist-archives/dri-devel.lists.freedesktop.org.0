Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E157DF80E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 17:57:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA81310E938;
	Thu,  2 Nov 2023 16:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F0A10E936
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 16:57:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0H-00035N-4E; Thu, 02 Nov 2023 17:57:09 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0G-0067F9-NW; Thu, 02 Nov 2023 17:57:08 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0G-00BjcD-EI; Thu, 02 Nov 2023 17:57:08 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 07/16] drm/etnaviv: Convert to platform remove callback
 returning void
Date: Thu,  2 Nov 2023 17:56:48 +0100
Message-ID: <20231102165640.3307820-25-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2645;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=3tqOuCN10aotk1/hnbXt75ssiA2x+A4qrReQcjgKk9w=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhlTnKxdv7r+3JMxEX7Ct+JAPjxyj9/uIrbW6q9ZY+2275
 3nijEF7J6MxCwMjF4OsmCKLfeOaTKsqucjOtf8uwwxiZQKZwsDFKQATqZ7M/k/dMyDBeMUs0Ttr
 hAXfLGHJuXZDv/L+KsMQbevKrN471Ufvu2p+PnT6EL/RbJkbS+tu3ef8LvTq6ur2/xzXC2Nexr2
 y/1Rz4dDySMWt97v1bt7uPK/hIsJ7zrKCL0ujXjakSreEwzDJOd4r9H6xeMTWN+oSfjkKX88YTz
 94s8Q43eZHQb5DnZbF88u1L+PiJshsYDj/+099u8Xc/t+xmokHUj6ZHVD/mLL8apS5XlhnF6ewo
 ZpcRhTPQclj8wzWaj3eyzSLwzTbZvLfC8dOrzkk+Cwv6bFjDc8b3ZqpEtJakhwLDQVFVNueH6qS
 dBNKTi2R2eHgo7JX1e/ssuO6m78KbPf5tDUm5vNtrdrlAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
 dri-devel@lists.freedesktop.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>, kernel@pengutronix.de,
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
index a8d3fa81e4ec..6228ce603248 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -640,16 +640,14 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
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
index 9276756e1397..ef6738706475 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1904,11 +1904,10 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
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
@@ -1970,6 +1969,6 @@ struct platform_driver etnaviv_gpu_driver = {
 		.of_match_table = etnaviv_gpu_match,
 	},
 	.probe = etnaviv_gpu_platform_probe,
-	.remove = etnaviv_gpu_platform_remove,
+	.remove_new = etnaviv_gpu_platform_remove,
 	.id_table = gpu_ids,
 };
-- 
2.42.0

