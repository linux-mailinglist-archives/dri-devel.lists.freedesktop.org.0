Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1382AC9421
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 18:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BF410E838;
	Fri, 30 May 2025 16:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WbNwdiex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 564B610E85D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:59:26 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-450cf0025c0so16147285e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 09:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748624365; x=1749229165; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=czB6m6EtLdQlv5DoV5KDu4jRB7A8Vse69Ln6ndrljSE=;
 b=WbNwdiexOMhH7WGn6iRcK9lP5JxVoIbOTPIazVctPruhU4YxLakJmyPlTTzS+RAwch
 6gUdkz9EveUl/IqewCjYRPjH5+DHCm7v4wIytPmyHUE3oWkFH0dCScjj1aUvhOC5g2Js
 zEK9ghDTlzoYh8DjOpZEFQSTgC9BTJDuJZKWhqIRKH7wVdpQE3MGwm5k1QB280ryHJi1
 SiFZ+R35bOyIDHU9xvw2GZ9wPphDhfzEfxHqWrgmFM5uPy2vSigz79jrr6Y1RSjqoRot
 2h1Zm3veEpIzgFJH75IRulBokCk23LoFajd1dPTKtCH1yBGhRGh9ML07ePs06RVT9pWb
 XPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748624365; x=1749229165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=czB6m6EtLdQlv5DoV5KDu4jRB7A8Vse69Ln6ndrljSE=;
 b=XDag/DQ4Kv4ORDs7EQ/JEnCbwctL6+t+t55sZoowMXFuqKvpmomCQyknLMCTNaDMxe
 pKd3YC/5rKQdyAtGp7Bx6mwNuWA5e2lxOMnp48mQM0xUHhk032c9FcP42AREq9iWnLfh
 Sj4GUXY5f9sN3lDU/NIqLiA4bmTwADVEPSEe0vczZSvNnZOtG7BnzCe1tOvLPRnQWQLy
 iWP8Jh865ioS/YPIr4pLjqaQ6Uh4u3uufRe7+uwRRfw+u18IyHx4xQzm3P7rDR/WW2YG
 InEcw6FZ407qJwqwzLDOYLDh2AifAFJRlsKYfgG0Xa5YCVQ5C4L3W6RvzVuy6dZLICCK
 u2Vg==
X-Gm-Message-State: AOJu0YxnyKctVEjCYysCZxXJEQaVjOqXuCa1zIpvDEofRGwG3WkOxycL
 BsJZIdDzjTG2LxIZMYxl6Z+vPTRBamY8Izpec6+IuVw7QxGndzWNxkk0
X-Gm-Gg: ASbGncsTyL800nSWJnyfiEX7Slw93coj9t2hl6IShUh1c5TdoRBD6INuYk0vd6f0g0B
 dRw05IakV21opqQiSAkFbzOfTXxHyMtxC/c4Fx0UmgxigxHXUydq7Z+eEOsMIiUKTQ6ic71Fj1+
 5bXEAQPbBZGPh4NscP4prMAdmSNYPpqDh8CBspd3RmJgBN0rGwpjv3J0CRMzfJN7b5QgvK9QvmB
 V+SN9yF/lYH0mRTO9svxMXhpr5nSn0Jb38Tt4oXsZyNq4w/tRfU9RPqnx8ducR0GYorSG2hkB3+
 PnYtrjw/WnujBRdm8HWVXNqG1hzm+nq3+RWUoSn8p7iFrYhjtUQ3kNz+n5o8lvydfmoSTCSOfu5
 KmccI3NOq1g==
X-Google-Smtp-Source: AGHT+IGX8mJ3YqSYlctQJJSixabnYIPst1erP0Pr+Omg9jid3KHGvgM0EyAy9NIVnCq21k7743kw/g==
X-Received: by 2002:a05:600c:1d98:b0:43c:f44c:72a6 with SMTP id
 5b1f17b1804b1-450d651b757mr41521575e9.2.1748624364583; 
 Fri, 30 May 2025 09:59:24 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7f9efa3sm22733455e9.9.2025.05.30.09.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 09:59:23 -0700 (PDT)
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
Subject: [PATCH v6 11/12] drm: renesas: rz-du: mipi_dsi: Add function pointers
 for configuring VCLK and mode validation
