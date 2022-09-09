Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E865B322F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 10:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7477510EC09;
	Fri,  9 Sep 2022 08:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E90F10EBFD;
 Fri,  9 Sep 2022 08:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662713219; x=1694249219;
 h=message-id:date:mime-version:from:subject:to:cc;
 bh=7bxMeO7qBE4a8ok3QBJjYupJopFmTcAabryvBXFXfaw=;
 b=N7S7aJHw1kwIyYKK4LwhtRAk9q/xypS9LamUKKqHVR5T6P++G94VFGfg
 SGGVB3CDcL1/OJAjbZVP3n0G9aLNUTN/cyZXT7seykiRPAlXXn2URGW90
 FVw9DqGMD/4UEDSfJEprXVFA78Ck3XcsqkqPmA3dL/rzgQxkEzXuRCGeO
 dwQdBrAl3qg3no5+BMb/nE566GMWltflU7tzI/W0U5dxwqieMf4Wa/ikl
 D+shqpxfCL+nmbaB6HV3KL9Ahqu8U7CyjQwE2gcCgRWxFI2G2cNTKSBcZ
 ZF49BbVvq+yQ6Cm513QkIEHNULxommFIctvmQWuiQe8ZY+37WgQEK4z6m A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="280453926"
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; 
 d="scan'208,217";a="280453926"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 01:46:58 -0700
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; 
 d="scan'208,217";a="677080219"
Received: from dumser-mobl.ger.corp.intel.com (HELO [10.249.45.235])
 ([10.249.45.235])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 01:46:53 -0700
Content-Type: multipart/alternative;
 boundary="------------8BhS933eyK5qt0XSVPbwvksq"
Message-ID: <a489485b-3ebc-c734-0f80-aed963d89efe@linux.intel.com>
Date: Fri, 9 Sep 2022 10:46:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PULL] drm-misc-next
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Language: en-US
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
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------8BhS933eyK5qt0XSVPbwvksq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Dave, Daniel,

Another pull request for drm-misc-next, enjoy!

~Maarten

drm-misc-next-2022-09-09:
drm-misc-next for v6.1-rc1:

UAPI Changes:
- Hide unregistered connectors from GETCONNECTOR ioctl.
- drm/virtio no longer advertises LINEAR modifier, as it doesn't work.
-

Cross-subsystem Changes:
- Fix GPF in udmabuf failure path.

Core Changes:
- Rework TTM placement to use intersect/compatible functions.
- Drop legacy DP-MST support.
- More DP-MST related fixes, and move all state into atomic.
- Make DRM_MIPI_DBI select DRM_KMS_HELPER.
- Add audio_infoframe packing for DP.
- Add logging when some atomic check functions fail.
- Assorted documentation updates and fixes.

