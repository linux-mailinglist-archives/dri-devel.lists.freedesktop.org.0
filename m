Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DF64E46B6
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 20:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727CD10E45D;
	Tue, 22 Mar 2022 19:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E169110E432
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 19:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647977517;
 bh=93SXfuVtjQYZvz66Kex1MpWSLNXZlFaoSJzxEq6295U=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=TPcmE+Z152KRwiGn8Ja1WqY502jC9un30y2trKb/GPrLxyxkJNFFOgB8coH1EjmC7
 knLRPMSx29WONo8B2+up+EMrRQ8fC368fyQHf5oHV5ppGAwN+4fAYGOKaqB+0iMiZc
 FUGnlE+1nI1JQihJQS2lwjhlfXbFLmIN6BuIybCk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.191.132]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbRk3-1o4AJ33zqL-00brWf; Tue, 22
 Mar 2022 20:31:57 +0100
Date: Tue, 22 Mar 2022 20:31:55 +0100
From: Helge Deller <deller@gmx.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev updates & fixes for v5.18-rc1
Message-ID: <YjokKxSLtqMwyLyB@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:/UMe39qFB1IobjfPzjP934uywvXFxhr7TLggs0tWKOWDPNIGonr
 OhgJE3d9d+Np48tGi0SnCrXPajX7Rsq4xoDa26+7WAZoJECXAho79Wr4s/RQM0IIWlzOQKX
 VibjBebK+b5J1K6HGUeEX1NDso6QwG+whtlLZzxl07OZmdEtAc/v4qTIoI6ADwvf68Y0i8k
 BSwH10GUUeba9+ei9ya0g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:a7ApWNi/GkE=:11CVAUu/hiXqZbG2wuj0HP
 UAUI8fR9wXPmykUkRbNy1xYBNQJ3EvmduImCC7wJgQ34UFH8HhNwPTc7ucu/gfwptNEcsYDzC
 Fv0ZuqrHFd0c00p/DO2zbSPyWCTaaq9vDZ1tkAyj6rQn75xt2LdaSZwTQuVhiZCTaWrcXZPQ1
 PG/X3ZUmm+60j3YNPmSovMyzr/zHfLfXKPo1WPxnukHh+ChUvOV9pL9GLur3X5OsPlIZ3I6sf
 zA4WvBR2JwoOfwTRJC+pv0QffxshXJiXQXuOjIJGLKZ0Qqo9PgQDxhHlZCbxAyrn0jIaXVB/m
 0kR/cGtGQQA6VHCAQPHfxRQ84HIuAikDD/g9DxWlwXQ4bU6BOJVlRqE4+gFzvSA2lZDdM7dJg
 v3DliXrWA9NhbsBzNeCaRvgW9guHn/9Myif+TR7UtGWrbR25pAgGbcrO5x0XkDKSUkCoBZrYG
 tk06UwPCHkM6rRqi6HQ6sHIPqZH8bfaeg02GIFZdoUYLQuBFV/InELr1KieUJ8jwvAlFe/LGI
 WailG8Io7UtzYrYeofaaspAiXWiIcStLL1OJCQ2DHWv06mu5HlsVWtOuJ0gMZgYVS/Shjtc7A
 NxJ0gpKuST2UvvBsye9YfsDFNj2MtW/HDljCLLuavT1nIcxevpEvMflYBQNR3L2g2TWaHQ1rv
 SWXuk35d/+qpX8idPHaDDJL+GV43y3AT7AgPev1qLjzWZCu0FaIW52dQS8+VBvVrICZIpuc6J
 gvMzIVlqkqbiGv5uUj6lfIMYJP3z+QH4ArKgFSXET+XSlRWEMVAFdFo4MKdV4XstpqkIJXznt
 CWrTcQ3U+5CbP3cJgt2WPX6cQ91/3jpiarCouL68pgzDcpyP+wX5d2in0fjs9ilzP95ZXnL0R
 JhSC/3ddTAdORko7iwtBq/5aOGcFdelA09JFXTxMUqV9bV+DV+32s9+qgy/RpfCBBBs6hVvr7
 sflwvvuZkYHyFHnnmKVPUzsEbGn6VWaxslusF+oMcVS/4Z5TJb0r7p4JLPjMgYJc2cHXL2oFF
 cHyosJEks34XSR5ziEgJGG4YFlOdmwrqqfftfsbtjorH3X316wRy4F2ror1fgnZrbVfQ5lyUs
 kgqZXE1ZtLdmR4=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Linus,

please pull the latest fbdev updates and fixes for kernel 5.18-rc1.

This patchset has been in linux-next without any reported problems and
includes a lot of small fixes and code cleanups across many traditional
fbdev drivers.

Thanks!
Helge

----------------------------------------------------------------

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/for-5.18/fbdev-1

for you to fetch changes up to e445c8b2aa2df0e49f6037886c32d54a5e3960b1:

  video: fbdev: kyro: make read-only array ODValues static const (2022-03-11 08:27:37 +0100)

