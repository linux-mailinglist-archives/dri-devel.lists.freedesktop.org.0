Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E421A7056EE
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 21:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB2210E368;
	Tue, 16 May 2023 19:17:56 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEEC510E366;
 Tue, 16 May 2023 19:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684264673; x=1715800673;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XN44ZkHC/+aO/9qqH4+heAOvdoQBHdt3YKXWDXJtS7I=;
 b=fRkmU2JAA0zj29pwNaZ+IWbonJpGFMdDmPOmdUhK50yUnWKkwz5TtmI9
 /qTUX5tKSEEbDmp91szskaJhpdKd5lo3X5VAAd80q9rcJwAErXwOPJIyJ
 yS5nQXLGkUtGX+cgdrfO5Wq73CEpA0Y+qr8edg/qrfG3NVl2P9ohoTjuW
 c98ALQP/UaNiCOKeddS3fesHy4RAYdKgrTCkF0eGSW9C+WEn8B93zxqIQ
 lB1TMRBLoEvrfOaJ0XJCgF3vCyDnPVq5nNzwi9u7tWdPGRAm95nvHBPWG
 bQloVXco+3rzUpv6mLIM79kLVPLRJzwEk4yQBH9q+3WnPsjQGnMttuyGP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="354732609"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="354732609"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 12:17:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="813575702"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="813575702"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 16 May 2023 12:17:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 12:17:50 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 12:17:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 12:17:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 12:17:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRD2FJNIVJ1sBbyZARf74itoOe0rA1PilvS7hRZKGNuUu5cFtglq8HJhW3ispdhmLN4ysx8dcxEH2EfZO+6anuCJP0iyluK+Os7FFK1YBrrs21hrkZxglH1u6j0f1SaOv5eZ15Som3wQU8Z0QjLZSMH+Nc5ZU7xh4Jo+mIDSkTiW7H/PGisX9aOcYGH+x/uoaB4JgDdeMSKEmxT9TxawkNRmnhhspYfLaOkUft+iYQ7qvTuqKSi5HZIt4aXnGxmteRh5x6MOeQviSwiazERSFjzp6Utd4+wuwnl1nyvv4+Yc1dl70Vv8DfeZJGZxW84sspIaHZjoaDd7v3fEOEVM1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6x6u8RPPimGxLyGyRWBxvKZnW+pQpYwmLCu+tvHydc=;
 b=hoE1HKCMX+m8C6Y85qzB03VQgbcwuOjddAJsc8gHzhT2liPrEYWtze6TF2oCRQuOjklB8TAFPL1vEW3vCuBWkzOMFlgmavkIyI8w+eXVy1OXEr9lNiplcvRTg66coBiGqJgbRLHcM5gLgqqfZZNBMUsQhq6UDs/G3bU0DcoIDxOA2LclnDPtnyvqDWMrXlEVW7UPr7iEILb71PXmJ9nYZmejpCwsOoaNGVQZhUa75SLexwsgKS8eg+8q/7SzVpryvp4K5mZn4UUeZb1RCOzHj1cmqEI69tMPDC8l6zgSN6ZB0i5LP5Uj6k1Q/IU+3npD1gasO08I7ZVPkOnNaMmgQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by BL1PR11MB5336.namprd11.prod.outlook.com (2603:10b6:208:316::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.31; Tue, 16 May
 2023 19:17:47 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5ec8:e1d9:fbae:5b2a]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5ec8:e1d9:fbae:5b2a%4]) with mapi id 15.20.6387.033; Tue, 16 May 2023
 19:17:47 +0000
Message-ID: <d87642be-1d75-a784-7f00-e2d84c696184@intel.com>
Date: Tue, 16 May 2023 12:17:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH v2 2/2] drm/i915/guc: Dump error capture to
 dmesg on CTB error
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230418181744.3251240-1-John.C.Harrison@Intel.com>
 <20230418181744.3251240-3-John.C.Harrison@Intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20230418181744.3251240-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0107.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::22) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|BL1PR11MB5336:EE_
