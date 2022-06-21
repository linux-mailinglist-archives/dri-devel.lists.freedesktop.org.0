Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FF7553695
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 17:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E25510E310;
	Tue, 21 Jun 2022 15:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30041.outbound.protection.outlook.com [40.107.3.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F9E10E310
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 15:47:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdhvIIHiNHKBMLMv/4RTgwZPl0qtFT1WH8FTY2PzfiViiymF/EKg20FzJokVC7Um9sTVJKygjipxerARjh1lV+PEMhnuHSP2aScLEbCf9mcRbSKkWtlDkGQQPWkfbEka271Faw4oqtAOOfsna5zCGA4UC/FN4gyw2jjX+b5x3khRBdkIT3FCGaceIPUatJBfi2m6mDvfqwcchInN/G8G4iCZGQqD/VpYVb+kfhb0oUPRQC/ILpswy02FqTY6nM9pF8BALSO4i1vEigyAr4HNOlJScfBlg3xlLXGd3hdwU8yS34ir3no7P1sVQZaRve5VFveUhrM/toCgjU4/9tD5jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gljavoVvE3n64SrouUkr1Y+2pC912lEs+myUeDiOXiA=;
 b=gvZhgkYkZe3+pAcjv8lW0CGAEiOmBvQnA6gDjjCXdMqWdcZc7Ew4PfjE2omcuKbOLRd9Deunff0H72kNCOl0KiGWrBdvlhK2uQWN+0SOuUCc5klW/k8PShbgKjBoIwWGSSOTK/DWTp39m6vvwuB3D6MAblJCRsmtQNkWJa3/2x1ScI6pkmar5FACmfVdP6XshZxqdpqaB2BvyX9ZAbgWxOJO+MTt4YFDWxl38l1Jx6bdRhBFlBkoGoe0jo/TJFVfcIMiHw9qwO4QAzUmRrnhZ35r0MTuoBNmR2XMaOT4xOiwm/i9wAhwcf+DKm/HQrcnEWiBzF/ZFAtMk6hTmIZKsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gljavoVvE3n64SrouUkr1Y+2pC912lEs+myUeDiOXiA=;
 b=p4wMGI85SAsrn0JYyUbpJApuT2D/5/u2QtYF2Y59B1+VL4kkd1o8QnlVk9WyOZpCdwPrEBDoGVvtBGkxTFou6r0i4UcCIzEoGC9oDaqZYqhy9cUeGXPa/dSyGhFZf0ZpHC1ol+SrG7nVALrD2tEQgf1dREYo18dpn4ETAMMn9SE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB7PR04MB4906.eurprd04.prod.outlook.com (2603:10a6:10:21::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Tue, 21 Jun
 2022 15:47:27 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%6]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 15:47:27 +0000
Message-ID: <88f11e5c4704bd8510c2c6a171536484a2232f82.camel@nxp.com>
Subject: Re: [PATCH] drm/bridge: imx: i.MX8 bridge drivers should depend on
 ARCH_MXC
From: Liu Ying <victor.liu@nxp.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <narmstrong@baylibre.com>, Robert
 Foss <robert.foss@linaro.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team
 <linux-imx@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Marek
 Vasut <marex@denx.de>
Date: Tue, 21 Jun 2022 23:47:16 +0800
In-Reply-To: <43645c9b5cd657664c1340d40133f2116c8cef43.1655818025.git.geert+renesas@glider.be>
References: <43645c9b5cd657664c1340d40133f2116c8cef43.1655818025.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:3:18::34) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fc050d4-e736-46bf-a914-08da539d57ce
X-MS-TrafficTypeDiagnostic: DB7PR04MB4906:EE_
X-Microsoft-Antispam-PRVS: <DB7PR04MB490682A7B8D8919845197ED898B39@DB7PR04MB4906.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y8oo4hQ3X0IllcrguF3vqIR5AaODNM0CCUP12J0V+PqObXWhyqi5FCzcURapiaRca0hLVgRXnBIOZOsDhAjP5EgD7m7HASIt0h1vmMYNuROT+Fs3oJ/mEV35KXH9LYEiocvDfknQ248B40oFDmsAYr2HwY3mQ+Rhl/lV+J2FqmAT1/lj2p4hEI5lHgFVr4v1SepgSFZRnHvFco6QaogIg07wTwVh3lAYDywsEl6Gjc+zgdj78DVys7W1pn1ubWqRQtzySEcfe0JhqURgY7QXuFDGGxHfdjRBlHPZeVD209xebwPY7YMU54/7XIfRue8yzZXCWJjEQ4OMHNyz/5mpAmQscSxlgYLyo+DIs3UdrpXIt5DJdck1+tHESdg7uRD85SfY6bdL/IaRptKowhOAXbFtbyFxfGEC3yIc0i/3D+ufUZm76pFF/b7X0ScTSjhTi5oCbKnotOCYuAgQ14hREgsPX07mmoqlVHs5qvEolVQFH5jKOtd8ZibfsI+96KomkhgCDHvPVG+AeT1zr1FPKUbJz/Rmp9frgPGHyrbvExhrxNz8Ytee4KEXb67jkTw5+0P483huysWrmA5HpX8lRwFuYzKLr0dXqPXagxln4zeTrJ7b//kwNERwpGoZo2D9+h3A6vnPG1wpIGH8lmFRyi+iQQwk91EvulMCBrR5ognSVxDe8xcNVOtsHq23s2Qp76UZXeL1UheEGdjT7DY3OWimBvU0wSdWsxodLWB0WMwInnbizs772t6M7qWezVMq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(8676002)(66946007)(921005)(4326008)(66476007)(316002)(6486002)(478600001)(86362001)(66556008)(186003)(26005)(38100700002)(38350700002)(52116002)(6512007)(41300700001)(6506007)(5660300002)(8936002)(36756003)(7416002)(2616005)(2906002)(110136005)(6666004)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d09tMzU2b0hWdEJITjV3RmZSNDRrdEVEdnBlb20zNmJSL0JOQ0FXWVl6Tklj?=
 =?utf-8?B?azVnWXo3WnRRWGV1WjRXWEtBaTRrUlpjQy9Ia29Obkc1NEdzK1Q0cnhsUDd2?=
 =?utf-8?B?Yk5kUjEzMU9KNGdWWUMxVVJWY2d0YXVidTJkYkwvc0pTVk5JWTZhM0I5Rytu?=
 =?utf-8?B?ZVBsaWVHcGpTRkV6NVZjK0ZRMWpjYjA1QlZaNDh2YXh3MThGT0dNbVJJNmNQ?=
 =?utf-8?B?TUR0NVBGUERVSEFTcjl1dDBoMDRUU3U2SCs4bGZRV2tucGtra2ZXbHpBcmpW?=
 =?utf-8?B?MkJUeFJHQjFTYjY5RjRrTStCaE1aVzlxU3RPWjVheDErdno0NGc4aU51a1Fy?=
 =?utf-8?B?enlBOFFtOG8wby9tSzNCWjg3V1lQS2RFbzhFVXNVa0pSeVFVSVRpeU1PRzdG?=
 =?utf-8?B?bytxeTBCc1NKdWI5WmE3bjhtSHpzRzZ2WE1LM1dzOW9qVk42V3NWdU5KT3BS?=
 =?utf-8?B?V1c1YnFKZDl2ZVJQYnJTdmRIeFprNnA0emd0QnlZWVNxT1UwQUhrTG5xU2tx?=
 =?utf-8?B?cld1ZmtpTDVWTzFnaFgvK0tGRnNWaGFtMStUM2I1YUVPa1Z5S3NtZzJOSldQ?=
 =?utf-8?B?MjRwRWxvU2l6SEtsWit4UzZNQ0tNRndXMW1jQk9ubFBMb3lTbTA2UUMyNFhW?=
 =?utf-8?B?TW4yOU8yYjJDNWswZjVYYkNReitYM25VN0tPalZZMFBRdkhQR2pnenFRR1Vi?=
 =?utf-8?B?NGRscEtCRWl6MDVyMkdWNWQ2Q2s4ZkdSc3hpdVd6azk0NlEvdWhraEozQnpr?=
 =?utf-8?B?RzUyR25xVGg5WFRTSVJvMnF6K2pmYy94NVJqZmhUWmxvaTNaMk9iVElZZ2RS?=
 =?utf-8?B?MUxFRElXRlZjSEFKOXE0aVp2RU5TaFgweks4UnRCS0RZTEdHYUFzV0d1YytB?=
 =?utf-8?B?Vnlnc3JsUUorM2xSU2djTHdBSTlyT0ZyYmNUZVlpY2dsZVlGTU9TdTJqVVhJ?=
 =?utf-8?B?R3MrVHZOV1lWaDJCN2YvUFdGb3Y1L2sweFJPZDROa0NNcUYxRGxJdXZDVEdM?=
 =?utf-8?B?eTFlaTFWRWo3WjNzOWZPckZDUFJqZjZ2cktHTUtEaWYyUlVMK1dYZ1oxTFI1?=
 =?utf-8?B?anBpYXJDaHNVNFc2ZUtKOGo2TEw5MHdnbWpvcUprV0QzRVVLZ0RHVFFxdStV?=
 =?utf-8?B?WVRUUUhrVHc0VDZVdTJMczFRbjJnK1k3MlEwU3pGNnM2enN4cHhDTncwb1Jp?=
 =?utf-8?B?c25HOHV3MFNjbnRVdGRiWWhmQ3NUVjk2VXR1Z3RLZTRkcVUzNzlWa3JJVGpB?=
 =?utf-8?B?anVZSUtodE1NeEYyWVVJbmlINVFRS2JUOGhUQWFqbklwckxZNXFxTHlFcFg2?=
 =?utf-8?B?VFhtRVpyMXpyRkhJWGRPTkorN29zTjY1TEZGNUVjd25meElkanhMdmllN05M?=
 =?utf-8?B?dnFhUy8zMDBzclIrQnVRaGtFemNzMnlURVZ5Mzl1dXNJamgwTGNTbFViZEF2?=
 =?utf-8?B?bHliUUNxZ1M2NmVyMThwWHlLUnJNZGMrNHhucUdjVWNkV3FYZUxoTG1IbVJ1?=
 =?utf-8?B?ZFhISi9ORXp4bkFuSGloQlRlSzBCZHY2Snk0eVBIWThLWkpVODNIZVRHK0VO?=
 =?utf-8?B?dHE4OGRKMFR1U2piWUh5MmhVS2pFZGlPMWZlQko2RS82T0FPQlJyajd6cGNi?=
 =?utf-8?B?dmVaU0NUMnRkY0EyTkcyeXVqUXFMMk9SL1FVMFFWcFMwTGR5cHVLSHZUcHBa?=
 =?utf-8?B?NG40NXQ4OVBkQTF5QVlVaW1NeDMxcm51SDFpQzlDKzd3REUweUFIZlpWSjMv?=
 =?utf-8?B?a1lPTEdCdjlGTFRTOEdSU2RSWUU4dzAvZGNQa0ltZmhkRTZVbFJkUSs5a0Jw?=
 =?utf-8?B?RW1WMlhheS9uQjA4clEzbHRCM292NkZjN2Y4WWthSDVqNzBXUmpiQVRJVGxv?=
 =?utf-8?B?RWtUQzUwM1FqYkVweW1kbGx3NHZpV28xNTYrWDBQUlZkTWJPME9PNVhnRjR2?=
 =?utf-8?B?Q21sZ3A4OUtjTTEwWVRiMC9NQS9DcDhpNXNLeG9QU1R3UkdpVnVCV0o2MGpz?=
 =?utf-8?B?NCttWkpPV21vRWhXcEMvNmw5Wmp6bzlxNHdlU0ZCSW8vVkpGVm1EcHN4eGF6?=
 =?utf-8?B?UWwydXFBVWZWVm50Lzl2SFZzRjFabkIxR25LZC82V0FvVjk4YlhBWFY5aDVB?=
 =?utf-8?B?NnhYd2RwVjVNbUFzOXB2OXhRZ1p4WDZzdGxxaGZkM3ltTFU0VXRmbGJpZE1l?=
 =?utf-8?B?QTZTQ2ZiZlB2QmZudHRIVFI2MjhqY0hER0pQWi8vQTJIVzIrS0liaEVXT0F4?=
 =?utf-8?B?QzNwQUxzTmkyYXZ3OHhKeVYrNitKSmcvUmMvYTRzaDJRUG96VUhKL2MxeTR6?=
 =?utf-8?B?SkliT1JGTExESXJEcDR2Vm1ocnZqaU8wMDVTcElHZkNydHVUTHQ1UT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc050d4-e736-46bf-a914-08da539d57ce
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 15:47:27.6978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQVIhC2LYwfZpyAnk/GKY+PDA8iywH1R0j9LArkv1VtWUh59A31D5c2E3p12UNHlwDdQ3VHBGg4Yuiy80Th41A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4906
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-06-21 at 15:30 +0200, Geert Uytterhoeven wrote:
> The various Freescale i.MX8MP display bridges are only present on
> Freescale i.MX8 SoCs.  Hence add a dependency on ARCH_MXC, to prevent
> asking the user about these drivers when configuring a kernel without
> i.MX SoC support.

