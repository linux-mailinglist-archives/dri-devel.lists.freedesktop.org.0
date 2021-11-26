Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2AA45E3CF
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 01:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EC66E239;
	Fri, 26 Nov 2021 00:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332986E239
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 00:52:17 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id x6so31779101edr.5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 16:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=4cukbLGM00mmGR5pILYZRAbHPvNf+KpqSNLk4+sIbJY=;
 b=Mbtund93TL16No+50+l4W37cFpU7y1ws2chxqkdlIO6yvd/EsIJUGCviQlzqgObIuE
 iZzkR2wxUViiWrbSzkSBhTZyB4fR0g4T+V9dAoPrCsFF64Z/lyXjawrgSflgvVCGsw31
 oeHy23RGBf1CnowIkwd6SSj2J6P4XwSmJ/O0nygAOhWFYvY9yApTsgmm1QEtKK4mcTxf
 r7TPDj2v7ZLuNvIRfRD+D4bos8MxN9H7XOhf83ilbgNsXkBUeKumC4clC/olqCYP/IhS
 CLIGlWPqd3NW79B/xdgRpQ2ihV/tUAw3LrkhMw9FDI1QwvaTm43DUvct9cN/O7SPoj0Q
 388Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=4cukbLGM00mmGR5pILYZRAbHPvNf+KpqSNLk4+sIbJY=;
 b=ny6h0Zfa+P9sVq3H+3uzZcwkT81a24Sa0vdndlVLhqGe99bAuFCYbZO+l2AwPMM8Nx
 TtAGWN50DE2zK/4ZcqgJhnV1eGxLNw7UV36A7ovNsJx7uLsF0NW7/yDi8enWKuhX05Qq
 2/oKy/tBL0fZ7kNABaXpvUUW9CLYlR6fRJiGQBcZFJS6BSCP0cdz7X7ZyBU9Z1sAHqpU
 e1SnbnWn8CBv2MgOBjlcPcWIojgm0PYMKi2OozvkMOuZZfE8sqbZHDRVbsKfCXJGGlIu
 7OGX323XDduf2QOFhQQmv0OV9xPSK3BW3gmoJAaCrNYz4Ue3b1NerVwZ+ogUndJMPb6K
 DmBA==
X-Gm-Message-State: AOAM530Oc/ktfM6lbVEa08pqrHHUvrH1//Ulv2J5StsDxXKOsBtME1U4
 uZcZ/VbnkDs+lNOAaIbK3ery6tEjp3LUkri7CVs=
X-Google-Smtp-Source: ABdhPJyuZAf5LOCTL7jvEU0DH37vpr3btzx2DgFXRjQ+7qxjcNIEOAZFm8F4wsT7GY/76P+myqGB86eGP7PbHRVoKjI=
X-Received: by 2002:a17:906:5d06:: with SMTP id
 g6mr36699935ejt.3.1637887935566; 
 Thu, 25 Nov 2021 16:52:15 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 26 Nov 2021 10:52:04 +1000
Message-ID: <CAPM=9twJOj8+cfEPArF7N_TZpVM8vN+S4s2mMM7phsS-ZOgmJA@mail.gmail.com>
Subject: [git pull] drm fixes for 5.16-rc3
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

Hey Linus,

No idea if turkey comes before pull request processing, but here's the
regular week's fixes. A bunch for amdgpu, nouveau adds support for a
new GPU (like a PCI ID addition), and a scattering of fixes across
i915/hyperv/aspeed/vc4.

Dave.

drm-fixes-2021-11-26:
drm fixes for 5.16-rc3

amdgpu:
- SRIOV fixes
- dma-buf double free fix
- Display fixes for GPU resets
- Fix DSC powergating regression
- GPU TSC fixes
- Interrupt handler overflow fixes
- Endian fix in IP discovery table handling
- Aldebaran ASPM fix
- Fix overclocking regression on older asics
- Backlight/ACPI fix

amdkfd:
- SVM fixes
- VMA removal race fix

hyperv:
- removal fix

