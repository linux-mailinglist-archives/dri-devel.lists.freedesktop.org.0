Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA5EB142BF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 22:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4262310E585;
	Mon, 28 Jul 2025 20:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gkSU0/uR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DCB10E197
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 20:14:41 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so29801805e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 13:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753733680; x=1754338480; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wMuXGDptpudzRDqlzxY9BCXwivqwkH1BJdjiQYZbTBQ=;
 b=gkSU0/uRlUo9ddDVblSrSsOL9AmEj6yz2fK/PuNbXV2+NQMA09djZi/OzySxDAA3aM
 u75x0xow7Fm0ITc2Oj330jv/tJrpDfNmKswRZqHMXxb3uXQ+G9GtQwETea/bjjxfGH1s
 CGoPrUqP0E+0clfGqKHT6fx3NdRptQttC288Y/4XrYXMt5okA7lmmwrCx99lMvjHKCio
 b+61DK0+t5FTT267eMaqCR/Qf4SYZA3W7921H2vcE9nywz/fGNFM3rAJC9Z9npoZyoZB
 RzEm6ezpnSkSLUZnOMH9Z3uBWEF+pzsX8JCt1LEcXb2/n0egFB0GJEQmZe+cV4/VUWqO
 fSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753733680; x=1754338480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wMuXGDptpudzRDqlzxY9BCXwivqwkH1BJdjiQYZbTBQ=;
 b=K0cZTi57N9yzC5C02zgRnWkc5Bt9+zfRnYLvy3g52xDHzFxi1XuKdXkJaX/MOGGtug
 PKmYgIqF+xeUPv0lP5lYQWH5UnPhGHheF3KK5X1Km9nzInsWJf2j803QfIUGfuRnwtIt
 +uuwA2G1b4ztav6W9AM9bqQl5McRQzJEyqxRlHJ4zqMlrmFsIen+wY+iPXT2J1Kxt1L0
 9AEC6nvHO2n2nqj59SIJXoO7B+A0Q9b4sZoJrKBqe9Yaj4DHHCBt/Iq2EFkL0Or0SZkb
 TmCO30yeO+i0OKwwQK7fKXBFWubieSpL6vHql/30V+gpgemVFYJI0iNyY2m7D8GjhoM1
 QGWA==
X-Gm-Message-State: AOJu0Yx0BRKpZX1uwer9UIkbIt+JFvZ+zyhnY9Vfxz/zlh7siIE3xNIn
 D+1qkdtnvN0L9TTI8QjJMGSpM5Mwy7/nv0QgV0SPGWW4iGciQlesNV7C
X-Gm-Gg: ASbGncsFt/8Q070afYelElHvPDj+Au0sfki7g+6jJPlQZ0FpEYvrJZpAvtpf26UXcRd
 +OGR8I1n+7xto5uIxUYIe3J3lh5XzPrCoGTf2kZC4FnHTR69sTVSOQSxOBtv/L4OLwLVLUoLOI/
 p7DlaxXnKZ8ghwW1jhXGejHNSSoDd8JISS1W/rUTpYc6FA865kBBwm0OCrZJfqMMJp+PsLnAhPL
 BIBIjb4Zx92g2dNgMlkvJHcPkk+sqJKZ3aqT6Ql6Phe4sYxXkOSoHxBUq09QaBFltd8ICv90ocb
 Sdpnxi8JgWc9twFPHBkqwGG3S7N+kv1JQG7DDupunM3swPtlEO+oryB2wbUV5/KMpUJIn2j5w1w
 umrxHWr2i0OHWXDyjnLVmdwYLRL+pokVzPKKLj2AjnROm53dd+Y4H4nVWl01gvyYM6qqCxUPY0d
 U3nILgaGg=
X-Google-Smtp-Source: AGHT+IEnC8IoXVKoS4VI4Nn2RYIdFiuDczHhoY1pfwevf3WxCTPWE3ejH5RaK7+c9B064MgVYFHXvA==
X-Received: by 2002:a05:600c:1e2a:b0:456:2832:f98d with SMTP id
 5b1f17b1804b1-45876556361mr107218895e9.27.1753733680306; 
 Mon, 28 Jul 2025 13:14:40 -0700 (PDT)
Received: from iku.example.org (97e54365.skybroadband.com. [151.229.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b78889682bsm4317760f8f.77.2025.07.28.13.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 13:14:39 -0700 (PDT)
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
Subject: [PATCH v7 1/6] clk: renesas: rzv2h-cpg: Add instance field to struct
 pll
Date: Mon, 28 Jul 2025 21:14:30 +0100
Message-ID: <20250728201435.3505594-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add a two-bit "instance" member to struct pll and extend the PLL_PACK()
macro to accept an instance parameter.  Initialize all existing PLL
definitions with instance 0 to preserve legacy behavior. This change
enables support for SoCs with multiple PLL instances (for example,
RZ/G3E we have two PLL DSIs).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v6->v7:
- New patch
---
 drivers/clk/renesas/rzv2h-cpg.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 840eed25aeda..e2053049c299 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -16,20 +16,23 @@
  *
  * @offset: STBY register offset
  * @has_clkn: Flag to indicate if CLK1/2 are accessible or not
+ * @instance: PLL instance number
  */
 struct pll {
 	unsigned int offset:9;
 	unsigned int has_clkn:1;
+	unsigned int instance:2;
 };
 
-#define PLL_PACK(_offset, _has_clkn) \
+#define PLL_PACK(_offset, _has_clkn, _instance) \
 	((struct pll){ \
 		.offset = _offset, \
-		.has_clkn = _has_clkn \
+		.has_clkn = _has_clkn, \
+		.instance = _instance \
 	})
 
-#define PLLCA55		PLL_PACK(0x60, 1)
-#define PLLGPU		PLL_PACK(0x120, 1)
+#define PLLCA55		PLL_PACK(0x60, 1, 0)
+#define PLLGPU		PLL_PACK(0x120, 1, 0)
 
 /**
  * struct ddiv - Structure for dynamic switching divider
-- 
2.50.1

