Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7148C2739
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 16:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B503410E0B9;
	Fri, 10 May 2024 14:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Qk+QHBRU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69ED510E0B9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 14:55:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0BD80CE1DF9;
 Fri, 10 May 2024 14:55:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B805BC113CC;
 Fri, 10 May 2024 14:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715352942;
 bh=sLxTchYz896sDj6qbtwDuUDSEIrv3OIFfIsIipZpE5U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qk+QHBRUz835G4CYflpo32U3bgdyaL3BSq2dIP7JPTBxppCQBluDy5JvM3o97jF80
 iEALaNAdz3a/+xGsLAEiu9b9vQ8IOnPt5tIhImEP0eGpneYwpJjwpuG02fLkJ3yi68
 nhbRbKKys1TrAkL5vW0TVsZ1OZcRgEjvN426FUx7zeuaqiU+tMqyApz+JEHhGlVjsp
 zDEVo4rZ2XssiB7JTh43TEhLtOPYXIZhhcknhTJmh/C+HOdQCExA3ZWfYGTj7MIeOv
 FQzyk2hH6uVo11vyU+GDq7RXKXBnosQk38Lr2DJANEJLXeauHqnO5s9JAJ0Ew2Q7b5
 NjdJU+QN1zb3Q==
Date: Fri, 10 May 2024 15:55:34 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: [GIT PULL] Immutable branch between Backlight, HID and fbdev due for
 the v6.10 merge window
Message-ID: <20240510145534.GD6146@google.com>
References: <20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git ib-backlight-hid-fbdev-lcd-scripts-v6.10

for you to fetch changes up to 82b9007bc4f8c22975d640d7df6743366f25a353:

  const_structs.checkpatch: add lcd_ops (2024-05-03 10:45:55 +0100)

----------------------------------------------------------------
Immutable branch between Backlight, HID and fbdev due for the v6.10 merge window

----------------------------------------------------------------
Krzysztof Kozlowski (19):
      backlight: lcd: Constify lcd_ops
      backlight: ams369fg06: Constify lcd_ops
      backlight: corgi_lcd: Constify lcd_ops
      backlight: hx8357: Constify lcd_ops
      backlight: ili922x: Constify lcd_ops
      backlight: ili9320: Constify lcd_ops
      backlight: jornada720_lcd: Constify lcd_ops
      backlight: l4f00242t03: Constify lcd_ops
      backlight: lms283gf05: Constify lcd_ops
      backlight: lms501kf03: Constify lcd_ops
      backlight: ltv350qv: Constify lcd_ops
      backlight: otm3225a: Constify lcd_ops
      backlight: platform_lcd: Constify lcd_ops
      backlight: tdo24m: Constify lcd_ops
      HID: picoLCD: Constify lcd_ops
      fbdev: clps711x: Constify lcd_ops
      fbdev: imx: Constify lcd_ops
      fbdev: omap: lcd_ams_delta: Constify lcd_ops
      const_structs.checkpatch: add lcd_ops

 drivers/hid/hid-picolcd_lcd.c            | 2 +-
 drivers/video/backlight/ams369fg06.c     | 2 +-
 drivers/video/backlight/corgi_lcd.c      | 2 +-
 drivers/video/backlight/hx8357.c         | 2 +-
 drivers/video/backlight/ili922x.c        | 2 +-
 drivers/video/backlight/ili9320.c        | 2 +-
 drivers/video/backlight/jornada720_lcd.c | 2 +-
 drivers/video/backlight/l4f00242t03.c    | 2 +-
 drivers/video/backlight/lcd.c            | 4 ++--
 drivers/video/backlight/lms283gf05.c     | 2 +-
 drivers/video/backlight/lms501kf03.c     | 2 +-
 drivers/video/backlight/ltv350qv.c       | 2 +-
 drivers/video/backlight/otm3225a.c       | 2 +-
 drivers/video/backlight/platform_lcd.c   | 2 +-
 drivers/video/backlight/tdo24m.c         | 2 +-
 drivers/video/fbdev/clps711x-fb.c        | 2 +-
 drivers/video/fbdev/imxfb.c              | 2 +-
 drivers/video/fbdev/omap/lcd_ams_delta.c | 2 +-
 include/linux/lcd.h                      | 6 +++---
 scripts/const_structs.checkpatch         | 1 +
 20 files changed, 23 insertions(+), 22 deletions(-)

-- 
Lee Jones [李琼斯]
