Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB6022E6D4
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 09:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C4189C28;
	Mon, 27 Jul 2020 07:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ABEC89C28
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 07:44:03 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id o13so8989914pgf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 00:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5US/XCWACBZUG+u/wcd8ufH/ZA+g/IaYFSks30i6g9k=;
 b=qur/AtmdKo9Z1/6syLwN1Bs4Sm/0w7BycwiIZCY7HuB+hYitWI7TQ8VkabtUNI47M/
 29JN1tJWNYx+YxEysZUSk7IW1ZJlGbD9Y+yD1pR4biouLN2Rgnw9LfDEja2iMYVkyCgT
 yZ/d/pZGG8Mcqy6Ki+qZBMYfcZc0+vmoTzIRvAG7jJs9FZk7wUpEIh5fU+gIpDRoqJNl
 y8F1anTTNJ6r6hyPdW5JNd6JfWtEle2hAkZLUteWrM+AN2Vd/94lXUquyxFVmQxLl+cE
 L4xu9F/uvyrIwP131jddQKfXgyD9Ix8VNsH3b6wUbBNMmzxO0zIxXBJ6+GTo0B3/ydWD
 Y2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5US/XCWACBZUG+u/wcd8ufH/ZA+g/IaYFSks30i6g9k=;
 b=jv1gn+cDdK1zStWT1TwypMpab7GGgJDaXSKe5kVS0LQzfg45CXhL116HE/F2v1JtVP
 PfqJcIdQKG8Q7bsN2NLipTk8zKL5nRds02uLizpTL2QZajIKTq34y9h+a2ah3cSemz0l
 k4NzCrW7GRFuaVrf0wmh16KrBXnvnrM/3cZKLHA0R5ZcEHAbdmVyKIW2sBktmWZNiDUa
 RJaep6nHIjsghDWDXcK3awATaENCpiTQDq2P685StOM9cTYp3L6rJ42iAJOoH3Dw2Ljv
 lCbi6ODIzgh1pbDDT0c9Ei8KsqoNZn0ogvqy+YWjCO5xNeaZYIbDT6Flj0GsEzr3gx9J
 7cvw==
X-Gm-Message-State: AOAM5318Rh8FjdKrZ6alJSsH1+E0ZF/UGJGOoNyEhVa8WRl0Qq5HwDRB
 8VERZNlGZ8d2/y5EobQVm4s/YTUIbg4=
X-Google-Smtp-Source: ABdhPJzMXwH+bJlvAoqfT0h/bFkfqXsia+jQnXAdIqrualZwu256Gdg7aSGAbhqMTbYCq6zWUmBiug==
X-Received: by 2002:a62:7991:: with SMTP id u139mr18349947pfc.87.1595835842812; 
 Mon, 27 Jul 2020 00:44:02 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
 by smtp.gmail.com with ESMTPSA id n22sm13062152pjq.25.2020.07.27.00.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 00:44:01 -0700 (PDT)
From: Sumit Semwal <sumit.semwal@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: display: panel: Add bindings for Tianma
 nt36672a panel
Date: Mon, 27 Jul 2020 13:13:47 +0530
Message-Id: <20200727074348.26116-2-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727074348.26116-1-sumit.semwal@linaro.org>
References: <20200727074348.26116-1-sumit.semwal@linaro.org>
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
