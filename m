Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8B7530B24
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 10:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4895B10F0F7;
	Mon, 23 May 2022 08:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40C410F0AD;
 Mon, 23 May 2022 08:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653296109; x=1684832109;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4gnvXWT6wHaTZWRK+/8mfgtjAE8510k26WntSnUjb4o=;
 b=nCtmcu9Su5KHzlgbmNMbC4IUFPqJtLSBdbOoJl9LzzidwLp544imZ0nh
 1v7tHolFa83U/F/J3JKSY/Mmv/LuuKFg4/IgXJXvxr3CoP9OnEC5UnnHD
 Wx7Zb6Erp1sRGPOgmUj9iYsZvnljW235sQir0CsoAIELIeNLDsiyAwQAf
 vHJvZ8WmA39RoXZ99rmQYRBsLcV1tnXA8CZFmaog+wRlFqH2Vwcv0pfRh
 R+A80/VBOaO8R2jJw04L2RzBi+HJuLIrHiQdVHJVQEZrphb11wgxmH7C6
 TMSlHcvRpMuzdsbh3AEAfWMFwrHktWCaap6DSe6Cd20S2QtwdHTskluYX g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="272873158"
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="272873158"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 01:55:07 -0700
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="900432641"
Received: from tlehuche-mobl1.ger.corp.intel.com (HELO [10.213.213.125])
 ([10.213.213.125])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 01:55:05 -0700
Message-ID: <cb53a075-984f-07a4-8b6a-87fd4cc114f7@linux.intel.com>
Date: Mon, 23 May 2022 09:55:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PULL] drm-intel-next -> drm-intel-gt-next cross-merge sync
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <87y1ywbh5y.fsf@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <87y1ywbh5y.fsf@intel.com>
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
Cc: dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/05/2022 12:02, Jani Nikula wrote:
> 
> Hi all,
> 
> This is for Tvrtko to pull to cross-merge sync drm-intel-next to
> drm-intel-gt-next.
> 
> Dave, Daniel, IIUC this is what you prefer over having topic branches
> for all the small things that are needed between drm-intel branches. I
> don't think we've done this direct cross-merge before, so decided to
> send a pull request for transparency. Do you want us to do it this way
> going forward, or can we just do direct merges in git branches without
> tagged pull requests?
> 
> Looks like drm-intel-next is ahead wrt backmerges too, so this pulls in
> some drm-next to drm-intel-gt-next too.

Pulled, thanks Jani for explaining the situation in detail.

Regards,

Tvrtko

