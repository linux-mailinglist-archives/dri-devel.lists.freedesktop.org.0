Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17070255314
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 04:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814356E072;
	Fri, 28 Aug 2020 02:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67336E072
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 02:35:32 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id i17so5184102edx.12
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 19:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=wKhv052n7ideRkNrdUibHhJ56ASTzeeOANzERkwGRBQ=;
 b=LaQ+wcPitkKw6HLSACAzw9MAk1j5UzunAlVee3rwjpYhL6IPReaHReAyyx5nQf0tdK
 W5iwN6vYt5LXQjFhsNOy7ItAgkjhU6sZY6B8ti1lr/j9kbG1m+WiCjGYJIvmWOZLbTKk
 6ts2LhDDHJLOg8Qc3mpzAwZTppzzEbpWVT99C5gUsbxdIPLMDPTRLaMcYo36A6kWb0f+
 74nFOzPYxOj4KLi6+rYHA13KrChez77OUK+SVYNq6b/wkP36nNbc0H7BAs3vVaSf+Oy+
 gL8EBxQCDl6Z8uezlakaOIZ3FGBjmUkgpX2neIwsJU7MWN17HZwRhJQuvNFPGBk0AdCB
 Z5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=wKhv052n7ideRkNrdUibHhJ56ASTzeeOANzERkwGRBQ=;
 b=VUpr/H/ZNKc9ONvouOvRAEk3vS5dgMvbfMpqt/EUSVd1ilze0lTNbn0VLBbFrTEwjI
 IbbzsM7MADuYt2EczlSm68r7nvoda40EByWYNTUb1xvinx3Rahe/jBEH+U4NWM04QdvV
 8n/leQ9nabHCy4RVWGhW1/v0Ph5/p/xQydt27UHa974WqIAW3RP7zG33Wn/SadIsG0eN
 +UzzV88ZqvALyJ6aNrqRCuoTKlFLDqYsFahR23d+fDhk/mNM8qFqTROLa+c7BRCtV3Rd
 eYWndYZ411NC+fTYfS5fm5whP2Yp0ncRAH5NfYlGRqqF4TPjIdqIz4lzciRt45EDaq6y
 VEIQ==
X-Gm-Message-State: AOAM5320lpfjTLYM7vqIKsGyOhRWYzX31a7VvRg0AI+rUlI3i2a0e+aK
 xaPLoVmjghAuOgwMJVrQBt0IheAj+9fEHIdvCxA=
X-Google-Smtp-Source: ABdhPJzNfnEooASArx2KeMmCdC9bvRxAd203/FdoBKylq+5AcX5DVOhNf6CKdzh+BzVSXYcNYnJdmhWHzUIluqBQV5A=
X-Received: by 2002:aa7:c983:: with SMTP id c3mr22100887edt.383.1598582131344; 
 Thu, 27 Aug 2020 19:35:31 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 28 Aug 2020 12:35:20 +1000
Message-ID: <CAPM=9tz1s-Mt7ba-82zMPP8hAmenxBj51QzRAq_=TkD0VLJRKw@mail.gmail.com>
Subject: [git pull] drm fixes for 5.9-rc3
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

As expected a bit of an rc3 uptick, amdgpu and msm are the main ones,
one msm patch was from the merge window, but had dependencies and we
dropped it until the other tree had landed. Otherwise it's a couple of
fixes for core, and etnaviv, and single i915, exynos, omap fixes.

I'm still tracking the Sandybridge gpu relocations issue, if we don't
see much movement I might just queue up the reverts. I'll talk to
Daniel next week once he's back from holidays.

Dave.

drm-fixes-2020-08-28:
drm fixes for 5.9-rc3

core:
- Take modeset bkl for legacy drivers.

dp_mst:
- Allow null crtc in dp_mst.

i915:
- Fix command parser desc matching with masks

amdgpu:
- Misc display fixes
- Backlight fixes
- MPO fix for DCN1
- Fixes for Sienna Cichlid
- Fixes for Navy Flounder
- Vega SW CTF fixes
- SMU fix for Raven
- Fix a possible overflow in INFO ioctl
- Gfx10 clockgating fix

msm:
- opp/bw scaling patch followup
- frequency restoring fux
- vblank in atomic commit fix
- dpu modesetting fixes
- fencing fix

etnaviv:
- scheduler interaction fix
- gpu init regression fix

exynos:
- Just drop __iommu annotation to fix sparse warning.

omap:
- locking state fix.
The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:

  Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-08-28

for you to fetch changes up to 2a3f9da32de4616f0104209194e9bd3dfae092c9:

  Merge tag 'drm-intel-fixes-2020-08-27' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2020-08-28
11:02:53 +1000)

----------------------------------------------------------------
drm fixes for 5.9-rc3

core:
- Take modeset bkl for legacy drivers.

dp_mst:
- Allow null crtc in dp_mst.

i915:
- Fix command parser desc matching with masks

amdgpu:
- Misc display fixes
- Backlight fixes
- MPO fix for DCN1
- Fixes for Sienna Cichlid
- Fixes for Navy Flounder
- Vega SW CTF fixes
- SMU fix for Raven
- Fix a possible overflow in INFO ioctl
- Gfx10 clockgating fix

msm:
- opp/bw scaling patch followup
- frequency restoring fux
- vblank in atomic commit fix
- dpu modesetting fixes
- fencing fix

etnaviv:
- scheduler interaction fix
- gpu init regression fix

exynos:
- Just drop __iommu annotation to fix sparse warning.

omap:
- locking state fix.

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: Fix buffer overflow in INFO ioctl

