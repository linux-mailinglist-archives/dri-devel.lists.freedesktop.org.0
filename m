Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BCC27F34F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 22:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752736E821;
	Wed, 30 Sep 2020 20:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58906E821;
 Wed, 30 Sep 2020 20:23:58 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id cv8so1626353qvb.12;
 Wed, 30 Sep 2020 13:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EkB7ntp5L1E4Qo9h8gxhdrSBvdQhw0D17kA3Jb2IeF0=;
 b=aS9dBG5sd7rxZfm5d2dI2hHgZq+mkvvYR/nseplD9zHU4CAdLf769H20/7uHNagtEO
 G+SugFdh1R7lQo8cKL64l+zHL9y2bEFLYKZFuEzs1fp6gFO7Ij3+5s2Na6Rkki40I5ZF
 uEO/f5ieZgC0Wn3qjFioRx+9+8S4D9AmLC2muecpF8M/I34MtodR3ywseIbDY4IY8ve5
 DRpje2jDgH2nWvF//vl0AnBlmGgWASi9RddWKqMRs0P6OnNN9FAROJPW214ugAN7rD3G
 8RZXuTUMA4JsBwPMrT1lv8YUkqgAiUQozVDyZbplY55kCVFFe0SMrKTuD42HbygJdPeH
 3jCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EkB7ntp5L1E4Qo9h8gxhdrSBvdQhw0D17kA3Jb2IeF0=;
 b=IWTtlZ+NTvafov2gWKa/1X7fVB5fiXgE5OLUTrA9Vz6mWYv1p9yyxzMQ1X3oesJdtf
 /vOAXYOn3ZED8x6+rYqgeDJ48bqoZffJv2xLYIo5FLBLvmc1aogkiT+4Xzp/CeKQEV8j
 Fo+8a+5EtODfSLnD06lJTk+LfHeoYvJ2Ynv4sFU6sYLu1wui6SIOdA1KCtqdCAEy6VNw
 eAJyOcn83hTOyTFX3G4mXNKf8tUQ3BfHwlOy50H7EhxTtVHIW+AkLcbpSa71p3F8/kA3
 eOp9MK71ix7Sdk53Er4bE1Wffiox/yo6rftkKuRueYjNL0TAXzZpadkLvUA2RZE2uV5o
 JZjQ==
X-Gm-Message-State: AOAM532SJPYGLvfXlYAWN6wG4NhRWrKn66zQMoyjH6EBXn9C8jlzjlsb
 AOZxoAgNEyVBUHwfuDtuAzSAamPtkBQ=
X-Google-Smtp-Source: ABdhPJw+eNNOleBRcAjH6+EmLCubGV+q8qz5Z/Qz32VtIKfN4MHzzztg88NO97yT2aWo8ve0pVdeaQ==
X-Received: by 2002:a0c:9142:: with SMTP id q60mr4334509qvq.13.1601497437398; 
 Wed, 30 Sep 2020 13:23:57 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id g8sm3467869qkl.28.2020.09.30.13.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 13:23:56 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd, radeon drm-next-5.10
Date: Wed, 30 Sep 2020 16:23:49 -0400
Message-Id: <20200930202349.16286-1-alexander.deucher@amd.com>
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

Fixes for 5.10.

The following changes since commit 911d5bd5e7b8531b39301c2c27e5b90d7bd71b88:

  drm/amd/pm: Skip smu_post_init in SRIOV (2020-09-18 16:14:56 -0400)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-next-5.10-2020-09-30

for you to fetch changes up to f2fa07b39fafb2a5f49c71a504862c5efa57d03e:

  drm/amd/amdkfd: Surface files in Sysfs to allow users to get number of compute units that are in use. (2020-09-30 15:26:27 -0400)

----------------------------------------------------------------
amd-drm-next-5.10-2020-09-30:

amdgpu:
- KFD init failure handling fixes
- Display debugfs fixes
- Virtual display vblank deadlock fix
- Backlight fixes
- eDP fixes
- Misc display fixes
- Misc code cleanups
- Mclk handling fixes for navi1x
- SR-IOV fixes
- Documentation updates
- RAS fixes
- Power fixes for Raven and Renoir
- EEPROM fixes

amdkfd:
- CPU CRAT fixes
- Doorbell allocation cleanup
- CU occupancy statistics

radeon:
- Spelling fixes

----------------------------------------------------------------
Alex Deucher (5):
      drm/amdgpu/display: fix CFLAGS setup for DCN30
      drm/amdgpu: store noretry parameter per driver instance
      drm/amdgpu: add an auto setting to the noretry parameter
      drm/amdgpu: fix a warning in amdgpu_ras.c (v2)
      drm/amdgpu/swsmu/smu12: fix force clock handling for mclk

