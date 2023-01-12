Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A87BF66841D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 21:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0B010E918;
	Thu, 12 Jan 2023 20:40:29 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB8A10E917;
 Thu, 12 Jan 2023 20:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673556027; x=1705092027;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yq1LWbdeq4ipzhdxDAN/uyzEl17cl/Rry+yfFFOVHpY=;
 b=kHadQs+SX2SQGdLkMoJfCTj1ZFItkns+1MVz2g5aSc8Wa8vnuMlbK9Wy
 mShRTp+xMM+Hy3TBUUlE8ffNO2iO34jVIIm5YKqvnurTwKrE12E4Q8R6h
 alN9V3XX6jbVIiMub7829lEfFXpRBQt+oNhIqWzdJ/h+PRflICmhBqMxg
 72jUUuMA+yfV70k1gMPT1Z14WqxQjhlbCeqz8A1wVfeeEOcxpcV3NnNXb
 /GpXrsqw3iVyJk0sxGos0bbyjLEy5zSmk654yMnBpTbWUO9qEBpdNkI7o
 3/G4Ql0ripctiMGYZKPg3gWb1rpBqmuMgP/m21SH+65G3SXCBEe4v7Gy7 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="386165409"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="386165409"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 12:40:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="721240737"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="721240737"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 12 Jan 2023 12:40:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 12:40:25 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 12 Jan 2023 12:40:25 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 12 Jan 2023 12:40:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bX8g7XwxjqdlnGOHkLn3gP7bjPJrk5xZ4+Gb1BjuYIymk3QCWdL7sBvuPmj+6yZH5SEtIIuKXLjZfcXap0YDnuPsF8et39abChvsLhXi1Ks2wuFqyuIyHLI0X1QmFQ9awMbuF4fHcMKUdyelK9EhNtliVQaehMTjwo/166k4m2pvFRNZw115pQL3RB7gz17hyIxa44OIm9GTIKNkPVzrGYnOIckvWecHMdGFjLk/Eif3YG56XQhCM9BbUaIDLEXz8yy7XocdAhroTq84NSTZCP4gctE6r/Ap6lBFCJz/NkB3nATtR3tcCwZLy/wqRRjLNZTxQe4FEJNSu92agI/Dvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9TvxMeyo+dlWLoNNUuLWm+vR0nNFNGBN1poDYjSebo=;
 b=PVmMHGCfGuCvbbG7tDw5kNTV2Q4u0gO2BoPj4eN1WHKHs+tzNwpL+yJBtsAMUHpc5pldabhLLu7u1oRZWpcmsS84Az8JENt64JCcDsln6hAF9FpAoGX8zAO8QbcjWLahc0HMMrPSDPdMhnkrM723iOFpd+dKKVgyW7ddy0bbMrijjOA9hc1HZ4tIZVaPZ1oWX6nXYTP28AAKzWpx7LSBrlmrP2UIecFY/wMnsH9nD8Gqs5dD4DpBUEWID4nGQXbFiImR6cG1KjIVFdOBKgXt+tnV8+HKwIgn5ZLSbrMBdfvmrvKPjFqIaCEhEhomag0OU9HU/QxJptdMyllXBouw8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM4PR11MB6215.namprd11.prod.outlook.com (2603:10b6:8:a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 20:40:23 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ec2f:4a87:326b:2610]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ec2f:4a87:326b:2610%7]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 20:40:23 +0000
Message-ID: <79cd935a-5a7f-b709-ec05-c9cf5801f2dc@intel.com>
Date: Thu, 12 Jan 2023 12:40:20 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915: Allow error capture without a
 request
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230112025311.2577084-1-John.C.Harrison@Intel.com>
 <20230112025311.2577084-2-John.C.Harrison@Intel.com>
 <f5edb1fa-6aba-1e02-f238-518518337f11@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <f5edb1fa-6aba-1e02-f238-518518337f11@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0092.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::33) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM4PR11MB6215:EE_
