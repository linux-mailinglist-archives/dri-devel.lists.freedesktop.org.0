Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3D57A1415
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 04:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B3410E5C5;
	Fri, 15 Sep 2023 02:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1A510E5C0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 02:58:03 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2bf66a32f25so25847251fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 19:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694746682; x=1695351482; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q/d7yn2DC4L0fegrQpHp27LXsp/VCS7XWImBV1S1DnI=;
 b=Ur7hRaVXX9soVDU7aQZx9TTQ28kJAlM4zNVofelD5j7qV4TjtkqwL/p1iyy2lcH4ln
 iyqDD6dQWM5FEdb5bm/LgRLmbx2xaOqX0MDheD3/i4GIRMqtOInBNun1FWwx87/mlA+i
 oYD7STk+ttsQiO9FVYcxVKXCYEoQWYstvnM0DqnTzVLWJGRzi5UiChnSvDK8uIqBWlLh
 EUrQ+ZCScbyZ8gwWgmezPCJqdYKQOE1TXZvwGJuk4Xo3yNIEJgr3gczCjD1hLn1KZ/9l
 V5EmFHBu96ipRS9c+aQO/JZ1dF677r80Vnx1R1WJZk1PrfF9/hY8xrfgYlq8ZQceYBz6
 qFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694746682; x=1695351482;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q/d7yn2DC4L0fegrQpHp27LXsp/VCS7XWImBV1S1DnI=;
 b=rsuMHhG62v0wIv7PNfgchX1XDBY/+zan+JhexeG7+QsRDiIaWNpwCpjSbdAo9QV83J
 wFw7DwPyzulRpedIKpK4n7Ta7BmmJ4NvJquBN6af+PfC2FoO+L11FJazIkf1cd/b0MoT
 t8miCa6mzdaRBAONhC55q3bfkFZRgrQigQr4Q4UgO4phwJnSMs8IX58tCuCsQ6HN7BZ0
 y8CUKB6TPbtfHaIdxGvegXUz6kw3By8uWEUvajAQbwNJx/9+j46o8ImU4h+P9JOhs4Yi
 4kbqSCnyO5D9CrxE+k4YYgdIrj00jk+lyphKqiiPG7psa5UO5LQJ4CVgQZtGTiEm/euU
 dM+A==
X-Gm-Message-State: AOJu0YwlmFAkNJoUiakVgwg1RSlrubv/zduAkFP3uYBs0UH7xMtplm52
 b4gHeHZTrJU/xxxA2QSXgp1JBHKcm4lsbaYJwZ8=
X-Google-Smtp-Source: AGHT+IESEi/BoCHM2ENgtnkj2D7MdMefPR9OBCXXZSr7BlvRxNXhPQijzhHi3/GwAQiiWtKMyn+wO1OL9G3mCSBf370=
X-Received: by 2002:a05:651c:149:b0:2b9:c4f6:fdd with SMTP id
 c9-20020a05651c014900b002b9c4f60fddmr475618ljd.14.1694746681316; Thu, 14 Sep
 2023 19:58:01 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 15 Sep 2023 12:57:50 +1000
Message-ID: <CAPM=9tx4M13E1G_a2CsE0W_48g-n4=HDpsiWoHnE_raBaLQoxA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.6-rc2
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

Hey Linus,

Regular rc2 fixes pull, mostly made up of amdgpu stuff, one i915, and
a bunch of others, one vkms locking violation is reverted.

Thanks,
Dave.

drm-fixes-2023-09-15:
drm fixes for 6.6-rc2

connector:
- doc fix

exec:
- workaround lockdep issue

tests:
- fix a UAF

vkms:
- revert hrtimer fix

fbdev:
- g364fb: fix build failure with mips

i915:
- Only check eDP HPD when AUX CH is shared.

amdgpu:
- GC 9.4.3 fixes
- Fix white screen issues with S/G display on system with >=3D 64G of ram
- Replay fixes
- SMU 13.0.6 fixes
- AUX backlight fix
- NBIO 4.3 SR-IOV fixes for HDP
- RAS fixes
- DP MST resume fix
- Fix segfault on systems with no vbios
- DPIA fixes

amdkfd:
- CWSR grace period fix
- Unaligned doorbell fix
- CRIU fix for GFX11
- Add missing TLB flush on gfx10 and newer

radeon:
- make fence wait in suballocator uninterrruptable

gm12u320:
- Fix the timeout usage for usb_bulk_msg()
The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d=
:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-09-15

for you to fetch changes up to c3c9acb8b2466ddf7f00fc11e2efb736b5252172:

  Merge tag 'drm-misc-fixes-2023-09-14' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2023-09-15
12:13:01 +1000)

----------------------------------------------------------------
drm fixes for 6.6-rc2

connector:
- doc fix

exec:
- workaround lockdep issue

tests:
- fix a UAF

vkms:
- revert hrtimer fix

fbdev:
- g364fb: fix build failure with mips

i915:
- Only check eDP HPD when AUX CH is shared.

