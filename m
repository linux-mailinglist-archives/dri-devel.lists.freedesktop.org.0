Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DE51D45A3
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EA789DC5;
	Fri, 15 May 2020 06:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54EE89DC5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 06:13:04 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id se13so1266290ejb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 23:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=WGpH8vzYA2O2asAL93/5EGlm3UBsxHh1y17bTCGAJjE=;
 b=l3L79/VsnlZ8sPU/zFdRtqgt2aYRl+HDoUU86XJvies49Zb9O3HO3or+T/pTlE4c69
 uqevseBJGdmHxg2HjDIgXrQLqK9pfcFB14ohQy1gzp60H+bXxAdyVD35vydshQYtJes3
 SkA2tKDHfXsI+C2uusfGi8Z8iPbA6VI2mctIJm7AwlECqDP5TkPbyEhb8i9+skP4stdH
 Nnod7r8CdPGOIMRyEAZsDXqLAeQUOZ7XrpIwChV5jCJr7olbzWI1lEs6tQNlkIoXHTff
 oDBu1ZwkFySKO/44c62dUDhJJ8qgrGbhdQ3iV+fslLnt5ZCDh2CtxAP+M1iSHtEcSe3d
 TmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=WGpH8vzYA2O2asAL93/5EGlm3UBsxHh1y17bTCGAJjE=;
 b=mZ1uUVW6uFGyISYTciB/8I7zQLl3beef2884uK0NNB3aQPFeF/RXTpFoKfIelv9KHw
 oZ+OERrcTaDhcglCaFOjnjf29vdMFTq0u0ALXA069ii3omkJLfmeehvm64yXOiZdr4Wh
 AzqRpTsMGGfHZlXQsGWq3aRqSo7rRPqPx1OjgmCY9Z/2xW0NqqcppN2wnojYADa2J3/X
 vLIPzvRF5Sbym8sBzcLdtdczsBbi3dtV3q5argbRYw7LaGNBXRD5cyD+JpAClj7xwegb
 H+ReVsUbVBzfWe5O+Exe9YafGJzjdmnQGiqqgrvM0pqt4G2yu9Fr2MdCoLXbFvOV3KdC
 ipdg==
X-Gm-Message-State: AOAM5324apTtdZuBQsWFS0KtVir2aQuB/AXhOabAoJduWdnXf0lwi1a8
 elBDmxEuDMKbCNSp8ugU+C84E1HAld01WrLdbA/crP/HLxo=
X-Google-Smtp-Source: ABdhPJzGJTdI4zuEEvgmk1kXIUqd31ishDRWRj+/eoYTa1TlR5Qa46NQN5UWJoATVF/Y9rUTN/1ptG4ZaITCkWy7Lk8=
X-Received: by 2002:a17:907:41dd:: with SMTP id
 og21mr1283292ejb.368.1589523183144; 
 Thu, 14 May 2020 23:13:03 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 15 May 2020 16:12:52 +1000
Message-ID: <CAPM=9tx=si98hr3_MvAviRZ6LZMUFnFOJBFBk+Lpj3aLQz5M6A@mail.gmail.com>
Subject: [git pull] drm fixes for 5.7-rc6
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Linus,

As mentioned last week an i915 PR came in late, but I left it, so the
i915 bits of this cover 2 weeks, which is why it's likely a bit larger
than usual. Otherwise it's mostly amdgpu fixes, one tegra fix, one
meson fix.

Regards,
Dave.

drm-fixes-2020-05-15:
drm fixes for v5.7-rc6

i915 (two weeks):
- Handle idling during i915_gem_evict_something busy loops (Chris)
- Mark current submissions with a weak-dependency (Chris)
- Propagate error from completed fences (Chris)
- Fixes on execlist to avoid GPU hang situation (Chris)
- Fixes couple deadlocks (Chris)
- Timeslice preemption fixes (Chris)
- Fix Display Port interrupt handling on Tiger Lake (Imre)
- Reduce debug noise around Frame Buffer Compression (Peter)
- Fix logic around IPC W/a for Coffee Lake and Kaby Lake (Sultan)
- Avoid dereferencing a dead context (Chris)

tegra:
- tegra120/4 smmu fixes

 amdgpu:
- Clockgating fixes
- Fix fbdev with scatter/gather display
- S4 fix for navi
- Soft recovery for gfx10
- Freesync fixes
- Atomic check cursor fix
- Add a gfxoff quirk
- MST fix

amdkfd:
- Fix GEM reference counting

meson:
- error code propogation fix
The following changes since commit 2ef96a5bb12be62ef75b5828c0aab838ebb29cb8:

  Linux 5.7-rc5 (2020-05-10 15:16:58 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-05-15

for you to fetch changes up to 1d2a1eb13610a9c8ec95f6f1e02cef55000f28e3:

  Merge tag 'drm-misc-fixes-2020-05-14' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2020-05-15
16:00:57 +1000)

----------------------------------------------------------------
drm fixes for v5.7-rc6

i915 (two weeks):
- Handle idling during i915_gem_evict_something busy loops (Chris)
- Mark current submissions with a weak-dependency (Chris)
- Propagate error from completed fences (Chris)
- Fixes on execlist to avoid GPU hang situation (Chris)
- Fixes couple deadlocks (Chris)
- Timeslice preemption fixes (Chris)
- Fix Display Port interrupt handling on Tiger Lake (Imre)
- Reduce debug noise around Frame Buffer Compression (Peter)
- Fix logic around IPC W/a for Coffee Lake and Kaby Lake (Sultan)
- Avoid dereferencing a dead context (Chris)

