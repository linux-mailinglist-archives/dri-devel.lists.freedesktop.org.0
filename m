Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DCD7E849F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 21:48:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4CA10E29D;
	Fri, 10 Nov 2023 20:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAE410E29D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 20:48:46 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-408434ce195so2373615e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 12:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1699649324; x=1700254124; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-disposition:mime-version
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7mFNPT/uy0UMAnz/Ugx6DLKoCv+d+mLnO+112jTH4fI=;
 b=CVm1k6sROZNdsaAoJ07ubaTRLPtpd+s0iLmSZ7eGj9KVPOEIa4D4zS+LPcTRuOZSH2
 EaCLYxqBnTai482Tlc9TxWKxnuZZ7Wno5N3sZwCtn5B5znEiGMdnr2A/7TpsTIJ7TOm6
 8GHalUTpsLyEFop1EF+PmmnCGYZifBKsrD6bM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699649324; x=1700254124;
 h=content-transfer-encoding:content-disposition:mime-version
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7mFNPT/uy0UMAnz/Ugx6DLKoCv+d+mLnO+112jTH4fI=;
 b=Ds7/UEWb6YekTUHt1w766n3uO9nycjvl9D1xPaZvxbusD7SEbjJQ8TbxqzTx5X6yg8
 +fnZmJBdEU3IH3QuMuUov3u3IWMJaxufnWA/sKRxLHsGm14+afCAfiY/SxbRSw6XJlVG
 X5jyJKgSdFBj7CcOcM/zwGdgT1WPdM6lYzGeoFctwNJV0SBkbRT3XFHFU4V0vHpAZFM6
 BZzuipFewWnGzyWkue7NGspZp+9PtO53fYdOJYQdH8B3nUmunQj4UQLF5q7AQstRk6g6
 qDYXLwDo45u9CoeD8FCx4dgbxVdr8aM1C1vLxDVMfba4IjhzXQZnz0rgvyTCkIn80/4r
 IN3Q==
X-Gm-Message-State: AOJu0YwF1/MZTUmSLglLoBNl8EKzfmizuAhjIICJ3Y/hJxmW0MOx8FQ0
 fEI4/j1WFeefdAIMWIxwWRjBqQ==
X-Google-Smtp-Source: AGHT+IGoZwONoDkaC8fs7HGaBOTdrqDo5nO9foSKlzle+lzhC0apVkOsBrbNDD/8jqAvLzH16IcxKA==
X-Received: by 2002:a5d:648c:0:b0:331:3d16:51e3 with SMTP id
 o12-20020a5d648c000000b003313d1651e3mr263761wri.7.1699649324575; 
 Fri, 10 Nov 2023 12:48:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a5d4202000000b0032d886039easm117216wrq.14.2023.11.10.12.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 12:48:44 -0800 (PST)
Date: Fri, 10 Nov 2023 21:48:42 +0100
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] drm fixes for 6.7-rc1
Message-ID: <ZU6XKgI7FZsIJWoq@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus

Dave's vpn to the big machine died, so it's on me to do fixes pr this and
next week while everyone else is at plumbers.

drm fixes for 6.7-rc1

- big pile of amd fixes, but mostly hw support newly added in 6.7
- i915 fixes, mostly minor things
- qxl memory leak fix
- vc4 uaf fix in mock helpers
- syncobj fix for DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE

Cheers!

The following changes since commit 9ccde17d46554dbb2757c427f2cdf67688701f96:

  Merge tag 'amd-drm-next-6.7-2023-11-03' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2023-11-06 11:25:14 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2023-11-10

for you to fetch changes up to 03df0fc007ca4713fa1e716329af556f981807e4:

  Merge tag 'amd-drm-next-6.7-2023-11-10' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2023-11-10 20:51:38 +0100)

----------------------------------------------------------------
drm fixes for 6.7-rc1

- big pile of amd fixes, but mostly hw support newly added in 6.7
- i915 fixes, mostly minor things
- qxl memory leak fix
- vc4 uaf fix in mock helpers
- syncobj fix for DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu: fix AGP init order
      drm/amdgpu: move UVD and VCE sched entity init after sched init

Alvin Lee (1):
      drm/amd/display: For cursor P-State allow for SubVP

Anthony Koo (2):
      drm/amd/display: [FW Promotion] Release 0.0.189.0
      drm/amd/display: [FW Promotion] Release 0.0.190.0

Aric Cyr (3):
      drm/amd/display: 3.2.257
      drm/amd/display: 3.2.258
      drm/amd/display: Promote DAL to 3.2.259

