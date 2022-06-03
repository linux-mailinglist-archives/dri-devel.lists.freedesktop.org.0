Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E7153C370
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 05:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56E8113087;
	Fri,  3 Jun 2022 03:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FE7113087
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 03:50:00 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id m20so13539732ejj.10
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 20:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=ctur9uRkITz6CglrUFDlpJBnu0CWkLySXf1JA/aRsYs=;
 b=Z6oH1XRP3ZYFAUnPvlfTBnsYntAkDA1CoGWL1DHOenqthtMt+Emj4qDaCTRLisp+qU
 Q5UXvoG/EThC62kvOeqBsAgWG1KvkXmOGERe9FUR+MNioOk+JCInDdyB2+GhDZvEJ4BO
 PKioJH9ojtXFNlfZXhVt1ddlMj5qgMhK45XBuOLCSpjKZ9/Air6rH9PGfM+atU4IZCOC
 SgP/9Nq6d8A0VwJ2QmuLMSH+qmvVuJS5gFkxTCutlSKDoSttbu+jEs/o0G2xuvlucHCV
 /oPwRoyL3o/Lzc+VDbjcp5aStb67SMaWNuwH6kVJG6JKAlbJc5LNILo4cE3dHd+xmNFn
 STnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=ctur9uRkITz6CglrUFDlpJBnu0CWkLySXf1JA/aRsYs=;
 b=WRY6ixKd9v6qcrHhJIrpF74+RLGbxV6l7ZfC4HQjr7LqMAKROf3gwJogu3D1Hx3SaI
 f785jm0am77s4q4Qc3UeFRLhqUVL8QjsDShUFyAAqosVz0XWKJbi3lnO8hyOQp316wi7
 vNonbKza1X87x7nxC3ugRCQ8+aKZPxwOaH/jghXJgmLoFiJArjZGRQ95IZU67mpLeJGu
 4I2dpxfr77vxeEblPxScu2OgOK99vBQQN9TXxF+XeEf2dnernSZacgFMcTiCgIKfExkt
 vrewai2Iqv1btUNux6SBFfD9L8avOB6dOeHAES6eh9a9L/0wEewGD+HLv46EEmf7vPtl
 liIw==
X-Gm-Message-State: AOAM5300j5XshPSmn5Yfm7+qwHoVF+T5vmWbS+qo1sl4ztcUx7m1riYq
 leIwwTDMfpR0wQPdWmx6BGEKkRXfqdodw+7az2A=
X-Google-Smtp-Source: ABdhPJwk3nywoVYfD/0iakv2iuGmL27+oUfvFMdRqKnpBYE5dmMK1F7lCbzSQKpwnsFCZBjvXYbDCz0KkUh7TBXQxps=
X-Received: by 2002:a17:907:9605:b0:6f5:c66:7c13 with SMTP id
 gb5-20020a170907960500b006f50c667c13mr6834180ejc.66.1654228199283; Thu, 02
 Jun 2022 20:49:59 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 3 Jun 2022 13:49:48 +1000
Message-ID: <CAPM=9tyz_Waptpxd82f8fLLeqt9pp8dOUCxjxA0YtaOs31r+Fw@mail.gmail.com>
Subject: [git pull] drm for 5.19-rc1 part2/fixes
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

It's been a long "my first covid" isolated week. hopefully stop
coughing sometime next week!

This is mostly regular fixes, msm and amdgpu. There is a tegra patch
that is bit of prep work for a 5.20 feature to avoid some inter-tree
syncs, and a couple of late addition amdgpu uAPI changes but best to
get those in early, and the userspace pieces are ready.

Dave.

drm-next-2022-06-03-1:
drm next for 5.19-rc1 (part 2/fixes)

msm:
- Limiting WB modes to max sspp linewidth
- Fixing the supported rotations to add 180 back for IGT
- Fix to handle pm_runtime_get_sync() errors to avoid unclocked access
  in the bind() path for dpu driver
- Fix the irq_free() without request issue which was a big-time
  hitter in the CI-runs.

amdgpu:
- Update fdinfo to the common drm format
- uapi: Add VM_NOALLOC GPUVM attribute to prevent buffers for going
into the MALL
  Add AMDGPU_GEM_CREATE_DISCARDABLE flag to create buffers that can be
discarded on eviction
  Mesa code which uses these:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/16466
- Link training fixes
- DPIA fixes
- Misc code cleanups
- Aux fixes
- Hotplug fixes
- More FP clean up
- Misc GFX9/10 fixes
- Fix a possible memory leak in SMU shutdown
- SMU 13 updates
- RAS fixes
- TMZ fixes
- GC 11 updates
- SMU 11 metrics fixes
- Fix coverage blend mode for overlay plane
- Note DDR vs LPDDR memory
- Fuzz fix for CS IOCTL
- Add new PCI DID

amdkfd:
- Clean up hive setup
- Misc fixes

