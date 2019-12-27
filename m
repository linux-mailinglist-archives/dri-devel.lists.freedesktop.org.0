Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D9712BB13
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2019 21:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C216E05A;
	Fri, 27 Dec 2019 20:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F5F6E05A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2019 20:08:58 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id f15so21345427lfl.13
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2019 12:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=H1f1DKFwyHw0Dhp3ttDcFE2jgiDt5bJAsShojhkT1DE=;
 b=Z8dBEsxBYWpSgED9Ej3Y31+deZbiuVcDE0C7ke50kHN1O3H1lHk8byHKImX1twOUNw
 ZTUxJvlarxhksf9VYl/xm4GVGurIcvwbfGBSU6E+R9wyah+IkCGU4puz73X8W6Sjt/EG
 PVE3yQ41/n+ncKcYGUvJGWO1HOYfNJtZorgvA8IuEP+nfHvdPUPV4RBqp1sur5XvC2+0
 lx8Eo5tZhYHYl0WYf8PL9KC98kfS7aCAQcB/4mfAr/xF7MOWmc30PqSku/gfIvlr3Fn8
 ldd/CLVVeOgYz6RE8xx7b1xqdQtLx4aGqm7YUqcXW1UFPqMWDW+qwq5uoUypMVb5cdAQ
 E0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=H1f1DKFwyHw0Dhp3ttDcFE2jgiDt5bJAsShojhkT1DE=;
 b=mmZGhX40BNM72DcthPk0MGHU9PhJpn88ERxFIBwrUq4LwlSczKfQ56nwSIp9TerJjg
 5w672d9X5CtR9IWkOtGCcVeHw3LkpKp43p0fnT80X6K7NmAK5y+wKYw9YnuANxBRrqCd
 Pge1GQSiwYPdwqvSDTi+DV41pFhFXPU4Ft41+3b0SUYcv+llVPwWDv4Kuck2M3wmVsQI
 9lXdiMCqbALfzF4GXRfr4a4C2qsx8hrhI+fVZNZPP5KahFPJxMQYWfLz+J8Jh5lxniqL
 Wux2tiJ51EVqvTn/rpX7xVSJNLvyDHndOvdgexBJygEOVndIbXybDrQLdaPX4seY5ARY
 +avg==
X-Gm-Message-State: APjAAAU9rtfMoPn+clmnCE9Gp5hLftrcBn6NvyeDJgoyHiYUKCWeTx4w
 WzVHiLdBUBBUlWP4thAGh7q/JvCm2xpEMs4oxbM=
X-Google-Smtp-Source: APXvYqxOi5h5Eaizf2pVbR0O3CEGGg7DKGINdC4P1cEfrkTBgiYE1K9RIrYxdh+iO9pMXO6ScdWbjt4yuPHpfXzO9GI=
X-Received: by 2002:ac2:465e:: with SMTP id s30mr30870448lfo.134.1577477336864; 
 Fri, 27 Dec 2019 12:08:56 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 28 Dec 2019 06:08:45 +1000
Message-ID: <CAPM=9tzSB+6b0KuXaKfTP_GLpMyBUQheC_L4Nyo4zhygDvixUw@mail.gmail.com>
Subject: [git pull] drm fixes for 5.5-rc4
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

Hey Linus,

Post-xmas food coma recovery fixes. Only 3 fixes for i915 since I
expect most people are holidaying.

Dave.

drm-fixes-2019-12-28:
drm fixes for 5.5-rc4

i915:
- power management rc6 fix
- framebuffer tracking fix
- display power management ratelimit fix
The following changes since commit 46cf053efec6a3a5f343fead837777efe8252a46:

  Linux 5.5-rc3 (2019-12-22 17:02:23 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2019-12-28

for you to fetch changes up to e31d941c7dd797df37ea94958638a88723325c30:

  Merge tag 'drm-intel-fixes-2019-12-23' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2019-12-27
13:13:30 +1000)

----------------------------------------------------------------
drm fixes for 5.5-rc4

i915:
- power management rc6 fix
- framebuffer tracking fix
- display power management ratelimit fix

----------------------------------------------------------------
Chris Wilson (2):
      drm/i915/gt: Ratelimit display power w/a
      drm/i915: Hold reference to intel_frontbuffer as we track activity

Dave Airlie (1):
      Merge tag 'drm-intel-fixes-2019-12-23' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Tvrtko Ursulin (1):
      drm/i915/pmu: Ensure monotonic rc6

 drivers/gpu/drm/i915/display/intel_display.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 16 ++----
 drivers/gpu/drm/i915/display/intel_frontbuffer.h | 34 ++++++++++-
 drivers/gpu/drm/i915/display/intel_overlay.c     | 17 ++++--
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c      |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c       |  4 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c       | 26 ++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_object.h       | 23 +++++++-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c            |  3 +-
 drivers/gpu/drm/i915/i915_gem.c                  | 10 ++--
 drivers/gpu/drm/i915/i915_pmu.c                  | 73 +++++++-----------------
 drivers/gpu/drm/i915/i915_pmu.h                  |  2 +-
 drivers/gpu/drm/i915/i915_vma.c                  | 10 +++-
 14 files changed, 139 insertions(+), 86 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
