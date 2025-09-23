Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD51B97334
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 20:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BF710E15E;
	Tue, 23 Sep 2025 18:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="cNF80G2q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013025.outbound.protection.outlook.com
 [52.101.83.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA73910E15E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 18:31:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t41qyBiFzzGmWMi6GmwQED+GBYjp5Yh9iwSmGT6nAD0uaMiNhIBUh0ddozzCqKKTfqjjuxILwmYiud1CIRXQSqMUQwbn6Sq17RV1iNREjAr/IxY+HUVH2+huDckOmcMa7+xz2GfnUqKcMd9n9SClqDg56Kk4dfc/5nlcwjdbenwEKIfPz0ZvBlqhKrdrqCfM0vk1o4zhJlXVKZzTOmKm19OhV3Cw+8p3bCGYYMWQFwEumZ+vK5sA5JXRXA/lOTy3837OTcd5BIX0q3CQqOoN8JUModLCxfXzKhZvRrlHzN3/DduKYxY/J/8CXyQFWQOj2pHgYpgXOGiRZGBBmsR6oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVPXPvOL28Rx5pSTJl/yehdM6XrHvmr9bqeIUgtVTMk=;
 b=Od+vMY3Ec96qadPYu3mMIkifvwN3iB3ABhn/uHPyQxgPMw3sqWqdAF564JJclwHjPT/DWgliMEjH66s/WX7ILRzR5Ohb1lgYpIrRhqmvGDv/WnVtek41CuI2PITm8C8YoxDzkNRiYhQIxrtLyHXuxpZQrMMccq5e7inhYEucowhvHIdKv0904W3BxoK9pgRtvRwPThMZ7ehYf5d3VlO1msGdT6TSA8OzLLxFDjv8tD21Zv0Om5gCJ4xTQDqMTirHQwlVcYtDvweXu23Y9yyvChQFPZwXSCq2BoYHJ82N8TrtBU2hmyGZNs8AN2DQX5G5fnS6Aqg9qDQmvzZysvPmcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVPXPvOL28Rx5pSTJl/yehdM6XrHvmr9bqeIUgtVTMk=;
 b=cNF80G2qjld+Yo6Lnt6b5ErFT+cn7UgBYVeMYT0d2FvidY3BabUtzTSzOBTnmiVQi+08S2etmKZRmqIV4r8xSYQvXkxf8NFonw5Pl+Mg2b5Cshlo+OeyxQr+OvUk23RhsLyD9HGc7+CiGdS5W8Ypa0fxytxHl6eE7tIMQnOzQZL8XrzQ4QPDLfTDtdStGKwp8TrEGOhz8XH43G77LjUxEmHyseI8o13FVUJCEExiY7c/NCR5NYgUIVcpHR8UrYwFnhwHksxkyKJwF4SKRzAC98daJvuZHvQ+KaZAddbmwJqtXzNAqcOzD6687afg/5RtxoII30vUiIdh4vSN5j7unw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by GV4PR04MB11851.eurprd04.prod.outlook.com (2603:10a6:150:2d7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 18:31:11 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 18:31:11 +0000
Date: Tue, 23 Sep 2025 14:30:59 -0400
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
Subject: Re: [PATCH v2 08/14] drm/imx: dc: Use TCON operation mode
Message-ID: <aNLnY+MWdHmSHIFh@lizhi-Precision-Tower-5810>
References: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
 <20250923-imx8-dc-prefetch-v2-8-5d69dc9ac8b5@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-imx8-dc-prefetch-v2-8-5d69dc9ac8b5@nxp.com>
X-ClientProxiedBy: BY3PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:254::33) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|GV4PR04MB11851:EE_
X-MS-Office365-Filtering-Correlation-Id: 64079a73-3f46-4bd9-f38c-08ddfacf5e4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yrOxNe75PnjI5AteQR83CY2KdHjNeEYj8Ix1dqr7j6f+Y8cWWJeArJ0Me5uY?=
 =?us-ascii?Q?b+F11LzMXHVwYXSa1+c5O9QrIeUnX3LC6YsXXeWyKXXOXVEGHQd1eji5AC3t?=
 =?us-ascii?Q?f74jBcAjJ8LCHlukXD8cWU0SzfR7vwVyVBsnGkBbzVK4zJoGlpgSIwlPsDmc?=
 =?us-ascii?Q?HGt0JIKNAYTNh57uyOhdjGUoyv8uue5otMzzmvZObNFwK95EdkHOsBkErOn4?=
 =?us-ascii?Q?a/RUJxF03SemhS0YoSIoXJR/WBXz/YVZb93bEtVENy/IX5UfcUgDnmQBd+lK?=
 =?us-ascii?Q?LMpr/Q18C15iVoYkoHW9yXx5yhFlSBdJqpYhJLXyxIn4sEaPPFyv7yJvQDbo?=
 =?us-ascii?Q?ew/txkwMmsRxj5pFNXFnOBoEOl6oiOp3o9oZ7bZi52SsqcMrpo9u+xr3qkaE?=
 =?us-ascii?Q?zxDTfcz8aXl/80sg4rrldxUHKygHpxMtJzy4fieFWGuuI7sYcJBEpF7p7PbN?=
 =?us-ascii?Q?btZaINdYHYbnmuVsXwRC98lU+0hTWZe26k+VsDJP/PzlWn/g5MfSNj+TZEXt?=
 =?us-ascii?Q?8qdvkY25F5/ok/m87T0dOSI/xyNvS+2tdPbzPapm3p6z0UtgIuGThd88co0l?=
 =?us-ascii?Q?lchveIEKry+KQxl8F6g2ruTjPu2AMLTw1+y8BmIzmN9jVDxekgB8+MzCASFt?=
 =?us-ascii?Q?lV8SEsuPki7HCuTlUPPNCBWUiIDgGYuTKmBJ1lvvfj0HaS/j0piuMUHFijBS?=
 =?us-ascii?Q?hm1HF+h0VOlL3S1Wnj/GMWRf5fR5VGDyPcpnqrEcAsBCE6S/K31gNOByxreb?=
 =?us-ascii?Q?m/I9swi+XKp9HSiHNRxNf5ylXzRSnVlnKf7wqMRvSd96kjsXrHc7ozoszscY?=
 =?us-ascii?Q?hNKlRZwZ+327zsVVNx2Jk/kPnUAq6UyO/Vx/N8Utko4wBdM7zsRnOOBlDAOZ?=
 =?us-ascii?Q?SEAY9V2+Dbu0OdAtlR0uk6TMZySfbgJ8VR+yN/eB9OGVD0edmAnggDeSBinw?=
 =?us-ascii?Q?4SGKgq1GptAw6Yl2A6EjcD0Fy43i86YL9xzrKw18Dv451nQKwzKbJfvaMntZ?=
 =?us-ascii?Q?wEnrXPnJGXXQNfPsaW0IM+a6KNpKalw1N3Kt6jCw/og4309Zeje+C+tTdC/1?=
 =?us-ascii?Q?jbR4Nj9CTwksFbORJ3i7sxmwH990Hh07cY+KRmxd2ohcVzAGeqk0dMW/ZR2a?=
 =?us-ascii?Q?ytT6yLxaT5ibIGZxRPIFpDEznPUww9EY1bEuCE9b7yPGTlC6jwh2W0X44MCI?=
 =?us-ascii?Q?XxD0Sj91TIEPZOzt3cPWRaONuH02uaIqzJ9T0U9WdFGtunFh1tzt95PMPUcB?=
 =?us-ascii?Q?vEg3CSVGWq9fjpPysSH/LrEcbRkgwOAebrDLHEIgL3bG/+WZGCY+vJMDpu8C?=
 =?us-ascii?Q?Lq5sEmBOkEJKbt+zNqfCjKuC6FkSJHzzuPKOFROnaSJHnCUiAyH3fhCfAklp?=
 =?us-ascii?Q?vc5fb9KuaftWoFt7cKb8x35p5jpl83OnWaNB21UO75wV+r2iV+C8L5gayBgD?=
 =?us-ascii?Q?0t2nw8d6lFe6Uzz8XTxzFcHVorg2hB20+t1L8fBSRProutU+1SSRtw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bt4KbyCOos2j1YCMsbDoSMo0f0LPZrHkpWe9roJsFEG41Uo50v7qTgUlv7/2?=
 =?us-ascii?Q?WmHRK2vBTOJK/9ly45DBtawp/HsKeUktaHI8Ug8xaT6HgBaEwS8gWCfIJuBD?=
 =?us-ascii?Q?dwSXJFwsJ3C0BN7TlaM5JBrMI7O7mebiJMU7PsiToBOeOk7iTglIrEXxXXPa?=
 =?us-ascii?Q?kNRzJwp4pO8FrB6vUMX4Vwj2qcM/WsuZYjgdSQC+NhEp+h5iVxdtPxxWa5mt?=
 =?us-ascii?Q?tp3lL6pjmyUoMI7NmXXss7LQIvQpI6HSZVkW5U/DguKSFqwynkEzqi8XXKg/?=
 =?us-ascii?Q?lRS1EmiPp4CWuQj0H4N6xGFRVO9FDrVltV/sDvg/3tiL8xwomUbLytgzLAGI?=
 =?us-ascii?Q?kZgPmJz4saBAP42eIPz/JIvJ+1xU1BNLUZkUiEr1moe62h+SkEaCPTvDSTX0?=
 =?us-ascii?Q?OgkPNYKj9duo1uAUyA/9fmI7tU/zynHSucpQcOZLWRJRbj8yXd3pHP/81zaw?=
 =?us-ascii?Q?I2QA5hYhKgwsz1Vpyf2p/+3c44IfSmqsh11YYgu5MxoX/NGeolcyvV2sQiYg?=
 =?us-ascii?Q?X7TzXW3KJuByKAfkIiM5ZKl+IlmKmJ0NmiZsODplh434w5qYEG7njnEcUV4S?=
 =?us-ascii?Q?7iDoqlPdG978W0bKPbbH9rq4ggGLcd75SlJVHieCbt9NekRbH8j3vLkaGRxJ?=
 =?us-ascii?Q?YiGOYA+kFuuOWAcfNzZ0tCYVNfbtmxeIrzRTxTfBcI9AkOGbEZRZP+aLPfmj?=
 =?us-ascii?Q?z6tONnmB+TjQ6k979VOflM7Dup68ZK/Ryddet8KMhS75/Va+HbJ+AiNvku/m?=
 =?us-ascii?Q?yzxG/O3qpdoacCfKKSv6vkZv4DJyBUBq6rKDTOBvTQ/l88iE9aOHpr0zmK2+?=
 =?us-ascii?Q?G5Z6ufNw3jHytbTRSPBKuBhlMJhyeWzmRD+7itga4ZV3rvhNAli+6m5vWv4V?=
 =?us-ascii?Q?2p/HvqZ042kZbNb8BxrdbdDnWYyUwCHXs3XkOD4g3ckLeC4Mqn8CDrKv/5cL?=
 =?us-ascii?Q?59/tY21S+KHFs4LMdTnbB3GfDNX3/etqQMtDji7sK6Nc7O+yUY9YvswR/BZb?=
 =?us-ascii?Q?m+dkhYIgHlzgT3QBxt001Sjk7fdnF+22uqq3ofNG28FE9TJ5akSgMpm2ffXM?=
 =?us-ascii?Q?pzTLwAEZSNtKrxeMOqs4EclLYcYJOwiUg6t1K8SrH1jmxyyVK013Sys7twyv?=
 =?us-ascii?Q?zefyNfegfsbNXVIgk++63ZXe+fDTJACthNXITawK0PivZlVra3L3PGAurrQU?=
 =?us-ascii?Q?aN/CfUaA87Gem54jShLEU1vxmQyaHZz1j9MfDtPKvHkvJsZS0dFrAEzYCROT?=
 =?us-ascii?Q?eaBF5d7EV+E2NT4K6s44Szcio69IBL9VKfvGe1OWVSqHo8ELhrcIMycHfK9y?=
 =?us-ascii?Q?0EQ6Gg5kGhbPDm0tQzVq8dXJI44T1CnfX0tcyY69z7gHvob6v945Dh4yFDgO?=
 =?us-ascii?Q?LIOmeNZQXBG0B3Iu2vp43Gd7++N46lA21kQkzm22Oo2Sft2meBlDqtq2qTQK?=
 =?us-ascii?Q?ulU4NFnKXBU0OqJPbKWQevNoCnRfHMTYFo3CKr4qPIdJ5vaTqpIVR2xl6DJ4?=
 =?us-ascii?Q?GdPNanezXsQa6mNEJepBvnNQzNKikg+gbh5XzAP3d3DkMUSbzDx2/SHNK9Wb?=
 =?us-ascii?Q?QlpkbNHQOTQfgE/SVMM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64079a73-3f46-4bd9-f38c-08ddfacf5e4d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 18:31:10.9495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jXigq0C9dnUrooRbIMI9eX99H/KcmFUHciwj1df7wJuOOFI6ba6hNO89Q1cCu1h+y5BwC170Ax3sZiJrWOfiAQ==
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

On Tue, Sep 23, 2025 at 10:07:58AM +0800, Liu Ying wrote:
> In TCON operation mode, sync signals from FrameGen are ignored, but
> a much more customized output timing can be generated by the TCON
> module.  By using TCON operaton mode, generate KACHUNK signal along
> with HSYNC/VSYNC/data enable signals.  The KACHUNK signal is used as
> a synchronization signal inside the prefetch engine(DPRC + PRG(s),
> attached to FetchUnit(s)).  Carefully switch TCON bypass mode to TCON
> operation mode when CRTC is being enabled so that the prefetch engine
> may evade the first dumb frame generated by the display controller.
>
> Since TCON BYPASS bit is controlled by KMS driver when doing atomic
> commits, drop the bit setting when initializing TCON.  This also
> avoids accidentally initializing TCON BYPASS bit to 1 when driver
> module removing and re-installing where an upcoming patch would
> disable a CRTC at boot in TCON operation mode if needed.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

 ---
>  drivers/gpu/drm/imx/dc/dc-crtc.c |  28 ++++++++++
>  drivers/gpu/drm/imx/dc/dc-de.h   |   2 +
>  drivers/gpu/drm/imx/dc/dc-kms.h  |   2 +
>  drivers/gpu/drm/imx/dc/dc-tc.c   | 114 +++++++++++++++++++++++++++++++++++++--
>  4 files changed, 142 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
> index 45a87df1ad6a8bd768aa5ed38d6f03f14052b3d7..9e9e86cd5202bcb0bb4d5627dbcefcc3f4e2ead0 100644
> --- a/drivers/gpu/drm/imx/dc/dc-crtc.c
> +++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
> @@ -6,8 +6,10 @@
>  #include <linux/completion.h>
>  #include <linux/container_of.h>
>  #include <linux/interrupt.h>
> +#include <linux/irqflags.h>
>  #include <linux/irqreturn.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/preempt.h>
>  #include <linux/spinlock.h>
>
>  #include <drm/drm_atomic.h>
> @@ -68,6 +70,14 @@ do {									\
>  							__func__);	\
>  } while (0)
>
> +#define DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(fg)		\
> +do {									\
> +	if (!dc_fg_wait_for_frame_index_moving(fg))			\
> +		dc_crtc_err(crtc,					\
> +			"%s: FrameGen frame index isn't moving\n",	\
> +							__func__);	\
> +} while (0)
> +
>  static inline struct dc_crtc *to_dc_crtc(struct drm_crtc *crtc)
>  {
>  	return container_of(crtc, struct dc_crtc, base);
> @@ -229,6 +239,7 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>  	struct drm_display_mode *adj = &new_crtc_state->adjusted_mode;
>  	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
>  	enum dc_link_id cf_link;
> +	unsigned long flags;
>  	int idx, ret;
>
>  	dc_crtc_dbg(crtc, "mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(adj));
> @@ -249,6 +260,7 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>  	enable_irq(dc_crtc->irq_ed_safe_shdload);
>
>  	dc_fg_cfg_videomode(dc_crtc->fg, adj);
> +	dc_tc_cfg_videomode(dc_crtc->tc, adj);
>
>  	dc_cf_framedimensions(dc_crtc->cf_cont,
>  			      adj->crtc_hdisplay, adj->crtc_vdisplay);
> @@ -273,7 +285,22 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>  	dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
>  	dc_ed_pec_sync_trigger(dc_crtc->ed_safe);
>  	dc_fg_shdtokgen(dc_crtc->fg);
> +
> +	/* Don't relinquish CPU until TCON is set to operation mode. */
> +	local_irq_save(flags);
> +	preempt_disable();
> +
>  	dc_fg_enable(dc_crtc->fg);
> +	/*
> +	 * Turn TCON into operation mode as soon as the first dumb
> +	 * frame is generated by DC(we don't relinquish CPU to ensure
> +	 * this).  This makes DPR/PRG be able to evade the frame.
> +	 */
> +	DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
> +	dc_tc_set_operation_mode(dc_crtc->tc);
> +
> +	local_irq_restore(flags);
> +	preempt_enable();
>
>  	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_safe_shdload_done);
>  	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdload_done);
> @@ -561,6 +588,7 @@ int dc_crtc_init(struct dc_drm_device *dc_drm, int crtc_index)
>  	dc_crtc->ed_cont = pe->ed_cont[crtc_index];
>  	dc_crtc->ed_safe = pe->ed_safe[crtc_index];
>  	dc_crtc->fg = de->fg;
> +	dc_crtc->tc = de->tc;
>
>  	dc_crtc->irq_dec_framecomplete = de->irq_framecomplete;
>  	dc_crtc->irq_dec_seqcomplete = de->irq_seqcomplete;
> diff --git a/drivers/gpu/drm/imx/dc/dc-de.h b/drivers/gpu/drm/imx/dc/dc-de.h
> index 211f3fcc1a9ad642617d3b22e35ea923f75e645b..c39f2ef5eea98c3eb6ae9b5392f9bf9f7e33e7c5 100644
> --- a/drivers/gpu/drm/imx/dc/dc-de.h
> +++ b/drivers/gpu/drm/imx/dc/dc-de.h
> @@ -54,6 +54,8 @@ enum drm_mode_status dc_fg_check_clock(struct dc_fg *fg, int clk_khz);
>  void dc_fg_init(struct dc_fg *fg);
>
>  /* Timing Controller Unit */
> +void dc_tc_set_operation_mode(struct dc_tc *tc);
> +void dc_tc_cfg_videomode(struct dc_tc *tc, struct drm_display_mode *m);
>  void dc_tc_init(struct dc_tc *tc);
>
>  #endif /* __DC_DISPLAY_ENGINE_H__ */
> diff --git a/drivers/gpu/drm/imx/dc/dc-kms.h b/drivers/gpu/drm/imx/dc/dc-kms.h
> index cd7860eff986a272f6983ad0f3cc87dbf40c2851..a25d47eebd28792e4b53b4ecc89907ce00430c2c 100644
> --- a/drivers/gpu/drm/imx/dc/dc-kms.h
> +++ b/drivers/gpu/drm/imx/dc/dc-kms.h
> @@ -50,6 +50,8 @@ struct dc_crtc {
>  	struct dc_ed *ed_safe;
>  	/** @fg: framegen */
>  	struct dc_fg *fg;
> +	/** @tc: tcon */
> +	struct dc_tc *tc;
>  	/**
>  	 * @irq_dec_framecomplete:
>  	 *
> diff --git a/drivers/gpu/drm/imx/dc/dc-tc.c b/drivers/gpu/drm/imx/dc/dc-tc.c
> index 0bfd381b2cea15444c399f3ad261e2d061ea1c9f..6f1dc71f1b40cb4d99ca177172bd0066f39e8314 100644
> --- a/drivers/gpu/drm/imx/dc/dc-tc.c
> +++ b/drivers/gpu/drm/imx/dc/dc-tc.c
> @@ -9,11 +9,30 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>
> +#include <drm/drm_modes.h>
> +
>  #include "dc-drv.h"
>  #include "dc-de.h"
>
>  #define TCON_CTRL	0x410
> -#define  CTRL_RST_VAL	0x01401408
> +#define  SPLITPOSITION_MASK	GENMASK(29, 16)
> +#define  SPLITPOSITION(n)	FIELD_PREP(SPLITPOSITION_MASK, (n))
> +#define  DUAL_SWAP	BIT(15)
> +#define  MINILVDS_OPCODE_MASK	GENMASK(14, 12)
> +#define  MODE_4PAIRS	FIELD_PREP(MINILVDS_OPCODE_MASK, 0x1)
> +#define  LVDS_CLOCK_INV	BIT(11)
> +#define  LVDS_BALANCE	BIT(10)
> +#define  LVDSMODE	BIT(9)
> +#define  ENLVDS		BIT(8)
> +#define  INV_CTRL_MASK	GENMASK(7, 4)
> +#define  BYPASS		BIT(3)
> +#define  TCON_SYNC	BIT(2)
> +#define  CHANNELMODE_MASK	GENMASK(1, 0)
> +#define  CTRL_RST_MASK	\
> +		(SPLITPOSITION_MASK | DUAL_SWAP | MINILVDS_OPCODE_MASK | \
> +		 LVDS_CLOCK_INV | LVDS_BALANCE | LVDSMODE | ENLVDS | \
> +		 INV_CTRL_MASK | TCON_SYNC | CHANNELMODE_MASK)
> +#define  CTRL_RST_VAL  (SPLITPOSITION(0x140) | MODE_4PAIRS | LVDS_BALANCE)
>
>  /* red: MAPBIT 29-20, green: MAPBIT 19-10, blue: MAPBIT 9-0 */
>  #define MAPBIT3_0	0x418
> @@ -25,6 +44,16 @@
>  #define MAPBIT27_24	0x430
>  #define MAPBIT31_28	0x434
>
> +#define SPGPOSON(n)	(0x460 + (n) * 16)
> +#define SPGMASKON(n)	(0x464 + (n) * 16)
> +#define SPGPOSOFF(n)	(0x468 + (n) * 16)
> +#define SPGMASKOFF(n)	(0x46c + (n) * 16)
> +#define  X(n)		FIELD_PREP(GENMASK(30, 16), (n))
> +#define  Y(n)		FIELD_PREP(GENMASK(14, 0), (n))
> +
> +#define SMXSIGS(n)	(0x520 + (n) * 8)
> +#define SMXFCTTABLE(n)	(0x524 + (n) * 8)
> +
>  static const struct dc_subdev_info dc_tc_info[] = {
>  	{ .reg_start = 0x5618c800, .id = 0, },
>  	{ .reg_start = 0x5618e400, .id = 1, },
> @@ -33,6 +62,8 @@ static const struct dc_subdev_info dc_tc_info[] = {
>  static const struct regmap_range dc_tc_regmap_ranges[] = {
>  	regmap_reg_range(TCON_CTRL, TCON_CTRL),
>  	regmap_reg_range(MAPBIT3_0, MAPBIT31_28),
> +	regmap_reg_range(SPGPOSON(0), SPGMASKOFF(4)),
> +	regmap_reg_range(SMXSIGS(0), SMXFCTTABLE(3)),
>  };
>
>  static const struct regmap_access_table dc_tc_regmap_access_table = {
> @@ -47,7 +78,7 @@ static const struct regmap_config dc_tc_regmap_config = {
>  	.fast_io = true,
>  	.wr_table = &dc_tc_regmap_access_table,
>  	.rd_table = &dc_tc_regmap_access_table,
> -	.max_register = MAPBIT31_28,
> +	.max_register = SMXFCTTABLE(3),
>  };
>
>  /*
> @@ -60,10 +91,85 @@ static const u32 dc_tc_mapbit[] = {
>  	0x13121110, 0x03020100, 0x07060504, 0x00000908,
>  };
>
> +void dc_tc_set_operation_mode(struct dc_tc *tc)
> +{
> +	regmap_write_bits(tc->reg, TCON_CTRL, BYPASS, 0);
> +}
> +
> +void dc_tc_cfg_videomode(struct dc_tc *tc, struct drm_display_mode *m)
> +{
> +	int hdisplay, hsync_start, hsync_end;
> +	int vdisplay, vsync_start, vsync_end;
> +	int y;
> +
> +	hdisplay = m->hdisplay;
> +	vdisplay = m->vdisplay;
> +	hsync_start = m->hsync_start;
> +	vsync_start = m->vsync_start;
> +	hsync_end = m->hsync_end;
> +	vsync_end = m->vsync_end;
> +
> +	/*
> +	 * Turn TCON into operation mode later after the first dumb frame is
> +	 * generated by DC.  This makes DPR/PRG be able to evade the frame.
> +	 */
> +	regmap_write_bits(tc->reg, TCON_CTRL, BYPASS, BYPASS);
> +
> +	/* dsp_control[0]: HSYNC */
> +	regmap_write(tc->reg, SPGPOSON(0), X(hsync_start));
> +	regmap_write(tc->reg, SPGMASKON(0), 0xffff);
> +
> +	regmap_write(tc->reg, SPGPOSOFF(0), X(hsync_end));
> +	regmap_write(tc->reg, SPGMASKOFF(0), 0xffff);
> +
> +	regmap_write(tc->reg, SMXSIGS(0), 0x2);
> +	regmap_write(tc->reg, SMXFCTTABLE(0), 0x1);
> +
> +	/* dsp_control[1]: VSYNC */
> +	regmap_write(tc->reg, SPGPOSON(1), X(hsync_start) | Y(vsync_start - 1));
> +	regmap_write(tc->reg, SPGMASKON(1), 0x0);
> +
> +	regmap_write(tc->reg, SPGPOSOFF(1), X(hsync_start) | Y(vsync_end - 1));
> +	regmap_write(tc->reg, SPGMASKOFF(1), 0x0);
> +
> +	regmap_write(tc->reg, SMXSIGS(1), 0x3);
> +	regmap_write(tc->reg, SMXFCTTABLE(1), 0x1);
> +
> +	/* dsp_control[2]: data enable */
> +	/* horizontal */
> +	regmap_write(tc->reg, SPGPOSON(2), 0x0);
> +	regmap_write(tc->reg, SPGMASKON(2), 0xffff);
> +
> +	regmap_write(tc->reg, SPGPOSOFF(2), X(hdisplay));
> +	regmap_write(tc->reg, SPGMASKOFF(2), 0xffff);
> +
> +	/* vertical */
> +	regmap_write(tc->reg, SPGPOSON(3), 0x0);
> +	regmap_write(tc->reg, SPGMASKON(3), 0x7fff0000);
> +
> +	regmap_write(tc->reg, SPGPOSOFF(3), Y(vdisplay));
> +	regmap_write(tc->reg, SPGMASKOFF(3), 0x7fff0000);
> +
> +	regmap_write(tc->reg, SMXSIGS(2), 0x2c);
> +	regmap_write(tc->reg, SMXFCTTABLE(2), 0x8);
> +
> +	/* dsp_control[3]: KACHUNK */
> +	y = vdisplay + 1;
> +
> +	regmap_write(tc->reg, SPGPOSON(4), X(0x0) | Y(y));
> +	regmap_write(tc->reg, SPGMASKON(4), 0x0);
> +
> +	regmap_write(tc->reg, SPGPOSOFF(4), X(0x20) | Y(y));
> +	regmap_write(tc->reg, SPGMASKOFF(4), 0x0);
> +
> +	regmap_write(tc->reg, SMXSIGS(3), 0x6);
> +	regmap_write(tc->reg, SMXFCTTABLE(3), 0x2);
> +}
> +
>  void dc_tc_init(struct dc_tc *tc)
>  {
> -	/* reset TCON_CTRL to POR default so that TCON works in bypass mode */
> -	regmap_write(tc->reg, TCON_CTRL, CTRL_RST_VAL);
> +	/* reset TCON_CTRL to POR default except for touching BYPASS bit */
> +	regmap_write_bits(tc->reg, TCON_CTRL, CTRL_RST_MASK, CTRL_RST_VAL);
>
>  	/* set format */
>  	regmap_bulk_write(tc->reg, MAPBIT3_0, dc_tc_mapbit,
>
> --
> 2.34.1
>
