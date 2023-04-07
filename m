Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A39A16DAC18
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 13:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FCE10E377;
	Fri,  7 Apr 2023 11:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D594310E2AA;
 Fri,  7 Apr 2023 11:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680865733; x=1712401733;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=928BRkYn/HBGOi4yBKlYMZL2Zam7G4sD6xPTyH/M7wQ=;
 b=AdZiUMU9bE3o9lys4Nw8pxSs5md91iN8QHWubWYcEx3rEO8UuwUImX0F
 J2tDUvRZcEDdnEkxOvc19rWrltXYqqtysNlo14V7veIefq20gkMTY3uxM
 clXYv7eglOwN9WyYYOp8Ms5QzvXn5chbFsBVupibx8pJeMlOiJdIf1Yh9
 2DJeEnmsk8stcQA2WxnCQEtdX27lH/xtc0FiKFSVbSEREkQGs+ro3lVbe
 mqTOUVu8wOzPXb3LBJjZyZg+4XUbnl3SP69YBpYf4Ut2/gyqO5LHmrGtJ
 YZIjPvVnbwRwZgLS4yKKLdyUuJnA69O4Dn0PW2ISuBl2Zyaxa6zvoS1TH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="323339057"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; d="scan'208";a="323339057"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 04:08:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="687494495"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; d="scan'208";a="687494495"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 07 Apr 2023 04:08:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 04:08:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 04:08:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 7 Apr 2023 04:08:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 7 Apr 2023 04:08:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJ7YHMHOJAK5/NFruL8TjKr0mXADRX8C5L/MNXEhvPVRZmUxfM9WmMchLQjvgo2x2YHaKvDPaAkF8a34roAqInXbSRZ9PqUUZlLrxqWuei3yt54ApIVXp7BpAKx+Ln/SE18d7Z1B93DB+eDqg4l1jWGZZX1uxhzczn3Y8sSz85y4eTdN/xlPpirgXLuHVBDn0iXsDEdrggpe48Iuotzej8m0fcl8alw22U0IrzhuC99MlLhZk2iXXIjJ4vTiC/kuoHBFV665m0HQedXWEm/EL0S0aIv1akOMfqHaSW1IKaGllILfNVY2giw7nb2y13xkiP6nPTOwzbWWhX2HRJUFJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3aoAzVCscGx16lQaA7HRHvbue+eL206niWebvltif0=;
 b=lXYoMDqgMZb8o+9HlG3cjGwA2Guc94yCO8TplcupO5OmvtwYP61DkoW0f4mMePbJWT2NCWbEUkIdgrJq1mW/V8ggOMOC4DEYQck8ViAPAKHJN/WBWQhwwrkbDhnJYNI34bWnM4AKzrlgyZuqZNxn2mLcDB/DSXA/NgxdzD7YPnpRPaANv0SfEWYoxa2pJRU5VmaMwLOZft+6Ye40ovTx69FcgveEa5ZK3sAghZY+Ae984ykDDLF8ngjerIWOUMdqFkJUSV6t8eGFnEJnD5Jcv5sMcx7nel3Oc7odJ/Dxgdl/Jw2ghmjC8nsvlYE8s5+ASriAaLFp7r7gG+uEpjYX6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN2PR11MB4552.namprd11.prod.outlook.com (2603:10b6:208:263::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Fri, 7 Apr
 2023 11:08:50 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6277.031; Fri, 7 Apr 2023
 11:08:50 +0000
Date: Fri, 7 Apr 2023 07:08:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915/hwmon: Get mutex and rpm ref
 just once in hwm_power_max_write
Message-ID: <ZC/5vngItjNcBnxL@intel.com>
References: <20230406044522.3108359-1-ashutosh.dixit@intel.com>
 <20230406044522.3108359-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230406044522.3108359-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR01CA0002.prod.exchangelabs.com (2603:10b6:a02:80::15)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN2PR11MB4552:EE_
X-MS-Office365-Filtering-Correlation-Id: c6873772-edd4-49ff-f425-08db37587762
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pvy2/2JmTvkX6wk57jrkee6i3mtxIzKvmhFb/TOGOLoHrT99jP7LI/FvE6nFU4W77Tj4Xwr+a7u2u6vjDLa6yGWgTlaT9RY67qIpClLKNq4ct0xaAV3EhO65iXiyPeePVUr38kwVCsKJfN2xJTlkxrUuW1OL8xvdzKLMTbaB2Z3XY/sQ3qgA5yvOTqflGtF9so0GepiBNn2FPYUpq2OZBwLdQXHNkTgxKeuU72arCZdOhp5vraFF4osspN2dwqh7GU8GPG4Tm8YRc15crLmGCSavOZw/K2MuB7yQf9Q4KDjKY+hmiUbgffDjOjEWJZosZax25uIhM1SJA3X57mvo9rF5y3v7KZsIpVWSQgKNPluIlmQUfC5E5zNMVKfACdv7HoGWyRJN4PNE2/JyAMfHDZgJvBj8XE3Or9eipEAt/DkIOiAtohqEDsIAHdaN+rh4MXrMVOZweNW5Cj+BoZ32ecgH0Ely+BEL7oqSHZLGGqyjTjtKa89nbzwTrLIl3YYbG2g6qT32H2C+j0E6BuLUrido5k8i0MZuo+9PKfS3R0bjeiJpzGiacjHsL8acFysp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(376002)(136003)(396003)(346002)(451199021)(83380400001)(186003)(2616005)(6512007)(4326008)(26005)(8676002)(6636002)(6506007)(66556008)(6666004)(66476007)(41300700001)(66946007)(37006003)(316002)(5660300002)(478600001)(450100002)(8936002)(44832011)(6486002)(2906002)(6862004)(38100700002)(82960400001)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3St+AV3OGSdvpCp+Z5K/ie65RbWz7ED+zpWfrj+QMLr6I5ga00srIr+/8nrF?=
 =?us-ascii?Q?zvclEnCtGM49aRrge0887mOrUVpj4qylkR3wAjbbSEnoUwF1D8Z/TIduygKj?=
 =?us-ascii?Q?mkDGtrbthnGoJe2DZiGdl6rKN0hNdzL0+VW4T5/YTVbZo/VZM6sV7ZOoxSpt?=
 =?us-ascii?Q?IaKGTEG+TzDurUhhVv2Cm/6Q0CT4LANo9iN6dgqvXUsfH9k4N5vSGoedU2gT?=
 =?us-ascii?Q?dbeJm8hLqat8p9iP1sLC9+0UAMvpHDY32t40fpNamixHRlXPyr3fVXT7ANK4?=
 =?us-ascii?Q?yepy3nsMQ65IYiC6n5k/4+xkAHhR3dHU9mYlPlG8W4SrB8+sEB5TT69isr4w?=
 =?us-ascii?Q?mdgJzXdLY6yj3T1P9ldi2JwPFNGz0l/MPZw3cfezV0p0xqeCQab0jw1adlzk?=
 =?us-ascii?Q?h4tRfo+DXUceG2kEl2yXAcshEJUpZuGCJIuJ6Va5nqhaEA5V8kZ4So533o1I?=
 =?us-ascii?Q?m3ff3a3snsbDHAPWt7OfHCaT4BOG2qgVGatZMLz+SPyPG9JePqXkPNE71YIM?=
 =?us-ascii?Q?wzRrp2MK08u+62gwS5mE26OgEAzlNxlxTvllCx9tKS+7Zy3d+HLxG1Jwu2ZS?=
 =?us-ascii?Q?3RpCHg/LFhJhnV5nQieNCIeMAtbKuD3vT9RiDlgy2JwlCsRTMg60bOSZjSQy?=
 =?us-ascii?Q?h20iHkUsWVKk/9WAVRg9tkMKBL9p5ulUTPmRyTUywq4hzQ+PNqV/7mJcWs8p?=
 =?us-ascii?Q?d5wxTsSSb6xtO75TRUYNvCE2AfzqdghyrbR1l5LiMGmunVj3PHtXFG2JY7ys?=
 =?us-ascii?Q?TcUyTBSbUM90L/J2ZLJRQ2wSSlkxRzTBjyM/BapM92wCzYz4vjATnJ+Cpi80?=
 =?us-ascii?Q?KrTCRCZg1XdoI1NzAtaarYqN+2Ql+S7eF7+GPydzFalhU+kPhyeJHdSl+BHd?=
 =?us-ascii?Q?xQ4itptRrrXEaNUjWdEsbZIopjXl5+kX7mVLwrZC4e7zbxFBS6LhREE+0LlY?=
 =?us-ascii?Q?s08iHJe8nqqt9svqPGXHK4TJSSu6UHZZi9oupbVmAp0mPE9rLVhlq+AoL702?=
 =?us-ascii?Q?m2KksDaG9OHPPKIKGzzDnnylOc0flSkByzdSgpeq6LNywWvB8f1o7SK7Dmp0?=
 =?us-ascii?Q?QpOmzTyA29VhR6hO1Cx72Z7ekAngvU4TJGdV5n1s171cbNDvuP9qPelCyJ63?=
 =?us-ascii?Q?fVYYjqYeNsUzFrniVwltlUsaZC5UxUmIDhsymPtiK2psduO/sc/+iFeaNPgm?=
 =?us-ascii?Q?wfUQlIDxdZ4IEwDURP7IJddKhIP5PrwX3wX1DOm6ozwQ6lvKS/MQwVrko9X3?=
 =?us-ascii?Q?TUVwWk9y9vqC7g4vVcFylHECCICu4w8KPTyQY2bMtMBQJLzi0pep2QVl3hVq?=
 =?us-ascii?Q?L7MnGaYgtq2IwNpBWSlaiuOvCpHXCbRGD0H5vXz2KclZXIk7AgrrHTFLrVBS?=
 =?us-ascii?Q?uoh+KD4LdljIkEV41oZKjPSsyhudCKIkwGvxazztestq87SHzYJAb3JuHcBa?=
 =?us-ascii?Q?mK07ujkn7nNSFLi3vvD+aQOGqURQ038DtIag4VM3R3MbQoZ7a8EwBNTj2+3s?=
 =?us-ascii?Q?pz4u1qeJyeBOfOvkM7c72o3f8iclYERYXygNjh71tNmVDu+QL07Udtw+6iSb?=
 =?us-ascii?Q?T3y1heFh99NtqTrkiI5o7h5EIhDfXHaWbFVByuTioebY0URxYlKp7s7muiWj?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6873772-edd4-49ff-f425-08db37587762
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 11:08:50.6132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0k3upjUsFibIUPtLcpH+id92Q5yRvOjFd+nDn2bSE79I5N+o73rN9kePJ33ztPHVe2INBOCAu+TQUdjjOzgXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4552
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

On Wed, Apr 05, 2023 at 09:45:20PM -0700, Ashutosh Dixit wrote:
> In preparation for follow-on patches, refactor hwm_power_max_write to take
> hwmon_lock and runtime pm wakeref at start of the function and release them
> at the end, therefore acquiring these just once each.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_hwmon.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 8e7dccc8d3a0e..7f44e809ca155 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -396,31 +396,33 @@ hwm_power_max_write(struct hwm_drvdata *ddat, long val)
>  {
>  	struct i915_hwmon *hwmon = ddat->hwmon;
>  	intel_wakeref_t wakeref;
> +	int ret = 0;
>  	u32 nval;
>  
> +	mutex_lock(&hwmon->hwmon_lock);
> +	wakeref = intel_runtime_pm_get(ddat->uncore->rpm);
> +
>  	/* Disable PL1 limit and verify, because the limit cannot be disabled on all platforms */
>  	if (val == PL1_DISABLE) {
> -		mutex_lock(&hwmon->hwmon_lock);
> -		with_intel_runtime_pm(ddat->uncore->rpm, wakeref) {
> -			intel_uncore_rmw(ddat->uncore, hwmon->rg.pkg_rapl_limit,
> -					 PKG_PWR_LIM_1_EN, 0);
> -			nval = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_rapl_limit);
> -		}
> -		mutex_unlock(&hwmon->hwmon_lock);
> +		intel_uncore_rmw(ddat->uncore, hwmon->rg.pkg_rapl_limit,
> +				 PKG_PWR_LIM_1_EN, 0);
> +		nval = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_rapl_limit);
>  
>  		if (nval & PKG_PWR_LIM_1_EN)
> -			return -ENODEV;
> -		return 0;
> +			ret = -ENODEV;
> +		goto exit;
>  	}
>  
>  	/* Computation in 64-bits to avoid overflow. Round to nearest. */
>  	nval = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_power, SF_POWER);
>  	nval = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, nval);
>  
> -	hwm_locked_with_pm_intel_uncore_rmw(ddat, hwmon->rg.pkg_rapl_limit,
> -					    PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1,
> -					    nval);
> -	return 0;
> +	intel_uncore_rmw(ddat->uncore, hwmon->rg.pkg_rapl_limit,
> +			 PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, nval);
> +exit:
> +	intel_runtime_pm_put(ddat->uncore->rpm, wakeref);
> +	mutex_unlock(&hwmon->hwmon_lock);
> +	return ret;
>  }
>  
>  static int
> -- 
> 2.38.0
> 
