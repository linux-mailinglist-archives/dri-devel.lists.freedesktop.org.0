Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BE9B3453D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 17:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB33310E4EC;
	Mon, 25 Aug 2025 15:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MnXVfg5M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8D210E060
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 15:09:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 442954488F;
 Mon, 25 Aug 2025 15:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C752AC4CEED;
 Mon, 25 Aug 2025 15:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756134592;
 bh=D5JfNIGsYtCUzeP1Emn+WvKO7QWwGQOk/zFvJ+01A1s=;
 h=From:To:Subject:Date:From;
 b=MnXVfg5MNm1GUa3h5ZsddMgxbjNNkM2dOcnRJ6aDcdDdHGJ+1nSSRaSd+VZ5l6cRU
 vZEjF04uc8ekN3t08JdKEM53wFDBQXHNINlJj7h5xnfIuHO+fr7OQ6GEN5jYvZh7qt
 oqXVzw4lyw2xw+aI7kvR6180VVYnJx5J8XSI5F4Z2L+JWPK2zk8KUo4ERTCgxAqjEn
 XgGB0nz818K4Lql/TjWwCObXi1MurUPxOGnGiuWBrEsTSkHmsq+r3df4GVJu70WYZv
 vGYWNMDn7yM6brVLIxiWYKM0NqFnnQsvLbFT55Ms0UO2vbKBtcpOedpwGXAYAWYBws
 zJVkNOBHQ2Vdg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Ma Ke <make24@iscas.ac.cn>
Subject: [GIT PULL] mediatek drm fixes - 20250825
Date: Mon, 25 Aug 2025 15:09:48 +0000
Message-Id: <20250825150948.2998-1-chunkuang.hu@kernel.org>
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
1. Add error handling for old state CRTC in atomic_disable
2. Fix DSI host and panel bridge pre-enable order
3. Fix device/node reference count leaks in mtk_drm_get_all_drm_priv
4. mtk_hdmi: Fix inverted parameters in some regmap_update_bits calls

Regards,
Chun-Kuang.

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20250825

for you to fetch changes up to e65e7bce0f0530052bfbae07d34a362480f94f4d:

  drm/mediatek: mtk_hdmi: Fix inverted parameters in some regmap_update_bits calls (2025-08-23 15:34:39 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20250825

1. Add error handling for old state CRTC in atomic_disable
2. Fix DSI host and panel bridge pre-enable order
3. Fix device/node reference count leaks in mtk_drm_get_all_drm_priv
4. mtk_hdmi: Fix inverted parameters in some regmap_update_bits calls

----------------------------------------------------------------
Jason-JH Lin (1):
      drm/mediatek: Add error handling for old state CRTC in atomic_disable

Louis-Alexis Eyraud (2):
      drm/mediatek: dsi: Fix DSI host and panel bridge pre-enable order
      drm/mediatek: mtk_hdmi: Fix inverted parameters in some regmap_update_bits calls

Ma Ke (1):
      drm/mediatek: Fix device/node reference count leaks in mtk_drm_get_all_drm_priv

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 21 ++++++++++++++-------
 drivers/gpu/drm/mediatek/mtk_dsi.c     |  6 ++++++
 drivers/gpu/drm/mediatek/mtk_hdmi.c    |  8 ++++----
 drivers/gpu/drm/mediatek/mtk_plane.c   |  3 ++-
 4 files changed, 26 insertions(+), 12 deletions(-)
