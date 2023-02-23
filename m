Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A3C6A111B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 21:20:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1114710E224;
	Thu, 23 Feb 2023 20:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC3F10E224;
 Thu, 23 Feb 2023 20:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677183637; x=1708719637;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bquy3/q8crH3hJgDg1FWphyanDVn8xXgtKRSP3toZJ4=;
 b=ICNcCIhUWR7onD05x2FvJI9byl6L4dEdt6XWU22kqnjx4rKYyuXvu+hs
 nm3U0vDouxOYDBBIYGXdlFtXSXn7wnatdqe4Z6iW50VygXnriuC0KPwZn
 GfBXOEIDJxwOnj01n3DvebtwqazWdSoprtz2qBDRE/I6zcix+jF2ke46H
 JuTncej2qsgx27QOjYy3xIkPDMjD2ZQ1k5wiJwdP+jC/aZslAw0JCQHjs
 22mjCxu8pE7KT4RbCOb5pku4ZqMcrmy6TEDUugYHspzutZ/Sr9havhzpL
 pbJPPZyRbidfuDtZORs+2xm3ItX8N62Gk7kzA+uWHaMMdKyiwR+TiOwXe w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="331995374"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="331995374"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 12:20:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="741404331"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="741404331"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 23 Feb 2023 12:20:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 23 Feb 2023 12:20:36 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 23 Feb 2023 12:20:35 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 23 Feb 2023 12:20:35 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 23 Feb 2023 12:20:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1mGP3LAnjAPHQXzf12vtu0QX8eSCh2+3Ylf4AwQLrS+Hr/WJL+WljkqbV6eau95VHkrxTatyqqIF2MWVL9CBTSJlsMw/4uo1xJsEn26Am1vLB7llJm3JA7CkOYj/2E84kzwF3laYzcpPYqvhawQpdcoEx3RjnNemlFIMD6EAAtFEUEx2CcgpVemvwO15thBqbSdZVkaLsUAs1QIcjT7PsSCnJC4BVq8u24mx5EzX9+b1wGSRfL7lYi0J0hQ9/g98S4Bg2satdyBFHgfewPfMmb6rC17AmVmAX6ot8oTkcjKDsF1T/m3rdf+prlLVDBwwIRh7UnnFMTVC5JU+bUhgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjWNy++vXSuKTHA9CgbmSce6RPIf5pN0guq9qNCOEb4=;
 b=WB8girgxm0d960nNxVEfVf31GJxOiR+rF5DD1h9pQprdamVbP8NQmBCpDPQplEcf5VWR7ovpXVcRmtIJi3V7MOzSRAgWWxNOcYPCdmlCAHxiw9na6jPtX1KMXje1TFaUwLMve4YrPjsn5OefT6IbiIlYNT0dAJ2+PWfffBAz7o/VEP8lyU8tZ1PPCqeblgBS0det6rQyqmR8V7ypufAn9cbUDY7Y1zr7viahIRKTPCeYn/KyS37FGjjMFxEOq4mWb4A1zsUNlhoiNt6acwISWDR7WcCVDfM7E14ymMSLfIflO3yRimRS6qN93g87d4Zzo3ZCGach/dbVGEeeMI2qWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6724.namprd11.prod.outlook.com (2603:10b6:510:1b4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 20:20:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6111.020; Thu, 23 Feb 2023
 20:20:33 +0000
Date: Thu, 23 Feb 2023 15:20:28 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Apply Wa_14017073508 for MTL
 SoC Step
Message-ID: <Y/fKjHl/xb1CBD/b@intel.com>
References: <20230223184140.3452853-1-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230223184140.3452853-1-badal.nilawar@intel.com>
X-ClientProxiedBy: BYAPR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: e566d6c1-54cb-4bba-10bb-08db15db6a64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SzfOCHNHMrMSfsGoNxquzxNtEy0Q6q55g+8KwLjlgEq579aapktmIMajQ0hwUJ4CJPULJNi0527upXXf/a3Ja3UgbPOJ+cWBeSLjs0zhm6minDd/z3xrh+wzWLKlTLxegy3z/qSVvcBAZnKNRZG98N1rP4GHC+UeMiMAwWlnzXGvuqFSLoS3PP0LxtvklUr2Yy0O+qiVCDeiI5OWe2SsotGyNw/fNlZz7U+UXdkkjwuEyjjhlVRfFAAUmDeAUzhNzZ+wV732Tfm1QqsmKNTvw/qMcgPXJvvLgxhGw7mazBT7xeDBn9/1Qd5ECtJ5Vich+p+IYMRqQJklx+5dT+UoUFckrTBxFHav5RfsbMs5tNObLtVjMdcLnvAaFecskPzZQmi4wT0ET28OubxH6wK9xoQzJQYWjRcmFhoIVsssJsXWcUq9fLsIRlASwtd72DEeZm/jwIRi+Txv7J5WG11/txyYGh/7EzmquO0xpou3WuaU2XwlNl2H8erRsckK/FH7mN4xJiqa2KHysgHTl4CHk368//Zuglq7aucxVh8IyRWPOdcE9pCWLScTROUlvp3E/hjhbYvDthIVVzFT3ZxYczIK2tmHO22RIukCQPxWOOu46hLqJxHlhs/Ka1d3TNbH+/viLzrYOvpc2nDuZrkAGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199018)(186003)(26005)(5660300002)(2616005)(6486002)(107886003)(6666004)(6512007)(6506007)(37006003)(6636002)(478600001)(83380400001)(316002)(66476007)(4326008)(8676002)(41300700001)(6862004)(8936002)(66556008)(66946007)(450100002)(44832011)(38100700002)(86362001)(36756003)(82960400001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T6CvW4fhzoGoYM1A/iQ6sSXgkrxm3/deSaJQd3HFSz07wqYN2Ted8U9zeJPX?=
 =?us-ascii?Q?NqaHjaE0iOCRDhGrgewmh8MvmfEd8NwaDhIDB3lpubHRhmxU+qA7AsrCNEeF?=
 =?us-ascii?Q?8Ir5JPdBpjn2N67C+PbSZ9tcCZx8UKI4ongwDTfYQOvXompMfOqRZt+kDnBl?=
 =?us-ascii?Q?L10k1i/vbgdsI7kyT3CFZXvP6UyocSrhbC6QSVxP4DqhBQ+40t5QFz2IazGS?=
 =?us-ascii?Q?4+S0Nj3B7gLw1EXAfbSNXZRUVUSE4rYkpbVcXZS/ZGk3LLk74+sSBMIfeHm6?=
 =?us-ascii?Q?I3OvtCY0FtrMBNDhiJ3DJX8dRyn6uxb8giYToWhI5WRpXsRKGs6qW7KmqSxN?=
 =?us-ascii?Q?JsSSoTjMMsFmr5ufx0UaYARP+YLEg4GSBUKWn2uyLPUGoNaFLxWOeuv0LfO1?=
 =?us-ascii?Q?INF627Y+Ie1kzsAAKziriudQ+VP53U5DqOeWWWAxIKQHoW4xndGJUEnYSqzT?=
 =?us-ascii?Q?09ZmTzu0Ty4hvU7B+f5eZmtiDfzCf6W7WWpSB2HUCDB13+XAuowMeZ23O5d9?=
 =?us-ascii?Q?G3iTO+LqKemPtc3CSOqvmWpWiITKwMWN0eWvwaW+AUNT9L1AV1EXDm695DaF?=
 =?us-ascii?Q?RXC1UQvzmukdJ+ESaymjpV2o7HCQA/MhfmaIv68Sfts0LEKXSCWRnQCeoDyx?=
 =?us-ascii?Q?/fqM0gph5hDtjFWMR7xY8gqaW9IcHuMWqCRY29gCOsVFoSP/twv9fJDqoWGZ?=
 =?us-ascii?Q?vQlJTeO/TFAc8SR2htyvtozPH4ifPqqwkZG8VQmNsX2hLYSAo369dYrD8Jm6?=
 =?us-ascii?Q?xjod0urGZO0gm0jlkaXZUCTAWAJdpeVIytvLY70uQR5vfRc86tvL5LhTwDyN?=
 =?us-ascii?Q?d3l7Au7nQPFYdB4ecyEJIMk+Qt7IG6ZaYxxSKBAOKrzcqd/M9Oe4Hq0mYp/2?=
 =?us-ascii?Q?QqoaurTASVwmM4Ng+qFT9DW0g/RmZjr/pcq/DGDoxAHOmicJbl3u0NHMiLEK?=
 =?us-ascii?Q?or541EqK6gLW2zkn2pLNeFMtCNjBmo/pOCfWxW6XO28VmLeNvRnbprj+mrl+?=
 =?us-ascii?Q?uG0O2JpAPBkK0msLWtr5nzNt9QsQaTw5COdksHNEE/is/KQAhRoL2rKL3hIG?=
 =?us-ascii?Q?qhPbvUJdH2xolwbIMSXjxfeF+hlwhIi08582HZme0D42X5bgaMiQKIJshle5?=
 =?us-ascii?Q?SpSmyGafyfWuJdo0niyNrDSuBIsk1s8ZPGSH9adyJ+d/P0aZ96DNGAF8u13o?=
 =?us-ascii?Q?ECp126rboFgjE+WKYv9uoQEFtxr2G+jezdMPO/B0reomD4wCutV6Td5LIZAk?=
 =?us-ascii?Q?wpGLCBxD+6h5sGEBKMdtc10rReLcC/qsE3TLqNAjtSC5Urkg9JGx3HlXJQJT?=
 =?us-ascii?Q?zzujCFItKY7a4kHTNSxP2ARbu5hYim/AF4OH4boBwNx8Il+nppBYT84gLf2k?=
 =?us-ascii?Q?9g8cXTaaGu1u7qxCYCXnaiPy6TOlrKkHAyAn4fthYmAonIVvLp6I8FLS1rIC?=
 =?us-ascii?Q?VmYIDYKBgjv0sWJcGqXs2+mEOqrVO1yeWCuQUt4iFHj80LUVMruL4C/dRToV?=
 =?us-ascii?Q?6xIc7+rXhAyoRosQ8kZyWCbqOyMWHxvdgqgGZtdKAOkxoAyiTZOkue643uba?=
 =?us-ascii?Q?xfFGssVK7uUwTUDiuPGXvO/0GtRi1zOc6E4ZfV7ADtZZAlyP69Z3RGOgYk7b?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e566d6c1-54cb-4bba-10bb-08db15db6a64
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 20:20:33.2208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DmLLJpX1Ou4WacEAWoUVS7YMryQzVKoTmEXxdHwShlQj7QwnQm0261g4gZLks/n1JUFgHYU5897qB6R7usNtsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6724
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
Cc: intel-gfx@lists.freedesktop.org, matthew.d.roper@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 24, 2023 at 12:11:40AM +0530, Badal Nilawar wrote:
> Apply Wa_14017073508 for MTL SoC die A step instead of graphics step.
> To get the SoC die stepping there is no direct interface so using
> revid as revid 0 aligns with SoC die A step.
> 
> Bspec: 55420

This doesn't prove anything. It is just saying Die A0 with GT A0,
die B0 with GT B0 and so on... Please help me to understand that
better offline before we move forward...

> 
> Fixes: 8f70f1ec587d ("drm/i915/mtl: Add Wa_14017073508 for SAMedia")
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c     | 4 ++--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index cef3d6f5c34e..4ba3c8c97ccc 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -29,7 +29,7 @@
>  static void mtl_media_busy(struct intel_gt *gt)
>  {
>  	/* Wa_14017073508: mtl */
> -	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> +	if (IS_METEORLAKE(gt->i915) && INTEL_REVID(gt->i915) == 0 &&
>  	    gt->type == GT_MEDIA)
>  		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
>  				  PCODE_MBOX_GT_STATE_MEDIA_BUSY,
> @@ -39,7 +39,7 @@ static void mtl_media_busy(struct intel_gt *gt)
>  static void mtl_media_idle(struct intel_gt *gt)
>  {
>  	/* Wa_14017073508: mtl */
> -	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> +	if (IS_METEORLAKE(gt->i915) && INTEL_REVID(gt->i915) == 0 &&
>  	    gt->type == GT_MEDIA)
>  		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
>  				  PCODE_MBOX_GT_STATE_MEDIA_NOT_BUSY,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> index fcf51614f9a4..7429c233ad45 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> @@ -19,7 +19,7 @@ static bool __guc_rc_supported(struct intel_guc *guc)
>  	 * Do not enable gucrc to avoid additional interrupts which
>  	 * may disrupt pcode wa.
>  	 */
> -	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> +	if (IS_METEORLAKE(gt->i915) && INTEL_REVID(gt->i915) == 0 &&
>  	    gt->type == GT_MEDIA)
>  		return false;
>  
> -- 
> 2.25.1
> 
