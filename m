Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B47EF38BD74
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 06:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2996F5B5;
	Fri, 21 May 2021 04:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8D26F5B5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 04:32:06 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id df21so21839969edb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 21:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=fRRN2j+zUDqRjHT4TAcsDeARx0qu+LG7VRjWdyrEsNM=;
 b=Xr4jDv+G+Hw/4TzbCGqJ4wzFxR33fURsliigUqicfOaw6tL3/mR7HkZLV79ruUQf0x
 hBpVKE1EwxH1CnJ934/PYVpTis/vORl2IdwIzqb59Y+N2OduMmK7d17wMgk5WZKlh100
 l58wRMZy3QlPMe1kpmVj+grOQ893pIvbRlhu/Exq/6M91Wr1w5Hnb2Yp3fXVz6IDLh7C
 UhUfooxoNMeSnvtQRKcByVvMbyr3I2caAAeovSscllWaNMGM3lhiWd1bYdGCn5rF9/7S
 CL28clrLmz37AQk4NCAJRUTlpjmp5xHGuUsv0YXHm+pY23Wz0qdgbyJVy6d37psy2SlP
 gBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=fRRN2j+zUDqRjHT4TAcsDeARx0qu+LG7VRjWdyrEsNM=;
 b=HOBYO9+cECv7AQUGp6/m3cbH0p71f+OJ6O2vMifBl5GpvqQMvJAG3BwEC30Cyz59kR
 ikj/WaYb0DvSJ9moXxCd0KhAwd5/JSwcvolse6VC9yzVRzX/okrHNeU3M8qu1RJDvymB
 iNBKF4JctyWbjfjVKeX0/DyudNSh8SEcwtT3MI3WRrvlLz0ICPNrcb9GPGgJcyTjpTfB
 yQJmCi/sCM8zYVBL3Xrn5Do2N2T7SKv87ouGuXp0u98rY07y+givMiIUFqQ3rIZaLUHV
 qfNztQ9vbk9plW+ctcQjvlM8Cp3GbIec/I1YAh1r1Cc6udLkQXTjQoTgprxOmoGtWmhw
 tCEg==
X-Gm-Message-State: AOAM531Xr9wPmR+gn3GVbpmzYBRscSM1cb+BRLjxEMu03AT2PQWUuAYc
 qh7Ogz266BdhHSrXK653s2yK6W6AFg0yprCxoC0=
X-Google-Smtp-Source: ABdhPJyWdIbNC162Hx3y2VpH55Xsheg8+/Ku+HEl6xQTE5eFCpXf9cvbjBzHRZsnN6DMSv743mU27gMqXw1BmCmgAJQ=
X-Received: by 2002:a50:fe94:: with SMTP id d20mr4982329edt.127.1621571524778; 
 Thu, 20 May 2021 21:32:04 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 21 May 2021 14:31:53 +1000
Message-ID: <CAPM=9tzqfc9Xx9bpbp2fKKij=+YYGYG=pSzeVQG=H1pmZf0tBA@mail.gmail.com>
Subject: [git pull] drm fixes for 5.13-rc3
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

Usual collection, mostly amdgpu and some i915 regression fixes. I
nearly managed to hose my build/sign machine this week, but I
recovered it just in time, and I even got clang12 built.

Dave.

drm-fixes-2021-05-21-1:
drm fixes for 5.13-rc3

dma-buf:
- WARN fix

amdgpu:
- Fix downscaling ratio on DCN3.x
- Fix for non-4K pages
- PCO/RV compute hang fix
- Dongle fix
- Aldebaran codec query support
- Refcount leak fix
- Use after free fix
- Navi12 golden settings updates
- GPU reset fixes

radeon:
- Fix for imported BO handling

i915:
- Pin the L-shape quirked object as unshrinkable to fix crashes
- Disable HiZ Raw Stall Optimization on broken gen7 to fix glitches,
gfx corruption
- GVT: Move mdev attribute groups into kvmgt module to fix kconfig deps iss=
ue

exynos:
- Correct kerneldoc of fimd_shadow_protect_win function.
- Drop redundant error messages.
The following changes since commit d07f6ca923ea0927a1024dfccafc5b53b61cfecc=
:

  Linux 5.13-rc2 (2021-05-16 15:27:44 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-05-21-1

for you to fetch changes up to dd6ad0516ee38112321e99ce368fddd49ee3b9db:

  Merge tag 'amd-drm-fixes-5.13-2021-05-19' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2021-05-21
14:08:04 +1000)

