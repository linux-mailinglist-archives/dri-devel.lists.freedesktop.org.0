Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67069758165
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 17:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E4B10E375;
	Tue, 18 Jul 2023 15:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876DB10E375;
 Tue, 18 Jul 2023 15:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689695597; x=1721231597;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=w/z3/Mnyd5jmnmVrwB0C3lRedH37JaO98rTmcvoVErg=;
 b=cjMbOW/M6tIH8C+ac7WGMk7IchkH2TvpbQyH8c6Ls0y1f86HUJqsYXHj
 hScRQzLw9KONX5fgInqRgKtcRMCxsuy3VZDLFakKt1uSWSxqwRzCsjixc
 mYkyHEw2Tcj6l5DRXXt2MB5UsJLf209pgcsq5r0jzdRjjhE3MfqSmdNyw
 uLf3CL9enuYfW0XsLFrUfP1PeJ7H7HoLR7q4uvyiLK292tU0SRi7wZZCS
 uvMuclySrohwSI3hmXJDGVHGK1WT72gNv1/XuBo59NoNY7my8c+3vU3FB
 llDsrhR+rv+C+9+/dO4l0ysTqg5tBAKEHKi0XLWiq5o5UJY+yMlnrFvuP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="356186582"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="356186582"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 08:53:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="813809052"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="813809052"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Jul 2023 08:53:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 08:53:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 08:53:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 18 Jul 2023 08:53:15 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 18 Jul 2023 08:53:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEPH8x+pvVOZ+h/VmtBJpC0+/aMLDwoGFZDKlSh2EeKetLHPCimnsd3V5NzQFC3m5euwGYdAhuhlo5FlPY1nob0EAHRChwz2P7JeF5R/4xAtcEaZUszE9MWU/UpN/G/6QSNZUhRRpDbEqJiPAXwXoF3V3HPGRTaXcKhxjRoouSQW3aCXsk8CMZrsIs0UAfNzG5BmoNOMw2kvoFYb+2SLY+7/UVpKFWZ9Rd8UBwo2V+UnNEA6/Bb2jmF/oCxMVrKS9jAHCgczcLRCcGrs6I8R4BdEUzeCBTl6g935vgD1ofi2ny2JhECuS8o0KoHbbyudeEZmK3I+vZ2doh3jD3ifMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCqXrViBSp0AeTuVLMG+eSoQGmsA6HQrFOJbeuDCx9E=;
 b=WNaiRQGz558fYnq51R57lzg0bRwxR08lB4ZAXwgIoPh7hCSDMD7CeFkR4ztMBOUhAJR8rOOGxiH3xstsMMORSSftiZXeC+277ICbUqvO7s3l1C0PCn9GojPhWrHzfmaFVtHSg8ZhpdxBpi634CtO0BbszdATe81d88hwwrr6LmR1Ct+fxoUkMIduu2JroMOXU6rUWDWopY1r55qehgrjqMtzfQBx1K0xsBYBjDYSyckFrA6qIccd5ABu2Me92GAlJgXAqb+uDN89iZ2GMbzh+6176o3Knu0y5/9h4wbFbh4YOADO5K8UxfQ3BKOdR+CevZEXvnp8RRNcpqefdFn0TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW4PR11MB7152.namprd11.prod.outlook.com (2603:10b6:303:222::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 15:53:12 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 15:53:12 +0000
Date: Tue, 18 Jul 2023 08:53:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v4 2/6] drm/i915/gt: Ensure memory quiesced before
 invalidation
Message-ID: <20230718155309.GJ138014@mdroper-desk1.amr.corp.intel.com>
References: <20230717173059.422892-1-andi.shyti@linux.intel.com>
 <20230717173059.422892-3-andi.shyti@linux.intel.com>
 <20230717175425.GB138014@mdroper-desk1.amr.corp.intel.com>
 <20230717203103.GG138014@mdroper-desk1.amr.corp.intel.com>
 <ZLW4GXM17rdep1Ex@ashyti-mobl2.lan>
 <20230717220018.GH138014@mdroper-desk1.amr.corp.intel.com>
 <ZLXcnTS1oN3Rh1pU@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZLXcnTS1oN3Rh1pU@ashyti-mobl2.lan>
