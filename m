Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133C084D163
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 19:43:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9715410E5E8;
	Wed,  7 Feb 2024 18:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D2A10E5E6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 18:43:25 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rXmtC-0007se-3M; Wed, 07 Feb 2024 19:43:18 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rXmtB-0054YL-A0; Wed, 07 Feb 2024 19:43:17 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rXmtB-00HRtR-0h;
 Wed, 07 Feb 2024 19:43:17 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: kernel@pengutronix.de, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v3 24/32] staging: fbtft: Follow renaming of SPI "master" to
 "controller"
Date: Wed,  7 Feb 2024 19:40:38 +0100
Message-ID: <df79f22caf31d2c5ca2b15b33670323d1e1120c7.1707324794.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=jLSDSfpv7WSEI2jePythvXMi4bwtOGfFN61uJJKBvR4=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlw87GXqnqC9di7ObQ9f5f86SeO9J8OHbB6IyeF
 M0/bFpSbpmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcPOxgAKCRCPgPtYfRL+
 TuGBB/9TlS6oRq9gEfvRb9gRhMiLfLJhtlORbYI0ifh40f/j0hyzeyZynD3Fq61MCA25AK4L1oL
 bUEmiFI9dkmdpl/wxEeoFDRn3uUORsjdca5iTgkJ61wtS+nHjVGel9Itd+lMwVfVKjEOurt1mc2
 QFyyRLeIt5WqYZhtg25+BcZnHayunBMMYQgFCPVv9FsauTTBQwpUJWl3B7rEoPfzPJENssYMRIO
 MwvUqvxZfVtdIDlV5jpwCkzw7dgKr6qQECrj/iiev9zmuIJrkYjPKc/Kd1fQwnxbdkopXRbpvns
 dBa9kOZixjMojyHMla3Xgcm7uqCKemj6XZLqGQIuEbIj7IhH
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In commit 8caab75fd2c2 ("spi: Generalize SPI "master" to "controller"")
some functions and struct members were renamed. To not break all drivers
compatibility macros were provided.

To be able to remove these compatibility macros push the renaming into
this driver.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/staging/fbtft/fbtft-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 3626f429b002..68add4d598ae 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -794,7 +794,7 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 	if (par->txbuf.buf && par->txbuf.len >= 1024)
 		sprintf(text1, ", %zu KiB buffer memory", par->txbuf.len >> 10);
 	if (spi)
-		sprintf(text2, ", spi%d.%d at %d MHz", spi->master->bus_num,
+		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
 			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
 	dev_info(fb_info->dev,
 		 "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
@@ -1215,7 +1215,7 @@ int fbtft_probe_common(struct fbtft_display *display,
 
 	/* 9-bit SPI setup */
 	if (par->spi && display->buswidth == 9) {
-		if (par->spi->master->bits_per_word_mask & SPI_BPW_MASK(9)) {
+		if (par->spi->controller->bits_per_word_mask & SPI_BPW_MASK(9)) {
 			par->spi->bits_per_word = 9;
 		} else {
 			dev_warn(&par->spi->dev,
-- 
2.43.0

