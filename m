Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 436494439CD
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 00:34:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B120C6E997;
	Tue,  2 Nov 2021 23:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330446E851
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 23:34:39 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id m14so3150923edd.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 16:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=QnhaNFSHZ9HnpSPGlQSvhKemLK6qMVaiUtPUgoIV0mc=;
 b=fgwCLRd6x/R7BpOHiDObYFi6B1+3YThZcEBqdVzCJYM+3pWCKJZEY71No+hvx44ydR
 wTQZG4L3liqjGiFa42yAlZTYJ/2qs+JUs7Jfs910WZw/kT/gRZdjq9PY9Sg40giXZF/k
 gPt7Lj0+QuvnlJGK5xaO5rAuqhyp3uK6N4veaLxL+RpU2CBcUe7TN+hPnkWjA3Q1OwbG
 OumznBOFfM0ZObWXFdWOogm0t4qx2KB29QhnhFreWV1Fmq4zcH9kV2Ta6t/Phk9WBhat
 /lP2rK0P3oxOsTg4WQMpU/ZPpL3Gn5SCkM2V09iOY9+fPBrwIXGoVvNMo0Y49HuFBcWQ
 atTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=QnhaNFSHZ9HnpSPGlQSvhKemLK6qMVaiUtPUgoIV0mc=;
 b=5hc859A4V26civBlSxNQ4yxbI6LzE5/94LZ1P8w9BWXqUKa3y6GDXg5gPhAp6zKtHr
 J0UbMnUmFSzrF/zCSQ+SAdq9NBUwe3btiqy5UhqZ49hXpqyH0DuY14hRm98QIcnwJDC7
 Vi16qBIOJsTRE1hd3dPY1b4+0oGKGPAxkuagO9gxs5SinE+ceLF/upNiwi0x8lw304YO
 iZM19basy6/65zuE0mLO0qzU7ZhMsURjwqhcSaga1ogIBLXiaQ04pZ2W3SkmRbihge3H
 cPHpOm7/nwAtSdDd9czpmKjKHk/ubL3cLG2LzDbcmMZmJPIJ3lCN/+cF/saPvUeiQtGJ
 EjLA==
X-Gm-Message-State: AOAM532rC/Xat6o41EDWCvdFX6xv9oSv3btk8qteyB7CkwvnKa0jlySD
 drx0rLqXa64iCou48QQKBd7ahiPglsj3VmDfiiE=
X-Google-Smtp-Source: ABdhPJxHWFrWJV8pykEC5LLseJZbFfXCJNlSD6y35MzV8o5ODlv3y0xfhfgZ9PuBtxnxXRykmhBqZQQjSoEkEbX6Gn0=
X-Received: by 2002:a17:906:2ad2:: with SMTP id
 m18mr47296359eje.64.1635896075817; 
 Tue, 02 Nov 2021 16:34:35 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 3 Nov 2021 09:34:23 +1000
Message-ID: <CAPM=9tyOyz4_-OdjDduFkponSXycO6maBDFsWGTLv+j=_Vp6ww@mail.gmail.com>
Subject: [git pull] drm for 5.16-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

This is the main drm pull for 5.16-rc1.

This contains a shared tip ww mutex tree but I think that's all landed now.

There are only 2 minor conflicts, both solved easily for me on a test
pull just after I generated this, let me know if there is anything I
missed.

Otherwise summary below, i915 starts to add support for DG2 GPUs,
enables DG1 and ADL-S support by default, lots of work to enable
DisplayPort 2.0 across drivers. Lots of documentation updates and
fixes across the board.

Regards,
Dave.

drm-next-2021-11-03:
drm for 5.16-rc1

core:
- improve dma_fence, lease and resv documentation
- shmem-helpers: allocate WC pages on x86, use vmf_insert_pin
- sched fixes/improvements
- allow empty drm leases
- add dma resv iterator
- add more DP 2.0 headers
- DP MST helper improvements for DP2.0

dma-buf:
- avoid warnings, remove fence trace macros

bridge:
- new helper to get rid of panels
- probe improvements for it66121
- enable DSI EOTP for anx7625

fbdev:
- efifb: release runtime PM on destroy

ttm:
- kerneldoc switch
- helper to clear all DMA mappings
- pool shrinker optimizaton
- remove ttm_tt_destroy_common
- update ttm_move_memcpy for async use

panel:
- add new panel-edp driver

amdgpu:
 - Initial DP 2.0 support
 - Initial USB4 DP tunnelling support
 - Aldebaran MCE support
 - Modifier support for DCC image stores for GFX 10.3
 - Display rework for better FP code handling
 - Yellow Carp/Cyan Skillfish updates
 - Cyan Skillfish display support
 - convert vega/navi to IP discovery asic enumeration
 - validate IP discovery table
 - RAS improvements
 - Lots of fixes

 i915:
 - DG1 PCI IDs + LMEM discovery/placement
 - DG1 GuC submission by default
 - ADL-S PCI IDs updated + enabled by default
 - ADL-P (XE_LPD) fixed and updates
 - DG2 display fixes
 - PXP protected object support for Gen12 integrated
 - expose multi-LRC submission interface for GuC
 - export logical engine instance to user
 - Disable engine bonding on Gen12+
 - PSR cleanup
 - PSR2 selective fetch by default
 - DP 2.0 prep work
 - VESA vendor block + MSO use of it
 - FBC refactor
 - try again to fix fast-narrow vs slow-wide eDP training
 - use THP when IOMMU enabled
 - LMEM backup/restore for suspend/resume
 - locking simplification
 - GuC major reworking
 - async flip VT-D workaround changes
 - DP link training improvements
 - misc display refactorings

bochs:
- new PCI ID

rcar-du:
- Non-contiguious buffer import support for rcar-du
- r8a779a0 support prep

omapdrm:
- COMPILE_TEST fixes

sti:
- COMPILE_TEST fixes

msm:
- fence ordering improvements
- eDP support in DP sub-driver
- dpu irq handling cleanup
- CRC support for making igt happy
- NO_CONNECTOR bridge support
- dsi: 14nm phy support for msm8953
- mdp5: msm8x53, sdm450, sdm632 support

stm:
- layer alpha + zpo support

v3d:
- fix Vulkan CTS failure
- support multiple sync objects

gud:
- add R8/RGB332/RGB888 pixel formats

vc4:
- convert to new bridge helpers

vgem:
- use shmem helpers

virtio:
- support mapping exported vram

zte:
- remove obsolete driver

rockchip:
- use bridge attach no connector for LVDS/RGB
The following changes since commit 3906fe9bb7f1a2c8667ae54e967dc8690824f4ea=
:

  Linux 5.15-rc7 (2021-10-25 11:30:31 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2021-11-03

for you to fetch changes up to d9bd054177fbd2c4762546aec40fc3071bfe4cc0:

  Merge tag 'amd-drm-next-5.16-2021-10-29' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-11-02
12:40:58 +1000)

----------------------------------------------------------------
drm for 5.16-rc1

core:
- improve dma_fence, lease and resv documentation
- shmem-helpers: allocate WC pages on x86, use vmf_insert_pin
- sched fixes/improvements
- allow empty drm leases
- add dma resv iterator
- add more DP 2.0 headers
- DP MST helper improvements for DP2.0

dma-buf:
- avoid warnings, remove fence trace macros

bridge:
- new helper to get rid of panels
- probe improvements for it66121
- enable DSI EOTP for anx7625

fbdev:
- efifb: release runtime PM on destroy

ttm:
- kerneldoc switch
- helper to clear all DMA mappings
- pool shrinker optimizaton
- remove ttm_tt_destroy_common
- update ttm_move_memcpy for async use

panel:
- add new panel-edp driver

amdgpu:
 - Initial DP 2.0 support
 - Initial USB4 DP tunnelling support
 - Aldebaran MCE support
 - Modifier support for DCC image stores for GFX 10.3
 - Display rework for better FP code handling
 - Yellow Carp/Cyan Skillfish updates
 - Cyan Skillfish display support
 - convert vega/navi to IP discovery asic enumeration
 - validate IP discovery table
 - RAS improvements
 - Lots of fixes

 i915:
 - DG1 PCI IDs + LMEM discovery/placement
 - DG1 GuC submission by default
 - ADL-S PCI IDs updated + enabled by default
 - ADL-P (XE_LPD) fixed and updates
 - DG2 display fixes
 - PXP protected object support for Gen12 integrated
 - expose multi-LRC submission interface for GuC
 - export logical engine instance to user
 - Disable engine bonding on Gen12+
 - PSR cleanup
 - PSR2 selective fetch by default
 - DP 2.0 prep work
 - VESA vendor block + MSO use of it
 - FBC refactor
 - try again to fix fast-narrow vs slow-wide eDP training
 - use THP when IOMMU enabled
 - LMEM backup/restore for suspend/resume
 - locking simplification
 - GuC major reworking
 - async flip VT-D workaround changes
 - DP link training improvements
 - misc display refactorings

bochs:
- new PCI ID

rcar-du:
- Non-contiguious buffer import support for rcar-du
- r8a779a0 support prep

omapdrm:
- COMPILE_TEST fixes

sti:
- COMPILE_TEST fixes

msm:
- fence ordering improvements
- eDP support in DP sub-driver
- dpu irq handling cleanup
- CRC support for making igt happy
- NO_CONNECTOR bridge support
- dsi: 14nm phy support for msm8953
- mdp5: msm8x53, sdm450, sdm632 support

stm:
- layer alpha + zpo support

v3d:
- fix Vulkan CTS failure
- support multiple sync objects

gud:
- add R8/RGB332/RGB888 pixel formats

vc4:
- convert to new bridge helpers

vgem:
- use shmem helpers

virtio:
- support mapping exported vram

zte:
- remove obsolete driver

rockchip:
- use bridge attach no connector for LVDS/RGB

----------------------------------------------------------------
Aaron Liu (1):
      drm/amdgpu: support B0&B1 external revision id for yellow carp

Agustin Gutierrez (2):
      Revert "drm/amd/display: Fix error in dmesg at boot"
      Revert "drm/amd/display: Add helper for blanking all dp displays"

Ahmad Othman (2):
      drm/amd/display: Add support for USB4 on C20 PHY for DCN3.1
      drm/amd/display: fix a crash on USB4 over C20 PHY

Akeem G Abodunrin (1):
      drm/i915/dg2: Add new LRI reg offsets

Akira Yokosawa (1):
      drm/i915/guc, docs: Fix pdfdocs build error by removing nested grid

Alex Bee (3):
      drm: bridge: it66121: Fix return value it66121_probe
      drm/rockchip: handle non-platform devices in
rockchip_drm_endpoint_is_subdriver
      drm/rockchip: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to drm_bridge_a=
ttach

Alex Deucher (100):
      MAINTAINERS: add Andrey as the DRM GPU scheduler maintainer
      drm/amdgpu/display: add a proper license to dc_link_dp.c
      MAINTAINERS: fix up entry for AMD Powerplay
      drm/amdgpu: make soc15_common_ip_funcs static
      drm/amdgpu: move headless sku check into harvest function
      drm/amdgpu: add debugfs access to the IP discovery table
      drm/amdgpu: store HW IP versions in the driver structure
      drm/amdgpu: fill in IP versions from IP discovery table
      drm/amdgpu: add XGMI HWIP
      drm/amdgpu/nv: export common IP functions
      drm/amdgpu: add initial IP enumeration via IP discovery table
      drm/amdgpu/sdma5.0: convert to IP version checking
      drm/amdgpu/sdma5.2: convert to IP version checking
      drm/amdgpu/gfx10: convert to IP version checking
      drm/amdgpu: filter out radeon PCI device IDs
      drm/amdgpu: bind to any 0x1002 PCI diplay class device
      drm/amdgpu/gmc10.0: convert to IP version checking
      drm/amdgpu: Use IP discovery to drive setting IP blocks by default
      drm/amdgpu: drive nav10 from the IP discovery table
      drm/amdgpu/gfxhub2.1: convert to IP version checking
      drm/amdgpu/mmhub2.0: convert to IP version checking
      drm/amdgpu/mmhub2.1: convert to IP version checking
      drm/amdgpu/vcn3.0: convert to IP version checking
      drm/amdgpu/athub2.0: convert to IP version checking
      drm/amdgpu/athub2.1: convert to IP version checking
      drm/amdgpu/navi10_ih: convert to IP version checking
      drm/amdgpu/amdgpu_smu: convert to IP version checking
      drm/amdgpu/smu11.0: convert to IP version checking
      drm/amdgpu/navi10_ppt: convert to IP version checking
      drm/amdgpu/sienna_cichlid_ppt: convert to IP version checking
      drm/amdgpu/nv: convert to IP version checking
      drm/amdgpu: drive all navi asics from the IP discovery table
      drm/amdgpu/display/dm: convert to IP version checking
      drm/amdgpu: add DCI HWIP
      drm/amdgpu/soc15: export common IP functions
      drm/amdgpu: add initial IP discovery support for vega based parts
      drm/amdgpu/soc15: get rev_id in soc15_common_early_init
      drm/amdgpu: drive all vega asics from the IP discovery table
      drm/amdgpu: default to true in amdgpu_device_asic_has_dc_support
      drm/amdgpu/display/dm: convert RAVEN to IP version checking
      drm/amdgpu/sdma4.0: convert to IP version checking
      drm/amdgpu/hdp4.0: convert to IP version checking
      drm/amdgpu/gfx9.0: convert to IP version checking
      drm/amdgpu/amdgpu_psp: convert to IP version checking
      drm/amdgpu/psp_v11.0: convert to IP version checking
      drm/amdgpu/psp_v13.0: convert to IP version checking
      drm/amdgpu/pm/smu_v11.0: update IP version checking
      drm/amdgpu/pm/smu_v13.0: convert IP version checking
      drm/amdgpu/pm/amdgpu_smu: convert more IP version checking
      drm/amdgpu/amdgpu_vcn: convert to IP version checking
      drm/amdgpu/vcn2.5: convert to IP version checking
      drm/amdgpu/soc15: convert to IP version checking
      drm/amdgpu: add VCN1 hardware IP
      drm/amdgpu: get VCN and SDMA instances from IP discovery table
      drm/amdgpu/sdma: remove manual instance setting
      drm/amdgpu/vcn: remove manual instance setting
      drm/amdgpu: get VCN harvest information from IP discovery table
      drm/amdgpu/ucode: add default behavior
      drm/amdgpu: add new asic_type for IP discovery
      drm/amdgpu: set CHIP_IP_DISCOVERY as the asic type by default
      drm/amdgpu: convert IP version array to include instances
      drm/amdgpu: clean up set IP function
      drm/amdgpu: add support for SRIOV in IP discovery path
      drm/amdkfd: clean up parameters in kgd2kfd_probe
      drm/amdkfd: convert kfd_device.c to use GC IP version
      drm/amdgpu: add an option to override IP discovery table from a file
      drm/amdgpu: consolidate case statements
      Documentation/gpu: remove spurious "+" in amdgpu.rst
      drm/amdgpu/display: fold DRM_AMD_DC_DCN201 into DRM_AMD_DC_DCN
      drm/amdgpu/gmc9: convert to IP version checking
      drm/amdgpu/display: fix dependencies for DRM_AMD_DC_SI
      drm/amdgpu/discovery: add missing case for SMU 11.0.5
      drm/amdgpu: add missing case for HDP for renoir
      drm/amdgpu/nbio7.4: don't use GPU_HDP_FLUSH bit 12
      drm/amdgpu/nbio2.3: don't use GPU_HDP_FLUSH bit 12
      drm/amdgpu/smu11: fix firmware version check for vangogh
      drm/amdgpu/swsmu: fix is_support_sw_smu() for VEGA20
      drm/amdgpu/psp: add some missing cases to
psp_check_pmfw_centralized_cstate_management
      drm/amdgpu/pm: properly handle sclk for profiling modes on vangogh
      drm/amdgpu/gfx10: fix typo in gfx_v10_0_update_gfx_clock_gating()
      drm/amdkfd: protect hawaii_device_info with CONFIG_DRM_AMDGPU_CIK
      drm/amdkfd: protect raven_device_info with KFD_SUPPORT_IOMMU_V2
      drm/amdgpu: drop soc15_set_ip_blocks()
      drm/amdgpu: drop nv_set_ip_blocks()
      drm/amdgpu: drop navi reg init functions
      drm/amdgpu/vcn3.0: handle harvesting in firmware setup
      drm/amdgpu: Consolidate VCN firmware setup code
      drm/amdgpu/vcn2.0: remove intermediate variable
      drm/amdgpu/vcn3.0: remove intermediate variable
      drm/amdgpu: Workaround harvesting info for some navy flounder boards
      drm/amdgpu/swsmu: handle VCN harvesting for VCN SMU setup
      drm/amdgpu/smu11.0: add missing IP version check
      drm/amdgpu/nbio7.4: use original HDP_FLUSH bits
      drm/amdgpu/display: fix build when CONFIG_DRM_AMD_DC_DCN is not set
      drm/amdgpu/display: add quirk handling for stutter mode
      drm/amdgpu/pm: look up current_level for asics without pm callback
      drm/amdgpu/UAPI: rearrange header to better align related items
      drm/amdgpu/discovery: add UVD/VCN IP instance info for soc15 parts
      drm/amdgpu/discovery: add SDMA IP instance info for soc15 parts
      drm/amdgpu/gmc6: fix DMA mask from 44 to 40 bits

Alex Sierra (3):
      drm/amdkfd: rm BO resv on validation to avoid deadlock
      drm/amdkfd: avoid conflicting address mappings
      amd/amdkfd: remove svms declaration to avoid werror

Alvin Lee (1):
      drm/amd/display: Update swizzle mode enums

Alyssa Rosenzweig (2):
      drm/panfrost: Use upper/lower_32_bits helpers
      drm/plane: Fix comment typo

Andi Shyti (1):
      drm/i915/gt: move remaining debugfs interfaces into gt

Andrey Grodzovsky (8):
      drm/ttm: Create pinned list
      drm/ttm: Clear all DMA mappings on demand
      drm/amd/display: Fix crash on device remove/driver unload
      drm/amdgpu: Fix crash on device remove/driver unload
      drm/amdgpu: Fix MMIO access page fault
      drm/amdgpu: Fix resume failures when device is gone
      drm/amdgpu: drm/amdgpu: Handle IOMMU enabled case
      drm/amdgpu: Add a UAPI flag for hot plug/unplug

Andy Yan (1):
      drm/rockchip: Check iommu itself instead of it's parent for
device_is_available

Animesh Manna (3):
      drm/i915/dg2: UHBR tables added for pll programming
      drm/i915/dp: fix EHL/JSL max source rates calculation
      drm/i915/dp: fix for ADL_P/S dp/edp max source rates

