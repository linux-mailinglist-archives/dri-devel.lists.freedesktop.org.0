Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEB323F4E0
	for <lists+dri-devel@lfdr.de>; Sat,  8 Aug 2020 00:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A3C6E2E2;
	Fri,  7 Aug 2020 22:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4747A6E0C5;
 Fri,  7 Aug 2020 22:29:16 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id h21so2479391qtp.11;
 Fri, 07 Aug 2020 15:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ULZyqVIcJH6DCc6VU7hcWK1YaNUKS4X0Mot+DWEUOzc=;
 b=i/DJ37KtkHPxF+b+vin/f2zzi9wjPUNNNuCmNLXjUyxaCAx4Xq3veQ37WN47mfUNFf
 uKONzPSiDiMlJoB8jbqdNVq5JEphMtAdrr/CuRBKuI6XyTe0x5VtoxXupqlqBo1DotvD
 gIJytJXrG8V5fziwBHpe3F210Q8Js1cdDKSaAuBRUdBTLa7KoU88jpZpzxGMjk5voiJu
 PRd/Tc7XM7FeHku5tItkydA/6/HK4ZgqihLIgZ0e/Viux6aW1OIgCBPLCqpB7lfQFE/X
 om4FQEQVGcnimcuBbpNnBLou/D/yc7kwBdNm/eF2asKBC6KY50aE5N8InnhvaDfkW3Yh
 /A6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ULZyqVIcJH6DCc6VU7hcWK1YaNUKS4X0Mot+DWEUOzc=;
 b=Kd4DGoeuQASLtYNNcm9v+evZI7E2sK7lu4hHTcmVh+TGo31D5EX5FtXD4lU0AHVkIJ
 1m1GNGMDfkejtCicN5mMobwduXq8x/G/zjBDj7yJhBPxaSfta+qj/KFNkm3ayGtVS3Tc
 vd606xh0uPH/MJ780/n0E2annb9K56RApKls/3pyYKS1ipKL8Prb/Rr4669JhCqVFkNn
 LXVrmSdCIfCbp6AZ3vR4n+jul1coEmznPzvUDRfFnGl3vcOlpd2xBRKkTg9JQiV6RS+E
 tWBM6qncEGHDnNAXHrvkPcmIMWpaos1LmR8GtnqJNBuPjfsEIRYJJnWxtyHfnvPZHgsO
 AwAQ==
X-Gm-Message-State: AOAM530N0DEBaXGz3L8UdTx8rPIJ7bDN2qfs6JzQs/3Efm7tRfzFyGO8
 ke7uG5jNWv1dZ2YqaOOwqceKosto
X-Google-Smtp-Source: ABdhPJzd1SQ8D3Mog3bYxNYlUtjYMux3XtB/qZGm3RuEcWX+jspzi3spiWWyHD0qddDiSsX4Qxx+4g==
X-Received: by 2002:ac8:3894:: with SMTP id f20mr16360077qtc.243.1596839355107; 
 Fri, 07 Aug 2020 15:29:15 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id 65sm8362272qkf.33.2020.08.07.15.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 15:29:14 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.9
Date: Fri,  7 Aug 2020 18:28:43 -0400
Message-Id: <20200807222843.3909-1-alexander.deucher@amd.com>
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

Fixes for 5.9.

The following changes since commit dc100bc8fae59aafd2ea2e1a1a43ef1f65f8a8bc:

  Merge tag 'drm-msm-next-2020-07-30' of https://gitlab.freedesktop.org/drm/msm into drm-next (2020-08-05 08:05:31 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.9-2020-08-07

