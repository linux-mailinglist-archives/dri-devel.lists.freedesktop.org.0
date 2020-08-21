Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9590D24C9B2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 03:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A2F6E08E;
	Fri, 21 Aug 2020 01:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C306E08E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 01:55:29 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id d11so289512ejt.13
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 18:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=tBM3q7pJW12rMVs5WoJdio4yMiy6OecKyj2ArnqpUdI=;
 b=JbjBCB+oVBkLzCXFX0ovj5Ky3e0k3pLE7Pamo+KXVUN59aDz9NQBo588H8i0DAhBAx
 4qoHijvxS07t+3Bq4GeQacn126hi3F3dGeJXx7osXjOggLqMkZG+12UqmudRDiAcWLvU
 yxS8F1VEjaAssRvXRjiqkXVzZyANcaVkYl4JxcGrwye0PaL9DmV8tDcz1mAYJ/ooy9iU
 9BgikwLk/wYMJejmTElmgESEiIhjYfJPJc+p1RdDSJSM/2qjXeQUDZgT2KQ43HD5oENS
 SsaHfrotz7dpxdA8YRrMW98DTGuDp5KDqYFeCQlm8CEilHMElxf2RVxmrAQyN8rzqGui
 GHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=tBM3q7pJW12rMVs5WoJdio4yMiy6OecKyj2ArnqpUdI=;
 b=YizV3Gu3B3pTzSx6JRCOt+t57QbUdMEbpA8U/t3AidF8WHYq4MIzFAH0VVjkeR0rkI
 M8+Qso2dZmctId080dXRtUe2vxj3keFIfk93+GQ9nAkLCPxwMUxniCk64MJ2mcFuFP7S
 2Fj/kladw6kuGDKLrDoyKidv7s7EDZUsl5k8DYYu8qjT2CXUb/zpe0Pp+qiqVcnG+3p6
 QJwtA6lXjKLFMpDaQjSBQjxsaV+aiem11RDK7uaD/KtQizQ8AhAnffZf8l+LkHU6si7i
 UzeYMciYfhZI9knVhrn/mFjaZ/bRsJdKeN6sLvvnrRkeTJiG6JJHSWgSZFN/q/7DDOdN
 u3Ew==
X-Gm-Message-State: AOAM533aj+B1zJRI6n9olwvNv/juhAa6c6xKEhlf+IyGG8CJ6idB9yzD
 krZO1cKhAwr0xymZOZIDD0Btp2HVTCEtMkhLmpo=
X-Google-Smtp-Source: ABdhPJxcHu4BA5A29oHWSmXCSFJILf7bh5tG1VQndqIWcfD4BkqmPpCzgpE9Byu4v0BvTexYrzAT5LXeUmdGzZZ2f18=
X-Received: by 2002:a17:906:9591:: with SMTP id
 r17mr721865ejx.456.1597974927611; 
 Thu, 20 Aug 2020 18:55:27 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 21 Aug 2020 11:55:16 +1000
Message-ID: <CAPM=9tzpqLjG31xd0nPmGaYs7NXiWEQTtYaZ=vQZedyWU+yjfQ@mail.gmail.com>
Subject: [git pull] drm fixes for 5.9-rc2
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

Hi Linus,

Regular fixes pull for rc2. Usual rc2 doesn't seem too busy, mainly
i915 and amdgpu. I'd expect the usual uptick for rc3.

Dave.

drm-fixes-2020-08-21:
drm fixes for 5.9-rc2

amdgpu:
- Fix allocation size
- SR-IOV fixes
- Vega20 SMU feature state caching fix
- Fix custom pptable handling
- Arcturus golden settings update
- Several display fixes
- Fixes for Navy Flounder
- Misc display fixes
- RAS fix

amdkfd:
- SDMA fix for renoir

i915:
- Fix device parameter usage for selftest mock i915 device
- Fix LPSP capability debugfs NULL dereference
- Fix buddy register pagemask table
- Fix intel_atomic_check() non-negative return value
- Fix selftests passing a random 0 into ilog2()
- Fix TGL power well enable/disable ordering
- Switch to PMU module refcounting
- GVT fixes

virtio:
- Add missing dma_fence_put() in virtio_gpu_execbuffer_ioctl().
- Fix memory leak in virtio_gpu_cleanup_object().
The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-08-21

for you to fetch changes up to 0790e63f58f22a68696667102be03efb92a4da5f:

  Merge tag 'drm-intel-fixes-2020-08-20' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2020-08-21
11:03:52 +1000)

----------------------------------------------------------------
drm fixes for 5.9-rc2

amdgpu:
- Fix allocation size
- SR-IOV fixes
- Vega20 SMU feature state caching fix
- Fix custom pptable handling
- Arcturus golden settings update
- Several display fixes
- Fixes for Navy Flounder
- Misc display fixes
- RAS fix

amdkfd:
- SDMA fix for renoir

i915:
- Fix device parameter usage for selftest mock i915 device
- Fix LPSP capability debugfs NULL dereference
- Fix buddy register pagemask table
- Fix intel_atomic_check() non-negative return value
- Fix selftests passing a random 0 into ilog2()
- Fix TGL power well enable/disable ordering
- Switch to PMU module refcounting
- GVT fixes

virtio:
- Add missing dma_fence_put() in virtio_gpu_execbuffer_ioctl().
- Fix memory leak in virtio_gpu_cleanup_object().

----------------------------------------------------------------
Anthony Koo (2):
      drm/amd/display: Fix LFC multiplier changing erratically
      drm/amd/display: Switch to immediate mode for updating infopackets

