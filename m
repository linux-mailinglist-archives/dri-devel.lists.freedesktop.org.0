Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B3B3C2998
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 21:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0CF6EA5F;
	Fri,  9 Jul 2021 19:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381D86EA5F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 19:29:18 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id m2so2533129wrq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 12:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F984kgVhvloPuBXYBd7Yfemhs7n0f7X60aP3To3DVPU=;
 b=C515qcADmxSC5ZdybjgaJYvIDJLvxDxY+v5BZZa2/Mm7l+YOVmbbWJnwUe2R2NvLr0
 knjrEa9CBqbEWnSkuyegvwl3gLqMuzDj7AekmIJkkA046baUUTXCN1jAy+XIqIlXejXt
 Q5vQbHalaq5CBF+3ftjDm7bnbjEFfabw0fhETapP5Ov3Uq3jg4y7OOo0tX6HBIY5cVaa
 iT3FMfd1rXkKw14DO0ydhod//pRFipZ+DDs6s8uj7RuGuew8mqjwZFtMlUkhCpKSYPSW
 Pu0ZWZcTk90XVykukwbzNdYFpPk7tiKgXXrTXJgVNkxOJwbsYY4ADIqEPvrWrs1De/5w
 R3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F984kgVhvloPuBXYBd7Yfemhs7n0f7X60aP3To3DVPU=;
 b=gxPKZhAyGigEXXZJoHyP7eJCUDoj+9fwtg56M2DiI2bzB/etqpGNj4vZCgCue60LvS
 2UUSAHp/F/SA9aGI8VdSjGW4WY4BtFaHSci81ACW2F17/zoFeBtN5VKFZeSDJdWknE0n
 99sfGqV2AO49jesS1fVSugD/md2ghE0YokPd/KjO+EGu+/I6j7NhgMJZVEj5U75FNs9t
 oEU0EjWBC0/ZknhkoI/cSvPyjK7wpGTY8+i99f3wkYTdUHASaBxwV/Hd8Qy8XNg+hz7W
 8cYI5IqX1KglKOcpPmmUQugsStCXOtvMdU2kOFU2Xik0UwmwsLxv/hUK43VdRp3F3hpB
 URlQ==
X-Gm-Message-State: AOAM532swlAnHeWneZPD6kI2KHvw0VeWL8LrqwWt2tpAq5VqZPYr5cyM
 RsdX7WCN2kM96yPNMCAKF6M=
X-Google-Smtp-Source: ABdhPJxOjLFaXrrD5Sb5Kj3/rW4BvprZp3LhogErPy8s+S4CyYi8qnPKJS4JzX5T25svPe+sNgemuw==
X-Received: by 2002:a5d:4a0f:: with SMTP id m15mr5403578wrq.350.1625858956705; 
 Fri, 09 Jul 2021 12:29:16 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id y11sm9742859wmi.33.2021.07.09.12.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 12:29:15 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v8 00/14] drm/tegra: Introduce a modern UABI
Date: Fri,  9 Jul 2021 21:31:32 +0200
Message-Id: <20210709193146.2859516-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Hi all,

Mikko has been away for a few weeks, so I've been testing and revising
the new UABI patches in the meantime. There are very minor changes to
the naming of some of the UABI fields, but other than that it's mostly
unchanged from v7.

One notable change is that mappings can now be read-only, write-only,
read-write or none of them (rather than just read-only or read-write),
since those combinations are all supported by the IOMMUs and it might
be useful to make some mappings write-only.

For a full list of changes in v8, see the changelog in patch 6.

I've also updated the libdrm_tegra library to work against this version
of the UABI. A branch can be found here:

  https://gitlab.freedesktop.org/tagr/drm/-/commits/drm-tegra-uabi-v8

That contains helper APIs for the concepts introduced in this series and
shows how they can be used in various tests that can be run for sanity
checking.

In addition, Mikko has made updates to the following projects, though
they may need to be updated for the minor changes in v8:

* vaapi-tegra-driver - https://github.com/cyndis/vaapi-tegra-driver
  Experimental support for MPEG2 and H264 decoding on T210, T186
  and T194.

