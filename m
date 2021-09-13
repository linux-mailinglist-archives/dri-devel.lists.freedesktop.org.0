Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D2F40A13B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 01:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D970889E9B;
	Mon, 13 Sep 2021 23:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAFA89E9B;
 Mon, 13 Sep 2021 23:06:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="285510330"
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="285510330"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 16:06:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="471750390"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga007.jf.intel.com with ESMTP; 13 Sep 2021 16:06:41 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 13 Sep 2021 16:06:40 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 13 Sep 2021 16:06:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 13 Sep 2021 16:06:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 13 Sep 2021 16:06:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAR/RNCPm0QhgnEdQTnsLZEqjOXcUqii/Fq8k94KapWjN7uyfW9fMb35y9+BNnYnxX9Nkm2IZD45gIwu+/iq9aIjPhcwGqlhj8O4XDuBpV8EP6UUCuDQuK+r8gIUDYdKxRmSr8pQzOMFT8WzvU0JXoJZ8anL867Q1lAab0RWLyU54YFSLCcgGcpY53dDwVcKPlD7qQg5U+lWhXj45GYWhbNYmpESvsuekrRhdI2yGHtfl8keQnbrYLWKIE4dyFbnc1VDRzYcfoieyU5i7gw1+8wGbZo0WopGrcWb/oRVtJZvlOPxDhMTbdYNiAbX1XCQMj6GS2rUfLMxUAfxbOSD9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=8IFguXbJ+SRkWyvRSNpgodiQy5aQ1a5lkINRXZzKu+s=;
 b=TbN1VXrj2COJcOZcRHexmRgN0LIbXTPmAhFYqiAuqj5JyrCeUIOHon2gO4+4uiU9DYJmXstmbw4L2iuc9e2F5ozCdlgO/kP0nTEwgjgSxeEZ6Cih41FhcyKClNikAFMvKijXvbZrFjH4XX2dnnPwGli4UC0GB2kKNulqnCaQ3c9nG1eiqA1mUMY5mBK1jsed9iCQHgzTtza7cyMpbz7k5LU6C8cjx/8pZCTiw0f3/U13TQklvMR8Wc1MnVt0mh/mrlVlwuBLaoUA6JyDHtwRfEKluMjaxRKpIrDrqRxXOeELGM7XEd2GmxcCcfth7e/w2qrLIRyvt4JlKuXJMtHdMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IFguXbJ+SRkWyvRSNpgodiQy5aQ1a5lkINRXZzKu+s=;
 b=A/ZPfqURGOF84K+vWDg9gwO9o4/1mnZXH0tGqOHJC3fEL9DbDW7iZDRYSO0BebWfyizm1uk86hk1/JOfAZPQvZIJv2Q/REdygar9/JdspB0YpQo/AHGwQr8t5vcQINJ4loj7UPcQ9C89PgaWQIErTFZHSgiPP8tsETVi92zRee8=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5628.namprd11.prod.outlook.com (2603:10b6:510:d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Mon, 13 Sep
 2021 23:06:36 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 23:06:36 +0000
Subject: Re: [Intel-gfx] [PATCH 09/27] drm/i915: Expose logical engine
 instance to user
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-10-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <7f3495e7-d66a-3254-3473-b25e4c757b5c@intel.com>
Date: Mon, 13 Sep 2021 16:06:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210820224446.30620-10-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR22CA0011.namprd22.prod.outlook.com
 (2603:10b6:300:ef::21) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MWHPR22CA0011.namprd22.prod.outlook.com (2603:10b6:300:ef::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 23:06:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f404601-eec6-478d-a64a-08d9770b22ef
X-MS-TrafficTypeDiagnostic: PH0PR11MB5628:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5628136FB132AFE72D9F57FFBDD99@PH0PR11MB5628.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ndb1gVcPgSZ8DO5VIK7Bi063KVNTAgyzvr6GHP3n48zfhUSdnueCn8ZBn9IucsjYIdJ/ZEBo/3xztkRDR5wHk/uatsDpH+/Nv+KPIph3y4e5a0/o5xJTssFcCVN9TsX10wWF9Mhyx/26Yu/YfQd1vMBt556fsVLktHed5dc/iwDUKrfUVxPOpcvhJvc89Z+Or6UCWEt/K/ywvtTFkP4vHjW/KfiCXZbgbSf9qjrq7jzkZax3j2qOT5wr1/+UNcL7jXrgrqNn57VoF6EzOevIIytVg4GJyvAgkgYk0usd/gD57rhqZUNN1+31WUl2qOA/msYoTOgA+9oSqL2jl9lV1w51EriCTg/D/SnteMBejvitS4XDS7pwoLSHrk6lXGqwZCiJ3IUJrYANEuazzWETWPBH8Q1vW6aTHOrXK1XDyCYW7PF8WEAtf13U8LRvsfnFZz2uaWLcfZiLGT77Mk/X8hkDVqODYWKd+AuPulQjjra/4YdKqr4b80gUfr8JrBKaOOXLfbJ1eTyiBS1L8Fi6AmNbcQOuqkuKyUyf3K13liWk0gSa0Vg4/oDgX+yWBKQWiyBOJhlX66vj/dcjBir5V0YSRU+ei7kWYGLg5stbp7S3NBK8stSNaAln5CXsalIKMyH5PBmxZiSFp0l19DOS2qWE2b9zTs5sydnRJ7LiZ8K42wC/d2qhYXtpCo/40IAmHUcIdVre0Vd4KdW1J9FtvOBk6o9r6GlYO9KYqt/rGwBiLllQL7rP3KgGY0a+zt7/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(16576012)(26005)(53546011)(186003)(478600001)(966005)(4326008)(956004)(2906002)(8936002)(66946007)(107886003)(66556008)(316002)(66476007)(6486002)(8676002)(31696002)(31686004)(36756003)(38100700002)(2616005)(86362001)(5660300002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnJQSi9oZExma3lFRHNnanZIcmp3eVZteUU0NndZTFFaRzNNNzVYSjN2VkF1?=
 =?utf-8?B?Vm85TXVWdTUwdWhJMk82cTBjK3RZL2RjcThvQmxPU3pVdTBoVFJkT0p3czRX?=
 =?utf-8?B?aTJtNVJtZ1pBY1U4emFiMU8vUlliYTlZTG1oNmxBUHlHZmp1V2dTMVZxZGty?=
 =?utf-8?B?ek0za2RpOU5GdC8yMGJyOGxpdzVYaGc1RFV6M3YxZXZuRm1aUElITXRMSU95?=
 =?utf-8?B?OGc1WWc5RkdIS1NDYW1JOUlVamV2dng4MVdiL0J0ZnRDamFzaHNsQjZXQUkz?=
 =?utf-8?B?ZzNlQ0hFekt1MERlcHlZNXVuYWliUlg0K3NSS25qSm4wUGNMeW5mWk1aWlFT?=
 =?utf-8?B?Tk04MDFIendFTSs0OVo2Z2FnVWVPU1JZQ1pvNVpXQkNleWw2bFZMQm1vUFNJ?=
 =?utf-8?B?RkdVMmxDTmtFSDJTdk5JMTRUSXFpbzVLTzVWRU1iMVZkSEM4R0p1bzJUMHh1?=
 =?utf-8?B?bk41VU5WZytLTFlRSC9PNmhnSng1Q21KRHB5dnVUVVpyZVZXV1hmS3JBYXVE?=
 =?utf-8?B?Sk5XUlRuMVpEV1BnRUlGZjhaYkNzREtTMXc1ejQzMGdOYkR6V3hRTzRsY0xU?=
 =?utf-8?B?czhRREhsa0JjZXV2d1ptdkdBKzZpUGNmYzRkYWMrTXRFMDNpL3YyUHJ4L1dq?=
 =?utf-8?B?S2Z2Q0ZyY2pXeGtGSmNuRmdFa2xZSlUvOTdpMG1yWHBJRUtOc1hzR09BYVVv?=
 =?utf-8?B?bTlteVl2WFVJb0hlWU5TRnlpVFhRREIzTzZBcVNxeDZWQ0NQRUErRmZuODhY?=
 =?utf-8?B?WGM1cks0MktRODAzNWRickhVTTU0clpISDZVWUxKbFFQUDE0WE54VkRkOEVw?=
 =?utf-8?B?RzM1eVViY0RsNklsc1VPRTVBcExkQnI1OUYrdDNCUVVxWE1aaVZyTEtHcnRt?=
 =?utf-8?B?NWw3a0xjM3VBSGcyQXlOOE5mN1JUNVMxWjRrWkVUSmZRV3BQdUxOVHhPclVC?=
 =?utf-8?B?aFB0OWFMcTJBUUZkVlNEQVhjNjhyUXdWeUh4ZzhjZDJ4ODJ4UG83eklzUkkv?=
 =?utf-8?B?T0Y3VHRuYXBoUXFScGZzREFqMXpMN1ZWaXgrdlpFQ0FHdkY3VDk0SUh4R0dv?=
 =?utf-8?B?ZmFRbXB1d05wQkdXaS81dkk3Tm0wOVdPVVNPTDQwVFVkdkhlcUNCVnI2cW5R?=
 =?utf-8?B?TVcwUjltYXRPb2E5VzRyYnFpOXgvRzhCUXBBQkxUUkNxOEpObUhEY0EwTWdZ?=
 =?utf-8?B?R1ZkL0E4dFAwa3dtK3hPWkltazE5TlVKNy9UWTdyR0p6b1llQjY4RExUSVVZ?=
 =?utf-8?B?c1BwWkpKMWhsSWI3bHgyQWR4NTlvRzltSUhJYnZFa0VWTm5EbU55Y3M5OTBu?=
 =?utf-8?B?eFNEWVh3YW9pdTMwVUcrNXp1NW12TnVFS3ZYcjVMQkFRMWF2d3FwNDlBVXNV?=
 =?utf-8?B?emNkUTRrWFQ0VFEvM1lhVE9vc1VNbjd0RkdScnR3WDdLNEtkekVTamtkZ2Np?=
 =?utf-8?B?LzlMMVp6Snd5ZENlM2ZEcjNNMXVnbldsNlFDcElGVHZJWXplNnB6VXl0YVF5?=
 =?utf-8?B?eXNyMXhxMVl4ZnB4U3NBUFVWcStPeCszYUtIVHFlVDRsUDk5QXhrbWkvYzRL?=
 =?utf-8?B?akhJdVd4OGtsd0N3ZnFsa2MzcGtIelZocndmUVJjYnhzRDBUalNUSGF4R2pw?=
 =?utf-8?B?NmcvbkF3MW0ySUJZd3B0VEtKTkU1dHRKR2VtSCtpZnQ5VmNxNWxWVEpmWnpL?=
 =?utf-8?B?M2pldnIvbUVVV043UWdlQzZyNkd4djZ6eUNxbGRwem1FL2RuNWN0Wk1Fd25a?=
 =?utf-8?Q?JjLA+uc/qw5+YpwOIk+NG/nT+p3ui5lxM63S2Qb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f404601-eec6-478d-a64a-08d9770b22ef
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 23:06:36.5416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekj0an4Tc/KB6mPpY0CXKIFrgsE6O6gjo0BjtY7zEHjEj3vBB/LCZxXnh9VKq86TghuhcNOTdfUYuJzLokst8K0ksWXPaXkbtTn404R+tMU=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/20/2021 15:44, Matthew Brost wrote:
> Expose logical engine instance to user via query engine info IOCTL. This
> is required for split-frame workloads as these needs to be placed on
> engines in a logically contiguous order. The logical mapping can change
> based on fusing. Rather than having user have knowledge of the fusing we
> simply just expose the logical mapping with the existing query engine
> info IOCTL.
>
> IGT: https://patchwork.freedesktop.org/patch/445637/?series=92854&rev=1
> media UMD: link coming soon
>
> v2:
>   (Daniel Vetter)
>    - Add IGT link, placeholder for media UMD
>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_query.c | 2 ++
>   include/uapi/drm/i915_drm.h       | 8 +++++++-
>   2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index e49da36c62fb..8a72923fbdba 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -124,7 +124,9 @@ query_engine_info(struct drm_i915_private *i915,
>   	for_each_uabi_engine(engine, i915) {
>   		info.engine.engine_class = engine->uabi_class;
>   		info.engine.engine_instance = engine->uabi_instance;
> +		info.flags = I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE;
>   		info.capabilities = engine->uabi_capabilities;
> +		info.logical_instance = ilog2(engine->logical_mask);
>   
>   		if (copy_to_user(info_ptr, &info, sizeof(info)))
>   			return -EFAULT;
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index bde5860b3686..b1248a67b4f8 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -2726,14 +2726,20 @@ struct drm_i915_engine_info {
>   
>   	/** @flags: Engine flags. */
>   	__u64 flags;
> +#define I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE		(1 << 0)
>   
>   	/** @capabilities: Capabilities of this engine. */
>   	__u64 capabilities;
>   #define I915_VIDEO_CLASS_CAPABILITY_HEVC		(1 << 0)
>   #define I915_VIDEO_AND_ENHANCE_CLASS_CAPABILITY_SFC	(1 << 1)
>   
> +	/** @logical_instance: Logical instance of engine */
> +	__u16 logical_instance;
> +
>   	/** @rsvd1: Reserved fields. */
> -	__u64 rsvd1[4];
> +	__u16 rsvd1[3];
> +	/** @rsvd2: Reserved fields. */
> +	__u64 rsvd2[3];
>   };
>   
>   /**
Any idea why the padding? Would be useful if the comment said 'this 
structure must be at least/exactly X bytes in size / a multiple of X 
bytes in size because ...' or whatever.

However, not really anything to do with this patch as such, so either way:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

