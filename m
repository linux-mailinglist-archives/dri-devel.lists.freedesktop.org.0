Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D99567E1B3
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 11:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5909D10E43D;
	Fri, 27 Jan 2023 10:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2123.outbound.protection.outlook.com [40.107.22.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C27110E43D
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 10:33:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cm3yHOmcbkASdQEvlu9qkmTILGXLDdA9H5bLVZCzrXGHxuzb48enTcqsYNol8j1RERiOdnnxWagv7HsokAYcG7KhtOhhHxtr+4OkkO6FBQogD6rmGW+DC1Qdy5bSz6rx8Ah6eqgl7WIvXSwkzYXxmWVRk/g9z5lPXqPnfuEe7MhSqITNfT7tgc5x1K+GffqcL+Gr7i22wdowvm0Mju1YosUwT+HmnEPJbhhxkKl4hlmFsvfTRhmJvPr4QQwcQalyLfltxvhJqHSL7+b3WuxQAYxbw8iUQh2RRwO4u8L6zpwW+6ONoFC6V2v5Dqohbh3WswFIMrsTaXtV5J75TgVPBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90qnO9RH9zmgojHjc28HAYKVC6e+PL+WkCMnRQzGjZ4=;
 b=liRD3xcqqOJtS1yVwxgv8ShStgYCivFChNPSqSZ7mXqASOyuOFaWj5GWsL29/yhn8woH26Bwup3oZ6CdFO7YR1RjdZSgvai0oD451tGWBuKCPZaYPppbt+zlGdbvVyVG4ujjn3MMmi5OitR4JPGqJcQfcR9RLGrfLpGx8Evy5i6MQtTmYEGCrsg8cxnpaMel4x2MVDAv0LulWHblmsmZ52Lz3JG9r4BET90TeeK+Tr6EaGUaWCjvvgFyzoMAlsmIIVrCbcZnpIW62MSDd5QWYvKe5O5oGjgsvGk1G1oY+z8EaKEeOOEdGaRIzcb9u4YS43bM2RM+iPADIs+kM7STjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90qnO9RH9zmgojHjc28HAYKVC6e+PL+WkCMnRQzGjZ4=;
 b=BYeVSLI28+cVlwec8u6zL7KPyX3d6osyVYqlTyH1VUHhgVc6u3TBquElDKujio/QDuzwMbFIbnjTdypwA0hBIUZuS9pXNU7c8IZuoyfsVfM7h4oF4oAH+KVU45LaAyF9xq1acKAMQl/8bMgEko4BJ8a4Bn0iqqUdtZOJnVGsUYY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by AM7PR10MB3938.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:14e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 10:33:08 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1286:27db:9d8a:4b72]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1286:27db:9d8a:4b72%7]) with mapi id 15.20.6043.021; Fri, 27 Jan 2023
 10:33:08 +0000
