Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048B268AF0C
	for <lists+dri-devel@lfdr.de>; Sun,  5 Feb 2023 10:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129B510E06D;
	Sun,  5 Feb 2023 09:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863A810E06D
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Feb 2023 09:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1675590265; bh=UR5JiAGIMlz6X9Cdqq2wgkG8j96lA/E+jMDdXd5wrgE=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=aCK9loipCDe9ngykteluEaVvtnnPDBBOukftp5/iUGpshlcU0+CRJiAJETCrAFjy+
 RBRrqUiw0XrJgD5NBRbNGxOI84+w54h9jWx+Qt1BPRjyqdH/mj7wWnD5BjWITX9mmT
 Yt2CGmMXmyZQW1kCZytHi7+JOwsRV1fOHsp1FtykEvZvaEg12JXqsJDVItME1iTcAq
 37dUNcUaDZeD3H3TiXtAyTa6r/LmYreP5UOcZk6TiQdIGYfC987tnFJS/jQNHbG83h
 8HFR1mt4KomCXRbakoef9dT3thkMQaiEa2pQJaPf/C1M9YzFzgoI0JtrqjGiivQvnd
 VvEAe2S81E3sw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ls3530 ([92.116.173.244]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1ML9uK-1p6Nvn0tco-00I9my; Sun, 05
 Feb 2023 10:44:25 +0100
Date: Sun, 5 Feb 2023 10:44:23 +0100
From: Helge Deller <deller@gmx.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev fixes for v6.2-rc7
Message-ID: <Y996d9DJSOK3hT3A@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:4I3p7DxPNQAaF2icixvVhv/C/mp5VwgKAhBRzEfc+xmjnIKqLPY
 j8hUpQnu18CCtCnzho83rZU+eIgP3LXegRuvngSz7S968CwPvc/pgT2m+qmeSATfsiLGaNW
 5Su+JBb7DrWbrOqV6MNXuoe02vbaSrWojjfnef4gOo5Q8Bjq3bmvrNO2hMLo44INdLgUpuF
 aWFlBOz56oAIFnYN/GZ1g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:A/zKnyAk7rU=;HKuxYvDgulOV9DeiOU5JaL2hWg5
 1wT/cCSQ73PYS16kMZ6y/yF1zDlJVzhlaPmjD7oO2nBvWRlqCXaZVesZGAFYUfr+AblAjdehF
 4svgsueXmcS3QCmmb8JjKo4ygzI1sACxPwNinMJH1+c/1An7Gk8qPcoViVgVJH3Af6+ED1qT7
 6FjI/5Xhr6cpjqm/u68CCG4rqOpsof+0rRV+pow0KvGCdmygd88fEa3nMzyoQCQoSGJwuZ//J
 Irg+t9TqVz8ARA4vKUsM/mCR77GGK5rPJE4Qr9EFjEKG63HODasve7HZT0oWSVL99idSn+cQE
 evIUUf5YSWEl4Vre+VBMmvZ3PtbyQdp0DaK3/F7QNJWhkGwsPrTGlxZ13mgMpYcfR6Rej7qQK
 KncbBUG9oZkoaSZK7vSClZ0+DnptrztJtZloeLEbspu5M2QdSWBVleDAKE8lx34hV5pmQNtle
 R73LPzZru94ebrP3GfcDzJy73eFSra+FrNNNFxSmI1NMCJMISykfc0qkOHuwkVqOIKTVzmpDZ
 VI/i4KumgAyEclcQ7GTdOiLGdsWZ5XjWEtwHMdVxLp6ollvwu82A6NoSin2u4WkYPGzA1VY6u
 Gs2iSndPTaJzk8l+tw8Zh0fzm3hu55ATK9i9gy36DSNm9TFxMQ6yaRm6/hEZYXNQUZlsdK5V0
 7U8oyRemsmO48jUBs5z2QkmCwSrXHB7VXCaeeGkALHpqk5ZPK3lAdyqugTg1lOK6rmh2ffNL1
 NeQq1PwDMh8oxdvCGSyQTMwRESol27EEyvYZWbTvqIP3gF3jh6w1BUq5svOMFe+MhFtaITvTE
 DDmE7mgAozZqB9BBrSIPfcTowMHGCXnBDq1ySnktpxZvB0A1dn3/CIy3Vf8MsGnDaAq1W3Kgi
 +QbljzXbRB6B0gW0KXMWeMRXaF2Z7GSmo2+CPzxqxh0XV4STlfko9nclMRaLlNjElz0ZFQ3kC
 gA2LMgkRQ8J62V7PZWud1Arr8Lk=
Content-Transfer-Encoding: quoted-printable
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

please pull the latest fbdev fixes for 6.2-rc7, which
- fix fbcon to prevent fonts bigger than 32x32 pixels to avoid
  overflows reported by syzbot,
- switch omapfb to use kstrtobool(), and
- switch some fbdev drivers to use the backlight helpers

Thanks,
Helge

=2D------

The following changes since commit b7bfaa761d760e72a969d116517eaa12e404c26=
2:

  Linux 6.2-rc3 (2023-01-08 11:49:43 -0600)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git ta=
gs/fbdev-for-6.2-rc7

for you to fetch changes up to 2b09d5d364986f724f17001ccfe4126b9b43a0be:

  fbcon: Check font dimension limits (2023-02-04 14:29:19 +0100)

=2D---------------------------------------------------------------
fbdev updates for kernel 6.2-rc7:

- Check font size in fbcon, reported by UBSAN and syzbot
- Use backlight helpers in various fbdev drivers

=2D---------------------------------------------------------------
Christophe JAILLET (1):
      fbdev: omapfb: Use kstrtobool() instead of strtobool()

Randy Dunlap (1):
      fbdev: fbmon: fix function name in kernel-doc

Samuel Thibault (1):
      fbcon: Check font dimension limits

Stephen Kitt (8):
      fbdev: aty128fb: Use backlight helper
      fbdev: atyfb: Use backlight helper
      fbdev: radeon: Use backlight helper
      fbdev: mx3fb: Use backlight helper
      fbdev: nvidia: Use backlight helper
      fbdev: omapfb: panel-dsi-cm: Use backlight helper
      fbdev: riva: Use backlight helper
      fbdev: atmel_lcdfb: Rework backlight status updates

 drivers/video/fbdev/atmel_lcdfb.c                  | 22 +----------------=
-----
 drivers/video/fbdev/aty/aty128fb.c                 |  6 ++----
 drivers/video/fbdev/aty/atyfb_base.c               |  8 +-------
 drivers/video/fbdev/aty/radeon_backlight.c         |  6 +-----
 drivers/video/fbdev/core/fbcon.c                   |  7 +++++--
 drivers/video/fbdev/core/fbmon.c                   |  2 +-
 drivers/video/fbdev/mx3fb.c                        |  7 +------
 drivers/video/fbdev/nvidia/nv_backlight.c          |  8 +-------
 .../fbdev/omap2/omapfb/displays/panel-dsi-cm.c     |  8 +-------
 .../video/fbdev/omap2/omapfb/dss/display-sysfs.c   |  7 ++++---
 .../video/fbdev/omap2/omapfb/dss/manager-sysfs.c   |  7 ++++---
 .../video/fbdev/omap2/omapfb/dss/overlay-sysfs.c   |  3 ++-
 drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c    |  3 ++-
 drivers/video/fbdev/riva/fbdev.c                   |  8 +-------
 14 files changed, 27 insertions(+), 75 deletions(-)
