Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E786AC67F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 17:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD4D10E39E;
	Mon,  6 Mar 2023 16:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8224210E0D6
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 16:00:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2F29C1FED3;
 Mon,  6 Mar 2023 16:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678118454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ux309O9TgXMG2iCBc1Nlc/YxhMdiiSbk+pPPbR4+wSE=;
 b=cHlFCGgJRl+TL9ujL2GCiY/0xCP8fnBUYJtSh+N5u85Rey0kAdvey/59LQWamzYXr5LbQ9
 64remF5e5rxpYVPk1VHlnqHwlhn5OYxcOY0ne2fZY9gIYuzjgWwzdbtApSif+ojT+vYyeL
 PAC4E+rYNLhR52VmHMnE9TRvMHvm/Ug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678118454;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ux309O9TgXMG2iCBc1Nlc/YxhMdiiSbk+pPPbR4+wSE=;
 b=KwHPi0tLBMnCHIKI6wKS+3sFnrFfSJTY51Wd8T5PNQHKE2QBOm4LbnGGKiwdeSedYi2hid
 eaoDeD+BL09No/AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C620613513;
 Mon,  6 Mar 2023 16:00:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SA+XLzUOBmQ/PwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Mar 2023 16:00:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, timur@kernel.org,
 adaplas@gmail.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
 mbroemme@libmpq.org, thomas@winischhofer.net,
 James.Bottomley@HansenPartnership.com, spock@gentoo.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 geert+renesas@glider.be, corbet@lwn.net
Subject: [PATCH 78/99] fbdev/stifb: Remove trailing whitespaces
Date: Mon,  6 Mar 2023 16:59:55 +0100
Message-Id: <20230306160016.4459-79-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306160016.4459-1-tzimmermann@suse.de>
References: <20230306160016.4459-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix coding style. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/stifb.c | 156 ++++++++++++++++++------------------
 1 file changed, 78 insertions(+), 78 deletions(-)

diff --git a/drivers/video/fbdev/stifb.c b/drivers/video/fbdev/stifb.c
index 3feb6e40d56d..a151377f5b45 100644
--- a/drivers/video/fbdev/stifb.c
+++ b/drivers/video/fbdev/stifb.c
@@ -1,11 +1,11 @@
 /*
- * linux/drivers/video/stifb.c - 
- * Low level Frame buffer driver for HP workstations with 
+ * linux/drivers/video/stifb.c -
+ * Low level Frame buffer driver for HP workstations with
  * STI (standard text interface) video firmware.
  *
  * Copyright (C) 2001-2006 Helge Deller <deller@gmx.de>
  * Portions Copyright (C) 2001 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
- * 
+ *
  * Based on:
  * - linux/drivers/video/artistfb.c -- Artist frame buffer driver
  *	Copyright (C) 2000 Philipp Rumpf <prumpf@tux.org>
@@ -14,7 +14,7 @@
  * - HP Xhp cfb-based X11 window driver for XFree86
  *	(c)Copyright 1992 Hewlett-Packard Co.
  *
- * 
+ *
  *  The following graphics display devices (NGLE family) are supported by this driver:
  *
  *  HPA4070A	known as "HCRX", a 1280x1024 color device with 8 planes
@@ -30,7 +30,7 @@
  *		supports 1280x1024 color displays with 8 planes.
  *  HP710G	same as HP710C, 1280x1024 grayscale only
  *  HP710L	same as HP710C, 1024x768 color only
- *  HP712	internal graphics support on HP9000s712 SPU, supports 640x480, 
+ *  HP712	internal graphics support on HP9000s712 SPU, supports 640x480,
  *		1024x768 or 1280x1024 color displays on 8 planes (Artist)
  *
  * This file is subject to the terms and conditions of the GNU General Public
@@ -92,7 +92,7 @@ typedef struct {
 	__s32	misc_video_end;
 } video_setup_t;
 
-typedef struct {                  
+typedef struct {
 	__s16	sizeof_ngle_data;
 	__s16	x_size_visible;	    /* visible screen dim in pixels  */
 	__s16	y_size_visible;
@@ -177,10 +177,10 @@ static int __initdata stifb_bpp_pref[MAX_STI_ROMS];
 #endif /* DEBUG_STIFB_REGS */
 
 
-#define ENABLE	1	/* for enabling/disabling screen */	
+#define ENABLE	1	/* for enabling/disabling screen */
 #define DISABLE 0
 
