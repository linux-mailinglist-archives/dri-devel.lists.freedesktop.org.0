Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A513FC245
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 07:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BCF895E2;
	Tue, 31 Aug 2021 05:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1008895E2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 05:53:24 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id s25so25144939edw.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 22:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=1wQxpj3U/bmazeZp0tlwubjUrbbsQZBqw4fVye2ulmw=;
 b=f5x/T9AtsRVq3l+0JE0l7Aa7WzepNKbUEhm5yycNzWQHR+hxMuybWmQbVP86WBQbe/
 EyV6RRDDyvCRDedNe0DDF+ARJ5EfJhWUchB1WYs4RxpNm5yEbpOTiV2tXbLIijOMJyy+
 tGPt/wPqWXrrwu2tl84S1ACKcZe9ldwc6DEu7xBUCZgoto9sQIA748nfzyqhN4QWHci0
 9QqzewVwQmBtuQG2RiEKbNIseUogytMzkhHkSC6L30iinWMcCkj9ENQGQKViq5dPFPrp
 CtMUHRUD27EYpDL8/EcqgozUWZrz5a6XKJEdifl/UJy3JAY3BEu/xSKJ22HI1aDXwpBu
 vXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=1wQxpj3U/bmazeZp0tlwubjUrbbsQZBqw4fVye2ulmw=;
 b=UVb7gyjtjcoKH4eIDHfF4VIaNpnI+v9BuI7vjbzRgi97jFEwhWCdLCep3Mi2F1nvw5
 53EIeYaJDjjpmefDCc41KxWUGkgMvm1TObErYoxKcnlg4uR1W3x3TovvCeCXjIXlcT0c
 vk0pi2eco+lCqQpuNhyt9k4P346S5B2mo4Ra6MAorBvhdpytJfSKpVWe3+eR8jnMamOd
 puMF6X8qYPuuaSQOBDdZkR3LuNdDkkUL/MOV9mhAsy+SSlTelvfUsFbooT7YYL/8UR/l
 bsVR4mecBLq4NNzG1VRQ9YjHMi/SNuRUWX/G94mWBBs1KT3PbPh9ECHuptOe4GsQD2NY
 S1vQ==
X-Gm-Message-State: AOAM531sGDJ5TBY3JQoWl1hGUaadTJldGULBVB5WrW1ORUhQ6xS9b2JF
 grh/O77Y683TqQOpjUd1mH+xhJbUbUzzQOFwEus=
X-Google-Smtp-Source: ABdhPJyk/HUDy93Cwq3SXuQZswpUSC3c9zHpzqWLtIwwroCzajVfcXHAy40VjaZxpchZAYXtPA+mfJe0EvNdbNAXg7A=
X-Received: by 2002:a05:6402:148:: with SMTP id
 s8mr28159034edu.298.1630389202229; 
 Mon, 30 Aug 2021 22:53:22 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 31 Aug 2021 15:53:10 +1000
Message-ID: <CAPM=9txeN-qCRJvYV552zdo2H9iVy1ruVrq=YdZBP5Dmpc3Jmg@mail.gmail.com>
Subject: [git pull] drm for 5.15-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Linus,

This is the main drm pull request for v5.15-rc1.

Dependencies: (you might want to wait for these to land via their own
trees before pulling this)
- stable branch from Greg containing a bus callback return type change
- asoc/alsa shared tree for HDMI codec changes

Conflicts:
There are a bunch of conflicts with your tree, but none of them seem
too serious, but I might have missed something.

I've put the results of my merge here.
https://cgit.freedesktop.org/~airlied/linux/log/?h=3Ddrm-next-5.15-merged

Highlights:
- i915 has seen a lot of refactoring and uAPI cleanups due to a change
in the upstream direction going forward
  - this has all been audited with known userspace, but there may be
some pitfalls that were missed.
- i915 now uses common TTM to enable discrete memory on DG1/2 GPUs
- i915 enables Jasper and Elkhart Lake by default and has preliminary
XeHP/DG2 support
- amdgpu adds support for Cyan Skillfish
- lots of implicit fencing rules documented and fixed up in drivers
- msm now uses the core scheduler
- the irq midlayer has been removed for non-legacy drivers
- the sysfb code now works on more than x86.

Otherwise the usual smattering of stuff everywhere, panels, bridges,
refactorings.

Dave.

drm-next-2021-08-31-1:
drm for v5.15-rc1

core:
- extract i915 eDP backlight into core
- DP aux bus support
- drm_device.irq_enabled removed
- port drivers to native irq interfaces
- export gem shadow plane handling for vgem
- print proper driver name in framebuffer registration
- driver fixes for implicit fencing rules
- ARM fixed rate compression modifier added
- updated fb damage handling
- rmfb ioctl logging/docs
- drop drm_gem_object_put_locked
- define DRM_FORMAT_MAX_PLANES
- add gem fb vmap/vunmap helpers
- add lockdep_assert(once) helpers
- mark drm irq midlayer as legacy
- use offset adjusted bo mapping conversion

vgaarb:
- cleanups

fbdev:
- extend efifb handling to all arches
- div by 0 fixes for multiple drivers

udmabuf:
- add hugepage mapping support

dma-buf:
- non-dynamic exporter fixups
- document implicit fencing rules

amdgpu:
- Initial Cyan Skillfish support
- switch virtual DCE over to vkms based atomic
- VCN/JPEG power down fixes
- NAVI PCIE link handling fixes
- AMD HDMI freesync fixes
- Yellow Carp + Beige Goby fixes
- Clockgating/S0ix/SMU/EEPROM fixes
- embed hw fence in job
- rework dma-resv handling
- ensure eviction to system ram

amdkfd:
- uapi: SVM address range query added
- sysfs leak fix
- GPUVM TLB optimizations
- vmfault/migration counters

i915:
- Enable JSL and EHL by default
- preliminary XeHP/DG2 support
- remove all CNL support (never shipped)
- move to TTM for discrete memory support
- allow mixed object mmap handling
- GEM uAPI spring cleaning
  - add I915_MMAP_OBJECT_FIXED
  - reinstate ADL-P mmap ioctls
  - drop a bunch of unused by userspace features
  - disable and remove GPU relocations
- revert some i915 misfeatures
- major refactoring of GuC for Gen11+
- execbuffer object locking separate step
- reject caching/set-domain on discrete
- Enable pipe DMC loading on XE-LPD and ADL-P
- add PSF GV point support
- Refactor and fix DDI buffer translations
- Clean up FBC CFB allocation code
- Finish INTEL_GEN() and friends macro conversions

nouveau:
- add eDP backlight support
- implicit fence fix

msm:
- a680/7c3 support
- drm/scheduler conversion

panfrost:
- rework GPU reset

virtio:
- fix fencing for planes

ast:
- add detect support

bochs:
- move to tiny GPU driver

vc4:
- use hotplug irqs
- HDMI codec support

vmwgfx:
- use internal vmware device headers

ingenic:
- demidlayering irq

rcar-du:
- shutdown fixes
- convert to bridge connector helpers

zynqmp-dsub:
- misc fixes

mgag200:
- convert PLL handling to atomic

mediatek:
- MT8133 AAL support
- gem mmap object support
- MT8167 support

etnaviv:
- NXP Layerscape LS1028A SoC support
- GEM mmap cleanups

tegra:
- new user API

exynos:
- missing unlock fix
- build warning fix
- use refcount_t
The following changes since commit ff1176468d368232b684f75e82563369208bc371=
:

  Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2021-08-31-1

for you to fetch changes up to 8f0284f190e6a0aa09015090568c03f18288231a:

  Merge tag 'amd-drm-next-5.15-2021-08-27' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-08-30
09:06:03 +1000)

----------------------------------------------------------------
drm for v5.15-rc1

core:
- extract i915 eDP backlight into core
- DP aux bus support
- drm_device.irq_enabled removed
- port drivers to native irq interfaces
- export gem shadow plane handling for vgem
- print proper driver name in framebuffer registration
- driver fixes for implicit fencing rules
- ARM fixed rate compression modifier added
- updated fb damage handling
- rmfb ioctl logging/docs
- drop drm_gem_object_put_locked
- define DRM_FORMAT_MAX_PLANES
- add gem fb vmap/vunmap helpers
- add lockdep_assert(once) helpers
- mark drm irq midlayer as legacy
- use offset adjusted bo mapping conversion

vgaarb:
- cleanups

fbdev:
- extend efifb handling to all arches
- div by 0 fixes for multiple drivers

udmabuf:
- add hugepage mapping support

dma-buf:
- non-dynamic exporter fixups
- document implicit fencing rules

amdgpu:
- Initial Cyan Skillfish support
- switch virtual DCE over to vkms based atomic
- VCN/JPEG power down fixes
- NAVI PCIE link handling fixes
- AMD HDMI freesync fixes
- Yellow Carp + Beige Goby fixes
- Clockgating/S0ix/SMU/EEPROM fixes
- embed hw fence in job
- rework dma-resv handling
- ensure eviction to system ram

amdkfd:
- uapi: SVM address range query added
- sysfs leak fix
- GPUVM TLB optimizations
- vmfault/migration counters

i915:
- Enable JSL and EHL by default
- preliminary XeHP/DG2 support
- remove all CNL support (never shipped)
- move to TTM for discrete memory support
- allow mixed object mmap handling
- GEM uAPI spring cleaning
  - add I915_MMAP_OBJECT_FIXED
  - reinstate ADL-P mmap ioctls
  - drop a bunch of unused by userspace features
  - disable and remove GPU relocations
- revert some i915 misfeatures
- major refactoring of GuC for Gen11+
- execbuffer object locking separate step
- reject caching/set-domain on discrete
- Enable pipe DMC loading on XE-LPD and ADL-P
- add PSF GV point support
- Refactor and fix DDI buffer translations
- Clean up FBC CFB allocation code
- Finish INTEL_GEN() and friends macro conversions

nouveau:
- add eDP backlight support
- implicit fence fix

msm:
- a680/7c3 support
- drm/scheduler conversion

panfrost:
- rework GPU reset

virtio:
- fix fencing for planes

ast:
- add detect support

bochs:
- move to tiny GPU driver

vc4:
- use hotplug irqs
- HDMI codec support

vmwgfx:
- use internal vmware device headers

ingenic:
- demidlayering irq

rcar-du:
- shutdown fixes
- convert to bridge connector helpers

zynqmp-dsub:
- misc fixes

mgag200:
- convert PLL handling to atomic

mediatek:
- MT8133 AAL support
- gem mmap object support
- MT8167 support

etnaviv:
- NXP Layerscape LS1028A SoC support
- GEM mmap cleanups

tegra:
- new user API

exynos:
- missing unlock fix
- build warning fix
- use refcount_t

----------------------------------------------------------------
Aaron Liu (3):
      drm/amd/pm: Add waiting for response of mode-reset message for yellow=
 carp
      drm/amdgpu: update yellow carp external rev_id handling
      drm/amdgpu: add yellow carp pci id (v2)

Aaron Rice (1):
      drm/amdgpu: rework smu11 i2c for generic operation

Abhinav Kumar (2):
      drm/msm/dsi: update dsi register header file for tpg
      drm/msm/dsi: add support for dsi test pattern generator

Ainux (1):
      drm/ast: Add detect function support

Ainux.Wang (1):
      drm/ast: Zero is missing in detect function

Akhil P Oommen (3):
      drm/msm/a6xx: Fix llcc configuration for a660 gpu
      drm/msm/a6xx: Use rev to identify SKU
      drm/msm/a6xx: Add support for Adreno 7c Gen 3 gpu

Alex Deucher (16):
      drm/amdgpu: add a mutex for the smu11 i2c bus (v2)
      drm/amdgpu/pm: rework i2c xfers on sienna cichlid (v4)
      drm/amdgpu/pm: rework i2c xfers on arcturus (v5)
      drm/amdgpu/pm: add smu i2c implementation for navi1x (v5)
      drm/amdgpu: add new helper for handling EEPROM i2c transfers
      drm/amdgpu/ras: switch ras eeprom handling to use generic helper
      drm/amdgpu/ras: switch fru eeprom handling to use generic helper (v2)
      drm/amdgpu: i2c subsystem uses 7 bit addresses
      drm/amdgpu: add I2C_CLASS_HWMON to SMU i2c buses
      drm/amdgpu: only set restart on first cmd of the smu i2c transaction
      drm/amdgpu: fix 64 bit divide in eeprom code
      drm/amdgpu: add license to umc_8_7_0_sh_mask.h
      drm/amdgpu/display: only enable aux backlight control for OLED panels
      drm/amdgpu/display: add support for multiple backlights
      drm/amdgpu: don't enable baco on boco platforms in runpm
      drm/amdgpu: handle VCN instances when harvesting (v2)

Alexander Sverdlin (1):
      video: ep93xx: Prepare clock before using it

Alistair Francis (1):
      drm/panel: Add support for E Ink VB3300-KCA

Alvin Lee (1):
      drm/amd/display: Adjust types and formatting for future development

Alyssa Rosenzweig (2):
      documentation: Update #nouveau IRC channel network
      maintainers: Update freedesktop.org IRC channels

Andrey Grodzovsky (10):
      drm/ttm: Fix multihop assert on eviction.
      drm/amdgpu: Fix BUG_ON assert
      drm/amdgpu: Remember to wait 10ms for write buffer flush v2
      dmr/amdgpu: Add RESTART handling also to smu_v11_0_i2c (VG20)
      drm/amdgpu: Drop i > 0 restriction for issuing RESTART
      drm/amdgpu: Send STOP for the last byte of msg only
      drm/amd/pm: SMU I2C: Return number of messages processed
      drm/amdgpu/pm: ADD I2C quirk adapter table
      drm/amdgpu: Switch to VRAM buffer for USBC PD FW.
      drm/amdgpu: Switch to LFB for USBC PD FW in psp v13

Animesh Manna (1):
      drm/i915/dg2: Update to bigjoiner path

Anshuman Gupta (3):
      drm/i915/hdcp: Nuke Platform check for mst hdcp init
      drm/i915/debugfs: DISPLAY_VER 13 lpsp capability
      drm/i915/dg1: Adjust the AUDIO power domain

Anson Jacob (5):
      drm/amdgpu: Fix documentaion for amdgpu_bo_add_to_shadow_list
      drm/amd/amdgpu: Update debugfs link_settings output link_rate field i=
n hex
      drm/amd/amdgpu: Add a new line to debugfs phy_settings output
      drm/amdgpu: Fix documentaion for dm_dmub_outbox1_low_irq
      drm/amd/display: use GFP_ATOMIC in amdgpu_dm_irq_schedule_work

Anthony Koo (8):
      drm/amd/display: [FW Promotion] Release 0.0.72
      drm/amd/display: [FW Promotion] Release 0.0.73
      drm/amd/display: [FW Promotion] Release 0.0.75
      drm/amd/display: [FW Promotion] Release 0.0.76
      drm/amd/display: [FW Promotion] Release 0.0.77
      drm/amd/display: [FW Promotion] Release 0.0.78
      drm/amd/display: 3.2.148
      drm/amd/display: [FW Promotion] Release 0.0.79

Antonio Borneo (1):
      drm/stm: dsi: compute the transition time from LP to HS and back

Anusha Srivatsa (9):
      drm/i915/dmc: Introduce DMC_FW_MAIN
      drm/i915/xelpd: Pipe A DMC plugging
      drm/i915/adl_p: Pipe B DMC Support
      drm/i915/adl_p: Load DMC
      drm/i915/step: s/<platform>_revid_tbl/<platform>_revids
      drm/i915/step: Add macro magic for handling steps
      drm/i915/dmc: Change intel_get_stepping_info()
      drm/i915/firmware: Update to DMC v2.12 on TGL
      drm/i915/firmware: Update to DMC v2.03 on RKL

Aric Cyr (9):
      drm/amd/display: 3.2.142
      drm/amd/display: Round KHz up when calculating clock requests
      drm/amd/display: increase max EDID size to 2k
      drm/amd/display: 3.2.143
      drm/amd/display: 3.2.144
      drm/amd/display: 3.2.145
      drm/amd/display: 3.2.146
      drm/amd/display: 3.2.147
      drm/amd/display: 3.2.149

Artjom Vejsel (3):
      dt-bindings: Add QiShenglong vendor prefix
      dt-bindings: Add DT bindings for QiShenglong Gopher 2b panel
      drm/panel-simple: add Gopher 2b LCD panel

Ashley Thomas (1):
      drm/amd/display: Add AUX I2C tracing.

Aurabindo Pillai (3):
      drm/amd/display: add debug print for DCC validation failure
      drm/amd/display: Update number of DCN3 clock states
      drm/amd/display: Remove duplicate dml init

Badal Nilawar (1):
      drm/i915: dgfx cards need to wait on pcode's uncore init done

Baokun Li (3):
      drm/msm: Use list_move_tail instead of list_del/list_add_tail in msm_=
gem.c
      drm/vmwgfx: Use list_move_tail instead of list_del/list_add_tail
in vmwgfx_cmdbuf.c
      drm/vmwgfx: Use list_move_tail instead of list_del/list_add_tail
in vmwgfx_cmdbuf_res.c

Beatriz Martins de Carvalho (2):
      drm/vkms: replace macro in vkms_release()
      drm/vkms: Create a debugfs file to get vkms config data

Bhanuprakash Modem (1):
      drm/i915/display: Fix state mismatch in drm infoframe

Bindu Ramamurthy (2):
      drm/amd/display: Populate socclk entries for dcn3.02/3.03
      drm/amd/display: Populate dtbclk entries for dcn3.02/3.03

Bing Guo (2):
      drm/amd/display: Fix Dynamic bpp issue with 8K30 with Navi 1X
      drm/amd/display: Increase stutter watermark for dcn303

Bjorn Andersson (3):
      dt-bindings: display: simple: Add AUO B133HAN05 & B140HAN06
      drm/panel: simple: Add support for two more AUO panels
      drm: msm: Add 680 gpu to the adreno gpu list

Boris Brezillon (17):
      drm/panfrost: Make sure MMU context lifetime is not bound to panfrost=
_priv
      drm/sched: Declare entity idle only after HW submission
      drm/sched: Document what the timedout_job method should do
      drm/sched: Allow using a dedicated workqueue for the timeout/fault td=
r
      drm/panfrost: Make ->run_job() return an ERR_PTR() when appropriate
      drm/panfrost: Get rid of the unused JS_STATUS_EVENT_ACTIVE definition
      drm/panfrost: Drop the pfdev argument passed to panfrost_exception_na=
me()
      drm/panfrost: Do the exception -> string translation using a table
      drm/panfrost: Expose a helper to trigger a GPU reset
      drm/panfrost: Use a threaded IRQ for job interrupts
      drm/panfrost: Simplify the reset serialization logic
      drm/panfrost: Make sure job interrupts are masked before resetting
      drm/panfrost: Disable the AS on unhandled page faults
      drm/panfrost: Reset the GPU when the AS_ACTIVE bit is stuck
      drm/panfrost: Don't reset the GPU on job faults unless we really have=
 to
      drm/panfrost: Kill in-flight jobs on FD close
      drm/panfrost: Increase the AS_ACTIVE polling timeout

Borislav Petkov (1):
      drm/amdgpu: Fix build with missing pm_suspend_target_state module exp=
ort

Cai Huoqing (6):
      drm/pl111: Remove unused including <linux/version.h>
      drm: Fix typo in comments
      drm/amd/display: Fix typo in comments
      gpu/drm/radeon: Fix typo in comments
      drm/vmwgfx: Make use of PFN_ALIGN/PFN_UP helper macro
      drm/vmwgfx: Replace "vmw_num_pages" with "PFN_UP"

Camille Cho (1):
      drm/amd/display: Only set default brightness for OLED

Candice Li (7):
      drm/amd/amdgpu: add consistent PSP FW loading size checking
      drm/amd/amdgpu: remove redundant host to psp cmd buf allocations
      drm/amd/amdgpu: consolidate PSP TA context
      drm/amd/amdgpu: remove unnecessary RAS context field
      drm/amd: consolidate TA shared memory structures
      drm/amd/amdgpu: add name field back to ras_common_if
      drm/amd/amdgpu: consolidate PSP TA init shared buf functions

Charlene Liu (1):
      drm/amd/display: reset dpcd_cap.dpcd_rev for passive dongle.

