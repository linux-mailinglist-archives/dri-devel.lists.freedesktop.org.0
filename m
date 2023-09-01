Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E7F78F987
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 10:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D990010E73C;
	Fri,  1 Sep 2023 08:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 349 seconds by postgrey-1.36 at gabe;
 Fri, 01 Sep 2023 08:10:02 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C406A10E73C
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 08:10:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3FE99CE22C5;
 Fri,  1 Sep 2023 08:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18CD1C433C8;
 Fri,  1 Sep 2023 08:04:06 +0000 (UTC)
Date: Fri, 1 Sep 2023 10:04:04 +0200
From: Helge Deller <deller@gmx.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev fixes and updates for v6.6-rc1
Message-ID: <ZPGa9CmtieKVUUVF@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

please pull some fbdev fixes & updates for kernel 6.6-rc1.

Remove the mx3fb driver and various smaller cleanups.

Thanks!
Helge

--------------

The following changes since commit 87dfd85c38923acd9517e8df4afc908565df0961:

  Merge tag 'for-linus' of git://git.armlinux.org.uk/~rmk/linux-arm (2023-08-31 12:49:10 -0700)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.6-rc1

for you to fetch changes up to 4a9762aa358ee0e3deb6e759959f092a3cea86be:

  fbdev: Update fbdev source file paths (2023-09-01 00:29:34 +0200)

----------------------------------------------------------------
fbdev fixes and cleanups for 6.6-rc1:

- Drop the mx3fb driver
- Use list_for_each_entry() helper in fbcore code
- Shorten neofb product names for fb-fix id field
- reduce memory usage in ssd1307fb

----------------------------------------------------------------
Fabio Estevam (1):
      fbdev: mx3fb: Remove the driver

Geert Uytterhoeven (1):
      fbdev: ssd1307fb: Use bool for ssd1307fb_deviceinfo flags

Helge Deller (1):
      fbdev: neofb: Shorten Neomagic product name in info struct

Jinjie Ruan (1):
      fbdev/core: Use list_for_each_entry() helper

Jonathan Neuschäfer (1):
      fbdev: Update fbdev source file paths

 drivers/video/fbdev/Kconfig               |   11 -
 drivers/video/fbdev/Makefile              |    1 -
 drivers/video/fbdev/core/fbsysfs.c        |    8 +-
 drivers/video/fbdev/core/modedb.c         |   22 +-
 drivers/video/fbdev/mx3fb.c               | 1695 -----------------------------
 drivers/video/fbdev/neofb.c               |   27 +-
 drivers/video/fbdev/ssd1307fb.c           |    4 +-
 include/linux/fb.h                        |   10 +-
 include/linux/platform_data/video-mx3fb.h |   50 -
 9 files changed, 23 insertions(+), 1805 deletions(-)
 delete mode 100644 drivers/video/fbdev/mx3fb.c
 delete mode 100644 include/linux/platform_data/video-mx3fb.h