amdgpu:
- GC 9.4.3 fixes
- Fix white screen issues with S/G display on system with >=3D 64G of ram
- Replay fixes
- SMU 13.0.6 fixes
- AUX backlight fix
- NBIO 4.3 SR-IOV fixes for HDP
- RAS fixes
- DP MST resume fix
- Fix segfault on systems with no vbios
- DPIA fixes

amdkfd:
- CWSR grace period fix
- Unaligned doorbell fix
- CRIU fix for GFX11
- Add missing TLB flush on gfx10 and newer

radeon:
- make fence wait in suballocator uninterrruptable

gm12u320:
- Fix the timeout usage for usb_bulk_msg()

----------------------------------------------------------------
Alex Deucher (3):
      drm/radeon: make fence wait in suballocator uninterrruptable
      drm/amdgpu/soc21: don't remap HDP registers for SR-IOV
      drm/amdgpu/nbio4.3: set proper rmmio_remap.reg_offset for SR-IOV

Bhawanpreet Lakha (1):
      drm/amd/display: Add dirty rect support for Replay

Dan Carpenter (1):
      drm/amdgpu: fix retry loop test

Daniel Vetter (2):
      Merge tag 'drm-misc-next-fixes-2023-09-11' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-misc-fixes-2023-09-07' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Dave Airlie (3):
      Merge tag 'amd-drm-fixes-6.6-2023-09-13' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2023-09-14' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'drm-misc-fixes-2023-09-14' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

David Francis (2):
      drm/amdkfd: Checkpoint and restore queues on GFX11
      drm/amdgpu: Handle null atom context in VBIOS info ioctl

Hamza Mahfooz (1):
      Revert "drm/amd: Disable S/G for APUs when 64GB or more host memory"

Harish Kasiviswanathan (1):
      drm/amdkfd: Insert missing TLB flush on GFX10 and later

Hawking Zhang (1):
      drm/amdgpu: fallback to old RAS error message for aqua_vanjaram

Jinjie Ruan (1):
      drm: gm12u320: Fix the timeout usage for usb_bulk_msg()

Lee Jones (1):
      drm/drm_connector: Provide short description of param
'supported_colorspaces'

Ma=C3=ADra Canal (1):
      Revert "drm/vkms: Fix race-condition between the hrtimer and the
atomic commit"

Mukul Joshi (5):
      drm/amdkfd: Fix reg offset for setting CWSR grace period
      drm/amdkfd: Fix unaligned 64-bit doorbell warning
      drm/amdgpu: Store CU info from all XCCs for GFX v9.4.3
      drm/amdkfd: Update cache info reporting for GFX v9.4.3
      drm/amdkfd: Update CU masking for GFX 9.4.3

Mustapha Ghaddar (2):
      drm/amd/display: Add DPIA Link Encoder Assignment Fix
      drm/amd/display: Fix 2nd DPIA encoder Assignment

Randy Dunlap (1):
      drm/amd/display: fix replay_mode kernel-doc warning

Simon Pilkington (1):
      drm/amd: Make fence wait in suballocator uninterruptible

Sudip Mukherjee (1):
      fbdev/g364fb: fix build failure with mips

Swapnil Patel (1):
      drm/amd/display: Don't check registers, if using AUX BL control

Thomas Hellstr=C3=B6m (2):
      drm/drm_exec: Work around a WW mutex lockdep oddity
      drm/tests: helpers: Avoid a driver uaf

Thomas Zimmermann (1):
      Merge drm/drm-fixes into drm-misc-fixes

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915: Only check eDP HPD when AUX CH is shared

Wayne Lin (1):
      drm/amd/display: Adjust the MST resume flow

Yifan Zhang (1):
      drm/amd/display: fix the white screen issue when >=3D 64GB DRAM

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h  |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  26 -----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  19 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  76 ++++++--------
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c             |   3 +
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.h              |   4 +
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |  34 ++++--
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h       |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c   |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |  43 +++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |  46 ++++++---
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  77 ++++++++------
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 115 +++++++++++++++++=
----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   2 +-
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |  35 +++++--
 drivers/gpu/drm/amd/display/dc/dc.h                |   1 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   4 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |  23 +++++
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   1 +
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |   4 +
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |   9 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   2 +-
 drivers/gpu/drm/drm_connector.c                    |   2 +
 drivers/gpu/drm/drm_exec.c                         |   2 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |  21 ++++
 drivers/gpu/drm/i915/display/intel_bios.h          |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c            |   7 +-
 drivers/gpu/drm/radeon/radeon_sa.c                 |   2 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |  10 +-
 drivers/gpu/drm/vkms/vkms_composer.c               |   9 +-
 drivers/gpu/drm/vkms/vkms_crtc.c                   |   9 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |   4 +-
 include/drm/drm_exec.h                             |  35 ++++++-
 include/drm/drm_kunit_helpers.h                    |   4 +-
 57 files changed, 464 insertions(+), 235 deletions(-)
