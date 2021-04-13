Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F20435E867
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 23:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00196E200;
	Tue, 13 Apr 2021 21:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939D36E200
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 21:39:17 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id 12so17867355wrz.7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 14:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RKEsNHOFUnMxRuQp616dtdwmyGU0NgZDQjm0d2A9jsw=;
 b=divXTn1P7LNtoFmPQUvXL5mGTKpFSQhgDuTg9O48mDwvcQU9EHHTc20br3TtFPrhom
 mnomNF6lH8qxawxGYkJ0RZLiPWRg5zofUN0Z9vigPdYZqoLoKDqcXpspOPq0ANNvdD2s
 gy0wXSHLtys0ZA4bkP5tpKw/BmN7dYCmStSVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RKEsNHOFUnMxRuQp616dtdwmyGU0NgZDQjm0d2A9jsw=;
 b=qTTSDjI65MhffMF8E6H8tskCmF4B/f7GxTVIax6IdO6Xp2b0dCtCYgi4WuAg5tY8Ld
 uXBjEZ0s1a0AFwtUaDWoI0P5faQcJ5NwMYP3siBTyzsImzLeaMrsojtL9CK9PirbhAdZ
 ZtTTHE5aaGwvHJal7fPr1RgxyIGGK8I11MfSrrXcukG6cywzaawfBYrdUo8nH9V69l1Q
 0//iAXVbk3H3iW7/ROGh9qmo4EM7yDljoqmuTSyCUT0bngNinmPgoEpQvLTj2DIeueNd
 lLdjoaVp0C1DUMtefKcX/t8YUXA3UJVsfWQzWRQErxWptsA3QLZTXm8W6eDkomL006d7
 oscA==
X-Gm-Message-State: AOAM533HDmMMmajhyLNk1v7AT2sOlYIL5wt/ZScEDlZWutasqUqxY7wT
 jfHe+Z3m6jbycaqMlHLNytMB1w==
X-Google-Smtp-Source: ABdhPJzJeJ8Qn4Z1o2TIdrxQ/N0mbKTx/h2pTPJCQsuJeHVtQO1yZPPbnuHFtgQvj4RVU9ROT7PnjQ==
X-Received: by 2002:a5d:6a08:: with SMTP id m8mr31463813wru.57.1618349956291; 
 Tue, 13 Apr 2021 14:39:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w22sm3533594wmc.13.2021.04.13.14.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 14:39:15 -0700 (PDT)
