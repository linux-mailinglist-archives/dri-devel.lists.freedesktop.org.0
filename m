Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6414567A80A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 01:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E80810E28B;
	Wed, 25 Jan 2023 00:55:23 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC09210E09E;
 Wed, 25 Jan 2023 00:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674608119; x=1706144119;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SZhrGUCge3FvbtnyibevEt1Tx9sBa6dzQGcSVyxGwOE=;
 b=Tln05w7fSe3Nl5iba/3D54bkinY+oNVsnlStkque5ZEhjn+thskDsBRk
 ZaXMRWscxBdhv9xqQcBVCeE/SBWXSD1PWPkXcafBUZRLqFUuKnFwAu13u
 Njz6xJokE+iEtXBkmPtcqkK4iyxvN3Ka9fbZ86bAXCGLt2r6hfu+mlZXq
 iV5dJX7eBRH+z30Z8MmWKCorDpzBxL2T5DueRNRL6rUQt4XAhyFQU46Dc
 xPu+IUpk4rl2e7ARdfzZV8Tn3KqubU+LxPx1sxRifq55xjGf8PDfJpYes
 wbmY/Qq1nEOtv4pN1aTTq3hwS/J77dkpnyjnLplIkrDch37PBcSCGNxod Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="325129419"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; d="scan'208";a="325129419"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 16:55:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="836182012"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; d="scan'208";a="836182012"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 24 Jan 2023 16:55:19 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 16:55:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 24 Jan 2023 16:55:18 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 24 Jan 2023 16:55:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfuC9bjRdyq1QjpnXXIk6/Gad1FjMlA0KSdbA6WmhBjhS7AaU1PxJM497hSYSYJievYYWv6tqtuYZSyCTpzvBI4n2Gu2rLE3DNZrrfh5tJ4y7fslWOft/fPAc40+osr2XOHA/hizshLptpvO8Q7vBcrpOYeSZdQBgq03/1kRoN8app1BqLJb+cKWSWbIiK7AZJeDgjY1F7y/46TiRU6WprYajYGana3o/Ho6GcKvJ1kbiJetOYKYVXBBVW1tU0ZcbjBETDSytMIJWbEqjewEplvEuALyOZ7PxWPTx1/QGtPi2THKqCMCtQtMrQsAplXq1a6KOzkD781KHPpBF1lIdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+QEULnjYWbEr/lXzUE+4gl+r18/omSP/RJU9qK9S0k=;
 b=V3tgvC+rygPBhWi8R+DlxhWwFmzlGW+iKBTo2hA6qBn61vPpFZOlIUMR5BcZ89IqbRES+sPYi1Gsh/4K86kkng7yhHCe1KnzzYAE8bdcMr1abfeDyyO6vd7HM7yesJ1qaTf6elSxuLt5SXcKk6DUSQeOQoj3TIG4C949l4S39/Xpb6lA6lZsGUy2//CGZFEjOTdMUZnYx/C0AuQLCNsuwERvICSnNiFbzWZO7KO+A8VJeXQpb1UsAyqQ625xhqpfnCGghDIjs/okns51C+47/bPkX362KY4Hf6VwdyWSpyQWhbXEPPf3Q65q1P/lXndLo5C1khwM8PVcAeDMWjeuZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by BL1PR11MB5222.namprd11.prod.outlook.com (2603:10b6:208:313::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 00:55:16 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::166f:f9d8:6041:9f28]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::166f:f9d8:6041:9f28%8]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 00:55:16 +0000
Message-ID: <44ddb672-5265-7a1b-47d5-758b0e456043@intel.com>
Date: Tue, 24 Jan 2023 16:55:13 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/guc: Improve clean up of
 busyness stats worker
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230112015447.2430224-1-John.C.Harrison@Intel.com>
 <20230112015447.2430224-2-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230112015447.2430224-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0027.namprd08.prod.outlook.com
 (2603:10b6:a03:100::40) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5475:EE_|BL1PR11MB5222:EE_
