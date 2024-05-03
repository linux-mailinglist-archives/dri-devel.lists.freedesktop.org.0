Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CF78BA5D8
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 05:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FA010E543;
	Fri,  3 May 2024 03:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TTU3iWPp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3096C10E543
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 03:52:57 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a598c8661f0so61272566b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 20:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714708375; x=1715313175; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Iy4Fc+Is3/f7DsGtTqeBrCfKRHTo9HAk7taFS9ybm40=;
 b=TTU3iWPpbaWMwGdPyKhzU03htTOC4nzYh0PiU9z6CwD//GuvXEPu+BpwuaZEtq4+sJ
 zCJ3exKJMhDBvD/z2z87fP25+1I/8RGTO2GtzTfniW2WUqf5LBwJmy1FupnB2QLmmXuR
 QA+ImTyjTvQxeMwTGQzIv3xpbEjUNO0S0AHeh4V2KBeuYHGQbxLq3DHsE4fkC8TTn6bN
 gGHfq9fMNR3yufDztaGiRnEmXpl6kxlTMXeYXHin9iPGBZePaEAaeB4g2+y/Cob9oe41
 3livRggkf55Q6Ki/a5+fjo3CEF6mzru46q7OmKEJEJdKG4ACcM+iMfl4Eocw+Rk96uDK
 Jmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714708375; x=1715313175;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Iy4Fc+Is3/f7DsGtTqeBrCfKRHTo9HAk7taFS9ybm40=;
 b=Zv/zahT2gKyokm7Om4r44/mCwHC02TxIgazwPCKmzxrEl3W+QwKm4yfejEXh0/c/1e
 6Uf11kUxttWNZZJDeTB878C+vtJfVkV/6IQQ7TZbidEhivN7PFzsMNP5uHVSnEs2VKBP
 nJUuvgSKacKRypZvZh4ZC2WwIIXxhZg/75WlPJOxZlouaso8x5IRpRCnFz2hC8RhRe7Y
 NcvXaSp9iRnJbgeF1twVziIH29wMbNOKl8d4XJAPkHffu8+Fb75WyzsuKgg1Wx94DMac
 6K0GqJ855hGPhg+yOFIGCpoV9d8J7VU5Sj7PuhewpqVrVjY4l5R/vezsI9KLKaSM54h4
 ukhQ==
X-Gm-Message-State: AOJu0YyGPpk0DD/AiV2U5bQ7MQltL1+5G/8NyFHLi9iKph0tLZNg6j5D
 V3VPqXtB4vrDY+BzLrkUZxt4WA2q/SCTQnVCsk751lh5qX/5L+gDMPQ/wQZ08nCSDiWAH4a2w6x
 nyO2YFJwA79SDc+xfiDmbSLHQpsA=
X-Google-Smtp-Source: AGHT+IHGWMY7wl/zE8XeCsE0g+Zrazhy7xVmSU3nOJqYRmJvCWUTcKzS2GMAJj1HlF+JqPwQr1xf8r3VWBROJwHDXOM=
X-Received: by 2002:a17:906:fa0c:b0:a58:7ce0:8ebd with SMTP id
 lo12-20020a170906fa0c00b00a587ce08ebdmr742405ejb.19.1714708375060; Thu, 02
 May 2024 20:52:55 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 3 May 2024 13:52:43 +1000
Message-ID: <CAPM=9ty6LzXnyr5J1RrR8xRdiRcooTkoPuq9m108mUEsF7R98g@mail.gmail.com>
Subject: [git pull] drm fixes for 6.9-rc7
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

Weekly fixes, mostly made up from amdgpu and some panel changes.
Otherwise xe, nouveau, vmwgfx and a couple of others, all seems pretty
on track.

Dave.

drm-fixes-2024-05-03:
drm fixes for 6.9-rc7

amdgpu:
- Fix VRAM memory accounting
- DCN 3.1 fixes
- DCN 2.0 fix
- DCN 3.1.5 fix
- DCN 3.5 fix
- DCN 3.2.1 fix
- DP fixes
- Seamless boot fix
- Fix call order in amdgpu_ttm_move()
- Fix doorbell regression
- Disable panel replay temporarily

amdkfd:
- Flush wq before creating kfd process

xe:
- Fix UAF on rebind worker
- Fix ADL-N display integration

imagination:
- fix page-count macro

nouveau:
- avoid page-table allocation failures
- fix firmware memory allocation

panel:
- ili9341: avoid OF for device properties; respect deferred probe; fix
  usage of errno codes

ttm:
- fix status output

