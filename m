Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C6F7AA8CE
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 08:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0A610E029;
	Fri, 22 Sep 2023 06:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276AB10E029
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 06:15:00 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b962c226ceso29279791fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 23:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695363298; x=1695968098; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QEtm4m/HDUwFzO9pZTdCwrLXK5b58amRC64kf5nHW88=;
 b=RB958/r4dq75da0fQGy/aY02Z+tXMLEOXbu/wkI4nK33bhVUcqXl5yYumBNCvj/sHO
 yECM0Sp+6qlWTUVLUUjb+Lg5iroFZ4LK2NuIYNadevXrcSBythrnes+deg5+/a1oRYeE
 Au69VX7ORf0ayUaL0+7VrsAqVj3lQqJFbh0VbgP+gmn7juWVzh637bDOhW/VjxEHHEZH
 vSDYu1at/8TPdr4qKgnEUxXcawtdj0o8IPt7TOGETikqAZG0DyTfIQ8t3FmKj8zkMAX6
 /hBydsFIctvCJZ3iAyoSTMYI/qcwFYckVDMwnAPpopKfajAVA3LleUoei73fm+Lpb9HX
 WWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695363298; x=1695968098;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QEtm4m/HDUwFzO9pZTdCwrLXK5b58amRC64kf5nHW88=;
 b=UvbUeyq6SJY/Sw9i4zfDnchGN17Rez2S1FW9w26xzWjSbNIKjqQYFYGgXy19C3Yihw
 MKDdkZ/2LooIa92xcVPi02zl1bLTJCPsmOZfcl/aqMpscj6USI/kr2wBJwbRdDFW6J2C
 SVRvSy/CygIss98TC+bjnwm5h/cXggSKOi1U+mkEjfC1/cP6bow8sReHWrKLPRhy8Bp+
 RvBpy4PM5KbdlzI7QnSCbtG9801nD5Ru9JyXb9yDRL5clBLegXbXvk8TdaDb4ufavZPV
 J17ouyQ3+g6e0zu7/eLhUTOizgIen3IbAMbteA4GI/xlpaTvQhliZCTozjiSoM8GRkq2
 LDxw==
X-Gm-Message-State: AOJu0YxzUPC7aMlYBseBS0Jhkq1U/9gkfMS6rrDFE22xDCKeqGEC5kEM
 0GUSag6qybVaIPc8W/a+fkl9biPTS3uIf3NCvoc=
X-Google-Smtp-Source: AGHT+IHB+RwHSqnzUO4GjQw4umD8/scz/o9r4RC5DbJyzNfaWlXLkiIm7cwVgWW3czoiwfTPDifk9tUtxtwlp/uTmAU=
X-Received: by 2002:a2e:888c:0:b0:2bb:78ad:56cb with SMTP id
 k12-20020a2e888c000000b002bb78ad56cbmr6444668lji.37.1695363297837; Thu, 21
 Sep 2023 23:14:57 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 22 Sep 2023 16:14:46 +1000
Message-ID: <CAPM=9txiBx_jsniqp-F5jGaLafEd1i=ike6kZ7G=ti7e2y-saw@mail.gmail.com>
Subject: [git pull] drm fixes for 6.6-rc3
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

Regularly scheduled drm fixes, amdgpu, nouveau and i915 with a bunch
and some misc bits otherwise, nothing to strange or exciting.

Dave.

drm-fixes-2023-09-22:
drm fixes for 6.6-rc3

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

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-09-22

for you to fetch changes up to 54928f2f8458160e6c7217de78b48064b301e255:

  Merge tag 'amd-drm-fixes-6.6-2023-09-20' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2023-09-22
15:43:44 +1000)

----------------------------------------------------------------
drm fixes for 6.6-rc3

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
 22 files changed, 61 insertions(+), 52 deletions(-)
