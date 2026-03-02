Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGM9NwqbpWnxEgYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:13:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EB31DA7BA
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB80A10E510;
	Mon,  2 Mar 2026 14:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="F/11/uhU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LI+K6+iy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F/11/uhU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LI+K6+iy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6762D10E50F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 14:13:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 38AB93F812;
 Mon,  2 Mar 2026 14:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772460783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A5hPkjRRQj03uZeGeu+2LED9SBQXZFUCWYWsHStO0+w=;
 b=F/11/uhUNcpJkUG4WjnB7QIE4htOWml6rycUZmK3GsGgVzHdBE2l2eIp2GuhNqmfO8Anor
 v0V2YlLO3/r4bEwVb383uFeCp4aAh+i7XAjuWpQvGxqqI96S4ax5QtfiXX5A3H1RGSGHyR
 9+QOGNdbxIKgpSNv9f4BJggjfEycbto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772460783;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A5hPkjRRQj03uZeGeu+2LED9SBQXZFUCWYWsHStO0+w=;
 b=LI+K6+iyytwoOkPhAxezkZlgfzOUdFKBc0vsuSJkOC8sK75z79D879jVXmGrUIZJjwpVYE
 toBFflCgINcyTVBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772460783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A5hPkjRRQj03uZeGeu+2LED9SBQXZFUCWYWsHStO0+w=;
 b=F/11/uhUNcpJkUG4WjnB7QIE4htOWml6rycUZmK3GsGgVzHdBE2l2eIp2GuhNqmfO8Anor
 v0V2YlLO3/r4bEwVb383uFeCp4aAh+i7XAjuWpQvGxqqI96S4ax5QtfiXX5A3H1RGSGHyR
 9+QOGNdbxIKgpSNv9f4BJggjfEycbto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772460783;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A5hPkjRRQj03uZeGeu+2LED9SBQXZFUCWYWsHStO0+w=;
 b=LI+K6+iyytwoOkPhAxezkZlgfzOUdFKBc0vsuSJkOC8sK75z79D879jVXmGrUIZJjwpVYE
 toBFflCgINcyTVBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 05DC43EA6C;
 Mon,  2 Mar 2026 14:13:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6HoBAO+apWleKQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Mar 2026 14:13:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gregkh@linuxfoundation.org,
	deller@gmx.de,
	sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 13/13] lib/fonts: Remove internal symbols and macros from
 public header file
Date: Mon,  2 Mar 2026 15:08:47 +0100
Message-ID: <20260302141255.518657-14-tzimmermann@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email]
X-Rspamd-Queue-Id: 85EB31DA7BA
X-Rspamd-Action: no action

Define access macros for font_data_t in fonts.c. Define struct font_data
and declare most of the font symbols in the internal header font.h, where
they can only be seen by the font code.

Also move font indices into internal font.h. They appear to be unused
though. There is m86k assembly code that operates on the idx field, so
leave them in place for now.

List all built-in fonts in a separate section in the public header file.

v2:
- do not add config guards around font symbols (Helge)
- keep declaration of built-in fonts in public header

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/linux/font.h       | 57 ++++++++++++--------------------------
 lib/fonts/font.h           | 38 +++++++++++++++++++++++++
 lib/fonts/font_10x18.c     |  2 +-
 lib/fonts/font_6x10.c      |  3 +-
 lib/fonts/font_6x11.c      |  2 +-
 lib/fonts/font_6x8.c       |  3 +-
 lib/fonts/font_7x14.c      |  2 +-
 lib/fonts/font_8x16.c      |  3 +-
 lib/fonts/font_8x8.c       |  2 +-
 lib/fonts/font_acorn_8x8.c |  2 +-
 lib/fonts/font_mini_4x6.c  |  2 +-
 lib/fonts/font_pearl_8x8.c |  2 +-
 lib/fonts/font_sun12x22.c  |  3 +-
 lib/fonts/font_sun8x16.c   |  3 +-
 lib/fonts/font_ter10x18.c  |  4 ++-
 lib/fonts/font_ter16x32.c  |  4 ++-
 lib/fonts/fonts.c          |  8 +++++-
 17 files changed, 85 insertions(+), 55 deletions(-)
 create mode 100644 lib/fonts/font.h

