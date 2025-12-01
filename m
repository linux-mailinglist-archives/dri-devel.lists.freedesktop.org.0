Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D42AC985E9
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 17:52:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055A610E2BB;
	Mon,  1 Dec 2025 16:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="R3aL+RUr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011009.outbound.protection.outlook.com [52.101.70.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C3610E2BB
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 16:52:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KPdpOeqCsrO8c86HNHj607ceMqo8XPQAcISF7Ci7o6gD6oowJD2hFeY9ZPfK9wbOgXIXxbn3hpy8mEpYB+jnTuuPJ5UzBstQfM7EDRqSM8bQXC2as/iAcaYeZVynSQV3HWOEnoeuP8rROv4m3b6xH3sV/IWlAYLwEsDkXIsmBQipFH6BVvb9R4Y2fjGK6NlCd9bMkFEGogyQZbtHCyhZmKTLMKAuG6FwiNapc9nMlBSJ2mlDA4Vc9RnhP8Zes9XYRmkhzB/mpZZeGh6mvkSagCq6k8pBbUe7oYCAWoG5ME8JKF7UtaYXZyCyA6qNFesvCDHq0nBLyxNJ/xLw1AZXpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l58dffqnoPz3cOiK1sf14CjfiSUwOcau9Xv/PpLgrXg=;
 b=X0MlfzKCjyD79OHCwLN9Ab/BImQnMlSbtmLgKV2MJ9Xt0CVs5lzxGoq4JyKZXOGwZ3veTZiu/vHYaeeGRaNDBFWf0hkNe+3Tdktg1KI8Rbvv1hL69tDpfWhwktCB1dfZxgQo7viRqXUvjWsF0tA+NU3+/qVZRHeckJr4r+6wU0uOapPmrVmZpBAy3h+CLZ00OS8DA38OKpgOAaPWyN6CpGPZbJqGld4gi1SfOFmnhE6FltBDSJ0TrqLBXqUuZGULDx3NT0sylJ5obJts8p632f1Cei2mL4KAHx+YJRtAwotdu9Si4XzOqPdvxIVJgEwIE/NgGSZaT2nV6oXSHq12tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l58dffqnoPz3cOiK1sf14CjfiSUwOcau9Xv/PpLgrXg=;
 b=R3aL+RUrpCwsvSr4ysrPPKxtf3h/Vz8Q2NpYZdINz/5iY5Q758qn4iszjSoc0nukaT7C/qYW3tHYGMTuSQYsMsa0kmaPZn4O38FeN9zI+NeZSbltgtX1GDu/jwIGVrL1N7TWakh5xTm4RiiFZsUFP/GGSbU/ZkVsNiORC32KEIzHuI3tsJjVWrqUl9NVBstEG+fc9ZRKfToNt7THMCBXckAXgK3OikAzDhbLmBn/Q1qq1fFlzGU3FDvjvEPT57PYgrBZiKtVrcm6TgyfIyz1u9s5m0IjAybiRdWVmVGZFb2Wxs6mBXBWgMj2mhnv6CMSt7esQQCcqzfzk2ahXuCkNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS8PR04MB8279.eurprd04.prod.outlook.com (2603:10a6:20b:3f8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 16:52:49 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 16:52:48 +0000
Date: Mon, 1 Dec 2025 11:52:38 -0500
From: Frank Li <Frank.li@nxp.com>
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 1/4] dt-bindings: backlight: Add max25014 support
Message-ID: <aS3H1qzSMKHamqpP@lizhi-Precision-Tower-5810>
References: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
 <20251201-max25014-v6-1-88e3ac8112ff@gocontroll.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-max25014-v6-1-88e3ac8112ff@gocontroll.com>
