Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B379974B9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 20:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD1F10E7BB;
	Wed,  9 Oct 2024 18:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gu9rQWdh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E99C10E15C;
 Wed,  9 Oct 2024 18:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728497832; x=1760033832;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=8hR0lzjL3qP3MTtoX5wrml4Hm9YW+mS+SKQGxo8HBKc=;
 b=Gu9rQWdhfN6T3tH5az4dbLWP7c6OsMXMAarwgWV1vEqMSGoXjI3ADPjV
 ISD6Yys4Wan3ubwBAim5fzG3hKSNKuyz4WkF1/NVLlwsY5K10rlcZw+aL
 QHcZyvtezWnvm0OOS8cVZKfo+xGfQzKLf4SHXOu65fA+iv9v3XjOKvEwA
 hXBYvq5y1xEaIUVpZeuoIdUZpU15OuEb+qnb2uYZu+fC+Zq0Px9wEL1sW
 GP9yg8q178pGl0T0vFfJH7jBiSmZldUZbTCbYDcUZZFC9aB6VW3Gkp+LG
 rSXashQjXb0MCho/S6Gp/0dMhFY4ZaP6lDTl69dG1KAz0AyqYq+rWTRr6 Q==;
X-CSE-ConnectionGUID: 8J0yG2bhQYKVA+Ag/rlovg==
X-CSE-MsgGUID: pL54i+PqTFOldUx7amTKzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27978795"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="27978795"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 11:17:12 -0700
X-CSE-ConnectionGUID: 4GOjlJE9QhWYePYuUFVZvg==
X-CSE-MsgGUID: QUw0UGjxSo6Kkw50PKFSKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="113821891"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.244.143])
 ([10.245.244.143])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 11:17:06 -0700
Message-ID: <8dc111ca-d20c-4e0d-856e-c12d208cbf2a@linux.intel.com>
Date: Wed, 9 Oct 2024 20:17:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PULL] drm-misc-next
Content-Language: en-US
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

Hi Dave, Simona,

Here's drm-misc-next for v6.13!

drm-misc-next-2024-10-09:
drm-misc-next for v6.13:

UAPI Changes:
- Add drm fdinfo support to panthor, and add sysfs knob to toggle.

Cross-subsystem Changes:
- Convert fbdev drivers to use backlight power constants.
- Some small dma-fence fixes.
- Some kernel-doc fixes.

Core Changes:
- Small drm client fixes.
- Document requirements that you need to file a bug before marking a test as flaky.
- Remove swapped and pinned bo's from TTM lru list.

Driver Changes:
- Assorted small fixes to panel/elida-kd35t133, nouveau, vc4, imx.
- Fix some bridges to drop cached edids on power off.
- Add Jenson BL-JT60050-01A, Samsung s6e3ha8 & AMS639RQ08 panels.
- Make 180° rotation work on ilitek-ili9881c, even for already-rotated
  panels.
-
The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2024-10-09

for you to fetch changes up to 4c93ede2b0c73a7708f46a01669769d15d31e1d2:

  drm: Fix for kernel doc warning (2024-10-09 18:31:38 +0300)

----------------------------------------------------------------
drm-misc-next for v6.13:

UAPI Changes:
- Add drm fdinfo support to panthor, and add sysfs knob to toggle.

Cross-subsystem Changes:
- Convert fbdev drivers to use backlight power constants.
- Some small dma-fence fixes.
- Some kernel-doc fixes.

Core Changes:
- Small drm client fixes.
- Document requirements that you need to file a bug before marking a test as flaky.
- Remove swapped and pinned bo's from TTM lru list.

Driver Changes:
- Assorted small fixes to panel/elida-kd35t133, nouveau, vc4, imx.
- Fix some bridges to drop cached edids on power off.
- Add Jenson BL-JT60050-01A, Samsung s6e3ha8 & AMS639RQ08 panels.
- Make 180° rotation work on ilitek-ili9881c, even for already-rotated
  panels.
-

----------------------------------------------------------------
Adrián Larumbe (5):
      drm/panthor: introduce job cycle and timestamp accounting
      drm/panthor: record current and maximum device clock frequencies
      drm/panthor: add DRM fdinfo support
      drm/panthor: enable fdinfo for memory stats
      drm/panthor: add sysfs knob for enabling job profiling

