Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA2B269987
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 01:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13AFC89D81;
	Mon, 14 Sep 2020 23:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D3289D81
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 23:12:31 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7A1C320897;
 Mon, 14 Sep 2020 23:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600125150;
 bh=ilRqcuoTqEksaiQcJUzdJh0oFIOK/WygW04bpazbtmo=;
 h=From:To:Cc:Subject:Date:From;
 b=dZhLbfYJu5sZtodjE518NgSUfmltDgX5OIGvkvchit8XGMTxI4cSh99sgcScEGm3v
 XKJUp05ieeA3TGyIzY47Jtjb78WTulaAKREWYJkGEisBMOE8GIy1P07DI5A7aI6v0w
 DNQUBjqx59sZybX8QO6PbPNWQwD2Vk5p0Lwlx3D0=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm next for 5.10
Date: Tue, 15 Sep 2020 07:12:27 +0800
Message-Id: <20200914231227.30500-1-chunkuang.hu@kernel.org>
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
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:

1. Move Mediatek HDMI PHY driver from DRM folder to PHY folder
2. Convert mtk-dpi to drm_bridge API
3. Disable tmds on mt2701

Regards,
Chun-Kuang.

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-5.10

for you to fetch changes up to 09e872d558ba6a7f4468c4e8cdf0cd5a99bfc175:

  drm/mediatek: Disable tmds on mt2701 (2020-09-14 23:05:23 +0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 5.10

1. Move Mediatek HDMI PHY driver from DRM folder to PHY folder
2. Convert mtk-dpi to drm_bridge API
3. Disable tmds on mt2701

----------------------------------------------------------------
CK Hu (3):
      drm/mediatek: Move tz_disabled from mtk_hdmi_phy to mtk_hdmi driver
      drm/mediatek: Separate mtk_hdmi_phy to an independent module
      phy: mediatek: Move mtk_hdmi_phy driver into drivers/phy/mediatek folder

Chun-Kuang Hu (1):
      MAINTAINERS: add files for Mediatek DRM drivers

Enric Balletbo i Serra (2):
      drm/mediatek: mtk_dpi: Rename bridge to next_bridge
      drm/mediatek: mtk_dpi: Convert to bridge driver

Frank Wunderlich (2):
      dt-bindings: mediatek: add mt7623 display-nodes
      drm/mediatek: Add ddp routing for mt7623

Stu Hsieh (1):
      drm/mediatek: dpi/dsi: Change the getting possible_crtc way

chunhui dai (1):
      drm/mediatek: Disable tmds on mt2701

 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt                   |  2 +-
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt                    |  2 +-
 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt                    |  4 ++--
 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt                   |  4 ++++
 MAINTAINERS                                                                            |  1 +
 drivers/gpu/drm/mediatek/Kconfig                                                       |  2 +-
 drivers/gpu/drm/mediatek/Makefile                                                      |  5 +----
 drivers/gpu/drm/mediatek/mtk_dpi.c                                                     | 80 ++++++++++++++++++++++++++++++++++++++++++++++----------------------------------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c                                            | 38 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h                                            |  2 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c                                                 | 23 +++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dsi.c                                                     |  6 +-----
 drivers/gpu/drm/mediatek/mtk_hdmi.c                                                    | 21 +++++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_hdmi.h                                                    |  1 -
 drivers/phy/mediatek/Kconfig                                                           |  7 +++++++
 drivers/phy/mediatek/Makefile                                                          |  5 +++++
 drivers/{gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi-mt2701.c} |  4 ++--
 drivers/{gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi-mt8173.c} |  2 +-
 drivers/{gpu/drm/mediatek/mtk_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi.c}               |  6 +++++-
 drivers/{gpu/drm/mediatek/mtk_hdmi_phy.h => phy/mediatek/phy-mtk-hdmi.h}               |  3 +--
 20 files changed, 159 insertions(+), 59 deletions(-)
 rename drivers/{gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi-mt2701.c} (99%)
 rename drivers/{gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi-mt8173.c} (99%)
 rename drivers/{gpu/drm/mediatek/mtk_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi.c} (96%)
 rename drivers/{gpu/drm/mediatek/mtk_hdmi_phy.h => phy/mediatek/phy-mtk-hdmi.h} (95%)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