Chengming Gui (2):
      drm/amd/pm: Fix BACO state setting for Beige_Goby
      drm/amdgpu: add DID for beige goby

Chengzhe Liu (2):
      drm/amdgpu: Clear doorbell interrupt status for Sienna Cichlid
      drm/amdgpu: Add msix restore for pass-through mode

Chris Morgan (1):
      drm/panfrost: devfreq: Don't display error for EPROBE_DEFER

Chris Wilson (8):
      drm/i915/selftests: Reorder tasklet_disable vs local_bh_disable
      drm/i915/gt: Add an insert_entry for gen8_ppgtt
      drm/i915/gt: Add a routine to iterate over the pagetables of a GTT
      drm/i915/gt: Export the pinned context constructor and destructor
      drm/i915/gt: Pipelined page migration
      drm/i915/gt: Pipelined clear
      drm/i915/gt: Setup a default migration context on the GT
      drm/i915/userptr: Probe existence of backing struct pages upon creati=
on

Christian K=C3=B6nig (10):
      drm/nouveau: init the base GEM fields for internal BOs
      dma-buf: some dma_fence_chain improvements
      dma-buf: add dma_fence_chain_alloc/free v3
      drm/amdgpu: unwrap fence chains in the explicit sync fence
      drm/amdgpu: rework dma_resv handling v3
      ydrm/amdgpu: always allow evicting to SYSTEM domain
      dma-buf: fix dma_resv_test_signaled test_all handling v2
      drm/nouveau: always wait for the exclusive fence
      drm/msm: always wait for the exclusive fence
      drm/amdgpu: use the preferred pin domain after the check

Christoph Hellwig (7):
      vgaarb: remove VGA_DEFAULT_DEVICE
      vgaarb: remove vga_conflicts
      vgaarb: move the kerneldoc for vga_set_legacy_decoding to vgaarb.c
      vgaarb: cleanup vgaarb.h
      vgaarb: provide a vga_client_unregister wrapper
      vgaarb: remove the unused irq_set_state argument to vga_client_regist=
er
      vgaarb: don't pass a cookie to vga_client_register

Christophe Branchereau (1):
      drm/panel: Add Innolux EJ030NA 3.0" 320x480 panel

Christophe JAILLET (4):
      drm/amd/pm: Fix a memory leak in an error handling path in
'vangogh_tables_init()'
      drm/msm/dsi: Fix some reference counted resource leaks
      drm/amdgpu: switch from 'pci_' to 'dma_' API
      drm/radeon: switch from 'pci_' to 'dma_' API

Chun-Kuang Hu (4):
      drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb
      drm/mediatek: Remove struct cmdq_client
      drm/mediatek: Detect CMDQ execution timeout
      drm/mediatek: Add cmdq_handle in mtk_crtc

Chun-Liang Chang (1):
      drm/amd/display: DMUB Outbound Interrupt Process-X86

ChunyouTang (1):
      drm/panfrost:fix the exception name always "UNKNOWN"

Clint Taylor (2):
      drm/i915/adl_p: Add initial ADL_P Workarounds
      drm/i915/dg1: Compute MEM Bandwidth using MCHBAR

Colin Ian King (6):
      drm/gma500/oaktrail_lvds: replace continue with break
      drm/amdgpu/display: make a const array common_rates static,
makes object smaller
      video: fbdev: arcfb: remove redundant initialization of variable err
      drm/bridge: make a const array static, makes object smaller
      drm/amd/display: Remove redundant initialization of variable eng_id
      drm/amd/pm: Fix spelling mistake "firwmare" -> "firmware"

Dafna Hirschfeld (1):
      drm/mediatek: Test component initialization earlier in the
function mtk_drm_crtc_create

Dale Zhao (1):
      drm/amd/display: ensure dentist display clock update finished in DCN2=
0

Dan Carpenter (7):
      drm/amdgpu: fix amdgpu_preempt_mgr_new()
      drm/amdgpu: fix a signedness bug in __verify_ras_table_checksum()
      drm/amdgpu: Fix signedness bug in __amdgpu_eeprom_xfer()
      drm/amdgpu: unlock on error in amdgpu_ras_debugfs_table_read()
      drm/amdgpu: return -EFAULT if copy_to_user() fails
      drm/amdgpu: check for allocation failure in amdgpu_vkms_sw_init()
      drm/i915/gt: Potential error pointer dereference in pinned_context()

Daniel Vetter (37):
      drm/i915/gem: Remove duplicated call to ops->pread
      drm/i915/eb: Fix pagefault disabling in the first slowpath
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
      drm/i915: Improve debug Kconfig texts a bit
      drm/shmem-helper: Align to page size in dumb_create
      drm/i915: Ditch i915 globals shrink infrastructure
      drm/plane: remove drm_helper_get_plane_damage_clips
      drm/plane: check that fb_damage is set up when used
      drm/plane: Move drm_plane_enable_fb_damage_clips into core
      drm/i915: Check for nomodeset in i915_init() first
      drm/i915: move i915_active slab to direct module init/exit
      drm/i915: move i915_buddy slab to direct module init/exit
      drm/i915: move intel_context slab to direct module init/exit
      drm/i915: move gem_context slab to direct module init/exit
      drm/i915: move gem_objects slab to direct module init/exit
      drm/i915: move request slabs to direct module init/exit
      drm/i915: move scheduler slabs to direct module init/exit
      drm/i915: move vma slab to direct module init/exit
      drm/i915: Remove i915_globals
      drm/i915: Extract i915_module.c
      drm: Fix oops in damage self-tests by mocking damage property
      drm/i915: Disable gpu relocations
      drm/i915: delete gpu reloc code

Daniele Ceraolo Spurio (3):
      drm/i915: extract steered reg access to common function
      drm/i915/guc: Unblock GuC submission on Gen11+
      drm/i915/xehp: handle new steering options

Darren Powell (7):
      amdgpu/pm: Replace navi10 usage of sprintf with sysfs_emit
      amdgpu/pm: Replace smu11 usage of sprintf with sysfs_emit
      amdgpu/pm: Replace smu12/13 usage of sprintf with sysfs_emit
      amdgpu/pm: Replace vega10 usage of sprintf with sysfs_emit
      amdgpu/pm: Replace vega12,20 usage of sprintf with sysfs_emit
      amdgpu/pm: Replace hwmgr smu usage of sprintf with sysfs_emit
      amdgpu/pm: Replace amdgpu_pm usage of sprintf with sysfs_emit

Dave Airlie (23):
      Merge tag 'drm-intel-next-2021-07-08' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-2021-07-16' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-misc-next-2021-07-22' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Backmerge tag 'v5.14-rc3' into drm-next
      Merge tag 'du-next-20210728' of
git://linuxtv.org/pinchartl/media into drm-next
      Merge tag 'drm-misc-next-2021-07-29' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-msm-next-2021-07-28' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'amd-drm-next-5.15-2021-07-29' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-2021-08-05' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'bus_remove_return_void-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core into
drm-next
      Merge tag 'amd-drm-next-5.15-2021-08-06' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-gt-next-2021-08-06-1' of
ssh://git.freedesktop.org/git/drm/drm-intel into drm-next
      Merge tag 'drm-xilinx-dpsub-20210809' of
git://linuxtv.org/pinchartl/media into drm-next
      Merge tag 'drm-intel-next-2021-08-10-1' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-2021-08-12' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'mediatek-drm-next-5.15' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-next
      Merge tag 'drm-msm-next-2021-08-12' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'amd-drm-next-5.15-2021-08-20' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge commit '81fd23e2b3ccf71c807e671444e8accaba98ca53' of
https://git.pengutronix.de/git/lst/linux into drm-next
      Merge tag 'drm/tegra/for-5.15-rc1' of
ssh://git.freedesktop.org/git/tegra/linux into drm-next
      Merge tag 'exynos-drm-next-for-v5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-next
      Merge tag 'drm-intel-next-fixes-2021-08-26' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'amd-drm-next-5.15-2021-08-27' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

David Heidelberg (4):
      drm/msm/mdp4: refactor HW revision detection into read_mdp_hw_revisio=
n
      drm/msm/mdp4: move HW revision detection to earlier phase
      drm/msm: mdp4: drop vblank get/put from prepare/complete_commit
      drm/msi/mdp4: populate priv->kms in mdp4_kms_init

David Stevens (1):
      drm/virtio: set non-cross device blob uuid_state

Desmond Cheong Zhi Xi (10):
      drm: avoid circular locks in drm_mode_getconnector
      drm: avoid blocking in drm_clients_info's rcu section
      drm: add a locked version of drm_is_current_master
      drm: serialize drm_file.master with a new spinlock
      drm: protect drm_master pointers in drm_lease.c
      drm: use the lookup lock in drm_is_current_master
      drm: clarify usage of drm leases
      drm: clean up unused kerneldoc in drm_lease.c
      drm: add lockdep assert to drm_is_current_master_locked
      drm/vmwgfx: fix potential UAF in vmwgfx_surface.c

Dillon Min (2):
      dt-bindings: display: panel: Add ilitek ili9341 panel bindings
      drm/panel: Add ilitek ili9341 panel driver

Dmitry Baryshkov (14):
      drm/msm/dsi: drop gdsc regulator handling
      drm/msm/dsi: phy: use of_device_get_match_data
      drm/msm/dsi: drop msm_dsi_phy_get_shared_timings
      drm/msm/dsi: rename dual DSI to bonded DSI
      drm/msm/dsi: add three helper functions
      drm/msm/dpu: support setting up two independent DSI connectors
      drm/msm/mdp5: move mdp5_encoder_set_intf_mode after msm_dsi_modeset_i=
nit
      drm/msm/dp: stop calling set_encoder_mode callback
      drm/msm/dsi: stop calling set_encoder_mode callback
      drm/msm/kms: drop set_encoder_mode callback
      drm/msm/dpu: add support for alpha blending properties
      drm/msm/dpu: make dpu_hw_ctl_clear_all_blendstages clear necessary LM=
s
      dt-bindings: display: msm: dsi-controller-main: restore assigned-cloc=
ks
      drm/msm/dsi: add continuous clock support for 7nm PHY

Dmitry Osipenko (2):
      drm/tegra: dc: Support memory bandwidth management
      drm/tegra: dc: Extend debug stats with total number of events

Dmytro Laktyushkin (2):
      drm/amd/display: remove faulty assert
      drm/amd/display: remove compbuf size wait

Dom Cobley (4):
      drm/vc4: hdmi: Set HD_CTL_WHOLSMP and HD_CTL_CHALIGN_SET
      drm/vc4: hdmi: Set HDMI_MAI_FMT
      drm/vc4: hdmi: Set VC4_HDMI_MAI_CONFIG_FORMAT_REVERSE
      drm/vc4: hdmi: Remove firmware logic for MAI threshold setting

Dongwon Kim (1):
      udmabuf: configurable list_limit and size_limit_mb

Douglas Anderson (21):
      dt-bindings: display: simple: List hpd properties in panel-simple
      dt-bindings: drm: Introduce the DP AUX bus
      dt-bindings: drm/bridge: ti-sn65dsi86: Add aux-bus child
      drm: Introduce the DP AUX bus
      drm/panel: panel-simple: Allow panel-simple be a DP AUX endpoint devi=
ce
      drm/panel: panel-simple: Stash DP AUX bus; allow using it for DDC
      drm/bridge: ti-sn65dsi86: Promote the AUX channel to its own sub-dev
      drm/bridge: ti-sn65dsi86: Add support for the DP AUX bus
      drm/bridge: ti-sn65dsi86: Don't read EDID blob over DDC
      drm/bridge: ti-sn65dsi86: Improve probe errors with dev_err_probe()
      arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
      drm/dp: Move panel DP AUX backlight support to drm_dp_helper
      drm/panel-simple: Power the panel when probing DP AUX backlight
      drm/dp: For drm_panel_dp_aux_backlight(), init backlight as disabled
      drm/dp: Don't zero PWMGEN_BIT_COUNT when driver_pwm_freq_hz not speci=
fied
      drm/bridge: ti-sn65dsi86: Fix power off sequence
      drm/bridge: ti-sn65dsi86: Add some 100 us delays
      Revert "drm/panel-simple: Add Samsung ATNA33XC20"
      Revert "drm/panel-simple: Support for delays between GPIO & regulator=
"
      drm/panel: atna33xc20: Introduce the Samsung ATNA33XC20 panel
      drm/msm: Use nvmem_cell_read_variable_le_u32() to read speed bin

Dylan Yip (1):
      drm: xlnx: zynqmp_dpsub: Update dependencies for ZynqMP DP

Emil Velikov (1):
      drm/i915: apply WaEnableVGAAccessThroughIOPort as needed

Emily Deng (1):
      drm/amdgpu: Correct the irq numbers for virtual crtc

Emily.Deng (1):
      drm/amdgpu: Restore msix after FLR

Eric Bernstein (2):
      drm/amd/display: Always wait for update lock status
      drm/amd/display: Remove invalid assert for ODM + MPC case

Eric Huang (19):
      drm/amdkfd: Only apply TLB flush optimization on ALdebaran
      Revert "drm/amdkfd: Only apply TLB flush optimization on ALdebaran"
      Revert "drm/amdkfd: Add memory sync before TLB flush on unmap"
      Revert "drm/amdgpu: Fix warning of Function parameter or member
not described"
      Revert "drm/amdkfd: Make TLB flush conditional on mapping"
      Revert "drm/amdgpu: Add table_freed parameter to amdgpu_vm_bo_update"
      Revert "drm/amdkfd: Add heavy-weight TLB flush after unmapping"
      Revert "Revert "drm/amdkfd: Add heavy-weight TLB flush after unmappin=
g""
      Revert "Revert "drm/amdgpu: Add table_freed parameter to
amdgpu_vm_bo_update""
      Revert "Revert "drm/amdkfd: Make TLB flush conditional on mapping""
      Revert "Revert "drm/amdgpu: Fix warning of Function parameter or
member not described""
      Revert "Revert "drm/amdkfd: Add memory sync before TLB flush on unmap=
""
      Revert "Revert "drm/amdkfd: Add heavy-weight TLB flush after unmappin=
g""
      Revert "Revert "drm/amdgpu: Add table_freed parameter to
amdgpu_vm_bo_update""
      Revert "Revert "drm/amdkfd: Make TLB flush conditional on mapping""
      Revert "Revert "drm/amdgpu: Fix warning of Function parameter or
member not described""
      Revert "Revert "drm/amdkfd: Add memory sync before TLB flush on unmap=
""
      Revert "Revert "drm/amdkfd: Only apply TLB flush optimization on
ALdebaran""
      drm/amdkfd: Only apply heavy-weight TLB flush on Aldebaran

Eric Yang (6):
      drm/amd/display: implement workaround for riommu related hang
      drm/amd/display: add workaround for riommu invalidation request hang
      drm/amd/display: change zstate allow msg condition
      drm/amd/display: fix missing reg offset
      drm/amd/display: refactor riommu invalidation wa
      drm/amd/display: refactor riommu invalidation wa

Evan Quan (17):
      drm/amd/pm: new SmuMetrics data structure for Sienna Cichlid
      drm/amd/pm: update the gpu metrics data retrieving for Sienna Cichlid
      drm/amd/pm: bump DRIVER_IF_VERSION for Sienna Cichlid
      drm/amd/pm: restore user customized OD settings properly for NV1x
      drm/amd/pm: restore user customized OD settings properly for
Sienna Cichlid
      drm/amd/pm: correct the fan speed RPM setting
      drm/amd/pm: record the RPM and PWM based fan speed settings
      drm/amd/pm: correct the fan speed PWM retrieving
      drm/amd/pm: correct the fan speed RPM retrieving
      drm/amd/pm: drop the unnecessary intermediate percent-based transitio=
n
      drm/amd/pm: drop unnecessary manual mode check
      drm/amd/pm: correct the address of Arcturus fan related registers
      drm/amdgpu: disable BACO support for 699F:C7 polaris12 SKU temporaril=
y
      drm/amd/pm: a quick fix for "divided by zero" error
      drm/amdgpu: add missing cleanups for Polaris12 UVD/VCE on suspend
      drm/amdgpu: add missing cleanups for more ASICs on UVD/VCE suspend
      drm/amdgpu: drop redundant cancel_delayed_work_sync call

Fabien Parent (2):
      dt-bindings: display: mediatek: dsi: add documentation for MT8167 SoC
      drm/mediatek: Add support for main DDP path on MT8167

Felix Kuehling (2):
      drm/amdkfd: Allow CPU access for all VRAM BOs
      drm/amdkfd: Allow querying SVM attributes that are clear

Gal Pressman (1):
      dma-buf: Fix a few typos in dma-buf documentation

Geert Uytterhoeven (7):
      drm/bridge: nwl-dsi: Avoid potential multiplication overflow on 32-bi=
t
      dt-bindings: display: ssd1307fb: Convert to json-schema
      video: fbdev: ssd1307fb: Propagate errors via ssd1307fb_update_displa=
y()
      video: fbdev: ssd1307fb: Simplify ssd1307fb_update_display()
      video: fbdev: ssd1307fb: Extract ssd1307fb_set_{col,page}_range()
      video: fbdev: ssd1307fb: Optimize screen updates
      video: fbdev: ssd1307fb: Cache address ranges

Graham Sider (2):
      drm/amdkfd: Update SMI throttle event bitmask
      drm/amdkfd: Expose GFXIP engine version to sysfs

Gregory Williams (1):
      DRM: ast: Fixed coding style issues of ast_mode.c

Guangming Cao (1):
      dma_buf: remove dmabuf sysfs teardown before release

Guchun Chen (2):
      drm/amd/display: avoid printing ERROR for unknown CEA parse(v2)
      drm/amdgpu: avoid over-handle of fence driver fini in s3 test (v2)

Guo Zhengkui (1):
      drm/msm: remove a repeated including of <linux/debugfs.h>

Gwan-gyeong Mun (1):
      drm/i915/dg2: Update lane disable power state during PSR

Harshvardhan Jha (1):
      drm/gma500: Fix end of loop tests for list_for_each_entry

Hawking Zhang (3):
      drm/amdgpu: retire sdma v5_2 golden settings from driver
      drm/amdgpu: increase max xgmi physical node for aldebaran
      drm/amdgpu: disable GFX CGCG in aldebaran

Heiko Stuebner (3):
      drm/rockchip: dsi: add own additional pclk handling
      dt-bindings: display: rockchip-dsi: add optional #phy-cells property
      drm/rockchip: dsi: add ability to work as a phy instead of full dsi

Hridya Valsaraju (2):
      dmabuf: Add the capability to expose DMA-BUF stats in sysfs
      dma-buf: Delete the DMA-BUF attachment sysfs statistics

Huang Rui (2):
      drm/amdgpu: remove the access of xxx_PSP_DEBUG on cycan_skillfish
      drm/amdgpu: enable psp front door loading by default for cyan_skillfi=
sh2

Ian Chen (1):
      drm/amd/display: Extend dmub_cmd_psr_copy_settings_data struct

Imre Deak (3):
      drm/i915: Force a TypeC PHY disconnect during suspend/shutdown
      drm/i915/adlp: Add workaround to disable CMTG clock gating
      drm/i915: Apply CMTG clock disabling WA while DPLL0 is enabled

Jack Zhang (1):
      drm/amd/amdgpu embed hw_fence into amdgpu_job

Jaehyun Chung (1):
      drm/amd/display: Add check for validating unsupported ODM plus MPO ca=
se

Jagan Teki (3):
      drm: bridge: nwl-dsi: Drop unused nwl_dsi_plat_clk_config
      drm/stm: ltdc: Silence -EPROBE_DEFER till bridge attached
      drm/bridge: dw-mipi-dsi: Find the possible DSI devices

Jake Wang (2):
      drm/amd/display: Fixed hardware power down bypass during headless boo=
t
      drm/amd/display: Ensure DCN save after VM setup

Jani Nikula (3):
      drm/i915/dsc: abstract helpers to get bigjoiner primary/secondary crt=
c
      Merge drm/drm-next into drm-intel-next
      drm/i915/plane: add intel_plane_helper_add() helper

