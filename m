Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6666D7B0EF0
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 00:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4FB10E19B;
	Wed, 27 Sep 2023 22:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D527A10E19B;
 Wed, 27 Sep 2023 22:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695854152; x=1727390152;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6z6JY9JLroE7uvUNO2GqwMtigOENKY4dA86we6anOlQ=;
 b=UPmsKYQSQlE42MH0EhIBcTn918W52giXjb9c56nb2jNOS62L7PSBe/SE
 OAFEjPiyG8H9LdYViYrAuzGMi6NMF5AVK52Z/rhjvDxZDIvbLgNBy8VHY
 Lu0rjaWhq1yWYDGcMSkPh7S6bfuo/2dDxoBwg79UGcMTD5sGbauJC5m+x
 yiyVo1bFOuuTj2RwcMazkMw99g7FBSOkDzhMTDEwswkEnffXfEOaGLlrQ
 MnqG3OWoFFECwxQ+yStu+m+AQsLdsEg3aeAjLbGj1eRuctgMZz00sv4SJ
 SehzmgIv4OPgq6wRME00i6iDg8kfIPpnqotHhCZjw3jYjIIdzm79QC9kU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="361319080"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="361319080"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 15:35:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="778696172"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="778696172"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 15:35:51 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 15:35:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 15:35:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 15:35:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 15:35:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dM9GhJ8iSRBiu/jqZlLHdnwztRg9m8TPtvrsYbjJ803N+yAARI4Es5EwOjsCuDv4ny9KBjoDYchbox9nSDeH7MstBL8+BTtmukc6wC67LoUdxvTdAkddWA6ltTxdf5fd416fAvWbDPKdb5IgUYWHWXEuhB2PzVI+PldguXy7kQiJG4qFF/vYw+52Y3Q0IMLv6OsfudlzWu9Zz6ZC3zyKnVLKBa4voat9sJnOFwC/jJCU0Fw4998Rnt9Cd+U83ksSCR7/gr0HUeXquP0tWNBtI/N0NyOA2E46zLMgq/m7SR2TVmHs1PvD9zMOsY68tr0o+Wpw2EUJDasjR8gFYhrSOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yi2b+HdK0XYFNO9o6fwPsLiiR/u7UKfZrTUig9ESoS0=;
 b=VXNQCBMgzcBzUOhwHLzF1crBB2m1oh0unlwV9kMCr4JtvUyMvvDvAfSkqOxd84SV44HO05toIUpwA1HHFjjJ4pwIjIupwWwXlU7Q4QTBNn9Bz6iSohDRXbsm9/R3p1nshSbrTYWvnxKkDUxQLKth6KBF6kSdZ7QBlC2VUJ2o8sDMZcYMOTMaI/XwR9J1q+5Q5poseiow/kRMQhRbGEHZ2yA9Lp8GQ/4+yf5fC7H9goXP9Xd2tZ+5l/h1rcw3DxxLXVm1Fd50hrPRbc0v2EXJE/dSimmSEbLa+RMCzAhNvdaIEEjl0o8P5r7Tv5hU2d/QUNiFq2u0EktfVK9qG6oXfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN0PR11MB5964.namprd11.prod.outlook.com (2603:10b6:208:373::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Wed, 27 Sep
 2023 22:35:39 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Wed, 27 Sep 2023
 22:35:39 +0000
Date: Wed, 27 Sep 2023 15:35:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v6 3/4] drm/i915: Reset steer semaphore for media GT on
 resume
