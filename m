Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B22A5A0058
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 19:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0014193898;
	Wed, 24 Aug 2022 17:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBEBD6F6D;
 Mon, 15 Aug 2022 23:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660605870; x=1692141870;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q+KLyWt7WKyGKPBtGF0gXTww1jk0tXikfxXAhLlHsY8=;
 b=YrEU4/L17UVxhnlaG9RpcMlhyvpDFuO7R0hnJR8MExnXZV2y9oA6zqFp
 GxFjcRh7mU6YMjtZ33JI4qisq/H/S2U9I6+gf9XTo2TAKCE6p/u20RZQu
 W4hTuYnoB4IC7Eeazj6Ie2xQm9TOjZ7U+EQ7QroJQ0UnOJGve93Lse7Oi
 2VBZ40plNDU1xdOZGod//TvNKEj/e0XcL8UBaCUtFPhRDn648YYedEeMj
 Z4uwFrIDbj0+Z0VZEV+PpyyDks2xcjEEz57/e59koOFTQpVM51POjHorc
 CzgdtTwwMtHMjCzWGQwaqjUgkIWGDeetIEMn1UganNi+cMz3UEjnKK6qc g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="279040014"
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; d="scan'208";a="279040014"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 16:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; d="scan'208";a="674995201"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 15 Aug 2022 16:24:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 15 Aug 2022 16:24:29 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 15 Aug 2022 16:24:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 15 Aug 2022 16:24:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 15 Aug 2022 16:24:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=liPGPcGZYfmHhghqMvGXyk34cGvfIqQIF1l1gIs7WO5QqJx59eLCwgjYTpKJtlkQ3RV14Sd9kxC6JYEAydwzVU2Rxz7o/kt171DC0CHVHYpRi4ut2jKH1s7SOxBxqwLQ9uhMWVO7fZ65tKIG3S/rOd9c8tpSFNSQG7nQMNPos1i3tu1VosJg9BcC0eJ+Xk1sRcNiKgisQ9LqNi8zRZAzcCVt0xKLwhmhXdUh5n440zXb14vnj/qYBMbiQNK/y7JLqACfzV7bqvcM0Khxykj2yvxbDPd7WZ4AW7lZPzlyLqe7LJwP2Pts9V9yhsH28T//Co+BtHvO+CE7vyXBp8t0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zsw3jEgihPPFnFC7kWZj/dnPx3fjNh/Jf/MUBKyS90M=;
 b=X2fpXBfSJicRrBBZKpNg+/N8lcEbP0nWyHb89np+LcKun0JRwJFyMohhXvsUSxKWkMBlrAaY+t2xuJQ0eiQ3QHTzKCqd/Q8XQIjcaAKpi79trfvn2S1jhtBj6t1zq+aP15somrw/cC0O9xSqdufOENMPEz9pfZLBw54NCYcetW/fpsYmE2/3ivdcOjjNEEBOm40rg0yB9KzC2oRgIXn6rjGkOKQ/KBsp9ZRTYS6mwQLEj0pCBac6Na/ZiRLntuw+ZMh/lJauItd2sfJJZvp5wjxcwxQ3CiuLRiLN3D8RjXYqUdFLOCBLiYA3WkkNUac/gI00uKJuNcvF5T/UeLe5pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN6PR11MB3908.namprd11.prod.outlook.com (2603:10b6:405:7d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Mon, 15 Aug
 2022 23:24:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.027; Mon, 15 Aug 2022
 23:24:26 +0000
Date: Mon, 15 Aug 2022 19:24:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v2] drm/i915/guc/slpc: Allow SLPC to use efficient
 frequency
