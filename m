Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E85AC478131
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2F310E1BF;
	Fri, 17 Dec 2021 00:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B827910E1BF
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:19:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 32E7CB82526;
 Fri, 17 Dec 2021 00:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB1FC36AE7;
 Fri, 17 Dec 2021 00:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639700363;
 bh=Z9wCuqOH6HMPiT2aqxoeeoFm1KRW2uJYG9nKOfQCJ34=;
 h=From:To:Cc:Subject:Date:From;
 b=UEQ004DuWziOzBBYfA8kznBnHUZ0j8aeg6krEdrUxJIUxN8CATlrAjdVBtQyc0yfk
 czwMlIsaWQeyZE5w6I/yvUsiGlAFOjStNy+jmLgqZ9cvFxbJ8D68xP1zOBTWBrqNpV
 4rWiQCPsQvz4GeFopeVk7t6sYZ6nwRv0SVvNBfx4dVKUKj20n6Ky0809ds5mTE1ec6
 UjXkK8h1Mlu0702EMPzlLPWtNspMKmmG6Cxxd6G82xKxYvrixa3QHWM5/DD49VWvS3
 1OZcESuDLNcMfgfMAKuJhjheKB+i0M5P/0CSFQ1VetoPU/SfUsqKO5TrdGpKG21pOA
 tRKyR6sn8Ku2A==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm next for 5.17
Date: Fri, 17 Dec 2021 08:19:30 +0800
Message-Id: <1639700370-3541-1-git-send-email-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.7.4
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
Cc: "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Mark Yacoub <markyacoub@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:

1. Add support for MT8192
2. CMDQ refinement.
3. Miscellaneous clean up and reorder.
4. Set the default value of rotation to DRM_MODE_ROTATE_0

Regards,
Chun-Kuang.

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-5.17

for you to fetch changes up to d95b00f1a8c57f10a7c83bec5a245391c7666f36:

  drm/mediatek: Set the default value of rotation to DRM_MODE_ROTATE_0 (2021-12-14 07:17:50 +0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 5.16

1. Add support for MT8192
2. CMDQ refinement.
3. Miscellaneous clean up and reorder.
4. Set the default value of rotation to DRM_MODE_ROTATE_0

----------------------------------------------------------------
Chun-Kuang Hu (4):
      drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb
      drm/mediatek: Remove the pointer of struct cmdq_client
      drm/mediatek: Detect CMDQ execution timeout
      drm/mediatek: Add cmdq_handle in mtk_crtc

Mark Yacoub (1):
      drm/mediatek: Set the default value of rotation to DRM_MODE_ROTATE_0

Yongqiang Niu (5):
      drm/mediatek: Add component OVL_2L2
      drm/mediatek: Add component POSTMASK
      drm/mediatek: Add component RDMA4
      drm/mediatek: Add support for Mediatek SoC MT8192
      drm/mediatek: Clear pending flag when cmdq packet is done

jason-jh.lin (4):
      drm/mediatek: Add mbox_free_channel in mtk_drm_crtc_destroy
      drm/mediatek: Remove unused define in mtk_drm_ddp_comp.c
      drm/mediatek: Rename the define of register offset
      drm/mediatek: Adjust to the alphabetic order for mediatek-drm

 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c   |   6 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  20 +++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 175 +++++++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 217 ++++++++++++++++------------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  23 +--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 142 +++++++++++-------
 drivers/gpu/drm/mediatek/mtk_drm_plane.c    |   3 +-
 8 files changed, 414 insertions(+), 178 deletions(-)
