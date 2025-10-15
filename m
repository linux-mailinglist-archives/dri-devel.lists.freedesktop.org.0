Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B713EBE05E7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 21:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3F010E8C9;
	Wed, 15 Oct 2025 19:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tm2WYKXe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED8510E8C8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 19:26:35 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-b551350adfaso5703011a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 12:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760556395; x=1761161195; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DzeiqeSx2hP+uCSg6LMRTweWgMxjeUkFjtP3zeTP43k=;
 b=Tm2WYKXeh4IcmMuKCgYOckMuO8IlgoSbGCJCzKrTsE7Af41y3aA2GTiZY7iDYm/OGn
 /jYNoc7P8roVtvjqrmu9zyEokg0O5zreLXTSD959LovgiX9HMhEFg4ghtuS7zH6x92g+
 AQTIj0rkM4AWN4TeDG5uwEhOjzb/anXyck7qIjWYyvLDWKmO5+CnCsNoVwt5lbxNpyfP
 yPWEktyEFe7hSHm8FA2ALx2aLHmesWomIyV9ci2bnor0F+kvqGk0jaVLdttdzUoqzNbX
 GuKiBYnkBkVhu7YBhtqv4TNq8tD5x7+Zns4cEK5VkX5YI5nZh9W+tr90GD94qMy0yiXN
 H9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760556395; x=1761161195;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DzeiqeSx2hP+uCSg6LMRTweWgMxjeUkFjtP3zeTP43k=;
 b=h+4Di+zbFJJNQY/Y01N0F1qPWxoyoy7/MSlpg+7aqAmujAOY0BJUqlT0zzGeXOm8RO
 a8AI66frm4FKtuH8vU8e8EQWROQLsdlHxY2pfdhb7/il+NMopzrkaDF7F6gsQklnT9qf
 4JvYQSLeDf2IdojCRan+c/iF6e9Rz5nmX6tVyVlQWHlkBZJ7pikZRUOt4YRXIpazZ0wp
 ydebwbjoezIOVIcx5GCuyEKonqZBPKt29E6NpFGCfPv8wp7Kc6CXsSjHi7jjc7ucie69
 zjveEX9cneQYkfvCd1sYoczK6huM+DHttAn+BQgaBrDEJn2jFAf7FBa9ziLqu5yRN/UJ
 i1vw==
X-Gm-Message-State: AOJu0YycwoDYKVnflWp2t3Y+0RTdBRBj1qL5OgF8lFOXmWaIGQs286lg
 l7RgQhOMfUslZDtCQWqtS/JVmubV/KtjthwQJrbBlBceE/uV88c1V9gJ
X-Gm-Gg: ASbGncsRW9dRQgPHAOKgD9gQ6h7jmJSYXVGUqNImKWI2OHF+oRaBaJ271fE2z2dPC6n
 w4yHmdZDChI+MCE20s0ib7kv9TdIz43OpxmEYD2yVZV55jPk2dIxTEiE7ghazbZvMgeaN9mNAHO
 2NCN8ArQ70j/7OrHyQ7cyvOiCKHgLRdeduWkvcEquZauD+aiVUYIxwLjmLl5E+J3eTpt+85LFzb
 p9hG5eCPiMpR0bvvwN+aVM9whvApU/AuXZoAupw+EowXnEXInM6N1WwkjXWVIBKv4XmJd6pzhL5
 bAjCj50fFnXmg144uriw5RNbtRXqKRQuaKK91YsczkM19v8+qiFcQu6Djh+jAGhKcurV45osVn6
 3FnfOpmSRNUOuZMS0Sgsn8dj8szehN4xbd71HWscCTlx0/7VQ2JusqGlv5ScBxx4Fxsdl7SPgh3
 T00LDQ+8PTKXOX1QsiiEIO4A==
X-Google-Smtp-Source: AGHT+IF40uLj5O1VNn/1ilvror5cZrwViGxizn9s293CQe+Duobh8kb93icrEIO0yMNIwwVc30gkmg==
X-Received: by 2002:a17:903:3c6e:b0:26b:3aab:f6b8 with SMTP id
 d9443c01a7336-2902741ce06mr353175745ad.58.1760556395165; 
 Wed, 15 Oct 2025 12:26:35 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:c7d3:f449:63fb:7005:808e])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-290993102c9sm4427005ad.24.2025.10.15.12.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 12:26:34 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v11 1/7] clk: renesas: rzv2h-cpg: Add instance field to struct
 pll
Date: Wed, 15 Oct 2025 20:26:05 +0100
Message-ID: <20251015192611.241920-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v10->v11:
- No changes.

v9->v10:
- No changes.

v8->v9:
- No changes.

v7->v8:
- Added reviewed-by tags from Geert and Biju

v6->v7:
- New patch
---
 drivers/clk/renesas/rzv2h-cpg.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index e020d9624dfd..fe6ab8e3cc6e 100644
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
2.43.0

