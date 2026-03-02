Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIzaLwibpWnxEgYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:13:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6ED1DA7B3
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6849510E50C;
	Mon,  2 Mar 2026 14:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="A2cKkN1Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GIFqKDKD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A2cKkN1Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GIFqKDKD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A6210E50C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 14:13:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 811B75BD82;
 Mon,  2 Mar 2026 14:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772460782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=agjRYnaBFy0+71cEG6uGc7feK6O1ysmtSNOKfC0/+Yc=;
 b=A2cKkN1QKWvuhZk03ELBWrioqm5SYhnRRcy8uPOGU/yp4Eu5SkYXjBdyMDhzjGbfnskrrn
 chx/zxjxif+ysdl4yCDUt/aGQAMpqTbC6y+7lRdTGCi5EQ0CjPabyg2tE4yLJjiFflR0Zs
 FglOx/MoEBEeAEJOE55b84QTOwbrGa4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772460782;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=agjRYnaBFy0+71cEG6uGc7feK6O1ysmtSNOKfC0/+Yc=;
 b=GIFqKDKDyz4m2S4CSNBNKPJr1HQcu5IcRZ1amB/jN3PQrNwAOibz7dF2XzIKe+3dgGuuTo
 NZN4JD573zA0rXCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772460782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=agjRYnaBFy0+71cEG6uGc7feK6O1ysmtSNOKfC0/+Yc=;
 b=A2cKkN1QKWvuhZk03ELBWrioqm5SYhnRRcy8uPOGU/yp4Eu5SkYXjBdyMDhzjGbfnskrrn
 chx/zxjxif+ysdl4yCDUt/aGQAMpqTbC6y+7lRdTGCi5EQ0CjPabyg2tE4yLJjiFflR0Zs
 FglOx/MoEBEeAEJOE55b84QTOwbrGa4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772460782;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=agjRYnaBFy0+71cEG6uGc7feK6O1ysmtSNOKfC0/+Yc=;
 b=GIFqKDKDyz4m2S4CSNBNKPJr1HQcu5IcRZ1amB/jN3PQrNwAOibz7dF2XzIKe+3dgGuuTo
 NZN4JD573zA0rXCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4A41B3EA69;
 Mon,  2 Mar 2026 14:13:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ELjqEO6apWleKQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Mar 2026 14:13:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gregkh@linuxfoundation.org,
	deller@gmx.de,
	sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 10/13] lib/fonts: Manage font-data lifetime with
 font_data_get/_put()
Date: Mon,  2 Mar 2026 15:08:44 +0100
Message-ID: <20260302141255.518657-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302141255.518657-1-tzimmermann@suse.de>
References: <20260302141255.518657-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:deller@gmx.de,m:sam@ravnborg.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmx.de,ravnborg.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email]
X-Rspamd-Queue-Id: 5F6ED1DA7B3
X-Rspamd-Action: no action

Add font_data_get() and font_data_put(). Update consoles to use them
over REFCOUNT() and plain kfree().

Newly allocated font data starts with a reference count of 1. Loading
the font puts the previously loaded font. If the reference count reaches
zero, font_data_put() frees the font data.

The kernel stores internal font data in a read-only section. Invoking
font_data_get() and font_data_put() tests this internally and returns
success without further operation. From the caller's perspective,
getting and putting works the same for all font data.

Fbcon used the userfont flag distinguish between internal fonts and
fonts loaded by user space. Only the latter where refcounted. With the
new helper's automatic handling of internal font data, remove the
userfont flag from fbcon.

Newport_con uses a default font, FONT_DATA, until user space loads
custom font data. Remove all special cases for FONT_DATA, as the get
and put calls' read-only handlign also covers this case.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/console/newport_con.c | 26 ++++-------
 drivers/video/fbdev/core/fbcon.c    | 65 +++++++++++++--------------
 drivers/video/fbdev/core/fbcon.h    |  1 -
 include/linux/font.h                |  2 +
 lib/fonts/fonts.c                   | 70 +++++++++++++++++++++++++++++
 5 files changed, 111 insertions(+), 53 deletions(-)

diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index 4db2b901c709..1bc3cb1ea116 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -517,7 +517,7 @@ static int newport_set_font(int unit, const struct console_font *op,
 
 	new_data += FONT_EXTRA_WORDS * sizeof(int);
 	FNTSIZE(new_data) = size;
-	REFCOUNT(new_data) = 0;	/* usage counter */
+	REFCOUNT(new_data) = 1;	/* usage counter */
 	FNTSUM(new_data) = 0;
 
 	p = (unsigned char *)font_data_buf(new_data);
@@ -529,23 +529,18 @@ static int newport_set_font(int unit, const struct console_font *op,
 
 	/* check if font is already used by other console */
 	for (i = 0; i < MAX_NR_CONSOLES; i++) {
-		if (font_data[i] != FONT_DATA
-		    && font_data_is_equal(font_data[i], new_data)) {
-			kfree(new_data - FONT_EXTRA_WORDS * sizeof(int));
+		if (font_data_is_equal(font_data[i], new_data)) {
+			font_data_put(new_data);
 			/* current font is the same as the new one */
 			if (i == unit)
 				return 0;
 			new_data = font_data[i];
+			font_data_get(new_data);
 			break;
 		}
 	}
-	/* old font is user font */
-	if (font_data[unit] != FONT_DATA) {
-		if (--REFCOUNT(font_data[unit]) == 0)
-			kfree(font_data[unit] -
-			      FONT_EXTRA_WORDS * sizeof(int));
-	}
-	REFCOUNT(new_data)++;
+
+	font_data_put(font_data[unit]);
 	font_data[unit] = new_data;
 
 	return 0;
@@ -553,12 +548,9 @@ static int newport_set_font(int unit, const struct console_font *op,
 
 static int newport_set_def_font(int unit, struct console_font *op)
 {
-	if (font_data[unit] != FONT_DATA) {
-		if (--REFCOUNT(font_data[unit]) == 0)
-			kfree(font_data[unit] -
-			      FONT_EXTRA_WORDS * sizeof(int));
-		font_data[unit] = FONT_DATA;
-	}
+	font_data_put(font_data[unit]);
+	font_data[unit] = FONT_DATA;
+	font_data_get(font_data[unit]);
 
 	return 0;
 }
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 31e812d87d9e..00255ac92e42 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1023,6 +1023,7 @@ static const char *fbcon_startup(void)
 		vc->vc_font.charcount = font->charcount;
 
 		p->fontdata = font->data;
+		font_data_get(p->fontdata);
 	}
 
 	cols = FBCON_SWAP(par->rotate, info->var.xres, info->var.yres);
@@ -1086,10 +1087,7 @@ static void fbcon_init(struct vc_data *vc, bool init)
 			vc->vc_font.charcount = fvc->vc_font.charcount;
 
 			p->fontdata = t->fontdata;
-			p->userfont = t->userfont;
-
-			if (p->userfont)
-				REFCOUNT(p->fontdata)++;
+			font_data_get(p->fontdata);
 		} else {
 			const struct font_desc *font = NULL;
 
@@ -1104,6 +1102,7 @@ static void fbcon_init(struct vc_data *vc, bool init)
 			vc->vc_font.charcount = font->charcount;
 
 			p->fontdata = font->data;
+			font_data_get(p->fontdata);
 		}
 	}
 
@@ -1194,10 +1193,10 @@ static void fbcon_init(struct vc_data *vc, bool init)
 
 static void fbcon_free_font(struct fbcon_display *p)
 {
-	if (p->userfont && p->fontdata && (--REFCOUNT(p->fontdata) == 0))
-		kfree(p->fontdata - FONT_EXTRA_WORDS * sizeof(int));
-	p->fontdata = NULL;
-	p->userfont = 0;
+	if (p->fontdata) {
+		font_data_put(p->fontdata);
+		p->fontdata = NULL;
+	}
 }
 
 static void set_vc_hi_font(struct vc_data *vc, bool set);
@@ -1420,9 +1419,7 @@ static void fbcon_set_disp(struct fb_info *info, struct fb_var_screeninfo *var,
 		vc->vc_font.height = (*default_mode)->vc_font.height;
 		vc->vc_font.charcount = (*default_mode)->vc_font.charcount;
 		p->fontdata = t->fontdata;
-		p->userfont = t->userfont;
-		if (p->userfont)
-			REFCOUNT(p->fontdata)++;
+		font_data_get(p->fontdata);
 	}
 
 	var->activate = FB_ACTIVATE_NOW;
@@ -2053,7 +2050,7 @@ static int fbcon_resize(struct vc_data *vc, unsigned int width,
 	struct fb_var_screeninfo var = info->var;
 	int x_diff, y_diff, virt_w, virt_h, virt_fw, virt_fh;
 
-	if (p->userfont && font_data_size(p->fontdata)) {
+	if (font_data_size(p->fontdata)) {
 		unsigned int size = vc_font_size(&vc->vc_font);
 
 		/*
@@ -2413,21 +2410,20 @@ static void set_vc_hi_font(struct vc_data *vc, bool set)
 }
 
 static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
-			     font_data_t *data, int userfont)
+			     font_data_t *data)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_par *par = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
-	int resize, ret, old_userfont, old_width, old_height, old_charcount;
+	int resize, ret, old_width, old_height, old_charcount;
 	font_data_t *old_fontdata = p->fontdata;
 	const u8 *old_data = vc->vc_font.data;
 
+	font_data_get(data);
+
 	resize = (w != vc->vc_font.width) || (h != vc->vc_font.height);
 	p->fontdata = data;
 	vc->vc_font.data = font_data_buf(p->fontdata);
-	old_userfont = p->userfont;
-	if ((p->userfont = userfont))
-		REFCOUNT(data)++;
 
 	old_width = vc->vc_font.width;
 	old_height = vc->vc_font.height;
@@ -2457,24 +2453,20 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 		update_screen(vc);
 	}
 
-	if (old_userfont && (--REFCOUNT(old_fontdata) == 0))
-		kfree(old_fontdata - FONT_EXTRA_WORDS * sizeof(int));
+	if (old_fontdata)
+		font_data_put(old_fontdata);
+
 	return 0;
 
 err_out:
 	p->fontdata = old_fontdata;
 	vc->vc_font.data = old_data;
-
-	if (userfont) {
-		p->userfont = old_userfont;
-		if (--REFCOUNT(data) == 0)
-			kfree(data - FONT_EXTRA_WORDS * sizeof(int));
-	}
-
 	vc->vc_font.width = old_width;
 	vc->vc_font.height = old_height;
 	vc->vc_font.charcount = old_charcount;
 
+	font_data_put(data);
+
 	return ret;
 }
 
@@ -2491,9 +2483,9 @@ static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
 	int w = font->width;
 	int h = font->height;
 	int size, alloc_size;
-	int i, csum;
+	int i, csum, ret;
 	font_data_t *new_data;
-	u8 *data = font->data;
+	const u8 *data = font->data;
 	int pitch = PITCH(font->width);
 
 	/* Is there a reason why fbconsole couldn't handle any charcount >256?
@@ -2536,7 +2528,7 @@ static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
 
 	new_data += FONT_EXTRA_WORDS * sizeof(int);
 	FNTSIZE(new_data) = size;
-	REFCOUNT(new_data) = 0;	/* usage counter */
+	REFCOUNT(new_data) = 1;	/* usage counter */
 	for (i=0; i< charcount; i++) {
 		memcpy((u8 *)new_data + i * h * pitch, data + i * vpitch * pitch, h * pitch);
 	}
@@ -2548,15 +2540,18 @@ static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
 	FNTSUM(new_data) = csum;
 	/* Check if the same font is on some other console already */
 	for (i = first_fb_vc; i <= last_fb_vc; i++) {
-		if (fb_display[i].userfont &&
-		    fb_display[i].fontdata &&
+		if (fb_display[i].fontdata &&
 		    font_data_is_equal(fb_display[i].fontdata, new_data)) {
-			kfree(new_data - FONT_EXTRA_WORDS * sizeof(int));
-			new_data = (u8 *)fb_display[i].fontdata;
+			font_data_get(fb_display[i].fontdata);
+			font_data_put(new_data);
+			new_data = fb_display[i].fontdata;
 			break;
 		}
 	}
-	return fbcon_do_set_font(vc, font->width, font->height, charcount, new_data, 1);
+	ret = fbcon_do_set_font(vc, font->width, font->height, charcount, new_data);
+	font_data_put(new_data);
+
+	return ret;
 }
 
 static int fbcon_set_def_font(struct vc_data *vc, struct console_font *font,
@@ -2573,7 +2568,7 @@ static int fbcon_set_def_font(struct vc_data *vc, struct console_font *font,
 
 	font->width = f->width;
 	font->height = f->height;
-	return fbcon_do_set_font(vc, f->width, f->height, f->charcount, f->data, 0);
+	return fbcon_do_set_font(vc, f->width, f->height, f->charcount, f->data);
 }
 
 static u16 palette_red[16];
diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
index d26ee7860cf5..1e3c1ef84762 100644
--- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -27,7 +27,6 @@
 struct fbcon_display {
     /* Filled in by the low-level console driver */
     font_data_t *fontdata;
-    int userfont;                   /* != 0 if fontdata kmalloc()ed */
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
     u_short scrollmode;             /* Scroll Method, use fb_scrollmode() */
 #endif
diff --git a/include/linux/font.h b/include/linux/font.h
index 1f5b85601c9b..a8610201afb7 100644
--- a/include/linux/font.h
+++ b/include/linux/font.h
@@ -54,6 +54,8 @@ static inline const unsigned char *font_data_buf(font_data_t *fd)
 	return (const unsigned char *)fd;
 }
 
+void font_data_get(font_data_t *fd);
+bool font_data_put(font_data_t *fd);
 unsigned int font_data_size(font_data_t *fd);
 bool font_data_is_equal(font_data_t *lhs, font_data_t *rhs);
 
diff --git a/lib/fonts/fonts.c b/lib/fonts/fonts.c
index c9f6328d5dda..1da0acdebf53 100644
--- a/lib/fonts/fonts.c
+++ b/lib/fonts/fonts.c
@@ -12,8 +12,10 @@
  * for more details.
  */
 
+#include <linux/container_of.h>
 #include <linux/font.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
 
@@ -26,11 +28,79 @@
  * Helpers for font_data_t
  */
 
+static struct font_data *to_font_data_struct(font_data_t *fd)
+{
+	return container_of(fd, struct font_data, data[0]);
+}
+
 static bool font_data_is_internal(font_data_t *fd)
 {
 	return is_kernel_rodata((unsigned long)fd);
 }
 
+static void font_data_free(font_data_t *fd)
+{
+	if (WARN_ON(font_data_is_internal(fd)))
+		return;
+
+	kfree(to_font_data_struct(fd));
+}
+
+/**
+ * font_data_get - Acquires a reference on font data
+ * @fd: Font data
+ *
+ * Font data from user space is reference counted. The helper
+ * font_data_get() increases the reference counter by one. Invoke
+ * font_data_put() to release the reference.
+ *
+ * Internal font data is located in read-only memory. In this case
+ * the helper returns success without modifying the counter field.
+ * It is still required to call font_data_put() on internal font data.
+ */
+void font_data_get(font_data_t *fd)
+{
+	if (font_data_is_internal(fd))
+		return; /* never ref static data */
+
+	if (WARN_ON(!REFCOUNT(fd)))
+		return; /* should never be 0 */
+	++REFCOUNT(fd);
+}
+EXPORT_SYMBOL_GPL(font_data_get);
+
+/**
+ * font_data_put - Release a reference on font data
+ * @fd: Font data
+ *
+ * Font data from user space is reference counted. The helper
+ * font_data_put() decreases the reference counter by one. If this was
+ * the final reference, it frees the allocated memory.
+ *
+ * Internal font data is located in read-only memory. In this case
+ * the helper returns success without modifying the counter field.
+ *
+ * Returns:
+ * True if this was the final reference, false otherwise.
+ */
+bool font_data_put(font_data_t *fd)
+{
+	unsigned int count;
+
+	if (font_data_is_internal(fd))
+		return true; /* never unref static data */
+
+	if (WARN_ON(!REFCOUNT(fd)))
+		return true; /* should never be 0 */
+
+	count = --REFCOUNT(fd);
+	if (!count)
+		font_data_free(fd);
+
+	return !count;
+}
+EXPORT_SYMBOL_GPL(font_data_put);
+
 /**
  * font_data_size - Return size of the font data in bytes
  * @fd: Font data
-- 
2.53.0

