Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5111251CFF9
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 06:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E08210FC78;
	Fri,  6 May 2022 04:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B08A10FC78
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 04:07:33 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id k27so7330166edk.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 21:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=cLcttw2920SMZ2n3SvaPxUs5yeqm04dyc2xN9TwYgGg=;
 b=H0rUhC/o61g+LPERuMJDEwuzobWN7hEXMEAVbqwLU4GgZXPU4LVCQOQi+4GEah1j+Z
 PkzTBpYrAdApKrKW1U8j7bVri8W2sY2DAsBEHHFFmj89FB5ICYNuCn0GXYpeuoxDmlZ0
 u0emupYpj0g5LSKXIsbZ5LII/5KSKEW2nXlenDvUT+HFuGVuSRu8dGvicLCC1hXofx65
 gh051ykeIndWqX3fhshCr/aM5gFpclqai00hmokkPAKHic3iycx2Z+vJuzdAuDVgWUFn
 MgV60H62Zjy9WRcEoVIpwzX/FmB5Hz3tA5+Kql1s2rQa1FP5sXTFgPJveJOlo36oicuE
 uL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=cLcttw2920SMZ2n3SvaPxUs5yeqm04dyc2xN9TwYgGg=;
 b=n+EbPZV6QCT8NvcorgkQJu0smcSA/1XF/iNaeEV7a78UugwcXS7RM8vobKncBEEKAX
 03clse+wQZFlXsyFUFGJrpawsR2F/6VBQBJ3VzeZ1fmPfYho86misIDWYyOglCbG/vn5
 FYLOlJIYqhCTKIeHQBqzPoTuQ74Rg8uwob3ZOzntDzNw1d+pGS1vDQLXhr7Eb5ReVX3k
 PTz4AWkVok9DCOq+vsy2cWRIl17W/lBXsgNh2UreaSkq1w2h/KmwBPn2Vsqlta5EgAOT
 +k8Mont6L2kILPaFjEBKh+DUJ3Ly1i67x57RxcGEp8etV9i9wbK370hgThA/DRVByKHt
 uAJg==
X-Gm-Message-State: AOAM532EwvWAMft7sPtx/kP+pF9pEQgwaoj37nsMIneQl/NL0fYywmLY
 w6H/rkFFW25CPTSPt3m2ky7cnqVy2PJdJfbAcBI=
X-Google-Smtp-Source: ABdhPJwFg74w+azIwCGOdyFimmGh1zS5rojdBALGCLHvuKbQPhMvOvqk0h/4nvErkuD3/hrSDWlOAhxQxnRUd2jxy5o=
X-Received: by 2002:aa7:dd91:0:b0:427:b2c4:1c7a with SMTP id
 g17-20020aa7dd91000000b00427b2c41c7amr1540787edv.91.1651810051855; Thu, 05
 May 2022 21:07:31 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 6 May 2022 14:07:20 +1000
Message-ID: <CAPM=9tyaQ8RSYwuh4muEefV3fbjio5gVvYipWVaKjqUycRkS+A@mail.gmail.com>
Subject: 
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

pretty quiet week, one fbdev, msm, kconfig, and 2 amdgpu fixes, about
what I'd expect for rc6.

Regards,
Dave.

drm-fixes-2022-05-06:
drm fixes for 5.18-rc6

fbdev:
- hotunplugging fix

amdgpu:
- Fix a xen dom0 regression on APUs
- Fix a potential array overflow if a receiver were to
  send an erroneous audio channel count

msm:
- lockdep fix.

it6505:
- kconfig fix
The following changes since commit 672c0c5173427e6b3e2a9bbb7be51ceeec78093a=
:

  Linux 5.18-rc5 (2022-05-01 13:57:58 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-05-06

for you to fetch changes up to 5727375215b0915f28806c337a7ba9835efd340b:

  Merge tag 'drm-msm-fixes-2022-04-30' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes (2022-05-06
11:22:03 +1000)

----------------------------------------------------------------
drm fixes for 5.18-rc6

fbdev:
- hotunplugging fix

amdgpu:
- Fix a xen dom0 regression on APUs
- Fix a potential array overflow if a receiver were to
  send an erroneous audio channel count

msm:
- lockdep fix.

it6505:
- kconfig fix

----------------------------------------------------------------
Dave Airlie (3):
      Merge tag 'amd-drm-fixes-5.18-2022-05-04' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2022-05-05' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-msm-fixes-2022-04-30' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes

Fabien Parent (1):
      drm/bridge: ite-it6505: add missing Kconfig option select

Harry Wentland (1):
      drm/amd/display: Avoid reading audio pattern past AUDIO_CHANNELS_COUN=
T

Javier Martinez Canillas (1):
      fbdev: Make fb_release() return -ENODEV if fbdev was unregistered

Kuogee Hsieh (1):
      drm/msm/dp: remove fail safe mode related code

Marek Marczykowski-G=C3=B3recki (1):
      drm/amdgpu: do not use passthrough mode in Xen dom0

 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c         |  4 +++-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c |  2 +-
 drivers/gpu/drm/bridge/Kconfig                   |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c              |  6 ------
 drivers/gpu/drm/msm/dp/dp_panel.c                | 11 -----------
 drivers/gpu/drm/msm/dp/dp_panel.h                |  1 -
 drivers/video/fbdev/core/fbmem.c                 |  5 ++++-
 7 files changed, 9 insertions(+), 21 deletions(-)
