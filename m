Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A30997C537
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 09:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4B810E692;
	Thu, 19 Sep 2024 07:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KBaR2cjA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36EF810E692
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 07:48:30 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a8d0d82e76aso65598766b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 00:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726732108; x=1727336908; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aEWGLJXCkX1Ji/qs9l1pYmea7flO8y8/Nr1u3m4cbMk=;
 b=KBaR2cjAt5LXsS+NrNicD7YwZ5mPIiXCCDFP2PTSyugX1HrSYdvL8X+UQlBYXlCMla
 gR3hBmWUsvCucdMCCIQqrDbRttX8B4Y1Dm8H8RPDDBFdwkFlWa/jHgEJ/7B2V6vSzR4Q
 0+0Q5ppaSIqQP0Vgm+b+34hcnlCr1Uik0M4EozBcTqU9njticd3zDz38PZ1ciAkWa80z
 UnzjTEc2skbN2guaBpPhTO4NgN1qI7grQhs7TlkzZjRUEpPu4yodhKV6n4i0YftQTPrz
 6t70gdm8nIqHOD9bPwAvaEJCxzqkdBHvzYMGbCeT2AEmqlFI0bfvNZFtXE8T3N6+yVv5
 cYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726732108; x=1727336908;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aEWGLJXCkX1Ji/qs9l1pYmea7flO8y8/Nr1u3m4cbMk=;
 b=Shv9tpV/IWE4xA3BxAcOGlAZrm015UrG12fIe4nKWcuTf/PySISKYS52mEOVHn8m9P
 tbSfH17CWU/N+xlBZJcKKgfd4H+HlEs9CPwClwUJAEbV8vNc1V96TInOv0DhCZdKqTqW
 wT/7tw2RC13tSeLWXCNwOkqLb1jXTa4Z8F93jJUu1YBkZZr0hriVS1+VHUq1eanyG4Qg
 CstITqpTXDHs8BpAXxTEAK2cb6qAT+xCYolBXL5aDJ3Yu+YP85uLppj1J+1cOfuk0lVd
 XhCOyaEa5yB80KX1q1OAe4wtiRjgL+1M2JNBxgnq5xJW6fnA/nIiW0JmrZt+B0E1Ul0O
 fuvg==
X-Gm-Message-State: AOJu0YxP8UkdhAr+UFFec8W7KMu5D3DRSC0yb5LBrWdHDAM7UMvSdEp+
 emH//ahFQMJODPQjAEvfvjOz0fKHXMoCN2ssuslmF1MOeCrzL+zXXNocipbIyf/0oD/3mx2gUjw
 WfCy+LIfplIvK65m2eAnwZoX70cG17irAKyk=
X-Google-Smtp-Source: AGHT+IExfUrGjNhvy3H+Bdbtxd/O0pkKnlQau8k4/Yf3MDk8dA7Bqm92re4kBMvSgyilYFT3HZ2ffQ/mVH5T/H/WhgQ=
X-Received: by 2002:a17:907:e9f:b0:a86:9e84:dddc with SMTP id
 a640c23a62f3a-a902969088amr2798016266b.61.1726732107364; Thu, 19 Sep 2024
 00:48:27 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 19 Sep 2024 17:48:14 +1000
Message-ID: <CAPM=9txujwc-GoV6qB1DpKjbDi-8uDcJLnJFSY4OBgPu=ZAVBw@mail.gmail.com>
Subject: [git pull] drm for 6.12-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
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

Hi Linus,

This is the main drm pull request for 6.12-rc1.

There are some minor conflicts with your tree but none seemed too
difficult to solve, let me know if there is any problems on your end.

This adds a couple of patches outside the drm core, all should be
acked appropriately, the string and pstore ones are the main ones that
come to mind.

Otherwise it's the usual drivers, xe is getting enabled by default on
some new hardware, we've changed the device number handling to allow
more devices, and we added some optional rust code to create QR codes
in the panic handler, an idea first suggested I think 10 years ago :-)

Fuller summary below,
Thanks,
Dave.

drm-next-2024-09-19:
drm next for 6.12-rc1

string:
- add mem_is_zero()

core:
- support more device numbers
- use XArray for minor ids
- add backlight constants
- Split dma fence array creation into alloc and arm

fbdev:
- remove usage of old fbdev hooks

kms:
- Add might_fault() to drm_modeset_lock priming
- Add dynamic per-crtc vblank configuration support

dma-buf:
- docs cleanup

buddy:
- Add start address support for trim function

printk:
- pass description to kmsg_dump

scheduler;
- Remove full_recover from drm_sched_start

ttm:
- Make LRU walk restartable after dropping locks
- Allow direct reclaim to allocate local memory

panic:
- add display QR code (in rust)

displayport:
- mst: GUID improvements

bridge:
- Silence error message on -EPROBE_DEFER
- analogix: Clean aup
- bridge-connector: Fix double free
- lt6505: Disable interrupt when powered off
- tc358767: Make default DP port preemphasis configurable
- lt9611uxc: require DRM_BRIDGE_ATTACH_NO_CONNECTOR
- anx7625: simplify OF array handling
- dw-hdmi: simplify clock handling
- lontium-lt8912b: fix mode validation
- nwl-dsi: fix mode vsync/hsync polarity

xe:
- Enable LunarLake and Battlemage support
- Introducing Xe2 ccs modifiers for integrated and discrete graphics
- rename xe perf to xe observation
- use wb caching on DGFX for system memory
- add fence timeouts
- Lunar Lake graphics/media/display workarounds
- Battlemage workarounds
- Battlemage GSC support
- GSC and HuC fw updates for LL/BM
- use dma_fence_chain_free
- refactor hw engine lookup and mmio access
- enable priority mem read for Xe2
- Add first GuC BMG fw
- fix dma-resv lock
- Fix DGFX display suspend/resume
- Use xe_managed for kernel BOs
- Use reserved copy engine for user binds on faulting devices
- Allow mixing dma-fence jobs and long-running faulting jobs
- fix media TLB invalidation
- fix rpm in TTM swapout path
- track resources and VF state by PF

i915:
- Type-C programming fix for MTL+
- FBC cleanup
- Calc vblank delay more accurately
- On DP MST, Enable LT fallback for UHBR<->non-UHBR rates
- Fix DP LTTPR detection
- limit relocations to INT_MAX
- fix long hangs in buddy allocator on DG2/A380

amdgpu:
- Per-queue reset support
- SDMA devcoredump support
- DCN 4.0.1 updates
- GFX12/VCN4/JPEG4 updates
- Convert vbios embedded EDID to drm_edid
- GFX9.3/9.4 devcoredump support
- process isolation framework for GFX 9.4.3/4
- take IOMMU mappings into account for P2P DMA

amdkfd:
- CRIU fixes
- HMM fix
- Enable process isolation support for GFX 9.4.3/4
- Allow users to target recommended SDMA engines
- KFD support for targetting queues on recommended SDMA engines

radeon:
- remove .load and drm_dev_alloc
- Fix vbios embedded EDID size handling
- Convert vbios embedded EDID to drm_edid
- Use GEM references instead of TTM
- r100 cp init cleanup
- Fix potential overflows in evergreen CS offset tracking

msm:
- DPU:
- implement DP/PHY mapping on SC8180X
- Enable writeback on SM8150, SC8180X, SM6125, SM6350
- DP:
- Enable widebus on all relevant chipsets
- MSM8998 HDMI support
- GPU:
- A642L speedbin support
- A615/A306/A621 support
- A7xx devcoredump support

ast:
- astdp: Support AST2600 with VGA
- Clean up HPD
- Fix timeout loop for DP link training
- reorganize output code by type (VGA, DP, etc)
- convert to struct drm_edid
- fix BMC handling for all outputs

exynos:
- drop stale MAINTAINERS pattern
- constify struct

loongson:
- use GEM refcount over TTM

mgag200:
- Improve BMC handling
- Support VBLANK intterupts
- transparently support BMC outputs

nouveau:
- Refactor and clean up internals
- Use GEM refcount over TTM's

gm12u320:
- convert to struct drm_edid

gma500:
- update i2c terms

lcdif:
- pixel clock fix

host1x:
- fix syncpoint IRQ during resume
- use iommu_paging_domain_alloc()

imx:
- ipuv3: convert to struct drm_edid

omapdrm:
- improve error handling
- use common helper for_each_endpoint_of_node()

panel:
- add support for BOE TV101WUM-LL2 plus DT bindings
- novatek-nt35950: improve error handling
- nv3051d: improve error handling
- panel-edp: add support for BOE NE140WUM-N6G; revert support for
  SDC ATNA45AF01
- visionox-vtdr6130: improve error handling; use
  devm_regulator_bulk_get_const()
- boe-th101mb31ig002: Support for starry-er88577 MIPI-DSI panel plus
  DT; Fix porch parameter
- edp: Support AOU B116XTN02.3, AUO B116XAN06.1, AOU B116XAT04.1,
  BOE NV140WUM-N41, BOE NV133WUM-N63, BOE NV116WHM-A4D, CMN N116BCA-EA2,
  CMN N116BCP-EA2, CSW MNB601LS1-4
- himax-hx8394: Support Microchip AC40T08A MIPI Display panel plus DT
- ilitek-ili9806e: Support Densitron DMT028VGHMCMI-1D TFT plus DT
- jd9365da: Support Melfas lmfbx101117480 MIPI-DSI panel plus DT; Refactor
  for code sharing
- panel-edp: fix name for HKC MB116AN01
- jd9365da: fix "exit sleep" commands
- jdi-fhd-r63452: simplify error handling with DSI multi-style
  helpers
- mantix-mlaf057we51: simplify error handling with DSI multi-style
  helpers
- simple:
  support Innolux G070ACE-LH3 plus DT bindings
  support On Tat Industrial Company KD50G21-40NT-A1 plus DT bindings
- st7701:
  decouple DSI and DRM code
  add SPI support
  support Anbernic RG28XX plus DT bindings

mediatek:
- support alpha blending
- remove cl in struct cmdq_pkt
- ovl adaptor fix
- add power domain binding for mediatek DPI controller

renesas:
- rz-du: add support for RZ/G2UL plus DT bindings

rockchip:
- Improve DP sink-capability reporting
- dw_hdmi: Support 4k@60Hz
- vop: Support RGB display on Rockchip RK3066; Support 4096px width

sti:
- convert to struct drm_edid

stm:
- Avoid UAF wih managed plane and CRTC helpers
- Fix module owner
- Fix error handling in probe
- Depend on COMMON_CLK
- ltdc: Fix transparency after disabling plane; Remove unused interrupt

tegra:
- gr3d: improve PM domain handling
- convert to struct drm_edid
- Call drm_atomic_helper_shutdown()

vc4:
- fix PM during detect
- replace DRM_ERROR() with drm_error()
- v3d: simplify clock retrieval

v3d:
- Clean up perfmon

virtio:
- add DRM capset
The following changes since commit da3ea35007d0af457a0afc87e84fddaebc4e0b63=
:

  Linux 6.11-rc7 (2024-09-08 14:50:28 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2024-09-19

for you to fetch changes up to ae2c6d8b3b88c176dff92028941a4023f1b4cb91:

  Merge tag 'drm-xe-next-fixes-2024-09-12' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2024-09-17
14:53:34 +1000)

----------------------------------------------------------------
drm next for 6.12-rc1

string:
- add mem_is_zero()

core:
- support more device numbers
- use XArray for minor ids
- add backlight constants
- Split dma fence array creation into alloc and arm

fbdev:
- remove usage of old fbdev hooks

kms:
- Add might_fault() to drm_modeset_lock priming
- Add dynamic per-crtc vblank configuration support

dma-buf:
- docs cleanup

buddy:
- Add start address support for trim function

printk:
- pass description to kmsg_dump

scheduler;
- Remove full_recover from drm_sched_start

ttm:
- Make LRU walk restartable after dropping locks
- Allow direct reclaim to allocate local memory

panic:
- add display QR code (in rust)

displayport:
- mst: GUID improvements

bridge:
- Silence error message on -EPROBE_DEFER
- analogix: Clean aup
- bridge-connector: Fix double free
- lt6505: Disable interrupt when powered off
- tc358767: Make default DP port preemphasis configurable
- lt9611uxc: require DRM_BRIDGE_ATTACH_NO_CONNECTOR
- anx7625: simplify OF array handling
- dw-hdmi: simplify clock handling
- lontium-lt8912b: fix mode validation
- nwl-dsi: fix mode vsync/hsync polarity

xe:
- Enable LunarLake and Battlemage support
- Introducing Xe2 ccs modifiers for integrated and discrete graphics
- rename xe perf to xe observation
- use wb caching on DGFX for system memory
- add fence timeouts
- Lunar Lake graphics/media/display workarounds
- Battlemage workarounds
- Battlemage GSC support
- GSC and HuC fw updates for LL/BM
- use dma_fence_chain_free
- refactor hw engine lookup and mmio access
- enable priority mem read for Xe2
- Add first GuC BMG fw
- fix dma-resv lock
- Fix DGFX display suspend/resume
- Use xe_managed for kernel BOs
- Use reserved copy engine for user binds on faulting devices
- Allow mixing dma-fence jobs and long-running faulting jobs
- fix media TLB invalidation
- fix rpm in TTM swapout path
- track resources and VF state by PF

i915:
- Type-C programming fix for MTL+
- FBC cleanup
- Calc vblank delay more accurately
- On DP MST, Enable LT fallback for UHBR<->non-UHBR rates
- Fix DP LTTPR detection
- limit relocations to INT_MAX
- fix long hangs in buddy allocator on DG2/A380

amdgpu:
- Per-queue reset support
- SDMA devcoredump support
- DCN 4.0.1 updates
- GFX12/VCN4/JPEG4 updates
- Convert vbios embedded EDID to drm_edid
- GFX9.3/9.4 devcoredump support
- process isolation framework for GFX 9.4.3/4
- take IOMMU mappings into account for P2P DMA

amdkfd:
- CRIU fixes
- HMM fix
- Enable process isolation support for GFX 9.4.3/4
- Allow users to target recommended SDMA engines
- KFD support for targetting queues on recommended SDMA engines

radeon:
- remove .load and drm_dev_alloc
- Fix vbios embedded EDID size handling
- Convert vbios embedded EDID to drm_edid
- Use GEM references instead of TTM
- r100 cp init cleanup
- Fix potential overflows in evergreen CS offset tracking

msm:
- DPU:
- implement DP/PHY mapping on SC8180X
- Enable writeback on SM8150, SC8180X, SM6125, SM6350
- DP:
- Enable widebus on all relevant chipsets
- MSM8998 HDMI support
- GPU:
- A642L speedbin support
- A615/A306/A621 support
- A7xx devcoredump support

ast:
- astdp: Support AST2600 with VGA
- Clean up HPD
- Fix timeout loop for DP link training
- reorganize output code by type (VGA, DP, etc)
- convert to struct drm_edid
- fix BMC handling for all outputs

exynos:
- drop stale MAINTAINERS pattern
- constify struct

loongson:
- use GEM refcount over TTM

mgag200:
- Improve BMC handling
- Support VBLANK intterupts
- transparently support BMC outputs

nouveau:
- Refactor and clean up internals
- Use GEM refcount over TTM's

gm12u320:
- convert to struct drm_edid

gma500:
- update i2c terms

lcdif:
- pixel clock fix

host1x:
- fix syncpoint IRQ during resume
- use iommu_paging_domain_alloc()

imx:
- ipuv3: convert to struct drm_edid

omapdrm:
- improve error handling
- use common helper for_each_endpoint_of_node()

panel:
- add support for BOE TV101WUM-LL2 plus DT bindings
- novatek-nt35950: improve error handling
- nv3051d: improve error handling
- panel-edp: add support for BOE NE140WUM-N6G; revert support for
  SDC ATNA45AF01
- visionox-vtdr6130: improve error handling; use
  devm_regulator_bulk_get_const()
- boe-th101mb31ig002: Support for starry-er88577 MIPI-DSI panel plus
  DT; Fix porch parameter
- edp: Support AOU B116XTN02.3, AUO B116XAN06.1, AOU B116XAT04.1,
  BOE NV140WUM-N41, BOE NV133WUM-N63, BOE NV116WHM-A4D, CMN N116BCA-EA2,
  CMN N116BCP-EA2, CSW MNB601LS1-4
- himax-hx8394: Support Microchip AC40T08A MIPI Display panel plus DT
- ilitek-ili9806e: Support Densitron DMT028VGHMCMI-1D TFT plus DT
- jd9365da: Support Melfas lmfbx101117480 MIPI-DSI panel plus DT; Refactor
  for code sharing
- panel-edp: fix name for HKC MB116AN01
- jd9365da: fix "exit sleep" commands
- jdi-fhd-r63452: simplify error handling with DSI multi-style
  helpers
- mantix-mlaf057we51: simplify error handling with DSI multi-style
  helpers
- simple:
  support Innolux G070ACE-LH3 plus DT bindings
  support On Tat Industrial Company KD50G21-40NT-A1 plus DT bindings
- st7701:
  decouple DSI and DRM code
  add SPI support
  support Anbernic RG28XX plus DT bindings

mediatek:
- support alpha blending
- remove cl in struct cmdq_pkt
- ovl adaptor fix
- add power domain binding for mediatek DPI controller

renesas:
- rz-du: add support for RZ/G2UL plus DT bindings

rockchip:
- Improve DP sink-capability reporting
- dw_hdmi: Support 4k@60Hz
- vop: Support RGB display on Rockchip RK3066; Support 4096px width

sti:
- convert to struct drm_edid

stm:
- Avoid UAF wih managed plane and CRTC helpers
- Fix module owner
- Fix error handling in probe
- Depend on COMMON_CLK
- ltdc: Fix transparency after disabling plane; Remove unused interrupt

tegra:
- gr3d: improve PM domain handling
- convert to struct drm_edid
- Call drm_atomic_helper_shutdown()

vc4:
- fix PM during detect
- replace DRM_ERROR() with drm_error()
- v3d: simplify clock retrieval

v3d:
- Clean up perfmon

virtio:
- add DRM capset

----------------------------------------------------------------
Abel Vesa (1):
      drm/panel-edp: add BOE NE140WUM-N6G panel entry

Abhinav Kumar (1):
      drm/msm/dp: enable widebus on all relevant chipsets

Abhishek Tamboli (2):
      drm/panel: ili9341: Add comments for registers in ili9341_config()
      drm/panel: nv3051d: Transition to mipi_dsi_dcs_write_seq_multi

Ahmed, Muhammad (1):
      drm/amd/display: guard write a 0 post_divider value to HW

Akshata Jahagirdar (8):
      drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
      drm/xe/migrate: Add kunit to test clear functionality
      drm/xe/migrate: Add helper function to program identity map
      drm/xe/xe2: Introduce identity map for compressed pat for vram
      drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
      drm/xe/migrate: Add kunit to test migration functionality for BMG
      drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx
      drm/xe/xe2: Introduce performance changes

Al Viro (4):
      drm: new helper: drm_gem_prime_handle_to_dmabuf()
      drm/amdgpu: fix a race in kfd_mem_export_dmabuf()
      drm/amdkfd: CRIU fixes
      drm/amdgpu: get rid of bogus includes of fdtable.h

Aleksandr Mishin (1):
      drm/msm: Fix incorrect file name output in adreno_request_fw()

Alex Bee (1):
      drm/rockchip: vop: Allow 4096px width scaling

Alex Deucher (73):
      drm/amdgpu/sdma5.2: Update wptr registers as well as doorbell
      drm/amdgpu/gfx7: enable wave kill for compute queues
      drm/amdgpu/gfx8: enable wave kill for compute queues
      drm/amdgpu/gfx9: enable wave kill for compute queues
      drm/amdgpu/gfx9.4.3: implement wave kill for compute queues
      drm/amdgpu/gfx10: enable wave kill for compute queues
      drm/amdgpu/gfx11: enable wave kill for compute queues
      drm/amdgpu/gfx12: enable wave kill for compute queues
      drm/amdgpu/gfx10: properly handle error ints on all pipes
      drm/amdgpu/gfx11: properly handle error ints on all pipes
      drm/amdgpu/gfx12: properly handle error ints on all pipes
      drm/amdgpu/gfx9: properly handle error ints on all pipes
      drm/amdgpu/gfx: add bad opcode interrupt
      drm/amdgpu/gfx9: Enable bad opcode interrupt
      drm/amdgpu/gfx9.4.3: Enable bad opcode interrupt
      drm/amdgpu: properly handle vbios fake edid sizing
      drm/radeon: properly handle vbios fake edid sizing
      drm/amdgpu: Fix APU handling in amdgpu_pm_load_smu_firmware()
      drm/amdgpu/jpeg2: properly set atomics vmid field
      drm/amdgpu/jpeg4: properly set atomics vmid field
      drm/amdgpu/mes: add API for legacy queue reset
      drm/amdgpu/mes11: add API for legacy queue reset
      drm/amdgpu/mes12: add API for legacy queue reset
      drm/amdgpu: add new ring reset callback
      drm/amdgpu: add per ring reset support (v5)
      drm/amdgpu/gfx9: add ring reset callback
      drm/amdgpu/gfx9.4.3: add ring reset callback
      drm/amdgpu/gfx9: per queue reset only on bare metal
      drm/amdgpu/gfx9: add ring reset callback for gfx
      drm/amdgpu/gfx9: use proper rlc safe mode helpers
      drm/amdgpu/gfx9.4.3: use proper rlc safe mode helpers
      drm/amdgpu/gfx9.4.3: use rlc safe mode for soft recovery
      drm/amdgpu/gfx9: use rlc safe mode for soft recovery
      drm/amdgpu/gfx8: add ring reset callback for gfx
      drm/amdgpu/gfx7: add ring reset callback for gfx
      drm/amdgpu/gfx11: enter safe mode before touching CP_INT_CNTL
      drm/amdgpu/gfx11: add a mutex for the gfx semaphore
      drm/amdgpu/gfx11: export gfx_v11_0_request_gfx_index_mutex()
      drm/amdgpu/mes: add API for user queue reset
      drm/amdgpu/mes11: add API for user queue reset
      drm/amdgpu/mes12: add API for user queue reset
      drm/amdgpu/sdma5.2: limit wptr workaround to sdma 5.2.1
      drm/amdgpu: handle enforce isolation on non-0 gfxhub
      drm/amdgpu: Emit cleaner shader at end of IB submission
      drm/amdgpu: fix eGPU hotplug regression
      drm/amd/gfx11: move the gfx mutex into the caller
      drm/amdgpu/gfx12: set UNORD_DISPATCH in compute MQDs
      drm/amdgpu: align pp_power_profile_mode with kernel docs
      drm/amdgpu/swsmu: fix ordering for setting workload_mask
      drm/amdgpu/smu13.0.7: print index for profiles
      drm/amdgpu/swsmu: always force a state reprogram on init
      drm/amdgpu: add experimental resets debug flag
      drm/amdgpu/gfx9: put queue resets behind a debug option
      drm/amdgpu/gfx11: return early in preempt_ib()
      drm/amdgpu/gfx12: return early in preempt_ib()
      drm/amdgpu: always allocate cleared VRAM for GEM allocations
      drm/amdgpu/gfx11: add ring reset callbacks
      drm/amdgpu/gfx11: rename gfx_v11_0_gfx_init_queue()
      drm/amdgpu/gfx10: add ring reset callbacks
      drm/amdgpu/gfx10: rework reset sequence
      drm/amdgpu/gfx12: add ring reset callbacks
      drm/amdgpu/gfx12: fallback to driver reset compute queue directly
      drm/amdgpu/gfx10: per queue reset only on bare metal
      drm/amdgpu/gfx11: per queue reset only on bare metal
      drm/amdgpu/gfx12: per queue reset only on bare metal
      drm/amdgpu/gfx10: use proper rlc safe mode helpers
      drm/amdgpu/gfx11: use proper rlc safe mode helpers
      drm/amdgpu/gfx12: use proper rlc safe mode helpers
      drm/amdgpu/gfx12: use rlc safe mode for soft recovery
      drm/amdgpu/gfx11: use rlc safe mode for soft recovery
      drm/amdgpu/gfx10: use rlc safe mode for soft recovery
      Revert "drm/amdgpu: align pp_power_profile_mode with kernel docs"
      drm/amdgpu/atomfirmware: Silence UBSAN warning

