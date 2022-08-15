Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB5D593410
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 19:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F514CEDD1;
	Mon, 15 Aug 2022 17:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9F3CA11F;
 Mon, 15 Aug 2022 17:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660584773; x=1692120773;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9/+LrodZBB/NHnUnCC2c8HoX1fCZWJ/RbK3XW4nglvo=;
 b=ECWhJSUgysccUqrN+12mPv0jsMRo/MGeBQf65wHiLEGmGy7oQbB3lhIs
 FKLu1pr1Ine1ekUETeGlGXI8mSjBWPkDjjJAMZ3xQnrH2YjxMUyTSliri
 Ij/hvVlZ5Q/OqsBAFS2ydEha4/jXCrVPwAFHSNOfzzEV1eQnztCd4e+5C
 Qum9RQYTPrXw0XrKYaRtVDBL6fKWrznzR5d9nCQ+oQmdqgymQLZndJflo
 mBClamZiuyLoGB4jM2a6qxuI7pn4duCBpIb3TU8DZpa4hPbG0YP8fLBHf
 hNtk1cjRAzEbDF6Z067/DqgmrJy8NcZtLGPi9KUKcJI9xHxlRPaiOp1H+ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="356024134"
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="356024134"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 10:32:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="934561136"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 15 Aug 2022 10:32:50 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 15 Aug 2022 10:32:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 15 Aug 2022 10:32:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 15 Aug 2022 10:32:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwDta9sm06E2/ERwNAxRgiOqkVN7DZy9TmC3ykdyqo0/efRFVLj7Rro4xD5aCpC5ObgZvtOLKzEKRD2JUjino3s3csKstJzQGCvIb8aQ5O8shd7B8mKF/U2v7TwE/WqIC0UnOSB+usI5NNJ+XLBY+TaK1YGOOf6IzVSNZf8vhfOdkfQGA4+x9MGaezFZK7GzQVMP0o93xQJbnEwRVIHH9mRTjulohTdWqadaHjWWLAr/d8iB4BrWfsSXBq3B1fHWvJ+iofWVdf3ScM3SEEAMRymnuEnHLbKcQpBNFnG63TCLJe5NEb/4Rh6dXnIbZmHvGSq2Zvacfq3sfOiBtcFgNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDed6RAICP+FYYUcIQ+oT5qF3wfOeJQdo47xLx1TLEg=;
 b=CNpe8epMiahlxQ1TZM+04mSOEiDXKyADYCTB5slRdg+Adew+yyaL7RAt8O4jqrj5UB7/cxRpb6kuCbRxG/Kz4VL+LB0usNEsFIiQkvX2vsAbddoNHsy2yxqYnvgCz0LR8yqm/ez6eUDAbTK2dHEj1UQijso0r29sAfnxYJkfC2D2XTjRjUdTILuapMCFlgd39x9qWH8y6f1PiN9SUe62uWpcXvFdMPGX48nuBEUbF4AdwmnRdXHEcnxGDM6j/GPBlB6HcpWsWhAAiLwwUunoKrKZjbiY3YldJLh1tdgjSILWiE0+zY56YuTRCvV1ByM/rvq1hdFmevl/RDeycjYslg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5408.namprd11.prod.outlook.com (2603:10b6:5:397::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 15 Aug
 2022 17:32:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.027; Mon, 15 Aug 2022
 17:32:27 +0000
Date: Mon, 15 Aug 2022 13:32:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH] drm/i915/guc/slpc: Allow SLPC to use efficient frequency
Message-ID: <YvqDJ9S1q2xEVzzZ@intel.com>
References: <20220814234654.34800-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220814234654.34800-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: BY5PR17CA0018.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4303290-46f4-48b7-9cb1-08da7ee41f49
X-MS-TrafficTypeDiagnostic: DM4PR11MB5408:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F7B50BW9CZj39EOWrs+RTRQYxP3oJIBxa5JyRiNXCp3XJVzDCqWs6PsSS9+QDjc5Lg/5gARS91gfojWayz9SPCxz77DGq27oks642jKnXTIkNEsF4VV99r4V/rPCPW8RyLCvPHMFC4ZXF+wFdXMtUQgEcPLJ3668OWEO91T5pEAfiXGJPyH2KSi5QHVyRVVyEQM5S5Pu5G2lQnMtfqXDSTkmiuWnWLYhMlLmvRM3PH0m9zfwRHURq/CH8rRbevfgdLRLTFbblPPFgkZPizFFm2Lw62FznVjCiQw2x+ClFp/YyUxMTbyMbbi6R3SSoSK5uKc9Ov4muS7wso9qtqA/cBmT3p0WzwZW/Ug1pj0cwhrwgh14cBRHVA9JOrxErvZooz10g2NOtGpijbTOElS5oUYtYgLX6OeerM/bMVCKyixnxM+xNZGlIu6ylF0RGo1FhANPgddV0z9GTUiy9hBHAwsJtkMxg7uokqRCEfXWGInTpDGYa8aSWaSDWVea7oiYowlODgJSZSLihUodJJRE9M27L5mMUlcLBvkFlkXE9cyUI0ygs5laZNaf26D6HY8FSyDbvkmmH8zn33UuCSdKseu5vkzJ1p+cwaQ6NPt/2Okyv6gg2tn9fhDg8lpPjDL67Gur2nWml90YTqwEjkplRZ6UABsycbSNZWzqV1ls8mU38kqrgtZ1jIjoS4nv30v1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(39860400002)(376002)(136003)(366004)(396003)(6862004)(66476007)(66556008)(316002)(66946007)(186003)(83380400001)(37006003)(6636002)(2906002)(450100002)(44832011)(36756003)(8676002)(4326008)(8936002)(5660300002)(2616005)(82960400001)(478600001)(6486002)(966005)(6512007)(6666004)(6506007)(86362001)(26005)(38100700002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uQKCbhjKwibWuPrJDEuByoZlsvP7uq9I1iEHmhSj1p7lPRNYJkjnS/Q25Kyt?=
 =?us-ascii?Q?117F1imxzv/6sEdap9fm8SHn2o7FFbCeim3sEOogi8Kxy0xsi9eq29lM8T+E?=
 =?us-ascii?Q?REZI0ZkQUcBevoGn0O2UZHYju6fRaUuymWjV7lmOAQXQWAo1vlqYpBvSqXqd?=
 =?us-ascii?Q?1KQJnkC5dKOEiO6/dTwqayArOR3VsetXTgWnDKfPekdS95wRPuPuVjN6s00B?=
 =?us-ascii?Q?NRnvnbpK2cQ2AYawG6SYC2g0i6Kd0QSh2YYqPFqFoEQBMdAS1h9N433FHxmU?=
 =?us-ascii?Q?BxZrHIHsyZl1xpk8nfIdGnRBd9S+2H/c9tYbEFwH2gfrIR7l3X+MrkZtx2Nk?=
 =?us-ascii?Q?5Pavvm0+udmvPrrLPryvs0k42f51o6R+DbOOHgJLbn5GJpFssLuQPmSC+/lz?=
 =?us-ascii?Q?32oeqJiWaUKgKjLkUz1wf+VZhsk5Ere7dfclF8FD9PzNRWuHgVGGy3wTX2HZ?=
 =?us-ascii?Q?xDALn0Rvh3nrrJd3fRW1c6kGmdhXXyC4GDdCDRAP5vHIjoFcxjzpMyixZMh5?=
 =?us-ascii?Q?R9WZPBsE5pw9p4Y/FFwBROgZc25An8pA9F1vRHO/0MtY8Ksqmv58+z9ypUh4?=
 =?us-ascii?Q?Rn5EidCWOJmQ/nNrdqpIfydntX2tsaaozy5CflW18+S5VwXtST7Ek2+8kDfA?=
 =?us-ascii?Q?iRnsOSY7k5JwsMwrN89TNpaQgNMi48ZZ575iiH2fDnfA+Dr/tzhsmGGtS/Oj?=
 =?us-ascii?Q?T4xkC3GtWSyLkynAnt0MRUBd5W6LLJc1elucuJyFxfg39mYgm0uge/v5GvoQ?=
 =?us-ascii?Q?yjfhohLkyTnjBsZ0hcnkJ+h01V1Jm7kYCFaI4G8iAt/k3htOAjD5i3roEDrA?=
 =?us-ascii?Q?6hP7rgd51jo4YT9+UdVRvq2FT4r6tc6Y9EmpN5Hr//RFOPqHVyyyehLwCplT?=
 =?us-ascii?Q?JJ6bFYIvGm4eiwdH58TqkQnwIGI1dY/j8os9Edy4zH15RCr4trQJ+JTrBrZp?=
 =?us-ascii?Q?SIs1deVawdl/OOuu93ZLgb+ily2jIZUf4jFdHz3Bvu55f2dIGtAhF56QmuVv?=
 =?us-ascii?Q?yfpxCsxi+alTN+F/BCBH+4A2daofLfsPpgpTQtrneb45CLIt8QIh2ZZ/IWMg?=
 =?us-ascii?Q?k0SKWTT0zuhoGXK3dNIsrExDKnDorULtz4JEcgawq0qlQ+p17Jb1AVqGJSnj?=
 =?us-ascii?Q?PdALnrqETW6TViHLdsXt8BoB5hJUXQkQM1NGVJayIhMKbddEgbU7GcQ+5yyF?=
 =?us-ascii?Q?HrDHHb2QfBf/HQ7YrDqsSkUiu9cpx3OMZFy5cLugAHfSmFbaXpYAgRuCJ2GP?=
 =?us-ascii?Q?mW1/+G2UubpdukODAZmcmEJq3NF/lfKY9c4p3f5pKMc/UDvO4bmmVRZbCImT?=
 =?us-ascii?Q?k+180VTRTw/Mg1b/WeL9NnTiUhKnEVFBUww572UkTBcltM7w+pfMPhaZK/hP?=
 =?us-ascii?Q?Io1H36m/UGT8IxpAzobKEGZouH5U+eNka4SpZ6zQRTaN1VFNjgQ6f+UzvuYE?=
 =?us-ascii?Q?d51O7LFRj9/sbNp95AVEIMLaiAx7BWH1pLcPofCF8vg/5jrfYUQhLQVMlPlj?=
 =?us-ascii?Q?X+5hBoBlIwbj5n+bXn5pMiFObAp/xXgz3GJtsakvPLVM1A3jkGp0aZDdIpja?=
 =?us-ascii?Q?eORI7p0yiakmToT3dRJM8pmJp1lsi1ZrQofZNcW5wV2OWXAEbG2/e1st4l68?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4303290-46f4-48b7-9cb1-08da7ee41f49
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 17:32:27.2974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUBNthspBPMz4zpjHt+tfHlsQzgmDMUWK2oL44SxrFGeAffNEWi7N+07UYlqrKgn2zvf7fusZVJ4rEqkQ9Z6bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5408
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 14, 2022 at 04:46:54PM -0700, Vinay Belgaumkar wrote:
> Host Turbo operates at efficient frequency when GT is not idle unless
> the user or workload has forced it to a higher level. Replicate the same
> behavior in SLPC by allowing the algorithm to use efficient frequency.
> We had disabled it during boot due to concerns that it might break
> kernel ABI for min frequency. However, this is not the case since
> SLPC will still abide by the (min,max) range limits.
> 
> With this change, min freq will be at efficient frequency level at init
> instead of fused min (RPn). If user chooses to reduce min freq below the
> efficient freq, we will turn off usage of efficient frequency and honor
> the user request. When a higher value is written, it will get toggled
> back again.
> 
> The patch also corrects the register which needs to be read for obtaining
> the correct efficient frequency for Gen9+.
> 
> We see much better perf numbers with benchmarks like glmark2 with
> efficient frequency usage enabled as expected.
> 
> BugLink: https://gitlab.freedesktop.org/drm/intel/-/issues/5468
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

First of all sorry for looking to the old patch first... I was delayed in my inbox flow.

> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_rps.c         |  3 +
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 66 +++++++++++----------
>  drivers/gpu/drm/i915/intel_mchbar_regs.h    |  3 +
>  3 files changed, 40 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index c7d381ad90cf..281a086fc265 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -1108,6 +1108,9 @@ void gen6_rps_get_freq_caps(struct intel_rps *rps, struct intel_rps_freq_caps *c
>  	} else {
>  		caps->rp0_freq = (rp_state_cap >>  0) & 0xff;
>  		caps->rp1_freq = (rp_state_cap >>  8) & 0xff;
> +		caps->rp1_freq = REG_FIELD_GET(RPE_MASK,
> +					       intel_uncore_read(to_gt(i915)->uncore,
> +					       GEN10_FREQ_INFO_REC));

This register is only gen10+ while the func is gen6+.
either we handle the platform properly or we create a new rpe_freq tracker somewhere
and if that's available we use this rpe, otherwise we use the hw fused rp1 which is a good
enough, but it is not the actual one resolved by pcode, like this new RPe one.

>  		caps->min_freq = (rp_state_cap >> 16) & 0xff;
>  	}
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index e1fa1f32f29e..70a2af5f518d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -465,6 +465,29 @@ int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val)
>  	return ret;
>  }
>  
> +static int slpc_ignore_eff_freq(struct intel_guc_slpc *slpc, bool ignore)

