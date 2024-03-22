Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EA688707C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 17:10:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B3610EB97;
	Fri, 22 Mar 2024 16:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NEa+617z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA83D10EB97
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 16:10:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AB3D7CE0187;
 Fri, 22 Mar 2024 16:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8369DC433C7;
 Fri, 22 Mar 2024 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711123817;
 bh=Qjtq2wXAU324eUdNx1w4/HYyFHq77oZw5qpk2Noef4c=;
 h=Date:From:To:Subject:From;
 b=NEa+617zEcJHGxnmY6gCZqYL2SUxo3byK5uzGBirzzdmRUJjHjb3ZeZ9nM81YbTVr
 l6DhzWMMUYoRZ+LiMG3OUArLCtqMLdE3r5lug6wdPYflty7Rmhwzc5Zlb80SXngBK3
 4DeJaO9DiF/VO0rquE/4uFsfqH/LHSxUlKhnilIqA/EQwKErEuBMhgHfEouYj5S5G8
 l7gaDuUZ2OAnwYLI/au7QaUKWkHKBbDAcRUy6HDiz68t8zjnMlswqUOn4PQ8eDssOQ
 aLnf7n/jdJpg7IyvO4uJAHH/poexRbAIeMShJRlLKCUI+w1tIOgMMBLDIZvk31TxvQ
 273DabFMr7b0Q==
Date: Fri, 22 Mar 2024 17:10:13 +0100
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev fixes and cleanups for v6.9-rc1 (v2)
Message-ID: <Zf2tZcWuMMQGFGgb@carbonx1>
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

Yesterday's fbdev tree showed one small compiler warning which has been fixed
in this pull request.

So, please pull the latest fixes and cleanups for the fbdev drivers for kernel 6.9-rc1.

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
