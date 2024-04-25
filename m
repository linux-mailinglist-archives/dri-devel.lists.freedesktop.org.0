Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E708B2434
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 16:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE7711A4C4;
	Thu, 25 Apr 2024 14:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KSqj3aND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1208E11A4C4;
 Thu, 25 Apr 2024 14:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714055962; x=1745591962;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=eT5DZsbfClwfwTfl64NXLRHc/f559IOHQ/2MNLd/79Q=;
 b=KSqj3aNDCRBTQe3fft/ftB0GANmnObrQ//TgQDecRj5uUOhAQiJGlJoG
 fM3H0DmBNPbMkK1fXGhVPWA8JUHLDFIYBFr/egVX2+BZNmrye/mb0fx73
 jMqx8rtTpKK8UPwQqQVnpzMOXHTPt3BuzToSfhgjqj3d85SL4e4r5g9Uj
 YNso9g7YFBwOwRjVe4i7YChW08zLJwL6nk77TKdiKXUXbdGWgVggI4oVY
 6L6HC9B/r/T9BrPtrcTLc+UcT/xsetzcK+9mM2oOuoDNJ/OO5xIt2JEdP
 Z522lS0FC/C9P47G+uHZ0Dt5hFyrLRJPtxR772oCf6/HbMFJWTDwtsgHS Q==;
X-CSE-ConnectionGUID: Y9CFn/5fRn2w8NPdTMsxaA==
X-CSE-MsgGUID: TcyXsgJjTk+1jEuP80KWMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9676828"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="9676828"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 07:39:21 -0700
X-CSE-ConnectionGUID: AxtFMXv8SAW70nEQ2gCL7Q==
X-CSE-MsgGUID: ci7yNbvLTseWiyCLFmDueQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="29721425"
Received: from jhogberg-mobl1.ger.corp.intel.com (HELO [10.249.254.249])
 ([10.249.254.249])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 07:39:16 -0700
Message-ID: <1ab99848-8fb8-41a6-8967-c4ce6f3634fd@linux.intel.com>
Date: Thu, 25 Apr 2024 16:39:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Sima,

One more pull request for v6.10!

Cheers,
~Maarten

drm-misc-next-2024-04-25:
drm-misc-next for v6.10-rc1:

UAPI Changes:

