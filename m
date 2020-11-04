Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EB82A6F49
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 21:58:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC516E832;
	Wed,  4 Nov 2020 20:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36CC6E4EA;
 Wed,  4 Nov 2020 20:58:09 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id k1so20532543ilc.10;
 Wed, 04 Nov 2020 12:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2mQ0+39xJoUtJ2IyP38ffqk9w6BYGnAk8szztrcGC94=;
 b=fFNedZuG3rvpKUAJOzH8VlRxZbOeaeO9jL1DgNDRynPvsiUuPh278JAeRYFpVAfSXm
 OP6dfdcd5/Ad7O/4FXWyzgJns9q9/4hN+z3q9IiyYH1QPi2Wttj/yVO3NsnLvpsOJ2/n
 TLW9fq7FSl4+bkUF6PfufsS+6ZFj5nIVopSVWq2jOxsXX56vwj1EINbNyvO/R4YMULbI
 oJT0LsMHUzqBXQwkfDuoQrEO5eKLxKcZq/ZsI9m0yczhIK0HgBk2NktT6uixwyVovrv+
 dXkTEZ003MWY30i1uY0k5hJ57NlszayorZAa3jwOS90PdRuCGSkpmjHI0ZO5D0ROXFzJ
 OPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2mQ0+39xJoUtJ2IyP38ffqk9w6BYGnAk8szztrcGC94=;
 b=CpzEuQFZEHJJf0SOmCZtPv4KYs0aARj13/7eg9Za78ASU9QjBcvQbEy1HUD2nSBDxn
 rux0aX0QQGcFQHvmUiY9yNT2PbtBov5J+9whkRyYvzYqBdbL7cNIeNJ4HuLvAIaVDXs5
 DreBysLZMlfzaz5sVIDCvT3EPllDWv9M81mHLpsLwtyYrimzxi1W0LWn5ARcr9c//cwq
 DCqoGBqk9KxCrGLMq2+o2bzHcPwTd+yRixg3famTqitmzdRb07XtfuUZVC7jobPek0ai
 z5FuQVy8CMPrGKS7DUKjJmPbkfZsvrWyEtyyyrrC2vnXkMsjBI8ckHdTol4L8VPeFSLW
 kmng==
X-Gm-Message-State: AOAM531Zcb2eRGLO6tBkPFN4pk7gK3fsyJb576G58QBFRd5bTBOPkIGj
 xUu6getIObMEXBEmBj4qIRTpmCBdK8A=
X-Google-Smtp-Source: ABdhPJwWR2SMsPrMii/bWZL/LKquzCsUTqnMTkizxTOK4Dia9T3CbQej92xfAI8njHNXQeiHr13Uzw==
X-Received: by 2002:a92:3312:: with SMTP id a18mr14558060ilf.165.1604523489003; 
 Wed, 04 Nov 2020 12:58:09 -0800 (PST)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id n4sm1693132iox.6.2020.11.04.12.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 12:58:08 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd drm-fixes-5.10
Date: Wed,  4 Nov 2020 15:57:41 -0500
Message-Id: <20201104205741.4100-1-alexander.deucher@amd.com>
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

Fixes for 5.10.  The support for green sardine is not exactly a fix, but the
changes are a minimal delta relative to renoir and should not affect any
other asics.

The following changes since commit 7babd126327b8b5a3904d2f8f01c95235801af2a:

  Merge tag 'drm-intel-fixes-2020-10-29' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2020-10-30 11:54:11 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.10-2020-11-04

for you to fetch changes up to 4241b0411c60a97f87a25ff4da92dac53beb3039:

  drm/amdgpu/display: remove DRM_AMD_DC_GREEN_SARDINE (2020-11-04 08:43:50 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.10-2020-11-04:

amdgpu:
- Add support for more navi1x SKUs
- Fix for suspend on CI dGPUs
- VCN DPG fix for Picasso
- Sienna Cichlid fixes
- Polaris DPM fix
- Add support for Green Sardine

amdkfd:
- Fix an allocation failure check

MAINTAINERS:
- Fix path for amdgpu power management

----------------------------------------------------------------
Aaron Liu (1):
      drm/amdgpu: enable green_sardine_asd.bin loading (v2)

Alex Deucher (4):
      drm/amdgpu/powerplay: Only apply optimized mclk dpm policy on polaris
      drm/amdgpu/swsmu: remove duplicate call to smu_set_default_dpm_table
      drm/amdgpu: add Green_Sardine APU flag
      drm/amdgpu/display: remove DRM_AMD_DC_GREEN_SARDINE

Evan Quan (5):
      drm/amdgpu: perform srbm soft reset always on SDMA resume
      drm/amd/pm: correct the baco reset sequence for CI ASICs
      drm/amd/pm: enable baco reset for Hawaii
      drm/amd/pm: perform SMC reset on suspend/hibernation
      drm/amd/pm: do not use ixFEATURE_STATUS for checking smc running

Flora Cui (2):
      drm/amdgpu: disable DCN and VCN for Navi14 0x7340/C9 SKU
      drm/amdgpu: rename nv_is_headless_sku()

Joe Perches (1):
      MAINTAINERS: Update AMD POWERPLAY pattern

John Clements (1):
      drm/amdgpu: resolved ASD loading issue on sienna

Kent Russell (1):
      amdkfd: Check kvmalloc return before memcpy

Likun Gao (1):
      drm/amdgpu: update golden setting for sienna_cichlid

Prike Liang (4):
      drm/amdgpu: add green_sardine support for gpu_info and ip block setting (v2)
      drm/amdgpu: add soc15 common ip block support for green_sardine (v3)
      drm/amdgpu: add gfx support for green_sardine (v2)
      drm/amdgpu/sdma: add sdma engine support for green_sardine (v2)

Roman Li (2):
      drm/amd/display: Add green_sardine support to DC
      drm/amd/display: Add green_sardine support to DM

Thong Thai (1):
      drm/amdgpu: enable vcn support for green_sardine (v2)

Veerabadhran Gopalakrishnan (1):
      amd/amdgpu: Disable VCN DPG mode for Picasso

 MAINTAINERS                                        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  6 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  8 ++++-
 drivers/gpu/drm/amd/amdgpu/cik.c                   |  4 ++-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              | 27 ++++++++---------
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  4 +++
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              | 12 +++++++-
 drivers/gpu/drm/amd/amdgpu/nv.c                    | 11 +++----
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             |  6 +++-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |  6 +++-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 | 14 ++++++---
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  6 ++++
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |  5 ++++
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  2 ++
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |  4 +++
 drivers/gpu/drm/amd/include/amd_shared.h           |  1 +
 drivers/gpu/drm/amd/pm/inc/hwmgr.h                 |  1 +
 drivers/gpu/drm/amd/pm/inc/smumgr.h                |  2 ++
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/ci_baco.c   |  7 +++--
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    | 34 ++++++++++++++--------
 .../gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c    | 29 +++++++++++++++---
 drivers/gpu/drm/amd/pm/powerplay/smumgr/smumgr.c   |  8 +++++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 11 -------
 25 files changed, 151 insertions(+), 62 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
