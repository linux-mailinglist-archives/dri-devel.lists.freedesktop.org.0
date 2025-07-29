Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47630B15520
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 00:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E2E10E2C0;
	Tue, 29 Jul 2025 22:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dmw9EVv6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C726110E29D
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 21:06:06 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-ae3b336e936so1238295366b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753823165; x=1754427965; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RhM7pilpxs9aV1Qr24kQvaPSUgZUw+q0uH43RsJ5P9Y=;
 b=Dmw9EVv6hhFjiTiBu45vs48yspbsZX1zs5UtOMrviuuCpAr17y1Ewenxddd9m16IUb
 nNJOkdDvFpawVMfa/M6Zuh6K8BwBrdtN0LYades2jK2j6PYlh6mU+PqiFhgrCN4O1y/n
 y6Z9jKJAs9OkQ4WHaObh4n1WEBwsHO3vbvXd9IYfMUSVyIlCfY7jheUwUjgr/4yfnTPf
 yzZXnwbLeDPgUv3nQPhZKl9+9dbgo05hW1Pt+neYahcAFF0XASwQ71oVzfh6ERyKD5QT
 223V0f+LQR22RN/igKKieXGfFykSpq428W5YPUzaQyUMeS/tVef3nSfFNaYOzLP5qXvz
 cGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753823165; x=1754427965;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RhM7pilpxs9aV1Qr24kQvaPSUgZUw+q0uH43RsJ5P9Y=;
 b=iAuvVT8dWrkMX5S0b+ngsyTqVoQ+jgXsjMQ0P+UgnxAmNCyVOUOPl6LgkkmkxKE+kS
 IWb9rd1y/cNxT1AgORx7KWLNVSNU5Jwdx8swRqy/NUrrKbk56N548G3NZ5gO/MEuyv55
 05KQu+MbTP9EJ5PdFjVt406fyssHmORwqO7QW1+IcsxmSUUaQGovYNTMOtCAwQLKYdPV
 dNcQfHH1cdCrlauDNonYB26kLOZTVv1kRpFK+e8/rgrLExQvBDbJZ1Jh3BlhqNrJF1fV
 8U61fupuaGLy1Ba4K92hrMTZXCfxihnFN1eFqMaim85fN3K+36IZJSy+SlskW+anRBZz
 pC7w==
X-Gm-Message-State: AOJu0Yy9remUCw1nIx+doFLIhthVihPD+pKSO1ightl1L6rjC5XpwPjj
 fb7cBWQ3qwdc4yvRETvdcq3s6ZrwCszt6S0MIzcRWjZSogiaObmuM+iup/sxZPyovnUTkGyP4wL
 903O8eXFPvErYs2mjRpDctDEI9tcsnOA=
X-Gm-Gg: ASbGncuQGEknqWZotmDqXSauLKmV7gL/KRfXDN6e/S1n2NDr0bzJWZRpj9Mz44jVT0M
 5XkrjY4YzcdkxTVTOT9jwXXICQDSyAKvk1kADbOw3JCMjvBBTLL7o7uxFInxxyKYoR/3vZfKPmI
 MvFtd4ed4E/AykaKIBBveAymzkE0LMaNMFT+S8uNTgBhu2j7qcSJ0p9xlJ1kH1NlHh/d2NahDd9
 na4DA==
X-Google-Smtp-Source: AGHT+IGEAvsJ8F5WMdw+Euz6taehaBiHsExeX4DG83hz9ttSeLWgO2Ekr2P3FE/AnxKRLBaRAMxZl+a2k0Rm9uPBijs=
X-Received: by 2002:a17:906:f5a1:b0:aec:6e14:25fa with SMTP id
 a640c23a62f3a-af8fda73b36mr93268366b.55.1753823164174; Tue, 29 Jul 2025
 14:06:04 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 30 Jul 2025 07:05:51 +1000
X-Gm-Features: Ac12FXxHx9-KABXNTW7AyTnu2IwncGHoElNOF_GBWiF-M_w9ZsCmE-iWrSZk5lQ
Message-ID: <CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com>
Subject: [git pull] drm for 6.17-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 29 Jul 2025 22:14:02 +0000
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

Hi Linus,

This is the main drm pull request for 6.17-rc1.

Top of the list:
Conflicts abound in this, amdgpu and xe are all about the conflicting.
None of them are insanely complex, but there are a lot of them.

There is also one silent conflict mentioned by Stephen:
https://lore.kernel.org/dri-devel/20250729093903.386848f3@canb.auug.org.au/

I've done a pass at merging mostly taking from drm-tip:
https://github.com/airlied/linux/tree/drm-next-6.17-rc1-merged

External things:
Rust work that is needed for nova driver development.
(mainly DMA coherent allocations)
There is an mtd driver for intel xe non-volatile memory.
There are some i2c bits for intel xe designware integration.
Change to hibernate for better shmem/hibernate interaction

Highlights:
Intel xe enable Panthor Lake, started adding WildCat Lake.
amdgpu has a bunch of reset improvments along with the usual IP updates
msm got VM_BIND support which is important for vulkan sparse memory
more drm_panic users
gpusvm common code to handle a bunch of core SVM work outside drivers.

Mostly it just seems like lots of stuff across the board as usual.

Let me know if there are any issues or if I've forgotten something,

Dave.

drm-next-2025-07-30:
drm for 6.17-rc1

non-drm:
rust:
- make ETIMEDOUT available
- add size constants up to SZ_2G
- add DMA coherent allocation bindings
mtd:
- driver for Intel GPU non-volatile storage
i2c
- designware quirk for Intel xe

core:
- atomic helpers: tune enable/disable sequences
- add task info to wedge API
- refactor EDID quirks
- connector: move HDR sink to drm_display_info
- fourcc: half-float and 32-bit float formats
- mode_config: pass format info to simplify

dma-buf:
- heaps: Give CMA heap a stable name

ci:
- add device tree validation and kunit

displayport:
- change AUX DPCD access probe address
- add quirk for DPCD probe
- add panel replay definitions
- backlight control helpers

fbdev:
- make CONFIG_FIRMWARE_EDID available on all arches

fence:
- fix UAF issues

format-helper:
- improve tests

gpusvm:
- introduce devmem only flag for allocation
- add timeslicing support to GPU SVM

ttm:
- improve eviction

sched:
- tracing improvements
- kunit improvements
- memory leak fixes
- reset handling improvements

color mgmt:
- add hardware gamma LUT handling helpers

bridge:
- add destroy hook
- switch to reference counted drm_bridge allocations
- tc358767: convert to devm_drm_bridge_alloc
- improve CEC handling

panel:
- switch to reference counter drm_panel allocations
- fwnode panel lookup
- Huiling hl055fhv028c support
- Raspberry Pi 7" 720x1280 support
- edp: KDC KD116N3730A05, N160JCE-ELL CMN, N116BCJ-EAK
- simple: AUO P238HAN01
- st7701: Winstar wf40eswaa6mnn0
- visionox: rm69299-shift
- Renesas R61307, Renesas R69328 support
- DJN HX83112B

hdmi:
- add CEC handling
- YUV420 output support

xe:
- WildCat Lake support
- Enable PanthorLake by default
- mark BMG as SRIOV capable
- update firmware recommendations
- Expose media OA units
- aux-bux support for non-volatile memory
- MTD intel-dg driver for non-volatile memory
- Expose fan control and voltage regulator in sysfs
- restructure migration for multi-device
- Restore GuC submit UAF fix
- make GEM shrinker drm managed
- SRIOV VF Post-migration recovery of GGTT nodes
- W/A additions/reworks
- Prefetch support for svm ranges
- Don't allocate managed BO for each policy change
- HWMON fixes for BMG
- Create LRC BO without VM
- PCI ID updates
- make SLPC debugfs files optional
- rework eviction rejection of bound external BOs
- consolidate PAT programming logic for pre/post Xe2
- init changes for flicker-free boot
- Enable GuC Dynamic Inhibit Context switch

i915:
- drm_panic support for i915/xe
- initial flip queue off by default for LNL/PNL
- Wildcat Lake Display support
- Support for DSC fractional link bpp
- Support for simultaneous Panel Replay and Adaptive sync
- Support for PTL+ double buffer LUT
- initial PIPEDMC event handling
- drm_panel_follower support
- DPLL interface renames
- allocate struct intel_display dynamically
- flip queue preperation
- abstract DRAM detection better
- avoid GuC scheduling stalls
- remove DG1 force probe requirement
- fix MEI interrupt handler on RT kernels
- use backlight control helpers for eDP
- more shared display code refactoring

amdgpu:
- add userq slot to INFO ioctl
- SR-IOV hibernation support
- Suspend improvements
- Backlight improvements
- Use scaling for non-native eDP modes
- cleaner shader updates for GC 9.x
- Remove fence slab
- SDMA fw checks for userq support
- RAS updates
- DMCUB updates
- DP tunneling fixes
- Display idle D3 support
- Per queue reset improvements
- initial smartmux support

amdkfd:
- enable KFD on loongarch
- mtype fix for ext coherent system memory

radeon:
- CS validation additional GL extensions
- drop console lock during suspend/resume
- bump driver version

msm:
- VM BIND support
- CI: infrastructure updates
- UBWC single source of truth
- decouple GPU and KMS support
- DP: rework I/O accessors
- DPU: SM8750 support
- DSI: SM8750 support
- GPU: X1-45 support and speedbin support for X1-85
- MDSS: SM8750 support

nova:
- register! macro improvements
- DMA object abstraction
- VBIOS parser + fwsec lookup
- sysmem flush page support
- falcon: generic falcon boot code and HAL
- FWSEC-FRTS: fb setup and load/execute

ivpu:
- Add Wildcat Lake support
- Add turbo flag

ast:
- improve hardware generations implementation

imx:
- IMX8qxq Display Controller support

lima:
- Rockchip RK3528 GPU support

nouveau:
- fence handling cleanup

panfrost:
- MT8370 support
- bo labeling
- 64-bit register access

qaic:
- add RAS support

rockchip:
- convert inno_hdmi to a bridge

rz-du:
- add RZ/V2H(P) support
- MIPI-DSI DCS support

sitronix:
- ST7567 support

sun4i:
- add H616 support

tidss:
- add TI AM62L support
- AM65x OLDI bridge support

bochs:
- drm panic support

vkms:
- YUV and R* format support
- use faux device

vmwgfx:
- fence improvements

hyperv:
- move out of simple
- add drm_panic support
The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e=
:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-07-30

for you to fetch changes up to 711fa2667d8b230ff31f1855d0f25e3263268d8a:

  Merge tag 'drm-misc-next-fixes-2025-07-24' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
(2025-07-29 16:53:20 +1000)

----------------------------------------------------------------
drm for 6.17-rc1

non-drm:
rust:
- make ETIMEDOUT available
- add size constants up to SZ_2G
- add DMA coherent allocation bindings
mtd:
- driver for Intel GPU non-volatile storage
i2c
- designware quirk for Intel xe

core:
- atomic helpers: tune enable/disable sequences
- add task info to wedge API
- refactor EDID quirks
- connector: move HDR sink to drm_display_info
- fourcc: half-float and 32-bit float formats
- mode_config: pass format info to simplify

dma-buf:
- heaps: Give CMA heap a stable name

ci:
- add device tree validation and kunit

displayport:
- change AUX DPCD access probe address
- add quirk for DPCD probe
- add panel replay definitions
- backlight control helpers

fbdev:
- make CONFIG_FIRMWARE_EDID available on all arches

fence:
- fix UAF issues

format-helper:
- improve tests

gpusvm:
- introduce devmem only flag for allocation
- add timeslicing support to GPU SVM

ttm:
- improve eviction

sched:
- tracing improvements
- kunit improvements
- memory leak fixes
- reset handling improvements

color mgmt:
- add hardware gamma LUT handling helpers

bridge:
- add destroy hook
- switch to reference counted drm_bridge allocations
- tc358767: convert to devm_drm_bridge_alloc
- improve CEC handling

panel:
- switch to reference counter drm_panel allocations
- fwnode panel lookup
- Huiling hl055fhv028c support
- Raspberry Pi 7" 720x1280 support
- edp: KDC KD116N3730A05, N160JCE-ELL CMN, N116BCJ-EAK
- simple: AUO P238HAN01
- st7701: Winstar wf40eswaa6mnn0
- visionox: rm69299-shift
- Renesas R61307, Renesas R69328 support
- DJN HX83112B

hdmi:
- add CEC handling
- YUV420 output support

xe:
- WildCat Lake support
- Enable PanthorLake by default
- mark BMG as SRIOV capable
- update firmware recommendations
- Expose media OA units
- aux-bux support for non-volatile memory
- MTD intel-dg driver for non-volatile memory
- Expose fan control and voltage regulator in sysfs
- restructure migration for multi-device
- Restore GuC submit UAF fix
- make GEM shrinker drm managed
- SRIOV VF Post-migration recovery of GGTT nodes
- W/A additions/reworks
- Prefetch support for svm ranges
- Don't allocate managed BO for each policy change
- HWMON fixes for BMG
- Create LRC BO without VM
- PCI ID updates
- make SLPC debugfs files optional
- rework eviction rejection of bound external BOs
- consolidate PAT programming logic for pre/post Xe2
- init changes for flicker-free boot
- Enable GuC Dynamic Inhibit Context switch

i915:
- drm_panic support for i915/xe
- initial flip queue off by default for LNL/PNL
- Wildcat Lake Display support
- Support for DSC fractional link bpp
- Support for simultaneous Panel Replay and Adaptive sync
- Support for PTL+ double buffer LUT
- initial PIPEDMC event handling
- drm_panel_follower support
- DPLL interface renames
- allocate struct intel_display dynamically
- flip queue preperation
- abstract DRAM detection better
- avoid GuC scheduling stalls
- remove DG1 force probe requirement
- fix MEI interrupt handler on RT kernels
- use backlight control helpers for eDP
- more shared display code refactoring

amdgpu:
- add userq slot to INFO ioctl
- SR-IOV hibernation support
- Suspend improvements
- Backlight improvements
- Use scaling for non-native eDP modes
- cleaner shader updates for GC 9.x
- Remove fence slab
- SDMA fw checks for userq support
- RAS updates
- DMCUB updates
- DP tunneling fixes
- Display idle D3 support
- Per queue reset improvements
- initial smartmux support

amdkfd:
- enable KFD on loongarch
- mtype fix for ext coherent system memory

radeon:
- CS validation additional GL extensions
- drop console lock during suspend/resume
- bump driver version

msm:
- VM BIND support
- CI: infrastructure updates
- UBWC single source of truth
- decouple GPU and KMS support
- DP: rework I/O accessors
- DPU: SM8750 support
- DSI: SM8750 support
- GPU: X1-45 support and speedbin support for X1-85
- MDSS: SM8750 support

nova:
- register! macro improvements
- DMA object abstraction
- VBIOS parser + fwsec lookup
- sysmem flush page support
- falcon: generic falcon boot code and HAL
- FWSEC-FRTS: fb setup and load/execute

ivpu:
- Add Wildcat Lake support
- Add turbo flag

ast:
- improve hardware generations implementation

imx:
- IMX8qxq Display Controller support

lima:
- Rockchip RK3528 GPU support

nouveau:
- fence handling cleanup

panfrost:
- MT8370 support
- bo labeling
- 64-bit register access

qaic:
- add RAS support

rockchip:
- convert inno_hdmi to a bridge

rz-du:
- add RZ/V2H(P) support
- MIPI-DSI DCS support

sitronix:
- ST7567 support

sun4i:
- add H616 support

tidss:
- add TI AM62L support
- AM65x OLDI bridge support

bochs:
- drm panic support

vkms:
- YUV and R* format support
- use faux device

vmwgfx:
- fence improvements

hyperv:
- move out of simple
- add drm_panic support

----------------------------------------------------------------
Abdiel Janulgue (3):
      rust: dma: clarify wording and be consistent in `coherent` nomenclatu=
re
      rust: dma: convert the read/write macros to return Result
      rust: dma: add as_slice/write functions for CoherentAllocation

Adri=C3=A1n Larumbe (6):
      drm/panfrost: Add BO labelling to Panfrost
      drm/panfrost: Internally label some BOs
      drm/panfrost: Add driver IOCTL for setting BO labels
      drm/panfrost: show device-wide list of DRM GEM objects over DebugFS
      drm/panfrost: Fix panfrost device variable name in devfreq
      drm/panthor: Remove dead VM flushing code

Akhil P Oommen (4):
      drm/msm/adreno: Add speedbin support for X1-85
      dt-bindings: power: qcom,rpmpd: add Turbo L5 corner
      dt-bindings: opp: adreno: Update regex of OPP entry
      drm/msm/adreno: Add Adreno X1-45 support

Alessio Belle (1):
      drm/imagination: Clear runtime PM errors while resetting the GPU

Alex Deucher (66):
      drm/amdgpu/gfx7: drop reset_kgq
      drm/amdgpu/gfx8: drop reset_kgq
      drm/amdgpu/gfx9: drop reset_kgq
      drm/amdgpu/sdma: handle paging queues in amdgpu_sdma_reset_engine()
      drm/amdgpu: switch job hw_fence to amdgpu_fence
      drm/amdgpu/sdma5: init engine reset mutex
      drm/amdgpu/sdma5.2: init engine reset mutex
      drm/amdgpu/mes: add compatibility checks for set_hw_resource_1
      drm/amdgpu: remove fence slab
      drm/amdgpu/sdma6: add ucode version checks for userq support
      drm/amdgpu/sdma7: add ucode version checks for userq support
      drm/amdgpu/sdma5.x: suspend KFD queues in ring reset
      drm/amdkfd: add hqd_sdma_get_doorbell callbacks for gfx7/8
      drm/amdgpu: remove job parameter from amdgpu_fence_emit()
      drm/amdgpu: update ring reset function signature
      drm/amdgpu: move force completion into ring resets
      drm/amdgpu: move guilty handling into ring resets
      drm/amdgpu: move scheduler wqueue handling into callbacks
      drm/amdgpu/sdma6: add more ucode version checks for userq support
      drm/amdgpu/gfx10: fix KGQ reset sequence
      drm/amdgpu/sdma: consolidate engine reset handling
      drm/amdgpu/sdma: allow caller to handle kernel rings in engine reset
      drm/amd/display: Disable common modes for LVDS
      drm/amd/display: Use scaling for non-native resolutions on LVDS
      drm/amdgpu/gfx9: fix kiq locking in KCQ reset
      drm/amdgpu/gfx9.4.3: fix kiq locking in KCQ reset
      drm/amdgpu/gfx10: fix kiq locking in KCQ reset
      drm/amdgpu/vcn4: add additional ring reset error checking
      drm/amdgpu/vcn4.0.5: add additional ring reset error checking
      drm/amdgpu/vcn5: add additional ring reset error checking
      drm/amdgpu: clean up sdma reset functions
      drm/amdgpu/jpeg2: add additional ring reset error checking
      drm/amdgpu/jpeg3: add additional ring reset error checking
      drm/amdgpu/jpeg4: add additional ring reset error checking
      drm/amdgpu/vcn: don't enable per queue resets on SR-IOV
      drm/amdgpu: clean up jpeg reset functions
      drm/amdgpu: clean up GC reset functions
      drm/amdgpu: track ring state associated with a fence
      drm/amdgpu: make compute timeouts consistent
      drm/amdgpu/jpeg2: re-emit unprocessed state on ring reset
      drm/amdgpu/jpeg2.5: re-emit unprocessed state on ring reset
      drm/amdgpu/jpeg3: re-emit unprocessed state on ring reset
      drm/amdgpu/jpeg4: re-emit unprocessed state on ring reset
      drm/amdgpu/jpeg4.0.3: re-emit unprocessed state on ring reset
      drm/amdgpu/jpeg4.0.5: add queue reset
      drm/amdgpu/jpeg5: add queue reset
      drm/amdgpu/jpeg5.0.1: re-emit unprocessed state on ring reset
      drm/amdgpu/vcn4: re-emit unprocessed state on ring reset
      drm/amdgpu/vcn4.0.3: re-emit unprocessed state on ring reset
      drm/amdgpu/vcn4.0.5: re-emit unprocessed state on ring reset
      drm/amdgpu/vcn5: re-emit unprocessed state on ring reset
      drm/amdgpu/vcn: add a helper framework for engine resets
      drm/amdgpu/vcn2: implement ring reset
      drm/amdgpu/vcn2.5: implement ring reset
      drm/amdgpu/vcn3: implement ring reset
      drm/amdgpu/jpeg: clean up reset type handling
      drm/amdgpu/gfx9: re-emit unprocessed state on kcq reset
      drm/amdgpu/gfx9.4.3: re-emit unprocessed state on kcq reset
      drm/amdgpu/gfx10: re-emit unprocessed state on ring reset
      drm/amdgpu/gfx11: re-emit unprocessed state on ring reset
      drm/amdgpu/gfx12: re-emit unprocessed state on ring reset
      drm/amdgpu/sdma5: re-emit unprocessed state on ring reset
      drm/amdgpu/sdma5.2: re-emit unprocessed state on ring reset
      drm/amdgpu/sdma6: re-emit unprocessed state on ring reset
      drm/amdgpu/sdma7: re-emit unprocessed state on ring reset
      drm/amdgpu: move reset support type checks into the caller

Alex Hung (4):
      drm/amd/display: Fix mpv playback corruption on weston
      drm/amd/display: Fix kernel docs for new struct members
      drm/amd/display: Check dce_hwseq before dereferencing it
      drm/amd/display: Initialize mode_select to 0

Alexander Usyskin (7):
      mtd: add driver for intel graphics non-volatile memory device
      mtd: intel-dg: implement region enumeration
      mtd: intel-dg: implement access functions
      mtd: intel-dg: register with mtd
      mtd: intel-dg: align 64bit read and write
      drm/xe/nvm: add on-die non-volatile memory device
      drm/xe/nvm: add support for access mode

Alexandre Courbot (23):
      rust: dma: fix doc-comment of dma_handle()
      rust: dma: expose the count and size of CoherentAllocation
      rust: dma: add dma_handle_with_offset method to CoherentAllocation
      rust: make ETIMEDOUT error available
      rust: sizes: add constants up to SZ_2G
      gpu: nova-core: use absolute paths in register!() macro
      gpu: nova-core: add delimiter for helper rules in register!() macro
      gpu: nova-core: expose the offset of each register as a type constant
      gpu: nova-core: allow register aliases
      gpu: nova-core: increase BAR0 size to 16MB
      gpu: nova-core: add helper function to wait on condition
      gpu: nova-core: wait for GFW_BOOT completion
      gpu: nova-core: add DMA object struct
      gpu: nova-core: register sysmem flush page
      gpu: nova-core: add falcon register definitions and base code
      gpu: nova-core: firmware: add ucode descriptor used by FWSEC-FRTS
      gpu: nova-core: compute layout of the FRTS region
      gpu: nova-core: add types for patching firmware binaries
      gpu: nova-core: extract FWSEC from BIOS and patch it to run FWSEC-FRT=
S
      gpu: nova-core: load and run FWSEC-FRTS
      gpu: nova-core: update and annotate TODO list
      gpu: nova-core: replace `Duration` with `Delta`
      gpu: nova-core: convert `/*` comments to `//`

Alice Ryhl (1):
      drm: rust: rename as_ref() to from_raw() for drm constructors

Alvin Lee (2):
      drm/amd/display: Re-order FAMS2 sub commands
      drm/amd/display: Removed unnecessary comment

Andrzej Kacprowski (1):
      accel/ivpu: Add turbo flag to the DRM_IVPU_CMDQ_CREATE ioctl

Andr=C3=A9 Almeida (13):
      drm: drm_auth: Convert mutex usage to guard(mutex)
      drm: amdgpu: Allow NULL pointers at amdgpu_vm_put_task_info()
      drm: amdgpu: Create amdgpu_vm_print_task_info()
      drm: Create a task info option for wedge events
      drm/doc: Add a section about "Task information" for the wedge API
      drm: amdgpu: Use struct drm_wedge_task_info inside of struct
amdgpu_task_info
      drm/amdgpu: Make use of drm_wedge_task_info
      drm/amd: Do not include <linux/export.h> when unused
      drm/amd: Include <linux/export.h> when needed
      drm/doc: Fix title underline for "Task information"
      drm: Add missing struct drm_wedge_task_info kernel doc
      drm/doc: Fix grammar for "Task information"
      drm/amdgpu: Fix lifetime of struct amdgpu_task_info after ring reset

Andy Shevchenko (3):
      accel/habanalabs: Switch to use %ptTs
      drm/panel: ili9341: Remove unused member from struct ili9341
      firmware: sysfb: Don't use "proxy" headers

Andy Yan (18):
      drm/rockchip: cleanup fb when drm_gem_fb_afbc_init failed
      drm/gem-framebuffer: log errors when gem size < afbc_size
      dt-bindings: display: panel: Make reset-gpio as optional for
Raydium RM67200
      drivers/panel: raydium-rm67200: Make reset-gpio optional
      drm/panel: raydium-rm67200: Move initialization from enable() to
prepare stage
      drm/panel: raydium-rm67200: Add missing drm_display_mode flags
      drm/rockchip: inno_hdmi: Merge register definition to c file
      drm/rockchip: inno_hdmi: Refactor register macros to make checkpatch =
happy
      drm/rockchip: inno_hdmi: Remove unnecessary parentheses to make
checkpatch happy
      drm/rockchip: inno_hdmi: Rename function inno_hdmi_reset to
inno_hdmi_init_hw
      drm/rockchip: inno_hdmi: Move ddc/i2c configuration and HOTPLUG
unmute to inno_hdmi_init_hw
      drm/rockchip: inno_hdmi: Use sleep_range instead of udelay
      drm/rockchip: inno_hdmi: switch i2c registration to devm functions
      drm/rockchip: inno_hdmi: Simpify clk get/enable by
devm_clk_get_enabled api
      drm/rockchip: vop2: Fix the update of LAYER/PORT select
registers when there are multi display output on rk3588/rk3568
      drm/bridge: Make dp/hdmi_audio_* callback keep the same paramter
order with get_modes
      drm/bridge: Pass down connector to drm bridge detect hook
      drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: Fix a compile error
due to bridge->detect parameter changes

Ankit Nautiyal (4):
      drm/i915/vrr: Program EMP_AS_SDP_TL for DP AS SDP
      drm/i915/snps_hdmi_pll: Fix 64-bit divisor truncation by using div64_=
