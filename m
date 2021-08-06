Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E48A3E2F67
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 20:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6786EC0C;
	Fri,  6 Aug 2021 18:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D63A6EC0C;
 Fri,  6 Aug 2021 18:43:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10068"; a="194696634"
X-IronPort-AV: E=Sophos;i="5.84,301,1620716400"; d="scan'208";a="194696634"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2021 11:43:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,301,1620716400"; d="scan'208";a="420807184"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 06 Aug 2021 11:43:44 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 6 Aug 2021 11:43:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 6 Aug 2021 11:43:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 6 Aug 2021 11:43:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mi4dp8lRTTB+fqQ6+Pvf+J7LlxXZTQXxPQNkr84pNLyta2ZOVguwQFk25uLoNJWGdKGaTr3pxYJybEV+Twc9BdUJ3NlxJ9H2i51n7SguaCU+QaKPkOtEP0Imal+lh9DDU3v4Yqk0rcOxmJpA4Wc3V4Zwn8AKdflAPo3rKTUTKAnWDVr8G6qGrdX7aMuKX7VtpVzT/beKGnKoetcI44nkNJ5Z7zee34+lggHhhH4eK4ybiK5wSyhBN9cILjdHPiwrqL5Ok4/r7l2jNcnxuMc0EHWogBLapIfUea2bRyvTnNvc5w+vDsjXg7sJLXBOA+eTITqM6kzwd2pExoMAKaNl6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7un77/976kkW39xkyuGzLedLUEV4spi8M7Thr4dGf0=;
 b=NsRVPd1pRsIXv5oDTPEAsgBgu65RdAv971alRt2/ckY2Wbby5iMcoMRnL9ynsYzLPzx5brx1XkIixsRrRQUACgCT6RrgQ2hFkQPVrDCe5KVNloIpKc9auj3n+apU1z1H/EGuRDBTGoTgCEob+ZDF8BHaeMOC9rOr8qRQVuM/WfzQzphLjpyBawPIZ69TqCWC3izvLJBkIwG9bn4E4NBunEdEgfFl9IH2d0DrTSNYan0Ta2xrWzUY1quY2eyAvQCrzLxSHHVMPACacHtLIG9u+I/zhPDfaKiWiHsMXkmnHTPgWOQB2OO3PtOElI4SxpLcwOJZ0afpZhT6T+SZuORF5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7un77/976kkW39xkyuGzLedLUEV4spi8M7Thr4dGf0=;
 b=cLusnWh3yDVSq31MaraJHe4e5xNisqc57cAGo4t5u/RN3hNtlsJP7rq9cL+BGUNnKEcPX2i/BNao0GkffY+oteIFUbjIdL/SqXDMeqk6tXZZrKVW8oa4rQ4V5L2EcnkrUP7pqPksMzAtZo8ruo57mhyfIHXzpKDeMxj39bEnhJc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5657.namprd11.prod.outlook.com (2603:10b6:510:ee::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Fri, 6 Aug
 2021 18:43:42 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%9]) with mapi id 15.20.4373.026; Fri, 6 Aug 2021
 18:43:42 +0000
Subject: Re: [Intel-gfx] [PATCH 2/4] drm/i915/guc: put all guc objects in lmem
 when available
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210803051121.72017-1-matthew.brost@intel.com>
 <20210803051121.72017-3-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <28aafcd4-19b7-05f4-5054-59a76043b342@intel.com>
