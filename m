Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DC1934B75
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 12:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F9010E70E;
	Thu, 18 Jul 2024 10:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VX4DF6dS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405B910E53B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 05:40:28 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a77cb7c106dso38502666b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 22:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721281227; x=1721886027; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QlC755UUNzXE+jAHcoFwAOLmSEIPyfvfh/j0fNQJ684=;
 b=VX4DF6dSxwdxRfGTgaHfoZHc+s+3PmH7SAqQUdIkJnNVYyA9yAfvPlRVyIBLj6zaNu
 bd23NcNJFIPmFGxpvQI/p9wZoXwh8zqN8lat4FbLwo2QTVGlA6XkItLfUTAx2ZGFkiId
 qKUX4p+6+w1h7K8/IeqfgjuAKLRDdL4BsyX6LN+1LrMd0nIhuiugVjd9EvoLetRMFAbi
 zs1YOVET9yh7rMjKve3/qswrM+N0vzwe9n+oXc8tUYaOEtqlBBv6AYVB1Q5mwromf2gw
 wl4GSKNAuLPQKhu9vtmYtNjEvA26cQ4FuFAAeOH4AUCFx5OlFxqO/JX5wLCnu5brFZdp
 U2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721281227; x=1721886027;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QlC755UUNzXE+jAHcoFwAOLmSEIPyfvfh/j0fNQJ684=;
 b=vOGZ96AWDBPMmkWziiyxngTK2BV6aTruLnZZFFNljoYO8CLD2JOUcf8KTVTFncWRRd
 kQzADNY+i0oP+VK2Mc0nrXX8Oh/Ar1PZxF3Y/bgZ/zEaOrgK+viEgK/wJkrfyLCkQJqi
 I1Y/gX42h1ZQnm4idVECtsKm98n1NC7DWXWX0oRExiK6IU0KB1OkpOzQLAXYGrDgFhzH
 hvsfa9RAwiFpf1P38SMAmPpl43PrmvLktAvdNawQLBs3yoRd69pt7tSgfhd7VnpSuSid
 czHE4P3HRmlDtg5aL4cMcktsgA8fSY/avxJCQYEFDIdiNyHZRfO2K2vi4UQ2DPxo2FGR
 7FKA==
X-Gm-Message-State: AOJu0YxpvXfnHkr8dC8YwbNGX1u1LxCW0bi3aVQb2yjdmowtvNpMmkCY
 nkYg4yTs9Vu+Jf5tnzr3x6HZSAGyD/K3aPFXI/l+eQgC3t5NU5zCd7zGI0rEvbEhYBSLkbUdG0v
 L46aeQTsxvAPSZ2TH5oxJg6ofPlm3RI15
X-Google-Smtp-Source: AGHT+IG6Wsxq+WQUkOFTheVMdDyqYc7BL2zcFTrmPK/Uqz1QdTXSltr9Bul6iK26f69fivvoNIG/GLAu+ruExxC9KOM=
X-Received: by 2002:a17:906:1696:b0:a77:e55a:9e87 with SMTP id
 a640c23a62f3a-a7a01337bf6mr246218266b.48.1721281225666; Wed, 17 Jul 2024
 22:40:25 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 18 Jul 2024 15:40:08 +1000
Message-ID: <CAPM=9tzsihck03q+ooJQhTdJsuT3eQ96zF6gd5cjDwLFu_zJhA@mail.gmail.com>
Subject: [git pull] drm next for 6.11-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 18 Jul 2024 10:03:59 +0000
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

This is the main drm next pull for 6.11. It has one minor conflict
when I test merged it with your tree.

The gitlab fdo git server seems to be running a bit slow, I think
pulls should be fine, but let me know if you have any issues.

There's a lot of stuff in here, amd, i915 and xe have new platform
work, lots of core rework around EDID handling, some new COMPILE_TEST
options, maintainer changes and a lots of other stuff, summary below.

Regards,
Dave.

drm-next-2024-07-18:
drm next for 6.11-rc1:

core:
- deprecate DRM data and return 0 date
- connector: Create a set of helpers to help with HDMI support
- Remove driver owner assignments
- Allow more drivers to compile with COMPILE_TEST
- Conversions to drm_edid
- Sprinkle MODULE_DESCRIPTIONS everywhere they are missing
- Remove drm_mm_replace_node
- print: Add a drm prefix to warn level messages too, remove
         ___drm_dbg, consolidate prefix handling
- New monochrome TV mode variant

ttm:
- improve number of page faults on some platforms
- fix test builds under PREEMPT_RT
- more test coverage

ci:
- Require a more recent version of mesa,
- improve farm setup and test generation

dma-buf:
- warn if reserving 0 fence slots
- internal API heap enhancements

fbdev:
- Create memory manager optimized fbdev emulation

panic:
- Allow to select fonts,
- improve drm_fb_dma_get_scanout_buffer
- Allow to dump kmsg to the screen

bridge:
- Remove redundant checks on bridge->encoder
- Remove drm_bridge_chain_mode_fixup
- bridge-connector: Plumb in the new HDMI helper
- analogix_dp: Various improvements, handle AUX transfers timeout
- samsung-dsim: Fix timings calculation
- tc358767: Plenty of small fixes, fix no connector attach, fix clocks
- sii902x: state validation improvements

panels:
- Switch panels from register table initialization to proper code
- Now that the panel code tracks the panel state, remove every
  ad-hoc implementation in the panel drivers
- More cleanup of prepare / enable state tracking in drivers
- edp: Drop legacy panel compatibles
- simple-bridge: Switch to devm_drm_bridge_add
- New panels: Lincoln Tech Sol LCD185-101CT, Microtips Technology
  13-101HIEBCAF0-C, Microtips Technology MF-103HIEB0GA0, BOE
  nv110wum-l60, IVO t109nw41, WL-355608-A8, PrimeView PM070WL4,
  Lincoln Technologies LCD197, Ortustech COM35H3P70ULC,
  AUO G104STN01, K&d kd101ne3-40ti

amdgpu:
- DCN 4.0.x support
- GC 12.0 support
- GMC 12.0 support
- SDMA 7.0 support
- MES12 support
- MMHUB 4.1 support
- GFX12 modifier and DCC support
- lots of IP fixes/updates

amdkfd:
- Contiguous VRAM allocations
- GC 12.0 support
- SDMA 7.0 support
- SR-IOV fixes
- KFD GFX ALU exceptions

i915:
- Battlemage Xe2 HPD display enablement
- Panel Replay enabling
- DP AUX-less ALPM/LOBF
- Enable link training failure fallback for DP MST links
- CMRR (Content Match Refresh Rate) enabling
- Increase ADL-S/ADL-P/DG2+ max TMDS bitrate to 6 Gbps
- Enable eDP AUX based HDR backlight
- Support replaying GPU hangs with captured context image
- Automate CCS Mode setting during engine resets
- lots of refactoring
- Support replaying GPU hangs with captured context image
- Increase FLR timeout from 3s to 9s
- Enable w/a 16021333562 for DG2, MTL and ARL [guc]

xe:
- update MAINATINERS
- New uapi adding OA functionality to Xe
- expose l3 bank mask
- fix display detect on ADL-N
- runtime PM Fixes
- Fix silent backmerge issues
- More prep for SR-IOV
- HWmon additions
- per client usage info
- Rework GPU page fault handling
- Drop EXEC_QUEUE_FLAG_BANNED
- Add BMG PCI IDs
- Scheduler fixes and improvements
- Rename xe_exec_queue::compute to xe_exec_queue::lr
- Use ttm_uncached for BO with NEEDS_UC flag
- Rename xe perf layer as xe observation layer
- lots of refactoring

radeon:
- Backlight workaround for iMac
- Silence UBSAN flex array warnings

msm:
- Validate registers XML description against schema in CI
- core/dpu: SM7150 support
- mdp5: Add support for MSM8937
- gpu: Add param for userspace to know if raytracing is supported
- gpu: X185 support (aka gpu in X1 laptop chips)
- gpu: a505 support

ivpu:
- hardware scheduler support
- profiling support
- improvements to the platform support layer
- firmware handling improvements
- clocks/power mgmt improvements
- scheduler/logging improvements

habanalabs:
- Gradual sleep in polling memory macro.
- Reduce Gaudi2 MSI-X interrupt count to 128.
- Add Gaudi2-D revision support.
- Add timestamp to CPLD info.
- Gaudi2: Assume hard-reset by firmware upon MC SEI severe error.
- Align Gaudi2 interrupt names.
- Check for errors after preboot is ready.
- Change habanalabs maintainer and git repo path.

mgag200:
- refactoring and improvements
- Add BMC output
- enable polling

nouveau:
- add registry command line

v3d:
- perf counters improvements

zynqmp:
- irq and debugfs improvements

atmel-hlcdc:
- Support XLCDC in sam9x7

mipi-dbi:
- Remove mipi_dbi_machine_little_endian
- make SPI bits per word configurable
- support RGB888
- allow pixel formats to be specified in the DT

sun4i:
- Rework the blender setup for DE2

panfrost:
- Enable MT8188 support

vc4:
- Monochrome TV support

exynos:
- fix fallback mode regression
- fix memory leak
- Use drm_edid_duplicate() instead of kmemdup()

etnaviv:
- fix i.MX8MP NPU clock gating
- workaround FE register cdc issues on some cores
- fix DMA sync handling for cached buffers
- fix job timeout handling
- keep TS enabled on MMUv2 cores for improved performance

mediatek:
- Convert to platform remove callback returning void-
- Drop chain_mode_fixup call in mode_valid()
- Fixes the errors of MediaTek display driver found by IGT.
- Add display support for the MT8365-EVK board
- Fix bit depth overwritten for mtk_ovl_set bit_depth()
- Fix possible_crtcs calculation
- Fix spurious kfree()

ast:
- refactor mode setting code

stm:
- Add LVDS support
- DSI PHY updates
The following changes since commit 22a40d14b572deb80c0648557f4bd502d7e83826=
:

  Linux 6.10-rc6 (2024-06-30 14:40:44 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2024-07-18

for you to fetch changes up to 478a52707b0abe98aac7f8c53ccddb759be66b06:

  Merge tag 'amd-drm-next-6.11-2024-07-12' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2024-07-18
09:20:00 +1000)

----------------------------------------------------------------
drm next for 6.11-rc1:

core:
- deprecate DRM data and return 0 date
- connector: Create a set of helpers to help with HDMI support
- Remove driver owner assignments
- Allow more drivers to compile with COMPILE_TEST
- Conversions to drm_edid
- Sprinkle MODULE_DESCRIPTIONS everywhere they are missing
- Remove drm_mm_replace_node
- print: Add a drm prefix to warn level messages too, remove
         ___drm_dbg, consolidate prefix handling
- New monochrome TV mode variant

ttm:
- improve number of page faults on some platforms
- fix test builds under PREEMPT_RT
- more test coverage

ci:
- Require a more recent version of mesa,
- improve farm setup and test generation

dma-buf:
- warn if reserving 0 fence slots
- internal API heap enhancements

fbdev:
- Create memory manager optimized fbdev emulation

panic:
- Allow to select fonts,
- improve drm_fb_dma_get_scanout_buffer
- Allow to dump kmsg to the screen

bridge:
- Remove redundant checks on bridge->encoder
- Remove drm_bridge_chain_mode_fixup
- bridge-connector: Plumb in the new HDMI helper
- analogix_dp: Various improvements, handle AUX transfers timeout
- samsung-dsim: Fix timings calculation
- tc358767: Plenty of small fixes, fix no connector attach, fix clocks
- sii902x: state validation improvements

panels:
- Switch panels from register table initialization to proper code
- Now that the panel code tracks the panel state, remove every
  ad-hoc implementation in the panel drivers
- More cleanup of prepare / enable state tracking in drivers
- edp: Drop legacy panel compatibles
- simple-bridge: Switch to devm_drm_bridge_add
- New panels: Lincoln Tech Sol LCD185-101CT, Microtips Technology
  13-101HIEBCAF0-C, Microtips Technology MF-103HIEB0GA0, BOE
  nv110wum-l60, IVO t109nw41, WL-355608-A8, PrimeView PM070WL4,
  Lincoln Technologies LCD197, Ortustech COM35H3P70ULC,
  AUO G104STN01, K&d kd101ne3-40ti

amdgpu:
- DCN 4.0.x support
- GC 12.0 support
- GMC 12.0 support
- SDMA 7.0 support
- MES12 support
- MMHUB 4.1 support
- GFX12 modifier and DCC support
- lots of IP fixes/updates

amdkfd:
- Contiguous VRAM allocations
- GC 12.0 support
- SDMA 7.0 support
- SR-IOV fixes
- KFD GFX ALU exceptions

i915:
- Battlemage Xe2 HPD display enablement
- Panel Replay enabling
- DP AUX-less ALPM/LOBF
- Enable link training failure fallback for DP MST links
- CMRR (Content Match Refresh Rate) enabling
- Increase ADL-S/ADL-P/DG2+ max TMDS bitrate to 6 Gbps
- Enable eDP AUX based HDR backlight
- Support replaying GPU hangs with captured context image
- Automate CCS Mode setting during engine resets
- lots of refactoring
- Support replaying GPU hangs with captured context image
- Increase FLR timeout from 3s to 9s
- Enable w/a 16021333562 for DG2, MTL and ARL [guc]

xe:
- update MAINATINERS
- New uapi adding OA functionality to Xe
- expose l3 bank mask
- fix display detect on ADL-N
- runtime PM Fixes
- Fix silent backmerge issues
- More prep for SR-IOV
- HWmon additions
- per client usage info
- Rework GPU page fault handling
- Drop EXEC_QUEUE_FLAG_BANNED
- Add BMG PCI IDs
- Scheduler fixes and improvements
- Rename xe_exec_queue::compute to xe_exec_queue::lr
- Use ttm_uncached for BO with NEEDS_UC flag
- Rename xe perf layer as xe observation layer
- lots of refactoring

radeon:
- Backlight workaround for iMac
- Silence UBSAN flex array warnings

msm:
- Validate registers XML description against schema in CI
- core/dpu: SM7150 support
- mdp5: Add support for MSM8937
- gpu: Add param for userspace to know if raytracing is supported
- gpu: X185 support (aka gpu in X1 laptop chips)
- gpu: a505 support

ivpu:
- hardware scheduler support
- profiling support
- improvements to the platform support layer
- firmware handling improvements
- clocks/power mgmt improvements
- scheduler/logging improvements

habanalabs:
- Gradual sleep in polling memory macro.
- Reduce Gaudi2 MSI-X interrupt count to 128.
- Add Gaudi2-D revision support.
- Add timestamp to CPLD info.
- Gaudi2: Assume hard-reset by firmware upon MC SEI severe error.
- Align Gaudi2 interrupt names.
- Check for errors after preboot is ready.
- Change habanalabs maintainer and git repo path.

mgag200:
- refactoring and improvements
- Add BMC output
- enable polling

nouveau:
- add registry command line

v3d:
- perf counters improvements

zynqmp:
- irq and debugfs improvements

atmel-hlcdc:
- Support XLCDC in sam9x7

mipi-dbi:
- Remove mipi_dbi_machine_little_endian
- make SPI bits per word configurable
- support RGB888
- allow pixel formats to be specified in the DT

sun4i:
- Rework the blender setup for DE2

panfrost:
- Enable MT8188 support

vc4:
- Monochrome TV support

exynos:
- fix fallback mode regression
- fix memory leak
- Use drm_edid_duplicate() instead of kmemdup()

etnaviv:
- fix i.MX8MP NPU clock gating
- workaround FE register cdc issues on some cores
- fix DMA sync handling for cached buffers
- fix job timeout handling
- keep TS enabled on MMUv2 cores for improved performance

mediatek:
- Convert to platform remove callback returning void-
- Drop chain_mode_fixup call in mode_valid()
- Fixes the errors of MediaTek display driver found by IGT.
- Add display support for the MT8365-EVK board
- Fix bit depth overwritten for mtk_ovl_set bit_depth()
- Fix possible_crtcs calculation
- Fix spurious kfree()

ast:
- refactor mode setting code

stm:
- Add LVDS support
- DSI PHY updates

----------------------------------------------------------------
Abhinav Kumar (5):
      drm: ci: fix the xfails for apq8016
      drm/msm: remove python 3.9 dependency for compiling msm
      drm/msm/a6xx: use __unused__ to fix compiler warnings for gen7_* incl=
udes
      drm/msm/dpu: drop validity checks for clear_pending_flush() ctl op
      drm/msm/dpu: check ubwc support before adding compressed formats

Adam Ford (2):
      drm/bridge: samsung-dsim: Set P divider based on min/max of fin pll
      drm/bridge: samsung-dsim: Fix porch calcalcuation rounding

Adam Nelson (1):
      drm/amd/display: Fix 3dlut size for Fastloading on DCN401

Agustin Gutierrez (2):
      drm/amd/display: Fix DSC-re-computing
      drm/amd/display: MST DSC check for older devices

Akhil P Oommen (3):
      dt-bindings: display/msm/gmu: Add Adreno X185 GMU
      drm/msm/adreno: Add support for X185 GPU
      drm/msm/adreno: Introduce gmu_chipid for a740 & a750

Akshata Jahagirdar (1):
      drm/xe/xe2lpg: Add Wa_14021490052

Alex Bee (2):
      dt-bindings: display: rockchip,dw-mipi-dsi: Document RK3128 DSI
      drm/rockchip: dsi: Add support for RK3128

Alex Deucher (49):
      drm/amdgpu/mes12: print MES opcodes rather than numbers
      drm/amdgpu/mes12: increase mes submission timeout
      drm/amdgpu/mes12: Use a separate fence per transaction
      drm/amdkfd: don't allow mapping the MMIO HDP page with large pages
      drm/amdgpu: add nbio set_reg_remap helper
      drm/amdgpu: add set_reg_remap callback for NBIO 6.1
      drm/amdgpu: add set_reg_remap callback for NBIO 7.0
      drm/amdgpu: add set_reg_remap callback for NBIO 7.4
      drm/amdgpu: add set_reg_remap callback for NBIO 7.9
      drm/amdgpu: add set_reg_remap callback for NBIO 7.11
      drm/amdgpu: add set_reg_remap callback for NBIO 7.2
      drm/amdgpu: add set_reg_remap callback for NBIO 2.3
      drm/amdgpu: add set_reg_remap callback for NBIO 4.3
      drm/amdgpu: add set_reg_remap callback for NBIO 7.7
      drm/amdgpu: add set_reg_remap callback for NBIF 6.3.1
      drm/amdgpu/soc15: use common nbio callback to set remap offset
      drm/amdgpu/nv: use common nbio callback to set remap offset
      drm/amdgpu/soc21: use common nbio callback to set remap offset
      drm/amdgpu: fix documentation errors in sdma v7.0
      drm/amdgpu: fix documentation errors in gmc v12.0
      drm/amdgpu: Adjust logic in amdgpu_device_partner_bandwidth()
      drm/amdgpu: silence UBSAN warning
      drm/amdgpu: drop MES 10.1 support v3
      Revert "drm/amdkfd: fix gfx_target_version for certain 11.0.3 devices=
"
      drm/amdkfd: simplify APU VRAM handling
      drm/amdgpu/gfx11: select HDP ref/mask according to gfx ring pipe
      drm/amdgpu/gfx11: handle priority setup for gfx pipe1
      drm/amdgpu/gfx11: enable gfx pipe1 hardware support
      drm/amdgpu/soc24: use common nbio callback to set remap offset
      drm/amdgpu: update gc_12_0_0 headers
      Revert "drm/amdgpu/gfx11: enable gfx pipe1 hardware support"
      drm/amdgpu: add additional VM bits
      drm/amd/display: use pre-allocated temp structure for bounding box
      drm/amd/display/dcn401: use pre-allocated temp structure for bounding=
 box
      drm/radeon: fix UBSAN warning in kv_dpm.c
      drm/amdgpu: fix UBSAN warning in kv_dpm.c
      drm/amdgpu: cleanup MES12 command submission
      drm/amdgpu: remove amdgpu_mes_fence_wait_polling()
      drm/amdgpu/atomfirmware: fix parsing of vram_info
      drm/amd/display: Fix Makefile copyright notices
      drm/amdgpu: fix Kconfig for ISP v2
      drm/amd/display: use vmalloc for struct dc_state
      drm/amdgpu/atomfirmware: silence UBSAN warning
      MAINTAINERS: update powerplay and swsmu
      MAINTAINERS: fix Xinhui's name
      drm/amdgpu/job: Replace DRM_INFO/ERROR logging
      drm/amdgpu: remove exp hw support check for gfx12
      drm/amdgpu/mes11: update opcode strings
      drm/amdgpu/mes12: add missing opcode string

Alex Hung (57):
      drm/amd/display: Skip accessing array for unknown eng_id
      drm/amd/display: Ensure array index tg_inst won't be -1
      drm/amd/display: Check gpio_id before used as array index
      drm/amd/display: Fix incorrect size calculation for loop
      drm/amd/display: Check index for aux_rd_interval before using
      drm/amd/display: Check num_valid_sets before accessing reader_wm_sets=
[]
      drm/amd/display: Skip updating link encoder for unknown eng_id
      drm/amd/display: Check msg_id before processing transcation
      drm/amd/display: Check link_index before accessing dc->links[]
      drm/amd/display: Limit clock assignments by size of clk tables
      drm/amd/display: Spinlock before reading event
      drm/amd/display: Limit array index according to architecture
      drm/amd/display: Avoid overflow dc_clk_table->entries by limit
to MAX_NUM_DPM_LVL
      drm/amd/display: Skip plane when not found by stream id
      drm/amd/display: Ensure index calculation will not overflow
      drm/amd/display: Assign disp_cfg_index_max when dml21
      drm/amd/display: Fix uninitialized variables in dcn401 and dml21
      Revert "drm/amd/display: Enable SYMCLK gating in DCCG"
      drm/amd/display: Fix incorrect DCN401 comparison
      drm/amd/display: Adjust incorrect indentations and spaces
      drm/amd/display: Increase MAX_LINKS by 2
      drm/amd/display: Fix incorrect size calculation for loop in dcn401
      drm/amd/display: Fix uninitialized variables in dcn401
      drm/amd/display: Remove useless comparison of unsigned int vs. 0
      drm/amd/display: Remove NO_EFFECT self-assignment
      drm/amd/display: Explicitly cast v_total to signed in a subtraction
      drm/amd/display: Avoid overflow from uint32_t to uint8_t
      drm/amd/display: Explicitly extend unsigned 16 bit to 64 bit
      drm/amd/display: Add null checker before passing variables
      drm/amd/display: Check BIOS images before it is used
      drm/amd/display: Skip wbscl_set_scaler_filter if filter is null
      drm/amd/display: Add null checker before access structs
      drm/amd/display: Check dc_stream_state before it is used
      drm/amd/display: Check pipe_ctx before it is used
      drm/amd/display: Covert integers to double before divisions
      drm/amd/display: Remove redundant checks for res_pool->dccg
      drm/amd/display: Remove redundant checks for ctx->dc_bios
      drm/amd/display: Remove redundant null checks
      drm/amd/display: Remove redundant checks for opp
      drm/amd/display: Remove redundant checks for context
      drm/amd/display: Check UnboundedRequestEnabled's value
      drm/amd/display: Remove redundant null checks
      drm/amd/display: Remove redundant checks for pipe_ctx->stream
      drm/amd/display: Run DC_LOG_DC after checking link->link_enc
      drm/amd/display: Fix uninitialized variables in dcn401
      drm/amd/display: Remove useless function call
      drm/amd/display: Check and log for function error codes
      drm/amd/display: Check and log for function error codes
      drm/amd/display: Check HDCP returned status
      drm/amd/display: Add null checks before accessing struct elements
      drm/amd/display: Ensure curve to hw translation succeed
      drm/amd/display: Validate function returns
      drm/amd/display: Remove always true condition
      drm/amd/display: Remove duplicate null check
      drm/amd/display: Fix possible overflow in integer multiplication
      drm/amd/display: Check denominator pbn_div before used
      drm/amd/display: Check denominator crb_pipes before used

Alexandre Mergnat (9):
      dt-bindings: display: mediatek: aal: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: ccorr: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: color: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: dither: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: dsi: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: dpi: add compatible for MT8365
      dt-bindings: display: mediatek: gamma: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: ovl: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: rdma: add compatible for MT8365 SoC

Alvin Lee (17):
      drm/amd/display: Only program P-State force if pipe config changed
      drm/amd/display: Assign linear_pitch_alignment even for VM
      drm/amd/display: For FPO + Vactive check that all pipes support VA
      Revert "drm/amd/display: Only program P-State force if pipe
config changed"
      drm/amd/display: Don't offload flip if not only address update
      drm/amd/display: Fix ODM + underscan case with cursor
      drm/amd/display: Only program P-State force if pipe config changed
      drm/amd/display: Move fpo_in_use to stream_status
      drm/amd/display: Use current_state when checking old_pipe subvp type
      drm/amd/display: Program DIG FE source select for DVI before PHY en
      drm/amd/display: Remove NULL assignment for stream_status
      drm/amd/display: Ignore phantom DTBCLK requirement
      drm/amd/display: populate hardware_release hook for dcn401
      drm/amd/display: Make sure to reprogram ODM when resync fifo
      drm/amd/display: Program CURSOR_DST_X_OFFSET in viewport space
      drm/amd/display: Wait for double buffer update on ODM changes
      drm/amd/display: Account for cursor prefetch BW in DML1 mode support

Amjad Ouled-Ameur (1):
      drm/arm/komeda: update DMA mask to 40 bits

Anatoliy Klymenko (3):
      drm: xlnx: zynqmp_dpsub: Fix few function comments
      drm: xlnx: zynqmp_dpsub: Fix compilation error
      drm: xlnx: zynqmp_dpsub: Enable plane in atomic update

Andi Shyti (8):
      drm/i915/gt: Automate CCS Mode setting during engine resets
      drm/i915/gt: Fix CCS id's calculation for CCS mode setting
      drm/i915: Increase FLR timeout from 3s to 9s
      drm/i915/gt: debugfs: Evaluate forcewake usage within locks
      drm/i915/gt/uc: Fix typo in comment
      drm/i915/gt/uc: Evaluate GuC priority within locks
      drm/i915/gem: Return NULL instead of '0'
      drm/i915/gem: Use the correct format specifier for resource_size_t

Andrzej Hajda (4):
      drm/xe: flush gtt before signalling user fence on all engines
      drm/xe: allow unaligned start and size xe_res_cursor parameters
      Revert "drm/xe: flush gtt before signalling user fence on all engines=
"
      drm/xe: flush engine buffers before signalling user fence on all engi=
nes

Andrzej Kacprowski (1):
      accel/ivpu: Increase autosuspend delay to 100ms on 40xx

Andy Yan (1):
      drm/rockchip: vop2: Fix the port mux of VP2

AngeloGioacchino Del Regno (2):
      dt-bindings: gpu: mali-bifrost: Add compatible for MT8188 SoC
      drm/panfrost: Add support for Mali on the MT8188 SoC

Angus Chen (1):
      drm/i915/mtl: Update workaround 14018575942

Animesh Manna (5):
      drm/i915/alpm: Move alpm parameters from intel_psr
      drm/i915/alpm: Move alpm related code to a new file
      drm/i915/alpm: Add compute config for lobf
      drm/i915/alpm: Enable lobf from source in ALPM_CTL
      drm/i915/alpm: Add debugfs for LOBF

Ankit Nautiyal (1):
      Revert "drm/i915/dgfx: DGFX uses direct VBT pin mapping"

Anthony Koo (6):
      drm/amd/display: [FW Promotion] Release 0.0.214.0
      drm/amd/display: [FW Promotion] Release 0.0.216.0
      drm/amd/display: [FW Promotion] Release 0.0.220.0
      drm/amd/display: [FW Promotion] Release 0.0.221.0
      drm/amd/display: [FW Promotion] Release 0.0.222.0
      drm/amd/display: Add replay state entry to replay_state

Anusha Srivatsa (1):
      drm/i915/xe2hpd: Configure CHICKEN_MISC_2 before enabling planes

Aradhya Bhatia (7):
      dt-bindings: vendor-prefixes: Add microtips
      dt-bindings: vendor-prefixes: Add lincolntech
      dt-bindings: display: simple: Add Microtips & Lincolntech Dual-LVDS P=
anels
      drm/panel: simple: Add Lincoln Tech Sol LCD185-101CT panel
      drm/panel: simple: Add Microtips Technology 13-101HIEBCAF0-C panel
      drm/panel: simple: Add Microtips Technology MF-103HIEB0GA0 panel
      drm/bridge: tc358767: Add format negotiation hooks for DPI/DSI to (e)=
DP

Aric Cyr (10):
      drm/amd/display: 3.2.282
      drm/amd/display: 3.2.283
      drm/amd/display: 3.2.284
      drm/amd/display: 3.2.285
      drm/amd/display: 3.2.286
      drm/amd/display: dc 3.2.287
      drm/amd/display: 3.2.288
      drm/amd/display: 3.2.289
      drm/amd/display: 3.2.290
      drm/amd/display: 3.2.291

Ariel Suller (1):
      accel/habanalabs/gaudi2: align interrupt names to table

Arnd Bergmann (6):
      drm/i915/guc: avoid FIELD_PREP warning
      drm/amd/display: dynamically allocate dml2_configuration_options
structures
      drm/amd/display: fix graphics_object_id size
      drm/amd/display: avoid large on-stack structures
      drm/amd/display: Move 'struct scaler_data' off stack
      drm/xe: replace format-less snprintf() with strscpy()

Asad Kamal (5):
      drm/amd/amdgpu: Check tbo resource pointer
      drm/amd/pm: Add gpu_metrics_v1_6
      drm/amd/pm: Use gpu_metrics_v1_6 for SMUv13.0.6
      Revert "drm/amd/pm: Use gpu_metrics_v1_6 for SMUv13.0.6"
      Revert "drm/amd/pm: Add gpu_metrics_v1_6"

Ashutosh Dixit (23):
      drm/xe/perf/uapi: "Perf" layer to support multiple perf counter
stream types
      drm/xe/perf/uapi: Add perf_stream_paranoid sysctl
      drm/xe/oa/uapi: Add OA data formats
      drm/xe/oa/uapi: Initialize OA units
      drm/xe/oa/uapi: Add/remove OA config perf ops
      drm/xe/oa/uapi: Define and parse OA stream properties
      drm/xe/oa: OA stream initialization (OAG)
      drm/xe/oa/uapi: Expose OA stream fd
      drm/xe/oa/uapi: Read file_operation
      drm/xe/oa: Add OAR support
      drm/xe/oa: Add OAC support
      drm/xe/oa/uapi: Query OA unit properties
      drm/xe/oa/uapi: OA buffer mmap
      drm/xe/oa: Add MMIO trigger support
      drm/xe/oa: Override GuC RC with OA on PVC
      drm/xe/oa: Changes to OA_TAKEN
      drm/xe/oa: Enable Xe2+ overrun mode
      drm/xe/oa: Remove WARN_ON's for unsupported configurations
      drm/xe/oa: Fix kernel doc in xe_drm.h
      drm/xe/oa: Allow stream enable/disable functions to return error
      drm/xe/oa/uapi: Allow preemption to be disabled on the stream exec qu=
eue
      drm/xe/oa: Destroy the stream_lock mutex
      drm/xe/uapi: Rename xe perf layer as xe observation layer

Aurabindo Pillai (25):
      drm/amd: Add gfx12 swizzle mode defs
      drm/amd: define new gfx12 uapi flags
      drm/amd: GFX12 changes for converting tiling flags to modifiers
      drm/amd: Add DCN401 related register definitions
      drm/amd/display: Add new DCN401 sources
      drm/amd/display: Fix SPL related enum definition used in DCN401
      drm/amd/display: Add gfx12 modifiers
      drm/amd/display: Add DCN401 dependant changes for DMCUB
      drm/amd/display: Add some DCN401 reg name to macro definitions
      drm/amd/display: Add misc DC changes for DCN401
      drm/amd: Enable DCN410 init
      drm/amd:  Override DCN410 IP version
      drm/amd/display: Remove unnecessary HPD entry for DCN401
      drm/amd/display: Use DCN 410 includes for DCN401
      drm/amd/display: Remove incorrect FP context start
      drm/amd/display: Fix null pointer dereference for dcn401
      drm/amd/display: Move some init routines to dm_sw_init()
      drm/amd/display: Add new GPINT command definitions
      drm/amd/display: Enable copying of bounding box data from VBIOS DMUB
      drm/amd/display: Use sw cursor for DCN401 with rotation
      drm/amd: Add reg definitions for DCN401 DCC
      drm/amd/display: Enable DCC on DCN401
      drm/amd: Add some missing register definitions
      drm/amd/display: Fix null pointer deref in dcn20_resource.c
      drm/amd/display: Allow display DCC for DCN401

Balasubramani Vivekanandan (6):
      drm/i915/bmg: Define IS_BATTLEMAGE macro
      drm/i915/xe2hpd: Add new C20 PHY SRAM address
      drm/i915/xe2hpd: Add support for eDP PLL configuration
      drm/i915/xe2hpd: Set maximum DP rate to UHBR13.5
      drm/xe/bmg: Enable the display support
      drm/i915/display/bmg: Add platform descriptor

Barnab=C3=A1s Cz=C3=A9m=C3=A1n (5):
      drm/msm/dpu: fix encoder irq wait skip
      drm/msm/dpu: guard ctl irq callback register/unregister
      drm/msm/mdp5: Remove MDP_CAP_SRC_SPLIT from msm8x53_config
      dt-bindings: display/msm: qcom, mdp5: Add msm8937 compatible
      dt-bindings: msm: dsi-phy-28nm: Document msm8937 compatible

Barry Song (2):
      dma-buf: align fd_flags and heap_flags with dma_heap_allocation_data
      dma-buf/heaps: Correct the types of fd_flags and heap_flags

Bhuvana Chandra Pinninti (1):
      drm/amd/display: Refactor HUBP into component folder.

Bhuvanachandra Pinninti (1):
      drm/amd/display: Move dio files into dio folder

Bill Wendling (1):
      drm/radeon: Remove __counted_by from StateArray.states[]

Bob Zhou (5):
      drm/amd/pm: Fix the null pointer dereference for vega10_hwmgr
      drm/amd/pm: add missing error handling in function
smu_v13_0_6_allocate_dpm_context
      drm/amdgpu: fix the overflowed constant warning for RREG32_SOC15()
      drm/amdgpu: fix overflowed constant warning in mmhub_set_clockgating(=
)
      drm/amdgpu: add missing error handling in function
amdgpu_gmc_flush_gpu_tlb_pasid

Bommu Krishnaiah (1):
      drm/xe/xe2: Add workaround 14021402888

Bruno Rocha Levi (1):
      drivers/gpu: Fix misalignment in comment block

Chaitanya Kumar Borah (2):
      nouveau: Add missing break statement
      drm/i915/audio: Fix audio time stamp programming for DP

Chen Ni (1):
      drm/qxl: Add check for drm_cvt_mode

Chen-Yu Tsai (1):
      drm/mediatek: select DRM_GEM_DMA_HELPER if DRM_FBDEV_EMULATION=3Dy

Chiawen Huang (1):
      drm/amd/display: add set ips disable

Chris Park (8):
      drm/amd/display: Reduce I2C speed to 95kHz in DCN401
      drm/amd/display: Use the correct TMDS function to avoid DVI issues
      drm/amd/display: Deallocate DML 2.1 Memory Allocation
      drm/amd/display: Support new VA page table block size
      drm/amd/display: Change AVI Info Frame version to 4 for OVT
      drm/amd/display: Prevent overflow on DTO calculation
      drm/amd/display: Avoid programming DTO if Refclk is 0
      drm/amd/display: On clock init, maintain DISPCLK freq

Chris Wilson (1):
      drm/i915/gt: Disarm breadcrumbs if engines are already idle

Christian K=C3=B6nig (6):
      drm/amdgpu: once more fix the call oder in amdgpu_ttm_move() v2
      dma-buf: add a warning when drv try to reserve 0 fence slots
      drm/amdgpu: revert "take runtime pm reference when we attach a buffer=
" v2
      drm/amdgpu: fix using the reserved VMID with gang submit
      drm/amdgpu: cleanup MES11 command submission
      drm/amdgpu: reject gang submit on reserved VMIDs

Christophe JAILLET (3):
      dma-buf/fence-array: Add flex array to struct dma_fence_array
      drm: zynqmp_dpsub: Fix an error handling path in zynqmp_dpsub_probe()
      drm/nouveau: Constify struct nouveau_job_ops

Chun-LiangChang (1):
      drm/amd/display: Add params of set_abm_event for VB Scaling

ChunTao Tso (3):
      drm/amd/display: Introduce deferred Replay coasting vtotal update
      drm/amd/display: Replay low hz
      drm/amd/display: Replay + IPS + ABM in Full Screen VPB

Clint Taylor (2):
      drm/i915/bmg: Lane reversal requires writes to both context lanes
      drm/i915/xe2hpd: Initial cdclk table

Colin Ian King (4):
      drm/xe: Fix spelling mistake "forcebly" -> "forcibly"
      drm/amd/display: Fix spelling various spelling mistakes
      drm/gma500: Fix spelling mistake "patter" -> "pattern"
      drm/amd/display: Fix a handful of spelling mistakes

