Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB32F9D339E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 07:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813CA10E39B;
	Wed, 20 Nov 2024 06:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2135.outbound.protection.partner.outlook.cn
 [139.219.146.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B240010E398
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 06:35:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTHhuB71mZSf5q6uMzAP+6Ii75JYy9WN4/ApC5Z5v0EaJrURCD/NTC5HaTOX7NRQ6DTkocE2n2PDyGCzDGCZ8Izsf349fr4zNrETeGeydHOhm/fP58tfM/QzymHvenKp/NrpADVeqBMEUfLJAdf3X2AZwWAnzyR8lT+Do0NCm0BUBHZFPAlnPLvwo6b5yfKgrBQtiKaDUNrvQdwzG9n309tf6GuKxyfbcUxh606yNEY6Mfakh5IQmXlNCdJMfUcfyyksOhYc9Akz37fJKWoCZ0llzN0a1noqcnWIFSqHyrR7XJodIptMJpdgs72wyah+BLM83yGm1uHqv4up6KdayQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cf9cZoOEDHB5sPivrAdkN670KWPWzkt8Yq7zZ31XN1k=;
 b=de2eCGBePGG59uxCvOKPTXPeDBtq15OY/4Po6n+CsS3xy0rC7hg91+O3JnVPyMXcYK6uh2lmLey/Sg/LuuXRGGdLaNyhsK5cXjroAavHHdmO+LaA9UCMQhiMlbjYj21c4OJpt0CRlpeB9vaRLs0rZrWLtSnYEJDzUwRrOTB0qmuH8bYECfgZmd/oEckcBHEGx1UxdcnAYDvnPg+UiHo93ZKiXTAxwD0joy0sWpYcJ8X5iFilVwPzMernWNcdRM8wZ6Hm6ILU0UloOvOYVaEAgKlDha7LiLfXc2xxcDdLDrxkESXW9gA7wEiQJjrdTyiM2NKgqNcszJOUikDPhvf5RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:1::6) by NTZPR01MB1100.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Wed, 20 Nov
 2024 06:20:21 +0000
Received: from NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 ([fe80::512d:38d7:ed9f:dfbe]) by
 NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn ([fe80::512d:38d7:ed9f:dfbe%4])
 with mapi id 15.20.8158.023; Wed, 20 Nov 2024 06:20:21 +0000
From: keith zhao <keith.zhao@starfivetech.com>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 william.qiu@starfivetech.com, xingyu.wu@starfivetech.com, kernel@esmil.dk,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 p.zabel@pengutronix.de, changhuang.liang@starfivetech.com,
 keith.zhao@starfivetech.com, jack.zhu@starfivetech.com,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/9] riscv: dts: Add display property