Message-ID: <20230927223536.GZ233750@mdroper-desk1.amr.corp.intel.com>
References: <20230927210357.17461-1-nirmoy.das@intel.com>
 <20230927210357.17461-3-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230927210357.17461-3-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR03CA0379.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::24) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN0PR11MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: 1748d84f-ae11-4290-9de4-08dbbfaa1305
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KRuz02USv59RfTTaiQTVxvn/+rbUoiPUjsi6BAefsRQnnN+wVWrJliLIhr3+Xzz0xfkJYVSrv61FKfisKk77SUx2QW/0w0oCWTVazKg65jl8Tz7Q/x81xivLFa+M/c4HQGzt+LskfsE138xEHTT7z7gjmR7q2tju7VQ7jEHiS5mcJS/TPtYCSkO4j72Ys7dLfP9dbxF1tP9oiwBWaGstJtIqOD5QvcpRuquzW77ujYr9kfR7JCxCCrts6xSIfLl093bM+bARWY0zyCTuqPzttHmZ61THiLObCBXqRcU+8yu3fKRfxtbcIsuX/g+Ki9+C+MAw2gOZxD8RfOpLOZ/4SqMZvibd5KAydjtY25Pt+xsg1pag31qvBrJ4K4u1bz+9/7YZb5jIotlxHqiG/9H1R6Zc1Jw/GiuMTWLerh1G8OImpB/nkzXjtdmcwce1ii8DFHcf+k19WJAU1zvsj59u8ZAtP6FJsnVYllbPNHfNK6j0ibcsX24zOs0A8Jgtmdy2jBRuK0oIrCL1tA6dIFYVEuQDZWJqtx5dl+ElR0nyVNxpaeM+QxezytpsLS3JE249
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(8676002)(8936002)(86362001)(38100700002)(4326008)(5660300002)(66476007)(66556008)(41300700001)(6636002)(316002)(2906002)(6862004)(33656002)(66946007)(83380400001)(478600001)(6512007)(82960400001)(26005)(1076003)(6506007)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J+3DVFJl/ntAi887mhgH2DoyF4b+GqGgIIdZfWpjJINY29Dkdz6dNf131O0F?=
 =?us-ascii?Q?CDth/c626HUozYKrWD2I5h+SOl04hPn0tO99h8twrqYQMizQpUpY/cLn2ygC?=
 =?us-ascii?Q?lrzS9gWew8D2pNqHzfvMpozvdUNlbKIgd/u4tI0pMbwjSx5/Xdx2FG7Q+wI4?=
 =?us-ascii?Q?TFTkeWvCfKkF9qtuj27Dm8XTLWQxUVuAzojiLpYJUw9Pl6acmnSBMqJL9O5C?=
 =?us-ascii?Q?uaG/TAlXtjJr+u8zN3cy6fQMyfiacy117/npvdXrB+NxGqxSUtqIujyCENgY?=
 =?us-ascii?Q?PfjtTEQfj9tyDte3m0r5j5e05vCncjh+5Mr8vjIpZu/JWtJQf1zIlLhUMAZ7?=
 =?us-ascii?Q?5TKDjOAjfmj8XfqtmJyewwwwoCGslJqrN0YwEzzEk8TA3yvHvECJggdlHI6t?=
 =?us-ascii?Q?JWVTVXwAtucaO1/JnfHExC4nnjJAeXhohrtIXj1mSkH4WSquXkbnqv17OKF+?=
 =?us-ascii?Q?9EAWh6i+Al2lM/6Qysdnf8xVg45CaStz/qFfPsHnT587mvFimPrgp+XCmgij?=
 =?us-ascii?Q?WYVosDRR4jPDyoUymCGTJ4pgtVcmKyi4To+nSij6WplNH78mb5RLIP/911Nr?=
 =?us-ascii?Q?bZeGiz3jjhFDuUcDFAlCxgIJ+WSsJv7Y3PXJpcywMSP6vDQTRKtxX/8EJ7Gh?=
 =?us-ascii?Q?ireLwVNxTNWGmczd41NL8jb9E8lDlptuEUIl/y0hZY1hZXEr7YlV4n61Chia?=
 =?us-ascii?Q?hZq+WrjhO6F6IxazKAwMOF2tViVPOYZom/NHwakypvIEhvD9/sR/pm75GyGq?=
 =?us-ascii?Q?pG+gICK2d/K/Mcj4cAjpC/pj7dUj4I8zyrA0uDBjHOmGJFnVsjCv9TJJJ38F?=
 =?us-ascii?Q?jqILwNZ7DY+AB0aUiYXMGa/VLdCRak+uJcl0Sez+wHfSudDEvudfNiBnZC8c?=
 =?us-ascii?Q?Ry2Bj5t2dcoaq0rgdQfKHQI33f0XhoOOVA1BIXiucSSmlY8uWCyp8L8iLxzl?=
 =?us-ascii?Q?cnT0TH/iaP6kWtvWfSkAnUKL1ZPXKlpQmpraN10jbUqhEd8/8ZxcEEKJD0Si?=
 =?us-ascii?Q?/kqnwf5Xd6751AiXbMS0Igp8fvkLuns2Rxu6FRaUWM7+A6j73OM7TX1CGcj6?=
 =?us-ascii?Q?Dkoy5/iCmOEzGcRIAlzf9Pn6osZ19XzUD4FpLkhhMZA2BL2GYxZdIfEoS4Ve?=
 =?us-ascii?Q?uMyiQB+a8UIT8FH99ZRgTRSrNP06xnf92QNt97Pq4Rmek3uoqMMJpAokfY8E?=
 =?us-ascii?Q?/X9VMky7Wr/df5vyE9L1ALsjQcf+bERF3P9sH4MZC0ZckM3Qv4iL+EXVyFH0?=
 =?us-ascii?Q?/KJzKfTPrAMDx8yS+LCxI6wC68+KbHFAERuk3UsUaLJfA/lxlwZ7xgAzcPV0?=
 =?us-ascii?Q?ndWYqhfzegZEiEuCV9aKjDw8fhxFr8mWHtcCXZxQxMvZsa4gzUMYawWN4H+i?=
 =?us-ascii?Q?k1ZRUL9yq43GWb+izHyDjkwPH1aYyzUH6JMoEZNANKIXcdUUhEW1PzitL0Z0?=
 =?us-ascii?Q?t5HmYzWmKDq+DsKcY2XQ7zfg0BTxdOTarsUQj30zHyffsBh0krj7ZLSJl+x6?=
 =?us-ascii?Q?0JQJli8nsbUqfhqiaCm753Q6FyKqAdEs2/7Is2RPR3KE/DKoTOr6T3peOFd6?=
 =?us-ascii?Q?qWkwd7S3aCoh8kES99coJw+qcMP7gnODK4x/EeuG7sZhbu6duwlqjMqIMZ2G?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1748d84f-ae11-4290-9de4-08dbbfaa1305
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 22:35:38.8472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: io4DaDyiS/qGeNPLCAGFQ8CnqKJ0B989Iyc8gXfWFE2gWF3WhcQg35n51qdO6YRkJuQQDP2jyKrbXiZOQAaUdmAtVuMDe03jzl8RIAXWP7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5964
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
Cc: intel-gfx@lists.freedesktop.org, andi.shyti@linux.intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 27, 2023 at 11:03:56PM +0200, Nirmoy Das wrote:
> During resume, the steer semaphore on GT1 was observed to be held. The
> hardware team has confirmed the safety of clearing the steer semaphore
> during driver load/resume, as no lock acquisitions can occur in this
> process by other agents.

