Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EE7BDA6AC
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 17:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BAA10E162;
	Tue, 14 Oct 2025 15:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="kvT9Qodk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013014.outbound.protection.outlook.com
 [40.107.162.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D9310E162
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:35:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3XJi6i67LCq9qFqqt+nxONLWy4D/GiJwvdLGY6/PF/VSZAplp4eQfcQnu4JPCCd12fsTvsiwDbLh4ZERiCDt8LjbbbZFmRf6zMPMoGZpllsJJZPV2C26g4ydYKEzed1EHbKv0NgrwmASw8YOQzMbflz8q2xP9Tb26lPzaBvflOFWJbyunSli3nyiveEEdQwo0qdZ2V+fdK0veDVE0HNYIqvChkTrXbgN4e882KElJMT+6/YbL8mhiNqfyh3nmWb4XlqSizkgCgTiqwY9muqsUiB9yYg5wf6TMiRYSPDT7S3Axyn9opO4aw4xqHQ5SJRv5TgujhQI7Jmk1Isi4BvgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Db1s4zc2ZLyKDq8btQkzsNu5P0kbBRecYNovjyMhfks=;
 b=Km1Xr4bL5oLAkTiW3za4qTL8s/9Hd5de0xvJHDX+2+c/iqa8HN4+dZz6AobxP2plzWd6e/5Nd1AdEm/Dw2rvrQEAfACj3zCU/ywwW7IzEvkUNJCanQiSSVjsFemzMQq+IvjDlmoFf7Bhq/f1Wc+vxmZGLSDJn8k5qS2F1txy0CtqIP0Ac36D9/YvBBzeAXjVbHEMu152ldAVZ/gr92KW2Cl89K7rssAFlai1EynqIX012ZfFa5zfIcJXw7wTNLehVYNSCS3uPVrnyd4xuJ+ogOTLrLa/rXZ0FZOlzOPE7dJ4mwj7Op5wCm/7Z8M8enpTU3JkLatHy2UYG8eU9CWWJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Db1s4zc2ZLyKDq8btQkzsNu5P0kbBRecYNovjyMhfks=;
 b=kvT9Qodkgi+dMLugFrWuhhpyhswsxDD1NCayQpu5OghsJBnrXFXsuqn1KsVojEAk0utiD2gYQuI4LWt8K2wZRTbG414b09ViKirCSgXq+Ui0L/tusMdcjs2qqk5TZ7JlHZ8zo2OFwEtE5mcF7WlFeM+HXtA7SjwGwd0n2I4RC8/ilEr0/Hra4hFtKhurdUeNplHfLlgELkP7WNJQo48/ldmVGDe9dbZwdRwA70rHxgvj9WCLbYRqzJPEt1SbRr6LgQWS99rvkpgXpkp8vtQze/oZjwszgN45ruX2GObNxJ+VX84Ti6Oxk9Q+uDoghu2k9AXUk6Mjgqad7Ie4K8bM6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AS8PR04MB7720.eurprd04.prod.outlook.com (2603:10a6:20b:299::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 15:35:01 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 15:35:01 +0000
Date: Tue, 14 Oct 2025 11:34:53 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/imx: dc: Sort bits and bitfields in descending order
Message-ID: <aO5tne2YgKpM+Ijy@lizhi-Precision-Tower-5810>
References: <20251014114148.43922-1-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014114148.43922-1-marek.vasut@mailbox.org>
X-ClientProxiedBy: SJ0PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::14) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AS8PR04MB7720:EE_
X-MS-Office365-Filtering-Correlation-Id: 950a6b8d-78ae-47a9-4a7b-08de0b373d7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|366016|52116014|7416014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GOm006vQ+anmlPeP5a0NeLroYgtc8yDPrmnHykKcjihSRKmC39foalUadnFp?=
 =?us-ascii?Q?3cXWDbqf3poombSeOeXkjZgpwtKTN7HCQGCs/l8a3xYWxYFVg+wRq2tlUGIy?=
 =?us-ascii?Q?nA9yLsTubFuexHbnvnlmAi8jXaqDeOG0VgCKNj3f195zbwz0r0YeeiGmIHYe?=
 =?us-ascii?Q?PIBVlHGsGqUFIFo0cyPIPbB2Bg5LiPmIrNToMyQCbYvakcD2pGMLlREE6xVN?=
 =?us-ascii?Q?HVDrbmqGyDAJbxqkGnpCUARCyQ/pohUjb8hNUprxHLdJyaREcw1rzRP/1zNI?=
 =?us-ascii?Q?VU4hUEdm4phkfXBqsNtovPd2NgpuJ+5cIAuflvOGZIwMYfu7SecVHETiEqw8?=
 =?us-ascii?Q?qFMzXEAmdlIy7nn1cOeiT0hKi3UPY2fI+D8FU0QdcRTQJrtmiJ7IbR9CcGEy?=
 =?us-ascii?Q?z3tZLgBy5+OIC6SvO0cKs5nJd+TaTIR0e2Uywt5zU1ZlqvWm41w9us8ESEPb?=
 =?us-ascii?Q?Gqlkt9iBPaKxU/bX/vO2H087NriFNWK5RERTm36D0VPMSSlQ8sTwDJVWmMUO?=
 =?us-ascii?Q?AGjabpxraJ2nBIn0RssayXI2X/2bSF3lvfbpZGuq5UW2h6UT+pfj6YJhSLfi?=
 =?us-ascii?Q?m8KUsp6Pw23k2KtFbWxC8md72/fpQCtGNdHrVVyoDgZE2HWxJfXfgrALbe8A?=
 =?us-ascii?Q?6NK6Q43WDyPvj/5cAfVo9jfRSwoN6jaW0FNpf6eiOv6ZUjMEgAQhEBzJE6dJ?=
 =?us-ascii?Q?cQXhjAktHlqueEm3K3biovnFT7jMN0fgqwixIx8m6XV5Dn/nLTnWquoNARhQ?=
 =?us-ascii?Q?RdxoIm23MVuP+vjMHoVvXzqKoMoo/ieGzflcNt76M7QCEsK2pearbBbGdqdZ?=
 =?us-ascii?Q?OxDM23A48DuZ/yL0IIt6yp5WrmywIUagltQFSu5WDg59+gUOp8HcnsMnXPvA?=
 =?us-ascii?Q?uYXP8M9ew5mElGZOlkNvpbkRbHuxlxtvEpMITPTNgP/rAZsr4yYPDBvQeb4Q?=
 =?us-ascii?Q?5WXnNGbQmojGA/N7/EN6qg+9Ahn3EfU33guXbK7bX5XaFzqxge6NTA35WWyv?=
 =?us-ascii?Q?gvf9t8nN8yQM1pd9pXck+VqF8ipoQRiT0bTVp4b6bmT0N0JyI5OdaSXHsJ0x?=
 =?us-ascii?Q?/6HKCuujIIo6Bsaw0AudiZ80AfQgY04egSl93Fs+Ahm/DeRKrJomU40dlQkU?=
 =?us-ascii?Q?kx229r2efRCnVvEmO9qPrKFmDcRVntSTLisk9Cpf1INvv7Wpr03dk9EJ1nLk?=
 =?us-ascii?Q?NS2krOUEZA8coQgUH2hSL+xGLrqdr/pBBEs55EEFji8q9ElFa4STXAIOZrtU?=
 =?us-ascii?Q?e+EDCNsWF4mmiOUe+JQU1CJWC2INelhS/zfdd1FH6wqYO6H/PI8tLQB36+3C?=
 =?us-ascii?Q?jE0aPFEwufweOdB16OS62+jH4dNnXIBag+4zDK1VtUP93ai2/4qtQHjtYbNX?=
 =?us-ascii?Q?9x+vrxiaWvYoiFZrhBZECXBb6T5l51hkO+m4+1pXuhvd8uWcnCdhcCA35RAO?=
 =?us-ascii?Q?XFl0bQ4T8n8XcpmLD+xv54hqZNXt7o1y4/gBGzjXUzXqlx5nommXEALV2nak?=
 =?us-ascii?Q?bOsyyVwS30e07dEx289m2RSi7sOTLTNqIXgD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(366016)(52116014)(7416014)(1800799024)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pN83KgjsOx1pIdjP7bdYC7JivMgpu+HeZGOkeygXvG8rim/btFTM7mOhqWb4?=
 =?us-ascii?Q?NVUHIToiYsOytib/WEXp1VramLBIwi8lZeS5JOBGpsVLkDpIRXH/D0wsZqnj?=
 =?us-ascii?Q?NFvYTTSscbNFAXy1f1qsSD2x2HmvoNF82joGnSg2X/r/ebr/ToCuvPxtKZVe?=
 =?us-ascii?Q?0ogdOq2o62bc+fZQtlEJFYSMy8cCuf9AmZNet8bijlOwApIbSfd28/4qJd5O?=
 =?us-ascii?Q?mj4G1KNGC69leQAZiSd8h8dHFEV7dgT84okYSNVS6ubklRYFNn3AQVBIYCtu?=
 =?us-ascii?Q?48AgF6VCmZimSBUYcA6IYD4zcc+6mFIsxCkiLqu2SzLcPRNHLlXuHgVfwOzE?=
 =?us-ascii?Q?xZENu9zR3xaRkSzuT4K7cllX8E57iG0Ko0ri1B/X5TiNWxtUQ7bQ6KabjhgX?=
 =?us-ascii?Q?CdN9dTckt+BX/DF4gRo2/gfKwIPkL0lKJW2WRkkSVd13bdFaCN1/j8DgoPqv?=
 =?us-ascii?Q?Fj7nHz/FSyzq+eg+oOMWM6k5XOUglrg/5dJOsrR4xux6B/qgqdNoikl14dQQ?=
 =?us-ascii?Q?cmUbqgA8qjK8aWqaDy/P2MzqYSGkX94WtImP0Gz0sa7PerYBj0ZZS+JSM8hR?=
 =?us-ascii?Q?BVIjYxIUikV2TdcbCyXFPvP+2E+tAG+fTwKebUp1e6YQp+X6RSjbed2EfIRx?=
 =?us-ascii?Q?YW3jAMVnPpB+MwetCZ95mg+wLqzoRmt7EDVC/cRv6lyjNDoXTUCQNHjIl8JN?=
 =?us-ascii?Q?KB7moxFbwjw3eTjpLgrNF0lT8QFn0oriQbp0UkTTiOPepXj69Nc2BhCnTOgf?=
 =?us-ascii?Q?YygEsIc46Lw97uUpwOxtrguax37a1o2FuZgr7cy843DqV0t+qerhrC6rOFaa?=
 =?us-ascii?Q?eLQnjdpCGQYWccLCaTFwWbxDHDQ8PKphXCdZxMJLgS1OBgURNBb2fAyje7LX?=
 =?us-ascii?Q?LLCPQxmCE7+VF1faz5aQwGdGVb4WZ85UFx8AmrEC8C/bmXuASR9CmO742Xk6?=
 =?us-ascii?Q?FU00yomGs1VRl0tz9Q3U/AdAKOLgPxKJOkfRMxOMV0GS6m9OS2gsvwEHC9+m?=
 =?us-ascii?Q?D2BhIVbMaR9T1AfejIKm/vwowm5DrWfiNLH5MR7/6m5YXwCpmu4lAnFDnnzA?=
 =?us-ascii?Q?fOSKuIpLv8PxrCBPcOwmqtD8WuUlyCXABH9fyEkpfldbEJFFqPXuvUen+7oh?=
 =?us-ascii?Q?7hjAeub4+88f8f2/fVCLlmQrbO/7zr+xiUN+PdA3xX188HWxd5EGrZ8pp7Ky?=
 =?us-ascii?Q?bEtDcvHWVlsao3RSqKS6OD6CD/rexKwmPtaBM0y048jPtwNGRNpQZW0ziyNw?=
 =?us-ascii?Q?lRzKRDmp/txb919WrX4/kSW9jGv0OllRQkFzD/0PAKMY3zJtCIn+Y8wHQ3x5?=
 =?us-ascii?Q?sU2gUe73FSklBwYQA0NHXOtX18fah/y3/jRuY8le7KSZHBkGx1Rhu72woUPM?=
 =?us-ascii?Q?ZGGRvbk7y+Z+t6wDCro+t1tTqHyHtLcYevP8OWCgiHoEAoapYRBsdgy43sgg?=
 =?us-ascii?Q?GuEMazFSSX1HDr+VEgF6DFuij+VzcEE81XNDmV9RcEiKOO9v2dfSGeIx1avw?=
 =?us-ascii?Q?TgEsKhNzzDYuZZnqVx1oJeOWZKsRyrD0V+r6xtOs1iGCGVGiHAdJOHmuJtp8?=
 =?us-ascii?Q?f5D1E4y8sNXfsMJ8/kI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 950a6b8d-78ae-47a9-4a7b-08de0b373d7a
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 15:35:01.6756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7IHCDLY4/IPSpA2DMRaR/+jjGjlfccIT/Bi+Bb2QM/pf1EPfi7rCG0C8B1JnFvYDfi15yr9ralEqz2xy2CN9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7720
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

On Tue, Oct 14, 2025 at 01:41:07PM +0200, Marek Vasut wrote:
> Consistently sort bits and bitfields from highest to lowest bits.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/gpu/drm/imx/dc/dc-ed.c |  8 ++++----
>  drivers/gpu/drm/imx/dc/dc-fg.c |  4 ++--
>  drivers/gpu/drm/imx/dc/dc-fu.c | 10 +++++-----
>  drivers/gpu/drm/imx/dc/dc-fu.h |  4 ++--
>  drivers/gpu/drm/imx/dc/dc-lb.c | 28 ++++++++++++++--------------
>  5 files changed, 27 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
> index 86ecc22d0a554..d42f33d6f3fcc 100644
> --- a/drivers/gpu/drm/imx/dc/dc-ed.c
> +++ b/drivers/gpu/drm/imx/dc/dc-ed.c
> @@ -15,12 +15,12 @@
>  #include "dc-pe.h"
>
>  #define PIXENGCFG_STATIC	0x8
> -#define  POWERDOWN		BIT(4)
> -#define  SYNC_MODE		BIT(8)
> -#define  SINGLE			0
>  #define  DIV_MASK		GENMASK(23, 16)
>  #define  DIV(x)			FIELD_PREP(DIV_MASK, (x))
>  #define  DIV_RESET		0x80
> +#define  SYNC_MODE		BIT(8)
> +#define  SINGLE			0
> +#define  POWERDOWN		BIT(4)
>
>  #define PIXENGCFG_DYNAMIC	0xc
>
> @@ -28,9 +28,9 @@
>  #define  SYNC_TRIGGER		BIT(0)
>
>  #define STATICCONTROL		0x8
> +#define  PERFCOUNTMODE		BIT(12)
>  #define  KICK_MODE		BIT(8)
>  #define  EXTERNAL		BIT(8)
> -#define  PERFCOUNTMODE		BIT(12)
>
>  #define CONTROL			0xc
>  #define  GAMMAAPPLYENABLE	BIT(0)
> diff --git a/drivers/gpu/drm/imx/dc/dc-fg.c b/drivers/gpu/drm/imx/dc/dc-fg.c
> index 7f6c1852bf724..28f372be92472 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fg.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fg.c
> @@ -56,9 +56,9 @@
>
>  #define FGINCTRL		0x5c
>  #define FGINCTRLPANIC		0x60
> -#define  FGDM_MASK		GENMASK(2, 0)
> -#define  ENPRIMALPHA		BIT(3)
>  #define  ENSECALPHA		BIT(4)
> +#define  ENPRIMALPHA		BIT(3)
> +#define  FGDM_MASK		GENMASK(2, 0)
>
>  #define FGCCR			0x64
>  #define  CCGREEN(x)		FIELD_PREP(GENMASK(19, 10), (x))
> diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
> index f94c591c81589..1d8f74babef8a 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fu.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fu.c
> @@ -18,11 +18,11 @@
>  #define BASEADDRESSAUTOUPDATE(x)	FIELD_PREP(BASEADDRESSAUTOUPDATE_MASK, (x))
>
>  /* BURSTBUFFERMANAGEMENT */
> +#define LINEMODE_MASK			BIT(31)
>  #define SETBURSTLENGTH_MASK		GENMASK(12, 8)
>  #define SETBURSTLENGTH(x)		FIELD_PREP(SETBURSTLENGTH_MASK, (x))
>  #define SETNUMBUFFERS_MASK		GENMASK(7, 0)
>  #define SETNUMBUFFERS(x)		FIELD_PREP(SETNUMBUFFERS_MASK, (x))
> -#define LINEMODE_MASK			BIT(31)
>
>  /* SOURCEBUFFERATTRIBUTES */
>  #define BITSPERPIXEL_MASK		GENMASK(21, 16)
> @@ -31,20 +31,20 @@
>  #define STRIDE(x)			FIELD_PREP(STRIDE_MASK, (x) - 1)
>
>  /* SOURCEBUFFERDIMENSION */
> -#define LINEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
>  #define LINECOUNT(x)			FIELD_PREP(GENMASK(29, 16), (x))
> +#define LINEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
>
>  /* LAYEROFFSET */
> -#define LAYERXOFFSET(x)			FIELD_PREP(GENMASK(14, 0), (x))
>  #define LAYERYOFFSET(x)			FIELD_PREP(GENMASK(30, 16), (x))
> +#define LAYERXOFFSET(x)			FIELD_PREP(GENMASK(14, 0), (x))
>
>  /* CLIPWINDOWOFFSET */
> -#define CLIPWINDOWXOFFSET(x)		FIELD_PREP(GENMASK(14, 0), (x))
>  #define CLIPWINDOWYOFFSET(x)		FIELD_PREP(GENMASK(30, 16), (x))
> +#define CLIPWINDOWXOFFSET(x)		FIELD_PREP(GENMASK(14, 0), (x))
>
>  /* CLIPWINDOWDIMENSIONS */
> -#define CLIPWINDOWWIDTH(x)		FIELD_PREP(GENMASK(13, 0), (x) - 1)
>  #define CLIPWINDOWHEIGHT(x)		FIELD_PREP(GENMASK(29, 16), (x) - 1)
> +#define CLIPWINDOWWIDTH(x)		FIELD_PREP(GENMASK(13, 0), (x) - 1)
>
>  enum dc_linemode {
>  	/*
> diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
> index e016e1ea5b4e0..f678de3ca8c0a 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fu.h
> +++ b/drivers/gpu/drm/imx/dc/dc-fu.h
> @@ -33,13 +33,13 @@
>  #define A_SHIFT(x)			FIELD_PREP_CONST(GENMASK(4, 0), (x))
>
>  /* LAYERPROPERTY */
> +#define SOURCEBUFFERENABLE		BIT(31)
>  #define YUVCONVERSIONMODE_MASK		GENMASK(18, 17)
>  #define YUVCONVERSIONMODE(x)		FIELD_PREP(YUVCONVERSIONMODE_MASK, (x))
> -#define SOURCEBUFFERENABLE		BIT(31)
>
>  /* FRAMEDIMENSIONS */
> -#define FRAMEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
>  #define FRAMEHEIGHT(x)			FIELD_PREP(GENMASK(29, 16), (x))
> +#define FRAMEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
>
>  /* CONTROL */
>  #define INPUTSELECT_MASK		GENMASK(4, 3)
> diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
> index 38f966625d382..ca1d714c8d6e6 100644
> --- a/drivers/gpu/drm/imx/dc/dc-lb.c
> +++ b/drivers/gpu/drm/imx/dc/dc-lb.c
> @@ -17,12 +17,12 @@
>  #include "dc-pe.h"
>
>  #define PIXENGCFG_DYNAMIC			0x8
> -#define  PIXENGCFG_DYNAMIC_PRIM_SEL_MASK	GENMASK(5, 0)
> -#define  PIXENGCFG_DYNAMIC_PRIM_SEL(x)		\
> -		FIELD_PREP(PIXENGCFG_DYNAMIC_PRIM_SEL_MASK, (x))
>  #define  PIXENGCFG_DYNAMIC_SEC_SEL_MASK		GENMASK(13, 8)
>  #define  PIXENGCFG_DYNAMIC_SEC_SEL(x)		\
>  		FIELD_PREP(PIXENGCFG_DYNAMIC_SEC_SEL_MASK, (x))
> +#define  PIXENGCFG_DYNAMIC_PRIM_SEL_MASK	GENMASK(5, 0)
> +#define  PIXENGCFG_DYNAMIC_PRIM_SEL(x)		\
> +		FIELD_PREP(PIXENGCFG_DYNAMIC_PRIM_SEL_MASK, (x))
>
>  #define STATICCONTROL				0x8
>  #define  SHDTOKSEL_MASK				GENMASK(4, 3)
> @@ -37,24 +37,24 @@
>  #define BLENDCONTROL				0x10
>  #define  ALPHA_MASK				GENMASK(23, 16)
>  #define  ALPHA(x)				FIELD_PREP(ALPHA_MASK, (x))
> -#define  PRIM_C_BLD_FUNC_MASK			GENMASK(2, 0)
> -#define  PRIM_C_BLD_FUNC(x)			\
> -		FIELD_PREP(PRIM_C_BLD_FUNC_MASK, (x))
> -#define  SEC_C_BLD_FUNC_MASK			GENMASK(6, 4)
> -#define  SEC_C_BLD_FUNC(x)			\
> -		FIELD_PREP(SEC_C_BLD_FUNC_MASK, (x))
> -#define  PRIM_A_BLD_FUNC_MASK			GENMASK(10, 8)
> -#define  PRIM_A_BLD_FUNC(x)			\
> -		FIELD_PREP(PRIM_A_BLD_FUNC_MASK, (x))
>  #define  SEC_A_BLD_FUNC_MASK			GENMASK(14, 12)
>  #define  SEC_A_BLD_FUNC(x)			\
>  		FIELD_PREP(SEC_A_BLD_FUNC_MASK, (x))
> +#define  PRIM_A_BLD_FUNC_MASK			GENMASK(10, 8)
> +#define  PRIM_A_BLD_FUNC(x)			\
> +		FIELD_PREP(PRIM_A_BLD_FUNC_MASK, (x))
> +#define  SEC_C_BLD_FUNC_MASK			GENMASK(6, 4)
> +#define  SEC_C_BLD_FUNC(x)			\
> +		FIELD_PREP(SEC_C_BLD_FUNC_MASK, (x))
> +#define  PRIM_C_BLD_FUNC_MASK			GENMASK(2, 0)
> +#define  PRIM_C_BLD_FUNC(x)			\
> +		FIELD_PREP(PRIM_C_BLD_FUNC_MASK, (x))
>
>  #define POSITION				0x14
> -#define  XPOS_MASK				GENMASK(15, 0)
> -#define  XPOS(x)				FIELD_PREP(XPOS_MASK, (x))
>  #define  YPOS_MASK				GENMASK(31, 16)
>  #define  YPOS(x)				FIELD_PREP(YPOS_MASK, (x))
> +#define  XPOS_MASK				GENMASK(15, 0)
> +#define  XPOS(x)				FIELD_PREP(XPOS_MASK, (x))
>
>  enum dc_lb_blend_func {
>  	DC_LAYERBLEND_BLEND_ZERO,
> --
> 2.51.0
>
