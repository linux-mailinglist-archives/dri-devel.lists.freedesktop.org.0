Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 925B79CF42F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 19:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C8E10E065;
	Fri, 15 Nov 2024 18:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gdyXGqCw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED15210E065
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 18:43:41 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a9f1d76dab1so351601366b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 10:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731696220; x=1732301020; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ns6WfZhSQfmJ7I6CQwzLZn1dFVVnjRWH4a8zFMhdBVw=;
 b=gdyXGqCw7Mbpqk1AfzrG/bmhfQBVVmEiPijxPFCDojfG2Gl7UirBwsfqjipOlp+BtB
 XW68yPuZng8IMTcj61XcT3mCjTfO6KF5hwgTpURoDpZRzjkr/v6+RUIAKqXBnBV8vsT8
 DC47w63ik2K6FlkkhkC766aFsG7OwW24DR0Va3ymgPr3uKQH1D7sMyA5ByKie3RCIU88
 awFRX5wsF3vszUKdwONJvfCQOyJ9xuifHNUZnTF15iXyjKqrf9qY+DWF/MutQyN7WoAJ
 rPNMD2FlJ3v9DX0xqC8V/l0hoTXeVXC14cJKgw6d83l2shtEhZ4a3UTmg9jWNHufOyCb
 0x7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731696220; x=1732301020;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ns6WfZhSQfmJ7I6CQwzLZn1dFVVnjRWH4a8zFMhdBVw=;
 b=ZBmmpQisrF4GZBfBQhNz549rr6VoQDslaozCPLid4FgEhUW2x+FEUU5GOHvZBPtWOG
 aU3PjP/IE78ZKDaTDqaVxtityz3zkAEYEYTVgd3nCd/lJyisCGHpMw979WdgPU+i4tOJ
 opQeZqI4CWXmzCupE7NootfZE1W3dFKYSXB1uU9PZjrCG88p/tdxd3dsRRTq3KAWfmUv
 WFiCmadGOzmwvpyTxNzvwdEbK/M/NLwbOAG6O94nJKxoUjLhaN8X/pgiba+CYwUrtEo8
 DpJxkbq+YSIE/s7C0f4ydfP7k+KSx4tEq5FpeXiOTfwlzcSxhfqmEFcG3TS0w9IOUT6t
 9XCA==
X-Gm-Message-State: AOJu0YzxOVrkarTXKJJkAUqc0FtlQuootbFocTo4SHkU1iy1SQjWOqJl
 HLJcltwM4uzOyMVAVUm8mK1u0Uvm/qOlJTZgqxRIduLEHzEO/AZaVKzDMOkdPb8m63SQWdzh/TU
 QCAkgmqvRkRCF7V5IWizBhN/0Heo=
X-Google-Smtp-Source: AGHT+IHPCvRbPxfg5LsoJW7Tjh2CF8E5SZKCsqBDT5bA34WqRLRDci7Mj6XwarJG2pmuwL+6cKxaqGi6zL6TuhPec/8=
X-Received: by 2002:a17:907:7e9e:b0:a99:65c6:7f34 with SMTP id
 a640c23a62f3a-aa4833e8285mr325110966b.7.1731696219911; Fri, 15 Nov 2024
 10:43:39 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 16 Nov 2024 04:43:28 +1000
Message-ID: <CAPM=9tyjNNXJ-UZryHaGhapXqhPHB=SWH5v0tR_BF3iZOL873g@mail.gmail.com>
Subject: [git pull] drm fixes for 6.12-rc8
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

Final week of fixes, lots of small amdgpu fixes, some i915 and xe
fixes, the nouveau changes fix a recent regression and some laptop
panel black screens, then a couple of other misc ones. It's probably a
little busier than I'd like, but each fix seems fine.

Dave.

drm-fixes-2024-11-16:
drm fixes for 6.12-rc8

amdgpu:
- PSR fix
- Panel replay fixes
- DML fix
- vblank power fix
- Fix video caps
- SMU 14.0 fix
- GPUVM fix
- MES 12 fix
- APU carve out fix
- DC vbios fix
- NBIO fix

i915:
- Don't load GSC on ARL-H and ARL-U if too old FW
- Avoid potential OOPS in enabling/disabling TV output

xe:
- Fix unlock on exec ioctl error path
- Fix hibernation on LNL due to ggtt getting lost
- Fix missing runtime PM in OA release

bridge:
- tc358768: Fix DSI command tx

nouveau:
- Fix GSP AUX error handling
- dp: Handle retires for AUX CH transfers with GSP
- fw: Sync DMA after setup

panthor:
- Fix partial BO mappings to GPU

rockchip:
- vop: Avoid null-ptr deref in plane-state check

vmwgfx:
- Avoid null-ptr deref in surface creation
The following changes since commit 2d5404caa8c7bb5c4e0435f94b28834ae5456623=
:

  Linux 6.12-rc7 (2024-11-10 14:19:35 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-11-16

for you to fetch changes up to 21c1c6c7d732c2f6f4c5ffc77e103aa3ae8bff1d:

  Merge tag 'drm-xe-fixes-2024-11-14' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2024-11-16 04:31:54 +1000)

