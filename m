Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2842A0A9CC
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2025 14:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7360110E260;
	Sun, 12 Jan 2025 13:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gGwWNSLY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AF510E260
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 13:46:40 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5d3c1f68f1bso506798a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 05:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736689599; x=1737294399; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vdPpMH3EB/gIvZxidNjtZ/XKsVJM/FqerzgsImOH6b0=;
 b=gGwWNSLYSII5bNTWz5Ncg3L4aDYOldNesOHBfV4Xdbran0jzRSWOuXpmY8ReXbHLJ2
 WLlc/m6s9OmYGwgibbcv6qQTtAAaI4e7p818qTR+Tm8W84UCfrez4O51EgXh8ZJ1poBy
 m7MUb9dumI9LKMSbpQqkPXXy+COv23+2Pzih60C4GuQPH6RX1UKx3xqc6QG1U+zmy1OM
 1prRkveqffwAMjQ/KMiSWSYrVfTmBpGlzj8BXA0OWPmoo3bpa/ql3dOlNbH68e2ygKfo
 wGBcK5mhhPGK6mz+Vb+HXelBihO9WRJ7p7qWEMsN7gT+5Xcon39jXwQRe/iRG7bvr4+g
 4UHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736689599; x=1737294399;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vdPpMH3EB/gIvZxidNjtZ/XKsVJM/FqerzgsImOH6b0=;
 b=Uya1l9aqaNAPNRUy+BJWaKV+Xk4sv5AqSncI7LYn4FKBL98CujgfWfccBcQfNsQ99k
 cXyRHlwuNVMov8P2qQBMcnNDWQwA47z48oaxjvMluYOQ3RwftLUweKtOqLez4KHFy1fm
 tz00LKaNBKZTHkVEYJZW8/tkldcLzJDPFXGocC3VBy7tVl6R7kv+D6/74r5peUhcMgPB
 O3u37G6SPab3HS4KP0PuOMwLgvQeFtBdFNf+QsdhX448Tyybhk2Ig/7XNkIIji/u8/Sn
 zGdtTKq9Q+aAIBgZ5P7y1OiMJaKv+JS1jCcEXmWSBrAxcAgBcJYTpJrZc3vQ5vX/kr4m
 nCpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwUJptVIIkemXk6ynWAADXnhKcnw2HRDb4wFM78TD3MUJ70rY118QTfomd2Y9wE/tpOsNSVxsXqmg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzaoae01Bb3NiA6b4NZmILiGtLJy1+0HvXzvjKfNTWMcTyipAcO
 405+RVIxSNc4QyoBxSOcfbWiVkqnTJ5PCPwjeJI5G0H/TPH/xDgGqp7Lwjz8OwI=
X-Gm-Gg: ASbGncu3x9g7Obn9TflGteb3Upz5EcFtAXiWLg+t5mkA44OFla2f8fRBu6H6x/clXdh
 O8APOe30oaMt7d9m+o2EsTLUA42cJKejV2py3nyUShlMK/0dy+Xr9ml4ozbBsVbw9auXajo3Tts
 E5Jd9IADKMUcMlgVBsuWwE+BkAYu4rbBIbY2zJ2Fus+peGobzk7da7xZDsqoZMD7KGb0nY29akn
 zS8U/H9O+BacueNUcf3W24ySUQx+JHzM41rFE0jqgCRuK9I8V43BypPuuMS5aYOAay5LDI=
X-Google-Smtp-Source: AGHT+IGMaMySK+AzczYWaado8bQXerWOI16nG+e9W1R3XECS4GCbYRudIN5tZNNHFbXoJHhLI8HzVg==
X-Received: by 2002:a17:907:1b05:b0:aa5:3e81:5abc with SMTP id
 a640c23a62f3a-ab2ab643defmr680650766b.1.1736689598955; 
 Sun, 12 Jan 2025 05:46:38 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c90638acsm371051266b.20.2025.01.12.05.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2025 05:46:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Helge Deller <deller@gmx.de>, linux-omap@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] fbdev: omapfb: Use of_property_present() to test
 existence of DT property
Date: Sun, 12 Jan 2025 14:46:33 +0100
Message-ID: <20250112134634.45991-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
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

of_property_read_bool() should be used only on boolean properties.

Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
index c3329c8b4c16..7010544e02e1 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
@@ -3933,7 +3933,7 @@ static int dispc_bind(struct device *dev, struct device *master, void *data)
 		return -ENODEV;
 	}
 
-	if (np && of_property_read_bool(np, "syscon-pol")) {
+	if (np && of_property_present(np, "syscon-pol")) {
 		dispc.syscon_pol = syscon_regmap_lookup_by_phandle(np, "syscon-pol");
 		if (IS_ERR(dispc.syscon_pol)) {
 			dev_err(&pdev->dev, "failed to get syscon-pol regmap\n");
-- 
2.43.0