I guess the question is whether we just want to handle the one case
where we've already seen a BIOS snapshot screw up (i.e., specifically on
GT1 during resume), or do we want to make this a general sanitization
that we do on both GTs at both load and resume, just to be safe?  Given
that the hardware team has indicated no external agents would be
expected to be using steering at the point the driver is
loading/resuming, maybe it's best to always do the sanitization on
platforms that have a hardware semaphore?


Matt

> 
> v2: reset on resume not in intel_gt_init().
> v3: do the reset on intel_gt_resume_early()
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index dab73980c9f1..59cebf205b72 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -13,6 +13,7 @@
>  #include "intel_engine_pm.h"
>  #include "intel_gt.h"
>  #include "intel_gt_clock_utils.h"
> +#include "intel_gt_mcr.h"
>  #include "intel_gt_pm.h"
>  #include "intel_gt_print.h"
>  #include "intel_gt_requests.h"
> @@ -218,6 +219,17 @@ void intel_gt_pm_fini(struct intel_gt *gt)
>  
>  void intel_gt_resume_early(struct intel_gt *gt)
>  {
> +	/*
> +	 * Reset the steer semaphore on GT1, as we have observed it
> +	 * remaining held after a suspend operation. Confirmation
> +	 * from the hardware team ensures the safety of resetting
> +	 * the steer semaphore during driver load/resume, as there
> +	 * are no lock acquisitions during this process by other
> +	 * agents.
> +	 */
> +	if (MEDIA_VER(gt->i915) >= 13 && gt->type == GT_MEDIA)
> +		intel_gt_mcr_lock_reset(gt);
> +
>  	intel_uncore_resume_early(gt->uncore);
>  	intel_gt_check_and_clear_faults(gt);
>  }
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
