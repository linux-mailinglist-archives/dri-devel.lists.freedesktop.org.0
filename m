Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6042E70E816
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 23:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F2E10E4E9;
	Tue, 23 May 2023 21:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDFF10E4E9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 21:54:00 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-64d604cc0aaso19557b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 14:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1684878839; x=1687470839;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=L+/WVSZXE3F0lPhuRahYiKIjIiDSBU5lUBmConnJxqo=;
 b=To7aAtsR8ArLxpaoQOUSRnTbP90V+5g/Y+5k+vRMI1fcFIvc1hySGqKEAI5Wq+wshy
 zxrmOWUU0hxqT4d5iu23VL3AEPS2qbJ9L49cdWMoH/z6PQehkVeEhPpxWMfbtDeXDfYe
 X2/t957hd7XJzKVF4ZpNDwEGRtfC34gak6TvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684878839; x=1687470839;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L+/WVSZXE3F0lPhuRahYiKIjIiDSBU5lUBmConnJxqo=;
 b=Oh3KZ4sO2v4ky33LXIVOa4HK7jBHqQHOfN9d7AGIsgew9Tm6Q6F/fq9QmiopUzlwaX
 zqANKvUGfWHhAZPePYKBapO6CypQQI4PNAUKjPxg40DruqA6s8CizPxgSsKS1QBSMkRF
 PbteqWUYsc+Idz6UYRQaTM53oD3lHiQrTNfg0nUBTQj4wNw0ukvItZVqKNhKL7bqiA4i
 OxcSbCHGru39dPC/P4X0+V/Q8f43MsqSbLg3pJq0fAFr1csuS9Vmg1bRk3K4/BjGfFHG
 reEH9eJ9heU5QtZsnTX6QHCb8HyY2pb6rQdex2si1rnD/a3CiQYAgB2Mw6XuwDPAx7M+
 UE1g==
X-Gm-Message-State: AC+VfDyfyM4/j4Z7AQBk6/grlr1AmGs8j2ehM9d+wZbN6pyNhGcvMOey
 KfH7qwAOQOAGle4u0/hLBii91g==
X-Google-Smtp-Source: ACHHUZ7AmSBlU/Hd0Hai5K5aI0MMCPhXJdl2nZVhD/LqT37vgiqoZThbv397FHeLU5DVez1itEHGrQ==
X-Received: by 2002:a17:902:d2c2:b0:1ac:b4db:6a62 with SMTP id
 n2-20020a170902d2c200b001acb4db6a62mr16196725plc.65.1684878839320; 
 Tue, 23 May 2023 14:53:59 -0700 (PDT)
Received: from stbirv-lnx-2.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a170902744400b001ae62d7cb2bsm7189820plt.199.2023.05.23.14.53.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 May 2023 14:53:59 -0700 (PDT)
From: Justin Chen <justin.chen@broadcom.com>
To: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH net-next v4 2/6] dt-bindings: net: Brcm ASP 2.0 Ethernet
 controller
Date: Tue, 23 May 2023 14:53:43 -0700
Message-Id: <1684878827-40672-3-git-send-email-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1684878827-40672-1-git-send-email-justin.chen@broadcom.com>
References: <1684878827-40672-1-git-send-email-justin.chen@broadcom.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000ba85dc05fc636c18"
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com,
 Florian Fainelli <florian.fainelli@broadcom.com>, opendmb@gmail.com,
 christian.koenig@amd.com, simon.horman@corigine.com, richardcochran@gmail.com,
 linux@armlinux.org.uk, conor@kernel.org, justin.chen@broadcom.com,
 edumazet@google.com, robh+dt@kernel.org, justinpopo6@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, pabeni@redhat.com,
 sumit.semwal@linaro.org, davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000ba85dc05fc636c18

From: Florian Fainelli <florian.fainelli@broadcom.com>

Add a binding document for the Broadcom ASP 2.0 Ethernet
controller.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Justin Chen <justin.chen@broadcom.com>
---
v3
	- Adjust compatible string example to reference SoC and HW ver

v3
        - Minor formatting issues
        - Change channel prop to brcm,channel for vendor specific format
        - Removed redundant v2.0 from compat string
        - Fix ranges field

v2
        - Minor formatting issues

 .../devicetree/bindings/net/brcm,asp-v2.0.yaml     | 145 +++++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml

diff --git a/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
new file mode 100644
index 000000000000..07f7373b9d64
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
@@ -0,0 +1,145 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/brcm,asp-v2.0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom ASP 2.0 Ethernet controller
+
+maintainers:
+  - Justin Chen <justin.chen@broadcom.com>
+  - Florian Fainelli <florian.fainelli@broadcom.com>
+
+description: Broadcom Ethernet controller first introduced with 72165
+
+properties:
+  '#address-cells':
+    const: 1
+  '#size-cells':
+    const: 1
+
+  compatible:
+    enum:
+      - brcm,asp-v2.0
+      - brcm,bcm72165-asp
+      - brcm,asp-v2.1
+      - brcm,bcm74165-asp
+
+  reg:
+    maxItems: 1
+
+  ranges: true
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: RX/TX interrupt
+      - description: Port 0 Wake-on-LAN
+      - description: Port 1 Wake-on-LAN
+
+  clocks:
+    maxItems: 1
+
+  ethernet-ports:
+    type: object
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "^port@[0-9]+$":
+        type: object
+
+        $ref: ethernet-controller.yaml#
+
+        properties:
+          reg:
+            maxItems: 1
+            description: Port number
+
+          brcm,channel:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: ASP channel number
+
+        required:
+          - reg
+          - brcm,channel
+
+    additionalProperties: false
+
+patternProperties:
+  "^mdio@[0-9a-f]+$":
+    type: object
+    $ref: brcm,unimac-mdio.yaml
+
+    description:
+      ASP internal UniMAC MDIO bus
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ethernet@9c00000 {
+        compatible = "brcm,bcm72165-asp", "brcm,asp-v2.0";
+        reg = <0x9c00000 0x1fff14>;
+        interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+        ranges = <0x0 0x9c00000 0x1fff14>;
+        clocks = <&scmi 14>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        mdio@c614 {
+            compatible = "brcm,asp-v2.0-mdio";
+            reg = <0xc614 0x8>;
+            reg-names = "mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            phy0: ethernet-phy@1 {
+                reg = <1>;
+            };
+       };
+
+        mdio@ce14 {
+            compatible = "brcm,asp-v2.0-mdio";
+            reg = <0xce14 0x8>;
+            reg-names = "mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            phy1: ethernet-phy@1 {
+                reg = <1>;
+            };
+        };
+
+        ethernet-ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                brcm,channel = <8>;
+                phy-mode = "rgmii";
+                phy-handle = <&phy0>;
+            };
+
+            port@1 {
+                reg = <1>;
+                brcm,channel = <9>;
+                phy-mode = "rgmii";
+                phy-handle = <&phy1>;
+            };
+        };
+    };
-- 
2.7.4


--000000000000ba85dc05fc636c18
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
NhTY3E+cXCB11wty89QStajwXdhGJTYEvUgvsq1h8CwJj9w/38ldAQf5WjhPmApYeJR2ewFrBMCM
4lHkdRJ6TDc9nXoEkypUfjJkJHe7Eal06tosh6JpAgMBAAGjggHZMIIB1TAOBgNVHQ8BAf8EBAMC
BaAwgaMGCCsGAQUFBwEBBIGWMIGTME4GCCsGAQUFBzAChkJodHRwOi8vc2VjdXJlLmdsb2JhbHNp
Z24uY29tL2NhY2VydC9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcnQwQQYIKwYBBQUHMAGG
NWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwME0G
A1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxz
aWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMEkGA1UdHwRCMEAwPqA8oDqGOGh0dHA6Ly9j
cmwuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3JsMCMGA1UdEQQc
MBqBGGp1c3Rpbi5jaGVuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSME
GDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUIWGeYuaTsnIada5Xx8TR3cheUbgw
DQYJKoZIhvcNAQELBQADggEBAHNQlMqQOFYPYFO71A+8t+qWMmtOdd2iGswSOvpSZ/pmGlfw8ZvY
dRTkl27m37la84AxRkiVMes14JyOZJoMh/g7fbgPlU14eBc6WQWkIA6AmNkduFWTr1pRezkjpeo6
xVmdBLM4VY1TFDYj7S8H2adPuypd62uHMY/MZi+BIUys4uAFA+N3NuUBNjcVZXYPplYxxKEuIFq6
sDL+OV16G+F9CkNMN3txsym8Nnx5WAYZb6+rBUIhMGz70V05xsHQfzvo2s7f0J1tJ5BoRlPPhL0h
VOnWA3h71u9TfSsv+PXVm3P21TfOS2uc1hbzEqyENCP4i5XQ0rv0TmPW42GZ0o4xggJtMIICaQIB
ATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhH
bG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwj8BKLXNpALfemdRAwDQYJ
YIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIP++RyIACGRzcDCUnwA5UNOPmrPtSK7NbQqq
0GqfhUbOMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIzMDUyMzIx
NTM1OVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFl
AwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATAN
BgkqhkiG9w0BAQEFAASCAQBdvjRoO5lJeWxGTT42FdBtpP6lnDZozoG9yor6KaLd2x8xqOup04DV
kPTUExRK0TB8Z62r32PipQCVVcKJxJu/kjcZ5UOZwx/d52xf3GgptJ4JgtH8UNZtzRlj3oU63YYL
7ydHdJm3y0AvlY1TeanhTwGTzCu3TH5PIcVxqzFFAFqRmE1I7BkqDijLTdvpDJguJwuAUMicWdfj
ZOcmXCeMnt5ExI+lav4CZ5cvYKemg+uBO0/UlO3l698av7F91g5n8PyvRgdKW3gCS3ET0jYAMBUr
o/labzG8h+vVStuSt20wEUN2pZQ5HnQCGtS9gx0J2tfUHQWrn/lLp6uW9sXY
--000000000000ba85dc05fc636c18--
