Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00914ABA116
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 18:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837AE10EB28;
	Fri, 16 May 2025 16:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B3E10EB28
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 16:53:31 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so26605695e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 09:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747414407; x=1748019207;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WjWgWtoIZo8y/TKpOs5rk2BDTL4bgGyGDJJ1PVIbYcw=;
 b=hBGWMd2NeqmSVVQefw0nGR9XlPyGBIBYX/Sq+lxxFJmzmA00XqDN9ELpGj3OocXrZZ
 lValU0kPAkivc4y0PT4OxavIsFAdBOFGYX34lpryHfF97Mim704e6Xj6oiLZ68XXVRvU
 SGSvx1jUz4wLmzlyAdPlvIPj364wGrKZFPh8F0Y+ArqOWoFt8u/ajzG3z2KVr4zV9EI5
 CdX+vF3XnozZSXi79JQ3oimUK5zCOZADz8j1Py6cLRd+XFQj7I+ziMv9/nR9IXD88nQ9
 fd4xst5VAhcpV4mMhrtUIOr9GR7dV64BzuHJNI/IX3y7gpXJIFcXyKxe/slZFrX6dOns
 30Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHVVOApSrLWm+2qYytnEnd6hRcc73PFRx937Xx+z7IS7rSDtmg3xHTxsEHXk8TJb5rOv4Z02yhv/Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+cL0cNK7azrDpjSoqF7z36TA48R9n96Sxw7db67FUsq9kEMML
 ozUXewj2cn6PZyTS3WULUd8ZgksTHr/dfgQ3aaF9NPhaeyfuCDQnK4oK
X-Gm-Gg: ASbGncv3+kret2VJy9t38ncbe6u2TiJg1aItcq/MpH3wv2IHdM8E60LWkDZQQmzIn5p
 3LHqVFNup13/oNNJnwdMUMR4iYVZPcD0TPPLTh1Z1lM6feXAaVmllNfxov8f3r5mIFBxIWQVoWd
 2ED/dk4bdjnZ3SoaEWbGpx7YDQcQmYKqpyGwUUnLyG5Y/BoHbiKRpZ4UuD6ti/W7ZQdZWGw3c08
 ol5AT/Gs1LYUYDK41zS0+dakR4StuETbY6sOGU1yEnuc8fXIhWemYuRaGt/NgLuTqXKeoQ+UcPS
 pfdib4EAEOWtKkhz1LFK9GgSD2LgG12IjA222s2xI5kUGby7XVZkG4UHCh9eLoevtvH3olR7MpP
 IOMchZxt7WAPcDfAjhlpl
X-Google-Smtp-Source: AGHT+IFKbF9gN1yX2abHe3gEHPJVfqjkBh9yk3mcerUyAXMO/v4S+hII+M7JTfdRqYHVCzhKlPw+sw==
X-Received: by 2002:a05:600c:870c:b0:439:8490:d1e5 with SMTP id
 5b1f17b1804b1-442fd268c7cmr48300955e9.4.1747414406901; 
 Fri, 16 May 2025 09:53:26 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3380498sm116511755e9.11.2025.05.16.09.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 09:53:25 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v3 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Fri, 16 May 2025 18:53:14 +0200
Message-Id: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHptJ2gC/23OTQrCMBCG4avIrI1Mpmn8WXkPcVGTqQ1iI0kMa
 undTQsuRJfvB/MwA0QOjiPsFgMEzi4635eolgswXdOfWThbGghJoZYktJAogjcXTmJbSW25NVK
 ZNZSLW+DWPWbtcCzduZh8eM54ltP638lSoECNrDbMDdW4T/7K9+xePvpVzwkmLdNHqJGo/haoC
 FbZk2mb6R/5K4zj+AY3RKj87gAAAA==
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
 .../bindings/npu/rockchip,rknn-core.yaml           |  162 +
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
 23 files changed, 6584 insertions(+), 1 deletion(-)
---
base-commit: 46bfbcd135a6df00c49cf043bf2c9c9387bc882d
change-id: 20240612-6-10-rocket-9316defc14c7

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>

