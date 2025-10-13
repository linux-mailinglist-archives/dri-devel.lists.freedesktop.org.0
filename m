Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 407A8BD5E2C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 21:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D738510E4FA;
	Mon, 13 Oct 2025 19:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="VHEUVrUo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012022.outbound.protection.outlook.com [52.101.66.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336D110E4FA
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 19:11:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWgDDN65OiL8FAxBqPhp5L3bS4CUHghZbTeTuvPtOXEp+/FD13efaKhDDDT8d90IYacA5aED4xDp9qWYSCCQ+AQBZrRkDoe3CeEQ7OBDH0S8RA5O/iBOx0W4kZNi5Vv6hKj+gAfPvVPwjpJ++Einch0727DEJWk6UgJ8dVXJ8SkzlW5FDf7SteJyfngRWppWl217bev0d8lSnAm/lNu8KOJfxSwtPEHCEAa46rNHNWigPzqqKXUIM4KxjcQPX2u8uwU15BsCyivriPPl4a5CrxwKw+fRl/+cN5UZrQs+xDdKaxTt+1q6hZRlVOOoz2/sdGYkHa5UEm4lXTitiBCJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m55es6l+LYF6S0Jje+xbCrfaLt4nGGP0DMpluekt8Fc=;
 b=rEQ8XlqEyKDXG+PpFdh6V2PDP44O+pMkG/7eCUU7gJgkJtrX5qvRUxRbaf31jwZ3EIJBF/dca13sdbY0YOibnsUeE7v3gw8YL47CgKDHEXLkG2DkU/CdLyvrqD0Rf95f0cNlxq0nbfCQcXXrsfDAAaUtQIv+oSGzAOicOOzwQ3F8QK1CDp3O5GUkIZEu4fPlbaUcLxuAJfyVM3eTCNUTfYFg/xtA/SG427ceZ+Taj9sQuJlQeIS/AArtjTaPlCxXOVNDG28/+Xb2/UW0UVL3B/ELqlYZajoMVeqUcwvE1vNsrLu6sk8r1/t4CwZMv1VWtq6GAz9ReeyOg2huqiejOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m55es6l+LYF6S0Jje+xbCrfaLt4nGGP0DMpluekt8Fc=;
 b=VHEUVrUoDzfJKDV64zrGRNAoSBfmFUKobi3u/Rs3YIpgF2K86Tg1mvOfEpXWMXSRYhpI8txEgKjlX85FjmRbXsBJdTf2q/VGSV1HGZRf7AuGB3YgJtJ9TtcjIWnzVxom8hzPj3YbwM2yVTR5msgq9ko64DVjfGX4o6TKrMKLXDUsStE/MHhbbeofgEndQk1qR8KoeagloPplE7p7pNfZCjMKeQScrBLgc5mQ5h/0iQHRcL5Nw+g55uTZEFK7dPVFfXZ5vztFqT3brygMMGrOyTARupxO737AYy1/4tD1Dh5rFYrxflv06ZkyB9di92+o8so+Q/ZNagCsXz1YLVbG4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by GVXPR04MB9758.eurprd04.prod.outlook.com (2603:10a6:150:110::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 19:11:00 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 19:11:00 +0000
Date: Mon, 13 Oct 2025 15:10:51 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Liu Ying <victor.liu@nxp.com>,
 Sandor Yu <Sandor.yu@nxp.com>, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 28/39] drm/bridge: imx: Add NXP i.MX95 pixel link support
