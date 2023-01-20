Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8362A674999
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 03:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234E710EA0F;
	Fri, 20 Jan 2023 02:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A61F10EA10
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 02:53:13 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id vw16so10616538ejc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 18:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QwyZYeNCL1hF3Rz9/fqQMn25Wa4u8woxGDcpYr3p8ic=;
 b=U+Ttc4HScyps/Mxvk6wFlWGgpDCfOvthtEug9p5XWbYBSB17HngzTsFn+TEHuWHivr
 SMlTVRoVMEybUzSqek6BNYf/7UYmspLimKWUAnmbe4P9Tkqw+o9hAmBEMqz4JcnnbOb3
 N+JxQmgXiyKMrvOetCDQpcICHOy6vN6A+g6TyPg5s+y0aYM9+qPSPx64AATRHc43oyg1
 eUb2O8OgSYpk60iF4+74+IidcmfZhEeMeZw1mICrBR4/IghknFmfUJ4RdZ5br0BzIi7s
 WZLSxqhYQEbB/YCvpLTm6OKqVkTXpvOfUaeukWVlep4D6bGpgs2jSX1c8CZCvy618gHk
 0JcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QwyZYeNCL1hF3Rz9/fqQMn25Wa4u8woxGDcpYr3p8ic=;
 b=PJglQPJDF7Z0B4X4gDKd1RxbpTYrRCm/fb/9WNOita0+fUakRk9lcvqcvgerm2uZvI
 HLx7XWWiAkROyUNYHTeQ8bTxKyRwLtngYlCY2CCZB7+OR6AmyGlA0PEMmESnh4i+iPcK
 BbaFK6/V3XKyzElLWU9XXpj493ROssOR7nL9PtUF57TyVSPv0T4+gXIjuNuioaDXVtHe
 RFgQ/Y4o2Jy8lJbmM2zrirLsRB0siSRFgHNSwIOVu6SGtzdF2uhW1X7XRpOJ4rzhSAMh
 z229rfgX1SLjFSJgyaWDrqHjU7iUCxBeM5cMHGCos9c14AocsPvKSurX3Ly18EIGBImp
 mIpw==
X-Gm-Message-State: AFqh2kpHoTyZv9uU6+FA5wEdojcyuv5xMpk8vrl7xN9duqU78lyPB9+B
 YKHI4y2onFUMhwWENr7KWmCZrL4LobbVU1RnJn0=
X-Google-Smtp-Source: AMrXdXv56QiMUAIgGHW8YiI95eYqT4IqZREQs4w3kTUeR5JkiTM6DdoK9/lD5z9+l8Yc3AEvtq7NO9fZS2NGC3/X8z0=
X-Received: by 2002:a17:906:468b:b0:867:887d:67a9 with SMTP id
 a11-20020a170906468b00b00867887d67a9mr1157209ejr.561.1674183191621; Thu, 19
 Jan 2023 18:53:11 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 20 Jan 2023 12:52:59 +1000
Message-ID: <CAPM=9tyh=fnWEUfE_Y5mMVwxgHEUCpev6pXyOQsxG+NpeEVQgA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.2-rc5
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

Just a pretty regular week for this stage of things, amdgpu and i915,
along with some msm and misc others.

Dave.

drm-fixes-2023-01-20:
drm fixes for 6.2-rc5

fb-helper:
- switcheroo fix

msm:
- kexec shutdown fix
- fix potential double free

i915:
- Reject display plane with height =3D=3D 0
- re-disable RC6p on Sandy Bridge
- Fix hugepages' selftest
- DG2 hw workarounds
- switcheroo fix

vc4:
- fix a memory leak

panfrost:
- Kconfig fix

amdgpu:
- Fix display scaling
- Fix RN/CZN power reporting on some firmware versions
- Colorspace fixes
- Fix resource freeing in error case in CS IOCTL
- Fix warning on driver unload
- GC11 fixes
- DCN 3.1.4/5 S/G display workarounds
The following changes since commit 5dc4c995db9eb45f6373a956eb1f69460e69e6d4=
:

  Linux 6.2-rc4 (2023-01-15 09:22:43 -0600)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-01-20

for you to fetch changes up to 3f30a6e67ce49c0068f8058893326db46b6db11f:

  Merge tag 'amd-drm-fixes-6.2-2023-01-19' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2023-01-20
11:21:20 +1000)

----------------------------------------------------------------
drm fixes for 6.2-rc5

