Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AB9BCE75A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 22:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFEB10EC81;
	Fri, 10 Oct 2025 20:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JQYcOMzg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C593010EC81
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 20:16:31 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-78f58f4230cso21983476d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 13:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760127391; x=1760732191; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IyyY6yf+4c57T5NwAClMppJzcgYYH3Q4S1WxGMfEkBM=;
 b=JQYcOMzgXQswRs/HL54X82docuh3mI4ee1M96cRX/7nGKsp5l8Mq3buSegftmV+PmE
 xPlSIleWXv2Wzu2bKiSMiIsIiHa1FTrq5k1wC/CTzwJHJNSMiyoLF/oow+jl+ekjksbS
 DicwZCnu1shmdVG9e0AqvsnrRVsApgXfPobEMCxaWqekad/t1vXRt8JjuiubUxJ7Km7s
 CkV84XfhVb4FdQgkgQwVOgpvtZYuxxcSf5zYgefqOC7JzOYEqPEbF7KJvU1M1+atCGUi
 n8s6/pBieLC1/kTZG7j0ttizMcwFGhoszb5vqtKvmUrkhThGgpl6wZUIFPM3UWA0n395
 Jnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760127391; x=1760732191;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IyyY6yf+4c57T5NwAClMppJzcgYYH3Q4S1WxGMfEkBM=;
 b=HSjZ8rqti0KEYrnXe2YpYLurkjPZBt2GW6GCQMNzLXB49eXQERBJSuXE8xTZ3/jLy1
 U7TBkXQQtjQVP8LBQDcxGLk431qVpAxyPAMSFeTdaWT0pGLPptm1QChwQhpDuu2/fy1J
 E2KwoSbEy/PIjUHoud9Zw5GBSWBfiZPfeg842T4x/bGx0v0CK7aUy2JOMnJJ3Oejg29h
 37pBuSAbyG/9VnXdF4IprbT1nS+KNKpa8GLLTHIi48zOmX3lGP7tNagLb0cYhYJYlr7f
 MCoKYxD+Qi4Idhand31DwmfX+BHKFO9PkSBmcJHEUxOZ1dgtnKpI0FKeJTKN5h8QGgfo
 lVjA==
X-Gm-Message-State: AOJu0Yzf9jqFRlyzfgjD6WCeGNQbiAdMRB28Y7rSIslbCohzzCHuv/Qp
 SvM8rgbdAO6rFQnHTly2QrpyOaYpFta/H/o9oDHgDgWmMlp3BhmU/1VaaPA7NO59afxYgCVpT9d
 yXgmpChiZyYzd4eppvpGKqzM5+nUJHUw=
X-Gm-Gg: ASbGncslkNwMGNy8xVzW2wx4IbQ//BBYpWXXapVCpcHlAdWkc4p3S6+TyB9jvzaZ85D
 HUjjiyC1lKJqPF4bt1D7HWdsJdpYTNt7oxyJ0qZ0Id7V47JOl4wAXEaI9HyzbmxN2kw7hyPTnjY
 3lgNKY+VHtfk7qbn3lHmCs5jgTN0lh7IHUlEGs+2z9q7+sBvjoJ3CQ10jSxnnDXWZG+hZCoHB04
 UKC/iCw1PsMihKnjxtmgbgKwpr63cWdqeg=
X-Google-Smtp-Source: AGHT+IFV7ik69eJscJoMw9+EnNUs6Nt7YwwZUaPqyhwXo57w0zkEjYCwY0xTUvheyGGe/aeWY77421jGwpYwoFiMMvQ=
X-Received: by 2002:ad4:5ec5:0:b0:72b:5e10:55bb with SMTP id
 6a1803df08f44-87b2efe832dmr216902686d6.48.1760127390245; Fri, 10 Oct 2025
 13:16:30 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 11 Oct 2025 06:16:19 +1000
X-Gm-Features: AS18NWDidNE6te1vjShzjnEmHtWcEg_uMbx9q7S3rf96FNMxUBsYYJYLlQi55pI
Message-ID: <CAPM=9twb3XAAbMGo9QeQd8mMcGfz2WL6pocaHHEaQfGiAkSKWQ@mail.gmail.com>
Subject: [git pull] drm next fixes for 6.18-rc1
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

