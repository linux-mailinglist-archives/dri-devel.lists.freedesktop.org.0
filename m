Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BED375C94A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 16:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DF610E696;
	Fri, 21 Jul 2023 14:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4330310E68F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 14:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1689948773; x=1690553573; i=deller@gmx.de;
 bh=B6OJug3RQ/dhSV0+iYjTHPYdl9R4HHqWZ5P7FggM32Y=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=jvrwo7EU26Qn4xLZeQXP/TrNQi1RZKW+AD9fUtCdj82fuNtmHjLTxWQWDG00Yx5n9KvhRe+
 NP6yrMKFi+1QGZGD6Lt2/C/WRXRM0TYZBf/XrD9FUByffGHWsucTDeWuIBCqAL2gRmmiRH2YZ
 aw962IZW/k4O1/xlLyd7BE7OCTof2xol3JGXq2UpeaY/Mr5AIDbXZvEky/WxmxzA3BPxDZqui
 Keefbj2ssedH+yR+mysXpushYzh0qmRkjCUJuFvCEdwk7rBwBQiN+k8VKoAhX0aeCEIM0Vlnt
 NE5xImXzoCmqeb+25TYYYu6tLIXI/PJIXy2aks7OSQQZBSKuEBZw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ls3530 ([94.134.144.189]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MD9T7-1qEMY0224n-0094cI; Fri, 21
 Jul 2023 16:12:53 +0200
Date: Fri, 21 Jul 2023 16:12:51 +0200
From: Helge Deller <deller@gmx.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev fixes and cleanups for v6.5-rc3
Message-ID: <ZLqSYylyXm2C+aOV@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:bw6bgLEYCwMnCIoBsQoi4Xek0KYaNO2nzlmlmjiBM6WSjLqgkPq
 3hLND5tJwOqyDFYZwsI1OzvTpgx/XVITlRtCe1vf+lle8oPvmAAX9xtDwjbZd4NrL9TV+xy
 kGHycCFcPmni6FZq1bzb9G1EgLw6TzP7j2/EsZ3jDCyK3lAXgI0AMQkw+ZwzTzTh4q5DXOE
 e8qMDw4hEQboQqeY4RHIw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:x75p+0ShAvQ=;id5z+tiQTFDYt/CRQx283MBd06A
 v+Xt2JMyLemCGWm0XtLmFFsb8iMsiOpRlkH4nE+HAZfqeVks0hS+qtbGmpY54vEDOSAQfhyg7
 1WvUjwLNK2ezJ/vb/ksywXD4wuXBIBwKL6hRZlQhWRuGL2aNU0HE0AIUPczZIl2xiPYBhHiFt
 B2IUATykGq/weii+uRyjKtx5hyChdeExtS3+FhksE+oBmvzpvyrv2dkOcZ+yokMV+CtQPp767
 5IkDB4wsDcCarO63GzUHMWPrAsQmjq9ta6hL8sf1177t4eQP03HInu4WXhVsknsixP2Kw7dZC
 kiwtYGDczvn8ggKr++efbQeiJGUWI118Ko/3EdFkNZQ9N1Dcq486zekq/QSqjhyLenZr0bdCf
 xNPvFz1l8cVME9RweMjEF5f0ZyrmssFj3EvxPMPLl04UlTDpv3CiRAyh9BUgnezBMuG+iU3jj
 58r6PQETbQzpU+XcrHhTbiaZymVCgPeEVM3pyKoHzSAjX8YKGOtoFrvADnD+iKG9ITITu3LxW
 7PrLrHY9S3oFS1rjNKR3RPP5+XgTU5iCTgXvAo/RSrfArJDnTa9XQ2dH+mTCxHooqvVtFB02V
 VbMbrmXNHeELNwtmjoa3SUCsK+CE+D1uRz306smDh9qKS18giePBqsULf3jEODZC8y0fAmabM
 iI80cJzmj8633OZ+i1vysQbc0FCc4NU1oc68mhAthUU/Tn5o7SpdEsRl4BcVE/8PRnW6iyveK
 vEXry8mxPL9BPBI6K9CDcbR9GtU4NU8vHgtfVarSx7Ef1W/IE5/Vb00SOSrlYLKsRey+JC7zh
 WEzewfyP6/XH9FUFoVpSVBzFHwqlZFp0xo7xTumbaUj3Z1URriHNpYRMGtVAdpfeaIUjqrL7u
 xWaY08adgb5bvS1IEfkHRdJU5VCQzZKvlRELFYTP6TgmOOmCUBxquIYU9T4WTfVF1YEs5s1Rx
 41vSIQ==
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
Cc: Martin Kaiser <martin@kaiser.cx>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

please pull some fbdev fixes & cleanups for kernel 6.5-rc3.

Just the usual bunch of code cleanups in various drivers, this time
mostly in vgacon and imxfb.

Thanks!
Helge

--------------

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.5-rc3

for you to fetch changes up to e8812acb5bf724f2fc23a500e590c776ebda7b0a:

  fbdev: Explicitly include correct DT includes (2023-07-20 07:56:30 +0200)

----------------------------------------------------------------
fbdev fixes and cleanups for 6.5-rc3:

- Code cleanup in vgacon (Jiri Slaby)
- Explicitly include correct DT includes (Rob Herring)
- imxfb code cleanup (Yangtao Li, Martin Kaiser)
- kyrofb: make arrays const and smaller (Colin Ian King)
- ep93xx-fb: return value check fix (Yuanjun Gong)
- au1200fb: add missing IRQ check (Zhang Shurong)

----------------------------------------------------------------
Colin Ian King (1):
      fbdev: kyro: make some const read-only arrays static and reduce type size

Jiri Slaby (SUSE) (7):
      vgacon: switch vgacon_scrolldelta() and vgacon_restore_screen()
      vgacon: remove unneeded forward declarations
      vgacon: remove unused xpos from vgacon_set_cursor_size()
      vgacon: let vgacon_doresize() return void
      vgacon: cache vc_cell_height in vgacon_cursor()
      sticon: make sticon_set_def_font() void and remove op parameter
      fbcon: remove unused display (p) from fbcon_redraw()

Martin Kaiser (2):
      fbdev: imxfb: warn about invalid left/right margin
      fbdev: imxfb: switch to DEFINE_SIMPLE_DEV_PM_OPS

Rob Herring (1):
      fbdev: Explicitly include correct DT includes

Yangtao Li (4):
      fbdev: imxfb: Removed unneeded release_mem_region
      fbdev: imxfb: Convert to devm_kmalloc_array()
      fbdev: imxfb: Convert to devm_platform_ioremap_resource()
      fbdev: imxfb: remove unneeded labels

Yuanjun Gong (1):
      fbdev: ep93xx-fb: fix return value check in ep93xxfb_probe

Zhang Shurong (1):
      fbdev: au1200fb: Fix missing IRQ check in au1200fb_drv_probe

 drivers/video/console/sticon.c                     | 12 ++--
 drivers/video/console/vgacon.c                     | 74 ++++++++--------------
 drivers/video/fbdev/au1200fb.c                     |  3 +
 drivers/video/fbdev/bw2.c                          |  3 +-
 drivers/video/fbdev/cg14.c                         |  3 +-
 drivers/video/fbdev/cg3.c                          |  3 +-
 drivers/video/fbdev/cg6.c                          |  3 +-
 drivers/video/fbdev/core/fbcon.c                   |  7 +-
 drivers/video/fbdev/ep93xx-fb.c                    |  4 +-
 drivers/video/fbdev/ffb.c                          |  3 +-
 drivers/video/fbdev/grvga.c                        |  3 +-
 drivers/video/fbdev/imxfb.c                        | 48 ++++++--------
 drivers/video/fbdev/kyro/STG4000InitDevice.c       | 10 +--
 drivers/video/fbdev/leo.c                          |  3 +-
 drivers/video/fbdev/mb862xx/mb862xxfb_accel.c      |  4 +-
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c         |  6 +-
 .../fbdev/omap2/omapfb/displays/panel-dsi-cm.c     |  2 +-
 drivers/video/fbdev/p9100.c                        |  3 +-
 drivers/video/fbdev/platinumfb.c                   |  4 +-
 drivers/video/fbdev/sbuslib.c                      |  2 +-
 drivers/video/fbdev/sunxvr1000.c                   |  3 +-
 drivers/video/fbdev/sunxvr2500.c                   |  2 +-
 drivers/video/fbdev/sunxvr500.c                    |  2 +-
 drivers/video/fbdev/tcx.c                          |  3 +-
 drivers/video/fbdev/xilinxfb.c                     |  5 +-
 25 files changed, 97 insertions(+), 118 deletions(-)
