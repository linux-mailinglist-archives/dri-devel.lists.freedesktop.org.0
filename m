Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 483C03D025B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 21:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3956E226;
	Tue, 20 Jul 2021 19:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45C06E226;
 Tue, 20 Jul 2021 19:55:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="275139344"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="275139344"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 12:55:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="415359041"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 20 Jul 2021 12:55:13 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 20 Jul 2021 12:55:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 20 Jul 2021 12:55:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 20 Jul 2021 12:55:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VT4eFKHWz6HShfNwxmFuiTdzMEehsBiUCuBaPU0ITliNXKWEkkppU9eJ86oPFJXNnRV06ffsr2HNojdDCBQxhjZYCuQU/YBr7TBLoqHaFpMvNbEfXDSgEbIufSnMtsuCfcUvRPt/8IYibE4kauXJxOYaqWi4AS+OnbE52mejBrdZmHh9CC2pjElUL2bp9FxhYwmEkbexqjZ0dowr9oiDTcstqEdve3cH/sOLZX7uucn7lbReHiwY/cht61e73Q9NaNwJUtGFhKxn6dfbVW/3m6TnQpcmXZDzasgiZ+cQwnkbE0FIyw4dmuLQBVrFBlTQGveSiEXaOsGEnXuTZLgzoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zThrgD0dKwiww7isOFUssUcSFG3tX1HTjmSGxlEgZpA=;
 b=OAbnHmVsTyEKr6raMGRVzvLni13af2RlzRTnAgt/voexsl2wfQlrlLc86zf0oxQEAo6kBw76aA94sxqJkAM+8VWNwHv+/7OIAV5xZQKBQ4Rb0StYFHyXUcF4awZWrm4VCAJJ5M6Q2uepYVmvF0vmVekJsdGpToP+s9bjsEwSc9g4oQUhpI1ksYXjZoVLz/FHOczazy6v4xSqpPzxHCgpUNDD+M+iISqNH7jVUVEMyHDOmOH4etF9WvCVahxBzAcU7mIabhNosPeRVZrS5Jhv8BkQOJgWEP/IMfrXhTWbgKA5f0ulfz/uRLIt+nm7OR9P+y5AbcSjyxEcn+wr+Ed1Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zThrgD0dKwiww7isOFUssUcSFG3tX1HTjmSGxlEgZpA=;
 b=sydihUTj6HRvodXwz0zzCrqB+wrnqWTa8EEvPzYKLzXM51/ioalhVQ+Rk/JNegblyukkkg3gOKd1iw1UJv4R/UTL0YcQckV63eU5BNcu9FGvJjvjoX2vOXIR8jJg+C/cJkJKjPvHVr/AJn18mtvIp8T7CJ0p2qzC6PQ/5+VvtAE=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5628.namprd11.prod.outlook.com (2603:10b6:510:d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Tue, 20 Jul
 2021 19:55:11 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%8]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 19:55:11 +0000
