Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8532E7D8F8A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 09:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DFD10E942;
	Fri, 27 Oct 2023 07:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC0610E941;
 Fri, 27 Oct 2023 07:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698391083; x=1729927083;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=FnH5lkj30aeEI4Nf9VqJ7c74CpJovqVYuxf0yhQb2DA=;
 b=Zu7q5eCKw3QjU56sciGzTLqK67SSLlf5gyyTEwbQM6iVPu4H2R6cJUk5
 na+TWbReLr8/AXtPEhnvEz5p1mgO/GobFZmuuXtLwQ1V8GamPDoEs+LGD
 IE68vikoqNRR+AVLECvGp/1kNzpbY8i/CjmNytmIxA+hi9c9WOh9pC90h
 Pdo8djdietJsaaixKzcUgoipSMZAFPAGGF2Ga0I48b1xL8KizSmBNS+kH
 yNSkMAAUDFQLUCZsImCVzZ2GFlR2gHUfRQ2ndqUR/EIoumakU+H8d+A7Z
 W1Fy1PxR4D6aik+j9TQsiPVH/n7Cv9n1P82eVcGCBPjW981d8Yve/PkkF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="542428"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="542428"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 00:18:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="753020195"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="753020195"
Received: from mjbyckli-mobl1.ger.corp.intel.com (HELO [10.252.50.108])
 ([10.252.50.108])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 00:17:56 -0700
Message-ID: <3d92fae8-9b1b-4165-9ca8-5fda11ee146b@linux.intel.com>
Date: Fri, 27 Oct 2023 09:17:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Subject: [PULL] drm-misc-next
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm-misc-next-2023-10-27:
drm-misc-next for v6.7-rc1:

drm-misc-next-2023-10-19 + following:

UAPI Changes:

Cross-subsystem Changes:
- Convert fbdev drivers to use fbdev i/o mem helpers.

Core Changes:
- Use cross-references for macros in docs.
- Make drm_client_buffer_addb use addfb2.
- Add NV20 and NV30 YUV formats.
- Documentation updates for create_dumb ioctl.
- CI fixes.
- Allow variable number of run-queues in scheduler.

Driver Changes:
- Rename drm/ast constants.
- Make ili9882t its own driver.
- Assorted fixes in ivpu, vc4, bridge/synopsis, amdgpu.
- Add planar formats to rockchip.
The following changes since commit c395c83aafbb9cdbe4230f044d5b8eaf9080c0c5:

   drm/simpledrm: Fix power domain device link validity check 
(2023-10-12 10:39:48 +0200)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-10-27

for you to fetch changes up to b70438004a14f4d0f9890b3297cd66248728546c:

   drm/amdgpu: move buffer funcs setting up a level (2023-10-26 16:04:24 
-0400)

----------------------------------------------------------------
drm-misc-next for v6.7-rc1:

drm-misc-next-2023-10-19 + following:

UAPI Changes:

Cross-subsystem Changes:
- Convert fbdev drivers to use fbdev i/o mem helpers.

Core Changes:
- Use cross-references for macros in docs.
- Make drm_client_buffer_addb use addfb2.
- Add NV20 and NV30 YUV formats.
- Documentation updates for create_dumb ioctl.
- CI fixes.
- Allow variable number of run-queues in scheduler.

Driver Changes:
- Rename drm/ast constants.
- Make ili9882t its own driver.
- Assorted fixes in ivpu, vc4, bridge/synopsis, amdgpu.
- Add planar formats to rockchip.

----------------------------------------------------------------
Alex Deucher (1):
       drm/amdgpu: move buffer funcs setting up a level

Andy Yan (6):
       drm/rockchip: remove unused struct in vop2
       drm/rockchip: remove NR_LAYERS macro on vop2
       drm/rockchip: vop: fix format bpp calculation
       drm/rockchip: vop2: remove the unsupported format of cluster window
       drm/rockchip: vop2: Add more supported 10bit formats
       drm/rockchip: vop2: rename window formats to show window type 
using them

Biju Das (8):
       drm: adv7511: Add struct adv7511_chip_info and use 
i2c_get_match_data()
       drm: adv7511: Add max_mode_clock_khz variable to struct 
