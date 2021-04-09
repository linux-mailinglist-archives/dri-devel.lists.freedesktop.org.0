Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3494635A39B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 18:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 349FE6EC3F;
	Fri,  9 Apr 2021 16:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7466EC41
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 16:41:42 +0000 (UTC)
IronPort-SDR: lqJgmqvSl3mJTL/k5G3dnjkDGK/ZF4c+KHSNOYbSil7XyIfZBBluvuqaAqROxUBR9i2h0EdUss
 eM46B5ttLK0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9949"; a="193912241"
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; d="scan'208";a="193912241"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 09:41:31 -0700
IronPort-SDR: jRjMIhkQHwFvaGBbqRIpkcEqBHXTBK1ZYjfu2iqnia4QHR1yZRXaNTpCqUoIm5SXJKUGVMFEWs
 3JMikjRXdnOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; d="scan'208";a="520337221"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 09 Apr 2021 09:41:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id E6399FC; Fri,  9 Apr 2021 19:41:44 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] video: ssd1307fb: Drop OF dependency
Date: Fri,  9 Apr 2021 19:41:40 +0300
Message-Id: <20210409164140.17337-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After the commit 72915994e028 ("video: ssd1307fb: Make use of device
properties") driver does not depend on OF, drop unneeded dependency.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/fbdev/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 4f02db65dede..7506b5949eb0 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -2209,7 +2209,6 @@ config FB_SIMPLE
 config FB_SSD1307
 	tristate "Solomon SSD1307 framebuffer support"
 	depends on FB && I2C
-	depends on OF
 	depends on GPIOLIB || COMPILE_TEST
 	select FB_SYS_FOPS
 	select FB_SYS_FILLRECT
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
