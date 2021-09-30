Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5C141D72E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 12:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A196EB55;
	Thu, 30 Sep 2021 10:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA6F6EB55;
 Thu, 30 Sep 2021 10:06:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="310697215"
X-IronPort-AV: E=Sophos;i="5.85,335,1624345200"; d="scan'208";a="310697215"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 03:06:24 -0700
X-IronPort-AV: E=Sophos;i="5.85,335,1624345200"; d="scan'208";a="479811607"
Received: from rmuntslx-mobl1.ger.corp.intel.com (HELO [10.252.37.149])
 ([10.252.37.149])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 03:06:19 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-fixes
Message-ID: <f079a5d2-3095-1065-85c2-9d510260215b@linux.intel.com>
Date: Thu, 30 Sep 2021 12:06:21 +0200
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

drm-misc-fixes-2021-09-30:
drm-misc-fixes for v5.15:
- Not sure if drm-misc-fixes-2021-09-08 tag was pulled, assuming it is.
- Power management fixes for vc4.
- Compiler fix for vc4.
- Cursor fix for nouveau.
- Fix ttm buffer moves for ampere gpu's by adding minimal acceleration support.
- Small rockchip fixes.
- Fix DT bindings indent for ili9341.
- Fix y030xx067a init sequence to not get a yellow tint.
- Kconfig fix for fb_simple vs simpledrm.
The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-09-30

for you to fetch changes up to fd09961dbb9ca6558d8ad318a3967c1048bdb090:

  fbdev: simplefb: fix Kconfig dependencies (2021-09-29 09:26:58 +0200)

----------------------------------------------------------------
drm-misc-fixes for v5.15:
- Not sure if drm-misc-fixes-2021-09-08 tag was pulled, assuming it is.
- Power management fixes for vc4.
- Compiler fix for vc4.
- Cursor fix for nouveau.
- Fix ttm buffer moves for ampere gpu's by adding minimal acceleration support.
- Small rockchip fixes.
- Fix DT bindings indent for ili9341.
- Fix y030xx067a init sequence to not get a yellow tint.
- Kconfig fix for fb_simple vs simpledrm.

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

Jernej Skrabec (1):
      drm/sun4i: dw-hdmi: Fix HDMI PHY clock setup

Krzysztof Kozlowski (1):
      dt-bindings: panel: ili9341: correct indentation

Maarten Lankhorst (1):
      Merge drm/drm-fixes into drm-misc-fixes

Maxime Ripard (7):
      drm/vc4: select PM
      drm/vc4: hdmi: Make sure the controller is powered up during bind
      drm/vc4: hdmi: Rework the pre_crtc_configure error handling
      drm/vc4: hdmi: Split the CEC disable / enable functions in two
      drm/vc4: hdmi: Make sure the device is powered with CEC
      drm/vc4: hdmi: Warn if we access the controller while disabled
      drm/vc4: hdmi: Remove unused struct

Palmer Dabbelt (1):
      drm/rockchip: cdn-dp-core: Fix cdn_dp_resume unused warning

xinhui pan (1):
      drm/ttm: Fix a deadlock if the target BO is not idle during swap

 .../bindings/display/panel/ilitek,ili9341.yaml     |   2 +-
 drivers/gpu/drm/kmb/kmb_drv.c                      |   8 +-
 drivers/gpu/drm/kmb/kmb_drv.h                      |   5 +
 drivers/gpu/drm/kmb/kmb_plane.c                    |  81 +++++-
 drivers/gpu/drm/kmb/kmb_plane.h                    |   5 +-
 drivers/gpu/drm/kmb/kmb_regs.h                     |   3 +
 drivers/gpu/drm/nouveau/dispnv50/head.c            |   2 +-
 drivers/gpu/drm/nouveau/include/nvif/class.h       |   2 +
 drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h |   1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c               |   1 +
 drivers/gpu/drm/nouveau/nouveau_chan.c             |   6 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |   4 +
 drivers/gpu/drm/nouveau/nv84_fence.c               |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |   3 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild    |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c   | 311 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c    |   7 +-
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c       |   4 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |  26 +-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c              |   7 +-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h              |   4 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c             |  97 ++++---
 drivers/gpu/drm/vc4/Kconfig                        |   1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 133 +++++----
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                |   6 +
 drivers/of/base.c                                  |   1 +
 drivers/video/fbdev/Kconfig                        |   5 +-
 28 files changed, 591 insertions(+), 139 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
