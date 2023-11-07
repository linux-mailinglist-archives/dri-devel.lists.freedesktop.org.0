Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FFF7E3793
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 10:20:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B02610E4E6;
	Tue,  7 Nov 2023 09:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9FE10E4E2
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 09:20:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r0IG4-0000TI-Df; Tue, 07 Nov 2023 10:20:28 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r0IG4-007Fmj-0s; Tue, 07 Nov 2023 10:20:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r0IG3-00ENXM-O8; Tue, 07 Nov 2023 10:20:27 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 19/22] fb: omapfb/opa362: Convert to platform remove callback
 returning void
Date: Tue,  7 Nov 2023 10:18:00 +0100
Message-ID: <20231107091740.3924258-20-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2042;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=y82hh1cU5X7eF1j5G9DB/De2QOkfIzaWhfPbOFdvfxQ=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlSgDKn5eqiqHmhV2l+yU0aadfm9ovQplPUV12B
 +iiPPJfOFaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUoAygAKCRCPgPtYfRL+
 TpB9CACPX/ZR47uYw0+a97b5xLZnqlggbhMZWkNkgDfZVRVk7XzA20Pf/vJJjdixzkHFPE0otOx
 LDuPe/PO7BNWgMZnL5cX/unTSU5CYSyjvDR4WXhxkfvUOy0qtbYz3x9dSHdYY3dBHM7Hziffwv6
 9WAPRp2sYiZdpMyEQ7YNBQFCg2I4JAvkp7sKBech5FIg0+ca2koBfM1RrcUMrmffGdf/w/tg2vn
 DsjW0m3NIEa7hCGhgNhZvcb/qfvc2oP2QrAZk1F+6ylaUQ2rEIPLV1/A7XN0HpC8LXedkp8OqI/
 +Lh6VRs9cvrPqQYjzKC8jIQMxa1/xiORundCPFfvY4ZGrhSi
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
Cc: kernel@pengutronix.de, linux-omap@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c b/drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c
index 866d71489358..f0d3eb581166 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c
@@ -231,7 +231,7 @@ static int opa362_probe(struct platform_device *pdev)
 	return r;
 }
 
-static int opa362_remove(struct platform_device *pdev)
+static void opa362_remove(struct platform_device *pdev)
 {
 	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
 	struct omap_dss_device *dssdev = &ddata->dssdev;
@@ -248,8 +248,6 @@ static int opa362_remove(struct platform_device *pdev)
 		opa362_disconnect(dssdev, dssdev->dst);
 
 	omap_dss_put_device(in);
-
-	return 0;
 }
 
 static const struct of_device_id opa362_of_match[] = {
@@ -260,7 +258,7 @@ MODULE_DEVICE_TABLE(of, opa362_of_match);
 
 static struct platform_driver opa362_driver = {
 	.probe	= opa362_probe,
-	.remove	= opa362_remove,
+	.remove_new = opa362_remove,
 	.driver	= {
 		.name	= "amplifier-opa362",
 		.of_match_table = opa362_of_match,
-- 
2.42.0

