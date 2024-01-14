Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F0A82D131
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jan 2024 16:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1544110E19B;
	Sun, 14 Jan 2024 15:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5190D10E19B
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jan 2024 15:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705246086; x=1736782086;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gErb4SvLDcsU5HgGSgzQl+lRFtQWIMD24E+MzwAOiTg=;
 b=bFdYjvNs8lS4CeD1q+ljtoM+3by3I1m9z39hV7XgjzFYcvZcsKYZMEXa
 nxaZ7a3AHgOlyHCfcZXfYBzcWEJsiU3+e76c0Kez1J8LE3LbITcc49mps
 74BjW+6XHR6CVG2TvYiOpL7o0fdGtQSKmvE95lQVtycmP7gI/mrSaobY9
 pGUCXbzHlmCQDjqp1vr5XEWYdO+JxAMhTtFI1zU0QXvPn4eqg9VNBily4
 JV16mmIGcbN9OCchc/jlFGtBNFy76RProwzsWM/FqtCdpg5tiKGAx6ppn
 T4T716HDPGJ34rX3se91pRWdpivnbrGmuxV6hl4uqwbbNTYYqyc3nRFTg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="12835873"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; d="scan'208";a="12835873"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2024 07:28:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="1030429356"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; d="scan'208";a="1030429356"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga006.fm.intel.com with ESMTP; 14 Jan 2024 07:28:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 3825C3AE; Sun, 14 Jan 2024 17:28:02 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] backlight: hx8357: Move OF table closer to its consumer
Date: Sun, 14 Jan 2024 17:25:09 +0200
Message-ID: <20240114152759.1040563-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20240114152759.1040563-1-andriy.shevchenko@linux.intel.com>
References: <20240114152759.1040563-1-andriy.shevchenko@linux.intel.com>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee@kernel.org>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move OF table near to the user.

While at it, drop comma at terminator entry.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/backlight/hx8357.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/video/backlight/hx8357.c b/drivers/video/backlight/hx8357.c
index c7fd10d55c5d..8709d9141cfb 100644
--- a/drivers/video/backlight/hx8357.c
+++ b/drivers/video/backlight/hx8357.c
@@ -566,19 +566,6 @@ static struct lcd_ops hx8357_ops = {
 
 typedef int (*hx8357_init)(struct lcd_device *);
 
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

