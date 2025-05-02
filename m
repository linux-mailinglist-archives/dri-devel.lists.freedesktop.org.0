Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD28AA7AB2
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 22:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CAB10E1C2;
	Fri,  2 May 2025 20:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U7no5qqm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D60710E1C2
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 20:14:03 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5e8be1bdb7bso3511066a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 13:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746216841; x=1746821641; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=IWH1cHDu5KH0pRViPEWRqXxu0kS8sZnFv4Swd/5VeOQ=;
 b=U7no5qqmqZsmjPDqNndOH7BK9qODJPfN4Yx0F+NGId7g2y7cbL0O4D4h3LvktNbft9
 aWB1VkzXL2V4savfVqxZatsNLNvpx4G4/xeIryEm2X74UMlmcNYnSusOk0RvbAKoWeqO
 hdDeKBXjdL5UwKZLWiWw4Y6XZeSiG0WhFp47D7ZWC0CYthmLrChxbP6wPkrlvNgqj9+A
 j8Bg1Rsw/LV19QX+J1c1K2OUzskx0x4GauUOpzPrGswtkzsjTH3cJ1UCOfkyo9wPHs5c
 h4nYN4zNSRI2KnpEWWitBfLFWyJS7IHyJrQPZJVrh8O4woYum7rZz4oXJpjLnAXynp2r
 h/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746216841; x=1746821641;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IWH1cHDu5KH0pRViPEWRqXxu0kS8sZnFv4Swd/5VeOQ=;
 b=nYUDmzsk2ulhr/u2Yur1dM975nAdIz6Do7B5N3yoXYAoj6Fo4GW8buwWgND91ZhuNA
 f9T4y/H3sb1te8n6eyxIof84FdGRDf5K/yjfg1xfFISRwXHaT7i2jLebj15KU0NxNtug
 ZpIyDOVfuvLhF1py6kgoUBTnFawDSc1bgA6DZnvLQZ0B8PrTDVJuBnEwXFjP/r7NM9xe
 P6VkANvS4GDyYzYp+FSrqXxUVzXIp/PpNmmaNI3H1dob4BD6G6C0+UJMPwbs0hgKQjhX
 r28Dp/DENjcqnNb7AW8dqVOAqRt+2pqRMX6gaqc8pusOjDSlR/ZGH++WxQ+0a92AfcJR
 JwNQ==
X-Gm-Message-State: AOJu0YxJYRyMds0yxJ2RsBrwKbcBvL8SQh8HYMujmpjULKbeSP2Ue4zY
 SCFPAAua2e9S0HGE3ni5rlfueTYpPBam2P3Zr1v5jiWH0kFokL7Tch9kGIR45XxN/zQTy4jEiG5
 lijc8B6v5WTGnGQJWlPlAubtS5qI=
X-Gm-Gg: ASbGncv3ZeAr6XrwDdGNghiEcrUZ+BepnulK9dWK5qNOOXJp/QXZVBkgUabVkfOHoln
 My2VLXbrdPlFJJRPVpnvU9L2zn5KZy2iE6Kf4GmpJuTtmALvOitL4bGMl7hRfaiTfFsTRrEUCRf
 cfzm8IX6qWNlsVX8tP1ycb
X-Google-Smtp-Source: AGHT+IH5+b2nYFhvbaa9fGevqTPKYSSF08veZF2/Iy6/VoQIjhbmSs2E8Po24EQl6RMyd/DIQ/jaWoBNICOwyu9amY0=
X-Received: by 2002:a17:907:1c1f:b0:ad1:8e6e:bea8 with SMTP id
 a640c23a62f3a-ad1908373a3mr50877666b.37.1746216841199; Fri, 02 May 2025
 13:14:01 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 3 May 2025 06:13:49 +1000
X-Gm-Features: ATxdqUGs0PnOxmt2B41wQhgJOvIJZ_8jVR5PAqirocl5W192K0P8o4yakp6yjoQ
Message-ID: <CAPM=9txGv4UObO6mWDtU+RLCaswfHPovigKQwuD3XK3BtqF07A@mail.gmail.com>
Subject: [git pull] drm fixes for 6.15-rc5
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
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

Hi Linus,

Weekly drm fixes, amdgpu and xe as usual, the new adp driver has a
bunch of vblank fixes, then a bunch of small fixes across the board.
Seems about the right level for this time in the release cycle.

Regards,
Dave.

drm-fixes-2025-05-03:
drm fixes for 6.15-rc5

ttm:
- docs warning fix

kunit
- fix leak in shmem tests

fdinfo:
- driver unbind race fix

amdgpu:
- Fix possible UAF in HDCP
- XGMI dma-buf fix
- NBIO 7.11 fix
- VCN 5.0.1 fix

xe:
- Eustall locking fix and disabling on VF
- Documentation fix kernel version supporting hwmon entries
- SVM fixes on error handling

i915:
- Fix build for CONFIG_DRM_I915_PXP=n

nouveau:
- fix race condition in fence handling

ivpu:
- interrupt handling fix
- D0i2 test mode fix

