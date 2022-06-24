Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47805559289
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 07:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD35A10FF81;
	Fri, 24 Jun 2022 05:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1632A10FF81
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 05:55:51 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id lw20so2559559ejb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 22:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=ez1VrommP2Qk5ZxjhOr9MjaCYHC2kUPrG3Ztqlyf9f8=;
 b=RU8+IA6ajxvlsi2yZP/JStVZvRskiVyWObqhaz9OHyoEF5WuhJtPRhgrAP7Qkubeje
 qNrrwSStpZSqJQOdkDFu8fA1WJfbLqGw+Qa4sjAaftLP4oY2H/NiAL//lzIeK8UVYTOC
 3bJvBBjBOx2KIJqjCOdUCerDTG2i/1EEzcaVAfLBW8TYcu+MYk8mbyhBRhPAJtSp/fT+
 9oV9rojORXEel0lWRgOD/8+qxU8LQYWVs1f/lTB3cV8tozohXhA5TLc+7GveUAoKxsfX
 eOQP3JexIo2tELye7LzJ2BHTV0XDytcgd/4dBhCl1tJRTgQ5tqzNqax6ZbjXSMGiKaXh
 QoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=ez1VrommP2Qk5ZxjhOr9MjaCYHC2kUPrG3Ztqlyf9f8=;
 b=1UfJOjLOZOSe/aisGwa5Agl5VnQrVIpVYrt1+JNa2NuoHMRJUULeNGpn+ZkjLlaMfJ
 Z6/aL5NIeMTnrDoKHIkPWDcrjL+cfGM19FMjNKIXX8NYAULvMslggKXGHrDngrmKSclx
 hfamgQmGwlGoGjOjYm5a+QWVbKWxv26xRWd7tKv01h5cVCtZYMsd5xruNlU6zuLPcwtn
 R26gKbNJNW7Ql2KLOxEE6chSFNsKAQ6myY22JNcWFJ6mCb1puDjwVlae7VU9wuzPIapw
 fdAnCLnwpc5PavWLAdwR2Zh9fojb/00/5m6H3tZ03k87k4DUPjMr/ECW/NVCZUaaHQAj
 WRQA==
X-Gm-Message-State: AJIora8/w8Jk12ZTr+wW479MKMtxQSA9De5TvrBbMGZjvZRijnjBCTKl
 Zt4fQgABNlxSfyRETImTrRzAFjK0MkVn2tDNl1U=
X-Google-Smtp-Source: AGRyM1s9DWSgaaYjKV+ygtUtnyY/xvFVCHDOUJFrF/waPpf+TM39GrCQw57lguYBQp0THNQ39GTLePccCVp24Pr7CKY=
X-Received: by 2002:a17:907:969f:b0:722:d37b:c82d with SMTP id
 hd31-20020a170907969f00b00722d37bc82dmr11784829ejc.770.1656050149326; Thu, 23
 Jun 2022 22:55:49 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 24 Jun 2022 15:55:38 +1000
Message-ID: <CAPM=9tyLoZOkc56K2auFtdjhuUxP=Xwj41evB053YZrHyQNSxg@mail.gmail.com>
Subject: [git pull] drm fixes for 5.19-rc4
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

Fixes for this week, bit larger than normal, but I think the last
couple have been quieter, and it's only rc4. There are a lot of small
msm fixes, and a slightly larger set of vc4 fixes. The vc4 fixes clean
up a lot of crashes around the rPI4 hardware differences from earlier
ones, and problems in the page flip and modeset code which assumed
earlier hw, so I thought it would be okay to keep them in.

Otherwise, it's a few amdgpu, i915, sun4i and a panel quirk.

Let me know if there are any issues. Just a headsup as well myself and
danvet will be out the week 4th-10th July so you might not get an rc6
round, rc5 next week should be fine.

Regards,
Dave.

drm-fixes-2022-06-24:
drm fixes for 5.19-rc4

amdgpu:
- Adjust GTT size logic
- eDP fix for RMB
- DCN 3.15 fix
- DP training fix
- Color encoding fix for DCN2+

sun4i:
- multiple suspend fixes

vc4:
- rework driver split for rpi4,
  fixes multiple crashers.

panel:
- quirk for Aya Neo Next

i915:
- Revert low voltage SKU check removal to fix display issues
- Apply PLL DCO fraction workaround for ADL-S
- Don't show engine classes not present in client fdinfo

