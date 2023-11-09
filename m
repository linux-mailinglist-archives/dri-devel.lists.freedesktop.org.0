Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CBD7E7419
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 23:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9143810E92A;
	Thu,  9 Nov 2023 22:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B895D10E930
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 22:02:11 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r1D6D-0004Vg-Cq; Thu, 09 Nov 2023 23:02:05 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r1D6C-007sDK-Hi; Thu, 09 Nov 2023 23:02:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r1D6C-00GL6P-8A; Thu, 09 Nov 2023 23:02:04 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/2] fb: amifb: Mark driver struct with __refdata to prevent
 section mismatch warning
Date: Thu,  9 Nov 2023 23:01:53 +0100
Message-ID: <20231109220151.10654-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231109220151.10654-1-u.kleine-koenig@pengutronix.de>
References: <20231109220151.10654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=YPS6jaSNiWJPeq6W9xLDT/J6TMYJHQUwDx+gtwFVW9k=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlTVbQzUU912rRGezAegujxqJYXSmsju2SJENtx
 gFkl6sPgdaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZU1W0AAKCRCPgPtYfRL+
 TolHCACyqoG5MfDzgROIP0Y2JBIpzSn3LSZphCfaJnElTmyvDDVicB3InBbmZ6jviMcGvHaosBH
 SEgkYKHkKG+vk/R/6y3ZW64WtaJolzy67KJDO6+gDtX31iDGYJ9oNoYgxR2tNdy8K0CUDiPvZk9
 W8f4z6IzfXxYG7WDf3iowCPN77NBqa7HOb2MfosGNiqErATT0WWAlDS+C4FbfDg5jLZBOB4/d5V
 WeX8MePy3Rf9AIW7qkcWuLYTQAvc00bF93vrPF46osN6uN+dgJ1WTdJu5e156lZJWrpxEGM7oZV
 D2bICmGmF1jqcbOyvqv25++dbH6/zuRUT0Dzu46DPMjqOr+c
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
Cc: linux-fbdev@vger.kernel.org, kernel@pengutronix.de,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Atul Raut <rauji.raut@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As described in the added code comment, a reference to .exit.text is ok
for drivers registered via module_platform_driver_probe(). Make this
explicit to prevent a section mismatch warning.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/video/fbdev/amifb.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/amifb.c b/drivers/video/fbdev/amifb.c
index b18c6b4f129a..4a1bc693cebd 100644
--- a/drivers/video/fbdev/amifb.c
+++ b/drivers/video/fbdev/amifb.c
@@ -3768,7 +3768,13 @@ static int __exit amifb_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static struct platform_driver amifb_driver = {
+/*
+ * amifb_remove() lives in .exit.text. For drivers registered via
+ * module_platform_driver_probe() this ok because they cannot get unboud at
+ * runtime. The driver needs to be marked with __refdata, otherwise modpost
+ * triggers a section mismatch warning.
+ */
+static struct platform_driver amifb_driver __refdata = {
 	.remove = __exit_p(amifb_remove),
 	.driver   = {
 		.name	= "amiga-video",
-- 
2.42.0

