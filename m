Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76C36EC4EC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 07:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2C310E198;
	Mon, 24 Apr 2023 05:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBBC10E141
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 05:42:01 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-94a34a14a54so720702766b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 22:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682314916; x=1684906916;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2D5TjkfW0EOWe7XoFXbwaFRr7TijaRXiXVRkGsm7BNc=;
 b=MV/yeyllrAI1hr6bnIpXZl0440ipI2aYqXUCbmEVbz0v6UWMrnQgd9QTR6rxBbNhJ/
 FjJ4CNk3FNc4OVcssOIL/YPLWkny0p3tazZRyNbNTB5TnTN6MWhtAId+vAQfZ+7M8hcX
 ENRSeHmC0CcV4bpoDiZFekF49WcXkQv8LM2NhO6ugw7bOuJQTHhsY2utraEUqi3t2DNL
 GhPecxBTcFbmIY0Hi//tTJlO7xIXm8hQdbdne8lkiOntX0Z44xpUMsgzpCC4BlejzasV
 SbH6Wn5CIeHyI/pXIHhCtNR9l9vI1RQ3X71rIdCK8SYl0JQXwRH6twc5RQDK7mgCKVe+
 zIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314916; x=1684906916;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2D5TjkfW0EOWe7XoFXbwaFRr7TijaRXiXVRkGsm7BNc=;
 b=lQ6c2fjIlf8ZEU/9sIjEpAVPHTAujMHheeBrXGBzzO8pTpHxr+cDF+1skmjzID+oIB
 +XKfA6NBmg3qFum1+ZsjidpvIUONoozErQriLKNowO/tvEp/mxBRmY7HRT58EiyBrC3+
 ypx8W99gNKdyZdzf/pRX8SmY3viO0SE44Bu/k/KheJiISprqWSgB3Asc4eJdOkDZKVCV
 w6Ru25uGtuaWu20mP/Ufy3yaLbbMW9hqsy0chB2bDkudud1+rdXsvuJidpICjmZfQ37m
 bwZhFLk8gWdpS+g3cqC6uxbLCYosKJ8WotnzLhoQlcE09JHLXAy45+6x0zVvYZ8Yuecr
 xYDQ==
X-Gm-Message-State: AAQBX9cYCF/O2zqnKRdlfk6dZ6vchk7MXosByUZrBjHHgGSc5Fr/XKgC
 2Ji9sdLMSOFZ989KVD0zP8CoApFbCK43vbsmmfPzx/dzVW0=
X-Google-Smtp-Source: AKy350bbM65nWsazVBEVfNM1yQYyj2Dfuqi0hBQWZAqr1B0ArbHHrvikQaOC+pt8jgtl0V0gYGzQViu3X4EQfcLNXIk=
X-Received: by 2002:a17:906:7054:b0:956:fbd7:bc5e with SMTP id
 r20-20020a170906705400b00956fbd7bc5emr10918161ejj.64.1682314915234; Sun, 23
 Apr 2023 22:41:55 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 24 Apr 2023 15:41:41 +1000
Message-ID: <CAPM=9txgxnFundgAa9LrveUVUU9_8A1RK8-hy+3pg7tDMJmSPQ@mail.gmail.com>
Subject: [git pull] drm for 6.4-rc1
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

This is the main drm pull request for 6.4-rc1.

Not a huge amount going on in this, I've been off for 3 weeks in the
middle, but I think we've landed everything pending.

I did a trial merge 6.3 final and there were 4 minor fixups, however I
expect there might be conflicts against trees as you pull them.

One vs the powerpc tree that -next has possibly wrong is:
https://lore.kernel.org/all/20230413184725.GA3183133@dev-arch.thelio-3990X/

Other than that there is a new Qualcomm accel driver for their QAIC,
dma-fence got a deadline feature added, lots of refactoring around
fbdev emulation, and the usual pre-release hw enablements from AMD and
Intel and fixes everywhere.

Let me know if there's any problems,
Dave.

drm-next-2023-04-24:
drm next for 6.4-rc1

New drivers:
- add QAIC acceleration driver

dma-buf:
- constify kobj_type structs
- Reject prime DMA-Buf attachment if get_sg_table is missing.

fbdev:
- cmdline parser fixes
- implement fbdev emulation for GEM DMA drivers
- always use shadow buffer in fbdev emulation helpers

dma-fence:
- add deadline hint to fences
- signal private stub fence

core:
- improve DisplayID 2.0 and EDID parsing
- add gem eviction function + callback
- prep to convert shmem helper to GEM resv lock
- move suballocator from radeon/amdgpu to core for Xe
- HPD polling fixes
- Documentation improvements
- Add atomic enable_plane callback
- use tgid instead of pid for client tracking
- DP: Add SDP Error Detection Configuration Register
- Add prime import/export to vram-helper
- use pci aperture helpers in more drivers

panel:
- Radxa 8/10HD support
- Samsung AMD495QA01 support
- Elida KD50T048A
- Sony TD4353
- Novatek NT36523
- STARRY 2081101QFH032011-53G
- B133UAN01.0
- AUO NE135FBM-N41

i915:
- More MTL enabling
- fix s/r problems with MEI/PXP
- Implement fb_dirty for PSR,FBC,DRRS fixes
- Fix eDP+DSI dual panel systems
- Fix issue #6333: "list_add corruption" and full system lockup from
  performance monitoring
- Don't use stolen memory or BAR for ring buffers on LLC platforms
- Make sure DSM size has correct 1MiB granularity on Gen12+
- Whitelist COMMON_SLICE_CHICKEN3 for UMD access on Gen12+
- Add engine TLB invalidation for Meteorlake
- Fix GSC races on driver load/unload on Meteorlake+
- Make kobj_type structures constant
- Move fd_install after last use of fence
- wm/vblank refactoring
- display code refactoring
- Create GSC submission targeting HDCP and PXP usages on MTL+
- Enable HDCP2.x via GSC CS
- Fix context runtime accounting on sysfs fdinfo for heavy workloads
- Use i915 instead of dev_priv insied the file_priv structure
- Replace fake flex-array with flexible-array member

amdgpu:
- Make kobj structures const
- Generalize dmabuf import to work with KFD
- Add capped/uncapped workload handling for supported APUs
- Expose additional memory stats via fdinfo
- Register vga_switcheroo for apple-gmux
- Initial NBIO7.9, GC 9.4.3, GFXHUB 1.2, MMHUB 1.8 support
- Initial DC FAM infrastructure
- Link DC backlight to connector device rather than PCI device
- Add sysfs nodes for secondary VCN clocks

amdkfd:
- Make kobj structures const
- Support for exporting buffers via dmabuf
- Multi-VMA page migration fixes
- initial GC 9.4.3 support

radeon:
- iMac fix
- convert to client based fbdev emulation

habanalabs:
- Add opcodes to the CS ioctl to allow user to stall/resume specific engine=
s
  inside Gaudi2.
- INFO ioctl the amount of device memory that the driver
  and f/w reserve for themselves.
- INFO ioctl a bit-mask of the available rotator engines
- INFO ioctl the register's address of the f/w that should
  be used to trigger interrupts
- INFO ioctl two new opcodes to fetch information on h/w and f/w events
- Enable graceful reset mechanism for compute-reset.
- Align to the latest firmware specs.
- Enforce the release order of the compute device and dma-buf.

msm:
- UBWC decoder programming rework
- SM8550, SM8450 bindings update
- uapi C++ fix
- a3xx and a4xx devfreq support
- GPU and GEM updates to avoid allocations which could trigger
  reclaim (shrinker) in fence signaling path
- dma-fence deadline hint support and wait-boost
- a640/650 speed bin support

cirrus:
- convert to regular atomic helpers
- add damage clipping

mediatek:
- 10-bit overlay support
- mt8195 support
- Only trigger DRM HPD events if bridge is attached
- Change the aux retries times when receiving AUX_DEFER

rockchip:
- add 4K support

vc4:
- use drm_gem_objects

virtio:
- allow KMS support to be disabled
- add damage clipping

vmwgfx:
- buffer object lifetime fixes

exynos:
- move MIPI DSI driver to drm bridge for iMX sharing
- use kernel fbdev emulation

panfrost:
- add support for mali MT81xx devices
- add speed binning support

lima:
- add usage stats

tegra:
- fbdev client conversion

