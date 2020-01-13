Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E28BF1393EA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 15:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9246E0E0;
	Mon, 13 Jan 2020 14:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1703D6E0E0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 14:46:33 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1ir0z5-0000RA-C9; Mon, 13 Jan 2020 14:46:27 +0000
From: Colin King <colin.king@canonical.com>
To: Antonino Daplas <adaplas@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] video: fbdev: nvidia: clean up indentation issues and comment
 block
Date: Mon, 13 Jan 2020 14:46:27 +0000
Message-Id: <20200113144627.219967-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

There is a hunk of code that is incorrectly indented, clean up the
indentation and a comment block. Also remove block braces around a
one line statement on an if condition and add missing spaces after
if keywords.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/video/fbdev/nvidia/nvidia.c | 41 ++++++++++++++---------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
index c583c018304d..c24de9107958 100644
--- a/drivers/video/fbdev/nvidia/nvidia.c
+++ b/drivers/video/fbdev/nvidia/nvidia.c
@@ -168,27 +168,26 @@ static int nvidia_panel_tweak(struct nvidia_par *par,
 {
 	int tweak = 0;
 
-   if (par->paneltweak) {
-	   tweak = par->paneltweak;
-   } else {
-	   /* begin flat panel hacks */
-	   /* This is unfortunate, but some chips need this register
-	      tweaked or else you get artifacts where adjacent pixels are
-	      swapped.  There are no hard rules for what to set here so all
-	      we can do is experiment and apply hacks. */
-
-	   if(((par->Chipset & 0xffff) == 0x0328) && (state->bpp == 32)) {
-		   /* At least one NV34 laptop needs this workaround. */
-		   tweak = -1;
-	   }
-
-	   if((par->Chipset & 0xfff0) == 0x0310) {
-		   tweak = 1;
-	   }
-	   /* end flat panel hacks */
-   }
-
-   return tweak;
+	if (par->paneltweak) {
+		tweak = par->paneltweak;
+	} else {
+		/* Begin flat panel hacks.
+		 * This is unfortunate, but some chips need this register
+		 * tweaked or else you get artifacts where adjacent pixels are
+		 * swapped.  There are no hard rules for what to set here so all
+		 * we can do is experiment and apply hacks.
+		 */
+		if (((par->Chipset & 0xffff) == 0x0328) && (state->bpp == 32)) {
+			/* At least one NV34 laptop needs this workaround. */
+			tweak = -1;
+		}
+
+		if ((par->Chipset & 0xfff0) == 0x0310)
+			tweak = 1;
+		/* end flat panel hacks */
+	}
+
+	return tweak;
 }
 
 static void nvidia_screen_off(struct nvidia_par *par, int on)
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
