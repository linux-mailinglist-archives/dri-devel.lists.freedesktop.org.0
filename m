Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F01AB4285
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 20:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C26F10E47F;
	Mon, 12 May 2025 18:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hPxsaUiZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE0A10E47F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 18:23:54 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3a0b6773f8dso3990579f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 11:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747074233; x=1747679033; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OzsjarrdikDS8ndB76ux7MldnCyvAk8o/XBpukygdsw=;
 b=hPxsaUiZub7Kew2ttnaLJuTVbxyWEEcvsTDkXeOjuly3kUKjvBKIHMGOTJG0YMDsB4
 H2v0pMkeyhBq3PWGuZAcZtOEb/YTkmy+dG3oNwbU4wcyhqo0FDdxtD+1UJ8oFxWKWZd5
 wVjcCJqszNRiCt8cavDo5Wuaqyr3wg7TLgrKJISr4XkL+RnrbIm7v66TBPkyR0iu4Yrt
 NNgJZSwCKeTJk2lPqGTORSgFobsmGEFu6YX8HP8mx5vrt0eJLn1lrfmNF0JK2XNUVqUU
 C3ZxU5CsUaknBVDHZO28r+ckvgSkiVwSTPEvaTMHIcemIf14daN010hyRL/iEoQPNd6S
 bd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747074233; x=1747679033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OzsjarrdikDS8ndB76ux7MldnCyvAk8o/XBpukygdsw=;
 b=PJsMDtZYz9DHGKKUSzw0gAp7XpDtT90G0yebZkIZpxwFmzL/TwpZW28eqTrKIasg9r
 uDA4hAB4r8rKXielqOk0PI119XD1iJ6C78ziRrDiGhBVBWqaahEvZgR0sQC12aBuHkoM
 mzGll2/AIjMwxRFkFWnV27595nuUfSoOCR/7z8EACyCZbwWa7jUTTB0ikRDpX++IOQba
 fz19feO6GZMZ37RZv0BQz3VdCUmgWfutc3jDnpaU+fH3AMTkg7EYStellhhfZbrNFPC8
 yJxVr53yv1EsEPqrBd9RP8lHmrmLux950eYQgJOTUfuhnolV4peg9JYAbrhCjWmCUwtK
 tzsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0MyVoyvFhESUy0i+IEyMBrKJBBqP2Re7Y+iqBpT13kWj87wmpMMEbnuUjP0MO279Sw8dO9yMPGb0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5fpjjcbaUGWKisT+HOAFppon3r3nBrSpXAKFQCM7lCcVArzgT
 vx3kxU+btA3osdfW1eSIYuO1cm8iUI784aShI20rTYRz1EuzZjnU
X-Gm-Gg: ASbGncvQPL6cJlKHhjsNwnXlW6QFB2XbFyaoGdElp4Mit0RnUJpuK9Tfeukd5jzcxD/
 cB88i8Lqjln/WZQdGjQM6FE61xlznToJgdgHWiAyPekcDEPCxJwFhedhMQm6MOtQpU+inr6LlfS
 kE1SChiFrXWMzf8Gr7I+P9v9h3yE0M+sb+SDBf4ECUFDJD1KLk7AkaiQ9DT/y6q1pSXbvqV/gcT
 C1yOJtIBEB5Fj128a+4P+Uhyd26YYySs21PZPS9Do6Oy5DhoHTOMgArYx14wYGwmMRxRlkCTtRQ
 1axsh/h+qJSvDvqaFYTJdTm7/5UaqGm++fhDZvIc/S98MH93mGQBhAQr01q6Q2ryh+By9eX6z+n
 q
