Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7834E9C1E9A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 14:54:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C3810E9B6;
	Fri,  8 Nov 2024 13:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="o61aKxCd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F7F410E9B7
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 13:54:03 +0000 (UTC)
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1731074042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2nN4JqEDzQF8CCUgP/ziSYmPd1Oo8YRgapLVQ+6WIcU=;
 b=o61aKxCdcZBd2XTmhnBPl8aecZCjt/wzStVNMVp/TwEhp49T8em57HVwDE216g+2p498NR
 cjiRwrOWiUxW8F5n0ju2oFnbFykdcrWmmCA9xAhO2i0Y3byW5NmliccfnEgzF3XSewx+ie
 uhwX45ih8uZHZbOJkWaeCLeTkfJxAxHcoQJ8sd6/nSEOhdkrERTDbXeu0E2pGJaeBUJL6z
 QXIIRKarHHyoHNpRGq+lOG8otxJw+xMaAq6wauxLydTRxceNzwhJ34W5vS0SIxLJoSQavV
 u0um4SRYHG86KeUR9Xv1E7QOlWqWXbTRhHOJlLpqHLYD2rOIJqYk/rWwgbBE+g==
To: linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: heiko@sntech.de, hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/rockchip: dsi: Perform trivial code cleanups
Date: Fri,  8 Nov 2024 14:53:57 +0100
Message-Id: <35555b58a7284450fb16281514e4e6a3eb9c7b82.1731073565.git.dsimic@manjaro.org>
In-Reply-To: <cover.1731073565.git.dsimic@manjaro.org>
References: <cover.1731073565.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
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

Perform a few trivial code cleanups, to make one logged message a bit more
consistent with the other logged messages by capitalizing its first word, and
to avoid line wrapping by using the 100-column width better.

No intended functional changes are introduced by these code cleanups.

Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 58a44af0e9ad..f451e70efbdd 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -1379,7 +1379,7 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
 	}
 
 	if (!dsi->cdata) {
-		DRM_DEV_ERROR(dev, "no dsi-config for %s node\n", np->name);
+		DRM_DEV_ERROR(dev, "No dsi-config for %s node\n", np->name);
 		return -EINVAL;
 	}
 
@@ -1408,19 +1408,16 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
 			dsi->pllref_clk = NULL;
 		} else {
 			ret = PTR_ERR(dsi->pllref_clk);
-			DRM_DEV_ERROR(dev,
-				      "Unable to get pll reference clock: %d\n",
-				      ret);
+			DRM_DEV_ERROR(dev, "Unable to get pll reference clock: %d\n", ret);
 			return ret;
 		}
 	}
 
 	if (dsi->cdata->flags & DW_MIPI_NEEDS_PHY_CFG_CLK) {
 		dsi->phy_cfg_clk = devm_clk_get(dev, "phy_cfg");
 		if (IS_ERR(dsi->phy_cfg_clk)) {
 			ret = PTR_ERR(dsi->phy_cfg_clk);
-			DRM_DEV_ERROR(dev,
-				      "Unable to get phy_cfg_clk: %d\n", ret);
+			DRM_DEV_ERROR(dev, "Unable to get phy_cfg_clk: %d\n", ret);
 			return ret;
 		}
 	}
@@ -1465,8 +1462,7 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->dmd)) {
 		ret = PTR_ERR(dsi->dmd);
 		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev,
-				      "Failed to probe dw_mipi_dsi: %d\n", ret);
+			DRM_DEV_ERROR(dev, "Failed to probe dw_mipi_dsi: %d\n", ret);
 		return ret;
 	}
 
