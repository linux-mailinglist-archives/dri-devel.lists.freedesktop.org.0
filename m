Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF543C211D1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 17:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD76810E28F;
	Thu, 30 Oct 2025 16:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dWCpovhC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67CF10E28F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 16:14:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D686660207;
 Thu, 30 Oct 2025 16:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83245C4CEF8;
 Thu, 30 Oct 2025 16:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761840852;
 bh=WadIyrGhjZmtFOmTht7Qz2UfFstKfJJoO9MBbxCO7VM=;
 h=Date:From:To:Subject:From;
 b=dWCpovhC0QJKOMFQNIVOMcghgZoDCVTglKArdzpJGz5p50ZqJFbM+73TRaXAVSL7x
 xPz931w1iIC/lBgNRyVQMinkpdaA/M/7TPCZl7Mxc6dtkBkfgzMxHUJFKU8B/tWlEn
 ZlOEXP4TFX8MyqYg4v3b1vIIcimhLq8cw665CDuaGJwKhTbSoV+Fup7Eti5Ept0Hyl
 YzB0JxSlRo5a59VWXh3wH7jpmgJuY9Ei++8hdUd2Ft/Pp3EPOasWzAJRG5o6edUKim
 UfQiJp4JiSOblN3V2Vh1t+brbguYQWZ/lm/9pmrJj9q81scFDPwQQpuFxvQKI0ZRYP
 YYKIQNxrqZvSQ==
Date: Thu, 30 Oct 2025 17:14:07 +0100
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev fixes for v6.18-rc4
Message-ID: <aQOOz7Q27BbUo-_4@carbonx1>
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

please pull a few important bugfixes for various fbdev drivers for 6.18-rc4.

All patches are tagged for stable series.
Includes a trivial typo fix for the fb.h header as well.

Thanks!
Helge

----------------------------------------------------------------
The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa:

  Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.18-rc4

for you to fetch changes up to 7073c7fc8d8ba47194e5fc58fcafc0efe7586e9b:

  fbdev: atyfb: Check if pll_ops->init_pll failed (2025-10-28 22:59:19 +0100)

----------------------------------------------------------------
fbdev fixes for 6.18-rc4:

- atyfb: Avoid hard lock up when PLL not initialized (Daniel Palmer)
- pvr2fb: Fix build error when CONFIG_PVR2_DMA enabled (Florian Fuchs)
- bitblit: Fix out-of-bounds read in bit_putcs* (Junjie Cao)
- valkyriefb: Fix reference count leak (Miaoqian Lin)
- fbcon: Fix slab-use-after-free in fb_mode_is_equal (Quanmin Yan)
- fb.h: Fix typo in "vertical" (Piyush Choudhary)

----------------------------------------------------------------
Daniel Palmer (1):
      fbdev: atyfb: Check if pll_ops->init_pll failed

Florian Fuchs (1):
      fbdev: pvr2fb: Fix leftover reference to ONCHIP_NR_DMA_CHANNELS

Junjie Cao (1):
      fbdev: bitblit: bound-check glyph index in bit_putcs*

Miaoqian Lin (1):
      fbdev: valkyriefb: Fix reference count leak in valkyriefb_init

PIYUSH CHOUDHARY (1):
      video: fb: Fix typo in comment in fb.h

Quanmin Yan (1):
      fbcon: Set fb_display[i]->mode to NULL when the mode is released

 drivers/video/fbdev/aty/atyfb_base.c |  8 ++++++--
 drivers/video/fbdev/core/bitblit.c   | 16 ++++++++++++----
 drivers/video/fbdev/core/fbcon.c     | 19 +++++++++++++++++++
 drivers/video/fbdev/core/fbmem.c     |  1 +
 drivers/video/fbdev/pvr2fb.c         |  2 +-
 drivers/video/fbdev/valkyriefb.c     |  2 ++
 include/linux/fbcon.h                |  2 ++
 include/uapi/linux/fb.h              |  2 +-
 8 files changed, 44 insertions(+), 8 deletions(-)
