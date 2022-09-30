Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB065F06EC
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 10:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5823E10EBEC;
	Fri, 30 Sep 2022 08:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DBD10EBC7;
 Fri, 30 Sep 2022 08:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664528070; x=1696064070;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=y/IOwcDTGGZ/62FsnQh7gFyjWNpdE8KkrhndqztKJYk=;
 b=Y61I7SZhSmUvQE46G9OrUDlta6dMlx1St/PxSb8F9AX9AaOdkToos3ab
 Aid+BGw5vSzN4jvcVaEdRAXt8bWdWuPjdwok7adnleNLEr2c2wRoI9pKe
 WDsrAQUSh6j0oZKkEvyedpByflkcFqxKndE1lszunzUy5iAuuvtLEr8eS
 MsKo+PYkcDw3GFK3jjJja/aX7Q5YXe6pgf0REdFlkUFH5nUNiHrKb7smS
 2dE+LPNYVHc6ltAG2CILwGGLbkpxsHxinf6FAvVjG5kOW2Ew9hN7+9aYk
 66zZe9G4xvyLfHLh0N2dzquP8uuG/nl9EG0OtxZ7lPZ9umFjS1qiPPB7p A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="363986478"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; d="scan'208";a="363986478"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 01:54:23 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="765062930"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; d="scan'208";a="765062930"
Received: from kzalewsk-mobl.ger.corp.intel.com (HELO [10.252.37.5])
 ([10.252.37.5])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 01:54:20 -0700
Message-ID: <afbd505a-3799-c73b-8008-ef6e156ad7e1@linux.intel.com>
Date: Fri, 30 Sep 2022 10:54:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.1.2
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Content-Language: en-US
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Small final pull request for v6.1, if still before deadline!

drm-misc-next-2022-09-30:
drm-misc-next for v6.1:

Core Changes:
- Add dma_resv_assert_held to vmap/vunmap calls.
- Add kunit tests for some format conversion calls.
- Don't rewrite link config when setting phy test pattern in
  DP link training.