aspeed:
- vga_pw sysfs file fix

vc4:
- error checking fix

nouveau:
- support GA106
- fix a few error checks

i915:
- fix wakeref handling around PXP suspend
The following changes since commit 136057256686de39cc3a07c2e39ef6bc43003ff6:

  Linux 5.16-rc2 (2021-11-21 13:47:39 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-11-26

for you to fetch changes up to fc026c8b926835b46509a2757732bfa38a2162f1:

  Merge tag 'drm-intel-fixes-2021-11-24' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2021-11-26
10:36:33 +1000)

----------------------------------------------------------------
drm fixes for 5.16-rc3

amdgpu:
- SRIOV fixes
- dma-buf double free fix
- Display fixes for GPU resets
- Fix DSC powergating regression
- GPU TSC fixes
- Interrupt handler overflow fixes
- Endian fix in IP discovery table handling
- Aldebaran ASPM fix
- Fix overclocking regression on older asics
- Backlight/ACPI fix

amdkfd:
- SVM fixes
- VMA removal race fix

hyperv:
- removal fix

aspeed:
- vga_pw sysfs file fix

vc4:
- error checking fix

nouveau:
- support GA106
- fix a few error checks

i915:
- fix wakeref handling around PXP suspend

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu/gfx10: add wraparound gpu counter check for APUs as well
      drm/amdgpu/gfx9: switch to golden tsc registers for renoir+
      drm/amdgpu/pm: fix powerplay OD interface
      drm/amd/display: update bios scratch when setting backlight

Ben Skeggs (1):
      drm/nouveau: recognise GA106

Dan Carpenter (2):
      drm/nouveau/acr: fix a couple NULL vs IS_ERR() checks
      drm/vc4: fix error code in vc4_create_object()

Dave Airlie (3):
      Merge tag 'amd-drm-fixes-5.16-2021-11-24' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2021-11-25' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2021-11-24' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Felix Kuehling (1):
      drm/amdgpu: Fix MMIO HDP flush on SRIOV

Joel Stanley (1):
      drm/aspeed: Fix vga_pw sysfs output

Lijo Lazar (1):
      drm/amdgpu: Skip ASPM programming on aldebaran

Mohammed Gamal (1):
      drm/hyperv: Fix device removal on Gen1 VMs

Nicholas Kazlauskas (3):
      drm/amd/display: Fix DPIA outbox timeout after GPU reset
      drm/amd/display: Set plane update flags for all planes in reset
      drm/amd/display: Reset link encoder assignments for GPU reset

Philip Yang (6):
      drm/amdgpu: IH process reset count when restart
      drm/amdkfd: process exit and retry fault race
      drm/amdkfd: handle VMA remove race
      drm/amdkfd: simplify drain retry fault
      drm/amdgpu: enable Navi 48-bit IH timestamp counter
      drm/amdgpu: enable Navi retry fault wptr overflow

Tejas Upadhyay (1):
      drm/i915/gt: Hold RPM wakelock during PXP suspend

Yang Wang (1):
      drm/amdgpu: fix byteorder error in amdgpu discovery

Yi-Ling Chen (1):
      drm/amd/display: Fixed DSC would not PG after removing DSC stream

shaoyunl (1):
      drm/amdgpu: move kfd post_reset out of reset_sriov function

xinhui pan (1):
      drm/amdgpu: Fix double free of dmabuf

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   6 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |  12 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h       |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  12 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  15 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  46 +++++++--
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |  34 +++----
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |   4 +
 drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c             |   4 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             |   4 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |   7 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   8 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               | 111 +++++++++++++--------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  24 ++++-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |   2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |  20 ++--
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |  24 ++---
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c    |   6 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |  28 +++---
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |  10 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |  58 ++++++-----
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |   2 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |  19 +++-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |   7 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c            |  37 +++++--
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.h            |  19 +++-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |  22 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c    |   6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c    |   6 +-
 drivers/gpu/drm/vc4/vc4_bo.c                       |   2 +-
 37 files changed, 375 insertions(+), 210 deletions(-)
