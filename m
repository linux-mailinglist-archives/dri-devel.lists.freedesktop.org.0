Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 771B46BFDB5
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:55:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033C810E4C2;
	Sat, 18 Mar 2023 23:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204EA10E044
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:54:49 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNo-000479-IL; Sun, 19 Mar 2023 00:54:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNn-0056aY-N4; Sun, 19 Mar 2023 00:54:43 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNn-005zUa-3i; Sun, 19 Mar 2023 00:54:43 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Timur Tabi <timur@kernel.org>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH 16/51] video: fbdev: fsl-diu-fb: Convert to platform remove
 callback returning void
Date: Sun, 19 Mar 2023 00:53:53 +0100
Message-Id: <20230318235428.272091-17-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1676;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=742apMRN2MchqOy75ObOcpQnK0dgK75vXsYEGC2Sx3U=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk64Z8ILvngUgN+3rXhk7DrPgLxeqvPFso6Vw
 Bzr8PmQY3aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZOuAAKCRCPgPtYfRL+
 TkM2CACiKrVZ6wjuuOVAOX62zj0S4xfZhwsalQGxmKEFVztqUzSwTNgTPrGVs1CeJhuN1Cv0YSF
 OciZ4M6aoEDn6CH/Pe7vctbZqzTmO/Vbyqg6R6TK6nbugsren/5rIBrTDGPkxeGeKVMiOP71/JD
 Jh0X8/tLS+Mc0NDfx7QfrXCmPE2BikAJ2XBMcHQJGMhHXJUAkgH+Ld8NQNqOS/cO1fc48AHIBOp
 hox652c8FFkuPtZuQw7SSlRl3sYFpuCBGI2DQvS+w/5k5vngCiT6OjUDgyn6z00U9+rTi549xRc
 n8fdwgJDzWBqf7FKEAniAQw/4yqXivVSvvksyhqq9scbD419
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
Cc: linux-fbdev@vger.kernel.org, kernel@pengutronix.de,
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
 drivers/video/fbdev/fsl-diu-fb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/fsl-diu-fb.c b/drivers/video/fbdev/fsl-diu-fb.c
index e332017c6af6..730a07d23fa9 100644
--- a/drivers/video/fbdev/fsl-diu-fb.c
+++ b/drivers/video/fbdev/fsl-diu-fb.c
@@ -1823,7 +1823,7 @@ static int fsl_diu_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int fsl_diu_remove(struct platform_device *pdev)
+static void fsl_diu_remove(struct platform_device *pdev)
 {
 	struct fsl_diu_data *data;
 	int i;
@@ -1837,8 +1837,6 @@ static int fsl_diu_remove(struct platform_device *pdev)
 		uninstall_fb(&data->fsl_diu_info[i]);
 
 	iounmap(data->diu_reg);
-
-	return 0;
 }
 
 #ifndef MODULE
@@ -1885,7 +1883,7 @@ static struct platform_driver fsl_diu_driver = {
 		.of_match_table = fsl_diu_match,
 	},
 	.probe  	= fsl_diu_probe,
-	.remove 	= fsl_diu_remove,
+	.remove_new 	= fsl_diu_remove,
 	.suspend	= fsl_diu_suspend,
 	.resume		= fsl_diu_resume,
 };
-- 
2.39.2

