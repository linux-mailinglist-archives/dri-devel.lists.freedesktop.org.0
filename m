Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462AE18BED0
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 18:54:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E176EA46;
	Thu, 19 Mar 2020 17:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8696EA45;
 Thu, 19 Mar 2020 17:54:41 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id a23so1385574plm.1;
 Thu, 19 Mar 2020 10:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DW03TKxNfUXb5qdqLQrUX4+j16qkVQ3MLi+SIKV61lg=;
 b=LXRNHnTL4lP/SnMnOr7ENn13RWIuNDiP92Lp7ZUp+hfyFpFatYAaAF1pkEW1ajGefB
 8qHMAAM54zgoae09lpz/TKE7DHIf9aJLBmXG+36hLMrkvSZFFyFtUn3/P37/k52mDJQT
 OV/OFz4o9sNs4bk6DB1xEELk6RXcbeqntNLdG6Q49ds2ZHxuO4cEImTYk7WbRhU/BiNs
 8g/Y9L/UuLGk01w1Bi2eXnxG3W70XoTzppgFhN8cUsh0zAgKPQYIQ6Sk1Y4iVWa2+YVt
 r26d8l1fBVx43onByRMiuPzG/JGPbJrrjmBTDHm8QABRx1+PVnXKNAwBlFLNqZCrQfgJ
 o6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DW03TKxNfUXb5qdqLQrUX4+j16qkVQ3MLi+SIKV61lg=;
 b=Vwdp4gtob8z5Bu+E4lcO3s3UNrAaymVXhEFCaP8zmjpPVtHvcSpbBQnsZxLCNwnwRw
 Hfx4WVIBk25QPhqaYWiKHWnJ46+bdUofDUk01YcMiX1XwD1SaHv7vg2Bpom/3Y93xtM9
 mqbpuCDOA93KGs+qde+9PNb14b9mg/njcv0dl4iumLOztum6fnWFiKTbOI4z57/gHXZU
 JmH60gNyHgcazImrozDaVFHuqqRYQwEPBJDSXxJSyc0R4W8A43agJXd8aGbDvZTo1b4F
 MQfqwsTIlxcF85fEREI2ajx6O5PhV0sxMQudowK7MJ0QvnuhgOkKoiq71ScpkJzaaszm
 2vBw==
X-Gm-Message-State: ANhLgQ3GWRHp7Ica8zo5LYRQAcbMODHLkJVc84knffM97CO3wmDtDPiJ
 GI9qyK5exoL6jkmjzL8cUuE6r/Is
X-Google-Smtp-Source: ADFU+vtvvr/WXYLLq8jJ5zMkTwHcyxzX59Ql2Wn3k13jtAoM8AoTbPP4gxb5el+WTuTaxjm6dANMTw==
X-Received: by 2002:a17:902:a612:: with SMTP id
 u18mr4726577plq.1.1584640480255; 
 Thu, 19 Mar 2020 10:54:40 -0700 (PDT)
Received: from localhost.localdomain ([71.219.40.23])
 by smtp.gmail.com with ESMTPSA id w6sm3034723pfn.104.2020.03.19.10.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 10:54:39 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, scheduler drm-next-5.7
Date: Thu, 19 Mar 2020 13:54:18 -0400
Message-Id: <20200319175418.4237-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.1
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

Last round of stuff for 5.7.  Mostly bug fixes.

The following changes since commit 69ddce0970d9d1de63bed9c24eefa0814db29a5a:

  Merge tag 'amd-drm-next-5.7-2020-03-10' of git://people.freedesktop.org/~agd5f/linux into drm-next (2020-03-13 09:09:11 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-next-5.7-2020-03-19

for you to fetch changes up to 8cd296082cd9c2adfa5c772154780b21e990a92a:

  drm: amd: fix spelling mistake "shoudn't" -> "shouldn't" (2020-03-19 00:03:05 -0400)

----------------------------------------------------------------
amd-drm-next-5.7-2020-03-19:

amdgpu:
- SR-IOV fixes
- RAS fixes
- Fallthrough cleanups
- Kconfig fix for ACP
- Fix load balancing with VCN
- DC fixes
- GPU reset fixes
- Various cleanups

scheduler:
- Revert job distribution optimization
- Add a helper to pick the least loaded scheduler

----------------------------------------------------------------
Andrey Grodzovsky (1):
      drm/amdgpu: Move EEPROM I2C adapter to amdgpu_device

Charlene Liu (1):
      drm/amd/display: guard DPPHY_Internal_ctrl

Colin Ian King (1):
      drm: amd: fix spelling mistake "shoudn't" -> "shouldn't"

Dan Carpenter (3):
      drm/amd/display: clean up a condition in dmub_psr_copy_settings()
      drm/amdgpu/display: clean up some indenting
      drm/amd/display: Possible divide by zero in set_speed()

Dennis Li (1):
      drm/amdgpu: add codes to clear AccVGPR for arcturus

Dmytro Laktyushkin (2):
      drm/amd/display: fix split threshold w/a to work with mpo
      drm/amd/display: add on demand pipe merge logic for dcn2+

Evan Quan (1):
      drm/amdgpu: add fbdev suspend/resume on gpu reset

Guchun Chen (1):
      drm/amdgpu: update ras capability's query based on mem ecc configuration

Hawking Zhang (1):
      drm/amdgpu: check GFX RAS capability before reset counters

Hersen Wu (1):
      drm/amd/display: update connector->display_info after read edid

Isabel Zhang (1):
      drm/amd/display: Remove redundant hdcp display state

Jack Zhang (1):
      drm/amdgpu/sriov refine vcn_v2_5_early_init func

