Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MK/eCpLWrmlhJAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 15:17:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D06BD23A60B
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 15:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9461D10E502;
	Mon,  9 Mar 2026 14:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="IApIuFeF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0nhlei8o";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IApIuFeF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0nhlei8o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BC910E4FD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 14:17:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 52D654D243;
 Mon,  9 Mar 2026 14:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1773065850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W87QsD52fexHhLihb7ZBj35HU6wFyK6TjGFCrQ4J8YU=;
 b=IApIuFeFWJeqg8hHe/x1wuBV5ThST3+RLhkxJ+/LjrMlZEXLAwQ7mkGv/4OBr6hmV1RWx9
 wbvXrhCMSP1VdVch7orh1D9SU5f67e3cCAilMq01wD4r2M7SiIUwsSG1jJZhjZsPtFNHpy
 oMf2bQnG8Hz9lmjCo6tezRwPNjugJiw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1773065850;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W87QsD52fexHhLihb7ZBj35HU6wFyK6TjGFCrQ4J8YU=;
 b=0nhlei8oAyylxhCR+fNiZWvX5SgtIYtiYDn15LDazN+mWTBpsRsf8rePSAksGrpdZSs8Bg
 S+R1d3XfW6Qaz/Cw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IApIuFeF;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0nhlei8o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1773065850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W87QsD52fexHhLihb7ZBj35HU6wFyK6TjGFCrQ4J8YU=;
 b=IApIuFeFWJeqg8hHe/x1wuBV5ThST3+RLhkxJ+/LjrMlZEXLAwQ7mkGv/4OBr6hmV1RWx9
 wbvXrhCMSP1VdVch7orh1D9SU5f67e3cCAilMq01wD4r2M7SiIUwsSG1jJZhjZsPtFNHpy
 oMf2bQnG8Hz9lmjCo6tezRwPNjugJiw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1773065850;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W87QsD52fexHhLihb7ZBj35HU6wFyK6TjGFCrQ4J8YU=;
 b=0nhlei8oAyylxhCR+fNiZWvX5SgtIYtiYDn15LDazN+mWTBpsRsf8rePSAksGrpdZSs8Bg
 S+R1d3XfW6Qaz/Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1BE5B3EF3A;
 Mon,  9 Mar 2026 14:17:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yMqZBXrWrmldPAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Mar 2026 14:17:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gregkh@linuxfoundation.org,
	deller@gmx.de,
	sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 03/13] vt: Store font in struct vc_font
Date: Mon,  9 Mar 2026 15:14:45 +0100
Message-ID: <20260309141723.137364-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309141723.137364-1-tzimmermann@suse.de>
References: <20260309141723.137364-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
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
X-Rspamd-Queue-Id: D06BD23A60B
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
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Replace struct console_font with struct vc_font for the type of the
vc_font field of struct vc_data. Struct console_font is UAPI, which
prevents further changes. Hence a new data type is required.

Struct console_font has a documented vertical pitch of 32 bytes. This
is not the case after the font data has been loaded into the kernel.
Changing the type of vc_font addresses this inconsistency.

The font data is now declared as constant, as it might come from the
kernel's read-only section. There's some fallout throughout the console
code where non-const variables refer to it. Fix them. A later update
will declare the font data to a dedicated data type.

v3:
- fix typos

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/bitblit.c | 11 +++++------
 drivers/video/fbdev/core/fbcon.c   |  4 ++--
 drivers/video/fbdev/core/fbcon.h   |  4 ++--
 include/linux/console_struct.h     | 29 +++++++++++++++++++++++++++--
 4 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
index 085ffb44c51a..7478accea8ec 100644
--- a/drivers/video/fbdev/core/bitblit.c
+++ b/drivers/video/fbdev/core/bitblit.c
@@ -22,8 +22,7 @@
 /*
  * Accelerated handlers.
  */
