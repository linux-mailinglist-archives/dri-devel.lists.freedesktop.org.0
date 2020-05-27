Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A331E51A1
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 01:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBD76E11D;
	Wed, 27 May 2020 23:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48896E114;
 Wed, 27 May 2020 23:12:28 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id g18so3870228qtu.13;
 Wed, 27 May 2020 16:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CzJ+0g6yX69wJemo2qd9RCJV612c0MxfOAew0VNEBVM=;
 b=MkbcbSmSUIiY9ygD0aX9gm2YdEjeRMOpwsoak4FtccBwA62+XHfLISJUaG991l85/z
 aAYXkk+zm0Yg1lQa04/DGumic0p4qsLYK76fUK01hqgXARkXqaAlACetalyGzSseSPi/
 nZrTNebv0MKdR2Z+PowC0xa5NwaH04sw7cv8FCA4XTx2ds2shIvPBIZgXrwm7yxuh0yz
 ax2rRbawbJtPGCwUfaTIgkf8CbncjgnuKIg7LNcIn1md3J8cwiIjF4gru0JKTXqbTSl+
 ShssLk+L84J1Y6jcPPYBs4tqP0xUPSYA1bSUcgSKPx2oSzbD+LAuZ5CdhKpB0QKFWvpM
 ng8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CzJ+0g6yX69wJemo2qd9RCJV612c0MxfOAew0VNEBVM=;
 b=cZRb/dRIoW7EUYpVVRqCxdYrkQZo19QkKixoEF2y3O0035euBFhUwXu/kDiLnJLJ0c
 P0fJ0DMhc13rvvIOKvwlwXGQVuLt0zTzAX1BPvqTv4vstMy0bi/Pj/Hh7AOE/8gmAJny
 ppv9pHGzdtUYBMB8y+IGV1UzGFZYC77LybYs7URBP892Vk0g/Sl/qOhaK2qhrf90squB
 9R7bsL6YpopM08dcteUodEciP4uq8BJHrBesJ3kDgZafDhfwZNAa3ga6JfTcY5nQOJJd
 mDji10EkI6JPvSDHUzQdn3cQMbtRrKAaVMpHh/Uc2R6Nub3hVazR3L47c7eiTqkhK0L3
 6N0Q==
X-Gm-Message-State: AOAM5312AGaEk/Dwyp++BAAxPUIRjjwq4vh1HT9BAxdSxnIqlk/om4rO
 MMYzPpRkxR9+kGY5S8ecOZCSJEDT
X-Google-Smtp-Source: ABdhPJxyrKE23cQSBu9GNlyzWWj6RcZaw2vDgnwjxEIHnyC/38S+KIIoaDch84Xh5Py5Q9f2xlf0/Q==
X-Received: by 2002:ac8:e8f:: with SMTP id v15mr264444qti.391.1590621147573;
 Wed, 27 May 2020 16:12:27 -0700 (PDT)
Received: from localhost.localdomain ([71.51.180.250])
 by smtp.gmail.com with ESMTPSA id p25sm3694286qtj.18.2020.05.27.16.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 16:12:27 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd drm-next-5.8
Date: Wed, 27 May 2020 19:12:19 -0400
Message-Id: <20200527231219.3930-1-alexander.deucher@amd.com>
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

Fixes for 5.8.

The following changes since commit c41219fda6e04255c44d37fd2c0d898c1c46abf1:

  Merge tag 'drm-intel-next-fixes-2020-05-20' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2020-05-21 10:44:33 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-next-5.8-2020-05-27

for you to fetch changes up to 185082b679b4bd6dfb69764eaa89213b26f6f703:

  drm/amd/display: Fix potential integer wraparound resulting in a hang (2020-05-27 18:42:10 -0400)

----------------------------------------------------------------
amd-drm-next-5.8-2020-05-27:

amdgpu:
- SRIOV fixes
- RAS fixes
- VCN 2.5 DPG (Dynamic PowerGating) fixes
- FP16 updates for display
- CTF cleanups
- Display fixes
- Fix pcie bw sysfs handling
- Enable resizeable BAR support for gmc 10.x
- GFXOFF fixes for Raven
- PM sysfs handling fixes

amdkfd:
- Fix a race condition
- Warning fixes

----------------------------------------------------------------
Aishwarya Ramakrishnan (1):
      drm/amdkfd: Fix boolreturn.cocci warnings

Alan Swanson (1):
      drm/amdgpu: resize VRAM BAR for CPU access on gfx10

Alex Deucher (6):
      drm/amdgpu: improve error handling in pcie_bw
      drm/amdgpu: drop navi pcie bw callback
      drm/amdgpu: move discovery gfx config fetching
      drm/amdgpu: move gpu_info parsing after common early init
      drm/amdgpu: fix pm sysfs node handling (v2)
      drm/amdgpu: add apu flags (v2)

