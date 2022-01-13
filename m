Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB18348DDBF
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 19:37:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EA410E563;
	Thu, 13 Jan 2022 18:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DA110E562;
 Thu, 13 Jan 2022 18:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642099067; x=1673635067;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xLCAuac724HlvacKQHX2qFxnjtwKfSZy7zP4FeYww10=;
 b=G1nlUz0t9jl3PTZMpQNIX13C9ABKDtuRqolO/E+NHUyUj/GrajLlnNOx
 NIs7185h8fjG/uAHAITOhcAgkdbresTh2NbN5g65Q9b03nDrniZlHlKMS
 aWy3bWPc4GXgiGPyhgbiWvc8yf1h8xTuGNWC3QYLQnazCdIjYf8jw/sZh
 ufFUV/mLpNBy3jpNKk9E1Vy+RgJyLx5ddNHCBqWIIuXC/sv613Pdw4n2g
 ZqmZgxMb+nFq2DVTiSZVpQGOMvoAkS2OYebz21KQ9jZezxEPcDIga1f6Y
 iIQZrY6Wr4+O3WQs+XbiurR/ZxT45rf7hVGJO5mRm8rJwY5pAlNDQRx+z Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="244040327"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="244040327"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 10:37:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="516043304"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga007.jf.intel.com with ESMTP; 13 Jan 2022 10:37:46 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 13 Jan 2022 10:37:46 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 13 Jan 2022 10:37:46 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 13 Jan 2022 10:37:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLbIlXICZuNvgAd0rXaLiQM/LpTMNDICnqi6YuqqYpWG7WR8RN1PsK9C8ZzwpL6s3yvt2j5z3m1iWC2FAz1itSOAZLotgPeWaPkgEOgzMYU4egyeJPLKvDWUKESZHQxYwJScvdSGetgePK3zPz9K2bNVoRSX6EWwW+hCXRF/eQIoOjzfVeURJJSAMFQJGcqR3YJn/6l09ADAAII4BQ3EiwljhJ95mcTvd7d8Dlu4MCbhYVs5A4izUrebssLotAQU1RkFAXvJ7ojXzYnIZ+rP8Qse4mkXs9Z8DF/FHDwb1gN9+H8xQESJb14nSufvJq+ST7rufkIxXuRnLnT5nIF+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYv25HviFQE7mp+8bF9UyuHDBcx1gI8IhOJ3+pJvibI=;
 b=EQOwJ7DUdzvT/hNS5QcyFA7juOyDeZVtPQSlq9vOV6TCwX0lj356XjOgfkjkNge1goEEOm+4kS3JggZ/CYJsQRUjai4YmcdivZfOtk/6a41Ccm1UhWx/a0JASWpofZf5THxMv9dRMeL10V8da+CY9HRH7XstCIQSJyvymQ273sqAKwsir3r5m5+QzHufEwW//4gTbdK6OWUcf7v80ImyMJNF1Y+DZvwq3LgdOfkFSediTs9B7S6Pbx0Kq6gnRXC25V7+MvK0oX8pDWWys4R+bgali4MzPhqheyXxWm5AL5/1Tg6lJuy4hYYs0uPIxhZwONziaAD8xSvL3u8ea0d1Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MWHPR11MB1584.namprd11.prod.outlook.com (2603:10b6:301:e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Thu, 13 Jan
 2022 18:37:44 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5%5]) with mapi id 15.20.4888.011; Thu, 13 Jan 2022
 18:37:44 +0000
Message-ID: <803283e6-24ca-c72b-756e-047fcec02c9e@intel.com>
Date: Thu, 13 Jan 2022 10:37:41 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH 1/2] drm/i915/selftests: Add a cancel request selftest
 that triggers a reset
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20220113181351.21296-1-matthew.brost@intel.com>
 <20220113181351.21296-2-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220113181351.21296-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR21CA0071.namprd21.prod.outlook.com
 (2603:10b6:300:db::33) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 727cd8b5-f4c4-49a1-2604-08d9d6c3c98b
