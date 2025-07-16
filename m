Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DFFB07D51
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 21:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5F310E3AC;
	Wed, 16 Jul 2025 19:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="MZwr3q58";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011001.outbound.protection.outlook.com [52.101.70.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C5D10E3AC
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 19:02:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWksBRRvlOn6rvinfnb3cz1djXfQPEFQ6JhAX+NOozSRJDehXhOUdgLSeC2k/GIlEA1Gpb28MeGlB/fsjblNzbWX5GItP03Gh/Lx1fEpm7hVFLmmgKC8vwa6SzZU79e2DHXcrMqCgMKEkd5sldK2ovUWwsHYz4dL43b5I9GQV07QdfT/HgG9+pxMdumbrdA3ZsrO7Ctyzje9RgXdDZtice6M6gA5E1t0Fym4NMPGIk34GVfOVBfyzLtyripWD9jkoRrc9qd51LK2CN6Btc0jwfGr5laM2g0sePQqGRIHF9JTG7vLnk6yquk3POEEvpvAax6MDeKXOUtmikjtMZvacw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzlqL+mWmBkkhjeQY63ZmSzsg8rLazCn5Nnc/5U0A+w=;
 b=fAW0xUnMKAsc9Vkw8HMsAvaA5nYFgoVr6+1z3/h6CekE0s3GBjYalqL1ovj9/c2JhnBxncNyq/BbET653yhgVEM4ZmIecczswSswE6tjiEQw+vRstwK4uq3ORLWYg4KTECvws9B0fseA6XNWMs8RllJi1QPresLM4OaI+f4RAw0tDOV583sPYns+9BPCBLAl90mooPUJFBvzBqnt5h/odpDLleSp3EGFhzDaFCa9fGhNOknOQDVXzBFyswGhiIVeJz88fq/EJ0T+Od0CAiz43G3eybsSHP8YzTBoBrgTLTbrGxQG00tB6TIAl5QEzjZtiSs+5itiYhpZbvbUJijeHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzlqL+mWmBkkhjeQY63ZmSzsg8rLazCn5Nnc/5U0A+w=;
 b=MZwr3q58lhdbA0PyyZlcpsodilRHiku/B1q5Vk40J8khXoycMBKNkUMs6Djr3AvkAKseHzDFqmGhEvUTyh5QtQx66tiKRk9ip48Q+dPzjt17cPDtg+Ddu+FtV4kUphnARfMTYrBetUQtDyiITyZmqYntFyKHryWxEYctIrHhmIN80fbU8ViEYCI+BKlDoGqmtmJ3ShTnOwu1CfufKBYo3YpPEg4bNcAYZBiBYsMLOCetgK1I5gYhkxYf02cFCIe+tAjfbMedaN/F7Pz0Xx+/zPFCG92J9hYJx6OqVk46XnoanXLMDO2IHjexagjke19QVl/lwv+sezRB/lCRfHnbBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBAPR04MB7287.eurprd04.prod.outlook.com (2603:10a6:10:1a4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 19:02:07 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 19:02:07 +0000
Date: Wed, 16 Jul 2025 15:02:02 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/10] arm64: dts: imx943: Add display pipeline nodes
Message-ID: <aHf3KsEyvwYgxJ/a@lizhi-Precision-Tower-5810>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
 <20250716081519.3400158-9-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716081519.3400158-9-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AS4P189CA0066.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBAPR04MB7287:EE_
X-MS-Office365-Filtering-Correlation-Id: e8597934-d46a-4f30-6661-08ddc49b42ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|52116014|7416014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C37TFoYOQmINAqkH+cO+uBKDrLXvMFHgf2asrVAHV8eC1sTjmtsGaSvrbuoR?=
 =?us-ascii?Q?EojkwlZa8v9gCslCew3nojAEr6f87OS/xg8hqKTmDBGB3td6O2AvMLAu7N6k?=
 =?us-ascii?Q?1aZD8CPFiFzxE3q7PN0SNNoa5oQTeqpBNv9oKUw/EJ442lYNn+ukJGt+cvN3?=
 =?us-ascii?Q?5K+ntXJdNp2tvjqpGFf8jBcxCmneehGqwRHyevfcqjvKCwMwyVvbRgsNRlYz?=
 =?us-ascii?Q?bas2gr4NDarLGvJPF78uWhDCWrczeWRSDT/yUZHFrTqDszEtqYJ+rD7XOcOV?=
 =?us-ascii?Q?s51ZyTQgauyBTDY8vcbczHxQV196f9huU7txYVPFAcLFWpUmuQH5Am6tIcfg?=
 =?us-ascii?Q?Kl7UkdshUu9XiNStrMSY+VyuJ3BjpH1jH82QtO4O08ObRFvNhmvPjUjKwP4i?=
 =?us-ascii?Q?W4yFT8uJmr0/+maWyzGqGIu5vyMEYw9qITetC8KgciOyhwxH95cnvY8f9N4r?=
 =?us-ascii?Q?2UPkB6LzqxxeQKdDYr0pIyYJig1kVc6MKy3x2qRYWY1rts/IJ0YSjV5rn5Na?=
 =?us-ascii?Q?V2hZbMMG6iJdPbdERwKha1bo3R2ruUib1KGgzY4uTI0BLXO/pnDMTWxsNuzz?=
 =?us-ascii?Q?YHVz4lEC87maGKLgUxBZw9rQQLmT+Mrpmgusqd7HXrB3R6ZdKDICcjUjf211?=
 =?us-ascii?Q?tLuKpUNr8CHlVoNZn116MBFU3fru5UspgLAopNfeTBLnz5bdL3g4cpghKmwS?=
 =?us-ascii?Q?jXx2efVJPj8CwwOk3cxmqPuSx1wbUX+9+946hZfDAH5BbGRD3wKphvOXgtpo?=
 =?us-ascii?Q?sMaiVwj6l4z/8jM2tSxBPdZRjmXW01T7mCjX5qF0EvKBX35zGcmxGKTDFFvR?=
 =?us-ascii?Q?xJh+OhVGshpmRUhNB1xok36ZvzufpcNY3MEwl8Ugyj/sXZzR5rZ/3aIx3Kz+?=
 =?us-ascii?Q?DWBKsb1ZmFdRbeMUMFz0KAoZRKFhecXT9qpES0HseEz/2jG82UdVdmIhJGtS?=
 =?us-ascii?Q?3WgueoJ8m2bOFfhzf2YARf2i0bDaXPdgBNbMk6LujKWTYEXk1qKPmuEMlv6S?=
 =?us-ascii?Q?bwGNHAe3sJJk0q1meh9K/TCV+vO+E+C1CweCgBuRGdN1Ll2v2FvVd5CcRVNl?=
 =?us-ascii?Q?2DzB0f7JlnIH2qqJ1VjGbIMwrq2vvzJuXqPuRS6NjKW5KFEkZb1WuOD0yMAr?=
 =?us-ascii?Q?VA7Hp0MJBgNIydLsYSQPpkt6F6bFlEkJiN/od9CjluH9W88thjHS3ZE82U6w?=
 =?us-ascii?Q?EkVsCH2NXJAlJBs7W3sg+Y9LvB6bWwY+CCx/yq+mDJoXqVKXeS4M7McqTyte?=
 =?us-ascii?Q?kHnfzNsvI6xlg3G1IRY7Y6tOsImLl3qURINMKRHNBq3mC1fGUX3DpCv9fIeT?=
 =?us-ascii?Q?2gVCYO96kOhUHwSbF4lnr3X3P/L6WqzAH+op0G01ywR9jpOzsLterlAyfM44?=
 =?us-ascii?Q?Yd27R0IirzDGacL6HRbetXRDD6EpLpjV2vSfhfxz0VcFv72VS6sj0IqHUGVi?=
 =?us-ascii?Q?MmzHhQi2XByfWXrB/m7pT2dUcVLA9R+EJ1KZEOxamCqERs5eE1967w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kl5GYD3r2qxMl1GRwL9FS1uwpqXYKaRd0kEhFXdsVkRBqw0FlN/Pvx0jTl4v?=
 =?us-ascii?Q?Hd60+ODOT/mp0t4TrbcJXSKB7cGE38ZRu5P2xx4SDgpaswuSG/L7ugVgiy/v?=
 =?us-ascii?Q?WdYOsB5sonSIT7QD9szi6TCA5vbh1BBMLg3sntDkIZYkGSYxv+zYT2DFAU+m?=
 =?us-ascii?Q?3YgMOzQR3s6rW51t8A4NeaWl7zPbwiO+fyYXyHrl0wsLmWNYYf39R2xVHuii?=
 =?us-ascii?Q?AAPa2fnDfaLQHgdYhSIZCf1DnIYsFniFeQn5BjD+7mWjt/OFC3IhhwMqI9j7?=
 =?us-ascii?Q?z50Lc88RO0fo4YXCImRCFBZkxlyh9OYuWMCJaOb4U2VTjwKIvOp5Fme1P5aW?=
 =?us-ascii?Q?M9c2mFwKVfdgPTiTu8DEWq0I9U/kGPubF7ZnEbqQHf1aQ+8qEAX3/EMLwypO?=
 =?us-ascii?Q?ESaTGBMCgYfxD6zWeNGo9cjBHoJs2PeFuhxZjugk6JCDv0ekinwDkEHCGKzD?=
 =?us-ascii?Q?JrXkzzvfup0opCfhH4KoudkXXgBFYsv7kp+j1qhJsKRVPGKhSey6fX+Yad/L?=
 =?us-ascii?Q?TA8AMCzDWNkLuGDreEJdpo7nDntiK4qmnG9qMTN7AzSGpu5N8YUxC8oLwbdU?=
 =?us-ascii?Q?QY+0uepnX8ofuo8zuqmF+1reoRp7aodlda3YIT695aLClHnM2rRxJXwTjW7m?=
 =?us-ascii?Q?96swke0SNx9n5vZmLRYVMtIXL0PenV7hi0ckeWlYx6wVJcdCVu2xE3CJgIrO?=
 =?us-ascii?Q?d++TYIptAir2jcdQFuHLynpvIK/j8Otw2joAa02zVm7Ekjd2RYXH5+BiYPl1?=
 =?us-ascii?Q?/shRLh+NbKOet+oK2cuMe5DQncuCVjTK0ZBP16GWV/y+sV49I89u998d+6Uh?=
 =?us-ascii?Q?9n6U/qPdDacDrdgP/IQpDS4bMYZtQbDz8FmX9n98M9RKJodgOdo539wGS980?=
 =?us-ascii?Q?7Cf3vKfentxpOqdQIhNKEcXwUBhdupznziz94xK/4YIIR6L2QoA5UyPrsMj9?=
 =?us-ascii?Q?Kjqlr7+ux8Ot6QvNWT8CVjdz4V9A8Xi6/yofBi4i0gt25GithbZpWJ4sr8H1?=
 =?us-ascii?Q?uvIjT1DKcPtR6lEnts+TwbTDUk3L1hVzp/VJ0R1B9l982K/kimlNHn5UiVFY?=
 =?us-ascii?Q?AYnysq89ud696fxW8115M//GpICgS9/JZkNnDw8wWtfdJlebHpIbONEKSIRx?=
 =?us-ascii?Q?77VE4MB3hh6dWw/dnO8UG1gvUoq/z6cUtNg5ZEvlRdUOsMjevPzqutg7CBC6?=
 =?us-ascii?Q?dv9136x3fmW+EZsBI/asloDU9FulxKhUHk6qbrs8LLkZhJ5jJZz4pFl7Zl/K?=
 =?us-ascii?Q?I3f8Ip12oTBcK+9Xhbppg+/lA4rstf+FAiI/ZEmEAJizz0Z7wx3kOka46AUR?=
 =?us-ascii?Q?9zzeiAI6GLCtuu6rEmGREjhpeBtMAnec3u4BBx2ccAQ8K3ShX3UKOXFCZgtz?=
 =?us-ascii?Q?tj/+ruBbY/cOcrZmAtUd+2bssAYmOjwY7B4hbg7yG7awL3zPM48OgHR3q3Eh?=
 =?us-ascii?Q?ycZL3W3dMaNz70okeW6mIbzI9wdhGA1anVDsnCZeCScxA4ZhpNDCpMwGNTxS?=
 =?us-ascii?Q?3Kmvyr/48mIa+LOEppYs8bOR0whkjuIDt00z2NQ0HNXX95pJlJxA7ghW6lKS?=
 =?us-ascii?Q?C0k9s9dglolpZwEH6BZhoiTKGxRHcWe3Ds+FOr7a?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8597934-d46a-4f30-6661-08ddc49b42ae
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 19:02:07.5931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t72XtcpeStOJJu5QLeYwfi5c/AxmSSgc4EN3rkmiCKsZA5wshm6fz7WxLTnJJ2vCd+ShIXRmDkqg43YNGI5UxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7287
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

On Wed, Jul 16, 2025 at 11:15:12AM +0300, Laurentiu Palcu wrote:
> Add display controller and LDB support in imx943.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx943.dtsi | 56 ++++++++++++++++++++++-
>  1 file changed, 55 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
> index 657c81b6016f2..db00a94812e18 100644
> --- a/arch/arm64/boot/dts/freescale/imx943.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
> @@ -148,7 +148,7 @@ l3_cache: l3-cache {
>  		};
>  	};
>
> -	clock-ldb-pll-div7 {
> +	clock_ldb_pll_div7: clock-ldb-pll-div7 {
>  		compatible = "fixed-factor-clock";
>  		#clock-cells = <0>;
>  		clocks = <&scmi_clk IMX94_CLK_LDBPLL>;
> @@ -173,10 +173,64 @@ dispmix_csr: syscon@4b010000 {
>
>  		lvds_csr: syscon@4b0c0000 {
>  			compatible = "nxp,imx94-lvds-csr", "syscon";

Did you update nxp,imx94-lvds-csr's binding doc to allow add child node
ldb@4 ?

> +			#address-cells = <1>;
> +			#size-cells = <1>;
>  			reg = <0x0 0x4b0c0000 0x0 0x10000>;

reg should be second property. add address-cells after reg

>  			clocks = <&scmi_clk IMX94_CLK_DISPAPB>;
>  			#clock-cells = <1>;
>  			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
> +
> +			ldb: ldb@4 {
> +				compatible = "fsl,imx94-ldb";
> +				#address-cells = <1>;
> +				#size-cells = <0>;

the same here.

Frank
> +				reg = <0x4 0x4>, <0x8 0x4>;
> +				reg-names = "ldb", "lvds";
> +				clocks = <&lvds_csr IMX94_CLK_DISPMIX_LVDS_CLK_GATE>;
> +				clock-names = "ldb";
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						lvds_in: endpoint {
> +							remote-endpoint = <&dcif_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		dcif: display-controller@4b120000 {
> +			compatible = "nxp,imx94-dcif";
> +			reg = <0x0 0x4b120000 0x0 0x300000>;
> +			interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "common", "bg_layer", "fg_layer";
> +			clocks = <&scmi_clk IMX94_CLK_DISPAPB>,
> +				 <&scmi_clk IMX94_CLK_DISPAXI>,
> +				 <&dispmix_csr IMX94_CLK_DISPMIX_CLK_SEL>;
> +			clock-names = "apb", "axi", "pix";
> +			assigned-clocks = <&dispmix_csr IMX94_CLK_DISPMIX_CLK_SEL>;
> +			assigned-clock-parents = <&clock_ldb_pll_div7>;
> +			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
> +			nxp,blk-ctrl = <&dispmix_csr>;
> +			status = "disabled";
> +
> +			port {
> +				dcif_out: endpoint {
> +					remote-endpoint = <&lvds_in>;
> +				};
> +			};
>  		};
>  	};
>  };
> --
> 2.34.1
>
