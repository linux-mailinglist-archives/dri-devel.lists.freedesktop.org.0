Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F40B16D1C0C
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9FA10F17B;
	Fri, 31 Mar 2023 09:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4803110F17B
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:23:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EC30F1FE9C;
 Fri, 31 Mar 2023 09:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680254598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GRwXqDmX4dlzD8zvR5LebzdDxbyW3j2Av0ry2c6X1iI=;
 b=TLSUeGviweZHkRJG8eQykw+gE0hDz/bdtOPUY+DjBpFPCu6ILJCVC6mZpUmBaQNiyF0oYy
 kYelTtQhPnNJCnZkymEBmOl1HIg4Qju83vyQ0xVhJbHx1mGZYJob3U0W3GW0ofOtubP2M4
 j9LSpK5K/y7PfZUk88SYC5A90A5z/+c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680254598;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GRwXqDmX4dlzD8zvR5LebzdDxbyW3j2Av0ry2c6X1iI=;
 b=JKDYV9XVL4ojf4tsMIXqtF+8C38ZQ6DeVpneq4KRyvOqZh8fRw/2m2jF+Jm46ynpFSjG+K
 Q1e+PxeYV/evPFCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CCF6F133B6;
 Fri, 31 Mar 2023 09:23:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WIkVMYamJmTsOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 31 Mar 2023 09:23:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Subject: [PATCH 15/15] fbdev/vfb: Remove trailing whitespaces
Date: Fri, 31 Mar 2023 11:23:14 +0200
Message-Id: <20230331092314.2209-16-tzimmermann@suse.de>
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
 drivers/video/fbdev/vfb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/vfb.c b/drivers/video/fbdev/vfb.c
index 95d3c59867d0..680c88267ef4 100644
--- a/drivers/video/fbdev/vfb.c
+++ b/drivers/video/fbdev/vfb.c
@@ -110,7 +110,7 @@ static u_long get_line_length(int xres_virtual, int bpp)
      *  First part, xxxfb_check_var, must not write anything
      *  to hardware, it should only verify and adjust var.
      *  This means it doesn't alter par but it does use hardware
-     *  data from it to check this var. 
+     *  data from it to check this var.
      */
 
 static int vfb_check_var(struct fb_var_screeninfo *var,
@@ -168,7 +168,7 @@ static int vfb_check_var(struct fb_var_screeninfo *var,
 
 	/*
 	 * Now that we checked it we alter var. The reason being is that the video
-	 * mode passed in might not work but slight changes to it might make it 
+	 * mode passed in might not work but slight changes to it might make it
 	 * work. This way we let the user know what is acceptable.
 	 */
 	switch (var->bits_per_pixel) {
@@ -234,8 +234,8 @@ static int vfb_check_var(struct fb_var_screeninfo *var,
 }
 
 /* This routine actually sets the video mode. It's in here where we
- * the hardware state info->par and fix which can be affected by the 
- * change in par. For this driver it doesn't do much. 
+ * the hardware state info->par and fix which can be affected by the
+ * change in par. For this driver it doesn't do much.
  */
 static int vfb_set_par(struct fb_info *info)
 {
@@ -378,7 +378,7 @@ static int vfb_pan_display(struct fb_var_screeninfo *var,
 }
 
     /*
-     *  Most drivers don't need their own mmap function 
+     *  Most drivers don't need their own mmap function
      */
 
 static int vfb_mmap(struct fb_info *info,
-- 
2.40.0