X-ClientProxiedBy: PH8PR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::7) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS8PR04MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d19c844-45d3-4f5a-fd1b-08de30fa0f23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|366016|7416014|52116014|376014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x6suohBV+EXou57H3PUnLwyDDUbOVQ9pBOq+mTasHdq7hlY9C5Ue2cKEpPkE?=
 =?us-ascii?Q?t6qswluzbmBiAZ2v/D2qJpGWo0hhAIlM+7sgmjiKavYKXUO27UBLYVWlNaAI?=
 =?us-ascii?Q?VJEtdM13CqOdC+4vXMNlGmq1II0C/bn2YDcxL3gNTGPdAofK2G4Hw7LXPgy8?=
 =?us-ascii?Q?uQVd4db/xB0NAymP2gebPxu0EWf1kE4nLtjGmQUD6oM66I1m+sEug9IXUTo9?=
 =?us-ascii?Q?pmVrjO/kXhoyyAXA/oRdOelWrsNxAPu8sr2qUdPI7jbHdtO9UER6VXcY2wlX?=
 =?us-ascii?Q?/YKxDpZJ4AoEQetf9yvozwJpcgViTW1Gf4bGCay4xyPHc8irb4BWaQhpkJhE?=
 =?us-ascii?Q?8De1Qgi+Xye8soQb+8+0vg/IYe8LgjiR1XWujtLdSKpLGPjEBZQ1tIl4v4FA?=
 =?us-ascii?Q?AYa1hpe5B2+R6gsmOZur21RyO4iniaa3i29gsUH3bVychqqEBdmnf3sDVfNM?=
 =?us-ascii?Q?wkGQ+jr8i45pQZLcHvLHrHOPC4toW1uspb/UA6b9+nhaRMLhg2s0s1RsC+j7?=
 =?us-ascii?Q?CHZ4Wj6rrpFnaVpDldoU4tZ5p4bQ/3BWXzGpmLI7gFhdq9NMIXk9NnLgxirz?=
 =?us-ascii?Q?izEpxG0w5MKy3/s2A/W7b5kCguV4pwvdaGoVSRAZTjzRT/2c8w3hl8JZYf45?=
 =?us-ascii?Q?+kQTXZD/z2oQWI3yH/+2W7LiMmHMs2HCJI75WuCEguE3KM1E8bB7gAotXiOU?=
 =?us-ascii?Q?hP52GcHxCnYv7DCOW25OIpqwTBOy2mIUuc0smdbt8W9L7clb9sy+LWwS+xmk?=
 =?us-ascii?Q?LIEidtFiDJW5CS6VG9BVXdgPVfcOob+HO0R+3KIZBXp23M52sdNAtFVc3XMW?=
 =?us-ascii?Q?gOovD36fJAt6bC2x4UPjzq1uinPQuxEJd0Ymjy/OvNGImkdGy4SxyVlpmuui?=
 =?us-ascii?Q?Z9AFnQBoAUOwN6CUPsRCHTWGOrGxVOD2+uFJVuX04OFpTp1+Wl49ESypf+iy?=
 =?us-ascii?Q?1d6NCk/53WxQWUGgUxu71jlULZiTcyK/PT1VmeJL8RQ4XD7ygEM8/r8YaMHY?=
 =?us-ascii?Q?pRCKphQlboCavDolngLUwqVZ1agjDpFjI4pTkqLA/wOqiQ5kc38Z9wFqlZOR?=
 =?us-ascii?Q?A1ju9aIran5Uro7tpmN5RfytitiqjbrdPAX35wsn2fIViy419Ufs/aleS5Gg?=
 =?us-ascii?Q?rCaNsL5DCMp79IMjz7GwrM83mDhc0JMGR+KqIcItatT/sJVC35rSFnkqkGGW?=
 =?us-ascii?Q?TuGW5vZVaz83v7OEhVtRERqDn8TQ/MF3S/KLzR4jQt9t4R4BMA2rawviRld6?=
 =?us-ascii?Q?9EYhPaPRZp5Wwofm4AwEjxr8YWJkFv2eIvHd7BXdLrfxrhCyIwaarhsKElJ/?=
 =?us-ascii?Q?oDJxDIDheaIZ17VjGIbvolrE2pi2E0PaanxiEVBA6+w7Y8djwzks2T2a3b5B?=
 =?us-ascii?Q?AH6CyxFUGJoyTHIUUs6+tnz90EAlqEYK7n8kaWXARdqQJFsIdTDLeLhgDCuN?=
 =?us-ascii?Q?gfiA6ROf9WMLu7TwBKYQHEtshjiaJwFnP8S2MbvZYsHSizH/b7e4sg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8951.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P9AqLSRMFR48W2TKbZgd2TZmXTBsJP0/ypP9pHJLicknagJ7BV9D6vEuLqoV?=
 =?us-ascii?Q?H4yv1kN0Nyg98LNfEtLQdZ8rT7afWxRybOHYlkrMIrvN7PCIBsgj8CAKNDyC?=
 =?us-ascii?Q?v/FtWNft/jym0+qWRwJcOusYJQePTwUWwYizWGH44iAHw8Xmh90wW6PlkWhg?=
 =?us-ascii?Q?iRjqkY/benNt1CT5owkn87bTk42D3FpVjgzj3GQmLoNmwJZhfu34VfzPm+KC?=
 =?us-ascii?Q?1CCHvfk+8J/IaY7n8wRDaFwLj9OxNo2uBYlw0aCn2Aijxzyy/mEvefoU61Iq?=
 =?us-ascii?Q?uGBO+3RdS1alDhcTGBG9XwGYG+YeR131rRXJLOAljFwAMFTDrG8nCGICkYRj?=
 =?us-ascii?Q?0ulHaeVpfvw7y95xfZMK7Y5vGXIRNC9CGy1qskYpba8qIGdHF1cJo1zBGFV1?=
 =?us-ascii?Q?Bwgbix5s8Gui3aN70A5N552DtSnYFUlmOQzDbaPcuiYz0l44iE3OB/WuUixp?=
 =?us-ascii?Q?yp1B2rD9Cv160HsWV+t5BUnx8fNV6pv/6tS9M2X0Ozd8pKc8j4SwqgZIrw1R?=
 =?us-ascii?Q?+SAZKIFKjHeUplMQ5eeqO1XhxVEfYkLg2ZFvthPNKUs4xMiXMKm14WGYvxgx?=
 =?us-ascii?Q?mBp354Y2BaijkTNvhHzWHFwoZcIhvq1sVAuAIXYmUi/HYk1vM9rKr3WD81j5?=
 =?us-ascii?Q?QPDoUVmg+yxgxf+0FUBA2pmNmeVHbXQGnwZsOXJbnQd4Kje31jX/sE6nEf7/?=
 =?us-ascii?Q?ZjjhxeumIO+L5psc4Pih5Y4MCvYDC8H4rtMCWzJKk32Y9WQATmm9B5Hkilj0?=
 =?us-ascii?Q?4nL4RRrGxjGMjnGJAZzsL5tjD0PqETmTluy5nqMvzzzE93agWXe1j5D4tJek?=
 =?us-ascii?Q?56OJUZDwmC7E/kJBom9Kn2rFerH0lOeNOKvKQnv9yQsYGxrosWbjaFryRN3f?=
 =?us-ascii?Q?RXqg1imHe657iu/NWLjHiUhmMhvOo/mPrMzGRT/W4qAaVEfEnMMHYiugljup?=
 =?us-ascii?Q?8h+88+WxxGU0gpVXhRsFXm3Pi4yvsyg1oMW4MW2gmlbZh5Ov3FKUY19hUEiv?=
 =?us-ascii?Q?M6XqXMk6PT6u1XHyF42DSG3ZtkatsLZ7KdHGE1IsVHjzMqRqbiP/MRCh1jCH?=
 =?us-ascii?Q?urOplsYObtLQqxH0YgYxNFNbUQv6RvfQ8y+RkpByn+sJwlkAYzAs87f+jhrV?=
 =?us-ascii?Q?tn0FCadf/3cbvSENgnGzv1r6e40F3LKNwsLA+iYbNiIRPlVsStOxb7YWEXQS?=
 =?us-ascii?Q?bX952t5AWmP3/4aVyoMHkJYnNJff0Efh7M9k8/wn44BQ/xkA/EtN2kMlEr0n?=
 =?us-ascii?Q?r+JYdi5IABTvN1sN5AFwheIbdI1xM9SZUPWfK0NPzerLcNwkLToZJqX7HGAZ?=
 =?us-ascii?Q?NKpxIqJNWTbx8thLK/hubJVEgkWJD1EL4g5dLFi0HDEvQom7QVPUGixGMFZd?=
 =?us-ascii?Q?8eT5eYbsOAfqthK47y5P+VSNn/W4RdT0tBc87Tfovva9uQYmGwgTRLVzRhXC?=
 =?us-ascii?Q?NhGkU18R325ziA7fOnNjzlNrQsoUfaHprTXG4noLevipx5n0XpUOBt8vzOcO?=
 =?us-ascii?Q?qvIvWJCmxPQspbuROUBCuURfA/TY8h6JRTvCOBeMvCRH6XjaRNNLqNTBxXJR?=
 =?us-ascii?Q?UfIdu1jXu53GVSn0SlQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d19c844-45d3-4f5a-fd1b-08de30fa0f23
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 16:52:48.8395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkvPhN+ZO4DM3ufm79Im18GRam+/hXLyThBb2JIjYSuO9d3WtK7JTaOfite01DlyKpzi+/z+F9SBEnbj5cxSkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8279
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