Alvin Lee (1):
      drm/amd/display: Update NV1x SR latency values

Anthony Koo (3):
      drm/amd/display: [FW Promotion] Release 0.0.33
      drm/amd/display: [FW Promotion] Release 0.0.34
      drm/amd/display: [FW Promotion] Release 0.0.35

Aric Cyr (3):
      drm/amd/display: 3.2.103
      drm/amd/display: 3.2.104
      drm/amd/display: Revert check for flip pending before locking pipes

Bernard Zhao (3):
      drm/radeon: fix typoes in comments
      drm/amd: fix typoes in comments
      drm/amd/display: optimize code runtime a bit

Bokun Zhang (2):
      drm/amdgpu: Update VF2PF interface
      drm/amdgpu: Implement new guest side VF2PF message transaction (v2)

Chiawen Huang (2):
      drm/amd/display: disable stream if pixel clock changed with link active
      drm/amd/display: disable stream if pixel clock changed with link active

Chris Park (1):
      drm/amd/display: TMDS Fallback transition

David Galiffi (1):
      drm/amd/display: Fix incorrect backlight register offset for DCN

Dirk Gouders (1):
      drm/amd/display: remove duplicate call to rn_vbios_smu_get_smu_version()

Dmytro Laktyushkin (2):
      amd/drm/display: avoid dcn3 on flip opp change for slave pipes
      drm/amd/display: add pipe reassignment prevention code to dcn3

Emily.Deng (2):
      drm/amdgpu: Fix dead lock issue for vblank
      drm/amdgpu: Remove some useless code

Eric Bernstein (1):
      drm/amd/display: Add dp_set_dsc_pps_info_packet to virtual stream encoder

Evan Quan (5):
      drm/amd/powerplay: optimize the mclk dpm policy settings
      drm/amd/pm: correct the pmfw version check for Navi14
      drm/amd/pm: decouple the watermark table setting from socclk/uclk dpms
      drm/amd/pm: drop redundant watermarks bitmap setting
      drm/amd/pm: fix screen flicker seen on Navi14 with 2*4K monitors

Felix Kuehling (1):
      drm/amdgpu: Fix handling of KFD initialization failures

Flora Cui (1):
      drm/amd/display: fix return value check for hdcp_work

Gary Li (1):
      drm/amd/display: Enable DP YCbCr420 mode support for DCN10

Guchun Chen (3):
      drm/amdgpu: clean up ras sysfs creation (v2)
      drm/amdgpu: fix incorrect comment
      drm/amdgpu: drop duplicated ecc check for vega10 (v5)

Jason Yan (2):
      drm/amd/display: make get_color_space_type() static
      drm/amd/display: make two symbols static

Jean Delvare (1):
      drm/amdgpu: restore proper ref count in amdgpu_display_crtc_set_config

Jiansong Chen (2):
      drm/amdgpu: remove gpu_info fw support for sienna_cichlid etc.
      drm/amdgpu: disable gfxoff temporarily for navy_flounder

Jingwen Chen (2):
      drm/amd/pm: Skip use smc fw data in SRIOV
      drm/amd: Skip not used microcode loading in SRIOV

John Clements (1):
      drm/amdgpu: disable sienna chichlid UMC RAS

Joshua Aberback (1):
      drm/amd/display: Calc DLG from dummy p-state if full p-state unsupported

Kent Russell (3):
      drm/amdkfd: Calculate CPU VCRAT size dynamically (v2)
      drm/amdkfd: Use kvmalloc instead of kmalloc for VCRAT
      drm/amdgpu: Use SKU instead of DID for FRU check v2

Lewis Huang (1):
      drm/amd/display: [FIX] update clock under two conditions

Likun Gao (1):
      drm/amd/pm: update driver if file for sienna cichlid

Liu Shixin (2):
      drm/amd/pm: simplify the return expression of smu_hw_fini
      drm/amdgpu/gmc9: simplify the return expression of gmc_v9_0_suspend

Mukul Joshi (1):
      drm/amdkfd: Move process doorbell allocation into kfd device

Oak Zeng (1):
      drm/amdgpu: use function pointer for gfxhub functions

Peikang Zhang (2):
      drm/amd/display: Bug in dce_is_panel_backlight_on()
      drm/amd/display: eDP intermittent black screen during PnP

Philip Cox (1):
      drm/amdkfd: Fix kfd init stack dump

Qinglang Miao (2):
      drm/amdgpu/mes: simplify the return expression of mes_v10_1_ring_init
      drm/amdgpu: simplify the return expression

