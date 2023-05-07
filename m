Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 964F26F99BF
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7535A10E20C;
	Sun,  7 May 2023 16:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3627810E1D9
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:35 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDP-0001dR-OP; Sun, 07 May 2023 18:26:27 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDO-001nBH-D3; Sun, 07 May 2023 18:26:26 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDN-002Afo-K6; Sun, 07 May 2023 18:26:25 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liviu Dudau <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 03/53] drm/arm/malidp: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:25:26 +0200
Message-Id: <20230507162616.1368908-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1654;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=oIRSKFenS1dYQ6jOO0uI1kxWibMOzGJ6AOJI8U8h3hQ=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhpTwC88UGFtXtaRnl3ExFgXsKdul1hO+Zf/9S3lWG+5VV
 Wf6byvsZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAiBfbs/9RsDGbGCQSeu/DF
 P/GSxo3X159ve3/6zPUtj9zmPu1w52GpEDpvwFdRbP9k30GGzBk7ryYkpPo/5LlepD+5V2HFfqm
 rJ5ozzVx3JCROrqnUS9YwnOy79RfP/Nvni75cWC9WUT/3yQptxQUz07rzvO7vv+fI6ezwOKOUYY
 ZIx0ue6nVXjd5YT2Qpnf9WxGFxdWDekoRe8aqX3gE1tv94PvUnaNVezDkgen9ysW2s3KHLGuV5X
 jPbfu+z+HXqwJm8FfKPL/AvYDKu4ezIEX68tkRw2ybLdyym17wcr4lJPNNU8wkwMMlU9bu4c1OO
 uqPujIvZt9kz044/dNKONV125cjegF5LJ7NAdnFe/ho+AA==
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
Cc: Mali DP Maintainers <malidp@foss.arm.com>, kernel@pengutronix.de,
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
 drivers/gpu/drm/arm/malidp_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 589c1c66a6dc..389ef1c3d9b6 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -936,10 +936,9 @@ static int malidp_platform_probe(struct platform_device *pdev)
 					       match);
 }
 
-static int malidp_platform_remove(struct platform_device *pdev)
+static void malidp_platform_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &malidp_master_ops);
-	return 0;
 }
 
 static int __maybe_unused malidp_pm_suspend(struct device *dev)
@@ -982,7 +981,7 @@ static const struct dev_pm_ops malidp_pm_ops = {
 
 static struct platform_driver malidp_platform_driver = {
 	.probe		= malidp_platform_probe,
-	.remove		= malidp_platform_remove,
+	.remove_new	= malidp_platform_remove,
 	.driver	= {
 		.name = "mali-dp",
 		.pm = &malidp_pm_ops,
-- 
2.39.2

