Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A42A654DD1
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 09:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A1110E625;
	Fri, 23 Dec 2022 08:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B724C10E443
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 09:25:13 +0000 (UTC)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CECDBD8B;
 Wed, 21 Dec 2022 10:25:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1671614711;
 bh=gJWZGj+0Env0pf41JaaKnHYexVp19/3ifHWurEm4Kl8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sZwOCMKkNDzHgl+4aa4v0KCPG4UfYCTuxnTFyCIek3v1sNpsPzNvR/ZVUIUEs1zGY
 PXueabtiRR6oApIzAjsKJ0wKywKoFbDMiIN6/CkOP6NgWYcLnj8iXMvZq8AdKqu8PP
 XT/n2EB9Ka09UaYuLTEbvAyh2zCMJPA1QOvmhB0w=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3 6/7] drm: rcar-du: Bump V3U to gen 4
Date: Wed, 21 Dec 2022 11:24:47 +0200
Message-Id: <20221221092448.741294-7-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221092448.741294-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20221221092448.741294-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 23 Dec 2022 08:44:26 +0000
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
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V3U is actually gen 4 IP, like in V4H. Bump up V3U gen in the
rcar_du_r8a779a0_info.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 46c60a2d710d..c7c5217cfc1a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -504,7 +504,7 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
 };
 
 static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
-	.gen = 3,
+	.gen = 4,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_NO_BLENDING,
-- 
2.34.1