Date: Tue, 13 Apr 2021 23:39:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [pull] drm/msm: drm-msm-next for 5.13
Message-ID: <YHYPdbO8ZZ676aTU@phenom.ffwll.local>
References: <CAF6AEGvL=4aw15qoY8fbKG9FCgnx8Y-dCtf7xiFwTQSHopwSQg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGvL=4aw15qoY8fbKG9FCgnx8Y-dCtf7xiFwTQSHopwSQg@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 11, 2021 at 05:53:32PM -0700, Rob Clark wrote:
> Hi Dave&Daniel,
> 
> This time around a bit larger than usual, but a large part of that is
> Dmitry's dsi phy/pll refactor (which is itself a pretty large negative
> diffstat).  The dsi phy/pll refactor includes a couple clk patches a-b
> the maintainer.  (For folks actually trying to boot msm-next, there is
> one clk fix required, which should hopefully land in 5.12 but not in
> msm-next.. https://patchwork.freedesktop.org/patch/427412/)
> 
> * Big DSI phy/pll cleanup
> * Initial support for sc7280
> * compatibles fixes for sm8150/sm8250
> * cleanups for all dpu gens to use same bandwidth scaling paths (\o/)
> * various shrinker path lock contention optimizations
> * unpin/swap support for GEM objects (disabled by default, enable with
>   msm.enable_eviction=1 .. due to various combinations of iommu drivers
>   with older gens I want to get more testing on hw I don't have in front
>   of me before enabling by default)
> * The usual assortment of misc fixes and cleanups
> 
> The following changes since commit 1e28eed17697bcf343c6743f0028cc3b5dd88bf0:
> 
>   Linux 5.12-rc3 (2021-03-14 14:41:02 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2021-04-11
> 
> for you to fetch changes up to a29c8c0241654d5f3165d52e9307e4feff955621:
> 
>   drm/msm/disp/dpu1: fix display underruns during modeset. (2021-04-09

Pulled into drm-next, thanks for your pull. Maybe to make this even
easier for us: Pull summary in the tag is nice :-)

Dave, I've done a backmerge of drm-fixes into drm-next first since this
was on a newer baseline. I asked Alex to double-check the result just in
case.
-Daniel

> 12:02:35 -0700)
> 
> ----------------------------------------------------------------
> Abhinav Kumar (3):
>       drm/msm/dp: Fix indentation kbot warnings in DP driver
>       drm/msm/dp: Fix incorrect NULL check kbot warnings in DP driver
>       drm/msm/dp: delete unnecessary debugfs error handling
> 
> Akhil P Oommen (2):
>       drm/msm/a6xx: Fix perfcounter oob timeout
>       drm/msm: Select CONFIG_NVMEM
> 
> AngeloGioacchino Del Regno (2):
>       drm/msm/dsi: Uncomment core_mmss clock for MSM8996
>       drm/msm/mdp5: Disable pingpong autorefresh at tearcheck init
> 
> Bernard Zhao (1):
>       gpu/drm/msm: remove redundant pr_err() when devm_kzalloc failed
> 
> Bhaskar Chowdhury (1):
>       drivers: gpu: drm: msn: disp: dpu1: Fixed couple of spellings in
> the file dpu_hw_top.h
> 
> Bjorn Andersson (1):
>       drm/msm: Remove need for reiterating the compatibles
> 
> Colin Ian King (1):
>       drm/msm: Fix spelling mistake "Purgable" -> "Purgeable"
> 
> Dmitry Baryshkov (32):
>       drm/msm/dsi: fix check-before-set in the 7nm dsi_pll code
>       drm/msm/dsi_pll_7nm: Solve TODO for multiplier frac_bits assignment
>       drm/msm/dsi_pll_7nm: Fix variable usage for pll_lockdet_rate
>       drm/msm: fix shutdown hook in case GPU components failed to bind
>       drm/msm: a6xx: fix version check for the A650 SQE microcode
>       clk: mux: provide devm_clk_hw_register_mux()
>       clk: divider: add devm_clk_hw_register_divider
>       drm/msm/dsi: replace PHY's init callback with configurable data
>       drm/msm/dsi: fuse dsi_pll_* code into dsi_phy_* code
>       drm/msm/dsi: drop multiple pll enable_seq support
>       drm/msm/dsi: move all PLL callbacks into PHY config struct
>       drm/msm/dsi: drop global msm_dsi_phy_type enumaration
>       drm/msm/dsi: move min/max PLL rate to phy config
>       drm/msm/dsi: remove msm_dsi_pll_set_usecase
>       drm/msm/dsi: push provided clocks handling into a generic code
>       drm/msm/dsi: use devm_clk_*register to registe DSI PHY clocks
>       drm/msm/dsi: use devm_of_clk_add_hw_provider
>       drm/msm/dsi: make save/restore_state phy-level functions
>       drm/msm/dsi: drop vco_delay setting from 7nm, 10nm, 14nm drivers
>       drm/msm/dsi: simplify vco_delay handling in dsi_phy_28nm driver
>       drm/msi/dsi: inline msm_dsi_pll_helper_clk_prepare/unprepare
>       drm/msm/dsi: make save_state/restore_state callbacks accept msm_dsi_phy
>       drm/msm/dsi: drop msm_dsi_pll abstraction
>       drm/msm/dsi: drop PLL accessor functions
>       drm/msm/dsi: move ioremaps to dsi_phy_driver_probe
>       drm/msm/dsi: remove duplicate fields from dsi_pll_Nnm instances
>       drm/msm/dsi: remove temp data from global pll structure
>       drm/msm/dsi: inline msm_dsi_phy_set_src_pll
>       drm/msm/dsi: stop passing src_pll_id to the phy_enable call
>       drm/msm/dpu: enable DPU_SSPP_QOS_8LVL for SM8250
>       drm/msm/dpu: fill missing details in hw catalog for sdm845 and sm8[12]50
>       drm/msm/dpu: always use mdp device to scale bandwidth
> 
> Douglas Anderson (1):
>       drm/msm: Fix speed-bin support not to access outside valid memory
> 
> Fabio Estevam (1):
>       drm/msm: Fix suspend/resume on i.MX5
> 
> John Stultz (1):
>       drm/msm: Fix removal of valid error case when checking speed_bin
> 
> Jonathan Marek (2):
>       drm/msm: fix a6xx_gmu_clear_oob
>       drm/msm: add compatibles for sm8150/sm8250 display
> 
> Jordan Crouse (1):
>       drm/msm: a6xx: Make sure the SQE microcode is safe
> 
> Kalyan Thota (4):
>       drm/msm/disp/dpu1: icc path needs to be set before dpu runtime resume
>       drm/msm/disp/dpu1: program 3d_merge only if block is attached
>       drm/msm/disp/dpu1: turn off vblank irqs aggressively in dpu driver
>       drm/msm/disp/dpu1: fix display underruns during modeset.
> 
> Konrad Dybcio (1):
>       drm/msm/adreno: a5xx_power: Don't apply A540 lm_setup to other GPUs
> 
> Krishna Manikandan (7):
>       drm/msm/disp/dpu1: add support for display for SC7280 target
>       drm/msm/disp/dpu1: add intf offsets for SC7280 target
>       drm/msm/disp/dpu1: add support to program fetch active in ctl path
>       drm/msm/disp/dpu1: enable DATA_HCTL_EN for sc7280 target
>       drm/msm/disp/dpu1: increase the range of interrupts in dpu_irq_map
>       drm/msm/disp/dpu1: add vsync and underrun irqs for INTF_5
>       drm/msm/disp/dpu1: add flags to indicate obsolete irqs
> 
> Marijn Suijten (2):
>       drm/msm/mdp5: Configure PP_SYNC_HEIGHT to double the vtotal
>       drm/msm/mdp5: Do not multiply vclk line count by 100
> 
> Rob Clark (18):
>       drm/msm: Ratelimit invalid-fence message
>       drm/msm: Fix a5xx/a6xx timestamps
>       Merge tag 'drm-msm-fixes-2021-04-02' into msm-next
>       drm/msm: Remove unused freed llist node
>       drm/msm: Avoid mutex in shrinker_count()
>       drm/msm: Fix debugfs deadlock
>       drm/msm: Improved debugfs gem stats
>       drm/msm: Drop mm_lock in scan loop
>       drm/msm: Fix spelling "purgable" -> "purgeable"
>       drm/msm: Add param for userspace to query suspend count
>       drm/msm: ratelimit GEM related WARN_ON()s
>       drm/msm: Reorganize msm_gem_shrinker_scan()
>       drm/msm: Clear msm_obj->sgt in put_pages()
>       drm/msm: Split iova purge and close
>       drm/msm: Add $debugfs/gem stats on resident objects
>       drm/msm: Track potentially evictable objects
>       drm/msm: Small msm_gem_purge() fix
>       drm/msm: Support evicting GEM objects to swap
> 
> Stephen Boyd (3):
>       drm/msm/kms: Use nested locking for crtc lock instead of custom classes
>       drm/msm/dp: Restore aux retry tuning logic
>       drm/msm: Set drvdata to NULL when msm_drm_init() fails
> 
>  drivers/clk/clk-mux.c                              |   35 +
>  drivers/gpu/drm/msm/Kconfig                        |    9 +-
>  drivers/gpu/drm/msm/Makefile                       |    9 -
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |    4 +-
>  drivers/gpu/drm/msm/adreno/a5xx_power.c            |    2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   14 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  108 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c            |    3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c       |    4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |    1 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   88 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   30 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |   11 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |    1 +
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   26 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  195 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   10 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   31 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |    3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |  793 ++++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |    5 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |    1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |    4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   19 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c           |   54 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c   |   19 +-
>  drivers/gpu/drm/msm/dp/dp_aux.c                    |    7 +
>  drivers/gpu/drm/msm/dp/dp_debug.c                  |   33 +-
>  drivers/gpu/drm/msm/dp/dp_hpd.c                    |    4 +-
>  drivers/gpu/drm/msm/dp/dp_power.c                  |    2 +-
>  drivers/gpu/drm/msm/dsi/dsi.h                      |   60 +-
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |    6 +-
>  drivers/gpu/drm/msm/dsi/dsi_host.c                 |    6 +-
>  drivers/gpu/drm/msm/dsi/dsi_manager.c              |   30 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  161 +--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   41 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         |  747 ++++++++++++-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  939 ++++++++++++++++-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c         |   16 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c         |  654 +++++++++++-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c    |  479 ++++++++-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  774 +++++++++++++-
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll.c              |  184 ----
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll.h              |  130 ---
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c         |  881 ----------------
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c         | 1096 --------------------
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c         |  643 ------------
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c    |  526 ----------
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c          |  912 ----------------
>  drivers/gpu/drm/msm/msm_atomic.c                   |    7 +-
>  drivers/gpu/drm/msm/msm_debugfs.c                  |   14 +-
>  drivers/gpu/drm/msm/msm_drv.c                      |   36 +-
>  drivers/gpu/drm/msm/msm_drv.h                      |   29 +-
>  drivers/gpu/drm/msm/msm_fb.c                       |    3 +-
>  drivers/gpu/drm/msm/msm_fence.c                    |    2 +-
>  drivers/gpu/drm/msm/msm_gem.c                      |  212 +++-
>  drivers/gpu/drm/msm/msm_gem.h                      |  126 ++-
>  drivers/gpu/drm/msm/msm_gem_shrinker.c             |  166 ++-
>  drivers/gpu/drm/msm/msm_gpu.c                      |    2 +
>  drivers/gpu/drm/msm/msm_gpu.h                      |    2 +
>  drivers/gpu/drm/msm/msm_gpu_trace.h                |   13 +
>  drivers/gpu/drm/msm/msm_kms.h                      |    8 +-
>  include/linux/clk-provider.h                       |   30 +
>  include/uapi/drm/msm_drm.h                         |    1 +
>  65 files changed, 5402 insertions(+), 5071 deletions(-)
>  delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll.c
>  delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h
>  delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
>  delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c
>  delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
>  delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c
>  delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