Message-ID: <aO1Ou/vP/geiKkUS@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-29-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-29-marek.vasut@mailbox.org>
X-ClientProxiedBy: PH7PR17CA0043.namprd17.prod.outlook.com
 (2603:10b6:510:323::9) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|GVXPR04MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: e21173fe-062d-4d49-fca0-08de0a8c3eab
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mMxf3B48FyixKsRaCJHfITZjKQWV6YuTzSCkk4/PmF6Dgo4uoIYmqli7278l?=
 =?us-ascii?Q?oI+LEEZZsS/dEP9Qig/fYwoRbv9Py6z/jsNMDi0AEgIuhOzNcl9AdbEd8jrD?=
 =?us-ascii?Q?6+DUgw6SyXzhTmvu1i/vW4YlZr/lHeEsqOvlkCRL9TxYfHSKSJlPir2gze1e?=
 =?us-ascii?Q?gU5n2qyqct9Xyj0ggWW7xiT9YnS5kp0UhtENN4N4HmNs5oWbHJyMvH6NZ2aQ?=
 =?us-ascii?Q?tm0MHpNIF0fU439xySj7/OZ3NqIArWwXdcTu3mEXPhl+miABsFUjoRYN04r0?=
 =?us-ascii?Q?YEbDEF/J2ZJC5bZQ/QEMfz7nEvv2elxuTKluXQ6P/g6+Z4va62dRuvj38WNi?=
 =?us-ascii?Q?O5dJUWLK8oLXJlOA/LeneVURRG2XY70uhPwh7g9eACghSagWmO+7u8OMmFNk?=
 =?us-ascii?Q?lZUIzO7+exhPDNMfR9KYEYNNjakycehUsIPysIoMCnL24Wye0iV6JlZe0e0/?=
 =?us-ascii?Q?J3Vy1Aurotsr+3s2XHFLd0nL2V2HRFt4ooiOr36iqyZ1l1I/dZmSwLY4JVDl?=
 =?us-ascii?Q?P53L2SmndZ70gqo+nTKDhivSvz71jO7zjvUyMtQNuTnVgwQ0VKXyy+DJfT3i?=
 =?us-ascii?Q?kR+vQAH/DCVPmXYIAhcLfEvgED1G58RVNWgoG7qf4on38qrfZAzytPPVFLIF?=
 =?us-ascii?Q?YNOF0w01AyQADm6DIsEGaGIRMwQd58+yAhMReJourOL1uq+RK3VE16vT+xCc?=
 =?us-ascii?Q?S5qkJ5Fjq0npJ9Q5GP6EReQmqLzaMfUpFzUKiBSx1XUckJVVDQBxJp8HXLyL?=
 =?us-ascii?Q?WYG2llTGnHqbXxp28JKIfZ5ZJQaW8xcIcDOgTLOdxDeYkOJRNUuqEHPPLvWg?=
 =?us-ascii?Q?FS0FyXKNawHnGol+qI3ZehVIbXUF0ioktD4UILuDiJLnbQqHhD8pN1aT0P6o?=
 =?us-ascii?Q?Pju6td2v+hLZB0WXxkCUeFsqud6B2+L7PXCWQ+2Pp4dN/aU9YP+52nm7kb6X?=
 =?us-ascii?Q?3emQ3sgCUtRH5NdKIvKIGecwGUC3P+z9e0vdWuzYGXYdVZoOPGiEB7HVSnXs?=
 =?us-ascii?Q?eBPJe27OIOstcjlKboQT94KGjzrGHc8KeGG4k0V6wqHnwDWLqPqyi8Q80hw4?=
 =?us-ascii?Q?kANpezBaKsPp5vop9NOQ9QzzPu53aMuG7VfEfN2d4Ps87EtNEjcKb+OogkZD?=
 =?us-ascii?Q?4UvbEh5mWe2PBOlx/lha8KB3M/XyoqoSRmMfCoXGWoQYT59IZnVANI7oO07/?=
 =?us-ascii?Q?qMLf7nbPk2yQGeSJEz8HCwhoXD1F4PLGCFdwk7kGKpG720lI7S/cpKGda2oF?=
 =?us-ascii?Q?McHUCC21FQQju2qRx7c4P4Dp5WDRhHdfgQFopO0J3XjhWBzXZgsVL/tUkRGp?=
 =?us-ascii?Q?aJ5TTUJDN2FUTQWdGAvBZsQSpSVDdil7puVrjg3VjdI21zc6rIlj2hboAPy4?=
 =?us-ascii?Q?j5pMCqU1IXOUkd5dVZoBza8q0Dne43le81GWzst9SYfGDFb/KnpaNkiAvwJm?=
 =?us-ascii?Q?bwGAtdGQ119AWmmR024I4vyz1YO5aYdvuVfmaCNSTMLG3WYzblL4NGd3TwMa?=
 =?us-ascii?Q?R/jxgOHSe1NeQZWinuyraFsQm6tvNWNozpnG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eALhMCE6eanG5+fThPaa/DYE56h8EvcMIPFWzBZLWhVkdIgiJSwPT3/z5uN2?=
 =?us-ascii?Q?NhvwmK1XMAzzpL742Dest4GCIIKzYor+HUiLud3V95OOKdI0T2HSK+PW7Do9?=
 =?us-ascii?Q?/GZ1gzRiqdz3sCqxdcVzOJMz4ijAOGB9eK4Ix0U200k/PORVKN0LMm9eOJcM?=
 =?us-ascii?Q?dKqH3DydNDSNUub7VHTa0ZXUIByeChXZptViyXc6RkBDhDUS+Y+1qrF7hXBH?=
 =?us-ascii?Q?R9srR/un9JJBDzkYRlZR23Nytptl+IVDAs54qM3IS5bV6WTkUjMaUNQGLINj?=
 =?us-ascii?Q?M2gV5BN1pMwPKMOsmtseSfijlHjpbcbGPqVMFnEKx07fHIR09Dj9UA8sK2k9?=
 =?us-ascii?Q?+4vGhyFqLu8nr1l6W/QWl6HBH7OtrUhZln+iYxjqsTWewXAuIbtMmP+JlJEw?=
 =?us-ascii?Q?5e/thSZrv5GZMzPYM26bGsSJn82tmVqDXPYDwOjwTGXC2rH7L1he9vPPYBTF?=
 =?us-ascii?Q?GfR3O/i6epchraBhopuQAYDtfnrxLAB4bEQzC1lBMFiPKVIUx+7PlBQCE9e2?=
 =?us-ascii?Q?9R88vFL6mmpD/oR8WjFKGPa+uKwHTb0RMJINXwFZLLC4XcJ1XaiYN2Nst2Mc?=
 =?us-ascii?Q?6XasSs+YBidMHQghymadvavEQxtG9EajcN56Up//RldLF+150Wgod4qEiEVb?=
 =?us-ascii?Q?7PkYIKYG6Htc68YJZLew6+dAcUltrr65MSNZ6U50JVAD3Rlo3Tmkj1wCoUjI?=
 =?us-ascii?Q?RllxSHswPE6389suXOcOVj8dhTkhOQwRuOezsBiJMe/V9SWgAKg9V1nyiez0?=
 =?us-ascii?Q?ezF2Tt1f9rwTXkYRIdKTyRgpBq6esJe4B3ZmYs5ZKXvOjPRT9nErZYaxo4tM?=
 =?us-ascii?Q?fXi2OtqeZrli/44/wyNQ1NkYYRQH83qrKV+bSdAFGUFuajiD98QJfiVk4k6J?=
 =?us-ascii?Q?KMldpKF6dGfwmNM+RmjV2GS1c03ZIHhaA9xsptwDJpjFL9MEJIhirgcOHYe4?=
 =?us-ascii?Q?mvnqSM5dROGPIxnh2Ud/kX1EElC6F62RqCHh1sWVbpdSxtiLp/nCZFZDqbrk?=
 =?us-ascii?Q?mu1CJukxVgOfUBO3d0DaK1DJkLAbHwht4iffIDIUNKVvcrsJVopft0Z30AtZ?=
 =?us-ascii?Q?KXXpbNten4HlWq3PGkgdd8mTOYgXRfyp61hk2hqzAQUW8Fhp7Z6qsI2wIsm3?=
 =?us-ascii?Q?p1OkyKG20HiqZhWwdZTe7AxuBC52B0oGUf8nGxDL8ZEXuSUU9rrPuIGyuwII?=
 =?us-ascii?Q?8QbNqblccwlHzUri8/uzLmY44ODTv48gZiFhj/qjiyh6APlCOo0GI6TOwKU2?=
 =?us-ascii?Q?S1ML/a9oRQ8DaVHI7lm6fJ+SsKwoJ1ODQ9kiOH7SvE+a7N2z+CDkqpRIWRZv?=
 =?us-ascii?Q?7PnDa0sNAvUrkvDfusUB2jM6pO8BT4329fBbgSOwwSpTDrSCRvzq9usNTts+?=
 =?us-ascii?Q?KkQlhPwXM6BDCHAmVWzg6UmZb/ZTPSoRTytbPqg6s2NGyq48EhPsRv03TVX+?=
 =?us-ascii?Q?xWn2KTVsmbpvBTE5G9OMoyectT+X1DW0QCKSMXMW3h+YoouRFKu2mn3L9T2b?=
 =?us-ascii?Q?UVmSKkM1b+w5c2dIM4/TBics1emU4hoMqsSJha7paBp0SJV2SfiY0lIW7827?=
 =?us-ascii?Q?uVN49edLNWjXrhQNAfU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e21173fe-062d-4d49-fca0-08de0a8c3eab
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 19:10:59.9732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZZFmOsIAH1e1hXMxB5h7OshPHukNb0ol6RvuZunZIgaJymybR7CInttnnlUUWChJfPzTqwvzRhfADLU3DfJ1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9758
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