Cong Yang (6):
      dt-bindings: display: panel: Add himax hx83102 panel bindings
      drm/panel: himax-hx83102: Break out as separate driver
      dt-bindings: display: panel: Add compatible for BOE nv110wum-l60
      drm/panel: himax-hx83102: Support for BOE nv110wum-l60 MIPI-DSI panel
      dt-bindings: display: panel: Add compatible for IVO t109nw41
      drm/panel: himax-hx83102: Support for IVO t109nw41 MIPI-DSI panel

Connor Abbott (4):
      firmware: qcom_scm: Add gpu_init_regs call
      drm/msm/a7xx: Initialize a750 "software fuse"
      drm/msm: Add MSM_PARAM_RAYTRACING uapi
      drm/msm/a7xx: Add missing register writes from downstream

Cruise (2):
      drm/amd/display: Disable error correction if it's not supported
      drm/amd/display: Not fallback if link BW is smaller than req BW

Dan Carpenter (5):
      drm/amd/display: re-indent dpp401_dscl_program_isharp()
      drm/amdgpu: Fix signedness bug in sdma_v4_0_process_trap_irq()
      drm/amd/display: re-indent dc_power_down_on_boot()
      drm/amd/display: Clean up indenting in dm_dp_mst_is_port_support_mode=
()
      drm/amdgpu/kfd: Add unlock() on error path to add_queue_mes()

Dani Liberman (2):
      accel/habanalabs: add device name to error print
      accel/habanalabs: separate nonce from max_size in cpucp_packet struct

Daniel Miess (4):
      drm/amd/display: Enable RCO for PHYSYMCLK in DCN35
      drm/amd/display: Enable SYMCLK gating in DCCG
      drm/amd/display: Change dram_clock_latency to 34us for dcn351
      drm/amd/display: Disable PHYSYMCLK RCO

Daniel Sa (3):
      drm/amd/display: Fetch Mall caps from DC
      drm/amd/display: Return after Init
      drm/amd/display: Fix reduced resolution and refresh rate

Daniel Vetter (11):
      Merge tag 'drm-xe-next-2024-07-02' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge v6.10-rc6 into drm-next
      Merge tag 'exynos-drm-next-for-v6.11' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-next
      Merge tag 'drm-etnaviv-next-2024-06-28' of
https://git.pengutronix.de/git/lst/linux into drm-next
      Merge tag 'mediatek-drm-next-6.11' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-next
      Merge tag 'amd-drm-next-6.11-2024-06-28' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'amd-drm-next-6.11-2024-07-03' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-gt-next-2024-07-04' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-misc-next-2024-07-04' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-msm-next-2024-07-04' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'drm-intel-next-2024-06-28' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next

Daniele Ceraolo Spurio (3):
      drm/xe/gsc: Turn off GSCCS interrupts when disabling the engine
      drm/xe/gsc: define GSCCS for LNL
      Revert "drm/xe: make gt_remove use devm"

Daniil Titov (3):
      drm/msm/mdp5: Add MDP5 configuration for MSM8937
      drm/msm/dsi: Add phy configuration for MSM8937
      drm/msm/adreno: Add support for Adreno 505 GPU

Danijel Slivka (2):
      drm/amdgpu: clear RB_OVERFLOW bit when enabling interrupts
      drm/amd/pm: Ignore initial value in smu response register

Danila Tikhonov (5):
      dt-bindings: display/msm: Add SM7150 DPU
      drm/msm/dpu: Add SM7150 support
      dt-bindings: display/msm: Add SM7150 MDSS
      drm/msm: mdss: Add SM7150 support
      dt-bindings: display/msm: dsi-controller-main: Add SM7150

Dave Airlie (16):
      Merge tag 'drm-xe-next-2024-06-06' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'amd-drm-next-6.11-2024-06-07' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      nouveau: rip out busy fence waits
      Merge tag 'drm-misc-next-2024-05-30' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-misc-next-2024-06-06' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-misc-next-2024-06-13' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-misc-next-2024-06-20' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-intel-next-2024-06-19' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'amd-drm-next-6.11-2024-06-22' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-gt-next-2024-06-12' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-xe-next-2024-06-26' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-misc-next-2024-06-27' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-habanalabs-next-2024-06-23' of
https://github.com/HabanaAI/drivers.accel.habanalabs.kernel into
drm-next
      Merge tag 'drm-misc-next-fixes-2024-07-11' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-xe-next-fixes-2024-07-11' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'amd-drm-next-6.11-2024-07-12' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

Dave Stevenson (5):
      drm/vc4: Add monochrome mode to the VEC.
      drm/vc4: vec: Add the margin properties to the connector
      MAINTAINERS: drm: vc4: Add Raspberry Pi as maintainers
      MAINTAINERS: drm: vc4: Drop Emma's tree
      drm/tests: Add tests for the new Monochrome value of tv_mode

David (Ming Qiang) Wu (8):
      amdgpu/vcn: enable AMD_PG_SUPPORT_VCN
      drm/amdgpu/vcn5: Add VCN5 capabilities
      drm/amdgpu/vcn: remove irq disabling in vcn 5 suspend
      drm/amdgpu/vcn: set VCN5 power gating state to GATE on suspend
      drm/amd/amdgpu: update jpeg 5 capability
      drm/amd/amdgpu: add AMD_PG_SUPPORT_VCN_DPG flag
      drm/amdgpu: drop some kernel messages in VCN code
      drm/amdgpu: drop some kernel messages in VCN code

David Belanger (8):
      drm/amdkfd: Basic SDMA and cache info changes for GFX12.
      drm/amdkfd: Added temporary changes for GFX12.
      drm/amdkfd: Added MQD manager files for GFX12.
      drm/amdkfd: Added device queue manager files for GFX12.
      drm/amdkfd: Added gfx_v12_kfd2kgd interface for GFX12.
      drm/amdkfd: Enable GFX12 trap handler
      drm/amdkfd: Enable atomic support for GFX12
      drm/amdgpu: Fix physical address mask

Deming Wang (1):
      drm/i915/gem/i915_gem_ttm_move: Fix typo

Dennis Chan (3):
      drm/amd/display: Fix Replay Desync Error Test
      drm/amd/display: Refactor for Replay Link off frame count
      drm/amd/display: Fix Replay Desync Error Test

Derek Foreman (1):
      drm/etnaviv: Read some FE registers twice

Didi Freiman (1):
      accel/habanalabs: gradual sleep in polling memory macro

Dillon Varone (21):
      drm/amd/display: Refactor input mode programming for DIG FIFO
      drm/amd/display: Reset input mode for DIG on encoder reset
      drm/amd/display: Create dcn401_clk_mgr struct
      drm/amd/display: Refactor dcn401_update_clocks
      drm/amd/display: Modify HPO pixel clock programming to support DPM
      drm/amd/display: Disable DCN401 idle optimizations
      drm/amd/display: Correct display clocks update block sequence
      drm/amd/display: Wait for hardmins to complete on dcn401
      drm/amd/display: Add UCLK p-state support message to dcn401
      drm/amd/display: Force max clocks unconditionally when p-state
is unsupported
      drm/amd/display: Add recovery timeout to FAMS2
      drm/amd/display: Various DML2 fixes for FAMS2
      drm/amd/display: Block SubVP if hardware rotation is used in DML2.1
      drm/amd/display: Add null check for phantom pipes in prepare mcache
      drm/amd/display: Fix missed targets in FAMS2+HWFQ
      drm/amd/display: Do not override dml2.1 reinit
      drm/amd/display: Update idle hardmins if uclk or fclk requirement cha=
nged
      drm/amd/display: Enable DCN401 idle optimizations by default
      drm/amd/display: Add null check to dml21_find_dc_pipes_for_plane
      drm/amd/display: Make DML2.1 P-State method force per stream
      drm/amd/display: Cleanup dce_get_dp_ref_freq_khz

Dmitry Baryshkov (28):
      drm/panel: lg-sw43408: add missing error handling
      drm/mipi-dsi: wrap more functions for streamline handling
      drm/panel: boe-tv101wum-nl6: use wrapped MIPI DCS functions
      drm/panel: ilitek-ili9882t: use wrapped MIPI DCS functions
      drm/panel: innolux-p079zca: use mipi_dsi_dcs_nop_multi()
      drm/panel: novatek-nt36672e: use wrapped MIPI DCS functions
      drm/panel: lg-sw43408: use new streamlined MIPI DSI API
      drm/ci: validate drm/msm XML register files against schema
      Revert "drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set"
      drm/msm/dp: fix runtime_pm handling in dp_wait_hpd_asserted
      drm/connector: hdmi: allow disabling Audio Infoframe
      drm/bridge-connector: switch to using drmm allocations
      drm/bridge-connector: implement glue code for HDMI connector
      Merge remote-tracking branch 'drm-misc/drm-misc-next' into HEAD
      drm/panel-edp: add fat warning against adding new panel compatibles
      drm/panel-edp: drop several legacy panels
      dt-bindings: display: panel-edp-legacy: drop several eDP panels
      drm/ci: mark kms_addfb_basic@addfb25-bad-modifier as passing on msm
      dt-bindings: display/msm/dsi: allow specifying TE source
      drm/msm/dpu: convert vsync source defines to the enum
      drm/msm/dsi: drop unused GPIOs handling
      drm/msm/dpu: pull the is_cmd_mode out of
_dpu_encoder_update_vsync_source()
      drm/msm/dpu: rework vsync_source handling
      drm/msm/dsi: parse vsync source from device tree
      drm/msm/dpu: support setting the TE source
      drm/msm/dpu: rename dpu_hw_setup_vsync_source functions
      drm/connector: hdmi: shorten too long function name
      drm/msm/dpu: remove CRTC frame event callback registration

Douglas Anderson (69):
      drm/panel-edp: Add ID for KD KD116N09-30NH-A016
      drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_dcs_write_seq(=
)
      drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_generic_write_=
seq()
      drm/mipi-dsi: mipi_dsi_*_write functions don't need to ratelimit prin=
ts
      drm/mipi-dsi: Reduce driver bloat of mipi_dsi_*_write_seq()
      drm/mipi-dsi: Introduce mipi_dsi_*_write_seq_multi()
      drm/panel: novatek-nt36672e: Switch to mipi_dsi_dcs_write_seq_multi()
      drm/panel: boe-tv101wum-nl6: Don't use a table for initting panels
      drm/panel: ili9882t: Don't use a table for initting panels
      drm/panel: innolux-p079zca: Don't use a table for initting panels
      drm/panel: himax-hx8394: Handle errors from
mipi_dsi_dcs_set_display_on() better
      drm/panel: boe-tv101wum-nl6: If prepare fails, disable GPIO
before regulators
      drm/panel: boe-tv101wum-nl6: Check for errors on the NOP in prepare()
      drm/panel: ilitek-ili9882t: If prepare fails, disable GPIO
before regulators
      drm/panel: ilitek-ili9882t: Check for errors on the NOP in prepare()
      drm/panel: himax-hx83102: If prepare fails, disable GPIO before regul=
ators
      drm/panel: himax-hx83102: Check for errors on the NOP in prepare()
      drm/panel: himax-hx83102: use wrapped MIPI DCS functions
      dt-bindings: display: Reorganize legacy eDP panel bindings
      drm/panel: raydium-rm692e5: Stop tracking prepared
      drm/panel: boe-tv101wum-nl6: Stop tracking prepared
      drm/panel: boe-tv101wum-nl6: Don't call unprepare+disable at
shutdown/remove
      drm/panel: edp: Stop tracking prepared/enabled
      drm/panel: edp: Add a comment about unprepare+disable at shutdown/rem=
ove
      drm/panel: innolux-p079zca: Stop tracking prepared/enabled
      drm/panel: innolux-p079zca: Don't call unprepare+disable at
shutdown/remove
      drm/panel: kingdisplay-kd097d04: Stop tracking prepared/enabled
      drm/panel: kingdisplay-kd097d04: Don't call unprepare+disable at
shutdown/remove
      drm/panel: ltk050h3146w: Stop tracking prepared
      drm/panel: ltk050h3146w: Don't call unprepare+disable at shutdown/rem=
ove
      drm/panel: ltk500hd1829: Stop tracking prepared
      drm/panel: ltk500hd1829: Don't call unprepare+disable at shutdown/rem=
ove
      drm/panel: novatek-nt36672a: Stop tracking prepared
      drm/panel: novatek-nt36672a: Don't call unprepare+disable at
shutdown/remove
      drm/panel: samsung-atna33xc20: Stop tracking prepared/enabled
      drm/panel: samsung-atna33xc20: Don't call unprepare+disable at
shutdown/remove
      drm/panel: simple: Stop tracking prepared/enabled
      drm/panel: simple: Add a comment about unprepare+disable at
shutdown/remove
      drm/panel: xinpeng-xpp055c272: Stop tracking prepared
      drm/panel: xinpeng-xpp055c272: Don't call unprepare+disable at
shutdown/remove
      drm/panel: sitronix-st7703: Stop tracking prepared
      drm/panel: sitronix-st7703: Don't call disable at shutdown/remove
      drm/panel: sony-acx565akm: Don't double-check enabled state in disabl=
e
      drm/panel: sony-acx565akm: Don't call disable at remove
      drm/panel: boe-himax8279d: Stop tracking prepared/enabled
      drm/panel: boe-himax8279d: Don't call unprepare+disable at shutdown/r=
emove
      drm/panel: khadas-ts050: Stop tracking prepared/enabled
      drm/panel: khadas-ts050: Don't call unprepare+disable at shutdown/rem=
ove
      drm/panel: olimex-lcd-olinuxino: Stop tracking prepared/enabled
      drm/panel: olimex-lcd-olinuxino: Don't call unprepare+disable at remo=
ve
      drm/panel: osd-osd101t2587-53ts: Stop tracking prepared/enabled
      drm/panel: osd-osd101t2587-53ts: Don't call unprepare+disable at
shutdown/remove
      drm/panel: tdo-tl070wsh30: Stop tracking prepared
      drm/panel: tdo-tl070wsh30: Don't call unprepare+disable at shutdown/r=
emove
      drm/panel: jdi-lt070me05000: Stop tracking prepared/enabled
      drm/panel: jdi-lt070me05000: Don't call disable at shutdown/remove
      drm/panel: panasonic-vvx10f034n00: Stop tracking prepared/enabled
      drm/panel: panasonic-vvx10f034n00: Don't call disable at shutdown/rem=
ove
      drm/panel: seiko-43wvf1g: Stop tracking prepared/enabled
      drm/panel: seiko-43wvf1g: Don't call disable at shutdown/remove
      drm/panel: sharp-lq101r1sx01: Stop tracking prepared/enabled
      drm/panel: sharp-lq101r1sx01: Don't call disable at shutdown/remove
      drm/panel: sharp-ls043t1le01: Stop tracking prepared
      drm/panel: sharp-ls043t1le01: Don't call disable at shutdown/remove
      drm/panel: raydium-rm67191: Stop tracking enabled
      drm/panel: raydium-rm67191: Don't call unprepare+disable at shutdown
      drm/panel: Update TODO list item for cleaning up prepared/enabled tra=
cking
      drm/mediatek: Call drm_atomic_helper_shutdown() at shutdown time
      drm/panel: sharp-lq101r1sx01: Fixed reversed "if" in remove

Dr. David Alan Gilbert (4):
      drm/amdgpu: remove unused struct 'hqd_registers'
      drm/amd/display: remove unused struct 'aux_payloads'
      drm/amd/display: remove unused struct 'dc_reg_sequence'
      drm/xe: remove unused struct 'xe_gt_desc'

Dragan Simic (2):
      drm/lima: Mark simple_ondemand governor as softdep
      drm/panfrost: Mark simple_ondemand governor as softdep

Duncan Ma (2):
      drm/amd/display: Read default boot options
      drm/amd/display: Reset DSC memory status

Durai Manickam KR (1):
      drm: atmel-hlcdc: Define XLCDC specific registers

Eric Huang (5):
      drm/amdkfd: fix NULL ptr for debugfs mqds on GFX v12
      drm/amdgpu: add reset sources in gpu reset context
      drm/amdkfd: add reset cause in gpu pre-reset smi event
      drm/amdgpu: fix NULL pointer in amdgpu_reset_get_desc
      drm/amdgpu: add reset source in various cases

Ethan Bitnun (2):
      drm/amd/display: Block FPO According to Luminance Delta
      drm/amd/display: Find max flickerless instant vtotal delta

Faiz Abbas (2):
      drm/arm/komeda: Fix komeda probe failing if there are no links
in the secondary pipeline
      drm/arm/komeda: Move pipeline prints to after the entire
pipeline has been enabled

Fangzhi Zuo (3):
      drm/amd/display: Prevent IPX From Link Detect and Set Mode
      drm/amd/display: Fix dmub timeout after fams2 enabled
      drm/amd/display: Update efficiency bandwidth for dcn351

Farah Kassabri (6):
      accel/habanalabs/gaudi2: update interrupts related headers
      accel/habanalabs: add heartbeat debug info
      accel/habanalabs: check for errors after preboot is ready
      accel/habanalabs/gaudi2: add GAUDI2D revision support
      accel/habanalabs: change the heartbeat scheduling point
      accel/habanalabs: add more info upon cpu pkt timeout

Francois Dugast (6):
      drm/xe/gt: Fix assert in L3 bank mask generation
      drm/xe/debugfs: Get a runtime_pm reference when setting wedged mode
      drm/xe/vm_doc: Fix some typos
      drm/xe/uapi: Expose the L3 bank mask
      drm/xe/sched_job: Promote xe_sched_job_add_deps()
      drm/xe/exec_queue: Rename xe_exec_queue::compute to xe_exec_queue::lr

Frank Min (13):
      drm/amdgpu: add initial value for gfx12 AGP aperture
      drm/amdgpu: fix mqd corruption for gfx12
      drm/amdgpu/mes: use mc address for wptr in add queue packet
      drm/amdgpu: fix getting vram info for gfx12
      drm/amdgpu: program device_cntl2 through pci cfg space
      drm/amdgpu: Set PTE_IS_PTE bit for gfx12
      drm/amdgpu: Update soc24_enum.h and soc21_enum.h
      drm/amdgpu: add sdma 7.0 support for copy dcc buffer
      drm/amdgpu: update MTYPE mapping for gfx12
      drm/amdgpu: access ltr through pci cfg space
      drm/amdgpu: tolerate allocating GTT bo with dcc flag
      drm/amdgpu: update gfxhub client id for gfx12
      drm/amdgpu: restore dcc bo tilling configs while moving

Friedrich Vock (1):
      drm/amdgpu: Check if NBIO funcs are NULL in amdgpu_device_baco_exit

Gabe Teeger (1):
      drm/amd/display: Atom Integrated System Info v2_2 for DCN35

Gavin Wan (1):
      drm/amd/amdgpu: fix SDMA IRQ client ID <-> req mapping.

Geert Uytterhoeven (8):
      drm/panic: Fix uninitialized drm_scanout_buffer.set_pixel() crash
      drm/panic: Fix off-by-one logo size checks
      lib/fonts: Fix visiblity of SUN12x22 and TER16x32 if DRM_PANIC
      drm/panic: Spelling s/formater/formatter/
      drm/panic: Rename logo to logo_ascii
      drm/panic: Add support for drawing a monochrome graphical logo
      drm/panic: Do not select DRM_KMS_HELPER
      drm/panic: Restrict graphical logo handling to built-in

George Shen (6):
      drm/amd/display: Skip SST ACT polling when sink_count is 0
      drm/amd/display: Check UHBR13.5 cap when determining max link cap
      drm/amd/display: Ignore UHBR13.5 cable ID cap for passive cable
max link rate
      drm/amd/display: Call dpmm when checking mode support
      drm/amd/display: Fix divide by zero in CURSOR_DST_X_OFFSET calculatio=
n
      drm/amd/display: Add ASIC cap to limit DCC surface width

Gui Chengming (1):
      drm/amd/pm: add pstate support for SMU_14_0_2

Gustavo Sousa (1):
      drm/i915/bmg: Load DMC

Haikun Zhou (1):
      drm/panel-edp: Add CMN N116BCJ-EAK

Hamza Mahfooz (1):
      drm/amd/display: prevent register access while in IPS

Haoran Liu (1):
      drm/meson: plane: Add error handling

Harikrishna Revalla (1):
      drm/amd/display: Refactor HUBBUB into component folder for DCN401

Harish Kasiviswanathan (4):
      drm/amdgpu: Add mes_v12_api_def.h for gfx12
      drm/amdkfd: Use dev_error intead of pr_error
      drm/amdkfd: Ensure gpu_id is unique
      drm/amdgpu: Indicate CU havest info to CP

Harry Wentland (4):
      drm/amd/display: Separate setting and programming of cursor
      drm/amd/display: Set cursor attributes before position
      drm/amd/display: Do cursor programming with rest of pipe
      drm/amd/display: Always use legacy way of setting cursor on DCE

Hawking Zhang (21):
      drm/amdgpu: Add gc v12_0_0 ip headers (v4)
      drm/amdgpu: Add soc24 chip enum definitions (v4)
      drm/amdgpu: Add soc24 common ip block (v2)
      drm/amdgpu: Add mmhub v4_1_0 ip headers (v4)
      drm/amdgpu: Add mmhub v4_1_0 ip block support (v4)
      drm/amdgpu: Add gfx v12 pte/pde format change
      drm/amdgpu: Add gmc v12_0 ip block support (v7)
      drm/amdgpu: Set pte_is_pte flag in gmc v12 gart
      drm/amdgpu: support gfx v12 specific pte/pde fields
      drm/amdgpu: Add sdma v4_4_5 ip block
      drm/amdgpu: Add psp v13_0_14 ip block
      drm/amdgpu: Add smu v13_0_14 ip block
      drm/amdgpu: Add gfx v9_4_4 ip block
      drm/amdgpu: Switch to smuio func to get gpu clk counter
      drm/amdgpu: correct hbm field in boot status
      drm/amdgpu: Estimate RAS reservation when report capacity v2
      drm/amdgpu: Update programming for boot error reporting
      drm/amdgpu: Fix register access violation
      drm/amdgpu: Fix smatch static checker warning
      drm/amdgpu: Correct register used to clear fault status
      drm/amdgpu: Fix hbm stack id in boot error report

Heiner Kallweit (1):
      drm/amd/pm: remove deprecated I2C_CLASS_SPD support from newly
added SMU_14_0_2

Hersen Wu (18):
      drm/amd/display: Fix incorrect DSC instance for MST
      drm/amd/display: Add NULL pointer and OVERRUN check within
amdgpu_dm irq register
      drm/amd/display: Stop amdgpu_dm initialize when stream nums greater t=
han 6
      drm/amd/display: Stop amdgpu_dm initialize when link nums
greater than max_links
      drm/amd/display: Add missing NULL pointer check within
dpcd_extend_address_range
      drm/amd/display: Add array index check for hdcp ddc access
      drm/amd/display: Release state memory if
amdgpu_dm_create_color_properties fail
      drm/amd/display: Add otg_master NULL check within
resource_log_pipe_topology_update
      drm/amd/display: Fix Coverity INTERGER_OVERFLOW within
construct_integrated_info
      drm/amd/display: Fix Coverity INTEGER_OVERFLOW within
dal_gpio_service_create
      drm/amd/display: Add NULL pointer check for kzalloc
      drm/amd/display: Fix wrong array size dummy_boolean of
dml2_core_calcs_mode_support_locals
      drm/amd/display: Release clck_src memory if clk_src_construct fails
      drm/amd/display: Fix Coverity INTEGER_OVERFLOW within
decide_fallback_link_setting_max_bw_policy
      drm/amd/display: Skip inactive planes within
ModeSupportAndSystemConfiguration
      drm/amd/display: Fix writeback job lock evasion within dm_crtc_high_i=
rq
      drm/amd/display: Fix index may exceed array range within
fpu_update_bw_bounding_box
      drm/amd/display: Add NULL check within get_target_mpc_factor

Himal Prasad Ghimiray (8):
      drm/xe/vm: Use xe_vm_lock()/xe_vm_unlock() helpers
      drm/xe: Use xe_bo_lock()/xe_bo_unlock() helpers
      drm/xe: Change xe_guc_submit_stop return to void
      drm/xe: Change pcode timeout to 50msec while polling again
      drm/xe: Fix the warning conditions
      drm/xe: Cleanup force wake registers bit definitions
      drm/xe: Ensure caller uses sole domain for xe_force_wake_assert_held
      drm/xe: Check valid domain is passed in xe_force_wake_ref

Hsiao Chien Sung (15):
      drm/mediatek: Add missing plane settings when async update
      drm/mediatek: Use 8-bit alpha in ETHDR
      drm/mediatek: Fix XRGB setting error in OVL
      drm/mediatek: Fix XRGB setting error in Mixer
      drm/mediatek: Fix destination alpha error in OVL
      drm/mediatek: Turn off the layers with zero width or height
      drm/mediatek: Add OVL compatible name for MT8195
      drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property
      drm/mediatek: Add new color format MACROs in OVL
      drm/mediatek: Set DRM mode configs accordingly
      drm/mediatek: Support more 10bit formats in OVL
      drm/mediatek: Support RGBA8888 and RGBX8888 in OVL on MT8195
      drm/mediatek: Support DRM plane alpha in OVL
      drm/mediatek: Support DRM plane alpha in Mixer
      drm/mediatek: Remove less-than-zero comparison of an unsigned value

Igal Zeltser (1):
      accel/habanalabs: use msg_header instead of desc_header

Ilia Levi (2):
      accel/habanalabs: additional print in device-in-use info
      drm/xe/irq: remove xe_irq_shutdown

Ilya Bakoulin (4):
      drm/amd/display: Add condition for dp_set_dsc_config call
      drm/amd/display: Fix FEC_READY write on DP LT
      drm/amd/display: Fix write to non-existent reg on DCN401
      drm/amd/display: Add 3DLUT DMA load trigger

Imre Deak (31):
      drm/i915: Fix audio component initialization
      drm/i915: Fix assert on pending async-put power domain work when
it requeues itself
      drm/i915/dp_mst: Fix DSC input BPP computation
      drm/i915/dp_mst: Align TUs to avoid splitting symbols across MTPs
      drm/i915/dp: Move link train params to a substruct in intel_dp
      drm/i915/dp: Move link train fallback to intel_dp_link_training.c
      drm/i915/dp: Sanitize intel_dp_get_link_train_fallback_values()
      drm/i915: Factor out function to modeset commit a set of pipes
      drm/i915/dp: Use a commit modeset for link retraining MST links
      drm/i915/dp: Recheck link state after modeset
      drm/i915/dp: Reduce link params only after retrying with unchanged pa=
rams
      drm/i915/dp: Pass atomic state to link training function
      drm/i915/dp: Send a link training modeset-retry uevent to all
MST connectors
      drm/i915/dp: Use check link state work in the hotplug handler
      drm/i915/dp: Use check link state work in the detect handler
      drm/i915/dp: Use check link state work in the HPD IRQ handler
      drm/i915/dp: Disable link retraining after the last fallback step
      drm/i915/dp_mst: Reset intel_dp->link_trained during disabling
      drm/i915/dp_mst: Enable link training fallback for MST
      drm/i915/dp: Add debugfs entries to force the link rate/lane count
      drm/i915/dp: Add debugfs entries to get the max link rate/lane count
      drm/i915/dp: Add debugfs entry to force link training failure
      drm/i915/dp: Add debugfs entry to force link retrain
      drm/i915/dp: Add debugfs entry to get the link retrain disabled state
      drm/i915: Move encoder suspend/shutdown helpers to intel_encoder.c
      drm/i915: Pass intel_display to the encoder suspend/shutdown helpers
      drm/xe: Use the encoder suspend helper also used by the i915 driver
      drm/i915/display: For MTL+ platforms skip mg dp programming
      drm/i915/mtl: Skip PLL state verification in TBT mode
      drm: Add helpers for q4 fixed point values
      drm/display/dsc: Add a helper to dump the DSC configuration

Inki Dae (1):
      Merge tag 'exynos-drm-fixes-for-v6.10-rc4' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
exynos-drm-next

Iswara Nagulendran (1):
      drm/amd/display: Restrict multi-disp support for in-game FAMS

Ivan Lipski (12):
      Revert "drm/amd/display: Add null check for 'afb' in
amdgpu_dm_update_cursor"
      Revert "drm/amd/display: Add NULL check for 'afb' before
dereferencing in amdgpu_dm_plane_handle_cursor_update"
      drm/amd/display: Remove redundant if conditions
      drm/amd/display: Remove unreachable check
      drm/amd/display: Remove redundant ternary operation
      drm/amd/display: Remove duplicate 'update_idle_uclk' in dcn401
clk_mgr code
      drm/amd/display: Remove reduntant comparisons by Coverity
      drm/amd/display: Remove redundant condition with DEADCODE
      drm/amd/display: Remove redundant condition in VBA 314 func
      drm/amd/display: Remove unused value set from 'min_hratio_fact' in dm=
l
      drm/amd/display: Remove redundant var from display_rq_dig_calc in dml
      drm/amd/display: Remove unnecessary variable

Jacek Lawrynowicz (9):
      accel/ivpu: Update VPU FW API headers
      accel/ivpu: Increase reset counter when warm boot fails
      accel/ivpu: Replace wake_thread with kfifo
      accel/ivpu: Remove suspend_reschedule_counter
      accel/ivpu: Implement DCT handling
      accel/ivpu: Make selected params read-only
      accel/ivpu: Disable MMU before checking for idle
      accel/ivpu: Remove duplicated debug messages
      accel/ivpu: Remove unused ivpu_rpm_get_if_active()

Jack Chang (1):
      drm/amd/display: Extend PSRSU residency mode

Jack Xiao (20):
      drm/amdgpu/mes11: add mes mapping legacy queue support
      drm/amdgpu/mes11: adjust mes initialization sequence
      drm/amdgpu/gfx: enable mes to map legacy queue support
      drm/amdgpu/mes11: increase waiting time for engine ready
      drm/amdgpu/sdma7: set sdma hang watchdog
      drm/amdgpu: Add mes v12_0 ip block support (v4)
      drm/amdgpu: enable mes v12 self test
      drm/amdgpu/mes12: update data cache boundary
      drm/amdgpu/gfx12: recalculate available compute rings to use
      drm/amdgpu/mes: add uni_mes fw loading support
      drm/amdgpu/mes12: add uni_mes fw loading support
      drm/amdgpu/mes12: enable uni_mes fw on mes pipe0
      drm/amdgpu/mes12: add mes mapping legacy queue support
      drm/amdgpu/gfx: enable mes to map legacy queue support
      drm/amdgpu/mes12: add legacy setting hw resource interface
      drm/amdgpu: add module parameter 'amdgpu_uni_mes'
      drm/amdgpu/mes12: disable logging output
      drm/amdgpu/mes11: fix kiq ring ready flag
      drm/amdgpu/mes: fix mes12 to map legacy queue
      drm/amdgpu/mes12: mes hw_fini fix for mode1 reset

Jane Jian (2):
      drm/amdgpu - optimize rlc spm cntl
      drm/amdgpu: normalize registers as local xcc to read/write in gfx_v9_=
4_3

Janga Rahul Kumar (2):
      drm/xe: Relocate regs_are_mcr function
      drm/xe/mocs: Add debugfs node to dump mocs

Jani Nikula (224):
      MAINTAINERS: fix LG sw43408 panel driver drm-misc git URL
      drm/i915: pass dev_priv explicitly to TRANS_EXITLINE
      drm/i915: pass dev_priv explicitly to EDP_PSR_CTL
      drm/i915: pass dev_priv explicitly to TRANS_PSR_IMR
      drm/i915: pass dev_priv explicitly to TRANS_PSR_IIR
      drm/i915: pass dev_priv explicitly to EDP_PSR_AUX_CTL
      drm/i915: pass dev_priv explicitly to EDP_PSR_AUX_DATA
      drm/i915: pass dev_priv explicitly to EDP_PSR_STATUS
      drm/i915: pass dev_priv explicitly to EDP_PSR_PERF_CNT
      drm/i915: pass dev_priv explicitly to EDP_PSR_DEBUG
      drm/i915: pass dev_priv explicitly to EDP_PSR2_CTL
      drm/i915: pass dev_priv explicitly to PSR_EVENT
      drm/i915: pass dev_priv explicitly to EDP_PSR2_STATUS
      drm/i915: pass dev_priv explicitly to PSR2_SU_STATUS
      drm/i915: pass dev_priv explicitly to PSR2_MAN_TRK_CTL
      drm/i915: pass dev_priv explicitly to PIPE_SRCSZ_ERLY_TPT
      drm/i915: pass dev_priv explicitly to ALPM_CTL
      FIXME drm/i915: pass dev_priv explicitly to ALPM_CTL2
      drm/i915: pass dev_priv explicitly to PORT_ALPM_CTL
      drm/i915: pass dev_priv explicitly to PORT_ALPM_LFPS_CTL
      drm/i915: pass dev_priv explicitly to PIPE_CRC_CTL
      drm/i915: pass dev_priv explicitly to PIPE_CRC_*
      drm/i915: pass dev_priv explicitly to PORT_DFT2_G4X
      drm: deprecate driver date
      drm/i915: pass dev_priv explicitly to TRANS_VRR_CTL
      drm/i915: pass dev_priv explicitly to TRANS_VRR_VMAX
      drm/i915: pass dev_priv explicitly to TRANS_VRR_VMIN
      drm/i915: pass dev_priv explicitly to TRANS_VRR_VMAXSHIFT
      drm/i915: pass dev_priv explicitly to TRANS_VRR_STATUS
      drm/i915: pass dev_priv explicitly to TRANS_VRR_VTOTAL_PREV
      drm/i915: pass dev_priv explicitly to TRANS_VRR_FLIPLINE
      drm/i915: pass dev_priv explicitly to TRANS_VRR_STATUS2
      drm/i915: pass dev_priv explicitly to TRANS_PUSH
      drm/i915: pass dev_priv explicitly to TRANS_VRR_VSYNC
      drm: use "0" instead of "" for deprecated driver date
      drm/bridge/analogix/anx6345: switch to struct drm_edid
      drm/bridge/analogix/anx78xx: switch to struct drm_edid
      drm/bridge: anx7625: use struct drm_edid more
      drm/i2c: tda998x: switch to struct drm_edid
      drm/bochs: switch to struct drm_edid
      drm/virtio: switch to struct drm_edid
      drm/xe/display: remove unused xe->enabled_irq_mask
      drm/xe/display: remove unused xe->sb_lock
      drm/edid: remove drm_do_get_edid()
      drm/i915/pciids: add INTEL_PNV_IDS(), use acronym
      drm/i915/pciids: add INTEL_ILK_IDS(), use acronym
      drm/i915/pciids: add INTEL_SNB_IDS()
      drm/i915/pciids: add INTEL_IVB_IDS()
      drm/i915/pciids: don't include WHL/CML PCI IDs in CFL
      drm/i915/pciids: remove 11 from INTEL_ICL_IDS()
      drm/i915/pciids: remove 12 from INTEL_TGL_IDS()
      drm/i915/pciids: don't include RPL-U PCI IDs in RPL-P
      drm/i915: pass dev_priv explicitly to CURCNTR
      drm/i915: pass dev_priv explicitly to CURBASE
      drm/i915: pass dev_priv explicitly to CURPOS
      drm/i915: pass dev_priv explicitly to CURPOS_ERLY_TPT
      drm/i915: pass dev_priv explicitly to CURSIZE
      drm/i915: pass dev_priv explicitly to CUR_FBC_CTL
      drm/i915: pass dev_priv explicitly to CUR_CHICKEN
      drm/i915: pass dev_priv explicitly to CURSURFLIVE
      drm/i915/pciids: switch to xe driver style PCI ID macros
      drm/i915: stop redefining INTEL_VGA_DEVICE
      drm/nouveau: convert to using is_hdmi and has_audio from display info
      drm/radeon: convert to using is_hdmi and has_audio from display info
      drm/radeon: remove radeon_connector_edid() and stop using edid_blob_p=
tr
      drm/amdgpu: remove amdgpu_connector_edid() and stop using edid_blob_p=