----------------------------------------------------------------
fbdev fixes and updates for kernel v5.18-rc1

Lots of small fixes and code cleanups across most of the fbdev drivers.

This includes conversions to use helper functions, const conversions, spelling
fixes, help text updates, adding return value checks, small build fixes, and
much more.

----------------------------------------------------------------
Arnd Bergmann (1):
      agp: define proper stubs for empty helpers

Cai Huoqing (11):
      video: fbdev: au1200fb: Make use of dma_mmap_coherent()
      video: fbdev: omapfb: panel-lgphilips-lb035q02: Make use of the helper function dev_err_probe()
      video: fbdev: omapfb: lcd_ams_delta: Make use of the helper function dev_err_probe()
      video: fbdev: omapfb: panel-sharp-ls037v7dw01: Make use of the helper function dev_err_probe()
      video: fbdev: omapfb: panel-tpo-td043mtea1: Make use of the helper function dev_err_probe()
      video: fbdev: da8xx-fb: Make use of the helper function dev_err_probe()
      video: fbdev: pxa168fb: Make use of the helper function dev_err_probe()
      video: fbdev: pxa3xx-gcu: Make use of the helper function dev_err_probe()
      video: fbdev: ssd1307fb: Make use of the helper function dev_err_probe()
      video: fbdev: s3c-fb: Make use of the helper function dev_err_probe()
      video: fbdev: mmp: Make use of the helper function dev_err_probe()

Changcheng Deng (1):
      video: fbmem: use swap() to make code cleaner in fb_rotate_logo()

Chunyang Zhong (1):
      video: fbdev: ocfb: add const to of_device_id

Colin Ian King (7):
      video: fbdev: aty128fb: make some arrays static const
      video: fbdev: mb862xx: remove redundant assignment to pointer ptr
      video: fbdev: via: Fix spelling mistake "bellow" -> "below"
      video: fbdev: atyfb: Remove assigned but never used variable statements
      video: fbdev: asiliantfb: remove redundant assignment to variable Ftarget
      video: fbdev: pxa168fb: Initialize pointers with NULL and not plain integer 0
      video: fbdev: kyro: make read-only array ODValues static const

Dan Carpenter (3):
      video: fbdev: savagefb: make a variable local
      video: fbdev: atmel_lcdfb: fix an error code in atmel_lcdfb_probe()
      video: fbdev: fbcvt.c: fix printing in fb_cvt_print_name()

Evgeny Novikov (1):
      video: fbdev: w100fb: Reset global state

Geert Uytterhoeven (4):
      video: fbdev: atari: Fix TT High video mode
      video: fbdev: atari: Convert to standard round_up() helper
      video: fbdev: atari: Remove unused atafb_setcolreg()
      video: fbdev: au1100fb: Spelling s/palette/palette/

George Kennedy (1):
      video: fbdev: cirrusfb: check pixclock to avoid divide by zero

Greg Kroah-Hartman (1):
      video: fbdev: omapfb: use default_groups in kobj_type

Guo Zhengkui (1):
      video: fbdev: omapfb: Use sysfs_emit() instead of snprintf()

Haowen Bai (1):
      video: fbdev: offb: fix warning comparing pointer to 0

Helge Deller (1):
      video: fbdev: sm712fb: Fix crash in smtcfb_read()

Jiasheng Jiang (1):
      video: fbdev: imxfb: Check for null res pointer

Jing Yao (3):
      video: fbdev: omapfb: panel-dsi-cm: Use sysfs_emit() instead of snprintf()
      video: fbdev: omapfb: panel-tpo-td043mtea1: Use sysfs_emit() instead of snprintf()
      video: fbdev: udlfb: replace snprintf in show functions with sysfs_emit

Krzysztof Kozlowski (1):
      video: fbdev: s3c-fb: drop unneeded MODULE_ALIAS

Luca Weiss (2):
      backlight: qcom-wled: Add PM6150L compatible
      dt-bindings: simple-framebuffer: allow standalone compatible

Miaoqian Lin (1):
      video: fbdev: omapfb: Add missing of_node_put() in dvic_probe_of

Michael Schmitz (1):
      video: fbdev: atari: Atari 2 bpp (STe) palette bugfix

Minghao Chi (1):
      video: fbdev: mach64_ct: remove redundant res variable

Tim Gardner (1):
      video: fbdev: nvidiafb: Use strscpy() to prevent buffer overflow

Wang Hai (1):
      video: fbdev: smscufx: Fix null-ptr-deref in ufx_usb_probe()

Wei Ming Chen (1):
      video: fbdev: Fix wrong file path for pvr2fb.c in Kconfig help text

Xiaoke Wang (1):
      video: fbdev: via: check the return value of kstrdup()

Xu Wang (2):
      backlight: lm3630a_bl: Remove redundant 'flush_workqueue()' calls
      video: fbdev: omapfb: Remove redundant 'flush_workqueue()' calls

Yang Guang (2):
      video: fbdev: sis: use swap() to make code cleaner
      video: fbdev: omapfb: acx565akm: replace snprintf with sysfs_emit

