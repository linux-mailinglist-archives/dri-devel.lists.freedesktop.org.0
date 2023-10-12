Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8897C69D5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 11:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEA010E479;
	Thu, 12 Oct 2023 09:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F0D10E478;
 Thu, 12 Oct 2023 09:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697103657; x=1728639657;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=82xtK4CRson0HmzNLj8PWoNvxhFjibSfwO+ZQIWbpVw=;
 b=CvRrF/wBX/aQWVtKuZ67tk3orT5CFEe8bxeIOGJuBcUC5BtP8KA3PWxv
 vVFFZcUUBvijysTm7gjCB7D1YUpKV6EmbpzUunXPw2SnD/vJGTvrV6swO
 QzmRXXCqUjejyo7stjpskUmSmgU0e7GerimKzJqBs38fStHoKoqgmw/9s
 DyO0vI9v/kTCUTggoWRPjtspjsOaCcCDqcPkNT1F3IMSFfwn1R+I4JseF
 B7/Tc06t0ILGj1u3jp7M4Nbn7DnR2cfiyqd+3wycVy/UgKxG/BAG+9x7j
 jBB7hVLDf2pUmQbBao/b7lJJC4pEhD59DAEg3RmYml7t1wBHDbrPv9Xui g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="6430274"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="6430274"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 02:40:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="789318697"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="789318697"
Received: from pgarraul-mobl1.ger.corp.intel.com (HELO [10.251.223.107])
 ([10.251.223.107])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 02:40:52 -0700
Message-ID: <3812345e-b086-4d72-8504-f58d84e8feab@linux.intel.com>
Date: Thu, 12 Oct 2023 11:40:48 +0200
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

drm-misc-next-2023-10-12:
drm-misc-next for v6.7-rc1:

Contains the previous pull request drm-misc-next-2023-10-06 + following:

Cross-subsystem Changes:
- Rename fb_pgprot to pgprot_framebuffer and remove file argument/
- Update iosys-map documentation typos.

Core Changes:
- Assorted fixes to drm/panel.
- Add HPD state to drm_connector_oob_hotplug_event(), and implement
   oob hotplug events in bridge connector.
- Replace drm_framebuffer_plane_width/height  with calls to
   drm_format_info_plane_width/height.

Driver Changes:
- Clock and debug fixes for bridge/samsung-dsim.
- More btree -> maple tree conversions.
- Assorted bugfixes in rockchip, panel-tpo-tpg110,
- Add LTK050H3148W-CTA6 panel support.
- Assorted small fixes in host1x, tegra, simpledrm.
- Suspend fixes for host1x.
The following changes since commit 389af786f92ecdff35883551d54bf4e507ffcccb:

   Merge tag 'drm-intel-next-2023-09-29' of 
git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-10-04 
13:55:19 +1000)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-10-12

for you to fetch changes up to c395c83aafbb9cdbe4230f044d5b8eaf9080c0c5:

   drm/simpledrm: Fix power domain device link validity check 
(2023-10-12 10:39:48 +0200)

----------------------------------------------------------------
drm-misc-next for v6.7-rc1:

Contains the previous pull request drm-misc-next-2023-10-06 + following:

Cross-subsystem Changes:
- Rename fb_pgprot to pgprot_framebuffer and remove file argument/
- Update iosys-map documentation typos.

Core Changes:
- Assorted fixes to drm/panel.
- Add HPD state to drm_connector_oob_hotplug_event(), and implement
   oob hotplug events in bridge connector.
- Replace drm_framebuffer_plane_width/height  with calls to
   drm_format_info_plane_width/height.

Driver Changes:
- Clock and debug fixes for bridge/samsung-dsim.
- More btree -> maple tree conversions.
- Assorted bugfixes in rockchip, panel-tpo-tpg110,
- Add LTK050H3148W-CTA6 panel support.
- Assorted small fixes in host1x, tegra, simpledrm.
- Suspend fixes for host1x.

----------------------------------------------------------------
Adrián Larumbe (6):
       drm/panfrost: Add cycle count GPU register definitions
       drm/panfrost: Add fdinfo support GPU load metrics
       drm/panfrost: Add fdinfo support for memory stats
       drm/drm_file: Add DRM obj's RSS reporting function for fdinfo
       drm/panfrost: Implement generic DRM object RSS reporting function
       Documentation/gpu: fix Panfrost documentation build warnings

André Almeida (1):
       drm/doc: Document DRM device reset expectations

Arnd Bergmann (1):
       drm/nouveau/kms/nv50: hide unused variables

Arthur Grillo (2):
       drm/tests: Add calls to drm_fb_blit() on supported format 