tr
      drm/edid: add a helper for EDID sysfs property show
      drm/connector: update edid_blob_ptr documentation
      drm/i915: pass dev_priv explicitly to DSPADDR_VLV
      drm/i915: pass dev_priv explicitly to DSPCNTR
      drm/i915: pass dev_priv explicitly to DSPADDR
      drm/i915: pass dev_priv explicitly to DSPLINOFF
      drm/i915: pass dev_priv explicitly to DSPSTRIDE
      drm/i915: pass dev_priv explicitly to DSPPOS
      drm/i915: pass dev_priv explicitly to DSPSIZE
      drm/i915: pass dev_priv explicitly to DSPSURF
      drm/i915: pass dev_priv explicitly to DSPTILEOFF
      drm/i915: pass dev_priv explicitly to DSPOFFSET
      drm/i915: pass dev_priv explicitly to DSPSURFLIVE
      drm/i915: pass dev_priv explicitly to DSPGAMC
      drm/i915: pass dev_priv explicitly to PRIMPOS
      drm/i915: pass dev_priv explicitly to PRIMSIZE
      drm/i915: pass dev_priv explicitly to PRIMCNSTALPHA
      drm/i915: pass dev_priv explicitly to PIPEGCMAX
      drm/bridge: analogix_dp: convert to struct drm_edid
      drm/hisilicon/hibmc: convert to struct drm_edid
      drm/loongson/7a1000: convert to struct drm_edid
      drm/loongson/7a2000: convert to struct drm_edid
      drm/imx/tve: convert to struct drm_edid
      drm/imx/ldb: convert to struct drm_edid
      drm/i915: pass dev_priv explicitly to _MMIO_PPS
      drm/i915: pass dev_priv explicitly to PP_STATUS
      drm/i915: pass dev_priv explicitly to PP_CONTROL
      drm/i915: pass dev_priv explicitly to PP_ON_DELAYS
      drm/i915: pass dev_priv explicitly to PP_OFF_DELAYS
      drm/i915: pass dev_priv explicitly to PP_DIVISOR
      drm/i915: pass dev_priv explicitly to HSW_TVIDEO_DIP_CTL
      drm/i915: pass dev_priv explicitly to HSW_TVIDEO_DIP_GCP
      drm/i915: pass dev_priv explicitly to HSW_TVIDEO_DIP_AVI_DATA
      drm/i915: pass dev_priv explicitly to HSW_TVIDEO_DIP_VS_DATA
      drm/i915: pass dev_priv explicitly to HSW_TVIDEO_DIP_SPD_DATA
      drm/i915: pass dev_priv explicitly to HSW_TVIDEO_DIP_GMP_DATA
      drm/i915: pass dev_priv explicitly to HSW_TVIDEO_DIP_VSC_DATA
      drm/i915: pass dev_priv explicitly to GLK_TVIDEO_DIP_DRM_DATA
      drm/i915: pass dev_priv explicitly to ICL_VIDEO_DIP_PPS_DATA
      drm/i915: pass dev_priv explicitly to ICL_VIDEO_DIP_PPS_ECC
      drm/i915: pass dev_priv explicitly to ADL_TVIDEO_DIP_AS_SDP_DATA
      drm/i915/display: move params copy at probe earlier
      drm/i915/display: change probe for no display case
      drm/i915/display: check platforms without display one level higher
      drm/i915/display: change GMD ID display ip ver propagation at probe
      drm/i915/display: add platform descriptors
      drm/i915: add LNL PCI IDs
      drm/i915/display: change display probe to identify GMD ID based platf=
orms
      drm/i915/display: identify platforms with enum and name
      drm/i915/display: add support for subplatforms
      drm/i915/display: add probe message
      drm/i915/gvt: use proper macros for DP AUX CH CTL registers
      drm/i915: remove unused DP AUX CH register macros
      drm/i915: rearrange DP AUX register macros
      drm/i915: move PCH DP AUX CH regs to intel_dp_aux_regs.h
      drm/i915: remove intermediate _PCH_DP_* macros
      drm/i915: drop unnecessary i915_reg.h includes
      drm/i915: reduce includes in intel_clock_gating.c
      drm: move intel-gtt.h under include/drm/intel
      drm: move i915_gsc_proxy_mei_interface.h under include/drm/intel
      drm: move i915_component.h under include/drm/intel
      drm: move intel_lpe_audio.h under include/drm/intel
      drm: move i915_drm.h under include/drm/intel
      drm: move i915_pxp_tee_interface.h under include/drm/intel
      drm: move i915_pciids.h under include/drm/intel
      drm: move xe_pciids.h under include/drm/intel
      drm: move i915_hdcp_interface.h under include/drm/intel
      MAINTAINERS: update i915 and xe entries for include/drm/intel
      drm/i915: drop redundant W=3D1 warnings from Makefile
      drm/xe: drop redundant W=3D1 warnings from Makefile
      drm/i915/display: include gem/i915_gem_stolen.h where needed
      drm/i915/display: include gt/intel_gt_types.h where needed
      drm/i915/display: include i915_gpu_error.h where needed
      drm/i915/display: include intel_uncore.h where needed
      drm/i915/display: include intel_step.h where needed
      drm/i915/display: include xe_bo.h, gem_object_types etc. where needed
      drm/xe/display: move compat uncore stubs to the correct file
      drm/xe/display: move compat runtime pm stubs to the correct file
      drm/xe/display: reduce includes in compat i915_drv.h
      drm/xe/display: drop i915_drv.h include from xe code
      drm/i915/dmc: convert intel_dmc_print_error_state() to drm_printer
      drm/i915/overlay: convert intel_overlay_print_error_state() to drm_pr=
inter
      drm/i915: pass dev_priv explicitly to DPLL
      drm/i915: pass dev_priv explicitly to DPLL_MD
      drm/i915: pass dev_priv explicitly to TRANS_HTOTAL
      drm/i915: pass dev_priv explicitly to TRANS_HBLANK
      drm/i915: pass dev_priv explicitly to TRANS_HSYNC
      drm/i915: pass dev_priv explicitly to TRANS_VTOTAL
      drm/i915: pass dev_priv explicitly to TRANS_VBLANK
      drm/i915: pass dev_priv explicitly to TRANS_VSYNC
      drm/i915: pass dev_priv explicitly to BCLRPAT
      drm/i915: pass dev_priv explicitly to TRANS_VSYNCSHIFT
      drm/i915: pass dev_priv explicitly to PIPESRC
      drm/i915: pass dev_priv explicitly to TRANS_MULT
      drm/i915: pass dev_priv explicitly to PORT_HOTPLUG_EN
      drm/i915: pass dev_priv explicitly to PORT_HOTPLUG_STAT
      drm/i915: pass dev_priv explicitly to PFIT_CONTROL
      drm/i915: pass dev_priv explicitly to PFIT_PGM_RATIOS
      drm/i915: pass dev_priv explicitly to PFIT_AUTO_RATIOS
      drm/i915: pass dev_priv explicitly to TRANSCONF
      drm/i915: pass dev_priv explicitly to PIPEDSL
      drm/i915: pass dev_priv explicitly to PIPEFRAME
      drm/i915: pass dev_priv explicitly to PIPEFRAMEPIXEL
      drm/i915: pass dev_priv explicitly to PIPESTAT
      drm/i915: pass dev_priv explicitly to PIPE_ARB_CTL
      drm/i915: pass dev_priv explicitly to ICL_PIPESTATUS
      drm/i915: pass dev_priv explicitly to DSPARB
      drm/i915: pass dev_priv explicitly to DSPFW1
      drm/i915: pass dev_priv explicitly to DSPFW2
      drm/i915: pass dev_priv explicitly to DSPFW3
      drm/i915: pass dev_priv explicitly to PIPE_FRMCOUNT_G4X
      drm/i915: pass dev_priv explicitly to PIPE_FLIPCOUNT_G4X
      drm/i915: pass dev_priv explicitly to CHV_BLEND
      drm/i915: pass dev_priv explicitly to CHV_CANVAS
      drm/i915: pass dev_priv explicitly to SWF0
      drm/i915: pass dev_priv explicitly to SWF1
      drm/i915: pass dev_priv explicitly to SWF3
      drm/i915: pass dev_priv explicitly to PIPE_DATA_M1
      drm/i915: pass dev_priv explicitly to PIPE_DATA_N1
      drm/i915: pass dev_priv explicitly to PIPE_DATA_M2
      drm/i915: pass dev_priv explicitly to PIPE_DATA_N2
      drm/i915: pass dev_priv explicitly to PIPE_LINK_M1
      drm/i915: pass dev_priv explicitly to PIPE_LINK_N1
      drm/i915: pass dev_priv explicitly to PIPE_LINK_M2
      drm/i915: pass dev_priv explicitly to PIPE_LINK_N2
      drm/i915: pass dev_priv explicitly to TRANS_DDI_FUNC_CTL
      drm/i915: pass dev_priv explicitly to TRANS_DDI_FUNC_CTL2
      drm/i915: pass dev_priv explicitly to TGL_DP_TP_CTL
      drm/i915: pass dev_priv explicitly to TGL_DP_TP_STATUS
      drm/i915: pass dev_priv explicitly to TRANS_MSA_MISC
      drm/i915: pass dev_priv explicitly to TRANS_SET_CONTEXT_LATENCY
      drm/i915: pass dev_priv explicitly to MTL_CLKGATE_DIS_TRANS
      drm/i915: do not select ACPI_BUTTON
      drm/xe: do not select ACPI_BUTTON
      drm/i915: pass dev_priv explicitly to HSW_STEREO_3D_CTL
      drm/i915/gvt: remove the unused end parameter from calc_index()
      drm/i915/gvt: use proper i915_reg_t for calc_index() parameters
      drm/i915/gvt: rename range variable to stride
      drm/i915/gvt: do not use implict dev_priv in DSPSURF_TO_PIPE()
      drm/i915: relocate some DSPCNTR reg bit definitions
      drm/i915: remove unused pipe/plane B register macros
      drm/i915/mso: using joiner is not possible with eDP MSO
      drm/i915/wm: rename intel_get_cxsr_latency -> pnv_get_cxsr_latency
      drm/i915/wm: clarify logging on not finding CxSR latency config
      drm/i915/dram: separate fsb freq detection from mem freq
      drm/i915/dram: split out pnv DDR3 detection
      drm/i915/dram: rearrange mem freq init
      drm/i915/gt: remove mem freq from gt debugfs
      drm/i915: convert fsb_freq and mem_freq to kHz
      drm/i915: extend the fsb_freq initialization to more platforms
      drm/i915: use i9xx_fsb_freq() for GT clock frequency
      drm/i915/cdclk: use i9xx_fsb_freq() for rawclk_freq initialization
      drm/i915: move comments about FSB straps to proper place
      Merge drm/drm-next into drm-intel-next
      drm/msm/dp: switch to struct drm_edid
      drm/exynos/vidi: use drm_edid_duplicate()
      drm/exynos/vidi: simplify fake edid handling
      drm/exynos/vidi: convert to struct drm_edid

Janusz Krzysztofik (2):
      Revert "drm/i915: Remove extra multi-gt pm-references"
      drm/i915/gt: Fix potential UAF by revoke of fence registers

Jason-JH.Lin (1):
      drm/mediatek: Fix bit depth overwritten for mtk_ovl_set bit_depth()

Javier Martinez Canillas (1):
      drm/tidss: Add drm_panic support

Jay Cornwall (7):
      drm/amdkfd: Move trap handler coherence flags to preprocessor
      drm/amdkfd: Add gfx12 trap handler support
      drm/amdkfd: Sync trap handler binary with source
      drm/amdkfd: Replace deprecated gfx12 trap handler instructions
      drm/amdkfd: gfx12 context save/restore trap handler fixes
      drm/amdkfd: Handle deallocated VPGRs in gfx11+ trap handler
      drm/amdkfd: Extend gfx12 trap handler fix to gfx10/11

Jayesh Choudhary (3):
      drm/bridge: sii902x: Fix mode_valid hook
      drm/bridge: sii902x: Support atomic bridge APIs
      drm/bridge: sii902x: Add pixel clock check in atomic_check

Jeff Johnson (8):
      drm/tests: add missing MODULE_DESCRIPTION() macros
      drm/panel: add missing MODULE_DESCRIPTION() macros
      drm/tiny: add missing MODULE_DESCRIPTION() macros
      drm/bridge: add missing MODULE_DESCRIPTION() macros
      drm: add missing MODULE_DESCRIPTION() macros
      drm/tests: add drm_hdmi_state_helper_test MODULE_DESCRIPTION()
      agp: add missing MODULE_DESCRIPTION() macros
      drm/ttm/tests: add missing MODULE_DESCRIPTION() macros

Jerome Brunet (4):
      dt-bindings: display: meson-dw-hdmi: add missing power-domain
      dt-bindings: panel-simple-dsi: add lincoln LCD197 panel bindings
      drm/mipi-dsi: add mipi_dsi_usleep_range helper
      drm/panel: add lincolntech lcd197 support

Jesse Zhang (42):
      drm/amd/pm: fix uninitialized variable warning
      drm/amd/pm: fix uninitialized variable warning
      drm/amd/pm: fix warning using uninitialized value of max_vid_step
      drm/amd/pm: Fix negative array index read
      drm/amd/pm: fix the Out-of-bounds read warning
      drm/amd/pm: enable UMD Pstate profile level for renoir
      drm/amdgpu: Fix the warning division or modulo by zero
      drm/amd/pm: fix get dpm level count for smu13
      drm/amd/pm: fix get dpm level count for yello carp
      drm/amdgpu: fix dereference after null check
      drm/amdgpu: fix the waring dereferencing hive
      drm/amdgpu: clear the warning unsigned compared against 0 for xcp_id
      drm/amd: fix the warning unchecking return vaule for sdma_v7
      drm/amd/pm: check specific index for aldebaran
      drm/amd/pm: check the return of send smc msg for sienna_cichild
      drm/amd/pm: check the return of send smc msg for navi10
      drm/amd/pm: check specific index for smu13
      drm/amd/pm: check the return of send smc msg for smu_v13
      drm/amdgpu: remove structurally dead code for amd_gmc
      drm/amd/pm: remove logically dead code for renoir
      drm/amdgu: remove unused code
      drm/amd/pm: fix enum type compared against 0
      drm/amd/pm: fix enum feature compared against 0
      drm/amdgpu: remove structurally dead code
      drm/amd/pm: remove logically dead code
      drm/amdgpu: the warning dereferencing obj for nbio_v7_4
      drm/amdgpu: fix the warning bad bit shift operation for
aca_error_type type
      drm/amd/pm: check negtive return for table entries
      drm/amd/pm: fix unsigned value asic_type compared against
      drm/admgpu: fix dereferencing null pointer context
      drm/amdgpu: fix invadate operation for umsch
      drm/amdgpu: fix invadate operation for pg_flags
      drm/amdgpu: fix dereference null return value for the function
amdgpu_vm_pt_parent
      drm/amdgu: fix Unintentional integer overflow for mall size
      drm/amdkfd: remove dead code in the function svm_range_get_pte_flags
      drm/amdkfd: Comment out the unused variable use_static in pm_map_queu=
es_v9
      drm/amdkfd: fix the kdf debugger issue
      drm/amdkfd: remove dead code in kfd_create_vcrat_image_gpu
      drm/amdkfd: remove logically dead code
      drm/amd/pm: remove dead code in si_convert_power_level_to_smc
      drm/amdgpu: remove dead code in atom_get_src_int
      drm/amd/pm: remove dead code in navi10_emit_clk_levels and
navi10_print_clk_levels

Jiapeng Chong (14):
      drm/amd/display: Remove duplicate spl/dc_spl_types.h header
      drm/amd/display: Remove duplicate dcn401/dcn401_clk_mgr.h header
      drm/vmwgfx: Remove duplicate vmwgfx_vkms.h header
      drm/amdgpu: Remove duplicate amdgpu_umsch_mm.h header
      drm/amd/display: clean up some inconsistent indenting
      drm/amd/display: Remove redundant code and semicolons
      drm/amd/display: Use ARRAY_SIZE for array length
      drm/amd/display: Remove unused function reverse_planes_order
      drm/amd/display: use swap() in is_config_schedulable()
      drm/amd/display: Fix unsigned comparison with less than zero
      drm/amd/display: Fix warning comparing pointer to 0
      drm/amd/display: Fix warning comparing pointer to 0
      drm/amd/display: Fix warning comparing pointer to 0
      drm/amd/display: Fix warning comparing pointer to 0

JinZe.Xu (1):
      drm/amd/display: Disable IPS when it is not allowed.

Joan Lee (3):
      drm/amd/display: Enable Replay for DCN315
      drm/amd/display: Add retires when read DPCD
      drm/amd/display: Add Replay general cmd

Jocelyn Falempe (8):
      drm/fb_dma: Add checks in drm_fb_dma_get_scanout_buffer()
      lib/fonts: Allow to select fonts for drm_panic
      Revert "drm/mgag200: Add a workaround for low-latency"
      drm/mgag200: Add an option to disable Write-Combine
      drm/panic: only draw the foreground color in drm_panic_blit()
      drm/panic: Add a set_pixel() callback to drm_scanout_buffer
      drm/panic: Add a kmsg panic screen
      drm/panic: depends on !VT_CONSOLE

John Harrison (4):
      drm/xe: Make read_perf_limit_reasons globally accessible
      drm/xe/guc: Port over the slow GuC loading support from i915
      drm/xe/guc: Fix uninitialised count in GuC load debug prints
      drm/i915/guc: Enable w/a 16021333562 for DG2, MTL and ARL

Jonathan Cavitt (5):
      drm/xe/xe_guc_submit: Fix exec queue stop race condition
      drm/xe/xe_guc_submit: Allow lr exec queues to be banned
      drm/xe/xe_guc_submit: Declare reset if banned or killed or wedged
      drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
      drm/i915/gem: Downgrade stolen lmem setup warning

Jonathan Kim (4):
      drm/amdgpu: fix trap enablement for gfx12
      drm/amdkfd: always enable ttmp setup for gfx12
      drm/amdkfd: fix support for trap on wave start and end for gfx12
      drm/amdkfd: enable single alu ops for gfx12

Jonathan Marek (4):
      drm/msm/dpu: fix video mode DSC for DSI
      drm/msm/dsi: set video mode widebus enable bit when widebus is enable=
d
      drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
      drm/msm/dsi: add a comment to explain pkt_per_line encoding

Joshua Aberback (8):
      Revert "drm/amd/display: Fix incorrect pointer assignment"
      drm/amd/display: Disable AC/DC codepath when unnecessary
      drm/amd/display: Fix swapped dimension calculations
      drm/amd/display: workaround for oled eDP not lighting up on DCN401
      drm/amd/display: Disable boot optimization for DCN401
      drm/amd/display: DCN401 full power down in HW init if any link enable=
d
      Revert "drm/amd/display: workaround for oled eDP not lighting up
on DCN401"
      drm/amd/display: Remove unnecessary error message

Josip Pavic (1):
      drm/amd/display: define abm debug interface

Jos=C3=A9 Roberto de Souza (12):
      drm/xe: Store xe_hw_engine in xe_hw_engine_snapshot
      drm/xe: Add helpers to loop over geometry and compute DSS
      drm/xe: Add INSTDONE registers to devcoredump
      drm/i915/xe2hpd: Properly disable power in port A
      drm/i915/xe2hpd: Do not program MBUS_DBOX BW credits
      drm/xe: Replace RING_START_UDW by u64 RING_START
      drm/xe: Add process name to devcoredump
      drm/xe: Add process name to devcoredump
      drm/xe: Nuke simple error capture
      devcoredump: Add dev_coredumpm_timeout()
      drm/xe: Increase devcoredump timeout
      drm/xe/oa: Call xe_oa_emit_oa_config() with new config when
updating config

Jouni H=C3=B6gander (61):
      drm/i915/psr: Rename has_psr2 as has_sel_update
      drm/i915/display: Do not print "psr: enabled" for on Panel Replay
      drm/i915/dp: Use always vsc revision 0x6 for Panel Replay
      drm/i915/psr: Rename psr2_enabled as sel_update_enabled
      drm/panelreplay: dpcd register definition for panelreplay SU
      drm/i915/psr: Detect panel replay selective update support
      drm/i915/psr: Modify intel_dp_get_su_granularity to support panel rep=
lay
      drm/i915/psr: Panel replay uses SRD_STATUS to track it's status
      drm/i915/psr: Do not apply workarounds in case of panel replay
      drm/i915/psr: Update PSR module parameter descriptions
      drm/i915/psr: Split intel_psr2_config_valid for panel replay
      drm/i915/psr: Add panel replay sel update support to debugfs interfac=
e
      drm/i915/psr: LunarLake IO and Fast Wake time line count maximums are=
 68
      drm/i915/psr: LunarLake PSR2_CTL[IO Wake Lines] is 6 bits wide
      drm/i915/psr: PSR2_CTL[Block Count Number] not needed for LunarLake
      drm/i915/psr: Store pr_dpcd in intel_dp
      drm/panel replay: Add edp1.5 Panel Replay bits and register
      drm/i915/psr: Move printing sink PSR support to own function
      drm/i915/psr: Move printing PSR mode to own function
      drm/i915/psr: modify psr status debugfs to support eDP Panel Replay
      drm/display: Add missing aux less alpm wake related bits
      drm/i915/psr: Add Early Transport status boolean into intel_psr
      drm/i915/psr: Get Early Transport status in intel_psr_pipe_get_config
      drm/i915/psr: Use enable boolean from intel_crtc_state for Early Tran=
sport
      drm/i915/display: Selective fetch Y position on Region Early Transpor=
t
      drm/i915/psr: Allow setting I915_PSR_DEBUG_SU_REGION_ET_DISABLE
via debugfs
      drm/i915/psr: Add Early Transport into psr debugfs interface
      drm/i915/alpm: Do not use fast_wake_lines for aux less wake time
      drm/i915/alpm: Write also AUX Less Wake lines into ALPM_CTL
      drm/i915/display: Take panel replay into account in vsc sdp unpacking
      drm/i915/display: Skip Panel Replay on pipe comparison if no active p=
lanes
      drm/display: Add missing Panel Replay Enable SU Region ET bit
      drm/i915/psr: Split enabling sink for PSR and Panel Replay
      drm/i915/alpm: Share alpm support checks with PSR code
      drm/i915/psr: Add Panel Replay support to intel_psr2_config_et_valid
      drm/i915/psr: Print Panel Replay status instead of frame lock status
      drm/i915/psr: Move vblank length check to separate function
      drm/i915/psr: Take into account SU SDP scanline indication in vblank =
check
      drm/i915/psr: Check vblank against IO buffer wake time on Lunarlake
      drm/i915/psr: Wake time is aux less wake time for Panel Replay
      drm/i915/psr: Set SU area width as pipe src width
      drm/i915/display: Wa 16021440873 is writing wrong register
      drm/i915/alpm: Fix port clock usage in AUX Less wake time calculation
      drm/i915/psr: Disable Panel Replay if PSR mode is set via module para=
meter
      drm/i915/psr: Disable PSR2 SU Region ET if enable_psr module
parameter is set
      drm/i915/psr: Disable PSR/Panel Replay on sink side for PSR only
      drm/i915/psr: Add new debug bit to disable Panel Replay
      Revert "drm/i915/psr: Disable early transport by default"
      intel_alpm: Fix wrong offset for PORT_ALPM_* registers
      drm/i915/psr: Set DP_PSR_SU_REGION_SCANLINE_CAPTURE bit when needed
      drm/i915/psr: Check panel ALPM capability for eDP Panel Replay
      drm/i915/psr: Inform Panel Replay source support on eDP as well
      drm/i915/psr: enable sink for eDP1.5 Panel Replay
      drm/i915/psr: Check panel Early Transport capability for eDP PR
      drm/i915/psr: 128b/132b Panel Replay is not supported on eDP
      drm/i915/psr: HW will not allow PR on eDP when HDCP enabled
      drm/i915/alpm: Make crtc_state as const in intel_alpm_compute_params
      drm/i915/psr: Perform psr2 checks related to ALPM for Panel Replay
      drm/i915/psr: Perform scanline indication check for Panel Replay as w=
ell
      drm/i915/psr: Check Early Transport for Panel Replay as well
      drm/i915/psr: Modify dg2_activate_panel_replay to support eDP

Julia Zhang (1):
      drm/amdgpu: avoid using null object of framebuffer

Jun Nie (2):
      drm/msm/dpu: adjust data width for widen bus case
      drm/msm/dpu: enable compression bit in cfg2 for DSC

Junhao Xie (1):
      drm/msm/dpu: drop duplicate drm formats from wb2_formats arrays

Karolina Stolarek (12):
      drm/ttm/tests: Fix a warning in ttm_bo_unreserve_bulk
      drm/ttm/tests: Delete unnecessary config option
      drm/ttm/tests: Set DMA mask in KUnit device
      drm/ttm/tests: Use an init function from the helpers lib
      drm/ttm/tests: Test simple BO creation and validation
      drm/ttm/tests: Add tests with mock resource managers
      drm/ttm/tests: Add test cases dependent on fence signaling
      drm/ttm/tests: Add eviction testing
      drm/ttm/tests: Add tests for ttm_tt_populate
      drm/ttm/tests: Add TODO file
      drm/ttm/tests: Correct modules' licenses
      drm/ttm/tests: Use u32 and u64 over uint*_t types

Karthik Poosa (4):
      drm/xe/hwmon: Remove unwanted write permission for currN_label
      drm/xe/hwmon: Add HWMON support for BMG
      drm/xe/hwmon: Expose card power and energy attributes of BMG
      drm/xe/hwmon: Remove xe_hwmon_process_reg

Karthikeyan Ramasubramanian (1):
      drm/i915/bios: Fix parsing backlight BDB data

Kendall Smith (1):
      drm/radeon: initialize backlight for iMac12,2 with Radeon 6750M

Kenneth Feng (24):
      drm/amd/amdgpu: imu fw loading support
      drm/amd/amdgpu: workaround for the imu fw loading
      drm/amd/amdgpu: add cgcg&cgls interface for gfx 12.0
      drm/amd/amdgpu: enable cgcg and cgls
      drm/amd/amdgpu: enable mgcg on gfx 12.0.1
      drm/amd/amdgpu: enable 3D cgcg and 3D cgls
      drm/amd/amdgpu: enable perfcounter mgcg and repeater fgcg
      drm/amd/amdgpu: enable sram fgcg on gc 12.0.1
      drm/amd/amdgpu: enable gfxoff on gc 12.0.1
      drm/amd/amdgpu: enable mmhub and athub cg on gc 12.0.1
      drm/amd/pm: support mode1 reset on smu_v14_0_3
      drm/amd/pm: enable mode1 reset on smu v14.0.2/v14.0.3
      drm/amd/pm: add tool log support on smu v14.0.2/3
      drm/amd/pm: add pp_dpm_dcefclk for smu 14.0.2/3
      drm/amd/pm: disable gpo temporarily
      drm/amd/amdgpu: add module parameter for jpeg
      drm/amd/pm: support pp_dpm_pcie on smu v14.0.2/3
      drm/amd/pm: support mode1 reset on smu v14.0.3
      drm/amd/pm: update driver-if interface
      drm/amd/amdgpu: add thm 14.0.2 header file
      drm/amd/pm: enable thermal alert on smu 14.0.2/3
      drm/amd/pm: workaround to pass jpeg unit test
      Revert "drm/amd/pm: workaround to pass jpeg unit test"
      Revert "drm/amd/amdgpu: add module parameter for jpeg"

Kent Russell (1):
      Documentation/amdgpu: Clarify MI200 and MI300 entries

Konrad Dybcio (5):
      drm/msm/a6xx: Fix A702 UBWC mode
      drm/msm/dsi: Remove dsi_phy_read/write()
      drm/msm/dsi: Remove dsi_phy_write_[un]delay()
      drm/msm/adreno: De-spaghettify the use of memory barriers
      Revert "drm/msm/a6xx: Poll for GBIF unhalt status in hw_init"

Krzysztof Kozlowski (9):
      drm/tiny: ili9225: drop driver owner assignment
      drm/tiny: mi0283qt: drop driver owner assignment
      drm/tiny: panel-mipi-dbi: drop driver owner assignment
      drm/tiny: st7586: drop driver owner assignment
      drm/etnaviv: drop driver owner assignment
      dt-bindings: display/msm/gpu: constrain clocks in top-level
      dt-bindings: display/msm/gpu: define reg-names in top-level
      dt-bindings: display/msm/gpu: simplify compatible regex
      dt-bindings: display/msm/gpu: fix the schema being not applied

Kuro Chung (2):
      drm/bridge: it6505: fix hibernate to resume no display issue
      drm/bridge: it6505: update usleep_range for RC circuit charge time

Lancelot SIX (2):
      drm/amdkfd: Flush the process wq before creating a kfd_process
      drm/amdkfd: save and restore barrier state for gfx12

Lang Yu (2):
      drm/amdkfd: handle duplicate BOs in reserve_bo_and_cond_vms
      drm/amdkfd: Let VRAM allocations go to GTT domain on small APUs

Laurent Morichetti (1):
      drm/amdkfd: enable missed single-step workaround for gfx12

Leo (Hanghong) Ma (1):
      drm/amd/display: Always enable HPO for DCN4 dGPU

Leo Li (3):
      drm/amd/display: Introduce overlay cursor mode
      drm/amd/display: Move PRIMARY plane zpos higher
      Revert "drm/amd/display: Reset freesync config before update new stat=
e"

Leo Ma (2):
      drm/amd/display: Fix DC mode screen flickering on DCN321
      drm/amd/display: Fix invalid Copyright notice

Leon Huang (1):
      drm/amd/display: Expand supported Replay residency mode

Lewis Huang (1):
      drm/amd/display: Add monitor patch skip disable crtc during psr and i=
ps1

Li Ma (5):
      drm/amd/swsmu: update Dpmclocks_t for smu v14.0.1
      drm/amdgpu/atomfirmware: add intergrated info v2.3 table
      drm/amd/swsmu: add MALL init support workaround for smu_v14_0_1
      drm/amd/pm: smu v14.0.4 reuse smu v14.0.0 dpmtable
      drm/amd/swsmu: enable more Pstates profile levels for SMU
v14.0.0 and v14.0.1

Lijo Lazar (23):
      drm/amd/amdxcp: Use unique name for partition dev
      Revert "drm/amdkfd: Add partition id field to location_id"
      drm/amd/amdxcp: Fix warnings
      drm/amd/pm: Fix aldebaran pcie speed reporting
      drm/amdgpu: Fix memory range calculation
      drm/amdgpu: Add nps info table to IP discovery
      drm/amdgpu: Use NPS ranges from discovery table
      drm/amd/pm: Add support for DPM policies
      drm/amd/pm: Update PMFW messages for SMUv13.0.6
      drm/amd/pm: Add support to select pstate policy
      drm/amd/pm: Add xgmi plpd policy to pm_policy
      drm/amd/pm: Add xgmi plpd to SMU v13.0.6 pm_policy
      drm/amd/pm: Add xgmi plpd to aldebaran pm_policy
      drm/amd/pm: Add xgmi plpd to arcturus pm_policy
      drm/amd/pm: Remove legacy interface for xgmi plpd
      drm/amd/pm: Remove unused interface to set plpd
      Documentation/amdgpu: Add PM policy documentation
      drm/amdgpu: Add CRC16 selection in config
      drm/amdgpu: Skip coredump during resets for debug
      drm/amdgpu: Fix pci state save during mode-1 reset
      drm/amdgpu: Don't show false warning for reg list
      drm/amdkfd: Use device based logging for errors
      drm/amdgpu: Initialize VF partition mode

Likun Gao (39):
      drm/amdgpu/discovery: Add common soc24 ip block
      drm/amdgpu: Add gfxhub v12_0 ip block support (v3)
      drm/amdgpu/discovery: Add gmc v12_0 ip block
      drm/amdgpu: add gfx12 mqd structures
      drm/amdgpu: Add new members for sdma v7_0 fw
      drm/amdgpu: Add sdma fw v3 structure
      drm/amdgpu: Add sdma v7_0 ip block support (v7)
      drm/amdgpu: support SDMA v3 struct fw front door load
      drm/amdgpu: provide more ucode name shown via id
      drm/amdgpu/discovery: add sdma v7_0 ip block
      drm/amdgpu: Add gfx v12_0_0 family id
      drm/amdgpu/discovery: Set GC family for GC 12.0 IP
      drm/amdgpu: add gfx12 clearstate header
      drm/amdgpu: add new TOC structure
      drm/amdgpu: add rlc TOC header file for soc24
      drm/amdgpu: init mes ucode name for gfx v12
      drm/amdgpu: set mes fw address for mes v12
      drm/amdgpu: Add gfx v12_0 ip block support (v6)
      drm/amdgpu: set cp fw address set for gfx v12
      drm/amdgpu: skip imu related function if dpm=3D0
      drm/amdgpu: support S&R fw load for gfx v12
      drm/amd: Move fw init from sw_init to early_init for imu v12
      drm/amdgpu: set different fw data addr for mec pipe
      drm/amdgpu: use new method to program rlc ram
      drm/amdgpu: fix active rb and cu number for gfx12
      drm/amdgpu: skip dpm check to init imu fw
      drm/amdgpu: init gfxhub setting to align with mmhub
      drm/amdgpu/discovery: add gfx v12_0 ip block
      drm/amdgpu/discovery: add mes v12_0 ip block
      drm/amdgpu: support cg state get for gfx v12
      drm/amdgpu: fix spl component for psp v14
      drm/amdgpu: support imu for gc 12_0_0
      drm/amdgpu: enable gfx cgcg&cgls for gfx v12_0_0
      drm/amdgpu: enable some cg feature for gc 12.0.0
      drm/amdgpu: switch default mes to uni mes
      drm/amd/amdgpu: enable mmhub and athub cg on gc 12.0.0
      drm/amdgpu: enable gfxoff for gc v12.0.0
      drm/amdgpu: support for DCC feature
      drm/amdgpu: init TA fw for psp v14

Lin.Cao (2):
      drm/amdkfd: Check debug trap enable before write dbg_ev_file
      drm/amdgpu: fix failure mapping legacy queue when FLR

Luca Ceresoli (1):
      Revert "drm/bridge: ti-sn65dsi83: Fix enable error path"

Luca Coelho (3):
      Documentation/i915: remove kernel-doc for DMC wakelocks
      drm/i915/bios: double check array-boundary in parse_sdvo_lvds_data
      drm/i915: move uapi.event outside spinlock in intel_crtc_vblank_work

Lucas De Marchi (21):
      drm/xe/display: Fix ADL-N detection
      drm/xe: Merge 16021540221 and 18034896535 WAs
      drm/i915/xe2hpd: Add display info
      drm/xe/ads: Use flexible-array
      drm/xe: Drop __engine_mask
      drm/xe: Drop useless forcewake get/put
      drm/xe: Move xe_gt_init_early() where it belongs
      drm/xe: Move xe_force_wake_init_gt() inside gt initialization
      drm/xe: Move sw-only pcode initialization
      drm/xe: Promote xe_hw_engine_class_to_str()
      drm/xe: Add XE_ENGINE_CLASS_OTHER to str conversion
      drm/xe: Add helper to capture engine timestamp
      drm/xe: Cache data about user-visible engines
      drm/xe: Add helper to return any available hw engine
      drm/xe/client: Print runtime to fdinfo
      drm/xe/rtp: Allow to match 0 sr entries
      drm/xe/rtp: Expand max rules/actions per entry
      drm/xe/rtp: Allow to OR rules
      drm/xe/rtp: Add match on any GT
      drm/xe/xe2: Add proper check for media in Wa_14020756599
      drm/xe/rtp: Fix out-of-bounds array access

Lucas Stach (24):
      drm/bridge: analogix_dp: properly handle zero sized AUX transactions
      drm/bridge: analogix_dp: don't adjust further when clock
recovery succeeded
      drm/etnaviv: don't disable TS on MMUv2 core when moving the linear wi=
ndow
      drm/etnaviv: switch devcoredump allocations to GFP_NOWAIT
      drm/etnaviv: fix DMA direction handling for cached RW buffers
      drm/etnaviv: reduce number of ktime_get calls in IRQ handler
      drm/etnaviv: don't block scheduler when GPU is still active
      gpu: ipu-v3: pre: move state into struct
      gpu: ipu-v3: pre: add dynamic buffer layout reconfiguration
      gpu: ipu-v3: pre: don't use fixed timeout when waiting for safe windo=
w
      drm/bridge: analogix_dp: remove unused platform power_on_end callback
      drm/rockchip: analogix_dp: add runtime PM handling
      drm/bridge: analogix_dp: register AUX bus after enabling runtime PM
      drm/bridge: analogix_dp: handle clock via runtime PM
      drm/bridge: analogix_dp: remove unused analogix_dp_remove
      drm/bridge: analogix_dp: remove clk handling from analogix_dp_set_bri=
dge
      drm/bridge: analogix_dp: move platform and PHY power handling
into runtime PM
      drm/bridge: analogix_dp: move basic controller init into runtime PM
      drm/bridge: analogix_dp: remove PLL lock check from
analogix_dp_config_video
      drm/bridge: analogix_dp: move macro reset after link bandwidth settin=
g
      drm/bridge: analogix_dp: don't wait for PLL lock too early
      drm/bridge: analogix_dp: simplify and correct PLL lock checks
      drm/bridge: analogix_dp: only read AUX status when an error occured
      drm/bridge: analogix_dp: handle AUX transfer timeouts

Ma Jun (19):
      drm/amdgpu: Fix uninitialized variable warning in amdgpu_afmt_acr
      drm/amdgpu/pm: Check the return value of smum_send_msg_to_smc
      drm/amdgpu/pm: Fix uninitialized variable warning for smu10
      drm/amdgpu/pm: Fix uninitialized variable agc_btc_response
      drm/amdgpu: Fix the uninitialized variable warning
      drm/amdgpu: Fix out-of-bounds write warning
      drm/amdgpu: Fix out-of-bounds read of df_v1_7_channel_number
      drm/amdgpu: Fix uninitialized variable warning in amdgpu_info_ioctl
      drm/amdgpu/pm: Fix the param type of set_power_profile_mode
      drm/amdgpu/pm: Check input value for CUSTOM profile mode setting
on legacy SOCs
      drm/amdgpu/pm: Check input value for power profile setting on
smu11, smu13 and smu14
      drm/amdgpu/pm: Fix code alignment issue
      drm/amdgpu/pm: Drop redundant setting code for pcie lanes
      drm/amdgpu: Fix null pointer dereference to bo
      drm/amdgpu: Remove dead code in amdgpu_ras_add_mca_err_addr
      drm/amdgpu/pm: Fix the null pointer dereference for smu7
      drm/amdgpu/pm: Drop hard-code value of usTMax
      drm/amdgpu: Fix the null pointer dereference to ras_manager
      drm/amdgpu/pm: Fix the null pointer dereference in
apply_state_adjust_rules

Ma Ke (1):
      drm/amd/display: Add null check before access structs

