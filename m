Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F6F3C95BE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 03:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7966E43D;
	Thu, 15 Jul 2021 01:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD876E43D;
 Thu, 15 Jul 2021 01:51:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="197641512"
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="197641512"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 18:51:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="494840205"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Jul 2021 18:51:45 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 14 Jul 2021 18:51:45 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 14 Jul 2021 18:51:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 14 Jul 2021 18:51:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 14 Jul 2021 18:51:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOxuSJTMGdoeVu61BeCSe85Szz+aY0B5mtP7W/aLNYyPUXnIWVgqFffS7TXSnqQrfEnc1+fWWYNQ4132imHYoaQ1OyOctBFhm9njnINyKxCRvoPIdVwmg1HxDIUZVMLqrxn/wYbqD7tQuHYZygMXRVCtwUlfmlOE1FDdeTNhzelv+Q08WSiO8B4jskciQqUjv+6KbfK1beDC58F4xMFFH1gd8E+RCh+Aram4lQpl/gLD+p+tvPnoE46Ba/SWE9ZM49XQf5z0+6AoQl4saRHzVvpSRz8eUg4jTcgXcMcC6hzzNb+jSV+VrGiz9DgA6ulqR/MU4x6NhwFFri7AeLiCLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+mDXpBkK6TTb7yAzOf7j78HwaEQ4Uzaicpmmc8RzCU=;
 b=d7QCpf+o8dX57bFZbOoWYLeCZQQp8M8pa2J+B/C0BSkteove/n9a4A2qU1dgj/wawtvncKWTKxECfn9fac5uWTK3Ln+gjtoLIt8UykIH7TEPppHWEP3vbTTDgb0yvDNiVfBZfo9r/G/Z2wr8iFsxd66iQYn3Blu4V5Y2cwgz/1Lwk/qxIzbSSy3r4AcC6UY+nPzv5pcBqKL6nqQtbYO90qNSkRN2uYDp56w2qa1oQcNU4cVWru2pgk3UP2o5YdTAB5KwiL/a1ZTORqhhWVeCFF7R2vnZFdUyVktYbisIWc1cfdUNj1Oimp8CbcL/ZLux/F3hHTX/rfnVbgQu8lOUXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+mDXpBkK6TTb7yAzOf7j78HwaEQ4Uzaicpmmc8RzCU=;
 b=PoMRCoGRb5kWFhfO0g21qeDCHLssTAizATexCCpI0uzVTvYY6nv1r9mZdFqNuE7tcylnrb9mRYXsHYvtnGRZmvIiBX+oTIjLJ4AQKTrIqgNE1rjPWYBT5MMs5D+y/W5pvXfaAseoOwRZXY9LA3miV4zBUds2oO1C5oHqNXEwYeg=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM4PR11MB5359.namprd11.prod.outlook.com (2603:10b6:5:396::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21; Thu, 15 Jul 2021 01:51:43 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7%9]) with mapi id 15.20.4331.022; Thu, 15 Jul 2021
 01:51:43 +0000