Alex Hung (21):
      drm/amd/display: Revert "Check HDCP returned status"
      drm/amd/display: Initialize denominators' default to 1
      drm/amd/display: Check null-initialized variables
      drm/amd/display: Check phantom_stream before it is used
      drm/amd/display: Pass non-null to dcn20_validate_apply_pipe_split_fla=
gs
      drm/amd/display: Check null pointers before using them
      drm/amd/display: Check stream before comparing them
      drm/amd/display: Check link_res->hpo_dp_link_enc before using it
      drm/amd/display: Check null pointers before used
      drm/amd/display: Check null pointers before multiple uses
      drm/amd/display: Increase array size of dummy_boolean
      drm/amd/display: Add MST debug message when link detection fails
      drm/amd/display: Check link_res->hpo_dp_link_enc before using it
      drm/amd/display: Fix possible overflow in integer multiplication
      drm/amd/display: Check null pointers before using them
      drm/amd/display: Check stream_status before it is used
      drm/amd/display: Avoid overflow assignment in link_dp_cts
      drm/amd/display: Check null values from functions
      drm/amd/display: Initialize get_bytes_per_element's default to 1
      drm/amd/display: Check UnboundedRequestEnabled's value
      drm/amd/display: Check null pointers before using dc->clk_mgr

Alexander F. Lent (1):
      accel/ivpu: Add missing MODULE_FIRMWARE metadata

Alexander Stein (1):
      drm/bridge: Silence error messages upon probe deferral

Alexander Usyskin (1):
      drm/xe/gsc: add Battlemage support

Alvin Lee (9):
      drm/amd/display: Disable HBR audio for DP2 for certain ASICs
      drm/amd/display: Don't consider cursor for no plane case in DML1
      drm/amd/display: When resync fifo ensure to use correct pipe ctx
      drm/amd/display: Disable subvp based on HW cursor requirement
      drm/amd/display: Calculate ODM width using odm slice rect, not recout
      drm/amd/display: Add option to disable unbounded req in DML21
      drm/amd/display: For FAMS2 don't program P-State force from driver
      drm/amd/display: Don't skip clock updates in overclocking
      drm/amd/display: Wait for all pending cleared before full update

Amber Lin (2):
      drm/amdkfd: APIs to stop/start KFD scheduling
      drm/amdkfd: Enable processes isolation on gfx9

Andi Shyti (8):
      drm/i915/gem: Adjust vma offset for framebuffer mmap offset
      drm/i915/gem: Fix Virtual Memory mapping boundaries calculation
      drm/i915/gem: Improve pfn calculation readability in vm_fault_gtt()
      drm/i915: Replace double blank with single blank after comma in
gem/ and gt/
      drm/i915: Replace double blank with single blank after comma
      drm/i915/gem: Do not look for the exact address in node
      drm/i915/gem: Calculate object page offset for partial memory mapping
      drm/i915/gt: Continue creating engine sysfs files even after a failur=
e

Andy Shevchenko (3):
      drm: fixed: Don't use "proxy" headers
      drm/i915/fence: Mark debug_fence_init_onstack() with __maybe_unused
      drm/i915/fence: Mark debug_fence_free() with __maybe_unused

AngeloGioacchino Del Regno (1):
      drm/mediatek: Declare Z Position for all planes

Apoorva Singh (1):
      drm/xe: Remove NULL check of lrc->bo in xe_lrc_snapshot_capture()

Aric Cyr (6):
      drm/amd/display: 3.2.292
      drm/amd/display: 3.2.293
      drm/amd/display: 3.2.294
      drm/amd/display: 3.2.295
      drm/amd/display: 3.2.298
      drm/amd/display: 3.2.299

Arnaud Vrac (1):
      drm/msm: add msm8998 hdmi phy/pll support

Arnd Bergmann (3):
      drm/stm: add COMMON_CLK dependency
      drm/amd: Use a constant format string for amdgpu_ucode_request
      drm/xe: fix build warning with CONFIG_PM=3Dn

Arunpravin Paneer Selvam (3):
      drm/buddy: Add start address support to trim function
      drm/amdgpu: Add address alignment support to DCC buffers
      drm/amdgpu: Add DCC GFX12 flag to enable address alignment

Ashutosh Dixit (3):
      drm/xe/uapi: Rename xe perf layer as xe observation layer
      drm/xe/exec: Fix minor bug related to xe_sync_entry_cleanup
      drm/xe/observation: Drop empty sysctl table entry

Aurabindo Pillai (8):
      drm/amd/display: free bo used for dmub bounding box
      drm/amd/display: rename dcn3/dcn4 to more sound terms
      drm/amd/display: rename dcn401_soc to dcn4_variant_a_soc
      drm/amd/display: remove unused folder
      drm/amd/display: fix a UBSAN warning in DML2.1
      drm/amd/display: Add more logging for MALL static screen
      drm/amd/display: remove an extraneous call for checking dchub clock
      drm/amd/display: do not set traslate_by_source for DCN401 cursor

Austin Zheng (4):
      drm/amd/display: Check if Mode is Supported Before Returning Result
      drm/amd/display: Disable SubVP if Hardware Rotation is Used
      drm/amd/display: Unlock Pipes Based On DET Allocation
      drm/amd/display: DML2.1 Reintegration for Various Fixes

Balasubramani Vivekanandan (1):
      drm/xe/bmg: Drop force_probe requirement

Bas Nieuwenhuizen (1):
      drm/amdgpu: Actually check flags for all context ops.

Ben Skeggs (37):
      drm/nouveau: move nouveau_drm_device_fini() above init()
      drm/nouveau: handle pci/tegra drm_dev_{alloc, register} from common c=
ode
      drm/nouveau: replace drm_device* with nouveau_drm* as dev drvdata
      drm/nouveau: create pci device once
      drm/nouveau: store nvkm_device pointer in nouveau_drm
      drm/nouveau: move allocation of root client out of nouveau_cli_init()
      drm/nouveau: add nouveau_cli to nouveau_abi16
      drm/nouveau: handle limited nvif ioctl in abi16
      drm/nouveau: remove abi16->device
      drm/nouveau: remove abi16->handles
      drm/nouveau/nvkm: remove detect/mmio/subdev_mask from device args
      drm/nouveau/nvkm: remove perfmon
      drm/nouveau/nvkm: remove nvkm_client_search()
      drm/nouveau/nvif: remove support for userspace backends
      drm/nouveau/nvif: remove route/token
      drm/nouveau/nvif: remove nvxx_object()
      drm/nouveau/nvif: remove nvxx_client()
      drm/nouveau/nvif: remove driver keep/fini
      drm/nouveau/nvif: remove client device arg
      drm/nouveau/nvif: remove client version
      drm/nouveau/nvif: remove client devlist
      drm/nouveau/nvif: remove client fini
      drm/nouveau/nvif: remove device args
      drm/nouveau: always map device
      drm/nouveau/nvif: remove device rd/wr
      drm/nouveau/nvif: remove disp chan rd/wr
      drm/nouveau: move nvxx_* definitions to nouveau_drv.h
      drm/nouveau: add nvif_mmu to nouveau_drm
      drm/nouveau: pass drm to nouveau_mem_new(), instead of cli
      drm/nouveau: pass drm to nv50_dmac_create(), rather than device+disp
      drm/nouveau: pass cli to nouveau_channel_new() instead of drm+device
      drm/nouveau: remove nouveau_chan.device
      drm/nouveau: remove chan->drm
      drm/nouveau: remove master
      drm/nouveau: remove push pointer from nouveau_channel
      drm/nouveau/kms: remove a few unused struct members and fn decls
      drm/nouveau/kms: remove push pointer from nv50_dmac

Bhuvanachandra Pinninti (1):
      drm/amd/display: Refactor for dio

Biju Das (2):
      dt-bindings: display: renesas,rzg2l-du: Document RZ/G2UL DU bindings
      drm: renesas: rz-du: Add RZ/G2UL DU Support

Bommu Krishnaiah (1):
      drm/xe/xe2lpg: Extend workaround 14021402888

Candice Li (2):
      drm/amdgpu: Validate TA binary size
      drm/amd/pm: Drop unsupported features on smu v14_0_2

Chaitanya Dhere (1):
      drm/amd/display: DML2.1 resynchronization

Charlene Liu (3):
      drm/amd/display: restore immediate_disable_crtc for w/a
      drm/amd/display: sync dmub output event type.
      drm/amd/display: remove redundant msg to pmfw at boot/resume

Chris Park (3):
      drm/amd/display: Deallocate DML memory if allocation fails
      drm/amd/display: Add two dmmuy I2C entry for GPIO port mapping issue
      drm/amd/display: Address coverity change

Chris Wilson (1):
      drm/i915/gt: Mark the GT as dead when mmio is unreliable

Christian K=C3=B6nig (6):
      drm/scheduler: remove full_recover from drm_sched_start
      drm/amdgpu: fix contiguous handling for IB parsing v2
      drm/loongson: use GEM references instead of TTMs
      drm/radeon: use GEM references instead of TTMs
      drm/amdgpu: re-work VM syncing
      drm/amdgpu: revert "use CPU for page table update if SDMA is unavaila=
ble"

Christoph Fritz (1):
      drm/bridge: synopsys: dw-mipi-dsi: enable EoTp by default

Christophe JAILLET (3):
      drm/stm: Fix an error handling path in stm_drm_platform_probe()
      drm/rockchip: Constify struct drm_encoder_helper_funcs
      drm/exynos: Constify struct exynos_drm_ipp_funcs

Chun-Kuang Hu (2):
      drm/mediatek: Use cmdq_pkt_eoc() instead of cmdq_pkt_finalize()
      drm/mediatek: Use cmdq_pkt_create() and cmdq_pkt_destroy()

ChunTao Tso (1):
      drm/amd/display: Retry Replay residency

Claudiu Beznea (1):
      drm/stm: ltdc: check memory returned by devm_kzalloc()

Clayton Craft (1):
      drm/panel-edp: Add entry for BOE NV133WUM-N63 panel

Colin Ian King (4):
      drm/i915/dp: Make read-only array bw_gbps static const
      drm/amd/display: Fix spelling mistake "tolarance" -> "tolerance"
      drm/amd/display: remove extraneous ; after statements
      drm/amd/display: Fix spelling mistake "recompte" -> "recompute"

Cong Yang (6):
      dt-bindings: display: panel: Add compatible for melfas lmfbx101117480
      drm/panel: jd9365da: Support for Melfas lmfbx101117480 MIPI-DSI panel
      drm/panel: jd9365da: Break some CMDS into helper functions
      drm/panel: boe-tv101wum-nl6: Break some CMDS into helper functions
      drm/panel: nt35521: Break some CMDS into helper functions
      drm/panel: nt36672e: Break some CMDS into helper functions

Connor Abbott (7):
      drm/msm: Use a7xx family directly in gpu_state
      drm/msm: Dump correct dbgahb clusters on a750
      drm/msm: Fix CP_BV_DRAW_STATE_ADDR name
      drm/msm: Update a6xx register XML
      drm/msm: Expand UBWC config setting
      drm/msm: Expose expanded UBWC config uapi
      drm/msm: Fix UBWC macrotile_mode for a680

Cristian Ciocaltea (7):
      drm/bridge-connector: Fix double free in error handling paths
      drm/rockchip: Explicitly include bits header
      drm/rockchip: dw_hdmi: Use modern drm_device based logging
      drm/rockchip: dw_hdmi: Simplify clock handling
      drm/rockchip: dw_hdmi: Use devm_regulator_get_enable()
      drm/rockchip: dw_hdmi: Drop superfluous assignments of mpll_cfg,
cur_ctr and phy_config
      drm/bridge: dw-hdmi: Simplify clock handling

Cruise (2):
      drm/amd/display: Add logs for debugging outbox
      drm/amd/display: Get link index for AUX reply notification

Dafna Hirschfeld (1):
      drm/xe: fix missing 'xe_vm_put'

Dan Carpenter (2):
      drm/ast: astdp: fix loop timeout check
      drm/amdgpu/mes11: Indent an if statment

Dang Huynh (1):
      drm: panel: boe-bf060y8m-aj0: Enable prepare_prev_first

Daniel Sa (4):
      drm/amd/display: Set Cursor Matrix to bypass instead of Input Plane
      drm/amd/display: Underflow Seen on DCN401 eGPU
      drm/amd/display: Resolve Coverity Issues
      drm/amd/display: only trigger BIOS related assert for older ASICs

Daniel Yang (1):
      drm/connector: kerneldoc: Fix two missing newlines in drm_connector.c

Daniele Ceraolo Spurio (14):
      drm/xe/huc: Define HuC binary for LNL
      drm/xe/gsc: Define GSC binary for LNL
      drm/xe/huc: Define HuC binary for BMG
      drm/xe: fix WA 14018094691
      drm/xe: Make exec_queue_kill safe to call twice
      drm/xe: use devm instead of drmm for managed bo
      drm/xe/uc: Use managed bo for HuC and GSC objects
      drm/xe/uc: Use devm to register cleanup that includes exec_queues
      drm/i915: Do not attempt to load the GSC multiple times
      drm/xe/gsc: Do not attempt to load the GSC multiple times
      drm/xe/gsc: Fix FW status if the firmware is already loaded
      drm/xe/gsc: Track the platform in the compatibility version
      drm/xe/gsc: Add debugfs to print GSC info
      drm/xe/gsc: Wedge the device if the GSCCS reset fails

Danilo Krummrich (3):
      drm/nouveau: prime: fix refcount underflow
      drm/nouveau: bo: remove unused functions
      drm/nouveau: use GEM references instead of TTMs

Dave Airlie (16):
      Merge tag 'drm-xe-next-2024-07-30' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-intel-next-2024-08-13' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-misc-next-2024-08-29' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-xe-next-2024-08-28' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-intel-next-2024-08-29' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-intel-next-2024-09-03' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'mediatek-drm-next-6.12' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-next
      Merge tag 'drm-msm-next-2024-09-02' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'drm-xe-next-2024-09-05' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-intel-gt-next-2024-09-06' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'amd-drm-next-6.12-2024-09-06' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'exynos-drm-next-for-v6.12' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-next
      Merge tag 'drm-misc-next-fixes-2024-09-05' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-intel-next-fixes-2024-09-12' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'amd-drm-next-6.12-2024-09-13' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-xe-next-fixes-2024-09-12' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next

David (Ming Qiang) Wu (4):
      drm/amd/amdgpu: command submission parser for JPEG
      drm/amd/amdgpu: cleanup parse_cs callbacks
      drm/amd/amdgpu: apply command submission parser for JPEG v2+
      drm/amd/amdgpu: apply command submission parser for JPEG v1

David Belanger (2):
      drm/amdgpu: Fix atomics on GFX12
      drm/amdkfd: Add cache line size info

David Gow (2):
      drm/i915: Allow evicting to use the requested placement
      drm/i915: Attempt to get pages without eviction first

Deborah Brouwer (1):
      drm/ci: update link to Gitlab server

Dennis Chan (1):
      drm/amd/display: Add Replay Low Refresh Rate parameters in dc type.

Dillon Varone (14):
      drm/amd/display: Add blanked streams override to DML2.1
      drm/amd/display: Add P-State Keepout to dcn401 Global Sync
      drm/amd/display: Export additional FAMS2 global configuration
options from DML
      drm/amd/display: Remove hardmax usage for dcn401
      drm/amd/display: Various DML2 fixes for FAMS2
      drm/amd/display: Force enable 3DLUT DMA check for dcn401 in DML
      drm/amd/display: Add DML2.1 option to disable DRR clamped
P-State Strategies
      drm/amd/display: Reduce redundant minimal transitions due to SubVP
      drm/amd/display: Disable DCN401 UCLK P-State support on full updates
      drm/amd/display: Perform outstanding programming on full updates
      drm/amd/display: Set max VTotal cap for dcn401
      drm/amd/display: Fix MS/MP mismatches in dml21 for dcn401
      Revert "drm/amd/display: Wait for all pending cleared before full upd=
ate"
      drm/amd/display: Block timing sync for different signals in PMO

Dmitry Baryshkov (8):
      drm/bridge: lt9611uxc: properly attach to a next bridge
      drm/bridge: lt9611uxc: drop support for !DRM_BRIDGE_ATTACH_NO_CONNECT=
OR
      drm/msm/dpu: Configure DP INTF/PHY selector
      drm/msm/dsi: correct programming sequence for SM8350 / SM8450
      drm/msm/dpu: enable writeback on SM8150
      drm/msm/dpu: enable writeback on SC8108X
      drm/msm/dpu: enable writeback on SM6125
      drm/msm/dpu: enable writeback on SM6350

Dmitry Osipenko (1):
      drm/virtio: Add DRM capset definition

Dnyaneshwar Bhadane (3):
      drm/i915/display: correct dual pps handling for MTL_PCH+
      drm/i915/gt: Whitelist COMMON_SLICE_CHICKEN1 for UMD access.
      drm/i915/bios: Update new entries in VBT BDB block definitions

Dominik Grzegorzek (2):
      drm/xe: Move and export xe_hw_engine lookup.
      drm/xe: Export xe_hw_engine's mmio accessors

Douglas Anderson (2):
      drm/tegra: Call drm_atomic_helper_shutdown() at shutdown time
      drm/panel: Avoid warnings w/ panel-simple/panel-edp at shutdown

Dr. David Alan Gilbert (1):
      drm/bridge: analogix: remove unused struct 'bridge_init'

Dragan Simic (1):
      drm/rockchip: cdn-dp: Clean up a few logged messages

Duncan Ma (1):
      drm/amd/display: Add visual confirm for Idle State

Easwar Hariharan (2):
      drm/i915: Make I2C terminology more inclusive
      drm/gma500: Make I2C terminology more inclusive

Esben Haabendal (1):
      drm/bridge: nwl-dsi: Use vsync/hsync polarity from display mode

Eugene Lepshy (1):
      drm/msm/a6xx: Add A642L speedbin (0x81)

Fangzhi Zuo (6):
      drm/amd/display: Print Pcon FRL Link BW in Debug Message
      drm/amd/display: Skip Recompute DSC Params if no Stream on Link
      drm/amd/display: Fix MST BW calculation Regression
      drm/amd/display: Fix Synaptics Cascaded Panamera DSC Determination
      drm/amd/display: Add DSC Debug Log
      drm/amdgpu/display: Fix a mistake in revert commit

Fei Shao (1):
      drm/mediatek: Use spin_lock_irqsave() for CRTC event lock

Francois Dugast (11):
      drm/xe/hw_engine_group: Introduce xe_hw_engine_group
      drm/xe/guc_submit: Make suspend_wait interruptible
      'drm/xe/hw_engine_group: Register hw engine group's exec queues
      drm/xe/hw_engine_group: Add helper to suspend faulting LR jobs
      drm/xe/exec_queue: Remove duplicated code
      drm/xe/exec_queue: Prepare last fence for hw engine group resume cont=
ext
      drm/xe/hw_engine_group: Add helper to wait for dma fence jobs
      drm/xe/hw_engine_group: Ensure safe transition between execution mode=
s
      drm/xe/exec: Switch hw engine group execution mode upon job submissio=
n
      drm/xe/vm: Remove restriction that all VMs must be faulting if one is
      drm/xe/device: Remove unused xe_device::usm::num_vm_in_*

Frank Min (2):
      drm/amdgpu: change non-dcc buffer copy configuration
      drm/amdgpu: correct sdma7 max dw

Fudong Wang (1):
      drm/amd/display: skip crtc power down when ips switch

Fudongwang (1):
      drm/amd/display: add dmcub support check

Gabe Teeger (4):
      drm/amd/display: Fix DP-DVI dongle hotplug
      drm/amd/display: Fix Potential Null Dereference
      drm/amd/display: Revert Avoid overflow assignment
      drm/amd/display: fix graphics hang in multi-display mst case

Geert Uytterhoeven (2):
      drm/xe/oa/uapi: Make bit masks unsigned
      drm/radeon/r100: Handle unknown family in r100_cp_init_microcode()

Gustavo Sousa (3):
      drm/i915: Skip programming FIA link enable bits for MTL+
      drm/xe: Remove stale declaration of xe_mmio_probe_vram()
      drm/xe/mmio: Use single logic for waiting functions

Haikun Zhou (1):
      drm/panel-edp: Add CSW MNB601LS1-4

Hamza Mahfooz (8):
      MAINTAINERS: add an entry for AMD DC DML
      drm/vblank: add dynamic per-crtc vblank configuration support
      Revert "drm: Introduce 'power saving policy' drm property"
      Revert "drm/amd: Add power_saving_policy drm property to eDP connecto=
rs"
      drm/amd/display: fix s2idle entry for DCN3.5+
      drm/amd/display: use new vblank enable policy for DCN35+
      drm/amd/display: use a more lax vblank enable policy for DCN35+
      drm/amd/display: use a more lax vblank enable policy for older ASICs

Hans de Goede (1):
      drm/i915/dsi: Make Lenovo Yoga Tab 3 X90F DMI match less strict

Hansen Dsouza (11):
      drm/amd/display: Add private data type for RCG
      drm/amd/display: Add RCG helper functions
      drm/amd/display: Add source select helper functions
      drm/amd/display: Add new enable and disable functions
      drm/amd/display: Add new enable and disable functions for DCN35
      drm/amd/display: Add stream and char control callback
      drm/amd/display: Add clock control callbacks
      drm/amd/display: Add clock control callbacks
      drm/amd/display: Update to using new dccg callbacks
      Revert "drm/amd/display: Update to using new dccg callbacks"
      drm/amd/display: Fix flickering caused by dccg

