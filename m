Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F374F612BBC
	for <lists+dri-devel@lfdr.de>; Sun, 30 Oct 2022 18:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22D510E037;
	Sun, 30 Oct 2022 17:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4FF10E037
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Oct 2022 17:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1667149712; bh=m4+6ruVR07s7ahZkS8XH9ta3361SFT/cMmEre0wtO4Q=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=nwme34/PQphufO6arOpO1RFSpLZTRYYYP+yHO3pnBdr7BOcY78Be2kRNR17AWUMOt
 vQzD6DJHEyg4KcUcvpHOMCjcorwe2tKfmovjFvKjGAeo1aNRFECG3AR/mdnQfD1qSk
 B0w4Puz9pFX0WCzXjhffuFqzEyqScYocSrS3JYilqXWRx6Wb3g7Tb6OnLpeUlnTpTe
 5a+/Wq04kOmM80Bjx2ZDhO+a1urin+raFo4I/0/nzadE8hBuhk6w17lg6MQFVKBu0E
 GbmqxasHB0H48n+M6lxiWmw2V1SGmNxXyQ0hY1Jpn2OCDydxZjq061nOi5ND0HtS5Z
 kl7O+MO4j/D7A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ls3530 ([92.116.163.166]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MI5UN-1osBoW3qIZ-00F987; Sun, 30
 Oct 2022 18:08:31 +0100
Date: Sun, 30 Oct 2022 18:08:30 +0100
From: Helge Deller <deller@gmx.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev fixes for v6.1-rc3
Message-ID: <Y16vjgbo+tx6lArZ@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jCjYSj1BZAZ5SxO9ltnwsWqzczM/AH9+S83AxuNMi71su5IdZN4
 xuJDav/NR9ZyJnfaTjxJOU4uowFyzVh92a3WSwBydwL/ikoUhmiddW7JZQDNPnbR3jLBsgr
 wbnRNfb0ShSUeT358i4sFyBXGzOyRQss1ZyZ6R7NCn78WDvdru9pHpspydngafOEt8YP5Eq
 RiG0qlkDsjmq8lvhQvTsQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gthlOzLTdcU=;n6pwRJu2pJhizL1XuN0OfVxFpKJ
 SVMC5RNkfusC4aY7E4708OzEmGDBrF0BW7jlaIhNzAkx46ruSzcNgOvXLIrtNSrDcr85+ePrl
 xTzsWbZZ8We/DG3zRBlCnSPLsqlY1Qx7XLjeLJgBnJbUw0/PkIJW0YfYR6NkuSbzpc2xC/u75
 fe6t6f3EpnDpCUSxkZdEsv7gQMnzRPxn6ATXtbsTh/IIETc2/39VVCLJeFyyT0ZZp+TiYl9It
 1eVTRV6zJC3Z+7qZT9/NCtVf5hoNumeN6/++Ym/WCkPiQvysX+CfdR+z+yHFtd9WgA8OGUe9J
 sZpWu8BIFnnxRX1CafHoIKjHENiqJRHPA83RRIOq9v3ITp9haPLaND8M8BOyrPjhkHD0HrWLF
 x6HrjBzjCykh00UZxxYZx2Qb3UuyT6oofVswBeavW5+hbScYbWpCrV6hjnAOX0DWooYy4rTFQ
 YUNWWM7RV8ctPobiFcKL0roM2PvNzn/W3gDNBCguP011n57EMbvXi1OGZY9Br0jYKkQUzZNih
 zAYLa5LHiVd78OCqXjEiIlnuPWeJ1v0fun6ySDsiZN38SpMoWV1vHZNbuH83U3BoEomzuUxBG
 ALsfKj0WVw3AoGxXxDAk0GeZf/9BR5IWRZntl9+Gw1tJqLBXEulIIaS2266BibwAqAzaOQdK2
 KeCtxB7lZDywEkGKz7p7k9sPx/xO3Mf4+kEZcptIPT9EmfPfAgzJg43oT6QNrL+jFN1PK9KQu
 LuwjqYQiLgl3XwYvNyLypjVCpQkRgB1RwL9xNioWTzFaq7MkxEIemKSjxCA9NlX+ix5QXNsoE
 XSuP6jF4FjW2ICwm4bgQ2tDfdpbZ6ICGIJuwMdLI/lxrfMwCzWCo4WXBuhyevRvI3Qv1JBpbJ
 SLzZoDEhEWt7NGiAqA3xjBrYKN601ASocUhF2PbkcIDzRwaPFSchcXdwnf9XwXoB+lNVJ+k2u
 lCaN1Q==
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

please pull some fbdev fixes for kernel 6.1-rc3.

A use-after-free bugfix in the smscufx driver.
The other patches are minor.

Thanks,
Helge

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc78=
0:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git ta=
gs/fbdev-for-6.1-rc3

for you to fetch changes up to 3c6bf6bddc84888c0ce163b09dee0ddd23b5172a:

  fbdev: cyber2000fb: fix missing pci_disable_device() (2022-10-27 20:29:5=
9 +0200)

=2D---------------------------------------------------------------
fbdev fixes for kernel 6.1-rc3:

A use-after-free bugfix in the smscufx driver and various minor
error path fixes, smaller build fixes, sysfs fixes and
typos in comments in the stifb, sisfb, da8xxfb, xilinxfb, sm501fb,
gbefb and cyber2000fb drivers.

=2D---------------------------------------------------------------
Helge Deller (1):
      fbdev: stifb: Fall back to cfb_fillrect() on 32-bit HCRX cards

Hyunwoo Kim (1):
      fbdev: smscufx: Fix several use-after-free bugs

Jason A. Donenfeld (1):
      fbdev: sisfb: use explicitly signed char

Jilin Yuan (1):
      fbdev: sisfb: fix repeated word in comment

Kees Cook (1):
      fbdev: MIPS supports iomem addresses

Uwe Kleine-K=F6nig (2):
      fbdev: da8xx-fb: Fix error handling in .remove()
      fbdev: xilinxfb: Make xilinxfb_release() return void

Xuezhi Zhang (2):
      fbdev: sm501fb: Convert sysfs snprintf to sysfs_emit
      fbdev: gbefb: Convert sysfs snprintf to sysfs_emit

Yang Yingliang (1):
      fbdev: cyber2000fb: fix missing pci_disable_device()

 drivers/usb/misc/sisusbvga/sisusb_struct.h |  2 +-
 drivers/video/fbdev/cyber2000fb.c          |  2 ++
 drivers/video/fbdev/da8xx-fb.c             |  3 +-
 drivers/video/fbdev/gbefb.c                |  4 +--
 drivers/video/fbdev/sis/sis_accel.c        |  2 +-
 drivers/video/fbdev/sis/vstruct.h          |  2 +-
 drivers/video/fbdev/sm501fb.c              |  2 +-
 drivers/video/fbdev/smscufx.c              | 55 ++++++++++++++++---------=
-----
 drivers/video/fbdev/stifb.c                |  3 +-
 drivers/video/fbdev/xilinxfb.c             |  8 ++---
 include/linux/fb.h                         |  2 +-
 11 files changed, 47 insertions(+), 38 deletions(-)
