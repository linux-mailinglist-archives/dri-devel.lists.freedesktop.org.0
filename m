Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 422F2BCF904
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A45A10E326;
	Sat, 11 Oct 2025 17:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="VnSSjRcm";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TRQ1dVXw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C51B10E318
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:03:31 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ckVLV1JRhz9tcl;
 Sat, 11 Oct 2025 19:03:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CGpHHm2OeNWbay+N+pcaQg7MpMSzJBS+4pVVXcixzcw=;
 b=VnSSjRcmgGIhqXhbc7qPXfkAN4n2MXhE2lwZJp7nR8O7AuWUUhzdkfLnoDXc3X/u/EaU7B
 c2diLqN8JJFyTlhxarf7KZR0KYZGpScgZhCL8wdkmspkQKrtAcx+KzHBLCz8RcZwF+AknH
 vcXtHLy+eeWlih7+DbQwaF/S9G1/KxAb79Za6vWCKWQy8KmLao767mkugMV1KGMje4BUVo
 P1cPhpjbQsjfPGNWyv+b7Ep34z8PQKdx6q/k4wbMPhcDuXvgupw/z+OKMrsYalsP53HEPL
 Xw+/qX7XN0DRkVzFTJlu2ArHf89jsLNjjW/BOx90YLd4FWpWj5S2Vc/6JzEXxg==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CGpHHm2OeNWbay+N+pcaQg7MpMSzJBS+4pVVXcixzcw=;
 b=TRQ1dVXwGLw6e/iUz+yvQqNXdSC9E/jUJDSkp87p2jy4p6qp6wycjPP0M4P/waEFOtW/+R
 gXc1N3huVsnl1KF4lQ1y/qT4ozjFKOpzKAqCDIYgC1anOLZ+2Cu1thA6bJgwoeT/H+bMEV
 hKW5df3kzbQdl1nj5pOm2Zkwgh4m9qavI7UnvLRnS+zG+cy0ewIOccGSxN6oGrDle67DBf
 vpGvBuW8yiaOljxYsd5lOriZ0QbIY+PNiQXPnokkuUWob7jKHxbHZkZ/hM+TRkygdcr3ZX
 X1HtRrfXDEZwTjlUhTCxX0+PZfhrXs/3HqqVFWWVdNAViaPxRYdGoAAuaO1O7w==
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
Subject: [PATCH 13/39] drm/imx: dc: fu: Describe remaining register offsets
Date: Sat, 11 Oct 2025 18:51:28 +0200
Message-ID: <20251011170213.128907-14-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: j5x9ripwfyxub95z31izjnabtfprmzk6
X-MBO-RS-ID: 295e7d99a9ae9ac8446
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

Describe the rest of register offsets in struct dc_fu { } and
use them throughout the driver. This is a preparatory change
for i.MX95 addition. No functional change.

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
 drivers/gpu/drm/imx/dc/dc-fl.c | 12 ++++++++----
 drivers/gpu/drm/imx/dc/dc-fu.c |  6 +++---
 drivers/gpu/drm/imx/dc/dc-fu.h |  4 ++++
 drivers/gpu/drm/imx/dc/dc-fw.c | 10 +++++++---
 4 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-fl.c b/drivers/gpu/drm/imx/dc/dc-fl.c
