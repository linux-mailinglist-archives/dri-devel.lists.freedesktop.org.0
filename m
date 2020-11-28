Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E082C7632
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120CB6E0D1;
	Sat, 28 Nov 2020 22:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CA16E0D1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:41:22 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id s30so12753334lfc.4
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=es1AAe0TaPdJSHZcrk9xRxI2zSN1z9e2u/YAIJUcPNw=;
 b=vCKLS+srhrN0XNUrKEXWi07drCxDzrzfD7pdaFGh0I9d3NOazGbiNW+/QOWUi1Uzpb
 fxb6q1bv6exZXioWVBW0ty6q2wtzJCtnls5dMdxGGt49C7yUkWrH5KtiTSN4UBeQWUYV
 Y+QXYeaYVD1MSsmfEMK6Cg98EjGJPS1h+S/wXGHPigLOQuzakkdYVjneojpC8uvpDAdP
 eEDdvKbOoiVObXe2T6PVcUy5k+EVC1TMTSx5/ogvfCaa7hWXcCKnyOTqhtdp/8q5i4WU
 fgZjqvCbGnfd9P7PoAvuqhFxFYojxAxd2sb+3Qm+VtfsN26VBVsITX6LcU8mkDzjiOlI
 i4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=es1AAe0TaPdJSHZcrk9xRxI2zSN1z9e2u/YAIJUcPNw=;
 b=ua+sQggT4fDpRtu26QdlwFo0rm38tQTGKPfqGonWcFI7JzVyOQmTGRTXUEsLG7XFjm
 0RZqX0+DBvY+cGzqIl02VZHCH1HmzIt1ToIZ+aWV6Dg/hwnywc1k7vCV//JKUHpVTS6I
 uRtsFCy9CKRzmmdsBtrE3XYToKzDdXWQz8hxgNE24l8KFQeAB3ZrUZ0T69/sokomjKeW
 +1sFEtxwhOMhnetBK827sXyqmHq0CzWxwqhRKijWFivrw6j4ujmNfEr0LNytzXb9TY8y
 4fM9G/5Zrl/k+Ufut4i+sSJwp82X1soNWMHiUwzBYFE4uUZDBY0RcWMqOBsHuvtoQfPx
 PyWg==
X-Gm-Message-State: AOAM531CXwwyE6SEMo1Hkc5B57LWjG4/zWVP3ffKYG9mcgzd1OHwEEk3
 /6PgWI9gKgoj/NgVRJQjODE=
X-Google-Smtp-Source: ABdhPJxKFOaPRHulRxMfEZD7C6TvGRPUrDJjwXxOxPEC/xfnR/UxMWDFAhxDQgTcKvdEkF46U2xY7A==
X-Received: by 2002:a19:d02:: with SMTP id 2mr6550674lfn.294.1606603280421;
 Sat, 28 Nov 2020 14:41:20 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:41:19 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 0/28] drivers/video: W=1 warning fixes
Date: Sat, 28 Nov 2020 23:40:46 +0100
Message-Id: <20201128224114.1033617-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Sam Ravnborg <sam@ravnborg.org>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Thomas Zimemrmann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following the great work of Lee Jones in other subsystems
here is a set of patches that address all remaining W=1
warnings in drivers/video/.
Lee Jones already fixed all warnings in video/backlight/ so
this is mostly fbdev related fixes.

The general approach used were:
- Fix kernel-doc, this is often very trivial
- Drop unused local variables
- Use no_printk for local logging support

Build tested on a set of architectures with various configs.

The patches do not depends on each other and in most cases all
fixes for one driver is kept in a single patch.

The individual changes are trivial so this is a great
starter task to try to review these patches.

A timely Reviewed-by: or Acked-by: would be very nice so we can
get the warnings fixes before we cut for the merge window.

v2:
  - Updated subject of the patches to tell what was fixed (Lee)
  - Fixed build error in one patch (kernel test robot)
  - A few editorials updates to the changelog messages

	Sam

