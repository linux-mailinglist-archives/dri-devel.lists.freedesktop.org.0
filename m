Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6EFBB93A6
	for <lists+dri-devel@lfdr.de>; Sun, 05 Oct 2025 05:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C3610E26A;
	Sun,  5 Oct 2025 03:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="sXEJUanI";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="unE+kw/Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E67810E26A
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 03:04:37 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cfS1H5fHBz9tPT;
 Sun,  5 Oct 2025 05:04:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1759633475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3miEzVqF6353RgBxUaCTYLw2t2UJyNlTfla0bvsvGK8=;
 b=sXEJUanIWb/PFgveHbVxDbroMHXlnC+6P5sEOBnLl9kq9pmsLjs1PGfRlYIhdMiWkGQZWf
 SuF9Yb3LuU/u4aR8CgsuRpARSqjk2Zt4xi9VF9fxjJF/3yyA0GyFcp+TyeLa6WAmleCEqG
 7MwR4du01R1muKfW7k2+IeAEWyCIrzuEIjLxADRO51cjAyiMEYMt41cNdNGKUYrXRGGKyn
 bIBUsF8SdjWuNYZOJZ3D4woxA4bv1ZNZG/ouBMCFHL8L+xu4w89CH3WU0FWvTgNPBbKsFo
 9r0DLND3RJjycLInRVhi3rORWwMwZnrDzBFzyE0YDee42/2YaBNhyWTUQtO4ww==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="unE+kw/Z";
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1759633473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3miEzVqF6353RgBxUaCTYLw2t2UJyNlTfla0bvsvGK8=;
 b=unE+kw/ZnMMko2WcpMpfu8aMT80HfUQ90hYZK29hdmblop1agnxdpzxxfuiho2uDQqzpOF
 eOiwG79wqrjLd45ugzuJYn1goVrZQQ1k7z/j+0IP/xheVizdDf2bMVruUruorHu4ZvB/jk
 Ca7Pnjh9PIbttqEGn1cw/V+vZoQLPCP6qD8oP4N5V6u2glcJnbTrQIaWY9fvr2Bcp0jpoX
 N682lCZBVaqQLI1TVVaLPa0xdZxD99OJ37jtRTTlkUfLSSuwf57bgnMiwdpudwGQkgCk3T
 flREKILHrPJ8EwwLQbILXyOCuDg5fcmwaJWGCeOIywNJ/VXHCUW0ypeGc34OvQ==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 05/11] drm/rcar-du: dsi: Clean up VCLKSET register macros
Date: Sun,  5 Oct 2025 05:02:52 +0200
Message-ID: <20251005030355.202242-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ise4gyt93h6umqfsqrxws8e8diy9b17x
X-MBO-RS-ID: b8fde5d0a0e4172564d
X-Rspamd-Queue-Id: 4cfS1H5fHBz9tPT
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

Introduce VCLKSET_BPP_MASK macro and use FIELD_PREP() to generate
appropriate bitfield from mask and value without bitshift. Remove
VCLKSET_COLOR_RGB which is never used, replace it with code comment.

Do not convert bits and bitfields to BIT() and GENMASK() yet, to be
consisten with the current style. Conversion to BIT() and GENMASK()
macros is done at the very end of this series in the last two patches.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
NOTE: No functional change expected, this is a preparatory patch which
partly removes macros which evaluate to zeroes from rcar_mipi_dsi_regs.h .
The other patches in this series proceed with that job, piece by piece,
to make it all reviewable.
---
V2: Move FIELD_PREP() back into rcar_mipi_dsi_regs.h
V3: Include linux/bitfield.h which contains the FIELD_PREP() macro
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c      |  4 +++-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 12 ++++++------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index e13249e0134b4..f6427476feb72 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2020 Renesas Electronics Corporation
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -624,6 +625,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 	vclkset = VCLKSET_CKEN;
 	rcar_mipi_dsi_write(dsi, VCLKSET, vclkset);
 
+	/* Output is always RGB, never YCbCr */
 	if (dsi_format == 24)
 		vclkset |= VCLKSET_BPP_24;
 	else if (dsi_format == 18)
@@ -635,7 +637,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 		return -EINVAL;
 	}
 
-	vclkset |= VCLKSET_COLOR_RGB | VCLKSET_LANE(dsi->lanes - 1);
+	vclkset |= VCLKSET_LANE(dsi->lanes - 1);
 
 	switch (dsi->info->model) {
 	case RCAR_DSI_V3U:
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index 90e8e3de3e580..468f84cd1325e 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -246,14 +246,14 @@
 
 #define VCLKSET				0x100c
 #define VCLKSET_CKEN			(1 << 16)
-#define VCLKSET_COLOR_RGB		(0 << 8)
-#define VCLKSET_COLOR_YCC		(1 << 8)
+#define VCLKSET_COLOR_YCC		(1 << 8) /* 0:RGB 1:YCbCr */
 #define VCLKSET_DIV_V3U(x)		(((x) & 0x3) << 4)
 #define VCLKSET_DIV_V4H(x)		(((x) & 0x7) << 4)
-#define VCLKSET_BPP_16			(0 << 2)
-#define VCLKSET_BPP_18			(1 << 2)
-#define VCLKSET_BPP_18L			(2 << 2)
-#define VCLKSET_BPP_24			(3 << 2)
+#define VCLKSET_BPP_MASK		(3 << 2)
+#define VCLKSET_BPP_16			FIELD_PREP(VCLKSET_BPP_MASK, 0)
+#define VCLKSET_BPP_18			FIELD_PREP(VCLKSET_BPP_MASK, 1)
+#define VCLKSET_BPP_18L			FIELD_PREP(VCLKSET_BPP_MASK, 2)
+#define VCLKSET_BPP_24			FIELD_PREP(VCLKSET_BPP_MASK, 3)
 #define VCLKSET_LANE(x)			(((x) & 0x3) << 0)
 
 #define VCLKEN				0x1010
-- 
2.51.0