adv7511_chip_info
       drm: adv7511: Add max_lane_freq_khz variable to struct 
adv7511_chip_info
       drm: adv7511: Add supply_names and num_supplies variables to 
struct adv7511_chip_info
       drm: adv7511: Add reg_cec_offset variable to struct adv7511_chip_info
       drm: adv7511: Add has_dsi variable to struct adv7511_chip_info
       drm: adv7511: Add link_config variable to struct adv7511_chip_info
       drm: adv7511: Add hpd_override_enable variable to struct 
adv7511_chip_info

Chris Morgan (3):
       dt-bindings: vendor-prefixes: document Powkiddy
       dt-bindings: panel: Add Powkiddy RGB30 panel compatible
       drm/panel: st7703: Add Powkiddy RGB30 Panel Support

Cong Yang (3):
       drm/panel: ili9882t: Break out as separate driver
       drm/panel: ili9882t: Avoid blurred screen from fast sleep
       arm64: defconfig: Enable ILITEK_ILI9882T panel

Dan Carpenter (1):
       drm/rockchip: Fix type promotion bug in rockchip_gem_iommu_map()

Dario Binacchi (1):
       drm/vc4: fix typo

Deepak R Varma (1):
       accel/ivpu: Delete the TODO file

Dmitry Baryshkov (3):
       drm/bridge: lt9611uxc: fix the race in the error path
       drm/ci: pick up -external-fixes from the merge target repo
       drm/ci: force-enable CONFIG_MSM_MMCC_8996 as built-in

Frank Oltmanns (1):
       drm/panel: st7703: Fix timings when entering/exiting sleep

Geert Uytterhoeven (1):
       drm/client: Convert drm_client_buffer_addfb() to drm_mode_addfb2()

Helen Koike (11):
       drm/ci: uprev mesa version: fix container build & crosvm
       drm/ci: fix DEBIAN_ARCH and get amdgpu probing
       drm/ci: add helper script update-xfails.py
       drm/ci: uprev IGT and make sure core_getversion is run
       drm/ci: clean up xfails (specially flakes list)
       drm/ci: add subset-1-gfx to LAVA_TAGS and adjust shards
       drm/ci: increase i915 job timeout to 1h30m
       drm/ci: export kernel config
       drm/ci: do not automatically retry on error
       drm/ci: docs: add step about how to request privileges
       MAINTAINERS: drm/ci: add entries for xfail files

Ian Ray (2):
       drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: switch to 
drm_do_get_edid()
       MAINTAINERS: Update entry for megachips-stdpxxxx-ge-b850v3-fw

Jacek Lawrynowicz (1):
       accel/ivpu: Add ivpu_bo_vaddr() and ivpu_bo_size()

Javier Martinez Canillas (6):
       drm/ssd130x: Replace .page_height field in device info with a 
constant
       drm/ssd130x: Add a controller family id to the device info data
       drm/ssd130x: Rename commands that are shared across chip families
       drm/ssd130x: Add support for the SSD132x OLED controller family
       dt-bindings: display: Split common Solomon properties in their 
own schema
       dt-bindings: display: Add SSD132x OLED controllers

Jonas Karlman (2):
       drm/fourcc: Add NV20 and NV30 YUV formats
       drm/rockchip: vop: Add NV15, NV20 and NV30 support

Karol Wachowski (1):
       accel/ivpu: Read clock rate only if device is up

Krystian Pradzynski (3):
       accel/ivpu: Use ratelimited warn and err in IPC/JSM
       accel/ivpu: Fix verbose version of REG_POLL macros
       accel/ivpu: Print IPC type string instead of number

Liu Ying (10):
       drm/bridge: synopsys: dw-mipi-dsi: Add dw_mipi_dsi_get_bridge() 
helper
       drm/bridge: synopsys: dw-mipi-dsi: Add input bus format 
negotiation support
       drm/bridge: synopsys: dw-mipi-dsi: Force input bus flags
       drm/bridge: synopsys: dw-mipi-dsi: Add mode fixup support
       drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock rate to 
calculate lbcc
       drm/bridge: synopsys: dw-mipi-dsi: Set minimum lane byte clock 
