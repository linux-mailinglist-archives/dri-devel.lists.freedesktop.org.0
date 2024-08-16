Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B96954060
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 06:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CCD10E17A;
	Fri, 16 Aug 2024 04:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bG4fl5XG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADA710E17A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 04:09:41 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a83562f9be9so164111366b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 21:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723781380; x=1724386180; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J9FB5ZtYyx1upxRdGOB5sK2UwyMxegssFSy87xK3ELM=;
 b=bG4fl5XGYBNdOAL+muteUWIvebcn3dEkPvI1EyDI4P8/JTZJC1+584KxYGKEP1xLSJ
 Mt5wp491uE2I2u6c/H29U13V/dCSvUFIcXwtM+EnESor2iXL2c0Ro/EDTjgGTIlqd08N
 3UUa9FWLvx1kWS8/M2vYsP6QUj4MhVCOFqRjNlwEaUxcgviQyp4JNdR3GSdTW5wFRlNk
 +lpVCDHb4IYa29UG7NiURhiWEHk1IYDzckBdBKLw5yK1r1Usaxv3axZqUZRDcGz+pb3b
 +01FfQqKStkBTksI9LKXKHqkSGCi4dTBAkOGBFUy2DqIEMBOAuNnRH6KHPGOJ5mI4q+6
 8qPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723781380; x=1724386180;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J9FB5ZtYyx1upxRdGOB5sK2UwyMxegssFSy87xK3ELM=;
 b=OuFjRUGAMA1CzM6dtDSGKois4kwbRQzgoveX6cYUsMEWV+xcHjQENSu4luP5oZfZR4
 iL3DnGpYgKVzTSlmGdZkavOSqAanV4qD54sZHJn1PdABqOlIDHIXHd0wjAE1fkv/dghL
 CV7CkzuAOHfeHWex7YR5M8VwWfh4i9iBIICFoWn21QKp6ymQNXP4JNikTL9FsbJgyTEX
 Yo44imMIGjFeD2PZn+G3blzrqqucOCI5bVKGikjxBWlSbb0tyQ39cYNNTYzoGmEzxw5B
 +u0jOgC4mH5dlI6xtjZLrvLLIwcdBMuYv1xsYI0qmtZUWOmcFR8LJNpNlbeXSOO81NDN
 KUgQ==
X-Gm-Message-State: AOJu0YzI27LmIei5p1Vuij502YZ/JC5ii5QcwO0O/6DWxCdtwYk0CTpO
 iwbJCpPXqmKD77nrSZfOgX+QCX9CFuzFvnw9uzsfZx0WEXLUUrCohKmtqDFeQegYtK+fdU+DDxW
 5YCzpXQWuXennGmekOLbOtO0rgbQ=
X-Google-Smtp-Source: AGHT+IEmy+T4Ij7z6geiw2IBenuEOQ/aHEiJ6n1kf3YGpoNd78pVlQpuHTqmaAJOo9UAZ5yp8xu+p8EazorYl02G9lE=
X-Received: by 2002:a17:906:d7d0:b0:a7a:ab1a:2d67 with SMTP id
 a640c23a62f3a-a83928aa0e9mr114603566b.1.1723781379680; Thu, 15 Aug 2024
 21:09:39 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 16 Aug 2024 14:09:28 +1000
Message-ID: <CAPM=9tx8NORNyjwOMapLrZwGEVxgVxYDmChmkLOwz1vyYUgoGw@mail.gmail.com>
Subject: [git pull] drm fixes for 6.11-rc4
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

Weekly drm fixes, mostly amdgpu and xe. The larger amdgpu fix is for a
new IP block introduced in rc1, so should be fine. The xe fixes
contain some missed fixes from the end of the previous round along
with some fixes which required precursor changes, but otherwise
everything seems fine,

Dave.

drm-fixes-2024-08-16:
drm fixes for 6.11-rc4

mediatek:
- fix cursor crash

amdgpu:
- Fix MES ring buffer overflow
- DCN 3.5 fix
- DCN 3.2.1 fix
- DP MST fix
- Cursor fixes
- JPEG fixes
- Context ops validation
- MES 12 fixes
- VCN 5.0 fix
- HDP fix

panel:
- dt bindings style fix
- orientation quirks

rockchip:
- inno-hdmi: fix infoframe upload

v3d:
- fix OOB access in v3d_csd_job_run()

