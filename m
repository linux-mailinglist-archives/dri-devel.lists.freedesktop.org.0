Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F2F30E732
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 00:22:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1316EC3E;
	Wed,  3 Feb 2021 23:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20D76EC3E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 23:22:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E296F64F43;
 Wed,  3 Feb 2021 23:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612394571;
 bh=sdoU4o/jrWCqj5M7F6adRorLtNSuMIzkqhUyKON7ydM=;
 h=From:To:Cc:Subject:Date:From;
 b=GW7I1MRfHATifZCy4VzzMhELkaROQOy3lvoyNiJxv0r2V2Ezp4cCz2nTQ/vA5cAUK
 SwPtAV3iyMn0jX/bmzGI4QfIrWB43NASnF80WjrN4Q7isS6qpuIHcDjO7hFpZ7IIZj
 hu9fGvvxC8Mm/Id2UNtg/v80YhGJsquoFlxqEHMGfSEchVRQoKVkh19QZd8tDccSuN
 lnjbY+YQNv1HNMf5al2qOYCxaDx7rbBP6MsaLK6M10Ko9swgbgY0/z69y9DrOM9TQG
 HzEHl/Tdy7UMNn6FDZzzDxoULgHWxGA6RQ+YQyEnMWteYhAnDOAF/52NzuVEcL4YXq
 e9O5IPXS8HC5Q==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm next for 5.12
Date: Thu,  4 Feb 2021 07:22:47 +0800
Message-Id: <20210203232247.30902-1-chunkuang.hu@kernel.org>
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
Cc: Jitao Shi <jitao.shi@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:

1. Decouple Mediatek DRM sub driver
2. Share mtk mutex driver for both DRM and MDP
3. Add support for SoC MT8183

Regards,
Chun-Kuang.

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-5.12

for you to fetch changes up to f289eb1db7d7e6132c3ecf5049435ace2967b0fc:

  drm/mediatek: Add matrix_bits private data for ccorr (2021-02-03 23:54:07 +0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 5.12

1. Decouple Mediatek DRM sub driver
2. Share mtk mutex driver for both DRM and MDP
3. Add support for SoC MT8183

----------------------------------------------------------------
CK Hu (15):
      drm/mediatek: Separate getting larb device to a function
      drm/mediatek: Move clk info from struct mtk_ddp_comp to sub driver private data
      drm/mediatek: Move regs info from struct mtk_ddp_comp to sub driver private data
      drm/mediatek: Remove irq in struct mtk_ddp_comp
      drm/mediatek: Use struct cmdq_client_reg to gather cmdq variable
      drm/mediatek: Move cmdq_reg info from struct mtk_ddp_comp to sub driver private data
      drm/mediatek: Change sub driver interface from mtk_ddp_comp to device
      drm/mediatek: Register vblank callback function
      drm/mediatek: DRM driver directly refer to sub driver's function
      drm/mediatek: Move mtk_ddp_comp_init() from sub driver to DRM driver
      drm/mediatek: Remove redundant file including
      drm/mediatek: Rename file mtk_drm_ddp to mtk_mutex
      drm/mediatek: Change disp/ddp term to mutex in mtk mutex driver
      drm/mediatek: Automatically search unclaimed mtk mutex in mtk_mutex_get()
      soc / drm: mediatek: Move mtk mutex driver to soc folder

Chun-Kuang Hu (2):
      drm/mediatek: Get CMDQ client register for all ddp component
      drm/mediatek: Use correct device pointer to get CMDQ client register

Hsin-Yi Wang (2):
      drm/mediatek: mtk_dpi: Create connector for bridges
      drm/mediatek: Add mtk_dither_set_common() function

Jitao Shi (1):
      drm/mediatek: dsi: Use IRQF_TRIGGER_NONE for dsi irq trigger type

Yongqiang Niu (15):
      dt-bindings: mediatek: add description for mt8183 display
      dt-bindings: mediatek: add description for mt8192 display
      drm/mediatek: Check if fb is null
      dt-bindings: mediatek: add rdma-fifo-size description for mt8183 display
      dt-bindings: mediatek: add description for postmask
      drm/mediatek: Fix aal size config
      drm/mediatek: Add fifo_size into rdma private data
      drm/mediatek: Separate gamma module
      drm/mediatek: Add has_dither private data for gamma
      drm/mediatek: Add support for SoC MT8183
      drm/mediatek: Enable OVL_LAYER_SMI_ID_EN for multi-layer usecase
      drm/mediatek: Enable dither function
      drm/mediatek: Separate ccorr module
      drm/mediatek: Fix ccorr size config
      drm/mediatek: Add matrix_bits private data for ccorr

 .../bindings/display/mediatek/mediatek,disp.txt    |  12 +-
 drivers/gpu/drm/mediatek/Makefile                  |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c          | 223 +++++++++
 drivers/gpu/drm/mediatek/mtk_disp_color.c          |  89 ++--
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |  92 ++++
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          | 197 ++++++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            | 254 ++++++-----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           | 194 ++++----
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  57 +--
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            | 107 ++---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h            |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h             |  28 --
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        | 503 ++++++++++-----------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        | 100 ++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  88 ++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   5 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  50 +-
 drivers/soc/mediatek/Makefile                      |   1 +
 .../mtk_drm_ddp.c => soc/mediatek/mtk-mutex.c}     | 328 +++++++-------
 include/linux/soc/mediatek/mtk-mutex.h             |  26 ++
 20 files changed, 1446 insertions(+), 914 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_drv.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_gamma.c
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_drm_ddp.h
 rename drivers/{gpu/drm/mediatek/mtk_drm_ddp.c => soc/mediatek/mtk-mutex.c} (53%)
 create mode 100644 include/linux/soc/mediatek/mtk-mutex.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