Sam Ravnborg (28):
      video: Fix kernel-doc warnings in of_display_timing + of_videomode
      video: fbcon: Fix warnings by using pr_debug() in fbcon
      video: fbdev: core: Fix kernel-doc warnings in fbmon + fb_notify
      video: fbdev: aty: Delete unused variable in radeon_monitor
      video: fbdev: aty: Fix set but not used warnings
      video: fbdev: aty: Fix set but not used warnings in mach64_ct
      video: fbdev: sis: Fix defined but not used warnings
      video: fbdev: sis: Fix defined but not used warning of SiS_TVDelay
      video: fbdev: sis: Fix set but not used warnings in init.c
      video: fbdev: sis: Fix set but not used warnings in sis_main
      video: fbdev: via: Fix set but not used warning for mode_crt_table
      video: fbdev: tdfx: Fix set but not used warning in att_outb()
      video: fbdev: riva: Fix kernel-doc and set but not used warnings
      video: fbdev: pm2fb: Fix kernel-doc warnings
      video: fbdev: neofb: Fix set but not used warning for CursorMem
      video: fbdev: hgafb: Fix kernel-doc warnings
      video: fbdev: tgafb: Fix kernel-doc and set but not used warnings
      video: fbdev: mx3fb: Fix kernel-doc, set but not used and string warnings
      video: fbdev: sstfb: Updated logging to fix set but not used warnings
      video: fbdev: nvidia: Fix set but not used warnings
      video: fbdev: tmiofb: Fix set but not used warnings
      video: fbdev: omapfb: Fix set but not used warnings in dsi
      video: fbdev: omapfb: Fix set but not used warnings in hdmi*_core
      video: fbdev: s3c-fb: Fix kernel-doc and set but not used warnings
      video: fbdev: uvesafb: Fix set but not used warning
      video: fbdev: uvesafb: Fix string related warnings
      video: fbdev: cirrusfb: Fix kernel-doc and set but not used warnings
      video: fbdev: s1d13xxxfb: Fix kernel-doc and set but not used warnings

 drivers/video/fbdev/aty/atyfb_base.c              | 11 +++-----
 drivers/video/fbdev/aty/mach64_ct.c               | 15 ++++++----
 drivers/video/fbdev/aty/radeon_monitor.c          |  4 +--
 drivers/video/fbdev/cirrusfb.c                    | 20 ++++++-------
 drivers/video/fbdev/core/fb_notify.c              |  3 +-
 drivers/video/fbdev/core/fbcon.c                  | 25 ++++++-----------
 drivers/video/fbdev/core/fbmon.c                  |  2 +-
 drivers/video/fbdev/hgafb.c                       |  4 +--
 drivers/video/fbdev/mx3fb.c                       | 13 +++++----
 drivers/video/fbdev/neofb.c                       |  4 ---
 drivers/video/fbdev/nvidia/nv_setup.c             |  7 ++---
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c        | 12 ++------
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c |  4 +--
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c |  4 +--
 drivers/video/fbdev/pm2fb.c                       |  8 +++---
 drivers/video/fbdev/riva/fbdev.c                  |  9 +++---
 drivers/video/fbdev/riva/riva_hw.c                | 28 ++++++-------------
 drivers/video/fbdev/s1d13xxxfb.c                  |  3 +-
 drivers/video/fbdev/s3c-fb.c                      | 11 ++++----
 drivers/video/fbdev/sis/init.c                    | 34 ++++-------------------
 drivers/video/fbdev/sis/oem310.h                  |  2 ++
 drivers/video/fbdev/sis/sis.h                     |  1 -
 drivers/video/fbdev/sis/sis_main.c                |  9 +++---
 drivers/video/fbdev/sstfb.c                       |  2 +-
 drivers/video/fbdev/tdfxfb.c                      |  4 +--
 drivers/video/fbdev/tgafb.c                       |  7 ++---
 drivers/video/fbdev/tmiofb.c                      |  6 ++--
 drivers/video/fbdev/uvesafb.c                     |  8 +++---
 drivers/video/fbdev/via/lcd.c                     |  4 +--
 drivers/video/of_display_timing.c                 |  1 +
 drivers/video/of_videomode.c                      |  8 +++---
 include/video/sstfb.h                             |  4 +--
 32 files changed, 107 insertions(+), 170 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
