Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F1F8AA65E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 02:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE7511A0DD;
	Fri, 19 Apr 2024 00:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DbBIIJ1Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21F411A0DD
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 00:53:19 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3454fbdd88aso1105523f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 17:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713487997; x=1714092797; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=75zr9p/fh/PWCweFikTRplCtvZIMjSWtAwBUBiqCtJY=;
 b=DbBIIJ1QdmjxA9cRovmTDXjPy3snpOvMGfzKmuhkr2wg4RcRcGXUlNVpSEtQ7l6NoM
 QwGoy5xSzmWlOe7K0veE8I3wbCd0z0VnKDX//BcYQNFVgMpRdse9SYwDeSxZrDvOroAw
 yAh+NpS8DzDf2G1treQFGlbmzDfWUzHufwJ7+ASiZ4G/tkNqwOi2N8kAgIWKI1UK2fPW
 wIq3f5R7Nn/oVzv9Rc47ZUIgtqgn7uZhnlcJWoZ6wpciP6a73SOORrR6pDmfa+vNcgBv
 J1qsw+saUWfcsVW4gtwUY3meU8+N6OUklNdIDEGpo+kFELpu3oLaVVoDzW9QrJoIrlCl
 xNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713487997; x=1714092797;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=75zr9p/fh/PWCweFikTRplCtvZIMjSWtAwBUBiqCtJY=;
 b=r682VSm28xWhhCqGm2XQXU9srr++ukIvzRaRFaNfhBjgXzbIG0u3EayX9kHGk/fM5O
 Bctj/MSrT2gy7YYSsSXKd6Q+7tLgEGEF+66X5g5BXaZp3xqqj+rUWWefRD2Uwlacadcb
 rRxpT4HS7z/y4JfJaNUUzbNim0zEPtbrDoE47eiaZRI56QHIvmI9Iu++vqIldhzVABAR
 Zb0rPtaWYEUN9OY0HcKS1XDSKDWtV18LpZlPE3YKy278plFvdOzAAsRa29wqeGa3Eny1
 1YkRwLCj7jrEPbrwayjQJc2m+YKzOp1UFUOV05C91Voj6mNlJlsZCjaA6zqJaKb4mHAq
 YM3g==
X-Gm-Message-State: AOJu0Yy2KtTpC56QkMyhPkWyQMXf+8WN6eDU07YWyD3I23RepphjP63Y
 gaZxYwPaQ/istSH6hmHwvZ4hlv4sRsASso6FzaP8osowGK0DSBfqjaK8TiBOZBGhjGzsm8hwcDg
 U8oopKgaCB/KqpmEf0eDLk0z4p1s=
X-Google-Smtp-Source: AGHT+IHDxhNcglaeB2Qft4xeEEFXKNdWCvstiy/xJVZXvE2C3LfODAnguT6hDp2iE94yPOgU9gbPKG4J1PLVijHSinM=
X-Received: by 2002:a5d:4147:0:b0:34a:2d0c:4463 with SMTP id
 c7-20020a5d4147000000b0034a2d0c4463mr393091wrq.4.1713487997324; Thu, 18 Apr
 2024 17:53:17 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 19 Apr 2024 10:53:05 +1000
Message-ID: <CAPM=9tyKSyw-hDGcGSHom+C0iiagDbgrX=1oxv08jV+KRL=m8w@mail.gmail.com>
Subject: [git pull] drm fixes for 6.9-rc5
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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

Regular week of fixes, seems to be about right for this time in the
release cycle, amdgpu, and nouveau are the main one with some
scattered fixes otherwise.

Dave.

drm-fixes-2024-04-19:
drm fixes for v6.9-rc5

ttm:
- Stop pooling cached NUMA pages

amdgpu:
- Fix invalid resource->start check
- USB-C DSC fix
- Fix a potential UAF in VA IOCTL
- Fix visible VRAM handling during faults

amdkfd:
- Fix memory leak in create_process failure

radeon:
- Silence UBSAN warnings from variable sized arrays

nouveau:
- dp: Don't probe DP ports twice
- nv04: Fix OOB access
- nv50: Disable AUX bus for disconnected DP ports
- nvkm: Fix instmem race condition

panel:
- Don't unregister DSI devices in several drivers

v3d:
- Fix enabled_ns increment

