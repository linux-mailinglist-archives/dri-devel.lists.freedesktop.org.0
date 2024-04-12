Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7798A2343
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 03:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0493210EB00;
	Fri, 12 Apr 2024 01:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J3TRDO8y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D6710EB00
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 01:34:46 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-565c6cf4819so2547345a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 18:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712885685; x=1713490485; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3JbfjU9xYWqBe4VH07DTryq1S8CtSVDBWND2Z/VpZlc=;
 b=J3TRDO8yKgdImLR4h0Wz/F2ctO45gZWtw9mVTfwylGPsSU75FecVtC9fnCwoinlOK6
 sT9heXSkk9x16WjS9oNQeSXA5AQe5f2xmixWHoCX3qOqPG0FD7jhBT9vwi0Uwor29s0d
 jiY4aEO77CI8VnbCdSR5lsNI1ZmE6Ft0gIrlxoCBszuCQX8UcrUSBKZ/kjqeANOwiAm4
 vPiwuMINJAm+WCA7yUeBg53f98OeNTa2mRafHOk5o2eKjqbROGCRSCFWXqS372FwcUUi
 PkUxv/n277hOdnpQ8Vfen7N6NN1gKNNUhmS9dmfq7tSKqjtbqZTg4uVe0Zhm/lst7qDb
 Rg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712885685; x=1713490485;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3JbfjU9xYWqBe4VH07DTryq1S8CtSVDBWND2Z/VpZlc=;
 b=sfVHhLsRosXbEXeGQYsC8d8lfY7qb7O0arVrPFgm/lQdMDhOqZgSznutcnii9YdNwh
 Azfc2Z/6xg7h9wZ4jRlwZXrPzRRxeKm0ohWGzrTklsAfrowY6qoDiJPrWiTn1NDAf+M1
 pNyAUeeMLfsoOpLph5GjBwMEmBz94RP2iFBfMQHG+b8yW3UpEf4L62HIkWBGxxn3+Drf
 ulNgnNs1ciKnV15/8ZMj7c8Iu4FHpZ+E1zszRfJI5DV3Hl8fG2pY4LjxOc0EsYE3XJjU
 6rf9lk2WUJghXXPTsOApChRuQvW9Rc2qdBzAAQcs29KH8kDCikB1ovWTpM0wwpYpt9LT
 D9VQ==
X-Gm-Message-State: AOJu0Yzb85k49q8wMxZGGficPuO2nwn3Hl/fjvJgXB2M8LZgnoD1jNX9
 uR2Mj1NjyPsRl9MGIFNSTBwirYdqY1PoK7cIaWNHV3HSk611PkAxhrIiw5OWolqPuvjRK2zIhMw
 hjrJ+/PBVlKhPvvcsfXFY22p8F54=
X-Google-Smtp-Source: AGHT+IHAXOLp0IuV5Sp/Holifezf5RIHkigaIfBNeSboPAdpFztbzFwlqzsuCAU7qPf2WGMgExOe7SRxADtLElwjWmE=
X-Received: by 2002:a17:906:1c47:b0:a51:b49e:473e with SMTP id
 l7-20020a1709061c4700b00a51b49e473emr968673ejg.19.1712885684912; Thu, 11 Apr
 2024 18:34:44 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 12 Apr 2024 11:34:33 +1000
Message-ID: <CAPM=9txv4MKXFj67mKAV8BZ_uyW2cVz9rUioHfSAsCPVQYgkxQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.9-rc4
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

Hi Linus,

Looks like everyone woke up after holidays, this weeks pull has a
bunch of stuff all over, 2 weeks worth of amdgpu is a lot of it, then
i915/xe have a few, a bunch of msm fixes, then some scattered driver
fixes.

I expect things will settle down for rc5.

Dave.


drm-fixes-2024-04-12:
drm fixes for 6.9-rc4

client:
- Protect connector modes with mode_config mutex

ast:
- Fix soft lockup

host1x:
- Do not setup DMA for virtual addresses

ivpu:
- Fix deadlock in context_xa
- PCI fixes
- Fixes to error handling

nouveau:
- gsp: Fix OOB access
- Fix casting

panfrost:
- Fix error path in MMU code

