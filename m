Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D87EC478DCB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 15:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03DF112674;
	Fri, 17 Dec 2021 14:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DCB0112674
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 14:29:19 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id s1so4450617wrg.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 06:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NhHnu+33iZDy4lsokuBhy7INduCsl/N/nUVcNzGvT6A=;
 b=lhRVJzHYwjbGJ2Vg0lUZdAvi6c0//BLJiJnpLKIdeFh02PtZiRNtrgZOdDsgY0axg7
 7u0GOlg2xdOf+DDtmoxlV3vzGJGZmfqh2acisox5LlGzHjVumccSlHQxvZIGi7AIM6Fa
 ZW0u+83pEOe/FyyU08a+w/IR1GJKc8opVamF6Ozm5HJuRYL/HwyGPsqllSKDdGGceyvw
 F2lf+HC6XCKPVLCTXMWN17lh0ciU1f98KPq9lMwuJke8a0gYXCrGCPlPxI1jLPSiUcvB
 /qGx5KbHeynEzTD3VRqunvX4qFgGjhqNdM6PcfVSM6yqbzAGLctCuhnQ2+1FhLf2JJHc
 bPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NhHnu+33iZDy4lsokuBhy7INduCsl/N/nUVcNzGvT6A=;
 b=bpup03iWsNeA1g9dd8OiK3TCNbIX01EeowgPSIwFTA9UhlY85zz/MFmKsJJdpN2UJ9
 7pRgKdnLyHc2r/DKyL4HMIFfJcAyfaX03d7KDmoyyocbVCIV3hZvb7+9Rflb2/PP3olu
 GkOvdHFTRa14rsdOLSNgX3YqAihA9rkkkhmk64GSyKp+oWcaSxREr47bYLwal9v/QWBk
 YTwD0xzQnWNwhXAnqDUBgaBMwUQESJDObdXw1JvZ7eZxkiEUIsxyVY7W/ld+Tfm1p++O
 IDa3ykug5LGT8Mn5AnWQHFtUA5UkezdC+WKjJoL5fsYo8lpjsx/2usGYPujh1JqQa3l0
 HZ1Q==
X-Gm-Message-State: AOAM53396rVXgBcQd887BQVi0YiNAPdOZ6p6L3Vq1/w219losrbohBrk
 l0XuKjuq9Iwa9LtfDVu3KuEwTuHcM6DAog==
X-Google-Smtp-Source: ABdhPJyRjBm7Nxm7s8axcW811jRLzW/ww41yt6eAGl+UXe2lQN+sOM+15Ltbf+Qjv+MxtqrNicAmkg==
X-Received: by 2002:a5d:47c3:: with SMTP id o3mr2721136wrc.348.1639751357890; 
 Fri, 17 Dec 2021 06:29:17 -0800 (PST)
Received: from localhost ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id l16sm8421338wrx.117.2021.12.17.06.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 06:29:17 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL] drm/tegra: Changes for v5.17-rc1
Date: Fri, 17 Dec 2021 15:29:12 +0100
Message-Id: <20211217142912.558095-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

