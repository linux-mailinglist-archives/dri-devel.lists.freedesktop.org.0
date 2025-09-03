Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1494B42506
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 17:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DA810E8B5;
	Wed,  3 Sep 2025 15:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="LhhDO71P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012032.outbound.protection.outlook.com [52.101.66.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1121410E8BB
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 15:23:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQQFdkb+BEgIbdCwNlurjzz/gAjIkDkO+iET48BP/Twb5rlSS2dzBuoziGqCJ434lMJgcZAl7UVpgY/sZ7jsKnWBG0Ynx8bkwXPobIUAeXJ8IYIBK2NQHNpyRYQzOSwb8jQbEkNyIVlakGkG8wRloBdHmxfQtUB7zs65QjWa//qRaXg/HjSzKtMCpP2lXYPZSNIQa6ATtiYvBGmH/q6JwrMdkQCyhTFS8gDjNV22IUsfHdmydhgTQuUouRKZ0uAvJP/REQYg6qZIOnvwjNBnc8/K5dgEP3rYrv4pZipTbW5dB62WTet/9WOJm/c1tbVkLZ/PaBkwhmEGRJmxzBU+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TPMGo4XXWaxn+H2LDyj0gbmOzidg2J/2QgpSt7PXWU=;
 b=C1Rea3Z1nSt26edLwxw6AZOmaR7570IkcaaQOUEf2jhdWUvQFxc+FpG52lwF2TkciTyJFnhWOQ4xFWfMV2vl7Db6sZux+Ne/UCoe5YuF0FE/7uOLmKt4kYbikgpGHq5ldif67KY4WeblWg+2N6KWAb1/zLJwX5rXs5fEQ83X5nBA8dctXyHwUm3oVYK/UB87wrMPL2DjvqSvxj6XAGEmTrqCwGvkxZJZP+p1pQAsmw6F9knMAGqwc5smK62W+MX5CXuEm40xqKSdyxPlVSURCl9PmjfsE0T7mNNwDSiQbbu4Pl0TUKoQSJCNurw9XeR65W6xT3msU0Ohdb8ngtSAJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TPMGo4XXWaxn+H2LDyj0gbmOzidg2J/2QgpSt7PXWU=;
 b=LhhDO71PoYMMd8h9mPdEg9HX3qcFfDEHFxWc6EPh7HxQkUB5TErDIToHvxf+9AYnRdin3lU2gNMyk4ZeiJPnnVsOZ8c3g4N9GD8Erdmqc5D2CTKvG60evHwDh50LD1Iar5g62eiSlLFk7ePqRPsfkzH2isN5vDxTPrIC/CYEVLJ7O1dpHVyiGYbsG1EDMU7o46XYIJa0PCFl6dQ4rU0xFwEa2iQhq5yPruCnlVceylLFjGngxlYe8xNm7kbHrRKPJy3jNvkeuQzT4EBiYNsuRzvxnDfMWTuuOiWamDt3mYom8i1Gjhk2NVsMgdewRPUdm3iMy+FRl4cZISKhXSJWBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AM9PR04MB8874.eurprd04.prod.outlook.com (2603:10a6:20b:409::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Wed, 3 Sep
 2025 15:23:14 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%7]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 15:23:14 +0000
Date: Wed, 3 Sep 2025 11:23:05 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/9] dt-bindings: display: imx: Add bindings for
 i.MX94 DCIF
Message-ID: <aLhdWWKwrwI77v3D@lizhi-Precision-Tower-5810>
References: <20250903123332.2569241-1-laurentiu.palcu@oss.nxp.com>
 <20250903123332.2569241-5-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903123332.2569241-5-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: PH8PR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::28) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AM9PR04MB8874:EE_
