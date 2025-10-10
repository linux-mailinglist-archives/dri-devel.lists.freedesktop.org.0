Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4FABCD452
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 15:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64B210E2A0;
	Fri, 10 Oct 2025 13:31:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cLMDkBYV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621E710E2A0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 13:31:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 231164033E;
 Fri, 10 Oct 2025 13:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E9EC4CEF1;
 Fri, 10 Oct 2025 13:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760103091;
 bh=DBBGRFqDlMVt5G1ikqwvqLGMEPnfjnHGilMhjC87DJQ=;
 h=Date:From:To:Subject:From;
 b=cLMDkBYV3nNQ67EHcMPOETbVwjTgVdaJ17impKXuFxM7IaSvWpmR0yxb6/lz9fMfT
 m7vsAF1E2MBFUxHNJE5PvYSGeQ2UzuqgibaTx0WzSNr6euijOSH70A9STnQpcy9I3q
 KLV4Qe1fxscm6mUxtEu5uqrqQXqvsHhmiVzOH+Wl9vOvAOKbQxjaDfNPHeJcNJwCm5
 sEa5N9wesZaC8NpRUtu62bCJzLmeVug9CjYsK53nCI9l2iARWF33gR7buUv8Q/SFnO
 qMtLIkm+35cKSr9Xkwe+3A7a9WqfgyJE0Ep31WQOCgMVwFkwXPzbqWPN6ZJYHlDSrZ
 2YQeeD5K1vMDg==
Date: Fri, 10 Oct 2025 15:31:26 +0200
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev updates for v6.18-rc1
Message-ID: <aOkKroU5EAorYET0@carbonx1>
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

please pull the fbdev updates for 6.18-rc1.

Beside the usual bunch of smaller bug fixes, the majority of changes
were by Zsolt Kajtar to improve the s3fb driver.

All patches have been a few days in for-next.
Last minute I decided to drop one patch yesterday, which is why it seems the
newest patch isn't that long in for-next yet....

Thanks,
Helge

----------------------------------------------------------------
The following changes since commit e5f0a698b34ed76002dc5cff3804a61c80233a7a:

  Linux 6.17 (2025-09-28 14:39:22 -0700)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.18-rc1

for you to fetch changes up to 15df28699b28d6b49dc305040c4e26a9553df07a:

  fbdev: Fix logic error in "offb" name match (2025-10-10 00:31:13 +0200)

----------------------------------------------------------------
fbdev fixes & enhancements for 6.18-rc1:

Bug fixes:
- Add bounds checking in bit_putcs to fix vmalloc-out-of-bounds (Albin Babu Varghese)
- Fix logic error in "offb" name match (Finn Thain)
- simplefb: Fix use after free in simplefb_detach_genpds() (Janne Grunau)
- s3fb: Various fixes and powersave improvements (Zsolt Kajtar)

Enhancements & code cleanups:
- Various fixes in the documentation (Bagas Sanjaya)
- Use string choices helpers (Chelsy Ratnawat)
- xenfb: Use vmalloc_array to simplify code (Qianfeng Rong)
- mb862xxfb: Use int type to store negative error codes (Qianfeng Rong)
- Make drivers depend on LCD_CLASS_DEVICE (Thomas Zimmermann)
- radeonfb: Remove stale product link in Kconfig (Sukrut Heroorkar)

----------------------------------------------------------------
Albin Babu Varghese (1):
      fbdev: Add bounds checking in bit_putcs to fix vmalloc-out-of-bounds

Bagas Sanjaya (3):
      Documentation: fb: Split toctree
      Documentation: fb: ep93xx: Demote section headings
      Documentation: fb: Retitle driver docs

Chelsy Ratnawat (1):
      fbdev: Use string choices helpers

Finn Thain (1):
      fbdev: Fix logic error in "offb" name match

Janne Grunau (1):
      fbdev: simplefb: Fix use after free in simplefb_detach_genpds()

Qianfeng Rong (2):
      fbdev: xenfb: Use vmalloc_array to simplify code
      fbdev: mb862xxfb: Use int type to store negative error codes

Sukrut Heroorkar (1):
      fbdev: radeonfb: Remove stale product link in Kconfig

Thomas Zimmermann (1):
      fbdev: Make drivers depend on LCD_CLASS_DEVICE

Zsolt Kajtar (4):
      fbdev: s3fb: Implement powersave for S3 FB
      fbdev: s3fb: Implement 1 and 2 BPP modes, improve 4 BPP
      fbdev: core: Fix ubsan warning in pixel_to_pat
      fbdev: s3fb: Revert mclk stop in suspend

 Documentation/fb/aty128fb.rst              |   8 +-
 Documentation/fb/efifb.rst                 |   6 +-
 Documentation/fb/ep93xx-fb.rst             |   4 -
 Documentation/fb/gxfb.rst                  |   8 +-
 Documentation/fb/index.rst                 |  80 +++++++------
 Documentation/fb/lxfb.rst                  |   9 +-
 Documentation/fb/matroxfb.rst              |   9 +-
 Documentation/fb/pvr2fb.rst                |   6 +-
 Documentation/fb/sa1100fb.rst              |   9 +-
 Documentation/fb/sisfb.rst                 |   6 +-
 Documentation/fb/sm712fb.rst               |   6 +-
 Documentation/fb/tgafb.rst                 |   6 +-
 Documentation/fb/udlfb.rst                 |   6 +-
 Documentation/fb/vesafb.rst                |   6 +-
 drivers/video/fbdev/Kconfig                |   8 +-
 drivers/video/fbdev/core/bitblit.c         |  17 +++
 drivers/video/fbdev/core/fb_cmdline.c      |   2 +-
 drivers/video/fbdev/core/fb_fillrect.h     |   3 +-
 drivers/video/fbdev/core/fbmon.c           |   7 +-
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c |   2 +-
 drivers/video/fbdev/nvidia/nvidia.c        |   3 +-
 drivers/video/fbdev/pxafb.c                |   3 +-
 drivers/video/fbdev/s3fb.c                 | 177 ++++++++++++++++++++---------
 drivers/video/fbdev/simplefb.c             |  31 +++--
 drivers/video/fbdev/xen-fbfront.c          |   2 +-
 25 files changed, 259 insertions(+), 165 deletions(-)
