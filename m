Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CBD96551A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 04:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0455E10E5B6;
	Fri, 30 Aug 2024 02:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="blMh46s7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC58610E5B6
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 02:08:54 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a869332c2c2so397941566b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 19:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724983733; x=1725588533; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Qg6WNfL/F6Y1y6D4ESySiWKDVVUAg0SLjU+a+wT4JMA=;
 b=blMh46s7CRXMG0qfk4+R6TMctRi3U6ga+poBI+iowRUEYBNZciMwWvs5EMDUgOKa6G
 INr565xeIFZNlrYoPVs/Omot11D5tNcjoDUa7+6UWh+k2zS+4hLXP+8oyiomXZ/Aa/Ci
 AwVDSYDKEEnwEM0KL85grWvdau+kOvkKhw9865AiyIzvcjd+kc2uAusWSNRTKL9oqsSO
 MLlnyCGopFCZQSqqtlGnqgssz2ZZhCVg5qR4Co6i4dQvWq4OP2eEKS3Ac4dDMzC86NfP
 97uvGkML13pxpfa+UGbi+R45t0lEAM2J1qkqBClxY7CoIwNdlV1j1v/zLKLenYK/DNcN
 hEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724983733; x=1725588533;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qg6WNfL/F6Y1y6D4ESySiWKDVVUAg0SLjU+a+wT4JMA=;
 b=mvFg2iWtBeo3Cy8ed10S2ggjSvdI24m+3M3Y225r5wRBdLHlJuKjAamD6UIzbtEt0D
 0QPcxXgaVAbpCc0xZUaPARdP2JWYqYLbvm+ZjNvXjaBbxyAdp8f9UJTjM6R0GMOA2d8L
 FJPVsqZD1w1OC17b/tkn5Ox+yguPuQGIE3ZjLv59/PzBbZ3Y6G8VTyhBIZ37MYbfW0uv
 RwAIRpLIxk/R/vi6QUkjyv2+O9GKQPLoYDRqkH1VMCId2OuAONGCDOiGjiEMC9mY3vim
 OANrgVcghNPRzOqh0PDooJN4VXbWRMp0WBIEel/adxankkhGW/TCJNwMh+3EVf48JyYg
 7MjA==
X-Gm-Message-State: AOJu0Yz+lXwvse6VXP2e14jiMT0luxiCN6jYOUujsJwdDJOxLKKPxk0r
 7B3qCJY5Mm3iJ6IBCS1LyZv7qlJTKImejlOxAcN7PPTVLWmS/f4VEpi+GkFVFuz15cbsca/dlbQ
 DmL6ZOmtQRFo0zrV+JeRDg6eBJds=
X-Google-Smtp-Source: AGHT+IHgBRLmBAT4IJRklNDrgpfErJbap5rAuJNsLi3oUTrZX4dHmrrQJ1gAnoqaDuwxckRhNyZezmoRL/ajgVTzvm0=
X-Received: by 2002:a17:907:980c:b0:a83:849e:ea80 with SMTP id
 a640c23a62f3a-a898284a66emr452964966b.32.1724983732769; Thu, 29 Aug 2024
 19:08:52 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 30 Aug 2024 12:08:41 +1000
Message-ID: <CAPM=9tzX71UKndfu8JECMOzc9kf4s4pp9cWTMWwE476cQXt_Yw@mail.gmail.com>
Subject: [git pull] drm fixes for 6.11-rc6
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Linus,

Another week, another set of GPU fixes. amdgpu and vmwgfx leading the
charge, then i915 and xe changes along with v3d and some other bits.
The TTM revert is due to some stuttering graphical apps probably due
to longer stalls while prefaulting.

Seems pretty much where I'd expect things,

Dave.

drm-fixes-2024-08-30:
drm fixes for 6.11-rc6

ttm:
- revert prefault change, caused stutters

aperture:
- handle non-VGA devices bettter

amdgpu:
- SWSMU gaming stability fix
- SMU 13.0.7 fix
- SWSMU documentation alignment fix
- SMU 14.0.x fixes
- GC 12.x fix
- Display fix
- IP discovery fix
- SMU 13.0.6 fix

i915:
- Fix #11195: The external display connect via USB type-C dock stays
blank after re-connect the dock
- Make DSI backlight work for 2G version of Lenovo Yoga Tab 3 X90F
- Move ARL GuC firmware to correct version

xe:
- Invalidate media_gt TLBs
- Fix HWMON i1 power setup write command

vmwgfx:
- prevent unmapping active read buffers
- fix prime with external buffers
- disable coherent dumb buffers without 3d