* xf86-video-opentegra - https://github.com/grate-driver/xf86-video-opentegra
  X11 userspace acceleration driver for Tegra20, Tegra30, and Tegra114.

* grate - https://github.com/grate-driver/grate
  3D rendering testbed for Tegra20, Tegra30, and Tegra114

I plan on putting this into linux-next soon after v5.14-rc1 so that this
can get some soak time.

Thierry

Mikko Perttunen (14):
  gpu: host1x: Add DMA fence implementation
  gpu: host1x: Add no-recovery mode
  gpu: host1x: Add job release callback
  gpu: host1x: Add support for syncpoint waits in CDMA pushbuffer
  drm/tegra: Extract tegra_gem_lookup
  drm/tegra: Add new UAPI to header
  drm/tegra: Boot VIC during runtime PM resume
  drm/tegra: Allocate per-engine channel in core code
  drm/tegra: Implement new UAPI
  drm/tegra: Implement syncpoint management UAPI
  drm/tegra: Implement syncpoint wait UAPI
  drm/tegra: Implement job submission part of new UAPI
  drm/tegra: Add job firewall
  drm/tegra: Bump driver version

 drivers/gpu/drm/tegra/Makefile             |   4 +
 drivers/gpu/drm/tegra/drm.c                |  82 ++--
 drivers/gpu/drm/tegra/drm.h                |  12 +
 drivers/gpu/drm/tegra/firewall.c           | 254 ++++++++++
 drivers/gpu/drm/tegra/gather_bo.c          |  81 ++++
 drivers/gpu/drm/tegra/gather_bo.h          |  22 +
 drivers/gpu/drm/tegra/gem.c                |  13 +
 drivers/gpu/drm/tegra/gem.h                |   2 +
 drivers/gpu/drm/tegra/submit.c             | 527 +++++++++++++++++++++
 drivers/gpu/drm/tegra/submit.h             |  21 +
 drivers/gpu/drm/tegra/uapi.c               | 387 +++++++++++++++
 drivers/gpu/drm/tegra/uapi.h               |  58 +++
 drivers/gpu/drm/tegra/vic.c                | 112 ++---
 drivers/gpu/host1x/Makefile                |   1 +
 drivers/gpu/host1x/cdma.c                  |  58 ++-
 drivers/gpu/host1x/fence.c                 | 209 ++++++++
 drivers/gpu/host1x/fence.h                 |  13 +
 drivers/gpu/host1x/hw/channel_hw.c         |  87 +++-
 drivers/gpu/host1x/hw/debug_hw.c           |   9 +-
 drivers/gpu/host1x/hw/hw_host1x02_uclass.h |  12 +
 drivers/gpu/host1x/hw/hw_host1x04_uclass.h |  12 +
 drivers/gpu/host1x/hw/hw_host1x05_uclass.h |  12 +
 drivers/gpu/host1x/hw/hw_host1x06_uclass.h |  12 +
 drivers/gpu/host1x/hw/hw_host1x07_uclass.h |  12 +
 drivers/gpu/host1x/intr.c                  |   9 +
 drivers/gpu/host1x/intr.h                  |   2 +
 drivers/gpu/host1x/job.c                   |  77 ++-
 drivers/gpu/host1x/job.h                   |  16 +
 drivers/gpu/host1x/syncpt.c                |   2 +
 drivers/gpu/host1x/syncpt.h                |  12 +
 include/linux/host1x.h                     |  22 +-
 include/uapi/drm/tegra_drm.h               | 425 ++++++++++++++++-
 32 files changed, 2408 insertions(+), 169 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/firewall.c
 create mode 100644 drivers/gpu/drm/tegra/gather_bo.c
 create mode 100644 drivers/gpu/drm/tegra/gather_bo.h
 create mode 100644 drivers/gpu/drm/tegra/submit.c
 create mode 100644 drivers/gpu/drm/tegra/submit.h
 create mode 100644 drivers/gpu/drm/tegra/uapi.c
 create mode 100644 drivers/gpu/drm/tegra/uapi.h
 create mode 100644 drivers/gpu/host1x/fence.c
 create mode 100644 drivers/gpu/host1x/fence.h

-- 
2.32.0

