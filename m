Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5DA253448
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 18:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042266E210;
	Wed, 26 Aug 2020 16:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EF36E187
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 16:03:25 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id b11so1101020pld.7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 09:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gOJ2wsgRzvVRKckZeydkoWsG77ZYsewrKloG8nTk710=;
 b=u7y2Uh5YZGN9nMLWxRDS6HRYwt2+2SPr2lWkM/5QvASQ4iAGJGcyoH52Lk9ebk3I+y
 bdVfivs0fxD5OXqsIM6hrs3bJI7GwUZYkIhIjYiMyEuoeY4U05vxbNTksNII0z5OTYuY
 tf2e9jPijn6R05nDnaYRtFNpfbiR/AWVfHhuzWC3uIwrmAh9IbCQd8Uob3kzQXPPrwlS
 gRKbt1MxjyUapwHaVxWAFjs1jgyPR6fNXwKcZXOk2UmRu3giyuL0pYlRJX/ZAmlOoaQp
 LgfjX8V83K66sgRxj8e/y24yYopZI7D874u7TmcD34ygtW34au7bsh3NEbTWUMWMFg1g
 csUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gOJ2wsgRzvVRKckZeydkoWsG77ZYsewrKloG8nTk710=;
 b=HQnInauUO3lCb3Oo08QBD8P66oFa6iEnNULW7Zj1YSSiRZMO89i9ZRShhEqO8B+vhv
 9uTsLBmPMdXxvnwj/qVXDMJ3Ane/o91YkYtozwHHsq7Ecy3vCoPg2FD94L+C6iv00g+f
 qSe5zTCEQ0oa3BEXzQsbwghbo/3MZXXeYi66kdJE+FzpCG5bM7ilW+trzRc3ntu5GXvp
 e3QiF3xJslZV6DEXXhFn5wguwn/4bxiZA92RkFRVwOBmdkKegehSTQr+9UA1R07u14S0
 Yy+oLDQsexZgflHMcl1SQAgzituIH13phDMqGHLG3aadgNqpj2ioCwFsWrFPp5HwD5ws
 x7fw==
X-Gm-Message-State: AOAM530/XfuotjV6mA+6KDd2ee+P9mrfQ8aPIzfSn6qfhlEDte8hEOw7
 buM9xdj2Ebre957S+MGhNYw9jg==
X-Google-Smtp-Source: ABdhPJx3zgfkCLWuhwB9Ncl+xylskuKGkxZ5BPvawfalxKyVUr95qHmDSMim1JB1vRjdaVphcFzgBw==
X-Received: by 2002:a17:902:aa41:: with SMTP id
 c1mr12271225plr.224.1598457804850; 
 Wed, 26 Aug 2020 09:03:24 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
 by smtp.gmail.com with ESMTPSA id u3sm2487555pjn.29.2020.08.26.09.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 09:03:23 -0700 (PDT)
From: Sumit Semwal <sumit.semwal@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 1/2] dt-bindings: display: panel: Add bindings for Novatek
 nt36672a
Date: Wed, 26 Aug 2020 21:33:07 +0530
Message-Id: <20200826160308.18911-2-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200826160308.18911-1-sumit.semwal@linaro.org>
References: <20200826160308.18911-1-sumit.semwal@linaro.org>
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
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Novatek nt36672a is a display driver IC that can drive DSI panel. It
is also present in the Tianma video mode panel, which is a FHD+ panel
with a resolution of 1080x2246 and 6.18 inches size. It is found in
some of the Poco F1 phones.

This patch adds the display driver for the IC, with support added for
this tianma fhd video mode panel.

Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---
v2: remove ports node, making port@0 directly under panel@0 node.
v3: updated to replace port@0 to just 'port'.
v5: renamed to novatek,nt36672a, since the binding is for the IC and not
      the panel.
---
 .../display/panel/novatek,nt36672a.yaml       | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
new file mode 100644
index 000000000000..7f8d1097bee0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt36672a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT36672A based DSI display Panels
+
+maintainers:
+  - Sumit Semwal <sumit.semwal@linaro.org>
+
+description: |
+  The nt36672a IC from Novatek is a generic DSI Panel IC used to drive dsi
+  panels.
+  Right now, support is added only for a Tianma FHD+ LCD display panel with a
+  resolution of 1080x2246. It is a video mode DSI panel.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: tianma,fhd-video
+      - const: novatek,nt36672a
+    description: This indicates the panel manufacturer of the panel that is
+      in turn using the NT36672A panel driver. This compatible string
+      determines how the NT36672A panel driver is configured for the indicated
+      panel. The novatek,nt36672a compatible shall always be provided as a fallback.
+
+  reg: true
+  reset-gpios:
+    description: phandle of gpio for reset line - This should be 8mA, gpio
+      can be configured using mux, pinctrl, pinctrl-names (active high)
+  vddio-supply:
+    description: phandle of the regulator that provides the supply voltage
+      Power IC supply
+  vddpos-supply:
+    description: phandle of the positive boost supply regulator
+  vddneg-supply:
+    description: phandle of the negative boost supply regulator
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vddi0-supply
+  - vddpos-supply
+  - vddneg-supply
+  - reset-gpios
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
+        compatible = "tianma,fhd-video", "novatek,nt36672a";
+        reg = <0>;
+        vddi0-supply = <&vreg_l14a_1p88>;
+        vddpos-supply = <&lab>;
+        vddneg-supply = <&ibb>;
+
+        reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
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
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
