Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6A3B0A0C2
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 12:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92DF10E940;
	Fri, 18 Jul 2025 10:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LIXgbOrw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F155110E940
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 10:34:02 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-60707b740a6so2644521a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 03:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752834841; x=1753439641; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2qBzQmRBIh3BDUW1vW6d6WLsqLJRkox9K+h2IOJ36Pw=;
 b=LIXgbOrwGZ+Cri1/zWZA5i99Cm527m30/XHNKfHTz7AZDEYCN9U5xZhWDKnXnQfF5U
 O5soZrAnHg2ATJE2+riBtKJjY3Ts2Zz4TvkN0pBEXpqhOdPNtEAVFGpC9kQZiW1Ioxcu
 2xpsg1jsjkjxEBisV+wWhCNb7x0EB//vYJ0EChqPZ+BoMep5tTOoLMiUBpm+A60Rcd/z
 Wa3ed0zaAVN+/pD/1JWvX4BCBCek4Kh19ZdHECGvD9o39snsGVdOU0q8VM2wVgaNqM40
 gYq5wbFNBfLgtLwDR6bgjZfhNOynGz0dRefrnXde+UTrfBU7Toz6FTvmljqf+XZPqOuD
 ZcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752834841; x=1753439641;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2qBzQmRBIh3BDUW1vW6d6WLsqLJRkox9K+h2IOJ36Pw=;
 b=G8MD78RCqmbKRYbmm1+c3CdsZ2ehanbnrAtJ0qqGOVoDuytQkYyuD735QgetGc6Tep
 zmlQmY4FQ3oUyMdMdtU3mXcUPyYyuiCWta0vZwl0XzXLSmeRSOwnfhm3jlHVHDNyQv27
 7gBvJlJ+QlRC6iTSTakp6GebGslNcA8nl6jjAs/aq7ur1jiu0MHNCGEUwDfXl89+a9/T
 F/ltTpjCNFSYdQoP1vD/7vn9P0B7Gx299tYygjwrSERRViKuZzlKia9sgbdTW953wyAS
 ktuBQ/M18sBlsxAuX7MdLfhC0EQkyAnmHyM7EMQb+AUVG5eo2ZbPTRb5aagv5YWMed7S
 5P3A==
X-Gm-Message-State: AOJu0YwZWs2qOiZliKvkovFiN3sGmpfJ1PrqvA75rVwYdPwDPVwF8uR+
 T+7bLDPYukKsJo7d5Gp9xS7wKF4Z31Mhfzer5CH6DIzitdYHsxKE89rOrKj4HYsaEo9Afw+nNmt
 4n5Cp6fwPdOTcmAKnOOrGI3CVx07oiaY=
X-Gm-Gg: ASbGncvtNJO/FGySywIkyizLMQfmB0UFEY/Si09M1ppuoMR9e4U1gECgyaBO28AlBY1
 6prvat+YyryaooqVYsv/ynsydlB7YI4OKWUyDZpv9ijMVW71lrnta7uRxj3fCjpz7uWv8j6XmR5
 d1tqC3PxvJfpXrSjyObqPuzt/7jKh+KjpyyP88HMbfYXFWjJED7Dq+Fqa2NFtNOoW8Q7lQ/6QcN
 XIGOA==
X-Google-Smtp-Source: AGHT+IG2UzroybGbjxMAlDl+usjSPFuJ7OORDuvOW1+VPzbf93etkJSI7Wt8vOuBB4n18PT3HeNRfnA/8mQpbZ7TJ1A=
X-Received: by 2002:a17:907:3e9c:b0:ae3:c968:370 with SMTP id
 a640c23a62f3a-ae9ce1e8c11mr801676266b.59.1752834841039; Fri, 18 Jul 2025
 03:34:01 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 18 Jul 2025 20:33:49 +1000
X-Gm-Features: Ac12FXxPoz0a_9s4aNvXMBUDtxzj332uUJx2lcLhSuVeOysV_Ak0Yc-0WKNLnIg
Message-ID: <CAPM=9tzJPpV89V934YdOO=i1gEVwx9NOMV+w8+hqRgDLk+6L+A@mail.gmail.com>
Subject: [git pull] drm fixes for 6.16-rc7
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

Thanks to Simona for taking over the fixes duties last week, it seems
like I missed a fun week of regression hunting!

Seems like a quiet enough week, xe/amdgpu being the usual suspects,
then mediatek with a few fixes, and otherwise just misc other bits.

Dave.

drm-fixes-2025-07-18-1:
drm fixes for 6.16-rc7

dp:
- aux dpcd address fix