Benjamin Szőke (1):
      drm/nouveau/i2c: rename aux.c and aux.h to auxch.c and auxch.h

Christian König (3):
      dma-buf: add WARN_ON() illegal dma-fence signaling
      dma-buf/sw_sync: remove pointless enable_signaling implementation
      drm/writeback: remove pointless enable_signaling implementation

Danila Tikhonov (2):
      dt-bindings: display: panel: Add Samsung AMS639RQ08
      drm/panel: Add Samsung AMS639RQ08 panel driver

Dave Stevenson (4):
      drm/vc4: Run default client setup for all variants.
      drm/vc4: Match drm_dev_enter and exit calls in vc4_hvs_lut_load
      drm/vc4: Match drm_dev_enter and exit calls in vc4_hvs_atomic_flush
      drm/vc4: Correct generation check in vc4_hvs_lut_load

Dzmitry Sankouski (3):
      drm/mipi-dsi: add mipi_dsi_compression_mode_multi
      dt-bindings: panel: add Samsung s6e3ha8
      drm/panel: Add support for S6E3HA8 panel driver

Frieder Schrempf (2):
      dt-bindings: vendor-prefixes: Add Jenson Display
      dt-bindings: display: panel-lvds: Add compatible for Jenson BL-JT60050-01A

Hugo Villeneuve (1):
      drm: panel: jd9365da-h3: Remove unused num_init_cmds structure member

Jani Nikula (2):
      drm/file: fix client_name_lock kernel-doc warning
      drm/imx: add forward declarations for types

Maíra Canal (1):
      drm/vc4: Use `vc4_perfmon_find()`

Philipp Zabel (2):
      drm/panel: ilitek-ili9881c: Explicitly set address mode, allow 180° rotation
      drm/panel: ilitek-ili9881c: Report subpixel order according to rotation

Pierre-Eric Pelloux-Prayer (2):
      drm: add DRM_SET_CLIENT_NAME ioctl
      drm: use drm_file client_name in fdinfo

Pin-yen Lin (2):
      drm/bridge: anx7625: Drop EDID cache on bridge power off
      drm/bridge: it6505: Drop EDID cache on bridge power off

R Sundar (1):
      drm: Fix for kernel doc warning

Tejas Vipin (1):
      drm/panel: elida-kd35t133: transition to mipi_dsi wrapped functions

Thomas Hellström (2):
      drm/ttm: Move swapped objects off the manager's LRU list
      drm/ttm: Move pinned objects off LRU lists when pinning

Thomas Zimmermann (10):
      Merge drm/drm-next into drm-misc-next
      fbdev: atmel_lcdfb: Use backlight power constants
      fbdev: aty128fb: Use backlight power constants
      fbdev: atyfb: Use backlight power constants
      fbdev: chipsfb: Use backlight power constants
      fbdev: nvidiafb: Use backlight power constants
      fbdev: omapfb: Use backlight power constants
      fbdev: radeonfb: Use backlight power constants
      fbdev: rivafb: Use backlight power constants
      fbdev: sh_mobile_lcdc_fb: Use backlight power constants

Vignesh Raman (1):
      docs/gpu: ci: update flake tests requirements

