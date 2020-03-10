Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23501180A6B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 22:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B806E3B2;
	Tue, 10 Mar 2020 21:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4FC6E398;
 Tue, 10 Mar 2020 21:27:58 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id e13so58152qts.6;
 Tue, 10 Mar 2020 14:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VXOeTTnhE+VsMyGEWd2TKYh0zHbYwBk/WIRYBsjLxnk=;
 b=S9OZHzi5CKOrLgjCKSnDEflCnU5941+SzsRdejwDpaIizex1x/JT5v7D7weNZ883FU
 Fr9zQpl6NXHcr+EhNYo+ms3DrekmwYUAhQ4w1uvwD2RLfvh18LV9lO5CDbuXu2fXwraS
 eFOXMMm1FmS2Ya8uFwA0wmlQyBo6U6kXkRwnUbZVVoN4cy9xRdLmee2q9ENy2oy8r7e9
 cMrjoD9mD3AqH2gIQR13KMSzdLQY9p/FrapZf2+uTfIzPVl3WzMpGyZJNsjRHsKdd+YB
 lO8qIT5hNVHjVeV065r+uBQDh75ytO197G7QJXSnouKQNha6FEwzdsYRWIpG+kXNmjsn
 UgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VXOeTTnhE+VsMyGEWd2TKYh0zHbYwBk/WIRYBsjLxnk=;
 b=sLBq2mDvc/z964s8TDFmRdyd3i1Ayl8iAzvmhaWz/p+z0WhxvNB52tmA8LD5138mVv
 KQrYmKF/RhN7jfSTNhfYe5Wbqxj6taBU/3oEZNHZb8eTIjq0jKMITvzOCptWXKYUDihx
 bKcoHSFAl4t3v0fuZ91jOyTD9aOLaq1dkkHJVAZ0u7CSDj/FoKjcKTThLOEnB+eNUtgn
 q4QZhiRWXkydSy2h5inN7bALrVTqLvR0Buc6kuFQnrR0zZHIWYEEpaZiffR7eIqE8Elb
 mvU0GQHP43iOJIapscjrjTUyhAxffYlOH/mhPTA1E95fjYHALTOFVDrCGiX5ytupF6km
 3R/w==
X-Gm-Message-State: ANhLgQ0e35c4GJd4IHMJ/zm725bMQlc+dO3y0b9mFg84uFVAwr6j86/7
 zBa+1xsvZcwoeCHXa+gh/GCoEGQK
X-Google-Smtp-Source: ADFU+vv7KETnIl3d/cG6+XQtbD7ZtBZforUDxTnUr2uaoI2PKjX8mRE/m3oIuHH0MU0WrrA4n69QoA==
X-Received: by 2002:ac8:76d0:: with SMTP id q16mr20788250qtr.73.1583875676906; 
 Tue, 10 Mar 2020 14:27:56 -0700 (PDT)
Received: from localhost.localdomain ([71.219.40.23])
 by smtp.gmail.com with ESMTPSA id f93sm9806985qtd.26.2020.03.10.14.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 14:27:56 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd, scheduler drm-next-5.7
Date: Tue, 10 Mar 2020 17:27:48 -0400
Message-Id: <20200310212748.4519-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
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

Updates for 5.7.

The following changes since commit 60347451ddb0646c1a9cc5b9581e5bcf648ad1aa:

  Merge tag 'drm-misc-next-2020-02-27' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2020-02-28 16:22:41 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-next-5.7-2020-03-10

for you to fetch changes up to 5d11e37c021f925496a3a3c019cadf69435f65ed:

  drm/amdgpu/runpm: disable runpm on Vega10 (2020-03-10 15:55:18 -0400)

----------------------------------------------------------------
amd-drm-next-5.7-2020-03-10:

amdgpu:
- SR-IOV fixes
- Fix up fallout from drm load/unload callback removal
- Navi, renoir power management watermark fixes
- Refactor smu parameter handling
- Display FEC fixes
- Display DCC fixes
- HDCP fixes
- Add support for USB-C PD firmware updates
- Pollock detection fix
- Rework compute ring priority handling
- RAS fixes
- Misc cleanups

