Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 010DA59338F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 18:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6650BCE49D;
	Mon, 15 Aug 2022 16:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59808BEF26;
 Mon, 15 Aug 2022 16:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660582274; x=1692118274;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bu+Z6ZOHiR9K/0bu+pDhwR8LlCxCihJK/+kx/BYSGyU=;
 b=HZgO+qcdJ7d7yLTTqjGomfJ0vEPexZk6tQULLe5fw0jSWNs0JMsRU3II
 UBj0RDzPWOsiVEp048qDLxJbXx6escYQCRHv0Q3itQDkmJmQVsDWlXjxR
 FbUdAJtVnjBJf0N8gWWcg/9P1O46pTMDrMxH5qa2/iPI5wrIsM5V8SK2a
 bWt5pIMp+ZXCKVgyJtqQNkQl9xCFtQwNokcxr6Guld6H8hukalGq8LM1g
 nEkJTKJwSRDp0IjkI1sm19h+yEQAidBQefZsNEgE81f1BlPkX3kZZcMFX
 29+1IztKLnkezhbW3M2ynkwKNkzWPIaxH2+DceGZIotBFMqMaQTeM3MOS g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="272394529"
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="272394529"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 09:51:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="782713015"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 15 Aug 2022 09:51:12 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 15 Aug 2022 09:51:11 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 15 Aug 2022 09:51:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 15 Aug 2022 09:51:11 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 15 Aug 2022 09:51:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kngzQLDqffeTLdY2v+C94TE7ckjf7k39Z8Jen4tggV1j9lNnAIx6OP0a0FJ0gGkAHille5L6QhHQFxd1fDhp1WdDoHDZ+GROlGpmOkEQP+fFtscQ/0ydpLzcLn5YOPIMa+Gwk3df87IIaDzLZ63uAd8UgdPjs0kDoLVWl7mfPs7pZFkWEa/OO0H4XflToYZTpjIMB0saL2nlJ7ceXP6NeHferYUBFwgBKGe2+gS8jc+Gd74Fhoge4vZ4+nYLkm7Fl+VjeX2SH00ttKegOAJmXOco4zD3zGZCKGs7EYmc5Wv75GTkuvscGZLPm8r5FE7a9v69aP8fWo0f3K4HECJc0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2UIMiICg792BDCfFoTFz8fDuh4XnUTXDhkaUyjLIuLg=;
 b=L3zrz8c/crGawaqSkmENwjFL4gpP69D4BeX+d2JBB/Z+kJWEzz0iBIGlnkg0HxnKA50sCqw2qAGixFBz5PM+oTTjRJ7kG8l+DZWmlUZoZ3/+SxjN1kcfHfYyWFAcS7LItt9t92qEGboCx4LxgAKxrrcJzElcLLw3SVb4sdmHPVtevIocxdrp7mV9ENwcWeEcv/NcdnYq3A+tbgU8ZRJI7d6JpxBwAbQVVE0RkJ01n7ZO9ZLKjU1WC0mhErKUzHL1h42B6aFKU7PtHOKVc1jvTbpkuUheZzAWEdsHglY77jNt4vyWFwoJZz2UN1WxNAOjE1Y7ApuFOFNR465HWvufEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN6PR11MB1794.namprd11.prod.outlook.com (2603:10b6:404:104::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 16:51:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.027; Mon, 15 Aug 2022
 16:51:07 +0000
Date: Mon, 15 Aug 2022 12:51:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Allow SLPC to use
 efficient frequency
Message-ID: <Yvp5dp0Oa0sobOo6@intel.com>
References: <20220810000306.5476-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220810000306.5476-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0092.namprd03.prod.outlook.com
 (2603:10b6:a03:333::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b1e559f-6451-4952-dcbe-08da7ede595d
X-MS-TrafficTypeDiagnostic: BN6PR11MB1794:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1sipXiRITr4vGoDD0RzvXJH213sJxrw6GpgbBf4b4fE4msDFCulKunqwHIyuDXIbiHQ/S67CWK5Sfhhlg1cHsSjY8CxzDosXx8MVIlBOpoxNrlkGbAsrMBTmthcsNlBtASzWeRp+C6pY+rk0fXebMGuOWP35UCvq6TxNxj+7aGVVzZD8AzyVI8IO4TNgFQWr5/Yh9EOuwE0YmW5FARNKniEj9Zbcbmm6Ir251QhFb/xH8UmxkOGAH4Ihizy7a8Rca0reLtg9Z4gN8xUTFzpKSUl+/+PQFj1gJZP4/JjBGAfkgjOaYs1+cPjzdnr+wVU3azW4B9kcihlyXq9DVKKa31QFoJlWTFxuigb5efeIH1CKj1b0s5ewL53kcsIThkY+IzTXaFX8z1JQcIspthQ/2xriTqB9NLmJx++hRGqnvvtn7INAPbRQFdB5c+rrDCbtsZDYGtxq3gIoGB4izmHjaAWFiK9E2iS96P67WjJcTvw4v5gPyJA/RroM63BstyjXeAi9WBhmBxmnioPLNdJF4mJBJWHcpyXSjj6pxNhVHNsLVSP6zrsCe5AOXUNNl5gHj6RhD1h7Ioc+yhnzU8pFK30ody85pVlXk4ytH8gRuy6EophUz/0VaGFZa5n/5lqx1CzEGYHrNvCQObn+m9Jif9/O1AAC6OdtKRj+xlt/NS84SvxxQVnC7hK8OfKdcgWuvlnRMeUcdsLNueQn4ufKWRR7ytZ6I3qmnRygG0ukPd4R5/JRb32wgBaIVAdov8KH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(396003)(136003)(366004)(346002)(5660300002)(450100002)(6862004)(6506007)(41300700001)(86362001)(6666004)(26005)(6512007)(82960400001)(8936002)(66946007)(6636002)(478600001)(37006003)(6486002)(66476007)(8676002)(316002)(66556008)(2906002)(36756003)(4326008)(83380400001)(44832011)(2616005)(38100700002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ku3XGJuHRHek/MODr8yJUfany2iHpL59VJnuD8hMb+oCVWuUxhCjb5av07/q?=
 =?us-ascii?Q?UQx+8ZmZvoaCvCZ2QZNcMDcn+2o1kw6+mC/OC22FQw4FpPo+wsZlRexP9Q13?=
 =?us-ascii?Q?3mCwUJWCI9q5AIllUIkc5vrWX6V9tkbv8Pk8L4RwwYVGZioRUbKr7JzKHgzS?=
 =?us-ascii?Q?1iw6mJi2dJmqv6L+bbQOlO1jz4+59HZkzNMQVAvrbzl1bbnEBSAplY8iJ7Kk?=
 =?us-ascii?Q?Zm0xpeakkvfDJtc0HrIxN/as1V3chkrVzSKdujaGeUpJ5ORxmW4P844kj1zf?=
 =?us-ascii?Q?Bed9hWMY5GpJehrOJiJZWhI7ZKxFYRHg7HvLB8irFUddhTzAiQSCl/WNNsEd?=
 =?us-ascii?Q?FYGVxOuZu1WlO7mF15lw6iNg8mZlgLSoO0EgyFK73nIWFN04dWfMZhASdlmX?=
 =?us-ascii?Q?aXtimePOdD9jAKATkEAwyeV5V3iecv0CnZLhN6ZM9YXmJX4Ogy5p3hzz1K6E?=
 =?us-ascii?Q?3vdOm4n9UOYtfLLL+kIlTAx6bDSoNmcHyMkSqxprR6x8icUNvC/oZdCrzxrm?=
 =?us-ascii?Q?AMAzzMIH4KN/Gc3kQ4hQCU+I1h7gS7aR4dSNVbiXOzThI9R4UHTfEsEX8aEW?=
 =?us-ascii?Q?JRcUWvkiaUQvJ2MINBVjSFsQmf5cmAcaQBJIZYUq7yj2Udo/xytn5+IBtShK?=
 =?us-ascii?Q?+M+mFnJfzbvw5loQUuu04cd5sWucbcCEcFCzec530KFl1ztun8tCD+DOXkC3?=
 =?us-ascii?Q?jkW9z70a9uImNhhW4AiGfqs/fZXxngcCiNUPy7/dmHblV+U2TktcvG8BP7ao?=
 =?us-ascii?Q?lr6hQ3bFnKvwzwsCmjsa56OnWnq1sP/77qsTUHbkcmzfkIYvYKIcxj68E3qY?=
 =?us-ascii?Q?AtpHoMJGG/wbpgV9HW9dqRZ2YaKH/r7OoqSPLULkewHmcQc+25TH5TjUaV2d?=
 =?us-ascii?Q?x6k1086VPaZ667RHMwmSsqU2+rVdtZPl4vYYPem/NAy/F7m5Ykld7O4JP1jB?=
 =?us-ascii?Q?H6WeDlnooG2nR43afUypkl1V39Sxbe2GMOujTV7rzW5Or3MJx7LHEOMtkTYS?=
 =?us-ascii?Q?4EgeoxzAE32bAgolGbaXsKC12sDkaoog58vZ1i/fNKqIzBwv54O7C74S/BEj?=
 =?us-ascii?Q?/PWy2foeSLVXnxs6YjlR1Y5uaxyApNvAU9R0tLWGdkZZoZgIAkwwHMtj00JC?=
 =?us-ascii?Q?r/RdMSdby7YmZ35pQi2ND7OMvFTaNLqRx/Dq9ODbjnR1IWDIhLmPWeiwetjD?=
 =?us-ascii?Q?KKk+lzUUaOA9VgzD44dkDX7o48PEaOsFdCXRGNBNgJnC6g5w3ftzCu2TTD8p?=
 =?us-ascii?Q?eocW3q/jw3YStZ+9Md3vYyu8XAMuETcjgaPGK+x0BNo7/AxMfUt28K+nSMhk?=
 =?us-ascii?Q?pfwMGIFVOM49qnSooZmwz+jHetmTFzq9hbyITRu9t+eOuw87DXwOOkvgSa0B?=
 =?us-ascii?Q?5e8VyVe+UdGoqgEPgLepiRTiptTNU6UMijTfg04Gcl1rzHkz6qEpN9Afhapp?=
 =?us-ascii?Q?6f9agsJOTj2yxdEmmOhTp+laId8zyubWdBDUgTRzM+RUeWCaZ18pdxP1uP42?=
 =?us-ascii?Q?NKwDTLpmu1ytlh2+UJH1WQmnTPK1zYdhg11Ko6cWjTl5SLD6Dc2asniK6A80?=
 =?us-ascii?Q?rPYNO2CXQ//j6QP/pje9mDpExC1VNQW0i0gaHkW7pE6V59h58By5iRZAaD60?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1e559f-6451-4952-dcbe-08da7ede595d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 16:51:07.6165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YscUujivqnPSLznuw9ftQfXWEXaH7kIM3WWdL/4vh6k9H3b8LRzSC+QBFPMggSlPYxG2Yu5cOAq4tNJOOYhi4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1794
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

On Tue, Aug 09, 2022 at 05:03:06PM -0700, Vinay Belgaumkar wrote:
> Host Turbo operates at efficient frequency when GT is not idle unless
> the user or workload has forced it to a higher level. Replicate the same
> behavior in SLPC by allowing the algorithm to use efficient frequency.
> We had disabled it during boot due to concerns that it might break
> kernel ABI for min frequency. However, this is not the case, since
> SLPC will still abide by the (min,max) range limits and pcode forces
> frequency to 0 anyways when GT is in C6.
> 
> We also see much better perf numbers with benchmarks like glmark2 with
> efficient frequency usage enabled.
> 
> Fixes: 025cb07bebfa ("drm/i915/guc/slpc: Cache platform frequency limits")
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

I'm honestly surprised that our CI passed cleanly. What happens when user
request both min and max < rpe?

I'm sure that in this case GuC SLPC will put us to rpe ignoring our requests.
Or is this good enough for the users expectation because of the soft limits
showing the requested freq and we not asking to guc what it currently has as
minimal?

I just want to be sure that we are not causing any confusion for end users
out there in the case they request some min/max below RPe and start seeing
mismatches on the expectation because GuC is forcing the real min request
to RPe.

My suggestion is to ignore the RPe whenever we have a min request below it.
So GuC respects our (and users) chosen min. And restore whenever min request
is abobe rpe.

Thanks,
Rodrigo.

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 52 ---------------------
>  1 file changed, 52 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index e1fa1f32f29e..4b824da3048a 100644
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
> @@ -597,29 +576,6 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
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
> @@ -679,14 +635,6 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
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
> -- 
> 2.35.1
> 
