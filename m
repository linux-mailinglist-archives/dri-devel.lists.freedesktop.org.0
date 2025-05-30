Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4A7AC9425
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 18:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF14110E852;
	Fri, 30 May 2025 16:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fvCpMlA0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6B610E852
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:59:27 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3a375e72473so1290694f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 09:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748624366; x=1749229166; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2wyTGUJmJGL2WGesM8nfuqYiVpu2gtlcpHv+BHufplk=;
 b=fvCpMlA0Peae8I+zF6sz3s2gPICU909uptMljHgg3Ze90F1BFPRc8l9QiKpM5HubSi
 fhdoPu+ZDmnHmnQP3oXd7AENATKlz6JVka0OO2R2yLONj5KtXI0UemcaL3gxlV90Jxt4
 9p4s0R0PdmopLwaFg8Iqtw6bY6gPk/TeioVZfeUr4AP5J1QbrtfhUj2xBQ+3qM8umFNO
 6b2wynZ61yALrAyiblihJp8vZxD/J+u7g/bShkTBwF9cDoexjCikXhL6ORsN3rGIBVkS
 qMkcAsP8tGGeoaQn/9o4NRe69NSkA91RPbyUHJ1Rkwkba1N8drQIDuMwdSdUQApE78p8
 iRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748624366; x=1749229166;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2wyTGUJmJGL2WGesM8nfuqYiVpu2gtlcpHv+BHufplk=;
 b=ia/m9tjOao5tqK3F/sXDQCkyBTlHl5q7MY3hohPkzpyO5rpK39FQy2zeglFEjtbyo8
 Vc0ZzQ9235tzvdFzVAnAB6MB349SnqOPB6vkd8jv0UUBPbrEWpHMhUUU5yaBNQAJBegP
 LFh4tQWLMK3ku0c79RNoEhNnjGZWrO79zdRXc22h/Sw7pT0Sxbghh2HvEpbnw2oGtBSN
 z5CEH2heuNpQfwf1WjLqQ0rRqBMfAbPD21jKVDSTeov6wiCR8PKqYo6pgBLm9DN2wwld
 t5XqUYYeDjhbtAWFH5amhuGyD7Bz5u+4yzzCwJcqVSZIYhYMkmHXkusbAXodU3ymBrtU
 zMMg==
X-Gm-Message-State: AOJu0Yw2yXRdTLy2VbR6EzMnQKEreQohMWJFQO5zV/++vZ2sMpMhromD
 AVkThgvG6D5sTKLorZP9aKsnqzO+7J5UWQfbgoZusfE+2/0F754AW0L8
X-Gm-Gg: ASbGncu8FmFBc9kMVwCgoUO82b9gAn4+iuE3/9K6nEiaKfJn5iTuQyHdFRY+LLpal5y
 K8YBxXVF2fBxln8IeEoxw+PIdgn+F0621+BnHyxJhPdxBdWrWg/q9qobIynle7232691+ldSLSL
 fQ2FTY0BGPzx3ctV7M2eHpvDFQkWYJukaD6eQqxt9oiK74Txb3g9kNVeX0FubLgR5wOP73xGscH
 j3pavu/9PEUZHY/WTnkuCfiTH9cs7zymOp6sYdv0+HaiqMgA/wtogaiKvyLodIXOvlcl4DvZT57
 QUMGuMsmn9hfmND0mvSo3omeoF1YyhSZw59meEO4tYt6fwvG1n1ycyHG8L6tfp6Sytjf2l1JWGI
 3mp50CXc7WtIAajK4PIG2
X-Google-Smtp-Source: AGHT+IEj2mWFq52WxYW2XdXtwquiylRquF3NdO7m5fCF7V+mYsPLNiAhphxn1nLPPWljA/scPh/SBQ==
X-Received: by 2002:a05:6000:220b:b0:3a4:d0c7:312b with SMTP id
 ffacd0b85a97d-3a4f7a35918mr3340221f8f.26.1748624365743; 
 Fri, 30 May 2025 09:59:25 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7f9efa3sm22733455e9.9.2025.05.30.09.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 09:59:25 -0700 (PDT)
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
Subject: [PATCH v6 12/12] drm: renesas: rz-du: mipi_dsi: Add support for LPCLK
 clock handling
Date: Fri, 30 May 2025 17:59:06 +0100
Message-ID: <20250530165906.411144-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add LPCLK clock support in the RZ/G2L MIPI DSI driver via the optional
clock API. This clock is required by some SoCs like RZ/V2H(P) for proper
DPHY configuration, whereas it is absent on others like RZ/G2L.

Introduce a new `lpclk` field in the `rzg2l_mipi_dsi` structure and
conditionally acquire the "lpclk" clock using `devm_clk_get_optional()`
during probe. This allows LPCLK-aware SoCs to pass the clock via device
tree without impacting existing platforms.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
- No changes

v4->v5:
- Made use of devm_clk_get_optional() for lpclk
- Added Reviewed tag from Biju

v3->v4
- No changes

v2->v3:
- No changes

v1->v2:
- Added LPCLK as feature flag
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index f9f2d883c40d..a31f9b6aa920 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -62,6 +62,7 @@ struct rzg2l_mipi_dsi {
 	struct drm_bridge *next_bridge;
 
 	struct clk *vclk;
+	struct clk *lpclk;
 
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
@@ -791,6 +792,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->vclk))
 		return PTR_ERR(dsi->vclk);
 
+	dsi->lpclk = devm_clk_get_optional(dsi->dev, "lpclk");
+	if (IS_ERR(dsi->lpclk))
+		return PTR_ERR(dsi->lpclk);
+
 	dsi->rstc = devm_reset_control_get_optional_exclusive(dsi->dev, "rst");
 	if (IS_ERR(dsi->rstc))
 		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
-- 
2.49.0

