Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF52A48EF8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 04:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2353B10E0DB;
	Fri, 28 Feb 2025 03:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PVAUxzWj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE0510E0DB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 03:10:29 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5e0813bd105so2631361a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 19:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740712228; x=1741317028; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dR5kvLhrP5a254wV2DQO0tyOX2xPxb7vk5FR9eMet5I=;
 b=PVAUxzWjpixDotvew9lCFv1YS9KrdHQyFyTRV9Vinft4kGGNrJkloE5KYHQ+DkE9Vb
 OJs3VL0BRj2wyreAyj/QfYyjdxcDc4aJx+OWjsGPgLlDXoxAz1gzJDkXNHzLsF3+zQH7
 ieGss4T3EHSNr/QqooErMzX3r/m8P3JepHdC20d+2eMIqIY2EQbxPsO1icrADRay/PrO
 bITfgXpgS0OrCDo/F/07aO9F0yCN3Yuv+nBWBtGnJGbz01eHEzp9CdcUx/i8j2gEqekh
 QhFfh4/K7zLaCfrh6b3AI7MMP6KxNLbSVT9fXmb7sUZzVepOzszTuvEDd9d09nFSqS3a
 Y1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740712228; x=1741317028;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dR5kvLhrP5a254wV2DQO0tyOX2xPxb7vk5FR9eMet5I=;
 b=FnEO2KSvg1QiFBhCLVzR+pcpWutrVpfSblsgJfU/CahvbJ58AfxmmODt4dmCkE6ezn
 6B/0Povr+uPBiGKedAXQ449GFuOTP4e0BCzGUyAknaTFxgWp69TeH9rQjX4hRm6Q1IEm
 6podH9pCSG7OGecAM2O5jkD+lGafaWOGfDSNefDhc5bgFkpoiOlnd/onXn1rflmIhN87
 l9Jti1LtF9Vpmf0Q3erpmfDzLnDjiRMDMzKj18To7zaT+0k2hRrA5pdKoJtQY5JoOd8X
 v68kIPQlLEgPaBwvRgEqV4J9SXuKbqpnARVh7vtI5tKzZOwVSKFqw9z/jQLbe0M5hG98
 sYCQ==
X-Gm-Message-State: AOJu0Yw2FIvhOLU9zV4IcYDdrLSbkC1UHwWtM7vbyjPxiYoU2V79VPT3
 9zRklTyJ8R3YG++Ga0hhQ2n+ONi7ZA7NdgnpB1uNxQj0KUNav0Sutjb8jrZvkCgk6MineJOosoa
 ofKv6Bi/cGUQrY/CxIVfErRYXeidEGLK4
X-Gm-Gg: ASbGncvNcTKTdoFF6g2tqsjJaTKnoK/EtpwKPMUutl38LUsqXZP8tB6rIPhJJbZz5L9
 NS3DniLr+ipHuF4BeXmU92WOps9J+zhaSNAAkcQorV5rnmeRrFx0+umSVA9AETbIpE7Z9DhrLQd
 0ECUZM6A==
X-Google-Smtp-Source: AGHT+IF5FDia1S0yddEgQ8TKsm3JENQUPPmxA3vJfmHNYPcSRkT7h5GfkDJLwseuptXBBJry8MULMowpRZQBixHxSCg=
X-Received: by 2002:a17:907:d8a:b0:ab7:b072:8481 with SMTP id
 a640c23a62f3a-abf265ce47bmr158044966b.45.1740712227677; Thu, 27 Feb 2025
 19:10:27 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 28 Feb 2025 13:10:16 +1000
X-Gm-Features: AQ5f1JoL4X2aIUXy2QZ8GfJ_quTK_ODi4bnubCGIy0X0uFyQe7-QzYQKpJNZymU
Message-ID: <CAPM=9tzCwv8Uhq9BzwMJ_rQoxEBAEFDQzcFJms=cmD9Njrd3hw@mail.gmail.com>
Subject: [git pull] drm fixes for 6.14-rc5
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

This week's fixes pull, amdgpu mostly, with some xe and a few misc
others, the fb defio fix is bit of a change, but it avoids some nasty
NULL pointer crashes due to defio assuming page backing in places it
didn't have pages.

Regards,
Dave.

drm-fixes-2025-02-28:
drm fixes for 6.14-rc5

amdgpu:
- Legacy dpm suspend/resume fix
- Runtime PM fix for DELL G5 SE
- MAINTAINERS updates
- Enforce Isolation fixes
- mailmap update
- EDID reading i2c fix
- PSR fix
- eDP fix
- HPD interrupt handling fix
- Clear memory fix

amdkfd:
- MQD handling fix

vkms:
- fix rounding error

imagination:
- header fix

nouveau:
- connector status fix

