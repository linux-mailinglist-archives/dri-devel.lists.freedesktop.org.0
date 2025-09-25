Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 705DCBA18EE
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 23:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BAE10E9B2;
	Thu, 25 Sep 2025 21:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="OJMO+EAN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010043.outbound.protection.outlook.com [52.101.84.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFF010E9B2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 21:34:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6pvCt5G0i9LV64cb/XE8zx5blxDLKaCNQrPN9A8PDuGkae/gwJDy/QXdYpvRoAvvnsQ08RTxaCf1ry96ItzTAijSbL3rW1Uj10ZxA7TZgzT9rQ6ozzd7+MAp5iuuDfAnTZ6B7aosySiDJnr+oezYpkjqGDqAsawT20gMS+lqC0E9IaOm4pX1qR5o0MdTgUgPVwNlz2V58gimlYtM2i7M+KtkXJ0yCXdCb0RJK1K8ojSc3NQzMJJR0DFVgISfwl/iDLQ7Ri5SYePRyAL9Qi5YBD6dhKVcnBiFHkA8vK0rb/lZ12Z80euzMpvJIuI2CjoFTJ5u2cX59/pWlmJ4cDK+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k25oqw3y1fXeqANrkMymXFuXLxPIy52Fn/2/sxEX148=;
 b=dLRtINVnWJQAqKfOxqmPtM84XfDhXG0mTVEZv18khvoYjZxt55nOdvHHsDaHIVQ9fbCBHBdvVQ094g3PFVTKJUY8PIf5AHSphNTSufBqhUm7Eq7OUjAS7hoHIJC111O5DlNzcSpe29u6QA1u8K+26MG9I4vIeZawfDpRg5z1Ptg6Oaiw4YzQIfGSSB9/IJ9V8oy7Srai2laHP5O7fM/6h5IC0vQgfVlnav7YwxIZlI3Tq1HJ+gRRBvCdZT2F0t4YwfeX7AK4kxSxbf1m/lJO6eLj1lgKfZofeLBX0Vb2pqR5ey95Qy976GePgPKQFmzdbezDYH9rk1rD/+u1ZJljFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k25oqw3y1fXeqANrkMymXFuXLxPIy52Fn/2/sxEX148=;
 b=OJMO+EAN1aHwWp9KumeI5q+qQmcgEFfaUFjunlH694Wi8P5knR44itkKxamipufQfhQwz16oArxSL05Ct4Pu9iWp3PCgEPsBgLbw8AqFUm/mFKOv6Xui3qpXccDp6HA9v1XXOlqHvH89bMh80zB+FLkwTnEc5YpnEPgvFMS+WAF/NOZ/ZlKJxyQ92T7z8h21+O/hWoEQais/jMR7CFxtth1L+jUrox73rdBWzZ4cSm6N9qDtuKYM3kMjJAJUVe8pc4Xzes75bBHpsCR2Jc/4tSFBYITBXDDVwv3h+joL3KUIWfSKQ0LXRFCmMhZPtjQwv1lGkqg2JyQcNod3ahKpgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AS8PR04MB7704.eurprd04.prod.outlook.com (2603:10a6:20b:296::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 21:34:13 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 21:34:13 +0000
Date: Thu, 25 Sep 2025 17:34:07 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 "Jiyu Yang (OSS)" <jiyu.yang@oss.nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Xianzhong Li <xianzhong.li@nxp.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 2/2] arm64: dts: imx95: Describe Mali G310 GPU
Message-ID: <aNW1TzMg602kWOqh@lizhi-Precision-Tower-5810>
References: <20250925203938.169880-1-marek.vasut@mailbox.org>
 <20250925203938.169880-2-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925203938.169880-2-marek.vasut@mailbox.org>
