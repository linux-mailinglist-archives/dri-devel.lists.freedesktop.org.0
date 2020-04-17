Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 220B61AE19E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 17:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD3D6E1F2;
	Fri, 17 Apr 2020 15:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDF36E169
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 15:56:54 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MdeSt-1iprPw3KU5-00ZfOr; Fri, 17 Apr 2020 17:56:21 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 linux-fbdev@vger.kernel.org
Subject: [PATCH 0/8] drm, fbdev: rework dependencies
Date: Fri, 17 Apr 2020 17:55:45 +0200
Message-Id: <20200417155553.675905-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:ihjqslpA75qTMF6wDF4+VNNTC1NuRX5DyjEZChnbH2+LduferQW
 jC0LdL6btHPVgdMOdMSVPpZ+znLPsqbExhraTQcyb9rSJjMpz9m6IC8Rv/hCKvIPAJcBGd0
 hoMUlKQPUxa5CWHHDUiR9HooUGxQKazIExDHqcmkZ2XigqkWeJHResaEL4oAKQcpaZIWAwD
 ruyD6lxdbXrDz80gK0WHg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3tM+z2ZlTSg=:Y+9HE2EHWXdISGlEwzfCoA
 znjKjlR25yaG0teoXA4D4CeSSX+90bjonxwvfbjYZQQcAEg91D0TCOo68kMmgHgdjxSeZ/cQE
 h7ea4mzL0RV4U9lI8gHxzNG7B0A+rf1wcqF+02xr5G+kX4C2wqgW9HW3lxAW7aktqf4q5efZA
 JXLi+n2fEBOILATNtcdS5xjaMq/0B3qRcSs/zMQKeCDxG+MvNjdR3AMR8grIoOesVD0m0wUvD
 yeODH5YXBaQtCzFrIkoYRb1enxS0bPVu6rTX8POeJ4YVCxP1ABi+zbsuT4BXoeW7Iap00s+hz
 7xlD1BV37+gDlcxZ4GZUzs5tkkaPQIkMCGCvUJOJ3rRut1JwC7X/lr3drfx9hw5cjIaiE1LMC
 JgK5KNaFDR7oPdLrOS/C1OEbrOiqB8gKsjT5ZPt+0NtBNIJtfgyv9fvvcX75UR1+nfhojAaLF
 xC49KgXOQS2jnvO1w1VJdB5lRJmfPWJQDsRXP5sZTVRzYeLLqC0EHgTreGAoUOcQ+oxV5QDCL
 T7OI5dkyb/qbyPE8C09N72z19941QqlXgY5M0x2NkO9rzCPWhDkHqXL9ivrf2NiNfu/G4uOal
 BEFmbx0RKEk2vk9zgrHJasgEMe36VSFu6DggJ6Gk7Swe0drJO7GkfcCaQ5/jzUA+hgDkAMlWa
 z5WnF+9VTwvi6zaTpktEnJEvJPz1hiLDMUl/Xt+t2c8zGxhmhMNv3lkHXnPQIcSk+YBRNVSPs
 5L8k0Ju92kqHNPL3aAP7VTgciERckhKIKlBGQpFCZz2DlY828VoHZGEjrZjRuxqZFZfd04ylz
 wzH+eGBO8rrvCSJAO8TPvbKeMFvlMJr5uWCJBB8rNqGirwuBew=
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
Cc: marex@denx.de, dsd@laptop.org, Arnd Bergmann <arnd@arndb.de>,
 Andrzej Hajda <a.hajda@samsung.com>, airlied@linux.ie, masahiroy@kernel.org,
 Nicolas Pitre <nico@fluxnic.net>, Saeed Mahameed <saeedm@mellanox.com>,
 thellstrom@vmware.com, haojian.zhuang@gmail.com, geert@linux-m68k.org,
 linux-renesas-soc@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 kieran.bingham+renesas@ideasonboard.com, linux-graphics-maintainer@vmware.com,
 Laurent.pinchart@ideasonboard.com, jfrederich@gmail.com,
 robert.jarzmik@free.fr, daniel@zonque.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I tried to fix up some dependencies after the sii8620 "imply EXTCON"
statementn broke, trying a few things but in the backing out a
change that would completely reverse the LEDS_CLASS selects into
a 'depends on'. 

However, what I got now are multiple changes that remove gratious
"selects" that lead to circular dependencies for sii8620 and others:

- Anything doing "select FB" is now gone, or becomes "depends on FB",

- DDC support depends on I2C instead of selecting it

- backlight class device support is never selected by framebuffer
  drivers but has proper dependencies

I have done thousands of randconfig build tests on this, but no
runtime tests.

Some of the 'depends on FOO || !FOO' statements could be simplified
into a new 'uses FOO' syntax based on a patch from Saeed Mahameed,
but I would for the moment treat that as a cleanup that can be done
later.

If we can agree on these changes, maybe someone can merge them
through the drm-misc tree.

Please review

       Arnd

Arnd Bergmann (8):
  fbdev: w100fb: clean up mach-pxa compile-time dependency
  fbdev/ARM: pxa: avoid selecting CONFIG_FB
  fbdev: rework FB_DDC dependencies
  drm/rcar: stop using 'imply' for dependencies
  drm/vmwgfx: make framebuffer support optional
  drm: decouple from CONFIG_FB
  fbdev: rework backlight dependencies
  drm/bridge/sii8620: fix extcon dependency

 arch/arm/configs/pxa_defconfig      |  3 ++
 arch/arm/mach-pxa/Kconfig           |  7 ---
 arch/arm/mach-pxa/eseries.c         | 14 +----
 arch/arm/mach-pxa/saar.c            |  2 +-
 arch/arm/mach-pxa/tavorevb.c        |  2 +-
 drivers/auxdisplay/Kconfig          |  1 +
 drivers/gpu/drm/Kconfig             |  5 +-
 drivers/gpu/drm/bridge/Kconfig      |  2 +-
 drivers/gpu/drm/mxsfb/Kconfig       |  1 -
 drivers/gpu/drm/rcar-du/Kconfig     | 23 +++++---
 drivers/gpu/drm/vmwgfx/Kconfig      | 17 +++---
 drivers/gpu/drm/vmwgfx/Makefile     |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 35 +++++++-----
 drivers/gpu/drm/zte/Kconfig         |  1 -
 drivers/macintosh/Kconfig           |  1 +
 drivers/staging/fbtft/Kconfig       |  1 +
 drivers/staging/olpc_dcon/Kconfig   |  2 +-
 drivers/video/fbdev/Kconfig         | 31 ++++++++---
 drivers/video/fbdev/w100fb.c        | 84 +++++------------------------
 include/video/w100fb.h              |  6 +--
 20 files changed, 101 insertions(+), 141 deletions(-)

-- 
2.26.0

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Nicolas Pitre <nico@fluxnic.net>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Saeed Mahameed <saeedm@mellanox.com>
Cc: <masahiroy@kernel.org>
Cc: <Laurent.pinchart@ideasonboard.com>
Cc: <linux-renesas-soc@vger.kernel.org>,
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
Cc: <kieran.bingham+renesas@ideasonboard.com>,
Cc: <airlied@linux.ie>
Cc: daniel@zonque.org
Cc: haojian.zhuang@gmail.com
Cc: robert.jarzmik@free.fr
Cc: daniel@ffwll.ch
Cc: marex@denx.de
Cc: stefan@agner.ch
Cc: linux-graphics-maintainer@vmware.com
Cc: thellstrom@vmware.com
Cc: jfrederich@gmail.com
Cc: dsd@laptop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: geert@linux-m68k.org
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
