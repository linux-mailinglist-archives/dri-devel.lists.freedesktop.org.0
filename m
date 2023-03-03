Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAF26A99EB
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 15:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B0F10E643;
	Fri,  3 Mar 2023 14:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8CA10E637
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 14:53:24 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id a2so2917100plm.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 06:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lSVWR2ldWXx4P8cCL/XZK7AfqlWbO+endEWxs3RHKQk=;
 b=HOIo+MdVrJ4SOatlLuBNmjwPVEuNr4Za4GxmeEsBZ8rgGdKhkPIU7wtSSt40FhUKoK
 Wft1Ou919u9KwRWLS/04tOvXZ1Rk53cLwaav0j0Ler5iXZXMNiKlcnlHQegmX6CvhtoX
 ybLlgUp/7KkeWUxDX4dVs5W9wmnlIJ9PW1imM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lSVWR2ldWXx4P8cCL/XZK7AfqlWbO+endEWxs3RHKQk=;
 b=OZV1OigEA0KEG6ifAWsk8eK7ENXZfUoYdUnk8K/gdFhUjp6AKp8ocGnL50D5dpOCm7
 vXezUufeHA4qrtmcZfvZy3hwVb/RQD7rRXau9VDXtv1a0qsiSPgawxeCFVjpVf7p+BEh
 XacftW2lN774KSZT8jdi1p6G+Bhu53AwYWDgQmcOhM+WABbuqQbV/3+vVTQuN4adInJk
 ANgp3Ok36B3OJJ5TC77vaHtdSKtL2r0EmiyHJEd0A6/4EU7L+AaAqC6YdTMjOUg5uSMZ
 SgbFqIcPEjeWqcfrbhe0AYI7E7df997SzMRE4/t4vJKWnnSAJSbLwW5alDB2ZpbKdgwe
 PNUQ==
X-Gm-Message-State: AO0yUKW3XK8aOgC3Xuxe7HdBPaIUkhHnChdl8u0PjJA8hhTHjohytGux
 bz8qXVvA22d0zEyGK+AQIDrz1Q==
X-Google-Smtp-Source: AK7set9Hc+DuqKvnoWeZ2wrV7xHKyh41mJrL6Z7VjglZXsp0yyKIB1B+dBYdB2NYCwbwQuBs9DdEvw==
X-Received: by 2002:a05:6a21:8693:b0:cc:f9f2:3047 with SMTP id
 ox19-20020a056a21869300b000ccf9f23047mr2042322pzb.52.1677855203801; 
 Fri, 03 Mar 2023 06:53:23 -0800 (PST)
Received: from localhost.localdomain ([183.83.137.89])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm1660856pgj.52.2023.03.03.06.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 06:53:23 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v15 13/16] dt-bindings: display: exynos: dsim: Add NXP i.MX8M
 Mini/Nano support
Date: Fri,  3 Mar 2023 20:21:35 +0530
Message-Id: <20230303145138.29233-14-jagan@amarulasolutions.com>
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

Samsung MIPI DSIM bridge can also be found in i.MX8M Mini/Nano SoC.

Add dt-bingings for it.

Reviewed-by: Marek Vasut <marex@denx.de>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v15, v13:
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

