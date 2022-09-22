Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A26C5E7053
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 01:48:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7B210E241;
	Thu, 22 Sep 2022 23:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FEB10E241
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 23:48:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1CE2D60A51;
 Thu, 22 Sep 2022 23:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3C3C433D6;
 Thu, 22 Sep 2022 23:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663890492;
 bh=Kj04nfY3atIZrwzcWjlm7VKsHPyxhSkwGh3b0ZuXMuE=;
 h=From:To:Cc:Subject:Date:From;
 b=cnxHwJFY3PDpJwjfpnPGFuaigNfPL5/QZsB/o2UsnGGYRIa5I1ViGHbOxD5iBIDUh
 1/FOIyjMXZBcQN40esKCkxpN3bdbSeRmfFs6rdgg124WxJ3GBMag4IsStxQj/sSlmx
 raPy6QalAgbYTSTLwrixeoWVBO9S4dHqOORMXie9Y/FEObuIeA7EJxfxSXqGdgZhfm
 wq02GYnJaE17e3g2coV9771+QuZa5Od1ym6c2pLTBYhW4K/km6gUvRfknsqht6KkT6
 e8x/k+5JNOabsXGjs+mkwF40doVkO67Tf9eZ6yDMjp6/4e52bKS0Ks2vNAyQLf+hPx
 ZMjHnx615vnEA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm next for 6.1
Date: Fri, 23 Sep 2022 07:48:04 +0800
Message-Id: <20220922234804.18557-1-chunkuang.hu@kernel.org>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 ye xingchen <ye.xingchen@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:

1. Drop of_gpio header
2. Remove the unneeded result

Regards,
Chun-Kuang.

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.1

for you to fetch changes up to 9d3feb63339520462583a4c7ee5130046ab515ad:

  drm/mediatek: Remove the unneeded result (2022-08-26 07:34:49 +0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.1

1. Drop of_gpio header
2. Remove the unneeded result

----------------------------------------------------------------
Maíra Canal (1):
      drm/mediatek: Drop of_gpio header

ye xingchen (1):
      drm/mediatek: Remove the unneeded result

 drivers/gpu/drm/mediatek/mtk_dpi.c     | 1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 +----
 drivers/gpu/drm/mediatek/mtk_hdmi.c    | 1 -
 3 files changed, 1 insertion(+), 6 deletions(-)
