Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 205308324D1
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 08:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2C210E09E;
	Fri, 19 Jan 2024 07:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94F010E09E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 07:00:13 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-40e86a9fc4bso5631275e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 23:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705647552; x=1706252352; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dEGJX2ExdSxVIfQMACLKAruVtJHcFFyo9DUUdCgWpHs=;
 b=dLbWLpSYX2H6+7Mcx/P9dyAeFenyL7N4m8YWOZW45mo5pIc5oFp1sFLYUdn1hLNJei
 us1M/P7+w/bhZ7Xuk0mJkqyVQU3Agv/ZTU8Nx6eDFAcaDT6XRK8LCHJJDgZ1t9Ca7+bz
 xBi6R+fMwuSo9vOyJ0AE/CDjP9zbdkhKXaiO7yLbh6ETdKZkEav2pWEsRzHkJLCgUTtP
 MzcYYJ+GjpXpKk3Jh3yj/WZajUz7dS18FGq+D+gf1AMfWFuSKeQTn4sIvbWvtE2ge2J1
 VqtG6b/CIlNUve+iMcuQGOlIcMV6uhUaJmsxMJkz9EcDlg65+HhzWT2HlfH8r+ayB3lo
 WpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705647552; x=1706252352;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dEGJX2ExdSxVIfQMACLKAruVtJHcFFyo9DUUdCgWpHs=;
 b=FZ7qcCbI68ffxNZQERNkWT5ke4zjAqfQ03u3dBBdBZl25AmshVwxLfC7mafUjaZqa4
 WStJqTZZ2sKAnffViYpTjNKPrf9Ul6990AAGV+6eiHu6xtvidQt08M9vGpvCcZh6Zwee
 v25etu9Qs5J7XP60OKntIzlTJa7U0ehPCWMTccTY8EdpxNpcFh5iezTS24kyoRo3RXKG
 /vz6NzY1mWY6QrDdFJw1gUpHdKxFRt0P5uzVYroTNTv/BJ2LP4DLsWyldInRZlhPAtyT
 wV7opmP8or5gjN7WqimU2nVsxSk+FwCLUrGPMpeEQO4sScTD4/r1BTB62C0m4GgeCh3q
 8FmQ==
X-Gm-Message-State: AOJu0Yy0nUWnBWFFMtAl2VuioerE0mv1HgulOi7xoWk2Xw3LzSlL9Qif
 J4rUTVrxmBP1L4HXUlbBuQfSzyPkDWNFDs0NFwKuMSwyK2JPE7QIJ6bs432lTAcccqlrkUz3HWA
 QIp8MAENZk4h+JhZL/TN2zvUNHnJI4GSn5ho=
X-Google-Smtp-Source: AGHT+IG4zle8MUunjiLHKCWxHBtPPcU8C62sQR8A1Tj6NebKLtG+97GSNne8OJuYk8/zbaCl1bT4W0rRoZSQv451q0U=
X-Received: by 2002:a05:600c:54e7:b0:40e:5c65:6880 with SMTP id
 jb7-20020a05600c54e700b0040e5c656880mr1176042wmb.89.1705647551991; Thu, 18
 Jan 2024 22:59:11 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 19 Jan 2024 16:58:59 +1000
Message-ID: <CAPM=9txpkzp1nciq+8TrVU1pmsRC9LEVqLaQV9ug=XX0hnmLmw@mail.gmail.com>
Subject: [git pull] drm fixes for 6.8-rc1 (part two)
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Hope your power/internet stabilizes, this is the last set of fixes
before rc1 for drm. This is mostly amdgpu and xe fixes, with an amdkfd
and nouveau fix thrown in.

The amdgpu ones are just the usual couple of weeks of fixes. The xe
ones are bunch of cleanups for the new xe driver, the fix you put in
on the merge commit and the kconfig fix that was hiding the problem
from me are all in here, it seems to merge fine.

Let me know if there are any problems,

Dave.

drm-next-2024-01-19:
drm fixes for 6.8-rc1

