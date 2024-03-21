Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71D6886088
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 19:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1866610FAA0;
	Thu, 21 Mar 2024 18:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h9RRziWb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D70C10FAE9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 18:29:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D38B56117F;
 Thu, 21 Mar 2024 18:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D14BC433C7;
 Thu, 21 Mar 2024 18:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711045771;
 bh=E3plSq6pMYSImGt0wVp3XxOmTpdXXINVNGbm/p3aTMM=;
 h=Date:From:To:Subject:From;
 b=h9RRziWb4sYzLp83UC+myLIxGZ/xZ+Gb9KE5rKE69gcMKZfFVp0mKxn6VGkqWkqpi
 a8cjiOJh05K6IN965aaGSlxOhQWF+DAfT4wcoHM3wyN68EKL8h0AjsBs4pDUhwbFTE
 1iN2lNLZjKHHdin8q4T0gTh7apB39S5UhJvbslWqvRexHqU9L7YJMQs0x4vrWeXiBl
 AXTuWEeQZgia0PwCw+pSgbyMNyIE7VzoRSSTiyd4yfR60c/zM4guwUtx6jprHyRl9D
 xC4aTeow+XHH+lZ81TNZaR8xUrMLaEYV+vsl9Ljdf42AjYiHWMTbQuy9yGR4Sz4zWo
 W8uPB5/7uaahw==
Date: Thu, 21 Mar 2024 19:29:26 +0100
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev fixes and cleanups for v6.9-rc1
Message-ID: <Zfx8hg0RRDmKbJ0O@carbonx1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

please pull fixes and cleanups for the fbdev subsystem for kernel 6.9-rc1.

Beside the typical bunch of smaller fixes, the Linux console now allows fonts
up to a size of 64 x 128 pixels.

Thanks!
Helge

----------------------------------------------------------------
The following changes since commit 41bccc98fb7931d63d03f326a746ac4d429c1dd3:

  Linux 6.8-rc2 (2024-01-28 17:01:12 -0800)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.9-rc1

for you to fetch changes up to 0688d3b1d882dd1dcf73305306e71ebf1653f595:

  fbdev: panel-tpo-td043mtea1: Convert sprintf() to sysfs_emit() (2024-03-20 09:02:32 +0100)

----------------------------------------------------------------
fbdev fixes and cleanups for 6.9-rc1:

- Allow console fonts up to 64x128 pixels (Samuel Thibault)
- Prevent division-by-zero in fb monitor code (Roman Smirnov)
- Drop Renesas ARM platforms from Mobile LCDC framebuffer driver
  (Geert Uytterhoeven)
- Various code cleanups in viafb, uveafb and mb862xxfb drivers by
  Aleksandr Burakov, Li Zhijian and Michael Ellerman

----------------------------------------------------------------
Aleksandr Burakov (1):
      fbdev: viafb: fix typo in hw_bitblt_1 and hw_bitblt_2

Geert Uytterhoeven (1):
      fbdev: Restrict FB_SH_MOBILE_LCDC to SuperH

Li Zhijian (2):
      fbdev: uvesafb: Convert sprintf/snprintf to sysfs_emit
      fbdev: panel-tpo-td043mtea1: Convert sprintf() to sysfs_emit()

Michael Ellerman (1):
      fbdev: mb862xxfb: Fix defined but not used error

Roman Smirnov (1):
      fbmon: prevent division by zero in fb_videomode_from_videomode()

Samuel Thibault (1):
      fbcon: Increase maximum font width x height to 64 x 128

 drivers/firmware/efi/earlycon.c                        |  2 +-
 drivers/video/fbdev/Kconfig                            |  2 +-
 drivers/video/fbdev/arkfb.c                            | 15 +++++++++++----
 drivers/video/fbdev/core/fbcon.c                       | 16 +++++++++-------
 drivers/video/fbdev/core/fbmem.c                       | 12 ++++++------
 drivers/video/fbdev/core/fbmon.c                       |  7 ++++---
 drivers/video/fbdev/core/svgalib.c                     | 15 +++++++++++----
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c             | 18 +++++++++---------
 .../fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c | 12 ++++--------
 drivers/video/fbdev/s3fb.c                             | 15 +++++++++++----
 drivers/video/fbdev/uvesafb.c                          |  2 +-
 drivers/video/fbdev/vga16fb.c                          |  6 +++++-
 drivers/video/fbdev/via/accel.c                        |  4 ++--
 drivers/video/fbdev/vt8623fb.c                         | 15 +++++++++++----
 drivers/video/sticore.c                                |  2 +-
 include/linux/fb.h                                     | 18 ++++++++++++------
 include/linux/font.h                                   |  3 ++-
 lib/fonts/fonts.c                                      | 15 +++++++++------
 18 files changed, 110 insertions(+), 69 deletions(-)
