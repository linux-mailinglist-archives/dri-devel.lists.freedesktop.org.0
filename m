Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA659B980A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 20:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E8810E00A;
	Fri,  1 Nov 2024 19:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CHpiXHZV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC8010E00A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 19:05:02 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5cb6704ff6bso3023750a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 12:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730487900; x=1731092700; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Po6d0vKxLdO7pwjS43uJ8mMLBhaRpS3FlzyZbdeogh0=;
 b=CHpiXHZVCSESSvcADeYCVzJzXSkpq9DKlpt+W6XascqQTHmKunWVvCJjclykvCWvwN
 eo8yOGka1qpdJ7Nj0EGri2CKTGYLjST9+AR1xnhhm9X811noLSg3PgfLwoNoi+I0NoUS
 GQeCSCfKHSjXMf+k+oXf5PTZUpS6mP2HhEidDWW4l1J3Ky7+68aDVdvTJPoYzEw8vLpf
 bTSoKKnTtHMsOZvgz46RNEFLw/Qloaw9fHrY4Br0h+mZ3k84U7Kz6eB1RwaopyyJEcmi
 ifo95SpUsrPuP4rbs8Ek30byh5alcA1CS0KBAxYjT0iIu+GcLb2bXX+76pfVHzAMwZKL
 ws8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730487900; x=1731092700;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Po6d0vKxLdO7pwjS43uJ8mMLBhaRpS3FlzyZbdeogh0=;
 b=ZpQvR1RWlirP57wxIrTYrKPAkKD49NdmLMhwjEia38h8O7xly4gl2FfTiSsFoo3n3T
 GwWi1bgg/sOUtLGLg5n7iNq1KKl+CtEn2RAnQKXPKikPoWZmtupuWnhsxSzwl1eRIjyZ
 GYkptAmrlMto4Cr9Oi7G/SXT+fQQXdBBAWpxfcLefyibpi9bzBiUeEorfoXc3B+u4pWk
 LIBSn156zjhhhLIJIPq+6NuNnuw8+gJ2NLkkmRnLn90XAUu96JqcvuVwnXjMsO+cs5K8
 9tgws4oEJb3cOyMFmu5jLnKkBrJRpx659BabnuvI/Kb4kRcn3n9PmltRX4J/urwfsyQm
 7otw==
X-Gm-Message-State: AOJu0Yx/bxcQBR7/0Mglf7fnh5V/vcg3p1C9pEaSNwmay/a47bU2LrTH
 qBBadsBpjPCRCqD6j7zXSjKIvzcjW2/DdNDQrHWrlN4qsYXfqLeSIfGh+HJu7wJODrjMSCnZLUa
 o/Z/9RIChT/aUvyE30zxnYqYy/wzpMJ7m
X-Google-Smtp-Source: AGHT+IH6PM1liYSO7moMOes+IZEnj/BLvyNO2FkOyxZ2n3b7UwW3d7ynYQOX7iVUFj4chQM+C+t8umkIqIo9sBEzB9E=
X-Received: by 2002:a05:6402:13cc:b0:5cb:6672:fbbe with SMTP id
 4fb4d7f45d1cf-5ceb9381fa8mr3529903a12.30.1730487900038; Fri, 01 Nov 2024
 12:05:00 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 2 Nov 2024 05:04:48 +1000
Message-ID: <CAPM=9tywoHB87EmV5CYripW2A2gVBg2dMTM-+gv_xbxOK3EQ=Q@mail.gmail.com>
Subject: [git pull] drm fixes for 6.12-rc6
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

Regular fixes pull, nothing too out of the ordinary, the mediatek
fixes came in a batch that I might have preferred a bit earlier but
all seem fine, otherwise regular xe/amdgpu and a few misc ones.

Dave.

drm-fixes-2024-11-02:
drm fixes for 6.12-rc6

xe:
- Fix missing HPD interrupt enabling, bringing one PM refactor with it
- Workaround LNL GGTT invalidation not being visible to GuC
- Avoid getting jobs stuck without a protecting timeout

ivpu:
- Fix firewall IRQ handling

panthor:
- Fix firmware initialization wrt page sizes
- Fix handling and reporting of dead job groups

sched:
- Guarantee forward progress via WC_MEM_RECLAIM

tests:
- Fix memory leak in drm_display_mode_from_cea_vic()

amdgpu:
- DCN 3.5 fix
- Vangogh SMU KASAN fix
- SMU 13 profile reporting fix

mediatek:
- Fix degradation problem of alpha blending
- Fix color format MACROs in OVL
- Fix get efuse issue for MT8188 DPTX
- Fix potential NULL dereference in mtk_crtc_destroy()
- Correct dpi power-domains property
- Add split subschema property constraints
The following changes since commit 81983758430957d9a5cb3333fe324fd70cf63e7e:

  Linux 6.12-rc5 (2024-10-27 12:52:02 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-11-02

for you to fetch changes up to f99c7cca2f712d11a67148cfbe463fdefeb82dc5:

  Merge tag 'drm-xe-fixes-2024-10-31' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2024-11-02 04:44:27 +1000)

----------------------------------------------------------------
drm fixes for 6.12-rc6

xe:
- Fix missing HPD interrupt enabling, bringing one PM refactor with it
- Workaround LNL GGTT invalidation not being visible to GuC
- Avoid getting jobs stuck without a protecting timeout

ivpu:
- Fix firewall IRQ handling

panthor:
- Fix firmware initialization wrt page sizes
- Fix handling and reporting of dead job groups

sched:
- Guarantee forward progress via WC_MEM_RECLAIM

tests:
- Fix memory leak in drm_display_mode_from_cea_vic()

