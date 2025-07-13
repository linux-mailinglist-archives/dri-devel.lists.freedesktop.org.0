Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8BBB02FF8
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jul 2025 10:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADDF10E133;
	Sun, 13 Jul 2025 08:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A5210E133
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 08:39:00 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-ae6f8d3bcd4so521420766b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 01:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752395939; x=1753000739;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iox57DVjdaoaKfxo5AboCSCO4GMqqNFB8Dj9mmEAG9U=;
 b=igNLqjK9YmKHfkhTMwpYFqGf771kM5SZR8VdZlZVePoICUzM07K1lE4gL2xz3OZgLL
 sOu1EVXVr8BAjhv1oWKJ90wBp0OyBabyOVSJkr7xxXUwJPXHDCkF/Fazjvub2q3aSnh+
 u1QjZHRCD1lgH7y7lIfWLE+9KJI8MEyc8utrJs4bnSCJmqrHwlT7V49aXOUA5a55dYbS
 X/ICBwamNGxnJvKZVs/YKEE1HQpyzRF0n+TEhDXR1maZ81Y5HfDmcCw6E58kTm/+JQsU
 gNP7OrbLe8ki4iX8JgwH8OP6SZtXYyKhZon3gluqfhyaKtpgKn47TS2dCqNuLuJiFhDS
 YNyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhRDb1t4G1t0vZTrELCW1C8EnMgybmiSh3yvQZsRanwvU/iNU1alBcrKGVPZodojqY3Aq71LgCPBQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFxk+JeL9rb+w3PGmPLgwTgkXItL3HYNTXoIeS065jiK/cMDmf
 E37b4OvMmtt6jdnbUI8N74YBtiwfZqWi+3ofxIUbuvqFCaTyqaZoun76
X-Gm-Gg: ASbGncvleWUuOa6Ryll/r5O6Bncd/2u1CzPu+lXcz+e+7K5ss+Q7BORGdUcO1f2/7FY
 p0kO8OZa1suW9pGoOQf77UQ9hNWMyI429oOFsBuLYMT/L/3o8uMCiV/Unpc+1BC64WJUPBbYBxD
 5BuLS9A0TVS8dVSVMF6w668pZB8C84Xv2poEBU1yz6R6eTDF+FK4A4KwbFQxBTfn5booDdMKwfk
 xMLuwkad+6oX+bAWwEEtulR1iCQ4fre9OEtIdku9pnf+4IQwBTmoFVHEjx/QXaPFTycuW26cwkS
 1NlYlwL1GRn3p/rJbswsK8ekU/D3e6Y9YMsnMSKKiuMxiNxPfu5DtDgMNX6F/2ldjydpZqffTa+
 gH3hHbz0XjWC/s8xf5EtGtl9tO2ERRFgP7s07awO9P4NFYD+r55yjpoYU
X-Google-Smtp-Source: AGHT+IGQt4zhcJArH6o30HJl75IntEaAKyUOXg4i37WOL0jJEDPrPv4BbMBWt/Q2KxZH+6OQZBiXZg==
X-Received: by 2002:a17:907:3cc8:b0:ae6:f663:7232 with SMTP id
 a640c23a62f3a-ae701371015mr731574466b.61.1752395938613; 
 Sun, 13 Jul 2025 01:38:58 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7e90a42sm610876266b.27.2025.07.13.01.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jul 2025 01:38:58 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v8 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Sun, 13 Jul 2025 10:38:50 +0200
Message-Id: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJpwc2gC/3XQwUrEMBAG4FdZcjYySZNJ68n3EA/pZOIGsZG2F
 nXpu5suyLYSj//AfPwzFzHxmHgSD6eLGHlJU8pDCe3dSdDZDy8sUyhZaNAGUGmJUoEcM73yLLt
 GYeBIypATZeN95Jg+r9rTc8nnNM15/Lrii9qmdWdREiQgsGmZvbbwOOc3/ljSd57y/cCz2LRF/
 woWtLZHQRchmNBT9FsfVReam2AVHoWmCK6MPXVFD31dMHuhOwpm64AhRuwNgee6YHeChqNgi6B
 a6shDpL6huoA3AcEcBSyCbpwnZ0Po7T8d3F748we3XUEKKTJGNhVhXdcfpsU+mTgCAAA=