xe:
- Validate user fence during creation
- Fix use after free when client stats are captured
- SRIOV fixes
- Runtime PM fixes
The following changes since commit 7c626ce4bae1ac14f60076d00eafe71af30450ba=
:

  Linux 6.11-rc3 (2024-08-11 14:27:14 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-08-16

for you to fetch changes up to fee9d135e2fd5963a7f466cd1ef2060731a1ab29:

  Merge tag 'mediatek-drm-fixes-20240805' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-fixes (2024-08-16 13:16:47 +1000)

----------------------------------------------------------------
drm fixes for 6.11-rc4

mediatek:
- fix cursor crash

amdgpu:
- Fix MES ring buffer overflow
- DCN 3.5 fix
- DCN 3.2.1 fix
- DP MST fix
- Cursor fixes
- JPEG fixes
- Context ops validation
- MES 12 fixes
- VCN 5.0 fix
- HDP fix

panel:
- dt bindings style fix
- orientation quirks

rockchip:
- inno-hdmi: fix infoframe upload

v3d:
- fix OOB access in v3d_csd_job_run()

xe:
- Validate user fence during creation
- Fix use after free when client stats are captured
- SRIOV fixes
- Runtime PM fixes

----------------------------------------------------------------
Alex Bee (1):
      drm/rockchip: inno-hdmi: Fix infoframe upload

Alex Deucher (2):
      drm/amdgpu/jpeg2: properly set atomics vmid field
      drm/amdgpu/jpeg4: properly set atomics vmid field

AngeloGioacchino Del Regno (1):
      drm/mediatek: Set sensible cursor width/height values to fix crash

Bas Nieuwenhuizen (1):
      drm/amdgpu: Actually check flags for all context ops.

Bouke Sybren Haarsma (2):
      drm: panel-orientation-quirks: Add quirk for Ayn Loki Zero
      drm: panel-orientation-quirks: Add quirk for Ayn Loki Max

Dave Airlie (4):
      Merge tag 'amd-drm-fixes-6.11-2024-08-14' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2024-08-15' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2024-08-15' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'mediatek-drm-fixes-20240805' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-fixes

David (Ming Qiang) Wu (1):
      drm/amd/amdgpu: command submission parser for JPEG

Douglas Anderson (1):
      dt-bindings: display: panel: samsung,atna45dc02: Fix indentation

Fangzhi Zuo (1):
      drm/amd/display: Fix MST BW calculation Regression

Hamza Mahfooz (1):
      drm/amd/display: fix s2idle entry for DCN3.5+

Jack Xiao (9):
      drm/amdgpu/mes: fix mes ring buffer overflow
      drm/amdgpu/mes12: update mes_v12_api_def.h
      drm/amdgpu/mes: add multiple mes ring instances support
      drm/amdgpu/mes12: load unified mes fw on pipe0 and pipe1
      drm/amdgpu/mes12: add mes pipe switch support
      drm/amdgpu/mes12: adjust mes12 sw/hw init for multiple pipes
      drm/amdgpu/mes12: configure two pipes hardware resources
      drm/amdgpu/mes12: sw/hw fini for unified mes
      drm/amdgpu/mes12: fix suspend issue

Kenneth Feng (1):
      drm/amd/amdgpu: add HDP_SD support on gc 12.0.0/1

Loan Chen (1):
      drm/amd/display: Enable otg synchronization logic for DCN321

Matthew Brost (5):
      drm/xe: Validate user fence during creation
      drm/xe: Build PM into GuC CT layer
      drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
      drm/xe: Drop xe_gt_tlb_invalidation_wait
      drm/xe: Hold a PM ref when GT TLB invalidations are inflight

Ma=C3=ADra Canal (1):
      drm/v3d: Fix out-of-bounds read in `v3d_csd_job_run()`

Melissa Wen (1):
      drm/amd/display: fix cursor offset on rotation 180

Michal Wajdeczko (2):
      drm/xe/vf: Fix register value lookup
      drm/xe/pf: Fix VF config validation on multi-GT platforms

Rodrigo Siqueira (1):
      drm/amd/display: Adjust cursor position

Umesh Nerlige Ramappa (4):
      drm/xe: Move part of xe_file cleanup to a helper
      drm/xe: Add ref counting for xe_file
      drm/xe: Take a ref to xe file when user creates a VM
      drm/xe: Fix use after free when client stats are captured

Yinjie Yao (1):
      drm/amdgpu: Update kmd_fw_shared for VCN5

 .../bindings/display/panel/samsung,atna33xc20.yaml |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  83 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  27 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |  63 ++++-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.h           |   7 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |   1 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  59 ++--
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             | 296 +++++++++++------=
----
 drivers/gpu/drm/amd/amdgpu/soc15d.h                |   6 +
 drivers/gpu/drm/amd/amdgpu/soc24.c                 |   2 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   3 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  33 ++-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |   3 +
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |   4 +-
 .../display/dc/resource/dcn321/dcn321_resource.c   |   3 +
 drivers/gpu/drm/amd/include/mes_v12_api_def.h      |   7 +-
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |  12 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   4 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |   4 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |  14 +-
 drivers/gpu/drm/xe/xe_device.c                     |  59 +++-
 drivers/gpu/drm/xe/xe_device.h                     |   3 +
 drivers/gpu/drm/xe/xe_device_types.h               |   3 +
 drivers/gpu/drm/xe/xe_drm_client.c                 |   5 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                 |  10 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h           |   7 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |  11 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c                |   2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        | 201 +++++++-------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h        |  12 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h  |   4 +
 drivers/gpu/drm/xe/xe_guc_ct.c                     |  10 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |   4 +
 drivers/gpu/drm/xe/xe_pt.c                         |  26 +-
 drivers/gpu/drm/xe/xe_sync.c                       |  12 +-
 drivers/gpu/drm/xe/xe_vm.c                         |  38 +--
 47 files changed, 699 insertions(+), 426 deletions(-)
