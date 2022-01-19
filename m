Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE8D493B68
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 14:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A3110E12D;
	Wed, 19 Jan 2022 13:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E8F10E12D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 13:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642600144;
 bh=jxwlRtLaSGT/yTdV+f+Hstct/Vl6fLs6Dlkqm8HpcKc=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=I4IxZqKw+3tintR8T0auB0tAjMkCnksjQPYRHFjzO8UJI3eph3KUSAGNlVaGww9fs
 7QO/TkGGPPSg0yqFB3BRchd8xq7M9ZwepDeIz8zkzsFMkU9fRbRSoZkcBz+QblCqmD
 0v5Uc1EM6m9QbH2EsCVAGaNI1LUVPZdujdESVgYw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.183.52]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMofW-1mtkNY0Nj2-00Io9G; Wed, 19
 Jan 2022 14:49:04 +0100
Date: Wed, 19 Jan 2022 14:47:57 +0100
From: Helge Deller <deller@gmx.de>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: heads-up for fbdev pull request
Message-ID: <YegWjWSF/Pg+r4PH@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OqYKRYkEigh3meraLXbMuoTVA5gJrQjl1sd3f7KbN0ArOsSdxik
 TU3XOwG43SycA54x2ZypKuzdFfudgM1Ny0Yjm8jzwF0/wIuGHUswvRJauYqwECS/XlDD8h5
 x3JXbRMoB5+CcntCZGOS6uw0nAP9m+5SbO71WlNh7gR9STVm0vOhilY8Jq4yeSp08KFzkz9
 hrMyh/FFbteDugnakyyEQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WCkUaVBvYfY=:PtYNoI9RhT9DrSKTgRQ5s4
 TquRCs8Vg7fdhrsRacyY+jb0xRb/tlxHz3uG5K7uM5ukrqSiNq+HIZt3eokd6NXzSLMM3r3eM
 UVIpdb4aoXu1kuK3vhoG5DJH4GBRom27qA6+tSm4EEAc77+/8UmJ1IKSRlL8KR/ePREan0KEH
 KCu/eOZoQq83FsLaxJUM2r/5UQ3RfHoGD+IxCCQZ1ffIxR+8soNEBcIorcz8egzgUEU5CFiUJ
 hTzy1vivgk1+g7cFCd4kcmnVkfJvIYEp98vJF/31i+lfZtElAUWIi379RB5lqFMakEWowPwxs
 38xb00MTMzywhz2B7oepG/+M73R8CHx+NBrDym/hpILy8LByF5WLs0G5TzA5XyLvxHK1oTlI9
 bke2V5+ciyvlaCZ1kkhjXPqpijJ+eYwFRJfvBNY1qfXR1kEoQlzvgzjYDkoNT/qa07Ey5hMK2
 d6tG8+xFajOIGCBsSBPSaM506JbQT3Ao3pW+wXabIIltWMrgqkahNCvM51m/H26RH04PdnIeZ
 r11vBbvOudRi2LF/0Ky5RmqIOHA6tZcI9yco9TRu2KQ41HFcgmMZFPoX+BIXJnHp0+toM/Au0
 6uDVAbTlJQnvvACS17fEtVRT67re0GKbs2+17y2ns2TR9h2p1XMxfolW1LW4Sg7xGHpIBnTDf
 vJEz0LbAK347sNgrV/SITM0Uw5mQIvkVBNTtxMp/D4de1aJJeqJno+hLAfMACkC75DFasXFU7
 5mKxdgMoUq+f4vUtpShW00rLY01d+rTdfZEzShVkPl2W2B/XYH8h+dEa1+ShuBzEq6rpxIBjH
 EztoBbbGUPWwKwOBW2h6trbTJ6blyzKabY3gPE8+khX2kUoQXixohaWg/6St+EzaXNeOBcwe6
 Ws+YJcBIF/Oek859WXXezlt5rqyWVhDR5wP8NHafLjaqyd4RR72rtA601SPN1k1EqinL20t4K
 UVWserK0JoV66CjsSpde1EOcRwBgPUn7QnEdOV/vaGVtrEfD5TlOpARs6ROC0fwq6rGOCWmOt
 0RKblA4yFqBtqaQ26x1mKoGg28mswVe1bf+CY9OBKOwlscUV83pwoDr8PHg2kyBFRhR9iODF2
 ojd+vWKV+6j9Yk=
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

This is just a heads-up, that I'm planning to send a pull request for
fbdev fixes to Linus later today.

Nothing really important - just fixes for various fbdev drivers.

It has been a few days in for-next and no DRM parts are touched.

Changelog is below, and it can be pulled from:
http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags=
/fbdev-5.17-2

Helge

=2D---------------------------------------------------------------
Chunyang Zhong (1):
      video: ocfb: add const to of_device_id=A0

Colin Ian King (2):
      fbdev: aty128fb: make some arrays static const
      video: fbdev: mb862xx: remove redundant assignment to pointer ptr

Greg Kroah-Hartman (1):
      omapfb: use default_groups in kobj_type

Jiasheng Jiang (1):
      video: fbdev: Check for null res pointer

Luca Weiss (2):
      backlight: qcom-wled: Add PM6150L compatible
      dt-bindings: simple-framebuffer: allow standalone compatible

Michael Kelley (1):
      video: hyperv_fb: Fix validation of screen resolution

Minghao Chi (1):
      drivers/video: remove redundant res variable

Xu Wang (2):
      backlight: lm3630a_bl: Remove redundant 'flush_workqueue()' calls
      fbdev: omap2: omapfb: Remove redundant 'flush_workqueue()' calls

Yang Guang (1):
      video: fbdev: use swap() to make code cleaner

YueHaibing (1):
      video: fbdev: controlfb: Fix COMPILE_TEST build

Z. Liu (1):
      matroxfb: set maxvram of vbG200eW to the same as vbG200 to avoid bla=
ck screen

 .../devicetree/bindings/display/simple-framebuffer.yaml  | 12 +++++++----=
-
 drivers/video/backlight/lm3630a_bl.c                     |  1 -
 drivers/video/backlight/qcom-wled.c                      |  1 +
 drivers/video/fbdev/aty/aty128fb.c                       | 10 ++++++----
 drivers/video/fbdev/aty/mach64_ct.c                      |  4 +---
 drivers/video/fbdev/controlfb.c                          |  2 ++
 drivers/video/fbdev/hyperv_fb.c                          | 16 +++--------=
-----
 drivers/video/fbdev/imxfb.c                              |  2 ++
 drivers/video/fbdev/matrox/matroxfb_base.c               |  2 +-
 drivers/video/fbdev/mb862xx/mb862xxfb_accel.c            |  2 +-
 drivers/video/fbdev/ocfb.c                               |  2 +-
 drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c     |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c     |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c     |  3 ++-
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c           |  1 -
 drivers/video/fbdev/sis/sis_main.c                       |  2 +-
 16 files changed, 32 insertions(+), 34 deletions(-)