Ankit Nautiyal (2):
      drm/i915/display: Fix the 12 BPC bits for PIPE_MISC reg
      drm/i915/dg2: Configure PCON in DP pre-enable path

Anshuman Gupta (3):
      drm/i915: Tweaked Wa_14010685332 for all PCHs
      drm/i915/pxp: Add plane decryption support
      drm/i915/pxp: black pixels on pxp disabled

Anson Jacob (6):
      drm/amd/display: dc_assert_fp_enabled assert only if FPU is not enabl=
ed
      drm/amd/display: Fix false BAD_FREE warning from Coverity
      drm/amd/display: Fix multiple memory leaks reported by coverity
      drm/amd/display: Revert "Directly retrain link from debugfs"
      drm/amd/display: dcn20_resource_construct reduce scope of FPU enabled
      drm/amd/display: Remove unused macros

Anthoine Bourgeois (2):
      drm/virtio: implement context init: probe for feature
      drm/virtio: implement context init: support init ioctl

Anthony Koo (12):
      drm/amd/display: [FW Promotion] Release 0.0.80
      drm/amd/display: [FW Promotion] Release 0.0.81
      drm/amd/display: [FW Promotion] Release 0.0.82
      drm/amd/display: [FW Promotion] Release 0.0.83
      drm/amd/display: [FW Promotion] Release 0.0.84
      drm/amd/display: [FW Promotion] Release 0.0.85
      drm/amd/display: [FW Promotion] Release 0.0.86
      drm/amd/display: [FW Promotion] Release 0.0.87
      drm/amd/display: Change initializer to single brace
      drm/amd/display: [FW Promotion] Release 0.0.88
      drm/amd/display: [FW Promotion] Release 0.0.89
      drm/amd/display: [FW Promotion] Release 0.0.90

Anusha Srivatsa (1):
      drm/i915/dmc: Update to DMC v2.12

Aric Cyr (13):
      drm/amd/display: 3.2.150
      drm/amd/display: 3.2.151
      drm/amd/display: 3.2.152
      drm/amd/display: 3.2.153
      drm/amd/display: 3.2.154
      drm/amd/display: 3.2.155
      drm/amd/display: 3.2.156
      drm/amd/display: Validate plane rects before use
      drm/amd/display: 3.2.157
      drm/amd/display: Handle I2C-over-AUX write channel status update
      drm/amd/display: 3.2.158
      drm/amd/display: Fix 3DLUT skipped programming
      drm/amd/display: 3.2.159

Arnd Bergmann (5):
      drm/amd/display: fix empty debug macros
      drm/amdgpu: fix warning for overflow check
      gpu: amd: replace open-coded offsetof() with builtin
      drm: fb_helper: fix CONFIG_FB dependency
      drm/msm/dp: fix missing #include

Aurabindo Pillai (3):
      drm/amd/display: Add emulated sink support for updating FS
      drm/amd/display: Add flag to detect dpms force off during HPD
      drm/amd/display: fix null pointer deref when plugging in display

Ayaz A Siddiqui (6):
      drm/i915/gt: Add support of mocs propagation
      drm/i915/gt: Set CMD_CCTL to UC for Gen12 Onward
      drm/i915/gt: Set BLIT_CCTL reg to un-cached
      drm/i915/gt: Initialize unused MOCS entries with device specific valu=
es
      drm/i915/gt: Add separate MOCS table for Gen12 devices other than TGL=
/RKL
      drm/i915/gt: Add "intel_" as prefix in set_mocs_index()

Bernard (1):
      drm/msm: delete conversion from bool value to bool return

Bernard Zhao (1):
      drm/msm: fix warning "using plain integer as NULL pointer"

Bhawanpreet Lakha (3):
      drm: Remove slot checks in dp mst topology during commit
      drm: Update MST First Link Slot Information Based on Encoding Format
      drm/amd/display: Add DP 2.0 MST DM Support

Bjorn Andersson (13):
      dt-bindings: msm/dp: Change reg definition
      drm/msm/dp: Use devres for ioremap()
      drm/msm/dp: Refactor ioremap wrapper
      drm/msm/dp: Store each subblock in the io region
      drm/msm/dp: Allow sub-regions to be specified in DT
      drm/msm/dp: Use the connector passed to dp_debug_get()
      drm/msm/dp: Simplify the dp_debug debugfs show function
      drm/msm/dp: Remove global g_dp_display variable
      drm/msm/dp: Modify prototype of encoder based API
      drm/msm/dp: Allow specifying connector_type per controller
      drm/msm/dp: Allow attaching a drm_panel
      drm/msm/dp: Support up to 3 DP controllers
      dt-bindings: msm/dp: Add SC8180x compatibles

Boris Brezillon (2):
      panfrost: Don't cleanup the job if it was successfully queued
      drm/sched: Fix drm_sched_fence_free() so it can be passed an
uninitialized fence

Brian Norris (1):
      drm/rockchip: remove unused psr_list{,_lock}

Cai Huoqing (15):
      drm/bridge: cdns: Make use of the helper function
devm_platform_ioremap_resource()
      drm: adv7511: Convert to SPDX identifier
      drm/vc4: Make use of the helper function devm_platform_ioremap_resour=
ce()
      drm/sun4i: Make use of the helper function
devm_platform_ioremap_resource()
      drm/panfrost: Make use of the helper function
devm_platform_ioremap_resource()
      drm/mcde: Make use of the helper function devm_platform_ioremap_resou=
rce()
      drm/meson: Make use of the helper function
devm_platform_ioremap_resourcexxx()
      drm/sun4i: dsi: Make use of the helper function dev_err_probe()
      drm/sun4i: dw-hdmi: Make use of the helper function dev_err_probe()
      drm/v3d: Make use of the helper function
devm_platform_ioremap_resource_byname()
      drm/rockchip: Make use of the helper function
devm_platform_ioremap_resource()
      drm/i915: Use direction definition DMA_BIDIRECTIONAL instead of
PCI_DMA_BIDIRECTIONAL
      drm/bridge: dw-hdmi-cec: Make use of the helper function
devm_add_action_or_reset()
      drm/shmobile: Make use of the helper function
devm_platform_ioremap_resource()
      drm: rcar-du: Make use of the helper function
devm_platform_ioremap_resource()

Candice Li (9):
      drm/amd/amdgpu: consolidate PSP TA unload function
      drm/amd/amdgpu: add mpio to ras block
      drm/amdgpu: Create common PSP TA load function
      drm/amdgpu: Unify PSP TA context
      drm/amdgpu: Conform ASD header/loading to generic TA systems
      drm/amdgpu: Update PSP TA unload function
      drm/amdgpu: Remove all code paths under the EAGAIN path in RAS late i=
nit
      drm/amdgpu: Update PSP TA Invoke to use common TA context as input
      drm/amdgpu: Update TA version output in driver

Charan Teja Reddy (1):
      dma-buf: WARN on dmabuf release with pending attachments

Charlene Liu (1):
      drm/amd/display: Pass PCI deviceid into DC

Chi Minghao (1):
      drm/msm: remove unneeded variable

Chris Wilson (1):
      drm/i915: Free all DMC payloads

Christian K=C3=B6nig (32):
      dma-buf: nuke seqno-fence
      drm/vmwgfx: unbind in vmw_ttm_unpopulate
      drm/amdgpu: unbind in amdgpu_ttm_tt_unpopulate
      drm/nouveau: unbind in nouveau_ttm_tt_unpopulate
      drm/radeon: unbind in radeon_ttm_tt_unpopulate()
      drm/ttm: remove ttm_tt_destroy_common v2
      mm/vmscan: add sync_shrinkers function v3
      drm/ttm: optimize the pool shrinker a bit v2
      dma-buf: nuke DMA_FENCE_TRACE macros v2
      dma-buf: cleanup kerneldoc of removed component
      dma-buf: clarify dma_fence_ops->wait documentation
      dma-buf: clarify dma_fence_add_callback documentation
      drm/ttm: cleanup ttm_resource_compat
      drm/amdgpu: fix use after free during BO move
      drm/amdgpu: remove unused amdgpu_bo_validate
      drm/ttm: remove the outdated kerneldoc section
      drm/ttm: add some general module kerneldoc
      drm/ttm: add kerneldoc for enum ttm_caching
      drm/ttm: enable TTM device object kerneldoc v2
      drm/ttm: enable TTM resource object kerneldoc v2
      drm/ttm: enable TTM placement kerneldoc
      drm/ttm: enable TTM TT object kerneldoc v2
      drm/ttm: enable TTM page pool kerneldoc
      drm/msm: allow compile_test on !ARM
      dma-buf: fix and rework dma_buf_poll v7
      drm/amdgpu: revert "Add autodump debugfs node for gpu reset v8"
      drm/amdgpu: print warning and taint kernel if lockup timeout is disab=
led
      dma-buf: add dma_resv_for_each_fence_unlocked v8
      dma-buf: use new iterator in dma_resv_copy_fences
      dma-buf: use new iterator in dma_resv_get_fences v3
      dma-buf: use new iterator in dma_resv_wait_timeout
      dma-buf: use new iterator in dma_resv_test_signaled

Christophe JAILLET (2):
      drm/r128: switch from 'pci_' to 'dma_' API
      drm: Remove redundant 'flush_workqueue()' calls

Colin Ian King (9):
      drm/amd/display: fix spelling mistake "alidation" -> "validation"
      drm/amd/display: Fix unused initialization of pointer sink
      drm/amdgpu: clean up inconsistent indenting
      drm/amdgpu: sdma: clean up identation
      drm/radeon/ci_dpm: Remove redundant initialization of variables
hi_sidd, lo_sidd
      drm/i915: clean up inconsistent indenting
      drm/radeon: make array encoded_lanes static
      drm/amd/display: Remove redundant initialization of variable result
      drm/msm/dp: Remove redundant initialization of variable bpp

Dale Zhao (1):
      drm/amd/display: Refine condition of cursor visibility for pipe-split

Dan Carpenter (7):
      drm/i915/gt: Potential error pointer dereference in pinned_context()
      drm/i915/tc: Delete bogus NULL check in intel_ddi_encoder_destroy()
      drm/msm: Fix potential Oops in a6xx_gmu_rpmh_init()
      drm/msm: potential error pointer dereference in init()
      drm/msm: unlock on error in get_sched_entity()
      drm/msm: fix potential NULL dereference in cleanup
      drm/msm: uninitialized variable in msm_gem_import()

Daniel Vetter (30):
      drm/doc/rfc: drop lmem uapi section
      drm/i915: Use locked access to ctx->engines in set_priority
      drm/shmem-helper: Switch to vmf_insert_pfn
      drm/shmem-helpers: Allocate wc pages on x86
      drm/vgem: use shmem helpers
      drm/i915: Actually delete gpu reloc selftests
      drm/sched: Split drm_sched_job_init
      drm/msm: Improve drm/sched point of no return rules
      drm/sched: Barriers are needed for entity->last_scheduled
      drm/sched: Add dependency tracking
      drm/sched: drop entity parameter from drm_sched_push_job
      drm/sched: improve docs around drm_sched_entity
      drm/panfrost: use scheduler dependency tracking
      drm/lima: use scheduler dependency tracking
      drm/v3d: Move drm_sched_job_init to v3d_job_init
      drm/v3d: Use scheduler dependency handling
      drm/msm: Use scheduler dependency handling
      drm/msm: Don't break exclusive fence ordering
      dma-resv: Give the docs a do-over
      drm/i915: Release i915_gem_context from a worker
      drm/i915: Release ctx->syncobj on final put, not on ctx close
      drm/i915: Keep gem ctx->vm alive until the final put
      drm/i915: Drop code to handle set-vm races from execbuf
      drm/i915: Rename i915_gem_context_get_vm_rcu to i915_gem_context_get_=
eb_vm
      drm/i915: Use i915_gem_context_get_eb_vm in ctx_getparam
      drm/i915: Add i915_gem_context_is_full_ppgtt
      drm/i915: Use i915_gem_context_get_eb_vm in intel_context_set_gem
      drm/i915: Drop __rcu from gem_context->vm
      drm/i915: use xa_lock/unlock for fpriv->vm_xa lookups
      drm/i915: Stop rcu support for i915_address_space

Daniele Ceraolo Spurio (12):
      drm/i915/guc: drop guc_communication_enabled
      drm/i915/guc: put all guc objects in lmem when available
      drm/i915/guc: Add DG1 GuC / HuC firmware defs
      drm/i915/pxp: Define PXP component interface
      drm/i915/pxp: define PXP device flag and kconfig
      drm/i915/pxp: allocate a vcs context for pxp usage
      drm/i915/pxp: set KCR reg init
      drm/i915/pxp: interfaces for using protected objects
      drm/i915/pxp: start the arb session on demand
      drm/i915/pxp: add pxp debugfs
      drm/i915/pxp: add PXP documentation
      drm/i915/pxp: enable PXP for integrated Gen12

Darren Powell (2):
      amdgpu/pm: (v2) add limit_type to
(pptable_funcs)->set_power_limit signature
      drm/amd/pm: Fix incorrect power limit readback in smu11 if POWER_SOUR=
CE_DC

Dave Airlie (45):
      Merge tag 'drm-misc-next-2021-09-16' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-misc-next-2021-09-23' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'amd-drm-next-5.16-2021-09-27' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      drm/i915/uncore: split the fw get function into separate vfunc
      drm/i915/pm: drop get_fifo_size vfunc.
      drm/i915: make update_wm take a dev_priv.
      drm/i915/wm: provide wrappers around watermark vfuncs calls (v3)
      drm/i915: add wrappers around cdclk vtable funcs.
      drm/i915/display: add intel_fdi_link_train wrapper.
      drm/i915: split clock gating init from display vtable
      drm/i915: split watermark vfuncs from display vtable.
      drm/i915: split color functions from display vtable
      drm/i915: split audio functions from display vtable
      drm/i915: split cdclk functions from display vtable.
      drm/i915: split irq hotplug function from display vtable
      drm/i915: split fdi link training from display vtable.
      drm/i915: split the dpll clock compute out from display vtable.
      drm/i915: constify fdi link training vtable
      drm/i915: constify hotplug function vtable.
      drm/i915: constify color function vtable.
      drm/i915: constify the audio function vtable
      drm/i915: constify the dpll clock vtable
      drm/i915: constify the cdclk vtable
      drm/i915: drop unused function ptr and comments.
      drm/i915: constify display function vtable
      drm/i915: constify clock gating init vtable.
      drm/i915: constify display wm vtable
      drm/i915: fix regression with uncore refactoring.
      Merge tag 'du-next-20211007' of
git://linuxtv.org/pinchartl/media into drm-next
      Merge tag 'amd-drm-next-5.16-2021-10-08' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-2021-10-06' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-next-2021-10-04' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-intel-gt-next-2021-10-08' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      drm/i915/display: move plane prepare/cleanup to intel_atomic_plane.c
      drm/i915/display: let intel_plane_uses_fence be used from other place=
s.
      drm/i915/display: refactor out initial plane config for crtcs
      drm/i915/display: refactor initial plane config to a separate file
      drm/i915/display: move pin/unpin fb/plane code to a new file.
      Merge tag 'drm-intel-next-2021-10-15' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-intel-gt-next-2021-10-21' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'amd-drm-next-5.16-2021-10-22' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'topic/amdgpu-dp2.0-mst-2021-10-27' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      BackMerge tag 'v5.15-rc7' into drm-next
      Merge tag 'drm-msm-next-2021-10-26' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'amd-drm-next-5.16-2021-10-29' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

David Galiffi (1):
      drm/amd/display: Add debug support to override the Minimum DRAM Clock

David Heidelberg (1):
      dt-bindings: drm/msm/gpu: convert to YAML

David Stevens (1):
      drm/virtio: support mapping exported vram

Deepak R Varma (1):
      drm: msm: adreno: use DEFINE_DEBUGFS_ATTRIBUTE with
debugfs_create_file_unsafe()

Desmond Cheong Zhi Xi (1):
      drm: unexport drm_ioctl_permit

Dmitry Baryshkov (7):
      drm/msm/dpu: squash dpu_core_irq into dpu_hw_interrupts
      drm/msm/dpu: don't clear IRQ register twice
      drm/msm/dpu: merge struct dpu_irq into struct dpu_hw_intr
      drm/msm/dsi: do not enable irq handler before powering up the host
      drm/msm/dsi: use bulk clk API
      drm/msm/a6xx: correct cx_debugbus_read arguments
      drm/msm/hdmi: use bulk regulator API

Dmytro Laktyushkin (3):
      drm/amd/display: clean up dcn31 revision check
      drm/amd/display: restyle dcn31 resource header inline with other asic=
s
      drm/amd/display: allow windowed mpo + odm

Douglas Anderson (20):
      drm/panel-simple: Reorder logicpd_type_28 / mitsubishi_aa070mc01
      dt-bindings: drm/panel-simple-edp: Introduce generic eDP panels
      drm/edid: Break out reading block 0 of the EDID
      drm/edid: Allow querying/working with the panel ID from the EDID
      drm/edid: Use new encoded panel id style for quirks matching
      ARM: configs: Everyone who had PANEL_SIMPLE now gets PANEL_EDP
      arm64: defconfig: Everyone who had PANEL_SIMPLE now gets PANEL_EDP
      drm/panel-edp: Split eDP panels out of panel-simple
      drm/panel-edp: Move some wayward panels to the eDP driver
      drm/panel-simple: Non-eDP panels don't need "HPD" handling
      drm/panel-edp: Split the delay structure out
      drm/panel-edp: Better describe eDP panel delays
      drm/panel-edp: hpd_reliable shouldn't be subtraced from hpd_absent
      drm/panel-edp: Fix "prepare_to_enable" if panel doesn't handle HPD
      drm/panel-edp: Don't re-read the EDID every time we power off the pan=
el
      drm/panel-edp: Implement generic "edp-panel"s probed by EDID
      drm/edid: Fix EDID quirk compile error on older compilers
      drm/print: Add deprecation notes to DRM_...() functions
      drm/edid: Fix drm_edid_encode_panel_id() kerneldoc warning
      drm/edid: Fix crash with zero/invalid EDID

Eric Yang (3):
      drm/amd/display: Add periodic detection when zstate is enabled
      drm/amd/display: add vsync notify to dmub for abm pause
      drm/amd/display: increase Z9 latency to workaround underflow in Z9

Ernst Sj=C3=B6strand (2):
      drm/amd/amdgpu: Increase HWIP_MAX_INSTANCE to 10
      drm/amd/amdgpu: Validate ip discovery blob

