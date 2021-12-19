Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E01C47A305
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 00:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071EA10E138;
	Sun, 19 Dec 2021 23:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A6010E138
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 23:34:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 39FC460F26;
 Sun, 19 Dec 2021 23:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E260C36AE7;
 Sun, 19 Dec 2021 23:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639956870;
 bh=CO0C3OU3CKHXH5j2EucGha4YilQfr9w/t+UdQsF9dpE=;
 h=From:To:Cc:Subject:Date:From;
 b=h5aLh0DhaIe8msyuwScM2DwAsgz+X7aEreqiw3iueb2bMVaDdow4A872ypLQ1bxMZ
 6dhs4wU2nypoiE9nBKRI9lk7NRJeiS/o2JW93CyYSi2g2wTSdfvmOEdybyp6HyzlK2
 q8BBsmZB1dqNd0z9R7d3ccrHlEOLdXgtvcbRXwcXXK3eKL/smlRHxQZNYdtzwBdaw/
 ++B0sE8EB9RvJkygsijEyScvcso+JVICWkwyfrri0x9+ZYSCJr+Uc+GrXiovJEhhuS
 H4cbt8oWknaV894drx0+6pHziQ9vghgstqhgIdicEd6e7EYk36VfbbVCwTQ9tzJVAi
 RgWw7IebjQIlQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm fixes for 5.16
Date: Mon, 20 Dec 2021 07:34:21 +0800
Message-Id: <1639956861-14873-1-git-send-email-chunkuang.hu@kernel.org>
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

1. Perform NULL pointer check for mtk_hdmi_conf.

Regards,
Chun-Kuang.

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-5.16

for you to fetch changes up to 3b8e19a0aa3933a785be9f1541afd8d398c4ec69:

  drm/mediatek: hdmi: Perform NULL pointer check for mtk_hdmi_conf (2021-12-13 21:01:11 +0800)

----------------------------------------------------------------
Mediatek DRM Fixes for Linux 5.16

1. Perform NULL pointer check for mtk_hdmi_conf.

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      drm/mediatek: hdmi: Perform NULL pointer check for mtk_hdmi_conf

 drivers/gpu/drm/mediatek/mtk_hdmi.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)
