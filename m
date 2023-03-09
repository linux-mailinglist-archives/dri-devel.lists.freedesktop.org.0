Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F70A6B294F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:02:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0AF10E038;
	Thu,  9 Mar 2023 16:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D791110E038
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 46A7722146;
 Thu,  9 Mar 2023 16:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b6D8FQBTb2yaZRkjP/3Zmj8yOkLU5mYNE2Q1swliLUA=;
 b=wUHZNCYoMsbJ3mTnwSWHOyd/Q7JcnrlOz3m8Af3LxaC8cQ+FHtBO4/CE+bLsegTKX9IWGT
 HqIEV7AuFFOrTdmersz2nNxeKzzas1FD4DEB1mIODP/wwOn7dUBFSajp2/DgiH4lt9JhVM
 l60Rbw8VYe9gEG9Vjln9r3rbtyVEY+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377725;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b6D8FQBTb2yaZRkjP/3Zmj8yOkLU5mYNE2Q1swliLUA=;
 b=z2KN9D1vGDa+RWJlNGjXhDJrWkdw1OShlOpg8FPT5T7j2jQE3UFelAaNCvkplEQykIfSTM
 aUpGgoQb4AyS2MCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D8DD013A79;
 Thu,  9 Mar 2023 16:02:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WOP0M/wCCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 002/101] fbdev/68328fb: Remove trailing whitespaces
Date: Thu,  9 Mar 2023 17:00:22 +0100
Message-Id: <20230309160201.5163-3-tzimmermann@suse.de>
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
 drivers/video/fbdev/68328fb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/68328fb.c b/drivers/video/fbdev/68328fb.c
index 7db03ed77c76..7fe56ecbe4e6 100644
--- a/drivers/video/fbdev/68328fb.c
+++ b/drivers/video/fbdev/68328fb.c
@@ -123,7 +123,7 @@ static u_long get_line_length(int xres_virtual, int bpp)
      *  First part, xxxfb_check_var, must not write anything
      *  to hardware, it should only verify and adjust var.
      *  This means it doesn't alter par but it does use hardware
-     *  data from it to check this var. 
+     *  data from it to check this var.
      */
 
 static int mc68x328fb_check_var(struct fb_var_screeninfo *var,
@@ -181,7 +181,7 @@ static int mc68x328fb_check_var(struct fb_var_screeninfo *var,
 
 	/*
 	 * Now that we checked it we alter var. The reason being is that the video
-	 * mode passed in might not work but slight changes to it might make it 
+	 * mode passed in might not work but slight changes to it might make it
 	 * work. This way we let the user know what is acceptable.
 	 */
 	switch (var->bits_per_pixel) {
@@ -256,8 +256,8 @@ static int mc68x328fb_check_var(struct fb_var_screeninfo *var,
 }
 
 /* This routine actually sets the video mode. It's in here where we
- * the hardware state info->par and fix which can be affected by the 
- * change in par. For this driver it doesn't do much. 
+ * the hardware state info->par and fix which can be affected by the
+ * change in par. For this driver it doesn't do much.
  */
 static int mc68x328fb_set_par(struct fb_info *info)
 {
@@ -294,7 +294,7 @@ static int mc68x328fb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
 	 *   {hardwarespecific} contains width of RAMDAC
 	 *   cmap[X] is programmed to (X << red.offset) | (X << green.offset) | (X << blue.offset)
 	 *   RAMDAC[X] is programmed to (red, green, blue)
-	 * 
+	 *
 	 * Pseudocolor:
 	 *    uses offset = 0 && length = RAMDAC register width.
 	 *    var->{color}.offset is 0
@@ -383,7 +383,7 @@ static int mc68x328fb_pan_display(struct fb_var_screeninfo *var,
 }
 
     /*
-     *  Most drivers don't need their own mmap function 
+     *  Most drivers don't need their own mmap function
      */
 
 static int mc68x328fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
-- 
2.39.2

