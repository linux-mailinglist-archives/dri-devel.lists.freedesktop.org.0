Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6392A879A3C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 18:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3B71120FE;
	Tue, 12 Mar 2024 17:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BNDC2I9D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C17610F8C2;
 Tue, 12 Mar 2024 17:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710263322; x=1741799322;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=L8mPI6evqIBbxNWtu4ZKsExedYTBT4cVnMAQS/BO6gQ=;
 b=BNDC2I9DNJeps2Ufioti4PvmncB3j6Ydywz42F17AnEG2EPHKV/kisNl
 IAoDhRbyFFK9yTdHBwXGzTIswnH9foZQ3X8NDWyI/ncHPw1vv82eAnHUV
 169kI1UKIDL+cNLqBEOCqnj8DURXZyRlkvJJeVs2Qco/z/hyyjdQJ677L
 Xh6bQ324DUSDNP79KrqullfKUzYZAGSoQb7KFh4QJgYa3UCZ/s7ojS8WK
 Vcl045lOEOYx1IFyNZdMXuWocWBvbjx7PdQT4ZP46r6cx6lZvp4bz/Hqq
 hKlBS6OKeB5/pDG6fDb/E8z0CGGDH/gzpJBUzgX/wSyY6CHgbEnciD5nY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="27462994"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="27462994"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 10:08:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="12203836"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 10:08:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 10:08:40 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 10:08:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 10:08:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 10:08:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CrjmZNCofIEdgUQWOluB2aiam+VPfu0ZZ/bVedWz4oJMQuRlAkCvN/HiLTtDgjZ9sD15vcgX/EOKD3LFLINvYiNtOLHjgJBrjluntYhla/i05pVwkMu8AaZZ0r4YuY3yD2XMYNkWqxy7rlFZuoMcE0mXCn7EoT7wnu9uTDKiaiMwCFf5tOSXROdtUye9PZjDAA/RrVzmJSxovc+MZZGrYMtAnh0l6dpDj2QuCmx44eh1XSk2v/id79vLNUbiboFeNmJxTU41I3gu3qcneOWNGcbhA4hxMgdX0l3qY5cGE+ATDgITiOO6lfTMuDFZwogxoQRnOpFYAlwPQeeO7Vez2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOzpvZMy6evtwZqwIZcqI8R4InretygVJneWih8O6eY=;
 b=ERJTPAqxgG6P+9l55R+3Q5iuT1OuUtVFFEQ2zEN1ahrQdR3CqLCduuw8QI4b7LS0F+FmukjGjn+ysbD3h6wPFYGUabJgsZ4NOR53A6K30zFL260/f7wzszejTg9cSRg5oyAVgkSwjy+BX3rxpPy7/9nuicsOfwL0G9jzs+qMMWWWlqjoMmEGMx4g1sEH1ekeqDbG5/sPkZZx3oWTwst+FFWWdg+UHeb9OOi+plYSEhvD4AXajoe3k+qiDg0N2/Ad4w9x9k1aR4NOXi7u9o8GOyKFaCGkOYIeps6Ywctsz3Oq/vI2n44JzdemuqEoCsPMSZBQ3Wap+YdukUmum0hKzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB5790.namprd11.prod.outlook.com (2603:10b6:a03:422::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Tue, 12 Mar
 2024 17:08:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7386.016; Tue, 12 Mar 2024
 17:08:36 +0000
Date: Tue, 12 Mar 2024 10:08:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, John Harrison <John.C.Harrison@intel.com>, 
 <stable@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Tvrtko Ursulin
 <tursulin@ursulin.net>
Subject: Re: [PATCH v5 2/4] drm/i915/gt: Refactor uabi engine class/instance
 list creation
Message-ID: <20240312170833.GL718896@mdroper-desk1.amr.corp.intel.com>
References: <20240308202223.406384-1-andi.shyti@linux.intel.com>
 <20240308202223.406384-3-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240308202223.406384-3-andi.shyti@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0389.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB5790:EE_
X-MS-Office365-Filtering-Correlation-Id: 806c5452-0ec8-4b1a-5818-08dc42b70dd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VHzqcTHoDWQ+/ge2A7AAv+lWDEEYrxMQHad+Ex6mreQEtn2ZEF4WCaMKw8ukSVqJXg/bVp5XQdOkMz3ekSS+kgAhbzUeIKUVqW+Y3THNu/YH5eukTC90lhMJRri7kSUtH+t9CcBAaAly/UnPvFrd9D+7UGcGdkN+4bLAUohqoXTLkLnM0FAPwdxR+c/ikNHzgTWZmaYZ+J79UbH6gxoyKY7e57u1bLcZH0WgGGoxpUohdDMreCxEo3eoWf5IcMcNxnR1BZv9ZqcstWmMilga5onjpvM/v8JwLwJxijyiCoDVtF+Kf+eTBkVhvRoVvpmFcBk0rug3uUW/iOhYZi6JiD9lBMgNbLkyk4McgQ4OiXoPoJtV/RRit8qjSvXo+9ek4nv2CucwkdDuOFdc9+4EqtqOXbf4AUkf/pebYc8Id2/OpXc8uzOoTfm/tbXRWmobrG3qspwS24uyNVgzYfXo02OjUt5GeNgr7MdrUNshQ2o6O6lIKMg62wco0JYEptYLQqgQs4Adz6lZ+A0TXoF23kqjBRq27KjlByAMArEvLckYUbqpoT73Ubx/u33P73uGo19kjQR5pm3QtcHkVK/egKD2bsaFoXzn1BcMTFIRLyjht4JlbCv7zHYK2dgl1wjzTz3tG4gKs+9NXDBOK4CRViZJbLWKDyjiNZDpfNpgmkE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U8oWqUHtemj9vxt59XfWWrwVRvXBcqbYbKPpgAhik3qNTOugDxUAPb6ZwVvs?=
 =?us-ascii?Q?+I7npSj72y87d6oDQGMH9ITrTOvXM3Nu3YSE2QxliOZrOXMEwoJ6wOTc3AGU?=
 =?us-ascii?Q?KfbSmCM77702zTHcEQ5Z27TDqvzxVUvJ+vIYrWwfvScvTTpIabkmmf/F2H98?=
 =?us-ascii?Q?GRQg8sloGj11W3U+jikhv2E537n5CsR7I0rIpTujjPwZoUTB1r808LdMpjxq?=
 =?us-ascii?Q?8XbV4xPakW0ByPGn+CluxS1m3UmF05BqZQa95rK2ZA63ZHSwyPb+XYlH5ee9?=
 =?us-ascii?Q?WEgGkEP5FBCkc0DddIOF0j0/taVGXq8WERsjP2XnvroeySLCROifxr7Ta3qc?=
 =?us-ascii?Q?9xBIhcAjbeRsd8BnJJUqEBq55/ZbQ0K0V+RPYR3O4h7RjOYlnBkvhpGKYOwY?=
 =?us-ascii?Q?lrydcR7t+Qw0/tjPRlYh5vnETcqePWnkN3zEs0ALYJXnOGWEp08+CBq2o3wf?=
 =?us-ascii?Q?d6pNAE2mlqA/zYe6lgHtG0PUsheR1Rlcz+KHNcu6M45Xp8k0vOES5mvjJ3rN?=
 =?us-ascii?Q?H2JAD+JAL9ATB+xMUywhiPWFrPA9U4xBGCwcJl6U1IepnNPefRpc7ibPdPov?=
 =?us-ascii?Q?cfsoPd5nqhb3toEcNxpw8QPy2XOthwCU5eoqw2d3WodQHldxiTtrl64jDyYM?=
 =?us-ascii?Q?o6Xiw3FpAjwZHHSlp68slC11x0nSdDWfeuzBfK3KNJ9BM1zFLHOMoacswFy/?=
 =?us-ascii?Q?ZRdpWCz/Sb3CUQ3ESYYgw0PHmwPYeyJNMGB5wXVcU6+6zuuIowE0tIIgC8Ga?=
 =?us-ascii?Q?FEYgaEIYhJCUF2STNT8bRmyFFvZYv4tuVFUwdZ1/wbN2JNgp97AJkHFUWOn3?=
 =?us-ascii?Q?9UkndfMUpjnOViSN0ILBC3etJTtiFgtpMLwND2dZwgiOsvfQ8flPCRR7wfRp?=
 =?us-ascii?Q?wf0+bdqBl6KUNfSkWJTjL8wF3Eaj3PCm7Xf6MXDIX8hP0z3VJRNeBVdYvDvB?=
 =?us-ascii?Q?utWYRBmuwqpbohkqbt3ojey20gGJbIwQEGveYyDX4GGJ2cDaF5irpfmkZlWK?=
 =?us-ascii?Q?VQHoFevqBO2f3IrspElFd6LdrLtspXXD7Y/n8XRSXipYHwT3JE2ceBAFI3tS?=
 =?us-ascii?Q?UPSvVjVGEJxZBUH0xDU8THxLd2h+dQimOSriPxJht0mg1zPm9N1kRB6DUHEI?=
 =?us-ascii?Q?pWgtJnvijhyYz1tlJ+7yq437m1QE9Q8skOzMVYBX7/YDaT6JcMZiLsJuqylZ?=
 =?us-ascii?Q?36jUljK8qp8SHFGUQgu63FsEL6kOxAl4YwnmQ9txGwZ87vvdgnLNQPv6ERna?=
 =?us-ascii?Q?/Pvk1LNrIgRHvclKsB3aN67Rid3R1jurKPuOFOey7/7GYBZ1zfliTQSLSlFD?=
 =?us-ascii?Q?4BSVNdwCDxtOU/7F+zifPxK3EwrvEnARArq6LZuABesnSjhzAkBGfBNLnf+0?=
 =?us-ascii?Q?vYB+7kWRV+UYM5btUqUc4rxP0c09x3tzOQl3Tjrba6DBWZtXFkjRIeaCMIpJ?=
 =?us-ascii?Q?BE6yg264wEtN36CQFISH00qOs13ximfnoAG4cVs8GV/B8w+evyI9s4U3oLeD?=
 =?us-ascii?Q?DoLzGFc9AlO/A0c+P33r6R8F+9KeJLpb6lDWhZi7JmBcHte6B6kses0H+9kX?=
 =?us-ascii?Q?H6BcQVVoKHY6mc/92Ef9+SBjzJh6S3EBHacENtKqVU9cZwI5SVXOgsmMsbN2?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 806c5452-0ec8-4b1a-5818-08dc42b70dd8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 17:08:35.9716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8AuSRnURa43hioiLQ8Iiw3JIydjmJ05jtpE0sit8IZxCrH451egysEF8Cfzd3teb73lWlLah34SGJBA4RJDlycZskZidl0wKwOIshQDYksA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5790
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

On Fri, Mar 08, 2024 at 09:22:17PM +0100, Andi Shyti wrote:
> For the upcoming changes we need a cleaner way to build the list
> of uabi engines.
> 
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v6.2+

I don't really see why we need patches 2 & 3 in this series.  If we want
to restrict the platform to a single CCS engine for now (and give that
single engine access to all of the cslices), it would be much simpler to
only create a single intel_engine_cs which which would then cause both
i915 and userspace to only consider a single engine, even if more than
one is physically present.  That could be done with a simple adjustment
to engine_mask_apply_compute_fuses() to mask off extra bits from the
engine mask such that only a single CCS can get returned rather than the
mask of all CCSs that are present.

Managing all of the engines in the KMD but only exposing one (some) of
them to userspace might be something we need if you want to add extra
functionality down to road to "hotplug" extra engines, or to allow
userspace to explicitly request multi-CCS mode.  But none of that seems
necessary for this series, especially for something you're backporting
to stable kernels.


Matt

> ---
>  drivers/gpu/drm/i915/gt/intel_engine_user.c | 29 ++++++++++++---------
>  1 file changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> index 833987015b8b..11cc06c0c785 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> @@ -203,7 +203,7 @@ static void engine_rename(struct intel_engine_cs *engine, const char *name, u16
>  
>  void intel_engines_driver_register(struct drm_i915_private *i915)
>  {
> -	u16 name_instance, other_instance = 0;
> +	u16 class_instance[I915_LAST_UABI_ENGINE_CLASS + 2] = { };
>  	struct legacy_ring ring = {};
>  	struct list_head *it, *next;
>  	struct rb_node **p, *prev;
> @@ -214,6 +214,8 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
>  	prev = NULL;
>  	p = &i915->uabi_engines.rb_node;
>  	list_for_each_safe(it, next, &engines) {
> +		u16 uabi_class;
> +
>  		struct intel_engine_cs *engine =
>  			container_of(it, typeof(*engine), uabi_list);
>  
> @@ -222,15 +224,14 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
>  
>  		GEM_BUG_ON(engine->class >= ARRAY_SIZE(uabi_classes));
>  		engine->uabi_class = uabi_classes[engine->class];
> -		if (engine->uabi_class == I915_NO_UABI_CLASS) {
> -			name_instance = other_instance++;
> -		} else {
> -			GEM_BUG_ON(engine->uabi_class >=
> -				   ARRAY_SIZE(i915->engine_uabi_class_count));
> -			name_instance =
> -				i915->engine_uabi_class_count[engine->uabi_class]++;
> -		}
> -		engine->uabi_instance = name_instance;
> +
> +		if (engine->uabi_class == I915_NO_UABI_CLASS)
> +			uabi_class = I915_LAST_UABI_ENGINE_CLASS + 1;
> +		else
> +			uabi_class = engine->uabi_class;
> +
> +		GEM_BUG_ON(uabi_class >= ARRAY_SIZE(class_instance));
> +		engine->uabi_instance = class_instance[uabi_class]++;
>  
>  		/*
>  		 * Replace the internal name with the final user and log facing
> @@ -238,11 +239,15 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
>  		 */
>  		engine_rename(engine,
>  			      intel_engine_class_repr(engine->class),
> -			      name_instance);
> +			      engine->uabi_instance);
>  
> -		if (engine->uabi_class == I915_NO_UABI_CLASS)
> +		if (uabi_class > I915_LAST_UABI_ENGINE_CLASS)
>  			continue;
>  
> +		GEM_BUG_ON(uabi_class >=
> +			   ARRAY_SIZE(i915->engine_uabi_class_count));
> +		i915->engine_uabi_class_count[uabi_class]++;
> +
>  		rb_link_node(&engine->uabi_node, prev, p);
>  		rb_insert_color(&engine->uabi_node, &i915->uabi_engines);
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
