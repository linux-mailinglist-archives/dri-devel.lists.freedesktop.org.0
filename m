Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B8AC7172A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 00:32:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C5810E6A8;
	Wed, 19 Nov 2025 23:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Sfc1NAHl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B6B10E6A8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 23:32:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C42C160010;
 Wed, 19 Nov 2025 23:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FBBC4CEF5;
 Wed, 19 Nov 2025 23:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763595126;
 bh=laRUt/SfESbpQ9OHY7uw4QNXguFAXSsPBJi0Jw0N/Bg=;
 h=From:To:Subject:Date:From;
 b=Sfc1NAHlJmwQSJtzjRxtJV0xyuer9qwegg9LfjEEGlwc9Zg4bwFC5nYVmFD4JR6OW
 fjpCu1L5Fx5t8d/ObbEk13k4n1TIrI882d5QRHRsZ0XDaZZl5KbIU/ukTwDeySNohU
 T3nmXYuxdqYJLRvB/8+0C4XeHa0BzvdMz/6YRiWLjrT7kjW7dVrd5Mtwt6wUGgwl8x
 YAhegDs6F58nCgAyq/QKpXFJB3w4rrPCRQxJiAE6viF/cMKpWShqsaz9iTBQzXm4FI
 /SL+d6PJPRvLS4n0wnLGrk++x69Yp0XIDajGpYBjctAiIPaZ8GR6DnXBiOPgFiZXGY
 PhaOsRqHIasbg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Johan Hovold <johan@kernel.org>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sjoerd Simons <sjoerd@collabora.com>, Jay Liu <jay.liu@mediatek.com>,
 Miaoqian Lin <linmq006@gmail.com>
Subject: [GIT PULL] mediatek drm next - 20251120
Date: Wed, 19 Nov 2025 23:32:02 +0000
Message-Id: <20251119233202.10034-1-chunkuang.hu@kernel.org>
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

Hi, Dave & Sima:

This includes:
1. Fix probe resource leaks
2. Add support for MT8195/88 HDMIv2 and DDCv2
3. Fix CCORR mtk_ctm_s31_32_to_s1_n function issue
4. Fix device node reference leak in mtk_dp_dt_parse()

Regards,
Chun-Kuang.

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-20251120

for you to fetch changes up to a846505a193d7492ad3531e33cacfca31e4bcdd1:

  drm/mediatek: Fix device node reference leak in mtk_dp_dt_parse() (2025-11-19 23:01:28 +0000)

----------------------------------------------------------------
Mediatek DRM Next - 20251120

1. Fix probe resource leaks
2. Add support for MT8195/88 HDMIv2 and DDCv2
3. Fix CCORR mtk_ctm_s31_32_to_s1_n function issue
4. Fix device node reference leak in mtk_dp_dt_parse()

----------------------------------------------------------------
AngeloGioacchino Del Regno (9):
      drm/mediatek: mtk_hdmi: Improve mtk_hdmi_get_all_clk() flexibility
      drm/mediatek: mtk_hdmi: Add HDMI IP version configuration to pdata
      drm/mediatek: mtk_hdmi: Split driver and add common probe function
      drm/mediatek: mtk_hdmi_common: Make CEC support optional
      drm/mediatek: mtk_hdmi_common: Assign DDC adapter pointer to bridge
      drm/mediatek: mtk_hdmi_common: Add OP_HDMI if helper funcs assigned
      drm/mediatek: mtk_hdmi_common: Add var to enable interlaced modes
      drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188
      drm/mediatek: mtk_hdmi_v2: Add debugfs ops and implement ABIST

Jay Liu (1):
      drm/mediatek: Fix CCORR mtk_ctm_s31_32_to_s1_n function issue

Johan Hovold (5):
      drm/mediatek: mtk_hdmi: Fix probe device leaks
      drm/mediatek: Fix probe resource leaks
      drm/mediatek: Fix probe memory leak
      drm/mediatek: Fix probe device leaks
      drm/mediatek: ovl_adaptor: Fix probe device leaks

Louis-Alexis Eyraud (1):
      drm/mediatek: mtk_hdmi: Drop redundant clock retrieval in mtk_hdmi_get_cec_dev

Miaoqian Lin (1):
      drm/mediatek: Fix device node reference leak in mtk_dp_dt_parse()

Sjoerd Simons (1):
      drm/mediatek: mtk_hdmi_common: Defer probe when ddc i2c bus isn't available yet

 drivers/gpu/drm/mediatek/Kconfig                |   23 +-
 drivers/gpu/drm/mediatek/Makefile               |    3 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c         |   33 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h         |    2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c       |   23 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c |   12 +
 drivers/gpu/drm/mediatek/mtk_dp.c               |    1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c          |    4 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c             |  539 +-------
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c      |  456 +++++++
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h      |  198 +++
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c      |  396 ++++++
 drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h     |  263 ++++
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c          | 1521 +++++++++++++++++++++++
 14 files changed, 2925 insertions(+), 549 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
