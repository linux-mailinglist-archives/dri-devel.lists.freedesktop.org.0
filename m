Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F8E4BAA86
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 21:02:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F4010E758;
	Thu, 17 Feb 2022 20:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44CE10E74B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 20:02:37 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id d10so9784527eje.10
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 12:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=zwB/h69xW9yj6Ty8TGYAgMTvzI7yKl/J6os7tmVG8hk=;
 b=Z6IM4n7D7BR9Azbk64T0ST0aio5CB7tJz7DsneFlHEelJGIhtviGck7LlX1t3tlagp
 ymZ5jSHPl6DTKnZzFJbpeyCIKJjUn9gdwqQ15NRowfE9gclPXyZ0RCOmhhKYAQLQeGAd
 73QJABrkI53ibMqiZehK3/n4+KHh9f8HQjODcZUHsHUnzGADQndVAlQJb5YVCQiDbEfk
 YzjjLLxw/Kl33ZQ9TEIdYKZ5VghGZjKM1wDRSH5WpQ63oGKcddP9RhmFGqhhWrPs1S+Q
 +orA1dgQwJKv0l38Nw38C2H8jAmGffJelzJX819WGYePjuQOBJLlKnBgDdm80OAZcKyL
 yNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=zwB/h69xW9yj6Ty8TGYAgMTvzI7yKl/J6os7tmVG8hk=;
 b=XoBTgjogXO07wC1TqjQ3YjWSYBqBGX7H9rKYRQiLRxXxEvwGaB3Bi3JHrCtQWErEJH
 x0Ymbo9MSpaIQ/tId+4/Y2GEoKZaE5amnd7epl/op0JH14sFO/czuDkazksnWk895YS/
 VfVJVgn1Pfeq88HZrJraM6vb8zTAY5w2r0aRZ4g9+ulvEYyy9+MB35EuT/MBhAas9jFf
 qUo4YwFlNiUOBBlJosjWT4BRxsyGhz5MJiAtabAb7LFZwshsCntPNxCYMA3RE3sXCW9C
 Qb4RpEeTdvmNO0foaawkaE7pnfrpefWpn+QtGW7OsCZ8lQhX8J2PHvvCQRRR9OoHY+fF
 QFCQ==
X-Gm-Message-State: AOAM532OzghbA1dt14ys2PpUciRA34zffDQ1V3QQgBml5uHOuhT1rF04
 7Bq1DePO/u1+QU7pUSzPZYvjz0WH/y26rJ9+GIk=
X-Google-Smtp-Source: ABdhPJxOTCX50FPYU2SSNKeEDAse+q/1hNmgI0XWl4xuaRlfsPIq7hYUBJcblG+UZyKb12ZIri+Xv87Nht0LBXJ64B4=
X-Received: by 2002:a17:906:cd17:b0:6ce:3727:65f2 with SMTP id
 oz23-20020a170906cd1700b006ce372765f2mr3743532ejb.720.1645128156006; Thu, 17
 Feb 2022 12:02:36 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 18 Feb 2022 06:02:24 +1000
Message-ID: <CAPM=9txai3TyGC3KHjkjLi6UMC-vKRoPJ8p+UpNKXy6Km=1jNQ@mail.gmail.com>
Subject: [git pull] drm fixes for 5.17-rc5
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

Regular fixes for rc5, nothing really stands out, mostly some amdgpu
and i915 fixes with mediatek, radeon and some misc fixes.

Dave.

drm-fixes-2022-02-18:
drm fixes for 5.17-rc5

cma-helper:
- set VM_DONTEXPAND

atomic:
- error handling fix.

mediatek:
- fix probe defer loop with external bridge

amdgpu:
- Stable pstate clock fixes for Dimgrey Cavefish and Beige Goby
- S0ix SDMA fix
- Yellow Carp GPU reset fix

radeon:
- Backlight fix for iMac 12,1

i915:
- GVT kerneldoc cleanup.
- GVT Kconfig should depend on X86
- Prevent out of range access in SWSCI display code.
- Fix mbus join and dbuf slice config lookup.
- Fix inverted priority selection in the TTM backend.
- Fix FBC plane end Y offset check.
The following changes since commit 754e0b0e35608ed5206d6a67a791563c631cec07=
:

  Linux 5.17-rc4 (2022-02-13 12:13:30 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-02-18

for you to fetch changes up to 5666b610194705587807a1078753eadc007b9d79:

  Merge tag 'drm-intel-fixes-2022-02-17' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2022-02-18
05:44:45 +1000)

----------------------------------------------------------------
drm fixes for 5.17-rc5

cma-helper:
- set VM_DONTEXPAND

atomic:
- error handling fix.

mediatek:
- fix probe defer loop with external bridge

amdgpu:
- Stable pstate clock fixes for Dimgrey Cavefish and Beige Goby
- S0ix SDMA fix
- Yellow Carp GPU reset fix

radeon:
- Backlight fix for iMac 12,1

i915:
- GVT kerneldoc cleanup.
- GVT Kconfig should depend on X86
- Prevent out of range access in SWSCI display code.
- Fix mbus join and dbuf slice config lookup.
- Fix inverted priority selection in the TTM backend.
- Fix FBC plane end Y offset check.

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      drm/mediatek: mtk_dsi: Avoid EPROBE_DEFER loop with external bridge

Dave Airlie (4):
      Merge tag 'mediatek-drm-fixes-5.17' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-fixes
      Merge tag 'amd-drm-fixes-5.17-2022-02-16' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2022-02-17' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2022-02-17' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Evan Quan (1):
      drm/amd/pm: correct UMD pstate clocks for Dimgrey Cavefish and Beige =
Goby

Jani Nikula (1):
      drm/i915/opregion: check port number bounds for SWSCI display power s=
tate

Matthew Auld (1):
      drm/i915/ttm: tweak priority hint selection

Nicholas Bishop (1):
      drm/radeon: Fix backlight control on iMac 12,1

Rajib Mahapatra (1):
      drm/amdgpu: skipping SDMA hw_init and hw_fini for S0ix.

Randy Dunlap (1):
      drm/i915/gvt: clean up kernel-doc in gtt.c

Robin Murphy (1):
      drm/cma-helper: Set VM_DONTEXPAND for mmap

Siva Mullati (1):
      drm/i915/gvt: Make DRM_I915_GVT depend on X86

Tvrtko Ursulin (1):
      Merge tag 'gvt-fixes-2022-01-13' of
https://github.com/intel/gvt-linux into drm-intel-fixes

Ville Syrj=C3=A4l=C3=A4 (4):
      drm/i915: Fix dbuf slice config lookup
      drm/i915: Fix mbus join config lookup
      drm/i915/fbc: Fix the plane end Y offset check
      drm/atomic: Don't pollute crtc_state->mode_blob with error pointers

Yifan Zhang (1):
      drm/amd/pm: correct the sequence of sending gpu reset msg

 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   8 +
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  26 +++-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.h    |   8 +
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |   9 +-
 drivers/gpu/drm/drm_atomic_uapi.c                  |  14 +-
 drivers/gpu/drm/drm_gem_cma_helper.c               |   1 +
 drivers/gpu/drm/i915/Kconfig                       |   1 +
 drivers/gpu/drm/i915/display/intel_fbc.c           |   3 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |  15 ++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |   6 +-
 drivers/gpu/drm/i915/gvt/gtt.c                     |   4 +-
 drivers/gpu/drm/i915/intel_pm.c                    |   4 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 | 167 +++++++++++------=
----
 drivers/gpu/drm/radeon/atombios_encoders.c         |   3 +-
 14 files changed, 158 insertions(+), 111 deletions(-)
