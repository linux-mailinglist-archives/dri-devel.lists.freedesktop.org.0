Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D9C987A21
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 22:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC4210E1AD;
	Thu, 26 Sep 2024 20:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DN0BWmHb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC52010E1A8;
 Thu, 26 Sep 2024 20:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727383129; x=1758919129;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=I+16a0BIUJOxl5L0fQIHfzIazC66si0Dhcpvmj7IKNc=;
 b=DN0BWmHbmWyr0A8wsHWigdMJcImVQvOzywN2V0w2rZS3/Alg8NAj0eJf
 ie6umm5nID8YgNEKbIgcnRXGkLBM+DkWxBOh09p6gwvo8qTK5zjzXhz7b
 cWIImcrHxwV9pWkPKNOryyhQ36/8mFiMsjhUDRr75uzHqacJzMPEi9zDi
 UL3ACWcKaXEuSLtHOKuVZkHL3y7hJgavazJHxEEK7OU+IbzhfiTG96Y25
 5cwRpBMAugJhoQOHzi75yZn45YcXpDdVsrGchcQJKUM0haY+euCDzVhz1
 sunZKSte8CCENZI/XQAQdmEbOcyWad3T0PXgEzlwddqU4i+mzp6CuRjtk g==;
X-CSE-ConnectionGUID: Pk2DLNPOQUio+ZVeMW+SSQ==
X-CSE-MsgGUID: wXEFEVPMRuW8XpYIyPfc4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="25981439"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="25981439"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 13:38:48 -0700
X-CSE-ConnectionGUID: 2/7ticMGTAiwtX72JHJ1Jg==
X-CSE-MsgGUID: MKG3TDCiR++T04d7mju1kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="71970487"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 [10.245.244.20]) ([10.245.244.20])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 13:38:44 -0700
Message-ID: <a9b95e6f-9f35-464e-83f6-bda75b35ee0b@linux.intel.com>
Date: Thu, 26 Sep 2024 22:38:31 +0200
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

Hi Dave, Simona,

Another pull request for v6.13, to keep up with the huge rate of 
changes. :-)

Forgot to mention in the summary that Louis Chauvet is taking over from 
Rodrigo Siqueira as vkmms maintainer, sorry about that!

Cheers,
Maarten

drm-misc-next-2024-09-26:
drm-misc-next for v6.13:

UAPI Changes:
- panthor: Add realtime group priority and priority query.

Cross-subsystem Changes:
- Add Vivek Kasireddy as udmabuf maintainer.
- Assorted udmabuf changes.
- Device tree binding updates.
- dmabuf documentation fixes.
- Move drm_rect to drm core module from kms helper.

Core Changes:
- Update scheduler documentation and concurrency fixes.
- drm/ci updates.
- Add memory-agnostic fbdev client and client-agnostic setup helper.
- Huge driver conversion for using the above.

Driver Changes:
- Assorted fixes to imx, panel/nt35510, sti, accel/ivpu, v3d, vkms,
   host1x.
- Add panel quirks for AYA NEO panels.
- Make module autoloading work for bridge/it6505 and mcde.
- Add huge page support to v3d using a custom shmfs.
The following changes since commit b615b9c36cae0468491547206406a909a9a37f26:

   Merge v6.11-rc7 into drm-next (2024-09-11 09:18:15 +0200)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/misc/kernel.git 
tags/drm-misc-next-2024-09-26

for you to fetch changes up to 15499749fbb864cc0737bc8ecaf0e28a6b6d62dd:

   drm/omapdrm: Run DRM default client setup (2024-09-26 09:31:29 +0200)

----------------------------------------------------------------
drm-misc-next for v6.13:

UAPI Changes:
- panthor: Add realtime group priority and priority query.

Cross-subsystem Changes:
- Add Vivek Kasireddy as udmabuf maintainer.
- Assorted udmabuf changes.
- Device tree binding updates.
- dmabuf documentation fixes.
- Move drm_rect to drm core module from kms helper.

Core Changes:
- Update scheduler documentation and concurrency fixes.
- drm/ci updates.
- Add memory-agnostic fbdev client and client-agnostic setup helper.
- Huge driver conversion for using the above.

Driver Changes:
- Assorted fixes to imx, panel/nt35510, sti, accel/ivpu, v3d, vkms,
   host1x.
- Add panel quirks for AYA NEO panels.
- Make module autoloading work for bridge/it6505 and mcde.
- Add huge page support to v3d using a custom shmfs.

----------------------------------------------------------------
Alexander Stein (4):
       drm/bridge: tc358767: Use dev_err_probe
       drm/bridge: tc358767: Only print GPIO debug output if they 
