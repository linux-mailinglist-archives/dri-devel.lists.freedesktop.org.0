Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B0BD3880A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 21:56:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6A410E93D;
	Fri, 16 Jan 2026 20:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Oy7md8OT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A9D10E93D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 20:56:01 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id
 4fb4d7f45d1cf-64bea6c5819so4181940a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 12:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1768596960; x=1769201760; darn=lists.freedesktop.org; 
 h=content-disposition:mime-version:mail-followup-to:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8l6bF8VxQIJbr4jHnLKCpr3u0k50ekTMa10uEgswMOo=;
 b=Oy7md8OTrqhkcDGcd1lycIDeEatuCZgL4bNYjCx6cXy8XEuOKXooWHLRGUvd3sa1Xq
 OUzdZYb+VsI0D4nQietoGcSzMNLJQ6nmsm+ZZSPFl9JMi6Z+FbqntqsoqvD2EjaPIm8M
 7NFXX2eiXe/nii68IxSmvFmj0tFlHvrHJuDxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768596960; x=1769201760;
 h=content-disposition:mime-version:mail-followup-to:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8l6bF8VxQIJbr4jHnLKCpr3u0k50ekTMa10uEgswMOo=;
 b=acq1CvsMyqFx9Lh3fkf6fqH/zR4kXqWZL4xNZufAlTgaC6Z2QHohTOS40SlIu0KW6M
 MP/kDsW2b6KRAkTqNiUM2f0vqGWIr2Ik3cUSdufssblPBIdq6vIhe5GqUHCtawOWti52
 msQ3mByJz49TjnWJmjIiwWPwu9643jehS5nHhV8ATm0ZvCW29tAVkM8pM5BX1dw+hBaS
 ak0yg/DhmPSdh2MKpR9834w+VVBfc8JroRmgjkCKshSOhpw5oHZNWQjzb8+nscY5/3sw
 hqS5Cl1FioIRd34D7B2/qjLpU2sAIAZs9m5sXIZMPf0RbfVdhK64KbhRS21dlSpoJIQH
 nHFg==
X-Gm-Message-State: AOJu0Yy+a1KdJxLK2VOWJSlUbhI6x72Q/JsLJXJXlR/GylPmyksUgEY0
 2ADki1MCtWu1b5C9YDOhvOH81y2TPUyawNZ/Va5gOO3va/3wNlAtDUmWPpKqiiCEEM6+5Uu7Lat
 bd9ebr4rUbQ==
X-Gm-Gg: AY/fxX7L9MHUBG/qwZz1gQjyoQZLqME+eKicLKfh8Atfi/ibbdzeeYWOc/9+6NO4nvr
 iQWnOlDDp7XaQFUa0zssEix9eWL4TM106hneO08BOBx4TJBsibAJWvFCBeHbijPvSGtwpaUn5nS
 2drdmOcAwDG0NRw40kP+mGdcsWfwegC7FuNmcI0S/cCKc+3470mZkZg9TXdAwqD8rej6G/cQfZO
 18HQB4iwE3oe6IVTnwN2SX8bTjDdWvOOl5PGhRwgUC5VNcttLNrCHpW324iIQAKy8D5YYgZ2lUh
 oMMIqPAVxtgvsZfA8Zpd5zdRLd1Qzw8pu79c6WJymvOrC3FNcyb9+wqY8Aq1tLDL4UYGxYdPTkw
 s+6kYrGRkvWuPfpl2RukvoH/MJ/H5E6fT/O8uoPxzjfL1r86H9CsVMy97xXA7DoMwC5IucRaX5l
 xk1KrONn10vfX14raZGsBZOLo=
X-Received: by 2002:a05:6402:26cb:b0:653:e391:6f34 with SMTP id
 4fb4d7f45d1cf-65452bcc0damr3072360a12.23.1768596958655; 
 Fri, 16 Jan 2026 12:55:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65452bce213sm3368155a12.2.2026.01.16.12.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 12:55:58 -0800 (PST)
Date: Fri, 16 Jan 2026 21:55:56 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Dave Airlie <airlied@gmail.com>
Subject: [PULL] drm-fixes for 6.19-rc6
Message-ID: <aWql3MQyfEsKAqPT@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Dave Airlie <airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Operating-System: Linux phenom 6.17.10+deb14-amd64 
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

We've had nothing aside of a compiler noise fix until today, when the amd
and drm-misc fixes PRs showed up after Dave already went into w/e mode. So
it's on me to push these out, since there's a bunch of important fixes in
here I think that shouldn't be delayed for a week.

drm-fixes-2026-01-16:
drm-fixes for 6.19-rc6

Core Changes:
- take gem lock when preallocating in gpuvm.
- add single byte read fallback to dp for broken usb-c adapters
- remove duplicate drm_sysfb declarations

Driver Changes:
- i915: compiler noise fix
- amdgpu/amdkfd: pile of fixes all over
- vmwgfx: v10 cursor regression fix, other fixes
- rockchip: waiting for cfgdone regression fix, other fixes
- gud: fix oops on disconnect
- simple-panel: regression fix when connector is not set, fix for
  DataImage SCF0700C48GGU18
- nouveau: cursor handling locking fix

Cheers, Sima

