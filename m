Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F8BBAA726
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 21:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A671B89ABE;
	Mon, 29 Sep 2025 19:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="IUDYv2Vk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013056.outbound.protection.outlook.com
 [52.101.83.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D539589ABE
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 19:22:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2BgEEuCIlm08MBFAlGFfRHXbyUtIgysafSIpvdZlEJeB1rX3JXTXndrdKBuvWt9TcU6IoYd00kJLk8++5BigerkETYMs4fYmfUeCQPhsCQBSkGy4CTpV7Hco2CBOBNtNAYKX5UzM0yzpRcgC182bIGDFy2DxM6LbgWK+E/636JRW457AMCVy/NBGzdyX/ND3uMV83PXqv9QY4JxybNN4NyomlP9cZ7Hc4vFpRmgPTkSbTrlQQpBFXY/a+0NK4wffO1ZBY6DNccvCMbufGJBEfqWmJ4j7kHzO/SDksmr4xF6YXtSg5wAY2v6qnEmZ5BosIXUu2NtmvsjsUk8RvCKuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9U0Mvy49ci7w0Se9g8/fMfYhAQuYdHJbAUfYI/Axhmc=;
 b=eko0x5Ajqz9M4rLbmkTs84EI+cSMgqEIw2gKNQsFvUlwUZNRNFRE7YD+DwrUMvE20iGH7weRimAnK4sWZsaFN/ULb4ZlPd7vXNmxhzvqwLzzyF2tjvidqDX/6FExbsD0NJkdOzaOTVdOppUWNUdbWIkbtKFil5Iho+VtmGMEFPJqzCLLiGJR5YQJl4jU7wtx3tF6HfUBRDxtidQnNUSBmU8Ojj8qN12BaWwkGtja5pTZCDrNZmtpqeARHfPh/WBF/rpllYczqK2eVgVxSMYbLyod0TMCInRBEyBh4hhMKgucqkQmctMAWF8xRFyBCh1p+KcvF2rHsWjgm1MvL3+Qyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9U0Mvy49ci7w0Se9g8/fMfYhAQuYdHJbAUfYI/Axhmc=;
 b=IUDYv2Vk/PXtDqrTCYNDIDH0VFTMAQoSp53gyexdJjxci73y+Up/wTN6gmxovaksg8Kv5EHnvSJkeHUqIC0gr1NEH/TvxRAHUctjbD/ROiWeqnOhHKVA/YibxPkLMsNEVSdz2uxcG5oqfyd3ek/5zxGSXUlQIku3mXDCEcBJVYkLJGUsW0t4LSPUtkHXw1H/KLAlAz7J5uwInMsaypQpeOa8Mzzuf6MwQqiVlKW4xyDThCwqrnGsrUdvcrBjhjWZOLMvaL/3rEB959XfP6X8grtrtahvASZUpbbjvzlljx622zzK0E8XTfKFad/X7SaY7b2ZbcM7JeV6DxvM5G7H+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by GVXPR04MB11541.eurprd04.prod.outlook.com (2603:10a6:150:2c3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 19:22:44 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 19:22:44 +0000
Date: Mon, 29 Sep 2025 15:22:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>,
 Daniel Stone <daniel@fooishbar.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 2/2] accel: Add Arm Ethos-U NPU driver
Message-ID: <aNrce2up6ZxzMJpo@lizhi-Precision-Tower-5810>
References: <20250926-ethos-v3-0-6bd24373e4f5@kernel.org>
 <20250926-ethos-v3-2-6bd24373e4f5@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926-ethos-v3-2-6bd24373e4f5@kernel.org>
X-ClientProxiedBy: PH8PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::11) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|GVXPR04MB11541:EE_
X-MS-Office365-Filtering-Correlation-Id: 770155eb-83a4-4f75-5bb9-08ddff8d90a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|19092799006|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9mvg0N7p70pbSq9oZMDQVhmm9ytUGzn3k8seKKrOKKzoYHhmJX+YRBdhFoJK?=
 =?us-ascii?Q?7Qf49tDVOvRAO5+hbXsIGsBpAER35pxvY4irjSJxFicYj8gRaQA+nPzJ1eJQ?=
 =?us-ascii?Q?ovisPq0F/dazSRK5nhB/ORx7GRncpP/AiZu/DrjEZfI2nbtytfnGDM0LIl3e?=
 =?us-ascii?Q?t93IDzb4GlA3TranBoICTmuPaVMzjglHS/rE6A+LnwmKMQXV15d1qGXcjpeY?=
 =?us-ascii?Q?86xxM63sSK+g2B8yfX3UpoF3s27a5iThheTfsS0HY6zUh0oInrx3LKsq12Ab?=
 =?us-ascii?Q?WbhYW1IP9itOtEBR/jAnPCu6l+4T6SFhNww40vfDu3BJo2Z8eGXHouAISWgj?=
 =?us-ascii?Q?eVnKvCnwUZo5TK60+0XH29hqmFZU69mJDA/OdawR42TLlSQJboo1XJ/pQ+I6?=
 =?us-ascii?Q?hQ377iWLVXAYkrgjzFZLCN5K3qViFi/W66FktVJ3HQcaaGTM3df7RJQ0IQsy?=
 =?us-ascii?Q?X33TpPH+f3ONZk7AB9aOeZPuvRxrTgaIqSaAhq0HRmy6FmYMh83VAoqzZknK?=
 =?us-ascii?Q?dGmnvkv10rRSGAv9ZGiBweh/22MUsFtWW3yBX3zqWSP5g8GOf3RFl6apk+8U?=
 =?us-ascii?Q?rNsXxK6g+4ShVMTTgxXe/AIUDJ6mSFQFd+aZ8tNT6O3maMuBhYR7+Py/U1bG?=
 =?us-ascii?Q?jKnzVGqGdDdJtCPvBy5LShj2XvgTuGgj3Ry1GE9Q2GqADoetKUDf7ChH9f2v?=
 =?us-ascii?Q?tibTrooKAmHAN/OfDMALS/n3189LupKlV1BHXiROgo5BViTIl0tkuLzOTNdS?=
 =?us-ascii?Q?PXFpHB44aT3vD96XrkcqDLlLI29zN/vYU9D7GTnO/INLIXQi2RW+SZpeUZeM?=
 =?us-ascii?Q?zQAI00yQm7zUsOKJq7xnnVSy3T950eFW0reLVOd0urLjX+NixMq6ytBGJjBK?=
 =?us-ascii?Q?b/iWxmMY2VBS6N7edCK08e2GMTZy01/JBO7VzOQ+LGIw8NR8dDoNkzs+zB1c?=
 =?us-ascii?Q?brhIAQc44VaHQ7sGrlXmRiApK8Vngj8c2t/R2P+D6CKRY67EruicHlwZAl6Q?=
 =?us-ascii?Q?FgjTmlbMilX9pvlmZsKu6rwDFPPUYxeh/PDvGBDtpNbYCwe6+U1ADaZY3AH3?=
 =?us-ascii?Q?MgUnFUTBql4vb2wub7TJYtcPhKIhX3AYdb990Qj7g8OB3+b43Bnyn4ztnOVO?=
 =?us-ascii?Q?BsEcBJjxAK/OApS7s5FC/z+vX+avI70952a9crV/k2bAaoBuZhnZARqsmljZ?=
 =?us-ascii?Q?mXZXXxYquFhl3JLAvjX9QyIzkpXpzv/KCthVcUkD2M+JLmsCHII1XY78JFCu?=
 =?us-ascii?Q?rRrulFOcm+BkaNCbc1WaAFmdWeW7G3GHxmAk7Ntz/riIQvgMHBYoAtlpGk37?=
 =?us-ascii?Q?MZGzwyPjPC2nzMr5yQsYipG0sMJY1qxA6DJQ5MXQGXrC1Q8Jzc2hXtxLZUOc?=
 =?us-ascii?Q?l8/zWVEucPtYxGDZATX1wehZ1P5tKJm2X6ks9+deIiRIPK7JDpLOcrQUDPEZ?=
 =?us-ascii?Q?/1YwQD302wmYiLb0Ae7Kv3hSz2rKfMGuQAvglRV2qaAVFx+0aXyz7A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006)(52116014)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uF8dFqd+YHGmeyb5vH2QwMVzJKdfmbtMjamK0cZLLzV4LxOkSsMdZsjF+EuE?=
 =?us-ascii?Q?4ZX7hQVm1/YmQaMHjcLVRMGxwJKaJKE1QdXGR/z2l7IRwDmiHZbuzjmGeJfv?=
 =?us-ascii?Q?bBOzPgbasYdy5qbERiOVXnRCCSbClU8J6If8LoJImWSHFhythBFL8rYBS8bM?=
 =?us-ascii?Q?bXv1EnvnoVowwjPbM0j4GJ1er9fTAdcj3ZBrtKrt7N3EfnQk4TSQeLIrt+Go?=
 =?us-ascii?Q?gCyj1hRX8ONKmehrXlWeTWqOr8dLjZ0bApUkAmviN4BbfLaWw9C2WZsf7t3A?=
 =?us-ascii?Q?lF7/SEPJOuxsQoeOLtDsmBi46sGV6I9vWBtMzNBsJlmfQ6qJSPYfFDMjNqdB?=
 =?us-ascii?Q?uvbBD2yaUKtjELxKM6OS2XWFs7KGe51YR90SmfjADxaI+Wp1kb/d8QNk4GsM?=
 =?us-ascii?Q?vG+EUxvSShlMYMwKbE42cf4qaY0F/RZU1mSF5s58jyYyQPxI+k9bYPHAqhdQ?=
 =?us-ascii?Q?noXWXbhiD1IKwafICEz05MheKvxiii793jiBRQ8qKnlkHGW/8OzvpzFJa2dz?=
 =?us-ascii?Q?JZQthAYMyOaI4gu2HbSbE1SI7x1lKaDiP7YKKWUI+JJ5qdrKg8lqgZuC8f8Y?=
 =?us-ascii?Q?/1odRIL6XNOxgGCtvIfPN7SVEfc23gxGs7YVz7DsoPDdFUCFTak48EzLh4SJ?=
 =?us-ascii?Q?TOJIUuclzMmusquOzz1nR70ma2iD/q0UIzzF+nY1G4Jm7/xFYrRwoBb0Xr0K?=
 =?us-ascii?Q?2feDu/SFYwzXwgudmWYnG7KzBCSovhb4QGUfklBg9mGLDcFX/acaYSNZ7Aui?=
 =?us-ascii?Q?WVgsIIJjYGnMxTE13GA9qYfk8gorAwUx2rLbDCDzelZh/KQiuNknCTO30F8l?=
 =?us-ascii?Q?7b364BzyFYXOAzrQVDsl9Mo4rk4fcXvSWMbAKrkoekPnCBp2UBu861n/8QSI?=
 =?us-ascii?Q?gLDlqTdKD18aTFEeu7A3JgJq/j8Rkem6xHkDpdkRUdzKPCT1pCO0nwq88I1R?=
 =?us-ascii?Q?+YswLZa1DyazHl7KHtfNXvv3TAM7n5XhFF+p09zwfuvfWYSd6FBiWbVHDBzr?=
 =?us-ascii?Q?iL9rN09vB1zGx7j1OHFOuqKfUhLBQTYV1R/VpdL+2kMuxIch31ZQ6XwbBRiH?=
 =?us-ascii?Q?1/NumDVncclQ2L6KWh/FXXXD3WgcpmcTY16jl7wiAXhoqdpWKd+QC+MLUxSv?=
 =?us-ascii?Q?c2vJTUmT1P7jwRUnQYF/f5UkpmTLuUFROB0MUcLIjPg4Pvu4AYTwr03HB0V3?=
 =?us-ascii?Q?bp5OIq1Yk5s5VpxHdDRlGMB6FevybtXgtK+widcpZXpHCt/voUDFDR56QIVH?=
 =?us-ascii?Q?qg9GozEOVD9ikLUMiZYpyX0M3ZvRlER83Wp0dN+tqbh6TizZer3qkCUmEQd+?=
 =?us-ascii?Q?gxqRYphIw3C4X5Btuvid+S84MkguYRqZzsuC1ipX9jYaCDS3pmsRIp2cmsVd?=
 =?us-ascii?Q?6UAq8EvE43Y+i8v8K079qHU3zO8xLpe4iTo9jdnYMIBzsX9O+Mp38G0UhpyH?=
 =?us-ascii?Q?uC3lDGcO04gpXMEm2BCZs4umSYBm8yJbNaBrnajMKbQzloZ9v+YcdFYa1Pc8?=
 =?us-ascii?Q?FonJRjQ441v7vA08sib7qmvlyp2JSY6GM0UJiu23xPD608UJApGC38iv8Vp5?=
 =?us-ascii?Q?gTRYPBjRMw8IQ1vIuaZpVlGgX6gnhkDgmjcxZlVX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 770155eb-83a4-4f75-5bb9-08ddff8d90a3
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 19:22:44.1285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /jLNo7c+qdSDS+25LutnZzrs1sm1HiWWLVp1YEGitdJK0SP2sdAcDaUsRDs5pOGavD1YLamiwk01VbucCILVtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11541
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

