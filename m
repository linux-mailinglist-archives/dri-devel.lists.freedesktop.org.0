Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E52A27AA92E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 08:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7E510E061;
	Fri, 22 Sep 2023 06:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC9510E061
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 06:39:00 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9aa0495f9cfso690552166b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 23:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695364739; x=1695969539; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EcGNrh1hGrAu3yUiYqnXVMIsYc7TK7oPPTuzkFDt/F8=;
 b=dgeB3AFRN4oegywDVQijiMX9VEFF3RWZFItavk8nzTg9AN/KivAtwZ3t8JcG38wiEk
 I6vo9YLXME6qIs2L17jWCE7H6KPV6SD8/Qo9iSoZii24g1onw/mhFxL0t7hD+OH13Hz9
 UvSe0ZBldCT1rTNxZ++NdWOCcHbhM7C6ip357mppbDLWPwzTL0/NXf886raJrgOUkKDI
 wG1IqXSIHix3MIrJoogNUYTPbwP9lm8CgexTJ+Clr1oxfFgy7yIcBTZNXNiKy/QSDzBO
 d2Zg0BNe8rLCqfE5De7cmkkyYdjtNtk6oZauXlLpq/p4eHEPvu++wzKVdT8FKoW/0gK2
 Qiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695364739; x=1695969539;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EcGNrh1hGrAu3yUiYqnXVMIsYc7TK7oPPTuzkFDt/F8=;
 b=NhmSaTRTD7jOwKAsAybJGemj7g5L1fvikmYR9ugv+VsfI239mHJJaFLCABw/SzoBd3
 a8gOIj1ebdtAk3apQxfQtDXBtt1LXZvBAZqC0bqLgWpXYAppGHRPrw41RfoR7QHjAVU+
 IvgXFY8TCS/QTVKLbEP7Q9UnqsBe3gR3X+3yXrAIsD4ik0HXqLhoGA6vxVnCjsRdX7L0
 4D/gkXsrv9XC6GxMyvRNOcU1XcpkB6vFgYvTpFZY5EwB98WJSJYHzdX/UPRKuvcaaBGb
 OAuS3JvSKPjLDXKFkTRgIVJmKI/8LSR2NX5YIZ2ta3zTNXP+aaLZcYFPGk7eU/gDabG0
 QU/Q==
X-Gm-Message-State: AOJu0YykVSyTQQxzvzrt4XOrlKdp7D2NuUa9zaGszxnnWRl5DK40EESy
 eOCMfBmASACSBMqMeGXZNZs6lLCTNYwHymDdY18=
X-Google-Smtp-Source: AGHT+IELx/hJOe6g7KFqpSBEQ+6g3SvIkbFog+nWHTKaiQ+eXyQxhIyBAIX7RWZ+2GMecSJ9nu725OiKJ/mTYuOJF5Y=
X-Received: by 2002:a17:906:cc4f:b0:9ad:f60c:7287 with SMTP id
 mm15-20020a170906cc4f00b009adf60c7287mr2198275ejb.28.1695364738878; Thu, 21
 Sep 2023 23:38:58 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 22 Sep 2023 16:38:47 +1000
Message-ID: <CAPM=9txUkMJPzCJLbyWTwsdfWFPmbQ1f6mH1qKJ5GXgPUOiX0w@mail.gmail.com>
Subject: drm fixes for 6.6-rc3 (resend with one more patch)
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

Hi Linus (again),

It's been one of those weeks, and I somehow managed to forget the
actual newsworthy item in this fixes pull. Ben Skeggs is stepping away
from nouveau and Red Hat for personal reasons, he'll be missed and we
intend to fill the gaps in the upcoming time with Danilo and Lyude
stepping in for now.

Otherwise what I said already, i915, nouveau, amdgpu with a few each
and some misc spread around.

Dave.

drm-fixes-2023-09-22-2:
MAINTAINERS:
- drop Ben as he retired from nouveau

core:
- drm_mm test fixes

fbdev:
- Kconfig fixes

ivpu:
- IRQ-handling fixes

meson:
- Fix memory leak in HDMI EDID code

nouveau:
- Correct type casting
- Fix memory leak in scheduler
- u_memcpya() fixes

i915:
- Prevent error pointer dereference
- Fix PMU busyness values when using GuC mode

amdgpu:
- MST fix
- Vbios part number reporting fix
- Fix a possible memory leak in an error case in the RAS code
- Fix low resolution modes on eDP

