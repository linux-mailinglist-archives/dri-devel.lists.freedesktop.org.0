Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8DCA43692
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 08:56:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF26897AC;
	Tue, 25 Feb 2025 07:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44C5897AC
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 07:55:59 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-439a2780b44so32702445e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 23:55:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740470158; x=1741074958;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CKWfJnlIU/VwviwhZqgb3CnRb75dZOnMnqdVJJtv9ws=;
 b=sQlJkSIGJrho0z2iWsypuSBcXk9pHpviQDyDB2+tKNFcMA2Giby+QcO/uGhBkhylXC
 FefS6dXvoFJS/FBEPzLgqa2LK8z3NXxGThbKdWBzMDRTOpN+7BhtqxKjGdWlJsJEKkPi
 z5kFCCcxQJTnoxN+nqBJMTlmMMC0OphzEkzBrtesaVeKKJLCXVWgUxoAdTc5KMb0aprA
 GDPwrcj8/d3Cng1lbMTb4gzskr18tcNHMJpkz6TvVxozaa0UKKkNrk2+pT7GdvSEWOwB
 8NMyww7fHh38oIyplX1HH7v6HwGfQ6YeIPrGpQ4IIxqnespsyUnkYGzyMIO/lFfOQ0uY
 BLJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIwuXkMXDSdmmw1nKdj0cFvfxYuCUVcuOl91LLH2PyKhGoVqtljH5JFdw6dADdXp+p0k2427kOJhg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPAtUkKk4uGCvHskztYwGqiO5OIv5f+90I/a59TgX0ArZP+zw+
 iLXaJwc46DJwFxlbwxGHLWD9gBDTB8ShzbIDwfXEOYd09HaRQY25
X-Gm-Gg: ASbGnctdzFGfL0tvIfw9OjTQGvkMJCJ2tbRijR1dsj0g8006wNeS2C1XMvJwoPHfQC7
 uc8uxA1D7Nw291QgQKpgcon5xnEvp5o2ppUNKStOvmOUL+wQh5GcpFuJXDHn4k8CVdUIG2y0ReR
 eQcH4+ty0is3MyoUaeqG9z0E5RaMYrLwZEaV8ueGBIqpLBSf03zhjgCc2WHFU5FyDkLRkZU5Zy6
 Oi43SZTfFB9C0MTA6glGcpHH2WhqOKFvqU0NFi3AlwuI/Jmz79qpZ/k6DRYLzbKLLOicaa2wTIE
 vCv5TAPO8Vzw13/b0NMoPsqSLChScFZfpz0u87qJZhBWY4VnugkSP7nTCw==
X-Google-Smtp-Source: AGHT+IGyKE9ou1PLve6oe1JIwGuGEar++UthHGMcf8nHUEw8AgRnWz/gHdtZb9HVpd+SBEqA45A1bg==
X-Received: by 2002:a05:600c:5115:b0:439:7b5e:820a with SMTP id
 5b1f17b1804b1-439ae1e670emr149646185e9.11.1740470158037; 
 Mon, 24 Feb 2025 23:55:58 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-37-50.cust.vodafone.cz. [46.135.37.50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f2475sm130299475e9.20.2025.02.24.23.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 23:55:56 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v2 0/7] New DRM accel driver for Rockchip's RKNN NPU
Date: Tue, 25 Feb 2025 08:55:46 +0100
Message-Id: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIJ3vWcC/23Myw7CIBCF4VdpZu2YAREvK9/DdNHQqZ0YSwNI1
 IZ3F7t2+Z/kfAtEDsIRzs0CgbNE8VMNvWnAjd10Y5S+NmjShqzSaFERBu/unPC0U7bnwSnjDlA
 fc+BBXqt2bWuPEpMP7xXP6rf+d7JCQrLE5sjc6T1dkn/wM8vHR7+dOEFbSvkC3oBjFawAAAA=
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
 Jeffrey Hugo <quic_jhugo@quicinc.com>
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
Changes in v2:
- Drop patch adding the rk3588 compatible to rockchip-iommu (Sebastian Reichel)
- Drop patch adding support for multiple power domains to rockchip-iommu (Sebastian Reichel)
- Link to v1: https://lore.kernel.org/r/20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net

---
Tomeu Vizoso (7):
      dt-bindings: npu: rockchip,rknn: Add bindings
      arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588s
      arm64: dts: rockchip: Enable the NPU on quartzpro64
      accel/rocket: Add a new driver for Rockchip's NPU
      accel/rocket: Add IOCTL for BO creation
      accel/rocket: Add job submission IOCTL
      accel/rocket: Add IOCTLs for synchronizing memory accesses

 Documentation/accel/index.rst                      |    1 +
 Documentation/accel/rocket/index.rst               |   19 +
 .../bindings/npu/rockchip,rknn-core.yaml           |  152 +
 MAINTAINERS                                        |    8 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   76 +
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |   30 +
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    1 +
 drivers/accel/rocket/Kconfig                       |   25 +
 drivers/accel/rocket/Makefile                      |   10 +
 drivers/accel/rocket/rocket_core.c                 |   77 +
 drivers/accel/rocket/rocket_core.h                 |   43 +
 drivers/accel/rocket/rocket_device.c               |   35 +
 drivers/accel/rocket/rocket_device.h               |   33 +
 drivers/accel/rocket/rocket_drv.c                  |  295 ++
 drivers/accel/rocket/rocket_drv.h                  |   17 +
 drivers/accel/rocket/rocket_gem.c                  |  216 +
 drivers/accel/rocket/rocket_gem.h                  |   32 +
 drivers/accel/rocket/rocket_job.c                  |  710 ++++
 drivers/accel/rocket/rocket_job.h                  |   50 +
 drivers/accel/rocket/rocket_registers.h            | 4425 ++++++++++++++++++++
 include/uapi/drm/rocket_accel.h                    |  116 +
 22 files changed, 6372 insertions(+)
---
base-commit: 585e191534efe95712df88a22eaa8d51228bcb43
change-id: 20240612-6-10-rocket-9316defc14c7

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>

