Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5D9C606D5
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 15:14:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB1710E041;
	Sat, 15 Nov 2025 14:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C4yhaJcy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA98010E2A5
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 14:14:18 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b737c6c13e1so112271966b.3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 06:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763216057; x=1763820857; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UciMie+UNtQ6Be5Ygq/FZ+wB93JKP9NGMjXOu78hOHU=;
 b=C4yhaJcyLAzOdiQsCSs28G7DlpwP5iecdDsHLnA/HUn+vdAi7/5Ag0lBpcD6EcLje6
 zA+Cc1Q3UjVUbMF/6AxFzXRXXewg9bthHVboRLv5R2rlNTvu5oQzGVq05Z3S/ph9W3wO
 wVZTtofDBJxHb0ZR4oDOJRJ7AP/gLYeIuboSTVAbHFYpwIj8ldYTqhhheVbDn+tOpRmF
 P0nr5EpV6qkaVT057j9i43cOI3WwAD7V89XJgrIBQIxOoZQuWlcbVp8MZ1M/TxT/GkhJ
 jUnMYsp+J5xocOEvM7KszNlVpWb3Rzt/jazDKOUrIlD82daEmcZoinYGQJoFt4UY8oK4
 c36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763216057; x=1763820857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UciMie+UNtQ6Be5Ygq/FZ+wB93JKP9NGMjXOu78hOHU=;
 b=sgvpfOJVrZjWoxYqh+zD7JcReFxIHhJlADyu/8luIFNZb6o9pFyFI1Ifry1e8zBBv7
 3Bdmv/SMD2dZRreAKK1L6+h8XsHShabOhML4QnBPL74g9Z8JiF8S9w4CgIdLVvKkTwZ8
 iZihzRvBR72HDB93lwmV3B0Tmd08QtCOgglUbY5I3rdvreoEZvnZrzqoVTh+I6IfYhO3
 rqThHUaBRUEEEkRonmwySCxzUpOc4rcOd5FMJR9ZUnpETRm0VnybnBwJr4Ycn2bN3i/c
 TS40uUFstZFliJMS8NibFZaTfF2WdwwtCVLLm8XMjCC+pIJ9fnu8vUSSDWPJh+4ckXr/
 8Cng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNJSzSGs0zuyQPzeZAseLG/MoNnXZZ4qucF83b/7YIBkbywPUNHsXOtIs9s7XCsBsM/JOowDXT1to=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1J1oFDsTg4sQ2AIwP0rbQ7MC1B6vwg0FZhBdU73P6otJv8DfV
 XXiMsPTBOkbu5RkiEwzXPnbo+h9DRyNzH26jB2vujka8lUXLyi1TCURi
X-Gm-Gg: ASbGncu6NkyVJM1FK6JtsEOkFdvcc09bTeQszS6Ks7Ht9rDeuwlOi9gfM945uRtp+9Y
 N0+OOjGP8qQg3cd411Ffn3cknbPQdsTxq0jfXb89T+QFKKbHS8RCliPfIiSasfOqCZkmcJTx2BQ
 tpngscdOcvh/EZhOxruQ7RllUAUBtN9/kDbemT1f2swUyDde3xecUMvVtLefxL3brcf+YYPTY0J
 QyT0+0y0fVPDijsiYXelMSroQl/dRAjXlNCzYzJqeyTmyBeH98U6hlzmpFu9M6gqezd2F5MeclV
 5oYVXo6WUQixepfQPkkfF/TrzJqMvJOg9D0u6n+ZHn0oSSsh6m9GITF7b2hXyjMYaIJbOi3UxCg
 hjuhWzpb2Ie2YL7ujSLEizI9Jh8VWd9QJftfH2yD6hAIcHEvxOjzc9iOc/EU1Cr7pnwbz6U840a
 /5TfhWa/5Zb09R2VgiKa2O5gci4yLhJlFdFRiD0LLlEkOWTZIjBTZiKIUo
X-Google-Smtp-Source: AGHT+IHK6phfJOgzf+aqpzFKPTHMjqJZ4C/vVBwN+Y+khMKq+c5K63YPI1+yGx5o9/adAsErm3Oq3Q==
X-Received: by 2002:a17:906:490c:b0:b73:6ca8:b81f with SMTP id
 a640c23a62f3a-b736ca8bbf7mr534553666b.51.1763216057167; 
 Sat, 15 Nov 2025 06:14:17 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Nov 2025 06:14:16 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 3/7] clk: sunxi-ng: de2: Export register regmap for DE33
Date: Sat, 15 Nov 2025 15:13:43 +0100
Message-ID: <20251115141347.13087-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115141347.13087-1-jernej.skrabec@gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
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

DE33 clock pre-set plane mapping, which is not something that we want
from clock driver. Export registers instead, so DRM driver can set them
properly.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 53 ++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index a6cd0f988859..2841ec922025 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -6,9 +6,11 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 
 #include "ccu_common.h"
@@ -250,6 +252,41 @@ static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
 	.num_resets	= ARRAY_SIZE(sun50i_h5_de2_resets),
 };
 
+/*
+ * Add a regmap for the DE33 plane driver to access plane
+ * mapping registers.
+ * Only these registers are allowed to be written, to prevent
+ * overriding clock and reset configuration.
+ */
+
+#define SUN50I_DE33_CHN2CORE_REG 0x24
+#define SUN50I_DE33_PORT02CHN_REG 0x28
+#define SUN50I_DE33_PORT12CHN_REG 0x2c
+
+static bool sun8i_de2_ccu_regmap_accessible_reg(struct device *dev,
+						unsigned int reg)
+{
+	switch (reg) {
+	case SUN50I_DE33_CHN2CORE_REG:
+	case SUN50I_DE33_PORT02CHN_REG:
+	case SUN50I_DE33_PORT12CHN_REG:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config sun8i_de2_ccu_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0xe0,
+
+	/* other devices have no business accessing other registers */
+	.readable_reg	= sun8i_de2_ccu_regmap_accessible_reg,
+	.writeable_reg	= sun8i_de2_ccu_regmap_accessible_reg,
+};
+
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
 {
 	struct clk *bus_clk, *mod_clk;
@@ -303,13 +340,23 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 	}
 
 	/*
-	 * The DE33 requires these additional (unknown) registers set
+	 * The DE33 requires these additional plane mapping registers set
 	 * during initialisation.
 	 */
 	if (of_device_is_compatible(pdev->dev.of_node,
 				    "allwinner,sun50i-h616-de33-clk")) {
-		writel(0, reg + 0x24);
-		writel(0x0000a980, reg + 0x28);
+		struct regmap *regmap;
+
+		regmap = devm_regmap_init_mmio(&pdev->dev, reg,
+					       &sun8i_de2_ccu_regmap_config);
+		if (IS_ERR(regmap)) {
+			ret = PTR_ERR(regmap);
+			goto err_assert_reset;
+		}
+
+		ret = of_syscon_register_regmap(pdev->dev.of_node, regmap);
+		if (ret)
+			goto err_assert_reset;
 	}
 
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
-- 
2.51.2

