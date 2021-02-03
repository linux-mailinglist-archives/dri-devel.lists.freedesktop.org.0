Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6ED30EE5F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 09:32:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF0E6ECF0;
	Thu,  4 Feb 2021 08:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1A589834
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 11:06:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id DEF791F454BD
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] phy: mediatek: Add missing MODULE_DEVICE_TABLE()
Date: Wed,  3 Feb 2021 12:06:30 +0100
Message-Id: <20210203110631.686003-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 04 Feb 2021 08:32:37 +0000
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
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Boris Brezillon <boris.brezillon@collabora.com>

This patch adds the missing MODULE_DEVICE_TABLE definitions on different
Mediatek phy drivers which generates correct modalias for automatic loading
when these drivers are compiled as an external module.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 drivers/phy/mediatek/phy-mtk-hdmi.c     | 1 +
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
index 45be8aa724f3..8313bd517e4c 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -201,6 +201,7 @@ static const struct of_device_id mtk_hdmi_phy_match[] = {
 	},
 	{},
 };
+MODULE_DEVICE_TABLE(of, mtk_hdmi_phy_match);
 
 static struct platform_driver mtk_hdmi_phy_driver = {
 	.probe = mtk_hdmi_phy_probe,
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
index 18c481251f04..9c7815bb9000 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
@@ -233,6 +233,7 @@ static const struct of_device_id mtk_mipi_tx_match[] = {
 	  .data = &mt8183_mipitx_data },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, mtk_mipi_tx_match);
 
 struct platform_driver mtk_mipi_tx_driver = {
 	.probe = mtk_mipi_tx_probe,
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
