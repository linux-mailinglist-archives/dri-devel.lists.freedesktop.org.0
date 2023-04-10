Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA6A6DCE16
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 01:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12F410E2F6;
	Mon, 10 Apr 2023 23:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADF810E441
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 23:30:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA0C161BB5;
 Mon, 10 Apr 2023 23:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A340C433EF;
 Mon, 10 Apr 2023 23:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681169410;
 bh=fxAJLliD3eqAk8lHb8+D+7yvycKZCMLOfLqalDVN9Wg=;
 h=From:To:Cc:Subject:Date:From;
 b=P62DzVIhPtQ2D9bsyxHswE4BzYFSFvhx4HMoE/Z4zPhDLZOhfeFoXehBcxtaj9Qls
 JWoJiySFmrB2G5auJNJF1bn2X2GRvGqstHrbVaUlta6VEtoXJVBJgzStRQ2RSDqMl8
 4AYbATSCAd3qHUAzlRb4XQZ6MxLYnY5etvTnrV2y6x2ua3f0M+J6w4VEdKdDtdXnCk
 Y4KSb2mEdqlbWvSKzSpAVExHLPbfKO1OG1cUpdoQv36u+ORIi9b+4P/OSXBbQhMSRp
 4IIhta1iJDn6ea81hdJWPI1jdPJeasp+M4GGLlA2ngO2SG9HBQwFp/OtXKoNW/o+M7
 fLc3hz4afBqbA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm next for 6.4
Date: Mon, 10 Apr 2023 23:30:05 +0000
Message-Id: <20230410233005.2572-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>,
 Justin Green <greenjustin@chromium.org>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:

1. Add support for 10-bit overlays
2. Add MediaTek SoC DRM (vdosys1) support for mt8195
3. Change mmsys compatible for mt8195 mediatek-drm
4. Only trigger DRM HPD events if bridge is attached
5. Change the aux retries times when receiving AUX_DEFER

Regards,
Chun-Kuang.

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.4

for you to fetch changes up to 9243d70e05c5989f84f840612965f96b524da925:

  drm/mediatek: dp: Change the aux retries times when receiving AUX_DEFER (2023-04-03 16:49:49 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.4

1. Add support for 10-bit overlays
2. Add MediaTek SoC DRM (vdosys1) support for mt8195
3. Change mmsys compatible for mt8195 mediatek-drm
4. Only trigger DRM HPD events if bridge is attached
5. Change the aux retries times when receiving AUX_DEFER

----------------------------------------------------------------
Alexandre Mergnat (1):
      dt-bindings: display: mediatek: clean unnecessary item

Chen-Yu Tsai (1):
      drm/mediatek: dp: Only trigger DRM HPD events if bridge is attached

Jason-JH.Lin (1):
      drm/mediatek: Change mmsys compatible for mt8195 mediatek-drm

Justin Green (3):
      drm/mediatek: Refactor pixel format logic
      drm/mediatek: Add support for AR30 and BA30 overlays
      drm/mediatek: Enable AR30 and BA30 overlays on MT8195

Nancy.Lin (9):
      dt-bindings: mediatek: add ethdr definition for mt8195
      drm/mediatek: Add ETHDR support for MT8195
      drm/mediatek: Add ovl_adaptor support for MT8195
      drm/mediatek: Add dma dev get function
      drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support
      drm/mediatek: Add drm ovl_adaptor sub driver for MT8195
      drm/mediatek: Add mediatek-drm of vdosys1 support for MT8195
      drm/mediatek: Add mdp_rdma get format function
      drm/mediatek: Add ovl_adaptor get format function

Nathan Lu (1):
      drm/mediatek: Add mediatek-drm of vdosys0 support for mt8188

Xinlei Lee (1):
      drm/mediatek: dp: Change the aux retries times when receiving AUX_DEFER

 .../bindings/display/mediatek/mediatek,ccorr.yaml  |   5 +-
 .../bindings/display/mediatek/mediatek,ethdr.yaml  | 182 +++++++
 drivers/gpu/drm/mediatek/Makefile                  |   2 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |  35 ++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  94 ++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    | 547 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  38 ++
 drivers/gpu/drm/mediatek/mtk_dp.c                  |  15 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  89 +++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h            |   6 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        | 135 +++--
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |  78 ++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             | 475 ++++++++++--------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |  30 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           |  24 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.h           |   3 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c               | 370 ++++++++++++++
 drivers/gpu/drm/mediatek/mtk_ethdr.h               |  25 +
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |  24 +
 19 files changed, 1858 insertions(+), 319 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.h