Evan Quan (1):
      drm/amd/pm: fix runpm hang when amdgpu loaded prior to sound driver

F.A.Sulaiman (1):
      GPU: drm: fix style errors

Fangzhi Zuo (8):
      drm/amd/display: Add DP 2.0 Audio Package Generator
      drm/amd/display: Add DP 2.0 HPO Stream Encoder
      drm/amd/display: Add DP 2.0 HPO Link Encoder
      drm/amd/display: Add DP 2.0 DCCG
      drm/amd/display: Add DP 2.0 BIOS and DMUB Support
      drm/amd/display: Add DP 2.0 SST DC Support
      drm/dp: Add Additional DP2 Headers
      drm/amd/display: Add DP 2.0 MST DC Support

Felix Kuehling (1):
      drm/amdkfd: make needs_pcie_atomics FW-version dependent

Fernando Ramos (17):
      drm: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEG=
IN()
      drm/i915: cleanup: drm_modeset_lock_all_ctx() -->
DRM_MODESET_LOCK_ALL_BEGIN()
      drm/msm: cleanup: drm_modeset_lock_all_ctx() -->
DRM_MODESET_LOCK_ALL_BEGIN()
      drm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
      drm/vmwgfx: cleanup: drm_modeset_lock_all() -->
DRM_MODESET_LOCK_ALL_BEGIN()
      drm/tegra: cleanup: drm_modeset_lock_all() -->
DRM_MODESET_LOCK_ALL_BEGIN()
      drm/shmobile: cleanup: drm_modeset_lock_all() -->
DRM_MODESET_LOCK_ALL_BEGIN()
      drm/radeon: cleanup: drm_modeset_lock_all() -->
DRM_MODESET_LOCK_ALL_BEGIN()
      drm/omapdrm: cleanup: drm_modeset_lock_all() -->
DRM_MODESET_LOCK_ALL_BEGIN()
      drm/nouveau: cleanup: drm_modeset_lock_all() -->
DRM_MODESET_LOCK_ALL_BEGIN()
      drm/msm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEG=
IN()
      drm/i915: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BE=
GIN()
      drm/i915: cleanup: drm_modeset_lock_all() -->
DRM_MODESET_LOCK_ALL_BEGIN() part 2
      drm/gma500: cleanup: drm_modeset_lock_all() -->
DRM_MODESET_LOCK_ALL_BEGIN()
      drm/amd: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEG=
IN()
      drm: cleanup: remove drm_modeset_(un)lock_all()
      doc: drm: remove TODO entry regarding DRM_MODSET_LOCK_ALL cleanup

George Shen (5):
      drm/amd/display: Handle Y carry-over in VCP X.Y calculation
      drm/amd/display: Update VCP X.Y logging to improve usefulness
      drm/amd/display: Skip override for preferred link settings
during link training
      drm/amd/display: Implement fixed DP drive settings
      drm/amd/display: Add comment for preferred_training_settings

Guchun Chen (6):
      drm/amdgpu: move amdgpu_virt_release_full_gpu to fini_early stage
      drm/amd/display: fix error case handling
      drm/amdgpu: add HWID of SDMA instance 2 and 3
      drm/amdgpu: handle the case of pci_channel_io_frozen only in
amdgpu_pci_resume
      drm/amdgpu: use adev_to_drm for consistency when accessing drm_device
      drm/amdgpu/discovery: parse hw_id_name for SDMA instance 2 and 3

Guo Zhengkui (1):
      drm/amdgpu: remove some repeated includings

Guo, Bing (3):
      drm/amd/display: Fix issue with dynamic bpp change for DCN3x
      drm/amd/display: Get ceiling for v_total calc
      drm/amd/display: set Layout properly for 8ch audio at timing validati=
on

Gurchetan Singh (10):
      virtio-gpu api: multiple context types with explicit initialization
      drm/virtgpu api: create context init feature
      drm/virtio: implement context init: track valid capabilities in a mas=
k
      drm/virtio: implement context init: track {ring_idx,
emit_fence_info} in virtio_gpu_fence
      drm/virtio: implement context init: plumb {base_fence_ctx,
ring_idx} to virtio_gpu_fence_alloc
      drm/virtio: implement context init: stop using drv->context when
creating fence
      drm/virtio: implement context init: allocate an array of fence contex=
ts
      drm/virtio: implement context init: handle
VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK
      drm/virtio: implement context init: add virtio_gpu_fence_event
      drm/virtio: implement context init: advertise feature to userspace

Gwan-gyeong Mun (1):
      drm/i915/display/psr: Do full fetch when handling multi-planar format=
s

H. Peter Anvin (Intel) (1):
      drm/bochs: add Bochs PCI ID for Simics model

Hans de Goede (12):
      drm: panel-orientation-quirks: Update the Lenovo Ideapad D330 quirk (=
v2)
      drm: panel-orientation-quirks: Add quirk for KD Kurio Smart C15200 2-=
in-1
      drm: panel-orientation-quirks: Add quirk for the Samsung Galaxy Book =
10.6
      drm: panel-orientation-quirks: Add quirk for the Chuwi Hi10 Pro
      drm/connector: Give connector sysfs devices there own device_type
      drm/connector: Add a fwnode pointer to drm_connector and
register with ACPI (v2)
      drm/connector: Add drm_connector_find_by_fwnode() function (v3)
      drm/connector: Add support for out-of-band hotplug notification (v3)
      usb: typec: altmodes/displayport: Make dp_altmode_notify() more gener=
ic
      usb: typec: altmodes/displayport: Notify drm subsys of hotplug events
      drm/i915/dp: Add support for out-of-bound hotplug events
      drm: panel-orientation-quirks: Add quirk for the Chuwi HiBook

Hansen (3):
      drm/amd/display: Fix detection of 4 lane for DPALT
      drm/amd/display: Fix DP2 SE and LE SYMCLK selection for B0 PHY
      drm/amd/display: Set phy_mux_sel bit in dmub scratch register

Harry Wentland (8):
      drm/amd/display: Get backlight from PWM if DMCU is not initialized
      drm/amd/display: Pass display_pipe_params_st as const in DML
      drm/amd/display: Pass all structs in display_rq_dlg_helpers by pointe=
r
      drm/amd/display: Fix rest of pass-by-value structs in DML
      drm/amd/display: Allocate structs needed by
dcn_bw_calc_rq_dlg_ttu in pipe_ctx
      drm/amd/display: Reduce stack size for
dml21_ModeSupportAndSystemConfigurationFull
      drm/amd/display: Only define DP 2.0 symbols if not already defined
      MAINTAINERS: Add Siqueira for AMD DC

Hawking Zhang (1):
      drm/amdgpu: correct initial cp_hqd_quantum for gfx9

Hayden Goodfellow (1):
      drm/amd/display: Fix wrong format specifier in amdgpu_dm.c

Heikki Krogerus (1):
      drm/i915: Associate ACPI connector nodes with connector entries (v2)

Hersen Wu (1):
      drm/amd/display: dsc mst 2 4K displays go dark with 2 lane HBR3

Huang Rui (2):
      drm/ttm: fix the type mismatch error on sparc64
      drm/amdgpu: remove grbm cam index/data operations for gfx v10

Huang, Sean Z (5):
      drm/i915/pxp: Implement funcs to create the TEE channel
      drm/i915/pxp: Create the arbitrary session after boot
      drm/i915/pxp: Implement arb session teardown
      drm/i915/pxp: Implement PXP irq handler
      drm/i915/pxp: Enable PXP power management

Hugh Dickins (1):
      drm/i915: fix blank screen booting crashes

Iago Toral Quiroga (1):
      drm/v3d: fix wait for TMU write combiner flush

Ian Chen (1):
      drm/amd/display: remove force_enable_edp_fec param.

Ilya (1):
      drm/amd/display: Add PPS immediate update flag for DCN2

Imre Deak (19):
      fbdev/efifb: Release PCI device's runtime PM ref during FB destroy
      drm/i915: Use tile block based dimensions for CCS origin x, y check
      drm/i915/adlp: Require always a power-of-two sized CCS surface stride
      drm/i915/adlp: Assert that VMAs in DPT start at 0
      drm/i915: Follow a new->old platform check order in
intel_fb_stride_alignment
      drm/i915/adlp: Add support for remapping CCS FBs
      drm/i915/tc: Fix TypeC port init/resume time sanitization
      drm/i915/adlp/tc: Fix PHY connected check for Thunderbolt mode
      drm/i915/tc: Remove waiting for PHY complete during releasing ownersh=
ip
      drm/i915/tc: Check for DP-alt, legacy sinks before taking PHY ownersh=
ip
      drm/i915/tc: Add/use helpers to retrieve TypeC port properties
      drm/i915/tc: Don't keep legacy TypeC ports in connected state w/o a s=
ink
      drm/i915/tc: Add a mode for the TypeC PHY's disconnected state
      drm/i915/tc: Refactor TC-cold block/unblock helpers
      drm/i915/tc: Avoid using legacy AUX PW in TBT mode
      drm/i915/icl/tc: Remove the ICL special casing during TC-cold blockin=
g
      drm/i915/tc: Fix TypeC PHY connect/disconnect logic on ADL-P
      drm/i915/tc: Drop extra TC cold blocking from intel_tc_port_connected=
()
      drm/i915/tc: Fix system hang on ADL-P during TypeC PHY disconnect

Jaehyun Chung (3):
      drm/amd/display: Add regamma/degamma coefficients and set sRGB
when TF is BT709
      drm/amd/display: Correct degamma coefficients
      drm/amd/display: Revert adding degamma coefficients

Jake Wang (7):
      drm/amd/display: Added root clock optimization flags
      drm/amd/display: Disable dpp root clock when not being used
      drm/amd/display: Disable dsc root clock when not being used
      drm/amd/display: Disable dpstreamclk, symclk32_se, and symclk32_le
      drm/amd/display: Removed z10 save after dsc disable
      drm/amd/display: Moved dccg init to after bios golden init
      drm/amd/display: Disable hdmistream and hdmichar clocks

James Zhu (5):
      drm/amdkfd: separate kfd_iommu_resume from kfd_resume
      drm/amdgpu: add amdgpu_amdkfd_resume_iommu
      drm/amdgpu: move iommu_resume before ip init/resume
      drm/amdgpu/jpeg2: move jpeg2 shared macro to header file
      drm/amdgpu/jpeg: add jpeg2.6 start/end

Jani Nikula (91):
      drm/i915/edp: fix eDP MSO pipe sanity checks for ADL-P
      drm/i915/mst: use intel_de_rmw() to simplify VC payload alloc set/cle=
ar
      drm/i915/dp: pass crtc_state to intel_ddi_dp_level()
      drm/i915/dg2: use existing mechanisms for SNPS PHY translations
      drm/i915/dg2: add SNPS PHY translations for UHBR link rates
      Merge drm/drm-next into drm-intel-next
      drm/i915/dp: remove superfluous EXPORT_SYMBOL()
      drm/i915/irq: reduce inlines to reduce header dependencies
      drm/i915: intel_runtime_pm.h does not actually need intel_display.h
      drm/i915/pm: use forward declaration to remove an include
      drm/i915/panel: move intel_panel_use_ssc() out of headers
      drm/i915/fdi: move intel_fdi_link_freq() to intel_fdi.[ch]
      drm/i915/dp: use actual link rate values in struct link_config_limits
      drm/i915/dp: read sink UHBR rates
      drm/i915/dg2: add TRANS_DP2_CTL register definition
      drm/i915/dg2: add TRANS_DP2_VFREQHIGH and TRANS_DP2_VFREQLOW
      drm/i915/dg2: add DG2 UHBR source rates
      drm/i915/dp: add max data rate calculation for UHBR rates
      drm/i915/fdi: make intel_fdi_link_freq() return int
      drm/i915/display: split out dpt out of intel_display.c
      drm/i915: add HAS_ASYNC_FLIPS feature macro
      drm/i915/fb: move intel_tile_width_bytes() to intel_fb.c
      drm/i915/fb: move intel_fb_align_height() to intel_fb.c
      drm/i915/fb: move intel_surf_alignment() to intel_fb.c
      drm/i915/fb: move user framebuffer stuff to intel_fb.c
      drm/i915/backlight: extract backlight code to a separate file
      drm/i915/backlight: mass rename functions to have intel_backlight_ pr=
efix
      drm/i915/panel: mass rename functions to have intel_panel_ prefix
      drm/i915/pci: rename functions to have i915_pci prefix
      drm/i915/snps: constify struct intel_mpllb_state arrays harder
      drm/i915/fdi: move intel_update_fdi_pll_freq to intel_fdi.c
      drm/i915/fdi: move fdi bc bifurcation functions to intel_fdi.c
      drm/i915/fdi: move more FDI stuff to FDI link train hooks
      drm/i915/fdi: move fdi mphy reset and programming to intel_fdi.c
      drm/i915/fdi: convert BUG()'s to MISSING_CASE()
      drm/i915: remove unused i915->active_pipes
      drm/i915/dp: fix DG2 max source rate check
      drm/i915/debugfs: clean up LPSP status
      drm/i915/debugfs: clean up LPSP capable
      drm/i915/dp: fix TGL and ICL max source rates
      drm/i915/dp: fix DG1 and RKL max source rates
      drm/i915/bios: use hdmi level shift directly from child data
      drm/i915/bios: use max tmds clock directly from child data
      drm/i915/bios: use dp max link rate directly from child data
      drm/i915/bios: use alternate aux channel directly from child data
      drm/i915/bios: move ddc pin mapping code next to ddc pin sanitize
      drm/i915/bios: use ddc pin directly from child data
      drm/i915/bios: get rid of vbt ddi_port_info
      drm/displayid: re-align data block macros
      drm/displayid: add DisplayID v2.0 data blocks and primary use cases
      drm/edid: abstract OUI conversion to 24-bit int
      drm/edid: parse the DisplayID v2.0 VESA vendor block for MSO
      drm/i915/edp: postpone MSO init until after EDID read
      drm/i915/edp: use MSO pixel overlap from DisplayID data
      drm/dp: add DP 2.0 UHBR link rate and bw code conversions
      drm/dp: use more of the extended receiver cap
      drm/dp: add LTTPR DP 2.0 DPCD addresses
      drm/dp: add helper for extracting adjust 128b/132b TX FFE preset
      drm/i915/dg2: add DG2+ TRANS_DDI_FUNC_CTL DP 2.0 128b/132b mode
      drm/i915/dp: add helper for checking for UHBR link rate
      drm/i915/dp: use 128b/132b TPS2 for UHBR+ link rates
      drm/i915/dp: select 128b/132b channel encoding for UHBR rates
      drm/i915/dg2: configure TRANS_DP2_CTL for DP 2.0
      drm/i915/dp: add HAS_DP20 macro
      drm/i915/dg2: use 128b/132b transcoder DDI mode
      drm/i915/dg2: configure TRANS_DP2_VFREQ{HIGH,LOW} for 128b/132b
      drm/i915/fdi: move fdi modeset asserts to intel_fdi.c
      drm/i915/pps: move pps (panel) modeset asserts to intel_pps.c
      drm/i915/dpll: move dpll modeset asserts to intel_dpll.c
      drm/i915/dsi: move dsi pll modeset asserts to vlv_dsi_pll.c
      drm/i915/dsi: pass struct mipi_dsi_packet pointer, not the entire str=
uct
      drm/i915/dsi: fuse dsi_send_pkt_payld() and add_payld_to_queue()
      drm/i915/dsi: return -EBUSY instead of -1
      drm/i915/hdmi: return -EINVAL instead of -1
      drm/i915/drv: return -EIO instead of -1
      drm/i915/dram: return -EINVAL instead of -1
      drm/i915/fdi: use -EAGAIN instead of local special return value
      drm/i915/hdmi: convert intel_hdmi_to_dev to intel_hdmi_to_i915
      drm/i915/debugfs: register LPSP capability on all platforms
      drm/i915/display: stop returning errors from debugfs registration
      drm/i915/debugfs: pass intel_connector to intel_connector_debugfs_add=
()
      drm/i915/reg: add AUD_TCA_DP_2DOT0_CTRL registers
      drm/i915/dg2: fix snps buf trans for uhbr
      drm/i915/dp: take LTTPR into account in 128b/132b rates
      drm/i915/mst: abstract intel_dp_mst_source_support()
      drm/i915/dp: abstract intel_dp_lane_max_vswing_reached()
      drm/i915/dg2: update link training for 128b/132b
      drm/i915: split out vlv sideband to a separate file
      drm/i915/bios: gracefully disable dual eDP for now
      drm/i915: split out intel_pcode.[ch] to separate file
      drm/i915: rename intel_sideband.[ch] to intel_sbi.[ch]

Janusz Krzysztofik (2):
      drm/i915: Mark GPU wedging on driver unregister unrecoverable
      drm/i915: Flush buffer pools on driver remove

Javier Martinez Canillas (1):
      drm: Remove unused code to load the non-existing fbcon.ko

Jernej Skrabec (1):
      drm/sun4i: Fix macros in sun8i_csc.h

Jessica Zhang (3):
      drm/msm/dpu: Add CRC support for DPU
      drm/msm: Fix potential NULL dereference in DPU SSPP
      drm/msm/dsi: fix wrong type in msm_dsi_host

Jiapeng Chong (3):
      panfrost: make mediatek_mt8183_supplies and
mediatek_mt8183_pm_domains static
      drm/rockchip: dsi: Fix duplicate included linux/phy/phy.h
      drm/rockchip: dsi: make hstt_table static

Jimmy Kizito (24):
      drm/amd/display: Fix dynamic link encoder access.
      drm/amd/display: Fix link training fallback logic
      drm/amd/display: Fix concurrent dynamic encoder assignment
      drm/amd/display: Fix dynamic encoder reassignment
      drm/amd/display: Fix null pointer dereference for encoders
      drm/amd/display: Fix MST link encoder availability check.
      drm/amd/display: Fix concurrent dynamic encoder assignment.
      drm/amd/display: Update link encoder object creation.
      drm/amd/display: Set DPIA link endpoint type
      drm/amd/display: Stub out DPIA link training call
      drm/amd/display: Add stub to get DPIA tunneling device data
      drm/amd/display: Skip DPCD read for DPTX-to-DPIA hop
      drm/amd/display: Train DPIA links with fallback
      drm/amd/display: Implement DPIA training loop
      drm/amd/display: Implement DPIA link configuration
      drm/amd/display: Implement DPIA clock recovery phase
      drm/amd/display: Implement DPIA equalisation phase
      drm/amd/display: Implement end of training for hop in DPIA display pa=
