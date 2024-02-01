Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B87E845BA0
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 16:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA6610F273;
	Thu,  1 Feb 2024 15:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jxBWNOgo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 01 Feb 2024 15:33:50 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1015210F273
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 15:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706801630; x=1738337630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Crj2Xd5+sjM/WF1/AU2C24hHxy1FDdrAbIh7Rfeop1M=;
 b=jxBWNOgoHTiofy9QFKgn9cn1MHCWiGSqDo24vUmDC6f6/L2vj5YdNRJT
 A673A2Sp0SW/KTyIkV1PHDAEgtdq8qrSbsCuSLDmdnjQJ27c3qfWlOA7c
 ka5ZifmLCVOclsRTi/8ViSbcjYxXIcv1Dn1T7u3iaWyuUlsRhDQAZA4Pw
 qVT5FUtUnFt3kw4l84j4887g6brlBELM8DbFEj4IYTUPYYiA+bcF4zvZW
 jacmbErPoIdvX4doK/JR3rc0piij/mEL1UQGIfb3TjjtvjBIxjVqR0sA/
 Y/Rt3tfkxdz576hqIv7kA9DiCb3A1KGhE/sesk3tV7I65UIQLFE6zT61r g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="140714"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="140714"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 07:26:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="908275361"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="908275361"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga002.fm.intel.com with ESMTP; 01 Feb 2024 07:26:41 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id F2F7CA8A; Thu,  1 Feb 2024 16:49:52 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH v2 2/4] backlight: hx8357: Move OF table closer to its consumer
Date: Thu,  1 Feb 2024 16:47:43 +0200
Message-ID: <20240201144951.294215-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20240201144951.294215-1-andriy.shevchenko@linux.intel.com>
References: <20240201144951.294215-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Move OF table near to the user.

While at it, drop comma at terminator entry.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/backlight/hx8357.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/video/backlight/hx8357.c b/drivers/video/backlight/hx8357.c
index ac65609e5d84..81d0984e9d8b 100644
--- a/drivers/video/backlight/hx8357.c
+++ b/drivers/video/backlight/hx8357.c
@@ -566,19 +566,6 @@ static struct lcd_ops hx8357_ops = {
 
 typedef int (*hx8357_init_fn)(struct lcd_device *);
 
-static const struct of_device_id hx8357_dt_ids[] = {
-	{
-		.compatible = "himax,hx8357",
-		.data = hx8357_lcd_init,
-	},
-	{
-		.compatible = "himax,hx8369",
-		.data = hx8369_lcd_init,
-	},
-	{},
-};
-MODULE_DEVICE_TABLE(of, hx8357_dt_ids);
-
 static int hx8357_probe(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
@@ -640,6 +627,19 @@ static int hx8357_probe(struct spi_device *spi)
 	return 0;
 }
 
+static const struct of_device_id hx8357_dt_ids[] = {
+	{
+		.compatible = "himax,hx8357",
+		.data = hx8357_lcd_init,
+	},
+	{
+		.compatible = "himax,hx8369",
+		.data = hx8369_lcd_init,
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, hx8357_dt_ids);
+
 static struct spi_driver hx8357_driver = {
 	.probe  = hx8357_probe,
 	.driver = {
-- 
2.43.0.rc1.1.gbec44491f096