u64
      drm/i915/snps_hdmi_pll: Use clamp() instead of max(min())
      drm/i915/display: Fix macro HAS_ULTRAJOINER

Anusha Srivatsa (90):
      panel/panel-elida-kd35t133: Use refcounted allocation in place
of devm_kzalloc()
      panel/feixin-k101-im2ba02: Use refcounted allocation in place of
devm_kzalloc()
      panel/fy07024di26a30d: Use refcounted allocation in place of
devm_kzalloc()
      panel/himax-hx83112a: Use refcounted allocation in place of devm_kzal=
loc()
      panel/himax-hx8394: Use refcounted allocation in place of devm_kzallo=
c()
      panel/ilitek-ili9322: Use refcounted allocation in place of devm_kzal=
loc()
      panel/ilitek-ili9341: Use refcounted allocation in place of devm_kzal=
loc()
      panel/panel-ili9805: Use refcounted allocation in place of devm_kzall=
oc()
      panel/ilitek-ili9806e: Use refcounted allocation in place of
devm_kzalloc()
      panel/ilitek-ili9881c: Use refcounted allocation in place of
devm_kzalloc()
      panel/innolux-ej030na: Use refcounted allocation in place of
devm_kzalloc()
      panel/innolux-p079zca: Use refcounted allocation in place of
devm_kzalloc()
      panel/jadard-jd9365da-h3: Use refcounted allocation in place of
devm_kzalloc()
      panel/jdi-fhd-r63452: Use refcounted allocation in place of devm_kzal=
loc()
      panel/ltk050h3146w: Use refcounted allocation in place of devm_kzallo=
c()
      panel/ltk500hd1829: Use refcounted allocation in place of devm_kzallo=
c()
      panel/lg-lg4573: Use refcounted allocation in place of devm_kzalloc()
      panel/lincolntech-lcd197: Use refcounted allocation in place of
devm_kzalloc()
      panel/magnachip-d53e6ea8966: Use refcounted allocation in place
of devm_kzalloc()
      panel/mantix-mlaf057we51: Use refcounted allocation in place of
devm_kzalloc()
      panel/newvision-nv3051d: Use refcounted allocation in place of
devm_kzalloc()
      panel/newvision-nv3052c: Use refcounted allocation in place of
devm_kzalloc()
      panel/novatek-nt35510: Use refcounted allocation in place of
devm_kzalloc()
      panel/novatek-nt35560: Use refcounted allocation in place of
devm_kzalloc()
      panel/novatek-nt35950: Use refcounted allocation in place of
devm_kzalloc()
      panel/novatek-nt36523: Use refcounted allocation in place of
devm_kzalloc()
      panel/novatek-nt36672e: Use refcounted allocation in place of
devm_kzalloc()
      panel/novatek-nt39016: Use refcounted allocation in place of
devm_kzalloc()
      panel/lcd-olinuxino: Use refcounted allocation in place of devm_kzall=
oc()
      panel/orisetech-ota5601a: Use refcounted allocation in place of
devm_kzalloc()
      panel/orisetech-otm8009a: Use refcounted allocation in place of
devm_kzalloc()
      panel/raydium-rm67191: Use refcounted allocation in place of
devm_kzalloc()
      panel/raydium-rm67200: Use refcounted allocation in place of
devm_kzalloc()
      panel/raydium-rm68200: Use refcounted allocation in place of
devm_kzalloc()
      panel/raydium-rm692e5: Use refcounted allocation in place of
devm_kzalloc()
      panel/raydium-rm69380: Use refcounted allocation in place of
devm_kzalloc()
      panel/ronbo-rb070d30: Use refcounted allocation in place of devm_kzal=
loc()
      panel/samsung-ams581vf01: Use refcounted allocation in place of
devm_kzalloc()
      panel/samsung-ams639rq08: Use refcounted allocation in place of
devm_kzalloc()
      panel/samsung-atna33xc20: Use refcounted allocation in place of
devm_kzalloc()
      panel/samsung-db7430: Use refcounted allocation in place of devm_kzal=
loc()
      panel/samsung-ld9040: Use refcounted allocation in place of devm_kzal=
loc()
      panel/samsung-s6d16d0: Use refcounted allocation in place of
devm_kzalloc()
      panel/samsung-s6d27a1: Use refcounted allocation in place of
devm_kzalloc()
      panel/samsung-s6d7aa0: Use refcounted allocation in place of
devm_kzalloc()
      panel/samsung-s6e3fa7: Use refcounted allocation in place of
devm_kzalloc()
      panel/samsung-s6e3ha2: Use refcounted allocation in place of
devm_kzalloc()
      panel/samsung-s6e3ha8: Use refcounted allocation in place of
devm_kzalloc()
      panel/samsung-s6e63j0x03: Use refcounted allocation in place of
devm_kzalloc()
      panel/s6e88a0-ams427ap24: Use refcounted allocation in place of
devm_kzalloc()
      panel/samsung-s6e8aa0: Use refcounted allocation in place of
devm_kzalloc()
      panel/samsung-sofef00: Use refcounted allocation in place of
devm_kzalloc()
      panel/seiko-43wvf1g: Use refcounted allocation in place of devm_kzall=
oc()
      panel/sharp-ls037v7dw01: Use refcounted allocation in place of
devm_kzalloc()
      panel/sharp-ls060t1sx01: Use refcounted allocation in place of
devm_kzalloc()
      panel/sitronix-st7701: Use refcounted allocation in place of
devm_kzalloc()
      panel/sitronix-st7703: Use refcounted allocation in place of
devm_kzalloc()
      panel/sitronix-st7789v: Use refcounted allocation in place of
devm_kzalloc()
      panel/sony-acx565akm: Use refcounted allocation in place of devm_kzal=
loc()
      panel/sony-td4353-jdi: Use refcounted allocation in place of
devm_kzalloc()
      panel/truly-nt35521: Use refcounted allocation in place of devm_kzall=
oc()
      panel/panel-summit: Use refcounted allocation in place of devm_kzallo=
c()
      panel/synaptics-r63353: allocation in place of devm_kzalloc()
      panel/tpo-td028ttec1: Use refcounted allocation in place of devm_kzal=
loc()
      panel/tpo-td043mtea1: Use refcounted allocation in place of devm_kzal=
loc()
      panel/tpo-tpg110: Use refcounted allocation in place of devm_kzalloc(=
)
      panel/visionox-r66451: Use refcounted allocation in place of
devm_kzalloc()
      panel/visionox-rm69299: Use refcounted allocation in place of
devm_kzalloc()
      panel/visionox-rm692e5.c: Use refcounted allocation in place of
devm_kzalloc()
      panel/visionox-vtdr6130: Use refcounted allocation in place of
devm_kzalloc()
      panel/widechips-ws2401: Use refcounted allocation in place of
devm_kzalloc()
      panel/xinpeng-xpp055c272: Use refcounted allocation in place of
devm_kzalloc()
      panel/s6e88a0-ams452ef01: Use refcounted allocation in place of
devm_kzalloc()
      panel/nec-nl8048hl11: Use refcounted allocation in place of devm_kzal=
loc()
      panel/panel-lvds: Use refcounted allocation in place of devm_kzalloc(=
)
      panel/lg-lb035q02: Use refcounted allocation in place of devm_kzalloc=
()
      drm/panel/lq101r1sx01: Use refcounted allocation in place of
devm_kzalloc()
      drm/panel/raspberrypi: Use refcounted allocation in place of
devm_kzalloc()
      drm/panel/vvx10f034n00: Use refcounted allocation in place of
devm_kzalloc()
      drm/panel/osd101t2587-53ts: Use refcounted allocation in place
of devm_kzalloc()
      drm/panel/novatek-nt36672a: Use refcounted allocation in place
of devm_kzalloc()
      drm/panel/lg-sw43408: Use refcounted allocation in place of devm_kzal=
loc()
      drm/panel/kd097d04: Use refcounted allocation in place of devm_kzallo=
c()
      drm/panel/khadas-ts050: Use refcounted allocation in place of
devm_kzalloc()
      drm/panel/jdi-lt070me05000: Use refcounted allocation in place
of devm_kzalloc()
      drm/panel/lpm102a188a: Use refcounted allocation in place of
devm_kzalloc()
      drm/panel/ilitek-ili9882t: Use refcounted allocation in place of
devm_kzalloc()
      drm/panel/himax-hx83102: Use refcounted allocation in place of
devm_kzalloc()
      drm/panel/boe-tv101wum-nl6: Use refcounted allocation in place
of devm_kzalloc()
      drm/panel/boe-himax8279d: Use refcounted allocation in place of
devm_kzalloc()

Aradhya Bhatia (11):
      drm/xe/xe2hpg: Add Wa_22021007897
      drm/xe/guc: Make creation of SLPC debugfs files conditional
      drm/xe: Default auto_link_downgrade status to false
      drm/atomic-helper: Refactor crtc & encoder-bridge op loops into
separate functions
      drm/atomic-helper: Separate out bridge pre_enable/post_disable
from enable/disable
      drm/atomic-helper: Re-order bridge chain pre-enable and post-disable
      drm/bridge: cdns-dsi: Use pre_enable/post_disable to enable/disable
      dt-bindings: display: ti,am65x-dss: Re-indent the example
      dt-bindings: display: ti: Add schema for AM625 OLDI Transmitter
      drm/tidss: Mark AM65x OLDI code separately
      drm/tidss: Add OLDI bridge support

Arnd Bergmann (5):
      drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency
      drm: omapdrm: reduce clang stack usage
      drm/i915/wm: reduce stack usage in skl_print_wm_changes()
      drm/i915: fix build error some more
      drm/i915: reduce stack usage in igt_vma_pin1()

Arthur Grillo (5):
      drm/vkms: Add YUV support
      drm/vkms: Add range and encoding properties to the plane
      drm/vkms: Drop YUV formats TODO
      drm/vkms: Create KUnit tests for YUV conversions
      drm/vkms: Add how to run the Kunit tests

Arun R Murthy (1):
      drm/i915/panel: register drm_panel and call prepare/unprepare for eDP

Arunpravin Paneer Selvam (1):
      drm/amdgpu: Add WARN_ON to the resource clear function

Asad Kamal (1):
      drm/amd/pm: Remove unnecessary variable

Asahi Lina (1):
      drm/shmem-helper: Add lockdep asserts to vmap/vunmap

Ashutosh Dixit (5):
      drm/xe/oa/uapi: Expose media OA units
      drm/xe/oa: Print hwe to OA unit mapping
      drm/xe/oa: Introduce stream->oa_unit
      drm/xe/oa: Assign hwe for OAM_SAG
      drm/xe/oa: Enable OAM latency measurement

Aurabindo Pillai (2):
      drm/amd/display: DML2.1 changes
      drm/amd/display: Initial support for SmartMux

Ausef Yousof (2):
      drm/amd/display: Don't disable dtb as dto src during dpms off
      drm/amd/display: Adjust dto fix coverage

Austin Zheng (4):
      drm/amd/display: DML21 Fixes
      drm/amd/display: Deprecate Loading Bounding Box From DMUB On DCN4
      drm/amd/display: Include EQU Prefetch Bandwidth For Bandwidth Calcula=
tions
      drm/amd/display: DML21 Reintegration

Balasubramani Vivekanandan (1):
      drm/xe/mocs: Initialize MOCS index early

Bartosz Golaszewski (2):
      drm/bridge: ti-sn65dsi86: use new GPIO line value setter callbacks
      drm/bridge: ti-sn65dsi86: remove unnecessary GPIO line direction chec=
k

Boris Brezillon (2):
      drm/panthor: Add missing explicit padding in drm_panthor_gpu_info
      drm/panthor: Fix the user MMIO offset logic for emulators

Brendan Steve Leder (1):
      drm/amd/display: Add custom segmentation support

Camille Cho (1):
      drm/amd/display: Support OLED SDR with AMD ABC

Casey Connolly (2):
      dt-bindings: display: visionox-rm69299: document new compatible strin=
g
      drm/panel: visionox-rm69299: support the variant found in the SHIFT6m=
q

Ce Sun (2):
      drm/amdgpu: Fix code style issue
      drm/amdgpu: The interrupt source was not released

Chaitanya Kumar Borah (8):
      drm/i915/dsb: add intel_dsb_gosub_finish()
      drm/i915/dsb: Add support for GOSUB interrupt
      drm/i915: s/dsb_color_vblank/dsb_color
      drm/i915/display: use GOSUB to program double buffered LUT registers
      drm/i915: Program DB LUT registers before vblank
      drm/i915/color: Do not pre-load LUTs with DB registers
      drm/i915: Disable updating of LUT values during vblank
      drm/xe/display: read PCON capability only when present

Chaoyi Chen (2):
      drm/rockchip: lvds: Convert to drm bridge
      drm/rockchip: cdn-dp: Convert to drm bridge

Charlene Liu (3):
      drm/amd/display: Add HW change required mpc gamut remap
      drm/amd/display: add APG struct to stream_enc for future use
      drm/amd/display: limit clear_update_flags to dcn32 and above

Chris Brandt (1):
      drm: renesas: rz-du: Add atomic_pre_enable

Chris Morgan (3):
      dt-bindings: vendor-prefixes: Add prefix for Huiling
      dt-bindings: display: himax-hx8394: Add Huiling hl055fhav028c
      drm/panel: himax-hx8394: Add Support for Huiling hl055fhav028c

Christian K=C3=B6nig (9):
      drm/ttm: revert "Export ttm_bo_get_unless_zero()"
      drm/ttm: make ttm_bo_get internal
      drm/prime: remove drm_prime_lookup_buf_by_handle
      Revert "drm/prime: remove drm_prime_lookup_buf_by_handle"
      drm/vmwgfx: drop printing the TTM refcount for debugging
      drm/amdgpu: rework queue reset scheduler interaction
      drm/ttm: fix locking in test ttm_bo_validate_no_placement_signaled
      drm/ttm: remove ttm_bo_validate_swapout test
      drm/amdgpu: rework gmc_v9_0_get_coherence_flags v2

Christophe JAILLET (1):
      drm/amdgpu: Fix missing unlocking in an error path in
amdgpu_userq_create()

Clayton King (1):
      drm/amd/display: Free memory allocation

Colin Ian King (1):
      drm/amd: Fix spelling mistake "correctalbe" -> "correctable"

Cristian Ciocaltea (23):
      drm/connector: hdmi: Evaluate limited range after computing format
      drm/connector: hdmi: Add support for YUV420 format verification
      drm/connector: hdmi: Improve debug message for supported format
      drm/connector: hdmi: Add missing bpc debug info to hdmi_try_format_bp=
c()
      drm/connector: hdmi: Factor out bpc and format computation logic
      drm/connector: hdmi: Use YUV420 output format as an RGB fallback
      drm/tests: hdmi: Replace '[_]MHz' with 'mhz'
      drm/tests: hdmi: Switch to 'void *' type for EDID data
      drm/tests: hdmi: Add macro to simplify EDID setup
      drm/tests: hdmi: Replace open coded EDID setup
      drm/tests: hdmi: Drop unused drm_kunit_helper_connector_hdmi_init_fun=
cs()
      drm/tests: hdmi: Setup ycbcr_420_allowed before initializing connecto=
r
      drm/tests: hdmi: Switch to drm_atomic_get_new_connector_state()
where possible
      drm/tests: hdmi: Provide EDID supporting 4K@30Hz with YUV420 only
      drm/tests: hdmi: Add limited range tests for YUV420 mode
      drm/tests: hdmi: Rename max TMDS rate fallback tests
      drm/tests: hdmi: Provide EDID supporting 4K@30Hz with RGB/YUV
      drm/tests: hdmi: Add max TMDS rate fallback tests for YUV420 mode
      drm/tests: hdmi: Add test for unsuccessful fallback to YUV420
      dt-bindings: display: vop2: Add optional PLL clock property for rk357=
6
      drm/display: hdmi-cec-helper: Fix adapter unregistration
      drm/bridge: Fix kdoc comment for DRM_BRIDGE_OP_HDMI_CEC_ADAPTER
      drm/bridge: adv7511: Fix DRM_BRIDGE_OP_HDMI_{AUDIO|CEC_ADAPTER} setup

Cruise Hung (3):
      drm/amd/display: Add DPIA debug option for zero allocation patch
      drm/amd/display: Add new DP tunnel bandwidth validation
      drm/amd/display: Remove unused tunnel BW validation

Dale Whinham (1):
      dt-bindings: display: panel: samsung,atna30dw01: document ATNA30DW01

Dan Carpenter (4):
      drm/nouveau/fifo: small cleanup in nvkm_chan_cctx_get()
      drm/i915/selftests: Change mock_request() to return error pointers
      drm/amdgpu: indent an if statement
      drm/dp: Clean up white space in drm_edp_backlight_probe_state()

Daniele Ceraolo Spurio (14):
      drm/xe/pxp: Use the correct define in the set_property_funcs array
      drm/xe/pxp: Clarify PXP queue creation behavior if PXP is not ready
      drm/xe/pxp: Decouple queue addition from PXP start
      drm/xe/uc: Prepare uc_fw_version for storing the VF ABI version
      drm/xe/vf: Boostrap all GTs immediately after MMIO init
      drm/xe/vf: Use uc_fw_version to store the negotiated GuC ABI
      drm/xe/vf: Store the GuC FW info in guc->fw
      drm/xe: Fix early wedge on GuC load failure
      drm/xe: Extend WA 14018094691 to BMG
      Revert "drm/xe/ptl: Apply Wa_16026007364"
      drm/xe/guc: Enable extended CAT error reporting
      drm/xe/guc: Enable the Dynamic Inhibit Context Switch optimization
      drm/xe/ptl: Add GuC FW definition for PTL
      drm/xe/ptl: Add HuC FW definition for PTL

Danilo Krummrich (4):
      Merge tag 'topic/dma-features-2025-06-23' of
https://github.com/Rust-for-Linux/linux.git
      gpu: nova-core: impl From for u32 for enums used from register!
      gpu: nova-core: consider `clippy::cast_lossless`
      MAINTAINERS: Add Alexandre Courbot as co-maintainer to nova-core

Dave Airlie (16):
      ttm/pool: allow debugfs dumps for numa pools.
      drm/ttm: handle undefined printf arg evaluation order in debugfs
      drm/xe: don't store the xe device pointer inside xe_ttm_tt
      Merge tag 'drm-misc-next-2025-06-12' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-xe-next-2025-06-18' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-misc-next-2025-06-19' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-intel-next-2025-06-18' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-misc-next-2025-06-26' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'amd-drm-next-6.17-2025-07-01' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-gt-next-2025-07-02' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-misc-next-2025-07-03' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-xe-next-2025-07-15' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-misc-next-2025-07-17' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'amd-drm-next-6.17-2025-07-17' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'nova-next-v6.17-2025-07-18' of
https://gitlab.freedesktop.org/drm/nova into drm-next
      Merge tag 'drm-misc-next-fixes-2025-07-24' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next

David Yat Sin (1):
      amdkfd: MTYPE_UC for ext-coherent system memory

Devarsh Thakkar (3):
      dt-bindings: display: ti,am65x-dss: Add support for AM62L DSS
      drm/tidss: Update infrastructure to support K3 DSS cut-down versions
      drm/tidss: Add support for AM62L display subsystem

Dibin Moolakadan Subrahmanian (1):
      drm/i915/display: Fix u32 overflow in SNPS PHY HDMI PLL setup

Diederik de Haas (1):
      dt-bindings: display: rockchip,dw-mipi-dsi: Drop address/size cells

Dillon Varone (3):
      drm/amd/display: Remove dml/dcn401 files and references
      drm/amd/display: Refactor DML2 DC power instance
      drm/amd/display: Refactor DSC cap calculations

Dmitry Baryshkov (60):
      drm/bridge: move private data to the end of the struct
      drm/bridge: allow limiting I2S formats
      drm/connector: add CEC-related fields
      drm/display: move CEC_CORE selection to DRM_DISPLAY_HELPER
      drm/display: add CEC helpers code
      drm/display: hdmi-state-helper: handle CEC physical address
      drm/display: bridge-connector: hook in CEC notifier support
      drm/display: bridge-connector: handle CEC adapters
      drm/bridge: adv7511: switch to the HDMI connector helpers
      drm/msm/dpu: stop passing mdss_ver to setup_timing_gen()
      drm/msm/dpu: drop INTF_SC7280_MASK
      drm/msm/dpu: inline _setup_ctl_ops()
      drm/msm/dpu: inline _setup_dsc_ops()
      drm/msm/dpu: inline _setup_dspp_ops()
      drm/msm/dpu: inline _setup_mixer_ops()
      drm/msm/dpu: remove DSPP_SC7180_MASK
      drm/msm/dpu: get rid of DPU_CTL_HAS_LAYER_EXT4
      drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
      drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
      drm/msm/dpu: get rid of DPU_CTL_DSPP_SUB_BLOCK_FLUSH
      drm/msm/dpu: get rid of DPU_CTL_VM_CFG
      drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
      drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
      drm/msm/dpu: get rid of DPU_INTF_INPUT_CTRL
      drm/msm/dpu: get rid of DPU_PINGPONG_DSC
      drm/msm/dpu: get rid of DPU_PINGPONG_DITHER
      drm/msm/dpu: get rid of DPU_MDP_VSYNC_SEL
      drm/msm/dpu: get rid of DPU_MDP_PERIPH_0_REMOVED
      drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
      drm/msm/dpu: get rid of DPU_MIXER_COMBINED_ALPHA
      drm/msm/dpu: get rid of DPU_DIM_LAYER
      drm/msm/dpu: get rid of DPU_DSC_HW_REV_1_2
      drm/msm/dpu: get rid of DPU_DSC_OUTPUT_CTRL
      drm/msm/dpu: get rid of DPU_WB_INPUT_CTRL
      drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
      drm/msm/dpu: drop unused MDP TOP features
      drm/msm/dpu: drop ununused PINGPONG features
      drm/msm/dpu: drop ununused MIXER features
      drm/msm/dpu: move features out of the DPU_HW_BLK_INFO
      drm/msm/dp: split MMSS_DP_DSC_DTO register write to a separate functi=
on
      drm/msm/dp: read hw revision only once
      drm/msm/dp: pull I/O data out of msm_dp_catalog_private()
      drm/msm/dp: move I/O functions to global header
      drm/msm/dp: move/inline AUX register functions
      drm/msm/dp: move/inline panel related functions
      drm/msm/dp: move/inline audio related functions
      drm/msm/dp: move/inline ctrl register functions
      drm/msm/dp: move more AUX functions to dp_aux.c
      drm/msm/dp: move interrupt handling to dp_ctrl
      drm/msm/dp: drop the msm_dp_catalog module
      drm/msm: move wq handling to KMS code
      drm/msm: move helper calls to msm_kms.c
      drm/msm/mdp4: get rid of mdp4_crtc.id
      drm/msm: get rid of msm_drm_private::num_crtcs
      drm/msm: move KMS driver data to msm_kms
      drm/msm: make it possible to disable KMS-related code.
      drm/msm: bail out late_init_minor() if it is not a GPU device
      drm/msm: rearrange symbol selection
      drm/msm: rework binding of Imageon GPUs
      drm/msm: enable separate binding of GPU and display devices

Dmytro Laktyushkin (1):
      drm/amd/display: Update tmz_surface type to match register

Dnyaneshwar Bhadane (3):
      drm/i915/xe3lpd: Extend DMC load path for display
      drm/i915/wcl: C10 phy connected to port A and B
      drm/i915/xe3lpd: Extend WA 16023981245 for display 30.02

Dominik Kaszewski (1):
      drm/amd/display: Workaround for stuck I2C arbitrage

Douglas Anderson (1):
      drm/panel-edp: Clarify the `prepare_to_enable` description in comment=
s

Dr. David Alan Gilbert (1):
      drm/xe: Remove unused functions

Duncan Ma (2):
      drm/amd/display: Notify display idle on D3
      drm/amd/display: Notify DMUB on HW Release

Eeli Haapalainen (1):
      drm/amdgpu/gfx8: reset compute ring wptr on the GPU on resume

Emily Deng (2):
      drm/ttm: Should to return the evict error
      drm/amdkfd: Move the process suspend and resume out of full access

Ernest Van Hoecke (1):
      drm/panel-edp: Add support for AUO G156HAN03.0 panel

Fangzhi Zuo (1):
      drm/amd/display: Rewording Mode Validation Result

Fedor Pchelkin (1):
      drm/amd/pm/powerplay/hwmgr/smu_helper: fix order of mask and value

Frank Min (3):
      drm/amdgpu: Add kicker device detection
      drm/amdgpu: add kicker fws loading for gfx11/smu13/psp13
      drm/amdgpu: reclaim psp fw reservation memory region

Fudongwang (1):
      drm/amd/display: Monitor patch to ignore EDID audio SAB check

Gareth Yu (1):
      drm/i915/dsi: Enforce pipeline flush with DSI HS transfer

Geert Uytterhoeven (1):
      drm/sitronix: Remove broken backwards-compatibility layer

Greg Kroah-Hartman (2):
      drm/vkms: convert to use faux_device
      drm/vgem/vgem_drv convert to use faux_device

Han Gao (1):
      drm/amdkfd: enable kfd on LoongArch systems

Hans de Goede (2):
      drm/i915/dsi: Fix NULL pointer deref in vlv_dphy_param_init()
      drm/i915/bios: Apply vlv_fixup_mipi_sequences() to v2 mipi-sequences =
too

Haoxiang Li (2):
      drm/i915/display: Add check for alloc_ordered_workqueue() and
alloc_workqueue()
      drm/xe/display: Add check for alloc_ordered_workqueue()

Harold Sun (1):
      drm/amd/display: Added case for when RR equals panel's max RR
using freesync

Harry Austen (1):
      drm/xe: Allow dropping kunit dependency as built-in

Hawking Zhang (8):
      drm/amdgpu: Convert select_sched into a common helper v3
      drm/amdgpu: Convert update_partition_sched_list into a common helper =
v3
      drm/amdgpu: Convert update_supported_modes into a common helper
      drm/amdgpu: Convert pre|post_partition_switch into common helpers
      drm/amdgpu: Move MAX_MEM_RANGES to amdgpu_gmc.h
      drm/amdgpu: Convert query_memory_partition into common helpers
      drm/amdgpu: Generalize is_multi_chiplet with a common helper v2
      drm/amdgpu: Convert init_mem_ranges into common helpers

Heikki Krogerus (3):
      i2c: designware: Use polling by default when there is no irq resource
      i2c: designware: Add quirk for Intel Xe
      drm/xe: Support for I2C attached MCUs