th
      drm/amd/display: Read USB4 DP tunneling data from DPCD.
      drm/amd/display: Fix DIG_HPD_SELECT for USB4 display endpoints.
      drm/amd/display: Add debug flags for USB4 DP link training.
      drm/amd/display: Clear encoder assignment for copied streams
      drm/amd/display: Do not skip link training on DP quick hot plug
      drm/amd/display: Add workaround flag for EDID read on certain docks

Jingwen Chen (1):
      drm/amd/amdgpu: add dummy_page_addr to sriov msg

John Clements (6):
      drm/amdgpu: Update RAS status print
      drm/amdgpu: Update RAS trigger error block support
      drm/amdgpu: Resolve nBIF RAS error harvesting bug
      drm/amdgpu: Updated RAS infrastructure
      drm/amdgpu: Consolidate RAS cmd warning messages
      drm/amdgpu: resolve RAS query bug

John Stultz (1):
      dma-buf: system_heap: Avoid warning on mid-order allocations

Jonathan Kim (1):
      drm/amdkfd: map gpu hive id to xgmi connected cpu

Joonas Lahtinen (2):
      Merge drm/drm-next into drm-intel-gt-next
      Merge remote-tracking branch 'tip/locking/wwmutex' into drm-intel-gt-=
next

Joshua Ashton (3):
      drm/amd/display: Use dcc_ind_blk value to set register directly
      drm/amd/display: Handle GFX10_RBPLUS modifiers for dcc_ind_blk
      drm/amd/display: Add modifiers capable of DCC image stores for gfx10_=
3

Josip Pavic (4):
      drm/amd/display: add missing ABM register offsets
      drm/amd/display: unblock abm when odm is enabled only on configs
that support it
      drm/amd/display: initialize backlight_ramping_override to false
      drm/amd/display: do not compare integers of different widths

Jos=C3=A9 Roberto de Souza (25):
      drm/i915/display: Fix sel fetch plane offset calculation
      drm/i915: Nuke ORIGIN_GTT
      drm/i915/display: Drop PSR support from HSW and BDW
      drm/i915/display: Move DRRS code its own file
      drm/i915/display: Renaming DRRS functions to intel_drrs_*()
      drm/i915/display: Some code improvements and code style fixes for DRR=
S
      drm/i915/display: Share code between intel_drrs_flush and
intel_drrs_invalidate
      drm/i915/display: Prepare DRRS for frontbuffer rendering drop
      drm/i915/dg1: Add new PCI id
      drm/i915/display/adlp: Fix PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR calcul=
ation
      drm/i915/display: Wait at least 2 frames before selective update
      drm/i915/display: Workaround cursor left overs with PSR2
selective fetch enabled
      drm/i915/display/psr: Use drm damage helpers to calculate plane
damaged area
      drm/i915/display/adlp: Add new PSR2 workarounds
      drm/i915/display/dmc: Set DC_STATE_DEBUG_MASK_CORES after firmware lo=
ad
      drm/i915/display: Match PSR2 selective fetch sequences with specifica=
tion
      drm/i915/display: Only keep PSR enabled if there is active planes
      drm/i915/display/psr: Handle plane and pipe restrictions at
every page flip
      drm/i915/display: Drop unnecessary frontbuffer flushes
      drm/i915/display: Handle frontbuffer rendering when PSR2
selective fetch is enabled
      drm/i915/display: Fix glitches when moving cursor with PSR2
selective fetch enabled
      drm/i915/display/adlp: Optimize PSR2 power-savings in corner cases
      drm/i915/display/adlp: Allow PSR2 to be enabled
      drm/i915/display: Enable PSR2 selective fetch by default
      drm/i915: Remove memory frequency calculation

Jude Shih (7):
      drm/amd/display: Support for DMUB HPD interrupt handling
      drm/amd/display: Support for SET_CONFIG processing with DMUB
      drm/amd/display: Deadlock/HPD Status/Crash Bug Fix
      drm/amd/display: Fix USB4 Aux via DMUB terminate unexpectedly
      drm/amd/display: USB4 bring up set correct address
      drm/amd/display: Fix USB4 hot plug crash issue
      drm/amd/display: Enable dpia in dmub only for DCN31 B0

Juston Li (3):
      drm/i915/hdcp: update cp_irq_count_cached in intel_dp_hdcp2_read_msg(=
)
      drm/i915/hdcp: read RxInfo once when reading
RepeaterAuth_Send_ReceiverID_List
      drm/i915/hdcp: reuse rx_info for mst stream type1 capability check

Kai-Heng Feng (2):
      drm/i915/dp: Use max params for panels < eDP 1.4
      drm/i915/audio: Use BIOS provided value for RKL HDA link

Kees Cook (1):
      drm/i915: Use designated initializers for init/exit table

Kenneth Feng (1):
      drm/amd/pm: fix the issue of uploading powerplay table

Kent Russell (3):
      drm/amdgpu: Clarify error when hitting bad page threshold
      drm/amdgpu: Warn when bad pages approaches 90% threshold
      drm/amdgpu: Add kernel parameter support for ignoring bad page thresh=
old

Kieran Bingham (6):
      dt-bindings: display: renesas,du: Provide bindings for r8a779a0
      drm: rcar-du: Sort the DU outputs
      drm: rcar-du: Only initialise TVM_TVSYNC mode when supported
      drm: rcar-du: Fix DIDSR field name
      drm: rcar-du: Split CRTC IRQ and Clock features
      drm: rcar-du: Add r8a779a0 device support

Krishna Manikandan (1):
      dt-bindings: msm: add DT bindings for sc7280

Krzysztof Kozlowski (1):
      dt-bindings: panel: ili9341: correct indentation

Lai, Derek (2):
      drm/amd/display: Added power down on boot for DCN3
      drm/amd/display: Removed power down on boot from DCN31

Lang Yu (13):
      drm/amdgpu: fix sysfs_emit/sysfs_emit_at warnings(v2)
      drm/amdgpu: update SMU PPSMC for cyan skilfish
      drm/amdgpu: update SMU driver interface for cyan skilfish(v3)
      drm/amdgpu: add some pptable funcs for cyan skilfish(v3)
      drm/amdgpu: add manual sclk/vddc setting support for cyan skilfish(v3=
)
      drm/amdkfd: fix a potential ttm->sg memory leak
      drm/amdgpu: query default sclk from smu for cyan_skillfish
      drm/amdgpu: enable display for cyan skillfish
      drm/amdkfd: Fix an inappropriate error handling in allloc memory of g=
pu
      drm/amdkfd: Separate pinned BOs destruction from general routine
      drm/amdgpu: fix a potential memory leak in amdgpu_device_fini_sw()
      drm/amdkfd: Add an optional argument into update queue operation(v2)
      drm/amdkfd: Remove cu mask from struct queue_properties(v2)

Laurent Pinchart (10):
      drm: rcar-du: Don't create encoder for unconnected LVDS outputs
      drm: rcar-du: Improve kernel log messages when initializing encoders
      drm: rcar-du: Set the DMA coherent mask for the DU device
      drm: rcar-du: Allow importing non-contiguous dma-buf with VSP
      drm: property: Replace strncpy() with strscpy_pad()
      drm/omap: Use correct printk format specifiers for size_t
      drm/omap: Cast pointer to integer without generating warning
      drm/omap: Depend on CONFIG_OF
      drm/sti: Use correct printk format specifiers for size_t
      drm: Add R10 and R12 FourCC

Lee Shawn C (6):
      drm/i915/dp: return proper DPRX link training result
      drm/i915/dsi: wait for header and payload credit available
      drm/i915/dsi: refine send MIPI DCS command sequence
      drm/i915: Get proper min cdclk if vDSC enabled
      drm/i915/dsi: Retrieve max brightness level from VBT
      drm/i915/dsi: Read/write proper brightness value via MIPI DCS command

Len Baker (1):
      drm/radeon: Prefer kcalloc over open coded arithmetic

Leo (Hanghong) Ma (4):
      drm/amd/display: Add DPCD writes at key points
      drm/amd/display: Fix system hang at boot
      drm/amd/display: Add helper for blanking all dp displays
      drm/amd/display: Fix error in dmesg at boot

Leslie Shi (1):
      drm/amdgpu: fix gart.bo pin_count leak

Lewis Huang (1):
      drm/amd/display: Align bw context with hw config when system resume

Lijo Lazar (3):
      drm/amd/pm: Update intermediate power state for SI
      drm/amdgpu: During s0ix don't wait to signal GFXOFF
      drm/amd/pm: Disable fan control if not supported

Likun Gao (1):
      drm/amdgpu: refactor function to init no-psp fw

Liu, Zhan (3):
      drm/amd/display: Fix DCN3 B0 DP Alt Mapping
      drm/amd/display: Fix B0 USB-C DP Alt mode
      drm/amd/display: DIG mapping change is causing a blocker

Lucas De Marchi (11):
      drm/i915/xehpsdv: factor out function to read RP_STATE_CAP
      drm/i915/dg1: remove __maybe_unused leftover
      drm/i915/xehpsdv: Define MOCS table for XeHP SDV
      drm/i915: rename debugfs_gt files
      drm/i915: rename debugfs_engines files
      drm/i915: rename debugfs_gt_pm files
      drm/i915: deduplicate frequency dump on debugfs
      drm/i915: remove IS_ACTIVE
      drm/i915/gt: include tsc.h where used
      drm/i915/gt: add asm/cacheflush.h for use of clflush()
      drm/i915/display: remove unused intel-mid.h include

Lukas Bulwahn (5):
      drm: rockchip: remove reference to non-existing config DRM_RGB
      drm: v3d: correct reference to config ARCH_BRCMSTB
      drm: zte: remove obsolete DRM Support for ZTE SoCs
      drm: omap: remove obsolete selection of OMAP2_DSS in config DRM_OMAP
      MAINTAINERS: fix typo in DRM DRIVER FOR SAMSUNG S6D27A1 PANELS

Lukasz Majczak (1):
      drm/i915/bdb: Fix version check

Lv Ruyi (1):
      drm/amd/display: remove duplicate include in dcn201_clk_mgr.c

Maarten Lankhorst (5):
      drm/i915: Add pci ids and uapi for DG1
      drm/i915: Add mmap lock around vma_lookup() in the mman selftest.
      drm/i915: Move __i915_gem_free_object to ttm_bo_destroy
      drm/i915: Fix runtime pm handling in i915_gem_shrink
      drm/i915: Add ww context to intel_dpt_pin, v2.

Marek Ol=C5=A1=C3=A1k (1):
      drm/amd/display: fix DCC settings for DCN3

Marijn Suijten (1):
      drm/msm/dsi: Use division result from div_u64_rem in 7nm and 14nm PLL

Mark Yacoub (1):
      drm/msm: Change dpu_crtc_get_vblank_counter to use vsync count.

Markuss Broks (2):
      drm/panel: Add DT bindings for Samsung S6D27A1 display panel
      drm/panel: s6d27a1: Add driver for Samsung S6D27A1 display panel

Martin Leung (1):
      drm/amd/display: Manually adjust strobe for DCN303

Matt Atwood (1):
      drm/i915/dp: Fix eDP max rate for display 11+

Matt Roper (26):
      drm/i915: correct name of GT forcewake domain in error messages
      drm/i915: Re-use gen11 forcewake read functions on gen12
      drm/i915: Make shadow tables range-based
      drm/i915/gen11: Update shadowed register table
      drm/i915/gen12: Update shadowed register table
      drm/i915/xehp: Xe_HP shadowed registers are a strict superset of gen1=
2
      drm/i915/xehp: Loop over all gslices for INSTDONE processing
      drm/i915/dg2: Report INSTDONE_GEOM values in error state
      drm/i915: Only access SFC_DONE when media domain is not fused off
      drm/i915/xehpsdv: Read correct RP_STATE_CAP register
      drm/i915/adl_p: Also disable underrun recovery with MSO
      drm/i915/dg2: Maintain backward-compatible nested batch behavior
      drm/i915/dg2: Memory latency values from pcode must be doubled
      drm/i915: Ensure wa_init_finish() is called for ctx workaround list
      drm/i915/dg2: Define MOCS table for DG2
      drm/i915/xehp: Check new fuse bits for SFC availability
      drm/i915: Check SFC fusing before recording/dumping SFC_DONE
      drm/i915/uncore: Convert gen6/gen7 read operations to fwtable
      drm/i915/uncore: Associate shadow table with uncore
      drm/i915/uncore: Replace gen8 write functions with general fwtable
      drm/i915/uncore: Drop gen11/gen12 mmio write handlers
      drm/i915/uncore: Drop gen11 mmio read handlers
      drm/i915/dg2: Add DG2-specific shadow register table
      drm/i915/uncore: fwtable read handlers are now used on all
forcewake platforms
      drm/i915: Stop using I915_TILING_* in client blit selftest
      drm/i915/uapi: Add comment clarifying purpose of I915_TILING_* values

Matthew Auld (23):
      drm/i915/buddy: add some pretty printing
      drm/i915/debugfs: hook up ttm_resource_manager_debug
      drm/i915/gtt: add some flushing for the 64K GTT path
      drm/i915/selftests: fixup igt_shrink_thp
      drm/i915/request: fix early tracepoints
      drm/i915/selftests: exercise shmem_writeback with THP
      drm/i915: remember to call i915_sw_fence_fini
      drm/ttm: stop calling tt_swapin in vm_access
      drm/ttm: stop setting page->index for the ttm_tt
      drm/ttm: move ttm_tt_{add, clear}_mapping into amdgpu
      drm/ttm: remove TTM_PAGE_FLAG_NO_RETRY
      drm/ttm: s/FLAG_SG/FLAG_EXTERNAL/
      drm/ttm: add some kernel-doc for TTM_TT_FLAG_*
      drm/ttm: add TTM_TT_FLAG_EXTERNAL_MAPPABLE
      drm/i915: mark dmabuf objects as ALLOC_USER
      drm/i915: mark userptr objects as ALLOC_USER
      drm/i915: extract bypass-llc check into helper
      drm/i915/dmabuf: add paranoid flush-on-acquire
      drm/i915/userptr: add paranoid flush-on-acquire
      drm/i915/shmem: ensure flush during swap-in on non-LLC
      drm/i915: expand on the kernel-doc for cache_dirty
      drm/i915: mark up internal objects with start_cpu_write
      drm/i915/selftests: mark up hugepages object with start_cpu_write

Matthew Brost (53):
      drm/i915: Disable bonding on gen12+ platforms
      drm/i915: Fix syncmap memory leak
      drm/i915/selftests: Increase timeout in i915_gem_contexts selftests
      drm/i915/guc: Fix blocked context accounting
      drm/i915/guc: Fix outstanding G2H accounting
      drm/i915/guc: Unwind context requests in reverse order
      drm/i915/guc: Don't drop ce->guc_active.lock when unwinding context
      drm/i915/guc: Process all G2H message at once in work queue
      drm/i915/guc: Workaround reset G2H is received after schedule done G2=
H
      Revert "drm/i915/gt: Propagate change in error status to
children on unhold"
      drm/i915/guc: Kick tasklet after queuing a request
      drm/i915/guc: Don't enable scheduling on a banned context,
guc_id invalid, not registered
      drm/i915/guc: Copy whole golden context, set engine state size of sub=
set
      drm/i915/selftests: Add initial GuC selftest for scrubbing lost G2H
      drm/i915/guc: Take context ref when cancelling request
      drm/i915/guc: Don't touch guc_state.sched_state without a lock
      drm/i915/guc: Reset LRC descriptor if register returns -ENODEV
      drm/i915/guc: Release submit fence from an irq_work
      drm/i915/guc: Move guc_blocked fence to struct guc_state
      drm/i915/guc: Rework and simplify locking
      drm/i915/guc: Proper xarray usage for contexts_lookup
      drm/i915/guc: Drop pin count check trick between sched_disable and re=
-pin
      drm/i915/guc: Move GuC priority fields in context under guc_active
      drm/i915/guc: Move fields protected by guc->contexts_lock into
sub structure
      drm/i915/guc: Drop guc_active move everything into guc_state
      drm/i915/guc: Add GuC kernel doc
      drm/i915/guc: Enable GuC submission by default on DG1
      drm/i915: Take pinning into account in __i915_gem_object_is_lmem
      drm/i915: Fix bug in user proto-context creation that leaked contexts
      drm/i915/guc: Move GuC guc_id allocation under submission state sub-s=
truct
      drm/i915/guc: Take GT PM ref when deregistering context
      drm/i915/guc: Take engine PM when a context is pinned with GuC submis=
sion
      drm/i915/guc: Don't call switch_to_kernel_context with GuC submission
      drm/i915: Add logical engine mapping
      drm/i915: Expose logical engine instance to user
      drm/i915/guc: Introduce context parent-child relationship
      drm/i915/guc: Add multi-lrc context registration
      drm/i915/guc: Ensure GuC schedule operations do not operate on
child contexts
      drm/i915/guc: Assign contexts in parent-child relationship
consecutive guc_ids
      drm/i915/guc: Implement parallel context pin / unpin functions
      drm/i915/guc: Implement multi-lrc submission
      drm/i915/guc: Insert submit fences between requests in
parent-child relationship
      drm/i915/guc: Implement multi-lrc reset
      drm/i915/guc: Update debugfs for GuC multi-lrc
      drm/i915/guc: Connect UAPI to GuC multi-lrc interface
      drm/i915/doc: Update parallel submit doc to point to i915_drm.h
      drm/i915/guc: Add basic GuC multi-lrc selftest
      drm/i915/guc: Implement no mid batch preemption for multi-lrc
      drm/i915: Multi-BB execbuf
      drm/i915/guc: Handle errors in multi-lrc requests
      drm/i915: Make request conflict tracking understand parallel submits
      drm/i915: Update I915_GEM_BUSY IOCTL to understand composite fences
      drm/i915: Enable multi-bb execbuf

Maxime Ripard (14):
      Merge tag 'drm-misc-intel-oob-hotplug-v1' of
git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux into
drm-misc-next
      Merge drm/drm-next into drm-misc-next
      drm/bridge: Add a function to abstract away panels
      drm/vc4: dpi: Switch to devm_drm_of_get_bridge
      drm/vc4: dsi: Switch to devm_drm_of_get_bridge
      drm/bridge: Move devm_drm_of_get_bridge to bridge/panel.c
      drm/bridge: Add documentation sections
      drm/bridge: Document the probe issue with MIPI-DSI bridges
      drm/mipi-dsi: Create devm device registration
      drm/mipi-dsi: Create devm device attachment
      drm/probe-helper: Document drm_helper_hpd_irq_event() return value
      drm/probe-helper: Create a HPD IRQ event helper for a single connecto=