Hawking Zhang (5):
      drm/amdgpu: Add more types for boot time error reporting
      drm/amdkfd: Check int source id for utcl2 poison event
      drm/amdkfd: Drop poison hanlding from gfx v10
      drm/amdgpu: Retire query_utcl2_poison_status callback
      drm/amdkfd: Select reset method for poison handling

Himal Prasad Ghimiray (6):
      drm/xe: Delete unused register from xe_regs.h
      drm/xe: Remove unused xe parameter
      drm/xe: Remove extra dma_fence_put on xe_sync_entry_add_deps failure
      drm/xe: Remove unrequired NULL checks in xe_sync_entry_cleanup
      drm/xe: Remove unrequired NULL check in xe_sched_job_free_fences
      drm/xe: Fix NPD in ggtt_node_remove()

Hironori KIKUCHI (5):
      drm/panel: st7701: Rename macros
      drm/panel: st7701: Decouple DSI and DRM parts
      dt-bindings: display: st7701: Add Anbernic RG28XX panel
      drm/panel: st7701: Add support for SPI for configuration
      drm/panel: st7701: Add Anbernic RG28XX panel support

Hongbo Li (1):
      drm/i915: Remove extra unlikely helper

Hsiao Chien Sung (5):
      drm/mediatek: Support "None" blending in OVL
      drm/mediatek: Support "None" blending in Mixer
      drm/mediatek: Support "Pre-multiplied" blending in OVL
      drm/mediatek: Support "Pre-multiplied" blending in Mixer
      drm/mediatek: Support alpha blending in display driver

Hsin-Yi Wang (1):
      drm/panel-edp: Add BOE NV140WUM-N41

Ilia Levi (1):
      drm/xe: move the kernel lrc from hwe to execlist port

Ilya Bakoulin (3):
      drm/amd/display: Add helper function to check for non-address fast up=
dates
      drm/amd/display: Use correct cm_helper function
      drm/amd/display: Fix construct_phy with MXM connector

Imre Deak (32):
      drm/dp: Add helper to dump an LTTPR PHY descriptor
      drm/i915/dp: Reset intel_dp->link_trained before retraining the link
      drm/i915/dp: Don't switch the LTTPR mode on an active link
      drm/i915/dp: Reset cached LTTPR count if number of LTTPRs is unsuppor=
ted
      drm/i915/dp: Keep cached LTTPR mode up-to-date
      drm/i915/dp: Retrain SST links via a modeset commit
      drm/i915/dp: Require a valid atomic state for SST link training
      drm/i915/dp: Don't WARN on failed link-retrain modeset
      drm/dp_mst: Factor out function to queue a topology probe work
      drm/dp_mst: Add a helper to queue a topology probe
      drm/dp_mst: Simplify the condition when to enumerate path resources
      drm/i915/ddi: For an active output call the DP encoder
sync_state() only for DP
      drm/i915/dp: Initialize the link parameters during HW readout
      drm/i915/dp: Send only a single modeset-retry uevent for a commit
      drm/i915/dp: Add a separate function to reduce the link parameters
      drm/i915/dp: Add helpers to set link training mode, BW parameters
      drm/i915/dp_mst: Reduce the link parameters in BW order after LT fail=
ures
      drm/i915/dp_mst: Configure MST after the link parameters are reset
      drm/i915/dp_mst: Queue modeset-retry after a failed payload BW alloca=
tion
      drm/i915/dp_mst: Reprobe the MST topology after a link parameter chan=
ge
      drm/i915/dp_mst: Ensure link parameters are up-to-date for a disabled=
 link
      drm/i915/dp_mst: Enable LT fallback between UHBR/non-UHBR link rates
      drm/i915: Replace to_bpp_x16() with fxp_q4_from_int()
      drm/i915: Replace to_bpp_int() with fxp_q4_to_int()
      drm/i915: Replace to_bpp_int_roundup() with fxp_q4_to_int_roundup()
      drm/i915: Replace to_bpp_frac() with fxp_q4_to_frac()
      drm/i915: Replace BPP_X16_FMT()/ARGS() with FXP_Q4_FMT()/ARGS()
      drm/i915: Dump DSC state to dmesg and debugfs/i915_display_info
      drm/i915: Remove DSC register dump
      drm/xe: Suspend/resume user access only during system s/r
      drm/xe: Handle polling only for system s/r in
xe_display_pm_suspend/resume()
      drm/i915/dp_mst: Fix MST state after a sink reset

Jack Xiao (10):
      drm/amdgpu/mes: fix mes ring buffer overflow
      drm/amdgpu/mes12: update mes_v12_api_def.h
      drm/amdgpu/mes: add multiple mes ring instances support
      drm/amdgpu/mes12: load unified mes fw on pipe0 and pipe1
      drm/amdgpu/mes12: add mes pipe switch support
      drm/amdgpu/mes12: adjust mes12 sw/hw init for multiple pipes
      drm/amdgpu/mes12: configure two pipes hardware resources
      drm/amdgpu/mes12: sw/hw fini for unified mes
      drm/amdgpu/mes12: fix suspend issue
      drm/amdgpu/mes: add mes mapping legacy queue switch

Jane Jian (1):
      drm/amdgpu/vcn: Use offsets local to VCN/JPEG in VF

Jani Nikula (82):
      drm/nouveau: remove unused variable ret
      drm/i915/bios: remove stale and useless comments
      drm/i915: remove unused HAS_BROKEN_CS_TLB()
      Merge drm/drm-next into drm-intel-next
      drm/i915: remove a few __i915_printk() uses
      drm/i915: remove i915_report_error()
      drm/i915: remove __i915_printk()
      drm/i915/acpi: convert to struct intel_display
      drm/i915/opregion: unify intel_encoder/intel_connector naming
      drm/i915/opregion: convert to struct intel_display
      drm/i915/bios: convert to struct intel_display
      drm/i915: use pdev_to_i915() instead of pci_get_drvdata() directly
      drm/xe/tests: remove unused leftover xe_call_for_each_device()
      drm/xe: use pdev_to_xe_device() instead of pci_get_drvdata() directly
      drm/xe: add kdev_to_xe_device() helper and use it
      drm/edid: reduce DisplayID log spamming
      drm/rockchip: cdn-dp: get rid of drm_edid_raw()
      drm/i915/gvt: stop using drm_edid_block_valid()
      drm/edid: make drm_edid_block_valid() static
      drm/i915: make __intel_display_power_is_enabled() static
      drm/i915/display: support struct intel_atomic_state in to_intel_displ=
ay()
      drm/i915/display: convert intel_link_bw.c to struct intel_display
      drm/i915/display: convert intel_load_detect.c to struct intel_display
      drm/i915/alpm: convert to struct intel_display
      drm/i915/lspcon: convert to struct intel_display
      drm/i915/display: convert dp aux backlight to struct intel_display
      drm/i915/hti: convert to struct intel_display
      drm/i915: make intel_display_power_domain_str() static
      string: add mem_is_zero() helper to check if memory area is all zeros
      drm: use mem_is_zero() instead of !memchr_inv(s, 0, n)
      drm/i915: move rawclk from runtime to display runtime info
      drm/xe/display: drop unused rawclk_freq and RUNTIME_INFO()
      drm/xe/display: fix compat IS_DISPLAY_STEP() range end
      drm/xe/display: remove intel_display_step_name() to simplify
      drm/xe/display: remove the unused compat HAS_GMD_ID()
      drm/xe/step: define more steppings E-J
      drm/i915/display: rename IS_DISPLAY_IP_RANGE() to IS_DISPLAY_VER_FULL=
()
      drm/i915/display: rename IS_DISPLAY_IP_STEP() to IS_DISPLAY_VER_STEP(=
)
      drm/i915/display: identify display steppings in display probe
      drm/i915/display: switch to display detected steppings
      drm/i915: remove display stepping handling
      drm/xe: remove display stepping handling
      drm/i915/vblank: use drm_crtc_vblank_crtc() instead of open-coding
      drm/i915/vblank: fix context imbalance warnings
      drm/i915/vblank: convert to struct intel_display
      drm/i915/vrr: convert to struct intel_display
      drm/i915/tv: convert to struct intel_display
      drm/i915/sprite: convert to struct intel_display
      drm/i915/display: convert params to struct intel_display
      drm/i915: remove unnecessary display includes
      drm/i915: remove unused leftover basedie step code
      drm/ttm: fix kernel-doc typo for @trylock_only
      drm/xe: replace #include <drm/xe_drm.h> with <uapi/drm/xe_drm.h>
      drm/mst: switch to guid_t type for GUID
      drm/mst: switch to guid_gen() to generate valid GUIDs
      drm/amd/display: switch to guid_gen() to generate valid GUIDs
      drm/sti/sti_hdmi: convert to struct drm_edid
      drm/tegra: convert to struct drm_edid
      drm/ipuv3/parallel: convert to struct drm_edid
      drm/tiny/gm12u320: convert to struct drm_edid
      drm/i915: fail module probe on nomodeset and i915.modeset=3D0
      drm/i915: deprecate the i915.modeset module parameter
      drm/i915 & drm/xe: save struct drm_device to drvdata
      drm/i915: support struct device and pci_dev in to_intel_display()
      drm/i915/audio: migrate away from kdev_to_i915()
      drm/i915/hdcp: migrate away from kdev_to_i915() in bind/unbind
      drm/i915/hdcp: migrate away from kdev_to_i915() in GSC messaging
      drm/xe/display: remove unused compat kdev_to_i915() and pdev_to_i915(=
)
      drm/xe/display: use xe && 0 to avoid warnings about unused variables
      drm/i915/hdmi: convert to struct intel_display
      drm/i915/dp: convert g4x_dp.[ch] to struct intel_display
      drm/i915/dp: convert intel_dp_tunnel.[ch] to struct intel_display
      drm/i915/dp: convert intel_dp_aux.[ch] to struct intel_display
      drm/i915/dp: convert intel_dp_link_training.[ch] to struct intel_disp=
lay
      drm/i915/pps: pass intel_dp to pps_name()
      drm/i915/pps: convert intel_pps.[ch] to struct intel_display
      drm/i915/psr: convert intel_psr.[ch] to struct intel_display
      drm/i915/ddi: stop using dp_to_i915()
      drm/i915/dp: hide dp_to_i915() inside intel_dp.c
      drm/tegra: fix potential uninitialized variable use
      drm/amdgpu: drop redundant W=3D1 warnings from Makefile
      drm/i915/bios: fix printk format width

Jason-JH.Lin (1):
      drm/mediatek: Fix missing configuration flags in mtk_crtc_ddp_config(=
)

Javier Carrasco (3):
      drm/mediatek: ovl_adaptor: Drop unused mtk_crtc.h header
      drm/mediatek: ovl_adaptor: Add missing of_node_put()
      drm/mediatek: ovl_adaptor: Use scoped variant of for_each_child_of_no=
de()

Jeffrey Hugo (1):
      MAINTAINERS: qaic: Drop Pranjal as reviewer

Jesse Zhang (5):
      drm/amdgpu/gfx11: Enable bad opcode interrupt
      drm/amdgpu/gfx10: Enable bad opcode interrupt
      drm/amdgpu/gfx12: Enable bad opcode interrupt
      drm/amdgpu: fix queue reset issue by mmio
      drm/amdkfd: Fix resource leak in criu restore queue

Jesus Narvaez (1):
      drm/i915/guc: Change GEM_WARN_ON to guc_err to prevent taints in CI

Jiadong Zhu (13):
      drm/amdgpu/gfx9: remap queue after reset successfully
      drm/amdgpu/gfx9: wait for reset done before remap
      drm/amdgpu/gfx9.4.3: remap queue after reset successfully
      drm/amdgpu/gfx_9.4.3: wait for reset done before remap
      drm/amdgpu/gfx: add a new kiq_pm4_funcs callback for reset_hw_queue
      drm/amdgpu/gfx9: implement reset_hw_queue for gfx9
      drm/amdgpu/gfx9.4.3: implement reset_hw_queue for gfx9.4.3
      drm/amdgpu/gfx11: wait for reset done before remap
      drm/amdgpu/gfx10: remap queue after reset successfully
      drm/amdgpu/gfx10: wait for reset done before remap
      drm/amdgpu/mes: modify mes api for mmio queue reset
      drm/amdgpu/mes: implement amdgpu_mes_reset_hw_queue_mmio
      drm/amdgpu/mes11: implement mmio queue reset for gfx11

Jiapeng Chong (4):
      drm/stm: Remove unnecessary .owner for lvds_platform_driver
      drm/stm: ltdc: Remove unused function plane_to_ltdc
      drm/amd/display: use swap() in sort()
      drm/amd/display: remove unneeded semicolon

Jingwen Zhu (1):
      drm/amd/display: avoid disable otg when dig was disabled

Jinjie Ruan (4):
      drm/amd/display: Make core_dcn4_g6_temp_read_blackout_table static
      drm/amd/display: Make core_dcn4_ip_caps_base static
      drm/amd/display: Make dcn35_hubp_funcs static
      drm/amd/display: Make dcn401_dsc_funcs static

Jocelyn Falempe (17):
      printk: Add a short description string to kmsg_dump()
      drm/panic: Add drm_panic_is_enabled()
      fbcon: Add an option to disable fbcon in panic
      drm/fb-helper: Set skip_panic if the drm driver supports drm panic
      drm/panic: Remove build time dependency with FRAMEBUFFER_CONSOLE
      drm/panic: Add missing static inline to drm_panic_is_enabled()
      fbcon: Use oops_in_progress instead of panic_cpu
      mtd: mtdoops: Fix kmsgdump parameter renaming.
      drm/panic: Remove space before "!" in panic message
      drm/panic: Remove useless export symbols
      drm/panic: Move drm_panic_register prototype to drm_crtc_internal.h
      drm/panic: Move copyright notice to the top
      drm/panic: Add panic description
      drm/panic: Add integer scaling to blit()
      drm/rect: Add drm_rect_overlap()
      drm/panic: Simplify logo handling
      drm/panic: Add a QR code panic screen

John Harrison (4):
      drm/i915/arl: Enable Wa_14019159160 for ARL
      drm/i915/guc: Extend w/a 14019159160
      drm/i915: ARL requires a newer GSC firmware
      drm/i915/guc: Fix missing enable of Wa_14019159160 on ARL

Jonas Karlman (3):
      drm/rockchip: dw_hdmi: Fix reading EDID when using a forced mode
      drm/rockchip: dw_hdmi: Allow High TMDS Bit Rates
      drm/rockchip: dw_hdmi: Add max_tmds_clock validation

Jonathan Cavitt (1):
      drm/i915: Allow NULL memory region

Jonathan Kim (6):
      drm/amdkfd: allow users to target recommended SDMA engines
      drm/amdkfd: support per-queue reset on gfx9
      drm/amdkfd: fix debug watchpoints for logical devices
      drm/amdkfd: fix partition query when setting up recommended sdma engi=
nes
      drm/amdkfd: fallback to pipe reset on queue reset fail for gfx9
      drm/amdkfd: fix missed queue reset on queue destroy

Joshua Aberback (3):
      drm/amd/display: Remove unnecessary DSC power gating for DCN401
      drm/amd/display: Remove duplicate HWSS interfaces
      drm/amd/display: Assume 32 bpp cursor in DML21

Joshua Ashton (1):
      drm/amdgpu: Forward soft recovery errors to userspace

Jos=C3=A9 Exp=C3=B3sito (2):
      drm/connector: Document destroy hook in drmm init functions
      drm/vkms: Fix cpu_to_le16()/le16_to_cpu() warnings

Jos=C3=A9 Roberto de Souza (1):
      drm/xe: Add process name and PID to job timedout message

Jouni H=C3=B6gander (3):
      drm/i915/psr: Prevent Panel Replay if CRC calculation is enabled
      drm/i915/display: Add mechanism to use sink model when applying quirk
      drm/i915/display: Increase Fast Wake Sync length as a quirk

Juha-Pekka Heikkila (4):
      drm/i915/display: Don't enable decompression on Xe2 with Tile4
      drm/fourcc: define Intel Xe2 related tile4 ccs modifiers
      drm/i915/display: allow creation of Xe2 ccs framebuffers
      drm/i915/display: Fix BMG CCS modifiers

Julia Filipchuk (3):
      drm/xe/guc: Bump minimum required GuC version to v70.29.2
      drm/xe/guc: Define GuC version v70.29.2 for BMG
      drm/xe/guc: Enable w/a 14022293748 and 22019794406

Karthik Poosa (2):
      drm/xe/hwmon: Fix PL1 disable flow in xe_hwmon_power_max_write
      drm/xe/hwmon: Fix WRITE_I1 param from u32 to u16

Katya Orlova (1):
      drm/stm: Avoid use-after-free issues with crtc and plane

Kenneth Feng (7):
      drm/amdgpu/pm: support gpu_metrics sysfs interface for smu v14.0.2/3
      drm/amd/pm: update powerplay structure on smu v14.0.2/3
      drm/amd/pm: add overdrive support on smu v14.0.2/3
      drm/amd/amdgpu: add HDP_SD support on gc 12.0.0/1
      drm/amd/pm: update message interface for smu v14.0.2/3
      drm/amd/pm: update the features set on smu v14.0.2/3
      drm/amd/pm: fix the pp_dpm_pcie issue on smu v14.0.2/3

Konrad Dybcio (7):
      drm/msm/adreno: Assign msm_gpu->pdev earlier to avoid nullptrs
      drm/msm/a6xx: Evaluate adreno_is_a650_family in pdc_in_aop check
      drm/msm/a6xx: Store primFifoThreshold in struct a6xx_info
      drm/msm/a6xx: Store correct gmu_cgc_mode in struct a6xx_info
      drm/msm/a6xx: Use the per-GPU value for gmu_cgc_mode
      drm/msm/a6xx: Set GMU CGC properties on a6xx too
      drm/msm/a6xx: Add A621 support

Krzysztof Kozlowski (7):
      drm/sti: dvo: drop driver owner assignment
      drm/sti: hda: drop driver owner assignment
      drm/sti: tvout: drop driver owner assignment
      drm/sti: vtg: drop driver owner assignment
      drm/sti: hdmi: drop driver owner assignment
      drm/sti: hqvdp: drop driver owner assignment
      dt-bindings: MAINTAINERS: drop stale exynos file pattern

Krzysztof Niemiec (1):
      drm/i915/gt: Empty uabi engines list during intel_engines_release()

Kuninori Morimoto (1):
      gpu: drm: use for_each_endpoint_of_node()

Kwanghoon Son (1):
      drm/exynos: Remove unnecessary code

Lad Prabhakar (1):
      drm: renesas: Move RZ/G2L MIPI DSI driver to rz-du

Lang Yu (1):
      drm/amdgpu: fix invalid fence handling in amdgpu_vm_tlb_flush

Laurent Pinchart (1):
      drm/msm: Remove prototypes for non-existing functions

Leo Li (7):
      drm/amd/display: Let drm_crtc_vblank_on/off manage interrupts
      drm/amd/display: Run idle optimizations at end of vblank handler
      drm/amd: Introduce additional IPS debug flags
      drm/amd/display: Determine IPS mode by ASIC and PMFW versions
      drm/amd/display: Lock DC and exit IPS when changing backlight
      drm/amd/display: Do not reset planes based on crtc zpos_changed
      drm/amd/display: Add all planes on CRTC to state for overlay cursor

Li Zetao (3):
      drm/msm/adreno: Use kvmemdup to simplify the code
      drm/amd: use clamp() in amdgpu_pll_get_fb_ref_div()
      drm/amdgpu: use clamp() in amdgpu_vm_adjust_size()

Lijo Lazar (6):
      drm/amdgpu: Add empty HDP flush function to JPEG v4.0.3
      drm/amdgpu: Add empty HDP flush function to VCN v4.0.3
      drm/amdkfd: Add node_id to location_id generically
      drm/amdgpu: Reorder to read EFI exported ROM first
      drm/amd/pm: Add support for new P2S table revision
      drm/amdgpu: Normalize reg offsets on JPEG v4.0.3

Likun Gao (3):
      drm/amdgpu: force to use legacy inv in mmhub
      drm/amdgpu: add golden setting for gc v12
      drm/amdgpu: support for gc_info table v1.3

Liu Ying (3):
      drm/bridge: lontium-lt8912b: Validate mode in
drm_bridge_funcs::mode_valid()
      dt-bindings: display: panel-simple: Add On Tat Industrial
Company KD50G21-40NT-A1
      drm/panel: simple: Add ON Tat Industrial Company KD50G21-40NT-A1 pane=
l

Loan Chen (1):
      drm/amd/display: Enable otg synchronization logic for DCN321

Louis Chauvet (1):
      drm/vkms: Formatting and typo fix

Lu Baolu (1):
      gpu: host1x: Use iommu_paging_domain_alloc()

Luca Coelho (1):
      drm/i915/gt: remove stray declaration of intel_gt_release_all()

Lucas De Marchi (20):
      drm/xe/gt: Remove double include
      drm/xe: Generate oob before compiling anything
      drm/xe/uapi: Expose SIMD16 EU mask in topology query
      drm/xe: Fix warning on unreachable statement
      drm/xe: Refactor mmio setup for multi-tile
      drm/xe: Add assert for XE_WA() usage
      drm/xe/rtp: Fix off-by-one when processing rules
      drm/xe: Fix opregion leak
      drm/xe/kunit: Test WAs for BMG
      drm/xe/kunit: Rename count to count_sr_entries
      drm/xe/kunit: Test active rtp entries
      drm/xe/kunit: Rename rtp test cases
      drm/xe/kunit: Test rtp with no actions
      drm/xe/rtp: Simplify marking active workarounds
      drm/xe/rtp: Expand max rules/actions per entry again
      drm/xe: Migrate OOB WAs to OR rules
      drm/xe: Allow to compile out debugfs
      drm/xe: Rename enable_display module param
      Merge drm/drm-next into drm-xe-next
      drm/xe/lnl: Drop force_probe requirement

Lyude Paul (1):
      drm/vkms: Remove event from vkms_output

Ma Ke (5):
      drm/radeon: fix null pointer dereference in radeon_add_common_modes
      drm/amdgpu: fix a possible null pointer dereference
      drm/amd/amdgpu: Fix uninitialized variable warnings
      drm/amd/display: avoid using null object of framebuffer
      drm: omapdrm: Add missing check for alloc_ordered_workqueue

Maarten Lankhorst (6):
      drm/xe/display: Match i915 driver suspend/resume sequences better
      drm/xe/display: Make display suspend/resume work on discrete
      drm/i915/display: Plane capability for 64k phys alignment
      drm/xe: Align all VRAM scanout buffers to 64k physical pages when nee=
ded.
      drm/xe: Fix merge fails related to display runtime PM
      drm/xe: Fix missing conversion to xe_display_pm_runtime_resume