On Sat, Oct 11, 2025 at 06:51:43PM +0200, Marek Vasut wrote:
> From: Liu Ying <victor.liu@nxp.com>
>
> Add NXP i.MX95 pixel link bridge support.
>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> Reviewed-by: Sandor Yu <Sandor.yu@nxp.com>
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
>  drivers/gpu/drm/bridge/imx/Kconfig            |   9 +
>  drivers/gpu/drm/bridge/imx/Makefile           |   1 +
>  drivers/gpu/drm/bridge/imx/imx95-pixel-link.c | 184 ++++++++++++++++++
>  3 files changed, 194 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx95-pixel-link.c
>
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 3e1b1d825d7bf..8baa335deac49 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -97,4 +97,13 @@ config DRM_IMX95_PIXEL_INTERLEAVER
>  	  Choose this to enable pixel interleaver found in NXP i.MX95
>  	  processors.
>
> +config DRM_IMX95_PIXEL_LINK
> +	tristate "NXP i.MX95 display pixel link"
> +	depends on OF && MFD_SYSCON
> +	select DRM_KMS_HELPER
> +	select REGMAP_MMIO
> +	help
> +	  Choose this to enable display pixel link found in NXP i.MX95
> +	  processors.
> +
>  endif # ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> index 583054c70f002..b6b2e1bc8d4bd 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -9,3 +9,4 @@ obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
>  obj-$(CONFIG_DRM_IMX93_MIPI_DSI) += imx93-mipi-dsi.o
>  obj-$(CONFIG_DRM_IMX95_PIXEL_INTERLEAVER) += imx95-pixel-interleaver.o
> +obj-$(CONFIG_DRM_IMX95_PIXEL_LINK) += imx95-pixel-link.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx95-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx95-pixel-link.c
> new file mode 100644
> index 0000000000000..747d2d77b59ef
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx95-pixel-link.c
> @@ -0,0 +1,184 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright 2023 NXP
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_bridge.h>
> +
> +#define CTRL		0x8

