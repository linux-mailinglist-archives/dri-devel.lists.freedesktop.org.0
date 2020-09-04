Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DB525DBEA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 16:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D236EBA3;
	Fri,  4 Sep 2020 14:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675A66EBA3
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 14:39:52 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id w5so6994239wrp.8
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 07:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nj1LXr5SmR8mPY+7JqmSg1xTdauPRS5mjVoCd94bZjU=;
 b=hJAPrGZqCSLKyZyTnahX2RMeMHJiHxPhofDaiGz8ZgEPerncqsv5WRUsD58IsjlDXV
 cYW1wpuOALDf5VoL2mUMDwfUObL0C+kXHfLs2hboKSQcBpHJNowd1wtuNtbpUZXY7+jn
 PHBfS9MZUWCeUNGCevqL3/cg9DQXQd4KZHIqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nj1LXr5SmR8mPY+7JqmSg1xTdauPRS5mjVoCd94bZjU=;
 b=UcS1w2wp7IQan+SWtuPX66Jl2cCkux1RQVOCWJ4KdxP0696kRYMtS29e39NvXKdXnl
 FbuBr7LMpAeOdOhtgxmvb2ATsgWYPK0ickxsaD0J7/biXXQNB8EwDmHWrA6CvpjLFxb/
 RzRt29p0weH2QPwSDGy7tNWPknLpDxErxUQ4vKl5m1wSGynhB+t9Je6RCRH6Zavdg4JV
 hF4gm3vVPOhdv0uotjI6Wg/MVtO6hsdAX291e6Gk2R9GO8wmnXhWil01j9COdbRgAy7e
 WaCoQCAVzUAQ6uNmdJhCfObHtcwLZEAd6BHmcPMnxT/dgsp0tBc+VALpMlASM8sY8Xg7
 Cgsw==
X-Gm-Message-State: AOAM532vMgD5xfzPK1j/jqVF0cHYEvgPb62Yu4CrkhQwgRHdoA9s91r5
 pmXAl090lNXJ9XMlUn/uLjPZXLRcX+aloCRe
X-Google-Smtp-Source: ABdhPJwy06z13lLVJqFHnj9qeWAmfyrEPDa4eXi6sWBMhaYi8VpmRhMIORfYphn1FSLZbb+/0om3/Q==
X-Received: by 2002:adf:e6c8:: with SMTP id y8mr8616615wrm.229.1599230390647; 
 Fri, 04 Sep 2020 07:39:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z15sm11597949wrv.94.2020.09.04.07.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 07:39:50 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/24] drm_managed, leftovers
Date: Fri,  4 Sep 2020 16:39:17 +0200
Message-Id: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

After quite a long interruption with looking too much at dma-fence I've
found some time (and motivation due to questions from people who got
confused by the intermediate state) to polish this off. Changes:

- arc changes moved to the end, since they're not really critical. Iirc
  there's still a bug in there, but some are fixed in this version, so
  needs some testing. Also added some of the Acks from Sam, and applied
  the minor nits.

- virtual drivers (vkms, vgem & i915 selftests) changed to use
  devres_open/release_group, so that we don't need a hack in driver core
  or an entire fake bus.

I'd really like to get "drm/dev: Remove drm_dev_init" so that all the
confusing intermediate functions are gone from drivers.

Review, testing, comments all very much welcome like usual.

Cheers, Daniel

