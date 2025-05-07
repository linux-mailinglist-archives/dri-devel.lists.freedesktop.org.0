Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77897AAECCC
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 22:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C863810E892;
	Wed,  7 May 2025 20:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nUZ8KAQy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D038510E892
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 20:22:30 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-72c7332128eso156379a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 13:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746649347; x=1747254147; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6WxAsVZwuIlKrsCCu5XYkgSaSZ+q+xbI2lg/jdck3kw=;
 b=nUZ8KAQyxkXNRGrfeuzPm2rtHuzd4Mc3hEKm/mPxKvwaalyCf5KkecyegxJ/J7Xiuf
 YrtCVCBHKwGqnb+HXUHUZpLK2a2s1982U8ipXbFFRsKxoorN8KgNTuruprY6cUa/OQS+
 WjDxveDGlPxVhJR4U6nUeefA9YxQN06PZA49ShnQz9uO7i+zkpZ58rkk11hgNOWmvApu
 F8DFg3RTXrWEGsUxQ9afCaFz2RrafVLczNOS047pgl1fEZh1vYwhpq+B54K+Zg7v92Rm
 sMCQH8C8ZDwSija5PvDrihRaMWPVqAPX7GF2ECls7RgnWZBAbPeoUAycySnChrDf59rh
 DnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746649347; x=1747254147;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6WxAsVZwuIlKrsCCu5XYkgSaSZ+q+xbI2lg/jdck3kw=;
 b=wTvquQGtw5DUL3RqDz4eMcKROOvN6ZKJGf+liDnt7tdIsr/Hx9EyUmeRBZ/D9tcH+5
 PHM4MT5IXH05Vgm2rQUi+ZDxaxbjFtLy1HjahYSjLpajwMSkL/h4CDTCXHF6l+hjBRJD
 dBOOzZVelZqMl6Pv+YWFUao+OFfmhkmLSS2QjG6DBL1T7idL9iXrxUuNlYblYsn25pTw
 DbFB2PkUYK3cm8yAcJXGsQAhzED6JGjpwIn9yIilEvd8teZnxKoPZ5jVq5ep6kZ5t5Hi
 wfb2FP9w1qHRrfQymtzOCFGzja/aCqUd5RaQ9G4JeTHJv9WbJKcinUg5V3zxoBEUxxk1
 Ed6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpmueNm7UNuVJZkbzMcPKMHBJEo4pSVMKDtdIpvzdzlxuZ3s+Sz1IGWAYWF+UW96751ThT5HB/pjo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5WeywQNFqVwKe8/wJqAHwaJX/79zp5daE7kcd2onlArzz3znb
 0qtgtARDyUnt7eBvxblKz9magJE6oNv6oZcY7x0qB7G58RlDyE3V
X-Gm-Gg: ASbGncscKVMOirMn4pvmcsO7rCkvYt8KjbIPEF0sk1CyqLKxpRX2XT3cU94w8Q6P/F9
 LDQPuUvgPD70RCW8mdON67bBE6GZEXMnaCoVjvbTQg5tMPrNzwOtk+sz+bwIpoiwqTY93yqVHF0
 Wx20H4BVj32llP4w4ZGpviFLZ8fnxVdrb0CTYWhzw/iFeiP95dBb0bihYcLXI39efi/VBssEIN3
 +BTzA0mZQGXhhmFILaB9nFwa4iskLe5Ha1LJy+YCfqQl8DyTtBwGy3C9Y24I8D4vMpHlHCwTHbU
 7C5OXyfVF4yqTe9dX1doslPDB7mLjg2VxpsGohzZdIlq1yBJo8krY66i53dH
X-Google-Smtp-Source: AGHT+IHoe0JkaM3Y80DR2zEp9shvUEEimkHkCWgil5PClaq/7bVrL+WbGs9IXYdqS4P+pZ1L1ee2tA==
X-Received: by 2002:a05:6830:348a:b0:72b:9674:93ed with SMTP id
 46e09a7af769-7321c948d40mr427028a34.24.1746649347434; 
 Wed, 07 May 2025 13:22:27 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:22:27 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Subject: [PATCH V9 00/24] drm: sun4i: add Display Engine 3.3 (DE33) support
