Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E85B6B0F05
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 17:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C686010E6A0;
	Wed,  8 Mar 2023 16:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E02610E6A0
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 16:41:44 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id a2so18225896plm.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 08:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1678293704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J9+K68vVGYL1y84MUHSGLcc6/sOkj/n+u3A2GeF9GDk=;
 b=LyD5OkG+oDGFHYnjo7L/MU2f4woTjPrWPG5HCnfMvPKHNn1kJwDots4/Q78eS8nGiK
 irICwGdQyLCTRIQ7LHhCFZ60ZOa/RH8MC5yCxuBt4E0F8CDlr0WKc23yPUmJTy/WC/eM
 yml80n0/Hs+It5b49kgpVwpNt4ktxqKAl04zM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678293704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J9+K68vVGYL1y84MUHSGLcc6/sOkj/n+u3A2GeF9GDk=;
 b=Z8o2oTp1TzAqnC55a4cSrtv4f4C75raMEH91gehnoewZw1wdk+S1LIu91A+bEu3ygS
 ZANV2+SDNHlWF11dmjLMkpIcBvdfTfJph0BIU32mthCDOETn9NqQcuWDH0INWBoXynj0
 AyTdGvjsXvjLvLeD8GfOMGaY7JRe4t3MD9YxXaBcSfF9HHGen8b1mzfOP5noRbUOit4q
 6XqwHe9v+Ecu2NZ/e+CyO/cSG0uAJsDKMYHX9NGa1++dUEiMBf72EdiFxFdlAcOAE3Zs
 5DwYkhBdoDp/xztafy+D0Jn7eykuUleB3BXnzoNQJTcBgz7gqPATrI+J1jdtrncxXGJJ
 fn7Q==
X-Gm-Message-State: AO0yUKW8ksRnZvMP2ehg0ShBxIPpT3iwph483s0Bqrz5hhHeef+FCyal
 Cxs9lV0zowtFITo4paGehFlGJQ==
X-Google-Smtp-Source: AK7set/XTT9PAjpGeHLRBQHmwct361q7u2vrIGqZZUt2Qxs5J5im1FIxTWtXvU2kCtDrW1PWg3FKZw==
X-Received: by 2002:a17:902:e546:b0:19a:7a02:7954 with SMTP id
 n6-20020a170902e54600b0019a7a027954mr22606648plf.24.1678293704092; 
 Wed, 08 Mar 2023 08:41:44 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a8a1:b545:91cc:80b2:f9fe])
 by smtp.gmail.com with ESMTPSA id
 kq3-20020a170903284300b0019b9a075f1fsm10046540plb.80.2023.03.08.08.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 08:41:43 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v16 15/16] dt-bindings: display: exynos: dsim: Add NXP i.MX8M
 Plus support
Date: Wed,  8 Mar 2023 22:09:52 +0530
Message-Id: <20230308163953.28506-16-jagan@amarulasolutions.com>
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

Samsung MIPI DSIM bridge can also be found in i.MX8M Plus SoC.

Add dt-bingings for it.

Reviewed-by: Marek Vasut <marex@denx.de>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v16, v15, v13:
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

