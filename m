Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9D5C36447
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:14:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E3810E790;
	Wed,  5 Nov 2025 15:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QvRM0gJI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A7010E790
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 15:14:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E123943B1A;
 Wed,  5 Nov 2025 15:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B16C4CEF5;
 Wed,  5 Nov 2025 15:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762355686;
 bh=HYVpFtsrL70sCWh2RaktCI0uNYyfmiBbMi220gJPpCA=;
 h=From:To:Subject:Date:From;
 b=QvRM0gJIYOVNPjClWKkfr9PYou4BQaAkFYl8xlj5pUNLjEsIkeUNGYZfYKgjK+AS7
 GUWq628ir6BIbz9EYRoDY/01jSayoNBY9c05tAf5U/lvpS11gdHI9cp7daXywKY46E
 mXqbb/M41KtMIQQdbmcXmlR/yYO9ua6A0cTiSRa53ISduM4+rdILzYuQ5m61SVPP5d
 2qI9yiBI6YOsk+9dI6Pu79Zb7PncCCYpl8pUyPKQ2vkN76JFnPLYc3x9EO5ftcidvL
 6ZMpZMZfvqR5caffphuru89VN19H5x8CqoNYMcmM+ZUGJAWOnHVS7+N4hOxBXfiyhE
 e6Ltm9PDOrpLA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>
Subject: [GIT PULL] mediatek drm fixes - 20251105
Date: Wed,  5 Nov 2025 15:14:43 +0000
Message-Id: <20251105151443.3909-1-chunkuang.hu@kernel.org>
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
1. Disable AFBC support on Mediatek DRM driver
2. Add pm_runtime support for GCE power control

Regards,
Chun-Kuang.

The following changes since commit 926d002e6d7e2f1fd5c1b53cf6208153ee7d380d:

  drm/mediatek: Fix device use-after-free on unbind (2025-10-28 14:56:16 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20251105

for you to fetch changes up to afcfb6c8474d9e750880aaa77952cc588f859613:

  drm/mediatek: Add pm_runtime support for GCE power control (2025-11-01 14:14:56 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20251105

1. Disable AFBC support on Mediatek DRM driver
2. Add pm_runtime support for GCE power control

----------------------------------------------------------------
Ariel D'Alessandro (1):
      drm/mediatek: Disable AFBC support on Mediatek DRM driver

Jason-JH Lin (1):
      drm/mediatek: Add pm_runtime support for GCE power control

 drivers/gpu/drm/mediatek/mtk_crtc.c  |  7 +++++++
 drivers/gpu/drm/mediatek/mtk_plane.c | 24 +-----------------------
 2 files changed, 8 insertions(+), 23 deletions(-)
