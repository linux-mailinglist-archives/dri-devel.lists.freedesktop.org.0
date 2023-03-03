Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0BF6A99ED
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 15:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA7810E645;
	Fri,  3 Mar 2023 14:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3464C10E649
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 14:53:35 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id d10so1613212pgt.12
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 06:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aFgIQAMuyZazPwh+w9FQPp3RlQJAADjiFirtQ1jHy78=;
 b=ZvC7/Z71AUeXkRzmQEA8vCHIra0nIDp45hi5AdET2I3KkXt5q3HfVG5STTeKg3nfOK
 2pDXwIm4xe7bSLO6XqztSISHUfHS7Mm9M/NjTbh7NXsgGJYfMYoWws6NxBn5dn8TsAje
 bss7TKllIV/FyUSBMZ963YQIcoRxSihjqPLsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aFgIQAMuyZazPwh+w9FQPp3RlQJAADjiFirtQ1jHy78=;
 b=N8SK6DZXTPZNwPlcKI9bhkrUTh8LGESTXpt80NmJ6mkOcPj8vNHY9nJgNCLYqTgRK/
 sVbis0iDqi6eqmkkJASZW/wLUEhGBXfc2DdxUAZ4QcZsPYcbjn2u/8tBh+7ZOwy5Oc/c
 o9AjdAcmuhBw606Ex5qSil+WgNc+igtpStxTnLn1f0JgGNiXw2+wiVHtKzExFfs8Hp7V
 d0hAx17t7jfh4Fa5AVNnx+VziPZIqFsTXZ2cfJwiUJ7slZaiJ42lExf7UFPIFhsxhTsg
 RJ2fstalw36jWKUxI3vKzKvFpIJdpHb9PSHzh7ogbqzGjicrnUycpSsLJrzkwi+Ltf+C
 235w==
X-Gm-Message-State: AO0yUKUw6Hhhy3hUujqFFF1wmviY/0qVbYV4zEnDG3trXWCQbG0Cg3mv
 V0C5XxoNIW5OnU5CEe+4fczzxw==
X-Google-Smtp-Source: AK7set9SS0WXM0RzkfwW0xKNrL3gnO9oeSxvaJV2Hvs9p7ObZzqw3Gez1Ny9ECQXsOAUECAPhc7Z1Q==
X-Received: by 2002:a62:844d:0:b0:5ab:c004:5fc9 with SMTP id
 k74-20020a62844d000000b005abc0045fc9mr2667942pfd.17.1677855214809; 
 Fri, 03 Mar 2023 06:53:34 -0800 (PST)
Received: from localhost.localdomain ([183.83.137.89])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm1660856pgj.52.2023.03.03.06.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 06:53:34 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v15 15/16] dt-bindings: display: exynos: dsim: Add NXP i.MX8M
 Plus support
Date: Fri,  3 Mar 2023 20:21:37 +0530
Message-Id: <20230303145138.29233-16-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303145138.29233-1-jagan@amarulasolutions.com>
References: <20230303145138.29233-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Adam Ford <aford173@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Samsung MIPI DSIM bridge can also be found in i.MX8M Plus SoC.

Add dt-bingings for it.

Reviewed-by: Marek Vasut <marex@denx.de>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v15, v13:
- none
Changes for v12:
- collect RB from Marek
Changes for v11:
- collect ACK from Rob
Changes for v10, v9:
- none

 Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
index 5133d4d39190..2a5f0889ec32 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
@@ -8,6 +8,7 @@ Required properties:
 		"samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
 		"samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
 		"fsl,imx8mm-mipi-dsim" /* for i.MX8M Mini/Nano SoCs */
+		"fsl,imx8mp-mipi-dsim" /* for i.MX8M Plus SoCs */
   - reg: physical base address and length of the registers set for the device
   - interrupts: should contain DSI interrupt
   - clocks: list of clock specifiers, must contain an entry for each required
-- 
2.25.1

