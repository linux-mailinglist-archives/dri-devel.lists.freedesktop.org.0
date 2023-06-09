Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E23728D2E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 03:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A21910E098;
	Fri,  9 Jun 2023 01:39:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB6910E098
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 01:39:47 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9741caaf9d4so193254866b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 18:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686274784; x=1688866784;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9iYUS5bFOEmlhAPq0qees0PGLSpWA6cqfqiwMD2OcAY=;
 b=UsaB4v6S7+NwG7c6TdqKZTipJSs8KjjBaV/SaKlumYW3bed/3S90Tc97JIC/miYfEZ
 FxaJVGm71lw97LLMz4k3gN+YNFmfArgiHArMdFvDbrf/Yl1FuGAkGFyEiX3PZ2niPAbF
 eikStbzUOqWR1NQHcyqh8423WsRRVU6DG6ll8HaNOw9RejB4aStjz4vRdx/4fR9CEBDS
 M+/CULOYsLwYRCTe3CNAHsNOBb3c4l5B2MZYZrxBtw30PfVhYZQdC+ThEs3xT6Er6AOy
 vqtMNAGEoOjOP8DFQ84nClKY0AhzLB7zNe+z8Fr0l6+Qci3pHiLp5ijM1HDJfgSeO+7M
 HKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686274784; x=1688866784;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9iYUS5bFOEmlhAPq0qees0PGLSpWA6cqfqiwMD2OcAY=;
 b=YnkZuuzzmwINhkXRTzGNQlUHOCmaJHqqnygwa9gQCTf/ubniPkNgLKM0fGDoXCfbM+
 x7ztjS+AzWZpZOZQqcL2tmvmADyO3Kt6wOyRzKq98qu0uaoJWDGAZlEXd5iArl41g1RG
 Tp5r0BCdiaSMSx+T6Iz/M8/dnW4K4KaILCEkRoRA+48ZecaygAPNf6nsrliI2XGdeKqN
 ZBE8xCQrQx9PNkC+1WGfSQ4SD9mtaER+0FJCLPnUnqBAkbWiWfVRQP91+teNTh8boi9f
 jHYqZK5braGrfcjVIW4Am8kY0m+Ssvw8bxtdgbC0jgQA2QCxro7ezYdwIWJYYrmoWX4b
 4RkA==
X-Gm-Message-State: AC+VfDzF9haYqdG2RqNo+k5ZnAwdaxgr7VFC/nT/kGoIJtXAppiyBLam
 dSJlkVihUpIb9T67SUMC58rHURIRII/tt26DZtU=
X-Google-Smtp-Source: ACHHUZ5kSLBtLK51wgxjCLmw3b4jfrjjs4x0SmhJdYYtLtUFqu0mtOsxxKrTqRh4Ec35lkGz2xL4pcK0Ghl5bUpIsMA=
X-Received: by 2002:a17:907:60d3:b0:978:8937:19ba with SMTP id
 hv19-20020a17090760d300b00978893719bamr206993ejc.44.1686274784100; Thu, 08
 Jun 2023 18:39:44 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 9 Jun 2023 11:39:32 +1000
Message-ID: <CAPM=9tweJxBYq_08o-ZtgXRgdRQYZCbFiN+VdunddCaA+UwSEw@mail.gmail.com>
Subject: [git pull] drm fixes for 6.4-rc6
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

Hey Linux,

Bit busier and a bit more scattered than usual. amdgpu is the main
one, with ivpu and msm having a few fixes, then i915, exynos, ast,
lima, radeon with some misc bits, but overall nothing standing out.

Dave.

drm-fixes-2023-06-09:
drm fixes for 6.4-rc6

fb-helper:
- Fill in fb-helper vars more correctly.

amdgpu:
- S0ix fixes
- GPU reset fixes
- SMU13 fixes
- SMU11 fixes
- Misc Display fixes
- Revert RV/RV2/PCO clock counter changes
- Fix Stoney xclk value
- Fix reserved vram debug info

radeon:
- Fix a potential use after free

i915:
- CDCLK voltage fix for ADL-P
- eDP wake sync pulse fix.
- Two error handling fixes to selftests

exynos:
- Fix wrong return in Exynos vidi driver.
- Fix use-after-free issue to Exynos g2d driver.

ast:
- resume and modeset fixes for ast.

ivpu:
- Assorted ivpu fixes.

lima:
- lima context destroy fix.

msm:
- Fix max segment size to address splat on newer a6xx
- Disable PSR by default w/ modparam to re-enable, since there
  still seems to be a lingering issue
