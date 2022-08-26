Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259635A1FE1
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 06:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E9E10E404;
	Fri, 26 Aug 2022 04:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B568610E404
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 04:30:25 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id bq11so375366wrb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 21:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc;
 bh=a9scMduDb2RgBkGFRzzrneOTBxlEZxkrBW1E8AAXHRY=;
 b=d0WQZrRHmt/GFQCy4PQvfETraZlqA9fMH5i3s5RA2yEuURgzBdC2AU5Bwp5G0sC4pU
 MDLqDYtXBK4yk0juSABn8WRq1G4msR5F0zYtOnHr5P69GWOKj6f49CaCUOHkBdncvd1n
 Btk8/qwKXqJhiEOuTiQhTg7BpJmG6YlzGlXo4a8Ff22gsNfs1j21f95Ub7TYYTcxpPX5
 e6wtvOHdUBPkOfpbI8JvClWfmYubURZc5GftNTuhxqLxB7+6A27G+epd39rRgLejdglJ
 G3Q5u6/AYgrH2C1jxANo9XWFGzG1FH3muJ6lv+nZ2N9g9Myvn3J2u24x/FiJGKb6V3mb
 Y/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc;
 bh=a9scMduDb2RgBkGFRzzrneOTBxlEZxkrBW1E8AAXHRY=;
 b=DydyXvBXuBuLe3aPsnRQ4g2tDAaSblUDWc80OrYxKlNh96XiN8c3cEjSIoRuDgB7Gg
 5c3q1fr5IvirSrW/RnZXQAcqZGi1WuaRF8VTLdU11X1XuxtXnysYVaR1R72dw7VIEVxB
 tePSvGVeSAiv8mThoojX8kLSqcKbfWkRpC2OWQNtLmuj7Wm1ZmDuqYA3h8RKEKfWtSsQ
 EnnvkKocWV4lcH2zzf3XtBjvSBCMyQUZ0BVIquNLjqYhveOOjqTIGISJ8XNwQSmwYCrk
 v4gqMXRhBlMl7Ej7Pb74wbSJTuzA2H4Q3tfFQ9dmV+Wn6nQsJxZol7LBN4ObK7h9/WsB
 1/cQ==
X-Gm-Message-State: ACgBeo3le4zkJVjbBv2sYocZ+uLUPoDFnj8j4KEhpz71B6+/qlgvmAhB
 ib3xvJFzfDZTCFZNwoJdt2O5joL/KqvQdg7t3Cc=
X-Google-Smtp-Source: AA6agR4J9K00wybccBT+g94ENUgUbF/+FCKxm7nrEaz8COpyAzKGtL0SkzGth65sA4m0k7+C+BG/zEOucB5VccPoIJw=
X-Received: by 2002:adf:f7ca:0:b0:225:2df0:d23 with SMTP id
 a10-20020adff7ca000000b002252df00d23mr3730219wrq.255.1661488224114; Thu, 25
 Aug 2022 21:30:24 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 26 Aug 2022 14:30:12 +1000
Message-ID: <CAPM=9tzv9SAUpqMNh=4EuE3kCOYrsO9bW1vH8NiB+0rbOZv3LA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.0-rc3
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

Weekly fixes, lots of amdgpu fixes mostly for IP blocks introduced in
6.0-rc1, otherwise vc4, nouveau fixes. There is a backmerge in here to
resync our misc-fixes tree with fixes after rc1, but it should be
harmless.

Regards,
Dave.

drm-fixes-2022-08-26-1:
drm fixes for 6.0-rc3

gem:
- Fixes handle release leak

nouveau:
- fix fencing when moving BO

vc4:
- HDMI fixes

amdgpu:
- GFX 11.0 fixes
- PSP XGMI handling fixes
- GFX9 fix for compute-only IPs
- Drop duplicated function call
- Fix warning due to missing header
- NBIO 7.7 fixes
- DCN 3.1.4 fixes
- SDMA 6.0 fixes
- SMU 13.0 fixes
- Arcturus GPUVM page table fix
- MMHUB 1.0 fix

amdkfd:
- GC 10.3.7 fix

radeon:
- Delayed work flush fix
The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc555=
:

  Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-08-26-1

