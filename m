Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0068F98B7A8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 10:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6989510E5FC;
	Tue,  1 Oct 2024 08:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JwFhJk+s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28D310E5FA
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 08:55:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1189B5C545E;
 Tue,  1 Oct 2024 08:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA2FC4CEC6;
 Tue,  1 Oct 2024 08:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727772945;
 bh=siQymRtTEPsEGx0zx5SfKOjAhstZARHZrhU+kftc6MY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JwFhJk+sjQKWUycH6f0aBhWp2rS2iox+HT/Sa5IrFg/E83F6Eu2SDFYcfPL6jVd10
 w6NthvnCgowaK2m4UvXVyrgOsnds874xOUOz+Z8T47XRYJTX6mBYzTaayv2Sbmij1M
 WVysM+/702SKhCpqV2aaS19We5jVT8JOdwgspps75qYRAQe49N4wQkkuPkQeM5JhXJ
 NLziFK+eLDL9sev+sORcCu5IyaNsyXGzGGSBdsoWxmqOj3uVNRPbNGAT7GtrN7U+s2
 F0sTfKAA2u9vMZ2NdqZzLlY6XeUdKcoJkr3NWT7N1v2t8xYrxa9uuGW3nw0jW6BX+z
 MFN7qkhP4w59Q==
Date: Tue, 1 Oct 2024 09:55:40 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de,
 bonbons@linux-vserver.org, jikos@kernel.org, bentiss@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org,
 festevam@gmail.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [GIT PULL] Immutable branch between Backlight, HID and fbdev due for
 the v6.13 merge window
Message-ID: <20241001085540.GB7504@google.com>
References: <20240906075439.98476-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240906075439.98476-1-tzimmermann@suse.de>
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

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git tags/ib-backlight-hid-fbdev-v6.13

for you to fetch changes up to 0d580d99749e759b62dc8e28f511310e9235da7a:

  backlight: lcd: Do not include <linux/fb.h> in lcd header (2024-09-30 16:49:42 +0100)

----------------------------------------------------------------
Immutable branch between Backlight, HID and fbdev due for the v6.13 merge window

----------------------------------------------------------------
Thomas Zimmermann (28):
      backlight: lcd: Rearrange code in fb_notifier_callback()
      backlight: lcd: Test against struct fb_info.lcd_dev
      backlight: lcd: Add LCD_POWER_ constants for power states
      backlight: corgi_lcd: Use lcd power constants
      backlight: hx8357: Use lcd power constants
      backlight: ili922x: Use lcd power constants
      backlight: ili9320: Use lcd power constants
      backlight: jornada720_lcd: Include <linux/io.h> for IOMEM() macro
      backlight: jornada720_lcd: Use lcd power constants
      backlight: l4f00242t03: Use lcd power constants
      backlight: lms283gf05: Use lcd power constants
      backlight: lms501kf03: Remove unnecessary include of <linux/backlight.h>
      backlight: lms501kf03: Use lcd power constants
      backlight: ltv350qv: Use lcd power constants
      backlight: otm3225a: Use lcd power constants
      backlight: platform_lcd: Remove include statement for <linux/backlight.h>
      backlight: platform_lcd: Remove match_fb from struct plat_lcd_data
      backlight: platform_lcd: Use lcd power constants
      backlight: tdo24m: Use lcd power constants
      fbdev: clps711x-fb: Replace check_fb in favor of struct fb_info.lcd_dev
      fbdev: clps711x-fb: Use lcd power constants
      fbdev: imxfb: Replace check_fb in favor of struct fb_info.lcd_dev
      fbdev: imxfb: Use lcd power constants
      fbdev: omap: Use lcd power constants
      HID: picoLCD: Replace check_fb in favor of struct fb_info.lcd_dev
      backlight: lcd: Replace check_fb with controls_device
      backlight: lcd: Remove struct fb_videomode from set_mode callback
      backlight: lcd: Do not include <linux/fb.h> in lcd header

 drivers/hid/hid-picolcd_fb.c             |  4 +++
 drivers/hid/hid-picolcd_lcd.c            |  6 ----
 drivers/video/backlight/corgi_lcd.c      | 17 +++++------
 drivers/video/backlight/hx8357.c         |  2 +-
 drivers/video/backlight/ili922x.c        |  7 ++---
 drivers/video/backlight/ili9320.c        | 15 +++++-----
 drivers/video/backlight/jornada720_lcd.c | 10 +++----
 drivers/video/backlight/l4f00242t03.c    | 32 ++++++++++----------
 drivers/video/backlight/lcd.c            | 50 ++++++++++++++++++++++++--------
 drivers/video/backlight/lms283gf05.c     |  2 +-
 drivers/video/backlight/lms501kf03.c     | 24 +++++++--------
 drivers/video/backlight/ltv350qv.c       | 15 +++++-----
 drivers/video/backlight/otm3225a.c       |  2 +-
 drivers/video/backlight/platform_lcd.c   | 20 +++++--------
 drivers/video/backlight/tdo24m.c         | 19 ++++++------
 drivers/video/fbdev/clps711x-fb.c        | 29 +++++++++---------
 drivers/video/fbdev/imxfb.c              | 32 +++++++-------------
 drivers/video/fbdev/omap/lcd_ams_delta.c |  8 ++---
 include/linux/fb.h                       | 13 +++++++++
 include/linux/lcd.h                      | 29 +++++++++++++-----
 include/video/platform_lcd.h             |  3 --
 21 files changed, 181 insertions(+), 158 deletions(-)

-- 
Lee Jones [李琼斯]