actually occur
       drm/bridge: tc358767: Support write-only registers
       drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency

Andrew Kreimer (2):
       drm/rockchip: Fix a typo
       accel/ivpu: Fix a typo

Andy Shevchenko (3):
       drm/panel: ili9341: Remove duplicate code
       drm/mm: Mark drm_mm_interval_tree*() functions with __maybe_unused
       drm/panel: sony-acx565akm: Use %*ph to print small buffer

Aryabhatta Dey (1):
       Documentation/gpu: Fix typo in Documentation/gpu/komeda-kms.rst

Carlos Eduardo Gallo Filho (9):
       drm/tests: Stop using deprecated dev_private member on 
drm_framebuffer tests
       drm/tests: Add parameters to the drm_test_framebuffer_create test
       drm/tests: Replace strcpy to strscpy on 
drm_test_framebuffer_create test
       drm/tests: Add test case for drm_internal_framebuffer_create()
       drm/tests: Add test for drm_framebuffer_check_src_coords()
       drm/tests: Add test for drm_framebuffer_cleanup()
       drm/tests: Add test for drm_framebuffer_lookup()
       drm/tests: Add test for drm_framebuffer_init()
       drm/tests: Add test for drm_framebuffer_free()

Chen Yufan (1):
       drm/imagination: Convert to use time_before macro

Christian Gmeiner (1):
       drm/v3d: Use v3d_perfmon_find()

Christian König (4):
       drm/sched: add optional errno to drm_sched_start()
       dma-buf: give examples of error codes to use
       drm/doc: Document submission error signaling
       drm/todos: add entry for drm_syncobj error handling

Colin Ian King (1):
       drm/tegra: hdmi: Make read-only const array freqs static

Dave Stevenson (8):
       drm/vc4: crtc: Force trigger of dlist update on margins change
       drm/vc4: hvs: Set AXI panic modes for the HVS
       drm/vc4: hvs: Don't write gamma luts on 2711
       drm/vc4: plane: YUV planes require vertical scaling to always be 
enabled
       drm/vc4: hvs: Fix dlist debug not resetting the next entry pointer
       drm/vc4: hvs: Remove incorrect limit from hvs_dlist debugfs function
       drm/vc4: plane: Move the buffer offset out of the vc4_plane_state
       drm/vc4: hvs: Correct logic on stopping an HVS channel

Detlev Casanova (1):
       dt-bindings: gpu: Add rockchip,rk3576-mali compatible

Dmitry Baryshkov (15):
       drm/display: split DSC helpers from DP helpers
       dt-bindings: display: fsl-imx-drm: drop edid property support
       dt-bindings: display: imx/ldb: drop ddc-i2c-bus property
       drm/imx: cleanup the imx-drm header
       drm/imx: parallel-display: drop edid override support
       drm/imx: ldb: drop custom EDID support
       drm/imx: ldb: drop custom DDC bus support
       drm/imx: ldb: switch to drm_panel_bridge
       drm/imx: parallel-display: switch to drm_panel_bridge
       drm/imx: add internal bridge handling display-timings DT node
       drm/imx: ldb: switch to imx_legacy_bridge / drm_bridge_connector
       drm/imx: parallel-display: switch to imx_legacy_bridge / 
drm_bridge_connector
       drm/imx: move imx_drm_connector_destroy to imx-tve
       drm/xe: select DRM_DISPLAY_DSC_HELPER
       drm/msm: add another DRM_DISPLAY_DSC_HELPER selection

Dom Cobley (7):
       drm/vc4: plane: Keep fractional source coords inside state
       drm/vc4: plane: Handle fractional coordinates using the phase field
       drm/vc4: hdmi: Avoid log spam for audio start failure
       drm/vc4: plane: Add support for YUV444 formats
       drm/vc4: hdmi: Increase audio MAI fifo dreq threshold
       drm/vc4: hdmi: Avoid hang with debug registers when suspended
       drm/vc4: hvs: Remove ABORT_ON_EMPTY flag

Dominique Martinet (1):
       drm/bridge: imx8mp-hdmi-tx: allow 0.5% margin with selected clock

Douglas Anderson (2):
       drm/rockchip: dw_hdmi: Set cur_ctr to 0 always
       drm/rockchip: dw_hdmi: Use auto-generated tables

