Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFED9619EA9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 18:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B1C10E969;
	Fri,  4 Nov 2022 17:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC56110E969;
 Fri,  4 Nov 2022 17:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667582750; x=1699118750;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ej+iP2UulyHJYinenVEnSC328SUKTCzbcNcp5PnSD+A=;
 b=LTG0Cc0SJgYQ6fsvXRprPzrEcR4AKmuPgGrt9YxbC130ckEac6UJtmw6
 +ugUUr8eCzPRAkySwnFd3B/1ZHD5fuPA7P7K9vtR910efLw9pOHacysxI
 yFxwCyAMfisyq/e8jDD78vnNtlKaCT37T1u/C++Q00Xvtle+as8kYDC9+
 udlgNCZPCv5UQTJxIyF5v3Fr6iVTJEH5CFjzGvDlWnBQJkf9es7D40ue6
 a9idp9csMOvBYfWkErW0RQE6Jg9HYWPiVAkCMjIwXlhwkZIuMstRSUkxy
 lVGIT4lXT1AGJlulsYn+rF1btKpG8nyJqGYoOYYntilhaZS06yNeNkH7T w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="311770336"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; d="scan'208";a="311770336"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 10:25:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="637658163"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; d="scan'208";a="637658163"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 04 Nov 2022 10:25:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 4 Nov 2022 10:25:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 4 Nov 2022 10:25:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 4 Nov 2022 10:25:49 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 4 Nov 2022 10:25:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJQxv2jb73UddsCvqsJ0xksYhmZwZAMj5S+CWuE8f60H4PJbHNl/8f4OnQBg8VTasGnX7aYxQyLJhCmIPlD4Y0KVIHjDMnm6R+ZnzXFPcgJE4NrgxVubjq5m0K5uzq9hYF7FM2tr6+VX0BDH0NkXAI4/m5zc3euyaz0QgmKHxjJtQr8Nx++28uc3NpC4tcKgJzjkT+tF/EotFiKP8y+Ps+BGU0uDNyUVdNfVVChW6zdin4/XdhlwIrDhd2Ob213h45FjTKU5B/AiqcKu+fIbegtDQ89mb+sh1tmZr/IcZY5Up5eo2AG6NjGjdq+4Pld+rUinQZudSLHZnyaBQCov8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3z9VTvTedTnnlXOPgGsz43DMBNe6RYlWlD9gHcIVK1A=;
 b=VTYczZm8YGoVcySTGsfwKmQN3u2gmv6opJYskTaWNpzh7sQxBY/J9TKO95rQDydfwEgkVp7JHzSNUK30Yt19I6rMhTce5zQMycdqx9MpYlRWspqjkVFC2cPf9iLiT1ONkwSGC+0jZlh5RHAEuKGQeqcYCxm20tBDiVLWDP2OBCLYHu7qiDsfiY7wm+shQpQMBJ0/e27Nvu9jozD2FtQcCAKJsqOf61CFTmFkvF4GShgto8sVj5anHt+dHe4yQfqULfoRxErXNfciC46A12z3Wt/uqBX6f/rNfgkAlzeNkee7PBIRH/XSsIBx2PgezBDonkh1GWJsju++Pmq0LOW9yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by SJ0PR11MB4879.namprd11.prod.outlook.com (2603:10b6:a03:2da::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 17:25:46 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::3933:ff49:d505:3fa5]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::3933:ff49:d505:3fa5%6]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 17:25:46 +0000
Date: Fri, 4 Nov 2022 10:25:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v2 5/5] drm/i915/mtl: don't expose GSC command streamer
 to the user
Message-ID: <Y2VLGC4WSnvSv5f4@mdroper-desk1.amr.corp.intel.com>
References: <20221102171047.2787951-1-daniele.ceraolospurio@intel.com>
 <20221102171047.2787951-6-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221102171047.2787951-6-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR13CA0119.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::34) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|SJ0PR11MB4879:EE_
