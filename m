Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E7E4F9A86
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 18:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C900810E53A;
	Fri,  8 Apr 2022 16:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECD810E53A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 16:23:30 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 b2-20020a17090a010200b001cb0c78db57so6954795pjb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 09:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zevXHTigISY3S4Y7YWLt05sAPhFkf3znQwcUqUtkS7M=;
 b=l/g4lICQF6R00l5uTIWffbRdYBrOeUhRDZdCMyfNp+uxQnkli3zy4HDKPR5rVFfsi6
 2G4Zo6uhnpO5bWTQP1D5aDacvaZIUq/bM25lZheu5YI86G8y5HTg+/MPrwvC+04KlH88
 s9NzGfr99QrPHC9zs96kxB0naSxnbTgChxvh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zevXHTigISY3S4Y7YWLt05sAPhFkf3znQwcUqUtkS7M=;
 b=1TPSfrZb9lZL6gG+oKnN/t/UwRZh6RWa3IkHHL7OiL4IQ+iXnDP/JOdFq7+84rMgj8
 lLlc9l3WMWzchWiTVRX5z7WG7S0NEcW1/BdVd/+331Vl5snBo+GguAnJWO9bQOoCGUPr
 areIapt+cnR8aE5OlkhlPR8EYvWJbrGxHLOT21oYsR4BPaf3gvFPEHlNly3liex/Htmw
 w/zLtg/SuzbAL6Gf2CE5irp4to76ZiEVxZpJesYAy/SGPhulW1W2Qlv/wRMeMrV20ucL
 Eg8Dn2t80am91WYWjuFuu26XogUjwrSRKrh3WTKUD6LQnG/tbBCvjM1t6qukptC2SlgT
 4/8Q==
X-Gm-Message-State: AOAM530J1xM8f8CmzBFvfWJ/YShgzyDnUpPHZwlPeC5nogp1OsD0P+qx
 /DXAAbWB9CiUloqEwHXoLWpoTA==
X-Google-Smtp-Source: ABdhPJxbcNFz6feu4gz/RdE7X3DPLfhToLKj1lFn0nrHN3x1KnT3m4kix9EKiulW/MGlS1AGSCHY3A==
X-Received: by 2002:a17:90b:1805:b0:1c7:ba88:9550 with SMTP id
 lw5-20020a17090b180500b001c7ba889550mr22875005pjb.16.1649435010210; 
 Fri, 08 Apr 2022 09:23:30 -0700 (PDT)
Received: from j-ThinkPad-E14-Gen-2.domain.name ([45.249.78.214])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a056a0007d200b004fdac35672fsm24929863pfu.68.2022.04.08.09.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:23:29 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 10/11] dt-bindings: display: exynos: dsim: Add NXP i.MX8MM
 support
Date: Fri,  8 Apr 2022 21:51:07 +0530
Message-Id: <20220408162108.184583-11-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408162108.184583-1-jagan@amarulasolutions.com>
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
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
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Samsung MIPI DSIM bridge can also be found in i.MX8MM/i.MX8MN SoC.

Add dt-bingings for it.

v1:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
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

