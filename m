Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3063957F0D3
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jul 2022 19:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1559A7B7D;
	Sat, 23 Jul 2022 17:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87619A7B60
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Jul 2022 17:57:54 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1oFJNq-0007TZ-NT; Sat, 23 Jul 2022 19:57:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1oFJNo-002l3p-Nt; Sat, 23 Jul 2022 19:57:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1oFJNn-007374-Q9; Sat, 23 Jul 2022 19:57:43 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH 3/4] video: fb: imxfb: Fold
 <linux/platform_data/video-imxfb.h> into only user
Date: Sat, 23 Jul 2022 19:57:19 +0200
Message-Id: <20220723175720.76933-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220723175720.76933-1-u.kleine-koenig@pengutronix.de>
References: <20220723175720.76933-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2487; h=from:subject;
 bh=si4SB8+oQGJxO+SQRJnNnfR4S832HUXPHQwRl56ppPE=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBi3DZ3lXN/3ZIL5hf82aE5oSiueHhE1Tl4O73PB6aZ
 MT3EnYSJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYtw2dwAKCRDB/BR4rcrsCTFqB/
 wIJ2sf6HdWpi++9OGkx0aoFgfXOFNxE/0vM++ZDRRjinE7dq4kjxQRhGnU1BCRr7MwCDxpIUN7+VLo
 GxQLLRT7BIPzDM/+CntNpXRXZ8XWkNEJacgJt2QqC4kJ9xGqudk6kPcMBUZk9p77RuQ1UV8LoxquJ1
 naBTehMT6HbhCZXw5Xlz0++B8VsUhFwZ6djcb/y508Vi0DlaAEhA9dYCFYUos/tJSq/FNdclBJbxD/
 grPDRKczoolqZmeQ6pEf+6zPgyPQUyP79JzDWneLInv/2kbEixpf/ZUs6LOArsOdhpdrnBUBZtg4cI
 dtwToxTrRIPpmrSCCMRSZs5MSozxIl
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No source file but the driver itself includes the header containing the
platform data definition. The last user is gone since commit
8485adf17a15 ("ARM: imx: Remove imx device directory").

Move the remaining symbols directly into the driver and remove the then
unused header file.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 MAINTAINERS                               |  1 -
 drivers/video/fbdev/imxfb.c               | 13 ++++++++++++-
 include/linux/platform_data/video-imxfb.h | 23 -----------------------
 3 files changed, 12 insertions(+), 25 deletions(-)
 delete mode 100644 include/linux/platform_data/video-imxfb.h

diff --git a/MAINTAINERS b/MAINTAINERS
index a6d3bd9d2a8d..52f12f492ed5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7912,7 +7912,6 @@ L:	linux-fbdev@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/video/fbdev/imxfb.c
-F:	include/linux/platform_data/video-imxfb.h
 
 FREESCALE IMX DDR PMU DRIVER
 M:	Frank Li <Frank.li@nxp.com>
diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index 85a5bf5639d9..fa6a19c1ae9b 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -41,7 +41,18 @@
 #include <video/of_videomode.h>
 #include <video/videomode.h>
 
-#include <linux/platform_data/video-imxfb.h>
+#define PCR_TFT		(1 << 31)
+#define PCR_BPIX_8	(3 << 25)
+#define PCR_BPIX_12	(4 << 25)
+#define PCR_BPIX_16	(5 << 25)
+#define PCR_BPIX_18	(6 << 25)
+
+struct imx_fb_videomode {
+	struct fb_videomode mode;
+	u32 pcr;
+	bool aus_mode;
+	unsigned char	bpp;
+};
 
 /*
  * Complain if VAR is out of range.
diff --git a/include/linux/platform_data/video-imxfb.h b/include/linux/platform_data/video-imxfb.h
deleted file mode 100644
index a16837c5e43c..000000000000
--- a/include/linux/platform_data/video-imxfb.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * This structure describes the machine which we are running on.
- */
-#ifndef __MACH_IMXFB_H__
-#define __MACH_IMXFB_H__
-
-#include <linux/fb.h>
-
-#define PCR_TFT		(1 << 31)
-#define PCR_BPIX_8	(3 << 25)
-#define PCR_BPIX_12	(4 << 25)
-#define PCR_BPIX_16	(5 << 25)
-#define PCR_BPIX_18	(6 << 25)
-
-struct imx_fb_videomode {
-	struct fb_videomode mode;
-	u32 pcr;
-	bool aus_mode;
-	unsigned char	bpp;
-};
-
-#endif /* ifndef __MACH_IMXFB_H__ */
-- 
2.36.1