Heiko Stuebner (1):
      drm/rockchip: vop2: fail cleanly if missing a primary plane for
a video-port

Herbert Xu (1):
      dma-buf: Add forward declaration of struct seq_file in dma-fence.h

Himal Prasad Ghimiray (18):
      drm/gpusvm: Introduce devmem_only flag for allocation
      drm/xe: Introduce xe_vma_op_prefetch_range struct for prefetch of ran=
ges
      drm/xe: Make xe_svm_alloc_vram public
      drm/xe/svm: Helper to add tile masks to svm ranges
      drm/xe/svm: Make to_xe_range a public function
      drm/xe/svm: Make xe_svm_range_* end/start/size public
      drm/xe/vm: Update xe_vma_ops_incr_pt_update_ops to take an increment =
value
      drm/xe/vm: Add an identifier in xe_vma_ops for svm prefetch
      drm/xe: Rename lookup_vma function to xe_find_vma_by_addr
      drm/xe/svm: Refactor usage of drm_gpusvm* function in xe_svm
      drm/xe/svm: Make xe_svm_range_needs_migrate_to_vram() public
      drm/xe/svm: Add xe_svm_range_validate() and xe_svm_range_migrate_to_s=
mem()
      drm/gpusvm: Introduce drm_gpusvm_find_vma_start() function
      drm/xe/svm: Add xe_svm_find_vma_start() helper
      drm/xe/svm: Implement prefetch support for SVM ranges
      drm/xe/vm: Add debug prints for SVM range prefetch
      drm/xe/svm: Avoid duplicate eviction on get_pages() failure
      drm/xe/vm: Add a helper xe_vm_range_tilemask_tlb_invalidation()

Huan Yang (2):
      Revert "udmabuf: fix vmap_udmabuf error page set"
      udmabuf: fix vmap missed offset page

Hugo Villeneuve (1):
      drm: renesas: rz-du: Implement MIPI DSI host transfers

Ian Forbes (3):
      drm/vmwgfx: Update last_read_seqno under the fence lock
      drm/vmwgfx: Implement dma_fence_ops properly
      drm/vmwgfx: Fix Host-Backed userspace on Guest-Backed kernel

Ilya Bakoulin (3):
      drm/amd/display: Add num_slices_h to set_dto_dscclk signature
      drm/amd/display: Separate set_gsl from set_gsl_source_select
      drm/amd/display: Add definitions to support DID Type5 descriptors

Imre Deak (21):
      drm/i915/dp: Fix determining SST/MST mode during MTP TU state computa=
tion
      drm/i915/dp_mst: Use the correct connector while computing the
link BPP limit on MST
      drm/i915/dp_mst: Simplify handling the single-bpp case during
state computation
      drm/i915/dp_mst: Validate compressed bpp vs. platform restrictions
      drm/i915/dp_mst: Update the total link slot count early
      drm/i915/dp_mst: Check BW limit on the local MST link early
      drm/i915/dp_mst: Simplify computing the min/max compressed bpp limits
      drm/i915/dp: Limit max link bpp properly to a fractional value on SST
      drm/i915/dp_mst: Add support for fractional compressed link bpps on M=
ST
      drm/i915/display: Factor out intel_display_{min, max}_pipe_bpp()
      drm/i915/dp: Export intel_dp_dsc_min_src_compressed_bpp()
      drm/i915: Add support for forcing the link bpp on a connector
      drm/i915/dp_mst: Enable fractional link bpps on MST if the bpp is for=
ced
      drm/i915/ptl: Use everywhere the correct DDI port clock select mask
      drm/i915/dp_mst: Work around Thunderbolt sink disconnect after
SINK_COUNT_ESI read
      drm/i915/dp: Fix the enabling/disabling of audio SDP splitting
      drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS
      drm/edid: Define the quirks in an enum list
      drm/edid: Add support for quirks visible to DRM core and drivers
      drm/dp: Add an EDID quirk for the DPCD register access probe
      drm/i915/dp: Disable the AUX DPCD probe quirk if it's not required

Ivan Lipski (2):
      drm/amd/display: Add DPP & HUBP reset if power gate enabled on DCN314
      drm/amd/display: Revert "Add DPP & HUBP reset if power gate
enabled on DCN314"

Jacopo Mondi (1):
      drm/fourcc: Add RGB161616 and BGR161616 formats

Jani Nikula (89):
      drm/i915/irq: stop using HAS_GMCH()
      drm/i915: rename vlv_sideband*.[ch] to vlv_iosf_sb*.[ch]
      drm/i915: add generic read/write functions for VLV IOSF SB
      drm/i915: rewrite VLV IOSF SB unit specific read/write functions
      drm/i915: switch i915 core to generic VLV IOSF SB functions
      drm/i915: move VLV IOSF SB unit specific helpers under display
      drm/i915: convert VLV IOSF SB interface to struct drm_device
      drm/i915: rename VLV IOSF SB ports parameter to unit_mask
      drm/i915: ensure correct VLV IOSF SB units have been get/put
      drm/i915/pps: drop dependency on intel_display_conversion.h
      drm/i915/rps: pass struct intel_display to DISPLAY_VER()
      drm/i915/display: drop unused declarations from intel_display.h
      drm/i915/gem: drop intel_display.h include
      drm/i915/display: drop unnecessary includes on i915 core headers
      Merge drm/drm-next into drm-intel-next
      drm/xe/rpm: use to_xe_device() instead of container_of
      drm/xe/display: do not reference xe->display inline
      drm/i915: do not reference i915->display inline
      drm/{i915,xe}: convert i915 and xe display members into pointers
      drm/xe/display: drop duplicate display->fb_tracking.lock init
      drm/i915/display: move hotplug.dp_wq init from xe and i915 to display
      drm/xe/display: move xe->display initialization to xe_display_probe()
      drm/xe/display: add notes about how early a few functions can be call=
ed
      drm/xe/display: use xe->display to decide whether to do anything
      drm/panel: abstract of_panel_find()
      drm/i915/display: allocate struct intel_display dynamically
      drm/i915: stop including display/intel_display_{core, limits}.h
from i915_drv.h
      drm/xe: stop including intel_display_{core, device}.h from
xe_device_types.h
      drm/i915: drop intel_dpio_phy.h include from VLV IOSF SB
      drm/i915/sbi: move intel_sbi.[ch] under display/
      drm/i915/sbi: convert intel_sbi.[ch] to struct intel_display
      drm/i915/sbi: move sbi_lock under struct intel_display
      drm/i915/de: rename timeout parameters timeout_ms to highlight unit
      drm/i915: add out_value to intel_wait_for_register_fw() and
intel_de_wait_fw()
      drm/i915/sbi: convert to intel_de_*()
      drm/i915/sbi: split out intel_sbi_regs.h
      drm/i915/sbi: clean up SBI register macro definitions and usage
      drm/i915/bw: pass struct dram_info pointer around
      drm/i915/dram: add accessor for struct dram_info and use it
      drm/i915/wm: DG2 doesn't have dram info to look up wm_lv_0_adjust_nee=
ded
      drm/i915/dram: pass struct dram_info pointer around
      drm/i915/dram: add return value and handling to intel_dram_detect()
      drm/i915/dram: allocate struct dram_info dynamically
      Merge drm/drm-next into drm-intel-next
      drm/i915: split out display register macros to a separate file
      drm/panel: use fwnode based lookups for panel followers
      drm/i915/panel: add panel register/unregister
      drm/i915/panel: register drm_panel and call prepare/unprepare for ICL=
+ DSI
      drm/i915/panel: sync panel prepared state at register
      drm/i915/display: include intel_display_reg_defs.h from display regs =
files
      drm/i915/display: drop i915_reg.h include where possible
      drm/i915/vrr: fix register file style
      drm/i915/plane: rename intel_atomic_plane.[ch] to intel_plane.[ch]
      drm/i915/plane: drop atomic from intel_atomic_plane_check_clipping()
      drm/i915/plane: make intel_plane_atomic_check() static and rename
      drm/i915/plane: rename intel_atomic_check_planes() to
intel_plane_atomic_check()
      drm/i915/plane: rename intel_atomic_add_affected_planes() to
intel_plane_add_affected()
      Merge drm/drm-next into drm-intel-next
      drm/i915/panel: make panel funcs static
      drm/connector: move HDR sink metadata to display info
      drm/i915/pcode: drop fast wait from snb_pcode_write_timeout()
      drm/i915/pcode: add struct drm_device based interface
      drm/xe/pcode: add struct drm_device based interface
      drm/i915/display: switch to struct drm_device based pcode interface
      drm/i915/dram: switch to struct drm_device based pcode interface
      drm/xe/compat: remove old pcode compat interface
      drm/i915: remove unused DISPLAY_PLANE_FLIP_PENDING() macro
      drm/i915/wm: abstract intel_dbuf_pmdemand_needs_update()
      drm/i915/wm: add more accessors to dbuf state
      drm/i915/wm: make struct intel_dbuf_state opaque type
      drm/i915/bw: abstract intel_bw_pmdemand_needs_update()
      drm/i915/bw: relocate intel_can_enable_sagv() and rename to
intel_bw_can_enable_sagv()
      drm/i915: move icl_sagv_{pre, post}_plane_update() to intel_bw.c
      drm/i915/bw: abstract intel_bw_qgv_point_peakbw()
      drm/i915/bw: make struct intel_bw_state opaque
      drm/i915/cdclk: abstract intel_cdclk_logical()
      drm/i915/cdclk: abstract intel_cdclk_min_cdclk()
      drm/i915/cdclk: abstract intel_cdclk_bw_min_cdclk()
      drm/i915/cdclk: abstract intel_cdclk_pmdemand_needs_update()
      drm/i915/cdclk: abstract intel_cdclk_force_min_cdclk()
      drm/i915/cdclk: abstract intel_cdclk_read_hw()
      drm/i915/cdclk: abstract intel_cdclk_actual() and
intel_cdclk_actual_voltage_level()
      drm/i915/cdclk: make struct intel_cdclk_state opaque
      drm/i915/power: move enum skl_power_gate under display
      drm/i915/power: relocate {SKL,ICL}_PW_CTL_IDX_TO_PG()
      drm/i915/power: convert {SKL, ICL}_PW_CTL_IDX_TO_PG() macros to a fun=
ction
      drm/i915/fb: use struct intel_display for DISPLAY_VER()
      drm/i915/display: drop a number of dependencies on i915_drv.h
      drm/i915/power: use intel_de_wait_for_clear() instead of wait_for()

Janusz Krzysztofik (1):
      drm/i915/gt: Fix timeline left held on VMA alloc error

Jared Kangas (3):
      Documentation: dma-buf: heaps: Fix code markup
      dma-buf: heaps: Parameterize heap name in __add_cma_heap()
      dma-buf: heaps: Give default CMA heap a fixed name

Javier Martinez Canillas (6):
      MAINTAINERS: Add missing sysfb files to firmware framebuffers entry
      drm/sitronix/st7571-i2c: Fix encoder callbacks function names
      drm/sitronix/st7571-i2c: Log probe deferral cause for GPIO get failur=
e
      drm/sitronix/st7571-i2c: Add an indirection level to parse DT
      dt-bindings: display: Add Sitronix ST7567 LCD Controller
      drm/sitronix/st7571-i2c: Add support for the ST7567 Controller

Jay Cornwall (1):
      drm/amdkfd: Fix race in GWS queue scheduling

Jayesh Choudhary (1):
      drm/tidss: oldi: convert to devm_drm_bridge_alloc() API

Jeff Hugo (2):
      accel/qaic: Add Reliability, Accessibility, Serviceability (RAS)
      accel/qaic: Use dev_printk() in RAS

Jens Glathe (1):
      drm/panel-edp: add N160JCE-ELL CMN panel for Lenovo Thinkbook 16

Jernej Skrabec (7):
      drm: sun4i: de2/de3: add mixer version enum
      drm: sun4i: de2/de3: refactor mixer initialisation
      drm: sun4i: de2/de3: add generic blender register reference function
      drm: sun4i: de2/de3: use generic register reference function for
layer configuration
      drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
      drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
      drm: sun4i: de33: mixer: add mixer configuration for the H616

Jerome Brunet (1):
      drm/bridge: ti-sn65dsi86: use the auxiliary device

Jesse Zhang (6):
      drm/amdgpu: Fix SDMA engine reset with logical instance ID
      drm/amdgpu: Use logical instance ID for SDMA v4_4_2 queue operations
      drm/amdgpu: Add soft reset callback to SDMA v4.4.x
      drm/amdgpu: Fix SDMA UTC_L1 handling during start/stop sequences
      drm/amdgpu: Add user queue instance count in HW IP info
      drm/amdgpu: Replace HQD terminology with slots naming

Jesse.Zhang (1):
      drm/amdkfd: move SDMA queue reset capability check to node_show

Jessica Zhang (1):
      MAINTAINERS: Update my email address for DRM Panel reviews

Jesus Narvaez (2):
      drm/i915/guc: Check if expecting reply before decrementing
outstanding_submission_g2h
      drm/i915/guc: Handle race condition where wakeref count drops below 0

Jia Yao (1):
      drm/xe: Fix out-of-bounds field write in MI_STORE_DATA_IMM

Jingwen Zhu (1):
      drm/amd/display: Add disconnect case on dongle check

Jocelyn Falempe (13):
      MAINTAINERS: Add entries for drm_panic, drm_panic_qr_code and drm_log
      drm/panic: Add a private field to struct drm_scanout_buffer
      drm/i915/fbdev: Add intel_fbdev_get_map()
      drm/i915/display/i9xx: Add a disable_tiling() for i9xx planes
      drm/i915/display: Add a disable_tiling() for skl planes
      drm/ttm: Add ttm_bo_kmap_try_from_panic()
      drm/i915: Add intel_bo_alloc_framebuffer()
      drm/i915: Add intel_bo_panic_setup() and intel_bo_panic_finish()
      drm/i915/display: Add drm_panic support
      drm/i915/display: Add drm_panic support for Y-tiling with DPT
      drm/i915/display: Add drm_panic support for 4-tiling with DPT
      drm/i915/psr: Add intel_psr2_panic_force_full_update
      drm/ttm: Remove unneeded blank line in comment

Joel Fernandes (10):
      gpu: nova-core: vbios: Add base support for VBIOS construction
and iteration
      gpu: nova-core: vbios: Add support to look up PMU table in FWSEC
      gpu: nova-core: vbios: Add support for FWSEC ucode extraction
      gpu: nova-core: Add code comments related to devinit
      gpu: nova-core: Clarify sysmembar operations
      gpu: nova-core: Clarify falcon code
      Documentation: gpu: nova-core: Document vbios layout
      Documentation: gpu: nova-core: Document devinit process
      Documentation: gpu: nova-core: Document fwsec operation and layout
      Documentation: gpu: nova-core: Document basics of the Falcon

John Harrison (4):
      drm/xe/guc: Remove double blank line
      drm/xe/guc: Add missing H2G error code definitions
      drm/xe/guc: Rename CONFIG_XE_LARGE_GUC_BUFFER
      drm/xe/guc: Track FAST_REQ H2Gs to report where errors came from

Jonas Karlman (1):
      dt-bindings: gpu: mali-utgard: Add Rockchip RK3528 compatible

Jonathan Kim (1):
      drm/amdkfd: allow compute partition mode switch with cgroup exclusion=
s

Joonas Lahtinen (2):
      Revert "drm/i915/gem: Allow EXEC_CAPTURE on recoverable contexts on D=
G1"
      Merge drm/drm-next into drm-intel-gt-next

Jouni H=C3=B6gander (15):
      drm/i915/alpm: Make intel_alpm_enable_sink available for PSR
      drm/i915/alpm: Stop writing ALPM registers when PSR is enabled
      drm/i915/psr: Do not read PSR2_SU_STATUS on AlderLake and onwards
      drm/panelreplay: Panel Replay capability DPCD register definitions
      drm/dp: Add Panel Replay capability bits from DP2.1 specification
      drm/i915/psr: Read all Panel Replay capability registers from DPCD
      drm/i915/alpm: Add PR_ALPM_CTL register definitions
      drm/i915/alpm: Write PR_ALPM_CTL register
      drm/i915/psr: Add interface to check if AUXLess ALPM is needed by PSR
      drm/i915/alpm: Add new interface to check if AUXLess ALPM is used
      drm/i915/alpm: Move port alpm configuration
      drm/i915/display: Add PHY_CMN1_CONTROL register definitions
      drm/i915/display: Add function to configure LFPS sending
      drm/i915/psr: Fix using wrong mask in REG_FIELD_PREP
      drm/i915/psr: Do not disable Panel Replay in case VRR is enabled

Julia Filipchuk (2):
      drm/i915/guc: Enable DUAL_QUEUE_WA for newer platforms
      drm/xe/guc: Recommend GuC v70.46.2 for BMG, LNL, DG2

Junxiao Chang (1):
      drm/i915/gsc: mei interrupt top half should be in irq disabled contex=
t

Juston Li (2):
      gpu/trace: make TRACE_GPU_MEM configurable
      drm/xe/bo: add GPU memory trace points

Karol Wachowski (1):
      accel/ivpu: Add inference_timeout_ms module parameter

Karthi Kandasamy (3):
      drm/amd/display: prepare for new platform
      drm/amd/display: prepare for new platform
      drm/amd/display: Make dcn401_initialize_min_clocks() available
to other compilation units

Karthik Poosa (7):
      drm/xe/hwmon: Add support to manage power limits though mailbox
      drm/xe/hwmon: Move card reactive critical power under channel card
      drm/xe/hwmon: Add support to manage PL2 though mailbox
      drm/xe/hwmon: Expose powerX_cap_interval
      drm/xe/hwmon: Read energy status from PMT
      drm/xe/hwmon: Expose power sysfs entries based on firmware support
      drm/xe/hwmon: Fix xe_hwmon_power_max_write

Karunika Choo (2):
      drm/panthor: Add 64-bit and poll register accessors
      drm/panthor: Clean up 64-bit register definitions

Kenneth Feng (5):
      drm/amd/pm: override pcie dpm parameters only if it is necessary
      drm/amd/pm: update pcie dpm parameters before smu feature enablement
      drm/amd/pm: move the dpm table setting back after featureenablement
      drm/amd/pm: set pcie default dpm table when updating pcie dpm paramet=
ers
      drm/amd/pm: revise the pcie dpm parameters

Kent Russell (1):
      drm/amdgpu: Include sdma_4_4_4.bin

Konrad Dybcio (15):
      drm/msm/dpu: Fill in min_prefill_lines for SC8180X
      soc: qcom: Add UBWC config provider
      drm/msm: Offset MDSS HBB value by 13
      drm/msm: Use the central UBWC config database
      drm/msm/a6xx: Get a handle to the common UBWC config
      drm/msm/a6xx: Resolve the meaning of AMSBC
      drm/msm/a6xx: Simplify uavflagprd_inv detection
      drm/msm/a6xx: Resolve the meaning of UBWC_MODE
      drm/msm/a6xx: Replace '2' with BIT(1) in level2_swizzling_dis calc
      drm/msm/a6xx: Resolve the meaning of rgb565_predicator
      drm/msm/a6xx: Simplify min_acc_len calculation
      soc: qcom: ubwc: Fix SM6125's ubwc_swizzle value
      soc: qcom: ubwc: Add #defines for UBWC swizzle bits
      soc: qcom: ubwc: Fill in UBWC swizzle cfg for platforms that lack one
      drm/msm/adreno: Switch to the common UBWC config struct

Krzysztof Karas (2):
      drm/i915: Move out engine related macros from i915_drv.h
      drm/i915: move GEM_QUIRK_PIN_SWIZZLED_PAGES to i915_gem.h

Krzysztof Kozlowski (13):
      dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
      dt-bindings: display/msm: dsi-controller-main: Add SM8750
      dt-bindings: display/msm: dp-controller: Add SM8750
      dt-bindings: display/msm: qcom,sm8650-dpu: Add SM8750
      dt-bindings: display/msm: qcom,sm8750-mdss: Add SM8750
      drm/msm/dsi/phy: Add support for SM8750
      drm/msm/dsi: Add support for SM8750
      drm/msm/dpu: Add support for SM8750
      drm/msm/dpu: Consistently use u32 instead of uint32_t
      drm/msm/dpu: Implement 10-bit color alpha for v12.0 DPU
      drm/msm/dpu: Implement CTL_PIPE_ACTIVE for v12.0 DPU
      drm/msm/dpu: Implement LM crossbar for v12.0 DPU
      drm/msm/mdss: Add support for SM8750

Lad Prabhakar (11):
      dt-bindings: display: renesas,rzg2l-du: Add support for RZ/V2H(P) SoC
      drm: renesas: rz-du: Add support for RZ/V2H(P) SoC
      drm: renesas: rz-du: mipi_dsi: Add min check for VCLK range
      drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ calculation
      drm: renesas: rz-du: mipi_dsi: Use VCLK for HSFREQ calculation
      drm: renesas: rz-du: mipi_dsi: Add OF data support
      drm: renesas: rz-du: mipi_dsi: Make "rst" reset control optional
for RZ/V2H(P)
      drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY frequency calculatio=
ns
      drm: renesas: rz-du: mipi_dsi: Add feature flag for 16BPP support
      drm: renesas: rz-du: mipi_dsi: Add dphy_late_init() callback for RZ/V=
2H(P)
      drm: renesas: rz-du: mipi_dsi: Add function pointers for
configuring VCLK and mode validation

Langyan Ye (2):
      drm/panel-edp: Add KDC KD116N3730A05
      drm/panel-edp: Add CMN N116BCJ-EAK

Leo Chen (3):
      drm/amd/display: Adding missing driver code for IPSv2.0
      drm/amd/display: Add static pg implementations for future use
      drm/amd/display: New Behavior for debug option disable_ips_in_vpb

Lijo Lazar (25):
      drm/amdgpu: Check pcie replays reporting support
      drm/amdgpu: Remove nbiov7.9 replay count reporting
      drm/amdgpu: Clear reset flags from ras context
      drm/amd/pm: Show default gfx clock levels
      drm/amdgpu: Suspend IH during mode-2 reset
      drm/amd/pm: Use pointer type for typecheck()
      drm/amdgpu: Release reset locks during failures
      drm/amd/pm: Update SMU v13.0.12 pmfw header
      drm/amd/pm: Report pldm version and board voltage
      drm/amdgpu: Extend bus status check to more cases
      drm/amdgpu: Deprecate xgmi_link_speed enum
      drm/amdgpu: Add xgmi API to set max speed/width
      drm/amd/pm: Fetch SMUv13.0.6 xgmi max speed/width
      drm/amdgpu: Add more checks to PSP mailbox
      drm/amd/pm: Fetch SMUv13.0.12 xgmi max speed/width
      drm/amdgpu: Convert from DRM_* to dev_*
      drm/amdgpu: Fix error with dev_info_once usage
      drm/amdgpu: Pass adev pointer to functions
      drm/amdgpu: Add a noverbose flag to psp_wait_for
      drm/amdkfd: Avoid queue reset if disabled
      drm/amdgpu: Use cached partition mode, if valid
      drm/amd/pm: Get max/min frequency on aldebaran VF
      drm/amdgpu: Increase reset counter only on success
      drm/amd/pm: Use cached data for min/max clocks
      drm/amd/pm: Use cached metrics data on SMUv13.0.6

Likun Gao (2):
      drm/amdgpu: make ip map init to common function
      drm/amdgpu: use common function to map ip for aqua_vanjaram

Lin.Cao (1):
      drm/amdgpu: Fix memory leak in amdgpu_ctx_mgr_entity_fini

Liu Ying (13):
      dt-bindings: display: imx: Add i.MX8qxp Display Controller
processing units
      dt-bindings: display: imx: Add i.MX8qxp Display Controller blit engin=
e
      dt-bindings: display: imx: Add i.MX8qxp Display Controller display en=
gine
      dt-bindings: display: imx: Add i.MX8qxp Display Controller pixel engi=
ne
      dt-bindings: display: imx: Add i.MX8qxp Display Controller AXI
performance counter
      dt-bindings: display: imx: Add i.MX8qxp Display Controller
command sequencer
      dt-bindings: interrupt-controller: Add i.MX8qxp Display
Controller interrupt controller
      dt-bindings: display: imx: Add i.MX8qxp Display Controller
      drm/imx: Add i.MX8qxp Display Controller display engine
      drm/imx: Add i.MX8qxp Display Controller pixel engine
      drm/imx: Add i.MX8qxp Display Controller interrupt controller
      drm/imx: Add i.MX8qxp Display Controller KMS
      MAINTAINERS: Add maintainer for i.MX8qxp Display Controller

Lizhi Hou (1):
      accel/amdxdna: Revise device bo creation and free

Louis Chauvet (3):
      drm/vkms: Document pixel_argb_u16
      drm: Export symbols to use in tests
      drm/vkms: Add support for DRM_FORMAT_R*

Louis-Alexis Eyraud (5):
      dt-bindings: gpu: mali-bifrost: Add compatible for MT8370 SoC
      drm/panfrost: Drop duplicated Mediatek supplies arrays
      drm/panfrost: Commonize Mediatek power domain array definitions
      drm/panfrost: Add support for Mali on the MT8370 SoC
      arm64: dts: mediatek: mt8370: Enable gpu support

Luca Ceresoli (31):
      drm/bridge: anx7625: convert to devm_drm_bridge_alloc() API
      drm/bridge: cdns-dsi: convert to devm_drm_bridge_alloc() API
      drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: convert to
devm_drm_bridge_alloc() API
      drm/bridge: nxp-ptn3460: convert to devm_drm_bridge_alloc() API
      drm/bridge: sii902x: convert to devm_drm_bridge_alloc() API
      drm/omap: dss: dpi: convert to devm_drm_bridge_alloc() API
      drm/omap: dss: dsi: convert to devm_drm_bridge_alloc() API
      drm/omap: dss: hdmi4: convert to devm_drm_bridge_alloc() API
      drm/omap: dss: hdmi5: convert to devm_drm_bridge_alloc() API
      drm/omap: dss: sdi: convert to devm_drm_bridge_alloc() API
      drm/omap: dss: venc: convert to devm_drm_bridge_alloc() API
      drm/rcar-du: dsi: convert to devm_drm_bridge_alloc() API
      drm/bridge: stm_lvds: convert to devm_drm_bridge_alloc() API
      drm/sti: dvo: convert to devm_drm_bridge_alloc() API
      drm: zynqmp_dp: convert to devm_drm_bridge_alloc() API
      drm/bridge: add devm_drm_put_bridge()
      drm/bridge: panel: convert to devm_drm_bridge_alloc() API
      drm/bridge: fix build with CONFIG_OF=3Dn
      drm: convert many bridge drivers from devm_kzalloc() to