Jason Ekstrand (47):
      dma-buf: Document DMA_BUF_IOCTL_SYNC (v3)
      drm/i915: Drop I915_CONTEXT_PARAM_RINGSIZE
      drm/i915: Stop storing the ring size in the ring pointer (v3)
      drm/i915: Drop I915_CONTEXT_PARAM_NO_ZEROMAP
      drm/i915/gem: Set the watchdog timeout directly in
intel_context_set_gem (v2)
      drm/i915/gem: Return void from context_apply_all
      drm/i915: Drop the CONTEXT_CLONE API (v2)
      drm/i915: Implement SINGLE_TIMELINE with a syncobj (v4)
      drm/i915: Drop getparam support for I915_CONTEXT_PARAM_ENGINES
      drm/i915/gem: Disallow bonding of virtual engines (v3)
      drm/i915/gem: Remove engine auto-magic with FENCE_SUBMIT (v2)
      drm/i915/request: Remove the hook from await_execution
      drm/i915/gem: Disallow creating contexts with too many engines
      drm/i915: Stop manually RCU banging in reset_stats_ioctl (v2)
      drm/i915/gem: Add a separate validate_priority helper
      drm/i915: Add gem/i915_gem_context.h to the docs
      drm/i915/gem: Add an intermediate proto_context struct (v5)
      drm/i915/gem: Rework error handling in default_engines
      drm/i915/gem: Optionally set SSEU in intel_context_set_gem
      drm/i915: Add an i915_gem_vm_lookup helper
      drm/i915/gem: Make an alignment check more sensible
      drm/i915/gem: Use the proto-context to handle create parameters (v5)
      drm/i915/gem: Return an error ptr from context_lookup
      drm/i915/gt: Drop i915_address_space::file (v2)
      drm/i915/gem: Delay context creation (v3)
      drm/i915/gem: Don't allow changing the VM on running contexts (v4)
      drm/i915/gem: Don't allow changing the engine set on running contexts=
 (v3)
      drm/i915/selftests: Take a VM in kernel_context()
      i915/gem/selftests: Assign the VM at context creation in
igt_shared_ctx_exec
      drm/i915/gem: Roll all of context creation together
      drm/i915: Finalize contexts in GEM_CONTEXT_CREATE on version 13+
      drm/i915: Revert "drm/i915/gem: Asynchronous cmdparser"
      Revert "drm/i915: Propagate errors on awaiting already signaled fence=
s"
      drm/i915: Remove allow_alloc from i915_gem_object_get_sg*
      drm/i915: Drop error handling from dma_fence_work
      Revert "drm/i915: Skip over MI_NOOP when parsing"
      drm/i915: Correct the docs for intel_engine_cmd_parser
      drm/i915: Call i915_globals_exit() after i915_pmu_exit()
      drm/i915: Call i915_globals_exit() if pci_register_device() fails
      drm/i915: Use a table for i915_init/exit (v2)
      drm/i915: Make the kmem slab for i915_buddy_block a global
      drm/i915/gem: Check object_can_migrate from object_migrate
      drm/i915/gem: Refactor placement setup for i915_gem_object_create* (v=
2)
      drm/i915/gem: Call i915_gem_flush_free_objects() in i915_gem_dumb_cre=
ate()
      drm/i915/gem: Unify user object creation (v3)
      drm/i915/gem/ttm: Only call __i915_gem_object_set_pages if needed
      drm/i915/gem: Always call obj->ops->migrate unless can_migrate fails

Javier Martinez Canillas (3):
      drivers/firmware: move x86 Generic System Framebuffers support
      drivers/firmware: consolidate EFI framebuffer setup for all arches
      drivers/firmware: fix SYSFB depends to prevent build failures

Jerry (Fangzhi) Zuo (1):
      drm/amd/display: Update bounding box states (v2)

Jiahua Yu (1):
      fbdev/omap2: use DEFINE_SPINLOCK() instead of spin_lock_init().

Jiange Zhao (1):
      drm/amdgpu: Add MB_REQ_MSG_READY_TO_RESET response when VF get
FLR notification.

Jim Cromie (1):
      drm/print: fixup spelling in a comment

Jing Xiangfeng (1):
      drm/gma500: Add the missed drm_gem_object_put() in
psb_user_framebuffer_create()

Jingwen Chen (2):
      drm/amdgpu: SRIOV flr_work should take write_lock
      drm/amd/amdgpu: consider kernel job always not guilty

Jinzhou Su (1):
      drm/amdgpu: add another Renoir DID

Jiri Kosina (2):
      drm/amdgpu: Fix resource leak on probe error path
      drm/amdgpu: Avoid printing of stack contents on firmware load error

John Clements (13):
      drm/amdgpu: initialize umc ras function
      drm/amdgpu: Resolve bug in UMC 6.7 error offset calculation
      drm/amdgpu: Added latest PSP FW header
      drm/amdgpu: Added support for added psp driver binaries FW
      drm/amdgpu: Consolidated PSP13 BL FW loading
      drm/amdgpu: Added PSP13 BL loading support for additional drivers
      drm/amdgpu: update PSP BL cmd IDs
      drm/amdgpu: added synchronization for psp cmd buf access
      drm/amdgpu: set RAS EEPROM address from VBIOS
      drm/amdgpu: Add driver infrastructure for MCA RAS
      drm/amdgpu: Update RAS XGMI Error Query
      drm/amdgpu: Add support for RAS XGMI err query
      drm/amdgpu: Clear RAS interrupt status on aldebaran

John Harrison (19):
      drm/i915/huc: Update TGL and friends to HuC 7.9.3
      drm/i915/adlp: Add ADL-P GuC/HuC firmware files
      drm/i915/guc: Module load failure test for CT buffer creation
      drm/i915/selftests: Allow for larger engine counts
      drm/i915/xehp: Extra media engines - Part 1 (engine definitions)
      drm/i915/xehp: Extra media engines - Part 2 (interrupts)
      drm/i915/xehp: Extra media engines - Part 3 (reset)
      drm/i915/guc: Make hangcheck work with GuC virtual engines
      drm/i915/guc: Provide mmio list to be saved/restored on engine reset
      drm/i915/guc: Don't complain about reset races
      drm/i915/guc: Enable GuC engine reset
      drm/i915/guc: Fix for error capture after full GPU reset with GuC
      drm/i915/guc: Hook GuC scheduling policies up
      drm/i915/guc: Connect reset modparam updates to GuC policy flags
      drm/i915/guc: Include scheduling policies in the debugfs state dump
      drm/i915/guc: Add golden context to GuC ADS
      drm/i915/selftest: Better error reporting from hangcheck selftest
      drm/i915/selftest: Fix hangcheck self test for GuC submission
      drm/i915/selftest: Bump selftest timeouts for hangcheck

Jonathan Kim (4):
      drm/amdgpu: add psp command to get num xgmi links between direct peer=
s
      drm/amdkfd: report xgmi bandwidth between direct peers to the kfd
      drm/amdkfd: report pcie bandwidth to the kfd
      drm/amdgpu: get extended xgmi topology data

Jonathan Marek (3):
      dt-bindings: msm: dsi: add missing 7nm bindings
      dt-bindings: msm: dsi: document phy-type property for 7nm dsi phy
      drm/msm/dsi: support CPHY mode for 7nm pll/phy

Joonas Lahtinen (1):
      Merge tag 'topic/i915-ttm-2021-06-11' of
git://anongit.freedesktop.org/drm/drm-misc into drm-intel-gt-next

Jose Maria Casanova Crespo (1):
      drm/prime: fix comment on PRIME Helpers

Joseph Greathouse (1):
      drm/amdgpu: Put MODE register in wave debug info

Josip Pavic (1):
      drm/amd/display: log additional register state for debug

Jos=C3=A9 Roberto de Souza (21):
      Revert "drm/i915/display: Drop FIXME about turn off infoframes"
      drm/i915/display/psr: Handle SU Y granularity
      drm/i915/display/adl_p: Implement Wa_22012278275
      drm/i915/display/adl_p: Implement Wa_16011168373
      drm/i915/xelpd: Handle PSR2 SDP indication in the prior scanline
      drm/i915/display/adl_p: Implement Wa_16011303918
      drm/i915/display/dg1: Correctly map DPLLs during state readout
      drm/i915: Settle on "adl-x" in WA comments
      drm/i915: Implement Wa_1508744258
      drm/i915/adl_s: Extend Wa_1406941453
      drm/i915/display: Settle on "adl-x" in WA comments
      drm/i915: Limit Wa_22010178259 to affected platforms
      drm/i915/display/xelpd: Extend Wa_14011508470
      drm/i915/display/adl_p: Implement PSR changes
      drm/i915/display: Disable FBC when PSR2 is enabled display 12 and new=
er
      drm/i915: Extend Wa_1406941453 to adl-p
      drm/i915/dg2: Add DG2 to the PSR2 defeature list
      drm/i915/display/psr2: Mark as updated all planes that intersect
with pipe_clip
      drm/i915/display/psr2: Fix cursor updates using legacy apis
      drm/i915/display: Disable audio, DRRS and PSR before planes
      drm/i915/display/adl_p: Correctly program MBUS DBOX A credits

Juan A. Suarez Romero (1):
      drm/v3d: Expose performance counters to userspace

Jude Shih (1):
      drm/amd/display: Fix resetting DCN3.1 HW when resuming from S4

Julia Lawall (1):
      drm/of: free the right object

Kai-Heng Feng (2):
      drm/i915: Invoke another _DSM to enable MUX on HP Workstation laptops
      drm/amdgpu/acp: Make PM domain really work

Kalyan Thota (1):
      drm/msm/disp/dpu1: add safe lut config in dpu driver

Kees Cook (2):
      drm/i915/display: Do not zero past infoframes.vsc
      drm/i915: Use designated initializers for init/exit table

Kenneth Feng (3):
      drm/amd/pm: bug fix for the runtime pm BACO
      Revert "drm/amd/pm: fix workload mismatch on vega10"
      drm/amd/pm: change the workload type for some cards

Kevin Wang (9):
      drm/amdgpu: split amdgpu_device_access_vram() into two small parts
      drm/amdgpu/ttm: replace duplicate code with exiting function
      drm/amdgpu/ttm: optimize vram access in amdgpu_ttm_access_memory()
      drm/amd/pm: correct aldebaran smu feature mapping
FEATURE_DATA_CALCULATIONS
      drm/amd/pm: correct DPM_XGMI/VCN_DPM feature name
      drm/amd/pm: skip to load smu microcode on sriov for aldebaran
      drm/amd/pm: change return value in aldebaran_get_power_limit()
      drm/amd/pm: change smu msg's attribute to allow working under sriov
      drm/amd/pm: change pp_dpm_sclk/mclk/fclk attribute is RO for aldebara=
n

Khaled Almahallawy (1):
      drm/i915/dp: DPTX writes Swing/Pre-emphs(DPCD 0x103-0x106)
requested during PHY Layer testing

Konrad Dybcio (1):
      drm/msm/dsi: Fix DSI and DSI PHY regulator config from SDM660

Krunoslav Kovac (2):
      drm/amd/display: Assume active upper layer owns the HW cursor
      drm/amd/display: Refine condition for cursor visibility

KuoHsiang Chou (1):
      drm/ast: Disable fast reset after DRAM initial

Kuogee Hsieh (8):
      drm/msm/dp: update is_connected status base on sink count at
dp_pm_resume()
      drm/msm/dp: use dp_ctrl_off_link_stream during PHY compliance test ru=
n
      drm/msm/dp: reduce link rate if failed at link training 1
      drm/msm/dp: reset aux controller after dp_aux_cmd_fifo_tx() failed.
      drm/msm/dp: replug event is converted into an unplug followed by
an plug events
      drm/msm/dp: return correct edid checksum after corrupted edid
checksum read
      drm/msm/dp: do not end dp link training until video is ready
      drm/msm/dp: add drm debug logs to dp_pm_resume/suspend

Lang Yu (19):
      drm/ttm: add TTM_PL_FLAG_TEMPORARY flag v3
      drm/amdgpu: user temporary GTT as bounce buffer
      drm/amdgpu: switch gtt_mgr to counting used pages
      drm/amdgpu: add function to show ucode name via id
      drm/amdgpu: add function to show psp_gfx_cmd name via id
      drm/amdgpu: show explicit name instead of id in psp_cmd_submit_buf
      drm/amdgpu: adjust fw_name string length for toc
      drm/amdgpu: add mp 11.0.8 header for cyan_skillfish
      drm/amdgpu: add psp v11.0.8 driver for cyan_skillfish
      drm/amdgpu: init psp v11.0.8 function for cyan_skillfish
      drm/amdgpu: enable psp v11.0.8 for cyan_skillfish
      drm/amdgpu: use direct loading by default for cyan_skillfish2
      drm/amdgpu: add smu_v11_8_pmfw header for cyan_skilfish
      drm/amdgpu: add smu_v11_8_ppsmc header for cyan_skilfish
      drm/amdgpu: add smu interface header for cyan_skilfish
      drm/amdgpu: add basic ppt functions for cyan_skilfish
      drm/amdgpu: add check_fw_version support for cyan_skillfish
      drm/amdgpu: enable SMU for cyan_skilfish
      drm/amdgpu: add autoload_supported check for RLC autoload

Laurent Pinchart (25):
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
      drm: rcar-du: Shutdown the display on system shutdown
      drm: rcar-du: Don't put reference to drm_device in rcar_du_remove()
      drm: rcar-du: Shutdown the display on remove
      drm/bridge: Centralize error message when bridge attach fails
      drm: bridge: dw-hdmi: Attach to next bridge if available
      drm: rcar-du: lvds: Convert to DRM panel bridge helper
      drm: rcar-du: dw-hdmi: Set output port number
      drm: rcar-du: Use drm_bridge_connector_init() helper
      drm: rcar-du: lvds: Don't set bridge driver_private field
      drm: rcar-du: lvds: Use dev_err_probe()
      drm: xlnx: zynqmp_dpsub: Pass disp structure to all internal function=
s
      drm: xlnx: zynqmp_dpsub: Fix graphics layer blending
      drm: xlnx: zynqmp_dpsub: Add global alpha support
      drm: xlnx: zynqmp_dpsub: Expose plane ordering to userspace

Leandro Ribeiro (2):
      drm/doc: document how userspace should find out CRTC index
      drm/doc: document drm_mode_get_plane

Lee Jones (1):
      drm/xlnx/zynqmp_disp: Fix incorrectly named enum 'zynqmp_disp_layer_i=
d'

Lee Shawn C (1):
      drm/i915: keep backlight_enable on until turn eDP display off

Lijo Lazar (1):
      drm/amd/pm: Support board calibration on aldebaran

Likun Gao (2):
      drm/amdgpu: update golden setting for sienna_cichlid
      drm/amdgpu: adjust fence driver enable sequence

Linus Walleij (8):
      drm/panel: db7430: Add driver for Samsung DB7430
      drm/dbi: Support DBI typec1 read operations
      drm/panel: s6e63m0: Switch to DBI abstraction for SPI
      drm/dbi: Print errors for mipi_dbi_command()
      drm/panel: Fix up DT bindings for Samsung lms397kf04
      drm/panel: Add DT bindings for Samsung LMS380KF01
      drm/panel: ws2401: Add driver for WideChips WS2401
      drm/panel-sony-acx424akp: Modernize backlight handling

Liviu Dudau (1):
      drm/amd/display: Fix 10bit 4K display on CIK GPUs

Luben Tuikov (32):
      drm/amdgpu: Fix Vega20 I2C to be agnostic (v2)
      drm/amdgpu: Fixes to the AMDGPU EEPROM driver
      drm/amdgpu: EEPROM respects I2C quirks
      drm/amdgpu: I2C EEPROM full memory addressing
      drm/amdgpu: RAS and FRU now use 19-bit I2C address
      drm/amdgpu: Fix wrap-around bugs in RAS
      drm/amdgpu: I2C class is HWMON
      drm/amdgpu: RAS: EEPROM --> RAS
      drm/amdgpu: Rename misspelled function
      drm/amdgpu: RAS xfer to read/write
      drm/amdgpu: EEPROM: add explicit read and write
      drm/amd/pm: Extend the I2C quirk table
      drm/amd/pm: Simplify managed I2C transfer functions
      drm/amdgpu: Fix width of I2C address
      drm/amdgpu: Return result fix in RAS
      drm/amdgpu: Fix amdgpu_ras_eeprom_init()
      drm/amdgpu: Simplify RAS EEPROM checksum calculations
      drm/amdgpu: Use explicit cardinality for clarity
      drm/amdgpu: Nerf buff
      drm/amdgpu: Some renames
      drm/amdgpu: Get rid of test function
      drm/amdgpu: Optimize EEPROM RAS table I/O
      drm/amdgpu: RAS EEPROM table is now in debugfs
      drm/amdgpu: Fix koops when accessing RAS EEPROM
      drm/amdgpu: Use a single loop
      drm/amdgpu: Correctly disable the I2C IP block
      drm/amd/pm: Simplify managed I2C transfer of Aldebaran
      drm/amd/pm: Add I2C quirk table to Aldebaran
      drm/amdgpu: The I2C IP doesn't support 0 writes/reads
      drm/amdgpu: Return error if no RAS
      drm/amd/pm: Fix a bug communicating with the SMU (v5)
      drm/amd/pm: Fix a bug in semaphore double-lock

Lucas De Marchi (49):
      drm/i915/xelpd: break feature inheritance
      drm/i915/display: fix level 0 adjustement on display ver >=3D 12
      drm/i915/display: use max_level to control loop
      drm/i915/gt: finish INTEL_GEN and friends conversion
      drm/i915: finish INTEL_GEN and friends conversion
      gpu/drm/i915: nuke old GEN macros
      drm/i915: do not abbreviate version in debugfs
      drm/i915: Add release id version
      drm/i915: do not abbreviate version in debugfs
      drm/i915: Add release id version
      drm/i915: Add XE_HP initial definitions
      drm/i915/xehpsdv: add initial XeHP SDV definitions
      drm/i915/gt: fix platform prefix
      drm/i915/gt: nuke unused legacy engine hw_id
      drm/i915/gt: rename legacy engine->hw_id to engine->gen6_hw_id
      drm/i915: fix not reading DSC disable fuse in GLK
      drm/i915/display: split DISPLAY_VER 9 and 10 in intel_setup_outputs()
      drm/i915/gt: nuke gen6_hw_id
      drm/i915/gt: remove explicit CNL handling from intel_mocs.c
      drm/i915/gt: remove explicit CNL handling from intel_sseu.c
      drm/i915/gt: rename CNL references in intel_engine.h
      drm/i915/gt: remove GRAPHICS_VER =3D=3D 10
      drm/i915/display: remove PORT_F workaround for CNL
      drm/i915/display: remove explicit CNL handling from intel_cdclk.c
      drm/i915/display: remove explicit CNL handling from intel_color.c
      drm/i915/display: remove explicit CNL handling from intel_combo_phy.c
      drm/i915/display: remove explicit CNL handling from intel_crtc.c
      drm/i915/display: remove explicit CNL handling from intel_ddi.c
      drm/i915/display: remove explicit CNL handling from
intel_display_debugfs.c
      drm/i915/display: remove explicit CNL handling from intel_dmc.c
      drm/i915/display: remove explicit CNL handling from intel_dp.c
      drm/i915/display: remove explicit CNL handling from intel_dpll_mgr.c
      drm/i915/display: remove explicit CNL handling from intel_vdsc.c
      drm/i915/display: remove explicit CNL handling from skl_universal_pla=
ne.c
      drm/i915/display: remove explicit CNL handling from intel_display_pow=
er.c
      drm/i915/display: remove CNL ddi buf translation tables
      drm/i915/display: rename CNL references in skl_scaler.c
      drm/i915: remove explicit CNL handling from i915_irq.c
      drm/i915: remove explicit CNL handling from intel_pm.c
      drm/i915: remove explicit CNL handling from intel_pch.c
      drm/i915: remove explicit CNL handling from intel_wopcm.c
      drm/i915: rename CNL references in intel_dram.c
      drm/i915: replace random CNL comments
      drm/i915: switch num_scalers/num_sprites to consider DISPLAY_VER
      drm/i915: remove GRAPHICS_VER =3D=3D 10
      drm/i915: rename/remove CNL registers
      drm/i915: finish removal of CNL
      drm/i915/xehp: Fix missing sentinel on mcr_ranges_xehp
      drm/edid: fix edid field name

