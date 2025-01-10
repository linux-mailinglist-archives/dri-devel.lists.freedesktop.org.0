Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8829DA09C70
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 21:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0239710E03E;
	Fri, 10 Jan 2025 20:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z58KNZma";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFFF10E03E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 20:29:32 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-aaf3c3c104fso411145166b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 12:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736540911; x=1737145711; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nbsjCb3u66mpBVZchgSydQ2hBJPJoIC3s+2MGX9rIQc=;
 b=Z58KNZmaa97WmKpdpx4Zbw4w7k7yOc5IFngruUKkltBc+VthJb+AJsmS37tSCc713E
 im/9bnu99pFKF75Z6Lf6+I52x+9VHTwwNVgyL2YbxIt9b06a45TRPK6Y6Xx8dqkkvQak
 3jfqqaFBbeVxh5iCTZ1EsHgGwAEPZAdfHiVgL7VTBlSJywxQsbCGOGS31F/fUtXT0EeW
 jSGFlVQqIsvdx1QwBgo3Ui0UHk82sHw15FUzGhRgcm+ULXFfHpPvodcteVftQnmM/XOc
 rFyaOZuw0ccte6UCoF4+cMjjfWq+TRQ1YFr8agoXjfFA98B1lOeEUX/UIHR3RIMTppgx
 qWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736540911; x=1737145711;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nbsjCb3u66mpBVZchgSydQ2hBJPJoIC3s+2MGX9rIQc=;
 b=Ywn6ecznQw40LfuQt3mJaDDRXBhoZFfZkpePKy/Sm5ROUZg7h4rSGEhH3yVzZ8wKIx
 wTrd+N6olgPxGYhbqpLGu/FnQybC9HrVPVuVedrMNEWVo4kNJGexZKZjJFV3J+xbiV8p
 TCgTYHPVyiNKGyweVtKK6cQekmQhEG3GATJ2wkp6tXQZZtgehN9H62dS3Tbq84Tq9Q2p
 8hP/QBXqiqkpjK4qqkrZjiu/qH4XsGfGf34JocunI9J41kOpkbgSvbjkEHOd/SIZhOQf
 aBkXUNHto4skARX7pggkhl7ihZJxZd8SLWrnW3VyuW6bZfmvJy8ZiK6QlHlB6coh6GuS
 nALA==
X-Gm-Message-State: AOJu0YwDZgDyT88N3aGLAgMKCQznbKNvf0l9pVXLRO7FyT2xQUwwjBm7
 Zad4ZKQgNjcrNJveHC2qHb3j2QhMk54za8JpgDstmw+LRBmq5FPP7neXiKjXmkz/HM2RQZxbQni
 mKUihtFw1HOadKtN/2mgVZsGJ+38=
X-Gm-Gg: ASbGncv1HV9h+yT9QCsJJ+kXbWLfqxmT2H2qI8JHDbC+AxDvVHCc2jye6bR2d0QjhNg
 DXxAfV+ZsSDoWxh+mVOqoQi1ax8eME0qD6qZw
X-Google-Smtp-Source: AGHT+IF3Bs7wVY3t6k5Bvls/0ls3kgs7eQNNpLbTid711JOYOycLTj7CanK+J7AmRASOy2WtMW/RX1RP92bZeGdsvOg=
X-Received: by 2002:a17:906:7950:b0:aaf:4008:5e2d with SMTP id
 a640c23a62f3a-ab2aa3f4439mr1060276166b.0.1736540911097; Fri, 10 Jan 2025
 12:28:31 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 11 Jan 2025 06:28:19 +1000
