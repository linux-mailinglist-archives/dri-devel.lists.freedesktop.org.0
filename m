Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B9541BB0A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 01:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F35E6E9C2;
	Tue, 28 Sep 2021 23:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83576E11F;
 Tue, 28 Sep 2021 23:33:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="247344660"
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; d="scan'208";a="247344660"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 16:33:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; d="scan'208";a="538602679"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 28 Sep 2021 16:33:30 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 28 Sep 2021 16:33:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 28 Sep 2021 16:33:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 28 Sep 2021 16:33:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fm887gE5XDR1+i4VBAyckt/N0gql9NOfQhXwZS4/1imgpLBX2aNOc0Jwzgfc5gK//EdAnDguUColNt9PgAUSci4c+mfykrTIag4blEInMWYegn1FcGPfIXPBe729wnTY1djA1lGd/m8kH2w3/Z6Bzd/KBEBfus8RqK+rKDNHA88/PXWOmyq5dq165tUKAxKLM8dXXn7aj8dSeu9HnfH43z4m+gqxtSl/Ov0LieEEMViDK4T6pJUt20Y0KkxYQzfknFhjVBQtjSr5ZBM4ys1G3ynijGlHWjspnb9bYWvwOULFRPPcKg+p8S8YHcmLqFLCS7wCP1BzHRal+73yWGIWEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ksLnalqO4CMtRTlJmohOs2S42Vu/F2bS62FsWkuhJ/g=;
 b=W5UJqsCwkrxBUpzXPgSICO+jAyDUfXlX4wbuAb0414g20MWEFaEZO5cw+EA/bMDXrSHpKOurZEMAATSnnWwJiodHauQF2gQbhdc7CGOhHwmFcwzV4dxZcx27prA3XWqRJJiL5/H04waiYQ1ubhHaDflTsLK0AmU4ocGlI+wxxHt8P7HSn4mlMFRpOVWuQ2dCGNrxPcs5p5CYvA+Pr3EC8OpgwNvw0IuqFGbGPMQEr9lcJhKCLFaW7ujHECyHLw+uWfqV638ukXgcboRLbkGHT7vnqyS0WDIQvMKSAMuBEcswMJCdsBlbDVI/fwLDDgUD/3bdr6hj/qLtiUUuj/1cPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksLnalqO4CMtRTlJmohOs2S42Vu/F2bS62FsWkuhJ/g=;
 b=rt5ojSYVOxjbh1Ybm2ABQjd6spn6uyMS5tlsIBdWKdiZoPvBPbcMd6Fkn6+tK84vyTATdnCGZCAigumAdP9SAyX9LZsDNTsL3SZNe9sooqQeaRaR/4nKSeW51LLgdb0Qjq6zjqVMlTcAqOJW57gaLAMgFxgFK7b5frr5vUudydM=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5657.namprd11.prod.outlook.com (2603:10b6:510:ee::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 23:33:27 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%7]) with mapi id 15.20.4566.014; Tue, 28 Sep 2021
 23:33:27 +0000
Subject: Re: [Intel-gfx] [PATCH 23/27] drm/i915/guc: Implement no mid batch
 preemption for multi-lrc
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-24-matthew.brost@intel.com>
 <d5b15551-3849-1547-29c7-be593005a7e1@intel.com>
 <20210928223353.GA32806@jons-linux-dev-box>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <2281cc6d-2e6e-f78c-a823-32f0a3d455ba@intel.com>
