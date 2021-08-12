Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2684E3EAB14
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 21:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177376E452;
	Thu, 12 Aug 2021 19:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CBA6E450;
 Thu, 12 Aug 2021 19:35:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="301020085"
X-IronPort-AV: E=Sophos;i="5.84,316,1620716400"; d="scan'208";a="301020085"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 12:34:53 -0700
X-IronPort-AV: E=Sophos;i="5.84,316,1620716400"; d="scan'208";a="528004273"
Received: from msvoboda-mobl1.ger.corp.intel.com (HELO [10.252.37.133])
 ([10.252.37.133])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 12:34:51 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next
Message-ID: <1cf2d7fc-402d-1852-574a-21cbbd2eaebf@linux.intel.com>
Date: Thu, 12 Aug 2021 21:34:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

Last drm-misc-next for next kernel release!

drm-misc-next-2021-08-12:
drm-misc-next for v5.15:

UAPI Changes:

Cross-subsystem Changes:
- Add lockdep_assert(once) helpers.

Core Changes:
- Add lockdep assert to drm_is_current_master_locked.
- Fix typos in dma-buf documentation.
- Mark drm irq midlayer as legacy only.
- Fix GPF in udmabuf_create.
- Rename member to correct value in drm_edid.h

Driver Changes:
- Build fix to make nouveau build with NOUVEAU_BACKLIGHT.
- Add MI101AIT-ICP1, LTTD800480070-L6WWH-RT panels.
- Assorted fixes to bridge/it66121, anx7625.
- Add custom crtc_state to simple helpers, and use it to
  convert pll handling in mgag200 to atomic.