> 
> BR,
> Jani.
> 
> 
> PS. For future reference, generated using:
> $ dim pull-request drm-intel-next drm-intel/drm-intel-gt-next
> 
> 
> The following changes since commit c54b39a565227538c52ead2349eb17d54aadd6f7:
> 
>    Merge tag 'drm-intel-next-2022-04-13-1' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2022-04-14 12:03:09 +1000)
> 
> are available in the Git repository at:
> 
>    git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2022-05-20
> 
> for you to fetch changes up to 5f38c3fb55ce3814b4353320d7a205068a420e48:
> 
>    drm/i915/pcode: Add a couple of pcode helpers (2022-05-20 09:11:45 +0100)
> 
> ----------------------------------------------------------------
> drm/i915 drm-intel-next -> drm-intel-gt-next cross-merge sync
> 
> ----------------------------------------------------------------
> Anshuman Gupta (1):
>        drm/i915: Use drm_dbg for rpm logging
> 
> Anusha Srivatsa (2):
>        drm/i915/dmc: Load DMC on DG2
>        drm/i915/dmc: Add MMIO range restrictions
> 
> Arunpravin Paneer Selvam (2):
>        drm/amdgpu: add drm buddy support to amdgpu
>        drm: add a check to verify the size alignment
> 
> Ashutosh Dixit (2):
>        drm/i915: Introduce has_media_ratio_mode
>        drm/i915/pcode: Extend pcode functions for multiple gt's
> 
> Biju Das (1):
>        drm: bridge: adv7511: Enable DRM_BRIDGE_OP_HPD based on HPD interrupt
> 
> Changcheng Deng (1):
>        fbcon: use min() to make code cleaner
> 
> Chen-Yu Tsai (4):
>        dt-bindings: vendor-prefixes: Add prefix for SINO WEALTH Eletronics Ltd.
>        dt-bindings: display: ssd1307fb: Add entry for SINO WEALTH SH1106
>        drm/ssd130x: Support page addressing mode
>        drm/ssd130x: Add support for SINO WEALTH SH1106
> 
> Christian König (16):
>        dma-buf: add enum dma_resv_usage v4
>        dma-buf: specify usage while adding fences to dma_resv obj v7
>        dma-buf & drm/amdgpu: remove dma_resv workaround
>        dma-buf: add DMA_RESV_USAGE_KERNEL v3
>        drm/amdgpu: use DMA_RESV_USAGE_KERNEL
>        drm/radeon: use DMA_RESV_USAGE_KERNEL
>        RDMA: use DMA_RESV_USAGE_KERNEL
>        dma-buf: add DMA_RESV_USAGE_BOOKKEEP v3
>        dma-buf: wait for map to complete for static attachments
>        drm/i915: drop bo->moving dependency
>        drm/ttm: remove bo->moving
>        dma-buf: drop seq count based update
>        seqlock: drop seqcount_ww_mutex_t
>        futex: add missing rtmutex.h include
>        drm/ttm: fix logic inversion in ttm_eu_reserve_buffers
>        drm/ttm: fix kerneldoc for ttm_lru_bulk_move
> 
> Christoph Hellwig (27):
>        drm/i915/gvt: remove module refcounting in intel_gvt_{,un}register_hypervisor
>        drm/i915/gvt: remove enum hypervisor_type
>        drm/i915/gvt: rename intel_vgpu_ops to intel_vgpu_mdev_ops
>        drm/i915/gvt: move the gvt code into kvmgt.ko
>        drm/i915/gvt: remove intel_gvt_ops
>        drm/i915/gvt: remove the map_gfn_to_mfn and set_trap_area ops
>        drm/i915/gvt: remove the unused from_virt_to_mfn op
>        drm/i915/gvt: merge struct kvmgt_vdev into struct intel_vgpu
>        drm/i915/gvt: merge struct kvmgt_guest_info into strut intel_vgpu
>        drm/i915/gvt: remove vgpu->handle
>        drm/i915/gvt: devirtualize ->{read,write}_gpa
>        drm/i915/gvt: devirtualize ->{get,put}_vfio_device
>        drm/i915/gvt: devirtualize ->set_edid and ->set_opregion
>        drm/i915/gvt: devirtualize ->detach_vgpu
>        drm/i915/gvt: devirtualize ->inject_msi
>        drm/i915/gvt: devirtualize ->is_valid_gfn
>        drm/i915/gvt: devirtualize ->gfn_to_mfn
>        drm/i915/gvt: devirtualize ->{enable,disable}_page_track
>        drm/i915/gvt: devirtualize ->dma_{,un}map_guest_page
>        drm/i915/gvt: devirtualize dma_pin_guest_page
>        drm/i915/gvt: remove struct intel_gvt_mpt
>        drm/i915/gvt: remove the extra vfio_device refcounting for dmabufs
>        drm/i915/gvt: streamline intel_vgpu_create
>        drm/i915/gvt: pass a struct intel_vgpu to the vfio read/write helpers
>        drm/i915/gvt: remove kvmgt_guest_{init,exit}
>        drm/i915/gvt: convert to use vfio_register_emulated_iommu_dev
>        drm/i915/gvt: merge gvt.c into kvmgvt.c
> 
> Colin Ian King (1):
>        drm: sti: fix spelling mistake: rejec -> rejection
> 
> Dale B Stimson (1):
>        drm/i915/pcode: Add a couple of pcode helpers
> 
> Daniel Vetter (18):
>        fbcon: delete a few unneeded forward decl
>        fbcon: Move fbcon_bmove(_rec) functions
>        fbcon: Introduce wrapper for console->fb_info lookup
>        fbcon: delete delayed loading code
>        fbdev/sysfs: Fix locking
>        fbcon: Use delayed work for cursor
>        fbcon: Replace FBCON_FLAGS_INIT with a boolean
>        fb: Delete fb_info->queue
>        fbcon: Extract fbcon_open/release helpers
>        fbcon: Ditch error handling for con2fb_release_oldinfo
>        fbcon: move more common code into fb_open()
>        fbcon: use lock_fb_info in fbcon_open/release
>        fbcon: Consistently protect deferred_takeover with console_lock()
>        fbcon: Move console_lock for register/unlink/unregister
>        fbcon: Move more code into fbcon_release
>        fbcon: untangle fbcon_exit
>        fbcon: Maintain a private array of fb_info
>        fbcon: Fix delayed takeover locking
> 
> Dave Airlie (1):
>        Merge tag 'drm-misc-next-2022-04-21' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
> 
> Devarsh Thakkar (1):
>        drm/tidss: Soft Reset DISPC on startup
> 
> H. Nikolaus Schaller (1):
>        drm/bridge: display-connector: add ddc-en gpio support
> 
> Hans de Goede (1):
>        drm/i915: Fix DISP_POS_Y and DISP_HEIGHT defines
> 
> Helge Deller (1):
>        Revert "video: fbdev: fbmem: fix pointer reference to null device field"
> 
> Hsin-Yi Wang (1):
>        drm/bridge: anx7625: Fill in empty ELD when no connector
> 
> Imre Deak (23):
>        drm/dp: Factor out a function to probe a DPCD address
>        drm/i915: Move per-platform power well hooks to intel_display_power_well.c
>        drm/i915: Unexport the for_each_power_well() macros
>        drm/i915: Move the power domain->well mappings to intel_display_power_map.c
>        drm/i915: Move the dg2 fixed_enable_delay power well param to a common bitfield
>        drm/i915: Move the HSW power well flags to a common bitfield
>        drm/i915: Rename the power domain names to end with pipes/ports
>        drm/i915: Sanitize the power well names
>        drm/i915: Convert the power well descriptor domain mask to an array of domains
>        drm/i915: Convert the u64 power well domains mask to a bitmap
>        drm/i915: Simplify power well definitions by adding power well instances
>        drm/i915: Allow platforms to share power well descriptors
>        drm/i915: Simplify the DG1 power well descriptors
>        drm/i915: Sanitize the ADL-S power well definition
>        drm/i915: Sanitize the port -> DDI/AUX power domain mapping for each platform
>        drm/i915: Remove the aliasing of power domain enum values
>        drm/i915: Remove the ICL specific TBT power domains
>        drm/i915: Remove duplicate DDI/AUX power domain mappings
>        drm/i915: Remove the XELPD specific AUX and DDI power domains
>        drm/i915: Fixup merge of the power well refactor patchset
>        drm/i915: Fix SEL_FETCH_PLANE_*(PIPE_B+) register addresses
>        drm/i915/dp: Add workaround for spurious AUX timeouts/hotplugs on LTTPR links
>        drm/i915: Fix 'mixing different enum types' warnings in intel_display_power.c
> 
> Jani Nikula (24):
>        drm/edid: convert edid_is_zero() to edid_block_is_zero() for blocks
>        drm/edid: have edid_block_check() detect blocks that are all zero
>        drm/edid: refactor EDID block status printing
>        drm/edid: add a helper to log dump an EDID block
>        drm/edid: pass struct edid to connector_bad_edid()
>        drm/edid: add typedef for block read function
>        drm/edid: abstract an EDID block read helper
>        drm/edid: use EDID block read helper in drm_do_get_edid()
>        drm/edid: convert extension block read to EDID block read helper
>        drm/edid: drop extra local var
>        drm/edid: add single point of return to drm_do_get_edid()
>        drm/edid: add EDID block count and size helpers
>        drm/i915/gvt: fix trace TRACE_INCLUDE_PATH
>        drm/i915/gvt: better align the Makefile with i915 Makefile
>        Merge tag 'gvt-next-2022-04-21-for-christoph' of https://github.com/intel/gvt-linux into drm-intel-next
>        Merge tag 'gvt-next-2022-04-26' of https://github.com/intel/gvt-linux into drm-intel-next
>        Merge drm/drm-next into drm-intel-next
>        Merge tag 'gvt-next-2022-04-29' of https://github.com/intel/gvt-linux into drm-intel-next
>        drm/i915: move tons of power well initializers to rodata
>        drm/i915: warn about missing ->get_buf_trans initialization
>        drm/i915: remove unused GEM_DEBUG_DECL() and GEM_DEBUG_BUG_ON()
>        drm/i915: remove single-use GEM_DEBUG_EXEC()
>        drm/i915/audio: fix audio code enable/disable pipe logging
>        drm/i915/reg: fix undefined behavior due to shift overflowing the constant
> 
> Jason Gunthorpe (5):
>        vfio/mdev: Remove vfio_mdev.c
>        vfio/mdev: Remove mdev_parent_ops dev_attr_groups
>        vfio/mdev: Remove mdev_parent_ops
>        vfio/mdev: Use the driver core to create the 'remove' file
>        vfio/mdev: Remove mdev drvdata
> 
> Javier Martinez Canillas (6):
>        drm/vc4: Use newer fence API properly to fix build errors
>        dt-bindings: display: ssd1307fb: Deprecate "-i2c" compatible strings
>        dt-bindings: display: ssd1307fb: Extend schema for SPI controllers
>        drm/solomon: Add ssd130x new compatible strings and deprecate old ones.
>        drm/solomon: Move device info from ssd130x-i2c to the core driver
>        drm/solomon: Add SSD130x OLED displays SPI support
> 
> Jiasheng Jiang (1):
>        drm: mali-dp: potential dereference of null pointer
> 
> José Roberto de Souza (3):
>        drm/i915/display/psr: Unset enable_psr2_sel_fetch if other checks in intel_psr2_config_valid() fails
>        drm/i915/display/psr: Clear more PSR state during disable
>        drm/i915/display: Add workaround 22014263786
> 
> Jouni Högander (3):
>        drm/i915: Check EDID for HDR static metadata when choosing blc
>        drm/i915/psr: Use full update In case of area calculation fails
>        drm/i915: Ensure damage clip area is within pipe area
> 
> Julia Lawall (1):
>        drm/sti: fix typos in comments
> 
> Liviu Dudau (1):
>        drm/komeda: return early if drm_universal_plane_init() fails.
> 
> Marek Szyprowski (1):
>        drm: bridge: panel: Register connector if DRM device is already registered
> 
> Marek Vasut (7):
>        drm: bridge: icn6211: Convert to regmap
>        drm/panel: lvds: Simplify mode parsing
>        drm/panel: lvds: Use bus_flags from DT panel-timing property
>        dt-bindings: display: bridge: lt9211: Add Lontium LT9211 bridge driver
>        drm/bridge: lt9211: Add Lontium LT9211 bridge driver
>        dt-bindings: display: bridge: icn6211: Document DSI data-lanes property
>        drm: bridge: icn6211: Add DSI lane count DT property parsing
> 
> Matt Atwood (1):
>        drm/i915/rpl-p: Add PCI IDs
> 
> Matt Roper (1):
>        drm/i915: Add first set of DG2 PCI IDs
> 
> Matthew Auld (4):
>        drm/i915: fix broken build
>        drm/i915: fix i915_gem_object_wait_moving_fence
>        drm/ttm: stop passing NULL fence in ttm_bo_move_sync_cleanup
>        drm/ttm: fixup ttm_bo_add_move_fence v2
> 
> Maxime Ripard (6):
>        drm/vc4: hvs: Reset muxes at probe time
>        drm/vc4: txp: Don't set TXP_VSTART_AT_EOF
>        drm/vc4: txp: Force alpha to be 0xff if it's disabled
>        drm/vc4: kms: Store channel in local variable
>        drm/vc4: kms: Warn if we have an incompatible muxing setup
>        drm/vc4: kms: Improve logging
> 
> Nícolas F. R. A. Prado (1):
>        drm/bridge: anx7625: Use uint8 for lane-swing arrays
> 
> Paul Boddie (1):
>        drm/ingenic: Add dw-hdmi driver specialization for jz4780
> 
> Paul Cercueil (2):
>        drm/ingenic: Implement proper .atomic_get_input_bus_fmts
>        Merge drm/drm-next into drm-misc-next
> 
> Randy Dunlap (1):
>        drm: sti: don't use kernel-doc markers
> 
> Robin Murphy (1):
>        drm/arm/malidp: Stop using iommu_present()
> 
> Sandor Yu (4):
>        drm: bridge: dw_hdmi: default enable workaround to clear the overflow
>        drm: bridge: dw_hdmi: Enable GCP only for Deep Color
>        drm: bridge: dw_hdmi: add reset function for PHY GEN1
>        drm: bridge: dw_hdmi: Audio: Add General Parallel Audio (GPA) driver
> 
> Thomas Zimmermann (2):
>        of: Create platform devices for OF framebuffers
>        fbdev: Warn in hot-unplug workaround for framebuffers without device
> 
> Tom Rix (2):
>        drm/nouveau: change base917c_format from global to static
>        drm/nouveau/gr/gf100-: change gf108_gr_fwif from global to static
> 
> Ville Syrjälä (24):
>        drm: Use drm_mode_init() for on-stack modes
>        drm: Use drm_mode_copy()
>        drm/i915: Program i830 DPLL FP register later
>        drm/i915/fbc: Consult hw.crtc instead of uapi.crtc
>        drm/i915/fbc: s/false/0/
>        drm/i915: Make .get_dplls() return int
>        drm/i915: Pass dev_priv to intel_shared_dpll_init()
>        drm/i915: Remove pointless dpll_funcs checks
>        drm/i915: Adjust .crtc_compute_clock() calling convention
>        drm/i915: Move stuff into intel_dpll_crtc_compute_clock()
>        drm/i915: Move the dpll_hw_state clearing to intel_dpll_crtc_compute_clock()
>        drm/i915: Clear the dpll_hw_state when disabling a pipe
>        drm/i915: Split out dg2_crtc_compute_clock()
>        drm/i915: Add crtc .crtc_get_shared_dpll()
>        drm/i915: Use drm_mode_init() for on-stack modes
>        drm/i915/bios: Reorder panel DTD parsing
>        drm/i915/bios: Generate LFP data table pointers if the VBT lacks them
>        drm/i915/bios: Get access to the tail end of the LFP data block
>        drm/i915/bios: Document the mess around the LFP data tables
>        drm/i915/bios: Assume panel_type==0 if the VBT has bogus data
>        drm/i915/bios: Extract get_panel_type()
>        drm/i915/bios: Refactor panel_type code
>        drm/i915/bios: Parse the seamless DRRS min refresh rate
>        drm/i915: Respect VBT seamless DRRS min refresh rate
> 
> Vinod Govindapillai (1):
>        drm/i915: program wm blocks to at least blocks required per line
> 
> Wan Jiabing (1):
>        i915/gvt: Fix NULL pointer dereference in init_mmio_block_handlers
> 
> Xiaomeng Tong (2):
>        stm: ltdc: fix two incorrect NULL checks on list iterator
>        drm/gma500: fix a potential repeat execution in psb_driver_load
> 
> Yang Guang (1):
>        fbcon: replace snprintf in show functions with sysfs_emit
> 
> Zack Rusin (5):
>        drm/ttm: Add common debugfs code for resource managers
>        drm/vmwgfx: Add debugfs entries for various ttm resource managers
>        drm/amdgpu: Use TTM builtin resource manager debugfs code
>        drm/qxl: Use TTM builtin resource manager debugfs code
>        drm/radeon: Use TTM builtin resource manager debugfs code
> 
> Zhi Wang (6):
>        i915/gvt: Separate the MMIO tracking table from GVT-g
>        i915/gvt: Save the initial HW state snapshot in i915
>        i915/gvt: Use the initial HW state snapshot saved in i915
>        drm/i915/gvt: Add missing symbol export.
>        drm/i915/gvt: Make intel_gvt_match_device() static
>        drm/i915/gvt: Fix the compiling error when CONFIG_DRM_I915_DEBUG_RUNTIME_PM=n
> 
> Zhou Qingyang (1):
>        drm/komeda: Fix an undefined behavior bug in komeda_plane_add()
> 
> Zhouyi Zhou (1):
>        video: fbdev: fbmem: fix pointer reference to null device field
> 
>   .../bindings/display/bridge/chipone,icn6211.yaml   |   18 +-
>   .../bindings/display/bridge/lontium,lt9211.yaml    |  117 +
>   .../bindings/display/solomon,ssd1307fb.yaml        |   95 +-
>   .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
>   Documentation/driver-api/vfio-mediated-device.rst  |   27 +-
>   arch/x86/kernel/early-quirks.c                     |    1 +
>   drivers/dma-buf/dma-buf.c                          |   24 +-
>   drivers/dma-buf/dma-resv.c                         |  403 +-
>   drivers/dma-buf/st-dma-resv.c                      |  111 +-
>   drivers/gpu/drm/Kconfig                            |    1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   15 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h        |    1 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   55 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |    3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   14 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |    5 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c             |    4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   21 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h     |   97 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |    3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   89 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   10 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |    3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    7 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c         |   11 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |   11 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  359 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h       |   89 +
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    3 +-
>   drivers/gpu/drm/arm/display/komeda/komeda_plane.c  |   10 +-
>   drivers/gpu/drm/arm/malidp_crtc.c                  |    5 +-
>   drivers/gpu/drm/arm/malidp_planes.c                |   14 +-
>   drivers/gpu/drm/bridge/Kconfig                     |   14 +
>   drivers/gpu/drm/bridge/Makefile                    |    1 +
>   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |    6 +-
>   drivers/gpu/drm/bridge/analogix/anx7625.c          |   24 +-
>   drivers/gpu/drm/bridge/analogix/anx7625.h          |    4 +-
>   drivers/gpu/drm/bridge/chipone-icn6211.c           |  119 +-
>   drivers/gpu/drm/bridge/display-connector.c         |   15 +
>   drivers/gpu/drm/bridge/lontium-lt9211.c            |  802 +++
>   drivers/gpu/drm/bridge/panel.c                     |    7 +-
>   drivers/gpu/drm/bridge/synopsys/Kconfig            |   10 +
>   drivers/gpu/drm/bridge/synopsys/Makefile           |    1 +
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c |  199 +
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  186 +-
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.h          |   16 +-
>   drivers/gpu/drm/dp/drm_dp.c                        |   33 +-
>   drivers/gpu/drm/drm_buddy.c                        |    3 +
>   drivers/gpu/drm/drm_crtc_helper.c                  |   12 +-
>   drivers/gpu/drm/drm_edid.c                         |  358 +-
>   drivers/gpu/drm/drm_gem.c                          |    3 +-
>   drivers/gpu/drm/drm_gem_atomic_helper.c            |    2 +-
>   drivers/gpu/drm/drm_modes.c                        |    4 +-
>   drivers/gpu/drm/drm_vblank.c                       |    2 +-
>   drivers/gpu/drm/etnaviv/etnaviv_gem.c              |    6 +-
>   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |   10 +-
>   drivers/gpu/drm/gma500/psb_drv.c                   |    5 +-
>   drivers/gpu/drm/i915/Kconfig                       |   36 +-
>   drivers/gpu/drm/i915/Makefile                      |    9 +-
>   drivers/gpu/drm/i915/display/g4x_dp.c              |    3 +-
>   drivers/gpu/drm/i915/display/g4x_hdmi.c            |    3 +-
>   drivers/gpu/drm/i915/display/hsw_ips.c             |    4 +-
>   drivers/gpu/drm/i915/display/icl_dsi.c             |    8 +-
>   drivers/gpu/drm/i915/display/intel_atomic_plane.c  |    3 +-
>   drivers/gpu/drm/i915/display/intel_audio.c         |    4 +-
>   drivers/gpu/drm/i915/display/intel_bios.c          |  345 +-
>   drivers/gpu/drm/i915/display/intel_bw.c            |    6 +-
>   drivers/gpu/drm/i915/display/intel_cdclk.c         |   16 +-
>   drivers/gpu/drm/i915/display/intel_ddi.c           |    6 +-
>   drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |    4 +-
>   drivers/gpu/drm/i915/display/intel_display.c       |  176 +-
>   drivers/gpu/drm/i915/display/intel_display.h       |    4 +-
>   drivers/gpu/drm/i915/display/intel_display_power.c | 5289 +++-----------------
>   drivers/gpu/drm/i915/display/intel_display_power.h |  126 +-
>   .../gpu/drm/i915/display/intel_display_power_map.c | 1501 ++++++
>   .../gpu/drm/i915/display/intel_display_power_map.h |   14 +
>   .../drm/i915/display/intel_display_power_well.c    | 1813 ++++++-
>   .../drm/i915/display/intel_display_power_well.h    |  132 +-
>   drivers/gpu/drm/i915/display/intel_dmc.c           |   54 +-
>   drivers/gpu/drm/i915/display/intel_dmc_regs.h      |   18 +-
>   .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |   34 +-
>   .../gpu/drm/i915/display/intel_dp_link_training.c  |   33 +-
>   drivers/gpu/drm/i915/display/intel_dpio_phy.c      |    1 +
>   drivers/gpu/drm/i915/display/intel_dpll.c          |  196 +-
>   drivers/gpu/drm/i915/display/intel_dpll.h          |    6 +-
>   drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  268 +-
>   drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |    9 +-
>   drivers/gpu/drm/i915/display/intel_fbc.c           |   19 +-
>   drivers/gpu/drm/i915/display/intel_hdcp.c          |    2 +-
>   drivers/gpu/drm/i915/display/intel_panel.c         |   10 +-
>   drivers/gpu/drm/i915/display/intel_pps.c           |    1 +
>   drivers/gpu/drm/i915/display/intel_psr.c           |   78 +-
>   drivers/gpu/drm/i915/display/intel_tc.c            |    5 +-
>   drivers/gpu/drm/i915/display/intel_vbt_defs.h      |   24 +-
>   drivers/gpu/drm/i915/gem/i915_gem_busy.c           |   10 +-
>   drivers/gpu/drm/i915/gem/i915_gem_clflush.c        |    3 +-
>   drivers/gpu/drm/i915/gem/i915_gem_lmem.c           |    2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_object.c         |   42 +-
>   drivers/gpu/drm/i915/gem/i915_gem_object.h         |    8 +-
>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |   20 +-
>   drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |    2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_wait.c           |    6 +-
>   .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |    3 +-
>   .../gpu/drm/i915/gem/selftests/i915_gem_migrate.c  |    5 +-
>   drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |    4 +-
>   drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |    4 +-
>   drivers/gpu/drm/i915/gt/intel_llc.c                |    3 +-
>   drivers/gpu/drm/i915/gt/intel_rc6.c                |    4 +-
>   drivers/gpu/drm/i915/gt/intel_ring.c               |    3 +-
>   drivers/gpu/drm/i915/gt/intel_rps.c                |    5 +-
>   drivers/gpu/drm/i915/gt/selftest_llc.c             |    2 +-
>   drivers/gpu/drm/i915/gt/selftest_rps.c             |    2 +-
>   drivers/gpu/drm/i915/gvt/Makefile                  |   30 +-
>   drivers/gpu/drm/i915/gvt/cfg_space.c               |   89 +-
>   drivers/gpu/drm/i915/gvt/cmd_parser.c              |    4 +-
>   drivers/gpu/drm/i915/gvt/dmabuf.c                  |   36 +-
>   drivers/gpu/drm/i915/gvt/execlist.c                |   12 +-
>   drivers/gpu/drm/i915/gvt/firmware.c                |   25 +-
>   drivers/gpu/drm/i915/gvt/gtt.c                     |   55 +-
>   drivers/gpu/drm/i915/gvt/gvt.c                     |  340 --
>   drivers/gpu/drm/i915/gvt/gvt.h                     |  128 +-
>   drivers/gpu/drm/i915/gvt/handlers.c                | 1035 +---
>   drivers/gpu/drm/i915/gvt/hypercall.h               |   82 -
>   drivers/gpu/drm/i915/gvt/interrupt.c               |   40 +-
>   drivers/gpu/drm/i915/gvt/kvmgt.c                   | 1097 ++--
>   drivers/gpu/drm/i915/gvt/mmio.c                    |    4 +-
>   drivers/gpu/drm/i915/gvt/mmio.h                    |    1 -
>   drivers/gpu/drm/i915/gvt/mpt.h                     |  400 --
>   drivers/gpu/drm/i915/gvt/opregion.c                |  148 +-
>   drivers/gpu/drm/i915/gvt/page_track.c              |    8 +-
>   drivers/gpu/drm/i915/gvt/reg.h                     |    9 +-
>   drivers/gpu/drm/i915/gvt/scheduler.c               |   37 +-
>   drivers/gpu/drm/i915/gvt/trace.h                   |    2 +-
>   drivers/gpu/drm/i915/gvt/vgpu.c                    |   22 +-
>   drivers/gpu/drm/i915/i915_deps.c                   |    2 +-
>   drivers/gpu/drm/i915/i915_driver.c                 |   19 +-
>   drivers/gpu/drm/i915/i915_drv.h                    |   10 +-
>   drivers/gpu/drm/i915/i915_gem.h                    |    6 -
>   drivers/gpu/drm/i915/i915_pci.c                    |    5 +-
>   drivers/gpu/drm/i915/i915_reg.h                    |   42 +-
>   drivers/gpu/drm/i915/i915_request.c                |    3 +-
>   drivers/gpu/drm/i915/i915_sw_fence.c               |    2 +-
>   drivers/gpu/drm/i915/i915_vma.c                    |   17 +-
>   drivers/gpu/drm/i915/intel_device_info.c           |   30 +-
>   drivers/gpu/drm/i915/intel_device_info.h           |   12 +-
>   drivers/gpu/drm/i915/intel_dram.c                  |    2 +-
>   drivers/gpu/drm/i915/intel_gvt.c                   |  252 +-
>   drivers/gpu/drm/i915/intel_gvt.h                   |   32 +-
>   drivers/gpu/drm/i915/intel_gvt_mmio_table.c        | 1292 +++++
>   drivers/gpu/drm/i915/intel_pcode.c                 |   93 +-
>   drivers/gpu/drm/i915/intel_pcode.h                 |   20 +-
>   drivers/gpu/drm/i915/intel_pm.c                    |   29 +-
>   .../gpu/drm/i915/selftests/intel_memory_region.c   |    3 +-
>   drivers/gpu/drm/ingenic/Kconfig                    |    9 +
>   drivers/gpu/drm/ingenic/Makefile                   |    1 +
>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   28 +-
>   drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c          |  103 +
>   drivers/gpu/drm/lima/lima_gem.c                    |    7 +-
>   drivers/gpu/drm/msm/msm_gem.c                      |    3 +-
>   drivers/gpu/drm/msm/msm_gem_submit.c               |    6 +-
>   drivers/gpu/drm/nouveau/dispnv50/base917c.c        |    2 +-
>   drivers/gpu/drm/nouveau/dispnv50/wndw.c            |    3 +-
>   drivers/gpu/drm/nouveau/nouveau_bo.c               |   17 +-
>   drivers/gpu/drm/nouveau/nouveau_fence.c            |   12 +-
>   drivers/gpu/drm/nouveau/nouveau_gem.c              |    3 +-
>   drivers/gpu/drm/nouveau/nouveau_prime.c            |   17 +-
>   drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c     |    2 +-
>   drivers/gpu/drm/panel/panel-lvds.c                 |   31 +-
>   drivers/gpu/drm/panfrost/panfrost_drv.c            |    3 +-
>   drivers/gpu/drm/panfrost/panfrost_job.c            |    2 +-
>   drivers/gpu/drm/qxl/qxl_debugfs.c                  |    3 +-
>   drivers/gpu/drm/qxl/qxl_release.c                  |    3 +-
>   drivers/gpu/drm/qxl/qxl_ttm.c                      |   39 +-
>   drivers/gpu/drm/radeon/radeon_display.c            |    3 +-
>   drivers/gpu/drm/radeon/radeon_gem.c                |    9 +-
>   drivers/gpu/drm/radeon/radeon_mn.c                 |    4 +-
>   drivers/gpu/drm/radeon/radeon_object.c             |   13 +-
>   drivers/gpu/drm/radeon/radeon_prime.c              |   16 +-
>   drivers/gpu/drm/radeon/radeon_sync.c               |    2 +-
>   drivers/gpu/drm/radeon/radeon_ttm.c                |   36 +-
>   drivers/gpu/drm/radeon/radeon_uvd.c                |   12 +-
>   drivers/gpu/drm/scheduler/sched_main.c             |    3 +-
>   drivers/gpu/drm/solomon/Kconfig                    |   18 +-
>   drivers/gpu/drm/solomon/Makefile                   |    1 +
>   drivers/gpu/drm/solomon/ssd130x-i2c.c              |   56 +-
>   drivers/gpu/drm/solomon/ssd130x-spi.c              |  178 +
>   drivers/gpu/drm/solomon/ssd130x.c                  |  108 +-
>   drivers/gpu/drm/solomon/ssd130x.h                  |   16 +
>   drivers/gpu/drm/sti/sti_gdp.c                      |    2 +-
>   drivers/gpu/drm/sti/sti_hdmi.c                     |   22 +-
>   drivers/gpu/drm/stm/ltdc.c                         |   16 +-
>   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c             |    2 +-
>   drivers/gpu/drm/tidss/tidss_dispc.c                |   18 +
>   drivers/gpu/drm/ttm/ttm_bo.c                       |   37 +-
>   drivers/gpu/drm/ttm/ttm_bo_util.c                  |   27 +-
>   drivers/gpu/drm/ttm/ttm_bo_vm.c                    |   34 +-
>   drivers/gpu/drm/ttm/ttm_execbuf_util.c             |    8 +-
>   drivers/gpu/drm/ttm/ttm_resource.c                 |   34 +
>   drivers/gpu/drm/v3d/v3d_gem.c                      |    4 +-
>   drivers/gpu/drm/vc4/vc4_gem.c                      |    6 +-
>   drivers/gpu/drm/vc4/vc4_hvs.c                      |   26 +-
>   drivers/gpu/drm/vc4/vc4_kms.c                      |   39 +-
>   drivers/gpu/drm/vc4/vc4_txp.c                      |    8 +-
>   drivers/gpu/drm/vgem/vgem_fence.c                  |   13 +-
>   drivers/gpu/drm/virtio/virtgpu_gem.c               |    3 +-
>   drivers/gpu/drm/virtio/virtgpu_ioctl.c             |    5 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |    7 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   18 +
>   drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |    5 -
>   drivers/infiniband/core/umem_dmabuf.c              |    3 +-
>   drivers/of/platform.c                              |   83 +-
>   drivers/s390/cio/vfio_ccw_ops.c                    |    7 +-
>   drivers/s390/crypto/vfio_ap_ops.c                  |    9 +-
>   drivers/vfio/mdev/Makefile                         |    2 +-
>   drivers/vfio/mdev/mdev_core.c                      |   52 +-
>   drivers/vfio/mdev/mdev_driver.c                    |   10 -
>   drivers/vfio/mdev/mdev_private.h                   |    6 +-
>   drivers/vfio/mdev/mdev_sysfs.c                     |   37 +-
>   drivers/vfio/mdev/vfio_mdev.c                      |  152 -
>   drivers/video/fbdev/core/fbcon.c                   |  708 ++-
>   drivers/video/fbdev/core/fbcon.h                   |    8 +-
>   drivers/video/fbdev/core/fbmem.c                   |   37 +-
>   drivers/video/fbdev/core/fbsysfs.c                 |    2 +
>   drivers/video/fbdev/offb.c                         |   98 +-
>   include/drm/bridge/dw_hdmi.h                       |   11 +-
>   include/drm/dp/drm_dp_helper.h                     |    1 +
>   include/drm/i915_pciids.h                          |   31 +
>   include/drm/ttm/ttm_bo_api.h                       |    2 -
>   include/drm/ttm/ttm_bo_driver.h                    |   11 +-
>   include/drm/ttm/ttm_resource.h                     |    7 +-
>   include/linux/dma-buf.h                            |   24 +-
>   include/linux/dma-resv.h                           |  180 +-
>   include/linux/fb.h                                 |    1 -
>   include/linux/mdev.h                               |   82 +-
>   include/linux/seqlock.h                            |    8 +-
>   kernel/futex/futex.h                               |    1 +
>   samples/vfio-mdev/mbochs.c                         |    9 +-
>   samples/vfio-mdev/mdpy.c                           |    9 +-
>   samples/vfio-mdev/mtty.c                           |   39 +-
>   240 files changed, 11850 insertions(+), 10219 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>   create mode 100644 drivers/gpu/drm/bridge/lontium-lt9211.c
>   create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c
>   create mode 100644 drivers/gpu/drm/i915/display/intel_display_power_map.c
>   create mode 100644 drivers/gpu/drm/i915/display/intel_display_power_map.h
>   delete mode 100644 drivers/gpu/drm/i915/gvt/gvt.c
>   delete mode 100644 drivers/gpu/drm/i915/gvt/hypercall.h
>   delete mode 100644 drivers/gpu/drm/i915/gvt/mpt.h
>   create mode 100644 drivers/gpu/drm/i915/intel_gvt_mmio_table.c
>   create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
>   create mode 100644 drivers/gpu/drm/solomon/ssd130x-spi.c
>   delete mode 100644 drivers/vfio/mdev/vfio_mdev.c
> 
