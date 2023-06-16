Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C11733ADD
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 22:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C4A10E684;
	Fri, 16 Jun 2023 20:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCD210E684
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 20:29:46 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-970028cfb6cso165501566b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 13:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686947384; x=1689539384;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lAJJYNFFc8IT/vHtC2ZjekUTu3gsWCsBhPsAUbzPFWA=;
 b=WvGfMjGQTQBc4JJ91CKVIaX/k58ocqaW26UdALAee0U7J6ETejHVniNgmOJW5yx/n/
 9nJaJ+Atq2a7ZbJStMKExIl8lxl7YTDVFYVO95J3KWRhTPh4xrJBI/0HShIQkR/bQFna
 RDAdXkK2QJbx5VlU0H4jGoEjIkobuIaMUh5lI/EMpPXmkbDyH/j0wi4rzJhv4Ztp140e
 b+xKkPcj5fYet2si5mczTPivZzPjKaHRUDYPbgPjmIVZz0FfI4PgyY5T943m6udCZrHX
 R2MDo9ydZP/G5sj/de7fARszLkvG9j1lcFtWXE7ti+Ngv5/UWc+pikE6RVMUAFrG3TeW
 Y4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686947384; x=1689539384;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lAJJYNFFc8IT/vHtC2ZjekUTu3gsWCsBhPsAUbzPFWA=;
 b=AeZ7huCtgxxO1O8rD8yergNUN8E+6cIcniD45lNvNXRmkA1ZbClaHY+JsXgjf4anGb
 NgKawdk2OCTn5rxEbR3963CIaX3tXPIyNv8+8eeArNBZS9O0/trBB5TfsCN52R7lFat5
 QfgtQEATQQdpxIr/yeF+gAyfqC1otOXQaYm8ClFKHFbIYvgOSDn7C2beX6X4BWLw27PX
 QMRatR+gzEfzL5xow3Zn1cj1mp7m81hZyKEtfcPZ9aHFuVbnJ3TnwBA8KHU1pS5m3Dl5
 DmPJoIopA93QDsRqZVQyK6yu4Fv1L03robPbmQlc0yMJ1wErQAzEoHEaJzL2erjD/wHD
 p3rQ==
X-Gm-Message-State: AC+VfDy1817W8h67YrTH+ehE9mcnKgZ1QGKJIwEfrTbZHR+leqZ1EJ2M
 93OwvZqOONe777zyggopPhiQRTP78JaW+0bEuSQ=
X-Google-Smtp-Source: ACHHUZ6mZ+wKwqXLlQHDwPWYNpOJslTTh49rtVaJrzkNfIXoGuZ6g04DxonTKWVfDs1N+/qeypFhIsBmNRHxs9c1bGM=
X-Received: by 2002:a17:907:320d:b0:974:1c90:b3d3 with SMTP id
 xg13-20020a170907320d00b009741c90b3d3mr2766774ejb.12.1686947383936; Fri, 16
 Jun 2023 13:29:43 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 17 Jun 2023 06:29:31 +1000
Message-ID: <CAPM=9txbkXVgrbDbqezqBVLVXdBx4+iwfJPTVWLzWuGtDsTT_w@mail.gmail.com>
Subject: [git pull] drm fixes for 6.4-rc7
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Bunch of misc fixes across the board, amdgpu is the usual bulk with a
revert and other fixes, nouveau has a race fix that was causing a UAF
that was hard hanging systems, otherwise some qaic, bridge and radeon.

Dave.

drm-fixes-2023-06-17:
drm fixes for 6.4-rc7

amdgpu:
- GFX9 preemption fixes
- Add missing radeon secondary PCI ID
- vblflash fixes
- SMU 13 fix
- VCN 4.0 fix
- Re-enable TOPDOWN flag for large BAR systems to fix regression
- eDP fix
- PSR hang fix
- DPIA fix

radeon:
- fbdev client warning fix