Date: Fri, 6 Aug 2021 11:43:39 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210803051121.72017-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: BY3PR10CA0015.namprd10.prod.outlook.com
 (2603:10b6:a03:255::20) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 BY3PR10CA0015.namprd10.prod.outlook.com (2603:10b6:a03:255::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Fri, 6 Aug 2021 18:43:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b03644a5-89b7-4b2f-7939-08d9590a1ce2
X-MS-TrafficTypeDiagnostic: PH0PR11MB5657:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB565746CE2287DEF34DCFB22BBDF39@PH0PR11MB5657.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3z5BYkXqzXykqeXOYZ7E10qzifSBhjTN9gw+o/gVs54vDt/3aDlTiuAaRa7lKsYa4kTHhZ3U0ONzT9y7XMLWBCFnJvW/vz7u9hEHZ4Ol+RQlSKf+hWA8h030vfuF9dxZeEgCxgvMRBtA2S4bUcBq+8C9xfG6IVtFNR+pMk/SPxj1ODf7p03YUy2z9570xIo+IYJHdyFzZE1ZQp0bSrCBXjEbxigAwxjjGsozTEPpzjXTXroH8ahHfwdQS1cJB841Srsw+c8cO0a+SFxnQcJDnEwDzKj7wJ0CtJxRwHs5ub2BrTcKeWVBTuXpCttClimZxvCcX5KYsGjVVxerq4U2J8tVgI1OTuHIMVBqb7TfHef7RK99bi3/W8+uKhtpkFD1Bhw5XEKYFX7GHLCiaksHCjqZs5/pwGH+crmfw7+pDVB1y9fU3FfKClSeWRhlSk24rfpeEWYneY5EagRjbS9imtmk830Zq6/CFHsYZgtYmgT+ldRoNabWIfMoVk00N8JWMioaiTv2qMZEoO4sbmU31yiMsvPz3h+QTcIlhRPmTIUQxvZ5TOo+PquNEyiWM2W2zA0SooucA0EbEeqgE4gWwoiouXLPBFW8RrvRd1EY9zDY9i1IU5Ykn4DGS+/H9qTqxsaRUWXvtPVGuG5SC1B+372gjXxQDHm1IRtWHIjMXiBMCWJaiT+q/NJx4MkuY9uA/TpetVpOjhHJeX7jNEIiJzIzNkxfdufh9I72GQptexXxhq/tTunICPusXG1hopiV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16576012)(26005)(316002)(2906002)(2616005)(956004)(8676002)(53546011)(8936002)(186003)(66946007)(450100002)(66556008)(66476007)(508600001)(5660300002)(6486002)(31686004)(83380400001)(31696002)(86362001)(38100700002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmFRd1pLMDFGWjNXa3dwY2VBYWdRemM0YzJMUmUyRkFiRDFkYWsyNWFuSzND?=
 =?utf-8?B?eVppeDB2MXFTcGN3SkZuMFVza0pxZXplSWhoSUljM0JQYXNwN0pLK2E2STl2?=
 =?utf-8?B?c1IxcTVLR3dCUFc2VzNIRHRYRW1iYzZnNlVLc2tCa1RhVHJ4UEJlRzdEeUlu?=
 =?utf-8?B?bkxSQlNhaTRpRGRhUGNxZllPU2hvN0pGbzM4dU9SeWNYaWhIZUtFeUJLRnJy?=
 =?utf-8?B?N2J0TnFvZ2RZUTJoWWlORGF3aXVGMS9pL2FBREtCdGVZM3ZpSkZCUElFUnNm?=
 =?utf-8?B?VEFNS1lzSGxGbE9LZXZ6d2pKL0lOOEVtYXdkaXVsSzk5dVp2RkhxR0Vuajh1?=
 =?utf-8?B?ZWlDVHhGZXhBN1RXNktNRlRzOTNKVWVJcWlhUmt1NysyTjgxSEFDK2dUSlJo?=
 =?utf-8?B?OHE4aEFkZG9qMElpS0pzN3QyVWJDWm9GeTM4QnRYSGYwOVl6QzZSUXlOT1Y1?=
 =?utf-8?B?MnRHRWhGOUFveGF1MFVrWk5rckpGYU5RQXdCY0RYRGZnOUpLUEx1MHF1SDBh?=
 =?utf-8?B?RjY1WFMxK2swRVdLZng1dkRydHBaNTdXWmVDK1o5RHZEdDZySUFSaC9rUmVH?=
 =?utf-8?B?SFQ3ems0ZjZVWW1NbnVPYStPN2Mxa3NMZC9JejZZOHB3K3MzdVNUT3VRa2pV?=
 =?utf-8?B?YUQvTStKRFZGTi95YVFGUzlQakNtVVlqd2tKSCtDa2ZmLzZUN2NLdjc2ZkR6?=
 =?utf-8?B?ZTkwVHRaOWEwWENnWXlQK3UwMUZvUmg0Z3IzL094ZXZmODdvc1NHeHdxOGRo?=
 =?utf-8?B?RktoRGRtYVNHQkMxWCtaVmtjVjJCdVhnY2hRK0p6WWJ6UWR2QkU5cTN5MVJ5?=
 =?utf-8?B?bUYrNDZtVy9XNlpNNVJwcHQ5UkdBU0ZTTFlQZTlVZDR3Y051WVY0OW9uUVd5?=
 =?utf-8?B?enRXUHRyVGx2blNBRFlIaUNaMG1LZXlVUjhoU2FoMnM2ME1FSmlPOWtuNzUv?=
 =?utf-8?B?SDFXVjJTd0V0dUdFbXYrNGpBMjNZcnpqR0ZzRDMycUZLUDlNVHpwckIvNTF2?=
 =?utf-8?B?VTNRNjFPRlFXUXlEOU9Rd3laZExsZ29LcjM0UmNMOXF6YndGeW0wWS83azEx?=
 =?utf-8?B?ZjVFREM3eFpyd2JvN1VJZnBsMjFSa3N1NFpDVERYc0hzR2dTZ1NHRFFISDlw?=
 =?utf-8?B?Qk13NHZ0WlhKSkZXUjhyako5VUZaZ3FyTGxSdVFmMDRzL2IrcjBqeXlYZTV0?=
 =?utf-8?B?S1RNcEdqRWZydC96NS9FS0RYa3h1ZEUyTnNhYUNFWTB2Q09PTW9HbStJYW1O?=
 =?utf-8?B?YTNpOE5qS3g2MnFhejM1TkFvMjlDbmhrV2J4SkpieGFCaHRsWmFCUXdoSWg2?=
 =?utf-8?B?WUlSZmtYMnQ3NlJJblRvK3VwZ3Y0S3VSMFB5UEN3YmloYkc3MGVYYzV3ak9i?=
 =?utf-8?B?UVBGYXhjMXRhTDM5MjJqdklscWZXMUhHalkwODczYzJxWUVSVlp5WDFEYVMw?=
 =?utf-8?B?ditnNGxreC9kTmxuZWZmS1BPaVg1SlllNWtUOVFjUUg0bkNyaEl3K2MwaUtk?=
 =?utf-8?B?VzdlNXFCeGk4cS9yS01jcE9FYTNIcHZ3M2JKaGZrWVdSeVk5YklobThRbFVV?=
 =?utf-8?B?cUpHZlZSdThDczF6aW9STzZ4bkdHN2JUQlFsM2w3NjVsUktMRWpCL09NNlZw?=
 =?utf-8?B?VDEzWXZhZjExMVMwY0ROYllPY2h6NDQ3T0FuWkRqZ1JoTFBoK2RIQVNQZ09u?=
 =?utf-8?B?eVJiYTlaVCtoeGRZbFFJZHJRaUdBT0FYNnJGZm9LaUFPbHR1NzZoeFhNTUNq?=
 =?utf-8?Q?/RDJzpGfAcF5G5aFKSczY47bZjdq/u+R1F9Krne?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b03644a5-89b7-4b2f-7939-08d9590a1ce2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 18:43:42.0766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sc7ah4/HiFm1MPFZhLCZi92nZ7WUzubSAnyKPuVvAGsKRXSS9HfW6DhoqPagD4JpbAdJpBRS8usLDs6gjQSdKtRRoS30KHOcv4g88XhTDko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5657
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

On 8/2/2021 22:11, Matthew Brost wrote:
> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> The firmware binary has to be loaded from lmem and the recommendation is
> to put all other objects in there as well. Note that we don't fall back
> to system memory if the allocation in lmem fails because all objects are
> allocated during driver load and if we have issues with lmem at that point
> something is seriously wrong with the system, so no point in trying to
> handle it.
>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Radoslaw Szwichtenberg <radoslaw.szwichtenberg@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_lmem.c  | 26 ++++++++
>   drivers/gpu/drm/i915/gem/i915_gem_lmem.h  |  4 ++
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c    |  9 ++-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 11 +++-
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 14 ++++-
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 75 +++++++++++++++++++++--
>   6 files changed, 127 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> index eb345305dc52..034226c5d4d0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> @@ -103,6 +103,32 @@ __i915_gem_object_create_lmem_with_ps(struct drm_i915_private *i915,
>   					     size, page_size, flags);
>   }
>   
> +struct drm_i915_gem_object *
> +i915_gem_object_create_lmem_from_data(struct drm_i915_private *i915,
> +				      const void *data, size_t size)
> +{
> +	struct drm_i915_gem_object *obj;
> +	void *map;
> +
> +	obj = i915_gem_object_create_lmem(i915,
> +					  round_up(size, PAGE_SIZE),
> +					  I915_BO_ALLOC_CONTIGUOUS);
> +	if (IS_ERR(obj))
> +		return obj;
> +
> +	map = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
> +	if (IS_ERR(map)) {
> +		i915_gem_object_put(obj);
> +		return map;
> +	}
> +
> +	memcpy(map, data, size);
> +
> +	i915_gem_object_unpin_map(obj);
> +
> +	return obj;
> +}
> +
>   struct drm_i915_gem_object *
>   i915_gem_object_create_lmem(struct drm_i915_private *i915,
>   			    resource_size_t size,
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.h b/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
> index 4ee81fc66302..1b88ea13435c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
> @@ -23,6 +23,10 @@ bool i915_gem_object_is_lmem(struct drm_i915_gem_object *obj);
>   
>   bool __i915_gem_object_is_lmem(struct drm_i915_gem_object *obj);
>   
> +struct drm_i915_gem_object *
> +i915_gem_object_create_lmem_from_data(struct drm_i915_private *i915,
> +				      const void *data, size_t size);
> +
>   struct drm_i915_gem_object *
>   __i915_gem_object_create_lmem_with_ps(struct drm_i915_private *i915,
>   				      resource_size_t size,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 979128e28372..55160d3e401a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -3,6 +3,7 @@
>    * Copyright © 2014-2019 Intel Corporation
>    */
>   
> +#include "gem/i915_gem_lmem.h"
>   #include "gt/intel_gt.h"
>   #include "gt/intel_gt_irq.h"
>   #include "gt/intel_gt_pm_irq.h"
> @@ -630,7 +631,13 @@ struct i915_vma *intel_guc_allocate_vma(struct intel_guc *guc, u32 size)
>   	u64 flags;
>   	int ret;
>   
> -	obj = i915_gem_object_create_shmem(gt->i915, size);
> +	if (HAS_LMEM(gt->i915))
> +		obj = i915_gem_object_create_lmem(gt->i915, size,
> +						  I915_BO_ALLOC_CPU_CLEAR |
> +						  I915_BO_ALLOC_CONTIGUOUS);
> +	else
> +		obj = i915_gem_object_create_shmem(gt->i915, size);
> +
>   	if (IS_ERR(obj))
>   		return ERR_CAST(obj);
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> index 76fe766ad1bc..962be0c12208 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> @@ -41,7 +41,7 @@ static void guc_prepare_xfer(struct intel_uncore *uncore)
>   }
>   
>   /* Copy RSA signature from the fw image to HW for verification */
> -static void guc_xfer_rsa(struct intel_uc_fw *guc_fw,
> +static int guc_xfer_rsa(struct intel_uc_fw *guc_fw,
>   			 struct intel_uncore *uncore)
>   {
>   	u32 rsa[UOS_RSA_SCRATCH_COUNT];
> @@ -49,10 +49,13 @@ static void guc_xfer_rsa(struct intel_uc_fw *guc_fw,
>   	int i;
>   
>   	copied = intel_uc_fw_copy_rsa(guc_fw, rsa, sizeof(rsa));
> -	GEM_BUG_ON(copied < sizeof(rsa));
> +	if (copied < sizeof(rsa))
> +		return -ENOMEM;
>   
>   	for (i = 0; i < UOS_RSA_SCRATCH_COUNT; i++)
>   		intel_uncore_write(uncore, UOS_RSA_SCRATCH(i), rsa[i]);
> +
> +	return 0;
>   }
>   
>   /*
> @@ -141,7 +144,9 @@ int intel_guc_fw_upload(struct intel_guc *guc)
>   	 * by the DMA engine in one operation, whereas the RSA signature is
>   	 * loaded via MMIO.
>   	 */
> -	guc_xfer_rsa(&guc->fw, uncore);
> +	ret = guc_xfer_rsa(&guc->fw, uncore);
> +	if (ret)
> +		goto out;
>   
>   	/*
>   	 * Current uCode expects the code to be loaded at 8k; locations below
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index fc5387b410a2..ff4b6869b80b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -87,17 +87,25 @@ static int intel_huc_rsa_data_create(struct intel_huc *huc)
>   									vma->obj, true));
>   	if (IS_ERR(vaddr)) {
>   		i915_vma_unpin_and_release(&vma, 0);
> -		return PTR_ERR(vaddr);
> +		err = PTR_ERR(vaddr);
> +		goto unpin_out;
>   	}
>   
>   	copied = intel_uc_fw_copy_rsa(&huc->fw, vaddr, vma->size);
> -	GEM_BUG_ON(copied < huc->fw.rsa_size);
> -
>   	i915_gem_object_unpin_map(vma->obj);
>   
> +	if (copied < huc->fw.rsa_size) {
> +		err = -ENOMEM;
> +		goto unpin_out;
> +	}
> +
>   	huc->rsa_data = vma;
>   
>   	return 0;
> +
> +unpin_out:
> +	i915_vma_unpin_and_release(&vma, 0);
> +	return err;
>   }
>   
>   static void intel_huc_rsa_data_destroy(struct intel_huc *huc)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index f632dbd32b42..f8cb00ffb506 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -7,6 +7,7 @@
>   #include <linux/firmware.h>
>   #include <drm/drm_print.h>
>   
> +#include "gem/i915_gem_lmem.h"
>   #include "intel_uc_fw.h"
>   #include "intel_uc_fw_abi.h"
>   #include "i915_drv.h"
> @@ -370,7 +371,11 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   	if (uc_fw->type == INTEL_UC_FW_TYPE_GUC)
>   		uc_fw->private_data_size = css->private_data_size;
>   
> -	obj = i915_gem_object_create_shmem_from_data(i915, fw->data, fw->size);
> +	if (HAS_LMEM(i915))
> +		obj = i915_gem_object_create_lmem_from_data(i915, fw->data, fw->size);
> +	else
> +		obj = i915_gem_object_create_shmem_from_data(i915, fw->data, fw->size);
> +
>   	if (IS_ERR(obj)) {
>   		err = PTR_ERR(obj);
>   		goto fail;
> @@ -414,6 +419,7 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
>   	struct drm_i915_gem_object *obj = uc_fw->obj;
>   	struct i915_ggtt *ggtt = __uc_fw_to_gt(uc_fw)->ggtt;
>   	struct i915_vma *dummy = &uc_fw->dummy;
> +	u32 pte_flags = 0;
>   
>   	dummy->node.start = uc_fw_ggtt_offset(uc_fw);
>   	dummy->node.size = obj->base.size;
> @@ -424,9 +430,13 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
>   	GEM_BUG_ON(dummy->node.size > ggtt->uc_fw.size);
>   
>   	/* uc_fw->obj cache domains were not controlled across suspend */
> -	drm_clflush_sg(dummy->pages);
> +	if (i915_gem_object_has_struct_page(obj))
> +		drm_clflush_sg(dummy->pages);
> +
> +	if (i915_gem_object_is_lmem(obj))
> +		pte_flags |= PTE_LM;
>   
> -	ggtt->vm.insert_entries(&ggtt->vm, dummy, I915_CACHE_NONE, 0);
> +	ggtt->vm.insert_entries(&ggtt->vm, dummy, I915_CACHE_NONE, pte_flags);
>   }
>   
>   static void uc_fw_unbind_ggtt(struct intel_uc_fw *uc_fw)
> @@ -585,13 +595,68 @@ void intel_uc_fw_cleanup_fetch(struct intel_uc_fw *uc_fw)
>    */
>   size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len)
>   {
> -	struct sg_table *pages = uc_fw->obj->mm.pages;
> +	struct intel_memory_region *mr = uc_fw->obj->mm.region;
>   	u32 size = min_t(u32, uc_fw->rsa_size, max_len);
>   	u32 offset = sizeof(struct uc_css_header) + uc_fw->ucode_size;
> +	struct sgt_iter iter;
> +	size_t count = 0;
> +	int idx;
>   
> +	/* Called during reset handling, must be atomic [no fs_reclaim] */
>   	GEM_BUG_ON(!intel_uc_fw_is_available(uc_fw));
>   
> -	return sg_pcopy_to_buffer(pages->sgl, pages->nents, dst, size, offset);
> +	idx = offset >> PAGE_SHIFT;
> +	offset = offset_in_page(offset);
> +	if (i915_gem_object_has_struct_page(uc_fw->obj)) {
> +		struct page *page;
> +
> +		for_each_sgt_page(page, iter, uc_fw->obj->mm.pages) {
Why can't this just use 'sg_pcopy_to_buffer' as before?

John.

> +			u32 len = min_t(u32, size, PAGE_SIZE - offset);
> +			void *vaddr;
> +
> +			if (idx > 0) {
> +				idx--;
> +				continue;
> +			}
> +
> +			vaddr = kmap_atomic(page);
> +			memcpy(dst, vaddr + offset, len);
> +			kunmap_atomic(vaddr);
> +
> +			offset = 0;
> +			dst += len;
> +			size -= len;
> +			count += len;
> +			if (!size)
> +				break;
> +		}
> +	} else {
> +		dma_addr_t addr;
> +
> +		for_each_sgt_daddr(addr, iter, uc_fw->obj->mm.pages) {
> +			u32 len = min_t(u32, size, PAGE_SIZE - offset);
> +			void __iomem *vaddr;
> +
> +			if (idx > 0) {
> +				idx--;
> +				continue;
> +			}
> +
> +			vaddr = io_mapping_map_atomic_wc(&mr->iomap,
> +							 addr - mr->region.start);
> +			memcpy_fromio(dst, vaddr + offset, len);
> +			io_mapping_unmap_atomic(vaddr);
> +
> +			offset = 0;
> +			dst += len;
> +			size -= len;
> +			count += len;
> +			if (!size)
> +				break;
> +		}
> +	}
> +
> +	return count;
>   }
>   
>   /**