amdgpu:
- DSC fixes
- DC resource pool fixes
- OTG fix
- DML2 fixes
- Aux fix
- GFX10 RLC firmware handling fix
- Revert a broken workaround for SMU 13.0.2
- DC writeback fix
- Enable gfxoff when ROCm apps are active on gfx11 with the proper FW versi=
on

amdkfd:
- Fix dma-buf exports using GEM handles

nouveau:
- fix a unneeded WARN_ON triggering

xe:
- Fix for definition of wakeref_t
- Fix for an error code aliasing
- Fix for VM_UNBIND_ALL in the case there are no bound VMAs
- Fixes for a number of __iomem address space mismatches reported by sparse
- Fixes for the assignment of exec_queue priority
- A Fix for skip_guc_pc not taking effect
- Workaround for a build problem on GCC 11
- A couple of fixes for error paths
- Fix a Flat CCS compression metadata copy issue
- Fix a misplace array bounds checking
- Don't have display support depend on EXPERT (as discussed on IRC)
The following changes since commit 205e18c13545ab43cc4fe4930732b4feef551198=
:

  nouveau/gsp: handle engines in runl without nonstall interrupts.
(2024-01-15 16:04:48 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2024-01-19

for you to fetch changes up to 009f0a64f9ccee9db9d758b883059e5c74bb7330:

  Merge tag 'drm-xe-next-fixes-2024-01-16' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2024-01-19
16:13:51 +1000)

----------------------------------------------------------------
drm fixes for 6.8-rc1

amdgpu:
- DSC fixes
- DC resource pool fixes
- OTG fix
- DML2 fixes
- Aux fix
- GFX10 RLC firmware handling fix
- Revert a broken workaround for SMU 13.0.2
- DC writeback fix
- Enable gfxoff when ROCm apps are active on gfx11 with the proper FW versi=
on

amdkfd:
- Fix dma-buf exports using GEM handles

nouveau:
- fix a unneeded WARN_ON triggering

xe:
- Fix for definition of wakeref_t
- Fix for an error code aliasing
- Fix for VM_UNBIND_ALL in the case there are no bound VMAs
- Fixes for a number of __iomem address space mismatches reported by sparse
- Fixes for the assignment of exec_queue priority
- A Fix for skip_guc_pc not taking effect
- Workaround for a build problem on GCC 11
- A couple of fixes for error paths
- Fix a Flat CCS compression metadata copy issue
- Fix a misplace array bounds checking
- Don't have display support depend on EXPERT (as discussed on IRC)

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: fix avg vs input power reporting on smu7
      drm/amdgpu: fall back to INPUT power for AVG power via INFO IOCTL
      drm/amdgpu/pm: clarify debugfs pm output
      drm/amdgpu: drop exp hw support check for GC 9.4.3

Aric Cyr (1):
      drm/amd/display: 3.2.266

Brian Welty (3):
      drm/xe: Fix guc_exec_queue_set_priority
      drm/xe: Fix modifying exec_queue priority in xe_migrate_init
      drm/xe: Fix bounds checking in __xe_bo_placement_for_flags()

Candice Li (2):
      drm/amdgpu: Drop unnecessary sentences about CE and deferred error.
      drm/amdgpu: Support poison error injection via ras_ctrl debugfs

Charlene Liu (2):
      drm/amd/display: Update z8 latency
      drm/amd/display: Add logging resource checks

Christian K=C3=B6nig (1):
      drm/amdgpu: revert "Adjust removal control flow for smu v13_0_2"

Christophe JAILLET (1):
      drm/amd/display: Fix a switch statement in
populate_dml_output_cfg_from_stream_state()

Dafna Hirschfeld (1):
      drm/amdkfd: fixes for HMM mem allocation

Dan Carpenter (3):
      drm/xe/device: clean up on error in probe()
      drm/xe/selftests: Fix an error pointer dereference bug
      drm/xe: unlock on error path in xe_vm_add_compute_exec_queue()

Daniel Miess (1):
      Revert "drm/amd/display: Fix conversions between bytes and KB"

