Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 622E427FA18
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 09:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962876E850;
	Thu,  1 Oct 2020 07:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60283892C9;
 Thu,  1 Oct 2020 07:21:56 +0000 (UTC)
IronPort-SDR: JXhEUwVzZD8kEe4DDNZx1psbtU0xkD0DTCTZ9oOItc4tBN+ZD5FyArV+tVpR3o0tJH5b2/hJ5T
 zF1s2cqXH+ZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9760"; a="247373719"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="247373719"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 00:21:49 -0700
IronPort-SDR: elh2mQK6gTiSopFBRhXwybHqAjYrYZvU8g7tQh5brAz6PHiUnmhG9Lh+o7jDYdWPmWTtBM1z+3
 qYHqp+bre2bA==
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="458012968"
Received: from jshanly-mobl1.ger.corp.intel.com (HELO [10.249.36.140])
 ([10.249.36.140])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 00:21:46 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <8585daa2-fcbc-3924-ac4f-e7b5668808e0@linux.intel.com>
Date: Thu, 1 Oct 2020 09:21:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
Content-Language: en-US
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm-misc-fixes-2020-10-01:
drm-misc-fixes for v5.9:
- Small doc fix.
- Re-add FB_ARMCLCD for android.
- Fix global-out-of-bounds read in fbcon_get_font().
The following changes since commit 19a508bd1ad8e444de86873bf2f2b2ab8edd6552:

  dmabuf: fix NULL pointer dereference in dma_buf_release() (2020-09-21 11:17:06 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-10-01

for you to fetch changes up to 27204b99b08289d0993cb77c22470034b5eb974d:

  drm: drm_dsc.h: fix a kernel-doc markup (2020-09-30 16:40:44 +0200)

----------------------------------------------------------------
drm-misc-fixes for v5.9:
- Small doc fix.
- Re-add FB_ARMCLCD for android.
- Fix global-out-of-bounds read in fbcon_get_font().

----------------------------------------------------------------
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
