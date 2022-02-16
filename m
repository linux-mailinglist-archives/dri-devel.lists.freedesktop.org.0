Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66444B8D4F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 17:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8006E10E410;
	Wed, 16 Feb 2022 16:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1145989FC8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 16:08:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9C69EB81F61;
 Wed, 16 Feb 2022 16:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566E2C004E1;
 Wed, 16 Feb 2022 16:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645027734;
 bh=LF462aaH3bcrioP0UqoTu64rCWeeObTyACLb5jcaKz8=;
 h=From:To:Cc:Subject:Date:From;
 b=NG4g43ajqFFiMobTlFw7l8KIMdJbHw2/Yi/5gKzvLXQEVyo29GdbEnMpgQNbKDiVL
 ZLPMD12H7U5eZBoUur/8veyKWzSXgwb9P3DTcSpdjRKcTzoifYMLd/695+SUfvzDAD
 3XFEpVag+z/R+K41ltbctBJuFTrp/J0qHiUkhJgemvDcYDKYN18Mb/wxEPqFaGQR9r
 5iaEWo6inEa5WEH7P1T1KyMPwWWg/MyhHGHXjh5IeDikV2i5TceKpVl7NGStrXGzIW
 gh5P3AIJN2eyY5C7UTrHCt6JvpCXF6ig6B2X8yC7eYv25//60r6K1zDQVc8w0ipr/8
 7pw8ahc3iAJHA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm fixes for 5.17
Date: Thu, 17 Feb 2022 00:08:47 +0800
Message-Id: <1645027727-19554-1-git-send-email-chunkuang.hu@kernel.org>
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
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:

1. Avoid EPROBE_DEFER loop with external bridge

Regards,
Chun-Kuang.

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-5.17

for you to fetch changes up to 647474b8d980256b26b1cd112d7333a4dbd4260a:

  drm/mediatek: mtk_dsi: Avoid EPROBE_DEFER loop with external bridge (2022-02-09 22:58:34 +0800)

----------------------------------------------------------------
Mediatek DRM Fixes for Linux 5.17

1. Avoid EPROBE_DEFER loop with external bridge

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      drm/mediatek: mtk_dsi: Avoid EPROBE_DEFER loop with external bridge

 drivers/gpu/drm/mediatek/mtk_dsi.c | 167 +++++++++++++++++++------------------
 1 file changed, 84 insertions(+), 83 deletions(-)
