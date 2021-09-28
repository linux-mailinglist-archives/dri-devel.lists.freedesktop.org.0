Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 821E941BA20
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 00:21:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0046E122;
	Tue, 28 Sep 2021 22:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BA26E122;
 Tue, 28 Sep 2021 22:20:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="204304898"
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; d="scan'208";a="204304898"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 15:20:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; d="scan'208";a="520619544"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 28 Sep 2021 15:20:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 28 Sep 2021 15:20:51 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 28 Sep 2021 15:20:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 28 Sep 2021 15:20:50 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 28 Sep 2021 15:20:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvqtA/3qQ41lAwhm3ab7TsA3ZMH4mT7kJAFUkM2aB/SIzOtaWWJW8IEN9gKeGNZcFBX3x4kqQDDSZJ5702Weo1/zrxo6oR1Pqp7PITDFyL2FHFhzbb1a/4M2pD/81f+y6nmHtzke0gWd7ORWpm0QTcp8sx1pfbYa6FZMUsuoELrCno5Fj62VgD1c2fntYSwwq4UZlhfnkYhc0pSAPJ63T6TeqWU8cGZWyOJFP2jMPRI51UG3CtC+JOOZw1fWDjzhb8tbStZHV9lTnBFSCMbxgXY2l2IoYrma/8WW3ap5VmnZe9OWSiIP6BRsfLjU1FQC/JAM0wngmSAHg7ukrZjjxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=eVKt19nmdTGM8v7+wbvKJ3cmpkpOnCWMYJ2DhLqHzTE=;
 b=ceMB3TvRkxqFDH2SS2tZlY9FrR79ts/IAwOpzApyZ0MwbAS1Awcl5MVlMFHr4E9JnBVQRFI4vmXPS79jfSYMZkQPxOLk06LEP8QsOAw+uLMXDyZZj0PsVoeo8r+eihhFG2PgHFUzl8Nfr5wE+bO/nJzmkbHwTCnubuy7YCI3IFrD2LK8syOltmHZPtZcRKKEFI2NXfKCGYxEcmDBax3lprctxXLpFzzitZAaIMR6QyaEQMmIPz6Tvy8SS3c+00YB117zQJbAhGc8nnJvtE2x8ZiY1SOk9PV8hp0TJgduX6XAVw2zKZ789DR8P5NBl9mElsIY1yyRy6WA30qgJ5o1EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVKt19nmdTGM8v7+wbvKJ3cmpkpOnCWMYJ2DhLqHzTE=;
 b=d7ASUZlfOzZm73uA+hpsUOv9YIAeYdxB9e4hB32iX6Fy/v3Fd0wEE5F76RiO4meahjHvbjj4EZrxWYBs9/7jAxFRkLlUjGuU9oXC23uqBxlZVxvxEk0bzVwD2/YwvAxCKylA9iU8v6jbJkDX1NVCPQBUqVwvtAx1z+4lasEyhrA=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5657.namprd11.prod.outlook.com (2603:10b6:510:ee::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 22:20:46 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%7]) with mapi id 15.20.4566.014; Tue, 28 Sep 2021
 22:20:46 +0000
