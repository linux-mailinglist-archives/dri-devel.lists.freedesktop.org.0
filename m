Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BBE4F19F1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 21:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D5010E486;
	Mon,  4 Apr 2022 19:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647C810E22B;
 Mon,  4 Apr 2022 19:39:45 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-d6ca46da48so11923302fac.12; 
 Mon, 04 Apr 2022 12:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zkVEbfkxX05xCwUZXO/SQQzd2kJ7hNn32HXYsFWqSEI=;
 b=oyv5uVj+S1FsJjrhnv+aIzBK4dqk9IDVtRlLhEuSbDR4jpzj6yvfT6ijBQorSJHAVT
 crGWZdHGGeU7psFbqu9hdoTbnGtesEEqU3M15jR3FMAFdB4gRnliEKkrxFr/OO7kcTQ+
 wqzG1SN8/9TGW6RDIrGBJDzKUtRHHPeTX0PZ8sKwfc5eZmj1QOwB566Z7sqXYLbwSP13
 p2HAxnVe8Uk8kEkWDoigeataoI9tehMsu3fcqY5+BOZfRxoD+T8wGkEGO+qt0PKpmqAP
 zngNsZmsPPlO5UkH0zJOpKa8E32xoojudyRWtVIi4b8su8xRcUR2PIYs0frSHIRE0oO3
 53+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zkVEbfkxX05xCwUZXO/SQQzd2kJ7hNn32HXYsFWqSEI=;
 b=LIkhqOoPyjY4KcILGZiiNXX5RHr1mQDBSyZzNnzry7vm2CaXPHELU4NSsOZDdd2fU/
 LJOthT6/CQQGzNS92RTcH8csOWj07swCOJTFyEGQ1zgfuah4YMFTm8BEoRJBn+tukaf/
 0OzBIbBWF4BPacvFblvseNn4gxT5J5doaqPPEH9J0AzXi78Q8mO2CxNcojJgvQIm5GNs
 wyXkKIDXldajWWGkyJmGB6Qab4MabMpQ6L4VkaRhTuAW1Rz37f9d/v2ZAecuHEsFZtpM
 giVNZ0qdPt41SXmg9bIpJOoMplqWDHpMo0ppLAhSSX67XHVURIgEB+7yAbHvsCWLwbXR
 HX1w==
X-Gm-Message-State: AOAM532gNZHSKcjJR+LEDXgMrmgxI3CMEu6ZkHoWckYyEqflBny0snIe
 P4yQRhKegcp2jWjKSMMDMATtKOUKnAH9w0774m0=
X-Google-Smtp-Source: ABdhPJwfewx3SGpZEwPEn5/EelIjTEF0hbR3Fxu6Q1AziiyUqglWVol3ejAh+FQziWS6cEMJevGQ0kFN9UBS3dBSDRo=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr421149oaa.200.1649101184614; Mon, 04
 Apr 2022 12:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220325183602.5718-1-alexander.deucher@amd.com>
In-Reply-To: <20220325183602.5718-1-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 4 Apr 2022 15:39:33 -0400
Message-ID: <CADnq5_Ptix0oQavCE_Qs=oc8oPyjBBaG56=mM-Q9SXLf9yUvKg@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd drm-next-5.18
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 25, 2022 at 2:36 PM Alex Deucher <alexander.deucher@amd.com> wrote:
>
> Hi Dave, Daniel,
>
> Fixes for 5.18.

Just wanted to make sure this didn't get missed.  This fixes some
warning splat reported by Linus, et al.

Alex

