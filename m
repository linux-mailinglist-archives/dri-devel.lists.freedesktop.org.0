Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 524F3B1793D
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 01:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F3410E2C7;
	Thu, 31 Jul 2025 23:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iry7ZqQ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD8010E2C7
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 23:05:20 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-af8ffa04463so46251966b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 16:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754003119; x=1754607919; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Nl4NbPVd+NNf+u5SeidN/gG+qLoaVuZAjBLn9hC2Fi0=;
 b=iry7ZqQ9/ze6uCXz1qlibZsHqHBct6iYm4uqFoEPA/PubaSByOHYDYizzofEMSMmOs
 D5XUN79qV5wQ++rb/Dv4KCf6L7jZdGwyNLldUoyUMcDFELLAQZ1XHXhi90N5M9BuTiz/
 d5xF40A9uhDclbXVpZjt/C1WON6+AtS7Xht5kf9+78a11xZikHSMzaSQ4f03+f+zTEjZ
 qKMlVuJF7ZtizwPX/L+13Lqjkw71zcbcZXuLsfPYG5lucJ6BZ+T771zzTYL9GGIngWTY
 XroaONQ+Jt45I3u4eWCpeZujRcwE8/9voq3/6QZ0GGdRzuWM8JuCs0opG6D6Bpkc8HBg
 a8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754003119; x=1754607919;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nl4NbPVd+NNf+u5SeidN/gG+qLoaVuZAjBLn9hC2Fi0=;
 b=cgewTNy6tvKEgrUU6buwfOu5NgdwAzf4vU+QVU8OxPgKwST3en+c6e8iqhwAU6pit3
 1I2KswKHnMxg9+9wu1uteuS4loMXC2z0NOt5ig9tLTkClkRfvj9KQ9ak5hSOv5AAlUhg
 nMrPWK1ih6fM2FCMz8VEHSaf49mEyNDq8UUGhrxqD2E+zIyIQ82iXg/06QVnr0V09UCQ
 2xqxfruOwqSjzWaIR9DZMrRJG6dYivdozHsndUKHOI/aEhdq1fXg7DZalUhwyVpwmyjb
 oiCkFZnc72shBakJxaTGDOcQpPaZi3wliiggJ+QdaJu2BAoI1R8iUp1gZoSdXdrC3DRS
 aCKg==
X-Gm-Message-State: AOJu0Yy6sK7w2LQ+Ji+0QNlsH52sZ8hasnZAIbQTFk5vP7WwFF6vmE2j
 E/y+FjK5HHyCjMK8Yc6iEW/GSXXiiZ4nMDilwkief5hhBe8WAO1ARqD4bUrs6gFiFHG317YKfNG
 aozsyy8fj3Z45Uj9SlVn23rjAV2bQ2/Y=
X-Gm-Gg: ASbGnctrRG6wKYhhjOxa5gb9zpRKUgCJ+AaoKsscBzIWkyGdf3ltW35aTz2U0/ROQzg
 Acv5uVH7qSGFjiy1jOkGHeQLL/iqGWQQmVnIoMmsPpYm54X6CbfIPAVkOr9LDSwi47XV7A5pGFC
 frgB+lgnD482COooNf94H9qMubDKRsMpIhPUx+uJhFdpVrOBpC29NhXVPU/dL5xH86Qvum1o+3R
 JPUJEFv+3NQu72hvnokSpeb1tipath06OZdQUWe5bmDV2TG2g==
X-Google-Smtp-Source: AGHT+IG2EPrRFEvuffrWgcTEueq+xlLXsUddLPK7dBDblnaf7RNtAg2x/iRfKZFI+JgGHMDq4I5RxRRMWfulZVBXQ1E=
X-Received: by 2002:a17:906:6a18:b0:af9:3341:8dd with SMTP id
 a640c23a62f3a-af933413ce5mr29098566b.31.1754003118910; Thu, 31 Jul 2025
 16:05:18 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 1 Aug 2025 09:05:07 +1000
X-Gm-Features: Ac12FXzYSSUx_DR0oQGRrzUbfDO7jlTV1z6QKC-g4IH-MBsIe24fxN8xWapYCG4
Message-ID: <CAPM=9twBSSdGXPYQMTz9yWqKg=8RNpAXui4Uf=BvB60mUiZqfw@mail.gmail.com>
Subject: [git pull] drm fixes for 6.17-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
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

I'm sending these out because it has the DSC fix in it, there was also
a set of xe fixes in the queue, so may as well send those out as well.

Just a bunch of amdgpu and xe fixes, let me know if anything else shows up,

Dave.

drm-next-2025-08-01:
drm fixes for 6.17-rc1

amdgpu:
- DSC divide by 0 fix
- clang fix
- DC debugfs fix
- Userq fixes
- Avoid extra evict-restore with KFD
- Backlight fix
- Documentation fix
- RAS fix
- Add new kicker handling
- DSC fix for DCN 3.1.4
- PSR fix
- Atomic fix
- DC reset fixes
- DCN 3.0.1 fix
- MMHUB client mapping fix

