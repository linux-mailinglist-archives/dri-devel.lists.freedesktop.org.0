Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1465E56DD
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 01:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2AC10E96E;
	Wed, 21 Sep 2022 23:56:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BB610E96E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 23:56:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1674E62A08;
 Wed, 21 Sep 2022 23:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8AEC433C1;
 Wed, 21 Sep 2022 23:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663804595;
 bh=4aWdT1Ip1DIIIOA74g962gvYZDmK277RORHOc64wCPk=;
 h=From:To:Cc:Subject:Date:From;
 b=ipQT8JgVztymPR9CgY6cbFkvePT++k7CLFuYdg7/1bfY3ev8J2gOFfkxuG0DpSnFh
 WVzI/u3dTCo+cYHtFAp1qRMw8OstBgmUPFlMLRn0bUdutNXKqlQKKXrBmtWvgHBngr
 nANVZoy9IoyHm9dPycQLbpnCYRsJyURzc+Oi3hrrGqI2zz8RHSWezZmaqF7MWvG6dq
 30iSAZO3E59zjyaiO9Y0Qbkn6GL+OFor4ndgX2/UxglwFHX8X8KQmNi+dUCDQ+0oov
 HzNmsGZUzGalyTlZlLXQT2mv+uM9jHt7D4oc3htOoy2nOW7wcHa7eCWouvPg9ztqGA
 8fvMyk9YybPiw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm fixes for 6.0
Date: Thu, 22 Sep 2022 07:56:24 +0800
Message-Id: <20220921235624.23580-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:

1. dsi: Add atomic {destroy,duplicate}_state, reset callbacks
2. drm/mediatek: Fix wrong dither settings
3. dsi: Move mtk_dsi_stop() call back to mtk_dsi_poweroff()

Regards,
Chun-Kuang.


The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-6.0

for you to fetch changes up to 90144dd8b0d137d9e78ef34b3c418e51a49299ad:

  drm/mediatek: dsi: Move mtk_dsi_stop() call back to mtk_dsi_poweroff() (2022-09-22 07:31:43 +0800)

----------------------------------------------------------------
Mediatek DRM Fixes for Linux 6.0

1. dsi: Add atomic {destroy,duplicate}_state, reset callbacks
2. drm/mediatek: Fix wrong dither settings
3. dsi: Move mtk_dsi_stop() call back to mtk_dsi_poweroff()

----------------------------------------------------------------
Allen-KH Cheng (1):
      drm/mediatek: Fix wrong dither settings

AngeloGioacchino Del Regno (1):
      drm/mediatek: dsi: Add atomic {destroy,duplicate}_state, reset callbacks

Nícolas F. R. A. Prado (1):
      drm/mediatek: dsi: Move mtk_dsi_stop() call back to mtk_dsi_poweroff()

 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c          | 24 +++++++++++++-----------
 2 files changed, 14 insertions(+), 12 deletions(-)