X-ClientProxiedBy: AM0PR04CA0104.eurprd04.prod.outlook.com
 (2603:10a6:208:be::45) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AS8PR04MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: cdac47a8-23d7-4844-79f2-08ddfc7b45a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|19092799006|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MwoPmIhs2mIIbRwzcja2RTdXubG9sIv8Kbw5fRSs7Tgi5RhrG5ubO4IJpj+T?=
 =?us-ascii?Q?kKh78YLec3hgEx3ghLpkD5onqZBAJ/DunTfGEUR2C3W5+sYRxLjKdWCZQqP8?=
 =?us-ascii?Q?Jqr5ad+RyqRkiLRNHMq6CCVsyqjDh5m2X+OM6blun0vdfWwBlDwVxZoKHR33?=
 =?us-ascii?Q?zDmENu4lcwJgYUTH6CQ4NX/HdFd36f7EepVrYP+8tKIUedGHMqG4Oc5bgOKA?=
 =?us-ascii?Q?lAm8DcbqtH5e5YVzl3vyfSH437+4661EvPaWBlkPiLP0On+TDsUwKMmH/cKu?=
 =?us-ascii?Q?HeRaA3Snv+yJhWtnSu1k/1mwF0peAwvltXQF1oJ2hol6n1uyBkRgT6gu77tW?=
 =?us-ascii?Q?5wk/QHsZnYkEFLPI4hLnHbPUXwjxG65cEJ7ZVF8z3YUVxYJ/J9kwz/qtJTSA?=
 =?us-ascii?Q?+8BEd+pBqzh0qFB1vLqG/hckkoN+ISdG9AL2o+d298clDVz0J9SPOH5bj36z?=
 =?us-ascii?Q?zVlukiKQwwrHNyre6zLUB0akOxwUvRG7f6xtVjD0Dv5xuHsGRBmJnZ0HoYcM?=
 =?us-ascii?Q?9NL3qlx7qmZxRbpp70IHSDHTEbsmwFKp0qT9xDXVoi4Vfs+IFjqjh9YZaweA?=
 =?us-ascii?Q?nwlITF3UDk4iOffRQUIfTCRZOHHXgPduQhDx7RRcZX+x8Qj47ch4BqnKXGZX?=
 =?us-ascii?Q?IlCUo59ltTpaoWdJGpcWqmSotcRPP2xjVUnafceo3U+5gYg0dYmAevbnomSU?=
 =?us-ascii?Q?PX+XGJQvGMg48e5IgwTLclg9ORCuILB2RRnDCkB/+tPu20MlFhEL+/9ZeMA6?=
 =?us-ascii?Q?QfvCZw651fWHhlCm4vRsjlGt0FVXDa55ex7B5ZNBESLc8jkLlLWQGsUW+D92?=
 =?us-ascii?Q?kgFy3ofhEIBYPjYdqcF1hVu9V2ufvSRj2UTxL9/UcU5Lso2pVd0H+xO9DE6j?=
 =?us-ascii?Q?WqNZdhGQqIZB3KiMhDUofDBP9ImgfaXlbsBc5sLyS+NJF8EatfOqQi9THL3n?=
 =?us-ascii?Q?lTjMshUpdTBkom1Z4F0Vp6jQ2Zh0CTrPryEe0ZrtUnjmH7XFB9q30rLb6Vle?=
 =?us-ascii?Q?+OmIMDYU1XtzarPd70cZNCiHBD5nXk6JBkJD0DHyn9InewVKtluKYjB/DtRH?=
 =?us-ascii?Q?TkZwn/V7ucYD8nT+IaGz2nn0CoMLUpPYMt9n/eUtwFQ/r47oBOMfSQ8ue16Z?=
 =?us-ascii?Q?0hSrpoq4CFrcU5UJGRaTKliXfy0QkNwYZzq6njYGZyfv1Otesx7QZAvehBDV?=
 =?us-ascii?Q?BIIres7EJGS5h33ylBvO3FsmO0/8TQ+RlDkCYyQQ6teem0KxZiV+6npcG67N?=
 =?us-ascii?Q?duN+tEgRR56XF3D5l4bTfjdDZUmFcFChSHJNO/k6QyicQbfyHuBQft/5xUf8?=
 =?us-ascii?Q?cdgSBu5VHV4fyJ64ijAbH5VVm55goXSkoDGflApcrJ0JwwPsIrbRfxaq0TOQ?=
 =?us-ascii?Q?/XjzzRX7QtRe/PIlKuGEFgTZgM6L776YkteGmB+Rk4DXY1TlImAB8/NzKl9w?=
 =?us-ascii?Q?LdGnHhFc7tXFPaYz/MRwvBHx6nUxVuuYyWyPjQgjn/Ye1J+ak68VL/XSwXRO?=
 =?us-ascii?Q?ctZIjB8wLj7LD8fn0lq/xbc44UBTWbngHDZD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(366016)(1800799024)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KDtYPkoV+VMOGezVknsavFzefULGAgrqXGyZWXnS55s4gNep9t97jh+3lm6n?=
 =?us-ascii?Q?PGCmOiyx/+8w2QmDhLssUfUT44UZR057qZvSp/Jg2BV60MPYiMeL4PuqAL6q?=
 =?us-ascii?Q?ozykjTqXAfi8rAFdnIvc+6WXnCNYUFsJdPEq1/323zKlQjAge0UzL9tS1BD8?=
 =?us-ascii?Q?ihKp93SBokz0ac4EmDhTr5d6rgqac4IY5oF4zqMbqplV8a7Q9123bUPn9g2o?=
 =?us-ascii?Q?QysCuBQwz7ToRlnhiY58zTJjhJyO/uYVV++GM9DXkRp/jTlBRAlRyYdoF+MH?=
 =?us-ascii?Q?WMJH1/p9dnrfJHUXNjwwT5QW5wI51lERqJwW6wwLksPlcxXSTPjYTOgLCuAa?=
 =?us-ascii?Q?EURmVcK9fDciUNxj0XV7P+JgbMeFn8Db1Z8BvMOPfDeWbFky0vhtIvRJljka?=
 =?us-ascii?Q?fCNtrR3qvK6cgD/v3yxVpou7Cryo2ZGJDhBt8H9o8Pmt87Hr8ziIiFnawocS?=
 =?us-ascii?Q?JY6ZnaaTy5TFtYT2xCfhKKbqz+2P7lwXghJzT2SeHn1WbfbvClp6DuBaivGL?=
 =?us-ascii?Q?Op0Riktdf8MYH/Pl2K6Jx64PC48p07Z8eMfXUvLUiHFtjM71ALm3R+wnyMe8?=
 =?us-ascii?Q?BMrXViMEV/O9H2t0m6IN65g6Qvn2kUGiAiXQfx4K+KD96FoaZqCBBBEW/GXv?=
 =?us-ascii?Q?6vRjmEjTbCC13dTeC7acNyG6aKLGHm4UHDCjfUzpFbA26C7AO4XQ9XbZSyLS?=
 =?us-ascii?Q?qFysgfjHkO2cUaCKL+Q957rIg60RVE2xMMhtOrjGdeUGVqMfcouEFVSftnCX?=
 =?us-ascii?Q?oCgscdVYxRMHc8EHKfGb/hborFVwpExSj3GuKii7K0LGnO0CwebR606TvrJR?=
 =?us-ascii?Q?nrboDl2dg5Xj/LUfGKv5h4soU9t3Vhb/+hnsYzSTa3eQ2hDt+NTzLEy8ErOe?=
 =?us-ascii?Q?B6BcqZmvIZl+5gfQqD2yyk0/7tf5fcrn07rlE5l0R8TF0ZcsV0WXjkH20DFt?=
 =?us-ascii?Q?VKzRt/EGHoxPBLrEJBxR9RyQVZiOZ3faef+UrQeOrCWH7nwi/GOO3wmgXw67?=
 =?us-ascii?Q?fyhAKMancyWnm/fd7oHx8a9gxWaOHYtxfut6ESQMGnKo7SNM+/0lIrmEaT0D?=
 =?us-ascii?Q?UAitvAyysTA9ph4p/mQ+VQAfA0Js8CyYegUzHN+eiJtb/M9XbrNftu365c7A?=
 =?us-ascii?Q?+zThLnJ7AEDq7S7t9SaElptS6eFWEESA4Ve0asNJWE8azTKpFsY8RZ/x+3Et?=
 =?us-ascii?Q?5YYtjzgJxIKjMIwBW6pOv+D5wUHGn93wG2LCc53AHYMKZrrU/VOTU8cJmLA4?=
 =?us-ascii?Q?wPhNidvbQWjvAMDHDDRlyCl7EcWIvDHM3+ywGpvbnRiDvqBMG6rM46ryaHIt?=
 =?us-ascii?Q?lLR0sSwv0h7+4Ba1CdhGLLRQKVM+gaYVNHxPGnShs9Y3E1ntNntsIwDtgrjc?=
 =?us-ascii?Q?iJH6XkM6t0eJs2Lhgmtj3jBRPsy+gtb15XVDGwW2sbE3C8sNUfpT1Gu+U/L5?=
 =?us-ascii?Q?G4jQQoi94FJty6HweCVYNZgCDmxcxHuoij4OAsYWeLS7b5RAlQ/7he3TfSjy?=
 =?us-ascii?Q?CWAUviT0miHxZ1gKpj6CXl17TDns1i3sU8TWFQ2O5WxLbDk+M6GY6MybVuTA?=
 =?us-ascii?Q?9SOAPHg5q+R+RL+G2gE4u93odVFZ/X3U77s4iDTC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdac47a8-23d7-4844-79f2-08ddfc7b45a7
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 21:34:13.7457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wOzsiHFkum7m3kmsfkKFyqGPgooY9glGSnPPjMpGim6W81OjqkDD2/FKSGgWcq4ILNwuyeqAntk1QZ0Qqph6Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7704
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