Dave Airlie (3):
      Merge tag 'amd-drm-fixes-6.8-2024-01-18' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      nouveau/vmm: don't set addr on the fail path to avoid warning
      Merge tag 'drm-xe-next-fixes-2024-01-16' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next

Dillon Varone (1):
      drm/amd/display: Init link enc resources in dc_state only if
res_pool presents

Felix Kuehling (2):
      drm/amdkfd: Fix lock dependency warning
      drm/amdkfd: Fix sparse __rcu annotation warnings

Flora Cui (1):
      drm/amdkfd: init drm_client with funcs hook

George Shen (1):
      drm/amd/display: Disconnect phantom pipe OPP from OPTC being disabled

Hawking Zhang (1):
      drm/amdgpu: Packed socket_id to ras feature mask

Ilya Bakoulin (1):
      drm/amd/display: Clear OPTC mem select on disable

Ivan Lipski (1):
      Revert "drm/amd/display: fix bandwidth validation failure on DCN 2.1"

James Zhu (1):
      drm/amdgpu: make a correction on comment

Jani Nikula (1):
      drm/xe: display support should not depend on EXPERT

Jos=C3=A9 Roberto de Souza (1):
      drm/xe: Fix definition of intel_wakeref_t

Le Ma (3):
      Revert "drm/amdgpu: add param to specify fw bo location for
front-door loading"
      drm/amdgpu: add debug flag to place fw bo on vram for frontdoor loadi=
ng
      drm/amdgpu: move debug options init prior to amdgpu device init

Lijo Lazar (2):
      drm/amd/pm: Add error log for smu v13.0.6 reset
      drm/amd/pm: Fix smuv13.0.6 current clock reporting

Likun Gao (1):
      drm/amdgpu: correct the cu count for gfx v11

Ma Jun (1):
      drm/amdgpu: Fix the null pointer when load rlc firmware

Martin Leung (2):
      drm/amd/display: revert "for FPO & SubVP/DRR config program vmin/max"
      drm/amd/display: revert "Optimize VRR updates to only necessary ones"

Martin Tsai (1):
      drm/amd/display: To adjust dprefclk by down spread percentage

Matthew Brost (1):
      drm/xe: Fix exec IOCTL long running exec queue ring full condition

Meenakshikumar Somasundaram (1):
      drm/amd/display: Dpia hpd status not in sync after S4

Melissa Wen (1):
      drm/amd/display: cleanup inconsistent indenting in amdgpu_dm_color

Nathan Chancellor (1):
      drm/amd/display: Avoid enum conversion warning

Nicholas Kazlauskas (1):
      drm/amd/display: Port DENTIST hang and TDR fixes to OTG disable W/A

Ori Messinger (1):
      drm/amdgpu: Enable GFXOFF for Compute on GFX11

Ovidiu Bunea (1):
      drm/amd/display: Fix DML2 watermark calculation

Paul E. McKenney (1):
      drm/xe: Fix build bug for GCC 11

Peichen Huang (1):
      drm/amd/display: Request usb4 bw for mst streams

Philip Yang (1):
      drm/amdkfd: Fix lock dependency warning with srcu

Srinivasan Shanmugam (8):
      drm/amd/powerplay: Fix kzalloc parameter 'ATOM_Tonga_PPM_Table'
in 'get_platform_power_management_table()'
      drm/amdgpu: Fix with right return code '-EIO' in
'amdgpu_gmc_vram_checking()'
      drm/amdgpu: Fix unsigned comparison with less than zero in
vpe_u1_8_from_fraction()
      drm/amdgpu: Release 'adev->pm.fw' before return in
'amdgpu_device_need_post()'
      drm/amd/display: Fix variable deferencing before NULL check in
edp_setup_replay()
      drm/amdkfd: Fix 'node' NULL check in 'svm_range_get_range_boundaries(=
)'
      drm/amd/display: Fix late derefrence 'dsc' check in