Fabio Estevam (7):
       drm/bridge: imx8mp-hdmi-tx: Switch to SYSTEM_SLEEP_PM_OPS()
       drm/bridge: imx8qm-ldb: Switch to RUNTIME_PM_OPS()
       drm/bridge: imx8qxp-pixel-combiner: Switch to RUNTIME_PM_OPS()
       drm/bridge: samsung-dsim: Switch to RUNTIME_PM_OPS()
       drm/bridge: dw-hdmi-cec: Switch to SYSTEM_SLEEP_PM_OPS()
       drm/bridge: imx8qxp-ldb: Switch to RUNTIME_PM_OPS()
       dt-bindings: lcdif: Document the dmas/dma-names properties

Geert Uytterhoeven (2):
       drm: renesas: shmobile: Add drm_panic support
       drm: renesas: rcar-du: Add drm_panic support for non-vsp

Huan Yang (7):
       udmabuf: pre-fault when first page fault
       udmabuf: change folios array from kmalloc to kvmalloc
       udmabuf: fix vmap_udmabuf error page set
       udmabuf: udmabuf_create pin folio codestyle cleanup
       udmabuf: introduce udmabuf init and deinit helper
       udmabuf: remove udmabuf_folio
       udmabuf: reuse folio array when pin folios

Jani Nikula (8):
       drm/tegra: fix potential uninitialized variable use
       drm/exynos: hdmi: use display_info for printing display dimensions
       drm/exynos: hdmi: convert to struct drm_edid
       drm/mm: annotate drm_mm_node_scanned_block() with __maybe_unused
       drm/bridge/tdp158: fix build failure
       drm/bridge: ti-sn65dsi86: annotate ti_sn_pwm_pin_{request, 
release} with __maybe_unused
       drm/kmb: annotate set_test_mode_src_osc_freq_target_{low, 
hi}_bits() with __maybe_unused
       drm/imagination: annotate pvr_fw_version_packed() with __maybe_unused

Jianhua Lu (1):
       drm: panel: nt36523: use devm_mipi_dsi_* function to register and 
attach dsi

Jinjie Ruan (7):
       drm/nouveau: Use for_each_child_of_node_scoped()
       drm/imagination: Use memdup_user() helper to simplify code
       drm/imagination: Use memdup_user() helper
       drm/panthor: Use the BITS_PER_LONG macro
       drm/imx/dcss: Use IRQF_NO_AUTOEN flag in request_irq()
       drm/imx/dcss: Use IRQF_NO_AUTOEN flag in request_irq()
       drm/imx/ipuv3: Use IRQF_NO_AUTOEN flag in request_irq()

Joaquín Ignacio Aramendía (3):
       drm: panel-orientation-quirks: Add quirk for AYA NEO 2 model
       drm: panel-orientation-quirks: Add quirk for AYA NEO Founder edition
       drm: panel-orientation-quirks: Add quirk for AYA NEO GEEK

Jon Hunter (1):
       gpu: host1x: Fix boot regression for Tegra

Jonas Karlman (3):
       drm/rockchip: dw_hdmi: Filter modes based on hdmiphy_clk
       drm/rockchip: dw_hdmi: Enable 4K@60Hz mode on RK3399 and RK356x
       drm/rockchip: Load crtc devices in preferred order

Kunwu Chan (1):
       gpu: host1x: Make host1x_context_device_bus_type constant

Li Zetao (1):
       drm/nouveau/volt: use clamp() in nvkm_volt_map()

Liao Chen (2):
       drm/bridge: it6505: Enable module autoloading
       drm/mcde: Enable module autoloading

Linus Walleij (1):
       drm/panel: nt35510: Make new commands optional

Longlong Xia (1):
       accel/qaic: Change to use DEFINE_SHOW_ATTRIBUTE macro

Louis Chauvet (4):
       MAINTAINERS: Add myself as VKMS Maintainer
       drm/vkms: Add documentation
       drm/vkms: Suppress context imbalance detected by sparse warning
       drm/vkms: Add missing check for CRTC initialization

Lu Baolu (1):
       drm/nouveau/tegra: Use iommu_paging_domain_alloc()

Lyude Paul (1):
       drm/panic: Fix uninitialized spinlock acquisition with 
CONFIG_DRM_PANIC=n

Ma Ke (3):
       drm/sti: avoid potential dereference of error pointers in 
sti_hqvdp_atomic_check
       drm/sti: avoid potential dereference of error pointers in 
sti_gdp_atomic_check
       drm/sti: avoid potential dereference of error pointers

Marc Gonzalez (2):
       dt-bindings: display: bridge: add TI TDP158
       drm/bridge: add support for TI TDP158

Mary Guillemard (5):
       drm/panfrost: Add SYSTEM_TIMESTAMP and SYSTEM_TIMESTAMP_FREQUENCY 