X-MS-Office365-Filtering-Correlation-Id: 09669b00-f284-41cc-75aa-08ddeafdcccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|52116014|376014|7416014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yE52btZNerESIaqArAxURc0IdSetpLOQZUSRFNuY53KYkWXmEUmCGAIXXZXy?=
 =?us-ascii?Q?X5Nm5q6Iqom9fZDUofXH0Vlq6xnZ+J2J3HalGbPrb7ZlW7joaSOjXAoxiG4w?=
 =?us-ascii?Q?XkOPAvB1y6ZAXn6UjblyXTP1JxOmXDBwx1iRN9dEO4417NE+tdh0sKV9+Vms?=
 =?us-ascii?Q?mo7r0fyNKgYWRvva/bCwGRH6NY1SO10YhhsPohpvElpK6kUbSA2OjWm0nTzb?=
 =?us-ascii?Q?HjczIjt5tCjgbV68vEAW49AcuOeMGaihNkrRgscYjfYW1Hd6qVpqlh4MYUs2?=
 =?us-ascii?Q?l2qOGBYIKGduK+XMWclNKXIGDhy68ZxjEYYa4gMdbZVtCCJHWl8xId2WTAow?=
 =?us-ascii?Q?TVxbGqg4HMCuc6T0LXrlNKk+PpPgBxLyybNc1X+AadfFdqsfihy50T0AnV41?=
 =?us-ascii?Q?tsiDeAXsp0RRLJss5SnH0Ri7Cn5uevoAHCTsfW5v5riOXr//hMVBu+4ZgSDj?=
 =?us-ascii?Q?DPeBsp8sNZwauhgjR43In8P4YrIBdk312cgS0BT7lx2pvfBVI81Qs7h/WCOu?=
 =?us-ascii?Q?dmxqsIOuGea9KcubUOxYmsyFO5uizCklxwzJrj0sEE8MRC1r8pi+kIYeVhhc?=
 =?us-ascii?Q?BLj8I5a3MyDKBx3vq3JzsrqAiH9IuBQVYk2nNHRcA3tzWD+T/npvhQtV/9uN?=
 =?us-ascii?Q?CWkQQFklKeZaTANCQ7fmnOC15Fysam9IEOV/Bqe5ULb6NbQVdyjm1Gxg1Zmz?=
 =?us-ascii?Q?NkwS+RSPPrwXSlQPDW7MpyfpG9CKdvaQ1tC90CqCi1VX2/FvfgEvJusgvQZV?=
 =?us-ascii?Q?bXtnLndMKcxJx/1KhAls28Tf/MLPlYJumGcUXRvPHxvsXEkxUHUEgfsrYGFU?=
 =?us-ascii?Q?eVF6ds+K+kTmuEg79RBnbX/4yyBKNYRuFslLXbfV3Y8bpqzQn2uWLtBeLHzP?=
 =?us-ascii?Q?/kTWBAYTqyQc93E3NGP4pM5+a8Bt0Wy8k3mzHMvvKOfD1nHjuE95Bwz++dD4?=
 =?us-ascii?Q?Q8jXHBEtY7F3WjISogXGF3LhUOjeh1dbAZJmBgAMjRnRYJfX0aPvNzppuqLg?=
 =?us-ascii?Q?0HyW/BrN11SXUxJcEeHV/HoqT0EPQ1/1JPZhKDwxweU1AQXkHQpAYUfA7cIn?=
 =?us-ascii?Q?niBSIvB2Sb8PpoFDoGf7b1kSiUuKVOopQwZu8g5kfaXtDBDgUPKnXBKMoMyz?=
 =?us-ascii?Q?K0z3hZGt3RNCjTOqKQQ7z9MSEQr0VODczdk/xffvZqPWJTH8DOy8K3IhTLzl?=
 =?us-ascii?Q?URPWykhp9cslIvjTBOwme7bp6ygtLMc4+s6ATMSV1FIyflPh41MW5fSNfn5Q?=
 =?us-ascii?Q?G8bsZXFyE1h/i098euUV69CRcv641zMGxNsE3mWJRsJUV7iddS9VuSRa81CH?=
 =?us-ascii?Q?RvkLou/319N6FF22jD7NpfNWkmqw4ORDs5MUB0aEYwwgKRmiTR4oO5/LdK6L?=
 =?us-ascii?Q?ehyJJbSnbRqIf+Yd+8CORA8R2sbn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(52116014)(376014)(7416014)(10070799003)(1800799024);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M5vn1E08rx1Ee1ZbRydmfjDcYk+1ODxDySeK9DI2gyuTPUF9gf1KyjUClDq/?=
 =?us-ascii?Q?ZWvWnWATJTmVKtTmPOPOGsIhe1MUWUwsztrwTmV3ePHidCV9alrfL9RcJwsf?=
 =?us-ascii?Q?LhNzEZN5rI5OUIFv0T5murP96QEAAqLXEU3LCueFBzhUchdqZGbpgXMzBibe?=
 =?us-ascii?Q?sredKZmeGTwAizNxjOJ5VzORxtOX4qHCQGuHgtsX+/VKUe85dNuS1eNWxkGJ?=
 =?us-ascii?Q?owCgyEV+P4HGmwnBRGKHQAREPo7qPAdssRy9eK11rLh7djl6VJAObkl1rgST?=
 =?us-ascii?Q?c4JGlgNx+e+LoIcrvVOxK2Pq/DpsEvJH2PCAQrBuKff9E1Fs9XQYkwU0Az7E?=
 =?us-ascii?Q?ttOOfJfJQZpFjZE5MsQz3IcQp/hrmrs41NGBkOWZbLCCRAckHzUkqBagHDit?=
 =?us-ascii?Q?0Hr2IMkH3V1koeX9PoloxY4iD0ZLonDGiOYpCl+eo5p4uU2v6GT09E2zVvwj?=
 =?us-ascii?Q?8USnrT7tdUCC7HoPb6Y0D4XlyqMUoNirF0u3uGGxigZULLTm/b31vYof8DkD?=
 =?us-ascii?Q?mJb4BJophWuYtkEC7w5KIbF5I4p0+5cOEmFK6aoUtHBYtikfGJYIAyNRREqe?=
 =?us-ascii?Q?hEQshR28wwyiZTXAlkUqzdVzv4pZIyTYDvtTqLOBNgnCwPqKpTgqGpBD5++O?=
 =?us-ascii?Q?mjAkRK4CITCUcCzKt4ik9qAi811qyPYFXXFlqMMKyriptRXvjoSUC7qIWS1g?=
 =?us-ascii?Q?5Bg8hJPfG02zeNU/3x/JShxu/W4cL8tXURLrqxNmwVf6OWE4GZfOtZWdMApF?=
 =?us-ascii?Q?98hvQfYSIxLotNCx62ccZexO8JMsqH5e5mzE0JBR+9i9GoB9ezC0+U5Kjz5Z?=
 =?us-ascii?Q?h6szg9i0gGC+S1jDvxRq9d4nFYSVZVtBQBYC8m123QUJyWHkgA64LlB9Vulg?=
 =?us-ascii?Q?A462D+mhUlg2vCJmcbpv+MeBAbdOu2L8cYIhzrLjcfUgaNy6F6F5TTfb02RP?=
 =?us-ascii?Q?CWpYqJBAHcZcMqbqRI1BWvj/tgniKKljq69F7VW03DnEslBLit97Sl7nuxWS?=
 =?us-ascii?Q?zptQdmo1yhaSqxvqLanmpv7yBRwBCUJjOMocmBGEOfZmUW3lwNZYjB1K15yQ?=
 =?us-ascii?Q?TpdfLFlY6e6atfGs7aYH6TD3Af2/alc3kmfbKPETBnB/U3oeS3Z4YNC/X8Du?=
 =?us-ascii?Q?HilPolzGXnnt5/ioaC/FxHRtRKZoMuYkcYVRV1BDLhXklJWfIPddwpFBoumG?=
 =?us-ascii?Q?/puDdKPHBK5tW58cQ9cRuFHWRmqe3z5hJVUgguzdOaKwdTFzJ+PDA93X+ik9?=
 =?us-ascii?Q?sffCkPRYbU+gVf9M3cJ7qidcRIJZnxcGL5BAJD3Ob/ewjL0fPfgfaU0OmG9I?=
 =?us-ascii?Q?3X8BPZUJMCpogCxhAVZcY1csZSqqI1Qd2774Wh4VCqz1gHSq93E0gQjcsbbK?=
 =?us-ascii?Q?s26wqXxfRZNQo6oizjwUErZ6GDiHfp21QKNoSSFPRZOCxsQ7RDEGJyPGHgMH?=
 =?us-ascii?Q?j7NUZ7yNcymnC1GYwi96A0MU4DUSJ3r21BB/ylumANsmAZfJ97rB/A0M8Jzq?=
 =?us-ascii?Q?tyhbZkCFyJBMrUKOIQSVTP0xPVuTk64AK35MWIt9oRt3qlesWRraWUc6EFni?=
 =?us-ascii?Q?Pd9IYCgAZHabHLjkQSdp1xyXRKWc0bnOdObmkQiEE5zj0SXQrFfk5Vmud1GO?=
 =?us-ascii?Q?3ZLni5OfDAuUOk6AkBKmyMSVw0lm7EmHubrdRWWl2o0u?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09669b00-f284-41cc-75aa-08ddeafdcccf
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 15:23:14.2193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJTQfKfSyXytzYJCKqIE4r/H7fDXq3jVZo+afkiMViU6tEr1vdxHXONVEJOwooYYwOyEqkl1Ljz8MhknMY7HRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8874
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

