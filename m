Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2E0183E15
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 01:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356286E03A;
	Fri, 13 Mar 2020 00:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91596E03A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 00:59:03 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id g15so8409407otr.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 17:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=TnpQ6V6taC2d+5gH+3qWxA+XUrG8et4gYzT+TRKC6CU=;
 b=X5UuVhX6/uQ1KACRX2V1YK5gQz5EqyEwnRhe9FyB0OwldFZt4L9krlHNmGA+FayGdB
 b5ZEma3NGnqntvJf9MXnUPTkWPZJ8w8XZ99Nw0x0/Gzl7Pd9AubdeFrhYVJ6Kk7nzqyi
 BHOpcJXUrTjb0fT3vAruIHlkvO9aWGs5unWQKr/NDiZo5PqYnJpUMLcEf2ZzwYb44jaZ
 adjwBRQSHSGnypDNGkYlrN9vHNXAASjqqfaD2CRUHOwdHCvLFL/Rr2IWvrPpSCOd7EYR
 Yf1pc5ZBqPMyOzL9xnBUNjk8C+naGbFuOZYx0FMFNvfpoc2XsXeVERaDUpImZpduCuXv
 HUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=TnpQ6V6taC2d+5gH+3qWxA+XUrG8et4gYzT+TRKC6CU=;
 b=n7NAUnw8rUakigvzi/PnNSIcVZAgmXp1rI5Foz6WY4Wf54U9YSXZN46hPUgfPvwNRC
 kbi6YbKWWJkRYcO0t27G2Y3laBGKCEhpUE10K15hf3Jt8a5XgL5dyaQmbDOgrYGlsqkA
 77IzP9eDEMZZDgY//vwAo1ovK5apVTb9hnbfn9aIcyu3FLi5gCqPBCNjB/9rp/SpMM4k
 Kha+R9LF5wBkc4Hxk1QcKxd51zSXpNASWgRWoBpmO+V+tUxaGWgA8kNV8A7zBVOcmwkX
 5nTo8L6tGJefCDT2xdsKpmTWzElgDSkVvTRTG1h8wHC9G7bXbNSn6FJ3tyNwPaKh7JGj
 0gyA==
X-Gm-Message-State: ANhLgQ3JNB8TWwgEd1f7ash9/DElsDPyQaiiD80mDfcaj7poDjtwasy0
 mgSvMvkFSoOjZmBpB2JI+qpVv4rJu3WFqAPxDq4=
X-Google-Smtp-Source: ADFU+vu0h+sm6tuAYmid4Oy1/UoWBnDMBLwzuPZY48BisLtyMz8xLfoEleQV5Xynh6jPjyoZ6SKT2LditCYeptJsd/w=
X-Received: by 2002:a9d:69d3:: with SMTP id v19mr8860958oto.320.1584061142725; 
 Thu, 12 Mar 2020 17:59:02 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 13 Mar 2020 10:58:51 +1000
Message-ID: <CAPM=9tyX3+Qk05feqP=5SbePrg7kWvZu1O0J1pxZk+8Yj=Xjew@mail.gmail.com>
Subject: [git pull] drm fixes for 5.6-rc6
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

It's a bit quieter, probably not as much as it could be. There is on
large regression fix in here from Lyude for displayport bandwidth
calculations, there've been reports of multi-monitor in docks not
working since -rc1 and this has been tested to fix those.

Otherwise it's a bunch of i915 (with some GVT fixes), a set of amdgpu
watermark + bios fixes, and an exynos iommu cleanup fix.

I'm in for dental surgery early next week but I think I should have
recovered enough to send fixes as regular.

Regards,
Dave.
drm-fixes-2020-03-13:
drm fixes for 5.6-rc6

core:
- DP MST bandwidth regression fix.

i915:
- hard lockup fix
- GVT fixes
- 32-bit alignment issue fix
- timeline wait fixes
- cacheline_retire and free

amdgpu:
- Update the display watermark bounding box for navi14
- Fix fetching vbios directly from rom on vega20/arcturus
- Navi and renoir watermark fixes

exynos:
- iommu object cleanup fix

