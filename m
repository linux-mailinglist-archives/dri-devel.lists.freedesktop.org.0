Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9047C2E21B3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 21:48:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC076E890;
	Wed, 23 Dec 2020 20:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C296E88D;
 Wed, 23 Dec 2020 20:48:03 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id p12so357327qvj.13;
 Wed, 23 Dec 2020 12:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rB/ma7etmTQsKntGAzFzwoTV6KnJ2Xebg8sYZNhBMok=;
 b=ZaO9a1XBy6eQGLx4GqEzrV18vlkRvWIq3nGa03GBpBqBNAfr+gPtuAZurutDf8WBH1
 iaKKhNRncrAoApWWyHoOVnPyHTZjCCZP51poFxKfvqhJQL3+CZw8CXwhHEsboxuF7XI1
 6FqHYpFizHik0OUMTIY5FQuZjlDTZ1zOegD5GwDsTvvgLINtYPmru+2a4KGY83EfXCpz
 mriJRFfC5uAeRItuME+AASGg3oe1uTiUFtIlzy4b5pIbknMOt+bHIJ1V4d8UHl+sKRdp
 3fGztZ2fDzut3jNocSy3fl+VeieDFuMbwrzlTun/Cyl5I9VTVcUFz6QnClVLvg73HagZ
 PC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rB/ma7etmTQsKntGAzFzwoTV6KnJ2Xebg8sYZNhBMok=;
 b=MTFyhk6k+UPXfIIJYdzj9N4BW3BnibZ8E1nQhxb/pVrwl1BzntAm/kSHRSMwrGjorS
 BUuUL0EoMfCjxaG9akacNqnGkWW3SpQPPvlHvnb3slShQDekSe0W9gtnZwxqdr3uZHd7
 H6c2tIqnnuEjKjK1YnTruL5SNAE0p41XUwF3UXa/Q2TtRRyTUWWJCXly7kQg1napWBlC
 w2Xiaznz3ZDK0H5QlEEHj8BNFBDbZaTJV4TGQZGbr/2TLaeHeMPbhOaewiPuva4OJ23M
 h8WToPVA8nxd9JY2JgtpzQPIQnXdUvyaCn+KHidKFzW2HcUHrZvoYVkUsRvcgR7FgNQN
 crMA==
X-Gm-Message-State: AOAM5309skVDY+GGKrOwwb53cNdim3XK6gfjCSZJmnOxVrKEoNzhqdju
 reP6kUQRe/TuW3dKSXmNBYtdYGKb6iU=
X-Google-Smtp-Source: ABdhPJwCjGKYxwYsYimRluvfcFLUcGIMVOiSW90wvRCfmC53B8CbMm8RhbJAtFT65JDb082KrWc16g==
X-Received: by 2002:a0c:b9a8:: with SMTP id v40mr26973083qvf.36.1608756482156; 
 Wed, 23 Dec 2020 12:48:02 -0800 (PST)
Received: from localhost.localdomain ([192.161.78.241])
 by smtp.gmail.com with ESMTPSA id a5sm16313150qtn.57.2020.12.23.12.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 12:48:01 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd drm-fixes-5.11
Date: Wed, 23 Dec 2020 15:47:52 -0500
Message-Id: <20201223204752.4019-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Fixes for 5.11.

The following changes since commit 6ae09fa49147e557eb6aebbb5b2059b63706d454:

  drm/amdgpu/disply: fix documentation warnings in display manager (2020-12-16 13:27:17 -0500)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.11-2020-12-23

for you to fetch changes up to a135a1b4c4db1f3b8cbed9676a40ede39feb3362:

  drm/amd/display: Fix memory leaks in S3 resume (2020-12-23 15:03:15 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.11-2020-12-23:

amdgpu:
- Vangogh SMU fixes
- Arcturus gfx9 fixes
- Misc display fixes
- Sienna Cichlid SMU update
- Fix S3 display memory leak
- Fix regression caused by DP sub-connector support

amdkfd:
- Properly require pcie atomics for gfx10

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu: fix vbios reservation handling on SR-IOV
      drm/amdgpu: only set DP subconnector type on DP and eDP connectors
      drm/amdgpu: Fix a copy-pasta comment

Aric Cyr (1):
      drm/amd/display: Multi-display underflow observed

Eryk Brol (1):
      drm/amd/display: Remove unnecessary NULL check

Evan Quan (1):
      drm/amd/pm: bump Sienna Cichlid smu_driver_if version to match latest pmfw

Harish Kasiviswanathan (1):
      drm/amdkfd: PCIe atomics required for gfx10

Hawking Zhang (3):
      drm/amdgpu: check number of gfx ring before init cp gfx
      drm/amdgpu: remove unnecessary asic type check
      drm/amdgpu: check gfx pipe availability before toggling its interrupts

Jake Wang (2):
      drm/amd/display: updated wm table for Renoir
      drm/amd/display: always program DPPDTO unless not safe to lower

Josip Pavic (1):
      drm/amd/display: add getter routine to retrieve mpcc mux

Martin Tsai (2):
      drm/amd/display: Modify the hdcp device count check condition
      drm/amd/display: To modify the condition in indicating branch device

Michael Strauss (1):
      drm/amd/display: Update RN/VGH active display count workaround

Qingqing Zhuo (1):
      drm/amd/display: handler not correctly checked at remove_irq_handler

Rizvi (1):
      drm/amd/display: gradually ramp ABM intensity

Stylon Wang (1):
      drm/amd/display: Fix memory leaks in S3 resume

Sung Lee (1):
      drm/amd/display: Acquire DSC during split stream for ODM only if top_pipe

Wesley Chalmers (1):
      drm/amd/display: Interfaces for hubp blank and soft reset

Xiaomeng Hou (1):
      drm/amd/pm: check pmfw version before issuing RlcPowerNotify message

Yongqiang Sun (2):
      drm/amd/display: change SMU repsonse timeout to 2s.
      drm/amd/display: [FW Promotion] Release 0.0.47

 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     | 10 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              | 21 ++++++++-----
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              | 11 +++----
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            | 12 ++++----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  5 +--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |  5 ++-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  | 36 +++++++++-------------
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c        |  2 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |  9 +-----
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 20 ------------
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  8 +----
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  | 18 +++++++++++
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h  |  4 +++
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mpc.c   | 12 ++++++++
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mpc.h   |  1 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |  2 ++
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c | 12 ++++++--
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c   |  1 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |  2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c  |  2 ++
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |  1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |  2 ++
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |  4 +++
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  4 +--
 .../drm/amd/display/modules/hdcp/hdcp1_execution.c |  8 +++--
 .../drm/amd/display/modules/hdcp/hdcp2_execution.c |  7 +++--
 .../drm/amd/display/modules/power/power_helpers.c  | 35 +++++++++++++++------
 .../drm/amd/display/modules/power/power_helpers.h  |  1 +
 drivers/gpu/drm/amd/pm/inc/smu_v11_0.h             |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  9 ++++--
 32 files changed, 161 insertions(+), 111 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