Lukas Bulwahn (2):
      drm/amdgpu: rectify line endings in umc v8_7_0 IP headers
      drm: amdgpu: remove obsolete reference to config CHASH

Lyude Paul (9):
      drm/i915/dpcd_bl: Remove redundant AUX backlight frequency calculatio=
ns
      drm/i915/dpcd_bl: Handle drm_dpcd_read/write() return values correctl=
y
      drm/i915/dpcd_bl: Cleanup intel_dp_aux_vesa_enable_backlight() a bit
      drm/i915/dpcd_bl: Cache some backlight capabilities in
intel_panel.backlight
      drm/i915/dpcd_bl: Move VESA backlight enabling code closer together
      drm/i915/dpcd_bl: Return early in vesa_calc_max_backlight if we
can't read PWMGEN_BIT_COUNT
      drm/i915/dpcd_bl: Print return codes for VESA backlight failures
      drm/dp: Extract i915's eDP backlight code into DRM helpers
      drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau

Maarten Lankhorst (5):
      drm/vma: Add a driver_private member to vma_node.
      drm/i915: Use ttm mmap handling for ttm bo's.
      drm/i915: Fix missing docbook chapters for i915 uapi.
      drm/i915: Add TTM offset argument to mmap.
      Backmerge remote-tracking branch 'drm/drm-next' into drm-misc-next

Maitreyee Rao (1):
      drm/msm/dp: add logs across DP driver for ease of debugging

Manasi Navare (1):
      drm/i915/display: Fix shared dpll mismatch for bigjoiner slave

Marek Vasut (6):
      drm/bridge: ti-sn65dsi83: Fix sparse warnings
      drm/bridge: ti-sn65dsi83: Replace connector format patching with
atomic_get_input_bus_fmts
      drm: mxsfb: Enable recovery on underflow
      drm: mxsfb: Increase number of outstanding requests on V4 and newer H=
W
      drm: mxsfb: Use bus_format from the nearest bridge if present
      drm: mxsfb: Clear FIFO_CLEAR bit

Mark Morra (1):
      drm/amd/display: Fixed EdidUtility build errors

Martin Krastev (3):
      drm/vmwgfx: Introduce VMware mks-guest-stats
      drm/vmwgfx: Refactor vmw_mksstat_remove_ioctl to expect pgid
match with vmw_mksstat_add_ioctl to authorise removal.
      drm/vmwgfx: Fix build issues in mksGuestStats discovered by the
kernel test robot

Masanari Iida (1):
      drm/amdgpu/powerplay/smu10: Fix a typo in error message

Matt Roper (58):
      drm/i915: Add GT support for multiple types of multicast steering
      drm/i915: Add support for explicit L3BANK steering
      drm/i915: Handle cdclk crawling flag in standard manner
      drm/i915: Make pre-production detection use direct revid comparison
      drm/i915/skl: Use revid->stepping tables
      drm/i915/kbl: Drop pre-production revision from stepping table
      drm/i915/bxt: Use revid->stepping tables
      drm/i915/glk: Use revid->stepping tables
      drm/i915/icl: Use revid->stepping tables
      drm/i915/jsl_ehl: Use revid->stepping tables
      drm/i915/rkl: Use revid->stepping tables
      drm/i915/dg1: Use revid->stepping tables
      drm/i915/cnl: Drop all workarounds
      drm/i915/icl: Drop workarounds that only apply to pre-production step=
pings
      Merge branch 'topic/revid_steppings' into drm-intel-gt-next
      Merge branch 'topic/revid_steppings' into drm-intel-next
      drm/i915: Fix application of WaInPlaceDecompressionHang
      drm/i915/icl: Drop a couple unnecessary workarounds
      drm/i915: Program DFR enable/disable as a GT workaround
      drm/i915/adl_s: Wa_14011765242 is also needed on A1 display stepping
      drm/i915/rkl: Wa_1409767108 also applies to RKL
      drm/i915/rkl: Wa_1408330847 no longer applies to RKL
      drm/i915: Make GT workaround upper bounds exclusive
      drm/i915: Make display workaround upper bounds exclusive
      drm/i915/dg2: add DG2 platform info
      Merge branch 'topic/xehp-dg2-definitions-2021-07-21' into drm-intel-n=
ext
      drm/i915/dg2: Add fake PCH
      drm/i915/dg2: Add cdclk table and reference clock
      drm/i915/dg2: Skip shared DPLL handling
      drm/i915/dg2: Don't wait for AUX power well enable ACKs
      drm/i915/dg2: Setup display outputs
      drm/i915/dg2: Add dbuf programming
      drm/i915/dg2: Don't program BW_BUDDY registers
      drm/i915/dg2: Don't read DRAM info
      drm/i915/dg2: DG2 has fixed memory bandwidth
      Merge branch 'topic/xehp-dg2-definitions-2021-07-21' into
drm-intel-gt-next
      drm/i915/xehp: Define multicast register ranges
      drm/i915/dg2: Classify DG2 PHY types
      drm/i915: Program chicken bit during DP MST sequence on TGL+
      drm/i915/xehp: Xe_HP forcewake support
      drm/i915/adl_p: Allow underrun recovery when possible
      drm/i915/xehpsdv: Correct parameters for IS_XEHPSDV_GT_STEP()
      drm/i915/adl_s: Update ddi buf translation tables
      drm/i915/adl_p: Add ddi buf translation tables for combo PHY
      drm/i915/dg2: Add MPLLB programming for SNPS PHY
      drm/i915/dg2: Add MPLLB programming for HDMI
      drm/i915/dg2: Add vswing programming for SNPS phys
      drm/i915/dg2: Update modeset sequences
      drm/i915/dg2: Wait for SNPS PHY calibration during display init
      drm/i915: Correct SFC_DONE register offset
      drm/i915/dg2: Add forcewake table
      drm/i915/xehpsdv: Add maximum sseu limits
      drm/i915/dg2: DG2 uses the same sseu limits as XeHP SDV
      drm/i915/xehpsdv: Define steering tables
      drm/i915/dg2: Update steering tables
      drm/i915/dg2: Add SQIDI steering
      drm/i915/dg2: Add support for new DG2-G11 revid 0x5
      drm/i915/adl_p: Also disable underrun recovery with MSO

Matthew Auld (26):
      drm/i915/ttm: add ttm_buddy_man
      drm/i915/ttm: add i915_sg_from_buddy_resource
      drm/i915/ttm: pass along the I915_BO_ALLOC_CONTIGUOUS
      drm/i915/ttm: remove node usage in our naming
      drm/i915/ttm: switch over to ttm_buddy_man
      drm/i915/ttm: restore min_page_size behaviour
      drm/i915/ttm: remove unused function
      drm/i915/selftests: add back the selftest() hook for the buddy
      drm/i915/ttm: fix static warning
      drm/i915/gem: Introduce a selftest for the gem object migrate
functionality
      drm/i915: support forcing the page size with lmem
      drm/i915/gtt: ignore min_page_size for paging structures
      drm/i915/display: check if compressed_llb was allocated
      drm/i915/selftests: fix smatch warning in igt_check_blocks
      drm/i915/selftests: fix smatch warning in mock_reserve
      drm/i915: use consistent CPU mappings for pin_map users
      drm/i915/uapi: convert drm_i915_gem_caching to kernel doc
      drm/i915/uapi: convert drm_i915_gem_set_domain to kernel doc
      drm/i915/gtt: drop the page table optimisation
      drm/i915/uapi: reject caching ioctls for discrete
      drm/i915/uapi: convert drm_i915_gem_userptr to kernel doc
      drm/i915/uapi: reject set_domain for discrete
      drm/i915: document caching related bits
      drm/i915/ehl: unconditionally flush the pages on acquire
      drm/i915/selftests: prefer the create_user helper
      drm/i915/xehp: Changes to ss/eu definitions

Matthew Brost (52):
      drm/i915: Move priolist to new i915_sched_engine object
      drm/i915: Add i915_sched_engine_is_empty function
      drm/i915: Reset sched_engine.no_priolist immediately after dequeue
      drm/i915: Move active tracking to i915_sched_engine
      drm/i915: Move engine->schedule to i915_sched_engine
      drm/i915: Add kick_backend function to i915_sched_engine
      drm/i915: Update i915_scheduler to operate on i915_sched_engine
      drm/i915: Move submission tasklet to i915_sched_engine
      drm/doc/rfc: i915 GuC submission / DRM scheduler
      drm/doc/rfc: i915 new parallel submission uAPI plan
      drm/i915/guc: Relax CTB response timeout
      drm/i915/guc: Improve error message for unsolicited CT response
      drm/i915/guc: Increase size of CTB buffers
      drm/i915/guc: Add non blocking CTB send function
      drm/i915/guc: Add stall timer to non blocking CTB send function
      drm/i915/guc: Optimize CTB writes and reads
      drm/i915/guc: Add new GuC interface defines and structures
      drm/i915/guc: Remove GuC stage descriptor, add LRC descriptor
      drm/i915/guc: Add LRC descriptor context lookup array
      drm/i915/guc: Implement GuC submission tasklet
      drm/i915/guc: Add bypass tasklet submission path to GuC
      drm/i915/guc: Implement GuC context operations for new inteface
      drm/i915/guc: Insert fence on context when deregistering
      drm/i915/guc: Defer context unpin until scheduling is disabled
      drm/i915/guc: Disable engine barriers with GuC during unpin
      drm/i915/guc: Extend deregistration fence to schedule disable
      drm/i915: Disable preempt busywait when using GuC scheduling
      drm/i915/guc: Ensure request ordering via completion fences
      drm/i915/guc: Disable semaphores when using GuC scheduling
      drm/i915/guc: Ensure G2H response has space in buffer
      drm/i915/guc: Update intel_gt_wait_for_idle to work with GuC
      drm/i915/guc: Update GuC debugfs to support new GuC
      drm/i915/guc: Add trace point for GuC submit
      drm/i915: Add intel_context tracing
      drm/i915/guc: GuC virtual engines
      drm/i915: Hold reference to intel_context over life of i915_request
      drm/i915/guc: Disable bonding extension with GuC submission
      drm/i915/guc: Direct all breadcrumbs for a class to single breadcrumb=
s
      drm/i915: Add i915_sched_engine destroy vfunc
      drm/i915: Move active request tracking to a vfunc
      drm/i915/guc: Reset implementation for new GuC interface
      drm/i915: Reset GPU immediately if submission is disabled
      drm/i915/guc: Add disable interrupts to guc sanitize
      drm/i915/guc: Suspend/resume implementation for new interface
      drm/i915/guc: Handle context reset notification
      drm/i915/guc: Handle engine reset failure notification
      drm/i915/guc: Enable the timer expired interrupt for GuC
      drm/i915/guc: Capture error state on context reset
      drm/i915/guc: Implement banned contexts for GuC submission
      drm/i915/guc: Support request cancellation
      drm/i915/selftest: Increase some timeouts in live_requests
      drm/i915/guc: Implement GuC priority management

Maxime Ripard (13):
      drm/vc4: hdmi: Rely on interrupts to handle hotplug
      drm/dp_helper: Rework the drm_dp_aux documentation
      drm/dp_helper: Mention the concurrency requirement hw_mutex
      drm: Mention the power state requirement on side-channel operations
      Merge tag 'asoc-hdmi-codec-improvements-v2' of
git://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux into
drm-misc-next
      drm/vc4: hdmi: Register HDMI codec
      drm/vc4: hdmi: Drop devm interrupt handler for hotplug interrupts
      drm/vc4: hdmi: Only call into DRM framework if registered
      drm/vc4: hdmi: Remove drm_encoder->crtc usage
      dt-bindings: display: simple-bridge: Add corpro,gm7123 compatible
      Documentation: gpu: Mention the requirements for new properties
      drm/vc4: hdmi: Remove redundant variables
      drm/vc4: hdmi: Remove unused struct

Melissa Wen (1):
      drm/vkms: update the current status of todo list

Michael Strauss (1):
      drm/amd/display: Enable eDP ILR on DCN2.1

Michael Walle (2):
      drm/etnaviv: add HWDB entry for GC7000 r6202
      drm/etnaviv: add clock gating workaround for GC7000 r6202

Michal Wajdeczko (3):
      drm/i915/guc: Introduce unified HXG messages
      drm/i915/guc: Update firmware to v62.0.0
      drm/i915/doc: Include GuC ABI documentation

Michel D=C3=A4nzer (1):
      drm/amdgpu: Cancel delayed work when GFXOFF is disabled

Mikel Rychliski (1):
      drm/radeon: Fix NULL dereference when updating memory stats

Mikita Lipski (3):
      drm/amd/display: Prevent Diags from entering S2
      drm/amd/display: Remove MALL function from DCN3.1
      drm/amd/display: Fix PSR command version

Mikko Perttunen (15):
      gpu: host1x: Add DMA fence implementation
      gpu: host1x: Add no-recovery mode
      gpu: host1x: Add job release callback
      gpu: host1x: Add support for syncpoint waits in CDMA pushbuffer
      gpu: host1x: Add option to skip firewall for a job
      drm/tegra: Extract tegra_gem_lookup()
      drm/tegra: Add new UAPI to header
      drm/tegra: Boot VIC during runtime PM resume
      drm/tegra: Allocate per-engine channel in core code
      drm/tegra: Implement new UAPI
      drm/tegra: Implement syncpoint management UAPI
      drm/tegra: Implement syncpoint wait UAPI
      drm/tegra: Implement job submission part of new UAPI
      drm/tegra: Add job firewall
      drm/tegra: Bump driver version

Mukul Joshi (3):
      drm/amdgpu: Fix channel_index table layout for Aldebaran
      drm/amdkfd: CWSR with software scheduler
      drm/amdkfd: CWSR with sw scheduler on Aldebaran and Arcturus

Nathan Chancellor (3):
      drm/radeon: Add break to switch statement in
radeonfb_create_pinned_object()
      drm/exynos: Always initialize mapping in exynos_drm_register_dma()
      drm/i915/selftest: Fix use of err in igt_reset_{fail, nop}_engine()

Nevenko Stupar (1):
      drm/amd/display: Line Buffer changes

Nicholas Kazlauskas (10):
      drm/amd/display: Fix updating infoframe for DCN3.1 eDP
      drm/amd/display: Fix max vstartup calculation for modes with borders
      drm/amd/display: Query VCO frequency from register for DCN3.1
      drm/amd/display: Update bounding box for DCN3.1
      drm/amd/display: Clear GPINT after DMCUB has reset
      drm/amd/display: Increase timeout threshold for DMCUB reset
      drm/amd/display: Fix multi-display support for idle opt workqueue
      drm/amd/display: Use vblank control events for PSR enable/disable
      drm/amd/display: Guard vblank wq flush with DCN guards
      drm/amd/display: Move
AllowDRAMSelfRefreshOrDRAMClockChangeInVblank to bounding box

Nicolas Boichat (1):
      drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling features

Nicolas Saenz Julienne (1):
      drm/vc4: hdmi: Limit noise when deferring snd card registration

Nirmoy Das (2):
      drm/amdgpu: use xarray for storing pasid in vm
      drm/amdgpu: separate out vm pasid assignment

Noralf Tr=C3=B8nnes (4):
      drm/gud: Free buffers on device removal
      drm/gud: Use scatter-gather USB bulk transfer
      drm/gud: Add Raspberry Pi Pico ID
      drm/gud: Add async_flush module parameter

Normunds Rieksts (1):
      drm/fourcc: Add modifier definitions for Arm Fixed Rate Compression

Oak Zeng (5):
      drm/amdgpu: Fix a printing message
      drm/amdgpu: Change a few function names
      drm/amdkfd: Renaming dqm->packets to dqm->packet_mgr
      drm/amdkfd: Set priv_queue to NULL after it is freed
      drm/amdkfd: Fix a concurrency issue during kfd recovery

Oleksij Rempel (1):
      dt-bindings: display: simple: add some Logic Technologies and
Multi-Inno panels

Oliver Logush (1):
      drm/amd/display: Fix timer_per_pixel unit error

Patnana Venkata Sai (1):
      drm/i915/display/dsc: Add Per connector debugfs node for DSC BPP enab=
le

Paul Cercueil (3):
      dt-bindings: display/panel: Add Innolux EJ030NA
      drm/ingenic: Remove dead code
      drm/ingenic: Use standard drm_atomic_helper_commit_tail

Paulo Zanoni (1):
      drm/i915: Fork DG1 interrupt handler

Pavel Skripkin (1):
      udmabuf: fix general protection fault in udmabuf_create

Peng Ju Zhou (1):
      drm/amd/amdgpu: Recovery vcn instance iterate.

Peter Zijlstra (1):
      locking/lockdep: Provide lockdep_assert{,_once}() helpers

Philip Yang (4):
      drm/amdkfd: handle fault counters on invalid address
      drm/amdkfd: AIP mGPUs best prefetch location for xnack on
      drm/amdkfd: check access permisson to restore retry fault
      drm/amdkfd: map SVM range with correct access permission

Pi-Hsun Shih (1):
      drm/bridge: anx7625: Make hpd workqueue freezable

Praful Swarnakar (1):
      drm/amd/display: Add Logging for HDMI color depth information

Prathap Kumar Valsan (1):
      drm/i915/xehp: New engine context offsets

Pratik Vishwakarma (2):
      drm/amdgpu: Check pmops for desired suspend state
      drm/amdgpu: Rename amdgpu_acpi_is_s0ix_supported

Qingqing Zhuo (1):
      drm/amd/display: workaround for hard hang on HPD on native DP

Quanyang Wang (3):
      drm: xlnx: zynqmp_dpsub: Call pm_runtime_get_sync before setting
pixel clock
      drm: xlnx: zynqmp: release reset to DP controller before
accessing DP registers
      drm: xlnx: zynqmp: Add zynqmp_disp_layer_is_video() to simplify the c=
ode

Rahul Kumar Singh (2):
      drm/i915/selftest: Fix workarounds selftest for GuC submission
      drm/i915/selftest: Fix MOCS selftest for GuC submission

Rajeev Nandan (9):
      drm/panel: add basic DP AUX backlight support
      drm/panel-simple: Support DP AUX backlight
      drm/panel-simple: Support for delays between GPIO & regulator
      drm/panel-simple: Update validation warnings for eDP panel descriptio=
n
      dt-bindings: display: simple: Add Samsung ATNA33XC20
      drm/panel-simple: Add Samsung ATNA33XC20
      dt-bindings: msm/dsi: Add sc7280 7nm dsi phy
      drm/msm/dsi: Add PHY configuration for SC7280
      drm/msm/dsi: Add DSI support for SC7280

Rajkumar Subbiah (1):
      drm/dp_mst: Fix return code on sideband message failure

Ramalingam C (1):
      drm/i915/ttm: accelerated move implementation

Randy Dunlap (5):
      efi: sysfb_efi: fix build when EFI is not set
      drm: nouveau: fix disp.c build when NOUVEAU_BACKLIGHT is not enabled
      drm/amdgpu: fix checking pmops when PM_SLEEP is not enabled
      drm/amd/display: use do-while-0 for DC_TRACE_LEVEL_MESSAGE()
      drm/amdgpu: fix kernel-doc warnings on non-kernel-doc comments

Rob Clark (22):
      drm/msm: Let fences read directly from memptrs
      drm/msm: Signal fences sooner
      drm/msm: Split out devfreq handling
      drm/msm: Split out get_freq() helper
      drm/msm: Devfreq tuning
      drm/msm: Docs and misc cleanup
      drm/msm: Small submitqueue creation cleanup
      drm/msm: drop drm_gem_object_put_locked()
      drm: Drop drm_gem_object_put_locked()
      drm/msm/submit: Simplify out-fence-fd handling
      drm/msm: Consolidate submit bo state
      drm/msm: Track "seqno" fences by idr
      drm/msm: Return ERR_PTR() from submit_create()
      drm/msm: Conversion to drm scheduler
      drm/msm: Drop submit bo_list
      drm/msm: Drop struct_mutex in submit path
      drm/msm: Utilize gpu scheduler priorities
      drm/msm/gem: Mark active before pinning
      drm/msm: Periodically update RPTR shadow
      drm/msm: Add adreno_is_a640_family()
      drm/msm: Rework SQE version check
      drm/bridge: ti-sn65dsi86: Avoid creating multiple connectors