X-Google-Smtp-Source: AGHT+IGSSPoF6tbcsxBWJhNriUW7LNoeo78OPtAVaG1+Jx6SsVAaP1yD69p2cEiKzVLtzfLkuEx/nw==
X-Received: by 2002:a5d:5f4a:0:b0:3a0:b563:2451 with SMTP id
 ffacd0b85a97d-3a1f64276b1mr10373421f8f.5.1747074233211; 
 Mon, 12 May 2025 11:23:53 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 11:23:52 -0700 (PDT)
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
Subject: [PATCH v5 05/12] drm: renesas: rz-du: mipi_dsi: Use VCLK for HSFREQ
 calculation
Date: Mon, 12 May 2025 19:23:23 +0100
Message-ID: <20250512182330.238259-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Update the RZ/G2L MIPI DSI driver to calculate HSFREQ using the actual
VCLK rate instead of the mode clock. The relationship between HSCLK and
VCLK is:

    vclk * bpp <= hsclk * 8 * lanes

Retrieve the VCLK rate using `clk_get_rate(dsi->vclk)`, ensuring that
HSFREQ accurately reflects the clock rate set in hardware, leading to
better precision in data transmission.

Additionally, use `DIV_ROUND_CLOSEST_ULL` for a more precise division
when computing `hsfreq`. Also, update unit conversions to use correct
scaling factors for better clarity and correctness.

Since `clk_get_rate()` returns the clock rate in Hz, update the HSFREQ
threshold comparisons to use Hz instead of kHz to ensure correct behavior.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
- Added dev_info() to print the VCLK rate if it doesn't match the
  requested rate.
- Added Reviewed-by tag from Biju

v3->v4:
- Used MILLI instead of KILO

v2->v3:
- No changes

v1->v2:
- No changes
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 30 +++++++++++--------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index c5f698cd74f1..3f6988303e63 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
@@ -15,6 +16,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/units.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -199,7 +201,7 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
 	/* All DSI global operation timings are set with recommended setting */
 	for (i = 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings); ++i) {
 		dphy_timings = &rzg2l_mipi_dsi_global_timings[i];
-		if (hsfreq <= dphy_timings->hsfreq_max)
+		if (hsfreq <= (dphy_timings->hsfreq_max * MILLI))
 			break;
 	}
 
@@ -258,7 +260,7 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
 static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
-	unsigned long hsfreq;
+	unsigned long hsfreq, vclk_rate;
 	unsigned int bpp;
 	u32 txsetr;
 	u32 clstptsetr;
@@ -269,6 +271,12 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	u32 golpbkt;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(dsi->dev);
+	if (ret < 0)
+		return ret;
+
+	clk_set_rate(dsi->vclk, mode->clock * MILLI);
+
 	/*
 	 * Relationship between hsclk and vclk must follow
 	 * vclk * bpp = hsclk * 8 * lanes
@@ -280,13 +288,11 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
 	 */
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-	hsfreq = (mode->clock * bpp) / dsi->lanes;
-
-	ret = pm_runtime_resume_and_get(dsi->dev);
-	if (ret < 0)
-		return ret;
-
-	clk_set_rate(dsi->vclk, mode->clock * 1000);
+	vclk_rate = clk_get_rate(dsi->vclk);
+	if (vclk_rate != mode->clock * MILLI)
+		dev_info(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
+			 mode->clock * MILLI, vclk_rate);
+	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
 
 	ret = rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
 	if (ret < 0)
@@ -304,12 +310,12 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 * - data lanes: maximum 4 lanes
 	 * Therefore maximum hsclk will be 891 Mbps.
 	 */
-	if (hsfreq > 445500) {
+	if (hsfreq > 445500000) {
 		clkkpt = 12;
 		clkbfht = 15;
 		clkstpt = 48;
 		golpbkt = 75;
-	} else if (hsfreq > 250000) {
+	} else if (hsfreq > 250000000) {
 		clkkpt = 7;
 		clkbfht = 8;
 		clkstpt = 27;
@@ -753,7 +759,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	 * mode->clock and format are not available. So initialize DPHY with
 	 * timing parameters for 80Mbps.
 	 */
-	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000);
+	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000000);
 	if (ret < 0)
 		goto err_phy;
 
-- 
2.49.0

