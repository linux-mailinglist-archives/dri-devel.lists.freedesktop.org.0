Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3829BBE6963
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 08:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8709110EB13;
	Fri, 17 Oct 2025 06:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DapsCn30";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F2510EB13
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 06:14:55 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-87bb66dd224so21089346d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 23:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760681694; x=1761286494; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A3XeTmm9S0/KH1ozCT5gCMzWfpKyleaB4bZi5LBr8ZU=;
 b=DapsCn30WWDbYAd6do9J1ZKCsW9IclaL/xFH0JApF4oPcVERNqfuYYprn0iJuHpuV1
 j3284fxlZm+o/xWDrZ8Vq1E7w5503j7h2lse62YKuz5ZNgtB5S1MXXJ/qYUDj++bxrQJ
 oSkBXYzObK/cGctVUvUbrALSx44NnymK0ejaVnHgpgwJUXIus4lTGmD7GNIh7mcm0Obe
 arTSXpmEf5et5/BqvMbJViI9sKMu/5wa3NcwcJpKqndEVnhsC/I8FnL4oDHaAzqMZxnG
 xsHXJsJXmq09VH1OI8LxAgAQpyUHRtiru5E0A1PM8zaHpzNr5RiGHKjDoWWWwOIEOrcw
 vNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760681694; x=1761286494;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A3XeTmm9S0/KH1ozCT5gCMzWfpKyleaB4bZi5LBr8ZU=;
 b=jaxYcip9K+yzHkMzs0YJgpUyLMwrzlkiShqlm4eeOTJ3YveWhxnVkx737OfxaN64Hd
 VpBiBYQjgxwHAXv7aFwZwqzblVBDlgIjQquMNQlJMFcO6JO6z2q1/Spfs5ELUqCeLvIw
 XKCA/lAn4R+QrVyPS2+rAAV3vCzbBro+pAnGyzuqoAPLZ82NW97Bu9C3KFAUe1zCtAGf
 nFjUYA0kXs2MBeGveFEKGEWJyBjGr2YKHpUAbL0sRITXxo7bnSQg6T9VG2RgKYsRCdkl
 +4Lq8Efy68Kbbi/eye5Rt+Kkao8Dn96rSNQTSvNXnaIwmuy3uzIwjo2ajlvzD7DFqZn7
 YZnQ==
X-Gm-Message-State: AOJu0YwbYrKMX92oB6/GTCFnyfQAXqhZjYw+xr+k+AJ7L3pAaqtoGs0Q
 Wy67ldEq8haANsWMaPQkttH9srG+NZwRn46tE29P/g/8YB6XfdFWvtKJpyr1lNwSy9eAlNMkiVO
 +z5AL7Cd5vkobgFsR9RD8fnVYhtnxOxY=
X-Gm-Gg: ASbGncvB3ioGZo/dSkWBY/XC8q6aAX1f2v2T6WN3MVvC6wzedwZ1rWn1RVER58dtWrc
 rPOS6xPXMMc9DPmuva1rJWFXB7PwRl3IxOZFdHo98dsEBLeMX4meJuvdayZ/Vyxb8E3vrXuVi/Y
 YTtFDy7MkwsXKRrH93+L2tu7jzO9sQtVAkvK6r6MdLw4QFcBcqvUIzgoi9At0wyI24LtJFFqZ82
 eTXsA0jpxCnF+rR04o6AF9TtSfrJCjLuILdrbcA7gnvX5eqyWYLTbcTEU0=
X-Google-Smtp-Source: AGHT+IEQsufXcIx8Krs6nP/lweJKZeyCsP6WTIz8ZCU++sdGoxXhbDi9ma9j6dV978PF9tqViOzUusF/jmxozJN37yw=
X-Received: by 2002:a05:6214:e6e:b0:87c:277f:8d38 with SMTP id
 6a1803df08f44-87c277f8e56mr6327566d6.50.1760681694520; Thu, 16 Oct 2025
 23:14:54 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 17 Oct 2025 16:14:43 +1000
X-Gm-Features: AS18NWDKSxGl43IaXOFEF1uKosllUK22aaCX2nC5QmqShyKH7WAlzAyiwm_9teQ
Message-ID: <CAPM=9ty=C+PAgZD44Y_LkUuKkRtLFGffjX9rZX8=fkP0s-8zSg@mail.gmail.com>
Subject: [git pull] drm fixes for 6.18-rc2
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

Hey Linus,

Weekly pull request, fixes for rc2. As per usual xe/amdgpu are the
leaders, with some i915 and then a bunch of scattered fixes. There are
a bunch of stability fixes for some older amdgpu cards, but older than
yours.

Otherwise, I'm travelling from the middle of next week for the next
two weekends at least, so Sima has offered to take over fixes for the
next couple of weeks, I'll be around email at some point if anything
comes up, but otherwise not much use.

Dave.

drm-fixes-2025-10-17:
drm fixes for 6.18-rc2

draw:
- Avoid color truncation

gpuvm:
- Avoid kernel-doc warning

sched:
- Avoid double free

i915:
- Skip GuC communication warning if reset is in progress
- Couple frontbuffer related fixes
- Deactivate PSR only on LNL and when selective fetch enabled

