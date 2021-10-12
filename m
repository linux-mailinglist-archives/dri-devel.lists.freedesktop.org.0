Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCD242A87E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 17:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9708589DFE;
	Tue, 12 Oct 2021 15:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F97D89E03
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 15:40:02 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maJsj-0008P8-SS; Tue, 12 Oct 2021 17:39:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maJse-0004je-Tx; Tue, 12 Oct 2021 17:39:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maJse-0004Z6-Sr; Tue, 12 Oct 2021 17:39:52 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Len Baker <len.baker@gmx.com>, Mark Brown <broonie@kernel.org>,
 Phil Reid <preid@electromag.com.au>, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de, linux-fbdev@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v2 19/20] staging: fbtft: Make fbtft_remove_common() return
 void
Date: Tue, 12 Oct 2021 17:39:44 +0200
Message-Id: <20211012153945.2651412-20-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012153945.2651412-1-u.kleine-koenig@pengutronix.de>
References: <20211012153945.2651412-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=/RLR4bDyADQRwzANF6ER5sKrX+JFDYSh90Q0J5N84UY=;
 m=6FiNYI6au9uFB2IoKzr/cKU1LkGxlwoXSYCPM/+GX+Y=;
 p=wOY1n0CZ/7bAct64lOvb3N+O46QD12yDtQU8vjW2ZLM=;
 g=617a3f39318dbfdbd2bc6b4d809ee0c624c7a08a
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFlrDIACgkQwfwUeK3K7AlRlgf+KW+
 zCwB5yRA4XahfU4N7wEcoQOaol/eZYbQB+BPqzOx3W7M/m2wfjvvQ4H2s3r9EqyqgIM+TdFj5pBGc
 7DCoGIopGX9VUUf2piVRYIvFNXdr9FvJz7CZK6TfIcKQK4J6cOiRVQEba8JjlhRHw59NjDI6KlJTU
 jPeqHDZhY68JfSFoZjIQ6pmCNnhZ5CE6N3gqi1Ya3Gc5kyniecxUE3DLV8FDoNoOtab73ZAHG8Tn8
 WPJEb6Hkvv1mbjbxu20jJu7ZWcse728icuFy6MoAq4T7D8JmOqL4YPg1uzpj2M2Jd1S5DjHnDIvCa
 V2qrI+mqEmgZM+9mAQmYbhCacNgrA6A==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fbtft_remove_common() is only called with a non-NULL fb_info. (All
callers are in remove callbacks and the matching probe callbacks set
driver data accordingly.) So fbtft_remove_common() always returns zero.
Make it return void instead which makes it easier to see in the callers
that there is no error to handle.

Also the return value of platform and spi remove callbacks is ignored
anyway and not freeing resources in .remove() is a bad idea.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/staging/fbtft/fbtft-core.c | 8 +-------
 drivers/staging/fbtft/fbtft.h      | 8 +++++---
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index ed992ca605eb..9c9eab1182a6 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -1318,23 +1318,17 @@ EXPORT_SYMBOL(fbtft_probe_common);
  * @info: Framebuffer
  *
  * Unregisters and releases the framebuffer
- *
- * Return: 0 if successful, negative if error
  */
-int fbtft_remove_common(struct device *dev, struct fb_info *info)
+void fbtft_remove_common(struct device *dev, struct fb_info *info)
 {
 	struct fbtft_par *par;
 
-	if (!info)
-		return -EINVAL;
 	par = info->par;
 	if (par)
 		fbtft_par_dbg(DEBUG_DRIVER_INIT_FUNCTIONS, par,
 			      "%s()\n", __func__);
 	fbtft_unregister_framebuffer(info);
 	fbtft_framebuffer_release(info);
-
-	return 0;
 }
 EXPORT_SYMBOL(fbtft_remove_common);
 
diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 76f8c090a837..6869f3603b0e 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -252,7 +252,7 @@ void fbtft_unregister_backlight(struct fbtft_par *par);
 int fbtft_init_display(struct fbtft_par *par);
 int fbtft_probe_common(struct fbtft_display *display, struct spi_device *sdev,
 		       struct platform_device *pdev);
-int fbtft_remove_common(struct device *dev, struct fb_info *info);
+void fbtft_remove_common(struct device *dev, struct fb_info *info);
 
 /* fbtft-io.c */
 int fbtft_write_spi(struct fbtft_par *par, void *buf, size_t len);
@@ -283,7 +283,8 @@ static int fbtft_driver_remove_spi(struct spi_device *spi)                 \
 {                                                                          \
 	struct fb_info *info = spi_get_drvdata(spi);                       \
 									   \
-	return fbtft_remove_common(&spi->dev, info);                       \
+	fbtft_remove_common(&spi->dev, info);                              \
+	return 0;                                                          \
 }                                                                          \
 									   \
 static int fbtft_driver_probe_pdev(struct platform_device *pdev)           \
@@ -295,7 +296,8 @@ static int fbtft_driver_remove_pdev(struct platform_device *pdev)          \
 {                                                                          \
 	struct fb_info *info = platform_get_drvdata(pdev);                 \
 									   \
-	return fbtft_remove_common(&pdev->dev, info);                      \
+	fbtft_remove_common(&pdev->dev, info);                             \
+	return 0;                                                          \
 }                                                                          \
 									   \
 static const struct of_device_id dt_ids[] = {                              \
-- 
2.30.2

