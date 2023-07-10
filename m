Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E812074CF47
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FAF10E218;
	Mon, 10 Jul 2023 07:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B847F10E218
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:58:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6235C1F38D;
 Mon, 10 Jul 2023 07:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688975931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TSxAHMmxEivW56VlqKGsszG1dOS5ltPLD3X3UNzkHWk=;
 b=lLntlDmEtq0NiiEA8k9LkWNUJ1FWJNjqAwjWqygWd8zkJvNixJas1iH8KtfHVi5KX7QmdS
 h4r9Oa8mCe7MriH2fVthy+BJYf4j5FxVa82m/zZVueeup4LGJpoO2rn8tkvnrrLANrwW3b
 7S4Vs7vAEu4V9R2MfplkYT8R04aHjpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688975931;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TSxAHMmxEivW56VlqKGsszG1dOS5ltPLD3X3UNzkHWk=;
 b=dO6QvqfGpg3ZveLg9PRn/TjXXRwJz8hDV/klYAZFb3zFMznVXAm7Cr/SP1J796+u7a4UG4
 Z+o5+cavxPEr/UDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0B6AA13A05;
 Mon, 10 Jul 2023 07:58:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Zt3MATu6q2SAfwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Jul 2023 07:58:51 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, javierm@redhat.com, suijingfeng@loongson.cn,
 decui@microsoft.com, wei.liu@kernel.org, haiyangz@microsoft.com,
 kys@microsoft.com
Subject: [PATCH] fbdev/hyperv_fb: Include <linux/screen_info.h>
Date: Mon, 10 Jul 2023 09:58:38 +0200
Message-ID: <20230710075848.23087-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Include <linux/screen_info.h> to get the global screen_info state.
Fixes the following errors:

>> drivers/video/fbdev/hyperv_fb.c:1033:10: error: use of undeclared identifier 'screen_info'
    1033 |                 base = screen_info.lfb_base;
         |                        ^
   drivers/video/fbdev/hyperv_fb.c:1034:10: error: use of undeclared identifier 'screen_info'
    1034 |                 size = screen_info.lfb_size;
	 |                        ^
>> drivers/video/fbdev/hyperv_fb.c:1080:3: error: must use 'struct' tag to refer to type 'screen_info'
    1080 |                 screen_info.lfb_size = 0;
	 |                 ^
	 |                 struct
>> drivers/video/fbdev/hyperv_fb.c:1080:14: error: expected identifier or '('
    1080 |                 screen_info.lfb_size = 0;
	 |                            ^
   drivers/video/fbdev/hyperv_fb.c:1081:3: error: must use 'struct' tag to refer to type 'screen_info'
    1081 |                 screen_info.lfb_base = 0;
	 |                 ^
	 |                 struct
   drivers/video/fbdev/hyperv_fb.c:1081:14: error: expected identifier or '('
    1081 |                 screen_info.lfb_base = 0;
	 |                            ^
   drivers/video/fbdev/hyperv_fb.c:1082:3: error: must use 'struct' tag to refer to type 'screen_info'
    1082 |                 screen_info.orig_video_isVGA = 0;
	 |                 ^
	 |                 struct
    drivers/video/fbdev/hyperv_fb.c:1082:14: error: expected identifier or '('
    1082 |                 screen_info.orig_video_isVGA = 0;
	 |                            ^
    8 errors generated.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202307101042.rqehuauj-lkp@intel.com/
Fixes: 8b0d13545b09 ("efi: Do not include <linux/screen_info.h> from EFI header")
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "K. Y. Srinivasan" <kys@microsoft.com> (supporter:Hyper-V/Azure CORE AND DRIVERS)
Cc: Haiyang Zhang <haiyangz@microsoft.com> (supporter:Hyper-V/Azure CORE AND DRIVERS)
Cc: Wei Liu <wei.liu@kernel.org> (supporter:Hyper-V/Azure CORE AND DRIVERS)
Cc: Dexuan Cui <decui@microsoft.com> (supporter:Hyper-V/Azure CORE AND DRIVERS)
Cc: Helge Deller <deller@gmx.de> (maintainer:FRAMEBUFFER LAYER)
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Sui Jingfeng <suijingfeng@loongson.cn>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-efi@vger.kernel.org
Cc: linux-hyperv@vger.kernel.org (open list:Hyper-V/Azure CORE AND DRIVERS)
Cc: linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER)
Cc: dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER LAYER)
---
 drivers/video/fbdev/hyperv_fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 1ae35ab62b29..b331452aab4f 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -48,6 +48,7 @@
 #include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/screen_info.h>
 #include <linux/vmalloc.h>
 #include <linux/init.h>
 #include <linux/completion.h>
-- 
2.41.0