Driver Changes:
- Assorted small fixes in bridge/lt8192b, qxl, virtio-gpu, ast.
- Fix corrupted image output in lt8912b.
- Fix driver unbind in meson.
- Add INX, BOE, AUO, Multi-Inno Technology panels to panel-edp.
- Synchronize access to GEM bo's in simpledrm, ssd130x.
- Use dev_err_probe in panel-edp and panel-simple.
The following changes since commit 39dd0cc2e5bd0d5188dd69f27e18783cea7ff06a:

  drm/amdgpu: Fix VRAM eviction issue (2022-09-22 19:53:06 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2022-09-30

for you to fetch changes up to c9b48b91e2fbb74fb981aa616a6ef3c78194077f:

  drm/panel: simple: Use dev_err_probe() to simplify code (2022-09-29 14:04:25 -0700)

----------------------------------------------------------------
drm-misc-next for v6.1:

Core Changes:
- Add dma_resv_assert_held to vmap/vunmap calls.
- Add kunit tests for some format conversion calls.
- Don't rewrite link config when setting phy test pattern in
  DP link training.

Driver Changes:
- Assorted small fixes in bridge/lt8192b, qxl, virtio-gpu, ast.
- Fix corrupted image output in lt8912b.
- Fix driver unbind in meson.
- Add INX, BOE, AUO, Multi-Inno Technology panels to panel-edp.
- Synchronize access to GEM bo's in simpledrm, ssd130x.
- Use dev_err_probe in panel-edp and panel-simple.

----------------------------------------------------------------
Adrián Larumbe (3):
      drm/meson: reorder driver deinit sequence to fix use-after-free bug
      drm/meson: explicitly remove aggregate driver at module unload time
      drm/meson: remove drm bridges at aggregate driver unbind time

Christian König (1):
      drm/ttm: add dma_resv_assert_held() calls to vmap/vunmap

Christoph Niedermaier (2):
      dt-bindings: display: simple: Add Multi-Inno Technology MI0800FT-9 panel
      drm/panel: simple: Add Multi-Inno Technology MI0800FT-9

Dan Carpenter (1):
      virtio-gpu: fix shift wrapping bug in virtio_gpu_fence_event_create()

Francesco Dolcini (2):
      drm/bridge: lt8912b: clarify lvds output status
      drm/bridge: lt8912b: fix corrupted image output

Javier Martinez Canillas (2):
      drm/ssd130x: Use drm_atomic_get_new_plane_state()
      drm/ssd130x: Synchronize access to dma-buf imported GEM BOs

José Expósito (3):
      drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb888()
      drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_xrgb2101010()
      drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_gray8()

Khaled Almahallawy (1):
      drm/dp: Don't rewrite link config when setting phy test pattern

Philippe Schenker (2):
      drm/bridge: lt8912b: add vsync hsync
      drm/bridge: lt8912b: set hdmi or dvi mode

Sean Hong (8):
      drm/panel-edp: Add INX N116BCN-EA1
      drm/panel-edp: Add BOE NT116WHM-N21 (HW: V8.1)
      drm/panel-edp: Add BOE NT116WHM-N21
      drm/panel-edp: Add AUO B116XAK01.6
      drm/panel-edp: Add INX N116BCA-EA2
      drm/panel-edp: Fix delays for INX N116BCN-EA1 (HW: C4)
      drm/panel-edp: Fix delays for INX N116BCA-EA2 (HW: C1)
      drm/panel-edp: Add BOE NT116WHM-N4C (HW: V8.1)

Simon Ser (1):
      drm/framebuffer: convert to drm_dbg_kms()

Thomas Zimmermann (5):
      drm/simpledrm: Compute linestride with drm_format_info_min_pitch()
      drm/simpledrm: Use drm_atomic_get_new_plane_state()
      drm/simpledrm: Remove !fb check from atomic_update
      drm/simpledrm: Iterate over damage clips
      drm/simpledrm: Synchronize access to GEM BOs

Yuan Can (2):
      drm/panel: panel-edp: Use dev_err_probe() to simplify code
      drm/panel: simple: Use dev_err_probe() to simplify code

Zongmin Zhou (1):
      drm/qxl: drop set_prod_notify parameter from qxl_ring_create

ruanjinjie (1):
      drm/ast: make ast_modeset static

 .../bindings/display/panel/panel-simple.yaml       |   2 +
 drivers/gpu/drm/ast/ast_drv.c                      |   2 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |  39 +++--
 drivers/gpu/drm/display/drm_dp_helper.c            |   9 -
 drivers/gpu/drm/drm_format_helper.c                |   1 +
 drivers/gpu/drm/drm_framebuffer.c                  |  66 +++----
 drivers/gpu/drm/meson/meson_drv.c                  |  14 +-
 drivers/gpu/drm/meson/meson_drv.h                  |   7 +
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |  13 ++
 drivers/gpu/drm/meson/meson_encoder_cvbs.h         |   1 +
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |  13 ++
 drivers/gpu/drm/meson/meson_encoder_hdmi.h         |   1 +
 drivers/gpu/drm/panel/panel-edp.c                  |  28 ++-
 drivers/gpu/drm/panel/panel-simple.c               |  42 ++++-
 drivers/gpu/drm/qxl/qxl_cmd.c                      |   8 -
 drivers/gpu/drm/qxl/qxl_drv.h                      |   2 -
 drivers/gpu/drm/qxl/qxl_kms.c                      |   4 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |  15 +-
 drivers/gpu/drm/tests/drm_format_helper_test.c     | 190 +++++++++++++++++++++
 drivers/gpu/drm/tiny/simpledrm.c                   |  48 +++---
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |   4 +
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |   2 +-
 22 files changed, 396 insertions(+), 115 deletions(-)
