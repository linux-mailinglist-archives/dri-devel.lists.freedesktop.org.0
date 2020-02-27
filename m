Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6591D171803
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 13:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2BA6ECA4;
	Thu, 27 Feb 2020 12:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE886E86D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 12:02:42 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id r7so715796wro.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g/5A+DVjtoaJs1559zHEyKQhyqf9vaTLbkhhN4nOCDM=;
 b=LmRPvKz2CUgXjJCFEXblXBOF1NvXvUrP+djNzDGtVq58AFcaDh45u0NlcKu8Fy0RPc
 R2unLoo70JJjoLejUFugE9/ZBCQvWBYQDgbto29i29LFpqUDBN/++2TBhXUfIMBFZ/al
 kNaATpys4YnqjJ/rs0l08bOmdVQ3+HbIwGLoXG/jkVQApcAnYZnsSHzQuuaO/JCZOd/G
 djK22cJKXR3lYAEdZdvZ9avLYKdV/+L+iSpEpAS7n+MkSdhNBj859AxT41Ehik3gARyc
 K1Nc6+kAJoAlSe39YyF1yKnzy1k8cuTjy3bBZ7aF2jBscKzHGGOMq0m6OBpjAdYLwiVP
 0XYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g/5A+DVjtoaJs1559zHEyKQhyqf9vaTLbkhhN4nOCDM=;
 b=qLINohbgDmdWdUtpxbWDzQYWfmlasJFW5Yu/eMAVmKUZ78jcjQzYBBxVvGhfQIkoIW
 Hl1JNkqpIt2EaRGmpn0E/HU+3CbaviJmpIgh8DlkTXxYxkV7qnub1jFsUvu9J/zM6Req
 I+nlHP2fCSOIEOtcE6nv1vhsg2P5SJxwBqmeqzaibqCy/LTiN26ou8taQ5glQSev9Cha
 m6+i4whV3ufxoepQY/W6sI5zZDkAab8BLhxp2QOw6sff+2gchqAvlnFCHoU7eHD5ygae
 JGy+OZWnmtNs31zjrSfow0EC4zE+xfWn2IF2ZySQOuRd+Pk34KNG0Ib2mfOG/6QWivxm
 OGQA==
X-Gm-Message-State: APjAAAUCMOOqtl5o/l9VxVjwE9x7Gn4ZWGuOhaEvvjEf/GZfx7KELxjk
 V4Idm6N5PJg4WDtDhY/iWuJ/x3VRVkI=
X-Google-Smtp-Source: APXvYqwQL4ocFAs/RYCUaTNRR88WGD+abcDxEJlxGuli1OHbJhXtMyV8Hmp9VIdJ7U76Z2LvEAE1tg==
X-Received: by 2002:adf:a285:: with SMTP id s5mr4837704wra.118.1582804961055; 
 Thu, 27 Feb 2020 04:02:41 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t10sm7655017wru.59.2020.02.27.04.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:02:40 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Subject: [PATCH 00/21] drm: subsytem-wide debugfs functions refactor
Date: Thu, 27 Feb 2020 15:02:11 +0300
Message-Id: <20200227120232.19413-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 12:59:10 +0000
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series includes work on various debugfs functions both in drm/core
and across various drivers in the subsystem.
Since commit 987d65d01356 (drm: debugfs: make drm_debugfs_create_files()
never fail), drm_debugfs_create_files() does not fail and only returns
zero. This series therefore removes the left over error handling and
checks for its return value across drm drivers.

As a result of these changes, most drm_debugfs functions are converted
to return void in this series. This also enables the
drm_driver,debugfs_init() hook to be changed to return void. 

