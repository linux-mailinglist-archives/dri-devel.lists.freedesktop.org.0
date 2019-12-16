Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2531228DD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:32:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BFB6E9A7;
	Tue, 17 Dec 2019 10:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4796E4D2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 11:41:14 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id w5so2845261pjh.11
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 03:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JpUV+EzBf5UQVu6B5s3q7vzuc+RcJYcN/8U92TH/gjg=;
 b=RAy22QvOHzC8pdsaTRdxjzH5m9jvEed2Mpca0DEnHg/e1CSge9uarJnVvbYrZqS5wc
 es0aj56YdAjBR5nVW2OSX/SquF/HGdASC/DFs3vsaIZELB7+Yfsv8Pk4mWvBHf5yOHwj
 3Vzh0w1so9l34pWouDf1+vNvtuTupoH5MLEapqCRvYzFEkvtSAlOTH5a30hXsA5ArEc2
 xzDnBg95Bk5cgAKZzYKcUMqxGWFYdu9D3P3QvrDz1uZcEKqYQyQdJlh6BGAN+ckLnhWU
 LJ5blbalmkhnTiZQFS2uYKZp9sibgdwWjz46yUjdkpbB5QBE5Mqqfjk4CAA6JJVKo8Io
 ru9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JpUV+EzBf5UQVu6B5s3q7vzuc+RcJYcN/8U92TH/gjg=;
 b=RoHcOGw8Aqlw2ccSnhKDOpFXvaC9htvKAQvHhvZI7p+Jfy2eneFHLt1YrhRscN7cwo
 /457QV+/Taur4YUzIULbyqIeze6OpifW5/lQM5oIyVYSz4Jwj2NO1cBeRmT9MvRib/pz
 In7U/YDkefShEXPaoOzJfx5FUZ9ubRMc20/DlCrH1NW3elUiEdL1w8EKJpnMaS0YVm6/
 iGNXIb9Ql5DdfCtFVpYQq/MZXL/tDG4LubVGqz90sF+D68lFt0DsyecceaNqZPtKKa7p
 JqFyjTM0j3YUXiqcnCT0PuHz+IBGbgcn7c3RvC4I7wLUxREGm4Zb3yhHqeuqQw0aJcVb
 nCDg==
X-Gm-Message-State: APjAAAXOm3XZCR2h46ih33ng8VsAeSSuggc+b3swF710tiKsXeyn5TLW
 qvvmw/fTwLia67MFv3yCn3+neoOh
X-Google-Smtp-Source: APXvYqxKXmKZJ64Gy45QPpVCgH9mAI5/xHNlz3KkdSGdtlVgmMvXgczSsn6Vd9I2UfFt1TdgUODEzg==
X-Received: by 2002:a17:902:6b45:: with SMTP id
 g5mr3114245plt.159.1576496473673; 
 Mon, 16 Dec 2019 03:41:13 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id p124sm22432269pfb.52.2019.12.16.03.41.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 16 Dec 2019 03:41:13 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v1 3/6] dt-bindings: display: add Unisoc's dpu bindings
Date: Mon, 16 Dec 2019 19:40:16 +0800
Message-Id: <1576496419-12409-4-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576496419-12409-1-git-send-email-kevin3.tang@gmail.com>
References: <1576496419-12409-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
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
 .../devicetree/bindings/display/sprd/dpu.yaml      | 85 ++++++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/dpu.yaml b/Documentation/devicetree/bindings/display/sprd/dpu.yaml
new file mode 100644
index 0000000..f84eddd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/dpu.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sprd/dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc SoC Display Processor Unit (DPU)
+
+maintainers:
+  - David Airlie <airlied@linux.ie>
+  - Daniel Vetter <daniel@ffwll.ch>
+  - Rob Herring <robh+dt@kernel.org>
+  - Mark Rutland <mark.rutland@arm.com>
+
+description: |
+  DPU (Display Processor Unit) is the Display Controller for the Unisoc SoCs
+  which transfers the image data from a video memory buffer to an internal
+  LCD interface.
+
+properties:
+  compatible:
+    const: sprd,display-processor
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
+          compatible = "sprd,display-processor";
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
