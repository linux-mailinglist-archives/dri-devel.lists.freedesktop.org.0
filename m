Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD812D1C48
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 22:46:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3116E8CA;
	Mon,  7 Dec 2020 21:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E9C6E8C9;
 Mon,  7 Dec 2020 21:46:41 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q75so633091wme.2;
 Mon, 07 Dec 2020 13:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=TGNTtraAhQJ2oRJVzUEdoL5Dkmj0xWuPns6G6UA45+Y=;
 b=ovxnmIp8PkGWNdhg4OVhBqz7ITzy0gUafPj5wVBt1jzhY+BDzbWyrLMZ66rSOSDaeC
 MOPzOnY33Ajagtpdea6Y++W6z8mqC6fhOOZ+vDIe/ZMuxLC8GjbWhSufUhwIiWxFaPdv
 2FSo1P5CwotiJGM185eA8IeRbqZxJlzUcYLka/gZ7OzK0CW1phNag/eUsFujt2ONk+hR
 nqc1looDEf3CvMLxmqioQh8Ed+qbddChemFp7T2i/Tb/OQImJA/TizdKGQ4z6YwrX/2t
 edU3T3lEwALjl1VwXVqLTJeN7tKDuVfZtKJhb7Jdf7UkV3jCxxK6kAD2wCUwBZR3Yp0v
 +wTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=TGNTtraAhQJ2oRJVzUEdoL5Dkmj0xWuPns6G6UA45+Y=;
 b=dXhc9Y+a3ydbNvsw3VOoewGQl3PBYwnqkf5fbPSM5gMsrSLRhOiFbOlQwOZxyC/7Tr
 Ti02SBViKA6HlQ2bGPqyo4vRCQzMg1o3VTb8oiOuexJKCB1wdWkNoDjMnfXjwloqlQOu
 PLm9nUXDReG+dFTtYtBOSMRFdcgBuOs3n0ub7P3qNAfrXIIODT3d7fF5QIp9u6pu8LEg
 KG/vEtTAu1CtAOIoV4LI5kW1HQqGu1b65/X1QRUnFrTxt0SuG889hInpnL1HPZu4CdGe
 YVtXqo6+bkETzU0wJMfcK40ccO8AGCUdm4Twst0ZFlKtkTmsyWcXJ1SxQQBjr3BtMkFJ
 ylGg==
X-Gm-Message-State: AOAM531hsVHfifMYCBsqXlLt3fy3P+eEuwYo6Lxx3YY1KfcbSq06qf+c
 GJw+q5XI3D+L60tEgGixIef4q37pRlx5Z/8+Scs=
X-Google-Smtp-Source: ABdhPJylTauRJu3oY/Xr1w35VgYB3GTlyYxwZKzTMEepoU/i1iCJX5hFUWHRBCHMVrTGqDEE38Pls2tUspi0GyLAVfY=
X-Received: by 2002:a1c:f406:: with SMTP id z6mr801425wma.123.1607377600427;
 Mon, 07 Dec 2020 13:46:40 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 7 Dec 2020 13:48:39 -0800
Message-ID: <CAF6AEGt0G=H3_RbF_GAQv838z5uujSmFd+7fYhL6Yg=23LwZ=g@mail.gmail.com>
Subject: [pull] drm/msm: msm-next for 5.11
To: Dave Airlie <airlied@gmail.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

This time around:

 * Shutdown hook for GPU (to ensure GPU is idle before iommu goes away)
 * GPU cooling device support
 * DSI 7nm and 10nm phy/pll updates
 * Additional sm8150/sm8250 DPU support (merge_3d and DSPP color
   processing)
 * Various DP fixes
 * A whole bunch of W=1 fixes from Lee Jones
 * GEM locking re-work (no more trylock_recursive in shrinker!)
 * LLCC (system cache) support
 * Various other fixes/cleanups

Note that there is a merge commit for branch also based on v5.10-rc1 that
was also merged into arm-smmu tree for v5.11 to handle a shared dependency
for LLCC support.

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2020-12-07

for you to fetch changes up to e319a1b956f785f618611857cd946dca2bb68542:

  drm/msm: add IOMMU_SUPPORT dependency (2020-12-05 08:25:52 -0800)

----------------------------------------------------------------
Abhinav Kumar (2):
      drm/msm/dp: do not notify audio subsystem if sink doesn't support audio
      drm/msm/dpu: update the qos remap only if the client type changes

Akhil P Oommen (4):
      drm/msm: Implement shutdown callback for adreno
      drm/msm: Fix duplicate gpu node in icc summary
      drm/msm: Add support for GPU cooling
      dt-bindings: drm/msm/gpu: Add cooling device support

Arnd Bergmann (1):
      drm/msm: add IOMMU_SUPPORT dependency