-#define NGLE_LOCK(fb_info)	do { } while (0) 
+#define NGLE_LOCK(fb_info)	do { } while (0)
 #define NGLE_UNLOCK(fb_info)	do { } while (0)
 
 static void
@@ -198,9 +198,9 @@ SETUP_HW(struct stifb_info *fb)
 
 static void
 SETUP_FB(struct stifb_info *fb)
-{	
+{
 	unsigned int reg10_value = 0;
-	
+
 	SETUP_HW(fb);
 	switch (fb->id)
 	{
@@ -210,15 +210,15 @@ SETUP_FB(struct stifb_info *fb)
 			reg10_value = 0x13601000;
 			break;
 		case S9000_ID_A1439A:
-			if (fb->info.var.bits_per_pixel == 32)						
+			if (fb->info.var.bits_per_pixel == 32)
 				reg10_value = 0xBBA0A000;
-			else 
+			else
 				reg10_value = 0x13601000;
 			break;
 		case S9000_ID_HCRX:
 			if (fb->info.var.bits_per_pixel == 32)
 				reg10_value = 0xBBA0A000;
-			else					
+			else
 				reg10_value = 0x13602000;
 			break;
 		case S9000_ID_TIMBER:
@@ -243,7 +243,7 @@ START_IMAGE_COLORMAP_ACCESS(struct stifb_info *fb)
 }
 
 static void
-WRITE_IMAGE_COLOR(struct stifb_info *fb, int index, int color) 
+WRITE_IMAGE_COLOR(struct stifb_info *fb, int index, int color)
 {
 	SETUP_HW(fb);
 	WRITE_WORD(((0x100+index)<<2), fb, REG_3);
@@ -251,30 +251,30 @@ WRITE_IMAGE_COLOR(struct stifb_info *fb, int index, int color)
 }
 
 static void
-FINISH_IMAGE_COLORMAP_ACCESS(struct stifb_info *fb) 
-{		
+FINISH_IMAGE_COLORMAP_ACCESS(struct stifb_info *fb)
+{
 	WRITE_WORD(0x400, fb, REG_2);
 	if (fb->info.var.bits_per_pixel == 32) {
 		WRITE_WORD(0x83000100, fb, REG_1);
 	} else {
 		if (fb->id == S9000_ID_ARTIST || fb->id == CRT_ID_VISUALIZE_EG)
 			WRITE_WORD(0x80000100, fb, REG_26);
-		else							
+		else
 			WRITE_WORD(0x80000100, fb, REG_1);
 	}
 	SETUP_FB(fb);
 }
 
 static void
-SETUP_RAMDAC(struct stifb_info *fb) 
+SETUP_RAMDAC(struct stifb_info *fb)
 {
 	SETUP_HW(fb);
 	WRITE_WORD(0x04000000, fb, 0x1020);
 	WRITE_WORD(0xff000000, fb, 0x1028);
 }
 
-static void 
-CRX24_SETUP_RAMDAC(struct stifb_info *fb) 
+static void
+CRX24_SETUP_RAMDAC(struct stifb_info *fb)
 {
 	SETUP_HW(fb);
 	WRITE_WORD(0x04000000, fb, 0x1000);
@@ -286,14 +286,14 @@ CRX24_SETUP_RAMDAC(struct stifb_info *fb)
 }
 
 #if 0
-static void 
+static void
 HCRX_SETUP_RAMDAC(struct stifb_info *fb)
 {
 	WRITE_WORD(0xffffffff, fb, REG_32);
 }
 #endif
 
-static void 
+static void
 CRX24_SET_OVLY_MASK(struct stifb_info *fb)
 {
 	SETUP_HW(fb);
@@ -314,7 +314,7 @@ ENABLE_DISABLE_DISPLAY(struct stifb_info *fb, int enable)
         WRITE_WORD(value, 	fb, 0x1038);
 }
 
-static void 
+static void
 CRX24_ENABLE_DISABLE_DISPLAY(struct stifb_info *fb, int enable)
 {
 	unsigned int value = enable ? 0x10000000 : 0x30000000;
@@ -325,11 +325,11 @@ CRX24_ENABLE_DISABLE_DISPLAY(struct stifb_info *fb, int enable)
 }
 
 static void
-ARTIST_ENABLE_DISABLE_DISPLAY(struct stifb_info *fb, int enable) 
+ARTIST_ENABLE_DISABLE_DISPLAY(struct stifb_info *fb, int enable)
 {
 	u32 DregsMiscVideo = REG_21;
 	u32 DregsMiscCtl = REG_27;
-	
+
 	SETUP_HW(fb);
 	if (enable) {
 	  WRITE_WORD(READ_WORD(fb, DregsMiscVideo) | 0x0A000000, fb, DregsMiscVideo);
@@ -344,7 +344,7 @@ ARTIST_ENABLE_DISABLE_DISPLAY(struct stifb_info *fb, int enable)
 	(READ_BYTE(fb, REG_16b3) - 1)
 
 #define HYPER_CONFIG_PLANES_24 0x00000100
-	
+
 #define IS_24_DEVICE(fb) \
 	(fb->deviceSpecificConfig & HYPER_CONFIG_PLANES_24)
 
@@ -470,15 +470,15 @@ SETUP_ATTR_ACCESS(struct stifb_info *fb, unsigned BufferNumber)
 }
 
 static void
-SET_ATTR_SIZE(struct stifb_info *fb, int width, int height) 
+SET_ATTR_SIZE(struct stifb_info *fb, int width, int height)
 {
-	/* REG_6 seems to have special values when run on a 
+	/* REG_6 seems to have special values when run on a
 	   RDI precisionbook parisc laptop (INTERNAL_EG_DX1024 or
 	   INTERNAL_EG_X1024).  The values are:
 		0x2f0: internal (LCD) & external display enabled
 		0x2a0: external display only
 		0x000: zero on standard artist graphic cards
-	*/ 
+	*/
 	WRITE_WORD(0x00000000, fb, REG_6);
 	WRITE_WORD((width<<16) | height, fb, REG_9);
 	WRITE_WORD(0x05000000, fb, REG_6);
@@ -486,7 +486,7 @@ SET_ATTR_SIZE(struct stifb_info *fb, int width, int height)
 }
 
 static void
-FINISH_ATTR_ACCESS(struct stifb_info *fb) 
+FINISH_ATTR_ACCESS(struct stifb_info *fb)
 {
 	SETUP_HW(fb);
 	WRITE_WORD(0x00000000, fb, REG_12);
@@ -499,7 +499,7 @@ elkSetupPlanes(struct stifb_info *fb)
 	SETUP_FB(fb);
 }
 
-static void 
+static void
 ngleSetupAttrPlanes(struct stifb_info *fb, int BufferNumber)
 {
 	SETUP_ATTR_ACCESS(fb, BufferNumber);
@@ -519,7 +519,7 @@ rattlerSetupPlanes(struct stifb_info *fb)
 	 * read mask register for overlay planes, not image planes).
 	 */
 	CRX24_SETUP_RAMDAC(fb);
-    
+
 	/* change fb->id temporarily to fool SETUP_FB() */
 	saved_id = fb->id;
 	fb->id = CRX24_OVERLAY_PLANES;
@@ -565,7 +565,7 @@ setNgleLutBltCtl(struct stifb_info *fb, int offsetWithinLut, int length)
 	lutBltCtl.all           = 0x80000000;
 	lutBltCtl.fields.length = length;
 
-	switch (fb->id) 
+	switch (fb->id)
 	{
 	case S9000_ID_A1439A:		/* CRX24 */
 		if (fb->var.bits_per_pixel == 8) {
@@ -576,12 +576,12 @@ setNgleLutBltCtl(struct stifb_info *fb, int offsetWithinLut, int length)
 			lutBltCtl.fields.lutOffset = 0 * 256;
 		}
 		break;
-		
+
 	case S9000_ID_ARTIST:
 		lutBltCtl.fields.lutType = NGLE_CMAP_INDEXED0_TYPE;
 		lutBltCtl.fields.lutOffset = 0 * 256;
 		break;
-		
+
 	default:
 		lutBltCtl.fields.lutType = NGLE_CMAP_INDEXED0_TYPE;
 		lutBltCtl.fields.lutOffset = 0;
@@ -596,7 +596,7 @@ setNgleLutBltCtl(struct stifb_info *fb, int offsetWithinLut, int length)
 #endif
 
 static NgleLutBltCtl
-setHyperLutBltCtl(struct stifb_info *fb, int offsetWithinLut, int length) 
+setHyperLutBltCtl(struct stifb_info *fb, int offsetWithinLut, int length)
 {
 	NgleLutBltCtl lutBltCtl;
 
@@ -633,7 +633,7 @@ static void hyperUndoITE(struct stifb_info *fb)
 
 	/* Hardware setup for full-depth write to "magic" location */
 	GET_FIFO_SLOTS(fb, nFreeFifoSlots, 7);
-	NGLE_QUICK_SET_DST_BM_ACCESS(fb, 
+	NGLE_QUICK_SET_DST_BM_ACCESS(fb,
 		BA(IndexedDcd, Otc04, Ots08, AddrLong,
 		BAJustPoint(0), BINovly, BAIndexBase(0)));
 	NGLE_QUICK_SET_IMAGE_BITMAP_OP(fb,
@@ -653,13 +653,13 @@ static void hyperUndoITE(struct stifb_info *fb)
 	NGLE_UNLOCK(fb);
 }
 
-static void 
+static void
 ngleDepth8_ClearImagePlanes(struct stifb_info *fb)
 {
 	/* FIXME! */
 }
 
-static void 
+static void
 ngleDepth24_ClearImagePlanes(struct stifb_info *fb)
 {
 	/* FIXME! */
@@ -675,7 +675,7 @@ ngleResetAttrPlanes(struct stifb_info *fb, unsigned int ctlPlaneReg)
 	NGLE_LOCK(fb);
 
 	GET_FIFO_SLOTS(fb, nFreeFifoSlots, 4);
-	NGLE_QUICK_SET_DST_BM_ACCESS(fb, 
+	NGLE_QUICK_SET_DST_BM_ACCESS(fb,
 				     BA(IndexedDcd, Otc32, OtsIndirect,
 					AddrLong, BAJustPoint(0),
 					BINattr, BAIndexBase(0)));
@@ -713,22 +713,22 @@ ngleResetAttrPlanes(struct stifb_info *fb, unsigned int ctlPlaneReg)
 	/**** Finally, set the Control Plane Register back to zero: ****/
 	GET_FIFO_SLOTS(fb, nFreeFifoSlots, 1);
 	NGLE_QUICK_SET_CTL_PLN_REG(fb, 0);
-	
+
 	NGLE_UNLOCK(fb);
 }
-    
+
 static void
 ngleClearOverlayPlanes(struct stifb_info *fb, int mask, int data)
 {
 	int nFreeFifoSlots = 0;
 	u32 packed_dst;
 	u32 packed_len;
-    
+
 	NGLE_LOCK(fb);
 
 	/* Hardware setup */
 	GET_FIFO_SLOTS(fb, nFreeFifoSlots, 8);
-	NGLE_QUICK_SET_DST_BM_ACCESS(fb, 
+	NGLE_QUICK_SET_DST_BM_ACCESS(fb,
 				     BA(IndexedDcd, Otc04, Ots08, AddrLong,
 					BAJustPoint(0), BINovly, BAIndexBase(0)));
 
@@ -736,23 +736,23 @@ ngleClearOverlayPlanes(struct stifb_info *fb, int mask, int data)
 
         NGLE_REALLY_SET_IMAGE_FG_COLOR(fb, data);
         NGLE_REALLY_SET_IMAGE_PLANEMASK(fb, mask);
-    
+
         packed_dst = 0;
         packed_len = (fb->info.var.xres << 16) | fb->info.var.yres;
         NGLE_SET_DSTXY(fb, packed_dst);
-    
-        /* Write zeroes to overlay planes */		       
+
+        /* Write zeroes to overlay planes */
 	NGLE_QUICK_SET_IMAGE_BITMAP_OP(fb,
 				       IBOvals(RopSrc, MaskAddrOffset(0),
 					       BitmapExtent08, StaticReg(0),
 					       DataDynamic, MaskOtc, BGx(0), FGx(0)));
-		       
+
         SET_LENXY_START_RECFILL(fb, packed_len);
 
 	NGLE_UNLOCK(fb);
 }
 
-static void 
+static void
 hyperResetPlanes(struct stifb_info *fb, int enable)
 {
 	unsigned int controlPlaneReg;
@@ -783,7 +783,7 @@ hyperResetPlanes(struct stifb_info *fb, int enable)
 	        ngleClearOverlayPlanes(fb, 0xff, 255);
 
 		/**************************************************
-		 ** Also need to counteract ITE settings 
+		 ** Also need to counteract ITE settings
 		 **************************************************/
 		hyperUndoITE(fb);
 		break;
@@ -803,13 +803,13 @@ hyperResetPlanes(struct stifb_info *fb, int enable)
 		ngleResetAttrPlanes(fb, controlPlaneReg);
 		break;
     	}
-	
+
 	NGLE_UNLOCK(fb);
 }
 
 /* Return pointer to in-memory structure holding ELK device-dependent ROM values. */
 
-static void 
+static void
 ngleGetDeviceRomData(struct stifb_info *fb)
 {
 #if 0
@@ -821,7 +821,7 @@ XXX: FIXME: !!!
 	char	*pCard8;
 	int	i;
 	char	*mapOrigin = NULL;
-    
+
 	int romTableIdx;
 
 	pPackedDevRomData = fb->ngle_rom;
@@ -888,7 +888,7 @@ SETUP_HCRX(struct stifb_info *fb)
 
 	/* Initialize Hyperbowl registers */
 	GET_FIFO_SLOTS(fb, nFreeFifoSlots, 7);
-	
+
 	if (IS_24_DEVICE(fb)) {
 		hyperbowl = (fb->info.var.bits_per_pixel == 32) ?
 			HYPERBOWL_MODE01_8_24_LUT0_TRANSPARENT_LUT1_OPAQUE :
@@ -897,9 +897,9 @@ SETUP_HCRX(struct stifb_info *fb)
 		/* First write to Hyperbowl must happen twice (bug) */
 		WRITE_WORD(hyperbowl, fb, REG_40);
 		WRITE_WORD(hyperbowl, fb, REG_40);
-		
+
 		WRITE_WORD(HYPERBOWL_MODE2_8_24, fb, REG_39);
-		
+
 		WRITE_WORD(0x014c0148, fb, REG_42); /* Set lut 0 to be the direct color */
 		WRITE_WORD(0x404c4048, fb, REG_43);
 		WRITE_WORD(0x034c0348, fb, REG_44);
@@ -968,7 +968,7 @@ stifb_setcolreg(u_int regno, u_int red, u_int green,
 				0,	/* Offset w/i LUT */
 				256);	/* Load entire LUT */
 		NGLE_BINC_SET_SRCADDR(fb,
-				NGLE_LONG_FB_ADDRESS(0, 0x100, 0)); 
+				NGLE_LONG_FB_ADDRESS(0, 0x100, 0));
 				/* 0x100 is same as used in WRITE_IMAGE_COLOR() */
 		START_COLORMAPLOAD(fb, lutBltCtl.all);
 		SETUP_FB(fb);
@@ -1006,7 +1006,7 @@ stifb_blank(int blank_mode, struct fb_info *info)
 		ENABLE_DISABLE_DISPLAY(fb, enable);
 		break;
 	}
-	
+
 	SETUP_FB(fb);
 	return 0;
 }
@@ -1092,15 +1092,15 @@ stifb_init_display(struct stifb_info *fb)
 
 	/* HCRX specific initialization */
 	SETUP_HCRX(fb);
-	
+
 	/*
 	if (id == S9000_ID_HCRX)
 		hyperInitSprite(fb);
 	else
 		ngleInitSprite(fb);
 	*/
-	
-	/* Initialize the image planes. */ 
+
+	/* Initialize the image planes. */
         switch (id) {
 	 case S9000_ID_HCRX:
 	    hyperResetPlanes(fb, ENABLE);
@@ -1170,7 +1170,7 @@ static int __init stifb_init_fb(struct sti_struct *sti, int bpp_pref)
 	fb = kzalloc(sizeof(*fb), GFP_ATOMIC);
 	if (!fb)
 		return -ENOMEM;
-	
+
 	info = &fb->info;
 
 	/* set struct to a known state */
@@ -1211,7 +1211,7 @@ static int __init stifb_init_fb(struct sti_struct *sti, int bpp_pref)
 			dev_name, fb->id);
 		goto out_err0;
 	}
-	
+
 	/* default to 8 bpp on most graphic chips */
 	bpp = 8;
 	xres = sti_onscreen_x(fb->sti);
@@ -1232,7 +1232,7 @@ static int __init stifb_init_fb(struct sti_struct *sti, int bpp_pref)
 		fb->id = S9000_ID_A1659A;
 		break;
 	case S9000_ID_TIMBER:	/* HP9000/710 Any (may be a grayscale device) */
-		if (strstr(dev_name, "GRAYSCALE") || 
+		if (strstr(dev_name, "GRAYSCALE") ||
 		    strstr(dev_name, "Grayscale") ||
 		    strstr(dev_name, "grayscale"))
 			var->grayscale = 1;
@@ -1271,16 +1271,16 @@ static int __init stifb_init_fb(struct sti_struct *sti, int bpp_pref)
 	case CRT_ID_VISUALIZE_EG:
 	case S9000_ID_ARTIST:	/* Artist */
 		break;
-	default: 
+	default:
 #ifdef FALLBACK_TO_1BPP
-	       	printk(KERN_WARNING 
+	       	printk(KERN_WARNING
 			"stifb: Unsupported graphics card (id=0x%08x) "
 				"- now trying 1bpp mode instead\n",
 			fb->id);
 		bpp = 1;	/* default to 1 bpp */
 		break;
 #else
-	       	printk(KERN_WARNING 
+	       	printk(KERN_WARNING
 			"stifb: Unsupported graphics card (id=0x%08x) "
 				"- skipping.\n",
 			fb->id);
@@ -1296,11 +1296,11 @@ static int __init stifb_init_fb(struct sti_struct *sti, int bpp_pref)
 	fix->line_length = (fb->sti->glob_cfg->total_x * bpp) / 8;
 	if (!fix->line_length)
 		fix->line_length = 2048; /* default */
-	
+
 	/* limit fbsize to max visible screen size */
 	if (fix->smem_len > yres*fix->line_length)
 		fix->smem_len = ALIGN(yres*fix->line_length, 4*1024*1024);
-	
+
 	fix->accel = FB_ACCEL_NONE;
 
 	switch (bpp) {
@@ -1326,7 +1326,7 @@ static int __init stifb_init_fb(struct sti_struct *sti, int bpp_pref)
 	    default:
 		break;
 	}
-	
+
 	var->xres = var->xres_virtual = xres;
 	var->yres = var->yres_virtual = yres;
 	var->bits_per_pixel = bpp;
@@ -1352,7 +1352,7 @@ static int __init stifb_init_fb(struct sti_struct *sti, int bpp_pref)
 				fix->smem_start, fix->smem_start+fix->smem_len);
 		goto out_err2;
 	}
-		
+
 	if (!request_mem_region(fix->mmio_start, fix->mmio_len, "stifb mmio")) {
 		printk(KERN_ERR "stifb: cannot reserve sti mmio region 0x%04lx-0x%04lx\n",
 				fix->mmio_start, fix->mmio_start+fix->mmio_len);
@@ -1366,11 +1366,11 @@ static int __init stifb_init_fb(struct sti_struct *sti, int bpp_pref)
 
 	fb_info(&fb->info, "%s %dx%d-%d frame buffer device, %s, id: %04x, mmio: 0x%04lx\n",
 		fix->id,
-		var->xres, 
+		var->xres,
 		var->yres,
 		var->bits_per_pixel,
 		dev_name,
-		fb->id, 
+		fb->id,
 		fix->mmio_start);
 
 	return 0;
@@ -1399,7 +1399,7 @@ static int __init stifb_init(void)
 	struct sti_struct *sti;
 	struct sti_struct *def_sti;
 	int i;
-	
+
 #ifndef MODULE
 	char *option = NULL;
 
@@ -1411,7 +1411,7 @@ static int __init stifb_init(void)
 		printk(KERN_INFO "stifb: disabled by \"stifb=off\" kernel parameter\n");
 		return -ENXIO;
 	}
-	
+
 	def_sti = sti_get_rom(0);
 	if (def_sti) {
 		for (i = 1; i <= MAX_STI_ROMS; i++) {
@@ -1445,7 +1445,7 @@ stifb_cleanup(void)
 {
 	struct sti_struct *sti;
 	int i;
-	
+
 	for (i = 1; i <= MAX_STI_ROMS; i++) {
 		sti = sti_get_rom(i);
 		if (!sti)
@@ -1468,10 +1468,10 @@ int __init
 stifb_setup(char *options)
 {
 	int i;
-	
+
 	if (!options || !*options)
 		return 1;
-	
+
 	if (strncmp(options, "off", 3) == 0) {
 		stifb_disabled = 1;
 		options += 3;
-- 
2.39.2