Arnd Bergmann (1):
      drm/i915/mtl: avoid stringop-overflow warning

Bragatheswaran Manickavel (1):
      drm/amd/display: avoid variable reinitialization

Chaitanya Dhere (1):
      drm/amd/display: Remove references to unused dml arch version

Chaitanya Kumar Borah (1):
      drm/i915/mtl: Support HBR3 rate with C10 phy and eDP in MTL

Christian König (3):
      drm/amdgpu: fix error handling in amdgpu_bo_list_get()
      drm/amdgpu: lower CS errors to debug severity
      drm/amdgpu: fix error handling in amdgpu_vm_init

ChunTao Tso (1):
      drm/amd/display: amend HPD handler for Replay

Daniel Miess (3):
      drm/amd/display: On boot disable domain22 force power on
      drm/amd/display: Enable RCO options for dcn35
      drm/amd/display: Enable physymclk RCO

Daniel Vetter (3):
      Merge tag 'drm-intel-next-fixes-2023-11-08' of git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-fixes-2023-11-08' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'amd-drm-next-6.7-2023-11-10' of https://gitlab.freedesktop.org/agd5f/linux into drm-next

David Yat Sin (1):
      drm/amdgpu: Change extended-scope MTYPE on GC 9.4.3

Dennis Chan (2):
      drm/amd/display: Introduce flag for disabling Replay desync recovery
      drm/amd/display: Revise Replay Desync Error IRQ handle

Erik Kurzinger (1):
      drm/syncobj: fix DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE

Fangzhi Zuo (1):
      drm/amd/display: Allow 16 max_slices for DP2 DSC

Felix Kuehling (1):
      drm/amdgpu: Fix possible null pointer dereference

George Shen (3):
      drm/amd/display: Update test link rate DPCD bit field to match spec
      drm/amd/display: Update DP HPO MSA with colorimetry from test request
      drm/amd/display: Set stream's DP test pattern upon test request

Harshit Mogalapalli (1):
      i915/perf: Fix NULL deref bugs with drm_dbg() calls

Hawking Zhang (2):
      drm/amdgpu: Support multiple error query modes
      drm/amdgpu: correct acclerator check architecutre dump

Hunter Chasens (1):
      drm: amd: Resolve Sphinx unexpected indentation warning

Ilya Bakoulin (1):
      drm/amd/display: Fix missing blendTF programming

Jiadong Zhu (1):
      drm/amdgpu/soc21: add mode2 asic reset for SMU IP v14.0.0

JinZe.Xu (1):
      drm/amd/display: decouple dmcub execution to reduce lock granularity

Joshua Aberback (1):
      drm/amd/display: Remove unused duplicate register definition

José Pekkarinen (1):
      drm/amd/display: remove duplicated argument

Kunwu Chan (1):
      drm/i915: Fix potential spectre vulnerability

Le Ma (1):
      drm/amd/pm: raise the deep sleep clock threshold for smu 13.0.6

Lijo Lazar (3):
      drm/amdgpu: Fix sdma 4.4.2 doorbell rptr/wptr init
      drm/amd/pm: Hide irrelevant pm device attributes
      drm/amd/pm: Hide pp_dpm_pcie device attribute

Mario Limonciello (1):
      drm/amd: Explicitly check for GFXOFF to be enabled for s0ix

Maxime Ripard (1):
      drm/vc4: tests: Fix UAF in the mock helpers

Nirmoy Das (3):
      drm/i915: Flush WC GGTT only on required platforms
      drm/i915/mtl: Apply notify_guc to all GTs
      drm/i915/tc: Fix -Wformat-truncation in intel_tc_port_init

Ovidiu Bunea (1):
      drm/amd/display: Disable OTG for mode timing switch on DCN35

Rodrigo Siqueira (1):
      drm/amd/display: Create optc.h file

Roman Li (1):
      drm/amd/display: Add missing dml2 init value for dcn35

Sung Joon Kim (3):
      drm/amd/display: Fix FRL assertion on boot
      drm/amd/display: Enable more IPS options
      drm/amd/display: Fix handling duplicate planes on one stream

Surbhi Kakarya (1):
      drm/amd: Disable XNACK on SRIOV environment

Taimur Hassan (1):
      drm/amd/display: Fix OTG disable workaround logic

Tao Zhou (3):
      drm/amdgpu: handle extra UE register entries for gfx v9_4_3
      drm/amdgpu: add RAS reset/query operations for XGMI v6_4
      drm/amdgpu: Don't warn for unsupported set_xgmi_plpd_mode

