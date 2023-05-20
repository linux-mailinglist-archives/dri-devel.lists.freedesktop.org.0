Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C81570A42E
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 03:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8116C10E0AB;
	Sat, 20 May 2023 01:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF8B10E0AB
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 01:09:53 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-96aae59bbd6so734382566b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 18:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684544991; x=1687136991;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kU2GbbHboU60Qm/H1WpzNNBulj+BoDNcSq+iIiHvlBo=;
 b=YTL9dNwdYR7B2KiBy4onMVBW07EFHAYbxswnKfyu5JOE/3B4WnajswPSjMohJ4wA6p
 ky8aoZ4mJWn6sqY8XdhvAAob9HBGS8sR1hPpyYlqWPCm4Ve/CQcJoG17hZroP52xixZv
 Xci0ooro4WVVFV1m7mWrx6JVwnBqjfvfrdgV6zVFKGIULWKZyKA8BUHtMKHhA4EXg1+X
 ybpu3x+qvLFPZm68OqcAI6TJ3DmlbP5TZa4ZScg1Bm38aZIySGuEgscurtUcdNJuhgBn
 BNhrcuTJAY7gzUVrBUiFSqCW5GY6wVTvMZA455MLH02v0DpN33pkhg981DcGtCkMtgst
 +vLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684544991; x=1687136991;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kU2GbbHboU60Qm/H1WpzNNBulj+BoDNcSq+iIiHvlBo=;
 b=T0/lm6ZjlUfD+KA522WKKESd94bIePGYPR/N4i3Ga0q6y7upSOfq11ZDyQ0D7wW31z
 aoICa7QCUqPIIUUtkbzmZuEIGOSxyq4Lxdr78iWyap4W/jwyOySyqLPyQJRZBP515J/s
 LDs6WW8sEQPJNynt9rag7sItBS2xj5j5w2mKkvEBMcWlqvZB1lpqz2+rQrOxypV6mQzP
 RR1l8c2uaJ31HjfJg0tuWyTlXuud23YF3/gLKKhK/gkOZQG7TNmioXIRkB424+yv6ZmR
 KZTJETV013nRuPdBKJSoam+nIiy8nQf9LtSaoO9pHzOV8o5sLb8qUJfPpq5KGIPsKU1O
 KtKg==
X-Gm-Message-State: AC+VfDwhkZjFwnzrN0ojEaHJ5D4570hfbAz1xkILlQL5yPmL2LRlVJ/0
 JXFf4fjL2CfKAJf18tdMcsnsVbgquGfrm6OXImI=
X-Google-Smtp-Source: ACHHUZ5XpLwhg3caGbazvyW6rfbZz3hnpZtDgwGnhuODV8W1ie3F11zda5aISOwwW3oJvANgcS+BmSmz17F8oZb5Wag=
X-Received: by 2002:a17:907:3da0:b0:95e:d448:477 with SMTP id
 he32-20020a1709073da000b0095ed4480477mr4278441ejc.33.1684544990708; Fri, 19
 May 2023 18:09:50 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 20 May 2023 11:09:38 +1000
Message-ID: <CAPM=9twwK+sN8iTjojdXd0waG0CUKmDqgyKuBvg76-cjT3PWxA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.4-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Regular fixes pull, amdgpu and msm make up most of these, nothing too
serious, also one i915 and one exynos. I didn't get a misc fixes pull
this week (one of the maintainers is off, so have to engage the
backup) so I think there are a few outstanding patches that will show
up next week,

Dave.

drm-fixes-2023-05-20:
drm fixes for 6.4-rc3

amdgpu:
- update gfx11 clock counter logic
- Fix a race when disabling gfxoff on gfx10/11 for profiling
- Raven/Raven2/PCO clock counter fix
- Add missing get_vbios_fb_size for GMC 11
- Fix a spurious irq warning in the device remove case
- Fix possible power mode mismatch between driver and PMFW
- USB4 fix

exynos:
- fix build warning

i915:
- fix missing NULL check in HDCP code

msm:
- display:
- msm8998: fix fetch and qos to align with downstream
- msm8998: fix LM pairs to align with downstream
- remove unused INTF0 interrupt mask on some chipsets
- remove TE2 block from relevant chipsets
- relocate non-MDP_TOP offset to different header
- fix some indentation
- fix register offets/masks for dither blocks
- make ping-ping block length 0
- remove duplicated defines
- fix log mask for writeback block
- unregister the hdmi codec for dp during unbind
- fix yaml warnings
- gpu:
- fix submit error path leak
- arm-smmu-qcom fix for regression that broke per-process page tables
- fix no-iommu crash
The following changes since commit f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6:

  Linux 6.4-rc2 (2023-05-14 12:51:40 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-05-20

for you to fetch changes up to 79ef1c9d14c65a5c3f7eec47389d8c2a33be8e8d:

  Merge tag 'amd-drm-fixes-6.4-2023-05-18' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2023-05-19
11:26:21 +1000)

----------------------------------------------------------------
drm fixes for 6.4-rc3

amdgpu:
- update gfx11 clock counter logic
- Fix a race when disabling gfxoff on gfx10/11 for profiling
- Raven/Raven2/PCO clock counter fix
- Add missing get_vbios_fb_size for GMC 11
- Fix a spurious irq warning in the device remove case
- Fix possible power mode mismatch between driver and PMFW
- USB4 fix