Date: Wed, 20 Nov 2024 14:18:41 +0800
Message-Id: <20241120061848.196754-3-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241120061848.196754-1-keith.zhao@starfivetech.com>
References: <20241120061848.196754-1-keith.zhao@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0059.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::26) To NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NTZPR01MB1050:EE_|NTZPR01MB1100:EE_
X-MS-Office365-Filtering-Correlation-Id: 3800ae5a-c81e-4662-4921-08dd092b6925
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|1800799024|41320700013|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: 7zYM42ZOnGp8xYZrSdtG3HwNzws3jNl1xO46Ei2DS11cpKZA9LlghfR/r6c7UDBN+KKvm29IsWyNbrAaka3Pyv41IaZRtwJ3FUoMScg3ExZ3VUsVHBiXWHiJDLb+Pb1QFXQamVaw8LKUerNl2TMqbINT741nbuC4BwjZyIEp4gnO7fUKHTYR+ju1cTeh4/9HpLMwIP7X0D8tOthR/vR4nU/a9Pm+P0WQT0RIuQZc1flQnbYn04dLRRl/wUt8GZV+Z4v698d55sQgXd6YO6nzjrVVD+JqHmVIlhdjMSUVWqGoDzTUmsIJ9GQYo9CqIqwelCGiREWeeJbzmHy2pH1gD1/QibJUSnmkuFfQ+7qtrdj+0G+z4SrWTVRub11aoAkhWH/rPHW7jDkmFdhX88Rq9146U9qXOiU0hrojWbbMXM7kyv1/gi7hNYLPvT037rRT8G8QjfCnJGmZJX4nV20sVe/QlVo52iWYo6R+jE7ZIWCIeDlnnlIyO/LfTA6cvt0Y1YMF5G9A/pU/le95RXrcvuifAfDjn6VYc9jNGSMMVXpVhBZjwR72ZSFgUzfRwB9U0jQjbZyKitMuqs/uuOzUXxg4m+q4ypgjEJ6LE0f7VxzukcB2WWThwex+8ZPE/s1r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(1800799024)(41320700013)(366016)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cbOAiDol6Cyec+w+OEYLpJP7TDMi5cVkNQpKKpCmrZvm5xDId7hv09Cl1Sr6?=
 =?us-ascii?Q?aUrPzO589exZlBoKeko2mVDvgI1zuXLNclybPMPMyz3gf8+AqZBtXZy8zt1J?=
 =?us-ascii?Q?NC45wb6GBZIP45lOK7gowo7zPiZ20cen03fyDpJ/4uacqw2+ElbL7rFQg9Nh?=
 =?us-ascii?Q?J3YM/EMk4sKabFDH8LjIuMKs1NatLl9cMDmANYX97jTR9cTCyk/wAsE2NvmW?=
 =?us-ascii?Q?Mi7wISaD8M0WUST2/p13phqt6i4yf2AfIjO1amjH7s0HgbQMpgnnbZ0Q9/vo?=
 =?us-ascii?Q?lpqGZUqbb1QGIhjugSdumRXlCW+PA8wu/9j/OcWXq+Ny/6o17+3ipthIASsH?=
 =?us-ascii?Q?ieIW6iEym/XAjcdjw4NQpzL+0zwXfiSxK6u9hXD/2C7Zm6C7NxPyJWD42p4+?=
 =?us-ascii?Q?AMFmWey1bHIw0JLesrR1I/W6iJhzMHou1H6NGu2p+4JU0qJwlWTht7YHG3Y2?=
 =?us-ascii?Q?UY6RatYaZo+IqbwQLFx64B/spnPVvoWcAoPXAqyVaXI7anN/FbS4/sW2m3KM?=
 =?us-ascii?Q?s2NTTWQdCUz+ZOHNxl0JSb0XO2BN1YfLPrr8XSqxgGqQGH5yzeetuxNxpuQU?=
 =?us-ascii?Q?DfT+9wS9wu4qU1RLEzF+Q3TIItlymuD9k09xUEQMp7nf5AwO8ZsEfDNni2hm?=
 =?us-ascii?Q?kKVQwP9KlAMP8Dj+HxbDBKr9FL2kF8wbgACtXVjJSexyelmv1ft7Q3SVUxHR?=
 =?us-ascii?Q?mxscha/0xxSui1fqe5BmajvGFUi8ZLmOYTHdB0l07YkElYeFMwGWbFtDvvtU?=
 =?us-ascii?Q?1u4uCpjr9CWKPT++0l6PsBQUwa5wAHEmNftGzPEwMg9PfqSyrMscsWuiKIvb?=
 =?us-ascii?Q?dyNtPrx2r5b+fP8d46FK58Rw9pbIjdY7gI45atpD0g/3hQnznnPB6nBwOueb?=
 =?us-ascii?Q?nQfg+CYLXUB+rjc/YXYLNSfh/qM71quCUp1PEvHcRpS0AE8up1bxOaacsux4?=
 =?us-ascii?Q?v9rraHpIJFKDmaj96mKtIlasptKsjQA860LWBiygMQytLlsj+49mu2BM1Hnq?=
 =?us-ascii?Q?8zshAN2u7m3vBUywFDLkVpETKNC/YC3o8LoJpKQSyFvVVd/da87HMjIsLqRt?=
 =?us-ascii?Q?GhwpHTil0Vc1Rbtrm9V2BhK0kRbyrpwzCLCZ4TIYS0YJ2yjABqdWOtRMJ9b5?=
 =?us-ascii?Q?IX6tlyKjeUiY4L82MGuqaTbytaIKxB3s4n5e2hdcyfYtw1P455C4pVmYmqhG?=
 =?us-ascii?Q?jFac4IdxXGFR/jO3MwIngkA88s2lbJAzYA36pycaFc9QztYeHFErHJyJSwi/?=
 =?us-ascii?Q?DIhMJD7BoZlkA5fiONs5VDl+pINmRtIwg/VW9T6LTt9wXk5VkHOZtWDxBGeM?=
 =?us-ascii?Q?BwApo5PYbmGZSyH9AdhNmmZTGbfEE4cAHMhUhfJGQsmr4fDpkimFCKKzyZeH?=
 =?us-ascii?Q?oWE0dofMVmrilJrzqI2FXwDqedacn6F6nj7SHMqLPnHkd/fKESRW5TFN/6p0?=
 =?us-ascii?Q?Uc9MQ32LwK7ye8TfWc8utN7tpd1u04w+A355ppzU0X1aAOKAHQ+bgqud7woL?=
 =?us-ascii?Q?VuScPeuTSeHOm9NTUBFedAfPqYOzkpqpMAPe2Iuh/n5dFkmtHaPrjhPmc5GH?=
 =?us-ascii?Q?DuNoFDSpUrZGK6ZLkT/zI8psv0rOg7K5PNJUeXMxee2qLGuKoQBb6L+WFSc7?=
 =?us-ascii?Q?Hg=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3800ae5a-c81e-4662-4921-08dd092b6925
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 06:20:21.0493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijJMBWtWnDsnLAsLjLq/dBQlT5nTLZMF6f2LBaDarxlHF/WbNDN30uLeiK7Ltj9yToPtriHSrPEduxrvLiUhUqu9V81rzREyUaX/Ao5PmJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1100
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

