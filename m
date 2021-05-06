Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B9F375822
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 18:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BCA6E15F;
	Thu,  6 May 2021 16:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2122.outbound.protection.outlook.com [40.107.20.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CA26E15F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 16:04:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bznoEDURVk3dgChEG3rWDsUrRNjt3T1N5w4LIraSBKx7ibdjtpvkxolTMBY8FlIg+ENgdti+oV8qVcl07M1X9oG77UZKYdux3hbj3wF5FHfbzaLZEMLIF9lFISTW6EVIelpTRpRK9K9rkOyJwqqkq/6LrCDUR0MD+LdFs41+Kt5oslPKiackoGV1TcqkUzFzr1czhJqWN4aVhpc6yXnCpywUbORXdamddfeUBHWIhPkLlP8lEcqgjqOcWlAOmjZViKMhLBaPsDdnXpLGYyoPzSzDH4i5FQIO8suAwH65J08AsiMLB/qLvflPabJ8fORlMICy1xUq+rIuLcGpJcMfZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJER2mVco1kAcmJ1xWkV/XQbT1xDn7Yljyevrpt+S8c=;
 b=e3R/coWad4CV0bk3x+qf9YAieOgwg5LEiKLipp/ZuCIFEU6FYi0Kr2xvMG08naeKGnWU5kDrkWbgAp4QgpMoU6jHvCnLw0g/9C9HcPZAaEKKecASMbOjr6pqprrn71KSd9CPuf+YmTGcfNbRHVvv4XtaHNb+ffMZwU64gIL3AmdRksViHdG8+ukhpPkhhr7AtB7HDBPhlE5G+SSPqyvn7yabmhuyXOsZwv3ZVppkYDPkWUygq8GHTYQ9hCX3IKNZkOFysR0IUUt+IyV+xHPaPKykqR6Ydj+x+2GyRytcsf0TCGbLXBeIUkF+W8Zt143D3spckrOqBVPix9o8anFHig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJER2mVco1kAcmJ1xWkV/XQbT1xDn7Yljyevrpt+S8c=;
 b=VAX6c1IN8sCno7y6S+ZsQthFZUwBRdMNgsn/7bAVLebOr1khGzQ6xFZp84sawjVngzIENzJhCP8N9oDGmgK8r2RpFW6mu29Anhvm5qth1MRt15sr5mqpEye+bDk6BikATEmZqcXuVuukLUzpbgRvb71zXuEAT2fE2J0vQqsCdyk=
Authentication-Results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM8PR10MB4196.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1e8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Thu, 6 May
 2021 16:03:58 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 16:03:58 +0000
Subject: Re: [PATCH V3 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20210505100218.108024-1-marex@denx.de>
 <20210505100218.108024-2-marex@denx.de>
 <2655a86a-d371-6a5a-715a-53b73a696d28@kontron.de>
 <7da2c2d2-fb02-0a1b-d853-bfd756a0cd9b@denx.de>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <61e269b7-870a-01a8-722b-15c9aecf9bf9@kontron.de>
Date: Thu, 6 May 2021 18:03:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <7da2c2d2-fb02-0a1b-d853-bfd756a0cd9b@denx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [89.244.180.42]
X-ClientProxiedBy: AM4PR0202CA0021.eurprd02.prod.outlook.com
 (2603:10a6:200:89::31) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.27] (89.244.180.42) by
 AM4PR0202CA0021.eurprd02.prod.outlook.com (2603:10a6:200:89::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Thu, 6 May 2021 16:03:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 873eb74c-eb52-48b6-f690-08d910a88eb0
X-MS-TrafficTypeDiagnostic: AM8PR10MB4196:
X-Microsoft-Antispam-PRVS: <AM8PR10MB4196BE20D69BEB0BF1F0C164E9589@AM8PR10MB4196.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eq7YEmJkvUm4AX4x051nZm+VIeyr0WFb/0XgTlPN04qsC43McH4ScUet/7q/xrrDpvglLXwnn0eBybPigdjGRHQQu0kDOWT2mKY87lPW4Q4Y++5qJ4LenYkYiZRYlNsoiA1i1kU0qJkzWMaq/+tluoGrz/unnFOvgADs1jTl3UenEJPulhptFmmbI4yLLu2qLaQkHu3VaWFmpyUruAtA8H9zNW/lw31NDkjdF2gWpx1e0LIc0j0Nqr9/SI3yeGRGqTfiIYZBCOwMSEk0n+zZ15G57QrrTRE2gjlk5o/3fObkUh0YUqvQIrTHh+un97cSymQZ1FsG1u1xc4vdkxZk5gNsIqZI+eB5Kz6bNpZQE+87GI2ORGviSLBJUzKNEsz8YBFihB4/zGrLcn3909AbPeL2jsuC2FNwGjtFRrw3Y8I9bTzdICi9Ifw4M6ajN6Dr4QshMu7RZSOtczrMb951+lxFb5RnetORtYHKWcrryEa39DRwC0z5bL3TxI/tdjYvbYy9wfI5U28KJmVXogpb7Y1F72KT/dTiaHFhV+05mVzr64jffb94VooIr0BwF3K/O1vdsZIECwv+bHdWmObZPRWMNUkusnQ3e/GYoyoS9pcGYuAx9R5Um7PujFAv4epCrVJ0crEPE461L8YfuYfRLNzMKyNHTK3F+50k1IPtO6AUWqY1lPkx7U1AKGuJU+pn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(366004)(39850400004)(38100700002)(44832011)(31696002)(83380400001)(26005)(8936002)(2906002)(478600001)(36756003)(956004)(54906003)(86362001)(8676002)(2616005)(6486002)(66476007)(186003)(7416002)(31686004)(53546011)(4326008)(316002)(16526019)(66946007)(16576012)(66556008)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dG9XQ0UvdW0yaUdLTXJodVRIQ3pPblpFZ3JoeHQrVHN6K2cvSzhqSTRRZkdO?=
 =?utf-8?B?RGlTamxYZFVaRWlHS25zRHZRV3NEWElxUHN5bWdvYkxQU3YwcExkVzFhUzlD?=
 =?utf-8?B?c2tiTHRCak9XOHQrcU1vYkx1OEEyZG9mb1cyOENad1c2WEpLL2ZUZ1NaLyty?=
 =?utf-8?B?dG0vWlJ5VEg1VDlrOU1VZE9IeURnWno5RDBDNVRKcnpjK2ZzdkxRbkZma3hG?=
 =?utf-8?B?ZXF1bitPZ3NaOFAyT0l6eGZmTkg3enJuMDJZZmpQdkI0Q0xEb0w4dHdEblA4?=
 =?utf-8?B?cFFaMTlJckVCVkZ3VDZVSVN2R0dhZGpTQXFoMWtDR25OSzdIazlVWGVPVXBQ?=
 =?utf-8?B?T0twVlZvNUxscEhzbEdPd2tMNjFpanZmdVM2NUdaNFJSZ0x4MjQxRlRzeW1y?=
 =?utf-8?B?UHdYTG04MVhPQ1BhZDl4dXgzZnBuZEZRUWRCaGRtamswaXcxbnNteUpraWly?=
 =?utf-8?B?QXdTbFlzT29qY3A5REtFNlM0V1dNMDhoaktZTjVvOEU0MTY2RVlYdEN2RmNP?=
 =?utf-8?B?QVdxVkRzMXppSG1xSjBaaXdmQm9mQ1c5OFdLZUMwc2dKS1NVWGQzS05KdGlW?=
 =?utf-8?B?ajRsV2ZnRE1INkJlVHFDbzR4MzJodU50UWU2MkF3bXRHUWNIOHE1TzVja1hR?=
 =?utf-8?B?WGppV2lTNjJBL2FaMXQzRWJ3bWxjZitlQlFseVNyNnR5bm9hT1dKaDJ2M3pZ?=
 =?utf-8?B?ZTg0YlZzQWxlNlRxVGxmWi9ZeER3L2R1aElrUERzbHN1Nlp5dVhYRE90ckZv?=
 =?utf-8?B?NVdrNkNiM1hNb3F3NjNDd2lxKzNzazc4dzRrU3NuTE9qR25sblZUdWk1ay9v?=
 =?utf-8?B?MUt0bWdMbHJuNVp2VUV2WU9kMy9tSitMRnZTQ2IzNGFHcForb3Q2Q0JlUnY5?=
 =?utf-8?B?V1JjMGVOSFJOUC9SaEdLZTA4TjFsbkJMb0lVQTEyOWNYbnkwSEpLNWZ2TjNX?=
 =?utf-8?B?SjBvMXJ0Unk3VmM1VCtFWGxWWkpSZklpSmFZRjY5WndTZjJJQTh6ckY0ajRh?=
 =?utf-8?B?ODVaSG9SYzNpZlNJdGFXTEliam5WWmw3NjRxSEpFQ0w3WUtPZE8xRE5FeDdw?=
 =?utf-8?B?eGV5VUFwRHh5UUx6TSsyRXNtdEkzRUZMUjZuaVprSDhncVl6b3d4NUpoaWlq?=
 =?utf-8?B?S2toWHQ5N25MS1B5R0FqcGEvTlE1SmVlVzgweVNheTY1QmRnWUFKcDlPMy92?=
 =?utf-8?B?bkhvaTJqNTV3UWNwN3JGelVHVHloV1NNM0ZVbmNlanI5MVBDRWhNZ25LNlRD?=
 =?utf-8?B?MndiaEp0bFg2M2llQ3ZwcHJ1QVlWdXRjdDdiVldiK1JrbjdzK1NBUS9GWG42?=
 =?utf-8?B?QTBLS2NNWENsSHNrelFkN0JETTZ0QnZaZndZOTRwV29mM0lVcUNhKytBVUFn?=
 =?utf-8?B?bmx4Nm5Bdjk4T3hoaTBIa1hsaVBLMy85Ky9LQTkvOE9UYTNQalRlT0haTmJ0?=
 =?utf-8?B?SE1zRC90Nm1adUlXME1iWDhMak5OakRsSjA5aytLZk9DZnREYW5rT2xDd0Zs?=
 =?utf-8?B?K0tCWE01UjVCL2c3ZlZQaU9tdmVwT0ZuOE9lVWhvb2RGaG90R2c2VS9VSnF0?=
 =?utf-8?B?STNkcEtkMlZiZzNjcVlTK3NkbXJYT016Q01PaytnR215ZllWVHF1MGNvNzNa?=
 =?utf-8?B?cVlYV0lJbGtmZTVmT1V4b01PWHArZGdwSzY1cE83WVJ0aXEwdEtqSVIyaHpx?=
 =?utf-8?B?TkNhTVVDbzZPNm5jMnhlMzUrbXlyaFUvTzZMZitObkgxYW54N3dzK2s2cEdz?=
 =?utf-8?Q?3LVM+80Ia3Xg6wkrub9fkA7b2slzSo64xJSP94O?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 873eb74c-eb52-48b6-f690-08d910a88eb0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 16:03:58.5047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1eTMIA86qA6AzT3oDpHW2GGr+Z8EHvxbKzln1KIYhBr8LS9xATy8hy5g4dviMcZI8apTzB2S/ZH4PCoiOlJ89l9ezqjXO8RSMW7uII3bxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4196
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
Cc: Loic Poulain <loic.poulain@linaro.org>, ch@denx.de,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06.05.21 17:46, Marek Vasut wrote:
> On 5/6/21 5:38 PM, Frieder Schrempf wrote:
> [...]
>> Works on i.MX8MM with SN65DSI84 and a single link LVDS display (1024x600) and from my perspective everything else also looks good. Thanks for your work!
>>
>> I have two remarks:
>>
>> 1. In my test I couldn't get it to work with four DSI lanes enabled (only with two) but I'm quite sure that the DSIM driver is to blame as everything on the bridge level looks good (also setting the DSI EQ register didn't help as you suggested, Marek).
> 
> I suspect there is indeed something with the DSIM going on, I'll keep you posted if I find something out.
> 
>> 2. When I set MEDIA_BUS_FMT_RGB888_1X7X4_SPWG in the panel driver I get distorted colors. I need to use MEDIA_BUS_FMT_RGB888_1X24 to make it work, but this is not valid for LVDS. Again I don't think this driver is to blame as I can't see where it does anything wrong, but my experience here is very limited so I still want to mention it.
> 
> Hmm, in that conversion supposed to happen in this bridge driver or should MXSFB handle the SPWG pixel format ? Or should the DSIM bridge do something about that ?

As far as I understand it the conversion is already done by the DSI84 without any extra configuration necessary. The only thing that needs to be done is selecting the LVDS output format via CHx_24BPP_MODE and CHx_24BPP_FORMAT1 which the driver currently hardcodes to 24bpp aka MEDIA_BUS_FMT_RGB888_1X7X4_SPWG. I think the DSI input format is always 24bpp aka MEDIA_BUS_FMT_RGB888_1X24.

So I wonder where the format actually is evaluated. Could it be that it is passed down to the LCDIF and changes its output format which causes the data passed by DSIM to the DSI84 to already be in the SPWG format? If that's the case we maybe need a way to specify MEDIA_BUS_FMT_RGB888_1X24 as input bus format for the DSI84 so it doesn't pass on the panel's format? Only a wild guess, no idea if it really works like that.
