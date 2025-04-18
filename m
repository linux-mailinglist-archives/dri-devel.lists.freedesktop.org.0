Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A964A93DB6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 20:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9558E10E275;
	Fri, 18 Apr 2025 18:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EFBPJQ2q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2C510E26D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 18:47:22 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-39ac56756f6so2174414f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 11:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745002041; x=1745606841; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ei8w6bUfHANaox0PL32x6BeftwKh8Kj3RLUdQReMDp8=;
 b=EFBPJQ2qH+ubXJvt+VNgwpv5jy5iMoJYFd/U9Xx/HoSbyTRZbQUtKS5VK02I/4V0w2
 krnPv7OJMbl4IWXcBFggN7ctZQsLpoyc0qNCmPoOpnDby560KRQ+JqUkQ8fW2rQrivoJ
 Bbx4gWbzRVJvAi8hUPS4jTLTHvSNSINyY55xWWROSgB8RHOPXh03Vg6bF/VvO+1NX5iv
 7zACGa5A9KlawxuTf2JaDJa/HLYidD9TMdGNUuOF6CzMfCiLbMJQFFgSIIKOWKa4R3xB
 CJ586fWcYt78ckyYAo78veEWR3xzbupJWzO68CsYNvLDykn2GpKitrRZProjiBDVsxtz
 DQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745002041; x=1745606841;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ei8w6bUfHANaox0PL32x6BeftwKh8Kj3RLUdQReMDp8=;
 b=f7yDAmuAX0rUUgawk71usUjKKs3wKstRwZc5jEfDr7qgTcqsvUlNiuQwALYcH2BjyU
 XVFhhDQTvh1WtwJKxaRcF1ufYjr7569HgtzcVyk1L1sjGtRz2WYQlga7fRPfFGr7JqQY
 CmmyAZzJ8eoaa/Eks+itwM+OYIT5ISMWY6R8g6TDc3Z6QdNJ1DK7hS0fnd5c7eaYEFRk
 LmSPG9chWC3fG2u2UgvKT3A7SY9XQcTrrhu5Hw6f9YwCWscttFmTedTU8FfgZEsfkd7F
 EQbmO/h8amtDzmOuA22GEflHTkht3Q3mIhO6rDDY/bEjL7zD+txPfjSSIHZnSBNFaom1
 aU+w==
X-Gm-Message-State: AOJu0Yw/k3Ygk9cghLHFE3iiJymUsOiU5cnCUkS8yXk+sZ2qK5LlzCha
 9GssSaUzVDIjed4UQQtldN/HwnvukRsUfiuYZ1l/KqYXg1OPP9iO
X-Gm-Gg: ASbGncumQLRIZYy7N35LJBPfZHsgA6NNtgwHLSabDq1Z5VJpBFzaNDOfgWiDz1gPh52
 hpETFNbEijsfnwrVD1SysWc8jxkgNdD5TwhQVAJc60M8V95PYSoTJIqf0BbLOaeVNrTLCR9n8AF
 GLihxDLdTvUOLJhgPhMR8dnXKZb2JK5vKx1RvDKNUOTROr6LcaJFppMC8K1CBPrkIiDtrlnKD4u
 WbD+gOwBN60VA2UngBheIN+Pz5WHF4XNfXloldcvMOwDtuVeg6OFyP30CtFka/ujwvTl+Jo4wcw
 0olKduBwO5Tl9p9cw977r0bu5QiFVbJdBuz3g7qzhQkjbtNWSk633NzaMe5u4Ks1FQ==
X-Google-Smtp-Source: AGHT+IEd0SaCBi7hB2snXKGsBgEee1XaDZ8uhtWgpdFK0TOc54bIs1m2Tjel+9uZ6IyKwnMvm9eMlg==
X-Received: by 2002:a05:6000:2482:b0:39e:e75b:5cc with SMTP id
 ffacd0b85a97d-39efba4e686mr3132776f8f.16.1745002040570; 
 Fri, 18 Apr 2025 11:47:20 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:36cb:c641:13d7:bd3d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4931b8sm3404336f8f.80.2025.04.18.11.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 11:47:20 -0700 (PDT)
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
Subject: [PATCH v3 10/15] drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY
 frequency calculations
Date: Fri, 18 Apr 2025 19:46:53 +0100
Message-ID: <20250418184658.456398-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Pass the HSFREQ in milli-Hz to the `dphy_init()` callback to improve
precision, especially for the RZ/V2H(P) SoC, where PLL dividers require
high accuracy.

These changes prepare the driver for upcoming RZ/V2H(P) SoC support.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Replaced `unsigned long long` with `u64`
- Replaced *_mhz with *_millihz` in functions

v1->v2:
- No changes
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 564c15b27c31..0204af85fc64 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -33,7 +33,7 @@
 struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
-	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
+	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
@@ -203,8 +203,9 @@ static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
  */
 
 static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
-				    unsigned long hsfreq)
+				    u64 hsfreq_millihz)
 {
+	unsigned long hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, KILO);
 	const struct rzg2l_mipi_dsi_timings *dphy_timings;
 	unsigned int i;
 	u32 dphyctrl0;
@@ -277,6 +278,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
 	unsigned long hsfreq, vclk_rate;
+	u64 hsfreq_millihz;
 	unsigned int bpp;
 	u32 txsetr;
 	u32 clstptsetr;
@@ -305,9 +307,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 */
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
 	vclk_rate = clk_get_rate(dsi->vclk);
-	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
+	hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp * KILO * 1ULL, dsi->lanes);
 
-	ret = dsi->info->dphy_init(dsi, hsfreq);
+	ret = dsi->info->dphy_init(dsi, hsfreq_millihz);
 	if (ret < 0)
 		goto err_phy;
 
@@ -315,6 +317,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
 
+	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, KILO);
 	/*
 	 * Global timings characteristic depends on high speed Clock Frequency
 	 * Currently MIPI DSI-IF just supports maximum FHD@60 with:
@@ -778,7 +781,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	 * mode->clock and format are not available. So initialize DPHY with
 	 * timing parameters for 80Mbps.
 	 */
-	ret = dsi->info->dphy_init(dsi, 80000000);
+	ret = dsi->info->dphy_init(dsi, 80000000ULL * KILO);
 	if (ret < 0)
 		goto err_phy;
 
-- 
2.49.0

