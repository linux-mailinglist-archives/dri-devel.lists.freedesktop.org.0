Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAB83777EA
	for <lists+dri-devel@lfdr.de>; Sun,  9 May 2021 20:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D12089CF8;
	Sun,  9 May 2021 18:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB5889CF8
 for <dri-devel@lists.freedesktop.org>; Sun,  9 May 2021 18:16:15 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id r11so1240812edt.13
 for <dri-devel@lists.freedesktop.org>; Sun, 09 May 2021 11:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=+1zVUPtBdvCiF9pJ73d6Ut1OLPlrj5Kic5SeEgnPyqU=;
 b=erxcovxVceYltSSmKipeb8IIpUKH/ypSAqYjQA0LJ1nIGui+RGAJyl4jDwofydzJV9
 LfKwsA1G8ZBlRcaB4bo8NsTwgS0G3drgK/kAqFJasRD+A6Kk9h2/G8OlMHOwpNKSjWOb
 Z6HEmhkKJ8saeA6XSn5DXoYTQgEZniEU9Nix70N6SHlzW+Zxgw7kgblU3EyWP3itsjYo
 p4HSZ60IFz5ictiRqCI8QtkuGgVFMKNj30c3PUQdgh1+Cnxn0op7879OQsluAOWLrcQ/
 Gw77zL/HzY1DrfdQ4IRzoVzo09zE/nc0EKq0T1nnKTNcy0vDfP7Oxue8+vj/ntdXfur6
 vPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=+1zVUPtBdvCiF9pJ73d6Ut1OLPlrj5Kic5SeEgnPyqU=;
 b=Nibs+vnlMPpMYb7CBBztAj8AsSGYDst0qrZQLfbBa2U1Oz76UkNxEs/h8hZZINKRrD
 8ME6b+sGr4b8QGwPNYScKRSlUsuL3N4j5/ro9EOhdDKcWbr5ZXvkEkcdo8A6wNvRwkCs
 R0HxatonludHxrIw0Fxy18pyBuuJKZCvd8RQI3oxY4zMio+Y4RqNFbvdE5VVu9qNDup1
 IrGgTpl7L7j8/wvEZyo981M8h23iJ8Rwz2bFPc4yzaiRscAKPmetcT1Nus/eWlvyzVba
 vQcQMMyWU8KG1cu0zeoFqTH318bJwwbj5xRy20YbwiNo0aF3tY4H1+ZD33RaY/7Rm/kF
 fO2w==
X-Gm-Message-State: AOAM532UGekbkiMNPLMIq0LAp877m/K7MhheRHZB7b5gA2Mb5f1kB7Sp
 HgOAg+kOPItiLbAih57H/e5krPPTjLX8Eb0sYv8=
X-Google-Smtp-Source: ABdhPJy60yNcI3tO0AJZtwzPU0QUtUnugrqA9DsaKcgIlpQwMd/EpnFsZXQWfUss7r5GNE8QZ0xWtc42GjByDCgzse4=
X-Received: by 2002:aa7:d84e:: with SMTP id f14mr25172716eds.220.1620584173799; 
 Sun, 09 May 2021 11:16:13 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 10 May 2021 04:16:02 +1000
Message-ID: <CAPM=9twAN82gkzrfc2CGQopjkjEdWtBKMF2DgBOtw+6RsZ++fw@mail.gmail.com>
Subject: [git pull] drm fixes round two for 5.13-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Linus,

Bit later than usual, I queued them all up on Friday then promptly
forgot to write the pull request email. This is mainly amdgpu fixes,
with some radeon/msm/fbdev and one i915 gvt fix thrown in.

Hopefully I get you before you drop rc1, but nothing insanely urgent if not=
.

Dave.

drm-next-2021-05-10:
drm fixes for 5.13-rc1

amdgpu:
- MPO hang workaround
- Fix for concurrent VM flushes on vega/navi
- dcefclk is not adjustable on navi1x and newer
- MST HPD debugfs fix
- Suspend/resumes fixes
- Register VGA clients late in case driver fails to load
- Fix GEM leak in user framebuffer create
- Add support for polaris12 with 32 bit memory interface
- Fix duplicate cursor issue when using overlay
- Fix corruption with tiled surfaces on VCN3
- Add BO size and stride check to fix BO size verification