vmwgfx:
- fix legacy display unit
- fix read length in fence signalling
The following changes since commit e67572cd2204894179d89bd7b984072f19313b03=
:

  Linux 6.9-rc6 (2024-04-28 13:47:24 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-05-03

for you to fetch changes up to 09e10499ee6a5a89fc352f25881276398a49596a:

  Merge tag 'drm-misc-fixes-2024-05-02' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
(2024-05-03 11:16:40 +1000)

----------------------------------------------------------------
drm fixes for 6.9-rc7

amdgpu:
- Fix VRAM memory accounting
- DCN 3.1 fixes
- DCN 2.0 fix
- DCN 3.1.5 fix
- DCN 3.5 fix
- DCN 3.2.1 fix
- DP fixes
- Seamless boot fix
- Fix call order in amdgpu_ttm_move()
- Fix doorbell regression
- Disable panel replay temporarily

amdkfd:
- Flush wq before creating kfd process

xe:
- Fix UAF on rebind worker
- Fix ADL-N display integration

imagination:
- fix page-count macro

nouveau:
- avoid page-table allocation failures
- fix firmware memory allocation

panel:
- ili9341: avoid OF for device properties; respect deferred probe; fix
  usage of errno codes

ttm:
- fix status output

vmwgfx:
- fix legacy display unit
- fix read length in fence signalling

----------------------------------------------------------------
Andy Shevchenko (3):
      drm/panel: ili9341: Correct use of device property APIs
      drm/panel: ili9341: Respect deferred probe
      drm/panel: ili9341: Use predefined error codes

Christian K=C3=B6nig (1):
      drm/amdgpu: once more fix the call oder in amdgpu_ttm_move() v2

Dave Airlie (3):
      Merge tag 'amd-drm-fixes-6.9-2024-05-01' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-xe-fixes-2024-05-02' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2024-05-02' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes

Gabe Teeger (1):
      drm/amd/display: Atom Integrated System Info v2_2 for DCN35

George Shen (1):
      drm/amd/display: Handle Y carry-over in VCP X.Y calculation

Hersen Wu (1):
      drm/amd/display: Fix incorrect DSC instance for MST

Ian Forbes (1):
      drm/vmwgfx: Fix Legacy Display Unit

Lancelot SIX (1):
      drm/amdkfd: Flush the process wq before creating a kfd_process

Leo Ma (1):
      drm/amd/display: Fix DC mode screen flickering on DCN321

Lucas De Marchi (1):
      drm/xe/display: Fix ADL-N detection

Lyude Paul (2):
      drm/nouveau/firmware: Fix SG_DEBUG error with nvkm_firmware_ctor()
      drm/nouveau/gsp: Use the sg allocator for level 2 of radix3

Mario Limonciello (1):
      drm/amd/display: Disable panel replay by default for now

Matt Coster (1):
      drm/imagination: Ensure PVR_MIPS_PT_PAGE_COUNT is never zero

Matthew Auld (1):
      drm/xe/vm: prevent UAF in rebind_work_func()

Meenakshikumar Somasundaram (1):
      drm/amd/display: Allocate zero bw after bw alloc enable

Mukul Joshi (1):
      drm/amdgpu: Fix VRAM memory accounting

Rodrigo Siqueira (2):
      drm/amd/display: Ensure that dmcub support flag is set for DCN20
      drm/amd/display: Add VCO speed parameter for DCN31 FPU

Shashank Sharma (1):
      drm/amdgpu: fix doorbell regression

Sung Joon Kim (1):
      drm/amd/display: Disable seamless boot on 128b/132b encoding

Swapnil Patel (1):
      drm/amd/display: Add dtbclk access to dcn315

Zack Rusin (2):
      drm/ttm: Print the memory decryption status just once
      drm/vmwgfx: Fix invalid reads in fence signaled events

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         | 14 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            | 50 +++++++-------
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  8 +++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 21 +++---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  | 48 ++++++++++----
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |  1 +
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |  8 +++
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   | 15 ++++-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  3 +
 .../display/dc/dcn31/dcn31_hpo_dp_link_encoder.c   |  6 ++
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |  2 +
 .../display/dc/link/protocols/link_dp_dpia_bw.c    | 10 ++-
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |  1 +
 drivers/gpu/drm/imagination/pvr_fw_mips.h          |  5 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h  |  4 +-
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c       | 19 ++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     | 77 ++++++++++++++----=
----
 drivers/gpu/drm/panel/Kconfig                      |  2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       | 13 ++--
 drivers/gpu/drm/ttm/ttm_tt.c                       |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c              |  2 +-
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |  3 +-
 drivers/gpu/drm/xe/xe_vm.c                         |  3 +
 26 files changed, 223 insertions(+), 101 deletions(-)
