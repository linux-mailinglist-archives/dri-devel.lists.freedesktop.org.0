Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CA358B81C
	for <lists+dri-devel@lfdr.de>; Sat,  6 Aug 2022 22:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C0A10EF38;
	Sat,  6 Aug 2022 20:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BFA910EC22
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Aug 2022 20:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1659816462;
 bh=JttCySagazOt1SPXCXmT9G72op/evmxRiYdJphWoCNE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=JPPs5R97yZLhiCJoHhnWY3uIOMYdlnAKnWpVXOwCdRQkE/RP3H1dwCmBW3WD76/0s
 +wyEyFl3JlRhKbYqq5Cu4OwrWUY1T35LyesAEogLq5L2JhLltJKipdnDqigHzl5scI
 pZou6A3zUAYz7U345WsuQH8WhCcHZ2zsXNkXXsPY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.170.46]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRTNF-1o6LkJ0ZeP-00NVC9; Sat, 06
 Aug 2022 22:07:42 +0200
Date: Sat, 6 Aug 2022 22:06:49 +0200
From: Helge Deller <deller@gmx.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev updates & fixes for v5.20-rc1
Message-ID: <Yu7J2Yj6UyAiE2Ne@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7s9Da4UCIDfa/Q9sjHw2hJhx20+r87Q8QQJKmc8kJezq0A+t6L2
 EtdvQlNtQkcIh+Th10pNNuPWrQDCtlSJdB/mdgrZHT+PSsRjnzEc8wk17NINIeahY90FMj6
 Tpv4tJUTVHpPVRG1gZsfilGKJWCN3aEm1WcRbwLMd89Fix1ccaPcNKem31BohLWQj8suudC
 Y5+b8pD/7A+iX0Q6bU6lA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9j0S/gy0o4w=:Q2TIczuQTWp3wJpyKPSxFN
 kduprlC31bdB30wYEBQ7NBx6S8/Lqcf/CjdjhOtxHNCR9mc45M95GSsu7ohhei7w+CzQV4lbg
 heiA/Ed1R9bYx3NqIusvKxW8SzFlPqkwRtpwpA52TNGgJJqBFFvHeAmMvbNiwK4vgEhq7/HpC
 wqIfq26V/4WqVuAspdXJyZZcJANkrwiyoLReT/9OMRvboEh01i/9r7qgxFSPkBwfAmCBpaC2Z
 CyI7mrHU5saTdnifqDpwnY1W5MsU3y/xDcCTS09AQRph6xBnCCwnHlO50TkaRxuUFwFBPvNXj
 yZBaI0vX3uEhBAF5gv2sG74j4Z4Yx0xm1jQiI5Iy/mqRA+w8rdXhffQSgOKnqcAVzhwcP4Uz7
 r7egN7oqMCiiwqSX9nW1ICK1EkvbNCqumFa/XOMeXzZkfN/YcL9barfQOnHQ5ZjGHDi6Jy6mF
 NuxEjoJERfCgeRSDmbK0m3Jy9pjj0wzc+oXyZrqIjp5fBHnMu5BvHotNLItJi1afRN3Dpa7dv
 bDWL3m8JeDjsLmfs1YDo3K9i1lYKplyXArW/8BclwNNb5H2LCwgjUqOnW2k9mTSLYeo8t3lbM
 xakuQdjVrHEMwpdHznpo9pGlgf/CmC0OqyOxrtTzqShCinlkIQa+wZcZgVb31dKmG7mgo9HYH
 TbjEBjx/ZHPU6qzw7eqMh+t/0kGVnaYtG4+hyqhSuIKN+10B+Yr3qgrSySMU+4lnCZfBHyKJF
 PK4EV6x/0NHe8Oj0AM2FL++fGbbYnKUhU20XPdwg1eLJrQvhNDZhwKOqlWLH7H5Pc9EqPt7UU
 cYaUIelZHwQPDUAPFpqTPYHp7wRPFW9jqizY+URsvgCkbBbM+ZWCzPfLb1Y9ftn/v6QHgnDEP
 djCgl8RvgzBtbAgco6G3GpZvrdDjVjAzVin2sINp32y5OXxc0M4qwZN7WqTHSoRLWCWpzVAAa
 gQgow8lvZ/o+4ErllCG0xUIc3jTD4+jgJoSYsK0wJ6emEUaoN6d4N6kNlG2qTjw0tKJNiJBrF
 0iSOw9MiDzZDoS5btqXKOP5+5VXvYm0o66UYpIj7yjpez9ZOBSrwLjsVFn5XcmKEf3PvNLQGW
 16qc+m9uvre66w5aXAlBAqn+jX7wW6nd3AmwRYavsFmIZlOH0Ub5FAPfg==
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
Cc: Zheyu Ma <zheyuma97@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The following changes since commit ff6992735ade75aae3e35d16b17da1008d753d2=
8:

  Linux 5.19-rc7 (2022-07-17 13:30:22 -0700)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git ta=