r
      drm/vc4: hdmi: Actually check for the connector status in hotplug
      drm/bridge: Add stubs for devm_drm_of_get_bridge when OF is disabled

Meenakshikumar Somasundaram (12):
      drm/amd/display: Fix for null pointer access for ddc pin and aux engi=
ne.
      drm/amd/display: Link training retry fix for abort case
      drm/amd/display: Creating a fw boot options bit for an upcoming featu=
re
      drm/amd/display: Fix for link encoder access for MST.
      drm/amd/display: USB4 DPIA enumeration and AUX Tunneling
      drm/amd/display: Support for DMUB HPD and HPD RX interrupt handling
      drm/amd/display: Support for SET_CONFIG processing with DMUB
      drm/amd/display: Add dpia debug options
      drm/amd/display: Fix for access for ddc pin and aux engine.
      drm/amd/display: FEC configuration for dpia links
      drm/amd/display: FEC configuration for dpia links in MST mode
      drm/amd/display: MST support for DPIA

Melissa Wen (5):
      drm/v3d: fix sched job resources cleanup when a job is aborted
      drm/v3d: decouple adding job dependencies steps from job init
      drm/v3d: alloc and init job in one shot
      drm/v3d: add generic ioctl extension
      drm/v3d: add multiple syncobjs support

Michael Strauss (10):
      drm/amd/display: Set min dcfclk if pipe count is 0
      drm/amd/display: Add VPG and AFMT low power support for DCN3.1
      drm/amd/display: Enable mem low power control for DCN3.1 sub-IP block=
s
      drm/amd/display: Disable mem low power for CM HW block on DCN3.1
      drm/amd/display: Don't enable AFMT for DP audio stream
      drm/amd/display: Defer LUT memory powerdown until LUT bypass latches
      drm/amd/display: Clean Up VPG Low Mem Power
      drm/amd/display: Set i2c memory to light sleep during hw init
      drm/amd/display: Defer GAMCOR and DSCL power down sequence to vupdate
      drm/amd/display: Fallback to clocks which meet requested voltage on D=
CN31

Michal Wajdeczko (5):
      drm/i915: Use fixed offset for PTEs location
      drm/i915/guc: Verify result from CTB (de)register action
      drm/i915/guc: Print error name on CTB (de)registration failure
      drm/i915/guc: Print error name on CTB send failure
      drm/i915/guc: Move and improve error message for missed CTB reply

Michel D=C3=A4nzer (1):
      drm/amdgpu: Drop inline from amdgpu_ras_eeprom_max_record_count

Mikita Lipski (1):
      drm/amd/display: Add missing PSR state

Monk Liu (1):
      drm/sched: fix the bug of time out calculation(v4)

Mukul Joshi (4):
      x86/MCE/AMD: Export smca_get_bank_type symbol
      drm/amdgpu: Register MCE notifier for Aldebaran RAS
      drm/amdgpu: Enable RAS error injection after mode2 reset on Aldebaran
      drm/amdgpu: Fix RAS page retirement with mode2 reset on Aldebaran

Nathan Chancellor (6):
      drm/i915/selftest: Fix use of err in igt_reset_{fail, nop}_engine()
      drm/i915/selftests: Do not use import_obj uninitialized
      drm/i915/selftests: Always initialize err in
igt_dmabuf_import_same_driver_lmem()
      drm/i915: Enable -Wsometimes-uninitialized
      drm/i915: Clean up disabled warnings
      drm/msm/dpu: Remove commit and its uses in dpu_crtc_set_crc_source()

Nevenko Stupar (1):
      drm/amd/display: Add bios parser support for latest firmware_info

Nicholas Kazlauskas (8):
      drm/amd/display: Add NULL checks for vblank workqueue
      drm/amd/display: Optimize bandwidth on following fast update
      drm/amd/display: Fix white screen page fault for gpuvm
      drm/amd/display: Enable PSR by default on newer DCN
      drm/amd/display: Fix surface optimization regression on Carrizo
      drm/amd/display: Fix prefetch bandwidth calculation for DCN3.1
      drm/amd/display: Require immediate flip support for DCN3.1 planes
      drm/amd/display: Fix deadlock when falling back to v2 from v3

Nikola Cornij (4):
      drm/amd/display: Use adjusted DCN301 watermarks
      drm/amd/display: Limit display scaling to up to 4k for DCN 3.1
      drm/amd/display: Limit display scaling to up to true 4k for DCN 3.1
      drm/amd/display: Increase watermark latencies for DCN3.1

Nirmoy Das (7):
      drm/amdgpu: rework context priority handling
      drm/amdgpu: detach ring priority from gfx priority
      drm/amdgpu: use IS_ERR for debugfs APIs
      drm/amdgpu: cleanup debugfs for amdgpu rings
      drm/radeon: pass drm dev radeon_agp_head_init directly
      drm/amdgpu: return early if debugfs is not initialized
      drm/amdgpu: unify BO evicting method in amdgpu_ttm

Noralf Tr=C3=B8nnes (6):
      drm/fourcc: Add R8 to drm_format_info
      drm/format-helper: Add drm_fb_xrgb8888_to_rgb332()
      drm/format-helper: Add drm_fb_xrgb8888_to_rgb888()
      drm/gud: Add GUD_PIXEL_FORMAT_R8
      drm/gud: Add GUD_PIXEL_FORMAT_RGB332
      drm/gud: Add GUD_PIXEL_FORMAT_RGB888

Oliver Logush (1):
      drm/amd/display: Add an extra check for dcn10 OPTC data format

Patrik Jakobsson (1):
      drm/amdgpu: Fix even more out of bound writes from debugfs

Paul Cercueil (2):
      drm/bridge: it66121: Initialize {device,vendor}_ids
      drm/bridge: it66121: Wait for next bridge to be probed

Paul Menzel (1):
      drm/amdgpu: Demote TMZ unsupported log message from warning to info

Philip Chen (3):
      drm/bridge: parade-ps8640: Reorg the macros
      drm/bridge: parade-ps8640: Use regmap APIs
      drm/bridge: parade-ps8640: Add support for AUX channel

Philip Yang (10):
      drm/amdkfd: SVM map to gpus check vma boundary
      drm/amdkfd: fix dma mapping leaking warning
      drm/amdkfd: handle svm migrate init error
      drm/amdkfd: fix svm_migrate_fini warning
      drm/amdkfd: ratelimited svm debug messages
      drm/amdkfd: handle svm partial migration cpages 0
      drm/amdkfd: unregistered svm range not overlap with TTM range
      drm/amdkfd: clarify the origin of cpages returned by migration functi=
ons
      drm/amdkfd: debug message to count successfully migrated pages
      drm/amdkfd: restore userptr ignore bad address error

Praful Swarnakar (1):
      drm/amd/display: Fix Display Flicker on embedded panels

Prike Liang (1):
      drm/amdgpu: force exit gfxoff on sdma resume for rmb s0ix

Qing Wang (1):
      drm/amdgpu: replace snprintf in show functions with sysfs_emit

Qingqing Zhuo (8):
      drm/amd/display: Revert "dc: w/a for hard hang on HPD on native DP"
      drm/amd/display: Apply w/a for hard hang on HPD
      drm/amd/display: Fix unstable HPCP compliance on Chrome Barcelo
      drm/amd/display: Extend w/a for hard hang on HPD to dcn20
      drm/amd/display: Replace referral of dal with dc
      drm/amd/display: Re-arrange FPU code structure for dcn2x
      drm/amd/display: move FPU associated DSC code to DML folder
      drm/amd/display: move FPU associated DCN301 code to DML folder

Radhakrishna Sripada (1):
      drm/i915: Update memory bandwidth parameters

Ran Jianping (1):
      drm/i915/selftests: remove duplicate include in mock_region.c

Raphael GALLAIS-POU - foss (1):
      drm/panel: otm8009a: add a 60 fps mode

Raphael Gallais-Pou (2):
      drm/stm: ltdc: attach immutable zpos property to planes
      drm/stm: ltdc: add layer alpha support

Rikard Falkeborn (1):
      drm: msm: hdmi: Constify static structs

Rob Clark (7):
      drm/bridge: ti-sn65dsi86: Implement bridge->mode_valid()
      drm/msm/dsi: Support NO_CONNECTOR bridges
      drm/msm/dpu: Remove some nonsense
      drm/msm: Add hrtimer + kthread_work helper
      drm/msm/devfreq: Add 1ms delay before clamping freq
      drm/msm/dpu: Remove impossible NULL check
      drm/msm/dpu: Remove dynamic allocation from atomic context

Robert Foss (2):
      drm/bridge: anx7625: Propagate errors from sp_tx_rst_aux()
      drm/bridge: anx7625: Propagate errors from sp_tx_edid_read()

Robin Chen (1):
      drm/amd/display: dc_link_set_psr_allow_active refactoring

Rodrigo Vivi (4):
      Merge tag 'drm-misc-intel-oob-hotplug-v1' of
git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux into
drm-intel-next
      Merge drm/drm-next into drm-intel-next
      Merge drm/drm-next into drm-intel-next
      drm/i915: Clean up PXP Kconfig info.

Roman Li (3):
      drm/amd/display: Use max target bpp override option
      drm/amd/display: Limit max DSC target bpp for specific monitors
      drm/amd/display: Fully switch to dmub for all dcn21 asics

Roy Sun (1):
      drm/amd/amdgpu: Enable some sysnodes for guest smi

Satyajit Sahu (3):
      drm/amdgpu/vce: set the priority for each ring
      drm/amdgpu/vcn: set the priority for each encode ring
      drm/amdgpu:schedule vce/vcn encode based on priority

Sean Paul (16):
      Revert "drm: cleanup: remove drm_modeset_(un)lock_all()"
      Revert "drm/amd: cleanup: drm_modeset_lock_all() -->
DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm/gma500: cleanup: drm_modeset_lock_all() -->
DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm/i915: cleanup: drm_modeset_lock_all() -->
DRM_MODESET_LOCK_ALL_BEGIN() part 2"
      Revert "drm/i915: cleanup: drm_modeset_lock_all() -->
DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm/msm: cleanup: drm_modeset_lock_all() -->
DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm/nouveau: cleanup: drm_modeset_lock_all() -->
DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm/omapdrm: cleanup: drm_modeset_lock_all() -->
DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm/radeon: cleanup: drm_modeset_lock_all() -->
DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm/shmobile: cleanup: drm_modeset_lock_all() -->
DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm/tegra: cleanup: drm_modeset_lock_all() -->
DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm/vmwgfx: cleanup: drm_modeset_lock_all() -->
DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm: cleanup: drm_modeset_lock_all() -->
DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm/msm: cleanup: drm_modeset_lock_all_ctx() -->
DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm/i915: cleanup: drm_modeset_lock_all_ctx() -->
DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm: cleanup: drm_modeset_lock_all_ctx() -->
DRM_MODESET_LOCK_ALL_BEGIN()"

Simon Ser (8):
      amd/display: downgrade validation failure log level
      drm: document drm_mode_create_lease object requirements
      drm/panel-orientation-quirks: add Valve Steam Deck
      amd/display: enable panel orientation quirks
      drm/amdgpu: check tiling flags when creating FB on GFX8-
      drm/lease: allow empty leases
      amd/display: check cursor plane matches underlying plane
      amd/display: remove ChromeOS workaround

Sireesh Kodali (1):
      dt-bindings: msm: dsi: Add MSM8953 dsi phy

Solomon Chiu (1):
      drm/amd/display: Add 120Hz support for freesync video mode

Souptick Joarder (2):
      drm/rockchip: remove of_match_ptr() from vop_driver_dt_match
      drm/rockchip: remove of_match_ptr() from analogix dp driver

Sreedhar Telukuntla (1):
      drm/i915/gt: Initialize L3CC table in mocs init

Steven Price (1):
      drm/panfrost: Calculate lock region size correctly

Stuart Summers (1):
      drm/i915/xehpsdv: Add compute DSS type

Swati Sharma (1):
      drm/i915/dp: Drop redundant debug print

Tao Zhou (10):
      drm/amdgpu: add poison mode query for DF (v2)
      drm/amdgpu: add poison mode query for UMC
      drm/amdgpu: set poison supported flag for RAS (v2)
      drm/amdgpu: skip umc ras irq handling in poison mode (v2)
      amd/amdkfd: add ras page retirement handling for sq/sdma (v3)
      drm/amdgpu: load PSP RL in resume path
      drm/amdgpu: centralize checking for RAS TA status
      drm/amdgpu: output warning for unsupported ras error inject (v2)
      drm/amdgpu: skip GPRs init for some CU settings on ALDEBARAN
      drm/amdgpu: remove GPRs init for ALDEBARAN in gpu reset (v3)

Tejas Upadhyay (4):
      drm/i915/adl_s: Update ADL-S PCI IDs
      drm/i915/display: Add HDR mode helper function
      drm/i915: Remove warning from the rps worker
      drm/i915/gen11: Disable cursor clock gating in HDR mode

Thelford Williams (1):
      drm/amdgpu: fix out of bounds write

Thierry Reding (3):
      drm/fourcc: Add macros to determine the modifier vendor
      drm/arm: malidp: Use fourcc_mod_is_vendor() helper
      drm/tegra: Use fourcc_mod_is_vendor() helper

Thomas Hellstr=C3=B6m (13):
      drm/i915: Ditch the i915_gem_ww_ctx loop member
      drm/i915/ttm: Reorganize the ttm move code somewhat
      drm/ttm, drm/i915: Update ttm_move_memcpy for async use
      drm/i915/gem: Fix the mman selftest
      drm/i915/gem: Fix a lockdep warning the __i915_gem_is_lmem() function
      drm/i915/ttm: Implement a function to copy the contents of two
TTM-based objects
      drm/i915/gem: Implement a function to process all gem objects of a re=
gion
      drm/i915/gt: Increase suspend timeout
      drm/i915 Implement LMEM backup and restore for suspend / resume
      drm/i915/gt: Register the migrate contexts with their engines
      drm/i915: Don't back up pinned LMEM context images and rings
during suspend
      drm/i915: Reduce the number of objects subject to memcpy recover
      drm/i915/ttm: Rework object initialization slightly

Thomas Zimmermann (10):
      lib: devres: Add managed arch_phys_wc_add()
      lib: devres: Add managed arch_io_reserve_memtype_wc()
      drm/ast: Use managed interfaces for framebuffer write combining
      drm/mgag200: Use managed interfaces for framebuffer write combining
      drm/vboxvideo: Use managed interfaces for framebuffer write combining
      drm/gma500: Replace references to dev_private with helper function
      drm/gma500: Disable PCI device during shutdown
      drm/gma500: Embed struct drm_device in struct drm_psb_private
      drm/gma500: Remove dev_priv branch from unload function
      drm/gma500: Managed device release

Tim Gardner (1):
      drm/msm: prevent NULL dereference in msm_gpu_crashstate_capture()

Tom St Denis (2):
      drm/amd/amdgpu: New debugfs interface for MMIO registers (v5)
      drm/amd/amdgpu: Add missing mp_11_0_8_sh_mask.h header

Tvrtko Ursulin (3):
      drm/i915: Use Transparent Hugepages when IOMMU is enabled
      drm/i915/debugfs: Do not report currently active engine when
describing objects
      drm/i915: Handle Intel igfx + Intel dgfx hybrid graphics setup

Vandita Kulkarni (4):
      drm/i915/display: Update small joiner ram size
      drm/i915/dsi/xelpd: Add WA to program LP to HS wakeup guardband
      drm/i915/dsi/xelpd: Enable mipi dsi support.
      drm/i915/display: Fix the dsc check while selecting min_cdclk

Venkata Sandeep Dhanalakota (2):
      drm/i915: Make wa list per-gt
      drm/i915: Do not define vma on stack

Vignesh Chander (1):
      drm/amd/pm: Enable GPU metrics for One VF mode

Ville Syrj=C3=A4l=C3=A4 (82):
      drm/i915/fbc: Rewrite the FBC tiling check a bit
      drm/i915/fbc: Extract intel_fbc_update()
      drm/i915/fbc: Move the "recompress on activate" to a central place
      drm/i915/fbc: Polish the skl+ FBC stride override handling
      drm/i915: Silence __iomem sparse warn
      drm/i915: s/0/NULL/
      drm/i915: Set output_types to EDP for vlv/chv DPLL forcing
      drm/i915: Clean up gen2 DPLL readout
      drm/i915: Extract ilk_update_pll_dividers()
      drm/i915: Constify struct dpll all over
      drm/i915: Clean dpll calling convention
      drm/i915: Clean up variable names in old dpll functions
      drm/i915: Remove the 'reg' local variable
      drm/i915: Program DPLL P1 dividers consistently
      drm/i915: Call {vlv,chv}_prepare_pll() from {vlv,chv}_enable_pll()
      drm/i915: Reuse ilk_needs_fb_cb_tune() for the reduced clock as well
      drm/i915: Fold i9xx_set_pll_dividers() into i9xx_enable_pll()
      drm/i915: Fold ibx_pch_dpll_prepare() into ibx_pch_dpll_enable()
      drm/i915: Nuke intel_prepare_shared_dpll()
      drm/i915: Extract intel_dp_need_bigjoiner()
      drm/i915: Flatten hsw_crtc_compute_clock()
      drm/i915: s/pipe/transcoder/ when dealing with PIPECONF/TRANSCONF
      drm/i915: Introduce with_intel_display_power_if_enabled()
      drm/i915: Adjust intel_dsc_power_domain() calling convention
      drm/i915: Extract hsw_panel_transcoders()
      drm/i915: s/crtc_state/new_crtc_state/ etc.
      drm/i915: Use u8 consistently for active_planes bitmask
      drm/i915: Fix g4x cxsr enable condition
      drm/i915: Apply WaUse32BppForSRWM to elk as well as ctg
      drm: Fix scaling_mode docs
      drm/i915: Fix HPLL watermark readout for g4x
      drm/i915/fbc: Rework cfb stride/size calculations
      drm/i915/fbc: Align FBC segments to 512B on glk+
      drm/i915/fbc: Implement Wa_16011863758 for icl+
      drm/i915/fbc: Allow higher compression limits on FBC1
      drm/i915: Extract intel_panel_mode_valid()
      drm/i915: Use intel_panel_mode_valid() for DSI/LVDS/(s)DVO
      drm/i915: Reject modes that don't match fixed_mode vrefresh
      drm/i915: Introduce intel_panel_compute_config()
      drm/i915: Reject user modes that don't match fixed mode's refresh rat=
