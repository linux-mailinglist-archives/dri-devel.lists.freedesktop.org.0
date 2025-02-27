Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3E7A486BD
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 18:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE46010E325;
	Thu, 27 Feb 2025 17:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="iJXyc5U9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C71010E040
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 17:35:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gp79x14/JubDA6ZwpwXXqoNPwzFts+aVtFP8Rh5C+BRLRU22qILatNFUQf2wQS8MSwxujPb6WmCnBo0CNViPnOOJPo8h1hPFz7SCz8T7LR/v5Hys5acUJl5WMFbvljAJpFqcjIjGvchL9tElt+1KwRy4dXmTbWiXdgerV/Xzec7ivXyVmSSrHJF/NEqE10JNRWltFFoGfiHVgk14CCF+a3MQl2nhJ3ZTUt+Rm9eWs+qLtVzfCIvaMoyMD/D/ILNv6vzhWFdWAE4sA0CuQKliViLl6hS5ad0D2LnouNjvn2RQc4fnCW/OP47xd6y/DayhmLUxA49y5bBPbj7byVd5mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PW9NvEw2PKcbHrbdBBBAMJ7f3NuJiNQ2LUGcbatiwA=;
 b=sqz2mVdZkhTteSb/apGibZoOsZCMO5/qajRre0wo3WmF/Mvr2E5O+Z1SOSFjlsdh8l8XWUXYjEt2Z1rPVXb2EwL+MMo7CsGojjvdnW9sIxNDnv1SEljT+7cAltMxwovOk2bJBPrxDTl0igu+3HGw+PGLZ/jdyCD8SZDGCkOO743A9dS3AptyuTHO7uPvs1+ZqsX5ltAuZcC0gMdC9Oo7KXyWxaVxVaemTqQLst2M4UTPAJy4cc0+tUAGgzLKonNVhcHCDMGNT0ybrLS9J5e6Pasx2UlhisYDJ6vzLHMGD6pC4wUIoUWcNVor9Ba9EPN5Yqu8xAWQDTcb9My3lhr1Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PW9NvEw2PKcbHrbdBBBAMJ7f3NuJiNQ2LUGcbatiwA=;
 b=iJXyc5U9QLOJjlX+KIVHyhdHC5QtTOEMTtJLMVobVufTnmAiuTiaPB1K6lUIcncgOFY10/S/t2vbKxDdz9SctK/J81D+q8BqoKRjx4J2VCs4gHFHlxYr/I6Rw/FbbNL7sghKXZSa11k05ZtIrWuKQeVzFZUI9qEI06Qspf+2YG3LuQUWTqM7bQkMcULs3v2nM0Y9fhpkFZuxQNqvSo8d//+2oJC906HZEXcS5leBgXoCLM4JXw2YfViaNjuXQUZFxuf/ilG9S0VACtBTYbooNTa/QVOZ7OH5IqgdFLaiEpFMqLettGKD25kqjvJhzt1srqZHn8Ng9QIq1xSRTtNFBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB9791.eurprd04.prod.outlook.com (2603:10a6:10:4ce::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Thu, 27 Feb
 2025 17:35:31 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 17:35:31 +0000
