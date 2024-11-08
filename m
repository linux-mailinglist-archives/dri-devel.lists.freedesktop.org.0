Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 514F79C2591
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 20:31:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA23510EA32;
	Fri,  8 Nov 2024 19:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AVouwwkh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D4C10E2A0
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 19:31:39 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a93c1cc74fdso389196766b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 11:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731094298; x=1731699098; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cgGxNNnaEQsNWjle8SbOikD38cOYArxLq1ZUW8VjYx8=;
 b=AVouwwkhgQ4kenLt6XjHbG+fjEEV4F9OA+xAomHnL8AYZwG3d3l8DrYl6W1BiE6f1O
 C7MMwih+7IrDGvT/ZZoU6bc+fxPwDriA+SXLcGWKBOLT6GzaB+wcQJa4txrilBJ3VHzH
 2cbqhgqVzNL1nxVbd+lfxKcuGiwjWo5jlamA9Xb67fzQ3nCv/bIwgFo9gjA5C6Kecg3Z
 QbbSpZMaCnrmdopBw2pz72RdPsb3WoUqZez0RGU75ADOUKR+l1zkdahWmzS00+Iiw47d
 KBfX3n5oVGwd/buLoPHE/3BWdGEr0QsaIwMrRJVfYwhcXEnP+6BajNlH0eP1QAKmnDzj
 K5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731094298; x=1731699098;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cgGxNNnaEQsNWjle8SbOikD38cOYArxLq1ZUW8VjYx8=;
 b=mb+zhbBt8gjUF5AmNUw17Z8vbM8bYmy2T36NlAyARwq3obYtsE0gkiXxu+acbs0SWv
 KRkRBl8A3aJJdU0sSnh6OobZ/JujEDL1sNpKgYIW4VG1mlDynfPLpGpaMx64erELX4hT
 egpkojBGzwOg+3bVBQq9tkaT4cMFvxBVz2Ryka9ohhwRAj3esO7sMbNONvCjv+8E2CFn
 9dfkeoxFOs7cIZkmXa6HxgJC8sI3RkvH9XQV1QtDGkr70RihN0kdhkEBgquQMooHGkd6
 h5+Omujo2yRtcnsULvFXn7gaVPtrbbqoVwgsP7NS+PrswGSH4OJ5tymojTjul4LtBez0
 JcSA==
X-Gm-Message-State: AOJu0YxjIWVfA9oWksEyxGqKYfUtC5wctQ4KXzRJJ8NPFER/z1gI+g5d
 Zqi3pemwmT2J5fF0SxqrJC8S7h81//SF4nWNXlI4jtSD/vRTKutLe70x4zz35f8KIanN87hgXEY
 FF+YEYZiT6crrYQZJolPDeOHQBnY=
X-Google-Smtp-Source: AGHT+IHMDNHQMD4o8K4OqTTXnDjnVKeeIoUJdHC3XUjL4+6NCwn0AU8TEqbzl8MvoDBT83Swo+K0fNZ4bKWoidRppxo=
X-Received: by 2002:a17:907:804:b0:a9a:4e7d:b0a1 with SMTP id
 a640c23a62f3a-a9ef001322fmr402101766b.49.1731094297785; Fri, 08 Nov 2024
 11:31:37 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 9 Nov 2024 05:31:26 +1000
Message-ID: <CAPM=9typGnBRiPLJwjeYnWSWAXtuvi_4gi55zBXzLGD7+Kus0w@mail.gmail.com>
Subject: [git pull] drm fixes for 6.12-rc7
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

Weekly fixes, usual leaders in amdgpu and xe, then a panel quirk, and
some fixes to imagination and panthor drivers. Seems around the usual
level for this time and don't know of any big problems.

Regards,
Dave.

drm-fixes-2024-11-09:
drm fixes for 6.12-rc7

amdgpu:
- Brightness fix
- DC vbios parsing fix
- ACPI fix
- SMU 14.x fix
- Power workload profile fix
- GC partitioning fix
- Debugfs fixes

imagination:
- Track PVR context per file
- Break ref-counting cycle

panel-orientation-quirks:
- Fix matching Lenovo Yoga Tab 3 X90F

panthor:
- Lock VM array
- Be strict about I/O mapping flags

xe:
- Fix ccs_mode setting for Xe2 and later
- Synchronize ccs_mode setting with client creation
- Apply scheduling WA for LNL in additional places as needed
- Fix leak and lock handling in error paths of xe_exec ioctl
- Fix GGTT allocation leak leading to eventual crash in SR-IOV
- Move run_ticks update out of job handling to avoid synchronization
  with reader
The following changes since commit 59b723cd2adbac2a34fc8e12c74ae26ae45bf230:

  Linux 6.12-rc6 (2024-11-03 14:05:52 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-11-09

for you to fetch changes up to 1a6bbc4d9e55d6c9df2dfe7d4f2705a544d8ca13:

  Merge tag 'drm-xe-fixes-2024-11-08' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2024-11-09 05:14:29 +1000)

