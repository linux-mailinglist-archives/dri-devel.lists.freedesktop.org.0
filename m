Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E92B8769FD4
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 19:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDB7891B8;
	Mon, 31 Jul 2023 17:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2666B891B8
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 17:55:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C64F22205E;
 Mon, 31 Jul 2023 17:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690826139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=blrHYZH6S+MmbSDFCHnNDxEACT0tP3PtmP/NQlgF3tk=;
 b=wcMYO8XndgLwG5p/OyuY3UpiE0l+0HMY2x1/SXrwph3joT1jV78ELTxvq5rSvQ59fT3Nan
 eVT4LzQfnb4JQ5uE96bTIJoDTJElJZ/UjRyNF0RReDUZWsvNZAUGxD0/USFcwUfsyQ21JS
 NbhXgR+O31ACU0arIv6SxAIQFGfSIjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690826139;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=blrHYZH6S+MmbSDFCHnNDxEACT0tP3PtmP/NQlgF3tk=;
 b=YfZcOQKWYqRzLZYjV6sNoImbAU2dOa4BJTDS23JpYYytINavTcuFq9l4WepVwHoUXqYIVV
 MSoFkLnJEEaHv6Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6FDA1133F7;
 Mon, 31 Jul 2023 17:55:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id If54Gpv1x2SGOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 31 Jul 2023 17:55:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, sam@ravnborg.org, javierm@redhat.com,
 bagasdotme@gmail.com, rd.dunlab@gmail.com, regressions@leemhuis.info,
 sfr@canb.auug.org.au
Subject: [PATCH] fbdev/ps3fb: Build without kernel device
Date: Mon, 31 Jul 2023 19:55:00 +0200
Message-ID: <20230731175535.11345-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, regressions@lists.linux.dev,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use fb_info() to print status message at the end of the probe function,
which avoids decoding the devices. fb_info() works with or without an
fbdev kernel device. Fixes the following error:

../drivers/video/fbdev/ps3fb.c: In function 'ps3fb_probe':
../drivers/video/fbdev/ps3fb.c:1172:40: error: 'struct fb_info' has no member named 'dev'
 1172 |                  dev_driver_string(info->dev), dev_name(info->dev),
      |                                        ^~
../include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                                     ^~~~~~~~~~~
../drivers/video/fbdev/ps3fb.c:1171:9: note: in expansion of macro 'dev_info'
 1171 |         dev_info(info->device, "%s %s, using %u KiB of video memory\n",
      |         ^~~~~~~~
../drivers/video/fbdev/ps3fb.c:1172:61: error: 'struct fb_info' has no member named 'dev'
 1172 |                  dev_driver_string(info->dev), dev_name(info->dev),
      |                                                             ^~
../include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                                     ^~~~~~~~~~~
../drivers/video/fbdev/ps3fb.c:1171:9: note: in expansion of macro 'dev_info'
 1171 |         dev_info(info->device, "%s %s, using %u KiB of video memory\n",
      |         ^~~~~~~~

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/lkml/ccc63065-2976-88ef-1211-731330bf2866@infradead.org/
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 701d2054fa31 ("fbdev: Make support for userspace interfaces configurable")
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Helge Deller <deller@gmx.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
---
 drivers/video/fbdev/ps3fb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/ps3fb.c b/drivers/video/fbdev/ps3fb.c
index 5aedc30c5f7e..64d291d6b153 100644
--- a/drivers/video/fbdev/ps3fb.c
+++ b/drivers/video/fbdev/ps3fb.c
@@ -1168,9 +1168,7 @@ static int ps3fb_probe(struct ps3_system_bus_device *dev)
 
 	ps3_system_bus_set_drvdata(dev, info);
 
-	dev_info(info->device, "%s %s, using %u KiB of video memory\n",
-		 dev_driver_string(info->dev), dev_name(info->dev),
-		 info->fix.smem_len >> 10);
+	fb_info(info, "using %u KiB of video memory\n", info->fix.smem_len >> 10);
 
 	task = kthread_run(ps3fbd, info, DEVICE_NAME);
 	if (IS_ERR(task)) {
-- 
2.41.0

