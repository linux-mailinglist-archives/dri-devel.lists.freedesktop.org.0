Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBEA424C0B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 05:06:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADE36E81E;
	Thu,  7 Oct 2021 03:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D456E81D;
 Thu,  7 Oct 2021 03:06:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="312360986"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="312360986"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 20:06:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="488772345"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 06 Oct 2021 20:06:46 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 6 Oct 2021 20:06:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 6 Oct 2021 20:06:45 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 6 Oct 2021 20:06:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAe0PQuJjOBurxuiBWjJmaX5kS2+SnJWzCeLmVjnP/Pv0OPYc3MP8/v8Z8G9K2gjY7PiP9Ocabr09KLY9qvXixO8ZWn5dibC/IRV8Wv55BvYX8IqzZbIs267r++hSra+z+Lz8QVbLEvZPfpdjQw9ZwTiwIK1Qnu5zXTF9ZXFXKsyZGGhtTHsauG79socf/KqqiipoG89luFpCu7mcgkgcPqjIcy6+ApuMsSqPzfEfN6qzoiI6XUP7vbaIa3ag4q7ORF+WheYwu330hsuFQzdBB9mw/wOL9tBrD6z90hM4sS5221h3Gtg3ILsjMJbXzgNYdL6HaMJMKCG4HGJ8Yq9XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ssxg3ppBF0VMO3yFy1S1KxfNUyeDAATkbifSF/9my24=;
 b=oB4lijnNlBg8P56Edtyg0RRWgmkF0hsxlPsF3PchTCyzpmHRrEoEu90FnTCrJU4yOtIWNYUWrGe8bITawqFeV8Tj/7cVLaEZieQB7iSbUVBqFyr9x9lXw0c+ysG3vZHvLrtsIVXbqWSrS8o7Kyl09CpLz10DRUXFPboTC1GbHfQ7HOy+PZ/eh80dLez3ucCPF6iz6pqZyDHPnCc/1viOntfAgDd/Epe3VCP1BOs5jKy2Pcla69VzAvEa5z8MVV6w+vyhS+b8JYAkw2x4oc8hMEdYwc0x3EMijsvSRnP8k2XNJIZvkJXRjzfz9v07y42WQPUTdJn1/j8cs8RQ9rrH4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ssxg3ppBF0VMO3yFy1S1KxfNUyeDAATkbifSF/9my24=;
 b=aGGbMA5its5hWcRUXfr/3blNv3QjPdrLanVNqLb75wgH/D9q+a1sQJSrHgIM8ekKlQgFJKIwvihCcectYxVd6QaOMPPJwtkDWWsN8a0ONzxYHBwkhrmlEFK6PgJrr2zpLwBu9gcdVhWj+ktnqfHQ/znq7NIqPsivdQqNoG5lYeM=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5633.namprd11.prod.outlook.com (2603:10b6:303:13c::16)
 by CO6PR11MB5603.namprd11.prod.outlook.com (2603:10b6:5:35c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 03:06:43 +0000
Received: from CO6PR11MB5633.namprd11.prod.outlook.com
 ([fe80::e577:c555:e1c:23e4]) by CO6PR11MB5633.namprd11.prod.outlook.com
 ([fe80::e577:c555:e1c:23e4%6]) with mapi id 15.20.4587.019; Thu, 7 Oct 2021
 03:06:43 +0000
Subject: Re: [PATCH 01/26] drm/i915/guc: Move GuC guc_id allocation under
 submission state sub-struct
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-2-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <019f1cca-a971-f9ee-4eec-6450572ae580@intel.com>
Date: Wed, 6 Oct 2021 20:06:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211004220637.14746-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR12CA0052.namprd12.prod.outlook.com
 (2603:10b6:300:103::14) To CO6PR11MB5633.namprd11.prod.outlook.com
 (2603:10b6:303:13c::16)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MWHPR12CA0052.namprd12.prod.outlook.com (2603:10b6:300:103::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Thu, 7 Oct 2021 03:06:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d52f0a59-f2d4-478f-9e56-08d9893f7dc7
X-MS-TrafficTypeDiagnostic: CO6PR11MB5603:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB56031F7F311794D6027FC93ABDB19@CO6PR11MB5603.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ff6Z55JNMZBt3br+gPTTnFyyeTdVlfeJ1QCq8Y8p0L+nJTHLKlMkVot4IAK/qFoCD/xHodCq+sJQ3DpjwaB+oWS3MuK3L5neDUiETTTF0uta83lSiswv3RZxyxacEujI1/TmJ7max5gnaL3Di0BzsyIjhkmkpxybIgyIfBUO2idGNyrG1M19QdbbVk5rgNTfUJIItZL/jat92rfI02+oXA1h/mE4vRrJwLrZH4qbNkKP1oMk3cHtL8XpexB2qUuzhDtNG0hF1yXh0ibBiGDJFUN6nkqW68KNc8Mva2C0Y5x56GHXXHlMcb/daWaHISTAd8uffgLeB8aw7MuFTeUMukbnyjDXJJJrADA2A1WMV0RbUVkJyskncyyyaI9p5NSUCBUYQ8EQY2+CybrmyPAR+5j+xqTTUfZ8UyjvA6OetPS8XXjRVBuIGn89BTHGzAVqm6OIFiWAVgiPu5Gf5NJSIKC7oOYrZiZ8MS40YTy3JRFFfKPZvipbiFq7/n8dRkA08GDQgxeN2/feqKsV5naXylcM+L9N0YwAq1Yherkxt8VTs6IwKgabs9KvUS94kCOrw8zLJndR7nH2InBivEDAWcRHtpAkediz2zuy/vmGy+/B4CVed02T3LxomZbEflkEiTT5cI5OB5BtnvGIU88aYu6uFa0nkPyaYSD2yZmEynuMVlJT4EfDEqAyFfT3EynNcLJnEbeS3SSquzU9YtGA2zHNboAkwEKjKcq1Mg2Vfit5+WiKM3XmJQkUtV7WnkFv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5633.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(107886003)(66946007)(31696002)(66476007)(66556008)(31686004)(16576012)(36756003)(4326008)(86362001)(2906002)(2616005)(956004)(26005)(316002)(186003)(450100002)(5660300002)(6486002)(83380400001)(508600001)(8936002)(8676002)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1o0QXJPenFqWVU4OUQvQjYzajNKYTc1aTQzTGp3SVNLR240RUtNdnpXTFlz?=
 =?utf-8?B?blg3WnhPcEZKWm5BNUp6TnJUckVJZ3haY0U0U3pzdjMzRGQvV21ldW9kRHBr?=
 =?utf-8?B?OUVvckNGL0EyQXJJM0cvcTdsMWFIbFJRTEFsWkJkQnhpd0dqbzMxdnlRclZ0?=
 =?utf-8?B?YmhOamRzcjhzbVVuODkyVzBVdll2bU01L3c2YVlSSnRFQVhFZlVqSTZqTU9j?=
 =?utf-8?B?VCtQK0xKWEFnWUlLTTI0WWVuSGh2dUtNN2E3K1o3OXpzcU9DMndJcDlHRThP?=
 =?utf-8?B?UG5peEJSSEFjczFMUmMycDhYMThWMnkzUGJQTVU4VXl0ckxXMmRvZmdnZ0Qx?=
 =?utf-8?B?bkNUNFo0cTBYMjRBTG9ZLzBHb20yODFmalN6UGtTNWtmNm45K3NHYnFsaUlX?=
 =?utf-8?B?YzBUeGVYckVTdm9kYUJ2NkZ3ZWlNQ0s0ZGJMa242NXQvS2VQNU9PdzZsNjBu?=
 =?utf-8?B?QUVCNUt2RFdZS0JwMUxnbHRyd1ZJR0RpajhUM3VlNW9OT1doWWFySEdBM1Mz?=
 =?utf-8?B?UDRMcU5WbVd1UHhzaGQwRkJyOWd5THZqbUNzYWtHajdZSmRBQktuSGJmcEs1?=
 =?utf-8?B?Tnh5djMvYm1RSXZkMjV3ODU1OWRXUlpTLzZXTkRrQVdnejVDbE9FeVpsbE9P?=
 =?utf-8?B?bkxNY0IwTE14SWFlR0tUUGFxQjc2NHBxQUlaSHp2dGxTRVNVSmszLzdIYWF6?=
 =?utf-8?B?T2NxNlZqM0pNQWpGVVFqcjhRTytaejdLTTE2UVpMLzFRek5Mc3pwOENLa0RP?=
 =?utf-8?B?VkNBK3g0NkYveHMxOCtzSnJVMXJTY0FuTHBSOGVsc1k3dUlBNERoLzZvOWto?=
 =?utf-8?B?Y2FHcXYzUWhpRitEMElOVkdEMkQ5ODlzYXowUThDd2xFTzdINktNbjRwQ3p5?=
 =?utf-8?B?MHM5dXFFWTNtY094ajlnTWhMcEw5QVExaUcwdHFTRUhUU0htWlh1OEIwS1RZ?=
 =?utf-8?B?ZEF3VEk5UlRDWUlPUy84RHo2QWhrc0s1eG1RZkw3NGp1NC9mSGVlUGVWbUlO?=
 =?utf-8?B?ZlVxL2xrUWZUN2tuU0RFSTV2YlRUVHpsTzl2cUh5aXJ1ai9DNUZ6Z1FtUWV1?=
 =?utf-8?B?MkdpSk9iSDJNNEJoU21VWCt6ZXp4NTJCWVFkanBIUlMvZEdRK0Jyc3pNZTQr?=
 =?utf-8?B?Rm9GOS83aU9oWFo1U1ppL0kzM3hYdW9LSzRmbXNieE1pTEhLWEUydXB4MDUw?=
 =?utf-8?B?LzVHQ0taS0pHQVdPaEFmT1NGNU0xQlVKNVBPSGE4Y2JjMjFCR3ZlcXJHc1pJ?=
 =?utf-8?B?VkRsUisvV2d2QWdkbjJkd1NmbmkzVytPeVlXR3NwMzZXQ2hUQlhlUkwzQTZC?=
 =?utf-8?B?Z0NGYkdHMEVLTTE5SjMrU2p1Zm1kRWFFVk1ORm42WCsxOHdXSzlab2pmZENR?=
 =?utf-8?B?anFva05wVjRIT3Y4NjhRSXpVS0NmV2pIL2d0blZUM2djKzRyWmEwdWRWTzBI?=
 =?utf-8?B?OG5RMGxTS29Wb3ZkRHl6cnc1ZXpNdjZnOGU0WEpjaW92RWlXWW9tQ1QvMCt2?=
 =?utf-8?B?QitsbnhWUmpjb00wZ29NejhKT2dZTjBEVHowdHovUDNqSXBDRHdsZjUrdXNI?=
 =?utf-8?B?SlJHdUQ3R2VGTnJkSGEwMWl0cFNrMUtPVU82eUwvOUsrUDNiMkkrRVNjQ25v?=
 =?utf-8?B?cE9PNVZyWCtvM1RZeXNNaFR5ZEpLNEw2MjNFYklyUndWa0VTVEJzUUQxeWV6?=
 =?utf-8?B?SUx3NDN3cEhlQm1ZbGk3OG1rdldTTHB5L1djVC9za2QrbTZYWHowQlpkMC9P?=
 =?utf-8?Q?EGJZh50nBBASKIwoN0SmzaeDpRdAJHa57cJkORh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d52f0a59-f2d4-478f-9e56-08d9893f7dc7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 03:06:43.6820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gYTSyLHdOXkSeJ2zHenkfzynEELUogmckvvBaHPcp8oz2GugYKUtv7iXinf0+8zrebbPjuPh+AlZ5ovOfHMx7COZs829gXvkLYbM3zfioNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5603
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

On 10/4/2021 15:06, Matthew Brost wrote:
> Move guc_id allocation under submission state sub-struct as a future
> patch will reuse the spin lock as a global submission state lock. Moving
> this into sub-struct makes ownership of fields / lock clear.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context_types.h |  6 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        | 26 +++++----
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 56 ++++++++++---------
>   3 files changed, 47 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 12252c411159..e7e3984aab78 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -197,18 +197,18 @@ struct intel_context {
>   	struct {
>   		/**
>   		 * @id: handle which is used to uniquely identify this context
> -		 * with the GuC, protected by guc->contexts_lock
> +		 * with the GuC, protected by guc->submission_state.lock
>   		 */
>   		u16 id;
>   		/**
>   		 * @ref: the number of references to the guc_id, when
>   		 * transitioning in and out of zero protected by
> -		 * guc->contexts_lock
> +		 * guc->submission_state.lock
>   		 */
>   		atomic_t ref;
>   		/**
>   		 * @link: in guc->guc_id_list when the guc_id has no refs but is
> -		 * still valid, protected by guc->contexts_lock
> +		 * still valid, protected by guc->submission_state.lock
>   		 */
>   		struct list_head link;
>   	} guc_id;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 5dd174babf7a..65b5e8eeef96 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -70,17 +70,21 @@ struct intel_guc {
>   		void (*disable)(struct intel_guc *guc);
>   	} interrupts;
>   
> -	/**
> -	 * @contexts_lock: protects guc_ids, guc_id_list, ce->guc_id.id, and
> -	 * ce->guc_id.ref when transitioning in and out of zero
> -	 */
> -	spinlock_t contexts_lock;
> -	/** @guc_ids: used to allocate unique ce->guc_id.id values */
> -	struct ida guc_ids;
> -	/**
> -	 * @guc_id_list: list of intel_context with valid guc_ids but no refs
> -	 */
> -	struct list_head guc_id_list;
> +	struct {
> +		/**
> +		 * @lock: protects everything in submission_state
> +		 */
> +		spinlock_t lock;
The old version also mentioned 'ce->guc_id.ref'. Should this not also 
mention that transition? Or was the old comment inaccurate. I'm not 
seeing any actual behaviour changes in the patch.


> +		/**
> +		 * @guc_ids: used to allocate new guc_ids
> +		 */
> +		struct ida guc_ids;
> +		/**
> +		 * @guc_id_list: list of intel_context with valid guc_ids but no
> +		 * refs
> +		 */
> +		struct list_head guc_id_list;
> +	} submission_state;
>   
>   	/**
>   	 * @submission_supported: tracks whether we support GuC submission on
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index ba0de35f6323..ad5c18119d92 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -68,16 +68,16 @@
>    * fence is used to stall all requests associated with this guc_id until the
>    * corresponding G2H returns indicating the guc_id has been deregistered.
>    *
> - * guc_ids:
> + * submission_state.guc_ids:
>    * Unique number associated with private GuC context data passed in during
>    * context registration / submission / deregistration. 64k available. Simple ida
>    * is used for allocation.
>    *
> - * Stealing guc_ids:
> - * If no guc_ids are available they can be stolen from another context at
> - * request creation time if that context is unpinned. If a guc_id can't be found
> - * we punt this problem to the user as we believe this is near impossible to hit
> - * during normal use cases.
> + * Stealing submission_state.guc_ids:
> + * If no submission_state.guc_ids are available they can be stolen from another
I would abbreviate this instance as well, submission_state.guc_id is 
quite the mouthful. Unless this somehow magically links back to the 
structure entry in the kerneldoc output?

John.

> + * context at request creation time if that context is unpinned. If a guc_id
> + * can't be found we punt this problem to the user as we believe this is near
> + * impossible to hit during normal use cases.
>    *
>    * Locking:
>    * In the GuC submission code we have 3 basic spin locks which protect
> @@ -89,7 +89,7 @@
>    * sched_engine can be submitting at a time. Currently only one sched_engine is
>    * used for all of GuC submission but that could change in the future.
>    *
> - * guc->contexts_lock
> + * guc->submission_state.lock
>    * Protects guc_id allocation for the given GuC, i.e. only one context can be
>    * doing guc_id allocation operations at a time for each GuC in the system.
>    *
> @@ -103,7 +103,7 @@
>    *
>    * Lock ordering rules:
>    * sched_engine->lock -> ce->guc_state.lock
> - * guc->contexts_lock -> ce->guc_state.lock
> + * guc->submission_state.lock -> ce->guc_state.lock
>    *
>    * Reset races:
>    * When a full GT reset is triggered it is assumed that some G2H responses to
> @@ -1148,9 +1148,9 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   
>   	xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
>   
> -	spin_lock_init(&guc->contexts_lock);
> -	INIT_LIST_HEAD(&guc->guc_id_list);
> -	ida_init(&guc->guc_ids);
> +	spin_lock_init(&guc->submission_state.lock);
> +	INIT_LIST_HEAD(&guc->submission_state.guc_id_list);
> +	ida_init(&guc->submission_state.guc_ids);
>   
>   	return 0;
>   }
> @@ -1215,7 +1215,7 @@ static void guc_submit_request(struct i915_request *rq)
>   
>   static int new_guc_id(struct intel_guc *guc)
>   {
> -	return ida_simple_get(&guc->guc_ids, 0,
> +	return ida_simple_get(&guc->submission_state.guc_ids, 0,
>   			      GUC_MAX_LRC_DESCRIPTORS, GFP_KERNEL |
>   			      __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>   }
> @@ -1223,7 +1223,8 @@ static int new_guc_id(struct intel_guc *guc)
>   static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   {
>   	if (!context_guc_id_invalid(ce)) {
> -		ida_simple_remove(&guc->guc_ids, ce->guc_id.id);
> +		ida_simple_remove(&guc->submission_state.guc_ids,
> +				  ce->guc_id.id);
>   		reset_lrc_desc(guc, ce->guc_id.id);
>   		set_context_guc_id_invalid(ce);
>   	}
> @@ -1235,9 +1236,9 @@ static void release_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   {
>   	unsigned long flags;
>   
> -	spin_lock_irqsave(&guc->contexts_lock, flags);
> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
>   	__release_guc_id(guc, ce);
> -	spin_unlock_irqrestore(&guc->contexts_lock, flags);
> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>   }
>   
>   static int steal_guc_id(struct intel_guc *guc)
> @@ -1245,10 +1246,10 @@ static int steal_guc_id(struct intel_guc *guc)
>   	struct intel_context *ce;
>   	int guc_id;
>   
> -	lockdep_assert_held(&guc->contexts_lock);
> +	lockdep_assert_held(&guc->submission_state.lock);
>   
> -	if (!list_empty(&guc->guc_id_list)) {
> -		ce = list_first_entry(&guc->guc_id_list,
> +	if (!list_empty(&guc->submission_state.guc_id_list)) {
> +		ce = list_first_entry(&guc->submission_state.guc_id_list,
>   				      struct intel_context,
>   				      guc_id.link);
>   
> @@ -1273,7 +1274,7 @@ static int assign_guc_id(struct intel_guc *guc, u16 *out)
>   {
>   	int ret;
>   
> -	lockdep_assert_held(&guc->contexts_lock);
> +	lockdep_assert_held(&guc->submission_state.lock);
>   
>   	ret = new_guc_id(guc);
>   	if (unlikely(ret < 0)) {
> @@ -1295,7 +1296,7 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   	GEM_BUG_ON(atomic_read(&ce->guc_id.ref));
>   
>   try_again:
> -	spin_lock_irqsave(&guc->contexts_lock, flags);
> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
>   
>   	might_lock(&ce->guc_state.lock);
>   
> @@ -1310,7 +1311,7 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   	atomic_inc(&ce->guc_id.ref);
>   
>   out_unlock:
> -	spin_unlock_irqrestore(&guc->contexts_lock, flags);
> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>   
>   	/*
>   	 * -EAGAIN indicates no guc_id are available, let's retire any
> @@ -1346,11 +1347,12 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   	if (unlikely(context_guc_id_invalid(ce)))
>   		return;
>   
> -	spin_lock_irqsave(&guc->contexts_lock, flags);
> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
>   	if (!context_guc_id_invalid(ce) && list_empty(&ce->guc_id.link) &&
>   	    !atomic_read(&ce->guc_id.ref))
> -		list_add_tail(&ce->guc_id.link, &guc->guc_id_list);
> -	spin_unlock_irqrestore(&guc->contexts_lock, flags);
> +		list_add_tail(&ce->guc_id.link,
> +			      &guc->submission_state.guc_id_list);
> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>   }
>   
>   static int __guc_action_register_context(struct intel_guc *guc,
> @@ -1921,16 +1923,16 @@ static void guc_context_destroy(struct kref *kref)
>   	 * returns indicating this context has been deregistered the guc_id is
>   	 * returned to the pool of available guc_id.
>   	 */
> -	spin_lock_irqsave(&guc->contexts_lock, flags);
> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
>   	if (context_guc_id_invalid(ce)) {
> -		spin_unlock_irqrestore(&guc->contexts_lock, flags);
> +		spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>   		__guc_context_destroy(ce);
>   		return;
>   	}
>   
>   	if (!list_empty(&ce->guc_id.link))
>   		list_del_init(&ce->guc_id.link);
> -	spin_unlock_irqrestore(&guc->contexts_lock, flags);
> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>   
>   	/* Seal race with Reset */
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);

