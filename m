Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7378E9F17FF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 22:24:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15AE10E346;
	Fri, 13 Dec 2024 21:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c3eKXHoi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7874C10E142
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 21:23:57 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aa679ad4265so617988766b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 13:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734125036; x=1734729836; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ko6SqQy8zgaq8WuJxgzJuB+CGxF6XuhiRKK6wt4rr1M=;
 b=c3eKXHoifJ+iFXds6qTk8vz455oTd6itHcb8932ehP0QVVNepQaAm0uw2A7+SjG9M2
 SGlbq4YOeL0wIJA5yxvk9Pi3/bXzoHXSN8KFSYCkY5+7DVtjNXwYfV7ARL9dvyIfrVzT
 xbW/hK95LqoJ5ofUHGpQhWNfC3JkZkbBRzFwoXm2joE3+plEej2tZyImTPxC+JO2kJxF
 GETL3lmifXYDe6/QSFlSwU+fqN2GrCmnlbktNfos4oOHl+OzMCEzJcJpgWuNcZwG3esw
 vCHA3nC2eOuSqvuYXkZXmdAfpPvZZ52HK83iKDu+iS7ey9U9w0ByDD/hZfAyVRkb9txj
 1KoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734125036; x=1734729836;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ko6SqQy8zgaq8WuJxgzJuB+CGxF6XuhiRKK6wt4rr1M=;
 b=Y3wPrzuzveGorUU0LH7ZnhhIcUE1AGiYhwdiXh1drwi+jXPQFP/0hhvF/c2DXfPao6
 v7rz0Jso/hajyWYj6ZL098Vz4KpcTA7tlaoRn3YDJUt2kc0/pvZnkT4sLcrYvu4p72vh
 +w+iXt3Nggqv2GeU7uWCXBJ+/TgSOwL9WpqYYAgmNyOj7TX6rHgEfojppv2CoFxq5Dya
 zuS86ms/ul0n3Mofn8xXXjYd359VQnaxahokIFKmyT3W9q/WvusKqjHIKYqReeuc9XrE
 SyCr318NWBCwF8T8W3ucmv30mJJsqbI+OzjH/ybQYExrCSgtM5NToac8EgTg2Zi4qlZK
 hqwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5zC4ugthWS+IZFXUTEZQtjPQIJEhFu+rV0gJMqwvBT8OUkD7Kuhzh3CE+nPPHBQu/Jkm7qtaJFS4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzq9jZBoDSqI3SmOYqkKAbXuTtgWXF/724267ExIWZbZ5yaAa0H
 9Kz//TUMoBGtaYWgV+ZxyXh9Z32iblawq5sZ5t39BeFd6S5ctEgikksfstdQOZCAfOfRdaDVTkw
 blov/oNgOBtoVwEMuHcopcfDmwXy+CGzM
X-Gm-Gg: ASbGncsjF7VOF9XWuaXCxxFKcUtMES7xxfL/B6gQ5D+MlOhsrHGBIBrBQtHjHI6vb4V
 As0g2kjPDkgDMw/QVmxLR/1CH/eNbdHCFCmqY
X-Google-Smtp-Source: AGHT+IEPGkmoimuWCVe3G3imQ1LRZj/yAkACmoMdE4SG4c9rfT1r1umXXrh0Fonid474ByBp4kNOXWLF7rpPDcrV1Ns=
X-Received: by 2002:a17:907:7709:b0:aa6:79c0:d8ce with SMTP id
 a640c23a62f3a-aab7b0e8a85mr342981666b.1.1734125035505; Fri, 13 Dec 2024
 13:23:55 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 14 Dec 2024 07:23:44 +1000
Message-ID: <CAPM=9tyHzxubr_sRuNSoPdJB4uL=E1cFzUzNxY1dPrOW=y-NdQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.13-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

This is the weekly fixes pull for drm. Just has i915, xe and amdgpu
changes in it, the misc tree didn't get a PR to me this week (cc'ed),
so next week might have a larger set of changes, otherwise nothing too
major in here.

Regards,
Dave.


drm-fixes-2024-12-14:
drm fixes for 6.13-rc3

i915:
- Don't use indexed register writes needlessly [dsb]
- Stop using non-posted DSB writes for legacy LUT [color]
- Fix NULL pointer dereference in capture_engine
- Fix memory leak by correcting cache object name in error handler

xe:
- Fix a KUNIT test error message (Mirsad Todorovac)
- Fix an invalidation fence PM ref leak (Daniele)
- Fix a register pool UAF (Lucas)

