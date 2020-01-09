Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F659136393
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 00:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27CE6E97B;
	Thu,  9 Jan 2020 23:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636816E976;
 Thu,  9 Jan 2020 23:03:50 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id j9so240729qkk.1;
 Thu, 09 Jan 2020 15:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KNQPaJhk2/mnO3QLrI8HpX0E/B1NE5q9uvbZF3YfM8U=;
 b=c+xu7yMzG3c/e1bgTsC/ie03SHTJtBAi3NMeQizUwkpGQyy90bgxcNLhgTHhS/x5Ip
 QTMKGye0Aj00S7JGm6WcdgYGr6fKuxvm4hGd2rZ7YF6iKT9UyCcqf+Gv/EqJ3rQsemix
 FmgO/AhWqIv6hnwnFDBHWvRcOSvgHIZIw68NFcygxwFXbLmHJ2c7BDCjlZgxk9RLZmpb
 DSOjLv9h9GCfXWLxGohUM3sdac4DuKBAuufqcTsIRWv0ALN0wjxPsQCceh85fiVvK4h8
 RJiuYNesCeYasH8Iwi9ZCyKLdOf6ptm0dazA1RQaVgAjbxpnoNNqyHY2ODvBAKcPkDGK
 d0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KNQPaJhk2/mnO3QLrI8HpX0E/B1NE5q9uvbZF3YfM8U=;
 b=X15vZuIqrZWIFNHDUAg8FiJNvQFA9VKhHFKqtCJoWg9Iz4V9x0wEqFb98G4ILY0Tqm
 KuqFkm9ASBrU/e3s8xKPVAFbZD88Uy7zjslRt7hWHzbYQCylFdkSh0ItSB/Ib57oClFn
 Rh9/y1jOcyvgTKyICLfqFznYjLhU0MlHE5ZbVSPeSiPyFzpygUwxUgvPROMYBMvcNlRy
 4/XEdug09MwYCh9vGqW6M1FM69Q3hK2yPAsyuA2I8p0EIsY28gP+h39k16ZT8mvFJ8zM
 lSaidmFSg52RM4M2CPcTbjsIJnqw04txyD5wPEhCiNqaCpS2MCx6a+FqY92f0vT3NZUx
 K0NA==
X-Gm-Message-State: APjAAAULVSu+WnZR3k98k+uMfNe+8711mRhgnag2GvKXN4CEVZ9Yvopu
 E6IO43SpkQNsaNRNKItYNUeoOTj0
X-Google-Smtp-Source: APXvYqy1sjNWmxzTE3S5IyzKgfhyO220pSc0Azo1efYb9kKaGwqYTfufgv0YpRr0SmilrPe/fv/0jQ==
X-Received: by 2002:a05:620a:78f:: with SMTP id
 15mr259241qka.295.1578611028428; 
 Thu, 09 Jan 2020 15:03:48 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id s33sm58653qtb.52.2020.01.09.15.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 15:03:47 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd, radeon, scheduler drm-next-5.6
Date: Thu,  9 Jan 2020 18:03:38 -0500
Message-Id: <20200109230338.8022-1-alexander.deucher@amd.com>
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

More new stuff for 5.6.

A few more things I forgot to put in the tag:

amdgpu:
- Use a task barrier to properly synchronize multi-GPU reset

radeon:
- Misc cleanups

drm:
- Add a task barrier helper for synchronizing threads

scheduler:
- Entity creation rework to separate entities and run queues

The UAPI stuff is straight forward.  Just enabling DRIVER_SYNCOBJ_TIMELINE for
vulkan.  The relevant amdvlk code is in:
https://github.com/GPUOpen-Drivers/pal/blob/dev/src/core/os/amdgpu/amdgpuDevice.cpp
For the KFD ioctl, no changes to the ioctl itself, just adding an additional error
code on failure to make it easier to differentiate why the ioctl failed.

Also, a heads up, the DP MST DSC changes depend on some DC changes in this PR.
I would have merged them through drm-misc, but then we need to merge this first
so it seemed easier to just send a separate PR for them.  Let me know how you
want to handle it.

