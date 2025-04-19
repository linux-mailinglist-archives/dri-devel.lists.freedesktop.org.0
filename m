Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375F5A941B5
	for <lists+dri-devel@lfdr.de>; Sat, 19 Apr 2025 07:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA2A310E240;
	Sat, 19 Apr 2025 05:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OCE7l7Uz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1D710E240
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Apr 2025 05:20:01 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5f4b7211badso3623753a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 22:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745040000; x=1745644800; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q4qy193G/yKAzPZrbZZI+4C7rTMR6HHOb2/qcaQ+evw=;
 b=OCE7l7Uz/qOTzIggxYrPF92y81IIbrI7xQ+xkHD9N0ztuHVZ0o5quZxkJE0Uv56pLZ
 mfqOgUCUDqLTK/3mn02eMg5IrCTnaX3ki0sSewljnDNdog3FzfQNsbvW21tGGSFcykrv
 dAu1pnagM09vX10FBBLxXGArFN+uzvqDfhFzNOAG4epMeyl+GbIi+aiojsVKTtpvPl7l
 bxRt2t9OBkmSSOKXQr/yyB24zZlVepItv/pPr+AfzIg9KaUBD1T2VOIOR1J+avBh/jyj
 rm29yzWqU4dME3n7Dls/xd+jxKU8J0/zQgIjL4XFGDFkBTveMjsRvDGYnQVeVFNJxNY2
 vJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745040000; x=1745644800;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q4qy193G/yKAzPZrbZZI+4C7rTMR6HHOb2/qcaQ+evw=;
 b=Xkul6cKamHvcYWqMURfe4PDNonw0bdhOQLJhEcuTV7AmUMlLiZF9a+fH9zgkkpySlp
 0M4T9R8OQt4HXgEAxvXykTvh8Gx156wTyHRvG2SZwogfdmj+4WznPZ9Qkrk8okEmd6H1
 BgxRK34wOdzawzaYfCoZbgvyhga336SfB8qedjuXCl1WDJltC1mlK9FGHjF7dAfFiSyu
 e/Ax72UXqJI9W8WUU7YYpKeQUbSy4qYkrBL/YFMnqNvvor8GfRUlswVkMHctVrWOXi80
 eFaYOdbtOc7SJ0j+b+JyCDv7xy6s0CLMZ52BtWlK6kt+t/9V2jf4kWsVUjMYlFOKG9Jq
 jXwA==
X-Gm-Message-State: AOJu0YyY5g7dNixj6pbi+Cbxu9AniUQaJj+z1NIKmv7f8gF41LyUPJha
 VmPtbWpeM37se38y9nRCGWu/E7VHSboHBTqMi6bZrHrnwHUh7FH+qEBMPHd6t6m6/RbTE1qzJtF
 czTnsjRy9tPpZhKfGBBYbFG4cHjbw0XVG
X-Gm-Gg: ASbGnctfDc3OwcEsWyuIuT7ZfD669J/YqsHg516bx6AnqUAe56/3hd+XMzZ5ajc7H8Z
 vwbO6f+X35C5pYmmeYZFV8QVcpnn08cMf0xuQS/iXT/5hN9Am/CuzsAn8Dkniiu/b8eSn4C/Brn
 d0PzD5uyNGmqQ//swR2GgqqnV4P/3dZ8w=
X-Google-Smtp-Source: AGHT+IGX+H7blyO9O2IZIcMf/GbMEebHGvi3KDEWr5ty1K8Chcjwt7Xp7VuXDZRGe702QXmsX2Ex+rOJAFL7miwCGgM=
X-Received: by 2002:a17:907:d8e:b0:acb:30a9:8361 with SMTP id
 a640c23a62f3a-acb74db5f78mr411309466b.40.1745039999365; Fri, 18 Apr 2025
 22:19:59 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 19 Apr 2025 15:19:47 +1000
