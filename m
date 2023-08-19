Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D94DF781A5B
	for <lists+dri-devel@lfdr.de>; Sat, 19 Aug 2023 17:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FE910E025;
	Sat, 19 Aug 2023 15:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8B110E025
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Aug 2023 15:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1692458922; x=1693063722; i=deller@gmx.de;
 bh=GRhMdDZNp3zW4FxJHaNo2GmRxhT3B7zEJwqADRAFfVg=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=rlw8ytj9Da5zSHn9v0Kjb7C75K+seKOzWcUfgPYNvIndiOMA4/jLZaR8I33IPlcDIdI7F1g
 uNlqnfR3i2AD+6FZP37iqYPIO6hKHAhkYhJ4kXXLvXD9WnMqXsreOawiSCdgxUhFTS+RSpYB0
 yWLB9yvL0mTA6bxP793Myt7r8VM3CyjyIX/uaTyqVlOPpynQk+ECCRq96SBQ+LP6+c/pwTzZ+
 8LQPKEL4De+fY56pLqTaFzIq4I6rOHPrRqLf6s2Mm8d6sbnaAVrtJF0OhUgkwG6liWqq5lcpX
 HTe51pZ6TKRZBIX1lZvJAlBO9PFEyPvSvUqvcRzClEbZNDJy5Uaw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ls3530 ([94.134.154.181]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N33Il-1pbB0p0cgf-013KU5; Sat, 19
 Aug 2023 17:28:42 +0200
Date: Sat, 19 Aug 2023 17:28:40 +0200
From: Helge Deller <deller@gmx.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev fixes and cleanups for v6.5-rc7
Message-ID: <ZODfqGYs/M1xvIJ8@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pKs7SJVGe9ugwZ/dOlqAYRFGkUafB0lJnYYxWvxV9XIFDAsQh3z
 Y0xHT3nbUU7Rbdmy/V5CwraQcBpVso83EyWzbsAcIPLUUNJZ6ZdyItw+y7Z1aIiSDNQEb6c
 wsIJubMOv5BkrUa6F+jUIEf7sohU18ARXoxFihfUJ1azSO1R+xB8NUKCtlr2KBjrYYXC4QS
 /iYlTwGKGte5YrjKVqnbg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yrYXlY6oIb0=;4AnfTikvFab7mqgB0esy7e/Txpe
 fq7Vrut2cUueAcSpTpRg0QKAXmAuzCPjPtfaHTyB65Tfc1yNhVA1xuG+YRoNgeL8SIKX0Dipo
 SFNapE83XQYCh6xzdCqCJCvJ8Kz4l0pN/1Y6h7xxgdLwnK0xaNeXW2hkkRLWH2t9Tk8s/Uqml
 mtryBan86tBsMxGE66IwR3F3ZDFqkg4AAZuWGVNOCy+mz4q9Nkz7Jx3ti4/B1NWq0MISmXR6J
 sleb73R5TPdz/8CT4mblJ2ZB3egZnqVKE8LUUHD5jAv8Vdih+5QZoUsXYa7hAANBqjk514cmB
 6m9hVzo7BzTtDHYVGESWzEajGxFrrcXjRdiA5b0tYvT0M5/TeI+CY+JR63uVhXshix6e4ETgl
 sUQ7Rh+6o0yOGuBFz18INP6pz4p2BCHVsMsvyngNSt5jY5CXiW/GLm0/AHlLYVgmvLsNWv0ea
 hk7LDULvb22PjMbtQRBU2NNdB12kULWYUzUZQ561apdhjVk2a3Dtk1lA6W6SnQ0T8WGaHAYGS
 4BY90qSoxCc0p4sj9HbN3PeAOFIDuP64iUYPSceE02c7OFpW8T+0OdbJtyPAqfa7HVp5aTVKY
 wMl7ttudIxgrMjzQJL3t3xK7eRacnnRDBwh0e7No9yoULG1bQF0Zo57IjK1ATGK1YrELZHju5
 2L7yaj9aCtu/wwGjPRWFGkJjY/+Ym0TA3DQbuhyTltoaF8BiPdNwewIYzwFrwlNrWAoSgt8Qv
 lqTIn5QLYPjxuic3Abq2kuB1LCqyF4k/gGpyu6fwdsveijYz+SBDOBor6NyjRYzyJ7RoQhzV9
 4hlkGjawSK0ls5UFdojKdutKgG10I+ypbOlqrQT72p/CcXM30mhtadDZe170kj7BwyNlTGhpE
 tLdjDl8jhvxpx4DTsGG/lptJwe84TXSsbSKxQD0tlkr62H8Pxk70dLX0mN32ShOzbhC/a++WU
 +MUtkFGJbInmyMed0idvvuD3SgY=
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

please pull some small fbdev fixes & cleanups for kernel 6.5-rc7.

Various code cleanups in amifb, atmel_lcdfb, ssd1307fb, kyro and goldfishf=
b.

Thanks!
Helge

=2D-------------

The following changes since commit 5d0c230f1de8c7515b6567d9afba1f196fb4e2f=
4:

  Linux 6.5-rc4 (2023-07-30 13:23:47 -0700)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git ta=
gs/fbdev-for-6.5-rc7

for you to fetch changes up to 0650d5098f8b6b232cd5ea0e15437fc38f7d63ba:

  fbdev: goldfishfb: Do not check 0 for platform_get_irq() (2023-08-15 23:=
39:33 +0200)

=2D---------------------------------------------------------------
fbdev fixes and cleanups for 6.5-rc7:

- various code cleanups in amifb, atmel_lcdfb, ssd1307fb, kyro and goldfis=
hfb

=2D---------------------------------------------------------------
Atul Raut (1):
      fbdev: amifb: Replace zero-length arrays with DECLARE_FLEX_ARRAY() h=
elper

Ruan Jinjie (1):
      fbdev: atmel_lcdfb: Remove redundant of_match_ptr()

Uwe Kleine-K=F6nig (1):
      fbdev: ssd1307fb: Print the PWM's label instead of its number

Yuanjun Gong (1):
      fbdev: mmp: fix value check in mmphw_probe()

Yue Haibing (1):
      fbdev: kyro: Remove unused declarations

Zhu Wang (1):
      fbdev: goldfishfb: Do not check 0 for platform_get_irq()

 drivers/video/fbdev/amifb.c           |  2 +-
 drivers/video/fbdev/atmel_lcdfb.c     |  2 +-
 drivers/video/fbdev/goldfishfb.c      |  4 ++--
 drivers/video/fbdev/mmp/hw/mmp_ctrl.c |  4 +++-
 drivers/video/fbdev/ssd1307fb.c       |  4 ++--
 include/video/kyro.h                  | 12 ------------
 6 files changed, 9 insertions(+), 19 deletions(-)