radeon:
- Fix off-by-one in power state parsing
- Fix possible memory leak in power state parsing

msm:
- NULL ptr dereference fix

fbdev:
- procfs disabled warning fix

i915:
- gvt: Fix a possible division by zero in vgpu display rate calculation
The following changes since commit 1cd6b4a04f038eb24fd18c8010e763d1140a9c7a=
:

  Merge tag 'drm-intel-next-fixes-2021-04-27' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next (2021-04-30
10:42:03 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2021-05-10

for you to fetch changes up to 0844708ac3d2dbdace70f4a6020669d56958697f:

  Merge tag 'amd-drm-fixes-5.13-2021-05-05' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-05-07
12:44:51 +1000)

----------------------------------------------------------------
drm fixes for 5.13-rc1

amdgpu:
- MPO hang workaround
- Fix for concurrent VM flushes on vega/navi
- dcefclk is not adjustable on navi1x and newer
- MST HPD debugfs fix
- Suspend/resumes fixes
- Register VGA clients late in case driver fails to load
- Fix GEM leak in user framebuffer create
- Add support for polaris12 with 32 bit memory interface
- Fix duplicate cursor issue when using overlay
- Fix corruption with tiled surfaces on VCN3
- Add BO size and stride check to fix BO size verification

radeon:
- Fix off-by-one in power state parsing
- Fix possible memory leak in power state parsing

msm:
- NULL ptr dereference fix

fbdev:
- procfs disabled warning fix

i915:
- gvt: Fix a possible division by zero in vgpu display rate calculation

----------------------------------------------------------------
Bas Nieuwenhuizen (2):
      drm/amdgpu: Init GFX10_ADDR_CONFIG for VCN v3 in DPG mode.
      drm/amdgpu: Use device specific BO size & stride check.

Christian K=C3=B6nig (1):
      drm/amdgpu: fix concurrent VM flushes on Vega/Navi v2

Colin Xu (1):
      drm/i915/gvt: Prevent divided by zero when calculating refresh rate

Darren Powell (2):
      amdgpu/pm: Prevent force of DCEFCLK on NAVI10 and SIENNA_CICHLID
      amdgpu/pm: set pp_dpm_dcefclk to readonly on NAVI10 and newer gpus

Dave Airlie (3):
      Merge tag 'drm-intel-next-fixes-2021-04-30' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-fixes-2021-05-06' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'amd-drm-fixes-5.13-2021-05-05' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

Evan Quan (1):
      drm/amdgpu: add new MC firmware for Polaris12 32bit ASIC

Guenter Roeck (1):
      fbmem: Mark proc_fb_seq_ops as __maybe_unused

Harry Wentland (1):
      drm/amd/display: Reject non-zero src_y and src_x for video planes

Jani Nikula (1):
      Merge tag 'gvt-next-fixes-2021-04-29' of
https://github.com/intel/gvt-linux into drm-intel-next-fixes

Kai-Heng Feng (1):
      drm/amdgpu: Register VGA clients after init can no longer fail

Kees Cook (2):
      drm/radeon: Fix off-by-one power_state index heap overwrite
      drm/radeon: Avoid power table parsing memory leaks

Mikita Lipski (1):
      drm/amd/display: fix wrong statement in mst hpd debugfs

Pavan Kumar Ramayanam (1):
      drm/amdgpu: Handling of amdgpu_device_resume return value for
graceful teardown

Rob Clark (1):
      drm/msm/dpu: Delete bonkers code

Rodrigo Siqueira (1):
      drm/amd/display: Fix two cursor duplication when using overlay

Simon Ser (1):
      amdgpu: fix GEM obj leak in amdgpu_display_user_framebuffer_create

Tom Rix (1):
      drm/amd/pm: initialize variable

Victor Zhao (1):
      drm/amdgpu: fix r initial values

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  28 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        | 184 +++++++++++++++++=
+++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |  19 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |  13 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |   4 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  68 ++++++++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   2 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  10 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   5 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   4 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  10 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  16 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |   6 -
 drivers/gpu/drm/radeon/radeon_atombios.c           |  26 ++-
 drivers/video/fbdev/core/fbmem.c                   |   2 +-
 19 files changed, 332 insertions(+), 81 deletions(-)