Manikandan Muralidharan (3):
      dt-bindings: display: himax-hx8394: Add Microchip AC40T08A MIPI
Display panel
      drm/panel: himax-hx8394: switch to devm_gpiod_get_optional() for
reset_gpio
      drm/panel: himax-hx8394: Add Support for Microchip AC40T08A MIPI
Display Panel

Marc Gonzalez (3):
      dt-bindings: phy: add qcom,hdmi-phy-8998
      dt-bindings: display/msm: hdmi: add qcom,hdmi-tx-8998
      drm/msm/hdmi: add "qcom,hdmi-tx-8998" compatible

Marco Pagani (1):
      drm/test: use kunit action wrapper macro in the gem shmem test suite

Marek Vasut (5):
      drm: lcdif: Use adjusted_mode .clock instead of .crtc_clock
      dt-bindings: display: bridge: tc358867: Document default DP preemphas=
is
      drm/bridge: tc358767: Add configurable default preemphasis
      dt-bindings: display: panel: Document Densitron DMT028VGHMCMI-1D
TFT on ILI9806E DSI TCON
      drm/panel/panel-ilitek-ili9806e: Add Densitron DMT028VGHMCMI-1D
TFT to ILI9806E DSI TCON driver

Mario Limonciello (2):
      drm: Introduce 'power saving policy' drm property
      drm/amd: Add power_saving_policy drm property to eDP connectors

Markus Elfring (1):
      drm/dp_mst: Simplify character output in drm_dp_mst_dump_topology()

Martin Leung (2):
      drm/amd/display: Promote DAL to 3.2.296
      drm/amd/display: Promote DC to 3.2.297

Matt Roper (7):
      drm/xe/migrate: Future-proof compressed PAT check
      drm/xe: Name and document Wa_14019789679
      drm/xe: Add debugfs to dump GuC's hwconfig
      drm/xe/mcr: Try to derive dss_per_grp from hwconfig attributes
      drm/xe/display: Drop unnecessary xe_gt.h includes
      drm/xe/pcode: Treat pcode as per-tile rather than per-GT
      drm/xe/hwmon: Treat hwmon as a per-device concept

Matthew Auld (6):
      drm/xe/bmg: implement Wa_16023588340
      drm/i915: disable fbc due to Wa_16023588340
      drm/xe: fix engine_class bounds check again
      drm/xe: prevent UAF around preempt fence
      drm/xe: fixup xe_alloc_pf_queue
      drm/xe: prevent potential UAF in pf_provision_vf_ggtt()

Matthew Brost (49):
      drm/xe: Add timeout to preempt fences
      drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
      drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
      drm/xe: Add xe_exec_queue_last_fence_test_dep
      drm/xe: Convert multiple bind ops into single job
      drm/xe: Update VM trace events
      drm/xe: Update PT layer with better error handling
      drm/xe: Add VM bind IOCTL error injection
      drm/xe: Drop trace_xe_hw_fence_free
      drm/xe: Wedge the entire device
      drm/xe: Don't suspend device upon wedge
      drm/xe: Validate user fence during creation
      drm/xe: Remove unused xe_sync_entry_wait
      drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
      drm/xe: Drop xe_gt_tlb_invalidation_wait
      drm/xe: Hold a PM ref when GT TLB invalidations are inflight
      drm/xe: Build PM into GuC CT layer
      drm/xe: Fix xe_pt_abort_unbind
      drm/xe: Return -ENOBUFS if a kmalloc fails which is tied to an
array of binds
      drm/xe: Store process name and pid in xe file
      drm/xe: Remove fence check from send_tlb_invalidation
      drm/xe: Fix possible UAF in guc_exec_queue_process_msg
      drm/xe: Assert G2H outstanding when releasing G2H
      drm/xe: Use dma_fence_chain_free in chain fence unused as a sync
      drm/xe: Take ref to VM in delayed snapshot
      drm/printer: Allow NULL data in devcoredump printer
      drm/xe: Faster devcoredump
      drm/xe: Only check last fence on user binds
      drm/xe: Move VM dma-resv lock from xe_exec_queue_create to
__xe_exec_queue_init
      drm/xe: Add xe_sched_msg_lock/unlock helper
      drm/xe: Reinit msg link when processing a message
      drm/xe: Add xe_sched_add_msg_locked helper
      drm/xe: Only enable scheduling upon resume if needed
      drm/xe: Allow suspend / resume to be safely called multiple times
      drm/xe: Fix tile fini sequence
      drm/xe: Use for_each_remote_tile rather than manual check
      drm/xe: Use reserved copy engine for user binds on faulting devices
      drm/xe: Drop HW fence pointer to HW fence ctx
      drm/xe: Free job before xe_exec_queue_put
      drm/xe: Invalidate media_gt TLBs
      drm/xe: Invalidate media_gt TLBs in PT code
      Revert "drm/xe: Invalidate media_gt TLBs in PT code"
      drm/xe: Move ggtt_fini to devm managed
      drm/xe: Set firmware state to loadable before registering guc_fini_hw
      drm/xe: Drop warn on xe_guc_pc_gucrc_disable in guc pc fini
      drm/xe: Move hw_engine_fini to devm managed
      drm/xe: Update xe_sa to use xe_managed_bo_create_pin_map
      dma-buf: Split out dma fence array create into alloc and arm function=
s
      drm/xe: Invalidate media_gt TLBs in PT code

Ma=C3=ADra Canal (1):
      drm/v3d: Expose memory stats through fdinfo

Meenakshikumar Somasundaram (2):
      drm/amd/display: Enable aux transfer path via dmub for dp tunneling
      drm/amd/display: Add dpia debug option to control power management

Melissa Wen (2):
      drm/amd/display: fix cursor offset on rotation 180
      MAINTAINERS: remove myself as a VKMS maintainer

Michael Chen (1):
      drm/amdgpu: increase mes log buffer size for gfx12

Michael Strauss (3):
      drm/amd/display: Fix overlay with pre-blend color processing
      drm/amd/display: Update HPO I/O When Handling Link Retrain
Automation Request
      drm/amd/display: Allow UHBR Interop With eDP Supported Link Rates Tab=
le

Michal Wajdeczko (31):
      drm/xe/guc: Demote GuC IDs usage message to debug
      drm/xe: Fix register definition order in xe_regs.h
      drm/xe: Kill regs/xe_sriov_regs.h
      drm/xe: Use VF_CAP_REG for device wmb
      drm/xe/kunit: Kill xe_cur_kunit()
      drm/xe/kunit: Drop XE_TEST_EXPORT
      drm/xe/kunit: Simplify xe_bo live tests code layout
      drm/xe/kunit: Simplify xe_dma_buf live tests code layout
      drm/xe/kunit: Simplify xe_migrate live tests code layout
      drm/xe/kunit: Simplify xe_mocs live tests code layout
      drm/xe/pf: Limit fair VF LMEM provisioning
      drm/xe/vf: Track writes to inaccessible registers from VF
      drm/xe/vf: Fix register value lookup
      drm/xe: Introduce const cast helper
      drm/xe/tests: Add helpers for use in live tests
      drm/xe/tests: Convert xe_bo live tests
      drm/xe/tests: Convert xe_dma_buf live tests
      drm/xe/tests: Convert xe_migrate live tests
      drm/xe/tests: Convert xe_mocs live tests
      drm/xe/tests: Skip xe_mocs live tests on VF device
      drm/xe: Normalize NEEDS_64K BO flag
      drm/xe: Add NEEDS_2M BO flag
      drm/xe/pf: Fix VF config validation on multi-GT platforms
      drm/xe/pf: Add function to sanitize VF resources
      drm/xe/pf: Fix documentation formatting
      drm/xe/pf: Drop GuC notifications for non-existing VF
      drm/xe/pf: Improve VF control
      drm/xe/pf: Add thresholds to the VF KLV config
      drm/xe/pf: Reset thresholds when releasing a VF config
      drm/xe: Remove redundant [drm] tag from xe_assert() message
      drm/xe: Don't keep stale pointer to bo->ggtt_node

Micha=C5=82 Winiarski (3):
      drm: Use XArray instead of IDR for minors
      accel: Use XArray instead of IDR for minors
      drm: Expand max DRM device number to full MINORBITS

Mika Kuoppala (1):
      drm/xe: Add kernel doc for xe_hw_engine_lookup

Mikko Perttunen (1):
      gpu: host1x: Request syncpoint IRQs only during probe

Mitul Golani (5):
      drm/i915/display: Cache adpative sync caps to use it later
      drm/i915/display: WA for Re-initialize dispcnlunitt1 xosc clock
      drm/i915/display/dp: Compute AS SDP when vrr is also enabled
      drm/dp: Describe target_rr_divider in struct drm_dp_as_sdp
      drm/i915/bmg: Read display register timeout

Mohammed Anees (1):
      drm: Add missing documentation for struct drm_plane_size_hint

Mounika Adhuri (1):
      drm/amd/display: Refactoring MPC

Mudimela (1):
      drm/amd/display: Refactoring DWB related files from dcn30 Files

Muhammad Ahmed (1):
      drm/amd/display: guard otg disable w/a for test

Mukul Joshi (3):
      drm/amdgpu: Implement MES Suspend and Resume APIs for GFX11
      drm/amdkfd: Update queue unmap after VM fault with MES
      drm/amdkfd: Update BadOpcode Interrupt handling with MES

Nathan Chancellor (2):
      drm/amd/display: Reapply 2fde4fdddc1f
      drm/xe: Fix total initialization in xe_ggtt_print_holes()

Neil Armstrong (4):
      dt-bindings: display: panel: document BOE TV101WUM-LL2 DSI Display Pa=
nel
      drm/panel: add BOE tv101wum-ll2 panel driver
      drm/panel: visionox-vtdr6130: switch to mipi_dsi wrapped functions
      drm/panel: visionox-vtdr6130: switch to devm_regulator_bulk_get_const

Nevenko Stupar (2):
      drm/amd/display: Issue with 3 or more mcaches per surface
      drm/amd/display: Hardware cursor changes color when switched to
software cursor

Ngai-Mint Kwan (1):
      drm/xe/xe2lpm: Extend Wa_16021639441

Nicholas Kazlauskas (5):
      drm/amd/display: Request 0MHz dispclk for zero display case
      drm/amd/display: Add seamless boot support for more DIG operation mod=
es
      drm/amd/display: Use gpuvm_min_page_size_kbytes for DML2 surfaces
      drm/amd/display: Allocate DCN35 clock table transfer buffers in GART
      drm/amd/display: Notify DMCUB of D0/D3 state

Nicholas Susanto (4):
      drm/amd/display: Remove redundant check in DCN35 hwseq
      drm/amd/display: DCN35 set min dispclk to 50Mhz
      drm/amd/display: Fix DCN35 set min dispclk logic
      drm/amd/display: Refactor dccg35_get_other_enabled_symclk_fe

Nikita Zhandarovich (2):
      drm/i915: Fix possible int overflow in skl_ddi_calculate_wrpll()
      drm/radeon/evergreen_cs: fix int overflow errors in cs track offsets

Nirmoy Das (12):
      drm/xe/display/xe_hdcp_gsc: Free arbiter on driver removal
      drm/xe/pm: Add trace for pm functions
      drm/xe: Fix access_ok check in user_fence_create
      drm/xe/gt: Add APIs for printing stats over debugfs
      drm/xe: Add stats for tlb invalidation count
      drm/xe/migrate: Parameterize ccs and bo data clear in xe_migrate_clea=
r()
      drm/xe: Remove redundant param from xe_bo_create_user
      drm/ttm: Add a flag to allow drivers to skip clear-on-free
      drm/xe/lnl: Offload system clear page activity to GPU
      Revert "drm/xe/lnl: Offload system clear page activity to GPU"
      Revert "drm/ttm: Add a flag to allow drivers to skip clear-on-free"
      drm/xe: Fix memory leak on xe_alloc_pf_queue failure

Nitin Gote (2):
      drm/i915/gt: Do not consider preemption during execlists_dequeue for =
gen8
      drm/i915/gt: Add Wa_14019789679

Ohad Sharabi (1):
      drm/xe/oa: Don't use hardcoded values

Otto Pfl=C3=BCger (1):
      drm/msm/adreno: Add A306A support

Pallavi Mishra (1):
      drm/xe/xe2: Enable Priority Mem Read

Peng Liu (2):
      drm/amdgpu: add raven1 gfxoff quirk
      drm/amdgpu: enable gfxoff quirk on HP 705G4

Philip Yang (12):
      drm/amdkfd: kfd_bo_mapped_dev support partition
      drm/amdkfd: amdkfd_free_gtt_mem clear the correct pointer
      drm/amdkfd: Refactor queue wptr_bo GART mapping
      drm/amdkfd: Validate user queue buffers
      drm/amdkfd: Ensure user queue buffers residency
      drm/amdkfd: Validate user queue svm memory residency
      drm/amdkfd: Validate user queue update
      drm/amdkfd: Store queue cwsr area size to node properties
      drm/amdkfd: Validate queue cwsr area and eop buffer size
      drm/amdkfd: Fix compile error if HMM support not enabled
      drm/amdkfd: Handle queue destroy buffer access race
      drm/amdkfd: Document and define SVM events message macro

Philipp Stanner (1):
      drm/nouveau: Improve variable name in nouveau_sched_init()

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: disallow multiple BO_HANDLES chunks in one submit

Pin-yen Lin (1):
      drm/bridge: it6505: Disable IRQ when powered off

Prike Liang (3):
      drm/amdgpu: increase the reset counter for the queue reset
      drm/amdgpu/gfx9.4.3: Implement compute pipe reset
      drm/amdgpu/gfx11: fallback to driver reset compute queue directly (v2=
)

Qili Lu (1):
      drm/amd/display: fix dccg root clock optimization related hang

Raag Jadav (1):
      drm/i915/hwmon: expose fan speed

Rahul Jain (1):
      drm/amdgpu: Take IOMMU remapping into account for p2p checks

Rajneesh Bhardwaj (1):
      drm/ttm: Allow direct reclaim to allocate local memory v2

Ramesh Errabolu (1):
      drm/amdgpu: Surface svm_default_granularity, a RW module parameter

Relja Vojvodic (3):
      drm/amd/display: Implement bias and scale pre scl
      drm/amd/display: 3DLUT non-DMA refactor
      drm/amd/display: Add sharpness control interface

Remington Brasga (1):
      drm/amdgpu/uvd4: fix mask and shift definitions

Revalla Hari Krishna (3):
      drm/amd/display: Refactoring OPP
      drm/amd/display: Refactoring MMHUBBUB
      drm/amd/display: Refactoring HPO

Richard Acayan (1):
      drm/msm/adreno: add a615 support

Rob Clark (1):
      drm/msm: Remove unused pm_state

Rob Herring (Arm) (2):
      drm: bridge: anx7625: Use of_property_read_variable_u8_array()
      drm/mediatek: Drop unnecessary check for property presence

Robin Chen (1):
      drm/amd/display: Optimize vstartup position for AS-SDP

Rodrigo Siqueira (23):
      drm/amd/display: Remove unused dml2_core_ip_params struct
      drm/amd/display: Remove ASSERT if significance is zero in math_ceil2
      drm/amd/display: Remove old comments
      drm/amd/display: Re-order enum in a header file
      drm/amd/display: Setup two pixel per container
      drm/amd/display: Replace dm_execute_dmub_cmd with
dc_wake_and_execute_dmub_cmd
      drm/amd/display: Add missing DET segments programming
      drm/amd/display: Remove duplicated code
      drm/amd/display: Add missing mcache registers
      drm/amd/display: Add dcc propagation value
      drm/amd/display: Add missing registers for dcn32
      drm/amd/display: Remove unused code
      drm/amd/display: Add missing DCN314 to the DML Makefile
      drm/amd/display: Cleanup dml2 and dc/resource Makefile
      drm/amd/display: Remove useless defines
      drm/amd/display: Remove unused fields from dmub_cmd_update_dirty_rect=
_data
      drm/amd/display: Remove unused fields from dc_caps
      drm/amd/display: Add missing program DET segment call to pipe init
      drm/amd/display: Check null pointer before try to access it
      drm/amd/display: Remove unused field
      drm/amd/display: Improve FAM control for DCN401
      drm/amd/display: Adjust cursor position
      drm/amd/display: Remove unnecessary call to REG_SEQ_SUBMIT|WAIT_DONE

Rodrigo Vivi (17):
      drm/xe: Removed unused xe_ggtt_printk
      drm/xe: Introduce GGTT documentation
      drm/xe: Remove unnecessary drm_mm.h includes
      drm/{i915, xe}: Avoid direct inspection of dpt_vma from outside dpt
      drm/xe: Encapsulate drm_mm_node inside xe_ggtt_node
      drm/xe: Rename xe_ggtt_node related functions
      drm/xe: Limit drm_mm_node_allocated access to xe_ggtt_node
      drm/xe: Introduce xe_ggtt_largest_hole
      drm/xe: Introduce xe_ggtt_print_holes
      drm/xe: Refactor xe_ggtt balloon functions to make the node clear
      drm/xe: Make xe_ggtt_node struct independent
      drm/xe: Fix missing runtime outer protection for ggtt_remove_node
      Merge drm/drm-next into drm-intel-next
      Merge drm/drm-next into drm-intel-next
      drm/xe: Add missing runtime reference to wedged upon gt_reset
      drm/xe/display: Avoid encoder_suspend at runtime suspend
      drm/xe: Suppress missing outer rpm protection warning

Rohit Agarwal (1):
      dt-bindings: display: mediatek: dpi: Add power domains

Roman Li (2):
      drm/amd/display: Replace assert with error message in
dp_retrieve_lttpr_cap()
      drm/amd/display: Fix print format specifiers in DC_LOG_IPS

Ryan Seto (2):
      drm/amd/display: Added logging for automated DPM testing
      drm/amd/display: Fix visual confirm bug for SubVP

Sai Teja Pottumuttu (1):
      drm/xe/xe2hpg: Introduce performance tuning changes for Xe2_HPG

Samson Tam (9):
      drm/amd/display: quality improvements for EASF and ISHARP
      drm/amd/display: remove dc dependencies from SPL library
      drm/amd/display: ensure EASF and ISHARP coefficients are
programmed together
      drm/amd/display: roll back quality EASF and ISHARP and dc
dependency changes
      drm/amd/display: add back quality EASF and ISHARP and dc
dependency changes
      drm/amd/display: add improvements for text display and HDR DWM and MP=
O
      drm/amd/display: add sharpness support for windowed YUV420 video
      drm/amd/display: re-enable Dynamic ODM policy
      drm/amd/display: disable sharpness if HDR Multiplier is too large

Sebastian Wick (1):
      drm/drm_connector: Document Colorspace property variants

Shekhar Chauhan (1):
      drm/xe/xe2: Add performance turning changes

Sherry Yang (1):
      drm/msm: fix %s null argument error

Shixiong Ou (1):
      drm: Add the missing symbol '.'

Shuijing Li (1):
      drm/mediatek: dsi: Add dsi per-frame lp code for mt8188

Simona Vetter (10):
      drm: Add might_fault to drm_modeset_lock priming
      Merge tag 'drm-misc-next-2024-08-01' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-misc-next-2024-08-09' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-misc-next-2024-08-16' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-misc-next-2024-08-22' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-intel-gt-next-2024-08-23' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge v6.11-rc5 into drm-next
      Merge tag 'amd-drm-next-6.12-2024-08-26' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      MAINATINERS: update drm maintainer contacts
      Merge v6.11-rc7 into drm-next

Soham Dandapat (1):
      drm/amdgpu: Return earlier in amdgpu_sw_ring_ib_end if mcbp is off

Sridevi Arvindekar (1):
      drm/amd/display: Add option to allow transition when odm is forced

Srinivasan Shanmugam (41):
      drm/amd/display: Add 'pstate_keepout' kdoc entry in 'optc1_program_ti=
ming'
      drm/amd/display: Add kdoc entry for 'bs_coeffs_updated' in
dpp401_dscl_program_isharp
      drm/amd/display: Fix index out of bounds in DCN30 degamma
hardware format translation
      drm/amd/display: Fix index out of bounds in degamma hardware
format translation
      drm/amd/display: Implement bounds check for stream encoder
creation in DCN401
      drm/amd/display: Fix index out of bounds in DCN30 color transformatio=
n
      drm/amd/display: Add null check for head_pipe in
dcn201_acquire_free_pipe_for_layer
      drm/amd/display: Add null check for head_pipe in
dcn32_acquire_idle_pipe_for_head_pipe_in_layer
      drm/amd/display: Add NULL check for clk_mgr and clk_mgr->funcs
in dcn30_init_hw
      drm/amd/display: Add NULL check for clk_mgr and clk_mgr->funcs
in dcn401_init_hw
      drm/amd/display: Add NULL check for clk_mgr in dcn32_init_hw
      drm/amd/display: Add null check for set_output_gamma in
dcn30_set_output_transfer_func
      drm/amd/display: Add null check for pipe_ctx->plane_state in
dcn20_program_pipe
      drm/amd/display: Add null check for top_pipe_to_program in
commit_planes_for_stream
      drm/amdkfd: Fix missing error code in kfd_queue_acquire_buffers
      drm/amd/display: Handle null 'stream_status' in
'planes_changed_for_existing_stream'
      drm/amd/display: Align 'dpp401_dscl_program_isharp' with actual
function parameters
      drm/amd/display: Add NULL check for function pointer in
dcn20_set_output_transfer_func
      drm/amd/display: Add NULL check for function pointer in
dcn401_set_output_transfer_func
      drm/amd/display: Add NULL check for function pointer in
dcn32_set_output_transfer_func
      drm/amd/display: Add null check for 'afb' in amdgpu_dm_update_cursor =
(v2)
      drm/amd/display: Add null check for 'afb' in
amdgpu_dm_plane_handle_cursor_update (v2)
      drm/amd/display: Align hwss_wait_for_all_blank_complete
descriptor with implementation
      drm/amdgpu: Add infrastructure for Cleaner Shader feature
      drm/amdgpu: Make enforce_isolation setting per GPU
      drm/amdgpu: Enforce isolation as part of the job
      drm/amdgpu: Add enforce_isolation sysfs attribute
      drm/amdgpu: Add sysfs interface for running cleaner shader
      drm/amdgpu: Add PACKET3_RUN_CLEANER_SHADER for cleaner shader executi=
on
      drm/amdgpu/gfx9: Implement cleaner shader support for GFX9 hardware
      drm/amdgpu/gfx9: Implement cleaner shader support for GFX9.4.3 hardwa=
re
      drm/amdgpu/gfx9: Add cleaner shader for GFX9.4.3
      drm/amdgpu/gfx9: Add cleaner shader support for GFX9.4.4 hardware
      drm/amdgpu: Implement Enforce Isolation Handler for KGD/KFD serializa=
