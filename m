Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 188852EBB58
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 09:53:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB1F89D67;
	Wed,  6 Jan 2021 08:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319D46E104
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 13:46:48 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id x126so18368539pfc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jan 2021 05:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ITGq5XXvbi+yNr7BSlbWRzQTm7bqZ80outw2BLEk37E=;
 b=RZ01zhUXYyioHMu3b9cHDVAAtIEoHXrcsQqbkGE5LaMLfcyl18oHwZ5BljJLQPbdGN
 AAyfzFe4j+pTp6on5XZSN6nIPSs7M/J7wciC4AqMhyX4I/q+kxkcMUorqxNQ87IMT1A3
 B160TRS7Fl5aboQsGfo77FL8RI2Ch4ujkUZCok9tfHl5jLasIu7o8Nm4Do8O2f/gimfF
 cZFIlw5GzQKwMbsoABvCDLztcnItxBuDBJ+J7Lnpo3D+G4WwOOuKMgqyG9A3UHA1W35B
 EdDwJ2k6l3EvO4tUAVz8w9ktjVVqa/Rd4J5x3UNXjTXO9HUAMCroIk90EkFEIEMj7Coy
 XiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ITGq5XXvbi+yNr7BSlbWRzQTm7bqZ80outw2BLEk37E=;
 b=ncgchLip1+FxkLYWgwsK4XNdfzYg4Kpm2RJy7PJTZCdKaXiGhTzXfwK2/zLd2VzaXd
 CIKguReQW8ldqsMkkGCLGvOuAtWrxAPSuXCNtkaYd4IPimzbe2sOv18Lgosos9/1riTa
 Yg40HBpqlwRSaOiG7rmOZGIio5J8zwNkJx+hcNy2fBfM2urMrIAa5uN2Cw8ucqDQkzCC
 lONSldrPEzlzKTc+glyFipb5WsAyoKb9ERK3AO9fG368t8gzjx3Xdo50GtYfnL2fxDQ3
 vWRjCQUVZyEPgSMt1C51ESH1eETZQmME9yqjPx7gbrdkBG6gJWljuVZfdlYdtUwAKqG0
 +mQA==
X-Gm-Message-State: AOAM533jxZojC/cPLtWpMjbhf5+1y6tuUgZvcbRVauhVI+TXJpoRQOIY
 Eab/QDKXzn6ranTmsDbbIY0=
X-Google-Smtp-Source: ABdhPJxUcKIH5i4vIbC/bBQ3cvnVqC/L48yXPdZ4iWPBpBJ6W700melX2u/WmUJxId20lXSXP2M2cw==
X-Received: by 2002:a63:c5e:: with SMTP id 30mr61485858pgm.57.1609854407827;
 Tue, 05 Jan 2021 05:46:47 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id w63sm57582284pfc.20.2021.01.05.05.46.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Jan 2021 05:46:47 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH v3 5/6] dt-bindings: display: add Unisoc's mipi dsi controller
 bindings
Date: Tue,  5 Jan 2021 21:46:06 +0800
Message-Id: <1609854367-2720-6-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609854367-2720-1-git-send-email-kevin3.tang@gmail.com>
References: <1609854367-2720-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Wed, 06 Jan 2021 08:52:53 +0000
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
Cc: orsonzhai@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 zhang.lyra@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin.tang@unisoc.com>

Adds MIPI DSI Controller
support for Unisoc's display subsystem.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../display/sprd/sprd,sharkl3-dsi-host.yaml        | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
new file mode 100644
index 0000000..d439f68
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sprd/sprd,sharkl3-dsi-host.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc MIPI DSI Controller
+
+maintainers:
+  - Kevin Tang <kevin.tang@unisoc.com>
+
+properties:
+  compatible:
+    const: sprd,sharkl3-dsi-host
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 2
+
+  clocks:
+    minItems: 1
+
+  clock-names:
+    items:
+      - const: clk_src_96m
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    type: object
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        type: object
+        description:
+          A port node with endpoint definitions as defined in
+          Documentation/devicetree/bindings/media/video-interfaces.txt.
+          That port should be the input endpoint, usually coming from
+          the associated DPU.
+      port@1:
+        type: object
+        description:
+          A port node with endpoint definitions as defined in
+          Documentation/devicetree/bindings/media/video-interfaces.txt.
+          That port should be the output endpoint, usually output to
+          the associated panel.
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - port@1
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/sprd,sc9860-clk.h>
+    dsi: dsi@63100000 {
+        compatible = "sprd,sharkl3-dsi-host";
+        reg = <0x63100000 0x1000>;
+        interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+        clock-names = "clk_src_96m";
+        clocks = <&pll CLK_TWPLL_96M>;
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0>;
+                dsi_in: endpoint {
+                    remote-endpoint = <&dpu_out>;
+                };
+            };
+            port@1 {
+                reg = <1>;
+                dsi_out: endpoint {
+                    remote-endpoint = <&panel_in>;
+                };
+            };
+        };
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
