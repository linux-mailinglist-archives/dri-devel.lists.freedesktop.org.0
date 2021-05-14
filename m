Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D093538126D
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 23:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09086E311;
	Fri, 14 May 2021 21:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7B66E311
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 21:02:56 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id r11so29765edt.13
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 14:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=ProY55k5ekiZ8lOnAY4fJDoMbyGsmSug4xwolpHstgY=;
 b=RIjK/rkqtB7BQ4HcjQDYq/sHK0SVPr8GXSNY1nXO4C0hDtZ4lnwAOsOc2PaVwJKuRA
 nS7L7KXf1lygsL/PDuaeGzhN4FPFU539jnps2JiQpZzz08A1RiUwea4fnXNToMipzULl
 wzwmuKR8/kZQ4dEWKYSHPBIc19j9v2iUUy8e+sa6Fg1gXZf8n/RhXDdHbtc/auELaAZ8
 vklGuRMZYlfHkhAyeFt3YqL6hGKzcELYq4PF65+fDVtf7BvW5BYvkpnRgNrT0aWgmhn+
 wjEvipPB9Mkp4771cy7uHspENGmSnO9jCMcBeou2PBhSGTVF2MhTbghNcWtz88q3jdZw
 l4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=ProY55k5ekiZ8lOnAY4fJDoMbyGsmSug4xwolpHstgY=;
 b=shirVsgsdliUDdaSjR+u0/lhzsCCH6inYyvkeoyS8+VIDaKx4Vj6/yTFJZI3BaFTMp
 0jxjVOK3YS7+c1nokL/s5lMiq2GpTEv7FOot4+AGstJ40prkIeVhX5mWCqfjQjbtBZXX
 0gjObkIJUNBTh3qjmLbtKT0TGps298dr46RbOjSFcaLRO2PHuoN+sdQeGXCSP4sB0nzE
 qnkug5mYdENUYPL6n4LHcCG5sPg2Pae9JQg3732XQhDjvACP3DiMrvFRemOH5Ul8qh9O
 Wf5nViKSLigZ5L+s7SpIVGoauPct085D4P3tXhaGGwEg0BLf5bgU423kMkw4gCH0gH5R
 dQIg==
X-Gm-Message-State: AOAM532p4XlEA3Ix0Eagqf13Obckr4yDV7SAtMFCVAiNDRGUx2Nalb9U
 E54xtovIKHbufW0Z5f7YHkXSxO2a7TGSODsHXRZEyN5O6dM=
X-Google-Smtp-Source: ABdhPJwkjffJer2TwFDBA4jdDZ2QpUBoL1vVxFiJIQNI52ubpGqhn/brKjvnj4e4NwrB9PQo2kHTxICndbzHh3C4vVY=
X-Received: by 2002:a05:6402:441:: with SMTP id
 p1mr58502908edw.298.1621026175577; 
 Fri, 14 May 2021 14:02:55 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 15 May 2021 07:02:44 +1000
Message-ID: <CAPM=9tyEzE01K43mAfz3Wv+M0Q7n+3rHriNboSWcjEERy1Hxig@mail.gmail.com>
Subject: [git pull] drm fixes for 5.13-rc2 (part two)
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

Hey,

Looks like I wasn't the only one not fully switched on this week, the
msm pull has a missing tag so I missed it, and i915 team were a bit
late. In my defence I did have a day with the roof of my home office
removed, so was sitting at my kids desk.

Dave.

drm-fixes-2021-05-15:
drm fixes for 5.13-rc2 (part two)

msm:
- dsi regression fix
- dma-buf pinning fix
- displayport fixes
- llc fix

i915:
- Fix active callback alignment annotations and subsequent crashes
- Retract link training strategy to slow and wide, again
- Avoid division by zero on gen2
- Use correct width reads for C0DRB3/C1DRB3 registers
- Fix double free in pdp allocation failure path
- Fix HDMI 2.1 PCON downstream caps check
The following changes since commit 08f0cfbf739a5086995f0779bbcb607163128a9a=
:

  Merge tag 'amd-drm-fixes-5.13-2021-05-13' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2021-05-14
09:20:04 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-05-15

for you to fetch changes up to 5dce58de4be8a4c9f2af3beed3ee9813933a0583:

  Merge tag 'drm-msm-fixes-2021-05-09' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes (2021-05-15
06:52:15 +1000)

----------------------------------------------------------------
drm fixes for 5.13-rc2 (part two)

msm:
- dsi regression fix
- dma-buf pinning fix
- displayport fixes
- llc fix

i915:
- Fix active callback alignment annotations and subsequent crashes
- Retract link training strategy to slow and wide, again
- Avoid division by zero on gen2
- Use correct width reads for C0DRB3/C1DRB3 registers
- Fix double free in pdp allocation failure path
- Fix HDMI 2.1 PCON downstream caps check

----------------------------------------------------------------
Ankit Nautiyal (1):
      drm/i915: Use correct downstream caps for check Src-Ctl mode for PCON

Dave Airlie (2):
      Merge tag 'drm-intel-fixes-2021-05-14' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'drm-msm-fixes-2021-05-09' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes

Dmitry Baryshkov (2):
      drm/msm/dsi: dsi_phy_28nm_8960: fix uninitialized variable access
      drm/msm/dsi: fix msm_dsi_phy_get_clk_provider return code

Jonathan Marek (2):
      drm/msm: fix LLC not being enabled for mmu500 targets
      drm/msm: fix minor version to indicate MSM_PARAM_SUSPENDS support

Kai-Heng Feng (1):
      drm/i915/dp: Use slow and wide link training for everything

Kuogee Hsieh (2):
      drm/msm/dp: check sink_count before update is_connected status
      drm/msm/dp: initialize audio_comp when audio starts

Lv Yunlong (1):
      drm/i915/gt: Fix a double free in gen8_preallocate_top_level_pdp

Rob Clark (1):
      drm/msm: Do not unpin/evict exported dma-buf's

St=C3=A9phane Marchesin (1):
      drm/i915: Fix crash in auto_retire

Tvrtko Ursulin (1):
      drm/i915/overlay: Fix active retire callback alignment

Ville Syrj=C3=A4l=C3=A4 (2):
      drm/i915: Avoid div-by-zero on gen2
      drm/i915: Read C0DRB3/C1DRB3 as 16 bits again

 drivers/gpu/drm/i915/display/intel_dp.c         | 61 +++------------------=
----
 drivers/gpu/drm/i915/display/intel_overlay.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c        |  2 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c            |  1 -
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c    |  4 +-
 drivers/gpu/drm/i915/i915_active.c              |  3 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c           |  9 ++--
 drivers/gpu/drm/msm/dp/dp_audio.c               |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c             | 26 +++++++----
 drivers/gpu/drm/msm/dp/dp_display.h             |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           |  2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  4 ++
 drivers/gpu/drm/msm/msm_drv.c                   |  2 +-
 drivers/gpu/drm/msm/msm_gem.c                   | 16 ++++++-
 drivers/gpu/drm/msm/msm_gem.h                   |  4 +-
 15 files changed, 59 insertions(+), 79 deletions(-)