Aric Cyr (1):
      drm/amd/display: Fix incorrect backlight register offset for DCN

Bhawanpreet Lakha (1):
      drm/amdgpu: parse ta firmware for navy_flounder

Chris Park (3):
      drm/amd/display: Call DMUB for eDP power control
      drm/amd/display: Assign correct left shift
      drm/amd/display: Reset scrambling on Test Pattern

Chris Wilson (3):
      drm/i915: Provide the perf pmu.module
      drm/i915: Copy default modparams to mock i915_device
      drm/i915/display: Check for an LPSP encoder before dereferencing

Christophe JAILLET (1):
      drm: amdgpu: Use the correct size when allocating memory

Colin Xu (2):
      drm/i915/gvt: Do not destroy ppgtt_mm during vGPU D3->D0.
      drm/i915/gvt: Do not reset pv_notified when vGPU transit from D3->D0

Daniel Kolesa (1):
      drm/amdgpu/display: use GFP_ATOMIC in dcn20_validate_bandwidth_internal

Dave Airlie (4):
      Merge tag 'drm-misc-fixes-2020-08-12' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'amd-drm-fixes-5.9-2020-08-12' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes
      Merge tag 'amd-drm-fixes-5.9-2020-08-20' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2020-08-20' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Dmytro Laktyushkin (1):
      drm/amd/display: fix dcn3 wide timing dsc validation

Evan Quan (2):
      drm/amd/powerplay: correct Vega20 cached smu feature state
      drm/amd/powerplay: correct UVD/VCE PG state on custom pptable uploading

George Spelvin (1):
      drm/i915/selftests: Avoid passing a random 0 into ilog2

Guchun Chen (1):
      drm/amdgpu: fix NULL pointer access issue when unloading driver

Huang Rui (1):
      drm/amdkfd: fix the wrong sdma instance query for renoir

Imre Deak (1):
      drm/i915/tgl: Make sure TC-cold is blocked before enabling TC
AUX power wells

Jaehyun Chung (1):
      drm/amd/display: Blank stream before destroying HDCP session

Jani Nikula (1):
      Merge tag 'gvt-next-fixes-2020-08-05' of
https://github.com/intel/gvt-linux into drm-intel-fixes

Jiansong Chen (2):
      drm/amdgpu: disable gfxoff for navy_flounder
      Revert "drm/amdgpu: disable gfxoff for navy_flounder"

Kevin Wang (1):
      drm/amdgpu: fix uninit-value in arcturus_log_thermal_throttling_event()

Krunoslav Kovac (1):
      drm/amd/display: fix pow() crashing when given base 0

Liu ChengZhe (1):
      drm/amdgpu: Skip some registers config for SRIOV

Matt Roper (1):
      drm/i915: Update bw_buddy pagemask table

Paul Hsieh (1):
      drm/amd/display: Fix DFPstate hang due to view port changed

Qi Liu (1):
      drm/virtio: fix missing dma_fence_put() in virtio_gpu_execbuffer_ioctl()

Stylon Wang (1):
      drm/amd/display: Fix EDID parsing after resume from suspend

Tianjia Zhang (1):
      drm/i915: Fix wrong return value in intel_atomic_check()

Xin He (1):
      drm/virtio: fix memory leak in virtio_gpu_cleanup_object()

shiwu.zhang (1):
      drm/amdgpu: update gc golden register for arcturus

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  | 31 ++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  1 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           | 19 ++++++++++
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            | 19 ++++++++++
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |  3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  1 +
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c | 16 +++++++-
 .../gpu/drm/amd/display/dc/bios/command_table2.c   | 28 ++++++++++++++
 .../gpu/drm/amd/display/dc/bios/command_table2.h   |  3 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  3 +-
 drivers/gpu/drm/amd/display/dc/dc_bios_types.h     |  4 ++
 .../gpu/drm/amd/display/dc/dce/dce_panel_cntl.h    |  2 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    | 24 ++++++++++++
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c    | 16 ++++----
 .../amd/display/dc/dcn10/dcn10_stream_encoder.h    | 14 +++++++
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  4 +-
 .../drm/amd/display/dc/dcn20/dcn20_link_encoder.h  |  4 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |  2 +-
 .../amd/display/dc/dcn30/dcn30_dio_link_encoder.h  |  5 ++-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |  1 +
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |  4 ++
 .../drm/amd/display/include/bios_parser_types.h    |  7 ++++
 drivers/gpu/drm/amd/display/include/fixed31_32.h   |  3 ++
 .../drm/amd/display/modules/freesync/freesync.c    | 36 ++++++++++++++----
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c       |  9 +++--
 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c | 44 ++++++++++------------
 drivers/gpu/drm/i915/display/intel_display.c       |  2 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  7 +++-
 drivers/gpu/drm/i915/display/intel_display_power.c | 14 +++----
 drivers/gpu/drm/i915/gvt/cfg_space.c               | 24 ++++++++++++
 drivers/gpu/drm/i915/gvt/gtt.c                     |  2 +-
 drivers/gpu/drm/i915/gvt/gtt.h                     |  2 +
 drivers/gpu/drm/i915/gvt/gvt.h                     |  3 ++
 drivers/gpu/drm/i915/gvt/vgpu.c                    | 20 ++++++++--
 drivers/gpu/drm/i915/i915_pmu.c                    |  7 +---
 drivers/gpu/drm/i915/selftests/i915_buddy.c        | 18 +++++----
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |  3 ++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |  1 +
 drivers/gpu/drm/virtio/virtgpu_object.c            |  1 +
 41 files changed, 317 insertions(+), 94 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