X-MS-Office365-Filtering-Correlation-Id: 26a8525c-0ec3-474f-084a-08dafe6ed255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JNzCmJpCt2tZVpQ9IZ6gXjzJJ4j1+eQ9JDD8ffNIYHVBDMajEafnbHU6anCZKufLdlZit8jc1jjqKmVBrHLvZ8aBbTaW/bI1V35B0pQF/Dp0i8Z/3XuBecmBDJ3UUE13mWZAjsEdcZkfCUt44fDkPryxT5HqDCxcFegAEVOyAy1JoHGtnNBSsQgmKQIcFmOnfPF3wQGvAX5L9/ciio1Z4fSaZ/erwfbtDO/NUywUF/gaTgGGTNEbGNpRBhbMpwnP+OsihbZRB9R53BRtUCJ9NbiWVNrCNuXafg/HPF/8S+hPRoh8KqDbHZZ3WqPBEzQpWXwQYDoiVnm/erEsJ/Qu35t2FP+r7XwZOyxtw8o7NpqI0QKKg+3i63e8fTW617G+vSFltcXpWi1aAwgIiTIFUKrYdbCQgaJ0I3hnwH5muNZeL77E4FdQHCA1TsY2A6ENaSE7+MoqzGntJrbpVH1/jxXK9zQciG7CBwqzVHU5IpMt3/TIdhyfNckMiRV6s8CYFFuz+z9LBJJh1QrPai1OjXBEvlho+GgTowAp3mbHuhPkR3H7wDhpfdpuP9UJ/mD/T/RAfdvSOsastIK/uvzTkafFWUjJclpqk0RMvFypWKzyRM1CtAPZNnjcDn6DyCwQJz/xz029PVp+WocqwklJ9iqM6kYpfczsaRrzf7YYT3Tz+KVcEw39CdA+HgHsCG7zXjPmeQ4D1edmiOkQGDaK5AzNx5ajHCyQoEURWFyp52c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199018)(82960400001)(38100700002)(36756003)(31696002)(478600001)(83380400001)(66556008)(316002)(66476007)(8676002)(6486002)(4326008)(450100002)(2616005)(31686004)(2906002)(6506007)(53546011)(86362001)(8936002)(186003)(26005)(41300700001)(66946007)(5660300002)(6666004)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bENPK3plOExuK0ZqR0RBVC9BRVVlclJ6VlBRbzFTa0xobk9CSlZ2K1lRRVY0?=
 =?utf-8?B?Y3FXeWtwaXZGV0tjb1FrWUdjNVBYMzdQc2Z5bFBkM3U3MFF3VU00aW43dTAr?=
 =?utf-8?B?NkNNZXBjdldianNJUlcxTW8yVmhsZ05ScGVHV1BCalIvbTk3N3BWY2VrdEZN?=
 =?utf-8?B?RlNGZWF6UWFaNjNOUEZuTVZ6OXJnWTFJQ09YcVFpSXlHMmhOeWlyL01ETm9R?=
 =?utf-8?B?V2hGOFJnLzdkQjBzYm4xa2hkY2dVRlN4Zml4NXZjNmlkV1QzNGNFODl0SXZC?=
 =?utf-8?B?MFNEQjU1cktDV0xtRGxKRkNUQ2tZWWpPeUpxdlN3VUszNW5hV3d1UVJiVyts?=
 =?utf-8?B?enp5MG42Y0M5cHZKRWpTQ2xkTjRuUXJ0Si81V3FzdDZSbThkVFRwM05YY2lH?=
 =?utf-8?B?Ty85K1k3SDd5R0JQNEU4Q0V0WWZaYXpMK3NVYlNSTHV2dktLd0t2eWNrcG1U?=
 =?utf-8?B?Uk9oRzRrN3FCRkdwcFB2WUM1ZnR0dDhyQTNxSlYwV2dMb2dhem5GOHRWOGdl?=
 =?utf-8?B?TUYzWW1qNEh0VDZYeGFKOWVzT3dWNmRKVHhSa0hHaC93dlBPc2ZHRVQzRitk?=
 =?utf-8?B?cWg2blhMeTdEZTZoR01qNWhXMWJHRDJrZ2h6aDk3cm81dUphSWdWbWFkaThW?=
 =?utf-8?B?VEZqak1KUUxlZnErZ1A1enlOeVhVUGxhbDF3WjZmd25OWkpOZlUrTUU3WWhu?=
 =?utf-8?B?SmJSUVNWVGVQMVRUMGpIMnNoZkZvMUd5YXpyZDRjL09XL0RqOWFlQjB3M1do?=
 =?utf-8?B?RElSQzNzczdTSERadUY0VnJhbSs4OFpSdUNHNDk5aVh3cHdQRnlCNGNvdUtV?=
 =?utf-8?B?UUgwNWlmMnpBWVdNMVNhdllueGNmYWJtb081THZScTZWdjhMS0ZZZFVhRGxq?=
 =?utf-8?B?d0dxTmthWXgrWHZubWVRTEpiVDNORUVaVFdXMXpibkZ2VlBmdjBwcm45bW9v?=
 =?utf-8?B?S29jUGE2NXhEVEY3bmNNRGdXSmNrNHgwaFA0TXBWV2MyWW5vcFZ2ZVBKUlhs?=
 =?utf-8?B?a2xZTU5uU0wrOVU2a2R2Z1V1bldOM21SeS83L0t6Mi9QclRzMFd6UlJqU0Jx?=
 =?utf-8?B?UGg0T3c3NkNHWUphUzJyYUpJZVJ3NGpqMHlOS1FLZXRPdTBYNzdEOEVwUk0r?=
 =?utf-8?B?ZmdUL21nd1JHVkIvRUx1cnB6b0J2YkVuZWdlWldPMHVEelVmWUJWQkRhaER0?=
 =?utf-8?B?SSs5YXVRV0J4alU4dVYvdGZUNERwbmhJSFg2TVN6Y2dWSkYvbkJrNGM4Tytx?=
 =?utf-8?B?dWFOdFhSU2REVndYRU9aVHJjenhReE5ySVdoeTg1b0lRTitjNC9BdVZCK0J1?=
 =?utf-8?B?VXJQR0tsdXA4OW5hdXVGdkFSN0Y1eGxPWGU2RlNCdWRIZnAreXZmaVJHY0NP?=
 =?utf-8?B?ZlM4NU95Ym1mVVUzL0NrSFcyV1BFQ0NHckNpd2ViOFNJZVlXOEFKWHZEcC81?=
 =?utf-8?B?TlhIUGg0WUcxT1NSWWJHM0lzMEx1UGtNdko1aUN0QWFhL3c3OVdiWVUwYk1W?=
 =?utf-8?B?bFJVYnhkYldlTDVJS3RZUkE3ZkFPZzMxc1ppU2lVYm56emRrVHhjK2tnOEZw?=
 =?utf-8?B?dm1DNHRpR20wb0Y0a1dXZm9XOHVjZkpBVGpQSnRTUGwyaHJRSHgyQnRSUEJW?=
 =?utf-8?B?NUpKK0FXYzNNaWRMU2lSNDdyOTRXQWkyYytuVlpvUjFVblc0a0ErZm5TSnJm?=
 =?utf-8?B?TE12RTJYSndDQnJqckkyREJMYjB4cjNQemVQOUtUakgzZ24wS05Zd1NRN2RT?=
 =?utf-8?B?eHh6YmtyaERYdU9tK0Vlb0s1VG41QWlnU2JTRWtxZjlJYTRkWnZoeG5qR0dI?=
 =?utf-8?B?bS9sUW1pTlVRMXBOV3ZKTDM3YklPTWJZN2ZTbEY1T2ZnQzJDQytOSStzNzNk?=
 =?utf-8?B?bVk3cG5wV3pNQWhVU3BxT3VPWTNyTlBoV1FtMHVZWjZHVGxWVk5JWFlsd0N2?=
 =?utf-8?B?STRqN2puRUJzS0RCWUR6SUFmeG1TZDNpQWFBd0Iwc3k3eEI3bGg1L2dsMHkx?=
 =?utf-8?B?WlAzczVLK1FjNXhJdTA1Um5WNjRTVWprRDM1QnJZQnJ4YWZUcWVPS1c0bXBJ?=
 =?utf-8?B?VHAyUEh6VS9PSWo2V1YwTWppV0R4QzZ4OGdyYTNSbzhhOHJNNE4xUm1KaHpq?=
 =?utf-8?B?a1NoMENNQVhiRk9QSXYzZy8rbVJPQUJpVWw1LzJha1RVMXNNbGVoZ3o3VDJz?=
 =?utf-8?Q?53Fy6snnQBj32/SZBrbB3/8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a8525c-0ec3-474f-084a-08dafe6ed255
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 00:55:15.7647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: egryOjZMzgEzOEDTmEvyQikY5ZlVdZRD5DHRL0U/kysNfbNyJ/TckEAkv/H46QgKNJFxZSRfyMYu1R7rc+3NDNyusGtavfgz/d5tLQVDb7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5222
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



