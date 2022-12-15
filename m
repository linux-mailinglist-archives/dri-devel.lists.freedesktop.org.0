Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D668164D7E1
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 09:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE1510E0BA;
	Thu, 15 Dec 2022 08:39:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2135.outbound.protection.outlook.com [40.107.8.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A248610E0BA
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 08:39:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDZzYrVvpVvT4n0VfFxMLJqQ1m5Wl4GGP+ChTxnl1ulyCCY9NsNn2lGIuK7sDDObVkdE+q7+AgyhrPnhJYvQY+eFLxsmRrHun/3zR4x0hYzx91GA7u9AzCNZc9hdd5b82Y1yFpvv4tZNTBnvRO7NKT0/llUuE1338N0SABWif0MAn1MZyGqKQF0TiSST+BBWvBcUE4G2WLH+xJBjA+xSQgHYy/PP3oIN/MOKqMHYB2BRrpx/Mo0SQYwq07+zKoIUVMqs7yQZA3XItsaAPstjMZi6pw7tIFbzRTAFRJPZqZT27K/cPkcn/eC58SX2JjKZ4YRcgg/4GuSTeI88fzFACg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fh6mFHoh5kwzujMz5c4DvETKQ0p0T3Ihu4Ymsg/IlI=;
 b=P2boyQNeEM7df3M+lUl7H7GY5BU8cHPXPmhbvmJ1+ZZTGaBpXjtY00FOoyX2AnA6sBOAK6+ZqiciORWk7CtbpoNlZjxOJmZg98Q2RiLd8c37w7IX8vkSzfzXigi8P3Zi8e0R66iRMp9mGUUswfAIQVglg0iZgSWORvFsj4qfoLpsCH8R/hiXQpDc6a+LXcmdV2k/jF8CURwy9SqF0oU+e9Q6CWB+JKuhQ4B5FYZacdP2AcvkgzzBW4R0bLCwvqTy/O4LWF1GT+Ujik9kD6brCwZJzVhU0ZyifeC3OBCWPaboBfWRsREaHCZnD0z8lwS5X28nxBw9sjoPPmtI9VVMXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fh6mFHoh5kwzujMz5c4DvETKQ0p0T3Ihu4Ymsg/IlI=;
 b=PrKd90/c/0vNY+2e4LruNO49M3pkTYN1lqhu/Nsw86Gqgn5qO9sWu+J1Wofgup7fpY2U4XJvLFvcbV2RHAvPeXzRIq2dp/HL4QjOoa6BtHgKJrOWka3+xzgaJWttaMPkEyjSy1zbRjExDN0ZM1fKnpwR5Ik8Z+0u+e+RLWuv1JA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by PAVPR10MB6913.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:30e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Thu, 15 Dec
 2022 08:39:05 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%5]) with mapi id 15.20.5880.019; Thu, 15 Dec 2022
 08:39:05 +0000
