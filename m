Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9931E56CA31
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 16:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875D510F682;
	Sat,  9 Jul 2022 14:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E00310F679
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 14:48:41 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4A541845D6;
 Sat,  9 Jul 2022 16:48:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1657378119;
 bh=/IwtqBsw26DxruMAnUOd4vy3gMTBSu42LYk9TJ12DxQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LHZtfyjyIWO2YJl7N7y4yNxNsmalXa0KOKtAAUA39GUTKyLShb+TFvqOQN6jV+HPJ
 FN4CBUka7SA8rJcY3QLKKr/PquMbstCkjosppKjNOOROSpjrqqHpBxdbvGOArviOgV
 wobRo2x0hKtiIBbtkOmxYiP0yud9xxwa7NShEfUkiR1fE+tsn+tbHfUxQRoaQWC+vb
 VBzxGvkbGdj4MOwUIBAiuVs3i4Hy4oXMQ0sV4vtHbJpv0QHhroMFMNPbGx/wMJR9o4
 k3jv2EvZ2QMG4GCKKmC+6tv5Qww8QKfPC/S8ZVg3lZK2IDf0VXHCl09GfvGkJGT+a8
 Blx3QtQQjJi5Q==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/4] drm/lcdif: Consistently use plain timings
Date: Sat,  9 Jul 2022 16:48:24 +0200
Message-Id: <20220709144826.9278-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220709144826.9278-1-marex@denx.de>
References: <20220709144826.9278-1-marex@denx.de>
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

Drop the crtc_ prefix from mode, consistently use the plain one.

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

