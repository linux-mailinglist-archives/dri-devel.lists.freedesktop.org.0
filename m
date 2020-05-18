Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 115761D908D
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 09:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352B86E517;
	Tue, 19 May 2020 07:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87656E185
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 17:39:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 614452A0C85
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org,
	Collabora Kernel ML <kernel@collabora.com>
Subject: [RESEND PATCH 0/3] Convert mtk-dpi to drm_bridge API
Date: Mon, 18 May 2020 19:39:06 +0200
Message-Id: <20200518173909.2259259-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 May 2020 07:00:27 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, drinkcat@chromium.org,
 narmstrong@baylibre.com, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 boris.brezillon@collabora.com, linux-mediatek@lists.infradead.org,
 laurent.pinchart@ideasonboard.com, hsinyi@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The reason for this resend is because I forget to add some bridge
maintainers. So adding them and collect the actual tags.

The mtk-dpi driver still uses the drm_encoder API which is now somewhat
deprecated. We started to move all the Mediatek drivers to the drm_bridge API,
like we did for the mtk-dsi driver [1], this is another small step to be able to
fully convert the DRM Mediatek drivers to the drm_bridge API. A dummy
drm_encoder is maintained in the mtk-dpi driver but the end goal is move all the
dummy drm_encoder (mtk-dsi, mtk-dpi, etc) to the main mtk_drm_drv driver.

[1] https://lore.kernel.org/patchwork/project/lkml/list/?series=441559


Enric Balletbo i Serra (3):
  drm/mediatek: mtk_dpi: Rename bridge to next_bridge
  drm/mediatek: mtk_dpi: Convert to bridge driver
  drm/mediatek: mtk_dpi: Use simple encoder

 drivers/gpu/drm/mediatek/mtk_dpi.c | 84 ++++++++++++++----------------
 1 file changed, 39 insertions(+), 45 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
