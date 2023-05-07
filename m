Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3808A6F99B8
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B470B10E1D9;
	Sun,  7 May 2023 16:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC30510E1FF
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:35 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDP-0001dP-OP; Sun, 07 May 2023 18:26:27 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDN-001nB8-Rm; Sun, 07 May 2023 18:26:25 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDN-002Afi-3T; Sun, 07 May 2023 18:26:25 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: James@pengutronix.de, Liviu Dudau <liviu.dudau@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Brian Starkey <brian.starkey@arm.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 01/53] drm/komeda: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:25:24 +0200
Message-Id: <20230507162616.1368908-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1783;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=OvkbG5m0IUNUsqlbgvhk5MDb0LehSI8/F3qShARO9pQ=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9DkuPeFi45tO4c9lfTHj1terzstr+EWsXbA7
 x/LEJC9MpWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfQ5AAKCRCPgPtYfRL+
 Ti6JB/0eBHs1fAarJAUzCnae5/QXAWF0uVEI/Sp77SU/lBsUahaOZeBrEf/bF7HJvyVwldP+BbW
 EjwFhNhwWSCZ6Godz/uQuXmEES8ha9zwpeLJQMWzwVe8HGGsuOt90l/2WJC611qwB+2cuZcODVI
 bVRE9sUT7uoqMz46MxLO25gy/3XY1KZyJqAmMS91/SpF7O6OHkDfuc5VIWeMbxcvARvjeAgi0vH
 ebKSqHyu29e8dbK2wqUXSqkkGA2rsn+NKtQ5A7UmHK4bWrFbF+xf5kNAhx8EtUdAUVNFwTGz4ij
 2uR5NOBK8OQGo63bSyhvd1jlHugMdrzYzmOPUUIyqNqe4962
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
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index 28f76e07dd95..c597c362f689 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
@@ -131,10 +131,9 @@ static int komeda_platform_probe(struct platform_device *pdev)
 	return component_master_add_with_match(dev, &komeda_master_ops, match);
 }
 
-static int komeda_platform_remove(struct platform_device *pdev)
+static void komeda_platform_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &komeda_master_ops);
-	return 0;
 }
 
 static const struct of_device_id komeda_of_match[] = {
@@ -189,7 +188,7 @@ static const struct dev_pm_ops komeda_pm_ops = {
 
 static struct platform_driver komeda_platform_driver = {
 	.probe	= komeda_platform_probe,
-	.remove	= komeda_platform_remove,
+	.remove_new = komeda_platform_remove,
 	.driver	= {
 		.name = "komeda",
 		.of_match_table	= komeda_of_match,
-- 
2.39.2

