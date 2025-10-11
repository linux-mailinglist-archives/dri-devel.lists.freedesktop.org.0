Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF5FBCF8BF
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E434F10E243;
	Sat, 11 Oct 2025 17:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="aDaGSG2K";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ur7YpcrF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2A210E30A
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:03:11 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ckVL53z2Gz9skV;
 Sat, 11 Oct 2025 19:03:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YGvU67Ll+AN2vD11o68DZRCZ7+qYUemEkQi2VibUdjc=;
 b=aDaGSG2KR1Mkw0pPkqy0fVzhBYzcBBFSvnGYPXXtsF5uJVxbhJSOrAl52bWNQCyn7lUwav
 jwVxDZy9MH8/QNGQaRnrzNjz65dZsZcTej2T9BlJJUAqo8KKqkzTVbpLIQaONFmoGA09y9
 1gwHFPZw2i7FhXc2UX1S/eKDuHWUqIm9fVcvmRIrJHomN+HultzEn+voeiH1+sXSnZifZH
 VqCjNYb/PJrHU+DQ6Jy+pR8D0WOBfe19cvDfrswIbsAc7gHX5fE4nwirQ6mytyi1Vy1wKJ
 ohjfuL4O1lWMzDXfw9EXx17ay66ESL4HhbQUnnMyX26s4PAJYPE285ocYrF+aw==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YGvU67Ll+AN2vD11o68DZRCZ7+qYUemEkQi2VibUdjc=;
 b=ur7YpcrFHThhMFHM3VbpMXBWIiWhPWJk4+4UlI0gLrOGnCHyWeDX8c40FZVidPIa8nf9LC
 4VKUq+xNVRp16rHWGGEPRFZHxOrclnPgYNsPYzAompmK3IJlI3oaRsnGkDjL4CBMAeB9Ln
 cCMxVnUOTv60YKHiGRn/UyoqEhcdy4dLYxA9iKUFhUTh+a3vnEkonz19uYrT28792fg40B
 BUcUz+xJ06z68eW9a8pFlXOpWLiFSaX6z1SuHb7ICID0H3UQLpD0iryGYE+1DeQyht0EpN
 OcITyTw/zhU5Ld+M6vIJ/prEQoXNgeiU7a/VKnZ2TurGOXr1XNViNQQjtCalTQ==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH 06/39] drm/imx: dc: Rename i.MX8QXP specific Link IDs
Date: Sat, 11 Oct 2025 18:51:21 +0200
Message-ID: <20251011170213.128907-7-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: c7k86a8hngo4pgurui9ibo7yd3r8x4r8
X-MBO-RS-ID: 6efeeb6dac92bdf874d
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

Add _IMX8QXP suffix to Link IDs which are specific to the i.MX8QXP SoC.
This is an i.MX95 support preparatory patch. No functional change.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/gpu/drm/imx/dc/dc-cf.c |  4 ++--
 drivers/gpu/drm/imx/dc/dc-ed.c | 12 ++++++------
 drivers/gpu/drm/imx/dc/dc-lb.c | 14 +++++++-------
 drivers/gpu/drm/imx/dc/dc-pe.h | 22 +++++++++++-----------
 4 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-cf.c b/drivers/gpu/drm/imx/dc/dc-cf.c
index 846705534546a..6cb83182a3668 100644
--- a/drivers/gpu/drm/imx/dc/dc-cf.c
+++ b/drivers/gpu/drm/imx/dc/dc-cf.c
@@ -123,11 +123,11 @@ static int dc_cf_bind(struct device *dev, struct device *master, void *data)
 		dc_drm->cf_cont[1] = cf;
 		break;
 	case 4:
-		cf->link = LINK_ID_CONSTFRAME4;
+		cf->link = LINK_ID_CONSTFRAME4_MX8QXP;
 		dc_drm->cf_safe[0] = cf;
 		break;
 	case 5:
-		cf->link = LINK_ID_CONSTFRAME5;
+		cf->link = LINK_ID_CONSTFRAME5_MX8QXP;
 		dc_drm->cf_safe[1] = cf;
 		break;
 	}
diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
index a63c387a4c023..9a141c6aa0812 100644
--- a/drivers/gpu/drm/imx/dc/dc-ed.c
+++ b/drivers/gpu/drm/imx/dc/dc-ed.c
@@ -110,12 +110,12 @@ static const enum dc_link_id src_sels[] = {
 	LINK_ID_NONE,
 	LINK_ID_CONSTFRAME0,
 	LINK_ID_CONSTFRAME1,
-	LINK_ID_CONSTFRAME4,
-	LINK_ID_CONSTFRAME5,
-	LINK_ID_LAYERBLEND3,
-	LINK_ID_LAYERBLEND2,
-	LINK_ID_LAYERBLEND1,
-	LINK_ID_LAYERBLEND0,
+	LINK_ID_CONSTFRAME4_MX8QXP,
+	LINK_ID_CONSTFRAME5_MX8QXP,
+	LINK_ID_LAYERBLEND3_MX8QXP,
+	LINK_ID_LAYERBLEND2_MX8QXP,
+	LINK_ID_LAYERBLEND1_MX8QXP,
+	LINK_ID_LAYERBLEND0_MX8QXP,
 };
 
 static inline void dc_ed_pec_enable_shden(struct dc_ed *ed)
diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
index 34ea61c2de87d..619353456743c 100644
--- a/drivers/gpu/drm/imx/dc/dc-lb.c
+++ b/drivers/gpu/drm/imx/dc/dc-lb.c
@@ -124,8 +124,8 @@ static const enum dc_link_id prim_sels[] = {
 	LINK_ID_NONE,
 	LINK_ID_CONSTFRAME0,
 	LINK_ID_CONSTFRAME1,
-	LINK_ID_CONSTFRAME4,
-	LINK_ID_CONSTFRAME5,
+	LINK_ID_CONSTFRAME4_MX8QXP,
+	LINK_ID_CONSTFRAME5_MX8QXP,
 	/*
 	 * special options:
 	 * layerblend(n) has n special options,
@@ -133,10 +133,10 @@ static const enum dc_link_id prim_sels[] = {
 	 * layerblend3 has 3 special options -
 	 * layerblend0/1/2.
 	 */
-	LINK_ID_LAYERBLEND0,
-	LINK_ID_LAYERBLEND1,
-	LINK_ID_LAYERBLEND2,
-	LINK_ID_LAYERBLEND3,
+	LINK_ID_LAYERBLEND0_MX8QXP,
+	LINK_ID_LAYERBLEND1_MX8QXP,
+	LINK_ID_LAYERBLEND2_MX8QXP,
+	LINK_ID_LAYERBLEND3_MX8QXP,
 };
 
 static const enum dc_link_id sec_sels[] = {
@@ -281,7 +281,7 @@ static int dc_lb_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	lb->dev = dev;
-	lb->link = LINK_ID_LAYERBLEND0 + lb->id;
+	lb->link = LINK_ID_LAYERBLEND0_MX8QXP + lb->id;
 
 	dc_drm->lb[lb->id] = lb;
 
diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
index ffeb1c7af1c9f..866859403a79d 100644
--- a/drivers/gpu/drm/imx/dc/dc-pe.h
+++ b/drivers/gpu/drm/imx/dc/dc-pe.h
@@ -22,17 +22,17 @@
 #define DC_LB_CNT		4
 
 enum dc_link_id {
-	LINK_ID_NONE		= 0x00,
-	LINK_ID_CONSTFRAME0	= 0x0c,
-	LINK_ID_CONSTFRAME4	= 0x0e,
-	LINK_ID_CONSTFRAME1	= 0x10,
-	LINK_ID_CONSTFRAME5	= 0x12,
-	LINK_ID_FETCHWARP2	= 0x14,
-	LINK_ID_FETCHLAYER0	= 0x1a,
-	LINK_ID_LAYERBLEND0	= 0x21,
-	LINK_ID_LAYERBLEND1	= 0x22,
-	LINK_ID_LAYERBLEND2	= 0x23,
-	LINK_ID_LAYERBLEND3	= 0x24,
+	LINK_ID_NONE			= 0x00,
+	LINK_ID_CONSTFRAME0		= 0x0c,
+	LINK_ID_CONSTFRAME4_MX8QXP	= 0x0e,
+	LINK_ID_CONSTFRAME1		= 0x10,
+	LINK_ID_CONSTFRAME5_MX8QXP	= 0x12,
+	LINK_ID_FETCHWARP2		= 0x14,
+	LINK_ID_FETCHLAYER0		= 0x1a,
+	LINK_ID_LAYERBLEND0_MX8QXP	= 0x21,
+	LINK_ID_LAYERBLEND1_MX8QXP	= 0x22,
+	LINK_ID_LAYERBLEND2_MX8QXP	= 0x23,
+	LINK_ID_LAYERBLEND3_MX8QXP	= 0x24,
 };
 
 enum dc_lb_mode {
-- 
2.51.0