Tim Huang (2):
      drm/amd/pm: not stop rlc for IMU enabled APUs when suspend
      drm/amdgpu: move kfd_resume before the ip late init

Victor Lu (6):
      drm/amdgpu: Add flag to enable indirect RLCG access for gfx v9.4.3
      drm/amdgpu: Add xcc param to SRIOV kiq write and WREG32_SOC15_IP_NO_KIQ (v4)
      drm/amdgpu: Skip PCTL0_MMHUB_DEEPSLEEP_IB write in jpegv4.0.3 under SRIOV
      drm/amdgpu: Do not program PF-only regs in hdp_v4_0.c under SRIOV (v2)
      drm/amdgpu: Use correct KIQ MEC engine for gfx9.4.3 (v5)
      drm/amdgpu: Change WREG32_RLC to WREG32_SOC15_RLC where inst != 0 (v2)

Ville Syrjälä (1):
      drm/i915: Bump GLK CDCLK frequency when driving multiple pipes

Vitaly Prosyak (1):
      drm/amdgpu: fix software pci_unplug on some chips

Wenjing Liu (1):
      drm/amd/display: save and restore mall state when applying minimal transition

Yang Wang (7):
      drm/amdgpu: correct amdgpu ip block rev info
      drm/amdgpu: correct smu v13.0.6 umc ras error check
      drm/amdgpu: refine smu v13.0.6 mca dump driver
      drm/amdgpu: disable smu v13.0.6 mca debug mode by default
      drm/amdgpu: add pcs xgmi v6.4.0 ras support
      drm/amdgpu: correct mca debugfs dump reg list
      drm/amdgpu: add smu v13.0.6 pcs xgmi ras error query support

Yihan Zhu (1):
      drm/amd/display: DCN35 Disable cm power optimization

Zongmin Zhou (1):
      drm/qxl: prevent memory leak

 drivers/accel/ivpu/ivpu_hw_37xx.c                  |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   3 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c    |  40 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |  42 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c        |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 114 ++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            | 182 ++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |  60 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            | 102 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |  22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.h            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |  22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |  19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  37 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           | 218 ++++++++++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  49 ++-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |   1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |   1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |   1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  35 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |   4 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |  16 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  27 +-
 drivers/gpu/drm/amd/amdgpu/soc15_common.h          |  14 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   1 +
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.h             |   3 +
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |   2 -
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c              |   2 -
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c              |   2 -
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |   2 -
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |   4 -
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c              |   2 -
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |   2 -
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |   5 -
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   8 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   3 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h    |   2 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |  21 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  27 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   2 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  74 +++++
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   8 +
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   3 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   4 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_abm.h       |  15 -
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  | 186 +----------
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c   |  10 +-
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.c  |  73 +++--
 .../gpu/drm/amd/display/dc/dcn35/dcn35_pg_cntl.c   |  10 +-
 .../gpu/drm/amd/display/dc/dcn35/dcn35_pg_cntl.h   |   1 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_resource.c  |  37 ++-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   2 +-
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |  61 ++--
 .../drm/amd/display/dc/dml2/dml2_internal_types.h  |   4 +-
 .../amd/display/dc/dml2/dml2_translation_helper.c  |  55 +++-
 .../amd/display/dc/dml2/dml2_translation_helper.h  |   2 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |  18 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |   2 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |  11 +
 .../gpu/drm/amd/display/dc/hwss/dce/dce_hwseq.h    |  18 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |  17 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  34 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |   5 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dsc.h        |   2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/optc.h       | 219 +++++++++++++
 drivers/gpu/drm/amd/display/dc/inc/hw/pg_cntl.h    |   2 +
 .../amd/display/dc/link/accessories/link_dp_cts.c  |  17 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |  15 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  25 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  12 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  29 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   5 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   | 359 +++++++++------------
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |   6 +-
 drivers/gpu/drm/drm_syncobj.c                      |   3 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  12 +
 drivers/gpu/drm/i915/display/intel_dp.c            |   2 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |  11 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |   1 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |  35 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |  16 +-
 drivers/gpu/drm/i915/i915_debugfs_params.c         |   9 +-
 drivers/gpu/drm/i915/i915_perf.c                   |  15 +-
 drivers/gpu/drm/logicvc/Kconfig                    |   2 +
 drivers/gpu/drm/qxl/qxl_display.c                  |   3 +
 drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c          |   2 +-
 drivers/gpu/drm/vc4/tests/vc4_mock_output.c        |   2 +-
 102 files changed, 1803 insertions(+), 852 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/inc/hw/optc.h

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