The following changes since commit 66af4a9ddac62a2614af5ce80169b6421b5c2d95:

  Merge tag 'du-next-20191218' of git://linuxtv.org/pinchartl/media into drm-next (2019-12-18 16:19:26 +0100)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-next-5.6-2020-01-09

for you to fetch changes up to 0f899fd466b693a129b16994c1b2b4db2fcde4a4:

  drm/amdkfd: Improve kfd_process lookup in kfd_ioctl (2020-01-09 16:08:19 -0500)

----------------------------------------------------------------
amd-drm-next-5.6-2020-01-09:

amdgpu:
- Enable DCN support on POWER
- Enable GFXOFF for Raven1 refresh
- Clean up MM engine idle handlers
- HDMI 2.0 audio fixes
- Fixes for some 10 bpc EDP panels
- Watermark fixes for renoir
- SR-IOV fixes
- Runtime pm robustness fixes
- Arcturus VCN fixes
- RAS fixes
- BACO fixes for Arcturus
- Stable pstate fixes for swSMU
- HDCP fixes
- PSP cleanup
- HDMI fixes
- Misc cleanups

amdkfd:
- Spread interrupt work across cores to reduce latency
- Topology fixes for APUs
- GPU reset improvements

UAPI:
- Enable DRIVER_SYNCOBJ_TIMELINE for vulkan
- Return better error values for kfd process ioctl

----------------------------------------------------------------
Aidan Yang (1):
      drm/amd/display: Disable integerscaling for downscale and MPO

Alex Deucher (19):
      drm/amdgpu/gfx10: make ring tests less chatty
      drm/amdgpu/sdma5: make ring tests less chatty
      drm/amdgpu/pm_runtime: update usage count in fence handling
      drm/amdgpu/smu: fix spelling
      drm/amdgpu: wait for all rings to drain before runtime suspending
      drm/amdgpu/smu: add metrics table lock
      drm/amdgpu/smu: add metrics table lock for arcturus (v2)
      drm/amdgpu/smu: add metrics table lock for navi (v2)
      drm/amdgpu/smu: add metrics table lock for renoir (v2)
      drm/amdgpu/smu: add metrics table lock for vega20 (v2)
      drm/amdgpu/display: include delay.h
      drm/amdgpu/smu/navi: Adjust default behavior for peak sclk profile
      drm/amdgpu/smu: add peak profile support for navi12
      Revert "drm/amdgpu: simplify ATPX detection"
      drm/amdgpu/smu: make the set_performance_level logic easier to follow
      drm/amdgpu/gmc: move invaliation bitmap setup to common code
      drm/amdgpu/gmc10: use common invalidation engine helper
      drm/amdgpu/gfx: simplify old firmware warning
      Revert "drm/amdgpu: Set no-retry as default."

Amanda Liu (1):
      drm/amd/display: Reinstate LFC optimization

Andrey Grodzovsky (5):
      drm/amdgpu: reverts commit ce316fa55ef0f1751276b846a54fb3b835bd5e64.
      drm: Add Reusable task barrier.
      drm/amdgpu: Add task barrier to XGMI hive.
      drm/amdgpu: Redo XGMI reset synchronization.
      drm/amdgpu: Switch from system_highpri_wq to system_unbound_wq

Anthony Koo (1):
      drm/amd/display: Do not handle linkloss for eDP

Aric Cyr (5):
      drm/amd/display: Remove integer scaling code from DC and fix cursor
      drm/amd/display: 3.2.63
      drm/amd/display: scaling changes should also be a full update
      drm/amd/display: 3.2.64
      drm/amd/display: Fix manual trigger source for DCN2

Bhawanpreet Lakha (3):
      drm/amd/display: fix psp return condition for hdcp module
      drm/amd/display: Fix hdcp1 create session
      drm/amd/display: Return correct Error code for validate h_prime

Camille Cho (1):
      drm/amd/display: Add definition for number of backlight data points

Charlene Liu (2):
      drm/amd/display: HDMI 2.x audio bandwidth check
      drm/amd/display: Add warmup escape call support

