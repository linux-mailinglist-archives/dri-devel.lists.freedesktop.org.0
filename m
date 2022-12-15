Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5611064D74B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 08:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C65110E097;
	Thu, 15 Dec 2022 07:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129EC10E097
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 07:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1671089644; bh=7zUfFLAsv5BwM3QMGuwZSLFemhuXLiMBGDJ7SGzoB/I=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=OOD5ti6VdDaR+rcFwkynf2gjPkrmX5HJPfX0SbqP7mcYd802XdXs5uQwL81d4asuM
 sTkeYkU+dlamdevRriMazZcnrcPlMyaZb1OVS2vldJpqcfNq/uM1QelijdPkeO9XOS
 pkbcLLKlcBvCth1SzG2YslNOkjgtAefFe0nTB5Av3c46iX3IgB45fSx5QjUUF7gWAG
 hY4yKJNgrr5/m9bgpJNMgqYHZJGetwRnXpqkY6wNO/V7lZrRJp/DB/KbzhjyqRgZzm
 ogOMptD9ssoWG4YzqSRiYdIxtZJ3Rtw6fZMeomX3R7YqqVPcHG3tshOLygx1w3XMNK
 CByVhLq7hevvA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ls3530 ([92.116.161.210]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGQj7-1p9KiH15oL-00Gqik; Thu, 15
 Dec 2022 08:34:04 +0100
Date: Thu, 15 Dec 2022 08:34:00 +0100
From: Helge Deller <deller@gmx.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev fixes and updates for v6.2-rc1
Message-ID: <Y5rN6CT8genL6wQc@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SJKW3VdumEyfRXaGPuMgEugdQ28y1gGugzzxmGlhUPdfZe2lmwB
 RjkLBiB8DfeFAGF2O2evCIyfas6ccVSVg9LU2joUz7JZFC5Y8xlcHPhergLvf85Bxwfim54
 XjENivD2T2kz32zxQ2IwZnKzQvi2PVeQNbD06sa2GHHce378lXJELK8RoGjjopRWy00/quJ
 YLyvI4BuR/MU5gqKA29Gw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EWKHmqdbQ80=;ZmrZIcg34/MRqa9ksMn3dYo+Ozp
 qcOLgk/lQUF3P2gWjlllkf52NQGu7frshakJFogGgMiEUNm9E0S7HcVQwb7g8/RhvqZtI8HpY
 8zLH0QEEzl0K3MxUbJpArY+arS+EsKFConp0OnDMLc7btbJTk8LgpZwUrHZTQWOJz6u2T0nXy
 6kh4eT6PEUhspzkA5CsuEPIO8S9hOXeEaOrBiRsKsWK8ml7etnhClPuN5OKTxpEKHekYL8BxQ
 xlxkH7Qfrka85Wqyy7dTNTipt6L/O0Ug18coThKXGUsDs6NJAclwn1gC9P9ueI+VZMBErSwyq
 R2FZnBk9oyZrRrfQt88ws2qOYch4Pidd2vNBoYumaqnOzc+9K4nEnNdTXWfPJ+bXvU4zHlmq6
 s7ryWSwPm/8iMReoQgpyjvDUq6JFTIAW07XoaJO7c0zE7AWlBlpKEFXXAPfu/8oJgPVc2IH23
 hx6APp9Wmi1HKar4TDdcX+M6hN5QQ0cKUZE8J13+bpjq/inWknphZwoT8YaNmbIs+av6dt+hZ
 he2pVAnmD4hX8QtxzR3uv5hUi0Dq90WHl88btsEzAZERo3rwCHneG2MwXpJMknlNGeU3sKpln
 2WomdaOKAGUS+eeP3hVNfuSErOlIHFaYgj2nQfAEPy61Uhj/ZJzVT6nU4CekLoFeLsiZcob3E
 waCXGDR4jrPVzmcJehaVfwlaecqbhpx8iLdI2YaIzkRz5y6GIsE7fglFfZ2yJjQviZdSxuzFb
 mOHJ+r6gPpdbt+afEV0nEW3e7M4KYES9BgHT1SzvZIXnGfvcTZgZmNJOYuNDs4IbW+p9bmISU
 LBG0Li3uspT1iCw/OqfmJhBOtAZtUOUZwBzZ/HCBuWySxYPuNE7wZJxAwOhP8+RA+vWYCgt9g
 AcR8RWMSK/gkjZNs2olxFCkRLnRXIiwu4BaIuVVWF43OHiyJ9FZ4Ix5WkKH6Deyxq5+Y9Rquu
 /NiQ/Q==
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
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

please pull fbdev fixes and updates for kernel 6.2-rc1.

Most relevant are the patches from Dmitry Torokhov to switch omapfb to
the gpiod API.
The other patches are small and fix e.g. UML build issues, improve
the error paths and cleanup code.

Thanks,
Helge


The following changes since commit c7020e1b346d5840e93b58cc4f2c67fc645d8df=
9:

  Merge tag 'pci-v6.2-changes' of git://git.kernel.org/pub/scm/linux/kerne=
l/git/helgaas/pci (2022-12-14 09:54:10 -0800)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git ta=
gs/fbdev-for-6.2-rc1

for you to fetch changes up to 3c3bfb8586f848317ceba5d777e11204ba3e5758:

  fbdev: fbcon: release buffer when fbcon_do_set_font() failed (2022-12-14=
 20:01:51 +0100)

=2D---------------------------------------------------------------
fbdev updates and fixes for kernel 6.2-rc1:

Switch omapfb to the gpiod API, some failure path fixes and
UML build fixes.

=2D---------------------------------------------------------------
Andy Shevchenko (2):
      fbdev: ssd1307fb: Drop optional dependency
      fbdev: ssd1307fb: Drop duplicate NULL checks for PWM APIs

Christophe JAILLET (2):
      fbdev: uvesafb: Fixes an error handling path in uvesafb_probe()
      fbdev: uvesafb: Simplify uvesafb_remove()

Colin Ian King (1):
      fbdev: omapfb: remove redundant variable checksum

Dmitry Torokhov (13):
      fbdev: omapfb: connector-hdmi: switch to using gpiod API
      fbdev: omapfb: panel-sony-acx565akm: remove support for platform dat=
a
      fbdev: omapfb: panel-sony-acx565akm: switch to using gpiod API
      fbdev: omapfb: encoder-tfp410: switch to using gpiod API
      fbdev: omapfb: panel-dsi-cm: switch to using gpiod API
      fbdev: omapfb: panel-tpo-td043mtea1: switch to using gpiod API
      fbdev: omapfb: panel-nec-nl8048hl11: switch to using gpiod API
      fbdev: omapfb: panel-dpi: remove support for platform data
      fbdev: omapfb: connector-analog-tv: remove support for platform data
      fbdev: omapfb: encoder-opa362: fix included headers
      fbdev: omapfb: panel-lgphilips-lb035q02: remove backlight GPIO handl=
ing
      fbdev: omapfb: panel-tpo-td028ttec1: stop including gpio.h
      fbdev: omapfb: panel-sharp-ls037v7dw01: fix included headers

Dongliang Mu (2):
      fbdev: smscufx: fix error handling code in ufx_usb_probe
      fbdev: da8xx-fb: add missing regulator_disable() in fb_probe

Gaosheng Cui (1):
      fbdev: ep93xx-fb: Add missing clk_disable_unprepare in ep93xxfb_prob=
e()

Randy Dunlap (2):
      fbdev: geode: don't build on UML
      fbdev: uvesafb: don't build on UML

Shang XiaoJing (1):
      fbdev: via: Fix error in via_core_init()

Tetsuo Handa (1):
      fbdev: fbcon: release buffer when fbcon_do_set_font() failed

Uwe Kleine-K=F6nig (1):
      fbdev: matroxfb: Convert to i2c's .probe_new()

Xiongfeng Wang (1):
      fbdev: vermilion: decrease reference count in error path

Yang Yingliang (1):
      fbdev: pm2fb: fix missing pci_disable_device()

Yu Zhe (1):
      fbdev: controlfb: fix spelling mistake "paramaters"->"parameters"

wangkailong@jari.cn (1):
      fbdev: pxafb: Remove unnecessary print function dev_err()

ye xingchen (2):
      fbdev: uvesafb: use sysfs_emit() to instead of scnprintf()
      fbdev: sh_mobile_lcdcfb: use sysfs_emit() to instead of scnprintf()

 drivers/video/fbdev/Kconfig                        |   2 +-
 drivers/video/fbdev/controlfb.c                    |   2 +-
 drivers/video/fbdev/core/fbcon.c                   |   3 +-
 drivers/video/fbdev/da8xx-fb.c                     |   7 +-
 drivers/video/fbdev/ep93xx-fb.c                    |   4 +-
 drivers/video/fbdev/geode/Kconfig                  |   1 +
 drivers/video/fbdev/matrox/matroxfb_maven.c        |   5 +-
 .../omap2/omapfb/displays/connector-analog-tv.c    |  60 ++---------
 .../fbdev/omap2/omapfb/displays/connector-hdmi.c   |  49 +++------
 .../fbdev/omap2/omapfb/displays/encoder-opa362.c   |   4 +-
 .../fbdev/omap2/omapfb/displays/encoder-tfp410.c   |  67 ++++--------
 .../video/fbdev/omap2/omapfb/displays/panel-dpi.c  |  83 ++-------------
 .../fbdev/omap2/omapfb/displays/panel-dsi-cm.c     | 116 ++++++++--------=
-----
 .../omapfb/displays/panel-lgphilips-lb035q02.c     |  21 +---
 .../omap2/omapfb/displays/panel-nec-nl8048hl11.c   |  72 ++++---------
 .../omapfb/displays/panel-sharp-ls037v7dw01.c      |   3 +-
 .../omap2/omapfb/displays/panel-sony-acx565akm.c   | 105 ++++++----------=
---
 .../omap2/omapfb/displays/panel-tpo-td028ttec1.c   |   1 -
 .../omap2/omapfb/displays/panel-tpo-td043mtea1.c   |  59 +++--------
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c  |   2 -
 drivers/video/fbdev/pm2fb.c                        |   9 +-
 drivers/video/fbdev/pxafb.c                        |   1 -
 drivers/video/fbdev/sh_mobile_lcdcfb.c             |   8 +-
 drivers/video/fbdev/smscufx.c                      |  46 +++++---
 drivers/video/fbdev/ssd1307fb.c                    |  12 +--
 drivers/video/fbdev/uvesafb.c                      |  39 ++++---
 drivers/video/fbdev/vermilion/vermilion.c          |   4 +-
 drivers/video/fbdev/via/via-core.c                 |   9 +-
 include/video/omap-panel-data.h                    |  71 -------------
 29 files changed, 261 insertions(+), 604 deletions(-)
 delete mode 100644 include/video/omap-panel-data.h
