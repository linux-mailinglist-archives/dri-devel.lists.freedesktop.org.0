Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 115BE3CF10F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 03:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60606E219;
	Tue, 20 Jul 2021 01:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C60A6E219;
 Tue, 20 Jul 2021 01:03:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="191436920"
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="191436920"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 18:03:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="500112640"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Jul 2021 18:03:09 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 19 Jul 2021 18:03:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 19 Jul 2021 18:03:09 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 19 Jul 2021 18:03:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INt7tbprT39Qww45L24tJZQBTmhh9O1BndGENcBd9XY+r9xOHVT/15O2s9zunPO9aaKi+Jrg0NlXu+B6WvmhpYiXURKoZL36MC/tacL0AormEJZgeDTskXBayq5uxOQvWcsamhURPcYicX6UB7XlvXHJAsTHALsMkg/QGVgR7t6I4bKFXuMaWi73FdPFPCOGXoLzVyth0NtuCye3Ke5Zfx66gDypgoHMWFqKMOMUD2FyueW6e0XLZTt6FSrNrmb8ZZeqHjV6Ojk4DTfZW6p2b9U+tgovujOhMw9/efdo1dOo1IGEVtkOn6Ml2OKcdKGjyAXwrY+N2TT6lK/K4DtOZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGxds/3dMhAo4Vz7V2Rwu9AWi/rJAv1LxbD0TDazu3k=;
 b=VR4RN7/LYpUuQxOpDoJ5P+VQNjM8zj9h+kpT1iJJoY3qNVKfIOrIx2G8mYm34H2uBOdqLk81VXuvdZ8pSRP7gKvX9CoXgjaj+afJPeDrvJzojWc6BHezGdaf6FmE01V0IEgWIg9Eu1h6jcc+Lb9rV+JzYCxW/uy6iY0sOOGOG97uk4Re4inDfGcNxSuuBKnZmz94RSpzyeHwlFLzWSejS8TG+2qeyCX3gS1swIzUDc8VqdWtiBo2oozWPAKNz/HGS1Bpkx8+tMW3FU3XcuhTxxIMlnjQnSLU69m8vx//jyCKhxS3Zt7I3PMZkGXBHlzPzGqwko00tSg4fdX8tshHhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGxds/3dMhAo4Vz7V2Rwu9AWi/rJAv1LxbD0TDazu3k=;
 b=vfCoAKRMC8ZCHRUtDXJ3X7NuSVOQ74TmtMxXiCLUg5EiSf4+YOVtQIzg1x0PpjZ7xc5tLO60OU2lQ10LFuYEW3KYIg/3bqSlgC4B23D5nPdZkBZTgVCQ7Hs6RLa/dcmy1W7kKZUc+ZucYCo7sSsqZ8oA8e3x7tiB+7Q/NQMHM1Y=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Tue, 20 Jul
 2021 01:03:07 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%8]) with mapi id 15.20.4331.032; Tue, 20 Jul 2021
 01:03:07 +0000
