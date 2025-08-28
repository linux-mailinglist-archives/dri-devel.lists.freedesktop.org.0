Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50365B3AE7F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 01:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2CD10EAF2;
	Thu, 28 Aug 2025 23:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hxxdvnU0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7E010EAF2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 23:41:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9B6904321B;
 Thu, 28 Aug 2025 23:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B92EC4CEEB;
 Thu, 28 Aug 2025 23:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756424480;
 bh=ZLu9tZcWvvcmKB7kw0Esc7NfcQ27jePkLEoWMSeiIEU=;
 h=From:To:Subject:Date:From;
 b=hxxdvnU0XJSNVwjb+1+/K0DGtYnf6dO7B9XIBdEb9xiW8B1DZ+uM+F3QvmX3Gc4gG
 begEIarXAlpTgNXRPgv0DMDvH1CZNJQy3Hvv1oLBTbagF8hm83K2UG5o9U3d2H5k1T
 wwvu6Kdhi5AN+Depr4y2k9DAeNZ3xOgRjZtAQF/PHuvCVXdSxJjQZdaE7bBNHgjaLH
 hJSjd0zDiNnlBq9Aavy4VghB6sl+41LsblVcPR1gWZPTiPF9rKI4c3nDTdTOI7uQe7
 z/F+IwKmIgIfMHCDj9p4gHAqRg6eYQK/THjTlZNV8Q3OWmwWKReyCQFNLzqvYncPpP
 HuyZmdUY5UMfw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Ma Ke <make24@iscas.ac.cn>
Subject: [GIT PULL] mediatek drm fixes - 20250829
Date: Thu, 28 Aug 2025 23:41:16 +0000
Message-Id: <20250828234116.4960-1-chunkuang.hu@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20250829

for you to fetch changes up to c34414883f773412964404d77cd2fea04c6f7d60:

  drm/mediatek: mtk_hdmi: Fix inverted parameters in some regmap_update_bits calls (2025-08-28 23:15:41 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20250829

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
