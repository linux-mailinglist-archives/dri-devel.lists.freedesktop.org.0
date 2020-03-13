Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E35186065
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 00:19:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291EA6E249;
	Sun, 15 Mar 2020 23:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3746E49B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 13:23:06 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id t14so4246307plr.8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 06:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uhG/24QG2V0Xvo4gbhTdi+VNYSRRPHVYttLMEUxAx8w=;
 b=Sey9rFdH0KB3+dsBVhATAQBmrjTBPTbezaomhwRZsuGoZOxoC24ZuQxFWo3y8zGRCN
 DjP3LHeT9hYu96GVe9za8gD33S1U1UTFWZTjWShSfV/oOZ2y66sW7AoM1hODDyAHmThR
 lMMwpFAIip6qzFNaNMQDfmQBL8PxkRPyYJTfHEldCIgSgHOqOocrpoM3oGf0G0vmxO8O
 EiFFgAV4AQcvbAR241uAK10jiu6yUdaN7RkweH4wvlWqWxOaYKBgH2rRKEvLdAh5CP/0
 hrYFN+7DUnGUdCv/VBBbOPBPdF6hmBICVZ/TpDs1fvs0R+YREWO3TLRiyUTlM34Ktfyf
 0vBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uhG/24QG2V0Xvo4gbhTdi+VNYSRRPHVYttLMEUxAx8w=;
 b=HZprBJJUYSFqSQqeL0trM1p7qCvy22ZR/hwxfl2VQzLQzMj2zwNu6W63iKRFv1Jata
 ku1tcPA8rGtKauI7NNpmD+S8u1Mdp9Ug8WVBalRuzbZqxEvLdRHq6Mde1mAtGDiWJZsJ
 hH4qD1IQkuGbTBIxLNkJ7vg6aKGpLdxnIwwr7HaZ5Wh1fZfSGZW7Jxaecl0+adu65I3p
 5TiIpzxoTUS8C2fAGRWfaERBkOtDKfVzN49WvMRQCywGzHokqtcPlEgdOalTEcKL0d2X
 eIiXILiwDiJZ2hZwUGVpUCN7CnrP5aEOkEg1t3VJez0zH/xwRSpBa4vWbCoccSswoqBE
 /LDg==
X-Gm-Message-State: ANhLgQ0JQVeMc6iZ1Dt2rmspHhauW923/4lgIwv//pZQYmTsw8vFe7aU
 kHPmwsnyUcqFFjgxT0KYcPk=
X-Google-Smtp-Source: ADFU+vvsReo36P7yxkGNjF6J7YSGD0VUssKBi9nFhIc6hB/Y8pwmD40nlzr6I/q3CsK5o4dbt6NB5A==
X-Received: by 2002:a17:90a:6545:: with SMTP id
 f5mr10103614pjs.42.1584105785921; 
 Fri, 13 Mar 2020 06:23:05 -0700 (PDT)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id y9sm21490296pgo.80.2020.03.13.06.23.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 13 Mar 2020 06:23:05 -0700 (PDT)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v5 3/6] dt-bindings: display: add Unisoc's dpu bindings
Date: Fri, 13 Mar 2020 21:22:44 +0800
Message-Id: <1584105767-11963-4-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584105767-11963-1-git-send-email-kevin3.tang@gmail.com>
References: <1584105767-11963-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Sun, 15 Mar 2020 23:19:05 +0000
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
Cc: orsonzhai@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, zhang.lyra@gmail.com, baolin.wang@linaro.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin.tang@unisoc.com>

DPU (Display Processor Unit) is the Display Controller for the Unisoc SoCs
which transfers the image data from a video memory buffer to an internal
LCD interface.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 .../devicetree/bindings/display/sprd/dpu.yaml      | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/dpu.yaml b/Documentation/devicetree/bindings/display/sprd/dpu.yaml
new file mode 100644
index 0000000..54ba9b6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/dpu.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sprd/dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc SoC Display Processor Unit (DPU)
+
+maintainers:
+  - Mark Rutland <mark.rutland@arm.com>
+
+description: |
+  DPU (Display Processor Unit) is the Display Controller for the Unisoc SoCs
+  which transfers the image data from a video memory buffer to an internal
+  LCD interface.
+
+properties:
+  compatible:
+    const: sprd,sharkl3-dpu
+
+  reg:
+    maxItems: 1
+    description:
+      Physical base address and length of the DPU registers set
+
+  interrupts:
+    maxItems: 1
+    description:
+      The interrupt signal from DPU
+
+  clocks:
+    minItems: 2
+
+  clock-names:
+    items:
+      - const: clk_src_128m
+      - const: clk_src_384m
+
+  power-domains:
+    description: A phandle to DPU power domain node.
+
+  iommus:
+    description: A phandle to DPU iommu node.
+
+  port:
+    type: object
+    description:
+      A port node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
+      That port should be the output endpoint, usually output to
+      the associated DSI.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/sprd,sc9860-clk.h>
+    dpu: dpu@0x63000000 {
+          compatible = "sprd,sharkl3-dpu";
+          reg = <0x0 0x63000000 0x0 0x1000>;
+          interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+          clock-names = "clk_src_128m",
+      	        "clk_src_384m";
+
+          clocks = <&pll CLK_TWPLL_128M>,
+                <&pll CLK_TWPLL_384M>;
+
+          dpu_port: port {
+                  dpu_out: endpoint {
+                          remote-endpoint = <&dsi_in>;
+                  };
+          };
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
