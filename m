Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E23E5BA07FF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 17:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC75910E2AB;
	Thu, 25 Sep 2025 15:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="fO239C6v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011030.outbound.protection.outlook.com [52.101.65.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545A310E2AB
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:58:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRFTlC7KlLQOSsal29Kw8glY1sMdrnpbQoBJBxKXAKOiHJumQXM9AjcHDwk1LfQYj+UjkF4PHtjjvmwuLZhGcKMUc/RN9XZwKS1wBf6w7G/3bFFb7s47NHkfOBNGQBKlYmzI/eXnVi1lOQue+VcEjmpImTjUqwwoks4GB+1szqhQ6b8f1iNxVRMLq8CM2MWtX7RYzDGEXYxUFVnT8VcoPX6aHfqfjWF8zrVJpchxj/+q2dXvFrnYAZ/SLKwlm6yISbBYWE3rgtrFeKckhLwgmFItwCXvcHq8aKC+FBP6hnlt9RaGjaoQ+ufeKrAd6MFEM8eTLlyF4xw2WWtWFaBIZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryoZtRNFq0IkPmH6IfRaao4B1k2Xu4psRRUFUKCD5Dc=;
 b=k+h4ac/nSv1njJD+UmJ1BvtkaqYpLQWNHeTLONhZ1ykecphxpx2IwXAg/PS8pUrGhdHZyiPefhL7j/EOd8e0cgpEyMf0e1iYSa42+0Kh2TkFHpw9gVjx9wUopBdVCQsOeJNAN5mXisFB5yDlHFmqBNFw8am7Vq1z4wWCHZmmX5kX2f5dDpYdBR99dY/5suiix/+lVNBn4gZCsYwarnFbwtjKtCCRgC+8CXBpkMgMkRCKxBdU2JOJLZuzKkdSbtEl3ucfnjDfV5AiFyFHYj2NMxbl79fs38Tqw9PblL1cfFPvhNJwUO8zoCNdMi9lZ+skdBvuIJS8Tnsu+ZLMCQ7EyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryoZtRNFq0IkPmH6IfRaao4B1k2Xu4psRRUFUKCD5Dc=;
 b=fO239C6vF2cPmNijIPWOFtZ3w7e7EZN/E6RPa505EkDoh4MCfDZQCRHvL9BspNPms1XJp0PVFIIovjwzRLLmrBiBS26nWDcMEsQuPXCgQaxoE5/iW61yu2zjr09ys9gmtWHHzHim+PelqTgjj6H9tDfAsF06L0rkM5IhxWCgBHfKPj4IvWhacKx1o6PxJhGBd0G6PcmP+rXO7HwLdyxBjUCTBKlaLI/19K2Vf/9f/N7WtMaetwDuPt36H5mwUfW7Z3k8m4IXbm7uUjBlxYf/5CrnI++i1tj1rQhnZfF/Wp/8zdCwaucKbHZ5ch4WEKf9rxkJbbtW6sSWfVRTiCZbYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DU4PR04MB11727.eurprd04.prod.outlook.com (2603:10a6:10:623::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 15:58:35 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 15:58:35 +0000
Date: Thu, 25 Sep 2025 11:58:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/14] drm/imx: dc: Add DPR channel support
Message-ID: <aNVmoSMW8E9uPiv2@lizhi-Precision-Tower-5810>
References: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
 <20250923-imx8-dc-prefetch-v2-7-5d69dc9ac8b5@nxp.com>
 <aNLnBbSr5BGDvmsG@lizhi-Precision-Tower-5810>
 <eb070dbc-1e8e-437a-b519-69709b3feae4@nxp.com>
 <aNQNn9EwZzCjapB6@lizhi-Precision-Tower-5810>
 <215aff22-7923-4925-afa9-7663cd524b42@nxp.com>
 <aNS9KwQpH1z+TC1s@lizhi-Precision-Tower-5810>
 <3051b1a2-a6da-4b1a-88ac-f27da47a82e9@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3051b1a2-a6da-4b1a-88ac-f27da47a82e9@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0115.namprd03.prod.outlook.com
 (2603:10b6:a03:333::30) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DU4PR04MB11727:EE_
