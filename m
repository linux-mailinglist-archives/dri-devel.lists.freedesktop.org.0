Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E32ECA55B90
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 01:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3BD10E837;
	Fri,  7 Mar 2025 00:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eN/sS6jL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143AF10E2F6
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 00:13:22 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-aaec111762bso241801666b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 16:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741306401; x=1741911201; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V+coMIrKPqiErWfQYpK9wmQFyJx26pAi45ANI3Pnrqs=;
 b=eN/sS6jLidZJwWmmPFwOv6awDDVynnvlDrL+O8DbK8QEl+NgXAHBo/IwCRQTwOrp1a
 Iq3kgTZ1ha+JiAuaRiazTrIBjj59xwc/geZHbR/gJ14AgxaqManWZKv0hoe3vFW/sj35
 iO/fwqCponsKcCajVj0oc2PedWcTS4125aWbc7ixtzoyNafdYIpLS35pEPvy5hM8oua0
 2U+gUX3eBhCDtYZ0G7QaSuRDe9715iKB3VHjQBLfp7pPkcj/vxcwXkcPiKrV9CyqVmrC
 fB6beuszoo40w2PGfEWPXyM8HyxK1c+sCPF6Sard3YSZIafPxk4WJQB0YJ2DwEzpPOUR
 UqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741306401; x=1741911201;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V+coMIrKPqiErWfQYpK9wmQFyJx26pAi45ANI3Pnrqs=;
 b=xGXD70QM7H4/GxQ7MBjZz6fQwQIbX8DWsZPHCTDUtVSzFVZlkHXTwvljuXNOssqQxb
 Okebuae+QGzTcFAJjEBNK5ClzVTc7MLMA/ioWQckulDVKfac3PVKIoA+RGHZnfhogl+B
 K+/fenIJHgFjAbomuakp3c18gqagUW/eavOwSVttkS9fzpPgKPmVHxsfEc6jhmEcjyGI
 AVcMYUxhb9aSmEIFerc8T5urZw6EMeNzpFVmy57F4/Vp8bcy4zQPQONNWrNQTL3UGM1G
 UGXFXvTB+sWpGD9XPPWFHjvJ1Ok/MGJXh9x1hJruDSSs+riHkpdM+RyqV/g8CihoRi72
 TYPw==
X-Gm-Message-State: AOJu0YyGasSO59gyfos6BGiEsaf5WmID28DmjFZp3CEFeT55JYEUdMu7
 oj17C5bL2/mm7WvY8A6RxL26qIfmg8iropcTQhsinH8V4cP4ZfWyZVTQ3wFDFCCa4RcZf83ZMDP
 50HzH5qqjA/wWe98GjNQy4HGhoTw=
X-Gm-Gg: ASbGncvM32Cv5YfZxd4vTU98+aKN95RIUDOFeQxSkw1gZBskXFi5t5r1p2JGhUYyw1j
 8KU/AiqEOtJtlXLOqzW+O/C5VOehcB6z72D2G6DK/zor/c3lqP2eYQpUpowMess7iUe9a2sIIFk
 T/iWJ9Zn6no+p9tvGjt1m/jDca
X-Google-Smtp-Source: AGHT+IEs1H7D9wR1RtDGXDvz8FVlYfWVFiJqdKal9HypXfyO5HuEqNCbowowkuut9E3ZHZsn1JHucObPLqq+FkMKUiQ=
X-Received: by 2002:a17:907:1c1f:b0:ac1:dc35:8337 with SMTP id
 a640c23a62f3a-ac252fb9b12mr126049366b.38.1741306400461; Thu, 06 Mar 2025
 16:13:20 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 7 Mar 2025 10:13:09 +1000
X-Gm-Features: AQ5f1JoQcijU1PWlrdTrt7IvLjGGmpF6i0qrOAiYW8LmLQ3TMWUvadsseaEZHJ8
Message-ID: <CAPM=9tzHwhm74Z=itrPBz=yz=0VZOrcbnKs6u5LLQuwJrng5zw@mail.gmail.com>
Subject: [git pull] drm fixes for 6.14-rc6
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

Looks like the cyclone is taking its time getting here, so I can at
least get the drm fixes tree out.

Fixes across the board, mostly xe and imagination with some amd and
misc others. The xe fixes are mostly hmm related, though there are
some others in there as well, nothing really stands out otherwise. The
nouveau Kconfig to select FW_CACHE is in this, which we discussed a
while back.

drm-fixes-2025-03-07:
drm fixes for 6.14-rc6

nouveau:
- rely on fw caching Kconfig fix

imagination:
- avoid deadlock on fence release
- fix fence initialisation
- fix timestamps firmware traces

scheduler:
- fix include guard

bochs:
- dpms fix

i915:
- bump max stream count to match pipes

xe:
- Remove double page flip on initial plane
- Properly setup userptr pfn_flags_mask
- Fix GT "for each engine" workarounds
- Fix userptr races and missed validations
- Userptr invalid page access fixes
- Cleanup some style nits

amdgpu:
- Fix NULL check in DC code
- SMU 14 fix

