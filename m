Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB3442CFA2
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 02:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D296E89A;
	Thu, 14 Oct 2021 00:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E8E6E89A;
 Thu, 14 Oct 2021 00:48:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="207687072"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="207687072"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 17:48:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="442515325"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga003.jf.intel.com with ESMTP; 13 Oct 2021 17:48:32 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 17:48:32 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 17:48:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 13 Oct 2021 17:48:31 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 13 Oct 2021 17:48:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASVYFCJ8rTaUdNQ+m2hZSGZnpFboTuk026GrB8pbpN1kNXbTaB21y68Nww9tmwfftdyFqUHmxmH9E01VwkoU7yDOiBp2iz7hN6XHmo81/m+uh5UGO9UWIgdRBhF0ad3rVigFKKbjzEa3ErfYwNqlBnXx9m7YXqn19GmhA6sRmodeR1Wz94ypQdDcTCZjwAhtWze8vmp8o7cyPnRVKutlGdntwSgt542EhTa/AJdCDVfSK/nymfCxaSTIP7N22F8aArv3kDuVUpuy2G3v3FwoNZ2abxDJzGNn3rzIT/9l2cdwJbBMhAHL89SH+rbNxArfPOe3Wa+d6Snz3ajf8KxG5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+ipw9hFyyqXL+bkl7XSZeE4rwrGfQICqAqZtTSRYZk=;
 b=ljt3bmx7m5yZ53qwO/MiE7/T4fpHEp559WMAkoH5QPz/78JZyiYigC2dK8YrdMsVpggv+BdK72452n6X0lnMhnI980t7/m0CckkAe9RHhE67S0FIJABn9LrcLDyGBYrz4jPIbJxabbpmc7eXodsWbjbQQ0n63ROawL05FchVkNE9d3h/K9pGtkIWMRYbSfPmMcTm47oFZBNITZjZpn/eY6TwQODuDN7wSlF7sqn/1pwL1dUNw3kzqNDqkbCNYKaEZkeIKHplheFKXEkbqgC7o01VEVK4NJ1fR1P/POjr95TVpBmG/JsEyVePULOGideMFTbREsT5to05WcUyBOw5Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+ipw9hFyyqXL+bkl7XSZeE4rwrGfQICqAqZtTSRYZk=;
 b=L1GaSFVvH4tsGIxoN7P5By4CYojrx39X1JgV9KfhTD8YIOhS78Z33cwClt068s1bXymG2BYuG1EOjdACdyToTNDQS92jUflXOXUTWkwnQa3CF77dkQCDISG969fHFfyELFWkUqdqQTthrfI9w95DYVZR7rmx5docQ8CkeFJ6ofE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5610.namprd11.prod.outlook.com (2603:10b6:510:e9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14; Thu, 14 Oct
 2021 00:48:29 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.026; Thu, 14 Oct 2021
 00:48:29 +0000
Subject: Re: [PATCH 19/25] drm/i915/guc: Implement no mid batch preemption for
 multi-lrc
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211013204231.19287-1-matthew.brost@intel.com>
 <20211013204231.19287-20-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <7ee8b83a-df0c-5bfe-6422-9fa72a2ef174@intel.com>
Date: Wed, 13 Oct 2021 17:48:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211013204231.19287-20-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR04CA0238.namprd04.prod.outlook.com
 (2603:10b6:303:87::33) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MW4PR04CA0238.namprd04.prod.outlook.com (2603:10b6:303:87::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25 via Frontend Transport; Thu, 14 Oct 2021 00:48:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70759d91-159e-4464-7d2c-08d98eac5700
X-MS-TrafficTypeDiagnostic: PH0PR11MB5610:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB56105DCE8F87A73D505EA116BDB89@PH0PR11MB5610.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:22;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 38Ysa5nOAt4F1pw2LIf/KuiqdDwc7VM6Gg5c10pOpUVp/trGePKSPt7XpXd10pBe3tY86/rXj+FLd6XLecVSr4RsSDFjUWuzZhDApqYGApBvJgE9GcjIoSZzmKhkNX+Eot/Bvxol/5bpL7vmOCEniNpjoSByzg8YGo6bMIt0K4alFuJYyWxUu7bzFdwRgTWHKSqM8mGOYoL7TfuHRojsQUHDr7KarVAxBNu9/qdU4p4th63gvqfraWNM9+JGJ7PZ5nVKCyLuXhsSiDeSPy3Xsa630Acu8RZe5kEev52panNIEsgZIY1Uk+jlkW+PKYf2Qbq3E9iqD74QyjfBMVM9FoBhU4o1m/KDW/1t8nFbBYuQ0uWQhf1lzoUkeMj7SrZsHiJN3Y/SlK/kz2vwSQuvoDZ2AL3ySmuXgmpboaACpj/eNJ4QHw0K5LYSKahDa/6nG7uoD+UMwTgWQFShe5riWQIRS7Zp2JTqvj1ARaSBXFdWLHaOlaJpFE/+tzqHAzv3fQ8U/6/777WUbV9UwMNx1FEcV6llXXXMEt0ibpBuZc318tyYxiku6FMcERPOIe8hZEKlHNg+26e5u/7HO03nhZh0zT17zy3gn24UiAAOQQt8cpuDQk66uirr8R57exkM7HomsV4JKFdGTX8stpXCmfLj/f01mMBELJVtKAfP2/f87wPfVRfWgVWZ6Vo9drQ0URwXmlvboiaoOOsgeWME/gezjeOr3zGGnwfzlESOA1eNa2QbSM7iC5lDehZsPtaJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(31686004)(316002)(5660300002)(450100002)(66476007)(66946007)(956004)(2616005)(30864003)(86362001)(83380400001)(82960400001)(16576012)(2906002)(36756003)(508600001)(6666004)(31696002)(26005)(8676002)(186003)(6486002)(8936002)(53546011)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWJHREpwVDU5Rm5ZWElJZTU2cEJmQ3VzbnViRjhxSEJvQjdYVmN5RkRYRlEz?=
 =?utf-8?B?WDhiWUZPTllsUkhjM0hwaTVPczUzVnhtZmFRMWgvMU1ramI4S3pHWU9samps?=
 =?utf-8?B?SEpIeWVVemcwQmwwTm5zdSs3MncxTkZGLzZIQ3J0N2kzS0ZkeEhOb1BwdkRp?=
 =?utf-8?B?T1FpWVJMVUVFRlhvMGd2VU9vTDY2ZExFUjRoVFJ2UWtPRWZBaUJJdlBqYzJ5?=
 =?utf-8?B?UHdZQnB5YmpSMlArdkVOazNpMjh1V3hUTXFJb1M5em1INy94VnhLdlNjK1JB?=
 =?utf-8?B?dkJUbS9XdTg2UTZCWFFQT0RmMTg2bUZhQnI0QVlnSjNCRERRTXE5Qkw4Q2pq?=
 =?utf-8?B?QXhmUTZBRTVGT1JEL1FhSG9wVHRaVmY4WTZJNThJNU9ueFNvU2VlZmtGU1gr?=
 =?utf-8?B?RzAwWm5ON2JKRDBkV21xMHR2L094T3FSV1A5UUJtaEVBa2hwK1lTRnNjWW9j?=
 =?utf-8?B?OWR1eUgvQkJmWVpRMDVlTTJxUFc1QUtQalpkVXhadzEyeE9kM3IvT0VMSWhB?=
 =?utf-8?B?Z2k0TlVHZWt3UjVHcDMvMkIvSHdFQ2xUZVV3QWRUelBESlNiQ3FRbnRJQjlH?=
 =?utf-8?B?MW5oYi9OaFVYSlBWNFdteVNPd0NmYVBiL1ByazhvSll1R29PZm5ZbmlNSURS?=
 =?utf-8?B?emF4Tm5SRHpFQjBhWG16MDVnb3dRWHJZRmRyTmdCNWN1SGNrQVRUZ3JjZ0pE?=
 =?utf-8?B?S2hHM3gyNHorNnJUNFZqMEtwNFoyc0JWeHhQQjB0R1Q3Z3lqYTA3bXQxRmNF?=
 =?utf-8?B?Mi9tLzZLT3cxZnFHazlxbVZsMXN3dVNtWCt3SmZ0K251SHBRYTRHS0NjZ1BH?=
 =?utf-8?B?K09iYnZUc2IrdVljTi9xNmVpUWtqdmp1SnFyVDdjbm12b3pMZzVqeWRXYWhE?=
 =?utf-8?B?dzZkS3h6Rlk1Nzl1amlZT2VGTitTblhSWDdNQ0E5NzBock5JR2hIcjhqbUE2?=
 =?utf-8?B?QXFNT1Q3R0lqdFNQTS85clZxMFlzdWU0NUgrV2JDVHpaSm1kVmViT2dmNHNG?=
 =?utf-8?B?Y1hSeDNvODk5NkhXazlmRk5sOS80ZndKK3NwbWJLUWo5TXF6S1NyMDlramF6?=
 =?utf-8?B?Zm8wQ2JGb0E3a3ZQT1ZiQjFKRUlsWElVNzF4bzR3d0xVMG5GamxRU2pRMXhu?=
 =?utf-8?B?Ry9scDFuZUFVOGNvRDZXTXhwRTdNTGk0SWFCYm1MZEI3SXR5cWR3YWxKQ3B6?=
 =?utf-8?B?T0RPbXpEam5QQXpvdWdBSGZKWjRUM3JkTVZDaksxQmlSQldqNzhFYzdJejBi?=
 =?utf-8?B?WXNudXZBRzVXRllwRFZZR3k3Y0Y2aUsyenBOTEFoRlNWZ05xc2JOcUVXU3lQ?=
 =?utf-8?B?di9lS3V4bDBSdHVIL2NwWGVkZExUaW84STBNYnFHUGZCaFIxV0o4ZXJjNEJE?=
 =?utf-8?B?REMwNmJ3SFY1RzNZdE81TWsvL2pGd1V0NmJHd3B5eEpReG5sN0JSVXZSV2JO?=
 =?utf-8?B?bTAwWGd0R1FZSXhBNmtsYzhEaXE5UmN3djJJUW10dGphU1pKMUZ4aUMzRGgw?=
 =?utf-8?B?TU11OHhFbDhHV3lNOFZzeWQwOWZobmFIZDJ4VUx1cG5IcDdOSmFqeDZHWUUx?=
 =?utf-8?B?SUR3MFB6bWF2RlE2QWVjbDZuYlJRTERJREFobVg2S1lNNG5nZzY2K3FZTlFJ?=
 =?utf-8?B?SFlkcG1SQWduZ3VKVkErRTJOTFRtbFZ3UThOQ2pLSGowWjgyT0NyVVMzSHlZ?=
 =?utf-8?B?UHBlQlcyVEFIOGEvMWlYYTVDQkQ4NnVqWlhXbHh5U0YxVDZ6Nk1iazVRWENL?=
 =?utf-8?Q?TkOBDeImH6o20M6UgIzPONjS2Brg5WIAP+e0HZc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70759d91-159e-4464-7d2c-08d98eac5700
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 00:48:29.6318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YSdb6YS7wI+R4y4vatab3h+dAmx31mWRcJXdfmsjEoZYzuAc/63u1pRsxrgmutcLW+ZyAOh6EeVwtjs+d7uiWJTX/0JZTNa4pcU3vPEX4lM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5610
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

On 10/13/2021 13:42, Matthew Brost wrote:
> For some users of multi-lrc, e.g. split frame, it isn't safe to preempt
> mid BB. To safely enable preemption at the BB boundary, a handshake
> between parent and child is needed, syncing the set of BBs at the
> beginning and end of each batch. This is implemented via custom
> emit_bb_start & emit_fini_breadcrumb functions and enabled by default if
> a context is configured by set parallel extension.
>
> Lastly, this patch updates the process descriptor to the correct size as
> the memory used in the handshake is directly after the process
> descriptor.
>
> v2:
>   (John Harrison)
>    - Fix a few comments wording
>    - Add struture for parent page layout
> v3:
>   (Jojhn Harrison)
>    - A structure for sync semaphore
>    - Use offsetof to calc address
>    - Update commit message
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       |   2 +-
>   drivers/gpu/drm/i915/gt/intel_context_types.h |   2 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   2 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 333 +++++++++++++++++-
>   4 files changed, 326 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 6aab60584ee5..5634d14052bc 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -570,7 +570,7 @@ void intel_context_bind_parent_child(struct intel_context *parent,
>   	GEM_BUG_ON(intel_context_is_child(child));
>   	GEM_BUG_ON(intel_context_is_parent(child));
>   
> -	parent->parallel.number_children++;
> +	parent->parallel.child_index = parent->parallel.number_children++;
>   	list_add_tail(&child->parallel.child_link,
>   		      &parent->parallel.child_list);
>   	child->parallel.parent = parent;
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 1d880303a7e4..95a5b94b4ece 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -250,6 +250,8 @@ struct intel_context {
>   		struct i915_request *last_rq;
>   		/** @number_children: number of children if parent */
>   		u8 number_children;
> +		/** @child_index: index into child_list if child */
> +		u8 child_index;
>   		/** @guc: GuC specific members for parallel submission */
>   		struct {
>   			/** @wqi_head: head pointer in work queue */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index c14fc15dd3a8..2eba6b598e66 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -186,7 +186,7 @@ struct guc_process_desc {
>   	u32 wq_status;
>   	u32 engine_presence;
>   	u32 priority;
> -	u32 reserved[30];
> +	u32 reserved[36];
>   } __packed;
>   
>   #define CONTEXT_REGISTRATION_FLAG_KMD	BIT(0)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 09a3a9dd7ff6..ae08a196ba0a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -11,6 +11,7 @@
>   #include "gt/intel_context.h"
>   #include "gt/intel_engine_pm.h"
>   #include "gt/intel_engine_heartbeat.h"
> +#include "gt/intel_gpu_commands.h"
>   #include "gt/intel_gt.h"
>   #include "gt/intel_gt_irq.h"
>   #include "gt/intel_gt_pm.h"
> @@ -368,11 +369,16 @@ static inline struct i915_priolist *to_priolist(struct rb_node *rb)
>   
>   /*
>    * When using multi-lrc submission a scratch memory area is reserved in the
> - * parent's context state for the process descriptor and work queue. Currently
> - * the scratch area is sized to a page.
> + * parent's context state for the process descriptor, work queue, and handhake
handhake -> handshake

> + * between the parent + children contexts to insert safe preemption points
> + * between each of BBs. Currently the scratch area is sized to a page.
of BBs -> of the BBs

With those fixed:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


>    *
>    * The layout of this scratch area is below:
>    * 0						guc_process_desc
> + * + sizeof(struct guc_process_desc)		child go
> + * + CACHELINE_BYTES				child join[0]
> + * ...
> + * + CACHELINE_BYTES				child join[n - 1]
>    * ...						unused
>    * PARENT_SCRATCH_SIZE / 2			work queue start
>    * ...						work queue
> @@ -381,7 +387,25 @@ static inline struct i915_priolist *to_priolist(struct rb_node *rb)
>   #define PARENT_SCRATCH_SIZE	PAGE_SIZE
>   #define WQ_SIZE			(PARENT_SCRATCH_SIZE / 2)
>   #define WQ_OFFSET		(PARENT_SCRATCH_SIZE - WQ_SIZE)
> -static u32 __get_process_desc_offset(struct intel_context *ce)
> +
> +struct sync_semaphore {
> +	u32 semaphore;
> +	u8 unused[CACHELINE_BYTES - sizeof(u32)];
> +};
> +
> +struct parent_scratch {
> +	struct guc_process_desc pdesc;
> +
> +	struct sync_semaphore go;
> +	struct sync_semaphore join[MAX_ENGINE_INSTANCE + 1];
> +
> +	u8 unused[WQ_OFFSET - sizeof(struct guc_process_desc) -
> +		sizeof(struct sync_semaphore) * (MAX_ENGINE_INSTANCE + 2)];
> +
> +	u32 wq[WQ_SIZE / sizeof(u32)];
> +};
> +
> +static u32 __get_parent_scratch_offset(struct intel_context *ce)
>   {
>   	GEM_BUG_ON(!ce->parallel.guc.parent_page);
>   
> @@ -390,23 +414,36 @@ static u32 __get_process_desc_offset(struct intel_context *ce)
>   
>   static u32 __get_wq_offset(struct intel_context *ce)
>   {
> -	return __get_process_desc_offset(ce) + WQ_OFFSET;
> +	BUILD_BUG_ON(offsetof(struct parent_scratch, wq) != WQ_OFFSET);
> +
> +	return __get_parent_scratch_offset(ce) + WQ_OFFSET;
>   }
>   
> -static struct guc_process_desc *
> -__get_process_desc(struct intel_context *ce)
> +static struct parent_scratch *
> +__get_parent_scratch(struct intel_context *ce)
>   {
> +	BUILD_BUG_ON(sizeof(struct parent_scratch) != PARENT_SCRATCH_SIZE);
> +	BUILD_BUG_ON(sizeof(struct sync_semaphore) != CACHELINE_BYTES);
> +
>   	/*
>   	 * Need to subtract LRC_STATE_OFFSET here as the
>   	 * parallel.guc.parent_page is the offset into ce->state while
>   	 * ce->lrc_reg_reg is ce->state + LRC_STATE_OFFSET.
>   	 */
> -	return (struct guc_process_desc *)
> +	return (struct parent_scratch *)
>   		(ce->lrc_reg_state +
> -		 ((__get_process_desc_offset(ce) -
> +		 ((__get_parent_scratch_offset(ce) -
>   		   LRC_STATE_OFFSET) / sizeof(u32)));
>   }
>   
> +static struct guc_process_desc *
> +__get_process_desc(struct intel_context *ce)
> +{
> +	struct parent_scratch *ps = __get_parent_scratch(ce);
> +
> +	return &ps->pdesc;
> +}
> +
>   static u32 *get_wq_pointer(struct guc_process_desc *desc,
>   			   struct intel_context *ce,
>   			   u32 wqi_size)
> @@ -426,8 +463,7 @@ static u32 *get_wq_pointer(struct guc_process_desc *desc,
>   	}
>   #undef AVAILABLE_SPACE
>   
> -	return ((u32 *)__get_process_desc(ce)) +
> -		((WQ_OFFSET + ce->parallel.guc.wqi_tail) / sizeof(u32));
> +	return &__get_parent_scratch(ce)->wq[ce->parallel.guc.wqi_tail / sizeof(u32)];
>   }
>   
>   static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
> @@ -1833,6 +1869,27 @@ static int deregister_context(struct intel_context *ce, u32 guc_id)
>   	return __guc_action_deregister_context(guc, guc_id);
>   }
>   
> +static inline void clear_children_join_go_memory(struct intel_context *ce)
> +{
> +	struct parent_scratch *ps = __get_parent_scratch(ce);
> +	int i;
> +
> +	ps->go.semaphore = 0;
> +	for (i = 0; i < ce->parallel.number_children + 1; ++i)
> +		ps->join[i].semaphore = 0;
> +}
> +
> +static inline u32 get_children_go_value(struct intel_context *ce)
> +{
> +	return __get_parent_scratch(ce)->go.semaphore;
> +}
> +
> +static inline u32 get_children_join_value(struct intel_context *ce,
> +					  u8 child_index)
> +{
> +	return __get_parent_scratch(ce)->join[child_index].semaphore;
> +}
> +
>   static void guc_context_policy_init(struct intel_engine_cs *engine,
>   				    struct guc_lrc_desc *desc)
>   {
> @@ -1892,7 +1949,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   		ce->parallel.guc.wqi_head = 0;
>   
>   		desc->process_desc = i915_ggtt_offset(ce->state) +
> -			__get_process_desc_offset(ce);
> +			__get_parent_scratch_offset(ce);
>   		desc->wq_addr = i915_ggtt_offset(ce->state) +
>   			__get_wq_offset(ce);
>   		desc->wq_size = WQ_SIZE;
> @@ -1914,6 +1971,8 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   			desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
>   			guc_context_policy_init(engine, desc);
>   		}
> +
> +		clear_children_join_go_memory(ce);
>   	}
>   
>   	/*
> @@ -2980,6 +3039,31 @@ static const struct intel_context_ops virtual_child_context_ops = {
>   	.get_sibling = guc_virtual_get_sibling,
>   };
>   
> +/*
> + * The below override of the breadcrumbs is enabled when the user configures a
> + * context for parallel submission (multi-lrc, parent-child).
> + *
> + * The overridden breadcrumbs implements an algorithm which allows the GuC to
> + * safely preempt all the hw contexts configured for parallel submission
> + * between each BB. The contract between the i915 and GuC is if the parent
> + * context can be preempted, all the children can be preempted, and the GuC will
> + * always try to preempt the parent before the children. A handshake between the
> + * parent / children breadcrumbs ensures the i915 holds up its end of the deal
> + * creating a window to preempt between each set of BBs.
> + */
> +static int emit_bb_start_parent_no_preempt_mid_batch(struct i915_request *rq,
> +						     u64 offset, u32 len,
> +						     const unsigned int flags);
> +static int emit_bb_start_child_no_preempt_mid_batch(struct i915_request *rq,
> +						    u64 offset, u32 len,
> +						    const unsigned int flags);
> +static u32 *
> +emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
> +						 u32 *cs);
> +static u32 *
> +emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq,
> +						u32 *cs);
> +
>   static struct intel_context *
>   guc_create_parallel(struct intel_engine_cs **engines,
>   		    unsigned int num_siblings,
> @@ -3015,6 +3099,20 @@ guc_create_parallel(struct intel_engine_cs **engines,
>   		}
>   	}
>   
> +	parent->engine->emit_bb_start =
> +		emit_bb_start_parent_no_preempt_mid_batch;
> +	parent->engine->emit_fini_breadcrumb =
> +		emit_fini_breadcrumb_parent_no_preempt_mid_batch;
> +	parent->engine->emit_fini_breadcrumb_dw =
> +		12 + 4 * parent->parallel.number_children;
> +	for_each_child(parent, ce) {
> +		ce->engine->emit_bb_start =
> +			emit_bb_start_child_no_preempt_mid_batch;
> +		ce->engine->emit_fini_breadcrumb =
> +			emit_fini_breadcrumb_child_no_preempt_mid_batch;
> +		ce->engine->emit_fini_breadcrumb_dw = 16;
> +	}
> +
>   	kfree(siblings);
>   	return parent;
>   
> @@ -3843,6 +3941,17 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>   			drm_printf(p, "\t\tWQI Status: %u\n\n",
>   				   READ_ONCE(desc->wq_status));
>   
> +			if (ce->engine->emit_bb_start ==
> +			    emit_bb_start_parent_no_preempt_mid_batch) {
> +				u8 i;
> +
> +				drm_printf(p, "\t\tChildren Go: %u\n\n",
> +					   get_children_go_value(ce));
> +				for (i = 0; i < ce->parallel.number_children; ++i)
> +					drm_printf(p, "\t\tChildren Join: %u\n",
> +						   get_children_join_value(ce, i));
> +			}
> +
>   			for_each_child(ce, child)
>   				guc_log_context(p, child);
>   		}
> @@ -3850,6 +3959,208 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>   	xa_unlock_irqrestore(&guc->context_lookup, flags);
>   }
>   
> +static inline u32 get_children_go_addr(struct intel_context *ce)
> +{
> +	GEM_BUG_ON(!intel_context_is_parent(ce));
> +
> +	return i915_ggtt_offset(ce->state) +
> +		__get_parent_scratch_offset(ce) +
> +		offsetof(struct parent_scratch, go.semaphore);
> +}
> +
> +static inline u32 get_children_join_addr(struct intel_context *ce,
> +					 u8 child_index)
> +{
> +	GEM_BUG_ON(!intel_context_is_parent(ce));
> +
> +	return i915_ggtt_offset(ce->state) +
> +		__get_parent_scratch_offset(ce) +
> +		offsetof(struct parent_scratch, join[child_index].semaphore);
> +}
> +
> +#define PARENT_GO_BB			1
> +#define PARENT_GO_FINI_BREADCRUMB	0
> +#define CHILD_GO_BB			1
> +#define CHILD_GO_FINI_BREADCRUMB	0
> +static int emit_bb_start_parent_no_preempt_mid_batch(struct i915_request *rq,
> +						     u64 offset, u32 len,
> +						     const unsigned int flags)
> +{
> +	struct intel_context *ce = rq->context;
> +	u32 *cs;
> +	u8 i;
> +
> +	GEM_BUG_ON(!intel_context_is_parent(ce));
> +
> +	cs = intel_ring_begin(rq, 10 + 4 * ce->parallel.number_children);
> +	if (IS_ERR(cs))
> +		return PTR_ERR(cs);
> +
> +	/* Wait on children */
> +	for (i = 0; i < ce->parallel.number_children; ++i) {
> +		*cs++ = (MI_SEMAPHORE_WAIT |
> +			 MI_SEMAPHORE_GLOBAL_GTT |
> +			 MI_SEMAPHORE_POLL |
> +			 MI_SEMAPHORE_SAD_EQ_SDD);
> +		*cs++ = PARENT_GO_BB;
> +		*cs++ = get_children_join_addr(ce, i);
> +		*cs++ = 0;
> +	}
> +
> +	/* Turn off preemption */
> +	*cs++ = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> +	*cs++ = MI_NOOP;
> +
> +	/* Tell children go */
> +	cs = gen8_emit_ggtt_write(cs,
> +				  CHILD_GO_BB,
> +				  get_children_go_addr(ce),
> +				  0);
> +
> +	/* Jump to batch */
> +	*cs++ = MI_BATCH_BUFFER_START_GEN8 |
> +		(flags & I915_DISPATCH_SECURE ? 0 : BIT(8));
> +	*cs++ = lower_32_bits(offset);
> +	*cs++ = upper_32_bits(offset);
> +	*cs++ = MI_NOOP;
> +
> +	intel_ring_advance(rq, cs);
> +
> +	return 0;
> +}
> +
> +static int emit_bb_start_child_no_preempt_mid_batch(struct i915_request *rq,
> +						    u64 offset, u32 len,
> +						    const unsigned int flags)
> +{
> +	struct intel_context *ce = rq->context;
> +	struct intel_context *parent = intel_context_to_parent(ce);
> +	u32 *cs;
> +
> +	GEM_BUG_ON(!intel_context_is_child(ce));
> +
> +	cs = intel_ring_begin(rq, 12);
> +	if (IS_ERR(cs))
> +		return PTR_ERR(cs);
> +
> +	/* Signal parent */
> +	cs = gen8_emit_ggtt_write(cs,
> +				  PARENT_GO_BB,
> +				  get_children_join_addr(parent,
> +							 ce->parallel.child_index),
> +				  0);
> +
> +	/* Wait on parent for go */
> +	*cs++ = (MI_SEMAPHORE_WAIT |
> +		 MI_SEMAPHORE_GLOBAL_GTT |
> +		 MI_SEMAPHORE_POLL |
> +		 MI_SEMAPHORE_SAD_EQ_SDD);
> +	*cs++ = CHILD_GO_BB;
> +	*cs++ = get_children_go_addr(parent);
> +	*cs++ = 0;
> +
> +	/* Turn off preemption */
> +	*cs++ = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> +
> +	/* Jump to batch */
> +	*cs++ = MI_BATCH_BUFFER_START_GEN8 |
> +		(flags & I915_DISPATCH_SECURE ? 0 : BIT(8));
> +	*cs++ = lower_32_bits(offset);
> +	*cs++ = upper_32_bits(offset);
> +
> +	intel_ring_advance(rq, cs);
> +
> +	return 0;
> +}
> +
> +static u32 *
> +emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
> +						 u32 *cs)
> +{
> +	struct intel_context *ce = rq->context;
> +	u8 i;
> +
> +	GEM_BUG_ON(!intel_context_is_parent(ce));
> +
> +	/* Wait on children */
> +	for (i = 0; i < ce->parallel.number_children; ++i) {
> +		*cs++ = (MI_SEMAPHORE_WAIT |
> +			 MI_SEMAPHORE_GLOBAL_GTT |
> +			 MI_SEMAPHORE_POLL |
> +			 MI_SEMAPHORE_SAD_EQ_SDD);
> +		*cs++ = PARENT_GO_FINI_BREADCRUMB;
> +		*cs++ = get_children_join_addr(ce, i);
> +		*cs++ = 0;
> +	}
> +
> +	/* Turn on preemption */
> +	*cs++ = MI_ARB_ON_OFF | MI_ARB_ENABLE;
> +	*cs++ = MI_NOOP;
> +
> +	/* Tell children go */
> +	cs = gen8_emit_ggtt_write(cs,
> +				  CHILD_GO_FINI_BREADCRUMB,
> +				  get_children_go_addr(ce),
> +				  0);
> +
> +	/* Emit fini breadcrumb */
> +	cs = gen8_emit_ggtt_write(cs,
> +				  rq->fence.seqno,
> +				  i915_request_active_timeline(rq)->hwsp_offset,
> +				  0);
> +
> +	/* User interrupt */
> +	*cs++ = MI_USER_INTERRUPT;
> +	*cs++ = MI_NOOP;
> +
> +	rq->tail = intel_ring_offset(rq, cs);
> +
> +	return cs;
> +}
> +
> +static u32 *
> +emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq, u32 *cs)
> +{
> +	struct intel_context *ce = rq->context;
> +	struct intel_context *parent = intel_context_to_parent(ce);
> +
> +	GEM_BUG_ON(!intel_context_is_child(ce));
> +
> +	/* Turn on preemption */
> +	*cs++ = MI_ARB_ON_OFF | MI_ARB_ENABLE;
> +	*cs++ = MI_NOOP;
> +
> +	/* Signal parent */
> +	cs = gen8_emit_ggtt_write(cs,
> +				  PARENT_GO_FINI_BREADCRUMB,
> +				  get_children_join_addr(parent,
> +							 ce->parallel.child_index),
> +				  0);
> +
> +	/* Wait parent on for go */
> +	*cs++ = (MI_SEMAPHORE_WAIT |
> +		 MI_SEMAPHORE_GLOBAL_GTT |
> +		 MI_SEMAPHORE_POLL |
> +		 MI_SEMAPHORE_SAD_EQ_SDD);
> +	*cs++ = CHILD_GO_FINI_BREADCRUMB;
> +	*cs++ = get_children_go_addr(parent);
> +	*cs++ = 0;
> +
> +	/* Emit fini breadcrumb */
> +	cs = gen8_emit_ggtt_write(cs,
> +				  rq->fence.seqno,
> +				  i915_request_active_timeline(rq)->hwsp_offset,
> +				  0);
> +
> +	/* User interrupt */
> +	*cs++ = MI_USER_INTERRUPT;
> +	*cs++ = MI_NOOP;
> +
> +	rq->tail = intel_ring_offset(rq, cs);
> +
> +	return cs;
> +}
> +
>   static struct intel_context *
>   guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>   		   unsigned long flags)