Dmitry Baryshkov (12):
      drm/msm/dsi_pll_7nm: restore VCO rate during restore_state
      drm/msm/dsi_pll_10nm: restore VCO rate during restore_state
      drm/msm/dsi_phy_7nm: implement PHY disabling
      drm/msm/dsi_phy_10nm: implement PHY disabling
      drm/msm/dpu: simplify interface flush handling
      drm/msm/dpu: initial support for merge3D hardware block
      drm/msm/dpu: handle merge_3d configuration in hw_ctl block
      drm/msm/dpu: setup merge modes in merge_3d block
      drm/msm/dpu: enable merge_3d support on sm8150/sm8250
      drm/msm/dpu: fix clock scaling on non-sc7180 board
      drm/msm/dsi: do not try reading 28nm vco rate if it's not enabled
      drm/msm/dpu: enable DSPP support on SM8[12]50

Iskren Chernev (1):
      drm/msm: Fix use-after-free in msm_gem with carveout

Jordan Crouse (1):
      drm/msm/a6xx: Add support for using system cache on MMU500 based targets

Kalyan Thota (1):
      drm/msm/dpu: consider vertical front porch in the prefill bw calculation

Krishna Manikandan (1):
      drm/msm: Fix race condition in msm driver with async layer updates

Kuogee Hsieh (7):
      drm/msm/dp: add opp_table corner voting support base on dp_ink_clk rate
      drm/msm/dp: return correct connection status after suspend
      drm/msm/dp: fixes wrong connection state caused by failure of link train
      drm/msm/dp: deinitialize mainlink if link training failed
      drm/msm/dp: skip checking LINK_STATUS_UPDATED bit
      drm/msm/dp: promote irq_hpd handle to handle link training correctly
      drm/msm/dp: fix connect/disconnect handled at irq_hpd

Lee Jones (21):
      drm/msm/adreno/a6xx_gpu: Staticise local function 'a6xx_idle'
      drm/msm/disp/mdp5/mdp5_crtc: Make local function
'mdp5_crtc_setup_pipeline()' static
      drm/msm/disp/mdp5/mdp5_kms: Make local functions 'mdp5_{en,
dis}able()' static
      drm/msm/disp/dpu1/dpu_core_perf: Remove set but unused variable
'dpu_cstate'
      drm/msm/disp/dpu1/dpu_encoder: Remove a bunch of unused variables
      drm/msm/disp/dpu1/dpu_core_perf: Fix kernel-doc formatting issues
      drm/msm/disp/dpu1/dpu_hw_blk: Add one missing and remove an
extra param description
      drm/msm/disp/dpu1/dpu_formats: Demote non-conformant kernel-doc header
      drm/msm/disp/dpu1/dpu_hw_catalog: Remove duplicated
initialisation of 'max_linewidth'
      drm/msm/disp/dpu1/dpu_hw_catalog: Move definitions to the only
place they are used
      drm/msm/disp/dpu1/dpu_encoder: Fix a few parameter/member
formatting issues
      drm/msm/disp/dpu1/dpu_hw_lm: Fix misnaming of parameter 'ctx'
      drm/msm/disp/dpu1/dpu_hw_sspp: Fix kernel-doc formatting abuse
      drm/msm/disp/dpu1/dpu_rm: Fix formatting issues and supply
'global_state' description
      drm/msm/disp/dpu1/dpu_vbif: Fix a couple of function param descriptions
      drm/msm/disp/dpu1/dpu_plane: Fix some spelling and missing
function param descriptions
      drm/msm/msm_drv: Make '_msm_ioremap()' static
      drm/msm/msm_gem_shrinker: Fix descriptions for 'drm_device'
      drm/msm/adreno/a6xx_gpu_state: Make some local functions static
      drm/msm/dp/dp_ctrl: Move 'tu' from the stack to the heap
      drm/msm/disp/dpu1/dpu_hw_interrupts: Demote kernel-doc formatting misuse

Marijn Suijten (1):
      drm/msm: a5xx: Make preemption reset case reentrant

Rikard Falkeborn (1):
      drm/msm: dsi: Constify dsi_host_ops

