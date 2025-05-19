Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6141DABBF63
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 15:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3781410E2D1;
	Mon, 19 May 2025 13:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C076110E255
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 13:43:54 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-442fda876a6so28035315e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 06:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747662233; x=1748267033;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y2iDm7AFMMtjAMcYjTVMDQj0KlbNPAJT0z73iR1jFKk=;
 b=NZUvnZn6b55mD9nBBogGzdqTP8P18IRU/Hg/HzkQl/tEP1dRJn2alR75ry/LIpMnV9
 0ZcEsrCUp/7Tc6xnmO8SocvnHXVwN61V8bHZPD7PFjFVy8ujDbgvs/uHvd1xyOuJYM/A
 N9PqY0lgnCxsZ/vFM4a1Bhg0iI9NfScExlAaiMM2+0UyqrDYOvCHW1gIrVwsjSCMrenN
 z81lYtktNjvrhXCLDEZ8D/lizfU9y0/666XAHT0r1T+jMU2GYxujEQJRjKvBv5ZZoO7o
 G/VjNNMM26mU1Clr1OPPP2eyDHRiNlZVeQal9780YAgVbQgP1axYGj+8zjCgx5HppMaP
 ERhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6EbzuGcE4Zkv2FxNVIZES/2qC91CgaCnYYNjzhnAGHEwRw+S3+I1GpIJRicKSzI8c9g8dJsW5zMc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4bfZZ8KcASEL5ivhTjACRqF226NmgF+gcqG7Tch1PxE/PZCaV
 FohIiK6cnDhTp7GwZeNegy+p1yzhmfEQCS6VDT6PrvkwMcaAx0w7dKFW
X-Gm-Gg: ASbGncsKJ2RvrPD8e16XDUuogyqmpc021HOr/8u1692493rYSUO6ADJy4/rvaOO0WVf
 y+RUA6KfU1sW1iz+0Yg7OV0dVQUNH2i7HG7tZMkau1hlpg56fIhIhLQ38LDfibmQcW1Zwaz2A89
 JL1NC///yNJRsr8ino3zuvuEMJiS3frHghqkr6/sokp/MfOyMmGTwCmknfOuHxXfgKZKFhdmWit
 eaWoRnpUtKuMyATp8FYfXIVPyclGZCdEeAp2VLFXnFgfiwyVQ1zxnhdWoU1Mj5V9L8eeCKS7AJ4
 e3XpbVTpkR2cNXvivmUf7aiwnWepStgrd8kGqIE4g4hbWwcGdmTg6rKtDDEYEMHFZ9x24LN6f6i
 IBDsQYtK2Gw==
X-Google-Smtp-Source: AGHT+IGz9sr1GGSvtPUN+7MYE3oLrizZuU8xFUXM1pTYI0T7p9vNGQVR6GSJnDp0kkH0OTjmfvI/5g==
X-Received: by 2002:a05:6000:2913:b0:3a3:655e:d472 with SMTP id
 ffacd0b85a97d-3a3655ed55cmr5479104f8f.47.1747662232893; 
 Mon, 19 May 2025 06:43:52 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f8ab839esm171263005e9.17.2025.05.19.06.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 06:43:52 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v4 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Mon, 19 May 2025 15:43:32 +0200
Message-Id: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIQ1K2gC/23O0QrCIBTG8VcZXmfombrqqveILjY9axLNUJNq7
 N1zg4jRLv8fnB9nIAG9xUAOxUA8Jhus63OITUF0V/cXpNbkJsBAMMWBKsoZ9U5fMdJ9yZXBVnO
 hK5Iv7h5b+5y10zl3Z0N0/jXjiU/rupM4ZZQphmKHWINkx+hu+Ej27YLb9hjJpCX4CpIByKUAW
 TDCNLqtp3/4ulD+BMnVUiizUOW51vusm+ZfGMfxAx/82SowAQAA
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
 .../bindings/npu/rockchip,rknn-core.yaml           |  149 +
 MAINTAINERS                                        |   10 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   87 +-
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |   30 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |   56 +
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    1 +
 drivers/accel/rocket/Kconfig                       |   25 +
 drivers/accel/rocket/Makefile                      |   10 +
 drivers/accel/rocket/rocket_core.c                 |  103 +
 drivers/accel/rocket/rocket_core.h                 |   59 +
 drivers/accel/rocket/rocket_device.c               |   45 +
 drivers/accel/rocket/rocket_device.h               |   31 +
 drivers/accel/rocket/rocket_drv.c                  |  337 ++
 drivers/accel/rocket/rocket_drv.h                  |   17 +
 drivers/accel/rocket/rocket_gem.c                  |  211 +
 drivers/accel/rocket/rocket_gem.h                  |   31 +
 drivers/accel/rocket/rocket_job.c                  |  723 ++++
 drivers/accel/rocket/rocket_job.h                  |   50 +
 drivers/accel/rocket/rocket_registers.h            | 4425 ++++++++++++++++++++
 include/uapi/drm/rocket_accel.h                    |  145 +
 23 files changed, 6571 insertions(+), 1 deletion(-)
---
base-commit: a6d708809579ed3d902465785666085ff07a1d7c
change-id: 20240612-6-10-rocket-9316defc14c7

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>

