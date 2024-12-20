Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ABB9F8CC2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 07:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBA610E0CD;
	Fri, 20 Dec 2024 06:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D+Oi06aB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E6110E0CD
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 06:33:35 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aa684b6d9c7so282347166b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 22:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734676413; x=1735281213; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bdrknTVoRis7koHvSTztNt6tLCQtExDX/XWIpn2sa+I=;
 b=D+Oi06aBMJjJk69NHXJXzz9t0BrejhnO1YypURG9GlXWsXVM10mgnMxuqrYbj7MmOa
 4njcEdMJpn1GUjjVyn69ZqYzCo7FAzHaA+zExIT17q8KMo5tYn3B9n9djU4dv3e344oz
 jczFGs6dyS9ByldfBK9hAJDQloBbhZBxzT2GYUexD6PKzlpmPmNrTzvmgi/ryPAIOerQ
 u7HoN3GalbcT9xGwlsG7BZRE3NTfDgQF5bXI+IBGzbdErjMBMeQbZETdIHCFJfgnQ7IP
 3bHpAhJl9OZVM/Cq6rIeLBKWAGHBVxHmDhj18avh+nI6BrLDt0f/8UxQ+VTOHXU9svZv
 sm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734676413; x=1735281213;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bdrknTVoRis7koHvSTztNt6tLCQtExDX/XWIpn2sa+I=;
 b=BNbZL2zmEI+rBXij3HzHv26THIR5okgAQQnob6xEluFRcqxmS/p/5iEmhvRmFjIwrs
 1TPCIzJWDz1NRyIThGuQvYImOF68M+MrO/lWA20YFFoTqXdD/5n/n4lE07WOk9INL1yI
 du+jxBt2DlNjQmsh3TwRtBY2SjJt+ATkhDIDWi0H/9Pz5dlTWzkfnDBMgusPm1llskTI
 xab/jI1doRriM6coEn9fht2nuEBe7PopCgZ0jBb3RugSpFsjiLLSlRlleDL0Rej511Pl
 Ld59ZHRX34ccklGHxVIH2IcM3U2yem4KmhsJSxOU+ZhfRMH8xkU8jGcCHWCFH48tpPiu
 Yf8g==
X-Gm-Message-State: AOJu0YwQDjtHadG6wDfsRvfQ8unQpYJs597fItbYFCHhpKSV3OczUqXg
 1DP2ayzerEF3S2gKkl0M3XyM9ehhsrwScm4pJ8rcP5IFlwYTy8e/LBdRQ4sZQAoNCELmIC/4Fkj
 EW+7WQjoXlwjMQb17XA3tCM5v2aZA3hOv
X-Gm-Gg: ASbGnctnaIkXNcVkTD3alAqVYa8VFc47T3KS28SemVFX3tlgYqOS7GLEcvbW7TsMvqr
 9GEh9FsSF5SZD2cefMfEvBgpnVALJPpypYYWv
X-Google-Smtp-Source: AGHT+IHvI42ZTEQXmw54a7rDN9ArVJOOJA5HtyOUuY5oSiYPo+13FNqET06reMdxDsxj43QQpekUYRvw1aOV8bF1794=
X-Received: by 2002:a17:907:7288:b0:aa6:a9fe:46dd with SMTP id
 a640c23a62f3a-aac346507b2mr104358566b.38.1734676413310; Thu, 19 Dec 2024
 22:33:33 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 20 Dec 2024 16:33:22 +1000
Message-ID: <CAPM=9txFoA3pnkbvW-bNUGRss8H1kvYvKvx0a=mR53tiXVm=FA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.13-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Probably the last pull before Christmas holidays, I'll still be around
for most of the time anyways, nothing too major in here, bunch of
amdgpu and i915 along with a smattering of fixes across the board.

Dave.

drm-fixes-2024-12-20:
drm fixes for 6.13-rc4

core:
- fix FB dependency
- avoid div by 0 more in vrefresh
- maintainers update

display:
- fix DP tunnel error path

dma-buf:
- fix !DEBUG_FS

sched:
- docs warning fix

panel:
- collection of misc panel fixes

i915
- Reset engine utilization buffer before registration
- Ensure busyness counter increases monotonically
- Accumulate active runtime on gt reset

amdgpu:
- Disable BOCO when CONFIG_HOTPLUG_PCI_PCIE is not enabled
- scheduler job fixes
- IP version check fixes
- devcoredump fix
- GPUVM update fix
- NBIO 2.5 fix

udmabuf:
- fix memory leak on last export
- sealing fixes

ivpu:
- fix NULL pointer
- fix memory leak
- fix WARN
The following changes since commit 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8=
:

  Linux 6.13-rc3 (2024-12-15 15:58:23 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-12-20

for you to fetch changes up to e639fb046b8150625c1b96bf6f02a18f11ef1760:

  Merge tag 'amd-drm-fixes-6.13-2024-12-18' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2024-12-20
16:21:44 +1000)

----------------------------------------------------------------
drm fixes for 6.13-rc4

core:
- fix FB dependency
- avoid div by 0 more in vrefresh
- maintainers update

display:
- fix DP tunnel error path

dma-buf:
- fix !DEBUG_FS

sched:
- docs warning fix

panel:
- collection of misc panel fixes

