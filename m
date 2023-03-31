Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A51496D1C01
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EFB410F148;
	Fri, 31 Mar 2023 09:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BBF10F137
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:23:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 75D501FE97;
 Fri, 31 Mar 2023 09:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680254597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RaPNae8vbLlIwRgnHfTO+X5kPSqhUm9FfKexGbHO6bY=;
 b=1+SMHPvUTzBFAsRqEu8VQntd3MbykZ5BHEM8JwYDjOU1f37GEYYM3GkKvhU+WQMFSmsjF7
 tFVv3CCJSa1Pdot3v9jYPQWpEsZmTaO2BW+WciEGEoAb476QXay/jPuAUBnmmDEbEUsc6x
 LQO2zzSnfTffHNdwV3sjk+JZ79KYlzI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680254597;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RaPNae8vbLlIwRgnHfTO+X5kPSqhUm9FfKexGbHO6bY=;
 b=ohA0PXWkK2Am7xIMUCh+tA0fX1Uy6T704XY6itpfG1FJabE3zEmWzSPhztYrPf6DjNuDGB
 GeWk4VMEhUYuKLBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5B81813A0E;
 Fri, 31 Mar 2023 09:23:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qGaQFYWmJmTsOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 31 Mar 2023 09:23:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Subject: [PATCH 06/15] fbdev/hgafb: Remove trailing whitespaces
Date: Fri, 31 Mar 2023 11:23:05 +0200
Message-Id: <20230331092314.2209-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331092314.2209-1-tzimmermann@suse.de>
References: <20230331092314.2209-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix coding style. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/hgafb.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/video/fbdev/hgafb.c b/drivers/video/fbdev/hgafb.c
index bd3d07aa4f0e..40879d9facdf 100644
--- a/drivers/video/fbdev/hgafb.c
+++ b/drivers/video/fbdev/hgafb.c
@@ -1,6 +1,6 @@
 /*
  * linux/drivers/video/hgafb.c -- Hercules graphics adaptor frame buffer device
- * 
+ *
  *      Created 25 Nov 1999 by Ferenc Bakonyi (fero@drama.obuda.kando.hu)
  *      Based on skeletonfb.c by Geert Uytterhoeven and
  *               mdacon.c by Andrew Apted
@@ -8,14 +8,14 @@
  * History:
  *
  * - Revision 0.1.8 (23 Oct 2002): Ported to new framebuffer api.
- * 
- * - Revision 0.1.7 (23 Jan 2001): fix crash resulting from MDA only cards 
+ *
+ * - Revision 0.1.7 (23 Jan 2001): fix crash resulting from MDA only cards
  *				   being detected as Hercules.	 (Paul G.)
  * - Revision 0.1.6 (17 Aug 2000): new style structs
  *                                 documentation
  * - Revision 0.1.5 (13 Mar 2000): spinlocks instead of saveflags();cli();etc
  *                                 minor fixes
- * - Revision 0.1.4 (24 Jan 2000): fixed a bug in hga_card_detect() for 
+ * - Revision 0.1.4 (24 Jan 2000): fixed a bug in hga_card_detect() for
  *                                  HGA-only systems
  * - Revision 0.1.3 (22 Jan 2000): modified for the new fb_info structure
  *                                 screen is cleared after rmmod
@@ -143,7 +143,7 @@ static bool nologo = 0;
 
 static void write_hga_b(unsigned int val, unsigned char reg)
 {
-	outb_p(reg, HGA_INDEX_PORT); 
+	outb_p(reg, HGA_INDEX_PORT);
 	outb_p(val, HGA_VALUE_PORT);
 }
 
@@ -155,7 +155,7 @@ static void write_hga_w(unsigned int val, unsigned char reg)
 
 static int test_hga_b(unsigned char val, unsigned char reg)
 {
-	outb_p(reg, HGA_INDEX_PORT); 
+	outb_p(reg, HGA_INDEX_PORT);
 	outb  (val, HGA_VALUE_PORT);
 	udelay(20); val = (inb_p(HGA_VALUE_PORT) == val);
 	return val;
@@ -244,7 +244,7 @@ static void hga_show_logo(struct fb_info *info)
 	void __iomem *dest = hga_vram;
 	char *logo = linux_logo_bw;
 	int x, y;
-	
+
 	for (y = 134; y < 134 + 80 ; y++) * this needs some cleanup *
 		for (x = 0; x < 10 ; x++)
 			writeb(~*(logo++),(dest + HGA_ROWADDR(y) + x + 40));
@@ -255,7 +255,7 @@ static void hga_pan(unsigned int xoffset, unsigned int yoffset)
 {
 	unsigned int base;
 	unsigned long flags;
-	
+
 	base = (yoffset / 8) * 90 + xoffset;
 	spin_lock_irqsave(&hga_reg_lock, flags);
 	write_hga_w(base, 0x0c);	/* start address */
@@ -310,7 +310,7 @@ static int hga_card_detect(void)
 	/* Ok, there is definitely a card registering at the correct
 	 * memory location, so now we do an I/O port test.
 	 */
-	
+
 	if (!test_hga_b(0x66, 0x0f))	    /* cursor low register */
 		goto error;
 
@@ -321,7 +321,7 @@ static int hga_card_detect(void)
 	 * bit of the status register is changing.  This test lasts for
 	 * approximately 1/10th of a second.
 	 */
-	
+
 	p_save = q_save = inb_p(HGA_STATUS_PORT) & HGA_STATUS_VSYNC;
 
 	for (count=0; count < 50000 && p_save == q_save; count++) {
@@ -329,7 +329,7 @@ static int hga_card_detect(void)
 		udelay(2);
 	}
 
-	if (p_save == q_save) 
+	if (p_save == q_save)
 		goto error;
 
 	switch (inb_p(HGA_STATUS_PORT) & 0x70) {
@@ -415,7 +415,7 @@ static int hgafb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
  *	@info:pointer to fb_info object containing info for current hga board
  *
  *	This function looks only at xoffset, yoffset and the %FB_VMODE_YWRAP
- *	flag in @var. If input parameters are correct it calls hga_pan() to 
+ *	flag in @var. If input parameters are correct it calls hga_pan() to
  *	program the hardware. @info->var is updated to the new values.
  *	A zero is returned on success and %-EINVAL for failure.
  */
@@ -442,9 +442,9 @@ static int hgafb_pan_display(struct fb_var_screeninfo *var,
  *	hgafb_blank - (un)blank the screen
  *	@blank_mode:blanking method to use
  *	@info:unused
- *	
- *	Blank the screen if blank_mode != 0, else unblank. 
- *	Implements VESA suspend and powerdown modes on hardware that supports 
+ *
+ *	Blank the screen if blank_mode != 0, else unblank.
+ *	Implements VESA suspend and powerdown modes on hardware that supports
  *	disabling hsync/vsync:
  *		@blank_mode == 2 means suspend vsync,
  *		@blank_mode == 3 means suspend hsync,
@@ -539,15 +539,15 @@ static const struct fb_ops hgafb_ops = {
 	.fb_copyarea	= hgafb_copyarea,
 	.fb_imageblit	= hgafb_imageblit,
 };
-		
+
 /* ------------------------------------------------------------------------- *
  *
  * Functions in fb_info
- * 
+ *
  * ------------------------------------------------------------------------- */
 
 /* ------------------------------------------------------------------------- */
-    
+
 	/*
 	 *  Initialization
 	 */
-- 
2.40.0