Maarten Lankhorst (2):
      drm: Add drm_vblank_work_flush_all().
      drm/i915: Use the same vblank worker for atomic unpin

Maciej Falkowski (2):
      accel/ivpu: Abort jobs of faulty context
      accel/ivpu: Add test mode flag for disabling timeouts

Manikandan Muralidharan (7):
      drm: atmel-hlcdc: add driver ops to differentiate HLCDC and XLCDC IP
      drm: atmel_hlcdc: replace regmap_read with regmap_read_poll_timeout
      drm: atmel_hlcdc: Add support for XLCDC using IP specific driver ops
      drm: atmel-hlcdc: add DPI mode support for XLCDC
      drm: atmel-hlcdc: add vertical and horizontal scaling support for XLC=
DC
      drm: atmel-hlcdc: add support for DSI output formats
      drm: atmel-hlcdc: add LCD controller layer definition for sam9x75

Marc Gonzalez (1):
      drm: bridge: simple-bridge: use devm_drm_bridge_add in probe

Marcelo Mendes Spessoto Junior (1):
      drm/amd/display: fix documentation warnings for mpc.h

Marek Ol=C5=A1=C3=A1k (14):
      drm/amdgpu: define new gfx12 uapi flags
      drm/amdgpu: check for LINEAR_ALIGNED correctly in check_tiling_flags_=
gfx6
      drm/amdgpu/gfx11: remove superfluous cache flags
      drm/amdgpu/gfx12: remove superfluous cache flags
      drm/amdgpu/gfx12: remove GDS leftovers
      drm/amdgpu: remove AMD_FMT_MOD_GFX12_DCC_MAX_COMPRESSED_BLOCK_*
definitions
      drm/amdgpu/display: handle gfx12 in dm_check_cursor_fb
      drm/amdgpu: don't use amdgpu_lookup_format_info on gfx12
      drm/amdgpu: handle gfx12 in amdgpu_display_verify_sizes
      drm/amdgpu/display: handle gfx12 in amdgpu_dm_plane_format_mod_suppor=
ted
      drm/amdgpu/display: set plane attributes for gfx12 correctly
      drm/amdgpu/display: add all gfx12 modifiers
      drm/amdgpu: add amdgpu_framebuffer::gfx12_dcc
      drm/amdgpu: rewrite convert_tiling_flags_to_modifier_gfx12

Marek Vasut (11):
      drm/bridge: tc358767: Enable FRMSYNC timing generator
      drm/bridge: tc358767: Fix comment in tc_edp_mode_valid
      drm/bridge: tc358767: Check if fully initialized before
signalling HPD event via IRQ
      dt-bindings: display: synopsys, dw-hdmi: Document ddc-i2c-bus in core
      dt-bindings: display: synopsys, dw-hdmi: Mark ddc-i2c-bus as deprecat=
ed
      dt-bindings: display: bridge: tc358767: Keep enum sorted
      drm/bridge: tc358767: Split tc_pxl_pll_en() into parameter
calculation and enablement
      drm/bridge: tc358767: Use tc_pxl_pll_calc() to correct adjusted_mode =
clock
      drm/bridge: tc358767: Drop line_pixel_subtract
      drm/bridge: tc358767: Set LSCLK divider for SYSCLK to 1
      Revert "drm/bridge: tc358767: Set default CLRSIPO count"

MarileneGarcia (1):
      drm/dp: Fix documentation warning

Mario Limonciello (12):
      drm/amd/display: Disable panel replay by default for now
      dm/amd/pm: Fix problems with reboot/shutdown for some SMU
13.0.4/13.0.11 users
      drm/amd/display: Don't register panel_power_savings on OLED panels
      drm/amd/display: Drop pixel_clock_mhz
      drm/amd/display: Pass errors from amdgpu_dm_init() up
      drm/amd/display: Enable colorspace property for MST connectors
      drm/amd: Fix shutdown (again) on some SMU v13.0.4/11 platforms
      drm/amd/display: Set default brightness according to ACPI
      drm/amd/pm: powerplay: Add `__counted_by` attribute for flexible arra=
ys
      Documentation/amdgpu: Add Ryzen AI 300 series processors
      Documentation/amdgpu: Add Ryzen 9000 series processors
      drm/amd: Don't initialize ISP hardware without FW

Matt Roper (7):
      drm/i915/xe2hpd: Add max memory bandwidth algorithm
      drm/i915/bmg: BMG should re-use MTL's south display logic
      drm/xe: Don't refer to general LRC initialization as a "wa"
      drm/xe/bmg: Add PCI IDs
      drm/xe/mocs: Update MOCS assertions and remove redundant checks
      drm/xe/mocs: Clarify difference between hw and sw sizes
      drm/xe/mcr: Avoid clobbering DSS steering

Matthew Auld (24):
      drm/xe/preempt_fence: enlarge the fence critical section
      Revert "drm/xe/vm: drop vm->destroy_work"
      drm/xe/vm: prevent UAF in rebind_work_func()
      drm/xe/gt_print: add xe_gt_err_once()
      drm/i915/display: perform transient flush
      drm/xe/pci: remove broken driver_release
      drm/xe: covert sysfs over to devm
      drm/xe/ggtt: use drm_dev_enter to mark device section
      drm/xe/guc: move guc_fini over to devm
      drm/xe/guc: s/guc_fini/guc_fini_hw/
      drm/xe/guc_pc: move pc_fini to devm
      drm/xe/guc_pc: s/pc_fini/pc_fini_hw/
      drm/xe/irq: move irq_uninstall over to devm
      drm/xe/device: move flr to devm
      drm/xe/device: move xe_device_sanitize over to devm
      drm/xe/coredump: move over to devm
      drm/xe/gt: break out gt_fini into sw vs hw state
      drm/xe: make gt_remove use devm
      drm/xe/mmio: move mmio_fini over to devm
      drm/xe: reset mmio mappings with devm
      drm/xe/display: move display fini stuff to devm
      drm/xe/display: stop calling domains_driver_remove twice
      drm/xe/display: move device_remove over to drmm
      drm/xe: fix error handling in xe_migrate_update_pgtables

Matthew Brost (42):
      drm/xe: Delete unused GuC submission_state.suspend
      drm/xe: s/ENGINE_STATE_ENABLED/EXEC_QUEUE_STATE_ENABLED
      drm/xe: s/ENGINE_STATE_SUSPENDED/EXEC_QUEUE_STATE_SUSPENDED
      drm/xe: s/ENGINE_STATE_KILLED/EXEC_QUEUE_STATE_KILLED
      drm/xe: Fix alignment in GuC exec queue state defines
      drm/xe: Replace engine references with exec queue in xe_guc_submit.c
      drm/xe: Lock all gpuva ops during VM bind IOCTL
      drm/xe: Add ops_execute function which returns a fence
      drm/xe: Move migrate to prefetch to op_lock_and_prep function
      drm/xe: Add struct xe_vma_ops abstraction
      drm/xe: Use xe_vma_ops to implement xe_vm_rebind
      drm/xe: Simplify VM bind IOCTL error handling and cleanup
      drm/xe: Use xe_vma_ops to implement page fault rebinds
      drm/xe: Add some members to xe_vma_ops
      drm/xe: Add vm_bind_ioctl_ops_fini helper
      drm/xe: Move ufence check to op_lock_and_prep
      drm/xe: Move ufence add to vm_bind_ioctl_ops_fini
      drm/xe: Add xe_gt_tlb_invalidation_range and convert PT layer to use =
this
      drm/xe: Delete PT update selftest
      drm/xe: Use ordered WQ for G2H handler
      drm/xe: Only use reserved BCS instances for usm migrate exec queue
      drm/xe: Only zap PTEs as needed
      drm/xe: Decouple job seqno and lrc seqno
      drm/xe: Fix NULL ptr dereference in devcoredump
      drm/xe: Don't overmap identity VRAM mapping
      drm/xe: Do not dereference NULL job->fence in trace points
      drm/xe: Rework GPU page fault handling
      drm/xe: Drop EXEC_QUEUE_FLAG_BANNED
      drm/xe: Add LRC ctx timestamp support functions
      drm/xe: Add MI_COPY_MEM_MEM GPU instruction definitions
      drm/xe: Emit ctx timestamp copy in ring ops
      drm/xe: Add ctx timestamp to LRC snapshot
      drm/xe: Add xe_gt_clock_interval_to_ms helper
      drm/xe: Improve unexpected state error messages
      drm/xe: Assert runnable state in handle_sched_done
      drm/xe: Add GuC state asserts to deregister_exec_queue
      drm/xe: Add pending disable assert to handle_sched_done
      drm/xe: Add killed, banned, or wedged as stick bit during GuC reset
      drm/xe: Sample ctx timestamp to determine if jobs have timed out
      drm/xe: Invert runnable_state / pending enable check and assert
      drm/xe: Simplify locking in new_vma
      drm/xe: Drop trace_xe_hw_fence_free

Maxime Ripard (34):
      Merge drm/drm-next into drm-misc-next
      drm/connector: Introduce an HDMI connector initialization function
      drm/tests: connector: Add tests for drmm_connector_hdmi_init
      drm/connector: hdmi: Create an HDMI sub-state
      drm/connector: hdmi: Add output BPC to the connector state
      drm/mode_object: Export drm_mode_obj_find_prop_id for tests
      drm/tests: Add output bpc tests
      drm/connector: hdmi: Add support for output format
      drm/tests: Add output formats tests
      drm/display: hdmi: Add HDMI compute clock helper
      drm/tests: Add HDMI TDMS character rate tests
      drm/connector: hdmi: Calculate TMDS character rate
      drm/tests: Add TDMS character rate connector state tests
      drm/connector: hdmi: Add custom hook to filter TMDS character rate
      drm/tests: Add HDMI connector rate filter hook tests
      drm/connector: hdmi: Compute bpc and format automatically
      drm/tests: Add HDMI connector bpc and format tests
      drm/doc: Remove unused Broadcast RGB Property
      drm/connector: hdmi: Add Broadcast RGB property
      drm/tests: Add tests for Broadcast RGB property
      drm/connector: hdmi: Add RGB Quantization Range to the connector stat=
e
      drm/tests: Add RGB Quantization tests
      drm/connector: hdmi: Add Infoframes generation
      drm/tests: Add infoframes test
      drm/connector: hdmi: Create Infoframe DebugFS entries
      drm/vc4: hdmi: Switch to HDMI connector
      drm/vc4: tests: Remove vc4_dummy_plane structure
      drm/vc4: tests: Convert to plane creation helper
      drm/rockchip: inno_hdmi: Switch to HDMI connector
      drm/sun4i: hdmi: Switch to HDMI connector
      drm/sun4i: Fix compilation error
      drm/display: Fix HDMI state helper dependency
      drm/connector: hdmi: Fix kerneldoc warnings
      Merge drm-misc-next-2024-07-04 into drm-misc-next-fixes

Ma=C3=ADra Canal (6):
      drm/v3d: Add Performance Counters descriptions for V3D 4.2 and 7.1
      drm/v3d: Different V3D versions can have different number of perfcnt
      drm/v3d: Create a new V3D parameter for the maximum number of perfcnt
      drm/v3d: Create new IOCTL to expose performance counters information
      drm/v3d: Use V3D_MAX_COUNTERS instead of V3D_PERFCNT_NUM
      drm/v3d: Deprecate the use of the Performance Counters enum

Meenakshikumar Somasundaram (1):
      drm/amd/display: Allocate zero bw after bw alloc enable

Michael Chen (1):
      drm/amdkfd: Reconcile the definition and use of oem_id in struct
kfd_topology_device

Michael Strauss (5):
      drm/amd/display: Add delay to improve LTTPR UHBR interop
      drm/amd/display: Update FIXED_VS retimer training pattern delay
      drm/amd/display: Add fallback defaults for invalid LTTPR DPCD caps
      drm/amd/display: Attempt to avoid empty TUs when endpoint is DPIA
      drm/amd/display: Send DP_TOTAL_LTTPR_CNT during detection if
LTTPR is present

Michael Walle (4):
      dt-bindings: display: panel: add Ilitek ili9806e panel controller
      drm/panel: add Ilitek ILI9806E panel driver
      drm/mediatek: dpi/dsi: Fix possible_crtcs calculation
      drm/mediatek/dp: Fix spurious kfree()

Michal Wajdeczko (125):
      drm/xe/guc: Add GuC Relay ABI version 1.0 definitions
      drm/xe: Add helper to calculate adjusted register offset
      drm/xe: Add few more GT register definitions
      drm/xe/pf: Add SR-IOV GuC Relay PF services
      drm/xe/kunit: Add PF service tests
      drm/xe/pf: Expose SR-IOV VFs configuration over debugfs
      drm/xe/pf: Expose SR-IOV VF control commands over debugfs
      drm/xe/pf: Expose SR-IOV policy settings over debugfs
      drm/xe/guc: Update VF configuration KLVs definitions
      drm/xe/pf: Clamp maximum execution quantum to 100s
      drm/xe/guc: Improve GuC doorbell/context ID manager intro message
      drm/xe: Check result of drmm_mutex_init()
      drm/xe/pf: Expose PF service details via debugfs
      drm/xe/guc: Fix typos in VF CFG KLVs descriptions
      drm/xe/pf: Re-initialize SR-IOV specific HW settings
      drm/xe/pf: Initialize and update PF services on driver init
      drm/xe: Add helpers for manipulating macro arguments
      drm/xe/kunit: Add simple tests for new xe_args macros
      drm/xe/rtp: Prefer helper macros from xe_args.h
      drm/xe: Fix xe_mocs.h
      drm/xe: Don't rely on xe_assert.h to be included elsewhere
      drm/xe: Don't rely on xe_force_wake.h to be included elsewhere
      drm/xe: Fix xe_device.h
      drm/xe: Move xe_gpu_commands.h file to instructions/
      drm/xe: Rename few xe_args.h macros
      drm/xe: Fix xe_gt_throttle_sysfs.h
      drm/xe: Fix xe_guc_ads.h
      drm/xe: Fix xe_lrc.h
      drm/xe: Fix xe_reg_sr.h
      drm/xe/uc: Reorder post hwconfig uC initialization step
      drm/xe/uc: Move GuC submission init to post hwconfig step
      drm/xe/pf: Don't advertise support to enable VFs if not ready
      drm/xe/pf: Implement pci_driver.sriov_configure callback
      drm/xe/guc: Add more KLV helper macros
      drm/xe/guc: Introduce GuC KLV thresholds set
      drm/xe/guc: Add support for threshold KLVs in to_string() helper
      drm/xe/pf: Introduce functions to configure VF thresholds
      drm/xe/pf: Allow configuration of VF thresholds over debugfs
      drm/xe/guc: Add GUC2PF_ADVERSE_EVENT to ABI
      drm/xe/pf: Track adverse events notifications from GuC
      drm/xe/pf: Expose PF monitor details via debugfs
      drm/xe/guc: Add VF2GUC_MATCH_VERSION to ABI
      drm/xe/guc: Add VF2GUC_VF_RESET to ABI
      drm/xe/guc: Add VF2GUC_QUERY_SINGLE_KLV to ABI
      drm/xe/vf: Add support for VF to query its configuration
      drm/xe/vf: Custom hardware config load step if VF
      drm/xe/vf: Expose SR-IOV VF attributes to GT debugfs
      drm/xe: Fix xe_uc.h
      drm/xe: Fix xe_gsc.h
      drm/xe: Fix xe_huc.h
      drm/xe: Fix xe_guc_pc.h
      drm/i915/display: Add missing include to intel_vga.c
      drm/xe: Don't rely on indirect includes from xe_mmio.h
      drm/xe: Cleanup xe_mmio.h
      drm/xe/guc: Allow to initialize submission with limited set of IDs
      drm/xe/vf: Custom GuC initialization if VF
      drm/xe/uc: Don't emit false error if running in execlist mode
      drm/xe/vf: Use register values obtained from the PF
      drm/xe/guc: Add GLOBAL_CFG_GMD_ID KLV definition
      drm/xe/vf: Obtain value of GMDID register from GuC
      drm/xe/vf: Provide early access to GMDID register
      drm/xe/vf: Cache value of the GMDID register
      drm/xe/vf: Treat GMDID as another runtime register
      drm/xe/vf: Read VF configuration prior to GGTT initialization
      drm/xe/vf: Use only assigned GGTT region
      drm/xe: Store platform name in xe_device.info
      drm/xe: Use platform name in xe_assert()
      drm/xe: Drop undesired prefix from the platform name
      drm/xe: Move XEHP_MTCFG_ADDR register definition to xe_regs.h
      drm/xe: Move BAR definitions to dedicated file
      drm/xe: Drop xe_ prefix from static functions in xe_mmio.c
      drm/xe: Promote VRAM initialization function to own file
      drm/xe/vf: Setup VRAM based on received config data
      drm/xe: Split MCR initialization
      drm/xe/pf: Update the LMTT when freeing VF GT config
      drm/xe/vf: Support only GuC/HuC firmwares
      drm/xe/vf: Custom uC initialization
      drm/xe/vf: Custom GuC reset
      drm/xe/vf: Custom GT restart
      drm/print: Add missing [drm] prefix to drm based WARN
      drm/print: Kill ___drm_dbg()
      drm/print: Add generic drm dev printk function
      drm/print: Improve drm_dbg_printer
      drm/i915: Don't use __func__ as prefix for drm_dbg_printer
      drm/xe/guc: Split g2h worker function
      drm/xe/guc: Allow CTB G2H processing without G2H IRQ
      drm/xe/pf: Assert LMEM provisioning is done only on DGFX
      drm/xe/guc: Move H2G SETUP_PC_GUCRC definition to SLPC ABI
      drm/xe/guc: Add pc_to_ct() helper
      drm/xe/guc: Prefer GT oriented messages in xe_guc_pc
      drm/xe/guc: Drop unused legacy GuC message ABI definitions
      drm/xe/guc: Add kernel-doc for HXG Fast Request
      drm/xe: Prefer GT oriented messages in xe_force_wake.c
      drm/xe: Kill fw_to_gt() helper
      drm/xe: Include additional info on failed force-wake operation
      drm/xe: Combine common force-wake code into helpers
      drm/xe/vf: Ignore force-wake requests if VF
      drm/xe/vf: Use correct check for being a VF driver
      drm/xe: Drop duplicated declaration
      drm/xe: Use fixed CCS mode when running in SR-IOV mode
      drm/xe/uc: Fix and start using xe_uc_fw_sanitize()
      drm/xe: Allow const pointer when checking SR-IOV mode
      drm/xe/vf: Don't touch GuC irq registers if using memory irqs
      drm/xe: Use ttm_uncached for BO with NEEDS_UC flag
      drm/xe/guc: Move ARAT interrupts enabling to the upload step
      drm/xe/oa: Fix potential NPD when OA is not initialized
      drm/xe/vf: Disable features that do not apply to VFs
      drm/xe/vf: Don't run any save-restore RTP actions if VF
      drm/xe/vf: Don't apply tile workarounds if VF
      drm/xe/vf: Don't change hwe IRQ masks if using memory IRQs
      drm/xe/vf: Don't initialize OA if VF
      drm/xe/vf: Don't support gtidle if VF
      drm/xe/vf: Don't use register based TLB invalidation if VF
      drm/xe/vf: Skip engine ring enabling if VF
      drm/xe/vf: Custom HuC initialization if VF
      drm/xe/huc: Use GT oriented error messages in xe_huc.c
      drm/xe/vf: Skip attempt to start GuC PC if VF
      drm/xe/guc: Demote the H2G retry log message to debug
      drm/xe/guc: Add more GuC error codes to ABI
      drm/xe/guc: Print GuC error codes as hex value
      drm/xe/pf: Trigger explicit FLR while disabling VFs
      drm/xe/pf: Disable VFs on remove
      drm/xe/pf: Remove inlined #ifdef CONFIG_PCI_IOV
      drm/xe/pf: Skip fair VFs provisioning if already provisioned
      drm/xe/pf: Restart VFs provisioning after GT reset

Michel D=C3=A4nzer (1):
      drm/amdgpu: Fix comparison in amdgpu_res_cpu_visible

Mika Kahola (3):
      drm/i915/display: Calculate crtc clock rate based on PLL parameters
      drm/i915/display: Revert "drm/i915/display: Skip C10 state
verification in case of fastset"
      drm/i915/display: Add compare config for MTL+ platforms

Mitul Golani (12):
      drm/i915: Update indentation for VRR registers and bits
      drm/i915: Separate VRR related register definitions
      drm/i915: Define and compute Transcoder CMRR registers
      drm/i915: Update trans_vrr_ctl flag when cmrr is computed
      drm/dp: Add refresh rate divider to struct representing AS SDP
      drm/i915/display: Add support for pack and unpack
      drm/i915/display: Compute Adaptive sync SDP params
      drm/i915/display: Compute vrr vsync params
      drm/i915: Compute CMRR and calculate vtotal
      drm/i915/display: Send vrr vsync params whne vrr is enabled
      drm/i915/display: Update calculation to avoid overflow
      drm/i915/display: Consider adjusted_pixel_rate to be u64

Mounika Adhuri (1):
      drm/amd/display: Refactor DCN3X into component folder

Mukul Joshi (3):
      drm/amdkfd: Fix CU Masking for GFX 9.4.3
      drm/amdgpu: Add missing locking for MES API calls
      Revert "drm/amdgpu: Add missing locking for MES API calls"

Natanel Roizenman (1):
      drm/amd/display: Add null check in resource_log_pipe_topology_update

Nathan Chancellor (4):
      drm/amd/display: Add frame_warn_flag to dml2_core_shared.o
      drm/amd/display: Fix CFLAGS for dml2_core_dcn4_calcs.o
      drm/amd/display: Avoid -Wenum-float-conversion in
add_margin_and_round_to_dfs_grainularity()
      drm/omap: Restrict compile testing to PAGE_SIZE less than 64KB

Neil Armstrong (2):
      drm/msm/adreno: fix a7xx gpu init
      drm/msm/adreno: fix a743 and a740 cx mem init

Nevenko Stupar (6):
      drm/amd/display: gpuvm handling in DML21
      drm/amd/display: Fix multiple cursors when using 4 displays on a
contiguous large surface
      drm/amd/display: Fix cursor issues with ODMs and HW rotations
      drm/amd/display: Fix cursor size issues
      drm/amd/display: Fix cursor issues with ODMs and magnification
      drm/amd/display: Adjust cursor visibility between MPC slices

Nicholas Kazlauskas (12):
      drm/amd/display: Force flush after write to IPS driver signals
      drm/amd/display: Add trigger FIFO resync path for DCN35
      drm/amd/display: Notify idle link detection through shared state
      drm/amd/display: Fix idle optimization checks for multi-display
and dual eDP
      drm/amd/display: Add outbox notification support for HPD redetect
      drm/amd/display: Guard reading 3DLUT registers for dcn32/dcn35
      drm/amd/display: Don't use fsleep for PSR exit waits on dmub replay
      drm/amd/display: Wake DMCUB before sending a command for replay featu=
re
      drm/amd/display: Add sequential ONO sequencing for DCN35
      drm/amd/display: Remove register from DCN35 DMCUB diagnostic collecti=
on
      drm/amd/display: Disable DMCUB timeout for DCN35
      drm/amd/display: Add debug option for disabling SLDO optimizations

Nicholas Susanto (4):
      drm/amd/display: Enable urgent latency adjustments for DCN35
      drm/amd/display: Fix pipe addition logic in calc_blocks_to_ungate DCN=
35
      drm/amd/display: Fix DML2 logic to set clk state to min
      drm/amd/display: Temporarily disable HPO PG on DCN35

Nick Hollinghurst (1):
      drm: Add DRM_MODE_TV_MODE_MONOCHROME

Niemiec, Krzysztof (1):
      drm/i915/gt: Delete the live_hearbeat_fast selftest

Niranjana Vishwanathapura (8):
      drm/xe: Minor cleanup in LRC handling
      drm/xe: Add Indirect Ring State support
      drm/xe: Dump Indirect Ring State registers
      drm/xe/xe2: Enable Indirect Ring State support for Xe2
      drm/xe: Properly handle alloc_guc_id() failure
      drm/xe: Remove unwanted mutex locking
      drm/xe: Decouple xe_exec_queue and xe_lrc
      drm/xe: Add kernel-doc to some xe_lrc interfaces

Nirmoy Das (16):
      drm/xe: Remove uninitialized end var from xe_gt_tlb_invalidation_rang=
e()
      drm/xe/device: implement transient flush
      drm/xe: Introduce has_atomic_enable_pte_bit device info
      drm/xe: Move vm bind bo validation to a helper function
      drm/xe: Introduce has_device_atomics_on_smem device info
      drm/xe: Add function to check if BO has single placement
      drm/xe: Refactor default device atomic settings
      drm/i915/selftests: Set always_coherent to false when reading from CP=
U
      drm/xe: Add warn when level can not be zero.
      drm/xe/tests: Use uninterruptible VM lock
      drm/xe: Check empty pinned BO list with lock held.
      drm/xe: Add engine name to the engine reset and cat-err log
      drm/xe: Use missing lock in relay_needs_worker
      drm/xe/client: Check return value of xe_force_wake_get
      drm/i915/gem: Suppress oom warning in favour of ENOMEM to userspace
      drm/xe/guc: Configure TLB timeout based on CT buffer size

Noralf Tr=C3=B8nnes (5):
      dt-bindings: display: panel: mipi-dbi-spi: Add a pixel format propert=
y
      drm/mipi-dbi: Remove mipi_dbi_machine_little_endian()
      drm/mipi-dbi: Make bits per word configurable for pixel transfers
      drm/mipi-dbi: Add support for DRM_FORMAT_RGB888
      drm/tiny: panel-mipi-dbi: Support the pixel format property

N=C3=ADcolas F. R. A. Prado (1):
      drm/mediatek: Log errors in probe with dev_err_probe()

Oded Gabbay (2):
      MAINTAINERS: update Xe driver maintainers
      MAINTAINERS: Change habanalabs maintainer and git repo path

Ofir Bitton (3):
      accel/habanalabs/gaudi2: align embedded specs headers
      accel/habanalabs: remove timestamp registration debug prints
      accel/habanalbs/gaudi2: reduce interrupt count to 128

Ohad Sharabi (4):
      accel/habanalabs/gaudi2: use single function to compare FW versions
      accel/habanalabs: restructure function that checks heartbeat received
      accel/habanalabs: no CPUCP prints on heartbeat failure
      accel/habanalabs: add device name to invalidation failure msg

Ondrej Jirman (3):
      drm/sun4i: Unify sun8i_*_layer structs
      drm/sun4i: Add more parameters to sunxi_engine commit callback
      drm/sun4i: Fix layer zpos change/atomic modesetting

Paul Gerber (2):
      dt-bindings: display: simple: Add AUO G104STN01 panel
      drm/panel: simple: Add AUO G104STN01 panel entry

Paul Hsieh (2):
      drm/amd/display: change dram_clock_latency to 34us for dcn35
      drm/amd/display: un-block 8k with single dimm

Peyton Lee (1):
      drm/amdgpu/vpe: fix vpe dpm clk ratio setup failed

Philip Yang (6):
      drm/amdgpu: Support contiguous VRAM allocation
      drm/amdgpu: Handle sg size limit for contiguous allocation
      drm/amdgpu: Evict BOs from same process for contiguous allocation
      drm/amdkfd: Evict BO itself for contiguous allocation
      drm/amdkfd: Bump kfd version for contiguous VRAM allocation
      drm/amdkfd: Remove arbitrary timeout for hmm_range_fault

Philipp Zabel (3):
      drm/etnaviv: Update hardware headers from rnndb
      drm/etnaviv: Turn etnaviv_is_model_rev() into a function
      drm/etnaviv: Disable SH_EU clock gating on VIPNano-Si+

Pierre-Eric Pelloux-Prayer (2):
      amdgpu: don't dereference a NULL resource in sysfs code
      drm/radeon: check bo_va->bo is non-NULL before using it

Pin-yen Lin (2):
      drm/panel-edp: Add support for several panels
      drm/panel-edp: Add more panels with conservative timings

Pinninti (1):
      drm/amd/display: Refactor HUBP into component folder.

Pratap Nirujogi (8):
      drm/amd/amdgpu: Add ISP support to amdgpu_discovery
      drm/amd/amdgpu: Add ISP driver support
      drm/amd/amdgpu: Enable ISP in amdgpu_discovery
      drm/amd/amdgpu: Map ISP interrupts as generic IRQs
      drm/amd/amdgpu: Add ISP4.1.0 and ISP4.1.1 modules
      drm/amd/amdgpu: Disable MMHUB prefetch for ISP v4.1.1
      drm/amd/amdgpu: Fix 'snprintf' output truncation warning
      drm/amd/amdgpu: Enable MMHUB prefetch for ISP v4.1.0 and 4.1.1

Primoz Fiser (3):
      dt-bindings: vendor-prefixes: Add PrimeView
      dt-bindings: display: simple: Add PrimeView PM070WL4 panel
      drm/panel: simple: Add PrimeView PM070WL4 support

R Sundar (1):
      gpu: ipu-v3: pre: replace of_node_put() with __free

Radhakrishna Sripada (7):
      drm/i915/bmg: Extend DG2 tc check to future
      drm/xe/trace: Extract bo, vm, vma traces
      drm/xe/trace: Extract guc related traces
      drm/xe/trace: Print device_id in xe_trace_bo events
      drm/xe/trace: Print device_id in xe_trace_guc events
      drm/xe/trace: Print device_id in xe_trace events
      drm/xe: Add reg read/write trace

Rajneesh Bhardwaj (1):
      drm/amdgpu: Make CPX mode auto default in NPS4

Rakesh Ughreja (1):
      accel/habanalabs/gaudi2: unsecure edma max outstanding register

Ramesh Errabolu (1):
      drm/amd/amdkfd: Fix a resource leak in svm_range_validate_and_map()

Raphael Gallais-Pou (4):
      dt-bindings: display: add STM32 LVDS device
      drm/stm: lvds: add new STM32 LVDS Display Interface Transmitter drive=
r
      drm/stm: dsi: use new SYSTEM_SLEEP_PM_OPS() macro
      drm/stm: dsi: expose DSI PHY internal clock

Ravi Kumar Vodapalli (1):
      drm/i915/xe2hpd: update pll values in sync with Bspec

Relja Vojvodic (4):
      drm/amd/display: Updated optc401_set_drr to use dcn401 functions
      drm/amd/display: Add dcn401 DIG fifo enable/disable
      drm/amd/display: Refactor dccg401_get_other_enable_symclk_fe
      drm/amd/display: Fix 1DLUT setting for NL SDR blending

Revalla Hari Krishna (3):
      drm/amd/display: Refactor HUBBUB into component folder
      drm/amd/display: Refactor DCCG into component folder
      drm/amd/display: Refactor DCN401 DCCG into component directory

Riana Tauro (4):
      drm/xe: Standardize power gate registers
      drm/xe: Enable Coarse Power Gating
      drm/xe/xe_gt_idle: use GT forcewake domain assertion
      drm/xe: move disable_c6 call

Rob Clark (11):
      drm/msm/adreno: Split up giant device table
      drm/msm/adreno: Split catalog into separate files
      drm/msm/adreno: Move hwcg regs to a6xx hw catalog
      drm/msm/adreno: Move hwcg table into a6xx specific info
      drm/msm/adreno: Move CP_PROTECT settings to hw catalog
      drm/msm: Add GPU memory traces
      drm/msm: Add obj flags to gpu devcoredump
      drm/msm/adreno: Check for zap node availability
      Merge remote-tracking branch
'qcom/20240430-a750-raytracing-v3-2-7f57c5ac082d@gmail.com' into
msm-next-robclark
      drm/msm/a6xx: Add missing __always_unused
      drm/msm/gem: Add missing rcu_dereference()

Rodrigo Siqueira (28):
      drm/amd/display: Update comments in DC
      drm/amd/display: Ensure that dmcub support flag is set for DCN20
      drm/amd/display: Add missing IRQ types
      drm/amd/display: Drop unnecessary semicolon
      drm/amd/display: Replace uint8_t with u8 for dp_hdmi_dongle_signature=
_str
      drm/amd/display: Improve registers write
      drm/amd/display: Add missing SMU version
      drm/amd/display: Adjust codestyle for dcn31 and hdcp_msg
      drm/amd/display: Add VCO speed parameter for DCN31 FPU
      drm/amd/display: Adjust functions prefix for some of the dcn301
fpu functions
      drm/amd/display: Enable legacy fast update for dcn301
      drm/amd/display: Update some of the dcn303 parameters
      drm/amd/display: Remove legacy code in DC
      drm/amd/display: Add log_color_state callback to multiple DCNs
      drm/amd/display: Handle the case which quad_part is equal 0
      drm/amd/display: Remove unused code for some dc files
      drm/amd/display: Remove USBC check for DCN32
      drm/amd/display: Remove duplicate configuration
      drm/amd/display: Add missing DML2 var helpers
      drm/amd/display: Remove unused code
      drm/amd/display: Update DML2.1 generated code
      drm/amd/display: Add missing registers for DCN401
      drm/amd/display: Use dc wake for get the replay state
      drm/amd/display: Use the SPDX license identifier for dmub_replay file=
s
      drm/amd/display: Check otg_master pointer before use it
      drm/amd/display: Fix NULL pointer dereference for DTN log in DCN401
      drm/amd/display: Fix warning caused by an attempt to configure a
non-otg master
      drm/amd/display: Improve warning log for get OPP for OTG master

Rodrigo Vivi (17):
      drm/xe: make xe_pm_runtime_lockdep_map a static struct
      drm/xe: Introduce a simple wedged state
      drm/xe: declare wedged upon GuC load failure
      drm/xe: Force wedged state and block GT reset upon any GPU hang
      drm/xe: Introduce the wedged_mode debugfs
      Merge drm/drm-next into drm-intel-next
      drm/xe: Demote CCS_MODE info to debug only
      drm/xe: Fix xe_pm_runtime_get_if_active return
      drm/xe: Fix xe_pm_runtime_get_if_in_use documentation
      drm/xe: Relax runtime pm protection during execution
      drm/xe: Relax runtime pm protection around VM
      drm/xe: Prepare display for D3Cold
      drm/xe: Stop checking for power_lost on D3Cold
      drm/xe: Enable D3Cold on 'low' VRAM utilization
      drm/mm: Remove unused drm_mm_replace_node
      Merge drm/drm-next into drm-xe-next
      Merge drm/drm-next into drm-xe-next

Roman Li (9):
      drm/amd/display: Re-enable IPS2 for static screen
      drm/amd/display: Add periodic detection for IPS
      drm/amd/display: Clear shared dmub firmware state on init
      drm/amd/display: Add ips status info to debugfs
      drm/amd/display: Remove redundant idle optimization check
      drm/amd/display: Fix POWERPC_64 compilation
      drm/amd/display: Add config support entry to replay caps debugfs
      drm/amd/display: Use periodic detection for ipx/headless
      drm/amd/display: Fix array-index-out-of-bounds in dml2/FCLKChangeSupp=
ort

Ruijing Dong (1):
      drm/amdgpu/vcn: update vcn5 enc/dec capabilities

Ryan Seto (3):
      drm/amd/display: Add HW cursor visual confirm
      drm/amd/display: Adjust reg field for DSC wait for disconnect
      drm/amd/display: Add available bandwidth calculation for audio

Ryan Walklin (2):
      dt-bindings: display: panel: Add WL-355608-A8 panel
      drm: panel: nv3052c: Add WL-355608-A8 panel

Ryszard Knop (1):
      MAINTAINERS: Move the drm-intel repo location to fd.o GitLab

Sai Teja Pottumuttu (1):
      drm/xe/xelpgp: Extend Wa_14019877138 to graphics 12.74

Saleemkhan Jamadar (2):
      drm/amdgpu/umsch: add support to capture fw debug log
      drm/amdgpu: enable dpg for vcn and jpeg on GC 11_5_2

Sam Ravnborg (4):
      MAINTAINERS: drm: Drop sam as panel reviewer
      drm/mediatek: Drop chain_mode_fixup call in mode_valid()
      drm/mediatek: Drop chain_mode_fixup call in mode_valid()
      drm/bridge: Drop drm_bridge_chain_mode_fixup

Samson Tam (5):
      drm/amd/display: Clean-up recout calculation for visual confirm
      drm/amd/display: Add COEF filter types for DCN401
      drm/amd/display: enable EASF support for DCN40
      drm/amd/display: Enable ISHARP support for DCN401
      drm/amd/display: fix YUV video color corruption in DCN401

Sean Anderson (8):
      drm: xlnx: Store base pointers in zynqmp_disp directly
      drm: xlnx: Fix kerneldoc
      drm: zynqmp_dp: Downgrade log level for aux retries message
      drm: zynqmp_dp: Adjust training values per-lane
      drm: zynqmp_dpsub: Always register bridge
      drm: zynqmp_kms: Fix AUX bus not getting unregistered
      drm: zynqmp_dp: Rearrange zynqmp_dp for better padding
      drm: zynqmp_dp: Don't delay work

Sebastian Andrzej Siewior (1):
      drm/ttm/tests: Let ttm_bo_test consider different ww_mutex implementa=
tion.

Shane Xiao (3):
      drm/amdgpu: Update the impelmentation of AMDGPU_PTE_MTYPE_GFX12
      drm/amdgpu: Update the impelmentation of AMDGPU_PTE_MTYPE_NV10
      drm/amdgpu: Update the impelmentation of AMDGPU_PTE_MTYPE_VG10