index d4e746f8c4297..8571871c6a683 100644
--- a/drivers/gpu/drm/imx/dc/dc-fl.c
+++ b/drivers/gpu/drm/imx/dc/dc-fl.c
@@ -63,20 +63,20 @@ static void dc_fl_set_fmt(struct dc_fu *fu, enum dc_fu_frac frac,
 
 	dc_fu_set_src_bpp(fu, frac, format->cpp[0] * 8);
 
-	regmap_write_bits(fu->reg_cfg, LAYERPROPERTY(frac),
+	regmap_write_bits(fu->reg_cfg, fu->reg_layerproperty[frac],
 			  YUVCONVERSIONMODE_MASK,
 			  YUVCONVERSIONMODE(YUVCONVERSIONMODE_OFF));
 
 	dc_fu_get_pixel_format_bits(fu, format->format, &bits);
 	dc_fu_get_pixel_format_shifts(fu, format->format, &shifts);
 
-	regmap_write(fu->reg_cfg, COLORCOMPONENTBITS(frac), bits);
-	regmap_write(fu->reg_cfg, COLORCOMPONENTSHIFT(frac), shifts);
+	regmap_write(fu->reg_cfg, fu->reg_colorcomponentbits[frac], bits);
+	regmap_write(fu->reg_cfg, fu->reg_colorcomponentshift[frac], shifts);
 }
 
 static void dc_fl_set_framedimensions(struct dc_fu *fu, int w, int h)
 {
-	regmap_write(fu->reg_cfg, FRAMEDIMENSIONS,
+	regmap_write(fu->reg_cfg, fu->reg_framedimensions,
 		     FRAMEWIDTH(w) | FRAMEHEIGHT(h));
 }
 
@@ -133,12 +133,16 @@ static int dc_fl_bind(struct device *dev, struct device *master, void *data)
 		fu->reg_baseaddr[i]		  = BASEADDRESS(i);
 		fu->reg_sourcebufferattributes[i] = SOURCEBUFFERATTRIBUTES(i);
 		fu->reg_sourcebufferdimension[i]  = SOURCEBUFFERDIMENSION(i);
+		fu->reg_colorcomponentbits[i]     = COLORCOMPONENTBITS(i);
+		fu->reg_colorcomponentshift[i]    = COLORCOMPONENTSHIFT(i);
 		fu->reg_layeroffset[i]		  = LAYEROFFSET(i);
 		fu->reg_clipwindowoffset[i]	  = CLIPWINDOWOFFSET(i);
 		fu->reg_clipwindowdimensions[i]	  = CLIPWINDOWDIMENSIONS(i);
 		fu->reg_constantcolor[i]	  = CONSTANTCOLOR(i);
 		fu->reg_layerproperty[i]	  = LAYERPROPERTY(i);
 	}
+	fu->reg_burstbuffermanagement = BURSTBUFFERMANAGEMENT;
+	fu->reg_framedimensions = FRAMEDIMENSIONS;
 	snprintf(fu->name, sizeof(fu->name), "FetchLayer%d", id);
 
 	dc_fl_set_ops(fu);
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
index f94c591c81589..cc8b0d05891fd 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.c
+++ b/drivers/gpu/drm/imx/dc/dc-fu.c
@@ -113,13 +113,13 @@ void dc_fu_shdldreq_sticky(struct dc_fu *fu, u8 layer_mask)
 
 static inline void dc_fu_set_linemode(struct dc_fu *fu, enum dc_linemode mode)
 {
-	regmap_write_bits(fu->reg_cfg, BURSTBUFFERMANAGEMENT, LINEMODE_MASK,
+	regmap_write_bits(fu->reg_cfg, fu->reg_burstbuffermanagement, LINEMODE_MASK,
 			  mode);
 }
 
 static inline void dc_fu_set_numbuffers(struct dc_fu *fu, unsigned int num)
 {
-	regmap_write_bits(fu->reg_cfg, BURSTBUFFERMANAGEMENT,
+	regmap_write_bits(fu->reg_cfg, fu->reg_burstbuffermanagement,
 			  SETNUMBUFFERS_MASK, SETNUMBUFFERS(num));
 }
 
@@ -132,7 +132,7 @@ static void dc_fu_set_burstlength(struct dc_fu *fu, dma_addr_t baddr)
 	burst_size = min(burst_size, 128U);
 	burst_length = burst_size / 8;
 
-	regmap_write_bits(fu->reg_cfg, BURSTBUFFERMANAGEMENT,
+	regmap_write_bits(fu->reg_cfg, fu->reg_burstbuffermanagement,
 			  SETBURSTLENGTH_MASK, SETBURSTLENGTH(burst_length));
 }
 
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
index e016e1ea5b4e0..2a330c0abf6a1 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.h
+++ b/drivers/gpu/drm/imx/dc/dc-fu.h
@@ -105,11 +105,15 @@ struct dc_fu {
 	u32 reg_baseaddr[DC_FETCHUNIT_FRAC_NUM];
 	u32 reg_sourcebufferattributes[DC_FETCHUNIT_FRAC_NUM];
 	u32 reg_sourcebufferdimension[DC_FETCHUNIT_FRAC_NUM];
+	u32 reg_colorcomponentbits[DC_FETCHUNIT_FRAC_NUM];
+	u32 reg_colorcomponentshift[DC_FETCHUNIT_FRAC_NUM];
 	u32 reg_layeroffset[DC_FETCHUNIT_FRAC_NUM];
 	u32 reg_clipwindowoffset[DC_FETCHUNIT_FRAC_NUM];
 	u32 reg_clipwindowdimensions[DC_FETCHUNIT_FRAC_NUM];
 	u32 reg_constantcolor[DC_FETCHUNIT_FRAC_NUM];
 	u32 reg_layerproperty[DC_FETCHUNIT_FRAC_NUM];
+	u32 reg_burstbuffermanagement;
+	u32 reg_framedimensions;
 	unsigned int id;
 	enum dc_link_id link_id;
 	struct dc_fu_ops ops;
diff --git a/drivers/gpu/drm/imx/dc/dc-fw.c b/drivers/gpu/drm/imx/dc/dc-fw.c
index c1131b7b17c2f..dc036121f0d23 100644
--- a/drivers/gpu/drm/imx/dc/dc-fw.c
+++ b/drivers/gpu/drm/imx/dc/dc-fw.c
@@ -91,15 +91,15 @@ static void dc_fw_set_fmt(struct dc_fu *fu, enum dc_fu_frac frac,
 	regmap_write_bits(fu->reg_cfg, CONTROL, RASTERMODE_MASK,
 			  RASTERMODE(RASTERMODE_NORMAL));
 
-	regmap_write_bits(fu->reg_cfg, LAYERPROPERTY(frac),
+	regmap_write_bits(fu->reg_cfg, fu->reg_layerproperty[frac],
 			  YUVCONVERSIONMODE_MASK,
 			  YUVCONVERSIONMODE(YUVCONVERSIONMODE_OFF));
 
 	dc_fu_get_pixel_format_bits(fu, format->format, &bits);
 	dc_fu_get_pixel_format_shifts(fu, format->format, &shifts);
 
-	regmap_write(fu->reg_cfg, COLORCOMPONENTBITS(frac), bits);
-	regmap_write(fu->reg_cfg, COLORCOMPONENTSHIFT(frac), shifts);
+	regmap_write(fu->reg_cfg, fu->reg_colorcomponentbits[frac], bits);
+	regmap_write(fu->reg_cfg, fu->reg_colorcomponentshift[frac], shifts);
 }
 
 static void dc_fw_set_framedimensions(struct dc_fu *fu, int w, int h)
@@ -170,12 +170,16 @@ static int dc_fw_bind(struct device *dev, struct device *master, void *data)
 		fu->reg_baseaddr[i]		  = BASEADDRESS(i);
 		fu->reg_sourcebufferattributes[i] = SOURCEBUFFERATTRIBUTES(i);
 		fu->reg_sourcebufferdimension[i]  = SOURCEBUFFERDIMENSION(i);
+		fu->reg_colorcomponentbits[i]     = COLORCOMPONENTBITS(i);
+		fu->reg_colorcomponentshift[i]    = COLORCOMPONENTSHIFT(i);
 		fu->reg_layeroffset[i]		  = LAYEROFFSET(i);
 		fu->reg_clipwindowoffset[i]	  = CLIPWINDOWOFFSET(i);
 		fu->reg_clipwindowdimensions[i]	  = CLIPWINDOWDIMENSIONS(i);
 		fu->reg_constantcolor[i]	  = CONSTANTCOLOR(i);
 		fu->reg_layerproperty[i]	  = LAYERPROPERTY(i);
 	}
+	fu->reg_burstbuffermanagement = BURSTBUFFERMANAGEMENT;
+	fu->reg_framedimensions = FRAMEDIMENSIONS;
 	snprintf(fu->name, sizeof(fu->name), "FetchWarp%d", id);
 
 	dc_fw_set_ops(fu);
-- 
2.51.0