Just the follow up fixes for rc1 from the next branch, amdgpu and xe
mostly with a single v3d fix in there. I've got some left over fixes
in my fixes tree, I might send them on as well.

Regards,
Dave.

drm-next-2025-10-11-1:
drm next fixes for 6.18-rc1

amdgpu:
- DC DCE6 fixes
- GPU reset fixes
- Secure diplay messaging cleanup
- MES fix
- GPUVM locking fixes
- PMFW messaging cleanup
- PCI US/DS switch handling fix
- VCN queue reset fix
- DC FPU handling fix
- DCN 3.5 fix
- DC mirroring fix

amdkfd:
- Fix kfd process ref leak
- mmap write lock handling fix
- Fix comments in IOCTL

xe:
- Fix build with clang 16
- Fix handling of invalid configfs syntax usage and spell out the
  expected syntax in the documentation
- Do not try late bind firmware when running as VF since it
  shouldn't handle firmware loading
- Fix idle assertion for local BOs
- Fix uninitialized variable for late binding
- Do not require perfmon_capable to expose free memory at page
  granularity. Handle it like other drm drivers do
- Fix lock handling on suspend error path
- Fix I2C controller resume after S3

v3d:
- fix fence locking
The following changes since commit b2ec5ca9d5c2c019e2316f7ba447596d1dcd8fde=
:

  Merge tag 'amd-drm-next-6.18-2025-09-26' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-09-30
09:26:31 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-10-11-1

for you to fetch changes up to c4b6ddcf01f63a710c24a128d134d3fa51978d6c:

  Merge tag 'amd-drm-next-6.18-2025-10-09' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-10-10
06:57:56 +1000)

----------------------------------------------------------------
drm next fixes for 6.18-rc1

amdgpu:
- DC DCE6 fixes
- GPU reset fixes
- Secure diplay messaging cleanup
- MES fix
- GPUVM locking fixes
- PMFW messaging cleanup
- PCI US/DS switch handling fix
- VCN queue reset fix
- DC FPU handling fix
- DCN 3.5 fix
- DC mirroring fix

amdkfd:
- Fix kfd process ref leak
- mmap write lock handling fix
- Fix comments in IOCTL

xe:
- Fix build with clang 16
- Fix handling of invalid configfs syntax usage and spell out the
  expected syntax in the documentation
- Do not try late bind firmware when running as VF since it
  shouldn't handle firmware loading
- Fix idle assertion for local BOs
- Fix uninitialized variable for late binding
- Do not require perfmon_capable to expose free memory at page
  granularity. Handle it like other drm drivers do
- Fix lock handling on suspend error path
- Fix I2C controller resume after S3

v3d:
- fix fence locking

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: Add additional DCE6 SCL registers

Ard Biesheuvel (1):
      drm/amd/display: Fix unsafe uses of kernel mode FPU

Christian K=C3=B6nig (1):
      drm/amdgpu: partially revert "revert to old status lock handling v3"

Colin Ian King (1):
      drm/xe/xe_late_bind_fw: Fix missing initialization of variable offset

Dave Airlie (3):
      Merge tag 'drm-misc-next-fixes-2025-10-02' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-xe-next-fixes-2025-10-03' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'amd-drm-next-6.18-2025-10-09' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

Fangzhi Zuo (1):
      drm/amd/display: Enable Dynamic DTBCLK Switch

Felix Kuehling (1):
      drm/amdkfd: Fix two comments in kfd_ioctl.h

Heng Zhou (1):
      drm/amdgpu: Fix for GPU reset being blocked by KIQ I/O.

Jesse Agate (1):
      drm/amd/display: Incorrect Mirror Cositing

Jesse.Zhang (3):
      drm/amdgpu: Merge amdgpu_vm_set_pasid into amdgpu_vm_init
      drm/amdgpu: Fix general protection fault in
amdgpu_vm_bo_reset_state_machine
      drm/amd/pm: Disable VCN queue reset on SMU v13.0.6 due to regression

