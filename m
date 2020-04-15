Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA641A946B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842746E871;
	Wed, 15 Apr 2020 07:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9386E86C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:40:41 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id x25so16190682wmc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nzPeTnntXW4E7Ic9g79AJoLaV8KHBPFXuUxGVLlBHgE=;
 b=HSmL8/gKFN/DIAN0XE99czJiPdqEjOzI8QEAHbwv9mawKDLNP7qnWwxqR9kCcZrkiY
 7Jbg+Fz1bGsgQaZRHZqwcqVIyYQ0n8FF0tN8WjV09NnXCvQDfLLrsjgrixw0dlGK6P9i
 5L5A9LrKFZJz7LCUigXE953k5FtwcuQ89Htg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nzPeTnntXW4E7Ic9g79AJoLaV8KHBPFXuUxGVLlBHgE=;
 b=tiY7b+RDKREkSc4TVi4JjWM+ciVd2P/T16xOCh5Mwjp5v2mEOzXM1Ie8/34E1/cCtr
 2PNV3k3wbl+RGOC9/e09mHPp4010qchiAlry1MebNV/VWDt5C9VAIVHRjiMK2yMa8Rsv
 35cwiIMgTBuF1wbXiKAYT6bJGRr1sZVWAX+/fXnLYuJSbhKzX4Ky1Tyq4+0Yviy9j2zg
 Bw/nIcKCdkp2f11TZFIu1CtHAMiSyKCMO/Pl5n9gIZeqT0C5jm2PqSodoGUTR9JqAmXe
 eJMKDRu+jttLXMMxQ7qQffh9VigKKO/cBZ9ZlN1apBhHtxeX8QXxGS3bRzh6WTyYPsN4
 TbuQ==
X-Gm-Message-State: AGi0PuaZQn0NE/LvGyJY3H5dQi/QJNg6VYcmw4urRBGOVEWULUffHW5M
 uObybl8j1OOMb5EgYVEsGjHlhA==
X-Google-Smtp-Source: APiQypIL9dVS6SqetR9ZhnZzbbzZegg8u//wx2aKuVCD8O43SGyr5KUjjLd/T0bJ3yG1z7Opi1zpKQ==
X-Received: by 2002:a1c:7ed7:: with SMTP id z206mr3563889wmc.64.1586936440164; 
 Wed, 15 Apr 2020 00:40:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:40:39 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 00/59] devm_drm_dev_alloc, v2
Date: Wed, 15 Apr 2020 09:39:35 +0200
Message-Id: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
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
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Here's the next round of devm_drm_dev_alloc. Big changes:

- lots of acks, reviews and some testing tags. Very much appreciated!

- I dropped the core driver patch, and hence also the patches for vgem,
  vkms and i915-selftests. That needs more discussions first.

- I started to convert some of the other drivers that still used
  drm_dev_alloc to the shiny new world, with a pile of cleanups on top. So
  lots more patches to test and review.

Looking at git grep output for drm_dev_alloc() I think there's enough room
for another few similarly sized patch series. I'm kinda using that also to
survey the state of drivers, so I have a good idea what drmm_ versions for
various modeset objects should look like. Atm still not sure how to best
approach this, with the mix of drivers we do have: Some use devm_kzalloc,
some explicit kzalloc + kfree in cleanup code, some embedded it somewhere
else.

As usual, review, testing and comments very much appreciated.

Cheers, Daniel

