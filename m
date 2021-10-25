Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC1C439284
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 11:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DA389CD4;
	Mon, 25 Oct 2021 09:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A8D89CD4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 09:35:51 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id t7so10335009pgl.9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 02:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/nNkUI+dH8AtxQEgxzy9cBX4XHXv2DfxTs/bgyz0Ark=;
 b=Fy5NEGvmU3fy0LiiuoeyfH1kJNbMCByHStrRAMR2tsqJvXyfciZ8otKVCtYc+WWcFy
 gCu6MyUnzwtZHrftEWxICon0VnhdVBVigAA7W+bQGmPRFZGLPScyaDdpM5NojZ8jupdh
 MfZowZZZhvtdmjO2i1NIkfLXUZX6xjwRVlGPWq3QI4dlMOisODpi5kTR03t6QGHBHYrx
 /BrvZkQlDpFFUJUWZs7Kjo9XynLVvvCGIofoiJIkH8/OUGj0hiZB257V3Vb5VH4GtazA
 CLFbfVO5pIiAaJ+9uBFIFHeCzFG2E/u7PFGRVMgub1Ji80jTPPe10r3aiUVnWA1F52/g
 A5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/nNkUI+dH8AtxQEgxzy9cBX4XHXv2DfxTs/bgyz0Ark=;
 b=u3lSp1gsNWMUFCLwoDAeIvfY4FjIrIfvumtsh02dRzpCvQ4J26F2mDx58QwytwzaxR
 XU9EYk6/C5W3+2tHGjbY4Lmq+j3NIAEtJGpjcSLJtfdg61MHN4oO0uhYm+VEMMvhlHP3
 q06bC9rvsSpgzU6tvWGn3XQyjq+Rv8WgBR5C2Fys4zoidb9STtPd/Y1D3GmoiVtQpC5e
 JGQyGg4MnYlwvNbEO/eB5j3Ma4/wpLEsIhY+gZUnMmVrD6GBmOqfkMEX6Qcjkzvf6T7x
 d0hQvQdr2Jxijp4TdcUlojjZNzCAs3YsbUnuOaqx474vw9/8t8DQhGS2YXAfPfzA+LPR
 n8uA==
X-Gm-Message-State: AOAM532x1rY2ltYU0Y2j1xiFgKC08rvptZTxCO9AffQhJ0CKLcSgfXBV
 G8PXXwy0KaoraFoB3aWxTlo=
X-Google-Smtp-Source: ABdhPJwTTQLbHNEU1t5sZnE3tQc5DKE4YaX45mpMwRnCwGar4pU6PUEywEMi69Ra+ringECKxbWaRw==
X-Received: by 2002:a05:6a00:1488:b0:44d:25b2:f80b with SMTP id
 v8-20020a056a00148800b0044d25b2f80bmr17492261pfu.20.1635154551087; 
 Mon, 25 Oct 2021 02:35:51 -0700 (PDT)
Received: from nj08008nbu.spreadtrum.com
 ([240e:47a:878:6a2:e0f0:8dca:6977:afd5])
 by smtp.gmail.com with ESMTPSA id c9sm15446100pgq.58.2021.10.25.02.35.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Oct 2021 02:35:50 -0700 (PDT)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com, pony1.wu@gmail.com
Cc: orsonzhai@gmail.com, zhang.lyra@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v7 5/6] dt-bindings: display: add Unisoc's mipi dsi controller
 bindings
Date: Mon, 25 Oct 2021 17:34:17 +0800
Message-Id: <20211025093418.20545-6-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20211025093418.20545-1-kevin3.tang@gmail.com>
References: <20211025093418.20545-1-kevin3.tang@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin.tang@unisoc.com>

Adds MIPI DSI Controller
support for Unisoc's display subsystem.

v5:
  - Remove panel_in port for dsi node.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../display/sprd/sprd,sharkl3-dsi-host.yaml   | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
new file mode 100644
index 000000000..bc5594d18
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
@@ -0,0 +1,88 @@
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
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
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
+        };
+    };
-- 
2.29.0

