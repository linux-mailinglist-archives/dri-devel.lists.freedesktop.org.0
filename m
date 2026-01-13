Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA368D1B2C5
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 21:18:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E3910E129;
	Tue, 13 Jan 2026 20:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="nVItKtxl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011059.outbound.protection.outlook.com [52.101.65.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32D310E0E4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 20:18:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrTxUZOLiij4oup96+NqZe/v7hPlYCFYvTmN7GWbSjXDscwxAUGcu/z9mhDq903+rrhrA6WPRdf2B8OskP2ct2G4x6dFxfU8DBQFYeMUZaJI635Rj/AnTQuOkgh7eLvPFD6K6PmIf6xl96ybGnAQKMJGyQgY0IrwloTqPPj0bAA2mDLVRnOM4fuKyEICkUEc0uXiL6NgiuUVTSqXd/XYmWbzsNz6V7HfhIZi20W0d422XcCTKqs0FL19YmNcyIMgR7NjpFRmC1Ps2Os9h34eF0D3asWIO7DgIQ9qLS0asuhSOSOQzqaMwEVf+wt7GbKQfBH1YY/rm72woKt+D7f1kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHI0nEUmzHyeqYHExljQDHqyTj3P6Re7ZSEvgTGK+FA=;
 b=S69wXThkXFq4OXbuRu+qkIJQZll2rQZQoW+eYa/MtWInwDnHb3R+hISwYcOYOiUMzXif8X9DpltiBpiAjS5yWE+qzh5cphmPMJtI6/z0Tvsg4e5Ibzu2/fbj5PRzkV7ZAWrJDRDvMLGZEn6CbY0z0WnOGLtd7DF4k+Vvtc9C7cpEOKisTnR11QZHl/1HFGQ3TBU2GVstbP7JpxQxF/PBUS8dwpWy5cnu6ow02lDF0fZ3i6imBZbpqKl6QPCT8wzxBxOFH0IqXx1ccIe5aUJsH4fNhVzl4ktztEjwCUdVaMl5Hvb1e0aWtpYG4a5RFGxaktDh/H+dRgeYV8MvrPVDyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHI0nEUmzHyeqYHExljQDHqyTj3P6Re7ZSEvgTGK+FA=;
 b=nVItKtxlB+7t3VuRJIrnZ9YEnVSG4XvETyxguoDoSi3E+cHdeVN8Bj0DurT2uWTW8YD4wYdUWL6CNXr4KaOplqNaopB2gVIVL+CHQ6042OlKW+fjmgSftp6Q08JkXASDk4NcK1c3iriKYQy1vEXeqkxdGSA1D1hyGHXdWaRUTG8B+Dm1KCvZgr5sRpRw4juNg6//gY7NqqGvpRtk8oe/LzIY32Xo03Yc00+w7sNo0h5wbWhGkJVTZJuQfYUGdBe4WdJXu3g2cDZkvr1bAlxmtJL+jIfPAG297ncZTOTD0Pjc75QPr2G4ZIUInI6312yHcH2kYPtBoi314UDu6d4vrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GV2PR04MB12319.eurprd04.prod.outlook.com (2603:10a6:150:32a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 20:18:51 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Tue, 13 Jan 2026
 20:18:51 +0000
Date: Tue, 13 Jan 2026 15:18:41 -0500
From: Frank Li <Frank.li@nxp.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Message-ID: <aWaoofPmf/ilpObi@lizhi-Precision-Tower-5810>
References: <20260113-v6-18-topic-imx93-parallel-display-v8-0-4abccdc473a5@pengutronix.de>
 <20260113-v6-18-topic-imx93-parallel-display-v8-1-4abccdc473a5@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-v6-18-topic-imx93-parallel-display-v8-1-4abccdc473a5@pengutronix.de>
