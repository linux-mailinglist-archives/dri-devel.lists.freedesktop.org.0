Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A34205F113C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 19:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430F110ED83;
	Fri, 30 Sep 2022 17:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DF710ED82;
 Fri, 30 Sep 2022 17:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664560581; x=1696096581;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wWCI8p6B7zdG3hqfCeJWzQWGmNt8GPttUkXThq2fnBc=;
 b=E0H0PnczbiuMxH6DoFmwFM2KHZQoCySdGP12iuuhUZkuSismBJYoqLJD
 RG6Mh9cwSmyRlQkA9KoAc4LjlcI5je4ctQMwEGpUTx4Dw+XSRuu9r29xj
 meNjQp3ROq973goRu4cYc+/TeBwW/FzOjDRK/J9wQpv7G+LTyBbKnrq41
 xSBz/773y1EXtl74wYVkfjb+K4/A+IMHiNoUrA3IX50F/IS6zzB5P3F2w
 udlzid9kcjXtCbdb5fD7RlvVCOE3ww0+1+213qUM/djqp3RnXPkQUaqOq
 wAzS2EDku1yPwhiIPbzDNyzvg7pJHNrDu64v1KiatxDp7JIywGuwseutX w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="366302297"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="366302297"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 10:56:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="951634510"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="951634510"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 30 Sep 2022 10:56:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 10:56:19 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 10:56:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 30 Sep 2022 10:56:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 30 Sep 2022 10:56:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgiWepIcMAg+1UYIuFhvuPrt7m5N5Z0oUui3ewK85lKWy7YMPY7Mds8BOOF2KmtXU3LSWCIppZiBEtF/PWVwaXzvTHWRCYiEcqCkfqwZO/g0JS8MzK+k03JtgH18G8IOn0I7BRE4wPwebA6qP3OsbQztCVajb3ffqGaSiN6zHzNcc9AJ0tIj2tQ4c5fuDw/vT1YbK98Sc5c0reEyuZ279ILr15a6D4+vWNJorlWma0n8PKZsNpslALoYLARtLnYqVyzeZGh4YixavuigM0Y/FEHDhtIUDVf6vRPaaUHW0sJLsUFzRnM1iX3gJFfdfQd1BRsIkka+VT5KPnOvHklKKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+amadrVAyVMJxLi2Fl4IPqCXcxzmapEXJjMl9z/r/Y=;
 b=ZR7HDrd0hHNT6fRO00yOEEVb7CIMXzeZBA2fAHI58w5H+76uA4+/JEF5fOlqE6fhymiBW8aLsPmQxqD1l8IIXvw2lD7Zi6hVgOlBmhE7vojjImmagI3h5jBZyfX2xWkLGdYZuFaG3waFUgcgyebpOLgjfv1q1eehrxQcO1P4hlhcFB7wtR4oy2cGvC1iuqa+8xPlcGYiOB+nQwviPCqmVdZyKc1D+Yg/Y37V2VP6ZbNRY4nACF4XFRE8xitp8XeT8Ljh6taHr/sanyosUdZSy9D3znFLD5ZCsalCHjCK0nK5FoDUAy3fcBSmb3hV9TBeUMpJ51xuahZA+ErltZ1oWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by CH3PR11MB7276.namprd11.prod.outlook.com (2603:10b6:610:14b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Fri, 30 Sep
 2022 17:56:15 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198%8]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 17:56:15 +0000
