Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56301650FD8
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 17:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A967C10E2CF;
	Mon, 19 Dec 2022 16:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2033B10E2B8;
 Mon, 19 Dec 2022 16:05:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BFC7C60F21;
 Mon, 19 Dec 2022 16:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671465918; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0aR/7zFFg6opL9Sswet7ilYlrwEicNIovKojH/nmoWY=;
 b=bGEDJKn4Nwf6TsCbG2/dCdacpEPM1FAG+frz2BSnI0hzyfybAerHTKemiCgf9kfdtlZIM1
 rnX4VyKXFRrqi33on7Ci/RbaKdebTLAtjrIpsf0bAXKZwNS18VSKcLo3XcqpwumY/sESoY
 ETmo/ogos0cAGYArM4ar9DBb0ic8N8I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671465918;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0aR/7zFFg6opL9Sswet7ilYlrwEicNIovKojH/nmoWY=;
 b=hLadcWTjfhJunbRRm9pANWRI7ofUt7yf9j+g+bFlaED6UhkD3EaREXKJiv1PajaAbRL4ac
 Y6/HVNbxpcwj+OBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 87D8F13911;
 Mon, 19 Dec 2022 16:05:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qGT7H76LoGPeZwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Dec 2022 16:05:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH 01/18] fbcon: Remove trailing whitespaces
Date: Mon, 19 Dec 2022 17:04:59 +0100
Message-Id: <20221219160516.23436-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221219160516.23436-1-tzimmermann@suse.de>
References: <20221219160516.23436-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix coding style. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fbcon.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index c0143d38df83..500b26d652f6 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -26,7 +26,7 @@
  *
  *  Hardware cursor support added by Emmanuel Marty (core@ggi-project.org)
  *  Smart redraw scrolling, arbitrary font width support, 512char font support
- *  and software scrollback added by 
+ *  and software scrollback added by
  *                         Jakub Jelinek (jj@ultra.linux.cz)
  *
  *  Random hacking by Martin Mares <mj@ucw.cz>
@@ -127,7 +127,7 @@ static int logo_shown = FBCON_LOGO_CANSHOW;
 /* console mappings */
 static unsigned int first_fb_vc;
 static unsigned int last_fb_vc = MAX_NR_CONSOLES - 1;
-static int fbcon_is_default = 1; 
+static int fbcon_is_default = 1;
 static int primary_device = -1;
 static int fbcon_has_console_bind;
 
@@ -415,12 +415,12 @@ static int __init fb_console_setup(char *this_opt)
 			strscpy(fontname, options + 5, sizeof(fontname));
 			continue;
 		}
-		
+
 		if (!strncmp(options, "scrollback:", 11)) {
 			pr_warn("Ignoring scrollback size option\n");
 			continue;
 		}
-		
+
 		if (!strncmp(options, "map:", 4)) {
 			options += 4;
 			if (*options) {
@@ -446,7 +446,7 @@ static int __init fb_console_setup(char *this_opt)
 				last_fb_vc = simple_strtoul(options, &options, 10) - 1;
 			if (last_fb_vc < first_fb_vc || last_fb_vc >= MAX_NR_CONSOLES)
 				last_fb_vc = MAX_NR_CONSOLES - 1;
-			fbcon_is_default = 0; 
+			fbcon_is_default = 0;
 			continue;
 		}
 
@@ -940,7 +940,7 @@ static const char *fbcon_startup(void)
 	info = fbcon_registered_fb[info_idx];
 	if (!info)
 		return NULL;
-	
+
 	if (fbcon_open(info))
 		return NULL;
 
@@ -1999,7 +1999,7 @@ static void updatescrollmode(struct fbcon_display *p,
 #define PITCH(w) (((w) + 7) >> 3)
 #define CALC_FONTSZ(h, p, c) ((h) * (p) * (c)) /* size = height * pitch * charcount */
 
-static int fbcon_resize(struct vc_data *vc, unsigned int width, 
+static int fbcon_resize(struct vc_data *vc, unsigned int width,
 			unsigned int height, unsigned int user)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
@@ -2174,7 +2174,7 @@ static int fbcon_switch(struct vc_data *vc)
 	    ops->update_start(info);
 	}
 
-	fbcon_set_palette(vc, color_table); 	
+	fbcon_set_palette(vc, color_table);
 	fbcon_clear_margins(vc, 0);
 
 	if (logo_shown == FBCON_LOGO_DRAW) {
@@ -2343,7 +2343,7 @@ static void set_vc_hi_font(struct vc_data *vc, bool set)
 			vc->vc_complement_mask >>= 1;
 			vc->vc_s_complement_mask >>= 1;
 		}
-			
+
 		/* ++Edmund: reorder the attribute bits */
 		if (vc->vc_can_do_color) {
 			unsigned short *cp =
@@ -2366,7 +2366,7 @@ static void set_vc_hi_font(struct vc_data *vc, bool set)
 			vc->vc_complement_mask <<= 1;
 			vc->vc_s_complement_mask <<= 1;
 		}
-			
+
 		/* ++Edmund: reorder the attribute bits */
 		{
 			unsigned short *cp =
@@ -2527,7 +2527,7 @@ static int fbcon_set_font(struct vc_data *vc, struct console_font *font,
 	/* Check if the same font is on some other console already */
 	for (i = first_fb_vc; i <= last_fb_vc; i++) {
 		struct vc_data *tmp = vc_cons[i].d;
-		
+
 		if (fb_display[i].userfont &&
 		    fb_display[i].fontdata &&
 		    FNTSUM(fb_display[i].fontdata) == csum &&
@@ -3435,5 +3435,5 @@ void __exit fb_console_exit(void)
 
 	do_unregister_con_driver(&fb_con);
 	console_unlock();
-}	
+}
 #endif
-- 
2.39.0