parameters
       drm/panfrost: Add cycle counter job requirement
       drm/panthor: Add DEV_QUERY_TIMESTAMP_INFO dev query
       drm/panthor: Add PANTHOR_GROUP_PRIORITY_REALTIME group priority
       drm/panthor: Add DEV_QUERY_GROUP_PRIORITIES_INFO dev query

Matt Coster (1):
       drm/imagination: Use pvr_vm_context_get()

Maxime Ripard (15):
       drm/vc4: hdmi: Warn if writing to an unknown HDMI register
       drm/vc4: hvs: More logging for dlist generation
       drm/vc4: hvs: Print error if we fail an allocation
       drm/vc4: plane: Add more debugging for LBM allocation
       drm/vc4: plane: Use return variable in atomic_check
       drm/vc4: crtc: Move assigned_channel to a variable
       drm/vc4: Introduce generation number enum
       drm/vc4: Make v3d paths unavailable on any generation newer than vc4
       drm/vc4: hvs: Use switch statement to simplify 
vc4_hvs_get_fifo_from_output
       drm/vc4: hvs: Create hw_init function
       drm/vc4: hvs: Create cob_init function
       drm/vc4: hvs: Rename hvs_regs list
       drm/vc4: plane: Change ptr0_offset to an array
       drm/vc4: hvs: Rework LBM alignment
       drm/vc4: hvs: Change prototype of __vc4_hvs_alloc to pass registers

Maíra Canal (11):
       drm/v3d: Address race-condition in MMU flush
       drm/v3d: Flush the MMU before we supply more memory to the binner
       drm/v3d: Fix return if scheduler initialization fails
       drm/gem: Create a drm_gem_object_init_with_mnt() function
       drm/v3d: Introduce gemfs
       drm/gem: Create shmem GEM object in a given mountpoint
       drm/v3d: Reduce the alignment of the node allocation
       drm/v3d: Support Big/Super Pages when writing out PTEs
       drm/v3d: Use gemfs/THP in BO creation if available
       drm/v3d: Add modparam for turning off Big/Super Pages
       drm/v3d: Expose Super Pages capability

Mikko Perttunen (6):
       drm/tegra: gem: Open code drm_prime_gem_destroy
       drm/tegra: gem: Don't attach dma-bufs when not needed
       gpu: host1x: Fix _writel function declarations
       gpu: host1x: Handle CDMA wraparound when debug printing
       gpu: host1x: Complete stream ID entry tables
       gpu: host1x: Add MLOCK recovery for rest of engines

Min-Hua Chen (1):
       drm/panel: khadas-ts050: make ts050[v2]_panel_data static

Nickey Yang (1):
       drm/rockchip: dw_hdmi: Add phy_config for 594Mhz pixel clock

Rodrigo Siqueira (1):
       MAINTAINERS: remove myself as a VKMS maintainer

Shuicheng Lin (1):
       drm/scheduler: Improve documentation

Steven Price (1):
       drm/panthor: Display FW version information

T.J. Mercier (1):
       dma-buf: heaps: Add __init to CMA and system heap module_init 
functions

Tejas Vipin (3):
       drm/panel: samsung-s6e3fa7: transition to mipi_dsi wrapped functions
       drm/panel: himax-hx83112a: transition to mipi_dsi wrapped functions
       drm/panel: raydium-rm69380: transition to mipi_dsi wrapped functions

Thierry Reding (2):
       Revert "drm/tegra: gr3d: Convert into 
dev_pm_domain_attach|detach_list()"
       gpu: host1x: Set up device DMA parameters

Thomas Hellström (1):
       dma-buf/dma-fence: Use a successful read_trylock() annotation for 
dma_fence_begin_signalling()

