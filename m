Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E32DA8261E3
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 23:19:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C24F10E0E6;
	Sat,  6 Jan 2024 22:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE2010E0E6
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jan 2024 22:19:14 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7b913830d8eso39451239f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Jan 2024 14:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704579553; x=1705184353; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TYXO0TXmrPEwqq+/MbuU+qZou0rkBxurEPhJUKxALbc=;
 b=IdssUEpKbJ8sGNf/ED5CTp0dfu05mgHZSOpxwrgGMjk/C+e/HR7P5yXNOTHCdGNYxL
 KZMyj4Va5bsOsZqvMLpHJu8j6/Rz4qJMV5kU3fiH7quQMZvdmIOa/7dxcTguP10J50Q5
 oT1QpuC1WXsV6IUBnDYfujUmJHQYtk1DaN08Si6ySdJOK9/48UlxZPGhj9QM0du4oFdB
 aRyahNX44VwseoLiTau7Zlf4LeXQ7bZ63jxQoR91nVF85N5TshfBYacISSTuxiVUNqoH
 zpBk6VRl+7Y5GkKVhMdN025hRkhkYd4WHkgCW79ruvpl2OkEfzrgDaYA3/H/syWKwfxV
 kAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704579553; x=1705184353;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TYXO0TXmrPEwqq+/MbuU+qZou0rkBxurEPhJUKxALbc=;
 b=vMnFNjkCZWmwXcGx1ev3hP9yA40tonEj58gnKmnU4Q2EBOmzfGxh1sIxBGH+QWbP10
 i+M+7/XQWpVzVjADGWh7B2NjcS+onV5W1m6mthADqoeCs+4yShvYUR4TO6MKyBjKR00b
 6zPuxsrpXqR4U/OisyfnChS22M01VEWxxcFDaANgh6HEJXmHJASKfAdeNDpwncQbu/gJ
 ELFqcoTzjA3Ci32KzUMyOIISti1BNaMAgqBmfwYgRGny5fCmy01S43sLNkadFjwZOK3A
 QIZwllMD43vXNqjn1Oqxg0/pKXNf3aBWvzW/0CNn8T+RhH/QWc0Lc8Dd+ELYL4YruQ0u
 sx5g==
X-Gm-Message-State: AOJu0YzZ433Pxm330zq/8njObyKUDKifgGrFePpZuKjMSg/xvdGH5Od2
 /5f3oaB/Mw+Rf8tmZViJycvV4UU9xQ8XFQ==
X-Google-Smtp-Source: AGHT+IGIt5Rt7HY/t7nCMCZDgRKKmmyUrOXO7GhHrgaSGRvAS7zb2V9Gd2Gt5+TSM/tEeODoTGFjeA==
X-Received: by 2002:a92:cd8c:0:b0:35f:e0a7:8892 with SMTP id
 r12-20020a92cd8c000000b0035fe0a78892mr2198542ilb.8.1704579552892; 
 Sat, 06 Jan 2024 14:19:12 -0800 (PST)
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:af2f:17f0:33a3:d6fe])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a92c94d000000b003607ff64574sm679751ilq.64.2024.01.06.14.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 14:19:12 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 1/2] dt-bindings: phy: add binding for the i.MX8MP HDMI PHY
Date: Sat,  6 Jan 2024 16:19:04 -0600
Message-ID: <20240106221907.325127-1-aford173@gmail.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lucas Stach <l.stach@pengutronix.de>

Add a DT binding for the HDMI PHY found on the i.MX8MP SoC.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Adam Ford <aford173@gmail.com>

---
V2:  Rebase on Linux-Next
     Fix bot error due to the word 'binding' being in the description
     Add phy-cells to the required list

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml
new file mode 100644
index 000000000000..d1b941b48151
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/fsl,imx8mp-hdmi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8MP HDMI PHY
+
+maintainers:
+  - Lucas Stach <l.stach@pengutronix.de>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8mp-hdmi-phy
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 0
+
+  clocks:
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: apb
+      - const: ref
+
+  "#phy-cells":
+    const: 0
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - clocks
+  - clock-names
+  - "#phy-cells"
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/power/imx8mp-power.h>
+
+    phy@32fdff00 {
+        compatible = "fsl,imx8mp-hdmi-phy";
+        reg = <0x32fdff00 0x100>;
+        clocks = <&clk IMX8MP_CLK_HDMI_APB>,
+                 <&clk IMX8MP_CLK_HDMI_24M>;
+        clock-names = "apb", "ref";
+        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_HDMI_TX_PHY>;
+        #clock-cells = <0>;
+        #phy-cells = <0>;
+    };
-- 
2.43.0