Date: Thu, 27 Feb 2025 12:35:21 -0500
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: Re: [PATCH 8/9] drm/panthor: Add i.MX95 support
Message-ID: <Z8CiWcz86aEE1IH6@lizhi-Precision-Tower-5810>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-9-marex@denx.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227170012.124768-9-marex@denx.de>
X-ClientProxiedBy: SJ0PR03CA0291.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::26) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB9791:EE_
X-MS-Office365-Filtering-Correlation-Id: 5518a419-ec45-4d31-0f7a-08dd575521f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ngleWrRbPhMYheC600krYes0ec9Cu5Dcz7MjAnFGNU/SktBwjc6v6KDObmnA?=
 =?us-ascii?Q?4zyQNS89qKaYiQerp8N1Yy4nxZiRo9++BDtAR/KZWr8rQQ3+m3NaIBS9JC4Q?=
 =?us-ascii?Q?4OW7kDWVuPmIsi0zlzzRHzh2c/MK69F9jeOSr7rSJ+I7IkNfJefvNrNNhcp8?=
 =?us-ascii?Q?bduEgtxOPt91BLbYfNWxZJPsdY1e/MR53b5DphBOHPaPlKglCg571TDv98lf?=
 =?us-ascii?Q?1GTFTvqUvOqd8PHiJSglnxCh4b6GFnUG+s3zLw0dkyjZohmi8iLh9TQEiJds?=
 =?us-ascii?Q?cxA8LpB9hMl8g+tv8i2Lzv/h6UYTQes6CS2yqyR/Z0MHUS+CK4VxlAGbS8uG?=
 =?us-ascii?Q?5JxslEV4ly+ewegmJR9fTjE8EiAnEDKaAscP/edbcnqi9BhjwEhGXks+XfKc?=
 =?us-ascii?Q?VYlSqR2t+nstPmiPMPY/3u1sxZhXGLnaaCvAwH+KGqX3oSQn5HunHsLI8Bd8?=
 =?us-ascii?Q?91YB8XOFIEZaWpuaVhILkbeO2FCcPhvwVJOxubY2+jn+LGho7VUIrBzEmnfd?=
 =?us-ascii?Q?0mLMI01Plse1QaeB5V89LlwL18U1lgTPTBL4TfLt4vUA9COAznW1NNYnF8n1?=
 =?us-ascii?Q?DGL8UuM9Iq/ueeQqKERc/kOerpkWmMj8X4XN150LfHt8HEUZxoH/wpwBYFvZ?=
 =?us-ascii?Q?p306KeXuP+r6c+vJDxmVLA+X3dCoKTyIglWfb4RaWPb2TYa49EWWAH8AnowF?=
 =?us-ascii?Q?bHPhfFZTwHMFXVyjqMV2GDw87YhyYb6K+jhP9q4R8G338Cp05g1rH07ipnlp?=
 =?us-ascii?Q?SUjhdHsAmYpHD3w5F3QJvxJMy3YBDwyM7EZ7lf+RhelUg+Kj28fTEhxo9OZ2?=
 =?us-ascii?Q?MV0k0zFLIQ9wPrD4absPcqSpt5Mrn/gRGCo1VUmlAo85EfNkhs7MqqgbxdWm?=
 =?us-ascii?Q?jQaV8NliUdmmkeA6oYtksHfrPxN7JC34jX3j+NDsbdigRd9fLOYmLRk35PSL?=
 =?us-ascii?Q?7oF3MlWyi9ag8bFAYZ665GRVmRqoqZMKd7rfn4Wb4omM9r9ugqPw5nS2YH3L?=
 =?us-ascii?Q?bVBZZpcov/Wq8bQtw7u0OzMLRO0kFcB6sxL4PHJkAOPn/lrCGW31juN6toF5?=
 =?us-ascii?Q?q15r3dtX/HTcamYEI6x+jluSeH79iVNFV8jrQwOVMfx8qTRWBjHIDzM/Jdaa?=
 =?us-ascii?Q?cxH4yk0dFEcVRC146ImJJmKlGlS4JRtq0aMnrHu1VpMmXbEN/s8/x6g/BNmO?=
 =?us-ascii?Q?lLHXvy+THeB5ZGCXqJkI3EVNY1Wud0QN+7woadMTury2RyxYEk09NUfee/kY?=
 =?us-ascii?Q?fbWeK9p/jo76ShPoUj/ZiFdD9ndJtZVKkn9n7Pes5uad+B6wU5WsK0pwCtx+?=
 =?us-ascii?Q?BTAqkSvzZ9eLk1D92dO+nOQ6mPqeXoX/x2ipBXTrsqztFerp3Dqawykeqqlz?=
 =?us-ascii?Q?sWMrRVY8OeEh9J0frbEBOsygMxgu/cC3AVyf7r2Y8ZidNpqNK5ZCMSkAadr7?=
 =?us-ascii?Q?FUr/518CdzQtflr4PW47ApuvcexAOSJN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2ouCRS7bw9ts8KSChrg7CPpqjG55dQNUPSfXovbuXa2fdVBdWHAZ833gHL/U?=
 =?us-ascii?Q?50MY7pYeL8Ebm/sptBnSOYqRV3e7sWlc7+9VcTK6Q/ON7m2wY6K3X1UUNU3n?=
 =?us-ascii?Q?ZSZxGhNtZdTcXSlSkYsvaf8CH2deqny5pH/BwvnwOn73bPv4S5cjd/WGlRA9?=
 =?us-ascii?Q?tgOu/LcmsuBoDtVO7gdecmnWqlmpQoir7p5y+TfBesGy3bttIGgvkkdysvTO?=
 =?us-ascii?Q?2MijNUTaEwBvJ7+1xX0cCWLfeysc5wiADxe04jcz9tbmqrRU+VtnVwUy0Od/?=
 =?us-ascii?Q?EMFtWxxzaX7W97oxbaJrrrOv6MeZTEw/EP1V1HcXcCwLAmKR6mf6ngXSjbwe?=
 =?us-ascii?Q?fXb/Tlccq1rGkra24U8/E4EJiwClOHa2g2AJ1BIagzzdmPF0In5kC20Oltto?=
 =?us-ascii?Q?Y5KwzYqUzYAENpHKz/dan8wIdc1H1pJUXm6brIzcj1jqsZ1FMa78VBy+M6nt?=
 =?us-ascii?Q?Ma7KdYk6/vjaq8ilj5tF6YeXnTsjgpLuvyOKTQmex8noDmREYA6fQdoilCW7?=
 =?us-ascii?Q?h179EvoTqPDpBRz3ZH0iRT5hYRWMtgQNg69IwreSAVVGC1ZbTkWUnZYNw7HG?=
 =?us-ascii?Q?oefSV0r0SnHDvApqC94ypZpoDVHNbWpTi0l0griwhWhsWifvhbQe7m0+OsYO?=
 =?us-ascii?Q?r7VXTac5nm1YqOxjT//fQ5QBxSBDvwtpx4OWpdwBN1sjzXxUho01NuMeuWpi?=
 =?us-ascii?Q?G8NkPZJWMvNoqcfZa3fF4r15S2CNafqgGUj9Dh5P6keivWNi2FcqWF1DtQl8?=
 =?us-ascii?Q?CJc+oHv4xccGvL1zqQH4VQdyRGTDK/F7UtqRKHteDcJFOLr07HXTaT8z2kxx?=
 =?us-ascii?Q?hxTZ5uYZSen7/18JZPxvRotNoXEVEuzk5EBqn6xc5nkj2ORGN4SwOayxbavs?=
 =?us-ascii?Q?P+lnuvqSrzboN5/K0dEYnUIwn+07PgYoVmU6umz9c5gDcxV171SOAKx1kq0P?=
 =?us-ascii?Q?7Hr1q53vWSfUKaH0dmj9YXUTTDEGk1Buz9NuCbAKoCNAPgdDd6l1s2k66O5H?=
 =?us-ascii?Q?b6oMXUnQivza6fWzpBPj/v611sc8i29QC3rboTL7TCg9CoB/6Sr/2xSKcAxN?=
 =?us-ascii?Q?v2J7xXHY4BYV3bqj8aXQDsxjG3nakfY97cRiS/c6oC905mWyG4NkLWyUwhv1?=
 =?us-ascii?Q?yoWnoNaIWT6tl4hqIJkI2ppjX7xRWfHM6tX8WdmBRg/dVZbiFYg0Lm/B4SNg?=
 =?us-ascii?Q?51sggnwAbam5gwJzCislEd6dPc7DmKCL2POswYAaEcCj7n4/nrUH61f5Rn/5?=
 =?us-ascii?Q?UcJqNpXG90Av/uEIZOUJiDa7RPDGy6/vZGQtLG4PLBLVK3NRPJnbphKDCxvW?=
 =?us-ascii?Q?lx0fSrpY6huTvWrz42EVe+wNg7+m7XQSckh2Xvg+dPzc7sbGu4FwALByEso3?=
 =?us-ascii?Q?iMptKSdHy3GxyitDmIDEP4d8N1Gz5drUZkqautm2bOKHfGnapr8JsRPrDd13?=
 =?us-ascii?Q?ryKp1srInmalHFJBL8lG8eqg5NO+FKNIYEhTLlUQEe5ltCqcHHzj5+OOGhjq?=
 =?us-ascii?Q?tcFzJzqTGMadlsaBgj9RegGHM3ItWSGKq0X1yf44EbCLRp9BqrnXbqMQsBjE?=
 =?us-ascii?Q?0nmc9/s4Ir9zTX2R+nIficHNLe85H3TiCi7aMwGd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5518a419-ec45-4d31-0f7a-08dd575521f5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 17:35:31.0981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KzdNnAIz9qqXECLCTS/oxkRlkYSDXT8x7EZrc/W4sJo+znrBnkHHMKK8KnYZMRjwxZGj6C3KIHT4bwXuRUYWAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9791
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

On Thu, Feb 27, 2025 at 05:58:08PM +0100, Marek Vasut wrote:
> The instance of the GPU populated in Freescale i.MX95 is the
> Mali G310, add support for this variant.
>
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
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
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 1 +
>  drivers/gpu/drm/panthor/panthor_gpu.c | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 06fe46e320738..2504a456d45c4 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1591,6 +1591,7 @@ static struct attribute *panthor_attrs[] = {
>  ATTRIBUTE_GROUPS(panthor);
>
>  static const struct of_device_id dt_match[] = {
> +	{ .compatible = "fsl,imx95-mali" },	/* G310 */
>  	{ .compatible = "rockchip,rk3588-mali" },
>  	{ .compatible = "arm,mali-valhall-csf" },
>  	{}
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 0f07ef7d9aea7..2371ab8e50627 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -67,6 +67,7 @@ struct panthor_model {
>  }
>
>  static const struct panthor_model gpu_models[] = {
> +	GPU_MODEL(g310, 0, 0),	/* NXP i.MX95 */
>  	GPU_MODEL(g610, 10, 7),
>  	{},
>  };
> --
> 2.47.2
>
