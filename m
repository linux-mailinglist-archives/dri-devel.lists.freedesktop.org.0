Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 384519A9238
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 23:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09AF10E5A6;
	Mon, 21 Oct 2024 21:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="esnU+JYo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED6210E07B;
 Mon, 21 Oct 2024 21:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729547181; x=1761083181;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gmbMEVzjJeK+sPOhpmhyBrpEwlbK0mZNGQj5c4LdUl0=;
 b=esnU+JYo/5HALLl7BlozXa8B3h5j+BHuHM5CYn0o7TotiBtk2q+1v2Yw
 jnskjXRwuFG7K7FZddgFWlfTDaP/ajzMWed4PgIAydWjdfYKJ5KEX1Rny
 f3eLGztdwQowohoB4KEPCHI8DcH87JEaZNf/OBr54FHWfdxbP1ioWsmRS
 tVXQwXkaJYqk7XEzMZVbQUEiG99GZXTZU44n0Yk+LJdxjzKYWOClJbVH2
 A1CrvSBqUb5E5xGr3WrUvg7wC2aj0defKDe9KXc4Kwk5G6waz0fM6ruV6
 3c4aW5CDmvdSMx4fjQbe2cWfGK5/fSaCgfun83YM7Edte3re9YlooT/t9 w==;
X-CSE-ConnectionGUID: A0gzoA7mTvuYMBUh9+ez9g==
X-CSE-MsgGUID: DJd4bQZOQ8Guldp1T5UmBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="40441409"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="40441409"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 14:46:21 -0700
X-CSE-ConnectionGUID: JFzUCOpoTe6tn/mVnYwNqQ==
X-CSE-MsgGUID: 3bgddxuMSU+Jq/vTWvhx6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="110493088"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 14:46:20 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 14:46:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 14:46:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 14:46:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fAHVHty+qAPIVJliZAtk/BL04dhW6KaFFIdBl1Rs2HIi47yJDWoywfdPjrRD4G15u5VYFYKU8VaJxVoIHA+SlczD8NHqnWSVWOrO5Kzo3rv2JilY+Japwh/4qfArqzy/pO+jhO3s3NJ3cSumjqiyfYv06SgaGpHn/7whF4pED7LFdRYL6/4VygA9MIKAABR/vvCEbTTRezSl59belJSbbb6cK9W93CGBNFEAvv7QlzUZcYq4L/YAv5Mu+qe26eG8KEoyvEqPUuM8JC3FFaA3KhdKyv+pYECFHMo9Wi1Nb4IjVoml10Fu39P7PhS8oWLvzoJdWI6lZDE1wWhzH4jEcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTfKzX/JVVQsRpBCnNQzP3Ce0hmRh2+brZueOs3tMbg=;
 b=Q3NJgS6Icgrf95jP3X12d/NQEBDvULtLIVRfcf0i7nmMGafNE7wixUIht7RMmdEzO/AblWKL9xatuiiFEKREN2ADGSkDafDYcxFZTQsPU64RbB7pffmxE7A87iwE3IVlZyY5qDes3F7jPn2O5Ku6kg9HcAceOWdwBztxzDfwBPKdz6nImDZypimW/wTqunfxnjn0c0l+8457JP9kcXUpibOzB3ryTR/rxeoYv3FfVrOJgR1aOl5ZUM8hfbQXsPmYI/XitQTDsUnrNdgrpUJsgwFur1pDnVuWF+NvvqzRsfkfoePunQXRdoEw6JhOUkCHlNTTYnO7hEqwAUETutG7FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4954.namprd11.prod.outlook.com (2603:10b6:806:11b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 21:46:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 21:46:15 +0000
Date: Mon, 21 Oct 2024 21:45:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <mika.kuoppala@intel.com>, <matthew.auld@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 5/9] drm/xe: Update xe_ttm_access_memory to use GPU
 for non-visible access
Message-ID: <ZxbLZ9OncvpzlAgz@DUT025-TGLU.fm.intel.com>
References: <20241021211835.1675640-1-matthew.brost@intel.com>
 <20241021211835.1675640-6-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241021211835.1675640-6-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR13CA0088.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4954:EE_
