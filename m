Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A99C67F3A9
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 02:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0AB10E2E4;
	Sat, 28 Jan 2023 01:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA9889143;
 Sat, 28 Jan 2023 01:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674868837; x=1706404837;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1kwTjAeDlxMRX/ZaaLUip2hlhydKGBoUncawjVY7puw=;
 b=FlNGLE9fie7vcZDaKqAJcn98vNNFMfRykFxcFaTJ3IjyNQf88IbDI2ZB
 gZGUbgRcyAeEAac9vWv2pvfomYLIj/ppuDSqHTYJ0diYkGhS1rwgDbPn3
 qmzuL++ys0FDmayHFHpAk/JDe0VW8xluXcVnkYhAEfGHLla/NS9msJCNs
 NVmHv/7NYXSJLb0yE4Rd6nEz4ueiAxcKl2lUSUo0j3HR6x/O46MVVM7mk
 BiGvwRhI3YVXhGfQKWkOKWWq43vhyqVpxiWm//GAEwH721QmDWRYsoXGV
 ANHaauxMx20Sp2T31L4pFUlgCKG5ILDBTn+iDI/R62bvZZXGUM6ADTyrU w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="315198409"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; d="scan'208";a="315198409"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 17:20:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="693906876"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; d="scan'208";a="693906876"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 27 Jan 2023 17:20:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 27 Jan 2023 17:20:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 27 Jan 2023 17:20:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 27 Jan 2023 17:20:35 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 27 Jan 2023 17:20:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGjOlewcNfgWEdik7DtDsAvB31hsfNtZJIWh4r13chSW6DAMfLLJSMY4E+th1yV/6GpJdhQTOZx6XXCIyZwhUbp/m+xdCcvBvZ1Ln+yzcKBxgeynxpTIsG2nI9MY3uqZeOAwfzUKS2K2WDFz3jO7w+FxOC3qv/YWbtVYvJ1nzrVrgrLLxKE2Sz8XkaiOUpg6uIyqnY9swGpr+/463m0b1/oWA6yAmONe1CBp7ZywjrdShKshRmS33Yv8Y2CTupRu5p9qcPUh2HFWVkhR/vIGXTIa5c4mFqVgJ+j3JXPCjDM82NpRqo4NqfegBSh3vXsbmLROxjOg+AWJLoDYq/LH4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sH0nAX3fXfwS2OA+gLzuvXy6dvNyGvUbXCppEOEUr5E=;
 b=Hni3spHBJQQZj/+P64TD/ztVloftC1i1GdYqHnRZV+4YibUElvtGO91LsUhAoaImZEkF2susAwr2UDVz55ApEYoQxB/rUN9V8Az+Iy8lqb5AV++vLpefFpuGitpOOj2lD4KtY7nZk07oM/ikCosubAfr2hmP6r2uO52M20Nu/LbUUym5oENfzHjWQ2nHFYpi+8bFYoWH2YBfvq7Zf+4J2ED4/8Ae/awzJBioWwLdc3rWmSn+OeLYiHYUvNVlpB58E3MWdW99T53Yiedq+J3iIeJ7e+JIPrHarXasJ/7z963ovEGWdE6y9fRgvpYivUZgYdiJkpNgOOGewCljPzZpAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH7PR11MB6556.namprd11.prod.outlook.com (2603:10b6:510:1aa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Sat, 28 Jan
 2023 01:20:33 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25%4]) with mapi id 15.20.6043.022; Sat, 28 Jan 2023
 01:20:33 +0000