X-MS-Office365-Filtering-Correlation-Id: c3b79f8b-a41c-4600-b5a4-08ddfc4c61e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HdxLs7evCbw0DNOVmfJdn9RdD9cFKo7ExE6VACmtz75GeukzBKj7l6MwxuWX?=
 =?us-ascii?Q?0H1R4t1jxEkIR1Ib0zY8vV3EFmAaDhFPTu2oPEuBUL8pC+4fIwdZ/91FCXik?=
 =?us-ascii?Q?neCJue/ghsp1asBY5ghGJzP1ApMxP5kNckzrTVrM+B3NU+bGSu6Y4j0z41WT?=
 =?us-ascii?Q?9RH77Qd/MlrUjXKEmnnzm/sdS32mBtanf9jaNSPd74fGZ1oUt0mLqaL7mofL?=
 =?us-ascii?Q?RM08k696Tgg86VeMlWliC/9QbrpJ6gjNlBo6cNDjt5GmujB/2y91NQamT6B5?=
 =?us-ascii?Q?OBeDDXPIlvCIsztuAeRKEIh38ufN6wh7fgtjrKr/h9ssGL/cA/SeNw4GvaFz?=
 =?us-ascii?Q?hGKk5g0A50GRqJwjzJGZ6TS37BJ0OxGYsxhLbyyz7PxOuwPat3DX5IjAU/x6?=
 =?us-ascii?Q?5U19fb+Wd6jOpx1TIZdohwn2NwE3Zerhgb3B5zxFW1O3pJBnp+z5M3VbEeAz?=
 =?us-ascii?Q?rdCzQ8SfoXx55D+ryT048pVF5WxAr5r8snZ2wkzvJuo4bAglWTRnPcC5pJCG?=
 =?us-ascii?Q?65H/BL5MvIqdkfEshktmy7QrL2DZnP5gAuIzPRTCzmfyF25WKAN4PimST7b5?=
 =?us-ascii?Q?iLoR9Mi3IOn7qhOsf7uOlQs9sY4aCdNd94PSNRY62IPivo3mJ762n8B6ZYZL?=
 =?us-ascii?Q?sVCVkYKnlFDlVN7hGLppM4hKOsfGUEkJNOS2nAuCZ4eflxULTFX8Wtvmn5zE?=
 =?us-ascii?Q?DK//9ub3+7MYdpRvBk2xM2gr6w4SiyeHHJdWy3oahbLI6KRDwxzLRs0x5iN0?=
 =?us-ascii?Q?SmaXTmBxazCEBVqeKW0g5qpM7VLoyZZfCTYaWZFzfDasulvRHvJDYGZRGNpY?=
 =?us-ascii?Q?b74otoxHZABXtt0MyAG6FZfZW8c/uB3EUVDvEZT+MY+qm3LqOcBMJhaRIVEC?=
 =?us-ascii?Q?ezSYmkDdOc7/K2Fh1FE7JZbKDY4EspjoTk/uVsQg6ZOi10J1Rc+Y/uxyjD9u?=
 =?us-ascii?Q?Kb04Ni7VY4hJmozw5gHxvkjI1YvGl3PHm3LRBnu4Vp0/dfG7Jkjq+LGhY1+o?=
 =?us-ascii?Q?6bxGwr6YSX53+cMBU2PGuNPEQHL4zkCqIJ886fzr7rDKock2XVVrUR8JZuwj?=
 =?us-ascii?Q?0ry5+q4qerCyk469yuvpaBJFJWWPBP9CmHH1f4uBOqIs1gNL/nBSVzhWKDY5?=
 =?us-ascii?Q?y+ua/JMUdMAu+cBG7dwIuH5tpKGj7UQwtbRwgszhXmt+xdOLOLoHJQ4lST8R?=
 =?us-ascii?Q?AwZLu7riGWGphkHAotIYgdyeZjncFVmY0T33/wJ8vMw9XEPnV4tw/lhyoGjU?=
 =?us-ascii?Q?FQtsDRTc6fUhOv6v1LWJPBH1t2spWT8PIGoE1culeyUWB0oNS+NYkaObH7Gf?=
 =?us-ascii?Q?zSSp9xoe5dg8FIbao4sLzaEfClFggY2sPpvg7gyB37DpZfvSg2WDuHdpEUEE?=
 =?us-ascii?Q?A7339qOsfDfya+Eue9DBtzLBV7Z+SU7mL0gajrXkhlnKz4oTxZGnNdltkILm?=
 =?us-ascii?Q?Rh0MXTmEFW4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rwZeeghl+30BMm2u9FnaWrIrrwv3YB0Bzv8vbhwQHdxnCMO8ClclopxsLYh+?=
 =?us-ascii?Q?8MkaC5W6k88wtZj8yG7k/k3ukv2jHuMGB6L2OI3zzxy6zQezUy8xcXEqin57?=
 =?us-ascii?Q?Ci1Qv6Wkidjt1uAmQGIgIlWjejzVmx8IokNblYPJIpXmvwjh76lhXnZIS8kE?=
 =?us-ascii?Q?+1JGlRvy8XIoUHgvyrM+0+CGVWcMAlKZ8rNeYdkgZgM2cluO+X0/6ABnfviP?=
 =?us-ascii?Q?OA1Q245qlFQqICHg+ndnJ2aFRz5JGl/HeIqFavAIuL9QCbWX7f/uT9TVgGDv?=
 =?us-ascii?Q?JkN0VC19UXZBp9cw2nTbyJYwv0ZDBSTY6u2XmrjWIeKJgjvhYAaQweKQ/u1r?=
 =?us-ascii?Q?APkW9+pnDy+K+BUtAlkkEmOB/2NOYdhRyUeL4VCW8QPtL5+p70TzCtVmc2lK?=
 =?us-ascii?Q?R7SmRp4qZqOQUvcQgjRdB/9hRZfKAaN48Yeg9D/h/HCjPn9dW3RVrekDt746?=
 =?us-ascii?Q?A0x4dzX5zvGgyzfAtqqpYCfoBWyY2MnOb5LpdGRs7vsGP7jlfAZItKde+KuS?=
 =?us-ascii?Q?qv2h3Nm9SffMaYrJfjshGEwMeyca6YDzZcjmPA6A9KAOAVWqAj20UMjAqoTj?=
 =?us-ascii?Q?AxFHab8AFaTiN6Ma8HohOK0qpIrRrsW8IGAA1CUpP7K+3kzrjP3MgkanKBwA?=
 =?us-ascii?Q?c4V5Nel2BoOQtwHtXHUODsPKDz+GFR6WH17rIzQYK8LaA1z+QvXoEKeLoZfp?=
 =?us-ascii?Q?ozNBpSHiVnV8DHCwSmHm2yTNTR4KdqfyxT1J3QqXlIs3WDeKLFGZzc7StHM4?=
 =?us-ascii?Q?nlw4+TXZIjOVSTvCrMghE2XZNPEyRvp/SGzfNKTH5v4A1MU/d7Yr9z4h0vbn?=
 =?us-ascii?Q?SOTyeQ8yP8nzcLDtceF5AbISLf9UB6Ux+P3fKWJ2LYgfBaEWqk9qNLVZR5gk?=
 =?us-ascii?Q?MdGJUYVhB9QMrVcKT+rs53avdL5NRWH9laDrdI73VDdDGbRL2dfJKvVS5gqH?=
 =?us-ascii?Q?1BfHvvJCVjjgn06Sla3Fu8riohx1/i2he98c62pExZfevyHebK6hBYhbcFSy?=
 =?us-ascii?Q?yuV9MCX9tNh64IfrIHvMyeYiuetvCQApI++qvSE8lXHjKGCRW5nk5R5Pf1Qs?=
 =?us-ascii?Q?FM5lZoRI84PlYM0xeQCvOTtbo9oU3t6xEKbGSiUYp/Pn0CcpUeeW0G2Wf4N8?=
 =?us-ascii?Q?+XScaPBHOEm8w/lTFueW1nszvfsvdJUDO9QlaNygBZu17+LMXSWuhUgjZXTZ?=
 =?us-ascii?Q?CoxQRwQ1cd7wvmImNa4ElcY5XdexVGp+mb19r4T2mX8R4I20rsPYUsxJHm21?=
 =?us-ascii?Q?ooOsRCvqAfBnWGtQyOJrbIG7H/4e3EwNC+VrERF60nK/czbUoXhLalzJ7qtr?=
 =?us-ascii?Q?IQqXuqW2aKXVnr79ya5iTJX/1VzhAmDNYVFDEwG7vNV2yW1wWv9p/VGqaiTd?=
 =?us-ascii?Q?gNUDtzP3ivxXo5oh3fm7IAoGAHCVw1E1NZhRE+26kQVWPuwGaLTZsGDMe/5l?=
 =?us-ascii?Q?/5/X0IT+0Own/IpYcGGHkSpGI9GmXL8tfW/QD+NUKO8dzhCO9yN/4cVAsAyZ?=
 =?us-ascii?Q?LQNmOzm/PO+i4EwZYfV+krokTpyJ3zxxd5X0Y9Cua5qHfKQiB2mLLgIHW6pm?=
 =?us-ascii?Q?QDtIP9fAbc6oA8/hzF/G8EF0o0tHJ4PGAVEFBPWr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b79f8b-a41c-4600-b5a4-08ddfc4c61e1
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 15:58:35.1424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: koyQJ/0tB8y7KSsCkCBbWaDsPLRE7oTU6WcIhdFhzFpyhR2yQURlIZuxgE5EyDg5a/JcQJqYBNCAhcPb8mfxwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11727
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

