Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8360CA59BC8
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 17:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7F410E492;
	Mon, 10 Mar 2025 16:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MMxRikJy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF56C10E492;
 Mon, 10 Mar 2025 16:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741625833; x=1773161833;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kd0/MP3KMEwiUzvsRgG85v0sAK3MBLfPK2ZThiVqf5E=;
 b=MMxRikJyVkHxX61XkfXQkblwn4MfFnl8n/TQmdXXGS2J7t7sAOeDyr8o
 aaf5nxaaJ1B40WXmCT389TDgTogQolusvsJABPfxMbZt9nBOW53E0rx+8
 ZLqwF+dogznDCI9S6rkZXxOMc0l9qghCIWudfKmhP3qBSS9uJRfLB1Ptd
 U0XfE5qgEss62G9rll4pkk1vV+PzdFfGnw9hfH49YvXB2rgVgasozKkdo
 SDovWnCsTCvz0GHn5/vTJQpC+lSDMSuiWymXXYpzeB396ZEvTIw2LDfWX
 envtgqpeUM2WU1Xy7x4jnPqn+T6O3ydlPPHsQYik3VJZiO6hXMVKxnZef Q==;
X-CSE-ConnectionGUID: ETiUz/agSpCq+2K4sdFamw==
X-CSE-MsgGUID: Y/50wuWMRe+QtDmJEGsQHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="54009152"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="54009152"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 09:57:11 -0700
X-CSE-ConnectionGUID: OzE+4XGISkCeXNdGJEbTOQ==
X-CSE-MsgGUID: 7rgmJj8xT4eiicq2VJhkLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="151014151"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Mar 2025 09:56:56 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Mar 2025 09:56:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Mar 2025 09:56:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 09:56:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmPrOIExwOVPiHBk3CTXILIqvtoxP6MJXBv+zPjxAK0yNrQ9EV7SkNigKIWiwEiRVGAvqrU3aOMvhiNhZmm4bY663JeLGrhsl4iP1OR9PRtmtzUuKxJdXTZAQn3HPqaHapFv1MAzrDyNGYBbZLMZlC4N+W1uyy4U7XgP4KRpliU76YndG9ix8uUhMBdD8y86MZZPfOaB0sa2Fm2z7dz6vF51QPQ/0pIWUk2pMPA/5FNsk7X6/Qsfx11zXA9cvHf5Y/q2cXUO2kh5PIlbvt+jf3eDwo0TEDyZ0UE7578sL/MCR9yBSh3uMV87rc6Gp6P7/3aEK2dzidhFzfYucrh47Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjOUxNVugkFPkJhLHP+YbOHNkd2t9zYYkjBgqhW8bAQ=;
 b=yAbHsYaEVdlh2iabFezvyPBqEjO8DJyzSddFZ9py5SJCVRPrmaQK6iawb6j65KYgEFZe5utkRQ63NL1FMeC13C/ZEikjWkdM44nTZKJ3ccbryVuCBVya72GmlKq2D5ze+pkz139gG+S3lNI3FNQUxG784Sp+ZrKrg5MMTrw02p3iFe8zQWEQ8bf7L1tEHAP33P78hY1KOHVa3ea8rxG+rvnjHWRZVNFarw1bQQL2ubZ+WqlzUOzXzA50jc37uZSsJk/rynQxpuuzJPT0TgeePkJpexGGzDzOX4zVS182dQIL7TmAVqGGZri1AmheWdQ9ICASh1oYrl1ha/oKG39t4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by DS7PR11MB5965.namprd11.prod.outlook.com (2603:10b6:8:70::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 16:56:50 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%4]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 16:56:50 +0000
Date: Mon, 10 Mar 2025 12:56:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH next] drm/xe: Fix uninitialized variable in
 xe_vm_bind_ioctl()