amdkfd:
- Fix NULL check in queue validation

radeon:
- RS400 HyperZ fix
The following changes since commit 7eb172143d5508b4da468ed59ee857c6e5e01da6=
:

  Linux 6.14-rc5 (2025-03-02 11:48:20 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-03-07

for you to fetch changes up to c8bc66206a44f389649af374f5301b2c3a71fff4:

  Merge tag 'amd-drm-fixes-6.14-2025-03-06' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2025-03-07
09:54:43 +1000)

----------------------------------------------------------------
drm fixes for 6.14-rc6

nouveau:
- rely on fw caching Kconfig fix

imagination:
- avoid deadlock on fence release
- fix fence initialisation
- fix timestamps firmware traces

scheduler:
- fix include guard

bochs:
- dpms fix

i915:
- bump max stream count to match pipes

xe:
- Remove double page flip on initial plane
- Properly setup userptr pfn_flags_mask
- Fix GT "for each engine" workarounds
- Fix userptr races and missed validations
- Userptr invalid page access fixes
- Cleanup some style nits

amdgpu:
- Fix NULL check in DC code
- SMU 14 fix

amdkfd:
- Fix NULL check in queue validation

radeon:
- RS400 HyperZ fix

----------------------------------------------------------------
Alessio Belle (1):
      drm/imagination: Fix timestamps in firmware traces

Andrew Martin (1):
      drm/amdkfd: Fix NULL Pointer Dereference in KFD queue

Brendan King (3):
      drm/imagination: avoid deadlock on fence release
      drm/imagination: Hold drm_gem_gpuva lock for unmap
      drm/imagination: only init job done fences once

Dave Airlie (5):
      drm/nouveau: select FW caching
      Merge tag 'drm-misc-fixes-2025-03-06' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2025-03-06' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-03-06' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.14-2025-03-06' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Jani Nikula (1):
      drm/i915/mst: update max stream count to match number of pipes

Kenneth Feng (1):
      drm/amd/pm: always allow ih interrupt from fw

Ma Ke (1):
      drm/amd/display: Fix null check for pipe_ctx->plane_state in
resource_build_scaling_params

Maarten Lankhorst (1):
      drm/xe: Remove double pageflip

Matthew Auld (1):
      drm/xe/userptr: properly setup pfn_flags_mask

Matthew Brost (1):
      drm/xe: Add staging tree for VM binds

Philipp Stanner (1):
      drm/sched: Fix preprocessor guard

Richard Thier (1):
      drm/radeon: Fix rs400_gpu_init for ATI mobility radeon Xpress 200M

Takashi Iwai (1):
      drm/bochs: Fix DPMS regression

Thomas Hellstr=C3=B6m (6):
      drm/xe/vm: Validate userptr during gpu vma prefetching
      drm/xe/vm: Fix a misplaced #endif
      drm/xe: Fix fault mode invalidation with unbind
      drm/xe/hmm: Style- and include fixes
      drm/xe/hmm: Don't dereference struct page pointers without notifier l=
ock
      drm/xe/userptr: Unmap userptrs in the mmu notifier

Tvrtko Ursulin (1):
      drm/xe: Fix GT "for each engine" workarounds

 drivers/gpu/drm/amd/amdkfd/kfd_queue.c            |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c    |  12 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c       |   3 +-
 drivers/gpu/drm/imagination/pvr_fw_meta.c         |   6 +-
 drivers/gpu/drm/imagination/pvr_fw_trace.c        |   4 +-
 drivers/gpu/drm/imagination/pvr_queue.c           |  18 +-
 drivers/gpu/drm/imagination/pvr_queue.h           |   4 +
 drivers/gpu/drm/imagination/pvr_vm.c              | 134 ++++++++++++---
 drivers/gpu/drm/imagination/pvr_vm.h              |   3 +
 drivers/gpu/drm/nouveau/Kconfig                   |   1 +
 drivers/gpu/drm/radeon/r300.c                     |   3 +-
 drivers/gpu/drm/radeon/radeon_asic.h              |   1 +
 drivers/gpu/drm/radeon/rs400.c                    |  18 +-
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h   |   4 +-
 drivers/gpu/drm/tiny/bochs.c                      |   5 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c     |  10 --
 drivers/gpu/drm/xe/xe_gt.c                        |   4 +-
 drivers/gpu/drm/xe/xe_hmm.c                       | 194 ++++++++++++++++--=
----
 drivers/gpu/drm/xe/xe_hmm.h                       |   7 +
 drivers/gpu/drm/xe/xe_pt.c                        |  96 +++++------
 drivers/gpu/drm/xe/xe_pt_walk.c                   |   3 +-
 drivers/gpu/drm/xe/xe_pt_walk.h                   |   4 +
 drivers/gpu/drm/xe/xe_vm.c                        | 100 +++++++----
 drivers/gpu/drm/xe/xe_vm.h                        |  10 +-
 drivers/gpu/drm/xe/xe_vm_types.h                  |   8 +-
 26 files changed, 459 insertions(+), 200 deletions(-)