----------------------------------------------------------------
drm fixes for 6.12-rc8

amdgpu:
- PSR fix
- Panel replay fixes
- DML fix
- vblank power fix
- Fix video caps
- SMU 14.0 fix
- GPUVM fix
- MES 12 fix
- APU carve out fix
- DC vbios fix
- NBIO fix

i915:
- Don't load GSC on ARL-H and ARL-U if too old FW
- Avoid potential OOPS in enabling/disabling TV output

xe:
- Fix unlock on exec ioctl error path
- Fix hibernation on LNL due to ggtt getting lost
- Fix missing runtime PM in OA release

bridge:
- tc358768: Fix DSI command tx

nouveau:
- Fix GSP AUX error handling
- dp: Handle retires for AUX CH transfers with GSP
- fw: Sync DMA after setup

panthor:
- Fix partial BO mappings to GPU

rockchip:
- vop: Avoid null-ptr deref in plane-state check

vmwgfx:
- Avoid null-ptr deref in surface creation

----------------------------------------------------------------
Akash Goel (1):
      drm/panthor: Fix handling of partial GPU mapping of BOs

Alex Deucher (1):
      Revert "drm/amd/display: parse umc_info or vram_info based on ASIC"

Andy Yan (1):
      drm/rockchip: vop: Fix a dereferenced before check warning

Ashutosh Dixit (1):
      drm/xe/oa: Fix "Missing outer runtime PM protection" warning

Chen Ridong (1):
      drm/vmwgfx: avoid null_ptr_deref in vmw_framebuffer_surface_create_ha=
ndle

Christian K=C3=B6nig (2):
      drm/amdgpu: fix check in gmc_v9_0_get_vm_pte()
      drm/amdgpu: enable GTT fallback handling for dGPUs only

Daniele Ceraolo Spurio (1):
      drm/i915/gsc: ARL-H and ARL-U need a newer GSC FW.

Dave Airlie (7):
      nouveau: fw: sync dma after setup is called.
      nouveau: handle EBUSY and EAGAIN for GSP aux errors.
      nouveau/dp: handle retries for AUX CH transfers with GSP.
      Merge tag 'drm-intel-fixes-2024-11-14' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2024-11-14' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.12-2024-11-14' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-xe-fixes-2024-11-14' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

David Rosca (1):
      drm/amdgpu: Fix video caps for H264 and HEVC encode maximum size

Dillon Varone (1):
      drm/amd/display: Require minimum VBlank size for stutter optimization

Francesco Dolcini (1):
      drm/bridge: tc358768: Fix DSI command tx

Hamish Claxton (1):
      drm/amd/display: Fix failure to read vram info due to static BP_RESUL=
T

Jack Xiao (1):
      drm/amdgpu/mes12: correct kiq unmap latency

Matthew Auld (2):
      drm/xe: improve hibernation on igpu
      drm/xe: handle flat ccs during hibernation on igpu

Matthew Brost (2):
      drm/xe: Ensure all locks released in exec IOCTL
      drm/xe: Restore system memory GGTT mappings

Rodrigo Siqueira (1):
      drm/amd/display: Adjust VSDB parser for replay feature

Ryan Seto (1):
      drm/amd/display: Handle dml allocation failure to avoid crash

Thomas Zimmermann (1):
      Merge drm/drm-fixes into drm-misc-fixes

Tim Huang (1):
      drm/amd/pm: print pp_dpm_mclk in ascending order on SMU v14.0.0

Tom Chung (2):
      drm/amd/display: Change some variable name of psr
      drm/amd/display: Fix Panel Replay not update screen correctly

Vijendar Mukunda (1):
      drm/amd: Fix initialization mistake for NBIO 7.7.0

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915: Grab intel_display from the encoder to avoid potential oops=
ies

 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  13 ++-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |   6 ++
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  12 +--
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   4 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |  12 +--
 drivers/gpu/drm/amd/amdgpu/soc24.c                 |   2 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |   8 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 117 +++++++++++------=
----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   5 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_irq_params.h   |   2 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |   6 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |   3 +
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |  11 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |   5 +-
 drivers/gpu/drm/bridge/tc358768.c                  |  21 +++-
 drivers/gpu/drm/i915/display/intel_tv.c            |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c          |  50 +++++----
 drivers/gpu/drm/i915/i915_drv.h                    |   8 +-
 drivers/gpu/drm/i915/intel_device_info.c           |  24 ++++-
 drivers/gpu/drm/i915/intel_device_info.h           |   4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c    |  61 ++++++-----
 drivers/gpu/drm/nouveau/nvkm/falcon/fw.c           |  11 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     |   6 +-
 drivers/gpu/drm/panthor/panthor_mmu.c              |   2 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |   8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   2 +
 drivers/gpu/drm/xe/xe_bo.c                         |  43 ++++----
 drivers/gpu/drm/xe/xe_bo_evict.c                   |  20 ++--
 drivers/gpu/drm/xe/xe_exec.c                       |   4 +-
 drivers/gpu/drm/xe/xe_oa.c                         |   2 +
 include/drm/intel/i915_pciids.h                    |  19 +++-
 34 files changed, 305 insertions(+), 197 deletions(-)
