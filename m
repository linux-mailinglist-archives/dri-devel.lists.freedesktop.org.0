Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E1A892A21
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 10:56:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C9D10E68C;
	Sat, 30 Mar 2024 09:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FGZrqnSL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF5810E68F
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 09:56:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 28E1DCE09F0;
 Sat, 30 Mar 2024 09:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EEFBC433C7;
 Sat, 30 Mar 2024 09:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1711792584;
 bh=qWW8h+4U/8SFOME0F6I7Hsxy0xupmlUxcoikQBUki4c=;
 h=Subject:To:Cc:From:Date:From;
 b=FGZrqnSLhio/TKYRHEGZzUUGdF+eMpE+KxvYxfrjX+kS8QozsalUHtrnF9Ycb16oT
 kPxM8kbG/AXULWNPLBQptx6IPxK3CsvyqOpuIVExdxUJ1Jkk+UxFeJt73uWJ56UfSb
 xqbqM+JoHWZLzjT9Zss1WU9pmG1dl6idYq3cK/d8=
Subject: Patch "fbdev: Select I/O-memory framebuffer ops for SBus" has been
 added to the 6.8-stable tree
To: 5bc21364-41da-a339-676e-5bb0f4faebfb@draconx.ca, arnd@arndb.de,
 daniel@ffwll.ch, deller@gmx.de, dri-devel@lists.freedesktop.org,
 geert+renesas@glider.be, gregkh@linuxfoundation.org, javierm@redhat.com,
 nbowler@draconx.ca, sam@ravnborg.org, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sat, 30 Mar 2024 10:53:01 +0100
Message-ID: <2024033000-overarch-caucus-d290@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    fbdev: Select I/O-memory framebuffer ops for SBus

to the 6.8-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     fbdev-select-i-o-memory-framebuffer-ops-for-sbus.patch
and it can be found in the queue-6.8 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From a8eb93b42d7e068306ca07f51055cbcde893fea3 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Fri, 22 Mar 2024 09:29:46 +0100
Subject: fbdev: Select I/O-memory framebuffer ops for SBus

From: Thomas Zimmermann <tzimmermann@suse.de>

commit a8eb93b42d7e068306ca07f51055cbcde893fea3 upstream.

Framebuffer I/O on the Sparc Sbus requires read/write helpers for
I/O memory. Select FB_IOMEM_FOPS accordingly.

Reported-by: Nick Bowler <nbowler@draconx.ca>
Closes: https://lore.kernel.org/lkml/5bc21364-41da-a339-676e-5bb0f4faebfb@draconx.ca/
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 8813e86f6d82 ("fbdev: Remove default file-I/O implementations")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.8+
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20240322083005.24269-1-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/video/fbdev/Kconfig |    3 +++
 1 file changed, 3 insertions(+)

--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -501,6 +501,7 @@ config FB_SBUS_HELPERS
 	select FB_CFB_COPYAREA
 	select FB_CFB_FILLRECT
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
 
 config FB_BW2
 	bool "BWtwo support"
@@ -521,6 +522,7 @@ config FB_CG6
 	depends on (FB = y) && (SPARC && FB_SBUS)
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
 	help
 	  This is the frame buffer device driver for the CGsix (GX, TurboGX)
 	  frame buffer.
@@ -530,6 +532,7 @@ config FB_FFB
 	depends on FB_SBUS && SPARC64
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
 	help
 	  This is the frame buffer device driver for the Creator, Creator3D,
 	  and Elite3D graphics boards.


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-6.8/drm-vc4-hdmi-do-not-return-negative-values-from-.get.patch
queue-6.8/drm-probe-helper-warn-about-negative-.get_modes.patch
queue-6.8/drm-bridge-lt8912b-do-not-return-negative-values-fro.patch
queue-6.8/drm-panel-do-not-return-negative-error-codes-from-dr.patch
queue-6.8/fbdev-select-i-o-memory-framebuffer-ops-for-sbus.patch
queue-6.8/drm-exynos-do-not-return-negative-values-from-.get_m.patch
queue-6.8/drm-imx-ipuv3-do-not-return-negative-values-from-.ge.patch