On Fri, Sep 26, 2025 at 03:00:49PM -0500, Rob Herring (Arm) wrote:
> Add a driver for Arm Ethos-U65/U85 NPUs. The Ethos-U NPU has a
> relatively simple interface with single command stream to describe
> buffers, operation settings, and network operations. It supports up to 8
> memory regions (though no h/w bounds on a region). The Ethos NPUs
> are designed to use an SRAM for scratch memory. Region 2 is reserved
> for SRAM (like the downstream driver stack and compiler). Userspace
> doesn't need access to the SRAM.
>
> The h/w has no MMU nor external IOMMU and is a DMA engine which can
> read and write anywhere in memory without h/w bounds checks. The user
> submitted command streams must be validated against the bounds of the
> GEM BOs. This is similar to the VC4 design which validates shaders.
>
> The job submit is based on the rocket driver for the Rockchip NPU
> utilizing the GPU scheduler. It is simpler as there's only 1 core rather
> than 3.
>
> Tested on i.MX93 platform (U65) and FVP (U85) with WIP Mesa Teflon
> support.
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v3:
>  - Rework and improve job submit validation
>  - Rename ethos to ethosu. There was an Ethos-Nxx that's unrelated.
>  - Add missing init for sched_lock mutex
>  - Drop some prints to debug level
>  - Fix i.MX93 SRAM accesses (AXI config)
>  - Add U85 AXI configuration
>  - Print the current cmd value on timeout
>
> v2:
>  - Rebase on v6.17-rc1 adapting to scheduler changes
>  - scheduler: Drop the reset workqueue. According to the scheduler docs,
>    we don't need it since we have a single h/w queue.
>  - scheduler: Rework the timeout handling to continue running if we are
>    making progress.
>  - Reset the NPU on resume so it's in a known state
>  - Add error handling on clk_get() calls
>  - Fix drm_mm splat on module unload. We were missing a put on the
>    cmdstream BO in the scheduler clean-up.
>  - Fix 0-day report needing explicit bitfield.h include
> ---
>  MAINTAINERS                          |   9 +
>  drivers/accel/Kconfig                |   1 +
>  drivers/accel/Makefile               |   1 +
>  drivers/accel/ethosu/Kconfig         |  10 +
>  drivers/accel/ethosu/Makefile        |   4 +
>  drivers/accel/ethosu/ethosu_device.h | 187 +++++++++
>  drivers/accel/ethosu/ethosu_drv.c    | 430 +++++++++++++++++++++
>  drivers/accel/ethosu/ethosu_drv.h    |  15 +
>  drivers/accel/ethosu/ethosu_gem.c    | 709 +++++++++++++++++++++++++++++++++++
>  drivers/accel/ethosu/ethosu_gem.h    |  46 +++
>  drivers/accel/ethosu/ethosu_job.c    | 543 +++++++++++++++++++++++++++
>  drivers/accel/ethosu/ethosu_job.h    |  41 ++
>  include/uapi/drm/ethosu_accel.h      | 262 +++++++++++++
>  13 files changed, 2258 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe168477caa4..b091badec8e4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1991,6 +1991,15 @@ F:	arch/arm/include/asm/arch_timer.h
>  F:	arch/arm64/include/asm/arch_timer.h
>  F:	drivers/clocksource/arm_arch_timer.c
>
> +ARM ETHOS-U NPU DRIVER
> +M:	Rob Herring (Arm) <robh@kernel.org>
> +M:	Tomeu Vizoso <tomeu@tomeuvizoso.net>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	drivers/accel/ethosu/
> +F:	include/uapi/drm/ethosu_accel.h
> +
>  ARM GENERIC INTERRUPT CONTROLLER DRIVERS
>  M:	Marc Zyngier <maz@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
> index 5b9490367a39..a5a4faab221b 100644
> --- a/drivers/accel/Kconfig
> +++ b/drivers/accel/Kconfig
> @@ -25,6 +25,7 @@ menuconfig DRM_ACCEL
>  	  and debugfs).
>
>  source "drivers/accel/amdxdna/Kconfig"
> +source "drivers/accel/ethosu/Kconfig"
>  source "drivers/accel/habanalabs/Kconfig"
>  source "drivers/accel/ivpu/Kconfig"
>  source "drivers/accel/qaic/Kconfig"
> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
> index a301fb6089d4..c759857d64cb 100644
> --- a/drivers/accel/Makefile
> +++ b/drivers/accel/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>
>  obj-$(CONFIG_DRM_ACCEL_AMDXDNA)		+= amdxdna/
> +obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU)	+= ethosu/
>  obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
>  obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
>  obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
...
> +#include <drm/ethosu_accel.h>
> +
> +struct clk;
> +struct gen_pool;
> +
> +#define NPU_REG_ID		0x0000
> +#define NPU_REG_STATUS		0x0004
> +#define NPU_REG_CMD		0x0008
> +#define NPU_REG_RESET		0x000C
> +#define NPU_REG_QBASE		0x0010
> +#define NPU_REG_QBASE_HI	0x0014
> +#define NPU_REG_QREAD		0x0018
> +#define NPU_REG_QCONFIG		0x001C
> +#define NPU_REG_QSIZE		0x0020
> +#define NPU_REG_PROT		0x0024
> +#define NPU_REG_CONFIG		0x0028
> +#define NPU_REG_REGIONCFG	0x003C
> +#define NPU_REG_AXILIMIT0	0x0040		// U65
> +#define NPU_REG_AXILIMIT1	0x0044		// U65
> +#define NPU_REG_AXILIMIT2	0x0048		// U65
> +#define NPU_REG_AXILIMIT3	0x004c		// U65