X-Change-ID: 20240612-6-10-rocket-9316defc14c7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Robert Foss <rfoss@kernel.org>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
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

This series adds a new driver for the NPU that Rockchip includes in its
newer SoCs, developed by them on the NVDLA base.

In its current form, it supports the specific NPU in the RK3588 SoC.

The userspace driver is part of Mesa and an initial draft can be found at:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
Changes in v8:
- Kconfig improvements
- Removed notion of top core, all cores are equivalent now
- Explicitly allocate DMA addresses
- Sync BOs always in both directions
- UAPI improvements
- Simplified job scheduling
- Misc. style improvements
- Link to v7: https://lore.kernel.org/r/20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net

Changes in v7:
- Actually enable process isolation by allocating its own IOMMU domain
  to each DRM client.
- Link to v6: https://lore.kernel.org/r/20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net

Changes in v6:
- Make all cores depend on pclk and npu clocks
- Fix BO sync direction logic
- Misc. cleanups
- Link to v5: https://lore.kernel.org/r/20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net

Changes in v5:
- Use bulk clk API
- Rename bindings file
- Syntax improvement to bindings
- Link to v4: https://lore.kernel.org/r/20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net

Changes in v4:
- Several fixes to DT bindings.
- Link to v3: https://lore.kernel.org/r/20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net

Changes in v3:
- Reference in the device tree only the register blocks that are
  actually used.
- Several style and robustness fixes suggested in the mailing list.
- Added patches from Nicolas Frattaroli that add support to the NPU for
  the Rock 5B board.
- Link to v2: https://lore.kernel.org/r/20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net

Changes in v2:
- Drop patch adding the rk3588 compatible to rockchip-iommu (Sebastian Reichel)
- Drop patch adding support for multiple power domains to rockchip-iommu (Sebastian Reichel)
- Link to v1: https://lore.kernel.org/r/20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net

---
Nicolas Frattaroli (2):
      arm64: dts: rockchip: add pd_npu label for RK3588 power domains
      arm64: dts: rockchip: enable NPU on ROCK 5B

Tomeu Vizoso (8):
      accel/rocket: Add registers header
      accel/rocket: Add a new driver for Rockchip's NPU
      accel/rocket: Add IOCTL for BO creation
      accel/rocket: Add job submission IOCTL
      accel/rocket: Add IOCTLs for synchronizing memory accesses
      dt-bindings: npu: rockchip,rknn: Add bindings
      arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588-base
      arm64: dts: rockchip: Enable the NPU on quartzpro64

 Documentation/accel/index.rst                      |    1 +
 Documentation/accel/rocket/index.rst               |   19 +
 .../bindings/npu/rockchip,rk3588-rknn-core.yaml    |  112 +
 MAINTAINERS                                        |   10 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   93 +-
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |   30 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi   |   57 +
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    1 +
 drivers/accel/rocket/Kconfig                       |   24 +
 drivers/accel/rocket/Makefile                      |   10 +
 drivers/accel/rocket/rocket_core.c                 |  110 +
 drivers/accel/rocket/rocket_core.h                 |   64 +
 drivers/accel/rocket/rocket_device.c               |   60 +
 drivers/accel/rocket/rocket_device.h               |   30 +
 drivers/accel/rocket/rocket_drv.c                  |  290 ++
 drivers/accel/rocket/rocket_drv.h                  |   30 +
 drivers/accel/rocket/rocket_gem.c                  |  181 +
 drivers/accel/rocket/rocket_gem.h                  |   34 +
 drivers/accel/rocket/rocket_job.c                  |  636 +++
 drivers/accel/rocket/rocket_job.h                  |   52 +
 drivers/accel/rocket/rocket_registers.h            | 4404 ++++++++++++++++++++
 include/uapi/drm/rocket_accel.h                    |  142 +
 23 files changed, 6390 insertions(+), 1 deletion(-)
---
base-commit: 156faa3ffe21347203b35a3edb6d2bcb663f429b
change-id: 20240612-6-10-rocket-9316defc14c7

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>

