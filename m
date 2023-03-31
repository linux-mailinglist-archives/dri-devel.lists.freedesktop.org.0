Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1D06D1C05
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D3510F169;
	Fri, 31 Mar 2023 09:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737DE10F137
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:23:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B1D4A1FE96;
 Fri, 31 Mar 2023 09:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680254596; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Tabfd7e/Ntkw4i7UZRlapjalgZa7F0HjC0jz39mMqg=;
 b=jQ7z07waxkXrp6v6g+eyh2t8zAsBYzeERYj9gnFkqFD0x9d2IMG7ixy55fF1DL/2uHDi3q
 aNxo7VtDbiJJp9MEe4fQZU6diLYGvEMJvC9aKUZxkLcOK75onZqeYzaL0GC8PgHYfTe6kX
 GWGxLPCXSvXbPvx1E53pZb3Q2uCU9Zc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680254596;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Tabfd7e/Ntkw4i7UZRlapjalgZa7F0HjC0jz39mMqg=;
 b=V+NojafnfORGyDk+x+MdKf+m8B9/hf1oT4rCQg6qaujDB432cCxCChotAFI0GEeBWknjyv
 93yyd0rqif9gZjBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 969BC13A0E;
 Fri, 31 Mar 2023 09:23:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ODbSI4SmJmTsOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 31 Mar 2023 09:23:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Subject: [PATCH 01/15] fbdev/68328fb: Remove trailing whitespaces
Date: Fri, 31 Mar 2023 11:23:00 +0200
Message-Id: <20230331092314.2209-2-tzimmermann@suse.de>
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
 drivers/video/fbdev/68328fb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/68328fb.c b/drivers/video/fbdev/68328fb.c
index 41df61b37a18..ef49cdfb7dd2 100644
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
2.40.0