amdgpu:
- DCN 3.5 fix
- Vangogh SMU KASAN fix
- SMU 13 profile reporting fix

mediatek:
- Fix degradation problem of alpha blending
- Fix color format MACROs in OVL
- Fix get efuse issue for MT8188 DPTX
- Fix potential NULL dereference in mtk_crtc_destroy()
- Correct dpi power-domains property
- Add split subschema property constraints

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/smu13: fix profile reporting

Andrzej Kacprowski (1):
      accel/ivpu: Fix NOC firewall interrupt handling

Boris Brezillon (3):
      drm/panthor: Fix firmware initialization on systems with a page size > 4k
      drm/panthor: Fail job creation when the group is dead
      drm/panthor: Report group as timedout when we fail to properly suspend

Dan Carpenter (2):
      drm/mediatek: Fix potential NULL dereference in mtk_crtc_destroy()
      drm/tegra: Fix NULL vs IS_ERR() check in probe()

Dave Airlie (4):
      Merge tag 'drm-misc-fixes-2024-10-31' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.12-2024-10-31' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'mediatek-drm-fixes-20241028' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-fixes
      Merge tag 'drm-xe-fixes-2024-10-31' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Hsin-Te Yuan (1):
      drm/mediatek: Fix color format MACROs in OVL

Imre Deak (2):
      drm/xe/display: Separate the d3cold and non-d3cold runtime PM handling
      drm/xe/display: Add missing HPD interrupt enabling during
non-d3cold RPM resume

Jason-JH.Lin (5):
      drm/mediatek: ovl: Fix XRGB format breakage for blend_modes
unsupported SoCs
      drm/mediatek: ovl: Refine ignore_pixel_alpha comment and placement
      drm/mediatek: ovl: Remove the color format comment for ovl_fmt_convert()
      drm/mediatek: ovl: Add blend_modes to driver data
      drm/mediatek: Add blend_modes to mtk_plane_init() for different SoCs

Jinjie Ruan (3):
      drm/tests: helpers: Add helper for drm_display_mode_from_cea_vic()
      drm/connector: hdmi: Fix memory leak in drm_display_mode_from_cea_vic()
      drm/tests: hdmi: Fix memory leaks in drm_display_mode_from_cea_vic()

Liankun Yang (1):
      drm/mediatek: Fix get efuse issue for MT8188 DPTX

Maarten Lankhorst (1):
      drm/xe: Remove runtime argument from display s/r functions

Macpaul Lin (1):
      dt-bindings: display: mediatek: dpi: correct power-domains property

Matthew Brost (3):
      drm/sched: Mark scheduler work queues with WQ_MEM_RECLAIM
      drm/xe: Add mmio read before GGTT invalidate
      drm/xe: Don't short circuit TDR on jobs not started

Moudy Ho (1):
      dt-bindings: display: mediatek: split: add subschema property constraints

Ovidiu Bunea (1):
      Revert "drm/amd/display: update DML2 policy
EnhancedPrefetchScheduleAccelerationFinal DCN35"

Thomas Zimmermann (1):
      Merge drm/drm-fixes into drm-misc-fixes

Tvrtko Ursulin (1):
      drm/amd/pm: Vangogh: Fix kernel memory out of bounds write

 .../bindings/display/mediatek/mediatek,dpi.yaml    | 24 +++---
 .../bindings/display/mediatek/mediatek,split.yaml  | 19 +++++
 drivers/accel/ivpu/ivpu_debugfs.c                  |  9 +++
 drivers/accel/ivpu/ivpu_hw.c                       |  1 +
 drivers/accel/ivpu/ivpu_hw.h                       |  1 +
 drivers/accel/ivpu/ivpu_hw_ip.c                    |  5 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c  |  1 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  4 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  6 +-
 drivers/gpu/drm/mediatek/mtk_crtc.c                |  4 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c            |  2 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h            | 10 +++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |  2 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            | 74 ++++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |  7 ++
 drivers/gpu/drm/mediatek/mtk_dp.c                  | 85 +++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_ethdr.c               |  7 ++
 drivers/gpu/drm/mediatek/mtk_ethdr.h               |  1 +
 drivers/gpu/drm/mediatek/mtk_plane.c               | 15 ++--
 drivers/gpu/drm/mediatek/mtk_plane.h               |  4 +-
 drivers/gpu/drm/panthor/panthor_fw.c               |  4 +-
 drivers/gpu/drm/panthor/panthor_gem.c              | 11 ++-
 drivers/gpu/drm/panthor/panthor_mmu.c              | 16 +++-
 drivers/gpu/drm/panthor/panthor_mmu.h              |  1 +
 drivers/gpu/drm/panthor/panthor_sched.c            | 20 ++++-
 drivers/gpu/drm/scheduler/sched_main.c             |  5 +-
 drivers/gpu/drm/tegra/drm.c                        |  4 +-
 drivers/gpu/drm/tests/drm_connector_test.c         | 24 +++---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  8 +-
 drivers/gpu/drm/tests/drm_kunit_helpers.c          | 42 +++++++++++
 drivers/gpu/drm/xe/display/xe_display.c            | 71 +++++++++++-------
 drivers/gpu/drm/xe/display/xe_display.h            |  8 +-
 drivers/gpu/drm/xe/xe_ggtt.c                       | 10 +++
 drivers/gpu/drm/xe/xe_guc_submit.c                 | 18 +++--
 drivers/gpu/drm/xe/xe_pm.c                         |  6 +-
 include/drm/drm_kunit_helpers.h                    |  4 +
 36 files changed, 412 insertions(+), 121 deletions(-)
