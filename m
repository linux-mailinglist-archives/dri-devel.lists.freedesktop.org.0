Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61168999DB0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 09:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530F410EA63;
	Fri, 11 Oct 2024 07:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UFfdnLWi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BADE10EA63
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 07:17:59 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-539e1543ab8so242321e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 00:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728631077; x=1729235877; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6cy7cZf4Fx/waVp+aNE/ZvtmmKzyMs0V2HvQk1U00Uk=;
 b=UFfdnLWiTrivthl49QekmXS9yXQRf4jwRLxmmiC5SzERcKFyrMicW8IZ71yUmg0XP3
 UUjxfTTn1E/tm819OgHO2cLbKaukLq1mnMBxdyjtshnD40gfjrUQF2mTe5yxzqp8eUZG
 RWsn/UUO4K9nYCSoyvqB2SFBR8+6QL40BnWVUvYmnIS+uFEhA6NKF6WJvy9S9CS5YOtx
 /FDVsE2aZyVtcuHOHgZZsOtKG/3MzO4vFqNEBMcYHfox1s8R0beV171JBkpudi9NdWyt
 zq32VlkuQSQmMfwnjAYTAN5ofVRPpZV7n0a0po2tp4mX652WNchUbFEoruO9QmeK+dlJ
 9mIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728631077; x=1729235877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6cy7cZf4Fx/waVp+aNE/ZvtmmKzyMs0V2HvQk1U00Uk=;
 b=qfKvBnejZfR+5bkJG0pKC0Pai+xmYrIlm6AuQeN3WGHTd/6fuw5uugBjUqMIT5DJFH
 3rVx/Uz6Mc3KFYbPDO7lqU/g6oaoE4xXSThH2wyme/Ll1Qf1OIwh4JRDy1JtTf5t519Q
 adQCnsNC4RPlIdLZX0pp68tUjyoB1wkFOHIaCaps/M/Wl+g+qZ7Gh4uxkKzTtG0UW0cI
 VulrK9elWRUqoI2NGJZtlf7D0i6HJlKsSpKZ7E2R4uSHOYYZK+Rofz7QMhDHDBIQVHux
 vV4e0f4Ter8V+Xv+rmde9vqqse6ekEapA1x75/YqlcAT/H3+Oz6h69aJQ6lF/AMDEGZg
 uSOw==
X-Gm-Message-State: AOJu0YyX6RPDdI1WJo97mPiqNGajmNwRSzUjYA9hbJYjvnin9MRkVcbG
 KmSjwwpwihFq8XtDaq3yA1NGYF8eYIIONVwHXYkQ2c6CoynPnkXeo2MWZQVVfhKtwORUW5GS5Zc
 /7hlLijecDeJEjga4itcGgP63d9c=
X-Google-Smtp-Source: AGHT+IHlr3eLKcishdsjb5bOO9v15G9M4B7PfgNEFCXJmJfQ0Ll5KdyYXV6YFOtgcfEZSZuZFEOS3U4ch7qJ8ZI5EwU=
X-Received: by 2002:a05:6512:10c4:b0:536:7377:7d23 with SMTP id
 2adb3069b0e04-539da564e36mr1145033e87.40.1728631076785; Fri, 11 Oct 2024
 00:17:56 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 11 Oct 2024 17:17:44 +1000
Message-ID: <CAPM=9tyf6kxBxT7H9aPK8y8RDDu7Bx-mLEVPT1zWkapNaXKpcg@mail.gmail.com>
Subject: [git pull] drm fixes for 6.12-rc3
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

Weekly fixes haul for drm, lots of small fixes all over, amdgpu, xe
lead the way, some minor nouveau and radeon fixes, and then a bunch of
misc all over.

Nothing too scary or out of the unusual.

Regards,
Dave.

drm-fixes-2024-10-11:
drm fixes for 6.12-rc3

sched:
- Avoid leaking lockdep map

fbdev-dma:
- Only clean up deferred I/O if instanciated

amdgpu:
- Fix invalid UBSAN warnings
- Fix artifacts in MPO transitions
- Hibernation fix

amdkfd:
- Fix an eviction fence leak

radeon:
- Add late register for connectors
- Always set GEM function pointers

i915:
- HDCP refcount fix

nouveau:
- dmem: Fix privileged error in copy engine channel; Fix possible
  data leak in migrate_to_ram()
- gsp: Fix coding style

v3d:
- Stop active perfmon before destroying it

vc4:
- Stop active perfmon before destroying it