xe:
- Fix bo leak on error path during fb init
- Fix use-after-free due to order vm is put and destroyed
The following changes since commit 0bbac3facb5d6cc0171c45c9873a2dc96bea9680=
:

  Linux 6.9-rc4 (2024-04-14 13:38:39 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-04-19

for you to fetch changes up to 52c8b6e1c007b93d35058508fbe1ec80a1d9ca39:

  Merge tag 'drm-xe-fixes-2024-04-18' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2024-04-19 10:40:47 +1000)

----------------------------------------------------------------
drm fixes for v6.9-rc5

ttm:
- Stop pooling cached NUMA pages

amdgpu:
- Fix invalid resource->start check
- USB-C DSC fix
- Fix a potential UAF in VA IOCTL
- Fix visible VRAM handling during faults

amdkfd:
- Fix memory leak in create_process failure

radeon:
- Silence UBSAN warnings from variable sized arrays

nouveau:
- dp: Don't probe DP ports twice
- nv04: Fix OOB access
- nv50: Disable AUX bus for disconnected DP ports
- nvkm: Fix instmem race condition

panel:
- Don't unregister DSI devices in several drivers

v3d:
- Fix enabled_ns increment

xe:
- Fix bo leak on error path during fb init
- Fix use-after-free due to order vm is put and destroyed

----------------------------------------------------------------
Alex Deucher (3):
      Revert "drm/amd/display: fix USB-C flag update after enc10 feature in=
it"
      drm/radeon: make -fstrict-flex-arrays=3D3 happy
      drm/radeon: silence UBSAN warning (v3)

Christian K=C3=B6nig (3):
      drm/ttm: stop pooling cached NUMA pages v2
      drm/amdgpu: remove invalid resource->start check v2
      drm/amdgpu: fix visible VRAM handling during faults

Dave Airlie (4):
      nouveau: fix instmem race condition around ptr stores
      Merge tag 'amd-drm-fixes-6.9-2024-04-17' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2024-04-18' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2024-04-18' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Dmitry Baryshkov (2):
      drm/panel: visionox-rm69299: don't unregister DSI device
      drm/panel: novatek-nt36682e: don't unregister DSI device

Felix Kuehling (1):
      drm/amdkfd: Fix memory leak in create_process failure

Lyude Paul (2):
      drm/nouveau/kms/nv50-: Disable AUX bus for disconnected DP ports
      drm/nouveau/dp: Don't probe eDP ports twice harder

Maarten Lankhorst (1):
      drm/xe: Fix bo leak in intel_fb_bo_framebuffer_init

Matthew Auld (1):
      drm/xe/vm: prevent UAF with asid based lookup

Ma=C3=ADra Canal (1):
      drm/v3d: Don't increment `enabled_ns` twice

Mikhail Kobuk (1):
      drm: nv04: Fix out of bounds access

Zack Rusin (3):
      drm/vmwgfx: Fix prime import/export
      drm/vmwgfx: Fix crtc's atomic check conditional
      drm/vmwgfx: Sort primary plane formats by order of preference

xinhui pan (1):
      drm/amdgpu: validate the parameters of bo mapping operations more cle=
arly

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         | 22 +++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         | 22 -------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            | 65 +++++++++++-------=
-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |  3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             | 72 ++++++++++++++----=
----
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  4 +-
 .../amd/display/dc/dcn32/dcn32_dio_link_encoder.c  |  8 +--
 .../amd/display/dc/dcn35/dcn35_dio_link_encoder.c  |  4 +-
 drivers/gpu/drm/nouveau/nouveau_bios.c             | 13 ++--
 drivers/gpu/drm/nouveau/nouveau_dp.c               | 23 +++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c |  7 ++-
 drivers/gpu/drm/panel/panel-novatek-nt36672e.c     |  2 -
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     |  2 -
 drivers/gpu/drm/radeon/pptable.h                   | 10 +--
 drivers/gpu/drm/radeon/radeon_atombios.c           |  8 ++-
 drivers/gpu/drm/ttm/ttm_pool.c                     | 38 +++++++++---
 drivers/gpu/drm/v3d/v3d_irq.c                      |  4 --
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c               | 35 ++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |  7 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h                 |  2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |  3 +
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                | 32 ++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                | 11 +++-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_prime.c              | 15 ++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         | 44 ++++++++-----
 drivers/gpu/drm/xe/display/intel_fb_bo.c           |  8 ++-
 drivers/gpu/drm/xe/xe_vm.c                         | 21 ++++---
 30 files changed, 320 insertions(+), 172 deletions(-)
