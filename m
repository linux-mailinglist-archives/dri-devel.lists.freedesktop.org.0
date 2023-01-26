Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3FF67CEAE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 15:47:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B4710E92A;
	Thu, 26 Jan 2023 14:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6F010E92A
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 14:47:47 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id jl3so2001347plb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 06:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FKvIfsgTCLn2iGe+HpUVx9o6FL0YoXL442NeJHKNz98=;
 b=X29/6osZcjOtOFC3eOXcmKegkdt5nLJA5TpQngO3n6xH1dUg+tytfzZThy11s/MN/b
 wrQktVIfqeU4cCD2UmtJVqbF3BnleC94tu8sjdQlAsGzGCT+SVCE4p83q1LLPLnefMdt
 Ypy7D3kWWtRZaM0bCjJGH/TGC1AGlYce+ArC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FKvIfsgTCLn2iGe+HpUVx9o6FL0YoXL442NeJHKNz98=;
 b=e33aa/dL2fV/2Lo4RqH3KhYUkWahYb0aZaASlEq0xBYKH/ar4+PU3OCSNpl5axdyCn
 bhrXdqeaf3ASAaQcDOYSUWzUTgW7dSk2YqKuywAXIMIy80A0CtvqO/QQ2w3x8fJGZH0Z
 wlCEaH2kCb3Hc7788re+Xu9GKo7vm5zyltjjc7ZR61iy5A9p85dobLnew1e3DzjH7gHo
 /4HhuwqLvwKFBAq+FKoI8zC2MLMeyMgkldJ7gcIOGBPXVSKR8ku7TtwgM+rAY9OV+fuj
 L1kA6YfW6y8TBR/uOZdlBNYSeNW5SZVW3fVJM64UfG3r5gVO1Zy/HLUHOpHX+CQW1eQ8
 ssiQ==
X-Gm-Message-State: AO0yUKXhqgtfIoIgnfjZTtmDEEJ3Jw3yqBHv2xLZkBu0tvBdPsb70FYD
 pyvtLaY9q713oInyxbPsKKS+cA==
X-Google-Smtp-Source: AK7set8wiMGoS8PVtAcDz5VuT7TAfu74EE9tHJ2M1XbqS6aOtXVUMjlQ7DaXK2j9N9sy4hFYZBu3SA==
X-Received: by 2002:a05:6a20:7d83:b0:bb:cf2f:3b09 with SMTP id
 v3-20020a056a207d8300b000bbcf2f3b09mr8154537pzj.51.1674744466787; 
 Thu, 26 Jan 2023 06:47:46 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a238:3cb1:2156:ef87:8af5])
 by smtp.gmail.com with ESMTPSA id
 d197-20020a6336ce000000b0042988a04bfdsm823660pga.9.2023.01.26.06.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 06:47:45 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v12 15/18] dt-bindings: display: exynos: dsim: Add NXP i.MX8M
 Mini/Nano support
Date: Thu, 26 Jan 2023 20:14:24 +0530
Message-Id: <20230126144427.607098-16-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230126144427.607098-1-jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
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
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Samsung MIPI DSIM bridge can also be found in i.MX8M Mini/Nano SoC.

Add dt-bingings for it.

Reviewed-by: Marek Vasut <marex@denx.de>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v12:
- collect RB from Marek
Changes for v11, v10, v9:
- none
Changes for v8:
- add comment to include i.MX8M Nano.
Changes for v7, v6, v5, v4:
- none
Changes for v3:
- collect Rob Acked-by
Changes for v2:
- updated comments
Changes for v1:
- new patch

 Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
index be377786e8cd..5133d4d39190 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
@@ -7,6 +7,7 @@ Required properties:
 		"samsung,exynos5410-mipi-dsi" /* for Exynos5410/5420/5440 SoCs */
 		"samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
 		"samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
+		"fsl,imx8mm-mipi-dsim" /* for i.MX8M Mini/Nano SoCs */
   - reg: physical base address and length of the registers set for the device
   - interrupts: should contain DSI interrupt
   - clocks: list of clock specifiers, must contain an entry for each required
-- 
2.25.1

