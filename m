Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5265356CFDB
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 17:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0052714B35E;
	Sun, 10 Jul 2022 15:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A691014B35E;
 Sun, 10 Jul 2022 15:50:01 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id bu1so3001077wrb.9;
 Sun, 10 Jul 2022 08:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=jV/Mu4v8labDo65Gta5GWSD9PaWxanu6XD6oMSKF73k=;
 b=aOfeGIi/tUKGG+rIKIsBoO2dijucgg+gsNawh/pkQLPe7CRv62TCNHI4KvImUXLC5s
 mT1htWF/pYZvDNU4RxGQGAKkwWkM2kAcnRm++Vo05sdSmH1UuiL7Wsfp29NWOLJ30KxC
 bpMYyGSc6WgBqtT/uN7Kp0aItlKT7tuFk+VxRVAGx9YhWemtuUOIMYvgwzTXdldd1jOk
 bAaB6mZAUmDeiSb5+iSGnHZVHJRkRxtV4QgC4GsbBLSmZIxBAuQsB48fRXlQEkM6BNfB
 WW2H9oHsnyCQJOn3hJMBxiEKldwCbLSlR8uEl+E9VnRkhlmNYr7SWusEbGKqcM6Fj9CS
 aULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=jV/Mu4v8labDo65Gta5GWSD9PaWxanu6XD6oMSKF73k=;
 b=pJQY7ugXJhF6w0pjoqSRjo42ULqogdCLzcNAH+umGCguUuZSfunh2Mpj9O0RtPuj1K
 OS6vx6sLz31vm6Eiw/+JmU8PDsHifMbMCGRvC1L/bqEr315xw844IVSclpxHb4TIqPj2
 TMej0wqsjxgSLBQwFC2i4ZEbC93O7h/LzRI0cFKfH/jdUr2VGoA2BbqSIHj89cc+bDXh
 cTSh0XxM1MS4JLPtrMV2tk4Dgxn+xBdEzxoWp4E1ci4dZOM+xDBmvth559300bxRZZdm
 fUFG8ky/nlX6LDhjOrymwSrEkcpOQTIzzVR0dJiUfxA/7Gm7Oc9WTGG6hCwWdYfISV1a
 X5Bw==
X-Gm-Message-State: AJIora+Vidy5ZYsKg0ciVKpQG1aMhdK96nFN4TA12buubSc5Yta6Uvia
 8YCiPP/MzpPnhvnn9egGrJy+bWAclp96rnrl/Sk=
X-Google-Smtp-Source: AGRyM1vqfmdTkO3NLmPXwAxlRkD8vMRusnu+Uds7jY6iDUls2I602hLPY/kutjEmNhyAUpuFZ5Wi46VeWLDnFG7UuZA=
X-Received: by 2002:a5d:5908:0:b0:21d:6e91:9f3 with SMTP id
 v8-20020a5d5908000000b0021d6e9109f3mr13167402wrd.52.1657468200038; Sun, 10
 Jul 2022 08:50:00 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 10 Jul 2022 08:50:16 -0700
Message-ID: <CAF6AEGtuqswBGPw-kCYzJvckK2RR1XTeUEgaXwVG_mvpbv3gPA@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2022-07-10 for v5.20
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Here is main drm/msm pull for v5.20, description below and in tag