tegra:
- add some prelim 5.20 work to avoid inter-tree mess
The following changes since commit c4955d9cd2fc56c43e78c908dad4e2cac7cc9073=
:

  Merge tag 'drm-intel-next-fixes-2022-05-24' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next (2022-05-25
12:03:41 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-06-03-1

for you to fetch changes up to 404204340c0dc54e4b779737201044dcb231f0bf:

  Merge tag 'drm/tegra/for-5.19-prep-work' of
https://gitlab.freedesktop.org/drm/tegra into drm-next (2022-06-03
12:59:45 +1000)

----------------------------------------------------------------
drm next for 5.19-rc1 (part 2/fixes)

msm:
- Limiting WB modes to max sspp linewidth
- Fixing the supported rotations to add 180 back for IGT
- Fix to handle pm_runtime_get_sync() errors to avoid unclocked access
  in the bind() path for dpu driver
- Fix the irq_free() without request issue which was a big-time
  hitter in the CI-runs.

amdgpu:
- Update fdinfo to the common drm format
- uapi: Add VM_NOALLOC GPUVM attribute to prevent buffers for going
into the MALL
  Add AMDGPU_GEM_CREATE_DISCARDABLE flag to create buffers that can be
discarded on eviction
  Mesa code which uses these:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/16466
- Link training fixes
- DPIA fixes
- Misc code cleanups
- Aux fixes
- Hotplug fixes
- More FP clean up
- Misc GFX9/10 fixes
- Fix a possible memory leak in SMU shutdown
- SMU 13 updates
- RAS fixes
- TMZ fixes
- GC 11 updates
- SMU 11 metrics fixes
- Fix coverage blend mode for overlay plane
- Note DDR vs LPDDR memory
- Fuzz fix for CS IOCTL
- Add new PCI DID

amdkfd:
- Clean up hive setup
- Misc fixes

tegra:
- add some prelim 5.20 work to avoid inter-tree mess

----------------------------------------------------------------
Alan Liu (1):
      drm/amd/display: Add HDMI_ACP_SEND register

Alex Deucher (3):
      drm/amdgpu/discovery: validate VCN and SDMA instances
      drm/amdgpu: differentiate between LP and non-LP DDR memory
      drm/amdgpu: add beige goby PCI ID

Alvin Lee (1):
      drm/amd/display: Clean up code in dc

Aric Cyr (1):
      drm/amd/display: 3.2.186

Bhawanpreet Lakha (1):
      drm/amd/display: Fic incorrect pipe being used for clk update

Candice Li (1):
      drm/amdgpu: Resolve pcie_bif RAS recovery bug

Christian K=C3=B6nig (6):
      drm/amdgpu: cleanup ctx implementation
      drm/amdgpu: add AMDGPU_GEM_CREATE_DISCARDABLE
      drm/amdgpu: add AMDGPU_VM_NOALLOC v2
      drm/amdgpu: bump minor version number
      drm/amdgpu: Convert to common fdinfo format v5
      drm/amdgpu: add drm-client-id to fdinfo v2

Dan Carpenter (2):
      drm/amdgpu/pm: smu_v13_0_4: delete duplicate condition
      drm/amdgpu: Off by one in dm_dmub_outbox1_low_irq()

Dave Airlie (5):
      drm/amdgpu/cs: make commands with 0 chunks illegal behaviour.
      Merge tag 'amd-drm-next-5.19-2022-05-26' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'amd-drm-next-5.19-2022-05-26-2' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'msm-next-5.19-fixes-06-01' of
https://gitlab.freedesktop.org/abhinavk/msm into drm-next
      Merge tag 'drm/tegra/for-5.19-prep-work' of
https://gitlab.freedesktop.org/drm/tegra into drm-next

David Galiffi (1):
      drm/amd/display: Check if modulo is 0 before dividing.

Derek Lai (1):
      drm/amd/display: Allow individual control of eDP hotplug support

Douglas Anderson (1):
      drm/msm/dpu: Move min BW request and full BW disable back to mdss

Eric Huang (1):
      drm/amdkfd: port cwsr trap handler from dkms branch

Evan Quan (8):
      drm/amd/pm: enable more dpm features for SMU 13.0.0
      drm/amd/pm: skip dpm disablement on suspend for SMU 13.0.0
      drm/amd/pm: update SMU 13.0.0 driver_if header
      drm/amd/pm: correct the softpptable ids used for SMU 13.0.0
      drm/amd/pm: enable more dpm features for SMU 13.0.0
      drm/amd/pm: enable memory temp reading for SMU 13.0.0
      drm/amd/pm: correct the metrics version for SMU 11.0.11/12/13
      drm/amdgpu: suppress some compile warnings

Gong Yuanjun (2):
      drm/radeon: fix a possible null pointer dereference
      drm/amd/pm: fix a potential gpu_metrics_table memory leak

Haohui Mai (3):
      drm/amdgpu: Clean up of initializing doorbells for gfx_v9 and gfx_v10
      drm/amdgpu: Set CP_HQD_PQ_CONTROL.RPTR_BLOCK_SIZE correctly
      drm/amdgpu/gfx10: rework KIQ programming