Date: Wed,  7 May 2025 15:19:19 -0500
Message-ID: <20250507201943.330111-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Chris Morgan <macromorgan@hotmail.com>

I've spoken with Ryan and he agreed to let me take over this series to
get the display engine working on the Allwinner H616. I've taken his
previous patch series for Display Engine 3.3 and combined it with the
LCD controller patch series. I've also fixed a few additional bugs and
made some changes to the device tree bindings.

Changes since V8:
 - Combined the DE33 [1] series and the LCD [2] series to better track
   all patches necessary to output to an LCD display for the Allwinner
   H700.
 - Added a required LVDS reset as requested here [3].
 - Added compatible strings with a fallback for
   allwinner,sun50i-h616-display-engine, allwinner,sun50i-h616-tcon-top,
   and allwinner,sun50i-h616-sram-c.
 - Added binding documentation for the LCD controller.
 - Renamed the de3_sram device tree node to de33_sram.
 - Corrected the LVDS reset for the LCD controller binding.
 - Removed the PWM pins from the pincontroller bindings, as PWM is not
   yet supported.
 - Reordered the patches so that a binding or a device tree node is not
   referenced before it is defined.

[1] https://lore.kernel.org/linux-sunxi/20250310092345.31708-1-ryan@testtoast.com/
[2] https://lore.kernel.org/linux-sunxi/20250216092827.15444-1-ryan@testtoast.com/
[3] https://lore.kernel.org/linux-sunxi/38669808.XM6RcZxFsP@jernej-laptop/

Chris Morgan (24):
  dt-bindings: clock: sun50i-h616-ccu: Add LVDS reset
  clk: sunxi-ng: h616: Add LVDS reset for LCD TCON
  drm: sun4i: de2/de3: add mixer version enum
  drm: sun4i: de2/de3: refactor mixer initialisation
  drm: sun4i: de2/de3: add generic blender register reference function
  drm: sun4i: de2/de3: use generic register reference function for layer
    configuration
  dt-bindings: allwinner: add H616 DE33 bus binding
  dt-bindings: allwinner: add H616 DE33 clock binding
  dt-bindings: allwinner: add H616 DE33 mixer binding
  clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: mixer: add mixer configuration for the H616
  dt-bindings: allwinner: Add TCON_TOP and TCON_LCD clock/reset defines
  dt-bindings: display: sun4i: Add compatible strings for H616 DE
  dt-bindings: display: sun4i: Add compatible strings for H616 TCON TOP
  dt-bindings: sram: sunxi-sram: Add H616 SRAM C compatible
  dt-bindings: display: Add R40 and H616 display engine compatibles
  drm/sun4i: tcon: Add support for R40 LCD
  arm64: dts: allwinner: h616: add display engine, bus and mixer nodes
  arm64: dts: allwinner: h616: Add TCON nodes to H616 DTSI
  arm64: dts: allwinner: h616: add LCD and LVDS pins
  arm64: dts: allwinner: rg35xx: Add GPIO backlight control
  arm64: dts: allwinner: rg35xx: Enable LCD output

 .../bus/allwinner,sun50i-a64-de2.yaml         |   7 +-
 .../clock/allwinner,sun8i-a83t-de2-clk.yaml   |   1 +
 .../allwinner,sun4i-a10-display-engine.yaml   |  39 +--
 .../display/allwinner,sun4i-a10-tcon.yaml     |  10 +
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  34 ++-
 .../display/allwinner,sun8i-r40-tcon-top.yaml |  13 +-
 .../allwinner,sun4i-a10-system-control.yaml   |   4 +-
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 224 ++++++++++++++++++
 .../sun50i-h700-anbernic-rg35xx-2024.dts      |  64 +++++
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c        |   1 +
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  25 ++
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |   9 +
 drivers/gpu/drm/sun4i/sun8i_csc.c             |   4 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 168 ++++++++++---
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  30 ++-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  27 ++-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c       |   2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  14 +-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c       |   6 +-
 include/dt-bindings/clock/sun8i-tcon-top.h    |   2 +
 include/dt-bindings/reset/sun50i-h616-ccu.h   |   1 +
 21 files changed, 597 insertions(+), 88 deletions(-)

-- 
2.43.0

