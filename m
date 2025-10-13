Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F243BD5C64
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 20:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933B210E4C6;
	Mon, 13 Oct 2025 18:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="RQ8U/dsw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013044.outbound.protection.outlook.com [52.101.72.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF0610E4C6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 18:49:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wWyqzSUQkbS2+HEREFSV6Eqd48FzbxyqBVltMIG+3XWzOBNT9z4pj9VmhoVa76ZTwoAhCTZUYx6ggTafV1E9BBaYNEQ50d0XogL+LDjW4BYJxNoYlORiMOGufP9sIyUHOI9nJjkv8qv+xbRCN4O4a3qd0aksx94YWnznOL6wXHrX9pKoQh50nsd7p17ZOye/OhqdfG8QqAKhI8Bp07ETYJS76Recmp4wAaSZuo2TcZ2y/u/CzEDrP6+Y5HLi7R+E5mZaATG/nwTkdnF9KW6Sfj+JnZUoFDi0BcznejwgZdyIKVFgKQsWo0qJ9gcecs9ShazimK80SW6hDP+WH5R7nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1aZKEYS7psjIUv7qG1L1M7vg79Y9xZuoGjSwrK5FFw=;
 b=JSByZIIT2J78F39P/ZL17Z5G7d17z6YcQJT0V6hWIJTk9r2LWDwLbNErGBcW1yz8kKJrEPBJaDEAESXmQu1m3Wcc61v5In4mxpPmcP/9LuLVwkIOD361EudvTHnJFbhSQzFFiZsCiAL/ggbnw2FV0TZNZips7xyEAJwJgYEY2B42UsNAx+rllQOTi3bDRO7B+TwHQ7+GiuIcEHJbcdf+JzDLD7P4dl0VSDUCwDxwhIuV2Z2pVrNdc+VzRueLG2+HEn5tcqvv9lkXZSC6/w6Fm5OGux4KnCq6CdcsC9AYd5QBWF2ejArJ2tOLAspO58cCBnIUwRHXL1KEWkvmrpun7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1aZKEYS7psjIUv7qG1L1M7vg79Y9xZuoGjSwrK5FFw=;
 b=RQ8U/dswKsDsyLXRcHaV1AGgObeqJmSPtQPtcCgN5QEzUqkOQg5xCw7CdUZAhE1Bnt/0ueLzuTz1MrgkwlYitfQn4RO6lHLiO1apZ+BlFuwRuig78QlnDOHd8CnHKFLG8HjaoOTmM+8KezbAlPMjXEY6IjZm3Owihx6ItfBe/nl+Pq53RQGvmJ53nU2OFkh5BexHTGDDfdfHh86NdT5jS0DNmHBm7e4nj9Kk8EWLrBsRUszGrDdmQS6aLEKBzyIUva3mtQFj+52a7xUzszJYr7W0L0y27y/S18wHAzLQmbYFQu5ImX/j4Wh3omDEOhzgKLM0yGB2meGSljHEtptg/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AM8PR04MB7410.eurprd04.prod.outlook.com (2603:10a6:20b:1d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 18:49:04 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 18:49:04 +0000
Date: Mon, 13 Oct 2025 14:48:56 -0400
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
Subject: Re: [PATCH 20/39] drm/imx: dc: Configure display CSR clock feed select
Message-ID: <aO1JmAuSWn6BN6hs@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-21-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-21-marek.vasut@mailbox.org>
X-ClientProxiedBy: PH8P221CA0008.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::35) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AM8PR04MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 5656bb9c-079d-4e54-73d5-08de0a892ea1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UcnE7RJHweLLFoYnlAoszu0f0CKg3cyzR8v382Yz0n0fsrw1BtZQmglwQ/+d?=
 =?us-ascii?Q?VAOQoRQm+h0hjI+z2+t8Kes07KM9T/cZBTCRjNXBWsAW6uIVElSWjuQphGKl?=
 =?us-ascii?Q?A7oWm+sj6U5VNJgJXh/uVuQxpLDldeFI1BVAYrrtq8BLJCRUD5un5cGBK532?=
 =?us-ascii?Q?J/SH6LpxHqNyiKr3rt8wnMIdFgj1BBEv1APhERJuIX5yWx/tCUNysXbfKGyH?=
 =?us-ascii?Q?vCXhF96oIM+mH5toGWoLUC4zLvHKs6j6IU4LONdtnW3F5Y9/2HK4H+jIYKjA?=
 =?us-ascii?Q?z2NVcO/1Y4MDgWNULfO4XnO7gpASoi0Ii7h6T71T1tXaWr55HNUfSV2wypk/?=
 =?us-ascii?Q?U07h9GStc29vot7bBTQ9fzuI495P8MxndT+dxKTXQpasbXgRceuasWv6jxEi?=
 =?us-ascii?Q?5WMRZ18zCp0uoJ4vwQaF0DB6L3i1YXDvxLf15nPF/143OXL04dTsblXKNgpX?=
 =?us-ascii?Q?0chDqpJ+wtVfTtaBRmK++SLMruPOIpGUaokbCRS7XaWd1D6/aVax00z9Fqwb?=
 =?us-ascii?Q?GfILTm3bNK7dEjdSen8DJTNTRzUqVT0qorXf3A91MGzVhEV0lx4doqpaGhN4?=
 =?us-ascii?Q?QDbWhf75Vb3j5Tj77uGIeNASP9dCugoApwZWE4EqC2wL5JxrwBLpa2a6ySUj?=
 =?us-ascii?Q?sSiqWGB1wDDsUOSRkTDRsQigqeTugQUoMxopEwrS4W/trFdfhU/Vh8gCqG78?=
 =?us-ascii?Q?tjZj+P/fnXDxVFTX1YNDFStXc54LXA7TgWQYJ2vbc6MXkfxzTJihexJuAGfp?=
 =?us-ascii?Q?5y8pQe5jLx0VObIvVoZv08cDYDXviAw06pFX2C9EUswdT6ZKToFBgn0GHIAI?=
 =?us-ascii?Q?9LjkROYJm/zWG0k0VFcx9O4xFjbWHL2u1Wev7Z387XdRkpR+5bQftyJl9tCg?=
 =?us-ascii?Q?0InL+LAU7qEc9SOwc+bPx/A43XuqWABRXZd5pESguUfCfNprZTNzzGndrt9/?=
 =?us-ascii?Q?T4DLT7QNnBf65/zxLyHsW3NfZkaqDHoqw4rcqL65p5sG8B46y/m5eb9ouTK7?=
 =?us-ascii?Q?TJVqKQlFCa46tEDufPCDgvrSP+JhkTr/AedDlxau1128GV7J0rzpChGHRDdd?=
 =?us-ascii?Q?/JNRnEAtpRLvoCEu6UwD4LnE7t/PvlyBEsRFBhJfIekExcG48Tl20rSZxNKp?=
 =?us-ascii?Q?bo8SkDy9wtAnKKWtH33sOcf+pndhWEOzJ9JfML8Qa2UGI25EEeKsiI70Q9co?=
 =?us-ascii?Q?blXhBnTbrcLN0jMbCiItw0Ce+9lywFxAO1O/I+gZKHMkA3Rg52tXkcGcETUM?=
 =?us-ascii?Q?SzB9GAn3y6dNI337ZF3guLq+506n6znsNPNj/yAh+ovETYbXF0CUGJJidpts?=
 =?us-ascii?Q?e1vZeGNuFsNBUwdC4bSV1xHom4W+wkxJXru+0QAkzDV75sq52zNTvwyT9hr7?=
 =?us-ascii?Q?r6i8LGKRQ2CpvInCyKs3n+LJE6ZuylIdTNwCmn+LI+0Jvp22B3e1mKPPgKfN?=
 =?us-ascii?Q?a3Fki2Crk+RVN+/CzPOTNxEsTvo9DutEi8xuPFd/+SSrNQTh0Nh/Kw00B/nl?=
 =?us-ascii?Q?Uj5JsDisgeQxP0R7ry55wP/p/jNHPpRUq3VG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3T2gMVx3P7sCmbBiub/ig5lGp/F1tGqGWFwei4P+OgksIwNHIF2YcOsNd3zW?=
 =?us-ascii?Q?TdNgzvzXMzWket/umRyEcaNR5Y2HJ7idsBYyFAlfcHFNbI64pshTaZj49A92?=
 =?us-ascii?Q?6ej/46BEoo3OBT/vyk2vhzYQp2E67FkzCm1QretmG0qSoE+yMKExjtiP9lu6?=
 =?us-ascii?Q?vLT1zQ32b3g3R5cbLf23JGkBTVAnjLZW/nz7+LzpU/ysJVliwRuY9CDUs9O3?=
 =?us-ascii?Q?vYwwFIlPIe8BE8VY8pGpkvDmkE3KNv1ZPKWsbFiq668eqVxWHM4iwPa00mR3?=
 =?us-ascii?Q?Y0KhWrtzaEV+Cx1Iq6kNeZM7bzowm0S2z5p1gpPKPLLhGRqM4HJnxit0a9jZ?=
 =?us-ascii?Q?+NyKX+ingtHk3VfXWAl6V6NsBBgJh42QKMvZhTaS80ey2dIKy3ITioskvxx6?=
 =?us-ascii?Q?lVMq+1xWBD1/lLzRHj4KKHxqR1v08+w7kWIm+HhZGU+CoLsWcB3tUVd6vDYc?=
 =?us-ascii?Q?4oEZ3SV8CDt836vE8cO5sibFSFkq5QqFlnjeYPVTcB4Bw7p5G+sO8Q4LSZda?=
 =?us-ascii?Q?nkP/BM9i1+9CWpKDAUS2CkSsrbyEYibYQf776lOSVummHwlM+WJHKMCD/X0F?=
 =?us-ascii?Q?RzEa+qN8+IAlcE9+fDKwppQhzgTJ4cYv/cxIkSNKnY/CdqYGMBADnw5q0SDT?=
 =?us-ascii?Q?CXcpmqGTn/rxACRapVbNnCcqm32OC9cKX/r6ZUrU6xgt+WCusm/leVAYcUWw?=
 =?us-ascii?Q?FvKgXugOpX7wxL7JGzomoT1WmdHc4m+aBBhCsnYuMwh7kyuUiqYRkMgLyAqg?=
 =?us-ascii?Q?zqk14aKDcijIeis9fxq78SdNj4pBsufEuHDhoQywY+rUcLr0QpWfNt23gkcv?=
 =?us-ascii?Q?1zLbcrxAnN6NAfwLRTLBw6Ao34ALEZ9YGp6Xxfsi9VG0clar3uvcvc8Whh8k?=
 =?us-ascii?Q?ARRxYeGf21rDBd2OEolaYBFq5q9IlwljNL65JzMafa28x+HxrtuxpWX6WfYO?=
 =?us-ascii?Q?09xeA+PetLqYA/nrn8uSBajK8cYLmttP+n5rAhuVtCHdXUNpaGhRp3t06S/z?=
 =?us-ascii?Q?q6HkEjsh/RscctMi1ZNeypRO6V7D3029D/5/pfmsYF0uT2RKb5gVCroCGcPG?=
 =?us-ascii?Q?/DDWoN3VJnB1JaVvjcrKOzHG5QL9VoujWSMeNInyYpzUIn5KZDA79YKGWXS6?=
 =?us-ascii?Q?HA1UtplqpdIoihajEotGtN+LCPLwrICFUNz/A1cHHKzOTOr81yHFNXQ+hkye?=
 =?us-ascii?Q?TsmAlPhGQV2pstSeacQPLt1meDoo/575Zny7Jh4IGw1+vF7emsU+K8nUQlP2?=
 =?us-ascii?Q?INjptilroxKKNTGUA+8Sl5mpK8lvZ+zcqzydC6LRi6VjFU6ZiQ2IaelpAfOh?=
 =?us-ascii?Q?hhg5Tet7ZY8qWo0jzR3cyfU1lgnlfVTZSsmav7b5QtLboo1BmuHg8g1Uz3Ne?=
 =?us-ascii?Q?/u/Ens8c1j1nrz1KfLkHDcuN5aCXmrwb8SKa5LcIIiY7ftQ3UnMCqM1lXl4t?=
 =?us-ascii?Q?/ayn02e9zRAUH7fy11+oX82cwwQIqPWaL7NCFqlGW6bIG/tbHjB1t6TQpuve?=
 =?us-ascii?Q?td5LT7R1TTmivTFUR2KFhdeMWSg+emTCWF4xPLYJnMYcljZuGeWTGgIa2Le6?=
 =?us-ascii?Q?9Qwsc+aniXhvsN+3TcZa4ubz8f8cc32lQRrXti2N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5656bb9c-079d-4e54-73d5-08de0a892ea1
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 18:49:04.4872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1iJ6KbIYjfnnzW5FsiWOuALgJlBVFWEjshTTuk1VxRM54DmpZy4g1Q9SlMhef592ck87xBVIk6H0++ZyqNGsPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7410
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

