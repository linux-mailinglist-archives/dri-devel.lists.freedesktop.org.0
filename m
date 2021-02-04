Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7593530F5FA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 16:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C5C6EDC8;
	Thu,  4 Feb 2021 15:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D476EDC8
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 15:17:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BA7F64E31;
 Thu,  4 Feb 2021 15:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612451874;
 bh=zNK209Gl4uZunzJzQ3WYCdDVLRby+xZhZaHIDYojS4Y=;
 h=From:To:Cc:Subject:Date:From;
 b=kBCQcYXmwfxn7ym0KuwRG6mfnPhiP9tpxuA8pxVERcCjWZFsiASgKFyTaoFYly9TF
 K1PKTb4MHLNN3Sh3RUo9XQckgkS02vcDXIC/abV7ap8gBoOS8GaREEeq6JDhCv/Npo
 HAJM4JqOD+kQmDDBeyVbJye71LzgDTsVKexYYjQ1zXJ+zzUYEQamI17j9/tcDbGUTr
 k3GNNaZXEg6AYLiEkNJ0PL8Amkvyhx70jcL0xRj5k8E+b2hPCINeZxtC+NL1XajYUi
 Z5EDRyxAzM3UcAF9II7ONafO/3j8jH1OLBwWSW8pQNIRaQr3zPZFQ2Vdu5sSDg1Pfi
 KYpvq8HsecBig==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: [GIT PULL v2] mediatek drm next for 5.12
Date: Thu,  4 Feb 2021 23:17:50 +0800
Message-Id: <20210204151750.7550-1-chunkuang.hu@kernel.org>
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This version fix fixes tag quotation missing.
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

for you to fetch changes up to 738ed4156fbac6f6eb84c23b95cf25aa57707332:

  drm/mediatek: Add matrix_bits private data for ccorr (2021-02-04 22:55:46 +0800)

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
