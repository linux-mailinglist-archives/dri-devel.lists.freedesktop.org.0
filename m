Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E80B119E4F9
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 14:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33826E1C0;
	Sat,  4 Apr 2020 12:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C906E12D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:36:43 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a81so7703215wmf.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=V495F/LWz4DvLP06Qim1MuItKKlrnJlu4+4yHQQXN3g=;
 b=nfWfM9MxWzYxib7CCdOhh1sz088O06aWnkrNfYybv1cChjuel6N+MlMUZK+kravUOb
 zmEYj8LLYMq5DwhpWpdzgqEK2OyiIz5deuMd48f6GJtb4FG4Da0lUD2/M0E98g6cTZ1E
 7ece6rJUpQq7T+1uRuNrYSUkfPMPyl8cLFWwGbFhZG+pgPHHIwJkrhlWIjOVB/EIVNYK
 QO/1rOwNCCUetIeI765+tV5Cz8iFcYqd8pcvKxShzWTuwhTb07YVmKV/Ly1Hp7jkgPid
 uKFHoVKsyrFBg7l7GIB+ZmovNf5DroJQE1CUZT+oDKsxoOlbN5tnMv1ZuymiL4W5KA7o
 agww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=V495F/LWz4DvLP06Qim1MuItKKlrnJlu4+4yHQQXN3g=;
 b=ah4minxNDSuoK3JglXBjRK4o4Yc2QywvsYeAzaFivw33sM5lXgewfGkriZfFGiFDHk
 llYBrzggXrLydKLcjjwVz/4nSa0oDAGjH5B+Bl2t4AQlRiD1N9lOnkEmggHC70z2lcaR
 jCdRt1i7dmU1oNjYW6f7Bm82V/57yQQM7mVAts9N5l1bSb4wCFYgP5Jh7yYZkqXMJFUb
 1d4JqFbkVHpyZUHThFlSsOxRCH7I/moc1mIpaEZTv32cZ9qcicbBXwKdFAPAkS8W+01g
 Q+zj5jBFHSkEFN1Q3XLyfyc/fyirNa+Vqg7n6X2C6nsIjWrQd0b6pl1grk9iDJh9H3Jc
 BBYw==
X-Gm-Message-State: AGi0PuYbz0X+QO9D77q0IL9GYJ7QbKH2/qejAvuwRoRbnd8n9XAbatrf
 c29p7SgmM+qIfFlDvKKQCYw=
X-Google-Smtp-Source: APiQypIVKv/R7Hs97n0mr3aADn8sArWU07D3Vlz8dk6qnR8PcirGlBx8cyH2W7SgaAGeSZ6z9BCpqg==
X-Received: by 2002:a05:600c:54d:: with SMTP id
 k13mr8587182wmc.81.1585921002311; 
 Fri, 03 Apr 2020 06:36:42 -0700 (PDT)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id r11sm12523729wrn.24.2020.04.03.06.36.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Apr 2020 06:36:41 -0700 (PDT)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v2] dt-bindings: display: convert rockchip rk3066 hdmi
 bindings to yaml
Date: Fri,  3 Apr 2020 15:36:30 +0200
Message-Id: <20200403133630.7377-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Sat, 04 Apr 2020 12:45:44 +0000
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Current dts files with 'hdmi' nodes for rk3066 are manually verified.
In order to automate this process rockchip,rk3066-hdmi.txt
has to be converted to yaml.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
Changes v2:
  Fix irq.h already included in arm-gic.h
---
 .../display/rockchip/rockchip,rk3066-hdmi.txt      |  72 -----------
 .../display/rockchip/rockchip,rk3066-hdmi.yaml     | 140 +++++++++++++++++++++
 2 files changed, 140 insertions(+), 72 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.txt b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.txt