for you to fetch changes up to 100d0ae82b5c240a4dc17486698e67bf116bd598:

  Merge tag 'amd-drm-fixes-6.0-2022-08-25' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2022-08-26
09:56:53 +1000)

----------------------------------------------------------------
drm fixes for 6.0-rc3

gem:
- Fixes handle release leak

nouveau:
- fix fencing when moving BO

vc4:
- HDMI fixes

amdgpu:
- GFX 11.0 fixes
- PSP XGMI handling fixes
- GFX9 fix for compute-only IPs
- Drop duplicated function call
- Fix warning due to missing header
- NBIO 7.7 fixes
- DCN 3.1.4 fixes
- SDMA 6.0 fixes
- SMU 13.0 fixes
- Arcturus GPUVM page table fix
- MMHUB 1.0 fix

amdkfd:
- GC 10.3.7 fix

radeon:
- Delayed work flush fix

----------------------------------------------------------------
Candice Li (1):
      drm/amdgpu: Check num_gfx_rings for gfx v9_0 rb setup.

Dave Airlie (2):
      Merge tag 'drm-misc-fixes-2022-08-25' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'amd-drm-fixes-6.0-2022-08-25' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Evan Quan (1):
      drm/amd/pm: update SMU 13.0.0 driver_if header

Jeffy Chen (1):
      drm/gem: Fix GEM handle release errors

Karol Herbst (1):
      nouveau: explicitly wait on the fence in nouveau_bo_move_m2mf

Likun Gao (1):
      drm/amdgpu: add MGCG perfmon setting for gfx11

Maxime Ripard (2):
      drm/vc4: hdmi: Depends on CONFIG_PM
      drm/vc4: hdmi: Rework power up

Ma=C3=ADra Canal (1):
      drm/amd/display: Include missing header

Mukul Joshi (1):
      drm/amdgpu: Fix page table setup on Arcturus

Prike Liang (1):
      drm/amdkfd: Fix isa version for the GC 10.3.7

Qu Huang (1):
      drm/amdgpu: mmVM_L2_CNTL3 register not initialized correctly

Roman Li (1):
      drm/amd/display: enable PCON support for dcn314

Thomas Zimmermann (1):
      Merge drm/drm-fixes into drm-misc-fixes

Tim Huang (5):
      drm/amdgpu: enable GFXOFF allow control for GC IP v11.0.1
      drm/amdgpu: add TX_POWER_CTRL_1 macro definitions for NBIO IP v7.7.0
      drm/amdgpu: add NBIO IP v7.7.0 Clock Gating support
      drm/amdgpu: enable NBIO IP v7.7.0 Clock Gating
      drm/amdgpu: add sdma instance check for gfx11 CGCG

YiPeng Chai (2):
      drm/amdgpu: Move psp_xgmi_terminate call from
amdgpu_xgmi_remove_device to psp_hw_fini
      drm/amdgpu: fix hive reference leak when adding xgmi device

Zhenneng Li (1):
      drm/radeon: add a force flush to delay work when radeon

shaoyunl (1):
      drm/amdgpu: Remove the additional kfd pre reset call for sriov

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             | 24 ++++---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  3 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            | 12 +++-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             | 78 ++++++++++++++++++=
++++
 drivers/gpu/drm/amd/amdgpu/soc21.c                 | 22 ++++--
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  6 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  5 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h    |  8 ---
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |  1 +
 .../amd/include/asic_reg/nbio/nbio_7_7_0_offset.h  |  2 +
 .../amd/include/asic_reg/nbio/nbio_7_7_0_sh_mask.h | 13 ++++
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h | 31 +++++----
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |  2 +-
 drivers/gpu/drm/drm_gem.c                          | 17 +----
 drivers/gpu/drm/drm_internal.h                     |  4 +-
 drivers/gpu/drm/drm_prime.c                        | 20 +++---
 drivers/gpu/drm/nouveau/nouveau_bo.c               |  9 +++
 drivers/gpu/drm/radeon/radeon_device.c             |  3 +
 drivers/gpu/drm/vc4/Kconfig                        |  1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 17 +++--
 24 files changed, 206 insertions(+), 82 deletions(-)
