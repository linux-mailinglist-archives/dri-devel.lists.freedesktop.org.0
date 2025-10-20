Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0777FBF2354
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 17:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB1510E2AD;
	Mon, 20 Oct 2025 15:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="LXbX2J1+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013035.outbound.protection.outlook.com [40.107.159.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E59D10E2AD
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 15:50:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dEoO5roq0pewojqTY/CwCERPSxTKitk+f1cCG6+QreIX+kELHQ7z9//PC9YU4TDa/l6PuQouyeMpwF9k5xywI4SIY0yisIYISDPdfj5+cTKM1I/usewCtIY1ThGQXLJCqADCcGXUvw0VQFePSXvLX46ZNGKzKpExAm2RTDz7J0jLrnRcTYYx5ExtlL/Yc/3W+c4Y+pGz9M/kBtA3N3kZXaYWv8r4ccbQpKRPH43VUnQhW9kjH/YhAkqW+GlbafNWLqLN4KdYs6FDddwym6d5WPdZFS3eAAOzJnkroYuZU0jwfOTajI8TWhybeMLJbt/Xc8qlwIsWddZO9Xs816ZuKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvF2fReEthmu9QcFanIFRfp/3j/p1+Rt8sWONvQ3o2E=;
 b=exisZIS2VizVJachTWlkZTIm8aoHFHnZuOQMINAvwDI/JekDToEn6fskllHDbhlMJQEe6a0EseAghfJYt/j6XUNpwDx9zlmYPU88za8OLH7Ak2uGfbdBbr2pFlTjUvI2oFIfJq9dWOtG4j5d71kyIoos2IdBnPrmY9wGuzjE2F4ynDe8vsJ6YIW6k0RkN00GXZPytd2pU32zjOZkqmpaxrmF/+oSuwogWL3H+NsIiGnffDtx+J67xEp1OwtoEMdOPswYmYS1QklZT6nJjb6FrCoIwMCDGnjlPkHRckAeKU4Uttvr/AYUlqOidxP25zFJhc6SHwRudGjPRDR3VRFKYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvF2fReEthmu9QcFanIFRfp/3j/p1+Rt8sWONvQ3o2E=;
 b=LXbX2J1+Bpesj9nsvCgZKq66rTrT6PTu1CX16vZ5A9pqJ6xFXwqOhSqgaYL/LD9iYQm/g5GLh3gws7ucHp1qnOjzYQV5KC9iYg/r9LdcpxUDPgiwqcoAHzBHW7BbhRlfUQGnLGwOkAwH3DSKmiUj1o+x8bVLyPtWcOfcwhWWoKCBmBZrU6B8g5t4/L2Q41TMXOVQSr3IyFAdDn+LSyN2qGpRJ6CjzyyVIifCjEkJIBFgHIxfAv67UV3Dyi1uHC1+ItNpdKZ4j+dfjE5Nll362RpWnQxhE53AicOhptXftN9yaw+eWubJ0BTB5+CjieBZG5bjt+PmI+iqrc0dR1JzNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by PAXPR04MB8943.eurprd04.prod.outlook.com (2603:10a6:102:20e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 15:50:15 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9228.014; Mon, 20 Oct 2025
 15:50:15 +0000
Date: Mon, 20 Oct 2025 11:50:08 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>,
 Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2 1/1] drm: lcdif: Use dev_err_probe()
Message-ID: <aPZaMPEcvwtWPWju@lizhi-Precision-Tower-5810>
References: <20251020095846.116202-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020095846.116202-1-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: PH0PR07CA0070.namprd07.prod.outlook.com
 (2603:10b6:510:f::15) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|PAXPR04MB8943:EE_
