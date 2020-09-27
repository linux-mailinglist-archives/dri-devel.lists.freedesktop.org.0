Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC25027A1FA
	for <lists+dri-devel@lfdr.de>; Sun, 27 Sep 2020 19:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC0089C48;
	Sun, 27 Sep 2020 17:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA6189C1A;
 Sun, 27 Sep 2020 17:14:48 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id d4so4126829wmd.5;
 Sun, 27 Sep 2020 10:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=vkNFq27zUQkc7uwhfLSl/SxZhzKQJE4aKu7eX2yKqhY=;
 b=TaLskYClBIZsjIt24scGzeRD2IDYxo9kKO4yN7b+BrdrjVFAY5K4cNOnb7WSc/OWZa
 5pIIbNH0OsW76g/mWgccquPV9SYyb3fM7BpJnqvc270oxpJjopK08TQ95homme/SWrSD
 +Mw/V4rsndIGUQevAa0VfXteiq13u4ZWUYe95J0rUt3e3kc4aGPBHPVDHAvO6h6T2Ekw
 829Ob3/1wvFZ+iW+j1wFqSUk3W/iBUdBZpA8Q+QH48SNmyUHKBKrbpXCq7NnAMpysMmL
 AXk7Tv3widdms6XI7UsLwA6Oqn2umq9KcDlWcAL+LQCEfoWkUeqjjuP3FAD/oO7I3WRr
 3apQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=vkNFq27zUQkc7uwhfLSl/SxZhzKQJE4aKu7eX2yKqhY=;
 b=k0bs+DaPtx5xAtsl59NDGJOeKAAITAsY6e1aJyghdtrLNKNzhy0Ye/0D6eELQhsWt2
 ouBIlG/8lviKOxaJcse6yUo0fFPKEH3dIxNhZLvSWDQApGKDHI76afv1nKA1JrewEDBo
 8wr0eNY5sKoT9Fcs9LCWwW4pADnE47My0eqc5yHXzPYc6sqC9alI5U37sgGUA4QhASQX
 EZXgMSJqM8h3f2iY+U4q7lZ0dCbc8l+mTHobtlJCxLQPweIH0l58raFvsA02Ti7lGw/X
 aF7Lt1CdtTi/7aHXx9R+m8BGfFZPQ1hh1ihRXIaAYpUKuUBUp2RGSrksyBpxY66CQcfT
 J4AQ==
X-Gm-Message-State: AOAM530r686mkXowAh05z2ptcvnlB11c6FAa6KGU3FsWV//8hKzaw0NK
 CbaWJSIRuaBL7sMriTMZCXgaEJlHbxUYNpgcdKw=
X-Google-Smtp-Source: ABdhPJxA0pPW+ZBRG24nYYre/2CetpcLl20d5iip/XoJo4PTSxnDvKyI1IjSinQeqAnfFaC6aO/bQyRf+X4XBY/4dPM=
X-Received: by 2002:a1c:b388:: with SMTP id c130mr7767187wmf.175.1601226886986; 
 Sun, 27 Sep 2020 10:14:46 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 27 Sep 2020 10:15:51 -0700
Message-ID: <CAF6AEGvqjuzH=Po_9EzzFsp2Xq3tqJUTKfsA2g09XY7_+6Ypfw@mail.gmail.com>
Subject: [pull] drm/msm: msm-next for 5.10
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

A bit bigger this time around, with the addition of DP support
which has been baking for a while now.  Overall:

* DSI support for sm8150/sm8250
* Support for per-process GPU pagetables (finally!) for a6xx.
  There are still some iommu/arm-smmu changes required to
  enable, without which it will fallback to the current single
  pgtable state.  The first part (ie. what doesn't depend on
  drm side patches) is queued up for v5.10[1].
* DisplayPort support.  Userspace DP compliance tool support
  is already merged in IGT[2]
* The usual assortment of smaller fixes/cleanups


[1] https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-joerg/arm-smmu/updates
[2] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/222051026b978ebbc0dc58db62d7a1f29728f95f