X-MS-Office365-Filtering-Correlation-Id: 06b25182-eb4e-44c6-cf8c-08dcf219c98d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+JQyuYPYllsGhiAid8ulkZ4s6aa4nUH7cPkWwvgBrJwxFeUdZCT5K/ZJbW+7?=
 =?us-ascii?Q?Yf7z5qU5i8R3HQliy04739JJlktcL7hRK5ubNaYje3xuX/knDKh1+K6Be3+l?=
 =?us-ascii?Q?bIqjKBLhk9lOQCy47cJz1M3W3fJxrqvvdDSh0M5Iq5ugphcMtYqiXi9guPYd?=
 =?us-ascii?Q?i3h9LvIKJbLaiEhuNgO2KjyWaK6m1SD1WA35Fg/2B4ZuA82a5VROdkcS0NIv?=
 =?us-ascii?Q?qRRmrJWk2HmJGnSpkxpbIo8Jh+MWodFFiFBN7bHoFK+7I6RIKeYFFZOmWMnx?=
 =?us-ascii?Q?AkgMxFDBaJh2nSsy9B6uMoVVMCVp1ksq9QboAFu0R2YXOFtWmOZduT5n4end?=
 =?us-ascii?Q?EIpJ8xflFwLVNMBEPUitO2OKp1IPt2RIdtgOZuexsdSgsu7g1qtF/x9kSddD?=
 =?us-ascii?Q?YJ1hvb5MwT8QxW6HFAXclI78Hth9jGRbJXpxDGw3MtmENGhwloWQDzfAUYkQ?=
 =?us-ascii?Q?ZBqiUSVV4gWt1Y9vKjW83xSMuYOL7eG3f4yK4tKuGudLLGJwFxRqGuTDBFru?=
 =?us-ascii?Q?5DLVXVTkhpSFYGFMCRSzBm5BnJ8BmmN+VLQffpNiWhBPgx41w10NaKLCby+Z?=
 =?us-ascii?Q?Zc5U6p5EcYVsbxwUuvLDV+tkhU99Eul8gOd2hkAljwoWoeAQc2G9Wj/FIsPr?=
 =?us-ascii?Q?B08kwWeO3q00LBRyk2VJQ7ywRbH1rJn1m9vrD127R6jKjZA9SfWZlbIJAvP+?=
 =?us-ascii?Q?3lalKgdqVYLS77EB+dZEP7aDpEDsROQgW/HbCxPQMwYqgvwfFP9Gfo0dcC5P?=
 =?us-ascii?Q?GMlUqrcqs6w41UglBElvq1oYDJQqc3k+UfcEnqg/vyZ4dpk5XotxUZ0icMHl?=
 =?us-ascii?Q?Pmo21fcd469VrzhHlFc1E6q95bKIljEnH6qAsfuG87P3D7pkw1BE4Y1Oa2+A?=
 =?us-ascii?Q?pj6LdFNEJyjfpdvk9RLOLqKca98iOJZA9Zw+E81VOpe5is/vmyS3aU3gNRGU?=
 =?us-ascii?Q?oIxmT7o4y8/WigbGNa639Cmy8QEXPVW4En+QZUPtsR23lqa2zEfBk45lqB+v?=
 =?us-ascii?Q?+Ujg7M6fQIz3UsE0ES6LEF2NdMbsuZUNdxkSLJ9UyBBkgDqaYm2qhgXa2rXi?=
 =?us-ascii?Q?T2B2MEebw8qB6n4N0VjH8dtBlGNmOg7OvhJr1xKkPxz7aysboppZ1mBzYUp6?=
 =?us-ascii?Q?UhSjg7KsOcatvcU0wRoj9t/bIlZpNgfFFYeXCU3hOzgFzI3RVZGGNM7y3bBo?=
 =?us-ascii?Q?TAYXvGYL43vEa0yqCT1uo1IzJWicPhaZvV5p0J7Kwegn+Uab0hO59Lp7PvlB?=
 =?us-ascii?Q?7QFL39M3WD7A/y24E8wUCfJyefHyvrH8up1qq8zL/ZolmAcmCvAjH9pR/hIT?=
 =?us-ascii?Q?9jI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0DQoGzDIVo3Dr5QT25LC/gKhSUjQZIh7xQNJKGVcSff/9P1QBRVsj5dBJoUl?=
 =?us-ascii?Q?sEb5g19OIEs+6txwvBzuhk/Zy7wihrn2lXX2AJqRStM9ETrYXlSCG8+d2RRF?=
 =?us-ascii?Q?H4i8FKzl9p/Y5RSMTSpjLvP/w12lPDbB/bAdau9BOWzmoolgndqt3TyuITLY?=
 =?us-ascii?Q?9uL+qUI3h93zYvqeAyqOIuBb8ru9j3+ha1xjiFoyDVFyC7ee49EcRPvyxpun?=
 =?us-ascii?Q?00YqtfvypKWN9GQpfN4MB0JSonetM8eC3meLXc0IXl2cRsWGmM8tjENoSH4e?=
 =?us-ascii?Q?seh0w0KSmm4T3UimNSHuwiuT8XKZu40jDQg8w84ApDw3wqdOiqbFglRQXVMS?=
 =?us-ascii?Q?2sS4v++lvoNzhW1PTCOPqRdCja9+ZF4YyIkPPNPdQlnFIGhzVMFrK3cRGi3x?=
 =?us-ascii?Q?uJdhSCJzaUbujFon9nGDLcMTUkKqcgZJJptBmJUCKfBXiRnNmoFcEKVZ8cy5?=
 =?us-ascii?Q?oCg2tMVo7jTHVuz11jlGFQvdOWHcrB0hw5i0zU/VjAxmhPps3h6OK5qQSyj6?=
 =?us-ascii?Q?LHswFNa1WqiwqHU3XvfNZ6lRErIxi2VfZqxPEj5eRtn6FzyY/9ReFnUuK826?=
 =?us-ascii?Q?KkwhxF/LcSmBndwhxrweSap9N5tshUpI9fblVvkXxCFO4u9KA9I/QcreVKr0?=
 =?us-ascii?Q?BP9NttCkTpZtfRgc4b6lD16LYjgvHsUZPfqutEEIY3gaF+5dsKNwZTDcjoT3?=
 =?us-ascii?Q?p5MBXycbesNoixRH16YrbwlPQEhaCKOobyJIGzDJI1d950QEY5pjcwER31LE?=
 =?us-ascii?Q?NMEwK5nxdUDE9F4roTzZnaSnND0+6donG4ovFPMwWJpTxVt26fGQkg1PMvr7?=
 =?us-ascii?Q?R6kg9C6zD0SefZ+Dwaapm3RQNT5wAC9dhbth1eB/DJwsjMMcVJyRI9e8zuzg?=
 =?us-ascii?Q?4LUvd7rI3XkJruFLIv/FNEWErAd3ApWG9m9nxsXL3kzABGgqJfqBlQYpjd7y?=
 =?us-ascii?Q?GGjjA5XzPuPlfx75MnGhUpw8EknD3oWdlHhoFYFIc8m7GZjUr0GmQ1eNeUuA?=
 =?us-ascii?Q?89waCsa3I0SkMLJQP4TXqmVzMZvQgI3TNLHmKgPCkd8Kb7n91sBHvUf+CTMF?=
 =?us-ascii?Q?r4V5alqV9rx9U+lIi3EArOAZxzhrcKbTyk+o0e9/e/Xiy5LUeSZNvBWN/Ge5?=
 =?us-ascii?Q?SIClzV4vlCO3g2fVNGzHvQSVAGuik4Kb+cR5H8stvj8k3NaBkFG4mNxihjbQ?=
 =?us-ascii?Q?WVL3lK7yS+tPqCXjSWNb40zGFSxt3m1EO8R7oLBLpHF03lyPK1lkJLu0E41J?=
 =?us-ascii?Q?/kMgJpeH8y+mKgQdj37Rf+pleQjFmbTEc+ugfbj5SkEjDp0XtpTfXvNceaE1?=
 =?us-ascii?Q?uX0e5H6Fj1rR+GOoFSvCuERDeJouRtim8dQsq3meforvV3cTl09tWqL9elnx?=
 =?us-ascii?Q?gFGuPNFfpPa52iobhB3xuWtqWNpKR0ZvTQTE4h7tXuBTztcTyKe+gGFYLfmM?=
 =?us-ascii?Q?fVpjnOYdRPsbzGwCV3arGS5LijaRj4KsBeJL6i33yP3k1GqXeRmy0Aw8z3+j?=
 =?us-ascii?Q?SU98kcgSYrUcp96uXjcgijgmxJYB4UlHJBfO89UsBEFRFZxiRBDjFXNowtFi?=
 =?us-ascii?Q?80/HjaBaydX61NNwCrsA15SkAIt474vXUbzQcDz2onwquk32TBN3rV5zy/W8?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06b25182-eb4e-44c6-cf8c-08dcf219c98d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 21:46:15.0664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7WFMQn5zs3d6rn+79x4lh/aMxb2iBqNN/MRTB/I0gqXKc0frsMqu4IRBfYzrPZwEynNPCkHcEp7fxqZEEP4vEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4954
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

