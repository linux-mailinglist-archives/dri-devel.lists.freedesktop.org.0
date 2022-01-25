Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADB349BB8B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 19:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F4B10E218;
	Tue, 25 Jan 2022 18:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065E110E218;
 Tue, 25 Jan 2022 18:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643136748; x=1674672748;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S0Rc9wFrrUnPDVrInUyBnrw35Bv+a/KxQ5W0b0hWqZY=;
 b=VkGBmexbb5uNuLCdCy1vQdCca5jkoMP1WEixjTOBarxzhF1JqeBQKsMf
 R5GqMzmG9+6lrUhI4Qi4YV0CYUFg0opECzUybfWVv03q9llB7xWcrayDt
 mFHGem5J02aQKXD3J1fWXIEEjBQM4h+j6m+qjKQ5iKAZvvKOs6AA2ZB0P
 uYy9aMtVJs3b10jdshE7m3reGiWY0jUW6lakZqdYzjtj8RegU6o9Ob+wl
 xCy/aGwg8LtsmfTd718I2loP6wVrBF9iRj1YF5Um0fesuQwdMvw3oMBC9
 DfZwGjAcQKwz+U/YpWsIl5oFmJVg5pevlkhuOR+zt84ercRhckU8Kr/oq Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="226362041"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="226362041"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 10:52:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="477217243"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 25 Jan 2022 10:52:27 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 25 Jan 2022 10:52:26 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 25 Jan 2022 10:52:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 25 Jan 2022 10:52:26 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 25 Jan 2022 10:52:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIQ96gTaBvce/jJLzMSnigfUGNwcbEFpdTwUV5jDf6OY4DkyjzQAdSPwMdUm9YX4fiIUILwZDRoj9YPQra0mdei3y+znPbEG5xfI6HRooF8IpjPo5bo7o7+dx4/DrlynWbMyUJzQTW4+4fDKJA77WSV6ZDzx3Ys/gVRGhJuxJiGpQOLKPxr45xIyxiKYdRktgL0QwLNJYFVzZ5mkqjVyk3WavRCB6JTXTIRMcJMIc1+QcvBYCjdJK1m1QNNieRzu3MjyYleg/D8lXNyD3nXVhH1rL6HtoGIsTIswTKRL4FxeDXOLWTMSR4r1LxOePZwMi5j9hPx3gQZ38v06W8ssPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unorHrHFK69yrV12ajadq1SQeOcR5ezjEJO06Yd0dAY=;
 b=WdnXYRNdr4v81sp3YwZDsvwWNYuWa/ji9iN0V3fuFVhoTGDp+bfT1ZA/lvvfDM5DBTewwgtOCYD7Cc/w5eZR+Ot0VgDD53h3f/7bdvEk+EoBq0OWksaykNGkgWMf6q6WTdzd8h0TOpsfiJTmPm7n5RJGg4QbjnfLEC97i52NUPzBSstP33WKwA0xpye5m/20XDc11ExGGQ4JQ5n34bcGxR/F1ON/hDWVyrK4/yignt8qJXb7a7LpfP/gUDDF1gt5ILSJzmct5L/cUPD3F9PKvynsk+BoW1v4cWuiRJO4Qjmw9Y2XkMM1wAjtFnvdXUpKXt1qnsiHnXz0EeRRF/Bnzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BN8PR11MB3603.namprd11.prod.outlook.com (2603:10b6:408:8b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Tue, 25 Jan
 2022 18:52:23 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5%5]) with mapi id 15.20.4930.015; Tue, 25 Jan 2022
 18:52:23 +0000
Message-ID: <83d085f0-8f2e-dc92-dab3-61c0b7677df8@intel.com>
Date: Tue, 25 Jan 2022 10:52:19 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH][next] drm/i915/guc: fix spelling mistake "notificaion" ->
 "notification"
Content-Language: en-GB
To: Colin Ian King <colin.i.king@gmail.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Matthew Brost
 <matthew.brost@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20220125091359.350918-1-colin.i.king@gmail.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220125091359.350918-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR2101CA0011.namprd21.prod.outlook.com
 (2603:10b6:302:1::24) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6ab0c20-7cf1-43ea-af29-08d9e033d263