e
      drm/i915: Drop pointless fixed_mode checks from dsi code
      drm/i915: Enable TPS3/4 on all platforms that support them
      drm/i915/fbc: Allow FBC with Yf tiling
      drm/i915: Pimp HSW+ transcoder state readout
      drm/i915: Configure TRANSCONF just the once with bigjoiner
      drm/i915: Clear leftover DP vswing/preemphasis values before modeset
      drm/i915: Call intel_ddi_init_dp_buf_reg() earlier
      drm/i915: Remove DP_PORT_EN stuff from link training code
      drm/i915: Nuke local copies/pointers of intel_dp->DP
      drm/i915: s/ddi_translations/trans/
      drm/i915: Use standard form -EDEADLK check
      drm/i915: Adjust intel_crtc_compute_config() debug message
      drm/i915: Move WaPruneModeWithIncorrectHsyncOffset into intel_mode_va=
lid()
      drm/i915: Stop force enabling pipe bottom color gammma/csc
      drm/i915: Fix DP clock recovery "voltage_tries" handling
      drm/i915: Introduce has_iboost()
      drm/i915: Introduce has_buf_trans_select()
      drm/i915: Generalize .set_signal_levels()
      drm/i915: Nuke useless .set_signal_levels() wrappers
      drm/i915: De-wrapper bxt_ddi_phy_set_signal_levels()
      drm/i915: Hoover the level>=3Dn_entries WARN into intel_ddi_level()
      drm/i915: Nuke intel_ddi_hdmi_num_entries()
      drm/i915: Pass the lane to intel_ddi_level()
      drm/i915: Prepare link training for per-lane drive settings
      drm/i915: Allow per-lane drive settings with LTTPRs
      drm/i915: Extend the async flip VT-d w/a to skl/bxt
      drm/i195: Make the async flip VT-d workaround dynamic
      drm/i915: Tweak the DP "max vswing reached?" condition
      drm/i915: Show LTTPR in the TPS debug print
      drm/i915: Print the DP vswing adjustment request
      drm/i915: Pimp link training debug prints
      drm/i915: Call intel_dp_dump_link_status() for CR failures
      drm/i915: Remove pointless extra namespace from dkl/snps buf trans st=
ructs
      drm/i915: Shrink {icl_mg,tgl_dkl}_phy_ddi_buf_trans
      drm/i915: Use standard form terminating condition for lane for loops
      drm/i915: Remove dead DKL_TX_LOADGEN_SHARING_PMD_DISABLE stuff
      drm/i915: Extract icl_combo_phy_loadgen_select()
      drm/i915: Add all per-lane register definitions for icl combo phy
      drm/i915: Fix oops on platforms w/o hpd support
      drm/i915: Replace the unconditional clflush with drm_clflush_virt_ran=
ge()
      drm/i915: Convert unconditional clflush to drm_clflush_virt_range()
      drm/i915: Catch yet another unconditioal clflush

Vinay Belgaumkar (1):
      drm/i915: Get PM ref before accessing HW register

Vitaly Lubart (1):
      mei: pxp: export pavp client to me client bus

Vladimir Lypak (2):
      drm/msm/dsi: Add phy configuration for MSM8953
      drm/msm/mdp5: Add configuration for MDP v1.16

Wang Qing (1):
      drm: Use IS_ERR() instead of IS_ERR_OR_NULL()

Wayne Lin (3):
      drm/amd/display: Add option to defer works of hpd_rx_irq
      drm/amd/display: Fork thread to offload work of hpd_rx_irq
      drm/amd/display: Fix Werror when building

Wenjing Liu (14):
      drm/amd/display: expose dsc overhead bw in dc dsc header
      drm/amd/display: move bpp range decision in decide dsc bw range funct=
ion
      drm/amd/display: update conditions to do dfp cap ext validation
      drm/amd/display: use correct vpg instance for 128b/132b encoding
      drm/amd/display: update cur_lane_setting to an array one for each lan=
e
      drm/amd/display: add function to convert hw to dpcd lane settings
      drm/amd/display: make verified link cap not exceeding max link cap
      drm/amd/display: add DP2.0 debug option to set MST_EN for SST stream
      drm/amd/display: correct apg audio channel enable golden value
      drm/amd/display: adopt DP2.0 LT SCR revision 8
      drm/amd/display: implement decide lane settings
      drm/amd/display: decouple hw_lane_settings from dpcd_lane_settings
      drm/amd/display: add two lane settings training options
      drm/amd/display: fix link training regression for 1 or 2 lane

Wolfram Sang (1):
      drm/panfrost: simplify getting .driver_data

Wyatt Wood (2):
      drm/amd/display: Initialize GSP1 SDP header
      drm/amd/display: Prevent using DMUB rptr that is out-of-bounds

Xin Ji (1):
      drm/bridge: anx7625: enable DSI EOTP

Xu Wang (3):
      drm/msm/mdp4: Remove redundant null check before
clk_prepare_enable/clk_disable_unprepare
      drm/msm: dsi: Remove redundant null check before
clk_prepare_enable/clk_disable_unprepare
      drm/msm/mdp5: Remove redundant null check before
clk_prepare_enable/clk_disable_unprepare

Yang Li (1):
      drm/amdkfd: fix resource_size.cocci warnings

Yang Yingliang (1):
      drm/gma500: Fix wrong pointer passed to PTR_ERR()

Yanteng Si (2):
      drm/msm: Fix missing include files in msm_gem.c
      drm/msm: Fix missing include files in msm_gem_shrinker.c

Yifan Zha (1):
      drm/amd/pm: Update navi12 smu message mapping table in sriov

Yifan Zhang (6):
      drm/amdkfd: remove redundant iommu cleanup code
      drm/amdgpu: init iommu after amdkfd device init
      drm/amdkfd: export svm_range_list_lock_and_flush_work
      drm/amdkfd: fix KFDSVMRangeTest.PartialUnmapSysMemTest fails
      drm/amdkfd: fix boot failure when iommu is disabled in Picasso.
      drm/amdkfd: fix resume error when iommu disabled in Picasso

YuBiao Wang (1):
      drm/amd/amdgpu: Do irq_fini_hw after ip_fini_early

Zenghui Yu (1):
      drm/i915: Free the returned object of acpi_evaluate_dsm()

Zhan Liu (2):
      drm/amdgpu: add cyan_skillfish asic header files
      drm/amd/display: add cyan_skillfish display support

bibo mao (1):
      drm/qxl: User page size macro for qxl release bo

chongjiapeng (2):
      drm/amd/display: Fix warning comparing pointer to 0
      drm/amd/display: make configure_lttpr_mode_transparent and
configure_lttpr_mode_non_transparent static

kernel test robot (1):
      drm/amd/display: fix duplicated inclusion

liuyuntao (1):
      virtio-gpu: fix possible memory allocation failure

ravitejax (1):
      drm/i915/adl_s: Remove require_force_probe protection

shaoyunl (1):
      drm/amdgpu:  Get atomicOps info from Host for sriov setup

xinhui pan (8):
      drm/ttm: Try to check if new ttm man out of bounds during compile
      drm/amdgpu: Increase direct IB pool size
      drm/amdgpu: UVD avoid memory allocation during IB test
      drm/amdgpu: VCE avoid memory allocation during IB test
      drm/amdgpu: VCN avoid memory allocation during IB test
      drm/amdgpu: Fix a race of IB test
      drm/amdgpu: Put drm_dev_enter/exit outside hot codepath
      drm/amdgpu: Fix uvd ib test timeout when use pre-allocated BO

yangcong (4):
      dt-bindings: drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rai=
l
      drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
      dt-bindings: boe, tv101wum-n16: Add compatible for boe
tv110c9m-ll3 and inx hj110iz-01a
      drm/panel: support for BOE and INX video mode panel

zhangzhijie (1):
      drm: Improve the output_poll_changed description

zhaoxiao (1):
      drm/msm: Remove initialization of static variables

 .../bindings/display/msm/dp-controller.yaml        |    15 +-
 .../bindings/display/msm/dpu-sc7280.yaml           |   232 +
 .../bindings/display/msm/dsi-phy-14nm.yaml         |     1 +
 .../devicetree/bindings/display/msm/gpu.txt        |   157 -
 .../devicetree/bindings/display/msm/gpu.yaml       |   288 +
 .../bindings/display/panel/boe,tv101wum-nl6.yaml   |     7 +
 .../bindings/display/panel/panel-edp.yaml          |   188 +
 .../bindings/display/panel/samsung,s6d27a1.yaml    |    98 +
 .../devicetree/bindings/display/renesas,du.yaml    |    51 +
 Documentation/driver-api/dma-buf.rst               |     6 -
 Documentation/gpu/drm-kms-helpers.rst              |    12 +
 Documentation/gpu/drm-mm.rst                       |    84 +-
 Documentation/gpu/i915.rst                         |    35 +-
 Documentation/gpu/rfc/i915_parallel_execbuf.h      |   122 -
 Documentation/gpu/rfc/i915_scheduler.rst           |     4 +-
 Documentation/gpu/todo.rst                         |    17 -
 Documentation/locking/ww-mutex-design.rst          |     2 +-
 MAINTAINERS                                        |    15 +
 arch/arm/configs/at91_dt_defconfig                 |     1 +
 arch/arm/configs/exynos_defconfig                  |     1 +
 arch/arm/configs/imx_v6_v7_defconfig               |     1 +
 arch/arm/configs/lpc32xx_defconfig                 |     1 +
 arch/arm/configs/multi_v5_defconfig                |     1 +
 arch/arm/configs/multi_v7_defconfig                |     1 +
 arch/arm/configs/omap2plus_defconfig               |     1 +
 arch/arm/configs/qcom_defconfig                    |     1 +
 arch/arm/configs/realview_defconfig                |     1 +
 arch/arm/configs/sama5_defconfig                   |     1 +
 arch/arm/configs/shmobile_defconfig                |     1 +
 arch/arm/configs/sunxi_defconfig                   |     1 +
 arch/arm/configs/tegra_defconfig                   |     1 +
 arch/arm/configs/versatile_defconfig               |     1 +
 arch/arm/configs/vexpress_defconfig                |     1 +
 arch/arm64/configs/defconfig                       |     1 +
 arch/x86/include/asm/mce.h                         |     2 +-
 arch/x86/kernel/cpu/mce/amd.c                      |     3 +-
 drivers/dma-buf/Makefile                           |     2 +-
 drivers/dma-buf/dma-buf.c                          |   153 +-
 drivers/dma-buf/dma-fence.c                        |    13 +-
 drivers/dma-buf/dma-resv.c                         |   442 +-
 drivers/dma-buf/heaps/system_heap.c                |     5 +-
 drivers/dma-buf/seqno-fence.c                      |    71 -
 drivers/gpu/drm/Kconfig                            |    11 +-
 drivers/gpu/drm/Makefile                           |     1 -
 drivers/gpu/drm/amd/amdgpu/Makefile                |     6 +-
 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |    17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |     9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |    39 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c        |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h        |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |   143 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h            |     8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   256 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h        |     6 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   122 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_df.h             |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   871 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h      |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   665 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |    12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |    11 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |     7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |     7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |     9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |    35 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |     8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    57 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |     2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   755 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |    46 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   394 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |    25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |    22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |    18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |    19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c          |    44 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    66 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |   175 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umr.h            |    51 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |   119 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.h            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |    43 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   191 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |     4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |    10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    30 +-
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |     7 +-
 drivers/gpu/drm/amd/amdgpu/athub_v2_0.c            |     7 +-
 drivers/gpu/drm/amd/amdgpu/athub_v2_1.c            |     9 +-
 drivers/gpu/drm/amd/amdgpu/beige_goby_reg_init.c   |    54 -
 .../gpu/drm/amd/amdgpu/cyan_skillfish_reg_init.c   |    51 -
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c               |    31 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   403 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   227 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |     5 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |     6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    91 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |     4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   136 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |    15 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |    20 -
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.h             |    20 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |    40 +-
 drivers/gpu/drm/amd/amdgpu/mca_v3_0.c              |     9 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |    73 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |     6 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |    13 +-
 drivers/gpu/drm/amd/amdgpu/navi10_reg_init.c       |    55 -
 drivers/gpu/drm/amd/amdgpu/navi12_reg_init.c       |    52 -
 drivers/gpu/drm/amd/amdgpu/navi14_reg_init.c       |    53 -
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |    31 +
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.h             |     1 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |    66 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.h             |     1 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   382 +-
 drivers/gpu/drm/amd/amdgpu/nv.h                    |    12 +-
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c             |    22 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |    93 +-
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             |    14 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |    14 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   100 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |    32 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    59 +-
 .../gpu/drm/amd/amdgpu/sienna_cichlid_reg_init.c   |    54 -
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   346 +-
 drivers/gpu/drm/amd/amdgpu/soc15.h                 |     5 +-
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |    51 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |    34 +
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |    24 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c              |    24 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c              |    24 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |    11 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |    43 +-
 drivers/gpu/drm/amd/amdgpu/vangogh_reg_init.c      |    50 -
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c              |    23 +-
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |    32 +-
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |    52 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |    15 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |    28 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |    44 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |    62 +-
 drivers/gpu/drm/amd/amdgpu/yellow_carp_reg_init.c  |    51 -
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |    79 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   267 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |     5 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |     2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |     4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c      |     1 -
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   153 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h       |     3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c   |    32 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |    19 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |    19 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |    35 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    26 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   109 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |    24 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   192 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |     1 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |    19 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  1024 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   103 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |    34 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |    16 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |    71 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |     6 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |    10 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c     |     2 +-
 drivers/gpu/drm/amd/display/dc/Makefile            |     3 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |   102 +-
 .../gpu/drm/amd/display/dc/bios/command_table2.c   |    14 +-
 .../amd/display/dc/bios/command_table_helper2.c    |     1 +
 drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c   |    55 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |     9 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |    21 +-
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |    12 +-
 .../amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c |   258 +
 .../amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.h |    34 +
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |    16 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |     4 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |    40 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   381 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  1107 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |    26 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  1822 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpcd.c |    11 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c |   962 +
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |   496 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c |   361 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   165 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stat.c      |     8 +
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |     4 +
 drivers/gpu/drm/amd/display/dc/dc.h                |   107 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   302 +-
 drivers/gpu/drm/amd/display/dc/dc_dsc.h            |    11 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |    38 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |    13 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |    23 +
 drivers/gpu/drm/amd/display/dc/dce/dce_abm.h       |    16 +
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |     6 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |    49 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.h  |     9 +
 drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h     |    42 +-
 .../drm/amd/display/dc/dce/dce_stream_encoder.c    |     2 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c      |    21 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |    22 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.h      |     1 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   164 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c  |    12 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   128 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_ipp.h   |    33 +-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.c  |     9 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |     2 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |     2 +-
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c    |    31 +
 .../amd/display/dc/dcn10/dcn10_stream_encoder.h    |     2 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h  |    34 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |    49 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c  |     5 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |    57 +-
 .../amd/display/dc/dcn20/dcn20_stream_encoder.c    |    17 +-
 .../amd/display/dc/dcn20/dcn20_stream_encoder.h    |     1 +
 drivers/gpu/drm/amd/display/dc/dcn201/Makefile     |    36 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_dccg.c    |    84 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_dccg.h    |    37 +
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c |   316 +
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.h |    83 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hubbub.c  |   107 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hubbub.h  |    45 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hubp.c    |   150 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hubp.h    |   132 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c   |   630 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.h   |    46 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_init.c    |   131 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_init.h    |    33 +
 .../amd/display/dc/dcn201/dcn201_link_encoder.c    |   209 +
 .../amd/display/dc/dcn201/dcn201_link_encoder.h    |    59 +
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_mpc.c |   125 +
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_mpc.h |    86 +
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_opp.c |    72 +
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_opp.h |    74 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_optc.c    |   203 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_optc.h    |    74 +
 .../drm/amd/display/dc/dcn201/dcn201_resource.c    |  1307 ++
 .../drm/amd/display/dc/dcn201/dcn201_resource.h    |    50 +
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c  |    24 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.h  |    24 +
 .../amd/display/dc/dcn30/dcn30_dio_link_encoder.c  |     4 +
 .../display/dc/dcn30/dcn30_dio_stream_encoder.c    |    18 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |    73 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c    |     8 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c  |     6 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |     5 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c  |     1 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |    17 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |    43 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.h  |     7 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_vpg.c   |   200 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_vpg.h   |    15 +-
 drivers/gpu/drm/amd/display/dc/dcn301/Makefile     |    26 -
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |   263 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.h    |     3 +
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |     8 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |    16 +-
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile      |     4 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_afmt.c  |    92 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_afmt.h  |   126 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c   |   173 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h   |   115 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c  |   383 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.h  |    52 +-
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |   136 +-
 .../display/dc/dcn31/dcn31_hpo_dp_link_encoder.c   |   616 +
 .../display/dc/dcn31/dcn31_hpo_dp_link_encoder.h   |   222 +
 .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c |   752 +
 .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.h |   241 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |   113 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.h |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |     3 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   345 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.h  |    10 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_vpg.c   |    87 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_vpg.h   |   162 +
 drivers/gpu/drm/amd/display/dc/dm_cp_psp.h         |     3 +
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |    11 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |    10 +-
 .../dc/dml/{dcn2x/dcn2x.c =3D> dcn20/dcn20_fpu.c}    |     2 +-
 .../dc/dml/{dcn2x/dcn2x.h =3D> dcn20/dcn20_fpu.h}    |     6 +-
 .../display/dc/dml/dcn20/display_rq_dlg_calc_20.c  |   158 +-
 .../display/dc/dml/dcn20/display_rq_dlg_calc_20.h  |     4 +-
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c        |   156 +-
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.h        |     4 +-
 .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |   236 +-
 .../display/dc/dml/dcn21/display_rq_dlg_calc_21.c  |   156 +-
 .../display/dc/dml/dcn21/display_rq_dlg_calc_21.h  |     4 +-
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |   132 +-
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.h  |     4 +-
 .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c |   390 +
 .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.h |    42 +
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |     6 +-
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |   166 +-
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.h  |     4 +-
 .../drm/amd/display/dc/dml/display_mode_enums.h    |     4 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.c  |     1 +
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |     5 +-
 .../amd/display/dc/dml/display_rq_dlg_helpers.c    |   256 +-
 .../amd/display/dc/dml/display_rq_dlg_helpers.h    |    20 +-
 .../amd/display/dc/dml/dml1_display_rq_dlg_calc.c  |   246 +-
 .../amd/display/dc/dml/dml1_display_rq_dlg_calc.h  |    10 +-
 .../drm/amd/display/dc/{ =3D> dml}/dsc/qp_tables.h   |     0
 .../gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c   |   291 +
 .../gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.h   |    94 +
 drivers/gpu/drm/amd/display/dc/dsc/Makefile        |    29 -
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |   195 +-
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc.c       |   259 -
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc.h       |    50 +-
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c   |     1 -
 drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |     1 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |     1 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |    36 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_ddc.h   |     1 +
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |    45 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dpia.h  |    99 +
 drivers/gpu/drm/amd/display/dc/inc/hw/abm.h        |     1 +
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |    13 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |    32 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |    14 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dwb.h        |     5 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |     4 +
 .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |    97 +
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |     1 +
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |    87 +-
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |     3 +
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |     2 +-
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |     7 +
 drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h  |    26 +-
 drivers/gpu/drm/amd/display/dc/inc/link_hwss.h     |     1 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |    19 +
 drivers/gpu/drm/amd/display/dc/irq/Makefile        |    10 +
 .../amd/display/dc/irq/dcn20/irq_service_dcn20.c   |    25 +
 .../amd/display/dc/irq/dcn20/irq_service_dcn20.h   |     2 +
 .../amd/display/dc/irq/dcn201/irq_service_dcn201.c |   374 +
 .../amd/display/dc/irq/dcn201/irq_service_dcn201.h |    34 +
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.c   |    25 +
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.h   |     2 +
 drivers/gpu/drm/amd/display/dc/irq/irq_service.c   |     2 +-
 drivers/gpu/drm/amd/display/dc/irq/irq_service.h   |     4 +
 drivers/gpu/drm/amd/display/dc/os_types.h          |     2 +
 .../display/dc/virtual/virtual_stream_encoder.c    |     5 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    10 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   275 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |    12 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.h  |     2 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |    21 +-
 .../gpu/drm/amd/display/dmub/src/dmub_srv_stat.c   |    16 +
 .../drm/amd/display/include/bios_parser_types.h    |     8 +
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |     1 +
 drivers/gpu/drm/amd/display/include/dal_types.h    |     1 +
 drivers/gpu/drm/amd/display/include/dpcd_defs.h    |    17 +
 .../amd/display/include/grph_object_ctrl_defs.h    |     1 +
 .../gpu/drm/amd/display/include/grph_object_defs.h |    12 +
 .../gpu/drm/amd/display/include/grph_object_id.h   |     8 +
 .../gpu/drm/amd/display/include/i2caux_interface.h |     3 +
 .../drm/amd/display/include/link_service_types.h   |    86 +-
 drivers/gpu/drm/amd/display/include/logger_types.h |     6 +
 .../drm/amd/display/modules/color/color_gamma.c    |    32 +-
 .../drm/amd/display/modules/freesync/freesync.c    |    15 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |     6 +-
 drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |     2 +
 drivers/gpu/drm/amd/include/amd_shared.h           |     5 +-
 .../amd/include/asic_reg/clk/clk_11_0_1_offset.h   |    32 +
 .../amd/include/asic_reg/clk/clk_11_0_1_sh_mask.h  |    37 +
 .../amd/include/asic_reg/dcn/dcn_2_0_3_offset.h    |  6193 ++++++
 .../amd/include/asic_reg/dcn/dcn_2_0_3_sh_mask.h   | 22091 +++++++++++++++=
