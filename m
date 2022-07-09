Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 127C856C9F9
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 16:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E76113FF4;
	Sat,  9 Jul 2022 14:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFE2113FF4
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 14:20:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA6F060C36;
 Sat,  9 Jul 2022 14:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C54C3411C;
 Sat,  9 Jul 2022 14:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657376431;
 bh=6FanLZxvWhgkn3OjODsJfNChI79sSokOiEZwzLd2E9M=;
 h=From:To:Cc:Subject:Date:From;
 b=RuSdypsGRIqfxrfoeOoKKMKCjU9d6rfVATZypATfWg9pvrZaznF46ya7su31cfNut
 HQryr5WpYPss5eft3XlN81yTslVSqeWuw5drb9S6iYeAZ0ls9FGSuaovKRJ2bFf55l
 jjXKfUQb76q447DsWKNKThS3Kz88gx7DcOiBIpJm8LBazIN8nuGKo9vKrP/Duh3vBf
 0pgIGTMqeVwBsZhfLMfxzdBqTfLLUSf80+wqzziULiY1/AvaDS+ev9xZwjhzzbpV5/
 5ASK1YlJAyyu532PiRDdjAelo5zdNwsFM0hFHvsZTzHdfhgnZI3WeGcb+ESWDaGbjk
 b0n1KPxhf/OHw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm next for 5.20
Date: Sat,  9 Jul 2022 22:20:21 +0800
Message-Id: <20220709142021.24260-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Guillaume Ranquet <granquet@baylibre.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:

1. Add Mediatek Soc DRM (vdosys0) support for mt8195
2. Cooperate with DSI RX devices to modify dsi funcs and delay mipi high to cooperate with panel sequence
3. Add mt8186 dsi compatible and convert dsi_dtbinding to .yaml
4. Add MediaTek SoC DRM (vdosys1) support for mt8195
5. Add MT8195 dp_intf driver

Regards,
Chun-Kuang.

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-5.20

for you to fetch changes up to d86c1568910e7079e6ceb875d653e44293409194:

  drm/mediatek: dpi: Add dp_intf support (2022-07-06 22:51:44 +0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 5.20

1. Add Mediatek Soc DRM (vdosys0) support for mt8195
2. Cooperate with DSI RX devices to modify dsi funcs and delay mipi high to cooperate with panel sequence
3. Add mt8186 dsi compatible and convert dsi_dtbinding to .yaml
4. Add MediaTek SoC DRM (vdosys1) support for mt8195
5. Add MT8195 dp_intf driver

----------------------------------------------------------------
Allen-KH Cheng (1):
      drm/mediatek: Remove mt8192 display rdma compatible

Bo-Chen Chen (8):
      dt-bindings: display: mediatek: dpi: Revise mediatek strings to correct format
      drm/mediatek: dpi: Add kernel document for struct mtk_dpi_conf
      drm/mediatek: dpi: Remove output format of YUV
      drm/mediatek: dpi: Add support for quantization range
      drm/mediatek: dpi: Add YUV422 output support
      drm/mediatek: dpi: Add config to support direct connection to dpi panels
      drm/mediatek: dpi: Add input_2pixel config support
      drm/mediatek: dpi: Add pixels_per_iter config support

Guillaume Ranquet (9):
      drm/mediatek: dpi: Only enable dpi after the bridge is enabled
      drm/mediatek: dpi: Implement a CK/DE pol toggle in SoC config
      drm/mediatek: dpi: Implement a swap_input toggle in SoC config
      drm/mediatek: dpi: Move dimension mask to SoC config
      drm/mediatek: dpi: Move hvsize_mask to SoC config
      drm/mediatek: dpi: Move swap_shift to SoC config
      drm/mediatek: dpi: Move the yuv422_en_bit to SoC config
      drm/mediatek: dpi: Move the csc_enable bit to SoC config
      drm/mediatek: dpi: Add dp_intf support

Hsin-Yi Wang (1):
      drm/mediatek: Ensure bridge disable happends before suspend

Jitao Shi (2):
      drm/mediatek: Separate poweron/poweroff from enable/disable and define new funcs
      drm/mediatek: Keep dsi as LP00 before dcs cmds transfer

Markus Schneider-Pargmann (1):
      dt-bindings: display: mediatek: dpi: Add DP_INTF compatible

Nancy.Lin (7):
      dt-bindings: display: mediatek: add vdosys1 RDMA definition for mt8195
      drm/mediatek: Add display MDP RDMA support for MT8195
      drm/mediatek: Add display merge advance config API for MT8195
      drm/mediatek: Add display merge start/stop API for cmdq support
      drm/mediatek: Add display merge mute/unmute support for MT8195
      drm/mediatek: Add display merge async reset control
      drm/mediatek: Add mediatek-drm plane color encoding info

Rex-BC Chen (1):
      drm/mediatek: Add MT8186 DSI compatible for mtk_drm_drv.c

Xinlei Lee (5):
      drm/mediatek: Modify dsi funcs to atomic operations
      drm/mediatek: Add pull-down MIPI operation in mtk_dsi_poweroff function
      dt-bindings: display: mediatek: dsi: Convert dsi_dtbinding to .yaml
      dt-bindings: display: mediatek: dsi: Add compatible for MediaTek MT8186
      drm/mediatek: Add mt8186 dsi compatible to mtk_dsi.c

jason-jh.lin (4):
      drm/mediatek: Add DSC support for mediatek-drm
      drm/mediatek: Add MERGE support for mediatek-drm
      drm/mediatek: Add mediatek-drm of vdosys0 support for mt8195
      drm/mediatek: Add suffix 0 to DDP_COMPONENT_DITHER for mt8195 vdosys0

 .../bindings/display/mediatek/mediatek,dpi.yaml    |  11 +-
 .../bindings/display/mediatek/mediatek,dsi.txt     |  62 ----
 .../bindings/display/mediatek/mediatek,dsi.yaml    | 116 ++++++++
 .../display/mediatek/mediatek,mdp-rdma.yaml        |  88 ++++++
 drivers/gpu/drm/mediatek/Makefile                  |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |  20 ++
 drivers/gpu/drm/mediatek/mtk_disp_merge.c          | 320 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |   8 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 | 259 +++++++++++++----
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h            |  18 ++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |  69 ++++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |   3 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             | 184 ++++++++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   8 +
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_plane.h           |   1 +
 drivers/gpu/drm/mediatek/mtk_dsi.c                 | 101 +++++--
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            | 315 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h            |  20 ++
 19 files changed, 1422 insertions(+), 186 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
