Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 723F23F23EF
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 02:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B456E9E9;
	Fri, 20 Aug 2021 00:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5B76E9E7;
 Fri, 20 Aug 2021 00:01:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="214837530"
X-IronPort-AV: E=Sophos;i="5.84,336,1620716400"; d="scan'208";a="214837530"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 17:01:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,336,1620716400"; d="scan'208";a="424208150"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 19 Aug 2021 17:01:10 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 19 Aug 2021 17:01:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 19 Aug 2021 17:01:07 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 19 Aug 2021 17:01:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJlP3+45VmKbcRXa8J8EHB1qQ8y1ubVuarTFuNZzAWMVakwlKjvhMu1nUZ0ujBKXNPE6SldQLRxzHDskS3QbVRycHa/3PmHrDGuoBQNAwNkzrTBXCJ1VFs1NhhVBowN2NRl3gymYJJUTijevTzbgIJAgFVjzORkJkEH6ZL48a0HRi2oJdg7jKBnP5JqWERN8BVsC9zwiWpEB2JcGPjNxPWUYXDPbANrFZWVRCYJm4Zg7VIdlFEyy85kHX0NnVIJLnfv558MoSKb3C9wfj9hcMkQhw1LBB9e6xXp+HXdcYL9DwFqJpvZeWQDhWcM3UmUD2C6RMMHuyiTj9mDyOYJ7IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tnrx9YBRn4eSrIxVVpEyMoiKu318CH3aKECsjbeISA=;
 b=C1lxb+FfV+9kNeY52MwQmcO2SVvSZuwGB5yCbOlsoUtxSp8NsEkEiupAmFziDw+WHf4zsa7KFyHzlxLB02gBNsz4IJjBfpVVfegQnudgF6Sh7u7P+Hqszree7P/jZkJQ8eqLC0i8lfp0n5wzGljWIru+ccoBdE4BBUhpHTwHeUuKGlW6anR1S+HgaZlCxcZV3B7paO8r24Yh/r8Fc8NgBRf/BhIDPk0H5xUSWeUbaGAd3OHn15kSI8gL+3yxbCx05LWbh3aj297b0HhE0gltrBpn7/PLU1uD+/rpzXdWxXqyKGS8aYrgp4xCrtrjrZ3qPcyVSOKjwjyREJ46BF67ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tnrx9YBRn4eSrIxVVpEyMoiKu318CH3aKECsjbeISA=;
 b=hRlXsGBa4t90S0DWkq9vw6Ym4A+CIj2WFEF+Myr/8qBuPNpHuUUxCxG0dpra3zriXkFm9AsWvvZkYeZ+kg7Vaj3hqmx15kg98D9F2YdE9k+kPg5gj/njPvJq+X8Suy1TCaE1p7aTGnA7x9ehi4F83dz9EQqW5n+BbFiSLH9xaHM=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB2890.namprd11.prod.outlook.com (2603:10b6:5:63::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.21; Fri, 20 Aug 2021 00:01:06 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b96b:79f6:c1fb:13ff]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b96b:79f6:c1fb:13ff%9]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 00:01:06 +0000