The following changes since commit f6828e0c4045f03f9cf2df6c2a768102641183f4:

  drm/msm: Disable the RPTR shadow (2020-09-04 12:14:15 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2020-09-27

for you to fetch changes up to d1ea914925856d397b0b3241428f20b945e31434:

  drm/msm/dp: fix incorrect function prototype of dp_debug_get()
(2020-09-25 20:31:06 -0700)

----------------------------------------------------------------
Abhinav Kumar (10):
      drm/msm/dp: store dp_display in the driver data
      drm/msm/dp: add audio support for Display Port on MSM
      drm/msm/dp: add hook_plugged_cb hdmi-codec op for MSM DP driver
      drm/msm/dp: signal the hotplug disconnect in the event handler
      drm/msm/dp: wait for audio notification before disabling clocks
      drm/msm/dp: add debugfs support to DP driver
      drm/msm/dp: move debugfs node to /sys/kernel/debug/dri/*/
      drm/msm/dp: add debugfs nodes for video pattern tests
      drm/msm/dp: remove mode hard-coding in case of DP CTS
      drm/msm/dp: fix incorrect function prototype of dp_debug_get()

Akhil P Oommen (2):
      drm/msm: Fix premature purging of BO
      drm/msm: Leave inuse count intact on map failure

Bernard Zhao (1):
      drm/msm/adreno: remove return value of function XX_print

Chandan Uddaraju (3):
      drm: add constant N value in helper file
      drm/msm/dp: add displayPort driver support
      drm/msm/dp: add support for DP PLL driver

Georgi Djakov (1):
      drm/msm: Remove depends on interconnect

Jeykumar Sankaran (1):
      drm/msm/dpu: add display port support in DPU

Jonathan Marek (3):
      drm/msm/dsi: remove unused clk_pre/clk_post in msm_dsi_dphy_timing
      drm/msm/dsi: add DSI config for sm8150 and sm8250
      drm/msm/dsi: add support for 7nm DSI PHY/PLL

Jordan Crouse (10):
      drm/msm: Add a context pointer to the submitqueue
      drm/msm: Drop context arg to gpu->submit()
      drm/msm: Set the global virtual address range from the IOMMU domain
      drm/msm: Add support to create a local pagetable
      drm/msm: Add support for private address space instances
      drm/msm/a6xx: Add support for per-instance pagetables
      drm/msm: Allow a5xx to mark the RPTR shadow as privileged
      drm/msm: a6xx: Use WHERE_AM_I for eligible targets
      drm/msm: Get rid of the REG_ADRENO offsets
      drm/msm: Fix the a650 hw_apriv check

Kalyan Thota (1):
      drm/msm/dpu: add support for clk and bw scaling for display

Kuogee Hsieh (1):
      drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets

Luca Weiss (1):
      drm/msm/adreno: fix probe without iommu

Luo Jiaxing (1):
      drm/msm/dpu: remove unused variables new_cnt and old_cnt in
dpu_encoder_phys_vid_vblank_irq()

Qinglang Miao (1):
      drm/msm/dpu: Convert to DEFINE_SHOW_ATTRIBUTE

Rob Clark (12):
      drm/msm: drop cache sync hack
      drm/msm/dpu: move vblank events to complete_commit()
      drm/msm/dpu: clean up some impossibilities
      drm/msm/gpu: Add GPU freq_change traces
      drm/msm: Convert shrinker msgs to tracepoints
      drm/msm/gpu: Add suspend/resume tracepoints
      drm/msm: Remove dangling submitqueue references
      drm/msm: Add private interface for adreno-smmu
      drm/msm/gpu: Add dev_to_gpu() helper
      drm/msm: Set adreno_smmu as gpu's drvdata
      drm/msm: Show process names in gem_describe
      drm/msm/dp: Fix crash if no DP device

Robin Murphy (1):
      drm/msm: Drop local dma_parms

Sai Prakash Ranjan (2):
      drm/msm/mdp4: Remove unused downstream bus scaling apis
      drm/msm/mdp5: Remove unused downstream bus scaling apis

Stephen Boyd (4):
      drm/msm: Avoid div-by-zero in dpu_crtc_atomic_check()
      drm/msm: Drop debug print in _dpu_crtc_setup_lm_bounds()
      drm/msm/dp: Use qmp phy for DP PLL and PHY
      drm/msm/dp: Sleep properly in dp_hpd_handler kthread

Tanmay Shah (1):
      drm/msm/dp: Add Display Port HPD feature

Zhenzhong Duan (1):
      drm/msm/a6xx: fix a potential overflow issue

 .../devicetree/bindings/display/msm/dsi.txt        |    6 +-
 drivers/gpu/drm/i915/display/intel_display.c       |    2 +-
 drivers/gpu/drm/msm/Kconfig                        |   19 +-
 drivers/gpu/drm/msm/Makefile                       |   18 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   65 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   77 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   82 +-
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c          |   21 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |  120 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h              |   12 +
 drivers/gpu/drm/msm/adreno/a5xx_power.c            |    2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c          |    5 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |    3 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  182 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   10 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |    2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |   12 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  105 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   82 +-
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h        |    1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c       |   15 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |  109 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  132 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   55 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |    5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |    4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  145 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |    4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c           |    9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   84 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |    4 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c   |   51 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |   13 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |   47 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c   |   24 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c       |   68 -
 drivers/gpu/drm/msm/dp/dp_audio.c                  |  638 +++++++
 drivers/gpu/drm/msm/dp/dp_audio.h                  |   72 +
 drivers/gpu/drm/msm/dp/dp_aux.c                    |  535 ++++++
 drivers/gpu/drm/msm/dp/dp_aux.h                    |   30 +
 drivers/gpu/drm/msm/dp/dp_catalog.c                | 1019 +++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h                |  131 ++
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 1869 ++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   36 +
 drivers/gpu/drm/msm/dp/dp_debug.c                  |  485 +++++
 drivers/gpu/drm/msm/dp/dp_debug.h                  |   74 +
 drivers/gpu/drm/msm/dp/dp_display.c                | 1463 +++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h                |   39 +
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  164 ++
 drivers/gpu/drm/msm/dp/dp_drm.h                    |   18 +
 drivers/gpu/drm/msm/dp/dp_hpd.c                    |   69 +
 drivers/gpu/drm/msm/dp/dp_hpd.h                    |   80 +
 drivers/gpu/drm/msm/dp/dp_link.c                   | 1210 +++++++++++++
 drivers/gpu/drm/msm/dp/dp_link.h                   |  155 ++
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  463 +++++
 drivers/gpu/drm/msm/dp/dp_panel.h                  |  100 ++
 drivers/gpu/drm/msm/dp/dp_parser.c                 |  293 +++
 drivers/gpu/drm/msm/dp/dp_parser.h                 |  136 ++
 drivers/gpu/drm/msm/dp/dp_power.c                  |  372 ++++
 drivers/gpu/drm/msm/dp/dp_power.h                  |  107 ++
 drivers/gpu/drm/msm/dp/dp_reg.h                    |  306 ++++
 drivers/gpu/drm/msm/dsi/dsi.h                      |    2 +
 drivers/gpu/drm/msm/dsi/dsi.xml.h                  |  423 +++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |    5 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |    2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  102 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |    6 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  255 +++
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.c              |    4 +
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h              |   10 +
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c          |  904 ++++++++++
 drivers/gpu/drm/msm/msm_drv.c                      |   28 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   97 +-
 drivers/gpu/drm/msm/msm_gem.c                      |   75 +-
 drivers/gpu/drm/msm/msm_gem.h                      |   10 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c             |    5 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |    8 +-
 drivers/gpu/drm/msm/msm_gem_vma.c                  |   14 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   56 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |   22 +-
 drivers/gpu/drm/msm/msm_gpu_trace.h                |   83 +
 drivers/gpu/drm/msm/msm_gpummu.c                   |    2 +-
 drivers/gpu/drm/msm/msm_iommu.c                    |  206 ++-
 drivers/gpu/drm/msm/msm_mmu.h                      |   16 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h               |    1 +
 drivers/gpu/drm/msm/msm_submitqueue.c              |    7 +-
 include/drm/drm_dp_helper.h                        |    1 +
 include/linux/adreno-smmu-priv.h                   |   36 +
 89 files changed, 13076 insertions(+), 777 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_audio.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_audio.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_aux.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_aux.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_ctrl.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_ctrl.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_debug.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_debug.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_display.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_display.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_drm.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_drm.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_link.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_link.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_power.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_power.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_reg.h
 create mode 100644 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
 create mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
 create mode 100644 include/linux/adreno-smmu-priv.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
