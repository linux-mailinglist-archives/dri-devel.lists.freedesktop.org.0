Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD1D6F99C3
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BEC10E22E;
	Sun,  7 May 2023 16:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB4F10E20C
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:35 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDP-0001dS-OP; Sun, 07 May 2023 18:26:27 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDO-001nBK-Fj; Sun, 07 May 2023 18:26:26 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDN-002Afl-9f; Sun, 07 May 2023 18:26:25 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liviu Dudau <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 02/53] drm/arm/hdlcd: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:25:25 +0200
Message-Id: <20230507162616.1368908-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1601;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=BcsotUJe59zgY1E1RjIlTVRNFL1xf6WmjfvCx9YuOZY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9DlKKI2ju61B/WGXezwgza5MpQSmaOyiRTph
 Knzu/qGWtqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfQ5QAKCRCPgPtYfRL+
 TsfsCACtqIMylofjDdijFLbCH+p3hxJiSxWXNypyrIX8l5jmIXpwmG9ksYfa+wAgZTLsrG+wZ9e
 1c825yV3ocTEF5BKXmUybgeZ0Xs1+Dgnz5dvIrbd+nnhUIuIJj/BNjcUIjQut+eCztGZ8UAyAY9
 Pymdc26eDe6hJlyxgem383C9NSuzOk4itvLgVg4KZQvrjFCw6mGyIplpaC7oQVNsI0IF0xTPQx4
 hszAta/g8vAfg/vhI/UMdxw4byFe0PaSYNtKK7vzwVfGIQhtQLPNHWFJJd49urSfOWls3U3iyiu
 MJ28oC1/wLhraUF6oQ3fjAdqhmoOogpmoMSrkIeQEdj6sNeF
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
 drivers/gpu/drm/arm/hdlcd_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index e3507dd6f82a..5e265c81a1b3 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -369,10 +369,9 @@ static int hdlcd_probe(struct platform_device *pdev)
 					       match);
 }
 
-static int hdlcd_remove(struct platform_device *pdev)
+static void hdlcd_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &hdlcd_master_ops);
-	return 0;
 }
 
 static const struct of_device_id  hdlcd_of_match[] = {
@@ -401,7 +400,7 @@ static SIMPLE_DEV_PM_OPS(hdlcd_pm_ops, hdlcd_pm_suspend, hdlcd_pm_resume);
 
 static struct platform_driver hdlcd_platform_driver = {
 	.probe		= hdlcd_probe,
-	.remove		= hdlcd_remove,
+	.remove_new	= hdlcd_remove,
 	.driver	= {
 		.name = "hdlcd",
 		.pm = &hdlcd_pm_ops,
-- 
2.39.2

