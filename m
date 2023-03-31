Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BC36D1C0A
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE3B10F165;
	Fri, 31 Mar 2023 09:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3D210F171
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:23:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5BD0021B2D;
 Fri, 31 Mar 2023 09:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680254598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kUutB7c9k7a1NXDOgSvnLMbyYGu8O5cedlty1f8jiEI=;
 b=Zy6Sg/NB6bR0ogPyPiNOC/Rrg0AuAtWJci6eyO43xZI5sZib+jXI9YnJFI/haTzDfHSJ7H
 apVsTaSN2skpbW00uLY6wIqH4VebIbpbGwYYOlYw2bvwuA/MgXlp0F9AwrSs+uTE2g+GMI
 62SyRwm416DmzbY8kcJFSI7yzJhyXCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680254598;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kUutB7c9k7a1NXDOgSvnLMbyYGu8O5cedlty1f8jiEI=;
 b=PeQFxYid7U7fLGe8PNvWX6eqXZ2f0HZwd2B/midL3gY/M1xH4RH+bAE00bm5bpYVfyrywv
 ySTF2jOdj7PE2pCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 429D0133B6;
 Fri, 31 Mar 2023 09:23:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aBp9D4amJmTsOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 31 Mar 2023 09:23:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Subject: [PATCH 11/15] fbdev/platinumfb: Remove trailing whitespaces
Date: Fri, 31 Mar 2023 11:23:10 +0200
Message-Id: <20230331092314.2209-12-tzimmermann@suse.de>
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
Acked-by: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/platinumfb.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/video/fbdev/platinumfb.c b/drivers/video/fbdev/platinumfb.c
index 5b9e26ea6449..c7172174c1b7 100644
--- a/drivers/video/fbdev/platinumfb.c
+++ b/drivers/video/fbdev/platinumfb.c
@@ -52,17 +52,17 @@ struct fb_info_platinum {
 		__u8 red, green, blue;
 	}				palette[256];
 	u32				pseudo_palette[16];
-	
+
 	volatile struct cmap_regs	__iomem *cmap_regs;
 	unsigned long			cmap_regs_phys;
-	
+
 	volatile struct platinum_regs	__iomem *platinum_regs;
 	unsigned long			platinum_regs_phys;
-	
+
 	__u8				__iomem *frame_buffer;
 	volatile __u8			__iomem *base_frame_buffer;
 	unsigned long			frame_buffer_phys;
-	
+
 	unsigned long			total_vram;
 	int				clktype;
 	int				dactype;
@@ -133,7 +133,7 @@ static int platinumfb_set_par (struct fb_info *info)
 	platinum_set_hardware(pinfo);
 
 	init = platinum_reg_init[pinfo->vmode-1];
-	
+
  	if ((pinfo->vmode == VMODE_832_624_75) && (pinfo->cmode > CMODE_8))
   		offset = 0x10;
 
@@ -214,7 +214,7 @@ static int platinumfb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
 			break;
 		}
 	}
-	
+
 	return 0;
 }
 
@@ -269,7 +269,7 @@ static void platinum_set_hardware(struct fb_info_platinum *pinfo)
 	struct platinum_regvals		*init;
 	int				i;
 	int				vmode, cmode;
-	
+
 	vmode = pinfo->vmode;
 	cmode = pinfo->cmode;
 
@@ -436,7 +436,7 @@ static int read_platinum_sense(struct fb_info_platinum *info)
  * This routine takes a user-supplied var, and picks the best vmode/cmode from it.
  * It also updates the var structure to the actual mode data obtained
  */
-static int platinum_var_to_par(struct fb_var_screeninfo *var, 
+static int platinum_var_to_par(struct fb_var_screeninfo *var,
 			       struct fb_info_platinum *pinfo,
 			       int check_only)
 {
@@ -478,12 +478,12 @@ static int platinum_var_to_par(struct fb_var_screeninfo *var,
 	pinfo->yoffset = 0;
 	pinfo->vxres = pinfo->xres;
 	pinfo->vyres = pinfo->yres;
-	
+
 	return 0;
 }
 
 
-/* 
+/*
  * Parse user specified options (`video=platinumfb:')
  */
 static int __init platinumfb_setup(char *options)
@@ -624,7 +624,7 @@ static int platinumfb_probe(struct platform_device* odev)
 		break;
 	}
 	dev_set_drvdata(&odev->dev, info);
-	
+
 	rc = platinum_init_fb(info);
 	if (rc != 0) {
 		iounmap(pinfo->frame_buffer);
@@ -640,9 +640,9 @@ static int platinumfb_remove(struct platform_device* odev)
 {
 	struct fb_info		*info = dev_get_drvdata(&odev->dev);
 	struct fb_info_platinum	*pinfo = info->par;
-	
+
         unregister_framebuffer (info);
-	
+
 	/* Unmap frame buffer and registers */
 	iounmap(pinfo->frame_buffer);
 	iounmap(pinfo->platinum_regs);
@@ -658,7 +658,7 @@ static int platinumfb_remove(struct platform_device* odev)
 	return 0;
 }
 
-static struct of_device_id platinumfb_match[] = 
+static struct of_device_id platinumfb_match[] =
 {
 	{
 	.name 		= "platinum",
@@ -666,7 +666,7 @@ static struct of_device_id platinumfb_match[] =
 	{},
 };
 
-static struct platform_driver platinum_driver = 
+static struct platform_driver platinum_driver =
 {
 	.driver = {
 		.name = "platinumfb",
-- 
2.40.0

