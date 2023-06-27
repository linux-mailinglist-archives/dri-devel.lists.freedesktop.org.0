Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 729CA73F461
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 08:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B564C10E28F;
	Tue, 27 Jun 2023 06:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83AD010E28F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 06:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1687846672; x=1688451472; i=deller@gmx.de;
 bh=biWKrKStgCQVZ9bbSwx3mVIhNb6laWf8emSgOMQzZ5s=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=Adz33hOz0C9Rocc4r6kS7TC64qNTuom5XmlpJUnw3YOc2V2+t2PnKq5XWsv083Y0sRpYqfA
 tZ62BYKklRNXuipkyAKSMlv1nqBoamk8EiRExx5chhIru3mB2g4pjTQk2kxtcmdgBqUc3q7oq
 i88H7RIftKsTmUIx0Ax+gTKPfPfTE53NLNt9eicJJHBaGXOyX5oIBtjxfXEEvLh3f6FgfSLLz
 nSeoaKTwJB2ciEFSMVE5E8ySVOeIznzkwMhEyDLUJFkMHdrasVgK8OdEp7yj9t9uA+FbqIJOd
 ZTFexuq84oPfL6bkszWq0viaIBBOCWpo6TpaQ0E4RJbGR+v7SXVg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ls3530 ([94.134.155.6]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mv31W-1pwVCi1ZY0-00r4BQ; Tue, 27
 Jun 2023 08:17:52 +0200
Date: Tue, 27 Jun 2023 08:17:50 +0200
From: Helge Deller <deller@gmx.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev fixes for v6.5-rc1
Message-ID: <ZJp/DpaLeYq6s3hB@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:zTp4pv51aTHsupl3rEEfdVUmEV8y05XJW4UGEP7OX89HuzsBbmy
 c6U9j4ZlZBZ6xf9PCz2lOnqrd6yeR9hXtmZo3Bp6gRAMIWms/FeKJpfLab2vTD4CEXqGRb/
 wmfoRNtlDecQEXrWHtW/W+isM2p9e40mVbdpxDWs7qiejy6EIDUjXpySVD2NuxBESdLfDd4
 Pp9czyrG+z8GatWr66Dmw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:k9dm2dWlI+w=;X+V+rc4OQJPNZciMEMo6pehR1oN
 UtTEiI8CgsXW4213CZmjTsFwAK4Cr+RmnV5xUrJE31pPoZma8P1KmJIrfCnUWu2DRIZunjon3
 b/e4ZDB7mTWvYnttxJWwnDLzOjoWHfMdkE28oH6fqxTkwNJ3hDlBBBuboMHCrJd9v6e2BnAax
 GQ+0Fa5Bdj2f5Rj+n+KbbQ6EtIsvDoWUYEDojfmTNGYGWywDlDmzor1vZElBAOe3eft5KLIZJ
 LdYzuSL5DFI1QhVQaoEuo8kyyVBcxyae1K2RdDgjR4byi+1CzxQQttiHLO2b9fpw805h7g3S4
 sjzIk7bw7noCnIBKzesvhe/wC9ChHOSbQ3oyGxsKeMimKekJafNLNJ41gy/xfw0Muuw0P9YXk
 E1WKEi9B+Bdf5IegeVycAD5TNqzt/Ha+qkHtfxSRo6ur/QujAJTxU4W97/FT9JWYdV7M3+pKh
 L8MquGH614FZrXI6UPaExOLbJQwywDWTeJImxRO8j3WkJ2EhTI3BNfe1VOYQk67omXvymdu5/
 j19KGHy5ynZuPOEFzm/Ln7+m7faCssbZlgHBPF8Ll3Ze8EYVefyXGB2/7yhnwc0opSpRLK7H7
 kIssTzjdbNv5GcCuG6jniJThYGfdzQ/2IYM+Dyt936nIVHvrW6CKT37oZaDVXP8VA6qafpktB
 pepsWWq8WqbO/aEna0SDg2u5+ckRSk/KdcnVepCzWi1NgSCnLy4C/Ay+MIjsjz8SjRbS9eZUC
 xajiHmhJ1CN9Ub88Z1oP5ocWc4phAWu1FK6+jF4RtAmdZM8/KxqHfQ/o7VcKYmYXpgQFJHzue
 1r1fiIBucW+OdlJ8S/V38jjn3RZRlY5mQFaM+mELxJtTLHul11f7Krqg4L7719jVvgtb9s1k3
 NmJqTx+lYMkRMA4p2shhwyrr1n7Uvvg0gZyfMyOZDWnyRLqYUOQ2JIo1S3m1beZwImjRw39rW
 sqWblw==
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

please pull some fbdev fixes & cleanups for kernel 6.5-rc1.
Includes is a fix for a potential out-of-bound memory access in
fast_imageblit() and the switch of the VIA fbdev driver to use GPIO
descriptors.

Thanks!
Helge

--------------

The following changes since commit 9561de3a55bed6bdd44a12820ba81ec416e705a7:

  Linux 6.4-rc5 (2023-06-04 14:04:27 -0400)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.5-rc1

for you to fetch changes up to c2d22806aecb24e2de55c30a06e5d6eb297d161d:

  fbdev: fix potential OOB read in fast_imageblit() (2023-06-24 21:55:11 +0200)

----------------------------------------------------------------
fbdev fixes for 6.5-rc1:

- fix potential OOB read in fast_imageblit()
- fbdev/media: Use GPIO descriptors for VIA GPIO
- broadsheetfb & metronomefb: Add MODULE_FIRMWARE macro
- omapfb: error handling fix in mipid_spi_probe()
- sh_mobile_lcdcfb, sh7760fb: Typo and warning fixes
- hitfb: code cleanups

----------------------------------------------------------------
Christophe JAILLET (2):
      fbdev: omapfb: lcd_mipid: Fix an error handling path in mipid_spi_probe()
      video/hdmi: Reorder fields in 'struct hdmi_avi_infoframe'

Geert Uytterhoeven (1):
      fbdev: sh_mobile_lcdcfb: Fix ARGB32 overlay format typo

Gustavo A. R. Silva (1):
      fbdev: sh7760fb: Fix -Wimplicit-fallthrough warnings

Juerg Haefliger (2):
      fbdev: metronomefb: Add MODULE_FIRMWARE macro
      fbdev: broadsheetfb: Add MODULE_FIRMWARE macro

Linus Walleij (1):
      fbdev/media: Use GPIO descriptors for VIA GPIO

Lukas Bulwahn (1):
      MAINTAINERS: adjust entry in VIA UNICHROME(PRO)/CHROME9 FRAMEBUFFER DRIVER

Thomas Zimmermann (3):
      fbdev: hitfb: Declare hitfb_blank() as static
      fbdev: hitfb: Fix integer-to-pointer cast
      fbdev: hitfb: Use NULL for pointers

Zhang Shurong (1):
      fbdev: fix potential OOB read in fast_imageblit()

 MAINTAINERS                                        |  1 -
 drivers/media/platform/via/via-camera.c            | 51 +++++++++-------------
 drivers/video/fbdev/broadsheetfb.c                 |  2 +
 drivers/video/fbdev/core/sysimgblt.c               |  2 +-
 drivers/video/fbdev/hitfb.c                        |  8 ++--
 drivers/video/fbdev/metronomefb.c                  |  2 +
 drivers/video/fbdev/omap/lcd_mipid.c               |  6 ++-
 drivers/video/fbdev/sh7760fb.c                     |  2 +
 drivers/video/fbdev/sh_mobile_lcdcfb.c             |  2 +-
 drivers/video/fbdev/via/via-core.c                 |  2 +-
 drivers/video/fbdev/via/via-gpio.c                 | 28 ++++++------
 .../linux => drivers/video/fbdev/via}/via-gpio.h   |  1 -
 include/linux/hdmi.h                               |  4 +-
 13 files changed, 54 insertions(+), 57 deletions(-)
 rename {include/linux => drivers/video/fbdev/via}/via-gpio.h (84%)
