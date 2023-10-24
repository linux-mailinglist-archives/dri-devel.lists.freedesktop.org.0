Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9A07D5BE8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 21:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA6F10E4B4;
	Tue, 24 Oct 2023 19:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C78710E4B2;
 Tue, 24 Oct 2023 19:54:18 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1dd8304b980so3375873fac.2; 
 Tue, 24 Oct 2023 12:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698177258; x=1698782058; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6wC3N7fE+z/heUzrdzEf7DIoXaNwUEcXmaCtuhhQX70=;
 b=lWCYzmkEQ/kWEMOVM/EVUcG9+M0EfPLhXJUgLA3dK5Dsacpa1t/k4E0DvS6KyNBoQM
 qE6t0ywY119Iwe+0DVbPQlkRdDiCCLBU6Y5M08Yh2BFLRVln8L+RqoZR4NDVSjO7py9e
 Rw2/vWbbM3FUX+ga/friCVeF3ZCHq2lLVlxfwbLc25ajYHsQrRSOFibyc5qpOEpoTHJD
 5YtZXj+K3FhR2YoVdvbqXtK3L9Nx7Lc8Hj4JqQLNAb8kdD597S5KtSPvqkJz4QW4hO/N
 7Smp12ll2K4Ljo82exxEWYIDpbYY8lE/1b8SIFYVywd2/iZ+hWbEt8ryZt4+vj/vax1T
 i3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698177258; x=1698782058;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6wC3N7fE+z/heUzrdzEf7DIoXaNwUEcXmaCtuhhQX70=;
 b=T7TD/3j3EQIw0xBtNHuxp15eh0tC8ramBdj79Bk4AV3kdCaM1RNS+2OjyNZIx2g8rr
 Kz0uqjE6rdglKiJUPv5gV5QkMihC3ARUAlUemiKpJcpuguiw19QPsG6H/JYpaazbjbKS
 BO6b8IMJgKTgl6xVMPUtYR4SAWRVDfyacCNm320/9pQns07uLRZ3hCJAgzIrcQ6pfff6
 6QRD6XJFnmAqhjjBGgGtwqzVvlBDEHXyy74fsw3qW2yA8n10Z6K118F382PZmDVcstw7
 UCwQsX4KYKC5tuCNm8t6f+FYX9wyh1ZFGZGpiEfmfK2woWbDjox2dPee8ti4ncGPXthp
 Zi6Q==
X-Gm-Message-State: AOJu0YzepdtD0UIf5bBEe2aOMMfLu4IXSwr4EKpLbF7jg+xyDyplz4w+
 q443QMsElukZR9Sk/WSXEjdj3crDecxjPXQsiur17Egu
X-Google-Smtp-Source: AGHT+IEB9u6BrX0cgrIFjvBqxXu+6AKKdOL0/aZn0U925IMgaMsTTKU4tmvsAwoFvbZ/viTxaCPip7ECluU2N730H5A=
X-Received: by 2002:a05:6870:3287:b0:1bf:e1e9:a320 with SMTP id
 q7-20020a056870328700b001bfe1e9a320mr16688707oac.13.1698177257707; Tue, 24
 Oct 2023 12:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231020195043.4937-1-alexander.deucher@amd.com>
In-Reply-To: <20231020195043.4937-1-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Oct 2023 15:54:06 -0400
Message-ID: <CADnq5_P9BRH9K2azs0Lyc-a82zZ5t-qxZ9JX4Mf319KHmsEtAQ@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd drm-next-6.7
To: Alex Deucher <alexander.deucher@amd.com>
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 20, 2023 at 3:51=E2=80=AFPM Alex Deucher <alexander.deucher@amd=
.com> wrote:
>
> Hi Dave, Sima,
>
> More updates for 6.7.  Mostly bug fixes.
>
> The following changes since commit 27442758e9b4e083bef3f164a1739475c01f32=
02:
>
>   Merge tag 'amd-drm-next-6.7-2023-10-13' of https://gitlab.freedesktop.o=
rg/agd5f/linux into drm-next (2023-10-18 16:08:07 +1000)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.7-20=
23-10-20
>
> for you to fetch changes up to 5b2c54e0d0ea09f7a3b500510731878326e1117e:
>
>   drm/amd/display: Fix stack size issue on DML2 (2023-10-20 15:11:29 -040=
0)