Chunming Zhou (1):
      drm/amdgpu: add DRIVER_SYNCOBJ_TIMELINE to amdgpu

Colin Ian King (1):
      drm/amd/powerplay: fix various dereferences of a pointer before it is null checked

Dale Zhao (1):
      drm/amd/display: Use absolute time stamp to follow the eDP T7 spec requirement

Derek Lai (1):
      drm/amd/display: Specified VR patch skip to reset segment to 0

Emily Deng (1):
      drm/amdgpu/sriov: Tonga sriov also need load firmware with smu

Eric Yang (1):
      drm/amd/display: update chroma viewport wa

Evan Quan (11):
      drm/amd/powerplay: support custom power profile setting
      drm/amd/powerplay: add check for baco support on Arcturus
      drm/amdgpu: correct RLC firmwares loading sequence
      drm/amd/powerplay: avoid deadlock on Vega20 swSMU routine
      drm/amd/powerplay: retrieve the enabled feature mask from cache
      drm/amd/powerplay: add smu11_driver_if_arcturus.h new OOB members
      drm/amd/powerplay: cache the watermark settings on system memory
      drm/amd/powerplay: unified VRAM address for driver table interaction with SMU V2
      drm/amd/powerplay: refine code to support no-dpm case
      drm/amd/powerplay: issue proper hdp flush for table transferring
      drm/amd/powerplay: cleanup the interfaces for powergate setting through SMU

Felix Kuehling (5):
      drm/amdkfd: Fix permissions of hang_hws
      drm/amdkfd: Remove unused variable
      drm/amdkfd: Improve HWS hang detection and handling
      drm/amdkfd: Avoid hanging hardware in stop_cpsch
      drm/amdkfd: Improve kfd_process lookup in kfd_ioctl

Frank.Min (3):
      drm/amdgpu: enlarge agp_start address into 48bit
      drm/amdgpu: enable xgmi init for sriov use case
      drm/amdgpu: remove FB location config for sriov

Guchun Chen (4):
      drm/amdgpu: drop useless BACO arg in amdgpu_ras_reset_gpu
      drm/amdgpu: move umc offset to one new header file for Arcturus
      drm/amdgpu: add missed return value set for error case
      drm/amdgpu: simplify function return logic

Huang Rui (2):
      drm/amdkfd: expose num_sdma_queues_per_engine data field to topology node (v2)
      drm/amdkfd: expose num_cp_queues data field to topology node (v2)

Hugo Hu (1):
      drm/amd/display: disable lttpr for Navi

Jack Zhang (2):
      amd/amdgpu/sriov enable onevf mode for ARCTURUS VF
      amd/amdgpu/sriov tdr enablement with pp_onevf_mode

James Zhu (4):
      drm/amdgpu: Add mmCOMPUTE_STATIC_THREAD_MGMT_SE4-7 to support Arcturus
      drm/amdgpu/gfx: Replace ARRAY_SIZE with size variable
      drm/amdgpu/gfx: Add mmCOMPUTE_STATIC_THREAD_MGMT_SE4-7 to support Arcturus
      drm/amdgpu/gfx: Add mmSDMA2-7_EDC_COUNTER to support Arcturus

Jane Jian (6):
      drm/amdgpu: add VCN2.5 MMSCH start for Arcturus
      drm/amdgpu: add VCN2.5 sriov start for Arctrus
      drm/amdgpu: update VCN1(dual instances) fw types ID and VCN ip block type
      drm/amdgpu: skip VCN2.5 power gating and clock gating for sriov Arcturus
      drm/amdgpu: enable VCN0 and VCN1 sriov instances support for Arcturus
      drm/amdgpu: disable VCN2.5 ib test for Arcturus sriov

Jing Zhou (1):
      drm/amd/display: rx_validation failed resume from sleep

