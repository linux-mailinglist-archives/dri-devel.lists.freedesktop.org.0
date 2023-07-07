Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D508E74AD27
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 10:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E07610E544;
	Fri,  7 Jul 2023 08:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D7510E528
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 08:34:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AD988227C6;
 Fri,  7 Jul 2023 08:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688718869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pG2atEnU/fnP5AEZfc/l6A/pO+L/pdnmLd89LQ4Iezc=;
 b=z/1iK313cscssnSl3dukt9zaU/NvtiPYTbe1opqCaObgoeQyIYIu6KWiAKpUuSqep1JrwJ
 allC6ursXV8sNpzlEpZFp6UV9gDWqRTKHpVHJXhFoXDWC0vjGcjx5yBDWkMZKDtwMM3DwR
 3GH0D+J0Hr7NDnhSsXbgd/OkhPPGpX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688718869;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pG2atEnU/fnP5AEZfc/l6A/pO+L/pdnmLd89LQ4Iezc=;
 b=zFeqG4PkIL07SuW6SJkGFssK3z7jLnXtgnpdYnTtVcIxMj8Nb97Q9jXvOSA32fm5x4vtNo
 rahxaezobqYQSzCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7BA681346D;
 Fri,  7 Jul 2023 08:34:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EFvwHBXOp2RdQAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Jul 2023 08:34:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v3 12/12] fbdev: Harmonize some comments in <linux/fb.h>
Date: Fri,  7 Jul 2023 10:32:03 +0200
Message-ID: <20230707083422.18691-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230707083422.18691-1-tzimmermann@suse.de>
References: <20230707083422.18691-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the comments for I/O, system and DMA memory say the same.
Makes the header file's structure more obvious.

Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 include/linux/fb.h | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index d370f84fbca9..c8ca9c265fda 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -529,7 +529,7 @@ extern int fb_pan_display(struct fb_info *info, struct fb_var_screeninfo *var);
 extern int fb_blank(struct fb_info *info, int blank);
 
 /*
- * Drawing operations where framebuffer is in I/O memory
+ * Helpers for framebuffers in I/O memory
  */
 
 extern void cfb_fillrect(struct fb_info *info, const struct fb_fillrect *rect);
@@ -540,10 +540,6 @@ extern ssize_t fb_io_read(struct fb_info *info, char __user *buf,
 extern ssize_t fb_io_write(struct fb_info *info, const char __user *buf,
 			   size_t count, loff_t *ppos);
 
-/*
- * Initializes struct fb_ops for framebuffers in I/O memory.
- */
-
 #define __FB_DEFAULT_IO_OPS_RDWR \
 	.fb_read	= fb_io_read, \
 	.fb_write	= fb_io_write
@@ -562,7 +558,7 @@ extern ssize_t fb_io_write(struct fb_info *info, const char __user *buf,
 	__FB_DEFAULT_IO_OPS_MMAP
 
 /*
- * Drawing operations where framebuffer is in system RAM
+ * Helpers for framebuffers in system memory
  */
 
 extern void sys_fillrect(struct fb_info *info, const struct fb_fillrect *rect);
@@ -573,10 +569,6 @@ extern ssize_t fb_sys_read(struct fb_info *info, char __user *buf,
 extern ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
 			    size_t count, loff_t *ppos);
 
-/*
- * Initializes struct fb_ops for framebuffers in system memory.
- */
-
 #define __FB_DEFAULT_SYS_OPS_RDWR \
 	.fb_read	= fb_sys_read, \
 	.fb_write	= fb_sys_write
-- 
2.41.0

