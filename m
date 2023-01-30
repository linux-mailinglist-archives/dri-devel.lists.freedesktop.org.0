Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A22BC680E47
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 13:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFAC110E240;
	Mon, 30 Jan 2023 12:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14BB910E240
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 12:58:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 70F0560ED8;
 Mon, 30 Jan 2023 12:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE156C433D2;
 Mon, 30 Jan 2023 12:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675083495;
 bh=h6Q6KjLjI37ic9N53oKoz+rpip0wPOOuPid68b9RUj4=;
 h=From:To:Cc:Subject:Date:From;
 b=cfXx7tj9KaAX3MBpvlg7sHXzAblucRPGU4LjRGyxhyW95wKCcnUuMq8G5kg2PraCw
 hGBhWGBYl81ttGHsuz0ZKeBoEYG9+mQ94kgBTV73uMR+IDk3WTEzO3B4ll280+AgS+
 6mVPFocB08WLSEpvU/iPZIEbJ5MVp7zTPF5k4L6YUXlw8dNXRdjRsdIBRTyqCb73h+
 0E02V56jVFvknUT8drbAV/9BKq6JvDJBtaG+w+iBEHnLOXrY+qZClv/qJN/4OGepuW
 qr+pVRmsYsCWQ+QFJ76IFtHTPU1aCRDwzVM6+S5iUmEl6G3Zc8R2qjj6DyPs5NzsdM
 SfA1YoIiq8prg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm next for 6.3
Date: Mon, 30 Jan 2023 12:58:11 +0000
Message-Id: <20230130125811.2567-1-chunkuang.hu@kernel.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Xinlei Lee <xinlei.lee@mediatek.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Deepak R Varma <drv@mailo.com>,
 ruanjinjie <ruanjinjie@huawei.com>, Miles Chen <miles.chen@mediatek.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:

1. Reduce the time of dsi from LP11 to sending cmd
2. Remove dependency on GEM DMA helper
3. Drop unbalanced obj unref
4. Fix the fallback for mediatek,mt8186-disp-ccorr
5. Fixup for error path.

Regards,
Chun-Kuang.

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.3

for you to fetch changes up to 137272ef1b0f17a1815fec00d583515a0163f85e:

  dt-bindings: display: mediatek: Fix the fallback for mediatek,mt8186-disp-ccorr (2023-01-29 02:19:13 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.3

1. Reduce the time of dsi from LP11 to sending cmd
2. Remove dependency on GEM DMA helper
3. Drop unbalanced obj unref
4. Fix the fallback for mediatek,mt8186-disp-ccorr
5. Fixup for error path.

----------------------------------------------------------------
Allen-KH Cheng (1):
      dt-bindings: display: mediatek: Fix the fallback for mediatek,mt8186-disp-ccorr

Deepak R Varma (1):
      drm/mediatek: dp: Remove extra semicolon

Miles Chen (2):
      drm/mediatek: Use NULL instead of 0 for NULL pointer
      drm/mediatek: Include missing headers

Nathan Lu (1):
      dt-bindings: display: mediatek: modify VDOSYS0 display device tree Documentations for MT8188

Nícolas F. R. A. Prado (1):
      drm/mediatek: Clean dangling pointer on bind error path

Rob Clark (3):
      drm/mediatek: Remove dependency on GEM DMA helper
      drm/mediatek: Drop unbalanced obj unref
      drm/mediatek: Remove unused GEM DMA header include

Xinlei Lee (3):
      drm/mediatek: Set dpi format in mmsys
      drm/mediatek: Add mt8186 dpi compatibles and platform data
      drm/mediatek: dsi: Reduce the time of dsi from LP11 to sending cmd

ruanjinjie (1):
      drm/mediatek: mtk_drm_crtc: Add checks for devm_kcalloc

 .../bindings/display/mediatek/mediatek,aal.yaml    |  1 +
 .../bindings/display/mediatek/mediatek,ccorr.yaml  |  3 +-
 .../bindings/display/mediatek/mediatek,color.yaml  |  1 +
 .../bindings/display/mediatek/mediatek,dither.yaml |  1 +
 .../bindings/display/mediatek/mediatek,gamma.yaml  |  1 +
 .../bindings/display/mediatek/mediatek,ovl.yaml    |  1 +
 .../display/mediatek/mediatek,postmask.yaml        |  1 +
 .../bindings/display/mediatek/mediatek,rdma.yaml   |  4 +++
 drivers/gpu/drm/mediatek/Kconfig                   |  1 -
 drivers/gpu/drm/mediatek/mtk_cec.c                 |  2 ++
 drivers/gpu/drm/mediatek/mtk_disp_aal.c            |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c          |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_color.c          |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  1 +
 drivers/gpu/drm/mediatek/mtk_dp.c                  |  2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 | 32 ++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  2 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  5 +++-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             | 11 +++++---
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  3 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c            |  3 ++
 23 files changed, 71 insertions(+), 9 deletions(-)