X-MS-Office365-Filtering-Correlation-Id: 6028827d-bab2-4f4f-ec56-08de0ff05ca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|52116014|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d+9mB+OrYMhRvMnzgSFUYrHfQiErO81X9/av1mybSFiZO+gIjzD1afWq6K7N?=
 =?us-ascii?Q?S7sBXIewFhmvPRjm8ctELpAcsr/dpL/nnddECYo5uJIiqRHSevfEM6ZC/o9f?=
 =?us-ascii?Q?nSviSdGGBft7EVJ/M+mDRe4KcDFybRQHhI+Sd9ydQ3g5LRgUgV3l1ndYL7m4?=
 =?us-ascii?Q?7zVRlhb25jP2gfgV2jpyrSsFQrboaH1d4mr0mAj5skQIvyoZnfF6q9MysFdh?=
 =?us-ascii?Q?PjcTNOltHZjfNLLEtQOw0leRUz3izNTkrlRVNrpjJA6MCUhrKKPvaB7z+RYU?=
 =?us-ascii?Q?v695k88nDLkuhF81MS05idAQU4PxD7t4rLbQSDZWIQEaqPnkzf0fzYetVXyH?=
 =?us-ascii?Q?qwyF0MjYIjfCmGvBCfcIJG+RO6NltLwwwEsGNRd1iVEcinTgSc/nDlEZANat?=
 =?us-ascii?Q?dBwHc4dS3Q1OD1NNkvBRXulWnPoz/DNzmUsckhlbAiNbaZpHo9t1XzjMHkFW?=
 =?us-ascii?Q?o4J53nNAMw7THlxE6T6v71Ccu6ZDAcpJfuPw2rvb5t1Xvwk7g2LrN2i8rM2y?=
 =?us-ascii?Q?Do3PLNEwplpYyt3w2kuaSVhJ8zf/fvx7j9L/m30s1PaRK9BRWhQEbql5Ie10?=
 =?us-ascii?Q?UhJ+qKmR4Ez47ug7UOvcB/exhdxSqRXnQjUJSSPeiiAQnmOzA/yMQOcGmMCM?=
 =?us-ascii?Q?hcwW5vHvCqbENwwvex5l+PTVgooNyYE5IiuMpWjHTQTrMCjkikkgRgPkTldp?=
 =?us-ascii?Q?3mky+TlVz6kEzvloI/5AW+UTgISINTwTY5wPVJ4ava7RN5umhVN+ZlyMMTbQ?=
 =?us-ascii?Q?DaKHw1IRUTOKg3YwsYdvyz7UUSDbxcs3y0+AL3lI7IvIQC5cEly3BIXLW6yf?=
 =?us-ascii?Q?qtoGsrE8/A2we+BR6afafHEMZ0NkO4n5ApHuFzdCJxEXPQb4pEiJc8sPmyp+?=
 =?us-ascii?Q?/uZp7Es0Xa6JgfJuQBQxZDitpKid5sIQtTZjrY7rbL49HWSMKdKeW5KSjpZE?=
 =?us-ascii?Q?KVn+MsbXvsV8/3acN/Lcp7ZIxxL5OJv8oQcpnz5s7BTTMlUtEE9mIXaJLZJp?=
 =?us-ascii?Q?TqNsQrWa25wMjVh6tNFxQRTDdsqwAFIBOvA5O2lY1+5VKcyDJweV6tyyrXfX?=
 =?us-ascii?Q?DhRK7OOdRc8oEjN+Xyqm7ss2E1R6ay4zeqx5DrQ9kMp7sKMBCQsEcxdp7H6C?=
 =?us-ascii?Q?BYshdWgVlABpUyjnkhCwHZFHujCHvrSiAoAVKwVlUGyL0wTxTyIwvOyqJpQG?=
 =?us-ascii?Q?Imty9BWlZWSb/Ly2L4FZYW3j3I42wSGNgigM7iDvPXFJDhFlymOxaQoRyuv5?=
 =?us-ascii?Q?gJv1SRKnrCzp4cIj9rbO6YMXmEN6EJdMssCCB/tKAkAa0kVJO4Rd0/X9NqCz?=
 =?us-ascii?Q?mkOsjWnNoREzUG2F4gXJ7haHDP4ewD/vaKvaU6jH9OAFXoZqTXXXYA/U425J?=
 =?us-ascii?Q?XA5un1qo10PqM2a8y88DmmO3Yv4ICF00EzTi+twVgCtW6C3Ql3PGjuoRz1YA?=
 =?us-ascii?Q?OaNtEYZ6CoRwitXzRnatvRiEHwlsI0mNKJ5nmgzLSOQ7W2ZcYhokzzybH9w0?=
 =?us-ascii?Q?ffBrP9Ty2aFcrT/Hg5eY/P+qlFBLEH1pm98q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(19092799006)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U0DtyTRtWcL/qCcMC2dairYqWKpl9aUA2Saek2CJTPacEThdTI4Q+QCAkp5l?=
 =?us-ascii?Q?qCpxE+Hn9oDanKfj/OgL53IjwXdfnk3N1pVlfS1lyTJWGip3jsbSuSgDKBbe?=
 =?us-ascii?Q?qKt64SUdYuGzemok47LIfzbAbBXfZUauC1AylF0eXlRa/GCA43mghCIm4Zd/?=
 =?us-ascii?Q?TTMrRC3KqMQQuPHEs/zWBQqdF0HBfkTES3iqejKtRzYcHs5KUV6PFzbxH/vm?=
 =?us-ascii?Q?pnMSklC4Pb+Su/03loulPyIbP8A4eGJRagjgJBc3iY82e2ixs1Pzv3Y+zC1o?=
 =?us-ascii?Q?mmMZ1DOlXHnPyJCUvvNtqQdl+w9EJ/pNpRc2MvhKG3EEJCkMXHLExmNlHStn?=
 =?us-ascii?Q?x+dzEb2vbgkpaCSoI3K+n1GsEODj8OA2V7Bvcgjd91xjEPP5/M0yiwtO5iRS?=
 =?us-ascii?Q?uuQeoqu9wg3Ck8DtrWvuFZKKSOP3xkNXrxNEvUbCQL3PgPqRjWs+YENsWih1?=
 =?us-ascii?Q?FCfkxF+5w446tklq2cHsjLBt/QsJmzaocYg7g3bcQSfQv9NpYMfV3a01FG0N?=
 =?us-ascii?Q?RKlKolH8JdIIwzBwhnjevrpSkbgT5aofiGm6K9lrPvwwm5fTyt3am8bM1QrA?=
 =?us-ascii?Q?s+YRfGUqVWgP6Mgfu2IRBwjlWK1l5dv69w5CXqFtDS5JxEqwNsZQQA6zreFF?=
 =?us-ascii?Q?xxZd8XRyVnUF/tbZ66SV4A9krD1aD1GkwWeg1rLP/sBlC9/dGF7QUoLxUwg2?=
 =?us-ascii?Q?eBlDsn5FPsScpedvzDtFyGcQUwc5l5kTpNfZDG6/QmVqY7fDcAygtzwIdRI3?=
 =?us-ascii?Q?4/w7nEIsIyh9ixK8t32Rk9LeynPsdJht1GPAqa6OpxWS5WFl03y3Vaojw6J1?=
 =?us-ascii?Q?7ylbrLsGjEM9G/N8NMsJb5H2rHpP+eOa2Qh8eua7bpoS8wtiMmT8P/P2D3yy?=
 =?us-ascii?Q?rzfjtX4higOtRPjsLrf/2prtQpJxDRHsxyGXggP4XzyTI8sFwSIDbqmJaTsE?=
 =?us-ascii?Q?bwIIP2HEccWPTcKMRYxw6QvSGkSykyx/BreiS8GcMpsJNm+rNPpaHw0187I/?=
 =?us-ascii?Q?Idkejy7U/ImfTr4hGZk/rWk2llWeRfnUwMLBWoKajo9sMKniWmNj85MZO9iC?=
 =?us-ascii?Q?xd4X4QwgDu7+ulnNBShIXbSG1VR41Bgkjibught53sbaOOo2VECdwgcUmYkf?=
 =?us-ascii?Q?8mAE9vdawiRVNd1YpqiTuak2pQNWyJv3/CRLwnylJXv6Lwg4rAaKp1ICNh1E?=
 =?us-ascii?Q?8OFjHhaT3Z491UMFpUiZbiLGhctHhCrD33MW5LvTUiBbs8yhSoiEiYLFyltK?=
 =?us-ascii?Q?wSXQgNnOWxMQwwVTNQ1pPmGPBR9mAgmU/s6GjLGQHqBYEBguOKllhO1ZVufQ?=
 =?us-ascii?Q?1S1aYhg5CQLBKIHckAY82HZvjmwRJ+v6oDSMlPmTE4S1T0KFqJB4/ymnF81w?=
 =?us-ascii?Q?HBu+T0nbBqKJf9T8O6xqp2YyisXKD7BJqyxwS/0CcOgqbLE8gKTMJVbtDJpQ?=
 =?us-ascii?Q?ktClf5cJByOBTBy+RI2sxVOcKCy5iWUEVacie3OPKKrwg7JkWVSdEhTMy++D?=
 =?us-ascii?Q?h9/hxSqTxtAeNZxro1bsIUKP/17BcrEwQ5oKSTZYmH5v/Fb4khwz/eLyOoGA?=
 =?us-ascii?Q?37VL+63Y5MSW+e+7Vk0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6028827d-bab2-4f4f-ec56-08de0ff05ca0
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:50:15.6451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oElR/3yyoaxaww5Xy0E7yrwHlbu+3sd5RgUFlCjQCULi82s59r57xeazN+fOxFOcWn9FQrkQ11LHCmEcdd8Ecg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8943
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

