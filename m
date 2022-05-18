Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 024FA52B41C
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 09:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED24113E96;
	Wed, 18 May 2022 07:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0803B113E96
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 07:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652860648; x=1684396648;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B/wddhpG1M++lBJRfP914u1JTqElrj9YCwj9LlOvvIs=;
 b=L0Q2dKeDddYNiHqn7TyCYzq1xDygJmKsgF66e+dlG76yx3smF9wy9HI1
 xNyCu0aCGHAtg63jjuKx7UKcpQWBTWUsItlhU67/wIbaRfykoodea3jza
 yF29SGlG/dsHI4sTAej+ZRRXf9+8b2FNwISPuFU7dNibqJ+9Ih3NeKYoI
 +dQWsaksu2RKQFz7qTlWMEypLVecho0c5xQmzuwZa/fMUulWoSgqr9gKR
 GW2GcHRPFTDhGeOWamOonmNL4gR0H6kmRIhxSCe0D5KgLgsFXpukVc2A6
 o10Y+06OTKwbG1Najnhxfb59C4MfW2pBo3M2gXCo5DoObpcdwl6JcjKP/ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="270366500"
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; d="scan'208";a="270366500"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 00:57:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; d="scan'208";a="661034423"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by FMSMGA003.fm.intel.com with ESMTP; 18 May 2022 00:57:27 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 18 May 2022 00:57:26 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 18 May 2022 00:57:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 18 May 2022 00:57:26 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 18 May 2022 00:57:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhynDJeBpzp3J+9e1ZrgQqfhFERXvFefV0SSiiG38fGdbD5mM5znEkUz5UIWwu+swqoh4OugWBeqVX5jUDvHHWwhlY2/hhRS92G4h6ZC7GkyKWmI/pviWTqjRHuKI+VZCov+zMB/hYzuRlY/hrR/LNWozzPrws/7zTcJ1VmEdj+dnjVZdW8gbMXF4+BJk1TZMsd6fziqMMNs30r+y1+LxTLNhO/pChzKytVgu0rBENBx6RCWL/3ibv4Y3RotjQokeA1lVcbzsejRkXqhbi8V1RfQiGhe8q2CPlcKC8hHHpiP1ppGltRrbiRmQoHrKqix+W8yRMx9EhPdCeoFyydCNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VoB875S1s0X+a/f0fnPJCzMCVbl/UFpHhZJ4CCGJTQ=;
 b=l5IteyqwpzZxlyOpaPweSjI10h2kBsWIEQCzTgITxZLyquqwaY+SizGK8u6T3mCCXznZjBF2WKLim3bgnuuAC7mGKPWj6FGZcBthEZksOyuu0Jp5s535uoCIck5l1L3P5Pu42tvhsWI5wOLbMNjwpS8XM3iK4ekq5ewGUb7+JDwwwF+YOXI0MvGj3X01Y5NbvIDaIY84w+849YdnXFjLJJ5LDOm40Df2S75FpS2VnuMUq4rH1cqsB3nICfsArcZQd2Rn9UePJ96XKZjuhwmBU3rbmmXlnIhJgl0GJc7LAJh5iU49NBRjZT+BdwTVuaxWpROHPhplH9/71qLxYPg2kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 CY5PR11MB6534.namprd11.prod.outlook.com (2603:10b6:930:42::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14; Wed, 18 May 2022 07:57:24 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b1fa:393c:9fb6:6871]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b1fa:393c:9fb6:6871%5]) with mapi id 15.20.5250.018; Wed, 18 May 2022
 07:57:24 +0000
Message-ID: <dc52f807-f4bc-13d6-7b9e-81b4fe94a6e0@intel.com>
Date: Wed, 18 May 2022 09:57:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH] drm: bridge: sii8620: fix possible off-by-one
Content-Language: en-US
To: Hangyu Hua <hbh25y@gmail.com>, <narmstrong@baylibre.com>,
 <robert.foss@linaro.org>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <architt@codeaurora.org>
