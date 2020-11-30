Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B25F2C92FC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 00:48:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F0389D52;
	Mon, 30 Nov 2020 23:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFB589D52
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 23:48:12 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1300B207BB;
 Mon, 30 Nov 2020 23:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606780092;
 bh=+xv/f+h5mrQR6/0RhJ3LoQUvb0DRrGTXZM9jPFfSmVY=;
 h=From:To:Cc:Subject:Date:From;
 b=bITjYOIjE0izugD+qlNWZ5uahY4XQ0g0WJ1xmY64t/HKr7qGM85e3hBy1vcZYJW3E
 /KLkKVyLl9fw3upJ8SThc27s7BWEx8WP+Fj6q708kcovfGmdEqFn0tOjxZV401v5BO
 +y3Xyw+U/FTtFuGXLIxTjtogkyWufahjcpTBFSOQ=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm next for 5.11-2
Date: Tue,  1 Dec 2020 07:48:07 +0800
Message-Id: <20201130234807.936-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, Robin Murphy <robin.murphy@arm.com>,
 Fabien Parent <fparent@baylibre.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:

1. Add MT8167 support
2. Cleanup function
3. Convert the dpi bindings to yaml
4. Drop local dma_parms
5. Fix formatting and provide missing member description
6. Introduce GEM object functions
7. Fix aliases name
8. Move MIPI DSI phy driver to phy folder

Regards,
Chun-Kuang.

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-5.11-2

for you to fetch changes up to a4423bec44744ce556e91fe8efffbd10327f79fd:

  MAINTAINERS: add files for Mediatek DRM drivers (2020-11-30 23:43:03 +0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 5.11-2

1. Add MT8167 support
2. Cleanup function
3. Convert the dpi bindings to yaml
4. Drop local dma_parms
5. Fix formatting and provide missing member description
6. Introduce GEM object functions
7. Fix aliases name
8. Move MIPI DSI phy driver to phy folder

----------------------------------------------------------------
Bernard Zhao (1):
      drm/mediatek: Optimize functions which do not need to return

Chun-Kuang Hu (3):
      drm/mediatek: Separate mtk_mipi_tx to an independent module
      phy: mediatek: Move mtk_mipi_dsi_phy driver into drivers/phy/mediatek folder
      MAINTAINERS: add files for Mediatek DRM drivers

Enric Balletbo i Serra (1):
      drm/mediatek: Use correct aliases name for ovl

Fabien Parent (3):
      dt-bindings: display: mediatek: disp: add documentation for MT8167 SoC
      drm/mediatek: Add disp-color MT8167 support
      drm/mediatek: Add DDP support for MT8167

Jitao Shi (1):
      dt-bindings: display: mediatek: convert the dpi bindings to yaml

Lee Jones (4):
      drm/mediatek/mtk_disp_rdma: Fix formatting and supply missing struct member description
      drm/mediatek/mtk_drm_drv: Staticise local function invoked by reference
      drm/mediatek/mtk_disp_color: Fix formatting and provide missing member description
      drm/mediatek/mtk_disp_ovl: Fix formatting and provide missing member description

Robin Murphy (1):
      drm/mediatek: Drop local dma_parms

Thomas Zimmermann (1):
      drm/mediatek: Introduce GEM object functions

 .../bindings/display/mediatek/mediatek,disp.txt    |  4 +-
 .../bindings/display/mediatek/mediatek,dpi.txt     | 42 ----------
 .../bindings/display/mediatek/mediatek,dpi.yaml    | 98 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 drivers/gpu/drm/mediatek/Kconfig                   |  1 +
 drivers/gpu/drm/mediatek/Makefile                  |  3 -
 drivers/gpu/drm/mediatek/mtk_disp_color.c          | 12 ++-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  5 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  5 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c             | 47 +++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             | 37 ++------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |  3 -
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             | 11 +++
 drivers/gpu/drm/mediatek/mtk_hdmi.c                | 27 ++----
 drivers/phy/mediatek/Kconfig                       |  7 ++
 drivers/phy/mediatek/Makefile                      |  5 ++
 .../mediatek/phy-mtk-mipi-dsi-mt8173.c}            |  2 +-
 .../mediatek/phy-mtk-mipi-dsi-mt8183.c}            |  2 +-
 .../mediatek/phy-mtk-mipi-dsi.c}                   |  5 +-
 .../mediatek/phy-mtk-mipi-dsi.h}                   |  0
 21 files changed, 207 insertions(+), 112 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
 rename drivers/{gpu/drm/mediatek/mtk_mt8173_mipi_tx.c => phy/mediatek/phy-mtk-mipi-dsi-mt8173.c} (99%)
 rename drivers/{gpu/drm/mediatek/mtk_mt8183_mipi_tx.c => phy/mediatek/phy-mtk-mipi-dsi-mt8183.c} (99%)
 rename drivers/{gpu/drm/mediatek/mtk_mipi_tx.c => phy/mediatek/phy-mtk-mipi-dsi.c} (97%)
 rename drivers/{gpu/drm/mediatek/mtk_mipi_tx.h => phy/mediatek/phy-mtk-mipi-dsi.h} (100%)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