The following changes since commit 2c523b344dfa65a3738e7039832044aa133c75fb:

  Linux 5.6-rc5 (2020-03-08 17:44:44 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-03-13

for you to fetch changes up to 16b78f052d0129cd2998305480da6c4e3ac220a8:

  Merge tag 'topic/mst-bw-check-fixes-for-airlied-2020-03-12-2' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2020-03-13
10:38:25 +1000)

----------------------------------------------------------------
drm fixes for 5.6-rc6

core:
- DP MST bandwidth regression fix.

i915:
- hard lockup fix
- GVT fixes
- 32-bit alignment issue fix
- timeline wait fixes
- cacheline_retire and free

amdgpu:
- Update the display watermark bounding box for navi14
- Fix fetching vbios directly from rom on vega20/arcturus
- Navi and renoir watermark fixes

exynos:
- iommu object cleanup fix


----------------------------------------------------------------
Chris Wilson (5):
      drm/i915: Actually emit the await_start
      drm/i915: Return early for await_start on same timeline
      drm/i915/execlists: Enable timeslice on partial virtual engine dequeue
      drm/i915/gt: Close race between cacheline_retire and free
      drm/i915: Defer semaphore priority bumping to a workqueue

Dave Airlie (4):
      Merge tag 'exynos-drm-fixes-for-v5.6-rc5-v2' of
git://git.kernel.org/.../daeinki/drm-exynos into drm-fixes
      Merge tag 'amd-drm-fixes-5.6-2020-03-11' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2020-03-12' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'topic/mst-bw-check-fixes-for-airlied-2020-03-12-2' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Hawking Zhang (1):
      drm/amdgpu: correct ROM_INDEX/DATA offset for VEGA20

Hersen Wu (1):
      drm/amdgpu/powerplay: nv1x, renior copy dcn clock settings of
watermark to smu during boot up

Jani Nikula (1):
      Merge tag 'gvt-fixes-2020-03-10' of
https://github.com/intel/gvt-linux into drm-intel-fixes

Lyude Paul (4):
      drm/dp_mst: Rename drm_dp_mst_is_dp_mst_end_device() to be less redundant
      drm/dp_mst: Use full_pbn instead of available_pbn for bandwidth checks
      drm/dp_mst: Reprobe path resources in CSN handler
      drm/dp_mst: Rewrite and fix bandwidth limit checks

Marek Szyprowski (1):
      drm/exynos: Fix cleanup of IOMMU related objects

Martin Leung (1):
      drm/amd/display: update soc bb for nv14

Matthew Auld (1):
      drm/i915: be more solid in checking the alignment

Tina Zhang (2):
      drm/i915/gvt: Fix emulated vbt size issue
      drm/i915/gvt: Fix dma-buf display blur issue on CFL

Zhenyu Wang (1):
      drm/i915/gvt: Fix unnecessary schedule timer when no vGPU exits

 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  25 ++-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  | 114 +++++++++++++
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c         |   7 +-
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c         |  22 ++-
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c         |   5 +-
 drivers/gpu/drm/drm_dp_mst_topology.c              | 184 ++++++++++++++-------
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c      |   5 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         |   5 +-
 drivers/gpu/drm/exynos/exynos_drm_dma.c            |  28 +++-
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |   6 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c           |   5 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   5 +-
 drivers/gpu/drm/exynos/exynos_drm_g2d.c            |   5 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c            |   5 +-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c        |   5 +-
 drivers/gpu/drm/exynos/exynos_drm_scaler.c         |   6 +-
 drivers/gpu/drm/exynos/exynos_mixer.c              |   7 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   3 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  29 ++--
 drivers/gpu/drm/i915/gt/intel_timeline.c           |   8 +-
 drivers/gpu/drm/i915/gvt/display.c                 |   3 +-
 drivers/gpu/drm/i915/gvt/opregion.c                |   5 +-
 drivers/gpu/drm/i915/gvt/vgpu.c                    |  12 +-
 drivers/gpu/drm/i915/i915_request.c                |  28 +++-
 drivers/gpu/drm/i915/i915_request.h                |   2 +
 drivers/gpu/drm/i915/i915_utils.h                  |   5 +
 include/drm/drm_dp_mst_helper.h                    |   4 +-
 27 files changed, 405 insertions(+), 133 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
