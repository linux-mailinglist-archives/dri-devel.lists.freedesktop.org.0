Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOyUEwWbpWnxEgYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:13:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F8E1DA7A5
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE11E10E50B;
	Mon,  2 Mar 2026 14:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="tMs2KyAV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zlygyOYu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tMs2KyAV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zlygyOYu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270C210E50B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 14:13:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C43405BD7F;
 Mon,  2 Mar 2026 14:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772460781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s9yo0DGLyYOidfgTubBlJULYFXhNUxAESfFJtfGTtsw=;
 b=tMs2KyAVehWA+BfhsmM8G/oClihsLGR9ZeNpCV1zbRy5PZ+ha441BGIoDu4P33yY7aZ7JU
 8x1SuO2jvlEs3uWFvpbCj/Y3bKh7hsWmH3FfUsCfSW5BmpjCGKNUE+Glvq7yPbWb772qxx
 C01bD3TqWnfaA2PdZCoIherL8kba+m4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772460781;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s9yo0DGLyYOidfgTubBlJULYFXhNUxAESfFJtfGTtsw=;
 b=zlygyOYu3AVEaPIxEbR2SQFw24MgbssfNaTPBQiVqdw713E6WN43GaDzObtlU6UhXOsA5u
 XcCY6lYRE28mBwDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772460781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s9yo0DGLyYOidfgTubBlJULYFXhNUxAESfFJtfGTtsw=;
 b=tMs2KyAVehWA+BfhsmM8G/oClihsLGR9ZeNpCV1zbRy5PZ+ha441BGIoDu4P33yY7aZ7JU
 8x1SuO2jvlEs3uWFvpbCj/Y3bKh7hsWmH3FfUsCfSW5BmpjCGKNUE+Glvq7yPbWb772qxx
 C01bD3TqWnfaA2PdZCoIherL8kba+m4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772460781;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s9yo0DGLyYOidfgTubBlJULYFXhNUxAESfFJtfGTtsw=;
 b=zlygyOYu3AVEaPIxEbR2SQFw24MgbssfNaTPBQiVqdw713E6WN43GaDzObtlU6UhXOsA5u
 XcCY6lYRE28mBwDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 908283EA6C;
 Mon,  2 Mar 2026 14:13:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AA0XIu2apWleKQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Mar 2026 14:13:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gregkh@linuxfoundation.org,
	deller@gmx.de,
	sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 07/13] lib/fonts: Store font data as font_data_t;
 update consoles
Date: Mon,  2 Mar 2026 15:08:41 +0100
Message-ID: <20260302141255.518657-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302141255.518657-1-tzimmermann@suse.de>
References: <20260302141255.518657-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email,vc_font.data:url]
X-Rspamd-Queue-Id: A5F8E1DA7A5
X-Rspamd-Action: no action

Store font data as pointer to font_data_t instead of unsigned char.
Update consoles.

Pointers to font data refer to the raw data. There is a hidden header
before the data that contains additional state. Document the existing
layout and semantics of font_data_t.

The data field in struct vc_font can be used by any console. Therefore
it still points to plain data without the additional header. Fbcon sets
its value from struct fbcon_display.fontdata. Hence, update the size
test in fbcon_resize() to use struct fbcon_display.fontdata instead of
struct vc_font.data.

v2:
- 'Font lookup' -> 'Font description' in <linux/font.h>

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/console/newport_con.c | 17 ++++++-----
 drivers/video/fbdev/core/fbcon.c    | 44 ++++++++++++++++-----------
 drivers/video/fbdev/core/fbcon.h    |  3 +-
 include/linux/font.h                | 47 ++++++++++++++++++++++++++++-
 4 files changed, 84 insertions(+), 27 deletions(-)

diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index e2922caa8685..9b9ed1940404 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -33,9 +33,9 @@
 
 #define NEWPORT_LEN	0x10000
 
-#define FONT_DATA ((unsigned char *)font_vga_8x16.data)
+#define FONT_DATA font_vga_8x16.data
 
-static unsigned char *font_data[MAX_NR_CONSOLES];
+static font_data_t *font_data[MAX_NR_CONSOLES];
 
 static struct newport_regs *npregs;
 static unsigned long newport_addr;