Shashank Sharma (1):
      drm/amdgpu: fix doorbell regression

Shekhar Chauhan (1):
      drm/xe/xe2hpg: Add Wa_14021490052

Sherry Wang (1):
      drm/amd/display: Skip unnecessary abm disable

Shixiong Ou (1):
      drm/radeon: Delay Connector detecting when HPD singals is unstable

Shuicheng Lin (1):
      drm/xe: Fix UBSAN shift-out-of-bounds failure

Sonny Jiang (6):
      drm/amdgpu: IB test encode test package change for VCN5
      drm/amdgpu/jpeg5: enable power gating
      drm/amdgpu/vcn5: enable DPG mode support
      drm/amdgpu/jpeg5: enable power gating
      drm/amdgpu/jpeg5: reprogram doorbell setting after power up for
each playback
      drm/amdgpu/jpeg5: Add support for DPG mode

Sreeja Golui (1):
      drm/amd/display: Providing a mechanism to have a custom pwm frequency

Sreekant Somasekharan (4):
      drm/amd/amdkfd: Add GFX12 PTE flag to SVM get PTE function
      drm/amdkfd: mark GFX12 system and peer GPU memory mappings as MTYPE_N=
C
      drm/amdkfd: Check correct memory types for is_system variable
      drm/amdkfd: Add GFX1201 to svm_range_get_pte_flags function

Sridevi (1):
      drm/amd/display: Fix incorrect cursor position for dcn401

Sridevi Arvindekar (3):
      drm/amd/display: DCN401 cusor code update
      drm/amd/display: Minor cleanup for DCN401 cursor related code
      drm/amd/display: mirror case cleanup for cursors

Srinivasan Shanmugam (14):
      drm/amd/display: Address kdoc for 'Enable CRTC' in optc401_enable_crt=
c
      drm/amd/display: Remove redundant NULL check in
dce110_set_input_transfer_func
      drm/amd/display: Remove redundant NULL check in
dcn10_set_input_transfer_func
      drm/amdgpu: Fix truncation by resizing ucode_prefix in
imu_v12_0_init_microcode
      drm/amdgpu: Fix buffer size to prevent truncation in
gfx_v12_0_init_microcode
      drm/amdgpu/display: Update kdoc for 'optc35_set_odm_combine'
      drm/amdgpu: Remove duplicate check for *is_queue_unmap in
sdma_v7_0_ring_set_wptr
      drm/amdgpu: Fix snprintf usage in amdgpu_gfx_kiq_init_ring
      drm/amd/display: Refactor construct_phy function in dc/link/link_fact=
ory.c
      drm/amdgpu/display: Fix null pointer dereference in
dc_stream_program_cursor_position
      drm/amdgpu: Fix type mismatch in amdgpu_gfx_kiq_init_ring
      drm/amd/display: Add null checks for 'stream' and 'plane' before
dereferencing
      drm/amd/display: Add null check for 'afb' in amdgpu_dm_update_cursor
      drm/amd/display: Add NULL check for 'afb' before dereferencing
in amdgpu_dm_plane_handle_cursor_update

Stanislav Lisovskiy (2):
      drm/i915: Rename all bigjoiner to joiner
      drm/i915: Rename bigjoiner master/slave to bigjoiner primary/secondar=
y

Stanley.Yang (1):
      drm/amdkfd: Use mode1 reset for GFX v9.4.4

Steven Price (1):
      drm/panthor: Record devfreq busy as soon as a job is started

Sui Jingfeng (15):
      drm/debugfs: Drop conditionals around of_node pointers
      drm/panel: ili9341: Remove a superfluous else after return
      drm/drm-bridge: Drop conditionals around of_node pointers
      drm/bridge: simple-bridge: Remove a redundant check on existence
of bridge->encoder
      drm/bridge: tfp410: Remove a redundant check on existence of
bridge->encoder
      drm/bridge: nxp-ptn3460: Remove a redundant check on existence
of bridge->encoder
      drm/bridge: panel: Remove a redundant check on existence of
bridge->encoder
      drm/bridge: it6505: Remove a redundant check on existence of
bridge->encoder
      drm/bridge: adv7511: Remove a redundant check on existence of
bridge->encoder
      drm/bridge: cdns-mhdp8546: Remove a redundant check on existence
of bridge->encoder
      drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: Remove a redundant
check on existence of bridge->encoder
      drm/bridge: synopsys: dw-mipi-dsi: Remove a redundant check on
existence of bridge->encoder
      drm/bridge: lt9611uxc: Remove a redundant check on existence of
bridge->encoder
      drm/bridge: imx: Remove redundant checks on existence of bridge->enco=
der
      drm/bridge: analogix: Remove redundant checks on existence of
bridge->encoder

Sung Joon Kim (8):
      drm/amd/display: Reuse the modified power sequence
      drm/amd/display: Fix recout calculation for stereo side-by-side
      drm/amd/display: Update dcn351 debug flags and function pointers
      drm/amd/display: Disable seamless boot on 128b/132b encoding
      drm/amd/display: Expand to higher link rates
      drm/amd/display: Fix DSC slice and delay calculations
      drm/amd/display: Send message to notify the DPIA host router bandwidt=
h
      drm/amd/display: Choose HUBP unbounded request based on DML output

Sung-huai Wang (3):
      drm/amd/display: Handle HPD_IRQ for internal link
      Revert "drm/amd/display: Handle HPD_IRQ for internal link"
      drm/amd/display: Add workaround to restrict max frac urgent for DPM0

Sunil Khatri (30):
      drm/amdgpu: add function descripion of new functions
      drm/amdgpu: remove ip dump reg_count variable
      drm/amdgpu: add CP headers registers to gfx10 dump
      drm/amdgpu: add se registers to ip dump for gfx10
      drm/amdgpu: rename the ip_dump to ip_dump_core
      drm/amdgpu: Add cp queues support fro gfx10 in ipdump
      drm/amdgpu: add gfx queue support of gfx10 in ipdump
      drm/amdgpu: add prints in IP State dump
      drm/amdgpu: add more device info to the devcoredump
      drm/amdgpu: Add missing offsets in gc_11_0_0_offset.h
      drm/amdgpu: add gfx11 registers support in ipdump
      drm/amdgpu: add print support for gfx11 ipdump
      drm/amdgpu: add cp queue registers for gfx11 ipdump
      drm/amdgpu: add gfx queue support for gfx11 ipdump
      drm/amdgpu: add gfx9 register support in ipdump
      drm/amdgpu: add print support for gfx9 ipdump
      drm/amdgpu: add cp queue registers for gfx9 ipdump
      drm/amdgpu: rename ip_dump_cp_queues to compute queues
      drm/amdgpu: fix comments and error message for ipdump
      drm/amdgpu: fix out of bounds access in gfx10 during ip dump
      drm/amdgpu: fix out of bounds access in gfx11 during ip dump
      drm/amdgpu: add gfx12 register support in ipdump
      drm/amdgpu: add print support for gfx12 ipdump
      drm:amdgpu: enable IH ring1 for IH v7.0
      drm/amdgpu: enable redirection of irq's for IH v7.0
      drm/amdgpu: add cp queue registers for gfx12 ipdump
      drm/amdgpu: add gfx queue support for gfx12 ipdump
      drm/amdgpu: select compute ME engines dynamically
      drm/amdgpu: select compute ME engines dynamically
      drm/amdgpu: select compute ME engines dynamically

Suraj Kandpal (11):
      drm/i915/hdcp: Disable HDCP Line Rekeying for HDCP2.2 on HDMI
      drm/i915/dp: Make has_gamut_metadata_dip() non static
      drm/i915/dp: Rename intel struct inside intel_panel
      drm/i915/dp: Add TCON HDR capability checks
      drm/i915/dp: Fix Register bit naming
      drm/i915/dp: Drop comments on EDP HDR DPCD registers
      drm/i915/dp: Enable AUX based backlight for HDR
      drm/i915/dp: Write panel override luminance values
      drm/i915/hdcp: Move aux assignment after connector type check
      drm/i915/hdcp: Check mst_port to determine connector type
      drm/i915/hdcp: Fix IS_METEORLAKE usage for HDCP line rekeying

Swapnil Patel (2):
      drm/amd/display: Add dtbclk access to dcn315
      drm/amd/display: Change ASSR disable sequence

Tal Cohen (1):
      accel/habanalabs: disable EQ interrupt after disabling pci

Tal Risin (1):
      accel/habanalabs: expose server type in debugfs

Tao Zhou (9):
      drm/amdgpu: update type of buf size to u32 for eeprom functions
      drm/amdgpu: use u32 for buf size in __amdgpu_eeprom_xfer
      drm/amdgpu: add RAS is_rma flag
      drm/amdgpu: trigger mode1 reset for RAS RMA status
      drm/amdgpu: create amdgpu_ras_in_recovery to simplify code
      drm/amdgpu: set RAS fed status for more cases
      drm/amd/pm: update check condition for SMU mode1 reset
      drm/amdkfd: use mode1 reset for RAS poison consumption
      drm/amdkfd: add ASIC version check for the reset selection of RAS poi=
son

Tasos Sahanidis (1):
      drm/amdgpu/pptable: Fix UBSAN array-index-out-of-bounds

Teeger (1):
      drm/amd/display: Revert Add workaround to restrict max frac
urgent for DPM0

Tejas Upadhyay (5):
      drm/xe/xe2: Add workaround 14021567978
      drm/xe: skip error capture when exec queue is killed
      drm/xe/xe2lpm: Add permanent Wa_14020756599
      drm/xe/xe2lpg: Add permanent wa_14020756599
      drm/xe/xe2lpm: Fixup Wa_14020756599

Tejas Vipin (6):
      drm/mipi-dsi: fix handling of ctx in mipi_dsi_msleep
      drm/panel: himax-hx83102: fix incorrect argument to mipi_dsi_msleep
      drm/panel: truly-nt35521: transition to mipi_dsi wrapped functions
      drm/panel: asus-z00t-tm5p5-n35596: transition to mipi_dsi
wrapped functions
      drm/panel: raydium-rm692e5: transition to mipi_dsi wrapped functions
      drm/panel: sitronix-st7703: transition to mipi_dsi wrapped functions

Thomas Hellstr=C3=B6m (7):
      drm/xe: Fix unexpected backmerge results
      Merge drm/drm-next into drm-xe-next
      drm/xe: Perform dma_map when moving system buffer objects to TT
      drm/xe: Split lrc seqno fence creation up
      drm/xe: Don't initialize fences at xe_sched_job_create()
      drm/xe: Remove xe_lrc_create_seqno_fence()
      drm/xe: Move job creation out of the struct xe_migrate::job_mutex

Thomas Huth (1):
      drm/fbdev-dma: Fix framebuffer mode for big endian devices

Thomas Zimmermann (75):
      Merge drm/drm-next into drm-misc-next
      drm/fbdev-generic: Do not set physical framebuffer address
      fbdev/deferred-io: Move pageref setup into separate helper
      fbdev/deferred-io: Clean up pageref on lastclose
      fbdev/deferred-io: Test screen_buffer for vmalloc'ed memory
      fbdev/deferred-io: Test smem_start for I/O memory
      fbdev/deferred-io: Always call get_page() for framebuffer pages
      fbdev/deferred-io: Provide get_page hook in struct fb_deferred_io
      drm/fbdev: Add fbdev-shmem
      drm/ast: Use fbdev-shmem
      drm/gud: Use fbdev-shmem
      drm/hyperv: Use fbdev-shmem
      drm/mgag200: Use fbdev-shmem
      drm/solomon: Use fbdev-shmem
      drm/tiny/cirrus: Use fbdev-shmem
      drm/tiny/gm12u320: Use fbdev-shmem
      drm/tiny/ofdrm: Use fbdev-shmem
      drm/tiny/simpledrm: Use fbdev-shmem
      drm/udl: Use fbdev-shmem
      drm/virtio: Use fbdev-shmem
      drm/vkms: Use fbdev-shmem
      drm/fbdev-dma: Implement damage handling and deferred I/O
      drm/arm/komeda: Use fbdev-dma
      drm/hisilicon/kirin: Use fbdev-dma
      drm/imx/lcdc: Use fbdev-dma
      drm/ingenic: Use fbdev-dma
      drm/mediatek: Use fbdev-dma
      drm/panel/panel-ilitek-9341: Use fbdev-dma
      drm/renesas/rcar-du: Use fbdev-dma
      drm/renesas/rz-du: Use fbdev-dma
      drm/renesas/shmobile: Use fbdev-dma
      drm/rockchip: Use fbdev-dma
      drm/tiny/hx8357d: Use fbdev-dma
      drm/tiny/ili9163: Use fbdev-dma
      drm/tiny/ili9225: Use fbdev-dma
      drm/tiny/ili9341: Use fbdev-dma
      drm/tiny/ili9486: Use fbdev-dma
      drm/tiny/mi0283qt: Use fbdev-dma
      drm/tiny/panel-mipi-dbi: Use fbdev-dma
      drm/tiny/repaper: Use fbdev-dma
      drm/tiny/st7586: Use fbdev-dma
      drm/tiny/st7735r: Use fbdev-dma
      drm/fbdev-generic: Convert to fbdev-ttm
      drm/fbdev: Clean up fbdev documentation
      drm/udl: Remove DRM_CONNECTOR_POLL_HPD
      drm/udl: Move drm_dev_{enter, exit}() into udl_get_edid_block()
      drm/udl: Clean up Makefile
      drm/udl: Untangle .get_modes() and .detect_ctx()
      drm/udl: Remove struct udl_connector
      drm/fbdev-dma: Clean up deferred I/O
      drm/fbdev-shmem: Clean up deferred I/O
      drm/mgag200: Set DDC timeout in milliseconds
      drm/mgag200: Bind I2C lifetime to DRM device
      drm/mgag200: Store pointer to struct mga_device in struct mga_i2c_cha=
n
      drm/mgag200: Allocate instance of struct mga_i2c_chan dynamically
      drm/mgag200: Inline mgag200_i2c_init()
      drm/mgag200: Replace struct mga_i2c_chan with struct mgag200_ddc
      drm/mgag200: Rename mgag200_i2c.c to mgag200_ddc.c
      drm/mgag200: Rename struct i2c_algo_bit_data callbacks
      drm/mgag200: Acquire I/O-register lock in DDC code
      drm/mgag200: Use drm_connector_helper_get_modes()
      drm/mgag200: Consolidate VGA output
      drm/mgag200: Add BMC output
      drm/mgag200: Set .detect_ctx() and enable connector polling
      drm/ast: Inline drm_simple_encoder_init()
      drm/ast: Implement atomic enable/disable for encoders
      drm/ast: Program mode for AST DP in atomic_mode_set
      drm/ast: Move mode-setting code into mode_set_nofb CRTC helper
      drm/ast: Handle primary-plane format setup in atomic_update
      drm/ast: Remove gamma LUT updates from DPMS code
      drm/ast: Only set VGA SCREEN_DISABLE bit in CRTC code
      drm/ast: Inline ast_crtc_dpms() into callers
      drm/ast: Use drm_atomic_helper_commit_tail() helper
      drm/mgag200: Rename constant MGAREG_Status to MGAREG_STATUS
      drm/qxl: Pin buffer objects for internal mappings

Thorsten Blum (3):
      drm/xe/vm: Simplify if condition
      drm/amd/display: Simplify if conditions
      drm/managed: Simplify if condition

Tim Huang (34):
      drm/amdgpu: fix potential resource leak warning
      drm/amdgpu: fix overflowed array index read warning
      drm/amd/pm: fix uninitialized variable warning for smu8_hwmgr
      drm/amd/pm: fix uninitialized variable warning for smu_v13
      drm/amdgpu: fix uninitialized scalar variable warning
      drm/amd/pm: fix uninitialized variable warnings for vega10_hwmgr
      drm/amd/pm: fix uninitialized variable warnings for vangogh_ppt
      drm/amdgpu: fix uninitialized variable warning for sdma_v7
      drm/amdgpu: fix uninitialized variable warning for amdgpu_xgmi
      drm/amdgpu: fix uninitialized variable warning for jpeg_v4
      drm/amdgpu: fix ucode out-of-bounds read warning
      drm/amdgpu: fix mc_data out-of-bounds read warning
      drm/amdgpu: initialize GC IP v11.5.2
      drm/amdgpu: add GFXHUB IP v11.5.2 support
      drm/amdgpu: add tmz support for GC IP v11.5.2
      drm/amdgpu: add GC IP v11.5.2 soc21 support
      drm/amdgpu: add GC IP v11.5.2 to GC 11.5.0 family
      drm/amdkfd: add KFD support for GC IP v11.5.2
      drm/amdgpu: add firmware for GC IP v11.5.2
      drm/amdgpu: add SDMA IP v6.1.2 discovery support
      drm/amdkfd: add KFD support for SDMA IP v6.1.2
      drm/amdgpu: add firmware for SDMA IP v6.1.2
      drm/amdgpu: add NBIO IP v7.11.3 discovery support
      drm/amdgpu: Add NBIO IP v7.11.3 support
      drm/amdgpu: add VPE IP v6.1.3 support
      drm/amdgpu: add VPE IP v6.1.3 discovery support
      drm/amdgpu: add firmware for VPE IP v6.1.3
      drm/amdgpu: add PSP IP v14.0.4 support
      drm/amdgpu: add PSP IP v14.0.4 discovery support
      drm/amd/pm: add SMU IP v14.0.4 support
      drm/amdgpu: add SMU IP v14.0.4 discovery support
      drm/amdgpu: enable mode2 reset for SMU IP v14.0.4
      drm/amdgpu: add firmware for PSP IP v14.0.4
      drm/amd/pm: avoid to load smu firmware for APUs

Tim Van Patten (1):
      drm/amdgpu: Remove GC HW IP 9.3.0 from noretry=3D1

Timur Tabi (1):
      nouveau: add command-line GSP-RM registry support

Tobias Jakobi (1):
      drm/amd/display: Add MSF panel to DPCD 0x317 patch list

Tom Chung (4):
      drm/amd/display: Add Replay capability and state in debugfs
      drm/amd/display: Reset freesync config before update new state
      drm/amd/display: Add refresh rate range check
      drm/amd/display: Fix refresh rate range for some panel

Tom St Denis (1):
      drm/amd/amdgpu: update GFX12 wave data registers

Tomasz Rusinowicz (3):
      accel/ivpu: Add NPU profiling support
      accel/ivpu: Configure fw logging using debugfs
      accel/ivpu: Share NPU busy time in sysfs

Tomer Tayar (11):
      accel/habanalabs: use parent device for trace events
      accel/habanalabs/gaudi2: revise return value handling in
gaudi2_hbm_sei_handle_read_err()
      accel/habanalabs/gaudi2: assume hard-reset by FW upon MC SEI severe e=
rror
      accel/habanalabs: add an EQ size ASIC property
      accel/habanalabs: move hl_eq_heartbeat_event_handle() to common code
      accel/habanalabs: use device-name directory in debugfs-driver-habanal=
abs
      accel/habanalabs: add a common handler for clock change events
      accel/habanalabs: revise print on EQ heartbeat failure
      accel/habanalabs: dump the EQ entries headers on EQ heartbeat failure
      accel/habanalabs: print timestamp of last PQ heartbeat on EQ
heartbeat failure
      accel/habanalabs: move heartbeat work initialization to early init

TungYu Lu (1):
      drm/amd/display: resync OTG after DIO FIFO resync

Tvrtko Ursulin (9):
      Merge drm/drm-next into drm-intel-gt-next
      drm/i915: Shadow default engine context image in the context
      drm/i915: Support replaying GPU hangs with captured context image
      drm/amdgpu: Add amdgpu_bo_is_vm_bo helper
      drm/amdgpu: Reduce mem_type to domain double indirection
      drm/amdgpu: Describe all object placements in debugfs
      drm/amdgpu: Fix amdgpu_vm_is_bo_always_valid kerneldoc
      drm/v3d: Fix perfmon build error/warning
      drm/amd/display: Convert some legacy DRM debug macros into
appropriate categories

Uma Shankar (1):
      drm/i915: Implement Audio WA_14020863754

Umesh Nerlige Ramappa (5):
      drm/xe/lrc: Add helper to capture context timestamp
      drm/xe: Add helper to accumulate exec queue runtime
      drm/xe: Use run_ticks instead of runtime for client stats
      drm/xe: Do not access xe file when updating exec queue run_ticks
      drm/xe: Get hwe domain specific FW to read RING_TIMESTAMP

Uwe Kleine-K=C3=B6nig (1):
      drm/mediatek: Convert to platform remove callback returning void

Victor Lu (1):
      drm/amdgpu: Do not wait for MP0_C2PMSG_33 IFWI init in SRIOV

Victor Skvortsov (3):
      drm/amdgpu: Extend KIQ reg polling wait for VF
      drm/amdgpu: Queue KFD reset workitem in VF FED
      drm/amdgpu: Add lock around VF RLCG interface

Victor Zhao (1):
      drm/amd/amdgpu: fix the inst passed to amdgpu_virt_rlcg_reg_rw

Vidya Srinivas (1):
      drm/i915/dpt: Make DPT object unshrinkable

Vignesh Chander (2):
      drm/amdgpu: Use dev_ prints for virtualization as it supports
multi adapter
      drm/amdgpu: process RAS fatal error MB notification

Vignesh Raman (7):
      drm/ci: uprev mesa version
      drm/ci: add farm variable
      drm/ci: generate testlist from build
      drm/ci: uprev IGT
      drm/ci: skip driver specific tests
      drm/ci: update xfails for the new testlist
      drm/ci: add tests on vkms

Ville Syrj=C3=A4l=C3=A4 (160):
      drm/i915: Align PLANE_SURF to 16k on ADL for async flips
      drm/i915: Reject async flips if we need to change DDB/watermarks
      drm/i915: Allow the initial async flip to change modifier
      drm/i915: Eliminate extra frame from skl-glk sync->async flip change
      drm/i915: s/need_async_flip_disable_wa/need_async_flip_toggle_wa/
      drm/uapi: Move drm_color_ctm_3x4 out from drm_mode.h
      drm/i915: Fix HAS_REGION() usage in intel_gt_probe_lmem()
      drm/i915: Pass the region ID rather than a bitmask to HAS_REGION()
      drm/i915: Remove counter productive REGION_* wrappers
      drm/i915/bios: Define eDP DSC disable bit
      drm/i915/bios: Remove version number comment from DEVICE_HANDLE_EFP4
      drm/i915/bios: Indicate which VBT structures are based on EDID
      drm/i915/bios: Get rid of "LVDS" from all LFP data stuff
      drm/i915/bios: Rename SDVO DTD blocks a bit
      drm/i915/bios: Define "TV" child device handle
      drm/i915/bios: Flag "VBIOS only" VBT data blocks
      drm/i915/bios: Add version notes for some blocks
      drm/i915/bios: Define VBT block 3 (Display Toggle Option) contents
      drm/i915/bios: Define VBT block 4 (Mode Support List) contents
      drm/i915/bios: Define VBT block 5 (Generic Mode Table)
      drm/i915/bios: Define VBT blocks 6,7,8 (register tables) contents
      drm/i915/bios: Define VBT block 10 (Mode Removal Table) contents
      drm/i915/bios: Define VBT block 12 (Driver Persistent Algorithm) cont=
ents
      drm/i915/bios: Define VBT block 15 (Dot Clock Override Table) content=
s
      drm/i915/bios: Define ALM only VBT block 9 contents
      drm/i915/bios: Define VBT block 17 (SV Test Functions) contents
      drm/i915/bios: Define VBT block 18 (Driver Rotation) contents
      drm/i915/bios: Define VBT blocks 16,29,31 (Toggle List) contents
      drm/i915/bios: Define VBT blocks 19,30,32 (Display Configuration
Removal Table) contents
      drm/i915/bios: Define VBT block 20 (OEM Customizable Modes) contents
      drm/i915/bios: Define VBT block 21 (EFP List) contents
      drm/i915/bios: Define VBT block 24 (SDVO LVDS PnP ID) contents
      drm/i915/bios: Define VBT block 25 (SDVO LVDS PPS) contents
      drm/i915/bios: Define VBT block 26 (TV Options) contents
      drm/i915/bios: Define VBT block 28 (EFP DTD) contents
      drm/i915/bios: Define VBT block 45 (eDP BFI) contents
      drm/i915/bios: Define VBT block 46 (Chromaticity For Narrow
Gamut Panel) contents
      drm/i915/bios: Define VBT block 51 (Fixed Set Mode Table) contents
      drm/i915/bios: Define VBT block 55 (RGB Palette Table) contents
      drm/i915/bios: Define VBT block 57 (Vswing PreEmphasis Table) content=
s
      drm/i915/bios: Define VBT block 50 (MIPI) contents
      drm/i915/bios: Define VBT block 55 (Compression Parameters)
      drm/i915/bios: Define VBT block 252 (int15 Hook)
      drm/i915/bios: Define VBT block 253 (PRD Table) contents
      drm/i915: Use drm_crtc_vblank_crtc()
      drm/amdgpu: Use drm_crtc_vblank_crtc()
      drm/hisilicon/kirin: Include linux/io.h for readl()/writel()
      drm/hisilicon/kirin: Fix 64bit divisions
      drm/hisilicon/kirin: Fix MASK(32) on 32bit architectures
      drm/hisilicon/kirin: Allow build with COMPILE_TEST=3Dy
      drm/omap: Open code phys_to_page()
      drm/omap: Allow build with COMPILE_TEST=3Dy
      drm/atmel-hlcdc: Allow build with COMPILE_TEST=3Dy
      drm/rcar-du: Allow build with COMPILE_TEST=3Dy
      drm/stm: Allow build with COMPILE_TEST=3Dy
      drm/xe: Nuke xe's copy of intel_fbdev_fb.h
      drm/i915: Split gen2 vs. gen3 .max_stride()
      drm/i915: Clean up skl+ plane stride limits
      drm/i915: Drop 'uses_fence' parameter from intel_pin_fb_obj_dpt()
      drm/i915: Extract intel_plane_needs_physical()
      drm/i915: Polish types in fb calculations
      drm/i915: Constify 'fb' in during pinning
      drm/i915: Change intel_fbdev_fb_alloc() return type
      drm/i915: Cleanup fbdev fb setup
      drm/i915: Rename the fb pinning functions to indicate the address spa=
ce
      drm/i915: Nuke _MMIO_PLANE_GAMC()
      drm/i915: Extract skl_universal_plane_regs.h
      drm/i915: Extract intel_cursor_regs.h
      drm/i915: Move skl+ wm/ddb registers to proper headers
      drm/i915/gvt: Use the proper PLANE_AUX_DIST() define
      drm/i915/gvt: Use the proper PLANE_AUX_OFFSET() define
      drm/i915/gvt: Use the full PLANE_KEY*() defines
      drm/i915/gvt: Use PLANE_CTL and PLANE_SURF defines
      drm/i915: Drop useless PLANE_FOO_3 register defines
      drm/i915: Shuffle the skl+ plane register definitions
      drm/i915: Use REG_BIT for PLANE_WM bits
      drm/i915: Drop a few unwanted tabs from skl+ plane reg defines
      drm/i915: Refactor skl+ plane register offset calculations
      drm/i915: Extract skl_plane_{wm,ddb}_reg_val()
      drm/i915: Nuke skl_write_wm_level() and skl_ddb_entry_write()
      drm/i915: Handle SKL+ WM/DDB registers next to all other plane regist=
ers
      drm/probe-helper: Call drm_mode_validate_ycbcr420() before
connector->mode_valid()
      drm/i915: Bump max TMDS bitrate to 6 Gbps on ADL-S/ADL-P/DG2+
      drm/i915: Add skl+ plane name aliases to enum plane_id
      drm/i915: Clean up the cursor register defines
      drm/i915: Add separate define for SEL_FETCH_CUR_CTL()
      drm/i915: Simplify PIPESRC_ERLY_TPT definition
      drm/i915: Rename selective fetch plane registers
      drm/i915: Add separate defines for cursor WM/DDB register bits
      drm/i915: Move PIPEGCMAX to intel_color_regs.h
      drm/i915: Extract i9xx_plane_regs.h
      drm/i915: Polish pre-skl primary plane registers
      drm/i915: Document a few pre-skl primary plane platform dependencies
      drm/i915: Polish sprite plane register definitions
      drm/i915: Document which platforms use which sprite registers
      drm/i915: Define SEL_FETCH_PLANE registers via PICK_EVEN_2RANGES()
      drm/i915: Fix SEL_FETCH_{SIZE,OFFSET} registers
      drm/i915: Plumb the entire atomic state into intel_color_check()
      drm/i915: Hide the intel_crtc_needs_color_update() inside
intel_color_check()
      drm/i915: Bury c8_planes_changed() in intel_color_check()
      drm/sti: Include linux/io.h for devm_ioremap()
      drm/sti: Allow build with COMPILE_TEST=3Dy
      drm/i915/cdclk: Plumb the full atomic state deeper
      drm/i915: Plumb the full atomic state into icl_check_nv12_planes()
      drm/i915: Plumb the full atomic state into skl_ddb_add_affected_plane=
s()
      drm/i915: Reuse intel_mode_vblank_start()
      drm/i915: Extract intel_mode_vblank_end()
      drm/i915: Extract intel_mode_vtotal()
      drm/i915: Simplify scanline_offset handling for gen2
      drm/i915: Move intel_crtc_scanline_offset()
      drm/i915: Switch intel_usecs_to_scanlines() to 64bit maths
      drm/i915/dsb: Polish the DSB ID enum
      drm/i915/dsb: Move DSB ID definition to the header
      drm/i915/dsb: Pass DSB engine ID to intel_dsb_prepare()
      drm/i915/dsb: Use intel_color_uses_dsb()
      drm/i915: Extract intel_pipe_crc_regs.h
      drm/i915: Switch PIPE_CRC_RES_*_IVB to _MMIO_PIPE()
      drm/i915: Regroup pipe CRC regs
      drm/i915: Add a separate definition for PIPE_CRC_RES_HSW
      drm/i915: Document which platforms have which CRC registers
      drm/i915: Define the PIPE_CRC_EXP registers
      drm/i915: Protect CRC reg macro arguments for consistency
      drm/i915: Reduce DDI clock gating printk level from NOTICE to DEBUG
      drm/i915/bios: Define block 46 chromaticity coordinates properly
      drm/i915/bios: Define the "luminance and gamma" sub-struct of block 4=
6
      drm/i915: Drop redundant dsc_decompression_aux check
      drm/i915: Extract intel_dp_has_dsc()
      drm/i915: Handle MST in intel_dp_has_dsc()
      drm/i915: Use intel_dp_has_dsc() during .compute_config()
      drm/i915: Reuse intel_dp_supports_dsc() for MST
      drm/i915: Utilize edp_disable_dsc from VBT
      drm/i915: Remove bogus MST check in intel_dp_has_audio()
      drm/i915: Use REG_BIT() for bdw+ pipe interrupts
      drm/i915: Document bdw+ pipe interrupt bits
      drm/i915: Sort bdw+ pipe interrupt bits
      drm/i915: Extend GEN9_PIPE_PLANE_FLIP_DONE() to cover all universal p=
lanes
      drm/i915: Nuke the intermediate pipe fault bitmasks
      drm/i915: Enable pipeDMC fault interrupts on tgl+
      drm/i915: Enable plane/pipeDMC ATS fault interrupts on mtl
      drm/i915: Extract intel_crtc_arm_vblank_event()
      drm/i915: Add async flip tracepoint
      drm/i915: Add flip done tracepoint
      drm/i915: Introduce intel_mode_vdisplay()
      drm/i915: Pass the whole atomic state to intel_color_prepare_commit()
      drm/i915/dsb: Plumb the whole atomic state into intel_dsb_prepare()
      drm/i915/dsb: Convert the DSB code to use intel_display rather than i=
915
      drm/i915/dsb: Add i915.enable_dsb module parameter
      drm/i915: Drop useless intel_dsb.h include
      drm/i915/dsb: Document that the ATS fault bits are for mtl+
      drm: Rename drm_plane_check_pixel_format() to drm_plane_has_format()
      drm: Export drm_plane_has_format()
      drm/i915: Introduce the plane->min_alignment() vfunc
      drm/i915: Introduce fb->min_alignment
      drm/i915: Split cursor alignment to per-platform vfuncs
      drm/i915: Split pre-skl platforms out from intel_surf_alignment()
      drm/i915: Move intel_surf_alignment() into skl_univerals_plane.c
      drm/i915: Update plane alignment requirements for TGL+
      drm/i915: Nuke the TGL+ chroma plane tile row alignment stuff
      drm/i915: Use vblank worker to unpin old legacy cursor fb safely
      drm/i915/dsb: Try to document that DSB_STATUS bit 16 is level trigger=
ed

Vinay Belgaumkar (4):
      drm/xe/lnl: Apply Wa_22019338487
      drm/xe/guc: Request max GT freq during resume
      drm/xe/guc: Prevent use of uninitialized mutex
      drm/xe/bmg: Apply Wa_22019338487

Vinod Govindapillai (1):
      drm/i915/display: update handling of FBC when VT-d active workaround

Vitaly Margolin (1):
      accel/habanalabs: add cpld ts cpld_timestamp cpucp

Wachowski, Karol (15):
      accel/ivpu: Add sched_mode module param
      accel/ivpu: Create priority based command queues
      accel/ivpu: Implement support for preemption buffers
      accel/ivpu: Add HWS JSM messages
      accel/ivpu: Implement support for hardware scheduler
      accel/ivpu: Add resume engine support
      accel/ivpu: Add force snoop module parameter
      accel/ivpu: Split IP and buttress headers
      accel/ivpu: Split IP and buttress code
      accel/ivpu: Add wp0_during_power_up WA
      accel/ivpu: Disable disable_clock_relinquish WA for LNL B0+
      accel/ivpu: Disable clock relinquish for MMIO reset
      accel/ivpu: Update FW BOOT API headers
      accel/ivpu: Make parts of FW image read-only
      accel/ivpu: Synchronize device unbind with recovery work

Wayne Lin (12):
      drm/amd/display: Remove unnecessary files
      drm/amd/display: Defer handling mst up request in resume
      drm/mst: Fix NULL pointer dereference at drm_dp_add_payload_part2
      drm/amd/display: Change the order of setting DP_IS_USB_C flag
      drm/amd/display: Adjust debug msg for usb4/tbt
      drm/amd/display: Defer the setting of link hpd status for usb4/tbt
      drm/amd/display: Correct the defined value for
AMDGPU_DMUB_NOTIFICATION_MAX
      drm/amd/display: Don't refer to dc_sink in is_dsc_need_re_compute
      drm/amd/display: Refactor function dm_dp_mst_is_port_support_mode()
      drm/dp_mst: Fix all mstb marked as not probed after suspend/resume
      drm/dp_mst: Skip CSN if topology probing is not done yet
      drm/amd/display: Solve mst monitors blank out problem after resume

Webb Chen (2):
      drm/amd/display: Keep VBios pixel rate div setting util next mode set
      drm/amd/display: Revert "dc: Keep VBios pixel rate div setting
util next mode set"

Wenjing Liu (20):
      drm/amd/display: take ODM slice count into account when deciding DSC =
slice
      drm/amd/display: use even ODM slice width for two pixels per containe=
r
      drm/amd/display: reset DSC clock in post unlock update
      drm/amd/display: Add resource interfaces for get ODM slice rect
      drm/amd/display: Add left edge pixel for YCbCr422/420 + ODM pipe spli=
t
      drm/amd/display: Allow higher DSC slice support for small
timings on dcn401
      drm/amd/display: Move DSC functions from dc.c to dc_dsc.c
      drm/amd/display: Add missing enable and disable symclk_se
functions for dcn401
      drm/amd/display: fix a typo which causes an incorrect ODM combine set=
up
      drm/amd/display: turn on symclk for dio virtual stream in dpms sequen=
ce
      drm/amd/display: use even ODM slice width for two pixels per containe=
r
      drm/amd/display: add odm_slice_rect parameter in spl_in
      drm/amd/display: reduce ODM slice count to initial new dc state
only when needed
      drm/amd/display: remove dpp pipes on failure to update pipe params
      drm/amd/display: remove ODM combine before bandwidth validation
      drm/amd/display: use preferred link settings for dp signal only
      drm/amd/display: make ODM segment width of YCbCr422 two pixel aligned
      drm/amd/display: fix minor coding errors where dml21 phase 5
uses wrong variables
      drm/amd/display: Remove a redundant check in authenticated_dp
      drm/amd/display: fix a crash when clock source is reference for
non otg master pipe

Wolfram Sang (1):
      drm/arm/komeda: don't use confusing 'timeout' variable name

Wyon Bi (1):
      drm/bridge: analogix_dp: simplify
analogix_dp_{set/get}_lane_link_training helpers

Xi (Alex) Liu (1):
      drm/amd/display: replace CRTC disable function call

Xi Liu (1):
      drm/amd/display: add support for force ODM override

Xiaogang Chen (1):
      drm/kfd: Correct pinned buffer handling at kfd restore and
validate process