diff --git a/include/linux/font.h b/include/linux/font.h
index e2e02e40c365..63a8aee8e37d 100644
--- a/include/linux/font.h
+++ b/include/linux/font.h
@@ -77,36 +77,6 @@ struct font_desc {
     int pref;
 };
 
-#define VGA8x8_IDX	0
-#define VGA8x16_IDX	1
-#define PEARL8x8_IDX	2
-#define VGA6x11_IDX	3
-#define FONT7x14_IDX	4
-#define	FONT10x18_IDX	5
-#define SUN8x16_IDX	6
-#define SUN12x22_IDX	7
-#define ACORN8x8_IDX	8
-#define	MINI4x6_IDX	9
-#define FONT6x10_IDX	10
-#define TER16x32_IDX	11
-#define FONT6x8_IDX	12
-#define TER10x18_IDX	13
-
-extern const struct font_desc	font_vga_8x8,
-			font_vga_8x16,
-			font_pearl_8x8,
-			font_vga_6x11,
-			font_7x14,
-			font_10x18,
-			font_sun_8x16,
-			font_sun_12x22,
-			font_acorn_8x8,
-			font_mini_4x6,
-			font_6x10,
-			font_ter_16x32,
-			font_6x8,
-			font_ter_10x18;
-
 /* Find a font with a specific name */
 
 extern const struct font_desc *find_font(const char *name);
