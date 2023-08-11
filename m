Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE42177876C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 08:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F4610E661;
	Fri, 11 Aug 2023 06:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594F610E660
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 06:27:47 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-99c93638322so341156766b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 23:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691735266; x=1692340066;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hIVu4xRaQ65K+QLDx4GSkUZvf+PrRkBse2FqENJYqPU=;
 b=bq6+wAO21hRxHEoLt2nDJmcRLfjV0lJd6iZfxhgVudmJBG4Mhxub1VuPuXk7x+3dci
 eqj+hOdRU6LxUcNlAPJl1/RTCbZFAXzwu44ZPhxd7Tc7tgvbZf3nPmSzsMmZfxXu5JaJ
 bQJMXTc/+HuD6DsiIKEnek8UCmNrgFXkkJMGWKLsgBAQG/IhdO5GEw+xd8IuoQQdnivX
 DmROCNfQXIIKNZsMRcxbr/nWsP1wFuJUf1CicM0JxtrvgLh/E6mavDtRqVc4h2uTjmkU
 YMLlYME7RVxsjNIxdnTl3kqdCjQwW1NYuVibqBYU+Vt1asAI+JvyLgRmI3Gj2DjOrUBU
 YsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691735266; x=1692340066;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hIVu4xRaQ65K+QLDx4GSkUZvf+PrRkBse2FqENJYqPU=;
 b=bzgIAtwYwn8MFNOAVck/LAY7Sob/woKHu1qobNnnetlrga2faXbl/bty9r/iOyU8w/
 MUr90RzPMcLkAuFo5PzRzn328rlPxv8dOa4RdznW57sEjI+9elZX+0TJCLNBDopN4l4V
 hjAkMTp19v4NT4LwhlOi78E4RG/0S/9k8n4B6Z/AP0Sss5Q91qb5pFSBJIFx8D/MjShB
 FEoUjQ6a7NaAdgDyl7ooyvogL8XcBrjWKie1WbKYd0/gT7W6K3w55Rr9kH2U8VWn9YUc
 Ky19MW+vt5EY0FZCDi3yuieeuerMC+TVOzaDsi+ZrqZGvHn/1hCzWHwFCqLyPNGV+qXB
 pxrg==
X-Gm-Message-State: AOJu0YyHZMmQsp7vvBGnIkvJ9nPu/xoz/6S+09nWA9tEq8NgA7c5RgjU
 pjM2bun6faD2ZTQASTXwFTeuT+wVhzBMS1YVr93eGWCYQFFIxg==
X-Google-Smtp-Source: AGHT+IFE9SyGlOyYLn6GjobtPQ0lrt8D2hLt9kzgAbcsnFAWkYOzVMKppb924qxQo5baVdyO86Jg4q1e3TFzRwVhQ4s=
X-Received: by 2002:a17:906:844e:b0:992:2f67:cd34 with SMTP id
 e14-20020a170906844e00b009922f67cd34mr1248561ejy.22.1691735265362; Thu, 10
 Aug 2023 23:27:45 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 11 Aug 2023 16:27:34 +1000
Message-ID: <CAPM=9ty-3+S5X3638GR=DT_PmApzzXS3yHy-OdvnN0xiGvZJUA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.4-rc6
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Linus,

This week's fixes, as expected amdgpu is probably a little larger
since it skipped a week, but otherwise a few nouveau fixes, a couple
of bridge, rockchip and ivpu fixes.

Dave.

drm-fixes-2023-08-11:
drm fixes for 6.4-rc6

amdgpu:
- S/G display workaround for platforms with >= 64G of memory
- S0i3 fix
- SMU 13.0.0 fixes
- Disable SMU 13.x OD features temporarily while the interface is reworked
  to enable additional functionality
- Fix cursor gamma issues on DCN3+
- SMU 13.0.6 fixes
- Fix possible UAF in CS IOCTL
- Polaris display regression fix
- Only enable CP GFX shadowing on SR-IOV

amdkfd:
- Raven/Picasso KFD regression fix

bridge:
- it6505: runtime PM fix
- lt9611: revert Do not generate HFP/HBP/HSA and EOT packet

nouveau:
- enable global memory loads for helper invocations for userspace driver
- dp 1.3 dpcd+ workaround fix
- remove unused function
- revert incorrect NULL check

accel/ivpu:
- Add set_pages_array_wc/uc for internal buffers