Ville Syrjälä (3):
      drm/client: s/drm_connector_has_preferred_mode/drm_connector_preferred_mode/
      drm/client: Use drm_mode_destroy()
      drm/client: Extract drm_connector_first_mode()

 .../ABI/testing/sysfs-driver-panthor-profiling     |  10 +
 .../bindings/display/bridge/ti,tdp158.yaml         |  57 +++
 .../bindings/display/imx/fsl-imx-drm.txt           |   2 -
 .../devicetree/bindings/display/imx/ldb.txt        |   1 -
 .../bindings/display/panel/panel-lvds.yaml         |   2 +
 .../bindings/display/panel/samsung,ams639rq08.yaml |  80 ++++
 .../bindings/display/panel/samsung,s6e3ha8.yaml    |  75 ++++
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/gpu/automated_testing.rst            |  14 +-
 Documentation/gpu/drm-uapi.rst                     |  27 +-
 Documentation/gpu/drm-usage-stats.rst              |   5 +
 Documentation/gpu/panthor.rst                      |  46 +++
 Documentation/gpu/todo.rst                         |  16 +
 MAINTAINERS                                        |   9 +-
 drivers/accel/ivpu/vpu_boot_api.h                  |   2 +-
 drivers/accel/qaic/qaic_debugfs.c                  |  43 +--
 drivers/dma-buf/Kconfig                            |   1 +
 drivers/dma-buf/dma-buf.c                          |  15 +-
 drivers/dma-buf/dma-fence.c                        |  10 +-
 drivers/dma-buf/heaps/cma_heap.c                   |   4 +-
 drivers/dma-buf/heaps/system_heap.c                |   2 +-
 drivers/dma-buf/sw_sync.c                          |   6 -
 drivers/dma-buf/udmabuf.c                          | 283 ++++++++------
 drivers/gpu/drm/Kconfig                            |  13 +
 drivers/gpu/drm/Makefile                           |   8 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |   2 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   2 +-
 drivers/gpu/drm/arm/Kconfig                        |   2 +
 drivers/gpu/drm/arm/display/Kconfig                |   1 +
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c    |   4 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |   2 +
 drivers/gpu/drm/arm/hdlcd_drv.c                    |   4 +-
 drivers/gpu/drm/arm/malidp_drv.c                   |   4 +-
 drivers/gpu/drm/armada/Kconfig                     |   1 +
 drivers/gpu/drm/armada/armada_drm.h                |  11 +-
 drivers/gpu/drm/armada/armada_drv.c                |   4 +-
 drivers/gpu/drm/armada/armada_fbdev.c              | 113 +-----
 drivers/gpu/drm/aspeed/Kconfig                     |   1 +
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |   4 +-
 drivers/gpu/drm/ast/Kconfig                        |   1 +
 drivers/gpu/drm/ast/ast_dp.c                       | 137 +++----
 drivers/gpu/drm/ast/ast_dp501.c                    | 111 +++---
 drivers/gpu/drm/ast/ast_drv.c                      |   8 +-
 drivers/gpu/drm/ast/ast_drv.h                      |  19 +-
 drivers/gpu/drm/ast/ast_main.c                     |  67 ++--
 drivers/gpu/drm/ast/ast_mode.c                     |  34 +-
 drivers/gpu/drm/ast/ast_post.c                     |  36 +-
 drivers/gpu/drm/ast/ast_reg.h                      |  41 +--
 drivers/gpu/drm/ast/ast_sil164.c                   |  59 ++-
 drivers/gpu/drm/ast/ast_vga.c                      |  59 ++-
 drivers/gpu/drm/atmel-hlcdc/Kconfig                |   1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |   5 +-
 drivers/gpu/drm/bridge/Kconfig                     |   7 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   2 +
 drivers/gpu/drm/bridge/imx/Kconfig                 |  10 +
 drivers/gpu/drm/bridge/imx/Makefile                |   1 +
 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c     |  87 +++++
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c        |  20 +-
 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c            |   9 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |   9 +-
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |   9 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |   3 +
 drivers/gpu/drm/bridge/samsung-dsim.c              |   8 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c      |   8 +-
 drivers/gpu/drm/bridge/tc358767.c                  |  56 +--
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   4 +-
 drivers/gpu/drm/bridge/ti-tdp158.c                 | 111 ++++++
 drivers/gpu/drm/ci/gitlab-ci.yml                   |  14 +-
 drivers/gpu/drm/ci/image-tags.yml                  |   2 +-
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt  |   2 +-
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt |   7 +
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt      |   2 +-
 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt     |   7 +
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt       |   1 -
 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt      |   7 +
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt       |  10 +-
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt      |  14 +
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt       |   1 +
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt       |   2 -
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt       |  34 +-
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt       |   9 +-
 .../gpu/drm/ci/xfails/mediatek-mt8173-fails.txt    |  11 +-
 .../gpu/drm/ci/xfails/mediatek-mt8183-fails.txt    |   6 -
 drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt     |   1 -
 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt    |   5 -
 drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt    |   5 -
 .../xfails/msm-sc7180-trogdor-kingoftown-fails.txt |  27 --
 .../msm-sc7180-trogdor-lazor-limozeen-fails.txt    |  27 --
 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt     |   6 +-
 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt    |  14 +
 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt     |   5 +
 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt  |   1 +
 .../gpu/drm/ci/xfails/panfrost-mt8183-fails.txt    |   1 +
 .../gpu/drm/ci/xfails/panfrost-rk3288-fails.txt    |   1 +
 .../gpu/drm/ci/xfails/panfrost-rk3399-fails.txt    |   1 +
 .../gpu/drm/ci/xfails/rockchip-rk3288-fails.txt    |  22 +-
 .../gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt   |  28 ++
 .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt    |   7 -
 .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt   |  28 ++
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt      |  21 --
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt      |  53 +++
 drivers/gpu/drm/display/Kconfig                    |   6 +
 drivers/gpu/drm/display/Makefile                   |   5 +-
 drivers/gpu/drm/drm_atomic_helper.c                |   2 +-
 drivers/gpu/drm/drm_client_modeset.c               |  28 +-
 drivers/gpu/drm/drm_client_setup.c                 |  66 ++++
 drivers/gpu/drm/drm_debugfs.c                      |  14 +-
 drivers/gpu/drm/drm_fb_helper.c                    | 102 ++----
 drivers/gpu/drm/drm_fbdev_client.c                 | 141 +++++++
 drivers/gpu/drm/drm_fbdev_dma.c                    | 170 ++-------
 drivers/gpu/drm/drm_fbdev_shmem.c                  | 170 ++-------
 drivers/gpu/drm/drm_fbdev_ttm.c                    | 237 ++++--------
 drivers/gpu/drm/drm_file.c                         |  10 +
 drivers/gpu/drm/drm_fourcc.c                       |  30 +-
 drivers/gpu/drm/drm_framebuffer.c                  |   2 +
 drivers/gpu/drm/drm_gem.c                          |  52 ++-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |  30 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |  45 ---
 drivers/gpu/drm/drm_ioctl.c                        |  51 +++
 drivers/gpu/drm/drm_mipi_dsi.c                     |  16 +
 drivers/gpu/drm/drm_mm.c                           |   4 +-
 drivers/gpu/drm/drm_mode_object.c                  |   1 +
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |  18 +
 drivers/gpu/drm/drm_writeback.c                    |   6 -
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |   2 +-
 drivers/gpu/drm/exynos/Kconfig                     |   1 +
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |  99 +----
 drivers/gpu/drm/exynos/exynos_drm_fbdev.h          |  15 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c               |  25 +-
 drivers/gpu/drm/fsl-dcu/Kconfig                    |   1 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |   4 +-
 drivers/gpu/drm/gma500/Kconfig                     |   1 +
 drivers/gpu/drm/gma500/fbdev.c                     | 100 +----
 drivers/gpu/drm/gma500/psb_drv.c                   |   4 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |  12 +-
 drivers/gpu/drm/gud/Kconfig                        |   1 +
 drivers/gpu/drm/gud/gud_drv.c                      |   4 +-
 drivers/gpu/drm/hisilicon/hibmc/Kconfig            |   1 +
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |   4 +-
 drivers/gpu/drm/hisilicon/kirin/Kconfig            |   1 +
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |   2 +
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |   4 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |   4 +-
 drivers/gpu/drm/i915/Kconfig                       |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c         |   4 +-
 drivers/gpu/drm/imagination/pvr_ccb.c              |   2 +-
 drivers/gpu/drm/imagination/pvr_context.c          |  18 +-
 drivers/gpu/drm/imagination/pvr_drv.c              |   2 +-
 drivers/gpu/drm/imagination/pvr_job.c              |  13 +-
 drivers/gpu/drm/imagination/pvr_queue.c            |   4 +-
 drivers/gpu/drm/imagination/pvr_vm.c               |   4 +-
 drivers/gpu/drm/imx/dcss/Kconfig                   |   1 +
 drivers/gpu/drm/imx/dcss/dcss-crtc.c               |   6 +-
 drivers/gpu/drm/imx/dcss/dcss-dtg.c                |   4 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |   4 +-
 drivers/gpu/drm/imx/ipuv3/Kconfig                  |  13 +-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |  11 +-
 drivers/gpu/drm/imx/ipuv3/imx-drm.h                |  14 -
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c                | 203 +++-------
 drivers/gpu/drm/imx/ipuv3/imx-tve.c                |   8 +-
 drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c             |   6 +-
 drivers/gpu/drm/imx/ipuv3/parallel-display.c       | 139 ++-----
 drivers/gpu/drm/imx/lcdc/Kconfig                   |   1 +
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c                |   4 +-
 drivers/gpu/drm/ingenic/Kconfig                    |   1 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   4 +-
 drivers/gpu/drm/kmb/Kconfig                        |   1 +
 drivers/gpu/drm/kmb/kmb_drv.c                      |   4 +-
 drivers/gpu/drm/kmb/kmb_dsi.c                      |   4 +-
 drivers/gpu/drm/lima/lima_sched.c                  |   2 +-
 drivers/gpu/drm/logicvc/Kconfig                    |   1 +
 drivers/gpu/drm/logicvc/logicvc_drm.c              |  16 +-
 drivers/gpu/drm/loongson/Kconfig                   |   1 +
 drivers/gpu/drm/loongson/lsdc_drv.c                |   4 +-
 drivers/gpu/drm/mcde/Kconfig                       |   1 +
 drivers/gpu/drm/mcde/mcde_drv.c                    |   5 +-
 drivers/gpu/drm/mediatek/Kconfig                   |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   4 +-
 drivers/gpu/drm/meson/Kconfig                      |   1 +
 drivers/gpu/drm/meson/meson_drv.c                  |   4 +-
 drivers/gpu/drm/mgag200/Kconfig                    |   3 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |   5 +-
 drivers/gpu/drm/msm/Kconfig                        |   3 +
 drivers/gpu/drm/msm/msm_drv.c                      |   4 +-
 drivers/gpu/drm/msm/msm_drv.h                      |  13 +-
 drivers/gpu/drm/msm/msm_fbdev.c                    | 144 ++------
 drivers/gpu/drm/mxsfb/Kconfig                      |   2 +
 drivers/gpu/drm/mxsfb/lcdif_drv.c                  |   4 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |   4 +-
 drivers/gpu/drm/nouveau/Kconfig                    |   1 +
 drivers/gpu/drm/nouveau/nouveau_connector.c        |   5 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |  10 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c            |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c |   4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild     |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c  |   2 +-
 .../drm/nouveau/nvkm/subdev/i2c/{aux.c => auxch.c} |   2 +-
 .../drm/nouveau/nvkm/subdev/i2c/{aux.h => auxch.h} |   0
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c   |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c     |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c   |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c    |   2 +-
 drivers/gpu/drm/omapdrm/Kconfig                    |   1 +
 drivers/gpu/drm/omapdrm/dss/base.c                 |  25 +-
 drivers/gpu/drm/omapdrm/dss/omapdss.h              |   3 +-
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c           |   6 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |   5 +-
 drivers/gpu/drm/omapdrm/omap_drv.h                 |   3 +
 drivers/gpu/drm/omapdrm/omap_fbdev.c               | 161 +++-----
 drivers/gpu/drm/omapdrm/omap_fbdev.h               |   8 +
 drivers/gpu/drm/omapdrm/omap_gem.c                 |  10 +-
 drivers/gpu/drm/panel/Kconfig                      |  22 +-
 drivers/gpu/drm/panel/Makefile                     |   2 +
 drivers/gpu/drm/panel/panel-elida-kd35t133.c       | 114 +++---
 drivers/gpu/drm/panel/panel-himax-hx83112a.c       | 291 +++++++--------
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       | 210 +----------
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |  23 +-
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   |   1 -
 drivers/gpu/drm/panel/panel-khadas-ts050.c         |   4 +-
 drivers/gpu/drm/panel/panel-novatek-nt35510.c      |  15 +-
 drivers/gpu/drm/panel/panel-novatek-nt36523.c      |  16 +-
 drivers/gpu/drm/panel/panel-raydium-rm69380.c      |  87 ++---
 drivers/gpu/drm/panel/panel-samsung-ams639rq08.c   | 329 +++++++++++++++++
 drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c      |  71 ++--
 drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c      | 342 +++++++++++++++++
 drivers/gpu/drm/panel/panel-sony-acx565akm.c       |   3 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |  45 ++-
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |  12 +
 drivers/gpu/drm/panfrost/panfrost_gpu.h            |   1 +
 drivers/gpu/drm/panfrost/panfrost_job.c            |  30 +-
 drivers/gpu/drm/panfrost/panfrost_regs.h           |   2 +
 drivers/gpu/drm/panthor/panthor_devfreq.c          |  18 +-
 drivers/gpu/drm/panthor/panthor_device.h           |  36 ++
 drivers/gpu/drm/panthor/panthor_drv.c              | 175 ++++++++-
 drivers/gpu/drm/panthor/panthor_fw.c               |  57 ++-
 drivers/gpu/drm/panthor/panthor_gem.c              |  12 +
 drivers/gpu/drm/panthor/panthor_gpu.c              |  47 +++
 drivers/gpu/drm/panthor/panthor_gpu.h              |   4 +
 drivers/gpu/drm/panthor/panthor_mmu.c              |   6 +-
 drivers/gpu/drm/panthor/panthor_sched.c            | 408 ++++++++++++++++++---
 drivers/gpu/drm/panthor/panthor_sched.h            |   2 +
 drivers/gpu/drm/pl111/Kconfig                      |   1 +
 drivers/gpu/drm/pl111/pl111_drv.c                  |   4 +-
 drivers/gpu/drm/qxl/Kconfig                        |   1 +
 drivers/gpu/drm/qxl/qxl_drv.c                      |   4 +-
 drivers/gpu/drm/radeon/Kconfig                     |   1 +
 drivers/gpu/drm/radeon/radeon_drv.c                |  14 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c              | 114 +-----
 drivers/gpu/drm/radeon/radeon_mode.h               |  12 +-
 drivers/gpu/drm/renesas/rcar-du/Kconfig            |   1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c      |   4 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c    |  14 +-
 drivers/gpu/drm/renesas/rz-du/Kconfig              |   1 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c       |   4 +-
 drivers/gpu/drm/renesas/shmobile/Kconfig           |   1 +
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c   |   5 +-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c |  14 +-
 drivers/gpu/drm/rockchip/Kconfig                   |   1 +
 drivers/gpu/drm/rockchip/cdn-dp-reg.h              |   2 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        | 162 ++++----
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |  27 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |  12 +-
 drivers/gpu/drm/scheduler/sched_main.c             |  11 +-
 drivers/gpu/drm/solomon/Kconfig                    |   1 +
 drivers/gpu/drm/solomon/ssd130x.c                  |   4 +-
 drivers/gpu/drm/sti/Kconfig                        |   1 +
 drivers/gpu/drm/sti/sti_cursor.c                   |   3 +
 drivers/gpu/drm/sti/sti_drv.c                      |   4 +-
 drivers/gpu/drm/sti/sti_gdp.c                      |   3 +
 drivers/gpu/drm/sti/sti_hqvdp.c                    |   3 +
 drivers/gpu/drm/stm/Kconfig                        |   1 +
 drivers/gpu/drm/stm/drv.c                          |   5 +-
 drivers/gpu/drm/sun4i/Kconfig                      |   1 +
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |   4 +-
 drivers/gpu/drm/tegra/Kconfig                      |   1 +
 drivers/gpu/drm/tegra/drm.c                        |   5 +-
 drivers/gpu/drm/tegra/drm.h                        |  12 +-
 drivers/gpu/drm/tegra/fbdev.c                      |  98 +----
 drivers/gpu/drm/tegra/gem.c                        |  65 ++--
 drivers/gpu/drm/tegra/gem.h                        |  21 ++
 drivers/gpu/drm/tegra/gr3d.c                       |  46 ++-
 drivers/gpu/drm/tegra/hdmi.c                       |   2 +-
 drivers/gpu/drm/tests/drm_framebuffer_test.c       | 375 ++++++++++++++++++-
 drivers/gpu/drm/tidss/Kconfig                      |   1 +
 drivers/gpu/drm/tidss/tidss_drv.c                  |   4 +-
 drivers/gpu/drm/tilcdc/Kconfig                     |   1 +
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |   5 +-
 drivers/gpu/drm/tiny/Kconfig                       |  20 +-
 drivers/gpu/drm/tiny/arcpgu.c                      |   4 +-
 drivers/gpu/drm/tiny/bochs.c                       | 393 +++++++++++---------
 drivers/gpu/drm/tiny/cirrus.c                      |   4 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |   4 +-
 drivers/gpu/drm/tiny/hx8357d.c                     |   4 +-
 drivers/gpu/drm/tiny/ili9163.c                     |   4 +-
 drivers/gpu/drm/tiny/ili9225.c                     |   4 +-
 drivers/gpu/drm/tiny/ili9341.c                     |   4 +-
 drivers/gpu/drm/tiny/ili9486.c                     |   4 +-
 drivers/gpu/drm/tiny/mi0283qt.c                    |   4 +-
 drivers/gpu/drm/tiny/ofdrm.c                       |   9 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              |   4 +-
 drivers/gpu/drm/tiny/repaper.c                     |   4 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |   9 +-
 drivers/gpu/drm/tiny/st7586.c                      |   4 +-
 drivers/gpu/drm/tiny/st7735r.c                     |   4 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c            |   4 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c      |   6 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |  67 +++-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |   6 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |   2 +-
 drivers/gpu/drm/ttm/ttm_device.c                   |   4 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |  28 +-
 drivers/gpu/drm/ttm/ttm_tt.c                       |   3 +
 drivers/gpu/drm/tve200/Kconfig                     |   1 +
 drivers/gpu/drm/tve200/tve200_drv.c                |   9 +-
 drivers/gpu/drm/udl/Kconfig                        |   1 +
 drivers/gpu/drm/udl/udl_drv.c                      |   4 +-
 drivers/gpu/drm/v3d/Makefile                       |   3 +-
 drivers/gpu/drm/v3d/v3d_bo.c                       |  21 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |  10 +
 drivers/gpu/drm/v3d/v3d_drv.h                      |  14 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |   6 +-
 drivers/gpu/drm/v3d/v3d_gemfs.c                    |  50 +++
 drivers/gpu/drm/v3d/v3d_irq.c                      |   2 +
 drivers/gpu/drm/v3d/v3d_mmu.c                      |  81 ++--
 drivers/gpu/drm/v3d/v3d_perfmon.c                  |   6 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |  46 ++-
 drivers/gpu/drm/vboxvideo/Kconfig                  |   1 +
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |   4 +-
 drivers/gpu/drm/vc4/Kconfig                        |   1 +
 drivers/gpu/drm/vc4/tests/vc4_mock.c               |  14 +-
 drivers/gpu/drm/vc4/vc4_bo.c                       |  28 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                     |  35 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |  28 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |  29 +-
 drivers/gpu/drm/vc4/vc4_gem.c                      |  24 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  25 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                |   5 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                      | 363 +++++++++++-------
 drivers/gpu/drm/vc4/vc4_irq.c                      |  10 +-
 drivers/gpu/drm/vc4/vc4_kms.c                      |  14 +-
 drivers/gpu/drm/vc4/vc4_perfmon.c                  |  26 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    | 281 +++++++++-----
 drivers/gpu/drm/vc4/vc4_regs.h                     |   1 +
 drivers/gpu/drm/vc4/vc4_render_cl.c                |   2 +-
 drivers/gpu/drm/vc4/vc4_v3d.c                      |  10 +-
 drivers/gpu/drm/vc4/vc4_validate.c                 |   8 +-
 drivers/gpu/drm/vc4/vc4_validate_shaders.c         |   2 +-
 drivers/gpu/drm/virtio/Kconfig                     |   1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c               |   6 +-
 drivers/gpu/drm/vkms/Kconfig                       |   1 +
 drivers/gpu/drm/vkms/vkms_composer.c               |   7 +
 drivers/gpu/drm/vkms/vkms_crtc.c                   |   9 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |   4 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    | 101 ++++-
 drivers/gpu/drm/vkms/vkms_formats.c                |  62 +++-
 drivers/gpu/drm/vkms/vkms_output.c                 |  14 +-
 drivers/gpu/drm/vmwgfx/Kconfig                     |   1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   5 +-
 drivers/gpu/drm/xe/Kconfig                         |   1 +
 drivers/gpu/drm/xe/xe_bo.c                         |   4 +-
 drivers/gpu/drm/xlnx/Kconfig                       |   1 +
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  |   4 +-
 drivers/gpu/host1x/context.c                       |   1 +
 drivers/gpu/host1x/context_bus.c                   |   2 +-
 drivers/gpu/host1x/dev.c                           | 168 ++++-----
 drivers/gpu/host1x/dev.h                           |   6 +-
 drivers/gpu/host1x/hw/cdma_hw.c                    |  12 +
 drivers/gpu/host1x/hw/debug_hw.c                   |  15 +-
 drivers/video/fbdev/atmel_lcdfb.c                  |   4 +-
 drivers/video/fbdev/aty/aty128fb.c                 |   6 +-
 drivers/video/fbdev/aty/atyfb_base.c               |   2 +-
 drivers/video/fbdev/aty/radeon_backlight.c         |   2 +-
 drivers/video/fbdev/chipsfb.c                      |   2 +-
 drivers/video/fbdev/nvidia/nv_backlight.c          |   2 +-
 .../fbdev/omap2/omapfb/displays/panel-dsi-cm.c     |   4 +-
 .../omap2/omapfb/displays/panel-sony-acx565akm.c   |   2 +-
 drivers/video/fbdev/riva/fbdev.c                   |   2 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c             |   6 +-
 include/drm/bridge/imx.h                           |  17 +
 include/drm/drm_client_setup.h                     |  26 ++
 include/drm/drm_drv.h                              |  18 +
 include/drm/drm_fbdev_client.h                     |  19 +
 include/drm/drm_fbdev_dma.h                        |  13 +-
 include/drm/drm_fbdev_shmem.h                      |  13 +-
 include/drm/drm_fbdev_ttm.h                        |  15 +-
 include/drm/drm_file.h                             |  12 +
 include/drm/drm_fourcc.h                           |   1 +
 include/drm/drm_gem.h                              |   3 +
 include/drm/drm_gem_shmem_helper.h                 |   3 +
 include/drm/drm_gem_vram_helper.h                  |  13 -
 include/drm/drm_mipi_dsi.h                         |   2 +
 include/drm/drm_panic.h                            |  14 +
 include/drm/gpu_scheduler.h                        |  14 +-
 include/drm/ttm/ttm_bo.h                           |   2 +
 include/drm/ttm/ttm_device.h                       |   5 +-
 include/drm/ttm/ttm_tt.h                           |   5 +
 include/linux/dma-fence.h                          |   6 +
 include/linux/dma-resv.h                           |   6 +-
 include/linux/host1x.h                             |   6 +
 include/linux/host1x_context_bus.h                 |   2 +-
 include/uapi/drm/drm.h                             |  17 +
 include/uapi/drm/panfrost_drm.h                    |   3 +
 include/uapi/drm/panthor_drm.h                     |  51 +++
 include/uapi/drm/v3d_drm.h                         |   1 +
 416 files changed, 6499 insertions(+), 4148 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-panthor-profiling
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams639rq08.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
 create mode 100644 Documentation/gpu/panthor.rst
 create mode 100644 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
 create mode 100644 drivers/gpu/drm/bridge/ti-tdp158.c
 create mode 100644 drivers/gpu/drm/drm_client_setup.c
 create mode 100644 drivers/gpu/drm/drm_fbdev_client.c
 rename drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.c => auxch.c} (99%)
 rename drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.h => auxch.h} (100%)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ams639rq08.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
 create mode 100644 drivers/gpu/drm/v3d/v3d_gemfs.c
 create mode 100644 include/drm/bridge/imx.h
 create mode 100644 include/drm/drm_client_setup.h
 create mode 100644 include/drm/drm_fbdev_client.h