Lijo Lazar (3):
      drm/amd/pm: Avoid interface mismatch messaging
      drm/amdgpu: Check swus/ds for switch state save
      drm/amdgpu: Report individual reset error

Lucas De Marchi (2):
      drm/xe/configfs: Fix engine class parsing
      drm/xe/configfs: Improve doc for ctx_restore* attributes

Mallesh Koujalagi (1):
      drm/xe/xe_late_bind_fw: Initialize uval variable in
xe_late_bind_fw_num_fans()

Mario Limonciello (1):
      drm/amd: Check whether secure display TA loaded successfully

Matthew Auld (1):
      drm/xe/uapi: loosen used tracking restriction

Melissa Wen (1):
      drm/v3d: create a dedicated lock for dma fence

Michal Wajdeczko (3):
      drm/xe/tests: Fix build break on clang 16.0.6
      drm/xe/vf: Rename sriov_update_device_info
      drm/xe/vf: Don't claim support for firmware late-bind if VF

Philip Yang (2):
      drm/amdkfd: Fix kfd process ref leaking when userptr unmapping
      drm/amdkfd: Fix mmap write lock not release

Raag Jadav (1):
      drm/xe/i2c: Don't rely on d3cold.allowed flag in system PM path

Shaoyun Liu (1):
      drm/amd/amdgpu: Fix the mes version that support inv_tlbs

Shuicheng Lin (1):
      drm/xe/hw_engine_group: Fix double write lock release in error path

Thomas Hellstr=C3=B6m (2):
      drm/xe/bo: Fix an idle assertion for local bos
      drm/gpusvm, drm/xe: Fix userptr to not allow device private pages

Timur Krist=C3=B3f (4):
      drm/amd/display: Add missing DCE6 SCL_HORZ_FILTER_INIT* SRIs
      drm/amd/display: Properly clear SCL_*_FILTER_CONTROL on DCE6
      drm/amd/display: Properly disable scaling on DCE6
      drm/amd/display: Disable scaling on DCE6 for now

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  48 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             | 211 +++++++++++------=
----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |  20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |   4 +
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   2 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   4 +
 drivers/gpu/drm/amd/display/dc/dce/dce_transform.c |  21 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_transform.h |   4 +
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |   4 +
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |   6 +-
 .../gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c |   4 +-
 .../amd/display/dc/resource/dce60/dce60_resource.c |   4 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |  16 +-
 .../display/dc/resource/dcn351/dcn351_resource.c   |  17 +-
 .../amd/display/dc/resource/dcn36/dcn36_resource.c |  16 +-
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl.c       |  10 +-
 .../gpu/drm/amd/include/asic_reg/dce/dce_6_0_d.h   |   7 +
 .../drm/amd/include/asic_reg/dce/dce_6_0_sh_mask.h |   2 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   3 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |   2 +
 drivers/gpu/drm/drm_gpusvm.c                       |  24 +--
 drivers/gpu/drm/v3d/v3d_drv.h                      |   2 +
 drivers/gpu/drm/v3d/v3d_fence.c                    |   2 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |   1 +
 drivers/gpu/drm/xe/tests/xe_pci.c                  |  12 +-
 drivers/gpu/drm/xe/xe_bo.c                         |  34 ++--
 drivers/gpu/drm/xe/xe_configfs.c                   |  23 ++-
 drivers/gpu/drm/xe/xe_device.c                     |  19 +-
 drivers/gpu/drm/xe/xe_hw_engine_group.c            |   6 +-
 drivers/gpu/drm/xe/xe_late_bind_fw.c               |  20 +-
 drivers/gpu/drm/xe/xe_pm.c                         |   2 +-
 drivers/gpu/drm/xe/xe_query.c                      |  15 +-
 drivers/gpu/drm/xe/xe_svm.c                        |  11 +-
 drivers/gpu/drm/xe/xe_svm.h                        |  14 ++
 drivers/gpu/drm/xe/xe_userptr.c                    |   1 +
 drivers/gpu/drm/xe/xe_vm.c                         |   1 +
 include/drm/drm_gpusvm.h                           |   7 +-
 include/uapi/linux/kfd_ioctl.h                     |   4 +-
 45 files changed, 391 insertions(+), 253 deletions(-)