devm_drm_bridge_alloc() API
      drm/todo: add entry to remove devm_drm_put_bridge()
      drm/bridge: imx8qxp-pixel-combiner: convert to devm_drm_bridge_alloc(=
) API
      drm/tests: bridge: convert to devm_drm_bridge_alloc() API
      drm/bridge: add a .destroy func
      drm/tests: bridge: add KUnit tests for devm_drm_bridge_alloc()
      drm/bridge: tc358767: convert to devm_drm_bridge_alloc() API
      drm/bridge: get/put the bridge reference in drm_bridge_add/remove()
      drm/bridge: get/put the bridge reference in drm_bridge_attach/detach(=
)
      drm/bridge: add warning for bridges not using devm_drm_bridge_alloc()
      drm/bridge: tc358767: fix uninitialized variable regression
      drm/sti: hdmi: convert to devm_drm_bridge_alloc() API
      drm/sti: hda: convert to devm_drm_bridge_alloc() API

Luca Coelho (4):
      drm/i915/dkl: return if tc_port is invalid in dkl_phy_set_hip_idx()
      drm/i915: remove unused arg in skl_scaler_get_filter_select()
      drm/i915: use drm_modeset_lock_assert_held() in intel_connector_get_p=
ipe()
      drm/i915/display: move unordered works to new private workqueue

Luca Weiss (3):
      dt-bindings: vendor-prefixes: document Shenzhen DJN Optronics Technol=
ogy
      dt-bindings: display: panel: Add Himax HX83112B
      drm/panel: Add driver for DJN HX83112B LCD panel

Lucas De Marchi (28):
      drm/xe/guc_submit: Simplify and fix diff calculation
      drm/xe: Fix NPD when saving default context
      drm/xe/hwmon: Simplify and fix 32b wrap
      drm/xe/configfs: Drop trailing semicolons
      drm/xe: Convert "fused off" messages to be gt-based
      drm/xe: Allow to disable engines
      drm/xe/configfs: Add attribute to disable engines
      drm/xe/configfs: Add internal API to documentation
      drm/ttm: Fix build with CONFIG_DEBUG_FS=3Dn
      drm/xe/lrc: Use a temporary buffer for WA BB
      drm/xe/lrc: Prepare WA BB setup for more users
      drm/xe: Fix kconfig prompt
      drm/xe/guc: Default log level to non-verbose
      drm/xe: Annotate default for guc_log_level param
      drm/xe: Fix memset on iomem
      drm/xe/guc_pc: Add _locked variant for min/max freq
      drm/xe/xe_guc_pc: Lock once to update stashed frequencies
      drm/xe: Split xe_device_td_flush()
      drm/xe: Fix conflicting intel_pcode_* symbols
      drm/xe/migrate: Fix alignment check
      drm/xe: Normalize default param values
      drm/xe: Fix missing kernel-doc
      drm/xe/lrc: Reduce scope of empty lrc data
      drm/xe: Count dwords before allocating
      drm/xe/gt: Extract emit_job_sync()
      drm/xe/lrc: Remove leftover TODO/FIXME
      drm/xe/gt: Drop third submission for default context
      drm/xe/lrc: Add table with LRC layout

Maarten Lankhorst (26):
      drm/xe/svm: Fix regression disallowing 64K SVM migration
      drm/xe: Remove IOSF_MBI select.
      drm/xe: Use xe_ggtt_map_bo_unlocked for resume
      drm/xe: Add xe_ggtt_might_lock
      drm/xe: Add xe_ggtt_alloc
      drm/xe/display: Remove dereferences of ggtt for tile id
      drm/xe/ggtt: Seperate flags and address in PTE encoding
      drm/xe/display: Dont poke into GGTT internals to fill a DPT
      drm/xe/display: Convert GGTT mapping to use pte_encode_flags
      drm/xe: Remove pte_encode_bo callback
      drm/xe: Implement a helper for reading out a GGTT PTE at a
specified offset
      drm/xe: Do not rely on GGTT internals in xe_guc_buf kunit tests
      drm/xe: Move DSB l2 flush to a more sensible place
      drm/xe: Defer memirq init until needed
      drm/xe/sriov: Move VF bootstrap and query_config to vf_guc_init
      drm/xe: Simplify GuC early initialization
      drm/xe: Make it possible to read instance0 MCR registers after
xe_gt_mcr_init_early
      drm/xe: Only dump PAT when xe_hw_engines_init_early fails
      drm/xe: Rename gt_init sub-functions
      drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early
      drm/xe: Move xe_ttm_sys_mgr_init() downwards.
      drm/xe: Remove xe_uc_init_hwconfig()
      drm/xe: Remove xe_uc_fini_hw
      drm/xe: Rename xe_uc_init_hw to xe_uc_load_hw
      drm/xe: Fix typo in Kconfig
      Merge remote-tracking branch 'drm/drm-next' into drm-misc-next

Maciej Falkowski (1):
      accel/ivpu: Add initial Wildcat Lake support

Maciej Patelczyk (1):
      drm/xe: remove unmatched xe_vm_unlock() from __xe_exec_queue_init()

Marek Szyprowski (1):
      drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API

Marek Vasut (3):
      dt-bindings: ili9881c: Document 7" Raspberry Pi 720x1280
      drm/panel: ilitek-ili9881c: Allow configuration of the number of lane=
s
      drm/panel: ilitek-ili9881c: Add configuration for 7" Raspberry Pi 720=
x1280

Mario Limonciello (19):
      drm/amd/display: Drop unnecessary `amdgpu` prefix
      drm/amd/display: Only read ACPI backlight caps once
      drm/amd/display: Export full brightness range to userspace
      drm/amd: Add support for a complete pmops action
      drm/amd/display: Stop storing failures into adev->dm.cached_state
      drm/amd/display: Destroy cached state in complete() callback
      drm/amd: Allow printing VanGogh OD SCLK levels without setting
dpm to manual
      drm/amd: Allow printing Renoir OD SCLK levels without setting
dpm to manual
      drm/amd/display: Use scaling for non-native resolutions on eDP
      drm/amd/display: Disable common modes for eDP
      drm/amd: Adjust output for discovery error handling
      drm/amd: Add missing kdoc for amd_ip_funcs `complete` callback
      drm/amd/display: Fix AMDGPU_MAX_BL_LEVEL value
      drm/amd/display: Add a trace event for brightness programming
      drm/amd/display: Don't allow OLED to go down to fully off
      drm/amd: Decrease message level for legacy-pm, kv-dpm and si-dpm
      drm/amd: Change legacy-dpm DRM_*() macros to drm_*()
      drm/amd: Change kv-dpm DRM_*() macros to drm_*()
      PM: hibernate: Add stub for pm_hibernate_is_recovering()

Matt Atwood (10):
      drm/xe/ptl: Update the PTL pci id table
      drm/i915/xe3lpd: Update bandwidth parameters for display version 30.0=
2
      drm/i915: Set max cdclk for display 30.02
      drm/xe/ptl: Drop force_probe requirement
      drm/xe: prepare xe_gen_wa_oob to be multi-use
      drm/xe: add xe_device_wa infrastructure
      drm/xe: add new type to RTP context
      drm/xe: Add infrastructure for Device OOB workarounds
      drm/xe: Move Wa_15015404425 to use the new XE_DEVICE_WA macro
      drm/xe: extend Wa_15015404425 to apply to PTL

Matt Roper (13):
      drm/xe: GSM size should be constant on most platforms
      drm/xe/pat: Determine ATS / PTA programming during early sw init
      drm/xe/pat: Consolidate PAT programming logic for pre-Xe2 and post-Xe=
2
      drm/i915/xe3lpd: Add support for display version 30.02
      drm/xe/xe3: Add support for graphics IP version 30.03
      drm/xe/xe3: Add support for media IP version 30.02
      drm/xe: Add Wildcat Lake device IDs to PTL list
      drm/xe: Export xe_step_name for kunit tests
      drm/xe: Track maximum GTs per tile on a per-platform basis
      drm/xe/tests/pci: Ensure all platforms have a valid GT/tile count
      drm/xe: Assign GT IDs properly on multi-tile + multi-GT platforms
      drm/xe: Don't compare GT ID to GT count when determining valid GTs
      drm/xe/xe_query: Use separate iterator while filling GT list

Matthew Auld (8):
      drm/xe/bo: optimise CCS case for WB pages
      drm/xe/vm: move rebind_work init earlier
      drm/xe/vm: move xe_svm_init() earlier
      drm/xe/sched: stop re-submitting signalled jobs
      drm/xe/guc_submit: add back fix
      drm/xe: move DPT l2 flush to a more sensible place
      drm/xe/bmg: fix compressed VRAM handling
      drm/xe/migrate: fix copy direction in access_memory

Matthew Brost (22):
      drm/xe: Strict migration policy for atomic SVM faults
      drm/gpusvm: Add timeslicing support to GPU SVM
      drm/xe: Timeslice GPU on atomic SVM fault
      drm/xe: Add atomic_svm_timeslice_ms debugfs entry
      drm/xe: Do not warn on SVM migration failing because of 64k requireme=
nts
      drm/xe: Make VMA tile_present, tile_invalidated access rules clear
      drm/xe: Reorder 'Get pages failed' message
      drm/xe: Don't use drm exec locking in SVM pagefaults
      drm/xe: Use WRITE_ONCE for range->tile_invalidated update
      drm/xe: Make WA BB part of LRC BO
      drm/xe: Do not kill VM in PT code on -ENODATA
      drm/xe: Move LRC_ENGINE_ID_PPHWSP_OFFSET outside of parallel offset
      drm/xe: Add xe_vm_has_valid_gpu_mapping helper
      drm/xe: Opportunistically skip TLB invalidaion on unbind
      drm/xe: Do not wedge device on killed exec queues
      drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap
      drm/xe: Drop bo->size
      drm: Simplify drmm_alloc_ordered_workqueue return
      drm/xe: Allocate PF queue size on pow2 boundary
      Revert "drm/xe/xe2: Enable Indirect Ring State support for Xe2"
      drm/xe: Move page fault init after topology init
      drm/xe: Remove references to CONFIG_DRM_XE_DEVMEM_MIRROR

Maxim Schwalm (1):
      drm: panel: Add support for Renesas R69328 based MIPI DSI panel

Maxime Ripard (4):
      Merge drm-next-2025-05-28 into drm-misc-next
      drm/tests: edid: Fix monitor range limits
      drm/tests: edid: Update CTA-861 HDMI Vendor Specific Data Block
      drm/tests: edid: Add edid-decode --check output

Ma=C3=ADra Canal (9):
      drm/vkms: Compile all tests with CONFIG_DRM_VKMS_KUNIT_TEST
      drm/sched: Rename DRM_GPU_SCHED_STAT_NOMINAL to DRM_GPU_SCHED_STAT_RE=
SET
      drm/sched: Allow drivers to skip the reset and keep on running
      drm/sched: Make timeout KUnit tests faster
      drm/sched: Add new test for DRM_GPU_SCHED_STAT_NO_HANG
      drm/v3d: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset
      drm/etnaviv: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset
      drm/xe: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset
      drm/panfrost: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset

Melissa Wen (1):
      drm/amd/display: Disable CRTC degamma LUT for DCN401

Michael Strauss (3):
      drm/amd/display: Get LTTPR IEEE OUI/Device ID From Closest LTTPR To H=
ost
      drm/amd/display: Fix Link Override Sequencing When Switching
Between DIO/HPO
      drm/amd/display: Fix FIXED_VS retimer clock gen source override

Michael Walle (3):
      dt-bindings: display: simple: add AUO P238HAN01 panel
      drm/panel-simple: add AUO P238HAN01 panel entry
      drm/tidss: encoder: convert to devm_drm_bridge_alloc()

Michal Wajdeczko (40):
      drm/xe/guc: Unblock GuC buffer cache for all modes
      drm/xe/guc: Don't allocate managed BO for each policy change
      drm/xe: Allow to trigger GT resets using debugfs writes
      drm/xe: Convert page fault messages to be GT-oriented
      drm/xe: Use GT-oriented printer to dump topology on init
      drm/xe/guc: Resend potentially lost H2G MMIO request
      drm/xe/vf: Introduce helpers to access GGTT configuration
      drm/xe/vf: Move tile-related VF functions to separate file
      drm/xe/vf: Add sanity check for GGTT configuration
      drm/xe/topology: Simplify code for loading DSS mask
      drm/xe/topology: Use register array size instead magic number
      drm/xe/topology: Stop trying to fix programming mistakes
      drm/xe/uc: Use GT-oriented firmware messages
      drm/xe/tests: Drop unused xe_device_fn typedef
      drm/xe/tests: Convert xe_pci tests to parametrized tests
      drm/xe: Process deferred GGTT node removals on device unwind
      drm/xe/guc: Explicitly exit CT safe mode on unwind
      drm/xe/hw_engine_group: Fix potential leak
      drm/xe/pf: Clear all LMTT pages on alloc
      drm/xe/pf: Print runtime registers using debug printer
      drm/xe/pf: Print configuration KLVs using debug printer
      drm/xe/guc: Don't allocate temporary policies object
      drm/xe/bmg: Don't use WA 16023588340 and 22019338487 on VF
      drm/xe/guc: Rename CT state change helper
      drm/xe/guc: Move state change logger to helper
      drm/xe/guc: Cancel ongoing H2G requests when stopping CT
      drm/xe/sriov: Mark BMG as SR-IOV capable
      drm/xe: Combine PF and VF device data into union
      drm/xe: Move PF and VF device types to separate headers
      drm/xe: Introduce xe_tile_is_root helper
      drm/xe: Introduce xe_gt_is_main_type helper
      drm/xe/pf: Expose basic info about VFs in debugfs
      drm/xe/pf: Stop requiring VF/PF version negotiation on every GT
      drm/xe/vf: Store negotiated VF/PF ABI version at device level
      drm/xe/pf: Prepare to stop SR-IOV support prior GT reset
      drm/xe/pf: Resend PF provisioning after GT reset
      drm/xe/pf: Move GGTT config KLVs encoding to helper
      drm/xe/pf: Force GuC virtualization mode
      drm/xe/pf: Invalidate LMTT during LMEM unprovisioning
      drm/xe/pf: Invalidate LMTT after completing changes

Mikolaj Wasiak (1):
      drm/i915/selftest: allow larger memory allocation

Muhammad Ahmed (1):
      drm/amd/display: Add option to disable PHY SSC reduction on
transmitter enable

Navid Assadian (1):
      drm/amd/display: Do not bypass chroma scaling in 1:1 case

Neil Armstrong (3):
      drm/panel: visionox-rm69299: add plumbing to support panel variants
      drm/panel: visionox-rm69299: switch to _multi variants
      drm/panel: visionox-rm69299: switch to devm_regulator_bulk_get_const(=
)

Nemesa Garg (1):
      drm/i915/display: Implement wa_16011342517

Nicholas Kazlauskas (3):
      drm/amd/display: Update DMCUB loading sequence for DCN3.5
      drm/amd/display: Add more checks for DSC / HUBP ONO guarantees
      drm/amd/display: Add pwait status to DMCUB diagnostics

Niranjana Vishwanathapura (1):
      drm/xe: Create LRC BO without VM

Nitin Gote (1):
      drm/xe/xe3: Disable null query for anyhit shader

Oleh Kuzhylnyi (2):
      drm/amd/display: Indirect buffer transport for FAMS2 commands
      drm/amd/display: Add DML path for FAMS methods

Ostrowski Rafal (1):
      drm/amd/display: LSDMA support

Ovidiu Bunea (3):
      drm/amd/display: Add DMUB IPS command support for IPS residency tools
      drm/amd/display: Add support for Panel Replay on DP1 eDP (panel_inst=
=3D1)
      drm/amd/display: Add HPO encoder support to Replay

Patrick Lerda (3):
      drm/radeon/evergreen_cs: implement cond_exec and cond_write
      drm/radeon/evergreen_cs: lower
evergreen_surface_check_linear_aligned restriction
      drm/radeon: bump version to 2.51.0

Peichen Huang (3):
      drm/amd/display: Remove dpia debug bits
      drm/amd/display: Add dc cap for dp tunneling
      drm/amd/display: add null check

Philip Yang (1):
      drm/amdkfd: Don't call mmput from MMU notifier callback

Philipp Stanner (16):
      drm/sched: Fix outdated comments referencing thread
      drm/sched: Remove kthread header
      drm/vmwgfx: Use non-hybrid PCI devres API
      drm/nouveau: nouveau_fence: Standardize list iterations
      drm/nouveau: Simplify calls to nvif_event_block()
      drm/nouveau: Simplify nouveau_fence_done()
      drm/nouveau: Check dma_fence in canonical way
      drm/sched/tests: Use one lock for fence context
      drm/sched/tests: Make timedout_job callback a better role model
      drm/sched: Avoid memory leaks with cancel_job() callback
      drm/sched/tests: Implement cancel_job() callback
      drm/sched/tests: Add unit test for cancel_job()
      drm/sched: Warn if pending_list is not empty
      drm/nouveau: Make fence container helper usable driver-wide
      drm/nouveau: Add new callback for scheduler teardown
      drm/nouveau: Remove waitque for sched teardown

Philipp Zabel (6):
      drm/bridge: samsung-dsim: use while loop in samsung_dsim_transfer_sta=
rt
      drm/bridge: samsung-dsim: Use HZ_PER_MHZ macro from units.h
      drm/bridge: samsung-dsim: Always flush display FIFO on vsync pulse
      drm/panel: samsung-s6d7aa0: Drop MIPI_DSI_MODE_VSYNC_FLUSH flag
      drm/panel: samsung-s6e8aa0: Drop MIPI_DSI_MODE_VSYNC_FLUSH flag
      drm/mipi-dsi: Drop MIPI_DSI_MODE_VSYNC_FLUSH flag

Pierre-Eric Pelloux-Prayer (10):
      drm/debugfs: Output client_id in in drm_clients_info
      drm/sched: Store the drm client_id in drm_sched_fence
      drm/sched: Add device name to the drm_sched_process_job event
      drm/sched: Cleanup gpu_scheduler trace events
      drm/sched: Trace dependencies for GPU jobs
      drm/sched: Add the drm_client_id to the drm_sched_run/exec_job events
      drm/sched: Cleanup event names
      drm: Get rid of drm_sched_job.id
      drm/doc: Document some tracepoints as uAPI
      drm/amdgpu: update trace format to match gpu_scheduler_trace

Piotr Pi=C3=B3rkowski (1):
      drm/xe/pf: Don't allow LMEM provisioning if LMTT isn't available
on the device

Pratap Nirujogi (6):
      drm/amd/pm: Add support to set ISP Power
      drm/amd/pm: Add support to set min ISP clocks
      drm/amd/amdgpu: Add ISP Generic PM Domain (genpd) support
      drm/amd/amdgpu: Refine isp_v4_1_1 logging
      drm/amd/amdgpu: Initialize swnode for ISP MFD device
      drm/amd/amdgpu: Add helper functions for isp buffers

Raag Jadav (3):
      drm/xe: drop redundant conversion to bool
      drm/xe: Expose fan control and voltage regulator version
      drm/xe/pm: Wire up suspend/resume for I2C controller

Randy Dunlap (1):
      drm/msm/dp: add linux/io.h header to fix build errors

Ray Wu (1):
      drm/amd/display: Move vmalloc include to header file

Reuven Abliyev (1):
      drm/xe/nvm: add support for non-posted erase

Rhys Lloyd (1):
      gpu: nova-core: fix bounds check in PmuLookupTableEntry::new

Riana Tauro (2):
      drm/xe/xe_pmu: Validate gt in event supported
      drm/xe/xe_i2c: Add support for i2c in survivability mode

Rob Clark (52):
      drm/panel-edp: Add BOE NV133WUM-N61 panel entry
      drm/fourcc: Add missing half-float formats
      drm/fourcc: Add 32b float formats
      Merge remote-tracking branch 'drm/drm-next' into msm-next
      drm/ci: Remove sdm845/cheza jobs
      drm/ci: Uprev igt
      drm/gpuvm: Fix doc comments
      drm/gpuvm: Add locking helpers
      drm/gem: Add ww_acquire_ctx support to drm_gem_lru_scan()
      drm/msm: Rename msm_file_private -> msm_context
      drm/msm: Improve msm_context comments
      drm/msm: Rename msm_gem_address_space -> msm_gem_vm
      drm/msm: Remove vram carveout support
      drm/msm: Collapse vma allocation and initialization
      drm/msm: Collapse vma close and delete
      drm/msm: Don't close VMAs on purge
      drm/msm: Stop passing vm to msm_framebuffer
      drm/msm: Refcount framebuffer pins
      drm/msm: drm_gpuvm conversion
      drm/msm: Convert vm locking
      drm/msm: Use drm_gpuvm types more
      drm/msm: Split out helper to get iommu prot flags
      drm/msm: Add mmu support for non-zero offset
      drm/msm: Add PRR support
      drm/msm: Rename msm_gem_vma_purge() -> _unmap()
      drm/msm: Drop queued submits on lastclose()
      drm/msm: Lazily create context VM
      drm/msm: Add opt-in for VM_BIND
      drm/msm: Mark VM as unusable on GPU hangs
      drm/msm: Add _NO_SHARE flag
      drm/msm: Crashdump prep for sparse mappings
      drm/msm: rd dumping prep for sparse mappings
      drm/msm: Crashdump support for sparse
      drm/msm: rd dumping support for sparse
      drm/msm: Extract out syncobj helpers
      drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
      drm/msm: Add VM_BIND submitqueue
      drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
      drm/msm: Support pgtable preallocation
      drm/msm: Split out map/unmap ops
      drm/msm: Add VM_BIND ioctl
      drm/msm: Add VM logging for VM_BIND updates
      drm/msm: Add VMA unmap reason
      drm/msm: Add mmu prealloc tracepoint
      drm/msm: use trylock for debugfs
      drm/msm: Bump UAPI version
      drm/msm: Defer VMA unmap for fb unpins
      drm/msm: Add VM_BIND throttling
      drm/msm: Update register xml
      drm/msm: Clean up split driver features
      drm/msm: Take the ioctls away from the KMS-only driver
      drm/msm: Small function param doc fix

Robert Mader (1):
      drm: drm_fourcc: add 10/12/16bit software decoder YCbCr formats

Rodrigo Vivi (3):
      drm/xe: Make xe_gt_freq part of the Documentation
      drm/xe: Add missing documentation of rpa_freq
      Merge drm/drm-next into drm-xe-next

Ryan Seto (2):
      drm/amd/display: Clear DPP 3DLUT Cap
      drm/amd/display: Removing Unused DPP Functions

Ryan Walklin (1):
      dt-bindings: allwinner: add H616 DE33 mixer binding

Ryosuke Yasuoka (3):
      drm/hyperv: Replace simple-KMS with regular atomic helpers
      drm/hyperv: Add support for drm_panic
      drm/bochs: Add support for drm_panic

Sakari Ailus (1):
      drm/nouveau/disp: Use dev->dev to get the device

Samson Tam (1):
      drm/amd/display: Add support for 2nd sharpening range

Samuel Zhang (9):
      drm/amdgpu: update xgmi info and vram_base_offset on resume
      drm/amdgpu: update GPU addresses for SMU and PSP
      drm/amdgpu: enable pdb0 for hibernation on SRIOV
      drm/amdgpu: fix fence fallback timer expired error
      drm/ttm: add new api ttm_device_prepare_hibernation()
      drm/amdgpu: move GTT to shmem after eviction for hibernation
      PM: hibernate: shrink shmem pages after dev_pm_ops.prepare()
      PM: hibernate: add new api pm_hibernate_is_recovering()
      drm/amdgpu: do not resume device in thaw for normal hibernation

Satyanarayana K V P (1):
      drm/xe: Add helper function to inject fault into ct_dead_capture()

Shekhar Chauhan (3):
      drm/xe/xe2_hpg: Add PCI IDs for xe2_hpg
      drm/xe/xe2_hpg: Add set of workarounds
      drm/xe/xe2_hpg: Define additional Xe2_HPG GMD_ID

Shiwu Zhang (1):
      drm/amdgpu: Enable IFWI update support for PSPv14.0.2 and v14.0.3

Shixiong Ou (4):
      drm/shmem-helper: Import dmabuf without mapping its sg_table
      drm/ast: use DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT
      drm/udl: use DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT
      fbcon: Fix outdated registered_fb reference in comment

Shuicheng Lin (6):
      drm/xe: Use xe_mmio_read32() to read mtcfg register
      drm/xe/uapi: Correct sync type definition in comments
      drm/xe/pm: Restore display pm if there is error after display suspend
      drm/xe: Remove unused code in devcoredump_snapshot()
      drm/xe: Release runtime pm for error path of xe_devcoredump_read()
      drm/xe/pm: Correct comment of xe_pm_set_vram_threshold()

Simona Vetter (8):
      accel/qaic: delete qaic_bo.handle
      Merge tag 'drm-intel-next-2025-07-04' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-msm-next-2025-07-05' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      drm/panthor: Fix UAF in panthor_gem_create_with_handle() debugfs code
      Merge tag 'drm-misc-next-2025-07-10' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-xe-next-2025-07-10' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-intel-next-2025-07-10' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'amd-drm-next-6.17-2025-07-11' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

Sonny Jiang (1):
      drm/amdgpu: VCN v5_0_1 to prevent FW checking RB during DPG pause

Srinivasan Shanmugam (2):
      drm/amd/display: Fix annotations for dc state functions
      drm/amdgpu/gfx9: Add Cleaner Shader Support for GFX9.x GPUs

Stefan Eichenberger (2):
      drm/panel: st7701: Add Winstar wf40eswaa6mnn0 panel support
      dt-bindings: display: st7701: Add Winstar wf40eswaa6mnn0 panel

Steven Price (1):
      drm/panthor: Wait for _READY register when powering on

Sunil Khatri (7):
      drm/file: add client id to drm_file_error
      drm: move drm based debugfs funcs to drm_debugfs.c
      drm: add debugfs support on per client-id basis
      drm/amdgpu: add debugfs support for VM pagetable per client
      drm/amdgpu: add support of debugfs for mqd information
      drm/amdgpu: fix MQD debugfs undefined symbol when DEBUG_FS=3Dn
      drm/amdgpu: fix the logic to validate fpriv and root bo