Ramesh Errabolu (4):
      drm/amd/amdgpu: Clean up header file of symbols that are defined to be static
      drm/amd/amdgpu: Prepare implementation to support reporting of CU usage
      drm/amd/amdgpu: Define and implement a function that collects number of waves that are in flight.
      drm/amd/amdkfd: Surface files in Sysfs to allow users to get number of compute units that are in use.

Ryan Taylor (2):
      drm/amdgpu: Add initial kernel documentation for the amd_ip_block_type structure. v3
      drm/include: add PP_FEATURE_MASK comments (v3)

Shashank Sharma (1):
      drm/amdgpu: add new trace event for page table update

Shirish S (1):
      drm/amd/display: fix crash/reboot while accessing sysfs files

Stanley.Yang (2):
      drm/amdgpu: update athub interrupt harvesting handle
      drm/amdgpu: fix hdp register access error

Sudheesh Mavila (1):
      drm/amd/pm: Removed fixed clock in auto mode DPM

Taimur Hassan (1):
      drm/amd/display: Check for flip pending before locking pipes.

Tiecheng Zhou (1):
      drm/amdgpu: stop data_exchange work thread before reset

Wang Qing (1):
      gpu/drm/radeon: fix spelling typo in comments

Wenjing Liu (1):
      drm/amd/display: allow DP RX to use more cr aux rd interval delay

Wesley Chalmers (3):
      drm/amd/display: Fix ODM policy implementation
      drm/amd/display: Increase timeout for DP Disable
      drm/amd/display: Add debug param to force dio disable

Wyatt Wood (2):
      drm/amd/display: Implement PSR wait for enable/disable
      drm/amd/display: Ensure all debug bits are passed to fw

Xiaojian Du (1):
      drm/amd/powerplay: add one sysfs file to support the feature to modify gfx clock on Raven/Raven2/Picasso APU.

 Documentation/gpu/amdgpu.rst                       |   9 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |   3 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  | 180 +++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |  35 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.h     |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfxhub.h         |  43 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  38 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h          |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            | 137 +++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |  43 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           | 243 ++++++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |  98 +-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        | 276 +++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/cik_ih.c                |   7 +-
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c           |  35 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   3 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  20 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.h              |   6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c              |  29 +++
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4.h              |   2 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |  12 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.c           |  13 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.h           |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c           |  31 ++-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.h           |  10 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |  29 ++-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.h           |  12 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |  53 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  54 ++--
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c             |   7 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |  31 ++-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   2 +-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |  13 -
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   3 +
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |   3 +
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |   3 +
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  31 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |  33 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   5 +
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   3 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_v9.c   |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |  40 +--
 drivers/gpu/drm/amd/amdkfd/kfd_module.c            |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |  44 +++-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  97 ++++++--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  10 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |   2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  13 +
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |   1 -
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  69 +++++-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |  10 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  19 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c |  23 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  11 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   4 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |   2 +
 .../gpu/drm/amd/display/dc/dce/dce_panel_cntl.c    |  10 +-
 .../gpu/drm/amd/display/dc/dce/dce_panel_cntl.h    |   6 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |  32 ++-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.h      |   2 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   7 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c  |   1 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |   2 +-
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c    |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c  |   1 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c  |   1 +
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |  18 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c  |   1 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  | 194 +++++++++++----
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.h  |   5 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   2 +-
 .../display/dc/virtual/virtual_stream_encoder.c    |   7 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    | 139 ++++++++++-
 drivers/gpu/drm/amd/include/amd_shared.h           | 115 +++++++--
 .../drm/amd/include/asic_reg/gc/gc_9_4_1_offset.h  |   4 +-
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |  12 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   1 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  12 +
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |   4 +
 drivers/gpu/drm/amd/pm/inc/hwmgr.h                 |   5 +
 .../amd/pm/inc/smu11_driver_if_sienna_cichlid.h    |   4 +-
 drivers/gpu/drm/amd/pm/inc/smu_v11_0.h             |   2 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |  16 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |  90 ++++++-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h   |   2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |  16 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/smu9_smumgr.c  |   7 -
 .../drm/amd/pm/powerplay/smumgr/vega10_smumgr.c    |  12 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  32 +--
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  50 ++--
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |  61 ++---
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |   8 +-
 drivers/gpu/drm/radeon/radeon_vm.c                 |   2 +-
 drivers/gpu/drm/radeon/uvd_v1_0.c                  |   4 +-
 drivers/gpu/drm/radeon/uvd_v2_2.c                  |   2 +-
 drivers/gpu/drm/radeon/uvd_v4_2.c                  |   2 +-
 122 files changed, 2190 insertions(+), 743 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_gfxhub.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
