Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FE73EBA2F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 18:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54B06E889;
	Fri, 13 Aug 2021 16:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFD36E889
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 16:36:19 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 f12-20020a05600c4e8c00b002e6bdd6ffe2so4267684wmq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 09:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k/unfGG7boShaQnBZTjeWb6L7ezxIs4AzIdOoHVH6Jk=;
 b=SjbFbUpYtS+J0ujRt+A5RE1tIn5EziFk+gvUeGZC54fjSuGHHhgWfXe2mlnSIV6/Y1
 KCQdYeIP86KGtEqzh73p3gLOm/8MgSwa+vhdtN2QMzh5TLbk4usG8iQXIR1CajztHr3X
 Syzo0nbcCT9nSqS4OFRMwjKk7wDLbGeg6AkutdzRpWWp//9Qef6cFz+enrsaHto+znTC
 5R4HKkJoKMrwg358k++rvrvXCLrPpp+251+rAerodX+w6FUME/YQPy1C7vlqMXuoDW7w
 LJhcPePFk6a8xyoG33br5Zml+JfEKFRnLAs3MIYl7LyL7J8VZdczN6NTj2x+Y7z6RX0G
 UPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k/unfGG7boShaQnBZTjeWb6L7ezxIs4AzIdOoHVH6Jk=;
 b=HCjwjIty90Ee1LD3n+gXtKcovx3wLf/iPCgik7p/qSYW9TQnYnobMYfY5BFmMOyhhe
 L2i7PxR5CyVTht31gGBHTf389fZ31dgVkPmdLslO59AycurK8DaM/0Nu9SWkKmmiZCkO
 mCvrkt66y4ouRhYYKkwFIE3WKKbbYhUWfwwdSq7ueqjdXUIifWuC78b3+/BE8FOFtpaD
 MzipY4aBxc4MHUCx765yCpEITx0wCYwNGZR/RHcTecO1hwAPhfkBhpykNBb1In5ROfkp
 99SprZXJ86uYqAnVWROpklBf9CKDl6qb0dj0JpcZQfvJ8xtD+XPvjRxLYk/VbfZn0YRs
 RElA==
X-Gm-Message-State: AOAM533AwKtiPQVAQwmaGKqq71G6O6GLovngdReaCV+Wyv/ytMwi+ppT
 wrU97TAwOIA/me/Wc01JCwM=
X-Google-Smtp-Source: ABdhPJwHdWd/8g3Q0zoWVubbkpRNTmluDdpLphAT3vZh35G0CtGsmCLit025TiZHZTSRRjAESv3H7g==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr3566110wmc.150.1628872578279; 
 Fri, 13 Aug 2021 09:36:18 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id s12sm2099923wru.41.2021.08.13.09.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 09:36:17 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Changes for v5.15-rc1
Date: Fri, 13 Aug 2021 18:36:16 +0200
Message-Id: <20210813163616.2822355-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
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

Hi Dave,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/tegra/linux.git tags/drm/tegra/for-5.15-rc1

for you to fetch changes up to fed0289394173509b3150617e17739d0094ce88e:

  gpu: host1x: debug: Dump DMASTART and DMAEND register (2021-08-13 18:23:32 +0200)

Once you've merged these I plan to push the libdrm changes which are
going to use this new ABI and which also contain some basic sanity tests
that we want to start running for regression testing.

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.15-rc1

The bulk of these changes is a more modern ABI that can be efficiently
used on newer SoCs as well as older ones. The userspace parts for this
are available here:

  - libdrm support: https://gitlab.freedesktop.org/tagr/drm/-/commits/drm-tegra-uabi-v8
  - VAAPI driver: https://github.com/cyndis/vaapi-tegra-driver

In addition, existing userspace from the grate reverse-engineering
project has been updated to use this new ABI:

  - X11 driver: https://github.com/grate-driver/xf86-video-opentegra
  - 3D driver: https://github.com/grate-driver/grate

Other than that, there's also support for display memory bandwidth
management for various generations and a bit of cleanup.

----------------------------------------------------------------
Dmitry Osipenko (2):
      drm/tegra: dc: Support memory bandwidth management
      drm/tegra: dc: Extend debug stats with total number of events