exynos:
- fix build warning

i915:
- fix missing NULL check in HDCP code

msm:
- display:
- msm8998: fix fetch and qos to align with downstream
- msm8998: fix LM pairs to align with downstream
- remove unused INTF0 interrupt mask on some chipsets
- remove TE2 block from relevant chipsets
- relocate non-MDP_TOP offset to different header
- fix some indentation
- fix register offets/masks for dither blocks
- make ping-ping block length 0
- remove duplicated defines
- fix log mask for writeback block
- unregister the hdmi codec for dp during unbind
- fix yaml warnings
- gpu:
- fix submit error path leak
- arm-smmu-qcom fix for regression that broke per-process page tables
- fix no-iommu crash

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/gfx11: update gpu_clock_counter logic
      drm/amdgpu/gmc11: implement get_vbios_fb_size()

Arnaud Vrac (2):
      drm/msm/dpu: tweak msm8998 hw catalog values
      drm/msm/dpu: tweak lm pairings in msm8998 hw catalog

Arnd Bergmann (1):
      drm/exynos: fix g2d_open/close helper function definitions

Bas Nieuwenhuizen (1):
      drm/amdgpu/gfx10: Disable gfxoff before disabling powergating.

Dave Airlie (4):
      Merge tag 'exynos-drm-fixes-for-v6.4-rc3' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-fixes
      Merge tag 'drm-intel-fixes-2023-05-17' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'drm-msm-fixes-2023-05-17' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      Merge tag 'amd-drm-fixes-6.4-2023-05-18' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Evan Quan (1):
      drm/amd/pm: fix possible power mode mismatch between driver and PMFW

Guchun Chen (1):
      drm/amdgpu: skip disabling fence driver src_irqs when device is unplugged

Guilherme G. Piccoli (1):
      drm/amdgpu/gfx11: Adjust gfxoff before powergating on gfx11 as well

Jesse Zhang (1):
      drm/amdgpu: Differentiate between Raven2 and Raven/Picasso
according to revision id

Jianhua Lu (1):
      dt-bindings: display/msm: dsi-controller-main: Document qcom,
master-dsi and qcom, sync-dual-dsi

Luca Weiss (1):
      drm/msm/iommu: Fix null pointer dereference in no-IOMMU case

Marijn Suijten (9):
      drm/msm/dpu: Assign missing writeback log_mask
      drm/msm/dpu: Remove unused INTF0 interrupt mask from SM6115/QCM2290
      drm/msm/dpu: Remove TE2 block and feature from DPU >= 5.0.0 hardware
      drm/msm/dpu: Move non-MDP_TOP INTF_INTR offsets out of hwio header
      drm/msm/dpu: Reindent REV_7xxx interrupt masks with tabs
      drm/msm/dpu: Fix PP_BLK_DIPHER -> DITHER typo
      drm/msm/dpu: Use V2 DITHER PINGPONG sub-block in SM8[34]50/SC8280XP
      drm/msm/dpu: Set PINGPONG block length to zero for DPU >= 7.0.0
      drm/msm/dpu: Remove duplicate register defines from INTF

Mustapha Ghaddar (1):
      drm/amd/display: enable dpia validate

Rob Clark (5):
      drm/msm/atomic: Don't try async if crtc not active
      drm/msm: Fix vmap madv warning
      drm/msm: Fix submit error-path leaks
      iommu/arm-smmu-qcom: Fix missing adreno_smmu's
      drm/msm: Be more shouty if per-process pgtables aren't working

Srinivas Kandagatla (1):
      drm/msm/dp: unregister audio driver during unbind

Suraj Kandpal (1):
      drm/i915/hdcp: Check if media_gt exists

 .../bindings/display/msm/dsi-controller-main.yaml  | 12 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  8 +++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             | 19 +++++++++----
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              | 33 +++++++++-------------
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             | 21 +++++++++++++-
 .../gpu/drm/amd/display/dc/link/link_validation.c  |  3 ++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 18 ++++++++++++
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    | 20 +------------
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  1 +
 drivers/gpu/drm/exynos/exynos_drm_g2d.h            |  4 +--
 drivers/gpu/drm/i915/display/intel_hdcp.c          | 10 ++++---
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    | 16 +++++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  4 +--
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  4 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  4 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  4 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 12 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  8 +++---
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 24 ++++++++--------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 16 +++++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 16 +++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 17 ++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 23 ++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  5 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h           |  3 --
 drivers/gpu/drm/msm/dp/dp_audio.c                  | 12 ++++++++
 drivers/gpu/drm/msm/dp/dp_audio.h                  |  2 ++
 drivers/gpu/drm/msm/dp/dp_display.c                |  1 +
 drivers/gpu/drm/msm/msm_atomic.c                   |  2 ++
 drivers/gpu/drm/msm/msm_gem.c                      | 22 ++++++---------
 drivers/gpu/drm/msm/msm_gem_submit.c               | 25 +++++++++++-----
 drivers/gpu/drm/msm/msm_iommu.c                    |  9 ++++--
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         | 10 +++++++
 37 files changed, 234 insertions(+), 160 deletions(-)
