Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F0F56CAF4
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 19:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B5611A079;
	Sat,  9 Jul 2022 17:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BA711A044
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 17:36:24 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id CCADF845D9;
 Sat,  9 Jul 2022 19:36:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1657388183;
 bh=FDipnGOZ1IliFhv5WJ2JRRjRD0dDeDc5d9IhkfKRT+o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xbrkI24v5aM8h2enPXfs9w2UYTZGvTRIXriG31/2QHE/PzaFfiaA42iVBucqyN9d4
 vmZfx8ZjPBJVn4LAEIIXeABS/sSqe9K+7eb+zt9dne/3Xwh/l54kW64GRKVO4b2+H8
 I2lo9OyFXxqzwZkAkeWews8y+3RLtdNs2tB9YgQRqILJx+CdZ7iyLEmQMD54+l5O2H
 xa+pNz17KbzlugFWmxOw/4Y9TmXIH7Orb9OYOWtYuWac4zPGjx97UVnxFG7i2ZSnwk
 2dheRN+0iyH78HR1jwwYrnRCBAt/uyDg5DzpyYKxVwHoLXCOvE6wplv3JzdqF6rXBZ
 wdBcucrwKkQxQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/4] drm/lcdif: Clean up debug prints and comments
Date: Sat,  9 Jul 2022 19:36:05 +0200
Message-Id: <20220709173606.72852-3-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220709173606.72852-1-marex@denx.de>
References: <20220709173606.72852-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>, Peng Fan <peng.fan@nxp.com>,
 Liu Ying <victor.liu@nxp.com>, robert.foss@linaro.org,
 Liu Ying <victor.liu@oss.nxp.com>, Martyn Welch <martyn.welch@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update debug print to report bridge timings over connector ones.
Drop missed comment commit from mxsfb.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Liu Ying <victor.liu@nxp.com>
Reported-by: Liu Ying <victor.liu@oss.nxp.com>
Tested-by: Martyn Welch <martyn.welch@collabora.com>
Fixes: 9db35bb349a0e ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Marek Vasut <marex@denx.de>
Cc: Martyn Welch <martyn.welch@collabora.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Robby Cai <robby.cai@nxp.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stefan Agner <stefan@agner.ch>
---
V2: Add RB from Liu
V3: Add TB from Martyn from V1
V4: Add AB from Sam from V2
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 829b0a6bb0d3f..9a77c631300a4 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -204,7 +204,7 @@ static void lcdif_crtc_mode_set_nofb(struct lcdif_drm_private *lcdif,
 	DRM_DEV_DEBUG_DRIVER(drm->dev, "Pixel clock: %dkHz (actual: %dkHz)\n",
 			     m->crtc_clock,
 			     (int)(clk_get_rate(lcdif->clk) / 1000));
-	DRM_DEV_DEBUG_DRIVER(drm->dev, "Connector bus_flags: 0x%08X\n",
+	DRM_DEV_DEBUG_DRIVER(drm->dev, "Bridge bus_flags: 0x%08X\n",
 			     bus_flags);
 	DRM_DEV_DEBUG_DRIVER(drm->dev, "Mode flags: 0x%08X\n", m->flags);
 
@@ -296,7 +296,6 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	lcdif_crtc_mode_set_nofb(lcdif, bridge_state, bus_format);
 
-	/* Write cur_buf as well to avoid an initial corrupt frame */
 	paddr = drm_fb_cma_get_gem_addr(new_pstate->fb, new_pstate, 0);
 	if (paddr) {
 		writel(lower_32_bits(paddr),
-- 
2.35.1

