Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 249465624AD
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 22:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D581129FF;
	Thu, 30 Jun 2022 20:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70E11129EC
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 20:57:47 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8F3DC843DC;
 Thu, 30 Jun 2022 22:57:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1656622665;
 bh=xWXbTM9QWrfwqvu8ClxHRcbOE1KpyfdNmB/qZ0jn4I0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bIxggh0bXk9ExQc5qgW/ZartgUeic6tWksmdfMcxceW+H1aXGWNQ13uf/S4A0s2wP
 D4OYvOqk8iXrvBDgUzy/SsJlgxxBoq01LqyF/apE1fKVGIMGtgbt3lAKRFKk/SAYsA
 aaOZaLcC0/Mav4PM5Eu3JKUOkZJDvdPK8czqEh8N8UdxieFM2gbRBlCT6etqTYRN3Z
 COboyGn8/oukERteu2d97pmmYhs6Iwc8JHuDa4sylb7xqXRjlc3uJ1CG4vFImsX0H9
 38MmxFZoKWjhxrWyNHFsRzVfhJ2M5eH2Kj0ggozCBelK1kR8viIHiLRGOtrwJqaVjd
 6Rv2lqNAA6B/g==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/lcdif: Consistently use plane timings
Date: Thu, 30 Jun 2022 22:57:26 +0200
Message-Id: <20220630205728.128127-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630205728.128127-1-marex@denx.de>
References: <20220630205728.128127-1-marex@denx.de>
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
 Martyn Welch <martyn.welch@collabora.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>, robert.foss@linaro.org,
 Liu Ying <victor.liu@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the crtc_ prefix from mode, consistently use the plane one.

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
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index c9224126e2d54..df3d1832caae8 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -122,8 +122,8 @@ static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flags)
 
 	writel(ctrl, lcdif->base + LCDC_V8_CTRL);
 
-	writel(DISP_SIZE_DELTA_Y(m->crtc_vdisplay) |
-	       DISP_SIZE_DELTA_X(m->crtc_hdisplay),
+	writel(DISP_SIZE_DELTA_Y(m->vdisplay) |
+	       DISP_SIZE_DELTA_X(m->hdisplay),
 	       lcdif->base + LCDC_V8_DISP_SIZE);
 
 	writel(HSYN_PARA_BP_H(m->htotal - m->hsync_end) |
@@ -138,8 +138,8 @@ static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flags)
 	       VSYN_HSYN_WIDTH_PW_H(m->hsync_end - m->hsync_start),
 	       lcdif->base + LCDC_V8_VSYN_HSYN_WIDTH);
 
-	writel(CTRLDESCL0_1_HEIGHT(m->crtc_vdisplay) |
-	       CTRLDESCL0_1_WIDTH(m->crtc_hdisplay),
+	writel(CTRLDESCL0_1_HEIGHT(m->vdisplay) |
+	       CTRLDESCL0_1_WIDTH(m->hdisplay),
 	       lcdif->base + LCDC_V8_CTRLDESCL0_1);
 
 	writel(CTRLDESCL0_3_PITCH(lcdif->crtc.primary->state->fb->pitches[0]),
-- 
2.35.1