Driver Changes:
- Assorted cleanups and fixes in msm, lcdif, nouveau, virtio,
   panel/ilitek, bridge/icn6211, tve200, gma500, bridge/*, panfrost, via,
   bochs, qxl, sun4i.
- Add add AUO B133UAN02.1, IVO M133NW4J-R3, Innolux N120ACA-EA1 eDP panels.
- Improve DP-MST modeset state handling in amdgpu, nouveau, i915.
- Drop DP-MST from radeon driver, it was broken and only user of legacy
   DP-MST.
- Handle unplugging better in vc4.
- Simplify drm cmdparser tests.
- Add DP support to ti-sn65dsi86.
- Add MT8195 DP support to mediatek.
- Support RGB565, XRGB64, and ARGB64 formats in vkms.
- Convert sun4i tv support to atomic.
- Refactor vc4/vec TV Modesetting, and fix timings.
- Use atomic helpers instead of simple display helpers in ssd130x.

Maintainer changes:
- Add Douglas Anderson as reviewer for panel-edp.
The following changes since commit 8869fa666a9e6782c3c896c1fa57d65adca23249:

   drm/virtio: remove drm_plane_cleanup() destroy hook (2022-08-19 16:00:15 +0200)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2022-09-09

for you to fetch changes up to 5d832b6694e094b176627ed9918a1b21c56fb742:

   drm/dp_mst: Avoid deleting payloads for connectors staying enabled (2022-09-08 19:41:18 +0300)

----------------------------------------------------------------
drm-misc-next for v6.1-rc1:

UAPI Changes:
- Hide unregistered connectors from GETCONNECTOR ioctl.
- drm/virtio no longer advertises LINEAR modifier, as it doesn't work.
-

Cross-subsystem Changes:
- Fix GPF in udmabuf failure path.

Core Changes:
- Rework TTM placement to use intersect/compatible functions.
- Drop legacy DP-MST support.
- More DP-MST related fixes, and move all state into atomic.
- Make DRM_MIPI_DBI select DRM_KMS_HELPER.
- Add audio_infoframe packing for DP.
- Add logging when some atomic check functions fail.
- Assorted documentation updates and fixes.

Driver Changes:
- Assorted cleanups and fixes in msm, lcdif, nouveau, virtio,
   panel/ilitek, bridge/icn6211, tve200, gma500, bridge/*, panfrost, via,
   bochs, qxl, sun4i.
- Add add AUO B133UAN02.1, IVO M133NW4J-R3, Innolux N120ACA-EA1 eDP panels.
- Improve DP-MST modeset state handling in amdgpu, nouveau, i915.
- Drop DP-MST from radeon driver, it was broken and only user of legacy
   DP-MST.
- Handle unplugging better in vc4.
- Simplify drm cmdparser tests.
- Add DP support to ti-sn65dsi86.
- Add MT8195 DP support to mediatek.
- Support RGB565, XRGB64, and ARGB64 formats in vkms.
- Convert sun4i tv support to atomic.
- Refactor vc4/vec TV Modesetting, and fix timings.
- Use atomic helpers instead of simple display helpers in ssd130x.

Maintainer changes:
- Add Douglas Anderson as reviewer for panel-edp.

----------------------------------------------------------------
Alisa Khabibrakhmanova (1):
       drm/via: Add new condition to via_dma_cleanup()

Arunpravin Paneer Selvam (6):
       drm/ttm: Add new callbacks to ttm res mgr
       drm/ttm: Implement intersect/compatible functions
       drm/amdgpu: Implement intersect/compatible functions
       drm/i915: Implement intersect/compatible functions
       drm/nouveau: Implement intersect/compatible functions
       drm/ttm: Switch to using the new res callback

Beniamin Sandu (1):
       drm/nouveau/hwmon: use simplified HWMON_CHANNEL_INFO macro

Bo-Chen Chen (4):
       drm/mediatek: dp: Add multiple bridge types support
       drm/mediatek: dp: Add multiple smc commands support
       drm/mediatek: dp: Add multiple calibration data formats support
       drm/mediatek: dp: Determine device of next_bridge

Chen-Yu Tsai (1):
       drm/panel-edp: Add Innolux N120ACA-EA1 panel entry

Chia-I Wu (1):
       drm/virtio: set fb_modifiers_not_supported

Chris Morgan (2):
       dt-bindings: Add byteswap order to chrontel ch7033
       drm/bridge: chrontel-ch7033: Add byteswap order setting

Danilo Krummrich (4):
       drm/vc4: hdmi: unlock mutex when device is unplugged
       drm/vc4: plane: protect device resources after removal
       drm/vc4: crtc: protect device resources after removal
       drm/vc4: hvs: protect drm_print_regset32()

Douglas Anderson (2):
       MAINTAINERS: Add myself as a reviewer for panel-edp.c
       drm/panel-edp: Fix typo in kerneldoc comment (appers=>appears)

Gerd Hoffmann (1):
       drm/bochs: fix blanking

Guillaume Ranquet (2):
       drm/mediatek: dp: Add MT8195 External DisplayPort support
       drm/mediatek: dp: Audio support for MT8195

Hsin-Yi Wang (1):
       drm/bridge: ps8640: Add double reset T4 and T5 to power-on sequence

Igor Torrente (9):
       drm: vkms: Replace hardcoded value of `vkms_composer.map` to DRM_FORMAT_MAX_PLANES
       drm: vkms: Rename `vkms_composer` to `vkms_frame_info`
       drm: drm_atomic_helper: Add a new helper to deal with the writeback connector validation
       drm: vkms: get the reference to `drm_framebuffer` instead if coping it
       drm: vkms: Add fb information to `vkms_writeback_job`
       drm: vkms: Refactor the plane composer to accept new formats
       drm: vkms: Supports to the case where primary plane doesn't match the CRTC
       drm: vkms: Adds XRGB_16161616 and ARGB_1616161616 formats
       drm: vkms: Add support to the RGB565 format

Imre Deak (2):
       drm/i915/dp_mst: Fix mst_mgr lookup during atomic check
       drm/dp_mst: Avoid deleting payloads for connectors staying enabled

Jani Nikula (1):
       drm/dp: add drm_dp_phy_name() for getting DP PHY name

Jason Wang (1):
       drm/gma500: Fix comment typo

Javier Martinez Canillas (2):
       drm/msm: Make .remove and .shutdown HW shutdown consistent
       drm/ssd130x: Replace simple display helpers with the atomic helpers

Jilin Yuan (1):
       drm/gma500: fix repeated words in comments

Jitao Shi (1):
       drm/mediatek: dp: Add hpd debounce

Johan Hovold (1):
       drm/panel-edp: add AUO B133UAN02.1 panel entry

Laurent Pinchart (2):
       drm/bridge: ti-sn65dsi86: Support DisplayPort (non-eDP) mode
       drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP

Li zeming (1):
       drm/ttm: Remove unnecessary '0' values from ret

Linus Walleij (1):
       drm/tve200: Fix smatch warning

Lucas Stach (1):
       drm: bridge: dw_hdmi: only trigger hotplug event on link change

Lyude Paul (17):
       drm/amdgpu/dc/mst: Rename dp_mst_stream_allocation(_table)
       drm/amdgpu/dm/mst: Rename get_payload_table()
       drm/display/dp_mst: Rename drm_dp_mst_vcpi_allocation
       drm/display/dp_mst: Call them time slots, not VCPI slots
       drm/display/dp_mst: Fix confusing docs for drm_dp_atomic_release_time_slots()
       drm/display/dp_mst: Add some missing kdocs for atomic MST structs
       drm/display/dp_mst: Add helper for finding payloads in atomic MST state
       drm/display/dp_mst: Add nonblocking helpers for DP MST
       drm/display/dp_mst: Don't open code modeset checks for releasing time slots
       drm/display/dp_mst: Fix modeset tracking in drm_dp_atomic_release_vcpi_slots()
       drm/nouveau/kms: Cache DP encoders in nouveau_connector
       drm/nouveau/kms: Pull mst state in for all modesets
       drm/display/dp_mst: Add helpers for serializing SST <-> MST transitions
       drm/display/dp_mst: Drop all ports from topology on CSNs before queueing link address work
       drm/display/dp_mst: Maintain time slot allocations when deleting payloads
       drm/radeon: Drop legacy MST support
       drm/display/dp_mst: Move all payload info into the atomic state

Marek Vasut (9):
       drm/lcdif: Clean up headers
       drm/lcdif: Consistently use plain timings
       drm/lcdif: Clean up debug prints and comments
       drm/lcdif: switch to devm_drm_of_get_bridge
       drm: bridge: icn6211: Add and use hs_rate and lp_rate
       dt-bindings: display: bridge: icn6211: Add support for external REFCLK
       drm: bridge: icn6211: Add support for external REFCLK
       drm/bridge: tc358767: Handle bridge past DPI output
       drm/bridge: lvds-codec: Fix error checking of drm_of_lvds_get_data_mapping()

Markus Schneider-Pargmann (3):
       dt-bindings: mediatek,dp: Add Display Port binding
       video/hdmi: Add audio_infoframe packing for DP
       drm/mediatek: Add MT8195 Embedded DisplayPort driver

Mateusz Kwiatkowski (3):
       drm/vc4: vec: Refactor VEC TV mode setting
       drm/vc4: vec: Remove redundant atomic_mode_set
       drm/vc4: vec: Fix timings for VEC modes

Maxime Ripard (9):
       drm/vc4: vec: Remove empty mode_fixup
       drm/vc4: vec: Convert to atomic helpers
       drm/sun4i: tv: Remove unused mode_valid
       drm/sun4i: tv: Convert to atomic hooks
       drm/sun4i: tv: Remove useless function
       drm/sun4i: tv: Remove useless destroy function
       drm/sun4i: tv: Rename error label
       drm/sun4i: tv: Add missing reset assertion
       drm/sun4i: tv: Merge mode_set into atomic_enable

Michał Winiarski (2):
       drm/cmdline-parser: Merge negative tests
       drm/cmdline-parser: Use assert when needed

Patrik Jakobsson (1):
       drm/gma500: Fix SDVO command debug printing

Pin-yen Lin (1):
       drm/bridge: it6505: Fix the order of DP_SET_POWER commands

Randy Dunlap (3):
       drm/panel: use 'select' for Ili9341 panel driver helpers
       drm: fix drm_mipi_dbi build errors
       drm/scheduler: quieten kernel-doc warnings

Rob Clark (1):
       drm/virtio: Fix same-context optimization

Robin Murphy (1):
       drm/panfrost: Update io-pgtable API

Simon Ser (3):
       drm: hide unregistered connectors from GETCONNECTOR IOCTL
       drm/atomic-helper: print message on driver connector check failure
       drm/atomic-helper: log EINVAL cause in drm_atomic_helper_async_check()

Steev Klimaszewski (1):
       drm/panel-edp: add IVO M133NW4J-R3 panel entry

Tetsuo Handa (1):
       gpu/drm/bridge/cadence: avoid flush_scheduled_work() usage

Tomi Valkeinen (1):
       drm/bridge: ti-sn65dsi86: Reject modes with too large blanking

Vivek Kasireddy (1):
       udmabuf: Set ubuf->sg = NULL if the creation of sg table fails

Xin Ji (2):
       drm/bridge: anx7625: Support HDMI_I2S audio format
       drm/bridge: anx7625: Set HPD irq detect window to 2ms

Zheyu Ma (1):
       drm/bridge: megachips: Fix a null pointer dereference bug

Zongmin Zhou (1):
       drm/qxl: fix the suspend/resume issue on qxl device

wangjianli (1):
       subdev/clk: fix repeated words in comments

  .../bindings/display/bridge/chipone,icn6211.yaml   |    9 +
  .../bindings/display/bridge/chrontel,ch7033.yaml   |   13 +
  .../bindings/display/mediatek/mediatek,dp.yaml     |  116 +
  Documentation/gpu/vkms.rst                         |    7 +-
  MAINTAINERS                                        |    5 +
  drivers/dma-buf/udmabuf.c                          |    9 +-
  drivers/gpu/drm/Kconfig                            |    1 +
  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |   38 +
  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   45 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |   68 +
  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   68 +-
  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  108 +-
  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  125 +-
  drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   10 +-
  drivers/gpu/drm/amd/display/dc/dm_helpers.h        |    4 +-
  .../drm/amd/display/include/link_service_types.h   |   14 +-
  drivers/gpu/drm/bridge/analogix/anx7625.c          |   37 +-
  drivers/gpu/drm/bridge/analogix/anx7625.h          |    6 +
  .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |    3 +-
  drivers/gpu/drm/bridge/chipone-icn6211.c           |   44 +-
  drivers/gpu/drm/bridge/chrontel-ch7033.c           |   15 +-
  drivers/gpu/drm/bridge/ite-it6505.c                |    8 +-
  drivers/gpu/drm/bridge/lvds-codec.c                |    2 +-
  .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |    4 +-
  drivers/gpu/drm/bridge/parade-ps8640.c             |    5 +
  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   13 +-
  drivers/gpu/drm/bridge/tc358767.c                  |   15 +-
  drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   72 +-
  drivers/gpu/drm/display/drm_dp_helper.c            |   32 +
  drivers/gpu/drm/display/drm_dp_mst_topology.c      | 1139 ++++-----
  drivers/gpu/drm/drm_atomic_helper.c                |   83 +-
  drivers/gpu/drm/drm_mode_config.c                  |    3 +
  drivers/gpu/drm/gma500/cdv_intel_dp.c              |    2 +-
  drivers/gpu/drm/gma500/oaktrail_crtc.c             |    2 +-
  drivers/gpu/drm/gma500/psb_intel_sdvo.c            |   62 +-
  drivers/gpu/drm/i915/display/intel_display.c       |    6 +
  drivers/gpu/drm/i915/display/intel_dp.c            |    9 +
  drivers/gpu/drm/i915/display/intel_dp_mst.c        |   97 +-
  drivers/gpu/drm/i915/display/intel_hdcp.c          |   24 +-
  drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |   41 +-
  drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |   73 +
  drivers/gpu/drm/mediatek/Kconfig                   |    9 +
  drivers/gpu/drm/mediatek/Makefile                  |    2 +
  drivers/gpu/drm/mediatek/mtk_dp.c                  | 2661 ++++++++++++++++++++
  drivers/gpu/drm/mediatek/mtk_dp_reg.h              |  356 +++
  drivers/gpu/drm/msm/msm_drv.c                      |   13 +-
  drivers/gpu/drm/mxsfb/lcdif_drv.c                  |   21 +-
  drivers/gpu/drm/mxsfb/lcdif_drv.h                  |    1 +
  drivers/gpu/drm/mxsfb/lcdif_kms.c                  |   12 +-
  drivers/gpu/drm/nouveau/dispnv50/disp.c            |  197 +-
  drivers/gpu/drm/nouveau/dispnv50/disp.h            |    2 +
  drivers/gpu/drm/nouveau/nouveau_connector.c        |   18 +-
  drivers/gpu/drm/nouveau/nouveau_connector.h        |    3 +
  drivers/gpu/drm/nouveau/nouveau_hwmon.c            |   85 +-
  drivers/gpu/drm/nouveau/nouveau_mem.c              |   29 +
  drivers/gpu/drm/nouveau/nouveau_mem.h              |    6 +
  drivers/gpu/drm/nouveau/nouveau_ttm.c              |   24 +
  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c    |    2 +-
  drivers/gpu/drm/panel/Kconfig                      |    4 +-
  drivers/gpu/drm/panel/panel-edp.c                  |    5 +-
  drivers/gpu/drm/panfrost/panfrost_mmu.c            |   44 +-
  drivers/gpu/drm/qxl/qxl_drv.c                      |    3 +-
  drivers/gpu/drm/radeon/Makefile                    |    2 +-
  drivers/gpu/drm/radeon/atombios_crtc.c             |   11 +-
  drivers/gpu/drm/radeon/atombios_encoders.c         |   59 -
  drivers/gpu/drm/radeon/radeon_atombios.c           |    2 -
  drivers/gpu/drm/radeon/radeon_connectors.c         |   61 +-
  drivers/gpu/drm/radeon/radeon_device.c             |    1 -
  drivers/gpu/drm/radeon/radeon_dp_mst.c             |  778 ------
  drivers/gpu/drm/radeon/radeon_drv.c                |    4 -
  drivers/gpu/drm/radeon/radeon_encoders.c           |   14 +-
  drivers/gpu/drm/radeon/radeon_irq_kms.c            |   10 +-
  drivers/gpu/drm/radeon/radeon_mode.h               |   40 -
  drivers/gpu/drm/scheduler/sched_main.c             |    3 +-
  drivers/gpu/drm/solomon/ssd130x.c                  |  260 +-
  drivers/gpu/drm/solomon/ssd130x.h                  |    9 +-
  drivers/gpu/drm/sun4i/sun4i_tv.c                   |   63 +-
  drivers/gpu/drm/tests/drm_cmdline_parser_test.c    |  373 ++-
  drivers/gpu/drm/tiny/bochs.c                       |    2 +
  drivers/gpu/drm/ttm/ttm_bo.c                       |    9 +-
  drivers/gpu/drm/ttm/ttm_range_manager.c            |   33 +
  drivers/gpu/drm/ttm/ttm_resource.c                 |   64 +-
  drivers/gpu/drm/tve200/tve200_drv.c                |    3 +-
  drivers/gpu/drm/vc4/vc4_crtc.c                     |   41 +-
  drivers/gpu/drm/vc4/vc4_hdmi.c                     |    7 +-
  drivers/gpu/drm/vc4/vc4_hvs.c                      |    4 +-
  drivers/gpu/drm/vc4/vc4_plane.c                    |   20 +
  drivers/gpu/drm/vc4/vc4_vec.c                      |  127 +-
  drivers/gpu/drm/via/via_dri1.c                     |    2 +-
  drivers/gpu/drm/virtio/virtgpu_display.c           |    2 +
  drivers/gpu/drm/virtio/virtgpu_ioctl.c             |    2 +-
  drivers/gpu/drm/vkms/Makefile                      |    1 +
  drivers/gpu/drm/vkms/vkms_composer.c               |  314 +--
  drivers/gpu/drm/vkms/vkms_drv.h                    |   33 +-
  drivers/gpu/drm/vkms/vkms_formats.c                |  301 +++
  drivers/gpu/drm/vkms/vkms_formats.h                |   12 +
  drivers/gpu/drm/vkms/vkms_plane.c                  |   50 +-
  drivers/gpu/drm/vkms/vkms_writeback.c              |   39 +-
  drivers/video/hdmi.c                               |   82 +-
  include/drm/display/drm_dp.h                       |    2 +
  include/drm/display/drm_dp_helper.h                |    2 +
  include/drm/display/drm_dp_mst_helper.h            |  234 +-
  include/drm/drm_atomic_helper.h                    |    3 +
  include/drm/gpu_scheduler.h                        |    9 +-
  include/drm/ttm/ttm_bo_driver.h                    |    2 +-
  include/drm/ttm/ttm_resource.h                     |   40 +
  include/linux/hdmi.h                               |    7 +-
  107 files changed, 6022 insertions(+), 3049 deletions(-)
  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
  delete mode 100644 drivers/gpu/drm/radeon/radeon_dp_mst.c
  create mode 100644 drivers/gpu/drm/vkms/vkms_formats.c
  create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h

--------------8BhS933eyK5qt0XSVPbwvksq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hello Dave, Daniel,

Another pull request for drm-misc-next, enjoy!

~Maarten

drm-misc-next-2022-09-09:
drm-misc-next for v6.1-rc1:

UAPI Changes:
- Hide unregistered connectors from GETCONNECTOR ioctl.
- drm/virtio no longer advertises LINEAR modifier, as it doesn't work.
-

Cross-subsystem Changes:
- Fix GPF in udmabuf failure path.

Core Changes:
- Rework TTM placement to use intersect/compatible functions.
- Drop legacy DP-MST support.
- More DP-MST related fixes, and move all state into atomic.
- Make DRM_MIPI_DBI select DRM_KMS_HELPER.
- Add audio_infoframe packing for DP.
- Add logging when some atomic check functions fail.
- Assorted documentation updates and fixes.

Driver Changes:
- Assorted cleanups and fixes in msm, lcdif, nouveau, virtio,
  panel/ilitek, bridge/icn6211, tve200, gma500, bridge/*, panfrost, via,
  bochs, qxl, sun4i.
- Add add AUO B133UAN02.1, IVO M133NW4J-R3, Innolux N120ACA-EA1 eDP panels.
- Improve DP-MST modeset state handling in amdgpu, nouveau, i915.
- Drop DP-MST from radeon driver, it was broken and only user of legacy
  DP-MST.
- Handle unplugging better in vc4.
- Simplify drm cmdparser tests.
- Add DP support to ti-sn65dsi86.
- Add MT8195 DP support to mediatek.
- Support RGB565, XRGB64, and ARGB64 formats in vkms.
- Convert sun4i tv support to atomic.
- Refactor vc4/vec TV Modesetting, and fix timings.
- Use atomic helpers instead of simple display helpers in ssd130x.

Maintainer changes:
- Add Douglas Anderson as reviewer for panel-edp.
The following changes since commit 8869fa666a9e6782c3c896c1fa57d65adca23249:

  drm/virtio: remove drm_plane_cleanup() destroy hook (2022-08-19 16:00:15 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2022-09-09

for you to fetch changes up to 5d832b6694e094b176627ed9918a1b21c56fb742:

  drm/dp_mst: Avoid deleting payloads for connectors staying enabled (2022-09-08 19:41:18 +0300)

----------------------------------------------------------------
drm-misc-next for v6.1-rc1:

UAPI Changes:
- Hide unregistered connectors from GETCONNECTOR ioctl.
- drm/virtio no longer advertises LINEAR modifier, as it doesn't work.
-

Cross-subsystem Changes:
- Fix GPF in udmabuf failure path.

Core Changes:
- Rework TTM placement to use intersect/compatible functions.
- Drop legacy DP-MST support.
- More DP-MST related fixes, and move all state into atomic.
- Make DRM_MIPI_DBI select DRM_KMS_HELPER.
- Add audio_infoframe packing for DP.
- Add logging when some atomic check functions fail.
- Assorted documentation updates and fixes.

Driver Changes:
- Assorted cleanups and fixes in msm, lcdif, nouveau, virtio,
  panel/ilitek, bridge/icn6211, tve200, gma500, bridge/*, panfrost, via,
  bochs, qxl, sun4i.
- Add add AUO B133UAN02.1, IVO M133NW4J-R3, Innolux N120ACA-EA1 eDP panels.
- Improve DP-MST modeset state handling in amdgpu, nouveau, i915.
- Drop DP-MST from radeon driver, it was broken and only user of legacy
  DP-MST.
- Handle unplugging better in vc4.
- Simplify drm cmdparser tests.
- Add DP support to ti-sn65dsi86.
- Add MT8195 DP support to mediatek.
- Support RGB565, XRGB64, and ARGB64 formats in vkms.
- Convert sun4i tv support to atomic.
- Refactor vc4/vec TV Modesetting, and fix timings.
- Use atomic helpers instead of simple display helpers in ssd130x.

Maintainer changes:
- Add Douglas Anderson as reviewer for panel-edp.

----------------------------------------------------------------
Alisa Khabibrakhmanova (1):
      drm/via: Add new condition to via_dma_cleanup()

Arunpravin Paneer Selvam (6):
      drm/ttm: Add new callbacks to ttm res mgr
      drm/ttm: Implement intersect/compatible functions
      drm/amdgpu: Implement intersect/compatible functions
      drm/i915: Implement intersect/compatible functions
      drm/nouveau: Implement intersect/compatible functions
      drm/ttm: Switch to using the new res callback

Beniamin Sandu (1):
      drm/nouveau/hwmon: use simplified HWMON_CHANNEL_INFO macro

Bo-Chen Chen (4):
      drm/mediatek: dp: Add multiple bridge types support
      drm/mediatek: dp: Add multiple smc commands support
      drm/mediatek: dp: Add multiple calibration data formats support
      drm/mediatek: dp: Determine device of next_bridge

Chen-Yu Tsai (1):
      drm/panel-edp: Add Innolux N120ACA-EA1 panel entry

Chia-I Wu (1):
      drm/virtio: set fb_modifiers_not_supported

Chris Morgan (2):
      dt-bindings: Add byteswap order to chrontel ch7033
      drm/bridge: chrontel-ch7033: Add byteswap order setting

Danilo Krummrich (4):
      drm/vc4: hdmi: unlock mutex when device is unplugged
      drm/vc4: plane: protect device resources after removal
      drm/vc4: crtc: protect device resources after removal
      drm/vc4: hvs: protect drm_print_regset32()

Douglas Anderson (2):
      MAINTAINERS: Add myself as a reviewer for panel-edp.c
      drm/panel-edp: Fix typo in kerneldoc comment (appers=&gt;appears)

Gerd Hoffmann (1):
      drm/bochs: fix blanking

Guillaume Ranquet (2):
      drm/mediatek: dp: Add MT8195 External DisplayPort support
      drm/mediatek: dp: Audio support for MT8195

Hsin-Yi Wang (1):
      drm/bridge: ps8640: Add double reset T4 and T5 to power-on sequence

Igor Torrente (9):
      drm: vkms: Replace hardcoded value of `vkms_composer.map` to DRM_FORMAT_MAX_PLANES
      drm: vkms: Rename `vkms_composer` to `vkms_frame_info`
      drm: drm_atomic_helper: Add a new helper to deal with the writeback connector validation
      drm: vkms: get the reference to `drm_framebuffer` instead if coping it
      drm: vkms: Add fb information to `vkms_writeback_job`
      drm: vkms: Refactor the plane composer to accept new formats
      drm: vkms: Supports to the case where primary plane doesn't match the CRTC
      drm: vkms: Adds XRGB_16161616 and ARGB_1616161616 formats
      drm: vkms: Add support to the RGB565 format

Imre Deak (2):
      drm/i915/dp_mst: Fix mst_mgr lookup during atomic check
      drm/dp_mst: Avoid deleting payloads for connectors staying enabled

Jani Nikula (1):
      drm/dp: add drm_dp_phy_name() for getting DP PHY name

Jason Wang (1):
      drm/gma500: Fix comment typo

Javier Martinez Canillas (2):
      drm/msm: Make .remove and .shutdown HW shutdown consistent
      drm/ssd130x: Replace simple display helpers with the atomic helpers

Jilin Yuan (1):
      drm/gma500: fix repeated words in comments

Jitao Shi (1):
      drm/mediatek: dp: Add hpd debounce

Johan Hovold (1):
      drm/panel-edp: add AUO B133UAN02.1 panel entry

Laurent Pinchart (2):
      drm/bridge: ti-sn65dsi86: Support DisplayPort (non-eDP) mode
      drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP

Li zeming (1):
      drm/ttm: Remove unnecessary '0' values from ret

Linus Walleij (1):
      drm/tve200: Fix smatch warning

Lucas Stach (1):
      drm: bridge: dw_hdmi: only trigger hotplug event on link change

Lyude Paul (17):
      drm/amdgpu/dc/mst: Rename dp_mst_stream_allocation(_table)
      drm/amdgpu/dm/mst: Rename get_payload_table()
      drm/display/dp_mst: Rename drm_dp_mst_vcpi_allocation
      drm/display/dp_mst: Call them time slots, not VCPI slots
      drm/display/dp_mst: Fix confusing docs for drm_dp_atomic_release_time_slots()
      drm/display/dp_mst: Add some missing kdocs for atomic MST structs
      drm/display/dp_mst: Add helper for finding payloads in atomic MST state
      drm/display/dp_mst: Add nonblocking helpers for DP MST
      drm/display/dp_mst: Don't open code modeset checks for releasing time slots
      drm/display/dp_mst: Fix modeset tracking in drm_dp_atomic_release_vcpi_slots()
      drm/nouveau/kms: Cache DP encoders in nouveau_connector
      drm/nouveau/kms: Pull mst state in for all modesets
      drm/display/dp_mst: Add helpers for serializing SST &lt;-&gt; MST transitions
      drm/display/dp_mst: Drop all ports from topology on CSNs before queueing link address work
      drm/display/dp_mst: Maintain time slot allocations when deleting payloads
      drm/radeon: Drop legacy MST support
      drm/display/dp_mst: Move all payload info into the atomic state

Marek Vasut (9):
      drm/lcdif: Clean up headers
      drm/lcdif: Consistently use plain timings
      drm/lcdif: Clean up debug prints and comments
      drm/lcdif: switch to devm_drm_of_get_bridge
      drm: bridge: icn6211: Add and use hs_rate and lp_rate
      dt-bindings: display: bridge: icn6211: Add support for external REFCLK
      drm: bridge: icn6211: Add support for external REFCLK
      drm/bridge: tc358767: Handle bridge past DPI output
      drm/bridge: lvds-codec: Fix error checking of drm_of_lvds_get_data_mapping()

Markus Schneider-Pargmann (3):
      dt-bindings: mediatek,dp: Add Display Port binding
      video/hdmi: Add audio_infoframe packing for DP
      drm/mediatek: Add MT8195 Embedded DisplayPort driver

Mateusz Kwiatkowski (3):
      drm/vc4: vec: Refactor VEC TV mode setting
      drm/vc4: vec: Remove redundant atomic_mode_set
      drm/vc4: vec: Fix timings for VEC modes

Maxime Ripard (9):
      drm/vc4: vec: Remove empty mode_fixup
      drm/vc4: vec: Convert to atomic helpers
      drm/sun4i: tv: Remove unused mode_valid
      drm/sun4i: tv: Convert to atomic hooks
      drm/sun4i: tv: Remove useless function
      drm/sun4i: tv: Remove useless destroy function
      drm/sun4i: tv: Rename error label
      drm/sun4i: tv: Add missing reset assertion
      drm/sun4i: tv: Merge mode_set into atomic_enable

Michał Winiarski (2):
      drm/cmdline-parser: Merge negative tests
      drm/cmdline-parser: Use assert when needed

Patrik Jakobsson (1):
      drm/gma500: Fix SDVO command debug printing

Pin-yen Lin (1):
      drm/bridge: it6505: Fix the order of DP_SET_POWER commands

Randy Dunlap (3):
      drm/panel: use 'select' for Ili9341 panel driver helpers
      drm: fix drm_mipi_dbi build errors
      drm/scheduler: quieten kernel-doc warnings

Rob Clark (1):
      drm/virtio: Fix same-context optimization

Robin Murphy (1):
      drm/panfrost: Update io-pgtable API

Simon Ser (3):
      drm: hide unregistered connectors from GETCONNECTOR IOCTL
      drm/atomic-helper: print message on driver connector check failure
      drm/atomic-helper: log EINVAL cause in drm_atomic_helper_async_check()

Steev Klimaszewski (1):
      drm/panel-edp: add IVO M133NW4J-R3 panel entry

Tetsuo Handa (1):
      gpu/drm/bridge/cadence: avoid flush_scheduled_work() usage

Tomi Valkeinen (1):
      drm/bridge: ti-sn65dsi86: Reject modes with too large blanking

Vivek Kasireddy (1):
      udmabuf: Set ubuf-&gt;sg = NULL if the creation of sg table fails

Xin Ji (2):
      drm/bridge: anx7625: Support HDMI_I2S audio format
      drm/bridge: anx7625: Set HPD irq detect window to 2ms

Zheyu Ma (1):
      drm/bridge: megachips: Fix a null pointer dereference bug

Zongmin Zhou (1):
      drm/qxl: fix the suspend/resume issue on qxl device

wangjianli (1):
      subdev/clk: fix repeated words in comments

 .../bindings/display/bridge/chipone,icn6211.yaml   |    9 +
 .../bindings/display/bridge/chrontel,ch7033.yaml   |   13 +
 .../bindings/display/mediatek/mediatek,dp.yaml     |  116 +
 Documentation/gpu/vkms.rst                         |    7 +-
 MAINTAINERS                                        |    5 +
 drivers/dma-buf/udmabuf.c                          |    9 +-
 drivers/gpu/drm/Kconfig                            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |   38 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   45 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |   68 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   68 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  108 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  125 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   10 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |    4 +-
 .../drm/amd/display/include/link_service_types.h   |   14 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   37 +-
 drivers/gpu/drm/bridge/analogix/anx7625.h          |    6 +
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |    3 +-
 drivers/gpu/drm/bridge/chipone-icn6211.c           |   44 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |   15 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |    8 +-
 drivers/gpu/drm/bridge/lvds-codec.c                |    2 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |    4 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |    5 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   13 +-
 drivers/gpu/drm/bridge/tc358767.c                  |   15 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   72 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |   32 +
 drivers/gpu/drm/display/drm_dp_mst_topology.c      | 1139 ++++-----
 drivers/gpu/drm/drm_atomic_helper.c                |   83 +-
 drivers/gpu/drm/drm_mode_config.c                  |    3 +
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |    2 +-
 drivers/gpu/drm/gma500/oaktrail_crtc.c             |    2 +-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c            |   62 +-
 drivers/gpu/drm/i915/display/intel_display.c       |    6 +
 drivers/gpu/drm/i915/display/intel_dp.c            |    9 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   97 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   24 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |   41 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |   73 +
 drivers/gpu/drm/mediatek/Kconfig                   |    9 +
 drivers/gpu/drm/mediatek/Makefile                  |    2 +
 drivers/gpu/drm/mediatek/mtk_dp.c                  | 2661 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h              |  356 +++
 drivers/gpu/drm/msm/msm_drv.c                      |   13 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c                  |   21 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.h                  |    1 +
 drivers/gpu/drm/mxsfb/lcdif_kms.c                  |   12 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |  197 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.h            |    2 +
 drivers/gpu/drm/nouveau/nouveau_connector.c        |   18 +-
 drivers/gpu/drm/nouveau/nouveau_connector.h        |    3 +
 drivers/gpu/drm/nouveau/nouveau_hwmon.c            |   85 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c              |   29 +
 drivers/gpu/drm/nouveau/nouveau_mem.h              |    6 +
 drivers/gpu/drm/nouveau/nouveau_ttm.c              |   24 +
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c    |    2 +-
 drivers/gpu/drm/panel/Kconfig                      |    4 +-
 drivers/gpu/drm/panel/panel-edp.c                  |    5 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |   44 +-
 drivers/gpu/drm/qxl/qxl_drv.c                      |    3 +-
 drivers/gpu/drm/radeon/Makefile                    |    2 +-
 drivers/gpu/drm/radeon/atombios_crtc.c             |   11 +-
 drivers/gpu/drm/radeon/atombios_encoders.c         |   59 -
 drivers/gpu/drm/radeon/radeon_atombios.c           |    2 -
 drivers/gpu/drm/radeon/radeon_connectors.c         |   61 +-
 drivers/gpu/drm/radeon/radeon_device.c             |    1 -
 drivers/gpu/drm/radeon/radeon_dp_mst.c             |  778 ------
 drivers/gpu/drm/radeon/radeon_drv.c                |    4 -
 drivers/gpu/drm/radeon/radeon_encoders.c           |   14 +-
 drivers/gpu/drm/radeon/radeon_irq_kms.c            |   10 +-
 drivers/gpu/drm/radeon/radeon_mode.h               |   40 -
 drivers/gpu/drm/scheduler/sched_main.c             |    3 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |  260 +-
 drivers/gpu/drm/solomon/ssd130x.h                  |    9 +-
 drivers/gpu/drm/sun4i/sun4i_tv.c                   |   63 +-
 drivers/gpu/drm/tests/drm_cmdline_parser_test.c    |  373 ++-
 drivers/gpu/drm/tiny/bochs.c                       |    2 +
 drivers/gpu/drm/ttm/ttm_bo.c                       |    9 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c            |   33 +
 drivers/gpu/drm/ttm/ttm_resource.c                 |   64 +-
 drivers/gpu/drm/tve200/tve200_drv.c                |    3 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                     |   41 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |    7 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                      |    4 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    |   20 +
 drivers/gpu/drm/vc4/vc4_vec.c                      |  127 +-
 drivers/gpu/drm/via/via_dri1.c                     |    2 +-
 drivers/gpu/drm/virtio/virtgpu_display.c           |    2 +
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |    2 +-
 drivers/gpu/drm/vkms/Makefile                      |    1 +
 drivers/gpu/drm/vkms/vkms_composer.c               |  314 +--
 drivers/gpu/drm/vkms/vkms_drv.h                    |   33 +-
 drivers/gpu/drm/vkms/vkms_formats.c                |  301 +++
 drivers/gpu/drm/vkms/vkms_formats.h                |   12 +
 drivers/gpu/drm/vkms/vkms_plane.c                  |   50 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |   39 +-
 drivers/video/hdmi.c                               |   82 +-
 include/drm/display/drm_dp.h                       |    2 +
 include/drm/display/drm_dp_helper.h                |    2 +
 include/drm/display/drm_dp_mst_helper.h            |  234 +-
 include/drm/drm_atomic_helper.h                    |    3 +
 include/drm/gpu_scheduler.h                        |    9 +-
 include/drm/ttm/ttm_bo_driver.h                    |    2 +-
 include/drm/ttm/ttm_resource.h                     |   40 +
 include/linux/hdmi.h                               |    7 +-
 107 files changed, 6022 insertions(+), 3049 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
 delete mode 100644 drivers/gpu/drm/radeon/radeon_dp_mst.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_formats.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h

</pre>
  </body>
</html>

--------------8BhS933eyK5qt0XSVPbwvksq--