- Fix HPD issue
- Fix issue with unitialized GMU mutex
The following changes since commit 9561de3a55bed6bdd44a12820ba81ec416e705a7=
:

  Linux 6.4-rc5 (2023-06-04 14:04:27 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-06-09

for you to fetch changes up to 986c34b495810b38f365bb71665b77de60f15b2c:

  Merge tag 'drm-msm-fixes-2023-06-08' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes (2023-06-09
11:20:23 +1000)

----------------------------------------------------------------
drm fixes for 6.4-rc6

fb-helper:
- Fill in fb-helper vars more correctly.

amdgpu:
- S0ix fixes
- GPU reset fixes
- SMU13 fixes
- SMU11 fixes
- Misc Display fixes
- Revert RV/RV2/PCO clock counter changes
- Fix Stoney xclk value
- Fix reserved vram debug info

radeon:
- Fix a potential use after free

i915:
- CDCLK voltage fix for ADL-P
- eDP wake sync pulse fix.
- Two error handling fixes to selftests

exynos:
- Fix wrong return in Exynos vidi driver.
- Fix use-after-free issue to Exynos g2d driver.

ast:
- resume and modeset fixes for ast.

ivpu:
- Assorted ivpu fixes.

lima:
- lima context destroy fix.

msm:
- Fix max segment size to address splat on newer a6xx
- Disable PSR by default w/ modparam to re-enable, since there
  still seems to be a lingering issue
- Fix HPD issue
- Fix issue with unitialized GMU mutex

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dp: add module parameter for PSR

Alex Deucher (3):
      Revert "drm/amdgpu: change the reference clock for raven/raven2"
      Revert "drm/amdgpu: Differentiate between Raven2 and
Raven/Picasso according to revision id"
      Revert "drm/amdgpu: switch to golden tsc registers for raven/raven2"

Alvin Lee (1):
      drm/amd/display: Reduce sdp bw after urgent to 90%

Andi Shyti (1):
      drm/i915/gt: Use the correct error value when kernel_context() fails

Andrzej Kacprowski (2):
      accel/ivpu: Do not trigger extra VPU reset if the VPU is idle
      accel/ivpu: Fix sporadic VPU boot failure

Chaitanya Kumar Borah (1):
      drm/i915/display: Set correct voltage level for 480MHz CDCLK

Chia-I Wu (1):
      drm/amdgpu: fix xclk freq on CHIP_STONEY

Dave Airlie (5):
      Merge tag 'amd-drm-fixes-6.4-2023-06-07' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2023-06-08' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'exynos-drm-fixes-for-v6.4-rc6' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-fixes
      Merge tag 'drm-misc-fixes-2023-06-08' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-msm-fixes-2023-06-08' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes

Dmitry Baryshkov (1):
      drm/msm/a6xx: initialize GMU mutex earlier

Erico Nunes (1):
      drm/lima: fix sched context destroy

Evan Quan (1):
      drm/amd/pm: conditionally disable pcie lane switching for some
sienna_cichlid SKUs

Geert Uytterhoeven (1):
      drm/fb-helper: Fix height, width, and accel_flags in fb_var

Horatio Zhang (1):
      drm/amdgpu: fix Null pointer dereference error in
amdgpu_device_recover_vram

Inki Dae (1):
      drm/exynos: vidi: fix a wrong error return

Jammy Huang (2):
      drm/ast: Fix long time waiting on s3/s4 resume
      drm/ast: Fix modeset failed on DisplayPort

Jouni H=C3=B6gander (1):
      drm/i915: Use 18 fast wake AUX sync len

Kuogee Hsieh (1):
      drm/msm/dp: enable HDP plugin/unplugged interrupts at hpd_enable/disa=
ble

Lijo Lazar (1):
      drm/amd/pm: Fix power context allocation in SMU13

Mario Limonciello (2):
      drm/amd: Disallow s0ix without BIOS support again
      drm/amd: Make lack of `ACPI_FADT_LOW_POWER_S0` or
`CONFIG_AMD_PMC` louder during suspend path

Min Li (2):
      drm/exynos: fix race condition UAF in exynos_g2d_exec_ioctl
      drm/radeon: fix race condition UAF in radeon_gem_set_domain_ioctl

Randy Dunlap (1):
      accel/ivpu: ivpu_ipc needs GENERIC_ALLOCATOR

Rob Clark (1):
      drm/msm: Set max segment size earlier

Samson Tam (1):
      drm/amd/display: add ODM case when looking for first split pipe

Stanislaw Gruszka (2):
      accel/ivpu: Reserve all non-command bo's using DMA_RESV_USAGE_BOOKKEE=
P
      accel/ivpu: Do not use mutex_lock_interruptible

Tvrtko Ursulin (1):
      drm/i915/selftests: Add some missing error propagation

YiPeng Chai (1):
      drm/amdgpu: change reserved vram info print

 drivers/accel/ivpu/Kconfig                         |  1 +
 drivers/accel/ivpu/ivpu_hw_mtl.c                   | 22 ++++--
 drivers/accel/ivpu/ivpu_hw_mtl_reg.h               |  1 +
 drivers/accel/ivpu/ivpu_ipc.c                      |  4 +-
 drivers/accel/ivpu/ivpu_job.c                      | 21 +++--
 drivers/accel/ivpu/ivpu_mmu.c                      | 22 ++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           | 12 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         | 10 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  7 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              | 35 --------
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  7 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    | 11 ++-
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 36 ++++++++-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  | 20 +++++
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  2 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 92 +++++++++++++++++-=
----
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  4 +-
 drivers/gpu/drm/ast/ast_dp.c                       | 55 ++++---------
 drivers/gpu/drm/ast/ast_drv.h                      |  5 +-
 drivers/gpu/drm/ast/ast_main.c                     | 11 ++-
 drivers/gpu/drm/ast/ast_mode.c                     | 15 +++-
 drivers/gpu/drm/ast/ast_post.c                     |  3 +-
 drivers/gpu/drm/drm_fb_helper.c                    | 12 +--
 drivers/gpu/drm/exynos/exynos_drm_g2d.c            |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c           |  2 -
 drivers/gpu/drm/i915/display/intel_cdclk.c         | 30 ++++++-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |  2 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  | 14 +++-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       | 12 ++-
 drivers/gpu/drm/lima/lima_sched.c                  |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  2 -
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  2 +
 drivers/gpu/drm/msm/dp/dp_catalog.c                | 15 +++-
 drivers/gpu/drm/msm/dp/dp_catalog.h                |  3 +-
 drivers/gpu/drm/msm/dp/dp_display.c                | 77 ++++++------------
 drivers/gpu/drm/msm/msm_drv.c                      |  4 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |  4 +-
 38 files changed, 342 insertions(+), 238 deletions(-)
