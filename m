Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 665BB6D1C0B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BD810F178;
	Fri, 31 Mar 2023 09:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E739110F169
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:23:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7841721B30;
 Fri, 31 Mar 2023 09:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680254598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TCDUyK/kkO09gvfvzO6cX9oo85L8oKG13hs2lHMtpYM=;
 b=dvnB1CTqSArEZDGm5wJJJkaZ6pyGSy+vXApeAo8CSnvu1KmA7/nbcgzAS64z+KWr4UJnzB
 UeAKosRAgcIyE2fC1sNpkcGikRta5WZtBFWqjMucUuUQ6i4KXm6Mn/jB198F0DfaIv29gG
 wK/gIQ/+Z0LrjjTmkubMM4fA19+lubs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680254598;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TCDUyK/kkO09gvfvzO6cX9oo85L8oKG13hs2lHMtpYM=;
 b=vTmKqylho0fXQQjW1EPeTzW3TL1pIAqzVxXCUc74tiKo55Bw0rKHCdjGEk5+guC8Imjpgt
 YhYRy+z6/bbmm0CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F7B313A0E;
 Fri, 31 Mar 2023 09:23:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oCCIFoamJmTsOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 31 Mar 2023 09:23:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Subject: [PATCH 12/15] fbdev/sa1100fb: Remove trailing whitespaces
Date: Fri, 31 Mar 2023 11:23:11 +0200
Message-Id: <20230331092314.2209-13-tzimmermann@suse.de>
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
 drivers/video/fbdev/sa1100fb.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/video/fbdev/sa1100fb.c b/drivers/video/fbdev/sa1100fb.c
index b1b8ccdbac4a..a2408bf00ca0 100644
--- a/drivers/video/fbdev/sa1100fb.c
+++ b/drivers/video/fbdev/sa1100fb.c
@@ -57,14 +57,14 @@
  *	- Driver appears to be working for Brutus 320x200x8bpp mode.  Other
  *	  resolutions are working, but only the 8bpp mode is supported.
  *	  Changes need to be made to the palette encode and decode routines
- *	  to support 4 and 16 bpp modes.  
+ *	  to support 4 and 16 bpp modes.
  *	  Driver is not designed to be a module.  The FrameBuffer is statically
- *	  allocated since dynamic allocation of a 300k buffer cannot be 
- *	  guaranteed. 
+ *	  allocated since dynamic allocation of a 300k buffer cannot be
+ *	  guaranteed.
  *
  * 1999/06/17:
  *	- FrameBuffer memory is now allocated at run-time when the
- *	  driver is initialized.    
+ *	  driver is initialized.
  *
  * 2000/04/10: Nicolas Pitre <nico@fluxnic.net>
  *	- Big cleanup for dynamic selection of machine type at run time.
@@ -74,8 +74,8 @@
  *
  * 2000/08/07: Tak-Shing Chan <tchan.rd@idthk.com>
  *	       Jeff Sutherland <jsutherland@accelent.com>
- *	- Resolved an issue caused by a change made to the Assabet's PLD 
- *	  earlier this year which broke the framebuffer driver for newer 
+ *	- Resolved an issue caused by a change made to the Assabet's PLD
+ *	  earlier this year which broke the framebuffer driver for newer
  *	  Phase 4 Assabets.  Some other parameters were changed to optimize
  *	  for the Sharp display.
  *
@@ -102,7 +102,7 @@
  * 2000/11/23: Eric Peng <ericpeng@coventive.com>
  *	- Freebird add
  *
- * 2001/02/07: Jamey Hicks <jamey.hicks@compaq.com> 
+ * 2001/02/07: Jamey Hicks <jamey.hicks@compaq.com>
  *	       Cliff Brake <cbrake@accelent.com>
  *	- Added PM callback
  *
@@ -500,7 +500,7 @@ sa1100fb_set_cmap(struct fb_cmap *cmap, int kspc, int con,
  *  	the shortest recovery time
  *  Suspend
  *  	This refers to a level of power management in which substantial power
- *  	reduction is achieved by the display.  The display can have a longer 
+ *  	reduction is achieved by the display.  The display can have a longer
  *  	recovery time from this state than from the Stand-by state
  *  Off
  *  	This indicates that the display is consuming the lowest level of power
@@ -522,9 +522,9 @@ sa1100fb_set_cmap(struct fb_cmap *cmap, int kspc, int con,
  */
 /*
  * sa1100fb_blank():
- *	Blank the display by setting all palette values to zero.  Note, the 
+ *	Blank the display by setting all palette values to zero.  Note, the
  * 	12 and 16 bpp modes don't really use the palette, so this will not
- *      blank the display in all modes.  
+ *      blank the display in all modes.
  */
 static int sa1100fb_blank(int blank, struct fb_info *info)
 {
@@ -603,8 +603,8 @@ static inline unsigned int get_pcd(struct sa1100fb_info *fbi,
 
 /*
  * sa1100fb_activate_var():
- *	Configures LCD Controller based on entries in var parameter.  Settings are      
- *	only written to the controller if changes were made.  
+ *	Configures LCD Controller based on entries in var parameter.  Settings are
+ *	only written to the controller if changes were made.
  */
 static int sa1100fb_activate_var(struct fb_var_screeninfo *var, struct sa1100fb_info *fbi)
 {
@@ -747,7 +747,7 @@ static void sa1100fb_setup_gpio(struct sa1100fb_info *fbi)
 	 *
 	 * SA1110 spec update nr. 25 says we can and should
 	 * clear LDD15 to 12 for 4 or 8bpp modes with active
-	 * panels.  
+	 * panels.
 	 */
 	if ((fbi->reg_lccr0 & LCCR0_CMS) == LCCR0_Color &&
 	    (fbi->reg_lccr0 & (LCCR0_Dual|LCCR0_Act)) != 0) {
@@ -1020,9 +1020,9 @@ static int sa1100fb_resume(struct platform_device *dev)
 
 /*
  * sa1100fb_map_video_memory():
- *      Allocates the DRAM memory for the frame buffer.  This buffer is  
- *	remapped into a non-cached, non-buffered, memory region to  
- *      allow palette and pixel writes to occur without flushing the 
+ *      Allocates the DRAM memory for the frame buffer.  This buffer is
+ *	remapped into a non-cached, non-buffered, memory region to
+ *      allow palette and pixel writes to occur without flushing the
  *      cache.  Once this area is remapped, all virtual memory
  *      access to the video memory should occur at the new region.
  */
-- 
2.40.0

