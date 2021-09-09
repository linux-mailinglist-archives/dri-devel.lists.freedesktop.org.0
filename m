Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 993CB405F47
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 00:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1E788BF3;
	Thu,  9 Sep 2021 22:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15C288BF3;
 Thu,  9 Sep 2021 22:13:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="208032939"
X-IronPort-AV: E=Sophos;i="5.85,281,1624345200"; d="scan'208";a="208032939"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 15:13:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,281,1624345200"; d="scan'208";a="470273207"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga007.jf.intel.com with ESMTP; 09 Sep 2021 15:13:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 15:13:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 9 Sep 2021 15:13:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 9 Sep 2021 15:13:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSUiJFEzU+O17NRhhCcduNuLUgH3PxrJhlEVp8AuaAK6nj4oVgo1i0PWXyIzN1N6NI/0wsyx+bw1bWC9+X6M2TYlkFoASgZW35aNy9oXwpGg7NmqJ8nBzVbDmuBBNembzZdgHgoUTQS2uSeGO3rvsZ+pRcUVU0pXAAYTL8/Lt/Rc9svxxeSEb5wllbwaQyUMuE2ONpn8Pf8uHzJyhe2GTct95w63V/kfcc7YYSq3rgZkG02QKNlwRgSMijxYBc84pJlL6YBMgmjxM25kkTrGjbxdywB3lTN2EC/IBcF279u/PZg2HaKmi4FcyFdqLpj4jZ3ABombl82716NCM+YR+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=YevHlRugXcw3xoQBhQDCqfysQ0FxQBC0zJRNSc64wWg=;
 b=Tf3zofnOu6gwvNAKDPGcFmXvbvDswnc17WGesJOWyKrk+6lVDCH9gMbGUH885TQZD1f/8bzFHUtjnH6qlpiEJR3XW7UTfBN9rIAzd5wM64YOfzpzQiz6QJbh7xx6TsHW2GrlB9fZvwld8nTTwKxJsGYcXuIn0wDtqOkNy6eE0PYUzHNa96/7A0WVdvStccrs9b0ZoypT/x7iVTJshzG7dE6kGnc0+JUqZjFLxxm0KTTYMWvYsYopdMwT8+qMRQ+n9uBRV2mEj9j61yzHyHReRmYzG0InOaOAJVzesddKeMJuCXouzUWQDFE5VKtSm/VgoIDAIDWXMH4nr5FbSfdbew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YevHlRugXcw3xoQBhQDCqfysQ0FxQBC0zJRNSc64wWg=;
 b=Fxocw684OoXRKCd7G7pP8XHMre2Vr3orgDLmBy6pwUz2RDoBOGFoNBSw248MreRPzsMXSexnWZn+Vcdu04E43Pelbqz1urb84LEKx34rr+gEEWH38LpnJngT8NDgO/PFbRHskwrVr7iURjLe0MHwcLdPg+1X7SPgm7Dn+Q4xI8k=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5580.namprd11.prod.outlook.com (2603:10b6:510:e5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Thu, 9 Sep
 2021 22:13:32 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%9]) with mapi id 15.20.4478.027; Thu, 9 Sep 2021
 22:13:32 +0000
