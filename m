Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3C6B1E420
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 10:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B42010E8DF;
	Fri,  8 Aug 2025 08:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ZEIMr1Fh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013008.outbound.protection.outlook.com
 [52.101.83.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7D310E8E0
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 08:07:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2NofMOQMhw80PbtU1LXrf0sSr7EI9st4MtxmPLHeVsjx0ltShAQYe1+/3BA3H9vVoHAsNN0EFR0FZt6nydM8jYo/p8i/gahSP5GD1lOWRNFzA6JUp1i8PbyRqIKra/lQimnt/XbFooU7XaMXqbHyH7YtNwfs4r2wQWGQVRtCQOdnHjRvWIEfltdyFZuHYip7eejJgj4M2pxGM/t+VL8BhwLIhnZ/bVajaxhvLSouHAtshPEFEe+2FYF+nOYkUcDAR1AU21ozPdFJnKn6g6JnB0Muq9B1Bt0qatuHcR7qeGK/4lmtsIJE2Bx4B9s+GRwc4tK2Hp+j0P9cGLOzzqQjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62V9+g0G1rPqv7jd3THt+QjHnwNFsIgyAwILe8seHRc=;
 b=qYvjGpE9esGSwN7OirCXhvwaRMPphTe+UdwkxRXW++0JHkmgbdjHviO6EgEStZUta0NMrgKaKt/7UQMOjRYboGl+2m9Rw9SEVdt2s5C6q9/X0SGtqjSUJJmP6zgKKFgsd+q6FwOK6Jpw7ACbHocrnltOxIIkOUzSh6H6k25fl6tjq0EQkRPLjOc6qn5ZA8a5zmI8IkknlfR66E7vUKuJJRs3t5sUQ51prPwdlAxu/JqeI6E5aSz9J5jTv875zQUYDabKKTRTP+2RnBxh8kXXQlYuuU4rAZ9q1bLEf6Ha+oaVEMEvPw6vIADey8AOjjHylGaS9dfYPhteSf30ev30lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62V9+g0G1rPqv7jd3THt+QjHnwNFsIgyAwILe8seHRc=;
 b=ZEIMr1Fh21faYUOapY0SHjiKdStaJx3HKu1tRkkIdJhRk9DbcS2hDJ/RtSJfufyfQ5zccb/5sYQpvX+xLk3e+dipyCeo5lOigVxBO+pD0NT52Ci6PcUTw/LIm4ubcgwfMPrwoLtQblBS/z2KZYHLNa0VykJ+En7wtvuN9jUAytqS4U2bl9Fs1jRwRX5/OkkDWXEFLXtjwUm1OETB44j4/O7VyAlvmxWLci5azFS42vQdbQzrZBQFrgo1MK2IZwxRymWciGGp/M146jvR0Za9OwIMLoU0cUfrBWXR1GHjH+qQZ3J8S3MCkWyfRcDMfeLXUSE+ZQu5DfjQVrbJuUH4HA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAXPR04MB8192.eurprd04.prod.outlook.com (2603:10a6:102:1cd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 08:07:45 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 08:07:45 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
Subject: [PATCH v4 6/7] arm64: dts: imx8mp: Add hdmi parallel audio interface
 node
Date: Fri,  8 Aug 2025 16:06:16 +0800
Message-Id: <20250808080617.2924184-7-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250808080617.2924184-1-shengjiu.wang@nxp.com>
References: <20250808080617.2924184-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::8) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PAXPR04MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d976c68-dc2f-43da-820b-08ddd652a848
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|52116014|376014|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nAatgWeOVIwdpnIMy3owWaVXAi45InDiPwiuPQrLPfClxIDyi3EP12ejUH08?=
 =?us-ascii?Q?J8HcZwS8IxSf+S4tX+tCiU5x6/sBQR/mkfc/Ea6teeFZd46LDbu5A/S5SLFU?=
 =?us-ascii?Q?H1K9xW9+RZ7VRoaK/yA8SIUJs0kp2tGYMwx0+Rf9p9bLwRfwXK4CRcnVK2rE?=
 =?us-ascii?Q?hKLDSBGdF7cHIEqx4jVXaJ3zXpX1mgoiDrobYv7ZcfLIwlMdvC5sNzlvuSoO?=
 =?us-ascii?Q?7UbRJkDrHXdSBsKXCDtW6nUMpoipyEv0lRDnye2yjKXgN3YWSWbezoxWiqo6?=
 =?us-ascii?Q?E8risrNOKwjeyOTbOP1Ko5c1rehP2f6yO9BUNVD6JdMKdLdSldlCWEs+Jaag?=
 =?us-ascii?Q?djGtMFbqvUHuqVIhB0xYNR0Moa98RJ+Xj+L2daMYxAy0y5HfTIwzKDhrbkFB?=
 =?us-ascii?Q?sxSUbxkaDIuYBdmIimC1Kd/UTgir/7bWU9eR2murTAaCgSoDvDE88qR4mWRQ?=
 =?us-ascii?Q?9pmINiBg3lwrfKzlPCnlf0JH5Znbez/DFMgLIMb45h576U+jiAFbmng74K2K?=
 =?us-ascii?Q?XH4YCt7AkEVX3C97BqzpRtrQjUptSfQD9HdF46rWqK5gyMAvJnQlj1P8kwT9?=
 =?us-ascii?Q?SEuGpvsJhcvExB5wkSTIio5vRBUUpYG3ZwBjNLcknLbSClUmlbd+cEjA/PXf?=
 =?us-ascii?Q?wH6obtoLTurusw8Ev24UX5n2fS5Hjb+JCnn25hmHRPV/Z1E1bnIBU2BvRaXn?=
 =?us-ascii?Q?G//dXAOdo+fmNDz58/OyDlPazcv2naNi7sui6U9op2x25ZOOMkmew6L7lMyL?=
 =?us-ascii?Q?m786PZhsDoUxJFZWPqV2TIv/0IKfBagTjyqupKFMx0OVqqH11v/TCkTea6wn?=
 =?us-ascii?Q?b74GfZsnpIPDrinwBicaZZO7mwWl6KNNmVoODndFvgFIw6Qx8QXU1lnAfshE?=
 =?us-ascii?Q?IEum9NMloD4m4108toLC/CMRQNi2jpVSx630t0254FuJXYH8ymTIReySjuFL?=
 =?us-ascii?Q?nPh8N2EZswqrHCGw/gM17/KYGxmRyL5mpEcwOEOOyaA/J4Usv4IQMxJyggQx?=
 =?us-ascii?Q?EsTfevYP3GdrJ5JVu7qH1wQquLfaqrByW/fIGe5MvQWCI8IQ/XE+z0rsHWOd?=
 =?us-ascii?Q?jUi00c284+Xj8u09jtQI5utCUzVXwb/tq+032zcOezqiUjja/a8nT6lIA22/?=
 =?us-ascii?Q?t9pLCnlXxfOLqbiHf1sTwjG/o8frwDCO30ezvVdpWXYymQ5MvN+JjJrfxdwE?=
 =?us-ascii?Q?shYh2J4T+qB2oe5xIb60RHlRGbCyP++HJJor68Wvk9yvGPcNAL4ZCygXsR1S?=
 =?us-ascii?Q?ynJvtBYgZobG0uwEPOYuj5mNLR67T/pQLdgKvgvoVoGvI2w+EUDElIbmBG2+?=
 =?us-ascii?Q?Hz228RCJsoLZlSRVokkPc7uOjRRHMuw/EXOLtL9kMlE2fr+AncxDCTRtRjQU?=
 =?us-ascii?Q?Ic6WYF66wXzxHcyAMPjXetYaVHPkqyzNr/meii69FEjHCd/ctc7QnrNTKJFS?=
 =?us-ascii?Q?+WuCDxWuXy2tAl3pp18nN/xIiPLNN7k9YAxFMVSKx4frqpbZqEuYTKm23L8z?=
 =?us-ascii?Q?gWr0BoJn+Ox1DPQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(19092799006)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SY45h2aPITBRhX/CfMPMEa8uDye7VZF5V5po5gPxJ4Rnk6hL5n4Ohj7569zL?=
 =?us-ascii?Q?ALrRbG/p4jfbnMW6OyNP82pe0292d1f4B6wUca79SFi8T1Oo2DIXWVlb0gvF?=
 =?us-ascii?Q?QjUc8oPjzXDr+AxyODHTSPwGo/Skiqv54zQ+bqBgiADisXlFXGBs+1eHkxeD?=
 =?us-ascii?Q?1nM/z79ha/HN21UkPyV2A9HquSJe6U7+2HNhftK1zGaJPpfRpC5qhWRk4V+d?=
 =?us-ascii?Q?ux9/eJ3uEunhflVu050gye3YtaBmF41opuOYKpdwtaEixc0UtlKE0+cofzvE?=
 =?us-ascii?Q?gdgo0+vViC+LCV7dWc9sqS/JXjG8dD5rNZ1SeENxQWnnMo8kRQHI65CFFVTb?=
 =?us-ascii?Q?jmQsMVJvUnZoaNtdN+Fqo+bsDAHCDNAbZYFMuj2clKE2y026/o3Gri/paq1H?=
 =?us-ascii?Q?CzU94r0APPg+V+XWtESaqRwiviiaFTuzXPjuhHrlACoeZ4JX7QlKrB7SZfHL?=
 =?us-ascii?Q?ALxdB8KDjBAuo5xiprizSnCtN7BwZU9wDOrMn25REKnqvDPDlmRxAXK6xuoe?=
 =?us-ascii?Q?+UtBfAODQLnNK46qBEEc1n4guWMSFFqGNJksWrdSAVeAi9CuWYYZNIKk8cE5?=
 =?us-ascii?Q?phc/9+Yi/hFFzHAbIEKSPOt3sXeOz9qYZtl1/CFrqR8x3UZGVyrFgeNJrjmb?=
 =?us-ascii?Q?dd8rR0NrLbfN6v58kcPQ1ctwQGztSED1E6yG8YrxrQ8fliB/qJTQDKDw4FdP?=
 =?us-ascii?Q?y8RzkHeTtYmXuHc0spEteqezxQfzb6hrgQpy4ka0/aFhkFSYyRu97V1mIFlZ?=
 =?us-ascii?Q?fyqe43EJlbDdiqIPmDYwFdyleXxx9swvQ8VXRb880tjsYg19lQg0OCsyX7sz?=
 =?us-ascii?Q?XV6C4u8vmPx2ZGqMD/n9r/Ae8QEvyHYuU3IqL/X2Ynw1vLp7K5aOy13LOLLr?=
 =?us-ascii?Q?fgX68/8UUig95cu5LukJCry6OBknSku13WNIf4EhHX5CjIWqHP1Hqqw/6Q+e?=
 =?us-ascii?Q?j+18BRIx8cTs+85wCtDVpd85LTZJWhL9IgWO2I7n9rM+BIB2gaC4iHJyG23v?=
 =?us-ascii?Q?XEywwlvhEm22ZX+70SMMjb42WmpgrzvXhlfZfks0x6aFUrpHB5MCGC8xabGM?=
 =?us-ascii?Q?6JxAzTF1lxn+TDhf8KJeYcCQ/iMHOuAIHQEhHJiSdf4wu4uR+Bc+qGzJvUsx?=
 =?us-ascii?Q?Z8KWpZ4szZfPGmFIDyw4LHgzsU8b3ainjiiAcQyK1OJF+XZYPfgIxNz4/k0t?=
 =?us-ascii?Q?l41wTbwErNjiJgSaK3hqpPPKlG2lBXCJgvHGQc1uvd4ZBOUOq1J3WHfH/cBr?=
 =?us-ascii?Q?JKDd00bRcUyO/lHYnXBtuSx/Qrwt4z2od3ektrHrREFh4vTUlQ91dptN2p13?=
 =?us-ascii?Q?IpyQDGdELiTbytjK/5ozpBJyB0+oQt6P/ZM+gtypZf5S0aW1bfKBgZ6gN5/2?=
 =?us-ascii?Q?gpWODp/SReE+yVXQc1+q3qmtIjMbmcySv3he680TZqiBkfEUiWNg0Pt+teRV?=
 =?us-ascii?Q?aNL5ypMLMaXPLzOYI3MAro+73R5hvdK3zwfRZLiPRQm1QLOmKzwbFQxozSYQ?=
 =?us-ascii?Q?B9dJ9AVmExDWP34ckLj/HCHfTVWp/LtXL5IeFg8wOcouj1AW2csd7WBiY++g?=
 =?us-ascii?Q?u8hkWGDiLB3w+7vgGmJomdrU0FBrEdXvyB7LwbgI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d976c68-dc2f-43da-820b-08ddd652a848
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 08:07:45.7911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKWSpmz57KSlkznZwncDcOp40cxsh+JQggvVzsznkVmPqL86ka+kqwsxjrQH7JkIxrkb1k/Ij3kITLar7vsYgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8192
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

The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
Audio Subsystem to the HDMI TX Controller.

Shrink register map size of hdmi_pvi to avoid overlapped hdmi_pai device.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 28 ++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 841d155685ee..00d8474bd1b1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2066,7 +2066,7 @@ irqsteer_hdmi: interrupt-controller@32fc2000 {
 
 			hdmi_pvi: display-bridge@32fc4000 {
 				compatible = "fsl,imx8mp-hdmi-pvi";
-				reg = <0x32fc4000 0x1000>;
+				reg = <0x32fc4000 0x800>;
 				interrupt-parent = <&irqsteer_hdmi>;
 				interrupts = <12>;
 				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PVI>;
@@ -2092,6 +2092,24 @@ pvi_to_hdmi_tx: endpoint {
 				};
 			};
 
+			hdmi_pai: audio-bridge@32fc4800 {
+				compatible = "fsl,imx8mp-hdmi-pai";
+				reg = <0x32fc4800 0x800>;
+				interrupt-parent = <&irqsteer_hdmi>;
+				interrupts = <14>;
+				clocks = <&clk IMX8MP_CLK_HDMI_APB>;
+				clock-names = "apb";
+				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
+				status = "disabled";
+
+				port {
+
+					pai_to_hdmi_tx: endpoint {
+						remote-endpoint = <&hdmi_tx_from_pai>;
+					};
+				};
+			};
+
 			lcdif3: display-controller@32fc6000 {
 				compatible = "fsl,imx8mp-lcdif";
 				reg = <0x32fc6000 0x1000>;
@@ -2143,6 +2161,14 @@ port@1 {
 						reg = <1>;
 						/* Point endpoint to the HDMI connector */
 					};
+
+					port@2 {
+						reg = <2>;
+
+						hdmi_tx_from_pai: endpoint {
+							remote-endpoint = <&pai_to_hdmi_tx>;
+						};
+					};
 				};
 			};
 
-- 
2.34.1