amdkfd:
- Fix GPU address for user queue wptr when GART is not at 0
The following changes since commit ce9ecca0238b140b88f43859b211c9fdfd8e5b70=
:

  Linux 6.6-rc2 (2023-09-17 14:40:24 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-09-22-2

for you to fetch changes up to b41b28366d3b176c8297961de4f095f2e392402d:

  MAINTAINERS: remove myself as nouveau maintainer (2023-09-22 16:32:00 +10=
00)

----------------------------------------------------------------
MAINTAINERS:
- drop Ben as he retired from nouveau

core:
- drm_mm test fixes

fbdev:
- Kconfig fixes

ivpu:
- IRQ-handling fixes

meson:
- Fix memory leak in HDMI EDID code

nouveau:
- Correct type casting
- Fix memory leak in scheduler
- u_memcpya() fixes

i915:
- Prevent error pointer dereference
- Fix PMU busyness values when using GuC mode

amdgpu:
- MST fix
- Vbios part number reporting fix
- Fix a possible memory leak in an error case in the RAS code
- Fix low resolution modes on eDP

amdkfd:
- Fix GPU address for user queue wptr when GART is not at 0

----------------------------------------------------------------
Arnd Bergmann (1):
      drm: fix up fbdev Kconfig defaults

Ben Skeggs (1):
      MAINTAINERS: remove myself as nouveau maintainer

Cong Liu (1):
      drm/amdgpu: fix a memory leak in amdgpu_ras_feature_enable

Dan Carpenter (2):
      nouveau/u_memcpya: fix NULL vs error pointer bug
      drm/i915/gt: Prevent error pointer dereference

Danilo Krummrich (2):
      drm/nouveau: fence: fix type cast warning in nouveau_fence_emit()
      drm/nouveau: sched: fix leaking memory of timedout job

Dave Airlie (4):
      nouveau/u_memcpya: use vmemdup_user
      Merge tag 'drm-misc-fixes-2023-09-21' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2023-09-21' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-6.6-2023-09-20' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Hamza Mahfooz (1):
      drm/amd/display: fix the ability to use lower resolution modes on eDP

Jani Nikula (1):
      drm/meson: fix memory leak on ->hpd_notify callback

Janusz Krzysztofik (1):
      drm/tests: Fix incorrect argument in drm_test_mm_insert_range

Jos=C3=A9 Pekkarinen (1):
      drm/virtio: clean out_fence on complete_submit

Karol Wachowski (1):
      accel/ivpu/40xx: Fix buttress interrupt handling

Lijo Lazar (1):
      Revert "drm/amdgpu: Report vbios version instead of PN"

Muhammad Ahmed (1):
      drm/amd/display: Fix MST recognizes connected displays as one

Thomas Zimmermann (1):
      fbdev/sh7760fb: Depend on FB=3Dy

Umesh Nerlige Ramappa (1):
      i915/pmu: Move execlist stats initialization to execlist specific set=
up

YuBiao Wang (1):
      drm/amdkfd: Use gpu_offset for user queue's wptr

 MAINTAINERS                                        |  1 -
 drivers/accel/ivpu/ivpu_hw_40xx.c                  |  9 ++++++-
 drivers/gpu/drm/Kconfig                            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  1 +
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  2 +-
 drivers/gpu/drdrm-fixes-2023-09-22-2:
MAINTAINERS:
- drop Ben as he retired from nouveau

core:
- drm_mm test fixes

fbdev:
- Kconfig fixes

ivpu:
- IRQ-handling fixes

meson:
- Fix memory leak in HDMI EDID code

nouveau:
- Correct type casting
- Fix memory leak in scheduler
- u_memcpya() fixes

i915:
- Prevent error pointer dereference
- Fix PMU busyness values when using GuC mode

amdgpu:
- MST fix
- Vbios part number reporting fix
- Fix a possible memory leak in an error case in the RAS code
- Fix low resolution modes on eDP

amdkfd:
- Fix GPU address for user queue wptr when GART is not at 0
The following changes since commit ce9ecca0238b140b88f43859b211c9fdfd8e5b70=
:

  Linux 6.6-rc2 (2023-09-17 14:40:24 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-09-22-2

for you to fetch changes up to b41b28366d3b176c8297961de4f095f2e392402d:

  MAINTAINERS: remove myself as nouveau maintainer (2023-09-22 16:32:00 +10=
00)

----------------------------------------------------------------
MAINTAINERS:
- drop Ben as he retired from nouveau

core:
- drm_mm test fixes

fbdev:
- Kconfig fixes

ivpu:
- IRQ-handling fixes

meson:
- Fix memory leak in HDMI EDID code

nouveau:
- Correct type casting
- Fix memory leak in scheduler
- u_memcpya() fixes

i915:
- Prevent error pointer dereference
- Fix PMU busyness values when using GuC mode

amdgpu:
- MST fix
- Vbios part number reporting fix
- Fix a possible memory leak in an error case in the RAS code
- Fix low resolution modes on eDP

amdkfd:
- Fix GPU address for user queue wptr when GART is not at 0

----------------------------------------------------------------
Arnd Bergmann (1):
      drm: fix up fbdev Kconfig defaults

Ben Skeggs (1):
      MAINTAINERS: remove myself as nouveau maintainer

Cong Liu (1):
      drm/amdgpu: fix a memory leak in amdgpu_ras_feature_enable

Dan Carpenter (2):
      nouveau/u_memcpya: fix NULL vs error pointer bug
      drm/i915/gt: Prevent error pointer dereference

Danilo Krummrich (2):
      drm/nouveau: fence: fix type cast warning in nouveau_fence_emit()
      drm/nouveau: sched: fix leaking memory of timedout job

Dave Airlie (4):
      nouveau/u_memcpya: use vmemdup_user
      Merge tag 'drm-misc-fixes-2023-09-21' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2023-09-21' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-6.6-2023-09-20' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Hamza Mahfooz (1):
      drm/amd/display: fix the ability to use lower resolution modes on eDP

Jani Nikula (1):
      drm/meson: fix memory leak on ->hpd_notify callback

Janusz Krzysztofik (1):
      drm/tests: Fix incorrect argument in drm_test_mm_insert_range

Jos=C3=A9 Pekkarinen (1):
      drm/virtio: clean out_fence on complete_submit

Karol Wachowski (1):
      accel/ivpu/40xx: Fix buttress interrupt handling

Lijo Lazar (1):
      Revert "drm/amdgpu: Report vbios version instead of PN"

Muhammad Ahmed (1):
      drm/amd/display: Fix MST recognizes connected displays as one

Thomas Zimmermann (1):
      fbdev/sh7760fb: Depend on FB=3Dy

Umesh Nerlige Ramappa (1):
      i915/pmu: Move execlist stats initialization to execlist specific set=
up

YuBiao Wang (1):
      drm/amdkfd: Use gpu_offset for user queue's wptr

 MAINTAINERS                                        |  1 -
 drivers/accel/ivpu/ivpu_hw_40xx.c                  |  9 ++++++-
 drivers/gpu/drm/Kconfig                            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  1 +
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  4 +--
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    | 30 ++++++++++++------=
----
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  8 ++----
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c   |  2 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  1 -
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  2 ++
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  5 ++--
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |  2 ++
 drivers/gpu/drm/nouveau/nouveau_drv.h              | 19 ++++----------
 drivers/gpu/drm/nouveau/nouveau_exec.c             |  2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |  2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c            | 12 ++++++---
 drivers/gpu/drm/tests/drm_mm_test.c                |  2 +-
 drivers/gpu/drm/virtio/virtgpu_submit.c            |  1 -
 drivers/video/console/Kconfig                      |  1 +
 drivers/video/fbdev/Kconfig                        |  2 +-
 drivers/video/fbdev/core/Kconfig                   |  2 +-
 23 files changed, 61 insertions(+), 53
deletions(-)m/amd/display/amdgpu_dm/amdgpu_dm.c  |  4 +--
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    | 30 ++++++++++++------=
----
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  8 ++----
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c   |  2 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  1 -
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  2 ++
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  5 ++--
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |  2 ++
 drivers/gpu/drm/nouveau/nouveau_drv.h              | 19 ++++----------
 drivers/gpu/drm/nouveau/nouveau_exec.c             |  2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |  2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c            | 12 ++++++---
 drivers/gpu/drm/tests/drm_mm_test.c                |  2 +-
 drivers/gpu/drm/virtio/virtgpu_submit.c            |  1 -
 drivers/video/console/Kconfig                      |  1 +
 drivers/video/fbdev/Kconfig                        |  2 +-
 drivers/video/fbdev/core/Kconfig                   |  2 +-
 23 files changed, 61 insertions(+), 53 deletions(-)