msm:
- Workaround for parade DSI bridge power sequencing
- Fix for multi-planar YUV format offsets
- Limiting WB modes to max sspp linewidth
- Fixing the supported rotations to add 180 back for IGT
- Fix to handle pm_runtime_get_sync() errors to avoid unclocked access
  in the bind() path for dpu driver
- Fix the irq_free() without request issue which was a being hit frequently
  in CI.
- Fix to add minimum ICC vote in the msm_mdss pm_resume path to address
  bootup splats
- Fix to avoid dereferencing without checking in WB encoder
- Fix to avoid crash during suspend in DP driver by ensuring interrupt
  mask bits are updated
- Remove unused code from dpu_encoder_virt_atomic_check()
- Fix to remove redundant init of dsc variable
- Fix to ensure mmap offset is initialized to avoid memory corruption
  from unpin/evict
- Fix double runpm disable in probe-defer path
- VMA fenced-unpin fixes
- Fix for WB max-width
- Fix for rare dp resolution change issue
The following changes since commit a111daf0c53ae91e71fd2bfe7497862d14132e3e=
:

  Linux 5.19-rc3 (2022-06-19 15:06:47 -0500)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-06-24

for you to fetch changes up to 1e9124df8be0a43e4e9a10c5d1140d6ca8e50132:

  Merge tag 'drm-msm-fixes-2022-06-20' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes (2022-06-24
10:11:27 +1000)

----------------------------------------------------------------
drm fixes for 5.19-rc4

amdgpu:
- Adjust GTT size logic
- eDP fix for RMB
- DCN 3.15 fix
- DP training fix
- Color encoding fix for DCN2+

sun4i:
- multiple suspend fixes

vc4:
- rework driver split for rpi4,
  fixes multiple crashers.

panel:
- quirk for Aya Neo Next

i915:
- Revert low voltage SKU check removal to fix display issues
- Apply PLL DCO fraction workaround for ADL-S
- Don't show engine classes not present in client fdinfo

msm:
- Workaround for parade DSI bridge power sequencing
- Fix for multi-planar YUV format offsets
- Limiting WB modes to max sspp linewidth
- Fixing the supported rotations to add 180 back for IGT
- Fix to handle pm_runtime_get_sync() errors to avoid unclocked access
  in the bind() path for dpu driver
- Fix the irq_free() without request issue which was a being hit frequently
  in CI.
- Fix to add minimum ICC vote in the msm_mdss pm_resume path to address
  bootup splats
- Fix to avoid dereferencing without checking in WB encoder
- Fix to avoid crash during suspend in DP driver by ensuring interrupt
  mask bits are updated
- Remove unused code from dpu_encoder_virt_atomic_check()
- Fix to remove redundant init of dsc variable
- Fix to ensure mmap offset is initialized to avoid memory corruption
  from unpin/evict
- Fix double runpm disable in probe-defer path
- VMA fenced-unpin fixes
- Fix for WB max-width
- Fix for rare dp resolution change issue

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dpu: limit wb modes based on max_mixer_width

Alex Deucher (1):
      drm/amdgpu: Adjust logic around GTT size (v3)

Dan Carpenter (1):
      drm/vc4: fix error code in vc4_check_tex_size()

Dave Airlie (4):
      Merge tag 'amd-drm-fixes-5.19-2022-06-22' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2022-06-23' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2022-06-22' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'drm-msm-fixes-2022-06-20' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes

George Shen (1):
      drm/amd/display: Fix typo in override_lane_settings

Jason A. Donenfeld (1):
      drm/i915/display: Re-add check for low voltage sku for max dp source =
rate

Jernej Skrabec (1):
      drm/sun4i: Add DMA mask and segment size

Jonathan Marek (1):
      drm/msm: use for_each_sgtable_sg to iterate over scatterlist

Joshua Ashton (1):
      amd/display/dc: Fix COLOR_ENCODING and COLOR_RANGE doing nothing
for DCN20+

Kuogee Hsieh (2):
      drm/msm/dp: check core_initialized before disable interrupts at
dp_display_unbind()
      drm/msm/dp: force link training for display resolution change

Mario Limonciello (1):
      drm/amd: Revert "drm/amd/display: keep eDP Vdd on when eDP
stream is already enabled"

Maxime Ripard (14):
      drm/vc4: plane: Prevent async update if we don't have a dlist
      drm/vc4: Consolidate Hardware Revision Check
      drm/vc4: bo: Rename vc4_dumb_create
      drm/vc4: bo: Split out Dumb buffers fixup
      drm/vc4: drv: Register a different driver on BCM2711
      drm/vc4: kms: Register a different drm_mode_config_funcs on BCM2711
      drm/vc4: plane: Register a different drm_plane_helper_funcs on BCM271=