John Clements (10):
      drm/amdgpu: Added ASIC specific check in gmc v9.0 ECC interrupt programming sequence
      drm/amdgpu: by default output PSP ret status in event of cmd failure
      drm/amdgpu: amalgamate PSP TA load/unload functions
      drm/amdgpu: amalgamated PSP TA invoke functions
      drm/amdgpu: update UMC 6.1 RAS error counter register access path
      drm/amdgpu: resolve bug in UMC 6 error counter query
      drm/amdgpu: added function to wait for PSP BL availability
      drm/amdgpu: removed GFX RAS support check in UMC ECC callback
      drm/amdgpu: resolved bug in UMC RAS CE query
      drm/amdgpu: updated UMC error address record with correct channel index

Jonathan Kim (2):
      drm/amdgpu: add perfmons accessible during df c-states
      drm/amdgpu: attempt xgmi perfmon re-arm on failed arm

Joshua Aberback (1):
      drm/amd/display: Add interface to adjust DSC max target bpp limit

Josip Pavic (1):
      drm/amd/display: fix regamma build optimization

Jun Lei (1):
      drm/amd/display: support virtual DCN

Kevin Wang (4):
      drm/amdgpu/smu: use unified variable smu->is_apu to check apu asic platform
      drm/amdgpu/smu: add helper function smu_get_dpm_level_range() for smu driver
      drm/amdgpu: use linux size macro to simplify ONE_Kib & One_Mib
      drm/amdgpu/smu: custom pstate profiling clock frequence for navi series asics

Le Ma (1):
      drm/amdgpu: fix ctx init failure for asics without gfx ring

Leo Liu (3):
      drm/amdgpu/vcn1.0: use its own idle handler and begin use funcs
      drm/amdgpu/vcn: remove JPEG related code from idle handler and begin use
      drm/amdgpu/vcn: remove unnecessary included headers

Likun Gao (1):
      drm/amdgpu/powerplay: fix NULL pointer issue when SMU disabled

Luben Tuikov (1):
      drm/amdgpu: simplify padding calculations (v2)

Ma Feng (2):
      drm/amdgpu: Remove unneeded variable 'ret' in amdgpu_device.c
      drm/amdgpu: Remove unneeded variable 'ret' in navi10_ih.c

Martin Leung (1):
      drm/amd/display: Enable Seamless Boot Transition for Multiple Streams

Michael Strauss (1):
      drm/amd/display: Add delay after h' watchdog timeout event

Monk Liu (2):
      drm/amdgpu: fix double gpu_recovery for NV of SRIOV
      drm/amdgpu: fix KIQ ring test fail in TDR of SRIOV

Nicholas Kazlauskas (4):
      drm/amd/display: Get DMUB registers from ASIC specific structs
      drm/amd/display: Use physical addressing for DMCUB on both dcn20/21
      drm/amd/display: Perform DMUB hw_init on resume
      drm/amd/display: Get cache window sizes from DMCUB firmware

Nikola Cornij (2):
      drm/amd/display: Map ODM memory correctly when doing ODM combine
      drm/amd/display: Add debug option to override DSC target bpp increment

Nirmoy Das (4):
      drm/scheduler: rework entity creation
      drm/amdgpu: replace vm_pte's run-queue list with drm gpu scheds list
      amd/amdgpu: add sched array to IPs with multiple run-queues
      drm/scheduler: do not keep a copy of sched list

Noah Abradjian (4):
      drm/amd/display: Add wait for flip not pending on pipe unlock
      drm/amd/display: Use pipe_count for num of opps
      drm/amd/display: Collapse resource arrays when pipe is disabled
      drm/amd/display: Remove reliance on pipe indexing

Pan Zhang (1):
      gpu: drm: dead code elimination

Paul Hsieh (1):
      drm/amd/display: check link status before disable stream

Philip Yang (1):
      drm/amdkfd: queue kfd interrupt work to different CPU

Qingqing Zhuo (1):
      drm/amd/display: AVI info package change due to spec update

Roman Li (4):
      drm/amdgpu: move dpcs headers to dpcs includes
      drm/amdgpu: add dpcs20 registers
      drm/amd/display: add missing dcn link encoder regs
      drm/amd/display: Default max bpc to 16 for eDP

Samson Tam (2):
      drm/amd/display: fix 270 degree rotation for mixed-SLS mode
      drm/amd/display: fix missing cursor on some rotated SLS displays