Subject: Re: [Intel-gfx] [PATCH 02/27] drm/i915/guc: Allow flexible number of
 context ids
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-3-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <29e4e25f-0296-c096-b483-de63f01daf69@intel.com>
Date: Thu, 9 Sep 2021 15:13:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210820224446.30620-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR03CA0156.namprd03.prod.outlook.com
 (2603:10b6:303:8d::11) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MW4PR03CA0156.namprd03.prod.outlook.com (2603:10b6:303:8d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 22:13:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1e5d579-9997-4a60-866a-08d973df0f2c
X-MS-TrafficTypeDiagnostic: PH0PR11MB5580:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5580D81460D6DA254F098265BDD59@PH0PR11MB5580.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6iaOoNztvWVdiMXdq3fWB/OxEahJVyE09M0hjlEq/fIt5zrO9O4kRagfbrXEyjcHQOVo0dM++KpRsSjZ3Nw1uWBdqrdgULWeQnKp17YpiRP5Eeg0UEmk/TX0syuO1FBXIQdJ1riW1biIvP8j4sxUifojKbX501v4c+DBSXWpfmdDai981wtPJcG2IQLSJ4OngN6SQUwttuppRdr4dA/yCGti4+S6VL8T4f/o6vM2pJ4ei/SGECled+56wgUaWWVOhBe1Er7AGN5Yy6+ZRTsTq8WCyXZ7jjFUeAOWXk0gzryPw3oZJha6H7oJczK+fu9y6bHkdxZPRJG/+e28uGfB9VuQwU6Tr5wYJ2Oq2xmt6elMO3xcqPrMwougVYgGRTg2+Q2xFM9b2AqbzoGqB/GkQvpi2R8cBNIAt0pfA2Bqsjz57MrGqptI9mRXVhr1TEcvPbWwJRwpbX2fKQ//JAy2C14R6qiqSA8fndLroRVm0K23/96KJYLnRRDJAnFf4Q/aZXO2YNjuImXQwyf9q3UfEtnZB2TA1xErDtHzVNtGAtTZ491BtZb/B8PQxPHaEPmjVCugK+tLqfWUutrhTr20YqQBsHZ044VwV+ou94W2NzWFUlBkDEAri/xBx5WMlS72rRDo1FWwTNjLL+w2f75GLx1RIGFG3aKCPZHhG9dFw+gI+p1LN63XxXUKC95bqaVYxzF6dT/dC2sWGWAqe5xyd75k7YM6HYHIS93yLKObBMPQ2iFklSchXvzoCScE4mn2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(956004)(5660300002)(2616005)(38100700002)(86362001)(36756003)(16576012)(316002)(107886003)(2906002)(26005)(66556008)(31686004)(83380400001)(8936002)(31696002)(478600001)(8676002)(186003)(66476007)(53546011)(4326008)(66946007)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGQ2UWRuMXJLNitubUlTaTlhRy9RQnQvNjdrWTk5M1lxKzNhWVVhWjUzUWhN?=
 =?utf-8?B?Z25NSFo1VUZzUCtPRXl2RHRRWEFSNXRydkptUlFLbnF3Ly9VYjZJK2lqK2xD?=
 =?utf-8?B?K3BPeFdJaGlvMFVOWW1wbUdpU1hVV3hnRk9iajNIYzlTL0swZ1BrS3l2MGNJ?=
 =?utf-8?B?ckVkNnphdVBCL1BBTjEvK0diVDBydWNUQWJuNW9xU2hqRnRVenJyak5Nbnlt?=
 =?utf-8?B?OWFzdmFzNkdOWHZEU3Jwb3JDT3YzZktSTWVBZEFyMEZKSXhTajFMWFJVRHpl?=
 =?utf-8?B?U3Q2aE16Zy9RSnhOSHB3SldkMlpSVTZSMHlNLzNldHhSMEx5VjNURG9NWDhF?=
 =?utf-8?B?K1RHNThQcktXN0NRTERZZmt2UFh5ZG9XWVh4UGpRNlJvTDBqb2pmODI3LzE2?=
 =?utf-8?B?YzB1NFZWbG5zWVpXTlVjaHBJWWU3R1BJOGVud2E2OGpQbHZTdzBiRVE3QXhI?=
 =?utf-8?B?NFpFd1cvYThzUnNocVo5YlozYkttSmZGN3BpeEJpZnkzNDk1RkI2WW1MclZ1?=
 =?utf-8?B?RVBTbVFWRmVHaDl3OUFyQXo2dExnWVpWeWh3dE5hQTYxQTUxVlR3ZzhwSUds?=
 =?utf-8?B?MnRsUWVKZUV5aERWd0t5YTE1K3ZlSS9RSzdCL1VOcm55S3k0Sm9MMHB2Rm9O?=
 =?utf-8?B?Um9SM1prbFRBQmJjLzVRNVdwZlhEVzl3WmQ5OWNscmV3Rmtld1R0R1FsQWVu?=
 =?utf-8?B?dit2UmMySmlQTWNVSExHWTE2OHJpU0NKZUNQWWJDSnFGRi9ZTmtabStSTW9Y?=
 =?utf-8?B?eXowdG5QUDl5L2ZVUmUzSngxMHpCdDYxZ2F2SmVFcWVySDQ2N0t3aEVQT1lN?=
 =?utf-8?B?SWk2bFZoQW5PRVphNzFqY1VoQUFVeE9RK3dvYW5naXZyYlY3RlpiR0lRSlFm?=
 =?utf-8?B?MWFvSVNPK1lCL1NnUVc4N0llZTJEVVk3OTRpbUNiYmtnMWkwVCtib0w5ZThp?=
 =?utf-8?B?a2Z0ZHJZWXI4Zi80WUR5SU4vTFAwVlErU3doSHd2MFRxK2J0cGJWNlRTT25i?=
 =?utf-8?B?WmQ1bUtJbURWbUJvOERnbnUydXJneE8vdTFHS0RGemxvSCtPVHRVOWcwSkVw?=
 =?utf-8?B?b2R4aGVKSWJlYWgwMlZ4RThGQWFQb0JqMU91NEVRdEhNQTUyazdSYVI2K0s5?=
 =?utf-8?B?eGZBS0x1ZSswYi9vczFsSWN3Z1lYNFJvQjJYRjdEOGJ2ejNCSExhY0ExSUgx?=
 =?utf-8?B?TE5Eb0oxZXZQQzl0TmVjM21OSnRwazB3ZW13aHVFNDgzR1VlSUpLbnRYVVpM?=
 =?utf-8?B?cUtJSkhubStNTHc4T2l6UlZLcU5HZHN3dFhKTzRzNXRaUWZLVlBQZGk5SWFZ?=
 =?utf-8?B?OWJ2bE01VmtSdTBsQ3RaR1puaWJLSGc1M0wrWUdRRjlYV1VqaU93L245QzI1?=
 =?utf-8?B?MFNwTjVQU2lIa2h3aGFYS3A1c0ZRZWFYVkVSRUNsTTQ1Mksvc1N4QWs4NlVE?=
 =?utf-8?B?aWZwMWk0cCtoVFF4OVlwTHBmbjFjY1VPampBMkkreXpzeHBLRTFabWxVcFRD?=
 =?utf-8?B?aHhGc3RvUWRldVhmVnBXQ1I3MFpXd2tQaTlJbmpuMFpVeWRESXlXTmZWcGMw?=
 =?utf-8?B?bjF2cFVocFlaakdPcTVJWjBvc2xwNk1ja0tHNGcrV05vL1VtVXh3YnZnaFRR?=
 =?utf-8?B?VGh6MTRpcGRvSE9YeGFzbGZ3a2R3SnJHRWhVM1BnVmxwcjVYUGVaVkVzckJY?=
 =?utf-8?B?K2JIWklKTHZQWmJuK3BqR2w0U1RKRWt2NGhQSHZjQVNPVFh1NjI0c2RNb3RW?=
 =?utf-8?Q?XcM1V/FlD5edbqdfIwAQXq8KZfMXV3rOTutkygA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e5d579-9997-4a60-866a-08d973df0f2c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 22:13:32.2100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Sewn37VPBreGrCrqM5Q6DlUtCeye3cTOUBUkO3R5GCb5IirdyiixVZfguR5J0Cu/orloVFPRc98X63UOiQMvXntjKQMxJTnueXEypYeCA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5580
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

On 8/20/2021 15:44, Matthew Brost wrote:
> Number of available GuC contexts ids might be limited.
> Stop referring in code to macro and use variable instead.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h            |  4 ++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 15 +++++++++------
>   2 files changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 112dd29a63fe..6fd2719d1b75 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -60,6 +60,10 @@ struct intel_guc {
>   	spinlock_t contexts_lock;
>   	/** @guc_ids: used to allocate new guc_ids */
>   	struct ida guc_ids;
> +	/** @num_guc_ids: number of guc_ids that can be used */
> +	u32 num_guc_ids;
> +	/** @max_guc_ids: max number of guc_ids that can be used */
> +	u32 max_guc_ids;
How do these differ? The description needs to say how or why 'num' might 
be less than 'max'. And surely 'max' is not the count 'that can be 
used'? Num is how many can be used, but max is how many are physically 
possible or something?

John.

>   	/**
>   	 * @guc_id_list: list of intel_context with valid guc_ids but no refs
>   	 */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 46158d996bf6..8235e49bb347 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -344,7 +344,7 @@ static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
>   {
>   	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
>   
> -	GEM_BUG_ON(index >= GUC_MAX_LRC_DESCRIPTORS);
> +	GEM_BUG_ON(index >= guc->max_guc_ids);
>   
>   	return &base[index];
>   }
> @@ -353,7 +353,7 @@ static struct intel_context *__get_context(struct intel_guc *guc, u32 id)
>   {
>   	struct intel_context *ce = xa_load(&guc->context_lookup, id);
>   
> -	GEM_BUG_ON(id >= GUC_MAX_LRC_DESCRIPTORS);
> +	GEM_BUG_ON(id >= guc->max_guc_ids);
>   
>   	return ce;
>   }
> @@ -363,8 +363,7 @@ static int guc_lrc_desc_pool_create(struct intel_guc *guc)
>   	u32 size;
>   	int ret;
>   
> -	size = PAGE_ALIGN(sizeof(struct guc_lrc_desc) *
> -			  GUC_MAX_LRC_DESCRIPTORS);
> +	size = PAGE_ALIGN(sizeof(struct guc_lrc_desc) * guc->max_guc_ids);
>   	ret = intel_guc_allocate_and_map_vma(guc, size, &guc->lrc_desc_pool,
>   					     (void **)&guc->lrc_desc_pool_vaddr);
>   	if (ret)
> @@ -1193,7 +1192,7 @@ static void guc_submit_request(struct i915_request *rq)
>   static int new_guc_id(struct intel_guc *guc)
>   {
>   	return ida_simple_get(&guc->guc_ids, 0,
> -			      GUC_MAX_LRC_DESCRIPTORS, GFP_KERNEL |
> +			      guc->num_guc_ids, GFP_KERNEL |
>   			      __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>   }
>   
> @@ -2704,6 +2703,8 @@ static bool __guc_submission_selected(struct intel_guc *guc)
>   
>   void intel_guc_submission_init_early(struct intel_guc *guc)
>   {
> +	guc->max_guc_ids = GUC_MAX_LRC_DESCRIPTORS;
> +	guc->num_guc_ids = GUC_MAX_LRC_DESCRIPTORS;
>   	guc->submission_supported = __guc_submission_supported(guc);
>   	guc->submission_selected = __guc_submission_selected(guc);
>   }
> @@ -2713,7 +2714,7 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
>   {
>   	struct intel_context *ce;
>   
> -	if (unlikely(desc_idx >= GUC_MAX_LRC_DESCRIPTORS)) {
> +	if (unlikely(desc_idx >= guc->max_guc_ids)) {
>   		drm_err(&guc_to_gt(guc)->i915->drm,
>   			"Invalid desc_idx %u", desc_idx);
>   		return NULL;
> @@ -3063,6 +3064,8 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
>   
>   	drm_printf(p, "GuC Number Outstanding Submission G2H: %u\n",
>   		   atomic_read(&guc->outstanding_submission_g2h));
> +	drm_printf(p, "GuC Number GuC IDs: %u\n", guc->num_guc_ids);
> +	drm_printf(p, "GuC Max GuC IDs: %u\n", guc->max_guc_ids);
>   	drm_printf(p, "GuC tasklet count: %u\n\n",
>   		   atomic_read(&sched_engine->tasklet.count));
>   

