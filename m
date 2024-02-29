Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8479B86CEB9
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 17:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8E610E50F;
	Thu, 29 Feb 2024 16:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IchzYkK6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573AD10E500
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 16:21:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 74654CE022B;
 Thu, 29 Feb 2024 16:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116F5C433C7;
 Thu, 29 Feb 2024 16:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709223707;
 bh=1+cy61Mj8Q+WBtF9d1xGIDEwN/pAnkT6tvBKpomCTEQ=;
 h=From:To:Cc:Subject:Date:From;
 b=IchzYkK6MDrNK7HizlXxwFSFOKsNeROrWb3KWipwDl22+CTGQcwJ40GUbxV9cxx6E
 JgBvxjXkqGJoxeLTVRcvxC7XGoxXFviyjCAiTry/X7dMNdFKGEdFX+bpv22MiOoCzK
 soMzSZmVz8J7I4ZhTahQidHB6csRmG9oAF0UWTrzM6u68k0rlLSuJmMC9v9qUVQwoc
 nEgym8m0fyfT0vN1iFnyxVhrS4L9bFGY1aw3i2uYOCKFHuuLw7CcoeNBknAqUjAe8Q
 fu87z18gNZESOKlj3Bs7eFbEjqDQl4H7BaMEGgmeeGGJOkDmGX4Qpb6IbzFgLxT1jn
 2zcaHKWx8eoAg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [GIT PULL] mediatek drm next for 6.9
Date: Thu, 29 Feb 2024 16:21:43 +0000
Message-Id: <20240229162143.28957-1-chunkuang.hu@kernel.org>
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

1. Add display driver for MT8188 VDOSYS1
2. DSI driver cleanups
3. Filter modes according to hardware capability
4. Fix a null pointer crash in mtk_drm_crtc_finish_page_flip

Regards,
Chun-Kuang.

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.9

for you to fetch changes up to c958e86e9cc1b48cac004a6e245154dfba8e163b:

  drm/mediatek: Fix a null pointer crash in mtk_drm_crtc_finish_page_flip (2024-02-29 16:15:28 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.9

1. Add display driver for MT8188 VDOSYS1
2. DSI driver cleanups
3. Filter modes according to hardware capability
4. Fix a null pointer crash in mtk_drm_crtc_finish_page_flip

----------------------------------------------------------------
AngeloGioacchino Del Regno (9):
      drm/mediatek: dsi: Use GENMASK() for register mask definitions
      drm/mediatek: dsi: Fix DSI RGB666 formats and definitions
      drm/mediatek: dsi: Cleanup functions mtk_dsi_ps_control{_vact}()
      drm/mediatek: dsi: Use bitfield macros where useful
      drm/mediatek: dsi: Replace open-coded instance of HZ_PER_MHZ
      drm/mediatek: dsi: Register DSI host after acquiring clocks and PHY
      drm/mediatek: dsi: Simplify with dev_err_probe and remove gotos
      drm/mediatek: dsi: Compress of_device_id entries and add sentinel
      drm/mediatek: dsi: Use mipi_dsi_pixel_format_to_bpp() helper function

Hsiao Chien Sung (3):
      drm/mediatek: Add Padding to OVL adaptor
      drm/mediatek: Support MT8188 VDOSYS1 in display driver
      drm/mediatek: Filter modes according to hardware capability

Hsin-Yi Wang (1):
      drm/mediatek: Fix a null pointer crash in mtk_drm_crtc_finish_page_flip

 drivers/gpu/drm/mediatek/mtk_disp_drv.h         |   4 +
 drivers/gpu/drm/mediatek/mtk_disp_merge.c       |  65 +++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c |  43 ++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c         |  29 ++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c     |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h     |  12 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c          |   4 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c              | 310 ++++++++++--------------
 8 files changed, 278 insertions(+), 190 deletions(-)