James Zhu (3):
      drm/amdgpu: fix typo for vcn1 idle check
      drm/amdgpu: fix typo for vcn2/jpeg2 idle check
      drm/amdgpu: fix typo for vcn2.5/jpeg2.5 idle check

Jerry (Fangzhi) Zuo (1):
      drm/amd/display: Fix test pattern color space inconsistency for Linux

Joe Perches (4):
      AMD DISPLAY CORE: Use fallthrough;
      AMD POWERPLAY: Use fallthrough;
      drm/amd/powerplay: Move fallthrough; into containing #ifdef/#endif
      AMD KFD: Use fallthrough;

John Clements (2):
      drm/amdgpu: resolve failed error inject msg
      amd/powerplay: arcturus baco reset disable all features

Kevin Wang (1):
      drm/amdgpu/swsmu: clean up unused header in swsmu

Lucas Stach (1):
      drm/scheduler: fix inconsistent locking of job_list_lock

Lyude Paul (1):
      drm/amdgpu: Stop using the DRIVER debugging flag for vblank debugging messages

Mario Kleiner (1):
      drm/amd/display: Add link_rate quirk for Apple 15" MBP 2017

Martin Tsai (1):
      drm/amd/display: differentiate vsc sdp colorimetry use criteria between MST and SST

Monk Liu (1):
      drm/amdgpu: revise RLCG access path

Nathan Chancellor (1):
      drm/amdgpu: Remove unnecessary variable shadow in gfx_v9_0_rlcg_wreg

Nicholas Kazlauskas (2):
      drm/amd/display: Pass triplebuffer surface flip flags down to plane state
      drm/amd/display: Explicitly disable triplebuffer flips

Nikola Cornij (1):
      drm/amd/display: Remove connect DIG FE to its BE during timing programming

Nirmoy Das (3):
      drm/amdgpu: fix switch-case indentation
      drm/sched: implement and export drm_sched_pick_best
      drm/amdgpu: disable gpu_sched load balancer for vcn jobs

Randy Dunlap (1):
      drm: amd/acp: fix broken menu structure

Robert Beckett (1):
      drm/sched: add run job trace

Roman Li (1):
      drm/amd/display: Remove PSR dependency on swizzle mode

Stanley.Yang (3):
      drm/amdgpu: use amdgpu_ras.h in amdgpu_debugfs.c
      drm/amd/display: fix typos for dcn20_funcs and dcn21_funcs struct
      drm/amdgpu: fix warning in ras_debugfs_create_all()

Sung Lee (2):
      drm/amd/display: Revert "DCN2.x Do not program DPPCLK if same value"
      drm/amd/display: Program self refresh control register on boot

Tom St Denis (1):
      drm/amd/amdgpu: Fix GPR read from debugfs (v2)

Wenjing Liu (1):
      drm/amd/display: remove magic numbers in hdcp_ddc

Wyatt Wood (3):
      drm/amd/display: Set disable_dmcu flag properly per asic
      drm/amd/display: Fallback to dmcub for psr when dmcu is disabled
      drm/amd/display: Allocate scratch space for DMUB CW7

Yintian Tao (1):
      drm/amdgpu: miss PRT case when bo update

Yongqiang Sun (3):
      drm/amd/display: workaround for HDMI hotplug in DPMSOFF state
      drm/amd/display: combine watermark change and clock change for update clocks.
      drm/amd/display: DPP DTO isn't update properly.

Zhigang Luo (1):
      drm/amdgpu: add CAP fw loading

changzhu (1):
      Revert "drm/scheduler: improve job distribution with multiple queues"

xinhui pan (1):
      drm_amdgpu: Add job fence to resv conditionally

 drivers/gpu/drm/amd/acp/Kconfig                    |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   2 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |  86 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  54 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_dpm.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  31 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |  48 +----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |  11 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  74 ++++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              | 237 ++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c              |   3 +
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  38 ++--
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |   6 +
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c              |  24 +++
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c         |  14 +-
 drivers/gpu/drm/amd/amdgpu/soc15.h                 |   7 +
 drivers/gpu/drm/amd/amdgpu/soc15_common.h          |   5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  37 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  58 ++---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   3 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  14 ++
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |   4 +-
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |   5 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  15 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  11 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  20 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c |   2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   7 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   5 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |   2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c    |  23 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c |   2 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   8 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   7 +-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.h  |   2 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.c  |   2 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  10 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c  |   1 -
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |  99 +++++----
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.h  |   9 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c |  22 ++
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.h |   3 +
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c  |   2 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |   6 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |   1 -
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |   3 +-
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |   2 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_srv.h    |   3 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |  17 +-
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.c    |   5 +-
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h    |  28 +--
 .../drm/amd/display/modules/hdcp/hdcp1_execution.c |   2 +-
 .../drm/amd/display/modules/hdcp/hdcp2_execution.c |   2 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c    |  12 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |  37 ++--
 drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |   1 -
 .../drm/amd/display/modules/inc/mod_info_packet.h  |   3 +-
 .../amd/display/modules/info_packet/info_packet.c  |  20 +-
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c         |  34 ++-
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c       |   5 +-
 drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c   |   6 +-
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c         |   2 -
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c         |   1 -
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c          |   1 -
 drivers/gpu/drm/amd/powerplay/smu_v12_0.c          |   1 -
 .../gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c   |  11 +
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c         |   1 -
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h    |  27 +++
 drivers/gpu/drm/scheduler/sched_entity.c           |  38 +---
 drivers/gpu/drm/scheduler/sched_main.c             |  86 +++++---
 include/drm/gpu_scheduler.h                        |   9 +-
 88 files changed, 955 insertions(+), 503 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
