Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8068855B28A
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 17:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E2710FC0D;
	Sun, 26 Jun 2022 15:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5725810FC0D
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 15:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656255712;
 bh=ftgVeWzfGVCOg8nwy7vb1fPm3ULzmc+V9gtVCzTW6vk=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=IWUX/NZe6Mno98OQlGS18Q9qM8TUU+6gF9cItdeBfZMOueYOXx4LU7gEdBPfUgX+C
 8MjnN2XkAhkYhZPAYwbCWcGSQKG7Wdax8lFM0uEvXjqRrm0knaV6sSEW4sgV/KBXkk
 swzVUfUd+5LjnWoQrkHcOEsoNgSJQaT4Uodr9uEk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.135.166]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0XCw-1nkcvb3xX2-00wU70; Sun, 26
 Jun 2022 17:01:52 +0200
Date: Sun, 26 Jun 2022 17:01:24 +0200
From: Helge Deller <deller@gmx.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev updates & fixes for v5.19-rc4
Message-ID: <Yrh0xOWBC1+kohed@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:6VBIh6osSUIaLBHUeqIlKoeMgGM8sIjeq3vhJ53SV1rJZPtlrB3
 CETz4mPI1DpmRp6Nnj4Ls/wPAx6+ide0ItzprLfDo7qAYyXL7NOmQOUpnNi6e34S2yjSnnm
 4rkq5Yec6+HfoVX+v69gXluELO8vP50bv2OZ87IsON2pKCFrK6+bnYLVoscCxa2eiJqozDc
 Hg1FN5Ny3mYpGHKPqNCOQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kEGIwBNkdOU=:kQJskTD9VXo1QzyxmFQpdy
 YMMM3S4vsJavgH0yzQ0uP2pcQrL26W/puNXsLa32GjBiqcA9nC/AkRyS3Zu5sx3/Hhq3DHGQL
 Lw5qFYnB2dNe+Bn9BirskodXdJxlHJciOucy7L52CgvZXeN+BGpZRWd1quhP+zTuSYr2Gudvt
 cfrnBtKulo+Q5nidMWcYKVaPs+SOh62BcOkSq5AYjfJFk53wuwOkciJnBLatriE5GNlUH/PjJ
 +PMjJdDu5y6YL1NThgnyaoLWEm5mAMWQxdCWYZU64J3iMRNQrzIapjBiVQJLJpbREh1vETzsO
 Ln6O+AxGqBUIx8qe5qMIp0dNXTWodn5pRESWphuD5/Atr1Ep6HjgX7Hf/rLwAIEWz8RKxXCsG
 hLFes7u9WFsAP/yOdMWPJS+YVEwe5xvKhnIf8fqOtiiNoAIGKqyfjEYk8ck25R2NoZmcus6Pp
 7kCEhYnBJYQgy/Y3CAW4GTgPDy+PgtE6eD57HjWUvkVZJZyAKBO2vpkn58Yn+/2z+i0vi+WVu
 EzrZGQ6sJ3jsodVnldFK8UXXt4eKXHTbIOLkKcu/8IDd0hh9xRPX/81xrjYFdgNTUCcHJEbU5
 l7LnzcVAi17Qyo8KLOcIMZMx39QDcvCOYetN7vayoqKTcIuIR78b5yD6r8JsF4Q5BmkcJlUBe
 1Y368QkLFSqvvjOwfHnd1OE/BFaDsZXqR7SSfuSEUVYMWODwDkkCtljGlI15s3DNtMy+ztS8P
 Wwmu2k9UdQ/4YtmIk2BpyMrxbe66BJ4d226goLu0SUPVRVlcteKdfzOZO3RBasLfjlgJp66rx
 W41tUDxbFWNwjMG19/jXBsajVPzyHwzXyK8WAW7OIvlbKRg50kpQ6ldeSEPPoDoexo24xbytE
 5+z3FFlC+00zZ99+1DKrjIW9J4DCYSUpDSy+FOtpQDpYvcw7mvMmgveLE0d0aimt9zhYTwy54
 l7EHdkXJyNTnI813NSQ0SGajBz6djGyXRKZV6CZNMcXrpoYq8Rkx3CfY5c/rXjnSCpcCK2ckH
 ukP2fMNqU1M7cygO7PSDzJyZ1RI9LRWpKkc8YndXtAoXmZn7juFepE+LnFXkwL9mFBhF1p11/
 BdH/pqHbfTgPLZk/gy3w+An37/mSTLV+H8yp95zZbY1/HT0raW0vXzFUw==
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

The following changes since commit a111daf0c53ae91e71fd2bfe7497862d14132e3e:

  Linux 5.19-rc3 (2022-06-19 15:06:47 -0500)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/for-5.19/fbdev-2

for you to fetch changes up to cb5177336ecb07fe1c6804306fe8efc827643c64:

  video: fbdev: omap: Remove duplicate 'the' in comment (2022-06-22 16:55:51 +0200)

----------------------------------------------------------------
fbdev fixes and updates for kernel v5.19-rc4:

Two bug fixes for the pxa3xx and intelfb drivers:
- pxa3xx-gcu: Fix integer overflow in pxa3xx_gcu_write
- intelfb: Initialize value of stolen size

The other changes are small cleanups, simplifications and documentation
updates to the cirrusfb, skeletonfb, omapfb, intelfb, au1100fb and
simplefb drivers.

----------------------------------------------------------------
Bjorn Helgaas (2):
      video: fbdev: cirrusfb: Remove useless reference to PCI power management
      video: fbdev: skeletonfb: Convert to generic power management

Hyunwoo Kim (1):
      video: fbdev: pxa3xx-gcu: Fix integer overflow in pxa3xx_gcu_write

Jiang Jian (2):
      video: fbdev: omapfb: Align '*' in comment
      video: fbdev: omap: Remove duplicate 'the' in comment

Petr Cvek (2):
      video: fbdev: intelfb: Use aperture size from pci_resource_len
      video: fbdev: intelfb: Initialize value of stolen size

Xiang wangx (1):
      video: fbdev: skeletonfb: Fix syntax errors in comments

Yihao Han (2):
      video: fbdev: au1100fb: Drop unnecessary NULL ptr check
      video: fbdev: simplefb: Check before clk_put() not needed

 drivers/video/fbdev/au1100fb.c                  |  6 ++----
 drivers/video/fbdev/cirrusfb.c                  |  6 ------
 drivers/video/fbdev/intelfb/intelfbdrv.c        |  4 ++--
 drivers/video/fbdev/intelfb/intelfbhw.c         | 12 +++++-------
 drivers/video/fbdev/omap/sossi.c                |  2 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi_phy.c |  2 +-
 drivers/video/fbdev/pxa3xx-gcu.c                |  2 +-
 drivers/video/fbdev/simplefb.c                  |  3 +--
 drivers/video/fbdev/skeletonfb.c                | 15 ++++++++-------
 9 files changed, 21 insertions(+), 31 deletions(-)