X-ClientProxiedBy: PH8P222CA0024.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::14) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GV2PR04MB12319:EE_
X-MS-Office365-Filtering-Correlation-Id: bc22f591-5b3d-4ca4-4fcc-08de52e0f7a1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|1800799024|19092799006|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PuFC/Ja3bdlSeMZt9z9dT4NO9OZ2orcvUv4c1Wk7Wy/QE5RJDzvM+9vxrhSf?=
 =?us-ascii?Q?9MQEuigsaQGrx9HKzVjhJ7Euo3iBZ06INjwEczBe7yL2JFXP9hDSVOR1hoRg?=
 =?us-ascii?Q?jNSROIVaT4E1iOQkbLJduEpaiIXdLM0cxXqjvltvpV5LSCYnQ4PtkskD2aEH?=
 =?us-ascii?Q?ix9xu76it/WREETSP/7qYt89m3poti8QTSSIj4he1OXqX9daoy3Nm+5n0clO?=
 =?us-ascii?Q?o5//b5DXStuenpibeeIE4DcnAYZhQjH7nTeILRqgNoolLi0KukFG6/81YvQE?=
 =?us-ascii?Q?h7E+6agoUQ1JHZIAyMcuLFschbwfu2esxBxqRCXJbr9hjqFGhUqV+ePM7el4?=
 =?us-ascii?Q?0IAspS0ZQXj8npB+HiRJC281sL5MS7HmnsVoZaf6CG5d3Y91l80AhAPBkA2+?=
 =?us-ascii?Q?iD37DqCZMfQ0Zv6I/oim1HE50/lBf40+0he83IHdgImXgufZFRuXssvyn5zo?=
 =?us-ascii?Q?17oVflCKIYbLax696BfL02k7+DIBMRezibcYIJq8houY5yCmL4rsVSIB1oCG?=
 =?us-ascii?Q?r3pUZUERew94+CrirF3zbfXXvV+yV9y8DQWekaeBgYp50idqA56MKSR3c1Oo?=
 =?us-ascii?Q?7YRAXpE0bNzPNhqtInjRjsX/w5C3L+bhTeXbdf3ptolFfAtjmRiQcc0b85Bt?=
 =?us-ascii?Q?WgNm0qpXcxHhResjY+KiBGezTfSWIMA6DUH7oD0YI7iFOHTIeUupdi8ZRm/5?=
 =?us-ascii?Q?wP04puBHNrIYeY3gD0Hwfoym+fK46gTJeWbUp1MHwjNEcAPS5483cGL3N86O?=
 =?us-ascii?Q?0OXaQYkUq4JYIiEvRdHBYex0rl31RgtJg5uKIUIa3FKgmc2BxLjh43EV+E2M?=
 =?us-ascii?Q?vb8XBOGg34FJlkdE3++1NWbiomQI7+IKyDGcI3nkPFjv7ZVIT9M+skBFfIRA?=
 =?us-ascii?Q?c00jTCowHTfNg1Ic55ledDNqvAlsiAffx/fjz1P8aIgIcc3jVObhUBhyejmP?=
 =?us-ascii?Q?Q/Oyct32ZBOTdt2ma/lkxEp7oJnywt5aHA+XYl5UZoQnpUIOsNAybeymWzzg?=
 =?us-ascii?Q?eIwmzG7koIT7KZwfZIAnRjNxdW6/H2NDy8dhegVL7tZrdLWhh0g8mtb+aKc8?=
 =?us-ascii?Q?09EortNweCuiDwXFyL8rMwr5goFxS1Of1LtwQeyO0/0EUGQ3jL5nIrMMDUlB?=
 =?us-ascii?Q?0dhiAN6diGcU4h7igvd+k1G5JqDxcGvf9qOB5HFWi83v3jSLmjh8KpRCl/75?=
 =?us-ascii?Q?f/eSD+S9ApuDoK/PUTWxsHDd7nCRSwwgid8n3ClKrWSnwPOWPiZ6A1puEKRu?=
 =?us-ascii?Q?SAQMBq9gfr/NybkD5ofMP6VojIxbcnk3xhUnX/XxP304OJ8qyIX63ASnHYii?=
 =?us-ascii?Q?qWzgBIUeFvumaTVcziXd8grtCNzPu3+n8Cd5Mvhhkmieh3SvY1FP1NZp4wKT?=
 =?us-ascii?Q?k6ezYoHIAMSg3fztLJKoIUNuPEP1nXIuj9S4OHamU5vsbYJ25WtA0aaYMkMD?=
 =?us-ascii?Q?7a1iv3bcJzsc2YxQopK83sVu8L6wYcUchSXKOfd1IjIebGc+rFV46r+2NdeV?=
 =?us-ascii?Q?S8lf45gV3vuffdPSY+hoOcPK68jvNtoBydDs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8951.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(1800799024)(19092799006)(376014)(366016)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XKVYEN6NZNenOKwMS0fhsO9azcTrX0ntIJP2j4omCaGf3DNIiGqj/4M2oilr?=
 =?us-ascii?Q?a1OBq6dEVpFZD+zSLr0kxZ9kx4oqaxBQoNsYWgw0GipIfnAWqdlAQePVzFkO?=
 =?us-ascii?Q?oy9sA/B4NRyIO5JtGyq44Keq4XHyc1XniRAD71/9qU6lJkgSqP2AlTwNEOtQ?=
 =?us-ascii?Q?8f16Cv6NhXE7KmxxaLXuHLa8oHJiEEIS8gkKFJvQXc/lTjyrXaEqGdDbW6tk?=
 =?us-ascii?Q?m2phUaP7OJmLsw8ax1hURpT71h28cJHK8Abi86c7g5TH4oHylgZeVMgCZdYG?=
 =?us-ascii?Q?CDWvinZoMBTweTvLzuKJ+KjZqWy/KvFJN3HvILh6Mc7s0jBwVeQMdrI8OrWF?=
 =?us-ascii?Q?c4B+E9zaBU6kXRPuNg3r+2w31h7aoH/90Ssvm+ofW1kV67D20kmKfo+v8d4r?=
 =?us-ascii?Q?touusBx6Tm7plZlsMGVrJeF1MVEPW4AmMS3TW9i6XkS7cpAHGalRpAaHXYdz?=
 =?us-ascii?Q?7eUWjIiBLvzrjxcIEr+C/0RokTf8eZ8bSPO1hLkZLHU3izwLnzVSxu9RGM1v?=
 =?us-ascii?Q?ewBvwgLwRcWh+wj0aWgx6A6XrBuLdjsv8AEEllulC6PmklKTVr/4/f7bvBdl?=
 =?us-ascii?Q?j278knv34YPMoz747pLph1TOgmgMA2z4LQ6sutN5tPx6JLzt7l8yy59S7UH9?=
 =?us-ascii?Q?hFjg0Gx2E7j+gAaS75s/SXvumyZ+d1ah/FpjIdgNrQ7nJwO/DKxD5iTd0Y9K?=
 =?us-ascii?Q?TqorJ8NWzIgkg4y55LTXqMqnoNTXrDk4TURJ4+PVhzUl/6tDiL2RU3N0HTvb?=
 =?us-ascii?Q?wDH4K6xRxwFXb7MV5cudeZuU2v8zKUkZXzHTejN73xig0a9Ct+Ym9nmlavKS?=
 =?us-ascii?Q?utrY4mRG1IP1ySCZsHwnt4u95eRdmd0Ed8uJBxX7zy0NBwGv5zIiTLORpSfl?=
 =?us-ascii?Q?EyMIri//zkNlf9rcTMxSrnsnwthhgHNxaObWrmuwA/B6Id9boZ2ndSoqGwdN?=
 =?us-ascii?Q?2IedXiRtbKnTFLXd9O8+IPamHv4ajPpL5xZjeG0ZG6C9e4H798cZ3ZSkhziE?=
 =?us-ascii?Q?Ke2ZYaUUiJhIyXq6l0XprkRnGcEg4z5FIpKsDSqaEhvEl4epKjOhzJLwGwjd?=
 =?us-ascii?Q?vNRXGuXg6i4aWJVerKr3xATaKTOEoXiN/+2yYeA2zW+7cAmglihl2ibjEjy/?=
 =?us-ascii?Q?Yh5YOVXCCqE1ecOnbrpBfCtPUEH6zc1kXHeSelBRz+D676B2HU4kyUriMsSL?=
 =?us-ascii?Q?ZAaVgvwyA/tZedFJad/8vT3nmLT3wvsagOnzQU8CmMdsuGCWtTO13D19aL1C?=
 =?us-ascii?Q?Avj7VKsev6GSNFyWSszwoEGCUEcpfLdsjfc0dIPi6fYKelgEcRUBkKm94qBf?=
 =?us-ascii?Q?ITME1gyHPXUuOGlO8gf+myXQ2OGNuLVkjCliIQ6oyclJ5UYMSqVfTiZKTXps?=
 =?us-ascii?Q?GETXJMCvlXLw2kIsa55NWaIKEMikk+DwznOrkGeE+eJf9QMjGyCJQtn5hYtT?=
 =?us-ascii?Q?QY8Z5ejESPVh/k35KnVo//zcjR484k1+9/1YedlIj0afhFEMxSeR01OTp+RD?=
 =?us-ascii?Q?G6Azrb0JO5V1mKffee3JcFgCt3OER0CpuOWjkBMV2J9VEtEAOkzpCo98Nmky?=
 =?us-ascii?Q?cNfVZRwBs0ZkBxfUVm5Yct+aj7hicNQ0GZf9fvQE4m9Dn7aa9dMkrQfjB4M/?=
 =?us-ascii?Q?yGJh+jggB9GFvAjGoX1hJ7Yek4gMZQ1r18EHFn2yIqhsd8BagRVfUo8csV0z?=
 =?us-ascii?Q?GCkRffGfhbFVcHNosPgLRA2Je9xeyn7eIZhjK2DaIwjmvHX9TXdvM71pAFm3?=
 =?us-ascii?Q?nLS+3hJ+uQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc22f591-5b3d-4ca4-4fcc-08de52e0f7a1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 20:18:51.5420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ynx4oUOlB6Rv5BgB8JSzhCwUyxQrX5+sLRXp/NWBkdd9W3DmdzbrGHlEanTr43YSNxpvxLyEDjwfjbYAIxUizA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12319
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

