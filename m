Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1E5575A03
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 05:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BFD10E1B3;
	Fri, 15 Jul 2022 03:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D12D10E1B3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 03:36:30 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id m16so4716014edb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 20:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=qP8f6247sdl8IXvIgvciCTK7T0HXiroFjPJjqECReAg=;
 b=k0vTLxPmB+4YiqxkXEvJGYwf/lgxMbzf3dhE8KZ26QxC12reamHAMhO9OGiLtWkj3i
 +5ogQOMkHtBJVswDs+Iee4/52zxRqUwCdX6ZUibSY83oJ9FF6KV1YkwN4C/WaJE+o1tr
 6btnniZgbh/Ih9KIX28vmarj80zF/mnyDBr1keBaLM9G9D2j+Q4fAdhMNbD7VJdjt2Wa
 2T/VSRbbEjXNvJn6Z3thqZNQDEoN0CsnTVNENi7jPAurvfZgt1tKxneP4zwJfrSJYwAa
 lVTnpgykoON/a7x1WxQNcAr9ulLeHrj5t9Zon/ygHU7IOsMDVpMkQg5w2GdJW9vZ0oHE
 HviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=qP8f6247sdl8IXvIgvciCTK7T0HXiroFjPJjqECReAg=;
 b=BhTH79VSyvqWY6b/4r67+dSZnGijg9RP+YmH4SYmbtQmXgdWsiybWvKYqm4ssVuJse
 6IRT0lwiWa9JkYtZ33zIkssUB+lHkpE5jD5U37HH9thhX2voRk0xEczVlMz22PmX0AjR
 sK1EUjUHPalWw7j9QDqATnjTUD/k6NDthbsiq29tg3wEQAJSDjosT3Tui7HqlISdQ2Ge
 Hh6HyWc+flBtDpMmGgLZdXOxHPaquWD1Ajr8L6Xu93+2x4xuvBhbkWa5Aau++5+viDq0
 mu9oglTkaUvwBpQsFe7ZSd/1In15lqR9WweVWwPnxRf4jPQ+rTvsLxBueF3y69/LsaTG
 +aQw==
X-Gm-Message-State: AJIora9w3rc6Oahli1xPkdvQMQ5/7WtJEPCJeiYju2uRvno2ydG/06+c
 2FkATp8lc1MYDijc1WLd5B8CHx7/6KJ5z4IHPto=
X-Google-Smtp-Source: AGRyM1uGGyKIK1ThoU+6t2E4XvmoiZXfhKjUc2zJ9oyryrdZupndkjYQg6LohQ0vPz7uEygs029X2hsIdj6O4AtmZOU=
X-Received: by 2002:a05:6402:d05:b0:435:b2a6:94eb with SMTP id
 eb5-20020a0564020d0500b00435b2a694ebmr15872324edb.87.1657856188998; Thu, 14
 Jul 2022 20:36:28 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 15 Jul 2022 13:36:17 +1000
Message-ID: <CAPM=9twM75GDM9t+9-CSCPDZG3QdcEpQ-X+FzQ4CLUCM7cKLkw@mail.gmail.com>
Subject: [git pull] drm fixes for 5.19-rc7
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

This is the regular fixes pull for this week. This has a bunch of
amdgpu fixes, major one reverts the buddy allocator until it can be
tested more, otherwise just small ones, then i915 has a bunch of
fixes.

The outstanding firmware regressions reported by phoronix will
hopefully be dealt with ASAP.

Regards,
Dave.

drm-fixes-2022-07-15:
drm fixes for 5.19-rc7

amdgpu:
- revert buddy allocator support for now
- DP MST blank screen fix for specific platforms
- MEC firmware check fix for GC 10.3.7
- Deep color fix for DCE
- Fix possible divide by 0
- Coverage blend mode fix
- Fix cursor only commit timestamps

i915:
- Selftest fix
- TTM fix sg_table construction
- Error return fixes
- Fix a performance regression related to waitboost
- Fix GT resets
The following changes since commit 3590b44b9434af1b9c81c3f40189087ed4fe3635=
:

  Merge tag 'drm-misc-fixes-2022-07-07-1' of
