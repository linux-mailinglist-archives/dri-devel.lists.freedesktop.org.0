Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9216B9733F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 20:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9C310E17E;
	Tue, 23 Sep 2025 18:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="C6qrgRWa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011059.outbound.protection.outlook.com [52.101.65.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688A410E17E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 18:32:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7g/WU714y2RYw6MZB5fCFKiEKHaKCUXIUHTb0nU+HeLkpXUijPIBzyoM4svgo9mEmxRCnSqbSFhDjOJYNEzUCYIHp+4vJN8eMBKXhX9dTitBRCwkt6rCV33eHotpv+VHX0QWD6IFCoJrlgAOLgRGdeFRpGGNDhR5SGULgQJfBymzdx2/BvaODCzxvwBR4/6lQkfd81RDlPOqbYtRPZlAPWGgUDOY1GO6iTbx+ZjvgmUAtWMioIl2+XQedK/jf6EJ22kDdYMqi/lNw3N5/9fDWZ7lCaw84mR0YOy1//5Q+KSlXC16pQFWkciC2s4qLMjG+/IcHtkwUui1F6lzBwp1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VhY5vmvdXYFemfSsW9xAc4DQGbFGm0ze/vVzaVLl9A=;
 b=VyICbhAV/1ikSid570JV3Hu5rZerbL0LKmUaOTiS++bo/5s5jV0eoGl47MJ0kQ3U0vUKnbiiemAtZK77mWBjWnD4xU99eF6W/9S1kwhtMSD/O9UvV00w55shMVCftohjaawATJOC5YG1mXR9SxBXvyhM7zyJVuCCQMavXBfmQVZ+4TYazZ0dx65FS0sQkfyoCrmQ9HJrC3QbSi3tbwFteR1h0zxABWD+T4/ZTpdULd9ajznJ9TzhasNuJlCiD2ndNjiPVLuWSwWoNtOm9LGHIKhw1Q8F5Z5V/nUsKOWvxj0VBvnDxR4Y79GdrkwLTW7MnLk2BRvVISdtsNYgES/ihQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VhY5vmvdXYFemfSsW9xAc4DQGbFGm0ze/vVzaVLl9A=;
 b=C6qrgRWauKMhER19HmNqbCfhhXN3VlAB2qjZUTZgwfImC7flBSjsXyy1pK2tAXYvEjKsu/CabuUOFB+OXutuw3y7eGJ2uriBSXJ0liUfofx4Q17FsX2NdD7txYEPLUro0XGO3CzV0S3Kr6OoO+ZjObKHj9zLsO2Q1SXzw+ELxG1BlkZK1BGfVrLKPlUIiIvKZDCR5sdwcFp7pT+z5wUjTrSkrEDvTFDInSw3ER4xAdNQH7VQdltG6hQWPBdbFj5HZeW+2J6B+rvFnWbN8KW/y5tvItJMiyUYGTwgkfgH7Lq+MzpCXGFsQ4PPk3TaMFTepBR8bI1qJRGB21sF4hCivw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by GV4PR04MB11851.eurprd04.prod.outlook.com (2603:10a6:150:2d7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 18:32:11 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 18:32:11 +0000
Date: Tue, 23 Sep 2025 14:32:01 -0400
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
Subject: Re: [PATCH v2 14/14] drm/imx: dc: Use prefetch engine
Message-ID: <aNLnoZsMiWNogUEB@lizhi-Precision-Tower-5810>
References: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
 <20250923-imx8-dc-prefetch-v2-14-5d69dc9ac8b5@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-imx8-dc-prefetch-v2-14-5d69dc9ac8b5@nxp.com>
X-ClientProxiedBy: BY3PR10CA0012.namprd10.prod.outlook.com
 (2603:10b6:a03:255::17) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|GV4PR04MB11851:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b726374-1021-42bb-6a0d-08ddfacf8287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BkxWfcxL5DBqkGIY/XQ8ITcgD09Uun7Qn5osHabv4k6t2tir5GKkfs6kzldx?=
 =?us-ascii?Q?MchfLMP/qUKcos2KW8YyODWPgNv3f3/ObsO7GuZgxHbchPH0O6H5wJxntM91?=
 =?us-ascii?Q?WGEdOiE9ni60CaxjWxVz6mX7hyuBA/pQLTMqjQYPPqmCwhWQwZe+fKKhGHPV?=
 =?us-ascii?Q?rtmXNbKmsurfMgcexFYztRalEyEJELuNXhYIWN6kcLmYt73YciW0shnRQNYw?=
 =?us-ascii?Q?53ZRnuOmeSwTV4ZZkDDgidJEgEv86055DqLYIfOSz7e70jpmd6tbeudnGTK2?=
 =?us-ascii?Q?RKS4mKshaYFDrNoYxjc2Wmt2wDoyGUWTPw3C3Xg4uO69e3dvBURS/BFbERVC?=
 =?us-ascii?Q?9K4W40UTpyWqfcEuWn6J9i/H/7U1mV0kWRtyO/PujQFtDQsv5rmrFTnO9jAV?=
 =?us-ascii?Q?NgsDf9M5z0xMw6jofye+7xEiVl4eOeRFo/ehjI+CGb5Euj9/0rvA1wlDdtFq?=
 =?us-ascii?Q?L77MA4M/TQsr732hXDIk/eI7x1fk2wq/FAcv+NtdiAkuu828znoA7RwLw8xw?=
 =?us-ascii?Q?GhJkZXvXVLAC9Cg5OsWGNzCymUmaj+ko3+C6NWwCdWwGsX8u9ZGdBd827AsK?=
 =?us-ascii?Q?+3HdOScEMt+F2zsUQH1EQ5uzedUHnSQVS/EeDL56Avi95MyZ56w6HfZk0cyx?=
 =?us-ascii?Q?w+L1bBfJVV80PkM/+Q7JsUgjxP+eWtpt2VV943J0/+L7jG71nG5Mi2d0J63d?=
 =?us-ascii?Q?/DTZ0YqWWwOaNZn3m9fPfgFgxbvPNb6/Ad0TyHaXzwEwmgzbnlokNWugbCV7?=
 =?us-ascii?Q?W+I3dxzFKHjTUDoc7fkIzy8V84XKer8424YLvxBgcI1RkKV5KxMKjjnEI6FC?=
 =?us-ascii?Q?/LUGFErVfLzYNNvQiP+VQ1ZecHCV3YaNZyagrl3UUds+yJl25YkabzIDyZzO?=
 =?us-ascii?Q?TFlx/vGn2l2P5xSDYlhoeIK/UZYaFvNl2/RlvhR2XoaK7gGNJ25ScS2joGZR?=
 =?us-ascii?Q?tvb8XHBrocwB32pA3aXTmPY4b3eG9Esv7rfmNz7tEub9zM3eJYjRngYpOOWt?=
 =?us-ascii?Q?2DmLXUIicD6vTLQCea65PgkjcW/s4cLhR/4GnmSJWfzvhiyx6tZvL1fR9EkQ?=
 =?us-ascii?Q?DoY2XB5XxZSahMPcOKWA2DfTlREWLRyzhGpVJmoxZL+hmLOYvH14qGg9km1N?=
 =?us-ascii?Q?0XoFH+XN+hIDo1k65zvmnNQIIqktrMLlldsPb3/UgGwP4usMrANniyT6NBEE?=
 =?us-ascii?Q?ZdR4arM42m48fQDsBFystO/NJgQHEI7ubssp788mlkYh/SKu1rqyfaiAugKj?=
 =?us-ascii?Q?ghrRoDNjm5GUJx8bhWJ2oi3UrRx9NXLrKUq+XjJuXxjGp03/OdA/IVZWkuO9?=
 =?us-ascii?Q?EdwnDaLKGk4bUHGTrhukZjS17lloSegTKv+Jerkl69yp+Jy1DgWA2nyHA+CM?=
 =?us-ascii?Q?hbpoqHZtbX1LllqagwlhKNhshLAfY83CT2swIzR5vj2ej6ns3NFDwI6dPqXH?=
 =?us-ascii?Q?rt0Mi/irwQoVZe1vN+53YOzN4tzgihVsnI0TZAcvcDTakx/o/5PqyQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MqdU3HX+Mc2ty7DQRej0HpnZEiA+5xi4WPKDH9D7LA36Bo6MxAOwVJ7DKBK6?=
 =?us-ascii?Q?iRqVZ8tpaOmsHQfQ/zmkNjXZUMKBBuBTCj9mz18y6+cmySKpA6J8qDK6G//j?=
 =?us-ascii?Q?DwcamJ2S7GurK0IpqtSIPNjajko7TVhyMyGhKKZ9ipVPa5uX3VDQw8yPZFKE?=
 =?us-ascii?Q?K5DL0HyciBq+3imtScgePpO/2P0PG1wKSE0X9i1ArlNhuASfRxqhOLrmv3F0?=
 =?us-ascii?Q?XeCkr9k/YahC1UfyA9gN1je/zZ0teddu4oKrC6Rk+v0CB5iT9IwXmvrKzQnQ?=
 =?us-ascii?Q?Y1ePLk50fNbXQBZQ0e/dWXLTGdZfRjBSzM23X6cUhnAiEDA+mggX6h5Nmodh?=
 =?us-ascii?Q?9gnKSlFqGX1uhQ5Hkt89B0ZvjTcpPRuDnnGGChoSxk03B4cri8wQyu+SnHii?=
 =?us-ascii?Q?pJcGVhN4zXv4n9q8UBcbaV4hxfCVuIWmP39M1xLWVuPQ0ACHGiqlVTcPwoFu?=
 =?us-ascii?Q?T0jnygWd4j7nQd++J/k55fl0dyrst7Agolm/aPtTPkWJvIfOdIMqX31qazsu?=
 =?us-ascii?Q?zquzdIGrFyUyBb8Rda3p/PqFvDRvzropTYmllh9CO5RmlqpWZ+TtPHww01cM?=
 =?us-ascii?Q?t7/33awgny+VkztTWiAjktXwTcJkF4ZplJcfbnPkRmYskL6uhn74VRmIBSDT?=
 =?us-ascii?Q?UdjxlX4eP2FL6VQF+wy9gq/mgMkwuKWPM/GAUk5cYH26buOSGVY5Ow06lrfW?=
 =?us-ascii?Q?KIbSgcxMdKnkj9aYVVvtRKNmYYTfGvPHVnC16YTRHdWELDcl4jDOlItYADDC?=
 =?us-ascii?Q?ZrSdJKDUUCVLmSYUtdfWP7+dc5JGB6o1QAv7Ut+j2X9sjKs3GmxDUNUpT4pS?=
 =?us-ascii?Q?+ef8DeRtGi58geh9zcRjMZOkCu9AfZUTngP1ibBcCkKf/1J2IN0nzQtmo3vz?=
 =?us-ascii?Q?6u7Yk+UTSEIPqQYLPE9xzb4cC6HzLnovoV6MXcrXi1kmB8woyWLYpN/DIZMn?=
 =?us-ascii?Q?9Cr3S8oNCsHSUmwSIk+N90bmlFNp/uzENmMmD+ga6FCIaULTrw8WBHE+TYFq?=
 =?us-ascii?Q?BZTeSIxILjULoZ1oWSgWDR8DwzXU5Mqit1Btm8Jqbcs6kNczLNqYwFZgVwHQ?=
 =?us-ascii?Q?vjrB1IO9YTB2aj5SjWTcpa+DpORQWb3c089JVhC74bSgd+6JJxhCTTMEdHwc?=
 =?us-ascii?Q?HxFK4eiGeIzK9gLguhhJRUXco7JFf6ID4BVIT/PejdtFfoFGJ5HTaHlbpa5z?=
 =?us-ascii?Q?YDca/brsxEwtzH4+4j1L40DPjSWnBIxMtdS4hUQSzS6CaY0UPF7pTAskSzgD?=
 =?us-ascii?Q?HxXuOrAxXrpBtqD5fogBkijmndCbht3bRnsCIkWmPuiA9iXhA1u/iGTEdyHF?=
 =?us-ascii?Q?cy4o6NDVYFDc/w+vSS2KEdLE3E9Rifd1W5FGDkFOLOYWgtd+Zkt+aTR0hKQA?=
 =?us-ascii?Q?pyC/WgdYrarkOSEieHsVIznOQwxYKwQeTSbdBeuUHNqh4ARsYhuuPmm/soAV?=
 =?us-ascii?Q?DQObDQD2QWwsFWAvN1BVYWKPQ/dgx1gm+gH4ZjbOPbrYRDjObkxR2imEkqLh?=
 =?us-ascii?Q?jyRlRZCLmwMdT9r8zCs4yn3DEhNd0JilJDHexWDRnIuJfyk+hADKaRO7AiJu?=
 =?us-ascii?Q?Hi7V6HvIgahLW4svGog=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b726374-1021-42bb-6a0d-08ddfacf8287
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 18:32:11.4792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZYJ9YyZCZ2lgbZ181Ww/RMG7QgqnY2SvF8752R8p5bS/PD7QG8bRlw0mNZPijabVanKbC8m2x3c8o97pLgMzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11851
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

On Tue, Sep 23, 2025 at 10:08:04AM +0800, Liu Ying wrote:
> One prefetch engine consists of one DPR channel and one or two PRGs.
> Each PRG handles one planar in a pixel format.  Every FetchUnit used
> by KMS may attach to a PRG and hence use a prefetch engine.  So, to
> simplify driver code, always use prefetch engines for FetchUnits in
> KMS driver and avoid supporting bypassing them.  Aside from configuring
> and disabling a prefetch engine along with a FetchUnit for atomic
> commits, properly disable the prefetch engine at boot and adapt burst
> size/stride fixup requirements from PRG in FetchUnit driver.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/gpu/drm/imx/dc/dc-crtc.c  | 139 +++++++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/imx/dc/dc-fu.c    |  27 +++++++-
>  drivers/gpu/drm/imx/dc/dc-fu.h    |   2 +-
>  drivers/gpu/drm/imx/dc/dc-kms.h   |   5 ++
>  drivers/gpu/drm/imx/dc/dc-plane.c |  46 +++++++++++--
>  5 files changed, 197 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
> index 9e9e86cd5202bcb0bb4d5627dbcefcc3f4e2ead0..4c7aab360616cb1c84c31c83f16df703b1c2c6d7 100644
> --- a/drivers/gpu/drm/imx/dc/dc-crtc.c
> +++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
> @@ -25,6 +25,7 @@
>  #include <drm/drm_vblank.h>
>
>  #include "dc-de.h"
> +#include "dc-dprc.h"
>  #include "dc-drv.h"
>  #include "dc-kms.h"
>  #include "dc-pe.h"
> @@ -204,7 +205,13 @@ dc_crtc_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state)
>  				drm_atomic_get_old_crtc_state(state, crtc);
>  	struct drm_crtc_state *new_crtc_state =
>  				drm_atomic_get_new_crtc_state(state, crtc);
> +	struct drm_plane_state *old_plane_state =
> +			drm_atomic_get_old_plane_state(state, crtc->primary);
> +	struct drm_plane_state *new_plane_state =
> +			drm_atomic_get_new_plane_state(state, crtc->primary);
> +	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
>  	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
> +	bool disabling_plane;
>  	int idx;
>
>  	if (drm_atomic_crtc_needs_modeset(new_crtc_state) ||
> @@ -216,13 +223,40 @@ dc_crtc_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state)
>
>  	enable_irq(dc_crtc->irq_ed_cont_shdload);
>
> -	/* flush plane update out to display */
> -	dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
> +	disabling_plane = drm_atomic_plane_disabling(old_plane_state,
> +						     new_plane_state);
> +
> +	if (disabling_plane) {
> +		unsigned long flags;
> +
> +		dc_crtc_dbg(crtc, "disabling plane\n");
> +
> +		/*
> +		 * Don't relinquish CPU until DPRC REPEAT_EN is disabled and
> +		 * sync is triggered.
> +		 */
> +		local_irq_save(flags);
> +		preempt_disable();
> +
> +		DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
> +		dc_dprc_disable_repeat_en(dc_plane->fu->dprc);
> +		/* flush plane update out to display */
> +		dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
> +
> +		local_irq_restore(flags);
> +		preempt_enable();
> +	} else {
> +		/* flush plane update out to display */
> +		dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
> +	}
>
>  	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdload_done);
>
>  	disable_irq(dc_crtc->irq_ed_cont_shdload);
>
> +	if (disabling_plane)
> +		dc_dprc_disable(dc_plane->fu->dprc);
> +
>  	DC_CRTC_CHECK_FRAMEGEN_FIFO(dc_crtc->fg);
>
>  	drm_dev_exit(idx);
> @@ -320,14 +354,33 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>  	dc_crtc_queue_state_event(new_crtc_state);
>  }
>
> -static inline void __dc_crtc_disable_fg(struct drm_crtc *crtc)
> +static inline void
> +__dc_crtc_disable_fg_along_with_dprc_repeat_en(struct drm_crtc *crtc)
>  {
> +	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
>  	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
> +	unsigned long flags;
>
> -	enable_irq(dc_crtc->irq_dec_seqcomplete);
> +	/* Don't relinquish CPU until DPRC REPEAT_EN is disabled. */
> +	local_irq_save(flags);
> +	preempt_disable();
> +
> +	/*
> +	 * Sync to FrameGen frame index moving so that
> +	 * FrameGen can be disabled in the next frame.
> +	 */
> +	DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
>  	dc_fg_disable(dc_crtc->fg);
> -	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
> -	disable_irq(dc_crtc->irq_dec_seqcomplete);
> +	/*
> +	 * There is one frame leftover after FrameGen disablement.
> +	 * Sync to FrameGen frame index moving so that DPRC REPEAT_EN
> +	 * can be disabled in the next frame.
> +	 */
> +	DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
> +	dc_dprc_disable_repeat_en(dc_plane->fu->dprc);
> +
> +	local_irq_restore(flags);
> +	preempt_enable();
>  }
>
>  static void
> @@ -335,14 +388,29 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>  {
>  	struct drm_crtc_state *new_crtc_state =
>  				drm_atomic_get_new_crtc_state(state, crtc);
> +	struct drm_crtc_state *old_crtc_state =
> +				drm_atomic_get_old_crtc_state(state, crtc);
>  	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
> +	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
>  	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
>  	int idx, ret;
>
>  	if (!drm_dev_enter(crtc->dev, &idx))
>  		goto out;
>
> -	__dc_crtc_disable_fg(crtc);
> +	enable_irq(dc_crtc->irq_dec_seqcomplete);
> +
> +	if (old_crtc_state->plane_mask)
> +		__dc_crtc_disable_fg_along_with_dprc_repeat_en(crtc);
> +	else
> +		dc_fg_disable(dc_crtc->fg);
> +
> +	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
> +	disable_irq(dc_crtc->irq_dec_seqcomplete);
> +
> +	if (old_crtc_state->plane_mask)
> +		dc_dprc_disable(dc_plane->fu->dprc);
> +
>  	dc_fg_disable_clock(dc_crtc->fg);
>
>  	/* request pixel engine power-off as plane is off too */
> @@ -373,7 +441,10 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>  void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
>  {
>  	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
> +	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
>  	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
> +	enum dc_link_id ed_src, lb_sec;
> +	bool disable_dprc = false;
>  	int ret;
>
>  	ret = pm_runtime_resume_and_get(dc_crtc->de->dev);
> @@ -383,13 +454,53 @@ void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
>  		return;
>  	}
>
> +	ret = pm_runtime_resume_and_get(dc_drm->pe->dev);
> +	if (ret) {
> +		dc_crtc_err(crtc, "failed to get DC pixel engine RPM: %d\n",
> +			    ret);
> +		goto out1;
> +	}
> +
>  	if (!dc_fg_wait_for_frame_index_moving(dc_crtc->fg)) {
>  		dc_crtc_dbg(crtc, "FrameGen frame index isn't moving\n");
> -		goto out;
> +		goto out2;
> +	}
> +
> +	ret = dc_ed_pec_src_sel_get(dc_crtc->ed_cont, &ed_src);
> +	if (ret) {
> +		dc_crtc_err(crtc, "failed to get content ExtDst's source\n");
> +		goto out2;
> +	}
> +
> +	if (ed_src == LINK_ID_CONSTFRAME0 || ed_src == LINK_ID_CONSTFRAME1)
> +		goto disable;
> +
> +	ret = dc_lb_pec_dynamic_sec_sel_get(dc_plane->lb, &lb_sec);
> +	if (ret) {
> +		dc_crtc_err(crtc,
> +			    "failed to get primary plane LayerBlend secondary source\n");
> +		goto out2;
>  	}
>
> -	dc_crtc_dbg(crtc, "disabling at boot\n");
> -	__dc_crtc_disable_fg(crtc);
> +	disable_dprc = true;
> +
> +disable:
> +	enable_irq(dc_crtc->irq_dec_seqcomplete);
> +
> +	if (disable_dprc) {
> +		dc_crtc_dbg(crtc, "disabling along with DPRC REPEAT_EN at boot\n");
> +		__dc_crtc_disable_fg_along_with_dprc_repeat_en(crtc);
> +	} else {
> +		dc_crtc_dbg(crtc, "disabling at boot\n");
> +		dc_fg_disable(dc_crtc->fg);
> +	}
> +
> +	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
> +	disable_irq(dc_crtc->irq_dec_seqcomplete);
> +
> +	if (disable_dprc)
> +		dc_dprc_disable_at_boot(dc_plane->fu->dprc);
> +
>  	dc_fg_disable_clock(dc_crtc->fg);
>
>  	if (!dc_drm->pe_clk_axi_disabled) {
> @@ -397,7 +508,13 @@ void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
>  		dc_drm->pe_clk_axi_disabled = true;
>  	}
>
> -out:
> +out2:
> +	ret = pm_runtime_put(dc_drm->pe->dev);
> +	if (ret)
> +		dc_crtc_err(crtc, "failed to put DC pixel engine RPM: %d\n",
> +			    ret);
> +
> +out1:
>  	ret = pm_runtime_put(dc_crtc->de->dev);
>  	if (ret < 0)
>  		dc_crtc_err(crtc, "failed to put DC display engine RPM: %d\n",
> diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
> index 47d436abb65157de7cab74565e44b199be76de52..bc439c3520d45f894c0afab5b3d52f2f3309c2e2 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fu.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fu.c
> @@ -124,13 +124,28 @@ static inline void dc_fu_set_numbuffers(struct dc_fu *fu, unsigned int num)
>  			  SETNUMBUFFERS_MASK, SETNUMBUFFERS(num));
>  }
>
> -static void dc_fu_set_burstlength(struct dc_fu *fu, dma_addr_t baddr)
> +static unsigned int dc_fu_burst_size_fixup(dma_addr_t baddr)
>  {
> -	unsigned int burst_size, burst_length;
> +	unsigned int burst_size;
>
>  	burst_size = 1 << __ffs(baddr);
>  	burst_size = round_up(burst_size, 8);
>  	burst_size = min(burst_size, 128U);
> +
> +	return burst_size;
> +}
> +
> +static unsigned int
> +dc_fu_stride_fixup(unsigned int stride, unsigned int burst_size)
> +{
> +	return round_up(stride, burst_size);
> +}
> +
> +static void dc_fu_set_burstlength(struct dc_fu *fu, dma_addr_t baddr)
> +{
> +	unsigned int burst_size, burst_length;
> +
> +	burst_size = dc_fu_burst_size_fixup(baddr);
>  	burst_length = burst_size / 8;
>
>  	regmap_write_bits(fu->reg_cfg, BURSTBUFFERMANAGEMENT,
> @@ -150,8 +165,14 @@ void dc_fu_set_src_bpp(struct dc_fu *fu, enum dc_fu_frac frac, unsigned int bpp)
>  }
>
>  static void dc_fu_set_src_stride(struct dc_fu *fu, enum dc_fu_frac frac,
> -				 unsigned int stride)
> +				 unsigned int width, int bpp, dma_addr_t baddr)
>  {
> +	unsigned int burst_size = dc_fu_burst_size_fixup(baddr);
> +	unsigned int stride;
> +
> +	stride = width * (bpp / 8);
> +	stride = dc_fu_stride_fixup(stride, burst_size);
> +
>  	regmap_write_bits(fu->reg_cfg, fu->reg_sourcebufferattributes[frac],
>  			  STRIDE_MASK, STRIDE(stride));
>  }
> diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
> index 44b9497e53580589a05bcb180eb2312ea4449da4..09570955a5b92105ef7010f71fa615a1cefc9b7e 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fu.h
> +++ b/drivers/gpu/drm/imx/dc/dc-fu.h
> @@ -87,7 +87,7 @@ struct dc_fu_ops {
>  	void (*set_baseaddress)(struct dc_fu *fu, enum dc_fu_frac frac,
>  				dma_addr_t baddr);
>  	void (*set_src_stride)(struct dc_fu *fu, enum dc_fu_frac frac,
> -			       unsigned int stride);
> +			       unsigned int width, int bpp, dma_addr_t baddr);
>  	void (*set_src_buf_dimensions)(struct dc_fu *fu, enum dc_fu_frac frac,
>  				       int w, int h);
>  	void (*set_fmt)(struct dc_fu *fu, enum dc_fu_frac frac,
> diff --git a/drivers/gpu/drm/imx/dc/dc-kms.h b/drivers/gpu/drm/imx/dc/dc-kms.h
> index a25d47eebd28792e4b53b4ecc89907ce00430c2c..8b45b21a6f8a7e6e6ed2563499753200bdd42ebc 100644
> --- a/drivers/gpu/drm/imx/dc/dc-kms.h
> +++ b/drivers/gpu/drm/imx/dc/dc-kms.h
> @@ -130,4 +130,9 @@ struct dc_plane {
>  	struct dc_ed *ed;
>  };
>
> +static inline struct dc_plane *to_dc_plane(struct drm_plane *plane)
> +{
> +	return container_of(plane, struct dc_plane, base);
> +}
> +
>  #endif /* __DC_KMS_H__ */
> diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
> index d8b946fb90de638da2bf4667307f11b06f4e77f5..8ef754492b2dcb5d986a63f516328f8d2512c7b6 100644
> --- a/drivers/gpu/drm/imx/dc/dc-plane.c
> +++ b/drivers/gpu/drm/imx/dc/dc-plane.c
> @@ -17,6 +17,7 @@
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_print.h>
>
> +#include "dc-dprc.h"
>  #include "dc-drv.h"
>  #include "dc-fu.h"
>  #include "dc-kms.h"
> @@ -44,11 +45,6 @@ static const struct drm_plane_funcs dc_plane_funcs = {
>  	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
>  };
>
> -static inline struct dc_plane *to_dc_plane(struct drm_plane *plane)
> -{
> -	return container_of(plane, struct dc_plane, base);
> -}
> -
>  static int dc_plane_check_max_source_resolution(struct drm_plane_state *state)
>  {
>  	int src_h = drm_rect_height(&state->src) >> 16;
> @@ -88,6 +84,28 @@ static int dc_plane_check_fb(struct drm_plane_state *state)
>  	return 0;
>  }
>
> +static int dc_plane_check_dprc(struct drm_plane_state *state)
> +{
> +	struct dc_plane *dplane = to_dc_plane(state->plane);
> +	struct drm_framebuffer *fb = state->fb;
> +	dma_addr_t baseaddr = drm_fb_dma_get_gem_addr(fb, state, 0);
> +	struct dc_dprc *dprc = dplane->fu->dprc;
> +	u32 src_w = drm_rect_width(&state->src) >> 16;
> +
> +	if (!dc_dprc_rtram_width_supported(dprc, src_w)) {
> +		dc_plane_dbg(state->plane, "bad RTRAM width for DPRC\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!dc_dprc_stride_supported(dprc, fb->pitches[0], src_w, fb->format,
> +				      baseaddr)) {
> +		dc_plane_dbg(state->plane, "fb bad pitches[0] for DPRC\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static int
>  dc_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
>  {
> @@ -123,7 +141,11 @@ dc_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
>  	if (ret)
>  		return ret;
>
> -	return dc_plane_check_fb(plane_state);
> +	ret = dc_plane_check_fb(plane_state);
> +	if (ret)
> +		return ret;
> +
> +	return dc_plane_check_dprc(plane_state);
>  }
>
>  static void
> @@ -131,6 +153,12 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
>  {
>  	struct drm_plane_state *new_state =
>  				drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_plane_state *old_state =
> +				drm_atomic_get_old_plane_state(state, plane);
> +	struct drm_crtc_state *new_crtc_state =
> +				drm_atomic_get_new_crtc_state(state, new_state->crtc);
> +	bool needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> +	bool prefetch_start = needs_modeset || !old_state->fb;
>  	struct dc_plane *dplane = to_dc_plane(plane);
>  	struct drm_framebuffer *fb = new_state->fb;
>  	const struct dc_fu_ops *fu_ops;
> @@ -152,7 +180,8 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
>
>  	fu_ops->set_layerblend(fu, lb);
>  	fu_ops->set_burstlength(fu, baseaddr);
> -	fu_ops->set_src_stride(fu, DC_FETCHUNIT_FRAC0, fb->pitches[0]);
> +	fu_ops->set_src_stride(fu, DC_FETCHUNIT_FRAC0, src_w,
> +			       fb->format->cpp[0] * 8, baseaddr);
>  	fu_ops->set_src_buf_dimensions(fu, DC_FETCHUNIT_FRAC0, src_w, src_h);
>  	fu_ops->set_fmt(fu, DC_FETCHUNIT_FRAC0, fb->format);
>  	fu_ops->set_framedimensions(fu, src_w, src_h);
> @@ -161,6 +190,9 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
>
>  	dc_plane_dbg(plane, "uses %s\n", fu_ops->get_name(fu));
>
> +	dc_dprc_configure(fu->dprc, new_state->crtc->index, src_w, src_h,
> +			  fb->pitches[0], fb->format, baseaddr, prefetch_start);
> +
>  	dc_lb_pec_dynamic_prim_sel(lb, dc_cf_get_link_id(dplane->cf));
>  	dc_lb_pec_dynamic_sec_sel(lb, fu_ops->get_link_id(fu));
>  	dc_lb_mode(lb, LB_BLEND);
>
> --
> 2.34.1
>
