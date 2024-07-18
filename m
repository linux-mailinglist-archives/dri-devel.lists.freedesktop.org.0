Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E48893503B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 17:56:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9E010E9DF;
	Thu, 18 Jul 2024 15:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A/We4EpV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B822710E9DF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 15:56:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C3D38CE1987;
 Thu, 18 Jul 2024 15:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B90C116B1;
 Thu, 18 Jul 2024 15:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721318169;
 bh=wFUzftDcteRmA2NyKmVxglS13LnS1utkda/P2FIp9y4=;
 h=Date:From:To:Subject:From;
 b=A/We4EpVLkmBtNutObcnOePbkR1hlJ25HJp7KdxvYECL6I796uRDuyixuchZ9xAdP
 s81JdowqonElXN3CO3FFGBTkSyqQoxmGAseD43XboRPlseBxcOWHv0spuDx569RCHi
 tRQtGSA9rupij0leRbfIYGo0hmuGSo0VleOPJyIwdUi8Qp523L1u2BVK6N97RiwIz2
 i79fgH0Wuow94uOy1k1K+ksl5j1hx1u7i7Kt6t1JprdUV5yooXp9xEmjd3IkcLj38V
 t7if0aqAMlAdrSPqGDSyxX2nRTwsdYWq+UJEUdku1uWjyYf14o02pXEKObEsfKRs9V
 WjFzCrcWSI4dw==
Date: Thu, 18 Jul 2024 17:56:03 +0200
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev fixes and cleanups for v6.11-rc1
Message-ID: <Zpk7E3ZBlh2UdXy2@carbonx1>
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

please pull a bunch of usual cleanups for the fbdev drivers for kernel 6.11-rc1.

Thanks!
Helge

----------------------------------------------------------------
The following changes since commit 83a7eefedc9b56fe7bfeff13b6c7356688ffa670:

  Linux 6.10-rc3 (2024-06-09 14:19:43 -0700)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.11-rc1

for you to fetch changes up to 8b5ea9029b03efda74292c57e0377a98ed0b7434:

  fbdev: viafb: Make I2C terminology more inclusive (2024-07-11 12:07:48 +0200)

----------------------------------------------------------------
fbdev fixes and cleanups for 6.11-rc1:

- Detect VGA compatibility from VESA attributes [Thomas Zimmermann]
- Make I2C terminology more inclusive in smscufx and viafb [Easwar Hariharan]
- Add lots of missing MODULE_DESCRIPTION() macros [Jeff Johnson]
- Logo code cleanups [Geert Uytterhoeven]
- Minor fixes by Chen Ni, Kuninori Morimoto, Uwe Kleine-König and Christophe Jaillett

----------------------------------------------------------------
Chen Ni (1):
      fbdev: omap2: Return clk_prepare_enable to transfer the error

Christophe JAILLET (1):
      fbdev: mmp: Constify struct mmp_overlay_ops

Easwar Hariharan (2):
      fbdev: smscufx: Make I2C terminology more inclusive
      fbdev: viafb: Make I2C terminology more inclusive

Geert Uytterhoeven (2):
      video/logo: Make logo data const again
      video/logo: Remove linux_serial_image comments

Jeff Johnson (11):
      fbdev: matroxfb: add missing MODULE_DESCRIPTION() macros
      fbdev: viafb: add missing MODULE_DESCRIPTION() macro
      fbdev: kyro: add missing MODULE_DESCRIPTION() macro
      fbdev: goldfishfb: add missing MODULE_DESCRIPTION() macro
      fbdev: macmodes: add missing MODULE_DESCRIPTION() macro
      fbdev: vfb: add missing MODULE_DESCRIPTION() macro
      fbdev: offb: add missing MODULE_DESCRIPTION() macro
      fbdev: c2p_planar: add missing MODULE_DESCRIPTION() macro
      fbdev: amifb: add missing MODULE_DESCRIPTION() macro
      video: console: add missing MODULE_DESCRIPTION() macros
      video: agp: add remaining missing MODULE_DESCRIPTION() macros

Kuninori Morimoto (2):
      fbdev: omapdss: use for_each_endpoint_of_node()
      fbdev: omapfb: use of_graph_get_remote_port()

Thomas Zimmermann (1):
      fbdev: vesafb: Detect VGA compatibility from screen info's VESA attributes

Uwe Kleine-König (1):
      fbdev: Drop explicit initialization of struct i2c_device_id::driver_data to 0

 drivers/char/agp/ali-agp.c                         |  1 +
 drivers/char/agp/alpha-agp.c                       |  1 +
 drivers/char/agp/amd-k7-agp.c                      |  1 +
 drivers/char/agp/ati-agp.c                         |  1 +
 drivers/char/agp/efficeon-agp.c                    |  1 +
 drivers/char/agp/nvidia-agp.c                      |  1 +
 drivers/char/agp/parisc-agp.c                      |  1 +
 drivers/char/agp/sworks-agp.c                      |  1 +
 drivers/video/console/mdacon.c                     |  1 +
 drivers/video/console/newport_con.c                |  1 +
 drivers/video/console/sticon.c                     |  1 +
 drivers/video/console/vgacon.c                     |  1 +
 drivers/video/fbdev/amifb.c                        |  1 +
 drivers/video/fbdev/c2p_planar.c                   |  1 +
 drivers/video/fbdev/goldfishfb.c                   |  1 +
 drivers/video/fbdev/kyro/fbdev.c                   |  1 +
 drivers/video/fbdev/macmodes.c                     |  1 +
 drivers/video/fbdev/matrox/matroxfb_DAC1064.c      |  1 +
 drivers/video/fbdev/matrox/matroxfb_Ti3026.c       |  1 +
 drivers/video/fbdev/matrox/matroxfb_accel.c        |  1 +
 drivers/video/fbdev/matrox/matroxfb_maven.c        |  2 +-
 drivers/video/fbdev/mmp/hw/mmp_ctrl.c              |  2 +-
 drivers/video/fbdev/offb.c                         |  1 +
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c      | 15 +-------------
 .../fbdev/omap2/omapfb/dss/omapdss-boot-init.c     |  3 +--
 drivers/video/fbdev/omap2/omapfb/dss/venc.c        |  4 +---
 drivers/video/fbdev/smscufx.c                      |  4 ++--
 drivers/video/fbdev/ssd1307fb.c                    |  8 ++++----
 drivers/video/fbdev/vesafb.c                       |  2 +-
 drivers/video/fbdev/vfb.c                          |  1 +
 drivers/video/fbdev/via/chip.h                     |  8 ++++----
 drivers/video/fbdev/via/dvi.c                      | 24 +++++++++++-----------
 drivers/video/fbdev/via/lcd.c                      |  6 +++---
 drivers/video/fbdev/via/via_aux.h                  |  2 +-
 drivers/video/fbdev/via/via_i2c.c                  | 12 +++++------
 drivers/video/fbdev/via/viafbdev.c                 |  1 +
 drivers/video/fbdev/via/vt1636.c                   |  6 +++---
 drivers/video/logo/pnmtologo.c                     |  4 ++--
 include/linux/linux_logo.h                         |  3 ---
 include/linux/screen_info.h                        | 10 +++++++++
 include/video/mmp_disp.h                           |  4 ++--
 41 files changed, 78 insertions(+), 64 deletions(-)
