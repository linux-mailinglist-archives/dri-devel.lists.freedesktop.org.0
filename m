Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D9AADD01C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 16:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C8810E74D;
	Tue, 17 Jun 2025 14:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ChjwgWTb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/bzrDfF8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ChjwgWTb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/bzrDfF8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAD310E744
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 14:39:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5CE9C1F7A8;
 Tue, 17 Jun 2025 14:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750171188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCNJZ5WWYqbL27M3Usn1k/plPSrdUvwe692pIh0pufs=;
 b=ChjwgWTbDMB7lH2RANBrvY9LU6xNP8am9ORQCReYmPCJkGyEhvlWVh9d9DTAsCwhzrYdu/
 2N+8pISYbJfxftlCinJ0l25iBIPadeoE4s4qyWpxI2nNo08BzR40a4Yk9OFisyARHgFsCv
 LhCQWQPTtj5OD6+S4bHovKM4WBs7OWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750171188;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCNJZ5WWYqbL27M3Usn1k/plPSrdUvwe692pIh0pufs=;
 b=/bzrDfF8M4+fcPmJKa/BT41j9WnGNPq9yPnu9wbtWiPCb0O5iFxUKHxzlo3kUHn3mutPYo
 e3bWqNCmtcedWDBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750171188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCNJZ5WWYqbL27M3Usn1k/plPSrdUvwe692pIh0pufs=;
 b=ChjwgWTbDMB7lH2RANBrvY9LU6xNP8am9ORQCReYmPCJkGyEhvlWVh9d9DTAsCwhzrYdu/
 2N+8pISYbJfxftlCinJ0l25iBIPadeoE4s4qyWpxI2nNo08BzR40a4Yk9OFisyARHgFsCv
 LhCQWQPTtj5OD6+S4bHovKM4WBs7OWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750171188;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCNJZ5WWYqbL27M3Usn1k/plPSrdUvwe692pIh0pufs=;
 b=/bzrDfF8M4+fcPmJKa/BT41j9WnGNPq9yPnu9wbtWiPCb0O5iFxUKHxzlo3kUHn3mutPYo
 e3bWqNCmtcedWDBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 35E8513A69;
 Tue, 17 Jun 2025 14:39:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sCq6CzR+UWh8bQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Jun 2025 14:39:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/9] video: screen_info: Add pixel-format helper for linear
 framebuffers
Date: Tue, 17 Jun 2025 16:23:14 +0200
Message-ID: <20250617143649.143967-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617143649.143967-1-tzimmermann@suse.de>
References: <20250617143649.143967-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -6.80
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

Add screen_info_pixel_format(), which converts a screen_info's
information about the color format to struct pixel_format. The encoding
within the screen_info structure is complex and therefore prone to
errors. Later patches will convert callers to use the pixel format.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/screen_info_generic.c | 55 +++++++++++++++++++++++++++++
 include/linux/screen_info.h         |  2 ++
 2 files changed, 57 insertions(+)

diff --git a/drivers/video/screen_info_generic.c b/drivers/video/screen_info_generic.c
index 900e9386eceb..763adbba71cb 100644
--- a/drivers/video/screen_info_generic.c
+++ b/drivers/video/screen_info_generic.c
@@ -5,6 +5,8 @@
 #include <linux/screen_info.h>
 #include <linux/string.h>
 
+#include <video/pixel_format.h>
+
 static void resource_init_named(struct resource *r,
 				resource_size_t start, resource_size_t size,
 				const char *name, unsigned int flags)
@@ -180,3 +182,56 @@ u32 __screen_info_lfb_bits_per_pixel(const struct screen_info *si)
 	return bits_per_pixel;
 }
 EXPORT_SYMBOL(__screen_info_lfb_bits_per_pixel);
+
+static int __screen_info_lfb_pixel_format(const struct screen_info *si, struct pixel_format *f)
+{
+	u32 bits_per_pixel = __screen_info_lfb_bits_per_pixel(si);
+
+	if (bits_per_pixel > U8_MAX)
+		return -EINVAL;
+
+	f->bits_per_pixel = bits_per_pixel;
+
+	if (si->lfb_depth > 8) {
+		f->indexed = false;
+		f->alpha.offset = 0;
+		f->alpha.length = 0;
+		f->red.offset = si->red_pos;
+		f->red.length = si->red_size;
+		f->green.offset = si->green_pos;
+		f->green.length = si->green_size;
+		f->blue.offset = si->blue_pos;
+		f->blue.length = si->blue_size;
+	} else {
+		f->indexed = true;
+		f->index.offset = 0;
+		f->index.length = si->lfb_depth;
+	}
+
+	return 0;
+}
+
+/**
+ * screen_info_pixel_format - Returns the screen-info format as pixel-format description
+ *
+ * @si: the screen_info
+ * @f: pointer to return pixel-format description
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ */
+int screen_info_pixel_format(const struct screen_info *si, struct pixel_format *f)
+{
+	unsigned int type = screen_info_video_type(si);
+
+	/* TODO: Add support for additional types as needed. */
+	switch (type) {
+	case VIDEO_TYPE_VLFB:
+	case VIDEO_TYPE_EFI:
+		return __screen_info_lfb_pixel_format(si, f);
+	}
+
+	/* not supported */
+	return -EINVAL;
+}
+EXPORT_SYMBOL(screen_info_pixel_format);
diff --git a/include/linux/screen_info.h b/include/linux/screen_info.h
index 923d68e07679..1690706206e8 100644
--- a/include/linux/screen_info.h
+++ b/include/linux/screen_info.h
@@ -12,6 +12,7 @@
 #define SCREEN_INFO_MAX_RESOURCES	3
 
 struct pci_dev;
+struct pixel_format;
 struct resource;
 
 static inline bool __screen_info_has_lfb(unsigned int type)
@@ -136,6 +137,7 @@ static inline u32 __screen_info_vesapm_info_base(const struct screen_info *si)
 ssize_t screen_info_resources(const struct screen_info *si, struct resource *r, size_t num);
 
 u32 __screen_info_lfb_bits_per_pixel(const struct screen_info *si);
+int screen_info_pixel_format(const struct screen_info *si, struct pixel_format *f);
 
 #if defined(CONFIG_PCI)
 void screen_info_apply_fixups(void);
-- 
2.49.0