Daniel Vetter (59):
  drm: Add devm_drm_dev_alloc macro
  drm/vboxvideo: drop DRM_MTRR_WC #define
  drm/vboxvideo: Use devm_drm_dev_alloc
  drm/vboxvideo: Stop using drm_device->dev_private
  drm/vboxvidoe: use managed pci functions
  drm/vboxvideo: Use devm_gen_pool_create
  drm/v3d: Don't set drm_device->dev_private
  drm/v3d: Use devm_drm_dev_alloc
  drm/v3d: Delete v3d_dev->dev
  drm/v3d: Delete v3d_dev->pdev
  drm/udl: Use devm_drm_dev_alloc
  drm/udl: don't set drm_device->dev_private
  drm/st7735r: Use devm_drm_dev_alloc
  drm/st7586: Use devm_drm_dev_alloc
  drm/repaper: Use devm_drm_dev_alloc
  drm/mi0283qt: Use devm_drm_dev_alloc
  drm/ili9486: Use devm_drm_dev_alloc
  drm/ili9341: Use devm_drm_dev_alloc
  drm/ili9225: Use devm_drm_dev_alloc
  drm/hx8357d: Use devm_drm_dev_alloc
  drm/gm12u320: Use devm_drm_dev_alloc
  drm/gm12u320: Don't use drm_device->dev_private
  drm/tidss: Use devm_drm_dev_alloc
  drm/tidss: Don't use drm_device->dev_private
  drm/tidss: Delete tidss->saved_state
  drm/qxl: Use devm_drm_dev_alloc
  drm/qxl: Don't use drm_device->dev_private
  drm/mcde: Use devm_drm_dev_alloc
  drm/mcde: Don't use drm_device->dev_private
  drm/ingenic: Use devm_drm_dev_alloc
  drm/ingenic: Don't set drm_device->dev_private
  drm/komeda: use devm_drm_dev_alloc
  drm/armada: Use devm_drm_dev_alloc
  drm/armada: Don't use drm_device->dev_private
  drm/cirrus: Use devm_drm_dev_alloc
  drm/cirrus: Don't use drm_device->dev_private
  drm/cirrus: Move to drm/tiny
  drm/i915: Use devm_drm_dev_alloc
  drm/arcpgu: Switch to devm_drm_dev_alloc
  drm/arcpgu: Stop using drm_device->dev_private
  drm/arcpgu: Delete arcpgu_priv->fb
  drm/arc: Embedded a drm_simple_display_pipe
  drm/arc: Embedd a drm_connector for sim case
  drm/arc: Drop surplus connector registration
  drm/arc: Use drmm_mode_config_cleanup
  drm/arc: Align with simple pipe helpers
  drm/arc: Convert to drm_simple_kms_pipe_helper
  drm/arc: Drop fb/crtc check in arc_pgu_update
  drm/arc: Inline arcpgu_crtc.c
  drm/arc: Inline arcpgu_drm_hdmi_init
  drm/arc: Inline remaining files
  drm/arc: Initialize sim connector before display pipe
  drm/arc: Move to drm/tiny
  drm/aspeed: Drop aspeed_gfx->fbdev
  drm/aspeed: Use devm_drm_dev_alloc
  drm/aspeed: Use managed drmm_mode_config_cleanup
  drm/ast: Use managed pci functions
  drm/ast: Drop explicit connector register/unregister
  drm/bochs: Remove explicit drm_connector_register

 MAINTAINERS                                   |   4 +-
 drivers/gpu/drm/Kconfig                       |   4 -
 drivers/gpu/drm/Makefile                      |   2 -
 drivers/gpu/drm/arc/Kconfig                   |  10 -
 drivers/gpu/drm/arc/Makefile                  |   3 -
 drivers/gpu/drm/arc/arcpgu.h                  |  37 --
 drivers/gpu/drm/arc/arcpgu_crtc.c             | 222 ---------
 drivers/gpu/drm/arc/arcpgu_drv.c              | 234 ---------
 drivers/gpu/drm/arc/arcpgu_hdmi.c             |  48 --
 drivers/gpu/drm/arc/arcpgu_regs.h             |  31 --
 drivers/gpu/drm/arc/arcpgu_sim.c              | 108 -----
 .../gpu/drm/arm/display/komeda/komeda_kms.c   |  16 +-
 drivers/gpu/drm/armada/armada_crtc.c          |   4 +-
 drivers/gpu/drm/armada/armada_debugfs.c       |   2 +-
 drivers/gpu/drm/armada/armada_drm.h           |   2 +
 drivers/gpu/drm/armada/armada_drv.c           |  30 +-
 drivers/gpu/drm/armada/armada_fbdev.c         |   4 +-
 drivers/gpu/drm/armada/armada_gem.c           |   4 +-
 drivers/gpu/drm/armada/armada_overlay.c       |   8 +-
 drivers/gpu/drm/aspeed/aspeed_gfx.h           |   3 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c      |   2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  42 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_out.c       |   2 +-
 drivers/gpu/drm/ast/ast_drv.c                 |  10 +-
 drivers/gpu/drm/ast/ast_main.c                |   3 -
 drivers/gpu/drm/ast/ast_mode.c                |   3 -
 drivers/gpu/drm/bochs/bochs_kms.c             |   1 -
 drivers/gpu/drm/cirrus/Kconfig                |  19 -
 drivers/gpu/drm/cirrus/Makefile               |   2 -
 drivers/gpu/drm/drm_drv.c                     |  23 +
 drivers/gpu/drm/i915/i915_drv.c               |  17 +-
 drivers/gpu/drm/i915/i915_pci.c               |   2 -
 drivers/gpu/drm/ingenic/ingenic-drm.c         |  15 +-
 drivers/gpu/drm/mcde/mcde_display.c           |  10 +-
 drivers/gpu/drm/mcde/mcde_drm.h               |   2 +
 drivers/gpu/drm/mcde/mcde_drv.c               |  21 +-
 drivers/gpu/drm/mcde/mcde_dsi.c               |   2 +-
 drivers/gpu/drm/qxl/qxl_debugfs.c             |   7 +-
 drivers/gpu/drm/qxl/qxl_display.c             |  32 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |  23 +-
 drivers/gpu/drm/qxl/qxl_drv.h                 |   7 +-
 drivers/gpu/drm/qxl/qxl_dumb.c                |   2 +-
 drivers/gpu/drm/qxl/qxl_gem.c                 |   2 +-
 drivers/gpu/drm/qxl/qxl_ioctl.c               |  14 +-
 drivers/gpu/drm/qxl/qxl_irq.c                 |   2 +-
 drivers/gpu/drm/qxl/qxl_kms.c                 |  13 +-
 drivers/gpu/drm/qxl/qxl_object.c              |   2 +-
 drivers/gpu/drm/qxl/qxl_release.c             |   2 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                 |   2 +-
 drivers/gpu/drm/tidss/tidss_crtc.c            |  16 +-
 drivers/gpu/drm/tidss/tidss_drv.c             |  17 +-
 drivers/gpu/drm/tidss/tidss_drv.h             |   4 +-
 drivers/gpu/drm/tidss/tidss_irq.c             |  12 +-
 drivers/gpu/drm/tidss/tidss_kms.c             |   2 +-
 drivers/gpu/drm/tidss/tidss_plane.c           |   6 +-
 drivers/gpu/drm/tiny/Kconfig                  |  29 ++
 drivers/gpu/drm/tiny/Makefile                 |   2 +
 drivers/gpu/drm/tiny/arcpgu.c                 | 450 ++++++++++++++++++
 drivers/gpu/drm/{cirrus => tiny}/cirrus.c     |  22 +-
 drivers/gpu/drm/tiny/gm12u320.c               |  24 +-
 drivers/gpu/drm/tiny/hx8357d.c                |  13 +-
 drivers/gpu/drm/tiny/ili9225.c                |  13 +-
 drivers/gpu/drm/tiny/ili9341.c                |  13 +-
 drivers/gpu/drm/tiny/ili9486.c                |  13 +-
 drivers/gpu/drm/tiny/mi0283qt.c               |  13 +-
 drivers/gpu/drm/tiny/repaper.c                |  14 +-
 drivers/gpu/drm/tiny/st7586.c                 |  13 +-
 drivers/gpu/drm/tiny/st7735r.c                |  13 +-
 drivers/gpu/drm/udl/udl_connector.c           |   4 +-
 drivers/gpu/drm/udl/udl_drv.c                 |  27 +-
 drivers/gpu/drm/udl/udl_modeset.c             |   6 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c             |  12 +-
 drivers/gpu/drm/v3d/v3d_drv.c                 |  47 +-
 drivers/gpu/drm/v3d/v3d_drv.h                 |   7 +-
 drivers/gpu/drm/v3d/v3d_gem.c                 |  17 +-
 drivers/gpu/drm/v3d/v3d_irq.c                 |  16 +-
 drivers/gpu/drm/v3d/v3d_mmu.c                 |  10 +-
 drivers/gpu/drm/v3d/v3d_sched.c               |  10 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |  26 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.h          |   1 +
 drivers/gpu/drm/vboxvideo/vbox_irq.c          |   2 +-
 drivers/gpu/drm/vboxvideo/vbox_main.c         |  29 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c         |  10 +-
 drivers/gpu/drm/vboxvideo/vbox_ttm.c          |  12 -
 include/drm/drm_drv.h                         |  33 ++
 85 files changed, 822 insertions(+), 1196 deletions(-)
 delete mode 100644 drivers/gpu/drm/arc/Kconfig
 delete mode 100644 drivers/gpu/drm/arc/Makefile
 delete mode 100644 drivers/gpu/drm/arc/arcpgu.h
 delete mode 100644 drivers/gpu/drm/arc/arcpgu_crtc.c
 delete mode 100644 drivers/gpu/drm/arc/arcpgu_drv.c
 delete mode 100644 drivers/gpu/drm/arc/arcpgu_hdmi.c
 delete mode 100644 drivers/gpu/drm/arc/arcpgu_regs.h
 delete mode 100644 drivers/gpu/drm/arc/arcpgu_sim.c
 delete mode 100644 drivers/gpu/drm/cirrus/Kconfig
 delete mode 100644 drivers/gpu/drm/cirrus/Makefile
 create mode 100644 drivers/gpu/drm/tiny/arcpgu.c
 rename drivers/gpu/drm/{cirrus => tiny}/cirrus.c (97%)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
