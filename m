Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B93DC6EB128
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 19:50:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B207010E654;
	Fri, 21 Apr 2023 17:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C522B10E310;
 Fri, 21 Apr 2023 17:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682099420; x=1713635420;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H5Ju0F5RK+nYVSVLIQFRGIqNHVOf1oqVys9tWNH2C6s=;
 b=K00HJlg2vzYjs7p0TV6OCeiYMPiB84nimyrO1qKwCUr5m+S82q6b7e4Y
 T6++y1x6MtYBJR48SGguwUC/ju82uosEGhJ2MQBfSF+RwZuW9QurRMOft
 Cf853etWPHRAXye84ObakkGLlkcO58OOIPKO5VwUG5/nlFr70jPOV/Gak
 gTEMlc29+769XD+CfeOYMh1Ey0JkJQNVbD6swBpe23WkEax0buTA/pu5g
 0xdIXAAPL2gZnaukDEukjtLmJYK/0WLOlb7tOpdqEFXqQg66sH0j4TG/k
 BGy97ZimFVgeHdv4G3QM58q8sVM+3fP1a4HX07SeQYEtVkgpk4lCXelVi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="346064374"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="346064374"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 10:50:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="642592827"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="642592827"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 21 Apr 2023 10:50:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 10:50:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 21 Apr 2023 10:50:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 21 Apr 2023 10:50:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzyEAW8L5vPLMHn1Zq9fpmm62gz64ectL4tS6s9wi+4YydL6cnIv+QUBW0Gd8lSFkL7M3j84QBnOAQfLLk3cbSHWUxyr3tWpoTPRx+wPdEr3le2mNFQ0W4pU7Vf+cxsq/etgaCYiwdBH7kBJobqeeOmCXXfS0cPugOSKO2txuWV+BFM1F9qFfXDb+yGDYWCndzuZ7oMzpEQte+OmTsbEpgDCL8vdR1baRr3KObcBxSMzv3LYgQ5CQka3xftSqCvGZQPXJzO2DNS+sG1CvaQ7Aej/H1s5RSukrszvnBmk8/arxB38TM0+C9KQ7Sy2I3BGtH+AsJyURajF6c2YStovGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdjXvg1YgMRaBinDtZ3WjtLax3xp0fyovvorfnQ5g1o=;
 b=E/c4FfX5vcP3q6aOH/2rLVsYrQwAAc2gmJ+42dSXbR8ZnDZqpwt6ZKA9xSRLo/45ipBweS08weAFtSVkA48FdahDE3SAKf6WwADebbZrMexL6C46KkY7NuZBIfdKKYjCXEcbC4jefDxHzaZ7VKCMpdUOX8jbpzGE9fc+7LtL3Y2l+4Hh3oR9ndZ71KEs5kLC7WIDF8neo4Rgre6tNjPKNew1kdIxSwdiOLKF0IMWe1195zmpIsMv3StGwHTIdPWC4tqL7JznB4wfkmanKI2VxS1juQM8FTsuU9g1t3oXx1Ip9tlVBgTEhURZTRWNmqMBo8Bp4Up7FDu4v7WyuGDbHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS0PR11MB6494.namprd11.prod.outlook.com (2603:10b6:8:c2::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22; Fri, 21 Apr 2023 17:50:10 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Fri, 21 Apr 2023
 17:50:10 +0000
Date: Fri, 21 Apr 2023 10:50:06 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <fei.yang@intel.com>
Subject: Re: [PATCH v4 8/8] drm/i915: Allow user to set cache at BO creation
Message-ID: <20230421175006.GQ4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230421173801.3369303-1-fei.yang@intel.com>
 <20230421173801.3369303-9-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230421173801.3369303-9-fei.yang@intel.com>
X-ClientProxiedBy: SJ0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::32) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS0PR11MB6494:EE_
X-MS-Office365-Filtering-Correlation-Id: 82d09d49-1dde-44ef-cfb7-08db4290d967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HVemCkqqGIxhtldQTgXQeFyAnUgopibWuMMOS7pTpMzaMIm5K3I6NwoFMzMMWMi2AAE0TtFkOSHbdj0Cb2ecwwq2uT9z8tX+g+Z4JemAgXb6XZ7EVrqZeIRqCeyVSfoYrM6sYK4op1D9Tf9Cwim9cpo9K8o2kty7bbxZZ9qzoMdlxj3jeXzOxzGe3lMsfYB1VZeQzWC/7iAir0eUe2pmG56AyO9ad6wg5yHggVw8UTy9ag63Q9Bz9+vMXXy5FZ/Ev8DqHBxlF0tlb4eRe5Wqfx8E1etr6kfmz4BUFZPQTIK+q0rUHtrSSy+uj3QQPf1XBvhs3PzoNTleMPuM0h0NL86VBBu8W53M8OgiRVL5d82ToY+JWUivGnCCqL0WV85aaYe8DaW21LtQNaj1DovQq871fGTQn4Y7Ws1NWIBPeyTRI5e6s6GFGezSN3j7/kvJcdmep7nFtSbhVfavme8EPFZvhJPINXHuTQxXIJ8FWU2KmCmLDCMY4QOwm9QWG8/9kajuHKbXd/uR9gfndEltrXYIAallUfu0flAO4hS5o2NuDhTD5EsqTIA5bptLcuIF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(39860400002)(346002)(396003)(366004)(451199021)(54906003)(83380400001)(478600001)(6486002)(86362001)(6512007)(1076003)(6506007)(26005)(6666004)(4326008)(6636002)(316002)(186003)(66476007)(66556008)(66946007)(82960400001)(41300700001)(5660300002)(2906002)(8676002)(8936002)(38100700002)(34206002)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0sIqYQYd4EwGQntK1TzvfnIL5t/xKxQ1IjaSSYPp86w3oWrqNS/YihK5gNlH?=
 =?us-ascii?Q?ZAbyFmJI6JQhfSyeS93IQ3u9Wj3VgmgRhhmlo7M9ZdzkT1uFFIvjlFkbfvvB?=
 =?us-ascii?Q?WRBo76r+3ozhfCX3K7rdA/ZNCCpv1/HaudPkmBqvQ0E7WVu2r3yCFNFZUpG0?=
 =?us-ascii?Q?AL0zsN8Ee/P1q8shtKh3W9hlJj0CW4P6wA9HW3ZR+R9HWaMLLdQJoF5tj8D0?=
 =?us-ascii?Q?d/Ach0+J2RL39CcmLv1pC+yB5a5cXaqoP+3t+dVgb6RQ90ve16v7PRZDyx0/?=
 =?us-ascii?Q?Cfl7lGIVhzHO252BUExQW4TeEiQ3faAFjbKFIzelV/2noa9psJWCIbu64Ul4?=
 =?us-ascii?Q?QTFRjpY1fOwdcQGpKgxRbb4x9+0U2AnfgSTTpEELYtaIO1e3xqCjOi6TDgXb?=
 =?us-ascii?Q?rimFpewqfp2PPeeKLMI7P5vj9SK82GjInLZZ0QDv80OJGd2xhj4pCWhD7FcX?=
 =?us-ascii?Q?ufGIt4snFTEiu1tvrRo7+c0A5Y0bZekm1C7KTYZTBr3s8RSJ4FOxkIc4VKqU?=
 =?us-ascii?Q?znx4Vha75rJyhv2BJKhbLhDciTLgaxsJAWr3BOY8GTHnwIwyPK0BhQ8yrUK2?=
 =?us-ascii?Q?xEhwiX+TbVanGeBwYIxK1Xdb84hl3zizPbOB3xcA1D24lrnEnhktzZt0VVPP?=
 =?us-ascii?Q?qMaFreu97ZkN4IV88HY7HtOFLpwrV65Y6RvjhMbSQwXMxivJ0RYkhVfW1fmi?=
 =?us-ascii?Q?0QobTPwz31l8mUZJ/gdT/6TBPuFVAEFj54UtQfONWik+eOa4qbo060J2CA0p?=
 =?us-ascii?Q?blx9P9J7XBSdlxSUxPzhvjjSKF0wWzVN1CrYH4wFi9dewbmFm3TFk+0p/XGr?=
 =?us-ascii?Q?pO1bYYmAhwWAAiXLDj6XNB/UQ0OFvKgCUJrnHgOv5kmEXCRb7HABRLHcbldf?=
 =?us-ascii?Q?CRqbWIgROuI6Y8C6xwFLzd0BdNmuGR2mZ8xN6IJzq4AODK/zUtKNvfxKA3hi?=
 =?us-ascii?Q?d+yyAohco4wx5Z7AQrjxS+u3+K83do0uw0URD9UrWzxa9rGhxhUq1is7ZBJU?=
 =?us-ascii?Q?ENE64EjIpsOKmOO4GE+QLRMbb3zu7jD7Ftb9kY8l+IIwlISSXwHpGfurPzPS?=
 =?us-ascii?Q?r9CPRv/+dLPCMUBIdz7t2o/I1uMzYzKUJa2V3sHqHTAjomac2yDMPYHg6PpW?=
 =?us-ascii?Q?AoAGpas9n5G0gqSUoGH35BW+o3ZNTit0TdlH94T58/QlGqLJiZaktbl4PG86?=
 =?us-ascii?Q?JxmVzSNIwFsHv3YxKVo82QzlT44xGDv944K8+eWbbbKj698g58HEe79wkLAX?=
 =?us-ascii?Q?NOzBjis54VvfrZR6q8hSH8qdMPSTs29ZSnRFe3yPwXXEcVclx1Jjv9eRX1y5?=
 =?us-ascii?Q?ezfhOiy2AICoUKaOkpz3Kb92TAUHAyrd8OopjC4qrVms1rWR4E1mxfhaw0wu?=
 =?us-ascii?Q?G0ckk1cI0teMlShSUMmCuou1Ka6XS9T6aqVTc5tVuIN+3FsTm6NrjChFSUH8?=
 =?us-ascii?Q?5PszcMBgQIv7y01xLOc+RcgLvlU81gBcwFWk9Wr0YiHf/y6+Y+YEEVy/7yRh?=
 =?us-ascii?Q?AzUp/saRpvLgw3nNyiLQoloX6umHI+7BktOQt7D//v2pWnODufIaG+b1Gxhj?=
 =?us-ascii?Q?uB2AVId6UfOZxl2pzH9P74dNIo85h90jHeIOqyiqa1dxL0+es4YrjaoTN5+d?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d09d49-1dde-44ef-cfb7-08db4290d967
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 17:50:09.6992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZN1kEuzp9TvYxOmGaFekAeQmCPv6VFg6wx+j+cIHj9iu59TZUjDzlkwrVS8B2oAmkzXyBIX1cetGW8+KwdJ434iRQGfikcyn+SGw3Aaot3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6494
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
Cc: intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 10:38:01AM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> To comply with the design that buffer objects shall have immutable
> cache setting through out their life cycle, {set, get}_caching ioctl's
> are no longer supported from MTL onward. With that change caching
> policy can only be set at object creation time. The current code
> applies a default (platform dependent) cache setting for all objects.
> However this is not optimal for performance tuning. The patch extends
> the existing gem_create uAPI to let user set PAT index for the object
> at creation time.
> The new extension is platform independent, so UMD's can switch to using
> this extension for older platforms as well, while {set, get}_caching are
> still supported on these legacy paltforms for compatibility reason.
> 
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