register name too short

> +#define  PL_VALID(n)	BIT(1 + 4 * (n))
> +#define  PL_ENABLE(n)	BIT(4 * (n))
> +
> +#define OUT_ENDPOINTS	2
> +
> +#define DRIVER_NAME	"imx95-pixel-link"
> +
> +struct imx95_pixel_link_bridge {
> +	struct drm_bridge bridge;
> +	struct drm_bridge *next_bridge;
> +	struct device *dev;
> +	struct regmap *regmap;
> +	u8 stream_id;
> +};
> +
> +static int imx95_pixel_link_bridge_attach(struct drm_bridge *bridge,
> +					  struct drm_encoder *encoder,
> +					  enum drm_bridge_attach_flags flags)
> +{
> +	struct imx95_pixel_link_bridge *pl = bridge->driver_private;
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +		dev_err(pl->dev, "do not support creating a drm_connector\n");
> +		return -EINVAL;
> +	}
> +
> +	return drm_bridge_attach(encoder, pl->next_bridge, bridge,
> +				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +}
> +
> +static void imx95_pixel_link_bridge_disable(struct drm_bridge *bridge)
> +{
> +	struct imx95_pixel_link_bridge *pl = bridge->driver_private;
> +	unsigned int id = pl->stream_id;
> +
> +	regmap_update_bits(pl->regmap, CTRL, PL_ENABLE(id), 0);
> +	regmap_update_bits(pl->regmap, CTRL, PL_VALID(id), 0);
> +}
> +
> +static void imx95_pixel_link_bridge_enable(struct drm_bridge *bridge)
> +{
> +	struct imx95_pixel_link_bridge *pl = bridge->driver_private;
> +	unsigned int id = pl->stream_id;
> +
> +	regmap_update_bits(pl->regmap, CTRL, PL_VALID(id), PL_VALID(id));
> +	regmap_update_bits(pl->regmap, CTRL, PL_ENABLE(id), PL_ENABLE(id));
> +}
> +
> +static u32 *
> +imx95_pixel_link_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +						  struct drm_bridge_state *bridge_state,
> +						  struct drm_crtc_state *crtc_state,
> +						  struct drm_connector_state *conn_state,
> +						  u32 output_fmt,
> +						  unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +
> +	if (output_fmt != MEDIA_BUS_FMT_RGB888_1X36_CPADLO &&
> +	    output_fmt != MEDIA_BUS_FMT_FIXED)
> +		return NULL;
> +
> +	*num_input_fmts = 1;
> +
> +	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +
> +	return input_fmts;
> +}
> +
> +static const struct drm_bridge_funcs imx95_pixel_link_bridge_funcs = {
> +	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset		= drm_atomic_helper_bridge_reset,
> +	.attach			= imx95_pixel_link_bridge_attach,
> +	.disable		= imx95_pixel_link_bridge_disable,
> +	.enable			= imx95_pixel_link_bridge_enable,
> +	.atomic_get_input_bus_fmts =
> +				imx95_pixel_link_bridge_atomic_get_input_bus_fmts,
> +};
> +
> +static int imx95_pixel_link_bridge_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *remote, *np = dev->of_node;
> +	struct imx95_pixel_link_bridge *pl;
> +	int i, ret;
> +
> +	pl = devm_drm_bridge_alloc(dev, struct imx95_pixel_link_bridge, bridge,
> +				   &imx95_pixel_link_bridge_funcs);
> +	if (IS_ERR(pl))
> +		return PTR_ERR(pl);
> +
> +	pl->dev = dev;
> +	platform_set_drvdata(pdev, pl);
> +
> +	pl->regmap = syscon_regmap_lookup_by_phandle(np, "fsl,syscon");
> +	if (IS_ERR(pl->regmap))
> +		return dev_err_probe(dev, PTR_ERR(pl->regmap), "failed to get regmap\n");
> +
> +	ret = of_property_read_u8(np, "fsl,dc-stream-id", &pl->stream_id);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get stream index\n");
> +
> +	pl->bridge.driver_private = pl;
> +	pl->bridge.of_node = of_graph_get_port_by_id(np, 0);
> +	if (!pl->bridge.of_node)
> +		return dev_err_probe(dev, -ENODEV, "failed to get port@0\n");
> +	of_node_put(pl->bridge.of_node);

