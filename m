Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D250545BFE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 08:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42093113FED;
	Fri, 10 Jun 2022 06:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8909A12A816
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 06:00:37 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id d14so8309195eda.12
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 23:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=PMkR1TDRfzwZTrqwlKw4viO8iYqHY8UAxF3PGDlzvcM=;
 b=BaSd3vCJYVXthq5kdEbHnNRury313tthTX1z6CJyxDoHrLGrwdoBY5ubG1A2GYsGzP
 BtSJcpQuaQAavr55W8cndMenJJSWIcyXtIDcqzrmssByTikeSw4+9L7oZNM2I6eAIER3
 9cgzQ03cEgPPHbKBJmswWpfpJTeVyFEEN1NmYj9RQK9sz0tTQ8nWOHLeQqBSiYhbpSOR
 R0RIsaD/rNZV3CK2f/SG8h3Y3+FUthaGTVtddaF+ft1o6cNIjtNC6kGIhuzn/F8E08sV
 F9IPulbHcE9CauTfAziW39SuRED2jG49cemjWbCvQNOXs6nWoFMn5BC6OGW0eH1X7274
 yggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=PMkR1TDRfzwZTrqwlKw4viO8iYqHY8UAxF3PGDlzvcM=;
 b=lOjIpQGkNYS6t919Yn0XrQdNlQWgk5LNmaNkJHGs6GpLCIxTWAqy8wX9OUjOiW3SCl
 fDx6LsVcYdgp7iNQzC7wApownXdFuFKmqQu6EXXH+ff9JQzhI65fSTr/u/xr3B/HNsMv
 dWaBVD67ntOWKmL0qZM3hzqhUqtIckS5XgH9yV90QqRTToCScQ/uekyVYISvZUAJQYNU
 6u7Nv8W2BKzonVN43KZT5YddivP/la9rYR7zHx1FfeHta+68VRhPD9Bw1oVe0fm2Ry+n
 8I8bBgg7Ghfuemo92Y4ZCnFrWbwea/+ifxEclD0Upe80q5D6fZs+SLnH7u4I/8QKDPXv
 8qxw==
X-Gm-Message-State: AOAM531GMdj61uLfKGmUoQAem/bVouYmXqyTrq4KD746GaJXqalxYv7h
 RAxBlc8YwT2HL3ssgQyBxQJrXan7AF0Q+yBaHQc=
X-Google-Smtp-Source: ABdhPJws2TnOFnOyy2onanxmORhFQ87OJqoGfH9JTxJD4h5uXHVlULdX04/Rgk8+RSAtypECi2eEEMc8q1rg/QIHf6k=
X-Received: by 2002:aa7:d6d5:0:b0:431:b7c0:50c9 with SMTP id
 x21-20020aa7d6d5000000b00431b7c050c9mr14986258edr.62.1654840836027; Thu, 09
 Jun 2022 23:00:36 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 10 Jun 2022 16:00:24 +1000
Message-ID: <CAPM=9txaEX1q3FxV3nZQemunXKsbtNhmW9BKGh4UNs3uaCmz_Q@mail.gmail.com>
Subject: [git pull] drm fixes for 5.19-rc2
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

Not a huge amount here, mainly a bunch of scattered amdgpu fixes, and
then some misc panfrost, bridge/panel ones, and one ast fix for
multi-monitors. Probably pick up a bit more next week like rc3 often
does.

Dave.

drm-fixes-2022-06-10:
drm fixes for 5.19-rc2

amdgpu:
- DCN 3.1 golden settings fix
- eDP fixes
- DMCUB fixes
- GFX11 fixes and cleanups
- VCN fix for yellow carp
- GMC11 fixes
- RAS fixes
- GPUVM TLB flush fixes
- SMU13 fixes
- VCN3 AV1 regression fix
- VCN2 JPEG fix
- Other misc fixes

amdkfd:
- MMU notifier fix
- Support for more GC 10.3.x families
- Pinned BO handling fix
- Partial migration bug fix

panfrost:
- fix a use after free

ti-sn65dsi83:
- fix invalid DT configuration

panel:
- two self refresh fixes

ast:
- multiple output fix
The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56=
:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-06-10

for you to fetch changes up to 1f192b9e8d8a5c619b33a868fb1af063af65ce5d:

  Merge tag 'drm-misc-fixes-2022-06-09' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2022-06-10
13:29:22 +1000)

----------------------------------------------------------------
drm fixes for 5.19-rc2

amdgpu:
- DCN 3.1 golden settings fix
- eDP fixes
- DMCUB fixes
- GFX11 fixes and cleanups
- VCN fix for yellow carp
- GMC11 fixes
- RAS fixes
- GPUVM TLB flush fixes
- SMU13 fixes
- VCN3 AV1 regression fix
- VCN2 JPEG fix
- Other misc fixes

amdkfd:
- MMU notifier fix
- Support for more GC 10.3.x families
- Pinned BO handling fix
- Partial migration bug fix

panfrost:
- fix a use after free

ti-sn65dsi83:
- fix invalid DT configuration

panel:
- two self refresh fixes

ast:
- multiple output fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: update VCN codec support for Yellow Carp

Alvin (1):
      drm/amd/display: Don't clear ref_dtbclk value

Aric Cyr (1):
      drm/amd/display: 3.2.187