Wambui Karuga (21):
  drm/debugfs: remove checks for return value of drm_debugfs functions.
  drm: convert the drm_driver.debugfs_init() hook to return void.
  drm: convert drm_debugfs functions to return void
  drm/vram-helper: make drm_vram_mm_debugfs_init() return void
  drm/vc4: remove check of return value of drm_debugfs functions
  drm/arc: make arcpgu_debugfs_init return void
  drm/arm: make hdlcd_debugfs_init() return void
  drm/etnaviv: remove check for return value of drm_debugfs function
  drm/nouveau: remove checks for return value of debugfs functions
  drm/tegra: remove checks for debugfs functions return value
  drm/v3d: make v3d_debugfs_init return void
  drm/msm: remove checks for return value of drm_debugfs functions.
  drm/omapdrm: remove checks for return value of drm_debugfs functions.
  drm/pl111: make pl111_debugfs_init return void
  drm/sti: remove use drm_debugfs functions as return value
  drm/i915: make *_debugfs_register() functions return void.
  drm/tilcdc: remove check for return value of debugfs functions.
  drm/virtio: make virtio_gpu_debugfs() return void.
  drm/mipi_dbi: make midi_dbi_debugfs_init() return void.
  drm/qxl: have debugfs functions return void.
  drm/arm: have malidp_debufs_init() return void

 drivers/gpu/drm/arc/arcpgu_drv.c              |  7 +--
 drivers/gpu/drm/arm/hdlcd_drv.c               |  7 +--
 drivers/gpu/drm/arm/malidp_drv.c              |  3 +-
 drivers/gpu/drm/drm_atomic.c                  |  8 +--
 drivers/gpu/drm/drm_client.c                  |  8 +--
 drivers/gpu/drm/drm_crtc_internal.h           |  2 +-
 drivers/gpu/drm/drm_debugfs.c                 | 49 +++++--------------
 drivers/gpu/drm/drm_framebuffer.c             |  8 +--
 drivers/gpu/drm/drm_gem_vram_helper.c         | 14 ++----
 drivers/gpu/drm/drm_internal.h                |  2 +-
 drivers/gpu/drm/drm_mipi_dbi.c                |  6 +--
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         | 18 ++-----
 .../drm/i915/display/intel_display_debugfs.c  |  8 +--
 .../drm/i915/display/intel_display_debugfs.h  |  4 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |  8 +--
 drivers/gpu/drm/i915/i915_debugfs.h           |  4 +-
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c     | 18 ++-----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      | 14 ++----
 drivers/gpu/drm/msm/msm_debugfs.c             | 21 +++-----
 drivers/gpu/drm/msm/msm_debugfs.h             |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h                 |  2 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c     | 26 ++++------
 drivers/gpu/drm/nouveau/nouveau_debugfs.h     |  5 +-
 drivers/gpu/drm/omapdrm/omap_debugfs.c        | 29 +++--------
 drivers/gpu/drm/omapdrm/omap_drv.h            |  2 +-
 drivers/gpu/drm/pl111/pl111_debugfs.c         |  8 +--
 drivers/gpu/drm/pl111/pl111_drm.h             |  2 +-
 drivers/gpu/drm/qxl/qxl_debugfs.c             | 21 +++-----
 drivers/gpu/drm/qxl/qxl_drv.h                 | 13 ++---
 drivers/gpu/drm/qxl/qxl_ttm.c                 |  6 +--
 drivers/gpu/drm/sti/sti_cursor.c              | 14 +++---
 drivers/gpu/drm/sti/sti_drv.c                 | 16 ++----
 drivers/gpu/drm/sti/sti_dvo.c                 | 13 ++---
 drivers/gpu/drm/sti/sti_gdp.c                 |  7 +--
 drivers/gpu/drm/sti/sti_hda.c                 | 13 ++---
 drivers/gpu/drm/sti/sti_hdmi.c                | 13 ++---
 drivers/gpu/drm/sti/sti_hqvdp.c               | 12 +++--
 drivers/gpu/drm/sti/sti_mixer.c               |  7 +--
 drivers/gpu/drm/sti/sti_tvout.c               | 13 ++---
 drivers/gpu/drm/sti/sti_vid.c                 |  8 +--
 drivers/gpu/drm/sti/sti_vid.h                 |  2 +-
 drivers/gpu/drm/tegra/dc.c                    | 11 +----
 drivers/gpu/drm/tegra/drm.c                   |  8 +--
 drivers/gpu/drm/tegra/dsi.c                   | 11 +----
 drivers/gpu/drm/tegra/hdmi.c                  | 11 +----
 drivers/gpu/drm/tegra/sor.c                   | 11 +----
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           | 17 ++-----
 drivers/gpu/drm/v3d/v3d_debugfs.c             |  8 +--
 drivers/gpu/drm/v3d/v3d_drv.h                 |  2 +-
 drivers/gpu/drm/vc4/vc4_debugfs.c             | 11 ++---
 drivers/gpu/drm/vc4/vc4_drv.h                 |  2 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c      |  3 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h          |  2 +-
 include/drm/drm_client.h                      |  2 +-
 include/drm/drm_debugfs.h                     |  6 +--
 include/drm/drm_drv.h                         |  2 +-
 include/drm/drm_gem_vram_helper.h             |  2 +-
 include/drm/drm_mipi_dbi.h                    |  2 +-
 58 files changed, 192 insertions(+), 362 deletions(-)

-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
