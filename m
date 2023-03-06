Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D9A6AC707
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 17:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B264510E3E6;
	Mon,  6 Mar 2023 16:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430CC10E0D6
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 16:01:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 05B3022453;
 Mon,  6 Mar 2023 16:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678118459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zyH/0IPG9qUaFYsN9w/QwcLQQulAY9+Gu12kUrvFX8w=;
 b=nzzELS/KQ0f6PvEQbk7fKZU3Y+4WfDd83yEc40+/ngpNxQpZOIm8c5q0e8Cj4WzSlC/rtB
 uw4l5bT1ZzAH/W2ck1C5xYGw/vv1Zfe+pwLWUfn/ih3ntES1D8BEkrl3g3Y38s5KPBw9sM
 9bd6s35PfzhrKiiEMKaWgNAuvN2l/7k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678118459;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zyH/0IPG9qUaFYsN9w/QwcLQQulAY9+Gu12kUrvFX8w=;
 b=Q+mU012QejaFFGb/sGL0VqoWftCSR5rJZ4XsoEL6CYGcoC32Igf/Yo/D4rZtN56zwXJPa0
 +1o+Jy6gZqy4IFAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8BA7913513;
 Mon,  6 Mar 2023 16:00:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aM/eIDoOBmQ/PwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Mar 2023 16:00:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, timur@kernel.org,
 adaplas@gmail.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
 mbroemme@libmpq.org, thomas@winischhofer.net,
 James.Bottomley@HansenPartnership.com, spock@gentoo.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 geert+renesas@glider.be, corbet@lwn.net
Subject: [PATCH 89/99] fbdev/valkyriefb: Remove trailing whitespaces
Date: Mon,  6 Mar 2023 17:00:06 +0100
Message-Id: <20230306160016.4459-90-tzimmermann@suse.de>
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
 drivers/video/fbdev/valkyriefb.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/valkyriefb.c b/drivers/video/fbdev/valkyriefb.c
index 1007023a5e88..b166b7cfe0e5 100644
--- a/drivers/video/fbdev/valkyriefb.c
+++ b/drivers/video/fbdev/valkyriefb.c
@@ -1,7 +1,7 @@
 /*
  *  valkyriefb.c -- frame buffer device for the PowerMac 'valkyrie' display
  *
- *  Created 8 August 1998 by 
+ *  Created 8 August 1998 by
  *  Martin Costabel <costabel@wanadoo.fr> and Kevin Schoedel
  *
  *  Vmode-switching changes and vmode 15/17 modifications created 29 August
@@ -77,13 +77,13 @@ struct fb_info_valkyrie {
 	struct fb_par_valkyrie	par;
 	struct cmap_regs	__iomem *cmap_regs;
 	unsigned long		cmap_regs_phys;
-	
+
 	struct valkyrie_regs	__iomem *valkyrie_regs;
 	unsigned long		valkyrie_regs_phys;
-	
+
 	__u8			__iomem *frame_buffer;
 	unsigned long		frame_buffer_phys;
-	
+
 	int			sense;
 	unsigned long		total_vram;
 
@@ -244,7 +244,7 @@ static inline int valkyrie_vram_reqd(int video_mode, int color_mode)
 {
 	int pitch;
 	struct valkyrie_regvals *init = valkyrie_reg_init[video_mode-1];
-	
+
 	if ((pitch = init->pitch[color_mode]) == 0)
 		pitch = 2 * init->pitch[0];
 	return init->vres * pitch;
@@ -467,7 +467,7 @@ static int valkyrie_var_to_par(struct fb_var_screeninfo *var,
 		printk(KERN_ERR "valkyriefb: vmode %d not valid.\n", vmode);
 		return -EINVAL;
 	}
-	
+
 	if (cmode != CMODE_8 && cmode != CMODE_16) {
 		printk(KERN_ERR "valkyriefb: cmode %d not valid.\n", cmode);
 		return -EINVAL;
@@ -516,7 +516,7 @@ static void valkyrie_init_fix(struct fb_fix_screeninfo *fix, struct fb_info_valk
 	fix->ywrapstep = 0;
 	fix->ypanstep = 0;
 	fix->xpanstep = 0;
-	
+
 }
 
 /* Fix must already be inited above */
-- 
2.39.2

