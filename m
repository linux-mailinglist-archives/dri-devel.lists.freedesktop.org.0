Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 132B69AFAA8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 09:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C89310E105;
	Fri, 25 Oct 2024 07:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I0hgd8R3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A91B10E105
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 07:10:39 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a99ebb390a5so523937766b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 00:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729840237; x=1730445037; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=QN1tsLfbB9d5DyYhuV0X7PZg8MBg1dvti2XZFfsqElk=;
 b=I0hgd8R3ZlvCWOa1ZsHV6tAOtjsfNad1v+9L0ARjZ1yN38kAyUS6ieQZCRiGU+eCZw
 Ssx3IvYto+gcHyA/eqdykSOI8RA9S797CIUTn74sNRXeu/B7WEN9ddZnOIo86znyTQOn
 V49lOEwooNc9mWAv9lNgHTBrb1veisRnhAvcxe5wCh4V7AbSpix8nHY1uZ1GPBZyx9FK
 0O+0ItfhtsuWArxjoaQ4Bs2LmCg0qySabWAe3U6PpqBcMtyfIJTKCGue6wrOdE65Vvn7
 /lZ865rh2x3m6Syz6p4ny+3A1aqLbXmmK2LTDo12iWRqw2u/VPcs7OGBBfYljluHTl9O
 rM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729840237; x=1730445037;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QN1tsLfbB9d5DyYhuV0X7PZg8MBg1dvti2XZFfsqElk=;
 b=b/3Y1fyBASRpHNHP/pTXdZQLIgHbAdrTUyu5hV4u082OcJjmyv/yyvknRvkmdzWVc5
 RC6m2H090wgtPX4ysldAw+d9rwnpR3unGXiH4QDLFpxXUpMExqrJugrpdGvPjb1fKfkt
 bHCSW5M5Vp6e35VhATBW/ZXTtcTeIJja3x0Pt/KoDERUtGYksGfW2mq4W9ziz3JeWOxV
 Iyn/XRB2esdDkfB5fdlPqr9VSkT8QtkamCxrYub2RW2JRZyROkJSfPSbhrFGMjrGBqGA
 JvooUUEPDQkPP10rDjEZbaEv9l3yRjNrBMghE/100kNKL+CqNul/Sr6or63PlTPa/NYt
 mAYg==
X-Gm-Message-State: AOJu0YyAu8aNo73n1H1zA7nnQn/jXnzOFmt/XPgGa2SBRQ5D6CbpmuiM
 YuTphGYY+5YMR6g1jx9/emjOue0BDxXnm87G4ttwoeyr77+rluCMY5PJaJ/NexchoSBI74LTnYp
 aQazwk6lINv0tovUZLFVmUrO/XZ7jLdHe
X-Google-Smtp-Source: AGHT+IE69Rqr3iBH6ZNcjuDegoQGEui60s/sn4mr/tPGvtxt6xXxL+X7hGKebCB5jrKTWLLH0Hq1AL+CvD7/bQpwE+0=
X-Received: by 2002:a17:907:eab:b0:a99:3db2:eb00 with SMTP id
 a640c23a62f3a-a9ad1add979mr449403266b.28.1729840236927; Fri, 25 Oct 2024
 00:10:36 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 25 Oct 2024 17:10:25 +1000
Message-ID: <CAPM=9txMNPAbbfxvD+0ouRGY5nojRvu6n+cPc=hjNwQzzj6gtA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.12-rc5
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

Weekly drm fixes, mostly amdgpu and xe, with minor bridge and an i915
Kconfig fix. Nothing too scary and it seems to be pretty quiet.

Dave.

drm-fixes-2024-10-25:
drm fixes for 6.12-rc5

amdgpu:
- ACPI method handling fixes
- SMU 14.x fixes
- Display idle optimization fix
- DP link layer compliance fix
- SDMA 7.x fix
- PSR-SU fix
- SWSMU fix

i915:
- Fix DRM_I915_GVT_KVMGT dependencies in Kconfig