v3d:
- disable preemption while updating GPU stats
The following changes since commit 5be63fc19fcaa4c236b307420483578a56986a37:

  Linux 6.11-rc5 (2024-08-25 19:07:11 +1200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-08-30

for you to fetch changes up to 27f5b729cb56e46d8beca47c227c0edf1e958fbb:

  Merge tag 'drm-misc-fixes-2024-08-29' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
(2024-08-30 11:28:11 +1000)

----------------------------------------------------------------
drm fixes for 6.11-rc6

ttm:
- revert prefault change, caused stutters

aperture:
- handle non-VGA devices bettter

amdgpu:
- SWSMU gaming stability fix
- SMU 13.0.7 fix
- SWSMU documentation alignment fix
- SMU 14.0.x fixes
- GC 12.x fix
- Display fix
- IP discovery fix
- SMU 13.0.6 fix

i915:
- Fix #11195: The external display connect via USB type-C dock stays
blank after re-connect the dock
- Make DSI backlight work for 2G version of Lenovo Yoga Tab 3 X90F
- Move ARL GuC firmware to correct version

xe:
- Invalidate media_gt TLBs
- Fix HWMON i1 power setup write command

vmwgfx:
- prevent unmapping active read buffers
- fix prime with external buffers
- disable coherent dumb buffers without 3d

v3d:
- disable preemption while updating GPU stats

----------------------------------------------------------------
Alex Deucher (6):
      Revert "drm/ttm: increase ttm pre-fault value to PMD size"
      video/aperture: optionally match the device in sysfb_disable()
      drm/amdgpu: align pp_power_profile_mode with kernel docs
      drm/amdgpu/smu13.0.7: print index for profiles
      drm/amdgpu/swsmu: always force a state reprogram on init
      drm/amdgpu/gfx12: set UNORD_DISPATCH in compute MQDs

Candice Li (1):
      drm/amd/pm: Drop unsupported features on smu v14_0_2

Dave Airlie (4):
      Merge tag 'amd-drm-fixes-6.11-2024-08-28' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2024-08-29' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2024-08-29' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2024-08-29' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes

Hans de Goede (1):
      drm/i915/dsi: Make Lenovo Yoga Tab 3 X90F DMI match less strict

Imre Deak (1):
      drm/i915/dp_mst: Fix MST state after a sink reset

John Harrison (1):
      drm/i915: ARL requires a newer GSC firmware

Karthik Poosa (1):
      drm/xe/hwmon: Fix WRITE_I1 param from u32 to u16

Kenneth Feng (1):
      drm/amd/pm: update message interface for smu v14.0.2/3

Lijo Lazar (1):
      drm/amd/pm: Add support for new P2S table revision

Likun Gao (1):
      drm/amdgpu: support for gc_info table v1.3

Ma Ke (1):
      drm/amd/display: avoid using null object of framebuffer

Matthew Brost (1):
      drm/xe: Invalidate media_gt TLBs

Tvrtko Ursulin (1):
      drm/v3d: Disable preemption while updating GPU stats

Zack Rusin (3):
      drm/vmwgfx: Prevent unmapping active read buffers
      drm/vmwgfx: Fix prime with external buffers
      drm/vmwgfx: Disable coherent dumb buffers without 3d

 drivers/firmware/sysfb.c                           |  19 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  11 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   6 ++
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c   |   1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   9 +-
 drivers/gpu/drm/amd/include/discovery.h            |  42 ++++++++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  21 ++--
 .../amd/pm/swsmu/inc/pmfw_if/smu_v14_0_2_ppsmc.h   |  18 +++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   7 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   4 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  48 ---------
 drivers/gpu/drm/i915/display/intel_dp.c            |  12 +++
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  40 ++++++++
 drivers/gpu/drm/i915/display/intel_dp_mst.h        |   1 +
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   1 -
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c          |  31 ++++++
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |  10 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   2 +
 drivers/gpu/drm/i915/intel_device_info.c           |   7 ++
 drivers/gpu/drm/i915/intel_device_info.h           |   3 +
 drivers/gpu/drm/v3d/v3d_sched.c                    |   6 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c               | 114 ++++++++++++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |  13 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h                 |   3 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |  12 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |   6 +-
 drivers/gpu/drm/xe/xe_hwmon.c                      |   2 +-
 drivers/gpu/drm/xe/xe_vm.c                         |  37 ++++---
 drivers/of/platform.c                              |   2 +-
 drivers/video/aperture.c                           |  11 +-
 include/drm/intel/i915_pciids.h                    |  11 +-
 include/drm/ttm/ttm_bo.h                           |   4 -
 include/linux/sysfb.h                              |   4 +-
 35 files changed, 398 insertions(+), 126 deletions(-)