Robert Foss (1):
      drm: bridge: it66121: Check drm_bridge_attach retval

Rodrigo Siqueira (4):
      drm/amd/display: Move specific DCN2x code that uses FPU to DML
      drm/amd/display: Add control mechanism for FPU
      drm/amd/display: Add control mechanism for FPU utilization
      drm/amd/display: Add DC_FP helper to check FPU state

Rodrigo Vivi (3):
      Merge drm/drm-next into drm-intel-next
      Merge drm/drm-next into drm-intel-gt-next
      drm/i915/bios: Fix ports mask

Roman Li (1):
      drm/amd/display: Remove redundant vblank workqueues in DM

Roy Chan (5):
      drm/amd/display: fix missing writeback disablement if plane is remove=
d
      drm/amd/display: refactor the codes to centralize the
stream/pipe checking logic
      drm/amd/display: refactor the cursor programing codes
      drm/amd/display: fix incorrect CM/TF programming sequence in dwb
      drm/amd/display: Correct comment style

Roy Sun (3):
      drm/amdgpu: Change the imprecise function name
      drm/amdgpu: Add error message when programing registers fails
      drm/amdgpu: Change the imprecise output

Ryan Taylor (5):
      drm/amdgpu: create amdgpu_vkms (v4)
      drm/amdgpu: cleanup dce_virtual
      drm/amdgpu: replace dce_virtual with amdgpu_vkms (v3)
      drm/amd/pm: restore fan_mode AMD_FAN_CTRL_NONE on resume (v2)
      drm/amd/pm: graceful exit on restore fan mode failure (v2)

Sam Ravnborg (2):
      drm: bridge: Mark deprecated operations in drm_bridge_funcs
      drm/panel: simple: add Multi-Innotechnology MI1010AIT-1CP1

Sean Keely (1):
      drm/amdkfd: Account for SH/SE count when setting up cu masks.

Sergio Migu=C3=A9ns Iglesias (2):
      DRM: gpu: radeon: Fixed coding style issues
      drm/amdgpu: Removed unnecessary if statement

Shaokun Zhang (1):
      drm/vmwgfx: Remove the repeated declaration

Shashank Sharma (1):
      drm/amdgpu/OLAND: clip the ref divider max value

Shirish S (1):
      drm/amdgpu/display: fix DMUB firmware version info

Simon Ser (6):
      drm: document drm_property_enum.value for bitfields
      drm: add logging for RMFB ioctl
      drm: document DRM_IOCTL_MODE_RMFB
      maintainers: add bugs and chat URLs for amdgpu
      drm/connector: add ref to drm_connector_get in iter docs
      drm: document drm_mode_get_property

Solomon Chiu (1):
      drm/amdgpu: Add preferred mode in modeset when freesync video
mode's enabled.

Souptick Joarder (1):
      drm/msm/dp: Remove unused variable

Stanislav Lisovskiy (2):
      drm/i915: Extend QGV point restrict mask to 0x3
      drm/i915: Implement PSF GV point support

Stefan Riedmueller (5):
      drm/panel: Add connector_type and bus_format for AUO G104SN02 V2 pane=
l
      drm/panel: Add connector_type for some EDT displays
      drm/panel: Add bus_format and bus_flags for EDT ETM0430G0DH6
      drm/panel: simple: Add support for EDT ETMV570G2DHU panel
      drm/panel: simple: Add support for EDT ETM0350G0DH6 panel

Stephen Boyd (1):
      drm/msm/dpu: Add newlines to printks

Steven Price (2):
      drm/panfrost: Queue jobs on the hardware
      drm/of: free the iterator object on failure

Stuart Summers (1):
      drm/i915/xehp: Handle new device context ID format

Stylon Wang (2):
      drm/amd/display: Add Freesync HDMI support to DM with DMUB
      drm/amd/display: Fix ASSR regression on embedded panels

S=C3=B8ren Andersen (1):
      drm/panel: simple: add LOGIC Technologies LTTD800480070-L6WH-RT

Tao Zhou (18):
      drm/amdgpu: update gc golden setting for dimgrey_cavefish
      drm/amd/pm: update DRIVER_IF_VERSION for beige_goby
      drm/amdgpu: increase size for sdma fw name string
      drm/amdgpu: add cyan_skillfish asic type
      drm/amdgpu: dynamic initialize ip offset for cyan_skillfish
      drm/amdgpu: init family name for cyan_skillfish
      drm/amdgpu: set ip blocks for cyan_skillfish
      drm/amdgpu: add cp/rlc fw loading support for cyan_skillfish
      drm/amdgpu: add sdma fw loading support for cyan_skillfish
      drm/amdgpu: load fw direclty for cyan_skillfish
      drm/amdgpu: add cyan_skillfish support in gmc v10
      drm/amdgpu: add cyan_skillfish support in gfx v10
      drm/amdgpu: add sdma v5 golden settings for cyan_skillfish
      drm/amdgpu: add gc v10 golden settings for cyan_skillfish
      drm/amdkfd: enable cyan_skillfish KFD
      drm/amdgpu: add chip early init for cyan_skillfish
      drm/amdgpu: add nbio support for cyan_skillfish
      drm/amdgpu: add pci device id for cyan_skillfish

Tejas Upadhyay (5):
      drm/i915/jsl: Add W/A 1409054076 for JSL
      drm/i915/selftest: Extend ctx_timestamp ICL workaround to GEN11
      drm/i915/jsl: Remove require_force_probe protection
      drm/i915/ehl: Remove require_force_probe protection
      drm/i915/adl_s: Fix dma_mask_size to 39 bit

Thierry Reding (3):
      gpu: host1x: debug: Use dma_addr_t more consistently
      gpu: host1x: debug: Dump only relevant parts of CDMA push buffer
      gpu: host1x: debug: Dump DMASTART and DMAEND register

Thomas Hellstr=C3=B6m (20):
      drm/i915/ttm: Introduce a TTM i915 gem object backend
      drm/i915/lmem: Verify checks for lmem residency
      drm/i915: Simplify userptr locking
      drm/i915/ttm: Fix memory leaks
      drm/i915/ttm: Calculate the object placement at get_pages time
      drm/i915: Reference objects on the ww object list
      drm/i915: Break out dma_resv ww locking utilities to separate files
      drm/i915: Introduce a ww transaction helper
      drm/i915/gem: Zap the client blt code
      drm/i915/gem: Zap the i915_gem_object_blt code
      drm/i915: Perform execbuffer object locking as a separate step
      drm/i915/ttm: Fix incorrect assumptions about ttm_bo_validate() seman=
tics
      drm/i915: Update object placement flags to be mutable
      drm/i915/ttm: Adjust gem flags and caching settings after a move
      drm/i915/ttm: Use TTM for system memory
      drm/i915: Reinstate the mmap ioctl for some platforms
      drm/i915/gem: Implement object migration
      drm/i915/display: Migrate objects to LMEM if possible for display
      drm/i915/gem: Correct the locking and pin pattern for dma-buf (v8)
      drm/i915/gem: Migrate to system at dma-buf attach time (v7)

Thomas Zimmermann (110):
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
      drm/i915: Use the correct IRQ during resume
      drm/i915: Drop all references to DRM IRQ midlayer
      drm/bochs: Move to tiny/
      drm/bochs: Use managed initialization for GEM VRAM helpers
      drm/vram-helper: Unexport drm_vram_helper_{alloc,release}_mm()
      drm/mgag200: Don't pass flags to drm_dev_register()
      drm/mgag200: Inline mgag200_device_init()
      drm/mgag200: Extract device type and flags in mgag200_pci_probe()
      drm/mgag200: Constify LUT for programming bpp
      drm/vgem: Implement mmap as GEM object function
      drm/etnaviv: Implement mmap as GEM object function
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
      drm/ingenic: Convert to Linux IRQ interfaces
      drm/hisilicon/hibmc: Remove variable 'priv' from hibmc_unload()
      drm/gem: Provide drm_gem_fb_{begin,end}_cpu_access() helpers
      drm/udl: Use framebuffer dma-buf helpers
      drm/mipi-dbi: Use framebuffer dma-buf helpers
      drm/gud: Use framebuffer dma-buf helpers
      drm/gm12u320: Use framebuffer dma-buf helpers
      drm/repaper: Use framebuffer dma-buf helpers
      drm/st7586: Use framebuffer dma-buf helpers
      drm/shmobile: Convert to Linux IRQ interfaces
      drm: Define DRM_FORMAT_MAX_PLANES
      drm/gem: Provide drm_gem_fb_{vmap,vunmap}()
      drm/gem: Clear mapping addresses for unused framebuffer planes
      drm/gud: Map framebuffer BOs with drm_gem_fb_vmap()
      drm/vkms: Map output framebuffer BOs with drm_gem_fb_vmap()
      drm/msm: Implement mmap as GEM object function
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
      drm/mediatek: Implement mmap as GEM object function
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

Tim Gover (1):
      drm: vc4: Fix pixel-wrap issue with DVP teardown

Tom St Denis (1):
      drm/amd/amdgpu: add regCP_MEx_INT_STAT_DEBUG for Aldebaran debugging

Tuo Li (3):
      drm/amdgpu: drop redundant null-pointer checks in
amdgpu_ttm_tt_populate() and amdgpu_ttm_tt_unpopulate()
      gpu: drm: amd: amdgpu: amdgpu_i2c: fix possible
uninitialized-variable access in amdgpu_i2c_router_select_ddc_port()
      drm/display: fix possible null-pointer dereference in dcn10_set_clock=
()

Tvrtko Ursulin (3):
      drm/i915: Fix busy ioctl commentary
      drm/i915: Document the Virtual Engine uAPI
      drm/i915/xehp: VDBOX/VEBOX fusing registers are enable-based

Uma Shankar (1):
      drm/i915/display/xelpd: Fix incorrect color capability reporting

Uwe Kleine-K=C3=B6nig (5):
      PCI: endpoint: Make struct pci_epf_driver::remove return void
      s390/cio: Make struct css_driver::remove return void
      s390/ccwgroup: Drop if with an always false condition
      s390/scm: Make struct scm_driver::remove return void
      bus: Make remove callback return void

Vandita Kulkarni (2):
      drm/i915/display: Add write permissions for fec support
      drm/i915/display/dsc: Force dsc BPP

Veerabadhran Gopalakrishnan (3):
      amdgpu/nv.c - Added video codec support for Yellow Carp
      amdgpu/nv.c - Optimize code for video codec support structure
      drm/amdgpu - Corrected the video codecs array name for yellow carp

Venkata Sandeep Dhanalakota (1):
      drm/i915/gen12: Use fuse info to enable SFC

Victor Lu (3):
      drm/amd/display: Fix comparison error in dcn21 DML
      drm/amd/display: Guard DST_Y_PREFETCH register overflow in DCN21
      drm/amd/display: Add missing DCN21 IP parameter

Victor Zhao (1):
      drm/amdgpu: Extend full access wait time in guest

Ville Syrj=C3=A4l=C3=A4 (33):
      drm/i915: s/intel/hsw/ for hsw/bdw/skl buf trans
      drm/i915: Introduce hsw_get_buf_trans()
      drm/i915: Wrap the platform specific buf trans structs into a union
      drm/i915: Rename dkl phy buf trans tables
      drm/i915: Wrap the buf trans tables into a struct
      drm/i915: Introduce intel_get_buf_trans()
      drm/i915; Return the whole buf_trans struct from get_buf_trans()
      drm/i915: Store the HDMI default entry in the bug trans struct
      drm/i915: Introduce encoder->get_buf_trans()
      drm/i915: Clean up hsw/bdw/skl/kbl buf trans funcs
      drm/i915: Introduce rkl_get_combo_buf_trans()
      drm/i915: Fix dg1 buf trans tables
      drm/i915: Deduplicate icl DP HBR2 vs. eDP HBR3 table
      drm/i915: Fix ehl edp hbr2 vswing table
      drm/i915: Clean up jsl/ehl buf trans functions
      drm/i915: Nuke buf_trans hdmi functions
      drm/i915: Add the missing adls vswing tables
      drm/i915/fbc: s/threshold/limit/
      drm/i915/fbc: Extract intel_fbc_program_cfb()
      drm/i915/fbc: Embed the compressed_llb node
      drm/i915/fbc: Don't pass around the mm node
      drm/i915/fbc: Handle 16bpp compression limit better
      drm/i915/fbc: Introduce g4x_dpfc_ctl_limit()
      drm/i915/fbc: Extract intel_fbc_stolen_end()
      drm/i915/fbc: Make the cfb allocation loop a bit more legible
      drm/i915/fbc: Allocate llb before cfb
      drm/i915: Stop hand rolling drm_crtc_mask()
      drm/i915: Clean up intel_get_load_detect_pipe() a bit
      drm/i915: Clean up intel_find_initial_plane_obj() a bit
      drm/i915: Clean up pre-skl wm calling convention
      drm/i915: Clean up intel_fbdev_init_bios() a bit
      drm/i915: s/intel_crtc/crtc/
      drm/i915/gt: Fix -EDEADLK handling regression

Vinay Belgaumkar (14):
      drm/i915/guc/slpc: Initial definitions for SLPC
      drm/i915/guc/slpc: Gate Host RPS when SLPC is enabled
      drm/i915/guc/slpc: Adding SLPC communication interfaces
      drm/i915/guc/slpc: Allocate, initialize and release SLPC
      drm/i915/guc/slpc: Enable SLPC and add related H2G events
      drm/i915/guc/slpc: Remove BUG_ON in guc_submission_disable
      drm/i915/guc/slpc: Add methods to set min/max frequency
      drm/i915/guc/slpc: Add get max/min freq hooks
      drm/i915/guc/slpc: Add debugfs for SLPC info
      drm/i915/guc/slpc: Enable ARAT timer interrupt
      drm/i915/guc/slpc: Cache platform frequency limits
      drm/i915/guc/slpc: Sysfs hooks for SLPC
      drm/i915/guc/slpc: Add SLPC selftest
      drm/i915/guc/rc: Setup and enable GuCRC feature

Vivek Kasireddy (4):
      udmabuf: Add support for mapping hugepages (v4)
      drm/virtio: Add fences for Guest blobs
      drm/virtio: Prepare resource_flush to accept a fence
      drm/virtio: Add the fence in resource_flush if present

Wan Jiabing (1):
      drm/i915: Remove duplicate include of intel_region_lmem.h

Wang (1):
      drm/amd/display: Add null checks

Wayne Lin (1):
      drm/amd/display: Create dc_sink when EDID fail

Wei Li (1):
      drm/msm: Fix error return code in msm_drm_init()

Wei Yongjun (2):
      drm/panfrost: Fix missing clk_disable_unprepare() on error in
panfrost_clk_init()
      drm/exynos: g2d: fix missing unlock on error in g2d_runqueue_worker()

Wenjing Liu (4):
      drm/amd/display: isolate link training setting override to its
own function
      drm/amd/display: add update authentication interface
      drm/amd/display: remove unused functions
      drm/amd/display: add authentication_complete in hdcp output

Wesley Chalmers (3):
      Revert "drm/amd/display: Always write repeater mode regardless of LTT=
PR"
      drm/amd/display: Add copyright notice to new files
      drm/amd/display: Assume LTTPR interop for DCN31+

Wyatt Wood (2):
      drm/amd/display: Add ETW logging for AUX failures
      drm/amd/display: Add ETW log to dmub_psr_get_state

Xiaojian Du (1):
      drm/amdgpu: update the golden setting for vangogh

Xiaomeng Hou (4):
      drm/amd/pm: drop smu_v13_0_1.c|h files for yellow carp
      drm/amd/display: update header file name
      drm/amd/pm: update yellow carp pmfw interface version
      drm/amd/pm: update smu v13.0.1 firmware header

Xin Ji (1):
      drm/bridge: anx7625: Tune K value for IVO panel

Xiyu Yang (2):
      fbmem: Convert from atomic_t to refcount_t on fb_info->count
      drm/exynos: Convert from atomic_t to refcount_t on
g2d_cmdlist_userptr->refcount

Yang Yingliang (1):
      drm/bochs: Fix missing pci_disable_device() on error in bochs_pci_pro=
be()

Yifan Zhang (3):
      drm/amdgpu: fix the doorbell missing when in CGPG issue for renoir.
      drm/amdkfd: fix random KFDSVMRangeTest.SetGetAttributesTest test fail=
ure
      drm/amdgpu: rename amdgpu_bo_get_preferred_pin_domain

Yongqiang Niu (4):
      drm/mediatek: Adjust rdma fifo threshold calculate formula
      drm/mediatek: Separate aal sub driver
      drm/mediatek: Add mt8183 aal support
      drm/mediatek: Clear pending flag when cmdq packet is done

Yu Jiahua (1):
      drivers: gpu: add missing MODULE_DEVICE_TABLE in anx7625.c

YuBiao Wang (3):
      drm/amdgpu: Read clock counter via MMIO to reduce delay (v5)
      drm/amd/amdgpu: skip locking delayed work if not initialized.
      drm/amd/amdgpu:flush ttm delayed work before cancel_sync

Yunus Bas (2):
      dt-bindings: display: simple: Add EDT ETMV570G2DHU
      dt-bindings: display: simple: Add EDT ETM0350G0DH6

Zack Rusin (15):
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
      drm/vmwgfx: Switch to using DRM_IOCTL_DEF_DRV
      drm/vmwgfx: Cleanup logging
      drm/vmwgfx: Be a lot more flexible with MOB limits
      drm/vmwgfx: Use 2.19 version number to recognize mks-stats ioctls

Zhan Liu (3):
      drm/amdgpu/display - only update eDP's backlight level when necessary
      drm/amd/display: Reduce delay when sink device not able to ACK
00340h write
      drm/amd/display: Use DCN30 watermark calc for DCN301

Zhenneng Li (1):
      drm/radeon: Update pitch for page flip

Zheyu Ma (5):
      video: fbdev: kyro: fix a DoS bug by restricting user input
      video: fbdev: neofb: add a check against divide error
      video: fbdev: asiliantfb: Error out if 'pixclock' equals zero
      video: fbdev: kyro: Error out if 'pixclock' equals zero
      video: fbdev: riva: Error out if 'pixclock' equals zero

Zhigang Luo (1):
      drm/amdgpu: correct MMSCH 1.0 version

sunglee (1):
      drm/amd/display: DCN2X Prefer ODM over bottom pipe to find second pip=
e

xinhui pan (1):
      drm/amdgpu: Fix out-of-bounds read when update mapping

