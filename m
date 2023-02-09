Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D15DC690B03
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 14:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1607D10EAED;
	Thu,  9 Feb 2023 13:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A3410EAE4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 13:55:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 46E665D034;
 Thu,  9 Feb 2023 13:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675950914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bEwe0REbK3F3oC8Uu9FlEwtuW86iKy9KWXCWyZHO42o=;
 b=M5N88VL8Ns21zjPvhyeozFeQpsmid4Te8TprjCxeJL4xXa0Ogt5Rkj5d4DTu9Jzc8UFdfZ
 V4g7WM/oyJecv0HIPvlm2ALSGReYQu2lO2tMUQp65IfgotVxV8r/my1IOCs7U95g6ZEGlL
 RZCOqryiGQwKU4j+fS0lFl50FSl8N+U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675950914;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bEwe0REbK3F3oC8Uu9FlEwtuW86iKy9KWXCWyZHO42o=;
 b=Q2kE1JvwIkwWzaPI6UAI7dWPazGSLygPUmlGy+RdPJPAWZl6vOJH97Anc3XB3TIYaxePLJ
 VGEiqyBruRJqw5Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 096C2138E4;
 Thu,  9 Feb 2023 13:55:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OK97AUL75GNTfwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Feb 2023 13:55:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, deller@gmx.de, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, geoff@infradead.org,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: [PATCH 06/11] fbdev: Unexport fb_mode_option
Date: Thu,  9 Feb 2023 14:55:04 +0100
Message-Id: <20230209135509.7786-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209135509.7786-1-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are no external users of fb_mode_option. Unexport the variable
and declare it static.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fb_cmdline.c | 4 +---
 include/linux/fb.h                    | 1 -
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_cmdline.c b/drivers/video/fbdev/core/fb_cmdline.c
index cc8a88e8f308..512da89ff8b5 100644
--- a/drivers/video/fbdev/core/fb_cmdline.c
+++ b/drivers/video/fbdev/core/fb_cmdline.c
@@ -18,11 +18,9 @@
 #include <linux/fb.h>
 
 static char *video_options[FB_MAX] __read_mostly;
+static const char *fb_mode_option __read_mostly;
 static int ofonly __read_mostly;
 
-const char *fb_mode_option;
-EXPORT_SYMBOL_GPL(fb_mode_option);
-
 /**
  * fb_get_options - get kernel boot parameters
  * @name:   framebuffer name as it would appear in
diff --git a/include/linux/fb.h b/include/linux/fb.h
index daf336385613..054e8950b274 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -764,7 +764,6 @@ struct dmt_videomode {
 	const struct fb_videomode *mode;
 };
 
-extern const char *fb_mode_option;
 extern const struct fb_videomode vesa_modes[];
 extern const struct dmt_videomode dmt_modes[];
 
-- 
2.39.1