qxl:
- Revert "drm/qxl: simplify qxl_fence_wait"

vmwgfx:
- Enable DMA for SEV mappings

i915:
- Couple CDCLK programming fixes
- HDCP related fix
- 4 Bigjoiner related fixes
- Fix for a circular locking around GuC on reset+wedged case

xe:
- Fix double display mutex initializations
- Fix u32 -> u64 implicit conversions
- Fix RING_CONTEXT_CONTROL not marked as masked

msm:
- DP refcount leak fix on disconnect
- Add missing newlines to prints in msm_fb and msm_kms
- fix dpu debugfs entry permissions
- Fix the interface table for the catalog of X1E80100
- fix irq message printing
- Bindings fix to add DP node as child of mdss for mdss node
- Minor typo fix in DP driver API which handles port status change
- fix CHRASHDUMP_READ()
- fix HHB (highest bank bit) for a619 to fix UBWC corruption

amdgpu:
- GPU reset fixes
- Fix some confusing logging
- UMSCH fix
- Aborted suspend fix
- DCN 3.5 fixes
- S4 fix
- MES logging fixes
- SMU 14 fixes
- SDMA 4.4.2 fix
- KASAN fix
- SMU 13.0.10 fix
- VCN partition fix
- GFX11 fixes
- DWB fixes
- Plane handling fix
- FAMS fix
- DCN 3.1.6 fix
- VSC SDP fixes
- OLED panel fix
- GFX 11.5 fix

amdkfd:
- GPU reset fixes
- fix ioctl integer overflow
The following changes since commit 718c4fb221dbeff9072810841b949413c5ffc345=
:

  nouveau: fix devinit paths to only handle display on GSP.