X-Gm-Features: ATxdqUE4L_w9F4cg0enA_0ANZpRSqXBY-u7vHQckr6-wKOW5jOmco9XtqJDmklg
Message-ID: <CAPM=9tz_TQb0KRXAzverESVSPD1Ap5D=oZhab4tvYJ-XrwN0cQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.15-rc3
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

Easter rc3 pull request, fixes in all the usuals, amdgpu, xe, msm,
with some i915/ivpu/mgag200/v3d fixes, then a couple of bits in
dma-buf/gem.

Hopefully has no easter eggs in it,

Regards,
Dave.

drm-fixes-2025-04-19:
drm fixes for 6.15-rc3

dma-buf:
- Correctly decrement refcounter on errors

gem:
- Fix test for imported buffers

amdgpu:
- Cleaner shader sysfs fix
- Suspend fix
- Fix doorbell free ordering
- Video caps fix
- DML2 memory allocation optimization
- HDP fix

i915:
- Fix DP DSC configurations that require 3 DSC engines per pipe

xe:
- Fix LRC address being written too late for GuC
- Fix notifier vs folio deadlock
- Fix race betwen dma_buf unmap and vram eviction
- Fix debugfs handling PXP terminations unconditionally

msm:
- Display:
  - Fix to call dpu_plane_atomic_check_pipe() for both SSPPs in
    case of multi-rect
  - Fix to validate plane_state pointer before using it in
    dpu_plane_virtual_atomic_check()
  - Fix to make sure dereferencing dpu_encoder_phys happens after
    making sure it is valid in _dpu_encoder_trigger_start()
  - Remove the remaining intr_tear_rd_ptr which we initialized
    to -1 because NO_IRQ indices start from 0 now
- GPU:
  - Fix IB_SIZE overflow

ivpu:
- Fix debugging
- Fixes to frequency
- Support firmware API 3.28.3
- Flush jobs upon reset

mgag200:
- Set vblank start to correct values

v3d:
- Fix Indirect Dispatch
The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444=
:

  Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-04-19

for you to fetch changes up to 0467145fab3b3a7a1efd221722310fe32329b3da:

  Merge tag 'drm-msm-fixes-2025-04-18' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes (2025-04-19
15:09:29 +1000)

----------------------------------------------------------------
drm fixes for 6.15-rc3

dma-buf:
- Correctly decrement refcounter on errors

gem:
- Fix test for imported buffers

amdgpu:
- Cleaner shader sysfs fix
- Suspend fix
- Fix doorbell free ordering
- Video caps fix
- DML2 memory allocation optimization
- HDP fix

i915:
- Fix DP DSC configurations that require 3 DSC engines per pipe

xe:
- Fix LRC address being written too late for GuC
- Fix notifier vs folio deadlock
- Fix race betwen dma_buf unmap and vram eviction
- Fix debugfs handling PXP terminations unconditionally

msm:
- Display:
  - Fix to call dpu_plane_atomic_check_pipe() for both SSPPs in
    case of multi-rect
  - Fix to validate plane_state pointer before using it in
    dpu_plane_virtual_atomic_check()
  - Fix to make sure dereferencing dpu_encoder_phys happens after
    making sure it is valid in _dpu_encoder_trigger_start()
  - Remove the remaining intr_tear_rd_ptr which we initialized
    to -1 because NO_IRQ indices start from 0 now
- GPU:
  - Fix IB_SIZE overflow

ivpu:
- Fix debugging
- Fixes to frequency
- Support firmware API 3.28.3
- Flush jobs upon reset

mgag200:
- Set vblank start to correct values

v3d:
- Fix Indirect Dispatch

----------------------------------------------------------------
Alex Deucher (1):
      drm/amd/display/dml2: use vzalloc rather than kzalloc

Andrzej Kacprowski (2):
      accel/ivpu: Fix the NPU's DPU frequency calculation
      accel/ivpu: Show NPU frequency in sysfs

Ankit Nautiyal (2):
      drm/i915/display: Add macro for checking 3 DSC engines
      drm/i915/dp: Check for HAS_DSC_3ENGINES while configuring DSC slices

