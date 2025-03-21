Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093F5A6B3A3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 05:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A58F10E010;
	Fri, 21 Mar 2025 04:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZuU9seDy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C6610E010
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 04:19:18 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-aaf900cc7fbso339128566b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 21:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742530756; x=1743135556; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SpibAVJk9elna1e6DyUjTSilMAviHsEHwd+4cHoC0Q8=;
 b=ZuU9seDysZU2Z9o7IjJ8jg3tJORQm0oOWx6vnY4iFEyoD4s8ZzUMVxO8XGppPMSeYO
 GyA7cvhZOiFgXtSmrCTDyecwBojHp7v8aNXXnuSODXRHrnhlYzyXkM6QEHncD3eqL0l2
 kyY7NaaFBid9GTqdGM2sPK7c6yJfFHcyLpW38t+rcXJLeDPPuLxSFBAxIYz9olcRlQ9r
 Xf8W5uLqSdnATRx2cOlzm4X19hS7+QvvAhGWmf/uwR+hWziI2zTiC08ae1/2orRcqQq0
 7ktQ6f3oBF/w37KB2jBcRI1GeiJ0KXCL5eF7QMWemfXIUVjvFmm3Exp4vwr/9VkSF+EV
 aSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742530756; x=1743135556;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SpibAVJk9elna1e6DyUjTSilMAviHsEHwd+4cHoC0Q8=;
 b=FDBkse5HqRo0QpbzXe1SnL9xctLdxREN61rEBNm1FHW3hpfATcI9aKEOJdFhnno+dX
 JopO/7ki0EDCOpgEj79uv8z4ITHuAzNA4w46JTHfKGJuvGUTFvxp2xcbBrWDYZUT1JOq
 VaaRqHhlEwkVgZB8BJIhpWEmno5cM/uiu7Ryo7LNLvn2FAtOZDKZyybG8Uu4+mGbA2V3
 E5MmS6bBRJYx9ig5gfMHe5ZMxW8uzmz0fnjxlBU6Ba4r75Doq7TWGSZp5/pgUBRQs8xm
 7DtESmhy/qEG4CYqy/1FM9g3cEGqagFbzkVYyN4Jkfeh026c4Tw8tfO7tXakKhGs654Z
 fEVg==
X-Gm-Message-State: AOJu0YxhhUvNP2QzO51iscmXGE+wwpcLtp2vrsy5mg4TjT/jJFQLFXys
 T7+ba5yKBZFkcO3wWUI/b0594Gf0TUfdDpeS6i09MlIwpczI8lGmmLj5lhdwhjI0ugtpY+qp/uK
 Q45A+8DRjtbHIm/X6+LX+9jyFv1I=
X-Gm-Gg: ASbGncsfS5ok5m54QXn/UvvHg4AsRLS5ig8roSRKRb02JKYQGlX5xMKlebgGGYugemg
 /qWDdIN2jzY2E3HrDFRnIJNJsNiZe37tcgRhaxbUnmKtqwtJaGp7lAghfNR9YXzeRwxE+JqDMcN
 Pe67R7mMoeMJL4g0XkqCeQOy8z
X-Google-Smtp-Source: AGHT+IHlVqDnb9TbCW+gY+cKONThgIjNpaG7RCf0g7ElD2xNuuyzNFbzysKVelmk+2H+F4O4+paWAsWY1SnHSVmTN3Y=
X-Received: by 2002:a17:906:c103:b0:ac3:ec70:18aa with SMTP id
 a640c23a62f3a-ac3f22a26c2mr133689966b.25.1742530756331; Thu, 20 Mar 2025
 21:19:16 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 21 Mar 2025 14:19:05 +1000
X-Gm-Features: AQ5f1JpybLH9-9_AT_Id0S-ya_nN9kZxZ10q_mUeHQrczvkntzCRCad4nelQQXw
Message-ID: <CAPM=9txGdh-rbWbxA_nQVV_1AMin8SgJpo1T4HNcCc_4aRtJ0Q@mail.gmail.com>
Subject: [git pull] drm fixes for 6.14-rc8/final
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

It appears that the fd.o infrastructure is back enough to facilitate
sending this week's fixes, hopefully you can grab it without issue.
Just the usual spread of a bunch for amdgpu, and small changes to
others.

Regards,
Dave.

drm-fixes-2025-03-21:
drm fixes for 6.14-rc8