xe:
- Drop GuC submit_wq pool
- Fix error checking with xa_store()
- Fix missing freq restore on GSC load error
- Fix wedged_mode file permission
- Fix use-after-free in ct communication
The following changes since commit 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b=
:

  Linux 6.12-rc2 (2024-10-06 15:32:27 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-10-11

for you to fetch changes up to ac44ff7cec33d5c2d4b72d52603552ec64c1a8bf:

  Merge tag 'drm-xe-fixes-2024-10-10' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2024-10-11 13:54:10 +1000)

----------------------------------------------------------------
drm fixes for 6.12-rc3

sched:
- Avoid leaking lockdep map

fbdev-dma:
- Only clean up deferred I/O if instanciated

amdgpu:
- Fix invalid UBSAN warnings
- Fix artifacts in MPO transitions
- Hibernation fix

amdkfd:
- Fix an eviction fence leak

radeon:
- Add late register for connectors
- Always set GEM function pointers

i915:
- HDCP refcount fix

nouveau:
- dmem: Fix privileged error in copy engine channel; Fix possible
  data leak in migrate_to_ram()
- gsp: Fix coding style

v3d:
- Stop active perfmon before destroying it

vc4:
- Stop active perfmon before destroying it

xe:
- Drop GuC submit_wq pool
- Fix error checking with xa_store()
- Fix missing freq restore on GSC load error
- Fix wedged_mode file permission
- Fix use-after-free in ct communication

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: partially revert powerplay `__counted_by` changes

Christian K=C3=B6nig (1):
      drm/radeon: always set GEM function pointer

Colin Ian King (1):
      drm/nouveau/gsp: remove extraneous ; after mutex

Dave Airlie (4):
      Merge tag 'amd-drm-fixes-6.12-2024-10-08' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2024-10-10' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2024-10-10' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2024-10-10' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Hamza Mahfooz (1):
      drm/amd/display: fix hibernate entry for DCN35+

Jani Nikula (1):
      drm/i915/hdcp: fix connector refcounting

Janne Grunau (1):
      drm/fbdev-dma: Only cleanup deferred I/O if necessary

Josip Pavic (1):
      drm/amd/display: Clear update flags after update has been applied

Lang Yu (1):
      drm/amdkfd: Fix an eviction fence leak

Matt Roper (1):
      drm/xe: Make wedged_mode debugfs writable

Matthew Auld (3):
      drm/xe/ct: prevent UAF in send_recv()
      drm/xe/ct: fix xa_store() error checking
      drm/xe/guc_submit: fix xa_store() error checking

Matthew Brost (2):
      drm/sched: Use drm sched lockdep map for submit_wq
      drm/xe: Drop GuC submit_wq pool

Ma=C3=ADra Canal (2):
      drm/v3d: Stop the active perfmon before being destroyed
      drm/vc4: Stop the active perfmon before being destroyed

Vinay Belgaumkar (1):
      drm/xe: Restore GT freq on GSC load error

Wu Hoi Pok (1):
      drm/radeon: add late_register for connector

Yonatan Maman (2):
      nouveau/dmem: Fix privileged error in copy engine channel
      nouveau/dmem: Fix vulnerability in migrate_to_ram upon copy error

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c          |  7 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  7 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c          | 45 +++++++++---
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h      | 26 +++----
 drivers/gpu/drm/drm_fbdev_dma.c                   |  3 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c         | 10 ++-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c            |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c             |  2 +-
 drivers/gpu/drm/radeon/atombios_dp.c              |  9 +--
 drivers/gpu/drm/radeon/radeon_connectors.c        | 17 +++++
 drivers/gpu/drm/radeon/radeon_gem.c               |  3 -
 drivers/gpu/drm/radeon/radeon_object.c            |  1 +
 drivers/gpu/drm/scheduler/sched_main.c            | 11 +++
 drivers/gpu/drm/v3d/v3d_perfmon.c                 |  9 ++-
 drivers/gpu/drm/vc4/vc4_perfmon.c                 |  7 +-
 drivers/gpu/drm/xe/xe_debugfs.c                   |  2 +-
 drivers/gpu/drm/xe/xe_gt.c                        |  4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                    | 44 +++++++-----
 drivers/gpu/drm/xe/xe_guc_submit.c                | 85 ++-----------------=
----
 drivers/gpu/drm/xe/xe_guc_types.h                 |  7 --
 22 files changed, 149 insertions(+), 158 deletions(-)