xe:
- Increase global invalidation timeout to handle some workloads
- Fix NPD while evicting BOs in an array of VM binds
- Fix resizable BAR to account for possibly needing to move BARs other
  than the LMEMBAR
- Fix error handling in xe_migrate_init()
- Fix atomic fault handling with mixed mappings or if the page is
  already in VRAM
- Enable media samplers power gating for platforms before Xe2
- Fix de-registering exec queue from GuC when unbinding
- Ensure data migration to system if indicated by madvise with SVM
- Fix kerneldoc for kunit change
- Always account for cacheline alignment on migration
- Drop bogus assertion on eviction

amdgpu:
- Backlight fix
- SI fixes
- CIK fix
- Make CE support debug only
- IP discovery fix
- Ring reset fixes
- GPUVM fault memory barrier fix
- Drop unused structures in amdgpu_drm.h
- JPEG debugfs fix
- VRAM handling fixes for GPUs without VRAM
- GC 12 MES fixes

amdkfd:
- MES fix

ast:
- Fix display output after reboot

bridge:
- lt9211: Fix version check

panthor:
- Fix MCU suspend

qaic:
- Init bootlog in correct order
- Treat remaining =3D=3D 0 as error in find_and_map_user_pages()
- Lock access to DBC request queue

rockchip:
- vop2: Fix destination size in atomic check
The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787=
:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-10-17

for you to fetch changes up to 62cab426d0e340cd38893227c279705cc9e8416a:

  Merge tag 'drm-xe-fixes-2025-10-16' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-10-17 09:39:53 +1000)

----------------------------------------------------------------
drm fixes for 6.18-rc2

draw:
- Avoid color truncation

gpuvm:
- Avoid kernel-doc warning

sched:
- Avoid double free

i915:
- Skip GuC communication warning if reset is in progress
- Couple frontbuffer related fixes
- Deactivate PSR only on LNL and when selective fetch enabled

xe:
- Increase global invalidation timeout to handle some workloads
- Fix NPD while evicting BOs in an array of VM binds
- Fix resizable BAR to account for possibly needing to move BARs other
  than the LMEMBAR
- Fix error handling in xe_migrate_init()
- Fix atomic fault handling with mixed mappings or if the page is
  already in VRAM
- Enable media samplers power gating for platforms before Xe2
- Fix de-registering exec queue from GuC when unbinding
- Ensure data migration to system if indicated by madvise with SVM
- Fix kerneldoc for kunit change
- Always account for cacheline alignment on migration
- Drop bogus assertion on eviction

amdgpu:
- Backlight fix
- SI fixes
- CIK fix
- Make CE support debug only
- IP discovery fix
- Ring reset fixes
- GPUVM fault memory barrier fix
- Drop unused structures in amdgpu_drm.h
- JPEG debugfs fix
- VRAM handling fixes for GPUs without VRAM
- GC 12 MES fixes

amdkfd:
- MES fix

ast:
- Fix display output after reboot

bridge:
- lt9211: Fix version check

panthor:
- Fix MCU suspend

qaic:
- Init bootlog in correct order
- Treat remaining =3D=3D 0 as error in find_and_map_user_pages()
- Lock access to DBC request queue

rockchip:
- vop2: Fix destination size in atomic check

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: fix handling of harvesting for ip_discovery firmware
      drm/amdgpu: handle wrap around in reemit handling
      drm/amdgpu: set an error on all fences from a bad context
      drm/amdgpu: drop unused structures in amdgpu_drm.h

Alok Tiwari (1):
      drm/rockchip: vop2: use correct destination rectangle height check

Ankan Biswas (1):
      drm/gpuvm: Fix kernel-doc warning for drm_gpuvm_map_req.map

Christian K=C3=B6nig (3):
      drm/amdgpu: remove two invalid BUG_ON()s
      drm/amdgpu: block CE CS if not explicitely allowed by module option
      drm/amdgpu: hide VRAM sysfs attributes on GPUs without VRAM

Dave Airlie (4):
      Merge tag 'drm-intel-fixes-2025-10-16' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.18-2025-10-16' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2025-10-16' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-10-16' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Francesco Valla (1):
      drm/draw: fix color truncation in drm_draw_fill24

Gui-Dong Han (1):
      drm/amdgpu: use atomic functions with memory barriers for vm fault in=
fo

Jeff Hugo (1):
      accel/qaic: Fix bootlog initialization ordering

Jesse.Zhang (1):
      drm/amdgpu: Fix NULL pointer dereference in VRAM logic for APU device=
s

Jonathan Kim (5):
      drm/amdgpu: fix gfx12 mes packet status return check
      drm/amdgpu: fix initialization of doorbell array for detect and hang
      drm/amdgpu: fix hung reset queue array memory allocation
      drm/amdgpu: enable suspend/resume all for gfx 12
      drm/amdkfd: fix suspend/resume all calls in mes based eviction path

Jouni H=C3=B6gander (1):
      drm/i915/psr: Deactivate PSR only on LNL and when selective fetch ena=
bled