References: <20220518065856.18936-1-hbh25y@gmail.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220518065856.18936-1-hbh25y@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0008.eurprd03.prod.outlook.com
 (2603:10a6:206:14::21) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93d4ed81-119e-43c6-664d-08da38a40b3c
X-MS-TrafficTypeDiagnostic: CY5PR11MB6534:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CY5PR11MB65340CC0C32BBDF8DB998C10EBD19@CY5PR11MB6534.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gccu0Ycw4cn4woC8KpP9UubmAVdUlOuV39s+gjUNyWsqy0MfncMXDpMZ9Klb1QlcZPm0Ve5QXIESSoFbni+YIvVqMYLCiOdm0Bik55o1kvubHorJ7Y6jw4zZACJqtDQOYYxNdkqS1eBpbjHcV8T2r/0m2Z6J0RAPM5GPJ57OAbcDaMct0FA02yqTK/pxhypULJ6oSJmj12pONcTWlB3R8zOCPSKLBJCuwqfOL+i6yrO/Wuk1YnD+fuBE7rwWsw4ylTBh0RNENsCcLQ8bp8vc7o6cfYE7pp0uJinehnSwQcRrcQDf9xXDAAbPA1oGD1Tn1DLKOH50XaKRCnG9Ph7KFtyMJQz5dSPx3yFyFlEhYZ1ig3ypg6pd2zMlCWaYTIG9foH81GQ9lZ9fa33VBoVvF9xOJ6toeR0WyCKZt1UyQ+3cyXICkZUwtrM1RfOzb46/yALEX1e6gqv2rttZt9ue3A9bREFPiivm2HusUfel6MjlWoKDzTLlORte+x9ecGlHxr8XHjkvfSoSJyAGfvR6EAViz9MF/OTa2wAt5FBRrz73o1hhcCzjG1mxL192vK5NAKfVWr61RBi4b8IWgioLRaB3decQlEF/oal74adlZTiK+vN563oJlgdgDJwFQx1D5mSw27VpOl/qwa0IswycTF3ki0DX1tJhJwJ2iz8Bruu+5v4AjNY0nhrxRqoftkHfY3m+VKFs9PHVNPrsgPn29kl77kBfJaxrA8eS31Dnlwo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(66476007)(66556008)(66946007)(36916002)(53546011)(8676002)(4326008)(7416002)(5660300002)(82960400001)(8936002)(2616005)(508600001)(83380400001)(2906002)(6486002)(6506007)(6512007)(26005)(316002)(6666004)(186003)(36756003)(44832011)(31686004)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnJJTy9XUm43dzEzYzBPR29xZzloYTZFSFRxTnlKaGp2U2VFVllJSE9WOUdS?=
 =?utf-8?B?MFZ6ZzBtOHI5R3FJaGZzNXNrVkhQa3pPZmkxSkJKYmRTVFRlR0x4TU5sbnpq?=
 =?utf-8?B?ZVlaWlltSHV3S2NpQk1KNkJjWS9tV05DT2RuM1dCOVVqUkQrcTBpS1J1WW9W?=
 =?utf-8?B?d0pCeHlqK0ZnRms5K3hOU2VQU2tsOTE2ZStiOHNiMmplZ0NubDQ5L1JldUxv?=
 =?utf-8?B?eWQwZGszY2hzbHpkRkVWS0pkaGNGQjJQdDdzdjB4cEZGeXorUll4SHMwMklT?=
 =?utf-8?B?dEFtWkRnckRVMmhCZmFMSDNkY0x5RHBPKzBYK3NyRzJyUzZzR1RBSWI4MCtk?=
 =?utf-8?B?UklpQnF6b3ArQUVSbUlFR3Bvd3I4bVZyWXdESk5YRUFnQ01DRDhReVM1c3hK?=
 =?utf-8?B?VTB3Sm95cnFRYnNpYTFUa1NwcFNTUUd1dS8vTlJuUEd3YmljdHNXWnp5dGIx?=
 =?utf-8?B?M1A1ZnU4Z2ZjelR5eU52VTFuRDRmOXlHSEhvZE1lOElJWHB5eXhMVjQrSXZD?=
 =?utf-8?B?b3ZGK3dQS0JhNWwyZ0QzSzdYaU04VHpuMnY4a3NDUlQ1V0d6ZlJqeGZpYkVv?=
 =?utf-8?B?enhzNE9aZlhaRno3MnFGMU1nd2lTaklyaXJsbVBzTlZFQnhFVnp5MHpERXhM?=
 =?utf-8?B?SGh3eGpyVGZkWkYzQ3BobzdTb1IwTHN4R3lVa0FyNFU5WWJTVUVESlRhUmRW?=
 =?utf-8?B?VGxYVUR5Wm9jSmp5WHF6SVBsV3lxQU0vV0Q1aDYraHZVYjlFS3BLaDVieGF2?=
 =?utf-8?B?OWdtTW5uN0QxVnBFWlNOcDlBNXZXTFlrWmhPRWViOElweG52SURNWkhjMS9H?=
 =?utf-8?B?c3E5anprWXhXbkhBM3lZZUxuWGtYK0pzN25EQ3o2Y08yckE1QXRqcWliTU1W?=
 =?utf-8?B?Qm4yOFNHdlhweThKdmJPeGk2QzFlNnFFQytaTFA2OHR3alFIbTloaGhTU0c4?=
 =?utf-8?B?Q21zZjNKTHBUcFBGUUJuQVNXcWswTTZ6YVVVVGRFV29ZdmhJd2hiLzYybk9T?=
 =?utf-8?B?eWNXWC8xM1oyNFdBc0RXSFdvd3dDeWw1UEJMWGs5Z3dxL3VjUmlIQm1iTVBM?=
 =?utf-8?B?SklkdVgzSWhnREc0R3owRDRkYTR2KzlHRmE1emp1blhVTk9qS0NaVVlPcjY3?=
 =?utf-8?B?aTMvbnd1S20yUE82NXBwa0pOZVg1R2FGZCtRN2F0bks5Zmsyd25sTGhoMTRa?=
 =?utf-8?B?emtDS1BrU3RodXp0N1VOOW1VNTFpSUZpNE8wRStXQk45cmhHR21wUXR0aVV0?=
 =?utf-8?B?L1V3S3c5MWs3ZDNhN0RPM0s1b3JPRXFNK2RjNWhleEtjN09JTWg3NGpsNkJ2?=
 =?utf-8?B?TVo2RVBDVmxnY1RpNHpGYWhOdm52bFRMb0tBUVVINTFrOG9ITkRGOGw0cWJ0?=
 =?utf-8?B?K2lzN1JlUzd6aCtHeHZCdlppUk9XMnlqcUo2TExLVGY1QStDRE1Cc1MyWklk?=
 =?utf-8?B?aHEvdmxQMlUwMTBpenVGVnljRGtoODNMR3lHWGxjT0lTdk9Fd2JjVkg4U1Ju?=
 =?utf-8?B?WWg5ZFhFc2F6bjkyZWhSTzBPSFJzdnBmYXBmUUlNcXpOU3d1UU5qb3NucVBV?=
 =?utf-8?B?WDF4b0ZuWllhOWNtWGJVWWdrQzlNRzlMQ3VTdy9Rd1VtQmp0N1pVbDQ2VHh3?=
 =?utf-8?B?VytBSFhCMTlWZWhRemR6YVJHZGxjNHMvT0l2bjFabE02UGMyenhmeks3azcw?=
 =?utf-8?B?aEhrV3J4Zk8rTDMrOTZuT3pzcXlSZ3hHd3NabE92MTR3UXdYTFhkaWxyVXR3?=
 =?utf-8?B?UE1wRm16MGJsbGVPaHcyeHh5Z2Rmd2d2Z1JNWUtMMi8rMHc4eWRaVStrZDVI?=
 =?utf-8?B?VUpzTWJOcDFXbU1TUnNCRWxGUVdUUlRpM2ZuNkhNbXEzMW43TzN4My96NTNQ?=
 =?utf-8?B?YmNRL0ZzRFFIb1RlUFZpdDF5Wnd1TWVTRlJUcFFVTGxpNUFsbUIzWGNmcnJU?=
 =?utf-8?B?dEdSWFpRWEM3NGJuQ3Qxa0xEUGlRaS90MXNNOGQydFF6c0hVMUZYdFJEaTRN?=
 =?utf-8?B?WTQ0eGxyZEhldXVqK0cxTkRGaWI4L1Vubjh2UEhULy9XTk5EOXVHRkxickhW?=
 =?utf-8?B?MTRMWTMraGRtakF5b0hPWlZGYXVacXgwTUtUQXpQSEZsMUlOUjVSR0pESk5F?=
 =?utf-8?B?cnBRSklVQ3duV281ZlhVWW9oZjU1K0NzTkVTWnFYbmtOK1dQSHJxZERoVU9h?=
 =?utf-8?B?TERNa2Z6dkw3ZS8vak1WemYyZU0vczl0Qmh1SVdxN3VMQ0htYWQrK0J5bUQw?=
 =?utf-8?B?VkZwek5BTFE3UU9waDNDN1UzNUF4NlRnVS9HTzI4MmNINk11a01MK3N3SHNh?=
 =?utf-8?B?d3M5YWZJbHpIN1pveVdzazUyaFVPOGhjTDZyZEptNmtrait5c2ZqbXpuZzIz?=
 =?utf-8?Q?Fvccu+anAeN6JHdg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d4ed81-119e-43c6-664d-08da38a40b3c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 07:57:24.5645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iz16qfp2K9qeqlCjVBNPyMosyXcbX0AbwWFDOnnqwxsg1UQShRiMbassnKLxSYoim/Spd3fJsCH4wrXYOzIjGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6534
