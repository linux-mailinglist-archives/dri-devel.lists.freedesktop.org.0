Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CF97660A9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 02:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F4410E057;
	Fri, 28 Jul 2023 00:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1EC310E057;
 Fri, 28 Jul 2023 00:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690503478; x=1722039478;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xHFoY7B87gFMDEG+oWokjRTNk1T9jMbK4QToNiONz80=;
 b=EdcfkEb8aBaYjmOPaNLIUMAqs/sUsUpZajmaZyY2eHZmjI7tRpheEyyk
 ybXNnE7PrjDeU6vLMhe/u0tCT3luDt64dezlX5bvqUlACR1p1i2MRv6sd
 y/wAyGePT6dzZqFhEcijDTrM/Jjvo8QA+vd4UUUZh80TULfKgWu4HwBx2
 O+ilEdEOMZxHI0FcZmPMsea+botoLvA4EuXilio9bn8FCcqD1NC/ZHzPe
 EbquxXJPTZCfOF2UzHcyjxPR0VR6O5yX2BcYNaR10dsI0W6LZPmGB/MWS
 StlhWfkCy58qRfDjtpm07hKdrUbWSq0/N5oHe0F3D9KyvOElUEUciUbrb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="358488614"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="358488614"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 17:17:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="756939321"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="756939321"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 27 Jul 2023 17:17:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 17:17:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 17:17:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 17:17:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDXy+1RlvOrc5oIFA7lZl5JO25IU3Ik6sEBXH8ZykyGjAqkxWi4IQtALnoIuj1W/rygSDLU141M7QBsqdiXegz3oFNYkP8nABQg36G+0WPhy1R5NEhfVa0ooLikGlGD5P3HGu3ni8nkwubxsxM7gcLyOK+WvqAiZpT+/pKntpvxUg4/sHoc/l7WGKCIljE84CmrhdPtxAHsFH+wF0vvDMKhh25jmG8F6f8YMrcEimlfMm72w+l+0oYSFJvC61X4JZ78NMquTGXuEOMOM8xSTGl8c8Wha5q3gfwkqf9dgVf/+lPsOq1VI8PsZjUd3h1P5IIxpy/BDDdi685VZXO9D3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3sydgPKDuVsxzltkKf14ZVUqylkHiBOkZxQ0M3GCTrU=;
 b=itKVgAhWKkwYIHyJvR3otb0SmQVlmfoU5Hw3LjDoGNxmhAqoM0L4Sl/n95nmM19oaYJaG+mlAE3xM3aGW59PRCM01TsDFbXZSUGQeTvYRPfwH0y621ReEpkBVWUshrFxWzvkGOzuEjbOrMOYpnBAdptj2wOHUhfeG4Chp684gJeQhys0iP8SGvmHctDKqwSFDCNJi7+I74SoCBN2mfqUfWNYVNnkSX3slfat/hdu5t9dpfKC7VISRm/Wf0Gnu+TCRsNgRqobsBXfkZoohjx6a7rTKtbu3GgN1pOySV2EYMQQaG7nWhy1xKa7vLXAHZq2dIsEaQ6agbxLQzjjXVCb8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB6356.namprd11.prod.outlook.com (2603:10b6:510:1fc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 00:17:53 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 00:17:52 +0000
Date: Thu, 27 Jul 2023 17:17:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [RFC 4/8] drm/i915: Refactor PAT/object cache handling
Message-ID: <20230728001748.GH138014@mdroper-desk1.amr.corp.intel.com>
References: <20230727145504.1919316-1-tvrtko.ursulin@linux.intel.com>
 <20230727145504.1919316-5-tvrtko.ursulin@linux.intel.com>
 <20230727235750.GD138014@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230727235750.GD138014@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::29) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB6356:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fdba5c4-b88d-48a7-7aa6-08db8f0014f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L42Dln2jr3F9pbFPPPX2v9Y2JPHzifHQhmq+Kg98B9SLnuu74SigDuQqJfjHIItuq1QiRTu9FKLUTQ13swYoI4t9R014EI/+n2qwJpPz8dnotGmPZ+7EBk1DJyfc6n+DqCz+C/zoywAR0nX67lheWIfQCjoXzrb2Y9vRKbQ1YIqxlSHMZSOFnROxaHdvO8ZXTB9UkZN/AfiJN5geMSglfjR8B7gCS7TYALKha3DJ096HGYFuk5qOakDSld2FVzwmZkxUGJw/A6Z7P/7voTB1HHBmvvNEzVYxFirD99RJrHKTtLRZFO+9aLuVRX+/gdr6yFsXYIi27pK02LqXpsSEfLZ+E2pfCUZDGhbwpO99b7y3tCrMzDjBgEZGvmG7AtIvEbhXTNoksA2wpSzWCufTspb5Lfxwd4aGmNuFmHnubPeWfRcIrHxx7T+z6nOZlWzkp0pWgdcgU4bedABLbvfWNg2uOf6lwkJkbWt6Unxv5WwSA/H4RH6imv1R9AdDhLSCQRoM1dOGmrz8Jnu2+XoehSf/o0CHayV6HBHnLxPY68w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199021)(83380400001)(5660300002)(478600001)(54906003)(33656002)(8676002)(8936002)(38100700002)(41300700001)(6506007)(30864003)(2906002)(82960400001)(4326008)(66556008)(86362001)(66476007)(6916009)(66946007)(316002)(1076003)(6512007)(26005)(6486002)(966005)(186003)(6666004)(579004)(559001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eLtE202za5Z8rMbeRpVl9P7erNa62gAwR3i9902fAYfyOHUCn98gGf/F62ze?=
 =?us-ascii?Q?ilgtGZpFV2Ha4GepTWApWd2AF8jSB65yj0YPwIS62bkNf5xAL7ASCzHNe8Qg?=
 =?us-ascii?Q?Ivmgk6fpm+SekDuC9Kz7xJR+Eqzmm0jp7/kd6JuddvwoZqdWmv3ytHd1GFA9?=
 =?us-ascii?Q?t2oEOXtkTuUU67D8RvZSDASvBmsLq33iLnCdJPVmmQa4qKMPjGQznHHfub4m?=
 =?us-ascii?Q?4/RNuZb0aT4KQqljnyRIrOFKz8sR+2+IZ/4zbol5jio61YZ2cF9Sa7rpRTFi?=
 =?us-ascii?Q?65xiUOQt7hBhfSrDaYIwAMCJKpfRRhdZqvKkAIssDP4Qhyg3BpC9BcVJU/jn?=
 =?us-ascii?Q?skAEeRXR53dy2Q0AChmgxaBiOcO/yDPxbs1abAlhy5XtDCdtsBBfO2nVrjn8?=
 =?us-ascii?Q?vaEqQTNy8qHs5FYSGGl6YPnIQSf8jU9knGY5NaOPDXZQ56vCIP4PfVej1/fr?=
 =?us-ascii?Q?Y/4n7sV5LoF/2XcuhVT3d0GJImX4+SqQIADCvbeTnz6cQYO+Io8bkyw3zwRG?=
 =?us-ascii?Q?tgC+Wet7K/kfmooRncjTU2wOZm+KM5dGYGZPnH5Mz48eA1j9QtlXZMfeDM1L?=
 =?us-ascii?Q?CxNcWLAftuUj57PdZn3d55uf4M5YWMCOPw0GyWAlbDnzYvtQ4+IIp4edXSd0?=
 =?us-ascii?Q?c8r+0Yqi84/yRPL9xaSoV5Yv0krAFOjkGfCeyD7kIUSKIGrTaH5S1Fg9s7rg?=
 =?us-ascii?Q?6eOrSgkjyHhCl+GCrr2/cbceT0g10DkG7gguE6/fdk6oKpLf1g+KqCxflFoA?=
 =?us-ascii?Q?8TtMFF3qwph1oDtDmURVAnckupB39H2BXc+rgvGsiOLd9VZ8S6Gapv0YdMy/?=
 =?us-ascii?Q?x8eB9n2hyQihRd5c/HiH3ufEYPu2RkLlUFZKlEpdXnxx3stM8jalCllazuhl?=
 =?us-ascii?Q?AU2dkEHezTK6oCzcI6695ir2ztUML9wY4IKpvb4OLWUFYD7n6tvOMx4MY9Ra?=
 =?us-ascii?Q?j1B8p8VT//CMVWGXVY+LlxvuSmkxkE3Y16WEHX4umsTJ90pa9P5WjHMVdtf7?=
 =?us-ascii?Q?rR17duvYROU/eq3KcpQ56sN0InbQdWhvy0JHXO3IdZONUnHJbwZnQ0ks3I90?=
 =?us-ascii?Q?2A02E+GWJ53NNzM9Qygl6vifl4+Rh8f+kLtkRnhNTycdr0+raqFaHKfE2yhy?=
 =?us-ascii?Q?0GrBKBxZYz7dT0dCODkaOekWNa8j8tsk1fN5Wsb/nIPFOKs5rQhhyFHx3Kux?=
 =?us-ascii?Q?mDzuJT4XgSAYaEu6qjPGGI3akWiMmr89JAm/yI5llb7ita4L+cj7v2sBPHym?=
 =?us-ascii?Q?/1VNSKfgvO81VvHE4FkkCl6L78yhBgSlTdqvUeQ8Qy7ZEDZpaalmfvcEOLCx?=
 =?us-ascii?Q?K+2igUd8mWlf4gX3yqb7BFWIAcUfTlyrqLzxzF0JrVWpT4KL7AgUED0stQZa?=
 =?us-ascii?Q?+ywnMDc2FANN9f96+6+vwm7/2350wzKKrVjPY5ewh3E4s+F91lhmk+4p/3Bf?=
 =?us-ascii?Q?mjRJMFbcrb5gvJ05Dp0egHPa7rZEylDyIzIDOSTA0v7gDgJPzv21L3hU654y?=
 =?us-ascii?Q?VgS9x7cY6pVk0zwcn3dtAmY1n6Z9GiPbx/kkr9VXQnLnEEenHiH77S95KL0q?=
 =?us-ascii?Q?1Jj4i9EttvdObzKWk2Yjrb4ZZi6cuvSYvSHWSGpZxp4TrGfyIEps0MaG041C?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fdba5c4-b88d-48a7-7aa6-08db8f0014f7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 00:17:52.0488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBXDsoIeAdDCZniE9Hu/ak8vtnzYAciCInOzh6uuiH9LeDJjzps+LnVB42cHYzBKTA3BxC2B+SPh+NZIwKIMrhIg6CkYgZTJv0UUhDcqKzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6356
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
Cc: Fei Yang <fei.yang@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023 at 04:57:53PM -0700, Matt Roper wrote:
> On Thu, Jul 27, 2023 at 03:55:00PM +0100, Tvrtko Ursulin wrote:
> > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > 
> > Commit 9275277d5324 ("drm/i915: use pat_index instead of cache_level") has
> > introduced PAT indices to i915 internal APIs, partially replacing the
> > usage of driver internal cache_level, but has also added a few sub-
> > optimal design decisions which this patch tries to improve upon.
> > 
> > Principal change here is to invert the per platform cache level to PAT
> > index table which was added by the referenced commit, and by doing so
> > enable i915 to understand the cache mode between PAT indices, changing
> > them from opaque to transparent.
> > 
> > Once we have the inverted table we are able to remove the hidden false
> > "return true" from i915_gem_object_has_cache_level and make the involved
> > code path clearer.
> > 
> > To achieve this we replace the enum i915_cache_level with i915_cache_t,
> > composed of a more detailed representation of each cache mode (base mode
> > plus flags).
> > 
> > In this way we are able to express the differences between different
> > write-back mode coherency settings on Meteorlake, which in turn enables us
> > to map the i915 "cached" mode to the correct Meteorlake PAT index.
> > 
> > We can also replace the platform dependent cache mode to string code in
> > debugfs and elsewhere by the single implementation based on i915_cache_t.
> > 
> > v2:
> >  * Fix PAT-to-cache-mode table for PVC. (Fei)
> >  * Cache display caching mode too. (Fei)
> >  * Improve and document criteria in i915_gem_object_can_bypass_llc() (Matt)
> > 
> > v3:
> >  * Checkpath issues.
> >  * Cache mode flags check fixed.
> > 
> > v4:
> >  * Fix intel_device_info->cache_modes array size. (Matt)
> >  * Boolean cache mode and flags query. (Matt)
> >  * Reduce number of cache macros with some macro magic.
> >  * One more checkpatch fix.
> >  * Tweak tables to show legacy and Gen12 WB is fully coherent.
> > 
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > References: 9275277d5324 ("drm/i915: use pat_index instead of cache_level")
> > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > Cc: Fei Yang <fei.yang@intel.com>
> > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_domain.c    |  60 +++++----
> >  drivers/gpu/drm/i915/gem/i915_gem_domain.h    |   5 +-
> >  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   3 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_internal.c  |   2 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_mman.c      |   4 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_object.c    | 117 ++++++++++--------
> >  drivers/gpu/drm/i915/gem/i915_gem_object.h    |  11 +-
> >  .../gpu/drm/i915/gem/i915_gem_object_types.h  | 116 +----------------
> >  drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |   8 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |   2 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  20 +--
> >  drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |   2 +-
> >  .../drm/i915/gem/selftests/huge_gem_object.c  |   2 +-
> >  .../gpu/drm/i915/gem/selftests/huge_pages.c   |   3 +-
> >  drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  10 +-
> >  drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   2 +-
> >  drivers/gpu/drm/i915/gt/intel_ggtt.c          |  25 ++--
> >  drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c     |   4 +-
> >  drivers/gpu/drm/i915/gt/intel_gtt.c           |   2 +-
> >  drivers/gpu/drm/i915/gt/intel_gtt.h           |   3 +-
> >  drivers/gpu/drm/i915/gt/intel_ppgtt.c         |   6 +-
> >  .../gpu/drm/i915/gt/intel_ring_submission.c   |   4 +-
> >  drivers/gpu/drm/i915/gt/intel_timeline.c      |   2 +-
> >  drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |   2 +-
> >  .../gpu/drm/i915/gt/selftest_workarounds.c    |   2 +-
> >  drivers/gpu/drm/i915/i915_cache.c             |  89 +++++++++++--
> >  drivers/gpu/drm/i915/i915_cache.h             |  70 ++++++++++-
> >  drivers/gpu/drm/i915/i915_debugfs.c           |  53 ++------
> >  drivers/gpu/drm/i915/i915_driver.c            |   4 +-
> >  drivers/gpu/drm/i915/i915_gem.c               |  13 --
> >  drivers/gpu/drm/i915/i915_pci.c               |  84 +++++++------
> >  drivers/gpu/drm/i915/i915_perf.c              |   2 +-
> >  drivers/gpu/drm/i915/intel_device_info.h      |   6 +-
> >  .../gpu/drm/i915/selftests/i915_gem_evict.c   |   4 +-
> >  drivers/gpu/drm/i915/selftests/igt_spinner.c  |   2 +-
> >  .../gpu/drm/i915/selftests/mock_gem_device.c  |  14 +--
> >  36 files changed, 391 insertions(+), 367 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> > index 57db9c581bf6..c15f83de33af 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> > @@ -8,6 +8,7 @@
> >  #include "display/intel_frontbuffer.h"
> >  #include "gt/intel_gt.h"
> >  
> > +#include "i915_cache.h"
> >  #include "i915_drv.h"
> >  #include "i915_gem_clflush.h"
> >  #include "i915_gem_domain.h"
> > @@ -41,14 +42,17 @@ static bool gpu_write_needs_clflush(struct drm_i915_gem_object *obj)
> >  		return false;
> >  
> >  	/*
> > -	 * For objects created by userspace through GEM_CREATE with pat_index
> > -	 * set by set_pat extension, i915_gem_object_has_cache_level() will
> > -	 * always return true, because the coherency of such object is managed
> > -	 * by userspace. Othereise the call here would fall back to checking
> > -	 * whether the object is un-cached or write-through.
> > +	 * Always flush cache for UMD objects with PAT index set.
> >  	 */
> > -	return !(i915_gem_object_has_cache_level(obj, I915_CACHE_NONE) ||
> > -		 i915_gem_object_has_cache_level(obj, I915_CACHE_WT));
> > +	if (obj->pat_set_by_user)
> > +		return true;
> > +
> > +	/*
> > +	 * Fully coherent cached access may end up with data in the CPU cache
> > +	 * which hasn't hit memory yet.
> > +	 */
> > +	return i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WB) &&
> > +	       i915_gem_object_has_cache_flag(obj, I915_CACHE_FLAG_COH2W);
> >  }
> >  
> >  bool i915_gem_cpu_write_needs_clflush(struct drm_i915_gem_object *obj)
> > @@ -268,7 +272,7 @@ i915_gem_object_set_to_gtt_domain(struct drm_i915_gem_object *obj, bool write)
> >  /**
> >   * i915_gem_object_set_cache_level - Changes the cache-level of an object across all VMA.
> >   * @obj: object to act on
> > - * @cache_level: new cache level to set for the object
> > + * @cache: new caching mode to set for the object
> >   *
> >   * After this function returns, the object will be in the new cache-level
> >   * across all GTT and the contents of the backing storage will be coherent,
> > @@ -281,18 +285,28 @@ i915_gem_object_set_to_gtt_domain(struct drm_i915_gem_object *obj, bool write)
> >   * that all direct access to the scanout remains coherent.
> >   */
> >  int i915_gem_object_set_cache_level(struct drm_i915_gem_object *obj,
> > -				    enum i915_cache_level cache_level)
> > +				    i915_cache_t cache)
> >  {
> > -	int ret;
> > +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> > +	int pat, ret;
> >  
> > -	/*
> > -	 * For objects created by userspace through GEM_CREATE with pat_index
> > -	 * set by set_pat extension, simply return 0 here without touching
> > -	 * the cache setting, because such objects should have an immutable
> > -	 * cache setting by desgin and always managed by userspace.
> > -	 */
> > -	if (i915_gem_object_has_cache_level(obj, cache_level))
> > +	pat = i915_cache_find_pat(i915, cache);
> > +	if (pat < 0) {
> > +		char buf[I915_CACHE_NAME_LEN];
> > +
> > +		i915_cache_print(buf, sizeof(buf), NULL, cache);
> > +		drm_err_ratelimited(&i915->drm,
> > +				    "Attempting to use unknown caching mode %s!\n",
> > +				    buf);
> > +
> > +		return -EINVAL;
> > +	} else if (pat == obj->pat_index) {
> >  		return 0;
> > +	} else if (obj->pat_set_by_user) {
> > +		drm_notice_once(&i915->drm,
> > +				"Attempting to change caching mode on an object with fixed PAT!\n");
> > +		return -EINVAL;
> > +	}
> >  
> >  	ret = i915_gem_object_wait(obj,
> >  				   I915_WAIT_INTERRUPTIBLE |
> > @@ -302,7 +316,7 @@ int i915_gem_object_set_cache_level(struct drm_i915_gem_object *obj,
> >  		return ret;
> >  
> >  	/* Always invalidate stale cachelines */
> > -	i915_gem_object_set_cache_coherency(obj, cache_level);
> > +	i915_gem_object_set_pat_index(obj, pat);
> >  	obj->cache_dirty = true;
> >  
> >  	/* The cache-level will be applied when each vma is rebound. */
> > @@ -337,10 +351,10 @@ int i915_gem_get_caching_ioctl(struct drm_device *dev, void *data,
> >  		goto out;
> >  	}
> >  
> > -	if (i915_gem_object_has_cache_level(obj, I915_CACHE_LLC) ||
> > -	    i915_gem_object_has_cache_level(obj, I915_CACHE_L3_LLC))
> > +	if (i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WB) &&
> > +	    i915_gem_object_has_cache_flag(obj, I915_CACHE_FLAG_COH2W))
> >  		args->caching = I915_CACHING_CACHED;
> > -	else if (i915_gem_object_has_cache_level(obj, I915_CACHE_WT))
> > +	else if (i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WT))
> >  		args->caching = I915_CACHING_DISPLAY;
> >  	else
> >  		args->caching = I915_CACHING_NONE;
> > @@ -355,7 +369,7 @@ int i915_gem_set_caching_ioctl(struct drm_device *dev, void *data,
> >  	struct drm_i915_private *i915 = to_i915(dev);
> >  	struct drm_i915_gem_caching *args = data;
> >  	struct drm_i915_gem_object *obj;
> > -	enum i915_cache_level level;
> > +	i915_cache_t level;
> >  	int ret = 0;
> >  
> >  	if (IS_DGFX(i915))
> > @@ -378,7 +392,7 @@ int i915_gem_set_caching_ioctl(struct drm_device *dev, void *data,
> >  		if (!HAS_LLC(i915) && !HAS_SNOOP(i915))
> >  			return -ENODEV;
> >  
> > -		level = I915_CACHE_LLC;
> > +		level = I915_CACHE_CACHED;
> >  		break;
> >  	case I915_CACHING_DISPLAY:
> >  		level = HAS_WT(i915) ? I915_CACHE_WT : I915_CACHE_NONE;
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.h b/drivers/gpu/drm/i915/gem/i915_gem_domain.h
> > index 9622df962bfc..6da5c351f6fd 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.h
> > @@ -6,10 +6,11 @@
> >  #ifndef __I915_GEM_DOMAIN_H__
> >  #define __I915_GEM_DOMAIN_H__
> >  
> > +#include "i915_cache.h"
> > +
> >  struct drm_i915_gem_object;
> > -enum i915_cache_level;
> >  
> >  int i915_gem_object_set_cache_level(struct drm_i915_gem_object *obj,
> > -				    enum i915_cache_level cache_level);
> > +				    i915_cache_t cache);
> >  
> >  #endif /* __I915_GEM_DOMAIN_H__ */
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > index 0a1d40220020..9d6e49c8a4c6 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > @@ -648,7 +648,8 @@ static inline int use_cpu_reloc(const struct reloc_cache *cache,
> >  	 */
> >  	return (cache->has_llc ||
> >  		obj->cache_dirty ||
> > -		!i915_gem_object_has_cache_level(obj, I915_CACHE_NONE));
> > +		!(obj->pat_set_by_user ||
> > +		  i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC)));
> >  }
> >  
> >  static int eb_reserve_vma(struct i915_execbuffer *eb,
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> > index 6bc26b4b06b8..88c360c3d6a3 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> > @@ -170,7 +170,7 @@ __i915_gem_object_create_internal(struct drm_i915_private *i915,
> >  	obj->read_domains = I915_GEM_DOMAIN_CPU;
> >  	obj->write_domain = I915_GEM_DOMAIN_CPU;
> >  
> > -	cache_level = HAS_LLC(i915) ? I915_CACHE_LLC : I915_CACHE_NONE;
> > +	cache_level = HAS_LLC(i915) ? I915_CACHE_CACHED : I915_CACHE_NONE;
> >  	i915_gem_object_set_cache_coherency(obj, cache_level);
> >  
> >  	return obj;
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > index aa4d842d4c5a..cd7f8ded0d6f 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > @@ -382,7 +382,6 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
> >  		goto err_reset;
> >  	}
> >  
> > -	/* Access to snoopable pages through the GTT is incoherent. */
> >  	/*
> >  	 * For objects created by userspace through GEM_CREATE with pat_index
> >  	 * set by set_pat extension, coherency is managed by userspace, make
> > @@ -391,7 +390,8 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
> >  	 * objects. Otherwise this helper function would fall back to checking
> >  	 * whether the object is un-cached.
> >  	 */
> > -	if (!(i915_gem_object_has_cache_level(obj, I915_CACHE_NONE) ||
> > +	if (!((obj->pat_set_by_user ||
> > +	       i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC)) ||
> >  	      HAS_LLC(i915))) {
> >  		ret = -EFAULT;
> >  		goto err_unpin;
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > index 3dc4fbb67d2b..ec1f0be43d0d 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > @@ -45,33 +45,6 @@ static struct kmem_cache *slab_objects;
> >  
> >  static const struct drm_gem_object_funcs i915_gem_object_funcs;
> >  
> > -unsigned int i915_gem_get_pat_index(struct drm_i915_private *i915,
> > -				    enum i915_cache_level level)
> > -{
> > -	if (drm_WARN_ON(&i915->drm, level >= I915_MAX_CACHE_LEVEL))
> > -		return 0;
> > -
> > -	return INTEL_INFO(i915)->cachelevel_to_pat[level];
> > -}
> > -
> > -bool i915_gem_object_has_cache_level(const struct drm_i915_gem_object *obj,
> > -				     enum i915_cache_level lvl)
> > -{
> > -	/*
> > -	 * In case the pat_index is set by user space, this kernel mode
> > -	 * driver should leave the coherency to be managed by user space,
> > -	 * simply return true here.
> > -	 */
> > -	if (obj->pat_set_by_user)
> > -		return true;
> > -
> > -	/*
> > -	 * Otherwise the pat_index should have been converted from cache_level
> > -	 * so that the following comparison is valid.
> > -	 */
> > -	return obj->pat_index == i915_gem_get_pat_index(obj_to_i915(obj), lvl);
> > -}
> > -
> >  struct drm_i915_gem_object *i915_gem_object_alloc(void)
> >  {
> >  	struct drm_i915_gem_object *obj;
> > @@ -144,30 +117,72 @@ void __i915_gem_object_fini(struct drm_i915_gem_object *obj)
> >  	dma_resv_fini(&obj->base._resv);
> >  }
> >  
> > +bool i915_gem_object_has_cache_mode(const struct drm_i915_gem_object *obj,
> > +				    enum i915_cache_mode mode)
> > +{
> > +	struct drm_i915_private *i915 = obj_to_i915(obj);
> > +	i915_cache_t cache = INTEL_INFO(i915)->cache_modes[obj->pat_index];
> > +
> > +	return I915_CACHE_MODE(cache) == mode;
> > +}
> > +
> > +bool i915_gem_object_has_cache_flag(const struct drm_i915_gem_object *obj,
> > +				    unsigned int flag)
> > +{
> > +	struct drm_i915_private *i915 = obj_to_i915(obj);
> > +	i915_cache_t cache = INTEL_INFO(i915)->cache_modes[obj->pat_index];
> > +
> > +	return I915_CACHE_FLAGS(cache) & flag;
> > +}
> > +
> > +static void __i915_gem_object_update_coherency(struct drm_i915_gem_object *obj)
> > +{
> > +	struct drm_i915_private *i915 = obj_to_i915(obj);
> > +	i915_cache_t cache = INTEL_INFO(i915)->cache_modes[obj->pat_index];
> > +	const unsigned int flags = I915_CACHE_FLAGS(cache);
> > +	const unsigned int mode = I915_CACHE_MODE(cache);
> > +
> > +	if (mode == I915_CACHE_MODE_WC ||
> > +	    mode == I915_CACHE_MODE_WT ||
> > +	    (mode == I915_CACHE_MODE_WB && (flags & I915_CACHE_FLAG_COH2W)))

Shouldn't we only need 1W coherency here?  With 1-way coherency GPU
reads will snoop the CPU cache and GPU writes will invalidate the CPU
cache.  2-way only matters for how CPU reads/writes interact with the
GPU cache.


Matt

> > +		obj->cache_coherent = I915_BO_CACHE_COHERENT_FOR_READ |
> > +				      I915_BO_CACHE_COHERENT_FOR_WRITE;
> > +	else if (HAS_LLC(i915))
> > +		obj->cache_coherent = I915_BO_CACHE_COHERENT_FOR_READ;
> > +	else
> > +		obj->cache_coherent = 0;
> > +
> > +	obj->cache_dirty =
> > +		!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE) &&
> > +		!IS_DGFX(i915);
> > +}
> > +
> >  /**
> >   * i915_gem_object_set_cache_coherency - Mark up the object's coherency levels
> > - * for a given cache_level
> > + * for a given caching mode
> >   * @obj: #drm_i915_gem_object
> > - * @cache_level: cache level
> > + * @cache: cache mode
> >   */
> >  void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
> > -					 unsigned int cache_level)
> > +					 i915_cache_t cache)
> >  {
> > -	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> > +	struct drm_i915_private *i915 = obj_to_i915(obj);
> > +	int found;
> >  
> > -	obj->pat_index = i915_gem_get_pat_index(i915, cache_level);
> > +	found = i915_cache_find_pat(i915, cache);
> > +	if (found < 0) {
> > +		char buf[I915_CACHE_NAME_LEN];
> >  
> > -	if (cache_level != I915_CACHE_NONE)
> > -		obj->cache_coherent = (I915_BO_CACHE_COHERENT_FOR_READ |
> > -				       I915_BO_CACHE_COHERENT_FOR_WRITE);
> > -	else if (HAS_LLC(i915))
> > -		obj->cache_coherent = I915_BO_CACHE_COHERENT_FOR_READ;
> > -	else
> > -		obj->cache_coherent = 0;
> > +		i915_cache_print(buf, sizeof(buf), NULL, cache);
> > +		drm_err_ratelimited(&i915->drm, "Unknown cache mode %s!\n",
> > +				    buf);
> >  
> > -	obj->cache_dirty =
> > -		!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE) &&
> > -		!IS_DGFX(i915);
> > +		found = i915->pat_uc;
> > +	}
> > +
> > +	obj->pat_index = found;
> > +
> > +	__i915_gem_object_update_coherency(obj);
> >  }
> >  
> >  /**
> > @@ -181,24 +196,18 @@ void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
> >  void i915_gem_object_set_pat_index(struct drm_i915_gem_object *obj,
> >  				   unsigned int pat_index)
> >  {
> > -	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> > +	struct drm_i915_private *i915 = obj_to_i915(obj);
> >  
> >  	if (obj->pat_index == pat_index)
> >  		return;
> >  
> > +	if (drm_WARN_ON_ONCE(&i915->drm,
> > +			     pat_index > INTEL_INFO(i915)->max_pat_index))
> > +		return;
> > +
> >  	obj->pat_index = pat_index;
> >  
> > -	if (pat_index != i915_gem_get_pat_index(i915, I915_CACHE_NONE))
> > -		obj->cache_coherent = (I915_BO_CACHE_COHERENT_FOR_READ |
> > -				       I915_BO_CACHE_COHERENT_FOR_WRITE);
> > -	else if (HAS_LLC(i915))
> > -		obj->cache_coherent = I915_BO_CACHE_COHERENT_FOR_READ;
> > -	else
> > -		obj->cache_coherent = 0;
> > -
> > -	obj->cache_dirty =
> > -		!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE) &&
> > -		!IS_DGFX(i915);
> > +	__i915_gem_object_update_coherency(obj);
> >  }
> >  
> >  bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > index 884a17275b3a..a5d4ee19d9be 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > @@ -13,6 +13,7 @@
> >  
> >  #include "display/intel_frontbuffer.h"
> >  #include "intel_memory_region.h"
> > +#include "i915_cache.h"
> >  #include "i915_gem_object_types.h"
> >  #include "i915_gem_gtt.h"
> >  #include "i915_gem_ww.h"
> > @@ -32,10 +33,6 @@ static inline bool i915_gem_object_size_2big(u64 size)
> >  	return false;
> >  }
> >  
> > -unsigned int i915_gem_get_pat_index(struct drm_i915_private *i915,
> > -				    enum i915_cache_level level);
> > -bool i915_gem_object_has_cache_level(const struct drm_i915_gem_object *obj,
> > -				     enum i915_cache_level lvl);
> >  void i915_gem_init__objects(struct drm_i915_private *i915);
> >  
> >  void i915_objects_module_exit(void);
> > @@ -764,8 +761,12 @@ int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
> >  				      bool intr);
> >  bool i915_gem_object_has_unknown_state(struct drm_i915_gem_object *obj);
> >  
> > +bool i915_gem_object_has_cache_mode(const struct drm_i915_gem_object *obj,
> > +				    enum i915_cache_mode mode);
> > +bool i915_gem_object_has_cache_flag(const struct drm_i915_gem_object *obj,
> > +				    unsigned int flag);
> >  void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
> > -					 unsigned int cache_level);
> > +					 i915_cache_t cache);
> >  void i915_gem_object_set_pat_index(struct drm_i915_gem_object *obj,
> >  				   unsigned int pat_index);
> >  bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj);
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > index 8de2b91b3edf..6790e13ad262 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > @@ -14,6 +14,7 @@
> >  #include <uapi/drm/i915_drm.h>
> >  
> >  #include "i915_active.h"
> > +#include "i915_cache.h"
> >  #include "i915_selftest.h"
> >  #include "i915_vma_resource.h"
> >  
> > @@ -116,93 +117,6 @@ struct drm_i915_gem_object_ops {
> >  	const char *name; /* friendly name for debug, e.g. lockdep classes */
> >  };
> >  
> > -/**
> > - * enum i915_cache_level - The supported GTT caching values for system memory
> > - * pages.
> > - *
> > - * These translate to some special GTT PTE bits when binding pages into some
> > - * address space. It also determines whether an object, or rather its pages are
> > - * coherent with the GPU, when also reading or writing through the CPU cache
> > - * with those pages.
> > - *
> > - * Userspace can also control this through struct drm_i915_gem_caching.
> > - */
> > -enum i915_cache_level {
> > -	/**
> > -	 * @I915_CACHE_NONE:
> > -	 *
> > -	 * GPU access is not coherent with the CPU cache. If the cache is dirty
> > -	 * and we need the underlying pages to be coherent with some later GPU
> > -	 * access then we need to manually flush the pages.
> > -	 *
> > -	 * On shared LLC platforms reads and writes through the CPU cache are
> > -	 * still coherent even with this setting. See also
> > -	 * &drm_i915_gem_object.cache_coherent for more details. Due to this we
> > -	 * should only ever use uncached for scanout surfaces, otherwise we end
> > -	 * up over-flushing in some places.
> > -	 *
> > -	 * This is the default on non-LLC platforms.
> > -	 */
> > -	I915_CACHE_NONE = 0,
> > -	/**
> > -	 * @I915_CACHE_LLC:
> > -	 *
> > -	 * GPU access is coherent with the CPU cache. If the cache is dirty,
> > -	 * then the GPU will ensure that access remains coherent, when both
> > -	 * reading and writing through the CPU cache. GPU writes can dirty the
> > -	 * CPU cache.
> > -	 *
> > -	 * Not used for scanout surfaces.
> > -	 *
> > -	 * Applies to both platforms with shared LLC(HAS_LLC), and snooping
> > -	 * based platforms(HAS_SNOOP).
> > -	 *
> > -	 * This is the default on shared LLC platforms.  The only exception is
> > -	 * scanout objects, where the display engine is not coherent with the
> > -	 * CPU cache. For such objects I915_CACHE_NONE or I915_CACHE_WT is
> > -	 * automatically applied by the kernel in pin_for_display, if userspace
> > -	 * has not done so already.
> > -	 */
> > -	I915_CACHE_LLC,
> > -	/**
> > -	 * @I915_CACHE_L3_LLC:
> > -	 *
> > -	 * Explicitly enable the Gfx L3 cache, with coherent LLC.
> > -	 *
> > -	 * The Gfx L3 sits between the domain specific caches, e.g
> > -	 * sampler/render caches, and the larger LLC. LLC is coherent with the
> > -	 * GPU, but L3 is only visible to the GPU, so likely needs to be flushed
> > -	 * when the workload completes.
> > -	 *
> > -	 * Not used for scanout surfaces.
> > -	 *
> > -	 * Only exposed on some gen7 + GGTT. More recent hardware has dropped
> > -	 * this explicit setting, where it should now be enabled by default.
> > -	 */
> > -	I915_CACHE_L3_LLC,
> > -	/**
> > -	 * @I915_CACHE_WT:
> > -	 *
> > -	 * Write-through. Used for scanout surfaces.
> > -	 *
> > -	 * The GPU can utilise the caches, while still having the display engine
> > -	 * be coherent with GPU writes, as a result we don't need to flush the
> > -	 * CPU caches when moving out of the render domain. This is the default
> > -	 * setting chosen by the kernel, if supported by the HW, otherwise we
> > -	 * fallback to I915_CACHE_NONE. On the CPU side writes through the CPU
> > -	 * cache still need to be flushed, to remain coherent with the display
> > -	 * engine.
> > -	 */
> > -	I915_CACHE_WT,
> > -	/**
> > -	 * @I915_MAX_CACHE_LEVEL:
> > -	 *
> > -	 * Mark the last entry in the enum. Used for defining cachelevel_to_pat
> > -	 * array for cache_level to pat translation table.
> > -	 */
> > -	I915_MAX_CACHE_LEVEL,
> > -};
> > -
> >  enum i915_map_type {
> >  	I915_MAP_WB = 0,
> >  	I915_MAP_WC,
> > @@ -403,16 +317,6 @@ struct drm_i915_gem_object {
> >  	/**
> >  	 * @cache_coherent:
> >  	 *
> > -	 * Note: with the change above which replaced @cache_level with pat_index,
> > -	 * the use of @cache_coherent is limited to the objects created by kernel
> > -	 * or by userspace without pat index specified.
> > -	 * Check for @pat_set_by_user to find out if an object has pat index set
> > -	 * by userspace. The ioctl's to change cache settings have also been
> > -	 * disabled for the objects with pat index set by userspace. Please don't
> > -	 * assume @cache_coherent having the flags set as describe here. A helper
> > -	 * function i915_gem_object_has_cache_level() provides one way to bypass
> > -	 * the use of this field.
> > -	 *
> >  	 * Track whether the pages are coherent with the GPU if reading or
> >  	 * writing through the CPU caches. The largely depends on the
> >  	 * @cache_level setting.
> > @@ -447,7 +351,7 @@ struct drm_i915_gem_object {
> >  	 * flushing the surface just before doing the scanout.  This does mean
> >  	 * we might unnecessarily flush non-scanout objects in some places, but
> >  	 * the default assumption is that all normal objects should be using
> > -	 * I915_CACHE_LLC, at least on platforms with the shared LLC.
> > +	 * I915_CACHE_CACHED, at least on platforms with the shared LLC.
> >  	 *
> >  	 * Supported values:
> >  	 *
> > @@ -486,16 +390,6 @@ struct drm_i915_gem_object {
> >  	/**
> >  	 * @cache_dirty:
> >  	 *
> > -	 * Note: with the change above which replaced cache_level with pat_index,
> > -	 * the use of @cache_dirty is limited to the objects created by kernel
> > -	 * or by userspace without pat index specified.
> > -	 * Check for @pat_set_by_user to find out if an object has pat index set
> > -	 * by userspace. The ioctl's to change cache settings have also been
> > -	 * disabled for the objects with pat_index set by userspace. Please don't
> > -	 * assume @cache_dirty is set as describe here. Also see helper function
> > -	 * i915_gem_object_has_cache_level() for possible ways to bypass the use
> > -	 * of this field.
> > -	 *
> >  	 * Track if we are we dirty with writes through the CPU cache for this
> >  	 * object. As a result reading directly from main memory might yield
> >  	 * stale data.
> > @@ -531,9 +425,9 @@ struct drm_i915_gem_object {
> >  	 *
> >  	 *   1. All userspace objects, by default, have @cache_level set as
> >  	 *   I915_CACHE_NONE. The only exception is userptr objects, where we
> > -	 *   instead force I915_CACHE_LLC, but we also don't allow userspace to
> > -	 *   ever change the @cache_level for such objects. Another special case
> > -	 *   is dma-buf, which doesn't rely on @cache_dirty,  but there we
> > +	 *   instead force I915_CACHE_CACHED, but we also don't allow userspace
> > +	 *   to ever change the @cache_level for such objects. Another special
> > +	 *   case is dma-buf, which doesn't rely on @cache_dirty,  but there we
> >  	 *   always do a forced flush when acquiring the pages, if there is a
> >  	 *   chance that the pages can be read directly from main memory with
> >  	 *   the GPU.
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > index 8f1633c3fb93..aba908f0349f 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > @@ -584,7 +584,7 @@ static int shmem_object_init(struct intel_memory_region *mem,
> >  	static struct lock_class_key lock_class;
> >  	struct drm_i915_private *i915 = mem->i915;
> >  	struct address_space *mapping;
> > -	unsigned int cache_level;
> > +	i915_cache_t cache;
> >  	gfp_t mask;
> >  	int ret;
> >  
> > @@ -628,11 +628,11 @@ static int shmem_object_init(struct intel_memory_region *mem,
> >  		 * However, we maintain the display planes as UC, and so
> >  		 * need to rebind when first used as such.
> >  		 */
> > -		cache_level = I915_CACHE_LLC;
> > +		cache = I915_CACHE_CACHED;
> >  	else
> > -		cache_level = I915_CACHE_NONE;
> > +		cache = I915_CACHE_NONE;
> >  
> > -	i915_gem_object_set_cache_coherency(obj, cache_level);
> > +	i915_gem_object_set_cache_coherency(obj, cache);
> >  
> >  	i915_gem_object_init_memory_region(obj, mem);
> >  
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> > index 1c8eb806b7d3..cc907a1f1c53 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> > @@ -691,7 +691,7 @@ static int __i915_gem_object_create_stolen(struct intel_memory_region *mem,
> >  
> >  	obj->stolen = stolen;
> >  	obj->read_domains = I915_GEM_DOMAIN_CPU | I915_GEM_DOMAIN_GTT;
> > -	cache_level = HAS_LLC(mem->i915) ? I915_CACHE_LLC : I915_CACHE_NONE;
> > +	cache_level = HAS_LLC(mem->i915) ? I915_CACHE_CACHED : I915_CACHE_NONE;
> >  	i915_gem_object_set_cache_coherency(obj, cache_level);
> >  
> >  	if (WARN_ON(!i915_gem_object_trylock(obj, NULL)))
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> > index 6bd6c239f4ac..107176d1757b 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> > @@ -48,14 +48,14 @@ void i915_ttm_migrate_set_ban_memcpy(bool ban)
> >  }
> >  #endif
> >  
> > -static enum i915_cache_level
> > -i915_ttm_cache_level(struct drm_i915_private *i915, struct ttm_resource *res,
> > -		     struct ttm_tt *ttm)
> > +static i915_cache_t
> > +i915_ttm_cache(struct drm_i915_private *i915, struct ttm_resource *res,
> > +	       struct ttm_tt *ttm)
> >  {
> >  	return ((HAS_LLC(i915) || HAS_SNOOP(i915)) &&
> >  		!i915_ttm_gtt_binds_lmem(res) &&
> > -		ttm->caching == ttm_cached) ? I915_CACHE_LLC :
> > -		I915_CACHE_NONE;
> > +		ttm->caching == ttm_cached) ? I915_CACHE_CACHED :
> > +					      I915_CACHE_NONE;
> >  }
> >  
> >  static unsigned int
> > @@ -112,8 +112,8 @@ void i915_ttm_adjust_domains_after_move(struct drm_i915_gem_object *obj)
> >  void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
> >  {
> >  	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
> > -	unsigned int cache_level;
> >  	unsigned int mem_flags;
> > +	i915_cache_t cache;
> >  	unsigned int i;
> >  	int mem_type;
> >  
> > @@ -126,13 +126,13 @@ void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
> >  	if (!bo->resource) {
> >  		mem_flags = I915_BO_FLAG_STRUCT_PAGE;
> >  		mem_type = I915_PL_SYSTEM;
> > -		cache_level = I915_CACHE_NONE;
> > +		cache = I915_CACHE_NONE;
> >  	} else {
> >  		mem_flags = i915_ttm_cpu_maps_iomem(bo->resource) ? I915_BO_FLAG_IOMEM :
> >  			I915_BO_FLAG_STRUCT_PAGE;
> >  		mem_type = bo->resource->mem_type;
> > -		cache_level = i915_ttm_cache_level(to_i915(bo->base.dev), bo->resource,
> > -						   bo->ttm);
> > +		cache = i915_ttm_cache(to_i915(bo->base.dev), bo->resource,
> > +				       bo->ttm);
> >  	}
> >  
> >  	/*
> > @@ -157,7 +157,7 @@ void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
> >  	obj->mem_flags &= ~(I915_BO_FLAG_STRUCT_PAGE | I915_BO_FLAG_IOMEM);
> >  	obj->mem_flags |= mem_flags;
> >  
> > -	i915_gem_object_set_cache_coherency(obj, cache_level);
> > +	i915_gem_object_set_cache_coherency(obj, cache);
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> > index 1d3ebdf4069b..5d2891981bd4 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> > @@ -553,7 +553,7 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
> >  	obj->mem_flags = I915_BO_FLAG_STRUCT_PAGE;
> >  	obj->read_domains = I915_GEM_DOMAIN_CPU;
> >  	obj->write_domain = I915_GEM_DOMAIN_CPU;
> > -	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
> > +	i915_gem_object_set_cache_coherency(obj, I915_CACHE_CACHED);
> >  
> >  	obj->userptr.ptr = args->user_ptr;
> >  	obj->userptr.notifier_seq = ULONG_MAX;
> > diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c b/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c
> > index bac957755068..77d04be5e9d7 100644
> > --- a/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c
> > +++ b/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c
> > @@ -123,7 +123,7 @@ huge_gem_object(struct drm_i915_private *i915,
> >  
> >  	obj->read_domains = I915_GEM_DOMAIN_CPU;
> >  	obj->write_domain = I915_GEM_DOMAIN_CPU;
> > -	cache_level = HAS_LLC(i915) ? I915_CACHE_LLC : I915_CACHE_NONE;
> > +	cache_level = HAS_LLC(i915) ? I915_CACHE_CACHED : I915_CACHE_NONE;
> >  	i915_gem_object_set_cache_coherency(obj, cache_level);
> >  	obj->scratch = phys_size;
> >  
> > diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> > index 6bddd733d796..6ca5b9dbc414 100644
> > --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> > +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> > @@ -200,9 +200,10 @@ huge_pages_object(struct drm_i915_private *i915,
> >  	obj->write_domain = I915_GEM_DOMAIN_CPU;
> >  	obj->read_domains = I915_GEM_DOMAIN_CPU;
> >  
> > -	cache_level = HAS_LLC(i915) ? I915_CACHE_LLC : I915_CACHE_NONE;
> > +	cache_level = HAS_LLC(i915) ? I915_CACHE_CACHED : I915_CACHE_NONE;
> >  	i915_gem_object_set_cache_coherency(obj, cache_level);
> >  
> > +
> >  	obj->mm.page_mask = page_mask;
> >  
> >  	return obj;
> > diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> > index 675f71f06e89..3c93a73cf6b1 100644
> > --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> > +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> > @@ -16,11 +16,11 @@
> >  #include "intel_gtt.h"
> >  
> >  static u64 gen8_pde_encode(const dma_addr_t addr,
> > -			   const enum i915_cache_level level)
> > +			   const enum i915_cache_mode cache_mode)
> >  {
> >  	u64 pde = addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
> >  
> > -	if (level != I915_CACHE_NONE)
> > +	if (cache_mode != I915_CACHE_MODE_UC)
> >  		pde |= PPAT_CACHED_PDE;
> >  	else
> >  		pde |= PPAT_UNCACHED;
> > @@ -43,10 +43,10 @@ static u64 gen8_pte_encode(dma_addr_t addr,
> >  	 * See translation table defined by LEGACY_CACHELEVEL.
> >  	 */
> >  	switch (pat_index) {
> > -	case I915_CACHE_NONE:
> > +	case I915_CACHE_MODE_UC:
> >  		pte |= PPAT_UNCACHED;
> >  		break;
> > -	case I915_CACHE_WT:
> > +	case I915_CACHE_MODE_WT:
> >  		pte |= PPAT_DISPLAY_ELLC;
> >  		break;
> >  	default:
> > @@ -893,7 +893,7 @@ static int gen8_init_scratch(struct i915_address_space *vm)
> >  		}
> >  
> >  		fill_px(obj, vm->scratch[i - 1]->encode);
> > -		obj->encode = gen8_pde_encode(px_dma(obj), I915_CACHE_NONE);
> > +		obj->encode = gen8_pde_encode(px_dma(obj), I915_CACHE_MODE_UC);
> >  
> >  		vm->scratch[i] = obj;
> >  	}
> > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > index ee15486fed0d..f1e59e512d14 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > @@ -1103,7 +1103,7 @@ static int init_status_page(struct intel_engine_cs *engine)
> >  		return PTR_ERR(obj);
> >  	}
> >  
> > -	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
> > +	i915_gem_object_set_cache_coherency(obj, I915_CACHE_CACHED);
> >  
> >  	vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL);
> >  	if (IS_ERR(vma)) {
> > diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> > index fca61ddca8ad..ab5f654e7557 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> > @@ -1011,11 +1011,6 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
> >  	return ggtt_probe_common(ggtt, size);
> >  }
> >  
> > -/*
> > - * For pre-gen8 platforms pat_index is the same as enum i915_cache_level,
> > - * so the switch-case statements in these PTE encode functions are still valid.
> > - * See translation table LEGACY_CACHELEVEL.
> > - */
> >  static u64 snb_pte_encode(dma_addr_t addr,
> >  			  unsigned int pat_index,
> >  			  u32 flags)
> > @@ -1023,11 +1018,11 @@ static u64 snb_pte_encode(dma_addr_t addr,
> >  	gen6_pte_t pte = GEN6_PTE_ADDR_ENCODE(addr) | GEN6_PTE_VALID;
> >  
> >  	switch (pat_index) {
> > -	case I915_CACHE_L3_LLC:
> > -	case I915_CACHE_LLC:
> > +	case I915_CACHE_MODE_WB:
> > +	case __I915_CACHE_MODE_WB_L3:
> >  		pte |= GEN6_PTE_CACHE_LLC;
> >  		break;
> > -	case I915_CACHE_NONE:
> > +	case I915_CACHE_MODE_UC:
> >  		pte |= GEN6_PTE_UNCACHED;
> >  		break;
> >  	default:
> > @@ -1044,13 +1039,13 @@ static u64 ivb_pte_encode(dma_addr_t addr,
> >  	gen6_pte_t pte = GEN6_PTE_ADDR_ENCODE(addr) | GEN6_PTE_VALID;
> >  
> >  	switch (pat_index) {
> > -	case I915_CACHE_L3_LLC:
> > +	case __I915_CACHE_MODE_WB_L3:
> >  		pte |= GEN7_PTE_CACHE_L3_LLC;
> >  		break;
> > -	case I915_CACHE_LLC:
> > +	case I915_CACHE_MODE_WB:
> >  		pte |= GEN6_PTE_CACHE_LLC;
> >  		break;
> > -	case I915_CACHE_NONE:
> > +	case I915_CACHE_MODE_UC:
> >  		pte |= GEN6_PTE_UNCACHED;
> >  		break;
> >  	default:
> > @@ -1069,7 +1064,7 @@ static u64 byt_pte_encode(dma_addr_t addr,
> >  	if (!(flags & PTE_READ_ONLY))
> >  		pte |= BYT_PTE_WRITEABLE;
> >  
> > -	if (pat_index != I915_CACHE_NONE)
> > +	if (pat_index != I915_CACHE_MODE_UC)
> >  		pte |= BYT_PTE_SNOOPED_BY_CPU_CACHES;
> >  
> >  	return pte;
> > @@ -1081,7 +1076,7 @@ static u64 hsw_pte_encode(dma_addr_t addr,
> >  {
> >  	gen6_pte_t pte = HSW_PTE_ADDR_ENCODE(addr) | GEN6_PTE_VALID;
> >  
> > -	if (pat_index != I915_CACHE_NONE)
> > +	if (pat_index != I915_CACHE_MODE_UC)
> >  		pte |= HSW_WB_LLC_AGE3;
> >  
> >  	return pte;
> > @@ -1094,9 +1089,9 @@ static u64 iris_pte_encode(dma_addr_t addr,
> >  	gen6_pte_t pte = HSW_PTE_ADDR_ENCODE(addr) | GEN6_PTE_VALID;
> >  
> >  	switch (pat_index) {
> > -	case I915_CACHE_NONE:
> > +	case I915_CACHE_MODE_UC:
> >  		break;
> > -	case I915_CACHE_WT:
> > +	case I915_CACHE_MODE_WT:
> >  		pte |= HSW_WT_ELLC_LLC_AGE3;
> >  		break;
> >  	default:
> > diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c b/drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c
> > index 866c416afb73..803c41ac4ccb 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c
> > @@ -21,7 +21,7 @@ static void gmch_ggtt_insert_page(struct i915_address_space *vm,
> >  				  unsigned int pat_index,
> >  				  u32 unused)
> >  {
> > -	unsigned int flags = (pat_index == I915_CACHE_NONE) ?
> > +	unsigned int flags = (pat_index == I915_CACHE_MODE_UC) ?
> >  		AGP_USER_MEMORY : AGP_USER_CACHED_MEMORY;
> >  
> >  	intel_gmch_gtt_insert_page(addr, offset >> PAGE_SHIFT, flags);
> > @@ -32,7 +32,7 @@ static void gmch_ggtt_insert_entries(struct i915_address_space *vm,
> >  				     unsigned int pat_index,
> >  				     u32 unused)
> >  {
> > -	unsigned int flags = (pat_index == I915_CACHE_NONE) ?
> > +	unsigned int flags = (pat_index == I915_CACHE_MODE_UC) ?
> >  		AGP_USER_MEMORY : AGP_USER_CACHED_MEMORY;
> >  
> >  	intel_gmch_gtt_insert_sg_entries(vma_res->bi.pages, vma_res->start >> PAGE_SHIFT,
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> > index 065099362a98..48055304537a 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> > @@ -676,7 +676,7 @@ __vm_create_scratch_for_read(struct i915_address_space *vm, unsigned long size)
> >  	if (IS_ERR(obj))
> >  		return ERR_CAST(obj);
> >  
> > -	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
> > +	i915_gem_object_set_cache_coherency(obj, I915_CACHE_CACHED);
> >  
> >  	vma = i915_vma_instance(obj, vm, NULL);
> >  	if (IS_ERR(vma)) {
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> > index 7192a534a654..af4277c1d577 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> > @@ -636,7 +636,8 @@ void
> >  __set_pd_entry(struct i915_page_directory * const pd,
> >  	       const unsigned short idx,
> >  	       struct i915_page_table *pt,
> > -	       u64 (*encode)(const dma_addr_t, const enum i915_cache_level));
> > +	       u64 (*encode)(const dma_addr_t,
> > +			     const enum i915_cache_mode cache_mode));
> >  
> >  #define set_pd_entry(pd, idx, to) \
> >  	__set_pd_entry((pd), (idx), px_pt(to), gen8_pde_encode)
> > diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
> > index 436756bfbb1a..3e461d4f3693 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
> > @@ -98,14 +98,16 @@ void
> >  __set_pd_entry(struct i915_page_directory * const pd,
> >  	       const unsigned short idx,
> >  	       struct i915_page_table * const to,
> > -	       u64 (*encode)(const dma_addr_t, const enum i915_cache_level))
> > +	       u64 (*encode)(const dma_addr_t,
> > +			     const enum i915_cache_mode cache_mode))
> >  {
> >  	/* Each thread pre-pins the pd, and we may have a thread per pde. */
> >  	GEM_BUG_ON(atomic_read(px_used(pd)) > NALLOC * I915_PDES);
> >  
> >  	atomic_inc(px_used(pd));
> >  	pd->entry[idx] = to;
> > -	write_dma_entry(px_base(pd), idx, encode(px_dma(to), I915_CACHE_LLC));
> > +	write_dma_entry(px_base(pd), idx,
> > +			encode(px_dma(to), I915_CACHE_MODE_WB));
> >  }
> >  
> >  void
> > diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> > index 92085ffd23de..9131d228d285 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> > @@ -551,7 +551,9 @@ alloc_context_vma(struct intel_engine_cs *engine)
> >  	 * later platforms don't have L3 control bits in the PTE.
> >  	 */
> >  	if (IS_IVYBRIDGE(i915))
> > -		i915_gem_object_set_cache_coherency(obj, I915_CACHE_L3_LLC);
> > +		i915_gem_object_set_cache_coherency(obj,
> > +						    I915_CACHE_CACHED |
> > +						    __I915_CACHE_FLAG(L3));
> >  
> >  	vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL);
> >  	if (IS_ERR(vma)) {
> > diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
> > index b9640212d659..025ce54c886d 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_timeline.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
> > @@ -26,7 +26,7 @@ static struct i915_vma *hwsp_alloc(struct intel_gt *gt)
> >  	if (IS_ERR(obj))
> >  		return ERR_CAST(obj);
> >  
> > -	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
> > +	i915_gem_object_set_cache_coherency(obj, I915_CACHE_CACHED);
> >  
> >  	vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
> >  	if (IS_ERR(vma))
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> > index 8b0d84f2aad2..fc278fa463b0 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> > @@ -64,7 +64,7 @@ static int hang_init(struct hang *h, struct intel_gt *gt)
> >  		goto err_hws;
> >  	}
> >  
> > -	i915_gem_object_set_cache_coherency(h->hws, I915_CACHE_LLC);
> > +	i915_gem_object_set_cache_coherency(h->hws, I915_CACHE_CACHED);
> >  	vaddr = i915_gem_object_pin_map_unlocked(h->hws, I915_MAP_WB);
> >  	if (IS_ERR(vaddr)) {
> >  		err = PTR_ERR(vaddr);
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> > index 14a8b25b6204..d25990d33d44 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> > @@ -111,7 +111,7 @@ read_nonprivs(struct intel_context *ce)
> >  	if (IS_ERR(result))
> >  		return result;
> >  
> > -	i915_gem_object_set_cache_coherency(result, I915_CACHE_LLC);
> > +	i915_gem_object_set_cache_coherency(result, I915_CACHE_CACHED);
> >  
> >  	cs = i915_gem_object_pin_map_unlocked(result, I915_MAP_WB);
> >  	if (IS_ERR(cs)) {
> > diff --git a/drivers/gpu/drm/i915/i915_cache.c b/drivers/gpu/drm/i915/i915_cache.c
> > index 06eb5933c719..f4ba1cb430d3 100644
> > --- a/drivers/gpu/drm/i915/i915_cache.c
> > +++ b/drivers/gpu/drm/i915/i915_cache.c
> > @@ -6,13 +6,88 @@
> >  #include "i915_cache.h"
> >  #include "i915_drv.h"
> >  
> > -void i915_cache_init(struct drm_i915_private *i915)
> > +int i915_cache_init(struct drm_i915_private *i915)
> >  {
> > -	i915->pat_uc = i915_gem_get_pat_index(i915, I915_CACHE_NONE);
> > -	drm_info(&i915->drm, "Using PAT index %u for uncached access\n",
> > -		 i915->pat_uc);
> > +	int ret;
> >  
> > -	i915->pat_wb = i915_gem_get_pat_index(i915, I915_CACHE_LLC);
> > -	drm_info(&i915->drm, "Using PAT index %u for write-back access\n",
> > -		 i915->pat_wb);
> > +	ret = i915_cache_find_pat(i915, I915_CACHE_NONE);
> > +	if (ret < 0) {
> > +		drm_err(&i915->drm,
> > +			"Failed to find PAT index for uncached access\n");
> > +		return -ENODEV;
> > +	}
> > +	drm_info(&i915->drm, "Using PAT index %u for uncached access\n", ret);
> > +	i915->pat_uc = ret;
> > +
> > +	ret = i915_cache_find_pat(i915, I915_CACHE_CACHED);
> > +	if (ret < 0) {
> > +		drm_err(&i915->drm,
> > +			"Failed to find PAT index for write-back access\n");
> > +		return -ENODEV;
> > +	}
> > +	drm_info(&i915->drm, "Using PAT index %u for write-back access\n", ret);
> > +	i915->pat_wb = ret;
> > +
> > +	return 0;
> > +}
> > +
> > +int i915_cache_find_pat(struct drm_i915_private *i915, i915_cache_t cache)
> > +{
> > +	const struct intel_device_info *info = INTEL_INFO(i915);
> > +	int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(info->cache_modes); i++) {
> > +		if (info->cache_modes[i] == cache)
> > +			return i;
> > +	}
> > +
> > +	return -1;
> > +}
> > +
> > +void i915_cache_print(char *buf, size_t buflen, const char *suffix,
> > +		      i915_cache_t cache)
> > +{
> > +	const enum i915_cache_mode mode = I915_CACHE_MODE(cache);
> > +	static const char * const mode_str[] = {
> > +		[I915_CACHE_MODE_UC] = "UC",
> > +		[I915_CACHE_MODE_WB] = "WB",
> > +		[I915_CACHE_MODE_WT] = "WT",
> > +		[I915_CACHE_MODE_WC] = "WC",
> > +	};
> > +	static const char * const flag_str[] = {
> > +		[ilog2(I915_CACHE_FLAG_COH1W)] = "1-Way-Coherent",
> > +		[ilog2(I915_CACHE_FLAG_COH2W)] = "2-Way-Coherent",
> > +		[ilog2(I915_CACHE_FLAG_L3)] =    "L3",
> > +		[ilog2(I915_CACHE_FLAG_CLOS1)] = "CLOS1",
> > +		[ilog2(I915_CACHE_FLAG_CLOS2)] = "CLOS2",
> > +	};
> > +
> > +	if (mode > ARRAY_SIZE(mode_str)) {
> > +		snprintf(buf, buflen, "0x%x%s", cache, suffix ?: "");
> > +	} else {
> > +		unsigned long flags = I915_CACHE_FLAGS(cache);
> > +		unsigned long bit;
> > +		int ret;
> > +
> > +		ret = snprintf(buf, buflen, "%s", mode_str[mode]);
> > +		buf += ret;
> > +		buflen -= ret;
> > +
> > +		/*
> > +		 * Don't print "1-way-2-way", it would be confusing and 2-way
> > +		 * implies 1-way anyway.
> > +		 */
> > +		if ((flags & (I915_CACHE_FLAG_COH1W | I915_CACHE_FLAG_COH2W)) ==
> > +		    (I915_CACHE_FLAG_COH1W | I915_CACHE_FLAG_COH2W))
> > +			flags &= ~I915_CACHE_FLAG_COH1W;
> > +
> > +		for_each_set_bit(bit, &flags, BITS_PER_TYPE(i915_cache_t)) {
> > +			ret = snprintf(buf, buflen, "-%s", flag_str[bit]);
> > +			buf += ret;
> > +			buflen -= ret;
> > +		}
> > +
> > +		if (suffix)
> > +			snprintf(buf, buflen, "%s", suffix);
> > +	}
> >  }
> > diff --git a/drivers/gpu/drm/i915/i915_cache.h b/drivers/gpu/drm/i915/i915_cache.h
> > index cb68936fb8a2..d9e97318b942 100644
> > --- a/drivers/gpu/drm/i915/i915_cache.h
> > +++ b/drivers/gpu/drm/i915/i915_cache.h
> > @@ -6,8 +6,76 @@
> >  #ifndef __I915_CACHE_H__
> >  #define __I915_CACHE_H__
> >  
> > +#include <linux/types.h>
> > +
> > +struct drm_printer;
> > +
> >  struct drm_i915_private;
> >  
> > -void i915_cache_init(struct drm_i915_private *i915);
> > +typedef u16 i915_cache_t;
> > +
> > +/* Cache modes */
> > +enum i915_cache_mode {
> > +	I915_CACHE_MODE_UC = 0,
> > +	I915_CACHE_MODE_WB,
> > +	__I915_CACHE_MODE_WB_L3, /* Special do-not-use entry for legacy 1:1 mapping. */
> > +	I915_CACHE_MODE_WT,
> > +	I915_CACHE_MODE_WC,
> > +	I915_NUM_CACHE_MODES
> > +};
> > +
> > +/* Cache mode flag bits */
> > +#define I915_CACHE_FLAG_COH1W	(0x1)
> > +#define I915_CACHE_FLAG_COH2W	(0x2) /* 1-way needs to be set too. */
> > +#define I915_CACHE_FLAG_L3	(0x4)
> > +#define I915_CACHE_FLAG_CLOS1	(0x8)
> > +#define I915_CACHE_FLAG_CLOS2	(0x10)
> > +
> > +/*
> > + * Overloaded I915_CACHE() macro based on:
> > + *  https://stackoverflow.com/questions/3046889/optional-parameters-with-c-macros
> > + *
> > + * It is possible to call I915_CACHE with mode and zero or more flags as
> > + * separate arguments. Ie these all work:
> > + *
> > + *   I915_CACHE(WB)
> > + *   I915_CACHE(WB, COH1W, COH2W)
> > + *   I915_CACHE(WB, COH1W, COH2W, L3)
> > + */
> > +
> > +#define __I915_CACHE_FLAG(f) (I915_CACHE_FLAG_##f << 8)
> > +#define __I915_CACHE(m, f) ((i915_cache_t)(I915_CACHE_MODE_##m | (f)))
> > +
> > +#define I915_CACHE_4(m, f1, f2, f3)	__I915_CACHE(m, __I915_CACHE_FLAG(f1) | __I915_CACHE_FLAG(f2) | __I915_CACHE_FLAG(f3))
> > +#define I915_CACHE_3(m, f1, f2)		__I915_CACHE(m, __I915_CACHE_FLAG(f1) | __I915_CACHE_FLAG(f2))
> > +#define I915_CACHE_2(m, f1)		__I915_CACHE(m, __I915_CACHE_FLAG(f1))
> > +#define I915_CACHE_1(m)			__I915_CACHE(m, 0)
> > +#define I915_CACHE_0(m)			__I915_CACHE(WC, 0)
> > +
> > +#define FUNC_CHOOSER(_f1, _f2, _f3, _f4, _f5, ...) _f5
> > +#define FUNC_RECOMPOSER(argsWithParentheses) FUNC_CHOOSER argsWithParentheses
> > +#define CHOOSE_FROM_ARG_COUNT(...) FUNC_RECOMPOSER((__VA_ARGS__, I915_CACHE_4, I915_CACHE_3, I915_CACHE_2, I915_CACHE_1, ))
> > +#define NO_ARG_EXPANDER() ,,,I915_CACHE_0
> > +#define MACRO_CHOOSER(...) CHOOSE_FROM_ARG_COUNT(NO_ARG_EXPANDER __VA_ARGS__ ())
> > +
> > +#define I915_CACHE(...) MACRO_CHOOSER(__VA_ARGS__)(__VA_ARGS__)
> > +
> > +/* i915_cache_t mode and flags extraction helpers. */
> > +#define I915_CACHE_MODE(cache) \
> > +	((enum i915_cache_mode)(((i915_cache_t)(cache)) & 0xff))
> > +#define I915_CACHE_FLAGS(cache) \
> > +	((unsigned int)((((i915_cache_t)(cache) & 0xff00)) >> 8))
> > +
> > +/* Helpers for i915 caching modes. */
> > +#define I915_CACHE_NONE		I915_CACHE(UC)
> > +#define I915_CACHE_CACHED	I915_CACHE(WB, COH1W, COH2W)
> > +#define I915_CACHE_WT		I915_CACHE(WT)
> > +
> > +int i915_cache_init(struct drm_i915_private *i915);
> > +int i915_cache_find_pat(struct drm_i915_private *i915, i915_cache_t cache);
> > +void i915_cache_print(char *buf, size_t buflen, const char *suffix,
> > +		      i915_cache_t cache);
> > +
> > +#define I915_CACHE_NAME_LEN (40)
> >  
> >  #endif /* __I915_CACHE_H__ */
> > diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> > index 4de44cf1026d..4ec292011546 100644
> > --- a/drivers/gpu/drm/i915/i915_debugfs.c
> > +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> > @@ -140,57 +140,18 @@ static const char *stringify_vma_type(const struct i915_vma *vma)
> >  	return "ppgtt";
> >  }
> >  
> > -static const char *i915_cache_level_str(struct drm_i915_gem_object *obj)
> > -{
> > -	struct drm_i915_private *i915 = obj_to_i915(obj);
> > -
> > -	if (IS_METEORLAKE(i915)) {
> > -		switch (obj->pat_index) {
> > -		case 0: return " WB";
> > -		case 1: return " WT";
> > -		case 2: return " UC";
> > -		case 3: return " WB (1-Way Coh)";
> > -		case 4: return " WB (2-Way Coh)";
> > -		default: return " not defined";
> > -		}
> > -	} else if (IS_PONTEVECCHIO(i915)) {
> > -		switch (obj->pat_index) {
> > -		case 0: return " UC";
> > -		case 1: return " WC";
> > -		case 2: return " WT";
> > -		case 3: return " WB";
> > -		case 4: return " WT (CLOS1)";
> > -		case 5: return " WB (CLOS1)";
> > -		case 6: return " WT (CLOS2)";
> > -		case 7: return " WT (CLOS2)";
> > -		default: return " not defined";
> > -		}
> > -	} else if (GRAPHICS_VER(i915) >= 12) {
> > -		switch (obj->pat_index) {
> > -		case 0: return " WB";
> > -		case 1: return " WC";
> > -		case 2: return " WT";
> > -		case 3: return " UC";
> > -		default: return " not defined";
> > -		}
> > -	} else {
> > -		switch (obj->pat_index) {
> > -		case 0: return " UC";
> > -		case 1: return HAS_LLC(i915) ?
> > -			       " LLC" : " snooped";
> > -		case 2: return " L3+LLC";
> > -		case 3: return " WT";
> > -		default: return " not defined";
> > -		}
> > -	}
> > -}
> > -
> >  void
> >  i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
> >  {
> > +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> > +	char buf[I915_CACHE_NAME_LEN];
> >  	struct i915_vma *vma;
> >  	int pin_count = 0;
> >  
> > +	i915_cache_print(buf, sizeof(buf),
> > +			 obj->pat_set_by_user ? "!" : NULL,
> > +			 INTEL_INFO(i915)->cache_modes[obj->pat_index]);
> > +
> >  	seq_printf(m, "%pK: %c%c%c %8zdKiB %02x %02x %s%s%s",
> >  		   &obj->base,
> >  		   get_tiling_flag(obj),
> > @@ -199,7 +160,7 @@ i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
> >  		   obj->base.size / 1024,
> >  		   obj->read_domains,
> >  		   obj->write_domain,
> > -		   i915_cache_level_str(obj),
> > +		   buf,
> >  		   obj->mm.dirty ? " dirty" : "",
> >  		   obj->mm.madv == I915_MADV_DONTNEED ? " purgeable" : "");
> >  	if (obj->base.name)
> > diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> > index bb2223cc3470..8663388a524f 100644
> > --- a/drivers/gpu/drm/i915/i915_driver.c
> > +++ b/drivers/gpu/drm/i915/i915_driver.c
> > @@ -241,7 +241,9 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
> >  	i915_memcpy_init_early(dev_priv);
> >  	intel_runtime_pm_init_early(&dev_priv->runtime_pm);
> >  
> > -	i915_cache_init(dev_priv);
> > +	ret = i915_cache_init(dev_priv);
> > +	if (ret < 0)
> > +		return ret;
> >  
> >  	ret = i915_workqueues_init(dev_priv);
> >  	if (ret < 0)
> > diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> > index 896aa48ed089..814705cfeb12 100644
> > --- a/drivers/gpu/drm/i915/i915_gem.c
> > +++ b/drivers/gpu/drm/i915/i915_gem.c
> > @@ -1144,19 +1144,6 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
> >  	unsigned int i;
> >  	int ret;
> >  
> > -	/*
> > -	 * In the proccess of replacing cache_level with pat_index a tricky
> > -	 * dependency is created on the definition of the enum i915_cache_level.
> > -	 * in case this enum is changed, PTE encode would be broken.
> > -	 * Add a WARNING here. And remove when we completely quit using this
> > -	 * enum
> > -	 */
> > -	BUILD_BUG_ON(I915_CACHE_NONE != 0 ||
> > -		     I915_CACHE_LLC != 1 ||
> > -		     I915_CACHE_L3_LLC != 2 ||
> > -		     I915_CACHE_WT != 3 ||
> > -		     I915_MAX_CACHE_LEVEL != 4);
> > -
> >  	/* We need to fallback to 4K pages if host doesn't support huge gtt. */
> >  	if (intel_vgpu_active(dev_priv) && !intel_vgpu_has_huge_gtt(dev_priv))
> >  		RUNTIME_INFO(dev_priv)->page_sizes = I915_GTT_PAGE_SIZE_4K;
> > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> > index fcacdc21643c..565a60a1645d 100644
> > --- a/drivers/gpu/drm/i915/i915_pci.c
> > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > @@ -32,6 +32,7 @@
> >  #include "gt/intel_sa_media.h"
> >  #include "gem/i915_gem_object_types.h"
> >  
> > +#include "i915_cache.h"
> >  #include "i915_driver.h"
> >  #include "i915_drv.h"
> >  #include "i915_pci.h"
> > @@ -43,36 +44,43 @@
> >  	.__runtime.graphics.ip.ver = (x), \
> >  	.__runtime.media.ip.ver = (x)
> >  
> > -#define LEGACY_CACHELEVEL \
> > -	.cachelevel_to_pat = { \
> > -		[I915_CACHE_NONE]   = 0, \
> > -		[I915_CACHE_LLC]    = 1, \
> > -		[I915_CACHE_L3_LLC] = 2, \
> > -		[I915_CACHE_WT]     = 3, \
> > +#define LEGACY_CACHE_MODES \
> > +	.cache_modes = { \
> > +		[I915_CACHE_MODE_UC] 	  = I915_CACHE(UC), \
> > +		[I915_CACHE_MODE_WB] 	  = I915_CACHE(WB, COH1W, COH2W), \
> 
> Reading bspec 2863 (bdw) indicates that the CPU being able to snoop the
> GPU's L3 was a new feature in gen8.  So for HSW and earlier, any
> coherency was only 1-way (GPU could be coherent with CPU's caches, but
> not vice-versa).  Only starting with gen8 did we get 2-way coherency as
> an option where the CPU would also be coherent with the GPU cache (and
> with gen8 and beyond you could still select 1-way instead of 2-way
> coherency with instruction-level granularity via MOCS).  There are also
> some legacy platforms (e.g., EHL/JSL on bspec 13948) where the IA wasn't
> coherent with GPU L3 so we were back to 1-way coherency.
> 
> So should we split LEGACY_CACHE_MODES into two tables with different
> coherency settings attached to I915_CACHE_MODE_WB?
> 
> > +		[__I915_CACHE_MODE_WB_L3] = I915_CACHE(WB, COH1W, COH2W, L3), \
> > +		[I915_CACHE_MODE_WT] 	  = I915_CACHE(WT), \
> >  	}
> >  
> > -#define TGL_CACHELEVEL \
> > -	.cachelevel_to_pat = { \
> > -		[I915_CACHE_NONE]   = 3, \
> > -		[I915_CACHE_LLC]    = 0, \
> > -		[I915_CACHE_L3_LLC] = 0, \
> > -		[I915_CACHE_WT]     = 2, \
> > +#define GEN12_CACHE_MODES \
> > +	.cache_modes = { \
> > +		[0] = I915_CACHE(WB, COH1W, COH2W), \
> > +		[1] = I915_CACHE(WC), \
> > +		[2] = I915_CACHE(WT), \
> > +		[3] = I915_CACHE(UC), \
> >  	}
> >  
> > -#define PVC_CACHELEVEL \
> > -	.cachelevel_to_pat = { \
> > -		[I915_CACHE_NONE]   = 0, \
> > -		[I915_CACHE_LLC]    = 3, \
> > -		[I915_CACHE_L3_LLC] = 3, \
> > -		[I915_CACHE_WT]     = 2, \
> > +/* FIXME is 1-way or 2-way for 3, 5, 7 */
> > +
> > +#define PVC_CACHE_MODES \
> > +	.cache_modes = { \
> > +		[0] = I915_CACHE(UC), \
> > +		[1] = I915_CACHE(WC), \
> > +		[2] = I915_CACHE(WT), \
> > +		[3] = I915_CACHE(WB, COH1W), \
> > +		[4] = I915_CACHE(WT, CLOS1), \
> > +		[5] = I915_CACHE(WB, COH1W, CLOS1), \
> > +		[6] = I915_CACHE(WT, CLOS2), \
> > +		[7] = I915_CACHE(WB, COH1W, CLOS2), \
> >  	}
> >  
> > -#define MTL_CACHELEVEL \
> > -	.cachelevel_to_pat = { \
> > -		[I915_CACHE_NONE]   = 2, \
> > -		[I915_CACHE_LLC]    = 3, \
> > -		[I915_CACHE_L3_LLC] = 3, \
> > -		[I915_CACHE_WT]     = 1, \
> > +#define MTL_CACHE_MODES \
> > +	.cache_modes = { \
> > +		[0] = I915_CACHE(WB), \
> > +		[1] = I915_CACHE(WT), \
> > +		[2] = I915_CACHE(UC), \
> > +		[3] = I915_CACHE(WB, COH1W), \
> > +		[4] = I915_CACHE(WB, COH1W, COH2W), \
> 
> We may want a comment on this one since the "2W" part is sort of a lie.
> Bspec 63884 has a programming note for MTL that says
> 
>         "...Except for system atomics, setting Coherency Mode to 10 or
>         11 results in this same one-way coherenct behavior..."
> 
> So if we ask for 2W, we actually only get 1W behavior except in a very
> narrow set of cases.
> 
> 
> Matt
> 
> >  	}
> >  
> >  /* Keep in gen based order, and chronological order within a gen */
> > @@ -97,7 +105,7 @@
> >  	.max_pat_index = 3, \
> >  	GEN_DEFAULT_PAGE_SIZES, \
> >  	GEN_DEFAULT_REGIONS, \
> > -	LEGACY_CACHELEVEL
> > +	LEGACY_CACHE_MODES
> >  
> >  #define I845_FEATURES \
> >  	GEN(2), \
> > @@ -112,7 +120,7 @@
> >  	.max_pat_index = 3, \
> >  	GEN_DEFAULT_PAGE_SIZES, \
> >  	GEN_DEFAULT_REGIONS, \
> > -	LEGACY_CACHELEVEL
> > +	LEGACY_CACHE_MODES
> >  
> >  static const struct intel_device_info i830_info = {
> >  	I830_FEATURES,
> > @@ -145,7 +153,7 @@ static const struct intel_device_info i865g_info = {
> >  	.max_pat_index = 3, \
> >  	GEN_DEFAULT_PAGE_SIZES, \
> >  	GEN_DEFAULT_REGIONS, \
> > -	LEGACY_CACHELEVEL
> > +	LEGACY_CACHE_MODES
> >  
> >  static const struct intel_device_info i915g_info = {
> >  	GEN3_FEATURES,
> > @@ -208,7 +216,7 @@ static const struct intel_device_info pnv_m_info = {
> >  	.max_pat_index = 3, \
> >  	GEN_DEFAULT_PAGE_SIZES, \
> >  	GEN_DEFAULT_REGIONS, \
> > -	LEGACY_CACHELEVEL
> > +	LEGACY_CACHE_MODES
> >  
> >  static const struct intel_device_info i965g_info = {
> >  	GEN4_FEATURES,
> > @@ -252,7 +260,7 @@ static const struct intel_device_info gm45_info = {
> >  	.max_pat_index = 3, \
> >  	GEN_DEFAULT_PAGE_SIZES, \
> >  	GEN_DEFAULT_REGIONS, \
> > -	LEGACY_CACHELEVEL
> > +	LEGACY_CACHE_MODES
> >  
> >  static const struct intel_device_info ilk_d_info = {
> >  	GEN5_FEATURES,
> > @@ -282,7 +290,7 @@ static const struct intel_device_info ilk_m_info = {
> >  	.__runtime.ppgtt_size = 31, \
> >  	GEN_DEFAULT_PAGE_SIZES, \
> >  	GEN_DEFAULT_REGIONS, \
> > -	LEGACY_CACHELEVEL
> > +	LEGACY_CACHE_MODES
> >  
> >  #define SNB_D_PLATFORM \
> >  	GEN6_FEATURES, \
> > @@ -330,7 +338,7 @@ static const struct intel_device_info snb_m_gt2_info = {
> >  	.__runtime.ppgtt_size = 31, \
> >  	GEN_DEFAULT_PAGE_SIZES, \
> >  	GEN_DEFAULT_REGIONS, \
> > -	LEGACY_CACHELEVEL
> > +	LEGACY_CACHE_MODES
> >  
> >  #define IVB_D_PLATFORM \
> >  	GEN7_FEATURES, \
> > @@ -387,7 +395,7 @@ static const struct intel_device_info vlv_info = {
> >  	.platform_engine_mask = BIT(RCS0) | BIT(VCS0) | BIT(BCS0),
> >  	GEN_DEFAULT_PAGE_SIZES,
> >  	GEN_DEFAULT_REGIONS,
> > -	LEGACY_CACHELEVEL,
> > +	LEGACY_CACHE_MODES
> >  };
> >  
> >  #define G75_FEATURES  \
> > @@ -473,7 +481,7 @@ static const struct intel_device_info chv_info = {
> >  	.has_coherent_ggtt = false,
> >  	GEN_DEFAULT_PAGE_SIZES,
> >  	GEN_DEFAULT_REGIONS,
> > -	LEGACY_CACHELEVEL,
> > +	LEGACY_CACHE_MODES
> >  };
> >  
> >  #define GEN9_DEFAULT_PAGE_SIZES \
> > @@ -536,7 +544,7 @@ static const struct intel_device_info skl_gt4_info = {
> >  	.max_pat_index = 3, \
> >  	GEN9_DEFAULT_PAGE_SIZES, \
> >  	GEN_DEFAULT_REGIONS, \
> > -	LEGACY_CACHELEVEL
> > +	LEGACY_CACHE_MODES
> >  
> >  static const struct intel_device_info bxt_info = {
> >  	GEN9_LP_FEATURES,
> > @@ -640,7 +648,7 @@ static const struct intel_device_info jsl_info = {
> >  #define GEN12_FEATURES \
> >  	GEN11_FEATURES, \
> >  	GEN(12), \
> > -	TGL_CACHELEVEL, \
> > +	GEN12_CACHE_MODES, \
> >  	.has_global_mocs = 1, \
> >  	.has_pxp = 1, \
> >  	.max_pat_index = 3
> > @@ -708,7 +716,7 @@ static const struct intel_device_info adl_p_info = {
> >  	.__runtime.graphics.ip.ver = 12, \
> >  	.__runtime.graphics.ip.rel = 50, \
> >  	XE_HP_PAGE_SIZES, \
> > -	TGL_CACHELEVEL, \
> > +	GEN12_CACHE_MODES, \
> >  	.dma_mask_size = 46, \
> >  	.has_3d_pipeline = 1, \
> >  	.has_64bit_reloc = 1, \
> > @@ -803,7 +811,7 @@ static const struct intel_device_info pvc_info = {
> >  		BIT(VCS0) |
> >  		BIT(CCS0) | BIT(CCS1) | BIT(CCS2) | BIT(CCS3),
> >  	.require_force_probe = 1,
> > -	PVC_CACHELEVEL,
> > +	PVC_CACHE_MODES
> >  };
> >  
> >  static const struct intel_gt_definition xelpmp_extra_gt[] = {
> > @@ -838,7 +846,7 @@ static const struct intel_device_info mtl_info = {
> >  	.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
> >  	.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
> >  	.require_force_probe = 1,
> > -	MTL_CACHELEVEL,
> > +	MTL_CACHE_MODES
> >  };
> >  
> >  #undef PLATFORM
> > diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> > index 04bc1f4a1115..973175a64534 100644
> > --- a/drivers/gpu/drm/i915/i915_perf.c
> > +++ b/drivers/gpu/drm/i915/i915_perf.c
> > @@ -1870,7 +1870,7 @@ static int alloc_oa_buffer(struct i915_perf_stream *stream)
> >  		return PTR_ERR(bo);
> >  	}
> >  
> > -	i915_gem_object_set_cache_coherency(bo, I915_CACHE_LLC);
> > +	i915_gem_object_set_cache_coherency(bo, I915_CACHE_CACHED);
> >  
> >  	/* PreHSW required 512K alignment, HSW requires 16M */
> >  	vma = i915_vma_instance(bo, &gt->ggtt->vm, NULL);
> > diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> > index dbfe6443457b..2ce13b7c48cb 100644
> > --- a/drivers/gpu/drm/i915/intel_device_info.h
> > +++ b/drivers/gpu/drm/i915/intel_device_info.h
> > @@ -27,6 +27,8 @@
> >  
> >  #include <uapi/drm/i915_drm.h>
> >  
> > +#include "i915_cache.h"
> > +
> >  #include "intel_step.h"
> >  
> >  #include "gt/intel_engine_types.h"
> > @@ -243,8 +245,8 @@ struct intel_device_info {
> >  	 */
> >  	const struct intel_runtime_info __runtime;
> >  
> > -	u32 cachelevel_to_pat[I915_MAX_CACHE_LEVEL];
> > -	u32 max_pat_index;
> > +	i915_cache_t cache_modes[8];
> > +	unsigned int max_pat_index;
> >  };
> >  
> >  struct intel_driver_caps {
> > diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
> > index f910ec9b6d2b..ba821e48baa5 100644
> > --- a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
> > +++ b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
> > @@ -267,7 +267,7 @@ static int igt_evict_for_cache_color(void *arg)
> >  		err = PTR_ERR(obj);
> >  		goto cleanup;
> >  	}
> > -	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
> > +	i915_gem_object_set_cache_coherency(obj, I915_CACHE_CACHED);
> >  	quirk_add(obj, &objects);
> >  
> >  	vma = i915_gem_object_ggtt_pin(obj, NULL, 0, 0,
> > @@ -283,7 +283,7 @@ static int igt_evict_for_cache_color(void *arg)
> >  		err = PTR_ERR(obj);
> >  		goto cleanup;
> >  	}
> > -	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
> > +	i915_gem_object_set_cache_coherency(obj, I915_CACHE_CACHED);
> >  	quirk_add(obj, &objects);
> >  
> >  	/* Neighbouring; same colour - should fit */
> > diff --git a/drivers/gpu/drm/i915/selftests/igt_spinner.c b/drivers/gpu/drm/i915/selftests/igt_spinner.c
> > index 3c5e0952f1b8..4cfc5000d6ff 100644
> > --- a/drivers/gpu/drm/i915/selftests/igt_spinner.c
> > +++ b/drivers/gpu/drm/i915/selftests/igt_spinner.c
> > @@ -23,7 +23,7 @@ int igt_spinner_init(struct igt_spinner *spin, struct intel_gt *gt)
> >  		err = PTR_ERR(spin->hws);
> >  		goto err;
> >  	}
> > -	i915_gem_object_set_cache_coherency(spin->hws, I915_CACHE_LLC);
> > +	i915_gem_object_set_cache_coherency(spin->hws, I915_CACHE_CACHED);
> >  
> >  	spin->obj = i915_gem_object_create_internal(gt->i915, PAGE_SIZE);
> >  	if (IS_ERR(spin->obj)) {
> > diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> > index 1d1a457e2aee..8ae77bcf27fa 100644
> > --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> > +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> > @@ -126,13 +126,13 @@ static const struct intel_device_info mock_info = {
> >  	.memory_regions = REGION_SMEM,
> >  	.platform_engine_mask = BIT(0),
> >  
> > -	/* simply use legacy cache level for mock device */
> > +	/* Simply use legacy cache modes for the mock device. */
> >  	.max_pat_index = 3,
> > -	.cachelevel_to_pat = {
> > -		[I915_CACHE_NONE]   = 0,
> > -		[I915_CACHE_LLC]    = 1,
> > -		[I915_CACHE_L3_LLC] = 2,
> > -		[I915_CACHE_WT]     = 3,
> > +	.cache_modes = {
> > +		[0] = I915_CACHE(UC),
> > +		[1] = I915_CACHE(WB, COH1W),
> > +		[2] = I915_CACHE(WB, COH1W, COH2W, L3),
> > +		[3] = I915_CACHE(WT),
> >  	},
> >  };
> >  
> > @@ -181,7 +181,7 @@ struct drm_i915_private *mock_gem_device(void)
> >  	/* Set up device info and initial runtime info. */
> >  	intel_device_info_driver_create(i915, pdev->device, &mock_info);
> >  
> > -	i915_cache_init(i915);
> > +	WARN_ON(i915_cache_init(i915));
> >  
> >  	dev_pm_domain_set(&pdev->dev, &pm_domain);
> >  	pm_runtime_enable(&pdev->dev);
> > -- 
> > 2.39.2
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
