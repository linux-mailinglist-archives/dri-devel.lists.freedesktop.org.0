Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEE2BA02EA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 17:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21CE10E0CD;
	Thu, 25 Sep 2025 15:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SmvLGIbZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16E110E0CD
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:17:13 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-57b7c83cc78so1016656e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 08:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758813432; x=1759418232; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7v32IEPJq83+rFpTKepQApZcwbjn1LGuorJ9QJ5gMjI=;
 b=SmvLGIbZdlbtQP47OmSkZUYDq++yVAVuYNGt5M12TDWHTEjbKOVtFhL5uh0uRR0bzD
 piy+RH57ZOSUFj+MuRubeDkUbrgiv+a+95P8iq4IjnwqovmTX9Ra1oWKivL6J5vkqXJU
 aMJ7l5W9UdWd/BQFh/CD9S1PlWgt18+lor55K7aoQBavkUk7XpBqVBvFALUkuzq+QSLV
 UGENOnBs+R/K4rZQxs6LJRog6waUWYdm5LrHlHzq5WY7vnr0koKeS9NAi31TeLvMZ1Ym
 CM2yfPoApskScX5SrIb1943e73GgkqauAOu66Lk560MsiZz8wEsmFwUPDj82tbr0Z7ya
 AggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758813432; x=1759418232;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7v32IEPJq83+rFpTKepQApZcwbjn1LGuorJ9QJ5gMjI=;
 b=jl+yQ/NtELg1ohHEIpxcvNuChEhCbXBjZko77xJnTD/KkBMHP58E2RkvJEpJqsE96/
 aa+Mss3560oWCQll9e1+WQ255qYvKgNY1yOjgLVt8RMmlFntWYzpKmC4dJFk9yBHSQAT
 HZ3sQgBZZ9C/8TSGclQUkxP09rj0rp0ByZlcMIOVmZdVI0QuA+0uizX1cb5ljCLlUaKV
 fdNH9nSo8K2wNKPPP9vRQyUpKv7FdXFcv2JCRmR2XWD/qW4sofLTeQFP0eZJ866gdoej
 bkr/bBCijam5djJ7Stu/I/nOTJqQImifOOpG7+GhXqnNRWM0Oueh1wkcMBsGcOw/JD91
 /zvg==
X-Gm-Message-State: AOJu0YyU+c4IVcR5LWhHAfu1HKysyxO5dmvpiTF6pLSuOaSj2pl0fIyD
 uyyqXtUMrqyKAJAUOa4nwQP0X9/JaY97WGROO4CuZrxUfBRIijZHW3Ke
X-Gm-Gg: ASbGnctZk7hWxFXtgclQjOT16mhKD+Zw5nt5THxBngIS5CnFFjKPwnfIlvkPW896f2w
 RdxbrOLCSWYQPJkazuc7hRqDA4ziIcFfpKD6wHJwgXe5RXhG14R88cUQwnFtHQdQjpYLQpIv30F
 zbs5WCbz0mWk/6b+055MA+/Ud6WgsemMEBnA1zKfcFMop1ixdqWEvyogVEzRMxXBM59meggFEq2
 7li3IwJ7xS9aiHfaLZ/7KxWugHJFU/CDsZFZeDCD59fJpS3CSeAjnhB87t5G5sFy36TC/3AEv11
 INEHEVDBCzkYZOiaUZNQ0fy1jmvIWldzaZ2P931IzTDncYHSaNZYrALc0x46Nxaj/x4+zP4rVpf
 3URh/qj+DXghOAw==
X-Google-Smtp-Source: AGHT+IE3EnxRGgkHHyis8Weimvr/QO/NiYq/0dZgZmiN2yuGCI3D2oO1tpnAY+bLbNeA0ytCv5wrfw==
X-Received: by 2002:a05:6512:3a93:b0:55f:3ae4:fe57 with SMTP id
 2adb3069b0e04-58306abf6a1mr938344e87.20.1758813431368; 
 Thu, 25 Sep 2025 08:17:11 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 08:17:10 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v3 00/22] tegra-video: add CSI support for Tegra20 and Tegra30
Date: Thu, 25 Sep 2025 18:16:26 +0300
Message-ID: <20250925151648.79510-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
with a set of changes required for that.

---
Changes in v2:
- vi_sensor gated through csus
- TEGRA30_CLK_CLK_MAX moved to clk-tegra30
- adjusted commit titles and messages
- clk_register_clkdev dropped from pad clock registration
- removed tegra30-vi/vip and used tegra20 fallback
- added separate csi schema for tegra20-csi and tegra30-csi
- fixet number of VI channels
- adjusted tegra_vi_out naming
- fixed yuv_input_format to main_input_format
- MIPI calibration refsctored for Tegra114+ and added support for
  pre-Tegra114 to use CSI as a MIPI calibration device