tegra:
- tegra120/4 smmu fixes

 amdgpu:
- Clockgating fixes
- Fix fbdev with scatter/gather display
- S4 fix for navi
- Soft recovery for gfx10
- Freesync fixes
- Atomic check cursor fix
- Add a gfxoff quirk
- MST fix

amdkfd:
- Fix GEM reference counting

meson:
- error code propogation fix

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu: force fbdev into vram
      drm/amdgpu: implement soft_recovery for gfx10

Bernard Zhao (1):
      drm/meson: pm resume add return errno branch

Chris Wilson (10):
      drm/i915: Avoid dereferencing a dead context
      drm/i915/gt: Make timeslicing an explicit engine property
      drm/i915: Check current i915_vma.pin_count status first on unbind
      drm/i915/gt: Yield the timeslice if caught waiting on a user semaphore
      drm/i915/gem: Remove object_is_locked assertion from
unpin_from_display_plane
      drm/i915/execlists: Avoid reusing the same logical CCID
      drm/i915/execlists: Track inflight CCID
      drm/i915: Propagate error from completed fences
      drm/i915: Mark concurrent submissions with a weak-dependency
      drm/i915: Handle idling during i915_gem_evict_something busy loops

Colin Xu (1):
      drm/i915/gvt: Init DPLL/DDI vreg for virtual display instead of
inheritance.

Dave Airlie (5):
      Merge tag 'drm-intel-fixes-2020-05-07' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'drm/tegra/for-5.7-fixes' of
git://anongit.freedesktop.org/tegra/linux into drm-fixes
      Merge tag 'amd-drm-fixes-5.7-2020-05-13' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2020-05-13-1' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'drm-misc-fixes-2020-05-14' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Evan Quan (4):
      drm/amdgpu: disable MGCG/MGLS also on gfx CG ungate
      drm/amdgpu: drop unnecessary cancel_delayed_work_sync on PG ungate
      drm/amd/powerplay: perform PG ungate prior to CG ungate
      drm/amdgpu: enable hibernate support on Navi1X

Felix Kuehling (1):
      drm/amdgpu: Use GEM obj reference for KFD BOs

Imre Deak (1):
      drm/i915/tgl+: Fix interrupt handling for DP AUX transactions

Leo (Hanghong) Ma (1):
      drm/amd/amdgpu: Update update_config() logic

Nicholas Kazlauskas (1):
      drm/amd/display: Fix vblank and pageflip event handling for FreeSync

Peter Jones (1):
      Make the "Reducing compressed framebufer size" message be DRM_INFO_ONCE()

Rodrigo Vivi (1):
      Merge tag 'gvt-fixes-2020-05-12' of
https://github.com/intel/gvt-linux into drm-intel-fixes

Simon Ser (1):
      drm/amd/display: add basic atomic check for cursor plane

Sultan Alsawaf (1):
      drm/i915: Don't enable WaIncreaseLatencyIPCEnabled when IPC is disabled

Thierry Reding (2):
      drm/tegra: Fix SMMU support on Tegra124 and Tegra210
      gpu: host1x: Use SMMU on Tegra124 and Tegra210

Tom St Denis (1):
      drm/amd/amdgpu: add raven1 part to the gfxoff quirk list

Zhenyu Wang (1):
      drm/i915/gvt: Fix kernel oops for 3-level ppgtt guest

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  22 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  14 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 163 ++++++++++-----------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |  10 +-
 drivers/gpu/drm/amd/powerplay/amd_powerplay.c      |   6 +-
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c         |   8 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |   7 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h      |   8 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |   9 --
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |   6 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |  35 ++++-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |  15 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                | 120 ++++++++++-----
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |  34 +++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |   2 +-
 drivers/gpu/drm/i915/gvt/display.c                 |  49 ++++++-
 drivers/gpu/drm/i915/gvt/scheduler.c               |  10 +-
 drivers/gpu/drm/i915/i915_gem_evict.c              |  26 ++--
 drivers/gpu/drm/i915/i915_gpu_error.c              |  12 +-
 drivers/gpu/drm/i915/i915_irq.c                    |  16 +-
 drivers/gpu/drm/i915/i915_perf.c                   |   6 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   1 +
 drivers/gpu/drm/i915/i915_request.c                |  12 +-
 drivers/gpu/drm/i915/i915_scheduler.c              |   6 +-
 drivers/gpu/drm/i915/i915_scheduler.h              |   3 +-
 drivers/gpu/drm/i915/i915_scheduler_types.h        |   1 +
 drivers/gpu/drm/i915/i915_vma.c                    |  25 ++--
 drivers/gpu/drm/i915/intel_pm.c                    |   2 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c          |   2 +-
 drivers/gpu/drm/meson/meson_drv.c                  |   4 +-
 drivers/gpu/drm/tegra/drm.c                        |   3 +-
 drivers/gpu/host1x/dev.c                           |  59 +++++++-
 include/linux/host1x.h                             |   3 +
 38 files changed, 439 insertions(+), 274 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
