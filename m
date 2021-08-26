Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8E63F7F8B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 02:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4496E450;
	Thu, 26 Aug 2021 00:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0CD6E44E;
 Thu, 26 Aug 2021 00:54:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="217361446"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="217361446"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 17:54:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="684702643"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga006.fm.intel.com with ESMTP; 25 Aug 2021 17:54:43 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 25 Aug 2021 17:54:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 25 Aug 2021 17:54:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 25 Aug 2021 17:54:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 25 Aug 2021 17:54:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5FkULKRe2juuSXGYoV79oSk6msRAu3f/WVnv1i/+WsJZfiR+YlsrpVPLB3BuapjjcENzVhnmb+O+C0Y4wF+CRc797Y5VavgnM8enJIf8BW59yIInlr3QKt5ri6kxVN/j+VDaSpQ2YNoZCQnr0LjmrCmtKMHWZW+MnJwrp+qzcE+FTSWVKkuSQwT3Zh4nNI4ghtaIAeHjsvdDx1Pa8dP/mdE2AkDzBrJYlntA1DuKwfckRHp7wZ9qJNEfx9RZoQybyyZieNLZsnqkYlybtJnSa6OWxpqoRL7iC9YnWMD7bpEfffOC4DTLHDto/z/H2s/p4wvTo4BCBR38gyepn0rEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DKcdJbQq+hJ1lQsopuZxFGEypYpQzIhGCHJbxOQS1k=;
 b=WKwIs+Job3xxHxiJXTCIity9w0nM6Y9XLwobUnblCssb+Rs1dpbbb5i6PfM1vc7XWhqJc2tSh/cpF/6nQDRKhhvctDw3lpwv96qTJg4JbSn5r7woAxmIIXmaItTGJN5QM/+CK6nImvVDpZzE6dkz2mmkMf0dXTrxrVlUwP9jFiUqqN2iyGVDBCLr6nwbojxZ5Tday/2sQjIsc9vCfKT89VAW0Bnuv8+tFeSt/OlIJjCPAUM27b1ZQiFY2PTxjqkW4cf6cF2PPRGVUBMVT+zcNpgzK3oTS3QmNnEp63hrZvcejmCGVtsvF9W8N0Esi1tVGc4bNpG+0h3eDnmQOJpqRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DKcdJbQq+hJ1lQsopuZxFGEypYpQzIhGCHJbxOQS1k=;
 b=x1taoD6GVmO5YQFR9NhgWUVFvytzsEHeHKU5ove2RayvJrXhEOQbgSF2LrAoW6RzvjUiBIHWYpH0F6GSJ+Apr/HfauLiJTYQJ9+IUHyiL66ShSY5WAeFcz+YzxyVtQ3eFgYwPXGjp+qBbUYN6BWSLdJeYGMcJB3boUaqITqzfkk=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18; Thu, 26 Aug 2021 00:54:41 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165%7]) with mapi id 15.20.4457.019; Thu, 26 Aug 2021
 00:54:41 +0000