Message-ID: <769c37b7-3f9f-3cec-92d2-d6aba18d4651@intel.com>
Date: Fri, 27 Jan 2023 17:20:30 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v2 6/8] drm/i915/guc: Update GuC messages in
 intel_guc_log.c
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230124170522.1808-1-michal.wajdeczko@intel.com>
 <20230124170522.1808-7-michal.wajdeczko@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230124170522.1808-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0064.namprd05.prod.outlook.com
 (2603:10b6:a03:332::9) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH7PR11MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: c96a7603-fe76-42ed-31f5-08db00cdda59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nHpWrW7T/nZBw2xYBql2ADImV/WG2+KuxiocwaG+Y1o3BfT6YGAfRFuc1TL1X9GraZ9vnxXf80sv0/zvUygfBmabtrv9GLojC+FSEGgQbSFgw2SP4h6RvZptNLV5RxoHpNyUxbpiYnpc2dIm960WGmD0R80NibknoMh2ToYV+DJs1nwId2hBv6JzsZN/IMAkfWScc5XVBxCnO3jpmzwISAWq5T1xOmlX0j59iSBLyBC6/LiRwPr7M3RkLmo9kCCUKGacdozL/Xkw1iMXxrCn9OpmCUbRz5Ih+wjM52E421L+lO4UVtYeK9sSoCM/XXY1av8Ghhc/GpocGcDZRSsKF+ScyfZAahGqCieO+4MD5w2bpbczn4ndL8/h1qeJYQOx7NwFkNHhHj828SubJxcufZA6/pqLHrZNmNwFXf/IqZPTWWwJOBlgztOElnlpeEdCOpXFs1Q67EzgcuU/Fj+jq5cW2B9nnREuU7ASQpz9uqfAvS7vysfogZj/7VBCNvn9UD4u51lY80p6Zy/JFwWrey1KYQ2YoOFOnI0ItAKe9NAFZ808lnqYnxoYaWCyHTpd3Lzi3FfwMnZ9YetTaA21RzXzxaediCTmn9amt7ZcuttvhW9zYNjTjafTMoXSP0bNY4CNAyYCQ0jKcwNYFw1BjwDTuRQPNieNaZZqOG7uw9U2i3mF9wezUx4euVa/7YHXJBPOvjXIiuyynmnuQBYsOJH3oicIehVjape3UkGuhP4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199018)(66476007)(8936002)(41300700001)(5660300002)(36756003)(15650500001)(66556008)(2906002)(31686004)(66946007)(31696002)(4326008)(478600001)(6486002)(8676002)(82960400001)(86362001)(38100700002)(450100002)(2616005)(6506007)(53546011)(26005)(186003)(316002)(6512007)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjAvODc5eENCT01aZmNKZHhqTkhGdlJyMzdtS1V4OTZieW5wY2wxVGFtTUZa?=
 =?utf-8?B?Mm1DaW5xMGRPNmxXUUZvZkU1dm1YVjY5M0NnUlgzU2RaVHJVY0g5aGdzYVBw?=
 =?utf-8?B?YXpKdXRIclBESVJNMVNlMzY0anIwTVFvbGFibWhIOGhacDhIUU5ucWdkeUl3?=
 =?utf-8?B?OERLbGttaXJ1a2xPV204b0NleWUybHJtSUFvUXNLZmJKejlOZU9RL0YyZjlm?=
 =?utf-8?B?L2I0eGczQzdraUk3NXBGSXY1b0RQNGlLSzFQMkQ0V29PMmp6ejlWSmdhMDlz?=
 =?utf-8?B?ekRueEJpRVhKcDlZdXdFQ0ZyeUxPcE02b3R0RGIwaTZzQ0pCeHNEY1pNQ0NI?=
 =?utf-8?B?NzZLWC96Q3U3cHpXSnV2em96TS9CZjUrWFNWRk1UVm1qNU9tLzhubHdDbjBS?=
 =?utf-8?B?b3BuVUFKQnNVS2dtZ3ZwVzFJdWZSNzg3RFYvYVYyd3VxR25vVTM0QTlYZW5Y?=
 =?utf-8?B?eVNJQjYwYTBKYWx1cGNDRHNUWEZPa2twcnA4cHprMlkzblRoRUg5Q0RLeEVj?=
 =?utf-8?B?VWVFSjI2YVZCMFk0eU5XRERNYThQTmdoMHAva1F2Znp1MldwMmJLb0xCV1NP?=
 =?utf-8?B?SjIxQWJLUFpZTm1uNjBaeEdTT2Z2aThhenlDTVVUVGRhRU0xS1dCajNKWGh3?=
 =?utf-8?B?SU9IMmJZZmkyT1JHUGhISjRJYlVOTTVxSUQ1VWJEU3lFd00xSThaM3pnK0d5?=
 =?utf-8?B?b29NT1U3cHNMRExOanNZZEE4dVdtaWx5eTgrK3A5Mjd0dXF0K1ZhK2hUQldS?=
 =?utf-8?B?RzZlTUJiT25iYXZsaVBRVC9vZjE3NW9lNDFBSGdIbHIvckNkNTZTSzlLdUpJ?=
 =?utf-8?B?MDdtT0V1VmJCTkRjTXR0RzlTcjhmbUUzVUpxeWF0N21rMCtGN2s1ampSOWk3?=
 =?utf-8?B?cnNYeVVUQXlzSjQvMW9qV1VBbEpuTTFNVmJHU0dtekY0cUZDc2J1ZzVZaUx1?=
 =?utf-8?B?ZlFCOFFWeWVBVWFIUk54SC9YMFBMaHQyYTZpZXRwT0ZESTc2c0VSOFJPU3Jt?=
 =?utf-8?B?TWRqTmtxZklFVUxSZlkyWTZPYzk3eVRKZ09PVUhjSi9mTEs3WFdOR0ZpdW9F?=
 =?utf-8?B?Q3IzaFduekI1MEpqcTJIOThhRGRud0hnZkRLUHNiMDZYKzlGemJjaU5UWUNI?=
 =?utf-8?B?MXpvNkt0bkpnRG5seHpzVjRLMlR0RzhBNFZ1MDg5SXpMbXZNTXJmRVpjMlBH?=
 =?utf-8?B?RW9RRElyRUpUdW1qSE5lbURjM3FRZnRPc2NNNnZ3WlpBZW9QRmYzbTV6MEkx?=
 =?utf-8?B?ejZwVk1HNmtMNDl2VmdBWHZoSHZRM0FLeVFBSzhlRWpCenRoV1g2T2RpQjQ2?=
 =?utf-8?B?SmhjTysvSDE5b3drT1VxNS9hOGlzQXBxWVUvUHBGMUNIenVIRmo1bUhwNmtJ?=
 =?utf-8?B?Q2liZmdnL3M0ckd1VDBZZCtvMysvWUJzV0x5dUxGZ2F6UURQWHA5QW05NTN0?=
 =?utf-8?B?SFJCdDd4eUlib2RCdnZuMVVZVkpkMjJrOFgvdmNDbU0xRVlkRGJoamZYUzJ1?=
 =?utf-8?B?TkxiT3c0SUdzSStocmNGOXcvTlRRa1c4VW83cEhlVjlLMnRwS3FBMVVhRkp0?=
 =?utf-8?B?UDExMDJZZmpuRWdYekhkVnBHdzd6TlNHdldjRU1tSnFHb3d1cjNrSE1naGtm?=
 =?utf-8?B?Y1N2b3krY3FkdXZWODdTSGVzSEtHR2VhNUZkbXc5a0c0NnV0eGQ2Z09nMita?=
 =?utf-8?B?ci93bEVQK1N3cDB4ZS9zRzNxQXNSQkRlUndoZzJsMlEyRFJaRW9BeEV4L1o5?=
 =?utf-8?B?MlBteWxrdU95eFAvUnV4NFdXUDFYdy9mWDNCem5SVlRCaTF5L3prNjh3Nzgx?=
 =?utf-8?B?Y1loenk5Z0FoaFBMS2NxUlhQa3MxTFhwU3p0TEhyY0xnMDNjc0tsdnc3bWlk?=
 =?utf-8?B?eGdha1lZUWVUZERPdExQME5VSU9Tb0ZVZFdqWHNnY1VpWHplQzhDdktuM0l5?=
 =?utf-8?B?N2syN3NOMHlyQWQzdVBrMHhIWVB5eUkzUnFCSkhybU0xc1NOdG5XZnRQZXk5?=
 =?utf-8?B?Ulo0cllnbUxocUYwanFOcnA2MWE3eEhibGFEc2MvSkM2ZlkzSmNYTDRSdTJF?=
 =?utf-8?B?RDBpc0NVUE5UQWxiT243L1BQWkZOcXZnMUpVdjZlbFM4bk9hbFl0QTBlcjBy?=
 =?utf-8?B?azhibkhJdTl4WmVEaDRES1lqM1Q2SnRlbDZBdWZxd3BKVHZpVERHaFRnNUgw?=
 =?utf-8?B?RHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c96a7603-fe76-42ed-31f5-08db00cdda59
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 01:20:33.5725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUSSyJoXrCu8Gr5L/QR2HDUTLZO1742QAR98Lz4djYhwS+FNLla0j92GS0QKoBqq/VlPBbfLsjY1LYmgKODlBYHsLjOZ3YAlEdz/SEyrAVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6556
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/2023 09:05, Michal Wajdeczko wrote:
> Use new macros to have common prefix that also include GT#.
>
> v2: drop redundant GuC strings, minor improvements
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 37 ++++++++++++----------
>   1 file changed, 20 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> index 68331c538b0a..290bb996b667 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> @@ -12,6 +12,7 @@
>   #include "i915_memcpy.h"
>   #include "intel_guc_capture.h"
>   #include "intel_guc_log.h"
> +#include "intel_guc_print.h"
>   
>   #if defined(CONFIG_DRM_I915_DEBUG_GUC)
>   #define GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE	SZ_2M
> @@ -39,7 +40,6 @@ struct guc_log_section {
>   static void _guc_log_init_sizes(struct intel_guc_log *log)
>   {
>   	struct intel_guc *guc = log_to_guc(log);
> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>   	static const struct guc_log_section sections[GUC_LOG_SECTIONS_LIMIT] = {
>   		{
>   			GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT,
> @@ -82,12 +82,12 @@ static void _guc_log_init_sizes(struct intel_guc_log *log)
>   		}
>   
>   		if (!IS_ALIGNED(log->sizes[i].bytes, log->sizes[i].units))
> -			drm_err(&i915->drm, "Mis-aligned GuC log %s size: 0x%X vs 0x%X!",
> +			guc_err(guc, "Mis-aligned log %s size: 0x%X vs 0x%X!\n",
>   				sections[i].name, log->sizes[i].bytes, log->sizes[i].units);
>   		log->sizes[i].count = log->sizes[i].bytes / log->sizes[i].units;
>   
>   		if (!log->sizes[i].count) {
> -			drm_err(&i915->drm, "Zero GuC log %s size!", sections[i].name);
> +			guc_err(guc, "Zero log %s size!\n", sections[i].name);
>   		} else {
>   			/* Size is +1 unit */
>   			log->sizes[i].count--;
> @@ -95,15 +95,17 @@ static void _guc_log_init_sizes(struct intel_guc_log *log)
>   
>   		/* Clip to field size */
>   		if (log->sizes[i].count > sections[i].max) {
> -			drm_err(&i915->drm, "GuC log %s size too large: %d vs %d!",
> +			guc_err(guc, "log %s size too large: %d vs %d!\n",
>   				sections[i].name, log->sizes[i].count + 1, sections[i].max + 1);
>   			log->sizes[i].count = sections[i].max;
>   		}
>   	}
>   
>   	if (log->sizes[GUC_LOG_SECTIONS_CRASH].units != log->sizes[GUC_LOG_SECTIONS_DEBUG].units) {
> -		drm_err(&i915->drm, "Unit mis-match for GuC log crash and debug sections: %d vs %d!",
> +		guc_err(guc, "Unit mis-match between log sections: %s = %d vs %s = %d!\n",
> +			sections[GUC_LOG_SECTIONS_CRASH].name,
>   			log->sizes[GUC_LOG_SECTIONS_CRASH].units,
> +			sections[GUC_LOG_SECTIONS_DEBUG].name,
Sorry, didn't get to reply to your comment in time. This can only be a 
mis-match between crash and debug. And the 'name' field is just a string 
version of the array index enum. So I would have just gone with "Unit 
mismatch for crash and debug sections: %d vs %d".


>   			log->sizes[GUC_LOG_SECTIONS_DEBUG].units);
>   		log->sizes[GUC_LOG_SECTIONS_CRASH].units = log->sizes[GUC_LOG_SECTIONS_DEBUG].units;
>   		log->sizes[GUC_LOG_SECTIONS_CRASH].count = 0;
> @@ -374,6 +376,7 @@ size_t intel_guc_get_log_buffer_offset(struct intel_guc_log *log,
>   
>   static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
>   {
> +	struct intel_guc *guc = log_to_guc(log);
>   	unsigned int buffer_size, read_offset, write_offset, bytes_to_copy, full_cnt;
>   	struct guc_log_buffer_state *log_buf_state, *log_buf_snapshot_state;
>   	struct guc_log_buffer_state log_buf_state_local;
> @@ -383,7 +386,7 @@ static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
>   
>   	mutex_lock(&log->relay.lock);
>   
> -	if (WARN_ON(!intel_guc_log_relay_created(log)))
> +	if (guc_WARN_ON(guc, !intel_guc_log_relay_created(log)))
>   		goto out_unlock;
>   
>   	/* Get the pointer to shared GuC log buffer */
> @@ -398,7 +401,7 @@ static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
>   		 * Used rate limited to avoid deluge of messages, logs might be
>   		 * getting consumed by User at a slow rate.
>   		 */
> -		DRM_ERROR_RATELIMITED("no sub-buffer to copy general logs\n");
> +		guc_err_ratelimited(guc, "no sub-buffer to copy general logs\n");
>   		log->relay.full_count++;
>   
>   		goto out_unlock;
> @@ -451,7 +454,7 @@ static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
>   			write_offset = buffer_size;
>   		} else if (unlikely((read_offset > buffer_size) ||
>   				    (write_offset > buffer_size))) {
> -			DRM_ERROR("invalid log buffer state\n");
> +			guc_err(guc, "invalid log buffer state\n");
>   			/* copy whole buffer as offsets are unreliable */
>   			read_offset = 0;
>   			write_offset = buffer_size;
> @@ -547,7 +550,7 @@ static int guc_log_relay_create(struct intel_guc_log *log)
>   					subbuf_size, n_subbufs,
>   					&relay_callbacks, dev_priv);
>   	if (!guc_log_relay_chan) {
> -		DRM_ERROR("Couldn't create relay chan for GuC logging\n");
> +		guc_err(guc, "Couldn't create relay channel for logging\n");
>   
>   		ret = -ENOMEM;
>   		return ret;
> @@ -596,7 +599,7 @@ static u32 __get_default_log_level(struct intel_guc_log *log)
>   	}
>   
>   	if (i915->params.guc_log_level > GUC_LOG_LEVEL_MAX) {
> -		DRM_WARN("Incompatible option detected: %s=%d, %s!\n",
> +		guc_warn(guc, "Incompatible option detected: %s=%d, %s!\n",
>   			 "guc_log_level", i915->params.guc_log_level,
>   			 "verbosity too high");
Missed this in the previous patch set but this is a weird warning! Why 
have fixed strings printed via %s?! Seems like it would be better to have:
     guc_warn(guc, "Log verbosity param out of range: %d vs %d", 
i915->params.guc_log_level, GUC_LOG_LEVEL_MAX);

John.

>   		return (IS_ENABLED(CONFIG_DRM_I915_DEBUG) ||
> @@ -641,15 +644,15 @@ int intel_guc_log_create(struct intel_guc_log *log)
>   	log->buf_addr = vaddr;
>   
>   	log->level = __get_default_log_level(log);
> -	DRM_DEBUG_DRIVER("guc_log_level=%d (%s, verbose:%s, verbosity:%d)\n",
> -			 log->level, str_enabled_disabled(log->level),
> -			 str_yes_no(GUC_LOG_LEVEL_IS_VERBOSE(log->level)),
> -			 GUC_LOG_LEVEL_TO_VERBOSITY(log->level));
> +	guc_dbg(guc, "guc_log_level=%d (%s, verbose:%s, verbosity:%d)\n",
> +		log->level, str_enabled_disabled(log->level),
> +		str_yes_no(GUC_LOG_LEVEL_IS_VERBOSE(log->level)),
> +		GUC_LOG_LEVEL_TO_VERBOSITY(log->level));
>   
>   	return 0;
>   
>   err:
> -	DRM_ERROR("Failed to allocate or map GuC log buffer. %d\n", ret);
> +	guc_err(guc, "Failed to allocate or map log buffer %pe\n", ERR_PTR(ret));
>   	return ret;
>   }
>   
> @@ -687,7 +690,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
>   					     GUC_LOG_LEVEL_IS_ENABLED(level),
>   					     GUC_LOG_LEVEL_TO_VERBOSITY(level));
>   	if (ret) {
> -		DRM_DEBUG_DRIVER("guc_log_control action failed %d\n", ret);
> +		guc_dbg(guc, "guc_log_control action failed %pe\n", ERR_PTR(ret));
>   		goto out_unlock;
>   	}
>   
> @@ -905,7 +908,7 @@ int intel_guc_log_dump(struct intel_guc_log *log, struct drm_printer *p,
>   
>   	map = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
>   	if (IS_ERR(map)) {
> -		DRM_DEBUG("Failed to pin object\n");
> +		guc_dbg(guc, "Failed to pin log object: %pe\n", map);
>   		drm_puts(p, "(log data unaccessible)\n");
>   		free_page((unsigned long)page);
>   		return PTR_ERR(map);