On Mon, Dec 01, 2025 at 12:53:20PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with integrated boost controller.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>
> ---
>
> In the current implementation the control registers for channel 1,
> control all channels. So only one led subnode with led-sources is
> supported right now. If at some point the driver functionality is
> expanded the bindings can be easily extended with it.
> ---
>  .../bindings/leds/backlight/maxim,max25014.yaml    | 107 +++++++++++++++++++++
>  MAINTAINERS                                        |   5 +
>  2 files changed, 112 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> new file mode 100644
> index 000000000000..e83723224b07
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim max25014 backlight controller
> +
> +maintainers:
> +  - Maud Spierings <maudspierings@gocontroll.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - maxim,max25014
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  enable-gpios:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-supply:
> +    description: Regulator which controls the boost converter input rail.
> +
> +  pwms:
> +    maxItems: 1
> +
> +  maxim,iset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 15
> +    default: 11
> +    description:
> +      Value of the ISET field in the ISET register. This controls the current
> +      scale of the outputs, a higher number means more current.
> +
> +  led@0:

define whole binding, allow 0-3. binding is not related with driver's
implement.

it'd better put unders leds.


> +    type: object
> +    description: Properties for a string of connected LEDs.
> +    $ref: common.yaml#
> +
> +    properties:
> +      reg:
> +        const: 0
> +
> +      led-sources:
> +        allOf:
> +          - minItems: 1
> +            maxItems: 4
> +            items:
> +              minimum: 0
> +              maximum: 3
> +            default: [0, 1, 2, 3]
> +
> +      default-brightness:
> +        minimum: 0
> +        maximum: 100
> +        default: 50
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false

unevaluatedProperties: false because ref to common.yaml

Frank

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        backlight@6f {
> +            compatible = "maxim,max25014";
> +            reg = <0x6f>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
> +            interrupt-parent = <&gpio1>;
> +            interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
> +            power-supply = <&reg_backlight>;
> +            pwms = <&pwm1>;
> +            maxim,iset = <7>;
> +
> +            led@0 {
> +                reg = <0>;
> +                led-sources = <0 1 2 3>;
> +                default-brightness = <50>;
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 58c7e3f678d8..606ce086f758 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15261,6 +15261,11 @@ F:	Documentation/userspace-api/media/drivers/max2175.rst
>  F:	drivers/media/i2c/max2175*
>  F:	include/uapi/linux/max2175.h
>
> +MAX25014 BACKLIGHT DRIVER
> +M:	Maud Spierings <maudspierings@gocontroll.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> +
>  MAX31335 RTC DRIVER
>  M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
>  L:	linux-rtc@vger.kernel.org
>
> --
> 2.52.0
>
>
