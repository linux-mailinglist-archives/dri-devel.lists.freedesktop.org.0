Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87493A82DBE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 19:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E7410E2F2;
	Wed,  9 Apr 2025 17:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IR6df4CY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D5010E164;
 Wed,  9 Apr 2025 17:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744220262; x=1775756262;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=lyhUvwzT3noBYHmJ/AorqWbYOfcMhVQ6H9Bx7+GRS74=;
 b=IR6df4CYI1k4vMO89l1xjnZNqUViIIhkVZ1vCW8t5zbw60ysZ/9lpMUR
 M0rCLZ0Cwzblijmz+L9S0oaNCV4smOxE0Ft/Iui47FJPwSbbk3+GVxOhi
 zTCQ+HLNE+TSkaiw5veSQSs0Mo0WLdppJAj2ExRAsLqMhB28NworV4oFV
 GhsK90BOOe5C12bi0LpRrhCYK/vZf4Yh/y0UOIxrWdRcI/twwiKhz+fON
 iFwL/IhLIHdKx/+Z3GHnxxCOIuvTXohBap746PvhNlpXxVcQnql11fLhg
 sf7XrEaIdlLhZRxjw02Kj/1WteyuEYKk22d+JnWD5hVDxf5r7tkk2dhjq A==;
X-CSE-ConnectionGUID: lfrVSezwQsuFv1Pm1AOlLA==
X-CSE-MsgGUID: l1c1+Q0tTaqGfAsu4F/vRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="68194102"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="68194102"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 10:37:36 -0700
X-CSE-ConnectionGUID: hqLEuP/ERnyIUw8JC9rB+w==
X-CSE-MsgGUID: Z8HqAzLjQFqT6n3mIQjDGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="128632742"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.235])
 ([10.245.244.235])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 10:37:31 -0700
Message-ID: <e147ff95-697b-4067-9e2e-7cbd424e162a@linux.intel.com>
Date: Wed, 9 Apr 2025 19:37:29 +0200
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
 Jani Nikula <jani.nikula@linux.intel.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Asahi Lina <lina@asahilina.net>
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

Here's the first pull request for drm-misc-next in the v6.16 cycle, enjoy!

Notably, UAPI header for asahi is merged!

Best regards,
~Maarten

drm-misc-next-2025-04-09:
drm-misc-next for v6.16-rc1:

UAPI Changes:
- Add ASAHI uapi header!
- Add apple fourcc modifiers.
- Add capset virtio definitions to UAPI.
- Extend EXPORT_SYNC_FILE for timeline syncobjs.

Cross-subsystem Changes:
- Adjust DMA-BUF sg handling to not cache map on attach.
- Update drm/ci, hlcdc, virtio, maintainers.
- Update fbdev todo.
- Allow setting dma-device for dma-buf import.
- Export efi_mem_desc_lookup to make efidrm build as a module.

Core Changes:
- Update drm scheduler docs.
- Use the correct resv object in TTM delayed destroy.
- Fix compiler warning with panic qr code, and other small fixes.
- drm/ci updates.
- Add debugfs file for listing all bridges.
- Small fixes to drm/client, ttm tests.
- Add documentation to display/hdmi.
- Add kunit tests for bridges.
- Dont fail managed device probing if connector polling fails.
- Create Kconfig.debug for drm core.
- Add tests for the drm scheduler.
- Add and use new access helpers for DPCPD.
- Add generic and optimized conversions for format-helper.
- Begin refcounting panel for improving lifetime handling.
- Unify simpledrm and ofdrm sysfb, and add extra features.
- Split hdmi audio in bridge to make DP audio work.

Driver Changes:
- Convert drivers to use devm_platform_ioremap_resource().
- Assorted small fixes to imx/legacy-bridg, gma500, pl111, nouveau, vc4,
  vmwgfx, ast, mxsfb, xlnx, accel/qaic, v3d, bridge/imx8qxp-ldb, ofdrm,
  bridge/fsl-ldb, udl, bridge/ti-sn65dsi86, bridge/anx7625, cirrus-qemu,
  bridge/cdns-dsi, panel/sharp, panel/himax, bridge/sil902x, renesas,
  imagination, various panels.
- Allow attaching more display to vkms.
- Add Powertip PH128800T004-ZZA01 panel.
- Add rotation quirk for ZOTAC panel.
- Convert bridge/tc358775 to atomic.
- Remove deprecated panel calls from synaptics, novatek, samsung panels.
- Refactor shmem helper page pinning and accel drivers using it.
- Add dmabuf support to accel/amdxdna.
- Use 4k page table format for panfrost/mediatek.
- Add common powerup/down dp link helper and use it.
- Assorted compiler warning fixes.
- Support dma-buf import for renesas
The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2025-04-09

for you to fetch changes up to e8bf4a1bdaeadb28d13b9a2bcfd5910fda06eede:

  drm/sysfb: efidrm: Support module builds (2025-04-09 09:03:15 +0200)

----------------------------------------------------------------
drm-misc-next for v6.16-rc1:

UAPI Changes:
- Add ASAHI uapi header!
- Add apple fourcc modifiers.
- Add capset virtio definitions to UAPI.
- Extend EXPORT_SYNC_FILE for timeline syncobjs.

Cross-subsystem Changes:
- Adjust DMA-BUF sg handling to not cache map on attach.
- Update drm/ci, hlcdc, virtio, maintainers.
- Update fbdev todo.
- Allow setting dma-device for dma-buf import.
- Export efi_mem_desc_lookup to make efidrm build as a module.

Core Changes:
- Update drm scheduler docs.
- Use the correct resv object in TTM delayed destroy.
- Fix compiler warning with panic qr code, and other small fixes.
- drm/ci updates.
- Add debugfs file for listing all bridges.
- Small fixes to drm/client, ttm tests.
- Add documentation to display/hdmi.
- Add kunit tests for bridges.
- Dont fail managed device probing if connector polling fails.
- Create Kconfig.debug for drm core.
- Add tests for the drm scheduler.
- Add and use new access helpers for DPCPD.
- Add generic and optimized conversions for format-helper.
- Begin refcounting panel for improving lifetime handling.
- Unify simpledrm and ofdrm sysfb, and add extra features.
- Split hdmi audio in bridge to make DP audio work.

