Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DA593CD22
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 06:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E2A10E12F;
	Fri, 26 Jul 2024 04:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jXTRyKzR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C92210E023
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 04:00:43 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52efbc57456so1001616e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 21:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721966441; x=1722571241; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oYzy0INYB4eflqD1jaYb5yq+dDkitEPiCdj1V15IGSk=;
 b=jXTRyKzRe43RCdTCa+ixLnym47BPSFKsIHu0eRbX4DAul2NUsu2XNmX6drGkrUeyqp
 36zafGsbx3uUqspMALGegHbxR6t/sNKZv9qwGuDUr64C5oMLQGU4qT0CKrYWZhEHCg/e
 An3DxWdtw4H5zxhJXkIw61XlUaHTijYadFii54C1TwRcXF0OqLmak6Ay4aQ14EBTst8l
 dgr/GhPpPwWtKsAkRYo4eXYFl3xS537OiXkNGhWDqtBNDLx1GPqN6uI0QI6WFxsd38Po
 KW2989uD2u1BbOR5M+W51HvCeVUDXxlZ1eVJJ+5NLcwcS74mGGmJK6EdSteK6tKaN28n
 Tpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721966441; x=1722571241;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oYzy0INYB4eflqD1jaYb5yq+dDkitEPiCdj1V15IGSk=;
 b=rb4To8LGK9oft9uS8lenjcD3TSmSElfK8dBM5KH6zGW3AQwVdPc96rho+9Vj/xMvzU
 SiN7orlc+kJde9CSOm3ev3HZOjbz1UzclQdJBBlufHszgIbpnUJT0nz0SruN6t3hGUQl
 lef/3W9ayM+k6oPb9/mtLab8wz5gLJSEr0y7GCEo/IIWAd1SQU91jF3jY+JdhnFWneHb
 TgO8ABVdPEMo1z3ZF928uXOOd0Elu9ub9zJN1mxbcR2phIoTQc3Y4auNoCnDNEOWyHKl
 Vw+wR59BpxdLUbtNCsKSHBZMNyDtqPKHOOPrW5uxoWKf3n45g5cPvhZAaszHxo/sonkN
 Hwxw==
X-Gm-Message-State: AOJu0Yx2LYWA6MjwbXreHq1IK1vpcV+LfeNOR2uIlXm9YzUTPecbqY69
 Ee7Mpa3fqdliRrglmwUNFLRwTXzzAxxABoru59CX8IzIx22EE/UJ3SnkpQqBHrdZ1MqKJTbGdJS
 kY5ax4THdxXWWxg8GjLfAyABgMlY=
X-Google-Smtp-Source: AGHT+IEPMMZjgxVxh3fasw56zM4zJ+ABOSO/wLULVTjWshFuaZWNYJv+tHgGYKGBfKOf7yFGYZGmtC6z6NfdIdehExg=
X-Received: by 2002:a05:6512:3b9c:b0:52f:d090:6dae with SMTP id
 2adb3069b0e04-52fd3f8e7a4mr3507195e87.52.1721966440768; Thu, 25 Jul 2024
 21:00:40 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 26 Jul 2024 14:00:29 +1000
Message-ID: <CAPM=9txAJoSXCOZHfjf2yObhi7tdQMxjXGggmujbjv1uLdZTew@mail.gmail.com>
Subject: [git pull] drm fixes for 6.11-rc1
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

Fixes for rc1, mostly amdgpu, i915 and xe, with some other misc ones,
doesn't seem to be anything too serious.

Dave.

drm-next-2024-07-26:
drm fixes for 6.11-rc1

amdgpu:
- Bump driver version for GFX12 DCC
- DC documention warning fixes
- VCN unified queue power fix
- SMU fix
- RAS fix
- Display corruption fix
- SDMA 5.2 workaround
- GFX12 fixes
- Uninitialized variable fix
- VCN/JPEG 4.0.3 fixes
- Misc display fixes
- RAS fixes
- VCN4/5 harvest fix
- GPU reset fix

i915:
- Reset intel_dp->link_trained before retraining the link
- Don't switch the LTTPR mode on an active link
- Do not consider preemption during execlists_dequeue for gen8
- Allow NULL memory region

