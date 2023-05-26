Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A35711F97
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 08:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8956710E1B4;
	Fri, 26 May 2023 06:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF3810E1B4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 06:04:18 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-970056276acso47628166b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 23:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685081055; x=1687673055;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=N+HEdzAqwWTEmlWoHrAywQzTrGYpO1deX73+YZ0gZnw=;
 b=YlDyzmUFqhw+j2KaJct52quH7e38m5Nu8smfQw8ffIQrQ1YSaAdQwfG9b8oWdpOuM0
 CT7SV6++lTlaA4rW6+8a50PXkQ9p+4MNmEoZZ9WRbla1Rn+7x0FyE7XBdvx0XOLNOoqI
 EDavz+Lrl8HuzluPqkHe+GffuX9VONFIyeBLMH9skVcWDXr2vjog4L3bMHdvqIvbEtlh
 PtudQC04Wsv3PlB6PUXwcT02c062R1uKUAM1L2vdYMA4DleKvvOIncvxuTxFy2TboecO
 YBCaYOuRlTPGjb3f0jKMKXdREoMIkLMPPUHFR2uFFhYA+DtIWPI0Ty0inuo6IsZYJT25
 uNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685081055; x=1687673055;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N+HEdzAqwWTEmlWoHrAywQzTrGYpO1deX73+YZ0gZnw=;
 b=BhMW267pzoDR0/xKCddJz7NzNqGjl8NJMzYhWhRPNKjCpUVSNrql+tiol8hhglcnLi
 pwXa4sQ4xFVWQNJwq/pT0JjlRDL5O+HFW5sd4AtD7esbvtdf/J49g4JU8ankZQrQoX8F
 /9EGa53EyRutCwRxVOZ0HZhR6d51GMgFn72YZLzKFqI6Ku8cnXB4K+25nyCxoL81yV8a
 KlCZyHSCLGYJEYW710Km4euFN7tbkas35jUhkz+G4m2wwMb4Rbbe+TGQby+5C5bsgrXJ
 q36u6NF6XpM/xTquBz4BUMkqhnbdEa/ZCCWJHBTwvZaxyr+j0ViraDTQuZZn/IDZ2CHh
 suEQ==
X-Gm-Message-State: AC+VfDx4kM9oUsyjEqp1uCGdgzC0y2QMoEY0kZMM1xHV9EZUeVoEBq23
 58L/y8CoHnohJBN71/0qFfg3q/xsC99rtilNmko=
X-Google-Smtp-Source: ACHHUZ5l2yHNm4ofzw63KMfOw/dozdrD2Bd32y/dq/wclQ5Qv9u40SuJAZXBkKtG/DFRPtVGYrVqYwpSg4cSTiNSRYI=
X-Received: by 2002:a17:907:9813:b0:94f:956:b3f7 with SMTP id
 ji19-20020a170907981300b0094f0956b3f7mr981841ejc.2.1685081054899; Thu, 25 May
 2023 23:04:14 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 26 May 2023 16:04:02 +1000
Message-ID: <CAPM=9twM2=jSRCZgoJDEcWypfGFuniRMEOa=S9pJvsWQR9dASQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.4-rc4
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

This week's collection is pretty spread out, accel/qaic has a bunch of
fixes, amdgpu, then lots of single fixes across a bunch of places.

Dave.

drm-fixes-2023-05-26:
drm fixes for 6.4-rc4

core:
- fix drmm_mutex_init lock class

mgag200:
- fix gamma lut initialisation

pl111:
- fix FB depth on IMPD-1 framebuffer

amdgpu:
- Fix missing BO unlocking in KIQ error path
- Avoid spurious secure display error messages
- SMU13 fix
- Fix an OD regression
- GPU reset display IRQ warning fix
- MST fix

radeon:
- Fix a DP regression

i915:
- PIPEDMC disabling fix for bigjoiner config

panel:
- fix aya neo air plus quirk

sched:
- remove redundant NULL check

qaic:
- fix NNC message corruption
- Grab ch_lock during QAIC_ATTACH_SLICE_BO
- Flush the transfer list again
- Validate if BO is sliced before slicing
- Validate user data before grabbing any lock
- initialize ret variable to 0
- silence some uninitialized variable warnings
The following changes since commit 44c026a73be8038f03dbdeef028b642880cf1511:

  Linux 6.4-rc3 (2023-05-21 14:05:48 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-05-26

for you to fetch changes up to 5502d1fab09df791a8b1208dea9defc418b9bbf7:

  Merge tag 'drm-misc-fixes-2023-05-24' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2023-05-26
15:38:31 +1000)