tion
      drm/amdgpu/gfx9: Apply Isolation Enforcement to GFX & Compute rings
      drm/amdgpu/gfx_v9_4_3: Apply Isolation Enforcement to GFX & Compute r=
ings
      drm/amd/display: Add missing kdoc entry for 'bs_coeffs_updated'
in dpp401_dscl_program_isharp
      drm/amdgpu/: Add missing kdoc entry in amdgpu_vm_handle_fault functio=
n
      drm/amdgpu: Replace 'amdgpu_job_submit_direct' with
'drm_sched_entity' in cleaner shader
      drm/amd/display: Add kdoc entry for 'program_isharp_1dlut' in
'dpp401_dscl_program_isharp'
      drm/amdgpu: Fix kdoc entry in 'amdgpu_vm_cpu_prepare'

Stanley.Yang (1):
      drm/amdgpu: Fix eeprom max record count

Stefan Wahren (3):
      drm/vc4: hdmi: Handle error case of pm_runtime_resume_and_get
      drm/vc4: Get the rid of DRM_ERROR()
      drm/vc4: v3d: simplify clock retrieval

Steffen Trumtrar (2):
      dt-bindings: display: simple: Document support for Innolux G070ACE-LH=
3
      drm/panel: simple: add Innolux G070ACE-LH3 LVDS display support

Stephan Gerhold (1):
      Revert "drm/panel-edp: Add SDC ATNA45AF01"

Stuart Summers (3):
      drm/xe: Fix missing workqueue destroy in xe_gt_pagefault
      drm/xe: Use topology to determine page fault queue size
      drm/xe/guc: Bump the G2H queue size to account for page faults

Sung Joon Kim (5):
      drm/amd/display: Do 1-to-1 mapping between OPP and DSC in DML2
      drm/amd/display: Check stream pointer is initialized before accessing
      drm/amd/display: Check for NULL pointer
      drm/amd/display: Check top sink only when multiple streams for DP2
      drm/amd/display: Support UHBR10 link rate on eDP

Sung Lee (1):
      drm/amd/display: Fix Cursor Offset in Scaled Scenarios

Sunil Khatri (61):
      drm/amdgpu: Add sdma_v5_2 ip dump for devcoredump
      drm/amdgpu: add print support for sdma_v_5_2 ip_dump
      drm/amdgpu: fix the extra space between two functions
      drm/amdgpu: fix the print message in devcoredump
      drm/amdgpu: Add sdma_v6_0 ip dump for devcoredump
      drm/amdgpu: add print support for sdma_v_6_0 ip_dump
      drm/amdgpu: Add sdma_v5_0 ip dump for devcoredump
      drm/amdgpu: add print support for sdma_v_5_0 ip_dump
      drm/amdgpu: Add sdma_v7_0 ip dump for devcoredump
      drm/amdgpu: add print support for sdma_v_7_0 ip_dump
      drm/amdgpu: Add sdma_v4_0 ip dump for devcoredump
      drm/amdgpu: add print support for sdma_v_4_0 ip_dump
      drm/amdgpu: Add sdma_v4_4_2 ip dump for devcoredump
      drm/amdgpu: add print support for sdma_v_4_4_2 ip_dump
      drm/amdgpu: add vcn ip dump ptr in vcn global struct
      drm/amdgpu: add macro to calculate offset with instance
      drm/amdgpu: add vcn_v3_0 ip dump support
      drm/amdgpu: add print support for vcn_v3_0 ip dump
      drm/amdgpu: print VCN instance dump for valid instance
      drm/amdgpu: trigger ip dump before suspend of IP's
      drm/amdgpu: Remove debugfs amdgpu_reset_dump_register_list
      drm/amdgpu: Clean up the register dump via debugfs list
      drm/amdgpu: optimize the padding for gfx10
      drm/amdgpu: do not call insert_nop fn for zero count
      drm/amdgpu: optimize the padding for gfx11
      drm/amdgpu: optimize the padding for gfx12
      drm/amdgpu: optimize the padding for gfx9
      drm/amdgpu: optimize the padding for gfx_v9_4_3
      drm/amdgpu: add vcn_v5_0 ip dump support
      Revert "drm/amdgpu: add vcn_v5_0 ip dump support"
      Revert "drm/amdgpu: add print support for vcn_v3_0 ip dump"
      Revert "drm/amdgpu: add vcn_v3_0 ip dump support"
      Revert "drm/amdgpu: add vcn ip dump ptr in vcn global struct"
      drm/amdgpu: fix ptr check warning in gfx9 ip_dump
      drm/amdgpu: fix ptr check warning in gfx10 ip_dump
      drm/amdgpu: fix ptr check warning in gfx11 ip_dump
      drm/amdgpu: fix ptr check warning in gfx12 ip_dump
      drm/amdgpu: add gfx9_4_3 register support in ipdump
      drm/amdgpu: add print support for gfx9_4_3 ipdump
      drm/amdgpu: add cp queue registers for gfx9_4_3 ipdump
      drm/amdgpu: add cp queue registers print for gfx9_4_3
      drm/amdgpu: remove ME0 registers from  mi300 dump
      drm/amdgpu: add vcn ip dump ptr in vcn global struct
      drm/amdgpu: add vcn_v3_0 ip dump support
      drm/amdgpu: add print support for vcn_v3_0 ip dump
      drm/amdgpu: add vcn_v5_0 ip dump support
      drm/amdgpu: add print support for vcn_v5_0 ip dump
      drm/amdgpu: add vcn_v4_0_3 ip dump support
      drm/amdgpu: add vcn_v4_0 ip dump support
      drm/amdgpu: add vcn_v4_0_5 ip dump support
      drm/amdgpu: add print support for vcn_v4_0_3 ip dump
      drm/amdgpu: add print support for vcn_v4_0 ip dump
      drm/amdgpu: add print support for vcn_v4_0_5 ip dump
      drm/amdgpu: add vcn_v1_0 ip dump support
      drm/amdgpu: add print support for vcn_v1_0 ip dump
      drm/amdgpu: add vcn_v2_0 ip dump support
      drm/amdgpu: add print support for vcn_v2_0 ip dump
      drm/amdgpu: add vcn_v2_5 ip dump support
      drm/amdgpu: add print support for vcn_v2_5 ip dump
      drm/amdgpu: add vcn ip dump support for vcn_v2_6
      drm/amdgpu: Move the dumping log out of for loop

Suraj Kandpal (8):
      drm/i915/hdcp: Add encoder check in intel_hdcp_get_capability
      drm/i915/hdcp: Add encoder check in hdcp2_get_capability
      drm/xe/hdcp: Check GSC structure validity
      drm/i915/dp: Clear VSC SDP during post ddi disable routine
      drm/i915/hdcp: Fix HDCP2_STREAM_STATUS macro
      drm/i915/dpkgc: Add VRR condition for DPKGC Enablement
      drm/i915/hdcp: Use correct cp_irq_count
      drm/i915/pps: Disable DPLS_GATING around pps sequence

T.J. Mercier (1):
      dma-buf: heaps: Deduplicate docs and adopt common format

Tao Zhou (3):
      drm/amdgpu: create function to check RAS RMA status
      drm/amdgpu: update bad state check in GPU recovery
      drm/amdgpu: report bad status in GPU recovery

Tejas Upadhyay (7):
      drm/xe/xe2: Make subsequent L2 flush sequential
      drm/xe/xe2: Add Wa_15015404425
      drm/xe/xe2hpg: Add Wa_14021821874
      drm/xe: Move enable host l2 VRAM post MCR init
      drm/xe: Write all slices if its mcr register
      drm/xe: Define STATELESS_COMPRESSION_CTRL as mcr register
      drm/xe/xe2hpg: Add Wa_15016589081

Tejas Vipin (7):
      drm/mipi-dsi: add more multi functions for better error handling
      drm/panel: startek-kd070fhfid015: transition to mipi_dsi wrapped func=
tions
      drm/panel: mantix-mlaf057we51: transition to mipi_dsi wrapped functio=
ns
      drm/panel: mantix-mlaf057we51: write hex in lowercase
      drm/mipi-dsi: Add mipi_dsi_dcs_set_tear_scanline_multi
      drm/panel: jdi-fhd-r63452: transition to mipi_dsi wrapped functions
      drm/panel: novatek-nt35950: transition to mipi_dsi wrapped functions

Terry Hsiao (2):
      drm/panel-edp: Add 6 panels used by MT8186 Chromebooks
      drm/panel-edp: Fix HKC MB116AN01 name

Thomas Hellstr=C3=B6m (10):
      drm/xe: Use write-back caching mode for system memory on DGFX
      drm/ttm: Allow TTM LRU list nodes of different types
      drm/ttm: Slightly clean up LRU list iteration
      drm/ttm: Use LRU hitches
      drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk
sublist moves
      drm/ttm: Provide a generic LRU walker helper
      drm/ttm: Use the LRU walker helper for swapping
      drm/ttm: Use the LRU walker for eviction
      drm/xe: Use separate rpm lockdep map for non-d3cold-capable devices
      drm/xe: Use xe_pm_runtime_get in xe_bo_move() if reclaim-safe.

Thomas Wei=C3=9Fschuh (2):
      drm/amdgpu: convert bios_hardcoded_edid to drm_edid
      drm/radeon: convert bios_hardcoded_edid to drm_edid

Thomas Zimmermann (52):
      drm/mgag200: Only set VIDRST bits in CRTC modesetting
      drm/mgag200: Remove vidrst callbacks from struct mgag200_device_funcs
      drm/mgag200: Rename BMC vidrst names
      drm/mgag200: Use hexadecimal register indeces
      drm/mgag200: Align register field names with documentation
      drm/mgag200: Use adjusted mode values for CRTCs
      drm/mgag200: Add dedicated variables for blanking fields
      drm/mgag200: Add dedicted variable for <linecomp> field
      drm/mgag200: Add vblank support
      drm/mgag200: Implement struct drm_crtc_funcs.get_vblank_timestamp
      Merge drm/drm-next into drm-misc-next
      drm/ast: astdp: Test firmware status once during probing
      drm/ast: astdp: Only test HDP state in ast_astdp_is_connected()
      drm/ast: astdp: Perform link training during atomic_enable
      drm/ast: astdp: Clean up EDID reading
      drm/mgag200: Fix VBLANK interrupt handling
      drm/i915: Use backlight power constants
      drm/mgag200: Add VGA-BMC output
      drm/mgag200: vga-bmc: Transparently handle BMC
      drm/mgag200: vga-bmc: Control CRTC VIDRST flag from encoder
      drm/mgag200: vga-bmc: Control BMC scanout from encoder
      drm/mgag200: Remove BMC output
      Merge drm/drm-next into drm-misc-next
      drm: Do delayed switcheroo in drm_lastclose()
      drm/amdgpu: Do not set struct drm_driver.lastclose
      drm/nouveau: Do not set struct drm_driver.lastclose
      drm/nouveau: Do not set struct drm_mode_config_funcs.output_poll_chan=
ged
      drm/nouveau: Implement switcheroo reprobe with drm_client_dev_hotplug=
()
      drm/fbdev-helper: Update documentation on obsolete callbacks
      drm/fbdev-helper: Remove drm_fb_helper_output_poll_changed()
      drm: Remove struct drm_driver.lastclose
      drm: Remove struct drm_mode_config_funcs.output_poll_changed
      drm/amdgpu: Use backlight power constants
      drm/panel: panel-novatak-nt35510: Use backlight power constants
      drm/panel: panel-orisetech-otm8009a: Use backlight power constants
      drm/panel: panel-samsung-s6e63j0x03: Use backlight power constants
      drm/panel: panel-samsung-s6e3ha2: Use backlight power constants
      drm/panel: panel-sony-acx565akm: Use backlight power constants
      drm/radeon: Use backlight power constants
      drm/tilcdc: Use backlight power constants
      drm/ast: Move code for physical outputs into separate files
      drm/ast: Add struct ast_connector
      drm/ast: astdp: Move locking into EDID helper
      drm/ast: astdp: Use struct drm_edid and helpers
      drm/ast: astdp: Simplify power management when detecting display
      drm/ast: astdp: Transparently handle BMC support
      drm/ast: dp501: Use struct drm_edid and helpers
      drm/ast: dp501: Transparently handle BMC support
      drm/ast: sil164: Transparently handle BMC support
      drm/ast: vga: Transparently handle BMC support
      drm/ast: Remove BMC output
      drm/xe: Support 'nomodeset' kernel command-line option

Thorsten Blum (2):
      drm/xe/oa: Use vma_pages() helper function in xe_oa_mmap()
      drm/tegra: hub: Use fn parameter directly to fix Coccinelle warning

Tim Huang (6):
      drm/amdgpu: add missed harvest check for VCN IP v4/v5
      drm/amd/pm: fix unchecked return value warning for vega10_hwmgr
      drm/amdgpu: fix unchecked return value warning for amdgpu_gfx
      drm/amdgpu: fix unchecked return value warning for amdgpu_atombios
      drm/amd/display: fix double free issue during amdgpu module unload
      drm/amd/pm: ensure the fw_info is not null before using it

Tobias Jakobi (5):
      drm/amd: Make amd_ip_funcs static for SDMA v5.0
      drm/amd: Make amd_ip_funcs static for SDMA v5.2
      drm/amdgpu/swsmu: fix SMU11 typos (memlk -> memclk)
      drm/amd/display: Avoid race between dcn10_set_drr() and
dc_state_destruct()
      drm/amd/display: Avoid race between dcn35_set_drr() and
dc_state_destruct()

Tom Chung (5):
      drm/amd/display: Disable replay if VRR capability is false
      drm/amd/display: Fix VRR cannot enable
      drm/amd/display: Add a missing PSR state
      drm/amd/display: Reset VRR config during resume
      drm/amd/display: Re-enable panel replay feature

Trigger Huang (2):
      drm/amdgpu: skip printing vram_lost if needed
      drm/amdgpu: Do core dump immediately when job tmo

Tvrtko Ursulin (13):
      drm/v3d: Prevent out of bounds access in performance query extensions
      drm/v3d: Fix potential memory leak in the timestamp extension
      drm/v3d: Fix potential memory leak in the performance extension
      drm/v3d: Validate passed in drm syncobj handles in the timestamp exte=
nsion
      drm/v3d: Validate passed in drm syncobj handles in the
performance extension
      drm/v3d: Move part of copying of reset/copy performance
extension to a helper
      drm/v3d: Size the kperfmon_ids array at runtime
      drm/v3d: Do not use intermediate storage when copying
performance query results
      drm/v3d: Move perfmon init completely into own unit
      drm/v3d: Prefer get_user for scalar types
      drm/v3d: Add some local variables in queries/extensions
      drm/amdpgu: Micro-optimise amdgpu_ring_commit
      drm/i915: 2 GiB of relocations ought to be enough for anybody*

Ulf Hansson (1):
      drm/tegra: gr3d: Convert into dev_pm_domain_attach|detach_list()

Uma Shankar (1):
      drm/xe/fbdev: Limit the usage of stolen for LNL+

Umesh Nerlige Ramappa (5):
      i915/perf: Remove code to update PWR_CLK_STATE for gen12
      drm/xe: Move part of xe_file cleanup to a helper
      drm/xe: Add ref counting for xe_file
      drm/xe: Take a ref to xe file when user creates a VM
      drm/xe: Fix use after free when client stats are captured

Val Packett (2):
      drm/rockchip: vop: clear DMA stop bit on RK3066
      drm/rockchip: vop: enable VOP_FEATURE_INTERNAL_RGB on RK3066

Venkata Narendra Kumar Gutta (1):
      drm/amdgpu: Add MFD support for ISP I2C bus

Victor Skvortsov (4):
      Revert "drm/amdgpu: Extend KIQ reg polling wait for VF"
      drm/amdgpu: Disable dpm_enabled flag while VF is in reset
      drm/amdgpu: Block MMR_READ IOCTL in reset
      drm/amdgpu: abort KIQ waits when there is a pending reset

Victor Zhao (3):
      drm/amd/sriov: extend NV_MAILBOX_POLL_MSG_TIMEDOUT
      drm/amd/amdgpu: allow use kiq to do hdp flush under sriov
      drm/amd/amdgpu: move drain_workqueue before shutdown is set

Vignesh Raman (9):
      drm/ci: uprev IGT
      drm/ci: arm64.config: Enable CONFIG_DRM_ANALOGIX_ANX7625
      drm/ci: skip tools_test on non-intel platforms
      drm/ci: mediatek: add tests for mediatek display driver
      drm/ci: mediatek: add tests for powervr gpu driver
      drm/ci: meson: add tests for meson display driver
      drm/ci: rockchip: add tests for rockchip display driver
      drm/ci: uprev mesa
      drm/ci: increase timeout for all jobs

Ville Syrj=C3=A4l=C3=A4 (28):
      drm/i915: Calculate vblank delay more accurately
      drm/i915: Make vrr_{enabling,disabling}() usable outside intel_displa=
y.c
      drm/i915/fbc: Extract intel_fbc_has_fences()
      drm/i915/fbc: Convert to intel_display, mostly
      drm/i915/fbc: s/_intel_fbc_cfb_stride()/intel_fbc_plane_cfb_stride()/
      drm/i915/fbc: Extract intel_fbc_max_plane_size()
      drm/i915/fbc: Extract intel_fbc_max_surface_size()
      drm/i915/fbc:
s/intel_fbc_hw_tracking_covers_screen()/intel_fbc_surface_size_ok()/
      drm/i915/fbc: Adjust g4x+ platform checks
      drm/i915/fbc: Extract _intel_fbc_cfb_stride()
      drm/i915/fbc: s/lines/height/
      drm/i915/fbc: Reoder CFB max height platform checks
      drm/i915/fbc: Extract intel_fbc_max_cfb_height()
      drm/i915/fbc: Extract _intel_fbc_cfb_size()
      drm/i915/fbc: Extract intel_fbc_cfb_cpp()
      drm/i915: Fix readout degamma_lut mismatch on ilk/snb
      drm/i915/dsb: Hook up DSB error interrupts
      drm/i915/dsb: Convert dewake_scanline to a hw scanline number earlier
      drm/i915/dsb: Shuffle code around
      drm/i915/dsb: Fix dewake scanline
      drm/i915/dsb: Account for VRR properly in DSB scanline stuff
      drm/i915/dsb: Precompute DSB_CHICKEN
      drm/i915/dsb: Introduce intel_dsb_wait_scanline_{in,out}()
      drm/i915/dsb: Introduce intel_dsb_chain()
      drm/i915/dsb: Allow intel_dsb_chain() to use DSB_WAIT_FOR_VBLANK
      drm/i915/dsb: Clear DSB_ENABLE_DEWAKE once the DSB is done
      drm/i915/dsb: s/dsb/dsb_color_vblank/
      drm/i915/dsb: Use chained DSBs for LUT programming

Vinod Govindapillai (1):
      drm/xe/display: handle HPD polling in display runtime suspend/resume

Vladimir Lypak (4):
      drm/msm/a5xx: disable preemption in submits by default
      drm/msm/a5xx: properly clear preemption records on resume
      drm/msm/a5xx: fix races in preemption evaluation stage
      drm/msm/a5xx: workaround early ring-buffer emptiness check

WangYuli (2):
      drm/amd/amdgpu: Properly tune the size of struct
      drm/ci: Upgrade setuptools requirement to 70.0.0

Wayne Lin (1):
      drm/amd/display: Check null pointer before try to access it

Wenjing Liu (4):
      drm/amd/display: fix dscclk programming sequence on DCN401
      drm/amd/display: apply vmin optimization even if it doesn't
reach vmin level
      drm/amd/display: fix minor coding errors where dml21 phase 5
uses wrong variables
      drm/amd/display: apply vmin optimization even if it doesn't
reach vmin level

Wu Hoi Pok (6):
      drm/radeon: change variable name "dev" to "ddev" for consistency
      drm/radeon: remove load callback from kms_driver
      drm/radeon: use variable flags as parameter
      drm/radeon: add helper rdev_to_drm(rdev)
      drm/radeon: change rdev->ddev to rdev_to_drm(rdev)
      drm/radeon: change drm_dev_alloc to devm_drm_dev_alloc

Xiaogang Chen (1):
      drm/amdkfd: Change kfd/svm page fault drain handling

Yang Wang (3):
      drm/amdgpu: remove RAS unused paramter 'err_addr'
      drm/amdgpu: fixing rlc firmware loading failure issue
      drm/amdgpu: add list empty check to avoid null pointer issue

Yannick Fertre (3):
      drm/stm: ltdc: reset plane transparency after plane disable
      drm/stm: ltdc: add mask for lxcr register
      drm/stm: ltdc: remove reload interrupt

YiPeng Chai (4):
      drm/amdgpu: optimize umc v12 address conversion function
      drm/amdgpu: optimize logging deferred error info
      drm/amdgpu: Remove unused code
      drm/amdgpu: fix ras UE error injection failure issue

Yifan Zhang (3):
      drm/amdgpu: skip kfd init if GFX is not ready.
      drm/amdgpu: use CPU for page table update if SDMA is unavailable
      drm/amdkfd: Don't drain ih1 for APU

Yinjie Yao (1):
      drm/amdgpu: Update kmd_fw_shared for VCN5

Yu Jiaoliang (1):
      drm/i915/gt: Use kmemdup_array instead of kmemdup for multiple alloca=
tion

Yuesong Li (1):
      drivers:drm:exynos_drm_gsc:Fix wrong assignment in gsc_bind()

Zaeem Mohamed (2):
      drm/amdgpu/display: SPDX copyright for spl_os_types.h
      drm/amdgpu/display: remove unnecessary TODO spl_os_types.h

Zenghui Yu (2):
      accel/qaic: Remove the description of DRM_IOCTL_QAIC_PART_DEV
      MAINTAINERS: Add selftests to DMA-BUF HEAPS FRAMEWORK entry

Zhang Zekun (2):
      drm/hisilicon: Remove unused delarations
      drm/amd: Remove unused declarations

Zhaoxiong Lv (9):
      drm/panel: boe-th101mb31ig002 : Make it compatible with other panel.
      drm/panel: boe-th101mb31ig002: switch to
devm_gpiod_get_optional() for reset_gpio
      drm/panel: boe-th101mb31ig002: use wrapped MIPI DCS functions
      dt-bindings: display: panel: Add compatible for starry-er88577
      drm/panel: boe-th101mb31ig002: Support for starry-er88577 MIPI-DSI pa=
nel
      drm/panel: boe-th101mb31ig002 : Fix the way to get porch parameters
      drm/panel: boe-th101mb31ig002 : using
drm_connector_helper_get_modes_fixed()
      drm/panel: jd9365da: Move "exit sleep mode" and "set display on" cmds
      drm/panel: jd9365da: Modify the init code of Melfas

ZhenGuo Yin (1):
      drm/amdgpu: reset vm state machine after gpu reset(vram lost)

