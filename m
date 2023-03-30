Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D336D0F41
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 21:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719FC10F004;
	Thu, 30 Mar 2023 19:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E5010F004
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 19:47:36 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id s13so11601156wmr.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680205654;
 h=content-transfer-encoding:content-disposition:mime-version
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0ewJOGtXglM8Jvbu49ZgJaaMn69sCGGn1tvCVxSIRDU=;
 b=ECZu2oSQdW2V52K0BGJL4j4CgFMdB+VtEWzIUR1aZGgOd61sK7G3C9g9yxHH69HDm5
 x0MI6G/so7TUfg3jGp0yw6N/eJKtDqtn0nGJ46z/2AnYn26WQNF47NBfdu+Aw5a5daBv
 ACR0PKW7xM/UX9Ij0mKCVs8IZavwuNvdJ+YKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680205654;
 h=content-transfer-encoding:content-disposition:mime-version
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0ewJOGtXglM8Jvbu49ZgJaaMn69sCGGn1tvCVxSIRDU=;
 b=2oyrSBf78IA5p2xdM3+LdT2gOssvq2N5hjX07C9k7cEJRKEhkYDxh+xgTDehUCPfVV
 4FSi2vo69Z1vE4HX+cmdzzUyjLKpyFMHX2Z9C38K2BjaTMXWU2ro4KYEj9atZpAy8PkA
 sjfCbLNkczE9/mu6ZTqn6nsiF/UxVn9yKlvgQP2npA9iOQMdhcYdB3gEN/rbwfHrG7jL
 OC1kCsPF17Y3oulnuVev94wEllW1BW45jVoSFvMHljV1Kyvu4NXl6eGe6S3H3b68AZmv
 hwrRW4WvXzFJgictA1HsCVNLw0ky3Jqbqv+s8p/oczTErrQFLypOVI7AV2lo6RKkJQe7
 p4gw==
X-Gm-Message-State: AAQBX9eqUxso8kIPiIvhI5KMw6Ad0BxG30CWPArzVLWVHLTjEEFpcFxW
 KZWvSvHh+UCfTg44Tq7JlXgzjg==
X-Google-Smtp-Source: AKy350ZTD2RzN3Xp6/Cr+LJ6KXdcii7BjnTmtq183be4/On6yl6OM1PDQcDP5OaDrrPXzGFdY9fEAA==
X-Received: by 2002:a05:600c:1c83:b0:3ed:ebcb:e2c6 with SMTP id
 k3-20020a05600c1c8300b003edebcbe2c6mr2828450wms.3.1680205654607; 
 Thu, 30 Mar 2023 12:47:34 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 s17-20020a05600c45d100b003ed51cdb94csm7292817wmo.26.2023.03.30.12.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 12:47:34 -0700 (PDT)
Date: Thu, 30 Mar 2023 21:47:32 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] drm-fixes for 6.3-rc5
Message-ID: <ZCXnVLzzdzt4xX7E@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Dave Airlie <airlied@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Operating-System: Linux phenom 6.1.0-6-amd64 
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
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Next week's pull probably on Wed already because easter w/e. Two
regression fixes in here, otherwise just the usual stuff.

drm-fixes-2023-03-30:
drm-fixes for 6.3-rc5

- i915 fixes for color mgmt, psr, lmem flush, hibernate oops, and more
- amdgpu: dp mst and hibernate regression fix
- etnaviv: revert fdinfo support (incl drm/sched revert), leak fix
- misc ivpu fixes, nouveau backlight, drm buddy allocator 32bit fixes

Cheers, Daniel