ssh://git.freedesktop.org/git/drm/drm-misc into drm-fixes (2022-07-12
10:44:40 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-07-15

for you to fetch changes up to 093f8d8f10aa22935bc8bf7100700f714ebaba9c:

  Merge tag 'amd-drm-fixes-5.19-2022-07-13' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2022-07-15
11:26:20 +1000)

----------------------------------------------------------------
drm fixes for 5.19-rc7

amdgpu:
- revert buddy allocator support for now
- DP MST blank screen fix for specific platforms
- MEC firmware check fix for GC 10.3.7
- Deep color fix for DCE
- Fix possible divide by 0
- Coverage blend mode fix
- Fix cursor only commit timestamps

i915:
- Selftest fix
- TTM fix sg_table construction
- Error return fixes
- Fix a performance regression related to waitboost
- Fix GT resets

----------------------------------------------------------------
Andrzej Hajda (1):
      drm/i915/selftests: fix subtraction overflow bug

Arunpravin Paneer Selvam (1):
      Revert "drm/amdgpu: add drm buddy support to amdgpu"

Chris Wilson (3):
      drm/i915/gt: Serialize GRDOM access between multiple engine resets
      drm/i915/gt: Serialize TLB invalidates with GT resets
      drm/i915/gem: Look for waitboosting across the whole object
prior to individual waits

Dan Carpenter (2):
      drm/i915/gvt: IS_ERR() vs NULL bug in intel_gvt_update_reg_whitelist(=
)
      drm/i915/selftests: fix a couple IS_ERR() vs NULL tests

Daniele Ceraolo Spurio (1):
      drm/i915/guc: ADL-N should use the same GuC FW as ADL-S

Dave Airlie (3):
      Merge tag 'drm-misc-fixes-2022-07-14' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2022-07-13' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-5.19-2022-07-13' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Fangzhi Zuo (1):
      drm/amd/display: Ignore First MST Sideband Message Return Error

Hangyu Hua (1):
      drm/i915: fix a possible refcount leak in intel_dp_add_mst_connector(=
)

Mario Kleiner (1):
      drm/amd/display: Only use depth 36 bpp linebuffers on DCN display eng=
ines.

Matthew Auld (1):
      drm/i915/ttm: fix sg_table construction

Melissa Wen (1):
      drm/amd/display: correct check of coverage blend mode

Michel D=C3=A4nzer (1):
      drm/amd/display: Ensure valid event timestamp for cursor-only commits

Prike Liang (1):
      drm/amdkfd: correct the MEC atomic support firmware checking for GC 1=
0.3.7

Rodrigo Vivi (1):
      Merge tag 'gvt-fixes-2022-07-11' of
https://github.com/intel/gvt-linux into drm-intel-fixes

Thomas Hellstr=C3=B6m (1):
      drm/i915: Fix vm use-after-free in vma destruction

Yefim Barashkin (1):
      drm/amd/pm: Prevent divide by zero

 drivers/gpu/drm/Kconfig                            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h     |  97 ++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       | 359 +++++++++--------=
----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h       |  89 -----
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   2 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  84 ++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   8 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  17 +
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  11 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |  11 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |  34 ++
 drivers/gpu/drm/i915/gt/intel_gt.c                 |  15 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |  37 ++-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |   8 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |   6 +-
 drivers/gpu/drm/i915/i915_scatterlist.c            |  19 +-
 drivers/gpu/drm/i915/i915_scatterlist.h            |   6 +-
 drivers/gpu/drm/i915/intel_region_ttm.c            |  10 +-
 drivers/gpu/drm/i915/intel_region_ttm.h            |   3 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |   2 +-
 .../gpu/drm/i915/selftests/intel_memory_region.c   |  21 +-
 drivers/gpu/drm/i915/selftests/mock_region.c       |   3 +-
 24 files changed, 433 insertions(+), 422 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
