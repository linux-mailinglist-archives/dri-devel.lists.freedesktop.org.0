Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6C556BE8A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377DA10EB6C;
	Fri,  8 Jul 2022 18:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C61E10EB5D
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:11:39 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id sb34so38920064ejc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 11:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sKekwu6m5vtQW6PSsmPF+hhuEPf3m/e/qMg3BM7xWQw=;
 b=UlPIo/7zkJHh9tSf+BQmQW/kdRIa+hP/tDZ22WYRFIM3hv/yrOYRXPpT5Cc0yWEHSr
 UmdI3/8QBRBITlRWviW+Ln30yOfraZa5/HOjcSz1+IiDAtJ+1oNAEjwNTEKAWJrZFn8G
 U0aoVv/8dIur3fMWz5B6S634ilslx8HnaPlloUx/3qAeX61zBbQ9QszK/gzGuTczO4Nv
 r14Zdda+xpF001A6Cml6DsFmdA6waOw+ZXqTJoI4gb+ZN4gsEg40+KvJUWZM4/vw5bya
 qvJD92dyC3cPivgeN5p7ptFcTZb2cIbgUZlt5ZG8OntvvWl2/YFQA218PsVkyoVrW44I
 jy6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sKekwu6m5vtQW6PSsmPF+hhuEPf3m/e/qMg3BM7xWQw=;
 b=If9QzGku6RCVqjongn2HNbi6N9CZ1+sG6Tb7VFAJwsHDB4kdAo94DWZ+sONS80YdXI
 G7lBy0lsPdH3ExaQ8BwvnPIx2epSKQnktGfnwfSTJ55lj7nDs/UBilMjrN6kmJOdPb+F
 OjoQm1+wbkUGLk9EfLGFI7PfmM18rn9xqopYX/ejoqBCr+YTYzFg0Z9moE45bNajSPkp
 9j74K83EU/Ybjau5IGbRHMq1AlVPV20dQy2rXqwSlgc6w/AkjIWBfHMtYtUjeSEjlIp9
 XajzXu+JwHQOlnQMlrTAlpoktx0cL47rvR/f45vRexAO0beSBnQBzgyACPRSvTqEppfM
 bhaQ==
X-Gm-Message-State: AJIora++SHmXDbbrCFSHZLVyVMyuGlEPy7C07cb7uJPh3uOkFR4XfIa/
 9Lfh8p3nEhiBl7BPFpL4heg=
X-Google-Smtp-Source: AGRyM1t8yFGgmwwWr6T5GslV5qgxQX0W2tfRRaFMWJMQiIDaqUY+XIBbggGcvKxKzvlEFP/Ugvk/7A==
X-Received: by 2002:a17:906:6c82:b0:709:f868:97f6 with SMTP id
 s2-20020a1709066c8200b00709f86897f6mr4831133ejr.555.1657303898095; 
 Fri, 08 Jul 2022 11:11:38 -0700 (PDT)
Received: from localhost
 (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a170906a19600b0071cef8bafc3sm20606206ejy.1.2022.07.08.11.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 11:11:37 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL] drm/tegra: Changes for v5.20-rc1
Date: Fri,  8 Jul 2022 20:11:36 +0200
Message-Id: <20220708181136.673789-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-5.20-rc1