Driver Changes:
- Convert drivers to use devm_platform_ioremap_resource().
- Assorted small fixes to imx/legacy-bridg, gma500, pl111, nouveau, vc4,
  vmwgfx, ast, mxsfb, xlnx, accel/qaic, v3d, bridge/imx8qxp-ldb, ofdrm,
  bridge/fsl-ldb, udl, bridge/ti-sn65dsi86, bridge/anx7625, cirrus-qemu,
  bridge/cdns-dsi, panel/sharp, panel/himax, bridge/sil902x, renesas,
  imagination, various panels.
- Allow attaching more display to vkms.
- Add Powertip PH128800T004-ZZA01 panel.
- Add rotation quirk for ZOTAC panel.
- Convert bridge/tc358775 to atomic.
- Remove deprecated panel calls from synaptics, novatek, samsung panels.
- Refactor shmem helper page pinning and accel drivers using it.
- Add dmabuf support to accel/amdxdna.
- Use 4k page table format for panfrost/mediatek.
- Add common powerup/down dp link helper and use it.
- Assorted compiler warning fixes.
- Support dma-buf import for renesas

----------------------------------------------------------------
Aaron Ruby (1):
      drm/virtio: Add capset definitions to UAPI

Alexander Stein (1):
      drm/bridge: sii902x: Set bridge type

Alexandru Dadu (1):
      drm/imagination: loop counters moved to loop scope

Alyssa Rosenzweig (2):
      drm: add modifiers for Apple GPU layouts
      drm: Add UAPI for the Asahi driver

Andy Yan (5):
      drm/dp: Pull drm_dp_link_power_up/down from Tegra to common drm_dp_helper
      drm/bridge: cdns-mhdp8546: Switch to common helpers to power up/down dp link
      drm/bridge: anx6345: Switch to common helpers to power up/down dp link
      drm/bridge: anx78xx: Switch to common helpers to power up/down dp link
      drm/bridge: it6505: Switch to common helpers to power up/down dp link

Antonin Godard (2):
      dt-bindings: display: simple: Add POWERTIP PH128800T004-ZZA01 panel
      drm/panel: simple: Add POWERTIP PH128800T004-ZZA01 panel entry

Anusha Srivatsa (23):
      drm/fsl-dcu: move to devm_platform_ioremap_resource() usage
      drm/hisilicon: move to devm_platform_ioremap_resource() usage
      drm/mxsfb: move to devm_platform_ioremap_resource() usage
      drm/tegra: move to devm_platform_ioremap_resource() usage
      drm/sprd: move to devm_platform_ioremap_resource() usage
      drm/sti: move to devm_platform_ioremap_resource() usage
      Documentation: Update the todo
      drm/panel/synaptics-r63353: Use _multi variants
      drm/panel/sharp-ls043t1le01: Use _multi variants
      drm/panel: Add new helpers for refcounted panel allocatons
      drm/panel: Add refcount support
      drm/panel: deprecate old-style panel allocation
      drm/panel/panel-simple: Use the new allocation in place of devm_kzalloc()
      panel/abt-y030xx067a: Use the refcounted allocation in place of devm_kzalloc()
      panel/arm-versatile: Use the refcounted allocation in place of devm_kzalloc()
      panel/z00t-tm5p5-n35596: Use refcounted allocation in place of devm_kzalloc()
      panel/auo-a030jtn01: Use refcounted allocation in place of devm_kzalloc()
      panel/bf060y8m-aj0: Use refcounted allocation in place of devm_kzalloc()
      panel/th101mb31ig002-28a: Use refcounted allocation in place of devm_kzalloc()
      panel/boe-tv101wum-ll2: Use refcounted allocation in place of devm_kzalloc()
      panel/dsi-cm: Use refcounted allocation in place of devm_kzalloc()
      panel/ebbg-ft8719: Use refcounted allocation in place of devm_kzalloc()
      panel/panel-edp: Use refcounted allocation in place of devm_kzalloc()

Aradhya Bhatia (9):
      drm/bridge: cdns-dsi: Fix connecting to next bridge
      drm/bridge: cdns-dsi: Fix phy de-init and flag it so
      drm/bridge: cdns-dsi: Fix the clock variable for mode_valid()
      drm/bridge: cdns-dsi: Check return value when getting default PHY config
      drm/bridge: cdns-dsi: Wait for Clk and Data Lanes to be ready
      drm/bridge: cdns-dsi: Move to devm_drm_of_get_bridge()
      drm/mipi-dsi: Add helper to find input format
      drm/bridge: cdns-dsi: Add input format negotiation
      drm/bridge: cdns-dsi: Move DSI mode check to _atomic_check()

Ariel D'Alessandro (6):
      drm/panfrost: Set IOMMU_CACHE flag
      drm/panfrost: Use GPU_MMU_FEATURES_VA_BITS/PA_BITS macros
      drm/panfrost: Set HW_FEATURE_AARCH64_MMU feature flag on Bifrost models
      drm/panfrost: Add support for AARCH64_4K page table format
      drm/panfrost: Force AARCH64_4K page table format on MediaTek MT8188
      drm/panfrost: Force AARCH64_4K page table format on MediaTek MT8192

Arnd Bergmann (1):
      drm: xlnx: zynqmp_dpsub: fix Kconfig dependencies for ASoC

Biju Das (2):
      drm: renesas: rz-du: Add Kconfig dependency between RZG2L_DU and RZG2L_MIPI_DSI
      drm: renesas: rz-du: Drop bpp variable from struct rzg2l_du_format_info

Boris Brezillon (3):
      accel/ivpu: pages_use_count is now a refcount_t
      accel/ivpu: s/drm_gem_shmem_v[un]map/drm_gem_shmem_v[un]map_locked/
      accel/amdxdna: s/drm_gem_v[un]map_unlocked/drm_gem_v[un]map/

Charles Han (4):
      drm/imx: legacy-bridge: fix inconsistent indenting warning
      drm: pl111: fix inconsistent indenting warning
      drm/vc4: plane: fix inconsistent indenting warning
      drm/sti: fix inconsistent indenting warning

Chen Ni (2):
      accel/qaic: Remove redundant 'flush_workqueue()' calls
      drm/bridge: anx7625: Remove redundant 'flush_workqueue()' calls