amdkfd:
- Consolidate more gfx config details in amdgpu
- Consolidate bo alloc flags
- Improve code comments
- SDMA MQD fixes
- Misc cleanups

gpu scheduler:
- Add suport for modifying the sched list

uapi:
- Clarify comments about GEM_CREATE flags that are not used by userspace.
  The kernel driver has always prevented userspace from using these.
  They are only used internally in the kernel driver.

----------------------------------------------------------------
Aly-Tawfik (2):
      drm/amdgpu/display: fix pci revision id fetching
      drm/amdgpu/display: Fix Pollock Variant Detection

Andrey Grodzovsky (6):
      drm/amdgpu: Add USBC PD FW load interface to PSP.
      drm/amdgpu: Add USBC PD FW load to PSP 11
      drm/amdgpu: Add support for USBC PD FW download
      drm/amdgpu: Wrap clflush_cache_range with x86 ifdef
      drm/amdgpu: Fix GPU reset error.
      drm/amdgpu: Enter low power state if CRTC active.

Aric Cyr (2):
      drm/amd/display: 3.2.75
      drm/amd/display: 3.2.76

Bhawanpreet Lakha (1):
      drm/amd/display: Clear link settings on MST disable connector

Braden Bakker (1):
      drm/amd/display: Add registry for mem pwr control

Chengming Gui (2):
      drm/amdgpu: add lock option for smu_set_soft_freq_range()
      drm/amdgpu: Add debugfs interface to set arbitrary sclk for navi14 (v2)

Colin Ian King (2):
      drm/amdkfd: fix indentation issue
      drm/amd/display: fix indentation issue on a hunk of code

Dan Carpenter (1):
      drm/amd/display: Fix dmub_psr_destroy()

Emily Deng (1):
      drm/amdgpu/sriov: Use kiq to copy the gpu clock

Eric Bernstein (1):
      drm/amd/display: Fix default logger mask definition

Eric Huang (1):
      drm/amdkfd: change SDMA MQD memory type

Feifei Xu (1):
      drm/amdgpu/runpm: disable runpm on Vega10

Felix Kuehling (1):
      drm/amdkfd: Signal eviction fence on process destruction (v2)

George Shen (1):
      drm/amd/display: Workaround to do HDCP authentication twice on certain displays

Guchun Chen (1):
      drm/amdgpu: toggle DF-Cstate when accessing UMC ras error related registers

Hawking Zhang (10):
      drm/amdgpu: add reset_ras_error_count function for SDMA
      drm/amdgpu: add reset_ras_error_count function for MMHUB
      drm/amdgpu: add reset_ras_error_count function for GFX
      drm/amdgpu: add reset_ras_error_count function for HDP
      drm/amdgpu: correct ROM_INDEX/DATA offset for VEGA20
      drm/amdgpu: add xgmi ip headers
      drm/amdgpu: add wafl2 ip headers
      drm/amdgpu: add helper funcs to detect PCS error
      drm/amdgpu: enable PCS error report on VG20
      drm/amdgpu: enable PCS error report on arcturus

Hersen Wu (2):
      drm/amdgpu/powerplay: nv1x, renior copy dcn clock settings of watermark to smu during boot up
      drm/amdgpu/display: navi1x copy dcn watermark clock settings to smu resume from s3 (v2)

Isabel Zhang (2):
      drm/amd/display: Move mod_hdcp_displays to mod_hdcp struct
      drm/amd/display: Add stay count and bstatus to HDCP log

Jacob He (2):
      drm/amdgpu: Initialize SPM_VMID with 0xf (v2)
      drm/amdgpu: Update SPM_VMID with the job's vmid when application reserves the vmid

John Clements (2):
      drm/amdgpu: increase atombios cmd timeout
      drm/amdgpu: update page retirement sequence

Joseph Gravenor (1):
      drm/amd/display: add worst case dcc meta pitch to fake plane

Josip Pavic (1):
      drm/amd/display: fix dcc swath size calculations on dcn1

Martin Leung (3):
      drm/amd/display: Link training TPS1 workaround add back in dpcd
      drm/amd/display: update soc bb for nv14
      drm/amd/display: writing stereo polarity register if swapped