This still needs links links to the opensource userspace pull requests
(which must be fully reviewed, approved, and ready to merge by those
projects before we can apply the kernel changes), Cc's for the relevant
userspace developers (we need their ack on this as well), and a
Testcase: trailer indicating what IGT test(s) cover this new uapi.


Matt

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_create.c | 36 ++++++++++++++++++++++
>  drivers/gpu/drm/i915/gem/i915_gem_object.c |  6 ++++
>  include/uapi/drm/i915_drm.h                | 36 ++++++++++++++++++++++
>  tools/include/uapi/drm/i915_drm.h          | 36 ++++++++++++++++++++++
>  4 files changed, 114 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> index bfe1dbda4cb7..723c3ddd6c74 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -245,6 +245,7 @@ struct create_ext {
>  	unsigned int n_placements;
>  	unsigned int placement_mask;
>  	unsigned long flags;
> +	unsigned int pat_index;
>  };
>  
>  static void repr_placements(char *buf, size_t size,
> @@ -394,11 +395,39 @@ static int ext_set_protected(struct i915_user_extension __user *base, void *data
>  	return 0;
>  }
>  
> +static int ext_set_pat(struct i915_user_extension __user *base, void *data)
> +{
> +	struct create_ext *ext_data = data;
> +	struct drm_i915_private *i915 = ext_data->i915;
> +	struct drm_i915_gem_create_ext_set_pat ext;
> +	unsigned int max_pat_index;
> +
> +	BUILD_BUG_ON(sizeof(struct drm_i915_gem_create_ext_set_pat) !=
> +		     offsetofend(struct drm_i915_gem_create_ext_set_pat, rsvd));
> +
> +	if (copy_from_user(&ext, base, sizeof(ext)))
> +		return -EFAULT;
> +
> +	max_pat_index = INTEL_INFO(i915)->max_pat_index;
> +
> +	if (ext.pat_index > max_pat_index) {
> +		drm_dbg(&i915->drm, "PAT index is invalid: %u\n",
> +			ext.pat_index);
> +		return -EINVAL;
> +	}
> +
> +	ext_data->pat_index = ext.pat_index;
> +
> +	return 0;
> +}
> +
>  static const i915_user_extension_fn create_extensions[] = {
>  	[I915_GEM_CREATE_EXT_MEMORY_REGIONS] = ext_set_placements,
>  	[I915_GEM_CREATE_EXT_PROTECTED_CONTENT] = ext_set_protected,
> +	[I915_GEM_CREATE_EXT_SET_PAT] = ext_set_pat,
>  };
>  
> +#define PAT_INDEX_NOT_SET	0xffff
>  /**
>   * i915_gem_create_ext_ioctl - Creates a new mm object and returns a handle to it.
>   * @dev: drm device pointer
> @@ -418,6 +447,7 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>  	if (args->flags & ~I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS)
>  		return -EINVAL;
>  
> +	ext_data.pat_index = PAT_INDEX_NOT_SET;
>  	ret = i915_user_extensions(u64_to_user_ptr(args->extensions),
>  				   create_extensions,
>  				   ARRAY_SIZE(create_extensions),
> @@ -454,5 +484,11 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>  	if (IS_ERR(obj))
>  		return PTR_ERR(obj);
>  
> +	if (ext_data.pat_index != PAT_INDEX_NOT_SET) {
> +		i915_gem_object_set_pat_index(obj, ext_data.pat_index);
> +		/* Mark pat_index is set by UMD */
> +		obj->cache_level = I915_CACHE_INVAL;
> +	}
> +
>  	return i915_gem_publish(obj, file, &args->size, &args->handle);
>  }
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 27c948350b5b..61651f7e5806 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -209,6 +209,12 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
>  	if (!(obj->flags & I915_BO_ALLOC_USER))
>  		return false;
>  
> +	/*
> +	 * Always flush cache for UMD objects at creation time.
> +	 */
> +	if (obj->cache_level == I915_CACHE_INVAL)
> +		return true;
> +
>  	/*
>  	 * EHL and JSL add the 'Bypass LLC' MOCS entry, which should make it
>  	 * possible for userspace to bypass the GTT caching bits set by the
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index dba7c5a5b25e..03c5c314846e 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -3630,9 +3630,13 @@ struct drm_i915_gem_create_ext {
>  	 *
>  	 * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
>  	 * struct drm_i915_gem_create_ext_protected_content.
> +	 *
> +	 * For I915_GEM_CREATE_EXT_SET_PAT usage see
> +	 * struct drm_i915_gem_create_ext_set_pat.
>  	 */
>  #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>  #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
> +#define I915_GEM_CREATE_EXT_SET_PAT 2
>  	__u64 extensions;
>  };
>  
> @@ -3747,6 +3751,38 @@ struct drm_i915_gem_create_ext_protected_content {
>  	__u32 flags;
>  };
>  
> +/**
> + * struct drm_i915_gem_create_ext_set_pat - The
> + * I915_GEM_CREATE_EXT_SET_PAT extension.
> + *
> + * If this extension is provided, the specified caching policy (PAT index) is
> + * applied to the buffer object.
> + *
> + * Below is an example on how to create an object with specific caching policy:
> + *
> + * .. code-block:: C
> + *
> + *      struct drm_i915_gem_create_ext_set_pat set_pat_ext = {
> + *              .base = { .name = I915_GEM_CREATE_EXT_SET_PAT },
> + *              .pat_index = 0,
> + *      };
> + *      struct drm_i915_gem_create_ext create_ext = {
> + *              .size = PAGE_SIZE,
> + *              .extensions = (uintptr_t)&set_pat_ext,
> + *      };
> + *
> + *      int err = ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
> + *      if (err) ...
> + */
> +struct drm_i915_gem_create_ext_set_pat {
> +	/** @base: Extension link. See struct i915_user_extension. */
> +	struct i915_user_extension base;
> +	/** @pat_index: PAT index to be set */
> +	__u32 pat_index;
> +	/** @rsvd: reserved for future use */
> +	__u32 rsvd;
> +};
> +
>  /* ID of the protected content session managed by i915 when PXP is active */
>  #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>  
> diff --git a/tools/include/uapi/drm/i915_drm.h b/tools/include/uapi/drm/i915_drm.h
> index 8df261c5ab9b..8cdcdb5fac26 100644
> --- a/tools/include/uapi/drm/i915_drm.h
> +++ b/tools/include/uapi/drm/i915_drm.h
> @@ -3607,9 +3607,13 @@ struct drm_i915_gem_create_ext {
>  	 *
>  	 * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
>  	 * struct drm_i915_gem_create_ext_protected_content.
> +	 *
> +	 * For I915_GEM_CREATE_EXT_SET_PAT usage see
> +	 * struct drm_i915_gem_create_ext_set_pat.
>  	 */
>  #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>  #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
> +#define I915_GEM_CREATE_EXT_SET_PAT 2
>  	__u64 extensions;
>  };
>  
> @@ -3724,6 +3728,38 @@ struct drm_i915_gem_create_ext_protected_content {
>  	__u32 flags;
>  };
>  
> +/**
> + * struct drm_i915_gem_create_ext_set_pat - The
> + * I915_GEM_CREATE_EXT_SET_PAT extension.
> + *
> + * If this extension is provided, the specified caching policy (PAT index) is
> + * applied to the buffer object.
> + *
> + * Below is an example on how to create an object with specific caching policy:
> + *
> + * .. code-block:: C
> + *
> + *      struct drm_i915_gem_create_ext_set_pat set_pat_ext = {
> + *              .base = { .name = I915_GEM_CREATE_EXT_SET_PAT },
> + *              .pat_index = 0,
> + *      };
> + *      struct drm_i915_gem_create_ext create_ext = {
> + *              .size = PAGE_SIZE,
> + *              .extensions = (uintptr_t)&set_pat_ext,
> + *      };
> + *
> + *      int err = ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
> + *      if (err) ...
> + */
> +struct drm_i915_gem_create_ext_set_pat {
> +	/** @base: Extension link. See struct i915_user_extension. */
> +	struct i915_user_extension base;
> +	/** @pat_index: PAT index to be set */
> +	__u32 pat_index;
> +	/** @rsvd: reserved for future use */
> +	__u32 rsvd;
> +};
> +
>  /* ID of the protected content session managed by i915 when PXP is active */
>  #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
