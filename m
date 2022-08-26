Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2275A2E7D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 20:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C4410E291;
	Fri, 26 Aug 2022 18:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7AD10E291
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 18:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661538580;
 bh=6CwsAnaWPuxtbvE456cbmPQ06VlN91EsBREJitWI23k=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=DNulv/cP0alEZTJUhHf9A9MvJN86BSczbBQUE903Zc2XoQYyA14RVSVa4WKV7OFGj
 js09kiCTvn2dZGb4mPKtD3K2urjkT7hoI+BOGY4BtyST0W/ttrlinBEcxG7B1dc+60
 wPsArHkL024xLFypVRVjIcOTfhPUD8MKa0rR6wL8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.171.190]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0oG5-1pNrN31Zgb-00whyf; Fri, 26
 Aug 2022 20:29:40 +0200
Date: Fri, 26 Aug 2022 20:29:35 +0200
From: Helge Deller <deller@gmx.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev updates & fixes for v6.0-rc3
Message-ID: <YwkRD5hWd4F02dxc@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:S+Gx95puGBUMe77q0+jOjU2CmgdcWla5iY7r2boOKY4l0p2qobj
 7OA90AVrpMI6lHBBdCt1MLgizBN7qyGY9ypUdCf4dlwpcAm2+c4WUExl71lLlV1KoKH4SkV
 bOK7vaiIGd5QHxsSACyvpmghF0uymP3Mu0qkalhxDDh8rOc1PFiEfEWP0LKwvUJYDMxzrjq
 O3zHQWAdnkStngcEB5BJw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gu+Be2cK4x8=:QDvIi3VT+gwtRWU527U5dG
 ppleeK8f+bnNquQH0zJUCOS8Zhe5wrEixYTYtik/oE1rqlBTst8udxlmc8cS7beLzbRNoHyrb
 R/3bYLi66pL/1/Mkz0NITyu+MkNRJbfDfxy7vz6AQVLX6GlmwtQAbJZL55V2O3G0aqcRYQDvY
 iGkItoof7SVcuf+qpWOQB1qMe+0wKcBPVZ9mJfpDGtmjw++gTOuDoHqDTXOztXnHB+dT4ge3g
 m+95K0EU7GydC6wLHzcbLvbZDm0DLc3cJaENGSwdhy1Ag8kXJKK1FX4dKLFjrNtxwZUzylsOJ
 1YAEZ3p1kIfh7XjD9rQ20kiVkWs3iebK1waDLa0ydQ88rxI9jlBzWQFRjStoOQh5E5mHCkGhs
 dFba/QwowSAV4YufMxHwZc1XIxxyAGTxZ1HW8qND/oKauYDqp7O9T/8MUvlknsIMgGDpK7ODa
 rRyrKc5YvxwXRTE423b22lfY/M308u0OQxOjpaq45c/ieTjpDTHQiPGlfUCwzh4Wg539iKQHV
 2C+Fdv7hFD5MUj1kYQ/ozW/5gskwKX1kyd3SebMnHD9WEzJKVhLz14TFGjYpZW/J8NESoxcOk
 N67Wd2vq6YSDqdPqUKIvwrAfmB+18racH/Wkt7YduMNvnjO8rVkrrESDE/oSA0BV/mgC+BS/9
 upj4qh+zfyK5VHOf0AurbRNDPsGfBv8pcBmuPdS1k6zY4ogqZYIrCACVyYO0f6NBmDLcoMI8N
 WLMOepSF7mjJTl09XnlHseVOTZa87otvN6pJktNE/8dG9pv0fmyi7D+X+NWdgzajgNUCnztqr
 Ai4NJ4ZhHOpVbuqEVQkwso8lL+2H8I+1uyPP3HHYIyy2zablTG4qJ5h2t6DOjKup4sn+JWe3N
 7rTp3eJt8uJRkt+nxZGe25FGaMxctdRCLMTY4yAyEBrWTBt169Jo49XowJeuAL+fxVqhV3cwh
 VG6/fRcvNBT5RNLW/Hm+YWmf13W2jfxtU9gtvZNTGT+fDTA3uVQT7I55SkN5il2Q7alBF5L+x
 wZK3ltyaVnpdD21a6wdlToh1PLBaz6wootq7wiLWGzjoQdC1W7j5VCubeCgfJoD1W//JZiSvz
 jY4P01Jk7LAqXRceXMW0SVcmkeIBo/FVhpHu5ITeqxauxo3Vyyz7dLihw==
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

please pull the second round of fbdev fixes & updates for v6.0-rc3.

Mostly just small patches, with the exception of the bigger indenting
cleanups in the sisfb and radeonfb drivers.

