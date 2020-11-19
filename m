Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6CC2B8EC9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 10:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3ED89AB7;
	Thu, 19 Nov 2020 09:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70047.outbound.protection.outlook.com [40.107.7.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D6B6E52F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 09:30:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+MYv2teU90fH/AC9TezBb0+bka1BS5a2mQcwLwGrAbgm+C0EagE/0FPVm9N9d9IHX0X9wKeqeyUclLhUE/saCE+seOqfMHKMRLhpT+jOnTJxsM6Ux93a35dvtSg9wo3UYGG3TZWwXYEo0FX5dtrhtbfmEBHeJJ9tiyC7tgYZb8LpQ9R4lnq06sRdidZigQGogcMikZoLjr0w/vjwy6eblV5m5aQIxFOJ2MiTVoTRtCCvYfy9+qAIadHmZLM5m+gjaAcW8UevRJLt5x9Vt+1KHZFwPpdTVZxr2I3RO6Lt1spWMLItGgRQHvkB3ZRLsnCvzM1XppFINssTVi0PogZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNK86NA/Gzd0OSBWLPdSbH4gO8mGyuSeKQauLowsH+4=;
 b=IK+x0P/Vj9r7lyR88921j/B3c9/fxT8Rp7VojpEb8DvA17OnXNlviQ2YBRut7hJC5/k/r+WFNXmkQvUr4s6QsNV0rkqRAvE15rJPPNUQXY3ooW+OIfl9I0vIiVl7kimc+i34NBHZughQVi50ZzcKMzpNGPdntSfbTbYi6dYb80cRYfy+bVcOnPAkpzfQRG9WbgodILnwadT5UDB/rWYEwcZcHB+cGcACmkZ2MWNbCQP4OOLAUj+e6p38NbqpPUyLG1tRVf6vUnadajOzMddtsE7Gvxy7mnVbJy/udaWZPGNuh9WdFhDP9r2Ti9W2WWL16Gyfeco6yis9h3zh0ymc4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNK86NA/Gzd0OSBWLPdSbH4gO8mGyuSeKQauLowsH+4=;
 b=rYKfX+/4LzWRiFs/Mw9XZOJYmC9aj9/eSl69Rj4trfriJbXHpGss8j7q1/FLBtpK6XF40rTBi/2S3xG2wUiXXBQHlUF0cGuUjqlZst3kWp5xXGXmpF1jxyGDx45FvzWOFKdDvxH5nqdLA2WCk5g+ZwebEHxty2twNUbCtyDVIYg=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 19 Nov
 2020 09:29:58 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3589.021; Thu, 19 Nov 2020
 09:29:58 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] arm64: imx8qxp:dtsi: Introduce DC0 subsystem
