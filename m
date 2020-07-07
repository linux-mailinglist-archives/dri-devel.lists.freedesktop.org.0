Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF070217158
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 17:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A46E6E194;
	Tue,  7 Jul 2020 15:39:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018786E21E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 15:39:47 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3FF5820738;
 Tue,  7 Jul 2020 15:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594136387;
 bh=OZxhBwXl2+QGrWctHl4G4FGR1qQy4iBCcbBcWDMw3c4=;
 h=From:To:Cc:Subject:Date:From;
 b=VQia3i8bZUIW9VG6hmLIgWUJlXRdoVqQqU2rsd7dDHd+xQuGvvLy5Cl0N7FsjAurG
 kSLTEzdvAPE9daZzROpZVsUOb0ZyIzuE7lX+bV6zyktMg+4GqSbh4LBSzc2TqpXDZG
 q+kQkcThjaIbXXkm7UROqKbYbz+EoEaZ0yunJjak=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm fixes for 5.8
Date: Tue,  7 Jul 2020 23:39:44 +0800
Message-Id: <20200707153944.604-1-chunkuang.hu@kernel.org>
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Bernard Zhao <bernard@vivo.com>, YueHaibing <yuehaibing@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & David:

This include fixup for cmdq, mmsys, visibility checking and some refinement.

Regards,
Chun-Kuang.


The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-5.8

for you to fetch changes up to 5ab546f5e6309373aef01a8d398e163ab7a78431:

  drm/mediatek: mtk_hdmi: Remove debug messages for function calls (2020-07-05 06:39:21 +0800)

----------------------------------------------------------------
Mediatek DRM Fixes for Linux 5.8

----------------------------------------------------------------
Bernard Zhao (1):
      drm/mediatek: Remove unnecessary conversion to bool

Enric Balletbo i Serra (3):
      drm/mediatek: Remove debug messages for function calls
      drm/mediatek: mtk_mt8173_hdmi_phy: Remove unnused const variables
      drm/mediatek: mtk_hdmi: Remove debug messages for function calls

Hsin-Yi Wang (2):
      drm/mediatek: Fix device passed to cmdq
      drm/mediatek: Check plane visibility in atomic_update

Matthias Brugger (1):
      drm/mediatek: Delete not used of_device_get_match_data

YueHaibing (1):
      drm/mediatek: Fix Kconfig warning

 drivers/gpu/drm/mediatek/Kconfig               |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c        |  8 +---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c         |  6 +--
 drivers/gpu/drm/mediatek/mtk_drm_plane.c       | 25 ++++++++-----
 drivers/gpu/drm/mediatek/mtk_dsi.c             |  5 +--
 drivers/gpu/drm/mediatek/mtk_hdmi.c            | 12 +-----
 drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c | 52 --------------------------
 7 files changed, 22 insertions(+), 88 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