Kenneth Graunke (1):
      drm/xe: Increase global invalidation timeout to 1000us

Ketil Johnsen (1):
      drm/panthor: Ensure MCU is disabled on suspend

Lucas De Marchi (1):
      drm/xe: Move rebar to be done earlier

Marek Vasut (1):
      drm/bridge: lt9211: Drop check for last nibble of version register

Matt Roper (1):
      drm/xe/kunit: Fix kerneldoc for parameterized tests

Matthew Auld (2):
      drm/xe/migrate: don't misalign current bytes
      drm/xe/evict: drop bogus assert

Matthew Brost (2):
      drm/xe: Don't allow evicting of BOs in same VM in array of VM binds
      drm/xe: Handle mixed mappings and existing VRAM on atomic faults

Matthew Schwartz (1):
      Revert "drm/amd/display: Only restore backlight after
amdgpu_dm_init or dm_resume"

Pranjal Ramajor Asha Kanojiya (1):
      accel/qaic: Synchronize access to DBC request queue head & tail point=
er

Sathishkumar S (1):
      drm/amdgpu: fix bit shift logic

Shuicheng Lin (1):
      drm/xe/guc: Check GuC running state before deregistering exec queue

Thomas Hellstr=C3=B6m (2):
      drm/xe/migrate: Fix an error path
      drm/xe/svm: Ensure data will be migrated to system if indicated
by madvise.

Thomas Zimmermann (2):
      Merge drm/drm-fixes into drm-misc-fixes
      drm/ast: Blank with VGACR17 sync enable, always clear VGACRB6 sync of=
f

Timur Krist=C3=B3f (3):
      drm/amd/pm: Disable MCLK switching on SI at high pixel clocks
      drm/amd: Disable ASPM on SI
      drm/amd/powerplay: Fix CIK shutdown temperature

Tvrtko Ursulin (1):
      drm/sched: Fix potential double free in
drm_sched_job_add_resv_dependencies

Ville Syrj=C3=A4l=C3=A4 (2):
      drm/i915/frontbuffer: Move bo refcounting
intel_frontbuffer_{get,release}()
      drm/i915/fb: Fix the set_tiling vs. addfb race, again

Vinay Belgaumkar (1):
      drm/xe: Enable media sampler power gating

Youssef Samir (1):
      accel/qaic: Treat remaining =3D=3D 0 as error in find_and_map_user_pa=
ges()

Zhanjun Dong (1):
      drm/i915/guc: Skip communication warning on reset in progress

 drivers/accel/qaic/qaic.h                          |  2 +
 drivers/accel/qaic/qaic_control.c                  |  2 +-
 drivers/accel/qaic/qaic_data.c                     | 12 +++-
 drivers/accel/qaic/qaic_debugfs.c                  |  5 +-
 drivers/accel/qaic/qaic_drv.c                      |  3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  8 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  7 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      | 18 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  8 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          | 54 +++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  7 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            | 20 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  3 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  2 -
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  2 -
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |  7 +--
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |  7 +--
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c         |  6 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  8 ++-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             | 15 +++--
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  | 73 +++++++-----------=
----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 12 ++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  7 ---
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |  5 ++
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |  3 +-
 drivers/gpu/drm/ast/ast_mode.c                     | 18 +++---
 drivers/gpu/drm/ast/ast_reg.h                      |  1 +
 drivers/gpu/drm/bridge/lontium-lt9211.c            |  3 +-
 drivers/gpu/drm/drm_draw.c                         |  2 +-
 drivers/gpu/drm/drm_draw_internal.h                |  2 +-
 drivers/gpu/drm/i915/display/intel_fb.c            | 38 +++++------
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   | 10 ++-
 drivers/gpu/drm/i915/display/intel_psr.c           | 12 +++-
 .../gpu/drm/i915/gem/i915_gem_object_frontbuffer.h |  2 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |  9 ++-
 drivers/gpu/drm/panthor/panthor_fw.c               |  1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c             | 13 ++--
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |  1 +
 drivers/gpu/drm/xe/tests/xe_pci.c                  |  5 ++
 drivers/gpu/drm/xe/xe_bo_evict.c                   |  8 ---
 drivers/gpu/drm/xe/xe_device.c                     |  2 +-
 drivers/gpu/drm/xe/xe_gt_idle.c                    |  8 +++
 drivers/gpu/drm/xe/xe_guc_submit.c                 | 13 +++-
 drivers/gpu/drm/xe/xe_migrate.c                    |  6 +-
 drivers/gpu/drm/xe/xe_pci.c                        |  2 +
 drivers/gpu/drm/xe/xe_svm.c                        | 17 ++++-
 drivers/gpu/drm/xe/xe_vm.c                         | 32 +++++++---
 drivers/gpu/drm/xe/xe_vm_types.h                   |  1 +
 drivers/gpu/drm/xe/xe_vram.c                       | 34 +++++++---
 drivers/gpu/drm/xe/xe_vram.h                       |  1 +
 include/drm/drm_gpuvm.h                            |  2 +-
 include/uapi/drm/amdgpu_drm.h                      | 21 -------
 60 files changed, 355 insertions(+), 224 deletions(-)