The following changes since commit 0f61b1860cc3f52aef9036d7235ed1f017632193:

  Linux 6.19-rc5 (2026-01-11 17:03:14 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-01-16

for you to fetch changes up to 9dd1f5f3eb8cb175e2f7fd2a685bdb6b1bd2a726:

  Merge tag 'drm-misc-fixes-2026-01-16' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes (2026-01-16 20:27:21 +0100)

----------------------------------------------------------------
drm-fixes for 6.19-rc6

Core Changes:
- take gem lock when preallocating in gpuvm.
- add single byte read fallback to dp for broken usb-c adapters
- remove duplicate drm_sysfb declarations

Driver Changes:
- i915: compiler noise fix
- amdgpu/amdkfd: pile of fixes all over
- vmwgfx: v10 cursor regression fix, other fixes
- rockchip: waiting for cfgdone regression fix, other fixes
- gud: fix oops on disconnect
- simple-panel: regression fix when connector is not set, fix for
  DataImage SCF0700C48GGU18
- nouveau: cursor handling locking fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: make sure userqs are enabled in userq IOCTLs

Alice Ryhl (1):
      drm/gpuvm: take GEM lock inside drm_gpuvm_bo_obtain_prealloc()

Andy Yan (2):
      drm/rockchip: vop2: Add delay between poll registers
      drm/rockchip: vop2: Only wait for changed layer cfg done when there is pending cfgdone bits

Bartlomiej Kubik (1):
      drm/vmwgfx: Fix kernel-doc warnings for vmwgfx_fence

Ben Dooks (1):
      drm/i915/guc: make 'guc_hw_reg_state' static as it isn't exported

Chia-Lin Kao (AceLan) (1):
      drm/dp: Add byte-by-byte fallback for broken USB-C adapters

Cristian Ciocaltea (1):
      drm/rockchip: dw_hdmi_qp: Switch to gpiod_set_value_cansleep()

Dave Airlie (1):
      Merge tag 'drm-intel-fixes-2026-01-15' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes

Haoxiang Li (2):
      drm/vmwgfx: Fix an error return check in vmw_compat_shader_add()
      drm/amdkfd: fix a memory leak in device_queue_manager_init()

Harish Kasiviswanathan (1):
      drm/amdkfd: No need to suspend whole MES to evict process

Ian Forbes (2):
      drm/vmwgfx: Fix KMS with 3D on HW version 10
      drm/vmwgfx: Merge vmw_bo_release and vmw_bo_free functions

Ivan Lipski (1):
      drm/amd/display: Add an hdmi_hpd_debounce_delay_ms module

Lu Yao (1):
      drm/amdgpu: fix drm panic null pointer when driver not support atomic

Ludovic Desroches (1):
      drm/panel: simple: restore connector_type fallback

Lyude Paul (2):
      drm/nouveau/disp/nv50-: Set lock_core in curs507a_prepare
      drm/nouveau/kms/nv50-: Assert we hold nv50_disp->lock in nv50_head_flush_*

Marek Vasut (1):
      drm/panel-simple: fix connector type for DataImage SCF0700C48GGU18 panel

Mario Limonciello (1):
      drm/amd/display: Bump the HDMI clock to 340MHz

Mario Limonciello (AMD) (2):
      drm/amd: Clean up kfd node on surprise disconnect
      drm/amd/display: Show link name in PSR status message

Peter Colberg (1):
      Revert duplicate "drm/amdgpu: disable peer-to-peer access for DCC-enabled GC12 VRAM surfaces"

Philip Yang (1):
      drm/amdgpu: Fix gfx9 update PTE mtype flag

Prike Liang (2):
      drm/amdgpu: validate the flush_gpu_tlb_pasid()
      Revert "drm/amdgpu: don't attach the tlb fence for SI"

Sebastian Reichel (1):
      drm/bridge: dw-hdmi-qp: Fix spurious IRQ on resume

Shenghao Yang (1):
      drm/gud: fix NULL fb and crtc dereferences on USB disconnect

Simona Vetter (2):
      Merge tag 'amd-drm-fixes-6.19-2026-01-15' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2026-01-16' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes

Srinivasan Shanmugam (1):
      drm/amdgpu/userq: Fix fence reference leak on queue teardown v2

Thomas Zimmermann (1):
      drm/sysfb: Remove duplicate declarations

Vivek Das Mohapatra (1):
      drm/amd/display: Initialise backlight level values from hw

Xiaogang Chen (1):
      drm/amdgpu: Use correct address to setup gart page table for vram access

Yang Wang (1):
      drm/amd/pm: fix smu overdrive data type wrong issue on smu 14.0.2

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   8 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |  12 ---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  11 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |  16 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |   8 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   8 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  31 +++---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  36 ++++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   5 +-
 drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h     |   2 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |   4 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |   3 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |   9 ++
 drivers/gpu/drm/drm_gpuvm.c                        |  75 +++++++++-----
 drivers/gpu/drm/gud/gud_pipe.c                     |  20 ++--
 drivers/gpu/drm/i915/i915_gpu_error.c              |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c        |   1 +
 drivers/gpu/drm/nouveau/dispnv50/head.c            |   5 +
 drivers/gpu/drm/panel/panel-simple.c               | 110 ++++++++++-----------
 drivers/gpu/drm/panthor/panthor_mmu.c              |  10 --
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     |  14 ++-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |  17 +++-
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h           |   9 --
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |  22 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c              |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |  14 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c             |   4 +-
 include/drm/bridge/dw_hdmi_qp.h                    |   1 +
 include/drm/display/drm_dp_helper.h                |  57 +++++++----
 35 files changed, 333 insertions(+), 213 deletions(-)

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
