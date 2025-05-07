Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF68AAECDE
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 22:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6A110E8A4;
	Wed,  7 May 2025 20:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QLNabxNp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFC210E89B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 20:22:35 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-72bceb93f2fso782080a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 13:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746649355; x=1747254155; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QHElNaXE3LEW3PDqEvXaDUnvuob14iBVgPt+yqm3W/M=;
 b=QLNabxNpzGXWCjYe9jZCFethIWbJVD+OhBFHXD29UQvlYyeLKRiyo37t5EZMp22DyT
 AJfmQhq1gV2F8ybw0crlmX1taG8/ZQprpiEVJd5McWK/2vFOclTUqH2y7AyZVk4HmBD3
 p8E8pPXY5uUdI+9x70ge9lGsCBfCtaypXRjlh5AsowizjStdZjvbnLfs5swASkhcKV8b
 2Db46zPXZw9Q3SOxp0CkbsxJKakYAB5390dQmNIixrwYLhDDkVQrgNe8E8ogovdsQJYC
 yAbCV7k7m9wNNUFe1cBfF3IK/hnRqvHnG0FaNghjydXlXvL99yjWYVvtWy0OK+892vMJ
 3A1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746649355; x=1747254155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QHElNaXE3LEW3PDqEvXaDUnvuob14iBVgPt+yqm3W/M=;
 b=fDw/u6NoDJPpIBmw1UYWFVlo6wvSLGxwcN0OefRZfanROiMV4dLFDuoEnGreW0VcIj
 XhFOaVKZXON+hMqY8g3l/b1m918rtrJLeWXyV4kxf7/znQ8t22dhC4SevrzCBw8PWVIx
 s3Dgg25fDnjsjrYnTMMAwhfjgOtDFqLT4Jq1l5zxqLLiVNHZOvZzrYBy3XRq5ZhYuBV6
 Lqvhcxcjlr06R45EObOeDDd/hVBNfLm4615p+kHp7lFcieCFdD1/L99Qrx/iZr8S4SyL
 u6le9IBvo2BFVSm+f6fRCY3XZCiE4MWTp9/99PdjX5A4pnV0VgUkrvA4EM3vPkcn0qkX
 iE5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpHmlOVSiKRJ0zP/Lo88FZHIdkU2NE0LJ0zR5KllFQh17znGvuYPcJoeoy26HZ4GbikyfXDICIT6w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIroptD9NGoAyTHtWdYAjOAoLBxEHp4UtGK1/2omPZVim2tab3
 bPKjJwreH9xjdK967qL7CAo9WZGTe32fPssZ475gX3RsEZSLR2e5
X-Gm-Gg: ASbGnctMANjZR+ozu5pN9Z9knRWoTP/MdutGL+WaqmHTX5DaYIheksVqKHBGSc38n1m
 yui/2DZAeYo6iQ0ouY0sfQMVYUW38Ytki2Jf2RaGRz5mF5DiGSQlV0X3RcJ6XRYK8T7AMtpFiqi
 nw00W16xgEQhrRFu/1oThsYksIlhP7mMImmsO4hXXKLIvYfyBuygttiJ0snUAKKdhjfwNXy3x7v
 jiPuFb1spH3UBjjpPaAGErpshD/i+9qvt3OzRic3oV4zFADGH7vs+2W9yfQQBIxriBG3B9qv/sR
 E+XbM4lWFJRfkqe0OT2mcrzx73+ScecqBi7gL0cvk9Ri7Uo1OM/sc/uEPsFK
X-Google-Smtp-Source: AGHT+IE6odboNkW58fCeUX14Z/mIvgc1rzNqO9suS76MYTky2niUs9LOJQzjbW6M5IVh5uu++8EYIQ==
X-Received: by 2002:a9d:7995:0:b0:72a:48d1:7fca with SMTP id
 46e09a7af769-7321b395cf5mr517632a34.4.1746649355188; 
 Wed, 07 May 2025 13:22:35 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:22:34 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Subject: [PATCH V9 10/24] clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33)
 support
Date: Wed,  7 May 2025 15:19:29 -0500
Message-ID: <20250507201943.330111-11-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

The DE33 is a newer version of the Allwinner Display Engine IP block,
found in the H616, H618, H700 and T507 SoCs. DE2 and DE3 are already
supported by the mainline driver.

The DE33 in the H616 has mixer0 and writeback units. The clocks
and resets required are identical to the H3 and H5 respectively, so use
those existing structs for the H616 description.

There are two additional 32-bit registers (at offsets 0x24 and 0x28)
which require clearing and setting respectively to bring up the
hardware. The function of these registers is currently unknown, and the
values are taken from the out-of-tree driver.

Add the required clock description struct and compatible string to the
DE2 driver.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
Changelog v2..v3:
- Lowercase hex value

Changelog v2..v3:
- Correct #include for writel()

Changelog v4..v5:
- Whitespace fix
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index f2aa71206bc2..a6cd0f988859 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -239,6 +240,16 @@ static const struct sunxi_ccu_desc sun50i_h5_de2_clk_desc = {
 	.num_resets	= ARRAY_SIZE(sun50i_h5_de2_resets),
 };
 
+static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
+	.ccu_clks	= sun8i_de2_ccu_clks,
+	.num_ccu_clks	= ARRAY_SIZE(sun8i_de2_ccu_clks),
+
+	.hw_clks	= &sun8i_h3_de2_hw_clks,
+
+	.resets		= sun50i_h5_de2_resets,
+	.num_resets	= ARRAY_SIZE(sun50i_h5_de2_resets),
+};
+
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
 {
 	struct clk *bus_clk, *mod_clk;
@@ -291,6 +302,16 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 		goto err_disable_mod_clk;
 	}
 
+	/*
+	 * The DE33 requires these additional (unknown) registers set
+	 * during initialisation.
+	 */
+	if (of_device_is_compatible(pdev->dev.of_node,
+				    "allwinner,sun50i-h616-de33-clk")) {
+		writel(0, reg + 0x24);
+		writel(0x0000a980, reg + 0x28);
+	}
+
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
 	if (ret)
 		goto err_assert_reset;
@@ -335,6 +356,10 @@ static const struct of_device_id sunxi_de2_clk_ids[] = {
 		.compatible = "allwinner,sun50i-h6-de3-clk",
 		.data = &sun50i_h5_de2_clk_desc,
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-de33-clk",
+		.data = &sun50i_h616_de33_clk_desc,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sunxi_de2_clk_ids);
-- 
2.43.0

