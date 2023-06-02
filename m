Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C17871FBA8
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 10:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4DE10E633;
	Fri,  2 Jun 2023 08:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0424810E62C
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 07:46:05 +0000 (UTC)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
 by fd01.gateway.ufhost.com (Postfix) with ESMTP id 0829E80FC;
 Fri,  2 Jun 2023 15:40:48 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Jun
 2023 15:40:47 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Jun
 2023 15:40:47 +0800
From: Keith Zhao <keith.zhao@starfivetech.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH 2/9] riscv: dts: starfive: jh7110: add dc&hdmi controller node
Date: Fri, 2 Jun 2023 15:40:36 +0800
Message-ID: <20230602074043.33872-3-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602074043.33872-1-keith.zhao@starfivetech.com>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 02 Jun 2023 08:14:07 +0000
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jagan Teki <jagan@edgeble.ai>, Rob
 Herring <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Keith Zhao <keith.zhao@starfivetech.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Shawn Guo <shawnguo@kernel.org>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the dc controller and hdmi node for the Starfive JH7110 SoC.

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
---
 .../jh7110-starfive-visionfive-2.dtsi         | 87 +++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 46 ++++++++++
 2 files changed, 133 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dt=
si b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index 1155b97b593d..8dc6c8a15c59 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -31,6 +31,21 @@ memory@40000000 {
 		reg =3D <0x0 0x40000000 0x1 0x0>;
 	};
=20
+	reserved-memory {
+		#address-cells =3D <2>;
+		#size-cells =3D <2>;
+		ranges;
+
+		linux,cma {
+			compatible =3D "shared-dma-pool";
+			reusable;
+			size =3D <0x0 0x20000000>;
+			alignment =3D <0x0 0x1000>;
+			alloc-ranges =3D <0x0 0x80000000 0x0 0x20000000>;
+			linux,cma-default;
+		};
+	};
+
 	gpio-restart {
 		compatible =3D "gpio-restart";
 		gpios =3D <&sysgpio 35 GPIO_ACTIVE_HIGH>;
@@ -214,6 +229,41 @@ GPOEN_DISABLE,
 			slew-rate =3D <0>;
 		};
 	};
+
+	hdmi_pins: hdmi-0 {
+		hdmi-scl-pins {
+			pinmux =3D <GPIOMUX(0, GPOUT_SYS_HDMI_DDC_SCL,
+					     GPOEN_SYS_HDMI_DDC_SCL,
+					     GPI_SYS_HDMI_DDC_SCL)>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		hdmi-sda-pins {
+			pinmux =3D <GPIOMUX(1, GPOUT_SYS_HDMI_DDC_SDA,
+					     GPOEN_SYS_HDMI_DDC_SDA,
+					     GPI_SYS_HDMI_DDC_SDA)>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		hdmi-cec-pins {
+			pinmux =3D <GPIOMUX(14, GPOUT_SYS_HDMI_CEC_SDA,
+					     GPOEN_SYS_HDMI_CEC_SDA,
+					     GPI_SYS_HDMI_CEC_SDA)>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		hdmi-hpd-pins {
+			pinmux =3D <GPIOMUX(15, GPOUT_HIGH,
+					     GPOEN_ENABLE,
+					     GPI_SYS_HDMI_HPD)>;
+			input-enable;
+			bias-disable; /* external pull-up */
+		};
+	};
+
 };
=20
 &uart0 {
@@ -221,3 +271,40 @@ &uart0 {
 	pinctrl-0 =3D <&uart0_pins>;
 	status =3D "okay";
 };
+
+&voutcrg {
+	status =3D "okay";
+};
+
+&display {
+	status =3D "okay";
+};
+
+&hdmi {
+	status =3D "okay";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&hdmi_pins>;
+
+	hdmi_in: port {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		hdmi_input: endpoint@0 {
+			reg =3D <0>;
+			remote-endpoint =3D <&dc_out_dpi0>;
+		};
+	};
+};
+
+&dc8200 {
+	status =3D "okay";
+
+	dc_out: port {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		dc_out_dpi0: endpoint@0 {
+			reg =3D <0>;
+			remote-endpoint =3D <&hdmi_input>;
+		};
+
+	};
+};
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/d=
ts/starfive/jh7110.dtsi
index 9acb5fb1716d..66be6e65a066 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -249,6 +249,11 @@ tdm_ext: tdm-ext-clock {
 		#clock-cells =3D <0>;
 	};
=20
+	display: display-subsystem {
+		compatible =3D "verisilicon,display-subsystem";
+		ports =3D <&dc_out>;
+	};
+
 	soc {
 		compatible =3D "simple-bus";
 		interrupt-parent =3D <&plic>;
@@ -570,5 +575,46 @@ voutcrg: clock-controller@295c0000 {
 			#reset-cells =3D <1>;
 			power-domains =3D <&pwrc JH7110_PD_VOUT>;
 		};
+
+		dc8200: dc8200@29400000 {
+			compatible =3D "verisilicon,dc8200";
+			reg =3D <0x0 0x29400000 0x0 0x100>,
+			      <0x0 0x29400800 0x0 0x2000>,
+			      <0x0 0x295B0000 0x0 0x90>;
+			interrupts =3D <95>;
+			clocks =3D <&syscrg JH7110_SYSCLK_NOC_BUS_DISP_AXI>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_PIX0>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_PIX1>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_AXI>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_CORE>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_AHB>,
+				<&hdmitx0_pixelclk>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_PIX>;
+			clock-names =3D "clk_vout_noc_disp",
+				"clk_vout_pix0","clk_vout_pix1",
+				"clk_vout_axi","clk_vout_core",
+				"clk_vout_vout_ahb","hdmitx0_pixel",
+				"clk_vout_dc8200";
+			resets =3D <&voutcrg JH7110_VOUTRST_DC8200_AXI>,
+				 <&voutcrg JH7110_VOUTRST_DC8200_AHB>,
+				 <&voutcrg JH7110_VOUTRST_DC8200_CORE>;
+			reset-names =3D "rst_vout_axi","rst_vout_ahb",
+						"rst_vout_core";
+		};
+
+		hdmi: hdmi@29590000 {
+			compatible =3D "starfive,hdmi";
+			reg =3D <0x0 0x29590000 0x0 0x4000>;
+			interrupts =3D <99>;
+
+			clocks =3D <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
+				 <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
+				 <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
+				 <&hdmitx0_pixelclk>;
+			clock-names =3D "sysclk", "mclk","bclk","pclk";
+			resets =3D <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
+			reset-names =3D "hdmi_tx";
+			#sound-dai-cells =3D <0>;
+		};
 	};
 };
--=20
2.34.1

