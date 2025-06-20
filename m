Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8994CAE11C5
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 05:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C0410EA95;
	Fri, 20 Jun 2025 03:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a1vZw1v4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7E310EA95
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 03:25:46 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-addda47ebeaso283452766b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 20:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750389945; x=1750994745; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fNc/KZVyF2TYBehYCjjppQsaMuU91LnLZJJtO4t02lA=;
 b=a1vZw1v4tTBoa5R+kPL014Yn3udTvf6BkYljbERSeq9RSFLSmwXU/JqM0LJqXPseW3
 ZWL/Uyj+2JcfhrREQ3DG4Aw5ExXTAXgFKJwB1SCHYRpneB5Xk7KC6a78THHRm4MomUdf
 1l8gH5StYXz5pG4vxW4ICS204Ji6cx2tz2al+y1ssWA0VTLGAwKnvInp8AHjCtTnPbzi
 od8tVCEiJYmf802QUcqZc66mPuiLWKvWZf0bvYKzRiMoROZGHHwx/2LUiGp7c9TFAgBN
 ExQKbAJbviXvozFIm6LJ5SGn3WinjNGfxVh/SB96RcYciZDJ6oilJ+G/ar1VTscT8f2u
 yGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750389945; x=1750994745;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fNc/KZVyF2TYBehYCjjppQsaMuU91LnLZJJtO4t02lA=;
 b=JDYdccCWMj8pKIC0EHMtFHzh/oSr4jEViARMBHc2NqF6t38kKUv0D13y48q/CzJEoB
 ilXRa5TjfZc3l87hCO7vNdLgXDOjVerlQOvI52u6mdWyEU4i6b8QhhGtXtenUpdIQTvi
 CxkV+1iVQvlWLrqLcq/ZlbfYFkdfvQXdpuhQZF06R/pW6XM4bpLMj987U5/Yl/0xj6ZZ
 CbLYdJhu5+w85F4CUf8EIhnCDyYoyRbmXTJNWcevBK3VeItpUbaCFjZEMvRGc6UW+a/I
 fJyd2Th19bXJSDpY9P75clv1yhjilpf32HCtX/Maoan4EVN7flRX9dhh0rHQOYFuolXF
 7Xiw==
X-Gm-Message-State: AOJu0YwW9nLWrcTHD186Q+KP8BkFetJ4eRx3xPlvt53EcNNNA5F+pcKm
 2a9JfKonMPWLIYDF12u53ZH+FKAuHxef+af2iZdfR21a8HClrNTPhTi6Qt0nDPN2j6rwX/rX7a1
 pjGA+z4Prdi6rJYxUFUdS1R/OorcahvQ=
X-Gm-Gg: ASbGncvX/Je6Tgqsrtcvne8ibtfKWA2ysrDAVNuD+2hlJnKVfDaXTacTdrnecrW2uZ4
 kBeqTV53DAGCTOr//XcuJ3rEWLeu3zHC9cPLGtTvK6jV5rrAR1oqq1PclgpfIL3ceq+e0H89VlF
 1nd4qhmMPp9MpPfUtT/cc20R4vQw+ZwPzLWHPazmcrQA==
X-Google-Smtp-Source: AGHT+IET8xWO1D+x00RVkTeuPqvd992UPFSm86bfBkgnM4s78zQiG2ovHpKlTOImo44IANEEWFSQZ5F+OYX/DAbMyhc=
X-Received: by 2002:a17:907:3f0c:b0:adb:469d:2221 with SMTP id
 a640c23a62f3a-ae057bb8de1mr82186766b.45.1750389944395; Thu, 19 Jun 2025
 20:25:44 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 20 Jun 2025 13:25:32 +1000
X-Gm-Features: AX0GCFvn3TUUoghVh90ptscpSJQdBrJP2lqef56U6lSm5W85zQX-UWdzoa77-pI
Message-ID: <CAPM=9txjJTL-dgwgrZbsiQzAHxe97vQ6mrttCxnf0okZQ5t3gQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.16-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
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

Bit of an uptick in fixes for rc3, msm and amdgpu leading the way,
with i915/xe/nouveau with a few each and then some scattered misc
bits, nothing looks too crazy,

Dave.

drm-fixes-2025-06-20:
drm fixes for 6.16-rc3

msm:
- Display:
  - Fixed DP output on SDM845
  - Fixed 10nm DSI PLL init
- GPU:
  - SUBMIT ioctl error path leak fixes
  - drm half of stall-on-fault fixes.
  - a7xx: Missing CP_RESET_CONTEXT_STATE
  - Skip GPU component bind if GPU is not in the device table.

i915:
- Fix MIPI vtotal programming off by one on Broxton
- Fix PMU code for GCOV and AutoFDO enabled build

xe:
- A workaround update
- Fix memset on iomem
- Fix early wedge on GuC Load failure

