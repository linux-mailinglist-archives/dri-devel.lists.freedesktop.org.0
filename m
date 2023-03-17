Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480916BE5CD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 10:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F36310EEB7;
	Fri, 17 Mar 2023 09:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2052.outbound.protection.outlook.com [40.107.14.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C18610EEB6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 09:43:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vjcja9OOOFxL4wTVRbuUOB0ukNxteAXuCcjOoSv+zzuJCGdzZhvt0d516NjtD/gZQeaDX+VCNsmtkbhB0qNGEeiPnYJnaN0yaEoQlkTANTQ2u40xnpndi2Z5UoGpd7YvFsOffqDSI2euV8wPZm2h/QlEvHua5r1j5yqPxe/zeb7Q+sPjWTeBySHHl51Trwzq3bSv6J+udR9PvCU4EK/1I63gqqI5A3JNfsUpncTdXCVmCUCOacUTHQsU7vHa3V34VF7ISiue0kRDKL+SKBBNEvTyOwHbqdC+JVH3na/h8p1nvGQwJ/VmBtBN6tpT6j8lcSz6JPx6Yt5JLRD+yjaqpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+DMa335uPG+QbKasHPpgSNa1NcLTuGwFgs+L9GWIqU=;
 b=T3M0Nz5gKyXjjEeqKa9vaBJL8hwZIERgrpWmue586clV/DVFhD/fa91vqbsF3XkOBi23/VM2veHyZpAd4PDaZ+9aA2zMoWTjVpAEDuYEeHvKxP+5azzJM9nIhMjMZ8AL9ASUh8uG+S/5HPbuXx+ELb/ZDT53x/FBoDq5/hMa819acGbWmDowFmLimNS6vtlK6mIslAKmIfz3Ekc9erNlS3V0kBxivErb82V1YV6/go5wj1a36HZS7zOVLMYqjlGvodOy1ku2sDcjUHAHPa45QG3uzrr2iHQRjV/UhpY0UColBu8kjwVXW4NqO3bWbN28bU5H+88v3TcKJXG4s6Uhug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+DMa335uPG+QbKasHPpgSNa1NcLTuGwFgs+L9GWIqU=;
 b=Qc63iwO72VlKbC+i63CXB8moRncSeErdjjBIRJt2UVk72dkw0HteS7E/yV+NMXPYdAfkVqLCJePmjEF4ceZgTIZGeQxM1zQm3xR6COGB68FDyputu18Uz4q/D916bEip3YNOt9e5OHBuHG1hbuE9PlB2GbCOPZfmii9sewUfZho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB9136.eurprd04.prod.outlook.com (2603:10a6:150:27::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Fri, 17 Mar
 2023 09:43:04 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d555:5ebe:1938:29e2]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d555:5ebe:1938:29e2%6]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 09:43:04 +0000
Message-ID: <fc8b6ec1f05c1514b6ed5535e16c9c2d21efea86.camel@nxp.com>
Subject: Re: [PATCH 37/37] drm/bridge/imx/Kconfig: Prevent imx-ldb-helper
 from appearing in 2 separate modules
