Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D2C7CCC69
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 21:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDED10E322;
	Tue, 17 Oct 2023 19:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8ED310E322
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 19:39:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 02E87B81F29;
 Tue, 17 Oct 2023 19:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35ECC433C7;
 Tue, 17 Oct 2023 19:39:13 +0000 (UTC)
Date: Tue, 17 Oct 2023 21:39:11 +0200
From: Helge Deller <deller@gmx.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev fixes and updates for v6.6-rc7
Message-ID: <ZS7i38pKFD0/Msus@ls3530>
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

please pull a few unexiting small fbdev fixes & cleanups for 6.6-rc7.

Thanks,
Helge

-----------

The following changes since commit ce9ecca0238b140b88f43859b211c9fdfd8e5b70:

  Linux 6.6-rc2 (2023-09-17 14:40:24 -0700)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.6-rc7

for you to fetch changes up to e8e4a470b677511f9d1ad4f3cef32adc1d9a60ca:

  fbdev: core: syscopyarea: fix sloppy typing (2023-10-16 23:22:53 +0200)

----------------------------------------------------------------
fbdev fixes and cleanups for 6.6-rc7:

various minor fixes, cleanups and annotations for atyfb, sa1100fb,
omapfb, uvesafb and mmp.

----------------------------------------------------------------
Arnd Bergmann (2):
      fbdev: atyfb: only use ioremap_uc() on i386 and ia64
      fbdev: sa1100fb: mark sa1100fb_init() static

Dan Carpenter (1):
      fbdev: omapfb: fix some error codes

Jorge Maidana (2):
      fbdev: uvesafb: Remove uvesafb_exec() prototype from include/video/uvesafb.h
      fbdev: uvesafb: Call cn_del_callback() at the end of uvesafb_exit()

Kees Cook (2):
      fbdev: mmp: Annotate struct mmphw_ctrl with __counted_by
      fbdev: mmp: Annotate struct mmp_path with __counted_by

Sergey Shtylyov (2):
      fbdev: core: cfbcopyarea: fix sloppy typing
      fbdev: core: syscopyarea: fix sloppy typing

 drivers/video/fbdev/aty/atyfb_base.c   | 4 ++++
 drivers/video/fbdev/core/cfbcopyarea.c | 2 +-
 drivers/video/fbdev/core/syscopyarea.c | 2 +-
 drivers/video/fbdev/mmp/hw/mmp_ctrl.h  | 2 +-
 drivers/video/fbdev/omap/omapfb_main.c | 4 ++--
 drivers/video/fbdev/sa1100fb.c         | 2 +-
 drivers/video/fbdev/uvesafb.c          | 2 +-
 include/video/mmp_disp.h               | 2 +-
 include/video/uvesafb.h                | 2 --
 9 files changed, 12 insertions(+), 10 deletions(-)
