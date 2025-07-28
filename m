Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C596B142C3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 22:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473FE10E589;
	Mon, 28 Jul 2025 20:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d9rIKjs9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A44910E584
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 20:14:47 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-456108bf94bso27184415e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 13:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753733685; x=1754338485; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hxAOjHFcbAscdsMiUqjtn03BhEmL7+9NdefozGvlrp0=;
 b=d9rIKjs9SpET4lmwHYqVhoGQsPq6nTZ4RPWQdiESti4RfGk5fkPGfupsko8Q0IC95C
 3Z1mbY//TibyyBBHn2dEVNsvt+USkJHzJC/SUcePqAHnjiGO7fmmyd6m2F0iRb3Ho2oT
 iacePXQv0iXG0isBDeeHTV+9RJVwEZjVAoGeXIVWfdv4GJfSVQ6f+qHb0QfOhzCi52sA
 IEQESPzqls2R9jhkQPjxCVUIwPTs3D8mU5vyJYykP5LaCnX0Kqfiqos5J90lAofV2iJN
 PlSJlC759Rfu6W+FMiorhBNmTRu4dXMtCN78j7oc/mmPhzRYByeAKeCRDNssbFvCpPEy
 1tPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753733685; x=1754338485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hxAOjHFcbAscdsMiUqjtn03BhEmL7+9NdefozGvlrp0=;
 b=EkJVW5BW2oYh45o/R8ewlo48GRDxD6a2xTF2H16rB35d4iBsj9icrvnfDcfYjDNTxY
 TOGzUDvM5wAHSeYzpQWM3AYHv6ZG46r5rs6PC2iCunwnoItFby8tzzPOypkCfWjjqpX8
 RQluVWjA4+vJHq/hob8+Lqc1bC8M3a5+8UPPqGTXH6A6NIDpZFy5P/3fwPTgdeAMSN7w
 HUr8p+jNpg31OYEfLCyCatpC2sDPQDLLkDhmSdQhwNoFcRWHYbzDBy+WRr3ldplB4WAk
 QOcjy+97Nx4Q3ie5r3W++QGOLj9wN0CKc9DHpptUIBRW23GfYwelubzX1lEQK9Mm1z7N
 CHuQ==
X-Gm-Message-State: AOJu0Yxsc5srg8hmGP7xO1mxedEyjaN4Z21CS/7hlRqopjXiy+i3gTYH
 7lYsBlIJbMy1v26nmjRJfVDyorlR5dCj57ec6RdgboCXVKpGr0DW34Qp
X-Gm-Gg: ASbGncshg6c7CgHZLU9oZ2aLTnc5twLIhzRmlJctBayQfEYfm7Ji4agnvGMhZ2ndkrc
 jttCye9C/4V7/X0VCWsc8SOwF9KF+/BTBScWr7U8hbbmZr8G3bFgh7i4BRObfzlZmO3SVVnfdrZ
 w/FpddAea2+8mlzcok0z8m7UIcrEa5A6lGchs5rJAH7evZ6sqIdleNU92Kl+vMPu236BMALFekX
 S+mq2AuSm8HpMUccbiAQxsm3AZUVmGavPiPrHahpKQGc9IeT4TL+vLgzzCj2JmTO8FWBApGB8pk
 k0yJOGv+nalo0k51s4mHSMpd0LiTW80pLsEdMqU8o4VJC24PdjB/ZpyEg0oQbZhIDxI06/dN4uH
 Hu7KI+bKjz34AfXS7fdRNiO/Xl1tT0uTejpT0IVUW88uNAH0EUHe/Q0PZOCilyt/xTtj4+kJKnt
 vbdNYpkjE=
X-Google-Smtp-Source: AGHT+IHxePFtXzvhlxVqqGYSh8DYWR1LshH8QoaIu397QtTtu7mtUAlEVRDZi3I5WSDEdMuelVhLpg==
X-Received: by 2002:a05:600c:3514:b0:456:27a4:50ad with SMTP id
 5b1f17b1804b1-4587667a7b4mr89215925e9.33.1753733685270; 
 Mon, 28 Jul 2025 13:14:45 -0700 (PDT)
Received: from iku.example.org (97e54365.skybroadband.com. [151.229.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b78889682bsm4317760f8f.77.2025.07.28.13.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 13:14:44 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 5/6] drm: renesas: rz-du: mipi_dsi: Add support for LPCLK
 clock handling
Date: Mon, 28 Jul 2025 21:14:34 +0100
Message-ID: <20250728201435.3505594-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v6->v7:
- New patch
Note, this patch was previously part of series [0].
[0] https://lore.kernel.org/all/20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index f87337c3cbb5..893a90c7a886 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -68,6 +68,7 @@ struct rzg2l_mipi_dsi {
 	struct drm_bridge *next_bridge;
 
 	struct clk *vclk;
+	struct clk *lpclk;
 
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
@@ -979,6 +980,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
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
2.50.1

