Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 436FEAB428B
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 20:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C947610E482;
	Mon, 12 May 2025 18:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WWJjQLkw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C1810E482
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 18:23:59 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3a0be321968so2876515f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 11:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747074238; x=1747679038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jRG2yi7YpojS2aHgVVgcNNua7UnuMTBpM3c8GmTmHO8=;
 b=WWJjQLkw3FqXXMjCuzL1Ly6hTxphIulftagFfhHoG1d4ltXSxN91BPmkozQvOnQ2J6
 kC/2EA2WQieI8UteUDDYWjgAtWWBt+yGwDTqGBoOLsYKAmdulTF/OVPZa1/hauWq4UQd
 f3QyNdoSG22NUWsp7d6jASdiA4IFh7k9nrJWAwU6W0Jgtq4hccC3lZYRZNB+HBy5VGeE
 69csibhhJIGYYVQtcDmWcGnpKrO8Pal3zZQs+zWbDIMLXli+bmeavBcdgJ+1R0hPaw+U
 rQlmhtr8PheNsDFeUHjfBJVufMRyq0oW1jhQQxxctQiHZse8VFkziVsAxIZs9mU2JYDT
 yNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747074238; x=1747679038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jRG2yi7YpojS2aHgVVgcNNua7UnuMTBpM3c8GmTmHO8=;
 b=ehdvs9WqC8kd8CEE7UhDAobJEe+jmIVrJR9L4PvHYMbrAK7VYnPXLGOybqIwdJtloT
 MAiqzxmsq3Fi8Ix5hZapHguY6f8CkQKSYDiu0ObsjgDFe2aKdsgHfz9USdmojJXctNwi
 g9QJklT3tCMnTq/J6AgNtI6mYRTa6yR/lD7vNpBoWWKS9MBlj+JU5Qnv1cZYJzVCzuBE
 cpD/8vrDx0/5ozgEPs4o3C4kjWq5+yahdi/hktrxQR9AnjGbyBznos1QfDkIeRIloyNk
 ntnq8ZrBOpShGcSlpWaOjWz4h5Efwm/7ZjJVEo2T9JNRLmxyvInszMpVd63hwiXmLPFW
 MMIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/qm3pR6j1qbArzca3uo4EKbwt1zN6oVyEvs1u3EHz/bs+9IGXkGLdg6BbJB1gclusixvoDihjLqI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrKR02Rvhon89uX1KsFeHx3OyCWEY4maqMAAiietSEUBFQZPgC
 2HJHiZJqwFlNucR0RfV6ysghzlbj2ffQd+H16YH9ELxkit74CHWd
X-Gm-Gg: ASbGnctPPJ35DZRA8fKVJZEem2ABhIoVPyvEmfrmPIG51DrRH7/CkJvY5E37Lz3rYmq
 xUE2RZA1evReajmtaa7d/Vdj2vHcRPAgnSZjIIIBkWN/7ipwRG6ZAC7SNCMVfcDUSijcMT6kGiQ
 MCxXJwehYErUdd8ipOi5t2AXwd8hraHLT3/E9sl6MwidkRdsynphtrA8NdFZ/EFRvd23MPNzd52
 cuehAsZnHbFmP2doM73vZ5JHQShbiw25ais5rKuxLIFFJCgSzF+DYdPeK3sbHvrTq/A7hcguIN2
 kpp2SPzqemlDyWSKWnpY7TQKoSmSyofO01whNZOSR7T+LU6D0FYeAaCeFvOG6VBKpQV84lqbrS0
 /
X-Google-Smtp-Source: AGHT+IFbj8APB1sNztBPz7AcWaG5rPnWqmjp5YOqujspSqsm1x7to9jsTn5wmYCgvZNtMEQP9HgYDw==
X-Received: by 2002:a05:6000:1842:b0:3a2:45f:7c3 with SMTP id
 ffacd0b85a97d-3a2045f0814mr6295858f8f.57.1747074237420; 
 Mon, 12 May 2025 11:23:57 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 11:23:56 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 08/12] drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY
 frequency calculations
Date: Mon, 12 May 2025 19:23:26 +0100
Message-ID: <20250512182330.238259-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 5fc607be0c46..f93519613662 100644
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
 	if (vclk_rate != mode->clock * MILLI)
 		dev_info(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
 			 mode->clock * MILLI, vclk_rate);
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
@@ -776,7 +779,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	 * mode->clock and format are not available. So initialize DPHY with
 	 * timing parameters for 80Mbps.
 	 */
-	ret = dsi->info->dphy_init(dsi, 80000000);
+	ret = dsi->info->dphy_init(dsi, 80000000ULL * MILLI);
 	if (ret < 0)
 		goto err_phy;
 
-- 
2.49.0