++++
 .../amd/include/asic_reg/dcn/dcn_3_1_2_offset.h    |     2 +
 .../amd/include/asic_reg/dcn/dcn_3_1_2_sh_mask.h   |     8 +
 .../drm/amd/include/asic_reg/df/df_3_6_offset.h    |     5 +
 .../drm/amd/include/asic_reg/df/df_3_6_sh_mask.h   |   132 +
 .../amd/include/asic_reg/dpcs/dpcs_2_0_3_offset.h  |   151 +
 .../amd/include/asic_reg/dpcs/dpcs_2_0_3_sh_mask.h |   952 +
 .../amd/include/asic_reg/mp/mp_11_0_8_sh_mask.h    |   355 +
 drivers/gpu/drm/amd/include/atombios.h             |     2 +-
 drivers/gpu/drm/amd/include/atomfirmware.h         |     4 +
 drivers/gpu/drm/amd/include/soc15_hw_ip.h          |     2 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |    22 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            |     4 +-
 drivers/gpu/drm/amd/pm/inc/smu_v11_0.h             |     4 +-
 drivers/gpu/drm/amd/pm/inc/smu_v13_0.h             |     4 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.h  |     4 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   135 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |    14 +
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    |    17 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |    64 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   119 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   117 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |    96 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |     6 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |    33 +-
 drivers/gpu/drm/arm/malidp_planes.c                |     2 +-
 drivers/gpu/drm/ast/ast_drv.h                      |     2 -
 drivers/gpu/drm/ast/ast_mm.c                       |    27 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c       |    15 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |    27 +-
 drivers/gpu/drm/bridge/cdns-dsi.c                  |     4 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |    21 +-
 drivers/gpu/drm/bridge/panel.c                     |    37 +
 drivers/gpu/drm/bridge/parade-ps8640.c             |   292 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c      |     6 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |    25 +-
 drivers/gpu/drm/drm_bridge.c                       |    78 +-
 drivers/gpu/drm/drm_connector.c                    |    83 +-
 drivers/gpu/drm/drm_crtc_internal.h                |     2 +
 drivers/gpu/drm/drm_dp_helper.c                    |    42 +-
 drivers/gpu/drm/drm_dp_mst_topology.c              |    42 +-
 drivers/gpu/drm/drm_edid.c                         |   367 +-
 drivers/gpu/drm/drm_format_helper.c                |    88 +
 drivers/gpu/drm/drm_fourcc.c                       |     3 +
 drivers/gpu/drm/drm_gem_shmem_helper.c             |    23 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |     1 -
 drivers/gpu/drm/drm_ioctl.c                        |    21 +-
 drivers/gpu/drm/drm_kms_helper_common.c            |    11 -
 drivers/gpu/drm/drm_lease.c                        |    39 +-
 drivers/gpu/drm/drm_mipi_dsi.c                     |    81 +
 drivers/gpu/drm/drm_modeset_lock.c                 |     2 +-
 drivers/gpu/drm/drm_of.c                           |     3 +
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |    49 +-
 drivers/gpu/drm/drm_probe_helper.c                 |   119 +-
 drivers/gpu/drm/drm_property.c                     |     9 +-
 drivers/gpu/drm/drm_sysfs.c                        |    87 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |     1 -
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |     4 +-
 drivers/gpu/drm/gma500/backlight.c                 |    12 +-
 drivers/gpu/drm/gma500/cdv_device.c                |    24 +-
 drivers/gpu/drm/gma500/cdv_intel_display.c         |    10 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |    12 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c            |    22 +-
 drivers/gpu/drm/gma500/framebuffer.c               |    16 +-
 drivers/gpu/drm/gma500/gem.c                       |     2 +-
 drivers/gpu/drm/gma500/gma_device.c                |     2 +-
 drivers/gpu/drm/gma500/gma_display.c               |    14 +-
 drivers/gpu/drm/gma500/gtt.c                       |    18 +-
 drivers/gpu/drm/gma500/intel_bios.c                |    10 +-
 drivers/gpu/drm/gma500/intel_gmbus.c               |    12 +-
 drivers/gpu/drm/gma500/mid_bios.c                  |    11 +-
 drivers/gpu/drm/gma500/mmu.c                       |    12 +-
 drivers/gpu/drm/gma500/oaktrail_crtc.c             |     8 +-
 drivers/gpu/drm/gma500/oaktrail_device.c           |    20 +-
 drivers/gpu/drm/gma500/oaktrail_hdmi.c             |    18 +-
 drivers/gpu/drm/gma500/oaktrail_lvds.c             |    14 +-
 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c         |     2 +-
 drivers/gpu/drm/gma500/opregion.c                  |    14 +-
 drivers/gpu/drm/gma500/power.c                     |    20 +-
 drivers/gpu/drm/gma500/psb_device.c                |    16 +-
 drivers/gpu/drm/gma500/psb_drv.c                   |   147 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |    24 +-
 drivers/gpu/drm/gma500/psb_intel_display.c         |    10 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c            |    31 +-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c            |    10 +-
 drivers/gpu/drm/gma500/psb_irq.c                   |    26 +-
 drivers/gpu/drm/gma500/psb_lid.c                   |     2 +-
 drivers/gpu/drm/gud/Kconfig                        |     2 +-
 drivers/gpu/drm/gud/gud_drv.c                      |     6 +
 drivers/gpu/drm/gud/gud_internal.h                 |    12 +
 drivers/gpu/drm/gud/gud_pipe.c                     |     6 +
 drivers/gpu/drm/i915/Kconfig                       |    11 +
 drivers/gpu/drm/i915/Makefile                      |    36 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |    90 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |     2 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |   165 +-
 drivers/gpu/drm/i915/display/intel_acpi.c          |    46 +
 drivers/gpu/drm/i915/display/intel_acpi.h          |     3 +
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |   209 +
 drivers/gpu/drm/i915/display/intel_audio.c         |    43 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |  1776 ++
 drivers/gpu/drm/i915/display/intel_backlight.h     |    52 +
 drivers/gpu/drm/i915/display/intel_bios.c          |   420 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |     2 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |   348 +-
 drivers/gpu/drm/i915/display/intel_cdclk.h         |     4 +-
 drivers/gpu/drm/i915/display/intel_color.c         |   140 +-
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |     8 +-
 drivers/gpu/drm/i915/display/intel_connector.c     |     6 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |     4 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |    11 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |   535 +-
 drivers/gpu/drm/i915/display/intel_ddi.h           |     7 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |   672 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h |    23 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  2523 +--
 drivers/gpu/drm/i915/display/intel_display.h       |    47 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   127 +-
 .../gpu/drm/i915/display/intel_display_debugfs.h   |    10 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |    15 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |     4 +
 drivers/gpu/drm/i915/display/intel_display_types.h |    48 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |    20 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |   777 +-
 drivers/gpu/drm/i915/display/intel_dp.h            |    22 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |     6 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |    12 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |    78 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |   467 +-
 .../gpu/drm/i915/display/intel_dp_link_training.h  |     1 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |    49 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.h        |     4 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |    33 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.h      |     5 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |   674 +-
 drivers/gpu/drm/i915/display/intel_dpll.h          |    26 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |    46 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |    11 -
 drivers/gpu/drm/i915/display/intel_dpt.c           |   239 +
 drivers/gpu/drm/i915/display/intel_dpt.h           |    19 +
 drivers/gpu/drm/i915/display/intel_drrs.c          |   437 +
 drivers/gpu/drm/i915/display/intel_drrs.h          |    36 +
 drivers/gpu/drm/i915/display/intel_dsi.c           |    16 +-
 drivers/gpu/drm/i915/display/intel_dsi.h           |     3 +
 .../gpu/drm/i915/display/intel_dsi_dcs_backlight.c |    33 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |     3 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |    24 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |   606 +-
 drivers/gpu/drm/i915/display/intel_fb.h            |    20 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |   274 +
 drivers/gpu/drm/i915/display/intel_fb_pin.h        |    28 +
 drivers/gpu/drm/i915/display/intel_fbc.c           |   292 +-
 drivers/gpu/drm/i915/display/intel_fbc.h           |     2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |     4 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |   321 +-
 drivers/gpu/drm/i915/display/intel_fdi.h           |    17 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |     5 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.h   |     4 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |    70 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |    20 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |     4 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |    33 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |     5 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |  1835 +-
 drivers/gpu/drm/i915/display/intel_panel.h         |    48 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.c |   283 +
 drivers/gpu/drm/i915/display/intel_plane_initial.h |    13 +
 drivers/gpu/drm/i915/display/intel_pps.c           |    59 +
 drivers/gpu/drm/i915/display/intel_pps.h           |     3 +
 drivers/gpu/drm/i915/display/intel_psr.c           |   476 +-
 drivers/gpu/drm/i915/display/intel_psr.h           |    13 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |    19 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |   225 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.h      |     4 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |   290 +-
 drivers/gpu/drm/i915/display/intel_tc.h            |     6 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |     2 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |    77 +-
 drivers/gpu/drm/i915/display/intel_vdsc.h          |     6 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |    58 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |    53 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |    25 +-
 drivers/gpu/drm/i915/gem/i915_gem_busy.c           |    57 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |   514 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.h        |    19 +-
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h  |    58 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |    75 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |     9 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   823 +-
 drivers/gpu/drm/i915/gem/i915_gem_internal.c       |     2 +
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c           |    33 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h           |     4 +
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |     2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |    70 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |    29 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |    57 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c             |    91 +
 drivers/gpu/drm/i915/gem/i915_gem_pm.h             |     1 +
 drivers/gpu/drm/i915/gem/i915_gem_region.c         |    70 +
 drivers/gpu/drm/i915/gem/i915_gem_region.h         |    37 +
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |    29 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |   201 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h            |    14 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c         |   206 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.h         |    26 +
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |     8 +-
 drivers/gpu/drm/i915/gem/i915_gemfs.c              |    22 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |    48 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |    29 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |    36 +-
 .../drm/i915/gem/selftests/i915_gem_execbuffer.c   |   190 -
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |     2 +
 drivers/gpu/drm/i915/gem/selftests/mock_context.c  |     5 +-
 drivers/gpu/drm/i915/gt/debugfs_engines.h          |    14 -
 drivers/gpu/drm/i915/gt/debugfs_gt.c               |    47 -
 drivers/gpu/drm/i915/gt/debugfs_gt_pm.h            |    14 -
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c               |     2 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |     7 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.h               |     4 +-
 drivers/gpu/drm/i915/gt/intel_context.c            |    61 +-
 drivers/gpu/drm/i915/gt/intel_context.h            |    56 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h      |   153 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |    19 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |   150 +-
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c   |     2 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |    36 +
 drivers/gpu/drm/i915/gt/intel_engine_pm.h          |    39 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |    31 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |    17 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |    52 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |    22 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |    22 +-
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c     |     2 -
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c         |   104 +
 .../i915/gt/{debugfs_gt.h =3D> intel_gt_debugfs.h}   |    18 +-
 ...ebugfs_engines.c =3D> intel_gt_engines_debugfs.c} |    10 +-
 drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.h |    14 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |     7 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |    22 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h              |    14 +
 .../gt/{debugfs_gt_pm.c =3D> intel_gt_pm_debugfs.c}  |   197 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h      |    20 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |    12 +
 drivers/gpu/drm/i915/gt/intel_gtt.c                |     9 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |    11 +-
 drivers/gpu/drm/i915/gt/intel_llc.c                |     3 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |    93 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c            |     2 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c               |   176 +-
 drivers/gpu/drm/i915/gt/intel_mocs.h               |     1 +
 drivers/gpu/drm/i915/gt/intel_ppgtt.c              |    13 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |     2 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |     4 +-
 drivers/gpu/drm/i915/gt/intel_ring.c               |     3 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |     7 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |    22 +-
 drivers/gpu/drm/i915/gt/intel_rps.h                |     1 +
 drivers/gpu/drm/i915/gt/intel_sseu.c               |    65 +-
 drivers/gpu/drm/i915/gt/intel_sseu.h               |    11 +-
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c       |    10 +-
 drivers/gpu/drm/i915/gt/intel_timeline.c           |     4 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |   262 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.h        |     2 +-
 drivers/gpu/drm/i915/gt/mock_engine.c              |     2 +
 .../gpu/drm/i915/gt/selftest_engine_heartbeat.c    |     4 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |    28 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |    10 +-
 drivers/gpu/drm/i915/gt/selftest_workarounds.c     |     2 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h   |     1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |    39 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |   119 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |    28 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |    60 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c     |    18 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |    13 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |    34 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c |     8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  2298 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |    14 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_debugfs.c     |     6 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |     2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c      |     6 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |    93 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |     9 +
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c          |   127 +
 .../gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c    |   179 +
 drivers/gpu/drm/i915/gvt/gtt.c                     |    17 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c                   |     4 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |     2 +-
 drivers/gpu/drm/i915/i915_buddy.c                  |    45 +
 drivers/gpu/drm/i915/i915_buddy.h                  |     8 +
 drivers/gpu/drm/i915/i915_config.c                 |     2 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |   286 +-
 drivers/gpu/drm/i915/i915_drv.c                    |    17 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   168 +-
 drivers/gpu/drm/i915/i915_gem.c                    |     2 -
 drivers/gpu/drm/i915/i915_gem_gtt.c                |     4 +-
 drivers/gpu/drm/i915/i915_gem_ww.h                 |    25 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |    42 +-
 drivers/gpu/drm/i915/i915_irq.c                    |    94 +-
 drivers/gpu/drm/i915/i915_irq.h                    |    51 +-
 drivers/gpu/drm/i915/i915_module.c                 |     4 +-
 drivers/gpu/drm/i915/i915_params.h                 |     2 +-
 drivers/gpu/drm/i915/i915_pci.c                    |    14 +-
 drivers/gpu/drm/i915/i915_pci.h                    |    12 +-
 drivers/gpu/drm/i915/i915_query.c                  |     5 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   180 +-
 drivers/gpu/drm/i915/i915_request.c                |   157 +-
 drivers/gpu/drm/i915/i915_request.h                |    49 +-
 drivers/gpu/drm/i915/i915_sysfs.c                  |     1 -
 drivers/gpu/drm/i915/i915_trace.h                  |    14 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |    20 +-
 drivers/gpu/drm/i915/i915_utils.h                  |    13 -
 drivers/gpu/drm/i915/i915_vma.c                    |    21 +-
 drivers/gpu/drm/i915/i915_vma.h                    |    13 +-
 drivers/gpu/drm/i915/i915_vma_types.h              |     7 +-
 drivers/gpu/drm/i915/intel_device_info.h           |     1 +
 drivers/gpu/drm/i915/intel_dram.c                  |    36 +-
 drivers/gpu/drm/i915/intel_memory_region.c         |    12 +
 drivers/gpu/drm/i915/intel_memory_region.h         |     4 +
 drivers/gpu/drm/i915/intel_pcode.c                 |   235 +
 drivers/gpu/drm/i915/intel_pcode.h                 |    26 +
 drivers/gpu/drm/i915/intel_pm.c                    |   307 +-
 drivers/gpu/drm/i915/intel_pm.h                    |     3 +-
 drivers/gpu/drm/i915/intel_runtime_pm.h            |     2 -
 drivers/gpu/drm/i915/intel_sbi.c                   |    73 +
 drivers/gpu/drm/i915/intel_sbi.h                   |    23 +
 drivers/gpu/drm/i915/intel_sideband.c              |   577 -
 drivers/gpu/drm/i915/intel_uncore.c                |   447 +-
 drivers/gpu/drm/i915/intel_uncore.h                |    20 +-
 drivers/gpu/drm/i915/intel_wakeref.h               |    12 +
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |   299 +
 drivers/gpu/drm/i915/pxp/intel_pxp.h               |    64 +
 drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c           |   141 +
 drivers/gpu/drm/i915/pxp/intel_pxp_cmd.h           |    15 +
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c       |    78 +
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h       |    21 +
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c           |   101 +
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.h           |    32 +
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c            |    46 +
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.h            |    24 +
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c       |   175 +
 drivers/gpu/drm/i915/pxp/intel_pxp_session.h       |    15 +
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           |   172 +
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.h           |    17 +
 drivers/gpu/drm/i915/pxp/intel_pxp_tee_interface.h |    36 +
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h         |    83 +
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |     8 +-
 .../gpu/drm/i915/selftests/i915_live_selftests.h   |     2 +
 drivers/gpu/drm/i915/selftests/i915_vma.c          |     4 +-
 .../drm/i915/selftests/intel_scheduler_helpers.c   |    12 +
 .../drm/i915/selftests/intel_scheduler_helpers.h   |     2 +
 drivers/gpu/drm/i915/selftests/intel_uncore.c      |    34 +-
 drivers/gpu/drm/i915/selftests/mock_region.c       |     2 -
 drivers/gpu/drm/i915/vlv_sideband.c                |   266 +
 .../drm/i915/{intel_sideband.h =3D> vlv_sideband.h}  |    34 +-
 drivers/gpu/drm/lima/lima_gem.c                    |     9 +-
 drivers/gpu/drm/lima/lima_sched.c                  |    28 +-
 drivers/gpu/drm/lima/lima_sched.h                  |     6 +-
 drivers/gpu/drm/mcde/mcde_drv.c                    |     4 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                    |     4 +-
 drivers/gpu/drm/meson/meson_drv.c                  |     3 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c              |     4 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |     2 -
 drivers/gpu/drm/mgag200/mgag200_mm.c               |    35 +-
 drivers/gpu/drm/msm/Kconfig                        |     6 +-
 drivers/gpu/drm/msm/Makefile                       |     1 -
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c          |     6 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |    10 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |     2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c       |   256 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   147 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |    19 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |    39 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |     4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |     2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |     8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |     8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |   267 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |    92 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |    56 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |    13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |     8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |     3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |    70 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |    13 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |     4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |    18 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |    89 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |    18 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c          |    12 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c  |     8 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                |    64 +-
 drivers/gpu/drm/msm/dp/dp_debug.c                  |   294 +-
 drivers/gpu/drm/msm/dp/dp_debug.h                  |     4 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |   143 +-
 drivers/gpu/drm/msm/dp/dp_display.h                |     2 +
 drivers/gpu/drm/msm/dp/dp_drm.c                    |    13 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  |     2 +-
 drivers/gpu/drm/msm/dp/dp_parser.c                 |   138 +-
 drivers/gpu/drm/msm/dp/dp_parser.h                 |    14 +-
 drivers/gpu/drm/msm/dsi/dsi.h                      |     2 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |   147 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |    66 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |     2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |     1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |    25 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |     4 +-
 drivers/gpu/drm/msm/edp/edp_ctrl.c                 |     5 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |    38 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |     6 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |    20 +-
 drivers/gpu/drm/msm/hdmi/hdmi_connector.c          |    24 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |    33 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c           |     4 +-
 drivers/gpu/drm/msm/msm_atomic.c                   |    21 +-
 drivers/gpu/drm/msm/msm_drv.c                      |    33 +-
 drivers/gpu/drm/msm/msm_drv.h                      |    31 +-
 drivers/gpu/drm/msm/msm_gem.c                      |     8 +-
 drivers/gpu/drm/msm/msm_gem.h                      |     5 -
 drivers/gpu/drm/msm/msm_gem_shrinker.c             |     2 +
 drivers/gpu/drm/msm/msm_gem_submit.c               |    35 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |     2 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |     7 +
 drivers/gpu/drm/msm/msm_gpu_devfreq.c              |    38 +-
 drivers/gpu/drm/msm/msm_kms.h                      |     3 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c               |    12 -
 drivers/gpu/drm/msm/msm_submitqueue.c              |     1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |     2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |     8 +-
 drivers/gpu/drm/nouveau/nouveau_sgdma.c            |     2 -
 drivers/gpu/drm/omapdrm/Kconfig                    |     3 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c                  |     4 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |     2 +-
 drivers/gpu/drm/panel/Kconfig                      |    27 +-
 drivers/gpu/drm/panel/Makefile                     |     2 +
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |   743 +-
 drivers/gpu/drm/panel/panel-edp.c                  |  1896 ++
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |    85 +-
 drivers/gpu/drm/panel/panel-samsung-s6d27a1.c      |   320 +
 drivers/gpu/drm/panel/panel-simple.c               |  1098 +-
 drivers/gpu/drm/panfrost/panfrost_device.c         |    10 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |    33 +-
 drivers/gpu/drm/panfrost/panfrost_job.c            |    48 +-
 drivers/gpu/drm/panfrost/panfrost_job.h            |     5 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |    42 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c        |     4 +-
 drivers/gpu/drm/qxl/qxl_release.c                  |     4 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                      |     1 -
 drivers/gpu/drm/r128/ati_pcigart.c                 |    11 +-
 drivers/gpu/drm/radeon/atombios.h                  |     2 +-
 drivers/gpu/drm/radeon/ci_dpm.c                    |     3 +-
 drivers/gpu/drm/radeon/r600_dpm.c                  |    10 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c             |     4 +-
 drivers/gpu/drm/radeon/radeon_fence.c              |    24 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |    15 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |     9 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h             |    11 -
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |   108 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h              |    26 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |    12 +-
 drivers/gpu/drm/rcar-du/rcar_du_group.c            |     6 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |    50 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.h              |     7 +
 drivers/gpu/drm/rcar-du/rcar_du_regs.h             |     9 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c              |    36 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |     4 +-
 drivers/gpu/drm/rockchip/Kconfig                   |     1 -
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |     2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |     4 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |     3 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |     4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |    14 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |     2 -
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |    33 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |    26 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |     2 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |   140 +-
 drivers/gpu/drm/scheduler/sched_fence.c            |    62 +-
 drivers/gpu/drm/scheduler/sched_main.c             |   199 +-
 drivers/gpu/drm/shmobile/shmob_drm_drv.c           |     4 +-
 drivers/gpu/drm/sti/sti_hqvdp.c                    |     4 +-
 drivers/gpu/drm/stm/ltdc.c                         |     7 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c              |     4 +-
 drivers/gpu/drm/sun4i/sun4i_frontend.c             |     4 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |     4 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |     4 +-
 drivers/gpu/drm/sun4i/sun4i_tv.c                   |     4 +-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             |    18 +-
 drivers/gpu/drm/sun4i/sun8i_csc.h                  |     4 +-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c              |    21 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c                |     4 +-
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c             |     4 +-
 drivers/gpu/drm/tegra/fb.c                         |     2 +-
 drivers/gpu/drm/tegra/plane.c                      |     2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |     4 +-
 drivers/gpu/drm/tiny/Kconfig                       |     4 +-
 drivers/gpu/drm/tiny/bochs.c                       |     8 +
 drivers/gpu/drm/ttm/ttm_bo.c                       |    71 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |    21 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |    15 +-
 drivers/gpu/drm/ttm/ttm_device.c                   |    48 +
 drivers/gpu/drm/ttm/ttm_module.c                   |    12 +
 drivers/gpu/drm/ttm/ttm_pool.c                     |    42 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c            |     8 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |    49 +
 drivers/gpu/drm/ttm/ttm_tt.c                       |    69 +-
 drivers/gpu/drm/udl/Kconfig                        |     1 +
 drivers/gpu/drm/v3d/Kconfig                        |     2 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |    15 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |    30 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |   473 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |    44 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |     5 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.h               |     1 -
 drivers/gpu/drm/vboxvideo/vbox_ttm.c               |    17 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                      |    15 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |     6 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |    28 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |     5 +-
 drivers/gpu/drm/vgem/vgem_drv.c                    |   342 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c           |     1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c               |    44 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |    36 +-
 drivers/gpu/drm/virtio/virtgpu_fence.c             |    30 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |   195 +-
 drivers/gpu/drm/virtio/virtgpu_kms.c               |    26 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c             |     3 +-
 drivers/gpu/drm/virtio/virtgpu_prime.c             |    32 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |    27 +-
 drivers/gpu/drm/virtio/virtgpu_vram.c              |    61 +
 drivers/gpu/drm/vmwgfx/ttm_memory.c                |     1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |    15 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |    10 +-
 drivers/gpu/drm/zte/Kconfig                        |    10 -
 drivers/gpu/drm/zte/Makefile                       |    10 -
 drivers/gpu/drm/zte/zx_common_regs.h               |    28 -
 drivers/gpu/drm/zte/zx_drm_drv.c                   |   184 -
 drivers/gpu/drm/zte/zx_drm_drv.h                   |    34 -
 drivers/gpu/drm/zte/zx_hdmi.c                      |   760 -
 drivers/gpu/drm/zte/zx_hdmi_regs.h                 |    66 -
 drivers/gpu/drm/zte/zx_plane.c                     |   537 -
 drivers/gpu/drm/zte/zx_plane.h                     |    26 -
 drivers/gpu/drm/zte/zx_plane_regs.h                |   120 -
 drivers/gpu/drm/zte/zx_tvenc.c                     |   400 -
 drivers/gpu/drm/zte/zx_tvenc_regs.h                |    27 -
 drivers/gpu/drm/zte/zx_vga.c                       |   527 -
 drivers/gpu/drm/zte/zx_vga_regs.h                  |    33 -
 drivers/gpu/drm/zte/zx_vou.c                       |   921 -
 drivers/gpu/drm/zte/zx_vou.h                       |    64 -
 drivers/gpu/drm/zte/zx_vou_regs.h                  |   212 -
 drivers/misc/mei/Kconfig                           |     2 +
 drivers/misc/mei/Makefile                          |     1 +
 drivers/misc/mei/pxp/Kconfig                       |    13 +
 drivers/misc/mei/pxp/Makefile                      |     7 +
 drivers/misc/mei/pxp/mei_pxp.c                     |   229 +
 drivers/misc/mei/pxp/mei_pxp.h                     |    18 +
 drivers/regulator/core.c                           |     2 +-
 drivers/usb/typec/altmodes/Kconfig                 |     1 +
 drivers/usb/typec/altmodes/displayport.c           |    58 +-
 drivers/video/fbdev/efifb.c                        |    21 +-
 include/drm/amd_asic_type.h                        |     1 +
 include/drm/drm_bridge.h                           |    23 +-
 include/drm/drm_connector.h                        |    37 +
 include/drm/drm_displayid.h                        |   101 +-
 include/drm/drm_dp_helper.h                        |    26 +
 include/drm/drm_dp_mst_helper.h                    |     5 +-
 include/drm/drm_edid.h                             |    47 +
 include/drm/drm_format_helper.h                    |     4 +
 include/drm/drm_ioctl.h                            |     1 -
 include/drm/drm_mipi_dsi.h                         |     4 +
 include/drm/drm_mode_config.h                      |    13 +-
 include/drm/drm_plane.h                            |     2 +-
 include/drm/drm_print.h                            |    30 +
 include/drm/drm_probe_helper.h                     |     1 +
 include/drm/gpu_scheduler.h                        |   188 +-
 include/drm/gud.h                                  |     6 +-
 include/drm/i915_component.h                       |     1 +
 include/drm/i915_pciids.h                          |     8 +-
 include/drm/i915_pxp_tee_interface.h               |    42 +
 include/drm/ttm/ttm_bo_api.h                       |    12 -
 include/drm/ttm/ttm_bo_driver.h                    |     2 +-
 include/drm/ttm/ttm_caching.h                      |    17 +
 include/drm/ttm/ttm_device.h                       |    79 +-
 include/drm/ttm/ttm_placement.h                    |     1 +
 include/drm/ttm/ttm_pool.h                         |     5 +-
 include/drm/ttm/ttm_range_manager.h                |    18 +-
 include/drm/ttm/ttm_resource.h                     |     9 +-
 include/drm/ttm/ttm_tt.h                           |    98 +-
 include/linux/dma-buf.h                            |     9 +-
 include/linux/dma-fence.h                          |    32 +-
 include/linux/dma-resv.h                           |   201 +-
 include/linux/io.h                                 |     5 +
 include/linux/seqno-fence.h                        |   109 -
 include/linux/shrinker.h                           |     1 +
 include/linux/ww_mutex.h                           |    15 +-
 include/uapi/drm/amdgpu_drm.h                      |    13 +-
 include/uapi/drm/drm_fourcc.h                      |    12 +
 include/uapi/drm/drm_mode.h                        |     4 +
 include/uapi/drm/i915_drm.h                        |   242 +-
 include/uapi/drm/v3d_drm.h                         |    78 +
 include/uapi/drm/virtgpu_drm.h                     |    27 +
 include/uapi/linux/virtio_gpu.h                    |    18 +-
 kernel/locking/mutex.c                             |    41 +
 kernel/locking/test-ww_mutex.c                     |    86 +-
 kernel/locking/ww_rt_mutex.c                       |    25 +
 lib/devres.c                                       |    82 +
 lib/locking-selftest.c                             |     2 +-
 mm/vmscan.c                                        |    15 +
 992 files changed, 82016 insertions(+), 26512 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/gpu.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/gpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/panel-edp.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
 delete mode 100644 Documentation/gpu/rfc/i915_parallel_execbuf.h
 delete mode 100644 drivers/dma-buf/seqno-fence.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_umr.h
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/beige_goby_reg_init.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/cyan_skillfish_reg_init.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/navi10_reg_init.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/navi12_reg_init.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/navi14_reg_init.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/sienna_cichlid_reg_init.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/vangogh_reg_init.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/yellow_carp_reg_init.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dccg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dccg.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hubbub.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hubbub.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hubp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hubp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_init.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_init.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_link_encod=
er.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_link_encod=
er.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_mpc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_mpc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_opp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_opp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_optc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_optc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_afmt.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_afmt.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_link_encoder.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_link_encoder.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_vpg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_vpg.h
 rename drivers/gpu/drm/amd/display/dc/dml/{dcn2x/dcn2x.c =3D>
dcn20/dcn20_fpu.c} (99%)
 rename drivers/gpu/drm/amd/display/dc/dml/{dcn2x/dcn2x.h =3D>
dcn20/dcn20_fpu.h} (94%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.h
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dml}/dsc/qp_tables.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/inc/dc_link_dpia.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.h
 create mode 100755 drivers/gpu/drm/amd/include/asic_reg/clk/clk_11_0_1_off=