Message-ID: <d6b8232f-3f78-7ac3-d2cc-a58d4ef9c148@kontron.de>
Date: Thu, 15 Dec 2022 09:39:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 09/18] drm: exynos: dsi: Add atomic check
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
 <20221214125907.376148-10-jagan@amarulasolutions.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20221214125907.376148-10-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::7) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|PAVPR10MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: afd4ae11-19b9-4ac3-6b28-08dade77d338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XUM7h+tGyLuSiO8atpnbrkL2g4P9ZBimFb5bmG0ZxeZORxdccdsZAZeW8yf/7AxZbqjKbxwpZf1fGlc/u02Ue2HoFAh2VRsT490ob8mUS44rp7wWaiGnyjXkexjR0C31jXQLXE9qvYHmu1TOBYeO2x+g2Jj2hK54R6So/wcps8oZHEBQyyzh4SuYarouTYGLPQVpOE9kgS7GfNEIyKtaBbXsMPKq7BnB2nSJy8HoAILkz5/345ZVlj50mkg6LGPnDSkrzpcT0hR6NvtfMkmyOoTQQw6Sb22iv5CsCiFp5IAPcc9p+0DO6J0lgcnitpHNqrL2bEXSWrRZrpsuml/BfiJtrNToZchr+TkNdxOkAZz0GJvFApIZ867CPiFXIM1H5buvW1+p3Ijpsc+5CimR6kF+PxaXkZunWc+UCKNhDM3d6SzPugHcT085qptdm2Ckc3nxPZDtD0q7W+16t1nBSNI6o8q4N1JXt5nT32rxSSSxIv81nJaCLquZScZU4Uo8RvgQtobRTJVWu5jSzfYnhaZcdduWxY3UrMl1DZSm9JrozifPsN/sblIJkAu8CW4m6BYPTbVLm3mr7vtFmqWyQfmEMDVbHp/zSfkWXk2XwFMCaNQHb2q+y3RSGXcRlRyEUGanUwDlzfoEMmqlOgzDQyTPV3V5cwf+lc1UTN31pK6k4iiPaTHlR+utQy/GGzkwB1FWozM/FVqndQZBHPhP3Tpvvo1OnVo+R3tQX3oEsoWTEEmbKmEA3kP6NNSp0okb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(451199015)(31696002)(36756003)(53546011)(2906002)(6506007)(86362001)(6512007)(5660300002)(41300700001)(54906003)(110136005)(8936002)(83380400001)(4326008)(7416002)(316002)(66946007)(66476007)(66556008)(8676002)(186003)(44832011)(2616005)(38100700002)(921005)(6486002)(31686004)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzJhejg3R1ZadDJ1enJxaUp4WmRjWUF6WDh4Zm05T2ovSVZZYzE5cXNGY21Z?=
 =?utf-8?B?RHUwbTBTa01hT20waS9XZnFxVWUvbDZ3Wjd1OTZ1c2JtWGl2clBhazBTaUNi?=
 =?utf-8?B?SktlU3BCdmFhanEzVmg0UE10TjZtUXorQm5mWFhjRVFIVUZnS3pZQXNoREtS?=
 =?utf-8?B?cW9tSnJhdmdick8vdTR3bTBoUTBNUytKdXJNcm9xTVE5VzFvaGtGZitFaFYy?=
 =?utf-8?B?Wm5PMnZSUXZsMnE2NC9FNnlSWjZMaEhFUFlRcWNFdm1zQzdDbjRGWjJkdDJ2?=
 =?utf-8?B?SmVvYURTZTZYcHlxMy9QNnRhL05ycWhJSmF1dzU1NU5WdWpEdHFyQXorTWEr?=
 =?utf-8?B?WHpOOWtyT2xnalhXWUpyOVAwZ3hyemYwa1dsUzhmQWEyN3JKd2E1bG1BQnA5?=
 =?utf-8?B?YmxyS2I4ZTRaNG96Z2xCcldnU1pmd0pXMHFSM3RTb2NodmVtdldhU2tMZHNi?=
 =?utf-8?B?Uy9PeVNqS21OSGR4cGxuVTYzMmNhOGlmSkJ6VmlZc3Jld3F4a20yU1FPaitr?=
 =?utf-8?B?TEovbnYvNk5hU3pxbFJKcDV1OEJQUlJvclpzM0F3a0RJbnI5cHFOOGh1TVVJ?=
 =?utf-8?B?QXlZRzlEbGdxNFVNV29DR3hGbWx0YU9GR042SE4rK0syV2VXaVNzQUN6Y0lB?=
 =?utf-8?B?RmlrMFdyYVhqZ2swNTkyUkxCNlhvcmpWdlpCNlVjQkw5aTVXTkRNdW9pQk4r?=
 =?utf-8?B?NUpOY29nZzZCT252T1ZYckZvQXhUelAyR2lTTzE5TmpiL0RQYXFCSUlZb1JW?=
 =?utf-8?B?Q1o5b0oyZXpuWkFSUGhmbWtMdlFBZXdRZlYvcnBzTVZ1ajJFSVlUQ28zZ0hE?=
 =?utf-8?B?V2VEUXRiLzBIQzZYSitkMFRCWXVLajZ1NXhkeGwwTVljbmJEN3JvWHFOcW0y?=
 =?utf-8?B?M3lTZ1FrZng5bzNrak1kZkVwUjJmVjR4RHZ6Z2pWcDJ3bm5QcCthbERObGsx?=
 =?utf-8?B?UkpzeDJMbkx2UXZTZGl0STkzb3podDNWRm1lRU5PNnVQQTcxZVJGYTltREdZ?=
 =?utf-8?B?UkNic0ZxTmVPTEZ5R3Z3SW5vZ0xqMGNVU1U4MHp4MGZSRDF2TmVVaGRTSStr?=
 =?utf-8?B?a3dHS1lsYVYwa29kYmhBSVdzcHNqZDJVdExGRk1GRVRNL0I5UGlqWldpUi91?=
 =?utf-8?B?OW5uM3pHTW96WkRYTU9zSmg2Y2pkMUlBdVB2c2k2UHRLNUFiUGdMM0k3U0t0?=
 =?utf-8?B?UldpZWltYTRSZkMwRitnNmJEMVFBUi9MWDVEeG1DTE55K3JNQm1oRzNyZ3h3?=
 =?utf-8?B?ejNBeGZlMTJvVXVUMTNmR2xmaVQ1SjdHNCtiaHNxeGZ5aVNteHN6cFJHVGFI?=
 =?utf-8?B?ZE40MGQwOXVpT2xYblZ6d3ZqdU5sVmMyclIvTXdiVWxwRVBZbXNpQmMvODND?=
 =?utf-8?B?L2FuMzNRbTFnODloM1lSVXozSllhSGk3aXl4bzBrYkJLeHc0UHYzTFYrWitr?=
 =?utf-8?B?dFhaK3hCblVpVzdNNTlYdjF2NWE0bkZvZWFTQXhFN3Z3YVlzVFFGL3VTODk4?=
 =?utf-8?B?VU1lYUVLbVN5WWovbTFPbDBCN09LRWdUUUhWYTVwUWh6M1h4S1RicXVVZ2h1?=
 =?utf-8?B?ZXlBSkFFbTdMWTk0ejFhdnl0UkFyZmtKZDlURUtIMGlTcHBEdEtkUVI5RWJD?=
 =?utf-8?B?Sk82VURQUkpaVzhFTHcweUQ3VW4rWEZxSW1lcDFWWGQwZlBUUTFiRld4SUNX?=
 =?utf-8?B?TjZGaEFVdElGSy9qVk05WHZCYzFOdGJScFh2UkF1aXhWTUFWb1BJTHBzQzVt?=
 =?utf-8?B?MndnVVdaVS9YQlMzRDFSekk4T0kyTnpCNVl4ZmNDTE1lYmU2RmVqWXN5WW90?=
 =?utf-8?B?S2wzMEhhTGZMek1waFkwdTUyUVNzUkZxaWNHVHJlSzhCQmJxYWVxMHEvZkt2?=
 =?utf-8?B?Tm9haytsb3FocC8rd0tBcUtLTGtsY2IwRVZaMzkyNzVFbWpUeDUxdjVTQW5a?=
 =?utf-8?B?MTR5VTBCVmg2b2VxdHBjMWs2enAzV3E4KzM0eW1mdC85S3JsOENtOWhSWkI2?=
 =?utf-8?B?cjNIbk5ueXRzeEZVcktWZ2U2V01abWFLRGxTcWRsTTBVQVNEYW5IQnVVei9x?=
 =?utf-8?B?KzdxUkNWS2h3VkdEcTFpY3h5d3FlM0RJRk9USC81T0lpaVVhcm5BMnYxeE5z?=
 =?utf-8?B?eGxvV1FuS3l0elNwS29tQjExUUJNSEovYk1VNHVMZTVVTTRJa0ZseFI2NkhH?=
 =?utf-8?Q?+KxdV1udhiA493j5WKf4Z/E=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: afd4ae11-19b9-4ac3-6b28-08dade77d338
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 08:39:05.3604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FBx0q2sCmsdb4PYaELYgsY/T6ew2FqBKD19vyaVwVvix59mjfX+LocEUWbrPmQlV3ZMcAKUMwf90VGWS0zMzjhQwjASup7+7JXXCWjbNgCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB6913
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
> Look like an explicit fixing up of mode_flags is required for DSIM IP
> present in i.MX8M Mini/Nano SoCs.
> 
> At least the LCDIF + DSIM needs active low sync polarities in order
> to correlate the correct sync flags of the surrounding components in
> the chain to make sure the whole pipeline can work properly.
> 
> On the other hand the i.MX 8M Mini Applications Processor Reference Manual,
> Rev. 3, 11/2020 says.
> "13.6.3.5.2 RGB interface
>  Vsync, Hsync, and VDEN are active high signals."
> 
> i.MX 8M Mini Applications Processor Reference Manual Rev. 3, 11/2020
> 3.6.3.5.2 RGB interface
> i.MX 8M Nano Applications Processor Reference Manual Rev. 2, 07/2022
> 13.6.2.7.2 RGB interface
> both claim "Vsync, Hsync, and VDEN are active high signals.", the
> LCDIF must generate inverted HS/VS/DE signals, i.e. active LOW.
> 
> No clear evidence about whether it can be documentation issues or
> something, so added a comment FIXME for this and updated the active low
> sync polarities using SAMSUNG_DSIM_TYPE_IMX8MM hw_type.
> 
> Comments are suggested by Marek Vasut.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
