Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A822EFAFC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 23:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455CE6E85B;
	Fri,  8 Jan 2021 22:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67F16E85A;
 Fri,  8 Jan 2021 22:18:25 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id e22so10766975iom.5;
 Fri, 08 Jan 2021 14:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZAA4GEabP2WbqMGV6M0QYIgP9gptr1kSSDvRx2PFu9Q=;
 b=LbrSWgU2FrFicKfYApwqmep5Lv0BQyathar2eHiYAsC/io+vfkSlY9t4WarObRgQJH
 BpspHUGXkUCii7nyJO1gx/X5UT1kg7cy2s1zuP9+exjKlEO3wESHUKcxFMRhHg4aClq9
 5XHixxVGAsMYdZ9Ockh3Bdm+8emelwN5VoPJYpluUsOWT1DSp4VqzkYJ6yEgF/7A1N60
 oeHnLvcS1IJeHYETY04Q2FIIU1g6OeAF14ZKBzrYike1/Zbe41GV0bsDm3qMBXwJHvV7
 pHgTE7jC6e64s0+hRzjla64UOgafO1JYp5S9NxYnr9FM8IYivgKFeJ8jgf9IA2z+3RWK
 tYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZAA4GEabP2WbqMGV6M0QYIgP9gptr1kSSDvRx2PFu9Q=;
 b=Op6WlPs4nw8saU4spR4ss+u0vnsrCJNggrk8D5C/9f77jdiBYGpZgjw6MbviyIL+Gn
 /p6oz4DjuEMnfJXllb8wbfZDFFyRUZnxZEsksyEINtN1ZHEYkM+g9FamqUWj8mUSEDeY
 9XS1rc5cpSVc13kFS3qHfyKhWLicNnlmbk6MhCDn/gPpLm0Y2Gj2m87o2ryqiRrzzCuh
 2m8g9vJZVDukARIfm7x2JnGfiAeb0tr75feJ9oULvoOpgmZo60WjWlVxicdmnS64BMaO
 gGXVLGZL1jVHgbfF2WYnEN7x4xdfdyCiunbfctMsKVSEFLSD7x8DzmoWWwtoXctjEmlD
 51Ag==
X-Gm-Message-State: AOAM530JgOYWkNPkj+9anJkwB+cEYy7XyCyy/5MHUBEPURdWAqVxBmfp
 0fCCUrkcdlOkP2Ub3IuTAMsQVnclg2A=
X-Google-Smtp-Source: ABdhPJyaBspF8HfBg9g2hrc72ZRdxyNg0Xz3+Ig8YPS+5pZE576mAb2dVE2o/jLwQt0XMZm7Zqt5KQ==
X-Received: by 2002:a05:6602:1cb:: with SMTP id
 w11mr6989282iot.45.1610144304711; 
 Fri, 08 Jan 2021 14:18:24 -0800 (PST)
Received: from localhost.localdomain ([192.161.78.241])
 by smtp.gmail.com with ESMTPSA id y5sm7944732ilh.24.2021.01.08.14.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 14:18:24 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] radeon, amdgpu drm-next-5.12
Date: Fri,  8 Jan 2021 17:18:11 -0500
Message-Id: <20210108221811.3868-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.29.2
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

First set of new changes for 5.12.