Subject: Re: [PATCH 24/51] drm/i915: Add i915_sched_engine destroy vfunc
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-25-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <f0490496-e7f9-c1ac-0a82-7b9140623560@intel.com>
Date: Tue, 20 Jul 2021 12:55:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210716201724.54804-25-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: CO2PR04CA0168.namprd04.prod.outlook.com
 (2603:10b6:104:4::22) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 CO2PR04CA0168.namprd04.prod.outlook.com (2603:10b6:104:4::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Tue, 20 Jul 2021 19:55:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f16a669-daea-482f-f9b4-08d94bb84876
X-MS-TrafficTypeDiagnostic: PH0PR11MB5628:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5628B22C6E3685B6FA2D4233BDE29@PH0PR11MB5628.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pfm0Syf5G8MQ5SVHB3AtBwLgy8aS3UNE/QyvkP7jJ6aukfuV31ts4P1ex+9ce1MqVzBnNYctFH5SJO0nWpvOYSTL3ues3UTnOBA84Oe2pwWJiVS6WbRdPwmcIiu/rDvuOTkymvfPW/CNNtdltJ7Mtbl9mfxU9xDkYu2bOrKd2vLjsQ2xt9a9SWlRT7KrS9s3zuJMlCmDudqiHy49kHvZMY7bzJHF8sg+ZLXi698NZN6ZwCVvMKHGe0uT4FQwUNUkkv5ICwzTj1X5HcphExUYXoRwY0HmB6xc+FXmmQQzc+Ow29d8RtUsvqwPOXOaGhCS80QCWighDmAtp97VO+EpBhmvxykrVXXuRmdCmNpVC62AKXZ/rIPU+TqnzKmVw47awLPzZActkqx1ghVYPuzTrm/rEFWn7wge+5zW0kAuPXFIhAbtHChFnCIDlRUxPoW+I4g2GMZl+V1yI3j5FvXCSAgCFHYKlC2n7JUEr9mCvBvgaAEAfkW9l/MwcOdnn5aXJcZl3kLPwEv3MCG6OwU8IVnu7yCiXqjOC9eppQhvCXjDcGZ+sSo6wHgfVWP1QJaTe1pbDrDo/4J+pwlTEPD4wHRXxX3tCVsn2hCdzthMiVon1+KK6GIVdScIK3k1uSht4wXsYsmxouM6gF2MbNZ0S8MSXvr9WKnMUrSsUBPinlQa2veM24SYxdPZFi2uDX7iezv52wfSu9BqSmfmsIkO86rRv2i98lU4CXI9DdK38qCIG4b374ggkgVHFq26z0as
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(66946007)(31686004)(956004)(2616005)(53546011)(478600001)(5660300002)(66476007)(450100002)(66556008)(4326008)(36756003)(2906002)(8676002)(86362001)(316002)(16576012)(8936002)(186003)(26005)(31696002)(107886003)(6486002)(38100700002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHRlQit5aWcvRUZMSnNBbWhSK3FqWWNVQWc1cVBqQ0dLZmVlQWNJcHBFYWMz?=
 =?utf-8?B?ODIyVmZoallVUkxmaU92MDVQTGFYdDFrN1dzVUhBMU5aOXV3RS9vd3I2SFkr?=
 =?utf-8?B?dXlONy9yNmg0a3ZQTWRIMmZQc3JDU3IxMXo2UkJ1bCtNNnZYU2U5eTBETlAr?=
 =?utf-8?B?NWxmNTdxUTNITjNDZTg4R0gvcG5rTDJVRUNScDF5dFlxbGUxTks3dEJPanI2?=
 =?utf-8?B?RDY1MEZ6SGYrazFEc2VWREVFQ2xBQjBOWE9yR3dlVEtMdnFHYS85YWNQOU1Z?=
 =?utf-8?B?aUJxemNNRmxvWWxWNVFYUHAvYU8xSUxhMXJEM2JLak9PZ3RQdEJhL3FDOUxk?=
 =?utf-8?B?cyszOG5WL21JdzRYcHVsM2xUcDNVSXR4RWlaR2F3RzJ2cUl6SldFRmp3dHJi?=
 =?utf-8?B?MFIybFZLMTh3ZFAyeTR2OEcwcFdJakFYSXUzYmF0czRLV0FpYVJzWndIMFQ3?=
 =?utf-8?B?dWhGUUQ1dkxyeWRMMVRuMlh0SUlleUEvazAzQ0ozdEhIY3NJSExjaDBRWFRP?=
 =?utf-8?B?RDZBTFdVMHBaNjBkMGtWbHEzTFN2L3c2cnBpWTFCUHZhdnZuaDdIdjVzNUZw?=
 =?utf-8?B?ay9WMWRaeTNtRXV4OWoyTHp3Y0lOMjh3cExOT0ZsTDlOZlFqa01Qb28xQi82?=
 =?utf-8?B?TFJ0eWh1dVFUOUc5SHd6d2Q1c204TnhHVTd5WVM4QkJQbTNzWm42VUgvak1p?=
 =?utf-8?B?bzZoeGxjVjdQU3R4aG5wNEdqbjBBMENRandVaG44V0t6WWFZaXlYeW5ZcVBn?=
 =?utf-8?B?emkyMEtMM0kvVnQvMG84aWdZU0czNjhFQ29vYzZvWlVBTzJnMDJiVWZnOXJ0?=
 =?utf-8?B?WCtDaDRsYklxVW00ZWd2YjRYdzVTbUtOZEpCaFZaU2pqZHNXVFhTREliYlcy?=
 =?utf-8?B?d3dwQ2txR0NYSjZTYytPVzNraHl1aEpNV25Ia1BCdHliMHlTelo3M0RFS21w?=
 =?utf-8?B?b1Q0K1c3SFV0TTEya09ZWW8xdVBnQUZjS0lBMGdjSDFwV2VXRjlrNzJUUlpo?=
 =?utf-8?B?OWtiNzl6VG5RU1B2VXFiRUF1Z3V5aC9ScXQ5L3JiU05LdGxwM1dyaWY3Tk9Q?=
 =?utf-8?B?MklnMXdPUHVWeXJLYkhTWm9kcjhJV2dlNGZLMWgxWXdBZGltdmEybHBicjNE?=
 =?utf-8?B?aGRDeHl5SDJBYXB6R2M5ZUI5YjFGdDRTTjdyS3ZGNjY2RjNkMUUyZHdZUDAv?=
 =?utf-8?B?eEwvSHNYTS9sdm1wNnFSWlpiSE9Eb1JUbFlYSzNoUzVBYS9zTE5UK3lEbFB5?=
 =?utf-8?B?WHBtY0swSVJwSE8veG51YkROUHpXTE9KZVRCNE1WWnR3cDIxVGZoTzU3cWll?=
 =?utf-8?B?aVFYd3lON2I5QTIwMXdsWjBsSUZzdUpUOEhzcldZN3lXMHpidnhLWjBRVFhr?=
 =?utf-8?B?RXNxS0tOa211aDl0d2VEUzJWYW5kVzd3Q3VjTlJqRGtHSHlPRkNjSEtXMjdi?=
 =?utf-8?B?T2xpZGhodElYbHFZd2E4SEhwSHdNaERhbUtKV0Z5VVNwYlFzVkVwclBpMGNY?=
 =?utf-8?B?eXNyY1ZsbzdiMU1HWC9Yc3dFV3AvSWc1U3llMkNmU29mcVlLbUpJckNKZnJ1?=
 =?utf-8?B?WFVTQVhnbDZGeG5iMmcvZG43ejJ0ekZNWEdzSjFyTVE4OU9lZEtDWGJuWlFy?=
 =?utf-8?B?dHZZSEtFMk4yOTRzaVNhYitEdzJSVU9LaXJBVmJwZTdXVnhkRENSRi9XakRI?=
 =?utf-8?B?SlhIMS9FZkd5RmdmMDZiVmU0bUhqdnVXcUNKYmw2K0lSUVVXOHBkRlE0eDVO?=
 =?utf-8?Q?xNkYO1WwOj3wiQPEJBbQJ3KVyderq+LCGqjGck6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f16a669-daea-482f-f9b4-08d94bb84876
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 19:55:11.2682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3kkJqCVcPbXB1FHUXNXXKjZQDs1f/3Oy/bPp6Y0UUlWHS1dcl8fYuKv7neTNvbc6Xq8LPM6dY2WAxXOo3APdW892Mr6JpQOdUxZh/lNzcdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5628
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
> This help the backends clean up when the schedule engine object gets
help -> helps. Although, I would say it's more like 'this is required to 
allow backend specific cleanup'. It doesn't just make life a bit easier, 
it allows us to not leak stuff and/or dereference null pointers!

Either way...
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> destroyed.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_scheduler.c       | 3 ++-
>   drivers/gpu/drm/i915/i915_scheduler.h       | 4 +---
>   drivers/gpu/drm/i915/i915_scheduler_types.h | 5 +++++
>   3 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
> index 3a58a9130309..4fceda96deed 100644
> --- a/drivers/gpu/drm/i915/i915_scheduler.c
> +++ b/drivers/gpu/drm/i915/i915_scheduler.c
> @@ -431,7 +431,7 @@ void i915_request_show_with_schedule(struct drm_printer *m,
>   	rcu_read_unlock();
>   }
>   
> -void i915_sched_engine_free(struct kref *kref)
> +static void default_destroy(struct kref *kref)
>   {
>   	struct i915_sched_engine *sched_engine =
>   		container_of(kref, typeof(*sched_engine), ref);
> @@ -453,6 +453,7 @@ i915_sched_engine_create(unsigned int subclass)
>   
>   	sched_engine->queue = RB_ROOT_CACHED;
>   	sched_engine->queue_priority_hint = INT_MIN;
> +	sched_engine->destroy = default_destroy;
>   
>   	INIT_LIST_HEAD(&sched_engine->requests);
>   	INIT_LIST_HEAD(&sched_engine->hold);
> diff --git a/drivers/gpu/drm/i915/i915_scheduler.h b/drivers/gpu/drm/i915/i915_scheduler.h
> index 650ab8e0db9f..3c9504e9f409 100644
> --- a/drivers/gpu/drm/i915/i915_scheduler.h
> +++ b/drivers/gpu/drm/i915/i915_scheduler.h
> @@ -51,8 +51,6 @@ static inline void i915_priolist_free(struct i915_priolist *p)
>   struct i915_sched_engine *
>   i915_sched_engine_create(unsigned int subclass);
>   
> -void i915_sched_engine_free(struct kref *kref);
> -
>   static inline struct i915_sched_engine *
>   i915_sched_engine_get(struct i915_sched_engine *sched_engine)
>   {
> @@ -63,7 +61,7 @@ i915_sched_engine_get(struct i915_sched_engine *sched_engine)
>   static inline void
>   i915_sched_engine_put(struct i915_sched_engine *sched_engine)
>   {
> -	kref_put(&sched_engine->ref, i915_sched_engine_free);
> +	kref_put(&sched_engine->ref, sched_engine->destroy);
>   }
>   
>   static inline bool
> diff --git a/drivers/gpu/drm/i915/i915_scheduler_types.h b/drivers/gpu/drm/i915/i915_scheduler_types.h
> index 5935c3152bdc..00384e2c5273 100644
> --- a/drivers/gpu/drm/i915/i915_scheduler_types.h
> +++ b/drivers/gpu/drm/i915/i915_scheduler_types.h
> @@ -163,6 +163,11 @@ struct i915_sched_engine {
>   	 */
>   	void *private_data;
>   
> +	/**
> +	 * @destroy: destroy schedule engine / cleanup in backend
> +	 */
> +	void	(*destroy)(struct kref *kref);
> +
>   	/**
>   	 * @kick_backend: kick backend after a request's priority has changed
>   	 */

