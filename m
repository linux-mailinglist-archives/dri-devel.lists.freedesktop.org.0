Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9D876B073
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 12:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D0410E391;
	Tue,  1 Aug 2023 10:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
 by gabe.freedesktop.org (Postfix) with ESMTP id B5A5E10E38B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 10:10:38 +0000 (UTC)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
 by ex01.ufhost.com (Postfix) with ESMTP id 2459C24E2AA;
 Tue,  1 Aug 2023 18:10:34 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 1 Aug
 2023 18:10:34 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 1 Aug
 2023 18:10:33 +0800
From: Keith Zhao <keith.zhao@starfivetech.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v1 v1 3/7] riscv: dts: starfive: jh7110: add dc controller and
 hdmi node
Date: Tue, 1 Aug 2023 18:10:26 +0800
Message-ID: <20230801101030.2040-4-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230801101030.2040-1-keith.zhao@starfivetech.com>
References: <20230801101030.2040-1-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
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
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, Rob
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
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 43 +++++++++
 2 files changed, 130 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dt=
si b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index de0f40a8b..32e5cc96c 100644
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
@@ -231,6 +246,41 @@ GPOEN_DISABLE,
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
@@ -254,3 +304,40 @@ &U74_3 {
 &U74_4 {
 	cpu-supply =3D <&vdd_cpu>;
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
+		hdmi_in_dc: endpoint@0 {
+			reg =3D <0>;
+			remote-endpoint =3D <&dc_out_hdmi>;
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
+		dc_out_hdmi: endpoint@0 {
+			reg =3D <0>;
+			remote-endpoint =3D <&hdmi_in_dc>;
+		};
+
+	};
+};
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/d=
ts/starfive/jh7110.dtsi
index 0005fa163..b8c527d9f 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -282,6 +282,11 @@ tdm_ext: tdm-ext-clock {
 		#clock-cells =3D <0>;
 	};
=20
+	display: display-subsystem {
+		compatible =3D "starfive,display-subsystem";
+		ports =3D <&dc_out>;
+	};
+
 	soc {
 		compatible =3D "simple-bus";
 		interrupt-parent =3D <&plic>;
@@ -613,5 +618,43 @@ voutcrg: clock-controller@295c0000 {
 			#reset-cells =3D <1>;
 			power-domains =3D <&pwrc JH7110_PD_VOUT>;
 		};
+
+		dc8200: lcd-controller@29400000 {
+			compatible =3D "starfive,jh7110-dc8200";
+			reg =3D <0x0 0x29400000 0x0 0x100>,
+			      <0x0 0x29400800 0x0 0x2000>,
+			      <0x0 0x295b0000 0x0 0x90>;
+			interrupts =3D <95>;
+			clocks =3D <&syscrg JH7110_SYSCLK_NOC_BUS_DISP_AXI>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_PIX0>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_PIX1>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_AXI>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_CORE>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_AHB>,
+				<&hdmitx0_pixelclk>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_PIX>;
+			clock-names =3D "vout_noc_disp", "vout_pix0", "vout_pix1",
+				      "vout_axi", "vout_core", "vout_vout_ahb",
+				      "hdmitx0_pixel", "vout_dc8200";
+			resets =3D <&voutcrg JH7110_VOUTRST_DC8200_AXI>,
+				 <&voutcrg JH7110_VOUTRST_DC8200_AHB>,
+				 <&voutcrg JH7110_VOUTRST_DC8200_CORE>;
+			reset-names =3D "vout_axi","vout_ahb", "vout_core";
+		};
+
+		hdmi: hdmi@29590000 {
+			compatible =3D "starfive,jh7110-inno-hdmi";
+			reg =3D <0x0 0x29590000 0x0 0x4000>;
+			interrupts =3D <99>;
+
+			clocks =3D <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
+				 <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
+				 <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
+				 <&hdmitx0_pixelclk>;
+			clock-names =3D "sysclk", "mclk", "bclk", "pclk";
+			resets =3D <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
+			reset-names =3D "hdmi_tx";
+			#sound-dai-cells =3D <0>;
+		};
 	};
 };
--=20
2.34.1