Haowen Bai (1):
      drm/msm/dpu: Fix pointer dereferenced before checking

Jasdeep Dhillon (1):
      drm/amd/display: Move FPU associated DCN30 code to DML folder

Jay Cornwall (1):
      drm/amdkfd: Add gfx11 trap handler

Jiapeng Chong (1):
      drm/msm/dpu: Remove unused code

Jimmy Kizito (2):
      drm/amd/display: Update link training fallback behaviour.
      drm/amd/display: Query DPIA HPD status.

Jonathan Kim (1):
      drm/amdkfd: simplify cpu hive assignment

Julia Lawall (2):
      drm/amdgpu/gfx: fix typos in comments
      drm/amdkfd: fix typo in comment

Kuogee Hsieh (1):
      drm/msm/dp: Always clear mask bits to disable interrupts at
dp_ctrl_reset_irq_ctrl()

Lijo Lazar (2):
      drm/amd/pm: Fix missing thermal throttler status
      drm/amd/pm: Return auto perf level, if unsupported

Michael Strauss (1):
      Revert "drm/amd/display: Refactor LTTPR cap retrieval"

Mikko Perttunen (1):
      gpu: host1x: Add context bus

Nicholas Kazlauskas (1):
      drm/amd/display: Check zero planes for OTG disable W/A on clock chang=
e

Paul Hsieh (1):
      drm/amd/display: clear request when release aux engine

Prike Liang (1):
      drm/amdgpu: clean up asd on the ta_firmware_header_v2_0

Rob Clark (1):
      Merge tag 'msm-next-5.19-fixes' of
https://gitlab.freedesktop.org/abhinavk/msm into msm-fixes-staging

Stanley.Yang (1):
      drm/amdgpu: support ras on SRIOV

Sung Joon Kim (1):
      drm/amd/display: add Coverage blend mode for overlay plane

Sunil Khatri (3):
      drm/amdgpu: move amdgpu_gmc_tmz_set after ip_version populated
      drm/amdgpu: change code name to ip version for tmz set
      drm/amdgpu: add support of tmz for GC 10.3.7

Vinod Koul (1):
      drm/msm/disp/dpu1: remove superfluous init

 drivers/gpu/Makefile                               |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |  223 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h            |   23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c         |   68 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   42 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   48 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |    6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   21 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    3 +
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |    3 +
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   15 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    1 +
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     | 2974 +++++++++++-----=
----
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |  394 ++-
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx9.asm  |  244 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |    6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   22 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   19 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |    2 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |    3 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |    3 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   15 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   24 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  248 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c |   19 +
 drivers/gpu/drm/amd/display/dc/core/dc_surface.c   |    2 +
 drivers/gpu/drm/amd/display/dc/dc.h                |    6 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |    2 -
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |    3 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |    9 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   27 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   17 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |   10 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |  516 +---
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.h  |    5 +
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |    2 +
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |    2 +
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |    2 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |    2 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |    3 +-
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   |  617 ++++
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h   |   67 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |    7 +
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |    3 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dpia.h  |    5 +
 .../drm/amd/display/include/link_service_types.h   |    6 -
 .../amd/include/asic_reg/dce/dce_10_0_sh_mask.h    |    2 +
 .../amd/include/asic_reg/dce/dce_11_0_sh_mask.h    |    2 +
 .../amd/include/asic_reg/dce/dce_11_2_sh_mask.h    |    2 +
 .../amd/include/asic_reg/dce/dce_12_0_sh_mask.h    |    2 +
 .../drm/amd/include/asic_reg/dce/dce_8_0_sh_mask.h |    2 +
 .../drm/amd/include/asic_reg/dcn/dcn_1_0_sh_mask.h |    2 +
 .../amd/include/asic_reg/dcn/dcn_2_0_0_sh_mask.h   |    2 +
 .../amd/include/asic_reg/dcn/dcn_2_0_3_sh_mask.h   |    4 +-
 .../amd/include/asic_reg/dcn/dcn_2_1_0_sh_mask.h   |    2 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |    3 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    1 +
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |   22 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |    2 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   57 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |    1 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   47 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |    8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |   62 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |    3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |    3 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |    4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |    8 -
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |    9 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |   57 +
 drivers/gpu/drm/radeon/radeon_connectors.c         |    4 +
 drivers/gpu/host1x/Kconfig                         |    5 +
 drivers/gpu/host1x/Makefile                        |    1 +
 drivers/gpu/host1x/context_bus.c                   |   31 +
 include/linux/host1x_context_bus.h                 |   15 +
 include/uapi/drm/amdgpu_drm.h                      |    8 +
 92 files changed, 3667 insertions(+), 2553 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h
 create mode 100644 drivers/gpu/host1x/context_bus.c
 create mode 100644 include/linux/host1x_context_bus.h