conversion tests
       drm/tests: Add new format conversion tests to better cover 
drm_fb_blit()

Bjorn Andersson (1):
       drm: Add HPD state to drm_connector_oob_hotplug_event()

Carlos Eduardo Gallo Filho (2):
       drm: Remove plane hsub/vsub alignment requirement for core helpers
       drm: Replace drm_framebuffer plane size functions with its 
equivalents

Chris Morgan (2):
       dt-bindings: display: newvision,nv3051d: Add Anbernic 351V
       drm/panel: nv3051d: Add Support for Anbernic 351V

Christophe JAILLET (1):
       drm/rockchip: cdn-dp: Fix some error handling paths in cdn_dp_probe()

Danilo Krummrich (1):
       drm/gpuvm: doc: fix filename references

Dmitry Baryshkov (2):
       drm/bridge_connector: stop filtering events in 
drm_bridge_connector_hpd_cb()
       drm/bridge_connector: implement oob_hotplug_event

Douglas Anderson (1):
       MAINTAINERS: Document that the NXP i.MX 8MQ DCSS driver goes thru 
drm-misc

Jani Nikula (3):
       drm/bridge: use drm_bridge_get_edid() instead of using ->get_edid 
directly
       drm/bridge: lt9611uxc: use drm_bridge_get_edid() instead of using 
->get_edid directly
       drm/dp: switch drm_dp_downstream_*() helpers to struct drm_edid

Johannes Zink (3):
       dt-bindings: display: move LVDS data-mapping definition to 
separate file
       dt-bindings: display: simple: support non-default data-mapping
       drm/panel-simple: allow LVDS format override

Johnny Liu (1):
       gpu: host1x: Correct allocated size for contexts

Justin Stitt (1):
       drm/gma500: refactor deprecated strncpy

Kees Cook (9):
       drm/amd/pm: Annotate struct smu10_voltage_dependency_table with 
__counted_by
       drm/amdgpu/discovery: Annotate struct ip_hw_instance with 
__counted_by
       drm/i915/selftests: Annotate struct perf_series with __counted_by
       drm/msm/dpu: Annotate struct dpu_hw_intr with __counted_by
       drm/nouveau/pm: Annotate struct nvkm_perfdom with __counted_by
       drm/vc4: Annotate struct vc4_perfmon with __counted_by
       drm/virtio: Annotate struct virtio_gpu_object_array with __counted_by
       drm/vmwgfx: Annotate struct vmw_surface_dirty with __counted_by
       drm/v3d: Annotate struct v3d_perfmon with __counted_by

Klaus Goger (1):
       drm/panel: ltk050h3146w: add support for Leadtek 
LTK050H3148W-CTA6 variant

Konrad Dybcio (2):
       dt-bindings: display: panel: Add Raydium RM692E5
       drm/panel: Add driver for BOE RM692E5 AMOLED panel

Lee Jones (1):
       drm/tegra: hub: Increase buffer size to ensure all possible 
values can be stored

Ma Ke (2):
       drm/panel: fix a possible null pointer dereference
       drm/panel/panel-tpo-tpg110: fix a possible null pointer dereference

Marco Felsch (1):
       drm/bridge: samsung-dsim: add more mipi-dsi device debug information

Mark Brown (9):
       drm/bridge: adv7511: Convert to use maple tree register cache
       drm/bridge: dpc3433: Convert to use maple tree register cache
       drm/bridge: tc358767: Convert to use maple tree register cache
       drm/bridge: icn6211: Convert to use maple tree register cache
       drm/bridge: lt9211: Convert to use maple tree register cache
       drm/bridge: sn65dsi83: Convert to use maple tree register cache
       drm/panel: ili9322: Remove redundant volatle_reg() operation
       drm/panel: ili9322: Convert to use maple tree register cache
       drm/rockchip: vop2: Convert to use maple tree register cache

Maxime Ripard (1):
       MAINTAINERS: Update drm-misc entry to match all drivers

Michael Tretter (5):
       drm/bridge: samsung-dsim: reread ref clock before configuring PLL
       drm/bridge: samsung-dsim: update PLL reference clock
       drm/bridge: samsung-dsim: adjust porches by rounding up
       drm/bridge: samsung-dsim: calculate porches in Hz
       drm/rockchip: vop2: Demote message in mod_supported to drm_dbg_kms

Mikko Perttunen (5):
       gpu: host1x: Add locking in channel allocation
       gpu: host1x: Stop CDMA before suspending
       gpu: host1x: Enable system suspend callbacks
       gpu: host1x: Syncpoint interrupt sharding
       drm/tegra: Zero-initialize iosys_map