Suraj Kandpal (30):
      drm/i915/dpll: Rename intel_dpll
      drm/i915/dpll: Rename intel_dpll_funcs
      drm/i915/dpll: Rename intel_shared_dpll_state
      drm/i915/dpll: Rename macro for_each_shared_dpll
      drm/i915/dpll: Rename intel_shared_dpll_funcs
      drm/i915/dpll: Rename intel_shared_dpll
      drm/i915/dpll: Move away from using shared dpll
      drm/i915/dpll: Rename crtc_get_shared_dpll
      drm/i915/dpll: Rename intel_[enable/disable]_dpll
      drm/i915/dpll: Rename intel_unreference_dpll_crtc
      drm/i915/dpll: Rename intel_reference_dpll_crtc
      drm/i915/dpll: Rename intel_<release/reserve>_dpll
      drm/i915/dpll: Rename intel_compute_dpll
      drm/i915/dpll: Rename intel_update_active_dpll
      drm/i915/hdcp: Do not use inline intel_de_read
      drm/i915/hdcp: Use HDCP2_STREAM_STATUS instead of HDCP2_AUTH_STREAM
      drm/dp: Introduce new member in drm_backlight_info
      drm/dp: Add argument in drm_edp_backlight_init
      drm/dp: Add argument for max luminance in drm_edp_backlight_init
      drm/dp: Move from u16 to u32 for max in drm_edp_backlight_info
      drm/dp: Change current_level argument type to u32
      drm/dp: Modify drm_edp_probe_state
      drm/dp: Change argument type for drm_edp_backlight_set_level
      drm/dp: Modify drm_edp_backlight_set_level
      drm/dp: Change argument type of drm_edp_backlight_enable
      drm/dp: Enable backlight control using luminance
      drm/i915/backlight: Use drm helper to initialize edp backlight
      drm/i915/backlight: Use drm helper to set edp backlight
      drm/i915/backlight: Use drm_edp_backlight_enable
      drm/dp: Add documentation for luminance_set

Svyatoslav Ryhel (3):
      dt-bindings: display: panel: Document Renesas R61307 based DSI panel
      drm: panel: Add support for Renesas R61307 based MIPI DSI panel
      dt-bindings: display: panel: Document Renesas R69328 based DSI panel

T.J. Mercier (1):
      dma-buf: system_heap: No separate allocation for attachment sg_tables

Taimur Hassan (10):
      drm/amd/display: [FW Promotion] Release 0.1.11.0
      drm/amd/display: [FW Promotion] Release 0.1.12.0
      drm/amd/display: Promote DAL to 3.2.335
      drm/amd/display: Promote DAL to 3.2.336
      drm/amd/display: Promote DC to 3.2.337
      drm/amd/display: Promote DC to 3.2.338
      drm/amd/display: [FW Promotion] Release 0.1.16.0
      drm/amd/display: Promote DAL to 3.2.339
      drm/amd/display: [FW Promotion] Release 0.1.17.0
      drm/amd/display: Promote DAL to 3.2.340

Takashi Iwai (1):
      drm/amd/display: Add sanity checks for drm_edid_raw()

Tamir Duberstein (1):
      rust: drm: remove unnecessary imports

Tejas Upadhyay (2):
      drm/xe/mocs: Check if all domains awake
      drm/xe: Dont skip TLB invalidations on VF

Thierry Reding (1):
      drm/fbdev-client: Skip DRM clients if modesetting is absent

Thomas Hellstr=C3=B6m (9):
      drm/xe: Fix the gem shrinker name
      drm/xe: Make the gem shrinker drm managed
      drm/xe: Rework eviction rejection of bound external bos
      Merge drm/drm-next into drm-xe-next
      drm/ttm: Use a struct for the common part of struct ttm_lru_walk
and struct ttm_bo_lru_cursor
      drm/ttm, drm/xe: Modify the struct ttm_bo_lru_walk_cursor initializat=
ion
      drm/ttm, drm_xe, Implement ttm_lru_walk_for_evict() using the
guarded LRU iteration
      drm/pagemap: Add a populate_mm op
      drm/xe: Implement and use the drm_pagemap populate_mm op

Thomas Zimmermann (59):
      drm: Add helpers for programming hardware gamma LUTs
      drm/ast: Use helpers for programming gamma ramps and palettes
      drm/mgag200: Use helpers for programming gamma ramps
      drm/ofdrm: Use helpers for programming gamma ramps
      drm/vesadrm: Use helpers for programming gamma ramps
      drm/client: Do not pin in drm_client_buffer_vmap()
      drm/gem-vram: Do not set pin and unpin callbacks
      drm/gem-vram: Un-export pin helpers
      drm/gem: Inline drm_gem_pin() into PRIME helpers
      Merge drm/drm-next into drm-misc-next
      drm/arm/hdlcd: Replace struct simplefb_format with custom type
      drm/format-helper: Normalize BT.601 factors to 256
      drm/format-helper: Update tests after BT.601 changes
      drm: Do not include <linux/export.h>
      drm: Include <linux/export.h>
      drm/bridge: Include <linux/export.h>
      drm/client: Include <linux/export.h>
      drm/display: Include <linux/export.h>
      drm/gem: Include <linux/export.h>
      drm/panel: Include <linux/export.h>
      drm/scheduler: Include <linux/export.h>
      drm/ttm: Include <linux/export.h>
      fbdev: Remove trailing whitespaces
      fbdev: Include <linux/export.h>
      fbdev/c2p: Include <linux/export.h>
      fbdev/cyber2000fb: Unexport symbols
      fbdev/matroxfb: Remove trailing whitespaces
      fbdev/matroxfb: Include <linux/export.h>
      fbdev/omap: Include <linux/export.h>
      fbdev/omap2: Include <linux/export.h>
      fbdev/omap2: Do not include <linux/export.h>
      fbdev/mb862xx: Do not include <linux/export.h>
      fbdev/pxafb: Unexport symbol
      fbdev/sisfb: Unexport symbols
      fbdev/viafb: Include <linux/export.h>
      fbdev/viafb: Do not include <linux/export.h>
      video: Make CONFIG_FIRMWARE_EDID generally available
      video: Make global edid_info depend on CONFIG_FIRMWARE_EDID
      drm/tests: Do not use drm_fb_blit() in format-helper tests
      drm/tests: Test drm_fb_build_fourcc_list() in separate test suite
      drm/format-helper: Move drm_fb_build_fourcc_list() to sysfb helpers
      drm/format-helper: Split off byte swapping from
drm_fb_xrgb8888_to_rgb565()
      drm/amdgpu: Test for imported buffers with drm_gem_is_imported()
      drm/amdgpu: Use dma_buf from GEM object instance
      drm/gem-shmem: Do not map s/g table by default
      drm/tegra: Test for imported buffers with drm_gem_is_imported()
      drm/tegra: Use dma_buf from GEM object instance
      drm/ast: Declare helpers for POST in header
      drm/ast: Move Gen7+ POST code to separate source file
      drm/ast: Move Gen6+ POST code to separate source file
      drm/ast: Move Gen4+ POST code to separate source file
      drm/ast: Move Gen2+ and Gen1 POST code to separate source files
      drm/ast: Move struct ast_dramstruct to ast_post.h
      drm/ast: Handle known struct ast_dramstruct with helpers
      drm/ast: Split ast_set_def_ext_reg() by chip generation
      drm/ast: Gen7: Disable VGASR0[1] as on Gen4+
      drm/ast: Gen7: Switch default registers to gen4+ state
      drm/radeon: Do not hold console lock while suspending clients
      drm/radeon: Do not hold console lock during resume

Tomasz Lis (6):
      drm/xe/vf: Divide GGTT ballooning into allocation and insertion
      drm/xe/vf: Shifting GGTT area post migration
      drm/xe/guc: Introduce enum with offsets for context register H2Gs
      drm/xe/vf: Fixup CTB send buffer messages after migration
      drm/xe/vf: Fail migration recovery if fixups needed but platform
not supported
      drm/xe/vf: Make multi-GT migration less error prone

Tommaso Merciai (2):
      drm/bridge: adv7511: Move adv711_dsi_config_timing_gen() into
adv7511_mode_set()
      drm/bridge: adv7511: Rename adv7511_dsi_config_timing_gen() into
adv7533_dsi_config_timing_gen()

Tony Yi (1):
      drm/amdgpu: Check SQ_CONFIG register support on SRIOV

Tvrtko Ursulin (22):
      drm/i915: Use provided dma_fence_is_chain
      dma-fence: Change signature of __dma_fence_is_later
      drm/ttm: Respect the shrinker core free target
      drm/ttm: Increase pool shrinker batch target
      dma-fence: Use a flag for 64-bit seqnos
      dma-fence: Add helpers for accessing driver and timeline name
      sync_file: Use dma-fence driver and timeline name helpers
      drm/i915: Use dma-fence driver and timeline name helpers
      sync_file: Protect access to driver and timeline name
      drm/i915: Protect access to driver and timeline name
      dma-fence: Add safe access helpers and document the rules
      drm/xe: Make dma-fences compliant with the safe access rules
      drm/xe: Consolidate LRC offset calculations
      drm/sched: De-clutter drm_sched_init
      drm/sched: Consolidate drm_sched_rq_select_entity_rr
      drm/xe: Generalize wa bb emission code
      drm/xe: Pass wa bb setup arguments in a struct
      drm/xe: Rename utilization workaround emission function
      drm/xe: Track number of written dwords from workaround batch
buffer emission
      drm/xe: Allow specifying number of extra dwords at the end of wa
bb emission
      drm/xe: Add plumbing for indirect context workarounds
      drm/xe: Waste fewer instructions in emit_wa_job()

Tzung-Bi Shih (1):
      drm/i915/pmu: Fix build error with GCOV and AutoFDO enabled

Umesh Nerlige Ramappa (3):
      drm/xe: Save CTX_TIMESTAMP mmio value instead of LRC value
      drm/xe: Save the gt pointer in lrc and drop the tile
      drm/xe: Add WA BB to capture active context utilization

Umio Yasuno (1):
      drm/amd/pm: fix null pointer access

Val Packett (1):
      drm/panel-edp: Add BOE NE14QDM panel for Dell Latitude 7455

Vignesh Raman (5):
      drm/ci: Add jobs to validate devicetrees
      drm/ci: Add jobs to run KUnit tests
      drm/ci: python-artifacts: use shallow clone
      drm/ci: uprev mesa and ci-templates
      drm/ci: i915: cml: Fix the runner tag

Ville Syrj=C3=A4l=C3=A4 (57):
      drm/i915/gem: Allow EXEC_CAPTURE on recoverable contexts on DG1
      drm/i915/pci: Remove force_probe requirement for DG1
      drm/i915/dmc: Drop PIPEDMC faults from the fault mask on LNL+
      drm/i915/dmc: Hook up PIPEDMC interrupts
      drm/i915/dmc: Define all DMC event IDs
      drm/i915/dmc: Extract dmc_evt_ctl_disable()
      drm/i915/dmc: Relocate is_dmc_evt_{ctl,htp}_reg()
      drm/i915/dmc: Extract is_event_handler()
      drm/i915/dmc: Introduce dmc_configure_event()
      drm/i915/dsb: Extract intel_dsb_ins_align()
      drm/i915/dsb: Extract assert_dsb_tail_is_aligned()
      drm/i915/dsb: Extract intel_dsb_{head,tail}()
      drm/i915/dsb: Implement intel_dsb_gosub()
      drm/i915: Indicate which pipe lied about its interrupts
      drm/i915/dsi: Fix off by one in BXT_MIPI_TRANS_VTOTAL
      drm/i915/dsi: Assert that vfp+vsync+vbp =3D=3D vtotal on BXT/GLK
      drm/i915/dsb: Use intel_dsb_ins_align() in intel_dsb_align_tail()
      drm/i915/dsb: Provide intel_dsb_head() and intel_dsb_size()
      drm/i915/dsb: Introduce intel_dsb_exec_time_us()
      drm/i915/dsb: Garbage collect the MMIO DEwake stuff
      drm/i915/dsb: Move the DSB_PMCTRL* reset out of intel_dsb_finish()
      drm/i915/dsb: Disable the GOSUB interrupt
      drm/i915/dmc: Limit pipe DMC clock gating w/a to just ADL/DG2/MTL
      drm/i915/dmc: Parametrize MTL_PIPEDMC_GATING_DIS
      drm/i915/dmc: Shuffle code around
      drm/i915/dmc: Extract dmc_load_program()
      drm/i915/dmc: Reload pipe DMC state on TGL when enabling pipe A
      drm/i915/dmc: Reload pipe DMC MMIO registers for pipe C/D on
various platforms
      drm/i915/dmc: Assert DMC is loaded harder
      drm/i915/dmc: Pass crtc_state to intel_dmc_{enable,disable}_pipe()
      drm/i915/dmc: Do not enable the pipe DMC on TGL when PSR is possible
      drm/i915: Set PKG_C_LATENCY.added_wake_time to 0
      drm/i915: Try to program PKG_C_LATENCY more correctly
      drm/i915/dmc: Define flip queue related PIPEDMC registers
      drm/i915/flipq: Provide the nuts and bolts code for flip queue
      drm/i915/flipq: Implement flip queue based commit path
      drm/i915/flipq: Implement Wa_18034343758
      drm/i915/flipq: Add intel_flipq_dump()
      drm: Pass pixel_format+modifier to .get_format_info()
      drm: Pass pixel_format+modifier directly to drm_get_format_info()
      drm: Look up the format info earlier
      drm: Pass the format info to .fb_create()
      drm: Allow the caller to pass in the format info to
drm_helper_mode_fill_fb_struct()
      drm/malidp: Pass along the format info from .fb_create()
malidp_verify_afbc_framebuffer_size()
      drm/gem: Pass along the format info from .fb_create() to
drm_helper_mode_fill_fb_struct()
      drm/gem/afbc: Eliminate redundant drm_get_format_info()
      drm/amdgpu: Pass along the format info from .fb_create() to
drm_helper_mode_fill_fb_struct()
      drm/armada: Pass along the format info from .fb_create() to
drm_helper_mode_fill_fb_struct()
      drm/exynos: Pass along the format info from .fb_create() to
drm_helper_mode_fill_fb_struct()
      drm/gma500: Pass along the format info from .fb_create() to
drm_helper_mode_fill_fb_struct()
      drm/i915: Pass along the format info from .fb_create() to
drm_helper_mode_fill_fb_struct()
      drm/komeda: Pass along the format info from .fb_create() to
drm_helper_mode_fill_fb_struct()
      drm/msm: Pass along the format info from .fb_create() to
drm_helper_mode_fill_fb_struct()
      drm/tegra: Pass along the format info from .fb_create() to
drm_helper_mode_fill_fb_struct()
      drm/virtio: Pass along the format info from .fb_create() to
drm_helper_mode_fill_fb_struct()
      drm/vmwgfx: Pass along the format info from .fb_create() to
drm_helper_mode_fill_fb_struct()
      drm: Make passing of format info to
drm_helper_mode_fill_fb_struct() mandatory

Vinay Belgaumkar (4):
      drm/xe/guc: Ignore GuC CT errors when wedged
      drm/xe/bmg: Update Wa_16023588340
      drm/xe/bmg: Update Wa_14022085890
      drm/xe/bmg: Update Wa_22019338487

Vitaly Prosyak (3):
      drm/amdgpu: fix slab-use-after-free in amdgpu_userq_mgr_fini+0x70c
      Revert "drm/amdgpu: fix slab-use-after-free in amdgpu_userq_mgr_fini"
      drm/amdgpu: fix use-after-free in amdgpu_userq_suspend+0x51a/0x5a0

Vivek Kasireddy (2):
      drm/virtio: Fix NULL pointer deref in virtgpu_dma_buf_free_obj()
      Revert "drm/xe/display: use xe->display to decide whether to do anyth=
ing"

Vodapalli, Ravi Kumar (1):
      drm/xe/bmg: Add one additional PCI ID

Wayne Lin (1):
      drm/amd/display: Avoid trying AUX transactions on disconnected ports

Weiguang Li (1):
      drm/amd/display: Remove redundant macro of refresh rate

Wen Chen (1):
      drm/amd/display: Fix 'failed to blank crtc!'

Wenjing Liu (1):
      drm/amd/display: Refactor DML21 Initialization and Configuration

Wolfram Sang (1):
      drm: renesas: rcar-du: use proper naming for R-Car

Xiang Liu (2):
      drm/amdgpu: Add debug mask to disable CE logs
      drm/amdgpu: Use correct severity for BP threshold exceed event

Xin Wang (1):
      drm/xe: Update register definitions in LRC layout header

Yan Li (3):
      drm/amd/display: replace fast_validate with enum dc_validate_mode
      drm/amd/display: apply two different methods to validate modes
      drm/amd/display: remove use_native_pstate_optimization

YiPeng Chai (1):
      drm/amdgpu: Remove useless timeout error message

Yihan Zhu (4):
      drm/amd/display: move RMCM programming
      drm/amd/display: Add RMCM debug logging
      drm/amd/display: Fix RMCM programming seq errors
      drm/amd/display: MPC basic allocation logic and TMZ

Yuan Chen (1):
      drm/msm: Add error handling for krealloc in metadata setup

Yumeng Fang (2):
      drm/i915/display: Use str_true_false() helper
      drm/rockchip: dw_hdmi: Use dev_err_probe() to simplify code

Zhang Enpei (1):
      drm/nouveau/dp: convert to use ERR_CAST()

Zhanjun Dong (1):
      drm/xe/uc: Disable GuC communication on hardware initialization error

ganglxie (5):
      drm/amdgpu: clear pa and mca record counter when resetting eeprom
      drm/amdgpu: refine usage of amdgpu_bad_page_threshold
      drm/amdgpu: refine ras error injection when eeprom initialization fai=
led
      drm/amdgpu: refine eeprom data check
      drm/amdgpu: refine bad page loading when in the same nps mode

hienhuynh (1):
      drm: rz-du: Support panels connected directly to the DPAD output