Date: Thu, 19 Nov 2020 17:22:24 +0800
Message-Id: <1605777745-23625-8-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605777745-23625-1-git-send-email-victor.liu@nxp.com>
References: <1605777745-23625-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0401CA0002.apcprd04.prod.outlook.com
 (2603:1096:3:1::12) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR0401CA0002.apcprd04.prod.outlook.com (2603:1096:3:1::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 09:29:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7022a60b-1692-4b00-2099-08d88c6dae6c
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3405:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB34056DE1412E3B4F277B70A398E00@VI1PR0402MB3405.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7zmpt5PCaDvrwEmsGCUt9DZC9FQfrJoSdOFVJG/wmB35XlYMnqOBzB7dpKsdT51TVwu2iiXL6Qp1kZB0I9yPBmSTNsgggM7xiuTrDgs2kAihJWsyifxq/O4sH2Co3oZSsd/wXrF4bSqwTYHfZfjygO97d1Sxhb64gDL6zeuh8188BIMLwZgwkItcTlAq20CpTGxpLt6F4e1KcG4pxb6bp6CNm082ULk5kd0MwIQnzDdJLIv00TP9olZ+wUGitGXbgY+DRpbHTnrnZFAWbB0z3N+/SgEz/u8R4HSp2ebkDUIC0bg2WyeYWyzMVKPhsN7m1NMtSInn4gqwZeacLAKYcJIvB372f632FZ0+SsEG+UO5kfLQ+RqtlghYCoCYqk/RGko0Tj4n3I7/l2oztS4mIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(2616005)(186003)(316002)(5660300002)(956004)(6506007)(6512007)(83380400001)(478600001)(6486002)(86362001)(16526019)(8936002)(52116002)(4326008)(69590400008)(8676002)(36756003)(7416002)(2906002)(66946007)(6666004)(66476007)(66556008)(26005)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 4DwbhLejiqnrSNnKAoMTfe8I3+a/3o74ADJvgALWhkOw0wjHCu5CiwBqIO4RZYLBQeGSJI2mi6ZxLh0DoqgMppcp5uuagHop9ltShYetkNAYU60uWk/V5XOOZuOj9w6Y6kHGIk7sxFLZV4XFurttvyjcOcHSDPd6IiEw/0aynnSjI6GksE8VF69hhXW9RDsbebeELAqD/NLGM2f9/veXbdzwAe0ossGC2cMf8zqdkDMLxZCvw59qmBu5YsZlYnKjS22G56GGkwK2zybn+t95ne4tL4Y8SeYVog91X+rvXMZ+uDJY9FxjTZyasJbSKqATG34HEMPL8I+bQxIWavOAEqJfLgsuDSIJk+W/4GDXlR9t20bRZMIjybfOPt93AHdqYJ0Kp1pCZykic+YLJvDJG32HfKB5uK4QXSTzLMu7jxSUcJQf9EFAE4wclobgCMY7CBtjAb1YaAJHKRD0CXFxVZFAtLmHJZJjCNq6L5hLLvm5su+fP5oG8EhmNHR7RJoEUEXXEsbZKi03iyozCuwnaBj7BM4Rh7fD1Xuk9TJeP5cfV+VqH4tuRbS7ArsCYnvThdllfTRJXsd4wJQpR+LqqP4uKaEWgccfl/OfDg2O51myMVnwrPn5aJbpCsT+fnRpBClWKcOqLRbxVZkds0lYaA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7022a60b-1692-4b00-2099-08d88c6dae6c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 09:29:58.0859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LNCauDTeuQEtkyTXE2cr0hFfsAofQksOM9YT3EwTiWWZEPsR/ABraXEzMSjdLHyRGYHNs8Fn1V+pnZ8mt2/6jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3405
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
Cc: tzimmermann@suse.de, airlied@linux.ie, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds basic i.MX8qxp DC0 subsystem support, which includes
the irqsteer, LPCG clock controller, Display Processing Unit(DPU) and
it's prefetch engines - Prefetch Resolve Gaskets(PRG) and Display Prefetch
Resolve Channels(DPRC).

Note that the clocks are still referenced in the legacy way instead of
the new "two cells" binding way.  So, prone to update as soon as the SoC
device tree is converted to follow the new way.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 313 +++++++++++++++++++++++++++++
 1 file changed, 313 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index e46faac..062c294 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -21,6 +21,7 @@
 	aliases {
 		ethernet0 = &fec1;
 		ethernet1 = &fec2;
+		dpu0 = &dpu1;
 		gpio0 = &lsio_gpio0;
 		gpio1 = &lsio_gpio1;
 		gpio2 = &lsio_gpio2;
@@ -223,6 +224,318 @@
 		clock-output-names = "xtal_24MHz";
 	};
 
+	dc0_subsys: bus@56000000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x56000000 0x0 0x56000000 0x1000000>;
+
+		dc0_irqsteer: irqsteer@56000000 {
+			compatible = "fsl,imx-irqsteer";
+			reg = <0x56000000 0x10000>;
+			interrupt-controller;
+			interrupt-parent = <&gic>;
+			#interrupt-cells = <1>;
+			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dc0_lpcg IMX_DC0_LPCG_LIS_IPG_CLK>;
+			clock-names = "ipg";
+			fsl,channel = <0>;
+			fsl,num-irqs = <512>;
+			power-domains = <&pd IMX_SC_R_DC_0>;
+		};
+
+		dc0_lpcg: clock-controller@56010000 {
+			compatible = "fsl,imx8qxp-lpcg-dc";
+			reg = <0x56010000 0x10000>;
+			#clock-cells = <1>;
+		};
+
+		dc0_prg1: prg@56040000 {
+			compatible = "fsl,imx8qxp-prg";
+			reg = <0x56040000 0x10000>;
+			clocks = <&dc0_lpcg IMX_DC0_LPCG_PRG0_RTRAM_CLK>,
+				 <&dc0_lpcg IMX_DC0_LPCG_PRG0_APB_CLK>;
+			clock-names = "rtram", "apb";
+			power-domains = <&pd IMX_SC_R_DC_0>;
+			status = "disabled";
+		};
+
+		dc0_prg2: prg@56050000 {
+			compatible = "fsl,imx8qxp-prg";
+			reg = <0x56050000 0x10000>;
+			clocks = <&dc0_lpcg IMX_DC0_LPCG_PRG1_RTRAM_CLK>,
+				 <&dc0_lpcg IMX_DC0_LPCG_PRG1_APB_CLK>;
+			clock-names = "rtram", "apb";
+			power-domains = <&pd IMX_SC_R_DC_0>;
+			status = "disabled";
+		};
+
+		dc0_prg3: prg@56060000 {
+			compatible = "fsl,imx8qxp-prg";
+			reg = <0x56060000 0x10000>;
+			clocks = <&dc0_lpcg IMX_DC0_LPCG_PRG2_RTRAM_CLK>,
+				 <&dc0_lpcg IMX_DC0_LPCG_PRG2_APB_CLK>;
+			clock-names = "rtram", "apb";
+			power-domains = <&pd IMX_SC_R_DC_0>;
+			status = "disabled";
+		};
+
+		dc0_prg4: prg@56070000 {
+			compatible = "fsl,imx8qxp-prg";
+			reg = <0x56070000 0x10000>;
+			clocks = <&dc0_lpcg IMX_DC0_LPCG_PRG3_RTRAM_CLK>,
+				 <&dc0_lpcg IMX_DC0_LPCG_PRG3_APB_CLK>;
+			clock-names = "rtram", "apb";
+			power-domains = <&pd IMX_SC_R_DC_0>;
+			status = "disabled";
+		};
+
+		dc0_prg5: prg@56080000 {
+			compatible = "fsl,imx8qxp-prg";
+			reg = <0x56080000 0x10000>;
+			clocks = <&dc0_lpcg IMX_DC0_LPCG_PRG4_RTRAM_CLK>,
+				 <&dc0_lpcg IMX_DC0_LPCG_PRG4_APB_CLK>;
+			clock-names = "rtram", "apb";
+			power-domains = <&pd IMX_SC_R_DC_0>;
+			status = "disabled";
+		};
+
+		dc0_prg6: prg@56090000 {
+			compatible = "fsl,imx8qxp-prg";
+			reg = <0x56090000 0x10000>;
+			clocks = <&dc0_lpcg IMX_DC0_LPCG_PRG5_RTRAM_CLK>,
+				 <&dc0_lpcg IMX_DC0_LPCG_PRG5_APB_CLK>;
+			clock-names = "rtram", "apb";
+			power-domains = <&pd IMX_SC_R_DC_0>;
+			status = "disabled";
+		};
+
+		dc0_prg7: prg@560a0000 {
+			compatible = "fsl,imx8qxp-prg";
+			reg = <0x560a0000 0x10000>;
+			clocks = <&dc0_lpcg IMX_DC0_LPCG_PRG6_RTRAM_CLK>,
+				 <&dc0_lpcg IMX_DC0_LPCG_PRG6_APB_CLK>;
+			clock-names = "rtram", "apb";
+			power-domains = <&pd IMX_SC_R_DC_0>;
+			status = "disabled";
+		};
+
+		dc0_prg8: prg@560b0000 {
+			compatible = "fsl,imx8qxp-prg";
+			reg = <0x560b0000 0x10000>;
+			clocks = <&dc0_lpcg IMX_DC0_LPCG_PRG7_RTRAM_CLK>,
+				 <&dc0_lpcg IMX_DC0_LPCG_PRG7_APB_CLK>;
+			clock-names = "rtram", "apb";
+			power-domains = <&pd IMX_SC_R_DC_0>;
+			status = "disabled";
+		};
+
+		dc0_prg9: prg@560c0000 {
+			compatible = "fsl,imx8qxp-prg";
+			reg = <0x560c0000 0x10000>;
+			clocks = <&dc0_lpcg IMX_DC0_LPCG_PRG8_RTRAM_CLK>,
+				 <&dc0_lpcg IMX_DC0_LPCG_PRG8_APB_CLK>;
+			clock-names = "rtram", "apb";
+			power-domains = <&pd IMX_SC_R_DC_0>;
+			status = "disabled";
+		};
+
+		dc0_dpr1_channel1: dpr-channel@560d0000 {
+			compatible = "fsl,imx8qxp-dpr-channel";
+			reg = <0x560d0000 0x10000>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dc0_lpcg IMX_DC0_LPCG_DPR0_APB_CLK>,
+				 <&dc0_lpcg IMX_DC0_LPCG_DPR0_B_CLK>,
+				 <&dc0_lpcg IMX_DC0_LPCG_RTRAM0_CLK>;
+			clock-names = "apb", "b", "rtram";
+			fsl,sc-resource = <IMX_SC_R_DC_0_BLIT0>;
+			fsl,prgs = <&dc0_prg1>;
+			power-domains = <&pd IMX_SC_R_DC_0>;
+			status = "disabled";
+		};
+
+		dc0_dpr1_channel2: dpr-channel@560e0000 {
+			compatible = "fsl,imx8qxp-dpr-channel";
+			reg = <0x560e0000 0x10000>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dc0_lpcg IMX_DC0_LPCG_DPR0_APB_CLK>,
+				 <&dc0_lpcg IMX_DC0_LPCG_DPR0_B_CLK>,
+				 <&dc0_lpcg IMX_DC0_LPCG_RTRAM0_CLK>;
+			clock-names = "apb", "b", "rtram";
+			fsl,sc-resource = <IMX_SC_R_DC_0_BLIT1>;
+			fsl,prgs = <&dc0_prg2>, <&dc0_prg1>;
+			power-domains = <&pd IMX_SC_R_DC_0>;
+			status = "disabled";
+		};
+
+		dc0_dpr1_channel3: dpr-channel@560f0000 {
+			compatible = "fsl,imx8qxp-dpr-channel";
+			reg = <0x560f0000 0x10000>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dc0_lpcg IMX_DC0_LPCG_DPR0_APB_CLK>,
+				 <&dc0_lpcg IMX_DC0_LPCG_DPR0_B_CLK>,
+				 <&dc0_lpcg IMX_DC0_LPCG_RTRAM0_CLK>;
+			clock-names = "apb", "b", "rtram";
+			fsl,sc-resource = <IMX_SC_R_DC_0_FRAC0>;
+			fsl,prgs = <&dc0_prg3>;
+			power-domains = <&pd IMX_SC_R_DC_0>;
+			status = "disabled";
+		};
+
+		dc0_dpr2_channel1: dpr-channel@56100000 {
+			compatible = "fsl,imx8qxp-dpr-channel";
+			reg = <0x56100000 0x10000>;
+			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dc0_lpcg IMX_DC0_LPCG_DPR1_APB_CLK>,
+				 <&dc0_lpcg IMX_DC0_LPCG_DPR1_B_CLK>,
+				 <&dc0_lpcg IMX_DC0_LPCG_RTRAM1_CLK>;
+			clock-names = "apb", "b", "rtram";
+			fsl,sc-resource = <IMX_SC_R_DC_0_VIDEO0>;
+			fsl,prgs = <&dc0_prg4>, <&dc0_prg5>;
+			power-domains = <&pd IMX_SC_R_DC_0>;
+			status = "disabled";
+		};
+
+		dc0_dpr2_channel2: dpr-channel@56110000 {
+			compatible = "fsl,imx8qxp-dpr-channel";
+			reg = <0x56110000 0x10000>;
+			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dc0_lpcg IMX_DC0_LPCG_DPR1_APB_CLK>,
+				 <&dc0_lpcg IMX_DC0_LPCG_DPR1_B_CLK>,
+				 <&dc0_lpcg IMX_DC0_LPCG_RTRAM1_CLK>;
+			clock-names = "apb", "b", "rtram";
+			fsl,sc-resource = <IMX_SC_R_DC_0_VIDEO1>;
+			fsl,prgs = <&dc0_prg6>, <&dc0_prg7>;
+			power-domains = <&pd IMX_SC_R_DC_0>;
+			status = "disabled";
+		};
+
+		dc0_dpr2_channel3: dpr-channel@56120000 {
+			compatible = "fsl,imx8qxp-dpr-channel";
+			reg = <0x56120000 0x10000>;
+			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dc0_lpcg IMX_DC0_LPCG_DPR1_APB_CLK>,
+				 <&dc0_lpcg IMX_DC0_LPCG_DPR1_B_CLK>,
+				 <&dc0_lpcg IMX_DC0_LPCG_RTRAM1_CLK>;
+			clock-names = "apb", "b", "rtram";
+			fsl,sc-resource = <IMX_SC_R_DC_0_WARP>;
+			fsl,prgs = <&dc0_prg8>, <&dc0_prg9>;
+			power-domains = <&pd IMX_SC_R_DC_0>;
+			status = "disabled";
+		};
+
+		dpu1: dpu@56180000 {
+			compatible = "fsl,imx8qxp-dpu";
+			reg = <0x56180000 0x40000>;
+			interrupt-parent = <&dc0_irqsteer>;
+			interrupts = <448>, <449>, <450>,  <64>,
+				      <65>,  <66>,  <67>,  <68>,
+				      <69>,  <70>, <193>, <194>,
+				     <195>, <196>, <197>,  <72>,
+				      <73>,  <74>,  <75>,  <76>,
+				      <77>,  <78>,  <79>,  <80>,
+				      <81>, <199>, <200>, <201>,
+				     <202>, <203>, <204>, <205>,
+				     <206>, <207>, <208>,   <0>,
+				       <1>,   <2>,   <3>,   <4>,
+				      <82>,  <83>,  <84>,  <85>,
+				     <209>, <210>, <211>, <212>;
+			interrupt-names = "store9_shdload",
+					  "store9_framecomplete",
+					  "store9_seqcomplete",
+					  "extdst0_shdload",
+					  "extdst0_framecomplete",
+					  "extdst0_seqcomplete",
+					  "extdst4_shdload",
+					  "extdst4_framecomplete",
+					  "extdst4_seqcomplete",
+					  "extdst1_shdload",
+					  "extdst1_framecomplete",
+					  "extdst1_seqcomplete",
+					  "extdst5_shdload",
+					  "extdst5_framecomplete",
+					  "extdst5_seqcomplete",
+					  "disengcfg_shdload0",
+					  "disengcfg_framecomplete0",
+					  "disengcfg_seqcomplete0",
+					  "framegen0_int0",
+					  "framegen0_int1",
+					  "framegen0_int2",
+					  "framegen0_int3",
+					  "sig0_shdload",
+					  "sig0_valid",
+					  "sig0_error",
+					  "disengcfg_shdload1",
+					  "disengcfg_framecomplete1",
+					  "disengcfg_seqcomplete1",
+					  "framegen1_int0",
+					  "framegen1_int1",
+					  "framegen1_int2",
+					  "framegen1_int3",
+					  "sig1_shdload",
+					  "sig1_valid",
+					  "sig1_error",
+					  "cmdseq_error",
+					  "comctrl_sw0",
+					  "comctrl_sw1",
+					  "comctrl_sw2",
+					  "comctrl_sw3",
+					  "framegen0_primsync_on",
+					  "framegen0_primsync_off",
+					  "framegen0_secsync_on",
+					  "framegen0_secsync_off",
+					  "framegen1_primsync_on",
+					  "framegen1_primsync_off",
+					  "framegen1_secsync_on",
+					  "framegen1_secsync_off";
+			clocks = <&dc0_lpcg IMX_DC0_LPCG_DC_AXI_CLK>,
+				 <&dc0_lpcg IMX_DC0_LPCG_DC_CFG_CLK>,
+				 <&clk IMX_DC0_PLL0_CLK>,
+				 <&clk IMX_DC0_PLL1_CLK>,
+				 <&dc0_lpcg IMX_DC0_LPCG_DISP0_CLK>,
+				 <&dc0_lpcg IMX_DC0_LPCG_DISP1_CLK>;
+			clock-names = "axi", "cfg", "pll0", "pll1",
+				      "disp0", "disp1";
+			power-domains = <&pd IMX_SC_R_DC_0>,
+					<&pd IMX_SC_R_DC_0_PLL_0>,
+					<&pd IMX_SC_R_DC_0_PLL_1>;
+			power-domain-names = "dc", "pll0", "pll1";
+			fsl,dpr-channels = <&dc0_dpr1_channel1>,
+					   <&dc0_dpr1_channel2>,
+					   <&dc0_dpr1_channel3>,
+					   <&dc0_dpr2_channel1>,
+					   <&dc0_dpr2_channel2>,
+					   <&dc0_dpr2_channel3>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					dpu_disp0_pixel_combiner_ch0: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					dpu_disp1_pixel_combiner_ch1: endpoint {
+					};
+				};
+			};
+		};
+	};
+
 	adma_subsys: bus@59000000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
