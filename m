Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F1A284628
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 08:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E17A6E329;
	Tue,  6 Oct 2020 06:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2AA6E329
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 06:37:35 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id l16so5125133eds.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 23:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=xLEheXVkRVPoO0mnE3ySwFlQ18AemugwN4oAiuDRkUQ=;
 b=cDBoN8mXSVFFwLwgCm1zVThWPFWrVJzCo2bUQQjSTOnDnRKUTLseAxqtyasrLqM/QK
 ogvSl4dPw0ASBMf4lIF1ZmYtrLSDEvFpwyph/PCRghnob89wpeq2T/BGkHwn2VdOghmS
 AqOzMMaizgSghkuNdjtEkx/MPfiE0FOPQEO+T5BsXYr/vY1vBUTnE+31IVirNrsuaHOC
 zKjDyzqi6qwltBUdCALVZghawzcLsSt+1lCIMRi3xNDSU3gY6nfkNkjgIsJ0TUlHxZGY
 XDvo6SEIzPNMcfd9f6tm+rTPSwIjgsJb5V/22CVVsfqW5E/w0lGeawFOi1z6q68BeVlj
 LXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=xLEheXVkRVPoO0mnE3ySwFlQ18AemugwN4oAiuDRkUQ=;
 b=MEJYGr/HB2QSjg4GyGTWMAcORWvQG/eRUHTaY0RSrk8HzaE2yS9dldXDTiynzYgYVq
 OavCDlcQPFA2aZkG+wd8eHSrVwPnnxE4lqI+FFzpmK/T1PxqjUHKzN1Lp9XNXtAA7XoL
 GZ54oDk8HC0P0KCamMxA0bWpHwoptPQm+plAqDVBi5JrtGn2Odxm1bbDsFnUZ5L3glyC
 rO2M7PbLs+WE9xqRcs1kZrRfKjyeJIr9hPDp/HgNBCXT68wwAIr28CUGfWODEfT+25oA
 IdVRWSbOpK7BWF6/a8ra5AQ4ZYK0u/b0Fx81ZolcBmDi0SDGuB7otSPnCzLvI02/U9QZ
 wh0g==
X-Gm-Message-State: AOAM533CJWFCRdm5z7in+EdfDCtbcyyRPv+uf+BQkboXEax0bs8B7Rl3
 Gfe5LPW6bfMjmfQ3FxIUvD6Y5MeCTX6fCn7U3Ow=
X-Google-Smtp-Source: ABdhPJzkM8KQLRMBKxYYLPl7+n3d0Jd5psKGrV0bEXrAEY3sdZMqiysyZeBQvd1ZGy99V9pxmu/HIUDLdJ2xqgBg7HI=
X-Received: by 2002:aa7:d959:: with SMTP id l25mr3623626eds.383.1601966253585; 
 Mon, 05 Oct 2020 23:37:33 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 6 Oct 2020 16:37:22 +1000
Message-ID: <CAPM=9tyLDWM8c6L0fTG6SeouqXRixTTS2MHX8FKeEGekGinp8w@mail.gmail.com>
Subject: [git pull] drm fbdev fixes for 5.9 final
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Daniel queued these up last week and I took a long weekend so didn't
get them out, but fixing the OOB access on get font seems like
something we should land and it's cc'ed stable as well. The other big
change is a partial revert for a regression on android on the clcd
fbdev driver, and one other docs fix.

Dave.

drm-fixes-2020-10-06-1:
drm fixes for 5.9 final

fbdev:
- Re-add FB_ARMCLCD for android.
- Fix global-out-of-bounds read in fbcon_get_font().

core:
- Small doc fix.
The following changes since commit 549738f15da0e5a00275977623be199fbbf7df50:

  Linux 5.9-rc8 (2020-10-04 16:04:34 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-10-06-1

for you to fetch changes up to 86fdf61e71046618f6f499542cee12f2348c523c:

  Merge tag 'drm-misc-fixes-2020-10-01' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2020-10-06
12:38:28 +1000)

----------------------------------------------------------------
drm fixes for 5.9 final

fbdev:
- Re-add FB_ARMCLCD for android.
- Fix global-out-of-bounds read in fbcon_get_font().

core:
- Small doc fix.

----------------------------------------------------------------
Dave Airlie (1):
      Merge tag 'drm-misc-fixes-2020-10-01' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Mauro Carvalho Chehab (1):
      drm: drm_dsc.h: fix a kernel-doc markup

Peilin Ye (3):
      fbdev, newport_con: Move FONT_EXTRA_WORDS macros into linux/font.h
      Fonts: Support FONT_EXTRA_WORDS macros for built-in fonts
      fbcon: Fix global-out-of-bounds read in fbcon_get_font()

Peter Collingbourne (1):
      Partially revert "video: fbdev: amba-clcd: Retire elder CLCD driver"

 MAINTAINERS                             |   5 +
 drivers/video/console/newport_con.c     |   7 +-
 drivers/video/fbdev/Kconfig             |  20 +
 drivers/video/fbdev/Makefile            |   1 +
 drivers/video/fbdev/amba-clcd.c         | 986 ++++++++++++++++++++++++++++++++
 drivers/video/fbdev/core/fbcon.c        |  12 +
 drivers/video/fbdev/core/fbcon.h        |   7 -
 drivers/video/fbdev/core/fbcon_rotate.c |   1 +
 drivers/video/fbdev/core/tileblit.c     |   1 +
 include/drm/drm_dsc.h                   |   2 +-
 include/linux/amba/clcd-regs.h          |  87 +++
 include/linux/amba/clcd.h               | 290 ++++++++++
 include/linux/font.h                    |  13 +
 lib/fonts/font_10x18.c                  |   9 +-
 lib/fonts/font_6x10.c                   |   9 +-
 lib/fonts/font_6x11.c                   |   9 +-
 lib/fonts/font_7x14.c                   |   9 +-
 lib/fonts/font_8x16.c                   |   9 +-
 lib/fonts/font_8x8.c                    |   9 +-
 lib/fonts/font_acorn_8x8.c              |   9 +-
 lib/fonts/font_mini_4x6.c               |   8 +-
 lib/fonts/font_pearl_8x8.c              |   9 +-
 lib/fonts/font_sun12x22.c               |   9 +-
 lib/fonts/font_sun8x16.c                |   7 +-
 lib/fonts/font_ter16x32.c               |   9 +-
 25 files changed, 1469 insertions(+), 68 deletions(-)
 create mode 100644 drivers/video/fbdev/amba-clcd.c
 create mode 100644 include/linux/amba/clcd-regs.h
 create mode 100644 include/linux/amba/clcd.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