deleted file mode 100644
index d1ad31bca..000000000
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.txt
+++ /dev/null
@@ -1,72 +0,0 @@
-Rockchip specific extensions for rk3066 HDMI
-============================================
-
-Required properties:
-- compatible:
-	"rockchip,rk3066-hdmi";
-- reg:
-	Physical base address and length of the controller's registers.
-- clocks, clock-names:
-	Phandle to HDMI controller clock, name should be "hclk".
-- interrupts:
-	HDMI interrupt number.
-- power-domains:
-	Phandle to the RK3066_PD_VIO power domain.
-- rockchip,grf:
-	This soc uses GRF regs to switch the HDMI TX input between vop0 and vop1.
-- ports:
-	Contains one port node with two endpoints, numbered 0 and 1,
-	connected respectively to vop0 and vop1.
-	Contains one port node with one endpoint
-	connected to a hdmi-connector node.
-- pinctrl-0, pinctrl-name:
-	Switch the iomux for the HPD/I2C pins to HDMI function.
-
-Example:
-	hdmi: hdmi@10116000 {
-		compatible = "rockchip,rk3066-hdmi";
-		reg = <0x10116000 0x2000>;
-		interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru HCLK_HDMI>;
-		clock-names = "hclk";
-		power-domains = <&power RK3066_PD_VIO>;
-		rockchip,grf = <&grf>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&hdmii2c_xfer>, <&hdmi_hpd>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			hdmi_in: port@0 {
-				reg = <0>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				hdmi_in_vop0: endpoint@0 {
-					reg = <0>;
-					remote-endpoint = <&vop0_out_hdmi>;
-				};
-				hdmi_in_vop1: endpoint@1 {
-					reg = <1>;
-					remote-endpoint = <&vop1_out_hdmi>;
-				};
-			};
-			hdmi_out: port@1 {
-				reg = <1>;
-				hdmi_out_con: endpoint {
-					remote-endpoint = <&hdmi_con_in>;
-				};
-			};
-		};
-	};
-
-&pinctrl {
-		hdmi {
-			hdmi_hpd: hdmi-hpd {
-				rockchip,pins = <0 RK_PA0 1 &pcfg_pull_default>;
-			};
-			hdmii2c_xfer: hdmii2c-xfer {
-				rockchip,pins = <0 RK_PA1 1 &pcfg_pull_none>,
-						<0 RK_PA2 1 &pcfg_pull_none>;
-			};
-		};
-};
diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
new file mode 100644
index 000000000..4110d003c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3066-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip rk3066 HDMI controller
+
+maintainers:
+  - Sandy Huang <hjc@rock-chips.com>
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    const: rockchip,rk3066-hdmi
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
+    const: hclk
+
+  pinctrl-0:
+    maxItems: 2
+
+  pinctrl-names:
+    const: default
+    description:
+      Switch the iomux for the HPD/I2C pins to HDMI function.
+
+  power-domains:
+    maxItems: 1
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      This soc uses GRF regs to switch the HDMI TX input between vop0 and vop1.
+
+  ports:
+    type: object
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        type: object
+        description:
+          Port node with two endpoints, numbered 0 and 1,
+          connected respectively to vop0 and vop1.
+
+      port@1:
+        type: object
+        description:
+          Port node with one endpoint connected to a hdmi-connector node.
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - port@1
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - pinctrl-0
+  - pinctrl-names
+  - power-domains
+  - rockchip,grf
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3066a-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/pinctrl/rockchip.h>
+    #include <dt-bindings/power/rk3066-power.h>
+    hdmi: hdmi@10116000 {
+      compatible = "rockchip,rk3066-hdmi";
+      reg = <0x10116000 0x2000>;
+      interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&cru HCLK_HDMI>;
+      clock-names = "hclk";
+      pinctrl-0 = <&hdmii2c_xfer>, <&hdmi_hpd>;
+      pinctrl-names = "default";
+      power-domains = <&power RK3066_PD_VIO>;
+      rockchip,grf = <&grf>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        hdmi_in: port@0 {
+          reg = <0>;
+          #address-cells = <1>;
+          #size-cells = <0>;
+          hdmi_in_vop0: endpoint@0 {
+            reg = <0>;
+            remote-endpoint = <&vop0_out_hdmi>;
+          };
+          hdmi_in_vop1: endpoint@1 {
+            reg = <1>;
+            remote-endpoint = <&vop1_out_hdmi>;
+          };
+        };
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
+        hdmi_hpd: hdmi-hpd {
+          rockchip,pins = <0 RK_PA0 1 &pcfg_pull_default>;
+        };
+        hdmii2c_xfer: hdmii2c-xfer {
+          rockchip,pins = <0 RK_PA1 1 &pcfg_pull_none>,
+                          <0 RK_PA2 1 &pcfg_pull_none>;
+        };
+      };
+    };
-- 
2.11.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