On Sat, Oct 11, 2025 at 06:51:35PM +0200, Marek Vasut wrote:
> Configure DISPLAY_CSR clock feed selector on i.MX95 accordingly
> for either DSI and LVDS serializers. This is especially important
> to make LVDS displays operational, the default selector setting
> of 0 only works for DSI serializer.
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
>  drivers/gpu/drm/imx/dc/dc-drv.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
> index 2717c92aba6c5..dec8ad19bad42 100644
> --- a/drivers/gpu/drm/imx/dc/dc-drv.c
> +++ b/drivers/gpu/drm/imx/dc/dc-drv.c
> @@ -7,6 +7,7 @@
>  #include <linux/component.h>
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -29,8 +30,15 @@
>  #include "dc-drv.h"
>  #include "dc-pe.h"
>
> +#define DISPLAY_ENGINES_CLOCK_CONTROL	0x00
> +#define  DISP_CLK1_SEL			GENMASK(3, 2)
> +#define  DISP_CLK0_SEL			GENMASK(1, 0)
> +#define  DISP_CLK_SEL_CCM		0
> +#define  DISP_CLK_SEL_LVDS		2
> +
>  struct dc_priv {
>  	struct drm_device *drm;
> +	struct regmap *regmap;
>  	struct clk_bulk_data *clk_cfg;
>  	int clk_cfg_count;
>  };
> @@ -119,6 +127,17 @@ static int dc_drm_bind(struct device *dev)
>  	if (ret)
>  		return ret;
>
> +	if (priv->regmap) {
> +		regmap_write_bits(priv->regmap, DISPLAY_ENGINES_CLOCK_CONTROL,
> +				  DISP_CLK0_SEL | DISP_CLK1_SEL,
> +				  FIELD_PREP(DISP_CLK0_SEL,
> +				             ((dc_drm->encoder[0].encoder_type == DRM_MODE_ENCODER_DSI) ?
> +					     DISP_CLK_SEL_CCM : DISP_CLK_SEL_LVDS)) |
> +				  FIELD_PREP(DISP_CLK1_SEL,
> +				             ((dc_drm->encoder[1].encoder_type == DRM_MODE_ENCODER_DSI) ?
> +					     DISP_CLK_SEL_CCM : DISP_CLK_SEL_LVDS)));
> +	}
> +

why not export as clock providor and use clk API to do that?

Frank
>  	ret = drm_dev_register(drm, 0);
>  	if (ret) {
>  		dev_err(dev, "failed to register drm device: %d\n", ret);
> @@ -157,6 +176,7 @@ static const struct component_master_ops dc_drm_ops = {
>  static int dc_probe(struct platform_device *pdev)
>  {
>  	struct component_match *match = NULL;
> +	struct device_node *np = pdev->dev.of_node;
>  	struct dc_priv *priv;
>  	int ret;
>
> @@ -170,6 +190,12 @@ static int dc_probe(struct platform_device *pdev)
>  				     "failed to get cfg clock\n");
>  	priv->clk_cfg_count = ret;
>
> +	if (of_device_is_compatible(np, "fsl,imx95-dc")) {
> +		priv->regmap = syscon_regmap_lookup_by_phandle(np, "fsl,syscon");
> +		if (IS_ERR(priv->regmap))
> +			return dev_err_probe(&pdev->dev, PTR_ERR(priv->regmap), "failed to get regmap\n");
> +	}
> +
>  	dev_set_drvdata(&pdev->dev, priv);
>
>  	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> --
> 2.51.0
>
