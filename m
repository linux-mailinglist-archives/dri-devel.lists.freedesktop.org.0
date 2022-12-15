Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAFE64D7D8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 09:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E138B10E0B8;
	Thu, 15 Dec 2022 08:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2126.outbound.protection.outlook.com [40.107.6.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF29B10E0B8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 08:35:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdW+LDrVJP7ordok90kG7p+mqJyUD5rlcmLBOflsBRkKflOdN28efv0qv7GwMdJQVqkg1sgK2nHzcElfq4WZKn3EAafafYSekS4692J13wI3t3k4fj1XhROJ6PwfwQIqy5aN+JxKfAa4t6LaKPc7/lfVZPVX08khwUpXmhRytHmFqZ788hUadSv6sLmIoFsfK9vNmk/+XXK2ZGJV3kg9iZ/9+dUS833fXis5z+hrmDGd3kKWgSa1huHY0Vm4//1auVLcqLI+L4GK/aSn9pL1qU46a/vrZ6FqOvwpe/i6rn3E9E5T8EDbZoQaIqyuVlcHrn0+wu/0aXYwq4O5oxZrHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nON4l1PIkwMOqpRqXfgUG6QrEFalx+4WLewRYjMFbX4=;
 b=YdVW4IClkKETA0wyOUr3tmd6Ny/5nj9IvfwPoJcw3mFI1xhuxJiOHeJoOVWIrVWnSEmvWJOkmCdpd78TgB2pt9c+t0i6O/u0nfiWpKAYDRFc2P+lW4I/X9tIGkT7aryy4Q4sThTbOHfjFkbOtqOTD6KeG/RO1DmOHV8GrtmOnLaqmBuRMoILtVVxr4xQF9QVK5fh1Q+KHJgRLgt26aLwsGL43QtqSnGjPVHieJrw6tbnIJVA9zByn51zRaWkEljRHtRiUpxoc2gKIVeDPcwaIeLajzTTr3bNTmPlak45DiycWk1b0vSazgke2za9wnIBKFrQKByGWluZj8a2/Oktlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nON4l1PIkwMOqpRqXfgUG6QrEFalx+4WLewRYjMFbX4=;
 b=FOUeuBjD3Xb+ckGY6bLSxhtPVM31P0i1OiVwsYWksb1QHUdBxYDkWBhApzVZ8BEIqSwYcjRIowe3slyZfvkFS5DCmfqwb7L7JtQapbUH9Se4zjvJ/UFLJmozwiDu1KXnEa8Mlzg7kM3TNswS6lknTjmRxl9dJRgFIL3jLSW8f1k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AM9PR10MB3989.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Thu, 15 Dec
 2022 08:35:42 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%5]) with mapi id 15.20.5880.019; Thu, 15 Dec 2022
 08:35:42 +0000
Message-ID: <b0be2c8d-4121-6963-54fb-461f5bcfdf52@kontron.de>
Date: Thu, 15 Dec 2022 09:35:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 07/18] drm: exynos: dsi: Introduce hw_type platform
 data
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Fancy Fang <chen.fang@nxp.com>,
 Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <20221214125907.376148-8-jagan@amarulasolutions.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20221214125907.376148-8-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::6) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AM9PR10MB3989:EE_
