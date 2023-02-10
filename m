Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71522691625
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 02:20:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4512510EC1B;
	Fri, 10 Feb 2023 01:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E3810EC1B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 01:20:05 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id ud5so11989087ejc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 17:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9qpUczvHafIDDbeuX/cDIdc5ySzgXvl+sHg7LXNm+eI=;
 b=L3OUfq6HJbS1CO7FsX8PQQBUEZhWIguD8Pt2VekeHsx6+pLcvcEFGKQoNNMkAqOTYl
 EB7DYDirFLVogNZF+TO/Zs1Z+FLR9AJSwsp6KV+aR3mJnR4A2zswb7Joa0eaUkwidxCk
 j+jj9TyOgn3WIrCS5+MBeb42X8uQDogyIAFxLMLwHvDG3+6GCcN5ssy1KiDbZr3t2BjJ
 0AQs0k6kokl2ByO6mO+BD5yAI7U3aHzCJuIQ95XKyaTff7gjty2u7fGsTR8g9roK/mp0
 1vy1CH2heEN23Iv1yvbL93FByTLu1eZMFLF2dKFh0z4NQmtjPF49vXTPAKm8C0D0eE7d
 Rslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9qpUczvHafIDDbeuX/cDIdc5ySzgXvl+sHg7LXNm+eI=;
 b=3OLUz5G7fioYag8sIWJNc1qpFntO7tp6Q4jJFMUeniVBAr5iwVO4AwY+2LmCVPHUpw
 sIta9vI4uI8UZvwllaC7ZCHhPjYD7ALOuQuEXo4Dyx2nzSOLwLPinxIrYD/fk5ewC4Pb
 rwI9frOS2fLBGOQSzfSODo+1UJbcWT9t8dKUCOVc8UstnN2yheUI65izccf7pX9FoKSU
 XqS3tsDdJEyAW98ILby0N8p3p5sKeznRL/CnH5VwxH0IunQYLTHMkIQdHV/cHPU8XRpg
 /yG1zCFP45R8IHEVK8OJoulmu5UuYN/1HH8THi7U3X4Gv7PpWBq+E4F2TTtf+wRfYooB
 Lzng==
X-Gm-Message-State: AO0yUKVPb9g3z9VUwpoAmJYWSt35Y0fm47vACEcIrjS02ESRaEGNCdca
 FRBSkarIdejwozLxv8jnr20W+KAnny1DgiRyE+E=
X-Google-Smtp-Source: AK7set9hhFvAcbjrRms72UV/d+Estsz7Gx1R0QCpLZdJReULlwSJJaQ9XPvGJ6F27nMN/TSk5f6JxoDEGKJQIOgQRpY=
X-Received: by 2002:a17:906:13ca:b0:8af:28b5:f80c with SMTP id
 g10-20020a17090613ca00b008af28b5f80cmr1228523ejc.304.1675992003816; Thu, 09
 Feb 2023 17:20:03 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 10 Feb 2023 11:19:51 +1000
Message-ID: <CAPM=9tyEJyxto-DDoerhGFxZWG8-M3xOsAfDhKfgAy8yARhvOA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.2-rc8
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Weekly fixes, the amdgpu had a few small fixes to display flicker on
certain configurations, however it was found the the flicker was
lessened but there were other unintended consequences, so for now
they've been reverted and replaced with an option for users to test
with so future fixes can be developed. Otherwise apart from the usual
bunch of i915 and amdgpu, there's a client, virtio-gpu and an nvidiafb
fix that reorders its loading to avoid failure.

Dave.

drm-fixes-2023-02-10:
drm fixes for 6.2-rc8

client:
- refcount fix

amdgpu:
- a bunch of attempted flicker fixes that regressed turned into a user
  workaround option for now
- Properly fix S/G display with AGP aperture enabled
- Fix cursor offset with 180 rotation
- SMU13 fixes
- Use TGID for GPUVM traces
- Fix oops on in fence error path
- Don't run IB tests on hw rings when sw rings are in use
- memory leak fix

i915:
- Display watermark fix
- fbdev fix for PSR, FBC, DRRS
- Move fd_install after last use of fence
- Initialize the obj flags for shmem objects
- Fix VBT DSI DVO port handling

virtio-gpu:
- fence fix