cycles for HSA and HBP
       drm/bridge: synopsys: dw-mipi-dsi: Disable HSTX and LPRX timeout 
check
       dt-bindings: display: bridge: Document Freescale i.MX93 MIPI DSI
       drm/bridge: imx: Add i.MX93 MIPI DSI support
       drm/bridge: synopsys: dw-mipi-dsi: Fix hcomponent lbcc for burst mode

Luben Tuikov (2):
       drm/sched: Convert the GPU scheduler to variable number of run-queues
       MAINTAINERS: Update the GPU Scheduler email

Maxime Ripard (1):
       drm/doc: ci: Require more context for flaky tests

Ondrej Jirman (1):
       drm/panel: st7703: Pick different reset sequence

Rob Clark (1):
       drm/ci: Enable CONFIG_BACKLIGHT_CLASS_DEVICE

Simon Ser (2):
       drm/doc: use cross-references for macros
       drm/doc: document DRM_IOCTL_MODE_CREATE_DUMB

Stanislaw Gruszka (2):
       accel/ivpu: Do not initialize parameters on power up
       accel/ivpu/37xx: Remove support for FPGA and simics

Thomas Hellström (2):
       Documentation/gpu: Add a VM_BIND async document
       drm/gpuvm: Dual-licence the drm_gpuvm code GPL-2.0 OR MIT

