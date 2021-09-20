Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C60412870
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 23:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD186E890;
	Mon, 20 Sep 2021 21:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516456E88C;
 Mon, 20 Sep 2021 21:49:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="221353656"
X-IronPort-AV: E=Sophos;i="5.85,309,1624345200"; d="scan'208";a="221353656"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 14:48:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,309,1624345200"; d="scan'208";a="556501673"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga002.fm.intel.com with ESMTP; 20 Sep 2021 14:48:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 20 Sep 2021 14:48:58 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 20 Sep 2021 14:48:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 20 Sep 2021 14:48:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 20 Sep 2021 14:48:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFEQK7PfidmYigkjnHAzp99FeeGBv966m/QHNxHJGeGLHBJGnrR8jsJR3HNjfkZCl55fcYBQXeeNueZnrxtRPkf8Zm7brJbQIfYQK6paj1RYMFTkMBoXTIjOsI5/EaIoVjbhiaFVwnINT1bnJm3rDSUTv9Oxc/TaJ4nBULJ8+6tJ64SzyEi4vRig5Z11xaA5nK4X94kVdWtqk/9A31MMOxacST4vwcZX26bT8y6B25Oc9rZGEe/anVitrFZi4N1gTiZpWrctTLj6RX6s6V7kRYtcJhnCCncOGGYZRM9ohsIiXFwGZEsyCpgSgodHoU3T5CFuqOUvm9PVX+f+XkTfAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=uUZOMXX7bf0pid0jXUhZGLTsFIJjW00Q+IZEZXD9Pn0=;
 b=W3u/w4BLGiT8xy/Gm8iwhrJHPqELG56BiRc1s8XqUW703eI/J/KenuR2an4bf7t5vPHJ6B2Qt4mzYaXXs1aFtnIFh797S3CkPw2BOEFPHFQ5o+vfxdBkpeIvJnDcRjRpEOw4YyhADNKNx+fyAKwqIyI79GpwK3axh6aVYXzzb4EIsZK8pz6iU5YScEI/8UzL8fk3rLGL0MiqH+ttXx4VX6ImRH+i+8ppZ2JaLisl+hmZL4M2H88EvaNg0a5dF8W06EwdDnCeJpiwEh4GJgJLTJWIfNoSYAGCCIG/fCAaHBrRP9+fpGaQmQb/j56osUyN3oOac82mMhGGL8JHwjDREQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUZOMXX7bf0pid0jXUhZGLTsFIJjW00Q+IZEZXD9Pn0=;
 b=EMIOdM3L4Qck3bVOOj5ZUtzwxpyHhymhSsZrxBkC6ei/zi3MiaB1p8KHwMqp3szY0l9gAd+JDVBtaW7vx7A4yXLfj3HG7hdxndXmvuzAztpLNI9KvqmSfhM2QyfZMVjlYLisvWJ08uAUmQ1JiP+fQ2NNBOxNUWNX5oV//QY5h88=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5578.namprd11.prod.outlook.com (2603:10b6:510:e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Mon, 20 Sep
 2021 21:48:55 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%7]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 21:48:55 +0000
