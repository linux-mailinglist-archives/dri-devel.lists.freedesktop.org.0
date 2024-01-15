Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 537AA82D2B9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 01:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D248210E1F3;
	Mon, 15 Jan 2024 00:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E9910E1F0;
 Mon, 15 Jan 2024 00:26:06 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50e741123acso9752126e87.0; 
 Sun, 14 Jan 2024 16:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705278364; x=1705883164; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yNxJdjyhdCBIt1E788AjMRHwMSbpz3yN/bZm+PJ04gE=;
 b=P93zXdSgBlhdcUZwN6A92INzkSgv6zhK6Mtc4McZXv0jniKFPG1K1Q/DddqnWIYkWK
 /htt2chbjsnhs/CzWkRkm9RSJq6tog5mnSFvFLK7BMolAPWV4Bf/9MGgVNs0pLJsIU8C
 uJuPjtycC1hXXeKcNpPHC/aPrV8lDjAYYGRhjwUeCAWntGj7ksEDUWBg49+GO/zsoaXm
 BE1Ami2OH710aHMoJMWvQIArfrjGFa/oP7VXKBcSbcJXHYlm5P/kyg9qByqn19lRJISy
 1v4nPj2pRehwV2cgd4wodFD0DmJZWs5MsFPbyy9h+ucuAO+kV+B+f4wDRDIYymXHwPoj
 Po+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705278364; x=1705883164;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yNxJdjyhdCBIt1E788AjMRHwMSbpz3yN/bZm+PJ04gE=;
 b=cFHnSl51BrUKvpA3FErcznS5h8jNbwbCF1V/8BMc0jt6FJjFKH9QCh65o1eT0gmvCY
 eHHTANKz6DpWs722EmUyijGW2jiN/V80zojee7mzEXElfGUC9WpbTrbFeXCfnevcADHJ
 hET38QmdpONHmQcEmXZwU8WPVnHLdNbXXl3lc7IVt9r0yv5FpqJewWyfV50dpg4hF8Hv
 sPEueMMJPZ5Qs2Kc96TLBJrWTjcUh3ypmrKZQJyHbXMn7N3UrohTVvByYgi6vKiYo/F9
 U3ZR5oruE3gfjdnH4VER5Q+XKxW1RRpd3hoLjocI98zBcYw6K9++SVi+sQu5nu0nyUmk
 WHlQ==
X-Gm-Message-State: AOJu0Yz3UYPBOITsw5Xeky9G6UhWew/W/JwqZ0+9DR5zAIc2OFXAv004
 vO3BlMLpOn2/ThkUvaT3V16MK8Sg6PBB/vhUKCs=
X-Google-Smtp-Source: AGHT+IFybmW6ay5HJKhPz5v4xd10MKEJA5DJM/YJqotSUEerS+WrQARLhAJIMw5ScGDHshKfIhvZk2l+8O5SqVf6x5M=
X-Received: by 2002:a05:6512:102a:b0:50e:7b9e:3599 with SMTP id
 r10-20020a056512102a00b0050e7b9e3599mr1724988lfr.46.1705278364157; Sun, 14
 Jan 2024 16:26:04 -0800 (PST)
