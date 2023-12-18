Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE308179D6
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B98B10E3B4;
	Mon, 18 Dec 2023 18:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013E010E1B4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:37:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 297F36103E;
 Mon, 18 Dec 2023 14:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE9AC433C8;
 Mon, 18 Dec 2023 14:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702911510;
 bh=6LAl176ZhST6JB0D7GcBf8KrJiM7ETJQxrahsxZmBok=;
 h=From:To:Cc:Subject:Date:From;
 b=muTOJZ8woBy6swRqoxPS4w+YQaS2b1WXqn+sySIkIuQMoB2FoGs4CYSNCh2abm3Zm
 XGZJ/ugBxCiE0CsuR4rpTTw/HjdyYZ6XnGkY2p/fQVPHZwyMppEn5OylbHD0XSzFzW
 B6e+i88s0Bw5a1RY8UEnyIwI1bTOxCjzO+co0722beET9uSPWUv+YHpxNP2OokrRMI
 90m9WszrI/r6LVtMTtyoNHHiVhMYFZpnBb+K3YITrOfnwWh9sD/KlhXEtgIBgtxkm+
 dueVeARKlqWnPAMagflm0A+B8dKgj5NqKtI5SxoLQ1cZhCBp2EW7boDMHwG/gCDvwk
 pekvP7R8/6lzg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm next for 6.8
Date: Mon, 18 Dec 2023 14:58:26 +0000
Message-Id: <20231218145826.5643-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Robin Murphy <robin.murphy@arm.com>, Yang Li <yang.lee@linux.alibaba.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:

1. Use devm_platform_ioremap_resource()
2. Stop using iommu_present()
3. Add display driver for MT8188 VDOSYS1
4. Add phy_mtk_dp module as pre-dependency

Regards,
Chun-Kuang.

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.8

for you to fetch changes up to c8048dd0b07df68724805254b9e994d99e9a7af4:

  drm/mediatek: dp: Add phy_mtk_dp module as pre-dependency (2023-12-18 14:31:32 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.8

1. Use devm_platform_ioremap_resource()
2. Stop using iommu_present()
3. Add display driver for MT8188 VDOSYS1
4. Add phy_mtk_dp module as pre-dependency

----------------------------------------------------------------
Hsiao Chien Sung (15):
      dt-bindings: display: mediatek: ethdr: Add compatible for MT8188
      dt-bindings: display: mediatek: mdp-rdma: Add compatible for MT8188
      dt-bindings: display: mediatek: merge: Add compatible for MT8188
      dt-bindings: display: mediatek: padding: Add MT8188
      drm/mediatek: Rename OVL_ADAPTOR_TYPE_RDMA
      drm/mediatek: Add component ID to component match structure
      drm/mediatek: Manage component's clock with function pointers
      drm/mediatek: Power on/off devices with function pointers
      drm/mediatek: Start/Stop components with function pointers
      drm/mediatek: Sort OVL adaptor components
      drm/mediatek: Refine device table of OVL adaptor
      drm/mediatek: Support MT8188 Padding in display driver
      drm/mediatek: Return error if MDP RDMA failed to enable the clock
      drm/mediatek: Remove the redundant driver data for DPI
      drm/mediatek: Fix underrun in VDO1 when switches off the layer

Nícolas F. R. A. Prado (1):
      drm/mediatek: dp: Add phy_mtk_dp module as pre-dependency

Robin Murphy (1):
      drm/mediatek: Stop using iommu_present()

Yang Li (1):
      drm/mediatek: Use devm_platform_ioremap_resource()

 .../bindings/display/mediatek/mediatek,ethdr.yaml  |   6 +-
 .../display/mediatek/mediatek,mdp-rdma.yaml        |   6 +-
 .../bindings/display/mediatek/mediatek,merge.yaml  |   3 +
 .../display/mediatek/mediatek,padding.yaml         |  81 +++++++
 drivers/gpu/drm/mediatek/Makefile                  |   3 +-
 drivers/gpu/drm/mediatek/mtk_cec.c                 |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c            |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c          |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |   8 +
 drivers/gpu/drm/mediatek/mtk_disp_merge.c          |   2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    | 248 ++++++++++++---------
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   1 +
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  16 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  10 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |  20 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   5 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   2 +-
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |  19 +-
 drivers/gpu/drm/mediatek/mtk_padding.c             | 160 +++++++++++++
 20 files changed, 461 insertions(+), 143 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_padding.c