Quentin Schulz (2):
       drm/panel: ltk050h3146w: add mipi_dsi_device.mode_flags to 
of_match_data
       dt-bindings: ltk050h3146w: add compatible for LTK050H3148W-CTA6 
variant

Randy Dunlap (1):
       iosys-map: fix kernel-doc typos

Stanislaw Gruszka (2):
       accel/ivpu: Update debugfs to latest changes in DRM
       accel/ivpu: Compile ivpu_debugfs.c conditionally

Sui Jingfeng (1):
       drm/tegra: Remove surplus else after return

Thierry Reding (2):
       drm/tegra: gem: Do not return NULL in tegra_bo_mmap()
       drm/simpledrm: Fix power domain device link validity check

Thomas Zimmermann (3):
       Merge drm/drm-next into drm-misc-next
       fbdev: Avoid file argument in fb_pgprotect()
       fbdev: Replace fb_pgprotect() with pgprot_framebuffer()

Uwe Kleine-König (1):
       drm: exynos: dsi: Convert to platform remove callback returning void

Ville Syrjälä (1):
       drm/vblank: Warn when silently cancelling vblank works

Wayne Lin (1):
       drm/amd/display: Fix mst hub unplug warning

Yang Li (1):
       drm/rockchip: dsi: Use devm_platform_get_and_ioremap_resource()

Yue Haibing (1):
       drm/tegra: Remove two unused function declarations

Zhu Wang (1):
       drm/rockchip: remove redundant of_match_ptr

  .../bindings/display/lvds-data-mapping.yaml        |  84 ++++
  .../devicetree/bindings/display/lvds.yaml          |  77 +---
  .../display/panel/leadtek,ltk050h3146w.yaml        |   1 +
  .../bindings/display/panel/newvision,nv3051d.yaml  |   5 +-
  .../bindings/display/panel/panel-simple.yaml       |  26 +-
  .../bindings/display/panel/raydium,rm692e5.yaml    |  73 ++++
  Documentation/gpu/drivers.rst                      |   1 +
  Documentation/gpu/drm-mm.rst                       |  20 +-
  Documentation/gpu/drm-uapi.rst                     |  77 ++++
  Documentation/gpu/drm-usage-stats.rst              |   1 +
  Documentation/gpu/panfrost.rst                     |  40 ++
  MAINTAINERS                                        |  22 +-
  arch/ia64/include/asm/fb.h                         |  15 +-
  arch/m68k/include/asm/fb.h                         |  19 +-
  arch/mips/include/asm/fb.h                         |  11 +-
  arch/powerpc/include/asm/fb.h                      |  18 +-
  arch/sparc/include/asm/fb.h                        |  15 +-
  arch/x86/include/asm/fb.h                          |  10 +-
  arch/x86/video/fbdev.c                             |  15 +-
  drivers/accel/ivpu/Makefile                        |   3 +-
  drivers/accel/ivpu/ivpu_debugfs.c                  |  50 +--
  drivers/accel/ivpu/ivpu_debugfs.h                  |   8 +-
  drivers/accel/ivpu/ivpu_drv.c                      |   6 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   2 +-
  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  38 +-
  .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h   |   2 +-
  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   4 +-
  drivers/gpu/drm/bridge/chipone-icn6211.c           |   2 +-
  drivers/gpu/drm/bridge/lontium-lt9211.c            |   2 +-
  drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   2 +-
  drivers/gpu/drm/bridge/samsung-dsim.c              |  60 ++-
  drivers/gpu/drm/bridge/tc358767.c                  |   2 +-
  drivers/gpu/drm/bridge/ti-dlpc3433.c               |   2 +-
  drivers/gpu/drm/bridge/ti-sn65dsi83.c              |   2 +-
  drivers/gpu/drm/display/drm_dp_helper.c            |  39 +-
  drivers/gpu/drm/drm_bridge_connector.c             |  38 +-
  drivers/gpu/drm/drm_connector.c                    |   6 +-
  drivers/gpu/drm/drm_file.c                         |   8 +-
  drivers/gpu/drm/drm_framebuffer.c                  |  64 +---
  drivers/gpu/drm/drm_vblank_work.c                  |   3 +
  drivers/gpu/drm/exynos/exynos_drm_dsi.c            |   2 +-
  drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c         |   2 +-
  drivers/gpu/drm/i915/display/intel_display_core.h  |   3 +
  .../gpu/drm/i915/display/intel_display_debugfs.c   |   3 +-
  drivers/gpu/drm/i915/display/intel_dp.c            |  27 +-
  drivers/gpu/drm/i915/display/intel_fb.c            |   2 +-
  drivers/gpu/drm/i915/selftests/i915_request.c      |   2 +-
  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |   2 +-
  drivers/gpu/drm/nouveau/dispnv50/disp.c            |   4 +-
  drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h      |   2 +-
  drivers/gpu/drm/panel/Kconfig                      |   9 +
  drivers/gpu/drm/panel/Makefile                     |   1 +
  drivers/gpu/drm/panel/panel-arm-versatile.c        |   2 +
  drivers/gpu/drm/panel/panel-ilitek-ili9322.c       |   8 +-
  drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |  97 ++++-
  drivers/gpu/drm/panel/panel-newvision-nv3051d.c    |   7 +
  drivers/gpu/drm/panel/panel-raydium-rm692e5.c      | 423 