X-Gm-Features: AbW1kva9lgReT8jJ0RmBZy_2c5iOkh262OPNZck2UlWvBblfSotW3SFU2J6zTec
Message-ID: <CAPM=9twk2XVFSgSqQy_PTQZagPJ0V-G6jpgoFcLnCUvzu_0Y8Q@mail.gmail.com>
Subject: [git pull] drm fixes for 6.13-rc7
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Regular weekly fixes, this has the usual amdgpu/xe/i915 bits. There is
a bigger bunch of mediatek patches that I considered not including at
this stage, but all the changes (except for one were obvious small
fixes, and the rotation one is a few lines, and I suppose will help
someone have their screen up the right way), I decided to include it
since I expect it got slowed down by holidays etc, and it's not that
mainstream a hw platform.

It looks like I might be travelling for merge window, so I'll see
about sending PR in advance next week,

Dave.

drm-fixes-2025-01-11:
drm fixes for 6.13-rc7

i915:
- Revert "drm/i915/hdcp: Don't enable HDCP1.4 directly from check_link"

amdgpu:
- Display interrupt fixes
- Fix display max surface mismatches
- Fix divide error in DM plane scale calcs
- Display divide by 0 checks in dml helpers
- SMU 13 AD/DC interrrupt handling fix
- Fix locking around buddy trim handling

amdkfd:
- Fix page fault with shader debugger enabled
- Fix eviction fence wq handling

xe:
- Avoid a NULL ptr deref when wedging
- Fix power gate sequence on DG1