amdgpu:
- ISP hw init fix
- SR-IOV fixes
- Fix contiguous VRAM mapping for UVD on older GPUs
- Fix some regressions due to drm scheduler changes
- Workload profile fixes
- Cleaner shader fix

amdkfd:
- Fix DMA map direction for migration
- Fix a potential null pointer dereference
- Cacheline size fixes
- Runtime PM fix
The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4=
:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-12-14

for you to fetch changes up to d172ea67dbeec5c90f72752c91d202d5718e3754:

  Merge tag 'amd-drm-fixes-6.13-2024-12-11' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2024-12-13
09:43:20 +1000)

----------------------------------------------------------------
drm fixes for 6.13-rc3

i915:
- Don't use indexed register writes needlessly [dsb]
- Stop using non-posted DSB writes for legacy LUT [color]
- Fix NULL pointer dereference in capture_engine
- Fix memory leak by correcting cache object name in error handler

xe:
- Fix a KUNIT test error message (Mirsad Todorovac)
- Fix an invalidation fence PM ref leak (Daniele)
- Fix a register pool UAF (Lucas)

amdgpu:
- ISP hw init fix
- SR-IOV fixes
- Fix contiguous VRAM mapping for UVD on older GPUs
- Fix some regressions due to drm scheduler changes
- Workload profile fixes
- Cleaner shader fix

amdkfd:
- Fix DMA map direction for migration
- Fix a potential null pointer dereference
- Cacheline size fixes
- Runtime PM fix

----------------------------------------------------------------
Andrew Martin (1):
      drm/amdkfd: Dereference null return value

Christian K=C3=B6nig (2):
      drm/amdgpu: fix UVD contiguous CS mapping problem
      drm/amdgpu: fix when the cleaner shader is emitted

Daniele Ceraolo Spurio (1):
      drm/xe: Call invalidation_fence_fini for PT inval fences in error sta=
te

Dave Airlie (3):
      Merge tag 'drm-intel-fixes-2024-12-11' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2024-12-12' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.13-2024-12-11' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

David (Ming Qiang) Wu (1):
      amdgpu/uvd: get ring reference from rq scheduler

Eugene Kobyak (1):
      drm/i915: Fix NULL pointer dereference in capture_engine

Harish Kasiviswanathan (2):
      drm/amdkfd: hard-code cacheline size for gfx11
      drm/amdkfd: hard-code MALL cacheline size for gfx11, gfx12

Jesse.zhang@amd.com (1):
      drm/amdkfd: pause autosuspend when creating pdd

Jiasheng Jiang (1):
      drm/i915: Fix memory leak by correcting cache object name in error ha=
ndler

Kenneth Feng (1):
      drm/amd/pm: Set SMU v13.0.7 default workload type

Lijo Lazar (1):
      drm/amd/pm: Initialize power profile mode

Lucas De Marchi (1):
      drm/xe/reg_sr: Remove register pool

Mirsad Todorovac (1):
      drm/xe: fix the ERR_PTR() returned on failure to allocate tiny pt

Pratap Nirujogi (2):
      Revert "drm/amdgpu: Fix ISP hw init issue"
      drm/amdgpu: Fix ISP HW init issue

Prike Liang (1):
      drm/amdkfd: Correct the migration DMA map direction

Victor Zhao (1):
      drm/amdgpu: use sjt mec fw on gfx943 for sriov

Ville Syrj=C3=A4l=C3=A4 (2):
      drm/i915/dsb: Don't use indexed register writes needlessly
      drm/i915/color: Stop using non-posted DSB writes for legacy LUT

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             | 17 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             | 13 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            | 10 ++-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              | 24 ++++++-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  | 15 ++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           | 23 +-----
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c | 12 ++--
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |  1 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 24 +++++--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  1 +
 drivers/gpu/drm/i915/display/intel_color.c         | 81 ++++++++++++++----=
----
 drivers/gpu/drm/i915/display/intel_dsb.c           | 19 ++++-
 drivers/gpu/drm/i915/display/intel_dsb.h           |  2 +
 drivers/gpu/drm/i915/i915_gpu_error.c              | 18 ++++-
 drivers/gpu/drm/i915/i915_scheduler.c              |  2 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c              |  4 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |  8 +++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h        |  1 +
 drivers/gpu/drm/xe/xe_pt.c                         |  3 +-
 drivers/gpu/drm/xe/xe_reg_sr.c                     | 31 ++-------
 drivers/gpu/drm/xe/xe_reg_sr_types.h               |  6 --
 25 files changed, 200 insertions(+), 125 deletions(-)
