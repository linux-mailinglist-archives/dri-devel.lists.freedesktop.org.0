Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C15E33CB68F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 13:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095BF6E95E;
	Fri, 16 Jul 2021 11:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0396E95E;
 Fri, 16 Jul 2021 11:07:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="207690177"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; d="scan'208";a="207690177"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 04:07:32 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; d="scan'208";a="506856856"
Received: from kmbaku-mobl.ger.corp.intel.com (HELO [10.252.62.109])
 ([10.252.62.109])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 04:07:29 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <444811c3-cbec-e9d5-9a6b-9632eda7962a@linux.intel.com>
Date: Fri, 16 Jul 2021 13:07:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Lots of stuff this time around.

Enjoy!

~Maarten

drm-misc-next-2021-07-16:
drm-misc-next for v5.15:

UAPI Changes:

Cross-subsystem Changes:
- udmabuf: Add support for mapping hugepages
- Add dma-buf stats to sysfs.
- Assorted fixes to fbdev/omap2.
- dma-buf: Document DMA_BUF_IOCTL_SYNC
- Improve dma-buf non-dynamic exporter expectations better.
- Add module parameters for dma-buf size and list limit.
- Add HDMI codec support to vc4, to replace vc4's own codec.
- Document dma-buf implicit fencing rules.
- dma_resv_test_signaled test_all handling.

Core Changes:
- Extract i915's eDP backlight code into DRM helpers.
- Assorted docbook updates.
- Rework drm_dp_aux documentation.
- Add support for the DP aux bus.
- Shrink dma-fence-chain slightly.
- Add alloc/free helpers for dma-fence-chain.
- Assorted fixes to TTM., drm/of, bridge
- drm_gem_plane_helper_prepare/cleanup_fb is now the default for gem drivers.
- Small fix for scheduler completion.
- Remove use of drm_device.irq_enabled.
- Print the driver name to dmesg when registering framebuffer.
- Export drm/gem's shadow plane handling, and use it in vkms.
- Assorted small fixes.

Driver Changes:
- Add eDP backlight to nouveau.
- Assorted fixes and cleanups to nouveau, panfrost, vmwgfx, anx7625,
  amdgpu, gma500, radeon, mgag200, vgem, vc4, vkms, omapdrm.
- Add support for Samsung DB7430, Samsung ATNA33XC20, EDT ETMV570G2DHU,
  EDT ETM0350G0DH6, Innolux EJ030NA panels.
- Fix some simple pannels missing bus_format and connector types.
- Add mks-guest-stats instrumentation support to vmwgfx.
- Merge i915-ttm topic branch.
- Make s6e63m0 panel use Mipi-DBI helpers.
- Add detect() supoprt for AST.
- Use interrupts for hotplug on vc4.
- vmwgfx is now moved to drm-misc-next, as sroland is no longer a maintainer for now.
- vmwgfx now uses copies of vmware's internal device headers.
- Slowly convert ti-sn65dsi83 over to atomic.
- Rework amdgpu dma-resv handling.
- Fix virtio fencing for planes.
- Ensure amdgpu can always evict to SYSTEM.
- Many drivers fixed for implicit fencing rules.
- Set default prepare/cleanup fb for tiny, vram and simple helpers too.
- Rework panfrost gpu reset and related serialization.
- Update VKMS todo list.
- Make bochs a tiny gpu driver, and use vram helper.
- Use linux irq interfaces instead of drm_irq in some drivers.
- Add support for Raspberry Pi Pico to GUD.

