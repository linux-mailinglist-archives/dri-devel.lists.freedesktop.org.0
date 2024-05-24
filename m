Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381B98CE6A6
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 16:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E0110E8E1;
	Fri, 24 May 2024 14:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FqMPExRh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE35C10E039;
 Fri, 24 May 2024 14:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716559674; x=1748095674;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ge6GRehRnmOM9GocweviHkMV3UXETQh8U94lQOCTh+A=;
 b=FqMPExRhxUQ0JlEqMamqE5lchLAn+7APY98fv8CytdGO7A+eAKZukeUl
 IYGrJexKK+7GBIz5+PltkXfxxIKhC10HfR9M5KH/ZhDP/AvMi8srxqWkE
 ed9PVPVcH8RuAa5rTOqr4BmQFXnCfYfnbt5thB7lmG9nKdALkeBlIixHt
 03FHN+HpYuFnkPuiYjEN0M0FinVEWV9geL8bMBjGfTl2z76ILvkrW1dEv
 K2hw/7kl2jwcAR0muDhkfVEjQtSeweDru2NVribZwoMYsi5OzBx79F1PP
 f34hmbB3W0Pr2/a6T2CFw64jTKhSPRPVPmU2WZ2hU5IW5jtNPXz+LhD9K g==;
X-CSE-ConnectionGUID: 5bEE4ylfRZaC7JQH3Y1PJQ==
X-CSE-MsgGUID: XlybwH7YTZ+jw2kD2qRr9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="13122788"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="13122788"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 07:07:51 -0700
X-CSE-ConnectionGUID: fM3MfKo2RkOlAFwLD/RiPA==
X-CSE-MsgGUID: h54GgxHmSn2CbnkLFokrig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="34144001"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 May 2024 07:07:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 07:07:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 24 May 2024 07:07:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 24 May 2024 07:07:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqHY9W278RS92+57WqgPQ8krgAI2tGL+MOrPWQG1q1ybFeNeQRSJIjYKFMd/pSZo3jTAXb8WIxfP3kh7d0//uUErtjPlLAAgrLnQ2lSdzWKzaum3Bfa3Y1RO9pInOE8izruzWbpDMOO8BoOga5S673MoCfC9+S1DQvAUONnD7sqKJBPNtiXJ7wwVdbxTlbdu9hTfRTyABpDe6jy1ALJYC7osflTg6/eAphoHg/b4f/7h9CoSfbcm0hPKaeMFz7Nxd3aXVtSqYfwE/ZQNvbVUP20ujpbjfXDnV3QJBx4PIpId64EY4x5TXYeCLYg35pQFOSVqTzCuFui7Q5x7YocDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWuUJ1I5MDGdPAfZa2EanShcy2YsSgPCfCFT45e8bHM=;
 b=GRwjnIqioQQABq9WZl1qsaASUA6CXKCXKo+gn4gDrJ+vqJ5wFGZdELWqW5pLVZsd6xWZY5nkI/NjrtNSpChkUkqUyyvdj06EmTk4zy7pwq75A47MA4+fze7p9/Jps5KPawdms54MDeL6yV/b2YH/ei8Bl7hGyw5Zdv/8J0ZqxdktnKUkptoj6rnnS/mUmuO5vN1+Om0xX1jeeW5SmCT95oviEuaWVvc/eVJ6esMpa+wlby/SwbRBJqWIDrHnLJe5g94uaFTWGTWiJX7XwmXQYgQy0FVwBu8bBZEDjKDZl3aedRPewHC4EZDbtLHt0CBh6iP2WfCuXDBUMIw5YWwA5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4786.namprd11.prod.outlook.com (2603:10b6:303:94::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 14:07:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Fri, 24 May 2024
 14:07:49 +0000
Date: Fri, 24 May 2024 10:07:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@intel.com>, "Janusz
 Krzysztofik" <janusz.krzysztofik@linux.intel.com>, Andi Shyti
 <andi.shyti@kernel.org>
Subject: Re: [PATCH v2] drm/i915: Increase FLR timeout from 3s to 9s
Message-ID: <ZlCfMPZpvQJmHybR@intel.com>
References: <20240523235853.171796-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240523235853.171796-1-andi.shyti@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0194.namprd05.prod.outlook.com
 (2603:10b6:a03:330::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4786:EE_
X-MS-Office365-Filtering-Correlation-Id: 37b4f3a5-0d1b-478e-a641-08dc7bfae4e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v789iQkpyvcjsnM3cbnJRWm3ZkNhkCF21TfuYeUwk4AQDpSvYOxXdBdwq6KS?=
 =?us-ascii?Q?EFnayNTxZqxgs11XlA5P6cBY+xj1FC2wBJDDtD9Y738I/0Dl3nyENAJJlFqw?=
 =?us-ascii?Q?j1ntQUmuqZ40H7KjWh9TrUY4A1Yw0VUpm41a5ES6Y8YMkC6CeNtM3mLXeW8O?=
 =?us-ascii?Q?wA4bcarXheB9uSZYcBGJ8sADHIQjF44B9U7CEoEHG4L9M56oSIVlavz4p8bR?=
 =?us-ascii?Q?GI+tSQIl6Ba6eG1o3jax/bw67zNgho5tjzwJW1oL5gAktd7FVyCHofTqE5/p?=
 =?us-ascii?Q?qoU9fIyGXfRY7ItrnXqQqh5Ys4R1epBObG9EehXqeUtQYBcguJH3iKKMdT3M?=
 =?us-ascii?Q?TkQvOA+RtjL79fTVJMqh4z9bncqJKQo55tjSD0opui+PmCxIgqKzGQLoMri2?=
 =?us-ascii?Q?LHKvIGwQdm6ShmLt5Rw62GOq6awDjNY0cuV4cPPmz7UPQQCz4BcrqhzICMuC?=
 =?us-ascii?Q?9WBGCK4rjyHtGVptD3ihOGs9A7Fceo3Qpeiw8cpytDSN/SYMeNqMOMuWhK5r?=
 =?us-ascii?Q?Rg57gH28dIgSEfdP9pll8lBCJHGTgA6+AW5Kh269rrdITafBhmKAAMUp7SIS?=
 =?us-ascii?Q?8NqnkCbJ4Y2DdmX8TwDj4SV9efoNw8qin1CkzpWz+4XK8k9AQkyFTw1+z62s?=
 =?us-ascii?Q?axM6s7QofuXBh7/ywQpSXpS0PT35Y84BCi6yMV1Zz/QE8gmQ2swRAENU3DeI?=
 =?us-ascii?Q?a6vCCbyy4x14XlGh+kgzatz3bAXBfTCNWc4AWOuBM6vvnAm5nmMwQZxGSrzD?=
 =?us-ascii?Q?3JTryeWVT7DT8RHsRU42g0Tol8BnbLHKlGIsNc/nfYe2J0lzdytxwOhXDc6V?=
 =?us-ascii?Q?Dpn2vEDXxgv1hrpBwb8R3qF8W2BGmarVpSbr7RE1H8XQQGlAG9O07QsU/i37?=
 =?us-ascii?Q?cSNpNFpClBcETkYfh1gcUac0YErx5c8DnRXmtGr5gZL2IhCGhrT/x2iay8uZ?=
 =?us-ascii?Q?vIy4Et0cYhoAYn548NXAuBAL8fMtiQ/6CsqR4WvCSkKEkzwkDBlbv1Ctcv5C?=
 =?us-ascii?Q?9kNXIpeYXHGbeaejYPTeAi45gZ2cXS+fT+MCnlm15DgBDTcEHSdp7c4E1tVj?=
 =?us-ascii?Q?X5uIhsgm1CZI1253w9vwDKia90wHIDPEkKN3TwwmHUcDHNO1arnk67cOGZQ8?=
 =?us-ascii?Q?qQy20o/zf9kRlp+WYBPELXaupfmE3Ibde7aTvdOU+qkQA4YzMARdP9UJeDFb?=
 =?us-ascii?Q?l8Byo+YEJT0rFHxqxV7F/yI1rrVWLFb8wG4aW3hTbL0gOz8UNE/ucpzWJzpt?=
 =?us-ascii?Q?nv20+s+o20OjEnX3Rm/Ii2hkur1JN0kEw0MVRpptFg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BGHeNdpdFw/zeLltS8UN5D7CUs7MG3wQQrgqVxq67K3zVGbQCXJEwSHV7Tgz?=
 =?us-ascii?Q?vIAXxu+ziwjaxzkjI7x//XCunRPSCoPRB91ohtRKiqnp3O3HxLCF+tApV8fn?=
 =?us-ascii?Q?cY+KRTYd2fJNqqLqtwzRVvktsHHA1yJ5OBNZZ94TU3UWsXaSbdPiyGnn8xA8?=
 =?us-ascii?Q?2dcrxiUkG+z1siLsc1HqrsobbDvpVbeDGlSbyYiOOnpJzid85FLDMsxpIV+J?=
 =?us-ascii?Q?IUsN8adfwM4Y5xiArwVm4UTfBKlGshQv1uxphaPXo5FW2u+SPqCPhgIObVWe?=
 =?us-ascii?Q?eXpFkQ2eiKES/4oFMKVFipTzzoJmWlGnZ0xaPxaGAOQvTyLGKJcIfcr4YzxB?=
 =?us-ascii?Q?x2QCR30QFnq5guIbm5+shYorkII23QSf+iQP14wLHOOWEyvdqBJ3MiMjMJMS?=
 =?us-ascii?Q?HXp4+2xFrSd352tzZb/r8zEp86Crl9mm6deu1kh/vZGDVKCmqmliTMuUqqoc?=
 =?us-ascii?Q?OaQfN8QBxM3nZgtDjCAsdODyM9LmOxZodE7VtZYI+sSk07OHM4/RVZH/wCE/?=
 =?us-ascii?Q?KLCfwC1glRjGyyGBxEJ1wG7kUFQnVk31vPrVeUaQz5XxcwtvmGRoYzcgXa7Y?=
 =?us-ascii?Q?LTRb1jf5atsRCH4Jf7dqIBfGP/rwvpzso782mhB7xGJj5vT7ErUg8ceG87Qb?=
 =?us-ascii?Q?R7GiaW488RxrFsdOVw41J+wqVA9Nz4aviVsL1g+whJ8u++uvFMlh1q7P03z2?=
 =?us-ascii?Q?xc2IxhnnIV2WWKy76H4uOU1V9ngibuzo8VWQMdHYy67fJsIL4w/PrTetf0P8?=
 =?us-ascii?Q?kirgk+iOoxJ5tI9+mzq3NejEM2fWCfUKNlnjRn9QyzBAtR1l9NWotj2qk9xy?=
 =?us-ascii?Q?gtm0n52Vlt+hpojBXKgw0yzdf5B8wv/o197YD65AwBI7+xlIXEjv+KN+Kj0Y?=
 =?us-ascii?Q?HFQ7lYkWWTdUI/k71w6S+PV4Kk9bn2/moShJU4/77fQHhaF932taBM3nhytt?=
 =?us-ascii?Q?Wa5PY5jutv+xL3zSAwqF8gPrRAkCyRCAXoqB+YjoDTuMrEKmwjwDaYrESruu?=
 =?us-ascii?Q?KiYz2N9X0NRvNJayOBaWEGXYTqtZneGDiIQXADyBbEDm3Ek2/kMWZq6aTKQa?=
 =?us-ascii?Q?xKTedI3umubBlnJ6FPkRlDIEQy68GknOVPQCvICxHPsWWnF/P3IhCq0QeoZA?=
 =?us-ascii?Q?VT553hNoyiNK/E/aZzDpSMYND0xe+OJCxrSdMo32QUsQZBNsf3tR2CULiBxs?=
 =?us-ascii?Q?MlAO3nvb3C1R5NQmUoQPDAho2KEkWsSvPXxYx0cg043XD4HGmJm8Wo+SXGl3?=
 =?us-ascii?Q?hnV8yseFYRPOY11j5C64SSTbKJrwU5n9zp65sn2yjAKcIJWcUKL0ocJ1+NwD?=
 =?us-ascii?Q?I3eUSpc9qecfZflZV5oUXjNmNR4KD0zLEE+oEopCF+vIkyq+Y27X9yVHgTuZ?=
 =?us-ascii?Q?sW76pHOuumu7OYNCAeihJ70euo1ajHbttg7mwZSPivynwvtBRVVHoMVI4QKt?=
 =?us-ascii?Q?qe3NtDWAk0CpSZQDzJBYmFdiAUY4bNCJA9OVJaJuGGf1jnrOVi0b+m37BFLj?=
 =?us-ascii?Q?R+UnF/stfP2dba7ECElExAe3UuiXz5CoC5Pl9yXdgASk1TkIiSUdsGfD3FWb?=
 =?us-ascii?Q?52SpMksoBcr6k/8JcKD/fqI7J8KwPC3PC1RN3EsMJV0SVB+prnMEtfTnCS1D?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37b4f3a5-0d1b-478e-a641-08dc7bfae4e4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 14:07:49.4355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Slk7ZD+zNSQ9ZSDqvuEgOE9R0PveSEVo6LJrPhbLFzbxEOr2D9nlaAKKonzwBidZIo55//YKTaTMYqn+B2Y8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4786
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

On Fri, May 24, 2024 at 01:58:53AM +0200, Andi Shyti wrote:
> Following the guidelines it takes 3 seconds to perform an FLR
> reset. Let's give it a bit more slack because this time can
> change depending on the platform and on the firmware

But did we see any issue with that?

if that changes per platform and per firmware, shouldn't it all
be explicit in the spec as well?

> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
> Hi,
> 
> In this second version I removed patch 2 that was ignoring the
> FLR reset timeouts, until we develop a proper patch.
> 
> This first patch is basically the same as v1. Thanks Nirmoy for
> your review.
> 
> Andi
> 
>  drivers/gpu/drm/i915/intel_uncore.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index 729409a4bada..2eba289d88ad 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -2614,11 +2614,18 @@ void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
>  static void driver_initiated_flr(struct intel_uncore *uncore)
>  {
>  	struct drm_i915_private *i915 = uncore->i915;
> -	const unsigned int flr_timeout_ms = 3000; /* specs recommend a 3s wait */
> +	unsigned int flr_timeout_ms;
>  	int ret;
>  
>  	drm_dbg(&i915->drm, "Triggering Driver-FLR\n");
>  
> +	/*
> +	 * The specification recommends a 3 seconds FLR reset timeout. To be
> +	 * cautious, we will extend this to 9 seconds, three times the specified
> +	 * timeout.
> +	 */
> +	flr_timeout_ms = 9000;
> +
>  	/*
>  	 * Make sure any pending FLR requests have cleared by waiting for the
>  	 * FLR trigger bit to go to zero. Also clear GU_DEBUG's DRIVERFLR_STATUS
> -- 
> 2.45.1
> 