Thomas Zimmermann (107):
       Merge drm/drm-next into drm-misc-next
       drm/bochs: Remove manual format test from fb_create
       drm/bochs: Use helpers for struct drm_edid
       drm/bochs: Do managed resource cleanup
       drm/bochs: Pass bochs device to various functions
       drm/bochs: Upcast with to_bochs_device()
       drm/bochs: Allocate DRM device in struct bochs_device
       drm/bochs: Use regular atomic helpers
       drm/bochs: Use GEM SHMEM helpers for memory management
       drm/bochs: Validate display modes against available video memory
       drm/gem-vram: Remove support for simple display pipelines
       Merge drm/drm-next into drm-misc-next
       drm/ast: Remove TX-chip bitmask
       drm/ast: astdp: Inline ast_astdp_connector_init()
       drm/ast: astdp: Avoid upcasting to struct ast_device
       drm/ast: astdp: Replace power_on helpers
       drm/ast: astdp: Replace ast_dp_set_on_off()
       drm/ast: dp501: Inline ast_dp501_connector_init()
       drm/ast: dp501: Avoid upcasting to struct ast_device
       drm/ast: sil164: Inline ast_sil164_connector_init()
       drm/ast: vga: Inline ast_vga_connector_init()
       drm/ast: Respect return value from CRTC init
       drm/ast: Avoid upcasting to struct ast_device
       drm/ast: Rename register constants for TX-chip types
       drm/ast: Use TX-chip register constants
       drm/ast: Warn about unsupported TX chips
       drm: Link drm_rect.o into DRM core module
       drm/fbdev-helper: Move color-mode lookup into 4CC format helper
       drm/fbdev-helper: Set and clear VGA switcheroo client from fb_info
       drm/fbdev: Add memory-agnostic fbdev client
       drm: Add client-agnostic setup helper
       drm/fbdev-dma: Support struct drm_driver.fbdev_probe
       drm/arcgpu: Run DRM default client setup
       drm/arm/komeda: Run DRM default client setup
       drm/arm/hdlcd: Run DRM default client setup
       drm/arm/malidp: Run DRM default client setup
       drm/aspeed: Run DRM default client setup
       drm/atmel-hdlcd: Run DRM default client setup
       drm/fsl-dcu: Run DRM default client setup
       drm/hisilicon/kirin: Run DRM default client setup
       drm/hx8357d: Run DRM default client setup
       drm/ili9163: Run DRM default client setup
       drm/ili9225: Run DRM default client setup
       drm/ili9341: Run DRM default client setup
       drm/ili9486: Run DRM default client setup
       drm/imx/dcss: Run DRM default client setup
       drm/imx/ipuv3: Run DRM default client setup
       drm/imx/lcdc: Run DRM default client setup
       drm/ingenic: Run DRM default client setup
       drm/kmb: Run DRM default client setup
       drm/logicvc: Run DRM default client setup
       drm/mcde: Run DRM default client setup
       drm/mediatek: Run DRM default client setup
       drm/meson: Run DRM default client setup
       drm/mi0283qt: Run DRM default client setup
       drm/mxsfb/lcdif: Run DRM default client setup
       drm/mxsfb: Run DRM default client setup
       drm/panel-mipi-dbi: Run DRM default client setup
       drm/pl111: Run DRM default client setup
       drm/renesas/rcar-du: Run DRM default client setup
       drm/renesas/rz-du: Run DRM default client setup
       drm/renesas/shmobile: Run DRM default client setup
       drm/repaper: Run DRM default client setup
       drm/rockchip: Run DRM default client setup
       drm/sti: Run DRM default client setup
       drm/stm: Run DRM default client setup
       drm/sun4i: Run DRM default client setup
       drm/tidss: Run DRM default client setup
       drm/tilcdc: Run DRM default client setup
       drm/st7586: Run DRM default client setup
       drm/st7735r: Run DRM default client setup
       drm/tve200: Run DRM default client setup
       drm/vc4: Run DRM default client setup
       drm/xlnx: Run DRM default client setup
       drm/fbdev-dma: Remove obsolete setup function
       drm/fbdev-shmem: Support struct drm_driver.fbdev_probe
       drm/ast: Run DRM default client setup
       drm/bochs: Run DRM default client setup
       drm/cirrus: Run DRM default client setup
       drm/gm12u320: Run DRM default client setup
       drm/gud: Run DRM default client setup
       drm/hyperv_drm: Run DRM default client setup
       drm/mgag200: Run DRM default client setup
       drm/ofdrm: Use DRM default client setup
       drm/simpledrm: Run DRM default client setup
       drm/solomon: Run DRM default client setup
       drm/udl: Run DRM default client setup
       drm/virtgpu: Run DRM default client setup
       drm/vkms: Run DRM default client setup
       drm/fbdev-shmem: Remove obsolete setup function
       drm/fbdev-ttm: Support struct drm_driver.fbdev_probe
       drm/amdgpu: Run DRM default client setup
       drm/hisilicon/hibmc: Run DRM default client setup
       drm/loongson: Run DRM default client setup
       drm/nouveau: Run DRM default client setup
       drm/qxl: Run DRM default client setup
       drm/vboxvideo: Run DRM default client setup
       drm/vmwgfx: Run DRM default client setup
       drm/fbdev-ttm: Remove obsolete setup function
       drm/armada: Run DRM default client setup
       drm/exynos-drm: Run DRM default client setup
       drm/gma500: Run DRM default client setup
       drm/msm: Run DRM default client setup
       drm/radeon: Run DRM default client setup
       drm/tegra: Run DRM default client setup
       drm/omapdrm: Remove struct drm_fb_helper from struct omap_fbdev.
       drm/omapdrm: Run DRM default client setup

