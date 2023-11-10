Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9FD7E83CD
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 21:33:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080B010E16D;
	Fri, 10 Nov 2023 20:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD85510E16D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 20:33:01 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-408ffb55b35so1877145e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 12:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1699648380; x=1700253180; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UfAShgJLjOI7SHfDobc9+m2CRJsj+9xBvGYgFhqBZJs=;
 b=dOC/Z8tHe2Oco/f6YnrEAamDKUk7LWcv3I4FTDDUj+do89vaHt9eoAzJRoOR/6dbIW
 ZC8NMFfwYh/sIsr3gPY7HfeQFxlgpe5iUQXOdEgbPXdTEvhMMICTNQsPoYeKEtZtZLwL
 3pQImeFWOtPyDFauLHhc0ZqtMOT7iTUWWO8MI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699648380; x=1700253180;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UfAShgJLjOI7SHfDobc9+m2CRJsj+9xBvGYgFhqBZJs=;
 b=Q0BNBbcP0r07bzHyy+eLS8G64pwXCmFdFYEj3HniJr2Fne8nI0M+aKG3u7MAyTNPuZ
 u/3CJkdiLge9L8eHfMQyq/ziHRWCTgc5E8dw02jG8On2hWRTh8/V+bDeq/zvf/hGY20x
 aCN1Sr0g7SVaJhgJGI3g/FTrxJVBkbevJZE6JQ9Vb1j2mtBElqoNl3kL099lk1+vZnd6
 TBZER1nXqP5BtjxX+D0M3X3oj76R+JJll50EiRjqKIt8wZnSK02MvYr2wyDtkV1qRjGi
 oGoddL/ZvQeXvAw3n2J8rbzOlA7hEqLA8ALJ3XadBssW0j0XD09jIL3cGo64Um6Cwpz9
 c3UA==
X-Gm-Message-State: AOJu0YxujMtUAvC3nV17n3Wz9HhlqV+NysRxd0JQ2S7kJLzdA9qc3k02
 Znrx64Ihh2oHjEwRj56Jnbc3QQ==
X-Google-Smtp-Source: AGHT+IHA4Bz2MmG3OMmU/9+FSEh2kQBL6OSq8PXxRAFlJo+5OvtNdqETo7dzreFnFqZhxY6qmWFEcg==
X-Received: by 2002:a5d:6da2:0:b0:32f:8372:dfe8 with SMTP id
 u2-20020a5d6da2000000b0032f8372dfe8mr211967wrs.1.1699648379615; 
 Fri, 10 Nov 2023 12:32:59 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 e3-20020adffd03000000b003142e438e8csm94965wrr.26.2023.11.10.12.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 12:32:57 -0800 (PST)
Date: Fri, 10 Nov 2023 21:32:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [pull] amdgpu drm-next-6.7
Message-ID: <ZU6Td1Qc3UCzJS58@phenom.ffwll.local>
References: <20231110190703.4741-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231110190703.4741-1-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 6.5.0-1-amd64 
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

On Fri, Nov 10, 2023 at 02:07:03PM -0500, Alex Deucher wrote:
> Hi Dave, Sima,
> 
> Fixes for 6.7.  A bit bigger than this would normally be at this point, but these
> are mainly fixes for new IPs added or enabled in 6.7 so they should be mostly
> self-contained. The rest is the usual general fixes.
> 
> The following changes since commit 9ccde17d46554dbb2757c427f2cdf67688701f96:
> 
>   Merge tag 'amd-drm-next-6.7-2023-11-03' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2023-11-06 11:25:14 +1000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.7-2023-11-10

Merged to drm-next, thanks.
-Sima