Chenyuan Yang (1):
      drm/msm/dpu: Fix error pointers in dpu_plane_virtual_atomic_check

Christian K=C3=B6nig (1):
      drm/amdgpu: use a dummy owner for sysfs triggered cleaner shaders v4

Dan Carpenter (1):
      dma-buf/sw_sync: Decrement refcount on error in
sw_sync_ioctl_get_deadline()

Daniele Ceraolo Spurio (1):
      drm/xe/pxp: do not queue unneeded terminations from debugfs

Dave Airlie (5):
      Merge tag 'amd-drm-fixes-6.15-2025-04-16' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2025-04-17' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2025-04-17' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-04-18' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-msm-fixes-2025-04-18' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes

David Rosca (1):
      drm/amdgpu: Add back JPEG to video caps for carrizo and newer

Dmitry Baryshkov (1):
      drm/msm/dpu: drop rogue intr_tear_rd_ptr values

Jun Nie (1):
      drm/msm/dpu: check every pipe per capability

Karol Wachowski (2):
      accel/ivpu: Update FW Boot API to version 3.28.3
      accel/ivpu: Add cmdq_id to job related logs

Lijo Lazar (1):
      drm/amdgpu: Use the right function for hdp flush

Lucas De Marchi (1):
      drm/xe: Set LRC addresses before guc load

Maciej Falkowski (1):
      accel/ivpu: Flush pending jobs of device's workqueues

Mario Limonciello (1):
      drm/amd: Forbid suspending into non-default suspend states

Matthew Auld (2):
      drm/xe/userptr: fix notifier vs folio deadlock
      drm/xe/dma_buf: stop relying on placement in unmap

Ma=C3=ADra Canal (1):
      drm/v3d: Fix Indirect Dispatch configuration for V3D 7.1.6 and later

Qasim Ijaz (1):
      drm/msm/dpu: reorder pointer operations after sanity checks to
avoid NULL deref

Rob Clark (1):
      drm/msm/a6xx+: Don't let IB_SIZE overflow

Thomas Zimmermann (2):
      drm/gem: Internally test import_attach for imported objects
      drm/mgag200: Fix value in <VBLKSTR> register

ZhenGuo Yin (1):
      drm/amdgpu: fix warning of drm_mm_clean

 drivers/accel/ivpu/ivpu_drv.c                      |  10 +-
 drivers/accel/ivpu/ivpu_fw.c                       |  17 ++-
 drivers/accel/ivpu/ivpu_hw.h                       |  16 +--
 drivers/accel/ivpu/ivpu_hw_btrs.c                  | 134 ++++++++++-------=
----
 drivers/accel/ivpu/ivpu_hw_btrs.h                  |   7 +-
 drivers/accel/ivpu/ivpu_job.c                      |  15 +--
 drivers/accel/ivpu/ivpu_sysfs.c                    |  49 +++++++-
 drivers/accel/ivpu/vpu_boot_api.h                  |  13 +-
 drivers/accel/ivpu/vpu_jsm_api.h                   |  53 +++++---
 drivers/dma-buf/sw_sync.c                          |  19 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  14 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  14 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   8 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  12 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v14_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |   7 ++
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |  11 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |   6 +-
 .../gpu/drm/i915/display/intel_display_device.h    |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c            |   7 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c             |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   8 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |   2 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |   1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |   3 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |   4 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |   3 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  74 ++++++------
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |   7 ++
 drivers/gpu/drm/v3d/v3d_sched.c                    |  16 ++-
 drivers/gpu/drm/xe/xe_dma_buf.c                    |   5 +-
 drivers/gpu/drm/xe/xe_guc_ads.c                    |  75 +++++++-----
 drivers/gpu/drm/xe/xe_hmm.c                        |  24 ----
 drivers/gpu/drm/xe/xe_pxp_debugfs.c                |  13 +-
 include/drm/drm_gem.h                              |   3 +-
 include/uapi/drm/ivpu_accel.h                      |   4 +-
 47 files changed, 407 insertions(+), 285 deletions(-)