Tim Gover (1):
       drm/vc4: hvs: Enable SCALER_CONTROL early in HVS init

Tomi Valkeinen (3):
       drm/omap: Fix possible NULL dereference
       drm/omap: Hide sparse warnings
       drm/omap: Fix locking in omap_gem_new_dmabuf()

Tommy Chiang (1):
       dma-buf: Add syntax highlighting to code listings in the document

Tvrtko Ursulin (2):
       drm/v3d: Appease lockdep while updating GPU stats
       drm/sched: Add locking to drm_sched_entity_modify_sched

Vignesh Raman (1):
       drm/ci: uprev mesa, IGT and deqp-runner

Vivek Kasireddy (1):
       MAINTAINERS: udmabuf: Add myself as co-maintainer for udmabuf driver

Yakir Yang (1):
       drm/rockchip: dw_hdmi: Adjust cklvl & txlvl for RF/EMI

Yan Zhao (1):
       drm/bochs: use devm_ioremap_wc() to map framebuffer

  .../bindings/display/bridge/ti,tdp158.yaml         |  57 +++
  .../devicetree/bindings/display/fsl,lcdif.yaml     |  20 ++
  .../bindings/display/imx/fsl-imx-drm.txt           |   2 -
  .../devicetree/bindings/display/imx/ldb.txt        |   1 -
  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |   1 +
  Documentation/gpu/drm-uapi.rst                     |  27 +-
  Documentation/gpu/komeda-kms.rst                   |   2 +-
  Documentation/gpu/todo.rst                         |  16 +
  MAINTAINERS                                        |   3 +-
  drivers/accel/ivpu/vpu_boot_api.h                  |   2 +-
  drivers/accel/qaic/qaic_debugfs.c                  |  43 +--
  drivers/dma-buf/Kconfig                            |   1 +
  drivers/dma-buf/dma-buf.c                          |  15 +-
  drivers/dma-buf/dma-fence.c                        |   6 +-
  drivers/dma-buf/heaps/cma_heap.c                   |   4 +-
  drivers/dma-buf/heaps/system_heap.c                |   2 +-
  drivers/dma-buf/udmabuf.c                          | 275 +++++++++------
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
  drivers/gpu/drm/ast/ast_dp.c                       | 141 ++++----
  drivers/gpu/drm/ast/ast_dp501.c                    | 111 +++---
  drivers/gpu/drm/ast/ast_drv.c                      |   8 +-
  drivers/gpu/drm/ast/ast_drv.h                      |  19 +-
  drivers/gpu/drm/ast/ast_main.c                     |  67 ++--
  drivers/gpu/drm/ast/ast_mode.c                     |  34 +-
  drivers/gpu/drm/ast/ast_post.c                     |  36 +-
  drivers/gpu/drm/ast/ast_reg.h                      |  41 +--
  drivers/gpu/drm/ast/ast_sil164.c                   |  55 ++-
  drivers/gpu/drm/ast/ast_vga.c                      |  55 ++-
  drivers/gpu/drm/atmel-hlcdc/Kconfig                |   1 +
  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |   5 +-
  drivers/gpu/drm/bridge/Kconfig                     |   7 +
  drivers/gpu/drm/bridge/Makefile                    |   1 +
  drivers/gpu/drm/bridge/imx/Kconfig                 |  10 +
  drivers/gpu/drm/bridge/imx/Makefile                |   1 +
  drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c     |  87 +++++
  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c        |  20 +-
  drivers/gpu/drm/bridge/imx/imx8qm-ldb.c            |   9 +-
  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |   9 +-
  .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |   9 +-
  drivers/gpu/drm/bridge/ite-it6505.c                |   1 +
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
  drivers/gpu/drm/drm_client_setup.c                 |  66 ++++
  drivers/gpu/drm/drm_fb_helper.c                    | 102 ++----
  drivers/gpu/drm/drm_fbdev_client.c                 | 141 ++++++++
  drivers/gpu/drm/drm_fbdev_dma.c                    | 170 ++-------
  drivers/gpu/drm/drm_fbdev_shmem.c                  | 170 ++-------
  drivers/gpu/drm/drm_fbdev_ttm.c                    | 225 ++++--------
  drivers/gpu/drm/drm_fourcc.c                       |  30 +-
  drivers/gpu/drm/drm_framebuffer.c                  |   2 +
  drivers/gpu/drm/drm_gem.c                          |  34 +-
  drivers/gpu/drm/drm_gem_shmem_helper.c             |  30 +-
  drivers/gpu/drm/drm_gem_vram_helper.c              |  45 ---
  drivers/gpu/drm/drm_mm.c                           |   4 +-
  drivers/gpu/drm/drm_mode_object.c                  |   1 +
  drivers/gpu/drm/drm_panel_orientation_quirks.c     |  18 +
  drivers/gpu/drm/etnaviv/etnaviv_sched.c            |   2 +-
  drivers/gpu/drm/exynos/Kconfig                     |   1 +
  drivers/gpu/drm/exynos/exynos_drm_drv.c            |   4 +-
  drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |  99 +-----
  drivers/gpu/drm/exynos/exynos_drm_fbdev.h          |  15 +-
  drivers/gpu/drm/exynos/exynos_hdmi.c               |  25 +-
  drivers/gpu/drm/fsl-dcu/Kconfig                    |   1 +
  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |   4 +-
  drivers/gpu/drm/gma500/Kconfig                     |   1 +
  drivers/gpu/drm/gma500/fbdev.c                     | 100 +-----
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
  drivers/gpu/drm/imx/ipuv3/imx-ldb.c                | 203 +++--------
  drivers/gpu/drm/imx/ipuv3/imx-tve.c                |   8 +-
  drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c             |   6 +-
  drivers/gpu/drm/imx/ipuv3/parallel-display.c       | 143 ++------
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
  drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c    |   2 +-
  drivers/gpu/drm/omapdrm/Kconfig                    |   1 +
  drivers/gpu/drm/omapdrm/dss/base.c                 |  25 +-
  drivers/gpu/drm/omapdrm/dss/omapdss.h              |   3 +-
  drivers/gpu/drm/omapdrm/omap_dmm_tiler.c           |   6 +-
  drivers/gpu/drm/omapdrm/omap_drv.c                 |   5 +-
  drivers/gpu/drm/omapdrm/omap_drv.h                 |   3 +
  drivers/gpu/drm/omapdrm/omap_fbdev.c               | 161 +++------
  drivers/gpu/drm/omapdrm/omap_fbdev.h               |   8 +
  drivers/gpu/drm/omapdrm/omap_gem.c                 |  10 +-
  drivers/gpu/drm/panel/Kconfig                      |   6 +-
  drivers/gpu/drm/panel/panel-himax-hx83112a.c       | 297 ++++++++--------
  drivers/gpu/drm/panel/panel-ilitek-ili9341.c       | 210 +----------
  drivers/gpu/drm/panel/panel-khadas-ts050.c         |   4 +-
  drivers/gpu/drm/panel/panel-novatek-nt35510.c      |  15 +-
  drivers/gpu/drm/panel/panel-novatek-nt36523.c      |  16 +-
  drivers/gpu/drm/panel/panel-raydium-rm69380.c      |  93 ++---
  drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c      |  71 ++--
  drivers/gpu/drm/panel/panel-sony-acx565akm.c       |   3 +-
  drivers/gpu/drm/panfrost/panfrost_drv.c            |  45 ++-
  drivers/gpu/drm/panfrost/panfrost_gpu.c            |  12 +
  drivers/gpu/drm/panfrost/panfrost_gpu.h            |   1 +
  drivers/gpu/drm/panfrost/panfrost_job.c            |  30 +-
  drivers/gpu/drm/panfrost/panfrost_regs.h           |   2 +
  drivers/gpu/drm/panthor/panthor_drv.c              | 102 +++++-
  drivers/gpu/drm/panthor/panthor_fw.c               |  57 ++-
  drivers/gpu/drm/panthor/panthor_gpu.c              |  47 +++
  drivers/gpu/drm/panthor/panthor_gpu.h              |   4 +
  drivers/gpu/drm/panthor/panthor_mmu.c              |   6 +-
  drivers/gpu/drm/panthor/panthor_sched.c            |   4 +-
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
  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        | 162 ++++-----
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
  drivers/gpu/drm/tegra/fbdev.c                      |  98 +-----
  drivers/gpu/drm/tegra/gem.c                        |  63 ++--
  drivers/gpu/drm/tegra/gem.h                        |  21 ++
  drivers/gpu/drm/tegra/gr3d.c                       |  46 ++-
  drivers/gpu/drm/tegra/hdmi.c                       |   2 +-
  drivers/gpu/drm/tests/drm_framebuffer_test.c       | 375 