The following changes since commit a135a1b4c4db1f3b8cbed9676a40ede39feb3362:

  drm/amd/display: Fix memory leaks in S3 resume (2020-12-23 15:03:15 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.12-2021-01-08

for you to fetch changes up to 044a48f420b9d3c19a135b821c34de5b2bee4075:

  drm/amdgpu: fix DRM_INFO flood if display core is not supported (bug 210921) (2021-01-08 15:18:57 -0500)

----------------------------------------------------------------
amd-drm-next-5.12-2021-01-08:

amdgpu:
- Rework IH ring handling on vega and navi
- Rework HDP handling for vega and navi
- swSMU documenation updates
- Overdrive support for Sienna Cichlid and newer asics
- swSMU updates for vangogh
- swSMU updates for renoir
- Enable FP16 on DCE8-11
- Misc code cleanups and bug fixes

radeon:
- Fixes for platforms that can't access PCI resources correctly
- Misc code cleanups

----------------------------------------------------------------
Alex Deucher (6):
      drm/amdgpu: fix handling of irq domains on soc15 and newer GPUs
      drm/amdkfd: check both client id and src id in interrupt handlers
      drm/amdgpu: take runtime pm reference when we attach a buffer
      drm/amdgpu/display: drop DCN support for aarch64
      Revert "drm/amd/display: Fix memory leaks in S3 resume"
      drm/amdgpu/display: fix build with CONFIG_DRM_AMD_DC_DCN disabled

Alexandre Demers (1):
      drm/amdgpu: fix DRM_INFO flood if display core is not supported (bug 210921)

Arnd Bergmann (1):
      drm/amd/display: Fix unused variable warning

Bhawanpreet Lakha (1):
      drm/amd/display: enable idle optimizations for linux (MALL stutter)

Chen Li (2):
      drm/radeon: use writel to avoid gcc optimization v3
      drm/amdgpu: use GTT for uvd_get_create/destory_msg

Chenyang Li (1):
      drm/amdgpu: Fix macro name _AMDGPU_TRACE_H_ in preprocessor if condition

Defang Bo (1):
      drm/amdgpu: Add check to prevent IH overflow

Dennis Li (3):
      drm/amdgpu: fix a memory protection fault when remove amdgpu device
      drm/amdgpu: fix a GPU hang issue when remove device
      drm/amdgpu: fix no bad_pages issue after umc ue injection

Emily.Deng (2):
      drm/amdgpu: Add new mode 2560x1440
      drm/amdgpu: Correct the read sclk for navi10

Evan Quan (3):
      drm/amd/pm: populate Sienna Cichlid default overdrive table settings
      drm/amd/pm: enable Sienna Cichlid overdrive support
      drm/amd/pm: support overdrive vddgfx offset setting(V2)

Hawking Zhang (33):
      drm/amdgpu: add amdgpu_ih_regs structure
      drm/amdgpu: add helper to init ih ring regs for vega10
      drm/amdgpu: add helper to enable an ih ring for vega10
      drm/amdgpu: add helper to toggle ih ring interrupts for vega10
      drm/amdgpu: switch to ih_init_register_offset for vega10
      drm/amdgpu: switch to ih_toggle_interrupts for vega10
      drm/amdgpu: switch to ih_enable_ring for vega10
      drm/amdgpu: use cached ih rb control reg offsets for vega10
      drm/amdgpu: correct ih cg programming for vega10 ih block
      drm/amdgpu: add helper to init ih ring regs for navi10
      drm/amdgpu: add helper to enable an ih ring for navi10
      drm/amdgpu: add helper to toggle ih ring interrupts for navi10
      drm/amdgpu: switch to ih_init_register_offset for navi10
      drm/amdgpu: switch to ih_toggle_interrupts for navi10
      drm/amdgpu: switch to ih_enable_ring for navi10
      drm/amdgpu: use cached ih rb control reg offsets for navi10
      drm/amdgpu: add a helper function to decode iv
      drm/amdgpu: switch to common decode iv helper
      drm/amdgpu: add osssys v4_2 ip headers (v2)
      drm/amdgpu: create vega20 ih blocks
      drm/amdgpu: reroute vmc/utcl2 interrupts to ih ring 1 for arcturus
      drm/amdgpu: switch to vega20 ih block for vega20/arcturus
      drm/amdgpu: retire the vega20 code path from navi10 ih block
      drm/amdgpu: correct ih_chicken programming for vega10/vega20 ih blocks
      drm/amdgpu: drop IH_CHICKEN programming from vega10 ih block
      drm/amdgpu: drop ih reroute function from psp v11
      drm/amdgpu: don't create ih ring 1 and ring 2 for APU
      drm/amdgpu: enable software ih ring for vega20 ih block
      drm/amdgpu: set ih soft ring enabled flag for vega and navi
      drm/amdgpu: de-initialize software ih ring
      drm/amdgpu: drop psp ih programming for sriov guest on navi
      drm/amdgpu: switched to cached noretry setting for vangogh
      drm/amdgpu: add amdgpu_hdp structure

Jiansong Chen (1):
      drm/amdgpu: remove unnecessary asic check for sdma5.2

Jiawei Gu (2):
      drm/amdgpu: fix potential NULL pointer when check_atom_bios() fails
      drm/amdgpu: fix potential memory leak during navi12 deinitialization

Jinzhou Su (1):
      drm/amd/pm: Add interface for request WGPs

John Clements (2):
      drm/amd/pm: updated PM to I2C controller port on sienna cichlid
      drm/amdgpu: enable ras eeprom support for sienna cichlid

Joshua Aberback (2):
      drm/amd/display: Update idle optimization handling
      drm/amd/display: Create and Destroy PSR resources for DCN302

Kevin Wang (1):
      drm/amd/display: fix sysfs amdgpu_current_backlight_pwm NULL pointer issue

Likun Gao (6):
      drm/amdgpu: add hdp version 4 functions
      drm/amdgpu: add hdp version 5 functions
      drm/amdgpu: switch hdp callback functions for hdp v4
      drm/amdgpu: switch hdp callback functions for hdp v5
      drm/amdgpu: remove redundant logic related HDP
      drm/amdgpu: remove redundant include of navi10_enum

Mario Kleiner (2):
      drm/amd/display: Check plane scaling against format specific hw plane caps.
      drm/amd/display: Enable fp16 also on DCE-8/10/11.

Markus Elfring (2):
      drm/amd/display: Return directly after a failed kzalloc() in dc_create()
      drm/amd/display: Use common error handling code in dc_create()

Ryan Taylor (1):
      drm/amd/pm: add pptable_funcs documentation (v3)

Tao Zhou (1):
      drm/amdkfd: check more client ids in interrupt handler

Tian Tao (3):
      drm/amd/display: remove unused including <linux/version.h>
      drm/amd/display: remove useless else if
      drm/amd/display: fix comparison pointer to bool warning in dc.c

Victor Zhao (1):
      drm/amdgpu/psp: fix psp gfx ctrl cmds

Xiaojian Du (16):
      drm/amd/pm: correct the sensor value of power for vangogh
      drm/amd/pm: add support to umd P-state "fetch" function for vangogh
      drm/amd/pm: add new feature map macros to resolve duplicate name
      drm/amd/pm: add two new sysfs nodes for vangogh
      drm/amd/pm: enable the "fetch" function of pp_dpm_vclk/dclk for vangogh
      drm/amd/pm: improve the fine grain tuning function for RV/RV2/PCO
      drm/amd/pm: add the fine grain tuning function for renoir
      drm/amd/pm: enable the fine grain tuning function for renoir
      drm/amd/pm: add some basic functions to support umd P-state function for vangogh.
      drm/amd/pm: add some basic functions to support umd P-state function for vangogh.
      drm/amd/pm: add support to umd P-state function for vangogh
      drm/amd/pm: fix the failure when change power profile for renoir
      drm/amd/pm: enable dclk/vclk dpm function in "auto" power profile for vangogh
      drm/amd/pm: improve the fine grain tuning function for RV/RV2/PCO
      drm/amd/pm: add the parameters of power profiles for vangogh
      drm/amd/pm: modify the fine grain tuning function for Renoir

Zheng Yongjun (1):
      gpu/drm/radeon: use DIV_ROUND_UP macro to do calculation

pengzhou (1):
      drm/amdgpu: do optimization for psp command submit

 drivers/gpu/drm/amd/amdgpu/Makefile                |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |    1 -
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h            |   40 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c             |   43 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h             |   17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/athub_v2_0.c            |    1 -
 drivers/gpu/drm/amd/amdgpu/athub_v2_1.c            |    1 -
 drivers/gpu/drm/amd/amdgpu/cz_ih.c                 |   37 +-
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c           |    5 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    9 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   14 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   39 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |  137 +++
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.h              |   31 +
 drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c              |  212 ++++
 drivers/gpu/drm/amd/amdgpu/hdp_v5_0.h              |   31 +
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c            |   36 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |  478 +++----
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |   10 -
 drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c             |   23 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c             |   10 -
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             |   10 -
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |   10 -
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  160 +--
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |    2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |   38 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |    1 -
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |    1 -
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |   31 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  100 +-
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c              |   37 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |    1 -
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |    1 -
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c             |  483 +++-----
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |  700 +++++++++++
 drivers/gpu/drm/amd/amdgpu/vega20_ih.h             |   30 +
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |   54 +-
 drivers/gpu/drm/amd/display/Kconfig                |    2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  112 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    7 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h  |    2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |    1 -
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    1 -
 drivers/gpu/drm/amd/display/dc/calcs/Makefile      |    4 -
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |   21 -
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   31 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |    7 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |    4 +
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |    1 +
 .../drm/amd/display/dc/dce100/dce100_resource.c    |    2 +-
 .../drm/amd/display/dc/dce110/dce110_resource.c    |    2 +-
 .../gpu/drm/amd/display/dc/dce80/dce80_resource.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn10/Makefile      |    7 -
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |    7 -
 drivers/gpu/drm/amd/display/dc/dcn20/Makefile      |    4 -
 drivers/gpu/drm/amd/display/dc/dcn21/Makefile      |    4 -
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |    5 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   13 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h |    2 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c  |    1 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |    4 +
 drivers/gpu/drm/amd/display/dc/dcn301/Makefile     |    4 -
 drivers/gpu/drm/amd/display/dc/dcn302/Makefile     |    4 -
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |   15 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |    4 -
 drivers/gpu/drm/amd/display/dc/dsc/Makefile        |    4 -
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |    2 +
 drivers/gpu/drm/amd/display/dc/os_types.h          |    4 -
 .../amd/include/asic_reg/oss/osssys_4_2_0_offset.h |  345 ++++++
 .../include/asic_reg/oss/osssys_4_2_0_sh_mask.h    | 1300 ++++++++++++++++++++
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |    3 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  163 ++-
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            |  535 ++++++++
 .../gpu/drm/amd/pm/inc/smu11_driver_if_vangogh.h   |    1 -
 drivers/gpu/drm/amd/pm/inc/smu_types.h             |    2 +
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |  166 ++-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h   |    3 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   10 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |    2 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  332 ++++-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  881 ++++++++++++-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.h   |   26 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |  224 +++-
 drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |    1 +
 drivers/gpu/drm/radeon/r600_cs.c                   |    4 +-
 drivers/gpu/drm/radeon/radeon_uvd.c                |   38 +-
 100 files changed, 5956 insertions(+), 1298 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/hdp_v5_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vega20_ih.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vega20_ih.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_2_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_2_0_sh_mask.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
