Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC634271FD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 22:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA406E0F0;
	Fri,  8 Oct 2021 20:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BCC6E0F0
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 20:23:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id u18so33193392wrg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Oct 2021 13:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6H3abf9n7GKV0/tbso3ZKE2NhDrvxoh3P1AHHFYNCCk=;
 b=eTbcTcnLhw5VIYf9hR+7LJff0l2f3gXDjBeU39YTKvSrOxiBucnUZqzUTnVQfl/ll0
 TRsDDJLb3hAA54bEE3IOvWyRwY4L3WvVVao2aZsL1xYeBLYdCU/zI8PHq09Poh0MKXdI
 Vyh5l7lQ+3nG8nrKKgULLzEY338Vj6KoBbbruFYBfN6oe2Qd69ejYha2wozl6wz/vqtX
 48CkolNhYlZPZbaJPIRDtl4zfd/XD7Tsw6t/wfmPvKUXQTIlPjIItEysf7UdZfGXTsby
 6wgP0QkXCoOfA7jGvXzwJL5qk3mGZRXZERH1yZdqR2da0pkqQEGXV+jvLRPOD6t9SyFa
 A4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6H3abf9n7GKV0/tbso3ZKE2NhDrvxoh3P1AHHFYNCCk=;
 b=QMxZF/6gC9hMjSTzM6Cq8gmNEUldax6WzIjre25t6pr6TparGWKyC3EecFoUxE4m6p
 rlnXwyJ5T9+JWWMeLRM/2Jwwn4qPTKknO5Ic/D+Hq+CtHmbc7WOZyHapdnaLmFEc2P3v
 CYLOFUvCcaeD48ZJSXuhfB8a2EoXX3ECb5lU8eoCYcWQvDg/NKHoCrhob2SkfhEgir8s
 CnGd9Cjk17f1AxanW6kRiVwxLw5ZdRcA42mcOvksdMiIFWHNOHvcjcVr6HAjI6xx4SKn
 8AfnKDEDbbujy2NJNJ88ooEoXieI/iRsRfvYU2qVrvA809VUt7kWaMTHmGp6VWWqv0od
 O52Q==
X-Gm-Message-State: AOAM530wXKHy4oWD4k00b9KzrnfPSwjOyFt8taAe4Ht/guA5rB4pByQz
 ypcs94u7ci/gMxu2WF9icpQ=
X-Google-Smtp-Source: ABdhPJym5qWTcy6qP9dvUIZq5kG2wYppJ/oI6/KjYNsZkZDLq0Ej9IIYwO5MLONCLpdMUfsw0Q/RRA==
X-Received: by 2002:adf:8bcf:: with SMTP id w15mr7018668wra.144.1633724616210; 
 Fri, 08 Oct 2021 13:23:36 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id f22sm327609wrd.8.2021.10.08.13.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 13:23:35 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Changes for v5.16-rc1
Date: Fri,  8 Oct 2021 22:23:34 +0200
Message-Id: <20211008202334.1679411-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi Dave, Daniel,

The following changes since commit c3dbfb9c49eef7d07904e5fd5e158dd6688bbab3:

  gpu: host1x: Plug potential memory leak (2021-09-16 18:06:52 +0200)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/tegra/linux.git tags/drm/tegra/for-5.16-rc1

for you to fetch changes up to 5dccbc9de8f0071eb731b4de81d0638ea6c06a53:

  drm/tegra: dc: rgb: Allow changing PLLD rate on Tegra30+ (2021-10-08 21:17:38 +0200)

This is based on the drm/tegra/for-5.15-rc3 tag that you pulled a couple
of weeks ago. As mentioned last time already, the userspace for the new
NVDEC driver can be found here:

  https://github.com/cyndis/vaapi-tegra-driver

I'm sending this a week earlier than usual because I'm out of office
next week.

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.16-rc1

This contains a fairly large rework that makes the buffer objects behave
more according to what the DMA-BUF infrastructure expects. A buffer
object cache is implemented on top of that to make certain operations
such as page-flipping more efficient by avoiding needless map/unmap
operations. This in turn is useful to implement asynchronous commits to
support legacy cursor updates.

Another fairly big addition is the NVDEC driver. This uses the updated
UABI introduced in v5.15-rc1 to provide access to the video decode
engines found on Tegra210 and later.

The remainder of these changes is an assortment of cleanups and minor
fixes.

----------------------------------------------------------------
Arnd Bergmann (1):
      gpu: host1x: select CONFIG_DMA_SHARED_BUFFER

Dmitry Osipenko (2):
      drm/tegra: dc: rgb: Move PCLK shifter programming to CRTC
      drm/tegra: dc: rgb: Allow changing PLLD rate on Tegra30+

Mikko Perttunen (3):
      drm/tegra: Add NVDEC driver
      drm/tegra: Bump VIC/NVDEC clock rates to Fmax
      drm/tegra: vic: Use autosuspend

Randy Dunlap (1):
      gpu: host1x: Drop excess kernel-doc entry @key

Thierry Reding (6):
      drm/tegra: Implement correct DMA-BUF semantics
      drm/tegra: Implement buffer object cache
      drm/tegra: Do not reference tegra_plane_funcs directly
      drm/tegra: Propagate errors from drm_gem_plane_helper_prepare_fb()
      drm/tegra: Support asynchronous commits for cursor
      drm/tegra: gr2d: Explicitly control module reset

Wan Jiabing (1):
      drm/tegra: Remove duplicate struct declaration

 drivers/gpu/drm/tegra/Makefile |   3 +-
 drivers/gpu/drm/tegra/dc.c     | 117 ++++++++--
 drivers/gpu/drm/tegra/dc.h     |   1 +
 drivers/gpu/drm/tegra/drm.c    |   4 +
 drivers/gpu/drm/tegra/drm.h    |   1 +
 drivers/gpu/drm/tegra/gem.c    | 171 +++++++++------
 drivers/gpu/drm/tegra/gr2d.c   |  33 ++-
 drivers/gpu/drm/tegra/hub.h    |   1 -
 drivers/gpu/drm/tegra/nvdec.c  | 470 +++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/plane.c  |  65 ++----
 drivers/gpu/drm/tegra/plane.h  |   2 +-
 drivers/gpu/drm/tegra/rgb.c    |  53 ++++-
 drivers/gpu/drm/tegra/submit.c |  63 ++++--
 drivers/gpu/drm/tegra/uapi.c   |  68 +++---
 drivers/gpu/drm/tegra/uapi.h   |   5 +-
 drivers/gpu/drm/tegra/vic.c    |   8 +
 drivers/gpu/host1x/Kconfig     |   1 +
 drivers/gpu/host1x/bus.c       |  79 ++++++-
 drivers/gpu/host1x/dev.c       |  20 ++
 drivers/gpu/host1x/dev.h       |   2 +
 drivers/gpu/host1x/job.c       | 160 +++++---------
 drivers/gpu/host1x/job.h       |   6 +-
 include/linux/host1x.h         |  75 +++++--
 23 files changed, 1087 insertions(+), 321 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/nvdec.c
