Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3681898FC9F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 06:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE8410E23B;
	Fri,  4 Oct 2024 04:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D2O4QyZT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A695C10E1A8
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 04:06:36 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a8d100e9ce0so199494266b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 21:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728014795; x=1728619595; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PbPjpOY9+HPOwaTgoYjtS9KTBx7gBxYEOkpDrmAkHUE=;
 b=D2O4QyZT+OeF41Ztv02emFLks2OUdxt4T3VTMXY4vfW0c4nkiQ7H4uuq3ULDMckE3m
 sIkBGHj9qPnXMB/KHpezUBur3CinmDZ8RaoV4CVNM9yDfhzcD4s4XLCXu6Ryi5ceHMsi
 XVQlq5eBnv1cAFPThN8IrxbTmk8mG+cnU5q3uzb96t1dwkB0ya3DhaCYBz2Uoy0Q+SuP
 bSPRJteIwSz4MVsBW8tn9aos05Rl6B0ZCHYiHxVs1JTcYpF0lVeq26d/qOVIz2P6mVf7
 Uddm0+x0oaTNgj1qUc8X5HnSkXzefUf7QOUtheqRLd/cd/jf8l6BK2sXPm85T3KNhN+r
 EfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728014795; x=1728619595;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PbPjpOY9+HPOwaTgoYjtS9KTBx7gBxYEOkpDrmAkHUE=;
 b=VO1cWgAaZbBB4VzpvNrz2n70qqqd2ppokHBusCC9gSTShx0aXoWitxJWPf104svH5f
 bKSDbL6bnKHC00VxTuYSo6OXeL8+WsfPHrcP+fXznt8DxRzExbaOeQAjABlSNSBLrC0f
 aXFocm28hUj67zLM9GHgbzf8mdjorG47TWFiVulV2h5Vo6LGBaGV79wmRssczbdXpJyi
 ljvhK4kE5jckUsUERKJyVEEZe7e2SlbS4Ct6RV5m6VbXoHARcB5F5s+os7VU9tRad+YV
 epVK/ugJjPYELIMWyM76PSUpueV3tFUNjbMwyteisiKyd82as8iCy/3ZKl8yNOxKqZuL
 EqzQ==
X-Gm-Message-State: AOJu0Yyf76Hokxg+0JqBjTkH4K5MBUfqV8Cd0U2JZltXCKczr78KPucG
 QyOdpHxpRYkWFPd1e+zPEBLMKx3EtRFBT3OSG3WyoCRNOCEKfxCYUmjCWOWktU1JBzM6YUl3NJr
 m1gzsLCs7Cuigz8A1st68XFBoXr8=
X-Google-Smtp-Source: AGHT+IH+Wb2kbxAbP0MTrk2nJKoPSlResULnwEgcRVo5IxbQwzgu1mRm1bE8KAjX7BJ+yqxd40VfgH9lIZ/o4eEoTx0=
X-Received: by 2002:a17:907:e6c9:b0:a8a:926a:d027 with SMTP id
 a640c23a62f3a-a991bfd8564mr106045666b.45.1728014794696; Thu, 03 Oct 2024
 21:06:34 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 4 Oct 2024 14:06:23 +1000
Message-ID: <CAPM=9twn+on88T+O=_6LmVt2u-Lipxx3q_bp566owK9t+9UuMg@mail.gmail.com>
Subject: [git pull] drm fixes for 6.12-rc2
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

Weekly fixes, xe and amdgpu lead the way, with panthor, and few core
components getting various fixes. Nothing seems too out of the
ordinary.

Regards,
Dave.

drm-fixes-2024-10-04:
drm fixes for 6.12-rc2

atomic:
- Use correct type when reading damage rectangles

display:
- Fix kernel docs

dp-mst:
- Fix DSC decompression detection

hdmi:
- Fix infoframe size

sched:
- Update maintainers
- Fix race condition whne queueing up jobs
- Fix locking in drm_sched_entity_modify_sched()
- Fix pointer deref if entity queue changes

sysfb:
- Disable sysfb if framebuffer parent device is unknown

amdgpu:
- DML2 fix
- DSC fix
- Dispclk fix
- eDP HDR fix
- IPS fix
- TBT fix

i915:
- One fix for bitwise and logical "and" mixup in PM code

xe:
- Restore pci state on resume
- Fix locking on submission, queue and vm
- Fix UAF on queue destruction
- Fix resource release on freq init error path
- Use rw_semaphore to reduce contention on ASID->VM lookup
- Fix steering for media on Xe2_HPM
- Tuning updates to Xe2
- Resume TDR after GT reset to prevent jobs running forever
- Move id allocation to avoid userspace using a guessed number
  to trigger UAF