Aric Cyr (1):
      drm/amd/display: Fix potential integer wraparound resulting in a hang

Bhawanpreet Lakha (1):
      drm/amd/display: Handle GPU reset for DC block

Dan Carpenter (1):
      drm/amdgpu: off by one in amdgpu_device_attr_create_groups() error handling

Dmytro Laktyushkin (2):
      drm/amd/display: fix and simplify pipe split logic
      drm/amd/display: correct rn NUM_VMID

Evan Quan (2):
      drm/amd/powerplay: unify the prompts on thermal interrupts
      drm/amdkfd: report the real PCI bus number

Felix Kuehling (1):
      drm/amdgpu: Sync with VM root BO when switching VM to CPU update mode

Gustavo A. R. Silva (1):
      drm/amdgpu/smu10: Replace one-element array and use struct_size() helper

Harry Wentland (3):
      drm/amd/display: Add DC Debug mask to disable features for bringup
      drm/amd/display: Fix disable_stutter debug option
      drm/amd/display: Respect PP_STUTTER_MODE but don't override DC_DISABLE_STUTTER

Jack Zhang (1):
      drm/amdgpu fix incorrect sysfs remove behavior for xgmi

James Zhu (2):
      drm/amdgpu/jpeg2.5: Remove JPEG_ENC_MASK from clock ungating
      drm/amdgpu/vcn2.5: Remove old DPG workaround

Jinze Xu (1):
      drm/amd/display: Set/Reset avmute when disable/enable stream

John Clements (1):
      drm/amdgpu: resolve ras recovery vs smi race condition

Kevin Wang (2):
      drm/amdgpu: cleanup unnecessary virt sriov check in amdgpu attribute
      drm/amdgpu: fix device attribute node create failed with multi gpu

Likun Gao (1):
      drm/amdgpu: add condition to set MP1 state on gpu reset

Mario Kleiner (2):
      drm/amd/display: Expose support for xBGR ordered fp16 formats.
      drm/amd/display: Enable fp16 also on DCE-11.0 - DCE-12. (v2)

Nicholas Kazlauskas (2):
      drm/amd/display: Defer cursor lock until after VUPDATE
      drm/amd/display: Avoid pipe split when plane is too small

Nikola Cornij (1):
      drm/amd/display: Minimize DSC resource re-assignment

Philip Yang (1):
      drm/amdkfd: fix restore worker race condition

Rodrigo Siqueira (1):
      drm/amd/display: Remove dml_common_def file

Simon Ser (1):
      drm/amd/display: drop cursor position check in atomic test

Stylon Wang (1):
      drm/amd/display: Fix incorrectly pruned modes with deep color

Vladimir Stempen (1):
      drm/amd/display: DP training to set properly SCRAMBLING_DISABLE

chen gong (1):
      drm/amd/powerpay: Disable gfxoff when setting manual mode on picasso and raven

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dpm.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c             | 212 +++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h             |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  23 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  16 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |  14 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   5 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |   1 -
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   8 -
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  17 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |   9 -
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.c             |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 317 +++++++++++++++++----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   1 +
 drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c   |  21 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   8 +
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  27 ++
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  28 +-
 .../drm/amd/display/dc/dce112/dce112_resource.c    |   2 +-
 .../drm/amd/display/dc/dce120/dce120_resource.c    |   2 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c    |   1 -
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  74 ++++-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.h  |   5 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c  |   1 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.h    |   1 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c  |   1 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  | 189 ++++++------
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.h  |   7 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c    |   7 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c  |   1 +
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |   3 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |   2 -
 .../display/dc/dml/dcn20/display_rq_dlg_calc_20.h  |   1 -
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.h        |   1 -
 .../display/dc/dml/dcn21/display_rq_dlg_calc_21.h  |   2 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |   6 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |   2 -
 .../amd/display/dc/dml/display_rq_dlg_helpers.h    |   1 -
 .../amd/display/dc/dml/dml1_display_rq_dlg_calc.h  |   2 -
 .../gpu/drm/amd/display/dc/dml/dml_common_defs.c   |  43 ---
 .../gpu/drm/amd/display/dc/dml/dml_common_defs.h   |  37 ---
 .../gpu/drm/amd/display/dc/dml/dml_inline_defs.h   |  15 +-
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |   5 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |   2 +
 drivers/gpu/drm/amd/display/modules/vmid/vmid.c    |   7 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |  14 +
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c       |   6 +
 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c  |   9 +-
 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.h  |   2 +-
 drivers/gpu/drm/amd/powerplay/hwmgr/smu_helper.c   |  38 +--
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c          |  26 +-
 .../gpu/drm/amd/powerplay/smumgr/smu10_smumgr.c    |   3 +-
 65 files changed, 780 insertions(+), 535 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml/dml_common_defs.c
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml/dml_common_defs.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
