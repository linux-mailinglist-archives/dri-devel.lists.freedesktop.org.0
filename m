Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A4C92F7EF
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 11:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82ABC10EC86;
	Fri, 12 Jul 2024 09:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ckp+GJAO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011012.outbound.protection.outlook.com [52.101.70.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE3C10EC88
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 09:26:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BEk4VhsemUwwbjvRAMuWjgr2OuqdFLvSQTRqcDtd635LlP13fPC/IXboSV0perTZtnUa/pKY4KAxXojvzZyoHlrisUYCiPcmdp/xleQBXgTTzduRReGmnZk/q2nBhzD6QsmxsY4d9ruG4Z0dk2dwAgWqvf5a4CTcz0QeHWyjafX+r601xx99iGzsLnnOnYb9Zw73bOqcdYUFsPxbW2H6oY3O8W5s+rATi/Uw1oHyIf70O7WD2TUX50N27QUhW6Uj2QOK7YO6QxL8EhzRiz+JSIzWhQHxljOahDOY1rXNCn92PUQ24G9lSVv4Wf9ceTcBWehBqUTZo848isdIygWarA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPs4HJAkwh/9hjGFxZs4MzR8DfXyedrExZB8kYWa3fI=;
 b=ai9OQz7SLzIZgLXuUo611wUhomNBpj9JnuQnVh+jZXcm7KYUFPOr2EWIv+8vZzu1deIkDX9lSFjbVvTNY0PzHjGQkvBxbac/NQDRigqIgdVaHEdGjZ6CDavYY1V8Cpe6IXfXSc2C5BV+SPJnNzwZqa4qN2CqlcZEYAJqZDVmQ1buGvrXmsP3zG0EzvKeZ1/X0XGmhtqUDvPBj+NUb1+Xz4B9xYUFhV9QwZYpNIQDkaj5AbjUY4ny5BJWv+PqZnOGWgn0XwyPBZr8yT6ycrAoqoYXm6juvftkZc6pmaOCmbeGkmyav1eMaych3Sr5ntfFeR7cEM7cnOqBfldJX77C5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPs4HJAkwh/9hjGFxZs4MzR8DfXyedrExZB8kYWa3fI=;
 b=ckp+GJAO+kYndLTzegHLJ1y8YWg6Qh/zxPrmvhLOlK2x3TJeR43TqsMqiukQn4ppFSW8AfY5iR68+si5baiOd+lV1RNDst9vF7673uPrQH5PZxMVrwh9E6pM8fUDTevOJLjK35nwtiGGPyS2Qtob7Kgs74eC5gSZfxZYnW8D+0k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10242.eurprd04.prod.outlook.com (2603:10a6:150:1a8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 09:26:09 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 09:26:09 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com
Subject: [DO NOT MERGE PATCH v2 13/16] arm64: dts: imx8qxp: Add display
 controller subsystem
Date: Fri, 12 Jul 2024 17:32:40 +0800
Message-Id: <20240712093243.2108456-14-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240712093243.2108456-1-victor.liu@nxp.com>
References: <20240712093243.2108456-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10242:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e24c4fc-63f7-4345-c063-08dca254aa23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EZrqpuCZIkHnEhP397ynhdX97abZFdDyYukqOOdWN73l0DEoDcm0rMmsWnqi?=
 =?us-ascii?Q?nOcSV9nbsqeh9+cXGD+idGtSV1uhxybexWrRQfVyOupCuVKbcJoEm8eKcp/9?=
 =?us-ascii?Q?lIIv5Qxom8SHyWRs+Ckgtw6in+2BbFoeKVgkPtIEk5SCKstHkKw1YndAYh4L?=
 =?us-ascii?Q?Mc9MA7CJiCzOKzKAzTbAoEAZMeWX6zIRk3kZfh5ZvOZ5yE5qVYQlWqlFZJL9?=
 =?us-ascii?Q?y+MEkTQbD4me0pnd97gIsVuI0lHn+Bb/kVfEJ7pucF2SMGmtky3hU3hZSuI6?=
 =?us-ascii?Q?R6rxydP0R7kJeg/R2up1ddLFfMrF+VHTwGItchT2NmUUOLgTmoWqbERzd/1h?=
 =?us-ascii?Q?PX7i5iqd0LzQetenQx+gvMvtKeOyXsccWqVnUqZXwpo1pYHfy7opnQkuRFxp?=
 =?us-ascii?Q?/wslyjFi+0L7Pnp/YGt/cjMUnvzR2zwsjW0vITUUD75wn13d7dLdiY7iemOJ?=
 =?us-ascii?Q?N8FOqtmn6gJACucFW3aL3Z1J7uoQhcpZ9NITO2hxLEI9G0O9e5fSpg3bxokx?=
 =?us-ascii?Q?D/fCeRU2WF6/6JdvvYpjPOwctrzzXcWaNPt7335ZKMGQF9gn+DkSjuk3BEIg?=
 =?us-ascii?Q?eob3WAYOiEGCTfMF7qcekRcqqF8m+f0fmXt9JE9A2Kb0xLBSsaKvyftj92Bz?=
 =?us-ascii?Q?r4+rIUNcU5i8k8zvGm6G6QNNmwBAoQnUb/mcwSHy9qGg7rLQJI3i7eLCaP9D?=
 =?us-ascii?Q?2lsKfaGgZ3dxp3tvhy9uZFsEFlXqtygtrS/vaFw6ssxbNze2UMbfQzbNRFVB?=
 =?us-ascii?Q?0LoptKYAtBexGQ4EWUi5CnSsmd9VZ4iK6jruBco1KXQzkhWiVsjxehaazbNS?=
 =?us-ascii?Q?xc3y0u45N631b6SQIViXW3B6apeZ9v5FVPR5NQGmbRWPJM9BiG5eqbE57bOK?=
 =?us-ascii?Q?gAxZMAenxvModh6gUJmDZm3N8JrYjWQDm/6m/2/HCPF/qAYQBJcr9AoYyyps?=
 =?us-ascii?Q?Mhr7MRYPMNUM0+/EvcThAKsFgtF/4D8oUI0gjCnlhXGTBUcIY6PqHgco1+CM?=
 =?us-ascii?Q?NDjlqHJaQ9XnkVcApNo1TtITQNe9Moxrr+ULGDgRjKaIpeRqzGijdN3Q6cWt?=
 =?us-ascii?Q?nM8OtyTU5muadCI8q1fLA3VdjMinOs15MxyoCCtazGdvM3DiBdBPt+T8FtGx?=
 =?us-ascii?Q?fYG/EWVIli660HOxLp3IbufDe1R7dTHeJqZJxKLwwyoMLc9q+NmqCueHDJAO?=
 =?us-ascii?Q?wiFn7i3fqghqZ5EmBAk5aGgTa1QSSeoD7u7C8BrWXm0WgjScBL7d3fRN3RG4?=
 =?us-ascii?Q?Os1t25/qk09ufpTJjEElJaZ72DbbnHEpqOiUh+Kqj4k3kTZbO5JdCVsjzd2n?=
 =?us-ascii?Q?D8/vdBjFrZBbLVlEIB3EtpL6KUcWyHB1Uz7wQ+CDzpVdEtEEcFLe6SqyIta0?=
 =?us-ascii?Q?X3pyc/1ibcW20pDcy7wGZmwCwXtdtqU37g7VhCbbAEQ7voWXUQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A1NKsWBEkzBgvaXmvRnNnQt+2JYk/ZS5OSj00VbpXKNlpeZJ1ZseBnVmkfVk?=
 =?us-ascii?Q?q3CjwrYFI/G4CgCbErdgQK2w3QcXonccpmdnwncu/IUWskC/olD9iL9NL/Xv?=
 =?us-ascii?Q?Zk4SoFaWeUNuHUwEK4mdjK+/xWyNKpl4+YyTtU4pflfCWoIWvB0TNdijNdxB?=
 =?us-ascii?Q?HM7IbT1oy/HvpJW+v5lOtvhCAlp57kzNUGwWUHeqzrjWDAjYT66BPmd6Ff1x?=
 =?us-ascii?Q?+ZV0YQdwtwBTXi2DKnLcPNDeLpon8RkJUXoHV6hoUZJNeVQOwVUwZALjxyNv?=
 =?us-ascii?Q?rPw0EOsrCO1L45h970tz9pNmgGdQgK8BYIn4+g+t5rW+PtoAsZ7v4lQt3fpO?=
 =?us-ascii?Q?PBb2WguBZRihJo81BjRNlH3i/0yAzBcTBJ1GfvaefG7TvppiHW9rCR+Ev99l?=
 =?us-ascii?Q?SuWOrQwawLcvlReB6WftsHKDg55gjPfDsGcxdlvAOWxoMrf4gIne24UMGlk/?=
 =?us-ascii?Q?9bYciOS9s4GgEjIP9OSZkmx0mZhqQS/kuwIJnFRoTgjcD1Ky8RKLyN0AvcM+?=
 =?us-ascii?Q?NuStI1nF97+EkTj3+gMCT8hEoVEfulAE7UC+mFDo/wOrKEacjHQjYDr1NUXv?=
 =?us-ascii?Q?p9InRi6FrvtSrUJleVelzXzMj+9l1XACR+KF2hsIrPn6seuDnX7VdJVyJZ84?=
 =?us-ascii?Q?7hk8jso68zKGyBGHZssN3wXy0sbUsRJzarRc3qXwn2xyeAgWLgdgvHeGb2VF?=
 =?us-ascii?Q?hQ4s+F4ICIuOw4BS1VGrx1emoSB8ynBKWS2uFivzI2GHgkEZYWOR/7AQLduh?=
 =?us-ascii?Q?0RciSMmeQbUanXU3BJ45rdRoHb5LxzYb1xochZoR9YqTmJaONZR0OBl8GKXB?=
 =?us-ascii?Q?i3ZP7rWhFRCFdopZRA6FKPDSrUKwbKMShtwTIPs0X42LYdwkPC06+jKi3g8J?=
 =?us-ascii?Q?OeolRihi83ycQkF6EFnqWawIkHk4qUGluIQnzdW+VKAXp3DDhprYmJi3ylHc?=
 =?us-ascii?Q?4SHRmwUHz2dyIWDsV3tTKphvqof59pflHnW/V5T2onL/U+JSiTL+PSNPBFg5?=
 =?us-ascii?Q?tgxA9plBzlYkPCcJayFozBENA//Eqc2XzPV4YOZZH7YpgJeTxqPV+87FyUrB?=
 =?us-ascii?Q?RnKMKuqKOhZZ/kEG2DpVIkBsLMAAF84/lqO4Jg5P/g/hQlZ6KLg5SZIGSR6B?=
 =?us-ascii?Q?ufYMH16wwYaqEZPxge3wLDntjVtizeywF1r+R0gAJI9JJatWDoc0xdCiQlg9?=
 =?us-ascii?Q?rqudYyVzomhSELQKG7+tMzCXDIf2gcZtU/GYCAS6quZr8EfxgYdqw74uyfvN?=
 =?us-ascii?Q?hpsTprsAXgsOmaO4N3R6ovFCggLbx0j2+705JNs+ki0v4JsruYSEOAhLJe+M?=
 =?us-ascii?Q?r2E3Js9PjaqztC+vbq5QorCMafKSd68Tui3kZ+5B4V0NDO4awXkdoeSelaUr?=
 =?us-ascii?Q?SuYgqmmHzSMoXIUmSyj3HOG3dDRqaPZfPFQGWkLSosRiZr6aC2W5ExLzp0RK?=
 =?us-ascii?Q?Uh2N4U1XeqlfmuqOTa20Gjp8BOMzvi6iJEv4bWjXWJoHFYWf71VQp9r9N7gu?=
 =?us-ascii?Q?TsT92ohJwAIWGyvUlJwQhbgc70qfwltno7wNXbbq+Gby+wQluMir5WgwqYYC?=
 =?us-ascii?Q?qHxItgn/d7mBiEYCqo4z13lyf5WbeKUjKkk1UO9Y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e24c4fc-63f7-4345-c063-08dca254aa23
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 09:26:09.6926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LI0o4PxUdNsiMEodGazrZhby3ybxQ8gEW59JzxVq+TduhKJZqaLnqZi9+W8s/SYmhGTSeI8yl0jkSsCYIN+51A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10242
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

Add display controller subsystem in i.MX8qxp SoC.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
* New patch. (Krzysztof)

 .../arm64/boot/dts/freescale/imx8-ss-dc0.dtsi | 408 ++++++++++++++++++
 .../boot/dts/freescale/imx8qxp-ss-dc.dtsi     | 236 ++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |  25 +-
 3 files changed, 668 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
new file mode 100644
index 000000000000..0db345204b89
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
@@ -0,0 +1,408 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <dt-bindings/clock/imx8-lpcg.h>
+#include <dt-bindings/firmware/imx/rsrc.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+dc0_axi_ext_clk: clock-dc0-axi-ext {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <800000000>;
+	clock-output-names = "dc0_axi_ext_clk";
+};
+
+dc0_axi_int_clk: clock-dc0-axi-int {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <400000000>;
+	clock-output-names = "dc0_axi_int_clk";
+};
+
+dc0_cfg_clk: clock-dc0-cfg {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <100000000>;
+	clock-output-names = "dc0_cfg_clk";
+};
+
+dc0_subsys: bus@56000000 {
+	compatible = "simple-bus";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges = <0x56000000 0x0 0x56000000 0x1000000>;
+
+	dc0_irqsteer: interrupt-controller@56000000 {
+		compatible = "fsl,imx-irqsteer";
+		reg = <0x56000000 0x1000>;
+		interrupt-controller;
+		interrupt-parent = <&gic>;
+		#interrupt-cells = <1>;
+		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&dc0_lis_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "ipg";
+		fsl,channel = <0>;
+		fsl,num-irqs = <512>;
+	};
+
+	dc0_disp_lpcg: clock-controller@56010000 {
+		reg = <0x56010000 0x4>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_DC_0 IMX_SC_PM_CLK_MISC0>,
+			 <&clk IMX_SC_R_DC_0 IMX_SC_PM_CLK_MISC1>;
+		clock-indices = <IMX_LPCG_CLK_0>, <IMX_LPCG_CLK_1>;
+		clock-output-names = "dc0_disp0_lpcg_clk", "dc0_disp1_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+	};
+
+	dc0_lis_lpcg: clock-controller@56010004 {
+		reg = <0x56010004 0x4>;
+		#clock-cells = <1>;
+		clocks = <&dc0_cfg_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "dc0_lis_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+	};
+
+	dc0_disp_ctrl_link_mst0_lpcg: clock-controller@56010008 {
+		reg = <0x56010008 0x4>;
+		#clock-cells = <1>;
+		clocks = <&dc0_cfg_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "dc0_disp_ctrl_link_mst0_lpcg_msi_clk";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+	};
+
+	dc0_pixel_combiner_lpcg: clock-controller@56010010 {
+		reg = <0x56010010 0x4>;
+		#clock-cells = <1>;
+		clocks = <&dc0_cfg_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "dc0_pixel_combiner_lpcg_apb_clk";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+	};
+
+	dc0_lpcg: clock-controller@56010014 {
+		reg = <0x56010014 0x4>;
+		#clock-cells = <1>;
+		clocks = <&dc0_cfg_clk>, <&dc0_axi_int_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>, <IMX_LPCG_CLK_5>;
+		clock-output-names = "dc0_lpcg_cfg_clk",
+				     "dc0_lpcg_axi_clk";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+	};
+
+	dc0_pc: pixel-combiner@56020000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x56020000 0x10000>;
+		clocks = <&dc0_pixel_combiner_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "apb";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+		status = "disabled";
+
+		channel@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			status = "disabled";
+
+			port@0 {
+				reg = <0>;
+
+				dc0_pixel_combiner_ch0_dc0_disp0: endpoint {
+					remote-endpoint = <&dc0_disp0_dc0_pixel_combiner_ch0>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				dc0_pixel_combiner_ch0_dc0_pixel_link0: endpoint {
+					remote-endpoint = <&dc0_pixel_link0_dc0_pixel_combiner_ch0>;
+				};
+			};
+		};
+
+		channel@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			status = "disabled";
+
+			port@0 {
+				reg = <0>;
+
+				dc0_pixel_combiner_ch1_dc0_disp1: endpoint {
+					remote-endpoint = <&dc0_disp1_dc0_pixel_combiner_ch1>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				dc0_pixel_combiner_ch1_dc0_pixel_link1: endpoint {
+					remote-endpoint = <&dc0_pixel_link1_dc0_pixel_combiner_ch1>;
+				};
+			};
+		};
+	};
+
+	dc0: display-controller@56180000 {
+		reg = <0x56180000 0x40000>;
+		clocks = <&dc0_lpcg IMX_LPCG_CLK_4>;
+		power-domains = <&pd IMX_SC_R_DC_0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		status = "disabled";
+
+		dc0_intc: interrupt-controller@56180040 {
+			reg = <0x56180040 0x60>;
+			clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+			interrupt-controller;
+			interrupt-parent = <&dc0_irqsteer>;
+			#interrupt-cells = <1>;
+			interrupts = <448>, <449>, <450>,  <64>,
+				      <65>,  <66>,  <67>,  <68>,
+				      <69>,  <70>, <193>, <194>,
+				     <195>, <196>, <197>,  <72>,
+				      <73>,  <74>,  <75>,  <76>,
+				      <77>,  <78>,  <79>,  <80>,
+				      <81>, <199>, <200>, <201>,
+				     <202>, <203>, <204>, <205>,
+				     <206>, <207>, <208>,   <5>,
+				       <0>,   <1>,   <2>,   <3>,
+				       <4>,  <82>,  <83>,  <84>,
+				      <85>, <209>, <210>, <211>,
+				     <212>;
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
+					  "reserved",
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
+		};
+
+		dc0_pixel_engine: pixel-engine@56180800 {
+			reg = <0x56180800 0xac00>;
+			clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			dc0_constframe0: constframe@56180960 {
+				reg = <0x56180960 0xc>, <0x56184400 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_extdst0: extdst@56180980 {
+				reg = <0x56180980 0x1c>, <0x56184800 0x28>;
+				reg-names = "pec", "cfg";
+				interrupt-parent = <&dc0_intc>;
+				interrupts = <3>, <4>, <5>;
+				interrupt-names = "shdload", "framecomplete", "seqcomplete";
+			};
+
+			dc0_constframe4: constframe@561809a0 {
+				reg = <0x561809a0 0xc>, <0x56184c00 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_extdst4: extdst@561809c0 {
+				reg = <0x561809c0 0x1c>, <0x56185000 0x28>;
+				reg-names = "pec", "cfg";
+				interrupt-parent = <&dc0_intc>;
+				interrupts = <6>, <7>, <8>;
+				interrupt-names = "shdload", "framecomplete", "seqcomplete";
+			};
+
+			dc0_constframe1: constframe@561809e0 {
+				reg = <0x561809e0 0xc>, <0x56185400 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_extdst1: extdst@56180a00 {
+				reg = <0x56180a00 0x1c>, <0x56185800 0x28>;
+				reg-names = "pec", "cfg";
+				interrupt-parent = <&dc0_intc>;
+				interrupts = <9>, <10>, <11>;
+				interrupt-names = "shdload", "framecomplete", "seqcomplete";
+			};
+
+			dc0_constframe5: constframe@56180a20 {
+				reg = <0x56180a20 0xc>, <0x56185c00 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_extdst5: extdst@56180a40 {
+				reg = <0x56180a40 0x1c>, <0x56186000 0x28>;
+				reg-names = "pec", "cfg";
+				interrupt-parent = <&dc0_intc>;
+				interrupts = <12>, <13>, <14>;
+				interrupt-names = "shdload", "framecomplete", "seqcomplete";
+			};
+
+			dc0_fetchwarp2: fetchwarp@56180a60 {
+				reg = <0x56180a60 0x10>, <0x56186400 0x190>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_fetchlayer0: fetchlayer@56180ac0 {
+				reg = <0x56180ac0 0xc>, <0x56188400 0x404>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_layerblend0: layerblend@56180ba0 {
+				reg = <0x56180ba0 0x10>, <0x5618a400 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_layerblend1: layerblend@56180bc0 {
+				reg = <0x56180bc0 0x10>, <0x5618a800 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_layerblend2: layerblend@56180be0 {
+				reg = <0x56180be0 0x10>, <0x5618ac00 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_layerblend3: layerblend@56180c00 {
+				reg = <0x56180c00 0x10>, <0x5618b000 0x20>;
+				reg-names = "pec", "cfg";
+			};
+		};
+
+		dc0_display_engine0: display-engine@5618b400 {
+			reg = <0x5618b400 0x14>, <0x5618b800 0x1c00>;
+			reg-names = "top", "cfg";
+			interrupt-parent = <&dc0_intc>;
+			interrupts = <15>, <16>, <17>;
+			interrupt-names = "shdload", "framecomplete", "seqcomplete";
+			power-domains = <&pd IMX_SC_R_DC_0_PLL_0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			dc0_framegen0: framegen@5618b800 {
+				reg = <0x5618b800 0x98>;
+				clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
+				interrupt-parent = <&dc0_intc>;
+				interrupts = <18>, <19>, <20>, <21>,
+					     <41>, <42>, <43>, <44>;
+				interrupt-names = "int0", "int1", "int2", "int3",
+						  "primsync_on", "primsync_off",
+						  "secsync_on", "secsync_off";
+			};
+
+			dc0_tcon0: tcon@5618c800 {
+				reg = <0x5618c800 0x588>;
+
+				port {
+					dc0_disp0_dc0_pixel_combiner_ch0: endpoint {
+						remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_disp0>;
+					};
+				};
+			};
+		};
+
+		dc0_display_engine1: display-engine@5618b420 {
+			reg = <0x5618b420 0x14>, <0x5618d400 0x1c00>;
+			reg-names = "top", "cfg";
+			interrupt-parent = <&dc0_intc>;
+			interrupts = <25>, <26>, <27>;
+			interrupt-names = "shdload", "framecomplete", "seqcomplete";
+			power-domains = <&pd IMX_SC_R_DC_0_PLL_1>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			dc0_framegen1: framegen@5618d400 {
+				reg = <0x5618d400 0x98>;
+				clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_1>;
+				interrupt-parent = <&dc0_intc>;
+				interrupts = <28>, <29>, <30>, <31>,
+					     <45>, <46>, <47>, <48>;
+				interrupt-names = "int0", "int1", "int2", "int3",
+						  "primsync_on", "primsync_off",
+						  "secsync_on", "secsync_off";
+			};
+
+			dc0_tcon1: tcon@5618e400 {
+				reg = <0x5618e400 0x588>;
+
+				port {
+					dc0_disp1_dc0_pixel_combiner_ch1: endpoint {
+						remote-endpoint = <&dc0_pixel_combiner_ch1_dc0_disp1>;
+					};
+				};
+			};
+		};
+	};
+
+	dc0_pl_msi_bus: bus@56200000 {
+		reg = <0x56200000 0x100000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&dc0_irqsteer>;
+		interrupts = <320>;
+		ranges;
+		clocks = <&dc0_disp_ctrl_link_mst0_lpcg IMX_LPCG_CLK_4>,
+			 <&dc0_disp_ctrl_link_mst0_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "msi", "ahb";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
new file mode 100644
index 000000000000..299720d8c99e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+&dc0 {
+	compatible = "fsl,imx8qxp-dc";
+};
+
+&dc0_constframe0 {
+	compatible = "fsl,imx8qxp-dc-constframe";
+};
+
+&dc0_constframe1 {
+	compatible = "fsl,imx8qxp-dc-constframe";
+};
+
+&dc0_constframe4 {
+	compatible = "fsl,imx8qxp-dc-constframe";
+};
+
+&dc0_constframe5 {
+	compatible = "fsl,imx8qxp-dc-constframe";
+};
+
+&dc0_disp_ctrl_link_mst0_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&dc0_disp_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&dc0_display_engine0 {
+	compatible = "fsl,imx8qxp-dc-display-engine";
+};
+
+&dc0_display_engine1 {
+	compatible = "fsl,imx8qxp-dc-display-engine";
+};
+
+&dc0_extdst0 {
+	compatible = "fsl,imx8qxp-dc-extdst";
+};
+
+&dc0_extdst1 {
+	compatible = "fsl,imx8qxp-dc-extdst";
+};
+
+&dc0_extdst4 {
+	compatible = "fsl,imx8qxp-dc-extdst";
+};
+
+&dc0_extdst5 {
+	compatible = "fsl,imx8qxp-dc-extdst";
+};
+
+&dc0_fetchlayer0 {
+	compatible = "fsl,imx8qxp-dc-fetchlayer";
+};
+
+&dc0_fetchwarp2 {
+	compatible = "fsl,imx8qxp-dc-fetchwarp";
+};
+
+&dc0_framegen0 {
+	compatible = "fsl,imx8qxp-dc-framegen";
+};
+
+&dc0_framegen1 {
+	compatible = "fsl,imx8qxp-dc-framegen";
+};
+
+&dc0_intc {
+	compatible = "fsl,imx8qxp-dc-intc";
+};
+
+&dc0_layerblend0 {
+	compatible = "fsl,imx8qxp-dc-layerblend";
+};
+
+&dc0_layerblend1 {
+	compatible = "fsl,imx8qxp-dc-layerblend";
+};
+
+&dc0_layerblend2 {
+	compatible = "fsl,imx8qxp-dc-layerblend";
+};
+
+&dc0_layerblend3 {
+	compatible = "fsl,imx8qxp-dc-layerblend";
+};
+
+&dc0_lis_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&dc0_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&dc0_pc {
+	compatible = "fsl,imx8qxp-pixel-combiner";
+};
+
+&dc0_pixel_combiner_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&dc0_pixel_engine {
+	compatible = "fsl,imx8qxp-dc-pixel-engine";
+};
+
+&dc0_pl_msi_bus {
+	compatible = "fsl,imx8qxp-display-pixel-link-msi-bus", "simple-pm-bus";
+};
+
+&dc0_tcon0 {
+	compatible = "fsl,imx8qxp-dc-tcon";
+};
+
+&dc0_tcon1 {
+	compatible = "fsl,imx8qxp-dc-tcon";
+};
+
+&scu {
+	dc0_pixel_link0: dc0-pixel-link0 {
+		compatible = "fsl,imx8qxp-dc-pixel-link";
+		fsl,dc-id = /bits/ 8 <0>;
+		fsl,dc-stream-id = /bits/ 8 <0>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* from dc0 pixel combiner channel0 */
+			port@0 {
+				reg = <0>;
+
+				dc0_pixel_link0_dc0_pixel_combiner_ch0: endpoint {
+					remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_pixel_link0>;
+				};
+			};
+
+			/* to PXL2DPIs in MIPI/LVDS combo subsystems */
+			port@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+				status = "disabled";
+
+				dc0_pixel_link0_mipi_lvds_0_pxl2dpi: endpoint@0 {
+					reg = <0>;
+				};
+
+				dc0_pixel_link0_mipi_lvds_1_pxl2dpi: endpoint@1 {
+					reg = <1>;
+				};
+			};
+
+			/* unused */
+			port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			/* unused */
+			port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+
+			/* to imaging subsystem */
+			port@4 {
+				reg = <4>;
+				status = "disabled";
+			};
+		};
+	};
+
+	dc0_pixel_link1: dc0-pixel-link1 {
+		compatible = "fsl,imx8qxp-dc-pixel-link";
+		fsl,dc-id = /bits/ 8 <0>;
+		fsl,dc-stream-id = /bits/ 8 <1>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* from dc0 pixel combiner channel1 */
+			port@0 {
+				reg = <0>;
+
+				dc0_pixel_link1_dc0_pixel_combiner_ch1: endpoint {
+					remote-endpoint = <&dc0_pixel_combiner_ch1_dc0_pixel_link1>;
+				};
+			};
+
+			/* to PXL2DPIs in MIPI/LVDS combo subsystems */
+			port@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+				status = "disabled";
+
+				dc0_pixel_link1_mipi_lvds_1_pxl2dpi: endpoint@0 {
+					reg = <0>;
+				};
+
+				dc0_pixel_link1_mipi_lvds_0_pxl2dpi: endpoint@1 {
+					reg = <1>;
+				};
+			};
+
+			/* to parallel display interface in ADMA subsystem */
+			port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			/* unused */
+			port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+
+			/* unused */
+			port@4 {
+				reg = <4>;
+				status = "disabled";
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 0313f295de2e..c4e6f1a3ac0d 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -20,6 +20,27 @@ / {
 	#size-cells = <2>;
 
 	aliases {
+		dc0 = &dc0;
+		dc0-constframe0 = &dc0_constframe0;
+		dc0-constframe1 = &dc0_constframe1;
+		dc0-constframe4 = &dc0_constframe4;
+		dc0-constframe5 = &dc0_constframe5;
+		dc0-display-engine0 = &dc0_display_engine0;
+		dc0-display-engine1 = &dc0_display_engine1;
+		dc0-extdst0 = &dc0_extdst0;
+		dc0-extdst1 = &dc0_extdst1;
+		dc0-extdst4 = &dc0_extdst4;
+		dc0-extdst5 = &dc0_extdst5;
+		dc0-fetchlayer0 = &dc0_fetchlayer0;
+		dc0-fetchwarp2 = &dc0_fetchwarp2;
+		dc0-framegen0 = &dc0_framegen0;
+		dc0-framegen1 = &dc0_framegen1;
+		dc0-layerblend0 = &dc0_layerblend0;
+		dc0-layerblend1 = &dc0_layerblend1;
+		dc0-layerblend2 = &dc0_layerblend2;
+		dc0-layerblend3 = &dc0_layerblend3;
+		dc0-tcon0 = &dc0_tcon0;
+		dc0-tcon1 = &dc0_tcon1;
 		ethernet0 = &fec1;
 		ethernet1 = &fec2;
 		gpio0 = &lsio_gpio0;
@@ -202,7 +223,7 @@ psci {
 		method = "smc";
 	};
 
-	system-controller {
+	scu: system-controller {
 		compatible = "fsl,imx-scu";
 		mbox-names = "tx0",
 			     "rx0",
@@ -319,6 +340,7 @@ map0 {
 	#include "imx8-ss-vpu.dtsi"
 	#include "imx8-ss-cm40.dtsi"
 	#include "imx8-ss-gpu0.dtsi"
+	#include "imx8-ss-dc0.dtsi"
 	#include "imx8-ss-adma.dtsi"
 	#include "imx8-ss-conn.dtsi"
 	#include "imx8-ss-ddr.dtsi"
@@ -327,6 +349,7 @@ map0 {
 
 #include "imx8qxp-ss-img.dtsi"
 #include "imx8qxp-ss-vpu.dtsi"
+#include "imx8qxp-ss-dc.dtsi"
 #include "imx8qxp-ss-adma.dtsi"
 #include "imx8qxp-ss-conn.dtsi"
 #include "imx8qxp-ss-lsio.dtsi"
-- 
2.34.1