zhouchuangao (1):
      gpu/drm/amd: Remove duplicated include of drm_drv.h

 .../ABI/testing/sysfs-kernel-dmabuf-buffers        |   24 +
 .../bindings/display/bridge/simple-bridge.yaml     |    3 +
 .../bindings/display/bridge/ti,sn65dsi86.yaml      |   21 +-
 .../devicetree/bindings/display/dp-aux-bus.yaml    |   37 +
 .../bindings/display/mediatek/mediatek,dsi.txt     |    2 +-
 .../bindings/display/msm/dsi-controller-main.yaml  |   17 +
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   72 +
 .../bindings/display/panel/ilitek,ili9341.yaml     |   78 +
 .../bindings/display/panel/innolux,ej030na.yaml    |   62 +
 .../bindings/display/panel/panel-simple.yaml       |   24 +
 .../bindings/display/panel/samsung,lms380kf01.yaml |   99 +
 .../bindings/display/panel/samsung,lms397kf04.yaml |   18 +-
 .../display/rockchip/dw_mipi_dsi_rockchip.txt      |    1 +
 .../bindings/display/solomon,ssd1307fb.yaml        |  208 ++
 .../devicetree/bindings/display/ssd1307fb.txt      |   60 -
 .../devicetree/bindings/vendor-prefixes.yaml       |    4 +
 Documentation/driver-api/dma-buf.rst               |   13 +
 .../driver-api/thermal/nouveau_thermal.rst         |    2 +-
 Documentation/gpu/drm-kms.rst                      |   35 +-
 Documentation/gpu/drm-uapi.rst                     |   22 +
 Documentation/gpu/i915.rst                         |   15 +
 Documentation/gpu/rfc/i915_parallel_execbuf.h      |  122 +
 Documentation/gpu/rfc/i915_scheduler.rst           |  148 +
 Documentation/gpu/rfc/index.rst                    |    4 +
 Documentation/gpu/vkms.rst                         |   38 +-
 MAINTAINERS                                        |   27 +-
 arch/arm/common/locomo.c                           |    3 +-
 arch/arm/common/sa1111.c                           |    4 +-
 arch/arm/include/asm/efi.h                         |    5 +-
 arch/arm/mach-rpc/ecard.c                          |    4 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |   30 +-
 arch/arm64/include/asm/efi.h                       |    5 +-
 arch/mips/sgi-ip22/ip22-gio.c                      |    3 +-
 arch/parisc/kernel/drivers.c                       |    5 +-
 arch/powerpc/platforms/ps3/system-bus.c            |    3 +-
 arch/powerpc/platforms/pseries/ibmebus.c           |    3 +-
 arch/powerpc/platforms/pseries/vio.c               |    3 +-
 arch/riscv/include/asm/efi.h                       |    5 +-
 arch/s390/include/asm/eadm.h                       |    2 +-
 arch/sparc/kernel/vio.c                            |    4 +-
 arch/x86/Kconfig                                   |   26 -
 arch/x86/kernel/Makefile                           |    3 -
 drivers/acpi/bus.c                                 |    3 +-
 drivers/amba/bus.c                                 |    4 +-
 drivers/base/auxiliary.c                           |    4 +-
 drivers/base/isa.c                                 |    4 +-
 drivers/base/platform.c                            |    4 +-
 drivers/bcma/main.c                                |    6 +-
 drivers/bus/sunxi-rsb.c                            |    4 +-
 drivers/cxl/core.c                                 |    3 +-
 drivers/dax/bus.c                                  |    4 +-
 drivers/dma-buf/Kconfig                            |   11 +
 drivers/dma-buf/Makefile                           |    1 +
 drivers/dma-buf/dma-buf-sysfs-stats.c              |  205 ++
 drivers/dma-buf/dma-buf-sysfs-stats.h              |   35 +
 drivers/dma-buf/dma-buf.c                          |   26 +-
 drivers/dma-buf/dma-fence-chain.c                  |    2 +-
 drivers/dma-buf/dma-resv.c                         |   33 +-
 drivers/dma-buf/st-dma-fence-chain.c               |   16 +-
 drivers/dma-buf/udmabuf.c                          |   59 +-
 drivers/dma/idxd/sysfs.c                           |    4 +-
 drivers/firewire/core-device.c                     |    4 +-
 drivers/firmware/Kconfig                           |   32 +
 drivers/firmware/Makefile                          |    2 +
 drivers/firmware/arm_scmi/bus.c                    |    4 +-
 drivers/firmware/efi/Makefile                      |    2 +
 drivers/firmware/efi/efi-init.c                    |   90 -
 .../kernel =3D> drivers/firmware/efi}/sysfb_efi.c    |   80 +-
 drivers/firmware/google/coreboot_table.c           |    4 +-
 {arch/x86/kernel =3D> drivers/firmware}/sysfb.c      |   37 +-
 .../kernel =3D> drivers/firmware}/sysfb_simplefb.c   |   33 +-
 drivers/fpga/dfl.c                                 |    4 +-
 drivers/gpu/drm/Kconfig                            |    8 +-
 drivers/gpu/drm/Makefile                           |    3 +-
 drivers/gpu/drm/amd/amdgpu/Makefile                |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c            |   54 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   84 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |    8 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c   |    1 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |   31 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   |   31 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |   33 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h  |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   38 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |   40 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h   |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h        |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   72 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  186 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   65 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c         |  239 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.h         |   37 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c             |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  144 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |   32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   37 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   21 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |   26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c            |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |   29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   39 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |    2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   34 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |  117 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |   72 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.c          |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c           |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c            |   20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_pll.h            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 1115 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |  165 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  120 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     | 1275 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |   70 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h     |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c  |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |  118 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  102 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |   92 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |   81 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |    2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |  643 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h           |   26 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  167 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  140 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |    2 +
 drivers/gpu/drm/amd/amdgpu/atombios_crtc.c         |    2 +-
 drivers/gpu/drm/amd/amdgpu/cik.c                   |   10 +-
 .../gpu/drm/amd/amdgpu/cyan_skillfish_reg_init.c   |   51 +
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c           |  780 -----
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  161 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |    1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |    1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |    1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   26 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |    6 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.c           |    5 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   32 +-
 drivers/gpu/drm/amd/amdgpu/mca_v3_0.c              |  125 +
 drivers/gpu/drm/amd/amdgpu/mca_v3_0.h              |   26 +
 drivers/gpu/drm/amd/amdgpu/mmsch_v1_0.h            |    4 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |   18 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h              |    3 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |   21 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |   38 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   47 +-
 drivers/gpu/drm/amd/amdgpu/nv.h                    |    1 +
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c             |   40 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |   77 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0_8.c           |  208 ++
 .../amd/amdgpu/{dce_virtual.h =3D> psp_v11_0_8.h}    |   10 +-
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             |   35 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |  126 +-
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c              |    4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |   50 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |   17 -
 drivers/gpu/drm/amd/amdgpu/si.c                    |    8 +-
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c         |  324 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   16 +-
 drivers/gpu/drm/amd/amdgpu/soc15_common.h          |    8 +-
 drivers/gpu/drm/amd/amdgpu/ta_xgmi_if.h            |   17 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |   15 +
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.h              |   15 +
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |   24 +
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c              |   24 +
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c              |   25 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |   24 +
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |   24 +
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c              |   25 +
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |   23 +
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |   23 +
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |    2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |    2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |    2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |   35 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |   23 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   47 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   17 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   59 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   60 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |    1 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |   84 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h       |    1 +
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |    5 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |    3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |   10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h        |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  225 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |    5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |    6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |    1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/Makefile     |    4 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  385 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   27 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   18 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |   16 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |    2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_irq_params.h   |    1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   23 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h    |   24 +
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c     |  144 +
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h     |   34 +
 .../drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c |   12 +-
 .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c       |    4 +-
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |   14 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |    4 +-
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c        |   16 +-
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |   25 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c |   10 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |    2 +-
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |   10 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   68 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  118 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  148 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpcd.c |   25 +
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |    7 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stat.c      |   24 +
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |  109 +-
 drivers/gpu/drm/amd/display/dc/core/dc_vm_helper.c |    3 +
 drivers/gpu/drm/amd/display/dc/dc.h                |  123 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |    1 +
 drivers/gpu/drm/amd/display/dc/dc_stat.h           |    1 +
 drivers/gpu/drm/amd/display/dc/dc_trace.h          |    3 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   83 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |  200 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   21 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h    |   19 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |   29 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h  |    4 +
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   53 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |    6 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  |    2 +
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c    |   11 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c    |   21 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.h    |   33 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |   17 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   14 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c  |    2 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   51 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.h  |    2 -
 .../gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c    |    1 +
 .../gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.h    |   14 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c  |    2 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |    6 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c    |   90 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_hubbub.c    |    1 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_hubbub.h    |   14 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   37 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |    8 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   70 +-
 .../gpu/drm/amd/display/dc/dcn301/dcn301_hubbub.c  |    1 +
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |   96 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |    4 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    |   33 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h    |   15 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |   34 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.h |    1 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |    3 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   17 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |    4 +
 .../display/dc/dml/dcn20/display_rq_dlg_calc_20.c  |    2 +-
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c        |    2 +-
 .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |   14 +-
 .../display/dc/dml/dcn21/display_rq_dlg_calc_21.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c   |  102 +
 drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.h   |   34 +
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   25 +-
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |    2 +-
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |   15 +-
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |    2 +-
 .../drm/amd/display/dc/dml/display_mode_enums.h    |    4 +-
 .../drm/amd/display/dc/dml/display_mode_structs.h  |    2 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |   16 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |    4 +-
 .../amd/display/dc/dml/dml1_display_rq_dlg_calc.c  |    4 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |  393 ++-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |    1 -
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |    5 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |   11 +
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |    1 +
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |    1 -
 drivers/gpu/drm/amd/display/dc/inc/link_dpcd.h     |   25 +
 drivers/gpu/drm/amd/display/dc/irq_types.h         |    2 +-
 drivers/gpu/drm/amd/display/dc/os_types.h          |   35 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   18 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   64 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |   46 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.h  |   10 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   17 +
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.c    |   75 +-
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h    |   10 +-
 .../drm/amd/display/modules/hdcp/hdcp1_execution.c |    6 -
 .../amd/display/modules/hdcp/hdcp1_transition.c    |    8 +-
 .../drm/amd/display/modules/hdcp/hdcp2_execution.c |    3 -
 .../amd/display/modules/hdcp/hdcp2_transition.c    |    4 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_log.c    |   74 +
 .../gpu/drm/amd/display/modules/hdcp/hdcp_log.h    |   72 -
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |  109 +-
 drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |   13 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |    1 +
 .../amd/include/asic_reg/dcn/dcn_3_1_2_sh_mask.h   |    4 +
 .../drm/amd/include/asic_reg/gc/gc_9_4_2_offset.h  |    4 +
 .../drm/amd/include/asic_reg/gc/gc_9_4_2_sh_mask.h |   54 +
 .../drm/amd/include/asic_reg/mp/mp_11_0_8_offset.h |  352 ++
 .../amd/include/asic_reg/thm/thm_11_0_2_offset.h   |    6 +
 .../amd/include/asic_reg/thm/thm_11_0_2_sh_mask.h  |    3 +
 .../amd/include/asic_reg/umc/umc_8_7_0_sh_mask.h   |  179 +-
 drivers/gpu/drm/amd/include/atomfirmware.h         |    2 +-
 .../gpu/drm/amd/include/cyan_skillfish_ip_offset.h |  714 ++++
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |    3 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |    4 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   48 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    9 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            |   33 +-
 drivers/gpu/drm/amd/pm/inc/hwmgr.h                 |    6 +-
 .../amd/pm/inc/smu11_driver_if_cyan_skillfish.h    |   95 +
 .../amd/pm/inc/smu11_driver_if_sienna_cichlid.h    |   65 +-
 drivers/gpu/drm/amd/pm/inc/smu_types.h             |    2 +-
 drivers/gpu/drm/amd/pm/inc/smu_v11_0.h             |   16 +-
 drivers/gpu/drm/amd/pm/inc/smu_v11_8_pmfw.h        |  152 +
 drivers/gpu/drm/amd/pm/inc/smu_v11_8_ppsmc.h       |   70 +
 drivers/gpu/drm/amd/pm/inc/smu_v13_0.h             |    2 +-
 drivers/gpu/drm/amd/pm/inc/smu_v13_0_1_pmfw.h      |    4 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |   16 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |   24 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |   46 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_thermal.c  |   21 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_thermal.h  |    4 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c    |    7 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |   59 +-
 .../drm/amd/pm/powerplay/hwmgr/vega10_thermal.c    |   18 +-
 .../drm/amd/pm/powerplay/hwmgr/vega10_thermal.h    |    4 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |   14 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |   80 +-
 .../drm/amd/pm/powerplay/hwmgr/vega20_thermal.c    |   30 +-
 .../drm/amd/pm/powerplay/hwmgr/vega20_thermal.h    |    4 +-
 drivers/gpu/drm/amd/pm/powerplay/si_dpm.c          |   19 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   99 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/Makefile        |    1 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  446 +--
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    |   76 +
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.h    |   19 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  262 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  564 ++-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |  135 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   48 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |   20 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  289 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  102 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |   14 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  292 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |    3 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |    5 -
 drivers/gpu/drm/arm/hdlcd_drv.c                    |  174 +-
 drivers/gpu/drm/arm/hdlcd_drv.h                    |    1 +
 drivers/gpu/drm/arm/malidp_drv.c                   |    4 -
 drivers/gpu/drm/armada/armada_drv.c                |    4 +-
 drivers/gpu/drm/armada/armada_overlay.c            |    2 -
 drivers/gpu/drm/armada/armada_plane.c              |   29 -
 drivers/gpu/drm/armada/armada_plane.h              |    2 -
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c           |    1 -
 drivers/gpu/drm/ast/ast_drv.c                      |    2 +-
 drivers/gpu/drm/ast/ast_drv.h                      |    6 +
 drivers/gpu/drm/ast/ast_main.c                     |    5 +
 drivers/gpu/drm/ast/ast_mode.c                     |   54 +-
 drivers/gpu/drm/ast/ast_post.c                     |   91 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |   80 +-
 drivers/gpu/drm/bochs/Kconfig                      |   11 -
 drivers/gpu/drm/bochs/Makefile                     |    4 -
 drivers/gpu/drm/bochs/bochs.h                      |   98 -
 drivers/gpu/drm/bochs/bochs_drv.c                  |  205 --
 drivers/gpu/drm/bochs/bochs_hw.c                   |  323 --
 drivers/gpu/drm/bochs/bochs_kms.c                  |  178 -
 drivers/gpu/drm/bochs/bochs_mm.c                   |   24 -
 drivers/gpu/drm/bridge/Kconfig                     |    1 +
 drivers/gpu/drm/bridge/adv7511/adv7533.c           |    2 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |    9 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   36 +-
 drivers/gpu/drm/bridge/analogix/anx7625.h          |    4 +-
 drivers/gpu/drm/bridge/cdns-dsi.c                  |    4 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |    2 +
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |    2 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |    8 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   55 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |   68 +-
 drivers/gpu/drm/bridge/tc358768.c                  |    4 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  200 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  760 ++--
 drivers/gpu/drm/drm_aperture.c                     |   21 +-
 drivers/gpu/drm/drm_atomic.c                       |    4 +-
 drivers/gpu/drm/drm_atomic_helper.c                |   20 +-
 drivers/gpu/drm/drm_atomic_uapi.c                  |    6 +-
 drivers/gpu/drm/drm_auth.c                         |   96 +-
 drivers/gpu/drm/drm_bridge.c                       |   12 +-
 drivers/gpu/drm/drm_bufs.c                         |    2 +-
 drivers/gpu/drm/drm_cache.c                        |    2 +-
 drivers/gpu/drm/drm_connector.c                    |    5 +-
 drivers/gpu/drm/drm_crtc_internal.h                |    2 +
 drivers/gpu/drm/drm_damage_helper.c                |   58 +-
 drivers/gpu/drm/drm_debugfs.c                      |    3 +-
 drivers/gpu/drm/drm_debugfs_crc.c                  |    8 +-
 drivers/gpu/drm/drm_dp_aux_bus.c                   |  323 ++
 drivers/gpu/drm/drm_dp_helper.c                    |  470 ++-
 drivers/gpu/drm/drm_dp_mst_topology.c              |   10 +-
 drivers/gpu/drm/drm_drv.c                          |    4 +-
 drivers/gpu/drm/drm_dsc.c                          |    2 +-
 drivers/gpu/drm/drm_edid.c                         |    4 +-
 drivers/gpu/drm/drm_fb_helper.c                    |    2 +-
 drivers/gpu/drm/drm_file.c                         |    7 +-
 drivers/gpu/drm/drm_format_helper.c                |    2 +-
 drivers/gpu/drm/drm_framebuffer.c                  |   24 +-
 drivers/gpu/drm/drm_gem.c                          |   38 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c            |   97 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |  199 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |    6 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |   11 +-
 drivers/gpu/drm/drm_hdcp.c                         |    2 +-
 drivers/gpu/drm/drm_ioctl.c                        |    4 +-
 drivers/gpu/drm/drm_irq.c                          |  104 +-
 drivers/gpu/drm/drm_lease.c                        |  263 +-
 drivers/gpu/drm/drm_legacy_misc.c                  |    3 +-
 drivers/gpu/drm/drm_mipi_dbi.c                     |   75 +-
 drivers/gpu/drm/drm_mm.c                           |    2 +-
 drivers/gpu/drm/drm_mode_object.c                  |    2 +-
 drivers/gpu/drm/drm_modes.c                        |    4 +-
 drivers/gpu/drm/drm_of.c                           |    6 +-
 drivers/gpu/drm/drm_plane.c                        |  106 +-
 drivers/gpu/drm/drm_plane_helper.c                 |    2 +-
 drivers/gpu/drm/drm_prime.c                        |    4 +-
 drivers/gpu/drm/drm_probe_helper.c                 |    2 +-
 drivers/gpu/drm/drm_property.c                     |    2 +-
 drivers/gpu/drm/drm_scdc_helper.c                  |    2 +-
 drivers/gpu/drm/drm_simple_kms_helper.c            |   51 +-
 drivers/gpu/drm/drm_syncobj.c                      |    8 +-
 drivers/gpu/drm/drm_vblank.c                       |   27 +-
 drivers/gpu/drm/drm_vma_manager.c                  |    2 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              |   14 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.h              |    3 -
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              |   18 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c        |   13 -
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |    6 +
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c             |   31 +
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |    3 +-
 drivers/gpu/drm/exynos/exynos_dp.c                 |    5 +-
 drivers/gpu/drm/exynos/exynos_drm_dma.c            |    2 +
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |   10 -
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |    8 +-
 drivers/gpu/drm/exynos/exynos_drm_g2d.c            |   14 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c               |    5 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |   78 +-
 drivers/gpu/drm/gma500/oaktrail_lvds.c             |    6 +-
 drivers/gpu/drm/gma500/power.c                     |    1 +
 drivers/gpu/drm/gma500/psb_drv.c                   |    8 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |    5 -
 drivers/gpu/drm/gma500/psb_irq.c                   |   26 +-
 drivers/gpu/drm/gma500/psb_irq.h                   |    4 +-
 drivers/gpu/drm/gud/gud_drv.c                      |   61 +-
 drivers/gpu/drm/gud/gud_internal.h                 |    2 +
 drivers/gpu/drm/gud/gud_pipe.c                     |   86 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c     |    3 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |   15 +-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |    9 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |    2 -
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |    4 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c        |    4 +-
 drivers/gpu/drm/i810/i810_dma.c                    |    3 +-
 drivers/gpu/drm/i915/Kconfig.debug                 |    6 +
 drivers/gpu/drm/i915/Makefile                      |   15 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |    2 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |   46 +-
 drivers/gpu/drm/i915/display/intel_acpi.c          |   19 +
 drivers/gpu/drm/i915/display/intel_acpi.h          |    3 +
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |    7 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |    3 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |    4 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |   11 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |  178 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  107 +-
 drivers/gpu/drm/i915/display/intel_color.c         |    5 +-
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |  106 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |    3 +
 drivers/gpu/drm/i915/display/intel_crtc.c          |   10 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |   12 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  630 ++--
 drivers/gpu/drm/i915/display/intel_ddi.h           |    4 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c | 2475 +++++++------
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h |   70 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  379 +-
 drivers/gpu/drm/i915/display/intel_display.h       |    1 +
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  118 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |  568 ++-
 drivers/gpu/drm/i915/display/intel_display_power.h |   15 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   34 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |  232 +-
 drivers/gpu/drm/i915/display/intel_dmc.h           |   23 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |   65 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |    1 -
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |  329 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   43 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |   12 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  631 +---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |    3 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |  219 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   96 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |   25 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |    4 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   53 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |    4 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |    3 +
 drivers/gpu/drm/i915/display/intel_psr.c           |  265 +-
 drivers/gpu/drm/i915/display/intel_quirks.c        |   34 +
 drivers/gpu/drm/i915/display/intel_sdvo.c          |    4 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |  862 +++++
 drivers/gpu/drm/i915/display/intel_snps_phy.h      |   35 +
 drivers/gpu/drm/i915/display/intel_sprite.c        |    2 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |   34 +-
 drivers/gpu/drm/i915/display/intel_tc.h            |    2 +
 drivers/gpu/drm/i915/display/intel_tv.c            |   13 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |    2 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |    5 +-
 drivers/gpu/drm/i915/display/intel_vga.c           |   12 +-
 drivers/gpu/drm/i915/display/skl_scaler.c          |   49 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   28 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   13 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c        |    4 +-
 drivers/gpu/drm/i915/gem/i915_gem_client_blt.c     |  355 --
 drivers/gpu/drm/i915/gem/i915_gem_client_blt.h     |   21 -
 drivers/gpu/drm/i915/gem/i915_gem_context.c        | 2920 +++++++---------
 drivers/gpu/drm/i915/gem/i915_gem_context.h        |    6 +
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h  |  196 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |  188 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |   58 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |   11 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  486 +--
 drivers/gpu/drm/i915/gem/i915_gem_internal.c       |    4 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c           |  160 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h           |   12 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |  107 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  350 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |   69 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_blt.c     |  461 ---
 drivers/gpu/drm/i915/gem/i915_gem_object_blt.h     |   39 -
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  255 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   54 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.c         |   23 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.h         |    1 +
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |   30 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |    4 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |  965 +++++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h            |   49 +
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |  117 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |   23 +-
 .../gpu/drm/i915/gem/selftests/huge_gem_object.c   |    4 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |    8 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |  114 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |  127 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |  190 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_migrate.c  |  243 ++
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |  164 +-
 .../drm/i915/gem/selftests/i915_gem_object_blt.c   |  597 ----
 drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c |    3 +-
 drivers/gpu/drm/i915/gem/selftests/mock_context.c  |   67 +-
 drivers/gpu/drm/i915/gem/selftests/mock_context.h  |    4 +-
 drivers/gpu/drm/i915/gt/debugfs_gt_pm.c            |   10 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |   17 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |   68 +
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        |   44 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.h        |   16 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h  |    7 +
 drivers/gpu/drm/i915/gt/intel_context.c            |   88 +-
 drivers/gpu/drm/i915/gt/intel_context.h            |   56 +-
 drivers/gpu/drm/i915/gt/intel_context_param.c      |   63 -
 drivers/gpu/drm/i915/gt/intel_context_param.h      |    6 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h      |   64 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |   87 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  420 ++-
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c   |   74 +-
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h   |    4 +
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |    4 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |   93 +-
 drivers/gpu/drm/i915/gt/intel_engine_user.c        |    6 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  604 ++--
 .../gpu/drm/i915/gt/intel_execlists_submission.h   |   12 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |    6 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |    2 +
 drivers/gpu/drm/i915/gt/intel_gt.c                 |  197 +-
 drivers/gpu/drm/i915/gt/intel_gt.h                 |   10 +
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c     |   10 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |   13 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |   11 +-
 drivers/gpu/drm/i915/gt/intel_gt_requests.c        |   21 +-
 drivers/gpu/drm/i915/gt/intel_gt_requests.h        |    9 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |   37 +
 drivers/gpu/drm/i915/gt/intel_gtt.c                |   20 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |   18 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  117 +-
 drivers/gpu/drm/i915/gt/intel_lrc_reg.h            |    3 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c            |  688 ++++
 drivers/gpu/drm/i915/gt/intel_migrate.h            |   65 +
 drivers/gpu/drm/i915/gt/intel_migrate_types.h      |   15 +
 drivers/gpu/drm/i915/gt/intel_mocs.c               |    2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |   49 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |    7 +-
 drivers/gpu/drm/i915/gt/intel_renderstate.h        |    1 +
 drivers/gpu/drm/i915/gt/intel_reset.c              |   56 +-
 drivers/gpu/drm/i915/gt/intel_ring.h               |    1 +
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |   70 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |  209 +-
 drivers/gpu/drm/i915/gt/intel_rps.h                |   10 +
 drivers/gpu/drm/i915/gt/intel_sseu.c               |  126 +-
 drivers/gpu/drm/i915/gt/intel_sseu.h               |   10 +-
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c       |    8 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  498 +--
 drivers/gpu/drm/i915/gt/intel_workarounds_types.h  |    1 +
 drivers/gpu/drm/i915/gt/mock_engine.c              |   51 +-
 drivers/gpu/drm/i915/gt/selftest_context.c         |   10 +
 .../gpu/drm/i915/gt/selftest_engine_heartbeat.c    |   22 +
 .../gpu/drm/i915/gt/selftest_engine_heartbeat.h    |    2 +
 drivers/gpu/drm/i915/gt/selftest_engine_pm.c       |    4 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |  307 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |  330 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |    6 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c         |  669 ++++
 drivers/gpu/drm/i915/gt/selftest_mocs.c            |   52 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c           |    2 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c            |  311 ++
 drivers/gpu/drm/i915/gt/selftest_timeline.c        |    2 +-
 drivers/gpu/drm/i915/gt/selftest_workarounds.c     |  162 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h   |  129 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h  |  235 ++
 .../drm/i915/gt/uc/abi/guc_communication_ctb_abi.h |  127 +-
 .../i915/gt/uc/abi/guc_communication_mmio_abi.h    |   65 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h  |  213 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |  206 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |  119 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |  487 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h         |    4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |  703 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h          |   36 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c     |   47 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |  167 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |   29 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h         |    6 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c          |   80 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h          |   31 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |  626 ++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h        |   42 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h  |   29 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 2895 +++++++++++++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h  |   18 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |  126 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.h              |   15 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |   27 +-
 drivers/gpu/drm/i915/gvt/gtt.c                     |    2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |    7 +-
 drivers/gpu/drm/i915/i915_active.c                 |   37 +-
 drivers/gpu/drm/i915/i915_active.h                 |    3 +
 drivers/gpu/drm/i915/i915_buddy.c                  |  421 +++
 drivers/gpu/drm/i915/i915_buddy.h                  |  135 +
 drivers/gpu/drm/i915/i915_cmd_parser.c             |   67 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |    8 +-
 drivers/gpu/drm/i915/i915_debugfs_params.c         |   32 +
 drivers/gpu/drm/i915/i915_drv.c                    |   19 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  270 +-
 drivers/gpu/drm/i915/i915_gem.c                    |   63 +-
 drivers/gpu/drm/i915/i915_gem.h                    |   12 -
 drivers/gpu/drm/i915/i915_gem_evict.c              |    1 +
 drivers/gpu/drm/i915/i915_gem_ww.c                 |   63 +
 drivers/gpu/drm/i915/i915_gem_ww.h                 |   50 +
 drivers/gpu/drm/i915/i915_getparam.c               |    7 +-
 drivers/gpu/drm/i915/i915_globals.c                |  160 -
 drivers/gpu/drm/i915/i915_globals.h                |   37 -
 drivers/gpu/drm/i915/i915_gpu_error.c              |   27 +-
 drivers/gpu/drm/i915/i915_irq.c                    |  178 +-
 drivers/gpu/drm/i915/i915_module.c                 |  124 +
 drivers/gpu/drm/i915/i915_pci.c                    |  208 +-
 drivers/gpu/drm/i915/i915_pci.h                    |    8 +
 drivers/gpu/drm/i915/i915_perf.c                   |   58 +-
 drivers/gpu/drm/i915/i915_perf.h                   |    2 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |    6 +-
 drivers/gpu/drm/i915/i915_pmu.h                    |    4 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  452 +--
 drivers/gpu/drm/i915/i915_request.c                |  299 +-
 drivers/gpu/drm/i915/i915_request.h                |   38 +-
 drivers/gpu/drm/i915/i915_scatterlist.c            |   80 +
 drivers/gpu/drm/i915/i915_scatterlist.h            |    5 +
 drivers/gpu/drm/i915/i915_scheduler.c              |  220 +-
 drivers/gpu/drm/i915/i915_scheduler.h              |   54 +-
 drivers/gpu/drm/i915/i915_scheduler_types.h        |  111 +
 drivers/gpu/drm/i915/i915_sw_fence_work.c          |    5 +-
 drivers/gpu/drm/i915/i915_sw_fence_work.h          |    2 +-
 drivers/gpu/drm/i915/i915_sysfs.c                  |   83 +-
 drivers/gpu/drm/i915/i915_trace.h                  |  201 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |  258 ++
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h      |   56 +
 drivers/gpu/drm/i915/i915_vma.c                    |   34 +-
 drivers/gpu/drm/i915/i915_vma.h                    |    3 +
 drivers/gpu/drm/i915/intel_device_info.c           |   43 +-
 drivers/gpu/drm/i915/intel_device_info.h           |   20 +-
 drivers/gpu/drm/i915/intel_dram.c                  |   42 +-
 drivers/gpu/drm/i915/intel_memory_region.c         |   63 +-
 drivers/gpu/drm/i915/intel_memory_region.h         |   30 +-
 drivers/gpu/drm/i915/intel_pch.c                   |    8 +-
 drivers/gpu/drm/i915/intel_pch.h                   |    2 +
 drivers/gpu/drm/i915/intel_pm.c                    |  304 +-
 drivers/gpu/drm/i915/intel_region_ttm.c            |  150 +-
 drivers/gpu/drm/i915/intel_region_ttm.h            |   23 +-
 drivers/gpu/drm/i915/intel_sideband.c              |   13 +-
 drivers/gpu/drm/i915/intel_sideband.h              |    2 +-
 drivers/gpu/drm/i915/intel_step.c                  |  149 +-
 drivers/gpu/drm/i915/intel_step.h                  |   33 +-
 drivers/gpu/drm/i915/intel_uncore.c                |  424 ++-
 drivers/gpu/drm/i915/intel_uncore.h                |   20 +-
 drivers/gpu/drm/i915/intel_wopcm.c                 |   10 +-
 drivers/gpu/drm/i915/selftests/i915_buddy.c        |  787 +++++
 .../gpu/drm/i915/selftests/i915_live_selftests.h   |    5 +-
 .../gpu/drm/i915/selftests/i915_mock_selftests.h   |    2 +-
 .../gpu/drm/i915/selftests/i915_perf_selftests.h   |    2 +-
 drivers/gpu/drm/i915/selftests/i915_request.c      |    4 +-
 drivers/gpu/drm/i915/selftests/i915_selftest.c     |    4 +-
 drivers/gpu/drm/i915/selftests/igt_flush_test.c    |    2 +-
 drivers/gpu/drm/i915/selftests/igt_live_test.c     |    2 +-
 drivers/gpu/drm/i915/selftests/igt_mmap.c          |   25 +-
 drivers/gpu/drm/i915/selftests/igt_mmap.h          |   12 +-
 .../gpu/drm/i915/selftests/intel_memory_region.c   |  257 +-
 .../drm/i915/selftests/intel_scheduler_helpers.c   |   88 +
 .../drm/i915/selftests/intel_scheduler_helpers.h   |   33 +
 drivers/gpu/drm/i915/selftests/intel_uncore.c      |    2 +
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |    3 +-
 drivers/gpu/drm/i915/selftests/mock_gtt.c          |    1 -
 drivers/gpu/drm/i915/selftests/mock_region.c       |   29 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |    8 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c              |    1 -
 drivers/gpu/drm/imx/imx-drm-core.c                 |   11 -
 drivers/gpu/drm/imx/imx-ldb.c                      |    4 +-
 drivers/gpu/drm/imx/ipuv3-plane.c                  |    1 -
 drivers/gpu/drm/imx/parallel-display.c             |    5 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   41 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |    1 -
 drivers/gpu/drm/kmb/kmb_drv.c                      |   26 +-
 drivers/gpu/drm/kmb/kmb_dsi.c                      |    1 -
 drivers/gpu/drm/lima/lima_sched.c                  |    3 +-
 drivers/gpu/drm/mcde/mcde_display.c                |    1 -
 drivers/gpu/drm/mcde/mcde_dsi.c                    |   11 +-
 drivers/gpu/drm/mediatek/Makefile                  |    3 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c            |  167 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |    9 +
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |    6 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |    4 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  173 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |   42 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   65 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |    1 +
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             |   44 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.h             |    3 -
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           |    1 -
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |    4 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |    5 +-
 drivers/gpu/drm/meson/meson_drv.c                  |   12 +-
 drivers/gpu/drm/meson/meson_overlay.c              |    1 -
 drivers/gpu/drm/meson/meson_plane.c                |    1 -
 drivers/gpu/drm/mga/mga_dma.c                      |    2 +-
 drivers/gpu/drm/mga/mga_drv.h                      |    1 -
 drivers/gpu/drm/mgag200/Makefile                   |    2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |   64 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |   77 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c             |  797 +----
 drivers/gpu/drm/mgag200/mgag200_pll.c              |  992 ++++++
 drivers/gpu/drm/mgag200/mgag200_reg.h              |    9 +-
 drivers/gpu/drm/msm/Kconfig                        |    7 +-
 drivers/gpu/drm/msm/Makefile                       |    1 +
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c          |    4 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   35 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c            |    2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c          |    7 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   24 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |    1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  137 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |    4 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |   34 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |   40 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |    6 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   43 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |    5 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  102 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   10 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |   85 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c           |    2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   11 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h       |    1 -
 drivers/gpu/drm/msm/dp/dp_aux.c                    |    3 +
 drivers/gpu/drm/msm/dp/dp_catalog.c                |    8 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  141 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |   77 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |   50 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  |    9 +-
 drivers/gpu/drm/msm/dp/dp_power.c                  |    3 +
 drivers/gpu/drm/msm/dsi/dsi.c                      |   15 +-
 drivers/gpu/drm/msm/dsi/dsi.h                      |   18 +-
 drivers/gpu/drm/msm/dsi/dsi.xml.h                  |   74 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   33 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |    3 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  169 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  146 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   83 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |    5 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         |    2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |    8 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  190 +-
 drivers/gpu/drm/msm/msm_drv.c                      |  158 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   18 +-
 drivers/gpu/drm/msm/msm_fbdev.c                    |   14 +-
 drivers/gpu/drm/msm/msm_fence.c                    |   53 +-
 drivers/gpu/drm/msm/msm_fence.h                    |   44 +-
 drivers/gpu/drm/msm/msm_gem.c                      |  134 +-
 drivers/gpu/drm/msm/msm_gem.h                      |   50 +-
 drivers/gpu/drm/msm/msm_gem_prime.c                |   11 -
 drivers/gpu/drm/msm/msm_gem_submit.c               |  350 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |  220 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |  139 +-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c              |  203 ++
 drivers/gpu/drm/msm/msm_kms.h                      |    5 +-
 drivers/gpu/drm/msm/msm_rd.c                       |    6 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c               |   69 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h               |   12 +
 drivers/gpu/drm/msm/msm_submitqueue.c              |   53 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |   84 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.h                  |    3 +
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |   74 +-
 drivers/gpu/drm/mxsfb/mxsfb_regs.h                 |    9 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |   34 +-
 drivers/gpu/drm/nouveau/nouveau_backlight.c        |  166 +-
 drivers/gpu/drm/nouveau/nouveau_connector.h        |    9 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |    5 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h          |    1 +
 drivers/gpu/drm/nouveau/nouveau_fence.c            |    2 +-
 drivers/gpu/drm/nouveau/nouveau_vga.c              |    8 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |    6 +-
 drivers/gpu/drm/omapdrm/omap_drv.h                 |    2 +
 drivers/gpu/drm/omapdrm/omap_irq.c                 |   13 +-
 drivers/gpu/drm/omapdrm/omap_plane.c               |    3 +
 drivers/gpu/drm/panel/Kconfig                      |   54 +
 drivers/gpu/drm/panel/Makefile                     |    5 +
 .../gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c   |    2 +-
 drivers/gpu/drm/panel/panel-dsi-cm.c               |    2 +-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c       |    2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       |  792 +++++
 drivers/gpu/drm/panel/panel-innolux-ej030na.c      |  289 ++
 drivers/gpu/drm/panel/panel-khadas-ts050.c         |    2 +-
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |    2 +-
 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c |    2 +-
 drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c |    2 +-
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c   |  366 ++
 drivers/gpu/drm/panel/panel-samsung-db7430.c       |  347 ++
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |    2 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c  |   10 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c  |   83 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      |   41 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.h      |   33 +-
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c      |    4 +-
 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c    |    2 +-
 drivers/gpu/drm/panel/panel-simple.c               |  357 +-
 drivers/gpu/drm/panel/panel-sony-acx424akp.c       |   82 +-
 drivers/gpu/drm/panel/panel-widechips-ws2401.c     |  441 +++
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   |    2 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c        |    3 +-
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
 drivers/gpu/drm/pl111/pl111_display.c              |    2 -
 drivers/gpu/drm/pl111/pl111_drv.c                  |    1 -
 drivers/gpu/drm/qxl/qxl_drv.c                      |    4 +-
 drivers/gpu/drm/qxl/qxl_drv.h                      |    3 -
 drivers/gpu/drm/qxl/qxl_irq.c                      |    9 +-
 drivers/gpu/drm/qxl/qxl_prime.c                    |    6 -
 drivers/gpu/drm/r128/r128_cce.c                    |    3 +-
 drivers/gpu/drm/radeon/atombios.h                  |    4 +-
 drivers/gpu/drm/radeon/evergreen.c                 |    8 +-
 drivers/gpu/drm/radeon/r100.c                      |    9 +
 drivers/gpu/drm/radeon/r300_reg.h                  |    2 +-
 drivers/gpu/drm/radeon/radeon_device.c             |   19 +-
 drivers/gpu/drm/radeon/radeon_drv.c                |    6 +-
 drivers/gpu/drm/radeon/radeon_fb.c                 |    8 +-
 drivers/gpu/drm/radeon/radeon_fence.c              |    4 +-
 drivers/gpu/drm/radeon/radeon_irq_kms.c            |   60 +-
 drivers/gpu/drm/radeon/radeon_kms.h                |    4 -
 drivers/gpu/drm/radeon/radeon_vm.c                 |    2 +-
 drivers/gpu/drm/radeon/rs600.c                     |    8 +-
 drivers/gpu/drm/radeon/rv770.c                     |    8 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |   13 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |   26 +-
 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c             |    1 +
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |  126 +-
 drivers/gpu/drm/rockchip/Kconfig                   |    2 +
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |  349 ++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |    8 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |    1 -
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |    5 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |    5 +-
 drivers/gpu/drm/scheduler/sched_main.c             |   21 +-
 drivers/gpu/drm/selftests/test-drm_damage_helper.c |  287 +-
 drivers/gpu/drm/shmobile/shmob_drm_drv.c           |   14 +-
 drivers/gpu/drm/shmobile/shmob_drm_drv.h           |    1 +
 drivers/gpu/drm/sti/sti_compositor.c               |    2 -
 drivers/gpu/drm/sti/sti_dvo.c                      |    4 +-
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c              |   17 +-
 drivers/gpu/drm/stm/ltdc.c                         |   12 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |    4 +-
 drivers/gpu/drm/sun4i/sun4i_layer.c                |    1 -
 drivers/gpu/drm/sun4i/sun4i_lvds.c                 |    4 +-
 drivers/gpu/drm/sun4i/sun4i_rgb.c                  |    4 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |    1 -
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |    1 -
 drivers/gpu/drm/tegra/Kconfig                      |    1 +
 drivers/gpu/drm/tegra/Makefile                     |    3 +
 drivers/gpu/drm/tegra/dc.c                         |  358 +-
 drivers/gpu/drm/tegra/dc.h                         |   17 +
 drivers/gpu/drm/tegra/drm.c                        |  107 +-
 drivers/gpu/drm/tegra/drm.h                        |   12 +
 drivers/gpu/drm/tegra/firewall.c                   |  254 ++
 drivers/gpu/drm/tegra/gem.c                        |   13 +
 drivers/gpu/drm/tegra/gem.h                        |    2 +
 drivers/gpu/drm/tegra/plane.c                      |  117 +
 drivers/gpu/drm/tegra/plane.h                      |   16 +
 drivers/gpu/drm/tegra/rgb.c                        |    5 +-
 drivers/gpu/drm/tegra/submit.c                     |  625 ++++
 drivers/gpu/drm/tegra/submit.h                     |   21 +
 drivers/gpu/drm/tegra/uapi.c                       |  338 ++
 drivers/gpu/drm/tegra/uapi.h                       |   58 +
 drivers/gpu/drm/tegra/vic.c                        |  112 +-
 drivers/gpu/drm/tidss/tidss_drv.c                  |   15 +-
 drivers/gpu/drm/tidss/tidss_drv.h                  |    2 +
 drivers/gpu/drm/tidss/tidss_irq.c                  |   30 +-
 drivers/gpu/drm/tidss/tidss_irq.h                  |    4 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |    4 +-
 drivers/gpu/drm/tidss/tidss_plane.c                |    1 -
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |   51 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.h                |    3 +
 drivers/gpu/drm/tilcdc/tilcdc_external.c           |    4 +-
 drivers/gpu/drm/tiny/Kconfig                       |   17 +-
 drivers/gpu/drm/tiny/Makefile                      |    1 +
 drivers/gpu/drm/tiny/bochs.c                       |  733 ++++
 drivers/gpu/drm/tiny/cirrus.c                      |    6 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |   23 +-
 drivers/gpu/drm/tiny/hx8357d.c                     |    1 -
 drivers/gpu/drm/tiny/ili9225.c                     |    1 -
 drivers/gpu/drm/tiny/ili9341.c                     |    1 -
 drivers/gpu/drm/tiny/ili9486.c                     |    1 -
 drivers/gpu/drm/tiny/mi0283qt.c                    |    1 -
 drivers/gpu/drm/tiny/repaper.c                     |   19 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |    4 +-
 drivers/gpu/drm/tiny/st7586.c                      |   19 +-
 drivers/gpu/drm/tiny/st7735r.c                     |    1 -
 drivers/gpu/drm/ttm/ttm_bo.c                       |   66 +-
 drivers/gpu/drm/tve200/tve200_display.c            |    1 -
 drivers/gpu/drm/udl/udl_modeset.c                  |   33 +-
 drivers/gpu/drm/v3d/Makefile                       |    1 +
 drivers/gpu/drm/v3d/v3d_drv.c                      |    8 +
 drivers/gpu/drm/v3d/v3d_drv.h                      |   63 +
 drivers/gpu/drm/v3d/v3d_gem.c                      |   31 +
 drivers/gpu/drm/v3d/v3d_perfmon.c                  |  213 ++
 drivers/gpu/drm/v3d/v3d_regs.h                     |    2 +
 drivers/gpu/drm/v3d/v3d_sched.c                    |   26 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |    3 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.h               |    1 -
 drivers/gpu/drm/vboxvideo/vbox_irq.c               |   16 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |    5 +-
 drivers/gpu/drm/vc4/Kconfig                        |    1 +
 drivers/gpu/drm/vc4/vc4_drv.c                      |    6 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |    8 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |    4 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  450 +--
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |    5 +-
 drivers/gpu/drm/vc4/vc4_irq.c                      |   48 +-
 drivers/gpu/drm/vc4/vc4_kms.c                      |    1 -
 drivers/gpu/drm/vc4/vc4_regs.h                     |   30 +
 drivers/gpu/drm/vc4/vc4_v3d.c                      |   17 +-
 drivers/gpu/drm/via/via_mm.c                       |    3 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c               |    2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |    4 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c             |   64 +-
 drivers/gpu/drm/virtio/virtgpu_prime.c             |    2 +
 drivers/gpu/drm/virtio/virtgpu_vq.c                |    7 +-
 drivers/gpu/drm/vkms/vkms_composer.c               |   28 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |   32 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |   13 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |   57 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |   28 +-
 drivers/gpu/drm/vmwgfx/Kconfig                     |    8 +
 drivers/gpu/drm/vmwgfx/Makefile                    |    2 +-
 .../gpu/drm/vmwgfx/device_include/includeCheck.h   |    3 -
 .../gpu/drm/vmwgfx/device_include/svga3d_caps.h    |  111 -
 drivers/gpu/drm/vmwgfx/device_include/svga3d_cmd.h | 3680 ++++++++--------=