> 
> for you to fetch changes up to 8473bfdcb5b1a32fd05629c4535ccacd73bc5567:
> 
>   drm/amdgpu: fix error handling in amdgpu_vm_init (2023-11-10 11:33:28 -0500)
> 
> ----------------------------------------------------------------
> amd-drm-next-6.7-2023-11-10:
> 
> amdgpu:
> - SR-IOV fixes
> - DMCUB fixes
> - DCN3.5 fixes
> - DP2 fixes
> - SubVP fixes
> - SMU14 fixes
> - SDMA4.x fixes
> - Suspend/resume fixes
> - AGP regression fix
> - UAF fixes for some error cases
> - SMU 13.0.6 fixes
> - Documentation fixes
> - RAS fixes
> - Hotplug fixes
> - Scheduling entity ordering fix
> - GPUVM fixes
> 
> ----------------------------------------------------------------
> Alex Deucher (2):
>       drm/amdgpu: fix AGP init order
>       drm/amdgpu: move UVD and VCE sched entity init after sched init
> 
> Alvin Lee (1):
>       drm/amd/display: For cursor P-State allow for SubVP
> 
> Anthony Koo (2):
>       drm/amd/display: [FW Promotion] Release 0.0.189.0
>       drm/amd/display: [FW Promotion] Release 0.0.190.0
> 
> Aric Cyr (3):
>       drm/amd/display: 3.2.257
>       drm/amd/display: 3.2.258
>       drm/amd/display: Promote DAL to 3.2.259
> 
> Bragatheswaran Manickavel (1):
>       drm/amd/display: avoid variable reinitialization
> 
> Chaitanya Dhere (1):
>       drm/amd/display: Remove references to unused dml arch version
> 
> Christian König (3):
>       drm/amdgpu: fix error handling in amdgpu_bo_list_get()
>       drm/amdgpu: lower CS errors to debug severity
>       drm/amdgpu: fix error handling in amdgpu_vm_init
> 
> ChunTao Tso (1):
>       drm/amd/display: amend HPD handler for Replay
> 
> Daniel Miess (3):
>       drm/amd/display: On boot disable domain22 force power on
>       drm/amd/display: Enable RCO options for dcn35
>       drm/amd/display: Enable physymclk RCO
> 
> David Yat Sin (1):
>       drm/amdgpu: Change extended-scope MTYPE on GC 9.4.3
> 
> Dennis Chan (2):
>       drm/amd/display: Introduce flag for disabling Replay desync recovery
>       drm/amd/display: Revise Replay Desync Error IRQ handle
> 
> Fangzhi Zuo (1):
>       drm/amd/display: Allow 16 max_slices for DP2 DSC
> 
> Felix Kuehling (1):
>       drm/amdgpu: Fix possible null pointer dereference
> 
> George Shen (3):
>       drm/amd/display: Update test link rate DPCD bit field to match spec
>       drm/amd/display: Update DP HPO MSA with colorimetry from test request
>       drm/amd/display: Set stream's DP test pattern upon test request
> 
> Hawking Zhang (2):
>       drm/amdgpu: Support multiple error query modes
>       drm/amdgpu: correct acclerator check architecutre dump
> 
> Hunter Chasens (1):
>       drm: amd: Resolve Sphinx unexpected indentation warning
> 
> Ilya Bakoulin (1):
>       drm/amd/display: Fix missing blendTF programming
> 
> Jiadong Zhu (1):
>       drm/amdgpu/soc21: add mode2 asic reset for SMU IP v14.0.0
> 
> JinZe.Xu (1):
>       drm/amd/display: decouple dmcub execution to reduce lock granularity
> 
> Joshua Aberback (1):
>       drm/amd/display: Remove unused duplicate register definition
> 
> José Pekkarinen (1):
>       drm/amd/display: remove duplicated argument
> 
> Le Ma (1):
>       drm/amd/pm: raise the deep sleep clock threshold for smu 13.0.6
> 
> Lijo Lazar (3):
>       drm/amdgpu: Fix sdma 4.4.2 doorbell rptr/wptr init
>       drm/amd/pm: Hide irrelevant pm device attributes
>       drm/amd/pm: Hide pp_dpm_pcie device attribute
> 
> Mario Limonciello (1):
>       drm/amd: Explicitly check for GFXOFF to be enabled for s0ix
> 
> Ovidiu Bunea (1):
>       drm/amd/display: Disable OTG for mode timing switch on DCN35
> 
> Rodrigo Siqueira (1):
>       drm/amd/display: Create optc.h file
> 
> Roman Li (1):
>       drm/amd/display: Add missing dml2 init value for dcn35
> 
> Sung Joon Kim (3):
>       drm/amd/display: Fix FRL assertion on boot
>       drm/amd/display: Enable more IPS options
>       drm/amd/display: Fix handling duplicate planes on one stream
> 
> Surbhi Kakarya (1):
>       drm/amd: Disable XNACK on SRIOV environment
> 
> Taimur Hassan (1):
>       drm/amd/display: Fix OTG disable workaround logic
> 
> Tao Zhou (3):
>       drm/amdgpu: handle extra UE register entries for gfx v9_4_3
>       drm/amdgpu: add RAS reset/query operations for XGMI v6_4
>       drm/amdgpu: Don't warn for unsupported set_xgmi_plpd_mode
> 
> Tim Huang (2):
>       drm/amd/pm: not stop rlc for IMU enabled APUs when suspend
>       drm/amdgpu: move kfd_resume before the ip late init
> 
> Victor Lu (6):
>       drm/amdgpu: Add flag to enable indirect RLCG access for gfx v9.4.3
>       drm/amdgpu: Add xcc param to SRIOV kiq write and WREG32_SOC15_IP_NO_KIQ (v4)
>       drm/amdgpu: Skip PCTL0_MMHUB_DEEPSLEEP_IB write in jpegv4.0.3 under SRIOV
>       drm/amdgpu: Do not program PF-only regs in hdp_v4_0.c under SRIOV (v2)
>       drm/amdgpu: Use correct KIQ MEC engine for gfx9.4.3 (v5)
>       drm/amdgpu: Change WREG32_RLC to WREG32_SOC15_RLC where inst != 0 (v2)
> 
> Vitaly Prosyak (1):
>       drm/amdgpu: fix software pci_unplug on some chips
> 
> Wenjing Liu (1):
>       drm/amd/display: save and restore mall state when applying minimal transition
> 
> Yang Wang (7):
>       drm/amdgpu: correct amdgpu ip block rev info
>       drm/amdgpu: correct smu v13.0.6 umc ras error check
>       drm/amdgpu: refine smu v13.0.6 mca dump driver
>       drm/amdgpu: disable smu v13.0.6 mca debug mode by default
>       drm/amdgpu: add pcs xgmi v6.4.0 ras support
>       drm/amdgpu: correct mca debugfs dump reg list
>       drm/amdgpu: add smu v13.0.6 pcs xgmi ras error query support
> 
> Yihan Zhu (1):
>       drm/amd/display: DCN35 Disable cm power optimization
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  13 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   3 +
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c    |  40 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |  42 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c        |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 114 +++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   5 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            | 182 +++++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |  60 +++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   3 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            | 102 +++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   8 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |  22 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.h            |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |  24 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h            |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |  19 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  35 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           | 218 +++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  49 +++-
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   3 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   3 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |   1 +
>  drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |   1 +
>  drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |   1 +
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  35 ++-
>  drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |   4 +
>  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |  16 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  27 +-
>  drivers/gpu/drm/amd/amdgpu/soc15_common.h          |  14 +-
>  drivers/gpu/drm/amd/amdgpu/soc21.c                 |   1 +
>  drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |   4 +-
>  drivers/gpu/drm/amd/amdgpu/umc_v12_0.h             |   3 +
>  drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |   2 -
>  drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c              |   2 -
>  drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c              |   2 -
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |   2 -
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |   4 -
>  drivers/gpu/drm/amd/amdgpu/vce_v2_0.c              |   2 -
>  drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |   2 -
>  drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |   5 -
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   7 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   8 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   3 +
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h    |   2 +-
>  .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |  21 +-
>  drivers/gpu/drm/amd/display/dc/core/dc.c           |  27 +-
>  drivers/gpu/drm/amd/display/dc/dc.h                |   2 +-
>  drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  74 +++++
>  drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   8 +
>  drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   3 +-
>  drivers/gpu/drm/amd/display/dc/dc_types.h          |   4 +-
>  drivers/gpu/drm/amd/display/dc/dce/dce_abm.h       |  15 -
>  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  | 186 +-----------
>  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c   |  10 +-
>  drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.c  |  73 ++---
>  .../gpu/drm/amd/display/dc/dcn35/dcn35_pg_cntl.c   |  10 +-
>  .../gpu/drm/amd/display/dc/dcn35/dcn35_pg_cntl.h   |   1 +
>  .../gpu/drm/amd/display/dc/dcn35/dcn35_resource.c  |  37 ++-
>  .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   2 +-
>  .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |  61 ++--
>  .../drm/amd/display/dc/dml2/dml2_internal_types.h  |   4 +-
>  .../amd/display/dc/dml2/dml2_translation_helper.c  |  55 +++-
>  .../amd/display/dc/dml2/dml2_translation_helper.h  |   2 +-
>  drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |  18 +-
>  drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |   2 +-
>  drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |  11 +
>  .../gpu/drm/amd/display/dc/hwss/dce/dce_hwseq.h    |  18 +-
>  .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |  17 +-
>  .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  34 ++-
>  drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |   5 +
>  drivers/gpu/drm/amd/display/dc/inc/hw/dsc.h        |   2 +
>  drivers/gpu/drm/amd/display/dc/inc/hw/optc.h       | 219 ++++++++++++++
>  drivers/gpu/drm/amd/display/dc/inc/hw/pg_cntl.h    |   2 +
>  .../amd/display/dc/link/accessories/link_dp_cts.c  |  17 +-
>  .../dc/link/protocols/link_dp_irq_handler.c        |  15 +-
>  drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  25 +-
>  drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  12 +-
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  29 +-
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   5 +-
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   | 315 +++++++++------------
>  85 files changed, 1688 insertions(+), 773 deletions(-)
>  create mode 100644 drivers/gpu/drm/amd/display/dc/inc/hw/optc.h

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
