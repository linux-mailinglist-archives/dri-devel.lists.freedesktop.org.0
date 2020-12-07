Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0F02D2635
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AB66E9D3;
	Tue,  8 Dec 2020 08:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D856E862
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 14:50:53 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id n7so9077442pgg.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 06:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Y4Yf/zppkktM8cnTiZUCQlAYgq8mTIxwfKXhAD+iUPQ=;
 b=FVYgChdQ+ZghVAnu49CRn9dwxAqn19kJ722RC81D1HiK0DqBTpj+RzAn80KevB4qVX
 DFO1h2U419+79kEvD2RtngJ8SKFXFhanms7JtzShhAMnUNm1zXBTNMNO2/li+5r5ybkY
 sH2Ccsp1mjetJj/yw9dwrXhwYKu+xLkERodr6KpNSYLhxW2ioC4IQlidVrICfilVtgkk
 cZYJQMYvNbHSXCrPbymho4nkwPmL5/bBi/gvYDMSSFe6Sn9x15DgzohuRfTl4iM9ygj6
 2CjilhFIxnU+GVK0yduZpJyw542BasNhZKpnx7jJWlhq4TCSo5cz8KJZ0tlm4WKG7yao
 am/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Y4Yf/zppkktM8cnTiZUCQlAYgq8mTIxwfKXhAD+iUPQ=;
 b=tUyut1SROfb6fZ+oQFq4C+9SNsr51VfJ+a7obVegpsFTrMJoMKTHy5amxauoBs62Mj
 BG1UASbWKKq+vIsBwVMZU7RN2rYhXMRfiBqtum7MfdbIM9nzBqR4gqcrRv2AIh2ASgPz
 tmCnH6LIlVnOWfwPs3iWOOOWSu3UvjooOp3FIfdtdIZei/S7unOJNN9ipFoDvOndo5LN
 T8zPnGVZsB09hJdbw8VT5EZCZ+bB3ancPhyNIZF9XAiFYP9BwzfmLRCN0UWUJjSkihxt
 JKj0I9FkxxwQRtZLlrd/HLVw5loFDyu4HNVI4dHSkyUoMWKEXc5Jm5ml2UGiumVLCWlM
 xn8A==
X-Gm-Message-State: AOAM530t7zj4SXYpAE36ozon9Ke/+F7cTR8Wt13hCTLgbAWD05SdCfz6
 aXRY3Jtw0L7iaOd+li1Lw5k=
X-Google-Smtp-Source: ABdhPJxq2D16/pq/CJQ8sTcaJ4p+SmhSJJF6uQ8nEKGX6Be4VAdG1BTwj9GAXWr2RJOMFQShiggThw==
X-Received: by 2002:aa7:8205:0:b029:18b:3691:e447 with SMTP id
 k5-20020aa782050000b029018b3691e447mr16061164pfi.69.1607352653515; 
 Mon, 07 Dec 2020 06:50:53 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id u25sm10360249pgl.68.2020.12.07.06.50.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Dec 2020 06:50:52 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH v1 5/6] dt-bindings: display: add Unisoc's mipi dsi controller
 bindings
Date: Mon,  7 Dec 2020 22:50:25 +0800
Message-Id: <1607352626-26088-6-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607352626-26088-1-git-send-email-kevin3.tang@gmail.com>
References: <1607352626-26088-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
---
 .../display/sprd/sprd,sharkl3-dsi-host.yaml        | 107 +++++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
new file mode 100644
index 0000000..f7ee6b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
@@ -0,0 +1,107 @@
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
+    description:
+      Physical base address and length of the registers set for the device.
+
+  interrupts:
+    maxItems: 2
+    description:
+      Should contain DSI interrupt.
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
+    description: A phandle to DSIM power domain node
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
