Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F077803BCE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 18:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C896E10E3AB;
	Mon,  4 Dec 2023 17:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3B510E3AB
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 17:39:07 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a18ebac19efso822667366b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 09:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701711545; x=1702316345; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RDbV8KEqo360AWt22zz09PqUE/cssUErxHrowGLoINk=;
 b=CFoadv9kLXAP/ugQkEb8OX9Um/zQXftx8bW5LzueHZxqLyH27MHGiTxmmS3GcNIFHE
 jqZccEOvRuiiqvJ/ahz+6+ayzGBg3wmo6uP1pCTcKHe91+Z1fj12O9WDjf1MTyabxYgD
 9fqXelp9FAv7t6iK4M8HMqTWMbj/ITHSb/aoHNRjQd5pD6km1WMrZJUyByb9N28c3J8Q
 sUak30Uo1USBEp4JLPGLMYcFGRnxTF8slI29Pyl0VtQf2vP5U9F57Ol90zpterKfoxUb
 xTIJT8vrwkjccoU7yQq0ZsrBg82ejBX30hKx5Xhl3TRTXRqwmAdWyUg4/3UqLA0cmERg
 hgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701711545; x=1702316345;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RDbV8KEqo360AWt22zz09PqUE/cssUErxHrowGLoINk=;
 b=UhDNUqpsuAhRNPuC/DoSKuokkQBKFbpCBi6Qr4zJUIhcV54yUS8w1hp8vcf0dnB3Bg
 xrvMCs7aCisrw8Gt05GPJ3bXDs32qDuHRfDVvnpC1LwgBYb9sXKBWVMqGyRtp5VZLQck
 D6+z3esP4nDQ6T7z3f6bR2MrWlzhaK+wJac25F2ApU1QUdTGzYNNsBe3BlzsYD4DSp0K
 EbhH/luQy9JNGaRAb/KxB+qPrOafp0Um5/2ocTcLYJU14e9TbhHYzEF6KjoRm/YG1x3/
 53t8sdCTsEuu4hdDpQ0V72pAtfYEei4AGPT7+KTJM1rP4+ceGtB/UmCI6oJoi+kdOb2M
 lLiw==
X-Gm-Message-State: AOJu0Yw+NvffZ+VqdoEPReHZ03Yl7ezVWfCHsUQXXrdndeAnermsWH+K
 DkR7mp8KLkow0GFnwjnGOqM=
X-Google-Smtp-Source: AGHT+IFY1TkeVeRGWBrgWf2i0O9q9pzjrUYsznblS+VoCoNd0mGuLFzQmCXoRFFl4jZvbkNMocSkjA==
X-Received: by 2002:a17:906:1d4:b0:a1b:774f:df5c with SMTP id
 20-20020a17090601d400b00a1b774fdf5cmr1686472ejj.14.1701711545198; 
 Mon, 04 Dec 2023 09:39:05 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 mj9-20020a170906af8900b00a1907e36244sm5128328ejb.118.2023.12.04.09.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 09:39:04 -0800 (PST)
Message-ID: <49c6afec-022f-02de-99a0-d409b64da198@gmail.com>
Date: Mon, 4 Dec 2023 18:39:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 1/3] dt-bindings: drm: rockchip: convert
 inno_hdmi-rockchip.txt to yaml
To: heiko@sntech.de, hjc@rock-chips.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, tzimmermann@suse.de,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert inno_hdmi-rockchip.txt to yaml.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Note for rob+dt:
  Used enum to "soon" be able to add "rockchip,rk3128-inno-hdmi"

Changed V1:
  Rename file to more common layout
  Add/fix hdmi_out port example
---
 .../display/rockchip/inno_hdmi-rockchip.txt   |  49 ---------
 .../display/rockchip/rockchip,inno-hdmi.yaml  | 103 ++++++++++++++++++
 2 files changed, 103 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/inno_hdmi-rockchip.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/rockchip/inno_hdmi-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/inno_hdmi-rockchip.txt
deleted file mode 100644
index cec21714f0e0..000000000000
--- a/Documentation/devicetree/bindings/display/rockchip/inno_hdmi-rockchip.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-Rockchip specific extensions to the Innosilicon HDMI
-================================
-
-Required properties:
-- compatible:
-	"rockchip,rk3036-inno-hdmi";
-- reg:
-	Physical base address and length of the controller's registers.
-- clocks, clock-names:
-	Phandle to hdmi controller clock, name should be "pclk"
-- interrupts:
-	HDMI interrupt number
-- ports:
-	Contain one port node with endpoint definitions as defined in
-	Documentation/devicetree/bindings/graph.txt.
-- pinctrl-0, pinctrl-name:
-	Switch the iomux of HPD/CEC pins to HDMI function.
-
-Example:
-hdmi: hdmi@20034000 {
-	compatible = "rockchip,rk3036-inno-hdmi";
-	reg = <0x20034000 0x4000>;
-	interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&cru  PCLK_HDMI>;
-	clock-names = "pclk";
-	pinctrl-names = "default";
-	pinctrl-0 = <&hdmi_ctl>;
-
-	hdmi_in: port {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		hdmi_in_lcdc: endpoint@0 {
-			reg = <0>;
-			remote-endpoint = <&lcdc_out_hdmi>;
-		};
-	};
-};
-
-&pinctrl {
-	hdmi {
-		hdmi_ctl: hdmi-ctl {
-			rockchip,pins = <1 8  RK_FUNC_1 &pcfg_pull_none>,
-					<1 9  RK_FUNC_1 &pcfg_pull_none>,
-					<1 10 RK_FUNC_1 &pcfg_pull_none>,
-					<1 11 RK_FUNC_1 &pcfg_pull_none>;
-		};
-	};
-
-};
diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
new file mode 100644
index 000000000000..96889c86849a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/rockchip/rockchip,inno-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip Innosilicon HDMI controller
+
+maintainers:
+  - Sandy Huang <hjc@rock-chips.com>
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3036-inno-hdmi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: pclk
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Port node with one endpoint connected to a vop node.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Port node with one endpoint connected to a hdmi-connector node.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - pinctrl-0
+  - pinctrl-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3036-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/pinctrl/rockchip.h>
+    hdmi: hdmi@20034000 {
+      compatible = "rockchip,rk3036-inno-hdmi";
+      reg = <0x20034000 0x4000>;
+      interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&cru  PCLK_HDMI>;
+      clock-names = "pclk";
+      pinctrl-names = "default";
+      pinctrl-0 = <&hdmi_ctl>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hdmi_in: port@0 {
+          reg = <0>;
+          hdmi_in_vop: endpoint {
+            remote-endpoint = <&vop_out_hdmi>;
+          };
+        };
+
+        hdmi_out: port@1 {
+          reg = <1>;
+          hdmi_out_con: endpoint {
+            remote-endpoint = <&hdmi_con_in>;
+          };
+        };
+      };
+    };
+
+    pinctrl {
+      hdmi {
+        hdmi_ctl: hdmi-ctl {
+          rockchip,pins = <1 RK_PB0 1 &pcfg_pull_none>,
+                          <1 RK_PB1 1 &pcfg_pull_none>,
+                          <1 RK_PB2 1 &pcfg_pull_none>,
+                          <1 RK_PB3 1 &pcfg_pull_none>;
+        };
+      };
+    };
--
2.39.2