Yang Wang (39):
      drm/amdgpu: remove unused MCA driver codes
      drm/amdgpu: add amdgpu MCA bank dispatch function support
      drm/amdgpu: add MCA smu cache support
      drm/amdgpu: avoid dump mca bank log muti times during ras ISR
      drm/amdgpu: ignoring unsupported ras blocks when MCA bank dispatches
      drm/amdgpu: fix RAS unload driver issue in SRIOV
      drm/amdgpu: add debug flag to enable RAS ACA
      drm/amdgpu: fix compiler 'side-effect' check issue for RAS_EVENT_LOG(=
)
      drm/amdgpu: change aca bank error lock type to spinlock
      drm/amdgpu: change bank cache lock type to spinlock
      drm/amdgpu: fix ACA no query result after gpu reset
      drm/amdgpu: skip to create ras xxx_err_count node when ACA is enabled
      drm/amdgpu: fix typo in amdgpu_ras_aca_sysfs_read() function
      drm/amdgpu: enhance amdgpu_ucode_request() function flexibility
      drm/amdgpu: refine gpu_info firmware loading
      drm/amdgpu: refine mes firmware loading
      drm/amdgpu: refine psp firmware loading
      drm/amdgpu: refine sdma firmware loading
      drm/amdgpu: move aca/mca init functions into ras_init() stage
      drm/amdgpu: refine vcn firmware loading
      drm/amdgpu: refine vpe firmware loading
      drm/amdgpu: refine gmc firmware loading
      drm/amdgpu: refine pmfw/smu firmware loading
      drm/amdgpu: refine imu firmware loading
      drm/amdgpu: refine gfx7 firmware loading
      drm/amdgpu: refine gfx8 firmware loading
      drm/amdgpu: refine gfx9 firmware loading
      drm/amdgpu: refine gfx10 firmware loading
      Revert "drm/amdgpu: change bank cache lock type to spinlock"
      Revert "drm/amdgpu: change aca bank error lock type to spinlock"
      drm/amdgpu: refine gfx6 firmware loading
      drm/amdgpu: refine gfx11 firmware loading
      drm/amdgpu: refine gfx12 firmware loading
      drm/amdgpu: refine isp firmware loading
      drm/amdgpu: remove redundant semicolons in RAS_EVENT_LOG
      drm/amdgpu: refine amdgpu ras event id core code
      drm/amdgpu: add ras POSION_CREATION event id support
      drm/amdgpu: add ras POSION_CONSUMPTION event id support
      drm/amdgpu: add ras event state device attribute support

Yannick Fertre (1):
      drm/stm: dsi: add pm runtime ops

YiPeng Chai (10):
      rm/amdgpu: Remove unused code
      drm/amdgpu: Remove redundant function call
      drm/amdgpu: change log level
      drm/amdgpu: add variable to record the deferred error number
read by driver
      drm/amdgpu: refine poison creation interrupt handler
      drm/amdgpu: refine poison consumption interrupt handler
      drm/amdgpu: add gpu reset check and exception handling
      drm/amdgpu: sysfs node disable query error count during gpu reset
      drm/amdgpu: flush all cached ras bad pages to eeprom
      drm/amdgpu: timely save bad pages to eeprom after gpu ras reset
is completed

Yifan Zha (1):
      drm/amdgpu: Set no_hw_access when VF request full GPU fails

Yifan Zhang (2):
      drm/amdgpu: init SAW registers for mmhub v3.3
      drm/amdgpu: disable lane0 L1TLB and enable lane1 L1TLB

Yihan Zhu (1):
      drm/amd/display: bypass ODM before CRTC off

Yunxiang Li (13):
      drm/amdgpu: Fix two reset triggered in a row
      drm/amdgpu: Add reset_context flag for host FLR
      drm/amdgpu: Fix amdgpu_device_reset_sriov retry logic
      drm/amdgpu: Move ras resume into SRIOV function
      drm/amdgpu: add skip_hw_access checks for sriov
      drm/amdgpu: fix sriov host flr handler
      drm/amdgpu/kfd: remove is_hws_hang and is_resetting
      drm/amdgpu: remove tlb flush in amdgpu_gtt_mgr_recover
      drm/amdgpu: use helper in amdgpu_gart_unbind
      drm/amdgpu: call flush_gpu_tlb directly in gfxhub enable
      drm/amdgpu: fix locking scope when flushing tlb
      drm/amdgpu: add lock in amdgpu_gart_invalidate_tlb
      drm/amdgpu: add lock in kfd_process_dequeue_from_device

Zaeem Mohamed (1):
      drm/amd/display: Remove dcn32_smu13 duplicate header

Zhaoxiong Lv (5):
      drm/panel: jd9365da: Modify the method of sending commands
      dt-bindings: display: panel: Add compatible for kingdisplay-kd101ne3
      drm/panel: panel-jadard-jd9365da-h3: use wrapped MIPI DCS functions
      drm/panel: jd9365da: Support for kd101ne3-40ti MIPI-DSI panel
      drm/panel: jd9365da: Add the function of adjusting orientation

Zhigang Luo (3):
      drm/amdgpu: avoid reading vf2pf info size from FB
      drm/amdgpu: update vf to pf message retry from 2 to 5
      drm/amdgpu: set CP_HQD_PQ_DOORBELL_CONTROL.DOORBELL_MODE to 1

Zhu Lingshan (1):
      drm/ttm: increase ttm pre-fault value to PMD size

pochchan (1):
      drm/amd/display: Use TPS3 for ALPM on Specific Panel

shaoyunl (5):
      drm/amdgpu: Enable MES to handle doorbell ring on unmapped queue
      drm/amdgpu: Enable unmapped doorbell handling basic mode on mes 12
      drm/amdgpu: Enable event log on MES 12
      drm/amdgpu: Disable unmapped doorbell handling  basic mode on mes 12
      drm/amdgpu: enable unmapped doorbell handling  basic mode on mes 12

winstang (1):
      drm/amd/display: added NULL check at start of dc_validate_stream

yi-lchen (1):
      drm/amd/display: Keep VBios pixel rate div setting until next mode se=
t

 .../ABI/testing/debugfs-driver-habanalabs          |     12 +-
 .../bindings/display/amlogic,meson-dw-hdmi.yaml    |      5 +
 .../bindings/display/bridge/synopsys,dw-hdmi.yaml  |     13 +
 .../bindings/display/bridge/toshiba,tc358767.yaml  |      2 +-
 .../bindings/display/imx/fsl,imx6-hdmi.yaml        |      8 -
 .../bindings/display/mediatek/mediatek,aal.yaml    |      1 +
 .../bindings/display/mediatek/mediatek,ccorr.yaml  |      3 +
 .../bindings/display/mediatek/mediatek,color.yaml  |      1 +
 .../bindings/display/mediatek/mediatek,dither.yaml |      1 +
 .../bindings/display/mediatek/mediatek,dpi.yaml    |      4 +
 .../bindings/display/mediatek/mediatek,dsi.yaml    |      1 +
 .../bindings/display/mediatek/mediatek,gamma.yaml  |      1 +
 .../bindings/display/mediatek/mediatek,ovl.yaml    |      1 +
 .../bindings/display/mediatek/mediatek,rdma.yaml   |      1 +
 .../bindings/display/msm/dsi-controller-main.yaml  |     19 +
 .../bindings/display/msm/dsi-phy-28nm.yaml         |      1 +
 .../devicetree/bindings/display/msm/gmu.yaml       |      4 +
 .../devicetree/bindings/display/msm/gpu.yaml       |     27 +-
 .../devicetree/bindings/display/msm/qcom,mdp5.yaml |      1 +
 .../devicetree/bindings/display/msm/qcom,mdss.yaml |      1 +
 .../bindings/display/msm/qcom,sm7150-dpu.yaml      |    143 +
 .../bindings/display/msm/qcom,sm7150-mdss.yaml     |    458 +
 .../bindings/display/panel/boe,tv101wum-nl6.yaml   |      2 -
 .../bindings/display/panel/himax,hx83102.yaml      |     77 +
 .../bindings/display/panel/ilitek,ili9806e.yaml    |     63 +
 .../bindings/display/panel/jadard,jd9365da-h3.yaml |      1 +
 .../bindings/display/panel/panel-edp-legacy.yaml   |    117 +
 .../bindings/display/panel/panel-mipi-dbi-spi.yaml |     30 +
 .../bindings/display/panel/panel-simple-dsi.yaml   |      2 +
 .../panel/panel-simple-lvds-dual-ports.yaml        |      6 +
 .../bindings/display/panel/panel-simple.yaml       |     60 +-
 .../bindings/display/panel/samsung,atna33xc20.yaml |     95 +
 .../bindings/display/panel/sharp,ld-d5116z01b.yaml |     30 -
 .../bindings/display/panel/wl-355608-a8.yaml       |     60 +
 .../display/rockchip/rockchip,dw-hdmi.yaml         |      8 -
 .../display/rockchip/rockchip,dw-mipi-dsi.yaml     |      2 +
 .../bindings/display/st,stm32mp25-lvds.yaml        |    119 +
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |      5 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |      6 +
 Documentation/gpu/amdgpu/apu-asic-info-table.csv   |      2 +
 Documentation/gpu/amdgpu/dgpu-asic-info-table.csv  |      4 +-
 Documentation/gpu/amdgpu/thermal.rst               |      6 +
 Documentation/gpu/drm-internals.rst                |     10 +-
 Documentation/gpu/drm-kms-helpers.rst              |     12 +-
 Documentation/gpu/drm-usage-stats.rst              |     21 +-
 Documentation/gpu/i915.rst                         |      5 +-
 Documentation/gpu/kms-properties.csv               |      2 -
 Documentation/gpu/todo.rst                         |     70 +-
 Documentation/gpu/xe/index.rst                     |      1 +
 Documentation/gpu/xe/xe-drm-usage-stats.rst        |     10 +
 MAINTAINERS                                        |     28 +-
 arch/x86/kernel/early-quirks.c                     |     85 +-
 .../accel/habanalabs/common/command_submission.c   |     13 -
 drivers/accel/habanalabs/common/debugfs.c          |     22 +-
 drivers/accel/habanalabs/common/device.c           |    240 +-
 drivers/accel/habanalabs/common/firmware_if.c      |    229 +-
 drivers/accel/habanalabs/common/habanalabs.h       |     76 +-
 drivers/accel/habanalabs/common/habanalabs_drv.c   |      5 +-
 drivers/accel/habanalabs/common/hwmon.c            |     60 +-
 drivers/accel/habanalabs/common/irq.c              |     33 +-
 drivers/accel/habanalabs/common/memory_mgr.c       |     37 +-
 drivers/accel/habanalabs/common/mmu/mmu.c          |     14 +-
 drivers/accel/habanalabs/common/pci/pci.c          |      4 +-
 drivers/accel/habanalabs/common/sysfs.c            |      8 +-
 drivers/accel/habanalabs/gaudi/gaudi.c             |     12 +-
 drivers/accel/habanalabs/gaudi2/gaudi2.c           |     88 +-
 drivers/accel/habanalabs/gaudi2/gaudi2P.h          |      8 +-
 drivers/accel/habanalabs/gaudi2/gaudi2_security.c  |      1 +
 drivers/accel/habanalabs/goya/goya.c               |     13 +-
 drivers/accel/habanalabs/include/gaudi2/gaudi2.h   |      4 +-
 .../include/gaudi2/gaudi2_async_ids_map_extended.h |    244 +-
 .../accel/habanalabs/include/gaudi2/gaudi2_fw_if.h |     27 +-
 .../habanalabs/include/gaudi2/gaudi2_reg_map.h     |      8 +
 .../habanalabs/include/hw_ip/pci/pci_general.h     |      3 +-
 drivers/accel/ivpu/Makefile                        |     11 +-
 drivers/accel/ivpu/ivpu_debugfs.c                  |     89 +-
 drivers/accel/ivpu/ivpu_drv.c                      |    113 +-
 drivers/accel/ivpu/ivpu_drv.h                      |     62 +-
 drivers/accel/ivpu/ivpu_fw.c                       |     61 +-
 drivers/accel/ivpu/ivpu_fw.h                       |      4 +
 drivers/accel/ivpu/ivpu_gem.h                      |     11 +-
 drivers/accel/ivpu/ivpu_hw.c                       |    331 +
 drivers/accel/ivpu/ivpu_hw.h                       |    199 +-
 drivers/accel/ivpu/ivpu_hw_37xx.c                  |   1065 -
 drivers/accel/ivpu/ivpu_hw_37xx_reg.h              |     72 -
 drivers/accel/ivpu/ivpu_hw_40xx.c                  |   1250 -
 drivers/accel/ivpu/ivpu_hw_40xx_reg.h              |     94 +-
 drivers/accel/ivpu/ivpu_hw_btrs.c                  |    905 +
 drivers/accel/ivpu/ivpu_hw_btrs.h                  |     50 +
 drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h          |    108 +
 drivers/accel/ivpu/ivpu_hw_btrs_mtl_reg.h          |     83 +
 drivers/accel/ivpu/ivpu_hw_ip.c                    |   1174 +
 drivers/accel/ivpu/ivpu_hw_ip.h                    |     36 +
 drivers/accel/ivpu/ivpu_ipc.c                      |     20 +-
 drivers/accel/ivpu/ivpu_ipc.h                      |      8 +-
 drivers/accel/ivpu/ivpu_job.c                      |    324 +-
 drivers/accel/ivpu/ivpu_job.h                      |      6 +-
 drivers/accel/ivpu/ivpu_jsm_msg.c                  |    311 +-
 drivers/accel/ivpu/ivpu_jsm_msg.h                  |     22 +-
 drivers/accel/ivpu/ivpu_mmu.c                      |     22 +-
 drivers/accel/ivpu/ivpu_mmu_context.c              |     86 +
 drivers/accel/ivpu/ivpu_mmu_context.h              |      2 +
 drivers/accel/ivpu/ivpu_ms.c                       |    309 +
 drivers/accel/ivpu/ivpu_ms.h                       |     36 +
 drivers/accel/ivpu/ivpu_pm.c                       |    111 +-
 drivers/accel/ivpu/ivpu_pm.h                       |     10 +-
 drivers/accel/ivpu/ivpu_sysfs.c                    |     58 +
 drivers/accel/ivpu/ivpu_sysfs.h                    |     13 +
 drivers/accel/ivpu/vpu_boot_api.h                  |     16 +-
 drivers/accel/ivpu/vpu_jsm_api.h                   |     14 +-
 drivers/base/devcoredump.c                         |     23 +-
 drivers/char/agp/amd64-agp.c                       |      1 +
 drivers/char/agp/intel-agp.c                       |      3 +-
 drivers/char/agp/intel-gtt.c                       |      3 +-
 drivers/char/agp/sis-agp.c                         |      1 +
 drivers/char/agp/via-agp.c                         |      1 +
 drivers/dma-buf/dma-fence-array.c                  |     10 +-
 drivers/dma-buf/dma-heap.c                         |      4 +-
 drivers/dma-buf/dma-resv.c                         |      7 +
 drivers/dma-buf/heaps/cma_heap.c                   |      4 +-
 drivers/dma-buf/heaps/system_heap.c                |      4 +-
 drivers/firmware/qcom/qcom_scm.c                   |     14 +
 drivers/firmware/qcom/qcom_scm.h                   |      3 +
 drivers/gpu/drm/Kconfig                            |     18 +-
 drivers/gpu/drm/Makefile                           |      6 +-
 drivers/gpu/drm/amd/acp/include/acp_gfx_if.h       |      2 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |     12 +
 drivers/gpu/drm/amd/amdgpu/Makefile                |     26 +-
 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |      2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |     22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |     15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |      4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_afmt.c           |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |      8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |     10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c |    377 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |     46 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |      2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |    263 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c            |      3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |     16 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.h     |      1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |     15 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |      7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c   |     21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    163 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |    236 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h      |      5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |     79 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |      3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |     30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c         |     16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.h         |      4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |      2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |     11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |      5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |     83 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |      8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |     95 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |     11 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |      2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c            |     12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |     51 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h            |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |      3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c            |    210 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.h            |     60 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |     22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |     31 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |     13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |    383 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |     36 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |     26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |      4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |     69 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |     47 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c         |      2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    728 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |     58 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |     12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |      3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |     34 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |     14 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |      5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |     74 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |     33 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |      4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c  |      4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |     30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |     14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |     72 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |     14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |     19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c       |    119 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.h       |     18 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |     19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |     64 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |      8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |      8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |     53 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |     39 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |      6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |      5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |     20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |     12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |     12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |      7 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |     56 +-
 drivers/gpu/drm/amd/amdgpu/atom.c                  |      8 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |     11 +-
 drivers/gpu/drm/amd/amdgpu/clearstate_gfx12.h      |    121 +
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |      4 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |      4 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |      4 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |      4 +-
 drivers/gpu/drm/amd/amdgpu/df_v1_7.c               |      2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    571 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |    448 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3.c           |      4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   5299 +
 .../drm/amd/amdgpu/{mes_v10_1.h =3D> gfx_v12_0.h}    |      8 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |     19 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |     67 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |     69 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    293 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |    110 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v12_0.c          |    521 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v12_0.h          |     29 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |     12 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |     17 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |     19 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   1022 +
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.h             |     30 +
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |     14 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |      7 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |      6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |    129 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |      6 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |     28 +
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c               |      6 +
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c               |     26 +-
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |     11 +-
 drivers/gpu/drm/amd/amdgpu/imu_v12_0.c             |    400 +
 drivers/gpu/drm/amd/amdgpu/imu_v12_0.h             |     30 +
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.c            |    137 +
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.h            |     39 +
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c            |    137 +
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.h            |     39 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             |      1 -
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |      8 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |      3 -
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |     10 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |      3 -
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |      2 -
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |      7 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |    168 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.h           |      6 +
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c             |   1189 -
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |     43 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |   1562 +
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.h             |     29 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c            |      2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |      8 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |      2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c            |     55 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c          |    654 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.h          |     28 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |      2 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |     67 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h              |      4 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |     73 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h              |      5 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c              |      9 +-
 drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c           |     43 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |     19 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c             |     19 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c             |     22 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c             |     14 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c            |     15 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             |     18 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |     23 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |     16 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |     24 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |      7 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |     15 +-
 drivers/gpu/drm/amd/amdgpu/psp_v14_0.c             |      2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |     11 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |     11 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |      2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |     29 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |      1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0_0_pkt_open.h  |      8 +
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |   1657 +
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.h             |     30 +
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |     20 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |     34 +-
 drivers/gpu/drm/amd/amdgpu/soc24.c                 |    600 +
 drivers/gpu/drm/amd/amdgpu/soc24.h                 |     30 +
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |     97 +-
 drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.c         |     11 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |     14 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |     14 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |     11 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |     16 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |     14 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |     10 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |     10 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |     36 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |      9 +-
 drivers/gpu/drm/amd/amdgpu/vpe_v6_1.c              |      1 +
 drivers/gpu/drm/amd/amdkfd/Makefile                |      2 +
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |   1593 +-
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |    496 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |      5 -
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |     10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.h              |      2 -
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c             |     19 +-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h             |      4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |     64 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |     86 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |      3 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_v12.c  |     81 +
 .../drm/amd/amdkfd/kfd_device_queue_manager_v9.c   |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |     27 +-
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c      |     32 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |     10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c   |    453 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |     17 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |     70 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |      4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |     12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |     27 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |     21 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |     16 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h        |      5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |     32 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |     72 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |      5 +-
 drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c        |      6 +-
 drivers/gpu/drm/amd/display/Kconfig                |      2 +
 drivers/gpu/drm/amd/display/Makefile               |     10 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   1328 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |     40 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |     90 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |    131 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |     40 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    256 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |    171 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h    |      3 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |     30 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.h  |      1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c   |     12 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.h   |      2 +-
 drivers/gpu/drm/amd/display/dc/Makefile            |     13 +-
 drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c  |      2 +-
 drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c |      4 -
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |     18 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    116 +-
 .../gpu/drm/amd/display/dc/bios/command_table2.c   |      3 +-
 .../amd/display/dc/bios/command_table_helper2.c    |      1 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |     10 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |     15 +
 .../amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c    |      2 +-
 .../amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c |      2 -
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |     13 +-
 .../dc/clk_mgr/dcn30/dcn30_smu11_driver_if.h       |      2 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |     10 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |      2 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |      2 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |      2 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |      2 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |     16 +-
 .../dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c       |      2 +-
 .../dc/clk_mgr/dcn32/dcn32_smu13_driver_if.h       |      2 +-
 .../amd/display/dc/clk_mgr/dcn32/smu13_driver_if.h |    108 -
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |     61 +-
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c   |     21 +-
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.h   |      2 +
 .../gpu/drm/amd/display/dc/clk_mgr/dcn401/dalsmc.h |     53 +
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |   1581 +
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.h |    113 +
 .../dc/clk_mgr/dcn401/dcn401_clk_mgr_smu_msg.c     |    313 +
 .../dc/clk_mgr/dcn401/dcn401_clk_mgr_smu_msg.h     |     29 +
 .../dc/clk_mgr/dcn401/dcn401_smu14_driver_if.h     |     66 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |    258 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |     56 +-
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |      9 +-
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |      3 +
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |    333 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |    116 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |    409 +-
 drivers/gpu/drm/amd/display/dc/core/dc_vm_helper.c |      1 +
 drivers/gpu/drm/amd/display/dc/dc.h                |     86 +-
 drivers/gpu/drm/amd/display/dc/dc_bios_types.h     |      1 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |    252 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |     29 +-
 drivers/gpu/drm/amd/display/dc/dc_helper.c         |      8 +-
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |     47 +-
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |    193 +
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.h  |     22 +
 drivers/gpu/drm/amd/display/dc/dc_state_priv.h     |      4 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |     36 +-
 drivers/gpu/drm/amd/display/dc/dc_stream_priv.h    |     38 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |     83 +-
 drivers/gpu/drm/amd/display/dc/dccg/Makefile       |    103 +
 .../amd/display/dc/{ =3D> dccg}/dcn20/dcn20_dccg.c   |      0
 .../amd/display/dc/{ =3D> dccg}/dcn20/dcn20_dccg.h   |     27 +
 .../amd/display/dc/{ =3D> dccg}/dcn201/dcn201_dccg.c |      0
 .../amd/display/dc/{ =3D> dccg}/dcn201/dcn201_dccg.h |      0
 .../amd/display/dc/{ =3D> dccg}/dcn21/dcn21_dccg.c   |      0
 .../amd/display/dc/{ =3D> dccg}/dcn21/dcn21_dccg.h   |      0
 .../amd/display/dc/{ =3D> dccg}/dcn30/dcn30_dccg.c   |      0
 .../amd/display/dc/{ =3D> dccg}/dcn30/dcn30_dccg.h   |      0
 .../amd/display/dc/{ =3D> dccg}/dcn301/dcn301_dccg.c |      0
 .../amd/display/dc/{ =3D> dccg}/dcn301/dcn301_dccg.h |      0
 .../amd/display/dc/{ =3D> dccg}/dcn302/dcn302_dccg.h |      0
 .../amd/display/dc/{ =3D> dccg}/dcn303/dcn303_dccg.h |      0
 .../amd/display/dc/{ =3D> dccg}/dcn31/dcn31_dccg.c   |      0
 .../amd/display/dc/{ =3D> dccg}/dcn31/dcn31_dccg.h   |      2 +-
 .../amd/display/dc/{ =3D> dccg}/dcn314/dcn314_dccg.c |     12 +-
 .../amd/display/dc/{ =3D> dccg}/dcn314/dcn314_dccg.h |      0
 .../amd/display/dc/{ =3D> dccg}/dcn32/dcn32_dccg.c   |     13 +-
 .../amd/display/dc/{ =3D> dccg}/dcn32/dcn32_dccg.h   |      0
 .../amd/display/dc/{ =3D> dccg}/dcn35/dcn35_dccg.c   |     70 +-
 .../amd/display/dc/{ =3D> dccg}/dcn35/dcn35_dccg.h   |      0
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c   |    986 +
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.h   |    217 +
 drivers/gpu/drm/amd/display/dc/dce/dce_abm.h       |     64 +
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |      5 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |      3 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |    129 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.h  |      8 +
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c    |     12 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.h    |      4 +
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  |      5 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c |      6 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_opp.c       |      1 -
 .../gpu/drm/amd/display/dc/dce/dce_panel_cntl.c    |      2 +-
 .../drm/amd/display/dc/dce/dce_stream_encoder.c    |      1 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c  |     20 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.h  |      2 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |      5 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.h      |      3 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |    162 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.h   |     33 +-
 .../display/dc/dce110/dce110_timing_generator.c    |     18 +
 .../display/dc/dce110/dce110_timing_generator.h    |      2 +
 .../display/dc/dce110/dce110_timing_generator_v.c  |      3 +-
 .../display/dc/dce120/dce120_timing_generator.c    |      1 +
 .../amd/display/dc/dce80/dce80_timing_generator.c  |      1 +
 drivers/gpu/drm/amd/display/dc/dcn10/Makefile      |      3 +-
 .../display/dc/dcn10/dcn10_hw_sequencer_debug.c    |      4 +-
 drivers/gpu/drm/amd/display/dc/dcn20/Makefile      |      7 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_dwb_scl.c   |      3 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_opp.c   |     25 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_opp.h   |      4 +-
 drivers/gpu/drm/amd/display/dc/dcn201/Makefile     |      9 +-
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_opp.c |      1 +
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_opp.h |      3 +-
 drivers/gpu/drm/amd/display/dc/dcn21/Makefile      |      6 +-
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |      7 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |      2 +-
 drivers/gpu/drm/amd/display/dc/dcn301/Makefile     |     14 +-
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile      |     13 +-
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.c    |     14 +
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.h    |      3 +
 drivers/gpu/drm/amd/display/dc/dcn314/Makefile     |     13 +-
 drivers/gpu/drm/amd/display/dc/dcn32/Makefile      |     20 -
 drivers/gpu/drm/amd/display/dc/dcn321/Makefile     |     17 -
 drivers/gpu/drm/amd/display/dc/dcn35/Makefile      |     20 -
 drivers/gpu/drm/amd/display/dc/dcn401/Makefile     |     10 +
 drivers/gpu/drm/amd/display/dc/dio/Makefile        |     99 +
 .../dc/{ =3D> dio}/dcn10/dcn10_link_encoder.c        |      8 +-
 .../dc/{ =3D> dio}/dcn10/dcn10_link_encoder.h        |      0
 .../dc/{ =3D> dio}/dcn10/dcn10_stream_encoder.c      |      0
 .../dc/{ =3D> dio}/dcn10/dcn10_stream_encoder.h      |      7 +
 .../dc/{ =3D> dio}/dcn20/dcn20_link_encoder.c        |      0
 .../dc/{ =3D> dio}/dcn20/dcn20_link_encoder.h        |      1 -
 .../dc/{ =3D> dio}/dcn20/dcn20_stream_encoder.c      |      0
 .../dc/{ =3D> dio}/dcn20/dcn20_stream_encoder.h      |      0
 .../dc/{ =3D> dio}/dcn30/dcn30_dio_link_encoder.c    |      0
 .../dc/{ =3D> dio}/dcn30/dcn30_dio_link_encoder.h    |      0
 .../dc/{ =3D> dio}/dcn30/dcn30_dio_stream_encoder.c  |      0
 .../dc/{ =3D> dio}/dcn30/dcn30_dio_stream_encoder.h  |      0
 .../dc/{ =3D> dio}/dcn31/dcn31_dio_link_encoder.c    |      0
 .../dc/{ =3D> dio}/dcn31/dcn31_dio_link_encoder.h    |      0
 .../dc/{ =3D> dio}/dcn32/dcn32_dio_link_encoder.c    |      3 -
 .../dc/{ =3D> dio}/dcn32/dcn32_dio_link_encoder.h    |      0
 .../dc/{ =3D> dio}/dcn32/dcn32_dio_stream_encoder.c  |     40 +-
 .../dc/{ =3D> dio}/dcn32/dcn32_dio_stream_encoder.h  |      0
 .../dc/{ =3D> dio}/dcn321/dcn321_dio_link_encoder.c  |      0
 .../dc/{ =3D> dio}/dcn321/dcn321_dio_link_encoder.h  |      0
 .../dc/{ =3D> dio}/dcn35/dcn35_dio_link_encoder.c    |     10 +-
 .../dc/{ =3D> dio}/dcn35/dcn35_dio_link_encoder.h    |      0
 .../dc/{ =3D> dio}/dcn35/dcn35_dio_stream_encoder.c  |     43 +-
 .../dc/{ =3D> dio}/dcn35/dcn35_dio_stream_encoder.h  |      6 +
 .../dc/dio/dcn401/dcn401_dio_link_encoder.c        |    322 +
 .../dc/dio/dcn401/dcn401_dio_link_encoder.h        |    134 +
 .../dc/dio/dcn401/dcn401_dio_stream_encoder.c      |    857 +
 .../dc/dio/dcn401/dcn401_dio_stream_encoder.h      |    217 +
 drivers/gpu/drm/amd/display/dc/dm_pp_smu.h         |      3 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |      4 +
 .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   |      9 +-
 .../gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.h   |      2 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |     22 +-
 .../amd/display/dc/dml/dcn20/display_mode_vba_20.c |     16 +-
 .../display/dc/dml/dcn20/display_mode_vba_20v2.c   |      4 +-
 .../display/dc/dml/dcn20/display_rq_dlg_calc_20.c  |     19 +-
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c        |     19 +-
 .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |      2 +-
 .../display/dc/dml/dcn21/display_rq_dlg_calc_21.c  |     22 +-
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   |      8 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |      2 +-
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |     19 +-
 .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c |      4 +-
 .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.h |      7 +-
 .../gpu/drm/amd/display/dc/dml/dcn302/dcn302_fpu.c |     10 +
 .../gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c |     10 +
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |     20 +-
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |      4 +-
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |     19 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |     14 +-
 .../dc/dml/dcn314/display_rq_dlg_calc_314.c        |     19 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |     60 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h   |      2 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |      3 +
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |      8 +-
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |     10 +
 .../gpu/drm/amd/display/dc/dml/dcn401/dcn401_fpu.c |    239 +
 .../gpu/drm/amd/display/dc/dml/dcn401/dcn401_fpu.h |     14 +
 .../drm/amd/display/dc/dml/display_mode_structs.h  |      1 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |      7 +-
 .../amd/display/dc/dml/dml1_display_rq_dlg_calc.c  |      5 -
 drivers/gpu/drm/amd/display/dc/dml2/Makefile       |     80 +
 .../drm/amd/display/dc/dml2/display_mode_core.c    |     61 +-
 .../drm/amd/display/dc/dml2/display_mode_core.h    |      2 +
 .../display/dc/dml2/display_mode_core_structs.h    |      2 +
 .../dc/dml2/dml21/dml21_translation_helper.c       |   1166 +
 .../dc/dml2/dml21/dml21_translation_helper.h       |     29 +
 .../drm/amd/display/dc/dml2/dml21/dml21_utils.c    |    555 +
 .../drm/amd/display/dc/dml2/dml21/dml21_utils.h    |     50 +
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |    441 +
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.h  |     68 +
 .../dc/dml2/dml21/inc/bounding_boxes/dcn3_soc_bb.h |    401 +
 .../dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h |    365 +
 .../dc/dml2/dml21/inc/dml2_external_lib_deps.h     |     10 +
 .../drm/amd/display/dc/dml2/dml21/inc/dml_top.h    |     47 +
 .../dc/dml2/dml21/inc/dml_top_dchub_registers.h    |    185 +
 .../dc/dml2/dml21/inc/dml_top_display_cfg_types.h  |    507 +
 .../dc/dml2/dml21/inc/dml_top_policy_types.h       |     14 +
 .../dml2/dml21/inc/dml_top_soc_parameter_types.h   |    196 +
 .../amd/display/dc/dml2/dml21/inc/dml_top_types.h  |    720 +
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c   |    719 +
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.h   |     16 +
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |  12743 ++
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.h     |     39 +
 .../dml2/dml21/src/dml2_core/dml2_core_factory.c   |     38 +
 .../dml2/dml21/src/dml2_core/dml2_core_factory.h   |     14 +
 .../dc/dml2/dml21/src/dml2_core/dml2_core_shared.c |  12387 ++
 .../dc/dml2/dml21/src/dml2_core/dml2_core_shared.h |     38 +
 .../dml21/src/dml2_core/dml2_core_shared_types.h   |   2049 +
 .../dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c   |    714 +
 .../dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.h   |     17 +
 .../dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c   |     51 +
 .../dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.h   |     14 +
 .../dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.c     |    195 +
 .../dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.h     |     14 +
 .../dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c  |     40 +
 .../dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.h  |     14 +
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c     |    707 +
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.h     |     23 +
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c     |   1250 +
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.h     |     25 +
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |   2098 +
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.h  |     27 +
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c  |     86 +
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.h  |     14 +
 .../src/dml2_standalone_libraries/lib_float_math.c |    150 +
 .../src/dml2_standalone_libraries/lib_float_math.h |     26 +
 .../dml21/src/dml2_top/dml2_top_optimization.c     |    309 +
 .../dml21/src/dml2_top/dml2_top_optimization.h     |     34 +
 .../display/dc/dml2/dml21/src/dml2_top/dml_top.c   |    347 +
 .../dc/dml2/dml21/src/dml2_top/dml_top_mcache.c    |    550 +
 .../dc/dml2/dml21/src/dml2_top/dml_top_mcache.h    |     24 +
 .../amd/display/dc/dml2/dml21/src/inc/dml2_debug.c |     32 +
 .../amd/display/dc/dml2/dml21/src/inc/dml2_debug.h |     18 +
 .../dml21/src/inc/dml2_internal_shared_types.h     |    987 +
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |    101 +-
 .../drm/amd/display/dc/dml2/dml2_internal_types.h  |     20 +
 .../drm/amd/display/dc/dml2/dml2_mall_phantom.c    |      2 +
 .../amd/display/dc/dml2/dml2_translation_helper.c  |    188 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |     14 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |     61 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |     21 +-
 drivers/gpu/drm/amd/display/dc/dpp/Makefile        |      8 +-
 .../drm/amd/display/dc/dpp/dcn10/CMakeLists.txt    |      6 -
 .../drm/amd/display/dc/dpp/dcn10/dcn10_dpp_cm.c    |      3 +-
 .../drm/amd/display/dc/dpp/dcn20/CMakeLists.txt    |      5 -
 .../gpu/drm/amd/display/dc/dpp/dcn20/dcn20_dpp.c   |     56 +
 .../gpu/drm/amd/display/dc/dpp/dcn20/dcn20_dpp.h   |      9 +-
 .../drm/amd/display/dc/dpp/dcn201/CMakeLists.txt   |      4 -
 .../gpu/drm/amd/display/dc/dpp/dcn201/dcn201_dpp.c |     13 +-
 .../drm/amd/display/dc/dpp/dcn30/CMakeLists.txt    |      5 -
 .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c   |     34 +-
 .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.h   |      4 +-
 .../drm/amd/display/dc/dpp/dcn32/CMakeLists.txt    |      4 -
 .../gpu/drm/amd/display/dc/dpp/dcn32/dcn32_dpp.c   |     73 +
 .../gpu/drm/amd/display/dc/dpp/dcn32/dcn32_dpp.h   |      8 +
 .../drm/amd/display/dc/dpp/dcn35/CMakeLists.txt    |      4 -
 .../gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c |    427 +
 .../gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.h |    729 +
 .../drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c  |    261 +
 .../amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c    |   1219 +
 drivers/gpu/drm/amd/display/dc/dsc/Makefile        |      9 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |     31 +-
 .../gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.c   |     38 +-
 .../gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.h   |     25 +-
 .../gpu/drm/amd/display/dc/dsc/dcn35/dcn35_dsc.c   |     58 +-
 .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c |    418 +
 .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.h |    338 +
 drivers/gpu/drm/amd/display/dc/dsc/dsc.h           |      1 +
 drivers/gpu/drm/amd/display/dc/dwb/Makefile        |     37 +
 .../drm/amd/display/dc/{ =3D> dwb}/dcn35/dcn35_dwb.c |      0
 .../drm/amd/display/dc/{ =3D> dwb}/dcn35/dcn35_dwb.h |      0
 drivers/gpu/drm/amd/display/dc/gpio/Makefile       |     10 +
 .../amd/display/dc/gpio/dcn21/hw_translate_dcn21.c |      2 +-
 .../amd/display/dc/gpio/dcn401/hw_factory_dcn401.c |    252 +
 .../amd/display/dc/gpio/dcn401/hw_factory_dcn401.h |     11 +
 .../display/dc/gpio/dcn401/hw_translate_dcn401.c   |    335 +
 .../display/dc/gpio/dcn401/hw_translate_dcn401.h   |     13 +
 drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c |     17 +-
 drivers/gpu/drm/amd/display/dc/gpio/hw_ddc.c       |     11 +-
 drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |      4 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_generic.c   |      2 +-
 drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c       |      2 +-
 drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |      4 +
 drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c     |     19 +-
 drivers/gpu/drm/amd/display/dc/hpo/Makefile        |     35 +
 .../dc/{ =3D> hpo}/dcn32/dcn32_hpo_dp_link_encoder.c |      0
 .../dc/{ =3D> hpo}/dcn32/dcn32_hpo_dp_link_encoder.h |      0
 drivers/gpu/drm/amd/display/dc/hubbub/Makefile     |    104 +
 .../display/dc/{ =3D> hubbub}/dcn10/dcn10_hubbub.c   |      2 +-
 .../display/dc/{ =3D> hubbub}/dcn10/dcn10_hubbub.h   |     47 +-
 .../display/dc/{ =3D> hubbub}/dcn20/dcn20_hubbub.c   |     30 +-
 .../display/dc/{ =3D> hubbub}/dcn20/dcn20_hubbub.h   |      2 +-
 .../display/dc/{ =3D> hubbub}/dcn201/dcn201_hubbub.c |      0
 .../display/dc/{ =3D> hubbub}/dcn201/dcn201_hubbub.h |      0
 .../display/dc/{ =3D> hubbub}/dcn21/dcn21_hubbub.c   |      0
 .../display/dc/{ =3D> hubbub}/dcn21/dcn21_hubbub.h   |      0
 .../display/dc/{ =3D> hubbub}/dcn30/dcn30_hubbub.c   |      3 +
 .../display/dc/{ =3D> hubbub}/dcn30/dcn30_hubbub.h   |      0
 .../display/dc/{ =3D> hubbub}/dcn301/dcn301_hubbub.c |      0
 .../display/dc/{ =3D> hubbub}/dcn301/dcn301_hubbub.h |      0
 .../display/dc/{ =3D> hubbub}/dcn31/dcn31_hubbub.c   |      3 +
 .../display/dc/{ =3D> hubbub}/dcn31/dcn31_hubbub.h   |      0
 .../display/dc/{ =3D> hubbub}/dcn32/dcn32_hubbub.c   |      2 +-
 .../display/dc/{ =3D> hubbub}/dcn32/dcn32_hubbub.h   |      2 +
 .../display/dc/{ =3D> hubbub}/dcn35/dcn35_hubbub.c   |      0
 .../display/dc/{ =3D> hubbub}/dcn35/dcn35_hubbub.h   |      0
 .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.c   |   1215 +
 .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.h   |    197 +
 drivers/gpu/drm/amd/display/dc/hubp/Makefile       |     97 +
 .../amd/display/dc/{ =3D> hubp}/dcn10/dcn10_hubp.c   |      0
 .../amd/display/dc/{ =3D> hubp}/dcn10/dcn10_hubp.h   |      0
 .../amd/display/dc/{ =3D> hubp}/dcn20/dcn20_hubp.c   |      0
 .../amd/display/dc/{ =3D> hubp}/dcn20/dcn20_hubp.h   |     49 +-
 .../amd/display/dc/{ =3D> hubp}/dcn201/dcn201_hubp.c |      0
 .../amd/display/dc/{ =3D> hubp}/dcn201/dcn201_hubp.h |      0
 .../amd/display/dc/{ =3D> hubp}/dcn21/dcn21_hubp.c   |      0
 .../amd/display/dc/{ =3D> hubp}/dcn21/dcn21_hubp.h   |      0
 .../amd/display/dc/{ =3D> hubp}/dcn30/dcn30_hubp.c   |      0
 .../amd/display/dc/{ =3D> hubp}/dcn30/dcn30_hubp.h   |      0
 .../amd/display/dc/{ =3D> hubp}/dcn31/dcn31_hubp.c   |      0
 .../amd/display/dc/{ =3D> hubp}/dcn31/dcn31_hubp.h   |      0
 .../amd/display/dc/{ =3D> hubp}/dcn32/dcn32_hubp.c   |      0
 .../amd/display/dc/{ =3D> hubp}/dcn32/dcn32_hubp.h   |      0
 .../amd/display/dc/{ =3D> hubp}/dcn35/dcn35_hubp.c   |      0
 .../amd/display/dc/{ =3D> hubp}/dcn35/dcn35_hubp.h   |      0
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |   1029 +
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.h   |    343 +
 drivers/gpu/drm/amd/display/dc/hwss/Makefile       |      9 +-
 .../gpu/drm/amd/display/dc/hwss/dce/dce_hwseq.h    |     24 +
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |     99 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |     83 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |    217 +-
 .../drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c  |     10 +-
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c    |      8 +-
 .../gpu/drm/amd/display/dc/hwss/dcn21/dcn21_init.c |      1 +
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |     12 +-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.h    |      2 +-
 .../gpu/drm/amd/display/dc/hwss/dcn30/dcn30_init.c |      1 +
 .../drm/amd/display/dc/hwss/dcn301/dcn301_init.c   |      4 +-
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |      2 +-
 .../gpu/drm/amd/display/dc/hwss/dcn31/dcn31_init.c |      1 +
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |     51 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.h  |      2 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_init.c   |      3 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |    225 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.h    |      6 +-
 .../gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c |      4 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |    126 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h    |      2 +
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |      5 +-
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |     12 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |   1671 +
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h  |     84 +
 .../drm/amd/display/dc/hwss/dcn401/dcn401_init.c   |    151 +
 .../drm/amd/display/dc/hwss/dcn401/dcn401_init.h   |     12 +
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |     35 +
 .../drm/amd/display/dc/hwss/hw_sequencer_private.h |      9 +-
 drivers/gpu/drm/amd/display/dc/inc/clock_source.h  |      1 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |     30 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |      6 +-
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |     55 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |      8 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |     28 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |      4 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |     57 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |      2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h  |      9 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |    726 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/opp.h        |      7 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/optc.h       |      4 +-
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |      3 +-
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |      4 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/transform.h  |     28 +-
 drivers/gpu/drm/amd/display/dc/inc/link.h          |      2 +-
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |     18 +-
 drivers/gpu/drm/amd/display/dc/irq/Makefile        |      9 +
 .../amd/display/dc/irq/dcn401/irq_service_dcn401.c |    409 +
 .../amd/display/dc/irq/dcn401/irq_service_dcn401.h |     13 +
 drivers/gpu/drm/amd/display/dc/irq/irq_service.c   |      2 +-
 drivers/gpu/drm/amd/display/dc/irq_types.h         |      8 +
 .../amd/display/dc/link/accessories/link_dp_cts.c  |      2 +-
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.c   |     12 +-
 .../hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.c    |      5 +
 .../gpu/drm/amd/display/dc/link/link_detection.c   |      2 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |     68 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |     75 +-
 .../drm/amd/display/dc/link/protocols/link_ddc.c   |      4 -
 .../display/dc/link/protocols/link_dp_capability.c |     85 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |     29 +-
 .../amd/display/dc/link/protocols/link_dp_phy.c    |     55 +-
 .../display/dc/link/protocols/link_dp_training.c   |     20 +-
 .../dc/link/protocols/link_dp_training_dpia.c      |     16 -
 .../drm/amd/display/dc/link/protocols/link_dpcd.c  |      1 +
 .../dc/link/protocols/link_edp_panel_control.c     |      6 +-
 .../dc/link/protocols/link_edp_panel_control.h     |      2 +-
 drivers/gpu/drm/amd/display/dc/mmhubbub/Makefile   |     45 +
 .../dc/{ =3D> mmhubbub}/dcn32/dcn32_mmhubbub.c       |      0
 .../dc/{ =3D> mmhubbub}/dcn32/dcn32_mmhubbub.h       |      0
 .../dc/{ =3D> mmhubbub}/dcn35/dcn35_mmhubbub.c       |      0
 .../dc/{ =3D> mmhubbub}/dcn35/dcn35_mmhubbub.h       |      0
 drivers/gpu/drm/amd/display/dc/mpc/Makefile        |     45 +
 .../drm/amd/display/dc/{ =3D> mpc}/dcn32/dcn32_mpc.c |      3 +
 .../drm/amd/display/dc/{ =3D> mpc}/dcn32/dcn32_mpc.h |      0
 .../gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c |    653 +
 .../gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h |    239 +
 drivers/gpu/drm/amd/display/dc/opp/Makefile        |     35 +
 .../drm/amd/display/dc/{ =3D> opp}/dcn35/dcn35_opp.c |      0
 .../drm/amd/display/dc/{ =3D> opp}/dcn35/dcn35_opp.h |      0
 drivers/gpu/drm/amd/display/dc/optc/Makefile       |      6 +
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c |     50 +-
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h |     13 +-
 .../gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c |     16 +-
 .../gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.h |      3 +-
 .../drm/amd/display/dc/optc/dcn201/dcn201_optc.c   |      7 +-
 .../drm/amd/display/dc/optc/dcn201/dcn201_optc.h   |      3 -
 .../gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c |      9 +-
 .../gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.h |      2 +-
 .../drm/amd/display/dc/optc/dcn301/dcn301_optc.c   |      1 +
 .../gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c |     20 +-
 .../drm/amd/display/dc/optc/dcn314/dcn314_optc.c   |     10 +-
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c |     23 +-
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h |      2 +
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c |     11 +-
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.c   |    478 +
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.h   |    168 +
 drivers/gpu/drm/amd/display/dc/os_types.h          |      2 -
 drivers/gpu/drm/amd/display/dc/pg/Makefile         |     35 +
 .../amd/display/dc/{ =3D> pg}/dcn35/dcn35_pg_cntl.c  |      6 +-
 .../amd/display/dc/{ =3D> pg}/dcn35/dcn35_pg_cntl.h  |      0
 drivers/gpu/drm/amd/display/dc/resource/Makefile   |     10 +-
 .../amd/display/dc/resource/dce80/CMakeLists.txt   |      4 -
 .../amd/display/dc/resource/dce80/dce80_resource.c |      1 +
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |     27 +-
 .../display/dc/resource/dcn201/dcn201_resource.c   |      4 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |     15 +-
 .../display/dc/resource/dcn301/dcn301_resource.c   |     20 +-
 .../display/dc/resource/dcn303/dcn303_resource.c   |     11 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |      1 +
 .../display/dc/resource/dcn314/dcn314_resource.c   |     26 +-
 .../display/dc/resource/dcn315/dcn315_resource.c   |     14 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |     19 +-
 .../{ =3D> resource}/dcn32/dcn32_resource_helpers.c  |     15 +-
 .../display/dc/resource/dcn321/dcn321_resource.c   |     12 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |     11 +-
 .../display/dc/resource/dcn351/dcn351_resource.c   |      8 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |   2151 +
 .../display/dc/resource/dcn401/dcn401_resource.h   |    646 +
 drivers/gpu/drm/amd/display/dc/spl/Makefile        |     33 +
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c        |   1470 +
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.h        |     24 +
 .../drm/amd/display/dc/spl/dc_spl_isharp_filters.c |    350 +
 .../drm/amd/display/dc/spl/dc_spl_isharp_filters.h |     17 +
 .../drm/amd/display/dc/spl/dc_spl_scl_filters.c    |   1425 +
 .../drm/amd/display/dc/spl/dc_spl_scl_filters.h    |     59 +
 drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h  |    491 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |     48 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |    666 +-
 drivers/gpu/drm/amd/display/dmub/src/Makefile      |      1 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |     11 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.c |    603 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.h |    287 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_reg.h    |      1 -
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |     89 +
 .../gpu/drm/amd/display/dmub/src/dmub_srv_stat.c   |      6 +
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |     14 +
 drivers/gpu/drm/amd/display/include/dal_types.h    |      1 +
 .../gpu/drm/amd/display/include/grph_object_id.h   |      4 +-
 .../drm/amd/display/modules/freesync/freesync.c    |      2 +-
 .../drm/amd/display/modules/hdcp/hdcp1_execution.c |     24 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c    |     24 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |      3 -
 .../drm/amd/display/modules/power/power_helpers.c  |     22 +-
 .../drm/amd/display/modules/power/power_helpers.h  |      5 +
 drivers/gpu/drm/amd/include/amd_shared.h           |      4 +
 .../amd/include/asic_reg/dcn/dcn_3_0_0_offset.h    |    108 +
 .../amd/include/asic_reg/dcn/dcn_3_0_0_sh_mask.h   |     56 +
 .../amd/include/asic_reg/dcn/dcn_3_0_2_offset.h    |     90 +
 .../amd/include/asic_reg/dcn/dcn_3_0_2_sh_mask.h   |     44 +
 .../amd/include/asic_reg/dcn/dcn_3_0_3_offset.h    |     16 +
 .../amd/include/asic_reg/dcn/dcn_3_0_3_sh_mask.h   |     16 +
 .../amd/include/asic_reg/dcn/dcn_3_2_0_sh_mask.h   |     28 +
 .../amd/include/asic_reg/dcn/dcn_4_1_0_offset.h    |  16636 ++
 .../amd/include/asic_reg/dcn/dcn_4_1_0_sh_mask.h   | 145852 ++++++++++++++=