On Thu, Sep 25, 2025 at 05:09:24PM +0800, Liu Ying wrote:
> On 09/24/2025, Frank Li wrote:
> > On Thu, Sep 25, 2025 at 10:58:27AM +0800, Liu Ying wrote:
> >> On 09/24/2025, Frank Li wrote:
> >>> On Wed, Sep 24, 2025 at 02:41:50PM +0800, Liu Ying wrote:
> >>>> On 09/23/2025, Frank Li wrote:
> >>>>> On Tue, Sep 23, 2025 at 10:07:57AM +0800, Liu Ying wrote:
> >>>>>> Display Prefetch Resolve Channel(DPRC) is a part of a prefetch engine.
> >>>>>> It fetches display data, transforms it to linear format and stores it
> >>>>>> to DPRC's RTRAM.  PRG, as the other part of a prefetch engine, acts as
> >>>>>> a gasket between the RTRAM controller and a FetchUnit.  Add a platform
> >>>>>> driver to support the DPRC.
> >>>>>>
> >>>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >>>>>> ---
> >>>>>> v2:
> >>>>>> - Manage clocks with bulk interfaces.  (Frank)
> >>>>>> - Sort variables in probe function in reverse Christmas tree fashion.  (Frank)
> >>>>>> ---
> >>>>>>  drivers/gpu/drm/imx/dc/Kconfig   |   1 +
> >>>>>>  drivers/gpu/drm/imx/dc/Makefile  |   6 +-
> >>>>>>  drivers/gpu/drm/imx/dc/dc-dprc.c | 465 +++++++++++++++++++++++++++++++++++++++
> >>>>>>  drivers/gpu/drm/imx/dc/dc-dprc.h |  35 +++
> >>>>>>  drivers/gpu/drm/imx/dc/dc-drv.c  |   1 +
> >>>>>>  drivers/gpu/drm/imx/dc/dc-drv.h  |   1 +
> >>>>>>  drivers/gpu/drm/imx/dc/dc-prg.c  |  12 +
> >>>>>>  drivers/gpu/drm/imx/dc/dc-prg.h  |   4 +
> >>>>>>  8 files changed, 522 insertions(+), 3 deletions(-)
> >>>>>>
> >>>>> ...
> >>>>>> +
> >>>>>> +static void dc_dprc_reset(struct dc_dprc *dprc)
> >>>>>> +{
> >>>>>> +	regmap_write(dprc->reg, SYSTEM_CTRL0 + SET, SOFT_RESET);
> >>>>>> +	fsleep(20);
> >>>>>> +	regmap_write(dprc->reg, SYSTEM_CTRL0 + CLR, SOFT_RESET);
> >>>>>> +	fsleep(20);
> >>>>>> +}
> >>>>>> +
> >>>>>> +static void dc_dprc_enable(struct dc_dprc *dprc)
> >>>>>> +{
> >>>>>> +	dc_prg_enable(dprc->prg);
> >>>>>> +}
> >>>>>> +
> >>>>>> +static void dc_dprc_reg_update(struct dc_dprc *dprc)
> >>>>>> +{
> >>>>>> +	dc_prg_reg_update(dprc->prg);
> >>>>>> +}
> >>>>>> +
> >>>>>> +static void dc_dprc_enable_ctrl_done_irq(struct dc_dprc *dprc)
> >>>>>> +{
> >>>>>> +	guard(spinlock_irqsave)(&dprc->lock);
> >>>>>> +	regmap_write(dprc->reg, IRQ_MASK + CLR, IRQ_DPR_CRTL_DONE);
> >>>>>> +}
> >>>>>> +
> >>>>>> +void dc_dprc_configure(struct dc_dprc *dprc, unsigned int stream_id,
> >>>>>> +		       unsigned int width, unsigned int height,
> >>>>>> +		       unsigned int stride,
> >>>>>> +		       const struct drm_format_info *format,
> >>>>>> +		       dma_addr_t baddr, bool start)
> >>>>>> +{
> >>>>>> +	unsigned int prg_stride = width * format->cpp[0];
> >>>>>> +	unsigned int bpp = format->cpp[0] * 8;
> >>>>>> +	struct device *dev = dprc->dev;
> >>>>>> +	unsigned int p1_w, p1_h;
> >>>>>> +	u32 val;
> >>>>>> +	int ret;
> >>>>>> +
> >>>>>> +	if (start) {
> >>>>>> +		ret = pm_runtime_resume_and_get(dev);
> >>>>>> +		if (ret < 0) {
> >>>>>> +			dev_err(dev, "failed to get RPM: %d\n", ret);
> >>>>>> +			return;
> >>>>>> +		}
> >>>>>> +
> >>>>>> +		dc_dprc_set_stream_id(dprc, stream_id);
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	p1_w = round_up(width, format->cpp[0] == 2 ? 32 : 16);
> >>>>>> +	p1_h = round_up(height, 4);
> >>>>>> +
> >>>>>> +	regmap_write(dprc->reg, FRAME_CTRL0, PITCH(stride));
> >>>>>> +	regmap_write(dprc->reg, FRAME_1P_CTRL0, BYTE_1K);
> >>>>>> +	regmap_write(dprc->reg, FRAME_1P_PIX_X_CTRL, NUM_X_PIX_WIDE(p1_w));
> >>>>>> +	regmap_write(dprc->reg, FRAME_1P_PIX_Y_CTRL, NUM_Y_PIX_HIGH(p1_h));
> >>>>>> +	regmap_write(dprc->reg, FRAME_1P_BASE_ADDR_CTRL0, baddr);
> >>>>>> +	regmap_write(dprc->reg, FRAME_PIX_X_ULC_CTRL, CROP_ULC_X(0));
> >>>>>> +	regmap_write(dprc->reg, FRAME_PIX_Y_ULC_CTRL, CROP_ULC_Y(0));
> >>>>>> +
> >>>>>> +	regmap_write(dprc->reg, RTRAM_CTRL0, THRES_LOW(3) | THRES_HIGH(7));
> >>>>>
> >>>>> Is it okay to access register if start is false since
> >>>>> pm_runtime_resume_and_get() have not called.
> >>>>
> >>>> Yes, it is okay, because dc_dprc_configure() is supposed to be called
> >>>> continously for multiple times(OFC, fine for only once as well).  For
> >>>> the first time, start is true in order to enable the DPRC.  After the
> >>>> first time(DPRC is running), it is called with start == false to do
> >>>> things like page-flip(update frame buffer address).
> >>>>
> >>>>>
> >>>>>> +
> >>>>>> +	val = LINE4 | BUF2;
> >>>>>> +	switch (format->format) {
> >>>>>> +	case DRM_FORMAT_XRGB8888:
> >>>>>> +		/*
> >>>>>> +		 * It turns out pixel components are mapped directly
> >>>>>> +		 * without position change via DPR processing with
> >>>>>> +		 * the following color component configurations.
> >>>>>> +		 * Leave the pixel format to be handled by the
> >>>>>> +		 * display controllers.
> >>>>>> +		 */
> >>>>>> +		val |= A_COMP_SEL(3) | R_COMP_SEL(2) |
> >>>>>> +		       G_COMP_SEL(1) | B_COMP_SEL(0);
> >>>>>> +		val |= PIX_SIZE_32BIT;
> >>>>>> +		break;
> >>>>>> +	default:
> >>>>>> +		dev_err(dev, "unsupported format 0x%08x\n", format->format);
> >>>>>> +		return;
> >>>>>> +	}
> >>>>>> +	regmap_write(dprc->reg, MODE_CTRL0, val);
> >>>>>> +
> >>>>>> +	if (start) {
> >>>>>> +		/* software shadow load for the first frame */
> >>>>>> +		val = SW_SHADOW_LOAD_SEL | SHADOW_LOAD_EN;
> >>>>>> +		regmap_write(dprc->reg, SYSTEM_CTRL0, val);
> >>>>>> +
> >>>>>> +		/* and then, run... */
> >>>>>> +		val |= RUN_EN | REPEAT_EN;
> >>>>>> +		regmap_write(dprc->reg, SYSTEM_CTRL0, val);
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	dc_prg_configure(dprc->prg, width, height, prg_stride, bpp, baddr, start);
> >>>>>> +
> >>>>>> +	dc_dprc_enable(dprc);
> >>>>>> +
> >>>>>> +	dc_dprc_reg_update(dprc);
> >>>>>> +
> >>>>>> +	if (start)
> >>>>>> +		dc_dprc_enable_ctrl_done_irq(dprc);
> >>>>>> +
> >>>>>> +	dev_dbg(dev, "w: %u, h: %u, s: %u, fmt: 0x%08x\n",
> >>>>>> +		width, height, stride, format->format);
> >>>>>> +}
> >>>>>> +
> >>>>>> +void dc_dprc_disable_repeat_en(struct dc_dprc *dprc)
> >>>>>> +{
> >>>>>> +	regmap_write(dprc->reg, SYSTEM_CTRL0 + CLR, REPEAT_EN);
> >>>>>> +	dev_dbg(dprc->dev, "disable REPEAT_EN\n");
> >>>>>> +}
> >>>>>> +
> >>>>>> +void dc_dprc_disable(struct dc_dprc *dprc)
> >>>>>> +{
> >>>>>> +	dc_prg_disable(dprc->prg);
> >>>>>> +
> >>>>>> +	pm_runtime_put(dprc->dev);
> >>>>>
> >>>>> You call pm_runtime_put() in dc_dprc_disable(), but not call
> >>>>> pm_runtime_resume_and_get() at dc_dprc_enable().
> >>>>
> >>>> Yes, dc_dprc_configure()(start == true) is designed to get RPM and
> >>>> dc_dprc_disable() to put RPM.
> >>>>
> >>>> dc_dprc_enable() just sets PRG to non-bypass mode.
> >>>>
> >>>>>
> >>>>> Is it more reasonable to call pm_runtime_resume_and_get() in dc_dprc_enable()
> >>>>>
> >>>>> dc_dprc_enable()
> >>>>> {
> >>>>> 	...
> >>>>> 	pm_runtime_resume_and_get();
> >>>>> }
> >>>>>
> >>>>> dc_dprc_configure()
> >>>>> {
> >>>>> 	unconditional call
> >>>>> 	pm_runtime_resume_and_get()
> >>>>> 	...
> >>>>> 	pm_runtime_put()
> >>>>
> >>>> Here, as RPM is put, it's possible to actually disable the power domain,
> >>>> hence possibly lose all the DPRC configuration done between RPM get and
> >>>> RPM put.  So, this doesn't make sense.
> >>>>
> >>>
> >>> Okay,
> >>>
> >>> dc_dprc_enable()
> >>> {
> >>> 	...
> >>> 	pm_runtime_resume_and_get();
> >>> }
> >>>
> >>> dc_dpdr_disable()
> >>> {
> >>> 	pm_runtime_put();
> >>> }
> >>>
> >>> dc_dprc_configure()
> >>> {
> >>> 	pm_runtime_resume_and_get();
> >>>
> >>> 	if (start)
> >>> 		dc_dprc_enable(dprc);
> >>>
> >>> 	pm_runtime_put();
> >>> }
> >>>
> >>> Look more reasonable for pair get()/put().  after first start, ref count
> >>> will not reduce 0 by pm_runtime_put();.
> >>
> >> Then, as dc_dprc_disable_repeat_en() also accesses DPRC register, it needs
> >> the RPM get/put too?  Same for PRG driver APIs, dc_prg_{enable,disable,
> >> configure,reg_update,shadow_enable} access PRG registers.  Though adding
> >> RPM get/put to all of them should work, I don't see much point in having
> >> the get/put dance.
> >
> > I don't think need change all.
> >
> > you call dc_dprc_configure(start = true) to get pm_runtime_resume_and_get()
> >
> > call dc_dpdr_disable() to put run time pm.
> >
> > Just change to
> > 1. call pm_runtime_resume_and_get() in dc_dprc_enable(), which call only when
> >  (start == true)
> > 2. call pm_runtime_put() in dc_dpdr_disable() /* you already did it */
> >
> > get()/put() pair in dc_dprc_configure() to make sure access register
> > before call dc_dprc_enable().
> >
> > The whole logic should be the same as what your current code.
>
> I got your whole idea and thought it should work, but my point was that
> aside from dc_dprc_configure(), dc_dprc_disable_repeat_en() and those
> PRG driver APIs access registers too, so if dc_dprc_configure() needs the
> RPM get/put, then all of them need too, i.e. dc_dprc_configure() is not
> special.  To make the RPM simpler, I think it makes sense to have
> dc_{dprc,prg}_configure() get RPM when start == true and have
> dc_{dprc,prg}_disable() put RPM, just like patch 6&7 do.

Okay, it is not big issue. we can improve later, especially on going patch
https://lore.kernel.org/all/2399578.ElGaqSPkdT@rafael.j.wysocki/


Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> >
> >>
> >>>
> >>>>>
> >>>>> 	if (start) //look like only need enable when start is true
> >>>>
> >>>> I may add this check in next version.
> >>>>
> >>>>> 		dc_dprc_enable(dprc);
> >>>>> }
> >>>>>
> >>>>>> +
> >>>>>> +	dev_dbg(dprc->dev, "disable\n");
> >>>>>> +}
> >>>>>> +
> >>>>>> +void dc_dprc_disable_at_boot(struct dc_dprc *dprc)
> >>>>>> +{
> >>>>>> +	dc_prg_disable_at_boot(dprc->prg);
> >>>>>> +
> >>>>>> +	clk_bulk_disable_unprepare(dprc->num_clks, dprc->clks);
> >>>>>> +
> >>>>>
> >>>>> you have runtime functions dc_dprc_runtime_suspend()
> >>>>>
> >>>>> If runtime pm status is correct, needn't call clk_bulk_disable_unprepare().
> >>>>>
> >>>>> Look like call pm_runtime_put() here to let runtime pm management clks.
> >>>>>
> >>>>> otherwise, runtime pm state will not match clock enable/disable state.
> >>>>>
> >>>>>> +	dev_dbg(dprc->dev, "disable at boot\n");
> >>>>>> +}
> >>>>>> +
> >>>>>> +static void dc_dprc_ctrl_done_handle(struct dc_dprc *dprc)
> >>>>>> +{
> >>>>>> +	regmap_write(dprc->reg, SYSTEM_CTRL0, REPEAT_EN);
> >>>>>> +
> >>>>>> +	dc_prg_shadow_enable(dprc->prg);
> >>>>>> +
> >>>>>> +	dev_dbg(dprc->dev, "CTRL done handle\n");
> >>>>>> +}
> >>>>>> +
> >>>>> ...
> >>>>>> +
> >>>>>> +static int dc_dprc_probe(struct platform_device *pdev)
> >>>>>> +{
> >>>>>> +	struct device *dev = &pdev->dev;
> >>>>>> +	struct device_node *np = dev->of_node;
> >>>>>> +	struct resource *res;
> >>>>>> +	struct dc_dprc *dprc;
> >>>>>> +	void __iomem *base;
> >>>>>> +	int ret, wrap_irq;
> >>>>>> +
> >>>>>> +	dprc = devm_kzalloc(dev, sizeof(*dprc), GFP_KERNEL);
> >>>>>> +	if (!dprc)
> >>>>>> +		return -ENOMEM;
> >>>>>> +
> >>>>>> +	ret = imx_scu_get_handle(&dprc->ipc_handle);
> >>>>>> +	if (ret)
> >>>>>> +		return dev_err_probe(dev, ret, "failed to get SCU ipc handle\n");
> >>>>>> +
> >>>>>> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> >>>>>> +	if (IS_ERR(base))
> >>>>>> +		return PTR_ERR(base);
> >>>>>> +
> >>>>>> +	dprc->reg = devm_regmap_init_mmio(dev, base, &dc_dprc_regmap_config);
> >>>>>> +	if (IS_ERR(dprc->reg))
> >>>>>> +		return PTR_ERR(dprc->reg);
> >>>>>> +
> >>>>>> +	wrap_irq = platform_get_irq_byname(pdev, "dpr_wrap");
> >>>>>> +	if (wrap_irq < 0)
> >>>>>> +		return -ENODEV;
> >>>>>> +
> >>>>>> +	dprc->num_clks = devm_clk_bulk_get_all(dev, &dprc->clks);
> >>>>>> +	if (dprc->num_clks < 0)
> >>>>>> +		return dev_err_probe(dev, dprc->num_clks, "failed to get clocks\n");
> >>>>>> +
> >>>>>> +	ret = of_property_read_u32(np, "fsl,sc-resource", &dprc->sc_resource);
> >>>>>> +	if (ret) {
> >>>>>> +		dev_err(dev, "failed to get SC resource %d\n", ret);
> >>>>>> +		return ret;
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	dprc->prg = dc_prg_lookup_by_phandle(dev, "fsl,prgs", 0);
> >>>>>> +	if (!dprc->prg)
> >>>>>> +		return dev_err_probe(dev, -EPROBE_DEFER,
> >>>>>> +				     "failed to lookup PRG\n");
> >>>>>> +
> >>>>>> +	dc_prg_set_dprc(dprc->prg, dprc);
> >>>>>> +
> >>>>>> +	dprc->dev = dev;
> >>>>>> +	spin_lock_init(&dprc->lock);
> >>>>>> +
> >>>>>> +	ret = devm_request_irq(dev, wrap_irq, dc_dprc_wrap_irq_handler,
> >>>>>> +			       IRQF_SHARED, dev_name(dev), dprc);
> >>>>>> +	if (ret < 0) {
> >>>>>> +		dev_err(dev, "failed to request dpr_wrap IRQ(%d): %d\n",
> >>>>>> +			wrap_irq, ret);
> >>>>>> +		return ret;
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	dev_set_drvdata(dev, dprc);
> >>>>>> +
> >>>>>> +	ret = devm_pm_runtime_enable(dev);
> >>>>>> +	if (ret)
> >>>>>> +		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
> >>>>>> +
> >>>>>> +	return 0;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static int dc_dprc_runtime_suspend(struct device *dev)
> >>>>>> +{
> >>>>>> +	struct dc_dprc *dprc = dev_get_drvdata(dev);
> >>>>>> +
> >>>>>> +	clk_bulk_disable_unprepare(dprc->num_clks, dprc->clks);
> >>>>>> +
> >>>>>> +	return 0;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static int dc_dprc_runtime_resume(struct device *dev)
> >>>>>> +{
> >>>>>> +	struct dc_dprc *dprc = dev_get_drvdata(dev);
> >>>>>> +	int ret;
> >>>>>> +
> >>>>>> +	ret = clk_bulk_prepare_enable(dprc->num_clks, dprc->clks);
> >>>>>> +	if (ret) {
> >>>>>> +		dev_err(dev, "failed to enable clocks: %d\n", ret);
> >>>>>> +		return ret;
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	dc_dprc_reset(dprc);
> >>>>>> +
> >>>>>> +	/* disable all control IRQs and enable all error IRQs */
> >>>>>> +	guard(spinlock_irqsave)(&dprc->lock);
> >>>>>> +	regmap_write(dprc->reg, IRQ_MASK, IRQ_CTRL_MASK);
> >>>>>
> >>>>> write one 32bit register is atomic, look like needn't spinlock.
> >>>>>
> >>>>> Only other place use dprc->lock is in dc_dprc_enable_ctrl_done_irq(), which
> >>>>> write 32bit clr register.
> >>>>
> >>>> No, dc_dprc_wrap_irq_handler() uses the lock to protect register access too,
> >>>> so it's needed.
> >>>
> >>> guard only protect after it.
> >>
> >> scoped_guard() called by dc_dprc_wrap_irq_handler() protects register access
> >> too.
> >
> > Sorry, I missed this part. I found at original patch.
> >
> > Frank Li
> >
> >>
> >>>
> >>> in dc_dprc_runtime_resume()
> >>>
> >>> +	/* disable all control IRQs and enable all error IRQs */
> >>> +	guard(spinlock_irqsave)(&dprc->lock);
> >>> +	regmap_write(dprc->reg, IRQ_MASK, IRQ_CTRL_MASK);
> >>> +
> >>> +	return 0;
> >>>
> >>> +static void dc_dprc_enable_ctrl_done_irq(struct dc_dprc *dprc)
> >>> +{
> >>> +	guard(spinlock_irqsave)(&dprc->lock);
> >>> +	regmap_write(dprc->reg, IRQ_MASK + CLR, IRQ_DPR_CRTL_DONE);
> >>> +}
> >>>
> >>> How spin lock protect register access?
> >>
> >> With the error and control IRQs, dc_dprc_wrap_irq_handler() and
> >> dc_dprc_enable_ctrl_done_irq() could have concurrent access to IRQ_MASK
> >> registers(though there is SET/CLR/TOG register variants, they have a
> >> shared read-out value).
> >>
> >>>
> >>> 1: IRQ_MASK <= IRQ_CTRL_MASK;
> >>> 2: IRQ_MASK + CLR <= IRQ_DPR_CRTL_DONE;
> >>>
> >>> 2 possilbe result:
> >>> 	1 happen after 2
> >>> 	2 happen after 1
> >>>
> >>> Frank
> >>>
> >>>>
> >>>>>
> >>>>> Frank
> >>>>>> +
> >>>>>> +	return 0;
> >>>>>> +}
> >>>>>> +
> >>>>> ...
> >>>>>> +void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc)
> >>>>>> +{
> >>>>>> +	prg->dprc = dprc;
> >>>>>> +}
> >>>>>> +
> >>>>>> +struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg)
> >>>>>> +{
> >>>>>> +	return prg->dprc;
> >>>>>> +}
> >>>>>> +
> >>>>>>  static int dc_prg_probe(struct platform_device *pdev)
> >>>>>>  {
> >>>>>>  	struct device *dev = &pdev->dev;
> >>>>>> diff --git a/drivers/gpu/drm/imx/dc/dc-prg.h b/drivers/gpu/drm/imx/dc/dc-prg.h
> >>>>>> index 6fd9b050bfa12334720f83ff9ceaf337e3048a54..f29d154f7de597b9d20d5e71303049f6f8b022d6 100644
> >>>>>> --- a/drivers/gpu/drm/imx/dc/dc-prg.h
> >>>>>> +++ b/drivers/gpu/drm/imx/dc/dc-prg.h
> >>>>>> @@ -32,4 +32,8 @@ bool dc_prg_stride_supported(struct dc_prg *prg,
> >>>>>>  struct dc_prg *
> >>>>>>  dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index);
> >>>>>>
> >>>>>> +void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc);
> >>>>>> +
> >>>>>> +struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg);
> >>>>>> +
> >>>>>>  #endif
> >>>>>>
> >>>>>> --
> >>>>>> 2.34.1
> >>>>>>
> >>>>
> >>>>
> >>>> --
> >>>> Regards,
> >>>> Liu Ying
> >>
> >>
> >> --
> >> Regards,
> >> Liu Ying
>
>
> --
> Regards,
> Liu Ying