+++++++++++++++++++++
  drivers/gpu/drm/panel/panel-simple.c               |  53 +++
  drivers/gpu/drm/panel/panel-tpo-tpg110.c           |   2 +
  drivers/gpu/drm/panfrost/Makefile                  |   2 +
  drivers/gpu/drm/panfrost/panfrost_debugfs.c        |  21 +
  drivers/gpu/drm/panfrost/panfrost_debugfs.h        |  14 +
  drivers/gpu/drm/panfrost/panfrost_devfreq.c        |   8 +
  drivers/gpu/drm/panfrost/panfrost_devfreq.h        |   3 +
  drivers/gpu/drm/panfrost/panfrost_device.c         |   2 +
  drivers/gpu/drm/panfrost/panfrost_device.h         |  13 +
  drivers/gpu/drm/panfrost/panfrost_drv.c            |  60 ++-
  drivers/gpu/drm/panfrost/panfrost_gem.c            |  30 ++
  drivers/gpu/drm/panfrost/panfrost_gem.h            |   5 +
  drivers/gpu/drm/panfrost/panfrost_gpu.c            |  41 ++
  drivers/gpu/drm/panfrost/panfrost_gpu.h            |   4 +
  drivers/gpu/drm/panfrost/panfrost_job.c            |  24 ++
  drivers/gpu/drm/panfrost/panfrost_job.h            |   5 +
  drivers/gpu/drm/panfrost/panfrost_mmu.c            |   1 +
  drivers/gpu/drm/panfrost/panfrost_regs.h           |   5 +
  drivers/gpu/drm/rockchip/cdn-dp-core.c             |  17 +-
  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |   3 +-
  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |   6 +-
  drivers/gpu/drm/rockchip/rockchip_lvds.c           |   2 +-
  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |   2 +-
  drivers/gpu/drm/tegra/drm.h                        |   3 -
  drivers/gpu/drm/tegra/gem.c                        |  32 +-
  drivers/gpu/drm/tegra/hub.c                        |   2 +-
  drivers/gpu/drm/tests/drm_format_helper_test.c     | 284 ++++++++++++++
  drivers/gpu/drm/tiny/simpledrm.c                   |   2 +-
  drivers/gpu/drm/v3d/v3d_drv.h                      |   2 +-
  drivers/gpu/drm/vc4/vc4_drv.h                      |   2 +-
  drivers/gpu/drm/virtio/virtgpu_drv.h               |   2 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |   2 +-
  drivers/gpu/host1x/channel.c                       |  26 ++
  drivers/gpu/host1x/channel.h                       |   4 +
  drivers/gpu/host1x/context.c                       |   4 +-
  drivers/gpu/host1x/dev.c                           |  32 +-
  drivers/gpu/host1x/dev.h                           |   3 +-
  drivers/gpu/host1x/hw/intr_hw.c                    |  46 ++-
  drivers/usb/typec/altmodes/displayport.c           |  17 +-
  drivers/video/fbdev/core/fb_chrdev.c               |   3 +-
  include/asm-generic/fb.h                           |  12 +-
  include/drm/bridge/samsung-dsim.h                  |   5 +-
  include/drm/display/drm_dp_helper.h                |  12 +-
  include/drm/drm_connector.h                        |   6 +-
  include/drm/drm_fourcc.h                           |   5 +-
  include/drm/drm_framebuffer.h                      |   5 -
  include/drm/drm_gem.h                              |   9 +
  include/linux/iosys-map.h                          |   4 +-
  105 files changed, 1899 insertions(+), 417 deletions(-)
  create mode 100644 
Documentation/devicetree/bindings/display/lvds-data-mapping.yaml
  create mode 100644 
Documentation/devicetree/bindings/display/panel/raydium,rm692e5.yaml
  create mode 100644 Documentation/gpu/panfrost.rst
  create mode 100644 drivers/gpu/drm/panel/panel-raydium-rm692e5.c
  create mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
  create mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h