fb-helper:
- switcheroo fix

msm:
- kexec shutdown fix
- fix potential double free

i915:
- Reject display plane with height =3D=3D 0
- re-disable RC6p on Sandy Bridge
- Fix hugepages' selftest
- DG2 hw workarounds
- switcheroo fix

vc4:
- fix a memory leak

panfrost:
- Kconfig fix

amdgpu:
- Fix display scaling
- Fix RN/CZN power reporting on some firmware versions
- Colorspace fixes
- Fix resource freeing in error case in CS IOCTL
- Fix warning on driver unload
- GC11 fixes
- DCN 3.1.4/5 S/G display workarounds

----------------------------------------------------------------
Alex Deucher (2):
      drm/amd/display: disable S/G display on DCN 3.1.5
      drm/amd/display: disable S/G display on DCN 3.1.4

Arnd Bergmann (1):
      drm/panfrost: fix GENERIC_ATOMIC64 dependency

Chris Wilson (1):
      drm/i915/selftests: Unwind hugepages to drop wakeref on error

Christian K=C3=B6nig (2):
      drm/amdgpu: fix cleaning up reserved VMID on release
      drm/amdgpu: fix amdgpu_job_free_resources v2

Dave Airlie (4):
      Merge tag 'drm-msm-fixes-2023-01-16' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      Merge tag 'drm-intel-fixes-2023-01-19' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'drm-misc-fixes-2023-01-19' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'amd-drm-fixes-6.2-2023-01-19' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Drew Davenport (1):
      drm/i915/display: Check source height is > 0

Hamza Mahfooz (1):
      drm/amd/display: fix issues with driver unload

Joel Fernandes (Google) (1):
      adreno: Shutdown the GPU properly

Joshua Ashton (2):
      drm/amd/display: Calculate output_color_space after pixel
encoding adjustment
      drm/amd/display: Fix COLOR_SPACE_YCBCR2020_TYPE matrix

Lang Yu (2):
      drm/amdgpu: correct MEC number for gfx11 APUs
      drm/amdgpu: allow multipipe policy on ASICs with one MEC

Matt Atwood (2):
      drm/i915/dg2: Introduce Wa_18018764978
      drm/i915/dg2: Introduce Wa_18019271663

Maxime Ripard (2):
      drm/vc4: bo: Fix drmm_mutex_init memory hog
      drm/vc4: bo: Fix unused variable warning

Nirmoy Das (1):
      drm/i915: Remove unused variable

Rob Clark (1):
      drm/msm/gpu: Fix potential double-free

Sasa Dragic (1):
      drm/i915: re-disable RC6p on Sandy Bridge

Thomas Zimmermann (2):
      drm/i915: Allow switching away via vga-switcheroo if uninitialized
      drm/fb-helper: Set framebuffer for vga-switcheroo clients

hongao (1):
      drm/amd/display: Fix set scaling doesn's work

jie1zhan (1):
      drm/amdgpu: Correct the power calcultion for Renior/Cezanne.

 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c                    |  3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c                    |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c                    | 10 ++++++++--
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c                     | 11 +++++++++-=
-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c          | 14 ++++------=
----
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  1 -
 drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c      |  4 ++--
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c            |  7 ++++++-
 drivers/gpu/drm/drm_fb_helper.c                            |  7 +++++++
 drivers/gpu/drm/i915/display/skl_universal_plane.c         |  2 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c            |  8 ++++----
 drivers/gpu/drm/i915/gt/intel_gt_regs.h                    | 10 +++++++---
 drivers/gpu/drm/i915/gt/intel_workarounds.c                | 10 +++++++++-
 drivers/gpu/drm/i915/i915_driver.c                         |  5 +----
 drivers/gpu/drm/i915/i915_pci.c                            |  3 ++-
 drivers/gpu/drm/i915/i915_switcheroo.c                     |  6 +++++-
 drivers/gpu/drm/msm/adreno/adreno_device.c                 |  5 +++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c                    |  4 ++++
 drivers/gpu/drm/msm/msm_gpu.c                              |  2 ++
 drivers/gpu/drm/msm/msm_gpu.h                              | 12 ++++++++++=
--
 drivers/gpu/drm/panfrost/Kconfig                           |  3 ++-
 drivers/gpu/drm/vc4/vc4_bo.c                               |  6 ++----
 22 files changed, 92 insertions(+), 42 deletions(-)