----------------------------------------------------------------
drm fixes for 5.13-rc3

dma-buf:
- WARN fix

amdgpu:
- Fix downscaling ratio on DCN3.x
- Fix for non-4K pages
- PCO/RV compute hang fix
- Dongle fix
- Aldebaran codec query support
- Refcount leak fix
- Use after free fix
- Navi12 golden settings updates
- GPU reset fixes

radeon:
- Fix for imported BO handling

i915:
- Pin the L-shape quirked object as unshrinkable to fix crashes
- Disable HiZ Raw Stall Optimization on broken gen7 to fix glitches,
gfx corruption
- GVT: Move mdev attribute groups into kvmgt module to fix kconfig deps iss=
ue

exynos:
- Correct kerneldoc of fimd_shadow_protect_win function.
- Drop redundant error messages.

----------------------------------------------------------------
Changfeng (1):
      drm/amdgpu: disable 3DCGCG on picasso/raven1 to avoid compute hang

Chris Park (1):
      drm/amd/display: Disconnect non-DP with no EDID

Chris Wilson (1):
      drm/i915/gem: Pin the L-shape quirked object as unshrinkable

Christian K=C3=B6nig (3):
      drm/radeon: use the dummy page for GART if needed
      drm/amdgpu: stop touching sched.ready in the backend
      dma-buf: fix unintended pin/unpin warnings

Dave Airlie (4):
      Merge tag 'exynos-drm-fixes-for-v5.13-rc3' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-fixes
      Merge tag 'drm-misc-fixes-2021-05-20' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2021-05-20' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-5.13-2021-05-19' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Guchun Chen (2):
      drm/amdgpu: update gc golden setting for Navi12
      drm/amdgpu: update sdma golden setting for Navi12

James Zhu (1):
      drm/amdgpu: add video_codecs query support for aldebaran

Jani Nikula (1):
      Merge tag 'gvt-fixes-2021-05-19' of
https://github.com/intel/gvt-linux into drm-intel-fixes

Jingwen Chen (1):
      drm/amd/amdgpu: fix refcount leak

Krzysztof Kozlowski (1):
      drm/exynos: correct exynos_drm_fimd kerneldoc

Lang Yu (1):
      drm/amd/amdgpu: fix a potential deadlock in gpu reset

Nikola Cornij (1):
      drm/amd/display: Use the correct max downscaling value for DCN3.x fam=
ily

Simon Rettberg (1):
      drm/i915/gt: Disable HiZ Raw Stall Optimization on broken gen7

Yi Li (1):
      drm/amdgpu: Fix GPU TLB update error when PAGE_SIZE > AMDGPU_PAGE_SIZ=
E

Zhen Lei (2):
      drm/exynos: Remove redundant error printing in exynos_dsi_probe()
      drm/exynos/decon5433: Remove redundant error printing in
exynos5433_decon_probe()

Zhenyu Wang (1):
      drm/i915/gvt: Move mdev attribute groups into kvmgt module

xinhui pan (1):
      drm/amdgpu: Fix a use-after-free

 drivers/dma-buf/dma-buf.c                          |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c             |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  10 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |   2 -
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |   2 -
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |   4 +
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |   5 -
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   3 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |   8 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  18 +++
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   7 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |   7 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |   7 +-
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c      |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   2 +-
 drivers/gpu/drm/i915/Kconfig                       |   1 -
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   2 +
 drivers/gpu/drm/i915/gt/gen7_renderclear.c         |   5 +-
 drivers/gpu/drm/i915/gvt/gvt.c                     | 124 +----------------=
----
 drivers/gpu/drm/i915/gvt/gvt.h                     |   3 -
 drivers/gpu/drm/i915/gvt/hypercall.h               |   2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c                   | 122 +++++++++++++++++=
+--
 drivers/gpu/drm/i915/gvt/mpt.h                     |   4 +-
 drivers/gpu/drm/i915/i915_gem.c                    |  11 +-
 drivers/gpu/drm/radeon/radeon_gart.c               |   3 +-
 29 files changed, 191 insertions(+), 192 deletions(-)