renjun wang (2):
      drm/atomic: fix kerneldoc for fake_commit field
      drm: Fix kerneldoc for "Returns" section

 .mailmap                                           |    4 +
 .../ABI/testing/sysfs-driver-intel-i915-hwmon      |    8 +
 Documentation/accel/qaic/qaic.rst                  |    6 -
 .../bindings/display/bridge/toshiba,tc358767.yaml  |   21 +-
 .../bindings/display/mediatek/mediatek,dpi.yaml    |   17 +
 .../devicetree/bindings/display/msm/hdmi.yaml      |   28 +-
 .../display/panel/boe,th101mb31ig002-28a.yaml      |   21 +-
 .../bindings/display/panel/boe,tv101wum-ll2.yaml   |   63 +
 .../bindings/display/panel/himax,hx8394.yaml       |   17 +-
 .../bindings/display/panel/ilitek,ili9806e.yaml    |    1 +
 .../bindings/display/panel/jadard,jd9365da-h3.yaml |    1 +
 .../bindings/display/panel/panel-simple.yaml       |    4 +
 .../bindings/display/panel/sitronix,st7701.yaml    |   69 +-
 .../bindings/display/renesas,rzg2l-du.yaml         |   32 +-
 .../devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml |    1 +
 Documentation/gpu/amdgpu/driver-core.rst           |    2 +-
 Documentation/gpu/introduction.rst                 |   10 +-
 Documentation/gpu/todo.rst                         |   65 +-
 Documentation/gpu/xe/xe_mm.rst                     |   15 +
 MAINTAINERS                                        |   20 +-
 arch/powerpc/kernel/nvram_64.c                     |    8 +-
 arch/powerpc/platforms/powernv/opal-kmsg.c         |    4 +-
 arch/um/kernel/kmsg_dump.c                         |    2 +-
 drivers/accel/drm_accel.c                          |  110 +-
 drivers/accel/ivpu/ivpu_fw.c                       |    4 +
 drivers/dma-buf/dma-fence-array.c                  |   78 +-
 drivers/dma-buf/dma-heap.c                         |   33 +-
 drivers/gpu/drm/Kconfig                            |   33 +-
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/amd/amdgpu/Makefile                |   18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   35 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   48 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   22 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c   |    2 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |    7 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c    |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |   16 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h |    9 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c |   18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |  105 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h  |    9 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   36 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |   35 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   96 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c   |   32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h   |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  144 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h           |    2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  458 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   38 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfxhub.h         |    2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |   17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   87 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   62 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |   14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  162 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   39 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h          |    2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   73 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   33 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |    6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c       |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c          |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |  102 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |    5 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c       |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |    8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  109 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c         |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |    4 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |    4 +
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |   38 +-
 drivers/gpu/drm/amd/amdgpu/cikd.h                  |    1 +
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |    2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |    2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  397 ++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  369 ++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.h             |    3 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3.c           |    2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  345 +++-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |   77 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   76 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  375 ++++-
 .../gpu/drm/amd/amdgpu/gfx_v9_0_cleaner_shader.h   |   26 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  694 +++++++-
 .../drm/amd/amdgpu/gfx_v9_4_3_cleaner_shader.asm   |  153 ++
 .../gpu/drm/amd/amdgpu/gfx_v9_4_3_cleaner_shader.h |   64 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |   18 -
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |   17 -
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |    4 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |    2 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c              |    2 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c              |    2 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v7_0.c              |    2 +-
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.c            |   57 +-
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.h            |   11 +
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c            |   57 +-
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.h            |   11 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             |   76 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.h             |   11 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |   63 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.h             |    6 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |    2 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |    1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |    1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.h             |    1 -
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |   93 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.h           |    7 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |    1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |    3 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  166 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |   66 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |   21 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h              |    2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |  102 ++
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  104 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |  106 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.h             |    1 -
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  106 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.h             |    1 -
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |  112 ++
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |  113 ++
 drivers/gpu/drm/amd/amdgpu/soc15.h                 |    4 +
 drivers/gpu/drm/amd/amdgpu/soc15d.h                |    4 +
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |  177 +-
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.h             |    5 +
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |    2 +-
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |    2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |  112 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |  113 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  118 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  113 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  114 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |  115 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |  113 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |  110 +-
 drivers/gpu/drm/amd/amdgpu/vid.h                   |    1 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  142 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |    8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c             |   20 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   48 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  431 ++++-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |   21 +
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |   22 +
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c   |   71 -
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c   |    9 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |   58 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |    6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |   14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h    |    5 +-
 .../gpu/drm/amd/amdkfd/kfd_pm4_headers_aldebaran.h |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   47 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |    4 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |   85 +-
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c             |  373 +++++
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |   45 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  132 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |    5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   55 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |    5 +
 drivers/gpu/drm/amd/amdkfd/soc15_int.h             |    1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  180 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   60 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |    5 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   30 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  143 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |    8 +-
 drivers/gpu/drm/amd/display/dc/Makefile            |    1 -
 drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c |   27 +
 .../gpu/drm/amd/display/dc/bios/command_table2.c   |    2 +-
 .../amd/display/dc/clk_mgr/dce110/dce110_clk_mgr.c |    2 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |   34 +-
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |  303 +++-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  211 +--
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |  225 ++-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   56 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stat.c      |    1 +
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |   14 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   27 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   95 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   24 +-
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |    7 -
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |  102 +-
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.h  |    1 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |   12 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   20 +
 .../gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.h |   17 +-
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c | 1469 ++++++++++++++++=
-
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.h |    1 +
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c   |   32 +-
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.h   |    4 -
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |    6 +
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.h     |    1 +
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |   10 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |    3 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |   20 +-
 .../display/dc/dce110/dce110_timing_generator.c    |    1 +
 .../display/dc/dce110/dce110_timing_generator.h    |    1 +
 .../display/dc/dce110/dce110_timing_generator_v.c  |    1 +
 .../display/dc/dce120/dce120_timing_generator.c    |    1 +
 .../amd/display/dc/dce60/dce60_timing_generator.c  |    3 +-
 .../amd/display/dc/dce80/dce80_timing_generator.c  |    3 +-
 drivers/gpu/drm/amd/display/dc/dcn10/Makefile      |    2 -
 .../gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c |    2 +
 drivers/gpu/drm/amd/display/dc/dcn20/Makefile      |    3 +-
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |    6 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c |    6 +-
 drivers/gpu/drm/amd/display/dc/dcn301/Makefile     |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn303/Makefile     |   13 -
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile      |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn314/Makefile     |   10 -
 drivers/gpu/drm/amd/display/dc/dcn401/Makefile     |   10 -
 drivers/gpu/drm/amd/display/dc/dio/Makefile        |   18 +
 .../dc/{ =3D> dio}/dcn301/dcn301_dio_link_encoder.c  |    0
 .../dc/{ =3D> dio}/dcn301/dcn301_dio_link_encoder.h  |    0
 .../{ =3D> dio}/dcn314/dcn314_dio_stream_encoder.c   |    0
 .../{ =3D> dio}/dcn314/dcn314_dio_stream_encoder.h   |    0
 .../dc/dio/dcn321/dcn321_dio_link_encoder.c        |    1 -
 .../dc/dio/dcn35/dcn35_dio_stream_encoder.c        |   29 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |    3 +
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |    5 +-
 .../display/dc/dml/dcn20/display_rq_dlg_calc_20.c  |    2 +-
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c        |    2 +-
 .../display/dc/dml/dcn21/display_rq_dlg_calc_21.c  |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   11 +-
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |    4 +-
 .../drm/amd/display/dc/dml/display_mode_structs.h  |    1 +
 .../amd/display/dc/dml/dml1_display_rq_dlg_calc.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/dml2/Makefile       |    8 -
 .../dc/dml2/dml21/dml21_translation_helper.c       |  114 +-
 .../dc/dml2/dml21/dml21_translation_helper.h       |    1 +
 .../drm/amd/display/dc/dml2/dml21/dml21_utils.c    |  169 +-
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |    4 +-
 .../dc/dml2/dml21/inc/bounding_boxes/dcn3_soc_bb.h |    8 +-
 .../dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h |   25 +-
 .../drm/amd/display/dc/dml2/dml21/inc/dml_top.h    |    1 -
 .../dc/dml2/dml21/inc/dml_top_dchub_registers.h    |    1 -
 .../dc/dml2/dml21/inc/dml_top_display_cfg_types.h  |    3 +-
 .../dc/dml2/dml21/inc/dml_top_policy_types.h       |    1 -
 .../dml2/dml21/inc/dml_top_soc_parameter_types.h   |   17 +-
 .../amd/display/dc/dml2/dml21/inc/dml_top_types.h  |   14 +-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c   |  127 +-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.h   |    1 -
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |  985 ++++++-----
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.h     |    2 +-
 .../dml2/dml21/src/dml2_core/dml2_core_factory.c   |    3 +-
 .../dml2/dml21/src/dml2_core/dml2_core_factory.h   |    1 -
 .../dc/dml2/dml21/src/dml2_core/dml2_core_shared.c |  222 +--
 .../dc/dml2/dml21/src/dml2_core/dml2_core_shared.h |   38 -
 .../dml21/src/dml2_core/dml2_core_shared_types.h   |   35 +-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_utils.c  |  631 +++++++
 .../dc/dml2/dml21/src/dml2_core/dml2_core_utils.h  |   39 +
 .../dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c   |  171 +-
 .../dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.h   |    1 -
 .../dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c   |    3 +-
 .../dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.h   |    1 -
 .../dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.c     |    1 -
 .../dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.h     |    1 -
 .../dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c  |    1 -
 .../dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.h  |    1 -
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c     |   12 +-
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.h     |    1 -
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c     | 1250 --------------
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.h     |   25 -
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |  568 ++++---
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.h  |    1 -
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c  |    8 +-
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.h  |    1 -
 .../src/dml2_standalone_libraries/lib_float_math.c |    1 -
 .../src/dml2_standalone_libraries/lib_float_math.h |    1 -
 .../dml21/src/dml2_top/dml2_top_optimization.c     |    2 -
 .../dml21/src/dml2_top/dml2_top_optimization.h     |    1 -
 .../display/dc/dml2/dml21/src/dml2_top/dml_top.c   |   23 +-
 .../dc/dml2/dml21/src/dml2_top/dml_top_mcache.c    |   23 +-
 .../dc/dml2/dml21/src/dml2_top/dml_top_mcache.h    |    1 -
 .../amd/display/dc/dml2/dml21/src/inc/dml2_debug.c |    1 -
 .../amd/display/dc/dml2/dml21/src/inc/dml2_debug.h |    1 -
 .../dml21/src/inc/dml2_internal_shared_types.h     |   27 +-
 .../drm/amd/display/dc/dml2/dml2_internal_types.h  |    1 +
 .../amd/display/dc/dml2/dml2_translation_helper.c  |   56 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |   10 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |    2 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |    1 +
 .../drm/amd/display/dc/dpp/dcn10/dcn10_dpp_cm.c    |    3 -
 .../gpu/drm/amd/display/dc/dpp/dcn35/dcn35_dpp.c   |   27 +-
 .../gpu/drm/amd/display/dc/dpp/dcn35/dcn35_dpp.h   |    3 +
 .../gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c |    3 +-
 .../drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c  |   19 +-
 .../amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c    |  668 ++++----
 .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c |    2 +-
 drivers/gpu/drm/amd/display/dc/dwb/Makefile        |    9 +
 .../display/dc/{ =3D> dwb}/dcn30/dcn30_cm_common.h   |    0
 .../drm/amd/display/dc/{ =3D> dwb}/dcn30/dcn30_dwb.c |    0
 .../drm/amd/display/dc/{ =3D> dwb}/dcn30/dcn30_dwb.h |    0
 .../amd/display/dc/{ =3D> dwb}/dcn30/dcn30_dwb_cm.c  |    0
 .../gpu/drm/amd/display/dc/dwb/dcn35/dcn35_dwb.c   |    1 -
 .../amd/display/dc/gpio/dcn401/hw_factory_dcn401.c |   16 +-
 drivers/gpu/drm/amd/display/dc/hpo/Makefile        |   15 +
 .../dc/{ =3D> hpo}/dcn31/dcn31_hpo_dp_link_encoder.c |    0
 .../dc/{ =3D> hpo}/dcn31/dcn31_hpo_dp_link_encoder.h |    0
 .../{ =3D> hpo}/dcn31/dcn31_hpo_dp_stream_encoder.c  |    0
 .../{ =3D> hpo}/dcn31/dcn31_hpo_dp_stream_encoder.h  |    0
 .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.c   |  387 ++---
 .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c |    3 +-
 .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.c |    3 +-
 .../gpu/drm/amd/display/dc/hubp/dcn35/dcn35_hubp.c |    2 +-
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |    5 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |   65 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |   45 +-
 .../gpu/drm/amd/display/dc/hwss/dcn10/dcn10_init.c |    2 -
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   54 +-
 .../gpu/drm/amd/display/dc/hwss/dcn20/dcn20_init.c |    1 -
 .../drm/amd/display/dc/hwss/dcn201/dcn201_init.c   |    1 -
 .../gpu/drm/amd/display/dc/hwss/dcn21/dcn21_init.c |    2 -
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |   21 +-
 .../gpu/drm/amd/display/dc/hwss/dcn30/dcn30_init.c |    1 -
 .../drm/amd/display/dc/hwss/dcn301/dcn301_init.c   |    1 -
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |    4 +-
 .../gpu/drm/amd/display/dc/hwss/dcn31/dcn31_init.c |    3 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |   13 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.h  |    2 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_init.c   |    3 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |  108 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.h    |    6 +-
 .../gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c |    3 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |   93 +-
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |    3 +-
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |    4 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |  235 ++-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h  |    3 +
 .../drm/amd/display/dc/hwss/dcn401/dcn401_init.c   |   10 +-
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |   19 +-
 .../drm/amd/display/dc/hwss/hw_sequencer_private.h |    5 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |    2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/audio.h      |    2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |    4 +-
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |    4 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |    6 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |    1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |   13 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h  |    2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/optc.h       |    5 +-
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |    2 +
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |    4 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/transform.h  |   10 -
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |    7 +
 .../amd/display/dc/link/accessories/link_dp_cts.c  |   13 +-
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.c   |    5 +-
 .../amd/display/dc/link/hwss/link_hwss_hpo_dp.c    |   12 +
 .../gpu/drm/amd/display/dc/link/link_detection.c   |    8 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   45 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |    3 +-
 .../display/dc/link/protocols/link_dp_capability.c |   69 +-
 .../dc/link/protocols/link_edp_panel_control.c     |   14 +-
 .../dc/link/protocols/link_edp_panel_control.h     |    2 +-
 drivers/gpu/drm/amd/display/dc/mmhubbub/Makefile   |    9 +
 .../dc/{ =3D> mmhubbub}/dcn20/dcn20_mmhubbub.c       |    0
 .../dc/{ =3D> mmhubbub}/dcn20/dcn20_mmhubbub.h       |    0
 drivers/gpu/drm/amd/display/dc/mpc/Makefile        |   27 +
 .../drm/amd/display/dc/{ =3D> mpc}/dcn10/dcn10_mpc.c |    0
 .../drm/amd/display/dc/{ =3D> mpc}/dcn10/dcn10_mpc.h |    0
 .../drm/amd/display/dc/{ =3D> mpc}/dcn20/dcn20_mpc.c |    0
 .../drm/amd/display/dc/{ =3D> mpc}/dcn20/dcn20_mpc.h |    0
 .../drm/amd/display/dc/{ =3D> mpc}/dcn30/dcn30_mpc.c |    2 +-
 .../drm/amd/display/dc/{ =3D> mpc}/dcn30/dcn30_mpc.h |    0
 drivers/gpu/drm/amd/display/dc/opp/Makefile        |   16 +
 .../drm/amd/display/dc/{ =3D> opp}/dcn10/dcn10_opp.c |    0
 .../drm/amd/display/dc/{ =3D> opp}/dcn10/dcn10_opp.h |    0
 .../drm/amd/display/dc/{ =3D> opp}/dcn20/dcn20_opp.c |    0
 .../drm/amd/display/dc/{ =3D> opp}/dcn20/dcn20_opp.h |    0
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c |   10 +-
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h |    7 +-
 .../gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c |    8 +-
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.c   |   36 +-
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.h   |    6 +-
 drivers/gpu/drm/amd/display/dc/resource/Makefile   |    2 -
 .../display/dc/resource/dce110/dce110_resource.c   |    1 +
 .../display/dc/resource/dce112/dce112_resource.c   |    5 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |    3 +-
 .../display/dc/resource/dcn201/dcn201_resource.c   |    4 +-
 .../amd/display/dc/resource/dcn21/dcn21_resource.c |    3 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |    1 +
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |   11 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.h |    5 +
 .../dc/resource/dcn32/dcn32_resource_helpers.c     |   14 +-
 .../display/dc/resource/dcn321/dcn321_resource.c   |    1 +
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |    2 +
 .../display/dc/resource/dcn401/dcn401_resource.c   |   11 +-
 .../display/dc/resource/dcn401/dcn401_resource.h   |    3 +-
 drivers/gpu/drm/amd/display/dc/spl/Makefile        |    2 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c        | 1355 +++++++++------
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.h        |    8 -
 .../gpu/drm/amd/display/dc/spl/dc_spl_filters.c    |   15 +
 .../gpu/drm/amd/display/dc/spl/dc_spl_filters.h    |   15 +
 .../drm/amd/display/dc/spl/dc_spl_isharp_filters.c |  352 +++-
 .../drm/amd/display/dc/spl/dc_spl_isharp_filters.h |   35 +-
 .../amd/display/dc/spl/dc_spl_scl_easf_filters.c   | 1726 ++++++++++++++++=
