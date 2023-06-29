Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B42742605
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 14:20:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584E710E3CF;
	Thu, 29 Jun 2023 12:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6598810E07A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 12:20:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CC89C2189A;
 Thu, 29 Jun 2023 12:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688041202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q1EPhwvEq31eQQzrYtIsQXTt/XpY0djP9Otjk0JmQCc=;
 b=Dub84nZmbr1BGiuBX3aLZCTa/8FoWtNS4BzLIrTk5qvczeKCFX53em1kSbWeLcAyIspbMx
 j6KHULUkYWyNqKDLvuCO97srdnBXPf6V9M5RJtPm/H/f0wvATtksA3VMvLECaNAMn8RMxS
 gxDb1nO4bNmBncRGAjcZ0s/8rYkvx4Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688041202;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q1EPhwvEq31eQQzrYtIsQXTt/XpY0djP9Otjk0JmQCc=;
 b=3Y1jfeE0PeJBr+WAivUH1Npe9jamuIgzZi4hsiB1oUlsIjSgHaYMy5c5OmGy6U7+S8zHKp
 tX1gbKFXmHiTluBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 59C8213905;
 Thu, 29 Jun 2023 12:20:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EFS5FPJ2nWRlVAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 29 Jun 2023 12:20:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	deller@gmx.de,
	daniel@ffwll.ch,
	airlied@gmail.com
Subject: [PATCH 12/12] fbdev/core: Define empty fb_firmware_edid() in
 <linux/fb.h>
Date: Thu, 29 Jun 2023 13:45:51 +0200
Message-ID: <20230629121952.10559-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629121952.10559-1-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-sh@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 loongarch@lists.linux.dev, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the empty declaration of fb_firmware_edid() to <linux/fb.h>.
Follow common style and avoid the overhead of exporting the symbol.
No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: Randy Dunlap <rdunlap@infradead.org>
---
 drivers/video/fbdev/core/fbmon.c |  7 +------
 include/linux/fb.h               | 10 +++++++++-
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/core/fbmon.c
index 9ae063021e431..d45bd8a18c2f2 100644
--- a/drivers/video/fbdev/core/fbmon.c
+++ b/drivers/video/fbdev/core/fbmon.c
@@ -1496,13 +1496,8 @@ const unsigned char *fb_firmware_edid(struct fb_info *info)
 
 	return edid;
 }
-#else
-const unsigned char *fb_firmware_edid(struct fb_info *info)
-{
-	return NULL;
-}
-#endif
 EXPORT_SYMBOL(fb_firmware_edid);
+#endif
 
 EXPORT_SYMBOL(fb_parse_edid);
 EXPORT_SYMBOL(fb_edid_to_monspecs);
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 5ffd2223326bf..e949532ffc109 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -761,7 +761,6 @@ extern int fb_get_mode(int flags, u32 val, struct fb_var_screeninfo *var,
 extern int fb_validate_mode(const struct fb_var_screeninfo *var,
 			    struct fb_info *info);
 extern int fb_parse_edid(unsigned char *edid, struct fb_var_screeninfo *var);
-extern const unsigned char *fb_firmware_edid(struct fb_info *info);
 extern void fb_edid_to_monspecs(unsigned char *edid,
 				struct fb_monspecs *specs);
 extern void fb_destroy_modedb(struct fb_videomode *modedb);
@@ -774,6 +773,15 @@ extern int of_get_fb_videomode(struct device_node *np,
 extern int fb_videomode_from_videomode(const struct videomode *vm,
 				       struct fb_videomode *fbmode);
 
+#if defined(CONFIG_FIRMWARE_EDID)
+const unsigned char *fb_firmware_edid(struct fb_info *info);
+#else
+static inline const unsigned char *fb_firmware_edid(struct fb_info *info)
+{
+	return NULL;
+}
+#endif
+
 /* drivers/video/modedb.c */
 #define VESA_MODEDB_SIZE 43
 #define DMT_SIZE 0x50
-- 
2.41.0