X-MS-Office365-Filtering-Correlation-Id: 7afc89cc-9e49-4327-0b1f-08daf4dd3a38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XjcjViucNfF7Qxi98Ki8u0XG1hVoMjYp5mjshp5jbAZFhsujd8DWPoVqoNxWh4mQlQhpR4ebN1gxQHdrzwAqiOPSacY+ockNaT2Kxy5oS0CdGq5mtskYevLPE36vcJN5cw5qa/fZsNIoZtb/UWaRKAPSeuA5a6+llFDu/ccan9E0tZvmsYvJA1cxEKbLLHNrVtrtPXkEWyeAq1/loxBIaZ96XUFIhvhjDky38/UjAbCYFyClqXP7yjahzq9Ap61WBSKVL50Kl7DEfL8bUaHx0/JXKPstfj38GChrcsSkOvfQXthzfi90fF7eE++v+PYXo6rdM+QnvRmwYB9RvQic39Y7Kc2njL5kA7vB4aqgqQBV6YGpb0YM7w4DIxRBcCj8ydG5X8PkLCzcpZ2YyUmbyhB+nxHdfuGD6kODLs4kfdk20LPsfszedrO1yHbD3G2heQsPOK+vaNpYvs7Vx4erig2KDYLM1K8rUbkpxLIBnCog42POMRl9TG3Xe4JVaAnkdlvT27seidK0veWpgZt3t4IOIbA3k4BAXIKoIfQobzFXjXRM2sAyysGCGYxyOZUwj5VFkSVgcsTho2zDtG0zxULoJdtfefaMA9SM6DhSRH3SR7DdJcyfcXcSaJSsIIk8fkrm9SP/y6IIFy1uPoOja6+xSD85WOp/9UFKIAdjawlmopTT39L+78frhMM6KoMSr4i7Jb5zkJGB0VXmWaCP63xMzS/xVej2r+Ek4TbTY8E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(39860400002)(136003)(366004)(376002)(451199015)(6506007)(38100700002)(82960400001)(31686004)(53546011)(2906002)(478600001)(6486002)(2616005)(86362001)(26005)(6512007)(186003)(5660300002)(316002)(83380400001)(8936002)(36756003)(8676002)(41300700001)(31696002)(66946007)(66556008)(66476007)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWErRXZENWdWKzRUZ1Y1VkdRNmRhUmZab1Z0c2UySXRkdU85dFVvU3hpNEFn?=
 =?utf-8?B?dXRUY0t2Wk5ubXBycVBRZ296TVA0YWNEeW0ySFhBbFFlejNOWi9aQ3lLZ29R?=
 =?utf-8?B?Y0lMbjIwT2UxVFZuV1ZtczZJQWtubmoyd1VPeDBYOS9TbnRQcEI0aXpnVW56?=
 =?utf-8?B?bEF1MnZkbGpOMldUcDQzZEhkRmpxcHdtTzgvaUJNT0hpR0NIYUpUYzhtTWlL?=
 =?utf-8?B?SE1DZlk2WXhTS3pVeVFQUTAwOVFBMCtLMkxkL0NBbnZQZWxZZDZhMVY4YXJs?=
 =?utf-8?B?MStOckN1RWlrOUE3WlhwcWlQT3gxalYyU1JGK2k5cU5RMnJYVEJBTFJkVURO?=
 =?utf-8?B?NXlRRktML01lZjFjNW9JRlVnbG4ranlZTWkrWGZJRW9kaTQ1NGlPa3BaNTY0?=
 =?utf-8?B?QkNxR3FpQXp6UHB5QWVKOVJtQm5uYm1pcDVidlJ5WmJsUmUrSS9uLzEwOElo?=
 =?utf-8?B?OFBxT2hudTBkQjBEZS90bW1rMzJxbHBxTEdXWlVtUEdua0QwQ2MwS09kMFJn?=
 =?utf-8?B?SjVHNVU4SDM3ZGVwRjR6c2FKZm1hM1o0eXdnTEZlTXNhUm9CbE04QXVHd0x1?=
 =?utf-8?B?Z01VWklPbzcyaVViUEwwTjBycG5qY3d5NmkzWThsbVNhSEFVYWtUNnhMY3M0?=
 =?utf-8?B?SUtYZ3dXaG9ZK2Z6b21TTEdReU5NNnNFcHNxVUNOd2d4S0ttQ3JVLzFOVi94?=
 =?utf-8?B?clVTWXIrd0pESkRkTFphSlNJdzduczk0SXFkQk41R2o1ZjkrbFFZMW1HQkRH?=
 =?utf-8?B?L0pjSk03TVAybWM5MXpMOUpMZEZWRkdrbzVlRDdjNzRYSm1zS3MwVWw2RXZ0?=
 =?utf-8?B?ellRTGV3cmpJbUhadU9ZWjJ5dUFKTWdJQmRGSDl2eU5hcEZ6TWVacmo0MXg4?=
 =?utf-8?B?OU9tOWpQRlFXLzlZbVpJRE9Dby9jWFJ4UEpSQjNNbkQwZFI2YUhBeFZ0UHh6?=
 =?utf-8?B?K0RtZitpWmlKVzVwMHRDeFZGN1ZBWnB4V0o0U0RtSWF0UmtaY3FQUE51S0lL?=
 =?utf-8?B?bjN5YnhMSFF5NzN6VitzS1lZRXN3SVoyTkVCMmZPZGNuUmhwanFsaU4wd0FN?=
 =?utf-8?B?NUoyMWw5MFMranpVT2VLZ1Z5ZVJYMmZ4TjVXR0VzRXhXNkI0NE82am41LzJz?=
 =?utf-8?B?SU5XY3F5S0szR2RFQUhHYmpiZmhkb0kyRWNqWHBkY29ibmE3c0hsN0RHblEv?=
 =?utf-8?B?aTJENXJ6SHNWbWF2ZmFKdzN4N09MSjdQRWFRK05UalRMbmhvZHM5d1dOSVVO?=
 =?utf-8?B?RHNabm4vYVZSRmNSRlpScVI0a3ZEWm0wa0QwZmFaV00rTWNkLzY5ZG1heXE5?=
 =?utf-8?B?TVhGaVorM0tDRmpNeDBBRVVQQ2RZanF5bklmbm0zTE1OVlBjTndGbmFUMDBZ?=
 =?utf-8?B?YkVmaHZzV2l2Z3kwSjdjY2p3YWNJMXhQZXhiUW1oOWhPYnUzMXZRV0xhS1Ru?=
 =?utf-8?B?OXZqZVQzZE95YlhRMksrWHlSNGJOOUNVNUpaM0FBQ1BmYmI0d0FpcmJwTzdJ?=
 =?utf-8?B?NGN2a1NIa1pwV2FIY0xWMUNwWEdjbmM3M3JjMDB1VUZka2lya3RwY1NBUE90?=
 =?utf-8?B?ZE9QcFJ2SFplQmxGdzZZK21rYUoxaXRISnRmWXlGTzNPQXI1ODh2MFpHME9y?=
 =?utf-8?B?WHI3NjBmLzNJSDFrR1R0RXhFV0lFRVBVRlpkZWkwbFJWU2tCS3hUMkN4S3pl?=
 =?utf-8?B?RmtSOWtqL2JRQ3M0Nk9UWTRLMCs2ZDhqWDY5TGdZTityWEVhWjFsOG42N2pn?=
 =?utf-8?B?WkJQWFhmVTh5VFVIaGpydDVDbTlzTXR2V1FBK0IxNVlqbng5dzNsT2o4eUo3?=
 =?utf-8?B?eU02ZEZlblphSEkwVlZVeE9yQjQxTUl2VGovd1pxYzQ2Rnd0cVZIVVpEbkIr?=
 =?utf-8?B?L3p1VFZkdGpYKzRpcXRWd1gyYXBBZnZ1V2FqdGVmeEtlVThMRDBnMHZyMEpy?=
 =?utf-8?B?dzB2KzdOc09CbSt5RjdhUWxyTUlNcUR4bm9kSThNT3AwcndnR1ZWNDF5Ny8y?=
 =?utf-8?B?OG85UGZrQ0xTNCt1V3dNQTdIdTZibXN1citwWnp6RkZMWEJyNS8vRU9YNHVH?=
 =?utf-8?B?alIwMkNiWUJpeVhTd2llSGh4QzcvaEczRVBjczlXYVp0bGFOVHdSRWZCR0Nu?=
 =?utf-8?B?dXd4Vng1MFVRTng1eTd4UUlrV2Jud0NkRXdSYkVTQWxqbmtSSk0yaC96VGlx?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7afc89cc-9e49-4327-0b1f-08daf4dd3a38
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 20:40:23.2422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q1/zDam8At2vY/hv/cJIbCr+ToFlRY/vyanmORFqrf2F3yjck7Y2u2BMV+8lXOGPx9YrYJqqeZMpJ1EyUjrEyfeUFljU0+XxtxwJQu2Zz7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6215
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/12/2023 02:01, Tvrtko Ursulin wrote:
> On 12/01/2023 02:53, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> There was a report of error captures occurring without any hung
>> context being indicated despite the capture being initiated by a 'hung
>> context notification' from GuC. The problem was not reproducible.
>> However, it is possible to happen if the context in question has no
>> active requests. For example, if the hang was in the context switch
>> itself then the breadcrumb write would have occurred and the KMD would
>> see an idle context.
>>
>> In the interests of attempting to provide as much information as
>> possible about a hang, it seems wise to include the engine info
>> regardless of whether a request was found or not. As opposed to just
>> prentending there was no hang at all.
>>
>> So update the error capture code to always record engine information
>> if an engine is given. Which means updating record_context() to take a
>> context instead of a request (which it only ever used to find the
>> context anyway). And split the request agnostic parts of
>> intel_engine_coredump_add_request() out into a seaprate function.
>>
>> v2: Remove a duplicate 'if' statement (Umesh) and fix a put of a null
>> pointer.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_gpu_error.c | 61 +++++++++++++++++++--------
>>   1 file changed, 43 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c 
>> b/drivers/gpu/drm/i915/i915_gpu_error.c
>> index 9d5d5a397b64e..bd2cf7d235df0 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>> @@ -1370,14 +1370,14 @@ static void engine_record_execlists(struct 
>> intel_engine_coredump *ee)
>>   }
>>     static bool record_context(struct i915_gem_context_coredump *e,
>> -               const struct i915_request *rq)
>> +               struct intel_context *ce)
>>   {
>>       struct i915_gem_context *ctx;
>>       struct task_struct *task;
>>       bool simulated;
>>         rcu_read_lock();
>> -    ctx = rcu_dereference(rq->context->gem_context);
>> +    ctx = rcu_dereference(ce->gem_context);
>>       if (ctx && !kref_get_unless_zero(&ctx->ref))
>>           ctx = NULL;
>>       rcu_read_unlock();
>> @@ -1396,8 +1396,8 @@ static bool record_context(struct 
>> i915_gem_context_coredump *e,
>>       e->guilty = atomic_read(&ctx->guilty_count);
>>       e->active = atomic_read(&ctx->active_count);
>>   -    e->total_runtime = 
>> intel_context_get_total_runtime_ns(rq->context);
>> -    e->avg_runtime = intel_context_get_avg_runtime_ns(rq->context);
>> +    e->total_runtime = intel_context_get_total_runtime_ns(ce);
>> +    e->avg_runtime = intel_context_get_avg_runtime_ns(ce);
>>         simulated = i915_gem_context_no_error_capture(ctx);
>>   @@ -1532,15 +1532,37 @@ intel_engine_coredump_alloc(struct 
>> intel_engine_cs *engine, gfp_t gfp, u32 dump_
>>       return ee;
>>   }
>>   +static struct intel_engine_capture_vma *
>> +engine_coredump_add_context(struct intel_engine_coredump *ee,
>> +                struct intel_context *ce,
>> +                gfp_t gfp)
>> +{
>> +    struct intel_engine_capture_vma *vma = NULL;
>> +
>> +    ee->simulated |= record_context(&ee->context, ce);
>> +    if (ee->simulated)
>> +        return NULL;
>> +
>> +    /*
>> +     * We need to copy these to an anonymous buffer
>> +     * as the simplest method to avoid being overwritten
>> +     * by userspace.
>> +     */
>> +    vma = capture_vma(vma, ce->ring->vma, "ring", gfp);
>> +    vma = capture_vma(vma, ce->state, "HW context", gfp);
>> +
>> +    return vma;
>> +}
>> +
>>   struct intel_engine_capture_vma *
>>   intel_engine_coredump_add_request(struct intel_engine_coredump *ee,
>>                     struct i915_request *rq,
>>                     gfp_t gfp)
>>   {
>> -    struct intel_engine_capture_vma *vma = NULL;
>> +    struct intel_engine_capture_vma *vma;
>>   -    ee->simulated |= record_context(&ee->context, rq);
>> -    if (ee->simulated)
>> +    vma = engine_coredump_add_context(ee, rq->context, gfp);
>> +    if (!vma)
>>           return NULL;
>>         /*
>> @@ -1550,8 +1572,6 @@ intel_engine_coredump_add_request(struct 
>> intel_engine_coredump *ee,
>>        */
>>       vma = capture_vma_snapshot(vma, rq->batch_res, gfp, "batch");
>>       vma = capture_user(vma, rq, gfp);
>> -    vma = capture_vma(vma, rq->ring->vma, "ring", gfp);
>> -    vma = capture_vma(vma, rq->context->state, "HW context", gfp);
>>         ee->rq_head = rq->head;
>>       ee->rq_post = rq->postfix;
>> @@ -1608,8 +1628,11 @@ capture_engine(struct intel_engine_cs *engine,
>>       if (ce) {
>>           intel_engine_clear_hung_context(engine);
>>           rq = intel_context_find_active_request(ce);
>> -        if (!rq || !i915_request_started(rq))
>> -            goto no_request_capture;
>> +        if (rq && !i915_request_started(rq)) {
>> +            drm_info(&engine->gt->i915->drm, "Got hung context on %s 
>> with no active request!\n",
>
> Suggest s/active/started/ since we have both i915_request_active and 
> i915_request_started, so to align the terminology.
The message text was based on the intent of the activity not the naming 
of some internal helper function. Can change it if you really want but 
"with no started request" just reads like bad English to me. Plus it 
gets removed in the next patch anyway...


>
>> +                 engine->name);
>> +            rq = NULL;
>> +        }
>>       } else {
>>           /*
>>            * Getting here with GuC enabled means it is a forced error 
>> capture
>> @@ -1622,22 +1645,24 @@ capture_engine(struct intel_engine_cs *engine,
>>                              flags);
>>           }
>>       }
>> -    if (rq)
>> +    if (rq) {
>>           rq = i915_request_get_rcu(rq);
>> +        capture = intel_engine_coredump_add_request(ee, rq, 
>> ATOMIC_MAYFAIL);
>> +    } else if (ce) {
>> +        capture = engine_coredump_add_context(ee, ce, ATOMIC_MAYFAIL);
>> +    }
>>   -    if (!rq)
>> -        goto no_request_capture;
>> -
>> -    capture = intel_engine_coredump_add_request(ee, rq, 
>> ATOMIC_MAYFAIL);
>>       if (!capture) {
>> -        i915_request_put(rq);
>> +        if (rq)
>> +            i915_request_put(rq);
>>           goto no_request_capture;
>>       }
>>       if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
>>           intel_guc_capture_get_matching_node(engine->gt, ee, ce);
>
> This step requires non-NULL ce, so if you move it under the "else if 
> (ce)" above then I *think* exit from the function can be consolidated 
> to just:
>
> if (capture) {
>     intel_engine_coredump_add_vma(ee, capture, compress);
>     if (rq)
>         i915_request_put(rq);
Is there any reason the rq ref needs to be held during the add_vma call? 
Can it now just be moved earlier to be:
     if (rq) {
         rq = i915_request_get_rcu(rq);
         capture = intel_engine_coredump_add_request(ee, rq, 
ATOMIC_MAYFAIL);
         i915_request_put(rq);
     }

The internals of the request object are only touched in the above 
_add_request() code. The later _add_vma() call fiddles around with vmas 
that pulled from the request but the capture_vma code inside 
_add_request() has already copied everything, hasn't it? Or rather, it 
has grabbed its own private vma resource locks. So there is no 
requirement to keep the request itself around still?

John.


> } else {
>     kfree(ee);
>     ee = NULL;
> }
>
> return ee;
>
> No "if (rq) i915_request_put()" twice, and goto label can be 
> completely removed.
>
> Regards,
>
> Tvrtko
>
>>         intel_engine_coredump_add_vma(ee, capture, compress);
>> -    i915_request_put(rq);
>> +    if (rq)
>> +        i915_request_put(rq);
>>         return ee;