gs/for-5.20/fbdev-1

for you to fetch changes up to 6ba592fa014f21f35a8ee8da4ca7b95a018f13e8:

  video: fbdev: s3fb: Check the size of screen before memset_io() (2022-08=
-05 18:44:59 +0200)

=2D---------------------------------------------------------------
fbdev fixes and updates for kernel v5.20-rc1

The two major changes in this patchset corrects VGA modes, color
handling and various other smaller fixes in the Atari framebuffer (by
Geert Uytterhoeven), and devm_* conversion, platform data fixes and
header cleanups in the imxfb driver (by Uwe Kleine-K=F6nig).

Other small patches clean up code in sa1100fb, cirrusfb and omapfb,
fix a refcount leak in amba-clcd (by Liang He), and adds parameter
checks to arkfb, i740fb, vt8623fb and s3fb (by Zheyu Ma).

=2D---------------------------------------------------------------
Geert Uytterhoeven (14):
      video: fbdev: amiga: Simplify amifb_pan_display()
      video: fbdev: sa1100fb: Remove unused sa1100fb_setup()
      video: fbdev: cirrusfb: Make cirrusfb_zorro_unregister() static
      video: fbdev: Make *fb_setup() and *fb_init() static
      video: fbdev: atari: Simplify atafb_pan_display()
      video: fbdev: atari: Remove bogus FB_VMODE_YWRAP flags
      video: fbdev: atari: Fix inverse handling
      video: fbdev: atari: Fix ext_setcolreg()
      video: fbdev: atari: Remove unneeded casts from void *
      video: fbdev: atari: Remove unneeded casts to void *
      video: fbdev: atari: Fix TT High video mode vertical refresh
      video: fbdev: atari: Fix VGA modes
      video: fbdev: atari: Remove unused definitions and variables
      video: fbdev: atari: Remove backward bug-compatibility

Helge Deller (1):
      video: fbdev: omapfb: Unexport omap*_update_window_async()

Liang He (1):
      video: fbdev: amba-clcd: Fix refcount leak bugs

Rustam Subkhankulov (1):
      video: fbdev: sis: fix typos in SiS_GetModeID()

Uwe Kleine-K=F6nig (4):
      video: fbdev: imxfb: Drop platform data support
      video: fbdev: imxfb: Drop unused symbols from header
      video: fbdev: imxfb: Fold <linux/platform_data/video-imxfb.h> into o=
nly user
      video: fbdev: imxfb: Convert request_mem_region + ioremap to devm_io=
remap_resource

Yang Yingliang (1):
      video: fbdev: imxfb: fix return value check in imxfb_probe()

Zheyu Ma (5):
      video: fbdev: arkfb: Fix a divide-by-zero bug in ark_set_pixclock()
      video: fbdev: i740fb: Check the argument of i740_calc_vclk()
      video: fbdev: vt8623fb: Check the size of screen before memset_io()
      video: fbdev: arkfb: Check the size of screen before memset_io()
      video: fbdev: s3fb: Check the size of screen before memset_io()

 Documentation/m68k/kernel-options.rst     |   4 +-
 MAINTAINERS                               |   1 -
 drivers/video/fbdev/68328fb.c             |   7 +-
 drivers/video/fbdev/amba-clcd.c           |  24 ++++--
 drivers/video/fbdev/amifb.c               |  15 +---
 drivers/video/fbdev/arkfb.c               |   9 +-
 drivers/video/fbdev/atafb.c               | 103 +++++++----------------
 drivers/video/fbdev/cirrusfb.c            |   2 +-
 drivers/video/fbdev/dnfb.c                |   2 +-
 drivers/video/fbdev/fm2fb.c               |   4 +-
 drivers/video/fbdev/hpfb.c                |   4 +-
 drivers/video/fbdev/i740fb.c              |   9 +-
 drivers/video/fbdev/imxfb.c               | 134 +++++++++++--------------=
-----
 drivers/video/fbdev/omap/hwa742.c         |   3 +-
 drivers/video/fbdev/omap/omapfb.h         |   9 --
 drivers/video/fbdev/omap/omapfb_main.c    |   3 +-
 drivers/video/fbdev/q40fb.c               |   2 +-
 drivers/video/fbdev/s3fb.c                |   2 +
 drivers/video/fbdev/sa1100fb.c            |  41 ---------
 drivers/video/fbdev/sis/init.c            |   4 +-
 drivers/video/fbdev/skeletonfb.c          |   6 +-
 drivers/video/fbdev/valkyriefb.c          |  10 +--
 drivers/video/fbdev/vt8623fb.c            |   2 +
 include/linux/platform_data/video-imxfb.h |  70 ----------------
 24 files changed, 136 insertions(+), 334 deletions(-)
 delete mode 100644 include/linux/platform_data/video-imxfb.h
