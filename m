Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 766A6423A73
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 11:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EDB6F63A;
	Wed,  6 Oct 2021 09:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB616F63A;
 Wed,  6 Oct 2021 09:21:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="212890987"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="212890987"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 02:21:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="478043790"
Received: from alebede1-mobl1.ccr.corp.intel.com (HELO [10.252.38.139])
 ([10.252.38.139])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 02:21:24 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-fixes
Message-ID: <3272bf72-2c37-31eb-404e-cf7edd485c7d@linux.intel.com>
Date: Wed, 6 Oct 2021 11:21:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

I've rebased the patches and dropped the vc4 changes. I kept the compiler fix, as it appeared to be unrelated to the clock changes.

drm-misc-fixes-2021-10-06:
Rebased drm-misc-fixes for v5.15-rc5:
- Dropped vc4 patches.
- Compiler fix for vc4.
- Cursor fix for nouveau.
- Fix ttm buffer moves for ampere gpu's by adding minimal acceleration support.
- Small rockchip fixes.
- Fix DT bindings indent for ili9341.
- Fix y030xx067a init sequence to not get a yellow tint.
- Kconfig fix for fb_simple vs simpledrm.
- Assorted nouvaeu memory leaks.
- Fix gbefb when built with COMPILE_TEST.
The following changes since commit 9e1ff307c779ce1f0f810c7ecce3d95bbae40896:

  Linux 5.15-rc4 (2021-10-03 14:08:47 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-10-06

for you to fetch changes up to f5a8703a9c418c6fc54eb772712dfe7641e3991c:

  drm/nouveau/debugfs: fix file release memory leak (2021-10-06 11:12:29 +0200)

----------------------------------------------------------------
Rebased drm-misc-fixes for v5.15-rc5:
- Dropped vc4 patches.
- Compiler fix for vc4.
- Cursor fix for nouveau.
- Fix ttm buffer moves for ampere gpu's by adding minimal acceleration support.
- Small rockchip fixes.
- Fix DT bindings indent for ili9341.
- Fix y030xx067a init sequence to not get a yellow tint.
- Kconfig fix for fb_simple vs simpledrm.
- Assorted nouvaeu memory leaks.
- Fix gbefb when built with COMPILE_TEST.

----------------------------------------------------------------
Arnd Bergmann (1):
      fbdev: simplefb: fix Kconfig dependencies

Ben Skeggs (3):
      drm/nouveau/kms/tu102-: delay enabling cursor until after assign_windows
      drm/nouveau/ga102-: support ttm buffer moves via copy engine
      drm/nouveau/fifo/ga102: initialise chid on return from channel creation

Chris Morgan (1):
      drm/rockchip: Update crtc fixup to account for fractional clk change

Christophe Branchereau (1):
      drm/panel: abt-y030xx067a: yellow tint fix

Edmund Dea (1):
      drm/kmb: Enable alpha blended second plane

Jeremy Cline (1):
      drm/nouveau: avoid a use-after-free when BO init fails

Jernej Skrabec (1):
      drm/sun4i: dw-hdmi: Fix HDMI PHY clock setup

Krzysztof Kozlowski (1):
      dt-bindings: panel: ili9341: correct indentation

Mark Brown (1):
      video: fbdev: gbefb: Only instantiate device when built for IP32

Maxime Ripard (1):
      drm/vc4: hdmi: Remove unused struct

Randy Dunlap (1):
      DRM: delete DRM IRQ legacy midlayer docs

Yang Yingliang (2):
      drm/nouveau/kms/nv50-: fix file release memory leak
      drm/nouveau/debugfs: fix file release memory leak

 .../bindings/display/panel/ilitek,ili9341.yaml     |   2 +-
 Documentation/gpu/drm-internals.rst                |   9 -
 drivers/gpu/drm/kmb/kmb_drv.c                      |   8 +-
 drivers/gpu/drm/kmb/kmb_drv.h                      |   5 +
 drivers/gpu/drm/kmb/kmb_plane.c                    |  81 +++++-
 drivers/gpu/drm/kmb/kmb_plane.h                    |   5 +-
 drivers/gpu/drm/kmb/kmb_regs.h                     |   3 +
 drivers/gpu/drm/nouveau/dispnv50/crc.c             |   1 +
 drivers/gpu/drm/nouveau/dispnv50/head.c            |   2 +-
 drivers/gpu/drm/nouveau/include/nvif/class.h       |   2 +
 drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h |   1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c               |   1 +
 drivers/gpu/drm/nouveau/nouveau_chan.c             |   6 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c          |   1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c              |   4 +
 drivers/gpu/drm/nouveau/nouveau_gem.c              |   4 +-
 drivers/gpu/drm/nouveau/nv84_fence.c               |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |   3 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild    |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c   | 311 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c    |   7 +-
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c       |   4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |  26 +-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c              |   7 +-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h              |   4 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c             |  97 ++++---
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   8 -
 drivers/of/base.c                                  |   1 +
 drivers/video/fbdev/Kconfig                        |   5 +-
 drivers/video/fbdev/gbefb.c                        |   2 +-
 30 files changed, 504 insertions(+), 109 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