vkms:
- Add primary plane positioning support
The following changes since commit 197b6b60ae7bc51dd0814953c562833143b292aa=
:

  Linux 6.3-rc4 (2023-03-26 14:40:20 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2023-04-24

for you to fetch changes up to 289af45508ca890585f329376d16e08f41f75bd5:

  Merge tag 'exynos-drm-next-for-v6.4-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-next (2023-04-24 10:50:15 +1000)

----------------------------------------------------------------
drm next for 6.4-rc1

New drivers:
- add QAIC acceleration driver

dma-buf:
- constify kobj_type structs
- Reject prime DMA-Buf attachment if get_sg_table is missing.

fbdev:
- cmdline parser fixes
- implement fbdev emulation for GEM DMA drivers
- always use shadow buffer in fbdev emulation helpers

dma-fence:
- add deadline hint to fences
- signal private stub fence

core:
- improve DisplayID 2.0 and EDID parsing
- add gem eviction function + callback
- prep to convert shmem helper to GEM resv lock
- move suballocator from radeon/amdgpu to core for Xe
- HPD polling fixes
- Documentation improvements
- Add atomic enable_plane callback
- use tgid instead of pid for client tracking
- DP: Add SDP Error Detection Configuration Register
- Add prime import/export to vram-helper
- use pci aperture helpers in more drivers

panel:
- Radxa 8/10HD support
- Samsung AMD495QA01 support
- Elida KD50T048A
- Sony TD4353
- Novatek NT36523
- STARRY 2081101QFH032011-53G
- B133UAN01.0
- AUO NE135FBM-N41

i915:
- More MTL enabling
- fix s/r problems with MEI/PXP
- Implement fb_dirty for PSR,FBC,DRRS fixes
- Fix eDP+DSI dual panel systems
- Fix issue #6333: "list_add corruption" and full system lockup from
  performance monitoring
- Don't use stolen memory or BAR for ring buffers on LLC platforms
- Make sure DSM size has correct 1MiB granularity on Gen12+
- Whitelist COMMON_SLICE_CHICKEN3 for UMD access on Gen12+
- Add engine TLB invalidation for Meteorlake
- Fix GSC races on driver load/unload on Meteorlake+
- Make kobj_type structures constant
- Move fd_install after last use of fence
- wm/vblank refactoring
- display code refactoring
- Create GSC submission targeting HDCP and PXP usages on MTL+
- Enable HDCP2.x via GSC CS
- Fix context runtime accounting on sysfs fdinfo for heavy workloads
- Use i915 instead of dev_priv insied the file_priv structure
- Replace fake flex-array with flexible-array member

amdgpu:
- Make kobj structures const
- Generalize dmabuf import to work with KFD
- Add capped/uncapped workload handling for supported APUs
- Expose additional memory stats via fdinfo
- Register vga_switcheroo for apple-gmux
- Initial NBIO7.9, GC 9.4.3, GFXHUB 1.2, MMHUB 1.8 support
- Initial DC FAM infrastructure
- Link DC backlight to connector device rather than PCI device
- Add sysfs nodes for secondary VCN clocks

amdkfd:
- Make kobj structures const
- Support for exporting buffers via dmabuf
- Multi-VMA page migration fixes
- initial GC 9.4.3 support

radeon:
- iMac fix
- convert to client based fbdev emulation

habanalabs:
- Add opcodes to the CS ioctl to allow user to stall/resume specific engine=
s
  inside Gaudi2.
- INFO ioctl the amount of device memory that the driver
  and f/w reserve for themselves.
- INFO ioctl a bit-mask of the available rotator engines
- INFO ioctl the register's address of the f/w that should
  be used to trigger interrupts
- INFO ioctl two new opcodes to fetch information on h/w and f/w events
- Enable graceful reset mechanism for compute-reset.
- Align to the latest firmware specs.
- Enforce the release order of the compute device and dma-buf.

msm:
- UBWC decoder programming rework
- SM8550, SM8450 bindings update
- uapi C++ fix
- a3xx and a4xx devfreq support
- GPU and GEM updates to avoid allocations which could trigger
  reclaim (shrinker) in fence signaling path
- dma-fence deadline hint support and wait-boost
- a640/650 speed bin support

cirrus:
- convert to regular atomic helpers
- add damage clipping

mediatek:
- 10-bit overlay support
- mt8195 support
- Only trigger DRM HPD events if bridge is attached
- Change the aux retries times when receiving AUX_DEFER

rockchip:
- add 4K support

vc4:
- use drm_gem_objects

virtio:
- allow KMS support to be disabled
- add damage clipping

vmwgfx:
- buffer object lifetime fixes

exynos:
- move MIPI DSI driver to drm bridge for iMX sharing
- use kernel fbdev emulation

panfrost:
- add support for mali MT81xx devices
- add speed binning support

lima:
- add usage stats

tegra:
- fbdev client conversion

vkms:
- Add primary plane positioning support

----------------------------------------------------------------
Aaron Liu (1):
      drm/amdgpu: skip kfd-iommu suspend/resume for S0ix

Abhinav Kumar (3):
      MAINTAINERS: Update the URI for MSM DRM bugs
      drm/msm/dpu: log the multirect_index in _dpu_crtc_blend_setup_pipe
      drm/msm/dpu: remove unused dpu_plane_validate_multirect_v2 function

Adam Ford (1):
      drm/bridge: adv7533: Fix adv7533_mode_valid for adv7533 and adv7535

Adam Skladowski (1):
      drm: msm: adreno: Disable preemption on Adreno 510

Agustin Gutierrez (1):
      drm/amd/display: Keep PHY active for dp config

Akhil P Oommen (3):
      drm/msm/a6xx: Vote for cx gdsc from gpu driver
      drm/msm/a6xx: Remove cx gdsc polling using 'reset'
      drm/msm/a6xx: Use genpd notifier to ensure cx-gdsc collapse

Alan Previn (5):
      drm/i915/pxp: Invalidate all PXP fw sessions during teardown
      drm/i915/pxp: Trigger the global teardown for before suspending
      drm/i915/pxp: Pxp hw init should be in resume_complete
      drm/i915/gsc: Fix the Driver-FLR completion
      drm/i915/pxp: limit drm-errors or warning on firmware API failures

Alex Deucher (10):
      drm/amdgpu: fix error checking in amdgpu_read_mm_registers for soc15
      drm/amdgpu: fix error checking in amdgpu_read_mm_registers for soc21
      drm/amdgpu: fix error checking in amdgpu_read_mm_registers for nv
      Revert "drm/amdgpu/display: change pipe policy for DCN 2.1"
      Revert "drm/amd/display: Pass proper parent for DM backlight
device registration"
      drm/amdgpu/nv: fix codec array for SR_IOV
      drm/amdgpu: drop the extra sign extension
      Revert "drm/amdgpu/display: change pipe policy for DCN 2.0"
      drm/amd/pm: enable TEMP_DEPENDENT_VMIN for navi1x
      drm/amdgpu: simplify amdgpu_ras_eeprom.c

Alex Hung (2):
      drm/amd/display: fix shift-out-of-bounds in CalculateVMAndRowBytes
      drm/amd/display: remove outdated 8bpc comments

Alexander Stein (2):
      drm/bridge: ti-sn65dsi83: use dev_err_probe if host attach failed
      drm/bridge: ti-sn65dsi86: Allow GPIO operations to sleep

Alexander Usyskin (3):
      mei: mei-me: resume device in prepare
      drm/i915/pxp: add device link between i915 and mei_pxp
      mei: clean pending read with vtag on bus

Alexandre Mergnat (1):
      dt-bindings: display: mediatek: clean unnecessary item

Alfredo Cruz (1):
      drm/rockchip: vop2: Add error check to devm_regmap_init_mmio

Alvin Lee (14):
      drm/amd/display: DAL to program DISPCLK WDIVIDER if PMFW doesn't
      drm/amd/display: When blanking during init loop to find OPP index
      drm/amd/display: Update to correct min FCLK when construction BB
      drm/amd/display: Pass tg and hubp inst instead of pipe index for SubV=
P
      drm/amd/display: Use DPP inst instead of pipe idx for DPP DTO program=
ming
      drm/amd/display: Enable FPO for configs that could reduce vlevel
      drm/amd/display: Update FCLK change latency
      drm/amd/display: Use per pipe P-State force for FPO
      drm/amd/display: Only keep cursor p-state force for FPO
      drm/amd/display: Enable FPO optimization
      drm/amd/display: Uncomment assignments after HW headers are promoted
      drm/amd/display: Clear FAMS flag if FAMS doesn't reduce vlevel
      drm/amd/display: Add FPO + VActive support
      drm/amd/display: On clock init, maintain DISPCLK freq

Alyssa Rosenzweig (3):
      drm/panfrost: Increase MAX_PM_DOMAINS to 5
      drm/panfrost: Add the MT8192 GPU ID
      drm/panfrost: Add mediatek,mt8192-mali compatible

Amber Lin (3):
      drm/amdkfd: Set noretry/xnack for GC 9.4.3
      drm/amdkfd: Set TG_CHUNK_SIZE for GC 9.4.3
      drm/amdkfd: Enable HW_UPDATE_RPTR on GC 9.4.3

Andi Shyti (4):
      drm/i915/gt: Rename dev_priv to i915 for private data naming consiste=
ncy
      drm/i915/gt: Create per-gt debugfs files
      drm/i915/debugfs: Enable upper layer interfaces to act on all gt's
      drm/i915: Use i915 instead of dev_priv insied the file_priv structure

Andrea Righi (1):
      drm/i915/sseu: fix max_subslices array-index-out-of-bounds access

Andrzej Hajda (18):
      drm/i915/display/fdi: use intel_de_rmw if possible
      drm/i915/display/vlv: fix pixel overlap register update
      drm/i915/display/vlv: use intel_de_rmw if possible
      drm/i915/display/dsi: use intel_de_rmw if possible
      drm/i915: implement async_flip mode per plane tracking
      drm/i915/display/core: use intel_de_rmw if possible
      drm/i915/display/dpll: use intel_de_rmw if possible
      drm/i915/display/phys: use intel_de_rmw if possible
      drm/i915/display/pch: use intel_de_rmw if possible
      drm/i915/display/hdmi: use intel_de_rmw if possible
      drm/i915/display/panel: use intel_de_rmw if possible in panel related=
 code
      drm/i915/display/interfaces: use intel_de_rmw if possible
      drm/i915/display/misc: use intel_de_rmw if possible
      drm/i915/display/power: use intel_de_rmw if possible
      drm/i915/gt: prevent forcewake releases during BAR resize
      drm/i915/gt: introduce vm->scratch_range callback
      drm/i915: add guard page to ggtt->error_capture
      drm/i915/gt: perform uc late init after probe error injection

Andrzej Kacprowski (2):
      accel/ivpu: Fix FW API data alignment issues
      accel/ivpu: Send VPU_JSM_MSG_CONTEXT_DELETE when deleting context

AngeloGioacchino Del Regno (12):
      dt-bindings: gpu: mali-bifrost: Split out MediaTek power-domains vari=
ation
      dt-bindings: gpu: mali-bifrost: Set power-domains maxItems to 5
      dt-bindings: gpu: mali-bifrost: Fix power-domain-names validation
      dt-bindings: gpu: mali-bifrost: Add sub-schema for MT8192's power dom=
ains
      dt-bindings: gpu: mali-bifrost: Add new MT8183 compatible
      dt-bindings: gpu: mali-bifrost: Add support for MediaTek MT8186
      dt-bindings: gpu: mali-bifrost: Add compatible for MT8195 SoC
      drm/panfrost: Add new compatible for Mali on the MT8183 SoC
      drm/panfrost: Add support for Mali on the MT8186 SoC
      dt-bindings: gpu: mali-bifrost: Document nvmem for speedbin support
      drm/panfrost: Add basic support for speed binning
      drm/panel-edp: Add AUO NE135FBM-N41 v8.1 panel entry

Ankit Nautiyal (5):
      drm/i915/hdmi: Go for scrambling only if platform supports TMDS
clock > 340MHz
      drm/i915/dg2: Add HDMI pixel clock frequencies 267.30 and 319.89 MHz
      drm/i915/dp: Don't roundup max bpp, while computing compressed bpp
      drm/dp_helper: Add helper to check DSC support with given o/p format
      drm/i915/dp: Check if DSC supports the given output_format

Anshuman Gupta (3):
      drm/i915/selftest: Fix engine timestamp and ktime disparity
      drm/i915/selftest: Fix ktime_get() and h/w access order
      drm/i915/hdcp: Use generic names for HDCP helpers and structs

Anthony Koo (3):
      drm/amd/display: [FW Promotion] Release 0.0.158.0
      drm/amd/display: [FW Promotion] Release 0.0.160.0
      drm/amd/display: [FW Promotion] Release 0.0.161.0

Aravind Iddamsetty (2):
      drm/i915: Initialize the obj flags for shmem objects
      drm/i915/pcode: Give the punit time to settle before fatally failing

Aric Cyr (12):
      drm/amd/display: Reduce CPU busy-waiting for long delays
      Revert "drm/amd/display: Do not set DRR on pipe commit"
      Revert "drm/amd/display: Fix FreeSync active bit issue"
      drm/amd/display: Only wait for blank completion if OTG active
      drm/amd/display: Do not update DRR while BW optimizations pending
      drm/amd/display: Promote DAL to 3.2.224
      drm/amd/display: 3.2.225
      drm/amd/display: 3.2.226
      drm/amd/display: 3.2.227
      drm/amd/display: 3.2.228
      drm/amd/display: Promote DAL to 3.2.229
      drm/amd/display: 3.2.230

Arnd Bergmann (4):
      accel/ivpu: PM: remove broken ivpu_dbg() statements
      accel: fix CONFIG_DRM dependencies
      accel/ivpu: avoid duplicate assignment
      drm/msm/a6xx: add CONFIG_PM dependency

Artem Grishin (2):
      drm/amd/display: Add support for 6.75 GBps link rate
      drm/amd/display: Conditionally enable 6.75 GBps link rate

Arthur Grillo (4):
      drm/amd/display: Remove unused local variables
      drm/amd/display: Remove unused local variables and function
      drm/format-helper: Add Kunit tests for drm_fb_xrgb8888_to_mono()
      drm/format-helper: Make "destination_pitch" test usable for mono

Arun R Murthy (2):
      drm: Add SDP Error Detection Configuration Register
      i915/display/dp: SDP CRC16 for 128b132b link layer

Arvind Yadav (1):
      drm/amdgpu: add new parameters in v11_struct

Asahi Lina (2):
      drm/shmem-helper: Fix locking for drm_gem_shmem_get_pages_sgt()
      drm/scheduler: Fix UAF race in drm_sched_entity_push_job()

Ashutosh Dixit (7):
      drm/i915/hwmon: Enable PL1 power limit
      Revert "drm/i915/hwmon: Enable PL1 power limit"
      drm/i915/hwmon: Replace hwm_field_scale_and_write with hwm_power_max_=
write
      drm/i915/hwmon: Enable PL1 limit when writing limit value to HW
      drm/i915/hwmon: Accept writes of value 0 to power1_max_interval
      drm/i915/pmu: Use functions common with sysfs to read actual freq
      drm/i915/hwmon: Use 0 to designate disabled PL1 power limit

Aurabindo Pillai (1):
      drm/amd/display: fix clock sequence logic for DCN32

Ayush Gupta (3):
      drm/amd/display: populate subvp cmd info only for the top pipe
      drm/amd/display: disconnect MPCC only on OTG change
      drm/amd/display: fixed dcn30+ underflow issue

Badal Nilawar (1):
      drm/i915/mtl: Disable MC6 for MTL A step

Bagas Sanjaya (2):
      drm/i915/doc: Escape wildcard in method names
      accel: Link to compute accelerator subsystem intro

Ben Dooks (1):
      drm/nouveau/mc/ga100: make ga100_mc_device static

Benjamin Cheng (1):
      drm/amd/display: Write to correct dirty_rect

Bhawanpreet Lakha (1):
      drm/amd/display: Fix HDCP failing to enable after suspend

Bill Liu (1):
      drm/amdgpu: Adding CAP firmware initialization

Bjorn Andersson (1):
      drm/panel-edp: Add B133UAN01.0 edp panel entry

Bjorn Helgaas (2):
      drm/amdgpu: Drop redundant pci_enable_pcie_error_reporting()
      accel/habanalabs: Drop redundant pci_enable_pcie_error_reporting()

Brian Norris (1):
      drm/rockchip: vop: Quiet always-warning AFBC log

B=C5=82a=C5=BCej Szczygie=C5=82 (1):
      drm/amd/pm: Fix sienna cichlid incorrect OD volage after resume

Cai Huoqing (4):
      drm/tegra: sor: Make use of the helper function dev_err_probe()
      drm/tegra: dsi: Make use of the helper function dev_err_probe()
      drm/tegra: plane: Improve use of dev_err_probe()
      accel/habanalabs: Remove redundant pci_clear_master

Caio Novais (3):
      drm/scheduler: Fix variable name in function description
      drm/amd/display: Remove unused variable 'scl_enable'
      drm/amd/display: Mark function
'optc3_wait_drr_doublebuffer_pending_clear' as static

Candice Li (3):
      drm/amdgpu: Make umc_v8_10_convert_error_address static and
remove unused variable
      drm/amdgpu: Support umc node harvest config on umc v8_10
      drm/amd/pm: Enable ecc_info table support for smu v13_0_10

Carlo Caione (1):
      drm/meson/meson_venc: Relax the supported mode checks

Chaitanya Kumar Borah (4):
      drm/i915/adlp: Fix typo for reference clock
      drm/i915: Add RPL-U sub platform
      drm/i915/display: Add 480 MHz CDCLK steps for RPL-U
      drm/i915/color: Fix typo for Plane CSC indexes

Charlene Liu (5):
      drm/amd/display: update dio for two pixel per container case
      drm/amd/display: Add CRC and DMUB test support
      drm/amd/display: add missing code change init pix_per_cycle
      drm/amd/display: update dig enable sequence
      drm/amd/display: add dscclk instance offset check

Chen-Yu Tsai (1):
      drm/mediatek: dp: Only trigger DRM HPD events if bridge is attached

Chia-I Wu (2):
      drm/amdkfd: fix a potential double free in pqm_create_queue
      drm/amdkfd: fix potential kgd_mem UAFs

Chris Morgan (3):
      drm: of: Add drm_of_get_dsi_bus helper function
      dt-bindings: display: panel: Add Samsung AMS495QA01
      drm/panel: Add Magnachip D53E6EA8966 Panel Driver

Chris Park (1):
      drm/amd/display: Simplify register offsets

Chris Wilson (4):
      drm/i915/gt: Add selftests for TLB invalidation
      drm/i915/gem: Flush lmem contents after construction
      drm/i915/perf: Drop wakeref on GuC RC error
      drm/i915/gt: Hold a wakeref for the active VM

Christian K=C3=B6nig (9):
      drm/ttm: stop allocating dummy resources during BO creation
      drm/ttm: stop allocating a dummy resource for pipelined gutting
      drm/ttm: prevent moving of pinned BOs
      drm: remove dumb_destroy callback
      drm/amdgpu: stop waiting in amdgpu_uvd_send_msg
      drm/amdgpu: simplify amdgpu_uvd_send_msg
      drm: remove drm_dev_set_unique
      drm/tegra: Allow compile test on !ARM v2
      drm/tegra: Fix another missing include

Christophe JAILLET (1):
      drm/amd/display: Slightly optimize dm_dmub_outbox1_low_irq()

Clint Taylor (1):
      drm/i915/audio: update audio keepalive clock values

Colin Ian King (3):
      accel/habanalabs: Fix spelling mistake "maped" -> "mapped"
      drm/msm/mdss: Fix spelling mistake "Unuspported" -> "Unsupported"
      drm/msm/dp: Fix spelling mistake "Capabiity" -> "Capability"

Cong Liu (1):
      drm/i915: Fix memory leaks in i915 selftests

Cruise Hung (1):
      drm/amd/display: Fix DP MST sinks removal issue

Dafna Hirschfeld (14):
      accel/habanalabs: tiny refactor of hl_device_reset for readability
      accel/habanalabs: in hl_device_reset remove 'hard_instead_of_soft'
      accel/habanalabs: in hl_device_reset small refactor for readabilty
      accel/habanalabs: don't trace cpu accessible dma alloc/free
      accel/habanalabs: change hw_fini to return int to indicate error
      accel/habanalabs: assert return value of hw_fini
      accel/habanalabs: allow getting HL_INFO_DRAM_USAGE during soft-reset
      accel/habanalabs: unify err log of hw-fini failure in dirty state
      accel/habanalabs: move soft-reset wait to soft-reset execute
      accel/habanalabs: in hw_fini return error code if polling timed-out
      accel/habanalabs: fix use of var reset_sleep_ms
      accel/habanalabs: in {e/p}dma_core events read the err cause reg
      accel/habanalabs: check return value of add_va_block_locked
      accel/habanalabs: improvements to FW ver extraction

Dan Carpenter (3):
      drm/simpledrm: Fix an NULL vs IS_ERR() bug
      drm: rcar-du: Fix a NULL vs IS_ERR() bug
      drm/panel: magnachip: Prevent error pointer dereference in probe

Dani Liberman (5):
      accel/habanalabs: fix address decode RAZWI handling
      accel/habanalabs: fix page fault event clear
      accel/habanalabs: change razwi handle after fw fix
      accel/habanalabs: fix access error clear event
      accel/habanalabs: fix handling of arc farm sei event

Daniel Phillips (1):
      amdkfd: Memory availability can never be negative

Daniel Vetter (24):
      Merge tag 'drm-misc-next-2023-03-23' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-next-2023-03-23' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-rcar-next-20230325' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux into
drm-next
      Merge tag 'exynos-drm-next-for-v6.4' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-next
      Merge tag 'dma-fence-deadline' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge v6.3-rc4 into drm-next
      Merge tag 'drm-misc-next-2023-03-31' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'amd-drm-next-6.4-2023-03-31' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      drm/ast: Use drm_aperture_remove_conflicting_pci_framebuffers
      staging/lynxfb: Use pci aperture helper
      fbdev/radeon: use pci aperture helpers
      drm/fb-helper: set x/yres_virtual in drm_fb_helper_check_var
      drm/fb-helper: drop redundant pixclock check from drm_fb_helper_set_p=
ar()
      drm/fb-helper: fix input validation gaps in check_var
      drm/atomic-helper: Don't set deadline for modesets
      Merge tag 'drm-intel-gt-next-2023-04-06' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-2023-04-06' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm/tegra/for-6.4-rc1' of
https://gitlab.freedesktop.org/drm/tegra into drm-next
      Merge tag 'drm-intel-next-2023-04-06' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-habanalabs-next-2023-04-10' of
https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux into
drm-next
      Merge tag 'drm-msm-next-2023-04-10' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'mediatek-drm-next-6.4' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-next
      Merge tag 'drm-misc-next-2023-04-12' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-next-fixes-2023-04-13' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next

Daniele Ceraolo Spurio (6):
      drm/i915/gsc: flush the GSC worker before wedging on unload
      drm/i915/gsc: Fix race between HW init and GSC FW load
      drm/i915/huc: Cancel HuC delayed load timer on reset.
      drm/i915: limit double GT reset to pre-MTL
      drm/i915/gsc: implement wa 14015076503
      drm/i915/mtl: Fix MTL stolen memory GGTT mapping

Danilo Krummrich (1):
      dma-buf: actually set signaling bit for private stub fences

Danylo Piliaiev (1):
      drm/msm: Rename drm_msm_gem_submit_reloc::or in C++ code

Dave Airlie (9):
      Merge tag 'drm-misc-next-2023-03-07' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-next-2023-03-07' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'amd-drm-next-6.4-2023-03-17' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-2023-03-16' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-gt-next-2023-03-16' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-habanalabs-next-2023-03-20' of
https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux into
drm-next
      Merge tag 'amd-drm-next-6.4-2023-04-14' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-next-fixes-2023-04-20-1' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'exynos-drm-next-for-v6.4-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-next

David Belanger (1):
      drm/amdkfd: Fixed kfd_process cleanup on module exit.

David Tadokoro (3):
      drm/amd/display: add prefix to amdgpu_dm_plane.h functions
      drm/amd/display: remove legacy fields of dc_plane_cap struct
      drm/amd/display: add prefix to amdgpu_dm_crtc.h functions

Deepak R Varma (4):
      drm/arm/malidp: use sysfs_emit in show function callback
      drm/nouveau/hwmon: Use sysfs_emit in show function callsbacks
      drm/amd/display: Simplify same effect if/else blocks
      drm/tegra: sor: Remove redundant error logging

Diogo Ivo (1):
      drm/tegra: dsi: Clear enable register if powered by bootloader

Dmitry Baryshkov (69):
      drm/probe_helper: extract two helper functions
      drm/probe_helper: sort out poll_running vs poll_enabled
      drm/msm/adreno: stall translation on fault for all GPU families
      drm/msm/adreno: split a6xx fault handler into generic and a6xx parts
      drm/msm/a5xx: add devcoredump support to the fault handler
      drm/msm/mdss: convert UBWC setup to use match data
      drm/msm/mdss: add data for sc8180xp
      drm/msm/mdss: add the sdm845 data for completeness
      drm/msm/dpu: rename struct dpu_hw_pipe(_cfg) to dpu_hw_sspp(_cfg)
      drm/msm/dpu: move SSPP allocation to the RM
      drm/msm/dpu: move SSPP debugfs creation to dpu_kms.c
      drm/msm/dpu: drop EAGAIN check from dpu_format_populate_layout
      drm/msm/dpu: move pipe_hw to dpu_plane_state
      drm/msm/dpu: drop dpu_plane_pipe function
      drm/msm/dpu: introduce struct dpu_sw_pipe
      drm/msm/dpu: use dpu_sw_pipe for dpu_hw_sspp callbacks
      drm/msm/dpu: pass dpu_format to _dpu_hw_sspp_setup_scaler3()
      drm/msm/dpu: clean up SRC addresses when setting up SSPP for solid fi=
ll
      drm/msm/dpu: move stride programming to dpu_hw_sspp_setup_sourceaddre=
ss
      drm/msm/dpu: remove dpu_hw_fmt_layout from struct dpu_hw_sspp_cfg
      drm/msm/dpu: rename dpu_hw_sspp_cfg to dpu_sw_pipe_cfg
      drm/msm/dpu: drop src_split and multirect check from dpu_crtc_atomic_=
check
      drm/msm/dpu: don't use unsupported blend stages
      drm/msm/dpu: move the rest of plane checks to dpu_plane_atomic_check(=
)
      drm/msm/dpu: drop redundant plane dst check from dpu_crtc_atomic_chec=
k()
      drm/msm/dpu: rewrite plane's QoS-related functions to take
dpu_sw_pipe and dpu_format
      drm/msm/dpu: make _dpu_plane_calc_clk accept mode directly
      drm/msm/dpu: add dpu_hw_sspp_cfg to dpu_plane_state
      drm/msm/dpu: simplify dpu_plane_validate_src()
      drm/msm/dpu: rework dpu_plane_sspp_atomic_update()
      drm/msm/dpu: rework dpu_plane_atomic_check()
      drm/msm/dpu: rework plane CSC setting
      drm/msm/dpu: rework static color fill code
      drm/msm/dpu: split pipe handling from _dpu_crtc_blend_setup_mixer
      drm/msm/dpu: add support for wide planes
      drm/msm/dpu: populate SmartDMA features in hw catalog
      drm/msm/dpu: drop smart_dma_rev from dpu_caps
      Merge branch 'msm-next-lumag-dpu' into msm-next-lumag
      Merge branches 'msm-next-lumag-dp', 'msm-next-lumag-dsi',
'msm-next-lumag-mdp5' and 'msm-next-lumag-mdp4' into msm-next-lumag
      drm/msm/dpu: constify DSC data structures
      drm/msm/dpu: mark remaining pp data as const
      drm/msm/dpu: move UBWC/memory configuration to separate struct
      drm/msm/dpu: split SM8550 catalog entry to the separate file
      drm/msm/dpu: split SC8280XP catalog entry to the separate file
      drm/msm/dpu: split SC7280 catalog entry to the separate file
      drm/msm/dpu: split SM8350 catalog entry to the separate file
      drm/msm/dpu: split SM6115 catalog entry to the separate file
      drm/msm/dpu: split QCM2290 catalog entry to the separate file
      drm/msm/dpu: split SC7180 catalog entry to the separate file
      drm/msm/dpu: split SM8250 catalog entry to the separate file
      drm/msm/dpu: split SC8180X catalog entry to the separate file
      drm/msm/dpu: split SM8150 catalog entry to the separate file
      drm/msm/dpu: split MSM8998 catalog entry to the separate file
      drm/msm/dpu: split SDM845 catalog entry to the separate file
      drm/msm/dpu: duplicate sdm845 catalog entries
      drm/msm/dpu: duplicate sc7180 catalog entries
      drm/msm/dpu: duplicate sm8150 catalog entries
      drm/msm/dpu: duplicate sm8250 catalog entries
      drm/msm/dpu: duplicate sm8350 catalog entries
      drm/msm/dpu: expand sc8180x catalog
      drm/msm/dpu: expand sc7180 catalog
      drm/msm/dpu: expand sm6115 catalog
      drm/msm/dpu: expand sm8550 catalog
      drm/msm/dpu: use defined symbol for sc8280xp's maxwidth
      drm/msm/dpu: catalog: add comments regarding DPU_CTL_SPLIT_DISPLAY
      drm/msm/dpu: drop duplicate vig_sblk instances
      drm/msm/dpu: inline IRQ_n_MASK defines
      drm/msm/dpu: fetch DPU configuration from match data
      drm/msm/dpu: drop unused macros from hw catalog

Dmitry Osipenko (6):
      drm/gem: Add evict() callback to drm_gem_object_funcs
      drm/shmem-helper: Put booleans in the end of struct drm_gem_shmem_obj=
ect
      drm/shmem-helper: Switch to use drm_* debug helpers
      drm/shmem-helper: Don't use vmap_use_count for dma-bufs
      drm/shmem-helper: Switch to reservation lock
      drm/virtio: Fix handling CONFIG_DRM_VIRTIO_GPU_KMS option

Dmytro Laktyushkin (1):
      drm/amd/display: w/a for dcn315 inconsistent smu clock table

Dom Cobley (1):
      drm/probe-helper: Cancel previous job before starting new one

Douglas Anderson (3):
      drm/bridge: tc358762: Set pre_enable_prev_first
      drm/msm/dp: Clean up handling of DP AUX interrupts
      drm/msm/dp: Return IRQ_NONE for unhandled interrupts

Erico Nunes (3):
      drm/lima: add usage counting method to ctx_mgr
      drm/lima: allocate unique id per drm_file
      drm/lima: add show_fdinfo for drm usage stats

Evan Quan (1):
      drm/amd/pm: correct the pcie link state check for SMU13

Fabio Estevam (3):
      dt-bindings: display: seiko,43wvf1g: Add the 'enable-gpios' property
      drm/panel: seiko-43wvf1g: Add the 'enable-gpios' property
      dt-bindings: display: seiko,43wvf1g: Change the maintainer's contact

Fangzhi Zuo (2):
      drm/amd/display: Add DSC Support for Synaptics Cascaded MST Hub
      drm/amd/display: Take FEC Overhead into Timeslot Calculation

Fei Yang (1):
      drm/i915/selftests: keep same cache settings as timeline

Felix Kuehling (4):
      drm/amdgpu: Generalize KFD dmabuf import
      drm/amdkfd: Implement DMA buf fd export from KFD
      drm/amdgpu: Optimize end of non-contig VA ranges
      drm/amdgpu: Don't resume IOMMU after incomplete init

Francesco Dolcini (1):
      drm/bridge: lt8912b: Fix DSI Video Mode

Gabe Teeger (1):
      drm/amd/display: Enable HostVM based on rIOMMU active

Geert Uytterhoeven (2):
      drivers: Restore alignment and newline in Makefile
      drm/msm/dpu: Fix bit-shifting UB in DPU_HW_VER() macro

Gerald Loacker (1):
      drm/rockchip: vop2: add polarity flags to RGB output

Graham Sider (2):
      drm/amdgpu: Enable GFX11 SDMA context empty interrupt
      drm/amdkfd: Add gfx_target_version for GC 9.4.3

Guchun Chen (3):
      drm/amdgpu: drop pm_sysfs_en flag from amdgpu_device structure
      drm/amdgpu: use drm_device pointer directly rather than convert again
      drm/amdgpu: move poll enabled/disable into non DC path

Guilherme G. Piccoli (2):
      drm/amdgpu/vcn: Disable indirect SRAM on Vangogh broken BIOSes
      drm/amd/pm: Fix incorrect comment about Vangogh power cap support

Gustavo A. R. Silva (1):
      drm/i915/uapi: Replace fake flex-array with flexible-array member

Gustavo Sousa (1):
      drm/i915/xelp: Implement Wa_1606376872

Hamza Mahfooz (2):
      drm/amd/display: use a more accurate check in dm_helpers_dp_read_dpcd=
()
      drm/amd/display: prep work for root clock optimization
enablement for DCN314

Hans de Goede (7):
      drm/amd/display: Pass proper parent for DM backlight device registrat=
ion
      drm/amd/display/amdgpu_dm: Fix backlight_device_register() error hand=
ling
      drm/amd/display/amdgpu_dm: Refactor register_backlight_device()
      drm/amd/display/amdgpu_dm: Add a bl_idx to amdgpu_dm_connector
      drm/amd/display/amdgpu_dm: Move most backlight setup into
setup_backlight_device()
      drm/amd/display/amdgpu_dm: Make
amdgpu_dm_register_backlight_device() take an amdgpu_dm_connector
      drm/amd/display/amdgpu_dm: Pass proper parent for backlight
device registration v3

Haridhar Kalvala (1):
      drm/i915/mtl: Add Wa_14017856879

Harry Wentland (14):
      drm/display: Don't block HDR_OUTPUT_METADATA on unknown EOTF
      drm/connector: print max_requested_bpc in state debugfs
      drm/amd/display: Don't restrict bpc to 8 bpc
      drm/amd/display: Format input and output CSC matrix
      drm/display: Don't block HDR_OUTPUT_METADATA on unknown EOTF
      drm/connector: print max_requested_bpc in state debugfs
      drm/amd/display: Drop CONFIG_DRM_AMD_DC_HDR
      drm/amd/display: Fix no-DCN build
      drm/amd/display: Drop CONFIG_DRM_AMD_DC_HDCP
      drm/amd/display: call remove_stream_from_ctx from res_pool funcs
      drm/amd/display: Build DSC without DCN config
      drm/amd/display: Drop unnecessary DCN guards
      drm/amd/display: Drop unnecessary DCN guards
      drm/amd/display: Rename DCN config to FP

Harshit Mogalapalli (1):
      drm/lima/lima_drv: Add missing unwind goto in lima_pdev_probe()

Hawking Zhang (41):
      drm/amdgpu: add IH ip block for IH 4.4.2
      drm/amdgpu: add hdp v4_4_2 ip headers
      drm/amdgpu: add HDP ip block for HDP 4.4.2
      drm/amdgpu: add sdma v4_4_2 ip headers
      drm/amdgpu: add psp early init for PSP 13.0.6
      drm/amdgpu: init sos microcode for psp v13_0_6
      drm/amdgpu: initialize ta ucode for psp v13_0_6
      drm/amdgpu: add PSP ip block for PSP 13.0.6
      drm/amdgpu: add mp v13_0_6 ip headers
      drm/amdgpu: Move jpeg ras block init to ras sw_init
      drm/amdgpu: Move vcn ras block init to ras sw_init
      drm/amdgpu: Move umc ras block init to gmc ras sw_init
      drm/amdgpu: Correct gfx ras_late_init callback
      drm/amdgpu: Move mmhub ras block init to ras sw_init
      drm/amdgpu: Move hdp ras block init to ras sw_init
      drm/amdgpu: Rework mca ras sw_init
      drm/amdgpu: Rework xgmi_wafl_pcs ras sw_init
      drm/amdgpu: Rework pcie_bif ras sw_init
      drm/amdgpu: drop ras check at asic level for new blocks
      drm/amdgpu: Move to common indirect reg access helper
      drm/amdgpu: Move to common helper to query soc rev_id
      drm/amdgpu: Retire pcie_gen3_enable function
      drm/amdgpu: Initialize umc ras callback
      drm/amdgpu: Add fatal error handling in nbio v4_3
      drm/amdgpu: add nbio v7_9_0 ip headers
      drm/amdgpu: add nbio v7_9 support
      drm/amdgpu: init nbio v7_9 callbacks
      drm/amdgpu: Set family for GC 9.4.3
      drm/amdgpu: add athub v1_8_0 ip headers
      drm/amdgpu: add osssys v4_4_2 ip headers
      drm/amdgpu: add gc v9_4_3 ip headers
      drm/amdgpu: add gmc ip block support for GC 9.4.3
      drm/amdgpu: add mmhub v1_8_0 ip headers
      drm/amdgpu: add GMC ip block for GC 9.4.3
      drm/amdgpu: Correct xgmi_wafl block name
      drm/amdkfd: Add GC 9.4.3 KFD support
      drm/amdgpu: drop temp programming for pagefault handling
      drm/amdgpu: add gc v9_4_3 rlc_funcs implementation
      drm/amdgpu: switch to v9_4_3 gfx_funcs callbacks for GC 9.4.3
      drm/amdgpu: add common early init support for GC 9.4.3
      drm/amdgpu: add common ip block for GC 9.4.3

Hersen Wu (4):
      drm/amd/display: dcn32/321 dsc_pg_control not executed properly
      drm/amd/display: align commit_planes_for_stream to latest dc code
      drm/amd/display: fix wrong index used in dccg32_set_dpstreamclk
      drm/amd/display: Set dcn32 caps.seamless_odm

Horatio Zhang (3):
      drm/amdgpu: fix ttm_bo calltrace warning in psp_hw_fini
      drm/amd/pm: correct SMU13.0.7 pstate profiling clock settings
      drm/amd/pm: correct SMU13.0.7 max shader clock reporting

Hsin-Yi Wang (1):
      drm/bridge: it6505: Add range and selector_reg

Husain Alshehhi (1):
      drivers/gpu: fix typo in comment

Igor Artemiev (1):
      drm/amd/display: Fix potential null dereference

Imre Deak (52):
      drm/i915: Fix system suspend without fbdev being initialized
      drm/i915: Move display power initialization during driver probing lat=
er
      drm/i915/dgfx, mtl+: Disable display functionality if the
display is not present
      drm/i915: Sanitize the display fused-off check on GEN7/8
      drm/i915/opregion: Fix opregion setup during system resume on
platforms without display
      drm/i915/opregion: Cleanup opregion after errors during driver loadin=
g
      drm/i915/opregion: Register display debugfs later, after
initialization steps
      drm/i915/opregion: Fix CONFIG_ACPI=3Dn builds adding missing
intel_opregion_cleanup() prototype
      drm/i915/tc: Abort DP AUX transfer on a disconnected TC port
      drm/i915/tc: Fix TC port link ref init for DP MST during HW readout
      drm/i915/tc: Fix the ICL PHY ownership check in TC-cold state
      drm/i915/tc: Fix system resume MST mode restore for DP-alt sinks
      drm/i915/tc: Wait for IOM/FW PHY initialization of legacy TC ports
      drm/i915/tc: Factor out helpers converting HPD mask to TC mode
      drm/i915/tc: Fix target TC mode for a disconnected legacy port
      drm/i915/tc: Fix TC mode for a legacy port if the PHY is not ready
      drm/i915/tc: Fix initial TC mode on disabled legacy ports
      drm/i915/tc: Make the TC mode readout consistent in all PHY states
      drm/i915/tc: Assume a TC port is legacy if VBT says the port has HDMI
      drm/i915: Add encoder hook to get the PLL type used by TC ports
      drm/i915/tc: Factor out a function querying active links on a TC port
      drm/i915/tc: Check the PLL type used by an enabled TC port
      drm/i915/tc: Group the TC PHY setup/query functions per platform
      drm/i915/tc: Use the adlp prefix for ADLP TC PHY functions
      drm/i915/tc: Rename tc_phy_status_complete() to tc_phy_is_ready()
      drm/i915/tc: Use the tc_phy prefix for all TC PHY functions
      drm/i915/tc: Move TC port fields to a new intel_tc_port struct
      drm/i915/tc: Check for TC PHY explicitly in
intel_tc_port_fia_max_lane_count()
      drm/i915/tc: Move the intel_tc_port struct declaration to intel_tc.c
      drm/i915/tc: Add TC PHY hook to get the PHY HPD live status
      drm/i915/tc: Add TC PHY hooks to get the PHY ready/owned state
      drm/i915/tc: Add TC PHY hook to read out the PHY HW state
      drm/i915/tc: Add generic TC PHY connect/disconnect handlers
      drm/i915/tc: Factor out tc_phy_verify_legacy_or_dp_alt_mode()
      drm/i915/tc: Add TC PHY hooks to connect/disconnect the PHY
      drm/i915/tc: Fix up the legacy VBT flag only in disconnected mode
      drm/i915/tc: Check TC mode instead of the VBT legacy flag
      drm/i915/tc: Block/unblock TC-cold in the PHY connect/disconnect hook=
s
      drm/i915/tc: Remove redundant wakeref=3D0 check from unblock_tc_cold(=
)
      drm/i915/tc: Drop tc_cold_block()/unblock()'s power domain parameter
      drm/i915/tc: Add TC PHY hook to get the TC-cold blocking power domain
      drm/i915/tc: Add asserts in TC PHY hooks that the required power is o=
n
      drm/i915/tc: Add TC PHY hook to init the PHY
      drm/i915/adlp/tc: Use the DE HPD ISR register for hotplug detection
      drm/i915/tc: Get power ref for reading the HPD live status register
      drm/i915/tc: Don't connect the PHY in intel_tc_port_connected()
      drm/i915/adlp/tc: Align the connect/disconnect PHY sequence with bspe=
c
      drm/i915: Move shared DPLL disabling into CRTC disable hook
      drm/i915: Disable DPLLs before disconnecting the TC PHY
      drm/i915: Remove TC PHY disconnect workaround
      drm/i915: Remove the encoder update_prepare()/complete() hooks
      drm/i915/dp_mst: Fix active port PLL selection for secondary MST stre=
ams

Jack Xiao (2):
      drm/amd/amdgpu: limit one queue per gang
      drm/amd/amdgpu: introduce gc_*_mes_2.bin v2

Jacob Keller (1):
      drm/rockchip: vop2: use struct_size() in vop2_bind

Jagan Teki (19):
      dt-bindings: display: panel: jadard,jd9365da-h3: Add Radxa Display 10=
HD
      drm: panel: jd9365da-h3: Add Radxa Display 10HD
      dt-bindings: display: panel: jadard,jd9365da-h3: Add Radxa Display 8H=
D
      drm: panel: jd9365da-h3: Add Radxa Display 8HD
      drm: exynos: dsi: Drop explicit call to bridge detach
      drm: exynos: dsi: Lookup OF-graph or Child node devices
      drm: exynos: dsi: Mark PHY as optional
      drm: exynos: dsi: Add platform PLL_P (PMS_P) offset
      drm: exynos: dsi: Introduce hw_type platform data
      drm: exynos: dsi: Add atomic check
      drm: exynos: dsi: Add input_bus_flags
      drm: exynos: dsi: Add atomic_get_input_bus_fmts
      drm: exynos: dsi: Consolidate component and bridge
      drm: exynos: dsi: Add host helper for te_irq_handler
      drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge
      dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
      drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
      dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support
      dt-bindings: bridge: Convert Samsung MIPI DSIM bridge to yaml

Jane Jian (4):
      drm/amdgpu/vcn: custom video info caps for sriov
      drm/amdgpu/gfx: set cg flags to enter/exit safe mode
      drm/amdgpu/jpeg: enable jpeg v4_0 for sriov
      Revert "drm/amdgpu: enable ras for mp0 v13_0_10 on SRIOV"

Jani Nikula (57):
      drm/i915/dmc: add proper name to dmc id enum and use it
      drm/i915/dmc: add for_each_dmc_id() and use it
      drm/i915/dmc: remove unnecessary dmc_id validity check
      drm/i915/dmc: add is_valid_dmc_id() and use it
      drm/i915/dmc: check incoming dmc id validity
      drm/i915/dmc: drop "ucode" from function names
      drm/i915/uncore: cast iomem to avoid sparse warning
      drm/i915/gt: add sparse lock annotation to avoid warnings
      drm/i915/pxp: fix __le64 access to get rid of sparse warning
      drm/i915/bios: set default backlight controller index
      drm/i915: move memory frequency detection to intel_dram.c
      drm/i915/wm: move remaining watermark code out of intel_pm.c
      drm/i915/wm: move functions to call watermark hooks to intel_wm.[ch]
      drm/i915/wm: add .get_hw_state to watermark funcs
      drm/i915/wm: move ILK watermark sanitization to i9xx_wm.[ch]
      drm/i915/wm: warn about ilk_wm_sanitize() on display ver 9+
      drm/i915/wm: move watermark debugfs to intel_wm.c
      drm/i915: rename intel_pm_types.h -> display/intel_wm_types.h
      drm/i915/wm: remove ILK+ nop funcs fallback
      drm/displayid: add displayid_get_header() and check bounds better
      drm/displayid: return struct displayid_header from validate_displayid=
()
      drm/displayid: provide access to DisplayID version and primary use ca=
se
      drm/edid: update non-desktop use also from DisplayID
      drm/edid: parse Tiled Display Topology Data Block for DisplayID 2.0
      drm/i915/dsi: fix DSS CTL register offsets for TGL+
      drm/i915/display: split out DSC and DSS registers
      drm/i915/wm: remove display/ prefix from include
      drm/i915/pm: drop intel_pm_setup()
      drm/i915/pm: drop intel_suspend_hw()
      drm/i915: remove unnecessary intel_pm.h includes
      drm/i915/power: move dc state members to struct i915_power_domains
      drm/i915/dmc: use has_dmc_id_fw() instead of poking dmc->dmc_info dir=
ectly
      drm/i915/dmc: add i915_to_dmc() and dmc->i915 and use them
      drm/i915/dmc: allocate dmc structure dynamically
      drm/i915/dmc: mass rename dev_priv to i915
      drm/i915/rps: split out display rps parts to a separate file
      drm/i915/debugfs: move IPS debugfs to hsw_ips.c
      drm/i915/gt: make kobj attributes const
      drm/i915/psr: move PSR debugfs to intel_psr.c
      drm/i915/psr: switch PSR debugfs to struct intel_connector
      drm/i915/psr: clean up PSR debugfs sink status error handling
      drm/i915/debugfs: switch crtc debugfs to struct intel_crtc
      drm/i915/debugfs: add crtc i915_pipe debugfs file
      drm/i915: remove unused config DRM_I915_UNSTABLE
      drm/i915/pps: split out PPS regs to a separate file
      drm/i915/tv: split out TV regs to a separate file
      drm/i915/aux: split out DP AUX regs to a separate file
      drm/i915/fdi: split out FDI regs to a separate file
      drm/i915/dsb: split out DSB regs to a separate file
      drm/i915/wm: split out SKL+ watermark regs to a separate file
      drm/i915/psr: split out PSR regs to a separate file
      drm/i915: enable kernel-doc warnings for CONFIG_DRM_I915_WERROR=3Dy
      drm/i915: run kernel-doc on headers as part of HDRTEST
      drm/i915: rename intel_pm.[ch] to intel_clock_gating.[ch]
      drm/i915/clock: mass rename dev_priv to i915
      drm/i915/tc: demote a kernel-doc comment to a regular comment
      drm/i915/wakeref: fix kernel-doc comment

Janusz Krzysztofik (1):
      drm/i915/active: Fix misuse of non-idle barriers as fence trackers

Jasdeep Dhillon (1):
      drm/amd/display: Updating Video Format Fall Back Policy.

Jason-JH.Lin (1):
      drm/mediatek: Change mmsys compatible for mt8195 mediatek-drm

Javier Martinez Canillas (5):
      drm/format-helper: Make conversion_buf_size() support sub-byte pixel =
fmts
      drm/virtio: Enable fb damage clips property for the primary plane
      drm/format-helper: Use drm_format_info_min_pitch() in tests helper
      drm/vkms: Drop vkms_connector_destroy() wrapper
      drm/vkms: Remove <drm/drm_simple_kms_helper.h> include

Jay Cornwall (1):
      drm/amdkfd: Trap handler changes for GC 9.4.3 v2

Jeffrey Hugo (7):
      accel/qaic: Add documentation for AIC100 accelerator driver
      accel/qaic: Add uapi and core driver file
      accel/qaic: Add MHI controller
      accel/qaic: Add control path
      accel/qaic: Add datapath
      accel/qaic: Add qaic driver to the build system
      MAINTAINERS: Add entry for QAIC driver

Jesse Zhang (2):
      drm/amdgpu: switch to golden tsc registers for raven/raven2
      drm/amdgpu: change the reference clock for raven/raven2

Jessica Zhang (4):
      drm/msm: Check for NULL before calling prepare_commit()
      drm/msm/dpu: Move TE setup to prepare_for_kickoff()
      drm/msm/dpu: Remove empty prepare_commit() function
      drm/msm/mdp4: Remove empty prepare_commit() function

Jianhua Lu (2):
      dt-bindings: display: panel: Add Novatek NT36523 bindings
      drm/panel: Add driver for Novatek NT36523

Jiapeng Chong (7):
      drm/amd/display: Modify mismatched function name
      drm/rockchip: dsi: Remove the unused function dsi_read()
      drm/amd/display: Use swap() instead of open coding it
      drm/amd/display: make is_synaptics_cascaded_panamera static
      drm/amd/display: Remove the unused function link_timing_bandwidth_kbp=
s()
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Remove the unused variable dppclk_delay_subtotal

Jiri Slaby (SUSE) (1):
      drm/nouveau/kms/nv50: fix nv50_wndw_new_ prototype

Johan Hovold (12):
      drm/msm/adreno: fix runtime PM imbalance at gpu load
      drm/msm/adreno: drop bogus pm_runtime_set_active()
      drm/msm/adreno: clean up component ops indentation
      Revert "drm/msm: Add missing check and destroy for
alloc_ordered_workqueue"
      Revert "drm/msm: Fix failure paths in msm_drm_init()"
      drm/msm: fix NULL-deref on snapshot tear down
      drm/msm: fix NULL-deref on irq uninstall
      drm/msm: fix drm device leak on bind errors
      drm/msm: fix vram leak on bind errors
      drm/msm: fix missing wq allocation error handling
      drm/msm: fix workqueue leak on bind errors
      drm/msm: move include directive

Johan Jonker (7):
      dt-bindings: display: rockchip: convert rockchip-lvds.txt to YAML
      dt-bindings: soc: rockchip: grf: add rockchip,lvds.yaml
      dt-bindings: display: dsi-controller: move clock-master property
      dt-bindings: display: bridge: snps,dw-mipi-dsi: fix clock properties
      dt-bindings: display: rockchip: convert dw_mipi_dsi_rockchip.txt to y=
aml
      dt-bindings: display: bridge: convert analogix_dp.txt to yaml
      dt-bindings: display: rockchip: convert analogix_dp-rockchip.txt to y=
aml

John Harrison (15):
      drm/i915/guc: More debug print updates - UC firmware
      drm/i915/guc: More debug print updates - GSC firmware
      drm/i915/guc: More debug print updates - GuC reg capture
      drm/i915/guc: More debug print updates - GuC selftests
      drm/i915/guc: More debug print updates - GuC SLPC
      drm/i915/guc: More debug print updates - GuC logging
      drm/i915: Don't use stolen memory for ring buffers with LLC
      drm/i915: Don't use BAR mappings for ring buffers with LLC
      drm/i915/guc: Improve clean up of busyness stats worker
      drm/i915/guc: Fix missing return code checks in submission init
      drm/i915/guc: Fix missing ecodes
      drm/i915/guc: Clean up of register capture search
      drm/i915: Include timeline seqno in error capture
      drm/i915/guc: Improve GuC load error reporting
      drm/i915/guc: Allow for very slow GuC loading

John Keeping (2):
      drm/rockchip: avoid duplicate mappings for IOMMU devices
      drm/bridge: panel: Set orientation on panel_bridge connector

Jonathan Cavitt (2):
      drm/i915/mtl: X-Tile support changes to client blits
      drm/i915/selftests: Drop igt_cs_tlb

Jonathan Gray (1):
      drm/i915: Add another EHL pci id

Jos=C3=A9 Roberto de Souza (1):
      drm/i915/display/mtl: Program latch to phy reset

Jouni H=C3=B6gander (9):
      drm/i915/psr: Split sel fetch plane configuration into arm and noarm
      drm/i915/fbdev: Implement fb_dirty for intel custom fb helper
      drm/i915/psr: Use calculated io and fast wake lines
      drm/i915/psr: Unify pre/post hooks
      drm/i915/psr: Modify/Fix Wa_16013835468 and prepare for Wa_1401564800=
6
      drm/i915/psr: Implement Wa_14015648006
      drm/i915/psr: Add helpers for block count number handling
      drm/i915/psr: Check that vblank is long enough for psr2
      drm/i915/psr: Implement Display WA #1136

Justin Green (3):
      drm/mediatek: Refactor pixel format logic
      drm/mediatek: Add support for AR30 and BA30 overlays
      drm/mediatek: Enable AR30 and BA30 overlays on MT8195

Kai-Heng Feng (1):
      drm/amdgpu/nv: Apply ASPM quirk on Intel ADL + AMD Navi

Kalyan Thota (4):
      drm/msm/disp/dpu1: add support for dspp sub block flush in sc7280
      drm/msm/dpu: add DSPPs into reservation upon a CTM request
      drm/msm/dpu: avoid unnecessary check in DPU reservations
      drm/msm/dpu: manage DPU resources if CTM is requested

Karol Wachowski (1):
      accel/ivpu: Remove D3hot delay for Meteorlake

Koby Elbaz (15):
      accel/habanalabs: capture RAZWI info only if HW indication detected
      accel/habanalabs: unsecure CFG_TPC_ID register
      accel/habanalabs: disable PCI when escalating compute to hard-reset
      accel/habanalabs: rename security function parameters
      accel/habanalabs: break is_idle function into per-engine sub-routines
      accel/habanalabs: verify return code after scrubbing ARCs DCCMs
      accel/habanalabs: remove a useless is_idle TPC flag
      accel/habanalabs: fix register address on PDMA/EDMA idle check
      accel/habanalabs: use a mutex rather than a spinlock
      accel/habanalabs: add uapi to stall/resume engine
      accel/habanalabs: do not verify engine modes after being changed
      accel/habanalabs: return tlb inv error code upon failure
      accel/habanalabs: unmap mapped memory when TLB inv fails
      accel/habanalabs: change COMMS warning messages to error level
      accel/habanalabs: don't wait for STS_OK after sending COMMS WFE

Konrad Dybcio (20):
      dt-bindings: display/panel: Add Sony Tama TD4353 JDI display panel
      gpu/drm/panel: Add Sony TD4353 JDI panel driver
      drm/msm/adreno: Use OPP for every GPU generation
      drm/msm/a3xx: Implement .gpu_busy
      drm/msm/a4xx: Implement .gpu_busy
      drm/msm/adreno: Enable optional icc voting from OPP tables
      drm/msm/a6xx: Add support for A640 speed binning
      drm/msm/a6xx: Add support for A650 speed binning
      drm/msm/adreno: adreno_gpu: Don't set OPP scaling clock w/ GMU
      drm/msm/adreno: adreno_gpu: Use suspend() instead of idle() on load e=
rror
      dt-bindings: display/msm: dsi-controller-main: Fix deprecated
QCM2290 compatible
      drm/msm/dsi: Get rid of msm_dsi_config::num_dsi
      drm/msm/dsi: Fix DSI index detection when version clash occurs
      drm/msm/dsi: dsi_cfg: Deduplicate identical structs
      drm/msm/dsi: dsi_cfg: Merge SC7180 config into SDM845
      drm/msm/dsi: Switch the QCM2290-specific compatible to index autodete=
ction
      drm/msm/dsi: Remove custom DSI config handling
      dt-bindings: display/msm: dsi-controller-main: Add SM6115
      drm/msm/dpu: Allow variable SSPP_BLK size
      drm/msm/dpu: Allow variable INTF_BLK size

Krzysztof Kozlowski (11):
      dt-bindings: display: panel-simple: merge Innolux p120zdg-bf1
      dt-bindings: display: novatek,nt36672a: correct VDDIO supply
      dt-bindings: display: panel-simple-dsi: allow vddio variant
      dt-bindings: display: panel-simple-dsi: document port
      dt-bindings: display: visionox,rm69299: document reg
      dt-bindings: display: boe,tv101wum-nl6: document rotation
      dt-bindings: display: sitronix,st7789v: document dc-gpios
      dt-bindings: display: xinpeng,xpp055c272: document port
      dt-bindings: display: feiyang,fy07024di26a30d: document port
      dt-bindings: display: elida,kd35t133: document port and rotation
      dt-bindings: display: sitronix,st7701: document port and rotation

Kun Liu (3):
      drm/amdgpu: added a sysfs interface for thermal throttling
      drm/amdgpu: added a sysfs interface for thermal throttling
      drm/amdgpu: fix no previous prototype warning

Laurent Pinchart (7):
      drm: rcar-du: lvds: Call function directly instead of through pointer
      drm: rcar-du: lvds: Move LVDS enable code to separate code section
      drm: rcar-du: lvds: Fix LVDS PLL disable on D3/E3
      drm: rcar-du: Don't write unimplemented ESCR and OTAR registers on Ge=
n3
      drm: rcar-du: Disable alpha blending for DU planes used with VSP
      drm: rcar-du: Rename DORCR fields to make them 0-based
      drm: rcar-du: Write correct values in DORCR reserved fields

Le Ma (10):
      drm/amdgpu: set ih chicken bit for IH 4.4.2
      drm/amdgpu: skip ih2 rb allocation for IH 4.4.2
      drm/amdgpu: skip hdp invalidation for HDP 4.4.2
      drm/amdgpu: add sdma v4_4_2 support (v4)
      drm/amdgpu: set sdma v4_4_2 ip block
      drm/amdgpu: add gfxhub v1_2 support
      drm/amdgpu: add mmhub v1_8 support
      drm/amdgpu: initialize gfxhub v1_2 and mmhub v1_8 funcs
      drm/amdgpu: move vmhub out of amdgpu_ring_funcs (v4)
      drm/amdgpu: add some basic elements for multiple XCD case

Lee Jones (36):
      drm/ttm/ttm_bo: Provide a missing 'bulk' description and correct
misnaming of 'placement'
      drm/amd/display/dc/dc_hdmi_types: Move string definition to the
only file it's used in
      drm/amd/amdgpu/amdgpu_device: Provide missing kerneldoc entry
for 'reset_context'
      drm/amd/amdgpu/amdgpu_ucode: Remove unused function
=E2=80=98amdgpu_ucode_print_imu_hdr=E2=80=99
      drm/amd/amdgpu/amdgpu_vm_pt: Supply description for
amdgpu_vm_pt_free_dfs()'s unlocked param
      drm/amd/amdgpu/gmc_v11_0: Provide a few missing param
descriptions relating to hubs and flushes
      drm/amd/amdgpu/ih_v6_0: Repair misspelling and provide
descriptions for 'ih'
      drm/amd/amdgpu/amdgpu_mes: Ensure amdgpu_bo_create_kernel()'s
return value is checked
      drm/amd/amdgpu/amdgpu_vce: Provide description for
amdgpu_vce_validate_bo()'s 'p' param
      drm/amd/pm/swsmu/smu11/vangogh_ppt: Provide a couple of missing
parameter descriptions
      drm/amd/display/amdgpu_dm/amdgpu_dm_helpers: Move defines out to
where they are actually used
      drm/amd/display/dc/dce/dmub_psr: Demote kerneldoc abuse
      drm/amd/display/dc/link/link_detection: Remove unused variable 'statu=
s'
      drm/amd/display/dc/link/protocols/link_dp_training: Remove set
but unused variable 'result'
      drm/amd/display/dc/link/protocols/link_dp_capability: Remove
unused variable and mark another as __maybe_unused
      drm/amd/display/dc/link/protocols/link_dp_capability: Demote
non-compliant kerneldoc
      drm/amd/display/dc/dce60/Makefile: Fix previous attempt to
silence known override-init warnings
      drm/amd/display/dc/link/link_detection: Demote a couple of
kerneldoc abuses
      drm/amd/display/dc/core/dc_stat: Convert a couple of doc headers
to kerneldoc format
      drm/i915/display/intel_display_debugfs: Fix incorrect param
naming for 'intel_connector'
      drm/i915/display/intel_display_power: Fix incorrectly documented
function __intel_display_power_put_async()
      drm/i915/display/intel_wm: Fix a little doc-rot in
intel_update_watermarks()
      drm/i915/i915_scatterlist: Fix kerneldoc formatting issue - missing '=
@'
      drm/i915/intel_region_ttm: Provide missing description for 'offset' p=
aram
      drm/i915/gt/intel_rps: Demote a kerneldoc abuse for
ips_ping_for_i915_load()
      drm/i915/gem/i915_gem_create: Provide the function names for
proper kerneldoc headers
      drm/i915/gem/i915_gem_domain: Provide function names to complete
proper kerneldoc
      drm/i915/gem/i915_gem_ttm_pm: Provide a couple of missing
descriptions for 'flags' and remove some superfluous ones
      drm/i915/gem/i915_gem_ttm: Demote half-filled kerneldoc
      drm/i915/gem/i915_gem_ttm_move: Provide a couple of missing
descriptions for 'num_pages' and 'ctx'
      drm/i915/gem/i915_gem_wait: Provide function name to validate
the kerneldoc header
      drm/i915/gem/i915_gem_object: Demote non-kerneldoc header with
no param descriptions
      drm/i915/i915_gem: Provide function names to complete the
expected kerneldoc format
      drm/i915/gt/uc/intel_guc_hwconfig: Demote a few non-conforming
kerneldoc headers
      drm/i915/i915_vma: Provide one missing param and demote another
non-kerneldoc header
      drm/tegra: dc: Remove set but unused variable 'state'

Leonard Lausen (1):
      drm/msm/dpu: Add support for AR30 format

Li Ma (1):
      drm/amdgpu: reserve the old gc_11_0_*_mes.bin

Lijo Lazar (4):
      drm/amd/pm: Add PMFW headers for SMU 13.0.6
      drm/amd/pm: Add SMU 13.0.6 support
      drm/amd/pm: Remove unavailable temperature params
      drm/amdgpu: Fix warnings

Linus Walleij (1):
      drm/mcde: Do not use dirty GEM FB handling

Lionel Landwerlin (1):
      drm/i915: disable sampler indirect state in bindless heap

Liu Ying (1):
      MAINTAINERS: Add include/drm/drm_bridge.h to DRM DRIVERS FOR BRIDGE C=
HIPS

Luben Tuikov (2):
      drm/amdgpu: Remove second moot switch to set EEPROM I2C address
      drm/amdgpu: Return from switch early for EEPROM I2C address

Luca Ceresoli (2):
      drm: bridge: ldb: add missing \n in dev_warn() string
      drm: bridge: ldb: add support for using channel 1 only

Lucas De Marchi (14):
      drm/i915: Add _PICK_EVEN_2RANGES()
      drm/i915: Fix coding style on DPLL*_ENABLE defines
      drm/i915: Convert pll macros to _PICK_EVEN_2RANGES
      drm/i915: Replace _MMIO_PHY3() with _PICK_EVEN_2RANGES()
      drm/i915: Convert PIPE3/PORT3 to _PICK_EVEN_2RANGES()
      drm/i915: Convert _FIA() to _PICK_EVEN_2RANGES()
      drm/i915: Convert MBUS_ABOX_CTL() to _PICK_EVEN_2RANGES()
      drm/i915: Convert PALETTE() to _PICK_EVEN_2RANGES()
      drm/i915: Fix GEN8_MISCCPCTL
      drm/i915: Remove unused/wrong INF_UNIT_LEVEL_CLKGATE
      drm/i915: Move MCR_REG define to i915_reg_defs.h
      drm/i915: Remove redundant check for DG1
      drm/i915: Move DG2 tuning to the right function
      drm/i915/gt: Avoid out-of-bounds access when loading HuC

Maarten Lankhorst (5):
      drm/suballoc: Extract amdgpu_sa.c as generic suballocation helper
      drm/amd: Convert amdgpu to use suballocation helper.
      drm/radeon: Use the drm suballocation manager implementation.
      drm/i915/bios: Rename find_section to find_bdb_section
      Merge remote-tracking branch 'drm/drm-next' into drm-misc-next

Madhumitha Tolakanahalli Pradeep (1):
      drm/i915/dmc: Load DMC on MTL

Marek Ol=C5=A1=C3=A1k (1):
      drm/amdgpu: expose more memory stats in fdinfo

Marek Szyprowski (1):
      drm: exynos: dsi: Handle proper host initialization

Marek Vasut (4):
      drm: bridge: samsung-dsim: Add i.MX8M Plus support
      drm/bridge: tc358767: Enable DSI burst mode, LPM, non-continuous cloc=
k
      dt-bindings: display: Start the info graphics with HS/VS change
      drm/bridge: ti-sn65dsi83: Do not generate HFP/HBP/HSA and EOT packet

Marian Cichy (1):
      drm/imx/lcdc: Implement DRM driver for imx25

Mario Limonciello (3):
      drm/amd: Fix initialization for nbio 7.5.1
      drm/amd: Fix initialization mistake for NBIO 7.3.0
      drm/amd: Fix an out of bounds error in BIOS parser

Mark Hawrylak (1):
      drm/radeon: Fix eDP for single-display iMac11,2

Martin Krastev (2):
      drm/vmwgfx: Drop mksstat_init_record fn as currently unused
      drm/vmwgfx: Fix Legacy Display Unit atomic drm support

Martin Leung (2):
      drm/amd/display: initialize link_srv in virtual env
      drm/amd/display: fix double memory allocation

Matt Atwood (1):
      drm/i915: Fix memory leaks in scatterlist

Matt Roper (14):
      drm/i915/tgl: Drop support for pre-production steppings
      drm/i915/dg1: Drop support for pre-production steppings
      drm/i915/dg1: Drop final use of IS_DG1_GRAPHICS_STEP
      drm/i915/pvc: Annotate two more workaround/tuning registers as MCR
      drm/i915/gen11: Wa_1408615072/Wa_1407596294 should be on GT list
      drm/i915/dg2: Drop one PCI ID
      drm/i915/xehp: LNCF/LBCF workarounds should be on the GT list
      drm/i915/xelpmp: Consider GSI offset when doing MCR lookups
      drm/i915/mtl: Add engine TLB invalidation
      drm/i915/gen12: Update combo PHY init sequence
      drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access
      drm/i915: Stop whitelisting CS_CTX_TIMESTAMP on Xe_HP platforms
      drm/i915: Sanitycheck MMIO access early in driver load
      drm/i915: Check for unreliable MMIO during forcewake

Matthew Auld (8):
      drm/i915/ttm: fix sparse warning
      drm/i915/ttm: audit remaining bo->resource
      drm/ttm: clear the ttm_tt when bo->resource is NULL
      drm/gem-vram: handle NULL bo->resource in move callback
      drm/qxl: handle NULL bo->resource in move callback
      drm/radeon: handle NULL bo->resource in move callback
      drm/i915: probe lmem before the stolen portion
      drm/i915/ttm: remove the virtualized start hack

Mavroudis Chatzilaridis (1):
      drm/i915/quirks: Add inverted backlight quirk for HP 14-r206nv

Maxime Ripard (4):
      drm/vc4: hdmi: Replace hardcoded value by define
      drm/vc4: hdmi: Enable power domain before setting minimum
      Revert "drm/vc4: hdmi: Fix HSM clock too low on Pi4"
      Revert "drm/vc4: hdmi: Enforce the minimum rate at runtime_resume"

Maya Matuszczyk (3):
      dt-bindings: display: panel: sitronix,st7701: Add Elida KD50T048A Pan=
el
      drm: panel: Add Elida KD50T048A to Sitronix ST7701 driver
      drm: panel: Add orientation support for st7701

Ma=C3=ADra Canal (13):
      drm/format-helper: Use KUNIT_EXPECT_MEMEQ macro
      drm/vgem: add missing mutex_destroy
      drm/sched: Create wrapper to add a syncobj dependency to job
      drm/panfrost: Use drm_sched_job_add_syncobj_dependency()
      drm/v3d: Use drm_sched_job_add_syncobj_dependency()
      drm/vc4: replace drm_gem_dma_object for drm_gem_object in vc4_exec_in=
fo
      drm/vc4: replace obj lookup steps with drm_gem_objects_lookup
      dma-buf: Include missing parentheses to documentation
      drm/vgem: Drop struct drm_vgem_gem_object
      drm/lima: Use drm_sched_job_add_syncobj_dependency()
      drm/vkms: remove the need for the primary plane to be visible
      drm/vkms: allow the primary plane to be positioned
      drm/msm: Use drm_sched_job_add_syncobj_dependency()

Michael Riesch (5):
      drm/rockchip: vop2: initialize possible_crtcs properly
      drm/rockchip: rgb: embed drm_encoder into rockchip_encoder
      drm/rockchip: rgb: add video_port parameter to init function
      drm/rockchip: vop2: use symmetric function pair
vop2_{create,destroy}_crtcs
      drm/rockchip: vop2: add support for the rgb output block

Michael Strauss (1):
      drm/amd/display: Improve robustness of FIXED_VS link training at DP1 =
rates

Michal Wajdeczko (2):
      drm/i915/guc: Improve debug message on context reset notification
      drm/i915/huc: Add and use HuC oriented print macros

Mike Hsieh (2):
      drm/amd/display: Add height granularity limitation for dsc slice
height calculation
      drm/amd/display: fix typo in dc_dsc_config_options structure

Mikko Perttunen (1):
      gpu: host1x: Don't rely on dma_fence_wait_timeout return value

Min Li (1):
      drm/i915: fix race condition UAF in i915_perf_add_config_ioctl

Moti Haimovski (3):
      accel/habanalabs: add critical-event bit in notifier
      accel/habanalabs: minimize error prints when mem map fails
      accel/habanalabs: speedup h/w queues test in Gaudi2

Muhammad Usama Anjum (1):
      drm/amdgpu: remove dead code

Mukul Joshi (2):
      drm/amdgpu: Enable IH retry CAM on GFX9
      drm/amdgpu: Rework retry fault removal

Mustapha Ghaddar (5):
      drm/amd/display: Allocation at stream Enable
      drm/amd/display: Update BW ALLOCATION Function declaration
      drm/amd/display: Unify DC logging for BW Alloc
      drm/amd/display: Add Validate BW for USB4 Links
      drm/amd/display: Add function pointer for validate bw usb4

Nancy.Lin (9):
      dt-bindings: mediatek: add ethdr definition for mt8195
      drm/mediatek: Add ETHDR support for MT8195
      drm/mediatek: Add ovl_adaptor support for MT8195
      drm/mediatek: Add dma dev get function
      drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support
      drm/mediatek: Add drm ovl_adaptor sub driver for MT8195
      drm/mediatek: Add mediatek-drm of vdosys1 support for MT8195
      drm/mediatek: Add mdp_rdma get format function
      drm/mediatek: Add ovl_adaptor get format function

Nathan Lu (1):
      drm/mediatek: Add mediatek-drm of vdosys0 support for mt8188

Neil Armstrong (5):
      MAINTAINERS: Add myself as maintainer for DRM Panels drivers
      dt-bindings: display/msm: document MDSS on SM8550
      dt-bindings: display: msm: sm8450-mdss: Fix DSI compatible
      dt-bindings: display/msm: document DPU on SM8550
      dt-bindings: display: msm: dp-controller: document SM8450 compatible

Nicholas Kazlauskas (4):
      drm/amd/display: Add minimum Z8 residency debug option
      drm/amd/display: Update minimum stutter residency for DCN314 Z8
      drm/amd/display: Add NULL plane_state check for cursor disable logic
      drm/amd/display: Fix 4to1 MPC black screen with DPP RCO

Nirmoy Das (5):
      drm/i915/gt: Use sysfs_emit() and sysfs_emit_at()
      drm/i915: Make sure dsm_size has correct granularity
      drm/i915/display: Pass drm_i915_private as param to i915 funcs
      drm/i915/active: Fix missing debug object activation
      drm/i915/gt: Update engine_init_common documentation

Nur Hussein (1):
      drm/tegra: Avoid potential 32-bit integer overflow

Oded Gabbay (7):
      accel/habanalabs: split cdev creation to separate function
      accel/habanalabs: save class in hdev
      accel/habanalabs: refactor debugfs init
      accel/habanalabs: make gaudi2_is_device_idle() static
      accel/habanalabs: align to latest firmware specs
      accel/habanalabs: fix field names in hl_info_hw_ip_info
      accel/habanalabs/uapi: new Gaudi2 server type

Ofir Bitton (14):
      accel/habanalabs: increase user interrupt grace time
      accel/habanalabs: expose engine core int reg address
      accel/habanalabs: capture interrupt timestamp in handler
      accel/habanalabs: add support for TPC assert
      accel/habanalabs: increase reset poll timeout
      accel/habanalabs: expose dram reserved size by kmd
      accel/habanalabs: expose rotator mask to userspace
      accel/habanalabs: add handling for unexpected user event
      accel/habanalabs: remove redundant TODOs
      accel/habanalabs: fix HBM MMU interrupt handling
      accel/habanalabs: print raw binning masks in debug level
      accel/habanalabs: fix wrong reset and event flags
      accel/habanalabs: fixes for unexpected error interrupt
      accel/habanalabs: remove Gaudi1 multi MSI code

Ohad Sharabi (3):
      accel/habanalabs: get reset type indication from irq_map
      accel/habanalabs: modify events reset policy
      accel/habanalabs: regenerate gaudi2 ids_map_extended

Orlando Chamberlain (1):
      drm/amdgpu: register a vga_switcheroo client for MacBooks with apple-=
gmux

Paul Hsieh (3):
      drm/amd/display: Correct DML calculation to align HW formula
      drm/amd/display: power down eDP if eDP not present
      drm/amd/display: Correct DML calculation to follow HW SPEC

Peichen Huang (1):
      drm/amd/display: skip CLEAR_PAYLOAD_ID_TABLE if device mst_en is 0

Perry Yuan (3):
      drm/amdgpu/pm: add capped/uncapped power profile modes
      drm/amdgpu: map new capped and uncapped mode power profiles for Vango=
gh
      drm/amdgpu: skip the invalid workload type

Peter Foley (1):
      amdgpu: Avoid building on UML

Petr Tesarik (1):
      drm/prime: Fix documentation of drm_gem_prime_fd_to_handle()

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: use sdma_v6 single packet invalidation

Pin-yen Lin (4):
      drm/bridge: ps8640: Skip redundant bridge enable
      drm/bridge: ps8640: Add a cache for EDID
      drm/bridge: ps8640: Return NULL immediately when EDID read fail
      drm/bridge: ps8640: Use constant sleep time for polling hpd

Pranjal Ramajor Asha Kanojiya (1):
      accel/qaic: Add mhi_qaic_cntl

Qiang Yu (3):
      Revert "drm/lima: add show_fdinfo for drm usage stats"
      Revert "drm/lima: allocate unique id per drm_file"
      Revert "drm/lima: add usage counting method to ctx_mgr"

Qingqing Zhuo (1):
      drm/amd/display: Add infrastructure for enabling FAMS for DCN30

Radhakrishna Sripada (4):
      drm/i915/mtl: Initialize empty clockgating hooks for MTL
      drm/i915/mtl: Fix Wa_16015201720 implementation
      drm/i915/mtl: Add workarounds Wa_14017066071 and Wa_14017654203
      drm/i915/mtl: Add Wa_22015279794

Randy Dunlap (1):
      drm/bridge: Kconfig: fix a spelling mistake

Rayyan Ansari (2):
      drm/simpledrm: Allow physical width and height configuration via
panel node
      dt-bindings: display: simple-framebuffer: Document the panel node

Rob Clark (35):
      drm/shmem: Cleanup drm_gem_shmem_create_with_handle()
      drm/rockchip: Drop unbalanced obj unref
      drm/i915: Move fd_install after last use of fence
      drm/virtio: Add option to disable KMS support
      Merge remote-tracking branch 'drm/drm-next' into msm-next
      drm/msm/a6xx: Some reg64 conversion
      drm/msm: Update generated headers
      dma-buf/dma-fence: Add deadline awareness
      dma-buf/fence-array: Add fence deadline support
      drm/msm: Pre-allocate hw_fence
      drm/msm: Move submit bo flags update from obj lock
      drm/msm/gem: Tidy up VMA API
      drm/msm: Decouple vma tracking from obj lock
      drm/msm/gem: Simplify vmap vs LRU tracking
      drm/gem: Export drm_gem_lru_move_tail_locked()
      drm/msm/gem: Move update_lru()
      drm/msm/gem: Protect pin_count/madv by LRU lock
      drm/msm/gem: Avoid obj lock in job_run()
      drm/msm: Switch idr_lock to spinlock
      drm/msm: Use idr_preload()
      drm/msm/gpu: Move fw loading out of hw_init() path
      drm/msm/gpu: Move BO allocation out of hw_init
      drm/msm/a6xx: Move ioremap out of hw_init path
      dma-buf/fence-chain: Add fence deadline support
      dma-buf/dma-resv: Add a way to set fence deadline
      dma-buf/sync_file: Surface sync-file uABI
      drm/scheduler: Add fence deadline support
      drm/vblank: Add helper to get next vblank time
      drm/atomic-helper: Set fence deadline for vblank
      Merge tag 'dma-fence-deadline' into HEAD
      drm/msm: Add deadline based boost support
      drm/msm: Add wait-boost support
      drm/msm/atomic: Switch to vblank_start helper
      drm/vblank: Fix for drivers that do not drm_vblank_init()
      drm/msm: Avoid rounding down to zero jiffies

Rob Herring (3):
      dt-bindings: display: Drop unneeded quotes
      drm: Use of_property_present() for testing DT property presence
      drm: Use of_property_read_bool() for boolean properties

Robin Chen (1):
      drm/amd/display: hpd rx irq not working with eDP interface

Rodrigo Siqueira (9):
      drm/amd/display: Ensure vmin and vmax adjust for DCE
      drm/amd/display: Drop dc_commit_state in favor of dc_commit_streams
      drm/amd/display: Use dc_update_planes_and_stream
      drm/amd/display: Use DC_LOG_DC in the trasform pixel function
      drm/amd/display: Add wrapper to call planes and stream update
      drm/amd/display: Ensure that planes are in the same order
      drm/amd/display: Add const to a function
      drm/amd/display: Set MPC_SPLIT_DYNAMIC for DCN10
      drm/amd/display: Set MPC_SPLIT_DYNAMIC for DCN301

Rodrigo Vivi (2):
      drm/i915: Remove unused tmp assignment.
      Merge drm/drm-next into drm-intel-next

Ruihai Zhou (2):
      dt-bindings: display: panel: Add compatible for Starry
2081101QFH032011-53G
      drm/panel: support for STARRY 2081101QFH032011-53G MIPI-DSI panel

Ryan Lin (1):
      drm/amd/display: Ext displays with dock can't recognized after resume

Saaem Rizvi (2):
      drm/amd/display: Remove OTG DIV register write for Virtual signals.
      drm/amd/display: Implement workaround for writing to
OTG_PIXEL_RATE_DIV register

Sagiv Ozeri (2):
      accel/habanalabs: organize hl_device structure comment
      accel/habanalabs: add device id to all threads names

Samson Tam (3):
      drm/amd/display: enable DPG when disabling plane for phantom pipe
      drm/amd/display: reallocate DET for dual displays with high
pixel rate ratio
      drm/amd/display: fix assert condition

Sascha Hauer (4):
      drm/rockchip: vop: limit maximum resolution to hardware capabilities
      drm/rockchip: dw_hdmi: relax mode_valid hook
      drm/rockchip: dw_hdmi: Add support for 4k@30 resolution
      drm/rockchip: dw_hdmi: discard modes with unachievable pixelclocks

Shane Xiao (3):
      drm/amdgpu: Add userptr bo support for mGPUs when iommu is on
      amd/amdgpu: Inherit coherence flags base on original BO flags
      drm/amdgpu: DROP redundant drm_prime_sg_to_dma_addr_array

Shashank Sharma (3):
      drm/amdgpu: fix return value check in kfd
      drm/amdgpu: rename num_doorbells
      drm/amdgpu: include protection for doorbell.h

Shirish S (1):
      drm/amd/display: add sysfs entry to read PSR residency from firmware

Simon Ser (8):
      drm: document DRM_IOCTL_GEM_CLOSE
      drm: document expectations for GETFB2 handles
      drm: document DRM_IOCTL_PRIME_HANDLE_TO_FD and PRIME_FD_TO_HANDLE
      drm: document connector margin properties
      drm: remove outdated doc TODO for subconnector property
      drm: fix typo in margin connector properties docs
      drm/prime: reject DMA-BUF attach when get_sg_table is missing
      drm/vram-helper: turn on PRIME import/export

Somalapuram Amaranath (1):
      drm/amdgpu: Remove TTM resource->start visible VRAM condition v2

Sreekant Somasekharan (1):
      drm/amdkfd: Check PCIe atomics support on GFX11 to set
CP_HQD_HQ_STATUS0[29]

Srinivasan Shanmugam (7):
      drm/amd/amdgpu: Fix error do not initialise globals to 0
      drm/amd/amdgpu: Remove initialisation of globals to 0 or NULL
      drm/amd/amdgpu: Drop the hang limit parameter
      drm/amd/display : Log DP link training downspread info
      drm/amd/display: Add logging for DP link traning Test Pattern Seqeunc=
es
      drm/amd/display: Add logging when setting DP sink power state fails
      drm/amd/display: Add logging when DP link training Clock
recovery is Successful

Stanislav Lisovskiy (5):
      drm/i915: Implement workaround for CDCLK PLL disable/enable
      drm/i915: Copy highest enabled wm level to disabled wm levels for gen=
 >=3D 9
      drm/i915: Ensure DSC has enough BW and stays within HW limits
      drm/i915: Use compressed bpp when calculating m/n value for DP MST DS=
C
      drm/i915: Implement UHBR bandwidth check

Stanislaw Gruszka (3):
      accel/ivpu: Set dma max_segment_size
      accel/ivpu: Fix old dma_buf api usage
      accel: Build sub-directories based on config options

Stanley.Yang (3):
      drm/amdgpu: print ras drv fw debug info
      drm/amdgpu: fix unexpected block id
      drm/amdgpu: correct ras enabled flag

Stephen Boyd (1):
      drm/panel: boe-tv101wum-nl6: Ensure DSI writes succeed during disable

Stylon Wang (1):
      drm/amd/display: Clearly states if long or short HPD event in dmesg l=
ogs

Sui Jingfeng (1):
      video/aperture: Fix typos in comments

Sung Joon Kim (1):
      drm/amd/display: Extend Freesync over PCon support for more devices

Suraj Kandpal (10):
      drm/i915/dp: Increase slice_height for DP
      drm/i915/gsc: Create GSC request submission mechanism
      drm/i915/hdcp: HDCP2.x Refactoring to agnostic hdcp
      drm/i915/hdcp: Refactor HDCP API structures
      drm/i915/mtl: Add function to send command to GSC CS
      drm/i915/mtl: Add HDCP GSC interface
      drm/i915/dsc: Adding the new registers for DSC
      drm/i915/dsc: Enable YCbCr420 for VDSC
      drm/i915/dsc: Fill in native_420 field
      drm/i915/vdsc: Check slice design requirement

Swapnil Patel (2):
      drm/amd/display: Update clock table to include highest clock setting
      drm/amd/display: default values for luminance range if they are 0

Swati Sharma (1):
      drm/i915/dsc: Add debugfs entry to validate DSC output formats

Taimur Hassan (1):
      drm/amd/display: Add 90Mhz to video_optimized_pixel_rates

Tal Cohen (5):
      accel/habanalabs: change user interrupt to threaded IRQ
      accel/habanalabs: print event type when device is disabled
      accel/habanalabs: remove duplicated disable pci msg
      accel/habanalabs: send disable pci when compute ctx is active
      accel/habanalabs: sync f/w events interrupt in hard reset

Tejas Upadhyay (2):
      drm/i915/selftest: Remove avoidable init assignment
      drm/i915/fbdev: lock the fbdev obj before vma pin

Thierry Reding (1):
      MAINTAINERS: Add Mikko as backup maintainer for Tegra DRM

Thomas Hellstr=C3=B6m (6):
      drm/ttm: Use the BIT macro for the TTM_TT_FLAGs
      drm/ttm: Unexport ttm_global_swapout()
      drm/ttm: Don't print error message if eviction was interrupted
      drm/ttm/pool: Fix ttm_pool_alloc error path
      drm/ttm: Reduce the number of used allocation orders for TTM pages
      drm/ttm: Make the call to ttm_tt_populate() interruptible when faulti=
ng

Thomas Wei=C3=9Fschuh (5):
      drm/nouveau/led: explicitly include linux/leds.h
      drm/i915: Make kobj_type structures constant
      dma-buf: make kobj_type structure constant
      drm/amdgpu: make kobj_type structures constant
      drm/amdkfd: Make kobj_type structures constant

Thomas Zimmermann (115):
      Merge drm/drm-next into drm-misc-next
      fbdev: Fix contact info in fb_cmdline.c
      fbdev: Transfer video=3D option strings to caller; clarify ownership
      fbdev: Support NULL for name in option-string lookup
      drivers/ps3: Read video=3D option with fb_get_option()
      fbdev: Read video=3D option with fb_get_option() in modedb
      fbdev: Unexport fb_mode_option
      fbdev: Move option-string lookup into helper
      fbdev: Handle video=3D parameter in video/cmdline.c
      driver/ps3: Include <video/cmdline.h> for mode parsing
      drm: Include <video/cmdline.h> for mode parsing
      drm: Fix comment on mode parsing
      drm/atomic-helper: Add atomic_enable plane-helper callback
      drm/ast: Implement struct drm_plane_helper_funcs.atomic_enable
      drm/mgag200: Remove disable handling from atomic_update
      drm/mgag200: Implement struct drm_plane_helper_funcs.atomic_enable
      drm/tidss: Remove return values from dispc_plane_{setup, enable}()
      drm/tidss: Implement struct drm_plane_helper_funcs.atomic_enable
      Revert "drm/shmem-helper: Switch to reservation lock"
      drm/ast: Remove little-endianism from I/O helpers
      drm/ast: Rework definition of I/O read and write helpers
      drm/ast: Rename struct ast_private to struct ast_device
      drm/ast: Rename to_ast_private() to to_ast_device()
      Merge drm/drm-next into drm-misc-next
      drm/cirrus: Compute blit destination offset in single location
      drm/cirrus: Replace cpp value with format
      drm/cirrus: Use drm_fb_blit() to update scanout buffer
      drm/cirrus: Move drm_dev_{enter, exit}() into DRM helpers
      drm/cirrus: Split cirrus_mode_set() into smaller functions
      drm/cirrus: Integrate connector into pipeline code
      drm/cirrus: Move primary-plane format arrays
      drm/cirrus: Convert to regular atomic helpers
      drm/cirrus: Enable damage clipping on primary plane
      drm/cirrus: Inline cirrus_fb_blit_rect()
      drm/cirrus: Remove format test from cirrus_fb_create()
      drm/cirrus: Remove size test from cirrus_fb_create()
      drm/cirrus: Test mode against video-memory size in device-wide mode_v=
alid
      drm/cirrus: Inline cirrus_check_size() into primary-plane atomic_chec=
k
      drm/cirrus: Introduce struct cirrus_primary_plane_state
      drm/cirrus: Store HW format/pitch in primary-plane state
      drm/cirrus: Use VGA macro constants to unblank
      drm/fbdev-dma: Implement fbdev emulation for GEM DMA helpers
      arm/hdlcd: Use GEM DMA fbdev emulation
      arm/malidp: Use GEM DMA fbdev emulation
      drm/aspeed: Use GEM DMA fbdev emulation
      drm/atmel-hlcdc: Use GEM DMA fbdev emulation
      drm/fsl-dcu: Use GEM DMA fbdev emulation
      drm/imx/dcss: Use GEM DMA fbdev emulation
      drm/imx: Use GEM DMA fbdev emulation
      drm/kmb: Use GEM DMA fbdev emulation
      drm/logicvc: Use GEM DMA fbdev emulation
      drm/meson: Use GEM DMA fbdev emulation
      drm/mxsfb/lcdif: Use GEM DMA fbdev emulation
      drm/mxsfb: Use GEM DMA fbdev emulation
      drm/sti: Use GEM DMA fbdev emulation
      drm/stm: Use GEM DMA fbdev emulation
      drm/sun4i: Use GEM DMA fbdev emulation
      drm/tidss: Use GEM DMA fbdev emulation
      drm/tilcdc: Use GEM DMA fbdev emulation
      drm/arcpgu: Use GEM DMA fbdev emulation
      drm/tve200: Use GEM DMA fbdev emulation
      drm/vc4: Use GEM DMA fbdev emulation
      drm/xlnx: Use GEM DMA fbdev emulation
      drm/mcde: Use GEM DMA fbdev emulation
      drm/pl111: Use GEM DMA fbdev emulation
      drm/gma500: Remove unnecessary include statements
      drm/gma500: Move fbdev code into separate source file
      drm/gma500: Remove fbdev vma open and close callbacks
      drm/gma500: Fix naming in fb_ops
      drm/gma500: Inline psbfb_create() into psbfb_probe()
      drm/gma500: Implement client-based fbdev emulation
      drm/gma500: Pass fb_info to psb_fbdev_vm_fault()
      drm/fbdev-generic: Always use shadow buffering
      drm/fbdev-generic: Remove unused prefer_shadow_fbdev flag
      drm/fb-helper: Export drm_fb_helper_release_info()
      drm/fb-helper: Support smem_len in deferred I/O
      drm/fbdev-generic: Set screen size to size of GEM buffer
      drm/fbdev-generic: Clean up after failed probing
      drm/fb-helper: Consolidate CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM
      drm/fbdev-generic: Rename symbols
      drm/radeon: Move radeon_align_pitch() next to dumb-buffer helpers
      drm/radeon: Improve fbdev object-test helper
      drm/radeon: Remove struct radeon_fbdev
      drm/radeon: Remove test for !screen_base in fbdev probing
      drm/radeon: Move fbdev object helpers before struct fb_ops et al
      drm/radeon: Fix coding style in fbdev emulation
      drm/radeon: Move fbdev cleanup code into fb_destroy callback
      drm/radeon: Correctly clean up failed display probing
      drm/radeon: Implement client-based fbdev emulation
      drm/radeon: Only build fbdev if DRM_FBDEV_EMULATION is set
      drm/tegra: Include <linux/of.h>
      drm/tegra: Include <linux/i2c.h>
      drm/tegra: Removed fb from struct tegra_fbdev
      drm/tegra: Remove struct tegra_fbdev
      drm/tegra: Hide fbdev support behind config option
      drm/tegra: Initialize fbdev DRM client
      drm/tegra: Implement fbdev emulation as in-kernel client
      drm/omapdrm: Include <linux/of.h>
      drm/omapdrm: Remove fb from struct omap_fbdev
      drm/omapdrm: Remove bo from struct omap_fbdev
      drm/omapdrm: Remove fbdev from struct omap_drm_private
      drm/omapdrm: Implement fbdev emulation as in-kernel client
      drm/msm: Include <linux/io.h>
      drm/msm: Clear aperture ownership outside of fbdev code
      drm/msm: Remove fb from struct msm_fbdev
      drm/msm: Remove struct msm_fbdev
      drm/msm: Remove fbdev from struct msm_drm_private
      drm/msm: Move module parameter 'fbdev' to fbdev code
      drm/msm: Initialize fbdev DRM client
      drm/msm: Implement fbdev emulation as in-kernel client
      drm/exynos: Remove exynos_gem from struct exynos_drm_fbdev
      drm/exynos: Remove struct exynos_drm_fbdev
      drm/exynos: Remove fb_helper from struct exynos_drm_private
      drm/exynos: Initialize fbdev DRM client
      drm/exynos: Implement fbdev emulation as in-kernel client

Tim Huang (5):
      drm/amd/pm: bump SMU 13.0.4 driver_if header version
      drm/amdgpu: reposition the gpu reset checking for reuse
      drm/amdgpu: skip ASIC reset for APUs when go to S4
      drm/amd/pm: re-enable the gfx imu when smu resume
      drm/amdgpu: allow more APUs to do mode2 reset when go to S4

Toby Chen (1):
      drm/rockchip: dw_hdmi: cleanup drm encoder during unbind

Tom Rix (23):
      drm/amdgpu: remove unused variable ring
      drm/amd/display: change several dcn201 variables
storage-class-specifier to static
      drm/amd/display: change several dcn20 variables
storage-class-specifier to static
      drm/amd/display: change several dcn30 variables
storage-class-specifier to static
      drm/amd/display: remove unused variable res_pool
      drm/amd/display: remove unused variable available
      accel/habanalabs: change unused extern decl of hdev to forward
decl of hl_device
      accel/habanalabs: set hl_capture_*_err storage-class-specifier to sta=
tic
      drm/nouveau/fifo: set gf100_fifo_nonstall_block_dump
storage-class-specifier to static
      drm/nouveau/fifo: set nvkm_engn_cgrp_get storage-class-specifier to s=
tatic
      drm/nouveau/nvfw/acr: set wpr_generic_header_dump
storage-class-specifier to static
      gpu: drm: bridge: sii9234: remove unused bridge_to_sii9234 function
      drm/gma500: remove unused gma_pipe_event function
      drm/rockchip: vop2: fix uninitialized variable possible_crtcs
      drm/msm/mdp5: set varaiable msm8x76_config
storage-class-specifier to static
      drm/vc4: remove unused render_wait variable
      drm/vmwgfx: remove unused vmw_overlay function
      drm/amd/display: remove unused average_render_time_in_us and i variab=
les
      drm/amd/display: set variable dcn3_14_soc
storage-class-specifier to static
      drm/amd/display: set variables aperture_default_system and
context0_default_system storage-class-specifier to static
      drm/amd/display: set variables dml*_funcs
storage-class-specifier to static
      drm/amd/display: remove unused matching_stream_ptrs variable
      drm/amd/pm: remove unused num_of_active_display variable

Tom St Denis (1):
      drm/amd/amdgpu: Add missing INT_STAT_DEBUG registers to GC 10.1
and 10.3 headers

Tomer Tayar (18):
      accel/habanalabs: use memhash_node_export_put() in hl_release_dmabuf(=
)
      accel/habanalabs: add info when FD released while device still in use
      accel/habanalabs: enforce release order of compute device and dma-buf
      accel/habanalabs: enable graceful reset mechanism for compute-reset
      accel/habanalabs: fix print in hl_irq_handler_eq()
      accel/habanalabs: remove hl_irq_handler_default()
      accel/habanalabs: improve readability of engines idle mask print
      accel/habanalabs: remove unneeded irq_handler variable
      accel/habanalabs: add helper function to get vm hash node
      accel/habanalabs: use notifications and graceful reset for decoder
      accel/habanalabs: use scnprintf() in print_device_in_use_info()
      accel/habanalabs: postpone mem_mgr IDR destruction to hpriv_release()
      accel/habanalabs: remove '\n' when passing strings to gaudi2_print_ev=
ent()
      accel/habanalabs: fix a maybe-uninitialized compilation warnings
      accel/habanalabs: fix a missing-braces compilation warning
      accel/habanalabs: remove completion from abnormal interrupt work name
      accel/habanalabs: fix events mask of decoder abnormal interrupts
      accel/habanalabs: add missing error flow in hl_sysfs_init()

Tong Liu01 (6):
      drm/amdgpu: add mes resume when do gfx post soft reset
      drm/amdgpu: skip unload tmr when tmr is not loaded
      drm/amd/pm: add sysfs node vclk1 and dclk1
      drm/amd/pm: enable sysfs node vclk1 and dclk1 for NV2X
      drm/amd/pm: enable sysfs node vclk1 and dclk1 for NV3X
      drm/amdgpu: refine get gpu clock counter method

Tvrtko Ursulin (5):
      drm/i915: Consolidate TLB invalidation flow
      drm/i915/selftests: Fix live_requests for all engines
      drm: Track clients by tgid and not tid
      drm/i915: Simplify vcs/bsd engine selection
      drm/i915: Fix context runtime accounting

Umesh Nerlige Ramappa (10):
      drm/i915/perf: Validate OA sseu config outside switch
      drm/i915/perf: Group engines into respective OA groups
      drm/i915/perf: Fail modprobe if i915_perf_init fails on OOM
      drm/i915/perf: Parse 64bit report header formats correctly
      drm/i915/perf: Handle non-power-of-2 reports
      drm/i915/perf: Add engine class instance parameters to perf
      drm/i915/perf: Add support for OA media units
      drm/i915/perf: Pass i915 object to perf revision helper
      drm/i915/perf: Wa_14017512683: Disable OAM if media C6 is enabled in =
BIOS
      drm/i915/mtl: Disable C6 on MTL A0 for media

Uwe Kleine-K=C3=B6nig (33):
      drm/tests: helpers: Drop empty platform remove function
      dt-bindings: display: imx: Describe drm binding for fsl,imx-lcdc
      drm: Drop ARCH_MULTIPLATFORM from dependencies
      drm/bridge: cdns-dsi: Convert to platform remove callback returning v=
oid
      drm/bridge: display-connector: Convert to platform remove
callback returning void
      drm/bridge: fsl-ldb: Convert to platform remove callback returning vo=
id
      drm/bridge: imx8qm-ldb: Convert to platform remove callback returning=
 void
      drm/bridge: imx8qxp-ldb: Convert to platform remove callback
returning void
      drm/bridge: imx8qxp-pixel-combiner: Convert to platform remove
callback returning void
      drm/bridge: imx8qxp-pixel-link: Convert to platform remove
callback returning void
      drm/bridge: imx8qxp-pxl2dpi: Convert to platform remove callback
returning void
      drm/bridge: lvds-codec: Convert to platform remove callback returning=
 void
      drm/bridge: nwl-dsi: Convert to platform remove callback returning vo=
id
      drm/bridge: simple-bridg: Convert to platform remove callback
returning void
      drm/bridge: dw-hdmi-ahb-audio: Convert to platform remove
callback returning void
      drm/bridge: dw-hdmi-cec: Convert to platform remove callback
returning void
      drm/bridge: dw-hdmi-gp-audio: Convert to platform remove
callback returning void
      drm/bridge: dw-hdmi-i2s-audio: Convert to platform remove
callback returning void
      drm/bridge: thc63lvd1024: Convert to platform remove callback
returning void
      drm/bridge: ti-tfp410: Convert to platform remove callback returning =
void
      drm/amd/display: Whitespace cleanup
      gpu: host1x: Make host1x_client_unregister() return void
      drm/tegra: rgb: Make tegra_dc_rgb_remove() return void
      drm/tegra: dc: Convert to platform remove callback returning void
      drm/tegra: dpaux: Convert to platform remove callback returning void
      drm/tegra: dsi: Convert to platform remove callback returning void
      drm/tegra: gr2d: Convert to platform remove callback returning void
      drm/tegra: gr3d: Convert to platform remove callback returning void
      drm/tegra: hdmi: Convert to platform remove callback returning void
      drm/tegra: hub: Convert to platform remove callback returning void
      drm/tegra: nvdec: Convert to platform remove callback returning void
      drm/tegra: sor: Convert to platform remove callback returning void
      drm/tegra: vic: Convert to platform remove callback returning void

Veerabadhran Gopalakrishnan (1):
      drm/amdgpu/soc21: Add video cap query support for VCN_4_0_4

Ville Syrj=C3=A4l=C3=A4 (115):
      drm/i915/lvds: Split long lines
      drm/i915/lvds: Use intel_de_rmw()
      drm/i915/lvds: Use REG_BIT() & co.
      drm/i915/lvds: Extract intel_lvds_regs.h
      drm/i915/lvds: Fix whitespace
      drm/i915/lvds: s/dev_priv/i915/
      drm/i915/lvds: s/intel_encoder/encoder/ etc.
      drm/i915/lvds: s/pipe_config/crtc_state/
      drm/i915: Don't do the WM0->WM1 copy w/a if WM1 is already enabled
      drm/i915: Introduce HAS_SAGV()
      drm/i915: Keep sagv status updated on icl+
      drm/i915: Expose SAGV state via debugfs
      drm/i915/dsb: Pimp debug/error prints
      drm/i915/dsb: Split intel_dsb_wait() from intel_dsb_commit()
      drm/i915/dsb: Introduce intel_dsb_finish()
      drm/i915: Fix VBT DSI DVO port handling
      drm/i915: Populate encoder->devdata for DSI on icl+
      drm/i915: Pick the backlight controller based on VBT on ICP+
      drm/i915: Populate wm.max_level for everyone
      drm/i915: Replace wm.max_levels with wm.num_levels and use it everywh=
ere
      drm/i915: Include stepping information in device info dump
      drm/i915: Prefix hex numbers with 0x
      drm/i915: Pass the whole encoder to hotplug_enables()
      drm/i915: Move variables to loop context
      drm/i915: Replace intel_bios_is_lspcon_present() with
intel_bios_encoder_is_lspcon()
      drm/i915: Replace intel_bios_is_lane_reversal_needed() with
intel_bios_encoder_lane_reversal()
      drm/i915: Replace intel_bios_is_port_hpd_inverted() with
intel_bios_encoder_hpd_invert()
      drm/i915: Consult the registered encoders for the ICL combo PHY w/a
      drm/i915: Populate encoder->devdata for g4x+ DP/HDMI ports
      drm/i915: Pass devdata to intel_bios_port_aux_ch()
      drm/i915: Iterate all child devs in intel_bios_is_port_present()
      drm/i915: Use encoder->devdata in eDP init
      drm/i915: Make backlight setup debugs consistent
      drm/i915: Don't hide function calls with side effects
      drm/i915: Clean up g4x+ sprite TILEOFF programming
      drm/i915: Include connector id+name in all backlight debugs/errors
      drm/i915: Reduce ELD hex dumps a bit
      drm/i915: Don't leak the DPT if drm_framebuffer_init() fails
      drm/i915: Add a few more debugs for failed framebuffer creation
      drm/i915: Use encoder->devdata more
      drm/i915: Restructure intel_bios_port_aux_ch()
      drm/i915: Pimp encoder ddc_pin/aux_ch debug messages
      drm/i915: Fix platform default aux ch for skl
      drm/i915: Rename intel_ddi_{enable,disable}_pipe_clock()
      drm/i915: Flatten intel_ddi_{enable,disable}_transcoder_clock()
      drm/i915: Give CPU transcoder timing registers TRANS_ prefix
      drm/i915: s/PIPECONF/TRANSCONF/
      drm/i915: Dump blanking start/end
      drm/i915: Define the "unmodified vblank" interrupt bit
      drm/i915: Add local adjusted_mode variable
      drm/i915: Define transcoder timing register bitmasks
      drm/i915/psr: Stop clobbering TRANS_SET_CONTEXT_LATENCY
      drm/i915/dsb: Define more DSB registers
      drm/i915/dsb: Allow vblank synchronized DSB execution
      drm/i915/dsb: Nuke the DSB debug
      drm/i915/dsb: Skip DSB command buffer setup if we have no LUTs
      drm/i915: Configure TRANS_SET_CONTEXT_LATENCY correctly on ADL+
      drm/i915: Sprinkle some FIXMEs about TGL+ DSI transcoder timing mess
      drm/i915: Remove pointless register read
      drm/i915/audio: Track audio state per-transcoder
      drm/i915: Mark FIFO underrun disabled earlier
      drm/i915: Undo rmw damage to gen3 error interrupt handler
      drm/i915: Dump PGTBL_ER on gen2/3/4 error interrupt
      drm/i915: Extract {i9xx,i965)_error_mask()
      drm/i915: Mask page table errors on gen2/3 with FBC
      drm/i915: Fix audio ELD handling for DP MST
      drm/i915: Drop useless intel_dp_has_audio() argument
      drm/edid: Fix csync detailed mode parsing
      drm/i915: Get HDR DPCD refresh timeout from VBT
      drm/i915/vrr: Fix "window2" handling
      drm/i915/psr: Fix the delayed vblank w/a
      drm/i915: Bump VBT version for expected child dev size check
      drm/i915: Populate dig_port->connected() before connector init
      drm/i915: Fix SKL DDI A digital port .connected()
      drm/i915: Get rid of the gm45 HPD live state nonsense
      drm/i915: Preserve crtc_state->inherited during state clearing
      drm/i915: Extract skl_wm_latency()
      drm/i915: Reject wm levels that exceed vblank time
      drm/i915: Don't switch to TPS1 when disabling DP_TP_CTL
      drm/i915: Don't send idle pattern after DP2.0 link training
      drm/i915: Stop using pipe_offsets[] for PIPE_MISC*
      drm/i915: s/PIPEMISC/PIPE_MISC/
      drm/i915: Define more pipe timestamp registers
      drm/i915: Program VLV/CHV PIPE_MSA_MISC register
      drm/i915: Define skl+ universal plane SURFLIVE registers
      drm/i915: Define vlv/chv sprite plane SURFLIVE registers
      drm/i915: Clean up skl+ plane alpha bits
      drm/i915: Relocate intel_plane_check_src_coordinates()
      drm/i915: Extract intel_sprite_uapi.c
      drm/i915: Update vblank timestamping stuff on seamless M/N change
      drm/i915: Add belts and suspenders locking for seamless M/N changes
      drm/i915: Relocate intel_crtc_update_active_timings()
      drm/i915: Extract intel_crtc_scanline_offset()
      drm/i915: Split icl_color_commit_noarm() from skl_color_commit_noarm(=
)
      drm/i915: Move CSC load back into .color_commit_arm() when PSR
is enabled on skl/glk
      drm/i915: Add a .color_post_update() hook
      drm/i915: Workaround ICL CSC_MODE sticky arming
      drm/i915: Disable DC states for all commits
      drm/i915/dpt: Treat the DPT BO as a framebuffer
      drm/i915/dpt: Only do the POT stride remap when using DPT
      drm/i915/dpt: Introduce HAS_DPT()
      drm/i915: Add PLANE_CHICKEN registers
      drm/i915/dpt: Add a modparam to disable DPT via the chicken bit
      drm/i915: Move PLANE_BUG_CFG bit definitions to the correct place
      drm/i915: Add i915.enable_sagv modparam
      drm/i915/ips: Make IPS debugfs per-crtc
      drm/i915/ips: Add i915_ips_false_color debugfs file
      drm/i915: Make utility pin asserts more accurate
      drm/i915: Skip cursor when writing PLANE_CHICKEN
      drm/i915: Document that PLANE_CHICKEN are for tgl+
      drm/i915: Define cursor chicken reg
      drm/i915: Fix fast wake AUX sync len
      drm/i915: Explain the magic numbers for AUX SYNC/precharge length
      drm/scdc-helper: Pimp SCDC debugs
      drm/i915: Make intel_get_crtc_new_encoder() less oopsy

Vinay Belgaumkar (2):
      drm/i915: Fix format for perf_limit_reasons
      drm/i915/mtl: Synchronize i915/BIOS on C6 enabling

Vinod Govindapillai (4):
      drm/i915/display: ignore long HPDs based on a flag
      drm/i915/display: ignore link training failures in CI
      drm/i915/reg: fix QGV points register access offsets
      drm/i915/reg: use the correct register to access SAGV block time

Vinod Polimera (16):
      drm: add helper functions to retrieve old and new crtc
      drm/bridge: use atomic enable/disable callbacks for panel bridge
      drm/bridge: add psr support for panel bridge callbacks
      drm/msm/disp/dpu: check for crtc enable rather than crtc active
to release shared resources
      drm/msm/disp/dpu: get timing engine status from intf status register
      drm/msm/disp/dpu: wait for extra vsync till timing engine status
is disabled
      drm/msm/disp/dpu: reset the datapath after timing engine disable
      drm/msm/dp: use atomic callbacks for DP bridge ops
      drm/msm/dp: Add basic PSR support for eDP
      drm/msm/dp: use the eDP bridge ops to validate eDP modes
      drm/msm/disp/dpu: use atomic enable/disable callbacks for
encoder functions
      drm/msm/disp/dpu: add PSR support for eDP interface in dpu driver
      drm/msm/disp/dpu: update dpu_enc crtc state on crtc
enable/disable during self refresh
      drm/msm/dp: set self refresh aware based on PSR support
      drm/msm/dpu: set dirty_fb flag while in self refresh mode
      msm/disp/dpu: allow atomic_check in PSR usecase

Wayne Lin (1):
      drm/amd/display: Pass the right info to drm_dp_remove_payload

Wenjing Liu (8):
      drm/amd/display: merge dc_link.h into dc.h and dc_types.h
      drm/amd/display: remove empty dc_link.c
      drm/amd/display: move dc_link functions in accessories folder to
dc_link_exports
      drm/amd/display: move dc_link functions in link root folder to
dc_link_exports
      drm/amd/display: link link_dp_dpia_bw.o in makefile
      drm/amd/display: move dc_link functions in protocols folder to
dc_link_exports
      drm/amd/display: replace all dc_link function call in link with
link functions
      drm/amd/display: convert link.h functions to function pointer style

Wesley Chalmers (3):
      drm/amd/display: Do not set DRR on pipe Commit
      drm/amd/display: Make DCN32 functions available to future DCNs
      drm/amd/display: Make DCN32 3dlut function available to future DCNs

Xiaogang Chen (2):
      drm/amdkfd: Fix BO offset for multi-VMA page migration
      drm/amdkfd: Get prange->offset after svm_range_vram_node_new

Xinlei Lee (1):
      drm/mediatek: dp: Change the aux retries times when receiving AUX_DEF=
ER

Xu Panda (1):
      drm/virtio: use strscpy() to instead of strncpy()

Yang Li (2):
      drm/arm/malidp: Use devm_platform_get_and_ioremap_resource()
      drm/arm/hdlcd: Use devm_platform_ioremap_resource()

Yang Yingliang (2):
      gpu: host1x: Fix potential double free if IOMMU is disabled
      gpu: host1x: Fix memory leak of device names

Ye Xingchen (3):
      drm/bridge: display-connector: Use dev_err_probe()
      drm: bridge: simple-bridge: Use dev_err_probe()
      gpu: host1x: mipi: Use devm_platform_get_and_ioremap_resource()

YiPeng Chai (6):
      drm/amdgpu: enable ras for mp0 v13_0_10 on SRIOV
      drm/amdgpu: reinit mes ip block during reset on SRIOV
      drm/amdgpu: resume ras for gfx v11_0_3 during reset on SRIOV
      drm/amdgpu: optimize redundant code in umc_v8_10
      drm/amdgpu: optimize redundant code in umc_v6_7
      drm/amdgpu: add gfx v11_0_3 fed irq handling for sriov

Yifan Zha (4):
      drm/amdgpu: Init MMVM_CONTEXTS_DISABLE in gmc11 golden setting under =
SRIOV
      drm/amdgpu: Add JPEG IP block to SRIOV reinit
      drm/amdgpu: Add MES KIQ dequeue in MES hw fini
      drm/amdgpu: Add MES KIQ clear to tell RLC that KIQ is dequeued

Yihan Zhu (1):
      drm/amd/display: update pixel format in DP hw sequence

YuBiao Wang (1):
      drm/amdgpu: Force signal hw_fences that are embedded in non-sched job=
s

Zack Rusin (13):
      drm/vmwgfx: Use the common gem mmap instead of the custom code
      drm/vmwgfx: Remove the duplicate bo_free function
      drm/vmwgfx: Rename vmw_buffer_object to vmw_bo
      drm/vmwgfx: Simplify fb pinning
      drm/vmwgfx: Cleanup the vmw bo usage in the cursor paths
      drm/vmwgfx: Rename dummy to is_iomem
      drm/vmwgfx: Abstract placement selection
      drm/vmwgfx: Stop using raw ttm_buffer_object's
      drm/vmwgfx: Make the driver work without the dummy resources
      drm/vmwgfx: Stop accessing buffer objects which failed init
      drm/vmwgfx: Do not drop the reference to the handle too soon
      drm/vmwgfx: Fix src/dst_pitch confusion
      drm/vmwgfx: Print errors when running on broken/unsupported configs

Zhikai Zhai (3):
      drm/amd/display: reset the scaler boundary mode
      drm/amd/display: skip wait vblank
      drm/amd/display: add scaler control for dcn32

bobzhou (3):
      drm/amdgpu/vcn: fix compilation issue with legacy gcc
      drm/amdgpu: remove unused variable
      drm/amd: fix compilation issue with legacy gcc

farah kassabri (1):
      accel/habanalabs: fix few misspelled words in the code

leiyaoyao (1):
      drm/amdgpu: Stop clearing kiq position during fini

lyndonli (3):
      drm/amdgpu: Fix call trace warning and hang when removing amdgpu devi=
ce
      drm/amdgpu: Fix the warning info when removing amdgpu device
      drm/amdgpu: Fix sdma v4 sw fini error

ruanjinjie (1):
      drm/nouveau/disp: make gv100_disp_core_mthd_base static

suijingfeng (1):
      ttm/ttm_device.h: fix a trival typo

tiancyin (1):
      drm/amd/display: fix dm irq error message in gpu recover

 .../ABI/testing/sysfs-driver-intel-i915-hwmon      |     4 +-
 Documentation/accel/index.rst                      |     1 +
 Documentation/accel/qaic/aic100.rst                |   510 +
 Documentation/accel/qaic/index.rst                 |    13 +
 Documentation/accel/qaic/qaic.rst                  |   170 +
 .../bindings/auxdisplay/holtek,ht16k33.yaml        |     2 +-
 .../bindings/display/amlogic,meson-dw-hdmi.yaml    |     4 +-
 .../bindings/display/amlogic,meson-vpu.yaml        |     4 +-
 .../bindings/display/bridge/analogix,anx7625.yaml  |     4 +-
 .../bindings/display/bridge/analogix,dp.yaml       |    63 +
 .../bindings/display/bridge/analogix_dp.txt        |    51 -
 .../bindings/display/bridge/cdns,mhdp8546.yaml     |     4 +-
 .../bindings/display/bridge/nxp,ptn3460.yaml       |     2 +-
 .../bindings/display/bridge/samsung,mipi-dsim.yaml |   255 +
 .../bindings/display/bridge/snps,dw-mipi-dsi.yaml  |    16 +-
 .../bindings/display/bridge/toshiba,tc358767.yaml  |     2 +-
 .../devicetree/bindings/display/dp-aux-bus.yaml    |     2 +-
 .../bindings/display/dsi-controller.yaml           |    18 +-
 .../bindings/display/exynos/exynos_dp.txt          |     2 +-
 .../bindings/display/exynos/exynos_dsim.txt        |    90 -
 .../bindings/display/imx/fsl,imx-lcdc.yaml         |    46 +-
 .../bindings/display/imx/nxp,imx8mq-dcss.yaml      |     4 +-
 .../bindings/display/mediatek/mediatek,ccorr.yaml  |     5 +-
 .../bindings/display/mediatek/mediatek,ethdr.yaml  |   182 +
 .../bindings/display/mediatek/mediatek,hdmi.yaml   |     2 +-
 .../bindings/display/msm/dp-controller.yaml        |    25 +-
 .../bindings/display/msm/dsi-controller-main.yaml  |    17 +-
 .../bindings/display/msm/dsi-phy-10nm.yaml         |     2 +-
 .../devicetree/bindings/display/msm/gmu.yaml       |     4 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |     4 +-
 .../devicetree/bindings/display/msm/mdp4.yaml      |     4 +-
 .../bindings/display/msm/qcom,sm6115-mdss.yaml     |    10 +-
 .../bindings/display/msm/qcom,sm8450-mdss.yaml     |     6 +-
 .../bindings/display/msm/qcom,sm8550-dpu.yaml      |   133 +
 .../bindings/display/msm/qcom,sm8550-mdss.yaml     |   333 +
 .../bindings/display/panel/boe,tv101wum-nl6.yaml   |     3 +
 .../bindings/display/panel/elida,kd35t133.yaml     |     9 +
 .../display/panel/feiyang,fy07024di26a30d.yaml     |     8 +
 .../display/panel/innolux,p120zdg-bf1.yaml         |    43 -
 .../bindings/display/panel/jadard,jd9365da-h3.yaml |     2 +
 .../bindings/display/panel/novatek,nt36523.yaml    |    85 +
 .../bindings/display/panel/novatek,nt36672a.yaml   |     6 +-
 .../bindings/display/panel/panel-simple-dsi.yaml   |    24 +-
 .../bindings/display/panel/panel-simple.yaml       |     2 +
 .../bindings/display/panel/panel-timing.yaml       |    46 +-
 .../bindings/display/panel/ronbo,rb070d30.yaml     |     2 +-
 .../bindings/display/panel/samsung,ams495qa01.yaml |    57 +
 .../display/panel/samsung,s6e88a0-ams452ef01.yaml  |     8 +
 .../bindings/display/panel/seiko,43wvf1g.yaml      |     4 +-
 .../bindings/display/panel/sitronix,st7701.yaml    |    10 +
 .../bindings/display/panel/sitronix,st7789v.yaml   |     4 +
 .../bindings/display/panel/sony,td4353-jdi.yaml    |    82 +
 .../bindings/display/panel/visionox,rm69299.yaml   |    25 +-
 .../bindings/display/panel/xinpeng,xpp055c272.yaml |     8 +
 .../devicetree/bindings/display/renesas,du.yaml    |     4 +-
 .../display/rockchip/analogix_dp-rockchip.txt      |    98 -
 .../display/rockchip/dw_mipi_dsi_rockchip.txt      |    94 -
 .../display/rockchip/rockchip,analogix-dp.yaml     |   103 +
 .../display/rockchip/rockchip,dw-mipi-dsi.yaml     |   166 +
 .../bindings/display/rockchip/rockchip,lvds.yaml   |   170 +
 .../bindings/display/rockchip/rockchip-lvds.txt    |    92 -
 .../bindings/display/simple-framebuffer.yaml       |     9 +
 .../display/tegra/nvidia,tegra114-mipi.yaml        |     2 +-
 .../display/tegra/nvidia,tegra124-sor.yaml         |    12 +-
 .../bindings/display/tegra/nvidia,tegra186-dc.yaml |     4 +-
 .../display/tegra/nvidia,tegra186-dsi-padctl.yaml  |     2 +-
 .../bindings/display/tegra/nvidia,tegra20-dsi.yaml |    12 +-
 .../display/tegra/nvidia,tegra20-hdmi.yaml         |     6 +-
 .../bindings/display/ti/ti,am65x-dss.yaml          |     6 +-
 .../bindings/display/ti/ti,j721e-dss.yaml          |     4 +-
 .../devicetree/bindings/display/ti/ti,k2g-dss.yaml |     4 +-
 .../bindings/display/xylon,logicvc-display.yaml    |    22 +-
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |    87 +-
 .../devicetree/bindings/soc/rockchip/grf.yaml      |    10 +-
 Documentation/driver-api/dma-buf.rst               |    16 +-
 .../gpu/amdgpu/display/display-manager.rst         |     2 +-
 MAINTAINERS                                        |    32 +-
 drivers/accel/Kconfig                              |     1 +
 drivers/accel/Makefile                             |     1 +
 drivers/accel/habanalabs/common/command_buffer.c   |    15 +-
 .../accel/habanalabs/common/command_submission.c   |   130 +-
 drivers/accel/habanalabs/common/debugfs.c          |   142 +-
 drivers/accel/habanalabs/common/decoder.c          |    46 +-
 drivers/accel/habanalabs/common/device.c           |   367 +-
 drivers/accel/habanalabs/common/firmware_if.c      |    19 +-
 drivers/accel/habanalabs/common/habanalabs.h       |   139 +-
 drivers/accel/habanalabs/common/habanalabs_drv.c   |    14 +-
 drivers/accel/habanalabs/common/habanalabs_ioctl.c |    60 +-
 drivers/accel/habanalabs/common/irq.c              |    84 +-
 drivers/accel/habanalabs/common/memory.c           |   144 +-
 drivers/accel/habanalabs/common/memory_mgr.c       |    15 +-
 drivers/accel/habanalabs/common/mmu/mmu.c          |    14 +-
 drivers/accel/habanalabs/common/pci/pci.c          |     2 -
 drivers/accel/habanalabs/common/security.c         |     6 +-
 drivers/accel/habanalabs/common/security.h         |     2 +-
 drivers/accel/habanalabs/common/sysfs.c            |     6 +-
 drivers/accel/habanalabs/gaudi/gaudi.c             |   151 +-
 drivers/accel/habanalabs/gaudi/gaudiP.h            |    15 -
 drivers/accel/habanalabs/gaudi2/gaudi2.c           |  1884 +-
 drivers/accel/habanalabs/gaudi2/gaudi2P.h          |    26 +-
 drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c |     2 +-
 drivers/accel/habanalabs/gaudi2/gaudi2_masks.h     |     3 +-
 drivers/accel/habanalabs/gaudi2/gaudi2_security.c  |     1 +
 drivers/accel/habanalabs/goya/goya.c               |    22 +-
 drivers/accel/habanalabs/include/common/cpucp_if.h |     9 +-
 .../accel/habanalabs/include/common/hl_boot_if.h   |    47 +-
 .../include/gaudi2/asic_reg/gaudi2_regs.h          |     9 +-
 drivers/accel/habanalabs/include/gaudi2/gaudi2.h   |     2 +
 .../include/gaudi2/gaudi2_async_events.h           |     4 +-
 .../include/gaudi2/gaudi2_async_ids_map_extended.h |  5294 +--
 .../accel/habanalabs/include/gaudi2/gaudi2_fw_if.h |     5 +-
 drivers/accel/ivpu/ivpu_drv.c                      |     4 +
 drivers/accel/ivpu/ivpu_pm.c                       |    10 -
 drivers/accel/qaic/Kconfig                         |    23 +
 drivers/accel/qaic/Makefile                        |    13 +
 drivers/accel/qaic/mhi_controller.c                |   563 +
 drivers/accel/qaic/mhi_controller.h                |    16 +
 drivers/accel/qaic/mhi_qaic_ctrl.c                 |   569 +
 drivers/accel/qaic/mhi_qaic_ctrl.h                 |    12 +
 drivers/accel/qaic/qaic.h                          |   282 +
 drivers/accel/qaic/qaic_control.c                  |  1526 +
 drivers/accel/qaic/qaic_data.c                     |  1902 +
 drivers/accel/qaic/qaic_drv.c                      |   647 +
 drivers/dma-buf/dma-buf.c                          |     2 +-
 drivers/dma-buf/dma-fence-array.c                  |    11 +
 drivers/dma-buf/dma-fence-chain.c                  |    12 +
 drivers/dma-buf/dma-fence.c                        |    59 +
 drivers/dma-buf/dma-resv.c                         |    22 +
 drivers/gpu/drm/Kconfig                            |     6 +-
 drivers/gpu/drm/Makefile                           |     4 +
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |     2 +
 drivers/gpu/drm/amd/amdgpu/Makefile                |     9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    39 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |     7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   130 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   124 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |    30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h       |     8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c         |    24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    82 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c            |    48 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h            |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |     7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |     8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h            |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |    52 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |    72 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |     9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |    40 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.c          |    46 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h          |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c           |    23 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    36 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    48 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    40 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |     4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |    87 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c             |   324 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |     4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |    21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |    61 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |     8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |    32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |    29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |    30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |     1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    20 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |    22 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3.c           |    14 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    47 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   430 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.h            |    30 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |   471 +
 .../dc/core/dc_link.c =3D> amdgpu/gfxhub_v1_2.h}     |    12 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.c           |    22 -
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    32 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |    37 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   142 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |     8 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |     5 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |    12 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |   170 +-
 drivers/gpu/drm/amd/amdgpu/mca_v3_0.c              |    44 +-
 drivers/gpu/drm/amd/amdgpu/mca_v3_0.h              |     4 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    36 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |   477 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.h            |    28 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c            |     3 +
 drivers/gpu/drm/amd/amdgpu/mmsch_v4_0.h            |     5 +
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c             |    79 +
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.h             |     1 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |   369 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.h             |    32 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    |    73 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |     2 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   101 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  1967 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.h           |    30 +
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |    53 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |    88 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    87 +-
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |     2 +
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |   161 +-
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c             |   197 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |     8 +-
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |     4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_sw_ring.c           |     2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |     8 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |     8 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |    90 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |     5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |     9 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |    70 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |    20 -
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |   487 +
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx9.asm  |    52 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |    55 +
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |     1 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |    16 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |    11 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |    21 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |     3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |     3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |     8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |    10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |    10 +-
 drivers/gpu/drm/amd/display/Kconfig                |    14 +-
 drivers/gpu/drm/amd/display/Makefile               |     4 -
 drivers/gpu/drm/amd/display/amdgpu_dm/Makefile     |     4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   354 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |     5 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |    26 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.h |    14 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |    33 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |     1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |    72 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    88 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |    15 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   149 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h    |    12 +-
 drivers/gpu/drm/amd/display/dc/Makefile            |     7 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |     9 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |     2 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |    16 +-
 .../amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c |     2 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |     2 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |     5 +
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |     5 +
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |    97 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.h   |     3 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   405 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |    38 +-
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |     7 +-
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |   415 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |    21 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stat.c      |    28 +-
 drivers/gpu/drm/amd/display/dc/core/dc_vm_helper.c |     2 -
 drivers/gpu/drm/amd/display/dc/dc.h                |   606 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |    75 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   190 +-
 drivers/gpu/drm/amd/display/dc/dc_dsc.h            |    11 +-
 drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h     |     1 -
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |    16 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |   577 -
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |     1 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   117 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |     9 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |    28 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.h  |     6 -
 drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c      |     2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_transform.c |     5 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c      |     2 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |     7 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.h      |     5 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |    62 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.h    |     2 -
 .../drm/amd/display/dc/dce110/dce110_resource.c    |     3 -
 drivers/gpu/drm/amd/display/dc/dce60/Makefile      |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.h   |     4 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c  |     4 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dwb.c   |     5 -
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dwb.h   |     4 -
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |     4 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |    24 +-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.c  |     3 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  |    29 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |     6 +-
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c    |    10 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h  |    11 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c   |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb.c   |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |    45 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_mmhubbub.c  |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c   |     2 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |    13 +-
 .../amd/display/dc/dcn20/dcn20_stream_encoder.c    |     3 +-
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c |     7 -
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c   |     2 -
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_mpc.c |     2 +-
 .../drm/amd/display/dc/dcn201/dcn201_resource.c    |     6 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c |     4 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |     4 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c  |     2 -
 .../display/dc/dcn30/dcn30_dio_stream_encoder.c    |     1 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h   |     2 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.c   |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c  |     4 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |    15 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.c  |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |     2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |    13 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |     4 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |    11 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |    13 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c   |    41 -
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c  |    31 +-
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |     5 +-
 .../display/dc/dcn31/dcn31_hpo_dp_link_encoder.c   |     1 -
 .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |    16 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |     4 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    |    51 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.h    |    10 +
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |     8 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |    12 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h   |     2 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |     1 +
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |     3 +-
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |     2 -
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |     2 -
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |    22 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.h  |    39 +-
 .../display/dc/dcn32/dcn32_dio_stream_encoder.c    |    20 +-
 .../display/dc/dcn32/dcn32_dio_stream_encoder.h    |    72 +-
 .../display/dc/dcn32/dcn32_hpo_dp_link_encoder.c   |     1 -
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h    |    62 -
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.c  |    10 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h  |     8 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |   196 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h |     9 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |     4 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c   |     8 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.h   |    13 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.h  |    71 -
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |    21 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |     7 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |   203 +-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |    16 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |     2 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |     7 +-
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   |    57 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |     5 +-
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |     3 -
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |   301 +-
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |     2 -
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |     6 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |   301 +-
 .../dc/dml/dcn314/display_rq_dlg_calc_314.c        |    12 -
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   125 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h   |     4 +
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |     9 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |     6 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |     3 +-
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |     5 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.c  |    24 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |    86 +-
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc.c       |     2 +
 drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c     |     2 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |     2 -
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |     3 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |    25 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |    54 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dwb.h        |     8 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |     3 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |    14 -
 .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |    52 -
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |     1 -
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |     2 +-
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |     8 +-
 drivers/gpu/drm/amd/display/dc/inc/link.h          |   354 +-
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |     2 +-
 drivers/gpu/drm/amd/display/dc/link/Makefile       |     2 +-
 .../amd/display/dc/link/accessories/link_dp_cts.c  |    65 +-
 .../amd/display/dc/link/accessories/link_dp_cts.h  |    19 +-
 .../display/dc/link/accessories/link_dp_trace.c    |    21 +-
 .../display/dc/link/accessories/link_dp_trace.h    |    17 +-
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.c   |    22 +-
 .../amd/display/dc/link/hwss/link_hwss_hpo_dp.c    |     8 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |   132 +-
 .../gpu/drm/amd/display/dc/link/link_detection.h   |    15 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   100 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.h    |    23 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |   275 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.h |     2 +
 .../gpu/drm/amd/display/dc/link/link_resource.h    |     3 +-
 .../gpu/drm/amd/display/dc/link/link_validation.c  |    81 +-
 .../gpu/drm/amd/display/dc/link/link_validation.h  |    11 +
 .../drm/amd/display/dc/link/protocols/link_ddc.c   |    24 +-
 .../drm/amd/display/dc/link/protocols/link_ddc.h   |    31 +
 .../display/dc/link/protocols/link_dp_capability.c |   103 +-
 .../display/dc/link/protocols/link_dp_capability.h |    28 +
 .../amd/display/dc/link/protocols/link_dp_dpia.c   |     3 +-
 .../amd/display/dc/link/protocols/link_dp_dpia.h   |     4 +-
 .../display/dc/link/protocols/link_dp_dpia_bw.c    |   175 +-
 .../display/dc/link/protocols/link_dp_dpia_bw.h    |    57 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |    30 +-
 .../dc/link/protocols/link_dp_irq_handler.h        |    12 +-
 .../amd/display/dc/link/protocols/link_dp_phy.c    |    10 +-
 .../amd/display/dc/link/protocols/link_dp_phy.h    |     3 +
 .../display/dc/link/protocols/link_dp_training.c   |    60 +-
 .../display/dc/link/protocols/link_dp_training.h   |     3 +
 .../dc/link/protocols/link_dp_training_8b_10b.c    |     4 +-
 .../dc/link/protocols/link_dp_training_auxless.c   |     2 +-
 .../dc/link/protocols/link_dp_training_auxless.h   |     2 +-
 .../dc/link/protocols/link_dp_training_dpia.c      |     9 +-
 .../dc/link/protocols/link_dp_training_dpia.h      |     2 +-
 .../link_dp_training_fixed_vs_pe_retimer.c         |   378 +-
 .../link_dp_training_fixed_vs_pe_retimer.h         |     5 +
 .../dc/link/protocols/link_edp_panel_control.c     |    56 +-
 .../dc/link/protocols/link_edp_panel_control.h     |    30 +
 .../drm/amd/display/dc/link/protocols/link_hpd.c   |    14 +-
 .../drm/amd/display/dc/link/protocols/link_hpd.h   |     7 +
 drivers/gpu/drm/amd/display/dc/os_types.h          |     4 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |     2 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |    64 +-
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |     1 +
 .../drm/amd/display/include/ddc_service_types.h    |    13 -
 .../include/{hdcp_types.h =3D> hdcp_msg_types.h}     |     0
 .../drm/amd/display/include/link_service_types.h   |    26 -
 .../drm/amd/display/modules/freesync/freesync.c    |    26 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_log.h    |     2 -
 drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |     1 +
 .../drm/amd/display/modules/power/power_helpers.c  |    11 +-
 .../include/asic_reg/athub/athub_1_8_0_offset.h    |   411 +
 .../include/asic_reg/athub/athub_1_8_0_sh_mask.h   |  1807 +
 .../drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h |     4 +
 .../amd/include/asic_reg/gc/gc_10_1_0_sh_mask.h    |    54 +
 .../drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h |     4 +
 .../amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h    |    54 +
 .../drm/amd/include/asic_reg/gc/gc_9_4_3_offset.h  |  7258 ++++
 .../drm/amd/include/asic_reg/gc/gc_9_4_3_sh_mask.h | 30535 +++++++++++++++
 .../amd/include/asic_reg/hdp/hdp_4_4_2_offset.h    |   219 +
 .../amd/include/asic_reg/hdp/hdp_4_4_2_sh_mask.h   |   663 +
 .../include/asic_reg/mmhub/mmhub_1_8_0_offset.h    |  3314 ++
 .../include/asic_reg/mmhub/mmhub_1_8_0_sh_mask.h   | 22315 +++++++++++
 .../drm/amd/include/asic_reg/mp/mp_13_0_6_offset.h |   456 +
 .../amd/include/asic_reg/mp/mp_13_0_6_sh_mask.h    |   674 +
 .../amd/include/asic_reg/nbio/nbio_7_9_0_offset.h  | 10002 +++++
 .../amd/include/asic_reg/nbio/nbio_7_9_0_sh_mask.h | 38900 +++++++++++++++=