On Mon, Oct 20, 2025 at 11:58:45AM +0200, Alexander Stein wrote:
> Use dev_err_probe() to add a reason for deferred probe. This can
> especially happen on lcdif3 which uses hdmi_tx_phy for 'pix' clock
>
> Reviewed-by: Liu Ying <victor.liu@nxp.com>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Collected Liu's and Marcos' R-b

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> index fcb2a7517377e..47da1d9336b90 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -149,15 +149,17 @@ static int lcdif_load(struct drm_device *drm)
>
>  	lcdif->clk = devm_clk_get(drm->dev, "pix");
>  	if (IS_ERR(lcdif->clk))
> -		return PTR_ERR(lcdif->clk);
> +		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk), "Failed to get pix clock\n");
>
>  	lcdif->clk_axi = devm_clk_get(drm->dev, "axi");
>  	if (IS_ERR(lcdif->clk_axi))
> -		return PTR_ERR(lcdif->clk_axi);
> +		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk_axi),
> +				     "Failed to get axi clock\n");
>
>  	lcdif->clk_disp_axi = devm_clk_get(drm->dev, "disp_axi");
>  	if (IS_ERR(lcdif->clk_disp_axi))
> -		return PTR_ERR(lcdif->clk_disp_axi);
> +		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk_disp_axi),
> +				     "Failed to get disp_axi clock\n");
>
>  	platform_set_drvdata(pdev, drm);
>
> --
> 2.43.0
>
