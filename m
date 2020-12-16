Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 732572DC8F1
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 23:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418DF89F5F;
	Wed, 16 Dec 2020 22:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32D589F38
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 22:28:22 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id 190so3802824wmz.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 14:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=B1HJ7nyd2UVejqSEFDTvlrsW52XCOOm+VakflD0oZWo=;
 b=XkRuflIfZcq2PGHU8vG6nq80eMY76yH6aypagFWKO0l64A1fu6fl59HgoVp53Um5xh
 +iPgFEhUzGVnElCxgbaeGYyOzAhtwanfC/vWywvBIuJgE9GSgmPz8ED1XVJ9wckskXg8
 9qVrkM/2vX417+LF1mKpOYZkjyzWcsEm9o86Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=B1HJ7nyd2UVejqSEFDTvlrsW52XCOOm+VakflD0oZWo=;
 b=Vh/sNaYAsA2oxKM6T0h/cmib5o8vFkQtiRquVep+00U3wwBGjIWYGcKhRkjVBOpw/P
 RLXcPvycquyQfq5ECDxUvgW7CbFBrcAosGi9GvgxWnicRd+HzRIgMi/shgCIjsg3nNNu
 ktol5triUvgOh1a7YiVZwgdOsIrdPLeP/3DFUq8U2EOA3gcW7kXJi94J+WvYZAVsTIrr
 v1lS6ii6O7QsZ0kfQXnCCVogkB59kmQKnixvEgtFN0P4GqRX5X47zUFnWRxZS/eM9Gnk
 lTpXfLriP2x/x8xJnChgSqr1SJm1pSsZCugMVknT9aeehmczqG3qCbvKT1nutcv36GrS
 tceg==
X-Gm-Message-State: AOAM530Nmh7PWP6riCOEx4uuJbEN5uU1aso9SN5pdwRMspNYM2/ciHi6
 gH6OWhqkRlOH0qa1dny+zkOCqg==
X-Google-Smtp-Source: ABdhPJyChlqmpW34ms4qALAAbkySvXfY+P1ud4vLGskM6548/4SANR8Ut6Cadts7ibRdeI6zivDoZg==
X-Received: by 2002:a1c:3c09:: with SMTP id j9mr5511621wma.180.1608157701397; 
 Wed, 16 Dec 2020 14:28:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q17sm4971117wrr.53.2020.12.16.14.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 14:28:20 -0800 (PST)
Date: Wed, 16 Dec 2020 23:28:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [pull] amdgpu, amdkfd, radeon drm-fixes-5.11
Message-ID: <X9qKAiJKs6Lp82ht@phenom.ffwll.local>
References: <20201216192421.18627-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216192421.18627-1-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Alex Deucher <alexander.deucher@amd.com>, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 16, 2020 at 02:24:20PM -0500, Alex Deucher wrote:
> Hi Dave, Daniel,
> =

> Fixes for 5.11.
> =

> The following changes since commit b10733527bfd864605c33ab2e9a886eec317ec=
39:
> =

>   Merge tag 'amd-drm-next-5.11-2020-12-09' of git://people.freedesktop.or=
g/~agd5f/linux into drm-next (2020-12-10 16:55:53 +1000)
> =

> are available in the Git repository at:
> =

>   git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.11-2020-=
12-16
> =

> for you to fetch changes up to 6ae09fa49147e557eb6aebbb5b2059b63706d454:
> =

>   drm/amdgpu/disply: fix documentation warnings in display manager (2020-=
12-16 13:27:17 -0500)

There's some fixes line that got mangled in a rebase I guess:

dim: 7eded018bfec ("drm/amdgpu: fix regression in vbios reservation handlin=
g on headless"): Fixes: SHA1 in not pointing at an ancestor:
dim:     157fe68d74c2ad ("drm/amdgpu: fix size calculation with stolen vga =
memory")

Insert some dreaming about automatic gitlab checking of this stuff, but
since we're still in this reality I figured meh and pulled. Expect
imminent nag mail from linux-next.

Thansk, Daniel

> =

> ----------------------------------------------------------------
> amd-drm-fixes-5.11-2020-12-16:
> =

> amdgpu:
> - Fix a eDP regression for DCE asics
> - SMU fixes for sienna cichlid
> - Misc W=3D1 fixes
> - SDMA 5.2 reset fix
> - Suspend/resume fix
> - Misc display fixes
> - Misc runtime PM fixes and cleanups
> - Dimgrey Cavefish fixes
> - printk cleanup
> - Documentation warning fixes
> =

> amdkfd:
> - Error logging fix
> - Fix pipe offset calculation
> =

> radeon:
> - printk cleanup
> =

> ----------------------------------------------------------------
> Alex Deucher (10):
>       drm/amdgpu/display: move link_bandwidth_kbps under CONFIG_DRM_AMD_D=
C_DCN
>       drm/amdgpu: split BOCO and ATPX handling
>       drm/amdgpu: add check for ACPI power resources
>       drm/amdgpu: update amdgpu_device_supports_boco()
>       drm/amdgpu: support runtime pm for GPUs that support BOCO
>       drm/amdgpu: no need to call pci_ignore_hotplug for _PR3
>       drm/amdgpu: simplify logic in atpx resume handling
>       drm/amdgpu: print what method we are using for runtime pm
>       drm/amdgpu: fix regression in vbios reservation handling on headless
>       drm/amdgpu/disply: fix documentation warnings in display manager
> =

> Anthony Koo (1):
>       drm/amd/display: [FW Promotion] Release 0.0.46
> =

> Aric Cyr (4):
>       drm/amd/display: HP Reverb G2 VR fails to light up
>       drm/amd/display: Only update FP2 for full updates
>       drm/amd/display: Fix cleanup typo in MPCC visual confirm
>       drm/amd/display: 3.2.116
> =

> Christian K=F6nig (1):
>       drm/amdgpu: limit the amdgpu_vm_update_ptes trace point
> =

> Colin Ian King (1):
>       drm/amdgpu: Fix spelling mistake "Heterogenous" -> "Heterogeneous"
> =

> Eric Bernstein (1):
>       drm/amd/display: add dcn30_link_encoder_validate_output_with_stream=
 to header
> =

> Evan Quan (12):
>       drm/amd/pm: support power source switch on Sienna Cichlid
>       drm/amd/pm: correct power limit setting for SMU V11
>       drm/amd/pm: correct the gpo control for sienna cichlid
>       drm/amd/pm: expose the firmware_capability from firmware_info table
>       drm/amdgpu: new macro for determining 2ND_USB20PORT support
>       drm/amd/pm: new SMC message for 2nd usb2.0 port workaround
>       drm/amd/pm: fulfill sienna cichlid 2nd usb2.0 port workaround
>       drm/amd/pm: typo fix (CUSTOM -> COMPUTE)
>       drm/amd/pm: fulfill the sienna cichlid UMD PSTATE profiling clocks
>       drm/amd/pm: correct the data structure for activity monitor coeff e=
xchange
>       drm/amd/pm: update the data strucutre for SMU metrics exchange
>       drm/amd/pm: add deep sleep control for uclk and fclk
> =

> Felipe (1):
>       drm/amd/display: Fix OGAM LUT calculation precision
> =

> Flora Cui (1):
>       drm/amd/display: drop retired CONFIG_DRM_AMD_DC_DCN3_0
> =

> Jake Wang (1):
>       drm/amd/display: updated wm table for Renoir
> =

> Jiange Zhao (1):
>       drm/amdgpu/SRIOV: Extend VF reset request wait period
> =

> Jiansong Chen (1):
>       drm/amdkfd: correct pipe offset calculation
> =

> Leo (Hanghong) Ma (1):
>       drm/amd/display: Add DP info frame update for dcn30
> =

> Likun Gao (1):
>       drm/amdgpu: add judgement for suspend/resume sequence
> =

> Martin Leung (1):
>       drm/amd/display: delay fp2 programming until vactive before lock
> =

> Max Tseng (1):
>       drm/amd/display: Add missing DP_SEC register definitions and masks
> =

> Rodrigo Siqueira (2):
>       drm/amd/display: Drop unnecessary function call
>       drm/amd/display: Add get_dig_frontend implementation for DCEx
> =

> Souptick Joarder (2):
>       drm/amd/display: Fixed kernel test robot warning
>       drm/amd/display: Adding prototype for dccg21_update_dpp_dto()
> =

> Stanley.Yang (1):
>       drm/amdgpu: skip load smu and sdma microcode on sriov for SIENNA_CI=
CHLID
> =

> Tao Zhou (2):
>       drm/amdgpu: set mode1 reset as default for dimgrey_cavefish
>       drm/amdgpu: print mmhub client name for dimgrey_cavefish
> =

> Tom Rix (2):
>       drm/amdgpu: remove h from printk format specifier
>       drm/radeon: remove h from printk format specifier
> =

> Victor Lu (1):
>       drm/amd/display: Change pstate expected timeout warning to 180us on=
 linux
> =

> Wayne Lin (1):
>       drm/amd/display: Fix to be able to stop crc calculation
> =

> Xiaomeng Hou (3):
>       drm/amd/pm: update the smu v11.5 smc header for vangogh
>       drm/amd/pm: inform SMU RLC status thus enable/disable DPM feature f=
or vangogh
>       drm/amdgpu/sdma5.2: soft reset sdma blocks before setup and start s=
dma
> =

> Yifan Zhang (1):
>       drm/amdkfd: correct amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu log.
> =

>  drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  43 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  23 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   9 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  17 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |   5 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   4 +-
>  drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |   1 +
>  drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |  11 +-
>  drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h              |   3 +-
>  drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |  11 +-
>  drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h              |   1 +
>  drivers/gpu/drm/amd/amdgpu/nv.c                    |   1 +
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  42 ++-
>  drivers/gpu/drm/amd/amdkfd/Kconfig                 |   2 +-
>  .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   4 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  29 +--
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  21 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |  13 +-
>  .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |  12 +-
>  drivers/gpu/drm/amd/display/dc/core/dc.c           |  20 ++
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   3 -
>  drivers/gpu/drm/amd/display/dc/dc.h                |   2 +-
>  .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  |  44 +++-
>  .../gpu/drm/amd/display/dc/dce/dce_link_encoder.h  |   2 +
>  .../display/dc/dce120/dce120_timing_generator.c    |   2 +-
>  .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c    |   6 +-
>  .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   2 +-
>  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |  15 +-
>  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  |   2 +-
>  .../amd/display/dc/dcn10/dcn10_stream_encoder.h    |   6 +
>  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  29 +--
>  .../amd/display/dc/dcn20/dcn20_stream_encoder.h    |   2 +
>  drivers/gpu/drm/amd/display/dc/dcn21/dcn21_dccg.h  |   1 +
>  .../amd/display/dc/dcn30/dcn30_dio_link_encoder.c  |   2 +-
>  .../amd/display/dc/dcn30/dcn30_dio_link_encoder.h  |   4 +
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   2 +-
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |   2 +-
>  .../drm/amd/display/dc/inc/hw/timing_generator.h   |   2 +-
>  drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  62 +++--
>  .../drm/amd/display/modules/color/color_gamma.c    |  22 +-
>  drivers/gpu/drm/amd/include/atomfirmware.h         |   1 +
>  drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            |   1 +
>  drivers/gpu/drm/amd/pm/inc/smu_types.h             |   4 +-
>  drivers/gpu/drm/amd/pm/inc/smu_v11_0_7_ppsmc.h     |   6 +-
>  drivers/gpu/drm/amd/pm/inc/smu_v11_5_ppsmc.h       |   2 +-
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  10 +-
>  .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 289 +++++++++++++--=
------
>  .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.h    |   4 +
>  drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |  46 +++-
>  drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   9 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.h   |   4 +
>  drivers/gpu/drm/radeon/radeon_uvd.c                |   2 +-
>  drivers/gpu/drm/radeon/radeon_vce.c                |   2 +-
>  58 files changed, 606 insertions(+), 280 deletions(-)

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