Message-ID: <YvrVpahJvPcJjVAh@intel.com>
References: <20220815232204.34900-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220815232204.34900-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: BYAPR06CA0059.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::36) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93b9ae0c-c157-495b-b02a-08da7f154b23
X-MS-TrafficTypeDiagnostic: BN6PR11MB3908:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K3sHwYUv+YM9TENzZ1m+Bhxs4/vQry3rYfTrkeTn5uYxGySC45pujlLtTLGbpbQdBPKIm5TeBO9Xu2qG+p64pDkiZiaIvHOVlB8fvNIVjPWafDkM1CUO/9g2uvcT4CEabKARJxc7KC0tEDGd7PRVfdy8aEr+RIxkwAqFwNgh3hw5GrLhuXET+iMkMsSSJ1NhpQ+Pk7evK3ePmtYCaWCid/O65e6xTvOnpMfFUjCV8q0DTZ61+0tGhO1yFQGr2DdQfxRnSAKZIwR9HZkDvtsfCdqwBcpnq9JnI1Ws95eOLM4RQ6uGX87xeKWYmMET8lTJttQ59EMPZtcnCDYbpshjHxeM6iXLBBa/WF4sAd+wdk4rqQgCsAe2Xd9akjOsjGvAhIy/QwirXJkUbb5eld14FTjgaf9fpqcfbbQYfR1+0mJM669PL4Ys0nYD+irWCsOHbIRzBtIJN2SxHpDhyR761172+RBzUtJiVx9ULGZUwkz2mWceXE6i1tPfjvTglwNxYPwBSpz1W7HzqkHMg3P42soCdkecu2iYDemRKde3ij7YBgm4Dt3USo2k6sG91G7PhHKLXZK616a0o3W1Kee7rnO6bq40LceJgxmP4cZec4ul+u5KxNdA3elEteJIB6h0Rl0Z/NXSn23jLaWRS84zkXVlIk6dUTNsN53y7kmRSc7npaVi/ODdZzgZ/lyFqGUF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(39860400002)(376002)(346002)(136003)(366004)(6862004)(316002)(5660300002)(2906002)(44832011)(82960400001)(86362001)(41300700001)(6506007)(6666004)(966005)(38100700002)(6512007)(6486002)(478600001)(2616005)(186003)(26005)(83380400001)(8676002)(66946007)(66556008)(66476007)(8936002)(450100002)(37006003)(4326008)(6636002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E/40yQJ+24eqBdU8wr/ISfOAgCqvwg2i4IKMhFQAODp32kXxyJ+hkvjhdmZa?=
 =?us-ascii?Q?/Llgzwv9O3BR6kNWbs/e4CmxlzEpNf6mOYB2jrjAjI4i3P5WVfgm1x+j/rWc?=
 =?us-ascii?Q?VFEvTaSjOX5GYYvwJTGKcCUxHnKGrunfnzmVdINi59ep1WpL4pbkiHsxle1a?=
 =?us-ascii?Q?CRkVpQoQhSTEDtbKgK4oc+Kul/f5GBSQbIL14E6hAgFOUKZpeSNHgAWzMZ7k?=
 =?us-ascii?Q?9ZO0V82gBdgNhIe+RTIFPsUIipebDyrZxBK9Ze3NEe5mZefrYwa1hMtfQunN?=
 =?us-ascii?Q?Jl/J/i+nDCkcsxjBXPf6JegsbPS0w73LKegXKtVO5W5qoc2P2V3IVDmcJeYU?=
 =?us-ascii?Q?gD7j/MHld+hUMMM6hVYjigc8Cr8oji82+1dxDnQRTCs+x+mwXNuob1I0wWop?=
 =?us-ascii?Q?P2po4xm+Sm4FFVkq+2Gj2ju2ZZ12xLJbhzFteqIUONmgIzwrH/crjQjcRbEw?=
 =?us-ascii?Q?jtE5+GIJYUWdEwgHE3HDL8ecx1qbLqcGeJNn2xrmhSDP4bZ6Oq7eSVmuZcEm?=
 =?us-ascii?Q?h2czSTGUhlckzkikbzonjGzC4PW1T6Q6oboWeth/T95Ej3XGXMhCerU0JOlh?=
 =?us-ascii?Q?Sk5Qua1qSsyCxV2QeDdP9aRRhKJXvSQA/PNWBzJergdpw+M39uiNuo4QfYso?=
 =?us-ascii?Q?00B0z32aefBQ3R2m0SMxw9fA0z5sZNgCr1c6gmTdfrzEdk2f8CTWhLifPuIn?=
 =?us-ascii?Q?FIvrWctT0NUM9FIeajaOjyCyMVZk38oizf+yMctmtstyvv0uSLME5JH67ksy?=
 =?us-ascii?Q?FNhx47hkDVXHmBt7RSQ86ZRex/9WGOZxvaIdWUKCWptneVpMly5ouQsZnchm?=
 =?us-ascii?Q?59SHu9mSiO+rYtqQ6XCmlDC1S3JhispHhU1xwLcCiAokW750oQe3JZtyufqk?=
 =?us-ascii?Q?YMhN1RoqjPggzCKypzsdEX7P8oAoVXk7x1B74LRU2xZ3l5OFS4XhDNCHc4j2?=
 =?us-ascii?Q?Vj2bkkkxZ3G95hmquE2uVizNOvn9yjMIkIuCjVJK2HDXmGrC2yYDmupM2YfL?=
 =?us-ascii?Q?x4m9JS9S/ZUHbLjK5kkKt7rsUJ4JuSQbdeAnIYiySosXfi75y9Z97q4b1ztr?=
 =?us-ascii?Q?BVZbD8tUiegQrbOEQl+NP8ETjD9U380qac49dEFRwEtFKTRYzyAllBKj+IkI?=
 =?us-ascii?Q?STdN3KaVLubkkQx6MgXxbvwTW+p3DJfAuqtIh+cwhysdfBwhtGhJvBzs2H8c?=
 =?us-ascii?Q?fdUSHJlkAwOqx9HZ0FSi9A5bD2+GpvcpB3bF5JTrl35mTZh239EvvFkWb2G3?=
 =?us-ascii?Q?+MpxFvblEBb3MBNAGh83Zgd2zTHeN0gVhQ2oX6dBUJJ8MktBGHszar8+WCRH?=
 =?us-ascii?Q?1IMoOHyvS7lVvqx9SiSshvccq1sPms9oQrb0ez//iHB+xRZBjzReHWH0NdqR?=
 =?us-ascii?Q?1i2JZfFctuii/Fs+m6dBI325AqdQ3JVUsLTdFpuZGrhGgdjJcdsR4MEkJ9h7?=
 =?us-ascii?Q?coq+BQgFPDeiVXdIXNqYNE0EzOA1NpH6m+NaRB6nJMqDUTFEFfN804hUhCvc?=
 =?us-ascii?Q?P8dfFghqq0EFrD/NmdgBAwRDDy3ntKL0/RM2rNBgwPm/VwzeK8zz14GROxma?=
 =?us-ascii?Q?Br5PWSpEf1NM1T+WV1DTr19EYQ2LJHBScLslGq2uSPrZi96OEmTvPp/QLjT3?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b9ae0c-c157-495b-b02a-08da7f154b23
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 23:24:26.1454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVWGuLaCqycJLsj3kfvY79nK0VEA56+PQqzNg9PxueQTareKapB9STIl3NgezymYu0YvtpKKLzUfT0qHu1t3KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3908
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

On Mon, Aug 15, 2022 at 04:22:04PM -0700, Vinay Belgaumkar wrote:
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
> v2: Address review comments (Rodrigo)
> 
> BugLink: https://gitlab.freedesktop.org/drm/intel/-/issues/5468
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_rps.c         |  7 ++-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 66 ++++-----------------
>  drivers/gpu/drm/i915/intel_mchbar_regs.h    |  3 +
>  3 files changed, 22 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index c7d381ad90cf..8c289a032103 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -1107,7 +1107,12 @@ void gen6_rps_get_freq_caps(struct intel_rps *rps, struct intel_rps_freq_caps *c
>  		caps->min_freq = (rp_state_cap >>  0) & 0xff;
>  	} else {
>  		caps->rp0_freq = (rp_state_cap >>  0) & 0xff;
> -		caps->rp1_freq = (rp_state_cap >>  8) & 0xff;
> +		if (GRAPHICS_VER(i915) >= 10)
> +			caps->rp1_freq = REG_FIELD_GET(RPE_MASK,
> +						       intel_uncore_read(to_gt(i915)->uncore,
> +						       GEN10_FREQ_INFO_REC));
> +		else
> +			caps->rp1_freq = (rp_state_cap >>  8) & 0xff;
>  		caps->min_freq = (rp_state_cap >> 16) & 0xff;
>  	}
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index e1fa1f32f29e..9d49ccef03bb 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -137,17 +137,6 @@ static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, u32 value)
>  	return ret > 0 ? -EPROTO : ret;
>  }
>  
> -static int guc_action_slpc_unset_param(struct intel_guc *guc, u8 id)
> -{
> -	u32 request[] = {
> -		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
> -		SLPC_EVENT(SLPC_EVENT_PARAMETER_UNSET, 1),
> -		id,
> -	};
> -
> -	return intel_guc_send(guc, request, ARRAY_SIZE(request));
> -}
> -
>  static bool slpc_is_running(struct intel_guc_slpc *slpc)
>  {
>  	return slpc_get_state(slpc) == SLPC_GLOBAL_STATE_RUNNING;
> @@ -201,16 +190,6 @@ static int slpc_set_param(struct intel_guc_slpc *slpc, u8 id, u32 value)
>  	return ret;
>  }
>  
> -static int slpc_unset_param(struct intel_guc_slpc *slpc,
> -			    u8 id)
> -{
> -	struct intel_guc *guc = slpc_to_guc(slpc);
> -
> -	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
> -
> -	return guc_action_slpc_unset_param(guc, id);
> -}
> -
>  static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>  {
>  	struct drm_i915_private *i915 = slpc_to_i915(slpc);
> @@ -491,6 +470,16 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>  
>  	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>  
> +		/* Ignore efficient freq if lower min freq is requested */
> +		ret = slpc_set_param(slpc,
> +				     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
> +				     val < slpc->rp1_freq);
> +		if (unlikely(ret)) {
> +			i915_probe_error(i915, "Failed to toggle efficient freq (%pe)\n",
> +					 ERR_PTR(ret));
> +			return ret;
> +		}
> +
>  		ret = slpc_set_param(slpc,
>  				     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>  				     val);
> @@ -587,7 +576,9 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
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
> @@ -597,29 +588,6 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
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
> @@ -679,14 +647,6 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
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