On Tue, Jan 13, 2026 at 08:07:27PM +0100, Marco Felsch wrote:
> From: Liu Ying <victor.liu@nxp.com>
>
> i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> field. Document the Parallel Display Format Configuration(PDFC) subnode
> and add the subnode to example.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> [m.felsch@pengutronix.de: port to v6.18-rc1]
> [m.felsch@pengutronix.de: add bus-width]
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 79 ++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> index 34aea58094e55365a2f9c86092f637e533f954ff..82d30e4140f4d511bc59665370d561efe7a707bd 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> @@ -40,6 +40,58 @@ properties:
>      minItems: 8
>      maxItems: 10
>
> +  dpi-bridge:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - nxp,imx91-pdfc
> +          - nxp,imx93-pdfc
> +
> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: Input port node to receive pixel data.
> +
> +          port@1:
> +            $ref: /schemas/graph.yaml#/$defs/port-base
> +            unevaluatedProperties: false
> +            description: Output port node to downstream pixel data receivers.
> +
> +            properties:
> +              endpoint:
> +                $ref: /schemas/media/video-interfaces.yaml#
> +                unevaluatedProperties: false
> +
> +                properties:
> +                  bus-width:
> +                    enum: [ 16, 18, 24 ]
> +                    description:
> +                      Specify the physical parallel bus width.
> +
> +                      This property is optional if the display bus-width
> +                      matches the SoC bus-width, e.g. a 18-bit RGB666 (display)
> +                      is connected and all 18-bit data lines are muxed to the
> +                      parallel-output pads.
> +
> +                      This property must be set to 18 to cut only the LSBs
> +                      instead of the MSBs in case a 24-bit RGB888 display is
> +                      connected and only the lower 18-bit data lanes are muxed
> +                      to the parallel-output pads.
> +
> +        required:
> +          - port@0
> +          - port@1
> +
> +    required:
> +      - compatible
> +      - ports
> +
>  allOf:
>    - if:
>        properties:
> @@ -81,6 +133,7 @@ allOf:
>              - const: isi
>              - const: csi
>              - const: dsi
> +

remove this unnecessary changes

Frank
>  required:
>    - compatible
>    - reg
> @@ -112,4 +165,30 @@ examples:
>                 clock-names = "apb", "axi", "nic", "disp", "cam",
>                               "pxp", "lcdif", "isi", "csi", "dsi";
>        #power-domain-cells = <1>;
> +
> +      dpi-bridge {
> +        compatible = "nxp,imx93-pdfc";
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +
> +            pdfc_from_lcdif: endpoint {
> +              remote-endpoint = <&lcdif_to_pdfc>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +
> +            pdfc_to_panel: endpoint {
> +              remote-endpoint = <&panel_from_pdfc>;
> +              bus-width = <18>;
> +            };
> +          };
> +        };
> +      };
>      };
>
> --
> 2.47.3
>
