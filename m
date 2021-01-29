Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E250309014
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 23:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC61F6EC40;
	Fri, 29 Jan 2021 22:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DC06EC3F;
 Fri, 29 Jan 2021 22:28:52 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id l14so5261851qvp.2;
 Fri, 29 Jan 2021 14:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ENBYn2b6yYTckojysKoApee6uu3viJZjuJPV//ennnk=;
 b=sGe37qyfAwhMDHP7Um20LlOwgzDnUvbWuwXqqGqBE4rkKTf+CbMIj91ahA61SLOGuD
 AnIWaYIS1obHaecPIuifuePaP/08JbnZFeuE46at+PeK0Fjeg23JbENiAHypPDle4KBj
 WL/X4bpktPqfWqzF7QzD83DR/n76fimksuTzvJa8IlPlFDu3Fh3u/ck8gftFRz+pivqG
 iG4BjvW43aAixmr0sWdSSHI3d5+dhNC+/UN2mEW2yKinmIPlDe8sVILBRa6OpzFx4vCw
 EqBIMva+9KehoZuUauAYhzk2bcuBD/R00wvk2HT7yADLGsjBkRxREiPrdOXKhyrVfLzl
 voug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ENBYn2b6yYTckojysKoApee6uu3viJZjuJPV//ennnk=;
 b=W+MzYDAW9LEylddYlP3hKIcbuNyqpPsq10Om7jlCFXP7RnWSbTRrx5IP6t6299N0Zp
 kQUT3bDbqfoFztM4whwCwGLWbXf3QoPVGRpslWgLUqNrQtdXsppN1MbYgc3XpZwEuMr6
 kfMIy0vlKV/vIvPabgIcUuznkwEFe+Z5EuKhYSzrE22yEiL8szPDQPq2uXrFPjb0bpYw
 e7CLfrVFALLbSptuUOk0SwGoJVfcE8YcVuBRJtxSO7sNDQTF+51KSkDeOw+3Sw3wJ5gA
 TD+cwtPehOfhUiag4MnWwLZaWlI6r2Q1zyDymGk+Nll1wTx5H9YVR1zRFJGe+O5oDBGA
 A1XA==
X-Gm-Message-State: AOAM533UO7+Jt7XEk5LX54T36Q6FjE8YDY8IMIVQldZR0eVbbyE8H4DB
 lnVSzt6RvqPg8zJo69zLUapcmprFBrQ=
X-Google-Smtp-Source: ABdhPJyND4sjfivP5OpM1rzpBplQV5aPkG7ea5RLqYkiCIYsBayI0XxfxNjAQ966HSAnQ8GgvWgUdw==
X-Received: by 2002:a05:6214:1322:: with SMTP id
 c2mr6268408qvv.50.1611959331507; 
 Fri, 29 Jan 2021 14:28:51 -0800 (PST)
Received: from localhost.localdomain ([192.161.78.237])
 by smtp.gmail.com with ESMTPSA id 17sm7984520qtu.23.2021.01.29.14.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 14:28:51 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd drm-next-5.12
Date: Fri, 29 Jan 2021 17:28:40 -0500
Message-Id: <20210129222840.3861-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.29.2
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

Fixes for 5.12.

The following changes since commit a6b8720c2f85143561c3453e1cf928a2f8586ac0:

  Merge tag 'amd-drm-next-5.12-2021-01-20' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-01-20 13:08:18 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.12-2021-01-29

for you to fetch changes up to efa18405baa55a864c61d2f3cc6fe4d363818eb3:

  drm/amd/display: Fix HDMI deep color output for DCE 6-11. (2021-01-25 17:49:47 -0500)

----------------------------------------------------------------
amd-drm-next-5.12-2021-01-29:

amdgpu:
- Display fixes and cleanups
- Vangogh fixes
- Fix possible race when there are timeouts on two rings
- SR-IOV fixes
- Add missing license
- DCE 10/12 bpc fixes
- Display MALL fixes
- Fix SMU user preference settings persistence

amdkfd:
- Fix config handling

----------------------------------------------------------------
Aaron Liu (1):
      drm/amdgpu: update mmhub mgcg&ls for mmhub_v2_3

Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.48

Aric Cyr (2):
      drm/amd/display: Allow PSTATE chnage when no displays are enabled
      drm/amd/display: 3.2.119

Arnd Bergmann (1):
      amdgpu: fix clang build warning

Arunpravin (1):
      drm/amd/pm: store and reinstate swsmu user power configurations

Bhawanpreet Lakha (3):
      drm/amd/display: Enable programing of MALL watermarks
      drm/amd/display: Dynamic cursor cache size for MALL eligibility check
      drm/amd/display: Update dcn30_apply_idle_power_optimizations() code