- Fix OA stream close preventing pbatch buffers to complete
- Fix NPD when migrating memory on LNL
- Fix memory leak when aborting binds

panthor:
- Fix locking
- Set FOP_UNSIGNED_OFFSET in fops instance
- Acquire lock in panthor_vm_prepare_map_op_ctx()
- Avoid uninitialized variable in tick_ctx_cleanup()
- Do not block scheduler queue if work is pending
- Do not add write fences to the shared BOs

vbox:
- Fix VLA handling
The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc=
:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-10-04

for you to fetch changes up to 5b272bf7dcf969eb4f19ef994b6e60458ee6300f:

  Merge tag 'drm-xe-fixes-2024-10-03' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2024-10-04 11:00:39 +1000)

----------------------------------------------------------------
drm fixes for 6.12-rc2

atomic:
- Use correct type when reading damage rectangles

display:
- Fix kernel docs

dp-mst:
- Fix DSC decompression detection

hdmi:
- Fix infoframe size

sched:
- Update maintainers
- Fix race condition whne queueing up jobs
- Fix locking in drm_sched_entity_modify_sched()
- Fix pointer deref if entity queue changes

sysfb:
- Disable sysfb if framebuffer parent device is unknown

amdgpu:
- DML2 fix
- DSC fix
- Dispclk fix
- eDP HDR fix
- IPS fix
- TBT fix

i915:
- One fix for bitwise and logical "and" mixup in PM code

xe:
- Restore pci state on resume
- Fix locking on submission, queue and vm
- Fix UAF on queue destruction
- Fix resource release on freq init error path
- Use rw_semaphore to reduce contention on ASID->VM lookup
- Fix steering for media on Xe2_HPM
- Tuning updates to Xe2
- Resume TDR after GT reset to prevent jobs running forever
- Move id allocation to avoid userspace using a guessed number
  to trigger UAF
- Fix OA stream close preventing pbatch buffers to complete
- Fix NPD when migrating memory on LNL
- Fix memory leak when aborting binds

panthor:
- Fix locking
- Set FOP_UNSIGNED_OFFSET in fops instance
- Acquire lock in panthor_vm_prepare_map_op_ctx()
- Avoid uninitialized variable in tick_ctx_cleanup()
- Do not block scheduler queue if work is pending
- Do not add write fences to the shared BOs

vbox:
- Fix VLA handling

----------------------------------------------------------------
Alex Hung (1):
      drm/amd/display: Add HDR workaround for specific eDP

Boris Brezillon (4):
      drm/panthor: Lock the VM resv before calling
drm_gpuvm_bo_obtain_prealloc()
      drm/panthor: Fix access to uninitialized variable in tick_ctx_cleanup=
()
      drm/panthor: Don't declare a queue blocked if deferred
operations are pending
      drm/panthor: Don't add write fences to the shared BOs

Charlene Liu (1):
      drm/amd/display: avoid set dispclk to 0

Christian K=C3=B6nig (1):
      drm/sched: revert "Always increment correct scheduler score"

Dave Airlie (5):
      Merge tag 'drm-misc-fixes-2024-09-26' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.12-2024-10-02' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2024-10-02' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2024-10-02' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2024-10-03' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Derek Foreman (1):
      drm/connector: hdmi: Fix writing Dynamic Range Mastering infoframes

Dmitry Baryshkov (1):
      drm/display: fix kerneldocs references

Fangzhi Zuo (1):
      drm/amd/display: Restore Optimized pbn Value if Failed to Disable DSC

Gustavo Sousa (3):
      drm/xe/mcr: Use Xe2_LPM steering tables for Xe2_HPM
      drm/xe/xe2: Extend performance tuning to media GT
      drm/xe/xe2: Add performance tuning for L3 cache flushing

Hans de Goede (1):
      drm/vboxvideo: Replace fake VLA at end of
vbva_mouse_pointer_shape with real VLA

He Lugang (1):
      drm/xe: use devm_add_action_or_reset() helper

Imre Deak (1):
      drm/dp_mst: Fix DSC decompression detection in Synaptics branch devic=
es

Jani Nikula (1):
      drm/i915/gem: fix bitwise and logical AND mixup

Jos=C3=A9 Roberto de Souza (1):
      drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream close

Leo Li (1):
      drm/amd/display: Enable idle workqueue for more IPS modes

Liviu Dudau (1):
      drm/panthor: Add FOP_UNSIGNED_OFFSET to fop_flags

Maarten Lankhorst (1):
      Merge remote-tracking branch 'drm/drm-fixes' into drm-misc-fixes