Subject: Re: [Intel-gfx] [PATCH 23/27] drm/i915/guc: Implement no mid batch
 preemption for multi-lrc
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-24-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <d5b15551-3849-1547-29c7-be593005a7e1@intel.com>
Date: Tue, 28 Sep 2021 15:20:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20210820224446.30620-24-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: CO2PR04CA0132.namprd04.prod.outlook.com
 (2603:10b6:104:7::34) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 CO2PR04CA0132.namprd04.prod.outlook.com (2603:10b6:104:7::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.13 via Frontend Transport; Tue, 28 Sep 2021 22:20:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97cdd29c-1540-4cf6-359d-08d982ce37ff
X-MS-TrafficTypeDiagnostic: PH0PR11MB5657:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5657A3E398F2A486610F1EABBDA89@PH0PR11MB5657.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cuuizsdQ+g9LjyhirwhBRGZjN63sH2MInf3YVHohMfTSax6X0cD+WCyyJwHKiePWSBMoyr9CFz6DAPHeBVPH63YkwhR8PDjzI+X5kmhZ53QSAdjJchWhvDiB9vfNEHExgriMvmLgy2kSQFcPCZgEIkVuILSOfKsUWFKprH11q6a35YRNzHI1IeY1u9Z1RPNQPVidLR5duqPnZ3v0I/7ZwDiuGeABzbOfV2BMMl0iu4DgNdrSputwnJUnfpe18d7XE4HAvivo96Uf3xm3PQYUeSKqi/Wkr5MknbYLMBZgCrr3gfVDczE3KpGYfy1qKofAzd0pCNR32NFDT/OplWAugaUnXqqdaLqg63T17H5AhHsHuLpMp25fmae4SBXQhGQhtQpfl1JCB/DIwZVIu3uzjouIRQHeFklfOyL6wbT417QA+BuBV21ObTYrxUdswsFR3MG7PMK4A5m4Iyqn8RoZxkiYTM+c5hpKQhqeEpvFwDvBAufF/zeMt85dG7+h/bVojzzDniuDVoVLSMolBmFltBXcWt3+pq8o6AZlVavEKNm7iUvftW8FodEc/ZLvWscPe7UAe+WKddvGUae9ARdTptx5fVi758N1sipL7PPOZMI4g7jbrv2W/7YZShjKyxyxszHJU+/VSAKlptWeVehyF+W3rTl66FWT4e8R4APu+zxiXLo2WkEsZJZiMtVuIlJUPk1u3i5YzB5+RT6a2fef6JiZ2Qs2bWD7XXIMsYWc0/Jxiyen7jjlj66/FDbAK7SE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(53546011)(26005)(316002)(86362001)(107886003)(66946007)(83380400001)(31696002)(66556008)(508600001)(66476007)(186003)(6486002)(38100700002)(6666004)(30864003)(2616005)(8676002)(956004)(8936002)(5660300002)(31686004)(16576012)(4326008)(2906002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDc3a2l1dTh5TkVTMi9PZThCQ1BLTmI0amY3R0U4V3A1RkZGblc0UmxhTE83?=
 =?utf-8?B?bnZJam95T3JUMzM3M1QrQW5QSGdmcEYyY0ZmZGdaOFc0QkE5SlpVc1owSWlS?=
 =?utf-8?B?NTZqSUFibytLMnN0cktvNXFxOTI4WU1iMEZkYjg4MDl3MUFEVm5xYnJTL0Nw?=
 =?utf-8?B?blRHQ1Z0SFZpbGJidGdQdlpEanptNDlmbzRrcDRteW1aUURMTlBBUVhIMThh?=
 =?utf-8?B?bzYrNmVkZ3VmUXpXckZhZHlicXQwSXpZNXp5MysxS09LdUNlekZSazl6L2po?=
 =?utf-8?B?YU8rRUNidTVpbWlmd29lSHV3MzBBRGMzMVE3Nk8xMTd2dXFVUTVsT0pjaytz?=
 =?utf-8?B?TWx3UHdwamdaNjQybWxINFRHc3hBVk9BYUpVZ0NiZGRvZVVBNUt3TUZTNkg3?=
 =?utf-8?B?akJkazk0VE5UTktWNUVXQUhEYWpoSG5jeGF5OU1PcEpRQng5TnA0c2NrdlpI?=
 =?utf-8?B?MVpkQXZCU3duWUZDM0dkZkpLazhLTG1RcFIxLzRBZm5wYjV1WEVOTDFIdnI4?=
 =?utf-8?B?eFVETHh4TUdXRW44b0VVaDVYVmowaUhyNCtmNVNIRGt2aTRiUVo2amFuVzBB?=
 =?utf-8?B?eXBmanpiWUJQOEgrUU1aeFJjRW1FUDRnUWFDYmcrMExoMHBDU09US1VLa3RL?=
 =?utf-8?B?VlJJWGZyL2UrZnNleDVQY2pLNWU0YXliK3lkTFliaDBDdzduK3E3TFZycDc1?=
 =?utf-8?B?QWJHams1a2lxMW1JcEZwOUlrdnQ0WUh1dlc4RXVpSkRoZ0VyNHMybFplMjNR?=
 =?utf-8?B?cnd4Zk1lRktpaGI0bFhMc0JUeVNNSnRGLy8rWVVnaGxpdTM3c1BhRVY3QUFn?=
 =?utf-8?B?MkhuazVxMTNyQ2t0L2tMbFlPa0QvaVViUUcvRW1FQWtWc2R2clhYUi9lVWox?=
 =?utf-8?B?VkF4TVlqZzhCVmhGcTJuSC8vdGlMVHArMkZhR3BjSENSNExGVjI3cXZUclh5?=
 =?utf-8?B?ZEN5MlNneVdBU2UxelNUazRLVXdsdnBMNWtoSExhbDJRYUFEUzRjYUg4R2dN?=
 =?utf-8?B?WGFjNnVmem8xemxBd0xIbHBoSE1zWkhCY3Z6bEFEUnNBZENEU3lIVTRrU0M4?=
 =?utf-8?B?RjlNVU9VTE42dndqWlNGb09DclBQUkMyRzdHN2U4akNmaXlVSURUSW4xaDRn?=
 =?utf-8?B?L3RXajBoMWZwL0ZMNmtmM0xFTDQvRXRNbG1MWS9QNUNVcFdxaFNNUlZiL2ZS?=
 =?utf-8?B?K3RWRUxCc3pQQlpkcFRla0t4bkp1TVJKZ21HMU52c29PNXpBbUJnRVJFS2RD?=
 =?utf-8?B?elNxZGdydmU5SXllSDA5ZTNTYWNzZUk2dm1JYVYxM3pvUlNKdjdnejZxVUxR?=
 =?utf-8?B?Smg2Wi8vR3FLUUNCZkFONXJnb0xXQ0xLbVJBcUFZOWFBNlpDNnEvVmtOTkEz?=
 =?utf-8?B?dlRxc0xOdXBFdkpaYVVkVzNMREdCMm1tZmJveDQzNTBTRVVkMVZrYjJRMmgv?=
 =?utf-8?B?d2NTSXdVR0VSRm1aa0pOODVxWldlOWdYcUZlcUovTFFxY3ROM0pTT2xSODQ3?=
 =?utf-8?B?aGpvMkFKYWxHdEI3alBUSExCMVQzUkJKNjNudHl3M0JDOTVTRlRuRmYwa0JD?=
 =?utf-8?B?QnRZaEl5RGREUTdzN1BnT3diWGI3T3oyZHNHaFNvU0Qvd2czaVJ5SGFhR1ZV?=
 =?utf-8?B?RlE0MW9RQW1MZFBwOTZ1cVFTUVVIdzFIU1FUQzdhS2pwUEdGc29Sc0ljT0lj?=
 =?utf-8?B?bVFDKzBKWmprNy9jS1VBLyt5VjNuV3M4OTliNEZxK2N5N0Zja1VGNmpSYVlG?=
 =?utf-8?Q?McbLooOHfcnb8EnxCX/g+3ICjcpaMM8USKZRC90?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97cdd29c-1540-4cf6-359d-08d982ce37ff
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 22:20:46.5515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Th1FGKuZaOgv0Mt2vo1dduZWcmqyp+dKpx/1I4qFxafu7vI/nbRcreVnHQLchBADaWmuQ6UqXLQ6S59fd2gcalJ4uLkw/VnrWS12hwxFeHc=
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

On 8/20/2021 15:44, Matthew Brost wrote:
> For some users of multi-lrc, e.g. split frame, it isn't safe to preempt
> mid BB. To safely enable preemption at the BB boundary, a handshake
> between to parent and child is needed. This is implemented via custom
> emit_bb_start & emit_fini_breadcrumb functions and enabled via by
via by -> by

> default if a context is configured by set parallel extension.
I tend to agree with Tvrtko that this should probably be an opt in 
change. Is there a flags word passed in when creating the context?

Also, it's not just a change in pre-emption behaviour but a change in 
synchronisation too, right? Previously, if you had a whole bunch of back 
to back submissions then one child could run ahead of another and/or the 
parent. After this change, there is a forced regroup at the end of each 
batch. So while one could end sooner/later than the others, they can't 
ever get an entire batch (or more) ahead or behind. Or was that 
synchronisation already in there through other means anyway?

>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       |   2 +-
>   drivers/gpu/drm/i915/gt/intel_context_types.h |   3 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   2 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 283 +++++++++++++++++-
>   4 files changed, 287 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 5615be32879c..2de62649e275 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -561,7 +561,7 @@ void intel_context_bind_parent_child(struct intel_context *parent,
>   	GEM_BUG_ON(intel_context_is_child(child));
>   	GEM_BUG_ON(intel_context_is_parent(child));
>   
> -	parent->guc_number_children++;
> +	child->guc_child_index = parent->guc_number_children++;
>   	list_add_tail(&child->guc_child_link,
>   		      &parent->guc_child_list);
>   	child->parent = parent;
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 713d85b0b364..727f91e7f7c2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -246,6 +246,9 @@ struct intel_context {
>   		/** @guc_number_children: number of children if parent */
>   		u8 guc_number_children;
>   
> +		/** @guc_child_index: index into guc_child_list if child */
> +		u8 guc_child_index;
> +
>   		/**
>   		 * @parent_page: page in context used by parent for work queue,
>   		 * work queue descriptor
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index 6cd26dc060d1..9f61cfa5566a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -188,7 +188,7 @@ struct guc_process_desc {
>   	u32 wq_status;
>   	u32 engine_presence;
>   	u32 priority;
> -	u32 reserved[30];
> +	u32 reserved[36];
What is this extra space for? All the extra storage is grabbed from 
after the end of this structure, isn't it?

>   } __packed;
>   
>   #define CONTEXT_REGISTRATION_FLAG_KMD	BIT(0)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 91330525330d..1a18f99bf12a 100644
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
> @@ -366,10 +367,14 @@ static struct i915_priolist *to_priolist(struct rb_node *rb)
>   
>   /*
>    * When using multi-lrc submission an extra page in the context state is
> - * reserved for the process descriptor and work queue.
> + * reserved for the process descriptor, work queue, and preempt BB boundary
> + * handshake between the parent + childlren contexts.
>    *
>    * The layout of this page is below:
>    * 0						guc_process_desc
> + * + sizeof(struct guc_process_desc)		child go
> + * + CACHELINE_BYTES				child join ...
> + * + CACHELINE_BYTES ...
Would be better written as '[num_children]' instead of '...' to make it 
clear it is a per child array.

Also, maybe create a struct for this to get rid of the magic '+1's and 
'BYTES / sizeof' constructs in the functions below.

>    * ...						unused
>    * PAGE_SIZE / 2				work queue start
>    * ...						work queue
> @@ -1785,6 +1790,30 @@ static int deregister_context(struct intel_context *ce, u32 guc_id, bool loop)
>   	return __guc_action_deregister_context(guc, guc_id, loop);
>   }
>   
> +static inline void clear_children_join_go_memory(struct intel_context *ce)
> +{
> +	u32 *mem = (u32 *)(__get_process_desc(ce) + 1);
> +	u8 i;
> +
> +	for (i = 0; i < ce->guc_number_children + 1; ++i)
> +		mem[i * (CACHELINE_BYTES / sizeof(u32))] = 0;
> +}
> +
> +static inline u32 get_children_go_value(struct intel_context *ce)
> +{
> +	u32 *mem = (u32 *)(__get_process_desc(ce) + 1);
> +
> +	return mem[0];
> +}
> +
> +static inline u32 get_children_join_value(struct intel_context *ce,
> +					  u8 child_index)
> +{
> +	u32 *mem = (u32 *)(__get_process_desc(ce) + 1);
> +
> +	return mem[(child_index + 1) * (CACHELINE_BYTES / sizeof(u32))];
> +}
> +
>   static void guc_context_policy_init(struct intel_engine_cs *engine,
>   				    struct guc_lrc_desc *desc)
>   {
> @@ -1867,6 +1896,8 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   			desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
>   			guc_context_policy_init(engine, desc);
>   		}
> +
> +		clear_children_join_go_memory(ce);
>   	}
>   
>   	/*
> @@ -2943,6 +2974,31 @@ static const struct intel_context_ops virtual_child_context_ops = {
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
> @@ -2978,6 +3034,20 @@ guc_create_parallel(struct intel_engine_cs **engines,
>   		}
>   	}
>   
> +	parent->engine->emit_bb_start =
> +		emit_bb_start_parent_no_preempt_mid_batch;
> +	parent->engine->emit_fini_breadcrumb =
> +		emit_fini_breadcrumb_parent_no_preempt_mid_batch;
> +	parent->engine->emit_fini_breadcrumb_dw =
> +		12 + 4 * parent->guc_number_children;
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
> @@ -3362,6 +3432,204 @@ void intel_guc_submission_init_early(struct intel_guc *guc)
>   	guc->submission_selected = __guc_submission_selected(guc);
>   }
>   
> +static inline u32 get_children_go_addr(struct intel_context *ce)
> +{
> +	GEM_BUG_ON(!intel_context_is_parent(ce));
> +
> +	return i915_ggtt_offset(ce->state) +
> +		__get_process_desc_offset(ce) +
> +		sizeof(struct guc_process_desc);
> +}
> +
> +static inline u32 get_children_join_addr(struct intel_context *ce,
> +					 u8 child_index)
> +{
> +	GEM_BUG_ON(!intel_context_is_parent(ce));
> +
> +	return get_children_go_addr(ce) + (child_index + 1) * CACHELINE_BYTES;
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
> +	cs = intel_ring_begin(rq, 10 + 4 * ce->guc_number_children);
> +	if (IS_ERR(cs))
> +		return PTR_ERR(cs);
> +
> +	/* Wait on chidlren */
chidlren -> children

> +	for (i = 0; i < ce->guc_number_children; ++i) {
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
> +				  get_children_join_addr(ce->parent,
> +							 ce->guc_child_index),
> +				  0);
> +
> +	/* Wait parent on for go */
parent on -> on parent

> +	*cs++ = (MI_SEMAPHORE_WAIT |
> +		 MI_SEMAPHORE_GLOBAL_GTT |
> +		 MI_SEMAPHORE_POLL |
> +		 MI_SEMAPHORE_SAD_EQ_SDD);
> +	*cs++ = CHILD_GO_BB;
> +	*cs++ = get_children_go_addr(ce->parent);
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
> +	for (i = 0; i < ce->guc_number_children; ++i) {
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
> +				  get_children_join_addr(ce->parent,
> +							 ce->guc_child_index),
> +				  0);
> +
This is backwards compared to the parent?

Parent: wait on children then enable pre-emption
Child: enable pre-emption then signal parent

Makes for a window where the parent is waiting in atomic context for a 
signal from a child that has been pre-empted and might not get to run 
for some time?

John.


> +	/* Wait parent on for go */
> +	*cs++ = (MI_SEMAPHORE_WAIT |
> +		 MI_SEMAPHORE_GLOBAL_GTT |
> +		 MI_SEMAPHORE_POLL |
> +		 MI_SEMAPHORE_SAD_EQ_SDD);
> +	*cs++ = CHILD_GO_FINI_BREADCRUMB;
> +	*cs++ = get_children_go_addr(ce->parent);
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
>   g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
>   {
> @@ -3807,6 +4075,19 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>   			drm_printf(p, "\t\tWQI Status: %u\n\n",
>   				   READ_ONCE(desc->wq_status));
>   
> +			drm_printf(p, "\t\tNumber Children: %u\n\n",
> +				   ce->guc_number_children);
> +			if (ce->engine->emit_bb_start ==
> +			    emit_bb_start_parent_no_preempt_mid_batch) {
> +				u8 i;
> +
> +				drm_printf(p, "\t\tChildren Go: %u\n\n",
> +					   get_children_go_value(ce));
> +				for (i = 0; i < ce->guc_number_children; ++i)
> +					drm_printf(p, "\t\tChildren Join: %u\n",
> +						   get_children_join_value(ce, i));
> +			}
> +
>   			for_each_child(ce, child)
>   				guc_log_context(p, child);
>   		}