+++++++++++++++++++-
  drivers/gpu/drm/tidss/Kconfig                      |   1 +
  drivers/gpu/drm/tidss/tidss_drv.c                  |   4 +-
  drivers/gpu/drm/tilcdc/Kconfig                     |   1 +
  drivers/gpu/drm/tilcdc/tilcdc_drv.c                |   5 +-
  drivers/gpu/drm/tiny/Kconfig                       |  20 +-
  drivers/gpu/drm/tiny/arcpgu.c                      |   4 +-
  drivers/gpu/drm/tiny/bochs.c                       | 387 
++++++++++++---------
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
  drivers/gpu/drm/v3d/v3d_mmu.c                      |  85 +++--
  drivers/gpu/drm/v3d/v3d_perfmon.c                  |   6 +-
  drivers/gpu/drm/v3d/v3d_sched.c                    |  48 ++-
  drivers/gpu/drm/vboxvideo/Kconfig                  |   1 +
  drivers/gpu/drm/vboxvideo/vbox_drv.c               |   4 +-
  drivers/gpu/drm/vc4/Kconfig                        |   1 +
  drivers/gpu/drm/vc4/tests/vc4_mock.c               |  14 +-
  drivers/gpu/drm/vc4/vc4_bo.c                       |  28 +-
  drivers/gpu/drm/vc4/vc4_crtc.c                     |  35 +-
  drivers/gpu/drm/vc4/vc4_drv.c                      |  27 +-
  drivers/gpu/drm/vc4/vc4_drv.h                      |  29 +-
  drivers/gpu/drm/vc4/vc4_gem.c                      |  24 +-
  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  25 +-
  drivers/gpu/drm/vc4/vc4_hdmi_regs.h                |   5 +-
  drivers/gpu/drm/vc4/vc4_hvs.c                      | 351 