Two patches should be mentioned though:
A fix-up for fbdev if the screen resize fails (by Shigeru Yoshida), and
a potential divide by zero fix in fb_pm2fb (by Letu Ren).

More detailled info is in the tag description. All patches have been in
for-next for a few days.

Thanks!
Helge

-------

The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc555:

  Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.0-rc3

for you to fetch changes up to a5a923038d70d2d4a86cb4e3f32625a5ee6e7e24:

  fbdev: fbcon: Properly revert changes when vc_resize() failed (2022-08-26 19:56:18 +0200)

----------------------------------------------------------------
fbdev fixes and updates for kernel 6.0-rc3

Major fixes:
- Revert the changes for fbcon console when vc_resize() fails [Shigeru Yoshida]
- Avoid a potential divide by zero error in fb_pm2fb [Letu Ren]

Minor fixes:
- Add missing pci_disable_device() in chipsfb_pci_init() [Yang Yingliang]
- Fix tests for platform_get_irq() failure in omapfb [Yu Zhe]
- Destroy mutex on freeing struct fb_info in fbsysfs [Shigeru Yoshida]

Cleanups:
- Move fbdev drivers from strlcpy to strscpy [Wolfram Sang]
- Indenting fixes, comment fixes, ... [Jiapeng Chong & Jilin Yuan]

----------------------------------------------------------------
Jiapeng Chong (3):
      fbdev: sisfb: Clean up some inconsistent indenting
      fbdev: radeon: Clean up some inconsistent indenting
      fbdev: omap: Remove unnecessary print function dev_err()

Jilin Yuan (1):
      fbdev: ssd1307fb: Fix repeated words in comments

Letu Ren (1):
      fbdev: fb_pm2fb: Avoid potential divide by zero error

Shigeru Yoshida (2):
      fbdev: fbcon: Destroy mutex on freeing struct fb_info
      fbdev: fbcon: Properly revert changes when vc_resize() failed

Wolfram Sang (1):
      fbdev: Move fbdev drivers from strlcpy to strscpy

Yang Yingliang (1):
      fbdev: chipsfb: Add missing pci_disable_device() in chipsfb_pci_init()

Yu Zhe (1):
      fbdev: omapfb: Fix tests for platform_get_irq() failure

 drivers/video/console/sticore.c                |   2 +-
 drivers/video/fbdev/aty/atyfb_base.c           |   2 +-
 drivers/video/fbdev/aty/radeon_base.c          |  48 ++---
 drivers/video/fbdev/bw2.c                      |   2 +-
 drivers/video/fbdev/chipsfb.c                  |   1 +
 drivers/video/fbdev/cirrusfb.c                 |   2 +-
 drivers/video/fbdev/clps711x-fb.c              |   2 +-
 drivers/video/fbdev/core/fbcon.c               |  29 ++-
 drivers/video/fbdev/core/fbsysfs.c             |   4 +
 drivers/video/fbdev/cyber2000fb.c              |   8 +-
 drivers/video/fbdev/ffb.c                      |   2 +-
 drivers/video/fbdev/geode/gx1fb_core.c         |   6 +-
 drivers/video/fbdev/gxt4500.c                  |   2 +-
 drivers/video/fbdev/i740fb.c                   |   2 +-
 drivers/video/fbdev/imxfb.c                    |   2 +-
 drivers/video/fbdev/matrox/matroxfb_base.c     |   6 +-
 drivers/video/fbdev/omap/omapfb_main.c         |   6 +-
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c |   2 +-
 drivers/video/fbdev/pm2fb.c                    |   5 +
 drivers/video/fbdev/pxa168fb.c                 |   2 +-
 drivers/video/fbdev/pxafb.c                    |   2 +-
 drivers/video/fbdev/s3fb.c                     |   2 +-
 drivers/video/fbdev/simplefb.c                 |   2 +-
 drivers/video/fbdev/sis/sis_main.c             | 278 +++++++++++++------------
 drivers/video/fbdev/sm501fb.c                  |   2 +-
 drivers/video/fbdev/ssd1307fb.c                |   2 +-
 drivers/video/fbdev/sstfb.c                    |   2 +-
 drivers/video/fbdev/sunxvr1000.c               |   2 +-
 drivers/video/fbdev/sunxvr2500.c               |   2 +-
 drivers/video/fbdev/sunxvr500.c                |   2 +-
 drivers/video/fbdev/tcx.c                      |   2 +-
 drivers/video/fbdev/tdfxfb.c                   |   4 +-
 drivers/video/fbdev/tgafb.c                    |   2 +-
 drivers/video/fbdev/tridentfb.c                |   2 +-
 34 files changed, 240 insertions(+), 201 deletions(-)
