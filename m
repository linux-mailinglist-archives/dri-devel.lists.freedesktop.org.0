Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BDEBD5F00
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 21:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9368E10E51A;
	Mon, 13 Oct 2025 19:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="kqVCJ1p1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013005.outbound.protection.outlook.com
 [40.107.162.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4B410E51A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 19:26:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JpE2U2tCYhsqOgrj0u0xYpZvt+FmSH6vUjPBwBYSDevnsbKW8WTugYhrtz3NJATO3xPwehbxQnvS+VKMsWKC5dnZ4zH6ObsUHQCX0rwdxBh86cvnU2mRPH4YGLtjQGmo/wHq0iZ1sqGx8npI8PxcY/xB4i+kMAr1plG2147xnRELPAU2FYBdRcWeBXRFSAHUaquheNen47Gf3l5/Q2nWmiG+ilP/HV6EpwJn/ciqbNIZfR19ZG1uKw5mLyiLhYzo3gGrhdHTCm6cI3vrCmJvu1d7sjQmkzfMdZUAPXGGhnSmPu3nUfFaPATpGKm1avVaguWSMKb+hMPq5SiNHqJwJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LFodzlqaxQYrzzmFEYQC9+qsp0lM9OUES6QL/16Ilk=;
 b=ZbwFBveExF4DkFwtfDc/Dy3zVh6td0N76bOmUQmMo97d125yjQBB+8S2lGI19CwfX+43s7hh9GoaJNKcDQbVPRpJRqStiPtJuz0TQN+Dv4/1K15dziPO1/0VwX9rTHyTg7+9/qjWSBWpddVmJLK/nDdhld7EKCuWhsRPmd+7mYdjj4CmOS+VZLLBk1cau9wMxp68qcNgtu8uwH3T/UjgkSshf8MMMJ2dnUl5XThnDZy1+X2rtzSKJWX0F7AeebzYoQFYPabB9QdnNY0j5RM2rw2D9W1SLNWTGX8WdW7mGlzbzuGHrrpC4MWFIV3Qh3iZvRtKkM81BfkYTMf9RvWDow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LFodzlqaxQYrzzmFEYQC9+qsp0lM9OUES6QL/16Ilk=;
 b=kqVCJ1p1tQzFs71xBA18BfwUke/cRDBWEuHsCniz5Hm+tJoz2BxRb5a8XeBJ6R8EYAFUNteqdtCxVvXuE30fC02MvVmylicnflpmCjfgwL9TwAjM9BVYxHfORCnNWOi/zUy1oLwidufhG2g+20TPKKdz1OHBMe/Q/gS0cpQ4T43tZj8eaRTV3wVOpc/Nqk/mJzimKWa3qj4RhUwnxbsMxYTpWn5lX88bKSwfEj+GEmf5GqyRY1LMGlR9HQbnkT/C9ddVhA2CYUR4nEyLP0EEjIzU5fFOBkSbKUlH/a9RjPF7HlPBKs1FLD5y0fp0/PmNCzv5z/hHA8Ti9nhYtPeqdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AM9PR04MB7601.eurprd04.prod.outlook.com (2603:10a6:20b:285::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 19:26:42 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 19:26:41 +0000
Date: Mon, 13 Oct 2025 15:26:32 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 38/39] dt-bindings: clock: support i.MX95 Display Stream
 CSR module
Message-ID: <aO1SaKbfPnMEl8SI@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-39-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-39-marek.vasut@mailbox.org>
X-ClientProxiedBy: BYAPR06CA0055.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::32) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AM9PR04MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c0b51fe-752f-4285-7395-08de0a8e7031
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|7416014|52116014|376014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ByCjPMPPfRQ/JHVhg6JhnjC4TZ9VqShMgnTrNyEgYo59a2jgUdtRz8Htxt1N?=
 =?us-ascii?Q?moMoJ0i9pA/Fy8Rp3gx4m/Mq+SA/ertDG9T1p4Qlcu0xEmjLxVQvV38WmAvD?=
 =?us-ascii?Q?0jdOl8BNSOkoMB8P0nSk70/Kxa8UA1StArsnvDzfWvN+QIj78/dOvTc9WRJl?=
 =?us-ascii?Q?A5iNfLtgv9vLM/5FrkiPaVhNha9jIGiXfjWCeFWSI9/QuTu9eR58arMi8Yst?=
 =?us-ascii?Q?TLGRvmhSlhnfjnzaxDnWzGrwwQPon9kLQf++AhY/DAYEyZqfd92myUnTj06u?=
 =?us-ascii?Q?uUsCJBppn9u7nZslvpUV+RSFU3J9aLXILr6MzUfNlixzPp2QNjhz2JAGSA9b?=
 =?us-ascii?Q?TBdERkxi81NbA7oEzZ82cUf1Nk+mgr5WYB+qysqNM0B1QNEtxSrJqb4Rc99N?=
 =?us-ascii?Q?tZ17ijAXfu16UBW9lmPeEen/RyzE6QvNwURGvz3dXwdmuTzZuA5cnDA56HlX?=
 =?us-ascii?Q?BNFl3LUueufalD4woxpmG0jJRhhOYVCNQ4CxNkCNbPsoib380OOV+oOJ4e1g?=
 =?us-ascii?Q?GWb9TI99lfvF4FFDlOnR1V8Vx8VO/bIEhdCkPluNZ5SoHvmXrLAweCyWR3M3?=
 =?us-ascii?Q?T6/bAiDHpp8OE/stjbg9iWRVJRsJyrvdKL3NJmKs984AFOfzblu3mW71KMrA?=
 =?us-ascii?Q?xzwkK4/4cnVGHbF5f9oJoDu15lQsb6cF5ASPhQXKr9gsZKpXIfm7mBgYb+56?=
 =?us-ascii?Q?pmbyzTlQbT92JD6PvsV0vtt2E1KM84a7ohW+ZIqMOs8pNSmlmiRi88I+TUzu?=
 =?us-ascii?Q?V2gd1B1Un8pxkqEUmRNmL00eqEbwP9ORph2+xiKxhbycREQjY7QlJd0W99dS?=
 =?us-ascii?Q?VYQ6pFbDj9aD56soQF/HrLK8iOUVduAV4c2sf5JcFMMQugqmdN50g01WIk4y?=
 =?us-ascii?Q?c+7cvNmpaZ62bRAbvlkjAKHF84Z6NyiywK8bX1BrssJRskAYRp371xcBFJdp?=
 =?us-ascii?Q?J1tTPJzcoC6O+huXEYMi8wuH3SI/OeM50W0Sm0BtvrlDftOpwG/+6UlKmPzW?=
 =?us-ascii?Q?5WUuABmAgy4aH/rJOhzmf9sow+Tdv3mHb3TfJ45SGsq7NYLC6stsxbhIRB6b?=
 =?us-ascii?Q?ftmNo7qD7+XVymwq8bEr86Ds95oxpuvsErEjcLYL1l6uQeOXz5mdXOVOU5pN?=
 =?us-ascii?Q?WojKbUTD43leVoSuaKWCT0ZFZwbPtZ0IvoF9pbwf9CAqtgRZyA1dn8kcsAcb?=
 =?us-ascii?Q?4X1VDRRBvrrzHgWQiz13bN5CBZMhjgN/ASQrAYkdbuiCV/GR/XZTlFLdMnFA?=
 =?us-ascii?Q?7+dH74LruumlJAmHxVJd8hXZRe9wgDcGtARfLN/CHtyQWITtpajpK66U7JvR?=
 =?us-ascii?Q?KYdBTXIytBlQPFqmOv42/3OhQU/gUxLZDba5ro1dKK1t25Hr6L6DErMc3fBU?=
 =?us-ascii?Q?9bxnyTz4lRaG8Or99qk1clT5uIR5stRgB0HwJGJ5VbJlFaFamoVUTBYKMtpQ?=
 =?us-ascii?Q?ZHLe13J++4YxjrS7OYn0uxdeSanBNTo3EPd7thWKj0M6FlMcy45OIQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qIZDjK838HQptd29N+p5Y1OQToLVeU38OfVHrieyDcVXaQzBnWIK5j79nOeO?=
 =?us-ascii?Q?6VvaaAfuSzsjtUXw1mnBX5By8kS+tXBIRogZUUlXMqw5OFIlyVKxYw5Qw0/x?=
 =?us-ascii?Q?3jX2RvkFxbbepIDmASixJXiLJAU9+MZfNdGyIzQlAVOL/apZWsg7EdQBAxYn?=
 =?us-ascii?Q?Wt84IN9hTAavM5xZ4LuF7VyW6ApFVbYaFsgQ62EMeUS2xTKdS874RSTh8R48?=
 =?us-ascii?Q?1CbkJ19R5GY0Q8yeGPScV02Q2wp8VwI9aXpbH/bAOQPg3gDRYUayXMstJLQJ?=
 =?us-ascii?Q?fJMYqlrRH39toI3srMJbFNCO1ZE5n8Ga/yRxDtMNlgQk0oQeOKnGUtcPGnB4?=
 =?us-ascii?Q?x0VrHSnahiaqgb8thD9ZhOsvaMamrFgTqcL+5AaHnGrm16xxOm8uLuOdVi17?=
 =?us-ascii?Q?v5PQrqOuz6/5Wdh+xUYpV1X0zcrGsn2gR0L9tz7dbilhiuOeDkPFgsZRBDxf?=
 =?us-ascii?Q?EiwVXiRDlAF4YU1cAD7ou8PCsHMkztoATPr8JUTuwA0wXtQOsnyha51cpLr+?=
 =?us-ascii?Q?rLVBJzQnx5y3kG6zFmHAFyYQwy+H3UArf3xFXP2NHOPUb/Y62W7esD4AH+4y?=
 =?us-ascii?Q?9o1A6diVs5DJrJ8Z82jdwH8CbFkYQU6r6X/Pu4qdL7PJENWfOn8Qa8WGUC1M?=
 =?us-ascii?Q?XGNRFv9RTn7yjknG0uPqQ/7PEe//yBINwavJNK4pmyI1s0s4nViH7B2ZCOH0?=
 =?us-ascii?Q?Po+BY3NJoOZTsviOr6krXq7xLX/cRMW2+c2nFk8aEFaevbwgFwTJ/r3Za01O?=
 =?us-ascii?Q?LduEbsuhJuipm2rsMf+3h5IEVJk3F4dHZy23PbUZr/bAQYemBHbDU9rh61Ov?=
 =?us-ascii?Q?a2djz+M8LpBYq/ZwtuqOsPlohsm2kii0lcA9dyS3kB1pnOM141C/yoTBfi4D?=
 =?us-ascii?Q?g/1CK7NglwQchSjZFfC1cbwkKpknWZkesMv6QsLYZKbRNAdHh8jFIeYQqur5?=
 =?us-ascii?Q?FnBTw7Z3LGGAFW6+v2bjuX5E0tlG8XCfI3XxeLQ/bY+doLCe1SpFfttCIsJR?=
 =?us-ascii?Q?eJMjViF6czjTh68dwd/yTZ6aNjmtrE8dbZpiOQZYGKZtgVs1yJzD4GgDZedY?=
 =?us-ascii?Q?UVfEMO2MugVNOVVpDiEyG4T0X/Ov7kviH3ekChhzn68n8yvt/2DykGa7IWM4?=
 =?us-ascii?Q?LpALRxPeCG1Iab6tr2fE3xSNGSvL6uQsOS158HtAhEFBwXtRbONhEfuxDt4w?=
 =?us-ascii?Q?HLmRpAmJtpUhoRbdUZC96VQilgyC4OgotL67qRj4M6Nj3ru9rJfGXIian6Pt?=
 =?us-ascii?Q?gBIWVaT8EatG0+X9eyJ77b1f4uDbbCELS52oEC4+Cx5DViZaPJGCQlDtiAl8?=
 =?us-ascii?Q?Ixk/03N1VPWCUJSoX8zz4OnifOgrC1O8OOc4eOdAWGvKjCHIXZBfoz1vQcaA?=
 =?us-ascii?Q?k8NIr3+nYcYaIayxvSCq1q7ptmTw7TywHg1bx/0ug2rmyWUpLOBA3AN5RB2T?=
 =?us-ascii?Q?4wIdESjOlIunP0ZUV1qUhwDtS7hIexWCOquhFWeD8lykkJHt0w+/QqIUTGGS?=
 =?us-ascii?Q?qkIEyieOzEG34Mk3vf0o/PWDrcDAdzn0J7ecKmRXtD9AY7xVqVXMtLjxwWSj?=
 =?us-ascii?Q?U0cVn/RAv6JVUvswkp0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c0b51fe-752f-4285-7395-08de0a8e7031
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 19:26:41.9194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJeoCZLHPus91udw1cZ5Rl9BfvuSC2hAe4/wxGvR612S1vAuaXbmAuKibbRC8qM49JtRBxBOgMSnDs5XjqGOXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7601
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

On Sat, Oct 11, 2025 at 06:51:53PM +0200, Marek Vasut wrote:
> i.MX95 DISPLAY STREAM_CSR includes registers to control DSI PHY settings.
> Add dt-schema for it.
>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  .../imx/nxp,imx95-display-stream-csr.yaml     | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx95-display-stream-csr.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx95-display-stream-csr.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx95-display-stream-csr.yaml
> new file mode 100644
> index 0000000000000..61153120c9378
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/nxp,imx95-display-stream-csr.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/nxp,imx95-display-stream-csr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX95 Display Stream Block Control
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut@mailbox.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - nxp,imx95-display-stream-csr
> +          - nxp,imx95-master-stream-csr
> +          - nxp,imx95-mipi-tx-phy-csr
> +      - const: syscon

why need syscon here? why not use standard phy interface.

Frank
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@4ad00000 {
> +      compatible = "nxp,imx95-display-stream-csr", "syscon";
> +      reg = <0x4ad00000 0x10000>;
> +      clocks = <&scmi_clk 62>;
> +    };
> +...
> --
> 2.51.0
>
