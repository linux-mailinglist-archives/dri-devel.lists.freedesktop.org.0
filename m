Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4911A2BDB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 00:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E566E062;
	Wed,  8 Apr 2020 22:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38956E062;
 Wed,  8 Apr 2020 22:22:57 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id q73so4576332qvq.2;
 Wed, 08 Apr 2020 15:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L81ln5oXJbeXyAF5yWJrG2bGIx1HQKbTu9eVwydnDvE=;
 b=HrdXC1rJGt57H+lKojEsG5VxA4pCy6MIS9ia7KcPKaV54P2+Fv9ScUgoteN8tuHn8J
 2rCFDPq2nsg3EmG3m0z38ZQ33/sQhPnPpi/A+bqAG7qX4r/dHzOe5jwcTDs6kB/5q+on
 z7riWhuy+pVXHqgWM6JZZLomU1cVea5TxMBoR/SH0DrozgXht0GmUFwkYIu9ZeT87ZN3
 aCDUzPK1cVINs4ag+xGEeMU2Ao1/ahp6F8+AAGRraX6amHQgHgK7q8/Ti/xRdHqb0977
 9DNfW5nVrXlZ2r1Q39JiTzuMGUtm8aDcmZlR1kI28OweQmM2SF5wWVZdSJ3F4Cu+RLH4
 6s1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L81ln5oXJbeXyAF5yWJrG2bGIx1HQKbTu9eVwydnDvE=;
 b=e7dUO0TfAiCokF2XQBF3YoROHYu9qlWBiLAXeLdvPdNxUATyMbcl823CG8G03cfKe1
 VhxmjLxsQ3CDb6cFX0CAnobFwBFEMf8V5fKZ7mDlfav9VOyewbqU4ESi7vj/NVeDU1CR
 ilpHgqqEekKuuMWWbEjHXg1FhrBrLPpbskDPKFgaALm8MeJYk21OGlQYt2R7t3PpExRd
 HpBZVk00actSoWATnv5QGnuarja16Dd8jNfCaPVQWAMkG2/+v6J07pSNfdSGoaPVsjlb
 4fYTBeCYXHrDCrZqFG/3V1GsvMTAhRv/v8sTOdELfwS4ZGGqZ+vHxjVnHMzPSBJeI52h
 qw/w==
X-Gm-Message-State: AGi0PubEASgmIfQqd83ulbwylqGc3NQAvCwkXXEYWsp5myhLPfgVjVQE
 SbQRv6Dt2L2QbA1XQMeLTR/nMFqq
X-Google-Smtp-Source: APiQypJ4dsWBiOQk2bSbfUEcWCxFDbDprJmTUWY5PV6WKXahEeuipPfgOR5h+onoZLBmoTTVTRLSkA==
X-Received: by 2002:a0c:cc90:: with SMTP id f16mr9902002qvl.236.1586384576650; 
 Wed, 08 Apr 2020 15:22:56 -0700 (PDT)
Received: from localhost.localdomain ([71.219.40.23])
 by smtp.gmail.com with ESMTPSA id c8sm4170378qtp.31.2020.04.08.15.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 15:22:55 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.7
Date: Wed,  8 Apr 2020 18:22:40 -0400
Message-Id: <20200408222240.3942-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.2
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

Fixes for 5.7.

The following changes since commit 3148a6a0ef3cf93570f30a477292768f7eb5d3c3:

  drm/amdkfd: kfree the wrong pointer (2020-04-01 14:44:22 -0400)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.7-2020-04-08

for you to fetch changes up to 7e7ea24f0b46cd3078bc9af29d1c1aced89d1c8e:

  drm/amdgpu/display: fix warning when compiling without debugfs (2020-04-08 17:53:11 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.7-2020-04-08:

amdgpu:
- Various Renoir fixes
- Fix gfx clockgating sequence on gfx10
- RAS fixes
- Avoid MST property creation after registration
- Various cursor/viewport fixes
- Fix a confusing log message about optional firmwares

----------------------------------------------------------------
Aaron Liu (1):
      drm/amdgpu: unify fw_write_wait for new gfx9 asics

Aaron Ma (1):
      drm/amdgpu: Fix oops when pp_funcs is unset in ACPI event

Alex Deucher (2):
      drm/amdgpu/psp: dont warn on missing optional TA's
      drm/amdgpu/display: fix warning when compiling without debugfs

Chengming Gui (1):
      drm/amd/amdgpu: Correct gfx10's CG sequence

Eric Yang (1):
      drm/amd/display: change default pipe_split policy for DCN1

Evan Quan (1):
      drm/amd/powerplay: error out on forcing clock setting not supported

Isabel Zhang (1):
      drm/amd/display: Update stream adjust in dc_stream_adjust_vmin_vmax

Jerry (Fangzhi) Zuo (1):
      drm/amd/display: Avoid create MST prop after registration

John Clements (2):
      drm/amdgpu: resolve mGPU RAS query instability
      drm/amdgpu: update RAS related dmesg print

Joshua Aberback (1):
      drm/amd/display: Acknowledge wm_optimized_required

Likun Gao (1):
      drm/amdgpu: change SH MEM alignment mode for gfx10

Michael Strauss (1):
      drm/amd/display: Check for null fclk voltage when parsing clock table

Nicholas Kazlauskas (5):
      drm/amd/display: Translate cursor position by source rect
      drm/amd/display: Fix incorrect cursor pos on scaled primary plane
      drm/amd/display: Program viewport when source pos changes for DCN20 hw seq
      drm/amd/display: Calculate scaling ratios on every medium/full update
      drm/amd/display: Make cursor source translation adjustment optional

Prike Liang (2):
      drm/amd/powerplay: implement the is_dpm_running()
      drm/amdgpu: fix gfx hang during suspend with video playback (v2)

Shirish S (1):
      drm/amd/display: re-order asic declarations

Tiecheng Zhou (1):
      drm/amd/powerplay: avoid using pm_en before it is initialized

Yuxian Dai (1):
      drm/amdgpu/powerplay: using the FCLK DPM table to set the MCLK

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  5 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c             |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  6 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            | 20 ++++++---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             | 25 +++++++-----
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c              |  6 ++-
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            | 13 +++---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 17 ++++----
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  8 ++++
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |  2 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 20 +++++++--
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |  2 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    | 17 ++++++++
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  | 40 +++++++++++++++++-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |  2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  1 +
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |  6 ++-
 drivers/gpu/drm/amd/powerplay/amd_powerplay.c      |  3 +-
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c       | 47 +++++++++++++++++++++-
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c         | 18 +++++++++
 drivers/gpu/drm/amd/powerplay/renoir_ppt.h         |  2 +-
 22 files changed, 217 insertions(+), 48 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