Christian König (6):
      dma-buf: fix incorrect dma-fence documentation v2
      dma-buf/dma-fence: remove unnecessary callbacks
      dma-buf: dma-buf: stop mapping sg_tables on attach v2
      dma-buf: drop caching of sg_tables
      drm/ttm: test private resv obj on release/destroy
      drm/sched: revert "drm_sched_job_cleanup(): correct false doc"

Christoph Rudorff (1):
      drm/nouveau: fix hibernate on disabled GPU

Christopher Obbard (1):
      dt-bindings: display: panel: samsung,atna40yk20: document ATNA40YK20

Dario Binacchi (1):
      drm/mxsfb: Remove generic DRM drivers in probe function

David Turner (2):
      drm/display: Update comment on hdmi hotplug helper
      drm/vc4: hdmi: Add jack detection to HDMI audio driver

Dmitry Baryshkov (9):
      drm/display: dp: implement new access helpers
      drm/display: dp: change drm_dp_dpcd_read_link_status() return value
      drm/display: dp: use new DCPD access helpers
      drm/display: dp-cec: use new DCPD access helpers
      drm/display: dp-mst-topology: use new DCPD access helpers
      drm/display: dp-tunnel: use new DCPD access helpers
      drm/bridge: split HDMI Audio from DRM_BRIDGE_OP_HDMI
      drm/bridge: add function interface for DisplayPort audio implementation
      drm/bridge-connector: hook DisplayPort audio support

Dmitry Osipenko (12):
      drm/gem: Change locked/unlocked postfix of drm_gem_v/unmap() function names
      drm/gem: Add _locked postfix to functions that have unlocked counterpart
      drm/gem: Document locking rule of vmap and evict callbacks
      drm/shmem-helper: Make all exported symbols GPL
      drm/shmem-helper: Refactor locked/unlocked functions
      drm/shmem-helper: Remove obsoleted is_iomem test
      drm/shmem-helper: Add and use pages_pin_count
      drm/shmem-helper: Use refcount_t for pages_use_count
      drm/shmem-helper: Switch drm_gem_shmem_vmap/vunmap to use pin/unpin
      drm/shmem-helper: Use refcount_t for vmap_use_count
      MAINTAINERS: Add Dmitry Osipenko as drm/virtio co-maintainer
      drm/shmem-helper: Fix unsetting shmem vaddr while vmap refcount > 0

Dr. David Alan Gilbert (3):
      drm/gma500: Remove unused mrst_clock_funcs
      drm/gma500/psb_intel_modes: Remove unused psb_intel_ddc_probe
      drm/gma500: Remove unused psb_mmu_virtual_to_pfn

Gustavo A. R. Silva (5):
      drm/nouveau/conn: Avoid -Wflex-array-member-not-at-end warning
      drm/nouveau/outp: Avoid -Wflex-array-member-not-at-end warning
      drm/nouveau: fence: Avoid -Wflex-array-member-not-at-end warning
      drm/nouveau: svm: Avoid -Wflex-array-member-not-at-end warning
      drm/nouveau: disp: Avoid -Wflex-array-member-not-at-end warning

Huacai Chen (1):
      drm: Remove redundant statement in drm_crtc_helper_set_mode()

Ian Forbes (3):
      drm/vmwgfx: Add seqno waiter for sync_files
      drm/vmwgfx: Fix dumb buffer leak
      drm/vmwgfx: Switch to exclusively using GEM references

Imre Deak (2):
      drm/dp_mst: Fix GUID DPCD write to non-root MST branch devices
      drm/dp_mst: Use drm_dp_dpcd_write_data() to write GUID for non-root MST branch devices

José Expósito (13):
      drm/vkms: Extract vkms_connector header
      drm/vkms: Create vkms_connector struct
      drm/vkms: Add KUnit test scaffolding
      drm/vkms: Extract vkms_config header
      drm/vkms: Move default_config creation to its own function
      drm/vkms: Set device name from vkms_config
      drm/vkms: Allow to configure multiple planes
      drm/vkms: Allow to configure multiple CRTCs
      drm/vkms: Allow to attach planes and CRTCs
      drm/vkms: Allow to configure multiple encoders
      drm/vkms: Allow to attach encoders and CRTCs
      drm/vkms: Allow to configure multiple connectors
      drm/vkms: Allow to attach connectors and encoders

Keisuke Nishimura (1):
      drm/vmwgfx: Add error path for xa_store in vmw_bo_add_detached_resource

Kieran Bingham (1):
      drm: renesas: Extend RZ/G2L supported KMS formats

Laurent Pinchart (1):
      drm: renesas: rz-du: Support dmabuf import

Lizhi Hou (1):
      accel/amdxdna: Add BO import and export

Louis Chauvet (1):
      drm/vkms: Add a validation function for VKMS configuration

Luca Ceresoli (9):
      drm/bridge: move bridges_show logic from drm_debugfs.c
      drm/debugfs: add top-level 'bridges' file showing all added bridges
      drm/bridge: imx8qxp-ldb: cleanup return value
      drm/bridge: fsl-ldb: make warning message more informative
      drm/bridge: add devm_drm_bridge_alloc()
      drm/bridge: add support for refcounting
      drm/bridge: make devm_drm_bridge_alloc() mandatory for bridge allocation
      drm/bridge: ti-sn65dsi83: use dynamic lifetime management
      drm/bridge: samsung-dsim: use dynamic lifetime management

Lucas De Marchi (1):
      drm/panel: Fix build error on !CONFIG_OF

Lyude Paul (2):
      drm/edid: Use unsigned int in drm_add_modes_noedid()
      drm/mode_config: Make drm_mode_config.(max|min)_(width|height) unsigned

Manikandan Muralidharan (1):
      MAINTAINERS: update Microchip's Atmel-HLCDC driver maintainers

Matthew Auld (1):
      drm/format-helper: fix build