qaic:
- leak fix
- null ptr deref fix

nouveau:
- use-after-free caused by fence race fix
- runtime pm fix
- NULL ptr checks

bridge:
- ti-sn65dsi86: Avoid possible buffer overflow
The following changes since commit 858fd168a95c5b9669aac8db6c14a9aeab446375:

  Linux 6.4-rc6 (2023-06-11 14:35:30 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-06-17

for you to fetch changes up to 9930f518b6a82ff10a3d13e0cbde05cce04f5930:

  Merge tag 'drm-misc-fixes-2023-06-16' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2023-06-17
06:11:59 +1000)

----------------------------------------------------------------
drm fixes for 6.4-rc7

amdgpu:
- GFX9 preemption fixes
- Add missing radeon secondary PCI ID
- vblflash fixes
- SMU 13 fix
- VCN 4.0 fix
- Re-enable TOPDOWN flag for large BAR systems to fix regression
- eDP fix
- PSR hang fix
- DPIA fix

radeon:
- fbdev client warning fix

qaic:
- leak fix
- null ptr deref fix

nouveau:
- use-after-free caused by fence race fix
- runtime pm fix
- NULL ptr checks

bridge:
- ti-sn65dsi86: Avoid possible buffer overflow

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: add missing radeon secondary PCI ID

Arunpravin Paneer Selvam (1):
      Revert "drm/amdgpu: remove TOPDOWN flags when allocating VRAM in
large bar system"

Carl Vanderlip (1):
      accel/qaic: Free user handle on interrupted mutex

Dave Airlie (3):
      Merge tag 'amd-drm-fixes-6.4-2023-06-14' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      nouveau: fix client work fence deletion race
      Merge tag 'drm-misc-fixes-2023-06-16' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Hersen Wu (1):
      drm/amd/display: edp do not add non-edid timings

Jeffrey Hugo (1):
      accel/qaic: Fix NULL pointer deref in qaic_destroy_drm_device()

Jiadong Zhu (4):
      drm/amdgpu: Reset CP_VMID_PREEMPT after trailing fence signaled
      drm/amdgpu: Program gds backup address as zero if no gds allocated
      drm/amdgpu: Modify indirect buffer packages for resubmission
      drm/amdgpu: Implement gfx9 patch functions for resubmission

Kenneth Feng (1):
      drm/amd/pm: workaround for compute workload type on some skus

Mario Limonciello (2):
      drm/amd: Make sure image is written to trigger VBIOS image update flow
      drm/amd: Tighten permissions on VBIOS flashing attributes

Natalia Petrova (2):
      drm/nouveau/dp: check for NULL nv_connector->native_mode
      drm/nouveau: add nv_encoder pointer check for NULL

Peichen Huang (1):
      drm/amd/display: limit DPIA link rate to HBR3

Ratchanan Srirattanamet (1):
      drm/nouveau: don't detect DSM for non-NVIDIA device

Sonny Jiang (1):
      drm/amdgpu: vcn_4_0 set instance 0 init sched score to 1

Su Hui (1):
      drm/bridge: ti-sn65dsi86: Avoid possible buffer overflow

Thomas Zimmermann (1):
      drm/radeon: Disable outputs when releasing fbdev client

Tom Chung (1):
      drm/amd/display: fix the system hang while disable PSR

 drivers/accel/qaic/qaic_drv.c                      |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  18 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   9 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c       |  60 ++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.h       |  15 +++
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              | 101 +++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   6 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  18 +++-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |   5 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  33 ++++++-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   4 +
 drivers/gpu/drm/nouveau/nouveau_acpi.c             |   3 +
 drivers/gpu/drm/nouveau/nouveau_connector.c        |   7 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |  14 ++-
 drivers/gpu/drm/radeon/radeon_fbdev.c              |   1 +
 18 files changed, 281 insertions(+), 27 deletions(-)
