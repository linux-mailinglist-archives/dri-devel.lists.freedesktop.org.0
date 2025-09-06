Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB09FB46F15
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 15:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE4110E0E1;
	Sat,  6 Sep 2025 13:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f8zpIOBv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E82210E0E1
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 13:54:04 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-55f72452a8eso3602746e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 06:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757166842; x=1757771642; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UPNxUXPxSXFgZu+p4pJj6Pw9/UY7PSbv42TZPM74sbk=;
 b=f8zpIOBvln1kk8Q1O9gKi6SMOkTDjwg1zUQAEfgcw3uAwbPn6Yd7muOUm28S4srTp9
 zuY+5AiNG00izEDTTdOBV9uvZiEzFpidF9lzsSJTuauCGs+jktDTe1McLYosr5G/hasW
 muly1OqOHODINhaVrsxK2AYXtJcqccSj71JpFFF5Qr7+zEl+48UpiOn1xXyLzHxbbaig
 3XltvGR0U8yuPfiaAXnBf05t4JVzT4xpePR0PxBuYHwAzGGEjhjPvAQT5wlRXYRPSqwC
 DTkl6GgSoJJ/J0r5QEY5Eg0v0K/NJvB7K/y/zjtA2/Z64bsJAghcvGFI0S9CudKCEhzh
 ZlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757166842; x=1757771642;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UPNxUXPxSXFgZu+p4pJj6Pw9/UY7PSbv42TZPM74sbk=;
 b=V2pCHOHxFhXHrcTO2K7643UF7w3WxUXi+/MVIoch7Dz1Xp5Ilv4kTrppfh10XZztxY
 xHY14x9doVphwwqRhK5O3dpNY3THO8A4UxqkPVSUZSRuggOKspEphz8uCmy27wY/hAy8
 6/YwW/vZiJm9RMZ0D+Brgsk1+CuEmX4/tw3UBgLq38985H2bkltNf0l6T9Rm7Anb94vG
 +Ogb4HetsUnRS4P5qh4Y5e8Z5efXk9mIxoVxj4LHGf0lEterWlxfSKjQ9aXW9o0GNIk3
 P78kU68jGPYtEwaqLS2QVYOXsMnTADXb1TcRN088CUGdKh3Rifp1StUwtgZdD+ry9wMB
 Anvw==
X-Gm-Message-State: AOJu0YyLIrv4BHdF+MgtYOMiqGW+akbr6k4w1MmC+318XxhVvAmrNkbO
 mwPCZFFT3o3fAelkwmd7eekgK98rc1ZanREDIq3Hi99B0kIFG6dmO9Na
X-Gm-Gg: ASbGncsVGYFstgCCY2OATS++4qNWc87Q0wJtplTh2XZeJfDKEa0zqUrMslONJ68ipy/
 Osz0P+7tZLPOTAr5AuE5Kd89FVP5JOFXT3OHoZIV3FWE0bLeR+DtCiHOtiU6FM4JJFt/6qosMFu
 kYrmKLuYOF1knQ7CuSdbXmGqoHNegLAKXnk8+Z7zzuhzN+IOiaC030w3EYLwokbIxFP1+RVU/Ng
 0MCHxDGMJLX0WJzxm9+2qnAB9U3KcWz7Xr5+41rWNJUHmT0ypOE+qRS5HxVzVhfioRSs80ZBezg
 utrdtQ4raLQCxjIRnqgnEd9bVRQD/wkpGao8V1Mejp1WEO/AUkqXPQinVTX9ZitlI0ctWrGeNIx
 HLjNPtBAnk/wRSQLzmu2wgYWN
X-Google-Smtp-Source: AGHT+IESUrWBV6x89XWvgKOIImpxLehwahZXu+FMNGClISAqT36rK28RionSJf7lu3R6CGsKWJwi9w==
X-Received: by 2002:a05:6512:2212:b0:55f:3658:c3c3 with SMTP id
 2adb3069b0e04-5626425c636mr724355e87.47.1757166842149; 
 Sat, 06 Sep 2025 06:54:02 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 06:54:01 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v2 00/23] tegra-video: add CSI support for Tegra20 and Tegra30
Date: Sat,  6 Sep 2025 16:53:21 +0300
Message-ID: <20250906135345.241229-1-clamor95@gmail.com>
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
---

Svyatoslav Ryhel (23):
  clk: tegra: set CSUS as vi_sensors gate for Tegra20, Tegra30 and
    Tegra114
  dt-bindings: clock: tegra30: Add IDs for CSI pad clocks
  clk: tegra30: add CSI pad clock gates
  dt-bindings: display: tegra: document Tegra30 VI and VIP
  staging: media: tegra-video: expand VI and VIP support to Tegra30
  staging: media: tegra-video: vi: adjust get_selection op check
  staging: media: tegra-video: vi: add flip controls only if no source
    controls are provided
  staging: media: tegra-video: csi: move CSI helpers to header
  gpu: host1x: convert MIPI to use operations
  staging: media: tegra-video: csi: add support for SoCs with integrated
    MIPI calibration
  staging: media: tegra-video: csi: add a check to
    tegra_channel_get_remote_csi_subdev
  dt-bindings: display: tegra: move avdd-dsi-csi-supply from VI to CSI
  staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI to
    CSI
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

 .../display/tegra/nvidia,tegra20-csi.yaml     | 104 +++
 .../display/tegra/nvidia,tegra20-vi.yaml      |  22 +-
 .../display/tegra/nvidia,tegra20-vip.yaml     |   9 +-
 .../display/tegra/nvidia,tegra210-csi.yaml    |   3 +
 .../display/tegra/nvidia,tegra30-csi.yaml     | 115 +++
 arch/arm/boot/dts/nvidia/tegra20.dtsi         |  19 +-
 arch/arm/boot/dts/nvidia/tegra30.dtsi         |  24 +-
 drivers/clk/tegra/clk-tegra114.c              |   7 +-
 drivers/clk/tegra/clk-tegra20.c               |   7 +-
 drivers/clk/tegra/clk-tegra30.c               |  21 +-
 drivers/gpu/drm/tegra/dsi.c                   |   1 +
 drivers/gpu/host1x/mipi.c                     |  58 +-
 drivers/staging/media/tegra-video/Makefile    |   1 +
 drivers/staging/media/tegra-video/csi.c       |  66 +-
 drivers/staging/media/tegra-video/tegra20.c   | 793 +++++++++++++++---
 drivers/staging/media/tegra-video/tegra210.c  |   2 +-
 drivers/staging/media/tegra-video/vi.c        |  54 +-
 drivers/staging/media/tegra-video/vi.h        |   9 +-
 drivers/staging/media/tegra-video/video.c     |   8 +-
 drivers/staging/media/tegra-video/vip.c       |   4 +-
 include/dt-bindings/clock/tegra30-car.h       |   3 +-
 include/linux/host1x.h                        |  10 -
 .../csi.h => include/linux/tegra-csi.h        |  18 +
 include/linux/tegra-mipi-cal.h                | 143 ++++
 24 files changed, 1269 insertions(+), 232 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra30-csi.yaml
 rename drivers/staging/media/tegra-video/csi.h => include/linux/tegra-csi.h (88%)
 create mode 100644 include/linux/tegra-mipi-cal.h

-- 
2.48.1