++++
 .../drm/amd/include/asic_reg/gc/gc_11_0_0_offset.h |     10 +
 .../drm/amd/include/asic_reg/gc/gc_12_0_0_offset.h |  11061 ++
 .../amd/include/asic_reg/gc/gc_12_0_0_sh_mask.h    |  40550 +++++
 .../include/asic_reg/mmhub/mmhub_4_1_0_offset.h    |   1341 +
 .../include/asic_reg/mmhub/mmhub_4_1_0_sh_mask.h   |   6943 +
 .../amd/include/asic_reg/thm/thm_14_0_2_offset.h   |    228 +
 .../amd/include/asic_reg/thm/thm_14_0_2_sh_mask.h  |    940 +
 drivers/gpu/drm/amd/include/atomfirmware.h         |      2 +-
 drivers/gpu/drm/amd/include/discovery.h            |     28 +-
 .../drm/amd/include/ivsrcid/isp/irqsrcs_isp_4_1.h  |     62 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |     17 +
 drivers/gpu/drm/amd/include/mes_api_def.h          |    570 -
 drivers/gpu/drm/amd/include/mes_v12_api_def.h      |    798 +
 drivers/gpu/drm/amd/include/soc21_enum.h           |      2 +-
 drivers/gpu/drm/amd/include/soc24_enum.h           |  21073 +++
 drivers/gpu/drm/amd/include/v12_structs.h          |   1189 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |     35 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |    211 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |     10 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h             |      1 -
 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c     |      9 -
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |     20 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |     10 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/pp_psm.c    |     21 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c    |      5 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h  |     36 +-
 .../amd/pm/powerplay/hwmgr/process_pptables_v1_0.c |      2 -
 .../drm/amd/pm/powerplay/hwmgr/processpptables.c   |      2 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |     37 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |     80 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c    |     29 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |    115 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |     20 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |     31 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h       |     38 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/smu10_smumgr.c |      5 +-
 .../drm/amd/pm/powerplay/smumgr/vega10_smumgr.c    |      6 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    137 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |     48 +-
 .../pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0.h   |     21 +-
 .../pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0_0.h |      1 -
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h   |      3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |      1 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |      4 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h       |     18 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |     69 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |     39 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |      8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |      6 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |     14 +
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |     61 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |     68 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |     70 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |     12 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |     28 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |     30 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |    235 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |      8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |     30 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |     97 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |    176 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |    167 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |     97 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |      2 +
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c   |     49 +-
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c    |      8 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.h    |      1 +
 .../gpu/drm/arm/display/komeda/komeda_pipeline.c   |      4 +-
 drivers/gpu/drm/ast/ast_drv.c                      |      4 +-
 drivers/gpu/drm/ast/ast_mode.c                     |    249 +-
 drivers/gpu/drm/ast/ast_reg.h                      |     10 +-
 drivers/gpu/drm/atmel-hlcdc/Kconfig                |      2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c     |    172 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |    105 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h       |    132 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c    |    369 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |      5 -
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |     20 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |     28 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |    365 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |     29 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |    157 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h  |      9 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          |     36 +-
 drivers/gpu/drm/bridge/analogix/anx7625.h          |     10 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |      5 -
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c        |      5 -
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |      5 -
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |      5 -
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |      5 -
 drivers/gpu/drm/bridge/ite-it6505.c                |     80 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |      1 +
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |      6 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |      5 -
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |      5 -
 drivers/gpu/drm/bridge/panel.c                     |      5 -
 drivers/gpu/drm/bridge/samsung-dsim.c              |     25 +-
 drivers/gpu/drm/bridge/sii902x.c                   |     46 +-
 drivers/gpu/drm/bridge/sii9234.c                   |      1 +
 drivers/gpu/drm/bridge/sil-sii8620.c               |      1 +
 drivers/gpu/drm/bridge/simple-bridge.c             |     18 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |      5 -
 drivers/gpu/drm/bridge/tc358767.c                  |    101 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |      5 -
 drivers/gpu/drm/ci/build-igt.sh                    |     41 +-
 drivers/gpu/drm/ci/build.sh                        |     10 +-
 drivers/gpu/drm/ci/build.yml                       |      1 +
 drivers/gpu/drm/ci/container.yml                   |     12 +-
 drivers/gpu/drm/ci/gitlab-ci.yml                   |     47 +-
 drivers/gpu/drm/ci/igt_runner.sh                   |     15 +-
 drivers/gpu/drm/ci/image-tags.yml                  |      4 +-
 drivers/gpu/drm/ci/lava-submit.sh                  |      4 +-
 drivers/gpu/drm/ci/test.yml                        |     41 +-
 drivers/gpu/drm/ci/testlist.txt                    |   2761 -
 drivers/gpu/drm/ci/x86_64.config                   |      1 +
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt  |     41 +-
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt |      7 +
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt  |     33 +-
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt      |     31 +
 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt     |      9 +
 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt      |     22 +-
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt       |     46 +-
 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt      |      6 +
 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt       |     26 +-
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt       |     38 +
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt      |      6 +
 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt       |     23 +
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt       |     41 +-
 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt      |      7 +
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt       |     26 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt       |     42 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt      |      7 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt       |     36 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt       |     77 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt       |     28 +-
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt       |     63 +-
 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt      |      6 +
 drivers/gpu/drm/ci/xfails/i915-whl-skips.txt       |     22 +-
 .../gpu/drm/ci/xfails/mediatek-mt8173-fails.txt    |     30 +-
 .../gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt   |     11 +
 .../gpu/drm/ci/xfails/mediatek-mt8173-skips.txt    |     16 +
 .../gpu/drm/ci/xfails/mediatek-mt8183-fails.txt    |     21 +-
 .../gpu/drm/ci/xfails/mediatek-mt8183-skips.txt    |     18 +
 drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt     |     24 +-
 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt     |     18 +
 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt    |     26 +-
 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt    |     15 +
 drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt    |      8 +-
 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt   |      6 +
 drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt    |     26 +-
 .../xfails/msm-sc7180-trogdor-kingoftown-fails.txt |    175 +-
 .../msm-sc7180-trogdor-kingoftown-flakes.txt       |      8 +
 .../xfails/msm-sc7180-trogdor-kingoftown-skips.txt |     19 +
 .../msm-sc7180-trogdor-lazor-limozeen-fails.txt    |    175 +-
 .../msm-sc7180-trogdor-lazor-limozeen-flakes.txt   |      6 +
 .../msm-sc7180-trogdor-lazor-limozeen-skips.txt    |     16 +
 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt     |     38 +-
 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt    |     25 +-
 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt     |     19 +
 .../gpu/drm/ci/xfails/rockchip-rk3288-fails.txt    |     62 +-
 .../gpu/drm/ci/xfails/rockchip-rk3288-skips.txt    |     21 +-
 .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt    |     83 +-
 .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt   |     13 +-
 .../gpu/drm/ci/xfails/rockchip-rk3399-skips.txt    |     19 +
 drivers/gpu/drm/ci/xfails/update-xfails.py         |      4 +-
 .../gpu/drm/ci/xfails/virtio_gpu-none-fails.txt    |     94 +-
 .../gpu/drm/ci/xfails/virtio_gpu-none-skips.txt    |     20 +-
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt      |     57 +
 drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt     |     69 +
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt      |    119 +
 drivers/gpu/drm/display/Kconfig                    |      7 +
 drivers/gpu/drm/display/Makefile                   |      2 +
 drivers/gpu/drm/display/drm_dp_helper.c            |      5 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |     15 +-
 drivers/gpu/drm/display/drm_dsc_helper.c           |     91 +
 drivers/gpu/drm/display/drm_hdmi_helper.c          |     61 +
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |    752 +
 drivers/gpu/drm/drm_atomic.c                       |     18 +-
 drivers/gpu/drm/drm_atomic_uapi.c                  |      4 +
 drivers/gpu/drm/drm_bridge.c                       |     42 -
 drivers/gpu/drm/drm_bridge_connector.c             |    107 +-
 drivers/gpu/drm/drm_connector.c                    |    201 +
 drivers/gpu/drm/drm_crtc.c                         |      6 +-
 drivers/gpu/drm/drm_crtc_internal.h                |      4 +-
 drivers/gpu/drm/drm_debugfs.c                      |    158 +-
 drivers/gpu/drm/drm_drv.c                          |      6 +-
 drivers/gpu/drm/drm_edid.c                         |     61 +-
 drivers/gpu/drm/drm_fb_helper.c                    |     11 +-
 drivers/gpu/drm/drm_fbdev_dma.c                    |     69 +-
 drivers/gpu/drm/drm_fbdev_shmem.c                  |    317 +
 .../drm/{drm_fbdev_generic.c =3D> drm_fbdev_ttm.c}   |     80 +-
 drivers/gpu/drm/drm_ioctl.c                        |      5 +-
 drivers/gpu/drm/drm_managed.c                      |      2 +-
 drivers/gpu/drm/drm_mipi_dbi.c                     |     77 +-
 drivers/gpu/drm/drm_mipi_dsi.c                     |    322 +
 drivers/gpu/drm/drm_mm.c                           |     35 -
 drivers/gpu/drm/drm_mode_object.c                  |      1 +
 drivers/gpu/drm/drm_modes.c                        |      5 +-
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |      1 +
 drivers/gpu/drm/drm_panic.c                        |    353 +-
 drivers/gpu/drm/drm_plane.c                        |     32 +-
 drivers/gpu/drm/drm_print.c                        |     72 +-
 drivers/gpu/drm/drm_probe_helper.c                 |     13 +-
 drivers/gpu/drm/drm_simple_kms_helper.c            |      1 +
 drivers/gpu/drm/drm_sysfs.c                        |     24 +-
 drivers/gpu/drm/drm_vblank_work.c                  |     22 +
 drivers/gpu/drm/etnaviv/cmdstream.xml.h            |     52 +-
 drivers/gpu/drm/etnaviv/common.xml.h               |     12 +-
 drivers/gpu/drm/etnaviv/etnaviv_dump.c             |      5 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              |      6 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |     83 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h              |      8 +
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |      9 +-
 drivers/gpu/drm/etnaviv/state.xml.h                |    103 +-
 drivers/gpu/drm/etnaviv/state_blt.xml.h            |     22 +-
 drivers/gpu/drm/etnaviv/state_hi.xml.h             |     30 +-
 drivers/gpu/drm/exynos/exynos_dp.c                 |      5 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c           |     80 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |      2 +-
 drivers/gpu/drm/gud/gud_drv.c                      |      5 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |      4 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c   |     17 +-
 drivers/gpu/drm/hisilicon/kirin/Kconfig            |      2 +-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |     11 +-
 drivers/gpu/drm/hisilicon/kirin/dw_dsi_reg.h       |      2 +
 drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h    |      2 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |      4 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |      4 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |     19 +-
 drivers/gpu/drm/i915/Kconfig                       |      1 -
 drivers/gpu/drm/i915/Kconfig.debug                 |     17 +
 drivers/gpu/drm/i915/Makefile                      |     27 +-
 drivers/gpu/drm/i915/display/dvo_ns2501.c          |      1 -
 drivers/gpu/drm/i915/display/g4x_dp.c              |     37 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |    175 +-
 drivers/gpu/drm/i915/display/i9xx_plane_regs.h     |    112 +
 drivers/gpu/drm/i915/display/i9xx_wm.c             |    114 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |     46 +-
 drivers/gpu/drm/i915/display/intel_alpm.c          |    415 +
 drivers/gpu/drm/i915/display/intel_alpm.h          |     27 +
 drivers/gpu/drm/i915/display/intel_atomic.c        |      1 -
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |     97 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |      7 +
 drivers/gpu/drm/i915/display/intel_audio.c         |     17 +-
 drivers/gpu/drm/i915/display/intel_audio_regs.h    |      3 +
 drivers/gpu/drm/i915/display/intel_bios.c          |    243 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |     65 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |    130 +-
 drivers/gpu/drm/i915/display/intel_color.c         |    154 +-
 drivers/gpu/drm/i915/display/intel_color.h         |      7 +-
 drivers/gpu/drm/i915/display/intel_color_regs.h    |      5 +
 drivers/gpu/drm/i915/display/intel_crt.c           |     50 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |     74 +-
 drivers/gpu/drm/i915/display/intel_crtc.h          |      1 +
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |     15 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |    166 +-
 drivers/gpu/drm/i915/display/intel_cursor.h        |      3 +
 drivers/gpu/drm/i915/display/intel_cursor_regs.h   |    112 +
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |    379 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |      8 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |     48 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |    140 +-
 drivers/gpu/drm/i915/display/intel_display.c       |    838 +-
 drivers/gpu/drm/i915/display/intel_display.h       |     13 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |     12 +-
 .../gpu/drm/i915/display/intel_display_device.c    |    937 +-
 .../gpu/drm/i915/display/intel_display_device.h    |     89 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |     96 +-
 .../gpu/drm/i915/display/intel_display_limits.h    |     21 +-
 .../gpu/drm/i915/display/intel_display_params.c    |      5 +-
 .../gpu/drm/i915/display/intel_display_params.h    |      1 +
 drivers/gpu/drm/i915/display/intel_display_power.c |     20 +-
 .../drm/i915/display/intel_display_power_well.c    |     14 +-
 drivers/gpu/drm/i915/display/intel_display_trace.h |     50 +
 drivers/gpu/drm/i915/display/intel_display_types.h |     95 +-
 drivers/gpu/drm/i915/display/intel_dkl_phy.c       |      1 -
 drivers/gpu/drm/i915/display/intel_dmc.c           |     21 +-
 drivers/gpu/drm/i915/display/intel_dmc.h           |      6 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |    410 +-
 drivers/gpu/drm/i915/display/intel_dp.h            |     24 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |    149 +-
 drivers/gpu/drm/i915/display/intel_dp_aux_regs.h   |     18 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |      5 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |    538 +-
 .../gpu/drm/i915/display/intel_dp_link_training.h  |      8 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |     84 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |     63 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |      2 +
 drivers/gpu/drm/i915/display/intel_dpt.c           |      9 +-
 drivers/gpu/drm/i915/display/intel_dpt.h           |      5 +-
 drivers/gpu/drm/i915/display/intel_dpt_common.c    |      1 +
 drivers/gpu/drm/i915/display/intel_drrs.c          |      8 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |     95 +-
 drivers/gpu/drm/i915/display/intel_dsb.h           |     13 +-
 drivers/gpu/drm/i915/display/intel_dsb_regs.h      |      6 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |      6 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |      5 +-
 drivers/gpu/drm/i915/display/intel_encoder.c       |     83 +
 drivers/gpu/drm/i915/display/intel_encoder.h       |     20 +
 drivers/gpu/drm/i915/display/intel_fb.c            |    164 +-
 drivers/gpu/drm/i915/display/intel_fb.h            |      3 -
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |    104 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.h        |     13 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |     38 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |     41 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c      |      6 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.h      |      4 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |     15 +-
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |     13 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |      2 +
 drivers/gpu/drm/i915/display/intel_hdcp.c          |     27 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c      |      2 +-
 .../gpu/drm/i915/display/intel_hdcp_gsc_message.c  |      2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |     41 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |     12 +-
 drivers/gpu/drm/i915/display/intel_lpe_audio.c     |      2 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c        |      2 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |     31 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |     60 +-
 .../gpu/drm/i915/display/intel_modeset_verify.c    |      8 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |     21 +-
 drivers/gpu/drm/i915/display/intel_overlay.h       |      6 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |      2 +-
 drivers/gpu/drm/i915/display/intel_pch_display.c   |     21 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |     21 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc_regs.h |    152 +
 drivers/gpu/drm/i915/display/intel_pps.c           |     32 +-
 drivers/gpu/drm/i915/display/intel_pps_regs.h      |     16 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |   1087 +-
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |     93 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |     27 +-
 drivers/gpu/drm/i915/display/intel_sprite_regs.h   |    242 +-
 drivers/gpu/drm/i915/display/intel_sprite_uapi.c   |      2 +-
 drivers/gpu/drm/i915/display/intel_tdf.h           |     25 +
 drivers/gpu/drm/i915/display/intel_vblank.c        |    179 +-
 drivers/gpu/drm/i915/display/intel_vblank.h        |      6 +
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |    729 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |     19 +-
 drivers/gpu/drm/i915/display/intel_vdsc_regs.h     |      6 +-
 drivers/gpu/drm/i915/display/intel_vga.c           |      1 +
 drivers/gpu/drm/i915/display/intel_vrr.c           |    182 +-
 drivers/gpu/drm/i915/display/intel_vrr_regs.h      |    127 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c |    273 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.h |      2 +
 .../drm/i915/display/skl_universal_plane_regs.h    |    442 +
 drivers/gpu/drm/i915/display/skl_watermark.c       |    134 +-
 drivers/gpu/drm/i915/display/skl_watermark.h       |     13 +-
 drivers/gpu/drm/i915/display/skl_watermark_regs.h  |     83 -
 drivers/gpu/drm/i915/display/vlv_dsi.c             |      3 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |    113 +
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |     10 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |      2 +-
 drivers/gpu/drm/i915/gt/intel_context.c            |      2 +
 drivers/gpu/drm/i915/gt/intel_context.h            |     22 +
 drivers/gpu/drm/i915/gt/intel_context_types.h      |      3 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |      4 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c          |      2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |      2 +-
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c     |      3 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |      5 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |      8 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |      2 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |      8 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |     13 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |      8 +
 drivers/gpu/drm/i915/gt/selftest_context.c         |      2 +-
 .../gpu/drm/i915/gt/selftest_engine_heartbeat.c    |    110 -
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h      |      1 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c       |      4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |     32 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |      2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |     27 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |     15 +-
 drivers/gpu/drm/i915/gvt/display.c                 |     73 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c                  |      3 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.c              |     23 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |    163 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c                   |      1 +
 drivers/gpu/drm/i915/gvt/reg.h                     |      3 -
 drivers/gpu/drm/i915/i915_driver.c                 |     51 +-
 drivers/gpu/drm/i915/i915_drv.h                    |     15 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |      5 +-
 drivers/gpu/drm/i915/i915_irq.c                    |      5 +-
 drivers/gpu/drm/i915/i915_params.c                 |      5 +
 drivers/gpu/drm/i915/i915_params.h                 |      3 +-
 drivers/gpu/drm/i915/i915_pci.c                    |    157 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   1007 +-
 drivers/gpu/drm/i915/i915_scatterlist.c            |      8 +-
 drivers/gpu/drm/i915/i915_suspend.c                |     48 +-
 drivers/gpu/drm/i915/intel_clock_gating.c          |     14 +-
 drivers/gpu/drm/i915/intel_device_info.c           |     92 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |    353 +-
 drivers/gpu/drm/i915/intel_memory_region.c         |      2 +-
 drivers/gpu/drm/i915/intel_memory_region.h         |      5 -
 drivers/gpu/drm/i915/intel_pci_config.h            |      2 +-
 drivers/gpu/drm/i915/intel_uncore.c                |      9 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           |      4 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |      2 +-
 drivers/gpu/drm/i915/soc/intel_dram.c              |    216 +-
 drivers/gpu/drm/i915/soc/intel_dram.h              |      1 +
 drivers/gpu/drm/i915/soc/intel_gmch.c              |      2 +-
 drivers/gpu/drm/i915/soc/intel_pch.c               |      4 +-
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c                |     24 +-
 drivers/gpu/drm/imx/ipuv3/imx-tve.c                |     14 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c                |      4 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |      4 +-
 drivers/gpu/drm/lima/lima_drv.c                    |      1 +
 drivers/gpu/drm/loongson/Kconfig                   |      1 +
 drivers/gpu/drm/loongson/lsdc_drv.c                |      4 +-
 drivers/gpu/drm/loongson/lsdc_output_7a1000.c      |     15 +-
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c      |     15 +-
 drivers/gpu/drm/mediatek/Kconfig                   |      1 +
 drivers/gpu/drm/mediatek/mtk_cec.c                 |     28 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c            |    109 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h            |      8 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c            |     18 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c          |     18 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c          |     18 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |     18 +-
 drivers/gpu/drm/mediatek/mtk_disp_merge.c          |     25 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |    140 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |      6 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |     31 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |     18 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |      5 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |     28 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |      4 +
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |      5 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c               |     46 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |     42 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c            |     21 +-
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |     18 +-
 drivers/gpu/drm/mediatek/mtk_padding.c             |     25 +-
 drivers/gpu/drm/mediatek/mtk_plane.c               |      4 +-
 drivers/gpu/drm/meson/meson_plane.c                |     17 +-
 drivers/gpu/drm/mgag200/Kconfig                    |     18 +-
 drivers/gpu/drm/mgag200/Makefile                   |      5 +-
 drivers/gpu/drm/mgag200/mgag200_bmc.c              |    107 +
 drivers/gpu/drm/mgag200/mgag200_ddc.c              |    179 +
 drivers/gpu/drm/mgag200/mgag200_ddc.h              |     11 +
 drivers/gpu/drm/mgag200/mgag200_drv.c              |     27 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |     46 +-
 drivers/gpu/drm/mgag200/mgag200_g200.c             |     46 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh.c           |     46 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c          |     46 +-
 drivers/gpu/drm/mgag200/mgag200_g200er.c           |     46 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c           |     46 +-
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c          |     46 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c           |     46 +-
 drivers/gpu/drm/mgag200/mgag200_g200wb.c           |     46 +-
 drivers/gpu/drm/mgag200/mgag200_i2c.c              |    129 -
 drivers/gpu/drm/mgag200/mgag200_mode.c             |     41 +-
 drivers/gpu/drm/mgag200/mgag200_reg.h              |      2 +-
 drivers/gpu/drm/mgag200/mgag200_vga.c              |     72 +
 drivers/gpu/drm/msm/Kconfig                        |      1 +
 drivers/gpu/drm/msm/Makefile                       |      5 +
 drivers/gpu/drm/msm/adreno/a2xx_catalog.c          |     52 +
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c          |     81 +
 drivers/gpu/drm/msm/adreno/a4xx_catalog.c          |     50 +
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c          |    161 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |     29 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   1259 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |     38 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |    995 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |     12 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |     13 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |    624 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |      6 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |     44 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |    335 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |     25 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |      2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |     61 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |     15 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |     13 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |     36 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |     34 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |     14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |      7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |      1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |      3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |     19 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |      5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |     26 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |     14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |      2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |     45 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |      7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |      4 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |     91 +-
 drivers/gpu/drm/msm/dp/dp_aux.c                    |      5 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |     11 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  |     47 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |      2 +-
 drivers/gpu/drm/msm/dsi/dsi.h                      |      1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |     59 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |      5 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |      2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |      6 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         |    273 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |    218 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c         |    109 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c         |    323 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c    |    205 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |    320 +-
 drivers/gpu/drm/msm/msm_drv.h                      |     11 +
 drivers/gpu/drm/msm/msm_gem.c                      |     37 +
 drivers/gpu/drm/msm/msm_gpu.c                      |      6 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |      9 +
 drivers/gpu/drm/msm/msm_mdss.c                     |      8 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |      8 +-
 drivers/gpu/drm/nouveau/dispnv50/head.c            |      8 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h  |      6 +
 drivers/gpu/drm/nouveau/nouveau_bo.c               |      2 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c             |      2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c        |      2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c             |      2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |      6 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c             |      2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |     30 +-
 drivers/gpu/drm/nouveau/nouveau_fence.h            |      2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |      2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.h            |      4 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             |      2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     |    362 +-
 drivers/gpu/drm/omapdrm/Kconfig                    |      2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c                 |      4 +-
 drivers/gpu/drm/panel/Kconfig                      |     29 +
 drivers/gpu/drm/panel/Makefile                     |      3 +
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c       |      1 +
 .../gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c   |    140 +-
 drivers/gpu/drm/panel/panel-auo-a030jtn01.c        |      1 +
 drivers/gpu/drm/panel/panel-boe-himax8279d.c       |     40 -
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |   2757 +-
 drivers/gpu/drm/panel/panel-edp.c                  |    260 +-
 drivers/gpu/drm/panel/panel-himax-hx83102.c        |    706 +
 drivers/gpu/drm/panel/panel-himax-hx8394.c         |      3 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       |      7 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9806e.c      |    402 +
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c      |    830 +-
 drivers/gpu/drm/panel/panel-innolux-ej030na.c      |      1 +
 drivers/gpu/drm/panel/panel-innolux-p079zca.c      |    332 +-
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   |   1088 +-
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c     |     35 -
 drivers/gpu/drm/panel/panel-khadas-ts050.c         |     39 -
 drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c |     48 -
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |     28 -
 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c |     28 -
 drivers/gpu/drm/panel/panel-lg-sw43408.c           |     74 +-
 drivers/gpu/drm/panel/panel-lincolntech-lcd197.c   |    262 +
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c    |    226 +
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c     |     29 -
 drivers/gpu/drm/panel/panel-novatek-nt36672e.c     |    647 +-
 drivers/gpu/drm/panel/panel-novatek-nt39016.c      |      1 +
 drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c |     44 -
 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c   |      1 +
 drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c |     41 +-
 .../gpu/drm/panel/panel-panasonic-vvx10f034n00.c   |     47 +-
 drivers/gpu/drm/panel/panel-raydium-rm67191.c      |     26 -
 drivers/gpu/drm/panel/panel-raydium-rm692e5.c      |    246 +-
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c   |     36 -
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c        |     49 -
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c    |     65 +-
 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c    |     24 -
 drivers/gpu/drm/panel/panel-simple.c               |    212 +-
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      |    871 +-
 drivers/gpu/drm/panel/panel-sony-acx565akm.c       |      6 -
 .../gpu/drm/panel/panel-sony-tulip-truly-nt35521.c |    433 +-
 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c       |     23 -
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   |     28 -
 drivers/gpu/drm/panfrost/panfrost_drv.c            |     11 +
 drivers/gpu/drm/panthor/panthor_sched.c            |      1 +
 drivers/gpu/drm/qxl/qxl_display.c                  |     17 +-
 drivers/gpu/drm/qxl/qxl_drv.c                      |      4 +-
 drivers/gpu/drm/qxl/qxl_object.c                   |     13 +-
 drivers/gpu/drm/qxl/qxl_object.h                   |      4 +-
 drivers/gpu/drm/radeon/atombios_encoders.c         |     12 +-
 drivers/gpu/drm/radeon/evergreen_hdmi.c            |      5 +-
 drivers/gpu/drm/radeon/pptable.h                   |      2 +-
 drivers/gpu/drm/radeon/radeon_audio.c              |     13 +-
 drivers/gpu/drm/radeon/radeon_connectors.c         |     37 +-
 drivers/gpu/drm/radeon/radeon_display.c            |      2 +-
 drivers/gpu/drm/radeon/radeon_encoders.c           |      4 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |      2 +-
 drivers/gpu/drm/radeon/radeon_mode.h               |      2 -
 drivers/gpu/drm/renesas/rcar-du/Kconfig            |      2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c      |      4 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c       |      4 +-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c   |      4 +-
 drivers/gpu/drm/rockchip/Kconfig                   |      3 +
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |     26 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |     20 +
 drivers/gpu/drm/rockchip/inno_hdmi.c               |    152 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |      4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |      2 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |      4 +-
 drivers/gpu/drm/sti/Kconfig                        |      2 +-
 drivers/gpu/drm/sti/sti_dvo.c                      |      1 +
 drivers/gpu/drm/stm/Kconfig                        |     13 +-
 drivers/gpu/drm/stm/Makefile                       |      2 +
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c              |    279 +-
 drivers/gpu/drm/stm/lvds.c                         |   1226 +
 drivers/gpu/drm/sun4i/Kconfig                      |      3 +
 drivers/gpu/drm/sun4i/sun4i_backend.c              |      4 +-
 drivers/gpu/drm/sun4i/sun4i_crtc.c                 |      2 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |     83 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c                |     70 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.h                |     20 +
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |     85 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h             |     20 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |     86 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h             |     20 +-
 drivers/gpu/drm/sun4i/sunxi_engine.h               |     13 +-
 drivers/gpu/drm/tests/Makefile                     |      1 +
 drivers/gpu/drm/tests/drm_buddy_test.c             |      1 +
 drivers/gpu/drm/tests/drm_cmdline_parser_test.c    |     12 +
 drivers/gpu/drm/tests/drm_connector_test.c         |   1053 +-
 drivers/gpu/drm/tests/drm_damage_helper_test.c     |      1 +
 drivers/gpu/drm/tests/drm_dp_mst_helper_test.c     |      1 +
 drivers/gpu/drm/tests/drm_exec_test.c              |      1 +
 drivers/gpu/drm/tests/drm_format_test.c            |      1 +
 drivers/gpu/drm/tests/drm_framebuffer_test.c       |      1 +
 drivers/gpu/drm/tests/drm_gem_shmem_test.c         |      1 +
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |   1744 +
 drivers/gpu/drm/tests/drm_kunit_edid.h             |    484 +
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |      1 +
 drivers/gpu/drm/tests/drm_managed_test.c           |      1 +
 drivers/gpu/drm/tests/drm_mm_test.c                |      1 +
 drivers/gpu/drm/tests/drm_modes_test.c             |     32 +
 drivers/gpu/drm/tests/drm_plane_helper_test.c      |      1 +
 drivers/gpu/drm/tests/drm_probe_helper_test.c      |      1 +
 drivers/gpu/drm/tests/drm_rect_test.c              |      1 +
 drivers/gpu/drm/tidss/tidss_plane.c                |     14 +-
 drivers/gpu/drm/tiny/bochs.c                       |     28 +-
 drivers/gpu/drm/tiny/cirrus.c                      |      5 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |      5 +-
 drivers/gpu/drm/tiny/hx8357d.c                     |      4 +-
 drivers/gpu/drm/tiny/ili9163.c                     |      4 +-
 drivers/gpu/drm/tiny/ili9225.c                     |      5 +-
 drivers/gpu/drm/tiny/ili9341.c                     |      4 +-
 drivers/gpu/drm/tiny/ili9486.c                     |      4 +-
 drivers/gpu/drm/tiny/mi0283qt.c                    |      5 +-
 drivers/gpu/drm/tiny/ofdrm.c                       |      4 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              |     60 +-
 drivers/gpu/drm/tiny/repaper.c                     |      4 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |      4 +-
 drivers/gpu/drm/tiny/st7586.c                      |      5 +-
 drivers/gpu/drm/tiny/st7735r.c                     |      4 +-
 drivers/gpu/drm/ttm/tests/.kunitconfig             |      1 -
 drivers/gpu/drm/ttm/tests/Makefile                 |      2 +
 drivers/gpu/drm/ttm/tests/TODO                     |     27 +
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c            |     63 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c   |   1225 +
 drivers/gpu/drm/ttm/tests/ttm_device_test.c        |      3 +-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c      |    176 +-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h      |     17 +-
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c       |    234 +
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h       |     30 +
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c          |      9 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c      |     21 +-
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c            |    169 +-
 drivers/gpu/drm/ttm/ttm_tt.c                       |      3 +
 drivers/gpu/drm/udl/Makefile                       |      8 +-
 drivers/gpu/drm/udl/udl_drv.c                      |      5 +-
 drivers/gpu/drm/udl/udl_drv.h                      |     12 +-
 drivers/gpu/drm/udl/udl_edid.c                     |     80 +
 drivers/gpu/drm/udl/udl_edid.h                     |     15 +
 drivers/gpu/drm/udl/udl_modeset.c                  |    138 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |     11 +
 drivers/gpu/drm/v3d/v3d_drv.h                      |     11 +-
 drivers/gpu/drm/v3d/v3d_perfmon.c                  |    228 +-
 drivers/gpu/drm/v3d/v3d_performance_counters.h     |     29 +
 drivers/gpu/drm/v3d/v3d_sched.c                    |      2 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |      4 +-
 drivers/gpu/drm/vc4/Kconfig                        |      1 +
 drivers/gpu/drm/vc4/tests/vc4_mock.c               |      6 +-
 drivers/gpu/drm/vc4/tests/vc4_mock.h               |      9 +-
 drivers/gpu/drm/vc4/tests/vc4_mock_plane.c         |     44 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |    644 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |     44 +-
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c                 |      6 +-
 drivers/gpu/drm/vc4/vc4_vec.c                      |     31 +-
 drivers/gpu/drm/virtio/virtgpu_display.c           |     10 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c               |      4 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |      2 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |     12 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |      4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |      4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c               |      1 -
 drivers/gpu/drm/xe/Kconfig                         |      1 -
 drivers/gpu/drm/xe/Kconfig.debug                   |     10 -
 drivers/gpu/drm/xe/Makefile                        |     46 +-
 drivers/gpu/drm/xe/abi/guc_actions_abi.h           |      6 -
 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h      |     22 +
 drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h     |    190 +
 drivers/gpu/drm/xe/abi/guc_errors_abi.h            |     57 +-
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h              |     40 +-
 drivers/gpu/drm/xe/abi/guc_messages_abi.h          |     41 +-
 drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h     |    170 +-
 .../gem/i915_gem_object_types.h                    |     11 +
 .../{ =3D> gem}/i915_gem_stolen.h                    |      0
 .../compat-i915-headers/{ =3D> gt}/intel_gt_types.h  |      0
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |     67 +-
 .../drm/xe/compat-i915-headers/intel_runtime_pm.h  |     51 +
 .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |      5 +
 drivers/gpu/drm/xe/display/ext/i915_irq.c          |      1 -
 drivers/gpu/drm/xe/display/intel_fb_bo.c           |      7 +-
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c        |     37 +-
 drivers/gpu/drm/xe/display/intel_fbdev_fb.h        |     21 -
 drivers/gpu/drm/xe/display/xe_display.c            |     64 +-
 drivers/gpu/drm/xe/display/xe_display.h            |     12 +-
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c         |      9 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |     29 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c           |      3 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |     23 +-
 drivers/gpu/drm/xe/display/xe_tdf.c                |     13 +
 .../xe/{regs =3D> instructions}/xe_gpu_commands.h    |      0
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h   |      5 +
 drivers/gpu/drm/xe/regs/xe_bars.h                  |     11 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h           |     12 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |     81 +-
 drivers/gpu/drm/xe/regs/xe_guc_regs.h              |      2 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h            |      8 +
 drivers/gpu/drm/xe/regs/xe_oa_regs.h               |    100 +
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h            |      7 +
 drivers/gpu/drm/xe/regs/xe_regs.h                  |      3 +
 drivers/gpu/drm/xe/regs/xe_sriov_regs.h            |      3 +
 drivers/gpu/drm/xe/tests/Makefile                  |      1 +
 drivers/gpu/drm/xe/tests/xe_args_test.c            |    221 +
 .../gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c |    232 +
 drivers/gpu/drm/xe/tests/xe_migrate.c              |     88 +-
 drivers/gpu/drm/xe/tests/xe_mocs.c                 |      8 +-
 drivers/gpu/drm/xe/tests/xe_rtp_test.c             |     64 +-
 drivers/gpu/drm/xe/xe_args.h                       |    143 +
 drivers/gpu/drm/xe/xe_assert.h                     |      4 +-
 drivers/gpu/drm/xe/xe_bb.c                         |      2 +-
 drivers/gpu/drm/xe/xe_bo.c                         |     82 +-
 drivers/gpu/drm/xe/xe_bo.h                         |      1 +
 drivers/gpu/drm/xe/xe_debugfs.c                    |     58 +
 drivers/gpu/drm/xe/xe_devcoredump.c                |     27 +-
 drivers/gpu/drm/xe/xe_devcoredump_types.h          |      2 +
 drivers/gpu/drm/xe/xe_device.c                     |    201 +-
 drivers/gpu/drm/xe/xe_device.h                     |     15 +-
 drivers/gpu/drm/xe/xe_device_sysfs.c               |      4 +-
 drivers/gpu/drm/xe/xe_device_types.h               |     33 +-
 drivers/gpu/drm/xe/xe_drm_client.c                 |    131 +-
 drivers/gpu/drm/xe/xe_exec.c                       |      8 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                 |     85 +-
 drivers/gpu/drm/xe/xe_exec_queue.h                 |     10 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h           |     42 +-
 drivers/gpu/drm/xe/xe_execlist.c                   |     12 +-
 drivers/gpu/drm/xe/xe_force_wake.c                 |    102 +-
 drivers/gpu/drm/xe/xe_force_wake.h                 |     13 +-
 drivers/gpu/drm/xe/xe_ggtt.c                       |     81 +-
 drivers/gpu/drm/xe/xe_ggtt.h                       |      1 -
 drivers/gpu/drm/xe/xe_ggtt_types.h                 |     12 +-
 drivers/gpu/drm/xe/xe_gsc.c                        |      8 +
 drivers/gpu/drm/xe/xe_gsc.h                        |      3 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c                  |      5 +-
 drivers/gpu/drm/xe/xe_gsc_submit.c                 |      1 +
 drivers/gpu/drm/xe/xe_gt.c                         |    168 +-
 drivers/gpu/drm/xe/xe_gt.h                         |     28 +
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c                |     19 +-
 drivers/gpu/drm/xe/xe_gt_clock.c                   |     21 +
 drivers/gpu/drm/xe/xe_gt_clock.h                   |      1 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c                 |     31 +
 drivers/gpu/drm/xe/xe_gt_freq.c                    |      8 +-
 drivers/gpu/drm/xe/xe_gt_idle.c                    |     73 +-
 drivers/gpu/drm/xe/xe_gt_idle.h                    |      4 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c                     |     33 +-
 drivers/gpu/drm/xe/xe_gt_mcr.h                     |     25 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c               |    156 +-
 drivers/gpu/drm/xe/xe_gt_printk.h                  |      3 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c                |     44 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h                |     10 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |    183 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h         |     10 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h   |      4 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c        |     21 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h        |      1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c        |    427 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h        |     18 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c        |    147 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h        |     27 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor_types.h  |     22 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c        |    550 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.h        |     36 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service_types.h  |     52 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h          |     10 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c                |    979 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h                |     30 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c        |     72 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.h        |     14 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h          |     84 +
 drivers/gpu/drm/xe/xe_gt_sysfs.c                   |      4 +-
 .../{xe_gt_throttle_sysfs.c =3D> xe_gt_throttle.c}   |     30 +-
 drivers/gpu/drm/xe/xe_gt_throttle.h                |     17 +
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h          |     16 -
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |    125 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h        |      3 +
 drivers/gpu/drm/xe/xe_gt_topology.c                |     14 +-
 drivers/gpu/drm/xe/xe_gt_topology.h                |      3 +
 drivers/gpu/drm/xe/xe_gt_types.h                   |     38 +-
 drivers/gpu/drm/xe/xe_guc.c                        |    383 +-
 drivers/gpu/drm/xe/xe_guc.h                        |      3 +-
 drivers/gpu/drm/xe/xe_guc_ads.c                    |     71 +-
 drivers/gpu/drm/xe/xe_guc_ads.h                    |      3 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                     |     93 +-
 drivers/gpu/drm/xe/xe_guc_ct.h                     |      2 +
 drivers/gpu/drm/xe/xe_guc_ct_types.h               |      2 +
 drivers/gpu/drm/xe/xe_guc_db_mgr.c                 |      3 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c                 |      3 +-
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c            |     12 +
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h            |     15 +-
 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h     |     64 +
 .../gpu/drm/xe/xe_guc_klv_thresholds_set_types.h   |     68 +
 drivers/gpu/drm/xe/xe_guc_pc.c                     |    225 +-
 drivers/gpu/drm/xe/xe_guc_pc.h                     |     10 +-
 drivers/gpu/drm/xe/xe_guc_pc_types.h               |      4 +
 drivers/gpu/drm/xe/xe_guc_relay.c                  |     17 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |    601 +-
 drivers/gpu/drm/xe/xe_guc_submit.h                 |      4 +-
 drivers/gpu/drm/xe/xe_guc_types.h                  |      9 -
 drivers/gpu/drm/xe/xe_huc.c                        |     32 +-
 drivers/gpu/drm/xe/xe_huc.h                        |      3 +-
 drivers/gpu/drm/xe/xe_hw_engine.c                  |    202 +-
 drivers/gpu/drm/xe/xe_hw_engine.h                  |      4 +
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c      |     30 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h            |     28 +-
 drivers/gpu/drm/xe/xe_hw_fence.c                   |     60 +-
 drivers/gpu/drm/xe/xe_hw_fence.h                   |      7 +-
 drivers/gpu/drm/xe/xe_hwmon.c                      |    126 +-
 drivers/gpu/drm/xe/xe_irq.c                        |     12 +-
 drivers/gpu/drm/xe/xe_irq.h                        |      1 -
 drivers/gpu/drm/xe/xe_lrc.c                        |    392 +-
 drivers/gpu/drm/xe/xe_lrc.h                        |     64 +-
 drivers/gpu/drm/xe/xe_lrc_types.h                  |     12 +
 drivers/gpu/drm/xe/xe_migrate.c                    |    114 +-
 drivers/gpu/drm/xe/xe_mmio.c                       |    453 +-
 drivers/gpu/drm/xe/xe_mmio.h                       |     22 +-
 drivers/gpu/drm/xe/xe_mocs.c                       |    353 +-
 drivers/gpu/drm/xe/xe_mocs.h                       |     11 +-
 drivers/gpu/drm/xe/xe_module.c                     |     10 +
 drivers/gpu/drm/xe/xe_module.h                     |      1 +
 drivers/gpu/drm/xe/xe_oa.c                         |   2512 +
 drivers/gpu/drm/xe/xe_oa.h                         |     27 +
 drivers/gpu/drm/xe/xe_oa_types.h                   |    242 +
 drivers/gpu/drm/xe/xe_observation.c                |     93 +
 drivers/gpu/drm/xe/xe_observation.h                |     20 +
 drivers/gpu/drm/xe/xe_pat.c                        |      1 +
 drivers/gpu/drm/xe/xe_pci.c                        |    113 +-
 drivers/gpu/drm/xe/xe_pci_sriov.c                  |    170 +
 drivers/gpu/drm/xe/xe_pci_sriov.h                  |     20 +
 drivers/gpu/drm/xe/xe_pci_types.h                  |      4 +
 drivers/gpu/drm/xe/xe_pcode.c                      |      6 +-
 drivers/gpu/drm/xe/xe_pm.c                         |     42 +-
 drivers/gpu/drm/xe/xe_pm.h                         |      9 +-
 drivers/gpu/drm/xe/xe_preempt_fence.c              |     16 +-
 drivers/gpu/drm/xe/xe_pt.c                         |     77 +-
 drivers/gpu/drm/xe/xe_query.c                      |     87 +-
 drivers/gpu/drm/xe/xe_reg_sr.h                     |      4 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c              |     24 +-
 drivers/gpu/drm/xe/xe_res_cursor.h                 |      2 -
 drivers/gpu/drm/xe/xe_ring_ops.c                   |     55 +-
 drivers/gpu/drm/xe/xe_rtp.c                        |     41 +-
 drivers/gpu/drm/xe/xe_rtp.h                        |     59 +-
 drivers/gpu/drm/xe/xe_rtp_helpers.h                |     28 +-
 drivers/gpu/drm/xe/xe_rtp_types.h                  |      3 +
 drivers/gpu/drm/xe/xe_sched_job.c                  |    187 +-
 drivers/gpu/drm/xe/xe_sched_job.h                  |     10 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h            |     20 +-
 drivers/gpu/drm/xe/xe_sriov.c                      |     11 +
 drivers/gpu/drm/xe/xe_sriov.h                      |      6 +-
 drivers/gpu/drm/xe/xe_sync.c                       |     15 +
 drivers/gpu/drm/xe/xe_sync.h                       |      1 +
 drivers/gpu/drm/xe/xe_tile_sysfs.c                 |      4 +-
 drivers/gpu/drm/xe/xe_trace.h                      |    392 +-
 drivers/gpu/drm/xe/xe_trace_bo.c                   |      9 +
 drivers/gpu/drm/xe/xe_trace_bo.h                   |    247 +
 drivers/gpu/drm/xe/xe_trace_guc.c                  |      9 +
 drivers/gpu/drm/xe/xe_trace_guc.h                  |    110 +
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c             |      2 +
 drivers/gpu/drm/xe/xe_uc.c                         |     58 +-
 drivers/gpu/drm/xe/xe_uc.h                         |      4 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                      |      5 +
 drivers/gpu/drm/xe/xe_uc_fw.h                      |      2 +-
 drivers/gpu/drm/xe/xe_vm.c                         |    944 +-
 drivers/gpu/drm/xe/xe_vm.h                         |      5 +-
 drivers/gpu/drm/xe/xe_vm_doc.h                     |     24 +-
 drivers/gpu/drm/xe/xe_vm_types.h                   |     29 +-
 drivers/gpu/drm/xe/xe_vram.c                       |    368 +
 drivers/gpu/drm/xe/xe_vram.h                       |     13 +
 drivers/gpu/drm/xe/xe_vram_freq.c                  |      4 +-
 drivers/gpu/drm/xe/xe_wa.c                         |     48 +-
 drivers/gpu/drm/xe/xe_wa.h                         |      2 -
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |      2 +
 drivers/gpu/drm/xlnx/zynqmp_disp.c                 |     44 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |     62 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |      1 +
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h                |      1 +
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  |     22 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.h                  |      4 +-
 drivers/gpu/ipu-v3/ipu-pre.c                       |    131 +-
 drivers/gpu/ipu-v3/ipu-prg.c                       |      2 +-
 drivers/gpu/ipu-v3/ipu-prv.h                       |      2 +-
 drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c         |      4 +-
 drivers/misc/mei/hdcp/mei_hdcp.c                   |      4 +-
 drivers/misc/mei/pxp/mei_pxp.c                     |      4 +-
 drivers/platform/x86/intel_ips.c                   |      2 +-
 drivers/soc/qcom/smem.c                            |     33 +
 drivers/soc/qcom/socinfo.c                         |      8 -
 drivers/video/fbdev/core/fb_defio.c                |     82 +-
 drivers/video/logo/Kconfig                         |      2 +
 include/drm/bridge/analogix_dp.h                   |      4 +-
 include/drm/display/drm_dp.h                       |     28 +-
 include/drm/display/drm_dp_helper.h                |      3 +-
 include/drm/display/drm_dsc_helper.h               |      3 +
 include/drm/display/drm_hdmi_helper.h              |      4 +
 include/drm/display/drm_hdmi_state_helper.h        |     23 +
 include/drm/drm_bridge.h                           |     84 +-
 include/drm/drm_connector.h                        |    252 +-
 include/drm/drm_drv.h                              |      2 +-
 include/drm/drm_edid.h                             |      4 -
 include/drm/drm_fbdev_generic.h                    |     15 -
 include/drm/drm_fbdev_shmem.h                      |     15 +
 include/drm/drm_fbdev_ttm.h                        |     15 +
 include/drm/drm_fixed.h                            |     23 +
 include/drm/drm_mipi_dbi.h                         |     10 +
 include/drm/drm_mipi_dsi.h                         |    129 +-
 include/drm/drm_mm.h                               |      1 -
 include/drm/drm_mode_config.h                      |      4 +-
 include/drm/drm_panic.h                            |      9 +
 include/drm/drm_plane.h                            |      2 +
 include/drm/drm_print.h                            |     14 +-
 include/drm/drm_vblank_work.h                      |      2 +
 include/drm/i915_pciids.h                          |    767 -
 include/drm/{ =3D> intel}/i915_component.h           |      0
 include/drm/{ =3D> intel}/i915_drm.h                 |      0
 .../drm/{ =3D> intel}/i915_gsc_proxy_mei_interface.h |      0
 include/drm/{ =3D> intel}/i915_hdcp_interface.h      |      0
 include/drm/intel/i915_pciids.h                    |    800 +
 include/drm/{ =3D> intel}/i915_pxp_tee_interface.h   |      0
 include/drm/{ =3D> intel}/intel-gtt.h                |      0
 include/drm/{ =3D> intel}/intel_lpe_audio.h          |      0
 include/drm/{ =3D> intel}/xe_pciids.h                |      7 +
 include/drm/ttm/ttm_bo.h                           |      4 +
 include/linux/devcoredump.h                        |     53 +-
 include/linux/dma-fence-array.h                    |      3 +
 include/linux/dma-heap.h                           |      4 +-
 include/linux/fb.h                                 |      1 +
 include/linux/firmware/qcom/qcom_scm.h             |     23 +
 include/linux/habanalabs/cpucp_if.h                |     20 +-
 include/linux/habanalabs/hl_boot_if.h              |     29 +-
 include/linux/mfd/atmel-hlcdc.h                    |     10 +
 include/linux/soc/qcom/smem.h                      |      1 +
 include/linux/soc/qcom/socinfo.h                   |     34 +
 include/sound/hdaudio.h                            |      2 +-
 include/uapi/drm/amdgpu_drm.h                      |     25 +-
 include/uapi/drm/drm_fourcc.h                      |     18 +
 include/uapi/drm/drm_mode.h                        |      8 -
 include/uapi/drm/i915_drm.h                        |     27 +
 include/uapi/drm/ivpu_accel.h                      |     69 +-
 include/uapi/drm/msm_drm.h                         |      1 +
 include/uapi/drm/v3d_drm.h                         |     48 +
 include/uapi/drm/xe_drm.h                          |    312 +
 include/uapi/linux/dma-heap.h                      |      2 +-
 include/uapi/linux/kfd_ioctl.h                     |      5 +-
 include/uapi/linux/kfd_sysfs.h                     |     19 +-
 lib/fonts/Kconfig                                  |     22 +-
 sound/x86/intel_hdmi_audio.c                       |      2 +-
 1810 files changed, 395716 insertions(+), 34044 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/panel-edp-legacy.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/wl-355608-a8.yaml
 create mode 100644
Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
 create mode 100644 Documentation/gpu/xe/xe-drm-usage-stats.rst
 create mode 100644 drivers/accel/ivpu/ivpu_hw.c
 delete mode 100644 drivers/accel/ivpu/ivpu_hw_37xx.c
 delete mode 100644 drivers/accel/ivpu/ivpu_hw_40xx.c
 create mode 100644 drivers/accel/ivpu/ivpu_hw_btrs.c
 create mode 100644 drivers/accel/ivpu/ivpu_hw_btrs.h
 create mode 100644 drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h
 create mode 100644 drivers/accel/ivpu/ivpu_hw_btrs_mtl_reg.h
 create mode 100644 drivers/accel/ivpu/ivpu_hw_ip.c
 create mode 100644 drivers/accel/ivpu/ivpu_hw_ip.h
 create mode 100644 drivers/accel/ivpu/ivpu_ms.c
 create mode 100644 drivers/accel/ivpu/ivpu_ms.h
 create mode 100644 drivers/accel/ivpu/ivpu_sysfs.c
 create mode 100644 drivers/accel/ivpu/ivpu_sysfs.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/clearstate_gfx12.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
 rename drivers/gpu/drm/amd/amdgpu/{mes_v10_1.h =3D> gfx_v12_0.h} (87%)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v12_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v12_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/imu_v12_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/imu_v12_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.h
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mes_v12_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/soc24.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/soc24.h
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v12=
.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c
 delete mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/smu13_driver_if.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dalsmc.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr_smu_msg.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr_smu_msg.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_smu14_driver_if.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_spl_translate.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_spl_translate.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dccg/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dccg}/dcn20/dcn20_dccg.c (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dccg}/dcn20/dcn20_dccg.h (94%=
)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dccg}/dcn201/dcn201_dccg.c (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dccg}/dcn201/dcn201_dccg.h (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dccg}/dcn21/dcn21_dccg.c (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dccg}/dcn21/dcn21_dccg.h (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dccg}/dcn30/dcn30_dccg.c (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dccg}/dcn30/dcn30_dccg.h (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dccg}/dcn301/dcn301_dccg.c (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dccg}/dcn301/dcn301_dccg.h (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dccg}/dcn302/dcn302_dccg.h (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dccg}/dcn303/dcn303_dccg.h (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dccg}/dcn31/dcn31_dccg.c (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dccg}/dcn31/dcn31_dccg.h (99%=
)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dccg}/dcn314/dcn314_dccg.c (9=
8%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dccg}/dcn314/dcn314_dccg.h (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dccg}/dcn32/dcn32_dccg.c (97%=
)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dccg}/dcn32/dcn32_dccg.h (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dccg}/dcn35/dcn35_dccg.c (92%=
)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dccg}/dcn35/dcn35_dccg.h (100=
%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dccg/dcn401/dcn401_dccg.=
c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dccg/dcn401/dcn401_dccg.=
h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/Makefile
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dcn321/Makefile
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn401/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dio/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn10/dcn10_link_encoder.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn10/dcn10_link_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn10/dcn10_stream_encoder.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn10/dcn10_stream_encoder.h (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn20/dcn20_link_encoder.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn20/dcn20_link_encoder.h (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn20/dcn20_stream_encoder.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn20/dcn20_stream_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn30/dcn30_dio_link_encoder.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn30/dcn30_dio_link_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn30/dcn30_dio_stream_encoder.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn30/dcn30_dio_stream_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn31/dcn31_dio_link_encoder.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn31/dcn31_dio_link_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn32/dcn32_dio_link_encoder.c (98%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn32/dcn32_dio_link_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn32/dcn32_dio_stream_encoder.c (92%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn32/dcn32_dio_stream_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn321/dcn321_dio_link_encoder.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn321/dcn321_dio_link_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn35/dcn35_dio_link_encoder.c (98%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn35/dcn35_dio_link_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn35/dcn35_dio_stream_encoder.c (91%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn35/dcn35_dio_stream_encoder.h (99%)
 create mode 100644
drivers/gpu/drm/amd/display/dc/dio/dcn401/dcn401_dio_link_encoder.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dio/dcn401/dcn401_dio_link_encoder.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dio/dcn401/dcn401_dio_stream_encoder.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dio/dcn401/dcn401_dio_stream_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn401/dcn401_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn401/dcn401_fpu.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper=
.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper=
.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn3_soc_bb.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml2_external_lib_deps.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_dchub_registers.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_display_cfg_types.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_policy_types.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calc=
s.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calc=
s.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_ty=
pes.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.=
c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.=
h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib=
_float_math.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib=
_float_math.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_optimizatio=
n.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_optimizatio=
n.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_internal_shared_type=
s.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn10/CMakeLists.txt
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn20/CMakeLists.txt
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn201/CMakeLists.tx=
t
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn30/CMakeLists.txt
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn32/CMakeLists.txt
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn35/CMakeLists.txt
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm=
.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_ds=
cl.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dwb/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dwb}/dcn35/dcn35_dwb.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dwb}/dcn35/dcn35_dwb.h (100%)
 create mode 100644
drivers/gpu/drm/amd/display/dc/gpio/dcn401/hw_factory_dcn401.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/gpio/dcn401/hw_factory_dcn401.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/gpio/dcn401/hw_translate_dcn401.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/gpio/dcn401/hw_translate_dcn401.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/hpo/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
hpo}/dcn32/dcn32_hpo_dp_link_encoder.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
hpo}/dcn32/dcn32_hpo_dp_link_encoder.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/hubbub/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubbub}/dcn10/dcn10_hubbub.c =
(99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubbub}/dcn10/dcn10_hubbub.h =
(89%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubbub}/dcn20/dcn20_hubbub.c =
(97%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubbub}/dcn20/dcn20_hubbub.h =
(99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
hubbub}/dcn201/dcn201_hubbub.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
hubbub}/dcn201/dcn201_hubbub.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubbub}/dcn21/dcn21_hubbub.c =
(100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubbub}/dcn21/dcn21_hubbub.h =
(100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubbub}/dcn30/dcn30_hubbub.c =
(99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubbub}/dcn30/dcn30_hubbub.h =
(100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
hubbub}/dcn301/dcn301_hubbub.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
hubbub}/dcn301/dcn301_hubbub.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubbub}/dcn31/dcn31_hubbub.c =
(99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubbub}/dcn31/dcn31_hubbub.h =
(100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubbub}/dcn32/dcn32_hubbub.c =
(99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubbub}/dcn32/dcn32_hubbub.h =
(98%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubbub}/dcn35/dcn35_hubbub.c =
(100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubbub}/dcn35/dcn35_hubbub.h =
(100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/hubbub/dcn401/dcn401_hub=
bub.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/hubbub/dcn401/dcn401_hub=
bub.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/hubp/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubp}/dcn10/dcn10_hubp.c (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubp}/dcn10/dcn10_hubp.h (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubp}/dcn20/dcn20_hubp.c (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubp}/dcn20/dcn20_hubp.h (89%=
)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubp}/dcn201/dcn201_hubp.c (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubp}/dcn201/dcn201_hubp.h (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubp}/dcn21/dcn21_hubp.c (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubp}/dcn21/dcn21_hubp.h (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubp}/dcn30/dcn30_hubp.c (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubp}/dcn30/dcn30_hubp.h (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubp}/dcn31/dcn31_hubp.c (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubp}/dcn31/dcn31_hubp.h (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubp}/dcn32/dcn32_hubp.c (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubp}/dcn32/dcn32_hubp.h (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubp}/dcn35/dcn35_hubp.c (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hubp}/dcn35/dcn35_hubp.h (100=
%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.=
c
 create mode 100644 drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.=
h
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq=
.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq=
.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.=
c
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.=
h
 create mode 100644
drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/mmhubbub/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
mmhubbub}/dcn32/dcn32_mmhubbub.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
mmhubbub}/dcn32/dcn32_mmhubbub.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
mmhubbub}/dcn35/dcn35_mmhubbub.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
mmhubbub}/dcn35/dcn35_mmhubbub.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/mpc/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ =3D> mpc}/dcn32/dcn32_mpc.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> mpc}/dcn32/dcn32_mpc.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/opp/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ =3D> opp}/dcn35/dcn35_opp.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> opp}/dcn35/dcn35_opp.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/optc/dcn401/dcn401_optc.=
c
 create mode 100644 drivers/gpu/drm/amd/display/dc/optc/dcn401/dcn401_optc.=
