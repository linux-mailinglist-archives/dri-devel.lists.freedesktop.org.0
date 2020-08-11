Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FE2241A80
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 13:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DF86E506;
	Tue, 11 Aug 2020 11:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE076E505
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 11:40:25 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id u128so7466385pfb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 04:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=02zVwfMx3c82dMESmN/3uMBsnfv+t0nf9lm5grlg/ao=;
 b=brmRzebWF+qxRm2xbkZxf1t508yAsFnpHm48CjrF+vPSTGi2fU4tEaqzodQ8YvHZwF
 kvj3w15iqwZqsIAiXsalZQYYruC1JappHCUXk/e9WJrI0noqBb6nEhi1hGNsthPZf/ZW
 ZcttNh9PCGRKkY8i6bhtxdAJQt3J2/Y4kot3s3V7yRliiOcXU8oaGMzHNUqKfjh/rB0P
 0ScHvjum8xzTQoTIywdCN/eIiRFCUHaCD8Jn+kgx87HXj+LxsVZ8MNg3+ZWhdeX4pK4I
 8SIWEbBSkfhXpGwkHVqlS8XzFGV46ql5t7ZZQA5OitY3xEQpLZZVUZlDorWq3xcj24hd
 HUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=02zVwfMx3c82dMESmN/3uMBsnfv+t0nf9lm5grlg/ao=;
 b=hmx+buatfEJCVv1CJABh5V+a70v5gM9ylMsjA2seYeNHbp6X4HRlmoxqj7JTkkyTmm
 kOYP2EX5oHsADfJi5sGWH3fkDWpRgcAaGiglkGvkI0djIp3FRtc7LTXwFhKuAwgD12NV
 OUzo5Xsg75/xy/xFRdXGjroAO9ZPG8JZ1vVivmjELBBZO98iSahwyPh5aBgClhmyMm7+
 qLxeE8q/u+S3CACzvCzrtv0HslBKvv0IO/ZsuA1/ZJ6n3Fhl6J0TiWzflAIeTWkPnL1L
 Ezvs9YBVz1Ld+J7RMu5WEAo9lGMJjOtM7UIuZbhiqgXy+wiZ97yg7wPOmYhqgrvPszJU
 Wepw==
X-Gm-Message-State: AOAM532cgLrKYMJ0I7lr6df1hhXpr88ifJ15l2u7WRNIaeKo3Ggmmiz/
 WCT+1Y2zPXkQeOgmL7zamNjHIg==
X-Google-Smtp-Source: ABdhPJxqJqQh0R5VflvErlmkXKGAOAf1Jse5lrPIX3ZXjS1vdMCSvE+VSC8IUZrotOU2sgTStg7GlQ==
X-Received: by 2002:a63:7704:: with SMTP id s4mr472831pgc.78.1597146025062;
 Tue, 11 Aug 2020 04:40:25 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
 by smtp.gmail.com with ESMTPSA id gj2sm2600448pjb.21.2020.08.11.04.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 04:40:24 -0700 (PDT)
From: Sumit Semwal <sumit.semwal@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [RESEND PATCH v3 1/2] dt-bindings: display: panel: Add bindings for
 Tianma nt36672a panel
Date: Tue, 11 Aug 2020 17:10:09 +0530
Message-Id: <20200811114010.17807-2-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200811114010.17807-1-sumit.semwal@linaro.org>
References: <20200811114010.17807-1-sumit.semwal@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The nt36672a panel from Tianma is a FHD+ panel with a resolution of
1080x2246 and 6.18 inches size. It is found in some of the Poco F1
phones.

Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2: remove ports node, making port@0 directly under panel@0 node.
v3: updated to replace port@0 to just 'port'.
---
 .../display/panel/tianma,nt36672a.yaml        | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml
new file mode 100644
index 000000000000..03dc323332a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/tianma,nt36672a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tianma model NT36672A DSI Panel display driver
+
+maintainers:
+  - Sumit Semwal <sumit.semwal@linaro.org>
+
+description: |
+  The nt36672a panel from Tianma is a FHD+ LCD display panel with a resolution
+  of 1080x2246. It is a video mode DSI panel.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: tianma,nt36672a
+
+  reg:
+    description: DSI virtual channel of the peripheral
+
+  reset-gpios:
+    description: phandle of gpio for reset line - This should be 8mA, gpio
+      can be configured using mux, pinctrl, pinctrl-names (active high)
+
+  vddio-supply:
+    description: phandle of the regulator that provides the supply voltage
+      Power IC supply
+
+  vddpos-supply:
+    description: phandle of the positive boost supply regulator
+
+  vddneg-supply:
+    description: phandle of the negative boost supply regulator
+
+  pinctrl-names:
+    description: Pinctrl for panel active and suspend
+
+  pinctrl-0:
+    description: Active pinctrls
+
+  pinctrl-1:
+    description: Suspend pinctrls
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vddi0-supply
+  - vddpos-supply
+  - vddneg-supply
+  - reset-gpios
+  - pinctrl-names
+  - pinctrl-0
+  - pinctrl-1
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |+
+    #include <dt-bindings/gpio/gpio.h>
+    dsi0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      panel@0 {
+        compatible = "tianma,nt36672a";
+        reg = <0>;
+        vddi0-supply = <&vreg_l14a_1p88>;
+        vddpos-supply = <&lab>;
+        vddneg-supply = <&ibb>;
+
+        reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+
+        pinctrl-names = "panel_active", "panel_suspend";
+        pinctrl-0 = <&sde_dsi_active>;
+        pinctrl-1 = <&sde_dsi_suspend>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+        port {
+          tianma_nt36672a_in_0: endpoint {
+            remote-endpoint = <&dsi0_out>;
+          };
+        };
+      };
+    };
+
+...
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