Date: Tue, 28 Sep 2021 16:33:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20210928223353.GA32806@jons-linux-dev-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR20CA0043.namprd20.prod.outlook.com
 (2603:10b6:300:ed::29) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MWHPR20CA0043.namprd20.prod.outlook.com (2603:10b6:300:ed::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Tue, 28 Sep 2021 23:33:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bba7c46-7e30-42ce-e603-08d982d85ef3
X-MS-TrafficTypeDiagnostic: PH0PR11MB5657:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5657708EF6D4F2A677595E4DBDA89@PH0PR11MB5657.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:246;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V9uavXKO+Ul/HIpFp/3+yXljYGXwl/HIK3H/6XccJJ+0K4En8dhF9ZXVbHpZ7NA0K1Tplip/qbT/LooosHBZM1OQJj/AzuRV69QE9FAQqFf+axpb9h7VB1f+ATq3IaRaMIuyemkCzbODMMWUGYQdvmk9xveTq38PahDB+htrgBPaWxvex/hdpDjylcRU6xoYeekp2pIDiGm7Mv8vrGq0Dsjb4pgOX+pWD+7nZSZinqAeWizOrRMxkknuejqNrTjA2yxKbXA8fab4GqbigNYT7YVQl4rd0+VaLw6P7NcBmBxNQ6/JoAi1FPDyWvxHzHWRt+qTADrHhkjFIJCsdsMLcpVQG3Jd8Ez5StZpQ8S89cBzLKr3It4w0e00wlGkuJL8JWlC7ediVM4Zte7Yg9YP5Jwgc7XuEcG//kl8FmEzRgS0l+A+0SIKeG9uEdfdZNPtEtxN6c12QQmGmpjweulp6RnLBQtNGtT8UA09xKwlqxmIpQvqRsXU6HDgx3HgSU+h9dJZTIFtTNJPuFNcPoDbNbcGwFwAYokfC426NXYdLmZ/BtL9q5f+i/Ss8+Eb/c3kOmXdYSiOd4cU8Agk7eMOjXOWho3NLtcsq+Y/EZjZ9gRY1qVcChasrL/cJXWJb94T9Jah7LnmB5bcvBaZb2RXT9QI3FsUW8PjijRn+lSnxYKGI4Pk6mWRAabLHnRxZUcITpIm8uy/m5ojjGI1yzY/os9m5Z+5hynfidrA2AxICrM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(53546011)(26005)(316002)(37006003)(86362001)(107886003)(66946007)(83380400001)(31696002)(66556008)(508600001)(66476007)(6636002)(186003)(6486002)(38100700002)(6862004)(30864003)(2616005)(8676002)(956004)(8936002)(5660300002)(31686004)(16576012)(4326008)(2906002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alVaMnNPVHhQY0FOMHRYSVBIdlNHYjVDdjZDbTZ2SE5MbWhCNFVrZ2dYVkRZ?=
 =?utf-8?B?MlprUDl3bU84TGt5bEJJeXNFN0QwclVtTmdPWFZrZk83SEEyYUJkdktCM1JV?=
 =?utf-8?B?Sko2ZzRqVm9vYWs1VkdObUpuZ21nNngvZEtHaDZRWkMvaDlvZ1RlbFIxYkUw?=
 =?utf-8?B?WWpoeSt6Vjl4SUJpeWc5QUN6OThNNUMvazVlaDJRTW95T1dES0JPZnkzTStJ?=
 =?utf-8?B?dU5GNThpam04UGtidWkydjEwOEZsem9vV0dOOWFzcVNLMVYvZGRhU1R4NXZr?=
 =?utf-8?B?dXE5RjhMVG1CM203QXFDbWtWSEgzQ21vWWUvamV2enF2R1NsWDZOWkdTSW9K?=
 =?utf-8?B?bUpPRUlESGJYRUdRbFpyZkJwd1RHdUFKdkVsUHF5Tk1xcGF0eEJXdG9SOFkr?=
 =?utf-8?B?Tm8rWXRiMHZRWElJRVF6Y0NOcDhSYktSVWNCckY2S2JZWEFtSkpjTFNNT2p1?=
 =?utf-8?B?S1RaY2IrS2JDcjNOR1NiamVSUWd3MU9tQjNXQ2sxZUhoMkxsVkdCNGsyUk9K?=
 =?utf-8?B?ZW5JVDJyRXNzNDd3d3RVTFErQWdvYzBlQTA3S3VEUXlkc2ZJbHpTY2k5VXNJ?=
 =?utf-8?B?eHk1UmxWUFBrNmpYU2hTOFV0WnlsbE5mTm12RHFsVDV6eUQ0c0F4QzV0dVpU?=
 =?utf-8?B?WlVaeHFWQkY0d2FFS0RJVVJoN1BpZzBHeUh4NFlPNVRLSlY0QzJScjAvR0w2?=
 =?utf-8?B?Uzh1UlRFV3VndjdJelNOdWNqWUFjYnZwL0lYQ25SZlFOMmRrNzNvQS80YjRY?=
 =?utf-8?B?ZmltNTVjOHU3MGJiY05iTUNPL2tWS21Cd1piYjhvZTBBL0IvbkJOeDBDOTI1?=
 =?utf-8?B?TmNnc1BsMDE4L0xvTFpOZWtvT2xPdXh5UXJ1NEt5V0IxK1VzTWZnUWRrZVRL?=
 =?utf-8?B?UUgxbmF4ZC9uZ1dYajIxQlpjV01tejZxV0R3M24zSFBwbzZ4MHVJTVdrVEkv?=
 =?utf-8?B?NGtUMlNUNk8wdnllMHNoOFhJVlEwZmliYnRpOGIyaDZLUDhZb2s3TzJJYzFk?=
 =?utf-8?B?cmdRMGRBcjVOVkgyYXZNNzE5bXZBamZKRkpJK2tjVTk2TEV2MVlBTUlRMkQ0?=
 =?utf-8?B?NDBBakgrWnIvSkFvZlFvcC9rT3d1Ukg4RFl2cWxyT3dHazNhUXgrZExVZFV4?=
 =?utf-8?B?RDV6dEpkWVN0V1k4OEE1Y1MrdWphZUl5cXVwRzh0VzJDSnZoMFBhbVVsY0xr?=
 =?utf-8?B?WFppWVBhejNmRFBpRGtteTBzWlhjNFVpcjJjMmxGbHQ2T2hENlh4bjA3anpw?=
 =?utf-8?B?L1g5d25BeUxPTW1lblRSSkNhdnFrdXYrNWtXTGg3Ti9FUExZWVJvZnNzN0ow?=
 =?utf-8?B?eG84d28vNXlmSmxDZWJnenJJc2tsQllwWk9ad0Z4NTY1OG9RRzdORUZVMnk0?=
 =?utf-8?B?NDBCcVRvQWJXWXBqT2hzTk5tS0cySmdYanFQbFdYengrU0NxbHl4ZnkydGN6?=
 =?utf-8?B?VmREM0VkR3lNeFBqeXVna1BiSTJRZVFYU2RURmJJdnQ1clZ4Um9VeFlWOE53?=
 =?utf-8?B?NkhKT1pTTkw5cXkvSkdpNFVqSktKSkRRTGsyS2IxQ1U1NFdQdk1mNXV4ZEhO?=
 =?utf-8?B?ZDE3TDZhcGs2SzRXWHlmUzVkMlRBZmJHbFA0QmF2WjlhM2ltT2hKMDF1K0Yw?=
 =?utf-8?B?YXJ4NW1leGNzV1AyUFhWT0F5bG4zb1hUcm1oUFJtQUNiWDFIcTdKOEFpWXhM?=
 =?utf-8?B?VUhtV2ljM0dqdTJqWVF5cVV0RnVHUkxmUjQxdXpNZ2JuSG0zSWdWTU1mTkFp?=
 =?utf-8?Q?FNpKIKdzE455V98hNPBJUnqE4CDRfLtBUpBdQY+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bba7c46-7e30-42ce-e603-08d982d85ef3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 23:33:26.8668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RoKsOQa16heVA8tm45GlR/sb9HUIWUXVEvsp2bhd3KBPSNVRP1Qgh/T0cB+MYc9u5VazoQvuZpQCWy2gWSyzvwGyuO9YA2iMzrrDxe/GX4w=
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

On 9/28/2021 15:33, Matthew Brost wrote:
> On Tue, Sep 28, 2021 at 03:20:42PM -0700, John Harrison wrote:
>> On 8/20/2021 15:44, Matthew Brost wrote:
>>> For some users of multi-lrc, e.g. split frame, it isn't safe to preempt
>>> mid BB. To safely enable preemption at the BB boundary, a handshake
>>> between to parent and child is needed. This is implemented via custom
>>> emit_bb_start & emit_fini_breadcrumb functions and enabled via by
>> via by -> by
>>
>>> default if a context is configured by set parallel extension.
>> I tend to agree with Tvrtko that this should probably be an opt in change.
>> Is there a flags word passed in when creating the context?
>>
> I don't disagree but the uAPI in this series is where we landed. It has
> been acked all by the relevant parties in the RFC, ported to our
> internal tree, and the media UMD has been updated / posted. Concerns
> with the uAPI should've been raised in the RFC phase, not now. I really
> don't feel like changing this uAPI another time.
The counter argument is that once a UAPI has been merged, it cannot be 
changed. Ever. So it is worth taking the trouble to get it right first 
time.

The proposal isn't a major re-write of the interface. It is simply a 
request to set an extra flag when creating the context.


>
>> Also, it's not just a change in pre-emption behaviour but a change in
>> synchronisation too, right? Previously, if you had a whole bunch of back to
>> back submissions then one child could run ahead of another and/or the
>> parent. After this change, there is a forced regroup at the end of each
>> batch. So while one could end sooner/later than the others, they can't ever
>> get an entire batch (or more) ahead or behind. Or was that synchronisation
>> already in there through other means anyway?
>>
> Yes, each parent / child sync at the of each batch - this is the only
> way safely insert preemption points. Without this the GuC could attempt
> a preemption and hang the batches.
To be clear, I'm not saying that this is wrong. I'm just saying that 
this appears to be new behaviour with this patch but it is not 
explicitly called out in the description of the patch.


>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gt/intel_context.c       |   2 +-
>>>    drivers/gpu/drm/i915/gt/intel_context_types.h |   3 +
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   2 +-
>>>    .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 283 +++++++++++++++++-
>>>    4 files changed, 287 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
>>> index 5615be32879c..2de62649e275 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_context.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
>>> @@ -561,7 +561,7 @@ void intel_context_bind_parent_child(struct intel_context *parent,
>>>    	GEM_BUG_ON(intel_context_is_child(child));
>>>    	GEM_BUG_ON(intel_context_is_parent(child));
>>> -	parent->guc_number_children++;
>>> +	child->guc_child_index = parent->guc_number_children++;
>>>    	list_add_tail(&child->guc_child_link,
>>>    		      &parent->guc_child_list);
>>>    	child->parent = parent;
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
>>> index 713d85b0b364..727f91e7f7c2 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
>>> @@ -246,6 +246,9 @@ struct intel_context {
>>>    		/** @guc_number_children: number of children if parent */
>>>    		u8 guc_number_children;
>>> +		/** @guc_child_index: index into guc_child_list if child */
>>> +		u8 guc_child_index;
>>> +
>>>    		/**
>>>    		 * @parent_page: page in context used by parent for work queue,
>>>    		 * work queue descriptor
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>>> index 6cd26dc060d1..9f61cfa5566a 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>>> @@ -188,7 +188,7 @@ struct guc_process_desc {
>>>    	u32 wq_status;
>>>    	u32 engine_presence;
>>>    	u32 priority;
>>> -	u32 reserved[30];
>>> +	u32 reserved[36];
>> What is this extra space for? All the extra storage is grabbed from after
>> the end of this structure, isn't it?
>>
> This is the size of process descriptor in the GuC spec. Even though this
> is unused space we really don't want the child go / join memory using
> anything within the process descriptor.
Okay. So it's more that the code was previously broken and we just 
hadn't hit a problem because of it? Again, worth adding a comment in the 
description to call it out as a bug fix.

>
>>>    } __packed;
>>>    #define CONTEXT_REGISTRATION_FLAG_KMD	BIT(0)
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index 91330525330d..1a18f99bf12a 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -11,6 +11,7 @@
>>>    #include "gt/intel_context.h"
>>>    #include "gt/intel_engine_pm.h"
>>>    #include "gt/intel_engine_heartbeat.h"
>>> +#include "gt/intel_gpu_commands.h"
>>>    #include "gt/intel_gt.h"
>>>    #include "gt/intel_gt_irq.h"
>>>    #include "gt/intel_gt_pm.h"
>>> @@ -366,10 +367,14 @@ static struct i915_priolist *to_priolist(struct rb_node *rb)
>>>    /*
>>>     * When using multi-lrc submission an extra page in the context state is
>>> - * reserved for the process descriptor and work queue.
>>> + * reserved for the process descriptor, work queue, and preempt BB boundary
>>> + * handshake between the parent + childlren contexts.
>>>     *
>>>     * The layout of this page is below:
>>>     * 0						guc_process_desc
>>> + * + sizeof(struct guc_process_desc)		child go
>>> + * + CACHELINE_BYTES				child join ...
>>> + * + CACHELINE_BYTES ...
>> Would be better written as '[num_children]' instead of '...' to make it
>> clear it is a per child array.
>>
> I think this description is pretty clear.
Evidently not because it confused me for a moment.

>
>> Also, maybe create a struct for this to get rid of the magic '+1's and
>> 'BYTES / sizeof' constructs in the functions below.
>>
> Let me see if I can create a struct that describes the layout.
That would definitely make the code a lot clearer.

>
>>>     * ...						unused
>>>     * PAGE_SIZE / 2				work queue start
>>>     * ...						work queue
>>> @@ -1785,6 +1790,30 @@ static int deregister_context(struct intel_context *ce, u32 guc_id, bool loop)
>>>    	return __guc_action_deregister_context(guc, guc_id, loop);
>>>    }
>>> +static inline void clear_children_join_go_memory(struct intel_context *ce)
>>> +{
>>> +	u32 *mem = (u32 *)(__get_process_desc(ce) + 1);
>>> +	u8 i;
>>> +
>>> +	for (i = 0; i < ce->guc_number_children + 1; ++i)
>>> +		mem[i * (CACHELINE_BYTES / sizeof(u32))] = 0;
>>> +}
>>> +
>>> +static inline u32 get_children_go_value(struct intel_context *ce)
>>> +{
>>> +	u32 *mem = (u32 *)(__get_process_desc(ce) + 1);
>>> +
>>> +	return mem[0];
>>> +}
>>> +
>>> +static inline u32 get_children_join_value(struct intel_context *ce,
>>> +					  u8 child_index)
>>> +{
>>> +	u32 *mem = (u32 *)(__get_process_desc(ce) + 1);
>>> +
>>> +	return mem[(child_index + 1) * (CACHELINE_BYTES / sizeof(u32))];
>>> +}
>>> +
>>>    static void guc_context_policy_init(struct intel_engine_cs *engine,
>>>    				    struct guc_lrc_desc *desc)
>>>    {
>>> @@ -1867,6 +1896,8 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>>>    			desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
>>>    			guc_context_policy_init(engine, desc);
>>>    		}
>>> +
>>> +		clear_children_join_go_memory(ce);
>>>    	}
>>>    	/*
>>> @@ -2943,6 +2974,31 @@ static const struct intel_context_ops virtual_child_context_ops = {
>>>    	.get_sibling = guc_virtual_get_sibling,
>>>    };
>>> +/*
>>> + * The below override of the breadcrumbs is enabled when the user configures a
>>> + * context for parallel submission (multi-lrc, parent-child).
>>> + *
>>> + * The overridden breadcrumbs implements an algorithm which allows the GuC to
>>> + * safely preempt all the hw contexts configured for parallel submission
>>> + * between each BB. The contract between the i915 and GuC is if the parent
>>> + * context can be preempted, all the children can be preempted, and the GuC will
>>> + * always try to preempt the parent before the children. A handshake between the
>>> + * parent / children breadcrumbs ensures the i915 holds up its end of the deal
>>> + * creating a window to preempt between each set of BBs.
>>> + */
>>> +static int emit_bb_start_parent_no_preempt_mid_batch(struct i915_request *rq,
>>> +						     u64 offset, u32 len,
>>> +						     const unsigned int flags);
>>> +static int emit_bb_start_child_no_preempt_mid_batch(struct i915_request *rq,
>>> +						    u64 offset, u32 len,
>>> +						    const unsigned int flags);
>>> +static u32 *
>>> +emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
>>> +						 u32 *cs);
>>> +static u32 *
>>> +emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq,
>>> +						u32 *cs);
>>> +
>>>    static struct intel_context *
>>>    guc_create_parallel(struct intel_engine_cs **engines,
>>>    		    unsigned int num_siblings,
>>> @@ -2978,6 +3034,20 @@ guc_create_parallel(struct intel_engine_cs **engines,
>>>    		}
>>>    	}
>>> +	parent->engine->emit_bb_start =
>>> +		emit_bb_start_parent_no_preempt_mid_batch;
>>> +	parent->engine->emit_fini_breadcrumb =
>>> +		emit_fini_breadcrumb_parent_no_preempt_mid_batch;
>>> +	parent->engine->emit_fini_breadcrumb_dw =
>>> +		12 + 4 * parent->guc_number_children;
>>> +	for_each_child(parent, ce) {
>>> +		ce->engine->emit_bb_start =
>>> +			emit_bb_start_child_no_preempt_mid_batch;
>>> +		ce->engine->emit_fini_breadcrumb =
>>> +			emit_fini_breadcrumb_child_no_preempt_mid_batch;
>>> +		ce->engine->emit_fini_breadcrumb_dw = 16;
>>> +	}
>>> +
>>>    	kfree(siblings);
>>>    	return parent;
>>> @@ -3362,6 +3432,204 @@ void intel_guc_submission_init_early(struct intel_guc *guc)
>>>    	guc->submission_selected = __guc_submission_selected(guc);
>>>    }
>>> +static inline u32 get_children_go_addr(struct intel_context *ce)
>>> +{
>>> +	GEM_BUG_ON(!intel_context_is_parent(ce));
>>> +
>>> +	return i915_ggtt_offset(ce->state) +
>>> +		__get_process_desc_offset(ce) +
>>> +		sizeof(struct guc_process_desc);
>>> +}
>>> +
>>> +static inline u32 get_children_join_addr(struct intel_context *ce,
>>> +					 u8 child_index)
>>> +{
>>> +	GEM_BUG_ON(!intel_context_is_parent(ce));
>>> +
>>> +	return get_children_go_addr(ce) + (child_index + 1) * CACHELINE_BYTES;
>>> +}
>>> +
>>> +#define PARENT_GO_BB			1
>>> +#define PARENT_GO_FINI_BREADCRUMB	0
>>> +#define CHILD_GO_BB			1
>>> +#define CHILD_GO_FINI_BREADCRUMB	0
>>> +static int emit_bb_start_parent_no_preempt_mid_batch(struct i915_request *rq,
>>> +						     u64 offset, u32 len,
>>> +						     const unsigned int flags)
>>> +{
>>> +	struct intel_context *ce = rq->context;
>>> +	u32 *cs;
>>> +	u8 i;
>>> +
>>> +	GEM_BUG_ON(!intel_context_is_parent(ce));
>>> +
>>> +	cs = intel_ring_begin(rq, 10 + 4 * ce->guc_number_children);
>>> +	if (IS_ERR(cs))
>>> +		return PTR_ERR(cs);
>>> +
>>> +	/* Wait on chidlren */
>> chidlren -> children
>>
> Yep.
>   
>>> +	for (i = 0; i < ce->guc_number_children; ++i) {
>>> +		*cs++ = (MI_SEMAPHORE_WAIT |
>>> +			 MI_SEMAPHORE_GLOBAL_GTT |
>>> +			 MI_SEMAPHORE_POLL |
>>> +			 MI_SEMAPHORE_SAD_EQ_SDD);
>>> +		*cs++ = PARENT_GO_BB;
>>> +		*cs++ = get_children_join_addr(ce, i);
>>> +		*cs++ = 0;
>>> +	}
>>> +
>>> +	/* Turn off preemption */
>>> +	*cs++ = MI_ARB_ON_OFF | MI_ARB_DISABLE;
>>> +	*cs++ = MI_NOOP;
>>> +
>>> +	/* Tell children go */
>>> +	cs = gen8_emit_ggtt_write(cs,
>>> +				  CHILD_GO_BB,
>>> +				  get_children_go_addr(ce),
>>> +				  0);
>>> +
>>> +	/* Jump to batch */
>>> +	*cs++ = MI_BATCH_BUFFER_START_GEN8 |
>>> +		(flags & I915_DISPATCH_SECURE ? 0 : BIT(8));
>>> +	*cs++ = lower_32_bits(offset);
>>> +	*cs++ = upper_32_bits(offset);
>>> +	*cs++ = MI_NOOP;
>>> +
>>> +	intel_ring_advance(rq, cs);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int emit_bb_start_child_no_preempt_mid_batch(struct i915_request *rq,
>>> +						    u64 offset, u32 len,
>>> +						    const unsigned int flags)
>>> +{
>>> +	struct intel_context *ce = rq->context;
>>> +	u32 *cs;
>>> +
>>> +	GEM_BUG_ON(!intel_context_is_child(ce));
>>> +
>>> +	cs = intel_ring_begin(rq, 12);
>>> +	if (IS_ERR(cs))
>>> +		return PTR_ERR(cs);
>>> +
>>> +	/* Signal parent */
>>> +	cs = gen8_emit_ggtt_write(cs,
>>> +				  PARENT_GO_BB,
>>> +				  get_children_join_addr(ce->parent,
>>> +							 ce->guc_child_index),
>>> +				  0);
>>> +
>>> +	/* Wait parent on for go */
>> parent on -> on parent
>>
> Yep.
>   
>>> +	*cs++ = (MI_SEMAPHORE_WAIT |
>>> +		 MI_SEMAPHORE_GLOBAL_GTT |
>>> +		 MI_SEMAPHORE_POLL |
>>> +		 MI_SEMAPHORE_SAD_EQ_SDD);
>>> +	*cs++ = CHILD_GO_BB;
>>> +	*cs++ = get_children_go_addr(ce->parent);
>>> +	*cs++ = 0;
>>> +
>>> +	/* Turn off preemption */
>>> +	*cs++ = MI_ARB_ON_OFF | MI_ARB_DISABLE;
>>> +
>>> +	/* Jump to batch */
>>> +	*cs++ = MI_BATCH_BUFFER_START_GEN8 |
>>> +		(flags & I915_DISPATCH_SECURE ? 0 : BIT(8));
>>> +	*cs++ = lower_32_bits(offset);
>>> +	*cs++ = upper_32_bits(offset);
>>> +
>>> +	intel_ring_advance(rq, cs);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static u32 *
>>> +emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
>>> +						 u32 *cs)
>>> +{
>>> +	struct intel_context *ce = rq->context;
>>> +	u8 i;
>>> +
>>> +	GEM_BUG_ON(!intel_context_is_parent(ce));
>>> +
>>> +	/* Wait on children */
>>> +	for (i = 0; i < ce->guc_number_children; ++i) {
>>> +		*cs++ = (MI_SEMAPHORE_WAIT |
>>> +			 MI_SEMAPHORE_GLOBAL_GTT |
>>> +			 MI_SEMAPHORE_POLL |
>>> +			 MI_SEMAPHORE_SAD_EQ_SDD);
>>> +		*cs++ = PARENT_GO_FINI_BREADCRUMB;
>>> +		*cs++ = get_children_join_addr(ce, i);
>>> +		*cs++ = 0;
>>> +	}
>>> +
>>> +	/* Turn on preemption */
>>> +	*cs++ = MI_ARB_ON_OFF | MI_ARB_ENABLE;
>>> +	*cs++ = MI_NOOP;
>>> +
>>> +	/* Tell children go */
>>> +	cs = gen8_emit_ggtt_write(cs,
>>> +				  CHILD_GO_FINI_BREADCRUMB,
>>> +				  get_children_go_addr(ce),
>>> +				  0);
>>> +
>>> +	/* Emit fini breadcrumb */
>>> +	cs = gen8_emit_ggtt_write(cs,
>>> +				  rq->fence.seqno,
>>> +				  i915_request_active_timeline(rq)->hwsp_offset,
>>> +				  0);
>>> +
>>> +	/* User interrupt */
>>> +	*cs++ = MI_USER_INTERRUPT;
>>> +	*cs++ = MI_NOOP;
>>> +
>>> +	rq->tail = intel_ring_offset(rq, cs);
>>> +
>>> +	return cs;
>>> +}
>>> +
>>> +static u32 *
>>> +emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq, u32 *cs)
>>> +{
>>> +	struct intel_context *ce = rq->context;
>>> +
>>> +	GEM_BUG_ON(!intel_context_is_child(ce));
>>> +
>>> +	/* Turn on preemption */
>>> +	*cs++ = MI_ARB_ON_OFF | MI_ARB_ENABLE;
>>> +	*cs++ = MI_NOOP;
>>> +
>>> +	/* Signal parent */
>>> +	cs = gen8_emit_ggtt_write(cs,
>>> +				  PARENT_GO_FINI_BREADCRUMB,
>>> +				  get_children_join_addr(ce->parent,
>>> +							 ce->guc_child_index),
>>> +				  0);
>>> +
>> This is backwards compared to the parent?
>>
>> Parent: wait on children then enable pre-emption
>> Child: enable pre-emption then signal parent
>>
>> Makes for a window where the parent is waiting in atomic context for a
>> signal from a child that has been pre-empted and might not get to run for
>> some time?
>>
> No, this is correct. The rule is if the parent can be preempted all the
> children can be preempted, thus we can't enable preemption on the parent
> until all the children have preemption enabled, thus the parent waits
> for all the children to join before enabling its preemption.
>
> Matt
But,

The write to PARENT_GO_FINI can't fail or stall, right? So if it happens 
before the ARB_ON then the child is guaranteed to execute the ARB_ON 
once it has signalled the parent. Indeed, by the time the parent context 
gets to see the update memory value, the child is practically certain to 
have passed the ARB_ON. So, by the time the parent becomes pre-emptible, 
the children will all be pre-emptible. Even if the parent is superfast, 
the children are guaranteed to become pre-emptible immediately - 
certainly before any fail-to-preempt timeout could occur.

Whereas, with the current ordering, it is possible for the child to be 
preempted before it has issued the signal to the parent. So now you have 
a non-preemptible parent hogging the hardware, waiting for a signal that 
isn't going to come for an entire execution quantum. Indeed, it is 
actually quite likely the child would be preempted before it can signal 
the parent because any pre-emption request that was issued at any time 
during the child's execution will take effect immediately on the ARB_ON 
instruction.

John.


>   
>> John.
>>
>>
>>> +	/* Wait parent on for go */
>>> +	*cs++ = (MI_SEMAPHORE_WAIT |
>>> +		 MI_SEMAPHORE_GLOBAL_GTT |
>>> +		 MI_SEMAPHORE_POLL |
>>> +		 MI_SEMAPHORE_SAD_EQ_SDD);
>>> +	*cs++ = CHILD_GO_FINI_BREADCRUMB;
>>> +	*cs++ = get_children_go_addr(ce->parent);
>>> +	*cs++ = 0;
>>> +
>>> +	/* Emit fini breadcrumb */
>>> +	cs = gen8_emit_ggtt_write(cs,
>>> +				  rq->fence.seqno,
>>> +				  i915_request_active_timeline(rq)->hwsp_offset,
>>> +				  0);
>>> +
>>> +	/* User interrupt */
>>> +	*cs++ = MI_USER_INTERRUPT;
>>> +	*cs++ = MI_NOOP;
>>> +
>>> +	rq->tail = intel_ring_offset(rq, cs);
>>> +
>>> +	return cs;
>>> +}
>>> +
>>>    static struct intel_context *
>>>    g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
>>>    {
>>> @@ -3807,6 +4075,19 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>>>    			drm_printf(p, "\t\tWQI Status: %u\n\n",
>>>    				   READ_ONCE(desc->wq_status));
>>> +			drm_printf(p, "\t\tNumber Children: %u\n\n",
>>> +				   ce->guc_number_children);
>>> +			if (ce->engine->emit_bb_start ==
>>> +			    emit_bb_start_parent_no_preempt_mid_batch) {
>>> +				u8 i;
>>> +
>>> +				drm_printf(p, "\t\tChildren Go: %u\n\n",
>>> +					   get_children_go_value(ce));
>>> +				for (i = 0; i < ce->guc_number_children; ++i)
>>> +					drm_printf(p, "\t\tChildren Join: %u\n",
>>> +						   get_children_join_value(ce, i));
>>> +			}
>>> +
>>>    			for_each_child(ce, child)
>>>    				guc_log_context(p, child);
>>>    		}