for you to fetch changes up to 135f4c551d51065ee2d0677bf5344a89767e9d9b:

  drm/tegra: vic: Use devm_platform_ioremap_resource() (2022-07-08 17:54:42 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.20-rc1

The bulk of these changes adds support for context isolation for the
various supported host1x engines, as well as support for the hardware
found on the new Tegra234 SoC generation.

There's also a couple of fixes and cleanups. To round things off, the
device tree bindings are converted to the new json-schema format that
allows DTBs to be validated.

----------------------------------------------------------------
Christophe JAILLET (1):
      gpu: host1x: Use the bitmap API to allocate bitmaps

Dmitry Osipenko (1):
      drm/tegra: Fix vmapping of prime buffers

Lukas Bulwahn (1):
      MAINTAINERS: Rectify entry for NVIDIA TEGRA DRM and VIDEO DRIVER

Lv Ruyi (1):
      drm/tegra: vic: Use devm_platform_ioremap_resource()

Mikko Perttunen (21):
      dt-bindings: host1x: Add iommu-map property
      dt-bindings: Add bindings for Tegra234 Host1x and VIC
      dt-bindings: host1x: Fix bracketing in example
      gpu: host1x: Add context device management code
      gpu: host1x: Program context stream ID on submission
      drm/tegra: falcon: Set DMACTX field on DMA transactions
      drm/tegra: nvdec: Fix TRANSCFG register offset
      drm/tegra: Support context isolation
      drm/tegra: Implement stream ID related callbacks on engines
      gpu: host1x: Deduplicate hardware headers
      gpu: host1x: Simplify register mapping and add common aperture
      gpu: host1x: Program virtualization tables
      gpu: host1x: Allow reset to be missing
      gpu: host1x: Program interrupt destinations on Tegra234
      gpu: host1x: Tegra234 device data and headers
      gpu: host1x: Rewrite job opcode sequence
      gpu: host1x: Add MLOCK release code on Tegra234
      gpu: host1x: Use RESTART_W to skip timed out jobs on Tegra186+
      drm/tegra: vic: Add Tegra234 support
      gpu: host1x: Initialize syncval in channel_submit()
      gpu: host1x: Generalize host1x_cdma_push_wide()

Robin Murphy (2):
      gpu: host1x: Register context bus unconditionally
      drm/tegra: Include DMA API header where used

Thierry Reding (1):
      dt-bindings: display: tegra: Convert to json-schema

YueHaibing (1):
      drm/tegra: vic: Fix build warning when CONFIG_PM=n

 .../display/tegra/nvidia,tegra114-mipi.txt         |  41 --
 .../display/tegra/nvidia,tegra114-mipi.yaml        |  74 +++
 .../display/tegra/nvidia,tegra124-dpaux.yaml       | 152 +++++
 .../display/tegra/nvidia,tegra124-sor.yaml         | 197 ++++++
 .../display/tegra/nvidia,tegra124-vic.yaml         |  72 +++
 .../bindings/display/tegra/nvidia,tegra186-dc.yaml |  85 +++
 .../display/tegra/nvidia,tegra186-display.yaml     | 310 ++++++++++
 .../display/tegra/nvidia,tegra186-dsi-padctl.yaml  |  45 ++
 .../bindings/display/tegra/nvidia,tegra20-dc.yaml  | 183 ++++++
 .../bindings/display/tegra/nvidia,tegra20-dsi.yaml | 159 +++++
 .../bindings/display/tegra/nvidia,tegra20-epp.yaml |  70 +++
 .../display/tegra/nvidia,tegra20-gr2d.yaml         |  74 +++
 .../display/tegra/nvidia,tegra20-gr3d.yaml         | 215 +++++++
 .../display/tegra/nvidia,tegra20-hdmi.yaml         | 126 ++++
 .../display/tegra/nvidia,tegra20-host1x.txt        | 675 ---------------------
 .../display/tegra/nvidia,tegra20-host1x.yaml       | 431 +++++++++++++
 .../bindings/display/tegra/nvidia,tegra20-isp.yaml |  67 ++
 .../bindings/display/tegra/nvidia,tegra20-mpe.yaml |  73 +++
 .../bindings/display/tegra/nvidia,tegra20-tvo.yaml |  58 ++
 .../bindings/display/tegra/nvidia,tegra20-vi.yaml  | 163 +++++
 .../display/tegra/nvidia,tegra210-csi.yaml         |  52 ++
 .../pinctrl/nvidia,tegra124-dpaux-padctl.txt       |  59 --
 MAINTAINERS                                        |   4 +-
 drivers/gpu/drm/tegra/dc.c                         |   1 +
 drivers/gpu/drm/tegra/drm.c                        |   1 +
 drivers/gpu/drm/tegra/drm.h                        |  11 +
 drivers/gpu/drm/tegra/falcon.c                     |   8 +
 drivers/gpu/drm/tegra/falcon.h                     |   1 +
 drivers/gpu/drm/tegra/gem.c                        |  11 +-
 drivers/gpu/drm/tegra/hub.c                        |   1 +
 drivers/gpu/drm/tegra/nvdec.c                      |  14 +-
 drivers/gpu/drm/tegra/plane.c                      |   1 +
 drivers/gpu/drm/tegra/submit.c                     |  48 +-
 drivers/gpu/drm/tegra/uapi.c                       |  43 +-
 drivers/gpu/drm/tegra/vic.c                        |  92 ++-
 drivers/gpu/host1x/Makefile                        |   6 +-
 drivers/gpu/host1x/cdma.c                          |  43 +-
 drivers/gpu/host1x/channel.c                       |   8 +-
 drivers/gpu/host1x/context.c                       | 160 +++++
 drivers/gpu/host1x/context.h                       |  38 ++
 drivers/gpu/host1x/context_bus.c                   |   5 -
 drivers/gpu/host1x/dev.c                           | 124 ++--
 drivers/gpu/host1x/dev.h                           |  13 +
 drivers/gpu/host1x/hw/cdma_hw.c                    |  34 ++
 drivers/gpu/host1x/hw/channel_hw.c                 | 137 ++++-
 drivers/gpu/host1x/hw/host1x01_hardware.h          | 114 +---
 drivers/gpu/host1x/hw/host1x02_hardware.h          | 113 +---
 drivers/gpu/host1x/hw/host1x04_hardware.h          | 113 +---
 drivers/gpu/host1x/hw/host1x05_hardware.h          | 113 +---
 drivers/gpu/host1x/hw/host1x06_hardware.h          | 118 +---
 drivers/gpu/host1x/hw/host1x07_hardware.h          | 118 +---
 drivers/gpu/host1x/hw/host1x08.c                   |  33 +
 drivers/gpu/host1x/hw/host1x08.h                   |  15 +
 drivers/gpu/host1x/hw/host1x08_hardware.h          |  21 +
 drivers/gpu/host1x/hw/hw_host1x08_channel.h        |  11 +
 drivers/gpu/host1x/hw/hw_host1x08_common.h         |  11 +
 drivers/gpu/host1x/hw/hw_host1x08_hypervisor.h     |   9 +
 drivers/gpu/host1x/hw/hw_host1x08_uclass.h         | 181 ++++++
 drivers/gpu/host1x/hw/hw_host1x08_vm.h             |  36 ++
 drivers/gpu/host1x/hw/intr_hw.c                    |  11 +
 drivers/gpu/host1x/hw/opcodes.h                    | 150 +++++
 include/linux/host1x.h                             |  42 ++
 62 files changed, 3815 insertions(+), 1579 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.txt
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-dpaux.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dsi-padctl.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-epp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-tvo.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt
 create mode 100644 drivers/gpu/host1x/context.c
 create mode 100644 drivers/gpu/host1x/context.h
 create mode 100644 drivers/gpu/host1x/hw/host1x08.c
 create mode 100644 drivers/gpu/host1x/hw/host1x08.h
 create mode 100644 drivers/gpu/host1x/hw/host1x08_hardware.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_channel.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_common.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_hypervisor.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_uclass.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_vm.h
 create mode 100644 drivers/gpu/host1x/hw/opcodes.h