Matt Coffin (3):
      drm/amdgpu/powerplay: Refactor SMU message handling for safety
      drm/amdgpu/powerplay: Remove deprecated smc_read_arg
      drm/amdgpu/smu: Add message sending lock

Melissa Wen (3):
      drm/amd/display: dc_link: code clean up on enable_link_dp function
      drm/amd/display: dc_link: code clean up on detect_dp function
      drm/amd/display: dcn20: remove an unused function

Michael Strauss (1):
      drm/amd/display: Disable freesync borderless on Renoir

Monk Liu (7):
      drm/amdgpu: fix IB test MCBP bug
      drm/amdgpu: stop using sratch_reg in IB test
      drm/amdgpu: introduce mmsch v2.0 header
      drm/amdgpu: disable jpeg block for SRIOV
      drm/amdgpu: implement initialization part on VCN2.0 for SRIOV
      drm/amdgpu: cleanup ring/ib test for SRIOV vcn2.0 (v2)
      drm/amdgpu: disable clock/power gating for SRIOV

Nathan Chancellor (1):
      drm/amd/display: Remove pointless NULL checks in dmub_psr_copy_settings

Nikola Cornij (2):
      drm/amd/display: Add 'disable FEC for specific monitor' infrastructure to DC
      drm/amd/display: Program DSC during timing programming

Nirmoy Das (5):
      drm/amdgpu: set compute queue priority at mqd_init
      drm/scheduler: implement a function to modify sched list
      drm/amdgpu: change hw sched list on ctx priority override
      drm/amdgpu: remove unused functions
      drm/amdgpu: do not set nil entry in compute_prio_sched

Prike Liang (3):
      drm/amd/powerplay: fix pre-check condition for setting clock range
      drm/amd/powerplay: map mclk to fclk for COMBINATIONAL_BYPASS case
      drm/amd/powerplay: fix the coverity warning about negative check for an unsigned value

Rodrigo Siqueira (1):
      drm/amd/display: Stop if retimer is not available

Rohit Khaire (1):
      drm/amdgpu: Write blocked CP registers using RLC on VF

Roman Li (1):
      drm/amd/display: fix typo "to found" -> "to find"

Samir Dhume (1):
      drm/amdgpu: Rearm IRQ in Navi10 SR-IOV if IRQ lost

Sung Lee (3):
      drm/amd/display: Make clock table struct more accessible
      drm/amd/display: Remove DISPCLK Limit Floor for Certain SMU Versions
      drm/amd/display: Set clock optimization required after update clocks

Tao Zhou (2):
      drm/amdgpu: add function to creat all ras debugfs node
      drm/amdgpu: call ras_debugfs_create_all in debugfs_init

Tianci.Yin (1):
      drm/amdgpu: disable 3D pipe 1 on Navi1x

Tiecheng Zhou (1):
      drm/amdgpu/sriov: skip programing some regs with new L1 policy

Wenjing Liu (8):
      drm/amd/display: only include FEC overhead if both asic and display support FEC
      drm/amd/display: add vsc update support for test pattern request
      drm/amd/display: program DPG_OFFSET_SEGMENT for odm_pipe
      drm/amd/display: fix image corruption with ODM 2:1 DSC 2 slice
      drm/amd/display: determine is mst hdcp based on stream instead of sink signal
      drm/amd/display: determine rx id list bytes to read based on device count
      drm/amd/display: fix a minor HDCP logging error
      drm/amd/display: separate FEC capability from fec debug flag

Wyatt Wood (2):
      drm/amd/display: Add driver support for enabling PSR on DMCUB
      drm/amd/display: Add ABM command structs to DMCUB

Xiaojie Yuan (1):
      drm/amd/powerplay: add smu if version for navi12

Yintian Tao (3):
      drm/amdgpu: no need to clean debugfs at amdgpu
      drm/amdgpu: release drm_device after amdgpu_driver_unload_kms
      drm/amdgpu: clean wptr on wb when gpu recovery

Yong Zhao (6):
      drm/amdgpu: Add num_banks and num_ranks to gfx config structure
      drm/amdkfd: Make get_tile_config() generic
      drm/amdgpu: Use better names to reflect it is CP MQD buffer
      drm/amdkfd: Add more comments on GFX9 user CP queue MQD workaround
      drm/amdkfd: Use pr_debug to print the message of reaching event limit
      drm/amdkfd: Consolidate duplicated bo alloc flags