----------------------------------------------------------------
drm fixes for 6.4-rc4

core:
- fix drmm_mutex_init lock class

mgag200:
- fix gamma lut initialisation

pl111:
- fix FB depth on IMPD-1 framebuffer

amdgpu:
- Fix missing BO unlocking in KIQ error path
- Avoid spurious secure display error messages
- SMU13 fix
- Fix an OD regression
- GPU reset display IRQ warning fix
- MST fix

radeon:
- Fix a DP regression

i915:
- PIPEDMC disabling fix for bigjoiner config

panel:
- fix aya neo air plus quirk

sched:
- remove redundant NULL check

qaic:
- fix NNC message corruption
- Grab ch_lock during QAIC_ATTACH_SLICE_BO
- Flush the transfer list again
- Validate if BO is sliced before slicing
- Validate user data before grabbing any lock
- initialize ret variable to 0
- silence some uninitialized variable warnings

----------------------------------------------------------------
Alan Liu (1):
      drm/amd/display: Fix warning in disabling vblank irq

Alex Deucher (1):
      drm/radeon: reintroduce radeon_dp_work_func content

Dan Carpenter (1):
      accel/qaic: silence some uninitialized variable warnings

Dave Airlie (3):
      Merge tag 'drm-intel-fixes-2023-05-25' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-6.4-2023-05-24' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2023-05-24' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Evan Quan (1):
      drm/amd/pm: add missing NotifyPowerSource message mapping for SMU13.0.7

Fangzhi Zuo (1):
      drm/amd/display: Have Payload Properly Created After Resume

Imre Deak (1):
      drm/i915: Fix PIPEDMC disabling for a bigjoiner configuration

Jeffrey Hugo (1):
      accel/qaic: Fix NNC message corruption

Jesse Zhang (1):
      drm/amdgpu: don't enable secure display on incompatible platforms

Jocelyn Falempe (1):
      drm/mgag200: Fix gamma lut not initialized.

Jonatas Esteves (1):
      drm/amd/pm: Fix output of pp_od_clk_voltage

Linus Walleij (1):
      drm/pl111: Fix FB depth on IMPD-1 framebuffer

Matthew Auld (1):
      drm: fix drmm_mutex_init()

Maxime Ripard (1):
      Merge drm/drm-fixes into drm-misc-fixes

Maya Matuszczyk (1):
      drm: panel-orientation-quirks: Change Air's quirk to support Air Plus

Pranjal Ramajor Asha Kanojiya (4):
      accel/qaic: Validate user data before grabbing any lock
      accel/qaic: Validate if BO is sliced before slicing
      accel/qaic: Flush the transfer list again
      accel/qaic: Grab ch_lock during QAIC_ATTACH_SLICE_BO

Sukrut Bellary (1):
      drm:amd:amdgpu: Fix missing buffer object unlock in failure path

Tom Rix (1):
      accel/qaic: initialize ret variable to 0

Vladislav Efanov (1):
      drm/sched: Remove redundant check

 drivers/accel/qaic/qaic_control.c                  | 41 ++++++----
 drivers/accel/qaic/qaic_data.c                     | 93 +++++++++++-----------
 drivers/accel/qaic/qaic_drv.c                      |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  4 +-
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c             |  8 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 25 +++---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 16 +---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 | 12 ++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  1 +
 drivers/gpu/drm/drm_managed.c                      | 22 +----
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_display.c       | 12 ++-
 drivers/gpu/drm/mgag200/mgag200_mode.c             |  5 ++
 drivers/gpu/drm/pl111/pl111_display.c              |  2 +-
 drivers/gpu/drm/pl111/pl111_drm.h                  |  4 +-
 drivers/gpu/drm/pl111/pl111_drv.c                  |  8 +-
 drivers/gpu/drm/pl111/pl111_versatile.c            | 10 +--
 drivers/gpu/drm/radeon/radeon_irq_kms.c            | 10 +++
 drivers/gpu/drm/scheduler/sched_main.c             |  3 -
 include/drm/drm_managed.h                          | 18 ++++-
 21 files changed, 166 insertions(+), 136 deletions(-)