X-MS-Office365-Filtering-Correlation-Id: 596d28be-f1f1-4a4c-e089-08dabe899be1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C9gk2hPqHN+5Z1/kdUUWLr6c2UcU1UsSKLbX9G0X3IoIggQj3vuc3bgPYD+qA54jvPGHvHbyvCQxRNJ3RHOX2TXUePplel7NFJKGF+QVgQPclpYFT3ecYsFn105A3QdU5tXOm5K5vdKkjnH3TC8uBJNd9Nf/ykXUdkLU4CYTgOz4MbX+h6iaub9F1cOyv/kXB+j9MJ6C7D6V2TmSbzWFcuG8P+vqHweciDwhuEXeHivAWldhdAyVHXxwzKuuRX2W2u0xBzYvRfYeTvOuZpVKhMaT7uL6zUq1wL8S9ERWHkF4T//f8o/jofp9tpRiG0IM8z/Xyy+uOPTvvqvqy9eNVA7ceaXBP0ArBN2vyn+ngtaJRcYD8XtHxman/rJACfJzv0Qs5J2ziMrEov0NFWxrjDJbV46f9pXIOgRg3iGADNHBNuXEbIHpsE9lnivPrOY7KHiiHvItypbG158tbWGnUJFa0AOF7rxK6CQmV73qWPsMRxkyTkfWEwqnSxkFxKtY70dY6z6FxGalLOYHqHUNB7asXuOajuS6AXdzJJY2hCZvPvfaIniFCx31TkjwJZBi3cll3nod+K58lCQob4ZcvmpgCKRdkrG3/rTtUovdZHhS8wY68oNHJZseYggtSGvIJqsE8NDrZ8BDdve6a58EnNnJ89vb1sFAfYQs3iXv2EeGzw9b2RyulxnCUUqNtl+ki+VRk4B0td2LFq1vqW6b5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(366004)(39860400002)(136003)(346002)(396003)(451199015)(38100700002)(8676002)(4326008)(66556008)(6636002)(41300700001)(82960400001)(6862004)(8936002)(66476007)(5660300002)(316002)(66946007)(86362001)(6506007)(6512007)(26005)(83380400001)(186003)(6486002)(450100002)(478600001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/KdKH7IvEtRcpsUHRuB8MZ03IB5EGXWBtPHuATO3uPGRff/P9v8gL0yu9y3X?=
 =?us-ascii?Q?4yb603yk0VSRkEIpSGUjaD90JxhsnSk9k1JHIiHvVBKbh7wF9QOXVL7QuY49?=
 =?us-ascii?Q?LYRK8OUJ6bgdn+Jjs2TS5Vgaslr5aJPfqO6shuZ1c3gkoLnekk5HM3TMNE8k?=
 =?us-ascii?Q?JEdNnI3SHihHVk1NJVLyE3CF+EqO0GWoqLMCpjcpIw0VUQ6P34VkxWOevomO?=
 =?us-ascii?Q?OYaHB1kzbhriuIwsZOpFO7keSWzsXrb6KZ1+6G7UHp0HPzEYNJOAnAIsWiRK?=
 =?us-ascii?Q?4ZtYdx4eC8SpHZXpqIAtIm8TD6CByzRe5TyzUAO1hv4qgP/CMGuotCUtSsht?=
 =?us-ascii?Q?wqxOVJjutdE9rOdvIGAwPa1/nRq11LqHBWTHFriq8WmL0nVeVnhjsWDek+Nj?=
 =?us-ascii?Q?bYnM6FHahWtUr2CWS5vbj/yvZ0HuIP17tlTtywNxYzZdNKvexoKJRrNpnhH+?=
 =?us-ascii?Q?A4qMuy7sAZ2K3ISxu8orqfJMjD9jdhlXzmaxx9GInpcbX61Fo/csPZeebAKg?=
 =?us-ascii?Q?g8JyN2z+ijmszD0rSV4zbmC9RFUL9rqV0vKXdcmXxxT0fwULS0gEFvKsECTW?=
 =?us-ascii?Q?JYjsWr7W35TvOsAyhckZwONUXePdQV/6TeWvrqbY1VBn63Nzmo60H7l4AwSa?=
 =?us-ascii?Q?0+bbA28gvVkRbwg5YFeMtYvlkxI0Kwbm7eTIN3XMpwpVWX3Tcmj1aQj8CAjb?=
 =?us-ascii?Q?yqtVbiLETYC0LPn2lLyij7xMyP8MXUUMFEzKpzcGcWTB9s0Q+dbQ+S3jujVP?=
 =?us-ascii?Q?sTRSX4E5YZCcZ9smG3dyJQ2tWzDCe6T7GZrKioIBlYvdY893WefkkGtn3VSN?=
 =?us-ascii?Q?2Eacx7n36KUV2EfpCr0CJsdMwrSNQVOu7IJ0d/+ICyshaC8/DQ8pLpd69gYR?=
 =?us-ascii?Q?QPrECpdZxWGF4hdf65IEJ3fanGAp1YA4ZSe8winumh6gElWGYavHfEynU09q?=
 =?us-ascii?Q?od66T+u31oCgndTHMdrgHzhe66RdNjxxW5hMvCy6DFHJEZHKDfRv5KgQKJtL?=
 =?us-ascii?Q?epGILi1OEDj60BHs0Z1QYDnUh2AR8tVm8ZZ8oAld/3Fqm36dGnU+bJgYzkQj?=
 =?us-ascii?Q?qh/pbtZsYPpv/G5rSNThggFeTbtA6gN+WX17/GClO5xyuJr9aRTFpS3AA6uq?=
 =?us-ascii?Q?v8m8137lYq1H0s4g6zLKm/z9CuXKvjWyonuVDQiAAdU2y51eSlUTgc47Y19b?=
 =?us-ascii?Q?G6OkmPeTUuE3Bn9chfAY+iHm8O5DX6OTgrA8xb/Vztoq7rE0y07raA5i2nHS?=
 =?us-ascii?Q?ESR9he/sYjHuEr6o8boFXkIrRgvTWzTzB5tWAtTTDcxJjk106f6l0g5aYoyw?=
 =?us-ascii?Q?RCBhYiXqH92wj8FNz81EpwEIQ59PAGrwI/dEp5iKn34uVwsp2pJ3AeiCiDCH?=
 =?us-ascii?Q?AdnAput2+wClgsfdJjnL4Q1Z0VEDZyuV/OH6OeIhMCBQqPQtXHS++we/eLee?=
 =?us-ascii?Q?jAManpt3nE1mZwV7UXPhnZUntPlpFpp76/KMQp2Hi5c4BvKs3/TBRGrmFEc8?=
 =?us-ascii?Q?rPS8eDCEW472yKxaZhRqZ38jgq07FuuTlrGXiR9VkMC3symDL5M2nTxPBl0U?=
 =?us-ascii?Q?NsulLwxE1QDL0+OXQBF3Ib9rxIaDk/MumFypS5+gdwVr7t6C7DbaTvh+16o5?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 596d28be-f1f1-4a4c-e089-08dabe899be1
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 17:25:46.2821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HgttDDXOFuLKEomvHYJf+cAY6Rdve1fK2PL4j7PvbveRjBhSF6nWgtiNceA6qvVhN+miC3vw8LFBDWzoOjgsaeJP7/1zupU3U0VTZX5t7oE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4879
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

