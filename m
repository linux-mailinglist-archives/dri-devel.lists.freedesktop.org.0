Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E659364C991
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 14:01:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C112F10E3FA;
	Wed, 14 Dec 2022 13:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E948C10E3F4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 13:01:22 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id m4so3257612pls.4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 05:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sNhfKLGMsZ0aggFiEANW2mfqP3edcefEl83mZ67A658=;
 b=NzvqmR13ABf0HU/dZrVYG/X+6PULFtHpNFMSp8qDMhxBQySaoKLxl8GVUMAdKQL0Ju
 KhZ2TO/OLGQet0AvSAsnEIoDFlphcfplZITEcrdlU9z5cpjk46ZYyWVnf+DPd62Wjz2S
 7lbz+xL7hsXIkV/2NBHFy13Gk8CA1yN0oynwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sNhfKLGMsZ0aggFiEANW2mfqP3edcefEl83mZ67A658=;
 b=NfLJhWfI5moWIAXbFNG2yucfeWjQ8alg2HhhzZNSEeD839IExtVyBH8GfHEgS2ak3g
 eyTuVJL9LucaI2pPozbDPkvMSbNS54krz0Dkn4wcKdGwH+AlgkwCTbwEcdhhjSE+Nohb
 c06nzOgzMDGCTUSudV/PCAzn1vaVy2Tp3JUphEKJpqMfaMveZDuHyZuoKd71vADWtqjB
 RmkIllws1JYfo8IBOdf7i7esDVj6i8bnoCSU8xIHVrsta1Taj9nnZcLHvdIxYnHlbY/x
 OmXbFla6TVcpkeU5n67wWpojSgmXfXeFvg6PVNT4KJPBnOsM9ZYFQsErYgRn+Bdq8C75
 uTFA==
X-Gm-Message-State: ANoB5plMBFzNG1QC585n7iZUCyYfrrAqyoDY4TI+fanpqa3SuRlMgb7F
 QTseMtcnylTtULogwTA0NSPXHg==
X-Google-Smtp-Source: AA0mqf794GIVCP9QXOkaF5DGeOHnxtj8JFhFsZrUbCy7YWo3OTZn5ApzeZ5lwf71KRRAasNlbJb/AQ==
X-Received: by 2002:a17:902:f243:b0:189:8c6b:8ed7 with SMTP id
 j3-20020a170902f24300b001898c6b8ed7mr21419574plc.21.1671022882468; 
 Wed, 14 Dec 2022 05:01:22 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:5e03:faf:846e:352d])
 by smtp.gmail.com with ESMTPSA id
 ix17-20020a170902f81100b001895f7c8a71sm1838651plb.97.2022.12.14.05.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 05:01:21 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v10 15/18] dt-bindings: display: exynos: dsim: Add NXP i.MX8M
 Mini/Nano support
Date: Wed, 14 Dec 2022 18:29:04 +0530
Message-Id: <20221214125907.376148-16-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221214125907.376148-1-jagan@amarulasolutions.com>
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Matteo Lisi <matteo.lisi@engicam.com>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Samsung MIPI DSIM bridge can also be found in i.MX8M Mini/Nano SoC.

Add dt-bingings for it.

Cc: devicetree@vger.kernel.org
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v10, v9:
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

