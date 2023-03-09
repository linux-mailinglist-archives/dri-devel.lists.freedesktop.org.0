Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 495B26B295D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B0510E86F;
	Thu,  9 Mar 2023 16:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03D310E85E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8710522144;
 Thu,  9 Mar 2023 16:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377731; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JQIsIu55QrbMD+roUSu/pu2hXLgdTGeDRwRmg1SZaxQ=;
 b=j1bUaZro/GNGy+fk2Wz8LtwD3PwaoT3szr70HO9xRwywQmSvVc5n74ILV3zN+NPNlwkmfe
 niX/uSfACrRB2qjWrXSwhOh9PVFHWH1dwikt7bE4OJVnVIA5tGkgb0a2lZNDc0zOtqvI4i
 oIB6e6N/tEU1P6HHDnjfls8k6AW0qFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377731;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JQIsIu55QrbMD+roUSu/pu2hXLgdTGeDRwRmg1SZaxQ=;
 b=O9zGDvNLBJIyGgz1z92xgWyFir304ZwIsysIm0XE7/mCdh754FeZI3iNEFYas34k3i/1km
 l9KMuOW3SqzIEJCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 26E6A13A73;
 Thu,  9 Mar 2023 16:02:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qP+GCAMDCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 017/101] fbdev/controlfb: Remove trailing whitespaces
Date: Thu,  9 Mar 2023 17:00:37 +0100
Message-Id: <20230309160201.5163-18-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309160201.5163-1-tzimmermann@suse.de>
References: <20230309160201.5163-1-tzimmermann@suse.de>
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
 drivers/video/fbdev/controlfb.c | 34 ++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
index 77dbf94aae5f..82eeb139c4eb 100644
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -113,14 +113,14 @@ struct fb_info_control {
 	struct fb_info		info;
 	struct fb_par_control	par;
 	u32			pseudo_palette[16];
-		
+
 	struct cmap_regs	__iomem *cmap_regs;
 	unsigned long		cmap_regs_phys;
-	
+
 	struct control_regs	__iomem *control_regs;
 	unsigned long		control_regs_phys;
 	unsigned long		control_regs_size;
-	
+
 	__u8			__iomem *frame_buffer;
 	unsigned long		frame_buffer_phys;
 	unsigned long		fb_orig_base;
@@ -196,7 +196,7 @@ static void set_control_clock(unsigned char *params)
 		while (!req.complete)
 			cuda_poll();
 	}
-#endif	
+#endif
 }
 
 /*
@@ -233,19 +233,19 @@ static void control_set_hardware(struct fb_info_control *p, struct fb_par_contro
 		if (p->par.xoffset != par->xoffset ||
 		    p->par.yoffset != par->yoffset)
 			set_screen_start(par->xoffset, par->yoffset, p);
-			
+
 		return;
 	}
-	
+
 	p->par = *par;
 	cmode = p->par.cmode;
 	r = &par->regvals;
-	
+
 	/* Turn off display */
 	out_le32(CNTRL_REG(p,ctrl), 0x400 | par->ctrl);
-	
+
 	set_control_clock(r->clock_params);
-	
+
 	RADACAL_WRITE(0x20, r->radacal_ctrl);
 	RADACAL_WRITE(0x21, p->control_use_bank2 ? 0 : 1);
 	RADACAL_WRITE(0x10, 0);
@@ -254,7 +254,7 @@ static void control_set_hardware(struct fb_info_control *p, struct fb_par_contro
 	rp = &p->control_regs->vswin;
 	for (i = 0; i < 16; ++i, ++rp)
 		out_le32(&rp->r, r->regs[i]);
-	
+
 	out_le32(CNTRL_REG(p,pitch), par->pitch);
 	out_le32(CNTRL_REG(p,mode), r->mode);
 	out_le32(CNTRL_REG(p,vram_attr), p->vram_attr);
@@ -366,7 +366,7 @@ static int read_control_sense(struct fb_info_control *p)
 	sense |= (in_le32(CNTRL_REG(p,mon_sense)) & 0x180) >> 7;
 
 	out_le32(CNTRL_REG(p,mon_sense), 077);	/* turn off drivers */
-	
+
 	return sense;
 }
 
@@ -558,9 +558,9 @@ static int control_var_to_par(struct fb_var_screeninfo *var,
 static void control_par_to_var(struct fb_par_control *par, struct fb_var_screeninfo *var)
 {
 	struct control_regints *rv;
-	
+
 	rv = (struct control_regints *) par->regvals.regs;
-	
+
 	memset(var, 0, sizeof(*var));
 	var->xres = par->xres;
 	var->yres = par->yres;
@@ -568,7 +568,7 @@ static void control_par_to_var(struct fb_par_control *par, struct fb_var_screeni
 	var->yres_virtual = par->vyres;
 	var->xoffset = par->xoffset;
 	var->yoffset = par->yoffset;
-	
+
 	switch(par->cmode) {
 	default:
 	case CMODE_8:
@@ -634,7 +634,7 @@ static int controlfb_check_var (struct fb_var_screeninfo *var, struct fb_info *i
 
 	err = control_var_to_par(var, &par, info);
 	if (err)
-		return err;	
+		return err;
 	control_par_to_var(&par, var);
 
 	return 0;
@@ -655,7 +655,7 @@ static int controlfb_set_par (struct fb_info *info)
 				 " control_var_to_par: %d.\n", err);
 		return err;
 	}
-	
+
 	control_set_hardware(p, &par);
 
 	info->fix.visual = (p->par.cmode == CMODE_8) ?
@@ -840,7 +840,7 @@ static int __init init_control(struct fb_info_control *p)
 	int full, sense, vmode, cmode, vyres;
 	struct fb_var_screeninfo var;
 	int rc;
-	
+
 	printk(KERN_INFO "controlfb: ");
 
 	full = p->total_vram == 0x400000;
-- 
2.39.2

