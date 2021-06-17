Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F403AB701
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 17:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753146E907;
	Thu, 17 Jun 2021 15:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DB66E8FC
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 15:09:50 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id k9so1802218qvu.13
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 08:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6CZoxO79EUCj+uToMmmQ6lVMzE5TA3o7zrKqj4+S9KI=;
 b=ZrxvbUOIUHyCiVrYQYrgOpLGX9jlC28Ynxxg3p4qz0YhokhE+x9bkteQs6WqGC1hQg
 7i5bIyDasHmkWLZVP65g3IqUqiNaRB4220pMbWj4+DL+fD9l7/wwf/5eKNyAW0IUxmup
 53oja1wU6sNp+3+uPTk+Au/Gb83w4ninPOIqQtJgpFZo4Kn8YUj0bVqYEna6SHsG/82U
 6EVOMr8OeYo5OugWAuaFQHHN37jvTqM/cJd6kJHVD3s1l4hPc4b8fmbGmNPeJphuCpVU
 kBALGLBZAdUphN6cg2rVtBdn4Fgw8wkoHteU5G8GXu/dEJpTRMEAqMDbmE6mjD5AlOgE
 GHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6CZoxO79EUCj+uToMmmQ6lVMzE5TA3o7zrKqj4+S9KI=;
 b=TNIDJubPhryFXStT6RXEOKpsxcYllpfgV0EjUAioW3QdCcGugnLPLL1ZALdMU4foa3
 tQKEh4Awm2iX8+sMfBvKp6wm79df6wvexdDOmhzEqwrrX1Ra2bqiM5JhPVrzPxF13vHa
 D9fhjOBqAdVV9WAdO0QEZJZQid6nUwFRt15VRFjYIjbL6me0xRDfFfEUP2F+KRe/AY0D
 oUWpsNIDgu+2MHTKh8AFS9MVxmCrBwbJ/H4hAfIvES5CA2XLtqUeu7PMCDVUQ+UptHiG
 yBLeAu9lNN7pFm+IfXsXGZnliBd/CWLyve59diDaMNh1+qoxmZy6RrTp8bFY/Opot+hm
 OWig==
X-Gm-Message-State: AOAM530RgRShQCV4REXeJ+p5c+wrfqo+aKBu/W60iJh2rRPb7vGyt+Qk
 KP/PdAnhz2vXwQN6O6XaEHzS1w==
X-Google-Smtp-Source: ABdhPJwqlTnyC6ehAuzvmqugicCKmU0UrwJ2sXGVdmGn/AoPR8lWetbs/2NzMSuB8dsbFuyO/q7mzw==
X-Received: by 2002:a05:6214:80a:: with SMTP id
 df10mr300267qvb.8.1623942589661; 
 Thu, 17 Jun 2021 08:09:49 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id g82sm1915427qke.119.2021.06.17.08.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:09:49 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v4 1/3] dt-bindings: msm: dsi: add missing 7nm bindings
Date: Thu, 17 Jun 2021 10:43:33 -0400
Message-Id: <20210617144349.28448-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210617144349.28448-1-jonathan@marek.ca>
References: <20210617144349.28448-1-jonathan@marek.ca>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These got lost when going from .txt to .yaml bindings, add them back.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../bindings/display/msm/dsi-phy-7nm.yaml     | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
new file mode 100644
index 000000000000..c0077ca7e9e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DSI 7nm PHY
+
+maintainers:
+  - Jonathan Marek <jonathan@marek.ca>
+
+allOf:
+  - $ref: dsi-phy-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,dsi-phy-7nm
+      - const: qcom,dsi-phy-7nm-8150
+
+  reg:
+    items:
+      - description: dsi phy register set
+      - description: dsi phy lane register set
+      - description: dsi pll register set
+
+  reg-names:
+    items:
+      - const: dsi_phy
+      - const: dsi_phy_lane
+      - const: dsi_pll
+
+  vdds-supply:
+    description: |
+      Connected to VDD_A_DSI_PLL_0P9 pin (or VDDA_DSI{0,1}_PLL_0P9 for sm8150)
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - vdds-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+     #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
+     #include <dt-bindings/clock/qcom,rpmh.h>
+
+     dsi-phy@ae94400 {
+         compatible = "qcom,dsi-phy-7nm";
+         reg = <0x0ae94400 0x200>,
+               <0x0ae94600 0x280>,
+               <0x0ae94900 0x260>;
+         reg-names = "dsi_phy",
+                     "dsi_phy_lane",
+                     "dsi_pll";
+
+         #clock-cells = <1>;
+         #phy-cells = <0>;
+
+         vdds-supply = <&vreg_l5a_0p88>;
+         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                  <&rpmhcc RPMH_CXO_CLK>;
+         clock-names = "iface", "ref";
+     };
-- 
2.26.1