----
 .../gpu/drm/vmwgfx/device_include/svga3d_devcaps.h |  793 ++---
 drivers/gpu/drm/vmwgfx/device_include/svga3d_dx.h  | 3503 +++++++++-------=
---
 .../gpu/drm/vmwgfx/device_include/svga3d_limits.h  |  101 +-
 drivers/gpu/drm/vmwgfx/device_include/svga3d_reg.h |   15 +-
 .../drm/vmwgfx/device_include/svga3d_surfacedefs.h | 3132 ++++++++--------=
-
 .../gpu/drm/vmwgfx/device_include/svga3d_types.h   | 3020 +++++++---------
 .../gpu/drm/vmwgfx/device_include/svga_escape.h    |   68 +-
 .../gpu/drm/vmwgfx/device_include/svga_overlay.h   |  203 +-
 drivers/gpu/drm/vmwgfx/device_include/svga_reg.h   | 2847 ++++-----------
 drivers/gpu/drm/vmwgfx/device_include/svga_types.h |   51 -
 .../gpu/drm/vmwgfx/device_include/vm_basic_types.h |  130 +-
 .../drm/vmwgfx/device_include/vmware_pack_begin.h  |    2 -
 .../drm/vmwgfx/device_include/vmware_pack_end.h    |    2 -
 drivers/gpu/drm/vmwgfx/ttm_memory.c                |    2 +
 drivers/gpu/drm/vmwgfx/vmw_surface_cache.h         |  539 +++
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.c            |   24 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |    5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c                |    9 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c             |   10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c         |    7 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c            |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c            |    3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.c            |  142 +
 drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.h            |   50 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |  457 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   52 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |   17 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c      |   36 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c              |  111 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c                |   24 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   18 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |    5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_mksstat.h            |  144 +
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c                |   45 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c                |  579 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |   11 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |    4 -
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c             |    3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_so.c                 |    3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |    7 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |   84 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |   35 -
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c         |    4 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c            |    1 -
 drivers/gpu/drm/xlnx/Kconfig                       |    2 +
 drivers/gpu/drm/xlnx/zynqmp_disp.c                 |  320 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |   22 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |    2 -
 drivers/gpu/drm/zte/zx_drm_drv.c                   |    6 -
 drivers/gpu/host1x/Makefile                        |    1 +
 drivers/gpu/host1x/cdma.c                          |   58 +-
 drivers/gpu/host1x/fence.c                         |  168 +
 drivers/gpu/host1x/fence.h                         |   13 +
 drivers/gpu/host1x/hw/channel_hw.c                 |   87 +-
 drivers/gpu/host1x/hw/debug_hw.c                   |   32 +-
 drivers/gpu/host1x/hw/debug_hw_1x01.c              |    8 +-
 drivers/gpu/host1x/hw/debug_hw_1x06.c              |   16 +-
 drivers/gpu/host1x/hw/hw_host1x02_uclass.h         |   12 +
 drivers/gpu/host1x/hw/hw_host1x04_uclass.h         |   12 +
 drivers/gpu/host1x/hw/hw_host1x05_uclass.h         |   12 +
 drivers/gpu/host1x/hw/hw_host1x06_uclass.h         |   12 +
 drivers/gpu/host1x/hw/hw_host1x07_uclass.h         |   12 +
 drivers/gpu/host1x/intr.c                          |    9 +
 drivers/gpu/host1x/intr.h                          |    2 +
 drivers/gpu/host1x/job.c                           |   98 +-
 drivers/gpu/host1x/job.h                           |   16 +
 drivers/gpu/host1x/syncpt.c                        |    2 +
 drivers/gpu/host1x/syncpt.h                        |   12 +
 drivers/gpu/vga/vgaarb.c                           |   67 +-
 drivers/hid/hid-core.c                             |    4 +-
 drivers/hid/intel-ish-hid/ishtp/bus.c              |    4 +-
 drivers/hv/vmbus_drv.c                             |    5 +-
 drivers/hwtracing/intel_th/core.c                  |    4 +-
 drivers/i2c/i2c-core-base.c                        |    5 +-
 drivers/i3c/master.c                               |    4 +-
 drivers/input/gameport/gameport.c                  |    3 +-
 drivers/input/serio/serio.c                        |    3 +-
 drivers/ipack/ipack.c                              |    4 +-
 drivers/macintosh/macio_asic.c                     |    4 +-
 drivers/mcb/mcb-core.c                             |    4 +-
 drivers/media/pci/bt8xx/bttv-gpio.c                |    3 +-
 drivers/memstick/core/memstick.c                   |    3 +-
 drivers/mfd/mcp-core.c                             |    3 +-
 drivers/misc/mei/bus.c                             |    4 +-
 drivers/misc/tifm_core.c                           |    3 +-
 drivers/mmc/core/bus.c                             |    4 +-
 drivers/mmc/core/sdio_bus.c                        |    4 +-
 drivers/net/netdevsim/bus.c                        |    3 +-
 drivers/ntb/core.c                                 |    4 +-
 drivers/ntb/ntb_transport.c                        |    4 +-
 drivers/nubus/bus.c                                |    6 +-
 drivers/nvdimm/bus.c                               |    3 +-
 drivers/pci/endpoint/pci-epf-core.c                |    7 +-
 drivers/pci/pci-driver.c                           |    3 +-
 drivers/pcmcia/ds.c                                |    4 +-
 drivers/platform/surface/aggregator/bus.c          |    4 +-
 drivers/platform/x86/wmi.c                         |    4 +-
 drivers/pnp/driver.c                               |    3 +-
 drivers/rapidio/rio-driver.c                       |    4 +-
 drivers/rpmsg/rpmsg_core.c                         |    7 +-
 drivers/s390/block/scm_drv.c                       |    4 +-
 drivers/s390/cio/ccwgroup.c                        |    6 +-
 drivers/s390/cio/chsc_sch.c                        |    3 +-
 drivers/s390/cio/css.c                             |    7 +-
 drivers/s390/cio/css.h                             |    2 +-
 drivers/s390/cio/device.c                          |    9 +-
 drivers/s390/cio/eadm_sch.c                        |    4 +-
 drivers/s390/cio/scm.c                             |    5 +-
 drivers/s390/cio/vfio_ccw_drv.c                    |    3 +-
 drivers/s390/crypto/ap_bus.c                       |    4 +-
 drivers/scsi/scsi_debug.c                          |    3 +-
 drivers/sh/superhyway/superhyway.c                 |    8 +-
 drivers/siox/siox-core.c                           |    4 +-
 drivers/slimbus/core.c                             |    4 +-
 drivers/soc/qcom/apr.c                             |    4 +-
 drivers/spi/spi.c                                  |    4 +-
 drivers/spmi/spmi.c                                |    3 +-
 drivers/ssb/main.c                                 |    4 +-
 drivers/staging/fieldbus/anybuss/host.c            |    4 +-
 drivers/staging/greybus/gbphy.c                    |    4 +-
 drivers/target/loopback/tcm_loop.c                 |    5 +-
 drivers/thunderbolt/domain.c                       |    4 +-
 drivers/tty/serdev/core.c                          |    4 +-
 drivers/usb/common/ulpi.c                          |    4 +-
 drivers/usb/serial/bus.c                           |    4 +-
 drivers/usb/typec/bus.c                            |    4 +-
 drivers/vdpa/vdpa.c                                |    4 +-
 drivers/vfio/mdev/mdev_driver.c                    |    4 +-
 drivers/vfio/pci/vfio_pci.c                        |   11 +-
 drivers/video/fbdev/arcfb.c                        |    2 +-
 drivers/video/fbdev/asiliantfb.c                   |    3 +
 drivers/video/fbdev/core/fbmem.c                   |    6 +-
 drivers/video/fbdev/ep93xx-fb.c                    |    4 +-
 drivers/video/fbdev/kyro/fbdev.c                   |    8 +
 drivers/video/fbdev/neofb.c                        |    2 +-
 drivers/video/fbdev/omap2/omapfb/dss/apply.c       |    4 +-
 drivers/video/fbdev/riva/fbdev.c                   |    3 +
 drivers/video/fbdev/ssd1307fb.c                    |  151 +-
 drivers/virtio/virtio.c                            |    3 +-
 drivers/vlynq/vlynq.c                              |    4 +-
 drivers/vme/vme.c                                  |    4 +-
 drivers/xen/xenbus/xenbus.h                        |    2 +-
 drivers/xen/xenbus/xenbus_probe.c                  |    4 +-
 drivers/zorro/zorro-driver.c                       |    3 +-
 include/drm/amd_asic_type.h                        |   17 +-
 include/drm/bridge/dw_hdmi.h                       |    2 +
 include/drm/drm_aperture.h                         |   14 +-
 include/drm/drm_auth.h                             |   68 +-
 include/drm/drm_bridge.h                           |   26 +-
 include/drm/drm_connector.h                        |   10 +
 include/drm/drm_damage_helper.h                    |   18 -
 include/drm/drm_device.h                           |   18 +-
 include/drm/drm_dp_aux_bus.h                       |   57 +
 include/drm/drm_dp_helper.h                        |  175 +-
 include/drm/drm_drv.h                              |   44 +-
 include/drm/drm_edid.h                             |    2 +-
 include/drm/drm_file.h                             |   22 +-
 include/drm/drm_fourcc.h                           |   13 +-
 include/drm/drm_framebuffer.h                      |    8 +-
 include/drm/drm_gem.h                              |    2 -
 include/drm/drm_gem_atomic_helper.h                |   17 +-
 include/drm/drm_gem_framebuffer_helper.h           |   13 +
 include/drm/drm_gem_vram_helper.h                  |   16 +-
 include/drm/drm_legacy.h                           |    3 +
 include/drm/drm_mipi_dbi.h                         |    7 +-
 include/drm/drm_mipi_dsi.h                         |   13 +-
 include/drm/drm_modeset_helper_vtables.h           |    7 +-
 include/drm/drm_panel.h                            |    8 +-
 include/drm/drm_plane.h                            |   39 +-
 include/drm/drm_print.h                            |    2 +-
 include/drm/drm_property.h                         |    9 +-
 include/drm/drm_rect.h                             |    3 +
 include/drm/drm_simple_kms_helper.h                |   34 +-
 include/drm/drm_vma_manager.h                      |    2 +-
 include/drm/gpu_scheduler.h                        |   37 +-
 include/drm/ttm/ttm_placement.h                    |    7 +-
 include/dt-bindings/phy/phy.h                      |    2 +
 include/linux/device/bus.h                         |    2 +-
 include/linux/dma-buf.h                            |  170 +-
 include/linux/dma-fence-chain.h                    |   52 +-
 include/linux/fb.h                                 |    3 +-
 include/linux/host1x.h                             |   27 +-
 include/linux/lockdep.h                            |   41 +-
 include/linux/pci-epf.h                            |    2 +-
 {arch/x86/include/asm =3D> include/linux}/sysfb.h    |   32 +-
 include/linux/vgaarb.h                             |  118 +-
 include/uapi/drm/drm.h                             |   14 +-
 include/uapi/drm/drm_fourcc.h                      |  109 +-
 include/uapi/drm/drm_mode.h                        |   92 +-
 include/uapi/drm/i915_drm.h                        |  498 ++-
 include/uapi/drm/msm_drm.h                         |   14 +-
 include/uapi/drm/tegra_drm.h                       |  425 ++-
 include/uapi/drm/v3d_drm.h                         |  136 +
 include/uapi/drm/vmwgfx_drm.h                      |   41 +
 include/uapi/linux/dma-buf.h                       |   50 +-
 include/uapi/linux/kfd_ioctl.h                     |   16 +-
 sound/ac97/bus.c                                   |    6 +-
 sound/aoa/soundbus/core.c                          |    4 +-
 1232 files changed, 63290 insertions(+), 36124 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
 create mode 100644 Documentation/devicetree/bindings/display/dp-aux-bus.ya=
