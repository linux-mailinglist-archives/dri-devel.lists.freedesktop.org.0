Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C883D9995AD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 01:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF0310E9FF;
	Thu, 10 Oct 2024 23:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="NhNbNJRO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic313-21.consmr.mail.ir2.yahoo.com
 (sonic313-21.consmr.mail.ir2.yahoo.com [77.238.179.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BBB10E9A8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 18:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1728585119; bh=jGaLpCXi0hWPUJkD+IJdr0e4LX3vaWBC+o7fEAUZV0c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=NhNbNJRO3fun0X52f303xJRlElFKwdldz2SRNnqSEgcizz+NCyNKZH2I71TCA8oddvLqfPZJP9ot1KXH8qdxlZqiEmKvJ9q6fGZ65jqaBVuTOVitMDg4MQ2YAa1fvWs51dBn+CbGGK3qrNvBJHqD3IvZGLjo/9NrCng4ubAVSsBggwi1x55zXyiBy76HIWjEtlXw8aS+yc66ATT/EIHRGmSoE1cr+/RJ0IAOPRknHqS9WadiOuZkzTkTJjojxmoaHrvNjbPyZ7X2Uyvpal+hx3y+1q8O7Wx1vGSy0odJLKVQC+v++zZIitrUXN9n0AJSSKWsSB/5PBmUdZs6ukM0uA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1728585119; bh=HeZwVZnMi4DukgMPIMkBHQEjldfP2gUC6BkynEWGolX=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=GC1+RYpmkTS/EnQinQ62V1lRu87fpFs0PrcHdimb5To0sbV50aJO/EClbnpjt+KDHltSYQuxyRDU2BXKiJoslK1kCyCIk8WTVpC8n4mMdpOWJWlnDVyHZEI1x0X5nIxTXRRVsLAP1+t/J8nvbnZm+9t8h69cUbfvyCTrsAb9WbQjBtvtxQwiXlLyhigoGyhOo1D1vpUs/XIS0flvR3SICl0GW2HqEFcQEZrhZ27UeAWPg1AR1NLGcL0NbtrVZVXDqg6PO/ptqW4dXioVwKExTGdxkmkxTJK2VXGqq4JSIZfIDwKe7mAMs3ww0bJM7uDKd8vtn6JhkdzYpeHYt9yU9w==
X-YMail-OSG: 0567YTgVM1mMr78UotIDX9bc7iQjTl69MOE57kqUkRNSnC6dhkNM.QnAWVTpy1u
 4CbppctekZ7ZyxZY4t.GXw7tRLuybG6lE0hTnW4Hdd3js99E49zZnMBuN73Y2RvzpV3fviAWRzmY
 mqy0dpnFy8n3SskYK9QIo4dRCteFv5qIukJm.juSSXA2GeQW3sVdhcvKCFY7lQD7Sqk8t4cfxBTO
 vF7_1_J4W.izFWHTXYNwQpdChEz.v08OzUqQTpprNQfcd5TNc85eCBICz.68Hl3fSu4y962_v8Wo
 MraPdh5h1e_cgknnRlwqOtjSBkiGay5.Qtro_GqIdreJDPDhyLqmekn_Am9r4rFNHmS__72SJb2b
 v6Qq82eDnLnRXWP8aftG1dkgy8BimfzuLYnd.DD0IkWdjCJofDAt1JtxW8tYrarvh0DMPKTgmqS7
 8si4MDX2nlcgzyc53ulXXzmNRw2HiZ2DrrQvnOKwBXwAUr0IT2WABGG8bi3Kisx_._Ze4xy0B60X
 QFamoy7tb5yEMFzp_382qPATroeiV8fcJPtt65Nta.1nohtiKPIdmbPnlYHPeFDa35iFhYXHrVx9
 ppWvY8sdSNXnfMsUsNG2sHLzHx4dz5V2jGWvEtcTMoFgI4xST0DE3hEqcwpWF6x4Me5WB0YHtZkN
 BO_8XFcjvCAJERrnCmM9L.fBYaL_QEhV_Zt_8vQsmnJesul8klXDEw3uv0Jgh71w16Rq7S4fiA8B
 4Ot.Mzr4Oe_tFpQqokbv2nsq_0CaqltyMhY4FyW464qm3uXwII60DYwt.V7dqulN5cDhEPUx0aAv
 T4VkrZjNjTc3g2rmtIKkwfWrxo5EU4l_OEuADOzgJXZViGMCK6IUfA1lX4CnjWuYG4PtdUY_stBD
 dtYvKTWuZ7SoqodXJ9rBFTulx5pOzoVs33H.NTDntCyNCNiTX9cJPhA0C7lDcuEaTX2z7m89sHgG
 pv38mp0vSI33ttKeKkyOasAf3GYLQc1u8XNAPqhDFzPK7GIS4CyK1FevO7bx2davLMiPuFCs_p_E
 RPMwHzTDu2W6gq1A0OaASfZCAT2zVkjUr6TnFXQ8FfPAg9QVre_isCEUQUMEOQ4KBx2.fEzo7Kd7
 gcciWuu6JsCJTq5DCmBA.QCDcSImZFSsa9dGqsi2LD9UE.uUkZoviUq9uBj3962vbhB5oMF3xWfN
 UkrH.aSplr87bnWYdFwAe8Q4qempNqlRMMN3G.ymQ69eWMSG48ma7T8aTSt2kyg4xXd18FShBlzs
 8hr2wBgfrEZp9LAYRmJDUlKhgBLqjXnmgF_KnxRFnC5Sigrans3jadsIQlqGIqrDMbpE3pNuPbfh
 AXlKe69jWK.fdEVENvbIBKZosTfYPc3dC7SwOUB5tdWpRY_sXf.oRL3_bSDVNSCEd1eC3VH69bPe
 bvMbiwCe84lYB7G.VbQy59qMHZQxFZHEuICKN55SfuzCvJyc8ahW3qvTsJOgg4f1Ml3mJjNYGch.
 J1laZkRbX.UWehJ2hAYFhLs9VUpcBGq8dlyLfucJk5_SD4OwLjUxWy.3sgIzfPHGGoWX6IqQDBPr
 IGXuwPcoZV0nZyHZmFrsQGPoqjEZRkBJNKDu9wp88JFuyOa9Imm5HYrL9a6YYI9FY7orgja_iKeK
 L8.aNJJEd66umiwoQbYsxdBdSJJEon38zlQKeZczg8jfvibq0TUBvVWCH6wSDKrn8T2ANlgpYmc4
 EuA0oPdcekLjmaBg2SVzSYN5Md5lNDluWcWa722m77B7W9_DS_Ac.SBJkwtdsdBZr2Ss2zhrpxGl
 Qt6Ae6v_W.3asFVB7Njp..Lmo3HxzeioImv7YQcALaYamYha1.GCCxenVDfhwwwpWe6rwsDqLcBs
 fOvkxQ_0ZglEIH6BMXfZCauClSQsIEZ.O9ZEfl3oMTnPtjqlHbC3uUFzd1cjxWuslMUXGV.vhN.R
 RztrxoEhGlLx4IUaTN6dkg1JfzA2fRKYnJ08sAI_p6LGJyNtuoKapstwiLtyS_QL8deM7WCRCeDI
 7Fjv9GOFMLUcJOOwoTN.4vN7e4N13k69OI.jc6djQgnbSSCtAxg7EX8SGzeZGbEBWbdkx9rhUMBp
 yXZG56XtP11UdgBCDDfhmg0tzZOAQLpbt_ZJwPKTzqOm7HY8EGh_T4dOdsQaKRuQdPprn.fiNoAE
 72kyx4bCE7eho9qaVBiKfAxx1PVuTWioOM2Z01PqyhXBuLS1ZB8xSJCrgU6XW5CJNwcdWu5gD23k
 aukZC9YthHe8SuCXcb.Ec1loQ72872E_NQS3mp1EGRvRl2T_u0sggUA1mfGlYWieea7TRLMiiv4r
 eo.zd5mCPxUlbZcfU9Ozz8DGFJhOa5swe6OUbVuF6pvK8ITRHgOf.UvYd
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: a791284e-38df-4ff6-a31a-4522ea5a0e80
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.ir2.yahoo.com with HTTP; Thu, 10 Oct 2024 18:31:59 +0000
Received: by hermes--production-ir2-6664f499fc-97g4x (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 7a7b462d09211a1a6528a42ebeb90f61; 
 Thu, 10 Oct 2024 18:31:57 +0000 (UTC)
From: Jakob Hauser <jahau@rocketmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Jakob Hauser <jahau@rocketmail.com>
Subject: [PATCH 1/4] dt-bindings: display: panel: Add Samsung
 S6E88A0-AMS427AP24 bindings
Date: Thu, 10 Oct 2024 20:31:48 +0200
Message-Id: <3d754a2ee538d4c99ab71340706297d54b767c35.1728582727.git.jahau@rocketmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1728582727.git.jahau@rocketmail.com>
References: <cover.1728582727.git.jahau@rocketmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 10 Oct 2024 23:20:22 +0000
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

Add bindings for Samsung AMS427AP24 panel with S6E88A0 controller.

Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
---
Patch is based on https://gitlab.freedesktop.org/drm/misc/kernel.git
current branch drm-misc-next.
---
 .../panel/samsung,s6e88a0-ams427ap24.yaml     | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml
new file mode 100644
index 000000000000..7010d3bbd07f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6e88a0-ams427ap24.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung AMS427AP24 panel with S6E88A0 controller
+
+maintainers:
+  - Jakob Hauser <jahau@rocketmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6e88a0-ams427ap24
+
+  reg:
+    maxItems: 1
+
+  port: true
+  reset-gpios: true
+
+  vdd3-supply:
+    description: core voltage supply
+
+  vci-supply:
+    description: voltage supply for analog circuits
+
+  flip-horizontal:
+    description: boolean to flip image horizontally
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - port
+  - reset-gpios
+  - vdd3-supply
+  - vci-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            panel@0 {
+                    compatible = "samsung,s6e88a0-ams427ap24";
+                    reg = <0>;
+
+                    vdd3-supply = <&pm8916_l17>;
+                    vci-supply = <&pm8916_l6>;
+                    reset-gpios = <&tlmm 25 GPIO_ACTIVE_LOW>;
+                    flip-horizontal;
+
+                    port {
+                            panel_in: endpoint {
+                                    remote-endpoint = <&mdss_dsi0_out>;
+                            };
+                    };
+            };
+    };
-- 
2.39.5