On Thu, Sep 25, 2025 at 10:38:31PM +0200, Marek Vasut wrote:
> The instance of the GPU populated in i.MX95 is the G310, describe this
> GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jiyu Yang (OSS) <jiyu.yang@oss.nxp.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Xianzhong Li <xianzhong.li@nxp.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: - Drop regulator-{always,boot}-on from fixed-gpu-reg regulator
>     - Keep the GPU and GPUMIX always enabled
>     - Switch from fsl, to nxp, vendor prefix
>     - Fix opp_table to opp-table
>     - Describe IMX95_CLK_GPUAPB as coregroup clock
>     - Sort interrupts by their names to match bindings
> V3: - Drop perf power domain
>     - Drop reset block controller
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 45 ++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 1292677cbe4eb..ad47b7f0d173a 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -250,6 +250,35 @@ dummy: clock-dummy {
>  		clock-output-names = "dummy";
>  	};
>
> +	gpu_fixed_reg: fixed-gpu-reg {
> +		compatible = "regulator-fixed";
> +		regulator-min-microvolt = <920000>;
> +		regulator-max-microvolt = <920000>;
> +		regulator-name = "vdd_gpu";
> +	};
> +
> +	gpu_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-500000000 {
> +			opp-hz = /bits/ 64 <500000000>;
> +			opp-hz-real = /bits/ 64 <500000000>;
> +			opp-microvolt = <920000>;
> +		};
> +
> +		opp-800000000 {
> +			opp-hz = /bits/ 64 <800000000>;
> +			opp-hz-real = /bits/ 64 <800000000>;
> +			opp-microvolt = <920000>;
> +		};
> +
> +		opp-1000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-hz-real = /bits/ 64 <1000000000>;
> +			opp-microvolt = <920000>;
> +		};
> +	};
> +
>  	clk_ext1: clock-ext1 {
>  		compatible = "fixed-clock";
>  		#clock-cells = <0>;
> @@ -2138,6 +2167,22 @@ netc_emdio: mdio@0,0 {
>  			};
>  		};
>
> +		gpu: gpu@4d900000 {
> +			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
> +			reg = <0 0x4d900000 0 0x480000>;
> +			clocks = <&scmi_clk IMX95_CLK_GPU>, <&scmi_clk IMX95_CLK_GPUAPB>;
> +			clock-names = "core", "coregroup";
> +			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "job", "mmu", "gpu";
> +			mali-supply = <&gpu_fixed_reg>;
> +			operating-points-v2 = <&gpu_opp_table>;
> +			power-domains = <&scmi_devpd IMX95_PD_GPU>;
> +			#cooling-cells = <2>;
> +			dynamic-power-coefficient = <1013>;
> +		};
> +
>  		ddr-pmu@4e090dc0 {
>  			compatible = "fsl,imx95-ddr-pmu", "fsl,imx93-ddr-pmu";
>  			reg = <0x0 0x4e090dc0 0x0 0x200>;
> --
> 2.51.0
>
