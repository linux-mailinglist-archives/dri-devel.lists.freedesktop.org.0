Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2481B75D5E1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 22:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4537A10E701;
	Fri, 21 Jul 2023 20:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63EE10E6F4;
 Fri, 21 Jul 2023 20:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689972092; x=1721508092;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fDcY9/PoZRaEdjmEeSz7UiyxRktRCO+KYMuqw5dBOtc=;
 b=dXgmJGd8+lOrUf/oVcohCIC1fOSyo1ZFb6nGFtZZ2cB55hjLiCCYXVpC
 7we7ie/9sD22Ucsk51YUlfJARDLYbTSc2u1lVKEjkP5Uu8s7p4dmbRu+2
 01HBMNxJCjpY8/gPdmsdgVXp/xlb80XG8IFcJmtm0SzmamO08N5Re3Krl
 TjBlqvFxFPoGuFtIk3WXz+twW2qZ93EnO2QpivrMlgtylELD8fnxcDOFB
 WlhH4z7zTxD5IlDkZTu6uqX0PZX/aUIaM+1ZOFJWgjfCRWW9VUbXwkGzq
 hmVbw2Uu7//gGFNxyJnFnwHDrQ+mLSlr+Q1NKiUGlC8PXsZPsWTO2IHVW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="364576314"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="364576314"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 13:41:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="754622641"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="754622641"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 21 Jul 2023 13:41:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 13:41:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 13:41:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 13:41:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 13:41:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/PNCwhAf/Qw/Jf87HfKfNSakHPgZ6NpEje5L5QTFcEI7uod+hwdkZ50JvJ2n79gdCKwcNkO5AtPWalnYMQC3z9XS3FuL/BgvVJlfc2rUb5KMFgB+XtpC5PriXIfHhR7ShdW2iIoC2dqIRP6OA8ItWSXs3IYWdXOs1eyVb05FpTDIV7QBRdjf4FDcYWm13RGm2tCcPjNH8VpA37WUfuJYSovceWeK6CAMcddSkw0IslYIJ12D3WWSaqaRK+6Y41YyaWspeqiEbGlWxt+Enpw/aBJLMqd7gpb0pteI2Pfd90zm/lPDSoSuZcLWWNCXhr1H+BmNUgva+Th67lGGSYI7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIHb3MqdV0jI+3Hxk9Ixg9t2LIPZq+fCN0ARp9uRLRQ=;
 b=UvRPr/qWRH0UL6nrGFWFYWGlnX1OfmYunIkVbXSP6z/FKhGiXBEkU5waayTEhRT48VqW0dGFYs1AQaTR9Q/8JGJI7UPfkE5vdTc7lXSrsU1SchX2Lrtov1AdgOR9y9Qek1LCvLQd/hkYTr9v52+b6pLUKs2MNg3U4Q6lqEb150WjPbrhm03TvbcdfUOP69KXMglPdchwCL548B6dv+YS6wHFUvnfbYynLbNLHO7+POKHFeX8/fjcpyZIYGd+AeN5tF1ZCf6y6JCtBKqLHHFq7sUTgZlW9NjRM8ixWTpX4tOTWjBPgamIwAsRjwVoVg8xgsP36S3mrM96bVcl2eN+7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5300.namprd11.prod.outlook.com (2603:10b6:610:bf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 20:41:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.024; Fri, 21 Jul 2023
 20:41:28 +0000
Date: Fri, 21 Jul 2023 16:41:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH] drm/i915/guc/slpc: Restore efficient freq earlier
Message-ID: <ZLrtcwN1TkUk/yxf@intel.com>
References: <20230721180349.1737284-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230721180349.1737284-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: BY3PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:217::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5300:EE_
X-MS-Office365-Filtering-Correlation-Id: 11969de7-957d-46cb-1032-08db8a2adb68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rkzZDi61AMTnRmmPZjawtAm4wrlfcu4sPn+9dxKSZQHa0l70hEi/k4Z28pjSnaX1Mqt8JwKjuikNInlh7w+QIGSQQ9bYvOTdJNVnI/ApoXAcA+BT55A5U7QDZvjvf277aIef10GFD02/jmxjYfrEXjLiSC2RFA8o8LkcJBt4kBYPA6q6XuYZHgzRKjOY7Es68jjqjE6klwezkw7Y56KyX/xdkhn3OUYep9NbJ6y7ocQWmfit+DopO/TTUGbv0AX/btLQ0hYt+YE3avALbrNZ41wMcGd8esAaln0guURdr8KO0x+rq/I+i91EP4rdpejdYvl9XfrC/g6lJLJZlPVSxv5jjiBd1a4n2FWjTQ/DxxPvqXui4IZD0vtJJyNGIv56AYDqle13xI2qSv2WssI8PhUk7ngFY8W76wlK03DGSL7em+jouhpUVSnKoXqNh4G+1B+83r3omx/LSK5dGvJrc3odpCtDfAlKL97h30UEkkqcayGtt+oJdPYibPAYAUYA8gxMLt9TNW1RIYBUTsY+U9L2Zu2P1KS/GmDiBOo6Qmc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(346002)(136003)(366004)(39860400002)(451199021)(2906002)(83380400001)(2616005)(36756003)(86362001)(82960400001)(38100700002)(186003)(6506007)(37006003)(41300700001)(26005)(316002)(4326008)(6666004)(6512007)(6636002)(966005)(66946007)(66556008)(8676002)(8936002)(66476007)(6862004)(450100002)(478600001)(44832011)(5660300002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pBZpXWf2NTcSjN+p7sDyZW8O6bw6e2lJ/0fMuw1GUGygO96axyIZhewxHRn4?=
 =?us-ascii?Q?SxuwHbE7qIgnj8N0xZCf6jfhv4c5Z5urohQdP8mlliB4hkS0t+cYBQUP3C6U?=
 =?us-ascii?Q?w4av+98XaMHsPrcn3vd4kFFJpWhYCO0XHZqVE2IS9rIgcdvgAwcU00lGE9TY?=
 =?us-ascii?Q?O5fF1erPh46s1ZchYdYfURCMI9kZiSKzhTMKqWjlQXd3NgeAel81/jVmuH6H?=
 =?us-ascii?Q?fpCIXZwCZ+vHVULXa6DjWrltZw7QgjTju47Xe/SzO0lg2AkDpUOCldj2XrkX?=
 =?us-ascii?Q?ohg86C//RkKwHth3sBHQlRhdweCmZ3NlNasdgO3aANyAH+M6fa2KHenes0Vp?=
 =?us-ascii?Q?ASS+SWcfh1WOY/mjMLyujWC/Vvk8M58ifHH2jaMU/URzRoJIJkhuvxbD+zsX?=
 =?us-ascii?Q?hZgFF+mOkj31AcVHjrMSXAloaY89pAPoUj/WFQYTWdfdVljMA4wxuuU5j5Qm?=
 =?us-ascii?Q?rtU/WBvzaoFH4Tnz3kWzjmSPrtUuwBxS/XVmNKdTEw8hYq05mHGBwE8rlDIO?=
 =?us-ascii?Q?Dt3SJeQgSf+6z+eFDkzSAB6eAQcLNslnvFqZAbBNyzJnQeBgODh2Fm0ggc4i?=
 =?us-ascii?Q?l+5oYjp6rGYc9u0LvYwcJXOsqSQNUjyfYFVuF4ITAngAOlQ4Af6IwI+LlSFk?=
 =?us-ascii?Q?OAM3OPKb4/pXWuXeS3UfdwCmZLaE3RK14kE5lAkP47GLvSAELLW6MFm6YyKy?=
 =?us-ascii?Q?Kw/3HidVd0UxO5buM8x0DIPprBRuAFW0r4imA43/V/bjsFbQSBe8Q6M3OUOB?=
 =?us-ascii?Q?z7ceYqDKvXcPURUSnwExbc2t4X/8NUaqEUrzqajnbbSQBWJP/mf4n4d3Qfq7?=
 =?us-ascii?Q?yjTbTs6s4sQpkOMCfEspiFq/WSonytuh1cVVRdxoitwNwwhvc2rwB0yKoLe1?=
 =?us-ascii?Q?sTfa/Ra8GLoLjs+Ek6WaV6HiGqfUchrHnSiqwtSQvF4Y1NFwnPoZlrDeXidq?=
 =?us-ascii?Q?US6mJYJxhjrh2j7MeeXqI6gHninsPMFrR2ch7fSbm96MFv5RaTilGaO4kBYf?=
 =?us-ascii?Q?GMOIDVRS1PFUNVIODk/ztighv5ssP3sHMah7X1v1EKqsTL7J8PxH9f734dDB?=
 =?us-ascii?Q?YeTD0wxciqC1qI1E7vovtefEtXPFU5Ov7ycelSjsiQTltpBNdXqINRYLWJBw?=
 =?us-ascii?Q?n5l+vpRw5vJGZtP/J1WBjIB1uDNLap/92TD7NS0zoo2J79LSDUflAp5MJ6Pe?=
 =?us-ascii?Q?8HKGQIDM7H9BDNVio1gRZw7iYGbjRAFl+w11TsJlt7TbnBg8ahShWMZmITn9?=
 =?us-ascii?Q?IAUupPOSusQ/3zPS6elSNtlX8rAi+omXiQWNttIY7+DR7M5NdXJ+J9ECRokS?=
 =?us-ascii?Q?HxwkQc8zxbfdyiE1FGzMNGM6JGh+7jrbtg95VUoNMBaHHDelAr67JGULzzZ0?=
 =?us-ascii?Q?8ZDt4X3lQaCIg98rGf1GnHk61cJNyTC1h+X8uGh2Lj5kj6+EOgb9CI52+o/a?=
 =?us-ascii?Q?UdgRSPdxEV0II5Zzx2gdsO5VGPyP/eAa55RFVvGbVp+CA/GrtvyMPChHwOYt?=
 =?us-ascii?Q?oTHLhesBnL9tgP17gbamqMStsqneU+6dzv1S1jvDM2qETRUzqmqfarplkODD?=
 =?us-ascii?Q?wgCYNEIBw9L0Xq79zC8smea1iMysvEU+A1UtX7mS/xwxGwTDnZFgEvqBgfCi?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11969de7-957d-46cb-1032-08db8a2adb68
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 20:41:28.8191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWNC3jsZGuTmui3UCJMke1e7GAmxQi1sUr/XjMiEJ2cLsiQyPEdMpKCS5pFKLhbbcobUqBGPZkJG6seS+yY1GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5300
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

On Fri, Jul 21, 2023 at 11:03:49AM -0700, Vinay Belgaumkar wrote:
> This should be done before the soft min/max frequencies are restored.
> When we disable the "Ignore efficient frequency" flag, GuC does not
> actually bring the requested freq down to RPn.
> 
> Specifically, this scenario-
> 
> - ignore efficient freq set to true
> - reduce min to RPn (from efficient)
> - suspend
> - resume (includes GuC load, restore soft min/max, restore efficient freq)
> - validate min freq has been resored to RPn
> 
> This will fail if we didn't first restore(disable, in this case) efficient
> freq flag before setting the soft min frequency.

that's strange. so guc is returning the rpe when we request the min freq
during the soft config?

we could alternatively change the soft config to actually get the min
and not be tricked by this.

But also the patch below doesn't hurt.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
(Although I'm still curious and want to understand exactly why
the soft min gets messed up when we don't tell guc to ignore the
efficient freq beforehand. Please help me to understand.)


> 
> Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8736
> Fixes: 55f9720dbf23 ("drm/i915/guc/slpc: Provide sysfs for efficient freq")
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index ee9f83af7cf6..f16dff7c3185 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -743,6 +743,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  
>  	intel_guc_pm_intrmsk_enable(slpc_to_gt(slpc));
>  
> +	/* Set cached value of ignore efficient freq */
> +	intel_guc_slpc_set_ignore_eff_freq(slpc, slpc->ignore_eff_freq);
> +
>  	slpc_get_rp_values(slpc);
>  
>  	/* Handle the case where min=max=RPmax */
> @@ -765,9 +768,6 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  	/* Set cached media freq ratio mode */
>  	intel_guc_slpc_set_media_ratio_mode(slpc, slpc->media_ratio_mode);
>  
> -	/* Set cached value of ignore efficient freq */
> -	intel_guc_slpc_set_ignore_eff_freq(slpc, slpc->ignore_eff_freq);
> -
>  	return 0;
>  }
>  
> -- 
> 2.38.1
> 