adp:
- vblank fixes

mipi-dbi:
- timing fix
The following changes since commit b4432656b36e5cc1d50a1f2dc15357543add530e:

  Linux 6.15-rc4 (2025-04-27 15:19:23 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-05-03

for you to fetch changes up to 4e6de6b8f0d5181fcf546ee98b908372fa3cfc0d:

  Merge tag 'drm-xe-fixes-2025-05-01' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-05-02 14:12:52 +1000)

----------------------------------------------------------------
drm fixes for 6.15-rc5

ttm:
- docs warning fix

kunit
- fix leak in shmem tests

fdinfo:
- driver unbind race fix

amdgpu:
- Fix possible UAF in HDCP
- XGMI dma-buf fix
- NBIO 7.11 fix
- VCN 5.0.1 fix

xe:
- Eustall locking fix and disabling on VF
- Documentation fix kernel version supporting hwmon entries
- SVM fixes on error handling

i915:
- Fix build for CONFIG_DRM_I915_PXP=n

nouveau:
- fix race condition in fence handling

ivpu:
- interrupt handling fix
- D0i2 test mode fix

adp:
- vblank fixes

mipi-dbi:
- timing fix

----------------------------------------------------------------
Andrzej Kacprowski (1):
      accel/ivpu: Fix the D0i2 disable test mode

Chen Linxuan (1):
      drm/i915/pxp: fix undefined reference to
`intel_pxp_gsccs_is_ready_for_sessions'

Chris Bainbridge (1):
      drm/amd/display: Fix slab-use-after-free in hdcp

Dafna Hirschfeld (1):
      drm/gpusvm: set has_dma_mapping inside mapping loop

Dave Airlie (4):
      Merge tag 'drm-misc-fixes-2025-04-30' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2025-04-30' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.15-2025-05-01' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-xe-fixes-2025-05-01' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Felix Kuehling (1):
      drm/amdgpu: Fail DMABUF map of XGMI-accessible memory

Harish Chegondi (2):
      drm/xe/eustall: Resolve a possible circular locking dependency
      drm/xe/eustall: Do not support EU stall on SRIOV VF

Harshit Mogalapalli (1):
      drm/xe/svm: fix dereferencing error pointer in drm_gpusvm_range_alloc()

Janne Grunau (5):
      drm: adp: Use spin_lock_irqsave for drm device event_lock
      drm: adp: Handle drm_crtc_vblank_get() errors
      drm: adp: Enable vblank interrupts in crtc's .atomic_enable
      drm: adp: Remove pointless irq_lock spin lock
      drm: Select DRM_KMS_HELPER from DRM_DEBUG_DP_MST_TOPOLOGY_REFS

John Harrison (1):
      drm/xe/guc: Fix capture of steering registers

Karol Wachowski (1):
      accel/ivpu: Correct DCT interrupt handling

Lijo Lazar (1):
      drm/amdgpu: Fix offset for HDP remap in nbio v7.11

Lucas De Marchi (1):
      drm/xe/hwmon: Fix kernel version documentation for temperature

Maxime Ripard (1):
      drm/tests: shmem: Fix memleak

Philipp Stanner (1):
      drm/nouveau: Fix WARN_ON in nouveau_fence_context_kill()

Russell Cloran (1):
      drm/mipi-dbi: Fix blanking for non-16 bit formats

Sonny Jiang (1):
      drm/amdgpu: Add DPG pause for VCN v5.0.1

Sunil Khatri (1):
      drm/ttm: fix the warning for hit_low and evict_low

Tvrtko Ursulin (1):
      drm/fdinfo: Protect against driver unbind

 .../ABI/testing/sysfs-driver-intel-xe-hwmon        |  4 +-
 drivers/accel/ivpu/ivpu_fw.c                       |  4 +-
 drivers/accel/ivpu/ivpu_hw_btrs.h                  |  2 +-
 drivers/accel/ivpu/ivpu_pm.c                       | 18 ++++----
 drivers/gpu/drm/Kconfig                            |  2 +-
 drivers/gpu/drm/adp/adp_drv.c                      | 27 +++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |  5 ++
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            | 54 ++++++++++++++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c | 19 ++++++--
 drivers/gpu/drm/drm_file.c                         |  6 +++
 drivers/gpu/drm/drm_gpusvm.c                       |  2 +-
 drivers/gpu/drm/drm_mipi_dbi.c                     |  6 ++-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h         |  8 +++-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |  2 +-
 drivers/gpu/drm/tests/drm_gem_shmem_test.c         |  3 ++
 drivers/gpu/drm/ttm/ttm_bo.c                       |  3 +-
 drivers/gpu/drm/xe/xe_eu_stall.c                   | 14 +++++-
 drivers/gpu/drm/xe/xe_eu_stall.h                   |  3 +-
 drivers/gpu/drm/xe/xe_guc_capture.c                |  2 +-
 drivers/gpu/drm/xe/xe_svm.c                        |  2 +-
 21 files changed, 146 insertions(+), 42 deletions(-)