Date: Fri, 30 May 2025 17:59:05 +0100
Message-ID: <20250530165906.411144-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Introduce `dphy_conf_clks` and `dphy_mode_clk_check` callbacks in
`rzg2l_mipi_dsi_hw_info` to configure the VCLK and validate
supported display modes.

On the RZ/V2H(P) SoC, the DSI PLL dividers need to be as accurate as
possible. To ensure compatibility with both RZ/G2L and RZ/V2H(P) SoCs,
function pointers are introduced.

Modify `rzg2l_mipi_dsi_startup()` to use `dphy_conf_clks` for clock
configuration and `rzg2l_mipi_dsi_bridge_mode_valid()` to invoke
`dphy_mode_clk_check` for mode validation.

This change ensures proper operation across different SoC variants
by allowing fine-grained control over clock configuration and mode
validation.

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
- Replaced KILO with MILLI

v2->v3:
- Replaced unsigned long long with u64

v1->v2:
- No changes
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 65 +++++++++++++------
 1 file changed, 45 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index ebbc6ac45484..f9f2d883c40d 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -36,6 +36,10 @@ struct rzg2l_mipi_dsi_hw_info {
 	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
 	void (*dphy_startup_late_init)(struct rzg2l_mipi_dsi *dsi);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
+	int (*dphy_conf_clks)(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
+			      u64 *hsfreq_millihz);
+	unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
+					    unsigned long mode_freq);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
 	unsigned long min_dclk;
@@ -275,12 +279,39 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
 	reset_control_assert(dsi->rstc);
 }
 
+static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
+				u64 *hsfreq_millihz)
+{
+	unsigned long vclk_rate;
+	unsigned int bpp;
+
+	clk_set_rate(dsi->vclk, mode_freq * KILO);
+	/*
+	 * Relationship between hsclk and vclk must follow
+	 * vclk * bpp = hsclk * 8 * lanes
+	 * where vclk: video clock (Hz)
+	 *       bpp: video pixel bit depth
+	 *       hsclk: DSI HS Byte clock frequency (Hz)
+	 *       lanes: number of data lanes
+	 *
+	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
+	 */
+	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
+	vclk_rate = clk_get_rate(dsi->vclk);
+	if (vclk_rate != mode_freq * KILO)
+		dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
+			mode_freq * KILO, vclk_rate);
+	*hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(vclk_rate, bpp * MILLI),
+						dsi->lanes);
+
+	return 0;
+}
+
 static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
-	unsigned long hsfreq, vclk_rate;
+	unsigned long hsfreq;
 	u64 hsfreq_millihz;
-	unsigned int bpp;
 	u32 txsetr;
 	u32 clstptsetr;
 	u32 lptrnstsetr;
@@ -294,24 +325,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	if (ret < 0)
 		return ret;
 
-	clk_set_rate(dsi->vclk, mode->clock * KILO);
-
-	/*
-	 * Relationship between hsclk and vclk must follow
-	 * vclk * bpp = hsclk * 8 * lanes
-	 * where vclk: video clock (Hz)
-	 *       bpp: video pixel bit depth
-	 *       hsclk: DSI HS Byte clock frequency (Hz)
-	 *       lanes: number of data lanes
-	 *
-	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
-	 */
-	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-	vclk_rate = clk_get_rate(dsi->vclk);
-	if (vclk_rate != mode->clock * KILO)
-		dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
-			mode->clock * KILO, vclk_rate);
-	hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(vclk_rate, bpp * MILLI), dsi->lanes);
+	ret = dsi->info->dphy_conf_clks(dsi, mode->clock, &hsfreq_millihz);
+	if (ret < 0)
+		goto err_phy;
 
 	ret = dsi->info->dphy_init(dsi, hsfreq_millihz);
 	if (ret < 0)
@@ -619,6 +635,14 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->clock < dsi->info->min_dclk)
 		return MODE_CLOCK_LOW;
 
+	if (dsi->info->dphy_mode_clk_check) {
+		enum drm_mode_status status;
+
+		status = dsi->info->dphy_mode_clk_check(dsi, mode->clock);
+		if (status != MODE_OK)
+			return status;
+	}
+
 	return MODE_OK;
 }
 
@@ -836,6 +860,7 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.dphy_init = rzg2l_mipi_dsi_dphy_init,
 	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
+	.dphy_conf_clks = rzg2l_dphy_conf_clks,
 	.link_reg_offset = 0x10000,
 	.min_dclk = 5803,
 	.max_dclk = 148500,
-- 
2.49.0

