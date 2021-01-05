Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9642EBB55
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 09:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF5189CE1;
	Wed,  6 Jan 2021 08:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A145D6E105
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 13:46:36 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id 11so18393635pfu.4
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jan 2021 05:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vv0Tt7wUhLrWCRhDSflLKD0bX0DOHnjLkBF71kuu380=;
 b=gcmmjoGgf0wUNaGuMNdnZ6CcjRO7AI0t0OuJqof7JjbvAQ4Yr8JSFD/UB4s0LvjdxG
 +n4vQoxat/GI8ntEbjl/+18TMs/wb+wn0YsChDkCDIolQeidJqkZp9ew8hy9P11GH8uo
 xils6KlYKHMAUditqbDpqW1t55MeFg7Jo4q4wVPexwnbuK1/ENUG4dlMht8Q8gV9/KbN
 +UnvnVAp9D9dyGWTu9EH0+fa7jlK+1d3PGIQxlelP+TD0V2Yd+YCmReSFTI9AuCj9u6B
 1FbLONtJI3LcL66jruR950UbVMUbeBu8ln5pg5MNnwKHHr/P4OS97AWlTOaLhrs1jpvT
 meXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vv0Tt7wUhLrWCRhDSflLKD0bX0DOHnjLkBF71kuu380=;
 b=ZqYBl0KtLJAnIx56uKiKQ38QHgZ7lla+aa/tkFzxTL6bISBZAs2m3WEgenKNcPLk7w
 v6HznvgIEA3jGnajOK7t5v8L/rWBJpbVHDTnTTGSmpuv58G8zSihnuy/c7jzzfXLGM/G
 Fst9x7bZy1CP85S2oyN+BkEbCGWx1qis7FuUI9EVxjFcNApLFDp4d0QvVGCF/RfPc2Ej
 g0kGpNXZQ8gelHGnwig5KPnv7GJYuJTR5UGIPxAAIZM9x5/WeMq3+iw9dSONuM3bnJaM
 fV6ptC18YmqjgmeocDuo3D3C5RF8f/FvUXipkXop8gH7xMUhN+IpjtX6zcsRW/ara0oE
 RjdA==
X-Gm-Message-State: AOAM530yqTGi3mBNn1FebJD40vG1XOv449jpFI3jkyvIld1Qxlj4Z8ZD
 UhYKLHsVosrzu5ufkaMy6AiTUc+EofU=
X-Google-Smtp-Source: ABdhPJxavjvNbANe/Xh1U+R40m0rOMGxRnpABb5EjpMdLbys/JSNDaBklI23JQiIUgdtdoeRefmnWg==
X-Received: by 2002:aa7:9f1d:0:b029:1ad:2aaa:c1e3 with SMTP id
 g29-20020aa79f1d0000b02901ad2aaac1e3mr62546200pfr.75.1609854396309; 
 Tue, 05 Jan 2021 05:46:36 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id w63sm57582284pfc.20.2021.01.05.05.46.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Jan 2021 05:46:35 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH v3 3/6] dt-bindings: display: add Unisoc's dpu bindings
Date: Tue,  5 Jan 2021 21:46:04 +0800
Message-Id: <1609854367-2720-4-git-send-email-kevin3.tang@gmail.com>
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

DPU (Display Processor Unit) is the Display Controller for the Unisoc SoCs
which transfers the image data from a video memory buffer to an internal
LCD interface.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/sprd/sprd,sharkl3-dpu.yaml    | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
new file mode 100644
index 0000000..4ebea60
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sprd/sprd,sharkl3-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc Sharkl3 Display Processor Unit (DPU)
+
+maintainers:
+  - Kevin Tang <kevin.tang@unisoc.com>
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
+
+  interrupts:
+    maxItems: 1
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
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
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
+    dpu: dpu@63000000 {
+        compatible = "sprd,sharkl3-dpu";
+        reg = <0x63000000 0x1000>;
+        interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+        clock-names = "clk_src_128m", "clk_src_384m";
+
+        clocks = <&pll CLK_TWPLL_128M>,
+          <&pll CLK_TWPLL_384M>;
+
+        dpu_port: port {
+            dpu_out: endpoint {
+                remote-endpoint = <&dsi_in>;
+            };
+        };
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