amdgpu:
- DP tunneling fix
- LTTPR fix
- DSC fix
- DML2.x ABGR16161616 fix
- RMCM fix
- Backlight fixes
- GFX11 kicker support
- SDMA reset fixes
- VCN 5.0.1 fix
- Reset fix
- Misc small fixes

amdkfd:
- SDMA reset fix
- Fix race in GWS scheduling

nouveau:
- update docs reference
- fix backlight name buffer size
- fix UAF in r535 gsp rpc msg
- fix undefined shift

mgag200:
- drop export header

ast:
- drop export header

malidp:
- drop informational error

ssd130x:
- fix clear columns

etnaviv:
- scheduler locking fix

v3d:
- null pointer crash fix
The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e=
:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-06-20

for you to fetch changes up to b8de9b21e8499a09ef424e101a8703e8e1866bfd:

  Merge tag 'drm-xe-fixes-2025-06-19' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-06-20 09:01:51 +1000)

----------------------------------------------------------------
drm fixes for 6.16-rc3

msm:
- Display:
  - Fixed DP output on SDM845
  - Fixed 10nm DSI PLL init
- GPU:
  - SUBMIT ioctl error path leak fixes
  - drm half of stall-on-fault fixes.
  - a7xx: Missing CP_RESET_CONTEXT_STATE
  - Skip GPU component bind if GPU is not in the device table.

i915:
- Fix MIPI vtotal programming off by one on Broxton
- Fix PMU code for GCOV and AutoFDO enabled build

xe:
- A workaround update
- Fix memset on iomem
- Fix early wedge on GuC Load failure

amdgpu:
- DP tunneling fix
- LTTPR fix
- DSC fix
- DML2.x ABGR16161616 fix
- RMCM fix
- Backlight fixes
- GFX11 kicker support
- SDMA reset fixes
- VCN 5.0.1 fix
- Reset fix
- Misc small fixes

amdkfd:
- SDMA reset fix
- Fix race in GWS scheduling

nouveau:
- update docs reference
- fix backlight name buffer size
- fix UAF in r535 gsp rpc msg
- fix undefined shift

mgag200:
- drop export header

ast:
- drop export header

malidp:
- drop informational error

ssd130x:
- fix clear columns

etnaviv:
- scheduler locking fix

v3d:
- null pointer crash fix

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu: switch job hw_fence to amdgpu_fence
      drm/amdgpu/sdma5: init engine reset mutex
      drm/amdgpu/sdma5.2: init engine reset mutex

Alex Hung (2):
      drm/amd/display: Fix mpv playback corruption on weston
      drm/amd/display: Check dce_hwseq before dereferencing it

Alexander Stein (1):
      drm/arm/malidp: Silence informational message

Bagas Sanjaya (1):
      Documentation: nouveau: Update GSP message queue kernel-doc reference

Colin Ian King (1):
      drm/nouveau/gsp: Fix potential integer overflow on integer shifts

Connor Abbott (5):
      drm/msm: Don't use a worker to capture fault devcoredump
      drm/msm: Delete resume_translation()
      drm/msm: Temporarily disable stall-on-fault after a page fault
      drm/msm: Fix CP_RESET_CONTEXT_STATE bitfield names
      drm/msm/a7xx: Call CP_RESET_CONTEXT_STATE

Daniele Ceraolo Spurio (1):
      drm/xe: Fix early wedge on GuC load failure

Dave Airlie (5):
      Merge tag 'drm-msm-fixes-2025-06-16' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      Merge tag 'drm-intel-fixes-2025-06-18' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.16-2025-06-18' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2025-06-19' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-06-19' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Frank Min (2):
      drm/amdgpu: Add kicker device detection
      drm/amdgpu: add kicker fws loading for gfx11/smu13/psp13

Jacob Keller (1):
      drm/nouveau/bl: increase buffer size to avoid truncate warning

James A. MacInnes (2):
      drm/msm/dp: Disable wide bus support for SDM845
      drm/msm/disp: Correct porch timing for SDM845

Jay Cornwall (1):
      drm/amdkfd: Fix race in GWS queue scheduling

Jesse Zhang (3):
      drm/amdgpu: Fix SDMA engine reset with logical instance ID
      drm/amdgpu: Use logical instance ID for SDMA v4_4_2 queue operations
      drm/amdgpu: Fix SDMA UTC_L1 handling during start/stop sequences

Jesse.Zhang (1):
      drm/amdkfd: move SDMA queue reset capability check to node_show

John Keeping (1):
      drm/ssd130x: fix ssd132x_clear_screen() columns

Krzysztof Kozlowski (1):
      drm/msm/dsi/dsi_phy_10nm: Fix missing initial VCO rate

Lijo Lazar (1):
      drm/amdgpu: Release reset locks during failures

Lucas De Marchi (1):
      drm/xe: Fix memset on iomem

