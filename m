Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF51525AF2
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 07:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D1210F826;
	Fri, 13 May 2022 05:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E694310F826
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 05:08:07 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ch13so13963951ejb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 22:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Sz00vPcQHDBQVtuU0sPD4tpJzhuX360WEPKPVTTI6mM=;
 b=NxCRYfUET+ljK8C7QT/Zi2kIk6j7cFOFyBLhaSlkWgWvemYExHG8cFawL7rZZ7fIzR
 /4CRl9A2wU1sb8qtzpEjoDQSL0KhMeJ8i5d3NYeawooZ8OVAsKIRT17jq4IZPe0R/mX1
 80Os4YjeHH9bAXE6nuuZPJEDZ4/dNN3hLAALv/DGiCZ11bVI49U49EqWw4RjqfWuwOjB
 sBcB0O9+W24fWEUj79dCjayULaO24c2oNFjzieGLadHOYX/7CKk2lEHq0hf+IAcUSXfw
 pXtdeh2ZSpg+s2x3x/CfM1Rndz2WTLC2WSkDjKkCOVuxx37fiKfN/l09VtSWVlo6+d1Z
 ITow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Sz00vPcQHDBQVtuU0sPD4tpJzhuX360WEPKPVTTI6mM=;
 b=PbUc9IGK9gNR2/Z//d/a5WG/MdSC55geEM6/xrAtCzFO6hcLHgWJ4KVQoBb/tcW40v
 zffpOT2xwzLUp+AZcCj2ZDO92rU4iJV8dFm8QCFzIsJPPFjnwcBkplOeHRgL4bKfgwlq
 D5Vxx4UTqKKODilsLAm/5w1SxfZ+KuZtZhDUUywqd1lAKV3xevXFsS6fq+jyu5UWCfhM
 +4HmwOOnqa61Tnl3b9GUM4JMBS50jySxxbh1A81wjm3IUJmWdq1NL20osmHQ0Jd2ViRQ
 DXVpK09FQaSQYKchCnY6e4s2avMo8Rx0uDipqHiF63CaBF2RAI5NabprPP/fKJjK2cst
 Nbjw==
X-Gm-Message-State: AOAM5335ircTmdSkwRQxBW22wMQjSI4LfnhGkMCWPwDzQiU3nJwAlePS
 gehcOjorxJ6IRR/1nFV2biHrmLxAc930Uox1PlI=
X-Google-Smtp-Source: ABdhPJzi7zabwbrDmSfS0Dx8bhCJ47/rHtiPXNIVl3rCexpbkpUcW1dks+I5Y3JDMnhaqPlj/GxztJOk5s5m/7acUVQ=
X-Received: by 2002:a17:907:1c0b:b0:6f5:64f4:91df with SMTP id
 nc11-20020a1709071c0b00b006f564f491dfmr2740216ejc.750.1652418486338; Thu, 12
 May 2022 22:08:06 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 13 May 2022 15:07:55 +1000
Message-ID: <CAPM=9twJK9u=8+8UMtTRvxe4yUkSQBcOLa_gzB+Me3W=qoOv4A@mail.gmail.com>
Subject: [git pull] drm fixes for 5.18-rc7
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

Pretty quiet week on the fixes front, 4 amdgpu and one i915 fix.

I think there might be a few misc fbdev ones outstanding, but I'll see
if they are necessary and pass them on if so.

Dave.

drm-fixes-2022-05-13:
drm fixes for 5.18-rc7

amdgpu:
- Disable ASPM for VI boards on ADL platforms
- S0ix DCN3.1 display fix
- Resume regression fix
- Stable pstate fix

i915:
- fix for kernel memory corruption when running a lot of OpenCL tests
in parallel
The following changes since commit c5eb0a61238dd6faf37f58c9ce61c9980aaffd7a:

  Linux 5.18-rc6 (2022-05-08 13:54:17 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-05-13

for you to fetch changes up to 5005e9814698f47c5a3698fcc56c9f5e6f1d4644:

  Merge tag 'amd-drm-fixes-5.18-2022-05-11' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2022-05-13
10:40:56 +1000)

----------------------------------------------------------------
drm fixes for 5.18-rc7

amdgpu:
- Disable ASPM for VI boards on ADL platforms
- S0ix DCN3.1 display fix
- Resume regression fix
- Stable pstate fix

i915:
- fix for kernel memory corruption when running a lot of OpenCL tests
in parallel

----------------------------------------------------------------
Alex Deucher (2):
      Revert "drm/amd/pm: keep the BACO feature enabled for suspend"
      drm/amdgpu/ctx: only reset stable pstate if the user changed it (v2)

Dave Airlie (2):
      Merge tag 'drm-intel-fixes-2022-05-12' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-5.18-2022-05-11' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Eric Yang (1):
      drm/amd/display: undo clearing of z10 related function pointers

Karol Herbst (1):
      drm/i915: Fix race in __i915_vma_remove_closed

Richard Gong (1):
      drm/amdgpu: vi: disable ASPM on Intel Alder Lake based systems

 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c           |  5 +++++
 drivers/gpu/drm/amd/amdgpu/vi.c                   | 17 ++++++++++++++++-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c |  5 -----
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c         |  8 +-------
 drivers/gpu/drm/i915/i915_vma.c                   | 11 +++++++----
 5 files changed, 29 insertions(+), 17 deletions(-)
