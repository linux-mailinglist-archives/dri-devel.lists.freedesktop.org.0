Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE5F6BFCCE
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 21:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FB610E146;
	Sat, 18 Mar 2023 20:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB36410E146
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 20:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1679172428; i=deller@gmx.de;
 bh=1HjTuRzgTKsrnPjhjt8XeV4HoazsL1+nGL/2BdFTIiI=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=qpnANUjcMG4IgqtLuIZoi7vvsF6a379OnN3Ntx2X+AKhSYCGOsrJBSOsxvtmHlNYl
 Z71RFOajcPNNYfhEy69heUQ2BAIfHlhU7hGdaGnW9jYFFkbzgOuWM3Xkz5lOLDNuAJ
 ixqmqQ6CBMe+zUeq9PNUpCAJTBOO+4dEAzRV9y+nonHEeGr+DR5LLtfVw9oLV9s36e
 lnxKWuonTHpgwOMleG+3tyKKn8XxWrX8CXEjRjeJ580ooo6QaEWZCwgN7BBbmrzOLw
 yv6GeAo0CnufkSlkEZrAo173G/M1AwMffkxfcmqzYvfDb1bX4i1Uy7uYBDK+5CC6fx
 SsMA8BtrkS9Sg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ls3530 ([94.134.158.13]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9Wuk-1pY9oO1KeS-005VZt; Sat, 18
 Mar 2023 21:47:08 +0100
Date: Sat, 18 Mar 2023 21:47:06 +0100
From: Helge Deller <deller@gmx.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev fixes for v6.3-rc3
Message-ID: <ZBYjSkFz/FEobQmk@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:q2HkSi1s9T/tlurqxCWfKZ6lutmsY9NP7W8sUGrLYFF3WFOWwCz
 +3QFXNnjKyukEb47ovofqeCZ3xaCETmAYKvTiMahaY2FkUPvNvy3u+7qLyxET4v4ivi5Rje
 mgGf1MF/NkePAazmBsZAyzkBoiBanDGUJYP4Eh2tgfo2loXH0R7k+WNhcyM6HRDvjAGocRH
 ba5f9DFbZrytiwVFwuEXA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:w4ebJttOrcU=;K2/CDTqavHztEie+3DfTskx3p6Q
 1SGAfmg7/v4VvUCb1y4BChTV07xAk+QgGyA/tcnMK0I7MzIRzDqzYYKPUvz9bPRifs2qUtG6Q
 GDrdoInv2YtxZfBiZK3olyBB/K/wFszfccocR3+h0rdUsEeFZjRfXpw1uey3jE1fYou1pzAL9
 8Y+xI8t6+OE1aQ+8OUR5OBYQWgVPhYGsPYB8SkRoV9gZqTigGciQ073il20HoX2feYoJik591
 rkZT/U7ZjCjfvystPFliQfYrV6E7p1ld6Q+5jcC5CMPvAwcx31PXN773Ub73HyzyI+lwfPlA7
 Sk1oXnDW0DeEh5i9qgRmQP323NbmiwlULyDsXKv4f4rCf2z8GT8SMP5E5LfxZRdJ4h56gEF5M
 TDZgsNroDRsSiC1P1yBDvGe9jc8xKIbqWDZORWOG/INEmLd55mwgsg/Nb0okCBIM1Y2hYGFdB
 cG4LFT3VzKaWF73HtphgSOkxw0vSpIz6srUIl/iBxZpk8wn/F3iRkBsIi93DxygAknMF0oYtI
 cYcYGdImi6x7VrLqz74B1CD5uwHxjfOJzrcgZA73KEHjkfBDjdGGqyroeH576VRM+MIcNaeJ0
 iCqRhbDu3HMNSwIvNl1gHJzDlC6cyLVwUQWzK50ZgayN15zY5y9NomlphsOBtB3ldF9kRm5aJ
 /8qzydrjbhug5V1uB0zTnBgX17lm8m8NoM1YSzCL1J1RbTzT7/VUepEnTZBb2xj9wIpQ9f4HS
 CRadtpOSmG3lVZDizlROYNDlbZ+cegL5nMc2R/MoZFNJTwnecCPBMRavPoiHm3QbubNBO5ANw
 crnuKDKnQr8ndh4YgVoGdNAfBtsAu5kP1sx8qnNklxKGNfszFGAQZbTCBKTqp9u7Jv+FpSAFg
 oZ75+rJI5tlZhxACnE5S/alXzKDktikEslSnqX4mgI+wPKM3qHttZOOvCgZLq03xv+p7Kvl1J
 aVZRBASaf86rL/9N0LytCui8j3g=
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

please pull the latest fbdev updates and fixes.

The majority of lines changed is due to a code style cleanup in the
pnmtologo helper program.

Arnd removed the omap1 osk driver and the SIS fb driver is now orphaned.

Other than that it's the usual bunch of small fixes and cleanups, e.g.
prevent possible divide-by-zero in various fb drivers if the pixclock is
zero and various conversions to devm_platform*() and of_property*()
functions.

Thanks!
Helge

--------------


The following changes since commit eeac8ede17557680855031c6f305ece2378af326:

  Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.3-rc3

for you to fetch changes up to 29413f05fe34e8824551b91f660fde781249417d:

  fbdev: Use of_property_present() for testing DT property presence (2023-03-16 16:18:17 +0100)

----------------------------------------------------------------
fbdev updates for kernel 6.3-rc3:

- Drop omap1 osk driver
- Various potential divide by zero pixclock fixes
- Add pixelclock and fb_check_var() to stifb
- Code style cleanups and indenting fixes

----------------------------------------------------------------
Arnd Bergmann (1):
      fbdev: omapfb: remove omap1 osk driver

Helge Deller (1):
      fbdev: stifb: Provide valid pixelclock and add fb_check_var() checks

Lucy Mielke (1):
      fbdev: omapfb: cleanup inconsistent indentation

Lukas Bulwahn (1):
      MAINTAINERS: orphan SIS FRAMEBUFFER DRIVER

Nikita Romanyuk (2):
      drivers: video: logo: fix code style issues in pnmtologo.c
      drivers: video: logo: add SPDX comment, remove GPL notice in pnmtologo.c

Rob Herring (2):
      fbdev: Use of_property_read_bool() for boolean properties
      fbdev: Use of_property_present() for testing DT property presence

Wei Chen (5):
      fbdev: tgafb: Fix potential divide by zero
      fbdev: nvidia: Fix potential divide by zero
      fbdev: intelfb: Fix potential divide by zero
      fbdev: lxfb: Fix potential divide by zero
      fbdev: au1200fb: Fix potential divide by zero

Yang Li (4):
      fbdev: clps711x-fb: Use devm_platform_get_and_ioremap_resource()
      fbdev: pxa3xx-gcu: Use devm_platform_get_and_ioremap_resource()
      fbdev: wm8505fb: Use devm_platform_ioremap_resource()
      fbdev: xilinxfb: Use devm_platform_get_and_ioremap_resource()

 MAINTAINERS                                        |   4 +-
 drivers/video/fbdev/amba-clcd.c                    |   2 +-
 drivers/video/fbdev/au1200fb.c                     |   3 +
 drivers/video/fbdev/bw2.c                          |   2 +-
 drivers/video/fbdev/cg3.c                          |   2 +-
 drivers/video/fbdev/clps711x-fb.c                  |   3 +-
 drivers/video/fbdev/geode/lxfb_core.c              |   3 +
 drivers/video/fbdev/intelfb/intelfbdrv.c           |   3 +
 drivers/video/fbdev/nvidia/nvidia.c                |   2 +
 drivers/video/fbdev/offb.c                         |   4 +-
 drivers/video/fbdev/omap/Makefile                  |   1 -
 drivers/video/fbdev/omap/lcd_osk.c                 |  86 ---
 drivers/video/fbdev/omap/omapfb_main.c             |  30 +-
 .../fbdev/omap2/omapfb/dss/omapdss-boot-init.c     |   2 +-
 drivers/video/fbdev/pxa3xx-gcu.c                   |   3 +-
 drivers/video/fbdev/sm501fb.c                      |   4 +-
 drivers/video/fbdev/stifb.c                        |  27 +
 drivers/video/fbdev/tcx.c                          |   3 +-
 drivers/video/fbdev/tgafb.c                        |   3 +
 drivers/video/fbdev/wm8505fb.c                     |   4 +-
 drivers/video/fbdev/xilinxfb.c                     |   6 +-
 drivers/video/logo/pnmtologo.c                     | 674 ++++++++++-----------
 22 files changed, 409 insertions(+), 462 deletions(-)
 delete mode 100644 drivers/video/fbdev/omap/lcd_osk.c