Mikko Perttunen (15):
      gpu: host1x: Add DMA fence implementation
      gpu: host1x: Add no-recovery mode
      gpu: host1x: Add job release callback
      gpu: host1x: Add support for syncpoint waits in CDMA pushbuffer
      gpu: host1x: Add option to skip firewall for a job
      drm/tegra: Extract tegra_gem_lookup()
      drm/tegra: Add new UAPI to header
      drm/tegra: Boot VIC during runtime PM resume
      drm/tegra: Allocate per-engine channel in core code
      drm/tegra: Implement new UAPI
      drm/tegra: Implement syncpoint management UAPI
      drm/tegra: Implement syncpoint wait UAPI
      drm/tegra: Implement job submission part of new UAPI
      drm/tegra: Add job firewall
      drm/tegra: Bump driver version

Thierry Reding (3):
      gpu: host1x: debug: Use dma_addr_t more consistently
      gpu: host1x: debug: Dump only relevant parts of CDMA push buffer
      gpu: host1x: debug: Dump DMASTART and DMAEND register

 drivers/gpu/drm/tegra/Kconfig              |   1 +
 drivers/gpu/drm/tegra/Makefile             |   3 +
 drivers/gpu/drm/tegra/dc.c                 | 358 ++++++++++++++++-
 drivers/gpu/drm/tegra/dc.h                 |  17 +
 drivers/gpu/drm/tegra/drm.c                |  98 +++--
 drivers/gpu/drm/tegra/drm.h                |  12 +
 drivers/gpu/drm/tegra/firewall.c           | 254 ++++++++++++
 drivers/gpu/drm/tegra/gem.c                |  13 +
 drivers/gpu/drm/tegra/gem.h                |   2 +
 drivers/gpu/drm/tegra/plane.c              | 117 ++++++
 drivers/gpu/drm/tegra/plane.h              |  16 +
 drivers/gpu/drm/tegra/submit.c             | 625 +++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/submit.h             |  21 +
 drivers/gpu/drm/tegra/uapi.c               | 338 ++++++++++++++++
 drivers/gpu/drm/tegra/uapi.h               |  58 +++
 drivers/gpu/drm/tegra/vic.c                | 112 +++---
 drivers/gpu/host1x/Makefile                |   1 +
 drivers/gpu/host1x/cdma.c                  |  58 ++-
 drivers/gpu/host1x/fence.c                 | 168 ++++++++
 drivers/gpu/host1x/fence.h                 |  13 +
 drivers/gpu/host1x/hw/channel_hw.c         |  87 +++-
 drivers/gpu/host1x/hw/debug_hw.c           |  32 +-
 drivers/gpu/host1x/hw/debug_hw_1x01.c      |   8 +-
 drivers/gpu/host1x/hw/debug_hw_1x06.c      |  16 +-
 drivers/gpu/host1x/hw/hw_host1x02_uclass.h |  12 +
 drivers/gpu/host1x/hw/hw_host1x04_uclass.h |  12 +
 drivers/gpu/host1x/hw/hw_host1x05_uclass.h |  12 +
 drivers/gpu/host1x/hw/hw_host1x06_uclass.h |  12 +
 drivers/gpu/host1x/hw/hw_host1x07_uclass.h |  12 +
 drivers/gpu/host1x/intr.c                  |   9 +
 drivers/gpu/host1x/intr.h                  |   2 +
 drivers/gpu/host1x/job.c                   |  98 +++--
 drivers/gpu/host1x/job.h                   |  16 +
 drivers/gpu/host1x/syncpt.c                |   2 +
 drivers/gpu/host1x/syncpt.h                |  12 +
 include/linux/host1x.h                     |  27 +-
 include/uapi/drm/tegra_drm.h               | 425 ++++++++++++++++++--
 37 files changed, 2882 insertions(+), 197 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/firewall.c
 create mode 100644 drivers/gpu/drm/tegra/submit.c
 create mode 100644 drivers/gpu/drm/tegra/submit.h
 create mode 100644 drivers/gpu/drm/tegra/uapi.c
 create mode 100644 drivers/gpu/drm/tegra/uapi.h
 create mode 100644 drivers/gpu/host1x/fence.c
 create mode 100644 drivers/gpu/host1x/fence.h