>
> The following changes since commit c6e90a1c660874736bd09c1fec6312b4b4c2ff7b:
>
>   Merge tag 'amd-drm-next-5.18-2022-03-18' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-03-21 13:48:20 +1000)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.18-2022-03-25
>
> for you to fetch changes up to 15f9cd4334c83716fa32647652a609e3ba6c998d:
>
>   drm/amdgpu/gfx10: enable gfx1037 clock counter retrieval function (2022-03-25 12:40:25 -0400)
>
> ----------------------------------------------------------------
> amd-drm-next-5.18-2022-03-25:
>
> amdgpu:
> - GFX 10.3.7 fixes
> - noretry updates
> - VCN fixes
> - TMDS fix
> - zstate fix for freesync video
> - DCN 3.1.5 fix
> - Display stack size fix
> - Audio fix
> - DCN 3.1 pstate fix
> - TMZ VCN fix
> - APU passthrough fix
> - Misc other fixes
>
> amdkfd:
> - Error handling fix
> - xgmi p2p fix
> - HWS VMIDs fix
>
> ----------------------------------------------------------------
> Alex Deucher (2):
>       drm/amdgpu/gmc: use PCI BARs for APUs in passthrough
>       drm/amdgpu: add more cases to noretry=1
>
> Aurabindo Pillai (1):
>       drm/amd: Add USBC connector ID
>
> Charlene Liu (2):
>       drm/amd/display: fix audio format not updated after edid updated
>       drm/amd/display: remove destructive verify link for TMDS
>
> Chiawen Huang (1):
>       drm/amd/display: FEC check in timing validation
>
> Dan Carpenter (1):
>       drm/amdgpu: fix off by one in amdgpu_gfx_kiq_acquire()
>
> Divya Shikre (1):
>       drm/amdkfd: Check use_xgmi_p2p before reporting hive_id
>
> Emily Deng (1):
>       drm/amdgpu/vcn: Fix the register setting for vcn1
>
> Felix Kuehling (1):
>       drm/amdgpu: set noretry=1 for GFX 10.3.4
>
> Gabe Teeger (1):
>       drm/amd/display: Add support for zstate during extended vblank
>
> Guchun Chen (2):
>       drm/amdgpu: prevent memory wipe in suspend/shutdown stage
>       drm/amdgpu: conduct a proper cleanup of PDB bo
>
> Lang Yu (1):
>       drm/amdgpu: add workarounds for VCN TMZ issue on CHIP_RAVEN
>
> Leo (Hanghong) Ma (1):
>       drm/amd/display: Update VTEM Infopacket definition
>
> Nicholas Kazlauskas (1):
>       drm/amd/display: Fix p-state allow debug index on dcn31
>
> Oliver Logush (1):
>       drm/amd/display: Add fSMC_MSG_SetDtbClk support
>
> Prike Liang (2):
>       drm/amdgpu: set noretry for gfx 10.3.7
>       drm/amdgpu/gfx10: enable gfx1037 clock counter retrieval function
>
> QintaoShen (1):
>       drm/amdkfd: Check for potential null return of kmalloc_array()
>
> Rodrigo Siqueira (1):
>       drm/amd/display: Reduce stack size
>
> Stanley.Yang (1):
>       drm/amdgpu/pm: add asic smu support check
>
> Tianci Yin (1):
>       drm/amdgpu/vcn: improve vcn dpg stop procedure
>
> Tushar Patel (1):
>       drm/amdkfd: Fix Incorrect VMIDs passed to HWS
>
> Yifan Zhang (2):
>       drm/amdgpu/pm: fix the Stable pstate Test in amdgpu_test
>       drm/amdgpu: set noretry=1 for gc 10.3.6
>
>  drivers/gpu/drm/amd/amdgpu/ObjectID.h              |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  6 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  4 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  1 +
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |  2 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |  5 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |  2 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  4 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              | 71 ++++++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  7 ++-
>  drivers/gpu/drm/amd/amdkfd/kfd_device.c            | 14 ++---
>  drivers/gpu/drm/amd/amdkfd/kfd_events.c            |  2 +
>  .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c | 19 ++++--
>  .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.h |  4 +-
>  drivers/gpu/drm/amd/display/dc/core/dc.c           | 23 +++++++
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  3 +-
>  drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  4 +-
>  drivers/gpu/drm/amd/display/dc/dc.h                |  6 +-
>  drivers/gpu/drm/amd/display/dc/dc_stream.h         |  2 +
>  .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  8 ++-
>  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c | 12 ++++
>  .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    |  2 +
>  drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.c  |  8 +++
>  .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |  1 +
>  .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   | 18 +++++-
>  .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  | 13 ++++
>  .../drm/amd/display/dc/dml/display_mode_structs.h  |  2 +
>  drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |  3 +
>  .../amd/display/modules/info_packet/info_packet.c  |  5 +-
>  drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  6 ++
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |  2 +-
>  34 files changed, 229 insertions(+), 39 deletions(-)