'link_set_dsc_pps_packet()'
      drm/amd/display: Drop 'acrtc' and add 'new_crtc_state' NULL
check for writeback requests.

Thomas Hellstr=C3=B6m (6):
      drm/xe/vm: Fix an error path
      drm/xe: Use __iomem for the regs pointer
      drm/xe: Annotate xe_mem_region::mapping with __iomem
      drm/xe: Annotate multiple mmio pointers with __iomem
      drm/xe: Annotate xe_ttm_stolen_mgr::mapping with __iomem
      drm/xe/migrate: Fix CCS copy for small VRAM copy chunks

Victor Lu (1):
      drm/amdgpu: Do not program VM_L2_CNTL under SRIOV

Vinay Belgaumkar (1):
      drm/xe: Check skip_guc_pc before setting SLPC flag

Wayne Lin (1):
      drm/amd/display: Align the returned error code with legacy DP

Yifan Zhang (3):
      drm/amdgpu: update headers for nbio v7.11
      drm/amdgpu: update ATHUB_MISC_CNTL offset for athub v3.3
      drm/amdgpu: update regGL2C_CTRL4 value in golden setting

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  33 +----
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  47 ++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  21 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  26 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |   1 -
 drivers/gpu/drm/amd/amdgpu/athub_v3_0.c            |   8 ++
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  15 +--
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   5 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |  10 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  42 +++----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   8 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |   2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   5 +
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |  92 ++++++++++++--
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.h |  11 ++
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  18 ++-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  18 +--
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |   8 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   3 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |   2 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |  12 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |   2 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |   9 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |  14 +++
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  11 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |   6 +-
 .../drm/amd/display/dc/dml2/display_mode_core.c    |  32 ++---
 .../amd/display/dc/dml2/dml2_translation_helper.c  |   2 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |   2 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |   2 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |  45 +------
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |   1 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |   3 -
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |  50 ++++++--
 .../gpu/drm/amd/display/dc/link/link_validation.c  |  60 ++++++++--
 .../amd/display/dc/link/protocols/link_dp_dpia.c   |  36 +++---
 .../display/dc/link/protocols/link_dp_dpia_bw.c    |  60 +++++++---
 .../display/dc/link/protocols/link_dp_dpia_bw.h    |   9 ++
 .../dc/link/protocols/link_edp_panel_control.c     |  11 +-
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c |  22 +++-
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c |  15 ++-
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |   2 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.h |   3 +
 .../display/dc/resource/dcn321/dcn321_resource.c   |   2 +-
 drivers/gpu/drm/amd/display/include/audio_types.h  |   2 +-
 .../amd/include/asic_reg/nbio/nbio_7_11_0_offset.h |   8 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  28 +++--
 .../amd/pm/powerplay/hwmgr/process_pptables_v1_0.c |   2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |  17 ++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  15 ++-
 drivers/gpu/drm/nouveau/nouveau_vmm.c              |   3 +
 drivers/gpu/drm/xe/Kconfig                         |   2 +-
 drivers/gpu/drm/xe/Makefile                        |   1 -
 .../gpu/drm/xe/compat-i915-headers/intel_wakeref.h |   2 +-
 drivers/gpu/drm/xe/tests/xe_bo.c                   |   5 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c              |   2 +-
 drivers/gpu/drm/xe/xe_bo.c                         |  16 +--
 drivers/gpu/drm/xe/xe_device.c                     |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h               |   8 +-
 drivers/gpu/drm/xe/xe_exec.c                       |   7 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                 |   5 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h           |   6 +-
 drivers/gpu/drm/xe/xe_gt_freq.c                    |   3 +
 drivers/gpu/drm/xe/xe_guc.c                        |   7 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |   7 +-
 drivers/gpu/drm/xe/xe_migrate.c                    | 133 +++++++++++++----=
----
 drivers/gpu/drm/xe/xe_mmio.c                       |   2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c             |   4 +-
 drivers/gpu/drm/xe/xe_vm.c                         |  15 ++-
 86 files changed, 693 insertions(+), 464 deletions(-)
