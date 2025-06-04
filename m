Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CF6ACD8DE
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 09:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDAC10E03A;
	Wed,  4 Jun 2025 07:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C590310E03A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 07:57:24 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-60461fc88d7so13088512a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 00:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749023843; x=1749628643;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uxxYGGPVhEVYQnWDmi0qjryVI8On5yy5JrIx7t0q32E=;
 b=bwatpdkEsOCKcqByGXIxeX+4u18D/MZgZ4ywQjk0J8hP+vtrQwfcJ4jEpFQHxXyjwa
 WNckXciDfpPonOLgTbpfcSDhNy8LKZr04bTw/PH+gfIdqPZOEwedxbmw1QYj9UTI2seG
 rhhOA6cNOb0ZHFeVkm4afpUi+GvAnH2wlYKeE2KekQ/ClnVC7PK5qAvA1MNtje5a54Id
 csh4B/NFkvmqFd1Sca2KQiQeWPhSuZTqt7tXcuh2q3+fuRoRdl6SGRf8zonJPqJCLutA
 2AG2x7CdwFraszVXaAp2gthzfbS2guKiMsSpe2tj+tIip/6ywx4sQXPvb91uOrtVdb6w
 WlKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbW/Wt+jC88QqwN1nW7NkuoSp1fhlj1DcSd2Lz/Q9zag2f+ErI7T9sArgIwhCsTGz+i0AIiDlVCNo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxIJRuvCB+q2LOHkxPBZrXio9affnphcnhYCEzcSL05AyHKXi1
 Slj52WoWYVsy7h/MiU7e/TXD1OuuGT7XvL0RlT4QS+wskU8HPu97NM3H
X-Gm-Gg: ASbGncutVZwff3E1u6ruHZhrs5ITV+fztcnH+yvTHHs+Ny/ANRmYbW6UHcPz8NayYHI
 IWY/mi2V6h0vTbUsK5XFd/sU368WYvdy3tkccpd8KRjLUfQlgMFOtcFDO74EYsplqrtbDaWwtAH
 7ECw0R0wMqFdhVS7X5JINA2v0N64+46A8ALkxYcuKGcTHevlmN/W5u6TwhmhRG5JoHaimFD2A3s
 vHZchGWjpqvSz+fpDvQopsHHJ07bHdwonCXCXxyFVFJmCKDwyS6YRzApohFEhWglUVa20G4vmab
 Lg9nUBC0/uJ9+kwSirZi/hPhsR8MDRakI5QEkxboE2o0Q7XxHUaGhlc5+RY4WeAgahciaczM0cR
 C2LGG7KppJw==
X-Google-Smtp-Source: AGHT+IEZtmjhfMvdiTBqQ3KrjPtemiMa58uAXN8NL9Oz74jU+f3Xz3Mbx/uxfwFliJgWoAvBATYWXg==
X-Received: by 2002:a05:6402:40ca:b0:601:89d4:968e with SMTP id
 4fb4d7f45d1cf-606f0ed4379mr1469272a12.27.1749023843024; 
 Wed, 04 Jun 2025 00:57:23 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-606fb36a160sm348569a12.45.2025.06.04.00.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 00:57:22 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v6 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Wed, 04 Jun 2025 09:57:13 +0200
Message-Id: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFn8P2gC/23OwWrDMBAE0F8JOldltZaUuKf8R8lBXq0aUWoVy
 RFNg/+9cqA0pj7OwDzmJgrnyEW87G4ic40lprEF+7QTdHbjG8voWxYIqMEqlFYqkDnRO0+y75T
 1HEhp2ou2+Mwc4tddez21fI5lSvl6x6ta2m2nKgkSLLA+MDs0cJzSB19q/E4lPY88iUWr+CsYQ
 DRrAZvgtR8ouOWP2ha6P8Eouxa6Juxb7ahvuh+2Bf0o9GtBLx+sD8EOmsDxtmAeBIS1YJqgDtS
 Tg0BDR/+FeZ5/AKJhlVG0AQAA
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
 Kever Yang <kever.yang@rock-chips.com>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
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
      dt-bindings: npu: rockchip,rknn: Add bindings
      arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588-base
      arm64: dts: rockchip: Enable the NPU on quartzpro64
      accel/rocket: Add registers header
      accel/rocket: Add a new driver for Rockchip's NPU
      accel/rocket: Add IOCTL for BO creation
      accel/rocket: Add job submission IOCTL
      accel/rocket: Add IOCTLs for synchronizing memory accesses

 Documentation/accel/index.rst                      |    1 +
 Documentation/accel/rocket/index.rst               |   19 +
 .../bindings/npu/rockchip,rk3588-rknn-core.yaml    |  144 +
 MAINTAINERS                                        |   10 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   89 +-
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |   30 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |   56 +
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    1 +
 drivers/accel/rocket/Kconfig                       |   25 +
 drivers/accel/rocket/Makefile                      |   10 +
 drivers/accel/rocket/rocket_core.c                 |   80 +
 drivers/accel/rocket/rocket_core.h                 |   59 +
 drivers/accel/rocket/rocket_device.c               |   31 +
 drivers/accel/rocket/rocket_device.h               |   30 +
 drivers/accel/rocket/rocket_drv.c                  |  300 ++
 drivers/accel/rocket/rocket_drv.h                  |   17 +
 drivers/accel/rocket/rocket_gem.c                  |  208 +
 drivers/accel/rocket/rocket_gem.h                  |   31 +
 drivers/accel/rocket/rocket_job.c                  |  694 +++
 drivers/accel/rocket/rocket_job.h                  |   50 +
 drivers/accel/rocket/rocket_registers.h            | 4425 ++++++++++++++++++++
 include/uapi/drm/rocket_accel.h                    |  145 +
 23 files changed, 6455 insertions(+), 1 deletion(-)
---
base-commit: a6d708809579ed3d902465785666085ff07a1d7c
change-id: 20240612-6-10-rocket-9316defc14c7

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>

