Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F063E484D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 17:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADB4898AF;
	Mon,  9 Aug 2021 15:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0097898AF
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 15:06:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 523ED60F11;
 Mon,  9 Aug 2021 15:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628521568;
 bh=kKiTuvHFidh89Tnf5j3aUlnVrP9Bk+cJepda4RZf2JI=;
 h=From:To:Cc:Subject:Date:From;
 b=MgJjEUF13nttx8J2Xigea3vHPNd2QgnbhooTznezLCoo0S0WEdzmbSZfKg6ZsWHGA
 Mv7QtW5HWpVneh1qmI/zj+xiSRtp8VXmIQU0vVYkCLvN4fjvr/PRWRc01t/hYjWzAB
 9N3yoKJq0aMhghTyvAlybhBvIv0bka+0gXQTfTts3HnyyLXP4GeEHrLv3rihWNIgrz
 GshO2FbX8JYitGFHHCA0p/pOG5T2uBbbBdvCzTfmwj/l8aqxaxXtySowC1lDhzSB4w
 mPPAQ64H8TLYNoH64arFPkjAZmjQoCAzVfLAh7byWaCIQDgpOPJ17A2FKQKG5zLJC8
 NUokdSDESNeDA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>
Subject: [GIT PULL] mediatek drm fixes for 5.14
Date: Mon,  9 Aug 2021 23:06:04 +0800
Message-Id: <20210809150604.32426-1-chunkuang.hu@kernel.org>
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

1. Fix dpi bridge bug.
2. Fix cursor plane no update.

Regards,
Chun-Kuang.

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-5.14

for you to fetch changes up to 1a64a7aff8da352c9419de3d5c34343682916411:

  drm/mediatek: Fix cursor plane no update (2021-07-22 22:57:52 +0800)

----------------------------------------------------------------
Mediatek DRM Fixes for Linux 5.14

1. Fix dpi bridge bug.
2. Fix cursor plane no update.

----------------------------------------------------------------
Frank Wunderlich (1):
      drm/mediatek: dpi: Fix NULL dereference in mtk_dpi_bridge_atomic_check

Hsin-Yi Wang (1):
      drm/mediatek: mtk-dpi: Set out_fmt from config if not the last bridge

jason-jh.lin (1):
      drm/mediatek: Fix cursor plane no update

 drivers/gpu/drm/mediatek/mtk_dpi.c       |  6 +++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |  3 --
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 60 ++++++++++++++++++--------------
 3 files changed, 39 insertions(+), 30 deletions(-)