i915
- Reset engine utilization buffer before registration
- Ensure busyness counter increases motonically
- Accumulate active runtime on gt reset

amdgpu:
- Disable BOCO when CONFIG_HOTPLUG_PCI_PCIE is not enabled
- scheduler job fixes
- IP version check fixes
- devcoredump fix
- GPUVM update fix
- NBIO 2.5 fix

udmabuf:
- fix memory leak on last export
- sealing fixes

ivpu:
- fix NULL pointer
- fix memory leak
- fix WARN

----------------------------------------------------------------
Alex Deucher (6):
      drm/amdgpu/nbio7.7: fix IP version check
      drm/amdgpu/nbio7.11: fix IP version check
      drm/amdgpu/mmhub4.1: fix IP version check
      drm/amdgpu/gfx12: fix IP version check
      drm/amdgpu/smu14.0.2: fix IP version check
      drm/amdgpu/nbio7.0: fix IP version check

Arnd Bergmann (2):
      drm: rework FB_CORE dependency
      drm: rework FB_CORE dependency

Bagas Sanjaya (1):
      drm/sched: Fix drm_sched_fini() docu generation

Christian K=C3=B6nig (1):
      drm/amdgpu: fix amdgpu_coredump

Danilo Krummrich (1):
      MAINTAINERS: align Danilo's maintainer entries

Dave Airlie (3):
      Merge tag 'drm-intel-fixes-2024-12-18' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2024-12-19' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.13-2024-12-18' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Jacek Lawrynowicz (3):
      accel/ivpu: Fix general protection fault in ivpu_bo_list()
      accel/ivpu: Fix memory leak in ivpu_mmu_reserved_context_init()
      accel/ivpu: Fix WARN in ivpu_ipc_send_receive_internal()

Jann Horn (3):
      udmabuf: fix racy memfd sealing check
      udmabuf: also check for F_SEAL_FUTURE_WRITE
      udmabuf: fix memory leak on last export_udmabuf() error path

Krzysztof Karas (1):
      drm/display: use ERR_PTR on DP tunnel manager creation fail

Marek Vasut (1):
      drm/panel: st7701: Add prepare_prev_first flag to drm_panel

Mario Limonciello (2):
      drm/amd: Require CONFIG_HOTPLUG_PCI_PCIE for BOCO
      drm/amd: Update strapping for NBIO 2.5.0

Michael Trimarchi (1):
      drm/panel: synaptics-r63353: Fix regulator unbalance

Michel D=C3=A4nzer (1):
      drm/amdgpu: Handle NULL bo->tbo.resource (again) in amdgpu_vm_bo_upda=
te

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: don't access invalid sched

T.J. Mercier (1):
      dma-buf: Fix __dma_buf_debugfs_list_del argument for !CONFIG_DEBUG_FS

Thomas Zimmermann (2):
      fbdev: Fix recursive dependencies wrt BACKLIGHT_CLASS_DEVICE
      drm/fbdev: Select FB_CORE dependency for fbdev on DMA and TTM

Umesh Nerlige Ramappa (3):
      i915/guc: Reset engine utilization buffer before registration
      i915/guc: Ensure busyness counter increases motonically
      i915/guc: Accumulate active runtime on gt reset

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/modes: Avoid divide by zero harder in drm_mode_vrefresh()

Yang Yingliang (1):
      drm/panel: novatek-nt35950: fix return value check in nt35950_probe()

Zhang Zekun (1):
      drm/panel: himax-hx83102: Add a check to prevent NULL pointer derefer=
ence

 MAINTAINERS                                        |  4 +-
 arch/powerpc/configs/pmac32_defconfig              |  1 +
 arch/powerpc/configs/ppc6xx_defconfig              |  1 +
 drivers/accel/ivpu/ivpu_gem.c                      |  2 +-
 drivers/accel/ivpu/ivpu_mmu_context.c              | 10 +++--
 drivers/accel/ivpu/ivpu_pm.c                       |  2 +-
 drivers/auxdisplay/Kconfig                         |  2 +-
 drivers/dma-buf/dma-buf.c                          |  2 +-
 drivers/dma-buf/udmabuf.c                          | 43 ++++++++++++++----=
----
 drivers/gpu/drm/Kconfig                            |  4 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c   |  5 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  7 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c             | 11 ++++++
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |  2 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  2 +-
 drivers/gpu/drm/display/drm_dp_tunnel.c            | 10 ++---
 drivers/gpu/drm/drm_modes.c                        | 11 ++++--
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |  5 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 41 ++++++++++++++++++=
++-
 drivers/gpu/drm/panel/panel-himax-hx83102.c        |  2 +
 drivers/gpu/drm/panel/panel-novatek-nt35950.c      |  4 +-
 drivers/gpu/drm/panel/panel-sitronix-st7701.c      |  1 +
 drivers/gpu/drm/panel/panel-synaptics-r63353.c     |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c             |  3 +-
 drivers/macintosh/Kconfig                          |  1 +
 drivers/staging/fbtft/Kconfig                      |  1 +
 drivers/video/fbdev/Kconfig                        | 18 ++++++---
 drivers/video/fbdev/core/Kconfig                   |  3 +-
 33 files changed, 151 insertions(+), 61 deletions(-)