Thomas Zimmermann (59):
       drm/ssd130x: Fix atomic_check for disabled planes
       fbdev: Provide I/O-memory helpers as module
       fbdev/68328fb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/amba-clcd: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/amifb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/arkfb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/atafb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/atyfb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/au1100fb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/cirrusfb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/cobalt-lcd: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/controlfb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/cyber2000fb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/dnfb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/ep93xx-fb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/gbefb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/hgafb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/hitfb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/hpfb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/i810fb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/imsttfb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/intelfb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/matroxfb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/neofb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/nvidiafb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/omapfb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/pm2fb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/pm3fb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/pvr2fb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/radeon: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/rivafb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/s1d13xxxfb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/s3fb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/sa1100fb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/savagefb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/sisfb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/sm501fb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/sm712fb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/stifb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/sunxvr500: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/tdfxfb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/tgafb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/tridentfb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/vermilionfb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/vga16fb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/viafb: Initialize fb_ops to fbdev I/O-memory helpers
       fbdev/vt8623fb: Initialize fb_ops to fbdev I/O-memory helpers
       drm/ast: Rename AST_IO_AR_PORT_WRITE to AST_IO_VGAARI_W
       drm/ast: Rename AST_IO_MISC_PORT_WRITE to AST_IO_VGAMR_W
       drm/ast: Rename AST_IO_VGA_ENABLE_PORT to AST_IO_VGAER
       drm/ast: Rename AST_IO_SEQ_PORT to AST_IO_VGASRI
       drm/ast: Rename AST_IO_DAC_INDEX_READ to AST_IO_VGADRR
       drm/ast: Rename AST_IO_DAC_INDEX_WRITE to AST_IO_VGADWR
       drm/ast: Rename AST_IO_DAC_DATA to AST_IO_VGAPDR
       drm/ast: Rename AST_IO_GR_PORT to AST_IO_VGAGRI
       drm/ast: Rename AST_IO_CRTC_PORT to AST_IO_VGACRI
       drm/ast: Rename AST_IO_INPUT_STATUS1_READ to AST_IO_VGAIR1_R
       drm/ast: Rename AST_IO_MISC_PORT_READ to AST_IO_VGAMR_R
       drm/ast: Move register constants to ast_reg.h

  .../display/bridge/fsl,imx93-mipi-dsi.yaml         | 115 +++
  .../display/panel/rocktech,jh057n00900.yaml        |   2 +
  .../bindings/display/solomon,ssd-common.yaml       |  42 +
  .../bindings/display/solomon,ssd1307fb.yaml        |  28 +-
  .../bindings/display/solomon,ssd132x.yaml          |  89 ++
  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
  Documentation/gpu/automated_testing.rst            |  20 +-
  Documentation/gpu/drm-kms.rst                      |   2 +
  Documentation/gpu/drm-uapi.rst                     |   8 +-
  Documentation/gpu/drm-vm-bind-async.rst            | 309 +++++++
  Documentation/gpu/implementation_guidelines.rst    |   9 +
  Documentation/gpu/index.rst                        |   1 +
  Documentation/gpu/rfc/xe.rst                       |   4 +-
  MAINTAINERS                                        |  14 +-
  arch/arm64/configs/defconfig                       |   1 +
  drivers/accel/ivpu/TODO                            |  11 -
  drivers/accel/ivpu/ivpu_drv.c                      |  18 +-
  drivers/accel/ivpu/ivpu_fw.c                       |  18 +-
  drivers/accel/ivpu/ivpu_fw_log.c                   |   6 +-
  drivers/accel/ivpu/ivpu_gem.c                      |  30 +-
  drivers/accel/ivpu/ivpu_gem.h                      |  22 +-
  drivers/accel/ivpu/ivpu_hw_37xx.c                  |  63 +-
  drivers/accel/ivpu/ivpu_hw_40xx.c                  |   8 +-
  drivers/accel/ivpu/ivpu_hw_reg_io.h                |  32 +-
  drivers/accel/ivpu/ivpu_ipc.c                      |  40 +-
  drivers/accel/ivpu/ivpu_job.c                      |   8 +-
  drivers/accel/ivpu/ivpu_jsm_msg.c                  |  82 +-
  drivers/accel/ivpu/ivpu_jsm_msg.h                  |   2 +
  drivers/accel/ivpu/ivpu_mmu.c                      |  47 +-
  drivers/accel/ivpu/ivpu_pm.c                       |  15 +-
  drivers/accel/ivpu/ivpu_pm.h                       |   1 +
  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  16 +
  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   4 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |  21 -
  drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |   1 -
  drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |   5 -
  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |   5 -
  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |   5 -
  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |  16 +-
  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |  10 +-
  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  10 +-
  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |  10 +-
  drivers/gpu/drm/amd/amdgpu/si_dma.c                |   5 -
  drivers/gpu/drm/ast/ast_dp.c                       |  70 +-
  drivers/gpu/drm/ast/ast_dp501.c                    |  38 +-
  drivers/gpu/drm/ast/ast_drv.h                      |  83 +-
  drivers/gpu/drm/ast/ast_i2c.c                      |  20 +-
  drivers/gpu/drm/ast/ast_main.c                     |  24 +-
  drivers/gpu/drm/ast/ast_mm.c                       |   4 +-
  drivers/gpu/drm/ast/ast_mode.c                     | 200 ++---
  drivers/gpu/drm/ast/ast_post.c                     |  26 +-
  drivers/gpu/drm/ast/ast_reg.h                      |  99 +++
  drivers/gpu/drm/bridge/adv7511/adv7511.h           |  16 +-
  drivers/gpu/drm/bridge/adv7511/adv7511_cec.c       |  14 +-
  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       | 104 ++-
  drivers/gpu/drm/bridge/adv7511/adv7533.c           |   7 +-
  drivers/gpu/drm/bridge/imx/Kconfig                 |  11 +
  drivers/gpu/drm/bridge/imx/Makefile                |   1 +
  drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c        | 917 