-static void update_attr(u8 *dst, u8 *src, int attribute,
-			       struct vc_data *vc)
+static void update_attr(u8 *dst, const u8 *src, int attribute, struct vc_data *vc)
 {
 	int i, offset = (vc->vc_font.height < 10) ? 1 : 2;
 	int width = DIV_ROUND_UP(vc->vc_font.width, 8);
@@ -81,7 +80,7 @@ static inline void bit_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	unsigned int charcnt = vc->vc_font.charcount;
 	u32 idx = vc->vc_font.width >> 3;
-	u8 *src;
+	const u8 *src;
 
 	while (cnt--) {
 		u16 ch = scr_readw(s++) & charmask;
@@ -120,7 +119,7 @@ static inline void bit_putcs_unaligned(struct vc_data *vc,
 	u32 shift_low = 0, mod = vc->vc_font.width % 8;
 	u32 shift_high = 8;
 	u32 idx = vc->vc_font.width >> 3;
-	u8 *src;
+	const u8 *src;
 
 	while (cnt--) {
 		u16 ch = scr_readw(s++) & charmask;
@@ -267,7 +266,7 @@ static void bit_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 	int y = real_y(par->p, vc->state.y);
 	int attribute, use_sw = vc->vc_cursor_type & CUR_SW;
 	int err = 1;
-	char *src;
+	const u8 *src;
 
 	cursor.set = 0;
 
@@ -278,7 +277,7 @@ static void bit_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 	attribute = get_attribute(info, c);
 	src = vc->vc_font.data + ((c & charmask) * (w * vc->vc_font.height));
 
-	if (par->cursor_state.image.data != src ||
+	if (par->cursor_state.image.data != (const char *)src ||
 	    par->cursor_reset) {
 		par->cursor_state.image.data = src;
 		cursor.set |= FB_CUR_SETIMAGE;
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 666261ae59d8..247bb90c08d3 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2286,7 +2286,7 @@ static bool fbcon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
 
 static int fbcon_get_font(struct vc_data *vc, struct console_font *font, unsigned int vpitch)
 {
-	u8 *fontdata = vc->vc_font.data;
+	const u8 *fontdata = vc->vc_font.data;
 	u8 *data = font->data;
 	int i, j;
 
@@ -2417,7 +2417,7 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 	struct fbcon_par *par = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	int resize, ret, old_userfont, old_width, old_height, old_charcount;
-	u8 *old_data = vc->vc_font.data;
+	const u8 *old_data = vc->vc_font.data;
 
 	resize = (w != vc->vc_font.width) || (h != vc->vc_font.height);
 	vc->vc_font.data = (void *)(p->fontdata = data);
diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
index fca14e9b729b..3f4386a40237 100644
--- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -82,8 +82,8 @@ struct fbcon_par {
 	int    rotate;
 	int    cur_rotate;
 	char  *cursor_data;
-	u8    *fontbuffer;
-	u8    *fontdata;
+	u8          *fontbuffer;
+	const u8    *fontdata;
 	u8    *cursor_src;
 	u32    cursor_size;
 	u32    fd_size;
diff --git a/include/linux/console_struct.h b/include/linux/console_struct.h
index ebdb9750d348..ea0cdf4278a3 100644
--- a/include/linux/console_struct.h
+++ b/include/linux/console_struct.h
@@ -13,8 +13,9 @@
 #ifndef _LINUX_CONSOLE_STRUCT_H
 #define _LINUX_CONSOLE_STRUCT_H
 
-#include <linux/wait.h>
+#include <linux/math.h>
 #include <linux/vt.h>
+#include <linux/wait.h>
 #include <linux/workqueue.h>
 
 struct uni_pagedict;
@@ -58,6 +59,30 @@ struct vc_state {
 	bool		reverse;
 };
 
+/**
+ * struct vc_font - Describes a font
+ * @width: The width of a single glyph in bits
+ * @height: The height of a single glyph in scanlines
+ * @charcount: The number of glyphs in the font
+ * @data: The raw font data
+ *
+ * Font data is organized as an array of glyphs. Each glyph is a bitmap with
+ * set bits indicating the foreground color. Unset bits indicate background
+ * color. The fields @width and @height store a single glyph's number of
+ * horizontal bits and vertical scanlines. If width is not a multiple of 8,
+ * there are trailing bits to fill up the byte. These bits should not be drawn.
+ *
+ * The field @data points to the first glyph's first byte. The value @charcount
+ * gives the number of glyphs in the font. There are no empty scanlines between
+ * two adjacent glyphs.
+ */
+struct vc_font {
+	unsigned int width;
+	unsigned int height;
+	unsigned int charcount;
+	const unsigned char *data;
+};
+
 /*
  * Example: vc_data of a console that was scrolled 3 lines down.
  *
@@ -122,7 +147,7 @@ struct vc_data {
 	unsigned long	vc_pos;			/* Cursor address */
 	/* fonts */
 	unsigned short	vc_hi_font_mask;	/* [#] Attribute set for upper 256 chars of font or 0 if not supported */
-	struct console_font vc_font;		/* Current VC font set */
+	struct vc_font vc_font;			/* Current VC font set */
 	unsigned short	vc_video_erase_char;	/* Background erase character */
 	/* VT terminal data */
 	unsigned int	vc_state;		/* Escape sequence parser state */
-- 
2.53.0