sanirban (1):
      drm/xe/ptl: Apply Wa_16026007364

 .../ABI/testing/sysfs-driver-intel-xe-hwmon        |   48 +
 Documentation/ABI/testing/sysfs-driver-qaic        |   18 +
 .../display/allwinner,sun8i-a83t-de2-mixer.yaml    |   34 +-
 .../fsl,imx8qxp-dc-axi-performance-counter.yaml    |   57 +
 .../display/imx/fsl,imx8qxp-dc-blit-engine.yaml    |  204 ++
 .../display/imx/fsl,imx8qxp-dc-blitblend.yaml      |   41 +
 .../bindings/display/imx/fsl,imx8qxp-dc-clut.yaml  |   44 +
 .../imx/fsl,imx8qxp-dc-command-sequencer.yaml      |   67 +
 .../display/imx/fsl,imx8qxp-dc-constframe.yaml     |   44 +
 .../display/imx/fsl,imx8qxp-dc-display-engine.yaml |  152 +
 .../display/imx/fsl,imx8qxp-dc-dither.yaml         |   45 +
 .../display/imx/fsl,imx8qxp-dc-extdst.yaml         |   72 +
 .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml      |  141 +
 .../display/imx/fsl,imx8qxp-dc-filter.yaml         |   43 +
 .../display/imx/fsl,imx8qxp-dc-framegen.yaml       |   64 +
 .../display/imx/fsl,imx8qxp-dc-gammacor.yaml       |   32 +
 .../display/imx/fsl,imx8qxp-dc-layerblend.yaml     |   39 +
 .../display/imx/fsl,imx8qxp-dc-matrix.yaml         |   44 +
 .../display/imx/fsl,imx8qxp-dc-pixel-engine.yaml   |  250 ++
 .../bindings/display/imx/fsl,imx8qxp-dc-rop.yaml   |   43 +
 .../display/imx/fsl,imx8qxp-dc-safety.yaml         |   34 +
 .../display/imx/fsl,imx8qxp-dc-scaling-engine.yaml |   83 +
 .../display/imx/fsl,imx8qxp-dc-signature.yaml      |   53 +
 .../bindings/display/imx/fsl,imx8qxp-dc-store.yaml |   96 +
 .../bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml  |   45 +
 .../bindings/display/imx/fsl,imx8qxp-dc.yaml       |  236 ++
 .../bindings/display/msm/dp-controller.yaml        |    4 +
 .../bindings/display/msm/dsi-controller-main.yaml  |   54 +-
 .../bindings/display/msm/dsi-phy-7nm.yaml          |    1 +
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |    1 +
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     |  470 +++
 .../bindings/display/panel/himax,hx83112b.yaml     |   73 +
 .../bindings/display/panel/himax,hx8394.yaml       |   17 +-
 .../bindings/display/panel/ilitek,ili9881c.yaml    |    1 +
 .../bindings/display/panel/panel-simple.yaml       |    2 +
 .../bindings/display/panel/raydium,rm67200.yaml    |    1 -
 .../bindings/display/panel/renesas,r61307.yaml     |   94 +
 .../bindings/display/panel/renesas,r69328.yaml     |   73 +
 .../bindings/display/panel/samsung,atna33xc20.yaml |    2 +
 .../bindings/display/panel/sitronix,st7701.yaml    |    1 +
 .../bindings/display/panel/visionox,rm69299.yaml   |    4 +-
 .../bindings/display/renesas,rzg2l-du.yaml         |   23 +-
 .../display/rockchip/rockchip,dw-mipi-dsi.yaml     |    6 -
 .../bindings/display/rockchip/rockchip-vop2.yaml   |   56 +-
 .../bindings/display/sitronix,st7567.yaml          |   63 +
 .../bindings/display/ti/ti,am625-oldi.yaml         |   79 +
 .../bindings/display/ti/ti,am65x-dss.yaml          |  220 +-
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |    5 +-
 .../devicetree/bindings/gpu/arm,mali-utgard.yaml   |    2 +
 .../interrupt-controller/fsl,imx8qxp-dc-intc.yaml  |  318 ++
 .../bindings/opp/opp-v2-qcom-adreno.yaml           |    2 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |    4 +
 Documentation/gpu/amdgpu/debugging.rst             |   18 +
 Documentation/gpu/drm-uapi.rst                     |   36 +
 Documentation/gpu/i915.rst                         |   10 +-
 Documentation/gpu/nova/core/devinit.rst            |   61 +
 Documentation/gpu/nova/core/falcon.rst             |  158 +
 Documentation/gpu/nova/core/fwsec.rst              |  181 +
 Documentation/gpu/nova/core/todo.rst               |  107 +-
 Documentation/gpu/nova/core/vbios.rst              |  181 +
 Documentation/gpu/nova/index.rst                   |    4 +
 Documentation/gpu/rfc/gpusvm.rst                   |   12 +-
 Documentation/gpu/todo.rst                         |   15 +
 Documentation/gpu/vkms.rst                         |   15 +-
 Documentation/gpu/xe/xe_configfs.rst               |   10 +-
 Documentation/userspace-api/dma-buf-heaps.rst      |   11 +-
 MAINTAINERS                                        |   51 +-
 arch/arm64/boot/dts/mediatek/mt8370.dtsi           |   16 +
 arch/x86/kernel/setup.c                            |    4 +
 drivers/Kconfig                                    |    2 -
 drivers/accel/amdxdna/aie2_ctx.c                   |    7 +-
 drivers/accel/amdxdna/amdxdna_gem.c                |  191 +-
 drivers/accel/amdxdna/amdxdna_gem.h                |    3 +-
 drivers/accel/drm_accel.c                          |   16 -
 drivers/accel/habanalabs/common/device.c           |   25 +-
 drivers/accel/ivpu/ivpu_drv.c                      |    1 +
 drivers/accel/ivpu/ivpu_drv.h                      |   15 +-
 drivers/accel/ivpu/ivpu_hw.c                       |    4 +
 drivers/accel/ivpu/ivpu_hw_ip.c                    |    1 +
 drivers/accel/ivpu/ivpu_job.c                      |   81 +-
 drivers/accel/ivpu/ivpu_pm.c                       |   15 +-
 drivers/accel/qaic/Makefile                        |    1 +
 drivers/accel/qaic/qaic.h                          |   10 +-
 drivers/accel/qaic/qaic_data.c                     |    1 -
 drivers/accel/qaic/qaic_drv.c                      |    6 +
 drivers/accel/qaic/qaic_ras.c                      |  642 ++++
 drivers/accel/qaic/qaic_ras.h                      |   10 +
 drivers/base/power/main.c                          |   14 +
 drivers/dma-buf/Kconfig                            |    1 -
 drivers/dma-buf/dma-fence-chain.c                  |    7 +-
 drivers/dma-buf/dma-fence.c                        |  169 +-
 drivers/dma-buf/heaps/Kconfig                      |   10 +
 drivers/dma-buf/heaps/cma_heap.c                   |   36 +-
 drivers/dma-buf/heaps/system_heap.c                |   43 +-
 drivers/dma-buf/sw_sync.c                          |    2 +-
 drivers/dma-buf/sync_file.c                        |   24 +-
 drivers/dma-buf/udmabuf.c                          |   23 +-
 drivers/gpu/drm/Kconfig.debug                      |    1 +
 drivers/gpu/drm/Makefile                           |    6 +-
 drivers/gpu/drm/adp/adp-mipi.c                     |    8 +-
 drivers/gpu/drm/amd/amdgpu/Makefile                |    2 +-
 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |   33 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   54 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |    5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   33 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c  |    8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c  |    8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c           |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   56 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h        |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c   |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  555 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.h        |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c   |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   58 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  179 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |   24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  262 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |   13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c            |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |   20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c             |   96 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ip.h             |   29 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |   28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c            |  175 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.h            |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   83 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c           |    9 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   35 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  150 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   55 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |  126 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  107 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   46 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |   90 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |   32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   60 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |   20 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |    6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |   59 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   76 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   53 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c   |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h       |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |  238 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.h            |   25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |    3 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |  313 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   70 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   51 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   45 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |   71 -
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   72 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   79 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   28 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |    8 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    5 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |    5 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |    5 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |    4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  276 +-
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |    9 +-
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c            |  184 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |   22 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |   12 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |   22 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |   23 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |   21 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |   20 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |   25 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c           |   26 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   10 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |    6 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |   20 -
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |   12 +-
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |   52 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0_8.c           |   25 +-
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             |   28 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   58 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c           |   37 +-
 drivers/gpu/drm/amd/amdgpu/psp_v14_0.c             |   70 +-
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c              |   41 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |   66 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |   26 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |   29 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |   68 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |   41 +-
 drivers/gpu/drm/amd/amdgpu/soc15.h                 |    1 -
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |   26 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |   25 +
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |   27 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   23 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |   13 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |   23 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |   23 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            |    6 +-
 drivers/gpu/drm/amd/amdkfd/Kconfig                 |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |    1 -
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  123 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   11 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |    1 -
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |    8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   45 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |    6 +-
 drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c        |    1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  269 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    3 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   11 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |    4 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    6 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |    4 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h    |    2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h    |   26 +
 .../gpu/drm/amd/display/dc/bios/command_table2.c   |    1 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |    2 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |    2 +-
 .../gpu/drm/amd/display/dc/clk_mgr/dcn30/dalsmc.h  |    3 +-
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |    4 +-
 .../amd/display/dc/clk_mgr/dcn30/dcn30m_clk_mgr.c  |   36 +
 .../amd/display/dc/clk_mgr/dcn30/dcn30m_clk_mgr.h  |   31 +
 .../dc/clk_mgr/dcn30/dcn30m_clk_mgr_smu_msg.c      |  118 +
 .../dc/clk_mgr/dcn30/dcn30m_clk_mgr_smu_msg.h      |   34 +
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |  114 +-
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.h |    3 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   78 +-
 drivers/gpu/drm/amd/display/dc/core/dc_debug.c     |    2 +
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |   26 +
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |    5 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   16 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |   13 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   67 +
 drivers/gpu/drm/amd/display/dc/dc.h                |  108 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  433 ++-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   77 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   19 +-
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |    6 +-
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |   19 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |   11 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   20 +-
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c   |    2 +-
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.h   |    3 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c    |   59 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |   43 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.h   |    2 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |    4 -
 .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   |    6 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |   45 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h   |   12 +-
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   |    6 +-
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h   |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |    4 +-
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.h |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   30 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h   |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |    4 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.h   |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c |    4 +-
 .../gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.h |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn401/dcn401_fpu.c |  239 --
 .../gpu/drm/amd/display/dc/dml/dcn401/dcn401_fpu.h |   14 -
 drivers/gpu/drm/amd/display/dc/dml2/Makefile       |   13 +-
 .../drm/amd/display/dc/dml2/display_mode_core.c    |    2 +-
 .../display/dc/dml2/display_mode_core_structs.h    |    1 +
 .../dc/dml2/dml21/dml21_translation_helper.c       |  591 ++--
 .../dc/dml2/dml21/dml21_translation_helper.h       |    4 +-
 .../drm/amd/display/dc/dml2/dml21/dml21_utils.c    |   14 +-
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |   67 +-
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.h  |   13 +-
 .../drm/amd/display/dc/dml2/dml21/inc/dml_top.h    |    1 -
 .../dc/dml2/dml21/inc/dml_top_dchub_registers.h    |    1 +
 .../dc/dml2/dml21/inc/dml_top_display_cfg_types.h  |    2 +
 .../dml2/dml21/inc/dml_top_soc_parameter_types.h   |    5 +
 .../amd/display/dc/dml2/dml21/inc/dml_top_types.h  |   14 +-
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |   58 +-
 .../dml21/src/dml2_core/dml2_core_shared_types.h   |  181 +-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_utils.c  |    2 +-
 .../dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c   |    3 -
 .../amd/display/dc/dml2/dml21/src/inc/dml2_debug.h |  149 +-
 .../dml21/src/inc/dml2_internal_shared_types.h     |   10 +-
 .../drm/amd/display/dc/dml2/dml2_mall_phantom.c    |    2 +-
 .../amd/display/dc/dml2/dml2_translation_helper.c  |   20 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |  265 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |    6 +-
 .../gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c |    2 +-
 .../gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.h |    3 +-
 .../drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c  |   24 -
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |  192 +-
 .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c |   28 +-
 .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.h |    1 +
 drivers/gpu/drm/amd/display/dc/dsc/dsc.h           |    1 +
 .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.h |   19 +
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |    4 +-
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.h   |    2 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |   34 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.h  |    4 +
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |   59 +
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   30 +-
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |   13 +
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |    6 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |   28 +
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |  316 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h  |    9 +-
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |    3 +
 drivers/gpu/drm/amd/display/dc/inc/core_status.h   |    1 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   17 +-
 drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h     |    2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |   16 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |    2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |    2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |   47 +
 drivers/gpu/drm/amd/display/dc/inc/hw/pg_cntl.h    |    2 +
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |    1 +
 drivers/gpu/drm/amd/display/dc/inc/link.h          |    6 +-
 .../amd/display/dc/link/accessories/link_dp_cts.c  |   63 +-
 .../hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.c    |    2 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |    3 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   27 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |   10 +-
 .../gpu/drm/amd/display/dc/link/link_validation.c  |  132 +-
 .../gpu/drm/amd/display/dc/link/link_validation.h  |    6 +-
 .../display/dc/link/protocols/link_dp_capability.c |   57 +-
 .../amd/display/dc/link/protocols/link_dp_dpia.c   |   15 +-
 .../display/dc/link/protocols/link_dp_dpia_bw.c    |  295 +-
 .../display/dc/link/protocols/link_dp_dpia_bw.h    |   39 +-
 .../dc/link/protocols/link_edp_panel_control.c     |   40 +-
 .../dc/link/protocols/link_edp_panel_control.h     |    1 +
 drivers/gpu/drm/amd/display/dc/mpc/Makefile        |    2 +-
 .../gpu/drm/amd/display/dc/mpc/dcn32/dcn32_mpc.c   |    5 +-
 .../gpu/drm/amd/display/dc/mpc/dcn32/dcn32_mpc.h   |    8 +
 .../gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c |   12 +-
 .../gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h |   13 +
 drivers/gpu/drm/amd/display/dc/os_types.h          |    1 +
 .../display/dc/resource/dce100/dce100_resource.c   |    2 +-
 .../display/dc/resource/dce110/dce110_resource.c   |    2 +-
 .../display/dc/resource/dce112/dce112_resource.c   |    2 +-
 .../display/dc/resource/dce112/dce112_resource.h   |    2 +-
 .../amd/display/dc/resource/dce60/dce60_resource.c |    2 +-
 .../amd/display/dc/resource/dce80/dce80_resource.c |    2 +-
 .../amd/display/dc/resource/dcn10/dcn10_resource.c |    4 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |   10 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.h |    4 +-
 .../display/dc/resource/dcn201/dcn201_resource.c   |    2 +
 .../amd/display/dc/resource/dcn21/dcn21_resource.c |   10 +-
 .../amd/display/dc/resource/dcn21/dcn21_resource.h |    2 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |   24 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.h |    6 +-
 .../display/dc/resource/dcn301/dcn301_resource.c   |    2 +
 .../display/dc/resource/dcn302/dcn302_resource.c   |    2 +
 .../display/dc/resource/dcn303/dcn303_resource.c   |    2 +
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |   59 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.h |   10 +-
 .../display/dc/resource/dcn314/dcn314_resource.c   |   23 +-
 .../display/dc/resource/dcn314/dcn314_resource.h   |    2 +-
 .../display/dc/resource/dcn315/dcn315_resource.c   |   10 +-
 .../display/dc/resource/dcn316/dcn316_resource.c   |   10 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |   46 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.h |    4 +-
 .../display/dc/resource/dcn321/dcn321_resource.c   |   22 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |   19 +-
 .../display/dc/resource/dcn351/dcn351_resource.c   |   19 +-
 .../amd/display/dc/resource/dcn36/dcn36_resource.c |   19 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |   52 +-
 .../display/dc/resource/dcn401/dcn401_resource.h   |    2 +-
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl.c       |   45 +-
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl_types.h |    2 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   13 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  367 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |    5 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |   21 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.c |    5 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   13 +-
 .../drm/amd/display/modules/freesync/freesync.c    |   10 +-
 .../drm/amd/display/modules/power/power_helpers.h  |    2 +
 drivers/gpu/drm/amd/include/amd_shared.h           |    2 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |    2 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |   15 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |    9 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |   72 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c     |  118 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.h     |    7 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |   10 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c    |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  121 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |    9 +-
 .../pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0_0.h |    1 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_pmfw.h   |   16 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |    2 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   39 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   22 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   37 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |   37 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   57 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   55 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  106 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  |   41 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   59 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h   |    2 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  105 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |   60 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |   94 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   10 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |   41 +-
 .../drm/arm/display/komeda/komeda_framebuffer.c    |    3 +-
 .../drm/arm/display/komeda/komeda_framebuffer.h    |    1 +
 drivers/gpu/drm/arm/hdlcd_crtc.c                   |   23 +-
 drivers/gpu/drm/arm/malidp_drv.c                   |   12 +-
 drivers/gpu/drm/armada/armada_fb.c                 |   12 +-
 drivers/gpu/drm/armada/armada_fb.h                 |    4 +-
 drivers/gpu/drm/armada/armada_fbdev.c              |    5 +-
 drivers/gpu/drm/ast/Makefile                       |    5 +
 drivers/gpu/drm/ast/ast_2000.c                     |  149 +
 drivers/gpu/drm/ast/ast_2100.c                     |  348 ++
 drivers/gpu/drm/ast/ast_2300.c                     | 1328 ++++++++
 drivers/gpu/drm/ast/ast_2500.c                     |  569 ++++
 drivers/gpu/drm/ast/ast_2600.c                     |   44 +
 drivers/gpu/drm/ast/ast_dram_tables.h              |  207 --
 drivers/gpu/drm/ast/ast_drv.c                      |    2 +-
 drivers/gpu/drm/ast/ast_drv.h                      |   17 +-
 drivers/gpu/drm/ast/ast_mode.c                     |   69 +-
 drivers/gpu/drm/ast/ast_post.c                     | 2027 +----------
 drivers/gpu/drm/ast/ast_post.h                     |   50 +
 drivers/gpu/drm/bridge/adv7511/Kconfig             |    5 +-
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |   53 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |   77 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c       |   57 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  360 +-
 drivers/gpu/drm/bridge/adv7511/adv7533.c           |    9 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |    9 +-
 .../gpu/drm/bridge/analogix/analogix-i2c-dptx.c    |    2 +
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |   41 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |    3 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |    9 +-
 drivers/gpu/drm/bridge/aux-bridge.c                |    9 +-
 drivers/gpu/drm/bridge/aux-hpd-bridge.c            |   10 +-
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c     |   72 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   11 +-
 drivers/gpu/drm/bridge/chipone-icn6211.c           |    8 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |   10 +-
 drivers/gpu/drm/bridge/cros-ec-anx7688.c           |    8 +-
 drivers/gpu/drm/bridge/display-connector.c         |   11 +-
 drivers/gpu/drm/bridge/fsl-ldb.c                   |    7 +-
 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c     |   10 +-
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c       |    8 +-
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |   27 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |    8 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |    8 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |   11 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |   10 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |   11 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |   14 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |    7 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |   23 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |    3 +-
 drivers/gpu/drm/bridge/lvds-codec.c                |    9 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |   16 +-
 drivers/gpu/drm/bridge/microchip-lvds.c            |    8 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |    8 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |    9 +-
 drivers/gpu/drm/bridge/panel.c                     |   13 +-
 drivers/gpu/drm/bridge/parade-ps8622.c             |    8 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |    8 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              |   80 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   10 +-
 drivers/gpu/drm/bridge/sii9234.c                   |    8 +-
 drivers/gpu/drm/bridge/sil-sii8620.c               |    8 +-
 drivers/gpu/drm/bridge/simple-bridge.c             |   10 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |   23 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |    4 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |    9 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     |    9 +-
 drivers/gpu/drm/bridge/tc358762.c                  |    8 +-
 drivers/gpu/drm/bridge/tc358764.c                  |    8 +-
 drivers/gpu/drm/bridge/tc358767.c                  |   62 +-
 drivers/gpu/drm/bridge/tc358768.c                  |    8 +-
 drivers/gpu/drm/bridge/tc358775.c                  |    8 +-
 drivers/gpu/drm/bridge/thc63lvd1024.c              |    8 +-
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |    8 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   73 +-
 drivers/gpu/drm/bridge/ti-tdp158.c                 |    8 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |   10 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c              |   16 +-
 drivers/gpu/drm/ci/build-igt.sh                    |    2 +-
 drivers/gpu/drm/ci/build.sh                        |   17 +-
 drivers/gpu/drm/ci/build.yml                       |   10 +-
 drivers/gpu/drm/ci/check-devicetrees.yml           |   50 +
 drivers/gpu/drm/ci/container.yml                   |   34 +-
 drivers/gpu/drm/ci/dt-binding-check.sh             |   19 +
 drivers/gpu/drm/ci/dtbs-check.sh                   |   22 +
 drivers/gpu/drm/ci/gitlab-ci.yml                   |   56 +-
 drivers/gpu/drm/ci/igt_runner.sh                   |    1 +
 drivers/gpu/drm/ci/image-tags.yml                  |   22 +-
 drivers/gpu/drm/ci/kunit.sh                        |   16 +
 drivers/gpu/drm/ci/kunit.yml                       |   37 +
 drivers/gpu/drm/ci/lava-submit.sh                  |    6 +-
 drivers/gpu/drm/ci/setup-llvm-links.sh             |   13 +
 drivers/gpu/drm/ci/test.yml                        |   47 +-
 .../xfails/msm-sc7180-trogdor-kingoftown-skips.txt |    5 +
 .../msm-sc7180-trogdor-lazor-limozeen-skips.txt    |    5 +
 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt     |   29 -
 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt    |  139 -
 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt     |  350 --
 drivers/gpu/drm/clients/drm_client_setup.c         |    7 +
 drivers/gpu/drm/display/Kconfig                    |   13 +-
 drivers/gpu/drm/display/Makefile                   |    4 +
 drivers/gpu/drm/display/drm_bridge_connector.c     |  126 +-
 drivers/gpu/drm/display/drm_dp_aux_bus.c           |    1 +
 drivers/gpu/drm/display/drm_dp_cec.c               |    1 +
 drivers/gpu/drm/display/drm_dp_helper.c            |  139 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |    1 +
 drivers/gpu/drm/display/drm_dp_tunnel.c            |    1 +
 drivers/gpu/drm/display/drm_dsc_helper.c           |    1 +
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c    |    4 +
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c      |  193 ++
 .../gpu/drm/display/drm_hdmi_cec_notifier_helper.c |   65 +
 drivers/gpu/drm/display/drm_hdmi_helper.c          |    3 +-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  131 +-
 drivers/gpu/drm/display/drm_scdc_helper.c          |    1 +
 drivers/gpu/drm/drm_atomic.c                       |    2 +-
 drivers/gpu/drm/drm_atomic_helper.c                |  161 +-
 drivers/gpu/drm/drm_atomic_state_helper.c          |    1 +
 drivers/gpu/drm/drm_atomic_uapi.c                  |    1 +
 drivers/gpu/drm/drm_auth.c                         |   65 +-
 drivers/gpu/drm/drm_bridge.c                       |   49 +-
 drivers/gpu/drm/drm_bridge_helper.c                |    2 +
 drivers/gpu/drm/drm_buddy.c                        |    1 +
 drivers/gpu/drm/drm_client.c                       |   36 +-
 drivers/gpu/drm/drm_client_event.c                 |    1 +
 drivers/gpu/drm/drm_client_modeset.c               |    2 +
 drivers/gpu/drm/drm_color_mgmt.c                   |  210 ++
 drivers/gpu/drm/drm_connector.c                    |   44 +-
 drivers/gpu/drm/drm_damage_helper.c                |    2 +
 drivers/gpu/drm/drm_debugfs.c                      |  128 +-
 drivers/gpu/drm/drm_debugfs_crc.c                  |    1 +
 drivers/gpu/drm/drm_drv.c                          |   38 +-
 drivers/gpu/drm/drm_edid.c                         |  252 +-
 drivers/gpu/drm/drm_exec.c                         |    2 +
 drivers/gpu/drm/drm_fb_dma_helper.c                |    2 +
 drivers/gpu/drm/drm_fb_helper.c                    |    1 +
 drivers/gpu/drm/drm_fbdev_dma.c                    |    1 +
 drivers/gpu/drm/drm_fbdev_shmem.c                  |    1 +
 drivers/gpu/drm/drm_fbdev_ttm.c                    |    1 +
 drivers/gpu/drm/drm_file.c                         |   18 +-
 drivers/gpu/drm/drm_flip_work.c                    |    1 +
 drivers/gpu/drm/drm_format_helper.c                |  315 +-
 drivers/gpu/drm/drm_format_internal.h              |   16 +-
 drivers/gpu/drm/drm_fourcc.c                       |   45 +-
 drivers/gpu/drm/drm_framebuffer.c                  |   27 +-
 drivers/gpu/drm/drm_gem.c                          |   47 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c            |    1 +
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |   48 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |   61 +
 drivers/gpu/drm/drm_gem_ttm_helper.c               |    1 +
 drivers/gpu/drm/drm_gem_vram_helper.c              |   80 +-
 drivers/gpu/drm/drm_gpusvm.c                       |  797 +----
 drivers/gpu/drm/drm_gpuvm.c                        |  133 +-
 drivers/gpu/drm/drm_internal.h                     |   10 +-
 drivers/gpu/drm/drm_managed.c                      |    1 +
 drivers/gpu/drm/drm_mipi_dbi.c                     |    9 +-
 drivers/gpu/drm/drm_mipi_dsi.c                     |    1 +
 drivers/gpu/drm/drm_mode_config.c                  |    1 +
 drivers/gpu/drm/drm_modeset_helper.c               |    6 +-
 drivers/gpu/drm/drm_modeset_lock.c                 |    2 +
 drivers/gpu/drm/drm_pagemap.c                      |  838 +++++
 drivers/gpu/drm/drm_panel.c                        |   52 +-
 drivers/gpu/drm/drm_panel_backlight_quirks.c       |    1 +
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |    1 +
 drivers/gpu/drm/drm_panic.c                        |    1 +
 drivers/gpu/drm/drm_panic_qr.rs                    |    2 +-
 drivers/gpu/drm/drm_pci.c                          |    1 -
 drivers/gpu/drm/drm_plane.c                        |    1 +
 drivers/gpu/drm/drm_plane_helper.c                 |    1 +
 drivers/gpu/drm/drm_prime.c                        |   58 +-
 drivers/gpu/drm/drm_print.c                        |    1 +
 drivers/gpu/drm/drm_privacy_screen.c               |    1 +
 drivers/gpu/drm/drm_self_refresh_helper.c          |    1 +
 drivers/gpu/drm/drm_simple_kms_helper.c            |    1 +
 drivers/gpu/drm/drm_suballoc.c                     |    2 +
 drivers/gpu/drm/drm_syncobj.c                      |    1 +
 drivers/gpu/drm/drm_vblank_work.c                  |    2 +
 drivers/gpu/drm/drm_vma_manager.c                  |    1 +
 drivers/gpu/drm/drm_writeback.c                    |    1 +
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |    2 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |   14 +-
 drivers/gpu/drm/exynos/exynos_drm_fb.c             |    7 +-
 drivers/gpu/drm/exynos/exynos_drm_fb.h             |    1 +
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |    5 +-
 drivers/gpu/drm/gma500/fbdev.c                     |    5 +-
 drivers/gpu/drm/gma500/framebuffer.c               |   14 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |    1 +
 drivers/gpu/drm/gud/gud_pipe.c                     |    9 +-
 drivers/gpu/drm/hyperv/hyperv_drm.h                |    4 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c        |  210 +-
 drivers/gpu/drm/i915/Makefile                      |   12 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |    1 +
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |    1 +
 drivers/gpu/drm/i915/display/hsw_ips.c             |   16 +-
 drivers/gpu/drm/i915/display/i9xx_display_sr.c     |    2 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |   38 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c             |   36 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |   11 +-
 drivers/gpu/drm/i915/display/icl_dsi_regs.h        |    1 +
 drivers/gpu/drm/i915/display/intel_alpm.c          |   70 +-
 drivers/gpu/drm/i915/display/intel_alpm.h          |    4 +
 drivers/gpu/drm/i915/display/intel_atomic.c        |    6 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |    2 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |    2 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |    9 +-
 drivers/gpu/drm/i915/display/intel_bo.c            |   17 +
 drivers/gpu/drm/i915/display/intel_bo.h            |    5 +
 drivers/gpu/drm/i915/display/intel_bw.c            |  239 +-
 drivers/gpu/drm/i915/display/intel_bw.h            |   53 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  204 +-
 drivers/gpu/drm/i915/display/intel_cdclk.h         |   50 +-
 drivers/gpu/drm/i915/display/intel_cmtg.c          |    4 +-
 drivers/gpu/drm/i915/display/intel_cmtg_regs.h     |    2 +-
 drivers/gpu/drm/i915/display/intel_color.c         |   73 +-
 drivers/gpu/drm/i915/display/intel_color.h         |    2 +
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |    2 +-
 .../gpu/drm/i915/display/intel_combo_phy_regs.h    |    2 +-
 drivers/gpu/drm/i915/display/intel_connector.c     |   30 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |    3 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |    7 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |   11 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |   41 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |    2 +
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |    5 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  101 +-
 drivers/gpu/drm/i915/display/intel_ddi.h           |    6 +-
 drivers/gpu/drm/i915/display/intel_de.h            |   20 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  196 +-
 drivers/gpu/drm/i915/display/intel_display.h       |   26 +-
 .../drm/i915/display/intel_display_conversion.c    |    3 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |   26 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   13 +-
 .../gpu/drm/i915/display/intel_display_device.c    |   12 +-
 .../gpu/drm/i915/display/intel_display_device.h    |    8 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |   51 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |   24 +-
 .../gpu/drm/i915/display/intel_display_params.c    |    3 +
 .../gpu/drm/i915/display/intel_display_params.h    |    1 +
 drivers/gpu/drm/i915/display/intel_display_power.c |   22 +-
 .../gpu/drm/i915/display/intel_display_power_map.c |    4 +-
 .../drm/i915/display/intel_display_power_well.c    |  116 +-
 drivers/gpu/drm/i915/display/intel_display_regs.h  | 2932 ++++++++++++++++
 drivers/gpu/drm/i915/display/intel_display_reset.c |    1 +
 drivers/gpu/drm/i915/display/intel_display_rpm.c   |    1 +
 drivers/gpu/drm/i915/display/intel_display_rps.c   |    4 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   46 +-
 drivers/gpu/drm/i915/display/intel_display_wa.c    |    1 +
 drivers/gpu/drm/i915/display/intel_dkl_phy.c       |    4 +-
 drivers/gpu/drm/i915/display/intel_dkl_phy_regs.h  |    3 +
 drivers/gpu/drm/i915/display/intel_dmc.c           |  537 ++-
 drivers/gpu/drm/i915/display/intel_dmc.h           |   20 +-
 drivers/gpu/drm/i915/display/intel_dmc_regs.h      |  489 ++-
 drivers/gpu/drm/i915/display/intel_dmc_wl.c        |    6 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |   79 +-
 drivers/gpu/drm/i915/display/intel_dp.h            |    7 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |    3 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |  144 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |   22 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   94 +-
 drivers/gpu/drm/i915/display/intel_dp_test.c       |    2 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |  203 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |  197 +-
 drivers/gpu/drm/i915/display/intel_dpll.h          |    4 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  539 ++-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |   80 +-
 drivers/gpu/drm/i915/display/intel_dpt.c           |    3 +-
 drivers/gpu/drm/i915/display/intel_dpt_common.c    |    2 +-
 drivers/gpu/drm/i915/display/intel_drrs.c          |    9 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |  248 +-
 drivers/gpu/drm/i915/display/intel_dsb.h           |    9 +-
 drivers/gpu/drm/i915/display/intel_dsb_regs.h      |    2 +
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |    3 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |    2 +-
 drivers/gpu/drm/i915/display/intel_encoder.c       |    7 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |   29 +-
 drivers/gpu/drm/i915/display/intel_fb.h            |    5 +-
 drivers/gpu/drm/i915/display/intel_fb_bo.c         |    1 +
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |    8 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.h        |    2 +
 drivers/gpu/drm/i915/display/intel_fbc.c           |   10 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |    5 +
 drivers/gpu/drm/i915/display/intel_fbdev.h         |    6 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c      |    7 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |    3 +-
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |    1 +
 drivers/gpu/drm/i915/display/intel_flipq.c         |  472 +++
 drivers/gpu/drm/i915/display/intel_flipq.h         |   37 +
 drivers/gpu/drm/i915/display/intel_gmbus.c         |    3 +-
 drivers/gpu/drm/i915/display/intel_gmbus_regs.h    |    2 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   28 +-
 drivers/gpu/drm/i915/display/intel_hdcp_regs.h     |    4 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |    3 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |   19 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |    1 +
 drivers/gpu/drm/i915/display/intel_hti_regs.h      |    2 +-
 drivers/gpu/drm/i915/display/intel_link_bw.c       |  239 +-
 drivers/gpu/drm/i915/display/intel_link_bw.h       |    2 +
 drivers/gpu/drm/i915/display/intel_lspcon.c        |    2 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |    3 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |   13 +-
 .../gpu/drm/i915/display/intel_modeset_verify.c    |    4 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |    8 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |    2 +
 drivers/gpu/drm/i915/display/intel_panel.c         |  132 +
 drivers/gpu/drm/i915/display/intel_panel.h         |    6 +
 drivers/gpu/drm/i915/display/intel_pch_display.c   |   21 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |  154 +-
 drivers/gpu/drm/i915/display/intel_pfit.c          |    2 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |    2 +-
 .../{intel_atomic_plane.c =3D> intel_plane.c}        |  200 +-
 .../{intel_atomic_plane.h =3D> intel_plane.h}        |   22 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.c |    6 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c      |   43 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |    8 +-
 drivers/gpu/drm/i915/display/intel_pps_regs.h      |   15 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  110 +-
 drivers/gpu/drm/i915/display/intel_psr.h           |    4 +
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |   10 +
 drivers/gpu/drm/i915/display/intel_sbi.c           |   90 +
 drivers/gpu/drm/i915/display/intel_sbi.h           |   27 +
 drivers/gpu/drm/i915/display/intel_sbi_regs.h      |   65 +
 drivers/gpu/drm/i915/display/intel_sdvo.c          |    2 +-
 drivers/gpu/drm/i915/display/intel_snps_hdmi_pll.c |    8 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |    2 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |   14 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |    1 +
 drivers/gpu/drm/i915/display/intel_tv.c            |    2 +-
 drivers/gpu/drm/i915/display/intel_vblank.c        |    2 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |    2 +-
 drivers/gpu/drm/i915/display/intel_vga.c           |    1 -
 drivers/gpu/drm/i915/display/intel_vrr.c           |   25 +-
 drivers/gpu/drm/i915/display/intel_vrr_regs.h      |  119 +-
 drivers/gpu/drm/i915/display/skl_scaler.c          |   19 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   39 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |  467 ++-
 drivers/gpu/drm/i915/display/skl_watermark.h       |   33 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   38 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |   46 +-
 drivers/gpu/drm/i915/display/vlv_sideband.c        |   50 +
 drivers/gpu/drm/i915/display/vlv_sideband.h        |  156 +
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |    1 -
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |    6 +
 .../gpu/drm/i915/gem/i915_gem_object_frontbuffer.h |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |  142 +
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |    7 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |    1 +
 drivers/gpu/drm/i915/gt/intel_engine.h             |   31 +
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |    2 +-
 drivers/gpu/drm/i915/gt/intel_gsc.c                |    2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |    6 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |    8 +-
 drivers/gpu/drm/i915/gt/intel_gt_requests.c        |   10 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |    7 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |    3 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |   62 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |    7 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |    2 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |    8 +-
 drivers/gpu/drm/i915/gvt/display.c                 |   12 +-
 drivers/gpu/drm/i915/gvt/display.h                 |   13 -
 drivers/gpu/drm/i915/gvt/edid.c                    |    1 +
 drivers/gpu/drm/i915/gvt/fb_decoder.c              |    8 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |   40 +-
 drivers/gpu/drm/i915/gvt/interrupt.c               |    1 +
 drivers/gpu/drm/i915/gvt/mmio.c                    |    1 +
 drivers/gpu/drm/i915/i915_driver.c                 |   75 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   67 +-
 drivers/gpu/drm/i915/i915_gem.h                    |    2 +
 drivers/gpu/drm/i915/i915_getparam.c               |    2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |    2 +-
 drivers/gpu/drm/i915/i915_irq.c                    |  156 +-
 drivers/gpu/drm/i915/i915_pci.c                    |    1 -
 drivers/gpu/drm/i915/i915_pmu.c                    |    6 +-
 drivers/gpu/drm/i915/i915_reg.h                    | 2977 +---------------
 drivers/gpu/drm/i915/i915_request.c                |    7 +-
 drivers/gpu/drm/i915/i915_sw_fence.c               |   10 +-
 drivers/gpu/drm/i915/i915_switcheroo.c             |    2 +
 drivers/gpu/drm/i915/i915_vma.c                    |   20 +
 drivers/gpu/drm/i915/i915_vma.h                    |   27 +-
 drivers/gpu/drm/i915/intel_clock_gating.c          |    6 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |    3 +
 drivers/gpu/drm/i915/intel_pcode.c                 |   29 +-
 drivers/gpu/drm/i915/intel_pcode.h                 |   15 +-
 drivers/gpu/drm/i915/intel_sbi.c                   |   94 -
 drivers/gpu/drm/i915/intel_sbi.h                   |   27 -
 drivers/gpu/drm/i915/intel_uncore.c                |    8 +-
 drivers/gpu/drm/i915/intel_uncore.h                |    5 +-
 drivers/gpu/drm/i915/selftests/i915_request.c      |   20 +-
 .../gpu/drm/i915/selftests/intel_memory_region.c   |   14 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |   12 +-
 drivers/gpu/drm/i915/selftests/mock_request.c      |    2 +-
 drivers/gpu/drm/i915/soc/intel_dram.c              |   92 +-
 drivers/gpu/drm/i915/soc/intel_dram.h              |   26 +-
 drivers/gpu/drm/i915/soc/intel_gmch.c              |    2 +
 .../gpu/drm/i915/{vlv_sideband.c =3D> vlv_iosf_sb.c} |  190 +-
 drivers/gpu/drm/i915/vlv_iosf_sb.h                 |   37 +
 .../i915/{vlv_sideband_reg.h =3D> vlv_iosf_sb_reg.h} |    6 +-
 drivers/gpu/drm/i915/vlv_sideband.h                |  125 -
 drivers/gpu/drm/imagination/pvr_job.c              |    2 +-
 drivers/gpu/drm/imagination/pvr_power.c            |   59 +-
 drivers/gpu/drm/imagination/pvr_queue.c            |    9 +-
 drivers/gpu/drm/imagination/pvr_queue.h            |    2 +-
 drivers/gpu/drm/imx/Kconfig                        |    1 +
 drivers/gpu/drm/imx/Makefile                       |    1 +
 drivers/gpu/drm/imx/dc/Kconfig                     |   13 +
 drivers/gpu/drm/imx/dc/Makefile                    |    7 +
 drivers/gpu/drm/imx/dc/dc-cf.c                     |  172 +
 drivers/gpu/drm/imx/dc/dc-crtc.c                   |  555 +++
 drivers/gpu/drm/imx/dc/dc-de.c                     |  177 +
 drivers/gpu/drm/imx/dc/dc-de.h                     |   59 +
 drivers/gpu/drm/imx/dc/dc-drv.c                    |  293 ++
 drivers/gpu/drm/imx/dc/dc-drv.h                    |  102 +
 drivers/gpu/drm/imx/dc/dc-ed.c                     |  288 ++
 drivers/gpu/drm/imx/dc/dc-fg.c                     |  376 ++
 drivers/gpu/drm/imx/dc/dc-fl.c                     |  185 +
 drivers/gpu/drm/imx/dc/dc-fu.c                     |  258 ++
 drivers/gpu/drm/imx/dc/dc-fu.h                     |  129 +
 drivers/gpu/drm/imx/dc/dc-fw.c                     |  222 ++
 drivers/gpu/drm/imx/dc/dc-ic.c                     |  282 ++
 drivers/gpu/drm/imx/dc/dc-kms.c                    |  143 +
 drivers/gpu/drm/imx/dc/dc-kms.h                    |  131 +
 drivers/gpu/drm/imx/dc/dc-lb.c                     |  325 ++
 drivers/gpu/drm/imx/dc/dc-pe.c                     |  158 +
 drivers/gpu/drm/imx/dc/dc-pe.h                     |  101 +
 drivers/gpu/drm/imx/dc/dc-plane.c                  |  224 ++
 drivers/gpu/drm/imx/dc/dc-tc.c                     |  141 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |    5 +-
 drivers/gpu/drm/lib/drm_random.c                   |    1 +
 drivers/gpu/drm/lima/lima_gem.c                    |    2 +-
 drivers/gpu/drm/lima/lima_sched.c                  |   12 +-
 drivers/gpu/drm/lima/lima_sched.h                  |    3 +-
 drivers/gpu/drm/lima/lima_trace.h                  |    6 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   11 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |    8 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    5 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |    8 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   11 +-
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |   10 +-
 drivers/gpu/drm/meson/meson_encoder_dsi.c          |   10 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |   10 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |    8 +-
 drivers/gpu/drm/mgag200/mgag200_g200er.c           |    4 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c           |    4 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c           |    4 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c             |   82 +-
 drivers/gpu/drm/msm/Kconfig                        |   36 +-
 drivers/gpu/drm/msm/Makefile                       |   26 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   25 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c           |   10 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   17 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   17 +-
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c          |    4 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   44 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c            |    2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c          |   10 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   48 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   30 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |    2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  205 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |    4 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |    8 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |    2 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          |   12 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |   82 +-
 .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  |    4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  154 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   69 +-
 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |   49 +-
 .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    |  494 +++
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |    2 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |    2 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |    2 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |    7 -
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |    7 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |    7 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |    4 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |   17 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h |   11 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |   39 +-
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |   44 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |   29 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |   19 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |   16 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |   38 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |   14 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |    5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |   16 +-
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |    5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |    6 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |   40 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |   22 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |   46 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |   43 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |   49 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |   43 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   |   43 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |   48 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   61 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   22 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |    3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   19 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |   20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |    3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   71 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  103 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  147 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   21 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |   21 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |    3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     |    5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |   10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |    5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |  224 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   21 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |    5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |    4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |    6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |   11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   65 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   25 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |    2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |    2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |   15 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |   41 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |    2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |   18 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |    6 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   36 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |   18 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c  |   12 +-
 drivers/gpu/drm/msm/dp/dp_audio.c                  |  138 +-
 drivers/gpu/drm/msm/dp/dp_audio.h                  |   15 +-
 drivers/gpu/drm/msm/dp/dp_aux.c                    |  216 +-
 drivers/gpu/drm/msm/dp/dp_aux.h                    |   15 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                | 1298 -------
 drivers/gpu/drm/msm/dp/dp_catalog.h                |  113 -
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  607 +++-
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   17 +-
 drivers/gpu/drm/msm/dp/dp_debug.c                  |    5 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |  163 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |    3 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |    1 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  258 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |   13 +-
 drivers/gpu/drm/msm/dp/dp_reg.h                    |   19 +
 drivers/gpu/drm/msm/dsi/dsi.c                      |    4 +-
 drivers/gpu/drm/msm/dsi/dsi.h                      |    2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   14 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |    1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |   75 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |    2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |    1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         |    7 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |   79 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |    9 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |   10 +-
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c              |    8 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |    2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c                |    4 +-
 drivers/gpu/drm/msm/msm_debugfs.c                  |  129 +-
 drivers/gpu/drm/msm/msm_drv.c                      |  381 +--
 drivers/gpu/drm/msm/msm_drv.h                      |   87 +-
 drivers/gpu/drm/msm/msm_fb.c                       |   51 +-
 drivers/gpu/drm/msm/msm_fbdev.c                    |    2 +-
 drivers/gpu/drm/msm/msm_gem.c                      |  538 ++-
 drivers/gpu/drm/msm/msm_gem.h                      |  298 +-
 drivers/gpu/drm/msm/msm_gem_prime.c                |   65 +
 drivers/gpu/drm/msm/msm_gem_shrinker.c             |  104 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |  335 +-
 drivers/gpu/drm/msm/msm_gem_vma.c                  | 1526 ++++++++-
 drivers/gpu/drm/msm/msm_gpu.c                      |  230 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |  153 +-
 drivers/gpu/drm/msm/msm_gpu_trace.h                |   14 +
 drivers/gpu/drm/msm/msm_iommu.c                    |  314 +-
 drivers/gpu/drm/msm/msm_kms.c                      |   59 +-
 drivers/gpu/drm/msm/msm_kms.h                      |   48 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |  341 +-
 drivers/gpu/drm/msm/msm_mdss.h                     |   28 -
 drivers/gpu/drm/msm/msm_mmu.h                      |   40 +-
 drivers/gpu/drm/msm/msm_rd.c                       |   62 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c               |   10 +-
 drivers/gpu/drm/msm/msm_submitqueue.c              |   96 +-
 drivers/gpu/drm/msm/msm_syncobj.c                  |  172 +
 drivers/gpu/drm/msm/msm_syncobj.h                  |   37 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      | 3576 ++++------------=