++++
 .../amd/include/asic_reg/oss/osssys_4_2_0_offset.h |     6 +
 .../include/asic_reg/oss/osssys_4_2_0_sh_mask.h    |    11 +
 .../amd/include/asic_reg/oss/osssys_4_4_2_offset.h |   263 +
 .../include/asic_reg/oss/osssys_4_4_2_sh_mask.h    |   995 +
 .../amd/include/asic_reg/sdma/sdma_4_4_2_offset.h  |  1109 +
 .../amd/include/asic_reg/sdma/sdma_4_4_2_sh_mask.h |  3276 ++
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |     6 +
 drivers/gpu/drm/amd/include/v11_structs.h          |    16 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |    28 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   127 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |     3 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    85 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |    12 +
 .../pm/swsmu/inc/pmfw_if/smu11_driver_if_vangogh.h |     4 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_6.h |   141 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |   212 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h   |    95 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |     4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |    11 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |     3 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |    25 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile        |     2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |    11 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |     8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  2069 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h   |    32 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |    91 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |     4 +-
 drivers/gpu/drm/arm/hdlcd_drv.c                    |     8 +-
 drivers/gpu/drm/arm/malidp_drv.c                   |     9 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |     4 +-
 drivers/gpu/drm/ast/ast_dp.c                       |    10 +-
 drivers/gpu/drm/ast/ast_dp501.c                    |    40 +-
 drivers/gpu/drm/ast/ast_drv.c                      |    18 +-
 drivers/gpu/drm/ast/ast_drv.h                      |    84 +-
 drivers/gpu/drm/ast/ast_i2c.c                      |     8 +-
 drivers/gpu/drm/ast/ast_main.c                     |    24 +-
 drivers/gpu/drm/ast/ast_mm.c                       |     4 +-
 drivers/gpu/drm/ast/ast_mode.c                     |   104 +-
 drivers/gpu/drm/ast/ast_post.c                     |    94 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |     4 +-
 drivers/gpu/drm/bridge/Kconfig                     |    14 +-
 drivers/gpu/drm/bridge/Makefile                    |     1 +
 drivers/gpu/drm/bridge/adv7511/adv7533.c           |    25 +-
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c     |     6 +-
 drivers/gpu/drm/bridge/display-connector.c         |    15 +-
 drivers/gpu/drm/bridge/fsl-ldb.c                   |   109 +-
 drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c        |     6 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c       |     6 +-
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |     6 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |     8 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |     6 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |    34 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |     1 -
 drivers/gpu/drm/bridge/lvds-codec.c                |     6 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |     5 +-
 drivers/gpu/drm/bridge/panel.c                     |    70 +-
 drivers/gpu/drm/bridge/parade-ps8622.c             |     2 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |    67 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              |  1967 +
 drivers/gpu/drm/bridge/sii9234.c                   |     5 -
 drivers/gpu/drm/bridge/simple-bridge.c             |    14 +-
 .../gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c    |     6 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c      |     6 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c |     6 +-
 .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |     6 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |     8 +-
 drivers/gpu/drm/bridge/tc358762.c                  |     1 +
 drivers/gpu/drm/bridge/tc358767.c                  |     4 +-
 drivers/gpu/drm/bridge/thc63lvd1024.c              |     6 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |     8 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |     4 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |     6 +-
 drivers/gpu/drm/display/drm_scdc_helper.c          |    46 +-
 drivers/gpu/drm/drm_atomic.c                       |    60 +
 drivers/gpu/drm/drm_atomic_helper.c                |    63 +-
 drivers/gpu/drm/drm_connector.c                    |    28 +-
 drivers/gpu/drm/drm_debugfs.c                      |     4 +-
 drivers/gpu/drm/drm_displayid.c                    |    62 +-
 drivers/gpu/drm/drm_drv.c                          |    26 +-
 drivers/gpu/drm/drm_dumb_buffers.c                 |     5 +-
 drivers/gpu/drm/drm_edid.c                         |    65 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   116 +-
 drivers/gpu/drm/drm_fbdev_dma.c                    |   268 +
 drivers/gpu/drm/drm_fbdev_generic.c                |   279 +-
 drivers/gpu/drm/drm_file.c                         |     2 +-
 drivers/gpu/drm/drm_gem.c                          |    36 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |    65 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |    11 +
 drivers/gpu/drm/drm_internal.h                     |     3 -
 drivers/gpu/drm/drm_mipi_dsi.c                     |     2 +-
 drivers/gpu/drm/drm_modes.c                        |     3 +-
 drivers/gpu/drm/drm_of.c                           |    51 +
 drivers/gpu/drm/drm_prime.c                        |    10 +-
 drivers/gpu/drm/drm_probe_helper.c                 |     5 +-
 drivers/gpu/drm/drm_suballoc.c                     |   457 +
 drivers/gpu/drm/drm_vblank.c                       |    59 +-
 drivers/gpu/drm/exynos/Kconfig                     |     3 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |    13 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |     2 -
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  1813 +-
 drivers/gpu/drm/exynos/exynos_drm_fb.c             |     2 -
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |   174 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.h          |    20 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |     4 +-
 drivers/gpu/drm/gma500/Makefile                    |     1 +
 drivers/gpu/drm/gma500/fbdev.c                     |   344 +
 drivers/gpu/drm/gma500/framebuffer.c               |   341 +-
 drivers/gpu/drm/gma500/psb_drv.c                   |     5 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |    19 +-
 drivers/gpu/drm/gma500/psb_irq.c                   |    11 -
 drivers/gpu/drm/i915/Kconfig                       |     6 -
 drivers/gpu/drm/i915/Kconfig.unstable              |    21 -
 drivers/gpu/drm/i915/Makefile                      |    18 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |    53 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |    21 +-
 drivers/gpu/drm/i915/display/hsw_ips.c             |    94 +-
 drivers/gpu/drm/i915/display/hsw_ips.h             |     1 +
 .../gpu/drm/i915/{intel_pm.c =3D> display/i9xx_wm.c} |  1466 +-
 drivers/gpu/drm/i915/display/i9xx_wm.h             |    21 +
 drivers/gpu/drm/i915/display/icl_dsi.c             |   318 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |   116 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |     1 +
 drivers/gpu/drm/i915/display/intel_audio.c         |    92 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |   161 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |   266 +-
 drivers/gpu/drm/i915/display/intel_bios.h          |    27 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |    49 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |    41 +-
 drivers/gpu/drm/i915/display/intel_color.c         |   119 +-
 drivers/gpu/drm/i915/display/intel_color.h         |     1 +
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |    48 +-
 .../gpu/drm/i915/display/intel_combo_phy_regs.h    |     4 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |    47 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |     5 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |    20 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.h   |     2 +
 drivers/gpu/drm/i915/display/intel_cursor.c        |     6 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |   304 +-
 drivers/gpu/drm/i915/display/intel_ddi.h           |    12 +-
 drivers/gpu/drm/i915/display/intel_display.c       |   856 +-
 drivers/gpu/drm/i915/display/intel_display.h       |    14 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |    38 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   673 +-
 .../gpu/drm/i915/display/intel_display_debugfs.h   |     6 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |    98 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |     4 +
 .../drm/i915/display/intel_display_power_well.c    |   141 +-
 .../gpu/drm/i915/display/intel_display_reg_defs.h  |    10 +-
 drivers/gpu/drm/i915/display/intel_display_rps.c   |    81 +
 drivers/gpu/drm/i915/display/intel_display_rps.h   |    22 +
 drivers/gpu/drm/i915/display/intel_display_types.h |    44 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |   403 +-
 drivers/gpu/drm/i915/display/intel_dmc.h           |    44 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |   176 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |    83 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.h        |     4 +
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |    84 +-
 drivers/gpu/drm/i915/display/intel_dp_aux_regs.h   |    84 +
 .../gpu/drm/i915/display/intel_dp_link_training.c  |    48 +-
 .../gpu/drm/i915/display/intel_dp_link_training.h  |     2 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |    61 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |    51 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   165 +-
 drivers/gpu/drm/i915/display/intel_dpt.c           |    27 +
 drivers/gpu/drm/i915/display/intel_dpt.h           |     2 +
 drivers/gpu/drm/i915/display/intel_drrs.c          |    16 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |    42 +-
 drivers/gpu/drm/i915/display/intel_dsb.h           |     5 +-
 drivers/gpu/drm/i915/display/intel_dsb_regs.h      |    67 +
 .../gpu/drm/i915/display/intel_dsi_dcs_backlight.c |     5 +
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |     1 +
 drivers/gpu/drm/i915/display/intel_dvo.c           |     7 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |    18 +-
 drivers/gpu/drm/i915/display/intel_fb.h            |     1 +
 drivers/gpu/drm/i915/display/intel_fbdev.c         |     8 +-
 drivers/gpu/drm/i915/display/intel_fbdev.h         |     8 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |   158 +-
 drivers/gpu/drm/i915/display/intel_fdi_regs.h      |   151 +
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |    20 +
 drivers/gpu/drm/i915/display/intel_fifo_underrun.h |     3 +
 drivers/gpu/drm/i915/display/intel_gmbus.c         |    30 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   173 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c      |   831 +
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h      |    26 +
 drivers/gpu/drm/i915/display/intel_hdmi.c          |    87 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |     9 +
 drivers/gpu/drm/i915/display/intel_lpe_audio.c     |     6 +-
 drivers/gpu/drm/i915/display/intel_lpe_audio.h     |     4 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c        |     2 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |   339 +-
 drivers/gpu/drm/i915/display/intel_lvds_regs.h     |    65 +
 drivers/gpu/drm/i915/display/intel_mg_phy_regs.h   |     4 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |    60 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |    40 +-
 drivers/gpu/drm/i915/display/intel_opregion.h      |     5 +
 drivers/gpu/drm/i915/display/intel_panel.c         |     1 +
 drivers/gpu/drm/i915/display/intel_pch_display.c   |    73 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |    10 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |    16 +-
 drivers/gpu/drm/i915/display/intel_pps_regs.h      |    78 +
 drivers/gpu/drm/i915/display/intel_psr.c           |   517 +-
 drivers/gpu/drm/i915/display/intel_psr.h           |    19 +-
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |   260 +
 drivers/gpu/drm/i915/display/intel_qp_tables.c     |   187 +-
 drivers/gpu/drm/i915/display/intel_qp_tables.h     |     4 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |   186 +-
 drivers/gpu/drm/i915/display/intel_sprite_uapi.c   |   127 +
 drivers/gpu/drm/i915/display/intel_sprite_uapi.h   |    15 +
 drivers/gpu/drm/i915/display/intel_tc.c            |  1477 +-
 drivers/gpu/drm/i915/display/intel_tc.h            |     9 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |     9 +-
 drivers/gpu/drm/i915/display/intel_tv_regs.h       |   490 +
 drivers/gpu/drm/i915/display/intel_vblank.c        |    96 +-
 drivers/gpu/drm/i915/display/intel_vblank.h        |     2 +
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   133 +-
 drivers/gpu/drm/i915/display/intel_vdsc_regs.h     |   489 +
 drivers/gpu/drm/i915/display/intel_vrr.c           |    10 +-
 drivers/gpu/drm/i915/display/intel_wm.c            |   408 +
 drivers/gpu/drm/i915/display/intel_wm.h            |    37 +
 .../{intel_pm_types.h =3D> display/intel_wm_types.h} |     8 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |    15 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |   312 +-
 drivers/gpu/drm/i915/display/skl_watermark.h       |     7 +-
 drivers/gpu/drm/i915/display/skl_watermark_regs.h  |   160 +
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   160 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |    18 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |    22 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |     7 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |    14 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |    10 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c           |     3 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |     2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |     2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |     3 +
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |    17 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |    17 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h            |     2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |     7 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c         |    12 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |     2 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |    19 +-
 drivers/gpu/drm/i915/gt/intel_context.h            |    15 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |   141 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |     9 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |    24 +
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |    12 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |    43 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c          |     1 +
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |     3 +
 drivers/gpu/drm/i915/gt/intel_gsc.h                |     2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |   166 +-
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c         |     4 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c             |     4 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |     1 -
 drivers/gpu/drm/i915/gt/intel_gt_print.h           |     3 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |    19 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c           |     2 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |     2 +
 drivers/gpu/drm/i915/gt/intel_rc6.c                |    27 +
 drivers/gpu/drm/i915/gt/intel_rc6.h                |     2 +
 drivers/gpu/drm/i915/gt/intel_rc6_types.h          |     2 +
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |    27 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |   119 +-
 drivers/gpu/drm/i915/gt/intel_reset_types.h        |     2 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |     4 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |    69 +-
 drivers/gpu/drm/i915/gt/intel_rps.h                |     4 +-
 drivers/gpu/drm/i915/gt/intel_rps_types.h          |     2 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c               |     3 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |   256 +-
 drivers/gpu/drm/i915/gt/selftest_gt_pm.c           |     2 +-
 drivers/gpu/drm/i915/gt/selftest_llc.c             |     1 -
 drivers/gpu/drm/i915/gt/selftest_rps.c             |    10 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c        |    14 +-
 drivers/gpu/drm/i915/gt/selftest_tlb.c             |   388 +
 drivers/gpu/drm/i915/gt/sysfs_engines.c            |    72 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h    |    17 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c          |     9 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h          |     2 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c          |    28 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h          |     2 +
 .../drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c  |   109 +
 .../drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h  |    61 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |     2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     |    56 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |   141 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c    |     6 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |    24 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_print.h       |     3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c          |     8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h         |     4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |    61 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |   140 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h  |     2 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |    51 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.h             |     7 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |    56 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c      |     2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |   137 +-
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c          |    42 +-
 .../gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c    |    23 +-
 .../gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c    |    11 +-
 drivers/gpu/drm/i915/gvt/display.c                 |    16 +-
 drivers/gpu/drm/i915/gvt/edid.c                    |     1 +
 drivers/gpu/drm/i915/gvt/handlers.c                |    23 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |    37 +-
 drivers/gpu/drm/i915/i915_driver.c                 |    70 +-
 drivers/gpu/drm/i915/i915_drm_client.c             |     2 +-
 drivers/gpu/drm/i915/i915_drv.h                    |    22 +-
 drivers/gpu/drm/i915/i915_file_private.h           |     2 +-
 drivers/gpu/drm/i915/i915_gem.c                    |    18 +-
 drivers/gpu/drm/i915/i915_getparam.c               |     2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |     3 +
 drivers/gpu/drm/i915/i915_gpu_error.h              |     1 +
 drivers/gpu/drm/i915/i915_hwmon.c                  |    77 +-
 drivers/gpu/drm/i915/i915_irq.c                    |   144 +-
 drivers/gpu/drm/i915/i915_params.c                 |     6 +
 drivers/gpu/drm/i915/i915_params.h                 |     2 +
 drivers/gpu/drm/i915/i915_pci.c                    |     4 +-
 drivers/gpu/drm/i915/i915_perf.c                   |   570 +-
 drivers/gpu/drm/i915/i915_perf.h                   |     4 +-
 drivers/gpu/drm/i915/i915_perf_oa_regs.h           |    78 +
 drivers/gpu/drm/i915/i915_perf_types.h             |    75 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |    11 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  2137 +-
 drivers/gpu/drm/i915/i915_reg_defs.h               |    31 +
 drivers/gpu/drm/i915/i915_request.c                |     1 -
 drivers/gpu/drm/i915/i915_scatterlist.c            |     2 +-
 drivers/gpu/drm/i915/i915_sysfs.c                  |     1 -
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |     7 -
 drivers/gpu/drm/i915/i915_vma.c                    |     3 +-
 drivers/gpu/drm/i915/intel_clock_gating.c          |   888 +
 drivers/gpu/drm/i915/intel_clock_gating.h          |    14 +
 drivers/gpu/drm/i915/intel_device_info.c           |    28 +-
 drivers/gpu/drm/i915/intel_device_info.h           |     3 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |    81 +-
 drivers/gpu/drm/i915/intel_pcode.c                 |    35 +-
 drivers/gpu/drm/i915/intel_pm.h                    |    34 -
 drivers/gpu/drm/i915/intel_region_ttm.c            |     1 +
 drivers/gpu/drm/i915/intel_runtime_pm.c            |     2 +
 drivers/gpu/drm/i915/intel_uncore.c                |    66 +-
 drivers/gpu/drm/i915/intel_wakeref.h               |     2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |    65 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.h               |     2 +
 .../gpu/drm/i915/pxp/intel_pxp_cmd_interface_42.h  |    15 +
 .../gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h |     6 +
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c           |     2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c            |     4 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.h            |     6 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c       |    10 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.h       |     5 +
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           |   113 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h         |     3 +
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |   360 +-
 .../gpu/drm/i915/selftests/i915_live_selftests.h   |     1 +
 drivers/gpu/drm/i915/selftests/i915_request.c      |   134 +-
 drivers/gpu/drm/i915/soc/intel_dram.c              |   152 +
 drivers/gpu/drm/i915/vlv_suspend.c                 |     4 +-
 drivers/gpu/drm/imx/Kconfig                        |     1 +
 drivers/gpu/drm/imx/Makefile                       |     1 +
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |     4 +-
 drivers/gpu/drm/imx/ipuv3/Kconfig                  |     2 +-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |     4 +-
 drivers/gpu/drm/imx/lcdc/Kconfig                   |     7 +
 drivers/gpu/drm/imx/lcdc/Makefile                  |     1 +
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c                |   546 +
 drivers/gpu/drm/kmb/kmb_drv.c                      |     4 +-
 drivers/gpu/drm/lima/lima_drv.c                    |     6 +-
 drivers/gpu/drm/lima/lima_gem.c                    |    12 +-
 drivers/gpu/drm/logicvc/logicvc_drm.c              |     4 +-
 drivers/gpu/drm/mcde/mcde_drv.c                    |     6 +-
 drivers/gpu/drm/mediatek/Makefile                  |     2 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |    35 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |    94 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |   547 +
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |    38 +
 drivers/gpu/drm/mediatek/mtk_dp.c                  |    15 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |    89 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h            |     6 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |   135 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |    78 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   475 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |    30 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           |    24 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.h           |     3 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c               |   370 +
 drivers/gpu/drm/mediatek/mtk_ethdr.h               |    25 +
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |    24 +
 drivers/gpu/drm/meson/meson_drv.c                  |     4 +-
 drivers/gpu/drm/meson/meson_venc.c                 |     4 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |     3 +
 drivers/gpu/drm/mgag200/mgag200_mode.c             |    22 +-
 drivers/gpu/drm/msm/Kconfig                        |     2 +
 drivers/gpu/drm/msm/adreno/a2xx.xml.h              |    54 +-
 drivers/gpu/drm/msm/adreno/a3xx.xml.h              |    30 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |    11 +
 drivers/gpu/drm/msm/adreno/a4xx.xml.h              |    38 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |    11 +
 drivers/gpu/drm/msm/adreno/a5xx.xml.h              |    44 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |    69 +-
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              |   795 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |    64 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |     7 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |    30 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   183 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |     2 +-
 drivers/gpu/drm/msm/adreno/adreno_common.xml.h     |    52 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |    33 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   174 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |     4 +
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h        |   115 +-
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   210 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |   210 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |   237 +
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |   217 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |   244 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |   156 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |   129 +
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |   119 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |   226 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |   158 +
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |   222 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |   234 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |   239 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   337 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |    81 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |     7 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |     8 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |    22 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |    21 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  2155 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   106 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |    49 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |     5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |     4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |     8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   187 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   115 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |    98 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |     1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   867 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |    40 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |    22 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |    12 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |    19 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h           |    40 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |     5 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h           |    40 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |     2 +-
 drivers/gpu/drm/msm/disp/mdp_common.xml.h          |    40 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c       |     3 -
 drivers/gpu/drm/msm/dp/dp_aux.c                    |    90 +-
 drivers/gpu/drm/msm/dp/dp_aux.h                    |     2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                |    82 +-
 drivers/gpu/drm/msm/dp/dp_catalog.h                |     6 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |    90 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |     5 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |    44 +-
 drivers/gpu/drm/msm/dp/dp_display.h                |     2 +
 drivers/gpu/drm/msm/dp/dp_drm.c                    |   173 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |     9 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |    36 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |    22 +
 drivers/gpu/drm/msm/dp/dp_panel.h                  |     6 +
 drivers/gpu/drm/msm/dp/dp_reg.h                    |    27 +
 drivers/gpu/drm/msm/dsi/dsi.c                      |     7 +-
 drivers/gpu/drm/msm/dsi/dsi.xml.h                  |    41 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   161 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |     9 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |    14 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h         |    40 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h         |    40 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h         |    40 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h         |    40 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h    |    40 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h          |    36 +-
 drivers/gpu/drm/msm/dsi/mmss_cc.xml.h              |    40 +-
 drivers/gpu/drm/msm/dsi/sfpb.xml.h                 |    38 +-
 drivers/gpu/drm/msm/hdmi/hdmi.xml.h                |    62 +-
 drivers/gpu/drm/msm/hdmi/qfprom.xml.h              |    40 +-
 drivers/gpu/drm/msm/msm_atomic.c                   |    29 +-
 drivers/gpu/drm/msm/msm_debugfs.c                  |     6 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   109 +-
 drivers/gpu/drm/msm/msm_drv.h                      |    15 +-
 drivers/gpu/drm/msm/msm_fbdev.c                    |   173 +-
 drivers/gpu/drm/msm/msm_fence.c                    |    86 +-
 drivers/gpu/drm/msm/msm_fence.h                    |    23 +-
 drivers/gpu/drm/msm/msm_gem.c                      |   150 +-
 drivers/gpu/drm/msm/msm_gem.h                      |    29 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |    37 +-
 drivers/gpu/drm/msm/msm_gem_vma.c                  |    91 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |     8 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |    12 +-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c              |     2 +-
 drivers/gpu/drm/msm/msm_io_utils.c                 |     1 +
 drivers/gpu/drm/msm/msm_iommu.c                    |    38 +-
 drivers/gpu/drm/msm/msm_kms.h                      |     8 -
 drivers/gpu/drm/msm/msm_mdss.c                     |   198 +-
 drivers/gpu/drm/msm/msm_mmu.h                      |     1 +
 drivers/gpu/drm/msm/msm_ringbuffer.c               |     8 +-
 drivers/gpu/drm/msm/msm_submitqueue.c              |     2 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c                  |     4 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |     4 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |     3 -
 drivers/gpu/drm/nouveau/nouveau_hwmon.c            |    10 +-
 drivers/gpu/drm/nouveau/nouveau_led.h              |     2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c   |     2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c   |     2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c    |     2 +-
 drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c            |     2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c     |     2 +-
 drivers/gpu/drm/omapdrm/Kconfig                    |     2 +-
 drivers/gpu/drm/omapdrm/omap_debugfs.c             |     6 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |    13 +-
 drivers/gpu/drm/omapdrm/omap_drv.h                 |     3 -
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |   163 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.h               |     9 +-
 drivers/gpu/drm/panel/Kconfig                      |    31 +
 drivers/gpu/drm/panel/Makefile                     |     3 +
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |   126 +
 drivers/gpu/drm/panel/panel-edp.c                  |     2 +
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   |   209 +-
 .../gpu/drm/panel/panel-magnachip-d53e6ea8966.c    |   522 +
 drivers/gpu/drm/panel/panel-novatek-nt36523.c      |   777 +
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c        |    12 +
 drivers/gpu/drm/panel/panel-sitronix-st7701.c      |   144 +
 drivers/gpu/drm/panel/panel-sony-td4353-jdi.c      |   329 +
 drivers/gpu/drm/panfrost/panfrost_devfreq.c        |    30 +
 drivers/gpu/drm/panfrost/panfrost_device.h         |     2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |    48 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |     8 +
 drivers/gpu/drm/pl111/pl111_drv.c                  |     4 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                      |    11 +
 drivers/gpu/drm/radeon/Kconfig                     |     1 +
 drivers/gpu/drm/radeon/Makefile                    |     3 +-
 drivers/gpu/drm/radeon/radeon.h                    |    57 +-
 drivers/gpu/drm/radeon/radeon_display.c            |     4 -
 drivers/gpu/drm/radeon/radeon_drv.c                |     3 +-
 drivers/gpu/drm/radeon/radeon_drv.h                |     1 -
 drivers/gpu/drm/radeon/radeon_fb.c                 |   400 -
 drivers/gpu/drm/radeon/radeon_fbdev.c              |   422 +
 drivers/gpu/drm/radeon/radeon_gem.c                |    24 +
 drivers/gpu/drm/radeon/radeon_ib.c                 |    12 +-
 drivers/gpu/drm/radeon/radeon_kms.c                |    18 -
 drivers/gpu/drm/radeon/radeon_mode.h               |    20 +-
 drivers/gpu/drm/radeon/radeon_object.h             |    25 +-
 drivers/gpu/drm/radeon/radeon_sa.c                 |   316 +-
 drivers/gpu/drm/radeon/radeon_semaphore.c          |     4 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |     7 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |    38 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |     4 +-
 drivers/gpu/drm/rcar-du/rcar_du_group.c            |    16 +-
 drivers/gpu/drm/rcar-du/rcar_du_regs.h             |    26 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c              |     2 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |   176 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.h                |    12 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |     5 -
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |    42 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |    16 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |    19 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |     6 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |    81 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |     5 -
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |    19 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.h            |     6 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |    18 +
 drivers/gpu/drm/scheduler/sched_entity.c           |    11 +-
 drivers/gpu/drm/scheduler/sched_fence.c            |    46 +
 drivers/gpu/drm/scheduler/sched_main.c             |    31 +-
 drivers/gpu/drm/sti/Kconfig                        |     2 +-
 drivers/gpu/drm/sti/sti_drv.c                      |     4 +-
 drivers/gpu/drm/stm/Kconfig                        |     2 +-
 drivers/gpu/drm/stm/drv.c                          |     4 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c              |     2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |     4 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c                |     2 +-
 drivers/gpu/drm/tegra/Kconfig                      |     2 +-
 drivers/gpu/drm/tegra/Makefile                     |     2 +
 drivers/gpu/drm/tegra/dc.c                         |    22 +-
 drivers/gpu/drm/tegra/dc.h                         |     2 +-
 drivers/gpu/drm/tegra/dpaux.c                      |     6 +-
 drivers/gpu/drm/tegra/drm.c                        |    23 +-
 drivers/gpu/drm/tegra/drm.h                        |    27 +-
 drivers/gpu/drm/tegra/dsi.c                        |    51 +-
 drivers/gpu/drm/tegra/fb.c                         |   242 +-
 drivers/gpu/drm/tegra/fbdev.c                      |   241 +
 drivers/gpu/drm/tegra/gem.c                        |     1 +
 drivers/gpu/drm/tegra/gr2d.c                       |    14 +-
 drivers/gpu/drm/tegra/gr3d.c                       |    14 +-
 drivers/gpu/drm/tegra/hdmi.c                       |    14 +-
 drivers/gpu/drm/tegra/hub.c                        |    13 +-
 drivers/gpu/drm/tegra/nvdec.c                      |    14 +-
 drivers/gpu/drm/tegra/output.c                     |     3 +
 drivers/gpu/drm/tegra/plane.c                      |    16 +-
 drivers/gpu/drm/tegra/rgb.c                        |     7 +-
 drivers/gpu/drm/tegra/sor.c                        |    59 +-
 drivers/gpu/drm/tegra/vic.c                        |    14 +-
 drivers/gpu/drm/tests/drm_format_helper_test.c     |   146 +-
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |     6 -
 drivers/gpu/drm/tidss/tidss_dispc.c                |    12 +-
 drivers/gpu/drm/tidss/tidss_dispc.h                |     8 +-
 drivers/gpu/drm/tidss/tidss_drv.c                  |     4 +-
 drivers/gpu/drm/tidss/tidss_plane.c                |    20 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |     4 +-
 drivers/gpu/drm/tiny/arcpgu.c                      |     4 +-
 drivers/gpu/drm/tiny/bochs.c                       |     1 -
 drivers/gpu/drm/tiny/cirrus.c                      |   499 +-
 drivers/gpu/drm/tiny/ofdrm.c                       |     8 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |    33 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |    36 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |    19 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |    13 +-
 drivers/gpu/drm/ttm/ttm_device.c                   |     1 -
 drivers/gpu/drm/ttm/ttm_pool.c                     |   111 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |     1 -
 drivers/gpu/drm/tve200/tve200_drv.c                |     4 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |    26 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |     4 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |     2 +-
 drivers/gpu/drm/vc4/vc4_gem.c                      |    78 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |    69 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |     1 -
 drivers/gpu/drm/vc4/vc4_irq.c                      |     2 -
 drivers/gpu/drm/vc4/vc4_validate.c                 |     4 +-
 drivers/gpu/drm/vgem/vgem_drv.h                    |    11 -
 drivers/gpu/drm/vgem/vgem_fence.c                  |     1 +
 drivers/gpu/drm/virtio/Kconfig                     |    11 +
 drivers/gpu/drm/virtio/virtgpu_display.c           |     6 +
 drivers/gpu/drm/virtio/virtgpu_drv.c               |     4 +
 drivers/gpu/drm/virtio/virtgpu_kms.c               |    39 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c             |     4 +
 drivers/gpu/drm/virtio/virtgpu_vq.c                |     3 +-
 drivers/gpu/drm/vkms/vkms_output.c                 |    15 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |    10 +-
 drivers/gpu/drm/vmwgfx/Makefile                    |     2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |   407 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h                 |   203 +
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c                |    14 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c             |    53 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c            |    36 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c            |    65 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |    55 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   247 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |   105 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c              |     2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |    93 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   295 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |    48 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |   102 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c                |    45 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c                |    35 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c            |    28 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c         |    68 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |   246 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource_priv.h      |    10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |    53 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c             |    67 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_so.c                 |     6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |   323 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_streamoutput.c       |    20 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |   107 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |   134 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_va.c                 |     6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c         |   150 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.h         |    10 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  |     4 +-
 drivers/gpu/host1x/Kconfig                         |     2 +-
 drivers/gpu/host1x/bus.c                           |     6 +-
 drivers/gpu/host1x/context.c                       |    24 +-
 drivers/gpu/host1x/mipi.c                          |     4 +-
 drivers/gpu/host1x/syncpt.c                        |     8 +-
 drivers/gpu/ipu-v3/Kconfig                         |     2 +-
 drivers/misc/mei/client.c                          |     4 +-
 drivers/misc/mei/hdcp/mei_hdcp.c                   |   105 +-
 drivers/misc/mei/hdcp/mei_hdcp.h                   |   354 -
 drivers/misc/mei/pci-me.c                          |    20 +-
 drivers/ps3/ps3av.c                                |     9 +-
 drivers/staging/media/tegra-video/csi.c            |     8 +-
 drivers/staging/media/tegra-video/vi.c             |     8 +-
 drivers/staging/sm750fb/sm750.c                    |    16 +-
 drivers/video/Kconfig                              |     3 +
 drivers/video/Makefile                             |     1 +
 drivers/video/aperture.c                           |     8 +-
 drivers/video/cmdline.c                            |   133 +
 drivers/video/fbdev/Kconfig                        |     5 +-
 drivers/video/fbdev/aty/radeon_base.c              |    10 +-
 drivers/video/fbdev/core/Makefile                  |     3 +-
 drivers/video/fbdev/core/fb_cmdline.c              |    94 +-
 drivers/video/fbdev/core/modedb.c                  |     8 +-
 include/drm/bridge/samsung-dsim.h                  |   115 +
 include/drm/display/drm_dp.h                       |     3 +
 include/drm/display/drm_dp_helper.h                |    13 +
 include/drm/display/drm_scdc_helper.h              |     7 +-
 include/drm/drm_atomic.h                           |     7 +
 include/drm/drm_atomic_helper.h                    |    26 +
 include/drm/drm_displayid.h                        |    12 +-
 include/drm/drm_drv.h                              |    21 -
 include/drm/drm_edid.h                             |    12 +-
 include/drm/drm_fb_helper.h                        |    14 +-
 include/drm/drm_fbdev_dma.h                        |    15 +
 include/drm/drm_file.h                             |     3 +-
 include/drm/drm_gem.h                              |    13 +
 include/drm/drm_gem_shmem_helper.h                 |    30 +-
 include/drm/drm_gem_vram_helper.h                  |     4 +-
 include/drm/drm_mode_config.h                      |     7 -
 include/drm/drm_modeset_helper_vtables.h           |    29 +-
 include/drm/drm_of.h                               |    12 +
 include/drm/drm_suballoc.h                         |   108 +
 include/drm/drm_vblank.h                           |     1 +
 include/drm/gpu_scheduler.h                        |    23 +
 include/drm/i915_hdcp_interface.h                  |   539 +
 include/drm/i915_mei_hdcp_interface.h              |   184 -
 include/drm/i915_pciids.h                          |    14 +-
 include/drm/ttm/ttm_device.h                       |     2 +-
 include/drm/ttm/ttm_tt.h                           |    10 +-
 include/linux/dma-fence.h                          |    22 +
 include/linux/dma-resv.h                           |     2 +
 include/linux/fb.h                                 |     1 -
 include/linux/host1x.h                             |     2 +-
 include/uapi/drm/drm.h                             |    57 +-
 include/uapi/drm/habanalabs_accel.h                |   105 +-
 include/uapi/drm/i915_drm.h                        |    25 +-
 include/uapi/drm/msm_drm.h                         |    18 +-
 include/uapi/drm/qaic_accel.h                      |   397 +
 include/uapi/linux/kfd_ioctl.h                     |    14 +-
 include/uapi/linux/sync_file.h                     |    37 +-
 include/video/cmdline.h                            |    20 +
 1202 files changed, 183681 insertions(+), 30634 deletions(-)
 create mode 100644 Documentation/accel/qaic/aic100.rst
 create mode 100644 Documentation/accel/qaic/index.rst
 create mode 100644 Documentation/accel/qaic/qaic.rst
 create mode 100644
Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
 create mode 100644
Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
 delete mode 100644
Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
 create mode 100644
Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yam=
l
 create mode 100644
Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yam=
l
 create mode 100644