The following changes since commit b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3:

  Linux 5.19-rc2 (2022-06-12 16:11:37 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2022-07-10

for you to fetch changes up to cb77085b1f0a86ef9dfba86b5f3ed6c3340c2ea3:

  drm/msm/dpu: Fix for non-visible planes (2022-07-08 08:10:58 -0700)

----------------------------------------------------------------
Next for v5.20

GPU:
- a619 support
- Fix for unclocked GMU register access
- Devcore dump enhancements

Core:

- client utilization via fdinfo support
- fix fence rollover issue
- gem: Lockdep false-positive warning fix
- gem: Switch to pfn mappings

DPU:

- constification of HW catalog
- support for using encoder as CRC source
- WB support on sc7180
- WB resolution fixes

DP:

- dropped custom bulk clock implementation
- made dp_bridge_mode_valid() return MODE_CLOCK_HIGH where applicable
- fix link retraining on resolution change

MDP5:

- MSM8953 perf data

HDMI:

- YAML'ification of schema
- dropped obsolete GPIO support
- misc cleanups

----------------------------------------------------------------
Abhinav Kumar (5):
      drm/msm/dpu: limit wb modes based on max_mixer_width
      drm/msm/dpu: add writeback support for sc7180
      drm/msm/dpu: move intf and wb assignment to dpu_encoder_setup_display()
      drm/msm/dpu: fix maxlinewidth for writeback block
      drm/msm/dpu: remove hard-coded linewidth limit for writeback

Dmitry Baryshkov (45):
      drm/msm/dpu: use feature bit for LM combined alpha check
      drm/msm/dpu: move VBIF_XINL_QOS_LVL_REMAP size to hw_catalog
      drm/msm/dpu: remove hwversion field from data structures
      drm/msm/dpu: change catalog->perf to be a const pointer
      drm/msm/dpu: change catalog->dma_cfg to be a const pointer
      drm/msm/dpu: constify struct dpu_mdss_cfg
      drm/msm/dpu: make dpu hardware catalog static const
      drm/msm/dpu: dont_use IS_ERR_OR_NULL for encoder phys backends
      drm/msm/dpu: drop enum msm_display_caps
      drm/msm/dp: "inline" dp_ctrl_set_clock_rate("ctrl_link")
      drm/msm/dp: set stream_pixel rate directly
      drm/msm/dp: inline dp_power_clk_set_rate()
      drm/msm/dp: rewrite dss_module_power to use bulk clock functions
      drm/msm/dpu: simplify and unify dpu_encoder_get_intf and
dpu_encoder_get_wb
      drm/msm/dp: make dp_bridge_mode_valid() more precise
      drm/msm/hdmi: fill the pwr_regs bulk regulators
      drm/msm/dp: use ARRAY_SIZE for calculating num_descs
      dt-bindings: display/msm: hdmi: split and convert to yaml
      dt-bindings: display/msm: hdmi: mark old GPIO properties as deprecated
      dt-bindings: display/msm: hdmi: mark hdmi-mux-supply as deprecated
      drm/msm/hdmi: drop the hdmi-mux support
      drm/msm/hdmi: drop unused GPIO support
      drm/msm/hdmi: enable core-vcc/core-vdda-supply for 8996 platform
      drm/msm/hdmi: drop empty 'none' regulator lists
      drm/msm/hdmi: drop hpd_regs usage on 8x74/8084
      drm/msm/hdmi: merge platform config for 8974/8084/8994/8996
      drm/msm/hdmi: reuse MSM8960's config for MSM8660
      drm/msm/hdmi-phy: populate 8x60 HDMI PHY requirements
      drm/msm/hdmi: drop empty bridge callbacks
      drm/msm/hdmi: support attaching the "next" bridge
      drm/msm/mdp4: move iommu_domain_alloc() call close to its usage
      drm/msm/mdp4: get rid of struct mdp4_platform_config
      Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu',
'msm-next-lumag-dp', 'msm-next-lumag-dsi', 'msm-next-lumag-hdmi',
'msm-next-lumag-mdp5' and 'msm-next-lumag-mdp4' into msm-next-lumag
      drm/msm/dpu: drop xin_id from struct dpu_hw_blk_reg_map
      drm/msm/dpu: drop length from struct dpu_hw_blk_reg_map
      drm/msm/dpu: merge base_off with blk_off in struct dpu_hw_blk_reg_map
      drm/msm/dpu: move struct dpu_hw_blk definition to dpu_hw_utils.h
      drm/msm/dpu: check both DPU and MDSS devices for the IOMMU
      drm/msm/mdp5: move iommu_domain_alloc() call close to its usage
      drm/msm: Stop using iommu_present()
      drm/msm: move KMS aspace init to the separate helper
      drm/msm: switch msm_kms_init_aspace() to use device_iommu_mapped()
      drm/msm/dp: remove unused stubs
      drm/msm/dp: rename second dp_display_enable()'s argument
      drm/msm/dp: remove dp_display_en/disable prototypes and data argument

Douglas Anderson (2):
      dt-bindings: msm/dp: List supplies in the bindings
      drm/msm: Avoid unclocked GMU register access in 6xx gpu_busy

Geert Uytterhoeven (1):
      drm/msm/adreno: Do not propagate void return values

Jessica Zhang (4):
      drm/msm/dpu: Move LM CRC code into separate method
      drm/msm/dpu: Move MISR methods to dpu_hw_util
      drm/msm/dpu: Add MISR register support for interface
      drm/msm/dpu: Add interface support for CRC debugfs

Jonathan Marek (1):
      drm/msm: use for_each_sgtable_sg to iterate over scatterlist

Kalyan Thota (1):
      drm/msm/disp/dpu1: add dspp support for sc7280

Konrad Dybcio (4):
      drm/msm/adreno: Remove dead code
      drm/msm/adreno: Add A619 support
      drm/msm/a6xx: Add speedbin support for A619 GPU
      drm/msm/adreno: Fix up formatting

Kuogee Hsieh (4):
      drm/msm/dp: check core_initialized before disable interrupts at
dp_display_unbind()
      drm/msm/dp: force link training for display resolution change
      drm/msm/dp: reset drm_dev to NULL at dp_display_unbind()
      dt-bindings: msm: update maintainers list with proper id

Maximilian Luz (1):
      drm/msm: Fix double pm_runtime_disable() call

Miaoqian Lin (1):
      drm/msm/mdp4: Fix refcount leak in mdp4_modeset_init_intf

Rob Clark (24):
      Merge tag 'msm-next-5.19-fixes-06-01' of
https://gitlab.freedesktop.org/abhinavk/msm into msm-fixes-staging
      drm/msm: Ensure mmap offset is initialized
      drm/msm: Switch ordering of runpm put vs devfreq_idle
      drm/msm/gem: Separate object and vma unpin
      drm/msm/gem: Drop early returns in close/purge vma
      drm/msm: Drop update_fences()
      drm/msm: Don't overwrite hw fence in hw_init
      drm/msm/gem: Fix error return on fence id alloc fail
      Merge tag 'drm-msm-fixes-2022-06-28' into msm-next-staging
      drm/msm: Make msm_gem_free_object() static
      drm: Add DRM_GEM_FOPS
      drm/msm: Expose client engine utilization via fdinfo
      drm/msm: Fix fence rollover issue
      drm/msm/adreno: Allow larger address space size
      drm/msm: Fix %d vs %u
      drm/msm/gpu: Capture all BO addr+size in devcore
      drm/msm/gpu: Add GEM debug label to devcore
      drm/msm/gem: Drop obj lock in msm_gem_free_object()
      drm/msm/adreno: Defer enabling runpm until hw_init()
      drm/msm: Deprecate MSM_BO_UNCACHED harder
      drm/msm: Switch to pfn mappings
      drm/msm: Make enable_eviction flag static
      drm/msm/mdp5: Fix global state lock backoff
      drm/msm/dpu: Fix for non-visible planes

Stephen Boyd (2):
      drm/msm/dpu: Increment vsync_cnt before waking up userspace
      drm/msm/dp: Remove encoder pointer from struct msm_dp

Vladimir Lypak (2):
      drm/msm/dsi: Use single function for reset
      drm/msm/mdp5: Add perf data for MDP v1.16

Wan Jiabing (1):
      drm/msm: Use div64_ul instead of do_div

sunliming (1):
      drm/msm/dpu: Fix variable dereferenced before check

 .../bindings/display/msm/dp-controller.yaml        |   8 +-
 .../devicetree/bindings/display/msm/hdmi.txt       |  99 ----
 .../devicetree/bindings/display/msm/hdmi.yaml      | 232 ++++++++++
 .../bindings/phy/qcom,hdmi-phy-other.yaml          | 104 +++++
 .../devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml |  85 ++++
 Documentation/gpu/drm-usage-stats.rst              |  21 +
 drivers/gpu/drm/msm/Makefile                       |   1 -
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   8 -
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  30 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 106 ++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   3 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |  65 ++-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  23 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  43 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  32 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |  24 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h      |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 117 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 166 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  26 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h         |  25 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 514 +++++++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |   9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h        |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  24 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |  53 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h     |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |  55 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |  36 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c        |   9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  39 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |   9 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  31 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |   6 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |  21 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h           |   6 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |  31 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c          |   3 +-
 drivers/gpu/drm/msm/dp/dp_clk_util.c               | 120 -----
 drivers/gpu/drm/msm/dp/dp_clk_util.h               |  38 --
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  46 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   2 +-
 drivers/gpu/drm/msm/dp/dp_display.c                | 116 ++---
 drivers/gpu/drm/msm/dp/dp_display.h                |   1 -
 drivers/gpu/drm/msm/dp/dp_drm.c                    |   8 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |   2 +-
 drivers/gpu/drm/msm/dp/dp_parser.c                 |  43 +-
 drivers/gpu/drm/msm/dp/dp_parser.h                 |   6 +-
 drivers/gpu/drm/msm/dp/dp_power.c                  | 104 +----
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  48 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                    | 126 ++---
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |  15 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  10 -
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c                |  62 +--
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c           |  12 +
 drivers/gpu/drm/msm/msm_drv.c                      |  83 +++-
 drivers/gpu/drm/msm/msm_drv.h                      |  12 +-
 drivers/gpu/drm/msm/msm_fence.c                    |  19 +-
 drivers/gpu/drm/msm/msm_gem.c                      |  29 +-
 drivers/gpu/drm/msm/msm_gem.h                      |  26 +-
 drivers/gpu/drm/msm/msm_gem_prime.c                |  15 +
 drivers/gpu/drm/msm/msm_gem_shrinker.c             |   2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |  20 +-
 drivers/gpu/drm/msm/msm_gem_vma.c                  |   6 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |  90 ++--
 drivers/gpu/drm/msm/msm_gpu.h                      |  31 +-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c              |  41 +-
 drivers/gpu/drm/msm/msm_iommu.c                    |   2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c               |   2 +-
 include/drm/drm_gem.h                              |  26 +-
 94 files changed, 1864 insertions(+), 1526 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/hdmi.yaml
 create mode 100644
Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_clk_util.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_clk_util.h