Yang Li (2):
      video: fbdev: pxa168fb: Remove unnecessary print function dev_err()
      video: fbdev: pxa3xx-gcu: Remove unnecessary print function dev_err()

Yihao Han (1):
      video: fbdev: s3c-fb: fix platform_get_irq.cocci warning

YueHaibing (1):
      video: fbdev: controlfb: Fix COMPILE_TEST build

Z. Liu (1):
      video: fbdev: matroxfb: set maxvram of vbG200eW to the same as vbG200 to avoid black screen

Zheyu Ma (1):
      video: fbdev: sm712fb: Fix crash in smtcfb_write()

zhaoxiao (1):
      video: fbdev: s3c-fb: Use platform_get_irq() to get the interrupt

 .../bindings/display/simple-framebuffer.yaml       | 12 +++--
 arch/parisc/include/asm/agp.h                      |  4 +-
 arch/powerpc/include/asm/agp.h                     |  4 +-
 arch/sparc/include/asm/agp.h                       |  6 +--
 drivers/video/backlight/lm3630a_bl.c               |  1 -
 drivers/video/backlight/qcom-wled.c                |  1 +
 drivers/video/fbdev/Kconfig                        |  2 +-
 drivers/video/fbdev/asiliantfb.c                   |  2 +-
 drivers/video/fbdev/atafb.c                        | 35 +++++---------
 drivers/video/fbdev/atmel_lcdfb.c                  | 11 +++--
 drivers/video/fbdev/aty/aty128fb.c                 | 10 ++--
 drivers/video/fbdev/aty/mach64_ct.c                |  4 +-
 drivers/video/fbdev/aty/mach64_gx.c                |  2 -
 drivers/video/fbdev/au1100fb.c                     |  2 +-
 drivers/video/fbdev/au1100fb.h                     |  2 +-
 drivers/video/fbdev/au1200fb.c                     |  4 +-
 drivers/video/fbdev/cirrusfb.c                     | 16 +++----
 drivers/video/fbdev/controlfb.c                    |  2 +
 drivers/video/fbdev/core/fbcvt.c                   | 53 +++++++++-------------
 drivers/video/fbdev/core/fbmem.c                   |  8 +---
 drivers/video/fbdev/da8xx-fb.c                     |  7 ++-
 drivers/video/fbdev/imxfb.c                        |  2 +
 drivers/video/fbdev/kyro/STG4000InitDevice.c       |  2 +-
 drivers/video/fbdev/matrox/matroxfb_base.c         |  2 +-
 drivers/video/fbdev/mb862xx/mb862xxfb_accel.c      |  2 +-
 drivers/video/fbdev/mmp/hw/mmp_ctrl.c              |  3 +-
 drivers/video/fbdev/nvidia/nv_i2c.c                |  2 +-
 drivers/video/fbdev/ocfb.c                         |  2 +-
 drivers/video/fbdev/offb.c                         |  2 +-
 drivers/video/fbdev/omap/lcd_ams_delta.c           | 16 +++----
 drivers/video/fbdev/omap/omapfb_main.c             | 13 +++---
 .../fbdev/omap2/omapfb/displays/connector-dvi.c    |  1 +
 .../fbdev/omap2/omapfb/displays/panel-dsi-cm.c     |  8 ++--
 .../omapfb/displays/panel-lgphilips-lb035q02.c     |  7 ++-
 .../omapfb/displays/panel-sharp-ls037v7dw01.c      |  7 ++-
 .../omap2/omapfb/displays/panel-sony-acx565akm.c   |  2 +-
 .../omap2/omapfb/displays/panel-tpo-td043mtea1.c   |  7 ++-
 .../video/fbdev/omap2/omapfb/dss/display-sysfs.c   |  3 +-
 .../video/fbdev/omap2/omapfb/dss/manager-sysfs.c   |  3 +-
 .../video/fbdev/omap2/omapfb/dss/overlay-sysfs.c   |  3 +-
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c     |  1 -
 drivers/video/fbdev/pxa168fb.c                     | 15 +++---
 drivers/video/fbdev/pxa3xx-gcu.c                   | 10 ++--
 drivers/video/fbdev/s3c-fb.c                       | 20 ++++----
 drivers/video/fbdev/savage/savagefb.h              |  1 -
 drivers/video/fbdev/savage/savagefb_driver.c       |  7 +--
 drivers/video/fbdev/sis/sis_main.c                 |  2 +-
 drivers/video/fbdev/sm712fb.c                      | 46 +++++--------------
 drivers/video/fbdev/smscufx.c                      |  3 +-
 drivers/video/fbdev/ssd1307fb.c                    |  7 ++-
 drivers/video/fbdev/udlfb.c                        |  8 ++--
 drivers/video/fbdev/via/lcd.c                      |  2 +-
 drivers/video/fbdev/via/viafbdev.c                 | 10 ++++
 drivers/video/fbdev/w100fb.c                       | 15 ++++--
 54 files changed, 189 insertions(+), 233 deletions(-)
