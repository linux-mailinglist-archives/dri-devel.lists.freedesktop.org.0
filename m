Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A44E777FFD2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 23:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B733C10E038;
	Thu, 17 Aug 2023 21:25:19 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA5F10E038;
 Thu, 17 Aug 2023 21:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692307518; x=1723843518;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZS/9unBH1CGdn3dB6x7xINVWrU8Yv0FXXfapVeXF6Bw=;
 b=YviFDVat+0vp62Lka9UJClX+RjH25RAZgFn17yTyHQU/v0ZRjc/Vr3b2
 Qgslufl+cnjIDulm/jKTTWTHtIlId6UmQO6krQdftIbNvalX+fvFdAMGH
 OOTYqIQsdNUqQvrWnRmoCVDhKe8D3eAS0/6jFV7SvLH7pBkBZfW0QXAwt
 4FxCYJGebXZ/Ru8xYY0iWr0S3GRpX/jLqKb34wLY390sD/rIiqBHpkrjp
 HsI8NHxEgWgCGGCakFjpax1aBZbwCJ2d6wLJOCTzPDQBwlpBEE+6cs4gp
 xOzlrytsAH8xSw4GqfkQxAn9hWBT1442zA2vAwfSHeP2K96h6wZ3eTVv6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="403915341"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="403915341"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 14:25:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="769836659"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="769836659"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 17 Aug 2023 14:25:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 14:25:17 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 14:25:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 14:25:16 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 14:25:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJtRYMhudn+wXFkvzzxygngxUptoBGIzsATv/v00YYbhDXAQ+4FF307PTabsyAsUZoGDkzyNZgtdinvB8dERC09Werdk9dbllNG9K81xJOFD37SXtSinTNY8/+gMhhwf6ob59d9wxWvPEXxf9kFsi05KK8G38MkUp/R6Z3IleRNXrHnpJGHcNkDbnu3euaTJgwCC+k+CkShX4YO2Cyvn8Y8+JuxXI2+R8sNwk1B4+iatfuIwvtfPpB4tB4SseaCEqsivJ7TqM+ScP78cq6eIvhk4zchxH5KV3ahR586hdPhspM5m0g89WbsxqGO/BFevCzFn32YLb7l8F8OHRekeEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b303wZeKOrDeP1w3Y0i4OwNB8kliSFKHYDcyIocuJ6c=;
 b=CpGBmB/wUysAapFGtHFZXqDsi7XISU/6od932mkXn/g5uoNNSzUiMpwxzv9+ha1fDXw+dffkzk9sVhi/SxNAG+EjAVdg83TZqFoZPhvT60GKPUDnur4n3I59L/vQRHuu3OhNjZffsTuGbBAGYnS9WQS0P/zW8rQMwuSJdRvAyrB1oJoRgpdh/W7KQMkEpNNXZSi1Dpy6JPA5M2T4To8HUGx3vMPSFg4+mIeh8KKZ3NhJdLMTL32iuco/xwXLAyE+w5YtCAR8D25gWXoPuUdqkTCW5E4Gm6Nw2hL2DIFECMe2QrxxUoPQkQsvg57BylNxdPE/5iO5wrDGJGaOkxql0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9)
 by BL1PR11MB6050.namprd11.prod.outlook.com (2603:10b6:208:392::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 17 Aug
 2023 21:25:14 +0000
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::a014:919b:81d9:3e2f]) by SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::a014:919b:81d9:3e2f%7]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 21:25:14 +0000
Message-ID: <ba70b4fc-d51e-ca80-1714-6f39950c699c@intel.com>
Date: Thu, 17 Aug 2023 14:25:12 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] drm/i915/guc: Force a reset on internal GuC error
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230816003957.3572654-1-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230816003957.3572654-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0095.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::36) To SJ2PR11MB7617.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7617:EE_|BL1PR11MB6050:EE_
X-MS-Office365-Filtering-Correlation-Id: c7467037-4ac5-4d71-1ecc-08db9f6871d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TiJPLF8JDviVUi9jkUGTZXso88xyNWWAGDGy99M3c+p7bxtWouI7WhddcVVbCVIgrsLYY1yYFwQw1UMB0zpWe367C3wqyK6xACUJcR5vea0qZcD4n69b9TCk6hUpDFBS4UPUMILMP2/vXl9IiOU4VLJnherGBt5U+teJ2G9nOAikxGdVKnJltD72h31ZM4HGxbLMNjzQ0owrCot1867N6FG1NxuyMGPSkTlbrJHpEElCcSwdIvWpX6tU2vjG+sFRD03hJVeuzQQy/jl4bwk/Bk02/Ry8gN/ABCYCBH2iVdapsPvN+icwiZMWfyAyXYIY/dJhvz5YU8Y7sZ/YHQklUxzvZyQW9Q+lw0CWSDzPDLbVt4E6hKBf/unuzd5pNCZvwC4RYEwAfQfv6iJrnvD/a0ry+3bJhAssfVFpDaM648YiUmEjBua4WJ18LF2XdYN/M5tfzVlFdPIHW6x9wPsM96Vu2vWjodFcYYKX78Qh3anVmfmQ32YU3XgvvRCf2FSZlGOpfgotl5VY0xAfHkmLOzwWNsOUS5qWfeJVEz9syYNFTPtxk8uP2RjQPCoYfTy4gfDpbkh5JBOLQExk2YHZLizBDFEZXcn1jtRj1S1c/GUCgVxPxtJYzIg8Jrtjol/mk+a7kiNqfbbcNZtuNA2rVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7617.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(136003)(366004)(396003)(451199024)(186009)(1800799009)(316002)(66476007)(66556008)(66946007)(31686004)(5660300002)(41300700001)(38100700002)(450100002)(8676002)(8936002)(4326008)(82960400001)(26005)(2906002)(31696002)(83380400001)(478600001)(86362001)(53546011)(6512007)(36756003)(6506007)(6486002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW4zTXBMODc4VzNYUnMwZmFLa2pMUXF1R2Z2MXlrSGlVb3JXNjE1UFhzWXNh?=
 =?utf-8?B?RmdJdDU3MDVmU1hqZGZMNENGbVBaWFc3NytIODJtOTB3Y0NhbzFwcURpM1Zm?=
 =?utf-8?B?RTcyQ240OEN6MUMwamN2OHJkWEhjTjlzUUhnMUp5bWxacTNpUVR1RFNBUU40?=
 =?utf-8?B?cXIxWTYwTVRManhWWGg5Q3FNRmN2TGYySklFMGF5SmdpNXoyeEV3TGRaWCtY?=
 =?utf-8?B?Tk95Y04rWU43V1RueE5Gamd1SUVZakllcTFrOXYraG9jT2xyQzZYV3VXUXFl?=
 =?utf-8?B?elNMZVIvYmdDZjk5UFA3NjIraTJsWWN1NzdQckhLUGYxVk5NME9WYWdEaGhy?=
 =?utf-8?B?ZjJDRldTRVFZQjU2dE5VNnA1disxV3F1dHhDdXozamJHME9Qbklkb3BqOVE0?=
 =?utf-8?B?eENLUDd5c2xqSFZmSUttc3VUTzU3U0IxL05YYzd1Z0I2TThuRzNsNUd0RElo?=
 =?utf-8?B?dC9Wdy9mT2tRUGtrUDN5Y1B3T2UwRFRwM3l4MzJSQS9YZVpBZ0I2Qy9FTldr?=
 =?utf-8?B?cnRwNVdlajBOeDd1YkpzUUtGZUQzSHdQbkF1Uk0xTGxBKzlodUVvZjkvOXJT?=
 =?utf-8?B?VDJ4b05SK2xnbm1nb1hmTjRrUUZzaVJLaVR1bDlySUpqRmFrOURHYmZrbTRa?=
 =?utf-8?B?R3JNY29JUlZGRkJheDhORHVNNG1FZmd3Z245bDdwWmJERXBwMFF4cGNSUmky?=
 =?utf-8?B?OUlkNFlrOVNnc201MDZ2OXhtR3VWbDhoM0RUdGp1ZlB0amdwZkhnTGdYQ3JK?=
 =?utf-8?B?NVNlUHVpVTBNeWpwVm9qaW1qWWxXaHFZeGYxN1kzL2FnZkx2NGhYempoVHBm?=
 =?utf-8?B?S3lIWXlCRWlsUzlXQ1k0YWxUeGR5eHNrUVFXYjJsMDFJMEhJWVRwWldSVmtu?=
 =?utf-8?B?U0Noa205WFVxNjhFem55akc1bTlyRDhwN1hEZW00eXlPKzRBa2hRUW9KdGI1?=
 =?utf-8?B?M1dEYTAxTE9oQ2xMcWZ1blB3b1N4V0M4RzlCMFFtSU1Vd2VPYno4Vm50T3I2?=
 =?utf-8?B?WkxtZzRvRWxvY0RyRytiOEZoWnM2YWdZMzFsdzlZVHcrWlpRZy9pNGRCT0Qv?=
 =?utf-8?B?T3c1Q2M3YlJKaHhmQU5RTU9zTllUTGdtSjkwMmpwWk5nRXVpK3BkcWpQMENy?=
 =?utf-8?B?M243QS90cGZZRnRFL3F0cjZENWpzVEh1a0lIdnFxQnh1NktTbU9pRHV1ai9v?=
 =?utf-8?B?aCtacDhtWVEybW5aUW0zaFJVM2kySTdtcXoveXVPdFZpdVU3QVdUWTlHNC9E?=
 =?utf-8?B?U0lONHVSb2plYzJ2a3RicEs1K2lZOFBPN0E2dDVqaFJvcmw2OFZpZ1FNZytD?=
 =?utf-8?B?QkN6MHp4eUVvQlhGMzE5UVJJck9qNHRhbmVVVXpkL1ZFSU9kaG9wekQzNXk3?=
 =?utf-8?B?WGJvQi9xVU53ME0yd3J5Yy82cXpCMFpmQkVMcitRNzArZ1dQTWZEcEM0bE9j?=
 =?utf-8?B?QUhJTm5nLzVJNXF0ZGFEWHFrUFBsbTd3L0luSjZlQXV1aTRNcUZxcFJETkkv?=
 =?utf-8?B?akQvdFg2MTNSV0R0akJBd1lIN0dENWVUbXA1YzlOR1NVaitSc2Ezb0FQV05R?=
 =?utf-8?B?b3dJR1laMnRxMm9ETG02blROc3BqQmUxcjdQdEp4YUROcmhOOFRmTU1oU3hY?=
 =?utf-8?B?V2FyQ3R2V2FReXhMNWVjZ0V4Y1I0czNRNmhrdUFrTFhBSWVhaWNnamFXUXlU?=
 =?utf-8?B?MGNNbWE2MU9tZ2VRTVB4cFd6aFhONVBEam9vQ283L1kybWZYbkxoVEJWanR2?=
 =?utf-8?B?YThjaGFNSTVLV1BObUdOTVhVdm1YSTRWWHZ1TUYxWlR2eVQ5ODdjK2NCdXQv?=
 =?utf-8?B?TVpkYUorS0JkRmc5RUlvV3I3MFNBTUpaWFVZVTVHY0J5emJrT2NNd1pxM2xQ?=
 =?utf-8?B?bmxyb25Ldnh6YjBhMkdZVDlLWGsyUzZ1bit1RThEYkJRQ3UwbVQyNHpscHVw?=
 =?utf-8?B?Y2ZtVGY0eG9XcW5OWXcxb1ZrQi8wZWdGN1VZSlRRYmNuNm85NkhvQk9ISWNu?=
 =?utf-8?B?cnBFdDBCekxucXlQemtYQ3k1ZmVtSEdkSnR0bmVWVWp6eTNqc1JOS29rVytt?=
 =?utf-8?B?UEpvTWpDU2dibGp1QU1nRUZmdVhUSGl2ODQvL010K3ZTMHVxUU9lWURzQmVp?=
 =?utf-8?B?OWZONVp3NDV6MEt6eU5qWXo2UTJYdlFTYmpVcjVQZndmV1BWRVQxQ2ducWky?=
 =?utf-8?Q?xn7iMwhBzo0cgNjCb/AnwMo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7467037-4ac5-4d71-1ecc-08db9f6871d7
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7617.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 21:25:13.9697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YF6Ojvc68mSX3Cmz8w6ZRMDjPbKsd3U0kMyzIK0Z7VPiA+D+eqSa/rgdREGeZTaSxPmPAtl2jqxKWTHkEOC0xutQALcnioLrqlEE+UZqcl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6050
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



On 8/15/2023 5:39 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> If GuC hits an internal error (and survives long enough to report it
> to the KMD), it is basically toast and will stop until a GT reset and
> subsequent GuC reload is performed. Previously, the KMD just printed
> an error message and then waited for the heartbeat to eventually kick
> in and trigger a reset (assuming the heartbeat had not been disabled).
> Instead, force the reset immediately to guarantee that it happens and
> to eliminate the very long heartbeat delay. The captured error state
> is also more likely to be useful if captured at the time of the error
> rather than many seconds later.
>
> Note that it is not possible to trigger a reset from with the G2H
> handler itself. The reset prepare process involves flushing
> outstanding G2H contents. So a deadlock could result. Instead, the G2H
> handler queues a worker thread to do the reset asynchronously.
>
> v2: Flush the worker on suspend and shutdown. Add rate limiting to
> prevent spam from a totally dead system (review feedback from Daniele).
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c    | 38 +++++++++++++++++++++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h    | 15 +++++++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  6 +---
>   3 files changed, 54 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 569b5fe94c416..12a817b762334 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -159,6 +159,21 @@ static void gen11_disable_guc_interrupts(struct intel_guc *guc)
>   	gen11_reset_guc_interrupts(guc);
>   }
>   
> +static void guc_dead_worker_func(struct work_struct *w)
> +{
> +	struct intel_guc *guc = container_of(w, struct intel_guc, dead_guc_worker);
> +	struct intel_gt *gt = guc_to_gt(guc);
> +	unsigned long last = guc->last_dead_guc_jiffies;
> +	unsigned long delta = jiffies_to_msecs(jiffies - last);
> +
> +	if (delta < 500) {
> +		intel_gt_set_wedged(gt);
> +	} else {
> +		intel_gt_handle_error(gt, ALL_ENGINES, I915_ERROR_CAPTURE, "dead GuC");
> +		guc->last_dead_guc_jiffies = jiffies;
> +	}
> +}
> +
>   void intel_guc_init_early(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
> @@ -171,6 +186,8 @@ void intel_guc_init_early(struct intel_guc *guc)
>   	intel_guc_slpc_init_early(&guc->slpc);
>   	intel_guc_rc_init_early(guc);
>   
> +	INIT_WORK(&guc->dead_guc_worker, guc_dead_worker_func);
> +
>   	mutex_init(&guc->send_mutex);
>   	spin_lock_init(&guc->irq_lock);
>   	if (GRAPHICS_VER(i915) >= 11) {
> @@ -461,6 +478,8 @@ void intel_guc_fini(struct intel_guc *guc)
>   	if (!intel_uc_fw_is_loadable(&guc->fw))
>   		return;
>   
> +	flush_work(&guc->dead_guc_worker);
> +
>   	if (intel_guc_slpc_is_used(guc))
>   		intel_guc_slpc_fini(&guc->slpc);
>   
> @@ -585,6 +604,20 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
>   	return ret;
>   }
>   
> +int intel_guc_crash_process_msg(struct intel_guc *guc, u32 action)
> +{
> +	if (action == INTEL_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
> +		guc_err(guc, "Crash dump notification\n");
> +	else if (action == INTEL_GUC_ACTION_NOTIFY_EXCEPTION)
> +		guc_err(guc, "Exception notification\n");
> +	else
> +		guc_err(guc, "Unknown crash notification: 0x%04X\n", action);
> +
> +	queue_work(system_unbound_wq, &guc->dead_guc_worker);
> +
> +	return 0;
> +}
> +
>   int intel_guc_to_host_process_recv_msg(struct intel_guc *guc,
>   				       const u32 *payload, u32 len)
>   {
> @@ -601,6 +634,9 @@ int intel_guc_to_host_process_recv_msg(struct intel_guc *guc,
>   	if (msg & INTEL_GUC_RECV_MSG_EXCEPTION)
>   		guc_err(guc, "Received early exception notification!\n");
>   
> +	if (msg & (INTEL_GUC_RECV_MSG_CRASH_DUMP_POSTED | INTEL_GUC_RECV_MSG_EXCEPTION))
> +		queue_work(system_unbound_wq, &guc->dead_guc_worker);
> +
>   	return 0;
>   }
>   
> @@ -640,6 +676,8 @@ int intel_guc_suspend(struct intel_guc *guc)
>   		return 0;
>   
>   	if (intel_guc_submission_is_used(guc)) {
> +		flush_work(&guc->dead_guc_worker);
> +
>   		/*
>   		 * This H2G MMIO command tears down the GuC in two steps. First it will
>   		 * generate a G2H CTB for every active context indicating a reset. In
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 8dc291ff00935..6c392bad29c19 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -266,6 +266,20 @@ struct intel_guc {
>   		unsigned long last_stat_jiffies;
>   	} timestamp;
>   
> +	/**
> +	 * @dead_guc_worker: Asynchronous worker thread for forcing a GuC reset.
> +	 * Specifically used when the G2H handler wants to issue a reset. Resets
> +	 * require flushing the G2H queue. So, the G2H processing itself must not
> +	 * trigger a reset directly. Instead, go via this worker.
> +	 */
> +	struct work_struct dead_guc_worker;
> +	/**
> +	 * @last_dead_guc_jiffies: timestamp of previous 'dead guc' occurrance
> +	 * used to prevent a fundamentally broken system from continuously
> +	 * reloading the GuC.
> +	 */
> +	unsigned long last_dead_guc_jiffies;
> +
>   #ifdef CONFIG_DRM_I915_SELFTEST
>   	/**
>   	 * @number_guc_id_stolen: The number of guc_ids that have been stolen
> @@ -476,6 +490,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>   					 const u32 *msg, u32 len);
>   int intel_guc_error_capture_process_msg(struct intel_guc *guc,
>   					const u32 *msg, u32 len);
> +int intel_guc_crash_process_msg(struct intel_guc *guc, u32 action);
>   
>   struct intel_engine_cs *
>   intel_guc_lookup_engine(struct intel_guc *guc, u8 guc_class, u8 instance);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 97eadd08181d6..6e22af31513a5 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -1112,12 +1112,8 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
>   		ret = 0;
>   		break;
>   	case INTEL_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED:
> -		CT_ERROR(ct, "Received GuC crash dump notification!\n");
> -		ret = 0;
> -		break;
>   	case INTEL_GUC_ACTION_NOTIFY_EXCEPTION:
> -		CT_ERROR(ct, "Received GuC exception notification!\n");
> -		ret = 0;
> +		ret = intel_guc_crash_process_msg(guc, action);
>   		break;
>   	default:
>   		ret = -EOPNOTSUPP;

