Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6304242CF4E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 01:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3546E10A;
	Wed, 13 Oct 2021 23:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E076E10A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 23:50:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 666AE610FE;
 Wed, 13 Oct 2021 23:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634169048;
 bh=2CZILZS8k2Wus3hkLlSNYvJgO+c8wjp2peYkC+hIfpA=;
 h=From:To:Cc:Subject:Date:From;
 b=bdt/QUmq3f6P/rs+t4WDUk0hLb8de7273Cdn3cQwjml8bHUpF+LCOevqCfwoJY51O
 ImY5DmolrXbL29CxsR15Q4je6XmRBB79or3owG/yl6YVte1WMONEYr/y+ZOb9vCMT5
 SalYXVr444IhTE71EWDIv54y9BMFpxcteTSEZ4xj6grXTQEvhWxLHufqQUOvdSy3gb
 hixguvicxR8dhIlwLeHtaj1g74gvmHZk/WdFBEYnRsdyrL7wl2YQ7h36ejK7jvMARQ
 KHCsA4CTQ3rccjIBYeQ+Gt6zH31ztXzSLHB1qwucyprGR6EN39BdezFi+s3+fiyo+K
 C6UDY3c2ngIXg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: [GIT PULL] mediatek drm fixes for 5.15
Date: Thu, 14 Oct 2021 07:50:44 +0800
Message-Id: <20211013235044.5488-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
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

1. Revert series "CMDQ refinement of Mediatek DRM driver"

Regards,
Chun-Kuang.

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-5.15

for you to fetch changes up to 4157a441ff068cc406513e7b8069efa19bba89d0:

  Revert "drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb" (2021-10-12 08:02:27 +0800)

----------------------------------------------------------------
Mediatek DRM Fixes for Linux 5.15

1. Revert series "CMDQ refinement of Mediatek DRM driver"

----------------------------------------------------------------
Chun-Kuang Hu (5):
      Revert "drm/mediatek: Clear pending flag when cmdq packet is done"
      Revert "drm/mediatek: Add cmdq_handle in mtk_crtc"
      Revert "drm/mediatek: Detect CMDQ execution timeout"
      Revert "drm/mediatek: Remove struct cmdq_client"
      Revert "drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb"

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 157 +++++---------------------------
 1 file changed, 24 insertions(+), 133 deletions(-)