X-MS-TrafficTypeDiagnostic: BN8PR11MB3603:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN8PR11MB3603883DA75DAE87408B93FDBD5F9@BN8PR11MB3603.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pVOXxTKpDl32L98nDZkR2w9Vv7PzgMNmnu54RVClezPZ75m7T5FtTIX47iE7L0elFOqoKrVh2WKSgLh6qwICZFnuhtwCZ6cpMdTm8aJkYajLd1hRXGAH5gNOnPfR9YADjdm4D8vfYu+d6F0dUff2Gb9w1+4ZqAgUZ4J0WIaYqalqEp4fwPU3X0SNmq/fHtssPXpQ4gTDx3U0avh/+y+NiVpib2h3cYIoIzn0yT29TB/w9/fS4iKgqmCKGL0eOKvKeiYpokj1lDAaZdNDrAen4IRbMBlQgL380zPSvQtPsNHsuSSZitmmIB8ecTi0OYibTpj6HEECekN7TdBCcVmZ1HbkFOACMkH/UPT9zraVjKv/kvdocfo9GdBupqC8eUQkSj6ZzOaF1Z8Ja65phcLCtQN/ObtQuJqUEuu80zn9cmIdsvYuX7DxskyDMvxEasrXcvc1U+POhB/iRbNnVghQRJsI2YgRifWkWx8bAk0IcaevFXW2hVWzo7uWceMH40cLmLZwMqAfr+b4J7pHDFJQVTFWFYc4Cpflyy1lGtdBi/h44w3+Zmiq2W5ZWH8VkXPejmWkpD99a2/2XmdTY/BQvKWY1BpAwxYYo73gpNry/40tiswOOmZuAmgb/5iYcFiyMnQUPoA9LIJyP0RmBIlqIgSYsGzK6ly/DJfElkzhBO/dF26/8qFR0zGcvvn0OgjUO3+OZJHuKWb2AwL8ACcSAM+wlUCvjGpWADTiQww/Q99Zris5VGgWCsgvrm3knl7SqdlzHUhM8sXJsySzSiQ8uA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(26005)(4326008)(316002)(66556008)(66476007)(36756003)(66946007)(31686004)(8676002)(6506007)(53546011)(508600001)(186003)(5660300002)(6666004)(15650500001)(8936002)(7416002)(6486002)(921005)(2616005)(38100700002)(110136005)(2906002)(86362001)(82960400001)(31696002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U240NStzWWMveEVkbkZXK0M0dkRORHN6OXRRVmRqYWo0TDI5QlRRVDhuZG9H?=
 =?utf-8?B?dlphYWlPV0V2YXdiNHJqZUFmSDRuNWhuM3M1OUs0RTV3K0s3Z1FWdWpuNFRT?=
 =?utf-8?B?aUxiVTN3Z3V3anZqRmJ5RGJTcW56NVc2ZHNmNGtpNERnamFQcWw5dEJZNjNF?=
 =?utf-8?B?U3NhNnpGeW5uSmkwYjdpVzB5Vy84cUtBUFJlK0dkS052SkM4QXlJYmdubERJ?=
 =?utf-8?B?c1pKT3BiN1g4c1kydGJxWjdCSG9JYmFzcWFwNFdCR3A1VXVxaDJpZ2srckRS?=
 =?utf-8?B?bG93ZlNmZ3FBRDVZdFJuQzdOcGVIRDhPWjJSbzJRaitXTjdQdTFBczAzdk02?=
 =?utf-8?B?aFFqcEt1QlZGSUN3NmxlbytpNytscDYweDVoNWY0dGE1eWplTEsrZVk2OGFL?=
 =?utf-8?B?M2FmdjNrWjcxUXk2RU9Tdkw5TmdRV2Zwa0JPVE53NjhZRFFmQWVCV0JocEhq?=
 =?utf-8?B?eW1xZThjaysyQ1ZiR2NBb2NjbEt0YmdMQWVWQkdvL0dxQXJUeGhqK0FCR0NC?=
 =?utf-8?B?cmdaY1Y1bWthTmwvK1BBVTZFTkF5TURYbGNpcEpjNGFuQjgxcTEyZUVzL3Nk?=
 =?utf-8?B?TEg2ZjFiNFVtbkVEN3hNenQ4dEdoSXlwSzk4bjd1d25xMndmNHkyVnB6WkxD?=
 =?utf-8?B?SGUwT3FiTWViNDdKRU5MY1lFLy9ud2svbUNHaW1WSCs0QXQvOXVZbTRGZ3RX?=
 =?utf-8?B?VmpvOHkrc3lmSTBIMSsrNWU2K1FzQnoycDBoWXA3ODU4UFJkbmJnVXVuWFh0?=
 =?utf-8?B?UUJZWDVCUDR0MW5zVnE4ZmJyM3FLcmJYYngrcDU1SFBkTTNtQ0FEOEt6WFhJ?=
 =?utf-8?B?NGFCY2Z4S1paRHQ3S2pYVG1ta1kwMmU4T0p3ZUdHY2ZBeXBQWFVXMFdaZ1N4?=
 =?utf-8?B?VVNSZDlzRlhVeEhGdXp3bWM0VVN4Y1ZYTGpGOVVWK2ltQnhiS09yNEgrN0Rv?=
 =?utf-8?B?VXF6QkQ1ellKQlBPQ1pxdWVEL1lzcHRZdGJ6VS85VExZYVpud1RLYVhPVlNa?=
 =?utf-8?B?bGVFeWhsSzIxMUorcTdDVmMxZmNYREhTeDhnQjBSTGVSZHlxL2ozc2NFcHVu?=
 =?utf-8?B?cDkxb3lrNWJNR0pWR1RRTEJMekVRdUJaNVc3aldYOXNCSHFscUh5QmtHSTI2?=
 =?utf-8?B?aVljcW1QY0NWMVJaR1dVZEgwT2trb3RpTGpFc0w2VXpVaXBsZjdqTjJ6b1VG?=
 =?utf-8?B?S1I3NVI1dTRBai9MckxnL1RRUjBLQVV5WUVqVmhSUUt4Z0JtdSt2QzcvWUcx?=
 =?utf-8?B?NWcwRzExODlDVTZ0c3U5ZzBzVlZ6aXUyTkxOQ2JXemlBUFhjOENqbEw5Sjlk?=
 =?utf-8?B?MlhXbWtveEx6OE80L0NlQll3cGFycVRSb1ZxM25wQ3FtTVZEdW5MZGdHQU4r?=
 =?utf-8?B?NXQzRFpZRVpWMFFPS3pTUTl5ZUdiS0JqdlNta0ZtWTZCZUxSMnlaWmlYdktz?=
 =?utf-8?B?emVGbGQvelpaVXgxcHNFWkc5b3B3c2dnVm9zbnhzNytvTkNJQWx6K0l2dzlY?=
 =?utf-8?B?TFFjaWpLYWxSRmhOeGNvUm9ZL0piTWxHQ01SUDF2QTNNbExWWVZkcnZCZFEy?=
 =?utf-8?B?U2I1VVlpMklvRHZqYUNLUVBjUmRMai9zamZ3Wjh0KzFScldZOCtmeUlocnUr?=
 =?utf-8?B?UDl3WUVqQ21UYjJDamhvZGRuVnRtRlM5NXg4TU5tS29vMmJoWjZla3JPNnRv?=
 =?utf-8?B?cGgzb1N0cnhwemlLNTRBRW5lWFBTL1hsZGNSRUtXNDVzOGkvWlRiVTBtMEY1?=
 =?utf-8?B?RFhXSDZXVEpoNkg0UFBtejJGTkZ4Wkdsa3lxazArR1MrRUpUdnp2OEhmcnh4?=
 =?utf-8?B?NkpGT3l4cVZSTS85allKb0g3R054RHJaVktEOCtwMy9obmU5d1MyeHdzU1hB?=
 =?utf-8?B?dTE4c2Q1TXRCS3ZUNWlVa1JLOEMzUXdNZEdCS1Z0bGtnUFgvZlhjNXl0bm9y?=
 =?utf-8?B?Ym9PSU51UDlnZlhibEt4OWtnbno1TXp6VndLU3VuMEQ4dVlNOTRBNUlDeGxs?=
 =?utf-8?B?czBYTzg2MjJENmsxdXBJUnVrWUJaUGRuMjRGejd1aGZpT3hIdzNaNm5VNWM3?=
 =?utf-8?B?R3VzejRrZ3ZxaEF6Rk5vbWViTW5pK29qbkZiNkk3MjUzMkhYdmwyN2lXMm1j?=
 =?utf-8?B?YjQ3TEQxSStreW1WU3pmcmxodGxJL0I1NUlwcTBpcmxWZzFrWnV2d2RDeTBs?=
 =?utf-8?B?Mm0xeUc3NVZRZ2IxbVpHWU0yWThHOWlETEpwRjNqWWFGeDFLdStGQXhQMUNy?=
 =?utf-8?Q?vrRQSuFay2C0p60pEAFZkM9+QRGZC1K5AT5RPpAoM0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ab0c20-7cf1-43ea-af29-08d9e033d263
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 18:52:22.9212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zwm5+J3EqTzvVayCj8IQVY9HvVG7Opnf639GxI7sn1002yhvYI4qmBb+S3u7SklzL0j24qYJPqZXeBRTPvoNg/pQYyMCFgvfo1j+6D3bIUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3603
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/25/2022 01:13, Colin Ian King wrote:
> There is a spelling mistake in a drm_err error message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

However, note that this message is going to be deleted anyway. Or at 
least dropped down to an informational. Partly, there was confusion over 
how the issue could arise. Partly the firmware bug leading to part of 
the problem has now been fixed and the w/a removed from the driver. 
Cleaning this error up accordingly is on my todo list...

Thanks,
John.


> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 1331ff91c5b0..1ae3d1f259e3 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -3942,7 +3942,7 @@ static void guc_handle_context_reset(struct intel_guc *guc,
>   		guc_context_replay(ce);
>   	} else {
>   		drm_err(&guc_to_gt(guc)->i915->drm,
> -			"Invalid GuC engine reset notificaion for 0x%04X on %s: banned = %d, blocked = %d",
> +			"Invalid GuC engine reset notification for 0x%04X on %s: banned = %d, blocked = %d",
>   			ce->guc_id.id, ce->engine->name, intel_context_is_banned(ce),
>   			context_blocked(ce));
>   	}