Subject: Re: [PATCH 15/51] drm/i915/guc: Update intel_gt_wait_for_idle to work
 with GuC
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-16-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <4bfe5983-eb17-6993-6210-0f7fe38ea1fb@intel.com>
Date: Mon, 19 Jul 2021 18:03:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210716201724.54804-16-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: SJ0PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::13) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 SJ0PR03CA0218.namprd03.prod.outlook.com (2603:10b6:a03:39f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 20 Jul 2021 01:03:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f133eb23-f41a-45e9-3276-08d94b1a22b7
X-MS-TrafficTypeDiagnostic: PH0PR11MB5642:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5642E1FA72F9BC4BAEDA5A15BDE29@PH0PR11MB5642.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dRncYOhHt1Dfyje/Wv7zDE1fB8a7QVGP7XzN7P3fQNnv7rJ+L4PhW3I/wamcZTy3pDhY4VazW/E2WypSXFe/cz0v4cWuUYSGuSZIzykIQkunv4+wC6wYssl5QgcAhDkOPylymGa9leZ9+Y7zT4v4Y/1yeKcv609Lzr55ShstULwzQcPwkUSJ0ltJlkRBd0wApKxcZZV/fg7j4GmiKG76dfpZNGuOWx1OTj95tZ/CJlYqqGZfAQCjBrVUuukiOi12DmVwIuWjelAZ+n+UTcdTJVf18wACEPYbmdLDvLGJv044uzWq5AUcMjz2HOXgk6vlLFUexum2pWBrOxaCPgmpQqk3aS6WWS2pHQJ3jPaFoYwvxtshH7oBaQKaXyBBXZMeTeBeGFy08ae4OXlEnu7W8GXTYeKFm+TiuSGMQ/vz1g1sXPnOtGCwAlGBA22mjAWwzjqBqVYT3RzLYKrD7x8p4E/erFBFDytR+zQOGdcXcqkMCjBWBSpuFO9NPgWeCXe4eCkgGfeyq65yA24VJoGqCRdpheCDeVG5+C27Zki5FLMONImHsO4gwrs/KJCxlTAqnpz+C4R/W3OZBwdJPxoJnoqkoczrBvVrWZ/CP3baXbblp0drRM/2mGgc2ENEgMz/9eZjINgtbXuEWOd7cSihOTdWys/5L0mr0r2+wF6aMYO4MEkgYksU4PNdxaKHRZ/flTP1E+3O2ou+52rUtFneHyiZagdQuv4jiWecXXjMQmqy2tKUGi7uhF4UYcJniT03
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(366004)(30864003)(2616005)(107886003)(316002)(8676002)(66556008)(86362001)(450100002)(31686004)(478600001)(8936002)(956004)(66476007)(2906002)(66946007)(4326008)(16576012)(6486002)(53546011)(83380400001)(5660300002)(31696002)(186003)(38100700002)(26005)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1FLYWVEVmltT0NzWjM5cm1icFEzTVQyZWNjYXMrbEhWaTFYbVgwa29ZNEMv?=
 =?utf-8?B?SzdiYkZmN1haaWw3NUNOM0VRM3JXMkFjb3BobXNZdHIwSmpqcFpGWGJ1dmda?=
 =?utf-8?B?V3hFZGxZb21CWHVUTEllTzdFTFJtVWhLSEVwTWJ2WlpVVkJPWkZIbGVmS3JS?=
 =?utf-8?B?enhsVjljY0UwQXBJTlFxMmx5K2VhSUZ0Szc5RDhlZkpuMCt6d1ZBTDlzaDIr?=
 =?utf-8?B?NFBESHhNc3ZxbGpieVlpQkIvQVRQY0tqRnVVYnlJZ3RzUkF4QjhSY2REV1ox?=
 =?utf-8?B?dFBMejJPMG1RVisyUm5vZzZabHdLb2t5RktTNFBWbkZHLzhmNytJU3d0WDJu?=
 =?utf-8?B?dnhQQURhd3dFSmQvNFZCQm5VMkl2Z3hJanpnNUppL1VTWmNEQU5QWm9BRHBa?=
 =?utf-8?B?ZDFCdDloZ2ZpK3hPNE1INUgyWXYrb3E3K2NXMmdwbjFUWVZ5dHRiQ1pkbDdu?=
 =?utf-8?B?ZDZTM01qcnpDeGVrK0lLdndTQ3V5WEc0Q2dqMzdOUlIvMjRMWkxPc1djb0VO?=
 =?utf-8?B?Ulh5WGVUbmNhbUJYejlQTlFMODR1QXN5OXlxRTNycGRaOFljZVh2OGo1MWdj?=
 =?utf-8?B?SlczQUp6OWREN2pGK1B5R3RnWGtHcTIvQW8ydkk0SUpFNEVMNjFPVmF1V0lM?=
 =?utf-8?B?NWx1aFcvVWViejhkQXdPbnlRTnltdzlLdmhOLzMyUzJxUnJkWmxwNFhLYnFu?=
 =?utf-8?B?NVVQRm9ic05odUJaa0JPUHBjWjNLT3RpM1BOZlJBRHRQOEt4V01sTEc0Nk9Z?=
 =?utf-8?B?bEkyS2UraDQ4cmdjL0tTZXIvOXYzdWp3QkRyc01pZXN6ZXpKTlRUMTJzTVlz?=
 =?utf-8?B?NTBPQWdLd2crandPVHpjSHh3K1FyQ09jaGkzNDdNa2N0eXh6ZThRVTBaQlZP?=
 =?utf-8?B?MTF6NU83blFPczZPcnM2ZElhZEJFTC9tVndCSVVremZrWDV5Y3hQN2x5U3JO?=
 =?utf-8?B?UHpQWWRvREM4RjVzdVNNaUFGV0RWSm4zWlAvejBkdzlzUllMUTdFdkxkTXRs?=
 =?utf-8?B?eTA1eDN4SDl0c2E5MWJQSnpERUp1LzNuLzFWMW05MTV3Si9vZVJjTHJpbWUw?=
 =?utf-8?B?WVJyRWI4ekdmTFhCMDhvSGw3L1hOYzRwRGNMM3YzL2J2VmN4Y055SDlEVnVP?=
 =?utf-8?B?dmJEUTc3OHVkQVUxcFVPUDJnUzAzK05iWFJPUUFoSzRQYXlrVVZpVWZETzZs?=
 =?utf-8?B?VjdmZkhwa0hsVGV1TTVWM1FIQnNiclJ1N3FTMDllZlZmZ3ZSTnRCR2k2Q0Z6?=
 =?utf-8?B?RkhlblhacWdSSHdvODIyd1ZONFBTTlRVYjczTjBxS3Q0T1FTNWZWd0gvMEFE?=
 =?utf-8?B?ancvaUtWS0dmZzYrUkxqZktlZmVWcXV4WTB5cFF3YkRLaktnMFhBamNtUlhV?=
 =?utf-8?B?cXhIT3NkQmc3VkxJd05XdXlkeDRhODNqNHF6UVcwMENYaXo1eUlSckhPS25p?=
 =?utf-8?B?bVVkTlRxYWlRUWdQTzJsQWN2ajBya0o3MDZVOXBMb05hbDlka09FY2ZRcU4x?=
 =?utf-8?B?RUdhWXkvbjF2QTNTZFY3TEFWVk5MOW5kTSt1UmYvb0pUN0xxeDg4YUpEcUwz?=
 =?utf-8?B?K0tYeHY4N2E3TFFCT0pnTHFGK09XSmcxWkRPOWVudXpsaTFqRUh6Y0hsZ3Br?=
 =?utf-8?B?YW5xVFpja0VZMVdUU0xaVmgwRmxkWlJkUllHOS82VEZBUlpaa2kxTEFpK1Ry?=
 =?utf-8?B?Q0t2aUUyc0tnOHpQWnpzZXdmdytheWlXcm5zbGg5MUFKaVFneGFzRllSaUVu?=
 =?utf-8?Q?OTv1RnQ+foTwYNHLOXn6zD0teHdWFahuS3skCJc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f133eb23-f41a-45e9-3276-08d94b1a22b7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 01:03:07.4255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVSXarOTyyrpakqZ/ZFbbHl899ZWyYh7sdLXFEKh4BQnvb8+OsLgKxM+kQgEEqBtb2cxTa6HKy/XtgxRj8ujvOprtPArAtKitc+6KPjPh6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5642
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/16/2021 13:16, Matthew Brost wrote:
> When running the GuC the GPU can't be considered idle if the GuC still
> has contexts pinned. As such, a call has been added in
> intel_gt_wait_for_idle to idle the UC and in turn the GuC by waiting for
> the number of unpinned contexts to go to zero.
>
> v2: rtimeout -> remaining_timeout
> v3: Drop unnecessary includes, guc_submission_busy_loop ->
> guc_submission_send_busy_loop, drop negatie timeout trick, move a
> refactor of guc_context_unpin to earlier path (John H)
>
> Cc: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  3 +-
>   drivers/gpu/drm/i915/gt/intel_gt.c            | 19 +++++
>   drivers/gpu/drm/i915/gt/intel_gt.h            |  2 +
>   drivers/gpu/drm/i915/gt/intel_gt_requests.c   | 21 ++---
>   drivers/gpu/drm/i915/gt/intel_gt_requests.h   |  7 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  4 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  1 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |  4 +
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 85 +++++++++++++++++--
>   drivers/gpu/drm/i915/gt/uc/intel_uc.h         |  5 ++
>   drivers/gpu/drm/i915/i915_gem_evict.c         |  1 +
>   .../gpu/drm/i915/selftests/igt_live_test.c    |  2 +-
>   .../gpu/drm/i915/selftests/mock_gem_device.c  |  3 +-
>   13 files changed, 129 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index a90f796e85c0..6fffd4d377c2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -645,7 +645,8 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
>   		goto insert;
>   
>   	/* Attempt to reap some mmap space from dead objects */
> -	err = intel_gt_retire_requests_timeout(&i915->gt, MAX_SCHEDULE_TIMEOUT);
> +	err = intel_gt_retire_requests_timeout(&i915->gt, MAX_SCHEDULE_TIMEOUT,
> +					       NULL);
>   	if (err)
>   		goto err;
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index e714e21c0a4d..acfdd53b2678 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -585,6 +585,25 @@ static void __intel_gt_disable(struct intel_gt *gt)
>   	GEM_BUG_ON(intel_gt_pm_is_awake(gt));
>   }
>   
> +int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout)
> +{
> +	long remaining_timeout;
> +
> +	/* If the device is asleep, we have no requests outstanding */
> +	if (!intel_gt_pm_is_awake(gt))
> +		return 0;
> +
> +	while ((timeout = intel_gt_retire_requests_timeout(gt, timeout,
> +							   &remaining_timeout)) > 0) {
> +		cond_resched();
> +		if (signal_pending(current))
> +			return -EINTR;
> +	}
> +
> +	return timeout ? timeout : intel_uc_wait_for_idle(&gt->uc,
> +							  remaining_timeout);
> +}
> +
>   int intel_gt_init(struct intel_gt *gt)
>   {
>   	int err;
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
> index e7aabe0cc5bf..74e771871a9b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -48,6 +48,8 @@ void intel_gt_driver_release(struct intel_gt *gt);
>   
>   void intel_gt_driver_late_release(struct intel_gt *gt);
>   
> +int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout);
> +
>   void intel_gt_check_and_clear_faults(struct intel_gt *gt);
>   void intel_gt_clear_error_registers(struct intel_gt *gt,
>   				    intel_engine_mask_t engine_mask);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> index 647eca9d867a..edb881d75630 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> @@ -130,7 +130,8 @@ void intel_engine_fini_retire(struct intel_engine_cs *engine)
>   	GEM_BUG_ON(engine->retire);
>   }
>   
> -long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout)
> +long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout,
> +				      long *remaining_timeout)
>   {
>   	struct intel_gt_timelines *timelines = &gt->timelines;
>   	struct intel_timeline *tl, *tn;
> @@ -195,22 +196,10 @@ out_active:	spin_lock(&timelines->lock);
>   	if (flush_submission(gt, timeout)) /* Wait, there's more! */
>   		active_count++;
>   
> -	return active_count ? timeout : 0;
> -}
> -
> -int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout)
> -{
> -	/* If the device is asleep, we have no requests outstanding */
> -	if (!intel_gt_pm_is_awake(gt))
> -		return 0;
> -
> -	while ((timeout = intel_gt_retire_requests_timeout(gt, timeout)) > 0) {
> -		cond_resched();
> -		if (signal_pending(current))
> -			return -EINTR;
> -	}
> +	if (remaining_timeout)
> +		*remaining_timeout = timeout;
>   
> -	return timeout;
> +	return active_count ? timeout : 0;
>   }
>   
>   static void retire_work_handler(struct work_struct *work)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.h b/drivers/gpu/drm/i915/gt/intel_gt_requests.h
> index fcc30a6e4fe9..83ff5280c06e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.h
You were saying the the include of stddef is needed here?