Cross-subsystem Changes:
- Devicetree updates for rockchip (#sound-dai-cells)
- Add dt bindings for new panels.
- Change bridge/tc358775 dt bindings.

Core Changes:
- Fix SIZE_HINTS cursor property doc.
- Parse topology blocks for all DispID < 2.0.
- Implement support for tracking cleared free memory, use it in amdgpu.
- Drop seq_file.h from drm_print.h, and include debugfs.h explicitly
   where needed (drivers).

Driver Changes:
- Small fixes to rockchip, panthor, v3d, bridge chaining, xlx.
- Add Khadas TS050 V2, EDO RM69380 OLED, CSOT MNB601LS1-1 panels,
- Add SAM9X7 SoC's LVDS controller.
- More driver conversions to struct drm_edid.
- Support tc358765 in tc358775 bridge.
The following changes since commit 0208ca55aa9c9b997da1f5bc45c4e98916323f08:

   Backmerge tag 'v6.9-rc5' into drm-next (2024-04-22 14:35:52 +1000)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/misc/kernel.git 
tags/drm-misc-next-2024-04-25

for you to fetch changes up to 9e2b84fb6cd7ee913aa61d461db65c1d6a08dcf2:

   drm/print: drop include seq_file.h (2024-04-25 17:05:48 +0300)

----------------------------------------------------------------
drm-misc-next for v6.10-rc1:

UAPI Changes:

Cross-subsystem Changes:
- Devicetree updates for rockchip (#sound-dai-cells)
- Add dt bindings for new panels.
- Change bridge/tc358775 dt bindings.

Core Changes:
- Fix SIZE_HINTS cursor property doc.
- Parse topology blocks for all DispID < 2.0.
- Implement support for tracking cleared free memory, use it in amdgpu.
- Drop seq_file.h from drm_print.h, and include debugfs.h explicitly
   where needed (drivers).

Driver Changes:
- Small fixes to rockchip, panthor, v3d, bridge chaining, xlx.
- Add Khadas TS050 V2, EDO RM69380 OLED, CSOT MNB601LS1-1 panels,
- Add SAM9X7 SoC's LVDS controller.
- More driver conversions to struct drm_edid.
- Support tc358765 in tc358775 bridge.

----------------------------------------------------------------
Adam Ford (1):
       drm/bridge: imx: Fix unmet depenency for PHY_FSL_SAMSUNG_HDMI_PHY

Anatoliy Klymenko (6):
       drm: xlnx: zynqmp_dpsub: Set layer mode during creation
       drm: xlnx: zynqmp_dpsub: Update live format defines
       drm: xlnx: zynqmp_dpsub: Add connected live layer helper
       drm: xlnx: zynqmp_dpsub: Anounce supported input formats
       drm: xlnx: zynqmp_dpsub: Minimize usage of global flag
       drm: xlnx: zynqmp_dpsub: Set input live format

Andy Yan (1):
       drm/rockchip: lvds: Remove include of drm_dp_helper.h

Arunpravin Paneer Selvam (3):
       drm/buddy: Implement tracking clear page feature
       drm/amdgpu: Enable clear page functionality
       drm/tests: Add a test case for drm buddy clear allocation

Barnabás Czémán (1):
       drm/panel: jdi-fhd-r63452: make use of prepare_prev_first

Dan Carpenter (1):
       drm/panthor: clean up some types in panthor_sched_suspend()

David Wronek (2):
       dt-bindings: display: panel: Add Raydium RM69380
       drm/panel: Add driver for EDO RM69380 OLED panel

Detlev Casanova (1):
       drm/rockchip: vop2: Do not divide height twice for YUV

Dharma Balasubiramani (3):
       dt-bindings: display: bridge: add sam9x75-lvds binding
       drm/bridge: add lvds controller support for sam9x7
       MAINTAINERS: add SAM9X7 SoC's LVDS controller

Dmitry Baryshkov (5):
       drm/panel: novatek-nt36672e: stop setting register load before 
disable
       drm/panel: novatek-nt36672e: stop calling regulator_set_load manually
       drm/panel: novatek-nt36672a: stop calling regulator_set_load manually
       drm/panel: visionox-rm69299: stop calling regulator_set_load manually
       drm/bridge: adv7511: make it honour next bridge in DT

Jacobe Zang (2):
       dt-bindings: panel-simple-dsi: add Khadas TS050 V2 panel
       drm/panel: add Khadas TS050 V2 panel support

Jani Nikula (11):
       drm/panel: simple: switch to struct drm_edid
       drm/panel-samsung-atna33xc20: switch to struct drm_edid
       drm/panel-edp: switch to struct drm_edid
       drm/sun4i: hdmi: switch to struct drm_edid
       drm/vc4: hdmi: switch to struct drm_edid
       drm/gud: switch to struct drm_edid
       drm/rockchip: cdn-dp: switch to struct drm_edid
       drm/rockchip: inno_hdmi: switch to struct drm_edid
       drm/rockchip: rk3066_hdmi: switch to struct drm_edid
       drm/print: drop include debugfs.h and include where needed
       drm/print: drop include seq_file.h

Johan Jonker (3):
       dt-bindings: display: add #sound-dai-cells property to rockchip 
dw hdmi
       dt-bindings: display: add #sound-dai-cells property to rockchip 
rk3066 hdmi
       dt-bindings: display: add #sound-dai-cells property to rockchip 
inno hdmi

Krzysztof Kozlowski (3):
       drm/rockchip: cdn-dp: drop driver owner assignment
       drm/bridge: chipone-icn6211: drop driver owner assignment
       drm/bridge: tc358764: drop driver owner assignment

Maxime Ripard (1):
       Merge drm/drm-next into drm-misc-next

Maíra Canal (5):
       drm/v3d: Create two functions to update all GPU stats variables
       drm/v3d: Create a struct to store the GPU stats
       drm/v3d: Create function to update a set of GPU stats
       drm/v3d: Decouple stats calculation from printing
       drm/v3d: Fix race-condition between sysfs/fdinfo and interrupt 
handler

Michael Walle (3):
       dt-bindings: display: bridge: tc358775: make stby gpio optional
       drm/bridge: tc358775: fix support for jeida-18 and jeida-24
       drm/bridge: tc358775: make standby GPIO optional

Neil Armstrong (1):
       drm/meson: gate px_clk when setting rate

Tony Lindgren (7):
       dt-bindings: display: bridge: tc358775: Add data-lanes
       dt-bindings: display: bridge: tc358775: Add support for tc358765
       drm/bridge: tc358775: Get bridge data lanes instead of the DSI 
host lanes
       drm/bridge: tc358775: Add burst and low-power modes
       drm/bridge: tc358775: Enable pre_enable_prev_first flag
       drm/bridge: tc358775: Add support for tc358765
       drm/bridge: tc358775: Configure hs_rate and lp_rate

Ville Syrjälä (2):
       drm/edid: Parse topology block for all DispID structure v1.x
       drm: Fix plane SIZE_HINTS property docs

Xuxin Xiong (1):
       drm/panel-edp: Add panel CSOT MNB601LS1-1

  .../display/bridge/microchip,sam9x75-lvds.yaml     |   55 +
  .../bindings/display/bridge/toshiba,tc358775.yaml  |   39 +-
  .../bindings/display/panel/panel-simple-dsi.yaml   |    2 +
  .../bindings/display/panel/raydium,rm69380.yaml    |   89 ++
  .../display/rockchip/rockchip,dw-hdmi.yaml         |    5 +
  .../display/rockchip/rockchip,inno-hdmi.yaml       |    5 +
  .../display/rockchip/rockchip,rk3066-hdmi.yaml     |    7 +
  MAINTAINERS                                        |    8 +
  drivers/accel/ivpu/ivpu_debugfs.c                  |    2 +
  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    9 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h     |   25 +
  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   70 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |    5 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |   10 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h       |   10 +
  drivers/gpu/drm/armada/armada_debugfs.c            |    1 +
  drivers/gpu/drm/bridge/Kconfig                     |    7 +
  drivers/gpu/drm/bridge/Makefile                    |    1 +
  drivers/gpu/drm/bridge/adv7511/adv7511.h           |    1 +
  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   12 +
  drivers/gpu/drm/bridge/chipone-icn6211.c           |    1 -
  drivers/gpu/drm/bridge/imx/Kconfig                 |    4 +-
  drivers/gpu/drm/bridge/ite-it6505.c                |    1 +
  drivers/gpu/drm/bridge/microchip-lvds.c            |  229 ++++
  drivers/gpu/drm/bridge/panel.c                     |    2 +
  drivers/gpu/drm/bridge/tc358764.c                  |    1 -
  drivers/gpu/drm/bridge/tc358775.c                  |   98 +-
  drivers/gpu/drm/drm_buddy.c                        |  427 ++++++--
  drivers/gpu/drm/drm_displayid_internal.h           |    1 -
  drivers/gpu/drm/drm_edid.c                         |    2 +-
  drivers/gpu/drm/drm_plane.c                        |    2 +-
  drivers/gpu/drm/drm_print.c                        |    6 +-
  drivers/gpu/drm/gud/gud_connector.c                |   12 +-
  drivers/gpu/drm/i915/display/intel_dmc.c           |    1 +
  drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |    6 +-
  drivers/gpu/drm/imagination/pvr_fw_trace.c         |    1 +
  drivers/gpu/drm/meson/meson_dw_mipi_dsi.c          |    7 +
  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |    2 +
  drivers/gpu/drm/nouveau/dispnv50/crc.c             |    2 +
  drivers/gpu/drm/panel/Kconfig                      |   12 +
  drivers/gpu/drm/panel/Makefile                     |    1 +
  drivers/gpu/drm/panel/panel-edp.c                  |   19 +-
  drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c       |    1 +
  drivers/gpu/drm/panel/panel-khadas-ts050.c         | 1112 
+++++++++++---------
  drivers/gpu/drm/panel/panel-novatek-nt36672a.c     |   11 +-
  drivers/gpu/drm/panel/panel-novatek-nt36672e.c     |   33 +-
  drivers/gpu/drm/panel/panel-raydium-rm69380.c      |  344 ++++++
  drivers/gpu/drm/panel/panel-samsung-atna33xc20.c   |   13 +-
  drivers/gpu/drm/panel/panel-simple.c               |   15 +-
  drivers/gpu/drm/panel/panel-visionox-rm69299.c     |   16 +-
  drivers/gpu/drm/panthor/panthor_sched.c            |    2 +-
  drivers/gpu/drm/radeon/r100.c                      |    1 +
  drivers/gpu/drm/radeon/r300.c                      |    1 +
  drivers/gpu/drm/radeon/r420.c                      |    1 +
  drivers/gpu/drm/radeon/r600.c                      |    3 +-
  drivers/gpu/drm/radeon/radeon_fence.c              |    1 +
  drivers/gpu/drm/radeon/radeon_gem.c                |    1 +
  drivers/gpu/drm/radeon/radeon_ib.c                 |    2 +
  drivers/gpu/drm/radeon/radeon_pm.c                 |    1 +
  drivers/gpu/drm/radeon/radeon_ring.c               |    2 +
  drivers/gpu/drm/radeon/radeon_ttm.c                |    1 +
  drivers/gpu/drm/radeon/rs400.c                     |    1 +
  drivers/gpu/drm/radeon/rv515.c                     |    1 +
  drivers/gpu/drm/rockchip/cdn-dp-core.c             |   34 +-
  drivers/gpu/drm/rockchip/cdn-dp-core.h             |    2 +-
  drivers/gpu/drm/rockchip/inno_hdmi.c               |   12 +-
  drivers/gpu/drm/rockchip/rk3066_hdmi.c             |   12 +-
  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |   22 +-
  drivers/gpu/drm/rockchip/rockchip_lvds.c           |    1 -
  drivers/gpu/drm/sti/sti_drv.c                      |    1 +
  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   18 +-
  drivers/gpu/drm/tests/drm_buddy_test.c             |  171 ++-
  drivers/gpu/drm/ttm/ttm_device.c                   |    1 +
  drivers/gpu/drm/ttm/ttm_resource.c                 |    3 +-
  drivers/gpu/drm/ttm/ttm_tt.c                       |    5 +-
  drivers/gpu/drm/v3d/v3d_drv.c                      |   33 +-
  drivers/gpu/drm/v3d/v3d_drv.h                      |   30 +-
  drivers/gpu/drm/v3d/v3d_gem.c                      |    9 +-
  drivers/gpu/drm/v3d/v3d_irq.c                      |   48 +-
  drivers/gpu/drm/v3d/v3d_sched.c                    |   94 +-
  drivers/gpu/drm/v3d/v3d_sysfs.c                    |   13 +-
  drivers/gpu/drm/vc4/vc4_drv.h                      |    1 +
  drivers/gpu/drm/vc4/vc4_hdmi.c                     |   46 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |    2 +
  drivers/gpu/drm/xe/xe_debugfs.c                    |    1 +
  drivers/gpu/drm/xe/xe_gt_debugfs.c                 |    2 +
  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c               |    4 +-
  drivers/gpu/drm/xe/xe_uc_debugfs.c                 |    2 +
  drivers/gpu/drm/xlnx/zynqmp_disp.c                 |  231 +++-
  drivers/gpu/drm/xlnx/zynqmp_disp.h                 |   17 +-
  drivers/gpu/drm/xlnx/zynqmp_disp_regs.h            |    8 +-
  drivers/gpu/drm/xlnx/zynqmp_dp.c                   |   81 +-
  drivers/gpu/drm/xlnx/zynqmp_kms.c                  |    2 +-
  include/drm/drm_buddy.h                            |   16 +-
  include/drm/drm_mode_config.h                      |    2 +-
  include/drm/drm_print.h                            |    4 +-
  96 files changed, 2650 insertions(+), 1041 deletions(-)
  create mode 100644 
Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-lvds.yaml
  create mode 100644 
Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml
  create mode 100644 drivers/gpu/drm/bridge/microchip-lvds.c
  create mode 100644 drivers/gpu/drm/panel/panel-raydium-rm69380.c