The following changes since commit 1bd8a7dc28c1c410f1ceefae1f2a97c06d1a67c2:

  Merge tag 'exynos-drm-next-for-v5.14' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-next (2021-06-11 14:19:12 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-07-16

for you to fetch changes up to 17a1837d07be38d957af453e08788edbe1f9343a:

  drm/dp: For drm_panel_dp_aux_backlight(), init backlight as disabled (2021-07-15 08:03:29 -0700)

----------------------------------------------------------------
Ainux (1):
      drm/ast: Add detect function support

Andrey Grodzovsky (2):
      drm/ttm: Fix multihop assert on eviction.
      drm/amdgpu: Fix BUG_ON assert

Beatriz Martins de Carvalho (2):
      drm/vkms: replace macro in vkms_release()
      drm/vkms: Create a debugfs file to get vkms config data

Boris Brezillon (17):
      drm/panfrost: Make sure MMU context lifetime is not bound to panfrost_priv
      drm/sched: Declare entity idle only after HW submission
      drm/sched: Document what the timedout_job method should do
      drm/sched: Allow using a dedicated workqueue for the timeout/fault tdr
      drm/panfrost: Make ->run_job() return an ERR_PTR() when appropriate
      drm/panfrost: Get rid of the unused JS_STATUS_EVENT_ACTIVE definition
      drm/panfrost: Drop the pfdev argument passed to panfrost_exception_name()
      drm/panfrost: Do the exception -> string translation using a table
      drm/panfrost: Expose a helper to trigger a GPU reset
      drm/panfrost: Use a threaded IRQ for job interrupts
      drm/panfrost: Simplify the reset serialization logic
      drm/panfrost: Make sure job interrupts are masked before resetting
      drm/panfrost: Disable the AS on unhandled page faults
      drm/panfrost: Reset the GPU when the AS_ACTIVE bit is stuck
      drm/panfrost: Don't reset the GPU on job faults unless we really have to
      drm/panfrost: Kill in-flight jobs on FD close
      drm/panfrost: Increase the AS_ACTIVE polling timeout

Christian König (9):
      drm/nouveau: init the base GEM fields for internal BOs
      dma-buf: some dma_fence_chain improvements
      dma-buf: add dma_fence_chain_alloc/free v3
      drm/amdgpu: unwrap fence chains in the explicit sync fence
      drm/amdgpu: rework dma_resv handling v3
      ydrm/amdgpu: always allow evicting to SYSTEM domain
      dma-buf: fix dma_resv_test_signaled test_all handling v2
      drm/nouveau: always wait for the exclusive fence
      drm/msm: always wait for the exclusive fence

Christophe Branchereau (1):
      drm/panel: Add Innolux EJ030NA 3.0" 320x480 panel

ChunyouTang (1):
      drm/panfrost:fix the exception name always "UNKNOWN"

Colin Ian King (1):
      drm/gma500/oaktrail_lvds: replace continue with break

Dan Carpenter (1):
      drm/amdgpu: fix amdgpu_preempt_mgr_new()

Daniel Vetter (16):
      dma-buf: Document non-dynamic exporter expectations better
      dma-resv: Fix kerneldoc
      drm/panfrost: Shrink sched_lock
      drm/panfrost: Use xarray and helpers for depedency tracking
      drm/panfrost: Fix implicit sync
      drm/gem: Tiny kernel clarification for drm_gem_fence_array_add
      dma-buf: Switch to inline kerneldoc
      dma-buf: Document dma-buf implicit fencing/resv fencing rules
      drm/atomic-helper: make drm_gem_plane_helper_prepare_fb the default
      drm/<driver>: drm_gem_plane_helper_prepare_fb is now the default
      drm/armada: Remove prepare/cleanup_fb hooks
      drm/vram-helpers: Create DRM_GEM_VRAM_PLANE_HELPER_FUNCS
      drm/omap: Follow implicit fencing in prepare_fb
      drm/simple-helper: drm_gem_simple_display_pipe_prepare_fb as default
      drm/tiny: drm_gem_simple_display_pipe_prepare_fb is the default
      drm/shmem-helper: Align to page size in dumb_create

Dom Cobley (4):
      drm/vc4: hdmi: Set HD_CTL_WHOLSMP and HD_CTL_CHALIGN_SET
      drm/vc4: hdmi: Set HDMI_MAI_FMT
      drm/vc4: hdmi: Set VC4_HDMI_MAI_CONFIG_FORMAT_REVERSE
      drm/vc4: hdmi: Remove firmware logic for MAI threshold setting

Dongwon Kim (1):
      udmabuf: configurable list_limit and size_limit_mb

Douglas Anderson (14):
      dt-bindings: display: simple: List hpd properties in panel-simple
      dt-bindings: drm: Introduce the DP AUX bus
      dt-bindings: drm/bridge: ti-sn65dsi86: Add aux-bus child
      drm: Introduce the DP AUX bus
      drm/panel: panel-simple: Allow panel-simple be a DP AUX endpoint device
      drm/panel: panel-simple: Stash DP AUX bus; allow using it for DDC
      drm/bridge: ti-sn65dsi86: Promote the AUX channel to its own sub-dev
      drm/bridge: ti-sn65dsi86: Add support for the DP AUX bus
      drm/bridge: ti-sn65dsi86: Don't read EDID blob over DDC
      drm/bridge: ti-sn65dsi86: Improve probe errors with dev_err_probe()
      arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
      drm/dp: Move panel DP AUX backlight support to drm_dp_helper
      drm/panel-simple: Power the panel when probing DP AUX backlight
      drm/dp: For drm_panel_dp_aux_backlight(), init backlight as disabled

Harshvardhan Jha (1):
      drm/gma500: Fix end of loop tests for list_for_each_entry

Hridya Valsaraju (1):
      dmabuf: Add the capability to expose DMA-BUF stats in sysfs

Jagan Teki (1):
      drm: bridge: nwl-dsi: Drop unused nwl_dsi_plat_clk_config

Jason Ekstrand (1):
      dma-buf: Document DMA_BUF_IOCTL_SYNC (v3)

Jiahua Yu (1):
      fbdev/omap2: use DEFINE_SPINLOCK() instead of spin_lock_init().

Jing Xiangfeng (1):
      drm/gma500: Add the missed drm_gem_object_put() in psb_user_framebuffer_create()

Julia Lawall (1):
      drm/of: free the right object

Lang Yu (3):
      drm/ttm: add TTM_PL_FLAG_TEMPORARY flag v3
      drm/amdgpu: user temporary GTT as bounce buffer
      drm/amdgpu: switch gtt_mgr to counting used pages

Laurent Pinchart (11):
      drm: bridge: ti-sn65dsi83: Move LVDS format selection to .mode_set()
      drm: bridge: ti-sn65dsi83: Pass mode explicitly to helper functions
      drm: bridge: ti-sn65dsi83: Switch to atomic operations
      drm: bridge: ti-sn65dsi83: Retrieve output format from bridge state
      drm: bridge: ti-sn65dsi83: Retrieve the display mode from the state
      dt-bindings: drm/bridge: ti-sn65dsi8: Make enable GPIO optional
      drm/bridge: ti-sn65dsi86: Make enable GPIO optional
      drm/bridge: ti-sn65dsi86: Use bitmask to store valid rates
      drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge
      drm/bridge: ti-sn65dsi86: Group code in sections
      drm/bridge: ti-sn65dsi86: Split connector creation to a function

Leandro Ribeiro (2):
      drm/doc: document how userspace should find out CRTC index
      drm/doc: document drm_mode_get_plane

Linus Walleij (5):
      drm/panel: db7430: Add driver for Samsung DB7430
      drm/dbi: Support DBI typec1 read operations
      drm/panel: s6e63m0: Switch to DBI abstraction for SPI
      drm/dbi: Print errors for mipi_dbi_command()
      drm/panel: Fix up DT bindings for Samsung lms397kf04

Lyude Paul (9):
      drm/i915/dpcd_bl: Remove redundant AUX backlight frequency calculations
      drm/i915/dpcd_bl: Handle drm_dpcd_read/write() return values correctly
      drm/i915/dpcd_bl: Cleanup intel_dp_aux_vesa_enable_backlight() a bit
      drm/i915/dpcd_bl: Cache some backlight capabilities in intel_panel.backlight
      drm/i915/dpcd_bl: Move VESA backlight enabling code closer together
      drm/i915/dpcd_bl: Return early in vesa_calc_max_backlight if we can't read PWMGEN_BIT_COUNT
      drm/i915/dpcd_bl: Print return codes for VESA backlight failures
      drm/dp: Extract i915's eDP backlight code into DRM helpers
      drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau

Maarten Lankhorst (2):
      drm/vma: Add a driver_private member to vma_node.
      drm/i915: Use ttm mmap handling for ttm bo's.

Marek Vasut (2):
      drm/bridge: ti-sn65dsi83: Fix sparse warnings
      drm/bridge: ti-sn65dsi83: Replace connector format patching with atomic_get_input_bus_fmts

Martin Krastev (3):
      drm/vmwgfx: Introduce VMware mks-guest-stats
      drm/vmwgfx: Refactor vmw_mksstat_remove_ioctl to expect pgid match with vmw_mksstat_add_ioctl to authorise removal.
      drm/vmwgfx: Fix build issues in mksGuestStats discovered by the kernel test robot

Maxime Ripard (9):
      drm/vc4: hdmi: Rely on interrupts to handle hotplug
      drm/dp_helper: Rework the drm_dp_aux documentation
      drm/dp_helper: Mention the concurrency requirement hw_mutex
      drm: Mention the power state requirement on side-channel operations
      Merge tag 'asoc-hdmi-codec-improvements-v2' of git://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux into drm-misc-next
      drm/vc4: hdmi: Register HDMI codec
      drm/vc4: hdmi: Drop devm interrupt handler for hotplug interrupts
      drm/vc4: hdmi: Only call into DRM framework if registered
      drm/vc4: hdmi: Remove drm_encoder->crtc usage

Melissa Wen (1):
      drm/vkms: update the current status of todo list

Mikel Rychliski (1):
      drm/radeon: Fix NULL dereference when updating memory stats

Nicolas Saenz Julienne (1):
      drm/vc4: hdmi: Limit noise when deferring snd card registration

Noralf Trønnes (4):
      drm/gud: Free buffers on device removal
      drm/gud: Use scatter-gather USB bulk transfer
      drm/gud: Add Raspberry Pi Pico ID
      drm/gud: Add async_flush module parameter

Paul Cercueil (1):
      dt-bindings: display/panel: Add Innolux EJ030NA

Pi-Hsun Shih (1):
      drm/bridge: anx7625: Make hpd workqueue freezable

Rajeev Nandan (6):
      drm/panel: add basic DP AUX backlight support
      drm/panel-simple: Support DP AUX backlight
      drm/panel-simple: Support for delays between GPIO & regulator
      drm/panel-simple: Update validation warnings for eDP panel description
      dt-bindings: display: simple: Add Samsung ATNA33XC20
      drm/panel-simple: Add Samsung ATNA33XC20

Sam Ravnborg (1):
      drm: bridge: Mark deprecated operations in drm_bridge_funcs

Stefan Riedmueller (5):
      drm/panel: Add connector_type and bus_format for AUO G104SN02 V2 panel
      drm/panel: Add connector_type for some EDT displays
      drm/panel: Add bus_format and bus_flags for EDT ETM0430G0DH6
      drm/panel: simple: Add support for EDT ETMV570G2DHU panel
      drm/panel: simple: Add support for EDT ETM0350G0DH6 panel

Steven Price (2):
      drm/panfrost: Queue jobs on the hardware
      drm/of: free the iterator object on failure

Thomas Hellström (2):
      drm/i915/ttm: Introduce a TTM i915 gem object backend
      drm/i915/lmem: Verify checks for lmem residency

Thomas Zimmermann (52):
      Merge drm/drm-next into drm-misc-next
      Merge drm/drm-next into drm-misc-next
      Merge tag 'tags/topic/i915-ttm-2021-06-11' into drm-misc-next
      drm/amdgpu: Track IRQ state in local device state
      drm/hibmc: Call drm_irq_uninstall() unconditionally
      drm/radeon: Track IRQ state in local device state
      drm: Don't test for IRQ support in VBLANK ioctls
      drm/armada: Don't set struct drm_device.irq_enabled
      drm/i915: Track IRQ state in local device state
      drm/komeda: Don't set struct drm_device.irq_enabled
      drm/malidp: Don't set struct drm_device.irq_enabled
      drm/exynos: Don't set struct drm_device.irq_enabled
      drm/kirin: Don't set struct drm_device.irq_enabled
      drm/imx: Don't set struct drm_device.irq_enabled
      drm/imx/dcss: Don't set struct drm_device.irq_enabled
      drm/mediatek: Don't set struct drm_device.irq_enabled
      drm/nouveau: Don't set struct drm_device.irq_enabled
      drm/omapdrm: Track IRQ state in local device state
      drm/rcar-du: Don't set struct drm_device.irq_enabled
      drm/rockchip: Don't set struct drm_device.irq_enabled
      drm/sti: Don't set struct drm_device.irq_enabled
      drm/stm: Don't set struct drm_device.irq_enabled
      drm/sun4i: Don't set struct drm_device.irq_enabled
      drm/tegra: Don't set struct drm_device.irq_enabled
      drm/tidss: Don't use struct drm_device.irq_enabled
      drm/vc4: Don't set struct drm_device.irq_enabled
      drm/vkms: Don't set struct drm_device.irq_enabled
      drm/vmwgfx: Don't set struct drm_device.irq_enabled
      drm/xlnx: Don't set struct drm_device.irq_enabled
      drm/zte: Don't set struct drm_device.irq_enabled
      drm/aperture: Pass DRM driver structure instead of driver name
      drm/bochs: Move to tiny/
      drm/bochs: Use managed initialization for GEM VRAM helpers
      drm/vram-helper: Unexport drm_vram_helper_{alloc,release}_mm()
      drm/mgag200: Don't pass flags to drm_dev_register()
      drm/mgag200: Inline mgag200_device_init()
      drm/mgag200: Extract device type and flags in mgag200_pci_probe()
      drm/mgag200: Constify LUT for programming bpp
      drm/vgem: Implement mmap as GEM object function
      drm/qxl: Remove empty qxl_gem_prime_mmap()
      drm/meson: Convert to Linux IRQ interfaces
      drm/arm/komeda: Don't include drm_irq.h
      drm/vmwgfx: Convert to Linux IRQ interfaces
      drm/hisilicon/hibmc: Convert to Linux IRQ interfaces
      Revert "drm/vgem: Implement mmap as GEM object function"
      drm/gem: Export implementation of shadow-plane helpers
      drm/vkms: Inherit plane state from struct drm_shadow_plane_state
      drm/vkms: Let shadow-plane helpers prepare the plane's FB
      drm/vkms: Use dma-buf mapping from shadow-plane state for composing
      drm/qxl: Convert to Linux IRQ interfaces
      drm/vbox: Convert to Linux IRQ interfaces
      drm/omapdrm: Remove outdated comment

Tim Gover (1):
      drm: vc4: Fix pixel-wrap issue with DVP teardown

Vivek Kasireddy (4):
      udmabuf: Add support for mapping hugepages (v4)
      drm/virtio: Add fences for Guest blobs
      drm/virtio: Prepare resource_flush to accept a fence
      drm/virtio: Add the fence in resource_flush if present

Wei Yongjun (1):
      drm/panfrost: Fix missing clk_disable_unprepare() on error in panfrost_clk_init()

Yu Jiahua (1):
      drivers: gpu: add missing MODULE_DEVICE_TABLE in anx7625.c

Yunus Bas (2):
      dt-bindings: display: simple: Add EDT ETMV570G2DHU
      dt-bindings: display: simple: Add EDT ETM0350G0DH6

Zack Rusin (11):
      drm/vmwgfx: Simplify devcaps code
      drm/vmwgfx: Fix subresource updates with new contexts
      drm/vmwgfx: Fix some static checker warnings
      drm/vmwgfx: remove code that was using physical page addresses
      drm/vmwgfx: inline access to the pages from the piter
      drm/vmwgfx: Remove vmw_chipset
      drm/vmwgfx: Fix implicit declaration error
      MAINTAINERS: update vmwgfx info
      drm/vmwgfx: Update device headers
      drm/vmwgfx: Fix a 64bit regression on svga3
      drm/vmwgfx: Fix a bad merge in otable batch takedown

 .../ABI/testing/sysfs-kernel-dmabuf-buffers        |   52 +
 .../bindings/display/bridge/ti,sn65dsi86.yaml      |   21 +-
 .../devicetree/bindings/display/dp-aux-bus.yaml    |   37 +
 .../bindings/display/panel/innolux,ej030na.yaml    |   62 +
 .../bindings/display/panel/panel-simple.yaml       |   10 +
 .../bindings/display/panel/samsung,lms397kf04.yaml |   18 +-
 Documentation/driver-api/dma-buf.rst               |   13 +
 Documentation/gpu/drm-uapi.rst                     |   13 +
 Documentation/gpu/vkms.rst                         |   38 +-
 .../sound/kernel-api/writing-an-alsa-driver.rst    |   13 +-
 MAINTAINERS                                        |   12 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |   30 +-
 drivers/dma-buf/Kconfig                            |   11 +
 drivers/dma-buf/Makefile                           |    1 +
 drivers/dma-buf/dma-buf-sysfs-stats.c              |  337 ++
 drivers/dma-buf/dma-buf-sysfs-stats.h              |   62 +
 drivers/dma-buf/dma-buf.c                          |   40 +
 drivers/dma-buf/dma-fence-chain.c                  |    2 +-
 drivers/dma-buf/dma-resv.c                         |   33 +-
 drivers/dma-buf/st-dma-fence-chain.c               |   16 +-
 drivers/dma-buf/udmabuf.c                          |   59 +-
 drivers/gpu/drm/Kconfig                            |    7 +-
 drivers/gpu/drm/Makefile                           |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h        |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   66 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   65 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |   26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c    |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |  118 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |    2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |    5 -
 drivers/gpu/drm/arm/malidp_drv.c                   |    4 -
 drivers/gpu/drm/armada/armada_drv.c                |    4 +-
 drivers/gpu/drm/armada/armada_overlay.c            |    2 -
 drivers/gpu/drm/armada/armada_plane.c              |   29 -
 drivers/gpu/drm/armada/armada_plane.h              |    2 -
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c           |    1 -
 drivers/gpu/drm/ast/ast_drv.c                      |    2 +-
 drivers/gpu/drm/ast/ast_mode.c                     |   21 +-
 drivers/gpu/drm/bochs/Kconfig                      |   11 -
 drivers/gpu/drm/bochs/Makefile                     |    4 -
 drivers/gpu/drm/bochs/bochs.h                      |   98 -
 drivers/gpu/drm/bochs/bochs_drv.c                  |  205 --
 drivers/gpu/drm/bochs/bochs_hw.c                   |  323 --
 drivers/gpu/drm/bochs/bochs_kms.c                  |  178 -
 drivers/gpu/drm/bochs/bochs_mm.c                   |   24 -
 drivers/gpu/drm/bridge/Kconfig                     |    1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          |    5 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |    6 -
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  200 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  744 ++--
 drivers/gpu/drm/drm_aperture.c                     |   19 +-
 drivers/gpu/drm/drm_atomic_helper.c                |   10 +
 drivers/gpu/drm/drm_debugfs_crc.c                  |    8 +-
 drivers/gpu/drm/drm_dp_aux_bus.c                   |  326 ++
 drivers/gpu/drm/drm_dp_helper.c                    |  462 +++
 drivers/gpu/drm/drm_gem.c                          |   12 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c            |   58 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |    4 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |    9 +-
 drivers/gpu/drm/drm_irq.c                          |   13 +-
 drivers/gpu/drm/drm_mipi_dbi.c                     |   55 +-
 drivers/gpu/drm/drm_of.c                           |    6 +-
 drivers/gpu/drm/drm_simple_kms_helper.c            |   12 +-
 drivers/gpu/drm/drm_syncobj.c                      |    6 +-
 drivers/gpu/drm/drm_vblank.c                       |   15 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |    3 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |   10 -
 drivers/gpu/drm/gma500/framebuffer.c               |    7 +-
 drivers/gpu/drm/gma500/oaktrail_lvds.c             |    6 +-
 drivers/gpu/drm/gud/gud_drv.c                      |   61 +-
 drivers/gpu/drm/gud/gud_internal.h                 |    2 +
 drivers/gpu/drm/gud/gud_pipe.c                     |   62 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c     |    3 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |   16 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |    2 -
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |    4 +-
 drivers/gpu/drm/i915/Makefile                      |    1 +
 drivers/gpu/drm/i915/display/intel_display.c       |    2 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |    2 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |  329 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |    9 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |    6 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c           |  126 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h           |    5 -
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |   83 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  143 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |   19 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |   30 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.c         |    6 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |  647 ++++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h            |   48 +
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |   90 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |    3 +-
 drivers/gpu/drm/i915/i915_drv.c                    |    2 +-
 drivers/gpu/drm/i915/i915_drv.h                    |    2 +
 drivers/gpu/drm/i915/i915_gem.c                    |    5 +-
 drivers/gpu/drm/i915/i915_irq.c                    |    8 +-
 drivers/gpu/drm/i915/intel_memory_region.c         |    1 -
 drivers/gpu/drm/i915/intel_memory_region.h         |    1 -
 drivers/gpu/drm/i915/intel_region_ttm.c            |    8 +-
 drivers/gpu/drm/i915/intel_region_ttm.h            |   11 +-
 drivers/gpu/drm/i915/selftests/igt_mmap.c          |   25 +-
 drivers/gpu/drm/i915/selftests/igt_mmap.h          |   12 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |    3 -
 drivers/gpu/drm/imx/dcss/dcss-plane.c              |    1 -
 drivers/gpu/drm/imx/imx-drm-core.c                 |   11 -
 drivers/gpu/drm/imx/ipuv3-plane.c                  |    1 -
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |    1 -
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |    1 -
 drivers/gpu/drm/lima/lima_sched.c                  |    3 +-
 drivers/gpu/drm/mcde/mcde_display.c                |    1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    6 -
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           |    1 -
 drivers/gpu/drm/meson/meson_drv.c                  |   12 +-
 drivers/gpu/drm/meson/meson_overlay.c              |    1 -
 drivers/gpu/drm/meson/meson_plane.c                |    1 -
 drivers/gpu/drm/mgag200/mgag200_drv.c              |   64 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |   14 -
 drivers/gpu/drm/mgag200/mgag200_mode.c             |   16 +-
 drivers/gpu/drm/msm/msm_fbdev.c                    |    2 +-
 drivers/gpu/drm/msm/msm_gem.c                      |   16 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |    6 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |    2 -
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |   28 +
 drivers/gpu/drm/nouveau/nouveau_backlight.c        |  166 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |    6 +
 drivers/gpu/drm/nouveau/nouveau_connector.h        |    9 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |    5 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h          |    1 +
 drivers/gpu/drm/nouveau/nouveau_fence.c            |    2 +-
 drivers/gpu/drm/omapdrm/omap_drv.h                 |    2 +
 drivers/gpu/drm/omapdrm/omap_irq.c                 |   13 +-
 drivers/gpu/drm/omapdrm/omap_plane.c               |    3 +
 drivers/gpu/drm/panel/Kconfig                      |   21 +
 drivers/gpu/drm/panel/Makefile                     |    2 +
 drivers/gpu/drm/panel/panel-innolux-ej030na.c      |  289 ++
 drivers/gpu/drm/panel/panel-samsung-db7430.c       |  347 ++
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c  |   10 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c  |   83 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      |   41 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.h      |   33 +-
 drivers/gpu/drm/panel/panel-simple.c               |  208 +-
 drivers/gpu/drm/panfrost/panfrost_device.c         |  142 +-
 drivers/gpu/drm/panfrost/panfrost_device.h         |   99 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |   91 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c            |   20 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |    2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c            |  695 ++--
 drivers/gpu/drm/panfrost/panfrost_job.h            |    8 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |  203 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.h            |    5 +-
 drivers/gpu/drm/panfrost/panfrost_regs.h           |    3 -
 drivers/gpu/drm/pl111/pl111_display.c              |    1 -
 drivers/gpu/drm/qxl/qxl_drv.c                      |    4 +-
 drivers/gpu/drm/qxl/qxl_drv.h                      |    3 -
 drivers/gpu/drm/qxl/qxl_irq.c                      |    9 +-
 drivers/gpu/drm/qxl/qxl_prime.c                    |    6 -
 drivers/gpu/drm/radeon/radeon_drv.c                |    2 +-
 drivers/gpu/drm/radeon/radeon_fence.c              |    2 +-
 drivers/gpu/drm/radeon/radeon_irq_kms.c            |   16 +-
 drivers/gpu/drm/radeon/radeon_object.c             |   29 +-
 drivers/gpu/drm/radeon/radeon_object.h             |    2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |   13 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |    2 -
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |    8 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |    1 -
 drivers/gpu/drm/scheduler/sched_main.c             |   21 +-
 drivers/gpu/drm/sti/sti_compositor.c               |    2 -
 drivers/gpu/drm/stm/ltdc.c                         |    4 -
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |    4 +-
 drivers/gpu/drm/sun4i/sun4i_layer.c                |    1 -
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |    1 -
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |    1 -
 drivers/gpu/drm/tegra/drm.c                        |    9 +-
 drivers/gpu/drm/tidss/tidss_irq.c                  |    3 -
 drivers/gpu/drm/tidss/tidss_plane.c                |    1 -
 drivers/gpu/drm/tiny/Kconfig                       |   13 +
 drivers/gpu/drm/tiny/Makefile                      |    1 +
 drivers/gpu/drm/tiny/bochs.c                       |  733 ++++
 drivers/gpu/drm/tiny/cirrus.c                      |    2 +-
 drivers/gpu/drm/tiny/hx8357d.c                     |    1 -
 drivers/gpu/drm/tiny/ili9225.c                     |    1 -
 drivers/gpu/drm/tiny/ili9341.c                     |    1 -
 drivers/gpu/drm/tiny/ili9486.c                     |    1 -
 drivers/gpu/drm/tiny/mi0283qt.c                    |    1 -
 drivers/gpu/drm/tiny/repaper.c                     |    1 -
 drivers/gpu/drm/tiny/st7586.c                      |    1 -
 drivers/gpu/drm/tiny/st7735r.c                     |    1 -
 drivers/gpu/drm/ttm/ttm_bo.c                       |   66 +-
 drivers/gpu/drm/tve200/tve200_display.c            |    1 -
 drivers/gpu/drm/v3d/v3d_sched.c                    |   10 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |    3 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.h               |    1 -
 drivers/gpu/drm/vboxvideo/vbox_irq.c               |   16 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |    3 +-
 drivers/gpu/drm/vc4/Kconfig                        |    1 +
 drivers/gpu/drm/vc4/vc4_drv.c                      |    2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  424 +--
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |    3 +-
 drivers/gpu/drm/vc4/vc4_kms.c                      |    1 -
 drivers/gpu/drm/vc4/vc4_regs.h                     |   30 +
 drivers/gpu/drm/virtio/virtgpu_drv.c               |    2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |    4 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c             |   64 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |    7 +-
 drivers/gpu/drm/vkms/vkms_composer.c               |   26 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |   32 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |    6 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |   57 +-
 drivers/gpu/drm/vmwgfx/Kconfig                     |    8 +
 drivers/gpu/drm/vmwgfx/Makefile                    |    2 +-
 .../gpu/drm/vmwgfx/device_include/includeCheck.h   |    3 -
 .../gpu/drm/vmwgfx/device_include/svga3d_caps.h    |  111 -
 drivers/gpu/drm/vmwgfx/device_include/svga3d_cmd.h | 3680 ++++++++------------
 .../gpu/drm/vmwgfx/device_include/svga3d_devcaps.h |  793 ++---
 drivers/gpu/drm/vmwgfx/device_include/svga3d_dx.h  | 3503 +++++++++----------
 .../gpu/drm/vmwgfx/device_include/svga3d_limits.h  |  101 +-
 drivers/gpu/drm/vmwgfx/device_include/svga3d_reg.h |   15 +-
 .../drm/vmwgfx/device_include/svga3d_surfacedefs.h | 3132 ++++++++---------
 .../gpu/drm/vmwgfx/device_include/svga3d_types.h   | 3020 +++++++---------
 .../gpu/drm/vmwgfx/device_include/svga_escape.h    |   68 +-
 .../gpu/drm/vmwgfx/device_include/svga_overlay.h   |  203 +-
 drivers/gpu/drm/vmwgfx/device_include/svga_reg.h   | 2847 ++++-----------
 drivers/gpu/drm/vmwgfx/device_include/svga_types.h |   51 -
 .../gpu/drm/vmwgfx/device_include/vm_basic_types.h |  131 +-
 .../drm/vmwgfx/device_include/vmware_pack_begin.h  |    2 -
 .../drm/vmwgfx/device_include/vmware_pack_end.h    |    2 -
 drivers/gpu/drm/vmwgfx/ttm_memory.c                |    2 +
 drivers/gpu/drm/vmwgfx/vmw_surface_cache.h         |  539 +++
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.c            |   24 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c                |    6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c             |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c         |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c            |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.c            |  142 +
 drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.h            |   50 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   69 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   42 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |   17 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c              |  111 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c                |   24 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |    6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_mksstat.h            |  144 +
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c                |   41 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c                |  579 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |    8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_so.c                 |    3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |   80 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |   35 -
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c         |    4 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c            |    1 -
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |    2 -
 drivers/gpu/drm/zte/zx_drm_drv.c                   |    6 -
 drivers/video/fbdev/omap2/omapfb/dss/apply.c       |    4 +-
 include/drm/drm_aperture.h                         |   14 +-
 include/drm/drm_bridge.h                           |   26 +-
 include/drm/drm_connector.h                        |    5 +
 include/drm/drm_dp_aux_bus.h                       |   57 +
 include/drm/drm_dp_helper.h                        |  175 +-
 include/drm/drm_gem_atomic_helper.h                |    6 +
 include/drm/drm_gem_vram_helper.h                  |   16 +-
 include/drm/drm_mipi_dbi.h                         |    7 +-
 include/drm/drm_mipi_dsi.h                         |    5 +
 include/drm/drm_modeset_helper_vtables.h           |    7 +-
 include/drm/drm_panel.h                            |    8 +-
 include/drm/drm_simple_kms_helper.h                |    7 +-
 include/drm/drm_vma_manager.h                      |    2 +-
 include/drm/gpu_scheduler.h                        |   37 +-
 include/drm/ttm/ttm_placement.h                    |    7 +-
 include/linux/dma-buf.h                            |  177 +-
 include/linux/dma-fence-chain.h                    |   52 +-
 include/linux/dma-resv.h                           |    2 +-
 include/sound/hdmi-codec.h                         |   12 +-
 include/sound/pcm_iec958.h                         |    8 +
 include/uapi/drm/drm.h                             |    4 +-
 include/uapi/drm/drm_mode.h                        |   32 +
 include/uapi/drm/vmwgfx_drm.h                      |   41 +
 include/uapi/linux/dma-buf.h                       |   50 +-
 sound/core/pcm_iec958.c                            |  174 +-
 sound/soc/codecs/hdmi-codec.c                      |  217 +-
 290 files changed, 16695 insertions(+), 14320 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
 create mode 100644 Documentation/devicetree/bindings/display/dp-aux-bus.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,ej030na.yaml
 create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
 create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h
 delete mode 100644 drivers/gpu/drm/bochs/Kconfig
 delete mode 100644 drivers/gpu/drm/bochs/Makefile
 delete mode 100644 drivers/gpu/drm/bochs/bochs.h
 delete mode 100644 drivers/gpu/drm/bochs/bochs_drv.c
 delete mode 100644 drivers/gpu/drm/bochs/bochs_hw.c
 delete mode 100644 drivers/gpu/drm/bochs/bochs_kms.c
 delete mode 100644 drivers/gpu/drm/bochs/bochs_mm.c
 create mode 100644 drivers/gpu/drm/drm_dp_aux_bus.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.h
 create mode 100644 drivers/gpu/drm/panel/panel-innolux-ej030na.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-db7430.c
 create mode 100644 drivers/gpu/drm/tiny/bochs.c
 delete mode 100644 drivers/gpu/drm/vmwgfx/device_include/includeCheck.h
 delete mode 100644 drivers/gpu/drm/vmwgfx/device_include/svga3d_caps.h
 delete mode 100644 drivers/gpu/drm/vmwgfx/device_include/svga_types.h
 delete mode 100644 drivers/gpu/drm/vmwgfx/device_include/vmware_pack_begin.h
 delete mode 100644 drivers/gpu/drm/vmwgfx/device_include/vmware_pack_end.h
 create mode 100644 drivers/gpu/drm/vmwgfx/vmw_surface_cache.h
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.c
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.h
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_mksstat.h
 create mode 100644 include/drm/drm_dp_aux_bus.h
