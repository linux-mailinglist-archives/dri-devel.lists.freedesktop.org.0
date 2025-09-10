Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7B1B51DF8
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 18:40:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B267010E96E;
	Wed, 10 Sep 2025 16:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="gryJDd8l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010054.outbound.protection.outlook.com [52.101.84.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28A210E96E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 16:40:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTwd2ICnCGg3qklVoZGtK9vUIU+8Zsz3xG0BtzDVNAq66mjBPu/ZUunSJx4VMUJKOHnz98IaIHRrT6uNb4fKTfpS2AZZQKDe0t8jPxrYLGq/EeOdEPrtSC6QhzK2XFV9/stxYTkULyH9CTt/Rvmm9/sc+33A/mDnaYOn9DFcF3AUUDr8GnRtn9TbYGmOlrxlTn+xYMHzGSy+/shBku9PDCxtQQCF/zTl5r8Nu2oYJnn5j0WMCwMc/7XqbjeurWFCi5wS+wZFMqJRWT5SGWz1ZVB8Xgex3E/y58GKXq2qsm42DbICNUdaHC8h3h7UDdq+J/PKq3Pp8QFDgNu3T/L53Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIVd79hYgWhrkwEe5aIjpZVVeMf5JdroEOpzMrkjb6c=;
 b=cL3bMq+1fcPH2UFAOaMBA9eZHY5CQOct28PJXJmDWqJl3lmsQysKF+gut8jPaRoMrzhbFl6YFlw+W4tdMnYp71Y0KPye1qVOmHCiueWf1SvM+MGmVNTYIsf69gk+z6oSoBEdae/MW/kbvfIv9CpQCqzR67DS0iHmoibCSA4yuYwutRD+6EFFwIcFdNQ8fVByo6PlTMWvkU+klGeXxyVxpGNKF+DEGGZ5VPPqIakfalM2r1SDMsH5vm7toJmqkTGgvzeZGzO68d2vO82eHKrymIZANz6XSQjCld+5m3qpVnqk48nEAcyh4/6thxEiU3CrqnjkeEVxyepCbnc6FgXU+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIVd79hYgWhrkwEe5aIjpZVVeMf5JdroEOpzMrkjb6c=;
 b=gryJDd8lyYWUhlN+3FB5q2+uiNhfyWFZbfTuwpDErymYBW34mZd8TlBHWbIExbPHr5oFtdSVpFSMph302fkVc7hL5LZe4N9L890apgtSIh1RY3jaqjMVijPAVDvah0/+ZmnOw8jaKyu88xLuxPa40LDBnGCyLcbf+7KSVJ6Ch8LcJ0SFyqQPeTUmDgy6wNSLGnK5P88XnlwlE7WUSyC/OUDyv/VtM5DDeEi+FfPi8JA3FGGhDi8l2/ub+w7MPtLkjMoc2r2kVBYMP2AsUAHmR/PncVAeb14/g9cpa6baOVt8VYn+ILnbCWWmIFYFCHqzrqFx8uvRG05ESACnprUL0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV1PR04MB10990.eurprd04.prod.outlook.com (2603:10a6:150:209::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 16:40:04 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 16:40:04 +0000
Date: Wed, 10 Sep 2025 12:39:56 -0400
From: Frank Li <Frank.li@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, kernel@pengutronix.de,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH RESEND v4 3/3] ARM: dts: imx6sl: Provide a more specific
 lcdif compatible
Message-ID: <aMGp3MwXxUb0FlI8@lizhi-Precision-Tower-5810>
References: <20250910020525.342590-1-festevam@gmail.com>
 <20250910020525.342590-3-festevam@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910020525.342590-3-festevam@gmail.com>
