Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5D722903A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 07:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601AA89998;
	Wed, 22 Jul 2020 05:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F15589998
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 05:58:30 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id cv18so2403047pjb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 22:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dTm4mWhvKAmIc2Rf3uwqpSL+kAsziisrGlZO4B+85K8=;
 b=guVuNrx2ZWLOp4fNmvGs/LfJYvYVXWStXsqNLTMHKJIZAV/XgbdQm12D7Ftqp67bIP
 Ojv6OaXH4wfdhdGo2uaSJEY2mNxzfWgXvQEAcVvr4IhBJPOmDeaimWxQySSEcfXnbIj+
 j5KgliOrjkHxKKf/CoiroWN75Usd09WLyc58/m7bi9CLgk2JLfz+ApA5VMV4FJued4Yu
 lV+FwRXcQlbdhzifR2pyGCPE4QLkdQPCHdqEJasdDsuKzV4DpaY34VeVUTACzED7VCIb
 oFXY+Ssx1ko+J3e/kasBhiR17y+QxrXn3ClI3vY8Wt2TJtpa2NjenDct7nnD+B9AWC3T
 so1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dTm4mWhvKAmIc2Rf3uwqpSL+kAsziisrGlZO4B+85K8=;
 b=ocBthx4V4sSiWmq0QPbA7P0Bk2354uyEChOQHz7nPypupe0p8a8QL+sn0GiAmkezmR
 yLaZQf+VZL/eQCMgV1sP/8IqQrQ4/Och4k4BysHE5E0o9HrSJcQXDVBKV3M35CeajnU1
 6p7hsUQxF108kZDmU+JwtnxMGDG8BnSge3t5vLIDsOZG2LuH8AaF7krc8JNKGvkuPOkc
 HgZ3EKBQzbQ3xlFSy6nJjGT0tEqsPT9tKxW06+hFQ+QyUeMneoGt3knkmUDOcTzbesA2
 OATuWJjygHVubR84dWtHiRlq8TaMphAuQt6w2CQEDoA0dE4cFH+DUK6S48eOrVG8+jha
 X3+w==
X-Gm-Message-State: AOAM532tZwKbmnxFtBcyMwpH8SPewG0zHvwPuJDn33EKBnfOIe4W8Mn9
 i2tAq2GZ2+7g8CDmEyDGwJlerg==
X-Google-Smtp-Source: ABdhPJxNgX46VHUtwjAEqfNC1oD0Z6BdM604ZtHA8C7mdc+55PewhMuFojFaYwfykV1A/TwKENDtHw==
X-Received: by 2002:a17:90b:8d7:: with SMTP id
 ds23mr8547210pjb.148.1595397510192; 
 Tue, 21 Jul 2020 22:58:30 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
 by smtp.gmail.com with ESMTPSA id e191sm22144010pfh.42.2020.07.21.22.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 22:58:29 -0700 (PDT)
From: Sumit Semwal <sumit.semwal@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add bindings for Tianma
 nt36672a panel
Date: Wed, 22 Jul 2020 11:28:15 +0530
Message-Id: <20200722055816.20768-2-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200722055816.20768-1-sumit.semwal@linaro.org>
References: <20200722055816.20768-1-sumit.semwal@linaro.org>
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

The nt36672a panel from Tianma is a FHD+ panel with a resolution of 1080x2246
and 6.18 inches size. It is found in some of the Poco F1 phones.

Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
Change-Id: I401dfbfe23ff2d806c956002f45e349cb9688c16

---
v2: remove ports node, making port@0 directly under panel@0 node.
---
 .../display/panel/tianma,nt36672a.yaml        | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml
new file mode 100644
index 000000000000..cb1799fbbd32
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml
@@ -0,0 +1,104 @@
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
+  port@0:
+    type: object
+    description: DSI input port driven by master DSI
+    properties:
+      reg:
+        const: 0
+
+    required:
+      - reg
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
+  - port@0
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
+        port@0 {
+          reg = <0>;
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