Aurabindo Pillai (1):
      drm/amd/display: remove stale config guards

Brian Norris (2):
      drm/bridge: analogix_dp: Support PSR-exit to disable transition
      drm/atomic: Force bridge self-refresh-exit on CRTC switch

Candice Li (1):
      drm/amdgpu: Resolve RAS GFX error count issue after cold boot on Arct=
urus

Christian K=C3=B6nig (2):
      drm/amdgpu: fix limiting AV1 to the first instance on VCN3
      drm/amdgpu: always flush the TLB on gfx8

Dave Airlie (3):
      Merge tag 'amd-drm-fixes-5.19-2022-06-08' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2022-05-26' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-misc-fixes-2022-06-09' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Evan Quan (2):
      drm/amd/pm: suppress compile warnings about possible unaligned access=
es
      drm/amdgpu: suppress the compile warning about 64 bit type

Guchun Chen (1):
      Revert "drm/amdgpu: Ensure the DMA engine is deactivated during set u=
ps"

Hung, Cruise (1):
      drm/amd/display: Fix DMUB outbox trace in S4 (#4465)

Ilya (1):
      drm/amd/display: Fix possible infinite loop in DP LT fallback

Jesse Zhang (1):
      drm/amdkfd:Fix fw version for 10.3.6

Jiapeng Chong (1):
      drm/amdgpu: make program_imu_rlc_ram static

Joseph Greathouse (1):
      drm/amdgpu: Add MODE register to wave debug info in gfx11

Lang Yu (1):
      drm/amdkfd: add pinned BOs to kfd_bo_list

Leung, Martin (1):
      drm/amd/display: revert Blank eDP on disable/enable drv

Marek Vasut (1):
      drm/bridge: ti-sn65dsi83: Handle dsi_lanes =3D=3D 0 as invalid

Mario Limonciello (1):
      drm/amdkfd: Add GC 10.3.6 and 10.3.7 KFD definitions

Maxime Ripard (1):
      Merge v5.19-rc1 into drm-misc-fixes

Mohammad Zafar Ziya (1):
      drm/amdgpu/jpeg2: Add jpeg vmid update under IB submit

Nicholas Kazlauskas (2):
      drm/amd/display: Pass the new context into disable OTG WA
      Revert "drm/amd/display: Pass the new context into disable OTG WA"

Philip Yang (3):
      drm/amdkfd: Use mmget_not_zero in MMU notifier
      drm/amdgpu: Update PDEs flush TLB if PTB/PDB moved
      drm/amdkfd: Fix partial migration bugs

Roman Li (1):
      drm/amdgpu: fix aper_base for APU

Sherry Wang (1):
      drm/amd/display: Read Golden Settings Table from VBIOS

Stanley.Yang (1):
      drm/amdgpu: fix ras supported check

Steven Price (1):
      drm/panfrost: Job should reference MMU not file_priv

Sunil Khatri (1):
      drm/amdgpu: enable tmz by default for GC 10.3.7

Thomas Zimmermann (1):
      drm/ast: Support multiple outputs

Yifan Zhang (1):
      drm/amdgpu/mes: only invalid/prime icache when finish loading
both pipe MES FWs.

hengzhou (1):
      drm/amd/display: Wait DMCUB to idle state before reset.

sunliming (2):
      drm/amdgpu: fix a missing break in gfx_v11_0_handle_priv_fault
      drm/amdgpu: make gfx_v11_0_rlc_stop static

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  13 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  32 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  13 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   6 ++
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.h             |   1 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  36 ++++---
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             | 109 +++++++++--------=
----
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  17 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  18 +++-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   5 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |  11 ++-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.h   |   2 +
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |   7 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |   3 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   | 106 +++++++++--------=
---
 drivers/gpu/drm/amd/display/dc/dc.h                |   5 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c  |  68 ++++++-------
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c   |   2 -
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |   1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |  18 ++--
 .../gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c |  19 +++-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |  11 ++-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.h  |   3 +-
 .../drm/amd/display/include/ddc_service_types.h    |   2 +
 .../gpu/drm/amd/pm/swsmu/inc/smu_v11_0_7_pptable.h |   9 +-
 .../gpu/drm/amd/pm/swsmu/inc/smu_v11_0_pptable.h   |   9 +-
 .../gpu/drm/amd/pm/swsmu/inc/smu_v13_0_7_pptable.h |   5 +-
 .../gpu/drm/amd/pm/swsmu/inc/smu_v13_0_pptable.h   |  10 +-
 drivers/gpu/drm/ast/ast_dp.c                       |   5 +-
 drivers/gpu/drm/ast/ast_dp501.c                    |   2 +-
 drivers/gpu/drm/ast/ast_drv.h                      |   9 +-
 drivers/gpu/drm/ast/ast_main.c                     |  21 ++--
 drivers/gpu/drm/ast/ast_mode.c                     |  38 +++----
 drivers/gpu/drm/ast/ast_post.c                     |   2 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  42 +++++++-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |   2 +-
 drivers/gpu/drm/drm_atomic_helper.c                |  16 ++-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |   5 +-
 drivers/gpu/drm/panfrost/panfrost_job.c            |   6 +-
 drivers/gpu/drm/panfrost/panfrost_job.h            |   2 +-
 49 files changed, 430 insertions(+), 301 deletions(-)