On Mon, Oct 21, 2024 at 02:18:31PM -0700, Matthew Brost wrote:
> Add migrate layer functions to access VRAM and update
> xe_ttm_access_memory to use for non-visible access and large (more tahn
> 16k) BO access.
> 
> v4:
>  - Fix non-page aligned accesses
>  - Add support for small / unaligned access
>  - Update commit message indicating migrate used for large accesses (Auld)
>  - Fix warning in xe_res_cursor for non-zero offset
> v5:
>  - Fix 32 bit build (CI)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c      |  15 +-
>  drivers/gpu/drm/xe/xe_migrate.c | 325 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_migrate.h |   4 +
>  3 files changed, 340 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 04bc042f3bc7..4e1f54aad5bc 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1127,6 +1127,7 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
>  	struct xe_res_cursor cursor;
>  	struct xe_mem_region *vram;
>  	int bytes_left = len;
> +	int err = 0;
>  
>  	xe_bo_assert_held(bo);
>  	xe_device_assert_mem_access(xe);
> @@ -1134,9 +1135,14 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
>  	if (!mem_type_is_vram(ttm_bo->resource->mem_type))
>  		return -EIO;
>  
> -	/* FIXME: Use GPU for non-visible VRAM */
> -	if (!xe_ttm_resource_visible(ttm_bo->resource))
> -		return -EIO;
> +	if (!xe_ttm_resource_visible(ttm_bo->resource) || len >= SZ_16K) {
> +		struct xe_migrate *migrate =
> +			mem_type_to_migrate(xe, ttm_bo->resource->mem_type);
> +
> +		err = xe_migrate_access_memory(migrate, bo, offset, buf, len,
> +					       write);
> +		goto out;
> +	}
>  
>  	vram = res_to_mem_region(ttm_bo->resource);
>  	xe_res_first(ttm_bo->resource, offset & PAGE_MASK,
> @@ -1160,7 +1166,8 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
>  			xe_res_next(&cursor, PAGE_SIZE);
>  	} while (bytes_left);
>  
> -	return len;
> +out:
> +	return err ?: len;
>  }
>  
>  const struct ttm_device_funcs xe_ttm_funcs = {
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index cfd31ae49cc1..05ade498f559 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -669,6 +669,7 @@ static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
>  	u32 mocs = 0;
>  	u32 tile_y = 0;
>  
> +	xe_gt_assert(gt, !(pitch & 3));
>  	xe_gt_assert(gt, size / pitch <= S16_MAX);
>  	xe_gt_assert(gt, pitch / 4 <= S16_MAX);
>  	xe_gt_assert(gt, pitch <= U16_MAX);
> @@ -1542,6 +1543,330 @@ void xe_migrate_wait(struct xe_migrate *m)
>  		dma_fence_wait(m->fence, false);
>  }
>  
> +static u32 pte_update_cmd_size(u64 size)
> +{
> +	u32 dword;
> +	u64 entries = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> +
> +	XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
> +	/*
> +	 * MI_STORE_DATA_IMM command is used to update page table. Each
> +	 * instruction can update maximumly 0x1ff pte entries. To update
> +	 * n (n <= 0x1ff) pte entries, we need:
> +	 * 1 dword for the MI_STORE_DATA_IMM command header (opcode etc)
> +	 * 2 dword for the page table's physical location
> +	 * 2*n dword for value of pte to fill (each pte entry is 2 dwords)
> +	 */
> +	dword = (1 + 2) * DIV_ROUND_UP(entries, 0x1ff);
> +	dword += entries * 2;
> +
> +	return dword;
> +}
> +
> +static void build_pt_update_batch_sram(struct xe_migrate *m,
> +				       struct xe_bb *bb, u32 pt_offset,
> +				       dma_addr_t *sram_addr, u32 size)
> +{
> +	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
> +	u32 ptes;
> +	int i = 0;
> +
> +	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> +	while (ptes) {
> +		u32 chunk = min(0x1ffU, ptes);
> +
> +		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
> +		bb->cs[bb->len++] = pt_offset;
> +		bb->cs[bb->len++] = 0;
> +
> +		pt_offset += chunk * 8;
> +		ptes -= chunk;
> +
> +		while (chunk--) {
> +			u64 addr = sram_addr[i++] & PAGE_MASK;
> +
> +			xe_tile_assert(m->tile, addr);
> +			addr = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
> +								 addr, pat_index,
> +								 0, false, 0);
> +			bb->cs[bb->len++] = lower_32_bits(addr);
> +			bb->cs[bb->len++] = upper_32_bits(addr);
> +		}
> +	}
> +}
> +
> +enum xe_migrate_copy_dir {
> +	XE_MIGRATE_COPY_TO_VRAM,
> +	XE_MIGRATE_COPY_TO_SRAM,
> +};
> +
> +#define CACHELINE_BYTES	64ull
> +#define CACHELINE_MASK	(CACHELINE_BYTES - 1)
> +
> +static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
> +					 unsigned long len,
> +					 unsigned long sram_offset,
> +					 dma_addr_t *sram_addr, u64 vram_addr,
> +					 const enum xe_migrate_copy_dir dir)
> +{
> +	struct xe_gt *gt = m->tile->primary_gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct dma_fence *fence = NULL;
> +	u32 batch_size = 2;
> +	u64 src_L0_ofs, dst_L0_ofs;
> +	struct xe_sched_job *job;
> +	struct xe_bb *bb;
> +	u32 update_idx, pt_slot = 0;
> +	unsigned long npages = DIV_ROUND_UP(len + sram_offset, PAGE_SIZE);
> +	unsigned int pitch = len >= PAGE_SIZE && !(len & ~PAGE_MASK) ?
> +		PAGE_SIZE : 4;
> +	int err;
> +
> +	if (drm_WARN_ON(&xe->drm, (len & CACHELINE_MASK) ||
> +			(sram_offset | vram_addr) & CACHELINE_MASK))
> +		return ERR_PTR(-EOPNOTSUPP);
> +
> +	xe_assert(xe, npages * PAGE_SIZE <= MAX_PREEMPTDISABLE_TRANSFER);
> +
> +	batch_size += pte_update_cmd_size(len);
> +	batch_size += EMIT_COPY_DW;
> +
> +	bb = xe_bb_new(gt, batch_size, true);
> +	if (IS_ERR(bb)) {
> +		err = PTR_ERR(bb);
> +		return ERR_PTR(err);
> +	}
> +
> +	build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
> +				   sram_addr, len + sram_offset);
> +
> +	if (dir == XE_MIGRATE_COPY_TO_VRAM) {
> +		src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) + sram_offset;
> +		dst_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, false);
> +
> +	} else {
> +		src_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, false);
> +		dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) + sram_offset;
> +	}
> +
> +	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> +	update_idx = bb->len;
> +
> +	emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, len, pitch);
> +
> +	job = xe_bb_create_migration_job(m->q, bb,
> +					 xe_migrate_batch_base(m, true),
> +					 update_idx);
> +	if (IS_ERR(job)) {
> +		err = PTR_ERR(job);
> +		goto err;
> +	}
> +
> +	xe_sched_job_add_migrate_flush(job, 0);
> +
> +	mutex_lock(&m->job_mutex);
> +	xe_sched_job_arm(job);
> +	fence = dma_fence_get(&job->drm.s_fence->finished);
> +	xe_sched_job_push(job);
> +
> +	dma_fence_put(m->fence);
> +	m->fence = dma_fence_get(fence);
> +	mutex_unlock(&m->job_mutex);
> +
> +	xe_bb_free(bb, fence);
> +
> +	return fence;
> +
> +err:
> +	xe_bb_free(bb, NULL);
> +
> +	return ERR_PTR(err);
> +}
> +
> +static void xe_migrate_dma_unmap(struct xe_device *xe, dma_addr_t *dma_addr,
> +				 int len, int write)
> +{
> +	unsigned long i, npages = DIV_ROUND_UP(len, PAGE_SIZE);
> +
> +	for (i = 0; i < npages; ++i) {
> +		if (!dma_addr[i])
> +			continue;
> +
> +		dma_unmap_page(xe->drm.dev, dma_addr[i], PAGE_SIZE,
> +			       write ? DMA_TO_DEVICE : DMA_FROM_DEVICE);
> +	}
> +	kfree(dma_addr);
> +}
> +
> +static dma_addr_t *xe_migrate_dma_map(struct xe_device *xe,
> +				      void *buf, int len, int write)
> +{
> +	dma_addr_t *dma_addr;
> +	unsigned long i, npages = DIV_ROUND_UP(len, PAGE_SIZE);
> +
> +	dma_addr = kcalloc(npages, sizeof(*dma_addr), GFP_KERNEL);
> +	if (!dma_addr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (i = 0; i < npages; ++i) {
> +		dma_addr_t addr;
> +		struct page *page;
> +
> +		if (is_vmalloc_addr(buf))
> +			page = vmalloc_to_page(buf);
> +		else
> +			page = virt_to_page(buf);
> +
> +		addr = dma_map_page(xe->drm.dev,
> +				    page, 0, PAGE_SIZE,
> +				    write ? DMA_TO_DEVICE :
> +				    DMA_FROM_DEVICE);
> +		if (dma_mapping_error(xe->drm.dev, addr))
> +			goto err_fault;
> +
> +		dma_addr[i] = addr;
> +		buf += PAGE_SIZE;
> +	}
> +
> +	return dma_addr;
> +
> +err_fault:
> +	xe_migrate_dma_unmap(xe, dma_addr, len, write);
> +	return ERR_PTR(-EFAULT);
> +}
> +
> +/**
> + * xe_migrate_access_memory - Access memory of a BO via GPU
> + *
> + * @m: The migration context.
> + * @bo: buffer object
> + * @offset: access offset into buffer object
> + * @buf: pointer to caller memory to read into or write from
> + * @len: length of access
> + * @write: write access
> + *
> + * Access memory of a BO via GPU either reading in or writing from a passed in
> + * pointer. Pointer is dma mapped for GPU access and GPU commands are issued to
> + * read to or write from pointer.
> + *
> + * Returns:
> + * 0 if successful, negative error code on failure.
> + */
> +int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
> +			     unsigned long offset, void *buf, int len,
> +			     int write)
> +{
> +	struct xe_tile *tile = m->tile;
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_res_cursor cursor;
> +	struct dma_fence *fence = NULL;
> +	dma_addr_t *dma_addr;
> +	unsigned long page_offset = (unsigned long)buf & ~PAGE_MASK;
> +	int bytes_left = len, current_page = 0;
> +	void *orig_buf = buf;
> +
> +	xe_bo_assert_held(bo);
> +
> +	/* Use bounce buffer for small access and unaligned access */
> +	if (len & CACHELINE_MASK || ((uintptr_t)buf | offset) & CACHELINE_MASK) {
> +		int buf_offset = 0;
> +
> +		/*
> +		 * Less than ideal for large unaligned access but this should be
> +		 * fairly rare, can fixup if this becomes common.
> +		 */
> +		do {
> +			u8 bounce[CACHELINE_BYTES];
> +			void *ptr = (void *)bounce;
> +			int err;
> +			int copy_bytes = min_t(int, bytes_left,
> +					       CACHELINE_BYTES -
> +					       (offset & CACHELINE_MASK));
> +			int ptr_offset = offset & CACHELINE_MASK;
> +
> +			err = xe_migrate_access_memory(m, bo,
> +						       offset & ~CACHELINE_MASK,
> +						       (void *)ptr,
> +						       sizeof(bounce), 0);
> +			if (err)
> +				return err;
> +
> +			if (!write) {
> +				memcpy(buf + buf_offset, ptr + ptr_offset,
> +				       copy_bytes);
> +				goto next;
> +			}
> +
> +			memcpy(ptr + ptr_offset, buf + buf_offset, copy_bytes);
> +			err = xe_migrate_access_memory(m, bo,
> +						       offset & ~CACHELINE_MASK,
> +						       (void *)ptr,
> +						       sizeof(bounce), 0);

Don't want to spam the list with another rev but this should be 'sizeof(bounce), 1'.

Matt

> +			if (err)
> +				return err;
> +
> +next:
> +			bytes_left -= copy_bytes;
> +			buf_offset += copy_bytes;
> +			offset += copy_bytes;
> +		} while (bytes_left);
> +
> +		return 0;
> +	}
> +
> +	dma_addr = xe_migrate_dma_map(xe, buf, len + page_offset, write);
> +	if (IS_ERR(dma_addr))
> +		return PTR_ERR(dma_addr);
> +
> +	xe_res_first(bo->ttm.resource, offset, bo->size - offset, &cursor);
> +
> +	do {
> +		struct dma_fence *__fence;
> +		u64 vram_addr = vram_region_gpu_offset(bo->ttm.resource) +
> +			cursor.start;
> +		int current_bytes;
> +
> +		if (cursor.size > MAX_PREEMPTDISABLE_TRANSFER)
> +			current_bytes = min_t(int, bytes_left,
> +					      MAX_PREEMPTDISABLE_TRANSFER);
> +		else
> +			current_bytes = min_t(int, bytes_left, cursor.size);
> +
> +		if (fence)
> +			dma_fence_put(fence);
> +
> +		__fence = xe_migrate_vram(m, current_bytes,
> +					  (unsigned long)buf & ~PAGE_MASK,
> +					  dma_addr + current_page,
> +					  vram_addr, write ?
> +					  XE_MIGRATE_COPY_TO_VRAM :
> +					  XE_MIGRATE_COPY_TO_SRAM);
> +		if (IS_ERR(__fence)) {
> +			if (fence)
> +				dma_fence_wait(fence, false);
> +			fence = __fence;
> +			goto out_err;
> +		}
> +		fence = __fence;
> +
> +		buf += current_bytes;
> +		offset += current_bytes;
> +		current_page = (int)(buf - orig_buf) / PAGE_SIZE;
> +		bytes_left -= current_bytes;
> +		if (bytes_left)
> +			xe_res_next(&cursor, current_bytes);
> +	} while (bytes_left);
> +
> +	dma_fence_wait(fence, false);
> +	xe_migrate_dma_unmap(xe, dma_addr, len + page_offset, write);
> +
> +	return 0;
> +
> +out_err:
> +	xe_migrate_dma_unmap(xe, dma_addr, len + page_offset, write);
> +	return PTR_ERR(fence);
> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>  #include "tests/xe_migrate.c"
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 0109866e398a..94197d262178 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -102,6 +102,10 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  				  struct ttm_resource *dst,
>  				  bool copy_only_ccs);
>  
> +int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
> +			     unsigned long offset, void *buf, int len,
> +			     int write);
> +
>  #define XE_MIGRATE_CLEAR_FLAG_BO_DATA		BIT(0)
>  #define XE_MIGRATE_CLEAR_FLAG_CCS_DATA		BIT(1)
>  #define XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG_BO_DATA | \
> -- 
> 2.34.1
> 