scheduler:
- fix fence reference leak

xe:
- Fix for an error if exporting a dma-buf multiple time

amdgpu:
- Fix video caps limits on several asics
- SMU 14.x fixes
- GC 12 fixes
- eDP fixes
- DMUB fix

amdkfd:
- GC 12 trap handler fix
- GC 7/8 queue validation fix

radeon:
- VCE IB parsing fix

v3d:
- fix job error handling bugs

qaic:
- fix two integer overflows

host1x:
- fix NULL domain handling
The following changes since commit 4701f33a10702d5fc577c32434eb62adde0a1ae1=
:

  Linux 6.14-rc7 (2025-03-16 12:55:17 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-03-21

for you to fetch changes up to 41e09ef6c26f0bd89f93691ef967fd621a38d759:

  Merge tag 'amd-drm-fixes-6.14-2025-03-20' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2025-03-21
11:59:49 +1000)

----------------------------------------------------------------
drm fixes for 6.14-rc8

scheduler:
- fix fence reference leak

xe:
- Fix for an error if exporting a dma-buf multiple time

amdgpu:
- Fix video caps limits on several asics
- SMU 14.x fixes
- GC 12 fixes
- eDP fixes
- DMUB fix

amdkfd:
- GC 12 trap handler fix
- GC 7/8 queue validation fix

radeon:
- VCE IB parsing fix

v3d:
- fix job error handling bugs

qaic:
- fix two integer overflows

host1x:
- fix NULL domain handling

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/pm: wire up hwmon fan speed for smu 14.0.2

Dan Carpenter (1):
      accel/qaic: Fix integer overflow in qaic_validate_req()

Dave Airlie (3):
      Merge tag 'drm-misc-fixes-2025-03-20' of
ssh://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-03-20' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.14-2025-03-20' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

David Belanger (1):
      drm/amdgpu: Restore uncached behaviour on GFX12

David Rosca (3):
      drm/amdgpu: Fix MPEG2, MPEG4 and VC1 video caps max size
      drm/amdgpu: Fix JPEG video caps max size for navi1x and raven
      drm/amdgpu: Remove JPEG from vega and carrizo video caps

Harish Kasiviswanathan (1):
      drm/amd/pm: add unique_id for gfx12

Jason Gunthorpe (1):
      gpu: host1x: Do not assume that a NULL domain means no DMA IOMMU

Jay Cornwall (1):
      drm/amdkfd: Fix instruction hazard in gfx12 trap handler

Jeffrey Hugo (1):
      accel/qaic: Fix possible data corruption in BOs > 2G

Lo-an Chen (1):
      drm/amd/display: Fix incorrect fw_state address in dmub_srv

Mario Limonciello (1):
      drm/amd/display: Use HW lock mgr for PSR1 when only one eDP

Ma=C3=ADra Canal (2):
      drm/v3d: Don't run jobs that have errors flagged in its fence
      drm/v3d: Set job pointer to NULL when the job's fence has an error

Nikita Zhandarovich (1):
      drm/radeon: fix uninitialized size issue in radeon_vce_cs_parse()

Philip Yang (1):
      drm/amdkfd: Fix user queue validation on Gfx7/8

Tomasz Paku=C5=82a (1):
      drm/amdgpu/pm: Handle SCLK offset correctly in overdrive for smu 14.0=
.2

Tomasz Rusinowicz (1):
      drm/xe: Fix exporting xe buffers multiple times

Wentao Liang (1):
      drm/amdgpu/gfx12: correct cleanup of 'me' field with gfx_v12_0_me_fin=
i()

Yilin Chen (1):
      drm/amd/display: Fix message for support_edp0_on_dp1

qianyi liu (1):
      drm/sched: Fix fence reference count leak

 drivers/accel/qaic/qaic_data.c                     |   9 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |  22 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  20 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  21 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |  43 +-
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     | 703 +++++++++++------=
----
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm |  82 +--
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c             |  12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   8 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   2 +-
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |  11 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   2 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   2 +
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  96 +--
 drivers/gpu/drm/radeon/radeon_vce.c                |   2 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |  11 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |  23 +-
 drivers/gpu/drm/xe/xe_bo.h                         |   2 -
 drivers/gpu/drm/xe/xe_dma_buf.c                    |   2 +-
 drivers/gpu/host1x/dev.c                           |   6 +
 21 files changed, 583 insertions(+), 498 deletions(-)