----
 .../drm/msm/registers/adreno/a6xx_descriptors.xml  |  198 ++
 .../gpu/drm/msm/registers/adreno/a6xx_enums.xml    |  383 +++
 .../drm/msm/registers/adreno/a6xx_perfcntrs.xml    |  600 ++++
 .../gpu/drm/msm/registers/adreno/a7xx_enums.xml    |  223 ++
 .../drm/msm/registers/adreno/a7xx_perfcntrs.xml    | 1030 ++++++
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  305 +-
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |   14 +
 drivers/gpu/drm/msm/registers/gen_header.py        |    8 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |    9 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |    2 +-
 drivers/gpu/drm/nouveau/nouveau_backlight.c        |    7 +-
 drivers/gpu/drm/nouveau/nouveau_display.c          |    8 +-
 drivers/gpu/drm/nouveau/nouveau_display.h          |    1 +
 drivers/gpu/drm/nouveau/nouveau_exec.c             |    2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |  107 +-
 drivers/gpu/drm/nouveau/nouveau_fence.h            |    7 +
 drivers/gpu/drm/nouveau/nouveau_sched.c            |   40 +-
 drivers/gpu/drm/nouveau/nouveau_sched.h            |    9 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             |    8 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c    |    2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c |    2 +-
 drivers/gpu/drm/omapdrm/dss/dispc.c                |    2 +-
 drivers/gpu/drm/omapdrm/dss/dpi.c                  |    7 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c                  |    7 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                |   26 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                |   26 +-
 drivers/gpu/drm/omapdrm/dss/sdi.c                  |   25 +-
 drivers/gpu/drm/omapdrm/dss/venc.c                 |   23 +-
 drivers/gpu/drm/omapdrm/omap_fb.c                  |   10 +-
 drivers/gpu/drm/omapdrm/omap_fb.h                  |    3 +-
 drivers/gpu/drm/panel/Kconfig                      |   36 +
 drivers/gpu/drm/panel/Makefile                     |    3 +
 drivers/gpu/drm/panel/panel-boe-himax8279d.c       |   11 +-
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |   10 +-
 drivers/gpu/drm/panel/panel-edp.c                  |    8 +-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c       |   10 +-
 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c  |   11 +-
 .../gpu/drm/panel/panel-feiyang-fy07024di26a30d.c  |   10 +-
 drivers/gpu/drm/panel/panel-himax-hx83102.c        |   10 +-
 drivers/gpu/drm/panel/panel-himax-hx83112a.c       |   10 +-
 drivers/gpu/drm/panel/panel-himax-hx83112b.c       |  430 +++
 drivers/gpu/drm/panel/panel-himax-hx8394.c         |  153 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c       |   10 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       |   11 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9805.c       |   12 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9806e.c      |   10 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |  236 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c      |   10 +-
 drivers/gpu/drm/panel/panel-innolux-ej030na.c      |   11 +-
 drivers/gpu/drm/panel/panel-innolux-p079zca.c      |   11 +-
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   |   10 +-
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c       |   10 +-
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c      |   12 +-
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c     |   11 +-
 drivers/gpu/drm/panel/panel-khadas-ts050.c         |   13 +-
 drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c |   12 +-
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |   11 +-
 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c |   11 +-
 drivers/gpu/drm/panel/panel-lg-lb035q02.c          |   10 +-
 drivers/gpu/drm/panel/panel-lg-lg4573.c            |   11 +-
 drivers/gpu/drm/panel/panel-lg-sw43408.c           |   10 +-
 drivers/gpu/drm/panel/panel-lincolntech-lcd197.c   |   11 +-
 drivers/gpu/drm/panel/panel-lvds.c                 |   12 +-
 .../gpu/drm/panel/panel-magnachip-d53e6ea8966.c    |   11 +-
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c   |   11 +-
 drivers/gpu/drm/panel/panel-nec-nl8048hl11.c       |   10 +-
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c    |   11 +-
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c    |   10 +-
 drivers/gpu/drm/panel/panel-novatek-nt35510.c      |   12 +-
 drivers/gpu/drm/panel/panel-novatek-nt35560.c      |   12 +-
 drivers/gpu/drm/panel/panel-novatek-nt35950.c      |   10 +-
 drivers/gpu/drm/panel/panel-novatek-nt36523.c      |    9 +-
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c     |   10 +-
 drivers/gpu/drm/panel/panel-novatek-nt36672e.c     |   10 +-
 drivers/gpu/drm/panel/panel-novatek-nt39016.c      |   10 +-
 drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c |   11 +-
 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c   |   11 +-
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |   11 +-
 drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c |   12 +-
 .../gpu/drm/panel/panel-panasonic-vvx10f034n00.c   |   12 +-
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |   12 +-
 drivers/gpu/drm/panel/panel-raydium-rm67191.c      |   10 +-
 drivers/gpu/drm/panel/panel-raydium-rm67200.c      |   50 +-
 drivers/gpu/drm/panel/panel-raydium-rm68200.c      |   11 +-
 drivers/gpu/drm/panel/panel-raydium-rm692e5.c      |   10 +-
 drivers/gpu/drm/panel/panel-raydium-rm69380.c      |   10 +-
 drivers/gpu/drm/panel/panel-renesas-r61307.c       |  325 ++
 drivers/gpu/drm/panel/panel-renesas-r69328.c       |  281 ++
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c       |   11 +-
 drivers/gpu/drm/panel/panel-samsung-ams581vf01.c   |   10 +-
 drivers/gpu/drm/panel/panel-samsung-ams639rq08.c   |   10 +-
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c   |   11 +-
 drivers/gpu/drm/panel/panel-samsung-db7430.c       |   11 +-
 drivers/gpu/drm/panel/panel-samsung-ld9040.c       |   11 +-
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c      |   11 +-
 drivers/gpu/drm/panel/panel-samsung-s6d27a1.c      |   11 +-
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c      |   12 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c      |   10 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      |   10 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c      |   10 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |   10 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      |    1 +
 .../drm/panel/panel-samsung-s6e88a0-ams427ap24.c   |   10 +-
 .../drm/panel/panel-samsung-s6e88a0-ams452ef01.c   |   11 +-
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c      |   12 +-
 drivers/gpu/drm/panel/panel-samsung-sofef00.c      |   11 +-
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c        |   11 +-
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c    |   11 +-
 drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c    |   10 +-
 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c    |   11 +-
 drivers/gpu/drm/panel/panel-simple.c               |   27 +
 drivers/gpu/drm/panel/panel-sitronix-st7701.c      |  132 +-
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      |   11 +-
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c     |   10 +-
 drivers/gpu/drm/panel/panel-sony-acx565akm.c       |   10 +-
 drivers/gpu/drm/panel/panel-sony-td4353-jdi.c      |   11 +-
 .../gpu/drm/panel/panel-sony-tulip-truly-nt35521.c |   11 +-
 drivers/gpu/drm/panel/panel-summit.c               |   10 +-
 drivers/gpu/drm/panel/panel-synaptics-r63353.c     |   11 +-
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c       |   11 +-
 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c       |   10 +-
 drivers/gpu/drm/panel/panel-tpo-tpg110.c           |   11 +-
 drivers/gpu/drm/panel/panel-visionox-r66451.c      |    9 +-
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     |  257 +-
 drivers/gpu/drm/panel/panel-visionox-rm692e5.c     |   10 +-
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c    |   11 +-
 drivers/gpu/drm/panel/panel-widechips-ws2401.c     |   11 +-
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   |   10 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c        |    4 +-
 drivers/gpu/drm/panfrost/panfrost_device.c         |    5 +
 drivers/gpu/drm/panfrost/panfrost_device.h         |   15 +
 drivers/gpu/drm/panfrost/panfrost_drv.c            |  142 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c            |  186 +
 drivers/gpu/drm/panfrost/panfrost_gem.h            |   66 +
 drivers/gpu/drm/panfrost/panfrost_job.c            |   10 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c        |    2 +
 drivers/gpu/drm/panthor/panthor_device.h           |   89 +
 drivers/gpu/drm/panthor/panthor_drv.c              |   63 +-
 drivers/gpu/drm/panthor/panthor_fw.c               |    9 +-
 drivers/gpu/drm/panthor/panthor_gem.c              |   31 +-
 drivers/gpu/drm/panthor/panthor_gem.h              |    3 -
 drivers/gpu/drm/panthor/panthor_gpu.c              |  160 +-
 drivers/gpu/drm/panthor/panthor_gpu.h              |   12 +-
 drivers/gpu/drm/panthor/panthor_mmu.c              |   49 +-
 drivers/gpu/drm/panthor/panthor_mmu.h              |    1 -
 drivers/gpu/drm/panthor/panthor_regs.h             |   90 +-
 drivers/gpu/drm/panthor/panthor_sched.c            |    7 +-
 drivers/gpu/drm/panthor/panthor_sched.h            |    3 +-
 drivers/gpu/drm/qxl/qxl_display.c                  |    3 +-
 drivers/gpu/drm/radeon/evergreen_cs.c              |   98 +-
 drivers/gpu/drm/radeon/radeon_device.c             |   23 +-
 drivers/gpu/drm/radeon/radeon_display.c            |    3 +-
 drivers/gpu/drm/radeon/radeon_drv.c                |    3 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c              |    3 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c      |    3 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h    |    2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |    8 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |    8 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c       |   11 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c   |   44 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c       |    3 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c     |  355 +-
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h    |   56 +-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c   |    3 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |  291 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.h             |    8 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |   16 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |  452 ++-
 drivers/gpu/drm/rockchip/inno_hdmi.h               |  349 --
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c         |   20 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |   29 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |   33 +
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |   68 +-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |   89 +-
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h    |  103 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |   26 +-
 drivers/gpu/drm/scheduler/sched_fence.c            |    6 +-
 drivers/gpu/drm/scheduler/sched_internal.h         |    2 +-
 drivers/gpu/drm/scheduler/sched_main.c             |  203 +-
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c   |  109 +-
 drivers/gpu/drm/scheduler/tests/sched_tests.h      |    3 +-
 drivers/gpu/drm/scheduler/tests/tests_basic.c      |   93 +-
 drivers/gpu/drm/sitronix/Kconfig                   |   10 -
 drivers/gpu/drm/sitronix/st7571-i2c.c              |   95 +-
 drivers/gpu/drm/sti/sti_dvo.c                      |   29 +-
 drivers/gpu/drm/sti/sti_hda.c                      |   27 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |   26 +-
 drivers/gpu/drm/sti/sti_hdmi.h                     |    2 +
 drivers/gpu/drm/stm/lvds.c                         |    7 +-
 drivers/gpu/drm/sun4i/sun8i_csc.c                  |    4 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c                |  168 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.h                |   31 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |   27 +-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c            |    2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |   14 +-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c            |    6 +-
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h           |    4 +
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c          |  138 +
 drivers/gpu/drm/sysfb/efidrm.c                     |    6 +-
 drivers/gpu/drm/sysfb/ofdrm.c                      |   85 +-
 drivers/gpu/drm/sysfb/simpledrm.c                  |    5 +-
 drivers/gpu/drm/sysfb/vesadrm.c                    |  106 +-
 drivers/gpu/drm/tegra/drm.h                        |    2 +
 drivers/gpu/drm/tegra/fb.c                         |    7 +-
 drivers/gpu/drm/tegra/fbdev.c                      |    4 +-
 drivers/gpu/drm/tegra/gem.c                        |    4 +-
 drivers/gpu/drm/tests/Makefile                     |    3 +-
 drivers/gpu/drm/tests/drm_bridge_test.c            |  176 +-
 drivers/gpu/drm/tests/drm_format_helper_test.c     |  266 +-
 drivers/gpu/drm/tests/drm_framebuffer_test.c       |    1 +
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  651 +++-
 drivers/gpu/drm/tests/drm_kunit_edid.h             |  374 +-
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |    1 +
 drivers/gpu/drm/tests/drm_sysfb_modeset_test.c     |  168 +
 drivers/gpu/drm/tidss/Makefile                     |    3 +-
 drivers/gpu/drm/tidss/tidss_crtc.c                 |    4 +-
 drivers/gpu/drm/tidss/tidss_dispc.c                |  287 +-
 drivers/gpu/drm/tidss/tidss_dispc.h                |   20 +-
 drivers/gpu/drm/tidss/tidss_dispc_regs.h           |   29 +-
 drivers/gpu/drm/tidss/tidss_drv.c                  |   10 +
 drivers/gpu/drm/tidss/tidss_drv.h                  |    5 +
 drivers/gpu/drm/tidss/tidss_encoder.c              |   10 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |    4 +-
 drivers/gpu/drm/tidss/tidss_oldi.c                 |  598 ++++
 drivers/gpu/drm/tidss/tidss_oldi.h                 |   43 +
 drivers/gpu/drm/tidss/tidss_plane.c                |    2 +-
 drivers/gpu/drm/tiny/bochs.c                       |   19 +
 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c   |   60 +-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c      |    3 +
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c       |    3 +
 drivers/gpu/drm/ttm/ttm_agp_backend.c              |    1 +
 drivers/gpu/drm/ttm/ttm_backup.c                   |    2 +
 drivers/gpu/drm/ttm/ttm_bo.c                       |   26 +-
 drivers/gpu/drm/ttm/ttm_bo_internal.h              |   58 +
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |  232 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |    2 +
 drivers/gpu/drm/ttm/ttm_device.c                   |   24 +
 drivers/gpu/drm/ttm/ttm_execbuf_util.c             |    2 +
 drivers/gpu/drm/ttm/ttm_pool.c                     |   31 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c            |    2 +
 drivers/gpu/drm/ttm/ttm_resource.c                 |    4 +
 drivers/gpu/drm/ttm/ttm_tt.c                       |    1 +
 drivers/gpu/drm/v3d/v3d_sched.c                    |   18 +-
 drivers/gpu/drm/v3d/v3d_submit.c                   |    2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |    8 +-
 drivers/gpu/drm/vc4/vc4_kms.c                      |    3 +-
 drivers/gpu/drm/vgem/vgem_drv.c                    |   30 +-
 drivers/gpu/drm/virtio/virtgpu_display.c           |    6 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |    1 +
 drivers/gpu/drm/virtio/virtgpu_prime.c             |    3 +-
 drivers/gpu/drm/vkms/tests/Makefile                |    6 +-
 drivers/gpu/drm/vkms/tests/vkms_format_test.c      |  280 ++
 drivers/gpu/drm/vkms/vkms_crtc.c                   |    2 -
 drivers/gpu/drm/vkms/vkms_drv.c                    |   28 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |   39 +-
 drivers/gpu/drm/vkms/vkms_formats.c                |  467 ++-
 drivers/gpu/drm/vkms/vkms_formats.h                |    9 +
 drivers/gpu/drm/vkms/vkms_plane.c                  |   29 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c                |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   22 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   19 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |   29 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c              |  510 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.h              |   21 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |    5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c                |   61 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   15 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |    1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c             |    2 +-
 drivers/gpu/drm/xe/Kconfig                         |   22 +-
 drivers/gpu/drm/xe/Kconfig.debug                   |   11 +-
 drivers/gpu/drm/xe/Makefile                        |   20 +-
 drivers/gpu/drm/xe/abi/guc_actions_abi.h           |   35 +
 drivers/gpu/drm/xe/abi/guc_errors_abi.h            |   14 +-
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h              |   28 +
 .../gpu/drm/xe/compat-i915-headers/intel_pcode.h   |   31 -
 .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |   12 +-
 .../gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h   |   42 +
 .../{vlv_sideband_reg.h =3D> vlv_iosf_sb_reg.h}      |    2 +-
 .../gpu/drm/xe/compat-i915-headers/vlv_sideband.h  |  132 -
 drivers/gpu/drm/xe/display/intel_bo.c              |   91 +
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c        |    7 +-
 drivers/gpu/drm/xe/display/xe_display.c            |   99 +-
 drivers/gpu/drm/xe/display/xe_display.h            |    4 -
 drivers/gpu/drm/xe/display/xe_display_rpm.c        |    4 +-
 drivers/gpu/drm/xe/display/xe_display_wa.c         |    2 +-
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c         |   11 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |   66 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c           |    2 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |   13 +-
 drivers/gpu/drm/xe/display/xe_tdf.c                |    4 +-
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h              |    4 +
 drivers/gpu/drm/xe/regs/xe_i2c_regs.h              |   20 +
 drivers/gpu/drm/xe/regs/xe_irq_regs.h              |    1 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h            |    7 +
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h           |    1 +
 drivers/gpu/drm/xe/regs/xe_oa_regs.h               |    3 +
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h            |    2 -
 drivers/gpu/drm/xe/regs/xe_pmt.h                   |    7 +-
 drivers/gpu/drm/xe/regs/xe_regs.h                  |    2 +
 drivers/gpu/drm/xe/tests/xe_bo.c                   |    6 +-
 .../gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c |  232 --
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c        |   13 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c              |   52 +-
 drivers/gpu/drm/xe/tests/xe_pci.c                  |  100 +-
 drivers/gpu/drm/xe/tests/xe_pci_test.c             |   28 +-
 drivers/gpu/drm/xe/tests/xe_pci_test.h             |   12 +-
 .../gpu/drm/xe/tests/xe_sriov_pf_service_kunit.c   |  227 ++
 drivers/gpu/drm/xe/xe_bb.c                         |    2 +-
 drivers/gpu/drm/xe/xe_bb.h                         |    2 +-
 drivers/gpu/drm/xe/xe_bo.c                         |  121 +-
 drivers/gpu/drm/xe/xe_bo.h                         |   20 +-
 drivers/gpu/drm/xe/xe_bo_evict.c                   |    4 +-
 drivers/gpu/drm/xe/xe_bo_types.h                   |    4 +-
 drivers/gpu/drm/xe/xe_configfs.c                   |  160 +
 drivers/gpu/drm/xe/xe_configfs.h                   |   11 +-
 drivers/gpu/drm/xe/xe_debugfs.c                    |   62 +
 drivers/gpu/drm/xe/xe_devcoredump.c                |   50 +-
 drivers/gpu/drm/xe/xe_device.c                     |  145 +-
 drivers/gpu/drm/xe/xe_device.h                     |   53 +-
 drivers/gpu/drm/xe/xe_device_sysfs.c               |  143 +-
 drivers/gpu/drm/xe/xe_device_types.h               |   83 +-
 drivers/gpu/drm/xe/xe_device_wa_oob.rules          |    2 +
 drivers/gpu/drm/xe/xe_drm_client.c                 |    2 +-
 drivers/gpu/drm/xe/xe_drv.h                        |    2 +-
 drivers/gpu/drm/xe/xe_eu_stall.c                   |    6 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                 |    2 +-
 drivers/gpu/drm/xe/xe_force_wake.c                 |    2 +-
 drivers/gpu/drm/xe/xe_gen_wa_oob.c                 |   45 +-
 drivers/gpu/drm/xe/xe_ggtt.c                       |  268 +-
 drivers/gpu/drm/xe/xe_ggtt.h                       |   24 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h                 |    4 +-
 drivers/gpu/drm/xe/xe_gsc.c                        |    6 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c                  |    3 +-
 drivers/gpu/drm/xe/xe_gt.c                         |  277 +-
 drivers/gpu/drm/xe/xe_gt.h                         |    6 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c                 |   96 +-
 drivers/gpu/drm/xe/xe_gt_idle.c                    |    2 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c                     |   47 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c               |  107 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c                |   19 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h                |    5 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |  158 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c        |    7 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c        |   13 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c        |  168 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.h        |    2 -
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c                |  330 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h                |    9 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h          |   33 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |   66 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h        |    4 +-
 drivers/gpu/drm/xe/xe_gt_topology.c                |   49 +-
 drivers/gpu/drm/xe/xe_gt_topology.h                |    2 -
 drivers/gpu/drm/xe/xe_gt_types.h                   |    2 +
 drivers/gpu/drm/xe/xe_guc.c                        |  166 +-
 drivers/gpu/drm/xe/xe_guc.h                        |    2 +
 drivers/gpu/drm/xe/xe_guc_ads.c                    |   34 +-
 drivers/gpu/drm/xe/xe_guc_buf.c                    |    4 -
 drivers/gpu/drm/xe/xe_guc_ct.c                     |  411 ++-
 drivers/gpu/drm/xe/xe_guc_ct.h                     |    8 +
 drivers/gpu/drm/xe/xe_guc_ct_types.h               |   15 +
 drivers/gpu/drm/xe/xe_guc_engine_activity.c        |    2 +-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h       |    2 +
 drivers/gpu/drm/xe/xe_guc_log.c                    |    2 +-
 drivers/gpu/drm/xe/xe_guc_log.h                    |    2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                     |  300 +-
 drivers/gpu/drm/xe/xe_guc_pc.h                     |    2 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h               |    2 +
 drivers/gpu/drm/xe/xe_guc_submit.c                 |   77 +-
 drivers/gpu/drm/xe/xe_heci_gsc.c                   |    5 +-
 drivers/gpu/drm/xe/xe_huc.c                        |    2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c                  |   40 +-
 drivers/gpu/drm/xe/xe_hw_engine_group.c            |   19 +-
 drivers/gpu/drm/xe/xe_hw_fence.c                   |    5 +-
 drivers/gpu/drm/xe/xe_hwmon.c                      |  264 +-
 drivers/gpu/drm/xe/xe_i2c.c                        |  329 ++
 drivers/gpu/drm/xe/xe_i2c.h                        |   62 +
 drivers/gpu/drm/xe/xe_irq.c                        |    9 +-
 drivers/gpu/drm/xe/xe_lmtt.c                       |   69 +-
 drivers/gpu/drm/xe/xe_lmtt.h                       |    1 +
 drivers/gpu/drm/xe/xe_lrc.c                        |  321 +-
 drivers/gpu/drm/xe/xe_lrc.h                        |    2 +-
 drivers/gpu/drm/xe/xe_lrc_types.h                  |    8 +-
 drivers/gpu/drm/xe/xe_map.h                        |   18 +
 drivers/gpu/drm/xe/xe_migrate.c                    |   56 +-
 drivers/gpu/drm/xe/xe_mmio.c                       |   24 +-
 drivers/gpu/drm/xe/xe_module.c                     |   40 +-
 drivers/gpu/drm/xe/xe_nvm.c                        |  167 +
 drivers/gpu/drm/xe/xe_nvm.h                        |   15 +
 drivers/gpu/drm/xe/xe_oa.c                         |  222 +-
 drivers/gpu/drm/xe/xe_oa_types.h                   |    6 +
 drivers/gpu/drm/xe/xe_pat.c                        |   44 +-
 drivers/gpu/drm/xe/xe_pci.c                        |   79 +-
 drivers/gpu/drm/xe/xe_pci_types.h                  |   41 +
 drivers/gpu/drm/xe/xe_pcode.c                      |   30 +
 drivers/gpu/drm/xe/xe_pcode.h                      |   12 +-
 drivers/gpu/drm/xe/xe_pcode_api.h                  |   15 +
 drivers/gpu/drm/xe/xe_pm.c                         |   20 +-
 drivers/gpu/drm/xe/xe_pmu.c                        |    7 +-
 drivers/gpu/drm/xe/xe_pt.c                         |  135 +-
 drivers/gpu/drm/xe/xe_pxp.c                        |  153 +-
 drivers/gpu/drm/xe/xe_query.c                      |   33 +-
 drivers/gpu/drm/xe/xe_ring_ops.c                   |   22 +-
 drivers/gpu/drm/xe/xe_rtp.c                        |   47 +-
 drivers/gpu/drm/xe/xe_rtp.h                        |   14 +-
 drivers/gpu/drm/xe/xe_rtp_types.h                  |    2 +
 drivers/gpu/drm/xe/xe_sched_job.c                  |   17 +-
 drivers/gpu/drm/xe/xe_shrinker.c                   |   45 +-
 drivers/gpu/drm/xe/xe_shrinker.h                   |    4 +-
 drivers/gpu/drm/xe/xe_sriov_pf.c                   |   61 +-
 drivers/gpu/drm/xe/xe_sriov_pf.h                   |    6 +
 drivers/gpu/drm/xe/xe_sriov_pf_service.c           |  216 ++
 drivers/gpu/drm/xe/xe_sriov_pf_service.h           |   23 +
 drivers/gpu/drm/xe/xe_sriov_pf_service_types.h     |   36 +
 drivers/gpu/drm/xe/xe_sriov_pf_types.h             |   45 +
 drivers/gpu/drm/xe/xe_sriov_types.h                |   36 -
 drivers/gpu/drm/xe/xe_sriov_vf.c                   |  181 +-
 drivers/gpu/drm/xe/xe_sriov_vf_types.h             |   41 +
 drivers/gpu/drm/xe/xe_step.c                       |    2 +
 drivers/gpu/drm/xe/xe_survivability_mode.c         |   19 +-
 drivers/gpu/drm/xe/xe_svm.c                        |  403 ++-
 drivers/gpu/drm/xe/xe_svm.h                        |  136 +
 drivers/gpu/drm/xe/xe_tile.c                       |   13 +-
 drivers/gpu/drm/xe/xe_tile.h                       |   17 +
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c              |  254 ++
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h              |   18 +
 drivers/gpu/drm/xe/xe_trace_bo.h                   |    4 +-
 drivers/gpu/drm/xe/xe_tuning.c                     |    5 +
 drivers/gpu/drm/xe/xe_uc.c                         |   78 +-
 drivers/gpu/drm/xe/xe_uc.h                         |    5 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                      |   64 +-
 drivers/gpu/drm/xe/xe_uc_fw_types.h                |    2 +
 drivers/gpu/drm/xe/xe_vm.c                         |  385 ++-
 drivers/gpu/drm/xe/xe_vm.h                         |   24 +
 drivers/gpu/drm/xe/xe_vm_types.h                   |   26 +-
 drivers/gpu/drm/xe/xe_vsec.c                       |    4 +-
 drivers/gpu/drm/xe/xe_vsec.h                       |    4 +
 drivers/gpu/drm/xe/xe_wa.c                         |  120 +-
 drivers/gpu/drm/xe/xe_wa.h                         |   22 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |   23 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c            |    3 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |   34 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |    1 -
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  |    3 +-
 drivers/gpu/nova-core/dma.rs                       |   58 +
 drivers/gpu/nova-core/driver.rs                    |    6 +-
 drivers/gpu/nova-core/falcon.rs                    |  588 ++++
 drivers/gpu/nova-core/falcon/gsp.rs                |   24 +
 drivers/gpu/nova-core/falcon/hal.rs                |   54 +
 drivers/gpu/nova-core/falcon/hal/ga102.rs          |  119 +
 drivers/gpu/nova-core/falcon/sec2.rs               |   10 +
 drivers/gpu/nova-core/fb.rs                        |  147 +
 drivers/gpu/nova-core/fb/hal.rs                    |   39 +
 drivers/gpu/nova-core/fb/hal/ga100.rs              |   57 +
 drivers/gpu/nova-core/fb/hal/ga102.rs              |   36 +
 drivers/gpu/nova-core/fb/hal/tu102.rs              |   58 +
 drivers/gpu/nova-core/firmware.rs                  |  108 +
 drivers/gpu/nova-core/firmware/fwsec.rs            |  423 +++
 drivers/gpu/nova-core/gfw.rs                       |   71 +
 drivers/gpu/nova-core/gpu.rs                       |  127 +-
 drivers/gpu/nova-core/nova_core.rs                 |    5 +
 drivers/gpu/nova-core/regs.rs                      |  303 +-
 drivers/gpu/nova-core/regs/macros.rs               |   65 +-
 drivers/gpu/nova-core/util.rs                      |   26 +
 drivers/gpu/nova-core/vbios.rs                     | 1166 +++++++
 drivers/gpu/trace/Kconfig                          |   11 +-
 drivers/i2c/busses/i2c-designware-platdrv.c        |   18 +-
 drivers/mtd/devices/Kconfig                        |   11 +
 drivers/mtd/devices/Makefile                       |    1 +
 drivers/mtd/devices/mtd_intel_dg.c                 |  830 +++++
 drivers/soc/qcom/Kconfig                           |    8 +
 drivers/soc/qcom/Makefile                          |    1 +
 drivers/soc/qcom/ubwc_config.c                     |  282 ++
 drivers/video/Kconfig                              |   18 +
 drivers/video/fbdev/c2p_iplan2.c                   |    1 +
 drivers/video/fbdev/c2p_planar.c                   |    1 +
 drivers/video/fbdev/core/Kconfig                   |   15 -
 drivers/video/fbdev/core/cfbcopyarea.c             |    2 +
 drivers/video/fbdev/core/cfbfillrect.c             |    2 +
 drivers/video/fbdev/core/cfbimgblt.c               |    2 +
 drivers/video/fbdev/core/fb_ddc.c                  |    1 +
 drivers/video/fbdev/core/fb_defio.c                |    1 +
 drivers/video/fbdev/core/fb_io_fops.c              |    1 +
 drivers/video/fbdev/core/fb_sys_fops.c             |    2 +
 drivers/video/fbdev/core/fbcmap.c                  |    1 +
 drivers/video/fbdev/core/fbcon.c                   |    5 +-
 drivers/video/fbdev/core/fbmon.c                   |    5 +-
 drivers/video/fbdev/core/modedb.c                  |    1 +
 drivers/video/fbdev/core/svgalib.c                 |    1 +
 drivers/video/fbdev/core/syscopyarea.c             |    2 +
 drivers/video/fbdev/core/sysfillrect.c             |    2 +
 drivers/video/fbdev/core/sysimgblt.c               |    2 +
 drivers/video/fbdev/cyber2000fb.c                  |   36 -
 drivers/video/fbdev/cyber2000fb.h                  |    2 -
 drivers/video/fbdev/macmodes.c                     |    3 +-
 drivers/video/fbdev/matrox/g450_pll.c              |   26 +-
 drivers/video/fbdev/matrox/matroxfb_DAC1064.c      |   47 +-
 drivers/video/fbdev/matrox/matroxfb_Ti3026.c       |    1 +
 drivers/video/fbdev/matrox/matroxfb_accel.c        |    2 +
 drivers/video/fbdev/matrox/matroxfb_base.c         |    1 +
 drivers/video/fbdev/matrox/matroxfb_g450.c         |   62 +-
 drivers/video/fbdev/matrox/matroxfb_misc.c         |   21 +-
 drivers/video/fbdev/mb862xx/mb862xx-i2c.c          |    1 -
 drivers/video/fbdev/omap/lcd_dma.c                 |    1 +
 drivers/video/fbdev/omap/lcdc.c                    |    2 +
 drivers/video/fbdev/omap/omapfb_main.c             |    2 +
 drivers/video/fbdev/omap2/omapfb/dss/apply.c       |    1 +
 drivers/video/fbdev/omap2/omapfb/dss/core.c        |    1 +
 .../video/fbdev/omap2/omapfb/dss/dispc-compat.c    |    1 +
 drivers/video/fbdev/omap2/omapfb/dss/display.c     |    1 +
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c         |    1 -
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c      |    1 +
 .../video/fbdev/omap2/omapfb/dss/dss_features.c    |    1 +
 drivers/video/fbdev/omap2/omapfb/dss/manager.c     |    1 +
 drivers/video/fbdev/omap2/omapfb/dss/output.c      |    1 +
 drivers/video/fbdev/omap2/omapfb/dss/overlay.c     |    1 +
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c         |    1 -
 drivers/video/fbdev/omap2/omapfb/dss/venc.c        |    1 +
 drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c    |    1 -
 drivers/video/fbdev/omap2/omapfb/vrfb.c            |    1 +
 drivers/video/fbdev/pxafb.c                        |   17 +-
 drivers/video/fbdev/sbuslib.c                      |    1 +
 drivers/video/fbdev/sis/sis.h                      |    2 -
 drivers/video/fbdev/sis/sis_main.c                 |   25 -
 drivers/video/fbdev/via/via-core.c                 |    1 +
 drivers/video/fbdev/via/via-gpio.c                 |    1 -
 drivers/video/fbdev/via/via_i2c.c                  |    1 +
 drivers/video/fbdev/wmt_ge_rops.c                  |    1 +
 include/drm/amd/isp.h                              |   51 +
 include/drm/display/drm_dp.h                       |   22 +-
 include/drm/display/drm_dp_helper.h                |   17 +-
 include/drm/display/drm_hdmi_audio_helper.h        |    1 +
 include/drm/display/drm_hdmi_cec_helper.h          |   72 +
 include/drm/drm_accel.h                            |    5 -
 include/drm/drm_bridge.h                           |  375 +-
 include/drm/drm_color_mgmt.h                       |   27 +
 include/drm/drm_connector.h                        |   60 +-
 include/drm/drm_debugfs.h                          |   11 +
 include/drm/drm_device.h                           |   11 +
 include/drm/drm_drv.h                              |   22 +-
 include/drm/drm_edid.h                             |    8 +
 include/drm/drm_file.h                             |    7 +
 include/drm/drm_format_helper.h                    |   19 +-
 include/drm/drm_fourcc.h                           |    3 +-
 include/drm/drm_gem.h                              |   13 +-
 include/drm/drm_gem_framebuffer_helper.h           |    6 +
 include/drm/drm_gem_shmem_helper.h                 |   11 +-
 include/drm/drm_gem_vram_helper.h                  |    2 -
 include/drm/drm_gpusvm.h                           |  101 +-
 include/drm/drm_gpuvm.h                            |    8 +
 include/drm/drm_managed.h                          |   15 +-
 include/drm/drm_mipi_dsi.h                         |    2 -
 include/drm/drm_mode_config.h                      |    3 +-
 include/drm/drm_modeset_helper.h                   |    2 +
 include/drm/drm_pagemap.h                          |  135 +
 include/drm/drm_panic.h                            |    6 +
 include/drm/drm_prime.h                            |    3 +
 include/drm/gpu_scheduler.h                        |   40 +-
 include/drm/intel/pciids.h                         |   12 +-
 include/drm/ttm/ttm_bo.h                           |   73 +-
 include/drm/ttm/ttm_device.h                       |    1 +
 include/dt-bindings/power/qcom-rpmpd.h             |    1 +
 include/linux/dma-fence.h                          |   45 +-
 include/linux/intel_dg_nvm_aux.h                   |   32 +
 include/linux/platform_data/video-pxafb.h          |    1 -
 include/linux/soc/qcom/ubwc.h                      |   75 +
 include/linux/suspend.h                            |    2 +
 include/linux/sysfb.h                              |    6 +-
 include/trace/events/dma_fence.h                   |   38 +-
 include/uapi/drm/amdgpu_drm.h                      |    2 +
 include/uapi/drm/drm_fourcc.h                      |   56 +-
 include/uapi/drm/ivpu_accel.h                      |   14 +
 include/uapi/drm/msm_drm.h                         |  149 +-
 include/uapi/drm/panfrost_drm.h                    |   21 +
 include/uapi/drm/panthor_drm.h                     |   41 +
 include/uapi/drm/xe_drm.h                          |   12 +-
 include/video/edid.h                               |    3 +-
 include/video/sisfb.h                              |    6 -
 kernel/power/hibernate.c                           |   26 +
 rust/kernel/dma.rs                                 |  199 +-
 rust/kernel/drm/device.rs                          |    2 +-
 rust/kernel/drm/driver.rs                          |    1 -
 rust/kernel/drm/file.rs                            |    8 +-
 rust/kernel/drm/gem/mod.rs                         |   16 +-
 rust/kernel/drm/ioctl.rs                           |    4 +-
 rust/kernel/error.rs                               |    1 +
 rust/kernel/sizes.rs                               |   24 +
 samples/rust/rust_dma.rs                           |   28 +-
 1620 files changed, 65290 insertions(+), 30701 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-qaic
 create mode 100644
Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performanc=
e-counter.yaml
 create mode 100644
Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blit-engine.ya=
ml
 create mode 100644
Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
 create mode 100644
Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml
 create mode 100644
Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequen=
cer.yaml
 create mode 100644
Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yam=
l
 create mode 100644
Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine=
.yaml
 create mode 100644
Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml
 create mode 100644
Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
 create mode 100644
Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
 create mode 100644
Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml
 create mode 100644
Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
 create mode 100644
Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml
 create mode 100644
Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yam=
l
 create mode 100644
Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml
 create mode 100644
Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.y=
aml
 create mode 100644
Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml
 create mode 100644
Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
 create mode 100644
Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine=
.yaml
 create mode 100644
Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml
 create mode 100644
Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml
 create mode 100644
Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
 create mode 100644
Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
 create mode 100644
