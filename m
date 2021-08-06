Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A7D3E231D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 08:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA2689AC9;
	Fri,  6 Aug 2021 06:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FB989AC9
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 06:03:13 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 a192-20020a1c7fc90000b0290253b32e8796so6726688wmd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 23:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=6H+0hcm8l7aLIS2xe0QY8OrUwt8WXy+M0IZiWZTDT/4=;
 b=ijo0XQNguBvEBbqPFuapHSzDKkdhBjs4bMQanuaouAtLj2nd/+YcxB6WjU+Bn82y4/
 vf7kk4i3Sgjrb7u22jcQBE2wbsAvOjajQabWl7h2nHynd++3ZfL+XRHD6Odj1HOpMQxf
 IGXJTXMHgDFPJGNSLjtbWJ4CwMv96GJZMaVKGc0SnY0Hu+qjQnepTByrWBxr5rJvLEfA
 jJyRf3+vwDC1D7icTLOaGxU2Yotmgyg7FmOsWeI+B+ykp2kwPOSx3ytXCVSvK+yc8Lmd
 9wq1n4UNG1K5kCIxVc0qqRlwOjCvf0aBR3AfaJ1coZs5ycHyZBuMj2uurpW1qvzjhO1f
 +j6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=6H+0hcm8l7aLIS2xe0QY8OrUwt8WXy+M0IZiWZTDT/4=;
 b=mKphc5c4gbJ3xz6UGJCDDdT4KQwJUq3wA5TPPaufitZAt5ZyWOh0RBZb/nTTU7tS21
 CtQPnj9VVzw2APri4fhcNXC2/YGNwiayyR7SrW6+49kHKm/srVB5vK9bFfheMF/2HVqk
 hSvH3uwpN3t3zPwa+ENqefogRrmUbtVREkZG5DCWD7K4lLuOgEJrbNO2D6byEZglPvUp
 vv+2ouMKaTL9JgJS8VvBGgNUdD2cuXGK3PyxhCvhGY3QrvjB8fJMmI6fLtAGcX584JwE
 5OqOHyWumSYy2WPzMSxKnGfE7vHiJK/XsW+yW+xFvyzL2mRCSo6TkDk176TFoUUV5Hr9
 gzHA==
X-Gm-Message-State: AOAM530LA58awRN6Ns/TrfeKaqB5gkGBvVPNVzrGU3KPOfy1XweS3G11
 y/kYXVUGn9715I1s3q7ZtMUhC4cXQ/n8NIcUvB0=
X-Google-Smtp-Source: ABdhPJype5gSl8B6cXIO8ZkqsC+9SfaYUqWVDfxpeoT5UvlPOUQsZIqgz5McybWazUHKmZTP0YNXosncKH5oDz/tGhg=
X-Received: by 2002:a1c:a709:: with SMTP id q9mr18222417wme.23.1628229791651; 
 Thu, 05 Aug 2021 23:03:11 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 6 Aug 2021 16:03:00 +1000
Message-ID: <CAPM=9txE4jnHDV9B2PWfieMJjdFv0C7=Zc=MovOtJ6sKN2AuYg@mail.gmail.com>
Subject: [git pull] drm fixes for 5.14-rc5
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Regular weekly fixes pull, live from a Brisbane lockdown with kids at home.

A big bunch of scattered amdgpu fixes, but they are all pretty small,
minor i915 fixes, kmb, and one vmwgfx regression fixes, all pretty
quiet for this time.

Dave.

drm-fixes-2021-08-06:
drm fixes for 5.14-rc5

amdgpu:
- Fix potential out-of-bounds read when updating GPUVM mapping
- Renoir powergating fix
- Yellow Carp updates
- 8K fix for navi1x
- Beige Goby updates and new DIDs
- Fix DMUB firmware version output
- EDP fix
- pmops config fix

i915:
- Call i915_globals_exit if pci_register_device fails
- (follow on fix for section mismatch)
- Correct SFC_DONE register offset