xe:
- Increase invalidation timeout to avoid errors in some hosts
- Flush worker on timeout
- Better handling for force wake failure
- Improve argument check on user fence creation
- Don't restart parallel queues multiple times on GT reset

bridge:
- aux: Fix assignment of OF node
- tc358767: Add missing of_node_put() in error path
The following changes since commit 42f7652d3eb527d03665b09edac47f85fb600924:

  Linux 6.12-rc4 (2024-10-20 15:19:38 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-10-25

for you to fetch changes up to 4d95a12beba146b0ca2de59c7ce905bc0aadfd0c:

  Merge tag 'drm-xe-fixes-2024-10-24-1' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2024-10-25 16:55:39 +1000)

----------------------------------------------------------------
drm fixes for 6.12-rc5

amdgpu:
- ACPI method handling fixes
- SMU 14.x fixes
- Display idle optimization fix
- DP link layer compliance fix
- SDMA 7.x fix
- PSR-SU fix
- SWSMU fix

i915:
- Fix DRM_I915_GVT_KVMGT dependencies in Kconfig

xe:
- Increase invalidation timeout to avoid errors in some hosts
- Flush worker on timeout
- Better handling for force wake failure
- Improve argument check on user fence creation
- Don't restart parallel queues multiple times on GT reset

bridge:
- aux: Fix assignment of OF node
- tc358767: Add missing of_node_put() in error path

----------------------------------------------------------------
Abel Vesa (1):
      drm/bridge: Fix assignment of the of_node of the parent to aux bridge

Alex Deucher (1):
      drm/amdgpu: handle default profile on on devices without fullscreen 3D

Arnd Bergmann (1):
      i915: fix DRM_I915_GVT_KVMGT dependencies

Aurabindo Pillai (2):
      drm/amd/display: temp w/a for dGPU to enter idle optimizations
      drm/amd/display: temp w/a for DP Link Layer compliance

Badal Nilawar (1):
      drm/xe/guc/ct: Flush g2h worker in case of g2h response timeout

Dave Airlie (4):
      Merge tag 'amd-drm-fixes-6.12-2024-10-23' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2024-10-24' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2024-10-24' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2024-10-24-1' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Frank Min (1):
      drm/amdgpu: fix random data corruption for sdma 7

Javier Carrasco (1):
      drm/bridge: tc358767: fix missing of_node_put() in
for_each_endpoint_of_node()

Kenneth Feng (3):
      drm/amd/pm: update the driver-fw interface file for smu v14.0.2/3
      drm/amd/pm: update overdrive function on smu v14.0.2/3
      drm/amd/pm: update deep sleep status on smu v14.0.2/3

Mario Limonciello (2):
      drm/amd: Guard against bad data for ATIF ACPI method
      drm/amd/display: Disable PSR-SU on Parade 08-01 TCON too

Nirmoy Das (2):
      drm/xe/ufence: Prefetch ufence addr to catch bogus address
      drm/xe: Don't restart parallel queues multiple times on GT reset

Shuicheng Lin (2):
      drm/xe: Enlarge the invalidation timeout from 150 to 500
      drm/xe: Handle unreliable MMIO reads during forcewake

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |  15 ++-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |   9 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   3 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  13 ++
 .../drm/amd/display/modules/power/power_helpers.c  |   2 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  11 +-
 .../pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0.h   | 132 +++++++++++++--------
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h       |   2 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  66 ++++-------
 drivers/gpu/drm/bridge/aux-bridge.c                |   3 +-
 drivers/gpu/drm/bridge/tc358767.c                  |   1 +
 drivers/gpu/drm/i915/Kconfig                       |   3 +-
 drivers/gpu/drm/xe/xe_device.c                     |   2 +-
 drivers/gpu/drm/xe/xe_force_wake.c                 |  12 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                     |  18 +++
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  14 ++-
 drivers/gpu/drm/xe/xe_sync.c                       |   3 +-
 17 files changed, 202 insertions(+), 107 deletions(-)