- switched ENOMEM to EBUSY
- added check into tegra_channel_get_remote_csi_subdev
- moved avdd-dsi-csi-supply into CSI
- next_fs_sp_idx > next_fs_sp_value
- removed host1x_syncpt_incr from framecounted syncpoint
- csi subdev request moved before frame cycle

Changes in v3:
- tegra20 and tegra30 csi schema merged
- removed unneeded properties and requirements from schema
- improved vendor specific properties description
- added tegra20 csus parent mux
- improved commit descriptions
- redesigned MIPI-calibration to expose less SoC related data into header
- commit "staging: media: tegra-video: csi: add support for SoCs with integrated
  MIPI calibration" dropped as unneeded
- improved tegra_channel_get_remote_device_subdev logic
- avdd-dsi-csi-supply moved from vi to csi for p2597 and p3450-0000
- software syncpoint counters switched to direct reading
- adjusted planar formats offset calculation
---

Svyatoslav Ryhel (22):
  clk: tegra: set CSUS as vi_sensor's gate for Tegra20, Tegra30 and
    Tegra114
  dt-bindings: clock: tegra30: Add IDs for CSI pad clocks
  clk: tegra30: add CSI pad clock gates
  dt-bindings: display: tegra: document Tegra30 VI and VIP
  staging: media: tegra-video: expand VI and VIP support to Tegra30
  staging: media: tegra-video: vi: adjust get_selection op check
  staging: media: tegra-video: vi: add flip controls only if no source
    controls are provided
  staging: media: tegra-video: csi: move CSI helpers to header
  gpu: host1x: convert MIPI to use operation function pointers
  staging: media: tegra-video: vi: improve logic of source requesting
  staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI to
    CSI
  arm64: tegra: move avdd-dsi-csi-supply into CSI node
  staging: media: tegra-video: tegra20: set correct maximum width and
    height
  staging: media: tegra-video: tegra20: add support for second output of
    VI
  staging: media: tegra-video: tegra20: simplify format align
    calculations
  staging: media: tegra-video: tegra20: set VI HW revision
  staging: media: tegra-video: tegra20: increase maximum VI clock
    frequency
  staging: media: tegra-video: tegra20: expand format support with
    RAW8/10 and YUV422 1X16
  staging: media: tegra-video: tegra20: adjust luma buffer stride
  dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
  ARM: tegra: add CSI nodes for Tegra20 and Tegra30
  staging: media: tegra-video: add CSI support for Tegra20 and Tegra30

 .../display/tegra/nvidia,tegra20-csi.yaml     | 135 +++
 .../display/tegra/nvidia,tegra20-vi.yaml      |  19 +-
 .../display/tegra/nvidia,tegra20-vip.yaml     |   9 +-
 arch/arm/boot/dts/nvidia/tegra20.dtsi         |  19 +-
 arch/arm/boot/dts/nvidia/tegra30.dtsi         |  24 +-
 .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi |   4 +-
 .../boot/dts/nvidia/tegra210-p3450-0000.dts   |   4 +-
 drivers/clk/tegra/clk-tegra114.c              |   7 +-
 drivers/clk/tegra/clk-tegra20.c               |  20 +-
 drivers/clk/tegra/clk-tegra30.c               |  21 +-
 drivers/gpu/drm/tegra/dsi.c                   |   1 +
 drivers/gpu/host1x/Makefile                   |   1 +
 drivers/gpu/host1x/dev.c                      |   2 +
 drivers/gpu/host1x/dev.h                      |   2 +
 drivers/gpu/host1x/mipi.c                     | 501 +----------
 drivers/gpu/host1x/tegra114-mipi.c            | 483 ++++++++++
 drivers/pinctrl/tegra/pinctrl-tegra20.c       |   7 +
 drivers/staging/media/tegra-video/Makefile    |   1 +
 drivers/staging/media/tegra-video/csi.c       |  66 +-
 drivers/staging/media/tegra-video/csi.h       |  16 +
 drivers/staging/media/tegra-video/tegra20.c   | 828 +++++++++++++++---
 drivers/staging/media/tegra-video/vi.c        |  56 +-
 drivers/staging/media/tegra-video/vi.h        |   9 +-
 drivers/staging/media/tegra-video/video.c     |   8 +-
 drivers/staging/media/tegra-video/vip.c       |   4 +-
 include/dt-bindings/clock/tegra30-car.h       |   3 +-
 include/linux/host1x.h                        |  10 -
 include/linux/tegra-mipi-cal.h                |  56 ++
 28 files changed, 1648 insertions(+), 668 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
 create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
 create mode 100644 include/linux/tegra-mipi-cal.h

-- 
2.48.1

