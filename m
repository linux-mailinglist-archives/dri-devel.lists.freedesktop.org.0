Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82660B097CB
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 01:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EF010E8AF;
	Thu, 17 Jul 2025 23:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k+io4Ola";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C1A10E8AF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 23:29:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6F44C613F3;
 Thu, 17 Jul 2025 23:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B2BC4CEE3;
 Thu, 17 Jul 2025 23:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752794960;
 bh=umj1MpXiyHSIhgzpDKbeJ+au+K5ZOO0CIxaQKQnTow8=;
 h=From:To:Subject:Date:From;
 b=k+io4OlaZL1Pvj9ZSSBwbhB148SFYr+9VpNuBc4msqDMvHl9BhavwiIYyclcskhAz
 fKVRFAl2K0kIhwN+irdtZcadYgSOOwCinSFY8N+K0D5bo/tltEka+pJBIb+dphCENJ
 UPwdMgW2oYVQ1Ooe8n4b1NQfaYRZ3JX9D7HCFWmmllp08eLimyKfFSfbH6JWbvxYt3
 NilE0lJ6jiUAIgeVKecMfc5VWNoGL/XWI2G3j2p/p2hfXyIUyxW3G0efYIiDrWnw+F
 tNBcNYpQ7OCr/AeyMsg2tleJp+59hGnv/c+SCYUa8XREq25FFTBoDOT+XEq0yAHtqf
 aU748VO3fo1uQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Jason-JH Lin <jason-jh.lin@mediatek.com>, Icenowy Zheng <uwu@icenowy.me>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [GIT PULL] mediatek drm fixes - 20250718
Date: Thu, 17 Jul 2025 23:29:16 +0000
Message-Id: <20250717232916.12372-1-chunkuang.hu@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20250718

for you to fetch changes up to 5ceed7a6d34a8800bc39673bf2d5573990fbac4d:

  drm/mediatek: mtk_dpi: Reorder output formats on MT8195/88 (2025-07-17 23:19:05 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20250718

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

 drivers/gpu/drm/mediatek/mtk_crtc.c     | 36 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_crtc.h     |  1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c |  1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  9 +++++++++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c |  7 +++++++
 drivers/gpu/drm/mediatek/mtk_dpi.c      |  4 ++--
 drivers/gpu/drm/mediatek/mtk_plane.c    | 12 +++++++++--
 drivers/gpu/drm/mediatek/mtk_plane.h    |  3 ++-
 9 files changed, 68 insertions(+), 6 deletions(-)
