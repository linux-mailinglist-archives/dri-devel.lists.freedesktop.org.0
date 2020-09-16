Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7870126CF73
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 01:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC59D6E0D4;
	Wed, 16 Sep 2020 23:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331FF6E0D4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 23:17:28 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 910FB22208;
 Wed, 16 Sep 2020 23:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600298248;
 bh=MULisps7yVfJ/xqQ6XWdCeNRfg6H21sF8dYOVURz8d0=;
 h=From:To:Cc:Subject:Date:From;
 b=RzdpXDWxw9Fs6hd1/sEikYKPwgPaLXXGAF5xDyodcsdQOwi64L9yNEqYFzA1fKWv4
 vfpy+hc9Y33/KNkjMCHP28SQCwZ7MzpjF5T0glpUNoIMYBKiuODznTafenjCDpumqG
 +/kvVG5N0YFjgh23Yj0p1/fqZWLFHJaFVXKA8Llw=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm fixes for 5.9
Date: Thu, 17 Sep 2020 07:17:24 +0800
Message-Id: <20200916231724.30571-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Yu Kuai <yukuai3@huawei.com>, Wang Hai <wanghai38@huawei.com>,
 Jitao Shi <jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:

1. Fix scrolling of panel
2. Remove duplicated include
3. Use CPU when fail to get cmdq event
4. Add missing put_device() call

Regards,
Chun-Kuang.

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-5.9

for you to fetch changes up to 0680a622318b8d657323b94082f4b9a44038dfee:

  drm/mediatek: Add missing put_device() call in mtk_hdmi_dt_parse_pdata() (2020-09-17 06:58:01 +0800)

----------------------------------------------------------------
Mediatek DRM Fixes for Linux 5.9

1. Fix scrolling of panel
2. Remove duplicated include
3. Use CPU when fail to get cmdq event
4. Add missing put_device() call

----------------------------------------------------------------
Chun-Kuang Hu (1):
      drm/mediatek: Use CPU when fail to get cmdq event

Jitao Shi (1):
      drm/mediatek: dsi: Fix scrolling of panel with small hfp or hbp

Wang Hai (1):
      drm/mediatek: Remove duplicated include

Yu Kuai (4):
      drm/mediatek: Add missing put_device() call in mtk_ddp_comp_init()
      drm/mediatek: Add exception handing in mtk_drm_probe() if component init fail
      drm/mediatek: Add missing put_device() call in mtk_drm_kms_init()
      drm/mediatek: Add missing put_device() call in mtk_hdmi_dt_parse_pdata()

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 20 +++++++++++++-------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 19 +++++++++++++------
 drivers/gpu/drm/mediatek/mtk_dsi.c          |  9 ++++-----
 drivers/gpu/drm/mediatek/mtk_hdmi.c         | 26 ++++++++++++++++++--------
 5 files changed, 49 insertions(+), 26 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