X-ClientProxiedBy: BYAPR06CA0056.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::33) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW4PR11MB7152:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c26332d-d727-432f-35d9-08db87a7174f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AkNW30BVENoMdxbe9M+sMyGr1yPi426/lrKaWEoRTECNa5n7ptU7OKv5DDgIQ8pkuzapDgpQ3Eg27091zLBQB9w/0C260i7jsOZ8ptUan1M45G3MnQvFR4ASRJcmk65NJyM1YWA8v1gCTpPia4Ef3edWMxSHhnV/2T+tWO76508S6xQvzKENaWdzLeaH+gttuLzza2qtFi/DJ5X7zNvAlgNx1gsF9YRc4BKilwNt6Cowe0uWagStHdupiP6mFFZvs+tQ0HQNbOcW8L5pWE9GOsIsbiXfXZHkrF66OPyOALrF3jLfy1KmMy+MNaVCwOEpRR0UlSTIa/rCjz0GXQfo4MG4sd4DiX2cHXcp6yJNI9y0CGZOX/O6O9REpGJLJ054mUVZp+zmFnWWE1ZfUqXhR8dPBYcJ+3nzs1XLlFyf/VJ54OHJn3IZm0y2E1G23fDDKgVn4iQafKA3JdxAHKY//MujnCAinyRHIayIIHPCHetabhVd5JN3I6Okjw5s8UMnt3ugN36spoTQrZU96plMt7A1y1IzL39QZ/NYQqi4LY8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(396003)(346002)(39860400002)(376002)(451199021)(8676002)(8936002)(82960400001)(41300700001)(5660300002)(86362001)(38100700002)(6916009)(316002)(4326008)(83380400001)(33656002)(66946007)(66476007)(66556008)(2906002)(478600001)(54906003)(6666004)(6512007)(966005)(6486002)(6506007)(186003)(26005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1pQdLE/aMMoF9ElmlUV0FMarFhA75ZVrT46PwCBwBcB6ubmTAubvKO8J+ybZ?=
 =?us-ascii?Q?MKT1fVH9XN18UPh+iUOFq3gA65PkNpz5OneQzBhdpXkKSiMr8mH4cnF4LOPs?=
 =?us-ascii?Q?D98kA0c7g8UMsrfN/qvmj4ex6jsywbpR4eRO2cVIIhP4rjZiP4v4uPqZNGFG?=
 =?us-ascii?Q?vv8/702bta60GfOQ3Wap79eBgihzz0ErXgPtWHsWEls49GjtvUDz3MbrYsDJ?=
 =?us-ascii?Q?NRsThHhgUadBf6Y5B05eCW/2cxw5OAN/FSkVmdQdf59lSc+hiL6QlGrGYZhG?=
 =?us-ascii?Q?qPjHnZAAtgJuLGug+S3HaLQzhSEmpA4i32t8sMNOXW+JZAY7wlxgxlgJtApt?=
 =?us-ascii?Q?sFzPtWM6ljLaiKoDcSsQueUaFe1aGWndRAcqEDsWpsvG65fgaS9rLxG5DRd8?=
 =?us-ascii?Q?V/cbxN+HrC5tXvzlJ2DXLyK/myVq76fBqMCvK0UYgkBYCowbI1CMmBEKxQtc?=
 =?us-ascii?Q?vr53BTQWxZWr1ekWYVxwAuew0u+KA1W+/AQkz+vGcgJZqTgIAijWV76cVXPo?=
 =?us-ascii?Q?hX0xi0s8oGwCglVRVxxQ2kskmMSJ5Pvn7Vh6UfDCDMdhKARnLH2mwFpwfMkk?=
 =?us-ascii?Q?mFt9pYaQ84V28fyF1Phh9KFYS0ZOnwC2q0cyAvnGoLJYz8Q/++4S7MNMzOJU?=
 =?us-ascii?Q?OKE3huxujuwQgBASftHT/UAdByfTdGKGT3ydcTziXe87743fTynHid+x9psU?=
 =?us-ascii?Q?PvbKAFrwzyTQu9LxJ4Qsdr9Fs6yVufj9iTSWlY+o+Y3pzVGUlCn/4UYR0CV2?=
 =?us-ascii?Q?au4x6ZcL/breHrOBpxEHYT+uYZS6xtGoIOeHwijVyKZp29QDOd1qvdpl2Afu?=
 =?us-ascii?Q?spfaQaE9QjDd65gIG8OYibCdE1S1yGLC9+qQnrNeDKktenA618SAflwAJWor?=
 =?us-ascii?Q?Q13Xu9wPirvlyMddnu4Nlpme96NhvJ9n4sCCYBfohqT9k6nPkT9FhxuYB/cx?=
 =?us-ascii?Q?GhFjZNFc2I4KqtQb13JxopZmLKEULJx5iolql1Par/UzoPQAgX/0AvmH6R0K?=
 =?us-ascii?Q?Wf8O0riMvWGiPvF2T0FigHEv6tMcDLe6ggNVZ3RKpxdJ+wF68Y20APSVe7gs?=
 =?us-ascii?Q?MojKSE0hlGAfP8zh4e2/6d6cEv/Yv4rcaGarUjltKxeZOzfGoxxxHynjvFH1?=
 =?us-ascii?Q?4YnH4wSM5SmADr/Thk25cAjmfHbyktqrRhFkBbn4t3+tm9ywk2AqOtAkCgzH?=
 =?us-ascii?Q?n3S/NYfrgkVE3OqVjTV2wHbEFDtWj2wG4Lr4rkVyyQZnFwH9UYcBjFKLcN8E?=
 =?us-ascii?Q?O8dYIuvUTsDOM097Au4Ip4V7GJaaV5HI2ocCcGS+Tu/45sRuV1cRkfqt4kff?=
 =?us-ascii?Q?8e0JQ+bOfc6/VHqBTh4wTQkKwLKphdyHWcOkAjLi9cFhmYqS6xccv+v1+3Eq?=
 =?us-ascii?Q?YXteptWmueirsvWg2jb2LYPofL7j0jOaDi6ckg8JvJ22LpfQTlDMgf6kv+7e?=
 =?us-ascii?Q?Ptlcs1HSQtums/Yvs9588A3Ym0IxDhF5a6uBRBfeJ0pGu85oWig2SuVFg86p?=
 =?us-ascii?Q?V7bEPT3RKq3JF9t29Fp1pHob1LttcZeM1+DFVn/rIN1Tr8SINGfFFVcSmUhp?=
 =?us-ascii?Q?RBeHsW2YisZnPo9FzQvUCJXmBM5SGgn7+xSmPlxJoxie7AqWym+dNXF3JKyc?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c26332d-d727-432f-35d9-08db87a7174f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 15:53:12.5218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8lOYZfPgU6dEsZtvqQIiE9p3T6BMlweFR+ztgKJrUtLay1yoQEUPDx5l6+WxmyOHQxKo9SPNcyGluSAS/gnfXQN/sXtGi/qVIb+5k6TncQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7152
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 18, 2023 at 02:28:26AM +0200, Andi Shyti wrote:
> Hi Matt,
> 
> > > > > > +	/*
> > > > > > +	 * Aux invalidations on Aux CCS platforms require
> > > > > > +	 * memory traffic is quiesced prior.
> > > > > > +	 */
> > > > > > +	if ((mode & EMIT_INVALIDATE) && !HAS_FLAT_CCS(engine->i915))
> > > > > 
> > > > > It's a pre-existing mistake in drm-tip at the moment, but we shouldn't
> > > > > assume !flatccs always implies auxccs.  PVC has neither, and there may
> > > > > be other similar platforms in the future.  We should probably add a
> > > > > helper function for AuxCCS, similar to what we added to the Xe driver
> > > > > recently:
> > > > > 
> > > > > https://patchwork.freedesktop.org/patch/539304/?series=118334&rev=1
> > > 
> > > Currently that is done in patch 6...
> > 
> > Are you sure?  Patch #6 consolidates things a bit, but is still incorrectly
> > assuming flatccs = !auxccs:
> > 
> >        if (HAS_FLAT_CCS(engine->i915))                                                                                                            
> >                return _MMIO(0);                                                                                                                   
> 
> But isn't it the same the patch you linked is doing?
> 
> 	return !xe->info.has_flat_ccs;

No, that's just the end of the function.  The important
platform-specific checks come before that point (at the moment we only
have PVC, but we expect more platforms to be added there very soon too).


Matt

> 
> And

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
