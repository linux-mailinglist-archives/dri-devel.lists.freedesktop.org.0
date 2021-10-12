Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B6B42A879
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 17:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0538789DF9;
	Tue, 12 Oct 2021 15:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0978189DF9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 15:39:56 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maJsd-0008NO-Up; Tue, 12 Oct 2021 17:39:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maJsa-0004iV-UO; Tue, 12 Oct 2021 17:39:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maJsa-0004Wb-TV; Tue, 12 Oct 2021 17:39:48 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 linux-spi@vger.kernel.org
Subject: [PATCH v2 01/20] drm/panel: s6e63m0: Make s6e63m0_remove() return void
Date: Tue, 12 Oct 2021 17:39:26 +0200
Message-Id: <20211012153945.2651412-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012153945.2651412-1-u.kleine-koenig@pengutronix.de>
References: <20211012153945.2651412-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=s7lxpA3SlxdAgalZdfZtQ9BEymVUSL76ohaDIVT+Hbk=;
 m=QwS8VQ147nh5eUkRo9mxGTfBcUgnx3Jl4gdGJ73rKHM=;
 p=gB1Eh6qhdZKXG7+Sv2MnM6FjygYEx1l/LzdGrasJ/Qc=;
 g=4d3b9377dd7211c6773f6965376e81757de8d724
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFlq/oACgkQwfwUeK3K7Akmjgf/Yz4
 5vOpjYxqgOZK7YhMlgWEMY2UMzrf8E+RXKJk77ktsE8UokcCxvISzNgFqYMqXAf5QOZFF4qwGh0hy
 HvQknmD6QcThauWd46RwTXVRMtu10Iy2uIQdqLKw+bTgeEf6z4k66dn1yKbR6RwliBvDZlkSeC/OA
 wj1iWzqoFlRdWdsK0bXySrKkCmuH339v0MvPhmU+ZKRjHhaC6Bsk6vs/P9cy7D0OtVkbnrIl1MO+i
 zuHWP5/Lmb5sGU4Pxmx9RR971muNiyE55QoiOdG6kqlay0Sv6gPQqMqtkNG5JAR4fL5r+7eiVzZYf
 /OKmjqvUJFAeKCAtQuqsz37t3ga0Q7A==
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

Up to now s6e63m0_remove() returns zero unconditionally. Make it return
void instead which makes it easier to see in the callers that there is
no error to handle.

Also the return value of spi remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c | 3 ++-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c | 3 ++-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c     | 4 +---
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.h     | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
index e0b1a7e354f3..e0f773678168 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
@@ -116,7 +116,8 @@ static int s6e63m0_dsi_probe(struct mipi_dsi_device *dsi)
 static int s6e63m0_dsi_remove(struct mipi_dsi_device *dsi)
 {
 	mipi_dsi_detach(dsi);
-	return s6e63m0_remove(&dsi->dev);
+	s6e63m0_remove(&dsi->dev);
+	return 0;
 }
 
 static const struct of_device_id s6e63m0_dsi_of_match[] = {
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c
index 3669cc3719ce..c178d962b0d5 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c
@@ -64,7 +64,8 @@ static int s6e63m0_spi_probe(struct spi_device *spi)
 
 static int s6e63m0_spi_remove(struct spi_device *spi)
 {
-	return s6e63m0_remove(&spi->dev);
+	s6e63m0_remove(&spi->dev);
+	return 0;
 }
 
 static const struct of_device_id s6e63m0_spi_of_match[] = {
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
index 35d72ac663d6..b34fa4d5de07 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
@@ -749,13 +749,11 @@ int s6e63m0_probe(struct device *dev, void *trsp,
 }
 EXPORT_SYMBOL_GPL(s6e63m0_probe);
 
-int s6e63m0_remove(struct device *dev)
+void s6e63m0_remove(struct device *dev)
 {
 	struct s6e63m0 *ctx = dev_get_drvdata(dev);
 
 	drm_panel_remove(&ctx->panel);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(s6e63m0_remove);
 
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.h b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.h
index 306605ed1117..c926eca1c817 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.h
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.h
@@ -35,6 +35,6 @@ int s6e63m0_probe(struct device *dev, void *trsp,
 				   const u8 *data,
 				   size_t len),
 		  bool dsi_mode);
-int s6e63m0_remove(struct device *dev);
+void s6e63m0_remove(struct device *dev);
 
 #endif /* _PANEL_SAMSUNG_S6E63M0_H */
-- 
2.30.2