MIME-Version: 1.0
References: <20240112175656.4799-1-alexander.deucher@amd.com>
In-Reply-To: <20240112175656.4799-1-alexander.deucher@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 15 Jan 2024 10:25:52 +1000
Message-ID: <CAPM=9tzvO2iyiRi3J8notU3LL9LXK_3xfHMofuXsYXmqO=DeYw@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd drm-fixes-6.8
To: Alex Deucher <alexander.deucher@amd.com>
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_dpia_bw.c:548:24:
error: arithmetic between different enumeration types ('const enum
dc_link_rate' and 'const enum dc_lane_count')
[-Werror,-Wenum-enum-conversion]
                        link_cap->link_rate * link_cap->lane_count *
LINK_RATE_REF_FREQ_IN_KHZ * 8;
                        ~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~
1 error generated.

clang said no.

Dave.

On Sat, 13 Jan 2024 at 03:57, Alex Deucher <alexander.deucher@amd.com> wrote:
>
> Hi Dave, Sima,
>
> Fixes for 6.8.
>
> The following changes since commit e54478fbdad20f2c58d0a4f99d01299ed8e7fe9c:
>
>   Merge tag 'amd-drm-next-6.8-2024-01-05' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2024-01-09 09:07:50 +1000)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.8-2024-01-12
>
> for you to fetch changes up to 3b23fd46e2af68b47902caa3f88d60f73c5d85f7:
>
>   drm/amd/pm: Fix smuv13.0.6 current clock reporting (2024-01-11 23:33:37 -0500)
>
> ----------------------------------------------------------------
> amd-drm-fixes-6.8-2024-01-12:
>
> amdgpu:
> - SubVP fixes
> - VRR fixes
> - USB4 fixes
> - DCN 3.5 fixes
> - GFX11 harvesting fix
> - RAS fixes
> - Misc small fixes
> - KFD dma-buf import fixes
> - Power reporting fixes
> - ATHUB 3.3 fix
> - SR-IOV fix
> - Add missing fw release for fiji
> - GFX 11.5 fix
> - Debugging module parameter fix
> - SMU 13.0.6 fixes
>
> amdkfd:
> - Fix lockdep warnings
> - Fix sparse __rcu warnings
> - Bump interface version so userspace knows that the kernel supports dma-bufs exported from KFD
>   Most of the fixes for this went into 6.7, but the last fix is in this PR
> - HMM fix
> - SVM fix
>
> ----------------------------------------------------------------
> Alex Deucher (4):
>       drm/amdgpu: fix avg vs input power reporting on smu7
>       drm/amdgpu: fall back to INPUT power for AVG power via INFO IOCTL
>       drm/amdgpu/pm: clarify debugfs pm output
>       drm/amdgpu: drop exp hw support check for GC 9.4.3
>
> Aric Cyr (1):
>       drm/amd/display: 3.2.266
>
> Candice Li (2):
>       drm/amdgpu: Drop unnecessary sentences about CE and deferred error.
>       drm/amdgpu: Support poison error injection via ras_ctrl debugfs
>
> Charlene Liu (1):
>       drm/amd/display: Update z8 latency
>
> Dafna Hirschfeld (1):
>       drm/amdkfd: fixes for HMM mem allocation
>
> Daniel Miess (1):
>       Revert "drm/amd/display: Fix conversions between bytes and KB"
>
> Felix Kuehling (4):
>       drm/amdkfd: Fix lock dependency warning
>       drm/amdkfd: Fix sparse __rcu annotation warnings
>       drm/amdgpu: Auto-validate DMABuf imports in compute VMs
>       drm/amdkfd: Bump KFD ioctl version
>
> George Shen (1):
>       drm/amd/display: Disconnect phantom pipe OPP from OPTC being disabled
>
> Hawking Zhang (1):
>       drm/amdgpu: Packed socket_id to ras feature mask
>
> Ivan Lipski (1):
>       Revert "drm/amd/display: fix bandwidth validation failure on DCN 2.1"
>
> James Zhu (1):
>       drm/amdgpu: make a correction on comment
>
> Le Ma (3):
>       Revert "drm/amdgpu: add param to specify fw bo location for front-door loading"
>       drm/amdgpu: add debug flag to place fw bo on vram for frontdoor loading
>       drm/amdgpu: move debug options init prior to amdgpu device init
>
> Lijo Lazar (2):
>       drm/amd/pm: Add error log for smu v13.0.6 reset
>       drm/amd/pm: Fix smuv13.0.6 current clock reporting
>
> Likun Gao (1):
>       drm/amdgpu: correct the cu count for gfx v11
>
> Martin Leung (2):
>       drm/amd/display: revert "for FPO & SubVP/DRR config program vmin/max"
>       drm/amd/display: revert "Optimize VRR updates to only necessary ones"
>
> Martin Tsai (1):
>       drm/amd/display: To adjust dprefclk by down spread percentage
>
> Meenakshikumar Somasundaram (1):
>       drm/amd/display: Dpia hpd status not in sync after S4
>
> Melissa Wen (1):
>       drm/amd/display: cleanup inconsistent indenting in amdgpu_dm_color
>
> Peichen Huang (1):
>       drm/amd/display: Request usb4 bw for mst streams
>
> Philip Yang (1):
>       drm/amdkfd: Fix lock dependency warning with srcu
>
> Srinivasan Shanmugam (6):
>       drm/amd/powerplay: Fix kzalloc parameter 'ATOM_Tonga_PPM_Table' in 'get_platform_power_management_table()'
>       drm/amdgpu: Fix with right return code '-EIO' in 'amdgpu_gmc_vram_checking()'
>       drm/amdgpu: Fix unsigned comparison with less than zero in vpe_u1_8_from_fraction()
>       drm/amdgpu: Release 'adev->pm.fw' before return in 'amdgpu_device_need_post()'
>       drm/amd/display: Fix variable deferencing before NULL check in edp_setup_replay()
>       drm/amdkfd: Fix 'node' NULL check in 'svm_range_get_range_boundaries()'
>
> Victor Lu (1):
>       drm/amdgpu: Do not program VM_L2_CNTL under SRIOV
>
> Yifan Zhang (3):
>       drm/amdgpu: update headers for nbio v7.11
>       drm/amdgpu: update ATHUB_MISC_CNTL offset for athub v3.3
>       drm/amdgpu: update regGL2C_CTRL4 value in golden setting
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         | 12 +++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   | 43 +++++++------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  2 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |  4 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 15 ++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            | 29 ++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            | 21 ++++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  7 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            | 26 ++++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             | 67 +++++++++++++++++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             | 14 +++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            | 10 +--
>  drivers/gpu/drm/amd/amdgpu/athub_v3_0.c            |  8 +++
>  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  5 +-
>  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           | 10 +--
>  drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |  3 +-
>  drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |  3 +-
>  drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |  2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |  6 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |  2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  7 ++-
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c               | 52 ++++++++--------
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |  2 +-
>  .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c | 71 +++++++++++++++++++++-
>  .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.h | 11 ++++
>  drivers/gpu/drm/amd/display/dc/core/dc.c           | 14 +++--
>  drivers/gpu/drm/amd/display/dc/core/dc_resource.c  | 14 -----
>  drivers/gpu/drm/amd/display/dc/dc.h                |  3 +-
>  drivers/gpu/drm/amd/display/dc/dc_stream.h         |  2 +
>  drivers/gpu/drm/amd/display/dc/dc_types.h          | 12 ++--
>  drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |  2 +-
>  .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |  9 ++-
>  .../amd/display/dc/dcn32/dcn32_resource_helpers.c  | 14 +++++
>  .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   | 11 ++--
>  .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |  6 +-
>  .../drm/amd/display/dc/dml2/display_mode_core.c    | 18 +++---
>  .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  2 +-
>  .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |  2 +-
>  .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    | 45 ++------------
>  drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |  1 +
>  drivers/gpu/drm/amd/display/dc/inc/resource.h      |  3 -
>  drivers/gpu/drm/amd/display/dc/link/link_dpms.c    | 42 ++++++++++---
>  .../gpu/drm/amd/display/dc/link/link_validation.c  | 60 ++++++++++++++----
>  .../amd/display/dc/link/protocols/link_dp_dpia.c   | 36 ++++++-----
>  .../display/dc/link/protocols/link_dp_dpia_bw.c    | 59 +++++++++++++-----
>  .../display/dc/link/protocols/link_dp_dpia_bw.h    |  9 +++
>  .../dc/link/protocols/link_edp_panel_control.c     | 11 ++--
>  .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c | 19 ++++--
>  .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c | 12 ++--
>  .../amd/display/dc/resource/dcn32/dcn32_resource.c |  2 +-
>  .../amd/display/dc/resource/dcn32/dcn32_resource.h |  3 +
>  .../display/dc/resource/dcn321/dcn321_resource.c   |  2 +-
>  drivers/gpu/drm/amd/display/include/audio_types.h  |  2 +-
>  .../amd/include/asic_reg/nbio/nbio_7_11_0_offset.h |  8 +--
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c                 | 28 ++++++---
>  .../amd/pm/powerplay/hwmgr/process_pptables_v1_0.c |  2 +-
>  .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    | 17 +++++-
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   | 15 +++--
>  include/uapi/linux/kfd_ioctl.h                     |  3 +-
>  65 files changed, 634 insertions(+), 302 deletions(-)
