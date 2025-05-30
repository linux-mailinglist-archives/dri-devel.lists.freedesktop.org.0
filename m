Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FA2AC9428
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 18:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C3110E86C;
	Fri, 30 May 2025 16:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OBBbTXDm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCC410E818
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:59:22 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-450cfb6a794so12949325e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 09:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748624361; x=1749229161; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=53a6EE9nbnZeGvbpsTgBtcSF6DIb/DdGkT1QIK8MVG0=;
 b=OBBbTXDmUZbHEOwi+dYcqtuEx5LVjYCqTs/xyPvX11ooI9x600zqBdRapkyRyQYBnf
 2zwL5lfPjLSpKWO/GMdrH/ppkuHnOyWv4Am0PjKjGYTZ3gvMcnTOMF4H6nOgLn4Wvtju
 Vuo5dRKlnG5jvE8TLJeNjMZnYq/Yr8DDY/Fl07DFES3+bU/LiHwCMvdtjhh2bRB2dEgY
 86sI9K/UelDG/dpJR61xQpH/eqBnGWimmHEiYvLDa9v5Y7b+d9Pe0idA0BR7HoSUsO1Q
 FQTRb8TxeVTaLp+GlYihfki6hzcCLwMUBWSVI6Ar7gOc0TbYPdGtQwVXtjg1l2VJr6mX
 5tMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748624361; x=1749229161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=53a6EE9nbnZeGvbpsTgBtcSF6DIb/DdGkT1QIK8MVG0=;
 b=jD3jtfDx+F1aTecDs/STnyH4ONbG5bAocEO50Xl1xnNV8NV4/P5VCykc+3980yzROQ
 +ISDJ6amIfK5xJwOeX0trWhdj3753bzK7cd6ed4o10U2jqvLTjJMKlB0ZS3ON5uJ6ZG/
 nzOXYcr6XYihePqWE5IUdJNCKHWq67ZLQGm1qgGBGl/ChuSRGc1QSrgiW2hi4fr5P4nx
 7vxtsj+4hoLKbDW3ow8Dgvw+OcMBJkgZDmgiGx42IQexdK6GZhrBe4Tn2mWGJ4thx4MC
 zzG8Y1fo4vsrbJ+f6WwTOPW3AwwG3gBVv/WR5p8Y8h81/CsNEkmBSYdwrvpdRysMnuEG
 1now==
X-Gm-Message-State: AOJu0Yxzm7OCpQl/0OC4YtvaHKzqACGy40hRQa4h3fMo8ggnkwtOVrN7
 pJyp2EYtV+ZLGG9hhG5XvDzbCN90SR2nXGPMCMCJYWscPhxkXiPaXNKf
X-Gm-Gg: ASbGnctgHedjtoMGdOQXHaqoPFIYKiiyhN8yPjIymoK4HU9Jt1lyS+lSAQvB7IXTMrk
 HqgGR5WtkoR86zwry6J2pQiHdm3yw1vOhr8GK1WXQpwgLMyyr9wn0LQagXHWl971oGNMKlhQLjO
 0McMQFC1LT8SmP8QzWSY2UFqMAdUDxrwbLcLf6HCRCFNd9NjqmMbfb1R5E5496twxHAhR0WGFtC
 946pe8rqe5fW88QOjz06pM0u0az4y5HJzyViFgutIF8bSCUHH4ocphTstRrQtd0MS9Dvj0z4uRz
 U0FKVDxpvRXU6c8XV7t90hO92JuEkRvZA/0EUVUZ0Jq+scUzKLxLBFEFjJmP0D2yTQAUPLaLr4u
 CV/++f7pbDQ==
X-Google-Smtp-Source: AGHT+IFPRhpgt3qPxqJVPfnpBQeTkaN8+oiBWp/bmUKW1jnbX/PcMfMQy4r2p5CTyqNDjyPLfAnvpw==
X-Received: by 2002:a05:600c:8207:b0:43c:f0ae:da7 with SMTP id
 5b1f17b1804b1-450d64c31b3mr39434305e9.7.1748624360971; 
 Fri, 30 May 2025 09:59:20 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7f9efa3sm22733455e9.9.2025.05.30.09.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 09:59:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 08/12] drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY
 frequency calculations
Date: Fri, 30 May 2025 17:59:02 +0100
Message-ID: <20250530165906.411144-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Pass the HSFREQ in milli-Hz to the `dphy_init()` callback to improve
precision, especially for the RZ/V2H(P) SoC, where PLL dividers require
high accuracy.

These changes prepare the driver for upcoming RZ/V2H(P) SoC support.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
- No changes

v4->v5:
- Added Reviewed tag from Biju

v3->v4:
- Used MILLI instead of KILO
- Made use of mul_u32_u32() for multiplication

v2->v3:
- Replaced `unsigned long long` with `u64`
- Replaced *_mhz with *_millihz` in functions

v1->v2:
- No changes
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 0e0659dfe5a5..fd5d4551f39d 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -31,7 +31,7 @@
 struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
-	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
+	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
@@ -200,8 +200,9 @@ static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
  */
 
 static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
-				    unsigned long hsfreq)
+				    u64 hsfreq_millihz)
 {
+	unsigned long hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
 	const struct rzg2l_mipi_dsi_timings *dphy_timings;
 	unsigned int i;
 	u32 dphyctrl0;
@@ -274,6 +275,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
 	unsigned long hsfreq, vclk_rate;
+	u64 hsfreq_millihz;
 	unsigned int bpp;
 	u32 txsetr;
 	u32 clstptsetr;
@@ -305,9 +307,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	if (vclk_rate != mode->clock * KILO)
 		dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
 			mode->clock * KILO, vclk_rate);
-	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
+	hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(vclk_rate, bpp * MILLI), dsi->lanes);
 
-	ret = dsi->info->dphy_init(dsi, hsfreq);
+	ret = dsi->info->dphy_init(dsi, hsfreq_millihz);
 	if (ret < 0)
 		goto err_phy;
 
@@ -315,6 +317,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
 
+	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
 	/*
 	 * Global timings characteristic depends on high speed Clock Frequency
 	 * Currently MIPI DSI-IF just supports maximum FHD@60 with:
@@ -777,7 +780,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	 * mode->clock and format are not available. So initialize DPHY with
 	 * timing parameters for 80Mbps.
 	 */
-	ret = dsi->info->dphy_init(dsi, 80000000);
+	ret = dsi->info->dphy_init(dsi, 80000000ULL * MILLI);
 	if (ret < 0)
 		goto err_phy;
 
-- 
2.49.0

