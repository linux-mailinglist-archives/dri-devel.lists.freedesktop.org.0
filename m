Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B096D158B49
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 09:34:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DAE6EDFA;
	Tue, 11 Feb 2020 08:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686306EDCE
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 07:35:57 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 855A55CA;
 Tue, 11 Feb 2020 02:29:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 11 Feb 2020 02:29:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=2XAzinolYfeXzXbbLu5Jf1/tN3
 a6jZF/BQkbt3wshz0=; b=VkPf1VuvLgWPnZUZw6fX9LXSuDM9h+0Pt1b8hzsmRd
 GZZb5mTMCqeax3Ow+tRMtpQnr6/6pnsdYq4Hc/2Sq3//RAkety/bzDhYL0lZQLz5
 OW5Pq5t3NLFYh9FJndlfu9bJKRGmqJ8vRBZZisncXe1O0qxZLUmeXoWrpInsr0tK
 e5oRlJTRw83G4+c7cDse0q9Ae1pFQhJ2ft0+yt/Scgf0YL0Tn1Zzca3eXvO71rTC
 6MZGxiRFVBZ0ctGrOt9djhzLaHuCCFGxrAa8DMWUNhjslyeDRivf4RIJ4igjeTT/
 3UHCFZ1D9RS/xfQRw0BdjP03O1kadeL948agO/ays8Ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2XAzinolYfeXzXbbL
 u5Jf1/tN3a6jZF/BQkbt3wshz0=; b=qbHkvXgEe0KcB+QSs2nj7VG5eJ5tyPHWi
 JWdyTt+3hLCstxAqKgUdXrHA7APggTjdpPi1PnNxluZM8OB1bZC+fZ6aPv5bu6K1
 uoqPa4eVfw5fhlsjKPWyEhLx/tOiQLEJ4QH9fVr5zJtIj9atIJAwWp67/e7aHh4n
 KFdW5b2l07rWvnXJHY9TCqnZH2iOQhoh5ti/GEi5EzT4SkiqLsnYLV8tVU7R3LMa
 wSJw81pvGM+4TixAO3l8PNR8vS7f6nvmd2SravACpxlJtGGyIhEHAFaY+b940saq
 cWB3rYhBDtmrpgrFU342uiGKO/jrDGFlUKBrGNzC/DBs4/oqEFlFw==
X-ME-Sender: <xms:u1dCXmNGxulksOtPjq7ptNU-t0wdnoWA3WIK4_dXcBSgw-mowbt8Qw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedriedvgddutdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
 jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucfkphepje
 dtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:u1dCXpPfEQsTN8KeDot1R3zoTqbY3LyJQfJRe2gg7sT_bZuzp7RCgA>
 <xmx:u1dCXoQwqRzffF3krcN6pcSD132qpXBRObH9cB0UiMfGE149YhCEXQ>
 <xmx:u1dCXrBJT3YkMotWYc_MSPRZjRuYGf5Cf60UiRkBaStkGW_LVRT6Vw>
 <xmx:vVdCXtFJbQrffTeuoif7Lg7EwI8DMgBHtEGzU2pW0IYPBivNUaT4AA>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2C13030606E9;
 Tue, 11 Feb 2020 02:28:59 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/sun4i: dsi: Remove unused drv from driver context
Date: Tue, 11 Feb 2020 01:28:55 -0600
Message-Id: <20200211072858.30784-1-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 11 Feb 2020 08:34:23 +0000
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
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This member is never used, so remove it.

Fixes: 133add5b5ad4 ("drm/sun4i: Add Allwinner A31 MIPI-DSI controller support")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 4 ----
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h | 1 -
 2 files changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index c958ca9bae63..c07290541fff 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -27,7 +27,6 @@
 #include <drm/drm_probe_helper.h>
 
 #include "sun4i_crtc.h"
-#include "sun4i_drv.h"
 #include "sun4i_tcon.h"
 #include "sun6i_mipi_dsi.h"
 
@@ -1022,15 +1021,12 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 			 void *data)
 {
 	struct drm_device *drm = data;
-	struct sun4i_drv *drv = drm->dev_private;
 	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
 	int ret;
 
 	if (!dsi->panel)
 		return -EPROBE_DEFER;
 
-	dsi->drv = drv;
-
 	drm_encoder_helper_add(&dsi->encoder,
 			       &sun6i_dsi_enc_helper_funcs);
 	ret = drm_encoder_init(drm,
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
index 3f4846f581ef..61e88ea6044d 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
@@ -28,7 +28,6 @@ struct sun6i_dsi {
 	struct phy		*dphy;
 
 	struct device		*dev;
-	struct sun4i_drv	*drv;
 	struct mipi_dsi_device	*device;
 	struct drm_panel	*panel;
 };
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