X-OriginatorOrg: intel.com
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 18.05.2022 08:58, Hangyu Hua wrote:
> The next call to sii8620_burst_get_tx_buf will result in off-by-one
> When ctx->burst.tx_count + size == ARRAY_SIZE(ctx->burst.tx_buf). The same
> thing happens in sii8620_burst_get_rx_buf.
>
> This patch also change tx_count and tx_buf to rx_count and rx_buf in
> sii8620_burst_get_rx_buf. It is unreasonable to check tx_buf's size and
> use rx_buf.
>
> Fixes: e19e9c692f81 ("drm/bridge/sii8620: add support for burst eMSC transmissions")
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/bridge/sil-sii8620.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
> index ec7745c31da0..ab0bce4a988c 100644
> --- a/drivers/gpu/drm/bridge/sil-sii8620.c
> +++ b/drivers/gpu/drm/bridge/sil-sii8620.c
> @@ -605,7 +605,7 @@ static void *sii8620_burst_get_tx_buf(struct sii8620 *ctx, int len)
>   	u8 *buf = &ctx->burst.tx_buf[ctx->burst.tx_count];
>   	int size = len + 2;
>   
> -	if (ctx->burst.tx_count + size > ARRAY_SIZE(ctx->burst.tx_buf)) {
> +	if (ctx->burst.tx_count + size >= ARRAY_SIZE(ctx->burst.tx_buf)) {
>   		dev_err(ctx->dev, "TX-BLK buffer exhausted\n");
>   		ctx->error = -EINVAL;
>   		return NULL;
> @@ -622,7 +622,7 @@ static u8 *sii8620_burst_get_rx_buf(struct sii8620 *ctx, int len)
>   	u8 *buf = &ctx->burst.rx_buf[ctx->burst.rx_count];
>   	int size = len + 1;
>   
> -	if (ctx->burst.tx_count + size > ARRAY_SIZE(ctx->burst.tx_buf)) {
> +	if (ctx->burst.rx_count + size >= ARRAY_SIZE(ctx->burst.rx_buf)) {
>   		dev_err(ctx->dev, "RX-BLK buffer exhausted\n");
>   		ctx->error = -EINVAL;
>   		return NULL;