Mario Limonciello (2):
      drm/amd/display: Only read ACPI backlight caps once
      drm/amd/display: Export full brightness range to userspace

Ma=C3=ADra Canal (2):
      drm/v3d: Avoid NULL pointer dereference in `v3d_job_update_stats()`
      drm/etnaviv: Protect the scheduler's pending list with its lock

Michael Strauss (1):
      drm/amd/display: Get LTTPR IEEE OUI/Device ID From Closest LTTPR To H=
ost

Nicholas Kazlauskas (1):
      drm/amd/display: Add more checks for DSC / HUBP ONO guarantees

Peichen Huang (1):
      drm/amd/display: Add dc cap for dp tunneling

Rob Clark (6):
      drm/msm: Fix a fence leak in submit error path
      drm/msm: Fix another leak in the submit error path
      drm/msm: Rename add_components_mdp()
      drm/msm/adreno: Pass device_node to find_chipid()
      drm/msm/adreno: Check for recognized GPU before bind
      drm/msm: Fix inverted WARN_ON() logic

Ryan Eatmon (1):
      drivers: gpu: drm: msm: registers: improve reproducibility

Sonny Jiang (1):
      drm/amdgpu: VCN v5_0_1 to prevent FW checking RB during DPG pause

Thomas Zimmermann (2):
      drm/ast: Do not include <linux/export.h>
      drm/mgag200: Do not include <linux/export.h>

Tzung-Bi Shih (1):
      drm/i915/pmu: Fix build error with GCOV and AutoFDO enabled

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915/dsi: Fix off by one in BXT_MIPI_TRANS_VTOTAL

Vinay Belgaumkar (1):
      drm/xe/bmg: Update Wa_16023588340

Yihan Zhu (1):
      drm/amd/display: Fix RMCM programming seq errors

Zhi Wang (1):
      drm/nouveau: fix a use-after-free in r535_gsp_rpc_push()

 Documentation/gpu/nouveau.rst                      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 82 +++++++++++++++---=
----
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          | 30 ++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            | 12 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 16 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           | 16 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           | 10 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          | 17 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |  6 ++
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  5 ++
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |  9 ++-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |  2 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           | 10 ++-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |  1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            |  6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  6 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 57 +++++++++------
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 33 +++++++++
 drivers/gpu/drm/amd/display/dc/dc.h                |  8 ++-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |  4 +-
 .../dc/dml2/dml21/dml21_translation_helper.c       |  1 +
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |  5 +-
 .../amd/display/dc/dml2/dml2_translation_helper.c  |  1 +
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  2 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    | 28 ++++++++
 .../display/dc/link/protocols/link_dp_capability.c | 38 ++++++++--
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |  3 +
 .../display/dc/resource/dcn314/dcn314_resource.c   |  3 +
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |  3 +
 .../display/dc/resource/dcn351/dcn351_resource.c   |  3 +
 .../amd/display/dc/resource/dcn36/dcn36_resource.c |  3 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     | 12 +++-
 drivers/gpu/drm/arm/malidp_planes.c                |  2 +-
 drivers/gpu/drm/ast/ast_mode.c                     |  1 -
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |  5 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |  4 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |  4 +-
 drivers/gpu/drm/mgag200/mgag200_ddc.c              |  1 -
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c           |  5 --
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |  2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 18 +++++
 drivers/gpu/drm/msm/adreno/adreno_device.c         | 39 +++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            | 54 +++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  2 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 14 ++--
 drivers/gpu/drm/msm/dp/dp_display.c                |  7 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         |  7 ++
 drivers/gpu/drm/msm/msm_debugfs.c                  | 32 +++++++++
 drivers/gpu/drm/msm/msm_drv.c                      | 10 ++-
 drivers/gpu/drm/msm/msm_drv.h                      | 23 ++++++
 drivers/gpu/drm/msm/msm_gem_submit.c               | 17 ++++-
 drivers/gpu/drm/msm/msm_gpu.c                      | 20 +++---
 drivers/gpu/drm/msm/msm_gpu.h                      |  9 +--
 drivers/gpu/drm/msm/msm_iommu.c                    | 12 ++--
 drivers/gpu/drm/msm/msm_mmu.h                      |  2 +-
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  3 +-
 drivers/gpu/drm/msm/registers/gen_header.py        |  8 ++-
 drivers/gpu/drm/nouveau/nouveau_backlight.c        |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c  | 17 +++--
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c  |  2 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |  2 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |  8 ++-
 drivers/gpu/drm/xe/xe_gt.c                         |  2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |  8 +++
 drivers/gpu/drm/xe/xe_guc_ct.c                     |  7 +-
 drivers/gpu/drm/xe/xe_guc_ct.h                     |  5 ++
 drivers/gpu/drm/xe/xe_guc_pc.c                     |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  3 +
 72 files changed, 599 insertions(+), 201 deletions(-)