Documentation/devicetree/bindings/display/rockchip/rockchip,lvds.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
 create mode 100644 drivers/accel/qaic/Kconfig
 create mode 100644 drivers/accel/qaic/Makefile
 create mode 100644 drivers/accel/qaic/mhi_controller.c
 create mode 100644 drivers/accel/qaic/mhi_controller.h
 create mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.c
 create mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.h
 create mode 100644 drivers/accel/qaic/qaic.h
 create mode 100644 drivers/accel/qaic/qaic_control.c
 create mode 100644 drivers/accel/qaic/qaic_data.c
 create mode 100644 drivers/accel/qaic/qaic_drv.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c
 rename drivers/gpu/drm/amd/{display/dc/core/dc_link.c =3D>
amdgpu/gfxhub_v1_2.h} (83%)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dc_link.h
 rename drivers/gpu/drm/amd/display/include/{hdcp_types.h =3D>
hdcp_msg_types.h} (100%)
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/athub/athub_1_8_0_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/athub/athub_1_8_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_3_offset=
.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_3_sh_mas=
k.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_4_4_2_offs=
et.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_4_4_2_sh_m=
ask.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_1_8_0_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_1_8_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_6_offse=
t.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_6_sh_ma=
sk.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_9_0_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_9_0_sh_mask.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_4_2_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_4_2_sh_mask.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/sdma/sdma_4_4_2_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/sdma/sdma_4_4_2_sh_mask.h
 create mode 100644
drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_6.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pm=
fw.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pp=
smc.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
 create mode 100644 drivers/gpu/drm/drm_fbdev_dma.c
 create mode 100644 drivers/gpu/drm/drm_suballoc.c
 create mode 100644 drivers/gpu/drm/gma500/fbdev.c
 delete mode 100644 drivers/gpu/drm/i915/Kconfig.unstable
 rename drivers/gpu/drm/i915/{intel_pm.c =3D> display/i9xx_wm.c} (73%)
 create mode 100644 drivers/gpu/drm/i915/display/i9xx_wm.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_rps.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_rps.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_aux_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dsb_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_fdi_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_lvds_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_pps_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_psr_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_sprite_uapi.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_sprite_uapi.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_tv_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_vdsc_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_wm.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_wm.h
 rename drivers/gpu/drm/i915/{intel_pm_types.h =3D>
display/intel_wm_types.h} (89%)
 create mode 100644 drivers/gpu/drm/i915/display/skl_watermark_regs.h
 create mode 100644 drivers/gpu/drm/i915/gt/selftest_tlb.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit=
.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit=
.h
 create mode 100644 drivers/gpu/drm/i915/intel_clock_gating.c
 create mode 100644 drivers/gpu/drm/i915/intel_clock_gating.h
 delete mode 100644 drivers/gpu/drm/i915/intel_pm.h
 create mode 100644 drivers/gpu/drm/imx/lcdc/Kconfig
 create mode 100644 drivers/gpu/drm/imx/lcdc/Makefile
 create mode 100644 drivers/gpu/drm/imx/lcdc/imx-lcdc.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.=
h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
 create mode 100644 drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36523.c
 create mode 100644 drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
 delete mode 100644 drivers/gpu/drm/radeon/radeon_fb.c
 create mode 100644 drivers/gpu/drm/radeon/radeon_fbdev.c
 create mode 100644 drivers/gpu/drm/tegra/fbdev.c
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
 create mode 100644 drivers/video/cmdline.c
 create mode 100644 include/drm/bridge/samsung-dsim.h
 create mode 100644 include/drm/drm_fbdev_dma.h
 create mode 100644 include/drm/drm_suballoc.h
 create mode 100644 include/drm/i915_hdcp_interface.h
 delete mode 100644 include/drm/i915_mei_hdcp_interface.h
 create mode 100644 include/uapi/drm/qaic_accel.h
 create mode 100644 include/video/cmdline.h