Message-ID: <Z88ZzoFA5KpQTLmH@intel.com>
References: <4a74b296-8b51-4dab-a2f1-69919da1ca62@stanley.mountain>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4a74b296-8b51-4dab-a2f1-69919da1ca62@stanley.mountain>
X-ClientProxiedBy: MW4PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:303:8f::22) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|DS7PR11MB5965:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d9f443d-32e5-4ba6-2626-08dd5ff48d5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Mx3E3pnvZKkOrmK+V5szK/esw6Uz1TWd2YzzBf1liH8b7rw+wPlGWHNUlwMR?=
 =?us-ascii?Q?fnGEnkXclSPrK5FGVqbGwGvD/olQC2JasrOTtrqTMoHoBHl8uFqhQ7mQFYnp?=
 =?us-ascii?Q?Wb94ImfPf7cNZqX+pBARfiDhdmi+f76uUd34hnOCu1IXKLFFE32o1u5HffxH?=
 =?us-ascii?Q?Jfmyyy+99AoMifJH9+Px2L/LdSBJHIh+YPdBtH/qmQ4StW5Va6IIaBxsAaPi?=
 =?us-ascii?Q?3YJPSWiOv5PH7uDg8D4kvjs3dj1QIhCDgA5BkUQh5q5zV93eTf+mLqqtGr1e?=
 =?us-ascii?Q?nUX+YWZ2LQ8jyvyjYtiXhrGTu0S6k8oousdVNJZQ4U+YbgaTYglGG2tcVJhe?=
 =?us-ascii?Q?x6IHVo+H9Ogla6zc9jEVcYNhTNtxWil7lG23UopduMizfsayVLhEwAVbwqzp?=
 =?us-ascii?Q?uzKoqCWRInQzjbtZTAJUfha8lrvjWYqD4nU2a2u1/4Q0Rm0DwLLOKyyc6EPJ?=
 =?us-ascii?Q?CN1zDyiKsjIS6EIL7xZzXQ74Jgr7AK2zLxTeLurDnH9PxvQowtg9ddSEm0Iw?=
 =?us-ascii?Q?PbQAXAvgJILjFdFoF37vJAkmcWtYgiW+lXCmOz6FF7sxpKE+ZQp6P/ka9XWQ?=
 =?us-ascii?Q?E0lBsUL5ilGnkw1c77OnHwqKddqt/zemFLzib0PUrgzM4iIkVUwAmBwZfJEb?=
 =?us-ascii?Q?5oBKpf5JqE3xpb1N9CxIM3MQ4S/vu96QBaIk7wn1VW/ymTiFIo+k1P6FvlGm?=
 =?us-ascii?Q?63poEDSzWSGvMaBXuChrty2Tm+X3SarFsaqN/i3NLqYFXskQZiDQwZFNNJDz?=
 =?us-ascii?Q?Bd7nMTD61oeVfR/+uZFgjfue0gPvHZ9+Y24xMS/G7p9W6/oEJ+rrVH0vTnfJ?=
 =?us-ascii?Q?Fs/m64jO2+GcX4zNsz87sH7MrSMk42PxJaE28l7cqpB+4dwuzgW25/Envl7o?=
 =?us-ascii?Q?zZAemZhn7Guucq8PJB/aalyvWD04MVqgiJdlMsRrJNGLRNkfWNlIsPUnBd43?=
 =?us-ascii?Q?t3d8aBin8fiWrz/TAFAJ2NmcL6eyt//NF5PfoGF/PV+TIJbzOzS6rFUaSmeh?=
 =?us-ascii?Q?upJbXQfx3JFv/IGeOF/+xFCf/qT1dsV/u0OwlvAD+kwsHntHIqx2+5xEyoaB?=
 =?us-ascii?Q?NQMRzQ+T2OZQpDpd/qQUg8xBa6jjAr1QYG3E4bWRmfKQMk99/KgZjw4tXe9W?=
 =?us-ascii?Q?PzMLrQCp82gyg9XGZYJokpK1bcVfapCYUCkRBABhMTh6TTdEu0+yi4x2YVZ/?=
 =?us-ascii?Q?YelqbxdK8aVo+cGkTFt3yQOuloGh8zr0MSltSeCvx2j2g/O5NYwBvZNjX0ov?=
 =?us-ascii?Q?A98weGfMn23HifZJgBQ1C0LXt7rlrIqR2HHqGqcHSmNouUtJxEv+Z3bgBvf1?=
 =?us-ascii?Q?RuBStsVB9KGst4uMvOLHteakL0HQ5r4UwQyMkCa9dvH7zhAL5uh4pVqbYb0o?=
 =?us-ascii?Q?dwBBK1LOP5woe91rSOb7+/GtvUdm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q8voHbKnLA22FtD2xFiJ0vDCh97xKdiTU7oO4rLZuh/YgTxy/V7i++HNy71V?=
 =?us-ascii?Q?eyLSVK/DqMrW0LUAW3zMr1WetTQUIjOyfk1v2ncKJGTi2f7+yHImNAENdFRz?=
 =?us-ascii?Q?+k9ip0tPfHsiuf0eANu3oc3sVw1/xnIwt7YIwpt+qh0udEzJSDsEcdKN3ORs?=
 =?us-ascii?Q?1memOdSfUO+8JPnybQ385bq9ASQ6jz+rxrL83rFOf6aRoaAC7Bw0t01qVcRu?=
 =?us-ascii?Q?cshZ/ZZ60CzwvYf76/6Q2MGR+xt3pbZaaTqYHwBUg7PA3V6AjLlSHHvHTawf?=
 =?us-ascii?Q?An9upi6ZDLHfp4djPp5KmxBJ61e7JZtdxIfn6iPVw0smI5LkM8XLecbYZ9Po?=
 =?us-ascii?Q?4FhZIAOUq3XMYl6iQ+rjeI8gxcyIyCVvWhsWvok6B795c/Lor6tOVXJKIk2Z?=
 =?us-ascii?Q?NbbD6Etx/b7w8Wn5LB7Xy/8BkQIqyV3nANCn2LlNaozANVhIdMNY3WEwK7Rk?=
 =?us-ascii?Q?TvJ6DEo4jc4oOJV3YgM4JMwO2QjHqfQYekE9Xxs92tZwM0BPt1I4xI19prOH?=
 =?us-ascii?Q?+NgWbUuvvzcOrZldJLaVK9QhODG7iepnbr8BetRiR9hb1ACj8buZdjD8Arsg?=
 =?us-ascii?Q?FCBTst06fD++tfDB/llsOZuO99maI6F/qRUUjIJZeeYYAoswp7J/gOYYQnfM?=
 =?us-ascii?Q?woKJ9N4/uKkWG/hWZcLUdWNpofHyVl/nLdzO19GFDiiig7ElY+hVlQSRhOOR?=
 =?us-ascii?Q?3hvPGNk/o7KwBJlOEt2YN2xZIZ4HQe5NSO+he+7gM2Y6NU6VsX4IfkgQVN1E?=
 =?us-ascii?Q?y3MZ88UuSkzBno6m1zE3eLjyfuPWKaLjcS847RJhHduedwY/RyX2ye918Zm+?=
 =?us-ascii?Q?vmIw2peZbYOeHFnKQG56UQBJhkH3C0C93CX8/brodtlz+c+RdbBEntd+aUOJ?=
 =?us-ascii?Q?uiPpj5R2gUjMwTj9KqcPRrVr58BuJjXWtAk6HDfxaGxWum8F2HlI5Ub64drI?=
 =?us-ascii?Q?6bJytAQ5MpwxwsJqowRS67LnQOkkxpt6JnC3bdpOJbetR32PUDbngwGLI9fj?=
 =?us-ascii?Q?w9CSlK0lZa4igudHGBxeo795LqwnETLHSnvtKK2Q4hK6T/h9U0awWlynLqcT?=
 =?us-ascii?Q?ZbcvNyfIZcx+8Kd+rLXe8DJtSL1+wLqMphjeYioC6NA7bYdTBbpe2L4DM8Eq?=
 =?us-ascii?Q?AoIQNJllenkzgaemz1fmmiQQZx0H1tWloT12fSykMqmSpydvcOdAiWnFt6NA?=
 =?us-ascii?Q?wrOHgcGfgRMYmZg9uDkMXCCZyz5JNz9SeC6JvvzFgfd48z8aQtZDlek5ONK7?=
 =?us-ascii?Q?O0oFUhsuEUQJIMRAhQIt3TUu2sgLUy59D3a/hZ9cVTcBNI9CC20GfM0+pjQS?=
 =?us-ascii?Q?G/t/Y7vFTcP1jJB7cQShMPpTtUVauHi6FqzkDUJbauWGDd+hs2/HVSZIRJlx?=
 =?us-ascii?Q?gNh0aHflcX7K1ss4ai3GsbYsm2IcYSasFIv8cSQoLN2bQ1y3vp2lRPqj9ujY?=
 =?us-ascii?Q?u4o8H93AawzMX6H1nZ/EEr9VTwk9az9GEvbtMFhWyRUJH4masEBnFBjNKSrO?=
 =?us-ascii?Q?txaxREjBSTzjHuztPpHgqV+soL3JKLk+Jydtyt6hGAPncuCzwwKxZbJB1kkI?=
 =?us-ascii?Q?sNVEsaAQF5X477VU/vMgeS2+2KgJL2AfnOcDGXlCVpnIYjsjdFv18josBcDb?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9f443d-32e5-4ba6-2626-08dd5ff48d5a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 16:56:50.7326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Kht604HgbIvAC8UyDmG4KnW2Uy3UKCpGB66dKMYiTgWZ0GNlUZbeXgKqBVrnNIqeGr0a+0unyWU+gp7+jCDsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5965
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

On Mon, Mar 10, 2025 at 01:48:00PM +0300, Dan Carpenter wrote:
> The error handling assumes that vm_bind_ioctl_check_args() will
> initialize "bind_ops" but there are a couple early returns where that's
> not true.  Initialize "bind_ops" to NULL from the start.

It is not a couple, but only the one goto put_vm where this bind_ops
gets actually initialized, or not...

but perhaps the order in the exit is wrong and we should move the
kvfree(bind_ops) upper to the end of put_exec_queue?

Matt, thoughts on the order here?

Cc: Matthew Brost <matthew.brost@intel.com>

> 
> Fixes: b43e864af0d4 ("drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 22a26aff3a6e..d85759b958d0 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3287,7 +3287,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	struct xe_exec_queue *q = NULL;
>  	u32 num_syncs, num_ufence = 0;
>  	struct xe_sync_entry *syncs = NULL;
> -	struct drm_xe_vm_bind_op *bind_ops;
> +	struct drm_xe_vm_bind_op *bind_ops = NULL;
>  	struct xe_vma_ops vops;
>  	struct dma_fence *fence;
>  	int err;
> -- 
> 2.47.2
> 
