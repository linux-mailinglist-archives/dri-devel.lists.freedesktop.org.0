Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0AC7FA0BC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9918310E279;
	Mon, 27 Nov 2023 13:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4C910E26D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:17:07 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 36DFA20403;
 Mon, 27 Nov 2023 13:17:06 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 13260132A6;
 Mon, 27 Nov 2023 13:17:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id UK+YA9KWZGUhLQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Nov 2023 13:17:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de
Subject: [PATCH v2 27/32] fbdev: Rename FB_SYS_FOPS token to FB_SYSMEM_FOPS
Date: Mon, 27 Nov 2023 14:15:56 +0100
Message-ID: <20231127131655.4020-28-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127131655.4020-1-tzimmermann@suse.de>
References: <20231127131655.4020-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++++
X-Spam-Score: 7.73
X-Rspamd-Server: rspamd1
Authentication-Results: smtp-out2.suse.de; dkim=none;
 spf=softfail (smtp-out2.suse.de: 2a07:de40:b281:104:10:150:64:98 is neither
 permitted nor denied by domain of tzimmermann@suse.de)
 smtp.mailfrom=tzimmermann@suse.de; 
 dmarc=fail reason="No valid SPF,
 No valid DKIM" header.from=suse.de (policy=none)
X-Rspamd-Queue-Id: 36DFA20403
X-Spam-Flag: NO
X-Spam-Level: *******
X-Spamd-Result: default: False [7.73 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; R_SPF_SOFTFAIL(4.60)[~all:c];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_THREE(0.00)[3];
 MX_GOOD(-0.01)[]; NEURAL_HAM_SHORT(-0.17)[-0.855];
 FREEMAIL_TO(0.00)[redhat.com,gmx.de]; FROM_EQ_ENVFROM(0.00)[];
 R_DKIM_NA(2.20)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_HAM_LONG(-0.89)[-0.891];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 DMARC_POLICY_SOFTFAIL(0.10)[suse.de : No valid SPF, No valid DKIM,none]
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

Rename the token to harmonize naming among various helpers. For
example, I/O-memory helpers use FB_IOMEM_FOPS.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/Kconfig       | 4 ++--
 drivers/video/fbdev/core/Kconfig  | 6 +++---
 drivers/video/fbdev/core/Makefile | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 37c8188752baf..d5909a9206ffd 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1464,7 +1464,7 @@ config FB_VT8500
 	select FB_SYS_FILLRECT if (!FB_WMT_GE_ROPS)
 	select FB_SYS_COPYAREA if (!FB_WMT_GE_ROPS)
 	select FB_SYS_IMAGEBLIT
-	select FB_SYS_FOPS
+	select FB_SYSMEM_FOPS
 	select FB_MODE_HELPERS
 	select VIDEOMODE_HELPERS
 	help
@@ -1477,7 +1477,7 @@ config FB_WM8505
 	select FB_SYS_FILLRECT if (!FB_WMT_GE_ROPS)
 	select FB_SYS_COPYAREA if (!FB_WMT_GE_ROPS)
 	select FB_SYS_IMAGEBLIT
-	select FB_SYS_FOPS
+	select FB_SYSMEM_FOPS
 	select FB_MODE_HELPERS
 	select VIDEOMODE_HELPERS
 	help
diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
index 7a3ed13bed708..faab5d50cac3c 100644
--- a/drivers/video/fbdev/core/Kconfig
+++ b/drivers/video/fbdev/core/Kconfig
@@ -129,7 +129,7 @@ config FB_LITTLE_ENDIAN
 
 endchoice
 
-config FB_SYS_FOPS
+config FB_SYSMEM_FOPS
 	tristate
 	depends on FB_CORE
 
@@ -142,8 +142,8 @@ config FB_DMAMEM_HELPERS
 	depends on FB_CORE
 	select FB_SYS_COPYAREA
 	select FB_SYS_FILLRECT
-	select FB_SYS_FOPS
 	select FB_SYS_IMAGEBLIT
+	select FB_SYSMEM_FOPS
 
 config FB_IOMEM_FOPS
 	tristate
@@ -168,8 +168,8 @@ config FB_SYSMEM_HELPERS
 	depends on FB_CORE
 	select FB_SYS_COPYAREA
 	select FB_SYS_FILLRECT
-	select FB_SYS_FOPS
 	select FB_SYS_IMAGEBLIT
+	select FB_SYSMEM_FOPS
 
 config FB_SYSMEM_HELPERS_DEFERRED
 	bool
diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
index c1d657601b2be..d159747590869 100644
--- a/drivers/video/fbdev/core/Makefile
+++ b/drivers/video/fbdev/core/Makefile
@@ -32,6 +32,6 @@ obj-$(CONFIG_FB_IOMEM_FOPS)    += fb_io_fops.o
 obj-$(CONFIG_FB_SYS_FILLRECT)  += sysfillrect.o
 obj-$(CONFIG_FB_SYS_COPYAREA)  += syscopyarea.o
 obj-$(CONFIG_FB_SYS_IMAGEBLIT) += sysimgblt.o
-obj-$(CONFIG_FB_SYS_FOPS)      += fb_sys_fops.o
+obj-$(CONFIG_FB_SYSMEM_FOPS)   += fb_sys_fops.o
 obj-$(CONFIG_FB_SVGALIB)       += svgalib.o
 obj-$(CONFIG_FB_DDC)           += fb_ddc.o
-- 
2.43.0