Sung Lee (3):
      drm/amd/display: Fix update_bw_bounding_box Calcs
      drm/amd/display: Lower DPP DTO only when safe
      drm/amd/display: Formula refactor for calculating DPP CLK DTO

Thomas Anderson (1):
      drm/amd/display: Reduce HDMI pixel encoding if max clock is exceeded

Tianci.Yin (2):
      drm/amdgpu: update the method to get fb_loc of memory training(V4)
      drm/amdgpu: remove memory training p2c buffer reservation(V2)

Timothy Pearson (3):
      amdgpu: Prepare DCN floating point macros for generic arch support
      amdgpu: Enable initial DCN support on POWER
      amdgpu: Wrap FPU dependent functions in dc20

Wambui Karuga (3):
      drm/radeon: remove boolean checks in if statements.
      drm/radeon: remove unnecessary braces around conditionals.
      drm/amd: use list_for_each_entry for list iteration.

Xiaodong Yan (1):
      drm/amd/display: add event type check before restart the authentication

Xiaojie Yuan (1):
      drm/amd/display: fix kernel_fpu_begin/_end() warnings

Yintian Tao (2):
      drm/amd/powerplay: skip soc clk setting under pp one vf
      drm/amd/powerplay: skip disable dynamic state management

Yong Zhao (2):
      drm/amdkfd: Use Arcturus specific set_vm_context_page_table_base()
      drm/amdgpu: Add CU info print log

Zhan Liu (1):
      drm/amd/powerplay: Add SMU WMTABLE Validity Check for Renoir

Zhigang Luo (4):
      drm/amd/amdgpu: L1 Policy(1/5) - removed VM settings for mmhub and gfxhub from VF
      drm/amd/amdgpu: L1 Policy(2/5) - removed GC GRBM violations from gfxhub
      drm/amd/amdgpu: L1 Policy(3/5) - removed ECC interrupt from VF
      drm/amd/amdgpu: L1 Policy(5/5) - removed IH_CHICKEN from VF

abdoulaye berthe (2):
      drm/amd/display: disable lttpr for RN
      drm/amd/display: Update extended timeout support for DCN20 and DCN21

changzhu (1):
      drm/amdgpu: enable gfxoff for raven1 refresh

yu kuai (1):
      drm/radeon: remove three set but not used variable

