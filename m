Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 876803EB70D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 16:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425056E846;
	Fri, 13 Aug 2021 14:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3413E6E845
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 14:53:28 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id nt11so15666965pjb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 07:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/nNkUI+dH8AtxQEgxzy9cBX4XHXv2DfxTs/bgyz0Ark=;
 b=WTARyxxJ7QZX8wxUUsNeqmSr2vEUF8pxewCO1yUaBUQZywo9+703bI3aXylRZ8kHwB
 2xyZJshObXvrke6thViLath8/D5d1u6nAWDw2licrPGre1GYNmsvevhowMF0vim+1cXg
 og3vcVASlJxcdRZ+KU4wuqM7rSxsEfhkSF2YlD4PM7OEfla1oTSm6BW+QIOS3pjMtUiP
 u/w9yLx1Ee+lCQOfrGY1c8rbITQqLekxsP3SgAjlU63pI91iu0rcijbnyoPVvUt21s9z
 gjEmFznMCpArMr1OResDwHaYqYSm4f4zAry9f2g0iH8hMYsjWMMMPG2aHr8DnxlZx09C
 0xmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/nNkUI+dH8AtxQEgxzy9cBX4XHXv2DfxTs/bgyz0Ark=;
 b=YV5ydHf9lXyXcyKL7bXp1P97mBHGR+IfyOFD3GZley13eEI0oCTApEjUGoypDbU3Kx
 tOwibO1d+woCNX9FVrVY/5Oy1LcTsQU79ZAh6W7Vw4zFeAfV36wShvy6TLoccJhtXWLZ
 UOFnXXIs7MLn6aVksbVz5ALWrTsxUDZopTqycj5W7L2VWEnb2FffB+FKLFSEPuF/jgYG
 wmP1ZvJtZqLEC4yJfELzu47t1vJTWINvA6rzg1PlhqMQaw4k+CNZP0TAIrhm8fVMPmd+
 b9+1iXuTB7QKwRHzfke8dY7ZeUyVR5PK9+A8PXdvLguJO12AsMiS1Q+MdpgPHVfnFs+R
 iAOQ==
X-Gm-Message-State: AOAM531h7XIfQHnoWLSdSrV6PVQbyOJtfIsmpp/XXcmWHFr+m63Fh+A6
 asxjbmQloOwQWyr3gys8yWU=
X-Google-Smtp-Source: ABdhPJyfYSlEql4EsaxPNbDDj27kRY5RZwZYrbwZoz0nlerHGOyYtsRq71pr726En6PR3S1+pVgW9A==
X-Received: by 2002:a17:90a:bb8c:: with SMTP id
 v12mr2991321pjr.72.1628866407889; 
 Fri, 13 Aug 2021 07:53:27 -0700 (PDT)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.102])
 by smtp.gmail.com with ESMTPSA id e12sm2524787pfc.214.2021.08.13.07.53.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Aug 2021 07:53:27 -0700 (PDT)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com, pony1.wu@gmail.com
Cc: orsonzhai@gmail.com, zhang.lyra@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v6 5/6] dt-bindings: display: add Unisoc's mipi dsi controller
 bindings
Date: Fri, 13 Aug 2021 22:53:01 +0800
Message-Id: <20210813145302.3933-6-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210813145302.3933-1-kevin3.tang@gmail.com>
References: <20210813145302.3933-1-kevin3.tang@gmail.com>
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

