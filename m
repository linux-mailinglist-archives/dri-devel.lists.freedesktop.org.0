Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8639BC01D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 22:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A2A10E4D5;
	Mon,  4 Nov 2024 21:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EAuterMa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B800210E4D5;
 Mon,  4 Nov 2024 21:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730755966; x=1762291966;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KuhuCrkfVx3YmJvvkvcdn1jymczq5dQAzxIf2poTaXU=;
 b=EAuterMatcnvr9uw1VYiSdBu3TYyXnBfMDB42YezUsUm+40l4MOxviEZ
 lDNjgWlR1Ymloh/kiQTPoU5PziQ5hFs/FO51USzTp3aC+okpHYOyMfAUV
 LQtqDgjqqQ6R2uIpxUukvnEbmV5duQ5Eq1NtAP98swEUDyKTMAXF9zU6R
 Jsl+0H7UvuqLTj0RwY4B6aMG3HZuWEuek0/EwAxKf4nkfc3uNpbqfoHxu
 EQ/Svo2xuFscx768MZlnZZ/gwpRf/TI0/B5/gISu/48qKTplZQr9uyfq8
 GH/BqKFVUDscTIhchYaFZULrh0wkWnzfz1Q+eUkAfVVaIyMRMIe47hTcp w==;
X-CSE-ConnectionGUID: 2wFxnTviRwGHg2tq28JyWQ==
X-CSE-MsgGUID: fOCyoYTKQqWl/2ruqPqc+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30638305"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30638305"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 13:32:45 -0800
X-CSE-ConnectionGUID: epdVtY3hQpCXRHpd0UpVEQ==
X-CSE-MsgGUID: a4nJKToQShyAGQuYZ1i2ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="84208047"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 13:32:46 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 13:32:44 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 13:32:44 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 13:32:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbraKozjzkoUQ1prK+ucQmKc1oUEh4NUBE5TAcxz9H0A76C/SzzyK36/XNvoLby8n0VnE/FHLEwRpqoeGrIzRc03u3refdkrYVITYZ6URiC3Vp+c79BRptB0aR1VDXOwW7IPoYYGRtwXxhbXcEl6RHBFC39nTjh3Rxf2sCbcpXIMgQZXfROISSz2GXy9izPmIKvMqjuTaIsQACrLORpsIe51TRDdGUJ2dc+gOU69ZtqM2F5f89RG7XKonDBWbloR5owkLVl6hi3FXq8S7JCQfVkPTv89RUGnCQNajXU5zKSxhevDh079fUM32SKZCuWBYRlQzMHIdmBUYI3AkuaNSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K36wwWifNnC4Ilx5rfrDRS0t4KRhiDT/3iSDHbmQGks=;
 b=GU12hKznb198Drv+fnH5PktTbqXwq5xJGd45pWISIydfEVlj7IF1I3zMGSVlDMuCEe5khs2hoAmu47OqKJQKwcvhjwYyEpp1jEKJkSM4T4bLcc1b0J9ngY6A+ZKx9jVgaK7jMxI7FkfqK/lg3JCskN8s18+qZx97RAm56MdBZF6Sask1nzfZNaLllLwYmdcnuKbzMJZ8krGMrP+lvORZ65hKeMmmXKxFiW2U2UB8tGwvPtjWU58HE+8v4kUhhQ8yISX15NmYnNi4hVHsufpZemjWUfIApwKdXzY2L6EXR8aGCjFUrIgQjpAgKd/Ly8u3Ee/sD4jEebw8L2ycYo1gxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by LV1PR11MB8790.namprd11.prod.outlook.com (2603:10b6:408:2b1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 21:32:40 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Mon, 4 Nov 2024
 21:32:40 +0000
Date: Mon, 4 Nov 2024 16:32:35 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <linux@treblig.org>
CC: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tursulin@ursulin.net>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/i915/gt: Remove unused
 execlists_unwind_incomplete_requests
Message-ID: <Zyk9c9qDN4jqr757@intel.com>
References: <20241103144936.238116-1-linux@treblig.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241103144936.238116-1-linux@treblig.org>
X-ClientProxiedBy: MW4PR04CA0367.namprd04.prod.outlook.com
 (2603:10b6:303:81::12) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|LV1PR11MB8790:EE_
X-MS-Office365-Filtering-Correlation-Id: a03a9186-4dbc-4b39-cd62-08dcfd18358d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kFOHyDmm3Y82AJgLR+iiZsm0CBbeZ165PU4PXidrb+lc5NOIFMMLMw691gH6?=
 =?us-ascii?Q?pSrYxCyM2GSXmwjGuO4ClopLQ8Zb+ILayqAe9yYKhyWv94YUSSvYKAm0OzGe?=
 =?us-ascii?Q?rp3jSfS9fQuO6a6LGCaZCGnd1Als8UvDBSzPIyFnsHaVSBpn7o2qase9GjmD?=
 =?us-ascii?Q?MYz8tV5rY7nSBvHh+7LJI3IhRKflQxvHi7FCK5K8bv90lGJJTwpiBcRd7OWO?=
 =?us-ascii?Q?xc3XdDKMQOKsDlH9JBWEbbEmBkS4Va65dka7DI6tMLsKtAW31bhpi6AeIj8d?=
 =?us-ascii?Q?ycK2IEFW8jB04Yet0okPKF2ASYA1A6vs52n1O8/LVxna72fAjgbiQkJS7Wh6?=
 =?us-ascii?Q?pc9U1yCSrJSD7ThvpMpSiIumRr/+5UK/Su8iUuTXA8C1A9ePwvkmD1T6+i/u?=
 =?us-ascii?Q?WPCIEDh8COPFOYqvL/ML9pImOxlivTNc/Zheek5zfvm/cPKHZzxlmiTsf3Jh?=
 =?us-ascii?Q?FHlgNWbgAFejHbquCnbchaHsoB+AVL9i49lZTmhKQbbn2E/XAakrDUW8LKzn?=
 =?us-ascii?Q?1qp3HUYvcIsNJpcNe59QtKSG8cRjg+ysel8XMABMcOLcJO1h0xFgiyc6Dp1n?=
 =?us-ascii?Q?nFesbQq7OuIHSetVLkofVn3zsxnFBs96VwMbaKvBlwUsmncf5TIMR0w04pOj?=
 =?us-ascii?Q?PJeRmwkf5D7ZaYBfXTVs9ddrJHgh7nMoIDNOnpEMrx0TprMKNyZLXuv7r7Xx?=
 =?us-ascii?Q?BVeTby0Hlg6KAeaErT132QqHVgXOnnMQ2HyzTpYLSs6tM4zflZz5493gXK5M?=
 =?us-ascii?Q?1CS3z+29ouV2meMWZXmAMGsJH/vZE8D5g2gd4gwTB1Hp7HSgkbsqbIQxzxsJ?=
 =?us-ascii?Q?9iHaxSPRURTvJndktv4+0h63SoK19aIQtMAGha7QORQYxjy+Klm9AadzcKcc?=
 =?us-ascii?Q?ahcOlOzuwspWDcGPt0hChvli2xyWN5wfrboFTRio8urQcnYC6RgTaCvBQJJU?=
 =?us-ascii?Q?mprpT7JCt/VQgtKhbR6ebX083vWaU+HzyUvGC4pXA9q2OrijLG8dFlQK3yiR?=
 =?us-ascii?Q?dz+Zflw9T4ft2eBVAOJe93OF1oW9audhlhwTPkbPZCxDbwrdGOBSPwNODAXb?=
 =?us-ascii?Q?qf9nDwFzlH2ASyKvgYgPlFV3TRVb7vTfSwiZoaxmOLggMMT1cZYXpzVeRfC6?=
 =?us-ascii?Q?8R+XNUXeIasnyIlu1PTSJoBNSzpZucJtWg1NI4flbXkqS9h18uflWo0T6Tn5?=
 =?us-ascii?Q?nRn1/0u85lmkwH05u9nROLWGLDFcGZVPnmnhifo3Q6JK1gtXIBxyjqwCAp6Q?=
 =?us-ascii?Q?ThGY6phuJBeplLO7HaKsvfRekb1ek7atvJ8iefuOdwf77lnKVvqmwVoj79Wc?=
 =?us-ascii?Q?t3QpxOUjx6lrbPy1veKW7ga9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z5ksq6YHFiROC+zPZxR8XPuG0iLwJWBEFYthZZ6sEkfJldPZqDBtYWQishg4?=
 =?us-ascii?Q?eEMM5NAhtCQnoaCMlz89me54IbsqEY2axkFM5NthZluvQybm/L6ur17oaLSz?=
 =?us-ascii?Q?ZkyOwVvysgf60MhZzKNUGxdOzfFUtF/LTpM+UETLukmPNWM6A+/D/aw7Dh/n?=
 =?us-ascii?Q?vKLjBj8el4DzOH157XinukIpT5QdIw6tSHUNYqYVeGxtzUBra+ihPCIJ5miu?=
 =?us-ascii?Q?fyP2xXhI1t27G7495ci3KTcjZPa1WRC3etALuQ+d6omshRuu+IMxcAK+htNf?=
 =?us-ascii?Q?HQBIWcqvAoaCIcsqDILgKJIZjyzMt8EfzgDIlEqOwUyEONOxkUZoRPpDlrIf?=
 =?us-ascii?Q?Zk3U1GsBNW7H3E7vhmBc+eWdyYaoaj/cwvM7e012zg2TKLvev1YlffC+Olk5?=
 =?us-ascii?Q?usNqQp8lcDnXVmxepiRTrUuqEzu+8OnXaWFMYIcot4vFesv0S2XxmJQhLdpG?=
 =?us-ascii?Q?XvjZRqoIyOYN4DYCpxdmrDfcapdd5CnK8pcqu0Y/VjfZKq8TdAbyFYalOx4M?=
 =?us-ascii?Q?S0MevpIgVpH186CVvrrOYbKVl6hOaQwEuV2eXQKXJpofNbzcphQMAlS6KkRl?=
 =?us-ascii?Q?xm/MlFeTMwtA8psaqgW5w+NWL+RKOCAKSk2ggCoZzzAzkoGJ6ed4a9IbfrEU?=
 =?us-ascii?Q?tTh0bijH1D3erbbxAmBqgHa4sCJUycwJUUk3m98XGI+tkd7tHLDCiB9V+zGD?=
 =?us-ascii?Q?zrx1DMxS5zQx4s6O1SVJEjrNzZsV/7iqgRDdUUkgqWytQGdf7QmxIaXg9L/L?=
 =?us-ascii?Q?pjafbf4NFv/UfuTbXSf8SCGcwPfuACJhDmBf5kPOgMq/EAfMQFoVA1p8YTi+?=
 =?us-ascii?Q?nxeCHP7KaSNRvdi29IodZWaOuZg8i37iWfOqE4v02S8yxQyKLUA4rzWvqQjQ?=
 =?us-ascii?Q?Qii1GGs2dusMYMrQAi/HCa0CsYjqNW87wTnM8DYe2dkmuJV/55NUwHbH1MLj?=
 =?us-ascii?Q?tcryXNuIJX3NsIPCnE2LbFBGp/q+4u+uH/0inFMwwNa/fiU5PT0DlUgfDjM0?=
 =?us-ascii?Q?TUG+0VAWKrv1BiAcqbV5NFecMH6dRLgKL/9r3C9z4OQUFjbJxMjOaMvgnZPH?=
 =?us-ascii?Q?ZXOkyZOknYgNKjRk8VLpq1RyKrkA0/En0huZbKR6oKTBxdOkVULKyqHTuZK1?=
 =?us-ascii?Q?78oB8q0wU8bZwj6/2dh7WP+GzGWDSjyow1zShXxn92qOVTtKSqt+UXKVehoO?=
 =?us-ascii?Q?cehvbTP+G53DdJtjCkV7DOPQRQj5CfIN+a8K2aq9+tw2Q4HUD+jxDz3ceutk?=
 =?us-ascii?Q?lMVSiziwb3X1FzjLtAZ0e9JvN7QCY8VNFw2tvN1E/uN1HQ4kd7zDebzuzTSh?=
 =?us-ascii?Q?ajvcDcX6H1gl1F2aiUjDjpbPkWCjd5kJsRFqlMJ8JAgdwwTAw/bSm9uWOFKY?=
 =?us-ascii?Q?OXmtbIXdhhW5kkvxdEgOseI+OhcVasCuHoRL0VRCPLryEFLCNQnqgpeYOarE?=
 =?us-ascii?Q?EMMTIsNxeq6iMrIGwG6uFYqWYziQufbK8TEdwd38jf98816q4WR3RklNRgbb?=
 =?us-ascii?Q?gZXH6mPt1fGw1xTT8+NHQI5C0TiLlTtRFXI9ZotT+WMms2hRGXZmH6iFp8+s?=
 =?us-ascii?Q?4chK5RDHjTjgdODrvZCOsimzN1H+fagKNB7929zS5B/9wGQz0Gq5yD0xf4j6?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a03a9186-4dbc-4b39-cd62-08dcfd18358d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 21:32:40.1920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NtZl8F5z98g7mbg/lRnyahIsaZYPNqZIL1kO3OGjfNlzwtzNhzrhWgZ9ZTbazhjWNpnWq1i7PqLkS5tMk4i78g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8790
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

On Sun, Nov 03, 2024 at 02:49:36PM +0000, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> execlists_unwind_incomplete_requests() is unused since 2021's
> commit eb5e7da736f3 ("drm/i915/guc: Reset implementation for new GuC
> interface")
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushed to drm-intel-gt-next

thanks for the patch.

> ---
>  drivers/gpu/drm/i915/gt/intel_engine.h               | 3 ---
>  drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 9 ---------
>  2 files changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> index 40269e4c1e31..325da0414d94 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -126,9 +126,6 @@ execlists_active(const struct intel_engine_execlists *execlists)
>  	return active;
>  }
>  
> -struct i915_request *
> -execlists_unwind_incomplete_requests(struct intel_engine_execlists *execlists);
> -
>  static inline u32
>  intel_read_status_page(const struct intel_engine_cs *engine, int reg)
>  {
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 72090f52fb85..4a80ffa1b962 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -405,15 +405,6 @@ __unwind_incomplete_requests(struct intel_engine_cs *engine)
>  	return active;
>  }
>  
> -struct i915_request *
> -execlists_unwind_incomplete_requests(struct intel_engine_execlists *execlists)
> -{
> -	struct intel_engine_cs *engine =
> -		container_of(execlists, typeof(*engine), execlists);
> -
> -	return __unwind_incomplete_requests(engine);
> -}
> -
>  static void
>  execlists_context_status_change(struct i915_request *rq, unsigned long status)
>  {
> -- 
> 2.47.0
> 