I know this code was already there, but I do have some questions around this
and maybe we can simplify now that are touching this function.

> +{
> +	int ret = 0;
> +
> +	if (ignore) {
> +		ret = slpc_set_param(slpc,
> +				     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
> +				     ignore);
> +		if (!ret)
> +			return slpc_set_param(slpc,
> +					      SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> +					      slpc->min_freq);

why do we need to touch this min request here?

> +	} else {
> +		ret = slpc_unset_param(slpc,
> +				       SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY);

do we really need the unset param?

for me using set_param(SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY, freq < rpe_freq)
was enough...

> +		if (!ret)
> +			return slpc_unset_param(slpc,
> +						SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ);
> +	}
> +
> +	return ret;
> +}
> +
>  /**
>   * intel_guc_slpc_set_min_freq() - Set min frequency limit for SLPC.
>   * @slpc: pointer to intel_guc_slpc.
> @@ -491,6 +514,14 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>  
>  	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>  
> +		/* Ignore efficient freq if lower min freq is requested */
> +		ret = slpc_ignore_eff_freq(slpc, val < slpc->rp1_freq);
> +		if (unlikely(ret)) {
> +			i915_probe_error(i915, "Failed to toggle efficient freq (%pe)\n",
> +					 ERR_PTR(ret));
> +			return ret;
> +		}
> +
>  		ret = slpc_set_param(slpc,
>  				     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>  				     val);
> @@ -587,7 +618,9 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
>  		return ret;
>  
>  	if (!slpc->min_freq_softlimit) {
> -		slpc->min_freq_softlimit = slpc->min_freq;
> +		ret = intel_guc_slpc_get_min_freq(slpc, &slpc->min_freq_softlimit);
> +		if (unlikely(ret))
> +			return ret;
>  		slpc_to_gt(slpc)->defaults.min_freq = slpc->min_freq_softlimit;
>  	} else if (slpc->min_freq_softlimit != slpc->min_freq) {
>  		return intel_guc_slpc_set_min_freq(slpc,
> @@ -597,29 +630,6 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
>  	return 0;
>  }
>  
> -static int slpc_ignore_eff_freq(struct intel_guc_slpc *slpc, bool ignore)
> -{
> -	int ret = 0;
> -
> -	if (ignore) {
> -		ret = slpc_set_param(slpc,
> -				     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
> -				     ignore);
> -		if (!ret)
> -			return slpc_set_param(slpc,
> -					      SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> -					      slpc->min_freq);
> -	} else {
> -		ret = slpc_unset_param(slpc,
> -				       SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY);
> -		if (!ret)
> -			return slpc_unset_param(slpc,
> -						SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ);
> -	}
> -
> -	return ret;
> -}
> -
>  static int slpc_use_fused_rp0(struct intel_guc_slpc *slpc)
>  {
>  	/* Force SLPC to used platform rp0 */
> @@ -679,14 +689,6 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  
>  	slpc_get_rp_values(slpc);
>  
> -	/* Ignore efficient freq and set min to platform min */
> -	ret = slpc_ignore_eff_freq(slpc, true);
> -	if (unlikely(ret)) {
> -		i915_probe_error(i915, "Failed to set SLPC min to RPn (%pe)\n",
> -				 ERR_PTR(ret));
> -		return ret;
> -	}
> -
>  	/* Set SLPC max limit to RP0 */
>  	ret = slpc_use_fused_rp0(slpc);
>  	if (unlikely(ret)) {
> diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> index 2aad2f0cc8db..ffc702b79579 100644
> --- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
> +++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> @@ -196,6 +196,9 @@
>  #define   RP1_CAP_MASK				REG_GENMASK(15, 8)
>  #define   RPN_CAP_MASK				REG_GENMASK(23, 16)
>  
> +#define GEN10_FREQ_INFO_REC			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
> +#define   RPE_MASK				REG_GENMASK(15, 8)
> +
>  /* snb MCH registers for priority tuning */
>  #define MCH_SSKPD				_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5d10)
>  #define   SSKPD_NEW_WM0_MASK_HSW		REG_GENMASK64(63, 56)
> -- 
> 2.35.1
> 