X-MS-TrafficTypeDiagnostic: MWHPR11MB1584:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MWHPR11MB15840E9E417F04F137EF612BBD539@MWHPR11MB1584.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1HWrOTbYhgoguVU3ApOuTtceUQuxkQWp8rGsCEKqWgc0/Hev9Avmw1kEB6tkxIxgAim1YLbnIRU/XizEQmeIh5Q5pBG7ph5CBBPT0kEdLmhdcbgyh+LNsGDnJ+FJLDLDEFZ82d2TW/t3aHys/l1sH/YO6namZAYwJuErZXUwmrsahHHpZf0Hlf5Zn9n/JX9SIsZuJxL4nGFmpb97RvLVCBmkQtj0oDxJ1lV1IUcJTIqi1AkJXdDsZ5CG6MfWDflqt5PpTskmDLMxNgKj2SnRpKyHLDbBCCZ3h4xgl7Rvkj11pQWJIq/yzl+VRK1GjFv19EG1ASUBFMJgQLY6KRb8X/HGSH1g9HZe5iOLlW3zvJ7wuNlrk7yaf+OV7BJwLif6NEqFzBQyQCIUmn5sLLFsrPFnuiP++u0XtBqAtUrhZOnMFp2HBdPzLSHxvt4C04oy2w/5kXw5nCKsbJM8QoNIM3HG88gDAjMJdTxpB/wSy+rnKK09YtZnBMW7or9klraaR0bMUAjlBUryRkzIq8TfQt5ga2X0xNYkwOL63FQexgWNT3UScN4FqR09jBYvMw3cOvuQPJgkGisXfuS6Fa0H9O2DCyD8gnR/3+ZYDvgO0WvQWqh9nx25JHKGV059AfXh65X2Ehjqp26OPVcHtTdqhab9OlZoOtra+w48hqH8eOapXf/B+Nc+psavz6AlfxL3luPq0DLueS2qcoNPWEYmnRziPXFQw9BwR2Xu3PCILvGMpzabdd+P48kwjngfYx14
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(8676002)(8936002)(38100700002)(450100002)(31686004)(508600001)(6512007)(31696002)(36756003)(6486002)(316002)(5660300002)(66946007)(83380400001)(82960400001)(6666004)(2616005)(26005)(53546011)(6506007)(66476007)(186003)(66556008)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTlTbjlndDBYTGVZaG1uRE5ObkJ1MW43eXR4ODB5R1J0eDJkQ1ZDS2RpTkhs?=
 =?utf-8?B?RmJCMmJyTTFHcEZzQjJ1UWRlbVlqT2RJdmtySVJHSVdLeXFVVTB4Tk40ZjRZ?=
 =?utf-8?B?MVAxK0MzT3VuaTVaRWN1bmZlL3ZrMFVxU2tLdlRoMEhOUi9wcnM4WUs4YWo3?=
 =?utf-8?B?cjFhZWRmT0lFZngwUGRNUmh2b3h5Q2FGbDhrNXN5RHpSY2VSTnpFRzAvcitW?=
 =?utf-8?B?TFEvcUdKaTY4WWVHOG9QdGtiUU9JZWZIaG91ejI5clFpeElvaHZ0U2svNFVx?=
 =?utf-8?B?RlRBZzE3WGFtVFNyU2xwQmhQa3k3RE1vS3VzbjlXa1kvZW4yUFFaRkV0ck5l?=
 =?utf-8?B?bVh5VjRGR2wyYnBOZi9VL250STcyWG00bUhsYTlTRndremtyaUllSGhIeDBh?=
 =?utf-8?B?QkJzWXFuMitFZndzSmh3djNFenRCbGIyUzFwOVdzeVh1Y3N1WlNwa1B0REhl?=
 =?utf-8?B?YmlFUHhzRmFlRnN5bW1xcURyWE4yT3JhQzJFdHJpSUV0U2pub0Q5UEl1Mlpy?=
 =?utf-8?B?MHl2TGZsU3VLZjZvRTFLV2hxSmhvVjJocm94WXJ1R1gwa3NRL085dXMrSHBT?=
 =?utf-8?B?Y2FsSDJqM3VKQkMreHo2azdMUFc1VmJ3dUlNb2FqK3pGUnE1bGxrRHNGaDc1?=
 =?utf-8?B?WUcwb0FQSndOV2VQVVJ0U3hXV0xPODNJeHZzTUhNaGFwbjJUQkZjN21GaW1L?=
 =?utf-8?B?dnFqZjB2ZUw2b0tDbG9wR3FzWUs3aHc2bXhZMjlQVXViRmJzdXRVVkV0YkJX?=
 =?utf-8?B?alR6RzVwbFRrekcrWmNhUHBWdHJlS3dYZjU4eSs1T1drcllKM3RCQi9hOUUz?=
 =?utf-8?B?MUxqSThEblYzQnFQOWRnZ3lqYStHS2svOExsQUo1ekE3ZHNHM1E1Z2Q2WHY2?=
 =?utf-8?B?ZFJ0OUJEdEIxS2FLVGsveWhMdmZOSXpPTmdnd3VMenhLVUxVWW5qbEdaU0Jy?=
 =?utf-8?B?c3NqejVmdmpxSFdJL1A2WGxPVEtjdFh1ZGhWemhTZWhhNC9seUZTb0hyS1Ey?=
 =?utf-8?B?K2NhbDR0SEsvbUMxL3lXUFBaVG1uMkFKS2l1b2ZDcHFTclNKREp2WkY4NTZm?=
 =?utf-8?B?S0JQTy8zNnVyd1hWUW1BcXlyTGd3UDh4OXMzcVBhQ2hBTW1rWHhnaElnQTVN?=
 =?utf-8?B?OWRGWjl4ZmIzNjZVN0tiUndObkc2QVA3UUw1dWkvc2tNLzJpc2xML2luVFFn?=
 =?utf-8?B?bllKRXh0Vkg5QW1ndlFlUW03NkZxWHFCZXk0elZnWC8xRkdBRHoxcUtLaHFq?=
 =?utf-8?B?VjBXV1NqbWxmeGVkKzZjSHZ5TGhnSnFXUGt1bjZUSWlvb3hrL3U4alJJNG1Q?=
 =?utf-8?B?eVkvU1pKNEluZS85N01LWTI2SnRtNitnRDMxZDdNK2JEZjJ1d0hIaHcrbUg5?=
 =?utf-8?B?MDhZVVUwQXUrWG5ZaWlqdmhRVGlFejM2VTdEYnJlNTRvaGUvbzNMZWJMNllM?=
 =?utf-8?B?MG9MZlExVi9oQVJyR1FZZVdSclU3OUNicjExeFNnQWtmcmxhdUhNU2V0bkNj?=
 =?utf-8?B?bmQvY0M3aUdQbXlFYXRzckNORjVnenp0cEc0ZzNFNEs0VWJLZVAyMFQ0V3o2?=
 =?utf-8?B?WW9EQko2VTVzcTF0YjMydytDbHduMUJrTk1UQ0NhVmxDT0U4VEpuUmFIeGM5?=
 =?utf-8?B?N0JHWHRFK0tkeks5SVhSS2Z1aVRPSFpMazB6YWZLdFBoK0wxVWN1aGlxRjRj?=
 =?utf-8?B?V3BuWUxZbGdDU2dwR21kUUJYaWc1aElOcmdPTGw4WkZ6bUhVbjYwSmZZMjZW?=
 =?utf-8?B?Ry8xSk9qZTVKY0FJOVpCK1BIcHVwN0ZHeUs2NXQyUmU0MGNseDZINVN0eFJw?=
 =?utf-8?B?RFVkWm80NFpmK0ZOaStvaDBXRVlrUStPamdLdlZOb1VUR2dIZlJzTGRHUTRN?=
 =?utf-8?B?Z3pVNzB0NmxPQWoycVJ2R01NTGc2aGRIRGFxL3JMdkljZG56dGhSR0Rkdmkx?=
 =?utf-8?B?Rk93V21CWUFOWHF3QmRhME5VL0pZOS9VMk1XbllaZXpNNER5K1RQbW9sczZy?=
 =?utf-8?B?ZHZ1eTE3dHdzcUhpMzNlZlNpS01pQzlJbXR5RS9OS0NwSXl2V2FwOHpONDdW?=
 =?utf-8?B?eDdKNXRjb3VMcmNMMDhXTnhpMFhSL3NnUkhrV3V4c2xKK1pKOUZFeXBhbjVR?=
 =?utf-8?B?TzNMUkFTbVZlbUxJVkgxeDhIZmpwOW1TYjM2bUVHS0JRcHBqVFhBTUJ0YmxV?=
 =?utf-8?B?clZJNndmVmNMRG9UU1FWUGFZQlllNzJ5MVZXclF0UlRWV284RkVTQzR2MlNi?=
 =?utf-8?Q?mzLVPIGUkK7et2+dJfEEpPGgv7326CDpBdSUXerMno=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 727cd8b5-f4c4-49a1-2604-08d9d6c3c98b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 18:37:44.0129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJCKYBF3MXB5g4EnKlQxHFv9/bCNqr+bYT4bNX4DPc6ST4UrDcr+5I7XXEHSguhe8FqyduDZPnl6QGNMVPShqX1T9f/oy41fw0OKFRJZzoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1584
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/13/2022 10:13, Matthew Brost wrote:
> Add a cancel request selftest that results in an engine reset to cancel
> the request as it is non-preemptable. Also insert a NOP request after
> the cancelled request and confirm that it completes successfully.
>
> v2:
>   (Tvrtko)
>    - Skip test if preemption timeout compiled out
>    - Skip test if engine reset isn't supported
>    - Update debug prints to be more descriptive
> v3:
>    - Add comment explaining test
> v4:
>   (John Harrison)
>    - Fix typos in comment explaining test
>    - goto out_rq is NOP creation fails
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>
> ---
>   drivers/gpu/drm/i915/selftests/i915_request.c | 117 ++++++++++++++++++
>   1 file changed, 117 insertions(+)
> ---
>   drivers/gpu/drm/i915/selftests/i915_request.c | 117 ++++++++++++++++++
>   1 file changed, 117 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
> index 7f66f6d299b26..2a99dd7c2fe8a 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> @@ -782,6 +782,115 @@ static int __cancel_completed(struct intel_engine_cs *engine)
>   	return err;
>   }
>   
> +/*
> + * Test to prove a non-preemptable request can be cancelled and a subsequent
Oops - another 'preemptible'. Maybe fix that one during merge?

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


> + * request on the same context can successfully complete after cancellation.
> + *
> + * Testing methodology is to create a non-preemptible request and submit it,
> + * wait for spinner to start, create a NOP request and submit it, cancel the
> + * spinner, wait for spinner to complete and verify it failed with an error,
> + * finally wait for NOP request to complete verify it succeeded without an
> + * error. Preemption timeout also reduced / restored so test runs in a timely
> + * maner.
> + */
> +static int __cancel_reset(struct drm_i915_private *i915,
> +			  struct intel_engine_cs *engine)
> +{
> +	struct intel_context *ce;
> +	struct igt_spinner spin;
> +	struct i915_request *rq, *nop;
> +	unsigned long preempt_timeout_ms;
> +	int err = 0;
> +
> +	if (!CONFIG_DRM_I915_PREEMPT_TIMEOUT ||
> +	    !intel_has_reset_engine(engine->gt))
> +		return 0;
> +
> +	preempt_timeout_ms = engine->props.preempt_timeout_ms;
> +	engine->props.preempt_timeout_ms = 100;
> +
> +	if (igt_spinner_init(&spin, engine->gt))
> +		goto out_restore;
> +
> +	ce = intel_context_create(engine);
> +	if (IS_ERR(ce)) {
> +		err = PTR_ERR(ce);
> +		goto out_spin;
> +	}
> +
> +	rq = igt_spinner_create_request(&spin, ce, MI_NOOP);
> +	if (IS_ERR(rq)) {
> +		err = PTR_ERR(rq);
> +		goto out_ce;
> +	}
> +
> +	pr_debug("%s: Cancelling active non-preemptable request\n",
> +		 engine->name);
> +	i915_request_get(rq);
> +	i915_request_add(rq);
> +	if (!igt_wait_for_spinner(&spin, rq)) {
> +		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
> +
> +		pr_err("Failed to start spinner on %s\n", engine->name);
> +		intel_engine_dump(engine, &p, "%s\n", engine->name);
> +		err = -ETIME;
> +		goto out_rq;
> +	}
> +
> +	nop = intel_context_create_request(ce);
> +	if (IS_ERR(nop))
> +		goto out_rq;
> +	i915_request_get(nop);
> +	i915_request_add(nop);
> +
> +	i915_request_cancel(rq, -EINTR);
> +
> +	if (i915_request_wait(rq, 0, HZ) < 0) {
> +		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
> +
> +		pr_err("%s: Failed to cancel hung request\n", engine->name);
> +		intel_engine_dump(engine, &p, "%s\n", engine->name);
> +		err = -ETIME;
> +		goto out_nop;
> +	}
> +
> +	if (rq->fence.error != -EINTR) {
> +		pr_err("%s: fence not cancelled (%u)\n",
> +		       engine->name, rq->fence.error);
> +		err = -EINVAL;
> +		goto out_nop;
> +	}
> +
> +	if (i915_request_wait(nop, 0, HZ) < 0) {
> +		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
> +
> +		pr_err("%s: Failed to complete nop request\n", engine->name);
> +		intel_engine_dump(engine, &p, "%s\n", engine->name);
> +		err = -ETIME;
> +		goto out_nop;
> +	}
> +
> +	if (nop->fence.error != 0) {
> +		pr_err("%s: Nop request errored (%u)\n",
> +		       engine->name, nop->fence.error);
> +		err = -EINVAL;
> +	}
> +
> +out_nop:
> +	i915_request_put(nop);
> +out_rq:
> +	i915_request_put(rq);
> +out_ce:
> +	intel_context_put(ce);
> +out_spin:
> +	igt_spinner_fini(&spin);
> +out_restore:
> +	engine->props.preempt_timeout_ms = preempt_timeout_ms;
> +	if (err)
> +		pr_err("%s: %s error %d\n", __func__, engine->name, err);
> +	return err;
> +}
> +
>   static int live_cancel_request(void *arg)
>   {
>   	struct drm_i915_private *i915 = arg;
> @@ -814,6 +923,14 @@ static int live_cancel_request(void *arg)
>   			return err;
>   		if (err2)
>   			return err2;
> +
> +		/* Expects reset so call outside of igt_live_test_* */
> +		err = __cancel_reset(i915, engine);
> +		if (err)
> +			return err;
> +
> +		if (igt_flush_test(i915))
> +			return -EIO;
>   	}
>   
>   	return 0;

