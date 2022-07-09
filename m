Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C40FF56C5AF
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 03:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA9710E354;
	Sat,  9 Jul 2022 01:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B8910E32D
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 01:18:00 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 61BBA845D2;
 Sat,  9 Jul 2022 03:17:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1657329478;
 bh=DfDdetUodg8hstkoLleaU3t7OmZt3rrkZUJkbZ9o2ks=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K3hxtgIk41/DB0rO5zYB8zZgDGdr7XCup7kReLgb31/IujEKA2sOf3+YhtrN9FwRq
 10tCIZUj0/VZYwds7XzBR5xOrk2H0U5ZoBoW+Mk/H2nkMpD5gjRlN1exRxOFDcMEDZ
 3B5EjsZKntPBK6Ge5tB71a1vSmAdj+0TT6a4nnsEd5jVOizK4nj8GzcCd6PPin0XEz
 CLfj9er7d/Jgb7sL54qjOvbkJyT9TkTPoAk2utneHrK/DVq5mG3z+WOpmxGE1EIIEB
 GLf/UXyoIWLS7q60X0xX/N58qkjmA9JTq3gU73/2YmbxvlSeSlZLnvW/9K4CuJF7W5
 rn7C2Yu6SddEw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/lcdif: Clean up debug prints and comments
Date: Sat,  9 Jul 2022 03:17:45 +0200
Message-Id: <20220709011746.142296-3-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220709011746.142296-1-marex@denx.de>
References: <20220709011746.142296-1-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Martyn Welch <martyn.welch@collabora.com>, Liu Ying <victor.liu@nxp.com>,
 robert.foss@linaro.org, Liu Ying <victor.liu@oss.nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update debug print to report bridge timings over connector ones.
Drop missed comment commit from mxsfb.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Reported-by: Liu Ying <victor.liu@oss.nxp.com>
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

