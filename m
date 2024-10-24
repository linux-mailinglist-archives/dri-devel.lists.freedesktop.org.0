Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 445BC9ADA58
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 05:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0A010E89B;
	Thu, 24 Oct 2024 03:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="iOLRF4i1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic312-27.consmr.mail.ir2.yahoo.com
 (sonic312-27.consmr.mail.ir2.yahoo.com [77.238.178.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6869310E899
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 03:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1729739919; bh=3xzqdMxf/0ZBOH+vce6LxIwlK1/hvHyOLExiGTyiQbQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=iOLRF4i1tRRj0TdUAdRVCpX9f2HLikQizC+szwxYj0Nd2R20dVcHP6YeKGQRJjDe+h2xUgzlRDZy38S1jV94FnexFsDIiKw68mol6qQvWPHiPu7r2NCaJa13h5bLKUrnoK13AH1ErDg3FKd6pcugoRpDPKXfe5C3Q3hmjQapAAslrsM0RilkObVCcZrR5kdHbL20U3NB4YgpQbq/hzY15RiSs1fZsEBj1kL9ot51YB9mpjxNkXCzMp8MrydPjWgCh8zi7z6kdHUN8xj8a6Ny0f9lFylKb4VnKUiAS+PQS1ubR1KY03gQSJfXDmDLPwkOdPVpqc0HGcKnnWS3BPz+sg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1729739919; bh=s7NFW3/avSyfDq/VHUlHLL/2poo9O6vZMHlgNJcmMlQ=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=Kz3y3f/s2iywbOOWf2y0SQrUe6sq/HxEq8j/DLehNu8eyW1wbsbbKRVitJ9eSUVYtDKPNYqMFsYV9C+Cs2KhP7kd4nOnoh4exf5dNiU0m7ZnxiEf0szNnzJ458WeLCrpks1V9/tzskaut8hip/4pp/YPieKaOB89M0hr7dJv8MrL1YpaR/lVtL5L/F41H/qXrDtR+u3WMqTPYBMBmZi6zYwxw9NcFPOl7ey2hi9IVZSGAtROnSsE/YW047QYnKPtGXBCDvm+KeXmtjhx8YmmoRLbHPTCPn9mJ+g8QscJXJTo6OO0oJfdFZEuCKflzYAsfo1n5kzPC80B5HMwX0azXA==
X-YMail-OSG: aB4uCdQVM1lZaXNaYAagW_h62f55Pz8BI.TllltTGSA3QYgKYBVbAnhk0QBBD3n
 JGyvOBg0501Y_qymG04mGr_8RgtOeJO1MX4qJGPJPH79UgOssUgu7lpz9mZg5_6L8QotXuFgtY_7
 1QmJX3nSo077zgDMaZIiKNrVntmm8YuDxrrLAUsGTBAewDDMTSRVLqj5jfLLUyfOKmyTF0xMwnIs
 WMgS.pKLYjUBtqHaQb2iWK0c3rNTtRT9u.74Lw0_ykjrYfTQQgmxonISRo2hjWgfdiQquAymGSsL
 dLmrdjw7C5qUiUMqytm2zif.C6t2HrxHRuHy17GhXzkqATO.6XOoxfAgxNkeytONLMi_ewJVlTXi
 pG4NL0GwlGHkym7Y3zoUJggR5SE5Ne6T8bv8g.pbZZm0zYfP3IjManDkWoZtFjrVfP2ZQt7fqRlV
 ptRBtlYfKFSAdr55SCIRflQipIFREHD5.P_v7EHwPvCb5kWWjlnr8exRPzeHJxH.4nkgy_1pLdr4
 _5pDRA4qg4a29uXk7oFufx5.F8nXJQ3i7hCSG9CdW0_alQd5w.Rx__eEKWYvjQKgpR7kXnGAR1c8
 B_JqGRYSxMAW95MJDWDy0cAKZ70cI78ZRwe7npPDxtCcrZe9O8tJzTXrrofKyE.ImsUkX8RXosUY
 bI6rUHiK0TrDTt5TCRLBAa7RSihnT1IZFZn0wVBbdkfdvC5fyGgqRsrYySC1xfhP40gmOry15c1F
 6dr3PM6vxdsAj9XEJhDebrRQc..M1hnKZRt6hxFV9j4pLTtHClFnJo59PQtAiJ.HafmCOF4yq7EF
 80wrnqIpoy0jDTxD3S00IxAdxK5UUn57_hSngWyKVMNbcWUDHMgc_4Q2LYJWoA5IEXGeD0n8H0Xy
 lCRKIhUNwobcqT3c4QfGbN3bCWaUdE8QWiHqxQsSU302f7te7RFREcjI5d5iyHzIYBeoJ4zxipgz
 GhodiXtgTv0a0w1AfrtaUOcF0bjXkRIOradq_Gky3boFfOyVj7hkS_Oj31lDZz7GFWEd0JQjGit_
 _j1rogNdFrVPu8mL8PKD4ISlmvKNZniJQi17Qf6VnfUF8jqIYHZPOkliIMTVvJ0qflCuObajKoOS
 VlS4b5ajKrRKgIc09Eel44Qstezkga6auMRLzcoN9tuF80jN0OsLITQTsg_Ysi5kLvDRbqtcQknP
 XCEfpwtkC_SPyXchwJJn_0tHYIcqOrLScerJf0IoRLq1ITgp49g7KEklNNa9n5CnKc.dyOR15NgL
 UeG0bQEEPWQfZFiLCl3FShBtKcqGJOeYeMUKafQPIWmxrArcZNU7Dsqh2UsIbiFYJJdJKBeq_a.j
 3aUHyV.vf_dmixQZjsW9FEIqv_OBna6yvx6fBKMoNvhbzOk3sqlc62e.2nZwsNJHn.FexJFepnPt
 nc779IArzi0eAZfcUald7HSvyXeyQsWgbjOGPdvpReB25yRv6Mw.x2470sddwoEaBL1eD0QMXhsw
 J9BW.gs.uUFj5ih0VK8rSSjM9u5mzvGb7ooNPZmDfZA1gJd2t1ZcKCcwG3R4eXQMs4t6KDYvzIUY
 60zhBWMxyoxrOrBFyTFmiltbrd.i7XZ14E4mBs8HdGNjlQrL4jtl_UZnUAFP.A_eBZSbpJP8ajtD
 lFhXUJ1WIBS1hJE64iKnJPYsRXaY1Jn6W0u_9QalAO2pkVs5U2Wg9QlhpsOrEVnbVJ.wvtLxwNvo
 Ei_gScIxpxXds2_eRyA7NptBYD0hBlhV8.BylnPB2xbwhymDcpdfzXFhncO2PHRt5_IHZhN29vb7
 FOEtwEzf7FZqtH3siOHGlu8oi8ypSHHqnqGe3lvfc3jvF7m7nSmbmRhVirrs5AyIe5llOjTsrPFR
 fuoXYjNGycsKrYAI6LMQmx4dsok3FCrBOfB2tzOroc46Wv9OF4SzahfxZDmeZ17DsiJS3U_U5zIx
 0K8JZMLBtUsjI_ufQSkn5_wMjxA4gaQ.G4ReBMkazTgOGjKsU6xDNlyVg0LNYfyD8wovblB9Z5qa
 ItrsdqJLVpUcg5TxgN2dKKGnUBuJSuQutorgdfxkJKjmzku5zmEzuZNdnC3C7.hfLL1LHs1otDjk
 Gsc2V9CfRsg7DlJ.8hWTG69sTORhpGhAxNG9BZYtxQjHFZP5qkE4HoRZlVUQx_RfOBhj1UkYceP6
 qHW6jKxQ6y4PczjioivpX.3xO8vZM1KmdZFb9j.SLDXnaW4IC5a_1.TSzvyBPEtjrD0DVqzReF_S
 tZjhVkTmtBJXo_8r2IEoh30sLnGbCWEeAco0tjiBie6t7CmCgAJ6IA4sKmy2X4L5vBdQCT2eaXGP
 cLmJ4bswGXGbvGWPQqiV3WA.H7hM6u5jgU1v0gOhVOtZfk4xp2YkkxQ--
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: b6346f4f-a635-496f-81ef-aea7606edd5b
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.ir2.yahoo.com with HTTP; Thu, 24 Oct 2024 03:18:39 +0000
Received: by hermes--production-ir2-c694d79d9-2zgj2 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 26d1652bc1703d2ade3e89c3cd33808b; 
 Thu, 24 Oct 2024 03:18:39 +0000 (UTC)
From: Jakob Hauser <jahau@rocketmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Jakob Hauser <jahau@rocketmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/5] dt-bindings: display: panel: Add Samsung
 S6E88A0-AMS427AP24
Date: Thu, 24 Oct 2024 05:18:24 +0200
Message-Id: <1a3b08a4bc9944ebe05ee48bcd8ea11bcf3e9103.1729738189.git.jahau@rocketmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1729738189.git.jahau@rocketmail.com>
References: <cover.1729738189.git.jahau@rocketmail.com>
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

Add bindings for Samsung AMS427AP24 panel with S6E88A0 controller.

Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Patch is based on current branch drm-misc-next.

Changes in v3:
 - Dropped the second "bindings" in the commit subject.
 - Applied 4 spaces indentation in the example.
---
 .../panel/samsung,s6e88a0-ams427ap24.yaml     | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml
new file mode 100644
index 000000000000..db284ba5be20
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml
@@ -0,0 +1,65 @@
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
+  flip-horizontal: true
+
+  vdd3-supply:
+    description: core voltage supply
+
+  vci-supply:
+    description: voltage supply for analog circuits
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
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "samsung,s6e88a0-ams427ap24";
+            reg = <0>;
+
+            vdd3-supply = <&pm8916_l17>;
+            vci-supply = <&pm8916_l6>;
+            reset-gpios = <&tlmm 25 GPIO_ACTIVE_LOW>;
+            flip-horizontal;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
-- 
2.39.5