1
      drm/vc4: drv: Skip BO Backend Initialization on BCM2711
      drm/vc4: crtc: Use an union to store the page flip callback
      drm/vc4: crtc: Move the BO handling out of common page-flip callback
      drm/vc4: crtc: Move the BO Handling out of Common Page-Flip Handler
      drm/vc4: crtc: Don't call into BO Handling on Async Page-Flips on BCM=
2711
      drm/vc4: crtc: Fix out of order frames during asynchronous page flips
      drm/vc4: Warn if some v3d code is run on BCM2711

Maximilian Luz (1):
      drm/msm: Fix double pm_runtime_disable() call

Maya Matuszczyk (1):
      drm: panel-orientation-quirks: Add quirk for Aya Neo Next

Miaoqian Lin (1):
      drm/msm/mdp4: Fix refcount leak in mdp4_modeset_init_intf

Qingqing Zhuo (1):
      drm/amd/display: Fix DC warning at driver load

Rob Clark (7):
      Merge tag 'msm-next-5.19-fixes-06-01' of
https://gitlab.freedesktop.org/abhinavk/msm into msm-fixes-staging
      drm/msm: Ensure mmap offset is initialized
      drm/msm: Switch ordering of runpm put vs devfreq_idle
      drm/msm/gem: Separate object and vma unpin
      drm/msm/gem: Drop early returns in close/purge vma
      drm/msm: Drop update_fences()
      drm/msm: Don't overwrite hw fence in hw_init

Samuel Holland (2):
      drm/sun4i: dw-hdmi: Fix ddc-en GPIO consumer conflict
      drm/sun4i: Fix crash during suspend after component bind failure

Saud Farooqui (2):
      drm/vc4: hdmi: Fixed possible integer overflow
      drm/sun4i: Return if frontend is not present

Tvrtko Ursulin (1):
      drm/i915/fdinfo: Don't show engine classes not present

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915: Implement w/a 22010492432 for adl-s

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  20 ++-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |   2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |   2 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |  24 +--
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c   |   3 +
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c |   3 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |   3 +
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |   6 +
 drivers/gpu/drm/i915/display/intel_dp.c            |  32 +++-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   4 +-
 drivers/gpu/drm/i915/i915_drm_client.c             |   5 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |   9 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |   2 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  33 +++-
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   2 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |  16 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   2 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   1 +
 drivers/gpu/drm/msm/msm_fence.c                    |   8 +-
 drivers/gpu/drm/msm/msm_gem.c                      |   7 +-
 drivers/gpu/drm/msm/msm_gem.h                      |  11 +-
 drivers/gpu/drm/msm/msm_gem_prime.c                |  15 ++
 drivers/gpu/drm/msm/msm_gem_submit.c               |  18 +-
 drivers/gpu/drm/msm/msm_gem_vma.c                  |   6 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |  27 +--
 drivers/gpu/drm/msm/msm_iommu.c                    |   2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c               |   2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |  12 +-
 drivers/gpu/drm/sun4i/sun4i_layer.c                |   2 +-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c              |  54 +-----
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h              |   2 -
 drivers/gpu/drm/vc4/vc4_bo.c                       |  62 ++++++-
 drivers/gpu/drm/vc4/vc4_crtc.c                     | 196 +++++++++++++++--=
----
 drivers/gpu/drm/vc4/vc4_drv.c                      |  97 ++++++++--
 drivers/gpu/drm/vc4/vc4_drv.h                      |  19 +-
 drivers/gpu/drm/vc4/vc4_gem.c                      |  40 +++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   2 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                      |  18 +-
 drivers/gpu/drm/vc4/vc4_irq.c                      |  16 ++
 drivers/gpu/drm/vc4/vc4_kms.c                      |  24 ++-
 drivers/gpu/drm/vc4/vc4_perfmon.c                  |  47 ++++-
 drivers/gpu/drm/vc4/vc4_plane.c                    |  29 ++-
 drivers/gpu/drm/vc4/vc4_render_cl.c                |   4 +
 drivers/gpu/drm/vc4/vc4_v3d.c                      |  15 ++
 drivers/gpu/drm/vc4/vc4_validate.c                 |  16 ++
 drivers/gpu/drm/vc4/vc4_validate_shaders.c         |   4 +
 47 files changed, 670 insertions(+), 268 deletions(-)