Yongqiang Sun (2):
      drm/amd/display: change number of cursor policy for dml calculation.
      drm/amd/display: Not check wm and clk change flag in optimized bandwidth.

abdoulaye berthe (1):
      drm/amd/display: set lttpr mode before link settings

jianzh (1):
      drm/amdgpu/sriov: Use VF-accessible register for gpu_clock_count

xinhui pan (1):
      drm/amdgpu: Correct the condition of warning while bo release

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   3 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |  33 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c  |  26 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c  |  26 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |  23 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h  |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  51 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |  89 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |  76 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h        |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  49 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |  17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   6 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.c          |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h          |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c           |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 121 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |  10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  37 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  77 -----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  20 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           | 205 ++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |   8 +
 drivers/gpu/drm/amd/amdgpu/atom.c                  |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             | 191 +++++++-----
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |  24 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              | 148 +++------
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              | 237 +++++++--------
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4.h              |   2 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c           |  55 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   3 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |  12 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |  29 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |  12 +
 drivers/gpu/drm/amd/amdgpu/mmsch_v2_0.h            | 338 +++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |  36 +++
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   3 +-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |   3 +
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |  81 +++++
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |  20 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  39 ++-
 drivers/gpu/drm/amd/amdgpu/umc_v6_1.c              |  23 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              | 257 +++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   2 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |  18 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  18 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  71 ++++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |   1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  16 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  17 +-
 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c   |  46 +--
 drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c   |   5 +
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |   8 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   4 +
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      | 157 +++++-----
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  96 +++---
 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  13 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |   3 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   1 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   4 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c    |   4 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  28 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |   8 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c   |  78 -----
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c   |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  43 +--
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_opp.c   |   8 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_opp.h   |   9 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  | 135 +++++++-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.h  |   2 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |  22 +-
 drivers/gpu/drm/amd/display/dc/dm_cp_psp.h         |   1 +
 .../drm/amd/display/dc/dml/display_mode_structs.h  |   3 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   2 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |   1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dsc.h        |   1 +
 .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |   1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/opp.h        |   3 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  52 ++++
 .../gpu/drm/amd/display/dmub/inc/dmub_cmd_dal.h    |   9 +
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |  16 +-
 drivers/gpu/drm/amd/display/include/logger_types.h |  63 ++--
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.c    |  19 +-
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h    |  27 +-
 .../amd/display/modules/hdcp/hdcp1_transition.c    |   3 +
 .../gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c    |  24 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_log.h    |   8 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |  32 +-
 drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |   7 +-
 .../include/asic_reg/wafl/wafl2_4_0_0_sh_mask.h    |  69 +++++
 .../amd/include/asic_reg/wafl/wafl2_4_0_0_smn.h    |  29 ++
 .../amd/include/asic_reg/xgmi/xgmi_4_0_0_sh_mask.h |  69 +++++
 .../drm/amd/include/asic_reg/xgmi/xgmi_4_0_0_smn.h |  29 ++
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |  25 --
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c         |  64 ++--
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c       |  30 +-
 drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h     |   9 +-
 drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h      |   6 +-
 drivers/gpu/drm/amd/powerplay/inc/smu_v12_0.h      |   5 +-
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c         |  71 +++--
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c         |  45 +--
 drivers/gpu/drm/amd/powerplay/smu_internal.h       |  11 +-
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c          | 123 ++++----
 drivers/gpu/drm/amd/powerplay/smu_v12_0.c          |  90 +++---
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c         |  69 +++--
 drivers/gpu/drm/scheduler/sched_entity.c           |  18 ++
 include/drm/gpu_scheduler.h                        |   4 +
 include/uapi/drm/amdgpu_drm.h                      |   5 +-
 132 files changed, 2995 insertions(+), 1373 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmsch_v2_0.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/wafl/wafl2_4_0_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/wafl/wafl2_4_0_0_smn.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/xgmi/xgmi_4_0_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/xgmi/xgmi_4_0_0_smn.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
