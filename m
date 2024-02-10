Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A97C0850279
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 04:25:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CD510F5A4;
	Sat, 10 Feb 2024 03:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="rxwivDon";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azolkn19012005.outbound.protection.outlook.com [52.103.12.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734A010F35B
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 03:25:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCQT8TiX2DUJkDw79oiFjCdvNqR60dc0Ohuk6MDAM7IY6dAc5+DKqqfEpInwlqH4pgmYeffiuKK5JqWMDk7fZ/OoXRDsEPeXLpI6Nzy4chXzsuYAKk0gxVuAn8hMeuazNvS6ZT9ZTtvzuaPzIJ6O4dJ2T4L0hs6Pxu3/NCmCsvtscCE7Z7VYofz9ACVx+VLWeoOh9fjaXKo2rbt4xUfRCU15CBxM5caL3BRueM1SINziNapVdHKBInPGQG7nWJ9HHyX0ndLn/0sfdahvHnAhBLuFVKECvJ2kLqxI11bRJ+aL3wC53r4Egf+fUNBsKmrx4vXvJVGuSUg7qCFNKPaU5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eTAS2Aw0ACfYoteV0pdRm+xhhCz6a/Sqi9d4A3tNNs=;
 b=hWpILh4LBLeKIH0d7xP8GeCd97CW83UhQAVjoDCcGo5WFKSlFHTiw1riRXy+r1uVjF98uCxMTXqN86vj+8ATlF8XwXpZvH+vtoRotv+gzSlgdSIdteHA+bRBIux+RkAlJl2WKzo6idHWSao97jOUtAWRfx7IKrHUYvJ3MOPBXZRKBIUVGoUSSXFKbNvXS/pXBQXmxLPfP9Z+WL9YJMCdqCRbnS0AZ079rns3LxkRqMxmu1zzqGP6Lxbpx2qKeq299E5ge3EY/uX3uOxcyYhkLTA9roTgwVJsWOZW+3lxB3RRHEb6QmdkKzor8jXuJLeVoCuK57WJ6nBnTWZlPcpTnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eTAS2Aw0ACfYoteV0pdRm+xhhCz6a/Sqi9d4A3tNNs=;
 b=rxwivDon2wi9of/PpfXvLd5q9FyevOZrL7lSgloetJzMgFjQnXJtD+ydqdI5GZXoMrExsfn/GB3EVZQY12tN/HjSSdBraKcpfqh9hdPF8QfAztEIlBArEhdYHmNpvndcnkmiunEJh6G5U9FtwAanyMvDFoLQnji8wNsYxbyhDeDaacNoM7k/qQrvx60LVsBEf3b01wIkBZcYlBaZJyehhbYyljMImX18emx2kMr9GNB269Vp1Vzs1VQ7P2OF/AxAJ9YjKzzAplrOcbCvW7ICyQ1Wd9XjxRPEE3rLVG7qhhmDx8OWf73z8U6q6bm0T7lJO/xe4uqPvyvb98LwRbAXdQ==
Received: from DM4PR05MB9229.namprd05.prod.outlook.com (2603:10b6:8:88::20) by
 SJ0PR05MB7343.namprd05.prod.outlook.com (2603:10b6:a03:284::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.39; Sat, 10 Feb 2024 03:24:59 +0000
Received: from DM4PR05MB9229.namprd05.prod.outlook.com
 ([fe80::7592:72b0:48c8:ec43]) by DM4PR05MB9229.namprd05.prod.outlook.com
 ([fe80::7592:72b0:48c8:ec43%5]) with mapi id 15.20.7249.032; Sat, 10 Feb 2024
 03:24:59 +0000
Date: Fri, 9 Feb 2024 21:24:55 -0600
From: Chris Morgan <macromorgan@hotmail.com>
To: Ao Zhong <hacc1225@gmail.com>
Cc: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/panel: st7703: Fix Panel Initialization for
 Anbernic RG353V-V2
Message-ID: <DM4PR05MB92290198C5B6153941238E37A54A2@DM4PR05MB9229.namprd05.prod.outlook.com>
References: <ZcX5ljSCc7nyr_NE@qwark.sigxcpu.org>
 <20240210002443.5590-1-hacc1225@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240210002443.5590-1-hacc1225@gmail.com>
X-TMN: [vtPS/5BkaIFy5FvFD30HsVW77BH4fYMC]
X-ClientProxiedBy: SN6PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:805:de::18) To DM4PR05MB9229.namprd05.prod.outlook.com
 (2603:10b6:8:88::20)
X-Microsoft-Original-Message-ID: <Zcbsh8nI3xkSjx2t@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR05MB9229:EE_|SJ0PR05MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: dcd5f80f-ec0c-430c-8b61-08dc29e7dc80
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /AbH29gsI3vQZdFpD0lVHb2oZ0+McdS2hhhwoZnvc/v+1BHj+9ZeUW/xzWHJXWkM0e7MaLoOrUlYyFenHEH98yTiBpkoiyXP6aBlLiiaDVAf7TldLqZt9pbPVM9dwYpvL6NSYLq3BdtOFV5SOewzM/DRbQWGTFYHt6C5vKfaWhnMx2Or9Xzd7bKlAMtfSSiO8xbU+Dkf0WukbNqrSiOFaRzR+2DxfVgGB4YdH35SJGzazqzVitzr1E+2vXdySI5fllqigQ/AKHIWb68hgdQA+U2XOfDg1ik9RCic72FBELhTn2FoPivMqaCJLcG6+eiDbY8J5AbgfmDyOOehN9vaMnr4ekIW9LM98Lpnd2qb3JikTE3OhUP5vJQQ6PSi5fUWDi6f+04bVTNXiSNzQFQ0o7YFPBdtPL4fxcCjuF8Jks5C2tDXnUzNXjn7vL2W3tKCkG6dwxrfaN7c1SVoyYXubUNs31e5O5hgR1RIT3Il2c1IGCNMoGzYShIP6/nF9VO7YDA+05dpt6KlSd4yyGZaLaTG7XhK8x00j1jdGASAIXaKkW1XqFWdPLvPvzBUuzacykUMSqolIb9wWLQs2zFBOCNwaTM0bBHrDSEl8vCXR/+6h7mL9NUj4qWpOwXNEO6JK0PZg+mrG3nt1P1FZxrSlA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3HcN9C0nZXo961L8Slz4elOQk8nyztCgSOh7lxdJ4pJt6cayiGCiS02kZa2q?=
 =?us-ascii?Q?d5FSiVHfb38Pb6kFds44+wpC0pWDSCYcOrKghkpWuVtlbC5lqeaK9FTDhjQD?=
 =?us-ascii?Q?tw/urUxKOprPfhB06YCXM5MlAQLBeqbikJszCeaxyqYKYMaCb6jzC+YLxNpz?=
 =?us-ascii?Q?LiJmON6CKZeISf+PC3W5GQtryHnITx+9tX0b6hjL3eNRgTrO1XIciQs1Nusf?=
 =?us-ascii?Q?qZnjdoPg5Nrk4dCmM4WqaZ1pXifSa7eiy6lvZGbrGGDeX76y0p9zZUH2rkwB?=
 =?us-ascii?Q?S62WRuI/FL/aFqc/5+c2qLJ5uVyJ67VHKepeiNwXtdVfzgovi0rzI871Yv75?=
 =?us-ascii?Q?lNzxMAfYxHpaw4m+TnapBm/h5sEPOdvnAuNyJfwjA0K/T3GH+3aWD2U7D8zS?=
 =?us-ascii?Q?Mmq1sekuMeHN5b19Oxn2csHeO81bWMuKpcNYNjC22VzSy1pe1VGqVW/hQv+0?=
 =?us-ascii?Q?ezReru0qa+2YpcoAC2N3kBMtx734t3yFZqa4hrFo+7UKhMF05h6Za/SqvOnF?=
 =?us-ascii?Q?CfLLEfq40dDmu8hmctH1dQNS2hke5EJ4D0LeJfMvDXzOe/TxoOt2FhJqSKVf?=
 =?us-ascii?Q?iWKCClotU6P7v0furggGUdTvB1N9bMupqmbyulKtdY9p36CNKu7NC+F3lbmd?=
 =?us-ascii?Q?uOTIFwhisWl8iLy96kKp05SBs0WEvPoAHL2vlp8sr08J6J1pzZtUGSqrQLoB?=
 =?us-ascii?Q?I/aD96M9koiRcp3wjuMI4Vl7rwMsJzNNDtWM1H4Fjqplygp2SWjwynofgEl6?=
 =?us-ascii?Q?8O8JjVFVVrk1PHPDs9SbWaKl/928TXY6bAK8Uhma23jmbkqjPcSIoyjXiHit?=
 =?us-ascii?Q?nhVRTYJ2qconErKZPw89ZFN14PpbCQVaKG2dg0tfkpNWmlCKLAp1aBEayAEm?=
 =?us-ascii?Q?RSe6d+y5c+8z8vFToJyx9HGBLIpK6EaPE9dVypbjN9yjf+YoWv8JZflI2O8w?=
 =?us-ascii?Q?l8+WHIvnd/IlmfYKVMlXzN84KMEnSKRz2bLgDiw55rjRq7YxPwPcL9CYz18y?=
 =?us-ascii?Q?oN0csTGoST1bS/3q/1tUMSfZKi/d5+esH+tBrpxRa8WZ4QA1dUsPFwVAAN/P?=
 =?us-ascii?Q?xuDK0KwsRXhDCzJMbygbWLsk6z/LdYa6s/D6YVxQGHfc4bj1s1VBtQNTCW7b?=
 =?us-ascii?Q?wlDm06opYJXjjqS8wV5BiCwu7WrfkG0kGCK8rIm7MfWJp95EiB52leM8RBcV?=
 =?us-ascii?Q?p0NGbHjgtAmg9aGFHkayPhdaV0Ieet6IaL6I6UsHKL5zcJiQRXkkl6xkvkg?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4823-7-msonline-outlook-84f76.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd5f80f-ec0c-430c-8b61-08dc29e7dc80
X-MS-Exchange-CrossTenant-AuthSource: DM4PR05MB9229.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2024 03:24:59.6075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB7343
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

On Sat, Feb 10, 2024 at 01:24:43AM +0100, Ao Zhong wrote:
> This patch addresses an issue with the Anbernic RG353V-V2 panel
> initialization that was caused by incorrect parameter. The correct
> initialization sequence was derived by referencing the JELOS (Just
> Enough Linux OS) BSP kernel's device tree for the V2 panel, which is
> identified by the ID "38 21". The relevant device tree can be found at:
> 
> https://github.com/JustEnoughLinuxOS/rk356x-kernel/blob/d4d7335a5ca18fc216a29712d5c6cecfb86147d2/arch/arm64/boot/dts/rockchip/rk3568-evb-rg353v.dtsi#L582
> 
> The proper initialization sequence was further informed by dissecting
> instructions as outlined in the "Rockchip_DRM_Panel_Porting_Guide",
> specifically in Chapter 3.3 of the document.
> 
> https://web.archive.org/web/20240209211932if_/http://download.t-firefly.com/product/Board/Common/Document/Developer/Rockchip_Developer_Guide_DRM_Panel_Porting_CN.pdf
> 
> Upon comparing the initialization sequence within the
> rg353v2_init_sequence function against the device tree in the BSP
> kernel, discrepancies were identified in two instructions. The relevant
> instructions in the device tree are:
> 
> 1. 15 00 03 b6 7f 7f corresponding to the ST7703_CMD_SETVCOM command
>    with parameters 7f 7f
> 2. 39 00 05 b8 26 62 f0 63 corresponding to the ST7703_CMD_SETPOWER_EXT
>    command with parameters 26 62 f0 63
> 
> Adjusting the parameters to match those specified in the BSP kernel's
> device tree allow the panel to initialize correctly.
> 
> Signed-off-by: Ao Zhong <hacc1225@gmail.com>

Tested-by: Chris Morgan <macromorgan@hotmail.com>

> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> index b55bafd1a8be..a346d6c3d283 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -357,8 +357,8 @@ static int rg353v2_init_sequence(struct st7703 *ctx)
>  			       0x28, 0x03, 0xff, 0x00, 0x00, 0x00, 0x00);
>  	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETCYC, 0x80);
>  	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP, 0x0a, 0x0a);
> -	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM, 0x92, 0x92);
> -	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT, 0x25, 0x22,
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM, 0x7f, 0x7f);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT, 0x26, 0x62,
>  			       0xf0, 0x63);
>  	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETMIPI, 0x33, 0x81, 0x05,
>  			       0xf9, 0x0e, 0x0e, 0x20, 0x00, 0x00, 0x00, 0x00,
> -- 
> 2.43.0
> 