fb/defio:
- NULL ptr fix for defio drivers

i915:
- Fix encoder HW state readout for DP UHBR MST

xe:
- OA uapi fix (Umesh)
- Userptr related fixes
- Remove a duplicated register entry
- Scheduler related fix to prevent exec races when freeing it
The following changes since commit d082ecbc71e9e0bf49883ee4afd435a77a5101b6:

  Linux 6.14-rc4 (2025-02-23 12:32:57 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-02-28

for you to fetch changes up to 6a5884f200693eeffac4b008faf1e8bdf1c92af5:

  Merge tag 'drm-xe-fixes-2025-02-27' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-02-28 10:47:09 +1000)

----------------------------------------------------------------
drm fixes for 6.14-rc5

amdgpu:
- Legacy dpm suspend/resume fix
- Runtime PM fix for DELL G5 SE
- MAINTAINERS updates
- Enforce Isolation fixes
- mailmap update
- EDID reading i2c fix
- PSR fix
- eDP fix
- HPD interrupt handling fix
- Clear memory fix

amdkfd:
- MQD handling fix

vkms:
- fix rounding error

imagination:
- header fix

nouveau:
- connector status fix

fb/defio:
- NULL ptr fix for defio drivers

i915:
- Fix encoder HW state readout for DP UHBR MST

xe:
- OA uapi fix (Umesh)
- Userptr related fixes
- Remove a duplicated register entry
- Scheduler related fix to prevent exec races when freeing it

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: disable BAR resize on Dell G5 SE
      MAINTAINERS: update amdgpu maintainers list
      drm/amdgpu/gfx: only call mes for enforce isolation if supported
      drm/amdgpu/mes: keep enforce isolation up to date

Aurabindo Pillai (1):
      MAINTAINERS: Update AMDGPU DML maintainers info

Dave Airlie (4):
      Merge tag 'amd-drm-fixes-6.14-2025-02-26' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2025-02-27' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2025-02-27' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-02-27' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

David Yat Sin (1):
      drm/amdkfd: Preserve cp_hqd_pq_control on update_mqd

Harry Wentland (1):
      drm/vkms: Round fixp2int conversion in lerp_u16

Imre Deak (1):
      drm/i915/dp_mst: Fix encoder HW state readout for UHBR MST

Maarten Lankhorst (1):
      MAINTAINERS: Add entry for DMEM cgroup controller

Masahiro Yamada (1):
      drm/imagination: remove unnecessary header include path

Matthew Auld (2):
      drm/xe/userptr: restore invalidation list on error
      drm/xe/userptr: fix EFAULT handling

Melissa Wen (1):
      drm/amd/display: restore edid reading from a given i2c adapter

Mingcong Bai (1):
      drm/xe/regs: remove a duplicate definition for RING_CTL_SIZE(size)

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: init return value in amdgpu_ttm_clear_buffer

Rodrigo Siqueira (2):
      MAINTAINERS: Change my role from Maintainer to Reviewer
      mailmap: Add entry for Rodrigo Siqueira

Roman Li (1):
      drm/amd/display: Fix HPD after gpu reset

Tejas Upadhyay (1):
      drm/xe: cancel pending job timer before freeing scheduler

Thomas Zimmermann (2):
      drm/nouveau: Do not override forced connector status
      drm/fbdev-dma: Add shadow buffering for deferred I/O

Tom Chung (1):
      drm/amd/display: Disable PSR-SU on eDP panels

Umesh Nerlige Ramappa (1):
      drm/xe/oa: Allow oa_exponent value of 0

Yilin Chen (1):
      drm/amd/display: add a quirk to enable eDP0 on DP1

chr[] (1):
      amdgpu/pm/legacy: fix suspend/resume issues

 .mailmap                                           |   3 +
 MAINTAINERS                                        |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   4 +
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |   4 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |   5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c   |   5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |   5 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  86 +++++++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |  14 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |   3 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |  25 ++-
 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c     |   8 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |  26 ++-
 drivers/gpu/drm/drm_fbdev_dma.c                    | 217 +++++++++++++++------
 drivers/gpu/drm/i915/display/intel_ddi.c           |   9 +-
 drivers/gpu/drm/imagination/Makefile               |   2 -
 drivers/gpu/drm/nouveau/nouveau_connector.c        |   1 -
 drivers/gpu/drm/vkms/vkms_composer.c               |   2 +-
 drivers/gpu/drm/xe/regs/xe_engine_regs.h           |   1 -
 drivers/gpu/drm/xe/xe_guc_submit.c                 |   2 +
 drivers/gpu/drm/xe/xe_oa.c                         |   5 +-
 drivers/gpu/drm/xe/xe_vm.c                         |  40 +++-
 28 files changed, 407 insertions(+), 124 deletions(-)
