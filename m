Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E724B4191
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 07:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768F910E43D;
	Mon, 14 Feb 2022 06:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E144110E43D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 06:08:55 +0000 (UTC)
X-UUID: 8b968aa29df746e2abefbda71ce08e89-20220214
X-UUID: 8b968aa29df746e2abefbda71ce08e89-20220214
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 748286038; Mon, 14 Feb 2022 14:08:52 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 14:08:51 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 14:08:49 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/23] component: Add common helpers for compare/release
Date: Mon, 14 Feb 2022 14:07:56 +0800
Message-ID: <20220214060819.7334-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 James Wang <james.qian.wang@arm.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srv_heupstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The component requires the compare/release functions, there are many
copies in current kernel. This patchset just defines four common helpers
for them. No functional change.

Change note:
v1: a) Split the original patch into many small patches.
    b) Use device_match_of_node helper.
    c) Move the functions into c and export since
    the callback doesn't look like it should be "inline".
    d) Add "component_" prefix for the functon names.
    e) Add a new component_compare_dev_name.    

RFC: https://lore.kernel.org/dri-devel/20220128081101.27837-1-yong.wu@mediatek.com/
    rebase on v5.17-rc1

Yong Wu (23):
  component: Add common helper for compare/release functions
  drm/komeda: Make use of the helper component_compare_of
  drm/armada: Make use of the helper component_compare_of/dev_name
  drm/etnaviv: Make use of the helper component_compare_of/dev_name
  drm/hirin: Make use of the helper component_compare_of
  drm/ingenic: Make use of the helper component_compare_of
  drm/mediatek: Make use of the helper component_compare_of
  drm/meson: Make use of the helper component_compare_of
  drm/msm: Make use of the helper component_compare_of
  drm/sprd: Make use of the helper component_compare_of
  drm/sti: Make use of the helper component_compare_of
  drm/sun4i: Make use of the helper component_compare_of
  drm/rockchip: Make use of the helper component_compare_dev
  drm/exynos: Make use of the helper component_compare_dev
  drm/mcde: Make use of the helper component_compare_dev
  drm/omap: dss: Make use of the helper component_compare_dev
  drm/vc4: Make use of the helper component_compare_dev
  drm: of: Make use of the helper component_release_of
  iommu/mediatek: Make use of the helper component_compare/release_of
  ASoC: codecs: wcd938x: Make use of the helper
    component_compare/release_of
  power: supply: ab8500: Make use of the helper component_compare_dev
  video: omapfb: dss: Make use of the helper component_compare_dev
  ALSA: hda/realtek: Make use of the helper component_compare_dev_name

 drivers/base/component.c                      | 58 +++++++++++++++++++
 .../gpu/drm/arm/display/komeda/komeda_drv.c   |  7 +--
 drivers/gpu/drm/armada/armada_drv.c           | 17 +-----
 drivers/gpu/drm/drm_of.c                      |  7 +--
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         | 16 +----
 drivers/gpu/drm/exynos/exynos_drm_drv.c       |  8 +--
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  7 +--
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  7 +--
 drivers/gpu/drm/mcde/mcde_drv.c               |  7 +--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  7 +--
 drivers/gpu/drm/meson/meson_drv.c             | 10 +---
 drivers/gpu/drm/msm/msm_drv.c                 | 15 +----
 drivers/gpu/drm/omapdrm/dss/dss.c             |  8 +--
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  7 +--
 drivers/gpu/drm/sprd/sprd_drm.c               |  7 +--
 drivers/gpu/drm/sti/sti_drv.c                 |  7 +--
 drivers/gpu/drm/sun4i/sun4i_drv.c             | 11 +---
 drivers/gpu/drm/vc4/vc4_drv.c                 |  7 +--
 drivers/iommu/mtk_iommu.c                     |  4 +-
 drivers/iommu/mtk_iommu.h                     | 10 ----
 drivers/iommu/mtk_iommu_v1.c                  |  4 +-
 drivers/power/supply/ab8500_charger.c         |  8 +--
 drivers/video/fbdev/omap2/omapfb/dss/dss.c    |  8 +--
 include/linux/component.h                     |  6 ++
 sound/pci/hda/patch_realtek.c                 | 11 +---
 sound/soc/codecs/wcd938x.c                    | 18 ++----
 26 files changed, 99 insertions(+), 183 deletions(-)

-- 
2.18.0


