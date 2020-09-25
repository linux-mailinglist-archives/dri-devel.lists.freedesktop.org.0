Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D88BD277DB7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 03:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D136E11E;
	Fri, 25 Sep 2020 01:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA2E6E11E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 01:45:17 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id r7so1377734ejs.11
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 18:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=OIz6/ORhAIJp1gRpHaBfwrrhOvDcKKYo5RAAhFMxaBk=;
 b=Ad/T2Yn8/tI1sTm2Qz1yl1jr9vlwjQNGk7/C6g96RsgMLhkpgCx/dArtcNoOozakPL
 0lcaHSQvWfGfKYojFn/kcN9fvSJQtjui4kOXD7BU/U2pPFuIRTUjJdtGGBdLSSzdm2SF
 X1HfdTrMls/5z4Vts5pk9FVJGssYypz0sD/bWVc6WZ5h7SgOopcOgvAreSIYPmBTpjfk
 ZedGzYI/IFVMTuS8QAFkeGJptmGyUcGcXxedclNjj+tx/TqQ+TNzx9rkLVzd9sQsg2Af
 /X4kQK7EoexOVG4r11A3P1mL51I7vD+O0o3+w397Nb1BVguP0oYn1ERzpJ5PCty7tjSO
 ldyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=OIz6/ORhAIJp1gRpHaBfwrrhOvDcKKYo5RAAhFMxaBk=;
 b=n/7KuVZbsvEFmICFtrUAWdR8G7qPgtZbO2qNFlRbrmESy59QFgnolN9XDy0TlP5iUl
 nJ8gICVEBfzr5ot5UPBquReZgumwq6lgR2jPRlVbe8QRHghrlTBApAiMmjYzkY1IcLlB
 HBrJgyNDbB+wa7ZLcTpIZQpzUAERU4iyhGofe1bv+YYzZ5gLz/Xpd2rPUZ0AHk+opvFD
 9uAOuz0oAsNnHtnE0kCv9lk2Gktmj727KSkW0chwM9oQhMnnCmA4TkzljD1oZXAA7OcJ
 4lJ0n9YcMw9JR2OunkvY7wNvwQl4RzTmJq05XLJ36NhpH197rf5tJJqj0imYua585knU
 9TRg==
X-Gm-Message-State: AOAM5309tW8s1v3zzkEuv3HzW+meSeGNczhWtXzu8IToQnwZtkQQRbG0
 Xc5m3KtzcgS/utwGFfLFG0dKZkYqJTy7ggRExG4=
X-Google-Smtp-Source: ABdhPJwZn6N4c3vYDY6ZTdR14hIl2y4PrO3Hu3OXw0ANzVwYMtjumff0Wooqgzfq8iigJC3v2WTeI1k8n3xyEYDR5Tc=
X-Received: by 2002:a17:906:3aca:: with SMTP id
 z10mr440277ejd.419.1600998315856; 
 Thu, 24 Sep 2020 18:45:15 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 25 Sep 2020 11:45:04 +1000
Message-ID: <CAPM=9tzV6xvuqq9wnzhUY+qQPj9Q5K0BMpJX+7YUKX_a-EJTLA@mail.gmail.com>
Subject: [git pull] drm fixes for 5.9-rc7
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Due to the dax merge fail in rc6, this has two backmerges, Intel
pulled in a later point in time to fix their CI systems, I also pulled
in an earlier point to fix my local builds.

Otherwise fairly quiet, a couple of i915 fixes, one dma-buf fix, one
vc4 and two sun4i changes.

I realised I missed the sun4i + vc4 fixes in the tag itself. They are below.

Dave.

vc4:
- fill asoc card owner

sun4i:
- program secondary CSC correctly.

drm-fixes-2020-09-25:
drm fixes for 5.9-rc7

dma-buf:
- Single null pointer deref fix for dma-buf

i915:
- Fix selftest reference to stack data out of scope
- Fix GVT null pointer dereference
The following changes since commit 98477740630f270aecf648f1d6a9dbc6027d4ff1:

  Merge branch 'rcu/urgent' of
git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu
(2020-09-21 12:42:31 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-09-25

for you to fetch changes up to ba78755e0c25dec4151880a14f523e929b2052c6:

  Merge tag 'drm-misc-fixes-2020-09-24' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2020-09-25
11:30:00 +1000)

----------------------------------------------------------------
drm fixes for 5.9-rc7

dma-buf:
- Single null pointer deref fix for dma-buf

i915:
- Fix selftest reference to stack data out of scope
- Fix GVT null pointer dereference

----------------------------------------------------------------
Charan Teja Reddy (1):
      dmabuf: fix NULL pointer dereference in dma_buf_release()

Chris Wilson (1):
      drm/i915/selftests: Push the fake iommu device from the stack to data

Dave Airlie (4):
      Merge tag 'drm-misc-fixes-2020-09-18' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      BackMerge commit '98477740630f270aecf648f1d6a9dbc6027d4ff1' into drm-fixes
      Merge tag 'drm-intel-fixes-2020-09-24' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'drm-misc-fixes-2020-09-24' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Jani Nikula (2):
      Merge remote-tracking branch 'origin/master' into drm-intel-fixes
      Merge tag 'gvt-fixes-2020-09-17' of
https://github.com/intel/gvt-linux into drm-intel-fixes

Marek Szyprowski (1):
      drm/vc4/vc4_hdmi: fill ASoC card owner

Martin Cerveny (2):
      drm/sun4i: sun8i-csc: Secondary CSC register correction
      drm/sun4i: mixer: Extend regmap max_register

Zhenyu Wang (1):
      drm/i915/gvt: Fix port number for BDW on EDID region setup

 drivers/dma-buf/dma-buf.c                        |  2 ++
 drivers/gpu/drm/i915/gvt/vgpu.c                  |  6 +++++-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c | 12 +++++-------
 drivers/gpu/drm/sun4i/sun8i_csc.h                |  2 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c              |  2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                   |  1 +
 6 files changed, 15 insertions(+), 10 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