@@ -370,9 +370,9 @@ static void newport_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
 static void newport_putc(struct vc_data *vc, u16 charattr, unsigned int ypos,
 			 unsigned int xpos)
 {
-	unsigned char *p;
+	const unsigned char *p;
 
-	p = &font_data[vc->vc_num][(charattr & 0xff) << 4];
+	p = &font_data_buf(font_data[vc->vc_num])[(charattr & 0xff) << 4];
 	charattr = (charattr >> 8) & 0xff;
 	xpos <<= 3;
 	ypos <<= 4;
@@ -400,7 +400,7 @@ static void newport_putcs(struct vc_data *vc, const u16 *s,
 			  unsigned int count, unsigned int ypos,
 			  unsigned int xpos)
 {
-	unsigned char *p;
+	const unsigned char *p;
 	unsigned int i;
 	u16 charattr;
 
@@ -424,7 +424,7 @@ static void newport_putcs(struct vc_data *vc, const u16 *s,
 				 NPORT_DMODE0_L32);
 
 	for (i = 0; i < count; i++, xpos += 8) {
-		p = &font_data[vc->vc_num][(scr_readw(s++) & 0xff) << 4];
+		p = &font_data_buf(font_data[vc->vc_num])[(scr_readw(s++) & 0xff) << 4];
 
 		newport_wait(npregs);
 
@@ -503,7 +503,8 @@ static int newport_set_font(int unit, const struct console_font *op,
 	int h = op->height;
 	int size = h * op->charcount;
 	int i;
-	unsigned char *new_data, *data = op->data, *p;
+	font_data_t *new_data;
+	unsigned char *data = op->data, *p;
 
 	/* ladis: when I grow up, there will be a day... and more sizes will
 	 * be supported ;-) */
@@ -519,7 +520,7 @@ static int newport_set_font(int unit, const struct console_font *op,
 	REFCOUNT(new_data) = 0;	/* usage counter */
 	FNTSUM(new_data) = 0;
 
-	p = new_data;
+	p = (unsigned char *)font_data_buf(new_data);
 	for (i = 0; i < op->charcount; i++) {
 		memcpy(p, data, h);
 		data += 32;
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 103e91c8d874..8d7840b9ebad 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1019,8 +1019,10 @@ static const char *fbcon_startup(void)
 						info->pixmap.blit_y);
 		vc->vc_font.width = font->width;
 		vc->vc_font.height = font->height;
-		vc->vc_font.data = (void *)(p->fontdata = font->data);
+		vc->vc_font.data = font_data_buf(font->data);
 		vc->vc_font.charcount = font->charcount;
+
+		p->fontdata = font->data;
 	}
 
 	cols = FBCON_SWAP(par->rotate, info->var.xres, info->var.yres);
@@ -1078,11 +1080,12 @@ static void fbcon_init(struct vc_data *vc, bool init)
 		if (t->fontdata) {
 			struct vc_data *fvc = vc_cons[fg_console].d;
 
-			vc->vc_font.data = (void *)(p->fontdata =
-						    fvc->vc_font.data);
+			vc->vc_font.data = fvc->vc_font.data;
 			vc->vc_font.width = fvc->vc_font.width;
 			vc->vc_font.height = fvc->vc_font.height;
 			vc->vc_font.charcount = fvc->vc_font.charcount;
+
+			p->fontdata = t->fontdata;
 			p->userfont = t->userfont;
 
 			if (p->userfont)
@@ -1097,8 +1100,10 @@ static void fbcon_init(struct vc_data *vc, bool init)
 							info->pixmap.blit_y);
 			vc->vc_font.width = font->width;
 			vc->vc_font.height = font->height;
-			vc->vc_font.data = (void *)(p->fontdata = font->data);
+			vc->vc_font.data = font_data_buf(font->data);
 			vc->vc_font.charcount = font->charcount;
+
+			p->fontdata = font->data;
 		}
 	}
 
@@ -1409,11 +1414,12 @@ static void fbcon_set_disp(struct fb_info *info, struct fb_var_screeninfo *var,
 	svc = *default_mode;
 	t = &fb_display[svc->vc_num];
 
-	if (!vc->vc_font.data) {
-		vc->vc_font.data = (void *)(p->fontdata = t->fontdata);
+	if (!p->fontdata) {
+		vc->vc_font.data = font_data_buf(t->fontdata);
 		vc->vc_font.width = (*default_mode)->vc_font.width;
 		vc->vc_font.height = (*default_mode)->vc_font.height;
 		vc->vc_font.charcount = (*default_mode)->vc_font.charcount;
+		p->fontdata = t->fontdata;
 		p->userfont = t->userfont;
 		if (p->userfont)
 			REFCOUNT(p->fontdata)++;
@@ -2047,7 +2053,7 @@ static int fbcon_resize(struct vc_data *vc, unsigned int width,
 	struct fb_var_screeninfo var = info->var;
 	int x_diff, y_diff, virt_w, virt_h, virt_fw, virt_fh;
 
-	if (p->userfont && FNTSIZE(vc->vc_font.data)) {
+	if (p->userfont && FNTSIZE(p->fontdata)) {
 		unsigned int size = vc_font_size(&vc->vc_font);
 
 		/*
@@ -2057,7 +2063,7 @@ static int fbcon_resize(struct vc_data *vc, unsigned int width,
 		 * charcount can change and cannot be used to determine the
 		 * font data allocated size.
 		 */
-		if (!size || size > FNTSIZE(vc->vc_font.data))
+		if (!size || size > FNTSIZE(p->fontdata))
 			return -EINVAL;
 	}
 
@@ -2281,7 +2287,8 @@ static bool fbcon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
 
 static int fbcon_get_font(struct vc_data *vc, struct console_font *font, unsigned int vpitch)
 {
-	const u8 *fontdata = vc->vc_font.data;
+	struct fbcon_display *p = &fb_display[vc->vc_num];
+	font_data_t *fontdata = p->fontdata;
 	u8 *data = font->data;
 	int i, j;
 
@@ -2406,16 +2413,18 @@ static void set_vc_hi_font(struct vc_data *vc, bool set)
 }
 
 static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
-			     const u8 * data, int userfont)
+			     font_data_t *data, int userfont)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_par *par = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	int resize, ret, old_userfont, old_width, old_height, old_charcount;
+	font_data_t *old_fontdata = p->fontdata;
 	const u8 *old_data = vc->vc_font.data;
 
 	resize = (w != vc->vc_font.width) || (h != vc->vc_font.height);
-	vc->vc_font.data = (void *)(p->fontdata = data);
+	p->fontdata = data;
+	vc->vc_font.data = font_data_buf(p->fontdata);
 	old_userfont = p->userfont;
 	if ((p->userfont = userfont))
 		REFCOUNT(data)++;
@@ -2448,12 +2457,12 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 		update_screen(vc);
 	}
 
-	if (old_userfont && (--REFCOUNT(old_data) == 0))
-		kfree(old_data - FONT_EXTRA_WORDS * sizeof(int));
+	if (old_userfont && (--REFCOUNT(old_fontdata) == 0))
+		kfree(old_fontdata - FONT_EXTRA_WORDS * sizeof(int));
 	return 0;
 
 err_out:
-	p->fontdata = old_data;
+	p->fontdata = old_fontdata;
 	vc->vc_font.data = old_data;
 
 	if (userfont) {
@@ -2483,7 +2492,8 @@ static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
 	int h = font->height;
 	int size, alloc_size;
 	int i, csum;
-	u8 *new_data, *data = font->data;
+	font_data_t *new_data;
+	u8 *data = font->data;
 	int pitch = PITCH(font->width);
 
 	/* Is there a reason why fbconsole couldn't handle any charcount >256?
@@ -2522,13 +2532,13 @@ static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
 	if (!new_data)
 		return -ENOMEM;
 
-	memset(new_data, 0, FONT_EXTRA_WORDS * sizeof(int));
+	memset((u8 *)new_data, 0, FONT_EXTRA_WORDS * sizeof(int));
 
 	new_data += FONT_EXTRA_WORDS * sizeof(int);
 	FNTSIZE(new_data) = size;
 	REFCOUNT(new_data) = 0;	/* usage counter */
 	for (i=0; i< charcount; i++) {
-		memcpy(new_data + i*h*pitch, data +  i*vpitch*pitch, h*pitch);
+		memcpy((u8 *)new_data + i * h * pitch, data + i * vpitch * pitch, h * pitch);
 	}
 
 	/* Since linux has a nice crc32 function use it for counting font
diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
index 3f4386a40237..d26ee7860cf5 100644
--- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -11,6 +11,7 @@
 #ifndef _VIDEO_FBCON_H
 #define _VIDEO_FBCON_H
 
+#include <linux/font.h>
 #include <linux/types.h>
 #include <linux/vt_buffer.h>
 #include <linux/vt_kern.h>
@@ -25,7 +26,7 @@
 
 struct fbcon_display {
     /* Filled in by the low-level console driver */
-    const u_char *fontdata;
+    font_data_t *fontdata;
     int userfont;                   /* != 0 if fontdata kmalloc()ed */
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
     u_short scrollmode;             /* Scroll Method, use fb_scrollmode() */
diff --git a/include/linux/font.h b/include/linux/font.h
index d929c5fa32ca..f19abd112c18 100644
--- a/include/linux/font.h
+++ b/include/linux/font.h
@@ -13,12 +13,57 @@
 
 #include <linux/types.h>
 
+/*
+ * font_data_t and helpers
+ */
+
+/**
+ * font_data_t - Raw font data
+ *
+ * Values of type font_data_t store a pointer to raw font data. The format
+ * is monochrome. Each bit sets a pixel of a stored glyph. Font data does
+ * not store geometry information for the individual glyphs. Users of the
+ * font have to store glyph size, pitch and characer count separately.
+ *
+ * Font data in font_data_t is not equivalent to raw u8. Each pointer stores
+ * an additional hidden header before the fotn data. The layout is
+ *
+ * +------+-----------------------------+
+ * | -16  |  CRC32 Checksum (optional)  |
+ * | -12  |  <Unused>                   |
+ * |  -8  |  Number of data bytes       |
+ * |  -4  |  Reference count            |
+ * +------+-----------------------------+
+ * |   0  |  Data buffer                |
+ * |  ... |                             |
+ * +------+-----------------------------+
+ *
+ * Use helpers to access font_data_t. Use font_data_buf() to get the stored data.
+ */
+typedef const unsigned char font_data_t;
+
+/**
+ * font_data_buf() - Returns the font data as raw bytes
+ * @fd: The font data
+ *
+ * Returns:
+ * The raw font data. The provided buffer is read-only.
+ */
+static inline const unsigned char *font_data_buf(font_data_t *fd)
+{
+	return (const unsigned char *)fd;
+}
+
+/*
+ * Font description
+ */
+
 struct font_desc {
     int idx;
     const char *name;
     unsigned int width, height;
     unsigned int charcount;
-    const void *data;
+    font_data_t *data;
     int pref;
 };
 
-- 
2.53.0

