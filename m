Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB1ABD5CE8
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 20:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AE110E4CD;
	Mon, 13 Oct 2025 18:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="SKV8h0Bd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013018.outbound.protection.outlook.com
 [40.107.162.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBA510E4CD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 18:57:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nnqogtFMtsYjIlCYJDz1K4uuBe+kxoNIM0fPphpa27gGd0tiZDubemzCiswbnNH4SgQjOlguNViMNKvv5/Zq81dS7oH5/XRL0z0P8uGxq3Qe2vHt7jEArowBNxqCw+cExXM2a3ro2L66fqlIfnuXAKdq6XGn54qjqALBGX7IBeOgYgHj7A2nuy0O3Kw0bh8GMJyDsl9ngC/lHvac0yMN/eUk9BWjiTLt6I1gMghRsdP2iS+WJev3R0eltShysmXdeL4jkH4mBtH0FUS/K+PooiyseA2lu0QPPvmliVbhBoGbWE2DNnptFVpSEMzv+B9o/4aXRXkWjtmflz0eNSfK/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuzeDJ5ZEVJwvRAFqw3kCowvvPCKsK5XEBgpiz3Qj70=;
 b=HpAs1KNeyk9+iKclZSGlWXyk4GFbkZZFte+ceSCqWXEnVFsCgw9Xfb6VGNXZxEs2D+h+OyPBAMxhjBDPCRbLw+pX/Kj2ATHHFncFsyZsuWxRCUCbkvdeHe2mEFconcO3VtRkQzSpQFvs8pP4Uwbyo6sDuiO7J8kGwIH4dIYbFMl/5T9S897TXrzp8Vu9OnR1ENau7RB2ZNWlQST5T6qgoTM0c1GDHv5tL8N9zQb289ee6sDYYsu+somQi+jhObqHayuFv8Xmnt0/igFGstHPOIqKBSS4DbGqQpQ+AwFh8bnFIICTQEYj9BfHHfC9LhKQmNRM9tnb2QBCMADSJhEo6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vuzeDJ5ZEVJwvRAFqw3kCowvvPCKsK5XEBgpiz3Qj70=;
 b=SKV8h0BdQ0uTIHgGLSSC3EaieDWN2+EdzatRc6D558wU0xfaycDrFd4RYXj8MRKX4Kim/v+xOWpPkUUH8oP1hZurnXSpmGEp9zxjmKKeBlaihk049J/D3Kqsa0SjRdFNlaTX4CRhQAwZ5QOERPTt2oHf3U6HMaRE9uXhv0xNCRcgaAAxEAtgiIaUXvj4P9MuSLmArttMoDg4Ep7wdNhR5ia5h86bNCWUB0Rr1AFx6yS6LS1XoIAoG+JySvhS7qoP144cI2Kv5wjIVvkFifZd3cwtO74EStjYnx/j78y05KWTQ2dIbF4ucw2X+VkQk3vlmXUhEUiiDHFwn0Ovm9lfOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DB9PR04MB9577.eurprd04.prod.outlook.com (2603:10a6:10:304::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 18:57:29 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 18:57:29 +0000
Date: Mon, 13 Oct 2025 14:57:20 -0400
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
Subject: Re: [PATCH 25/39] dt-bindings: display: bridge: Document NXP i.MX95
 pixel interleaver support
Message-ID: <aO1LkIAfErQhQ58j@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-26-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-26-marek.vasut@mailbox.org>
X-ClientProxiedBy: PH8P221CA0036.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::25) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DB9PR04MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ad29ac3-f2a9-470b-7726-08de0a8a5b8a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|52116014|7416014|376014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JCohEdUWcoVZIHQGnVIupfhbEjvEAtXSyX8v70DOGicJnk3UYXZ057FbbxtH?=
 =?us-ascii?Q?ihWVy16ujmxSZvN+XCOHQOhiQAuh8YD+2vVDFDkzpMTA/Y+xtF+k91JDz9ML?=
 =?us-ascii?Q?YTwyj/8XGe1il4hxxS7z03d0wYvaYmAaZP6e6N8ftoT2zJTrLhWqtL8h6/J1?=
 =?us-ascii?Q?6YzV5ZwNCU/y3FPfFnQDnbD/uM2sNe8xRZfXQ3dDeneLnUpwet2H3k4kDvVJ?=
 =?us-ascii?Q?en1YTZirjwBnk9FZ/VclAScbvmIth7tLXoRRiP50ll0aaxAYRyFaPUWdBYar?=
 =?us-ascii?Q?CWeEUpdwEZf4EW3UwQQ34XvYTFvOnC+iBQiWstmq9NNwz5eNEDXFNPg6+JOx?=
 =?us-ascii?Q?Zky+VJV+lyrHFHnu075XBIr1l76Hwdek3lsyuoYvO8yxYWxMRsQ1XEA4VjDU?=
 =?us-ascii?Q?Ak4Jhl2lf7ATxiXRKCGP2e1i8NTTXD4TysilE4BpjwVsyvG+JcWP3S1QNpf1?=
 =?us-ascii?Q?DNLzXY60WfTVqq4HN4U66U1F19De0LiY1cqZxH2X2APSr+LmHEAXxnZQnjuT?=
 =?us-ascii?Q?N+5zKMbe8HzonXsp8/8VlGKYj26+FZzVPysKzgDq4tHXFmj/dOTULjWRjv5q?=
 =?us-ascii?Q?MQWFm8FStty80Usg1secQWtScgPzdEwiRjN6/9Z6qRQv/f9dV+ArJYrH6tU5?=
 =?us-ascii?Q?UwzhYmLYh/qCaO+IT65wfQYNLTcb3ib49uwQvHTHZXP8h22tM+O4iVt7uUCM?=
 =?us-ascii?Q?GGTaU422nnfYJOjqi5UyqPG9QsYedR1KOGUvz3D7MgL+BWW0KThK04wKIKap?=
 =?us-ascii?Q?+ciAwQP/CLR85P4ZDkbBoXYhMTl3e6hdnKEoRgpCudqbD5m7LmpsHFKhKm3m?=
 =?us-ascii?Q?KtJUFA5zlqAdTn9mP9eCa54FrEW5m5eLtz4A5t5psEATEEWSeYXthCHuMYDZ?=
 =?us-ascii?Q?QS4eu+f5USbd/u/eojpC03iA6kbIRM5abdYr0yXNsW1rfTNrardb7EB9mF91?=
 =?us-ascii?Q?C1IKugLi0IANgzBxYzrk2DW3zlkzutfERQUuhb6S/i+MG6uRfbkbcQdANwC7?=
 =?us-ascii?Q?3vMncavwhfcqmNrhKmlZEY4Tl1ViV0o+OlWUAbQ2TT6T+m2AbMoVo/7PMHRw?=
 =?us-ascii?Q?6aldi6jbApKV5KZDVfxpBQDrcmiRifQ2+Jq4SonD7uGI0SOClo8Okqlx11VW?=
 =?us-ascii?Q?4N+1lE4yvxnxCpMLxFIkN9j/3kbWOy9/wyRRRRyotZlG586DWU3OxXitBALY?=
 =?us-ascii?Q?H5e5ekEheYPCwYNFy9rbnoZbblc191yDogjCl4/iAGKfQbtdXv8thHqfEPr2?=
 =?us-ascii?Q?UKVQ2ewybMb5b9iHswwCp/Cw2achLoY/Gp+Vvy2W32BYNUVvOFlTZ56ONvwI?=
 =?us-ascii?Q?5DexN5649FQv2HYymQSawKpsAlcoAC9a7uuDVmkbXQh4lRkNoZMTS0po7O6t?=
 =?us-ascii?Q?mPcTYBx3VsuABy9XuHduNcD/L9EGyX5a14pBYMq6LHc/drSQxCV6Hdz2Agyv?=
 =?us-ascii?Q?YXxie0NJdxLe0dS/hEIFwKbjU3+QIFBZNbM8aq/ROZfC4UzfyOwuog=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(1800799024)(366016)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m3/9lKK6/HDvisoWSJqV06HfiQfVwR3u83yUHuOjE/qbH5JMFFQ7QJvXEpXA?=
 =?us-ascii?Q?dbFmEsjhuYgMuRt5a/TwfSgLuH/ycSZ2CABVVTYwmEhv6KIs7hSDdzQvaEja?=
 =?us-ascii?Q?tF+aCoDKrHAKryeyOeNpGLwp2xtdU3/HdaY9pYQzQT/FTQJFGKRjndTWqb51?=
 =?us-ascii?Q?RtiZTFOLtYaabak2tHfLz1Q4ayX4kuipxVOGC0QXdeE9t7OPz65dWfx2ztOa?=
 =?us-ascii?Q?I9H+zQ33/ahCMh57IRril8Rb3Nvl/6/UIbbSNZzw8uTiwS+DQo8pdB6/ya6E?=
 =?us-ascii?Q?FiqelYbx+/OpZe6ewIF1hfGLxB/LBFDw5htSeHhi+0Zlg/DgqCPUaafvcu2f?=
 =?us-ascii?Q?ULb3oRUoI0tn+JqY7caK9MbwJH3NcSX72YgY3TsuCjY/rhne+VJdK5zcwB8Z?=
 =?us-ascii?Q?dmrYmBP0KkEbqDvHuXNO91OHjzvRLzIPXXx4mmEjEkxOS5ujdU1CD/qyoEWF?=
 =?us-ascii?Q?G0mH2FEZYZPtZWF82Snw61BgqheT+/aS+z+JRBXjSMouet8oKRSVGBeEi6Nh?=
 =?us-ascii?Q?5kAuL3PutPMaJAQ7KrxpjATySdvRh+gp6oxUiTg6nb+VkmK5SCYzdY71PrPn?=
 =?us-ascii?Q?EtnqDoS+Epj19RwFnWYqGuxwQZZM0/M+V63dHOyWmLBouavCZ99/Aa7/3I9U?=
 =?us-ascii?Q?YuSZXIGZ/jPNz+TcDPlN/V8OynDZ9fZmkMyQU1RjgN7l0bmjeoJWE0wxsN1f?=
 =?us-ascii?Q?N3H15wmDyFWuR71TaAtOwfpY4C5nr9ABekZK4v9gh4/RkqDBF1Gx2f0oh4Rm?=
 =?us-ascii?Q?BPBp2HmXWyDcHUKJRiGj72UV9ThLen8AxetNMAlT8GcJqB1LOrfEuHHl+/c/?=
 =?us-ascii?Q?ecr2l/02vpdGknBsaI3AdMMNuLxaO6RQkw6vhpVOPeP2n3YYxhuUuPdbb0MP?=
 =?us-ascii?Q?9/MMs/d7rMlku6saoNmYD0ZzKGfJqEyWy4TxCyXgvTtBV3M0aSby8YujGxyB?=
 =?us-ascii?Q?uKvVSNV2F5yvvno3rlI8a2ldayWV1/E209BqMD3zYViF/rmxomndgdC2mVbi?=
 =?us-ascii?Q?G6f7wIK6vcWp7j0kTT1WuBAFpsq8Sg2WCXzhZXBaA9s5R9mlPFi/WOBhLTs8?=
 =?us-ascii?Q?1nOtmZ695MZiTNLhK+9vCo9AxCmn5oXw6NpNnOYSzc2ovQ/GrQObSN+n5fZN?=
 =?us-ascii?Q?5kQOusnuU6mlIauFDWZb6SkUknr+CCgOCu39CTGwhosDAErRheybccHft9AQ?=
 =?us-ascii?Q?JRdnN3WXapiECNHPeS4u59HQgguG2vWshUg3e6Mb4mXdOTPO3ZW+32y57i6f?=
 =?us-ascii?Q?eaiufRfYRrdwNrQ9X6SmzVX0NuXFsAWbzVjPYFB/gpzwudq19EPkpU7cadqH?=
 =?us-ascii?Q?r6W859AqNJNOrQ3IR/ngVZOhN6pa3oClUZaje2csmEr7v4BJPCrwZEgn9Fgl?=
 =?us-ascii?Q?+KPkZTDLsvqsaWUeM+JRFCNrj1GPh9KfF97+b/aHqAxU/mMOflnDQ5v3qH6U?=
 =?us-ascii?Q?5NJHxb2LYtjGHdhxvG2Yd0wXPws5qqUhzaEKjcIUXMrbIwhZ6q4KeNX3kJav?=
 =?us-ascii?Q?DRXTt73aCD/8ESF95ncP1n2f7o2A0v3oNxbDWLhEc7tRVbF+oDnmKsmAsvMB?=
 =?us-ascii?Q?jGZGl4dS6WzFcMptMvEgAeC39vdwK55T0UCnhOqt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad29ac3-f2a9-470b-7726-08de0a8a5b8a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 18:57:29.3325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZVOU5p1hnvLHRG4c5FZHQu9vMY70rZKkb96hqhgyDrtK6DzlXUlMpd3y/2yEElHfnYz2QHFCOIRbpLcq7weoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9577
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

On Sat, Oct 11, 2025 at 06:51:40PM +0200, Marek Vasut wrote:
> Document NXP i.MX95 pixel interleaver bridge support.
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
>  .../bridge/fsl,imx95-pixel-interleaver.yaml   | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx95-pixel-interleaver.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx95-pixel-interleaver.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx95-pixel-interleaver.yaml
> new file mode 100644
> index 0000000000000..6a0647f060a02
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx95-pixel-interleaver.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/fsl,imx95-pixel-interleaver.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX95 Display Pixel Interleaver
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +  - Marek Vasut <marek.vasut@mailbox.org>
> +
> +description: |

Needn't |

> +  The Freescale i.MX95 Display Pixel Interleaver receives and processes
> +  2 input display streams from the display controller and routes those
> +  to 3 pixel link output ports. The interleaver is capable of YUV444 to
> +  YUV422 conversion and pixel interleaving.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx95-pixel-interleaver
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  fsl,syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      A phandle which points to Control and Status Registers (CSR) module.

Need justify why not standard interface such as clock, phy, reset ...

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port

video-interfaces.yaml?

> +        description: The pixel link input port node from upstream video source.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: The pixel link output port node to downstream bridge.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - fsl,syscon
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    bridge@4b0d0000 {
> +        compatible = "fsl,imx95-pixel-interleaver";
> +        reg = <0x4b0d0000 0x50>;
> +        clocks = <&scmi_clk 0>;
> +        fsl,syscon = <&dispmix_csr>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                pixel_interleaver_disp0_to_dpu_disp0: endpoint {

example needn't label pixel_interleaver_disp0_to_dpu_disp0

Frank
> +                    remote-endpoint = <&dpu_disp0_to_pixel_interleaver_disp0>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                pixel_interleaver_disp0_to_display_pixel_link0: endpoint {
> +                    remote-endpoint = <&display_pixel_link0_to_pixel_interleaver_disp0>;
> +                };
> +            };
> +        };
> +    };
> --
> 2.51.0
>