ml
 create mode 100644
Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/innolux,ej030na.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
 create mode 100644
Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/ssd1307fb.txt
 create mode 100644 Documentation/gpu/rfc/i915_parallel_execbuf.h
 create mode 100644 Documentation/gpu/rfc/i915_scheduler.rst
 create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
 create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h
 rename {arch/x86/kernel =3D> drivers/firmware/efi}/sysfb_efi.c (83%)
 rename {arch/x86/kernel =3D> drivers/firmware}/sysfb.c (75%)
 rename {arch/x86/kernel =3D> drivers/firmware}/sysfb_simplefb.c (81%)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/cyan_skillfish_reg_init.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/dce_virtual.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mca_v3_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mca_v3_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/psp_v11_0_8.c
 rename drivers/gpu/drm/amd/amdgpu/{dce_virtual.h =3D> psp_v11_0_8.h} (85%)
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_11_0_8_offse=
t.h
 create mode 100644 drivers/gpu/drm/amd/include/cyan_skillfish_ip_offset.h
 create mode 100644 drivers/gpu/drm/amd/pm/inc/smu11_driver_if_cyan_skillfi=
sh.h
 create mode 100644 drivers/gpu/drm/amd/pm/inc/smu_v11_8_pmfw.h
 create mode 100644 drivers/gpu/drm/amd/pm/inc/smu_v11_8_ppsmc.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c
 rename include/drm/drm_irq.h =3D>
drivers/gpu/drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.h (64%)
 delete mode 100644 drivers/gpu/drm/bochs/Kconfig
 delete mode 100644 drivers/gpu/drm/bochs/Makefile
 delete mode 100644 drivers/gpu/drm/bochs/bochs.h
 delete mode 100644 drivers/gpu/drm/bochs/bochs_drv.c
 delete mode 100644 drivers/gpu/drm/bochs/bochs_hw.c
 delete mode 100644 drivers/gpu/drm/bochs/bochs_kms.c
 delete mode 100644 drivers/gpu/drm/bochs/bochs_mm.c
 create mode 100644 drivers/gpu/drm/drm_dp_aux_bus.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_snps_phy.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_snps_phy.h
 delete mode 100644 drivers/gpu/drm/i915/gem/i915_gem_client_blt.c
 delete mode 100644 drivers/gpu/drm/i915/gem/i915_gem_client_blt.h
 delete mode 100644 drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
 delete mode 100644 drivers/gpu/drm/i915/gem/i915_gem_object_blt.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.h
 create mode 100644 drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
 delete mode 100644 drivers/gpu/drm/i915/gem/selftests/i915_gem_object_blt.=
c
 delete mode 100644 drivers/gpu/drm/i915/gt/intel_context_param.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate_types.h
 create mode 100644 drivers/gpu/drm/i915/gt/selftest_migrate.c
 create mode 100644 drivers/gpu/drm/i915/gt/selftest_slpc.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
 create mode 100644 drivers/gpu/drm/i915/i915_buddy.c
 create mode 100644 drivers/gpu/drm/i915/i915_buddy.h
 create mode 100644 drivers/gpu/drm/i915/i915_gem_ww.c
 create mode 100644 drivers/gpu/drm/i915/i915_gem_ww.h
 delete mode 100644 drivers/gpu/drm/i915/i915_globals.c
 delete mode 100644 drivers/gpu/drm/i915/i915_globals.h
 create mode 100644 drivers/gpu/drm/i915/i915_module.c
 create mode 100644 drivers/gpu/drm/i915/i915_pci.h
 create mode 100644 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
 create mode 100644 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
 create mode 100644 drivers/gpu/drm/i915/selftests/i915_buddy.c
 create mode 100644 drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.=
c
 create mode 100644 drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.=
h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_aal.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_pll.c
 create mode 100644 drivers/gpu/drm/msm/msm_gpu_devfreq.c
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9341.c
 create mode 100644 drivers/gpu/drm/panel/panel-innolux-ej030na.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-db7430.c
 create mode 100644 drivers/gpu/drm/panel/panel-widechips-ws2401.c
 create mode 100644 drivers/gpu/drm/tegra/firewall.c
 create mode 100644 drivers/gpu/drm/tegra/submit.c
 create mode 100644 drivers/gpu/drm/tegra/submit.h
 create mode 100644 drivers/gpu/drm/tegra/uapi.c
 create mode 100644 drivers/gpu/drm/tegra/uapi.h
 create mode 100644 drivers/gpu/drm/tiny/bochs.c
 create mode 100644 drivers/gpu/drm/v3d/v3d_perfmon.c
 delete mode 100644 drivers/gpu/drm/vmwgfx/device_include/includeCheck.h
 delete mode 100644 drivers/gpu/drm/vmwgfx/device_include/svga3d_caps.h
 delete mode 100644 drivers/gpu/drm/vmwgfx/device_include/svga_types.h
 delete mode 100644 drivers/gpu/drm/vmwgfx/device_include/vmware_pack_begin=
.h
 delete mode 100644 drivers/gpu/drm/vmwgfx/device_include/vmware_pack_end.h
 create mode 100644 drivers/gpu/drm/vmwgfx/vmw_surface_cache.h
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.c
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.h
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_mksstat.h
 create mode 100644 drivers/gpu/host1x/fence.c
 create mode 100644 drivers/gpu/host1x/fence.h
 create mode 100644 include/drm/drm_dp_aux_bus.h
 rename {arch/x86/include/asm =3D> include/linux}/sysfb.h (70%)