This was lost during the gitlab migration, but I've pushed everything
up again so it should be valid again now.

Alex

>
> ----------------------------------------------------------------
> amd-drm-next-6.7-2023-10-20:
>
> amdgpu:
> - SMU 13 updates
> - UMSCH updates
> - DC MPO fixes
> - RAS updates
> - MES 11 fixes
> - Fix possible memory leaks in error pathes
> - GC 11.5 fixes
> - Kernel doc updates
> - PSP updates
> - APU IMU fixes
> - Misc code cleanups
> - SMU 11 fixes
> - OD fix
> - Frame size warning fixes
> - SR-IOV fixes
> - NBIO 7.11 updates
> - NBIO 7.7 updates
> - XGMI fixes
> - devcoredump updates
>
> amdkfd:
> - Misc code cleanups
> - SVM fixes
>
> ----------------------------------------------------------------
> Alex Deucher (3):
>       drm/amdgpu/pm: update SMU 13.0.0 PMFW version check
>       drm/amdgpu/mes11: remove aggregated doorbell code
>       drm/amdgpu: update to the latest GC 11.5 headers
>
> Alex Sierra (1):
>       drm/amdkfd: remap unaligned svm ranges that have split
>
> Andr=C3=A9 Almeida (3):
>       drm/amdgpu: Encapsulate all device reset info
>       drm/amdgpu: Move coredump code to amdgpu_reset file
>       drm/amdgpu: Create version number for coredumps
>
> Asad Kamal (2):
>       drm/amdgpu : Add hive ras recovery check
>       drm/amdgpu: update retry times for psp BL wait
>
> Bas Nieuwenhuizen (1):
>       drm/amd/pm: Handle non-terminated overdrive commands.
>
> Bokun Zhang (4):
>       drm/amd/amdgpu/vcn: Add RB decouple feature under SRIOV - P1
>       drm/amd/amdgpu/vcn: Add RB decouple feature under SRIOV - P2
>       drm/amd/amdgpu/vcn: Add RB decouple feature under SRIOV - P3
>       drm/amd/amdgpu/vcn: Add RB decouple feature under SRIOV - P4
>
> Candice Li (1):
>       drm/amdgpu: Log UE corrected by replay as correctable error
>
> Colin Ian King (1):
>       drm/amd/display: Fix a handful of spelling mistakes in dml_print ou=
tput
>
> Felix Kuehling (2):
>       drm/amdgpu: Fix possible null pointer dereference
>       drm/amdgpu: Reserve fences for VM update
>
> Hawking Zhang (2):
>       drm/amdgpu: Enable software RAS in vcn v4_0_3
>       drm/amdgpu: Add UVD_VCPU_INT_EN2 to dpg sram
>
> Jesse Zhang (1):
>       drm/amdkfd:remove unused code
>
> Jiapeng Chong (2):
>       drm/amdkfd: clean up some inconsistent indenting
>       drm/amd/display: clean up some inconsistent indenting
>
> Kunwu.Chan (1):
>       drm/amd/pm: Fix a memory leak on an error path
>
> Lang Yu (1):
>       drm/amdgpu/umsch: add suspend and resume callback
>
> Li Ma (2):
>       drm/amdgpu: fix missing stuff in NBIO v7.11
>       drm/amdgpu: add clockgating support for NBIO v7.7.1
>
> Ma Jun (1):
>       drm/amd/pm: Support for getting power1_cap_min value
>
> Mangesh Gadre (1):
>       Revert "drm/amdgpu: Program xcp_ctl registers as needed"
>
> Mario Limonciello (4):
>       drm/amd: Add missing kernel doc for prepare_suspend()
>       drm/amd: Move microcode init step to early_init()
>       drm/amd: Don't parse IMU ucode version if it won't be loaded
>       drm/amd: Read IMU FW version from scratch register during hw_init
>
> Nathan Chancellor (1):
>       drm/amd/display: Respect CONFIG_FRAME_WARN=3D0 in DML2
>
> Rodrigo Siqueira (2):
>       drm/amd/display: Reduce stack size by splitting function
>       drm/amd/display: Fix stack size issue on DML2
>
> Shiwu Zhang (3):
>       drm/amdgpu: update the xgmi ta interface header
>       drm/amdgpu: prepare the output buffer for GET_PEER_LINKS command
>       drm/amdgpu: support the port num info based on the capability flag
>
> Stanley.Yang (4):
>       drm/amdgpu: Workaround to skip kiq ring test during ras gpu recover=
y
>       drm/amdgpu: Enable mca debug mode mode when ras enabled
>       drm/amdgpu: Fix delete nodes that have been relesed
>       drm/amdgpu: Enable RAS feature by default for APU
>
> Stylon Wang (2):
>       drm/amd/display: Add missing lines of code in dc.c
>       drm/amd/display: Remove brackets in macro to conform to coding styl=
e
>
> Tao Zhou (4):
>       drm/amdgpu: define ras_reset_error_count function
>       drm/amdgpu: replace reset_error_count with amdgpu_ras_reset_error_c=
ount
>       drm/amdgpu: add set/get mca debug mode operations
>       drm/amdgpu: drop status query/reset for GCEA 9.4.3 and MMEA 1.8
>
> Yang Li (4):
>       drm/amd/display: clean up some inconsistent indentings
>       drm/amd/display: Remove duplicated include in dce110_hwseq.c
>       drm/amd/display: Remove unneeded semicolon
>       drm/amd/display: Simplify bool conversion
>
> Yang Wang (1):
>       drm/amdgpu: fix typo for amdgpu ras error data print
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   25 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   10 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   96 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |    5 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   21 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   49 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |    1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   75 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |    7 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |   80 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |   14 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c       |   16 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   48 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |    4 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |    4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |    1 +
>  drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |    5 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  106 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   83 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |    9 +-
>  drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |    4 +-
>  drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   56 -
>  drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |  143 -
>  drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c            |   78 +
>  drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |    2 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |    7 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |    7 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |   83 +-
>  drivers/gpu/drm/amd/amdgpu/soc21.c                 |    2 +
>  drivers/gpu/drm/amd/amdgpu/ta_xgmi_if.h            |   62 +-
>  drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |    7 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   71 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |    5 +
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  103 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |    3 -
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    2 +-
>  drivers/gpu/drm/amd/display/dc/core/dc.c           |    5 +-
>  .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |  154 +-
>  .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |  144 +-
>  drivers/gpu/drm/amd/display/dc/dml2/Makefile       |    2 +-
>  .../drm/amd/display/dc/dml2/display_mode_core.c    | 3297 ++++++++++----=
------
>  .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |    2 +-
>  .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |    2 -
>  drivers/gpu/drm/amd/include/amd_shared.h           |    2 +
>  .../amd/include/asic_reg/gc/gc_11_5_0_sh_mask.h    |   48 +
>  .../amd/include/asic_reg/nbio/nbio_7_11_0_offset.h |    6 +
>  .../include/asic_reg/nbio/nbio_7_11_0_sh_mask.h    |   13 +-
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   22 +-
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   17 +-
>  drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |    8 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   33 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   33 +-
>  .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   34 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |    5 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   13 +-
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   36 +-
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   25 +-
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   34 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |    2 +-
>  60 files changed, 2613 insertions(+), 2621 deletions(-)