Documentation/devicetree/bindings/display/sitronix,st7567.yaml
 create mode 100644
Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
 create mode 100644
Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.=
yaml
 create mode 100644 Documentation/gpu/nova/core/devinit.rst
 create mode 100644 Documentation/gpu/nova/core/falcon.rst
 create mode 100644 Documentation/gpu/nova/core/fwsec.rst
 create mode 100644 Documentation/gpu/nova/core/vbios.rst
 create mode 100644 drivers/accel/qaic/qaic_ras.c
 create mode 100644 drivers/accel/qaic/qaic_ras.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_ip.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30m_clk_mgr.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30m_clk_mgr.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30m_clk_mgr_smu_msg.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30m_clk_mgr_smu_msg.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn401/dcn401_fpu.c
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn401/dcn401_fpu.h
 create mode 100644 drivers/gpu/drm/ast/ast_2000.c
 create mode 100644 drivers/gpu/drm/ast/ast_2100.c
 create mode 100644 drivers/gpu/drm/ast/ast_2300.c
 create mode 100644 drivers/gpu/drm/ast/ast_2500.c
 create mode 100644 drivers/gpu/drm/ast/ast_2600.c
 delete mode 100644 drivers/gpu/drm/ast/ast_dram_tables.h
 create mode 100644 drivers/gpu/drm/ast/ast_post.h
 create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
 create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
 create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
 create mode 100755 drivers/gpu/drm/ci/kunit.sh
 create mode 100644 drivers/gpu/drm/ci/kunit.yml
 create mode 100755 drivers/gpu/drm/ci/setup-llvm-links.sh
 delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
 create mode 100644 drivers/gpu/drm/display/drm_hdmi_cec_helper.c
 create mode 100644 drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c
 create mode 100644 drivers/gpu/drm/drm_pagemap.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_flipq.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_flipq.h
 rename drivers/gpu/drm/i915/display/{intel_atomic_plane.c =3D>
intel_plane.c} (89%)
 rename drivers/gpu/drm/i915/display/{intel_atomic_plane.h =3D>
intel_plane.h} (86%)
 create mode 100644 drivers/gpu/drm/i915/display/intel_sbi.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_sbi.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_sbi_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/vlv_sideband.c
 create mode 100644 drivers/gpu/drm/i915/display/vlv_sideband.h
 delete mode 100644 drivers/gpu/drm/i915/intel_sbi.c
 delete mode 100644 drivers/gpu/drm/i915/intel_sbi.h
 rename drivers/gpu/drm/i915/{vlv_sideband.c =3D> vlv_iosf_sb.c} (54%)
 create mode 100644 drivers/gpu/drm/i915/vlv_iosf_sb.h
 rename drivers/gpu/drm/i915/{vlv_sideband_reg.h =3D> vlv_iosf_sb_reg.h} (9=
8%)
 delete mode 100644 drivers/gpu/drm/i915/vlv_sideband.h
 create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
 create mode 100644 drivers/gpu/drm/imx/dc/Makefile
 create mode 100644 drivers/gpu/drm/imx/dc/dc-cf.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-crtc.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-ed.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fl.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fw.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-ic.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-lb.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-plane.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.h
 delete mode 100644 drivers/gpu/drm/msm/msm_mdss.h
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.c
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.h
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_descriptors.x=
ml
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_enums.xml
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.xml
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_enums.xml
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.xml
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx83112b.c
 create mode 100644 drivers/gpu/drm/panel/panel-renesas-r61307.c
 create mode 100644 drivers/gpu/drm/panel/panel-renesas-r69328.c
 delete mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.h
 create mode 100644 drivers/gpu/drm/tests/drm_sysfb_modeset_test.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_oldi.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_oldi.h
 create mode 100644 drivers/gpu/drm/ttm/ttm_bo_internal.h
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_format_test.c
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h
 rename drivers/gpu/drm/xe/compat-i915-headers/{vlv_sideband_reg.h =3D>
vlv_iosf_sb_reg.h} (66%)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_i2c_regs.h
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_sriov_pf_service_kunit.c
 create mode 100644 drivers/gpu/drm/xe/xe_device_wa_oob.rules
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.c
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.h
 create mode 100644 drivers/gpu/drm/xe/xe_nvm.c
 create mode 100644 drivers/gpu/drm/xe/xe_nvm.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_service.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_service.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_service_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf.c
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf.h
 create mode 100644 drivers/gpu/nova-core/dma.rs
 create mode 100644 drivers/gpu/nova-core/falcon.rs
 create mode 100644 drivers/gpu/nova-core/falcon/gsp.rs
 create mode 100644 drivers/gpu/nova-core/falcon/hal.rs
 create mode 100644 drivers/gpu/nova-core/falcon/hal/ga102.rs
 create mode 100644 drivers/gpu/nova-core/falcon/sec2.rs
 create mode 100644 drivers/gpu/nova-core/fb.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/ga100.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/ga102.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/tu102.rs
 create mode 100644 drivers/gpu/nova-core/firmware/fwsec.rs
 create mode 100644 drivers/gpu/nova-core/gfw.rs
 create mode 100644 drivers/gpu/nova-core/vbios.rs
 create mode 100644 drivers/mtd/devices/mtd_intel_dg.c
 create mode 100644 drivers/soc/qcom/ubwc_config.c
 create mode 100644 include/drm/amd/isp.h
 create mode 100644 include/drm/display/drm_hdmi_cec_helper.h
 create mode 100644 include/linux/intel_dg_nvm_aux.h
 create mode 100644 include/linux/soc/qcom/ubwc.h