s/i.MX8MP/i.MX8/

For now, only i.MX8qm and i.MX8qxp display bridge drivers are in
bridge/imx directory, no i.MX8MP display bridge driver.

With this fixed:
Reviewed-by: Liu Ying <victor.liu@nxp.com>

> 
> Fixes: e60c4354840b2fe8 ("drm/bridge: imx: Add LDB support for
> i.MX8qm")
> Fixes: 3818715f62b42b5c ("drm/bridge: imx: Add LDB support for
> i.MX8qxp")
> Fixes: 96988a526c97cfbe ("drm/bridge: imx: Add i.MX8qxp pixel link to
> DPI support")
> Fixes: 1ec17c26bc06289d ("drm/bridge: imx: Add i.MX8qm/qxp display
> pixel link support")
> Fixes: 93e163a9e0392aca ("drm/bridge: imx: Add i.MX8qm/qxp pixel
> combiner support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Probably the remaining i.MX bridge drivers in
> drivers/gpu/drm/bridge/Kconfig (e.g. DRM_FSL_LDB) should be moved
> here,
> too?

DRM_FSL_LDB is for i.MX8MP LVDS Display Bridge(LDB).
Here is a kinda appropriate directory for that driver I think, though
the filename fsl-ldb.c is perhaps a bit too generic(we have imx8qm-ldb-
driver.c and imx8qxp-ldb-driver.c). 

No other bridge drivers can be moved here, AFAICS.

Thanks,
Liu Ying 

> ---
>  drivers/gpu/drm/bridge/imx/Kconfig | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig
> b/drivers/gpu/drm/bridge/imx/Kconfig
> index 212a7b0e64fd8b5a..608f47f41bcd1c81 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -1,3 +1,5 @@
> +if ARCH_MXC || COMPILE_TEST
> +
>  config DRM_IMX8QM_LDB
>  	tristate "Freescale i.MX8QM LVDS display bridge"
>  	depends on OF
> @@ -41,3 +43,5 @@ config DRM_IMX8QXP_PIXEL_LINK_TO_DPI
>  	help
>  	  Choose this to enable pixel link to display pixel
> interface(PXL2DPI)
>  	  found in Freescale i.MX8qxp processor.
> +
> +endif # ARCH_MXC || COMPILE_TEST