Message-ID: <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk>
Date: Fri, 27 Jan 2023 11:33:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: jagan@amarulasolutions.com
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US, da
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <20230126144427.607098-1-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0068.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::35) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB5266:EE_|AM7PR10MB3938:EE_
X-MS-Office365-Filtering-Correlation-Id: 70b63869-5e4d-456c-821d-08db0051e198
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s/FCH6/SqJKiIxsLrTWhwGvvOvVBgkZJweq4yq1d64u9fUMEcsInWj8239Ryo52Gs29uw5nokdHox5ltoo8iCmbPLc2bquY+7E3JhN1/7rBcapAIX5ayrS0lg1fe9qiSqGiEKFMozz+tV3p+mmmrq5IJv6oCKzDBGu/QuYiZJMi2pktT/DLo0f6v+WtW0hpGhLs8MocVoiiT4QCoLI2DE5KQ8PxNzNwsHZIlwfWOkhoZzZKYCsAJIopT1Zj0Heug0736kgt7JV/g0AhT5jkJj3ur3WZwoMu50eYGQ8u/6Il5CIBp2Ytdga/dpF3vD41/7cGpOKUpoee+wLnzpj5Fro34eaketN2wrLCCovOc0efC+/VymLLZWEd6jvivIx2Czur5oRhqZC4zyJSFksL7kfPRJOsnIlRnxVbJ1kbx9yq20htdaSQoBwY+LpOYRwgMGjQ8seo44Y6A+rtMxsfE90G0J7IdmrrJJ6G/0I6H9OnnXRqwDso2TJyo4wYSnHwG10kXZIN+02XsMfueBuUUwaekAWHjNx8J9hAJWmAYscd+vhiXMmIVguWWuXE4GMkx5TIHz7u79zZ1cMOS2hCAByihS/V63II3dz2UYnknjd+TDDtbnln01DEezTFTFvyYbLOKRGHdcQdvhJ1RQgLHnLyUogwe0/10qQSqKH9MyUEPyotXJ6Cfx3YcuLaggkrWcqVEMCX6v9bViPNaUygj42IsAhgZ4Xwr6IekLNWTXHVlAh6K4eRgL9+lsC0opz1K3CYCHhaSMB3e3g+C6aH4w9xRqov1dKlpV0rPCHASZsU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39840400004)(396003)(136003)(376002)(346002)(366004)(451199018)(6506007)(83380400001)(316002)(6512007)(6666004)(966005)(2616005)(26005)(186003)(6486002)(478600001)(66946007)(52116002)(31696002)(8676002)(4326008)(38350700002)(86362001)(36756003)(2906002)(44832011)(38100700002)(7416002)(8976002)(66556008)(41300700001)(66476007)(8936002)(6916009)(5660300002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1c4NGdSQnc4YzAyUEw1SHMvYWhmNy9rRzF5ZnlmV0JteXJ2L3dpeHBlT1lM?=
 =?utf-8?B?Zld3WVRndmJ0SkVTYTZReXdkREtBZ1dTQXVmRVZrSFc3bTY3UXdIRHp3M21r?=
 =?utf-8?B?Mnh2eFpMWENkaXZmaUNTRlVZUDNOaU01dWhHMnoyKy94MjZndTBuTmUvRHU0?=
 =?utf-8?B?aFpCZk9NRG5Jc2pxR3drb3dnOEpmRDMzMmZHWE9QVlk3S1VybDd0RzhwVkZa?=
 =?utf-8?B?OEdyVHBEaFRrZm5pSlQ1TTNVbzZVcjE4Y2tEMkJCeGVQRzBidzU3UTA5M0Jr?=
 =?utf-8?B?aklZcVEvaGROak1ZNzVMbjUrWk80TTZKWkRBYjhIS3E1L1ZCbXQxV3g4YjhB?=
 =?utf-8?B?WG55dWN4SzJzME5DSS85VlE2V0JLcnRNMTUwcGxMWk96eFljeWRlTVQzeitF?=
 =?utf-8?B?Q2hQNFEzaVNlZlRROFBZMG11dW1FNWVURGkxdTdNUVVrOVhaM3VtOCtHZWh6?=
 =?utf-8?B?bHdsb2pMb0hnSk1jZ3dDWTUrUGFmc3FJV2UxaWhOdmdXVElpN0l4Y3QwNU1W?=
 =?utf-8?B?aVE1NWhiQWRhUlV6d3VYa1d5WFFwQTZhQkloUEg4SkZ5ZjU1WjlyTm5aLzkw?=
 =?utf-8?B?OFlGRjFHemJiNlh3aGhkMGt5RmIwOXFiK3lBY1VnNFg1NkRXa1N2OVE3UUk5?=
 =?utf-8?B?VlRvMGZmdU5OTFljY3BubEdJMFV6NGdlckNlSzdndWFKUFh1MkxJdUNSVzl2?=
 =?utf-8?B?ZDRENFNZWjVqRTJZTXhjYmZQZXRabE9CelhmbGZBc0JWeEJZVlhveGpMNkZG?=
 =?utf-8?B?M1NJM3g3VHlzVmdkT1pHakJObmYvcm5FM2pXWm5KaVVPaXVzY0RVL0tvWDJn?=
 =?utf-8?B?UXk0c254WGJsa0pxOWFXSUR5eDlvV25yWERSSm1qOFRpK2VTNWZaV2U2anUv?=
 =?utf-8?B?OHlhcXJ2b2d6TFVzWUtOUFU0MzN1N2pVeHpsdG1kR0VDVitvZmhqWTZVcjU5?=
 =?utf-8?B?Y2szMGI3VXh3NGdxbkgyVVEyejR6dktZWnVEbEVsVlMzYUtmMGxmdlhtRi9N?=
 =?utf-8?B?QUNleHJwdHlTOG9lOUlFSDZaWEI3QnBjRjhiSDhmY3cxMWlieUNSaWhWVTAw?=
 =?utf-8?B?WkM2T3NRYWZxWDQyRWowVjJpNHdMcnV0Y21MU1FWaFMvZnZaekZwNUtLeTc5?=
 =?utf-8?B?MVVZeGp0dTRjVFAxQmxQSFQ1VnR0RnJTODEyUHQwL0M3TzhqaEtxa1cyV1FQ?=
 =?utf-8?B?NUhpMEpyU2NhZ2ZkVUh2dHBEWUlmcmhFYkFuQVdab3lSeWNCdHd2ZFl6Qk1X?=
 =?utf-8?B?T2xSMFY4U0dhU09iVjg0QzEyVjJ5RGNrVHE0bnlxTE52VE94KzBIWTkyVTFC?=
 =?utf-8?B?b1VodkhaNExWdWFUYkJ0Z1JEaU02VUFIMWtGdkhrMWFhaldFSUtob2FPSWRp?=
 =?utf-8?B?bVNjSTcxbldqUFJOeTJ0dlQ3THBqVVl1QlZwUElzbnJQMk81S25JcWhuL3F6?=
 =?utf-8?B?RCtCMnpRK09SanMzSEpESUlBY3pyT0Uzc3lMaStuVGpRbHBHM3ZXMzJQZVJP?=
 =?utf-8?B?QlYrWkF6TnczTVZjajdrMXJSekRTUk90dW9BbWdoVWg0UStNcURRTkxQeXFi?=
 =?utf-8?B?eWtxcnkrdjVmT01DWkxoemQ4SWNnb09BaHZ0NVRiN3QzM0dUeXA0NGlsUE1t?=
 =?utf-8?B?aFAzY2tVVVlwVFdDdEFvalhkUkhwS0I5d2MwbitMY3ZIaFJSL2NnODllNlZz?=
 =?utf-8?B?TWw4OXAxVGxwMkpjTGVxck5DQWpWZjE0Z2VQWVZGbUhQZ2FGakRQUjY0YWhE?=
 =?utf-8?B?Um1vZWNPWEYzRThGSCtwL0oyaWNhaVdFSU50ME5HaHgzS2oyNUJWOTh2cHMr?=
 =?utf-8?B?K3NYbnlvbmR2NlJscW0zM0MyRnhIMTY4SksrRUR3WldvWTcrSE45c01TN3Bn?=
 =?utf-8?B?U3huQW5zZ3VYaWpkZ3J4cHd2QTRjL0YzSEQ5a3JiblVsWWljOWJJOGtKSFl6?=
 =?utf-8?B?SDJlazMvWmFBcG0vcmZsSTdqN2xJdnAyek9QZGVUbWdrQ2dhRFA3ZG1TR2xk?=
 =?utf-8?B?czlJQ1dReU5qSU1ROS9nMjZQV0Nkelh0MmxYbmtScHZWR1pXN0d3NFlYbVBs?=
 =?utf-8?B?OWswWW5mR0dUZFdOcVo4d1o0N3VGSFlXcHd1NG5EZXBhMmxRSitpcU1XazZl?=
 =?utf-8?B?c2NVNzlpUHBDVmcxMDdHK210cE8rU041QzRJa3FWSE5FYTFuK1BrVU5TVVZB?=
 =?utf-8?B?Nnc9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b63869-5e4d-456c-821d-08db0051e198
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 10:33:08.6056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvh4FEDNVjkN7rgqh5Uf5ze5QbH2E+pNXlkd0wHd+4qE68+w+vp1MsshoPLBcugcbI0aqn77ieyWUaJ+CEtgQ7Lfl3dUPSnpAS5CigA+nTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3938
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
Cc: marex@denx.de, linux-samsung-soc@vger.kernel.org, matteo.lisi@engicam.com,
 linux-amarula@amarulasolutions.com, sw0312.kim@samsung.com,
 dri-devel@lists.freedesktop.org, frieder.schrempf@kontron.de,
 kyungmin.park@samsung.com, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, robert.foss@linaro.org, m.szyprowski@samsung.com,
 aford173@gmail.com, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan and others

I'm trying to test this series on our imx8mp-based boards, which has the
mipi-dsi connected to a ti,sn65dsi86 bridge (in turn connected to a
full-size DP-connector). But I don't know how to add the proper nodes to
imx8mp.dtsi. My current, obviously incomplete, attempt is

	mipi_dsi: dsi@32e60000 {
		compatible = "fsl,imx8mp-mipi-dsim";
		reg = <0x32e60000 0x400>;
		clocks = <&clk IMX8MP_CLK_MEDIA_APB_ROOT>,
			 <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF>;
		clock-names = "bus_clk", "sclk_mipi";

		/* assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>, */
		/* 		  <&clk IMX8MM_VIDEO_PLL1_OUT>, */
		/* 		  <&clk IMX8MM_CLK_DSI_PHY_REF>; */
		/* assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>, */
		/* 			 <&clk IMX8MM_VIDEO_PLL1_BYPASS>, */
		/* 			 <&clk IMX8MM_VIDEO_PLL1_OUT>; */
		/* assigned-clock-rates = <266000000>, <594000000>, <27000000>; */

		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
		power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_DSI_1>;
		samsung,burst-clock-frequency = <891000000>;
		samsung,esc-clock-frequency = <54000000>;
		samsung,pll-clock-frequency = <27000000>;
		status = "disabled";

		ports {
			#address-cells = <1>;
			#size-cells = <0>;

			port@0 {
				reg = <0>;
				#address-cells = <1>;
				#size-cells = <0>;

				dsi_in_lcdif: endpoint@0 {
					reg = <0>;
					remote-endpoint = <&lcdif_out_dsi>;
				};
			};

			port@1 {
				reg = <1>;
			};
		};
	};

	lcdif1: display-controller@32e80000 {
		compatible = "fsl,imx8mp-lcdif";
		reg = <0x32e80000 0x238>;
		interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
		clocks = <&clk IMX8MP_CLK_MEDIA_DISP1_PIX_ROOT>,
			 <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
			 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
		clock-names = "pix", "axi", "disp_axi";
		assigned-clocks = <&clk IMX8MP_CLK_MEDIA_DISP1_PIX>,
				  <&clk IMX8MP_VIDEO_PLL1>;
		assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>,
					 <&clk IMX8MP_VIDEO_PLL1_REF_SEL>;
		assigned-clock-rates = <0>, <1039500000>;
		power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_LCDIF_1>;
		status = "disabled";

		port {
			lcdif_out_dsi: endpoint {
				remote-endpoint = <&dsi_in_lcdif>;
			};
		};
	};

The lcdif1 node is based on
https://lore.kernel.org/linux-arm-kernel/20221208090842.2869374-1-alexander.stein@ew.tq-group.com/
, which is now in next-20230127 as commit 94e6197dadc9. I know that one
works because one of our boards has an lvds display, but I don't know if
I've done the appropriate changes when copying the lcdif2 node to
lcdif1. And I'm even more at a loss when trying to fill out the mipi_dsi
node; I've tried doing some surgery of the one in imx8mm.dtsi with the
one from the NXP 5.15.32 kernel, but it's obviously not finished, and
I'm out of ideas.

Thanks,
Rasmus