++++
 .../amd/display/dc/spl/dc_spl_scl_easf_filters.h   |   38 +
 .../drm/amd/display/dc/spl/dc_spl_scl_filters.c    |   92 +-
 .../drm/amd/display/dc/spl/dc_spl_scl_filters.h    |   55 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h  |  108 +-
 .../gpu/drm/amd/display/dc/spl/spl_custom_float.c  |  151 ++
 .../gpu/drm/amd/display/dc/spl/spl_custom_float.h  |   29 +
 drivers/gpu/drm/amd/display/dc/spl/spl_debug.h     |   25 +
 .../gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c    |  497 ++++++
 .../gpu/drm/amd/display/dc/spl/spl_fixpt31_32.h    |  525 ++++++
 drivers/gpu/drm/amd/display/dc/spl/spl_os_types.h  |   55 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    3 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   52 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |    4 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c  |    4 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |    4 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.c |    4 +
 drivers/gpu/drm/amd/display/include/fixed31_32.h   |    6 +
 drivers/gpu/drm/amd/display/include/logger_types.h |    1 +
 .../drm/amd/display/modules/hdcp/hdcp1_execution.c |   18 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |   75 +-
 .../drm/amd/include/asic_reg/uvd/uvd_4_0_sh_mask.h |    2 -
 drivers/gpu/drm/amd/include/atomfirmware.h         |    4 +-
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |    6 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |    1 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |    6 +-
 .../drm/amd/pm/powerplay/hwmgr/processpptables.c   |    2 +
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |    4 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |   11 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |    4 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |    4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |   11 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  898 +++++++++-
 drivers/gpu/drm/ast/Makefile                       |    4 +-
 drivers/gpu/drm/ast/ast_dp.c                       |  404 +++--
 drivers/gpu/drm/ast/ast_dp501.c                    |  184 ++-
 drivers/gpu/drm/ast/ast_drv.h                      |   43 +-
 drivers/gpu/drm/ast/ast_main.c                     |    6 +-
 drivers/gpu/drm/ast/ast_mode.c                     |  576 -------
 drivers/gpu/drm/ast/ast_post.c                     |    2 +-
 drivers/gpu/drm/ast/ast_reg.h                      |   22 +-
 drivers/gpu/drm/ast/ast_sil164.c                   |  127 ++
 drivers/gpu/drm/ast/ast_vga.c                      |  127 ++
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |    5 -
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   22 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |   17 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |   35 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |  103 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |    8 +-
 drivers/gpu/drm/bridge/nwl-dsi.h                   |    4 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   66 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |    7 +-
 drivers/gpu/drm/bridge/tc358767.c                  |   45 +-
 drivers/gpu/drm/ci/arm64.config                    |    1 +
 drivers/gpu/drm/ci/container.yml                   |    8 +
 drivers/gpu/drm/ci/gitlab-ci.yml                   |   39 +-
 drivers/gpu/drm/ci/igt_runner.sh                   |   11 +-
 drivers/gpu/drm/ci/image-tags.yml                  |    8 +-
 drivers/gpu/drm/ci/lava-submit.sh                  |    1 +
 drivers/gpu/drm/ci/test.yml                        |  142 +-
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt  |    2 +-
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt |   14 +-
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt  |    5 +-
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt      |   12 +-
 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt     |   41 +-
 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt      |    5 +-
 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt      |    2 +-
 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt       |    4 +-
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt       |   14 +-
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt      |    9 +-
 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt       |    5 +-
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt       |   24 +-
 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt      |    8 +-
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt       |    4 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt       |    2 +
 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt      |    2 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt       |    4 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt       |   25 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt       |    4 +-
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt       |   17 +-
 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt      |    2 +-
 drivers/gpu/drm/ci/xfails/i915-whl-skips.txt       |    5 +-
 .../gpu/drm/ci/xfails/mediatek-mt8173-fails.txt    |   10 +-
 .../gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt   |   32 +-
 .../gpu/drm/ci/xfails/mediatek-mt8173-skips.txt    |    5 +-
 .../gpu/drm/ci/xfails/mediatek-mt8183-fails.txt    |   28 +-
 .../gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt   |   20 +
 .../gpu/drm/ci/xfails/mediatek-mt8183-skips.txt    |    7 +-
 drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt     |   19 +-
 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt     |    7 +-
 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt    |    6 +-
 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt    |    3 +-
 drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt    |    1 -
 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt   |    2 +-
 drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt    |    5 +-
 .../xfails/msm-sc7180-trogdor-kingoftown-fails.txt |  146 --
 .../msm-sc7180-trogdor-kingoftown-flakes.txt       |   18 +-
 .../xfails/msm-sc7180-trogdor-kingoftown-skips.txt |    6 +-
 .../msm-sc7180-trogdor-lazor-limozeen-fails.txt    |  146 --
 .../msm-sc7180-trogdor-lazor-limozeen-flakes.txt   |   11 +-
 .../msm-sc7180-trogdor-lazor-limozeen-skips.txt    |    3 +-
 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt     |    1 -
 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt    |  105 +-
 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt     |    5 +-
 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt  |    1 +
 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt  |   23 +
 .../gpu/drm/ci/xfails/panfrost-mt8183-fails.txt    |    1 +
 .../gpu/drm/ci/xfails/panfrost-mt8183-skips.txt    |   23 +
 .../gpu/drm/ci/xfails/panfrost-rk3288-fails.txt    |    1 +
 .../gpu/drm/ci/xfails/panfrost-rk3288-skips.txt    |   26 +
 .../gpu/drm/ci/xfails/panfrost-rk3399-fails.txt    |    1 +
 .../gpu/drm/ci/xfails/panfrost-rk3399-flakes.txt   |    6 +
 .../gpu/drm/ci/xfails/panfrost-rk3399-skips.txt    |   26 +
 drivers/gpu/drm/ci/xfails/requirements.txt         |    2 +-
 .../gpu/drm/ci/xfails/rockchip-rk3288-fails.txt    |   22 +-
 .../gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt   |    6 +
 .../gpu/drm/ci/xfails/rockchip-rk3288-skips.txt    |   57 +-
 .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt    |   90 +-
 .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt   |   50 +-
 .../gpu/drm/ci/xfails/rockchip-rk3399-skips.txt    |   10 +-
 .../gpu/drm/ci/xfails/virtio_gpu-none-fails.txt    |   65 +-
 .../gpu/drm/ci/xfails/virtio_gpu-none-skips.txt    |    5 +-
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt      |    5 -
 drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt     |   21 +
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt      |  106 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |   66 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |  128 +-
 drivers/gpu/drm/drm_atomic.c                       |    6 -
 drivers/gpu/drm/drm_atomic_helper.c                |    2 -
 drivers/gpu/drm/drm_bridge.c                       |    9 +-
 drivers/gpu/drm/drm_connector.c                    |   83 +-
 drivers/gpu/drm/drm_crtc_internal.h                |   15 +
 drivers/gpu/drm/drm_displayid.c                    |    3 -
 drivers/gpu/drm/drm_drv.c                          |  100 +-
 drivers/gpu/drm/drm_edid.c                         |   24 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   39 +-
 drivers/gpu/drm/drm_file.c                         |   41 +-
 drivers/gpu/drm/drm_gem.c                          |    7 +-
 drivers/gpu/drm/drm_internal.h                     |    5 -
 drivers/gpu/drm/drm_mipi_dsi.c                     |  225 +++
 drivers/gpu/drm/drm_mode_config.c                  |    2 +
 drivers/gpu/drm/drm_modes.c                        |    1 -
 drivers/gpu/drm/drm_panel.c                        |   18 +
 drivers/gpu/drm/drm_panic.c                        |  406 ++++-
 drivers/gpu/drm/drm_panic_qr.rs                    | 1003 ++++++++++++
 drivers/gpu/drm/drm_prime.c                        |   84 +-
 drivers/gpu/drm/drm_print.c                        |   13 +-
 drivers/gpu/drm/drm_probe_helper.c                 |   12 +-
 drivers/gpu/drm/drm_rect.c                         |    1 -
 drivers/gpu/drm/drm_vblank.c                       |   83 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |    2 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |    4 -
 drivers/gpu/drm/exynos/exynos_drm_fimc.c           |    2 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c            |    4 +-
 drivers/gpu/drm/exynos/exynos_drm_scaler.c         |    2 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c            |    2 +-
 drivers/gpu/drm/gma500/intel_bios.c                |   22 +-
 drivers/gpu/drm/gma500/intel_bios.h                |    4 +-
 drivers/gpu/drm/gma500/intel_gmbus.c               |    2 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |    2 +-
 drivers/gpu/drm/gma500/psb_intel_drv.h             |    2 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c            |    4 +-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c            |   26 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h    |    1 -
 drivers/gpu/drm/i915/display/dvo_ch7017.c          |   14 +-
 drivers/gpu/drm/i915/display/dvo_ch7xxx.c          |   18 +-
 drivers/gpu/drm/i915/display/dvo_ivch.c            |   16 +-
 drivers/gpu/drm/i915/display/dvo_ns2501.c          |   18 +-
 drivers/gpu/drm/i915/display/dvo_sil164.c          |   18 +-
 drivers/gpu/drm/i915/display/dvo_tfp410.c          |   18 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |  155 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |    3 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c             |    2 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |   12 +-
 drivers/gpu/drm/i915/display/intel_acpi.c          |   17 +-
 drivers/gpu/drm/i915/display/intel_acpi.h          |   18 +-
 drivers/gpu/drm/i915/display/intel_alpm.c          |   56 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |    6 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |   39 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |   22 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |  883 +++++-----
 drivers/gpu/drm/i915/display/intel_bios.h          |   28 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |    5 +-
 drivers/gpu/drm/i915/display/intel_color.c         |   56 +-
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |    8 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |    3 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |   24 +-
 drivers/gpu/drm/i915/display/intel_ddi.h           |    3 +-
 drivers/gpu/drm/i915/display/intel_display.c       |   53 +-
 drivers/gpu/drm/i915/display/intel_display.h       |    3 +
 drivers/gpu/drm/i915/display/intel_display_core.h  |    2 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   19 +-
 .../i915/display/intel_display_debugfs_params.c    |    8 +-
 .../i915/display/intel_display_debugfs_params.h    |    4 +-
 .../gpu/drm/i915/display/intel_display_device.c    |  242 ++-
 .../gpu/drm/i915/display/intel_display_device.h    |   21 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |   36 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |   66 +-
 .../gpu/drm/i915/display/intel_display_params.c    |    6 +-
 .../gpu/drm/i915/display/intel_display_params.h    |    4 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |   28 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |    5 -
 .../drm/i915/display/intel_display_power_well.c    |   19 +-
 drivers/gpu/drm/i915/display/intel_display_reset.c |    7 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   62 +-
 drivers/gpu/drm/i915/display/intel_display_wa.h    |    8 +
 drivers/gpu/drm/i915/display/intel_dmc.c           |    2 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  290 ++--
 drivers/gpu/drm/i915/display/intel_dp.h            |    3 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |  114 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.h        |    4 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |   70 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |   13 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  237 ++-
 .../gpu/drm/i915/display/intel_dp_link_training.h  |    6 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  100 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.h        |    1 +
 drivers/gpu/drm/i915/display/intel_dp_tunnel.c     |   77 +-
 drivers/gpu/drm/i915/display/intel_dp_tunnel.h     |   11 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |    9 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |    3 +-
 drivers/gpu/drm/i915/display/intel_dpt.c           |    4 +
 drivers/gpu/drm/i915/display/intel_dpt.h           |    3 +
 drivers/gpu/drm/i915/display/intel_dsb.c           |  325 +++-
 drivers/gpu/drm/i915/display/intel_dsb.h           |   16 +
 drivers/gpu/drm/i915/display/intel_dsi.h           |    2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |   20 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |   14 +-
 drivers/gpu/drm/i915/display/intel_dvo_dev.h       |    2 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |   36 +
 drivers/gpu/drm/i915/display/intel_fb.h            |    2 +
 drivers/gpu/drm/i915/display/intel_fbc.c           |  555 ++++---
 drivers/gpu/drm/i915/display/intel_fbc.h           |   13 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |    6 +-
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |    2 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |    7 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |    4 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   23 +-
 .../gpu/drm/i915/display/intel_hdcp_gsc_message.c  |   67 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |  500 +++---
 drivers/gpu/drm/i915/display/intel_hdmi.h          |    1 -
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |    6 +-
 drivers/gpu/drm/i915/display/intel_hti.c           |   20 +-
 drivers/gpu/drm/i915/display/intel_hti.h           |    8 +-
 drivers/gpu/drm/i915/display/intel_link_bw.c       |   29 +-
 drivers/gpu/drm/i915/display/intel_link_bw.h       |    2 -
 drivers/gpu/drm/i915/display/intel_load_detect.c   |   27 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c        |  115 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |    5 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |    2 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |  322 ++--
 drivers/gpu/drm/i915/display/intel_opregion.h      |   62 +-
 drivers/gpu/drm/i915/display/intel_pch_display.c   |    3 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c      |    2 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |  567 ++++---
 drivers/gpu/drm/i915/display/intel_pps.h           |   10 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  852 +++++-----
 drivers/gpu/drm/i915/display/intel_psr.h           |    8 +-
 drivers/gpu/drm/i915/display/intel_quirks.c        |    2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   33 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |  209 +--
 drivers/gpu/drm/i915/display/intel_tc.c            |    3 +
 drivers/gpu/drm/i915/display/intel_tv.c            |  204 +--
 drivers/gpu/drm/i915/display/intel_tv.h            |    6 +-
 drivers/gpu/drm/i915/display/intel_vblank.c        |  125 +-
 drivers/gpu/drm/i915/display/intel_vblank.h        |    2 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |   41 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   51 +-
 drivers/gpu/drm/i915/display/intel_vdsc.h          |    4 +
 drivers/gpu/drm/i915/display/intel_vrr.c           |  130 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   16 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |   24 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |    5 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |    8 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |   30 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |    1 -
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |    2 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |    2 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |    2 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |    1 -
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |    1 -
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |    1 +
 drivers/gpu/drm/i915/gt/intel_gt.h                 |    7 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |    2 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |    2 +
 drivers/gpu/drm/i915/gt/intel_reset.c              |   12 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |   25 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c         |    2 +-
 drivers/gpu/drm/i915/gt/sysfs_engines.c            |    5 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h      |    1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |   18 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |    7 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |    2 +-
 drivers/gpu/drm/i915/gvt/edid.c                    |   28 +-
 drivers/gpu/drm/i915/gvt/edid.h                    |    4 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c                   |   18 +-
 drivers/gpu/drm/i915/gvt/opregion.c                |    2 +-
 drivers/gpu/drm/i915/gvt/trace.h                   |    2 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |    3 +-
 drivers/gpu/drm/i915/i915_driver.c                 |   44 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   21 +-
 drivers/gpu/drm/i915/i915_gem.c                    |    2 -
 drivers/gpu/drm/i915/i915_gem_gtt.c                |    1 -
 drivers/gpu/drm/i915/i915_gpu_error.c              |    3 +-
 drivers/gpu/drm/i915/i915_hwmon.c                  |   88 +
 drivers/gpu/drm/i915/i915_irq.c                    |    1 -
 drivers/gpu/drm/i915/i915_mm.c                     |   12 +-
 drivers/gpu/drm/i915/i915_mm.h                     |    3 +-
 drivers/gpu/drm/i915/i915_module.c                 |    9 +-
 drivers/gpu/drm/i915/i915_params.c                 |    3 +-
 drivers/gpu/drm/i915/i915_pci.c                    |    7 +-
 drivers/gpu/drm/i915/i915_reg.h                    |    6 +
 drivers/gpu/drm/i915/i915_sysfs.c                  |    4 +-
 drivers/gpu/drm/i915/i915_utils.c                  |   51 +-
 drivers/gpu/drm/i915/i915_utils.h                  |   16 +-
 drivers/gpu/drm/i915/i915_vma.h                    |    1 -
 drivers/gpu/drm/i915/intel_device_info.c           |    7 -
 drivers/gpu/drm/i915/intel_device_info.h           |    2 -
 drivers/gpu/drm/i915/intel_step.c                  |   84 +-
 drivers/gpu/drm/i915/intel_step.h                  |    3 -
 drivers/gpu/drm/i915/intel_uncore.c                |    7 +-
 .../gpu/drm/i915/selftests/intel_memory_region.c   |    2 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |    2 +-
 drivers/gpu/drm/imagination/pvr_device.h           |    2 +-
 drivers/gpu/drm/imagination/pvr_queue.c            |    4 +-
 drivers/gpu/drm/imx/ipuv3/parallel-display.c       |   14 +-
 drivers/gpu/drm/lima/lima_sched.c                  |    2 +-
 drivers/gpu/drm/loongson/lsdc_ttm.c                |    8 +-
 drivers/gpu/drm/mediatek/mtk_crtc.c                |   82 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |   36 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |    5 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |   13 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  106 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c               |   13 +-
 drivers/gpu/drm/mediatek/mtk_plane.c               |   29 +-
 drivers/gpu/drm/mediatek/mtk_plane.h               |    3 +-
 drivers/gpu/drm/mgag200/Makefile                   |    1 +
 drivers/gpu/drm/mgag200/mgag200_bmc.c              |  111 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |   40 +
 drivers/gpu/drm/mgag200/mgag200_drv.h              |   58 +-
 drivers/gpu/drm/mgag200/mgag200_g200.c             |    5 +
 drivers/gpu/drm/mgag200/mgag200_g200eh.c           |   11 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c          |   11 +-
 drivers/gpu/drm/mgag200/mgag200_g200er.c           |   22 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c           |   22 +-
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c          |   13 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c           |   22 +-
 drivers/gpu/drm/mgag200/mgag200_g200wb.c           |   13 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c             |  183 ++-
 drivers/gpu/drm/mgag200/mgag200_reg.h              |    7 +
 drivers/gpu/drm/mgag200/mgag200_vga_bmc.c          |  156 ++
 drivers/gpu/drm/msm/Makefile                       |    1 +
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c          |   11 +
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   14 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   16 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h              |    2 +
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c          |   30 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  141 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   21 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   87 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |    2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |   46 +-
 .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  |    2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   15 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   51 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |   18 +
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |   18 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |   18 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |   18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |    6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |   41 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h           |    7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   12 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c           |    2 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |   10 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |   12 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |    1 +
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |    8 +
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |    5 +
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c           |  779 +++++++++
 drivers/gpu/drm/msm/msm_drv.h                      |    4 -
 drivers/gpu/drm/msm/msm_gpu.c                      |    1 -
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      | 1118 ++++++++++++-
 drivers/gpu/drm/msm/registers/display/hdmi.xml     |   89 +
 drivers/gpu/drm/mxsfb/lcdif_kms.c                  |    5 +-
 drivers/gpu/drm/nouveau/Kbuild                     |    1 -
 drivers/gpu/drm/nouveau/dispnv04/crtc.c            |   57 +-
 drivers/gpu/drm/nouveau/dispnv04/dac.c             |    2 +-
 drivers/gpu/drm/nouveau/dispnv04/dfp.c             |    2 +-
 drivers/gpu/drm/nouveau/dispnv04/disp.c            |    7 +-
 drivers/gpu/drm/nouveau/dispnv04/disp.h            |    2 +-
 drivers/gpu/drm/nouveau/dispnv04/hw.c              |    9 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c          |    4 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |    6 +-
 drivers/gpu/drm/nouveau/dispnv50/base507c.c        |   21 +-
 drivers/gpu/drm/nouveau/dispnv50/base827c.c        |    2 +-
 drivers/gpu/drm/nouveau/dispnv50/base907c.c        |   10 +-
 drivers/gpu/drm/nouveau/dispnv50/core507d.c        |    8 +-
 drivers/gpu/drm/nouveau/dispnv50/corec37d.c        |    6 +-
 drivers/gpu/drm/nouveau/dispnv50/corec57d.c        |    2 +-
 drivers/gpu/drm/nouveau/dispnv50/crc907d.c         |    4 +-
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c         |    4 +-
 drivers/gpu/drm/nouveau/dispnv50/crcc57d.c         |    2 +-
 drivers/gpu/drm/nouveau/dispnv50/dac507d.c         |    2 +-
 drivers/gpu/drm/nouveau/dispnv50/dac907d.c         |    2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |   79 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.h            |   14 +-
 drivers/gpu/drm/nouveau/dispnv50/head507d.c        |   24 +-
 drivers/gpu/drm/nouveau/dispnv50/head827d.c        |   10 +-
 drivers/gpu/drm/nouveau/dispnv50/head907d.c        |   26 +-
 drivers/gpu/drm/nouveau/dispnv50/head917d.c        |    6 +-
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c        |   18 +-
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c        |   12 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c        |    6 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly827e.c        |    2 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly907e.c        |    2 +-
 drivers/gpu/drm/nouveau/dispnv50/pior507d.c        |    2 +-
 drivers/gpu/drm/nouveau/dispnv50/sor507d.c         |    2 +-
 drivers/gpu/drm/nouveau/dispnv50/sor907d.c         |    2 +-
 drivers/gpu/drm/nouveau/dispnv50/sorc37d.c         |    2 +-
 drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c        |    7 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c        |   24 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c        |   10 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c        |    2 +-
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h      |    7 -
 drivers/gpu/drm/nouveau/include/nvif/class.h       |    3 -
 drivers/gpu/drm/nouveau/include/nvif/client.h      |   11 +-
 drivers/gpu/drm/nouveau/include/nvif/device.h      |   37 +-
 drivers/gpu/drm/nouveau/include/nvif/driver.h      |    5 -
 drivers/gpu/drm/nouveau/include/nvif/if0000.h      |   10 -
 drivers/gpu/drm/nouveau/include/nvif/if0002.h      |   39 -
 drivers/gpu/drm/nouveau/include/nvif/if0003.h      |   34 -
 drivers/gpu/drm/nouveau/include/nvif/ioctl.h       |   27 -
 drivers/gpu/drm/nouveau/include/nvif/object.h      |   24 +-
 drivers/gpu/drm/nouveau/include/nvif/os.h          |   19 +
 drivers/gpu/drm/nouveau/include/nvkm/core/client.h |    1 -
 drivers/gpu/drm/nouveau/include/nvkm/core/device.h |    1 -
 drivers/gpu/drm/nouveau/include/nvkm/core/layout.h |    1 -
 drivers/gpu/drm/nouveau/include/nvkm/core/object.h |   14 -
 drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h |    2 -
 drivers/gpu/drm/nouveau/include/nvkm/core/os.h     |   19 -
 drivers/gpu/drm/nouveau/include/nvkm/core/pci.h    |    1 -
 drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h  |    1 -
 drivers/gpu/drm/nouveau/include/nvkm/engine/pm.h   |   29 -
 drivers/gpu/drm/nouveau/nouveau_abi16.c            |  330 +++-
 drivers/gpu/drm/nouveau/nouveau_abi16.h            |    6 +-
 drivers/gpu/drm/nouveau/nouveau_bios.c             |    4 +-
 drivers/gpu/drm/nouveau/nouveau_bios.h             |    1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c               |   10 +-
 drivers/gpu/drm/nouveau/nouveau_bo.h               |   50 +-
 drivers/gpu/drm/nouveau/nouveau_bo0039.c           |    6 +-
 drivers/gpu/drm/nouveau/nouveau_bo5039.c           |    6 +-
 drivers/gpu/drm/nouveau/nouveau_bo74c1.c           |    2 +-
 drivers/gpu/drm/nouveau/nouveau_bo85b5.c           |    2 +-
 drivers/gpu/drm/nouveau/nouveau_bo9039.c           |    4 +-
 drivers/gpu/drm/nouveau/nouveau_bo90b5.c           |    2 +-
 drivers/gpu/drm/nouveau/nouveau_boa0b5.c           |    4 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c             |   98 +-
 drivers/gpu/drm/nouveau/nouveau_chan.h             |    8 +-
 drivers/gpu/drm/nouveau/nouveau_display.c          |    5 +-
 drivers/gpu/drm/nouveau/nouveau_display.h          |    2 +-
 drivers/gpu/drm/nouveau/nouveau_dma.c              |    2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c             |    8 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |  402 ++---
 drivers/gpu/drm/nouveau/nouveau_drv.h              |   61 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |   17 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |   21 +-
 drivers/gpu/drm/nouveau/nouveau_hwmon.c            |   46 +-
 drivers/gpu/drm/nouveau/nouveau_led.c              |    2 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c              |   38 +-
 drivers/gpu/drm/nouveau/nouveau_mem.h              |    4 +-
 drivers/gpu/drm/nouveau/nouveau_nvif.c             |    2 -
 drivers/gpu/drm/nouveau/nouveau_platform.c         |   12 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c            |    6 +-
 drivers/gpu/drm/nouveau/nouveau_sgdma.c            |    2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c              |   12 +-
 drivers/gpu/drm/nouveau/nouveau_usif.c             |  194 ---
 drivers/gpu/drm/nouveau/nouveau_usif.h             |   10 -
 drivers/gpu/drm/nouveau/nouveau_vga.c              |   22 +-
 drivers/gpu/drm/nouveau/nouveau_vga.h              |    1 -
 drivers/gpu/drm/nouveau/nv04_fence.c               |    2 +-
 drivers/gpu/drm/nouveau/nv10_fence.c               |    4 +-
 drivers/gpu/drm/nouveau/nv17_fence.c               |   12 +-
 drivers/gpu/drm/nouveau/nv50_fence.c               |    4 +-
 drivers/gpu/drm/nouveau/nv84_fence.c               |   16 +-
 drivers/gpu/drm/nouveau/nvc0_fence.c               |    4 +-
 drivers/gpu/drm/nouveau/nvif/client.c              |   32 +-
 drivers/gpu/drm/nouveau/nvif/device.c              |   15 +-
 drivers/gpu/drm/nouveau/nvif/driver.c              |   32 +-
 drivers/gpu/drm/nouveau/nvif/object.c              |   40 -
 drivers/gpu/drm/nouveau/nvkm/core/client.c         |   64 +-
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c          |   91 +-
 drivers/gpu/drm/nouveau/nvkm/core/object.c         |   50 -
 drivers/gpu/drm/nouveau/nvkm/core/oproxy.c         |   42 -
 drivers/gpu/drm/nouveau/nvkm/core/uevent.c         |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/Kbuild         |    1 -
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |  481 +++---
 drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c   |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h  |    2 -
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c  |   93 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c    |   24 -
 drivers/gpu/drm/nouveau/nvkm/engine/pm/Kbuild      |   11 -
 drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c      |  867 ----------
 drivers/gpu/drm/nouveau/nvkm/engine/pm/g84.c       |  165 --
 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.c     |  243 ---
 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.h     |   20 -
 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf108.c     |   66 -
 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf117.c     |   80 -
 drivers/gpu/drm/nouveau/nvkm/engine/pm/gk104.c     |  184 ---
 drivers/gpu/drm/nouveau/nvkm/engine/pm/gt200.c     |  157 --
 drivers/gpu/drm/nouveau/nvkm/engine/pm/gt215.c     |  138 --
 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.c      |  123 --
 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.h      |   15 -
 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv50.c      |  175 --
 drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h      |  105 --
 drivers/gpu/drm/omapdrm/dss/base.c                 |    3 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |    5 +
 drivers/gpu/drm/panel/Kconfig                      |   12 +-
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c     |    2 +
 .../gpu/drm/panel/panel-boe-th101mb31ig002-28a.c   |  317 ++--
 drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c     |  241 +++
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |  190 +--
 drivers/gpu/drm/panel/panel-edp.c                  |   40 +-
 drivers/gpu/drm/panel/panel-himax-hx8394.c         |  153 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       |   14 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9806e.c      |  165 ++
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   |  372 ++++-
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c       |  147 +-
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c   |   79 +-
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c    |  367 ++---
 drivers/gpu/drm/panel/panel-novatek-nt35510.c      |    2 +-
 drivers/gpu/drm/panel/panel-novatek-nt35950.c      |  211 +--
 drivers/gpu/drm/panel/panel-novatek-nt36672e.c     |   69 +-
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |    4 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      |   10 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |   10 +-
 drivers/gpu/drm/panel/panel-simple.c               |   97 +-
 drivers/gpu/drm/panel/panel-sitronix-st7701.c      | 1074 +++++++-----
 drivers/gpu/drm/panel/panel-sony-acx565akm.c       |    2 +-
 .../gpu/drm/panel/panel-sony-tulip-truly-nt35521.c |   29 +-
 .../gpu/drm/panel/panel-startek-kd070fhfid015.c    |  115 +-
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c    |  204 ++-
 drivers/gpu/drm/panfrost/panfrost_job.c            |    2 +-
 drivers/gpu/drm/panthor/panthor_mmu.c              |    2 +-
 drivers/gpu/drm/panthor/panthor_sched.c            |    2 +-
 drivers/gpu/drm/radeon/atombios_encoders.c         |    4 +-
 drivers/gpu/drm/radeon/cik.c                       |   14 +-
 drivers/gpu/drm/radeon/dce6_afmt.c                 |    2 +-
 drivers/gpu/drm/radeon/evergreen.c                 |   12 +-
 drivers/gpu/drm/radeon/evergreen_cs.c              |   62 +-
 drivers/gpu/drm/radeon/ni.c                        |    2 +-
 drivers/gpu/drm/radeon/r100.c                      |   94 +-
 drivers/gpu/drm/radeon/r300.c                      |    6 +-
 drivers/gpu/drm/radeon/r420.c                      |    6 +-
 drivers/gpu/drm/radeon/r520.c                      |    2 +-
 drivers/gpu/drm/radeon/r600.c                      |   12 +-
 drivers/gpu/drm/radeon/r600_cs.c                   |    2 +-
 drivers/gpu/drm/radeon/r600_dpm.c                  |    4 +-
 drivers/gpu/drm/radeon/r600_hdmi.c                 |    2 +-
 drivers/gpu/drm/radeon/radeon.h                    |    7 +-
 drivers/gpu/drm/radeon/radeon_acpi.c               |   10 +-
 drivers/gpu/drm/radeon/radeon_agp.c                |    2 +-
 drivers/gpu/drm/radeon/radeon_atombios.c           |   38 +-
 drivers/gpu/drm/radeon/radeon_audio.c              |    4 +-
 drivers/gpu/drm/radeon/radeon_combios.c            |   38 +-
 drivers/gpu/drm/radeon/radeon_connectors.c         |    7 +-
 drivers/gpu/drm/radeon/radeon_device.c             |   13 +-
 drivers/gpu/drm/radeon/radeon_display.c            |   76 +-
 drivers/gpu/drm/radeon/radeon_drv.c                |   27 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c              |   26 +-
 drivers/gpu/drm/radeon/radeon_fence.c              |    8 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |    4 +-
 drivers/gpu/drm/radeon/radeon_i2c.c                |    2 +-
 drivers/gpu/drm/radeon/radeon_ib.c                 |    2 +-
 drivers/gpu/drm/radeon/radeon_irq_kms.c            |   12 +-
 drivers/gpu/drm/radeon/radeon_kms.c                |    8 +-
 drivers/gpu/drm/radeon/radeon_legacy_encoders.c    |    2 +-
 drivers/gpu/drm/radeon/radeon_mode.h               |    4 +-
 drivers/gpu/drm/radeon/radeon_object.c             |    9 +-
 drivers/gpu/drm/radeon/radeon_pm.c                 |   20 +-
 drivers/gpu/drm/radeon/radeon_ring.c               |    2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |    6 +-
 drivers/gpu/drm/radeon/rs400.c                     |    6 +-
 drivers/gpu/drm/radeon/rs600.c                     |   14 +-
 drivers/gpu/drm/radeon/rs690.c                     |    2 +-
 drivers/gpu/drm/radeon/rv515.c                     |    4 +-
 drivers/gpu/drm/radeon/rv770.c                     |    2 +-
 drivers/gpu/drm/radeon/si.c                        |    4 +-
 drivers/gpu/drm/renesas/rcar-du/Kconfig            |    8 -
 drivers/gpu/drm/renesas/rcar-du/Makefile           |    2 -
 drivers/gpu/drm/renesas/rz-du/Kconfig              |    8 +
 drivers/gpu/drm/renesas/rz-du/Makefile             |    2 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c      |    8 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c       |   11 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c       |    3 +-
 .../renesas/{rcar-du =3D> rz-du}/rzg2l_mipi_dsi.c    |    0
 .../{rcar-du =3D> rz-du}/rzg2l_mipi_dsi_regs.h       |    0
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |    2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   32 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |  107 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |    3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |    8 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |    1 +
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |    2 +
 drivers/gpu/drm/scheduler/sched_main.c             |   27 +-
 drivers/gpu/drm/sti/sti_dvo.c                      |    1 -
 drivers/gpu/drm/sti/sti_hda.c                      |    1 -
 drivers/gpu/drm/sti/sti_hdmi.c                     |   25 +-
 drivers/gpu/drm/sti/sti_hqvdp.c                    |    1 -
 drivers/gpu/drm/sti/sti_tvout.c                    |    1 -
 drivers/gpu/drm/sti/sti_vtg.c                      |    1 -
 drivers/gpu/drm/stm/Kconfig                        |    1 +
 drivers/gpu/drm/stm/drv.c                          |    7 +-
 drivers/gpu/drm/stm/ltdc.c                         |  107 +-
 drivers/gpu/drm/stm/lvds.c                         |    1 -
 drivers/gpu/drm/tegra/drm.c                        |    6 +
 drivers/gpu/drm/tegra/drm.h                        |    2 +-
 drivers/gpu/drm/tegra/gr3d.c                       |   46 +-
 drivers/gpu/drm/tegra/hub.c                        |    7 +-
 drivers/gpu/drm/tegra/output.c                     |   29 +-
 drivers/gpu/drm/tests/drm_gem_shmem_test.c         |   27 +-
 drivers/gpu/drm/tilcdc/tilcdc_panel.c              |    2 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |   13 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c            |    6 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c      |    2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |  462 +++---
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |  151 ++
 drivers/gpu/drm/ttm/ttm_device.c                   |   29 +-
 drivers/gpu/drm/ttm/ttm_pool.c                     |    2 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |  255 ++-
 drivers/gpu/drm/udl/udl_edid.c                     |    2 +-
 drivers/gpu/drm/v3d/v3d_bo.c                       |   12 +
 drivers/gpu/drm/v3d/v3d_drv.c                      |   11 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |   12 +-
 drivers/gpu/drm/v3d/v3d_perfmon.c                  |   40 +-
 drivers/gpu/drm/v3d/v3d_performance_counters.h     |   16 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |   79 +-
 drivers/gpu/drm/v3d/v3d_submit.c                   |  263 ++-
 drivers/gpu/drm/vc4/vc4_bo.c                       |   14 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                      |   14 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |   32 +-
 drivers/gpu/drm/vc4/vc4_gem.c                      |   11 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   44 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                      |    4 +-
 drivers/gpu/drm/vc4/vc4_irq.c                      |    2 +-
 drivers/gpu/drm/vc4/vc4_v3d.c                      |   24 +-
 drivers/gpu/drm/vc4/vc4_validate.c                 |    8 +-
 drivers/gpu/drm/vc4/vc4_vec.c                      |   10 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |    6 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |    1 -
 drivers/gpu/drm/vkms/vkms_formats.c                |   14 +-
 drivers/gpu/drm/xe/Makefile                        |   44 +-
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h              |    1 +
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |   19 +-
 drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h  |    7 +-
 .../gpu/drm/xe/compat-i915-headers/intel_step.h    |   10 +-
 drivers/gpu/drm/xe/display/intel_fb_bo.c           |    9 +
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c        |    7 +-
 drivers/gpu/drm/xe/display/xe_display.c            |  108 +-
 drivers/gpu/drm/xe/display/xe_display.h            |    4 +
 drivers/gpu/drm/xe/display/xe_display_wa.c         |   16 +
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c         |    1 -
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |   51 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c           |    9 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |    6 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h           |    1 +
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h              |    4 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |   17 +-
 drivers/gpu/drm/xe/regs/xe_regs.h                  |   12 +-
 drivers/gpu/drm/xe/regs/xe_sriov_regs.h            |   23 -
 drivers/gpu/drm/xe/tests/Makefile                  |    6 +-
 drivers/gpu/drm/xe/tests/xe_bo.c                   |   53 +-
 drivers/gpu/drm/xe/tests/xe_bo_test.c              |   21 -
 drivers/gpu/drm/xe/tests/xe_bo_test.h              |   14 -
 drivers/gpu/drm/xe/tests/xe_dma_buf.c              |   30 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf_test.c         |   20 -
 drivers/gpu/drm/xe/tests/xe_dma_buf_test.h         |   13 -
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c        |   39 +
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h        |    2 +
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c        |   11 +
 drivers/gpu/drm/xe/tests/xe_migrate.c              |  436 ++++-
 drivers/gpu/drm/xe/tests/xe_migrate_test.c         |   20 -
 drivers/gpu/drm/xe/tests/xe_migrate_test.h         |   13 -
 drivers/gpu/drm/xe/tests/xe_mocs.c                 |   44 +-
 drivers/gpu/drm/xe/tests/xe_mocs_test.c            |   21 -
 drivers/gpu/drm/xe/tests/xe_mocs_test.h            |   14 -
 drivers/gpu/drm/xe/tests/xe_pci.c                  |   82 +-
 drivers/gpu/drm/xe/tests/xe_pci_test.c             |    4 +-
 drivers/gpu/drm/xe/tests/xe_pci_test.h             |    3 +-
 drivers/gpu/drm/xe/tests/xe_rtp_test.c             |  219 ++-
 drivers/gpu/drm/xe/tests/xe_test.h                 |   10 +-
 drivers/gpu/drm/xe/tests/xe_wa_test.c              |    1 +
 drivers/gpu/drm/xe/xe_assert.h                     |    2 +-
 drivers/gpu/drm/xe/xe_bo.c                         |   53 +-
 drivers/gpu/drm/xe/xe_bo.h                         |   15 +-
 drivers/gpu/drm/xe/xe_bo_types.h                   |    7 +-
 drivers/gpu/drm/xe/xe_debugfs.c                    |    3 +-
 drivers/gpu/drm/xe/xe_debugfs.h                    |    4 +
 drivers/gpu/drm/xe/xe_devcoredump.c                |  121 +-
 drivers/gpu/drm/xe/xe_devcoredump_types.h          |    8 +
 drivers/gpu/drm/xe/xe_device.c                     |   27 +-
 drivers/gpu/drm/xe/xe_device.h                     |   26 +-
 drivers/gpu/drm/xe/xe_device_types.h               |   50 +-
 drivers/gpu/drm/xe/xe_drm_client.c                 |    2 +-
 drivers/gpu/drm/xe/xe_exec.c                       |   22 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                 |  240 +--
 drivers/gpu/drm/xe/xe_exec_queue.h                 |   10 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h           |    8 +-
 drivers/gpu/drm/xe/xe_execlist.c                   |   26 +-
 drivers/gpu/drm/xe/xe_execlist_types.h             |    2 +
 drivers/gpu/drm/xe/xe_gen_wa_oob.c                 |   16 +-
 drivers/gpu/drm/xe/xe_ggtt.c                       |  494 ++++--
 drivers/gpu/drm/xe/xe_ggtt.h                       |   24 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h                 |   54 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.c              |   23 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h              |   12 +
 drivers/gpu/drm/xe/xe_gsc.c                        |   61 +-
 drivers/gpu/drm/xe/xe_gsc.h                        |    3 +
 drivers/gpu/drm/xe/xe_gsc_debugfs.c                |   71 +
 drivers/gpu/drm/xe/xe_gsc_debugfs.h                |   14 +
 drivers/gpu/drm/xe/xe_gsc_proxy.c                  |   45 +-
 drivers/gpu/drm/xe/xe_gt.c                         |   13 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c                 |   13 +
 drivers/gpu/drm/xe/xe_gt_mcr.c                     |   40 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c               |   55 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c                |    8 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |  216 ++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h         |    1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h   |    5 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c        | 1258 +++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h        |    3 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h  |  107 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h          |    6 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c                |   70 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h                |    1 +
 drivers/gpu/drm/xe/xe_gt_stats.c                   |   49 +
 drivers/gpu/drm/xe/xe_gt_stats.h                   |   29 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |    6 +-
 drivers/gpu/drm/xe/xe_gt_topology.c                |   27 +-
 drivers/gpu/drm/xe/xe_gt_types.h                   |   43 +-
 drivers/gpu/drm/xe/xe_guc.c                        |    4 +-
 drivers/gpu/drm/xe/xe_guc.h                        |   10 +
 drivers/gpu/drm/xe/xe_guc_ads.c                    |    6 +
 drivers/gpu/drm/xe/xe_guc_ct.c                     |   13 +-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c               |   97 ++
 drivers/gpu/drm/xe/xe_guc_hwconfig.h               |    3 +
 drivers/gpu/drm/xe/xe_guc_id_mgr.c                 |    4 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                     |    2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  100 +-
 drivers/gpu/drm/xe/xe_heci_gsc.c                   |   28 +-
 drivers/gpu/drm/xe/xe_heci_gsc.h                   |   10 +-
 drivers/gpu/drm/xe/xe_huc.c                        |   19 +-
 drivers/gpu/drm/xe/xe_hw_engine.c                  |  164 +-
 drivers/gpu/drm/xe/xe_hw_engine.h                  |   10 +
 drivers/gpu/drm/xe/xe_hw_engine_group.c            |  372 +++++
 drivers/gpu/drm/xe/xe_hw_engine_group.h            |   29 +
 drivers/gpu/drm/xe/xe_hw_engine_group_types.h      |   51 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h            |    4 +-
 drivers/gpu/drm/xe/xe_hwmon.c                      |   95 +-
 drivers/gpu/drm/xe/xe_irq.c                        |    2 +
 drivers/gpu/drm/xe/xe_lmtt.c                       |    4 +-
 drivers/gpu/drm/xe/xe_lrc.c                        |   37 +-
 drivers/gpu/drm/xe/xe_migrate.c                    |  553 ++++---
 drivers/gpu/drm/xe/xe_migrate.h                    |   43 +-
 drivers/gpu/drm/xe/xe_mmio.c                       |  253 +--
 drivers/gpu/drm/xe/xe_mmio.h                       |    1 -
 drivers/gpu/drm/xe/xe_module.c                     |   54 +-
 drivers/gpu/drm/xe/xe_module.h                     |    2 +-
 drivers/gpu/drm/xe/xe_oa.c                         |    7 +-
 drivers/gpu/drm/xe/xe_oa_types.h                   |    2 +-
 drivers/gpu/drm/xe/xe_observation.c                |    2 +-
 drivers/gpu/drm/xe/xe_pat.c                        |    2 +-
 drivers/gpu/drm/xe/xe_pci.c                        |   24 +-
 drivers/gpu/drm/xe/xe_pm.c                         |  130 +-
 drivers/gpu/drm/xe/xe_pm.h                         |    2 +
 drivers/gpu/drm/xe/xe_preempt_fence.c              |   12 +-
 drivers/gpu/drm/xe/xe_pt.c                         | 1391 +++++++++++-----
 drivers/gpu/drm/xe/xe_pt.h                         |   14 +-
 drivers/gpu/drm/xe/xe_pt_types.h                   |   48 +
 drivers/gpu/drm/xe/xe_query.c                      |    6 +-
 drivers/gpu/drm/xe/xe_res_cursor.h                 |    1 -
 drivers/gpu/drm/xe/xe_rtp.c                        |   44 +-
 drivers/gpu/drm/xe/xe_rtp.h                        |    4 +-
 drivers/gpu/drm/xe/xe_rtp_helpers.h                |    6 +
 drivers/gpu/drm/xe/xe_sa.c                         |   20 +-
 drivers/gpu/drm/xe/xe_sa_types.h                   |    1 +
 drivers/gpu/drm/xe/xe_sched_job.c                  |    5 +-
 drivers/gpu/drm/xe/xe_sriov.c                      |    2 +-
 drivers/gpu/drm/xe/xe_step.c                       |   57 +-
 drivers/gpu/drm/xe/xe_step_types.h                 |   30 +-
 drivers/gpu/drm/xe/xe_sync.c                       |   31 +-
 drivers/gpu/drm/xe/xe_sync.h                       |    1 -
 drivers/gpu/drm/xe/xe_trace.h                      |   52 +
 drivers/gpu/drm/xe/xe_trace_bo.h                   |   10 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c             |    1 -
 drivers/gpu/drm/xe/xe_tuning.c                     |   21 +-
 drivers/gpu/drm/xe/xe_uc_debugfs.c                 |    2 +
 drivers/gpu/drm/xe/xe_uc_fw.c                      |   42 +-
 drivers/gpu/drm/xe/xe_vm.c                         |  732 ++++-----
 drivers/gpu/drm/xe/xe_vm.h                         |    2 +
 drivers/gpu/drm/xe/xe_vm_types.h                   |   55 +-
 drivers/gpu/drm/xe/xe_wa.c                         |    5 +
 drivers/gpu/drm/xe/xe_wa.h                         |    7 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |    7 +
 drivers/gpu/drm/xe/xe_wait_user_fence.c            |    2 +-
 drivers/gpu/host1x/dev.c                           |    7 +-
 drivers/gpu/host1x/dev.h                           |    2 +
 drivers/gpu/host1x/hw/intr_hw.c                    |   37 +-
 drivers/gpu/host1x/intr.c                          |   21 +-
 drivers/gpu/host1x/intr.h                          |    5 +
 drivers/gpu/vga/vga_switcheroo.c                   |    3 +-
 drivers/hv/hv_common.c                             |    4 +-
 drivers/mtd/mtdoops.c                              |    6 +-
 drivers/video/fbdev/core/fbcon.c                   |   16 +-
 fs/pstore/platform.c                               |   10 +-
 include/drm/display/drm_dp.h                       |    4 +
 include/drm/display/drm_dp_helper.h                |    3 +
 include/drm/display/drm_dp_mst_helper.h            |   14 +-
 include/drm/drm_accel.h                            |   18 +-
 include/drm/drm_atomic.h                           |    2 +-
 include/drm/drm_connector.h                        |    8 -
 include/drm/drm_device.h                           |    5 +-
 include/drm/drm_drv.h                              |   28 -
 include/drm/drm_edid.h                             |    2 -
 include/drm/drm_fb_helper.h                        |    6 -
 include/drm/drm_file.h                             |    5 +
 include/drm/drm_fixed.h                            |    3 +-
 include/drm/drm_mipi_dsi.h                         |   12 +
 include/drm/drm_mode_config.h                      |   16 -
 include/drm/drm_panic.h                            |   21 +-
 include/drm/drm_prime.h                            |    3 +
 include/drm/drm_print.h                            |   54 +-
 include/drm/drm_rect.h                             |   15 +
 include/drm/drm_vblank.h                           |   37 +-
 include/drm/gpu_scheduler.h                        |    2 +-
 include/drm/ttm/ttm_bo.h                           |   48 +-
 include/drm/ttm/ttm_resource.h                     |   97 +-
 include/linux/dma-fence-array.h                    |    6 +
 include/linux/dma-heap.h                           |   21 +-
 include/linux/fb.h                                 |    1 +
 include/linux/kmsg_dump.h                          |   22 +-
 include/linux/string.h                             |   12 +
 include/uapi/drm/drm_fourcc.h                      |   25 +
 include/uapi/drm/drm_mode.h                        |    2 +
 include/uapi/drm/msm_drm.h                         |    2 +
 include/uapi/drm/xe_drm.h                          |   10 +-
 include/uapi/linux/kfd_ioctl.h                     |  106 +-
 include/uapi/linux/virtio_gpu.h                    |    1 +
 kernel/panic.c                                     |    2 +-
 kernel/printk/printk.c                             |   11 +-
 1282 files changed, 43812 insertions(+), 21840 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/panel/boe,tv101wum-ll2.yaml
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v9_0_cleaner_shader.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3_cleaner_shader.as=
m
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3_cleaner_shader.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/Makefile
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/Makefile
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dcn401/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn301/dcn301_dio_link_encoder.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn301/dcn301_dio_link_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn314/dcn314_dio_stream_encoder.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/dcn314/dcn314_dio_stream_encoder.h (100%)
 delete mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.h
 delete mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c
 delete mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.h
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dwb}/dcn30/dcn30_cm_common.h =
(100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dwb}/dcn30/dcn30_dwb.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dwb}/dcn30/dcn30_dwb.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dwb}/dcn30/dcn30_dwb_cm.c (10=
0%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
hpo}/dcn31/dcn31_hpo_dp_link_encoder.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
hpo}/dcn31/dcn31_hpo_dp_link_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
hpo}/dcn31/dcn31_hpo_dp_stream_encoder.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
hpo}/dcn31/dcn31_hpo_dp_stream_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
mmhubbub}/dcn20/dcn20_mmhubbub.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
mmhubbub}/dcn20/dcn20_mmhubbub.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> mpc}/dcn10/dcn10_mpc.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> mpc}/dcn10/dcn10_mpc.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> mpc}/dcn20/dcn20_mpc.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> mpc}/dcn20/dcn20_mpc.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> mpc}/dcn30/dcn30_mpc.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> mpc}/dcn30/dcn30_mpc.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> opp}/dcn10/dcn10_opp.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> opp}/dcn10/dcn10_opp.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> opp}/dcn20/dcn20_opp.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> opp}/dcn20/dcn20_opp.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_filters.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_filters.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filt=
ers.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filt=
ers.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/spl_custom_float.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/spl_custom_float.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/spl_debug.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/spl_os_types.h
 create mode 100644 drivers/gpu/drm/ast/ast_sil164.c
 create mode 100644 drivers/gpu/drm/ast/ast_vga.c
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
 create mode 100644 drivers/gpu/drm/drm_panic_qr.rs
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
 create mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0002.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0003.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvkm/engine/pm.h
 delete mode 100644 drivers/gpu/drm/nouveau/nouveau_usif.c
 delete mode 100644 drivers/gpu/drm/nouveau/nouveau_usif.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/Kbuild
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/g84.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf108.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf117.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gk104.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gt200.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gt215.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h
 create mode 100644 drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c
 rename drivers/gpu/drm/renesas/{rcar-du =3D> rz-du}/rzg2l_mipi_dsi.c (100%=
)
 rename drivers/gpu/drm/renesas/{rcar-du =3D> rz-du}/rzg2l_mipi_dsi_regs.h =
(100%)
 create mode 100644 drivers/gpu/drm/xe/display/xe_display_wa.c
 delete mode 100644 drivers/gpu/drm/xe/regs/xe_sriov_regs.h
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_bo_test.c
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_bo_test.h
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_dma_buf_test.h
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_migrate_test.c
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_migrate_test.h
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_mocs_test.c
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_mocs_test.h
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group_types.h