h
 create mode 100644 drivers/gpu/drm/amd/display/dc/pg/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ =3D> pg}/dcn35/dcn35_pg_cntl.c (99=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> pg}/dcn35/dcn35_pg_cntl.h (10=
0%)
 delete mode 100644 drivers/gpu/drm/amd/display/dc/resource/dce80/CMakeList=
s.txt
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn32/dcn32_resource_helpers.c (97%)
 create mode 100644
drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filter=
s.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filter=
s.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_4_1_0_offs=
et.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_4_1_0_sh_m=
ask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_12_0_0_offse=
t.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_12_0_0_sh_ma=
sk.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_4_1_0_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_4_1_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/thm/thm_14_0_2_off=
set.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/thm/thm_14_0_2_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/ivsrcid/isp/irqsrcs_isp_4_1=
.h
 delete mode 100644 drivers/gpu/drm/amd/include/mes_api_def.h
 create mode 100644 drivers/gpu/drm/amd/include/mes_v12_api_def.h
 create mode 100644 drivers/gpu/drm/amd/include/soc24_enum.h
 create mode 100644 drivers/gpu/drm/amd/include/v12_structs.h
 delete mode 100644 drivers/gpu/drm/ci/testlist.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
 create mode 100644
drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
 create mode 100644
drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
 create mode 100644 drivers/gpu/drm/display/drm_hdmi_state_helper.c
 create mode 100644 drivers/gpu/drm/drm_fbdev_shmem.c
 rename drivers/gpu/drm/{drm_fbdev_generic.c =3D> drm_fbdev_ttm.c} (76%)
 create mode 100644 drivers/gpu/drm/i915/display/i9xx_plane_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_alpm.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_alpm.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_cursor_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_encoder.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_encoder.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_pipe_crc_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_tdf.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_vrr_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_ddc.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_ddc.h
 delete mode 100644 drivers/gpu/drm/mgag200/mgag200_i2c.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_vga.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a2xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a3xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a4xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a5xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a6xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx83102.c
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
 create mode 100644 drivers/gpu/drm/panel/panel-lincolntech-lcd197.c
 create mode 100644 drivers/gpu/drm/stm/lvds.c
 create mode 100644 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
 create mode 100644 drivers/gpu/drm/tests/drm_kunit_edid.h
 create mode 100644 drivers/gpu/drm/ttm/tests/TODO
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
 create mode 100644 drivers/gpu/drm/udl/udl_edid.c
 create mode 100644 drivers/gpu/drm/udl/udl_edid.h
 create mode 100644 drivers/gpu/drm/v3d/v3d_performance_counters.h
 create mode 100644
drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_types.h
 rename drivers/gpu/drm/xe/compat-i915-headers/{ =3D>
gem}/i915_gem_stolen.h (100%)
 rename drivers/gpu/drm/xe/compat-i915-headers/{ =3D> gt}/intel_gt_types.h =
(100%)
 delete mode 100644 drivers/gpu/drm/xe/display/intel_fbdev_fb.h
 create mode 100644 drivers/gpu/drm/xe/display/xe_tdf.c
 rename drivers/gpu/drm/xe/{regs =3D> instructions}/xe_gpu_commands.h (100%=
)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_bars.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h
 create mode 100644 drivers/gpu/drm/xe/tests/xe_args_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c
 create mode 100644 drivers/gpu/drm/xe/xe_args.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_service_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
 rename drivers/gpu/drm/xe/{xe_gt_throttle_sysfs.c =3D> xe_gt_throttle.c} (=
83%)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle.h
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa.c
 create mode 100644 drivers/gpu/drm/xe/xe_oa.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_observation.c
 create mode 100644 drivers/gpu/drm/xe/xe_observation.h
 create mode 100644 drivers/gpu/drm/xe/xe_pci_sriov.c
 create mode 100644 drivers/gpu/drm/xe/xe_pci_sriov.h
 create mode 100644 drivers/gpu/drm/xe/xe_trace_bo.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_bo.h
 create mode 100644 drivers/gpu/drm/xe/xe_trace_guc.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_guc.h
 create mode 100644 drivers/gpu/drm/xe/xe_vram.c
 create mode 100644 drivers/gpu/drm/xe/xe_vram.h
 create mode 100644 include/drm/display/drm_hdmi_state_helper.h
 delete mode 100644 include/drm/drm_fbdev_generic.h
 create mode 100644 include/drm/drm_fbdev_shmem.h
 create mode 100644 include/drm/drm_fbdev_ttm.h
 delete mode 100644 include/drm/i915_pciids.h
 rename include/drm/{ =3D> intel}/i915_component.h (100%)
 rename include/drm/{ =3D> intel}/i915_drm.h (100%)
 rename include/drm/{ =3D> intel}/i915_gsc_proxy_mei_interface.h (100%)
 rename include/drm/{ =3D> intel}/i915_hdcp_interface.h (100%)
 create mode 100644 include/drm/intel/i915_pciids.h
 rename include/drm/{ =3D> intel}/i915_pxp_tee_interface.h (100%)
 rename include/drm/{ =3D> intel}/intel-gtt.h (100%)
 rename include/drm/{ =3D> intel}/intel_lpe_audio.h (100%)
 rename include/drm/{ =3D> intel}/xe_pciids.h (96%)