Maxime Ripard (26):
      drm/display: hdmi: Create documentation section
      drm/display: hdmi: Mention Infoframes testing with edid-decode
      drm/bridge: Add encoder parameter to drm_bridge_funcs.attach
      drm/bridge: Provide a helper to retrieve current bridge state
      drm/tests: Add kunit tests for bridges
      drm/atomic: Introduce helper to lookup connector by encoder
      drm/tests: helpers: Create new helper to enable output
      drm/tests: hdmi_state_helpers: Switch to new helper
      drm/tests: Create tests for drm_atomic
      drm/bridge: Add helper to reset bridge pipeline
      drm/tests: bridge: Provide tests for drm_bridge_helper_reset_crtc
      drm/bridge: ti-sn65dsi83: Switch to drm_bridge_helper_reset_crtc
      drm/bridge: Introduce drm_bridge_is_atomic() helper
      drm/bridge: cdns-csi: Switch to atomic helpers
      drm/bridge: tc358775: Switch to atomic commit
      drm/bridge: tc358768: Stop disabling when failing to enable
      drm/bridge: tc358768: Convert to atomic helpers
      drm/bridge: ti-sn65dsi86: Remove drm_encoder->crtc use
      drm/vc4: tests: Use return instead of assert
      drm/vc4: tests: Document output handling functions
      drm/vc4: tests: Stop allocating the state in test init
      drm/vc4: tests: Retry pv-muxing tests when EDEADLK
      dma-buf: heaps: system: Remove global variable
      drm/panel: auo-a030jtn01: Fix compilation build
      drm/panel: boe-th101mb31ig002-28a: Fix compilation build
      drm/panel: boe-tv101wum-ll2: Fix compilation build

Maíra Canal (5):
      drm/v3d: Associate a V3D tech revision to all supported devices
      dt-bindings: gpu: v3d: Add per-compatible register restrictions
      dt-bindings: gpu: v3d: Add SMS register to BCM2712 compatible
      dt-bindings: gpu: v3d: Add V3D driver maintainer as DT maintainer
      drm/v3d: Use V3D_SMS registers for power on/off and reset on V3D 7.x

Miguel Ojeda (3):
      drm/panic: clean Clippy warning
      drm/panic: add missing space
      drm/panic: add missing Markdown code span

Philipp Stanner (4):
      drm/sched: Adjust outdated docu for run_job()
      drm/sched: Document run_job() refcount hazard
      drm/sched: Update timedout_job()'s documentation
      drm/sched: Clarify docu concerning drm_sched_job_arm()

Pranav Tyagi (1):
      Documentation: vgaarbiter: Fix grammar

Qasim Ijaz (1):
      drm/ttm/tests: fix incorrect assert in ttm_bo_unreserve_bulk()

Rob Clark (1):
      drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs

Stefan Wahren (1):
      drm/vc4: hdmi: Call HDMI hotplug helper on disconnect

Tejas Vipin (3):
      drm/panel: samsung-s6d7aa0: transition to mipi_dsi wrapped functions
      drm/panel: novatek-nt36523: transition to mipi_dsi wrapped functions
      drm/panel: himax-hx8394: transition to mipi_dsi wrapped functions

Thomas Zimmermann (53):
      drm/ast: Replace AST_VIDMEM_SIZE_ with Linux SZ_ constants
      drm/ast: Add VGACRAA register constants
      drm/ast: Add VGACR99 register constants
      drm/ast: cursor: Add helpers for computing location in video memory
      drm/ast: Add helper for computing framebuffer location in video memory
      drm/ast: Remove vram_fb_available from struct ast_device
      drm/ast: cursor: Drop page alignment
      drm/prime: Support dedicated DMA device for dma-buf imports
      drm/appletbdrm: Set struct drm_device.dma_dev
      drm/gm12u320: Set struct drm_device.dma_dev
      drm/gud: Set struct drm_device.dma_dev
      drm/udl: Set struct drm_device.dma_dev
      drm/udl: Unregister device before cleaning up on disconnect
      drm/udl: Switch poll helpers to managed cleanup
      drm/probe-helper: Do not fail from drmm_kms_helper_poll_init()
      drm/cirrus-qemu: Fix pitch programming
      drm/cirrus-qemu: Stricter mode validation
      drm/cirrus-qemu: Use framebuffer format as-is, drop adjustments
      drm/cirrus-qemu: Remove custom plane state
      drm/format-helper: Move helpers for pixel conversion to header file
      drm/format-helper: Add generic conversion to 32-bit formats
      drm/format-helper: Add generic conversion to 24-bit formats
      drm/format-helper: Add generic conversion to 16-bit formats
      drm/format-helper: Add generic conversion to 8-bit formats
      drm/format-helper: Optimize 32-to-24-bpp conversion
      drm/format-helper: Optimize 32-to-16-bpp conversion
      drm/format-helper: Optimize 32-to-8-bpp conversion
      drm/ofdrm: Remove struct ofdrm_device.pdev
      drm/ofdrm: Open-code drm_simple_encoder_init()
      drm/simpledrm: Remove struct simpledrm_device.nformats
      drm: Move sysfb drivers into separate subdirectory
      drm/sysfb: Add struct drm_sysfb_device
      drm/sysfb: Provide single mode-init helper
      drm/sysfb: Merge mode-config functions
      drm/sysfb: Merge connector functions
      drm/sysfb: Maintain CRTC state in struct drm_sysfb_crtc_state
      drm/sysfb: Merge CRTC functions
      drm/sysfb: Merge primary-plane functions
      drm/sysfb: ofdrm: Add EDID support
      firmware: sysfb: Move bpp-depth calculation into screen_info helper
      drm/sysfb: Add efidrm for EFI displays
      drm/sysfb: efidrm: Add EDID support
      drm/sysfb: Add vesadrm for VESA displays
      drm/sysfb: vesadrm: Add EDID support
      drm/sysfb: vesadrm: Add gamma correction
      Merge drm/drm-next into drm-misc-next
      drm/ast: Fix comment on modeset lock
      drm/ast: Remove vaddr field from struct ast_plane
      drm/ast: Validate display modes against framebuffer and format limits
      drm/simpledrm: Do not upcast in release helpers
      drm/sysfb: simpledrm: Remove unused helper simpledrm_device_of_dev()
      efi: Export symbol efi_mem_desc_lookup
      drm/sysfb: efidrm: Support module builds

