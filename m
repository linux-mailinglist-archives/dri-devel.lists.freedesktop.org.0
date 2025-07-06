Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD8EAFA29F
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 04:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9754210E162;
	Sun,  6 Jul 2025 02:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nlh7v7SW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC30410E162
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 02:19:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 92FDC454B2;
 Sun,  6 Jul 2025 02:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E125C4CEE7;
 Sun,  6 Jul 2025 02:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751768399;
 bh=5yjfcB+f1C7tTVdIW91QSz7CWF1fY2xoIWAxpTquOTM=;
 h=From:To:Subject:Date:From;
 b=nlh7v7SWbZgB4xLZ4a5xMtdG1sEU0VFo2Bhx47aQ9/51NPt12LmZ+YlMYwd9tEWoz
 gOHKXjeBeINbxG8myTRIUKHprIBTiSoMsdqRw6yAX6l70kOxiG5GRmmWu3T2uo+3Kp
 DQ7k2Z7rYBHSvNxP19UirZ+ZlfhguB2HTNiYfwCoATn+2sYsIWIA/F1qJJgm7PLmKx
 ObVjxPCwfezCgbmYdcmMbbtHFZWPjlkXVujyS27aQBJVwuhCB866DfIFZafNUxxuBz
 1s3iYkJUf6TB6ce+b7OUJ1jMycAKCLReJ/c50DlJ9Yky8AF7LL4Yia/73orPyJ8Djb
 DB4m0esgyV4Ug==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Jason-JH Lin <jason-jh.lin@mediatek.com>, Icenowy Zheng <uwu@icenowy.me>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [GIT PULL] mediatek drm fixes - 20250706
Date: Sun,  6 Jul 2025 02:19:55 +0000
Message-Id: <20250706021955.2794-1-chunkuang.hu@kernel.org>
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
1. Add wait_event_timeout when disabling plane
2. only announce AFBC if really supported
3. mtk_dpi: Reorder output formats on MT8195/88

Regards,
Chun-Kuang.

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20250706

for you to fetch changes up to 8708a4897380da17bd1afa70f8c6bef06fefe360:

  drm/mediatek: mtk_dpi: Reorder output formats on MT8195/88 (2025-06-25 15:13:09 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20250706

1. Add wait_event_timeout when disabling plane
2. only announce AFBC if really supported
3. mtk_dpi: Reorder output formats on MT8195/88

----------------------------------------------------------------
Icenowy Zheng (1):
      drm/mediatek: only announce AFBC if really supported

Jason-JH Lin (1):
      drm/mediatek: Add wait_event_timeout when disabling plane

Louis-Alexis Eyraud (1):
      drm/mediatek: mtk_dpi: Reorder output formats on MT8195/88

 drivers/gpu/drm/mediatek/mtk_crtc.c     | 34 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_crtc.h     |  1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c |  1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  9 +++++++++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c |  7 +++++++
 drivers/gpu/drm/mediatek/mtk_dpi.c      |  4 ++--
 drivers/gpu/drm/mediatek/mtk_plane.c    | 12 ++++++++++--
 drivers/gpu/drm/mediatek/mtk_plane.h    |  3 ++-
 9 files changed, 66 insertions(+), 6 deletions(-)