Add the display DT nodes in Starfive JH7110 soc-specific DT file.

Signed-off-by: keith zhao <keith.zhao@starfivetech.com>
---
 .../boot/dts/starfive/jh7110-common.dtsi      | 125 ++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  41 ++++++
 2 files changed, 166 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index 9d77713f5361..301b56f2ef0c 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -30,6 +30,25 @@ memory@40000000 {
 		reg = <0x0 0x40000000 0x1 0x0>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* vout applies for space from this CMA
+		 * Without this CMA reservation,
+		 * vout may not work properly.
+		 */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x0 0x20000000>;
+			alignment = <0x0 0x1000>;
+			alloc-ranges = <0x0 0x70000000 0x0 0x20000000>;
+			linux,cma-default;
+		};
+	};
+
 	gpio-restart {
 		compatible = "gpio-restart";
 		gpios = <&sysgpio 35 GPIO_ACTIVE_HIGH>;
@@ -62,12 +81,55 @@ codec {
 			};
 		};
 	};
+
+	hdmi_con: hdmi-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
 };
 
 &cpus {
 	timebase-frequency = <4000000>;
 };
 
+&dc8200 {
+	status = "okay";
+	crtc_out: ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dc_out0: port@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dc_out_dpi0: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&hdmi_enc>;
+			};
+
+		};
+
+		dc_out1: port@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dc_out_dpi1: endpoint@1 {
+				reg = <1>;
+				//remote-endpoint = <&dsi_enc>;
+			};
+
+		};
+	};
+};
+
 &dvp_clk {
 	clock-frequency = <74250000>;
 };
@@ -88,6 +150,31 @@ &gmac1_rmii_refin {
 	clock-frequency = <50000000>;
 };
 