set.h
 create mode 100755
drivers/gpu/drm/amd/include/asic_reg/clk/clk_11_0_1_sh_mask.h
 create mode 100755 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_2_0_3_offs=
et.h
 create mode 100755 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_2_0_3_sh_m=
ask.h
 create mode 100755
drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_2_0_3_offset.h
 create mode 100755
drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_2_0_3_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_11_0_8_sh_ma=
sk.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_backlight.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_backlight.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dpt.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dpt.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_drrs.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_drrs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_fb_pin.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_fb_pin.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_plane_initial.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_plane_initial.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.h
 delete mode 100644 drivers/gpu/drm/i915/gem/selftests/i915_gem_execbuffer.=
c
 delete mode 100644 drivers/gpu/drm/i915/gt/debugfs_engines.h
 delete mode 100644 drivers/gpu/drm/i915/gt/debugfs_gt.c
 delete mode 100644 drivers/gpu/drm/i915/gt/debugfs_gt_pm.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
 rename drivers/gpu/drm/i915/gt/{debugfs_gt.h =3D> intel_gt_debugfs.h} (58%=
)
 rename drivers/gpu/drm/i915/gt/{debugfs_engines.c =3D>
intel_gt_engines_debugfs.c} (70%)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.h
 rename drivers/gpu/drm/i915/gt/{debugfs_gt_pm.c =3D> intel_gt_pm_debugfs.c=
} (79%)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
 create mode 100644 drivers/gpu/drm/i915/intel_pcode.c
 create mode 100644 drivers/gpu/drm/i915/intel_pcode.h
 create mode 100644 drivers/gpu/drm/i915/intel_sbi.c
 create mode 100644 drivers/gpu/drm/i915/intel_sbi.h
 delete mode 100644 drivers/gpu/drm/i915/intel_sideband.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_cmd.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_irq.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_session.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_session.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_tee.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_tee_interface.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_types.h
 create mode 100644 drivers/gpu/drm/i915/vlv_sideband.c
 rename drivers/gpu/drm/i915/{intel_sideband.h =3D> vlv_sideband.h} (77%)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
 create mode 100644 drivers/gpu/drm/panel/panel-edp.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6d27a1.c
 delete mode 100644 drivers/gpu/drm/zte/Kconfig
 delete mode 100644 drivers/gpu/drm/zte/Makefile
 delete mode 100644 drivers/gpu/drm/zte/zx_common_regs.h
 delete mode 100644 drivers/gpu/drm/zte/zx_drm_drv.c
 delete mode 100644 drivers/gpu/drm/zte/zx_drm_drv.h
 delete mode 100644 drivers/gpu/drm/zte/zx_hdmi.c
 delete mode 100644 drivers/gpu/drm/zte/zx_hdmi_regs.h
 delete mode 100644 drivers/gpu/drm/zte/zx_plane.c
 delete mode 100644 drivers/gpu/drm/zte/zx_plane.h
 delete mode 100644 drivers/gpu/drm/zte/zx_plane_regs.h
 delete mode 100644 drivers/gpu/drm/zte/zx_tvenc.c
 delete mode 100644 drivers/gpu/drm/zte/zx_tvenc_regs.h
 delete mode 100644 drivers/gpu/drm/zte/zx_vga.c
 delete mode 100644 drivers/gpu/drm/zte/zx_vga_regs.h
 delete mode 100644 drivers/gpu/drm/zte/zx_vou.c
 delete mode 100644 drivers/gpu/drm/zte/zx_vou.h
 delete mode 100644 drivers/gpu/drm/zte/zx_vou_regs.h
 create mode 100644 drivers/misc/mei/pxp/Kconfig
 create mode 100644 drivers/misc/mei/pxp/Makefile
 create mode 100644 drivers/misc/mei/pxp/mei_pxp.c
 create mode 100644 drivers/misc/mei/pxp/mei_pxp.h
 create mode 100644 include/drm/i915_pxp_tee_interface.h
 delete mode 100644 include/linux/seqno-fence.h
