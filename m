Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DF86EFA21
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 20:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD41C10E274;
	Wed, 26 Apr 2023 18:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54BA10E274
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 18:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1682534409; i=deller@gmx.de;
 bh=3/idmjlkYQnQ8PWvJhQzEugXCooeMcxuUiAXbdpczjU=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=EcBdEO6mz/orCZLbOKFbyTm4rRDHUXvh1teITtY3HvdCO99QJaAR1JB+BOB25yWXg
 +kyrH2E1Y4Hyzu1fPa1i1EL1nDivLRFO6fhEQkhWQbVmcd6SPigRWW627IcHgpP2Ec
 vTnmcNgSMTkYwOTAN4W1zDt2ZMS+WMU010qbr2EWZ+gU8f1lrjAsVOYc8qLSTO+tFQ
 WsfUfkMfYT92PSKlubkhARScwoEqAGDOgwLGASFCLEsUD+xeQp4C5xcE2bpVOYLJZu
 MAKM4ND76/qy0RyaqLI+b5neYTO0ZMKSJL6jR7ps0qDK8Ltwm0Cev5PZwZ+t8n4rNG
 RnVlOBH0pmpgw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ls3530 ([94.134.157.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MoO2E-1qc2BF0UY4-00ori7; Wed, 26
 Apr 2023 20:40:09 +0200
Date: Wed, 26 Apr 2023 20:40:07 +0200
From: Helge Deller <deller@gmx.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev fixes and updates for v6.4-rc1
Message-ID: <ZElwB2/zlXli1QwA@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BVkxNRdQChXfv8LUMeg9FmQA7jsIGj4IDi1yP7gIopD3vVhxfvd
 LJF7K7BlNatHlQoRbs0TetFchfcrK6Agi/WaD8UCFvUpJ+B91NUlcS26ViWQOrH8SsgoNRj
 jYV0vIL4CITxl4YbwtbQIXp/bfyHuKD5c1NcsXjWEGDkYAe+g8638q53fElXd2L5LkV/OTd
 BEgLC98KkK1MM6Nu9xqEg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IKDWcD3kPWU=;v2eXmqlRseCUu3KbYvc+/uDu+XB
 7Ojd8V61DECiHMUM7/K5k2Oh7aLZIJI2AQ1wJBbnl+58Vam6NU2w6kyCxJdvW7EF5mXgeq+z/
 LshzFWFzWPFdnJenF8leH6fe/qJURFfrRx/id/JtnMc3Y6HHC5AhoKec0xS2qdCoVF8hkhYlJ
 TmZDGgeaaJTZlIi93I42nE/0KJLyZOEl2ZkxYD7qxFTWp7SZSlbt4N0CxoMWh7awmT+zrnNMT
 Xo2pOdjdGFNlWkPdXHQOClyryTvZp51d4yZW7qwI0Y96KXqb63U3q2wIlDIJptxMKScPY3Ypa
 tReMj2TpMoEFtLFmFPJuxuQiwqtqNKxyVvnhbdDbz+KNwR//MF2hfVVj0iTo6gbD5Bd+HbJ07
 Zp0oew3Ludlf+8dZVdk3TEWI7fiABDIuvJEqpFspjd7vcCPUK7vMWv+x6SGILFgErCs4WocVu
 smw0NPCul2CVHGh0laPI8s7dUeGWtKUi3Q9KjT9bOieOXKVPul5fVvhobgGPq6ezSuVYMLJja
 ecYen5nCBmShRKTIUXdplAavFXFnpm9O/CyYo0VZErYsszPVkZwXPLZIB8EapvgaE1ZTlWuP5
 Mvfenup8kueGbjJ9wUI6G7l6FD5b9Bthjrlvi0cysht1m7g+wpDx3bfyr6x5fElWvm3RZW5/9
 RQwjj+gWX7QzXwMfR8XcufshDjzd/fcOleoOwFGTLmaAyWrWFQEIP5t4Um3bjS986Vk15TeD2
 vZubzA2kgISIT27H2SFIZRint03KTv2jQ4YcVV46j8gQstMiliudrWRcME1URda8ZK0IGpq2S
 VYsWD51DikvOtzPYF8lkggWw7OMER/uFZdkLNjN2MKG+2HcOuEENVWhr/ykkBbGBO2jzV9scc
 UVPzWmW6CSDQn7K5Ryt4Dc6FUb+zSIcXskzxs6jFq6dp3wx58i5TZT4H2j7xfTKQWiRdUFfr7
 udmmVQ==
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

please pull the fbdev updates for v6.4-rc1.

Nothing really exiting in here. The majority of lines changed is
due to Uwe's preparation patches to change the return value of the
.remove() callback to void.

Thanks!
Helge



The following changes since commit e8d018dd0257f744ca50a729e3d042cf2ec9da6=
5:

  Linux 6.3-rc3 (2023-03-19 13:27:55 -0700)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git ta=
gs/fbdev-for-6.4-rc1

for you to fetch changes up to 60ed3cd85b95184936bce70ed7f9e76a6a54a5e1:

  MAINTAINERS: Remove rage128 framebuffer driver maintainer (2023-04-24 11=
:48:47 +0200)

=2D---------------------------------------------------------------
fbdev updates for kernel 6.4-rc1:

- vt_buffer.h: Fix build on alpha (Randy Dunlap)
- mmp: Clock handling fix (Christophe JAILLET)
- 68328fb, ps3fb, vfb: Init .owner field of struct fb_ops (Thomas Zimmerma=
nn)
- Preparation patches to convert drivers to return void in .remove() callb=
ack
  (Uwe Kleine-K=F6nig)
- Drop Paul Mackerras as rage128 maintainer

=2D---------------------------------------------------------------
Christophe JAILLET (1):
      fbdev: mmp: Fix deferred clk handling in mmphw_probe()

Paul Mackerras (1):
      MAINTAINERS: Remove rage128 framebuffer driver maintainer

Randy Dunlap (1):
      linux/vt_buffer.h: allow either builtin or modular for macros

Thomas Zimmermann (3):
      fbdev: 68328fb: Init owner field of struct fb_ops
      fbdev: ps3fb: Init owner field of struct fb_ops
      fbdev: vfb: Init owner field of struct fb_ops

Uwe Kleine-K=F6nig (45):
      fbdev: cg14: Convert to platform remove callback returning void
      fbdev: cg3: Convert to platform remove callback returning void
      fbdev: cg6: Convert to platform remove callback returning void
      fbdev: clps711x-fb: Convert to platform remove callback returning vo=
id
      fbdev: cobalt_lcdfb: Convert to platform remove callback returning v=
oid
      fbdev: da8xx-fb: Convert to platform remove callback returning void
      fbdev: efifb: Convert to platform remove callback returning void
      fbdev: ep93xx-fb: Convert to platform remove callback returning void
      fbdev: ffb: Convert to platform remove callback returning void
      fbdev: fsl-diu-fb: Convert to platform remove callback returning voi=
d
      fbdev: gbefb: Convert to platform remove callback returning void
      fbdev: goldfishfb: Convert to platform remove callback returning voi=
d
      fbdev: grvga: Convert to platform remove callback returning void
      fbdev: hecubafb: Convert to platform remove callback returning void
      fbdev: hgafb: Convert to platform remove callback returning void
      fbdev: hitfb: Convert to platform remove callback returning void
      fbdev: imxfb: Convert to platform remove callback returning void
      fbdev: leo: Convert to platform remove callback returning void
      fbdev: mb862xx: Convert to platform remove callback returning void
      fbdev: metronomefb: Convert to platform remove callback returning vo=
id
      fbdev: mx3fb: Convert to platform remove callback returning void
      fbdev: ocfb: Convert to platform remove callback returning void
      fbdev: offb: Convert to platform remove callback returning void
      fbdev: omapfb: Convert to platform remove callback returning void
      fbdev: p9100: Convert to platform remove callback returning void
      fbdev: platinumfb: Convert to platform remove callback returning voi=
d
      fbdev: pxa168fb: Convert to platform remove callback returning void
      fbdev: pxa3xx-gcu: Convert to platform remove callback returning voi=
d
      fbdev: pxafb: Convert to platform remove callback returning void
      fbdev: s1d13xxxfb: Convert to platform remove callback returning voi=
d
      fbdev: s3c-fb: Convert to platform remove callback returning void
      fbdev: sh7760fb: Convert to platform remove callback returning void
      fbdev: sh_mobile_lcdcfb: Convert to platform remove callback returni=
ng void
      fbdev: simplefb: Convert to platform remove callback returning void
      fbdev: sm501fb: Convert to platform remove callback returning void
      fbdev: tcx: Convert to platform remove callback returning void
      fbdev: uvesafb: Convert to platform remove callback returning void
      fbdev: vesafb: Convert to platform remove callback returning void
      fbdev: vfb: Convert to platform remove callback returning void
      fbdev: vga16fb: Convert to platform remove callback returning void
      fbdev: via: Convert to platform remove callback returning void
      fbdev: vt8500lcdfb: Convert to platform remove callback returning vo=
id
      fbdev: wm8505fb: Convert to platform remove callback returning void
      fbdev: wmt_ge_rops: Convert to platform remove callback returning vo=
id
      fbdev: xilinxfb: Convert to platform remove callback returning void

 MAINTAINERS                                    | 3 +--
 drivers/video/fbdev/68328fb.c                  | 1 +
 drivers/video/fbdev/cg14.c                     | 6 ++----
 drivers/video/fbdev/cg3.c                      | 6 ++----
 drivers/video/fbdev/cg6.c                      | 6 ++----
 drivers/video/fbdev/clps711x-fb.c              | 6 ++----
 drivers/video/fbdev/cobalt_lcdfb.c             | 6 ++----
 drivers/video/fbdev/da8xx-fb.c                 | 6 ++----
 drivers/video/fbdev/efifb.c                    | 6 ++----
 drivers/video/fbdev/ep93xx-fb.c                | 6 ++----
 drivers/video/fbdev/ffb.c                      | 6 ++----
 drivers/video/fbdev/fsl-diu-fb.c               | 6 ++----
 drivers/video/fbdev/gbefb.c                    | 6 ++----
 drivers/video/fbdev/goldfishfb.c               | 5 ++---
 drivers/video/fbdev/grvga.c                    | 6 ++----
 drivers/video/fbdev/hecubafb.c                 | 5 ++---
 drivers/video/fbdev/hgafb.c                    | 6 ++----
 drivers/video/fbdev/hitfb.c                    | 6 ++----
 drivers/video/fbdev/imxfb.c                    | 6 ++----
 drivers/video/fbdev/leo.c                      | 6 ++----
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c     | 5 ++---
 drivers/video/fbdev/metronomefb.c              | 5 ++---
 drivers/video/fbdev/mmp/hw/mmp_ctrl.c          | 2 +-
 drivers/video/fbdev/mx3fb.c                    | 5 ++---
 drivers/video/fbdev/ocfb.c                     | 6 ++----
 drivers/video/fbdev/offb.c                     | 8 +++-----
 drivers/video/fbdev/omap/omapfb_main.c         | 6 ++----
 drivers/video/fbdev/omap2/omapfb/dss/core.c    | 6 ++----
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c   | 5 ++---
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c     | 5 ++---
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c     | 5 ++---
 drivers/video/fbdev/omap2/omapfb/dss/dss.c     | 5 ++---
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c   | 5 ++---
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c   | 5 ++---
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c     | 5 ++---
 drivers/video/fbdev/omap2/omapfb/dss/venc.c    | 5 ++---
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c | 6 ++----
 drivers/video/fbdev/p9100.c                    | 6 ++----
 drivers/video/fbdev/platinumfb.c               | 6 ++----
 drivers/video/fbdev/ps3fb.c                    | 1 +
 drivers/video/fbdev/pxa168fb.c                 | 8 +++-----
 drivers/video/fbdev/pxa3xx-gcu.c               | 6 ++----
 drivers/video/fbdev/pxafb.c                    | 8 +++-----
 drivers/video/fbdev/s1d13xxxfb.c               | 5 ++---
 drivers/video/fbdev/s3c-fb.c                   | 6 ++----
 drivers/video/fbdev/sh7760fb.c                 | 6 ++----
 drivers/video/fbdev/sh_mobile_lcdcfb.c         | 5 ++---
 drivers/video/fbdev/simplefb.c                 | 6 ++----
 drivers/video/fbdev/sm501fb.c                  | 6 ++----
 drivers/video/fbdev/tcx.c                      | 6 ++----
 drivers/video/fbdev/uvesafb.c                  | 6 ++----
 drivers/video/fbdev/vesafb.c                   | 6 ++----
 drivers/video/fbdev/vfb.c                      | 6 +++---
 drivers/video/fbdev/vga16fb.c                  | 6 ++----
 drivers/video/fbdev/via/via-gpio.c             | 5 ++---
 drivers/video/fbdev/via/via_i2c.c              | 5 ++---
 drivers/video/fbdev/vt8500lcdfb.c              | 6 ++----
 drivers/video/fbdev/wm8505fb.c                 | 6 ++----
 drivers/video/fbdev/wmt_ge_rops.c              | 5 ++---
 drivers/video/fbdev/xilinxfb.c                 | 6 ++----
 include/linux/vt_buffer.h                      | 2 +-
 61 files changed, 121 insertions(+), 212 deletions(-)