kmb:
- DMA fix
- driver date/version macros

vmwgfx:
- Fix I/O memory access on 64-bit systems
The following changes since commit c500bee1c5b2f1d59b1081ac879d73268ab0ff17:

  Linux 5.14-rc4 (2021-08-01 17:04:17 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-08-06

for you to fetch changes up to d186f9c28008810d8f984d6bdd1c07757048ed63:

  Merge tag 'amd-drm-fixes-5.14-2021-08-05' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2021-08-06
11:22:09 +1000)

----------------------------------------------------------------
drm fixes for 5.14-rc5

amdgpu:
- Fix potential out-of-bounds read when updating GPUVM mapping
- Renoir powergating fix
- Yellow Carp updates
- 8K fix for navi1x
- Beige Goby updates and new DIDs
- Fix DMUB firmware version output
- EDP fix
- pmops config fix

i915:
- Call i915_globals_exit if pci_register_device fails
- (follow on fix for section mismatch)
- Correct SFC_DONE register offset

kmb:
- DMA fix
- driver date/version macros

vmwgfx:
- Fix I/O memory access on 64-bit systems

----------------------------------------------------------------
Bing Guo (2):
      drm/amd/display: Fix Dynamic bpp issue with 8K30 with Navi 1X
      drm/amd/display: Increase stutter watermark for dcn303

Chengming Gui (1):
      drm/amdgpu: add DID for beige goby

Dave Airlie (3):
      Merge tag 'drm-misc-fixes-2021-08-04' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2021-08-04' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-5.14-2021-08-05' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Edmund Dea (2):
      drm/kmb: Enable LCD DMA for low TVDDCV
      drm/kmb: Define driver date and major/minor version

Jason Ekstrand (1):
      drm/i915: Call i915_globals_exit() if pci_register_device() fails

Jude Shih (1):
      drm/amd/display: Fix resetting DCN3.1 HW when resuming from S4

Matt Roper (1):
      drm/i915: Correct SFC_DONE register offset

Qingqing Zhuo (1):
      drm/amd/display: workaround for hard hang on HPD on native DP

Randy Dunlap (2):
      drm/i915: fix i915_globals_exit() section mismatch error
      drm/amdgpu: fix checking pmops when PM_SLEEP is not enabled

Shirish S (1):
      drm/amdgpu/display: fix DMUB firmware version info

Wesley Chalmers (1):
      drm/amd/display: Assume LTTPR interop for DCN31+

Xiaomeng Hou (1):
      drm/amd/pm: update yellow carp pmfw interface version

Yifan Zhang (1):
      drm/amdgpu: fix the doorbell missing when in CGPG issue for renoir.

Zack Rusin (1):
      drm/vmwgfx: Fix a 64bit regression on svga3

xinhui pan (1):
      drm/amdgpu: Fix out-of-bounds read when update mapping

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  7 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h     |  3 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              | 21 ++++++++++++++++++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |  4 +++-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   | 21 ++-------------------
 drivers/gpu/drm/amd/display/dc/dc.h                |  2 ++
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c  |  2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  | 20 ++++++++++++++++++++
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |  4 ++--
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  | 16 ++++++++++++++++
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |  8 +++++---
 drivers/gpu/drm/amd/pm/inc/smu_v13_0.h             |  2 +-
 drivers/gpu/drm/i915/i915_globals.c                |  4 ++--
 drivers/gpu/drm/i915/i915_pci.c                    |  1 +
 drivers/gpu/drm/i915/i915_reg.h                    |  2 +-
 drivers/gpu/drm/kmb/kmb_drv.c                      | 22 ++++++++++++++++++----
 drivers/gpu/drm/kmb/kmb_drv.h                      |  5 +++++
 drivers/gpu/drm/kmb/kmb_plane.c                    | 15 +++++++++++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |  2 +-
 21 files changed, 124 insertions(+), 41 deletions(-)