Matthew Auld (4):
      drm/xe/guc_submit: add missing locking in wedged_fini
      drm/xe: fix UAF around queue destruction
      drm/xe/vm: move xa_alloc to prevent UAF
      drm/xe/queue: move xa_alloc to prevent UAF

Matthew Brost (5):
      drm/xe: Convert to USM lock to rwsem
      drm/xe: Use helper for ASID -> VM in GPU faults and access counters
      drm/xe: Resume TDR after GT reset
      drm/xe: Clean up VM / exec queue file lock usage.
      drm/xe: Fix memory leak when aborting binds

Philipp Stanner (1):
      MAINTAINERS: drm/sched: Add new maintainers

Rob Clark (1):
      drm/sched: Fix dynamic job-flow control race

Rodrigo Vivi (1):
      drm/xe: Restore pci state upon resume

Steven Price (1):
      drm/panthor: Fix race when converting group handle to group object

Thomas Zimmermann (2):
      drm: Consistently use struct drm_mode_rect for FB_DAMAGE_CLIPS
      firmware/sysfb: Disable sysfb for firmware buffers with unknown paren=
t

Tom Chung (1):
      drm/amd/display: Fix system hang while resume with TBT monitor

Tvrtko Ursulin (3):
      drm/sched: Add locking to drm_sched_entity_modify_sched
      drm/sched: Always wake up correct scheduler in drm_sched_entity_push_=
job
      drm/sched: Always increment correct scheduler score

Yihan Zhu (1):
      drm/amd/display: update DML2 policy
EnhancedPrefetchScheduleAccelerationFinal DCN35

Zhanjun Dong (1):
      drm/xe: Prevent null pointer access in xe_migrate_copy

 Documentation/gpu/drm-kms-helpers.rst              |  4 +--
 MAINTAINERS                                        |  2 ++
 drivers/firmware/sysfb.c                           |  4 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 20 +++++++++--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  4 +++
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 17 +++++++---
 drivers/gpu/drm/amd/display/dc/dc_types.h          |  1 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c  |  1 -
 .../display/dc/resource/dcn351/dcn351_resource.c   |  1 +
 drivers/gpu/drm/display/drm_dp_mst_topology.c      | 10 ++++--
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  4 +--
 drivers/gpu/drm/drm_atomic_uapi.c                  |  2 +-
 drivers/gpu/drm/drm_debugfs.c                      |  4 +--
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |  2 +-
 drivers/gpu/drm/panthor/panthor_drv.c              |  1 +
 drivers/gpu/drm/panthor/panthor_mmu.c              |  8 +++++
 drivers/gpu/drm/panthor/panthor_sched.c            | 36 ++++++++++++++----=
--
 drivers/gpu/drm/scheduler/sched_entity.c           | 14 ++++++--
 drivers/gpu/drm/scheduler/sched_main.c             |  7 ++--
 drivers/gpu/drm/vboxvideo/hgsmi_base.c             | 10 +++++-
 drivers/gpu/drm/vboxvideo/vboxvideo.h              |  4 +--
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               | 11 ++++++
 drivers/gpu/drm/xe/xe_bo.c                         |  4 +--
 drivers/gpu/drm/xe/xe_device.c                     | 12 +++----
 drivers/gpu/drm/xe/xe_device_types.h               | 19 ++++++++---
 drivers/gpu/drm/xe/xe_drm_client.c                 |  9 ++++-
 drivers/gpu/drm/xe/xe_exec_queue.c                 |  6 ++--
 drivers/gpu/drm/xe/xe_gpu_scheduler.c              |  5 +++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h              |  2 ++
 drivers/gpu/drm/xe/xe_gt_freq.c                    |  4 +--
 drivers/gpu/drm/xe/xe_gt_mcr.c                     |  2 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c               | 39 ++++++++++++------=
----
 drivers/gpu/drm/xe/xe_gt_sysfs.c                   |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 | 37 ++++++++++++++++++=
--
 drivers/gpu/drm/xe/xe_guc_types.h                  |  2 ++
 drivers/gpu/drm/xe/xe_oa.c                         |  9 ++---
 drivers/gpu/drm/xe/xe_pci.c                        |  2 ++
 drivers/gpu/drm/xe/xe_pt.c                         |  2 +-
 drivers/gpu/drm/xe/xe_tuning.c                     | 28 ++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.c                         | 28 +++++++---------
 include/drm/gpu_scheduler.h                        |  2 +-
 include/linux/hdmi.h                               |  9 +++++
 42 files changed, 282 insertions(+), 108 deletions(-)
