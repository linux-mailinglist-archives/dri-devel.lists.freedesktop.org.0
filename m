Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56941241F9B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 20:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D3D6E5BE;
	Tue, 11 Aug 2020 18:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5864F6E5BE
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 18:21:21 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id o13so7111863pgf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 11:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bdqyu7i6Nejyba3UvWvNRVJj3YGTPAvhIc5fFeKUFKA=;
 b=qxl4KEdSUfstTNxTL9gtP+w44/d0mjBRVPbumXlZUhSciKYK+6oWGZGtCBkpoqE/Iy
 30dr97E0QjDfEWp4WmKliileRs4VrqghvNr88HxWkmBxyfE+HGssaHtJoIadgveHulwI
 /kMx143kmPWMYw6rUuyFAWrF20lR+6OTwV/DQgcZAYd6Aec2U38atXbvfUvNoakLedb7
 H0HD68rBMR7DKH31FvaRLSEdthM1scOpsAZ7HRQaysuLE1rXTH4bnW+ugzew/kCIFDmm
 jcBhtT8Ied7tXBJjxY5opt2u9r7/tsmofuXsExbPHmbTodDWaKZJNNeQ0H5vmpbFUv1e
 35Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bdqyu7i6Nejyba3UvWvNRVJj3YGTPAvhIc5fFeKUFKA=;
 b=Q0YGMZNd5YVsbSq30+EE5PZ1IyliH2lame6M1UjYWHPdhv8hAOkT/kYCV19qzyY0RK
 M+MngyrFaEz3z8xbF4N2UsHDKghbVewojTHzcdr7CxrXZVO+ol7h3sfl4R41FPpFV+de
 /TuVZ7W+I7MVJ9gGRf7x5dTikZpw0JZineHxjz9DLMqsdkqS9C67EMoMK7sMxNM8uVX+
 Rq7hav887DWzmx23kyI4KVjSl8YfUfgKiN3k17jPS2LH3YFTpUFGKPtoqX0MjIoQz1Gs
 G39L4NOaqvtOgHDkS5tRYoyn4BPwXgBuA18Ittwwonv6zPAxM6J69bprBZIyaRMt+sAf
 hZfw==
X-Gm-Message-State: AOAM532oAkM+7LZBf7RHw355ID9WbpFqB3JPXTSm/4YskUGBhOQc5G/O
 QMs+rSzpfr88voRVou5B97EVaA==
X-Google-Smtp-Source: ABdhPJykZ+JozGGOFkpFth/UQvfXGGbzzjzLJSB8dpuc8Qgb0f4Pz0qrsPBgTWgJRl6p7GLf1sS2Ig==
X-Received: by 2002:a63:5613:: with SMTP id k19mr1908920pgb.424.1597170080907; 
 Tue, 11 Aug 2020 11:21:20 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
 by smtp.gmail.com with ESMTPSA id x7sm26595162pfc.209.2020.08.11.11.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 11:21:20 -0700 (PDT)
From: Sumit Semwal <sumit.semwal@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v4 1/2] dt-bindings: display: panel: Add bindings for Tianma
 nt36672a panel
Date: Tue, 11 Aug 2020 23:51:06 +0530
Message-Id: <20200811182107.6515-2-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200811182107.6515-1-sumit.semwal@linaro.org>
References: <20200811182107.6515-1-sumit.semwal@linaro.org>
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
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