Tvrtko Ursulin (6):
      drm: Move some options to separate new Kconfig
      drm/sched: Add scheduler unit testing infrastructure and some basic tests
      drm/sched: Add a simple timeout test
      drm/sched: Add basic priority tests
      drm/sched: Add a basic test for modifying entities scheduler list
      drm/sched: Add a basic test for checking credit limit

Vicki Pfau (1):
      drm: panel-orientation-quirks: Add ZOTAC Gaming Zone

Vignesh Raman (8):
      MAINTAINERS: Update drm/ci maintainers
      drm/ci: refactor software-driver stage jobs
      drm/ci: enable CONFIG_DEBUG_WW_MUTEX_SLOWPATH
      drm/ci: enable lockdep detection
      drm/ci: fix merge request rules
      drm/ci: uprev mesa
      drm/ci: uprev IGT
      drm/ci: arm64.config: mediatek: enable PHY drivers

Ville Syrjälä (8):
      drm/client: Constify modes
      drm/client: Use array notation for function arguments
      drm/client: Streamline mode selection debugs
      drm/client: Make copies of modes
      drm/client: Stop using the legacy crtc->mode
      drm/client: s/new_crtc/crtc/
      drm/client: Move variables to tighter scope
      drm/client: s/unsigned int i/int i/

Wolfram Sang (2):
      drm/bridge: ti-sn65dsi86: make use of debugfs_init callback
      drm/bridge: ti-sn65dsi86: Check bridge connection failure

Zack Rusin (2):
      drm/vmwgfx: Refactor cursor handling
      drm/vmwgfx: Bump the minor version

