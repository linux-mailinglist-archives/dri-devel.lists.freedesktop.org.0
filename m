Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26161A7DC88
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 13:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7594010E438;
	Mon,  7 Apr 2025 11:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jkCLmPgt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE8110E40C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 09:54:08 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2255003f4c6so35858365ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 02:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744019647; x=1744624447; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O8diRuAQehXi7R+D5qp01L9GbmQB2F98eyfpHLigrsU=;
 b=jkCLmPgttITpT5HZsOLitpRtWwIDEdYToVjX5kMZUTxfrvwJAbKEB/VXT76EDZx9H8
 yTBB9IGE+Osba4+Lc4tTJnChOlzFGQMa3avEKG5D6NoXjpBZmTkUJjG6CcexsndkZkHq
 DIqY9ISrpQ4E0S+10XL9Tm4o6FtdBdMbDo7nW3Ok4p8t2Bk29GgXsHku8lT+3qBHhfZ+
 8OmNDRFYrX6+XqVp00CqBMIVHhpB1aU+j523pX8DA2h8WakkMxDYogZ371Eabsi1HXTF
 0z75JtnS4khGjCJEvDzIizD4jRf1q5UCNhNrjc2IF8rb2B865cehkOThBjcd2k7ZERO6
 oG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744019647; x=1744624447;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O8diRuAQehXi7R+D5qp01L9GbmQB2F98eyfpHLigrsU=;
 b=vNXaa3RmbqHJjjb8g5sENDv5HM+MDlLQfIFKbiwn6ue5JO5+XQ1GZgoUaNx9t74M00
 LRj5Ktjw9UI3GDnFUQb4RtCj5yAEKjDCjS35Agid5Xf//5rnp0HbBSyop97tw/Zcl0yr
 phmYIq4/M+KrEFtk8WSi3uRbC2EBQnwItBj16gr5X0nNoWk2AS8oKq/CWkLWeQSjQIlX
 cBUZi2Nq9l5P+ZSFNGWEP5ug4r3G3xMk5C9PgT1FDdOBUGJIklHb49n7G1bCO4RoQoVS
 PbjeXkleWexxiCNWZwVz3Q1TERW7Kn+k7OqLmf4DkkaMhUekHo3u/sG2n7KAawwN6lfI
 9OYA==
X-Gm-Message-State: AOJu0YyGaTHDHD+zjcR8ywbO4mdwyvm7vJlfgZdgbP5mMn/ifVwqObR2
 kGVI7vtsdXffTaRcvfTXzhXCt4rI08jmpEXw2Dvie+bvPyRZvJy4
X-Gm-Gg: ASbGncuH+YFDe1nCeb4qG2VqEM/WNQqfCsrf5Vpu79txF3LiI0drdIoyDKNQJZ2cAm2
 PTucxg4r0st00NxpzyHj9nKBXHt9E9TyzPlyBFvPmGnmWp1QEz/KXXmWd5NEfnd7VP3svj0UasD
 LqoYoE2r47txPnhY+QjXUtrdawNPlDnyTrQzC7x5sNX53xvCshrZkxc5u1KG5zLr9JDLIS8SSOK
 bNj3bggMZRvP5ULKVrNqrFFvsciKs7t62ZbW1PMbW3oTG2CuAP6kcdTRCWeNF9PZ6+cFho7gcQH
 HCllzCzaKhiuC4QudURod9zBO8jTzHK9WKsavWGTP1U=
X-Google-Smtp-Source: AGHT+IEZza3sL31uGEXE9GqOZmRwDZovRtw/5y2xgKCiRmfb48lzBMArT3fRLQbnoTwMSm5KJMfMfw==
X-Received: by 2002:a17:903:18d:b0:225:abd2:5e4b with SMTP id
 d9443c01a7336-22a8a05e84fmr162795925ad.16.1744019647625; 
 Mon, 07 Apr 2025 02:54:07 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-229785bfddfsm77213805ad.66.2025.04.07.02.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 02:54:07 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 3/4] backlight: ktz8866: improve current sinks setting
Date: Mon,  7 Apr 2025 17:51:18 +0800
Message-ID: <20250407095119.588920-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407095119.588920-1-mitltlatltl@gmail.com>
References: <20250407095119.588920-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 07 Apr 2025 11:40:40 +0000
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

I polled all registers when the module was loading, found that
current sinks have already been configured. Bootloader would set
when booting. So checking it before setting the all channels.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/video/backlight/ktz8866.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/ktz8866.c b/drivers/video/backlight/ktz8866.c
index 017ad80dd..b67ca136d 100644
--- a/drivers/video/backlight/ktz8866.c
+++ b/drivers/video/backlight/ktz8866.c
@@ -46,6 +46,8 @@
 #define LCD_BIAS_EN 0x9F
 #define PWM_HYST 0x5
 
+#define CURRENT_SINKS_MASK GENMASK(5, 0)
+
 struct ktz8866_slave {
 	struct i2c_client *client;
 	struct regmap *regmap;
@@ -65,6 +67,12 @@ static const struct regmap_config ktz8866_regmap_config = {
 	.max_register = REG_MAX,
 };
 
+static inline void ktz8866_read(struct ktz8866 *ktz, unsigned int reg,
+				unsigned int *val)
+{
+	regmap_read(ktz->regmap, reg, &val);
+}
+
 static void ktz8866_write(struct ktz8866 *ktz, unsigned int reg,
 			  unsigned int val)
 {
@@ -112,11 +120,18 @@ static void ktz8866_init(struct ktz8866 *ktz)
 {
 	unsigned int val = 0;
 
-	if (!of_property_read_u32(ktz->client->dev.of_node, "current-num-sinks", &val))
+	if (!of_property_read_u32(ktz->client->dev.of_node, "current-num-sinks", &val)) {
 		ktz8866_write(ktz, BL_EN, BIT(val) - 1);
-	else
-		/* Enable all 6 current sinks if the number of current sinks isn't specified. */
-		ktz8866_write(ktz, BL_EN, BIT(6) - 1);
+	} else {
+		/*
+		 * Enable all 6 current sinks if the number of current
+		 * sinks isn't specified and the bootloader didn't set
+		 * the value.
+		 */
+		ktz8866_read(ktz, BL_EN, &val);
+		if (!(val && CURRENT_SINKS_MASK))
+			ktz8866_write(ktz, BL_EN, CURRENT_SINKS_MASK);
+	}
 
 	if (!of_property_read_u32(ktz->client->dev.of_node, "kinetic,current-ramp-delay-ms", &val)) {
 		if (val <= 128)
-- 
2.49.0

