Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB721AA55BA
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 22:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A7D710E758;
	Wed, 30 Apr 2025 20:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fULscWHn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9AF010E33C
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 20:41:36 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-39c14016868so292632f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746045695; x=1746650495; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AO0gGQ8XJg55vakvgacq+nstPR//vJTN3SM+V+tV6y8=;
 b=fULscWHnJrfIfTzgy7wRiedKgoGELlDT9GgwigZA2ErcqiBvo9bYKtscuzlhqfI/pP
 JzprhV9Kq1ozKSybc3BUNanSmryRRFY8gZZBxanCx2Ugsdw7d6B7yXSMH0IRfJDsXiEc
 GkrKlPZuus20TuaxlcsY3m7vAMKu3stYjRoH2Hf9GZdTNU8NfT4V+0htgb5Lm3irdBBk
 xLHMkOZ1PWc9XdRKDBwjno0CPfZhnEfX8hmrOFGx80sfqQdewXyeaq0bBWg+JCuddPn4
 0HksUhWwFRkChfmQtRBk13vVjt5WHNRVJPPhHqghn4LwZ6qV5Z5dREqDvKjYfTvWhhjR
 ewJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746045695; x=1746650495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AO0gGQ8XJg55vakvgacq+nstPR//vJTN3SM+V+tV6y8=;
 b=rvI8St2TavAYtRux+cgAivMU4ugRLOOFhQZLvbqy5gJis6K1OQjXzJnoOhft1KeVxi
 EcYNCIZ5vmc/np2ypbBJGp2qxAL8T0e9DGTnwJ5AUxa2yc3NB/SS8an2Tm/paM+5WFS7
 0ThpRWhuOBp1MvUOrzrOuq0cev+dOI46OAitBoepw8AqSEuUexFWnHKD553tEHU4Hkr+
 lVLnsWP+saX7LwUKgGyWEvzMY42yqyDXpJEHYXqFJiDZIxUrtfP5hhM0XRFPu3alGKM5
 FXeoRhg/zrgw/X4rZFUohu0XdRcSjGM7filv11llBzrncoaUYWn5mrR+PyeQIvLJt8lb
 bl5w==
X-Gm-Message-State: AOJu0YzZ3wf5vdp/X5Qi/Z3FwepB1Fp9LzqXlWSwF9T1PqRohogoscUt
 TPmcWYlUwwB0fCSHCrkqtTbFhwuZfHZ1hiwgjhUsNRYOpZP9fnAz
X-Gm-Gg: ASbGncttkUtOrdiAorw1OKNis2pb6CDCsmkJ/KaxxsBt1KjiGnLyHZZ8K6cC2GS5/k0
 7KI2mfkYzm6Zum/KkVN6hypJ4orUCTtkxyn6z8qVJ0Ay/GRKBikmYJPyst+30oZBlSaaMl4xMK+
 k8rNhNKy1+zFz3otGWY64DYWimHXG2syHt3TEUJukwnUFsdNirijxGCuoz1ESSZxeVK+dqY0TGr
 QYPpdYVO+85JIQX6PHRIrU/uQAfNmwoES+Hp+57bnbmZ5RqS+ISTQFKgj3QgZgxaBsbii1QJZ3p
 a4ktMGCzrQy25F3wPRfaLesnfOGqjf6KulbHsqF0aVzrVWgPSDIgGVgc4PgbFCJh2D5IiOE/VpH
 dZEeMYds22w==
X-Google-Smtp-Source: AGHT+IHsecdyrGlNtI82mqkkhJLEKR/PshNRP/65SFVobBGuVGxd9oW8pr0BSn7ldq8EinhadMpN0g==
X-Received: by 2002:a05:6000:2284:b0:3a0:830a:3d63 with SMTP id
 ffacd0b85a97d-3a08f753ce9mr4332262f8f.9.1746045695308; 
 Wed, 30 Apr 2025 13:41:35 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca56d5sm18098132f8f.32.2025.04.30.13.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 13:41:34 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v4 14/15] drm: renesas: rz-du: mipi_dsi: Add support for LPCLK
 handling
Date: Wed, 30 Apr 2025 21:41:11 +0100
Message-ID: <20250430204112.342123-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Introduce the `RZ_MIPI_DSI_FEATURE_LPCLK` feature flag in
`rzg2l_mipi_dsi_hw_info` to indicate the need for LPCLK configuration.

On the RZ/V2H(P) SoC, the LPCLK clock rate influences the required
DPHY register configuration, whereas on the RZ/G2L SoC, this clock
is not present. To accommodate this difference, add an `lpclk`
clock handle in `rzg2l_mipi_dsi` and update the probe function to
conditionally acquire LPCLK if the SoC supports it.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4
- No changes

v2->v3:
- No changes

v1->v2:
- Added LPCLK as feature flag
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index df43ff59e08e..22a386ca8ae3 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -30,6 +30,7 @@
 
 #define RZ_MIPI_DSI_FEATURE_DPHY_RST	BIT(0)
 #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(1)
+#define RZ_MIPI_DSI_FEATURE_LPCLK	BIT(2)
 
 struct rzg2l_mipi_dsi;
 
@@ -63,6 +64,7 @@ struct rzg2l_mipi_dsi {
 	struct drm_bridge *next_bridge;
 
 	struct clk *vclk;
+	struct clk *lpclk;
 
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
@@ -788,6 +790,12 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->vclk))
 		return PTR_ERR(dsi->vclk);
 
+	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_LPCLK) {
+		dsi->lpclk = devm_clk_get(dsi->dev, "lpclk");
+		if (IS_ERR(dsi->lpclk))
+			return PTR_ERR(dsi->lpclk);
+	}
+
 	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_DPHY_RST) {
 		dsi->rstc = devm_reset_control_get_exclusive(dsi->dev, "rst");
 		if (IS_ERR(dsi->rstc))
-- 
2.49.0