Subject: Re: [Intel-gfx] [PATCH 15/27] drm/i915/guc: Implement multi-lrc
 submission
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-16-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <c840bf5b-c5e9-872d-e04f-2dfe1852e555@intel.com>
Date: Mon, 20 Sep 2021 14:48:52 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20210820224446.30620-16-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR03CA0102.namprd03.prod.outlook.com
 (2603:10b6:303:b7::17) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MW4PR03CA0102.namprd03.prod.outlook.com (2603:10b6:303:b7::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Mon, 20 Sep 2021 21:48:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c639130d-82c0-4246-9f57-08d97c8071b7
X-MS-TrafficTypeDiagnostic: PH0PR11MB5578:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5578F105C882848AD57125CEBDA09@PH0PR11MB5578.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e/y5ayqDSljugHmslStwuDgAU6R3200O46eljSWw1qCiHfjHLWwJ0ForgLl1Qa/AmFnHdiw9TyC1qeP+D5QrgT6vqQN9tkXspTSckhBlLqLnv19tZcJdpADLyD0GGjUxDXu5LVBctrX6rqEEPckKvYqt5/6NxZGXL7ULB7FXyZy+RTLpE4EcSX/hbELwO8LNoUh+XU1AKDi0FkqC2POFzE90rXbTGp/bAtNkQS/NsW9wj6Tf5tDHKqEBxpYu7NQVKUazABtuJxwtE4AcOvVN7vLbLP/l8vtN7wiCs210570BfZkkpTglw/d+nzO/HlCACqwAKyi62QzXYqCv4yMluZVCWcu4mfZEgab8HojewXC4SrWtqLZ5JaovU73EmeJHjLSC8LmPlUN/4LX74JZ+ZsK36DV7ZClIXC6ZfWgs+Kt21sE3bG3G54YD/ifsE+1NB363T8tSWG+ENK78lYKvAWeVginS7vpig8pK3tWuCHeLqA1ZEB0EYdZiOSx2KLe7gmxTU2kQf8ZB0VkxeUc4m1MlHxZSHgrZIaMIkWFvPFbWgppJgQ8uTEiowjcZ/YAqdv1mHS1t9FMsDG4YVoYAI2WrCTnIQsCwk+FDMo+nfXpbdlG5rtDhqzH3i9+pBC9AeCxPsmOKmlaQF6wvSDKnfLEV/+LHj5bREUVtbF6Si7ioGia0yXBoG+geD91BO0ZWXP8bHauIFbkUTSgRl/TFH0z8j997OFbDCBwmRhCiILjwPBeKNp/R7c90wbk3TF1+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(26005)(8936002)(86362001)(5660300002)(53546011)(107886003)(30864003)(66946007)(38100700002)(2906002)(4326008)(31696002)(16576012)(186003)(8676002)(36756003)(956004)(2616005)(6666004)(66556008)(478600001)(6486002)(316002)(31686004)(83380400001)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFlsQVpnQTFYOXJzYmR3NDIyMXYzaEh1V1ZVeEk2ZStqcmNxSTlMSXRCaHNH?=
 =?utf-8?B?c0VMN0szWkI0Z09MWDFCQ2tVR0IvcG5tSGUrWFJCNFQ1QURhK0RDbnp1cDJy?=
 =?utf-8?B?a0tEQlRUcDBWQlZTK1cxOXh1eWFFS08yaGR4ZXdZRFkwQVhQRy9yc0FFSDJt?=
 =?utf-8?B?RUNGU2I3QUIzaldhaE5ML090RlVnWUhGVVR6ZzRVOTU3eUkrNzFrZGRWRVNi?=
 =?utf-8?B?QWpESVp5ZkVldG42ZEZ3OG1kYU83cHM1V3NYMnlyZHVwQjM0OVVteS9rNjll?=
 =?utf-8?B?clNKV3psVWpGa3VVM1dmR1QzK1o1Tmg2RTZWSlBGYjJxVVh2K0lMTlJXY1Ez?=
 =?utf-8?B?TVFiSXNJL3htMGk5YmhIbTZ6MkhZb1ZJb3R0YStCVFJjMTZUZk9IbVVYT2NC?=
 =?utf-8?B?a3IwVC8zS1RnMGlSNXNIN0svekZpY2c4NlZJMEZSckZuc0RuQ2FvT3lPRDZY?=
 =?utf-8?B?d3Q3akl0Y21pUGRJTjRBV1IyWmxHN3c0Mk1qREVka2FoWDY4bi9Zb0hQN2lr?=
 =?utf-8?B?eWZkc2RKZEhxV1lwR2dQbFJORmtwWGdiV0M2K2wvaXhnMUNIaWpqQ1RIOVBv?=
 =?utf-8?B?STM0OXhSelVtT3FnVDVPUEU4ZHBucXdrVnc5c2w1T0cvVXBiWXZSWU1QZ1Jq?=
 =?utf-8?B?QTVNOXpneDNFUisyZlB3cWJIQ1BvWXdhTEJHdC91ZFpCVmhCaDBTakRLSFE0?=
 =?utf-8?B?dXNJd1hYRDd1VXBwZkRZSlRIZUk4bnI1UXBYRVAvcDBvaTkxUSsreDBoS3RV?=
 =?utf-8?B?YTJCemRzM3NYWUo0b0NIb2o2elpoMGhuZXZxZFA1bVdoZkRSQ1p3V0FSS3dI?=
 =?utf-8?B?R3FpRDVNU2JMUUFKYzFXb1I2RU1QNnhSN3ZMTWRaNnMvK0pGcFc3YmhYaXBp?=
 =?utf-8?B?YkQ1dDg2SkxDMXo1ZWlrN2hEZktSeDJFKytPbmlYQjhnWGdwUmpqWmRzeFRq?=
 =?utf-8?B?MjFHWWJFL1d5bm45eUlmcHdwaWpKcVVQOTNURXkwK3htV0R4eXpMWDRaeDNO?=
 =?utf-8?B?YWZXb3Z4R1lqY1plTjBrc2ZoZ09QcnU0RWUyTzlvQWc0U1BPOFBMK0dCeE5X?=
 =?utf-8?B?bzMzWVZpbm5xUWR3SENmM0Zjem5Ddy9CWi9ScjJOZis2SzJSN1NMTk4xaVY3?=
 =?utf-8?B?QXlLa3NhaFBhM3lwRGhvVDh2b0RPbVZMcGNTV0NLMEVxTG91MisveVJpbWJF?=
 =?utf-8?B?bm9mZm1qd3NxQjlSU0pDZDdDWUl2ckRDMllmYWppZTdHOUczcm4vTEJCVWJv?=
 =?utf-8?B?ZHA4S1Z2aHdPTElEUjBtS2k3bkhaUitMTkVJRmx1dytQeEJrVGs3S0lyd3gy?=
 =?utf-8?B?RlJBWlMvMGRzQ0pwakdRVm5ZZ09RUXl3SnVWckROeVZIbE1mczU1cmtCZVFq?=
 =?utf-8?B?UFRHWXZyazlBRGRTQkthWVpxby84cGppR0x0TTZMcGZPQVhhbGMyU0ZPay9P?=
 =?utf-8?B?SVhWVHJ1cE03U1YyU1JhdGNmWVoxdGRSSUlLOWxscFRYcXh0WFJNZ2pXcmp4?=
 =?utf-8?B?ZHhoTXhIblh2dVRWamU1b0VlaEwrUytEbnowZWtyNVl3UUtBaTM5b3piS3d6?=
 =?utf-8?B?NlZGU2xUYzVQa0pWZHhQQnlEUUcvbkUvVVliVVdRNTZaOUF6cVl3N01zNFI5?=
 =?utf-8?B?Y1NNSER4MnkrdUp4TDZlM1lVcnJQZldOS3lZS1RTY1d0RmlNdE9JbWh0NUZp?=
 =?utf-8?B?a0dUc2p3QzIwYTRaZ3R6QSthc1l6QVB6RXBZVzdmUFlLMzluQTAzOUQ4dUs2?=
 =?utf-8?Q?8PfK7cAgmmV8OnHFcr+6ii+Dl2wMkyzWWZGmZsd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c639130d-82c0-4246-9f57-08d97c8071b7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 21:48:55.7512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltyo1WgRWINcrsUhZV1GhbA2rpnR+95NAmqA1vWMmANa74Zlf7RBsqi1V+9SflU14HlkY/5VfXLUz53JIbRLPgEnfEWCWYlys5bWNSfJQbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5578
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
> Implement multi-lrc submission via a single workqueue entry and single
> H2G. The workqueue entry contains an updated tail value for each
> request, of all the contexts in the multi-lrc submission, and updates
> these values simultaneously. As such, the tasklet and bypass path have
> been updated to coalesce requests into a single submission.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  21 ++
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   8 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  24 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   6 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 312 +++++++++++++++---
>   drivers/gpu/drm/i915/i915_request.h           |   8 +
>   6 files changed, 317 insertions(+), 62 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index fbfcae727d7f..879aef662b2e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -748,3 +748,24 @@ void intel_guc_load_status(struct intel_guc *guc, struct drm_printer *p)
>   		}
>   	}
>   }
> +
> +void intel_guc_write_barrier(struct intel_guc *guc)
> +{
> +	struct intel_gt *gt = guc_to_gt(guc);
> +
> +	if (i915_gem_object_is_lmem(guc->ct.vma->obj)) {
> +		GEM_BUG_ON(guc->send_regs.fw_domains);
Granted, this patch is just moving code from one file to another not 
changing it. However, I think it would be worth adding a blank line in 
here. Otherwise the 'this register' comment below can be confusingly 
read as referring to the send_regs.fw_domain entry above.

And maybe add a comment why it is a bug for the send_regs value to be 
set? I'm not seeing any obvious connection between it and the reset of 
this code.

> +		/*
> +		 * This register is used by the i915 and GuC for MMIO based
> +		 * communication. Once we are in this code CTBs are the only
> +		 * method the i915 uses to communicate with the GuC so it is
> +		 * safe to write to this register (a value of 0 is NOP for MMIO
> +		 * communication). If we ever start mixing CTBs and MMIOs a new
> +		 * register will have to be chosen.
> +		 */
> +		intel_uncore_write_fw(gt->uncore, GEN11_SOFT_SCRATCH(0), 0);
> +	} else {
> +		/* wmb() sufficient for a barrier if in smem */
> +		wmb();
> +	}
> +}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 3f95b1b4f15c..0ead2406d03c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -37,6 +37,12 @@ struct intel_guc {
>   	/* Global engine used to submit requests to GuC */
>   	struct i915_sched_engine *sched_engine;
>   	struct i915_request *stalled_request;
> +	enum {
> +		STALL_NONE,
> +		STALL_REGISTER_CONTEXT,
> +		STALL_MOVE_LRC_TAIL,
> +		STALL_ADD_REQUEST,
> +	} submission_stall_reason;
>   
>   	/* intel_guc_recv interrupt related state */
>   	spinlock_t irq_lock;
> @@ -332,4 +338,6 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc);
>   
>   void intel_guc_load_status(struct intel_guc *guc, struct drm_printer *p);
>   
> +void intel_guc_write_barrier(struct intel_guc *guc);
> +
>   #endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 20c710a74498..10d1878d2826 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -377,28 +377,6 @@ static u32 ct_get_next_fence(struct intel_guc_ct *ct)
>   	return ++ct->requests.last_fence;
>   }
>   
> -static void write_barrier(struct intel_guc_ct *ct)
> -{
> -	struct intel_guc *guc = ct_to_guc(ct);
> -	struct intel_gt *gt = guc_to_gt(guc);
> -
> -	if (i915_gem_object_is_lmem(guc->ct.vma->obj)) {
> -		GEM_BUG_ON(guc->send_regs.fw_domains);
> -		/*
> -		 * This register is used by the i915 and GuC for MMIO based
> -		 * communication. Once we are in this code CTBs are the only
> -		 * method the i915 uses to communicate with the GuC so it is
> -		 * safe to write to this register (a value of 0 is NOP for MMIO
> -		 * communication). If we ever start mixing CTBs and MMIOs a new
> -		 * register will have to be chosen.
> -		 */
> -		intel_uncore_write_fw(gt->uncore, GEN11_SOFT_SCRATCH(0), 0);
> -	} else {
> -		/* wmb() sufficient for a barrier if in smem */
> -		wmb();
> -	}
> -}
> -
>   static int ct_write(struct intel_guc_ct *ct,
>   		    const u32 *action,
>   		    u32 len /* in dwords */,
> @@ -468,7 +446,7 @@ static int ct_write(struct intel_guc_ct *ct,
>   	 * make sure H2G buffer update and LRC tail update (if this triggering a
>   	 * submission) are visible before updating the descriptor tail
>   	 */
> -	write_barrier(ct);
> +	intel_guc_write_barrier(ct_to_guc(ct));
>   
>   	/* update local copies */
>   	ctb->tail = tail;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index 0e600a3b8f1e..6cd26dc060d1 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -65,12 +65,14 @@
>   #define   WQ_TYPE_PSEUDO		(0x2 << WQ_TYPE_SHIFT)
>   #define   WQ_TYPE_INORDER		(0x3 << WQ_TYPE_SHIFT)
>   #define   WQ_TYPE_NOOP			(0x4 << WQ_TYPE_SHIFT)
> -#define WQ_TARGET_SHIFT			10
> +#define   WQ_TYPE_MULTI_LRC		(0x5 << WQ_TYPE_SHIFT)
> +#define WQ_TARGET_SHIFT			8
>   #define WQ_LEN_SHIFT			16
>   #define WQ_NO_WCFLUSH_WAIT		(1 << 27)
>   #define WQ_PRESENT_WORKLOAD		(1 << 28)
>   
> -#define WQ_RING_TAIL_SHIFT		20
> +#define WQ_GUC_ID_SHIFT			0
> +#define WQ_RING_TAIL_SHIFT		18
Presumably all of these API changes are not actually new? They really 
came in with the reset of the v40 re-write? It's just that this is the 
first time we are using them and therefore need to finally update the 
defines?

>   #define WQ_RING_TAIL_MAX		0x7FF	/* 2^11 QWords */
>   #define WQ_RING_TAIL_MASK		(WQ_RING_TAIL_MAX << WQ_RING_TAIL_SHIFT)
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index e9dfd43d29a0..b107ad095248 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -391,6 +391,29 @@ __get_process_desc(struct intel_context *ce)
>   		   LRC_STATE_OFFSET) / sizeof(u32)));
>   }
>   
> +static u32 *get_wq_pointer(struct guc_process_desc *desc,
> +			   struct intel_context *ce,
> +			   u32 wqi_size)
> +{
> +	/*
> +	 * Check for space in work queue. Caching a value of head pointer in
> +	 * intel_context structure in order reduce the number accesses to shared
> +	 * GPU memory which may be across a PCIe bus.
> +	 */
> +#define AVAILABLE_SPACE	\
> +	CIRC_SPACE(ce->guc_wqi_tail, ce->guc_wqi_head, GUC_WQ_SIZE)
> +	if (wqi_size > AVAILABLE_SPACE) {
> +		ce->guc_wqi_head = READ_ONCE(desc->head);
> +
> +		if (wqi_size > AVAILABLE_SPACE)
> +			return NULL;
> +	}
> +#undef AVAILABLE_SPACE
> +
> +	return ((u32 *)__get_process_desc(ce)) +
> +		((WQ_OFFSET + ce->guc_wqi_tail) / sizeof(u32));
> +}
> +
>   static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
>   {
>   	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
> @@ -547,10 +570,10 @@ int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
>   
>   static int guc_lrc_desc_pin(struct intel_context *ce, bool loop);
>   
> -static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> +static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   {
>   	int err = 0;
> -	struct intel_context *ce = rq->context;
> +	struct intel_context *ce = request_to_scheduling_context(rq);
>   	u32 action[3];
>   	int len = 0;
>   	u32 g2h_len_dw = 0;
> @@ -571,26 +594,17 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   	GEM_BUG_ON(!atomic_read(&ce->guc_id.ref));
>   	GEM_BUG_ON(context_guc_id_invalid(ce));
>   
> -	/*
> -	 * Corner case where the GuC firmware was blown away and reloaded while
> -	 * this context was pinned.
> -	 */
> -	if (unlikely(!lrc_desc_registered(guc, ce->guc_id.id))) {
> -		err = guc_lrc_desc_pin(ce, false);
> -		if (unlikely(err))
> -			return err;
> -	}
> -
>   	spin_lock(&ce->guc_state.lock);
>   
>   	/*
>   	 * The request / context will be run on the hardware when scheduling
> -	 * gets enabled in the unblock.
> +	 * gets enabled in the unblock. For multi-lrc we still submit the
> +	 * context to move the LRC tails.
>   	 */
> -	if (unlikely(context_blocked(ce)))
> +	if (unlikely(context_blocked(ce) && !intel_context_is_parent(ce)))
>   		goto out;
>   
> -	enabled = context_enabled(ce);
> +	enabled = context_enabled(ce) || context_blocked(ce);
Would be better to say '|| is_parent(ce)' rather than blocked? The 
reason for reason for claiming enabled when not is because it's a 
multi-LRC parent, right? Or can there be a parent that is neither 
enabled nor blocked for which we don't want to do the processing? But 
why would that make sense/be possible?

>   
>   	if (!enabled) {
>   		action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
> @@ -609,6 +623,18 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   		trace_intel_context_sched_enable(ce);
>   		atomic_inc(&guc->outstanding_submission_g2h);
>   		set_context_enabled(ce);
> +
> +		/*
> +		 * Without multi-lrc KMD does the submission step (moving the
> +		 * lrc tail) so enabling scheduling is sufficient to submit the
> +		 * context. This isn't the case in multi-lrc submission as the
> +		 * GuC needs to move the tails, hence the need for another H2G
> +		 * to submit a multi-lrc context after enabling scheduling.
> +		 */
> +		if (intel_context_is_parent(ce)) {
> +			action[0] = INTEL_GUC_ACTION_SCHED_CONTEXT;
> +			err = intel_guc_send_nb(guc, action, len - 1, 0);
> +		}
>   	} else if (!enabled) {
>   		clr_context_pending_enable(ce);
>   		intel_context_put(ce);
> @@ -621,6 +647,18 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   	return err;
>   }
>   
> +static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> +{
> +	int ret = __guc_add_request(guc, rq);
> +
> +	if (unlikely(ret == -EBUSY)) {
> +		guc->stalled_request= rq;
> +		guc->submission_stall_reason = STALL_ADD_REQUEST;
> +	}
> +
> +	return ret;
> +}
> +
>   static void guc_set_lrc_tail(struct i915_request *rq)
>   {
>   	rq->context->lrc_reg_state[CTX_RING_TAIL] =
> @@ -632,6 +670,127 @@ static int rq_prio(const struct i915_request *rq)
>   	return rq->sched.attr.priority;
>   }
>   
> +static bool is_multi_lrc_rq(struct i915_request *rq)
> +{
> +	return intel_context_is_child(rq->context) ||
> +		intel_context_is_parent(rq->context);
> +}
> +
> +static bool can_merge_rq(struct i915_request *rq,
> +			 struct i915_request *last)
> +{
> +	return request_to_scheduling_context(rq) ==
> +		request_to_scheduling_context(last);
> +}
> +
> +static u32 wq_space_until_wrap(struct intel_context *ce)
> +{
> +	return (GUC_WQ_SIZE - ce->guc_wqi_tail);
> +}
> +
> +static void write_wqi(struct guc_process_desc *desc,
> +		      struct intel_context *ce,
> +		      u32 wqi_size)
> +{
> +	/*
> +	 * Ensure WQE are visible before updating tail
WQE or WQI?

> +	 */
> +	intel_guc_write_barrier(ce_to_guc(ce));
> +
> +	ce->guc_wqi_tail = (ce->guc_wqi_tail + wqi_size) & (GUC_WQ_SIZE - 1);
> +	WRITE_ONCE(desc->tail, ce->guc_wqi_tail);
> +}
> +
> +static int guc_wq_noop_append(struct intel_context *ce)
> +{
> +	struct guc_process_desc *desc = __get_process_desc(ce);
> +	u32 *wqi = get_wq_pointer(desc, ce, wq_space_until_wrap(ce));
> +
> +	if (!wqi)
> +		return -EBUSY;
> +
> +	*wqi = WQ_TYPE_NOOP |
> +		((wq_space_until_wrap(ce) / sizeof(u32) - 1) << WQ_LEN_SHIFT);
This should have a BUG_ON check that the requested size fits within the 
WQ_LEN field?

Indeed, would be better to use the FIELD macros as they do that kind of 
thing for you.


> +	ce->guc_wqi_tail = 0;
> +
> +	return 0;
> +}
> +
> +static int __guc_wq_item_append(struct i915_request *rq)
> +{
> +	struct intel_context *ce = request_to_scheduling_context(rq);
> +	struct intel_context *child;
> +	struct guc_process_desc *desc = __get_process_desc(ce);
> +	unsigned int wqi_size = (ce->guc_number_children + 4) *
> +		sizeof(u32);
> +	u32 *wqi;
> +	int ret;
> +
> +	/* Ensure context is in correct state updating work queue */
> +	GEM_BUG_ON(!atomic_read(&ce->guc_id.ref));
> +	GEM_BUG_ON(context_guc_id_invalid(ce));
> +	GEM_BUG_ON(context_wait_for_deregister_to_register(ce));
> +	GEM_BUG_ON(!lrc_desc_registered(ce_to_guc(ce), ce->guc_id.id));
> +
> +	/* Insert NOOP if this work queue item will wrap the tail pointer. */
> +	if (wqi_size > wq_space_until_wrap(ce)) {
> +		ret = guc_wq_noop_append(ce);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	wqi = get_wq_pointer(desc, ce, wqi_size);
> +	if (!wqi)
> +		return -EBUSY;
> +
> +	*wqi++ = WQ_TYPE_MULTI_LRC |
> +		((wqi_size / sizeof(u32) - 1) << WQ_LEN_SHIFT);
> +	*wqi++ = ce->lrc.lrca;
> +	*wqi++ = (ce->guc_id.id << WQ_GUC_ID_SHIFT) |
> +		 ((ce->ring->tail / sizeof(u64)) << WQ_RING_TAIL_SHIFT);
As above, would be better to use FIELD macros instead of manual shifting.

John.


> +	*wqi++ = 0;	/* fence_id */
> +	for_each_child(ce, child)
> +		*wqi++ = child->ring->tail / sizeof(u64);
> +
> +	write_wqi(desc, ce, wqi_size);
> +
> +	return 0;
> +}
> +
> +static int guc_wq_item_append(struct intel_guc *guc,
> +			      struct i915_request *rq)
> +{
> +	struct intel_context *ce = request_to_scheduling_context(rq);
> +	int ret = 0;
> +
> +	if (likely(!intel_context_is_banned(ce))) {
> +		ret = __guc_wq_item_append(rq);
> +
> +		if (unlikely(ret == -EBUSY)) {
> +			guc->stalled_request = rq;
> +			guc->submission_stall_reason = STALL_MOVE_LRC_TAIL;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static bool multi_lrc_submit(struct i915_request *rq)
> +{
> +	struct intel_context *ce = request_to_scheduling_context(rq);
> +
> +	intel_ring_set_tail(rq->ring, rq->tail);
> +
> +	/*
> +	 * We expect the front end (execbuf IOCTL) to set this flag on the last
> +	 * request generated from a multi-BB submission. This indicates to the
> +	 * backend (GuC interface) that we should submit this context thus
> +	 * submitting all the requests generated in parallel.
> +	 */
> +	return test_bit(I915_FENCE_FLAG_SUBMIT_PARALLEL, &rq->fence.flags) ||
> +		intel_context_is_banned(ce);
> +}
> +
>   static int guc_dequeue_one_context(struct intel_guc *guc)
>   {
>   	struct i915_sched_engine * const sched_engine = guc->sched_engine;
> @@ -645,7 +804,17 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
>   	if (guc->stalled_request) {
>   		submit = true;
>   		last = guc->stalled_request;
> -		goto resubmit;
> +
> +		switch (guc->submission_stall_reason) {
> +		case STALL_REGISTER_CONTEXT:
> +			goto register_context;
> +		case STALL_MOVE_LRC_TAIL:
> +			goto move_lrc_tail;
> +		case STALL_ADD_REQUEST:
> +			goto add_request;
> +		default:
> +			MISSING_CASE(guc->submission_stall_reason);
> +		}
>   	}
>   
>   	while ((rb = rb_first_cached(&sched_engine->queue))) {
> @@ -653,8 +822,8 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
>   		struct i915_request *rq, *rn;
>   
>   		priolist_for_each_request_consume(rq, rn, p) {
> -			if (last && rq->context != last->context)
> -				goto done;
> +			if (last && !can_merge_rq(rq, last))
> +				goto register_context;
>   
>   			list_del_init(&rq->sched.link);
>   
> @@ -662,33 +831,84 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
>   
>   			trace_i915_request_in(rq, 0);
>   			last = rq;
> -			submit = true;
> +
> +			if (is_multi_lrc_rq(rq)) {
> +				/*
> +				 * We need to coalesce all multi-lrc requests in
> +				 * a relationship into a single H2G. We are
> +				 * guaranteed that all of these requests will be
> +				 * submitted sequentially.
> +				 */
> +				if (multi_lrc_submit(rq)) {
> +					submit = true;
> +					goto register_context;
> +				}
> +			} else {
> +				submit = true;
> +			}
>   		}
>   
>   		rb_erase_cached(&p->node, &sched_engine->queue);
>   		i915_priolist_free(p);
>   	}
> -done:
> +
> +register_context:
>   	if (submit) {
> -		guc_set_lrc_tail(last);
> -resubmit:
> +		struct intel_context *ce = request_to_scheduling_context(last);
> +
> +		if (unlikely(!lrc_desc_registered(guc, ce->guc_id.id) &&
> +			     !intel_context_is_banned(ce))) {
> +			ret = guc_lrc_desc_pin(ce, false);
> +			if (unlikely(ret == -EPIPE)) {
> +				goto deadlk;
> +			} else if (ret == -EBUSY) {
> +				guc->stalled_request = last;
> +				guc->submission_stall_reason =
> +					STALL_REGISTER_CONTEXT;
> +				goto schedule_tasklet;
> +			} else if (ret != 0) {
> +				GEM_WARN_ON(ret);	/* Unexpected */
> +				goto deadlk;
> +			}
> +		}
> +
> +move_lrc_tail:
> +		if (is_multi_lrc_rq(last)) {
> +			ret = guc_wq_item_append(guc, last);
> +			if (ret == -EBUSY) {
> +				goto schedule_tasklet;
> +			} else if (ret != 0) {
> +				GEM_WARN_ON(ret);	/* Unexpected */
> +				goto deadlk;
> +			}
> +		} else {
> +			guc_set_lrc_tail(last);
> +		}
> +
> +add_request:
>   		ret = guc_add_request(guc, last);
> -		if (unlikely(ret == -EPIPE))
> +		if (unlikely(ret == -EPIPE)) {
> +			goto deadlk;
> +		} else if (ret == -EBUSY) {
> +			goto schedule_tasklet;
> +		} else if (ret != 0) {
> +			GEM_WARN_ON(ret);	/* Unexpected */
>   			goto deadlk;
> -		else if (ret == -EBUSY) {
> -			tasklet_schedule(&sched_engine->tasklet);
> -			guc->stalled_request = last;
> -			return false;
>   		}
>   	}
>   
>   	guc->stalled_request = NULL;
> +	guc->submission_stall_reason = STALL_NONE;
>   	return submit;
>   
>   deadlk:
>   	sched_engine->tasklet.callback = NULL;
>   	tasklet_disable_nosync(&sched_engine->tasklet);
>   	return false;
> +
> +schedule_tasklet:
> +	tasklet_schedule(&sched_engine->tasklet);
> +	return false;
>   }
>   
>   static void guc_submission_tasklet(struct tasklet_struct *t)
> @@ -1227,10 +1447,16 @@ static int guc_bypass_tasklet_submit(struct intel_guc *guc,
>   
>   	trace_i915_request_in(rq, 0);
>   
> -	guc_set_lrc_tail(rq);
> -	ret = guc_add_request(guc, rq);
> -	if (ret == -EBUSY)
> -		guc->stalled_request = rq;
> +	if (is_multi_lrc_rq(rq)) {
> +		if (multi_lrc_submit(rq)) {
> +			ret = guc_wq_item_append(guc, rq);
> +			if (!ret)
> +				ret = guc_add_request(guc, rq);
> +		}
> +	} else {
> +		guc_set_lrc_tail(rq);
> +		ret = guc_add_request(guc, rq);
> +	}
>   
>   	if (unlikely(ret == -EPIPE))
>   		disable_submission(guc);
> @@ -1238,6 +1464,16 @@ static int guc_bypass_tasklet_submit(struct intel_guc *guc,
>   	return ret;
>   }
>   
> +bool need_tasklet(struct intel_guc *guc, struct i915_request *rq)
> +{
> +	struct i915_sched_engine *sched_engine = rq->engine->sched_engine;
> +	struct intel_context *ce = request_to_scheduling_context(rq);
> +
> +	return submission_disabled(guc) || guc->stalled_request ||
> +		!i915_sched_engine_is_empty(sched_engine) ||
> +		!lrc_desc_registered(guc, ce->guc_id.id);
> +}
> +
>   static void guc_submit_request(struct i915_request *rq)
>   {
>   	struct i915_sched_engine *sched_engine = rq->engine->sched_engine;
> @@ -1247,8 +1483,7 @@ static void guc_submit_request(struct i915_request *rq)
>   	/* Will be called from irq-context when using foreign fences. */
>   	spin_lock_irqsave(&sched_engine->lock, flags);
>   
> -	if (submission_disabled(guc) || guc->stalled_request ||
> -	    !i915_sched_engine_is_empty(sched_engine))
> +	if (need_tasklet(guc, rq))
>   		queue_request(sched_engine, rq, rq_prio(rq));
>   	else if (guc_bypass_tasklet_submit(guc, rq) == -EBUSY)
>   		tasklet_hi_schedule(&sched_engine->tasklet);
> @@ -2241,9 +2476,10 @@ static bool new_guc_prio_higher(u8 old_guc_prio, u8 new_guc_prio)
>   
>   static void add_to_context(struct i915_request *rq)
>   {
> -	struct intel_context *ce = rq->context;
> +	struct intel_context *ce = request_to_scheduling_context(rq);
>   	u8 new_guc_prio = map_i915_prio_to_guc_prio(rq_prio(rq));
>   
> +	GEM_BUG_ON(intel_context_is_child(ce));
>   	GEM_BUG_ON(rq->guc_prio == GUC_PRIO_FINI);
>   
>   	spin_lock(&ce->guc_state.lock);
> @@ -2276,7 +2512,9 @@ static void guc_prio_fini(struct i915_request *rq, struct intel_context *ce)
>   
>   static void remove_from_context(struct i915_request *rq)
>   {
> -	struct intel_context *ce = rq->context;
> +	struct intel_context *ce = request_to_scheduling_context(rq);
> +
> +	GEM_BUG_ON(intel_context_is_child(ce));
>   
>   	spin_lock_irq(&ce->guc_state.lock);
>   
> @@ -2692,7 +2930,7 @@ static void guc_init_breadcrumbs(struct intel_engine_cs *engine)
>   static void guc_bump_inflight_request_prio(struct i915_request *rq,
>   					   int prio)
>   {
> -	struct intel_context *ce = rq->context;
> +	struct intel_context *ce = request_to_scheduling_context(rq);
>   	u8 new_guc_prio = map_i915_prio_to_guc_prio(prio);
>   
>   	/* Short circuit function */
> @@ -2715,7 +2953,7 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
>   
>   static void guc_retire_inflight_request_prio(struct i915_request *rq)
>   {
> -	struct intel_context *ce = rq->context;
> +	struct intel_context *ce = request_to_scheduling_context(rq);
>   
>   	spin_lock(&ce->guc_state.lock);
>   	guc_prio_fini(rq, ce);
> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> index 177eaf55adff..8f0073e19079 100644
> --- a/drivers/gpu/drm/i915/i915_request.h
> +++ b/drivers/gpu/drm/i915/i915_request.h
> @@ -139,6 +139,14 @@ enum {
>   	 * the GPU. Here we track such boost requests on a per-request basis.
>   	 */
>   	I915_FENCE_FLAG_BOOST,
> +
> +	/*
> +	 * I915_FENCE_FLAG_SUBMIT_PARALLEL - request with a context in a
> +	 * parent-child relationship (parallel submission, multi-lrc) should
> +	 * trigger a submission to the GuC rather than just moving the context
> +	 * tail.
> +	 */
> +	I915_FENCE_FLAG_SUBMIT_PARALLEL,
>   };
>   
>   /**