mediatek:
- Revert "drm/mediatek: dsi: Correct calculation formula of PHY Timing"
- Set private->all_drm_private[i]->drm to NULL if mtk_drm_bind returns err
- Move mtk_crtc_finish_page_flip() to ddp_cmdq_cb()
- Only touch DISP_REG_OVL_PITCH_MSB if AFBC is supported
- Add support for 180-degree rotation in the display driver
- Stop selecting foreign drivers
- Revert "drm/mediatek: Switch to for_each_child_of_node_scoped()"
- Fix YCbCr422 color format issue for DP
- Fix mode valid issue for dp
- dp: Reference common DAI properties
- dsi: Add registers to pdata to fix MT8186/MT8188
- Remove unneeded semicolon
- Add return value check when reading DPCD
- Initialize pointer in mtk_drm_of_ddp_path_build_one()
The following changes since commit 9d89551994a430b50c4fffcb1e617a057fa76e20:

  Linux 6.13-rc6 (2025-01-05 14:13:40 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-01-11

for you to fetch changes up to fddb4fd91a955636baa451fe82ad0266f55c7ede:

  Merge tag 'mediatek-drm-fixes-20250104' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-fixes (2025-01-10 16:57:59 +1000)

----------------------------------------------------------------
drm fixes for 6.13-rc7

i915:
- Revert "drm/i915/hdcp: Don't enable HDCP1.4 directly from check_link"

amdgpu:
- Display interrupt fixes
- Fix display max surface mismatches
- Fix divide error in DM plane scale calcs
- Display divide by 0 checks in dml helpers
- SMU 13 AD/DC interrrupt handling fix
- Fix locking around buddy trim handling

amdkfd:
- Fix page fault with shader debugger enabled
- Fix eviction fence wq handling

xe:
- Avoid a NULL ptr deref when wedging
- Fix power gate sequence on DG1

mediatek:
- Revert "drm/mediatek: dsi: Correct calculation formula of PHY Timing"
- Set private->all_drm_private[i]->drm to NULL if mtk_drm_bind returns err
- Move mtk_crtc_finish_page_flip() to ddp_cmdq_cb()
- Only touch DISP_REG_OVL_PITCH_MSB if AFBC is supported
- Add support for 180-degree rotation in the display driver
- Stop selecting foreign drivers
- Revert "drm/mediatek: Switch to for_each_child_of_node_scoped()"
- Fix YCbCr422 color format issue for DP
- Fix mode valid issue for dp
- dp: Reference common DAI properties
- dsi: Add registers to pdata to fix MT8186/MT8188
- Remove unneeded semicolon
- Add return value check when reading DPCD
- Initialize pointer in mtk_drm_of_ddp_path_build_one()

----------------------------------------------------------------
Alex Hung (1):
      drm/amd/display: Remove unnecessary amdgpu_irq_get/put

AngeloGioacchino Del Regno (2):
      drm/mediatek: mtk_dsi: Add registers to pdata to fix MT8186/MT8188
      drm/mediatek: Initialize pointer in mtk_drm_of_ddp_path_build_one()

Arnd Bergmann (1):
      drm/mediatek: stop selecting foreign drivers

Arunpravin Paneer Selvam (1):
      drm/amdgpu: Add a lock when accessing the buddy trim function

Chun-Kuang Hu (3):
      Revert "drm/mediatek: dsi: Correct calculation formula of PHY Timing"
      Revert "drm/mediatek: Switch to for_each_child_of_node_scoped()"
      drm/mediatek: Remove unneeded semicolon

Daniel Golle (1):
      drm/mediatek: Only touch DISP_REG_OVL_PITCH_MSB if AFBC is supported

Dave Airlie (4):
      Merge tag 'drm-intel-fixes-2025-01-08' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.13-2025-01-09' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-xe-fixes-2025-01-09' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'mediatek-drm-fixes-20250104' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-fixes

Fei Shao (1):
      dt-bindings: display: mediatek: dp: Reference common DAI properties

Guoqing Jiang (1):
      drm/mediatek: Set private->all_drm_private[i]->drm to NULL if
mtk_drm_bind returns err

Jason-JH.Lin (2):
      drm/mediatek: Move mtk_crtc_finish_page_flip() to ddp_cmdq_cb()
      drm/mediatek: Add support for 180-degree rotation in the display driver

Jesse.zhang@amd.com (1):
      drm/amdkfd: fixed page fault when enable MES shader debugger

Kun Liu (1):
      drm/amd/pm:  fix BUG: scheduling while atomic

Liankun Yang (3):
      drm/mediatek: Fix YCbCr422 color format issue for DP
      drm/mediatek: Fix mode valid issue for dp
      drm/mediatek: Add return value check when reading DPCD

Lucas De Marchi (1):
      drm/xe: Fix tlb invalidation when wedging

Melissa Wen (3):
      drm/amd/display: fix page fault due to max surface definition mismatch
      drm/amd/display: increase MAX_SURFACES to the value supported by hw
      drm/amd/display: fix divide error in DM plane scale calcs

Rodrigo Vivi (1):
      drm/xe/dg1: Fix power gate sequence.

Roman Li (1):
      drm/amd/display: Add check for granularity in dml ceil/floor helpers

Suraj Kandpal (1):
      Revert "drm/i915/hdcp: Don't enable HDCP1.4 directly from check_link"

Zhu Lingshan (1):
      drm/amdkfd: wq_release signals dma_fence only when available

 .../bindings/display/mediatek/mediatek,dp.yaml     | 19 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c             | 17 ++++++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 35 +----------
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |  8 +--
 drivers/gpu/drm/amd/display/dc/dc.h                |  4 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |  2 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |  1 -
 .../gpu/drm/amd/display/dc/dml/dml_inline_defs.h   |  8 +++
 .../drm/amd/display/dc/dml2/dml2_mall_phantom.c    |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |  2 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     | 12 ++--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  1 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  1 +
 drivers/gpu/drm/i915/display/intel_hdcp.c          | 12 +++-
 drivers/gpu/drm/mediatek/Kconfig                   |  5 --
 drivers/gpu/drm/mediatek/mtk_crtc.c                | 25 ++++++--
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            | 69 ++++++++++++----------
 drivers/gpu/drm/mediatek/mtk_dp.c                  | 46 +++++++++------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             | 13 ++--
 drivers/gpu/drm/mediatek/mtk_dsi.c                 | 49 +++++++++------
 drivers/gpu/drm/xe/xe_gt.c                         |  8 +--
 drivers/gpu/drm/xe/xe_gt_idle.c                    | 10 ++--
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |  4 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h        |  3 +-
 27 files changed, 214 insertions(+), 149 deletions(-)
