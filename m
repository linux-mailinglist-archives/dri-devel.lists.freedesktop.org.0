Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F826A59643
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 14:28:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA97D10E448;
	Mon, 10 Mar 2025 13:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mhAr3KhZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983D710E448
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 13:28:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DA42B5C5DA8;
 Mon, 10 Mar 2025 13:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF8DC4CEE5;
 Mon, 10 Mar 2025 13:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741613284;
 bh=1zUZf3B5y0uC+TWU4CEsCftkbi7r8iw0T6Vz28WKS+4=;
 h=From:To:Subject:Date:From;
 b=mhAr3KhZn4So+W/voBy9tOvXrwo61lxJtZEOYW0wE/r2P+4cVI35R0qzdoxf5Adkv
 PV2xBT+0kQ0LsxEOglVmQn+tMeRPZBxzKwUzGboMmOvN1yOB1SJvZRHsn6etvaCu0t
 E28lmBda5Qm0/09YOeN+Wkag8YInJQzq29vCsn4Y8Ysc+Kk7UrLDBXmrG7rwa7XQdl
 vjR2zCclVeAL7cZmjRDGRrxgugvyi1MEeTIpI6xFbLrEaphi2syLmyxptZrjo2dtN4
 wN/vqQsHaegeBNHZm5ALCLrobbxZSOxsrcJr+E2i9CSUpk/jQCCEs+By1zN/yExLGp
 +u8MkvaPv6dFQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Douglas Anderson <dianders@chromium.org>,
 Fabien Parent <fparent@baylibre.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: [GIT PULL] mediatek drm next for 6.15
Date: Mon, 10 Mar 2025 13:27:59 +0000
Message-Id: <20250310132759.3345-1-chunkuang.hu@kernel.org>
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

Regards,
Chun-Kuang.

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.15

for you to fetch changes up to 8c9d519aa138aa36c0c3f201ff336b17b0ba32b2:

  drm/mediatek: dsi: fix error codes in mtk_dsi_host_transfer() (2025-03-03 13:26:03 +0000)

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
 drivers/gpu/drm/mediatek/mtk_crtc.c                |   5 +-
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
 15 files changed, 334 insertions(+), 171 deletions(-)