On Wed, Nov 02, 2022 at 10:10:47AM -0700, Daniele Ceraolo Spurio wrote:
> There is no userspace user for this CS yet, we only need it for internal
> kernel ops (e.g. HuC, PXP), so don't expose it.
> 
> v2: even if it's not exposed, rename the engine so it is easier to
> identify in the debug logs (Matt)
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_engine_user.c | 27 ++++++++++++++++-----
>  1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> index 79312b734690..cd4f1b126f75 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> @@ -191,6 +191,15 @@ static void add_legacy_ring(struct legacy_ring *ring,
>  		ring->instance++;
>  }
>  
> +static void engine_rename(struct intel_engine_cs *engine, const char *name, u16 instance)
> +{
> +	char old[sizeof(engine->name)];
> +
> +	memcpy(old, engine->name, sizeof(engine->name));
> +	scnprintf(engine->name, sizeof(engine->name), "%s%u", name, instance);
> +	drm_dbg(&engine->i915->drm, "renamed %s to %s\n", old, engine->name);
> +}
> +
>  void intel_engines_driver_register(struct drm_i915_private *i915)
>  {
>  	struct legacy_ring ring = {};
> @@ -206,11 +215,19 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
>  		struct intel_engine_cs *engine =
>  			container_of((struct rb_node *)it, typeof(*engine),
>  				     uabi_node);
> -		char old[sizeof(engine->name)];
>  
>  		if (intel_gt_has_unrecoverable_error(engine->gt))
>  			continue; /* ignore incomplete engines */
>  
> +		/*
> +		 * We don't want to expose the GSC engine to the users, but we
> +		 * still rename it so it is easier to identify in the debug logs
> +		 */
> +		if (engine->id == GSC0) {
> +			engine_rename(engine, "gsc", 0);
> +			continue;
> +		}
> +
>  		GEM_BUG_ON(engine->class >= ARRAY_SIZE(uabi_classes));
>  		engine->uabi_class = uabi_classes[engine->class];
>  
> @@ -220,11 +237,9 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
>  			i915->engine_uabi_class_count[engine->uabi_class]++;
>  
>  		/* Replace the internal name with the final user facing name */
> -		memcpy(old, engine->name, sizeof(engine->name));
> -		scnprintf(engine->name, sizeof(engine->name), "%s%u",
> -			  intel_engine_class_repr(engine->class),
> -			  engine->uabi_instance);
> -		DRM_DEBUG_DRIVER("renamed %s to %s\n", old, engine->name);
> +		engine_rename(engine,
> +			      intel_engine_class_repr(engine->class),
> +			      engine->uabi_instance);
>  
>  		rb_link_node(&engine->uabi_node, prev, p);
>  		rb_insert_color(&engine->uabi_node, &i915->uabi_engines);
> -- 
> 2.37.3
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
