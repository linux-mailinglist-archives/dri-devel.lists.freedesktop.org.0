Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6D373FF22
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 16:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FAC910E039;
	Tue, 27 Jun 2023 14:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7882210E039
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 14:58:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6A0AF21898;
 Tue, 27 Jun 2023 14:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687877926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+AnPE2EhFo6W/qqAMZnuyc6esjF58TEFFbkBy5JTrLI=;
 b=BzUWwPXwULcHgEZ+gHsTCHFLYHNf3+mXVoMyX0NuLNzWZn6bKnS76Pp1qTrkf1az89ePRg
 f84PJp7Y0ybiW4owISoJPWOQHzJF2aYRmUPpmTgkohzPhhcu+inzbG00DXzicnoBkp3Dv+
 aM6q/C3moA86ooNRJqQl8iUcIxvAoWU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687877926;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+AnPE2EhFo6W/qqAMZnuyc6esjF58TEFFbkBy5JTrLI=;
 b=6/gSwSlHsFleByQJBJh3RWHq1sI6orcekPPoVaQ5fTB9iuWJzxyCbcgQZNqYv6Du7y/vME
 5TWLfSlbDV9wYZCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3AC0813462;
 Tue, 27 Jun 2023 14:58:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8AeNDSb5mmQxHQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Jun 2023 14:58:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: davem@davemloft.net, arnd@arndb.de, linux@roeck-us.net, sam@ravnborg.org,
 deller@gmx.de
Subject: [PATCH] arch/sparc: Add module license and description for fbdev
 helpers
Date: Tue, 27 Jun 2023 16:58:20 +0200
Message-ID: <20230627145843.31794-1-tzimmermann@suse.de>
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
Cc: sparclinux@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add MODULE_LICENSE() and MODULE_DESCRIPTION() for fbdev helpers
on sparc. Fixes the following error:

ERROR: modpost: missing MODULE_LICENSE() in arch/sparc/video/fbdev.o

Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/dri-devel/c525adc9-6623-4660-8718-e0c9311563b8@roeck-us.net/
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 4eec0b3048fc ("arch/sparc: Implement fb_is_primary_device() in source file")
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Helge Deller <deller@gmx.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: sparclinux@vger.kernel.org
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 arch/sparc/video/fbdev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/sparc/video/fbdev.c b/arch/sparc/video/fbdev.c
index 25837f128132d..bff66dd1909a4 100644
--- a/arch/sparc/video/fbdev.c
+++ b/arch/sparc/video/fbdev.c
@@ -21,3 +21,6 @@ int fb_is_primary_device(struct fb_info *info)
 	return 0;
 }
 EXPORT_SYMBOL(fb_is_primary_device);
+
+MODULE_DESCRIPTION("Sparc fbdev helpers");
+MODULE_LICENSE("GPL");
-- 
2.41.0