The following changes since commit 136057256686de39cc3a07c2e39ef6bc43003ff6:

  Linux 5.16-rc2 (2021-11-21 13:47:39 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-5.17-rc1

for you to fetch changes up to d210919dbdc8a82c676cc3e3c370b1802be63124:

  drm/tegra: Add back arm_iommu_detach_device() (2021-12-16 14:30:45 +0100)

This is unusually big because it contains essentially two cycles' worth
of work. I'm still not sure what happened for v5.16-rc1, but the PR was
never merged.

Fingers crossed that it will work better this time.

As mentioned last time already, the userspace for the new NVDEC driver
can be found here:

  https://github.com/cyndis/vaapi-tegra-driver

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.17-rc1

This contains a fairly large rework that makes the buffer objects behave
more according to what the DMA-BUF infrastructure expects. A buffer
object cache is implemented on top of that to make certain operations
such as page-flipping more efficient by avoiding needless map/unmap
operations. This in turn is useful to implement asynchronous commits to
support legacy cursor updates.

Another fairly big addition is the NVDEC driver. This uses the updated
UABI introduced in v5.15-rc1 to provide access to the video decode
engines found on Tegra210 and later.

This also includes some power management improvements that are useful on
older devices in particular because they, together with a bunch of other
changes across the kernel, allow the system to scale down frequency and
voltages when mostly idle and prevent these devices from becoming
excessively hot.

The remainder of these changes is an assortment of cleanups and minor
fixes.

----------------------------------------------------------------
Arnd Bergmann (3):
      gpu: host1x: select CONFIG_DMA_SHARED_BUFFER
      drm/tegra: Mark nvdec_writel() as inline
      drm/tegra: Mark nvdec PM functions as __maybe_unused

Dmitry Osipenko (19):
      soc/tegra: Enable runtime PM during OPP state-syncing
      soc/tegra: Add devm_tegra_core_dev_init_opp_table_common()
      drm/tegra: dc: rgb: Move PCLK shifter programming to CRTC
      drm/tegra: dc: rgb: Allow changing PLLD rate on Tegra30+
      drm/tegra: hdmi: Unwind tegra_hdmi_init() errors
      drm/tegra: hdmi: Register audio CODEC on Tegra20
      gpu: host1x: Add initial runtime PM and OPP support
      gpu: host1x: Add host1x_channel_stop()
      drm/tegra: submit: Add missing pm_runtime_mark_last_busy()
      drm/tegra: dc: Support OPP and SoC core voltage scaling
      drm/tegra: hdmi: Add OPP support
      drm/tegra: gr2d: Support generic power domain and runtime PM
      drm/tegra: gr3d: Support generic power domain and runtime PM
      drm/tegra: vic: Stop channel on suspend
      drm/tegra: nvdec: Stop channel on suspend
      drm/tegra: submit: Remove pm_runtime_enabled() checks
      drm/tegra: Consolidate runtime PM management of older UAPI codepath
      gpu: host1x: Add back arm_iommu_detach_device()
      drm/tegra: Add back arm_iommu_detach_device()

Mikko Perttunen (3):
      drm/tegra: Add NVDEC driver
      drm/tegra: Bump VIC/NVDEC clock rates to Fmax
      drm/tegra: vic: Use autosuspend

Randy Dunlap (1):
      gpu: host1x: Drop excess kernel-doc entry @key

Robin Murphy (2):
      drm/tegra: vic: Fix DMA API misuse
      gpu: host1x: Add missing DMA API include

Thierry Reding (8):
      Merge branch 'tegra-for-5.17-soc-opp' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into drm/tegra/for-next
      drm/tegra: Implement correct DMA-BUF semantics
      drm/tegra: Implement buffer object cache
      drm/tegra: Do not reference tegra_plane_funcs directly
      drm/tegra: Propagate errors from drm_gem_plane_helper_prepare_fb()
      drm/tegra: Support asynchronous commits for cursor
      drm/tegra: gr2d: Explicitly control module reset
      drm/tegra: vic: Handle tegra_drm_alloc() failure

Wan Jiabing (1):
      drm/tegra: Remove duplicate struct declaration

 drivers/gpu/drm/tegra/Kconfig      |   3 +
 drivers/gpu/drm/tegra/Makefile     |   3 +-
 drivers/gpu/drm/tegra/dc.c         | 194 +++++++++++++--
 drivers/gpu/drm/tegra/dc.h         |   3 +
 drivers/gpu/drm/tegra/drm.c        |  30 ++-
 drivers/gpu/drm/tegra/drm.h        |   1 +
 drivers/gpu/drm/tegra/gem.c        | 171 +++++++++-----
 drivers/gpu/drm/tegra/gr2d.c       | 151 +++++++++++-
 drivers/gpu/drm/tegra/gr3d.c       | 353 +++++++++++++++++++++++-----
 drivers/gpu/drm/tegra/hdmi.c       | 183 +++++++++++++--
 drivers/gpu/drm/tegra/hub.h        |   1 -
 drivers/gpu/drm/tegra/nvdec.c      | 466 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/plane.c      |  65 ++----
 drivers/gpu/drm/tegra/plane.h      |   2 +-
 drivers/gpu/drm/tegra/rgb.c        |  53 ++++-
 drivers/gpu/drm/tegra/submit.c     |  77 ++++--
 drivers/gpu/drm/tegra/uapi.c       |  68 ++----
 drivers/gpu/drm/tegra/uapi.h       |   5 +-
 drivers/gpu/drm/tegra/vic.c        |  61 +++--
 drivers/gpu/host1x/Kconfig         |   1 +
 drivers/gpu/host1x/bus.c           |  80 ++++++-
 drivers/gpu/host1x/channel.c       |   8 +
 drivers/gpu/host1x/debug.c         |  15 ++
 drivers/gpu/host1x/dev.c           | 185 ++++++++++++---
 drivers/gpu/host1x/dev.h           |   5 +-
 drivers/gpu/host1x/hw/channel_hw.c |  44 ++--
 drivers/gpu/host1x/intr.c          |   3 -
 drivers/gpu/host1x/job.c           | 160 +++++--------
 drivers/gpu/host1x/job.h           |   6 +-
 drivers/gpu/host1x/syncpt.c        |   5 +-
 drivers/soc/tegra/common.c         |  25 ++
 include/linux/host1x.h             |  76 ++++--
 include/soc/tegra/common.h         |  15 ++
 33 files changed, 2020 insertions(+), 498 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/nvdec.c