Nit: can you keep low-case/up-case consistent for Hex value

> +#define NPU_REG_MEM_ATTR0	0x0040		// U85
> +#define NPU_REG_MEM_ATTR1	0x0044		// U85
> +#define NPU_REG_MEM_ATTR2	0x0048		// U85
> +#define NPU_REG_MEM_ATTR3	0x004c		// U85
> +#define NPU_REG_AXI_SRAM	0x0050		// U85
> +#define NPU_REG_AXI_EXT		0x0054		// U85
> +
...
> +
> +#define ETHOSU_SRAM_REGION	2	/* Matching Vela compiler */
> +
> +/**
> + * struct ethosu_device - Ethosu device
> + */
> +struct ethosu_device {
> +	/** @base: Base drm_device. */
> +	struct drm_device base;
> +
> +	/** @iomem: CPU mapping of the registers. */
> +	void __iomem *regs;
> +
> +	void __iomem *sram;
> +	struct gen_pool *srampool;
> +	dma_addr_t sramphys;
> +
> +	struct clk *core_clk;
> +	struct clk *apb_clk;
> +
> +	int irq;
> +
> +	bool coherent;
> +
> +	struct drm_ethosu_npu_info npu_info;
> +
> +	struct ethosu_job *in_flight_job;
> +	struct mutex job_lock;

I remember checkpatch.py require all locks need comments.

> +	spinlock_t fence_lock;
> +
> +	struct drm_gpu_scheduler sched;
> +	struct mutex sched_lock;
> +	u64 fence_context;
> +	u64 emit_seqno;
> +};
> +
> +#define to_ethosu_device(drm_dev) \
> +	((struct ethosu_device *)container_of(drm_dev, struct ethosu_device, base))
> +
> +#endif
> diff --git a/drivers/accel/ethosu/ethosu_drv.c b/drivers/accel/ethosu/ethosu_drv.c
> new file mode 100644
> index 000000000000..b74d803756cf
> --- /dev/null
> +++ b/drivers/accel/ethosu/ethosu_drv.c