Subject: Re: [Intel-gfx] [PATCH 04/27] drm/i915/guc: Don't drop
 ce->guc_active.lock when unwinding context
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-5-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <274c1930-db30-bacc-8b61-db439f8ec19c@intel.com>
Date: Thu, 19 Aug 2021 17:01:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210819061639.21051-5-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SJ0PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::22) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 SJ0PR03CA0017.namprd03.prod.outlook.com (2603:10b6:a03:33a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 00:01:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82660be1-c4ac-453c-4892-08d9636d9b5f
X-MS-TrafficTypeDiagnostic: DM6PR11MB2890:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB2890BC624CC58A3C343464F3F4C19@DM6PR11MB2890.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ENjZWbKR+AqK+9akECwkwe+v8v3TGkpFFDQnukme37UFCERDCwuX2XaXM6OrY7am4AFwQvXl23MKtHs/7P2ohAe9pXIdZWViamwnksS3ri+SejfOVvtJD1CAI1uZ81w1EcxYQgg9io6q7dibXw3Ekb1IN88W2Q1yYNZCYI8+dFR/j+AuEoUErku7+yql1rqgMDtSIoFuOceSpBMmiuyEWfL9pe58E/Xic1vUuvdGLPxryNLSFNDGj9o9klPax/F1I0H3V43Qg8wHdKUhYKv8CmD4Dubv1XYeUtE5EkKndOW6QMB41dbAd+o3vnjA37ugHWAAxgWyMlddejqXcn+WUUWuSS9VAFaVCyQSPB136A+EO1kwidavyeO44EyAzuFd9s6i4w42BoScHw4oipxLarZpcEwi1y2c/p2fnCvwdtwbCJoZuFCpuTJ4n+2NdlAvbspqL2UReqZZW0ZxoEUN+/uV2Ux8NmAoad+EvwsHv9/TXmQW650ZYF28i/moiwJk0Z2UyLhQxItuTsjPDjM9hhmIUe86c9l4wNw+iYUn8PVQZEHRYR44QyS/itLXGgUs94m7EdZtd1ViLv8F7yjmnnNfKfSOONX8MT0O2R5F/a6xwERwGurzWTEpWu7H+OvFGODqKAopckvqYODS/RPtZE+fN8bW5s8neHso8SgtpSwBC9j1SqrVar5CxjWwoXPk5lMnjfheMxsbJ2JHwZf00aJF0MSvo7ohp4hNtqCsp+c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(31696002)(8676002)(36756003)(2906002)(38100700002)(86362001)(8936002)(186003)(6486002)(66476007)(66556008)(66946007)(83380400001)(4326008)(478600001)(316002)(956004)(16576012)(2616005)(31686004)(53546011)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlJuUStCYVc2cXAwdXVjUjhOWWl2a2IrMG5OL3dYUjZZVFFHSlFGanRsbENn?=
 =?utf-8?B?ODhLZW5rMTE1VS9HT1B2TUVaT0o5d1RZTGFuYkFDMlo0cTBQSG9UZ09aOXVN?=
 =?utf-8?B?dHkrQTNLdzBPRmh3M2UxbVZma3pVbnAzM251Q041eEE5MmZhc0FPTW1Ia2dk?=
 =?utf-8?B?YUVocG12dDlldGFEWXFIUGVrZ3hWeVFRNklXcDArNmFSVGIwY0hHd1RvdjlB?=
 =?utf-8?B?TS9DcWNiNFRON01CMXgyOExiOVhpS2JCSlBYUElXUWR5YUNoM0FLMDBoQUJG?=
 =?utf-8?B?OFpOTU1xRTZVeVlibTY3dHlCVk5QZUlkd2JFazVqZ1BORkhlK0o2MGZ5RlY2?=
 =?utf-8?B?YSsydndmQ3BLRFVpTjE3Tm5JdnNzT3AzdXo4Q25LUDJLY2ZPUGlKbXF6MWhp?=
 =?utf-8?B?ekRJTWZPMGttNXRkU2xXT0t0NkpvUzVDdlM2UktLMUZBOTZSdVJNc0MxZkFh?=
 =?utf-8?B?dmc0WFR5Q2E1cjlEUHpFTjljajRKU1JqSC9jZlBxcE1CZHh3M2p4SkdYVXhS?=
 =?utf-8?B?MEpLVU9ieHZENlRMaUpQeStJMFpvYlhoTGxBKzVNSjFpQkF5R1dOZmhlZDVu?=
 =?utf-8?B?NG85NkhpOVlWN2YrWjVwZnJVc1NWOGxXVUo0UFhPcm5NNXROa0Jkc291bmpl?=
 =?utf-8?B?citrQjN3UGlzMm0vWVpnb1R2SWVUOXR4c2Z1L2ZZVjM4YXYrYnZwNHBrRldD?=
 =?utf-8?B?VElPem5xbTNDcitRZTAyKzlKdk1qcnZTTkdHVDdnSXhGSU5lSFZUdUtabTFN?=
 =?utf-8?B?Y3kzdmE3cVZna0Rja0Y5bTljaUxWSTNCbk1oKzBia0p3U0R2M0NRVGE1bzMy?=
 =?utf-8?B?T29PZkxvWnZyR1djdExRVUxlMEVPWTlHdUFoaE1tQ2E4WDJNL0g5cytkOUNP?=
 =?utf-8?B?MTZ4OG1HL29NTGw5QnFMcjFyTkdWcXFQZ05Ua2FJc0hDVWZsNWw2ZVNPejF0?=
 =?utf-8?B?NU9UemNzR3Q3M3Yrd0FzdVhDOVNlQlZrejlkRzcwaDBaUXFkQzUrMkNUTzRJ?=
 =?utf-8?B?b0RBYTVva3dDY3F6SVh1eDRwV1J4Yncyam0rdk5aYUdIdlR4VkZidURNbGFh?=
 =?utf-8?B?MlZUNUtMcGhHajRhUU9EcWNabzhFVllXUEtSZWw5V0NldWdNZkdVcFhLS2Er?=
 =?utf-8?B?Ni9IaUVPdEZoNDF1YnduN29XdW9Hei91T2tZL0g0aVVFL2ZYK1F2TlY2WGt6?=
 =?utf-8?B?WWV6ZUJLYUxKOXIvUUVBZnI0Q0h2S3o2ZHlKbHQ0c0YwcWo0Q1RZRFM3K2Jx?=
 =?utf-8?B?UW9ZbzBVdW0xQkJhUzBMYXZuMEM3V3dYeVZvK0M4UE03ZmlseXhmeExRRmIz?=
 =?utf-8?B?Qm9ReUJ3OW1GWDF1ZU00bDdhaGVFZW4zcTdDWU9yZEdaNWVUUlRCaU02MjhD?=
 =?utf-8?B?aW44ZWZMVlNJb3FIUDRaMFVLK3AzTVJLckt1cFVvdHR6UEpSVjBlemhKb04y?=
 =?utf-8?B?bThVdzIvcGVKR2UzTGRzaDI2OVFEZXg0ZXJjY2U4NmdHTy9mMGhUWS93T3Mx?=
 =?utf-8?B?WVZvWnhoMktVYjJSUnlwdVRDamh2ZzQrUGQ0N2lPUHBBdlRTRWR2V1B1WWVp?=
 =?utf-8?B?b2VPZnJSZHlOOVdmT3Y2NHdrRFBsZHd4enNBQWh1bkVlSmZKM2VWOVBlaUdU?=
 =?utf-8?B?UGpkTlVVM2Q0UFpzNXZoRENPaWJxWEVGMkV4aXVTSFFIdTVGYTJjUHdGZHRR?=
 =?utf-8?B?OUlYMnUwOG8wNklmeEVpRVY3SUxCMjJGalp1bEVUTVFoZDN1ejVSbHQ0ZXEr?=
 =?utf-8?Q?xCUK4/mEsVFMXK2KPp31r+OUChoQAZss+r/MDxS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82660be1-c4ac-453c-4892-08d9636d9b5f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 00:01:06.0735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1ESJqoDAdiNUqvoXHHYqZ6IHs6BXeQw1PuBM1sgb8Esj5WXLakva2l/fswH/nO00hLEBYNAL2v6h9ofK/29piu5S75PEsU0dTOmGhKwzwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2890
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
> Don't drop ce->guc_active.lock when unwinding a context after reset.
> At one point we had to drop this because of a lock inversion but that is
> no longer the case. It is much safer to hold the lock so let's do that.
>
> Fixes: eb5e7da736f3 ("drm/i915/guc: Reset implementation for new GuC interface")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Do we have a trybot of this series with GuC enabled? I've checked the 
functions called in the previously unlocked chunk and didn't spot 
anything requiring the lock to be dropped, but I'd feel safer if we had 
lockdep results as well.

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 9ca0ba4ea85a..e4a099f8f820 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -812,8 +812,6 @@ __unwind_incomplete_requests(struct intel_context *ce)
>   			continue;
>   
>   		list_del_init(&rq->sched.link);
> -		spin_unlock(&ce->guc_active.lock);
> -
>   		__i915_request_unsubmit(rq);
>   
>   		/* Push the request back into the queue for later resubmission. */
> @@ -826,8 +824,6 @@ __unwind_incomplete_requests(struct intel_context *ce)
>   
>   		list_add(&rq->sched.link, pl);
>   		set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
> -
> -		spin_lock(&ce->guc_active.lock);
>   	}
>   	spin_unlock(&ce->guc_active.lock);
>   	spin_unlock_irqrestore(&sched_engine->lock, flags);