zhengbin (25):
      drm/amd/display: Remove unneeded semicolon
      drm/amdgpu: Remove unneeded semicolon in amdgpu_pmu.c
      drm/amdgpu: Remove unneeded semicolon in gfx_v10_0.c
      drm/amdgpu: Remove unneeded semicolon in amdgpu_ras.c
      drm/radeon: use true,false for bool variable in r100.c
      drm/radeon: use true,false for bool variable in si.c
      drm/radeon: use true,false for bool variable in r600.c
      drm/radeon: use true, false for bool variable in evergreen.c
      drm/radeon: use true,false for bool variable in rv770.c
      drm/radeon: use true,false for bool variable in cik.c
      drm/radeon: use true,false for bool variable in ni.c
      drm/amdgpu: use true, false for bool variable in mxgpu_ai.c
      drm/amdgpu: use true, false for bool variable in mxgpu_nv.c
      drm/amdgpu: use true, false for bool variable in amdgpu_device.c
      drm/amdgpu: use true, false for bool variable in amdgpu_debugfs.c
      drm/amdgpu: use true, false for bool variable in amdgpu_psp.c
      drm/amd/powerplay: use true, false for bool variable in vega20_hwmgr.c
      drm/amd/display: use true, false for bool variable in dc_link_ddc.c
      drm/amd/display: use true, false for bool variable in dcn10_hw_sequencer.c
      drm/amd/display: use true, false for bool variable in dcn20_hwseq.c
      drm/amd/display: use true, false for bool variable in display_mode_vba_21.c
      drm/amd/display: use true, false for bool variable in dce_calcs.c
      drm/amd/display: use true, false for bool variable in display_rq_dlg_calc_20.c
      drm/amd/display: use true, false for bool variable in display_rq_dlg_calc_20v2.c
      drm/amd/display: use true, false for bool variable in display_rq_dlg_calc_21.c

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    5 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |   20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |   14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h  |    2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |   38 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h   |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c   |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |  113 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h            |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  142 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dpm.c            |   23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   42 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c             |   43 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c            |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  325 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   39 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |   35 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   47 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |    2 +
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |   12 +-
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c               |  151 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   44 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  103 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |   81 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   19 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   68 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.h              |   10 -
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |   90 +-
 drivers/gpu/drm/amd/amdgpu/mmsch_v1_0.h            |   12 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |    4 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |   10 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |   10 +-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |   42 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |   12 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |   12 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |    9 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |   45 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |    8 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   13 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_1.c              |  163 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |   90 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.h              |    2 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  262 +-
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c             |   22 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   30 +-
 drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c           |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   20 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   40 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |    3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c      |    8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |    2 +
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |    7 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |    2 +
 drivers/gpu/drm/amd/display/Kconfig                |    2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  254 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    7 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |   19 +-
 drivers/gpu/drm/amd/display/dc/calcs/Makefile      |    9 +
 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c   |   24 +-
 drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c   |   25 +-
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |   46 +-
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.h   |    6 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |   10 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  177 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |   10 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c |   13 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  145 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   59 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |    5 +-
 drivers/gpu/drm/amd/display/dc/dc_dsc.h            |    5 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |    1 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |    7 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   13 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |    3 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h  |    4 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   72 +-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.h  |   20 +
 drivers/gpu/drm/amd/display/dc/dcn20/Makefile      |    8 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.c  |   20 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   40 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.h |    1 -
 .../drm/amd/display/dc/dcn20/dcn20_link_encoder.h  |  180 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c  |   24 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.h  |    1 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   32 +-
 drivers/gpu/drm/amd/display/dc/dcn21/Makefile      |    8 +
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c  |  314 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.h  |    1 +
 .../drm/amd/display/dc/dcn21/dcn21_link_encoder.h  |   39 +
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |   48 +-
 drivers/gpu/drm/amd/display/dc/dm_services_types.h |    3 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |    9 +
 .../display/dc/dml/dcn20/display_rq_dlg_calc_20.c  |   24 +-
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c        |   24 +-
 .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |    6 +-
 .../display/dc/dml/dcn21/display_rq_dlg_calc_21.c  |   24 +-
 .../drm/amd/display/dc/dml/display_mode_structs.h  |    1 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/dsc/Makefile        |    8 +
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |   33 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dwb.h        |    3 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |    7 +-
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |    6 +-
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |    2 +
 drivers/gpu/drm/amd/display/dc/os_types.h          |   32 +
 .../dmub/inc/{dmub_fw_state.h => dmub_fw_meta.h}   |   64 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_srv.h    |    7 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c  |   84 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.h  |  117 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn21.c  |  107 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn21.h  |   13 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_reg.h    |   10 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   57 +-
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |    6 +-
 .../drm/amd/display/modules/color/color_gamma.c    |    6 +-
 .../drm/amd/display/modules/freesync/freesync.c    |   32 +-
 .../amd/display/modules/hdcp/hdcp1_transition.c    |   20 +-
 .../drm/amd/display/modules/hdcp/hdcp2_execution.c |    2 +
 .../amd/display/modules/hdcp/hdcp2_transition.c    |   17 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |    7 +-
 .../gpu/drm/amd/display/modules/inc/mod_freesync.h |    1 +
 .../drm/amd/include/asic_reg/df/df_3_6_offset.h    |   16 +
 .../amd/include/asic_reg/dpcs/dpcs_2_0_0_offset.h  |  647 ++++
 .../amd/include/asic_reg/dpcs/dpcs_2_0_0_sh_mask.h | 3912 ++++++++++++++++++++
 .../asic_reg/{dcn => dpcs}/dpcs_2_1_0_offset.h     |    0
 .../asic_reg/{dcn => dpcs}/dpcs_2_1_0_sh_mask.h    |    0
 .../drm/amd/include/asic_reg/gc/gc_9_0_offset.h    |    8 +
 .../amd/include/asic_reg/umc/umc_6_1_2_offset.h    |   31 +
 drivers/gpu/drm/amd/include/atomfirmware.h         |   14 -
 drivers/gpu/drm/amd/powerplay/amd_powerplay.c      |    8 +-
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c         |  339 +-
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c       |  149 +-
 .../gpu/drm/amd/powerplay/hwmgr/hardwaremanager.c  |    3 +
 drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c        |   15 +-
 drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c |    3 +-
 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c |    2 +-
 drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h     |   16 +-
 .../amd/powerplay/inc/smu11_driver_if_arcturus.h   |   14 +-
 drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h      |    7 +-
 drivers/gpu/drm/amd/powerplay/inc/smu_v12_0.h      |    2 +
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c         |   94 +-
 drivers/gpu/drm/amd/powerplay/navi10_ppt.h         |   14 +
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c         |   53 +-
 drivers/gpu/drm/amd/powerplay/smu_internal.h       |    6 +-
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c          |  120 +-
 drivers/gpu/drm/amd/powerplay/smu_v12_0.c          |   32 +-
 .../gpu/drm/amd/powerplay/smumgr/smu10_smumgr.c    |    5 +-
 .../gpu/drm/amd/powerplay/smumgr/vega10_smumgr.c   |    5 +-
 .../gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c   |    5 +-
 .../gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c   |   10 +-
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c         |   13 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              |    7 +-
 drivers/gpu/drm/lima/lima_sched.c                  |    5 +-
 drivers/gpu/drm/panfrost/panfrost_job.c            |    8 +-
 drivers/gpu/drm/radeon/atombios_crtc.c             |    3 +-
 drivers/gpu/drm/radeon/atombios_dp.c               |    3 +-
 drivers/gpu/drm/radeon/atombios_encoders.c         |    9 +-
 drivers/gpu/drm/radeon/atombios_i2c.c              |    5 -
 drivers/gpu/drm/radeon/cik.c                       |    4 +-
 drivers/gpu/drm/radeon/cik_sdma.c                  |    2 +-
 drivers/gpu/drm/radeon/evergreen.c                 |    2 +-
 drivers/gpu/drm/radeon/ni.c                        |    4 +-
 drivers/gpu/drm/radeon/r100.c                      |   10 +-
 drivers/gpu/drm/radeon/r600.c                      |    4 +-
 drivers/gpu/drm/radeon/radeon_atombios.c           |   15 +-
 drivers/gpu/drm/radeon/radeon_bios.c               |   12 +-
 drivers/gpu/drm/radeon/radeon_connectors.c         |    6 +-
 drivers/gpu/drm/radeon/radeon_display.c            |    4 +-
 drivers/gpu/drm/radeon/radeon_legacy_encoders.c    |    4 +-
 drivers/gpu/drm/radeon/radeon_pm.c                 |    2 +-
 drivers/gpu/drm/radeon/radeon_vce.c                |    4 +-
 drivers/gpu/drm/radeon/radeon_vm.c                 |   16 +-
 drivers/gpu/drm/radeon/rv770.c                     |    2 +-
 drivers/gpu/drm/radeon/si.c                        |    4 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |   77 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |    8 +-
 include/drm/gpu_scheduler.h                        |    8 +-
 include/drm/task_barrier.h                         |  107 +
 206 files changed, 8631 insertions(+), 2089 deletions(-)
 rename drivers/gpu/drm/amd/display/dmub/inc/{dmub_fw_state.h => dmub_fw_meta.h} (57%)
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_2_0_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_2_0_0_sh_mask.h
 rename drivers/gpu/drm/amd/include/asic_reg/{dcn => dpcs}/dpcs_2_1_0_offset.h (100%)
 rename drivers/gpu/drm/amd/include/asic_reg/{dcn => dpcs}/dpcs_2_1_0_sh_mask.h (100%)
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/umc/umc_6_1_2_offset.h
 create mode 100644 include/drm/task_barrier.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
