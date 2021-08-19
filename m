Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8D73F0F16
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 02:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8C96E8D5;
	Thu, 19 Aug 2021 00:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAFC6E8D5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 00:16:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB6876108E;
 Thu, 19 Aug 2021 00:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629332198;
 bh=zZft6P060s9BnxZt1kX87KRPlg3Gc3gLaiETgzf3xgI=;
 h=From:To:Cc:Subject:Date:From;
 b=Ys0pbb+OWDWuDLO5J97eZjdaqlzDdZrb2c1uXlc9idzKmJZPliOYwg1S1VJ+VwP5U
 6V0bMJuTCWJIWELS1gEz6VnmwZy4ZGd+aGXLHnZw+BUvZVllt9dx3ETT7x28Tn8oC5
 /uCxZtSxqwuo6odvUYWoat/5VMN/ONwn8hzLMCcUV+rGT4xdDsBsYD8PAc7g4zml2k
 BVJF8LnP2YBmMp3tbDZ3j1deRG6IKONq9ixHJErLeYWgv8yTrYazSIeQNhfdssXS0L
 vWCJEVatVyhMaMskdAXYaPNDyOuAazpDoI45Bi6sf59TrFGcLT9dqMuYVo+lJ9+js0
 BcAWtnzmKrJXg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: "jason-jh . lin" <jason-jh.lin@mediatek.com>
Subject: [GIT PULL] mediatek drm fixes for 5.14-2
Date: Thu, 19 Aug 2021 08:16:35 +0800
Message-Id: <20210819001635.14803-1-chunkuang.hu@kernel.org>
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

1. Fix AAL output size setting.
2. Delete component in remove function.

Regards,
Chun-Kuang.

The following changes since commit 1a64a7aff8da352c9419de3d5c34343682916411:

  drm/mediatek: Fix cursor plane no update (2021-07-22 22:57:52 +0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-5.14-2

for you to fetch changes up to da4d4517ba70216799e3eb3b9bd71aa9dca065da:

  drm/mediatek: Add component_del in OVL and COLOR remove function (2021-08-12 07:00:50 +0800)

----------------------------------------------------------------
Mediatek DRM Fixes for Linux 5.14-2

1. Fix AAL output size setting.
2. Delete component in remove function.

----------------------------------------------------------------
jason-jh.lin (2):
      drm/mediatek: Add AAL output size configuration
      drm/mediatek: Add component_del in OVL and COLOR remove function

 drivers/gpu/drm/mediatek/mtk_disp_color.c   | 2 ++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 2 ++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 2 ++
 3 files changed, 6 insertions(+)