this put should be in driver remove function.

> +
> +	for (i = 0; i < OUT_ENDPOINTS; i++) {
> +		remote = of_graph_get_remote_node(np, 1, i);
> +		if (!remote) {
> +			dev_dbg(dev, "no remote node for port@1 ep%u\n", i);
> +			continue;
> +		}
> +
> +		pl->next_bridge = of_drm_find_bridge(remote);
> +		if (!pl->next_bridge) {
> +			dev_dbg(dev, "failed to find next bridge for port@1 ep%u\n", i);
> +			of_node_put(remote);
> +			return -EPROBE_DEFER;
> +		}
> +
> +		of_node_put(remote);
> +
> +		drm_bridge_add(&pl->bridge);
> +
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static void imx95_pixel_link_bridge_remove(struct platform_device *pdev)
> +{
> +	struct imx95_pixel_link_bridge *pl = platform_get_drvdata(pdev);
> +
> +	drm_bridge_remove(&pl->bridge);
> +}
> +
> +static const struct of_device_id imx95_pixel_link_bridge_dt_ids[] = {
> +	{ .compatible = "fsl,imx95-dc-pixel-link", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx95_pixel_link_bridge_dt_ids);
> +
> +static struct platform_driver imx95_pixel_link_bridge_driver = {
> +	.probe	= imx95_pixel_link_bridge_probe,
> +	.remove	= imx95_pixel_link_bridge_remove,
> +	.driver	= {
> +		.of_match_table = imx95_pixel_link_bridge_dt_ids,
> +		.name = DRIVER_NAME,
> +	},
> +};
> +
> +module_platform_driver(imx95_pixel_link_bridge_driver);
> +
> +MODULE_DESCRIPTION("i.MX95 display pixel link bridge driver");
> +MODULE_AUTHOR("NXP Semiconductor");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:" DRIVER_NAME);

Drop

> --
> 2.51.0
>
