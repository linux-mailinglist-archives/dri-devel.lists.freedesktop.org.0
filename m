Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF1CA5E864
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 00:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6EE010E7CA;
	Wed, 12 Mar 2025 23:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kseCjW2T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41BC10E69D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 23:29:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7F2835C3478;
 Wed, 12 Mar 2025 23:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13CC7C4CEDD;
 Wed, 12 Mar 2025 23:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741822154;
 bh=x62sbzA5ZGFY6Vpx4VKtlq3SQzLkZlbRve7cNBb0oWU=;
 h=From:To:Subject:Date:From;
 b=kseCjW2Tq4Ugz8JV7IfKJEKkTCrp3D9G6oktITPUad7QBX82kKdRfBWTx1QYRq+ke
 YXcbgW7ngVzWCJ5Jmy/QDxYmb89kSLoM0A/Ff+WmnTdC2spJi4o6sB0Mw4myv41qfF
 q/mAC7HxNsVEmLECqr1ndkQGBs8mf3l2I0yevhqHlSCi12BRUPtmUu8til9a1Ydjfb
 c6SdP5U2VjMwSSR6ps/ii4soOv1MoSWHU/zKSIiQTVjsmFRQhjam7kNtUL1b7hFx/8
 Bi9cL8Rqrxr3YNtiwmrxNlR/2IzILq3D3xzQ4F1E4WtUXTBmVnzcz+xXYvZDiaFwWH
 1cdAPLUFq1Zeg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Douglas Anderson <dianders@chromium.org>,
 Fabien Parent <fparent@baylibre.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: [GIT PULL v2] mediatek drm next for 6.15
Date: Wed, 12 Mar 2025 23:29:09 +0000
Message-Id: <20250312232909.9304-1-chunkuang.hu@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:
1. HDMI fixup and refinement
2. Move to devm_platform_ioremap_resource() usage
3. Add MT8188 dsc compatible
4. Fix config_updating flag never false when no mbox channel
5. dp: drm_err => dev_err in HPD path to avoid NULL ptr
6. Add dpi power-domains example
7. Add MT8365 SoC support
8. Fix error codes in mtk_dsi_host_transfer()

---
Change from v1: Fix build warning.

Regards,
Chun-Kuang.

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.15-v2

for you to fetch changes up to dcb166ee43c3d594e7b73a24f6e8cf5663eeff2c:

  drm/mediatek: dsi: fix error codes in mtk_dsi_host_transfer() (2025-03-12 23:17:22 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.15

1. HDMI fixup and refinement
2. Move to devm_platform_ioremap_resource() usage
3. Add MT8188 dsc compatible
4. Fix config_updating flag never false when no mbox channel
5. dp: drm_err => dev_err in HPD path to avoid NULL ptr
6. Add dpi power-domains example
7. Add MT8365 SoC support
8. Fix error codes in mtk_dsi_host_transfer()

----------------------------------------------------------------
AngeloGioacchino Del Regno (21):
      drm/mediatek: mtk_hdmi: Unregister audio platform device on failure
      drm/mediatek: mtk_hdmi: Fix typo for aud_sampe_size member
      drm/mediatek: mtk_hdmi: Compress of_device_id array entries
      drm/mediatek: mtk_hdmi: Move vendor/product strings to drm_bridge
      drm/mediatek: mtk_hdmi: Remove unused members of struct mtk_hdmi
      drm/mediatek: mtk_hdmi: Use devm managed version of drm_bridge_add
      drm/mediatek: mtk_hdmi: Remove ifdef for CONFIG_PM_SLEEP
      drm/mediatek: mtk_hdmi: Remove goto in mtk_hdmi_clk_enable_audio()
      drm/mediatek: mtk_hdmi: Remove driver bound to HDMI print
      drm/mediatek: mtk_hdmi: Cleanup function mtk_hdmi_resume()
      dt-bindings: display: mediatek: dpi: Add MT8195 and MT8188 compat
      drm/mediatek: mtk_dpi: Add support for Pattern Generator in debugfs
      drm/mediatek: mtk_dpi: Use an array for pixclk factor calculation
      drm/mediatek: mtk_dpi: Move pixel clock setting flow to function
      drm/mediatek: mtk_dpi: Add checks for reg_h_fre_con existence
      drm/mediatek: mtk_dpi: Move the input_2p_en bit to platform data
      drm/mediatek: mtk_dpi: Add support for DPI input clock from HDMI
      drm/mediatek: mtk_dpi: Support AFIFO 1T1P output and conversion
      drm/mediatek: mtk_dpi: Explicitly manage TVD clock in power on/off
      drm/mediatek: Add support for MT8195 Digital Parallel Interface
      dt-bindings: display: mediatek: dsc: Add MT8188 compatible

Anusha Srivatsa (1):
      drm/mediatek: Move to devm_platform_ioremap_resource() usage

Dan Carpenter (1):
      drm/mediatek: dsi: fix error codes in mtk_dsi_host_transfer()

Douglas Anderson (1):
      drm/mediatek: dp: drm_err => dev_err in HPD path to avoid NULL ptr

Fabien Parent (2):
      dt-bindings: display: mediatek: dpi: add power-domains example
      drm/mediatek: add MT8365 SoC support

Jason-JH Lin (1):
      drm/mediatek: Fix config_updating flag never false when no mbox channel

 .../bindings/display/mediatek/mediatek,dpi.yaml    |   7 +
 .../bindings/display/mediatek/mediatek,dsc.yaml    |   3 +
 drivers/gpu/drm/mediatek/mtk_crtc.c                |   7 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c          |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_merge.c          |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |   4 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   6 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 | 323 +++++++++++++++------
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h            |   9 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  10 +
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  10 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                | 108 +++----
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |   4 +-
 15 files changed, 336 insertions(+), 171 deletions(-)