From: Liu Ying <victor.liu@nxp.com>
To: Lee Jones <lee@kernel.org>, dri-devel@lists.freedesktop.org
Date: Fri, 17 Mar 2023 17:42:21 +0800
In-Reply-To: <20230317081718.2650744-38-lee@kernel.org>
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-38-lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB9136:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e5d2bb-9154-4253-f38f-08db26cc0132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iue/rOl1llZKtVlDjVngki+Muc9JGJZMQwGZ0Xf4fDbPVCvt+B39i4XGvv+WyVst8uzZt+rMHUms2XpAwlYjC7+5pxdebmTic8keAFKZlmbF/uUwVnnsJ9H5IvtNHb7A9PM8wblchO+eKOCufSQyQqnHz6vsYpl7cuJcJNXqiNmcj0mB3jx9guV4vLrNZNHsy6o1UEjzoxCQE5rYcZlM2eR5xmWyLWB/+PqNAzYMv+QSKpEY8XBqbLZuxJqsxivpp7HQNAS7awYUwD6FDv2yI3+W7T++vi9BUdncmM5WQ7YW+d1DQsHeEvejyAIV7CfoyPHc3QVyGQe8MCOjAJTp3ZIJlmtlKAeQuaiV44PbCekF0UA+LdIXErM4uS2Mpu4VZNSkRuaiC9MeQQB5w69Pse9vSh3ABuPUlMmk7GZq5FCbsbuEbVoeZkBbKPRjSHd/v9tfAVTN4dDrlwHg5y5i5zqa3xBXSq1dBOK0JdXY3p1Tah7jYKC0GupktPK2Lu/CLForRd5jI6juMrAi8f9VoasWUVYnwSKpsEPrdqVOSOj8TIOfpqXrtVSspVGk8L2ECrBnhXDqMyJGWcgxknWQ4kRHZ1U2Fdw+CrPpyb742JJo3l5Z6Y4Wr90Z90XHy1xtqxFrnMSFZx42sg/KigsUgpwqU3IF4rO3prxeK+6Aj9Fa9Tq+ccq1Tl+xmAWg4vYQH4b9Gfr3grKplyWpnvlPxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199018)(4326008)(66556008)(8676002)(66476007)(66946007)(86362001)(41300700001)(5660300002)(2616005)(6486002)(7416002)(186003)(38100700002)(6512007)(26005)(6506007)(316002)(54906003)(478600001)(6666004)(83380400001)(36756003)(2906002)(52116002)(38350700002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clNqQzVHWGg1RXFCMG1YMnZEa3JDREM0V2NRQ2F6ckJqWm1vVjIzN0dpUUxI?=
 =?utf-8?B?Nk5VV1NGK044RExsaFlIcE9kTU0zVW4xZGJKcGZZaW85ZmZiNDBWaGNGRTZN?=
 =?utf-8?B?LzRnY3h0Y1I5OFZZNW1iUCt3V0VjNmZzbG55b2xuZVM1R3hIMGxTZnFITFhu?=
 =?utf-8?B?c0l1TFExVkU3WmpTanJNbFM5VVFUNGR5N0JsRitDQ2UrL2ViQkVMWGIreUNv?=
 =?utf-8?B?YmpHMG4wUVFVcmFTdC9aQWNVZ3JnK0syWkdlRUoxY2MxVUZWMzdYS2haMEpu?=
 =?utf-8?B?MWo3SjZtRWlyWnZlSytoZGdTQUJrU2dTY1BSaFdCa3ZvY3ZtZ00yS0x6eG1Z?=
 =?utf-8?B?RXBPQWg1STJ0cHlUbGVpZnZxaGVPc1JpRFdXcm9TakVQZzU5WDR6N0MrZFpS?=
 =?utf-8?B?ZnVvd2swRDhmRFBJSlNRMVZyMHhYVzRWRm9LbEEyWlBHY3NuTlZ3YjdxbTUy?=
 =?utf-8?B?N21KRUFYREc5Tmw3eVdRTXRGQnpJSS9FZHA1SVUvUWRNa3pDNlNSMkp6eVF1?=
 =?utf-8?B?aXVoUWorYmwyK05oM2lhZ1VvdnphYy9mcFhMK2JvaC9lMXEwWHV4MW9UMmF1?=
 =?utf-8?B?amZZTU1oOXEvRnZhNHZCbjBDRFROWVhnVzJyYWJKTDFQSndlMEVLU2x3aTZ6?=
 =?utf-8?B?cUp4T2FjR3RkQWFsNEZCLzhXbFhkRjdJUW1jdEd3RmJNMkFFczNpazFoMWdy?=
 =?utf-8?B?M3VzbXpILzh5T21qWHVPQ096aS9hSFExUVNicVkwMS9RT25zcmpLRW12VWQy?=
 =?utf-8?B?dERUOWJHK1RpY0JtRGcvZjFLZVdJV3RXUyt2VGRPeFpYeEs0Y3ZWNEVPdUkw?=
 =?utf-8?B?cnFVYlYxRFBKcTVPSFRDdC91RnU5cW42L04ya3ZobE5xT0tFcGN0U2hiczJN?=
 =?utf-8?B?ek9JSlRhdFhVN2JyL3FaeDhtREFMeGVDNStJYzE3Vk1zbTJjWTBiVThPSWpm?=
 =?utf-8?B?ck5xZU5CQWdFRkJUVDVkQklobnM0bjZmenY5MlkrN2xwWEt2VDc5LzErOWs0?=
 =?utf-8?B?N3hwZnNUK1ErdCt6MTg5NnNwM3JKUWhBSVJqQUNBUVVuSTJ6MzhZZmNiT1Qx?=
 =?utf-8?B?Z0pzejhyRFl4aFRwZ3J0ZVhwYnIwUmZObzJhbUxGR1laeHhYK3RnbGtoaVI2?=
 =?utf-8?B?U0pzY2RINE1aRTNEYzIvelFhcEpPa2dkdGJ2ZnkwVzlzM3VGWFBwSVJReURE?=
 =?utf-8?B?YnY0QkxoSEJwaG1tbXRqejE2T210eVNSYmNuSVpLMGgwYVRZWHVRME4vNlZi?=
 =?utf-8?B?cjVjQVM4RkV1Z0Mwem9PSGdSaG00b3YveGZMTW9MOEdpWWp3MGxxbG5idG1t?=
 =?utf-8?B?dDh2ZjVxSjNJeVVoL1M4ZkhMcUd3cDkzRVFHNWxrV0xMR1E5TVBzSjVMVlNl?=
 =?utf-8?B?RjF1Q2FmNnRFUDlZcWpPT0Rha0Y4ZzF0Z3lOWVIrZlV1T0xkZEFaUk9xSEoy?=
 =?utf-8?B?Tis4MCs2blFxUUdXNmdtdDdFcWxnemozblpoRTl5RmdQL2ppWnJHUjNEaEp1?=
 =?utf-8?B?Wk4yR3RpTGc4bGNpb3IxaDdlTmhrNXVNeTEvMzZZcEVud1g0amhCZmRPQ1E4?=
 =?utf-8?B?MlN1SU1xVTNRcVphQVNHcDdtOXFic29WUDA4NjBqNjd6elcvSUY1WU5oUXVF?=
 =?utf-8?B?eGRPSXRNTmkzZGNTcEpHY0NrU3R2QkJuUkk2WXhSbXNYRUxVcjNma1NYa3dH?=
 =?utf-8?B?L2pFRlJ2R1VacmVRclZmbURsL3hqMldmN3RaRktiUUsycHY1cEJnRE00Q0Y4?=
 =?utf-8?B?aDNnTi9QTUF3alh3NlRmWUlBRkNDLzhOQk0wOXdONnVMdUc4TS9TQlRCbTFB?=
 =?utf-8?B?Wlh2bVl2U0JVT0VwWkJNcTlyN0JSZ2JMU0RYWmRIZkhIQnRlVHRiUlNTTitP?=
 =?utf-8?B?a3hzZzh6Uk04cFEvWUd1cFdaQ3pFMEEvNVFUMDZQQzljUzd6eGtsR2xrdUFi?=
 =?utf-8?B?SFB2REJTdW92Mm9BdGwxTzgwRlUvaEFwODlZck5GRys4Y3NTYk9sM09xSUJE?=
 =?utf-8?B?N3lxTGhjYU9TMUFZV2JsaDFSdzZxSk1FMEZrelJWTVZQQnBlbTBYYXl0aHFS?=
 =?utf-8?B?bDg4M0FtcFg5YVhzSkMvaFNJcVBvZGJjVlRaeC96OE9XTGZXeFp3NnFGTE9T?=
 =?utf-8?Q?qohJseMb24gl3u2fQvckNSOmH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e5d2bb-9154-4253-f38f-08db26cc0132
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 09:43:03.9607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /A81ZEzQkSrQfRBVG6OkNvzgzgMigZliM6K3JLV7Kj0O+gQU30eEpWdiGi6soVtNmG+1Qf6o0rA81TMr7PjFZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9136
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lee,

On Fri, 2023-03-17 at 08:17 +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  scripts/Makefile.build:252: drivers/gpu/drm/bridge/imx/Makefile: imx-ldb-helper.o is added to multiple modules: imx8qm-ldb imx8qxp-ldb
> 
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Thank you for the patch.

> ---
>  drivers/gpu/drm/bridge/imx/Kconfig          |  7 +++++++
>  drivers/gpu/drm/bridge/imx/Makefile         |  7 +++++--
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c | 13 +++++++++++++
>  3 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 608f47f41bcd1..97018dcd078d0 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -1,10 +1,16 @@
>  if ARCH_MXC || COMPILE_TEST
>  
> +config DRM_IMX8_LIB

I would limit this to i.MX LVDS Display Bridge(LDB) library, so I
suggest to use DRM_IMX_LDB_LIB.

> +	tristate
> +	help
> +	  Common helper functions used by some of the drivers below.

Considering to use DRM_IMX_LDB_LIB, help message can be a bit more
specific to LDB drivers, like:

Common helper functions used by i.MX LVDS display bridge drivers below.

Regards,
Liu Ying