- Convert drivers to use offset-adjusted framebuffer bo mappings.
- Assorted small fixes and fix for a use-after-free in vmwgfx.
- Convert remaining callers of non-legacy drivers to use linux irqs directly.
- Small cleanup in ingenic.
- Small fixes to virtio and ti-sn65dsi86.
The following changes since commit 5a04227326b04c15b015181772f5c853172fdb68:

  drm/panel: Add ilitek ili9341 panel driver (2021-08-05 11:09:23 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-08-12

for you to fetch changes up to c7782443a88926a4f938f0193041616328cf2db2:

  drm/bridge: ti-sn65dsi86: Avoid creating multiple connectors (2021-08-12 09:56:09 -0700)

----------------------------------------------------------------
drm-misc-next for v5.15:

UAPI Changes:

Cross-subsystem Changes:
- Add lockdep_assert(once) helpers.

Core Changes:
- Add lockdep assert to drm_is_current_master_locked.
- Fix typos in dma-buf documentation.
- Mark drm irq midlayer as legacy only.
- Fix GPF in udmabuf_create.
- Rename member to correct value in drm_edid.h

Driver Changes:
- Build fix to make nouveau build with NOUVEAU_BACKLIGHT.
- Add MI101AIT-ICP1, LTTD800480070-L6WWH-RT panels.
- Assorted fixes to bridge/it66121, anx7625.
- Add custom crtc_state to simple helpers, and use it to
  convert pll handling in mgag200 to atomic.
- Convert drivers to use offset-adjusted framebuffer bo mappings.
- Assorted small fixes and fix for a use-after-free in vmwgfx.
- Convert remaining callers of non-legacy drivers to use linux irqs directly.
- Small cleanup in ingenic.
- Small fixes to virtio and ti-sn65dsi86.

----------------------------------------------------------------
Baokun Li (2):
      drm/vmwgfx: Use list_move_tail instead of list_del/list_add_tail in vmwgfx_cmdbuf.c
      drm/vmwgfx: Use list_move_tail instead of list_del/list_add_tail in vmwgfx_cmdbuf_res.c

Cai Huoqing (2):
      drm/vmwgfx: Make use of PFN_ALIGN/PFN_UP helper macro
      drm/vmwgfx: Replace "vmw_num_pages" with "PFN_UP"

David Stevens (1):
      drm/virtio: set non-cross device blob uuid_state

Desmond Cheong Zhi Xi (2):
      drm: add lockdep assert to drm_is_current_master_locked
      drm/vmwgfx: fix potential UAF in vmwgfx_surface.c

Gal Pressman (1):
      dma-buf: Fix a few typos in dma-buf documentation

Lucas De Marchi (1):
      drm/edid: fix edid field name

Paul Cercueil (2):
      drm/ingenic: Remove dead code
      drm/ingenic: Use standard drm_atomic_helper_commit_tail

Pavel Skripkin (1):
      udmabuf: fix general protection fault in udmabuf_create

Peter Zijlstra (1):
      locking/lockdep: Provide lockdep_assert{,_once}() helpers

Randy Dunlap (1):
      drm: nouveau: fix disp.c build when NOUVEAU_BACKLIGHT is not enabled

Rob Clark (1):
      drm/bridge: ti-sn65dsi86: Avoid creating multiple connectors

Robert Foss (1):
      drm: bridge: it66121: Check drm_bridge_attach retval

Sam Ravnborg (1):
      drm/panel: simple: add Multi-Innotechnology MI1010AIT-1CP1

Shaokun Zhang (1):
      drm/vmwgfx: Remove the repeated declaration

Søren Andersen (1):
      drm/panel: simple: add LOGIC Technologies LTTD800480070-L6WH-RT

Thomas Zimmermann (38):
      drm/mgag200: Select clock in PLL update functions
      drm/mgag200: Return errno codes from PLL compute functions
      drm/mgag200: Remove P_ARRAY_SIZE
      drm/mgag200: Split PLL setup into compute and update functions
      drm/mgag200: Introduce separate variable for PLL S parameter
      drm/mgag200: Store values (not bits) in struct mgag200_pll_values
      drm/mgag200: Split PLL compute functions by device type
      drm/mgag200: Split PLL compute function for G200SE by rev
      drm/mgag200: Declare PLL clock constants static const
      drm/mgag200: Abstract pixel PLL via struct mgag200_pll
      drm/simple-kms: Support custom CRTC state
      drm/mgag200: Introduce custom CRTC state
      drm/mgag200: Compute PLL values during atomic check
      drm/gem: Provide offset-adjusted framebuffer BO mappings
      drm/ast: Use offset-adjusted shadow-plane mappings
      drm/gud: Get offset-adjusted mapping from drm_gem_fb_vmap()
      drm/hyperv: Use offset-adjusted shadow-plane mappings
      drm/mgag200: Use offset-adjusted shadow-plane mappings
      drm/cirrus: Use offset-adjusted shadow-plane mappings
      drm/gm12u320: Use offset-adjusted shadow-plane mappings
      drm/simpledrm: Use offset-adjusted shadow-plane mapping
      drm/udl: Use offset-adjusted shadow-plane mapping
      drm/vbox: Use offset-adjusted shadow-plane mappings
      drm/vkms: Use offset-adjusted shadow-plane mappings and output
      drm/amdgpu: Convert to Linux IRQ interfaces
      drm/arm/hdlcd: Convert to Linux IRQ interfaces
      drm/atmel-hlcdc: Convert to Linux IRQ interfaces
      drm/fsl-dcu: Convert to Linux IRQ interfaces
      drm/gma500: Convert to Linux IRQ interfaces
      drm/kmb: Convert to Linux IRQ interfaces
      drm/msm: Convert to Linux IRQ interfaces
      drm/mxsfb: Convert to Linux IRQ interfaces
      drm/radeon: Convert to Linux IRQ interfaces
      drm/tidss: Convert to Linux IRQ interfaces
      drm/tilcdc: Convert to Linux IRQ interfaces
      drm/vc4: Convert to Linux IRQ interfaces
      drm: Remove unused devm_drm_irq_install()
      drm: IRQ midlayer is now legacy

Xin Ji (1):
      drm/bridge: anx7625: Tune K value for IVO panel

 drivers/dma-buf/udmabuf.c                          |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |  21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h            |   2 +-
 drivers/gpu/drm/arm/hdlcd_drv.c                    | 174 ++--
 drivers/gpu/drm/arm/hdlcd_drv.h                    |   1 +
 drivers/gpu/drm/ast/ast_mode.c                     |   2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |  80 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |  24 +-
 drivers/gpu/drm/bridge/analogix/anx7625.h          |   4 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |   2 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   3 +
 drivers/gpu/drm/drm_auth.c                         |   6 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c            |   2 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |  17 +-
 drivers/gpu/drm/drm_irq.c                          |  95 +-
 drivers/gpu/drm/drm_legacy_misc.c                  |   3 +-
 drivers/gpu/drm/drm_simple_kms_helper.c            |  39 +-
 drivers/gpu/drm/drm_vblank.c                       |   8 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |  78 +-
 drivers/gpu/drm/gma500/power.c                     |   1 +
 drivers/gpu/drm/gma500/psb_drv.c                   |   8 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |   5 -
 drivers/gpu/drm/gma500/psb_irq.c                   |  26 +-
 drivers/gpu/drm/gma500/psb_irq.h                   |   4 +-
 drivers/gpu/drm/gud/gud_pipe.c                     |   5 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c        |   4 +-
 drivers/gpu/drm/i810/i810_dma.c                    |   3 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  31 +-
 drivers/gpu/drm/kmb/kmb_drv.c                      |  26 +-
 drivers/gpu/drm/mga/mga_dma.c                      |   2 +-
 drivers/gpu/drm/mga/mga_drv.h                      |   1 -
 drivers/gpu/drm/mgag200/Makefile                   |   2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |  63 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c             | 781 ++--------------
 drivers/gpu/drm/mgag200/mgag200_pll.c              | 992 +++++++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_reg.h              |   9 +-
 drivers/gpu/drm/msm/msm_drv.c                      | 113 ++-
 drivers/gpu/drm/msm/msm_kms.h                      |   2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |  81 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.h                  |   2 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |   8 +-
 drivers/gpu/drm/panel/panel-simple.c               |  69 ++
 drivers/gpu/drm/r128/r128_cce.c                    |   3 +-
 drivers/gpu/drm/radeon/radeon_drv.c                |   4 -
 drivers/gpu/drm/radeon/radeon_irq_kms.c            |  44 +-
 drivers/gpu/drm/radeon/radeon_kms.h                |   4 -
 drivers/gpu/drm/tidss/tidss_drv.c                  |  15 +-
 drivers/gpu/drm/tidss/tidss_drv.h                  |   2 +
 drivers/gpu/drm/tidss/tidss_irq.c                  |  27 +-
 drivers/gpu/drm/tidss/tidss_irq.h                  |   4 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |  51 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.h                |   3 +
 drivers/gpu/drm/tiny/cirrus.c                      |   4 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |   4 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |   4 +-
 drivers/gpu/drm/udl/udl_modeset.c                  |   4 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |   2 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |   4 -
 drivers/gpu/drm/vc4/vc4_drv.h                      |   8 +-
 drivers/gpu/drm/vc4/vc4_irq.c                      |  48 +-
 drivers/gpu/drm/vc4/vc4_v3d.c                      |  17 +-
 drivers/gpu/drm/via/via_mm.c                       |   3 +-
 drivers/gpu/drm/virtio/virtgpu_prime.c             |   2 +
 drivers/gpu/drm/vkms/vkms_composer.c               |   2 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |   1 +
 drivers/gpu/drm/vkms/vkms_plane.c                  |   2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |   2 +-
 .../gpu/drm/vmwgfx/device_include/vm_basic_types.h |  13 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |   5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c             |   5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c         |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c            |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c                |   5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c                |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c             |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |   4 +-
 include/drm/drm_device.h                           |  18 +-
 include/drm/drm_drv.h                              |  44 +-
 include/drm/drm_edid.h                             |   2 +-
 include/drm/drm_file.h                             |   4 +
 include/drm/drm_gem_atomic_helper.h                |   8 +
 include/drm/drm_gem_framebuffer_helper.h           |   3 +-
 include/drm/drm_irq.h                              |  32 -
 include/drm/drm_legacy.h                           |   3 +
 include/drm/drm_simple_kms_helper.h                |  27 +
 include/linux/dma-buf.h                            |  10 +-
 include/linux/lockdep.h                            |  41 +-
 91 files changed, 1975 insertions(+), 1338 deletions(-)
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_pll.c
 delete mode 100644 include/drm/drm_irq.h
