Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FAB492D0C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 19:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323B410E2C6;
	Tue, 18 Jan 2022 18:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193F189DD8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 18:13:52 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n9szM-000881-TH; Tue, 18 Jan 2022 19:13:49 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n9szL-00B2zr-2n; Tue, 18 Jan 2022 19:13:46 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n9szJ-0006zL-Rl; Tue, 18 Jan 2022 19:13:45 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/2] staging: fbtft: Deduplicate driver registration macros
Date: Tue, 18 Jan 2022 19:13:38 +0100
Message-Id: <20220118181338.207943-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118181338.207943-1-u.kleine-koenig@pengutronix.de>
References: <20220118181338.207943-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5994; h=from:subject;
 bh=SUIWoQXNcWfP6INie0kXP+/jZKbEezM9NjGBKjU3edc=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBh5wNOj3DBMMPaJDcKy744CvGpP86YIU5fQi7PIa2Z
 zeBr2emJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYecDTgAKCRDB/BR4rcrsCaIMB/
 4ngFTSwQLdkQb8ILiWNrklQzGwcpD0Aru0dOS3DeWWPOrfJPZplmfOAmWS0HGewjce+8f0swpLG4TH
 HJCI3rpUpZxmZoSUQWNcpGKvehDso3Vgnl6AHrgaRHL4nSoQcnM2SVQSYOzs4Ya5G8YIn5V/GTtiua
 DmOdVZeNuWYKEn1qWEwfCQreK7ymMbC+Th4iJfwfE5m8FO6nY254xq2Mqwjp6ici6OC4RQaqpJYft+
 WTDNVUb4Lf0311C6FTGNYzqkaHUfQQ5T9SY5FvSLRCM/TG3lctd1SL8B06A97IzC0bcsxsbNsUsz5y
 f9ORaX6U1kq4oq5O3vxr3vdy4OuflD
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
 Noralf Tronnes <notro@tronnes.org>, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The two macros FBTFT_REGISTER_DRIVER and FBTFT_REGISTER_SPI_DRIVER
contain quite some duplication: Both define an spi driver and an of device
table and the differences are quite subtle.

So create two new macros and use both twice.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/staging/fbtft/fbtft.h | 93 ++++++++++++++---------------------
 1 file changed, 36 insertions(+), 57 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 55677efc0138..6a7545b5bcd2 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -272,21 +272,40 @@ void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...);
 void fbtft_write_reg16_bus8(struct fbtft_par *par, int len, ...);
 void fbtft_write_reg16_bus16(struct fbtft_par *par, int len, ...);
 
+#define FBTFT_DT_TABLE(_compatible)						\
+static const struct of_device_id dt_ids[] = {					\
+	{ .compatible = _compatible },						\
+	{},									\
+};										\
+MODULE_DEVICE_TABLE(of, dt_ids);
+
+#define FBTFT_SPI_DRIVER(_name, _compatible, _display, _spi_ids)		\
+										\
+static int fbtft_driver_probe_spi(struct spi_device *spi)			\
+{										\
+	return fbtft_probe_common(_display, spi, NULL);				\
+}										\
+										\
+static int fbtft_driver_remove_spi(struct spi_device *spi)			\
+{										\
+	struct fb_info *info = spi_get_drvdata(spi);				\
+										\
+	fbtft_remove_common(&spi->dev, info);					\
+	return 0;								\
+}										\
+										\
+static struct spi_driver fbtft_driver_spi_driver = {				\
+	.driver = {								\
+		.name = _name,							\
+		.of_match_table = dt_ids,					\
+	},									\
+	.id_table = _spi_ids,							\
+	.probe = fbtft_driver_probe_spi,					\
+	.remove = fbtft_driver_remove_spi,					\
+};
+
 #define FBTFT_REGISTER_DRIVER(_name, _compatible, _display)                \
 									   \
-static int fbtft_driver_probe_spi(struct spi_device *spi)                  \
-{                                                                          \
-	return fbtft_probe_common(_display, spi, NULL);                    \
-}                                                                          \
-									   \
-static int fbtft_driver_remove_spi(struct spi_device *spi)                 \
-{                                                                          \
-	struct fb_info *info = spi_get_drvdata(spi);                       \
-									   \
-	fbtft_remove_common(&spi->dev, info);                              \
-	return 0;                                                          \
-}                                                                          \
-									   \
 static int fbtft_driver_probe_pdev(struct platform_device *pdev)           \
 {                                                                          \
 	return fbtft_probe_common(_display, NULL, pdev);                   \
@@ -300,22 +319,9 @@ static int fbtft_driver_remove_pdev(struct platform_device *pdev)          \
 	return 0;                                                          \
 }                                                                          \
 									   \
-static const struct of_device_id dt_ids[] = {                              \
-	{ .compatible = _compatible },                                     \
-	{},                                                                \
-};                                                                         \
-									   \
-MODULE_DEVICE_TABLE(of, dt_ids);                                           \
+FBTFT_DT_TABLE(_compatible)						   \
 									   \
-									   \
-static struct spi_driver fbtft_driver_spi_driver = {                       \
-	.driver = {                                                        \
-		.name   = _name,                                           \
-		.of_match_table = dt_ids,                                  \
-	},                                                                 \
-	.probe  = fbtft_driver_probe_spi,                                  \
-	.remove = fbtft_driver_remove_spi,                                 \
-};                                                                         \
+FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)			   \
 									   \
 static struct platform_driver fbtft_driver_platform_driver = {             \
 	.driver = {                                                        \
@@ -351,42 +357,15 @@ module_exit(fbtft_driver_module_exit);
 
 #define FBTFT_REGISTER_SPI_DRIVER(_name, _comp_vend, _comp_dev, _display)	\
 										\
-static int fbtft_driver_probe_spi(struct spi_device *spi)			\
-{										\
-	return fbtft_probe_common(_display, spi, NULL);				\
-}										\
-										\
-static int fbtft_driver_remove_spi(struct spi_device *spi)			\
-{										\
-	struct fb_info *info = spi_get_drvdata(spi);				\
-										\
-	fbtft_remove_common(&spi->dev, info);					\
-	return 0;								\
-}										\
-										\
-static const struct of_device_id dt_ids[] = {					\
-	{ .compatible = _comp_vend "," _comp_dev },				\
-	{},									\
-};										\
-										\
-MODULE_DEVICE_TABLE(of, dt_ids);						\
+FBTFT_DT_TABLE(_comp_vend "," _comp_dev)					\
 										\
 static const struct spi_device_id spi_ids[] = {					\
 	{ .name = _comp_dev },							\
 	{},									\
 };										\
-										\
 MODULE_DEVICE_TABLE(spi, spi_ids);						\
 										\
-static struct spi_driver fbtft_driver_spi_driver = {				\
-	.driver = {								\
-		.name  = _name,							\
-		.of_match_table = dt_ids,					\
-	},									\
-	.id_table = spi_ids,							\
-	.probe  = fbtft_driver_probe_spi,					\
-	.remove = fbtft_driver_remove_spi,					\
-};										\
+FBTFT_SPI_DRIVER(_name, _comp_vend "," _comp_dev, _display, spi_ids)		\
 										\
 module_spi_driver(fbtft_driver_spi_driver);
 
-- 
2.34.1