Date: Fri, 30 Sep 2022 10:56:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 3/3] drm/i915/gt: Fix platform prefix
Message-ID: <YzctvEbkMMX6IqdT@mdroper-desk1.amr.corp.intel.com>
References: <20220930050903.3479619-1-lucas.demarchi@intel.com>
 <20220930050903.3479619-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220930050903.3479619-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::35) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|CH3PR11MB7276:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dee3a2b-e77c-46ff-9974-08daa30d11cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jEEuMs2cOE7U6v53aJVhpSh2Koo0Gm2whqwYPIYhLZIkbVEVAlpR1twF8An0+scYnMEq4g/hJnheGOG1RZikPKz/W4mWUNd9Fe8J1HfZAywfwV00mNI5CuWrALL/m2qg6e0CNr4OXJ5taSCbfeRbz9TMBMq1ddk4PiIO+gKr+OxYCX+/+vx6rvhRoDoudZxsnxK0AdZDp9OFIYLwF5GKpnm7sWDSaIQDU9cO6Sc4g9Nt/CbZr01b+tk4gL8sBMo8JOKmt8n6GXif3ef1cGPTkBNfn0gULEU3m23s0J1QVNsVRQIxpdSNFdDpzI9x+JTjRX1JlzCZFoqE42q07QVrSZbZ+hWor7UIjYzz0ZbMR6ohRX8+qJ9X+a+OTo1W8KqE3TG7ey08fFDex3GI/8Mz7HSUGSMlIP1QDbCqIwjIhMUYpCp1W4jBMr9pJbZaQ6PH+5mbcXc4AxNrOaw5NE9vLEWVd/rz2Jk+t8TpAOuTJBshEMW1+HxtfgSZ+uHsVDtkxzDNAqc5KSjZAp/pI1XVutTN69qMa1ZCyyH282Vo/oQUI3JiR9dmlnkcJ8BkYqFhwFw8YetHZ+xzyyGiNj8VjsLKOVxazLdKx/4UBUp9eRNoHpUmVBBc3S1VbdRnROr39JUFagXLVMSF5U4diikzAvRe4nPVuxQW4pmdhTG8xqxsMUBFr1ufPv0S1yrS/lmNSYrm9WyQQu3IKf1Aef9ZFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199015)(6506007)(478600001)(107886003)(6486002)(6666004)(6512007)(5660300002)(26005)(41300700001)(186003)(83380400001)(6636002)(54906003)(2906002)(8676002)(450100002)(66476007)(66556008)(66946007)(316002)(6862004)(8936002)(86362001)(82960400001)(38100700002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2t1GRVzdH36yhUoq8G3e+f9wh6grdwfx+lqSpVLkj4DJrVLoW5dSEixz6DYK?=
 =?us-ascii?Q?LLEj1O7D0jvF7H8sUDuRPLbjpzAmwcqBGViS8mPtayXOe5+C1+3uUemyJDWz?=
 =?us-ascii?Q?52BZL6k/dPzjeSDvazZm0+dFw7rQ0cMJS8qO92JFa6pQ6UfiiA9Jt94Optoe?=
 =?us-ascii?Q?RsXWHeFfBdxI1TEinPwEIVh4A54DGGJUN84K/82DE3Xrp8NZ7Oo4apYcp7AS?=
 =?us-ascii?Q?2+jrlqp+xfIEVEOWbzEqkFKxOsSvWn8Hkub0c03E4Xh5vF/3Tjqurzd7ET/+?=
 =?us-ascii?Q?/Zx02blRD7vEU8/FD55gy+7VlUJHCrUV52LR4lUlObUz8q2qbM/jmwt72g5Q?=
 =?us-ascii?Q?2HhESBbZBAZvJJfUOgReC/x0Ynif2Ixhg5TAMuLcKlYrCNcN7FNbueRnPTxC?=
 =?us-ascii?Q?3ap0XtPHR8S86oiGvo7tLblB4hoEtJ26iOKEAaavu/dB4j5XWVW+FBhiKpSV?=
 =?us-ascii?Q?HSdWmLg78Dwxpjxoj5IV3qtjCIAioWGU+s0EmEgiFMZIC4SEZ19+7Z6hRQLo?=
 =?us-ascii?Q?9GiGJgvlShG6ifBssIDWGwlXmPkDErjdDpyt0gVc2GBTXp0xlg2s21t2IcZJ?=
 =?us-ascii?Q?ldfq6I9gxF5oT+li9YWBhq/wnM+3mHlTiMo0N5y11H+8XVyhjC+l0JosfDJx?=
 =?us-ascii?Q?FFE4+fOICuyP66pcxqNu4vBISqH4SjF3bgZLrOfZmCq2xNzCSED5wt7MhKql?=
 =?us-ascii?Q?9AuIqsiiq7CdDpKRGRvb9bLIHU9Ef5AFChvTQGctJUnZQmvfVqAFWdMLtwJp?=
 =?us-ascii?Q?zCuUg1+zBjjYZqdNHXd0WPFviVKw5N2hfOVTdy4/jPL1jVupfiQcs44lpwZ0?=
 =?us-ascii?Q?ozaaZavRpXG40Ctd3+2yqVE2mOahvJIJdinGDCqvlWBu2CWJyFKpMnteZiAc?=
 =?us-ascii?Q?MRAGhapBJTrb3Zfd/M3li5Bg9Kxyh3xi/CnMOr4NtwL/NfGUZJdDXK0IqOUg?=
 =?us-ascii?Q?d0y3GoC6HFQ/ph8YodkCl5eOyZVP/rmcBUx46b3+3ESOBWup1RrGa0qWsdBC?=
 =?us-ascii?Q?jQsY7ALfDBoKEy4uzQiQbAl7vTEPeqwN8bdGHcRwXg2hTAT+8SjXQgTfDWAF?=
 =?us-ascii?Q?IPqMAYotqa2QxLcUSOOlTy3/acBbKQ/GTFEJ3Nc+IQdzMe4X1wbQ2BOcadHb?=
 =?us-ascii?Q?jEVBjNNxVA/vrqarqBlMya4hUIycNFgu6pA09B39+JUxKd2ZOxkf1sVGM019?=
 =?us-ascii?Q?PK4hYGCAagwyKts0jIgL3G58gr3XXl0EqlW13SEtHL7+sIGFTLITr6KrkDq6?=
 =?us-ascii?Q?mDokJ7oHwm7ZnC+LP+oePETapa6E23xWrJrVXNi38UfDxb64Et8QMxe9Ut3+?=
 =?us-ascii?Q?k4RKg9Jte92ZMMOWgC34kb+ZflXuQ8I0b2ofjXWdPx2lQvbM62qipy4Fgagg?=
 =?us-ascii?Q?VfhO63EgNRAy5768M/VnKm+Ok2KpOvZRSVqYNiLLRjtDQlIDfYfSXamUBpe+?=
 =?us-ascii?Q?5ozFSYnsZ290K9xG6wKI8XGjMu0aHZpFmO5cRzV+3Nb3+du2XXbfxQ3JS/yF?=
 =?us-ascii?Q?dw83ik480D7m7/VtFbCTjz0mETJzLJROUghy//vDwpqWuBHbA+KhAH+4ND5P?=
 =?us-ascii?Q?yKZ8rhibFBO+/wvUBhwTwYoxXergRx7dZsEjo6S1e1+qONqV2EO4LrVtz9bz?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dee3a2b-e77c-46ff-9974-08daa30d11cb
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 17:56:15.6366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76xMUgcF+E/en/pR0U3fZbcqdjJIM549U5lZP+5Xg0ql93b718xhmhHxNxNmAR0c26CizyB/rGwz7wHdcKVsZyoQZ8nyOOCT80pmVlxlEps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7276
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
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 29, 2022 at 10:09:03PM -0700, Lucas De Marchi wrote:
> Different handling for XeHP and later platforms should be using the
> xehp prefix, not gen125. Rename them.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c      | 24 +++++++++----------
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.h      | 12 +++++-----
>  .../drm/i915/gt/intel_execlists_submission.c  |  4 ++--
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 +-
>  4 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index e000eaf8abed..e1c76e5bfa82 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -396,10 +396,10 @@ int gen8_emit_init_breadcrumb(struct i915_request *rq)
>  	return 0;
>  }
>  
> -static int __gen125_emit_bb_start(struct i915_request *rq,
> -				  u64 offset, u32 len,
> -				  const unsigned int flags,
> -				  u32 arb)
> +static int __xehp_emit_bb_start(struct i915_request *rq,
> +				u64 offset, u32 len,
> +				const unsigned int flags,
> +				u32 arb)
>  {
>  	struct intel_context *ce = rq->context;
>  	u32 wa_offset = lrc_indirect_bb(ce);
> @@ -437,18 +437,18 @@ static int __gen125_emit_bb_start(struct i915_request *rq,
>  	return 0;
>  }
>  
> -int gen125_emit_bb_start_noarb(struct i915_request *rq,
> -			       u64 offset, u32 len,
> -			       const unsigned int flags)
> +int xehp_emit_bb_start_noarb(struct i915_request *rq,
> +			     u64 offset, u32 len,
> +			     const unsigned int flags)
>  {
> -	return __gen125_emit_bb_start(rq, offset, len, flags, MI_ARB_DISABLE);
> +	return __xehp_emit_bb_start(rq, offset, len, flags, MI_ARB_DISABLE);
>  }
>  
> -int gen125_emit_bb_start(struct i915_request *rq,
> -			 u64 offset, u32 len,
> -			 const unsigned int flags)
> +int xehp_emit_bb_start(struct i915_request *rq,
> +		       u64 offset, u32 len,
> +		       const unsigned int flags)
>  {
> -	return __gen125_emit_bb_start(rq, offset, len, flags, MI_ARB_ENABLE);
> +	return __xehp_emit_bb_start(rq, offset, len, flags, MI_ARB_ENABLE);
>  }
>  
>  int gen8_emit_bb_start_noarb(struct i915_request *rq,
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.h b/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
> index e4d24c811dd6..655e5c00ddc2 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
> @@ -32,12 +32,12 @@ int gen8_emit_bb_start(struct i915_request *rq,
>  		       u64 offset, u32 len,
>  		       const unsigned int flags);
>  
> -int gen125_emit_bb_start_noarb(struct i915_request *rq,
> -			       u64 offset, u32 len,
> -			       const unsigned int flags);
> -int gen125_emit_bb_start(struct i915_request *rq,
> -			 u64 offset, u32 len,
> -			 const unsigned int flags);
> +int xehp_emit_bb_start_noarb(struct i915_request *rq,
> +			     u64 offset, u32 len,
> +			     const unsigned int flags);
> +int xehp_emit_bb_start(struct i915_request *rq,
> +		       u64 offset, u32 len,
> +		       const unsigned int flags);
>  
>  u32 *gen8_emit_fini_breadcrumb_xcs(struct i915_request *rq, u32 *cs);
>  u32 *gen12_emit_fini_breadcrumb_xcs(struct i915_request *rq, u32 *cs);
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index c718e6dc40b5..0187bc72310d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -3471,9 +3471,9 @@ logical_ring_default_vfuncs(struct intel_engine_cs *engine)
>  
>  	if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50)) {
>  		if (intel_engine_has_preemption(engine))
> -			engine->emit_bb_start = gen125_emit_bb_start;
> +			engine->emit_bb_start = xehp_emit_bb_start;
>  		else
> -			engine->emit_bb_start = gen125_emit_bb_start_noarb;
> +			engine->emit_bb_start = xehp_emit_bb_start_noarb;
>  	} else {
>  		if (intel_engine_has_preemption(engine))
>  			engine->emit_bb_start = gen8_emit_bb_start;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 0ef295a94060..d81f68fef9a8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4094,7 +4094,7 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
>  
>  	engine->emit_bb_start = gen8_emit_bb_start;
>  	if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
> -		engine->emit_bb_start = gen125_emit_bb_start;
> +		engine->emit_bb_start = xehp_emit_bb_start;
>  }
>  
>  static void rcs_submission_override(struct intel_engine_cs *engine)
> -- 
> 2.37.3
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