Alexander Monakov (1):
      drm/amd/display: use correct scale for actual_brightness

Bhawanpreet Lakha (1):
      drm/dp_mst: Don't return error code when crtc is null

Brandon Syu (1):
      drm/amd/display: Keep current gain when ABM disable immediately

Christian Gmeiner (1):
      drm/etnaviv: fix external abort seen on GC600 rev 0x19

Daniel Vetter (1):
      drm/modeset-lock: Take the modeset BKL for legacy drivers

Dave Airlie (6):
      Merge tag 'exynos-drm-fixes-v5.9-rc3' of
git://git.kernel.org/.../daeinki/drm-exynos into drm-fixes
      Merge branch 'etnaviv/fixes' of
https://git.pengutronix.de/git/lst/linux into drm-fixes
      Merge tag 'drm-msm-fixes-2020-08-24' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      Merge tag 'amd-drm-fixes-5.9-2020-08-26' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2020-08-26' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2020-08-27' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Dinghao Liu (1):
      drm/amd/display: Fix memleak in amdgpu_dm_mode_config_init

Dmitry Baryshkov (1):
      drm/msm/a6xx: fix gmu start on newer firmware

Evan Quan (4):
      drm/amd/pm: correct Vega10 swctf limit setting
      drm/amd/pm: correct Vega12 swctf limit setting
      drm/amd/pm: correct Vega20 swctf limit setting
      drm/amd/pm: correct the thermal alert temperature limit settings

Furquan Shaikh (1):
      drivers: gpu: amd: Initialize amdgpu_dm_backlight_caps object to
0 in amdgpu_dm_update_backlight_caps

Jaehyun Chung (1):
      drm/amd/display: Revert HDCP disable sequence change

Jiansong Chen (5):
      drm/amd/pm: enable run_btc callback for sienna_cichlid
      drm/amd/pm: set VCN pg per instances
      drm/amdgpu/gfx10: refine mgcg setting
      drm/amdgpu: use MODE1 reset for navy_flounder by default
      drm/amdgpu: disable runtime pm for navy_flounder

Jonathan Marek (1):
      drm/msm/a6xx: fix frequency not always being restored on GMU resume

Kalyan Thota (2):
      drm/msm/dpu: Fix reservation failures in modeset
      drm/msm/dpu: Fix scale params in plane validation

Krishna Manikandan (1):
      drm/msm: add shutdown support for display platform_driver

Lucas Stach (1):
      drm/etnaviv: always start/stop scheduler in timeout processing

Maarten Lankhorst (1):
      Merge tag 'v5.9-rc2' into drm-misc-fixes

Marek Szyprowski (1):
      drm/exynos: gem: Fix sparse warning

Mika Kuoppala (1):
      drm/i915: Fix cmd parser desc matching with masks

Nicholas Kazlauskas (2):
      drm/amd/display: Reject overlay plane configurations in
multi-display scenarios
      drm/amd/powerplay: Fix hardmins not being sent to SMU for RV

Rob Clark (6):
      drm/msm/dpu: fix unitialized variable error
      drm/msm/adreno: fix updating ring fence
      drm/msm/gpu: make ringbuffer readonly
      drm/msm: enable vblank during atomic commits
      drm/msm/a6xx: fix crashdec section name typo
      drm/msm/a6xx: add module param to enable debugbus snapshot

Samson Tam (1):
      drm/amd/display: Fix passive dongle mistaken as active dongle in
EDID emulation

Sharat Masetty (1):
      drm: msm: a6xx: use dev_pm_opp_set_bw to scale DDR

Sung Lee (1):
      drm/amd/display: Send DISPLAY_OFF after power down on boot

Tao Zhou (1):
      drm/amdgpu: add asd fw check before loading asd

Tomi Valkeinen (1):
      drm/omap: fix incorrect lock state

Tong Zhang (1):
      drm/amd/display: should check error using DC_OK

Wayne Lin (1):
      drm/amd/display: Retry AUX write when fail occurs

 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  5 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  6 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 93 ++++++++++++----------
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  2 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  | 10 +++
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  3 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  8 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |  2 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  | 53 +++++++-----
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |  8 ++
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |  2 +
 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c  |  9 +--
 .../gpu/drm/amd/powerplay/hwmgr/vega10_thermal.c   | 22 ++---
 .../gpu/drm/amd/powerplay/hwmgr/vega12_thermal.c   | 21 ++---
 .../gpu/drm/amd/powerplay/hwmgr/vega20_thermal.c   | 21 ++---
 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c | 11 ++-
 drivers/gpu/drm/drm_atomic_helper.c                |  7 +-
 drivers/gpu/drm/drm_color_mgmt.c                   |  2 +-
 drivers/gpu/drm/drm_crtc.c                         |  4 +-
 drivers/gpu/drm/drm_dp_mst_topology.c              |  4 +-
 drivers/gpu/drm/drm_mode_object.c                  |  4 +-
 drivers/gpu/drm/drm_plane.c                        |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              | 11 ++-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            | 11 +--
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.h            |  2 +-
 drivers/gpu/drm/i915/i915_cmd_parser.c             | 14 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 38 ++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  3 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  4 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 20 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  4 +-
 drivers/gpu/drm/msm/msm_atomic.c                   | 36 +++++++++
 drivers/gpu/drm/msm/msm_drv.c                      |  8 ++
 drivers/gpu/drm/msm/msm_ringbuffer.c               |  3 +-
 drivers/gpu/drm/omapdrm/omap_crtc.c                |  3 +-
 include/drm/drm_modeset_lock.h                     |  9 ++-
 43 files changed, 310 insertions(+), 169 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