> @@ -10,10 +10,11 @@ struct intel_engine_cs;
>   struct intel_gt;
>   struct intel_timeline;
>   
> -long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout);
> +long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout,
> +				      long *remaining_timeout);
>   static inline void intel_gt_retire_requests(struct intel_gt *gt)
>   {
> -	intel_gt_retire_requests_timeout(gt, 0);
> +	intel_gt_retire_requests_timeout(gt, 0, NULL);
>   }
>   
>   void intel_engine_init_retire(struct intel_engine_cs *engine);
> @@ -21,8 +22,6 @@ void intel_engine_add_retire(struct intel_engine_cs *engine,
>   			     struct intel_timeline *tl);
>   void intel_engine_fini_retire(struct intel_engine_cs *engine);
>   
> -int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout);
> -
>   void intel_gt_init_requests(struct intel_gt *gt);
>   void intel_gt_park_requests(struct intel_gt *gt);
>   void intel_gt_unpark_requests(struct intel_gt *gt);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 80b88bae5f24..3cc566565224 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -39,6 +39,8 @@ struct intel_guc {
>   	spinlock_t irq_lock;
>   	unsigned int msg_enabled_mask;
>   
> +	atomic_t outstanding_submission_g2h;
> +
>   	struct {
>   		void (*reset)(struct intel_guc *guc);
>   		void (*enable)(struct intel_guc *guc);
> @@ -238,6 +240,8 @@ static inline void intel_guc_disable_msg(struct intel_guc *guc, u32 mask)
>   	spin_unlock_irq(&guc->irq_lock);
>   }
>   
> +int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout);
> +
>   int intel_guc_reset_engine(struct intel_guc *guc,
>   			   struct intel_engine_cs *engine);
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index c33906ec478d..f1cbed6b9f0a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -109,6 +109,7 @@ void intel_guc_ct_init_early(struct intel_guc_ct *ct)
>   	INIT_LIST_HEAD(&ct->requests.incoming);
>   	INIT_WORK(&ct->requests.worker, ct_incoming_request_worker_func);
>   	tasklet_setup(&ct->receive_tasklet, ct_receive_tasklet_func);
> +	init_waitqueue_head(&ct->wq);
>   }
>   
>   static inline const char *guc_ct_buffer_type_to_str(u32 type)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> index 785dfc5c6efb..4b30a562ae63 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> @@ -10,6 +10,7 @@
>   #include <linux/spinlock.h>
>   #include <linux/workqueue.h>
>   #include <linux/ktime.h>
> +#include <linux/wait.h>
>   
>   #include "intel_guc_fwif.h"
>   
> @@ -68,6 +69,9 @@ struct intel_guc_ct {
>   
>   	struct tasklet_struct receive_tasklet;
>   
> +	/** @wq: wait queue for g2h chanenl */
> +	wait_queue_head_t wq;
> +
>   	struct {
>   		u16 last_fence; /* last fence used to send request */
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index f7e34baa9506..088d11e2e497 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -254,6 +254,69 @@ static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
>   	xa_store_irq(&guc->context_lookup, id, ce, GFP_ATOMIC);
>   }
>   
> +static int guc_submission_send_busy_loop(struct intel_guc* guc,
> +					 const u32 *action,
> +					 u32 len,
> +					 u32 g2h_len_dw,
> +					 bool loop)
> +{
> +	int err;
> +
> +	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
> +
> +	if (!err && g2h_len_dw)
> +		atomic_inc(&guc->outstanding_submission_g2h);
> +
> +	return err;
> +}
> +
> +static int guc_wait_for_pending_msg(struct intel_guc *guc,
> +				    atomic_t *wait_var,
> +				    bool interruptible,
> +				    long timeout)
> +{
> +	const int state = interruptible ?
> +		TASK_INTERRUPTIBLE : TASK_UNINTERRUPTIBLE;
> +	DEFINE_WAIT(wait);
> +
> +	might_sleep();
> +	GEM_BUG_ON(timeout < 0);
> +
> +	if (!atomic_read(wait_var))
> +		return 0;
> +
> +	if (!timeout)
> +		return -ETIME;
> +
> +	for (;;) {
> +		prepare_to_wait(&guc->ct.wq, &wait, state);
> +
> +		if (!atomic_read(wait_var))
> +			break;
> +
> +		if (signal_pending_state(state, current)) {
> +			timeout = -EINTR;
> +			break;
> +		}
> +
> +		if (!timeout) {
> +			timeout = -ETIME;
> +			break;
> +		}
> +
> +		timeout = io_schedule_timeout(timeout);
> +	}
> +	finish_wait(&guc->ct.wq, &wait);
> +
> +	return (timeout < 0) ? timeout : 0;
> +}
> +
> +int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
> +{
> +	return guc_wait_for_pending_msg(guc, &guc->outstanding_submission_g2h,
> +					true, timeout);
> +}
> +
>   static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   {
>   	int err;
> @@ -280,6 +343,7 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   
>   	err = intel_guc_send_nb(guc, action, len, g2h_len_dw);
>   	if (!enabled && !err) {
> +		atomic_inc(&guc->outstanding_submission_g2h);
>   		set_context_enabled(ce);
>   	} else if (!enabled) {
>   		clr_context_pending_enable(ce);
> @@ -731,7 +795,8 @@ static int __guc_action_register_context(struct intel_guc *guc,
>   		offset,
>   	};
>   
> -	return intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
> +	return guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
> +					     0, true);
>   }
>   
>   static int register_context(struct intel_context *ce)
> @@ -751,8 +816,9 @@ static int __guc_action_deregister_context(struct intel_guc *guc,
>   		guc_id,
>   	};
>   
> -	return intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action),
> -					G2H_LEN_DW_DEREGISTER_CONTEXT, true);
> +	return guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
> +					     G2H_LEN_DW_DEREGISTER_CONTEXT,
> +					     true);
>   }
>   
>   static int deregister_context(struct intel_context *ce, u32 guc_id)
> @@ -893,8 +959,8 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
>   
>   	intel_context_get(ce);
>   
> -	intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action),
> -				 G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true);
> +	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
> +				      G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true);
>   }
>   
>   static u16 prep_context_pending_disable(struct intel_context *ce)
> @@ -1440,6 +1506,12 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
>   	return ce;
>   }
>   
> +static void decr_outstanding_submission_g2h(struct intel_guc *guc)
> +{
> +	if (atomic_dec_and_test(&guc->outstanding_submission_g2h))
> +		wake_up_all(&guc->ct.wq);
> +}
> +
>   int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>   					  const u32 *msg,
>   					  u32 len)
> @@ -1475,6 +1547,8 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>   		lrc_destroy(&ce->ref);
>   	}
>   
> +	decr_outstanding_submission_g2h(guc);
> +
>   	return 0;
>   }
>   
> @@ -1523,6 +1597,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   	}
>   
> +	decr_outstanding_submission_g2h(guc);
>   	intel_context_put(ce);
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> index 9c954c589edf..c4cef885e984 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> @@ -81,6 +81,11 @@ uc_state_checkers(guc, guc_submission);
>   #undef uc_state_checkers
>   #undef __uc_state_checker
>   
> +static inline int intel_uc_wait_for_idle(struct intel_uc *uc, long timeout)
> +{
> +	return intel_guc_wait_for_idle(&uc->guc, timeout);
> +}
> +
>   #define intel_uc_ops_function(_NAME, _OPS, _TYPE, _RET) \
>   static inline _TYPE intel_uc_##_NAME(struct intel_uc *uc) \
>   { \
> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
> index 4d2d59a9942b..2b73ddb11c66 100644
> --- a/drivers/gpu/drm/i915/i915_gem_evict.c
> +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
> @@ -27,6 +27,7 @@
>    */
>   
>   #include "gem/i915_gem_context.h"
> +#include "gt/intel_gt.h"
Still not seeing a need for this.

>   #include "gt/intel_gt_requests.h"
>   
>   #include "i915_drv.h"
> diff --git a/drivers/gpu/drm/i915/selftests/igt_live_test.c b/drivers/gpu/drm/i915/selftests/igt_live_test.c
> index c130010a7033..1c721542e277 100644
> --- a/drivers/gpu/drm/i915/selftests/igt_live_test.c
> +++ b/drivers/gpu/drm/i915/selftests/igt_live_test.c
> @@ -5,7 +5,7 @@
>    */
>   
>   #include "i915_drv.h"
> -#include "gt/intel_gt_requests.h"
> +#include "gt/intel_gt.h"
Nor this.

John.

>   
>   #include "../i915_selftest.h"
>   #include "igt_flush_test.h"
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index d189c4bd4bef..4f8180146888 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -52,7 +52,8 @@ void mock_device_flush(struct drm_i915_private *i915)
>   	do {
>   		for_each_engine(engine, gt, id)
>   			mock_engine_flush(engine);
> -	} while (intel_gt_retire_requests_timeout(gt, MAX_SCHEDULE_TIMEOUT));
> +	} while (intel_gt_retire_requests_timeout(gt, MAX_SCHEDULE_TIMEOUT,
> +						  NULL));
>   }
>   
>   static void mock_device_release(struct drm_device *dev)

