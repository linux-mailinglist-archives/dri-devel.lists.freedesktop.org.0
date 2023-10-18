Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 923A27CDE19
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 15:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBB710E3F6;
	Wed, 18 Oct 2023 13:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3562110E3F8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 13:58:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9BFA4617E0;
 Wed, 18 Oct 2023 13:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719B1C433C7;
 Wed, 18 Oct 2023 13:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697637531;
 bh=wxEBr6zR30oEb1KN/pZ/GCIcJk3kW74EFYDBwxqr4AA=;
 h=From:To:Cc:Subject:Date:From;
 b=Sngmf5n6aoZxOH3ubzZrHjpUGjD1RloVY5MtNb+6SqqM+Se8rw8QPdk4SpwBTcWjs
 SHYTWnTC8/yY7fEqQO2E1rXMqD3g5JsxwV5mutmdBUsU3jbLJPvojAqxFVBHVqC+tY
 1/pzKeV/TePNeN+p00j5VbhLvpjTyjHaB+XRe2/yI+WVdLnVmyNEj3PG7vdIggXKBc
 Zj+hdc/ez4dLzjWMfdHkF7F6BjQiLah9mc0G0+BaflPq2mxtGg/6V08rZISBdRlfc7
 F3rhNcGhh238m09IZYdzOqeYWtGamS8wvdu4BOnb/ZX0MdxGNI7Wapj4kldkVxJZ1G
 pDf0fSz0zeC5A==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm next for 6.7
Date: Wed, 18 Oct 2023 13:58:46 +0000
Message-Id: <20231018135846.5811-1-chunkuang.hu@kernel.org>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Shuijing Li <shuijing.li@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:

1. Add support MT8188 dsi function
2. Fix coverity issue with unintentional integer overflow
3. Add support MT8188 dp/edp function
4. Fix memory leak on ->get_edid callback audio detection
   and error path.
5. Add connector dynamic selection capability
6. MediaTek DDP GAMMA - 12-bit LUT support
7. mtk_dsi: Fix NO_EOT_PACKET settings/handling

Regards,
Chun-Kuang.

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.7

for you to fetch changes up to 5855d422a6f250f3518f43b49092c8e87a5e42be:

  drm: mediatek: mtk_dsi: Fix NO_EOT_PACKET settings/handling (2023-10-18 13:18:22 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.7

1. Add support MT8188 dsi function
2. Fix coverity issue with unintentional integer overflow
3. Add support MT8188 dp/edp function
4. Fix memory leak on ->get_edid callback audio detection
   and error path.
5. Add connector dynamic selection capability
6. MediaTek DDP GAMMA - 12-bit LUT support
7. mtk_dsi: Fix NO_EOT_PACKET settings/handling

----------------------------------------------------------------
AngeloGioacchino Del Regno (16):
      drm/mediatek: gamma: Reduce indentation in mtk_gamma_set_common()
      drm/mediatek: gamma: Support SoC specific LUT size
      drm/mediatek: gamma: Improve and simplify HW LUT calculation
      drm/mediatek: gamma: Enable the Gamma LUT table only after programming
      drm/mediatek: gamma: Use bitfield macros
      drm/mediatek: aal: Use bitfield macros
      drm/mediatek: De-commonize disp_aal/disp_gamma gamma_set functions
      drm/mediatek: gamma: Support multi-bank gamma LUT
      drm/mediatek: gamma: Add support for 12-bit LUT
      drm/mediatek: gamma: Add support for MT8195
      drm/mediatek: gamma: Make sure relay mode is disabled
      drm/mediatek: gamma: Program gamma LUT type for descending or rising
      drm/mediatek: aal: Add kerneldoc for struct mtk_disp_aal
      drm/mediatek: gamma: Add kerneldoc for struct mtk_disp_gamma
      drm/mediatek: aal: Compress of_device_id entries and add sentinel
      drm: mediatek: mtk_dsi: Fix NO_EOT_PACKET settings/handling

Jani Nikula (2):
      drm/mediatek/dp: fix memory leak on ->get_edid callback audio detection
      drm/mediatek/dp: fix memory leak on ->get_edid callback error path

Jason-JH.Lin (12):
      drm/mediatek: Fix coverity issue with unintentional integer overflow
      drm/mediatek: Add mmsys_dev_num to mt8188 vdosys0 driver data
      drm/mediatek: Add crtc path enum for all_drm_priv array
      drm/mediatek: Fix using wrong drm private data to bind mediatek-drm
      drm/mediatek: Add encoder_index interface for mtk_ddp_comp_funcs
      drm/mediatek: Add connector dynamic selection capability
      drm/mediatek: dpi: Support dynamic connector selection
      drm/mediatek: dsi: Support dynamic connector selection
      drm/mediatek: Support dynamic selection of MT8188 VDOSYS0
      drm/mediatek: Fix iommu fault by swapping FBs after updating plane state
      drm/mediatek: Fix iommu fault during crtc enabling
      drm/mediatek: gamma: Adjust mtk_drm_gamma_set_common parameters

Shuijing Li (8):
      dt-bindings: display: mediatek: dsi: Add compatible for MediaTek MT8188
      drm/mediatek: dsi: Add dsi cmdq_ctl to send panel initial code
      drm/mediatek: Add mt8188 dsi compatible to mtk_dsi.c
      dt-bindings: display: mediatek: dp: Add compatible for MediaTek MT8188
      drm/mediatek: dp: Add the audio packet flag to mtk_dp_data struct
      drm/mediatek: dp: Add the audio divider to mtk_dp_data struct
      drm/mediatek: dp: Add support MT8188 dp/edp function
      drm/mediatek: dsi: Add mode_valid callback to DSI bridge

 .../bindings/display/mediatek/mediatek,dp.yaml     |   2 +
 .../bindings/display/mediatek/mediatek,dsi.yaml    |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_aal.c            |  86 ++++++++-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          | 203 +++++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_dp.c                  |  42 ++++-
 drivers/gpu/drm/mediatek/mtk_dp_reg.h              |  23 ++-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |   9 +
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  83 ++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h            |   6 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |  34 +++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |  17 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  47 ++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |  15 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             |   9 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           |  41 ++++-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  48 ++++-
 17 files changed, 583 insertions(+), 88 deletions(-)