X-MS-Office365-Filtering-Correlation-Id: 3015e2fb-c5e1-463a-ca82-08dade775a16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2HgziErJWLAaS6oKHC314NVkMG6dJI8jrVEWWs9P5p4hZ4JmoD4jrHPdO3+bruSn3xxQOuhhFeIzjCcgDONl9CCW30+k8xucERFz7uRXF3QngQQZK1D3fC84VVYmSk3CiQygmLMGh2WLYLlVERTBKMuzBJWnFHZ27KpHcKryyLCyVj8fNB9l7zHcvcL/ZriD2/TnlUWNq+x5hqZ2zGe5wWXAILyJNjhADQt7+JBxCAbZCivTqpdtQrEg5eN7cddLCpRoYRbDg/vyT+DL6ffNckb+B7pIRp0Z/KbOieXWkt0+NS4MnKfdhm30NOhvYtKeE7vpgegxm15M4DXhS9Qxgf+ubow1Dj8WLiqHsHHhSvuC+6GJWNDoLxRQncCkFlmPrcMVTh+I8A4zqPFxWhDQwu9Xg5kNs5l4eeyJ4QUpIumuVKAFpVQMLAD+IYL8VhbC8cIdiPR9OicZ43jCLBptC/thMQL95IFwqTBr3rsCWtLW2tyAyRW0xpwXZUM3R0CkN6vbkuV5IuwGNLNkSRJhFgRJhu9uf6voy42j/QlQr8/KenLwzmHRm2gyTHHD8UMgb3ISyubLTCT74g4dvEZH7ViHZ5bIgmtORpY93gCu1ZgqID0eBGiWWzZ2CsrMNS1IFZIgxHpVzMnadWiP87bOMTLdGTORKCO9VXDsub7d+uROwXW3ic5fJBrUIeOgGfTVMJFzkD2q0q76PmfghNgh7nhGmXjPIss4NsOU02BMb3UD155e2LTx6aJbyDv0FgfA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199015)(31686004)(36756003)(31696002)(921005)(86362001)(186003)(2616005)(478600001)(6666004)(6512007)(6506007)(38100700002)(53546011)(6486002)(44832011)(2906002)(83380400001)(110136005)(41300700001)(4326008)(8676002)(66946007)(8936002)(7416002)(5660300002)(66476007)(66556008)(54906003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWtXZndFWjJHazJIcldVZW9mVVVnbVpiOEVRNHJUcnhSbjFBOUR0dzdhVk9w?=
 =?utf-8?B?SG5iS2xHaklwYnpoZ0RFU0p2ODcwbEpMVXRHRDNPMnZDMzhNUzBBZVJPSU4r?=
 =?utf-8?B?ZUpqVTRVL1U5ZFBuMTFqYkcrSEU5YU9MOHNSWmgvenNDOTJrcUcrdnVGRnJT?=
 =?utf-8?B?YmJFV203TFhFdzZscVNuUzlYd0RjYTFSUTZSOWZSSWtXeFczc0ROMEd0Ykth?=
 =?utf-8?B?d1liVHlqalEybzhVMlhEb2M0emxiNXhGaGpHZWhWK1JuVlFlMXNkWnY3TVlo?=
 =?utf-8?B?MUJRSFloUVAvdTNGclpYclF1U2JnN3M1WCtMeFMyWHAwbGZUcmhvdTRXaGZv?=
 =?utf-8?B?dHRzRlR4VmVVVGRCUkJFWEVaZmdNRm9mM0tOcFhKVFNOb1VoekN6d1hIUEZ4?=
 =?utf-8?B?dGxIckFMZnFZWFh3RWdJL09WTFEzTWRTcENYT0tMOFNVQVNGOE4zTmRRaXJh?=
 =?utf-8?B?bjdwRWpTQzJLQVhvU0c5NUpGOVdjZGNpN1VBTE56UTcrcC94aWFxSEI0dFc3?=
 =?utf-8?B?STh3SzRaTFROYlBxWWo2RWVrVE1xYURtejZLZkRJYWUyK3BZMnIwcThJaElm?=
 =?utf-8?B?Y0FYY01iU1pnL0dqRnZtMVZoT0hrNHU0MEZLUUxXaTlJeGFQZ29tVmw1MzRE?=
 =?utf-8?B?TmFpRVZSdW9SLzE4endkZ0sxMWlndVgrcDBNU0g1MXBoWDhTWmdOL2VqM2lk?=
 =?utf-8?B?b3VwMXEzZ2w1T1RkazRNcWlTQWFQbXdmQTFXTHp6Qkp6aG1hSVJYMWxCZDhu?=
 =?utf-8?B?THBNVlFRNUp0VEg1cVVWL0xJcGRqamhLNjEzUFZLUXp1aFk1OHBtenJWUnlT?=
 =?utf-8?B?Vis2TG01RmNZSDIvT2VjdzlGR2hubFRuVnRTV2J2Y25GRXpnWkZraXRZQUxE?=
 =?utf-8?B?aDg0RmhCMEZPV1VLYWVPLzBjWDFjeU4vVDNCaHMrUmkrelpnelhHeWx0ekdF?=
 =?utf-8?B?Y29lQmtvemZ3YTVENmNqUkdoNmVCYzRNenExSDB1cmlWYjI2cUJOc2pZYWNS?=
 =?utf-8?B?aVpBUDZ5NzdGVUFXTHdSV21BajArMVBaeTU3K1RNQytPMlVnNHQ1OUlnaDNp?=
 =?utf-8?B?ZmlXQkxaVVVjQUkvbklDY25TWVVDOGFmV1BWSVBESlIyUGJYMzZDL3UrVngv?=
 =?utf-8?B?S0oyaWlBS2xmemsySE1WQ01sNDdjbHNPK0VhZTh2TENsZ29NNDZJbnR5cFUz?=
 =?utf-8?B?RVI1Q0VwVVlKZTFpUHVOL29QKyszMUpHSXlNeXVVQ0lHQWJpdXF3NFVyblNM?=
 =?utf-8?B?UlloNmY4YkhaVnpMVitxWWpvSk9OMHlOVUlZa04yU2NUZ01lT1FJdnJ4S2hO?=
 =?utf-8?B?bE01ZGVPV0ZnYTdIT1FEZUdOckFyb2NlemQvWmZHUU9lUlU4QmZEeFcrSGlr?=
 =?utf-8?B?OGRodG4wNEkyZ04vdEs4NUMrYVMwR0x6d083eVRCUzhTZkN3bVZlQXQvOTJy?=
 =?utf-8?B?d3M5eEJBcTJ5NkNHRS9pNmxOSmdESUJFU0FXbXVFdjhYSE05azgvYWUzQmxU?=
 =?utf-8?B?aGxvN1R6SHdyVW1qdlpTYmxkbzZIVWVQR2pOcjFSNlZXVGdkK1JIY08wQzhC?=
 =?utf-8?B?dThkU2E4d1psVEhuc2FWeVlMV2ZlZmd2MEZ1dUwxK09YakJPOHl3SmhzV0gz?=
 =?utf-8?B?R3RXYXRSRTd5TnVLQzZrMFNNVjJWZWRXUWZ1R01YYnhlYmdtdzBYemRQZnBi?=
 =?utf-8?B?TTc3L0pTa3RGdEhNNkplU3FoRk52ZThMQmh6Y0hPMVJheFprVm8zaTVpaDNW?=
 =?utf-8?B?MmRJTWZFOUFFeWI4NXZxNkpCWkkxZnFjYWpxdVdlS1VMSkVOU3Q3SWp3RjFy?=
 =?utf-8?B?VjFCWGRDUlY5Z1lYRndQUjFJVVpUeWZDNFY3RjAzRWlTVU1PVFNrbDN1VU9K?=
 =?utf-8?B?eVRENlEvWnpHTUhPcWZPR3gvWWhJNTNHL2l0cnkydmdGNUVlekRPMFA2Y1Bv?=
 =?utf-8?B?UXZNb3JkRzRIZU14NUdaVVA5UXQ2REJUODl3bDBaOUNuOUc5d0VxVWhPek5V?=
 =?utf-8?B?R3FTYjFZa3ZBemUxQ1pTSndBUEkveWhrL1dPYWFiL2laY1RzOSs1bzMvMkhK?=
 =?utf-8?B?TkRiakdjeVNyTkJtUkZuTlBXZ2l5TTRrYWRtaEtzUlNGRWtqQmVLUHNkNEc3?=
 =?utf-8?B?dGZnN2hsZVBsTzJnOFRxd1ZlZDJNbzlkQ04yemhjdGVHL3VHK2NXeGVZZGUw?=
 =?utf-8?Q?5Vct4Y9c2/k8j/cXaPlso3Y0KTnbySgM5IekN20jT5Ss?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3015e2fb-c5e1-463a-ca82-08dade775a16
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 08:35:42.1995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGdfD37+mnpzj8tsIQ7McdSpR6S6HhBvjepWPjUw8IXxHvw5f8z2pOi7lroXh6rxc6s03p+87F+iarcPr0bmMvMldncNIHYOSXjUG1gopbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB3989
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14.12.22 13:58, Jagan Teki wrote:
> Samsung MIPI DSIM controller is common DSI IP that can be used
> in various SoCs like Exynos, i.MX8M Mini/Nano/Plus.
> 
> Add hw_type enum via platform_data so that accessing the different
> controller data between various platforms becomes easy and meaningful.
> 
> Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v10:
> - split from previous series patch
> "drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge"
> - update enum type names
> 
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 84 ++++++++++++++++++++-----
>  1 file changed, 69 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 7a845badb1b2..fdaf514b39f2 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -254,6 +254,16 @@ struct exynos_dsi_transfer {
>  #define DSIM_STATE_CMD_LPM		BIT(2)
>  #define DSIM_STATE_VIDOUT_AVAILABLE	BIT(3)
>  
> +enum exynos_dsi_type {
> +	DSIM_TYPE_EXYNOS3250,
> +	DSIM_TYPE_EXYNOS4210,
> +	DSIM_TYPE_EXYNOS5410,
> +	DSIM_TYPE_EXYNOS5422,
> +	DSIM_TYPE_EXYNOS5433,
> +

The empty line looks a bit awkward to me. Otherwise:

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> +	DSIM_TYPE_COUNT,
> +};
> +
[...]