Subject: Re: [PATCH 19/47] drm/i915/guc: Ensure request ordering via
 completion fences
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-20-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <0c7a3723-ff70-3c05-326c-1af13fa1bc57@intel.com>
Date: Wed, 14 Jul 2021 18:51:39 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
In-Reply-To: <20210624070516.21893-20-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: CO2PR18CA0052.namprd18.prod.outlook.com
 (2603:10b6:104:2::20) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 CO2PR18CA0052.namprd18.prod.outlook.com (2603:10b6:104:2::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 01:51:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b69a33ba-d99f-403c-bd60-08d947331884
X-MS-TrafficTypeDiagnostic: DM4PR11MB5359:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR11MB5359DD4EF01E74A7053FCD89F4129@DM4PR11MB5359.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5ArQdasssvepJM6vi74mQ4kTeeyyshHT1qn90L6uJ+tKop3MhPwSRQgxGClbWA95e4QIZIP5yxU6pD7A6heIs63r9RAoc8gwV2MNccY9bX6evOiVwsAuBbCM7cfqjiOEwc8fBIGN0tSy2DEYyfxJplxuhHk5DBXnLxw2IX98MELslM/FIbTcicrHEicalI1pcsVh/qRjVhuqMSNwkp0HQhxyI/9qji8YcitsCec/8TAYUlv2YvoDxmTLBafgM4BP9HxC2kd7gy4CCXyQ6hKZZ4Yc1tpvXy/U7iLI/P78Kw1sKNerR5KMbgjirLtrBwyosB4tvFSSwbwS1RTliwlq4WvzHgXosYcyEEPdf6gHXjpbZYRjkIVBVXHxOpsoVVfd8Nvsi299Um8RApV6IBB+ogZ6O+08kkgVA3Vevq40ZzCYUw0kk7RtvgGQP3lmCtWi2Ln5gUmAydtpbNe741859L85CBjecfp37zEqkOfjo/XBSPD4wx8Aaox9sR8TT+8wcQ4qApVe61ZPl/WzV1ioV8ci64otaAqUjIzP0o2BAZm9GHf/IDECN5jrdSADcbf4vPwixELEyL692GKFtb6jro4qa4S9iFYTfZGPWPjfmFwk4GJ/3aqH24r/v00Ca62Ruq9Y/Iu6BThIwEtSE3JyhQM1oAOF0HYKX+16kX8vIpOn5mBc/lVcua5BEG98Vq5PM01mHF7Lw73CUkMZgFTvoHYImAA64nMvaXw5t6zNGCM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(66556008)(6486002)(8676002)(26005)(2616005)(956004)(86362001)(6666004)(66946007)(4326008)(31696002)(66476007)(450100002)(478600001)(38100700002)(5660300002)(186003)(83380400001)(316002)(8936002)(36756003)(53546011)(2906002)(107886003)(31686004)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXQ0VC9vcjNiM3dZdXZ6c3FmemxQY3ZpUVJoYlBkNXZPczA5dFRRd2hWU2Mv?=
 =?utf-8?B?ald4c0diY0FwcWFvRWtUV0lqZTkyOGFXZXhoWUhnTDd6WGYzeVFhV253aGJ3?=
 =?utf-8?B?K09sQkpYd0o5UlJodGEvVEY5MjlpbkYwMW9VL3l1NkMzU3hUUHFpclFzVkZE?=
 =?utf-8?B?b29iK1hIZUVUSk5KSjhoUUJ4NGYrdWg1Z0NhS1lYN0RpUWEwSFRpVzVBM1h2?=
 =?utf-8?B?VFlxU29TWlFjMWtFWFB3ak5UelJPWlFIQ0V1VW1BOXNYMHJSZldINUxjdVhr?=
 =?utf-8?B?Zi9lb0Fnd05ydWFrVWoxeU9FWDZEcnVqZVoySG9halVFUEZQNXR1cmZOaTk0?=
 =?utf-8?B?L0NvNWN2cnRhYUxEVWp2R2NtUit2VEhwZy8rMVI3T2pmam9yZGdXUGVsVnlh?=
 =?utf-8?B?UkdjKzBiNThwR2R0REpVdXo1bGwzMkdiRnhrYzd1eWNrR010bkNWV2luMmkv?=
 =?utf-8?B?OW9VOE01c1N2YWY5dlk0Z1UvR0ovOWlCY21mcXMxSWRlbXpLamh4VHJpN2Nw?=
 =?utf-8?B?S2hvWEIvOHFQT3IxQS90SVd5VlFaTzVVNkY1MmJwVEVCUDR3VEsrNVJpWk1O?=
 =?utf-8?B?RmxMQkh1ZjFLUHFZZjNGeU1EZEU1cjFYWnRsY0RNQXZrZnJyOUREczFTMTlT?=
 =?utf-8?B?dnFvZitWUEI0OTNVcWg3Ri8xbXZVSzZQNS9aNy9wV1lQZjBkOXBEcElWSGw4?=
 =?utf-8?B?UXdseHE1Q0Q3U0xRMktZellTTWdIWlJsWjZCNllHVDQzQzJLQVNEN0dpZjNr?=
 =?utf-8?B?ODhmUjZvRUZBOStTT2h4Y1lNWllQbDhva2lSWUZBdG9BNVg2N25CaUJkVG5T?=
 =?utf-8?B?K0dZS1djc3hOSFJCZmxiblVoNk9WTlB6MnQ5SzZRWlN6RHRLYVR6enhoeG1Q?=
 =?utf-8?B?SUlzUzkyOXJWNXJ5a0UvbVhaVmJrR0lQNHVTNDJLbFJZYk5YWndRUENDV0xy?=
 =?utf-8?B?UlJmNWt1Q0hGRmN5VHVVbG1nVzBPd3BvclFrRmUrRG9jT2RsMVBHRnJkeUVM?=
 =?utf-8?B?RXU5cjZaU3JTa3hGS1B4bWpwaktaS0ZnNk8zdFBWOUt5RHpUUDNaTEZic1hv?=
 =?utf-8?B?YnhHdUpuZUdiNStUUkNGQklXMlliZFhSdGlkeCtUSmdFUHIxUldXV1pkTXdT?=
 =?utf-8?B?bG5JbmJyZUFROENtV3lhUDFxNXJPWWM2Zm5iczVaaTZWRDNVMDVmMlNENkoy?=
 =?utf-8?B?K2d5SURFV3FJOFRHTUErN2QwcW96NTVVa1EvZVZnR1JLeTNnVmEzVlN1NzBx?=
 =?utf-8?B?N2NtNzFKeDdTWk1xQ2JXeWlkUUR3TlgyRTFHVkhBRGR4NEEyOGhIcGIxZzNZ?=
 =?utf-8?B?bm12WHpNZGZ4UmwvOUNMdEpXNnV5K0R1TGNucHRxekNtWVk5cGg3V2ZEUGtK?=
 =?utf-8?B?QUtQK1I2SG05TndYT2hmR3pkd21EU1NRUVVCcnp1SVY0ZWdCTEFHWXlvbjhr?=
 =?utf-8?B?bEM1c056bTREN2cxRmdQN08yR21wSExjVlJmVGdkL1FwUm9UYWNybjRqeDZT?=
 =?utf-8?B?MEV3WnlkMW9GRDMrWU80VWNGUmlVT2hlVnRXcy81TitCZFZQUGp2WkVnb2FP?=
 =?utf-8?B?cUtkdnBxcmVWVFBQc2JKcTdoOG0zcWUxVWVjNC93Mk1tRnhsNVFKT1NIL1F3?=
 =?utf-8?B?V0gxRDVrcXcrM0RySmhwdHcrYjFMSWRVMDV5akV3UnI5THhQaks2d2ZIWGRn?=
 =?utf-8?B?bWVxUGR2a2hYc203S0d6YThKYkp4blFrUktJeklNRnk5dDBsVWNqNGZMdVJo?=
 =?utf-8?Q?BGp9pfiGXn9YLLze/9idGcu4HJuKM38XLsQzc+F?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b69a33ba-d99f-403c-bd60-08d947331884
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 01:51:43.1385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mbf2DqjZMTeO+Cl1yqaPWBEsmgkaCQQLZVoLlsBMWEGxHL4e/Xgv3vVByize1XXAPBHRs/d7K5lNseDDWCTb1kq4MBmbh34m5VNk6jcDsWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5359
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
Cc: john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/24/2021 12:04 AM, Matthew Brost wrote:
> If two requests are on the same ring, they are explicitly ordered by the
> HW. So, a submission fence is sufficient to ensure ordering when using
> the new GuC submission interface. Conversely, if two requests share a
> timeline and are on the same physical engine but different context this
> doesn't ensure ordering on the new GuC submission interface. So, a
> completion fence needs to be used to ensure ordering.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c   |  1 -
>   drivers/gpu/drm/i915/i915_request.c             | 17 +++++++++++++----
>   2 files changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 0a6ccdf32316..010e46dd6b16 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -926,7 +926,6 @@ static void guc_context_sched_disable(struct intel_context *ce)
>   	 * request doesn't slip through the 'context_pending_disable' fence.
>   	 */
>   	if (unlikely(atomic_add_unless(&ce->pin_count, -2, 2))) {
> -		spin_unlock_irqrestore(&ce->guc_state.lock, flags);

Why is this unlock() being dropped here?

>   		return;
>   	}
>   	guc_id = prep_context_pending_disable(ce);
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 9dad3df5eaf7..d92c9f25c9f4 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -444,6 +444,7 @@ void i915_request_retire_upto(struct i915_request *rq)
>   
>   	do {
>   		tmp = list_first_entry(&tl->requests, typeof(*tmp), link);
> +		GEM_BUG_ON(!i915_request_completed(tmp));

This condition in the BUG_ON is not a new requirement introduced by the 
changes below, right? just want to make sure I'm not missing anything.

>   	} while (i915_request_retire(tmp) && tmp != rq);
>   }
>   
> @@ -1405,6 +1406,9 @@ i915_request_await_external(struct i915_request *rq, struct dma_fence *fence)
>   	return err;
>   }
>   
> +static int
> +i915_request_await_request(struct i915_request *to, struct i915_request *from);
> +
>   int
>   i915_request_await_execution(struct i915_request *rq,
>   			     struct dma_fence *fence,
> @@ -1464,12 +1468,13 @@ await_request_submit(struct i915_request *to, struct i915_request *from)
>   	 * the waiter to be submitted immediately to the physical engine
>   	 * as it may then bypass the virtual request.
>   	 */
> -	if (to->engine == READ_ONCE(from->engine))
> +	if (to->engine == READ_ONCE(from->engine)) {
>   		return i915_sw_fence_await_sw_fence_gfp(&to->submit,
>   							&from->submit,
>   							I915_FENCE_GFP);
> -	else
> +	} else {
>   		return __i915_request_await_execution(to, from, NULL);
> +	}

{ }  are not needed here. I'm guessing they're leftover from a dropped 
change.

>   }
>   
>   static int
> @@ -1493,7 +1498,8 @@ i915_request_await_request(struct i915_request *to, struct i915_request *from)
>   			return ret;
>   	}
>   
> -	if (is_power_of_2(to->execution_mask | READ_ONCE(from->execution_mask)))
> +	if (!intel_engine_uses_guc(to->engine) &&
> +	    is_power_of_2(to->execution_mask | READ_ONCE(from->execution_mask)))
>   		ret = await_request_submit(to, from);
>   	else
>   		ret = emit_semaphore_wait(to, from, I915_FENCE_GFP);
> @@ -1654,6 +1660,8 @@ __i915_request_add_to_timeline(struct i915_request *rq)
>   	prev = to_request(__i915_active_fence_set(&timeline->last_request,
>   						  &rq->fence));
>   	if (prev && !__i915_request_is_complete(prev)) {
> +		bool uses_guc = intel_engine_uses_guc(rq->engine);
> +
>   		/*
>   		 * The requests are supposed to be kept in order. However,
>   		 * we need to be wary in case the timeline->last_request
> @@ -1664,7 +1672,8 @@ __i915_request_add_to_timeline(struct i915_request *rq)
>   			   i915_seqno_passed(prev->fence.seqno,
>   					     rq->fence.seqno));
>   
> -		if (is_power_of_2(READ_ONCE(prev->engine)->mask | rq->engine->mask))
> +		if ((!uses_guc && is_power_of_2(READ_ONCE(prev->engine)->mask | rq->engine->mask)) ||
> +		    (uses_guc && prev->context == rq->context))

Would it be worth adding an engine flag instead of checking which 
back-end is in use? I915_ENGINE_IS_FIFO or something. Not a blocker.

Daniele

>   			i915_sw_fence_await_sw_fence(&rq->submit,
>   						     &prev->submit,
>   						     &rq->submitq);