xe:
- SR-IOV fixes for GT reset and TLB invalidation
- Fix memory copy direction during migration
- Fix alignment check on migration
- Fix MOCS and page fault init order to correctly
  account for topology

amdgpu:
- Fix a DC memory leak
- DCN 4.0.1 degamma LUT fix
- Fix reset counter handling for soft recovery
- GC 8 fix

radeon:
- Drop console locks when suspending/resuming

nouveau:
- ioctl validation fix

panfrost:
- scheduler bug fix

mediatek:
- Add wait_event_timeout when disabling plane
- only announce AFBC if really supported
- mtk_dpi: Reorder output formats on MT8195/88
The following changes since commit 347e9f5043c89695b01e66b3ed111755afcf1911:

  Linux 6.16-rc6 (2025-07-13 14:25:58 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-07-18-1

for you to fetch changes up to 4d33ed640ffc06734271cebda5ac2e3b5a79f453:

  Merge tag 'drm-xe-fixes-2025-07-17' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-07-18 14:04:06 +1000)

----------------------------------------------------------------
drm fixes for 6.16-rc7

dp:
- aux dpcd address fix

xe:
- SR-IOV fixes for GT reset and TLB invalidation
- Fix memory copy direction during migration
- Fix alignment check on migration
- Fix MOCS and page fault init order to correctly
  account for topology

amdgpu:
- Fix a DC memory leak
- DCN 4.0.1 degamma LUT fix
- Fix reset counter handling for soft recovery
- GC 8 fix

radeon:
- Drop console locks when suspending/resuming

nouveau:
- ioctl validation fix

panfrost:
- scheduler bug fix

mediatek:
- Add wait_event_timeout when disabling plane
- only announce AFBC if really supported
- mtk_dpi: Reorder output formats on MT8195/88

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/nouveau: check ioctl command codes better

Balasubramani Vivekanandan (1):
      drm/xe/mocs: Initialize MOCS index early

Clayton King (1):
      drm/amd/display: Free memory allocation

Dave Airlie (5):
      Merge tag 'drm-misc-fixes-2025-07-16' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2025-07-17' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.16-2025-07-17' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'mediatek-drm-fixes-20250718' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-fixes
      Merge tag 'drm-xe-fixes-2025-07-17' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Eeli Haapalainen (1):
      drm/amdgpu/gfx8: reset compute ring wptr on the GPU on resume

Icenowy Zheng (1):
      drm/mediatek: only announce AFBC if really supported

Imre Deak (1):
      drm/dp: Change AUX DPCD probe address from LANE0_1_STATUS to
TRAINING_PATTERN_SET

Jason-JH Lin (1):
      drm/mediatek: Add wait_event_timeout when disabling plane

Lijo Lazar (1):
      drm/amdgpu: Increase reset counter only on success

Louis-Alexis Eyraud (1):
      drm/mediatek: mtk_dpi: Reorder output formats on MT8195/88

Lucas De Marchi (1):
      drm/xe/migrate: Fix alignment check

Matthew Auld (1):
      drm/xe/migrate: fix copy direction in access_memory

Matthew Brost (1):
      drm/xe: Move page fault init after topology init

Melissa Wen (1):
      drm/amd/display: Disable CRTC degamma LUT for DCN401

Michal Wajdeczko (2):
      drm/xe/pf: Prepare to stop SR-IOV support prior GT reset
      drm/xe/pf: Resend PF provisioning after GT reset

Philipp Stanner (1):
      drm/panfrost: Fix scheduler workqueue bug

Tejas Upadhyay (1):
      drm/xe: Dont skip TLB invalidations on VF

Thomas Zimmermann (2):
      drm/radeon: Do not hold console lock while suspending clients
      drm/radeon: Do not hold console lock during resume

 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  9 ++++--
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |  1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 11 ++++++-
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |  3 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |  2 +-
 drivers/gpu/drm/mediatek/mtk_crtc.c                | 36 +++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_crtc.h                |  1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c            |  1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h            |  9 ++++++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  7 +++++
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  4 +--
 drivers/gpu/drm/mediatek/mtk_plane.c               | 12 ++++++--
 drivers/gpu/drm/mediatek/mtk_plane.h               |  3 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              | 11 +++----
 drivers/gpu/drm/panfrost/panfrost_job.c            |  2 +-
 drivers/gpu/drm/radeon/radeon_device.c             | 23 ++++----------
 drivers/gpu/drm/xe/xe_gt.c                         | 15 +++++----
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c                | 19 ++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h                |  5 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         | 27 ++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.c                    |  6 ++--
 drivers/gpu/drm/xe/xe_ring_ops.c                   | 22 ++++++-------
 23 files changed, 174 insertions(+), 56 deletions(-)