Daniel Vetter (24):
  drm/armada: Use devm_drm_dev_alloc
  drm/armada: Don't use drm_device->dev_private
  drm/aspeed: Use managed drmm_mode_config_cleanup
  drm/vgem: Use devm_drm_dev_alloc
  drm/vkms: Use devm_drm_dev_alloc
  drm/xlnx: Use devm_drm_dev_alloc
  drm/i915/selftest: Create mock_destroy_device
  drm/i915/selftests: align more to real device lifetimes
  drm/dev: Remove drm_dev_init
  drm/arc: Switch to devm_drm_dev_alloc
  drm/arc: Stop using drm_device->dev_private
  drm/arc: Delete arcpgu_priv->fb
  drm/arc: Embedded a drm_simple_display_pipe
  drm/arc: Embedd a drm_connector for sim case
  drm/arc: Drop surplus connector registration
  drm/arc: Use drmm_mode_config_cleanup
  drm/arc: Align with simple pipe helpers
  drm/arc: Convert to drm_simple_kms_pipe_helper
  drm/arc: Drop crtc check in arc_pgu_update
  drm/arc: Inline arcpgu_crtc.c
  drm/arc: Inline arcpgu_drm_hdmi_init
  drm/arc: Inline remaining files
  drm/arc: Initialize sim connector before display pipe
  drm/arc: Move to drm/tiny

 MAINTAINERS                                   |   2 +-
 drivers/gpu/drm/Kconfig                       |   2 -
 drivers/gpu/drm/Makefile                      |   1 -
 drivers/gpu/drm/arc/Kconfig                   |  10 -
 drivers/gpu/drm/arc/Makefile                  |   3 -
 drivers/gpu/drm/arc/arcpgu.h                  |  37 --
 drivers/gpu/drm/arc/arcpgu_crtc.c             | 222 ---------
 drivers/gpu/drm/arc/arcpgu_drv.c              | 224 ---------
 drivers/gpu/drm/arc/arcpgu_hdmi.c             |  48 --
 drivers/gpu/drm/arc/arcpgu_regs.h             |  31 --
 drivers/gpu/drm/arc/arcpgu_sim.c              | 108 -----
 drivers/gpu/drm/armada/armada_crtc.c          |   4 +-
 drivers/gpu/drm/armada/armada_debugfs.c       |   2 +-
 drivers/gpu/drm/armada/armada_drm.h           |   2 +
 drivers/gpu/drm/armada/armada_drv.c           |  30 +-
 drivers/gpu/drm/armada/armada_fbdev.c         |   4 +-
 drivers/gpu/drm/armada/armada_gem.c           |   4 +-
 drivers/gpu/drm/armada/armada_overlay.c       |   8 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  15 +-
 drivers/gpu/drm/drm_drv.c                     |  41 +-
 drivers/gpu/drm/drm_internal.h                |   1 +
 drivers/gpu/drm/drm_managed.c                 |  13 -
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |   2 +-
 .../drm/i915/gem/selftests/i915_gem_context.c |   2 +-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |   2 +-
 .../drm/i915/gem/selftests/i915_gem_object.c  |   2 +-
 .../drm/i915/gem/selftests/i915_gem_phys.c    |   2 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c   |   2 +-
 .../gpu/drm/i915/selftests/i915_gem_evict.c   |   2 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |   2 +-
 drivers/gpu/drm/i915/selftests/i915_request.c |   2 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c     |   2 +-
 .../drm/i915/selftests/intel_memory_region.c  |   2 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  47 +-
 .../gpu/drm/i915/selftests/mock_gem_device.h  |   2 +
 drivers/gpu/drm/tiny/Kconfig                  |  10 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/arcpgu.c                 | 434 ++++++++++++++++++
 drivers/gpu/drm/vgem/vgem_drv.c               |  55 +--
 drivers/gpu/drm/vkms/vkms_drv.c               |  54 ++-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c           |  21 +-
 include/drm/drm_drv.h                         |   4 -
 42 files changed, 578 insertions(+), 884 deletions(-)
 delete mode 100644 drivers/gpu/drm/arc/Kconfig
 delete mode 100644 drivers/gpu/drm/arc/Makefile
 delete mode 100644 drivers/gpu/drm/arc/arcpgu.h
 delete mode 100644 drivers/gpu/drm/arc/arcpgu_crtc.c
 delete mode 100644 drivers/gpu/drm/arc/arcpgu_drv.c
 delete mode 100644 drivers/gpu/drm/arc/arcpgu_hdmi.c
 delete mode 100644 drivers/gpu/drm/arc/arcpgu_regs.h
 delete mode 100644 drivers/gpu/drm/arc/arcpgu_sim.c
 create mode 100644 drivers/gpu/drm/tiny/arcpgu.c

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