+++++++++++--------
  drivers/gpu/drm/vc4/vc4_irq.c                      |  10 +-
  drivers/gpu/drm/vc4/vc4_kms.c                      |  14 +-
  drivers/gpu/drm/vc4/vc4_perfmon.c                  |  20 +-
  drivers/gpu/drm/vc4/vc4_plane.c                    | 281 ++++++++++-----
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
  drivers/gpu/drm/vkms/vkms_drv.h                    | 101 +++++-
  drivers/gpu/drm/vkms/vkms_formats.c                |  62 +++-
  drivers/gpu/drm/vkms/vkms_output.c                 |  14 +-
  drivers/gpu/drm/vmwgfx/Kconfig                     |   1 +
  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   5 +-
  drivers/gpu/drm/xe/Kconfig                         |   1 +
  drivers/gpu/drm/xlnx/Kconfig                       |   1 +
  drivers/gpu/drm/xlnx/zynqmp_kms.c                  |   4 +-
  drivers/gpu/host1x/context.c                       |   1 +
  drivers/gpu/host1x/context_bus.c                   |   2 +-
  drivers/gpu/host1x/dev.c                           | 168 +++++----
  drivers/gpu/host1x/dev.h                           |   6 +-
  drivers/gpu/host1x/hw/cdma_hw.c                    |  12 +
  drivers/gpu/host1x/hw/debug_hw.c                   |  15 +-
  include/drm/bridge/imx.h                           |  13 +
  include/drm/drm_client_setup.h                     |  26 ++
  include/drm/drm_drv.h                              |  18 +
  include/drm/drm_fbdev_client.h                     |  19 +
  include/drm/drm_fbdev_dma.h                        |  13 +-
  include/drm/drm_fbdev_shmem.h                      |  13 +-
  include/drm/drm_fbdev_ttm.h                        |  15 +-
  include/drm/drm_fourcc.h                           |   1 +
  include/drm/drm_gem.h                              |   3 +
  include/drm/drm_gem_shmem_helper.h                 |   3 +
  include/drm/drm_gem_vram_helper.h                  |  13 -
  include/drm/drm_panic.h                            |  14 +
  include/drm/gpu_scheduler.h                        |  14 +-
  include/linux/dma-fence.h                          |   6 +
  include/linux/dma-resv.h                           |   6 +-
  include/linux/host1x.h                             |   6 +
  include/linux/host1x_context_bus.h                 |   2 +-
  include/uapi/drm/panfrost_drm.h                    |   3 +
  include/uapi/drm/panthor_drm.h                     |  51 +++
  include/uapi/drm/v3d_drm.h                         |   1 +
  353 files changed, 4734 insertions(+), 3906 deletions(-)
  create mode 100644 
Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
  create mode 100644 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
  create mode 100644 drivers/gpu/drm/bridge/ti-tdp158.c
  create mode 100644 drivers/gpu/drm/drm_client_setup.c
  create mode 100644 drivers/gpu/drm/drm_fbdev_client.c
  create mode 100644 drivers/gpu/drm/v3d/v3d_gemfs.c
  create mode 100644 include/drm/bridge/imx.h
  create mode 100644 include/drm/drm_client_setup.h
  create mode 100644 include/drm/drm_fbdev_client.h
