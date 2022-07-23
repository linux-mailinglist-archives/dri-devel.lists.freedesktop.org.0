Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A7E57F0D1
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jul 2022 19:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BE7A7B60;
	Sat, 23 Jul 2022 17:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F61A7B6E
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Jul 2022 17:57:54 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1oFJNq-0007TX-NT; Sat, 23 Jul 2022 19:57:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1oFJNo-002l3j-IG; Sat, 23 Jul 2022 19:57:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1oFJNn-007371-Ka; Sat, 23 Jul 2022 19:57:43 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH 2/4] video: fb: imxfb: Drop unused symbols from header
Date: Sat, 23 Jul 2022 19:57:18 +0200
Message-Id: <20220723175720.76933-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220723175720.76933-1-u.kleine-koenig@pengutronix.de>
References: <20220723175720.76933-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2008; h=from:subject;
 bh=GQY8SNmv+wZWhLNZLF4qv5cFCuTXEOrxUK2Sdpj9xUk=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBi3DZzVEKwMIrfywPNGjkCG3TOpClIt6fWBetivlVO
 I0jbOi+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYtw2cwAKCRDB/BR4rcrsCZbAB/
 9E4YWvTK3Bn7/+6zzlx6tY6rpBI82kJKZezJ6gMIOEHyxNAIaAInvwp3p5hmwoCWyJYKDlNKUdZc8V
 6LB9GALIVs+Codjz7LaYoeXbtMRAIvhjw85vQNjc+mJc4afdIPWJQivcYgZmOTBYlu+pHJQNEPrbuY
 VFvYMv5/kM+7iWwMAC9Ru7p822C7WwKwrVKVFdmKmo5abG8LyT9pzMZsNrkxjWqkme44s+X5aiQgsx
 DMkZ+fej/4xj0AQQ6ANB/IVAteIdunkEUrl19ZgEcib2ObdurdxcU9GJd75AfPIoQ97RkJvkLZYfl4
 NG9UDy5IuQYCwmCks+efRedVW5pqs0
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

The only file that includes <linux/platform_data/video-imxfb.h> is the
imxfb driver. Drop all symbols that are unused there.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 include/linux/platform_data/video-imxfb.h | 35 -----------------------
 1 file changed, 35 deletions(-)

diff --git a/include/linux/platform_data/video-imxfb.h b/include/linux/platform_data/video-imxfb.h
index b80a156a6617..a16837c5e43c 100644
--- a/include/linux/platform_data/video-imxfb.h
+++ b/include/linux/platform_data/video-imxfb.h
@@ -8,45 +8,10 @@
 #include <linux/fb.h>
 
 #define PCR_TFT		(1 << 31)
-#define PCR_COLOR	(1 << 30)
-#define PCR_PBSIZ_1	(0 << 28)
-#define PCR_PBSIZ_2	(1 << 28)
-#define PCR_PBSIZ_4	(2 << 28)
-#define PCR_PBSIZ_8	(3 << 28)
-#define PCR_BPIX_1	(0 << 25)
-#define PCR_BPIX_2	(1 << 25)
-#define PCR_BPIX_4	(2 << 25)
 #define PCR_BPIX_8	(3 << 25)
 #define PCR_BPIX_12	(4 << 25)
 #define PCR_BPIX_16	(5 << 25)
 #define PCR_BPIX_18	(6 << 25)
-#define PCR_PIXPOL	(1 << 24)
-#define PCR_FLMPOL	(1 << 23)
-#define PCR_LPPOL	(1 << 22)
-#define PCR_CLKPOL	(1 << 21)
-#define PCR_OEPOL	(1 << 20)
-#define PCR_SCLKIDLE	(1 << 19)
-#define PCR_END_SEL	(1 << 18)
-#define PCR_END_BYTE_SWAP (1 << 17)
-#define PCR_REV_VS	(1 << 16)
-#define PCR_ACD_SEL	(1 << 15)
-#define PCR_ACD(x)	(((x) & 0x7f) << 8)
-#define PCR_SCLK_SEL	(1 << 7)
-#define PCR_SHARP	(1 << 6)
-#define PCR_PCD(x)	((x) & 0x3f)
-
-#define PWMR_CLS(x)	(((x) & 0x1ff) << 16)
-#define PWMR_LDMSK	(1 << 15)
-#define PWMR_SCR1	(1 << 10)
-#define PWMR_SCR0	(1 << 9)
-#define PWMR_CC_EN	(1 << 8)
-#define PWMR_PW(x)	((x) & 0xff)
-
-#define LSCR1_PS_RISE_DELAY(x)    (((x) & 0x7f) << 26)
-#define LSCR1_CLS_RISE_DELAY(x)   (((x) & 0x3f) << 16)
-#define LSCR1_REV_TOGGLE_DELAY(x) (((x) & 0xf) << 8)
-#define LSCR1_GRAY2(x)            (((x) & 0xf) << 4)
-#define LSCR1_GRAY1(x)            (((x) & 0xf))
 
 struct imx_fb_videomode {
 	struct fb_videomode mode;
-- 
2.36.1