nvidiafb:
- regression fix for driver load when no hw supported
The following changes since commit 4ec5183ec48656cec489c49f989c508b68b518e3=
:

  Linux 6.2-rc7 (2023-02-05 13:13:28 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-02-10

for you to fetch changes up to 777c1e01cb7e1947765fb0c3b9b71dab18e53e46:

  Merge tag 'amd-drm-fixes-6.2-2023-02-09' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2023-02-10
09:49:13 +1000)

----------------------------------------------------------------
drm fixes for 6.2-rc8

client:
- refcount fix

amdgpu:
- a bunch of attempted flicker fixes that regressed turned into a user
  workaround option for now
- Properly fix S/G display with AGP aperture enabled
- Fix cursor offset with 180 rotation
- SMU13 fixes
- Use TGID for GPUVM traces
- Fix oops on in fence error path
- Don't run IB tests on hw rings when sw rings are in use
- memory leak fix

i915:
- Display watermark fix
- fbdev fix for PSR, FBC, DRRS
- Move fd_install after last use of fence
- Initialize the obj flags for shmem objects
- Fix VBT DSI DVO port handling

virtio-gpu:
- fence fix

nvidiafb:
- regression fix for driver load when no hw supported

----------------------------------------------------------------
Alex Deucher (8):
      drm/amd/display: disable S/G display on DCN 2.1.0
      drm/amd/display: disable S/G display on DCN 3.1.2/3
      drm/amd/display: properly handling AGP aperture in vm setup
      Revert "drm/amd/display: disable S/G display on DCN 3.1.4"
      drm/amdgpu: add S/G display parameter
      Revert "drm/amd/display: disable S/G display on DCN 3.1.2/3"
      Revert "drm/amd/display: disable S/G display on DCN 2.1.0"
      Revert "drm/amd/display: disable S/G display on DCN 3.1.5"

Aravind Iddamsetty (1):
      drm/i915: Initialize the obj flags for shmem objects

Bert Karwatzki (1):
      drm/amdgpu: fix memory leak in amdgpu_cs_sync_rings

Christian K=C3=B6nig (1):
      drm/client: fix circular reference counting issue

Dave Airlie (5):
      nvidiafb: detect the hardware support before removing console.
      Merge tag 'amd-drm-fixes-6.2-2023-02-08' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2023-02-09' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2023-02-09' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-6.2-2023-02-09' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Evan Quan (3):
      drm/amd/pm: add SMU 13.0.7 missing GetPptLimit message mapping
      drm/amd/pm: bump SMU 13.0.0 driver_if header version
      drm/amd/pm: bump SMU 13.0.7 driver_if header version

Friedrich Vock (1):
      drm/amdgpu: Use the TGID for trace_amdgpu_vm_update_ptes

Guilherme G. Piccoli (1):
      drm/amdgpu/fence: Fix oops due to non-matching drm_sched init/fini

Jane Jian (1):
      drm/amdgpu/smu: skip pptable init under sriov

JesseZhang (1):
      amd/amdgpu: remove test ib on hw ring

Jouni H=C3=B6gander (1):
      drm/i915/fbdev: Implement fb_dirty for intel custom fb helper

Kenneth Feng (1):
      drm/amd/amdgpu: enable athub cg 11.0.3

Kent Russell (1):
      drm/amdgpu: Add unique_id support for GC 11.0.1/2

Melissa Wen (1):
      drm/amd/display: fix cursor offset on rotation 180

Rob Clark (1):
      drm/i915: Move fd_install after last use of fence

Ryan Neph (1):
      drm/virtio: exbuf->fence_fd unmodified on interrupted wait

Ville Syrj=C3=A4l=C3=A4 (2):
      drm/i915: Don't do the WM0->WM1 copy w/a if WM1 is already enabled
      drm/i915: Fix VBT DSI DVO port handling

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 11 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  8 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  1 -
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |  4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 47 +++++++++----
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  2 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  2 +
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |  5 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h | 29 ++++----
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |  4 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  6 ++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  1 +
 drivers/gpu/drm/drm_client.c                       | 33 +++++----
 drivers/gpu/drm/i915/display/intel_bios.c          | 33 ++++++---
 drivers/gpu/drm/i915/display/intel_fbdev.c         | 12 ++++
 drivers/gpu/drm/i915/display/skl_watermark.c       |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     | 14 ++--
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |  2 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |  5 +-
 drivers/video/fbdev/nvidia/nvidia.c                | 81 +++++++++++-------=
----
 include/drm/drm_client.h                           |  5 --
 include/uapi/drm/virtgpu_drm.h                     |  1 +
 26 files changed, 200 insertions(+), 119 deletions(-)
