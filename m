Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9597D3218A4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 14:28:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D27E6E525;
	Mon, 22 Feb 2021 13:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4146E525
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 13:28:47 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id c19so8535345pjq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 05:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UtmQmD63MumL54aGIHWxpTmuXa3kxeJzRTqHsLYTlYE=;
 b=iJsfWsyz7wlcbH0X1BIRSYuxCTSl568M1VZujAlJHLUVJL9ynxFhXctE1nZJ8ZxEyH
 6alPaIoaCKBEpIfWAZn5SUoNJMvEuA0kwsrg2DxkqSrYBOxhEyKZVxO/9gPstRLY95gE
 wPcLZcQejJ9Eza1G0CGugrn429/UXWEHYt+yDxzEVy4UtYX/zq3lGdQZNoVB0iooqJvf
 QFJUlb+2sdaRwalPsop4jaTgH+UCVADeFDBPBsWs9ahBF6hoArbUfulBEkF8NH6ZVfOy
 ImgdI1rdCpQyUrcqE7E7ELSn7uo0tzrZaYZxrDqRVGY3CJMp4bdYi/oqkkFnzY7FpBWh
 9vkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UtmQmD63MumL54aGIHWxpTmuXa3kxeJzRTqHsLYTlYE=;
 b=VAekvlBj3UPvxnL3y2ZN308RMc9myMBKb84+aSf1amqt0lFgn8JcuLYY2Z4LJsA0ZR
 y97EARfEqpFe/+Q+BUssF7rjQ4xbnPHg9sDnbyl+OfFVv1Omi1csiQZaYlviVBC/6ABJ
 zka7BuJEV12Ayv3eyOcB6sdwS9rKI9wCIgbBy0OqM8vHpLIBG+5+5gkT75G6CBKxXCFy
 kDLAKWirurNxM1xT7y27f0LDd5l0faoPrvOA4oMkvBOslc8AvHT7KOOq8GfulDMxoXzX
 VuaOU5v8JsPUQrlHxN6GsH3E6wZCqjbwMHPELgLlL+Q/GBmBcbmCME8hBpK2zFhcDWrc
 EE6g==
X-Gm-Message-State: AOAM53011f/0titrMTgMq0D5jtzBItyK7bvbd7IAAPRRdTH+0vfZZbaB
 ORWrIBJ6/frUtlmEYcr/PSk=
X-Google-Smtp-Source: ABdhPJze9EAVEIFrwSg4I7G7upPd9XoZFdOmrn+TGNI5iU0dU+fbOJI9vPPQqsoU0S2dQxVh5hlyEQ==
X-Received: by 2002:a17:902:8643:b029:da:d5f9:28f6 with SMTP id
 y3-20020a1709028643b02900dad5f928f6mr15047211plt.8.1614000527434; 
 Mon, 22 Feb 2021 05:28:47 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id 141sm19585334pfa.65.2021.02.22.05.28.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Feb 2021 05:28:47 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH v4 5/6] dt-bindings: display: add Unisoc's mipi dsi controller
 bindings
Date: Mon, 22 Feb 2021 21:28:21 +0800
Message-Id: <20210222132822.7830-6-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210222132822.7830-1-kevin3.tang@gmail.com>
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
MIME-Version: 1.0
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
 .../display/sprd/sprd,sharkl3-dsi-host.yaml   | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
new file mode 100644
index 000000000..d439f688f
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
2.29.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
