Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3CEA93DB4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 20:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498AF10E26D;
	Fri, 18 Apr 2025 18:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iDivnCdW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E5B10E26D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 18:47:26 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so22040365e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 11:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745002045; x=1745606845; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LZK10fIpQt3eEgqV6/62MrJgTCZh9EpdBMfA0QeBoYo=;
 b=iDivnCdW/teOgnV1tD5oM4st6Ap8C9/fWE7C8BQATWiS5QRWlQq6xVJ8YbQTkX6Vld
 6vhaMS2QOjq918I0169nIUevn9wp/w1uxcmsskkf4g97Bj4SjMoRT5E+CcaNZO5P2Pdz
 Uiz0oY/V7VUGFGNSBWKlazNc+OgQM1ziNLZ2s0KyBR/2tgglROHvMP4k8ItqdWWhuzgX
 0lzEipr6wv0t8HAEdFJt3ovyjVjHjxsdyIB4CkbsRx8oyyWTWpEbit6+fYRM7W1HCaES
 l5u3qI/17s2v7G4hVh0J6qFi1izNwHXAPcne0sb/fwpsFrJcqiNWkB6ohRyQdxDLqZlO
 KaBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745002045; x=1745606845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LZK10fIpQt3eEgqV6/62MrJgTCZh9EpdBMfA0QeBoYo=;
 b=ZWtzuMVTwyX1zX57NBCcmP2oKP6+aCi399zfQbMw27+V1gTCkk5jXF4GUzZgI7qJV8
 gc4N2uXJauBzMHnhdiWRvCmC7zLyBHweMFaduROVi8MUDm99aVlr2sGRfaI2h+Xa2jh8
 o6g9xhzoEPAUXNcmlYA36nRh+o5whhafsKAWDt2d0qdGwIEpeQcRTWD7Im9dvT1eYdrr
 GvILERxTkrCBExepeZo/w6U64UOQOt3MGG9G6rs5XM/1jz/Y5SC5liy04AAbdQK4m3zR
 M7tY2h64CB6uc/VYylEfuTQkVnal67Fdjh54hPsqxAbytRUUcRRefpfopyQoRJYbE7Mn
 Nf4w==
X-Gm-Message-State: AOJu0YxTSAudAozheY0eEBhJlEUxCBXVijlB72WbSjTCggIDFt3FNc9G
 FIXjGE4D/UqnFBGRFWbovr9NqgjoA9fiSDeZ7ZNWV3U8cJnSrJbR
X-Gm-Gg: ASbGnct9IgeJqSkrFVou1t3CEw7PQvsyxFw7my5SmY4UTGI2oAgbMBG77HvKK7fxjQ0
 K+WoUZAIQSeEAr0SLTMgRjWIXuYLFfwRQejyo7rfXmGBxgbcUQn5lq2Vr7uYHsJUvUAYz9CLXFU
 SegLQoXjgICZ6P5viyWD0i1OiXtyS4uVBnyChQIW/pRik07pxmZcsdPRwVc5M7UAYnbDGY2Ty+O
 UApnhDKxhBTTEcbrzdG5uwGBbIt1cfO6AR4O3X+ukkbZrbvMvZsBt3r5guMq/Ic9Kvyo/i9SG8s
 A4RnkoaAW8bgYd356XuY1HYceg03TXVVQHnU0SOoN6C4Fz7M83tpUaifJI/Hz9EYWA==
X-Google-Smtp-Source: AGHT+IHHm2Rf4W+XgZwbMQtlcbTDdWsVjYFloDxnB4gKg21wbOkaMz29/PviKZVIUvl2AR6RV2aAYg==
X-Received: by 2002:a05:600c:3487:b0:43e:a7c9:8d2b with SMTP id
 5b1f17b1804b1-4406abfab7dmr32713165e9.24.1745002045284; 
 Fri, 18 Apr 2025 11:47:25 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:36cb:c641:13d7:bd3d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4931b8sm3404336f8f.80.2025.04.18.11.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 11:47:24 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 13/15] drm: renesas: rz-du: mipi_dsi: Add function pointers
 for configuring VCLK and mode validation
Date: Fri, 18 Apr 2025 19:46:56 +0100
Message-ID: <20250418184658.456398-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
v2->v3:
- Replaced unsigned long long with u64

v1->v2:
- No changes
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 59 +++++++++++++------
 1 file changed, 42 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index c3bd3b21dd15..67520bb21dad 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -37,6 +37,10 @@ struct rzg2l_mipi_dsi_hw_info {
 	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
 	void (*dphy_late_init)(struct rzg2l_mipi_dsi *dsi);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
+	int (*dphy_conf_clks)(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
+			      u64 *hsfreq_millihz);
+	unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
+					    unsigned long mode_freq);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
 	unsigned long max_dclk;
@@ -276,12 +280,36 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
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
+	*hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp * KILO * 1ULL,
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
@@ -295,21 +323,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
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
-	hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp * KILO * 1ULL, dsi->lanes);
+	ret = dsi->info->dphy_conf_clks(dsi, mode->clock, &hsfreq_millihz);
+	if (ret < 0)
+		goto err_phy;
 
 	ret = dsi->info->dphy_init(dsi, hsfreq_millihz);
 	if (ret < 0)
@@ -616,6 +632,14 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
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
 
@@ -835,6 +859,7 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.dphy_init = rzg2l_mipi_dsi_dphy_init,
 	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
+	.dphy_conf_clks = rzg2l_dphy_conf_clks,
 	.link_reg_offset = 0x10000,
 	.max_dclk = 148500,
 	.min_dclk = 5803,
-- 
2.49.0