(2024-04-09 13:14:13 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-04-12

for you to fetch changes up to 3b0daecfeac0103aba8b293df07a0cbaf8b43f29:

  amdkfd: use calloc instead of kzalloc to avoid integer overflow
(2024-04-12 11:11:59 +1000)

----------------------------------------------------------------
drm fixes for 6.9-rc4

client:
- Protect connector modes with mode_config mutex

ast:
- Fix soft lockup

host1x:
- Do not setup DMA for virtual addresses

ivpu:
- Fix deadlock in context_xa
- PCI fixes
- Fixes to error handling

nouveau:
- gsp: Fix OOB access
- Fix casting

panfrost:
- Fix error path in MMU code

qxl:
- Revert "drm/qxl: simplify qxl_fence_wait"

vmwgfx:
- Enable DMA for SEV mappings

i915:
- Couple CDCLK programming fixes
- HDCP related fix
- 4 Bigjoiner related fixes
- Fix for a circular locking around GuC on reset+wedged case

xe:
- Fix double display mutex initializations
- Fix u32 -> u64 implicit conversions
- Fix RING_CONTEXT_CONTROL not marked as masked

msm:
- DP refcount leak fix on disconnect
- Add missing newlines to prints in msm_fb and msm_kms
- fix dpu debugfs entry permissions
- Fix the interface table for the catalog of X1E80100
- fix irq message printing
- Bindings fix to add DP node as child of mdss for mdss node
- Minor typo fix in DP driver API which handles port status change
- fix CHRASHDUMP_READ()
- fix HHB (highest bank bit) for a619 to fix UBWC corruption

amdgpu:
- GPU reset fixes
- Fix some confusing logging
- UMSCH fix
- Aborted suspend fix
- DCN 3.5 fixes
- S4 fix
- MES logging fixes
- SMU 14 fixes
- SDMA 4.4.2 fix
- KASAN fix
- SMU 13.0.10 fix
- VCN partition fix
- GFX11 fixes
- DWB fixes
- Plane handling fix
- FAMS fix
- DCN 3.1.6 fix
- VSC SDP fixes
- OLED panel fix
- GFX 11.5 fix

amdkfd:
- GPU reset fixes
- fix ioctl integer overflow

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dp: fix typo in dp_display_handle_port_status_changed()

Alex Constantino (1):
      Revert "drm/qxl: simplify qxl_fence_wait"

Alex Deucher (1):
      drm/amdgpu: always force full reset for SOC21

Alex Hung (2):
      drm/amd/display: Skip on writeback when it's not applicable
      drm/amd/display: Return max resolution supported by DWB

Arnd Bergmann (1):
      nouveau: fix function cast warning

Ashutosh Dixit (1):
      drm/xe: Label RING_CONTEXT_CONTROL as masked

Boris Brezillon (1):
      drm/panfrost: Fix the error path in panfrost_mmu_map_fault_addr()

Dave Airlie (6):
      Merge tag 'drm-intel-fixes-2024-04-10' of
https://anongit.freedesktop.org/git/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-6.9-2024-04-10' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2024-04-11' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2024-04-11' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-msm-next-2024-04-11' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      amdkfd: use calloc instead of kzalloc to avoid integer overflow

Dillon Varone (1):
      drm/amd/display: Do not recursively call manual trigger programming

Dmitry Baryshkov (3):
      drm/msm/dpu: don't allow overriding data from catalog
      drm/msm/dpu: make error messages at
dpu_core_irq_register_callback() more sensible
      dt-bindings: display/msm: sm8150-mdss: add DP node

Fudongwang (1):
      drm/amd/display: fix disable otg wa logic in DCN316

Harish Kasiviswanathan (1):
      drm/amdkfd: Reset GPU on queue preemption failure

Harry Wentland (2):
      drm/amd/display: Program VSC SDP colorimetry for all DP sinks >=3D 1.=
4
      drm/amd/display: Set VSC SDP Colorimetry same way for MST and SST

Himal Prasad Ghimiray (1):
      drm/xe/xe_migrate: Cast to output precision before multiplying operan=
ds

Jacek Lawrynowicz (5):
      accel/ivpu: Remove d3hot_after_power_off WA
      accel/ivpu: Put NPU back to D3hot after failed resume
      accel/ivpu: Return max freq for DRM_IVPU_PARAM_CORE_CLOCK_RATE
      accel/ivpu: Fix missed error message after VPU rename
      accel/ivpu: Fix deadlock in context_xa

Jammy Huang (1):
      drm/ast: Fix soft lockup

Johan Hovold (2):
      drm/msm/dp: fix runtime PM leak on disconnect
      drm/msm/dp: fix runtime PM leak on connect failure

John Harrison (1):
      drm/i915/guc: Fix the fix for reset lock confusion

Karthik Poosa (1):
      drm/xe/hwmon: Cast result to output precision on left shift of operan=
d

Kees Cook (1):
      nouveau/gsp: Avoid addressing beyond end of rpc->entries

Kenneth Feng (1):
      drm/amd/pm: fix the high voltage issue after unload

Kuogee Hsieh (1):
      drm/msm/dp: assign correct DP controller ID to x1e80100 interface tab=
le

Lang Yu (1):
      drm/amdgpu/umsch: reinitialize write pointer in hw init

Li Ma (1):
      drm/amd/display: add DCN 351 version for microcode load

Lijo Lazar (3):
      drm/amdgpu: Refine IB schedule error logging
      drm/amdgpu: Reset dGPU if suspend got aborted
      drm/amdgpu: Fix VCN allocation in CPX partition

Luca Weiss (1):
      drm/msm/adreno: Set highest_bank_bit for A619

Lucas De Marchi (1):
      drm/xe/display: Fix double mutex initialization

Miguel Ojeda (1):
      drm/msm: fix the `CRASHDUMP_READ` target of `a6xx_get_shader_block()`

Stephen Boyd (1):
      drm/msm: Add newlines to some debug prints

Suraj Kandpal (1):
      drm/i915/hdcp: Fix get remote hdcp capability function

Tao Zhou (1):
      drm/amdgpu: implement IRQ_STATE_ENABLE for SDMA v4.4.2

Thierry Reding (1):
      gpu: host1x: Do not setup DMA for virtual devices

Tim Huang (2):
      drm/amd/pm: fixes a random hang in S4 for SMU v13.0.4/11
      drm/amdgpu: fix incorrect number of active RBs for gfx11

Ville Syrj=C3=A4l=C3=A4 (7):
      drm/client: Fully protect modes[] with dev->mode_config.mutex
      drm/i915/cdclk: Fix CDCLK programming order when pipes are active
      drm/i915/cdclk: Fix voltage_level programming edge case
      drm/i915/psr: Disable PSR when bigjoiner is used
      drm/i915: Disable port sync when bigjoiner is used
      drm/i915: Disable live M/N updates when using bigjoiner
      drm/i915/vrr: Disable VRR when using bigjoiner

Wachowski, Karol (3):
      accel/ivpu: Check return code of ipc->lock init
      accel/ivpu: Fix PCI D0 state entry in resume
      accel/ivpu: Improve clarity of MMU error messages

Wenjing Liu (1):
      drm/amd/display: always reset ODM mode in context when adding first p=
lane

Yifan Zhang (2):
      drm/amdgpu: add smu 14.0.1 discovery support
      drm/amdgpu: differentiate external rev id for gfx 11.5.0

Zack Rusin (1):
      drm/vmwgfx: Enable DMA mappings with SEV

ZhenGuo Yin (1):
      drm/amdgpu: clear set_q_mode_offs when VM changed

Zhigang Luo (1):
      amd/amdkfd: sync all devices to wait all processes being evicted

Zhongwei (1):
      drm/amd/display: Adjust dprefclk by down spread percentage.

lima1002 (1):
      drm/amd/swsmu: Update smu v14.0.0 headers to be 14.0.1 compatible

shaoyunl (2):
      drm/amdgpu : Add mes_log_enable to control mes log feature
      drm/amdgpu : Increase the mes log buffer size as per new MES FW versi=
on

 .../bindings/display/msm/qcom,sm8150-mdss.yaml     |   9 +
 drivers/accel/ivpu/ivpu_drv.c                      |  40 +--
 drivers/accel/ivpu/ivpu_drv.h                      |   3 +-
 drivers/accel/ivpu/ivpu_hw.h                       |   6 +
 drivers/accel/ivpu/ivpu_hw_37xx.c                  |  11 +-
 drivers/accel/ivpu/ivpu_hw_40xx.c                  |   6 +
 drivers/accel/ivpu/ivpu_ipc.c                      |   8 +-
 drivers/accel/ivpu/ivpu_mmu.c                      |   8 +-
 drivers/accel/ivpu/ivpu_pm.c                       |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |  15 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   7 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  16 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |  32 +-
 drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.c         |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  17 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  31 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   |   6 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |  19 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |  50 +++
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |   9 +
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |   8 +-
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c |   3 -
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  27 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   1 +
 .../pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0_0.h |  33 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_pmfw.h    |  55 +++-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_ppsmc.h   |  18 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h       |   1 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |  12 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |   2 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   | 347 +++++++++++++++++=
++--
 drivers/gpu/drm/ast/ast_dp.c                       |   3 +
 drivers/gpu/drm/drm_client_modeset.c               |   3 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  42 ++-
 drivers/gpu/drm/i915/display/intel_cdclk.h         |   3 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |   5 +
 drivers/gpu/drm/i915/display/intel_dp.c            |   6 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |   5 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  11 +
 drivers/gpu/drm/i915/display/intel_vrr.c           |   7 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  23 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |   4 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   4 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |   2 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  34 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |   8 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |   6 +-
 drivers/gpu/drm/msm/msm_fb.c                       |   6 +-
 drivers/gpu/drm/msm/msm_kms.c                      |   4 +-
 .../gpu/drm/nouveau/nvkm/subdev/bios/shadowof.c    |   7 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     |   2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |  13 +-
 drivers/gpu/drm/qxl/qxl_release.c                  |  50 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |  11 +-
 drivers/gpu/drm/xe/display/xe_display.c            |   5 -
 drivers/gpu/drm/xe/regs/xe_engine_regs.h           |   2 +-
 drivers/gpu/drm/xe/xe_hwmon.c                      |   4 +-
 drivers/gpu/drm/xe/xe_lrc.c                        |   5 +-
 drivers/gpu/drm/xe/xe_migrate.c                    |   8 +-
 drivers/gpu/host1x/bus.c                           |   8 -
 include/linux/dma-fence.h                          |   7 +
 73 files changed, 930 insertions(+), 266 deletions(-)