xe:
- xe_exec ioctl minor fix on sync entry cleanup upon error
- SRIOV: limit VF LMEM provisioning
- Wedge mode fixes

v3d:
- fix indirect dispatch on newer v3d revs

panel:
- fix panel backlight bindings
The following changes since commit 478a52707b0abe98aac7f8c53ccddb759be66b06=
:

  Merge tag 'amd-drm-next-6.11-2024-07-12' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2024-07-18
09:20:00 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2024-07-26

for you to fetch changes up to d4ef5d2b7ee0cbb5f2d864716140366a618400d6:

  Merge tag 'amd-drm-fixes-6.11-2024-07-25' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2024-07-26
09:52:15 +1000)

----------------------------------------------------------------
drm fixes for 6.11-rc1

amdgpu:
- Bump driver version for GFX12 DCC
- DC documention warning fixes
- VCN unified queue power fix
- SMU fix
- RAS fix
- Display corruption fix
- SDMA 5.2 workaround
- GFX12 fixes
- Uninitialized variable fix
- VCN/JPEG 4.0.3 fixes
- Misc display fixes
- RAS fixes
- VCN4/5 harvest fix
- GPU reset fix

i915:
- Reset intel_dp->link_trained before retraining the link
- Don't switch the LTTPR mode on an active link
- Do not consider preemption during execlists_dequeue for gen8
- Allow NULL memory region

xe:
- xe_exec ioctl minor fix on sync entry cleanup upon error
- SRIOV: limit VF LMEM provisioning
- Wedge mode fixes

v3d:
- fix indirect dispatch on newer v3d revs

panel:
- fix panel backlight bindings

----------------------------------------------------------------
Alex Deucher (2):
      drm/amd/display: fix corruption with high refresh rates on DCN 3.0
      drm/amdgpu/sdma5.2: Update wptr registers as well as doorbell

Alex Hung (1):
      drm/amd/display: Add doc entry for program_3dlut_size

Ashutosh Dixit (1):
      drm/xe/exec: Fix minor bug related to xe_sync_entry_cleanup

Aurabindo Pillai (2):
      drm/amd: Bump KMS_DRIVER_MINOR version
      drm/amd/display: fix doc entry for bb_from_dmub

Boyuan Zhang (2):
      drm/amdgpu/vcn: identify unified queue in sw init
      drm/amdgpu/vcn: not pause dpg for unified queue

Dave Airlie (7):
      Merge tag 'drm-intel-next-fixes-2024-07-18' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-xe-next-fixes-2024-07-18' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-misc-next-fixes-2024-07-19' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'amd-drm-fixes-6.11-2024-07-18' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-next-fixes-2024-07-25' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-misc-next-fixes-2024-07-25' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'amd-drm-fixes-6.11-2024-07-25' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

David Belanger (1):
      drm/amdgpu: Fix atomics on GFX12

Imre Deak (2):
      drm/i915/dp: Reset intel_dp->link_trained before retraining the link
      drm/i915/dp: Don't switch the LTTPR mode on an active link

Jane Jian (1):
      drm/amdgpu/vcn: Use offsets local to VCN/JPEG in VF

Jonathan Cavitt (1):
      drm/i915: Allow NULL memory region

Li Ma (1):
      drm/amd/swsmu: enable Pstates profile levels for SMU v14.0.4

Lijo Lazar (2):
      drm/amdgpu: Add empty HDP flush function to JPEG v4.0.3
      drm/amdgpu: Add empty HDP flush function to VCN v4.0.3

Ma Ke (1):
      drm/amd/amdgpu: Fix uninitialized variable warnings

Matthew Brost (2):
      drm/xe: Wedge the entire device
      drm/xe: Don't suspend device upon wedge

Ma=C3=ADra Canal (2):
      drm/v3d: Add V3D tech revision to the device information
      drm/v3d: Fix Indirect Dispatch configuration for V3D 7.1.6 and later

Michal Wajdeczko (1):
      drm/xe/pf: Limit fair VF LMEM provisioning