Bing Guo (2):
      drm/amd/display: Change function decide_dp_link_settings to avoid infinite looping
      drm/amd/display: Fix dml20v2_ModeSupportAndSystemConfigurationFull() to check DesiredBPP.

Colin Ian King (2):
      drm/amd/display: Fix spelling mistake of function name
      drm/amdgpu: Fix masking binary not operator on two mask operations

Dan Carpenter (1):
      drm/amd/display: Fix a potential NULL dereference

Feifei Xu (1):
      drm/amdgpu:Add pcie gen5 support in pcie capability.

Felix Kuehling (2):
      drm/amdkfd: Enable userptr support when KFD is enabled
      drm/amdgpu: Make contiguous pinning optional

George Shen (1):
      drm/amd/display: Log link/connector info provided in BIOS object table

Horace Chen (1):
      drm/amdgpu: race issue when jobs on 2 ring timeout

Huang Rui (2):
      drm/amd/pm: print the timeout of smc message
      drm/amdgpu: remove gpu info firmware of green sardine

Jake Wang (1):
      drm/amd/display: Update dram_clock_change_latency for DCN2.1

Jiapeng Zhong (1):
      drm/amdgpu: Assign boolean values to a bool variable

Jingwen Chen (2):
      drm/amd/amdgpu: remove redundant flush_delayed_work
      drm/amd/amdgpu: add error handling to amdgpu_virt_read_pf2vf_data

Jinzhou Su (4):
      drm/amdgpu: Remove GFXOFF MASK for Vangogh
      drm/amdgpu: modify GCR_GENERAL_CNTL for Vangogh
      drm/amdgpu: Add RLC_PG_DELAY_3 for Vangogh
      drm/amdgpu: Allow GfxOff on Vangogh as default

Jonathan Gray (1):
      drm/amd/display: change license of color_table.c

Kevin Wang (1):
      drm/amd/pm: remove unused message SMU_MSG_SpareX

Lang Yu (1):
      drm/amd/display: fix 64-bit division issue on 32-bit OS

Mario Kleiner (2):
      drm/amd/display: Fix 10/12 bpc setup in DCE output bit depth reduction.
      drm/amd/display: Fix HDMI deep color output for DCE 6-11.

Mike Hsieh (1):
      drm/amd/display: disable FEC while using eDP

Nicholas Kazlauskas (4):
      drm/amd/display: Use hardware sequencer functions for PG control
      drm/amd/display: Allow dmub srv hardware reset before HW init
      drm/amd/display: Guard against NULL pointer deref when get_i2c_info fails
      drm/amd/display: Fix reset sequence with driver direct DMCUB fw load

Pratik Vishwakarma (1):
      Revert "drm/amd/display: Tune min clk values for MPO for RV"

Prike Liang (1):
      drm/amdgpu/pm: no need GPU status set since mmnbif_gpu_BIF_DOORBELL_FENCE_CNTL added in FSDL

Stylon Wang (1):
      drm/amd/display: Report Freesync to vrr_range debugfs entry in DRM

Sung Lee (1):
      drm/amd/display: DCN2X Find Secondary Pipe properly in MPO + ODM Case

Vladimir Stempen (1):
      drm/amd/display: Fixed corruptions on HPDRX link loss restore

Wyatt Wood (1):
      drm/amd/display: Allow dmu_stg to support cached inbox for dmub

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  86 ++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   7 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  23 ++-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |  84 +++++++---
 drivers/gpu/drm/amd/amdkfd/Kconfig                 |   2 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   4 +
 .../gpu/drm/amd/display/dc/bios/command_table.c    |  61 +++++++
 .../drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c |  30 +---
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |  24 +--
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  12 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  28 +++-
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |   6 +
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |   7 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   8 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |  14 ++
 .../drm/amd/display/dc/dce/dce_stream_encoder.c    |   1 +
 drivers/gpu/drm/amd/display/dc/dce/dce_transform.c |   8 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  18 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   9 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   7 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |   6 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c | 182 ++++++++++++++++-----
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h |   3 +-
 drivers/gpu/drm/amd/display/dc/dcn301/Makefile     |   3 +-
 drivers/gpu/drm/amd/display/dc/dcn302/Makefile     |   3 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |   5 +-
 .../display/dc/dml/dcn20/display_mode_vba_20v2.c   | 117 ++++++++-----
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |  32 ++--
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |   3 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   9 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c  |  11 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   9 +-
 .../drm/amd/display/modules/color/color_table.c    |  26 ++-
 drivers/gpu/drm/amd/include/amd_pcie.h             |   2 +
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            |  15 ++
 drivers/gpu/drm/amd/pm/inc/smu_types.h             |   2 -
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 148 ++++++++++++++++-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   2 -
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  11 +-
 42 files changed, 806 insertions(+), 235 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
