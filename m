Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 208249B216B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 00:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBC110E221;
	Sun, 27 Oct 2024 23:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="HWahP+/M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic302-21.consmr.mail.ir2.yahoo.com
 (sonic302-21.consmr.mail.ir2.yahoo.com [87.248.110.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F1D10E213
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 23:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1730072544; bh=kM6i2o2nM6RchF+99bF35iyDd+PooEIpo890QP1+Q7I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=HWahP+/MtSUYbw3xFvT74ttA8slBRPIesULiBeqUw7i+0ZR1POEsoTqn7atM16qM43ryUyG11iPwSTTncL+m8X7QTgxYwFbwxjiFawJ4HY4mOHxs3zs+Q5wRipc3uDVyXVaZ1xOtViFS3snYtjZhxX7GWYZG7J9+iuTBLM/cTEcOuc1gaSLX4NK3Zuo66gGREsRIcDisGRV+ll3NKeit602OH8Ji1ivP7zFEsbOJ8LKUZwT6CmOnSoUONailuxq+p+J7XTyrOPCWqsLO8H4RL53SdDUiOFPNVM/8LoeAJyMyiTev8W7EuQsDegX8HbSCGy3kKDneA3X15MqWeRG1XQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1730072544; bh=qQjTSUITOF4lNQEGQBBTh/UN+ZZBLNoQFZUleXxpbUn=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=A8h8RLRq1a+s3Cou6/Ac8r7liSrAL46QWk+YudyY9aoLzGVyScRmHzBEQYwUPybQ0ypHILcLi+AeZ+pYKFJfCj3e+uAwBe+ZjiNl7WMocG+NJReX5TAfY+BFffGviN+Hk8SnaF4lhILNvUiVoWb/nKnHA7Y5TaPy7+ynuHr/+X1trRa2Xuoi3HU2Uw/kR9wfWQgRsJrxrMMRRT0AinHXvv/FBhB7eqqy9wiW7pxQAbPL6PGT3EYcm0+Se00hCiarx7WghgsqXizxMsHPuJ2zurM3Ze1MVvLe1VYCtXC+dnAMXAHK78x0kcwXBCH2DTgdIB9fFC6M5WL2oAbr/XN/fQ==
X-YMail-OSG: rVvfsI0VM1mC2RwJWLmQRa_oVtvIMGKQrbEjWU4lxCnbewuU31UWgZCu.IP23JD
 AudoLchvSsHE.VeLn4_xrD8uyGjiT3nyE_e2TDP.T8xfXwiVilnxeSGw0dAB7abu.wUsEMQ8nydK
 rlyF4CtNxt..b4p1.tdADMVwEXZIvPJPWgoWxeeSQzN41uZJ5OPaRR3WNPWD90N4bAyaizWfkHk4
 7Xa4OY.XwdI0rgxcKLeXx8s7IICCBRD4eCA22Qzq_EpSATZ8z.MrPWMV8Qu4WyIh814okOrudqzH
 .WTp7b.xXEM.k1OgC4sfNSBq4v7XQGYX6z1KfLHd7LaYOprpeJIOqosbC.16eWUKZPudBaHNgT0Z
 Ab6f8wjIXtSUVytp95VKd5Yk18DKvg_LTaDYkZrItf84B2XmoT6Bw4542ZcCe9E1xZKSjrpziqrO
 8XL8ifBi4PspVhoIkkSywO.SKNcqBoMrYmL6afw7Gfx3iAdo2a88NkYABvtGivrGOPAzhXjGbfvN
 z430hN1t.9BWy.claHx4FIgJRnWuEWFQCH5kHSLVtWYWoTxEhtX0Mcg77LzsJD2ayAJEZa0cQOOb
 pkJuscy4FaWtpVGwQvi1IbkC6Eg48S.ueTGV7rM09.REVmSLUIIa.pUEQiNEuxwVdnC6MMJSboOw
 jZWT27BTebmxysWGBztZsqiyRzKH69wPj7IAiF4NfxxVgj1sX.YGJfZq.yM6vSA2cDNi4ebSFs_y
 Tcsxd.6fLlv4jDtSzo4QeAgchXkW75AHHzuNDAwXyZpoPqBglff9xVAYFcF.weRK5UaVdJLnQKKi
 Qr5V1KXVZrL9vm.E5XFXF0l6FlyxDlZGKom1QiFz8TthTlMCXAF9sDBzw2guuR12vmnVsu6nAutl
 6izQJmggM_sxEv_6bvWdZ76fYumT0ic.6B9Fv3osKvXB0s7VLWWwmdEQhvuiNDM5ui5Pf5FDg2ye
 UEv._i.uIRHTns.gu9xUmu4WF..oWCWmMRz4Mg1rqDbc0EMGQnC_S1lrRO1jflV_LPbBrABSxWAJ
 CLXfBaIn_q4JBNWv8hAsGCa2JkvX4Xea636wYf6rCriRonCjESFRW8OgGCZDkEyi4MIKWGIhvO5N
 4rHAUuzSorIZUIAQpLf9lcu8wOjGnGZ9W51ZZbmRYZfel4XvcAjfzXvQfn_BaHhSRqBnPdIZbwnJ
 Ac0_EhZ945ZoIHjui6Sww7AyUMUm4oOyHau_Kn0I.3pp._gajKpgUYf2LRpHuvcXxfYlmV19aIHI
 dwKohE8aTAiE.MeuTTum4mKIeT5Mr_yJlkiZPAl7JhdIKgfQ08d9F7UaazWsqg.WLwiSgoVH8qzx
 RwfuejwpeIWil_x7dIKXSZGsGP0rf4.CiN2uDxhFblxQH26tnkV2oXGy0iVnkBMS8tJ9cUbcLt9O
 lwVmeeC_NO8agXjhpZe4z4GI31x4PW4Nmya5SLzNvB.stmzXjcwcSc55pMvHnWPeRZAk84FOPQyD
 QBtU6Igq9tm8BCGstIjC31GlIpgiEUAzwhM.riIJkKsKGp8WI_k4EIkGZQK32Bj969tTqQm.gHBU
 ynKnKT.hx_Kj5wLq3yEGY72vvXIqic4OyunSK.PzLiYH9ZlX3Ml5cDJWE49aag9Q23LEuurWsdSN
 eBRYrSDzO5u1CtOr2Ayq_.fTB99iFXxkbOzWy9RZVH5cJhQWiaik6SeEmENQGjNhsp9qXw3lVT3F
 J8B1j2Bo_xbRKu4oXr0HMQjUqoQ6.CnQopWkcIXfukFOvuMX5MD4LNVe2I8ODLftwEKLFZc04NBW
 Hmngwg0QoWgIGVydppZa2pczvwexwdyQDY1WhFTYuxyuu.pyeQOJrgFyZTf3gDFwxUbJFHAOSLXR
 fpDNxiAl8HCaUAfK0FtXTG1qHdIFpi7lPrtYk0aYw9e4k7O3mP3N7ph59srrLEtOxgS6nb_y_wp3
 37E2qsj7qyt7YD7BZUIBMKqtF1A9e.UDPkFuiZEvFEIz8.rs6nzvZPnH2YoQipaV_KH1lJEyWR9K
 ugB6kSSDOz2PaFLOVCEEBP9QEDOZt..0oGFSW8N4eUX9HP1VaH3oc2Qmw4eQwtOH3yvy2xOnxSRI
 BUk2WhLLDwdoKFRYQpTwKB4HehcOIqUgStlwAK547SwiVvPEoE24RgG1uQZf6F8_TQoQnFDe91C.
 rz1NapfwQ4cPk13uUe19EFSaInbDjqj8cayEK49kwGx02LylBOuNQP9tt3oeJACiToQYO1z5z.K3
 CFKcUBgDGZp98uheupBHLbzNS5mWdFLirQm5Cm5H.jCZODHzMCpYZaTZSribBFQlgf7XkWd44q7W
 TKxixtYL5xKk0xawM13cBRb9mx3QQvT6JU7P6BNowPw9HCnZfMA--
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: 1ed29228-5fc0-4434-84c9-220ddcf5fead
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.ir2.yahoo.com with HTTP; Sun, 27 Oct 2024 23:42:24 +0000
Received: by hermes--production-ir2-c694d79d9-qzm27 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID fc681596c483b48011d8a98a0d7203e6; 
 Sun, 27 Oct 2024 23:42:19 +0000 (UTC)
From: Jakob Hauser <jahau@rocketmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Jakob Hauser <jahau@rocketmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/5] dt-bindings: display: panel: Add Samsung
 S6E88A0-AMS427AP24
Date: Mon, 28 Oct 2024 00:42:03 +0100
Message-Id: <d60428e7dad57efd42948adfd34b81335dabcd1f.1730070570.git.jahau@rocketmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1730070570.git.jahau@rocketmail.com>
References: <cover.1730070570.git.jahau@rocketmail.com>
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
Patch is based on current branch drm-misc-next.
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