----------------------------------------------------------------
drm fixes for 6.12-rc7

amdgpu:
- Brightness fix
- DC vbios parsing fix
- ACPI fix
- SMU 14.x fix
- Power workload profile fix
- GC partitioning fix
- Debugfs fixes

imagination:
- Track PVR context per file
- Break ref-counting cycle

panel-orientation-quirks:
- Fix matching Lenovo Yoga Tab 3 X90F

panthor:
- Lock VM array
- Be strict about I/O mapping flags

xe:
- Fix ccs_mode setting for Xe2 and later
- Synchronize ccs_mode setting with client creation
- Apply scheduling WA for LNL in additional places as needed
- Fix leak and lock handling in error paths of xe_exec ioctl
- Fix GGTT allocation leak leading to eventual crash in SR-IOV
- Move run_ticks update out of job handling to avoid synchronization
  with reader

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu: Adjust debugfs register access permissions
      drm/amdgpu: Adjust debugfs eviction and IB access permissions
      drm/amdgpu: add missing size check in amdgpu_debugfs_gprwave_read()

Antonio Quartulli (1):
      drm/amdgpu: prevent NULL pointer dereference if ATIF is not supported

Aurabindo Pillai (1):
      drm/amd/display: parse umc_info or vram_info based on ASIC

Balasubramani Vivekanandan (2):
      drm/xe: Set mask bits for CCS_MODE register
      drm/xe: Use the filelist from drm for ccs_mode change

Brendan King (2):
      drm/imagination: Add a per-file PVR context list
      drm/imagination: Break an object reference loop

Dave Airlie (3):
      Merge tag 'amd-drm-fixes-6.12-2024-11-07' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2024-11-08' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2024-11-08' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Hans de Goede (1):
      drm: panel-orientation-quirks: Make Lenovo Yoga Tab 3 X90F DMI
match less strict

Jann Horn (1):
      drm/panthor: Be stricter about IO mapping flags

Kenneth Feng (2):
      drm/amd/pm: always pick the pptable from IFWI
      drm/amd/pm: correct the workload setting

Lijo Lazar (1):
      drm/amdgpu: Fix DPX valid mode check on GC 9.4.3

Liviu Dudau (1):
      drm/panthor: Lock XArray when getting entries for the VM

Lucas De Marchi (1):
      drm/xe: Stop accumulating LRC timestamp on job_free

Matthew Brost (2):
      drm/xe: Fix possible exec queue leak in exec IOCTL
      drm/xe: Drop VM dma-resv lock on xe_sync_in_fence_get failure in
exec IOCTL

Michal Wajdeczko (1):
      drm/xe/pf: Fix potential GGTT allocation leak

Nirmoy Das (3):
      drm/xe: Move LNL scheduling WA to xe_device.h
      drm/xe/ufence: Flush xe ordered_wq in case of ufence timeout
      drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout

Thomas Zimmermann (1):
      Merge drm/drm-fixes into drm-misc-fixes

Tom Chung (1):
      drm/amd/display: Fix brightness level not retained over reboot

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        | 10 +--
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 15 +++++
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |  4 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 49 ++++++++++----
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |  4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  5 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |  4 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 20 ++++--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  5 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   | 74 ++--------------------
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  8 +++
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |  2 +
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |  1 -
 drivers/gpu/drm/imagination/pvr_context.c          | 33 ++++++++++
 drivers/gpu/drm/imagination/pvr_context.h          | 21 ++++++
 drivers/gpu/drm/imagination/pvr_device.h           | 10 +++
 drivers/gpu/drm/imagination/pvr_drv.c              |  3 +
 drivers/gpu/drm/imagination/pvr_vm.c               | 22 +++++--
 drivers/gpu/drm/imagination/pvr_vm.h               |  1 +
 drivers/gpu/drm/panthor/panthor_device.c           |  4 ++
 drivers/gpu/drm/panthor/panthor_mmu.c              |  2 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |  2 +-
 drivers/gpu/drm/xe/xe_device.c                     | 10 ---
 drivers/gpu/drm/xe/xe_device.h                     | 14 ++++
 drivers/gpu/drm/xe/xe_device_types.h               |  9 ---
 drivers/gpu/drm/xe/xe_exec.c                       | 13 ++--
 drivers/gpu/drm/xe/xe_exec_queue.c                 |  6 ++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c                | 15 +++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |  4 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |  2 +
 drivers/gpu/drm/xe/xe_guc_ct.c                     | 11 +---
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  2 -
 drivers/gpu/drm/xe/xe_wait_user_fence.c            |  7 ++
 38 files changed, 257 insertions(+), 155 deletions(-)
