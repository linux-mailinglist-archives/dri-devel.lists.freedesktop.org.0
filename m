Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9135400511
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 20:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563956E8C3;
	Fri,  3 Sep 2021 18:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4DF6E8C3;
 Fri,  3 Sep 2021 18:44:00 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 w19-20020a17090aaf9300b00191e6d10a19so182097pjq.1; 
 Fri, 03 Sep 2021 11:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eL8IPpLjz+u+tW0DpBHxfXxNC5xBjc+5MpXdFfRQCQg=;
 b=YHyxlRJ9KHFtVLZv4e7UMFACH3/qLmF3MpF0+yavqfvhZZzDGyVeTR/t+WlFdbFLVC
 3QW7jEOI/CDuyeA3esWyXvJP6wbd9ZCujymOIbf/XF6gMnCuurkKmftPGnQoo/QdkdBw
 7+jKNY0tho3FGFB1N1pvtoSkAJnpCv4TdiNI+uqGHfR1RlNG4kdAfKwYC8B0dViOyCl2
 Ar/dPOHZSWhYrhZuCBShrTNNBOchp926sNID6dKZnFdeLBMYyuwqmrSKkIhgnGTGphJg
 yg2RpyiUoBKInxJyG92yOLpfpuGT8W7LsV13uy83CL2eRKttBllW6DN3dbbLA3gw5XV0
 D7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eL8IPpLjz+u+tW0DpBHxfXxNC5xBjc+5MpXdFfRQCQg=;
 b=GhGcGtVidQWQJbfWqVDIrEvf/+bTLGuDIX8Ty3n4fZFpZy24FeCjwtvwTuvepW9Ec4
 3vTEjSDYkZC8iKawBtW71OSlv8hm0h+ipKfEllWHE0ZVuxE81SPCtxatJxoGmlzwMMuu
 hqAT/q6lh+V9M4ES2ElRCI0kdgig2/iMoX2EOt3Z73BRpMk7/rjyMDLz1hSyRfoSoRzJ
 uE4cbKSp80S5aBmW3rPBLZgY443MWsg6bVqXyhVKvkhegWzkpFzbQftT1cWvjgkoCsaz
 QYcSgE2YdjLnzhdedL+cDJLLmpSns7z3Q6X29WRkwAhA2YHAGAy6vF396A269NnNajDx
 rQVw==
X-Gm-Message-State: AOAM530JdBW7s2keEyw73qelNTpxw7FGD+w44apgq8VuPA64/osqV3nC
 e69jMSJoYxqmWOlxe9C7oYYddzTd6bQ=
X-Google-Smtp-Source: ABdhPJz303qR3WoSm2Y3+5yldCV+CDvbO1CpVugiOEPTnv5ubkj0mTAp3wQrZViz13f/ianeVmFTfg==
X-Received: by 2002:a17:90a:49cb:: with SMTP id
 l11mr359711pjm.142.1630694639358; 
 Fri, 03 Sep 2021 11:43:59 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 y64sm107777pgy.32.2021.09.03.11.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 11:43:58 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Cc: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
 Gustavo Padovan <gustavo@padovan.org>, Jack Zhang <Jack.Zhang1@amd.com>,
 linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
 linux-kernel@vger.kernel.org (open list),
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
 Luben Tuikov <luben.tuikov@amd.com>, Melissa Wen <mwen@igalia.com>,
 Steven Price <steven.price@arm.com>, Tian Tao <tiantao6@hisilicon.com>
Subject: [PATCH v3 0/9] dma-fence: Deadline awareness
Date: Fri,  3 Sep 2021 11:47:51 -0700
Message-Id: <20210903184806.1680887-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Rob Clark <robdclark@chromium.org>

This series adds deadline awareness to fences, so realtime deadlines
such as vblank can be communicated to the fence signaller for power/
frequency management decisions.

This is partially inspired by a trick i915 does, but implemented
via dma-fence for a couple of reasons:

1) To continue to be able to use the atomic helpers
2) To support cases where display and gpu are different drivers

This iteration adds a dma-fence ioctl to set a deadline (both to
support igt-tests, and compositors which delay decisions about which
client buffer to display), and a sw_sync ioctl to read back the
deadline.  IGT tests utilizing these can be found at:

  https://gitlab.freedesktop.org/robclark/igt-gpu-tools/-/commits/fence-deadline


v1: https://patchwork.freedesktop.org/series/93035/
v2: Move filtering out of later deadlines to fence implementation
    to avoid increasing the size of dma_fence
v3: Add support in fence-array and fence-chain; Add some uabi to
    support igt tests and userspace compositors.

Rob Clark (9):
  dma-fence: Add deadline awareness
  drm/vblank: Add helper to get next vblank time
  drm/atomic-helper: Set fence deadline for vblank
  drm/scheduler: Add fence deadline support
  drm/msm: Add deadline based boost support
  dma-buf/fence-array: Add fence deadline support
  dma-buf/fence-chain: Add fence deadline support
  dma-buf/sync_file: Add SET_DEADLINE ioctl
  dma-buf/sw_sync: Add fence deadline support

 drivers/dma-buf/dma-fence-array.c       | 11 ++++
 drivers/dma-buf/dma-fence-chain.c       | 13 +++++
 drivers/dma-buf/dma-fence.c             | 20 +++++++
 drivers/dma-buf/sw_sync.c               | 58 +++++++++++++++++++
 drivers/dma-buf/sync_debug.h            |  2 +
 drivers/dma-buf/sync_file.c             | 19 +++++++
 drivers/gpu/drm/drm_atomic_helper.c     | 36 ++++++++++++
 drivers/gpu/drm/drm_vblank.c            | 32 +++++++++++
 drivers/gpu/drm/msm/msm_fence.c         | 76 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_fence.h         | 20 +++++++
 drivers/gpu/drm/msm/msm_gpu.h           |  1 +
 drivers/gpu/drm/msm/msm_gpu_devfreq.c   | 20 +++++++
 drivers/gpu/drm/scheduler/sched_fence.c | 34 +++++++++++
 drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
 include/drm/drm_vblank.h                |  1 +
 include/drm/gpu_scheduler.h             |  8 +++
 include/linux/dma-fence.h               | 16 ++++++
 include/uapi/linux/sync_file.h          | 20 +++++++
 18 files changed, 388 insertions(+), 1 deletion(-)

-- 
2.31.1