On 1/11/2023 5:54 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The stats worker thread management was mis-matched between
> enable/disable call sites. Fix those up. Also, abstract the cancel
> code into a helper function rather than replicating in multiple places.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 22 ++++++++++++-------
>   1 file changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b436dd7f12e42..982364777d0c6 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1435,19 +1435,25 @@ static void guc_init_engine_stats(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	intel_wakeref_t wakeref;
> +	int ret;
>   
>   	mod_delayed_work(system_highpri_wq, &guc->timestamp.work,
>   			 guc->timestamp.ping_delay);
>   
> -	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref) {
> -		int ret = guc_action_enable_usage_stats(guc);
> +	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref)
> +		ret = guc_action_enable_usage_stats(guc);
>   
> -		if (ret)
> -			drm_err(&gt->i915->drm,
> -				"Failed to enable usage stats: %d!\n", ret);
> +	if (ret) {
> +		cancel_delayed_work_sync(&guc->timestamp.work);

Wouldn't it be easier to just call mod_delayed_work after the H2G if 
ret==0, instead of having it before and cancelling if we get a failure?

> +		drm_err(&gt->i915->drm, "Failed to enable usage stats: %d!\n", ret);
>   	}
>   }
>   
> +static void guc_park_engine_stats(struct intel_guc *guc)
> +{
> +	cancel_delayed_work_sync(&guc->timestamp.work);
> +}
> +

Now you're asymmetric with the park/unpark, because on the park side you 
have this wrapper, while on the unpark side you directly call 
mod_delayed_work.

Daniele

>   void intel_guc_busyness_park(struct intel_gt *gt)
>   {
>   	struct intel_guc *guc = &gt->uc.guc;
> @@ -1460,7 +1466,7 @@ void intel_guc_busyness_park(struct intel_gt *gt)
>   	 * and causes an unclaimed register access warning. Cancel the worker
>   	 * synchronously here.
>   	 */
> -	cancel_delayed_work_sync(&guc->timestamp.work);
> +	guc_park_engine_stats(guc);
>   
>   	/*
>   	 * Before parking, we should sample engine busyness stats if we need to.
> @@ -4409,11 +4415,11 @@ void intel_guc_submission_enable(struct intel_guc *guc)
>   	guc_init_global_schedule_policy(guc);
>   }
>   
> +/* Note: By the time we're here, GuC may have already been reset */
>   void intel_guc_submission_disable(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
> -
> -	/* Note: By the time we're here, GuC may have already been reset */
> +	guc_park_engine_stats(guc);
>   
>   	/* Disable and route to host */
>   	if (GRAPHICS_VER(gt->i915) >= 12)