Zhi Wang (2):
      drm/nouveau/nvkm: factor out current GSP RPC command policies
      drm/nouveau/nvkm: introduce new GSP reply policy NVKM_GSP_RPC_REPLY_POLL

 .clang-format                                      |    7 +
 .../bindings/display/panel/panel-simple.yaml       |    2 +
 .../bindings/display/panel/samsung,atna33xc20.yaml |    2 +
 .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      |   90 +-
 Documentation/gpu/automated_testing.rst            |    4 +
 Documentation/gpu/driver-uapi.rst                  |    5 +
 Documentation/gpu/drm-kms-helpers.rst              |   15 +
 Documentation/gpu/nouveau.rst                      |    3 +
 Documentation/gpu/todo.rst                         |   13 +-
 Documentation/gpu/vgaarbiter.rst                   |    6 +-
 MAINTAINERS                                        |   12 +-
 drivers/accel/amdxdna/TODO                         |    1 -
 drivers/accel/amdxdna/aie2_ctx.c                   |   67 +-
 drivers/accel/amdxdna/amdxdna_gem.c                |  499 ++++--
 drivers/accel/amdxdna/amdxdna_gem.h                |   24 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.c            |   11 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.h            |    2 +
 drivers/accel/ivpu/ivpu_gem.c                      |    6 +-
 drivers/accel/qaic/qaic_debugfs.c                  |    2 -
 drivers/dma-buf/dma-buf.c                          |  167 +-
 drivers/dma-buf/heaps/system_heap.c                |    3 +-
 drivers/dma-buf/sw_sync.c                          |   16 -
 drivers/dma-buf/sync_debug.c                       |   21 +-
 drivers/dma-buf/udmabuf.c                          |    1 -
 drivers/firmware/efi/efi.c                         |    1 +
 drivers/firmware/sysfb_simplefb.c                  |   31 +-
 drivers/gpu/drm/Kconfig                            |  111 +-
 drivers/gpu/drm/Kconfig.debug                      |  116 ++
 drivers/gpu/drm/Makefile                           |    2 +
 drivers/gpu/drm/adp/adp-mipi.c                     |    3 +-
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c           |    8 +-
 drivers/gpu/drm/ast/ast_cursor.c                   |   45 +-
 drivers/gpu/drm/ast/ast_drv.h                      |   17 +-
 drivers/gpu/drm/ast/ast_mm.c                       |   26 +-
 drivers/gpu/drm/ast/ast_mode.c                     |   73 +-
 drivers/gpu/drm/ast/ast_post.c                     |   24 +-
 drivers/gpu/drm/ast/ast_reg.h                      |    2 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |    3 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |   33 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |   33 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |    2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |    4 +-
 drivers/gpu/drm/bridge/aux-bridge.c                |    3 +-
 drivers/gpu/drm/bridge/aux-hpd-bridge.c            |    1 +
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c     |  207 ++-
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h     |    2 -
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   77 +-
 drivers/gpu/drm/bridge/chipone-icn6211.c           |    6 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |    5 +-
 drivers/gpu/drm/bridge/display-connector.c         |    1 +
 drivers/gpu/drm/bridge/fsl-ldb.c                   |    9 +-
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c        |    7 +-
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h        |    2 +-
 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c     |    9 +-
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c       |    3 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |    2 +-
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |    3 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |    3 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |    3 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |    7 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |   47 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |    3 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |    3 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |    3 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |    5 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |    3 +-
 drivers/gpu/drm/bridge/lvds-codec.c                |    3 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |    1 +
 drivers/gpu/drm/bridge/microchip-lvds.c            |    3 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |    3 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |    5 +-
 drivers/gpu/drm/bridge/panel.c                     |    3 +-
 drivers/gpu/drm/bridge/parade-ps8622.c             |    1 +
 drivers/gpu/drm/bridge/parade-ps8640.c             |    3 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              |   10 +-
 drivers/gpu/drm/bridge/sii902x.c                   |    6 +-
 drivers/gpu/drm/bridge/sil-sii8620.c               |    1 +
 drivers/gpu/drm/bridge/simple-bridge.c             |    5 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |    1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |    3 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |    5 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     |    5 +-
 drivers/gpu/drm/bridge/tc358762.c                  |    3 +-
 drivers/gpu/drm/bridge/tc358764.c                  |    3 +-
 drivers/gpu/drm/bridge/tc358767.c                  |    2 +
 drivers/gpu/drm/bridge/tc358768.c                  |   41 +-
 drivers/gpu/drm/bridge/tc358775.c                  |   45 +-
 drivers/gpu/drm/bridge/tda998x_drv.c               |    1 +
 drivers/gpu/drm/bridge/thc63lvd1024.c              |    3 +-
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |    4 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |   38 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  108 +-
 drivers/gpu/drm/bridge/ti-tdp158.c                 |    6 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |    5 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c              |    3 +-
 drivers/gpu/drm/ci/arm64.config                    |    2 +
 drivers/gpu/drm/ci/build.sh                        |   16 +-
 drivers/gpu/drm/ci/build.yml                       |   14 +-
 drivers/gpu/drm/ci/container.yml                   |   24 +
 drivers/gpu/drm/ci/gitlab-ci.yml                   |   53 +-
 drivers/gpu/drm/ci/igt_runner.sh                   |   11 +
 drivers/gpu/drm/ci/image-tags.yml                  |    4 +-
 drivers/gpu/drm/ci/lava-submit.sh                  |    3 +-
 drivers/gpu/drm/ci/test.yml                        |   76 +-
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt  |    8 +-
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt  |    1 +
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt      |   23 +-
 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt      |    1 +
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt       |    8 +-
 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt       |    1 +
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt       |   20 +-
 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt       |    2 +-
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt       |   32 +-
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt       |    1 +
 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt       |   13 +-
 drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt       |    1 +
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt       |    5 -
 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt       |    1 +
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt       |    9 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt       |    1 +
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt       |   22 +-
 drivers/gpu/drm/ci/xfails/i915-whl-skips.txt       |    1 +
 .../gpu/drm/ci/xfails/mediatek-mt8173-fails.txt    |   20 +
 .../gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt   |    7 +
 .../gpu/drm/ci/xfails/mediatek-mt8173-skips.txt    |    1 +
 .../gpu/drm/ci/xfails/mediatek-mt8183-fails.txt    |   28 +-
 .../gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt   |   21 +
 .../gpu/drm/ci/xfails/mediatek-mt8183-skips.txt    |    1 +
 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt     |    1 +
 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt    |    4 -
 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt    |    1 +
 drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt    |    1 +
 .../msm-sc7180-trogdor-kingoftown-flakes.txt       |    7 +
 .../xfails/msm-sc7180-trogdor-kingoftown-skips.txt |    4 +
 .../msm-sc7180-trogdor-lazor-limozeen-flakes.txt   |    7 +
 .../msm-sc7180-trogdor-lazor-limozeen-skips.txt    |    1 +
 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt    |    7 +
 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt     |  313 ++++
 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt |    1 +
 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt  |    1 +
 .../gpu/drm/ci/xfails/panfrost-mt8183-skips.txt    |    1 +
 .../gpu/drm/ci/xfails/panfrost-rk3288-skips.txt    |    1 +
 .../gpu/drm/ci/xfails/panfrost-rk3399-skips.txt    |    1 +
 .../gpu/drm/ci/xfails/rockchip-rk3288-fails.txt    |    1 -
 .../gpu/drm/ci/xfails/rockchip-rk3288-skips.txt    |    1 +
 .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt    |    2 +-
 .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt   |   30 +-
 .../gpu/drm/ci/xfails/rockchip-rk3399-skips.txt    |    1 +
 .../gpu/drm/ci/xfails/virtio_gpu-none-fails.txt    |    1 +
 .../gpu/drm/ci/xfails/virtio_gpu-none-skips.txt    |    1 +
 drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt     |   28 +
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt      |    2 +
 drivers/gpu/drm/display/drm_bridge_connector.c     |  160 +-
 drivers/gpu/drm/display/drm_dp_cec.c               |   37 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |  376 ++---
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |  116 +-
 drivers/gpu/drm/display/drm_dp_tunnel.c            |   20 +-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  294 +++-
 drivers/gpu/drm/drm_atomic.c                       |   59 +
 drivers/gpu/drm/drm_atomic_helper.c                |    3 +
 drivers/gpu/drm/drm_bridge.c                       |  167 +-
 drivers/gpu/drm/drm_bridge_helper.c                |   58 +
 drivers/gpu/drm/drm_client.c                       |   10 +-
 drivers/gpu/drm/drm_client_modeset.c               |  261 ++--
 drivers/gpu/drm/drm_crtc_helper.c                  |    1 -
 drivers/gpu/drm/drm_debugfs.c                      |   38 +-
 drivers/gpu/drm/drm_draw.c                         |  100 +-
 drivers/gpu/drm/drm_drv.c                          |   23 +
 drivers/gpu/drm/drm_edid.c                         |   10 +-
 drivers/gpu/drm/drm_format_helper.c                |  376 ++---
 drivers/gpu/drm/drm_format_internal.h              |  160 ++
 drivers/gpu/drm/drm_gem.c                          |   26 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |    6 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |  147 +-
 drivers/gpu/drm/drm_internal.h                     |    4 +-
 drivers/gpu/drm/drm_mipi_dsi.c                     |   37 +
 drivers/gpu/drm/drm_panel.c                        |   92 +-
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |    6 +
 drivers/gpu/drm/drm_panic_qr.rs                    |    6 +-
 drivers/gpu/drm/drm_prime.c                        |    7 +-
 drivers/gpu/drm/drm_probe_helper.c                 |   11 +-
 drivers/gpu/drm/drm_syncobj.c                      |   47 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |    4 +-
 drivers/gpu/drm/gma500/mmu.c                       |   41 -
 drivers/gpu/drm/gma500/mmu.h                       |    2 -
 drivers/gpu/drm/gma500/oaktrail_crtc.c             |    7 -
 drivers/gpu/drm/gma500/psb_intel_drv.h             |    1 -
 drivers/gpu/drm/gma500/psb_intel_modes.c           |   31 -
 drivers/gpu/drm/gud/gud_drv.c                      |   33 +-
 drivers/gpu/drm/gud/gud_internal.h                 |    1 -
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c       |    4 +-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |    4 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |    4 +-
 drivers/gpu/drm/imagination/pvr_debugfs.c          |    3 +-
 drivers/gpu/drm/imagination/pvr_free_list.c        |    3 +-
 drivers/gpu/drm/imagination/pvr_fw.c               |   12 +-
 drivers/gpu/drm/imagination/pvr_fw_meta.c          |    3 +-
 drivers/gpu/drm/imagination/pvr_fw_mips.c          |    6 +-
 drivers/gpu/drm/imagination/pvr_fw_trace.c         |   23 +-
 drivers/gpu/drm/imagination/pvr_gem.c              |    8 +-
 drivers/gpu/drm/imagination/pvr_hwrt.c             |   12 +-
 drivers/gpu/drm/imagination/pvr_stream.c           |   12 +-
 drivers/gpu/drm/imagination/pvr_vm_mips.c          |    3 +-
 drivers/gpu/drm/imx/ipuv3/parallel-display.c       |    3 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |    5 +-
 drivers/gpu/drm/lima/lima_gem.c                    |    4 +-
 drivers/gpu/drm/lima/lima_sched.c                  |    4 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                    |    3 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |    3 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |    3 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |    3 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |    3 +-
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |    3 +-
 drivers/gpu/drm/meson/meson_encoder_dsi.c          |    3 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |    3 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   24 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |   18 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |    3 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |    1 +
 drivers/gpu/drm/mxsfb/lcdif_drv.c                  |    4 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |   14 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |   20 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h  |   38 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |    8 +
 drivers/gpu/drm/nouveau/nouveau_fence.c            |   14 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c              |   39 +-
 drivers/gpu/drm/nouveau/nvif/conn.c                |   14 +-
 drivers/gpu/drm/nouveau/nvif/outp.c                |   15 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c     |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     |   78 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c |    2 +-
 drivers/gpu/drm/omapdrm/dss/dpi.c                  |    3 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c                  |    3 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                |    3 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                |    3 +-
 drivers/gpu/drm/omapdrm/dss/sdi.c                  |    3 +-
 drivers/gpu/drm/omapdrm/dss/venc.c                 |    3 +-
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c       |   10 +-
 drivers/gpu/drm/panel/panel-arm-versatile.c        |   11 +-
 .../gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c   |   11 +-
 drivers/gpu/drm/panel/panel-auo-a030jtn01.c        |   10 +-
 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c     |   11 +-
 .../gpu/drm/panel/panel-boe-th101mb31ig002-28a.c   |   11 +-
 drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c     |   10 +-
 drivers/gpu/drm/panel/panel-dsi-cm.c               |   10 +-
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c          |   11 +-
 drivers/gpu/drm/panel/panel-edp.c                  |    9 +-
 drivers/gpu/drm/panel/panel-himax-hx8394.c         |  441 +++---
 drivers/gpu/drm/panel/panel-novatek-nt36523.c      | 1639 ++++++++++----------
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c      |  238 +--
 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c    |   41 +-
 drivers/gpu/drm/panel/panel-simple.c               |   38 +-
 drivers/gpu/drm/panel/panel-synaptics-r63353.c     |   68 +-
 drivers/gpu/drm/panfrost/panfrost_device.h         |   16 +
 drivers/gpu/drm/panfrost/panfrost_drv.c            |    4 +-
 drivers/gpu/drm/panfrost/panfrost_dump.c           |    4 +-
 drivers/gpu/drm/panfrost/panfrost_features.h       |    3 +
 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c   |    2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |  152 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c        |    6 +-
 drivers/gpu/drm/panfrost/panfrost_regs.h           |   36 +
 drivers/gpu/drm/panthor/panthor_gem.h              |    4 +-
 drivers/gpu/drm/panthor/panthor_sched.c            |    4 +-
 drivers/gpu/drm/pl111/pl111_versatile.c            |    2 +-
 drivers/gpu/drm/radeon/atombios_dp.c               |    8 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |    3 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |    3 +-
 drivers/gpu/drm/renesas/rz-du/Kconfig              |   15 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c       |    2 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c       |  120 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h       |    1 -
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c     |    3 +-
 drivers/gpu/drm/scheduler/.kunitconfig             |   12 +
 drivers/gpu/drm/scheduler/Makefile                 |    2 +
 drivers/gpu/drm/scheduler/sched_main.c             |   35 +-
 drivers/gpu/drm/scheduler/tests/Makefile           |    7 +
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c   |  359 +++++
 drivers/gpu/drm/scheduler/tests/sched_tests.h      |  226 +++
 drivers/gpu/drm/scheduler/tests/tests_basic.c      |  476 ++++++
 drivers/gpu/drm/sprd/sprd_dpu.c                    |   13 +-
 drivers/gpu/drm/sprd/sprd_dsi.c                    |   13 +-
 drivers/gpu/drm/sti/sti_compositor.c               |   14 +-
 drivers/gpu/drm/sti/sti_dvo.c                      |   14 +-
 drivers/gpu/drm/sti/sti_hda.c                      |   15 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |   15 +-
 drivers/gpu/drm/sti/sti_hqvdp.c                    |   14 +-
 drivers/gpu/drm/sti/sti_tvout.c                    |   14 +-
 drivers/gpu/drm/sti/sti_vtg.c                      |   14 +-
 drivers/gpu/drm/stm/lvds.c                         |   11 +-
 drivers/gpu/drm/sysfb/Kconfig                      |   76 +
 drivers/gpu/drm/sysfb/Makefile                     |    8 +
 drivers/gpu/drm/sysfb/drm_sysfb_helper.c           |  324 ++++
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h           |  136 ++
 drivers/gpu/drm/sysfb/efidrm.c                     |  495 ++++++
 drivers/gpu/drm/{tiny => sysfb}/ofdrm.c            |  364 +----
 drivers/gpu/drm/{tiny => sysfb}/simpledrm.c        |  244 +--
 drivers/gpu/drm/sysfb/vesadrm.c                    |  662 ++++++++
 drivers/gpu/drm/tegra/dp.c                         |   67 -
 drivers/gpu/drm/tegra/dp.h                         |    2 -
 drivers/gpu/drm/tegra/dsi.c                        |    4 +-
 drivers/gpu/drm/tegra/sor.c                        |    4 +-
 drivers/gpu/drm/tests/Makefile                     |    2 +
 drivers/gpu/drm/tests/drm_atomic_test.c            |  153 ++
 drivers/gpu/drm/tests/drm_bridge_test.c            |  417 +++++
 drivers/gpu/drm/tests/drm_client_modeset_test.c    |    3 +-
 drivers/gpu/drm/tests/drm_gem_shmem_test.c         |   28 +-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  158 +-
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |   61 +
 drivers/gpu/drm/tidss/tidss_encoder.c              |    3 +-
 drivers/gpu/drm/tiny/Kconfig                       |   32 -
 drivers/gpu/drm/tiny/Makefile                      |    2 -
 drivers/gpu/drm/tiny/appletbdrm.c                  |   26 +-
 drivers/gpu/drm/tiny/cirrus-qemu.c                 |  143 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |   46 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c            |    2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |    4 +-
 drivers/gpu/drm/udl/udl_drv.c                      |   20 +-
 drivers/gpu/drm/udl/udl_drv.h                      |    1 -
 drivers/gpu/drm/udl/udl_main.c                     |   16 +-
 drivers/gpu/drm/udl/udl_modeset.c                  |    1 +
 drivers/gpu/drm/v3d/v3d_debugfs.c                  |  116 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |   62 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |   22 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |   27 +-
 drivers/gpu/drm/v3d/v3d_irq.c                      |    6 +-
 drivers/gpu/drm/v3d/v3d_perfmon.c                  |    4 +-
 drivers/gpu/drm/v3d/v3d_regs.h                     |   26 +
 drivers/gpu/drm/v3d/v3d_sched.c                    |    6 +-
 drivers/gpu/drm/vc4/tests/vc4_mock_output.c        |   62 +-
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c     |  154 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |    3 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   22 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |    7 +
 drivers/gpu/drm/vc4/vc4_plane.c                    |    2 +-
 drivers/gpu/drm/vgem/vgem_fence.c                  |   15 -
 drivers/gpu/drm/virtio/virtgpu_fence.c             |   16 -
 drivers/gpu/drm/virtio/virtgpu_prime.c             |    1 -
 drivers/gpu/drm/vkms/Kconfig                       |   15 +
 drivers/gpu/drm/vkms/Makefile                      |    5 +-
 drivers/gpu/drm/vkms/tests/.kunitconfig            |    4 +
 drivers/gpu/drm/vkms/tests/Makefile                |    3 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c      |  951 ++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c                 |  640 ++++++++
 drivers/gpu/drm/vkms/vkms_config.h                 |  437 ++++++
 drivers/gpu/drm/vkms/vkms_connector.c              |   61 +
 drivers/gpu/drm/vkms/vkms_connector.h              |   26 +
 drivers/gpu/drm/vkms/vkms_drv.c                    |   45 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |   17 +-
 drivers/gpu/drm/vkms/vkms_output.c                 |  172 +-
 drivers/gpu/drm/vmwgfx/Makefile                    |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |   20 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h                 |    8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c            |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c       |  844 ++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h       |   81 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   27 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   38 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |   52 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |   18 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |  874 +----------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |   71 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |   10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c                |    3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c         |   63 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |   10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |   12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |   11 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |   85 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c         |    7 +-
 drivers/gpu/drm/xlnx/Kconfig                       |    1 +
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |    3 +-
 drivers/platform/arm64/acer-aspire1-ec.c           |    3 +-
 drivers/video/screen_info_generic.c                |   36 +
 include/drm/display/drm_dp_helper.h                |   94 +-
 include/drm/drm_atomic.h                           |    3 +
 include/drm/drm_bridge.h                           |  195 ++-
 include/drm/drm_bridge_helper.h                    |   12 +
 include/drm/drm_device.h                           |   41 +
 include/drm/drm_edid.h                             |    2 +-
 include/drm/drm_gem.h                              |   15 +-
 include/drm/drm_gem_shmem_helper.h                 |   45 +-
 include/drm/drm_kunit_helpers.h                    |    8 +
 include/drm/drm_mipi_dsi.h                         |    1 +
 include/drm/drm_mode_config.h                      |    4 +-
 include/drm/drm_panel.h                            |   41 +
 include/drm/drm_probe_helper.h                     |    2 +-
 include/drm/gpu_scheduler.h                        |  112 +-
 include/linux/dma-buf.h                            |   27 -
 include/linux/dma-fence.h                          |   25 +-
 include/linux/screen_info.h                        |    9 +
 include/uapi/drm/asahi_drm.h                       | 1194 ++++++++++++++
 include/uapi/drm/drm.h                             |    4 +
 include/uapi/drm/drm_fourcc.h                      |   45 +
 include/uapi/drm/virtgpu_drm.h                     |    6 +
 include/uapi/linux/virtio_gpu.h                    |    3 +-
 include/video/pixel_format.h                       |   41 +
 396 files changed, 14866 insertions(+), 6309 deletions(-)
 create mode 100644 drivers/gpu/drm/Kconfig.debug
 create mode 100644 drivers/gpu/drm/drm_bridge_helper.c
 create mode 100644 drivers/gpu/drm/drm_format_internal.h
 create mode 100644 drivers/gpu/drm/scheduler/.kunitconfig
 create mode 100644 drivers/gpu/drm/scheduler/tests/Makefile
 create mode 100644 drivers/gpu/drm/scheduler/tests/mock_scheduler.c
 create mode 100644 drivers/gpu/drm/scheduler/tests/sched_tests.h
 create mode 100644 drivers/gpu/drm/scheduler/tests/tests_basic.c
 create mode 100644 drivers/gpu/drm/sysfb/Kconfig
 create mode 100644 drivers/gpu/drm/sysfb/Makefile
 create mode 100644 drivers/gpu/drm/sysfb/drm_sysfb_helper.c
 create mode 100644 drivers/gpu/drm/sysfb/drm_sysfb_helper.h
 create mode 100644 drivers/gpu/drm/sysfb/efidrm.c
 rename drivers/gpu/drm/{tiny => sysfb}/ofdrm.c (75%)
 rename drivers/gpu/drm/{tiny => sysfb}/simpledrm.c (76%)
 create mode 100644 drivers/gpu/drm/sysfb/vesadrm.c
 create mode 100644 drivers/gpu/drm/tests/drm_atomic_test.c
 create mode 100644 drivers/gpu/drm/tests/drm_bridge_test.c
 create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/vkms/tests/Makefile
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_config_test.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_config.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_config.h
 create mode 100644 drivers/gpu/drm/vkms/vkms_connector.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_connector.h
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h
 create mode 100644 include/drm/drm_bridge_helper.h
 create mode 100644 include/uapi/drm/asahi_drm.h
 create mode 100644 include/video/pixel_format.h
