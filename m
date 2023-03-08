Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7036B0EFF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 17:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE30E10E69F;
	Wed,  8 Mar 2023 16:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A906510E69F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 16:41:32 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id u5so18189385plq.7
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 08:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1678293692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yA/0m9HX9foD5OsXPqpJ1qNeqWR5nTK0/7XKzFPjjFc=;
 b=h2Rwk/NSxHaub1515G7VtNh6GovUpIyxwV1voyNKLeJNB/0IJsyjbuT+Axadurqz40
 6EyPtV7991OBZ/Mm9HjYy5C/4S3v3OlwKGsmRVW71oR1Wom4VIF1L/bx7aRujAcgiVbA
 S4JPgr7+TDpKDpuJWvgLMsvBqeZ4I0JnWLcq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678293692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yA/0m9HX9foD5OsXPqpJ1qNeqWR5nTK0/7XKzFPjjFc=;
 b=aHGRHl9GbgbadZTprLEYXphzufOy3VFV0aILYyhcRC2R4Mo1rCp0dq6rmuoGkmyzCx
 +nG3rD97PYz9EBMf5QVal9esS3aRFzIjd+k+e+dIjRi4PALNtCyMcvgHD6GUfQn4cdRl
 cO3JoWDySIyGJYwbZ3xLl9yfwy9bcjU2JrgWIxEe6vu2ywOolO3w/Yog7ovYfJmBJRd6
 yvP1DOv/oHgzIZ33/LhBH8F5bIS51bpb8EUWqwOLZ4mNBdSQqZ9bXSf3FOuxB61xwqq3
 KoSXhzHHa0/L+T/Em6IOF1NqUC5sSon7MHSS7v8sPUgK+hyNnUHIRyCl1CfoBMnZZNfq
 Nv3g==
X-Gm-Message-State: AO0yUKW8ygvd4K1yqd0oUscyEQoz/TKaRgWegAUlJ5PAL+nKGHfrXSXI
 CCdbpzcmsgotXFLpxMDeZtgIRg==
X-Google-Smtp-Source: AK7set+oq82F39PH9WODFywTipgBEiRtljpJHN+rdEWK3QPCCCKF13vl6CXZK5IqjpP5gjDBCdE1lw==
X-Received: by 2002:a17:902:e5c2:b0:19e:7d67:84e6 with SMTP id
 u2-20020a170902e5c200b0019e7d6784e6mr24056057plf.0.1678293692211; 
 Wed, 08 Mar 2023 08:41:32 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a8a1:b545:91cc:80b2:f9fe])
 by smtp.gmail.com with ESMTPSA id
 kq3-20020a170903284300b0019b9a075f1fsm10046540plb.80.2023.03.08.08.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 08:41:31 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v16 13/16] dt-bindings: display: exynos: dsim: Add NXP i.MX8M
 Mini/Nano support
Date: Wed,  8 Mar 2023 22:09:50 +0530
Message-Id: <20230308163953.28506-14-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308163953.28506-1-jagan@amarulasolutions.com>
References: <20230308163953.28506-1-jagan@amarulasolutions.com>
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

Samsung MIPI DSIM bridge can also be found in i.MX8M Mini/Nano SoC.

Add dt-bingings for it.

Reviewed-by: Marek Vasut <marex@denx.de>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v16, v15, v13:
- none
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

