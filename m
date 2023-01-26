Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8559367CEB5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 15:48:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B9810E929;
	Thu, 26 Jan 2023 14:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A613F10E929
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 14:48:11 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id d3so1990549plr.10
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 06:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WWJre9MokG3OwazBJKO8AFvo6cc1OP5hw5VIrxt3xjQ=;
 b=LuI6OpP67H5DxxzNzy/f9orpV3i2pMvWTDYGBNdDw02li0Frn2nfgEd6Lpzg1sgz3S
 xBjMKQd3RVxgZZjN90ipW/IPhuoZr+vjEGC6hkRw7Yc+35Hf0cLCYVErGtg36+rvhKSc
 3NT4WSxCGc2rSznvQ4Lw0hg6BtjSIUfjSrrAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WWJre9MokG3OwazBJKO8AFvo6cc1OP5hw5VIrxt3xjQ=;
 b=qRkseTDTzRtoRffDgwOduSKdlhnGzYx977IqcIbrtTnx9O5ICgwH9/XCPPqaHZwKad
 JcFgAL/dYEhDFRagN+M23opTNQmE5k8sgMXGCiN0TUe4c3fSlIpZsqJEjPzpNzRwWjYP
 88js2avoXdEN4VBGx2TwhEjMI6KNgqa7cjNJOy1eqxaiHtOu/K8XPdwcb5q02CxtZgbF
 VQnj1nNCt3Yv9GwxBohl5n2zGbKgD7rqhoNs+ssoil4aKxtziAov2gR7lIi7iYfhq47M
 aavGSJsQXMoTDdrJ6fiPI37uHp8Hpl1XBzJLKjrFtj6Svz8oJnq3EXO0+zyxA/7OL095
 EgnA==
X-Gm-Message-State: AO0yUKXUqL40/p7y4cZ8h9Zku/m2f6HMH3Ua2F89eyezn67WAYeNjte/
 VSYJoW1YDdlTIi8ksMebQV3vUQ==
X-Google-Smtp-Source: AK7set/GdOWdGOkGUzErY4GPI2EXHPei2U02oxcKkoPna8tnYMtQ0aF3vC8ST2FEWFeJMqW6jz/zug==
X-Received: by 2002:a05:6a20:3943:b0:a5:7700:2a4a with SMTP id
 r3-20020a056a20394300b000a577002a4amr2862336pzg.51.1674744491317; 
 Thu, 26 Jan 2023 06:48:11 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a238:3cb1:2156:ef87:8af5])
 by smtp.gmail.com with ESMTPSA id
 d197-20020a6336ce000000b0042988a04bfdsm823660pga.9.2023.01.26.06.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 06:48:10 -0800 (PST)
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
Subject: [PATCH v12 17/18] dt-bindings: display: exynos: dsim: Add NXP i.MX8M
 Plus support
Date: Thu, 26 Jan 2023 20:14:26 +0530
Message-Id: <20230126144427.607098-18-jagan@amarulasolutions.com>
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

Samsung MIPI DSIM bridge can also be found in i.MX8M Plus SoC.

Add dt-bingings for it.

Reviewed-by: Marek Vasut <marex@denx.de>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
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