+++++++++++++++++++++
  drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |  10 +-
  .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |  57 +-
  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  97 ++-
  drivers/gpu/drm/ci/arm.config                      |   1 +
  drivers/gpu/drm/ci/arm64.config                    |   2 +
  drivers/gpu/drm/ci/build.sh                        |   8 +-
  drivers/gpu/drm/ci/build.yml                       |   1 +
  drivers/gpu/drm/ci/gitlab-ci.yml                   |  38 +-
  drivers/gpu/drm/ci/igt_runner.sh                   |  31 +-
  drivers/gpu/drm/ci/image-tags.yml                  |   6 +-
  drivers/gpu/drm/ci/lava-submit.sh                  |   6 +-
  drivers/gpu/drm/ci/test.yml                        |  34 +-
  drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt  |  12 +-
  drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt |  20 -
  drivers/gpu/drm/ci/xfails/i915-amly-fails.txt      |   9 +
  drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt     |  32 -
  drivers/gpu/drm/ci/xfails/i915-apl-fails.txt       |  11 -
  drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt      |   1 -
  drivers/gpu/drm/ci/xfails/i915-cml-fails.txt       |  14 +-
  drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt      |  38 -
  drivers/gpu/drm/ci/xfails/i915-glk-fails.txt       |  17 +
  drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt      |  41 -
  drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt       |   7 +
  drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt      |  25 -
  drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt       |   1 -
  drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt      |   5 -
  drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt      |   1 -
  .../gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt   |   0
  .../gpu/drm/ci/xfails/mediatek-mt8183-fails.txt    |   5 +-
  .../gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt   |  14 -
  drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt     |  14 +-
  drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt    |   4 -
  drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt   |   4 -
  drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt    |   2 +
  drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt   |   4 -
  drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt     |  15 +-
  drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt    |  24 +-
  drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt     |  18 +-
  drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt     |   9 +-
  drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt    |  19 +-
  drivers/gpu/drm/ci/xfails/requirements.txt         |  17 +
  .../gpu/drm/ci/xfails/rockchip-rk3288-fails.txt    |   6 +
  .../gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt   |   9 -
  .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt    |  40 +-
  .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt   |  28 +-
  drivers/gpu/drm/ci/xfails/update-xfails.py         | 204 +++++
  .../gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt   |   0
  drivers/gpu/drm/drm_client.c                       |  13 +-
  drivers/gpu/drm/drm_fourcc.c                       |   8 +
  drivers/gpu/drm/drm_gpuvm.c                        |   2 +-
  drivers/gpu/drm/etnaviv/etnaviv_sched.c            |   1 +
  drivers/gpu/drm/lima/lima_sched.c                  |   4 +-
  drivers/gpu/drm/msm/msm_ringbuffer.c               |   5 +-
  drivers/gpu/drm/nouveau/nouveau_sched.c            |   1 +
  drivers/gpu/drm/panel/Kconfig                      |   9 +
  drivers/gpu/drm/panel/Makefile                     |   1 +
  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     | 371 ---------
  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c      | 779 +++++++++++++++++
  drivers/gpu/drm/panel/panel-sitronix-st7703.c      | 125 ++-
  drivers/gpu/drm/panfrost/panfrost_job.c            |   1 +
  drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |   2 +-
  drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |  36 +-
  drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |   1 +
  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  77 +-
  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |   3 -
  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |  55 +-
  drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |  66 +-
  drivers/gpu/drm/scheduler/sched_entity.c           |  18 +-
  drivers/gpu/drm/scheduler/sched_main.c             |  74 +-
  drivers/gpu/drm/solomon/Kconfig                    |  12 +-
  drivers/gpu/drm/solomon/ssd130x-i2c.c              |  18 +-
  drivers/gpu/drm/solomon/ssd130x-spi.c              |  27 +-
  drivers/gpu/drm/solomon/ssd130x.c                  | 523 ++++++++++--
  drivers/gpu/drm/solomon/ssd130x.h                  |  17 +-
  drivers/gpu/drm/v3d/v3d_sched.c                    |   5 +
  drivers/gpu/drm/vc4/vc4_regs.h                     |   2 +-
  drivers/video/fbdev/68328fb.c                      |   5 +-
  drivers/video/fbdev/Kconfig                        |  93 ++-
  drivers/video/fbdev/amba-clcd.c                    |   5 +-
  drivers/video/fbdev/amifb.c                        |   2 +
  drivers/video/fbdev/arkfb.c                        |   2 +
  drivers/video/fbdev/atafb.c                        |   2 +
  drivers/video/fbdev/aty/atyfb_base.c               |   3 +
  drivers/video/fbdev/aty/radeon_base.c              |   2 +
  drivers/video/fbdev/au1100fb.c                     |   8 +-
  drivers/video/fbdev/cirrusfb.c                     |   2 +
  drivers/video/fbdev/cobalt_lcdfb.c                 |   2 +
  drivers/video/fbdev/controlfb.c                    |   5 +-
  drivers/video/fbdev/core/Kconfig                   |   6 +
  drivers/video/fbdev/core/Makefile                  |   3 +-
  drivers/video/fbdev/core/fb_io_fops.c              |   3 +
  drivers/video/fbdev/cyber2000fb.c                  |   2 +
  drivers/video/fbdev/dnfb.c                         |   2 +
  drivers/video/fbdev/ep93xx-fb.c                    |   5 +-
  drivers/video/fbdev/gbefb.c                        |   7 +-
  drivers/video/fbdev/hgafb.c                        |   2 +
  drivers/video/fbdev/hitfb.c                        |   4 +-
  drivers/video/fbdev/hpfb.c                         |   2 +
  drivers/video/fbdev/i810/i810_main.c               |   2 +
  drivers/video/fbdev/imsttfb.c                      |   2 +
  drivers/video/fbdev/intelfb/intelfbdrv.c           |   4 +-
  drivers/video/fbdev/matrox/matroxfb_base.c         |   2 +
  drivers/video/fbdev/matrox/matroxfb_crtc2.c        |   4 +-
  drivers/video/fbdev/neofb.c                        |   2 +
  drivers/video/fbdev/nvidia/nvidia.c                |   2 +
  drivers/video/fbdev/omap2/omapfb/Kconfig           |   4 +-
  drivers/video/fbdev/omap2/omapfb/omapfb-main.c     |   5 +-
  drivers/video/fbdev/pm2fb.c                        |   2 +
  drivers/video/fbdev/pm3fb.c                        |   2 +
  drivers/video/fbdev/pvr2fb.c                       |  14 +-
  drivers/video/fbdev/riva/fbdev.c                   |   2 +
  drivers/video/fbdev/s1d13xxxfb.c                   |  25 +-
  drivers/video/fbdev/s3fb.c                         |   2 +
  drivers/video/fbdev/sa1100fb.c                     |   5 +-
  drivers/video/fbdev/savage/savagefb_driver.c       |   6 +-
  drivers/video/fbdev/sis/sis_main.c                 |   4 +-
  drivers/video/fbdev/sm501fb.c                      |   4 +
  drivers/video/fbdev/sm712fb.c                      |   1 +
  drivers/video/fbdev/stifb.c                        |   2 +
  drivers/video/fbdev/sunxvr500.c                    |   2 +
  drivers/video/fbdev/tdfxfb.c                       |   6 +-
  drivers/video/fbdev/tgafb.c                        |   2 +
  drivers/video/fbdev/tridentfb.c                    |   2 +
  drivers/video/fbdev/vermilion/vermilion.c          |   5 +-
  drivers/video/fbdev/vga16fb.c                      |   2 +
  drivers/video/fbdev/via/viafbdev.c                 |   2 +
  drivers/video/fbdev/vt8623fb.c                     |   2 +
  include/drm/bridge/dw_mipi_dsi.h                   |  16 +
  include/drm/drm_gpuvm.h                            |   2 +-
  include/drm/gpu_scheduler.h                        |   9 +-
  include/uapi/drm/drm.h                             |  20 +
  include/uapi/drm/drm_fourcc.h                      |   2 +
  include/uapi/drm/drm_mode.h                        |  16 +-
  192 files changed, 4684 insertions(+), 1675 deletions(-)
  create mode 100644 
Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.yaml
  create mode 100644 
Documentation/devicetree/bindings/display/solomon,ssd-common.yaml
  create mode 100644 
Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
  create mode 100644 Documentation/gpu/drm-vm-bind-async.rst
  create mode 100644 Documentation/gpu/implementation_guidelines.rst
  delete mode 100644 drivers/accel/ivpu/TODO
  create mode 100644 drivers/gpu/drm/ast/ast_reg.h
  create mode 100644 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
  delete mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
  delete mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
  delete mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
  delete mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
  delete mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
  delete mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
  delete mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
  delete mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
  delete mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
  delete mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
  delete mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
  create mode 100644 drivers/gpu/drm/ci/xfails/requirements.txt
  delete mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
  create mode 100755 drivers/gpu/drm/ci/xfails/update-xfails.py
  delete mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt
  create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
