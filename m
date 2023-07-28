Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24596766080
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 02:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7558910E637;
	Fri, 28 Jul 2023 00:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517A910E07C;
 Fri, 28 Jul 2023 00:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690502875; x=1722038875;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qMLpe8Uirm8jJbFX5Q1EaomuzPFcp8QfRvOulVHAJME=;
 b=Lu/4EhfK+eneNQ6y/18UEMiwUgnoErsVNk3TNa633HMESgrWrfJSvBoh
 eXrWbQK75Gz6dFhOKT88i0eL1VG147v9zTf2s8xOcygtuUvLOjgmW+bgL
 TdHWLlgoSzRbdnY/cazpTDG/9/eJ7QDphq2IIJuB1BRou4+9CrJajXYa8
 ZjaoeAhiYCuW5HHmFjtRz5CObnVF9XPKZkMdjmQpm+TaILRJzrx7vacFe
 h0D1NuqZ2idQ9qUG7TzPOHbKUn7ki274aV82WROeyJqS7OrMMYs/0PSPE
 2zDjg9ntVAmHM3455VA7wUcDntFOfEKwlZmduXmzoIXIjGWykT4JxvmHQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="358486865"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="358486865"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 17:07:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="721062360"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="721062360"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 27 Jul 2023 17:07:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 17:07:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 17:05:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 17:05:41 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 17:05:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlCih1BA3+26F9Sos405nY9LYBE2UYgjhnAWsujHtubkdE48pj6NQES1h2nTcZ+l3KsuQZJ7ZWWX+C8IoUaoA98moF4Bc7aFqyy2n9GmNllfXKn+Peg4zWIZezd+AW32et0K5DNewj3BreOz+4656bL2Et68P07VYMYad99LNdkAaHvDltF9hlv8uXy6U044wQJ2/L0Yy+XuVLEIs/Vfx/otlGQThBcxn9PsQmRWli+SORltQb6/OG2ac9Xm7qQ5EM0TIyDW1N4yicuG4ggsvJt/bN+kksQMAvyOolLRFpmq19DR0vdkCTA69jEGgvMqnlzbDJtkXuwtJXFNwXqFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6n6Kg4pBvsYIJ6ezgVFM40nTdVrb1kdEHEAao760TY=;
 b=CuBLBU+vaoctwZmyCl45LqC6Oi+4QpPYsHPGADcGfdAG2RuvgwXHPqVXY1aYWxAW1K+QgUNkRoxkUVCLaZ5Wl5Otz/LLRMzbzsM2p/Mx0Zs5GPWtpaW7MtSXN/hSZrJqGspu1WGu97u9qah4DZ24aXzSqefvSZ2f1/7+dnv+i9jMCQm26DqIh7kSDPaw5YHLLgHGTEZpaH3uHgOGSm3MFVMMDGnQWrL09jDCVNOmgIZynxg3gjptry32bIy9gLVdIm5yH9skUs7tTnh655pSUV5m72nT4nfGNvd749rRyBFVgAHj3FEfOP4m60WH+qXnbfwXXCnjz41DEARXbqgMdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA0PR11MB8353.namprd11.prod.outlook.com (2603:10b6:208:489::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Fri, 28 Jul
 2023 00:05:26 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 00:05:26 +0000
Date: Thu, 27 Jul 2023 17:05:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [RFC 6/8] drm/i915: Lift the user PAT restriction from
 gpu_write_needs_clflush
Message-ID: <20230728000523.GF138014@mdroper-desk1.amr.corp.intel.com>
References: <20230727145504.1919316-1-tvrtko.ursulin@linux.intel.com>
 <20230727145504.1919316-7-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230727145504.1919316-7-tvrtko.ursulin@linux.intel.com>
X-ClientProxiedBy: BY3PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:a03:254::6) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA0PR11MB8353:EE_
X-MS-Office365-Filtering-Correlation-Id: 11b6a75c-cee5-4506-429a-08db8efe58a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TvJ57PBPf5+C9CoNeatIXi+i+WV+4c6ywJNuITFzBL5sKLCDlX70mrfHdjnM5wrVNXXBAhFNUWfmsKpBZv7foMELY6bTFcjnbxhiLwRqwkP6+uSajmf3dYIacvGS0RvqV1ScA+Y1q2ssqtT517qUz4L/vXL1/6TMBu5xObhhEYQkaTyOsCXX7eSIhPGQv5S2UCl7WG96nPCRhJG7XKSthGcYToLwCEas+y8UQCCh8tILm4Dr2m7RM3RNwK5R95O9zrTS9wg/ztqWRUJZAcVLBvcawMVHE8HFDxI+jgSrudWZCD7X5ISnPWnaUpHJMu6s1jDdqCRFOJ/MwO5wvr73LB2cXJ2KAXnUbtDgU1wMJnRAcFVacO0UH8ZSEPo2ahdmTXVnXvw06prMZbN5XAQFbQW0l73OI5te9MgUz5BXlIBvuB8CaCFFrOzoHsFIIFkM+RIGRhW2phGsxUn4Vi2vCKt2GX4+cVywXkbi/V1JIAUaZgw0z9P+Ou2Qgzw0iYjthXH9Ow0YnQTi0CHIqHN5a6Hsb7IrMdwgMjYXjyBFzsVchiy/USbzgwgj2dyTF1C7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199021)(83380400001)(66946007)(66476007)(82960400001)(4326008)(66556008)(316002)(6916009)(2906002)(186003)(38100700002)(54906003)(6486002)(26005)(6506007)(6666004)(6512007)(1076003)(33656002)(86362001)(41300700001)(8936002)(478600001)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vBv9OPrDYNbi9WiXh4hj3K0co3GghEO5p/ADma2U/qwIOS9Gnfn2QD111vTH?=
 =?us-ascii?Q?62cYZYV2L6xqYCWQICT4R+Z23uAbEDjVaXqeO3ysGgsLmQrNEk5JRFtoCElF?=
 =?us-ascii?Q?9/R6P/657VChj75C+fti2mIZ+4rsvr6AdTLdiPFCYeyO7sKFI8OWYi8u5XvN?=
 =?us-ascii?Q?ITyP8Zg9XRgjmOWPGoCHvgAziknkBd1dgjscAKJtPVbZjzBJLxk7qpf3U43j?=
 =?us-ascii?Q?T9+4pn4EmjF2OiKClbI0l4WI5z3AHIis16ZDf7CnnDLoOJnZainRpiyKGtqx?=
 =?us-ascii?Q?lpL/0XqkMZfXBiXWMH7b/rucKic6JD/Z1c5wlHVME32TLWyjrhBF4ur6mlHb?=
 =?us-ascii?Q?r/balJD6p12kmSwtYuNcWE4NSfFVyzH5+F08dQ5YeA49u7hcS+aFUJSC9qML?=
 =?us-ascii?Q?4Pp1+5mkk/uGRVidyrHUljwZfpjq+OJAXYx2X34IFdTBJyKeBsTKFndRD1Mo?=
 =?us-ascii?Q?Ln3l06C14JTRr1guFjXRhbdXmElwg2bAzxFmBD4GFp4HhgHmgEzQr8xVqC3c?=
 =?us-ascii?Q?2wv+9h63dVdIJZC1xauzst8zKBiDjNMFlRBAjp5olFTUxqAyBFihbf7c7O6a?=
 =?us-ascii?Q?Ccmt3qhUDgP706IcHdLeHxMf29k9IovXOeFVfDLCUhkDiz7sd3t+4Ul7/Aay?=
 =?us-ascii?Q?DW265KzYipFFCF7IB1h4T00AkEXIDVwvCgHK5WzxDtRNFU0I2b27steMGvHQ?=
 =?us-ascii?Q?GdfW4qwLhFEqe8DRLk0p1eHWj70hJkndq9BFfApSuohx7v/jM8U7C9aQbHAE?=
 =?us-ascii?Q?pqlGRhWgogu0cTBzzFwVXwk8JNW9HQFvpXzgOYgaa4W/LyVVYBh7txFzYUl+?=
 =?us-ascii?Q?9K8C9CFmrE2MpX/n4W9M0j9sGT+TClHsUk8cIWsYFH6Tov63rgPK7x2xGdvb?=
 =?us-ascii?Q?7aMuZ4OCQwyNciDRbHzR8wSmz4MMZckb/s0uUn0kRvXwsY2ElvjnevyWhqEQ?=
 =?us-ascii?Q?/oc4uytRzCAYNuZIf/1iO1WmWiEZ334gg4sy6qgsw5MV6bZVWkelAgr/P2GY?=
 =?us-ascii?Q?jVSAt19v4l6DKZRdc6EQLHhIyafHXPmXW/X4JJj37QuEM9s1uojI134FvEI4?=
 =?us-ascii?Q?E8rN+2PPK2gSk7I2eqhKVOqeXQe1ZUy4jnb5+MHyJCXKRB4Nip3F3KducNnx?=
 =?us-ascii?Q?0i+bTN+XRkM0oXVb4SlBMbo/ZS9nBTs9a4U+A3ZR2g1s/PvANBUAMn1w4fZD?=
 =?us-ascii?Q?ntp/u2BSNIJ8vziPoUp3qY5YInALAQqftTRSk5P0krPoYoRNE6dco7VYh/Ox?=
 =?us-ascii?Q?u0x5/b6MWSUYi7e1XJciKXWGusbbo321k+RAt5nIDSTiyt/X1TWTu//ykMEi?=
 =?us-ascii?Q?hR3j6yd0ol8WPbw3mSeYiOgYj2x9UdtEnnbtTyXdO4p3x1ow7pT83hyuQD8T?=
 =?us-ascii?Q?QOMAGmUOTYNrhAnXsvcLX/O8Fc6cRzFwMGdrruQzElIwc/3APoxUtyDM6GNB?=
 =?us-ascii?Q?Naw8+QXBe/j7ITq1Y3emGWbBaPqogQ/b8Vf9Mr+5Y/87bL15dluiay8mv62I?=
 =?us-ascii?Q?Iz14kYew5HgloN7U+1WWhIe3xLams45h3J7zempUwwAIuGI2zA1c3l205P2J?=
 =?us-ascii?Q?00eldI2CuIr42AA3zOiD0Y82H2wHL2gTPip9mWAcr42oPpsquEbLIIMUZRNF?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b6a75c-cee5-4506-429a-08db8efe58a9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 00:05:26.4630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnHW9Vtt7ZHQh8QntNZ6C+5lRl6e6ifLHKKoYWzALdg8UyVe/kKxVmiERom5ZRYPzfoHykSXny56GR4Rl22Ks+CqqC7DVbLP4VSz1gFWmGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8353
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
Cc: Intel-gfx@lists.freedesktop.org, Fei Yang <fei.yang@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023 at 03:55:02PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Now that i915 understands the caching modes behind PAT indices, and having
> also special cased the Meteorlake snooping fully coherent mode, we can
> remove the user PAT check from gpu_write_needs_clflush().
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_domain.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> index c15f83de33af..bf3a2fa0e539 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> @@ -41,12 +41,6 @@ static bool gpu_write_needs_clflush(struct drm_i915_gem_object *obj)
>  	if (IS_METEORLAKE(i915))
>  		return false;
>  
> -	/*
> -	 * Always flush cache for UMD objects with PAT index set.
> -	 */
> -	if (obj->pat_set_by_user)
> -		return true;
> -
>  	/*
>  	 * Fully coherent cached access may end up with data in the CPU cache
>  	 * which hasn't hit memory yet.
> -- 
> 2.39.2
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