Rob Clark (33):
      drm/msm/atomic: Drop per-CRTC locks in reverse order
      drm/msm/gpu: Convert retire/recover work to kthread_worker
      drm/msm/kms: Update msm_kms_init/destroy
      drm/msm/atomic: Convert to per-CRTC kthread_work
      drm/msm: Fix a couple incorrect usages of get_vaddr_active()
      drm/msm/gem: Add obj->lock wrappers
      drm/msm/gem: Rename internal get_iova_locked helper
      drm/msm/gem: Move prototypes to msm_gem.h
      drm/msm/gem: Add some _locked() helpers
      drm/msm/gem: Move locking in shrinker path
      drm/msm/submit: Move copy_from_user ahead of locking bos
      drm/msm: Do rpm get sooner in the submit path
      drm/msm/gem: Switch over to obj->resv for locking
      drm/msm: Use correct drm_gem_object_put() in fail case
      drm/msm: Drop chatty trace
      drm/msm: Move update_fences()
      drm/msm: Add priv->mm_lock to protect active/inactive lists
      drm/msm: Document and rename preempt_lock
      drm/msm: Protect ring->submits with it's own lock
      drm/msm: Refcount submits
      drm/msm: Remove obj->gpu
      drm/msm: Drop struct_mutex from the retire path
      drm/msm: Drop struct_mutex in free_object() path
      drm/msm: Remove msm_gem_free_work
      drm/msm: Drop struct_mutex in madvise path
      drm/msm: Drop struct_mutex in shrinker path
      drm/msm/a6xx: Clear shadow on suspend
      drm/msm/a5xx: Clear shadow on suspend
      drm/msm: Protect obj->active_count under obj lock
      drm/msm/shrinker: We can vmap shrink active_list too
      drm/msm/shrinker: Only iterate dontneed objs
      msm/mdp5: Fix some kernel-doc warnings
      Merge remote-tracking branch
'arm64/for-next/iommu/io-pgtable-domain-attr' into msm-next-staging

Robin Murphy (1):
      drm/msm: Add missing stub definition

Sai Prakash Ranjan (2):
      iommu/io-pgtable: Add a domain attribute for pagetable configuration
      iommu/io-pgtable-arm: Add support to use system cache

Sharat Masetty (2):
      drm/msm: rearrange the gpu_rmw() function
      drm/msm/a6xx: Add support for using system cache(LLC)

Stephen Boyd (1):
      drm/msm/dpu: Add newline to printks

Tanmay Shah (1):
      drm/msm/dp: DisplayPort PHY compliance tests fixup

Tian Tao (3):
      drm/msm: Add missing struct identifier
      drm/msm: Remove redundant null check
      drm/msm/dp: remove duplicate include statement

Viresh Kumar (1):
      drm/msm: Unconditionally call dev_pm_opp_of_remove_table()

 .../devicetree/bindings/display/msm/gpu.txt        |   7 +
 drivers/gpu/drm/msm/Kconfig                        |   2 +-
 drivers/gpu/drm/msm/Makefile                       |   1 +
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |  21 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |  20 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |  33 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c          |  18 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 132 ++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   5 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |   6 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |   6 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  49 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |  26 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  27 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  27 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c         |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 154 +++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  18 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h  |  88 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  56 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  37 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |  94 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h     |  68 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  47 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  34 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           |   2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |   1 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |   8 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |   7 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c           |  11 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |  15 +-
 drivers/gpu/drm/msm/disp/mdp_kms.h                 |   9 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                |  14 +-
 drivers/gpu/drm/msm/dp/dp_catalog.h                |   1 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 434 ++++++++++++---------
 drivers/gpu/drm/msm/dp/dp_display.c                | 272 ++++++++-----
 drivers/gpu/drm/msm/dp/dp_link.c                   |  41 +-
 drivers/gpu/drm/msm/dp/dp_link.h                   |   1 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   5 +
 drivers/gpu/drm/msm/dp/dp_power.c                  |  44 ++-
 drivers/gpu/drm/msm/dp/dp_power.h                  |   2 +-
 drivers/gpu/drm/msm/dp/dp_reg.h                    |   2 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  11 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         |  22 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  23 +-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c         |   8 +
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c         |   5 +-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c          |   8 +
 drivers/gpu/drm/msm/msm_atomic.c                   |  62 ++-
 drivers/gpu/drm/msm/msm_debugfs.c                  |  10 +-
 drivers/gpu/drm/msm/msm_drv.c                      |  34 +-
 drivers/gpu/drm/msm/msm_drv.h                      |  86 ++--
 drivers/gpu/drm/msm/msm_fbdev.c                    |   1 +
 drivers/gpu/drm/msm/msm_gem.c                      | 333 +++++++++-------
 drivers/gpu/drm/msm/msm_gem.h                      | 138 +++++--
 drivers/gpu/drm/msm/msm_gem_shrinker.c             | 123 +++---
 drivers/gpu/drm/msm/msm_gem_submit.c               | 157 +++++---
 drivers/gpu/drm/msm/msm_gpu.c                      | 167 +++++---
 drivers/gpu/drm/msm/msm_gpu.h                      |  25 +-
 drivers/gpu/drm/msm/msm_kms.h                      |  33 +-
 drivers/gpu/drm/msm/msm_rd.c                       |   2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c               |   3 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h               |  13 +-
 drivers/iommu/io-pgtable-arm.c                     |  10 +-
 include/drm/drm_crtc.h                             |  10 +
 include/linux/io-pgtable.h                         |   8 +
 include/linux/iommu.h                              |   1 +
 81 files changed, 2092 insertions(+), 1117 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