rockchip:
- Don't spam logs in atomic check
The following changes since commit 52a93d39b17dc7eb98b6aa3edb93943248e03b2f:

  Linux 6.5-rc5 (2023-08-06 15:07:51 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-08-11

for you to fetch changes up to fbe8ff726a1de82d87524f306b0f6491e13d7dfa:

  Merge tag 'amd-drm-fixes-6.5-2023-08-09' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2023-08-11
14:49:20 +1000)

----------------------------------------------------------------
drm fixes for 6.4-rc6

amdgpu:
- S/G display workaround for platforms with >= 64G of memory
- S0i3 fix
- SMU 13.0.0 fixes
- Disable SMU 13.x OD features temporarily while the interface is reworked
  to enable additional functionality
- Fix cursor gamma issues on DCN3+
- SMU 13.0.6 fixes
- Fix possible UAF in CS IOCTL
- Polaris display regression fix
- Only enable CP GFX shadowing on SR-IOV

amdkfd:
- Raven/Picasso KFD regression fix

bridge:
- it6505: runtime PM fix
- lt9611: revert Do not generate HFP/HBP/HSA and EOT packet

nouveau:
- enable global memory loads for helper invocations for userspace driver
- dp 1.3 dpcd+ workaround fix
- remove unused function
- revert incorrect NULL check

accel/ivpu:
- Add set_pages_array_wc/uc for internal buffers

rockchip:
- Don't spam logs in atomic check

----------------------------------------------------------------
Alex Deucher (5):
      drm/amdgpu: fix possible UAF in amdgpu_cs_pass1()
      drm/amdgpu/gfx11: only enable CP GFX shadowing on SR-IOV
      drm/amdkfd: ignore crat by default
      drm/amdkfd: disable IOMMUv2 support for KV/CZ
      drm/amdkfd: disable IOMMUv2 support for Raven

Arnd Bergmann (1):
      drm/nouveau: remove unused tu102_gr_load() function

Boris Brezillon (1):
      drm/shmem-helper: Reset vma->vm_ops before calling dma_buf_mmap()

Daniel Stone (1):
      drm/rockchip: Don't spam logs in atomic check

Dave Airlie (2):
      Merge tag 'drm-misc-fixes-2023-08-10' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'amd-drm-fixes-6.5-2023-08-09' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Evan Quan (1):
      drm/amd/pm: disable the SMU13 OD feature support temporarily

Karol Herbst (2):
      drm/nouveau/gr: enable memory loads on helper invocation on all channels
      drm/nouveau/disp: Revert a NULL check inside nouveau_connector_get_modes

Karol Wachowski (1):
      accel/ivpu: Add set_pages_array_wc/uc for internal buffers

Kenneth Feng (1):
      drm/amd/pm: correct the pcie width for smu 13.0.0

Lijo Lazar (2):
      drm/amdgpu: Match against exact bootloader status
      drm/amd/pm: Fix SMU v13.0.6 energy reporting

Lyude Paul (1):
      drm/nouveau/nvkm/dp: Add workaround to fix DP 1.3+ DPCD issues

Mario Limonciello (3):
      drm/amd: Disable S/G for APUs when 64GB or more host memory
      drm/amd/display: Don't show stack trace for missing eDP
      drm/amd/display: Fix a regression on Polaris cards

Melissa Wen (1):
      drm/amd/display: check attr flag before set cursor degamma on DCN3+

Neil Armstrong (1):
      Revert "drm/bridge: lt9611: Do not generate HFP/HBP/HSA and EOT packet"

Pin-yen Lin (1):
      drm/bridge: it6505: Check power state with it6505->powered in IRQ handler

Tim Huang (1):
      drm/amd/pm: skip the RLC stop when S0i3 suspend for SMU v13.0.4/11

 drivers/accel/ivpu/ivpu_gem.c                      |  8 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 26 ++++++++++++
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  8 +++-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             | 15 +++----
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |  4 --
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            | 13 ------
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  8 +---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  5 +--
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  2 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |  3 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |  7 +++-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  4 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 20 ++++++---
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  5 +--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   | 12 ++++--
 drivers/gpu/drm/bridge/ite-it6505.c                |  4 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  4 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |  6 +++
 drivers/gpu/drm/nouveau/nouveau_connector.c        |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c      | 48 +++++++++++++++++++++-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.h  |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk104.c  |  4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110.c  | 10 +++++
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110b.c |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk208.c  |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c  |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c     | 13 ------
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        | 17 ++++----
 30 files changed, 173 insertions(+), 82 deletions(-)