X-ClientProxiedBy: BY3PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:217::23) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV1PR04MB10990:EE_
X-MS-Office365-Filtering-Correlation-Id: af3d76da-7858-46c2-cdad-08ddf088b160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|19092799006|1800799024|7416014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?grTxnSxM3p4ijRB2mS9bzIc9f9mDWvNgKR/KQifUYQW1ryf4GpgJlgsGwL5i?=
 =?us-ascii?Q?pz7Rz4bPyU0EnSC3PYqLxpdPll2xEW64MjZ3A1IahYlPhdCTBA8ageCTyf2c?=
 =?us-ascii?Q?NDFypZn0+OZABvsE+7l71p5WiCGZ4f68N8GaoA+1665E0n3egYXX4lrpMkon?=
 =?us-ascii?Q?PxW1rVY0vTamxZTjgv5xT2WeNpCjXxqaexfeoiYHhsNJ+d731sv8KGE0wsTy?=
 =?us-ascii?Q?3u53WsaDBBqj3uoidx1fdHKZH8htNaInNCXycrp1pvTfFlww4BqOWoX607tG?=
 =?us-ascii?Q?i7b9dOrpVixTXa5xVKgfsVNqcG+s2cR4io/D3j2CvgKzFVDCkvQ1bGRovdW+?=
 =?us-ascii?Q?vJbkXzI4SAliSbokOgAVUEn8w+lZUqAAoN/lU2BYyahQbr0jrdgVT87NbNJU?=
 =?us-ascii?Q?Bh/mtQAtRZQbSAXIsgBN8YZwaYZgBY/F3EBZPbH5U/DL6B/Ks3MUZdiM/QJ2?=
 =?us-ascii?Q?z/5mTVTPUZjneaH5Nq52eRY4xUNtYvDnYl58LQNXUtCIwZygiPKMG1LmTGXN?=
 =?us-ascii?Q?9Wks4dSpVshN8JdXwempI37u937O+t/dnTOIjPB9F8reVSXylTQBwEudheHX?=
 =?us-ascii?Q?IbhE5nYp+Yo6/Kx4hc6w2B1Ev2efamI4HJw/Ek9c6eH89Tnz79Hj4+YBXR9S?=
 =?us-ascii?Q?wpOobH46PV/BDx4X/siLINziWP9YOaseX/K4QDs7EL4Clhsld2rnhFOAw51f?=
 =?us-ascii?Q?7i5zht5I3fjhBAgzUSKTcrf/snpRVclyL0bH2dAjDV42QZwHljnQNGBbEdkS?=
 =?us-ascii?Q?mJ3gUcTEzpT/bCjdiow1TJg4ZpgxP9XAAmrs8BzAwZlfpkZhg3izjFMNJkWg?=
 =?us-ascii?Q?WAGN8vlFJgruSj5H7YCDw9aUxDEjhqls4YDlON12AVOGcuEKKyYePUhn+bPU?=
 =?us-ascii?Q?gwiifEkkMlzyTLMAIAQNvd1XNjoKz415EtxyIcOMe37taHdY1nYD8s1SrJY4?=
 =?us-ascii?Q?g/i2ElAV2vVvPD5A7x0FTwexl+xqtXxwSfJWcImH3zjDzyIxWXaNatl2ndOu?=
 =?us-ascii?Q?vw5c6KHQhT2MeIHvLbmrDs89zIOS6J4Kv7FKDUiFs6HbCIFcQ6wAngQmdLxe?=
 =?us-ascii?Q?wPHHfqfdPcbkRqqfNyrxB4U9Q+fkyrIoE0gJwuiZELF0YocqOuT5csMr7KOi?=
 =?us-ascii?Q?/SMM6K+oMQEddKwFL1KFn4KmS+CkYJZIaShH46RoaS3qBeCW6QstJ0Hw3B7T?=
 =?us-ascii?Q?84bjHb5Tfb3eHaltH4CR8WmR0LmURbN79tZ3oUkDmF4rneJ9eiS279tUtsQ8?=
 =?us-ascii?Q?+lcSgNaUFAW9daOvcIku2RFwesYKxpgWWGihAM8eKRHrFGCX+BUZHswJo1QH?=
 =?us-ascii?Q?C2x0w4TEvIxM9Anjlacxt8KGBYEo/4qZlRrbjFYaj4Vwx8Z5hiyvda26ofFe?=
 =?us-ascii?Q?mghZnN047zhWSwLec2iKzZ4APBYBb/ikm/k7iynHBJ7rDxMsP2iCDZ4sYCrb?=
 =?us-ascii?Q?olJKfdpYDKPmfKeOjVSq5rBQN+5lBkaQSmf99tdgkhiu9OEN80EHesyvDfMU?=
 =?us-ascii?Q?BPTHY7zY4nZkoEI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9626.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(19092799006)(1800799024)(7416014)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bvOQ1CWIom8e+kJRNuHmF/SNb5zOfta/nP+FnHjULASDfQ35oIdXda19khNc?=
 =?us-ascii?Q?niQuFSOXYwUi3MsT+1NzB2jL4XjostbsB6qWAv5cT8aSSb5lzXsYKVhlHEiz?=
 =?us-ascii?Q?z20VcVpqxBAoSYJYilITYquGo1FxxcvGoqn9g2gxxX3IITvwLuA3exi8/DWP?=
 =?us-ascii?Q?Sb7IXrUxipIf2d++Yf3hjCcqqIas/XfZYGl1+Ed4G34TnqTJIXzmgn1fpdT/?=
 =?us-ascii?Q?mISiNHH0Q9vDQdYN42s4fs7CNC+JE1GCqdCTpWbSCr3oXDXxunwruRsT2QiA?=
 =?us-ascii?Q?vENsjxoz5tIOUIy/GC3N8d/tR2aE2EuVrrhuNI2zHLbeMSt7kRYWlmswF3KW?=
 =?us-ascii?Q?l609mDdcvKzXsGSzGZEx83ibF01WMvYW65z43802k6VP9Q7BOiboc6lf02U0?=
 =?us-ascii?Q?ogkU46aJrvVzRXtZSbPWM2Q1MWZR8XxCMBVgHO3tGzuqES39iRZng/H4t5Kw?=
 =?us-ascii?Q?J++Pquz7eCNDUXMXZb0rAfJcHaHyWiw5sRUdmlVN2Plh250TkXfd2ODoO5Pw?=
 =?us-ascii?Q?8sFCgvYdCnu+rVAqT0DkR2g4HXvoaKaoTGOwD6CGcQNTJf1Cuybj/k26sva7?=
 =?us-ascii?Q?4XYLuOLiZgabTeurXlD/ummOkGZHHu0CyAAnOH4rop9lCypzT7MhhuiXp+UZ?=
 =?us-ascii?Q?KmSEpXwcW1FQMu7E0Mc6TWHqsEwKSPg8hhJRmDE3kuVMcnpQoC2unVqJbWOg?=
 =?us-ascii?Q?Bc4n56OReQljssLF7U+MqwukSQlk8zrP1NTllU/t/+55OMvTQz47acff1Brq?=
 =?us-ascii?Q?nWQJpO8nr2xhGdtD+gs8P7Z6VwZig+rP3jCA1zrYelInkH6p3Zm9Yl2zXVOT?=
 =?us-ascii?Q?q7FlX7LidVKsRQTOlC/dWJNsgW3vkreYCqN2H/vP4F+KapzbS0rL3Gnb/CaG?=
 =?us-ascii?Q?6uzgHdIXRrw/5vMrK0hJowdVcN41tbh2zxmZP8cMsBky8fTcFyCqCxWR43SG?=
 =?us-ascii?Q?AdpPlV3pnSnJxx+AuPkWGZWNe7ajOFqO6H1Hcr8H3aYjzmi942bRMvn1JH2E?=
 =?us-ascii?Q?8ODXvIOJaTTV7VpX3A23iK892TsjNE0gA48I5cA2y+D3yTFJtnpZmdSEFkE1?=
 =?us-ascii?Q?y4GTHk9oKQRc8GKAD4qiXpiTCOFDPNn2l2ViXIcXrzdxzBcK1X7Qdt5F++jF?=
 =?us-ascii?Q?Gyg9AZd4QivuAwP9nJg7g9fMSKXlUdjWwLjv+bht0dgB1yfjn8ZoruKekWth?=
 =?us-ascii?Q?xQ5CcZyFKIm534og1Fxbw7kcUJw7Dhb+1EUAu72iNbIv628sDDIcnn5Amrm3?=
 =?us-ascii?Q?jQQwI267ktn8iZws3143w5ZUJj1b5xaGx4Lv3SdFfw8ASB3KbEyFimBHtUdy?=
 =?us-ascii?Q?T6kVKYz70RMa+y3kSMSarddq+AhpDxmbD6lVfGqp/8+u3rvJ8o5cwARowNDh?=
 =?us-ascii?Q?DyRQZhrp2VwUvFK4uFaNZ1IYsMjHtA52rKvvpjRllBB8uTXH5Cixm7aWFidl?=
 =?us-ascii?Q?196mc7+Omt7r0XVj62h5Xs4whKTA7pZDaf5bsDReJPWdoTwY65jOxmtx2Jm4?=
 =?us-ascii?Q?s76NPJbdY5kySGDgtkxWlKgg/7hK1t1qrj1a9eDv5A/yCEawgVouWIpNxHsC?=
 =?us-ascii?Q?60pRB2pc6GMPz9DEq5poqWyfWHHh1yCMBZ0bSRqd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af3d76da-7858-46c2-cdad-08ddf088b160
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 16:40:04.2023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcxqGmCwwcj+V0hqr3QbJjxLUIrCXZQzsejBFG9Sx/G/L7XEEmfYO9dtOm1QtlupyL5JH/dzARqggE7Sz8HLFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10990
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