@@ -120,16 +90,23 @@ extern const struct font_desc *get_default_font(int xres, int yres,
 /* Max. length for the name of a predefined font */
 #define MAX_FONT_NAME	32
 
-/* Extra word getters */
-#define REFCOUNT(fd)	(((int *)(fd))[-1])
-#define FNTSIZE(fd)	(((int *)(fd))[-2])
-#define FNTSUM(fd)	(((int *)(fd))[-4])
-
-#define FONT_EXTRA_WORDS 4
+/*
+ * Built-in fonts
+ */
 
-struct font_data {
-	unsigned int extra[FONT_EXTRA_WORDS];
-	unsigned char data[];
-} __packed;
+extern const struct font_desc font_10x18;
+extern const struct font_desc font_6x10;
+extern const struct font_desc font_6x8;
+extern const struct font_desc font_7x14;
+extern const struct font_desc font_acorn_8x8;
+extern const struct font_desc font_mini_4x6;
+extern const struct font_desc font_pearl_8x8;
+extern const struct font_desc font_sun_12x22;
+extern const struct font_desc font_sun_8x16;
+extern const struct font_desc font_ter_10x18;
+extern const struct font_desc font_ter_16x32;
+extern const struct font_desc font_vga_6x11;
+extern const struct font_desc font_vga_8x16;
+extern const struct font_desc font_vga_8x8;
 
 #endif /* _VIDEO_FONT_H */
diff --git a/lib/fonts/font.h b/lib/fonts/font.h
new file mode 100644
index 000000000000..4f1adf0b6b54
--- /dev/null
+++ b/lib/fonts/font.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _LIB_FONTS_FONT_H
+#define _LIB_FONTS_FONT_H
+
+#include <linux/font.h>
+
+/*
+ * Font data
+ */
+
+#define FONT_EXTRA_WORDS 4
+
+struct font_data {
+	unsigned int extra[FONT_EXTRA_WORDS];
+	unsigned char data[];
+} __packed;
+
+/*
+ * Built-in fonts
+ */
+
+#define VGA8x8_IDX	0
+#define VGA8x16_IDX	1
+#define PEARL8x8_IDX	2
+#define VGA6x11_IDX	3
+#define FONT7x14_IDX	4
+#define	FONT10x18_IDX	5
+#define SUN8x16_IDX	6
+#define SUN12x22_IDX	7
+#define ACORN8x8_IDX	8
+#define	MINI4x6_IDX	9
+#define FONT6x10_IDX	10
+#define TER16x32_IDX	11
+#define FONT6x8_IDX	12
+#define TER10x18_IDX	13
+
+#endif
diff --git a/lib/fonts/font_10x18.c b/lib/fonts/font_10x18.c
index 5d940db626e7..10edebc4bb74 100644
--- a/lib/fonts/font_10x18.c
+++ b/lib/fonts/font_10x18.c
@@ -4,7 +4,7 @@
  * by Jurriaan Kalkman 06-2005  *
  ********************************/
 
-#include <linux/font.h>
+#include "font.h"
 
 #define FONTDATAMAX 9216
 
diff --git a/lib/fonts/font_6x10.c b/lib/fonts/font_6x10.c
index e65df019e0d2..660d3a371b30 100644
--- a/lib/fonts/font_6x10.c
+++ b/lib/fonts/font_6x10.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <linux/font.h>
+
+#include "font.h"
 
 #define FONTDATAMAX 2560
 
diff --git a/lib/fonts/font_6x11.c b/lib/fonts/font_6x11.c
index bd76b3f6b635..671487ccc172 100644
--- a/lib/fonts/font_6x11.c
+++ b/lib/fonts/font_6x11.c
@@ -5,7 +5,7 @@
 /*                                            */
 /**********************************************/
 
-#include <linux/font.h>
+#include "font.h"
 
 #define FONTDATAMAX (11*256)
 
diff --git a/lib/fonts/font_6x8.c b/lib/fonts/font_6x8.c
index 06ace7792521..5811ee07f4d8 100644
--- a/lib/fonts/font_6x8.c
+++ b/lib/fonts/font_6x8.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <linux/font.h>
+
+#include "font.h"
 
 #define FONTDATAMAX 2048
 
diff --git a/lib/fonts/font_7x14.c b/lib/fonts/font_7x14.c
index a2f561c9fa04..0c7475d643c8 100644
--- a/lib/fonts/font_7x14.c
+++ b/lib/fonts/font_7x14.c
@@ -4,7 +4,7 @@
 /* by Jurriaan Kalkman 05-2005        */
 /**************************************/
 
-#include <linux/font.h>
+#include "font.h"
 
 #define FONTDATAMAX 3584
 
diff --git a/lib/fonts/font_8x16.c b/lib/fonts/font_8x16.c
index 06ae14088514..523e95c75569 100644
--- a/lib/fonts/font_8x16.c
+++ b/lib/fonts/font_8x16.c
@@ -5,9 +5,10 @@
 /*                                            */
 /**********************************************/
 
-#include <linux/font.h>
 #include <linux/module.h>
 
+#include "font.h"
+
 #define FONTDATAMAX 4096
 
 static const struct font_data fontdata_8x16 = {
diff --git a/lib/fonts/font_8x8.c b/lib/fonts/font_8x8.c
index 69570b8c31af..e5b697fc9675 100644
--- a/lib/fonts/font_8x8.c
+++ b/lib/fonts/font_8x8.c
@@ -5,7 +5,7 @@
 /*                                            */
 /**********************************************/
 
-#include <linux/font.h>
+#include "font.h"
 
 #define FONTDATAMAX 2048
 
diff --git a/lib/fonts/font_acorn_8x8.c b/lib/fonts/font_acorn_8x8.c
index af5fa72aa8b7..36c51016769d 100644
--- a/lib/fonts/font_acorn_8x8.c
+++ b/lib/fonts/font_acorn_8x8.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Acorn-like font definition, with PC graphics characters */
 
-#include <linux/font.h>
+#include "font.h"
 
 #define FONTDATAMAX 2048
 
diff --git a/lib/fonts/font_mini_4x6.c b/lib/fonts/font_mini_4x6.c
index cc21dc70cfd1..dc919c160dde 100644
--- a/lib/fonts/font_mini_4x6.c
+++ b/lib/fonts/font_mini_4x6.c
@@ -39,7 +39,7 @@ __END__;
    MSBit to LSBit = left to right.
  */
 
-#include <linux/font.h>
+#include "font.h"
 
 #define FONTDATAMAX 1536
 
diff --git a/lib/fonts/font_pearl_8x8.c b/lib/fonts/font_pearl_8x8.c
index ae98ca17982e..2438b374acea 100644
--- a/lib/fonts/font_pearl_8x8.c
+++ b/lib/fonts/font_pearl_8x8.c
@@ -10,7 +10,7 @@
 /*                                            */
 /**********************************************/
 
-#include <linux/font.h>
+#include "font.h"
 
 #define FONTDATAMAX 2048
 
diff --git a/lib/fonts/font_sun12x22.c b/lib/fonts/font_sun12x22.c
index 91daf5ab8b6b..2afbc144bea8 100644
--- a/lib/fonts/font_sun12x22.c
+++ b/lib/fonts/font_sun12x22.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <linux/font.h>
+
+#include "font.h"
 
 #define FONTDATAMAX 11264
 
diff --git a/lib/fonts/font_sun8x16.c b/lib/fonts/font_sun8x16.c
index 81bb4eeae04e..2b7b2d8e548a 100644
--- a/lib/fonts/font_sun8x16.c
+++ b/lib/fonts/font_sun8x16.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <linux/font.h>
+
+#include "font.h"
 
 #define FONTDATAMAX 4096
 
diff --git a/lib/fonts/font_ter10x18.c b/lib/fonts/font_ter10x18.c
index 80356e9d56c7..3f30b4a211ab 100644
--- a/lib/fonts/font_ter10x18.c
+++ b/lib/fonts/font_ter10x18.c
@@ -1,7 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <linux/font.h>
+
 #include <linux/module.h>
 
+#include "font.h"
+
 #define FONTDATAMAX 9216
 
 static const struct font_data fontdata_ter10x18 = {
diff --git a/lib/fonts/font_ter16x32.c b/lib/fonts/font_ter16x32.c
index 5baedc573dd6..93616cffe642 100644
--- a/lib/fonts/font_ter16x32.c
+++ b/lib/fonts/font_ter16x32.c
@@ -1,7 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <linux/font.h>
+
 #include <linux/module.h>
 
+#include "font.h"
+
 #define FONTDATAMAX 16384
 
 static const struct font_data fontdata_ter16x32 = {
diff --git a/lib/fonts/fonts.c b/lib/fonts/fonts.c
index 1830e6ae9c87..198aae869be2 100644
--- a/lib/fonts/fonts.c
+++ b/lib/fonts/fonts.c
@@ -13,7 +13,6 @@
  */
 
 #include <linux/container_of.h>
-#include <linux/font.h>
 #include <linux/kd.h>
 #include <linux/module.h>
 #include <linux/overflow.h>
@@ -26,12 +25,19 @@
 #include <asm/setup.h>
 #endif
 
+#include "font.h"
+
 #define console_font_pitch(font) DIV_ROUND_UP((font)->width, 8)
 
 /*
  * Helpers for font_data_t
  */
 
+/* Extra word getters */
+#define REFCOUNT(fd)	(((int *)(fd))[-1])
+#define FNTSIZE(fd)	(((int *)(fd))[-2])
+#define FNTSUM(fd)	(((int *)(fd))[-4])
+
 static struct font_data *to_font_data_struct(font_data_t *fd)
 {
 	return container_of(fd, struct font_data, data[0]);
-- 
2.53.0