Nitin Gote (1):
      drm/i915/gt: Do not consider preemption during execlists_dequeue for =
gen8

Rodrigo Siqueira (7):
      drm/amd/display: Move DIO documentation to the right place
      Documentation/gpu: Remove ':export:' option from DCN documentation
      Documentation/gpu: Adjust DCN documentation paths
      drm/amd/display: Add simple struct doc to remove doc build warning
      Documentation/gpu: Remove undocumented files from dcn-blockshubbub.h
      Documentation/amdgpu: Fix duplicate declaration
      drm/amd/display: Remove ASSERT if significance is zero in math_ceil2

Roman Li (1):
      drm/amd/display: Add function banner for idle_workqueue

Stanley.Yang (1):
      drm/amdgpu: Fix eeprom max record count

Stephan Gerhold (1):
      dt-bindings: display: panel: samsung,atna33xc20: Document ATNA45AF01

Sung Joon Kim (1):
      drm/amd/display: Check for NULL pointer

Tim Huang (2):
      drm/amd/pm: early return if disabling DPMS for GFX IP v11.5.2
      drm/amdgpu: add missed harvest check for VCN IP v4/v5

YiPeng Chai (2):
      drm/amdgpu: add mutex to protect ras shared memory
      drm/amdgpu: fix ras UE error injection failure issue

ZhenGuo Yin (1):
      drm/amdgpu: reset vm state machine after gpu reset(vram lost)

 .../bindings/display/panel/samsung,atna33xc20.yaml |   8 +-
 Documentation/gpu/amdgpu/display/dcn-blocks.rst    |  35 +-----
 .../gpu/amdgpu/display/display-manager.rst         |   4 +-
 drivers/gpu/drm/amd/amdgpu/Makefile                |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_df.h             |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 121 ++++++++++++++---=
----
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c         |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  53 +++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   9 +-
 drivers/gpu/drm/amd/amdgpu/df_v4_15.c              |  45 ++++++++
 drivers/gpu/drm/amd/amdgpu/df_v4_15.h              |  30 +++++
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |  27 ++++-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  12 ++
 drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c          |   2 +-
 drivers/gpu/drm/amd/amdgpu/soc24.c                 |   4 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   6 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |  54 ++++++++-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |   6 +
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |   6 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  17 ++-
 drivers/gpu/drm/amd/display/dc/core/dc_surface.c   |   3 +-
 .../src/dml2_standalone_libraries/lib_float_math.c |   2 -
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |  22 +++-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |  14 +++
 drivers/gpu/drm/amd/display/dc/inc/hw/opp.h        |  15 +++
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.c   |  29 +++++
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.h   |   9 --
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c |  15 +--
 .../gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c |  10 ++
 .../drm/amd/include/asic_reg/df/df_4_15_offset.h   |  28 +++++
 .../drm/amd/include/asic_reg/df/df_4_15_sh_mask.h  |  28 +++++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  16 +--
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |  18 ++-
 drivers/gpu/drm/i915/display/intel_dp.c            |   2 +
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  55 ++++++++--
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |   6 +-
 drivers/gpu/drm/i915/intel_memory_region.c         |   6 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |   5 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |   8 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |  16 ++-
 drivers/gpu/drm/xe/xe_device.c                     |  20 ++++
 drivers/gpu/drm/xe/xe_exec.c                       |  14 +--
 drivers/gpu/drm/xe/xe_gt.c                         |  15 +++
 drivers/gpu/drm/xe/xe_gt.h                         |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |   1 +
 drivers/gpu/drm/xe/xe_guc.c                        |  16 +++
 drivers/gpu/drm/xe/xe_guc.h                        |   1 +
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  38 ++++---
 drivers/gpu/drm/xe/xe_guc_submit.h                 |   1 +
 drivers/gpu/drm/xe/xe_uc.c                         |  14 +++
 drivers/gpu/drm/xe/xe_uc.h                         |   1 +
 56 files changed, 690 insertions(+), 197 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/df_v4_15.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/df_v4_15.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/df/df_4_15_offset.=
h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/df/df_4_15_sh_mask=
.h