On Tue, Sep 09, 2025 at 11:05:25PM -0300, Fabio Estevam wrote:
> The LCDIF IP on i.MX6SL and i.MX6SLL is compatible with i.MX6SX.
>
> Provide a more specific "fsl,imx6sx-lcdif" compatible and still keep
> "fsl,imx28-lcdif" for DT compatibility.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm/boot/dts/nxp/imx/imx6sl.dtsi  | 3 ++-
>  arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
> index 7381fb7f8912..074c48b04519 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
> @@ -776,7 +776,8 @@ epdc: epdc@20f4000 {
>  			};
>
>  			lcdif: lcdif@20f8000 {
> -				compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
> +				compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif",
> +					     "fsl,imx28-lcdif";
>  				reg = <0x020f8000 0x4000>;
>  				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks IMX6SL_CLK_LCDIF_PIX>,
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
> index 8c5ca4f9b87f..745f3640e114 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
> @@ -657,7 +657,8 @@ pxp: pxp@20f0000 {
>  			};
>
>  			lcdif: lcd-controller@20f8000 {
> -				compatible = "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";
> +				compatible = "fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif",
> +					     "fsl,imx28-lcdif";
>  				reg = <0x020f8000 0x4000>;
>  				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks IMX6SLL_CLK_LCDIF_PIX>,
> --
> 2.34.1
>
