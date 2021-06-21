Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B03E3AE416
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 09:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A58A89DBC;
	Mon, 21 Jun 2021 07:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E10489DBC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 07:25:01 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id u190so9592334pgd.8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 00:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+FXbFtToGuPHtOxGpIr0dvHdivz/Q1z9OEfRP1dWFro=;
 b=ownqbAde7ibUTXmaomPwWhKWAEcCtoFyPt61G9Xb2vNCBoM++ysOgTju/3C/+CFCOn
 wf+51wtlD0MKRS1pOFsy+y9UTYr9YYc6ZSrONuFx1q+St/UYyD8LaAu1u6oEGj6rarHZ
 kJ8TGz5wvPUXxuLJIa0VLSryCqeWeu8KFJVC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+FXbFtToGuPHtOxGpIr0dvHdivz/Q1z9OEfRP1dWFro=;
 b=lkYxYgN3YZL7CsyVg4+La+NMAHtmVkxsgB53kSdig+0Ydbd1Zzqyw6gbcHEnOOyQCR
 yeuJXXJw3AHIEOiUKrcrrgsSA99ekzQDMofxne/0jHo21u/eOnCMNLwBp/+B21nruUs8
 DBsOyd6jJ2wxYwmgrQEBJwGFAIfQkAcDMDpyszmxJPzzLGl0xY7sAgLTlL+YKZx7NAV5
 sZ+AAxifsEUQmIXKrQbX18k7GJXxdtqfEleKn63ApdcEmr0kVZrUSs/Mft8MvqQH5haD
 G1BAJCevn9cOe8ZDIfK9L5G3dSOeR1G4lA5NyWGGOSwp6vChuGmweSwGG5NRcn4MiWj4
 UgtA==
X-Gm-Message-State: AOAM533qdHm2nVhVXW747dyvoTAR/iZ/yfu1ukgKlq2LO/VN4vu0dREB
 VBSUb1v8cFyeFicMEZ9y1o1Jnw==
X-Google-Smtp-Source: ABdhPJyR1XX4kE8GVc5LSmw4hAodEITo1Dr1v/NraHJ76cJclVLPD+cShV85kMW3fABma1FQT+PvkQ==
X-Received: by 2002:a63:ef44:: with SMTP id c4mr22275167pgk.162.1624260301131; 
 Mon, 21 Jun 2021 00:25:01 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:139:e97f:a55d:7f66])
 by smtp.gmail.com with ESMTPSA id
 21sm13951294pfh.103.2021.06.21.00.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 00:25:00 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Tomasz Figa <t.figa@samsung.com>,
 Fancy Fang <chen.fang@nxp.com>
Subject: [RFC PATCH 3/9] dt-bindings: phy: Add SEC DSIM DPHY bindings
Date: Mon, 21 Jun 2021 12:54:18 +0530
Message-Id: <20210621072424.111733-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621072424.111733-1-jagan@amarulasolutions.com>
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Milco Pratesi <milco.pratesi@engicam.com>,
 Anthony Brandon <anthony@amarulasolutions.com>, linux-phy@lists.infradead.org,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Samsung SEC MIPI DSIM DPHY controller is part of registers
available in SEC MIPI DSIM bridge for NXP's i.MX8M Mini and
Nano Processors.

Add dt-bingings for it.

Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../bindings/phy/samsung,sec-dsim-dphy.yaml   | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,sec-dsim-dphy.yaml

diff --git a/Documentation/devicetree/bindings/phy/samsung,sec-dsim-dphy.yaml b/Documentation/devicetree/bindings/phy/samsung,sec-dsim-dphy.yaml
new file mode 100644
index 000000000000..c5770c8035e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/samsung,sec-dsim-dphy.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/samsung,sec-dsim-dphy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SEC MIPI DSIM DPHY controller on i.MX8M Mini and Nano SoCs
+
+maintainers:
+  - Jagan Teki <jagan@amarulasolutions.com>
+
+properties:
+  "#phy-cells":
+    const: 0
+
+  compatible:
+    enum:
+      - fsl,imx8mm-sec-dsim-dphy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Phy Ref Clock
+
+  clock-names:
+    items:
+      - const: phy_ref
+
+  power-domains:
+    maxItems: 1
+    description: phandle to the associated power domain
+
+required:
+  - "#phy-cells"
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mm-clock.h>
+    #include <dt-bindings/power/imx8mm-power.h>
+
+    dphy: dphy@32e100a4 {
+      compatible = "fsl,imx8mm-sec-dsim-dphy";
+      reg = <0x32e100a4 0xbc>;
+      clocks = <&clk IMX8MM_CLK_DSI_PHY_REF>;
+      clock-names = "phy_ref";
+      power-domains = <&dispmix_blk_ctl IMX8MM_BLK_CTL_PD_DISPMIX_MIPI_DPHY>;
+      #phy-cells = <0>;
+    };
-- 
2.25.1