On Wed, Sep 03, 2025 at 03:33:22PM +0300, Laurentiu Palcu wrote:
> DCIF is the i.MX94 Display Controller Interface which is used to
> drive a TFT LCD panel or connects to a display interface depending
> on the chip configuration.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  .../bindings/display/imx/nxp,imx94-dcif.yaml  | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
> new file mode 100644
> index 0000000000000..54419c589ef74
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2025 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/nxp,imx94-dcif.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX94 Display Control Interface (DCIF)
> +
> +maintainers:
> +  - Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> +
> +description:
> +  The Display Control Interface(DCIF) is a system master that fetches graphics
> +  stored in memory and displays them on a TFT LCD panel or connects to a
> +  display interface depending on the chip configuration.
> +
> +properties:
> +  compatible:
> +    const: nxp,imx94-dcif
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: CPU domain 0 (controlled by common registers group).
> +      - description: CPU domain 1 (controlled by background layer registers group).
> +      - description: CPU domain 2 (controlled by foreground layer registers group).
> +
> +  interrupt-names:
> +    items:
> +      - const: common
> +      - const: bg_layer
> +      - const: fg_layer
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +      - const: axi
> +      - const: pix
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: Display Pixel Interface(DPI) output port

I still suggest ref to
Documentation/devicetree/bindings/media/video-interfaces.yaml

because it may need set hsync-active, vsync-active, bus-type for some
special TFT pannel in future.

I know driver may not use these now, but binding is descript hardware,
try best to make it complete.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;

example needn't exactly copy from dts. you can make "reg" by use 32bit
address, and remove soc layer to keep example simple.

Frank
> +
> +        display-controller@4b120000 {
> +            compatible = "nxp,imx94-dcif";
> +            reg = <0x0 0x4b120000 0x0 0x300000>;
> +            interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "common", "bg_layer", "fg_layer";
> +            clocks = <&scmi_clk 69>, <&scmi_clk 70>, <&dispmix_csr 0>;
> +            clock-names = "apb", "axi", "pix";
> +            assigned-clocks = <&dispmix_csr 0>;
> +            assigned-clock-parents = <&ldb_pll_pixel>;
> +            power-domains = <&scmi_devpd 11>;
> +
> +            port {
> +                dcif_out: endpoint {
> +                    remote-endpoint = <&ldb_in>;
> +                };
> +            };
> +        };
> +    };
> --
> 2.49.0
>