+&hdmi {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_pins>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hdmi_in: port@0 {
+			reg = <0>;
+			hdmi_enc: endpoint {
+				remote-endpoint = <&dc_out_dpi0>;
+			};
+		};
+
+		hdmi_out: port@1 {
+			reg = <1>;
+			hdmi_out_con: endpoint {
+				remote-endpoint = <&hdmi_con_in>;
+			};
+		};
+	};
+};
+
 &hdmitx0_pixelclk {
 	clock-frequency = <297000000>;
 };
@@ -366,6 +453,40 @@ &syscrg {
 };
 
 &sysgpio {
+	hdmi_pins: hdmi-0 {
+		hdmi-cec-pins {
+			pinmux = <GPIOMUX(14, GPOUT_SYS_HDMI_CEC_SDA,
+					      GPOEN_SYS_HDMI_CEC_SDA,
+					      GPI_SYS_HDMI_CEC_SDA)>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		hdmi-hpd-pins {
+			pinmux = <GPIOMUX(15, GPOUT_HIGH,
+					      GPOEN_ENABLE,
+					      GPI_SYS_HDMI_HPD)>;
+			input-enable;
+			bias-disable; /* external pull-up */
+		};
+
+		hdmi-scl-pins {
+			pinmux = <GPIOMUX(0, GPOUT_SYS_HDMI_DDC_SCL,
+					     GPOEN_SYS_HDMI_DDC_SCL,
+					     GPI_SYS_HDMI_DDC_SCL)>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		hdmi-sda-pins {
+			pinmux = <GPIOMUX(1, GPOUT_SYS_HDMI_DDC_SDA,
+					     GPOEN_SYS_HDMI_DDC_SDA,
+					     GPI_SYS_HDMI_DDC_SDA)>;
+			input-enable;
+			bias-pull-up;
+		};
+	};
+
 	i2c0_pins: i2c0-0 {
 		i2c-pins {
 			pinmux = <GPIOMUX(57, GPOUT_LOW,
@@ -656,3 +777,7 @@ &U74_3 {
 &U74_4 {
 	cpu-supply = <&vdd_cpu>;
 };
+
+&voutcrg {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 0d8339357bad..d48825822017 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -1203,6 +1203,47 @@ camss: isp@19840000 {
 			status = "disabled";
 		};
 
+		dc8200: lcd-controller@29400000 {
+			compatible = "starfive,jh7110-dc8200";
+			reg = <0x0 0x29400000 0x0 0x100>,
+			      <0x0 0x29400800 0x0 0x2000>;
+
+			interrupts = <95>;
+			clocks = <&syscrg JH7110_SYSCLK_NOC_BUS_DISP_AXI>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_CORE>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_AXI>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_AHB>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_PIX0>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_PIX1>,
+				<&hdmitx0_pixelclk>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_PIX>;
+			clock-names = "noc_bus", "dc_core", "axi_core", "ahb",
+				      "channel0", "channel1", "hdmi_tx", "dc_parent";
+			resets = <&voutcrg JH7110_VOUTRST_DC8200_AXI>,
+				 <&voutcrg JH7110_VOUTRST_DC8200_AHB>,
+				 <&voutcrg JH7110_VOUTRST_DC8200_CORE>;
+			reset-names = "axi","ahb", "core";
+
+			starfive,syscon = <&vout_syscon>;
+		};
+
+		hdmi: hdmi@29590000 {
+			compatible = "starfive,jh7110-inno-hdmi";
+			reg = <0x0 0x29590000 0x0 0x4000>;
+			interrupts = <99>;
+
+			clocks = <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
+				 <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
+				 <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>;
+			clock-names = "sysclk", "mclk", "bclk";
+			resets = <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
+		};
+
+		vout_syscon: syscon@295b0000 {
+			compatible = "starfive,jh7110-vout-syscon", "syscon";
+			reg = <0 0x295b0000 0 0x90>;
+		};
+
 		voutcrg: clock-controller@295c0000 {
 			compatible = "starfive,jh7110-voutcrg";
 			reg = <0x0 0x295c0000 0x0 0x10000>;
-- 
2.34.1