The following changes since commit 197b6b60ae7bc51dd0814953c562833143b292aa:

  Linux 6.3-rc4 (2023-03-26 14:40:20 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-03-30

for you to fetch changes up to 7af63e079a7d6d45a3796a7ba625e2ec131f62be:

  Merge branch 'etnaviv/fixes' of https://git.pengutronix.de/git/lst/linux into drm-fixes (2023-03-30 20:15:07 +0200)

----------------------------------------------------------------
drm-fixes for 6.3-rc5

- i915 fixes for color mgmt, psr, lmem flush, hibernate oops, and more
- amdgpu: dp mst and hibernate regression fix
- etnaviv: revert fdinfo support (incl drm/sched revert), leak fix
- misc ivpu fixes, nouveau backlight, drm buddy allocator 32bit fixes

----------------------------------------------------------------
Andrzej Kacprowski (1):
      accel/ivpu: Fix IPC buffer header status field value

Ashutosh Dixit (1):
      drm/i915/pmu: Use functions common with sysfs to read actual freq

Chris Wilson (2):
      drm/i915/gem: Flush lmem contents after construction
      drm/i915/perf: Drop wakeref on GuC RC error

Daniel Vetter (5):
      Merge tag 'drm-intel-fixes-2023-03-30' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-6.3-2023-03-29' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2023-03-30' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'amd-drm-fixes-6.3-2023-03-30' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge branch 'etnaviv/fixes' of https://git.pengutronix.de/git/lst/linux into drm-fixes

David Gow (2):
      drm: buddy_allocator: Fix buddy allocator init on 32-bit systems
      drm: test: Fix 32-bit issue in drm_buddy_test

Fangzhi Zuo (2):
      drm/amd/display: Add DSC Support for Synaptics Cascaded MST Hub
      drm/amd/display: Take FEC Overhead into Timeslot Calculation

Hans de Goede (1):
      drm/nouveau/kms: Fix backlight registration

Imre Deak (1):
      drm/i915/tc: Fix the ICL PHY ownership check in TC-cold state

Lucas Stach (3):
      drm/etnaviv: fix reference leak when mmaping imported buffer
      Revert "drm/etnaviv: export client GPU usage statistics via fdinfo"
      Revert "drm/scheduler: track GPU active time per entity"

Stanislaw Gruszka (7):
      accel/ivpu: Do not access HW registers after unbind
      accel/ivpu: Cancel recovery work
      accel/ivpu: Do not use SSID 1
      accel/ivpu: Fix power down sequence
      accel/ivpu: Disable buttress on device removal
      accel/ivpu: Remove support for 1 tile SKUs
      accel/ivpu: Fix VPU clock calculation

Tim Huang (1):
      drm/amdgpu: allow more APUs to do mode2 reset when go to S4

Ville Syrjälä (6):
      drm/i915: Split icl_color_commit_noarm() from skl_color_commit_noarm()
      drm/i915: Move CSC load back into .color_commit_arm() when PSR is enabled on skl/glk
      drm/i915: Add a .color_post_update() hook
      drm/i915: Workaround ICL CSC_MODE sticky arming
      drm/i915: Disable DC states for all commits
      drm/i915/dpt: Treat the DPT BO as a framebuffer

 drivers/accel/ivpu/ivpu_drv.c                      |  18 +++-
 drivers/accel/ivpu/ivpu_drv.h                      |   7 +-
 drivers/accel/ivpu/ivpu_hw_mtl.c                   | 113 +++++++--------------
 drivers/accel/ivpu/ivpu_ipc.h                      |   2 +-
 drivers/accel/ivpu/ivpu_job.c                      |  11 +-
 drivers/accel/ivpu/ivpu_pm.c                       |  17 +++-
 drivers/accel/ivpu/ivpu_pm.h                       |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   7 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  51 ++++++++--
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |  15 +++
 drivers/gpu/drm/drm_buddy.c                        |   4 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              |  43 +-------
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c        |  10 +-
 drivers/gpu/drm/i915/display/intel_color.c         | 101 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_color.h         |   1 +
 drivers/gpu/drm/i915/display/intel_display.c       |  31 +++++-
 drivers/gpu/drm/i915/display/intel_dpt.c           |   2 +
 drivers/gpu/drm/i915/display/intel_tc.c            |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c           |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |   3 +
 drivers/gpu/drm/i915/gt/intel_rps.c                |  38 +++----
 drivers/gpu/drm/i915/gt/intel_rps.h                |   4 +-
 drivers/gpu/drm/i915/i915_perf.c                   |  14 ++-
 drivers/gpu/drm/i915/i915_perf_types.h             |   6 ++
 drivers/gpu/drm/i915/i915_pmu.c                    |  10 +-
 drivers/gpu/drm/nouveau/nouveau_backlight.c        |   7 +-
 drivers/gpu/drm/scheduler/sched_main.c             |   6 --
 drivers/gpu/drm/tests/drm_buddy_test.c             |   3 +-
 include/drm/gpu_scheduler.h                        |   7 --
 30 files changed, 341 insertions(+), 200 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
