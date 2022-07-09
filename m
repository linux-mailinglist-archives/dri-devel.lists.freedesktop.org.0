Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC81E56CAF1
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 19:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F52111A044;
	Sat,  9 Jul 2022 17:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76A5113FFC
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 17:36:24 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 688D0845CA;
 Sat,  9 Jul 2022 19:36:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1657388182;
 bh=vWUORI+UJ9WdsViGdDUTMTFqX9xPF+zqpfnvog0kyqI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yMOMpaUHz2Kx494Ks+sLcUg7uEYET6Tc2ZCGoZm0vsEOn2sFPAqbO3qno1/cRk9HL
 TAxbC5ocROIXmzegAQMt9XviTL7V+3nX0JCsuBWVpd2MbspdWrjACl+ot+gXucHu5R
 D3ofJ3uXZ8w/vaTct3sQs4Z/9iDTDP0kElxBx3PKqPh2s1+YxpcHyFImMB5JEH+z1r
 gWZiMMwuNyU/nVfXCPxUmnnp1hHjgbu3Om0o4u6yjsMSaR7Zc3lz74P1gOM6DcRtR3
 /sIkvA3RlWajD5UuDmzm3NRIsFBCuF/viY+426iyM15vV52Us4ztepQWQqlBzMGyfn
 nbvRiJT1SfI2Q==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/4] drm/lcdif: Consistently use plain timings
Date: Sat,  9 Jul 2022 19:36:04 +0200
Message-Id: <20220709173606.72852-2-marex@denx.de>
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

Drop the crtc_ prefix from mode, consistently use the plain one.

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
    Replace plane with plain
V3: Add TB from Martyn from V1
V4: Add AB from Sam from V2
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index d7363e2b2fad0..829b0a6bb0d3f 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -123,8 +123,8 @@ static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flags)
 
 	writel(ctrl, lcdif->base + LCDC_V8_CTRL);
 
-	writel(DISP_SIZE_DELTA_Y(m->crtc_vdisplay) |
-	       DISP_SIZE_DELTA_X(m->crtc_hdisplay),
+	writel(DISP_SIZE_DELTA_Y(m->vdisplay) |
+	       DISP_SIZE_DELTA_X(m->hdisplay),
 	       lcdif->base + LCDC_V8_DISP_SIZE);
 
 	writel(HSYN_PARA_BP_H(m->htotal - m->hsync_end) |
@@ -139,8 +139,8 @@ static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flags)
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

