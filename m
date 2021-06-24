Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C973B37AC
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 22:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E986ECCE;
	Thu, 24 Jun 2021 20:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC246ECCE
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 20:17:34 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id bg14so11387452ejb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 13:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=EfSHQRlvaEgpVUWXkzLg8PjnVC4z8USfK0FstMn9aAg=;
 b=H9X5EFeM2RA8c73WDTTHjkI2Ch9pZ98aopuFblhijJBbmxCvfaO4bUvBIWDX7FQThL
 jbeUzx6Lo2VsdEwTIFUm3EjGKmg1DlNWS1TkxlK3oojDL31h/w0fQfQaODN4rZPSjDDM
 sw2vq+X8I9hKcmSb9HipTfyI2QCppQcuGV8ouvlriEYmKxyeJBlNqEgei39JpVcCmdzk
 CE8C9XBj3k9fPGLKdoJkT5a3tIUu0UCymkNQx/4zdIKJtxL5TpGMNqDTe1m493PpxhdT
 wv8Pc+mK4IvAbb+eLbnJ24fOOllZI8uMgKlQuIfPAdzuFYSp52T24wqSiKPyHbmws5fD
 n/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=EfSHQRlvaEgpVUWXkzLg8PjnVC4z8USfK0FstMn9aAg=;
 b=aogT7BsCLHFXMMp+H4RLOUUxT2lwpjViyGnGQl8xArXyfx6j+c6wQhVFvXEBafobgS
 XrfCCQY79HoT/hVmTA0hA4tFj4bwXsYYVktcBDlXk8F4IYzXAd8C1W7/+6KC6oZXLQtV
 wO3FUAVcCeA7CTY76ruzCw5k3h9qSGz9r0WVVmiVQ5TG9kngFi/cD9S8VvPn+F32Bc4E
 6GFk0CdIZ9rZWJkSNCObf8zPnZ3biExABo6UO/i4pFAyLwQx+fAHfWcNdL/lqK3F07yH
 cksvZHbDzQemkVfQwH3LkIFxeDT166JqWEhVFTZixGfxYd2KnQjZHlKF7aJOJVXOz5LA
 VHdQ==
X-Gm-Message-State: AOAM532tALFmsNLHXHK/Qwv7QYef8Zoy119Fl1d3GfvDOsG0m1abD4m5
 NDB1b8ed7TF+hbLjjqcXLoYZdgzmMyChh1XRXI4=
X-Google-Smtp-Source: ABdhPJwQa4Ju0tf4msAPgZCRDlWCxSjjyeuZ/aYP0npu0K9cZUgs7CvxAcjQwcEFGvZ5E6YPcQ7rwbH6waCHs5kpaWg=
X-Received: by 2002:a17:906:af08:: with SMTP id
 lx8mr7170446ejb.317.1624565853470; 
 Thu, 24 Jun 2021 13:17:33 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 25 Jun 2021 06:17:22 +1000
Message-ID: <CAPM=9ty9+nYh5JC-gw5Pf8u1QaYwr2PFcOKobohQz-RGaCP3mw@mail.gmail.com>
Subject: [git pull] drm fixes for 5.13-rc8/final
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

Hi Linus,

This is a bit bigger than I'd like at this stage, and I guess last
week was extra quiet, but it's mostly one fix across 3 drivers to wait
for buffer move pinning to complete. There was one locking change that
got reverted so it's just noise. Otherwise the amdgpu/nouveau changes
are for known regressions, and otherwise it's just misc changes in
kmb/atmel/vc4 drivers.

I'm off for a few days (have email for some of it), but I'll be back
mid next week for hopefully the next PR.

Dave.

drm-fixes-2021-06-25:
drm fixes for 5.13-rc8/final

radeon/nouveau/amdgpu/ttm:
- same fix in 3 drivers to wait for BO to be pinned after
  moving it.

core:
- auth locking change + brown paper bag revert

amdgpu:
- Revert GFX9, 10 doorbell fixes, we just
  end up trading one bug for another
- Potential memory corruption fix in framebuffer handling

nouveau:
- fix regression checking dma addresses

kmb:
- error return fix

atmel-hlcdc:
- fix kernel warnings at boot
- enable async flips

vc4:
- fix CPU hang due to power management
The following changes since commit 13311e74253fe64329390df80bed3f07314ddd61=
:

  Linux 5.13-rc7 (2021-06-20 15:03:15 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-06-25

for you to fetch changes up to 5e0e7a407675d9f50f1d840214beaec42293b79b:

  Merge tag 'drm-misc-fixes-2021-06-24' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2021-06-25
06:05:13 +1000)

----------------------------------------------------------------
drm fixes for 5.13-rc8/final

radeon/nouveau/amdgpu/ttm:
- same fix in 3 drivers to wait for BO to be pinned after
  moving it.

core:
- auth locking change + brown paper bag revert

amdgpu:
- Revert GFX9, 10 doorbell fixes, we just
  end up trading one bug for another
- Potential memory corruption fix in framebuffer handling

nouveau:
- fix regression checking dma addresses

kmb:
- error return fix

atmel-hlcdc:
- fix kernel warnings at boot
- enable async flips

vc4:
- fix CPU hang due to power management

----------------------------------------------------------------
Christian K=C3=B6nig (4):
      drm/nouveau: wait for moving fence after pinning v2
      drm/radeon: wait for moving fence after pinning
      drm/amdgpu: wait for moving fence after pinning
      drm/nouveau: fix dma_address check for CPU/GPU sync

Dan Sneddon (2):
      drm: atmel_hlcdc: Enable the crtc vblank prior to crtc usage.
      drm/atmel-hlcdc: Allow async page flips

Daniel Vetter (1):
      Revert "drm: add a locked version of drm_is_current_master"

Dave Airlie (2):
      Merge tag 'amd-drm-fixes-5.13-2021-06-21' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2021-06-24' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Desmond Cheong Zhi Xi (1):
      drm: add a locked version of drm_is_current_master

Krzysztof Kozlowski (1):
      drm/panel: ld9040: reference spi_device_id table

Maxime Ripard (2):
      drm/vc4: hdmi: Move the HSM clock enable to runtime_pm
      drm/vc4: hdmi: Make sure the controller is powered in detect

Michel D=C3=A4nzer (1):
      drm/amdgpu: Call drm_framebuffer_init last for framebuffer init

Yifan Zhang (2):
      Revert "drm/amdgpu/gfx10: enlarge CP_MEC_DOORBELL_RANGE_UPPER to
cover full doorbell."
      Revert "drm/amdgpu/gfx9: fix the doorbell missing when in CGPG issue.=
"

Zhen Lei (1):
      drm/kmb: Fix error return code in kmb_hw_init()

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c    | 12 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c    | 14 +++++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c         |  6 +---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c          |  6 +---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 17 ++++++----
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c   |  1 +
 drivers/gpu/drm/kmb/kmb_drv.c                  |  1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c           |  4 +--
 drivers/gpu/drm/nouveau/nouveau_prime.c        | 17 +++++++++-
 drivers/gpu/drm/panel/panel-samsung-ld9040.c   |  1 +
 drivers/gpu/drm/radeon/radeon_prime.c          | 16 ++++++++--
 drivers/gpu/drm/vc4/vc4_hdmi.c                 | 44 ++++++++++++++++++++--=
----
 12 files changed, 100 insertions(+), 39 deletions(-)