...

> +
> +static int ethosu_device_resume(struct device *dev)
> +{
> +	struct ethosu_device *ethosudev = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(ethosudev->core_clk);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(ethosudev->apb_clk);
> +	if (ret)
> +		goto err_disable_core_clk;

use clk bulk api should be simple.

> +
> +	ret = ethosu_reset(ethosudev);
> +	if (!ret)
> +		return 0;
> +
> +err_disable_core_clk:
> +	clk_disable_unprepare(ethosudev->core_clk);
> +	return ret;
> +}
> +
...
> +
> +static int ethosu_init(struct ethosu_device *ethosudev)
> +{
> +	int ret;
> +	u32 id, config;
> +
> +	ret = devm_pm_runtime_enable(ethosudev->base.dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_runtime_resume_and_get(ethosudev->base.dev);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_set_autosuspend_delay(ethosudev->base.dev, 50);
> +	pm_runtime_use_autosuspend(ethosudev->base.dev);

pm_runtime_use_autosuspend() should be after last register read
readl_relaxed(ethosudev->regs + NPU_REG_CONFIG);

incase schedule happen between pm_runtime_use_autosuspend(ethosudev->base.dev);
and readl().

> +
> +	/* If PM is disabled, we need to call ethosu_device_resume() manually. */
> +	if (!IS_ENABLED(CONFIG_PM)) {
> +		ret = ethosu_device_resume(ethosudev->base.dev);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ethosudev->npu_info.id = id = readl_relaxed(ethosudev->regs + NPU_REG_ID);
> +	ethosudev->npu_info.config = config = readl_relaxed(ethosudev->regs + NPU_REG_CONFIG);
> +
> +	ethosu_sram_init(ethosudev);
> +
> +	dev_info(ethosudev->base.dev,
> +		"Ethos-U NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
> +		FIELD_GET(ID_ARCH_MAJOR_MASK, id),
> +		FIELD_GET(ID_ARCH_MINOR_MASK, id),
> +		FIELD_GET(ID_ARCH_PATCH_MASK, id),
> +		FIELD_GET(ID_VER_MAJOR_MASK, id),
> +		FIELD_GET(ID_VER_MINOR_MASK, id),
> +		FIELD_GET(CONFIG_CMD_STREAM_VER_MASK, config),
> +		1 << FIELD_GET(CONFIG_MACS_PER_CC_MASK, config),
> +		ethosudev->npu_info.sram_size / 1024);
> +
> +	return 0;
> +}
> +
> +static int ethosu_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	struct ethosu_device *ethosudev;
> +
> +	ethosudev = devm_drm_dev_alloc(&pdev->dev, &ethosu_drm_driver,
> +				      struct ethosu_device, base);
> +	if (IS_ERR(ethosudev))
> +		return -ENOMEM;
> +	platform_set_drvdata(pdev, ethosudev);
> +
> +	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(40));
> +	if (ret)
> +		return ret;

bigger than 32, dma_set_mask_and_coherent() always return true. Needn't
check return value.

> +
> +	ethosudev->regs = devm_platform_ioremap_resource(pdev, 0);
> +
...
> +
> +/**
> + * ethosu_gem_create_with_handle() - Create a GEM object and attach it to a handle.
> + * @file: DRM file.
> + * @ddev: DRM device.
> + * @size: Size of the GEM object to allocate.
> + * @flags: Combination of drm_ethosu_bo_flags flags.
> + * @handle: Pointer holding the handle pointing to the new GEM object.
> + *
> + * Return: Zero on success
> + */
> +int ethosu_gem_create_with_handle(struct drm_file *file,
> +				 struct drm_device *ddev,
> +				 u64 *size, u32 flags, u32 *handle)
> +{
> +	int ret;
> +	struct drm_gem_dma_object *mem;
> +	struct ethosu_gem_object *bo;

move 'ret' here to keep reverise christmas tree order.

> +
> +	mem = drm_gem_dma_create(ddev, *size);
> +	if (IS_ERR(mem))
> +		return PTR_ERR(mem);
> +
> +	bo = to_ethosu_bo(&mem->base);
> +	bo->flags = flags;
> +
> +	/*
> +	 * Allocate an id of idr table where the obj is registered
> +	 * and handle has the id what user can see.
> +	 */
> +	ret = drm_gem_handle_create(file, &mem->base, handle);
> +	if (!ret)
> +		*size = bo->base.base.size;
> +
> +	/* drop reference from allocate - handle holds it now. */
> +	drm_gem_object_put(&mem->base);
> +
> +	return ret;
> +}
> +
...
> +
> +static void cmd_state_init(struct cmd_state *st)
> +{
> +	/* Initialize to all 1s to detect missing setup */
> +	memset(st, 0xff, sizeof(*st));
> +}
> +
> +static u64 cmd_to_addr(u32 *cmd)
> +{
> +	return ((u64)((cmd[0] & 0xff0000) << 16)) | cmd[1];

will FIELD_PREP helpful?

> +}
> +
> +static u64 dma_length(struct ethosu_validated_cmdstream_info *info,
> +		      struct dma_state *dma_st, struct dma *dma)
> +{
> +	s8 mode = dma_st->mode;
> +	u64 len = dma->len;
> +
> +	if (mode >= 1) {
> +		len += dma->stride[0];
> +		len *= dma_st->size0;
> +	}
> +	if (mode == 2) {
> +		len += dma->stride[1];
> +		len *= dma_st->size1;
> +	}
> +	if (dma->region >= 0)
> +		info->region_size[dma->region] = max(info->region_size[dma->region],
> +						     len + dma->offset);
> +
> +	return len;
> +}
> +
...

> +
> +static void ethosu_job_handle_irq(struct ethosu_device *dev)
> +{
> +	u32 status;
> +
> +	pm_runtime_mark_last_busy(dev->base.dev);

I think don't need pm_runtime_mark_last_busy() here because
pm_runtime_put_autosuspend() already call pm_runtime_mark_last_busy().

only mark last busy without pm_runtime_put() can't affect run time pm
state, still in active state.

> +
> +	status = readl_relaxed(dev->regs + NPU_REG_STATUS);
> +
> +	if (status & (STATUS_BUS_STATUS | STATUS_CMD_PARSE_ERR)) {
> +		dev_err(dev->base.dev, "Error IRQ - %x\n", status);
> +		drm_sched_fault(&dev->sched);
> +		return;
> +	}
> +
> +	scoped_guard(mutex, &dev->job_lock) {
> +		if (dev->in_flight_job) {
> +			dma_fence_signal(dev->in_flight_job->done_fence);
> +			pm_runtime_put_autosuspend(dev->base.dev);
> +			dev->in_flight_job = NULL;
> +		}
> +	}
> +}
> +
...
> +
> +int ethosu_job_init(struct ethosu_device *dev)
> +{
> +	struct drm_sched_init_args args = {
> +		.ops = &ethosu_sched_ops,
> +		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
> +		.credit_limit = 1,
> +		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
> +		.name = dev_name(dev->base.dev),
> +		.dev = dev->base.dev,
> +	};
> +	int ret;
> +
> +	spin_lock_init(&dev->fence_lock);
> +	mutex_init(&dev->job_lock);
> +	mutex_init(&dev->sched_lock);

now perfer use dev_mutex_init().

Frank
> +
> +	dev->irq = platform_get_irq(to_platform_device(dev->base.dev), 0);
> +	if (dev->irq < 0)
> +		return dev->irq;
> +
> +	ret = devm_request_threaded_irq(dev->base.dev, dev->irq,
> +					ethosu_job_irq_handler,
> +					ethosu_job_irq_handler_thread,
> +					IRQF_SHARED, KBUILD_MODNAME,
> +					dev);
> +	if (ret) {
> +		dev_err(dev->base.dev, "failed to request irq");
> +		return ret;
> +	}
> +
> +	dev->fence_context = dma_fence_context_alloc(1);
> +
> +	ret = drm_sched_init(&dev->sched, &args);
> +	if (ret) {
> +		dev_err(dev->base.dev, "Failed to create scheduler: %d.", ret);
> +		goto err_sched;
> +	}
> +
> +	return 0;
> +
> +err_sched:
> +	drm_sched_fini(&dev->sched);
> +	return ret;
> +}
> +
...
> +	DRM_IOCTL_ETHOSU_BO_WAIT =
> +		DRM_IOCTL_ETHOSU(WR, BO_WAIT, bo_wait),
> +	DRM_IOCTL_ETHOSU_BO_MMAP_OFFSET =
> +		DRM_IOCTL_ETHOSU(WR, BO_MMAP_OFFSET, bo_mmap_offset),
> +	DRM_IOCTL_ETHOSU_CMDSTREAM_BO_CREATE =
> +		DRM_IOCTL_ETHOSU(WR, CMDSTREAM_BO_CREATE, cmdstream_bo_create),
> +	DRM_IOCTL_ETHOSU_SUBMIT =
> +		DRM_IOCTL_ETHOSU(WR, SUBMIT, submit),
> +};
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif /* _ETHOSU_DRM_H_ */
>
> --
> 2.51.0
>