xe:
- Fix BMG probe on unsupported mailbox command
- Fix OA static checker warning about null gt
- Fix a NULL vs IS_ERR() bug in xe_i2c_register_adapter
- Fix missing unwind goto in GuC/HuC
- Don't register I2C devices if VF
- Clear whole GuC g2h_fence during initialization
- Avoid call kfree for drmm_kzalloc
- Fix pci_dev reference leak on configfs
- SRIOV: Disable CSC support on VF
The following changes since commit 711fa2667d8b230ff31f1855d0f25e3263268d8a:

  Merge tag 'drm-misc-next-fixes-2025-07-24' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
(2025-07-29 16:53:20 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-08-01

for you to fetch changes up to 6531a2cf07ef156956840853692755cc7e1621b7:

  Merge tag 'drm-xe-next-fixes-2025-07-31' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2025-08-01
07:09:16 +1000)

----------------------------------------------------------------
drm fixes for 6.17-rc1

amdgpu:
- DSC divide by 0 fix
- clang fix
- DC debugfs fix
- Userq fixes
- Avoid extra evict-restore with KFD
- Backlight fix
- Documentation fix
- RAS fix
- Add new kicker handling
- DSC fix for DCN 3.1.4
- PSR fix
- Atomic fix
- DC reset fixes
- DCN 3.0.1 fix
- MMHUB client mapping fix

xe:
- Fix BMG probe on unsupported mailbox command
- Fix OA static checker warning about null gt
- Fix a NULL vs IS_ERR() bug in xe_i2c_register_adapter
- Fix missing unwind goto in GuC/HuC
- Don't register I2C devices if VF
- Clear whole GuC g2h_fence during initialization
- Avoid call kfree for drmm_kzalloc
- Fix pci_dev reference leak on configfs
- SRIOV: Disable CSC support on VF

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu: track whether a queue is a kernel queue in amdgpu_mqd_prop
      drm/amdgpu: update mmhub 4.1.0 client id mappings

Ashutosh Dixit (1):
      drm/xe/oa: Fix static checker warning about null gt

Dan Carpenter (1):
      drm/xe: Fix a NULL vs IS_ERR() bug in xe_i2c_register_adapter()

Dave Airlie (2):
      Merge tag 'amd-drm-fixes-6.17-2025-07-31' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-xe-next-fixes-2025-07-31' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next

Dillon Varone (1):
      drm/amd/display: Fix divide by zero when calculating min ODM factor

Frank Min (1):
      drm/amdgpu: add kicker fws loading for gfx12/smu14/psp14

Gang Ba (1):
      drm/amdgpu: Avoid extra evict-restore process.

Ivan Lipski (1):
      drm/amd/display: Allow DCN301 to clear update flags

Lauri Tirkkonen (1):
      drm/amd/display: fix initial backlight brightness calculation

Lukasz Laguna (2):
      drm/xe/vf: Don't register I2C devices if VF
      drm/xe/vf: Disable CSC support on VF

Mario Limonciello (3):
      drm/amd/display: Avoid configuring PSR granularity if PSR-SU not supported
      drm/amd/display: Only finalize atomic_obj if it was initialized
      drm/amd/display: Pass up errors for reset GPU that fails to init HW

Michal Wajdeczko (2):
      drm/xe/guc: Clear whole g2h_fence during initialization
      drm/xe/configfs: Fix pci_dev reference leak

Nathan Chancellor (1):
      drm/amdgpu: Initialize data to NULL in imu_v12_0_program_rlc_ram()

Peter Shkenev (1):
      drm/amdgpu: check if hubbub is NULL in debugfs/amdgpu_dm_capabilities

Raag Jadav (1):
      drm/xe: Don't fail probe on unsupported mailbox command

Roman Li (1):
      drm/amd/display: Disable dsc_power_gate for dcn314 by default

Shuicheng Lin (1):
      drm/xe/hw_engine_group: Avoid call kfree() for drmm_kzalloc()

Srinivasan Shanmugam (1):
      drm/amd/display: Fix misuse of /** to /* in 'dce_i2c_hw.c'

Yang Wang (1):
      drm/amd/amdgpu: fix missing lock for cper.ring->rptr/wptr access

Zhanjun Dong (1):
      drm/xe/uc: Fix missing unwind goto

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c           |  8 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  6 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             | 14 ++++++---
 drivers/gpu/drm/amd/amdgpu/imu_v12_0.c             | 13 ++++++---
 drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c          | 34 +++++++++-------------
 drivers/gpu/drm/amd/amdgpu/psp_v14_0.c             |  2 ++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 11 ++++---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |  6 ++--
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  3 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c    |  8 ++++-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        | 29 +++++++++---------
 .../display/dc/resource/dcn314/dcn314_resource.c   |  1 +
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     | 11 +++++--
 drivers/gpu/drm/xe/xe_configfs.c                   |  3 +-
 drivers/gpu/drm/xe/xe_device.c                     |  1 +
 drivers/gpu/drm/xe/xe_device_sysfs.c               |  7 ++++-
 drivers/gpu/drm/xe/xe_guc_ct.c                     |  6 +---
 drivers/gpu/drm/xe/xe_hw_engine_group.c            | 28 ++++--------------
 drivers/gpu/drm/xe/xe_i2c.c                        |  7 +++--
 drivers/gpu/drm/xe/xe_oa.c                         |  2 +-
 drivers/gpu/drm/xe/xe_uc.c                         |  2 +-
 25 files changed, 112 insertions(+), 95 deletions(-)
