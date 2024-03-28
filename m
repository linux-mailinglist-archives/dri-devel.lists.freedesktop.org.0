Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD53588FC96
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 11:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C235A10F7F3;
	Thu, 28 Mar 2024 10:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZnuMpnRg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B80810F7F3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 10:11:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9074F60C19;
 Thu, 28 Mar 2024 10:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 205E1C433C7;
 Thu, 28 Mar 2024 10:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711620685;
 bh=/iYJllScuVN6X9EML6q5PXNHY8zPt1H2IRj7tnZN5Eg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZnuMpnRgXxbyxxVjxbv6mntmLR20Py4SnOpS2JcomdOHGP9F6hYdITusD2bexeDz3
 MwFi7L/pK6aQoOWMRifhNVe/Yi48dxiBYvJe0SJyq1ya1L6R4t1+N6s5d5tx+I+/2P
 crAHyaqUi+/3HoOs+4FDzRMDJ8NKUPKpx/HgLWBSalu3NjXcYzY8JpzvDeOmdpJiKI
 US+5Czvt2RJH5UPYJIRVMWZIYbS0ptRkZ88CUARpjh+bTun5qYRaWEjGNBG+7UHO1e
 qlQpILAtKBaxWhR+y+7+xZ63Q9oH9kaNCrQLBC5xZTSL4BdPGWg7vcz7HlqPyU6A7K
 ZuuwglAW4DGRg==
Date: Thu, 28 Mar 2024 10:11:20 +0000
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: andy@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, robin@protonic.nl, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [GIT PULL] Immutable branch between MFD, Auxdisplay, HID and FB due
 for the v6.9 merge window
Message-ID: <20240328101120.GX13211@google.com>
References: <20240305162425.23845-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240305162425.23845-1-tzimmermann@suse.de>
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

Enjoy!

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git ib-backlight-auxdisplay-hid-fb-v6.9

for you to fetch changes up to 0a4be7263749945a3882f7a0e2e5b1c45c31064e:

  backlight: Add controls_device callback to struct backlight_ops (2024-03-28 10:09:06 +0000)

----------------------------------------------------------------
Immutable branch between MFD, Auxdisplay, HID and FB due for the v6.9 merge window

----------------------------------------------------------------
Thomas Zimmermann (10):
      backlight: Match backlight device against struct fb_info.bl_dev
      auxdisplay: ht16k33: Remove struct backlight_ops.check_fb
      hid: hid-picolcd: Fix initialization order
      hid: hid-picolcd: Remove struct backlight_ops.check_fb
      backlight: aat2870-backlight: Remove struct backlight.check_fb
      backlight: pwm-backlight: Remove struct backlight_ops.check_fb
      fbdev: sh_mobile_lcdc_fb: Remove struct backlight_ops.check_fb
      fbdev: ssd1307fb: Init backlight before registering framebuffer
      fbdev: ssd1307fb: Remove struct backlight_ops.check_fb
      backlight: Add controls_device callback to struct backlight_ops

 drivers/auxdisplay/ht16k33.c             |  8 --------
 drivers/hid/hid-picolcd_backlight.c      |  7 -------
 drivers/hid/hid-picolcd_core.c           | 14 +++++++-------
 drivers/hid/hid-picolcd_fb.c             |  6 ++++++
 drivers/video/backlight/aat2870_bl.c     |  7 -------
 drivers/video/backlight/backlight.c      |  8 ++++++--
 drivers/video/backlight/bd6107.c         | 12 ++++++------
 drivers/video/backlight/gpio_backlight.c | 12 ++++++------
 drivers/video/backlight/lv5207lp.c       | 12 ++++++------
 drivers/video/backlight/pwm_bl.c         | 12 ------------
 drivers/video/fbdev/core/fb_backlight.c  |  6 ++++++
 drivers/video/fbdev/sh_mobile_lcdcfb.c   |  7 -------
 drivers/video/fbdev/ssd1307fb.c          | 31 +++++++++++--------------------
 include/linux/backlight.h                | 16 ++++++++--------
 include/linux/fb.h                       |  9 +++++++++
 include/linux/pwm_backlight.h            |  1 -
 16 files changed, 71 insertions(+), 97 deletions(-)

-- 
Lee Jones [李琼斯]