X-MS-Office365-Filtering-Correlation-Id: c08adcf1-402f-4eca-7a4d-08db56423bac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9blUnQIk33skC7AyLIX/qpdk9WrQpI14Qff2F/mcojN6Y2KsO848/vJLLPxjp/Hqj+HVHmC7BnVmi3ZMo6dmrylJ40CRno66f+wEni1fQbGae/Jpc2z7hH5UDjGmtVxGnPmi59TLlu82I8OnpsfAJDeoRsT4XL7qB+1MM+o1edLzuVWPlKdCKhQz1E+XMNPg7iXyh/iL5HDsQ0F2MK7VESD/p7Lka5664n1de+CjaQk3YwqVUw0384XogQh/52uu/ysSdY46a6f8S1IU0CYHRxEf/jCqRCGwFvwb3exDKoZZXCmBn8tBXAMFufQX+x7VobMT5M7aL+IZcK2uck9O3AJIYq1no4+0/DfCwoBVC5bMzGJSshdDVdMq/P8aLHcJMnEnfOd8avmJJ2nW25mrg00D6U7z7T08MZNzsKVNx/sTem7mlk9WmyDnuuZJy8+mKPb/wL7752FLIcfsPrJv1EPfaIFuvHsqQNhPOW8+iJQ2BuRGHvOcCpdvoaAWkj0VvgdxHmLifebwl8Ro6ahC/b3drhHo4SBfrdDnmGytoN5U7/dWh1SyxJmMVRTn/msQAvgQVfii5TUWIdQaJUm9FmJOL3i3IOBc/GwCp4Dow6LD/JYIW9pJNzO2iozEJmceBbl+LT0exRWPiCUtL+xUBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199021)(31686004)(31696002)(36756003)(4326008)(2906002)(316002)(86362001)(8936002)(5660300002)(66556008)(66946007)(82960400001)(66476007)(38100700002)(8676002)(41300700001)(450100002)(53546011)(6512007)(6506007)(26005)(6486002)(186003)(478600001)(83380400001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RG5NQnZHYm4zNC80SDFyMXNRaDRpTVVvelM0cjczQmZRaVVBdk0zN0VxR09J?=
 =?utf-8?B?VjNaMEc2WTZuWWZpVi9vbjNHMnVLY0R0a01Peng4ckRqbGxWYlpVQVl5dytz?=
 =?utf-8?B?OWN6cUVwWkxSb2R6a0p2ZFFrNXdYZXBsaVhSVWcrREZlYkNtaEFQb2pYbm12?=
 =?utf-8?B?U25NM0FCaklBZkxXUnpZdUVnUWt0bGx0bnB0cDh6b3NHekRjYVF1REpEOEFV?=
 =?utf-8?B?K1IrbmZzbU90UWJscVdKdTVLVlhqRG9tSGFBREFvSFlFcEUzb1FRZi9HeUpE?=
 =?utf-8?B?R0l2bER1MjFUcG5QWXlHdldwVlNwWE1ZZmFoYVArQUNqQVJzYWtyTTQ2eURv?=
 =?utf-8?B?dnVQb2t2bW9mam1VSDJvTUMzKzY3T3dSbDhYQXVwc0xnQlpwSUVrZlRsMTIw?=
 =?utf-8?B?cDVoT3cxNE5yTGdGQU5MNmlUd2pjdkhLUUtGa3ZvbldzeTBmQ211L0R2M2wr?=
 =?utf-8?B?c0lGZ1hGdmhjcmlqSWVpa0pKbGVkeHNGMllKUlRqWWRoVGJPYUx2TFBESFgw?=
 =?utf-8?B?V0FrSUE2emdqdTB6L1M5dDhXTlFMUzdiMHdmektlWklPencyamdWbVZyVVYr?=
 =?utf-8?B?aVJEejQ1cldmcXNWd0RaVzFxanVseGJzQnhNcUtGSEN5dkpBMDBabU9qMkll?=
 =?utf-8?B?N2twVDROZHhVNzhVaCtGbnZTbVRCUUkwV0Q1VjBjNzh2Y284ODg1TENDRlU3?=
 =?utf-8?B?a3owSDFLOEx4N0JRRlVtcHUramVVamU2OG1Md2N3L3NXSXJoSkQ5V2JFZmc1?=
 =?utf-8?B?TnZmMXp0WGY1Nk5OS0F3bXZHRlVwd3M4OU5aVmNvWGUvVXhORWNOY2huZGRO?=
 =?utf-8?B?ZU00UE1hdkxyd1owbm9qdTRCR1ZkV1NUT3Q2TzZhS1lTdzVJR0E0RDFySHFB?=
 =?utf-8?B?VzRpZ2xMKzBpRnl1TkRoN2MxdjBkU2VNcml2RldtK0ZobVQ4VGlUZk9sc3ox?=
 =?utf-8?B?V0tTUkxveHdGUU1hRmhaWnRyL08rbzluNEhUNnVuRC9CVS9VWWpVK0IramdQ?=
 =?utf-8?B?aDF5dGh0dTdURlNKYmxRNGhnUExlK0NTbnZEOFhzWm8yNHBTZUxGd0JYUXMy?=
 =?utf-8?B?cFNlZXAybFJ6YlVkT2haRkE2N0dUUGVBNU5mdnFjbnVtMElITjN4VWZ3am4x?=
 =?utf-8?B?NVJIZHk5MFQzVlJaRUtiOEtGaUN1Umg3cUUvREJjZU8yVDdkNDZBdldZWTVI?=
 =?utf-8?B?eFhqMDlSZEJjUEVoelB4MnBHR1FMeHlpWjNiQk43MW9wY0pIR3RlQlBGUk8r?=
 =?utf-8?B?WU00cEZESlptK0dXekRweDFHUFB3enZ6VU5LNzJHWHRkQmhUV0wvM2l6TWgx?=
 =?utf-8?B?VExxR2RFaGJXR09OdzkvaWJQeTM5bG1TUmZDSThHUzU0RzVxTzRPa2h5dnE4?=
 =?utf-8?B?S2NpZmVOcEhKblZPeXc5ZUF5a2FnWUwzTWpYSGY0am96ZFRIZnhIaUVOOEZo?=
 =?utf-8?B?KzZjRDQyYWg2TnFVeDgxN1ZhcVNxRVB6L2FFRkZJeFl5R2VyM3dRMklHK1BY?=
 =?utf-8?B?YTBvSVpYUmRDY2Jscm1pQjN6QkJEa0tFYkk5OVFaaWVBTkQreDBSaXBOejg2?=
 =?utf-8?B?MXdLTkZXR2M5cFhjbXBaSkhWLzc0NjVFMlpYaWxWZ0hLUmt6WTNLdFRuVUND?=
 =?utf-8?B?TXBvb3dDQUhOL2V1YVZZYnQ1cXpiUjdOVTFLUkYyTFdXWXY1MW8vYkFITVFJ?=
 =?utf-8?B?RzcyZ0FyalNWeTYxYXhqUmNFRHpqQkVDVGp3YTd0OUJSQ01wR1R2aSs4cFgy?=
 =?utf-8?B?Vm14TDNFZ29LRlhxcmtyRFo3cG5FeEp2Ni9BRzlhMDByV3poWEJZQkpUNVlq?=
 =?utf-8?B?dUZQZHZSSFpIZG05L3lFNjhOaFNUWC9qZjNNMmx0K3JudzBpcXFSMUNtc2sz?=
 =?utf-8?B?THlmUCtOU3hzOGdZKytiNkt5VmRGelJoU1RxUFRSTHVycjR5aEN1Snd4UTVr?=
 =?utf-8?B?SjBzT0VFUWpXVkJYRHF4WkE5UzdDNFVSemdyYzVuZDFYeTlUTm4xcHZPaC9z?=
 =?utf-8?B?c3piVHYyWTVwaGcxNWFzcis5QXY4S3BjbEFVUkE4akM0WlNmMWxCTjJFNVll?=
 =?utf-8?B?RTlrV2NSZzd5UUhiZHEyTWtWdGpCMDhoanA1UERVb0UxSjlWMS84WC90TzZh?=
 =?utf-8?B?WE5LbHJrNGg1UDZVVGp2SlBBVDN6R1lMdkRaaUVsNGxhb3FQTkRjTTFYSWx6?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c08adcf1-402f-4eca-7a4d-08db56423bac
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 19:17:47.3721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0YcCSutNkYb13X8Rr6FduK0xvRr0i9ozt+6+PEkr4Cf03ZB72ZHNwQlQdEkFA5D6ltZT+kGRpqWMZnuhEmm2KreXh0lUcXbwPY7odbVNdUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5336
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


On 4/18/2023 11:17 AM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> In the past, There have been sporadic CTB failures which proved hard
> to reproduce manually. The most effective solution was to dump the GuC
> log at the point of failure and let the CI system do the repro. It is
> preferable not to dump the GuC log via dmesg for all issues as it is
> not always necessary and is not helpful for end users. But rather than
> trying to re-invent the code to do this each time it is wanted, commit
> the code but for DEBUG_GUC builds only.
>
> v2: Use IS_ENABLED for testing config options.

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 53 +++++++++++++++++++++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  6 +++
>   2 files changed, 59 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 1803a633ed648..dc5cd712f1ff5 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -13,6 +13,30 @@
>   #include "intel_guc_ct.h"
>   #include "intel_guc_print.h"
>   
> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
> +enum {
> +	CT_DEAD_ALIVE = 0,
> +	CT_DEAD_SETUP,
> +	CT_DEAD_WRITE,
> +	CT_DEAD_DEADLOCK,
> +	CT_DEAD_H2G_HAS_ROOM,
> +	CT_DEAD_READ,
> +	CT_DEAD_PROCESS_FAILED,
> +};
> +
> +static void ct_dead_ct_worker_func(struct work_struct *w);
> +
> +#define CT_DEAD(ct, reason)	\
> +	do { \
> +		if (!(ct)->dead_ct_reported) { \
> +			(ct)->dead_ct_reason |= 1 << CT_DEAD_##reason; \
> +			queue_work(system_unbound_wq, &(ct)->dead_ct_worker); \
> +		} \
> +	} while (0)
> +#else
> +#define CT_DEAD(ct, reason)	do { } while (0)
> +#endif
> +
>   static inline struct intel_guc *ct_to_guc(struct intel_guc_ct *ct)
>   {
>   	return container_of(ct, struct intel_guc, ct);
> @@ -93,6 +117,9 @@ void intel_guc_ct_init_early(struct intel_guc_ct *ct)
>   	spin_lock_init(&ct->requests.lock);
>   	INIT_LIST_HEAD(&ct->requests.pending);
>   	INIT_LIST_HEAD(&ct->requests.incoming);
> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
> +	INIT_WORK(&ct->dead_ct_worker, ct_dead_ct_worker_func);
> +#endif
>   	INIT_WORK(&ct->requests.worker, ct_incoming_request_worker_func);
>   	tasklet_setup(&ct->receive_tasklet, ct_receive_tasklet_func);
>   	init_waitqueue_head(&ct->wq);
> @@ -319,11 +346,16 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
>   
>   	ct->enabled = true;
>   	ct->stall_time = KTIME_MAX;
> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
> +	ct->dead_ct_reported = false;
> +	ct->dead_ct_reason = CT_DEAD_ALIVE;
> +#endif
>   
>   	return 0;
>   
>   err_out:
>   	CT_PROBE_ERROR(ct, "Failed to enable CTB (%pe)\n", ERR_PTR(err));
> +	CT_DEAD(ct, SETUP);
>   	return err;
>   }
>   
> @@ -434,6 +466,7 @@ static int ct_write(struct intel_guc_ct *ct,
>   corrupted:
>   	CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
>   		 desc->head, desc->tail, desc->status);
> +	CT_DEAD(ct, WRITE);
>   	ctb->broken = true;
>   	return -EPIPE;
>   }
> @@ -504,6 +537,7 @@ static inline bool ct_deadlocked(struct intel_guc_ct *ct)
>   		CT_ERROR(ct, "Head: %u\n (Dwords)", ct->ctbs.recv.desc->head);
>   		CT_ERROR(ct, "Tail: %u\n (Dwords)", ct->ctbs.recv.desc->tail);
>   
> +		CT_DEAD(ct, DEADLOCK);
>   		ct->ctbs.send.broken = true;
>   	}
>   
> @@ -552,6 +586,7 @@ static inline bool h2g_has_room(struct intel_guc_ct *ct, u32 len_dw)
>   			 head, ctb->size);
>   		desc->status |= GUC_CTB_STATUS_OVERFLOW;
>   		ctb->broken = true;
> +		CT_DEAD(ct, H2G_HAS_ROOM);
>   		return false;
>   	}
>   
> @@ -908,6 +943,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
>   	CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
>   		 desc->head, desc->tail, desc->status);
>   	ctb->broken = true;
> +	CT_DEAD(ct, READ);
>   	return -EPIPE;
>   }
>   
> @@ -1057,6 +1093,7 @@ static bool ct_process_incoming_requests(struct intel_guc_ct *ct)
>   	if (unlikely(err)) {
>   		CT_ERROR(ct, "Failed to process CT message (%pe) %*ph\n",
>   			 ERR_PTR(err), 4 * request->size, request->msg);
> +		CT_DEAD(ct, PROCESS_FAILED);
>   		ct_free_msg(request);
>   	}
>   
> @@ -1233,3 +1270,19 @@ void intel_guc_ct_print_info(struct intel_guc_ct *ct,
>   	drm_printf(p, "Tail: %u\n",
>   		   ct->ctbs.recv.desc->tail);
>   }
> +
> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
> +static void ct_dead_ct_worker_func(struct work_struct *w)
> +{
> +	struct intel_guc_ct *ct = container_of(w, struct intel_guc_ct, dead_ct_worker);
> +	struct intel_guc *guc = ct_to_guc(ct);
> +
> +	if (ct->dead_ct_reported)
> +		return;
> +
> +	ct->dead_ct_reported = true;
> +
> +	guc_info(guc, "CTB is dead - reason=0x%X\n", ct->dead_ct_reason);
> +	intel_klog_error_capture(guc_to_gt(guc), (intel_engine_mask_t)~0U);
> +}
> +#endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> index f709a19c7e214..818415b64f4d1 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> @@ -85,6 +85,12 @@ struct intel_guc_ct {
>   
>   	/** @stall_time: time of first time a CTB submission is stalled */
>   	ktime_t stall_time;
> +
> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
> +	int dead_ct_reason;
> +	bool dead_ct_reported;
> +	struct work_struct dead_ct_worker;
> +#endif
>   };
>   
>   void intel_guc_ct_init_early(struct intel_guc_ct *ct);
