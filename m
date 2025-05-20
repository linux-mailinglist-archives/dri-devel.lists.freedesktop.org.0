Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CF0ABD49F
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 12:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F1D10E1C0;
	Tue, 20 May 2025 10:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3323510E1C0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 10:27:27 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-441ab63a415so60090385e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 03:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747736845; x=1748341645;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oTqGUV4ksLYBe+HeSSbW60q/1vjC74ZoYzWhywmrigI=;
 b=wzrAqNeU81R1DeBIXKfiGIG+NvCmPhygc/4qi10+APL900NMq4FNqt7yi+cIEAyksO
 EL7m+2ebChXTdBM/rgIj7DAW/aVXtwOw+wv7vXK58x9mFMRyQHkBpAZvTIuFUCJnq+y6
 EYas4dVkf7B3uB9OQrK8xwvCwroed99DCB54tV31jzWIzRQPl3PrxxE1oupAOl8Yu2K7
 D6zqHqZK9Ak1hIqrVZJtMoghL/dXkF93pb647it/fJVHQJL3KriOBDClYgTP6ovSBGI7
 jK0LyXi4/G8CoLZEy8q2eKiEZX2dnRFAVFbIehMOVYY9NYb3eK379XeaA7Ip6x9XP5qq
 1QuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcstx8BMeilCNFfp4YtyGmV8LJKBGNLDz6TUekQTDr9NJnKLMuuwo31Cx5LKNUjf/vF5ubItw8O6E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwTJmttpB3orb+UTCYENTFH38MLmPWiAAS2k6Qt5PfLJOr80O3
 dUrYYu4ef+uGjfvTaHoO7dOYFOvBkj03GrQ7XzCpT40mLi/wsOduqlUa
X-Gm-Gg: ASbGncsWss//3uAezuI3U8MrkHGswJxriHXxmpa2sF9S8oPQikxvo2LJvJk/TDMrIup
 DeMpqpYiAjnJFxiyORHhJ2uIbChlNeB+r0RMLO2TzFX8Hm0n4FE3ptklIbqV5UhB6Gecsl6/2ih
 Rn42mBKpl3ft3prK52tMJylNeG+45oo6hrS7ZeHZvhzacYgb5mfFCRcoQQIb1b8B+j2dv7ZgLMe
 AwQNpyXd+OF4sAlCCvrNO3Jhx9gMP0T7AvCcfEZ2mq05agG7t3Z1we3WCLXJRvyl/J7jyon9e1S
 Qc7Rh4m7fUr4ekN9Te/DEJkIQ/PQtu0PfCQySqiUmbAhi5StmT0ZDkxuu37+8E6ohewBfIPdCrU
 u+rXI0MZguA==
X-Google-Smtp-Source: AGHT+IGQIlUJcRyY3tl7EezqGJ1tIgqTCFM3lHfZujGm8AzrqDj+5VJitvVUKwA4G018r4RFcqgl6Q==
X-Received: by 2002:a05:600c:6748:b0:442:e011:7eb with SMTP id
 5b1f17b1804b1-442fd671befmr186270545e9.30.1747736845139; 
 Tue, 20 May 2025 03:27:25 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f73d3defsm24680025e9.18.2025.05.20.03.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 03:27:24 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v5 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Tue, 20 May 2025 12:26:53 +0200
Message-Id: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO5YLGgC/23O0QrCIBgF4FcJrzN+nVrrqveILpz+lkQzdEk19
 u65IGq0y3PgfJyeJIweE9kuehIx++RDW4JcLog56faI1NuSCQcuQDFOFWVAYzBn7GhdMWXRGSb
 MmpTFNaLz97e2P5R88qkL8fHGMxvbeSczChQUoNggai5h14UL3rJ/hhRWLXZk1DL/CBI4l1OBF
 8EK2xinxz9sXqi+gmRqKlRFWJdam7rotpkXxK9QTwUxflDWOdUIAxr/hWEYXhZ3XKNyAQAA
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
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
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
      arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588s
      arm64: dts: rockchip: Enable the NPU on quartzpro64
      accel/rocket: Add registers header
      accel/rocket: Add a new driver for Rockchip's NPU
      accel/rocket: Add IOCTL for BO creation
      accel/rocket: Add job submission IOCTL
      accel/rocket: Add IOCTLs for synchronizing memory accesses

 Documentation/accel/index.rst                      |    1 +
 Documentation/accel/rocket/index.rst               |   25 +
 .../bindings/npu/rockchip,rk3588-rknn-core.yaml    |  147 +
 MAINTAINERS                                        |   10 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   87 +-
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |   30 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |   56 +
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    1 +
 drivers/accel/rocket/Kconfig                       |   25 +
 drivers/accel/rocket/Makefile                      |   10 +
 drivers/accel/rocket/rocket_core.c                 |   80 +
 drivers/accel/rocket/rocket_core.h                 |   59 +
 drivers/accel/rocket/rocket_device.c               |   36 +
 drivers/accel/rocket/rocket_device.h               |   31 +
 drivers/accel/rocket/rocket_drv.c                  |  316 ++
 drivers/accel/rocket/rocket_drv.h                  |   17 +
 drivers/accel/rocket/rocket_gem.c                  |  211 +
 drivers/accel/rocket/rocket_gem.h                  |   31 +
 drivers/accel/rocket/rocket_job.c                  |  723 ++++
 drivers/accel/rocket/rocket_job.h                  |   50 +
 drivers/accel/rocket/rocket_registers.h            | 4425 ++++++++++++++++++++
 include/uapi/drm/rocket_accel.h                    |  145 +
 23 files changed, 6516 insertions(+), 1 deletion(-)
---
base-commit: a6d708809579ed3d902465785666085ff07a1d7c
change-id: 20240612-6-10-rocket-9316defc14c7

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>