for you to fetch changes up to f87812284172a9809820d10143b573d833cd3f75:

  drm/amdgpu: Fix bug where DPM is not enabled after hibernate and resume (2020-08-07 17:52:15 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.9-2020-08-07:

amdgpu:
- Re-add spelling typo fix
- Sienna Cichlid fixes
- Navy Flounder fixes
- DC fixes
- SMU i2c fix
- Power fixes

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/smu: rework i2c adpater registration

Alvin Lee (1):
      drm/amd/display: Don't compare dppclk before updating DTO

Aric Cyr (2):
      drm/amd/display: Fix DP Compliance tests 4.3.2.1 and 4.3.2.2
      drm/amd/display: AMD OUI (DPCD 0x00300) skipped on some sink

Bhawanpreet Lakha (2):
      drm/amd/display: Use seperate dmcub firmware for navy_flounder
      drm/amd/display: Use proper abm/backlight functions for DCN3

Boyuan Zhang (1):
      drm/amdgpu: update dec ring test for VCN 3.0

Changfeng (2):
      Revert "drm/amd/powerplay: drop unnecessary message support check"
      drm/amd/powerplay: drop unnecessary message support check(v2)

Colin Ian King (1):
      drm/amdgpu: fix spelling mistake "Falied" -> "Failed"

Dan Carpenter (1):
      drm/amd/powerplay: off by one bugs in smu_cmn_to_asic_specific_index()

Dmytro Laktyushkin (2):
      drm/amd/display: Clean up global sync param retrieval
      drm/amd/display: populate new dml variable

Eric Bernstein (1):
      drm/amd/display: Use parameter for call to set output mux

Eryk Brol (2):
      drm/amd/display: Rename bytes_pp to the correct bits_pp
      drm/amd/display: Fix naming of DSC Debugfs entry

Evan Quan (2):
      drm/amd/powerplay: update swSMU VCN/JPEG PG logics
      drm/amd/powerplay: put VCN/JPEG into PG ungate state before dpm table setup(V3)

George Shen (1):
      drm/amd/display: Change null plane state swizzle mode to 4kb_s

Guchun Chen (1):
      drm/amdgpu: add printing after executing page reservation to eeprom

Harry Wentland (1):
      drm/amd/display: Fix logger context

Huang Rui (1):
      drm/amdgpu: skip crit temperature values on APU (v2)

Igor Kravchenko (2):
      drm/amd/display: Read VBIOS Golden Settings Tbl
      drm/amd/display: Display goes blank after inst

James Zhu (1):
      drm/amdgpu/jpeg3.0: remove extra asic type check

Jiansong Chen (3):
      drm/amd/powerplay: update driver if version for navy_flounder
      drm/amdgpu: update GC golden setting for navy_flounder
      drm/amdgpu: enable GFXOFF for navy_flounder

JinZe.Xu (1):
      drm/amd/display: Use helper function to check for HDMI signal

John Clements (1):
      drm/amdgpu: expand sienna chichlid reg access  support

Jun Lei (1):
      drm/amd/display: Disable idle optimizations before programming DCN

Kenneth Feng (1):
      drm/amd/powerplay: remove the dpm checking in the boot sequence

Kevin Wang (1):
      drm/amd/swsmu: allow asic to handle sensor type by itself

Likun Gao (6):
      drm/amd/powerplay: skip invalid msg when smu set mp1 state
      drm/amd/powerplay: add msg map for mode1 reset
      drm/amd/powerplay: correct smu message for vf mode
      drm/amdgpu: update golden setting for sienna_cichlid
      drm/amd/powerplay: update driver if file for sienna_cichlid
      drm/amdgpu: use mode1 reset by default for sienna_cichlid

Liu ChengZhe (2):
      drm/amdgpu: fix PSP autoload twice in FLR
      drm amdgpu: Skip tmr load for SRIOV

Martin Tsai (1):
      drm/amd/display: Check lane status again after link training done

Reza Amini (1):
      drm/amd/display: Allow asic specific FSFT timing optimization

Sandeep Raghuraman (1):
      drm/amdgpu: Fix bug where DPM is not enabled after hibernate and resume

Stylon Wang (1):
      drm/amd/display: Fix dmesg warning from setting abm level

Wyatt Wood (1):
      drm/amd/display: Use hw lock mgr

hersen wu (1):
      drm/amd/display: dchubbub p-state warning during surface planes switch

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c             |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  37 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   7 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |   9 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  56 +++++++-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  30 ++++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  11 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |   2 +
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |  81 ++++++++++++
 .../drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c |  69 +++++++++-
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |   7 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  18 ++-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  12 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  65 +++++++---
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |  18 ++-
 drivers/gpu/drm/amd/display/dc/dc_bios_types.h     |   4 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |   4 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |  14 ++
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.h  |   4 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   2 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   4 +-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.h  |  10 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c   |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  27 ++++
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.h |   5 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c  |   3 +
 .../drm/amd/display/dc/dcn20/dcn20_link_encoder.c  |  14 +-
 .../drm/amd/display/dc/dcn20/dcn20_link_encoder.h  |   5 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |  53 +-------
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c  |   3 +
 .../amd/display/dc/dcn30/dcn30_dio_link_encoder.c  |  53 +++++++-
 .../amd/display/dc/dcn30/dcn30_dio_link_encoder.h  |   2 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c  |   5 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |  17 +--
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |   7 +-
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |   3 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dsc.h        |   2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |   5 +
 .../drm/amd/display/include/link_service_types.h   |   2 +
 .../drm/amd/display/modules/freesync/freesync.c    |   5 +-
 drivers/gpu/drm/amd/include/atomfirmware.h         |  54 +++++++-
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c         | 144 +++++++++++++++++++--
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c       |  18 ---
 drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h     |   6 +-
 .../powerplay/inc/smu11_driver_if_sienna_cichlid.h |  21 ++-
 drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h      |   4 +-
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c         |  22 ----
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c         |   8 --
 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c | 103 ++++++---------
 drivers/gpu/drm/amd/powerplay/smu_cmn.c            |  10 +-
 drivers/gpu/drm/amd/powerplay/smu_internal.h       |   3 -
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c          |   1 +
 drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c   |   5 +-
 56 files changed, 807 insertions(+), 286 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