Subject: Re: [PATCH 25/27] drm/i915/guc: Drop guc_active move everything into
 guc_state
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-26-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <493611a5-9bd0-80bc-55a9-83c321c4b1de@intel.com>
Date: Wed, 25 Aug 2021 17:54:38 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210819061639.21051-26-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BYAPR11CA0087.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::28) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 BYAPR11CA0087.namprd11.prod.outlook.com (2603:10b6:a03:f4::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 00:54:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85e920d8-5a04-4a94-95f4-08d9682c1652
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB4564F4285233FA764A953B32F4C79@DM6PR11MB4564.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c11TSaI6nUDymm85vcadRtY8yd+bFwb2xEB2LrSK1lcY00xd0wJ0VMEZ9jcNlvitIioqQmRG2iBA8nODQaU8Lp7DBkUicfSr5+ptPLodEN7IRscEX1ribnlJg9VnFKEnAus2d3ZfAWhL7n+lc6d2Z+JpFri+RYSi80eD91OlOEkCfEaWakWcs91R/k7b8PcdwH8AC+MzI9iY8aZWqMrcr//0DHpxRWtrc0GgYsORPOi2P4X1T5nzrB7gJwyv+y1ZDqSOieSQdZYss8/xWjFoAPrxDsdwXWkXDT2S6yh2VaDzXG1FWbxhL6MG+QI0pesLogfbWeR0bjhlZwTfnMRt3A63bJ8DLVO5naASR3PsxeU21sBte0gND2PdIb9yh19jBu1dqOonfhAILng2kOvr6uhYyhAZ2A3Pn+x2xrLu6le+0+gp69o+RuOupgJZByQlJSeKGT7wPUfpesGO2sUKi53syAGqUNHU5l2buq0UG9zAJIQCqyZ8DrVttwQl7XxsM1juiq62opadh9rHDMZaShs85W5oXCOrSWPLfVD7d1KUkp3YBb+tDhf6HeqV0igTsyhIJvThtowkv/DqU5SKvoz6HbcgAXZkKyyqrO5JUkIeZmCerRjJRUGsblIWM5dF9qX5hemeymcxP7OiOyfRUgG5aOb6h3wznlt3O9Wqh+4n9FMDGxQA0ADpmIllrD7g0xk/cqsJ2zrD2qXylz+8JLaa+TXnMHtib+iNROXYPwU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(53546011)(2906002)(66476007)(6486002)(66556008)(186003)(26005)(316002)(16576012)(86362001)(30864003)(5660300002)(83380400001)(31696002)(8936002)(8676002)(4326008)(2616005)(956004)(508600001)(36756003)(31686004)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEFsS0p2T2toQ1Bwd1Q0WU1iN1dKVFFmQ2tCQkFSQllkbmdZZmxQaU5Iby9T?=
 =?utf-8?B?QUYvOCtJYUNkV3lndHA3OHlkYnhiWjRxUGZGdGVVS2puNXNFMmJFL0MzVGxw?=
 =?utf-8?B?bVB2dHU2VHZob1k2RHhZWFhPYnJpOHhjVEt6WUp4TzNkQk5NcHNMTS9ZeTMw?=
 =?utf-8?B?TDlFVHgyQWhiZ0tuYUY0Z1ZmVW5qREErTHdkdTJ5dk5JMGlVSlZHd3h4R1Ev?=
 =?utf-8?B?R01XN0MyZjVzRWJac2tjRC9BL1FJK1NJSjFFaGtZQWUzSVJGelRBREtiT25m?=
 =?utf-8?B?UFR4RkQ2T3p6ek4wZmtMM2NyVHBBbVBYSW5vZGowckI0cXNLUkpRY25NaTFr?=
 =?utf-8?B?T1h5bkprR3NvOFRvd2tJekp6RzZ1aUdZdmN4RTg4ZTAzOWZFOGhwZDFGL0VP?=
 =?utf-8?B?T09Va3hRUFoxNEpyNnd5SkI1WXdod1A3WUFVVlhWL09oY0xFV0FzUVNMOWxH?=
 =?utf-8?B?UG1VSXB5OENqZ3J0TjF3cGViSEQvYThWdUthdXdtYTQwelRHSjlsWVVoQjRS?=
 =?utf-8?B?RWQvMlVkOVM3U3pTcDdWRUV0YVZvdVZzV3dmUlZZWDlpQWlTNVJPRTg0TDFN?=
 =?utf-8?B?WmtPUzc3MVdHMGF0OE91YnhBTThUeTMyMmNHNUtIRzJIakg2ZlZLeEpWQkRZ?=
 =?utf-8?B?Z2VKelJ1d1VJcWM0c20yRmdWRHNUTjNYUGx6ajBxZVQ3OHZhTDRpNys4N21h?=
 =?utf-8?B?aVNmVDRUZzc0ZHNsbDZESE9DVmM4RUJFcldGUHpabVJhemdJemtaa3UxdzY2?=
 =?utf-8?B?bi9kblRrc1lmVVp4NURzNW5ZN1NZY3lLNXhFMlVmaFdoRjNVYjFoMWo5Si9G?=
 =?utf-8?B?SkFjWkFSSjZqOU1zYW1JRVY5S01HZENEZXpTenpFaWhMaFh5YzJJY0tnWVZW?=
 =?utf-8?B?dFc5MTlKODMrTWttU25YTnhaczNmWThObWcveXRHR0trUVozVlZWSXNkcmZ4?=
 =?utf-8?B?V05RWFdjUWlVWmh1b2FnYXMyYlNQUU9YUiszckkxcUNoVWNNSjJLK0J1amFR?=
 =?utf-8?B?dWdLck9KYVZna2I5eXdoR1pRdFB2OVlZWkJJRzNqSzVHYjBkWTR4cDF4Slp6?=
 =?utf-8?B?L0pSbzExM3Rvb2FPcEtzcjBmanJUT2JoU0NLa0VtM1JPWkRRcnJrbmcySE03?=
 =?utf-8?B?QVhpNEs2aFZSM25zY08rZWljdnBzZXdHajF6NjBxUTRUME5iMVhCclM4K2Vl?=
 =?utf-8?B?RnovdkNzK3N5RHBFWFJuK0d6dVdxTXp5enVoYWtpY0NVUVNEWlRGZFczQUtU?=
 =?utf-8?B?SXNKNlpzN3U5V1llbVJRMlZQTWhOQmYvOUtkRFNWUy8xWmJSRldFVHFqdGpl?=
 =?utf-8?B?U0ZsNWlPYVBTMmhHMEVXSzkyUGxncjJxdTZJU3BNa3djSXgvUkpwbXNER3p6?=
 =?utf-8?B?RXE3anBiWERRTy83OG5oY2ViWjFKcWZWVW9rd2t0aHVpRTFNK25JdlhiOUxT?=
 =?utf-8?B?RnNlcG14Q3o3cnhKdGM3c0ZxZnVOd0FQQ1dLRUVSZnk2cXQyMzNvYUduWlQ2?=
 =?utf-8?B?S1JyRTJRenM2bklHcEUrcWNJcTJ1NUNoVURaajZNbHZJMG1WLzVoOU1CbHdR?=
 =?utf-8?B?aDFyVlVwWldBakhqWFoxYVVtdFlKaDZ2K1huQmx4c0xZcktNSVpCKytDNStj?=
 =?utf-8?B?SmZWblVFalU3dXhEaWdUTmhyOXdGQ3VzTm5Wa1Q3QmtYWDlzVTBTRWc3dkcw?=
 =?utf-8?B?RElKM0dad3dBdTZraHUrbm1GN256MEZJU0dwQmt1bFNBeVZibVlzaHAyZzFD?=
 =?utf-8?Q?LbswM0uPN4/fxOMwy2+MuvG/ZVip1YO2XJni/sG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e920d8-5a04-4a94-95f4-08d9682c1652
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 00:54:41.3977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: un4fzOz4Ig5wsIXreMQawAE2THVU+DgyFDtnmy0tQCZ41aU3CEdEStum2HuhiiVSOQ69ZOajbMNmBh8kD5f2BVmlzPL/RIa7b558gzQpgUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4564
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



On 8/18/2021 11:16 PM, Matthew Brost wrote:
> Now that we have locking hierarchy of sched_engine->lock ->
> ce->guc_state everything from guc_active can be moved into guc_state and
> protected the guc_state.lock.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       | 10 +--
>   drivers/gpu/drm/i915/gt/intel_context_types.h |  7 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 88 +++++++++----------
>   drivers/gpu/drm/i915/i915_trace.h             |  2 +-
>   4 files changed, 49 insertions(+), 58 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 87b84c1d5393..adfe49b53b1b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -394,9 +394,7 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
>   
>   	spin_lock_init(&ce->guc_state.lock);
>   	INIT_LIST_HEAD(&ce->guc_state.fences);
> -
> -	spin_lock_init(&ce->guc_active.lock);
> -	INIT_LIST_HEAD(&ce->guc_active.requests);
> +	INIT_LIST_HEAD(&ce->guc_state.requests);
>   
>   	ce->guc_id.id = GUC_INVALID_LRC_ID;
>   	INIT_LIST_HEAD(&ce->guc_id.link);
> @@ -521,15 +519,15 @@ struct i915_request *intel_context_find_active_request(struct intel_context *ce)
>   
>   	GEM_BUG_ON(!intel_engine_uses_guc(ce->engine));
>   
> -	spin_lock_irqsave(&ce->guc_active.lock, flags);
> -	list_for_each_entry_reverse(rq, &ce->guc_active.requests,
> +	spin_lock_irqsave(&ce->guc_state.lock, flags);
> +	list_for_each_entry_reverse(rq, &ce->guc_state.requests,
>   				    sched.link) {
>   		if (i915_request_completed(rq))
>   			break;
>   
>   		active = rq;
>   	}
> -	spin_unlock_irqrestore(&ce->guc_active.lock, flags);
> +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   
>   	return active;
>   }
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 7a1d1537cf67..66286ce36c84 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -172,11 +172,6 @@ struct intel_context {
>   		struct i915_sw_fence blocked_fence;
>   		/* GuC committed requests */
>   		int number_committed_requests;
> -	} guc_state;
> -
> -	struct {
> -		/** lock: protects everything in guc_active */
> -		spinlock_t lock;
>   		/** requests: active requests on this context */
>   		struct list_head requests;
>   		/*
> @@ -184,7 +179,7 @@ struct intel_context {
>   		 */
>   		u8 prio;
>   		u32 prio_count[GUC_CLIENT_PRIORITY_NUM];
> -	} guc_active;
> +	} guc_state;
>   
>   	struct {
>   		/* GuC LRC descriptor ID */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index c4c018348ac0..4b9a2f3774d5 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -827,9 +827,9 @@ __unwind_incomplete_requests(struct intel_context *ce)
>   	unsigned long flags;
>   
>   	spin_lock_irqsave(&sched_engine->lock, flags);
> -	spin_lock(&ce->guc_active.lock);
> +	spin_lock(&ce->guc_state.lock);
>   	list_for_each_entry_safe_reverse(rq, rn,
> -					 &ce->guc_active.requests,
> +					 &ce->guc_state.requests,
>   					 sched.link) {
>   		if (i915_request_completed(rq))
>   			continue;
> @@ -848,7 +848,7 @@ __unwind_incomplete_requests(struct intel_context *ce)
>   		list_add(&rq->sched.link, pl);
>   		set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
>   	}
> -	spin_unlock(&ce->guc_active.lock);
> +	spin_unlock(&ce->guc_state.lock);
>   	spin_unlock_irqrestore(&sched_engine->lock, flags);
>   }
>   
> @@ -945,10 +945,10 @@ static void guc_cancel_context_requests(struct intel_context *ce)
>   
>   	/* Mark all executing requests as skipped. */
>   	spin_lock_irqsave(&sched_engine->lock, flags);
> -	spin_lock(&ce->guc_active.lock);
> -	list_for_each_entry(rq, &ce->guc_active.requests, sched.link)
> +	spin_lock(&ce->guc_state.lock);
> +	list_for_each_entry(rq, &ce->guc_state.requests, sched.link)
>   		i915_request_put(i915_request_mark_eio(rq));
> -	spin_unlock(&ce->guc_active.lock);
> +	spin_unlock(&ce->guc_state.lock);
>   	spin_unlock_irqrestore(&sched_engine->lock, flags);
>   }
>   
> @@ -1400,7 +1400,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	desc->engine_submit_mask = adjust_engine_mask(engine->class,
>   						      engine->mask);
>   	desc->hw_context_desc = ce->lrc.lrca;
> -	desc->priority = ce->guc_active.prio;
> +	desc->priority = ce->guc_state.prio;
>   	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
>   	guc_context_policy_init(engine, desc);
>   
> @@ -1802,10 +1802,10 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
>   
>   static void __guc_context_destroy(struct intel_context *ce)
>   {
> -	GEM_BUG_ON(ce->guc_active.prio_count[GUC_CLIENT_PRIORITY_KMD_HIGH] ||
> -		   ce->guc_active.prio_count[GUC_CLIENT_PRIORITY_HIGH] ||
> -		   ce->guc_active.prio_count[GUC_CLIENT_PRIORITY_KMD_NORMAL] ||
> -		   ce->guc_active.prio_count[GUC_CLIENT_PRIORITY_NORMAL]);
> +	GEM_BUG_ON(ce->guc_state.prio_count[GUC_CLIENT_PRIORITY_KMD_HIGH] ||
> +		   ce->guc_state.prio_count[GUC_CLIENT_PRIORITY_HIGH] ||
> +		   ce->guc_state.prio_count[GUC_CLIENT_PRIORITY_KMD_NORMAL] ||
> +		   ce->guc_state.prio_count[GUC_CLIENT_PRIORITY_NORMAL]);
>   	GEM_BUG_ON(ce->guc_state.number_committed_requests);
>   
>   	lrc_fini(ce);
> @@ -1915,17 +1915,17 @@ static void guc_context_set_prio(struct intel_guc *guc,
>   
>   	GEM_BUG_ON(prio < GUC_CLIENT_PRIORITY_KMD_HIGH ||
>   		   prio > GUC_CLIENT_PRIORITY_NORMAL);
> -	lockdep_assert_held(&ce->guc_active.lock);
> +	lockdep_assert_held(&ce->guc_state.lock);
>   
> -	if (ce->guc_active.prio == prio || submission_disabled(guc) ||
> +	if (ce->guc_state.prio == prio || submission_disabled(guc) ||
>   	    !context_registered(ce)) {
> -		ce->guc_active.prio = prio;
> +		ce->guc_state.prio = prio;
>   		return;
>   	}
>   
>   	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
>   
> -	ce->guc_active.prio = prio;
> +	ce->guc_state.prio = prio;
>   	trace_intel_context_set_prio(ce);
>   }
>   
> @@ -1944,25 +1944,25 @@ static inline u8 map_i915_prio_to_guc_prio(int prio)
>   static inline void add_context_inflight_prio(struct intel_context *ce,
>   					     u8 guc_prio)
>   {
> -	lockdep_assert_held(&ce->guc_active.lock);
> -	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_active.prio_count));
> +	lockdep_assert_held(&ce->guc_state.lock);
> +	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_state.prio_count));
>   
> -	++ce->guc_active.prio_count[guc_prio];
> +	++ce->guc_state.prio_count[guc_prio];
>   
>   	/* Overflow protection */
> -	GEM_WARN_ON(!ce->guc_active.prio_count[guc_prio]);
> +	GEM_WARN_ON(!ce->guc_state.prio_count[guc_prio]);
>   }
>   
>   static inline void sub_context_inflight_prio(struct intel_context *ce,
>   					     u8 guc_prio)
>   {
> -	lockdep_assert_held(&ce->guc_active.lock);
> -	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_active.prio_count));
> +	lockdep_assert_held(&ce->guc_state.lock);
> +	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_state.prio_count));
>   
>   	/* Underflow protection */
> -	GEM_WARN_ON(!ce->guc_active.prio_count[guc_prio]);
> +	GEM_WARN_ON(!ce->guc_state.prio_count[guc_prio]);
>   
> -	--ce->guc_active.prio_count[guc_prio];
> +	--ce->guc_state.prio_count[guc_prio];
>   }
>   
>   static inline void update_context_prio(struct intel_context *ce)
> @@ -1973,10 +1973,10 @@ static inline void update_context_prio(struct intel_context *ce)
>   	BUILD_BUG_ON(GUC_CLIENT_PRIORITY_KMD_HIGH != 0);
>   	BUILD_BUG_ON(GUC_CLIENT_PRIORITY_KMD_HIGH > GUC_CLIENT_PRIORITY_NORMAL);
>   
> -	lockdep_assert_held(&ce->guc_active.lock);
> +	lockdep_assert_held(&ce->guc_state.lock);
>   
> -	for (i = 0; i < ARRAY_SIZE(ce->guc_active.prio_count); ++i) {
> -		if (ce->guc_active.prio_count[i]) {
> +	for (i = 0; i < ARRAY_SIZE(ce->guc_state.prio_count); ++i) {
> +		if (ce->guc_state.prio_count[i]) {
>   			guc_context_set_prio(guc, ce, i);
>   			break;
>   		}
> @@ -1996,8 +1996,8 @@ static void add_to_context(struct i915_request *rq)
>   
>   	GEM_BUG_ON(rq->guc_prio == GUC_PRIO_FINI);
>   
> -	spin_lock(&ce->guc_active.lock);
> -	list_move_tail(&rq->sched.link, &ce->guc_active.requests);
> +	spin_lock(&ce->guc_state.lock);
> +	list_move_tail(&rq->sched.link, &ce->guc_state.requests);
>   
>   	if (rq->guc_prio == GUC_PRIO_INIT) {
>   		rq->guc_prio = new_guc_prio;
> @@ -2009,12 +2009,12 @@ static void add_to_context(struct i915_request *rq)
>   	}
>   	update_context_prio(ce);
>   
> -	spin_unlock(&ce->guc_active.lock);
> +	spin_unlock(&ce->guc_state.lock);
>   }
>   
>   static void guc_prio_fini(struct i915_request *rq, struct intel_context *ce)
>   {
> -	lockdep_assert_held(&ce->guc_active.lock);
> +	lockdep_assert_held(&ce->guc_state.lock);
>   
>   	if (rq->guc_prio != GUC_PRIO_INIT &&
>   	    rq->guc_prio != GUC_PRIO_FINI) {
> @@ -2028,7 +2028,7 @@ static void remove_from_context(struct i915_request *rq)
>   {
>   	struct intel_context *ce = rq->context;
>   
> -	spin_lock_irq(&ce->guc_active.lock);
> +	spin_lock_irq(&ce->guc_state.lock);
>   
>   	list_del_init(&rq->sched.link);
>   	clear_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
> @@ -2038,10 +2038,8 @@ static void remove_from_context(struct i915_request *rq)
>   
>   	guc_prio_fini(rq, ce);
>   
> -	spin_unlock_irq(&ce->guc_active.lock);
> -
> -	spin_lock_irq(&ce->guc_state.lock);
>   	decr_context_committed_requests(ce);
> +
>   	spin_unlock_irq(&ce->guc_state.lock);
>   
>   	atomic_dec(&ce->guc_id.ref);
> @@ -2126,7 +2124,7 @@ static void guc_context_init(struct intel_context *ce)
>   		prio = ctx->sched.priority;
>   	rcu_read_unlock();
>   
> -	ce->guc_active.prio = map_i915_prio_to_guc_prio(prio);
> +	ce->guc_state.prio = map_i915_prio_to_guc_prio(prio);
>   }
>   
>   static int guc_request_alloc(struct i915_request *rq)
> @@ -2359,7 +2357,7 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
>   	     !new_guc_prio_higher(rq->guc_prio, new_guc_prio)))
>   		return;
>   
> -	spin_lock(&ce->guc_active.lock);
> +	spin_lock(&ce->guc_state.lock);
>   	if (rq->guc_prio != GUC_PRIO_FINI) {
>   		if (rq->guc_prio != GUC_PRIO_INIT)
>   			sub_context_inflight_prio(ce, rq->guc_prio);
> @@ -2367,16 +2365,16 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
>   		add_context_inflight_prio(ce, rq->guc_prio);
>   		update_context_prio(ce);
>   	}
> -	spin_unlock(&ce->guc_active.lock);
> +	spin_unlock(&ce->guc_state.lock);
>   }
>   
>   static void guc_retire_inflight_request_prio(struct i915_request *rq)
>   {
>   	struct intel_context *ce = rq->context;
>   
> -	spin_lock(&ce->guc_active.lock);
> +	spin_lock(&ce->guc_state.lock);
>   	guc_prio_fini(rq, ce);
> -	spin_unlock(&ce->guc_active.lock);
> +	spin_unlock(&ce->guc_state.lock);
>   }
>   
>   static void sanitize_hwsp(struct intel_engine_cs *engine)
> @@ -2942,7 +2940,7 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
>   				goto next;
>   		}
>   
> -		list_for_each_entry(rq, &ce->guc_active.requests, sched.link) {
> +		list_for_each_entry(rq, &ce->guc_state.requests, sched.link) {
>   			if (i915_test_request_state(rq) != I915_REQUEST_ACTIVE)
>   				continue;
>   
> @@ -2993,10 +2991,10 @@ void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
>   				goto next;
>   		}
>   
> -		spin_lock(&ce->guc_active.lock);
> -		intel_engine_dump_active_requests(&ce->guc_active.requests,
> +		spin_lock(&ce->guc_state.lock);
> +		intel_engine_dump_active_requests(&ce->guc_state.requests,
>   						  hung_rq, m);
> -		spin_unlock(&ce->guc_active.lock);
> +		spin_unlock(&ce->guc_state.lock);
>   
>   next:
>   		intel_context_put(ce);
> @@ -3040,12 +3038,12 @@ static inline void guc_log_context_priority(struct drm_printer *p,
>   {
>   	int i;
>   
> -	drm_printf(p, "\t\tPriority: %d\n", ce->guc_active.prio);
> +	drm_printf(p, "\t\tPriority: %d\n", ce->guc_state.prio);
>   	drm_printf(p, "\t\tNumber Requests (lower index == higher priority)\n");
>   	for (i = GUC_CLIENT_PRIORITY_KMD_HIGH;
>   	     i < GUC_CLIENT_PRIORITY_NUM; ++i) {
>   		drm_printf(p, "\t\tNumber requests in priority band[%d]: %d\n",
> -			   i, ce->guc_active.prio_count[i]);
> +			   i, ce->guc_state.prio_count[i]);
>   	}
>   	drm_printf(p, "\n");
>   }
> diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
> index 0574f5c7a985..ec7fe12b94aa 100644
> --- a/drivers/gpu/drm/i915/i915_trace.h
> +++ b/drivers/gpu/drm/i915/i915_trace.h
> @@ -910,7 +910,7 @@ DECLARE_EVENT_CLASS(intel_context,
>   			   __entry->guc_id = ce->guc_id.id;
>   			   __entry->pin_count = atomic_read(&ce->pin_count);
>   			   __entry->sched_state = ce->guc_state.sched_state;
> -			   __entry->guc_prio = ce->guc_active.prio;
> +			   __entry->guc_prio = ce->guc_state.prio;
>   			   ),
>   
>   		    TP_printk("guc_id=%d, pin_count=%d sched_state=0x%x, guc_prio=%u",

