Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B9B7EBB9F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 04:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4785010E38F;
	Wed, 15 Nov 2023 03:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6906C10E38C;
 Wed, 15 Nov 2023 03:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700018069; x=1731554069;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l/dRyEOVygp1kxZBnb43VWa24kgynI7fdjJzB0pMGXM=;
 b=IemfSY3t6f+ot/MZBv6+4XKwIHNW5GJdABD4wSEO9Ixy/WuKJ3cKv3dz
 GF39kN2xRTGtYy1DORmVoipoloiCqs3eA0hZrb38hzgjZf7t3JAo6MlFb
 qOFVzxVTlq54G2+htXtNmWHqa8fXyUsDHK8vmgILSNUsiTWo64E8MuJIq
 Xev/QJ5USAVZu7IjjF7VzO8KkGir54HzMi6/zkxmY7xMuXTfc0pmbKLot
 NIGdhJi4Vp28IwMKvC52RnXo1Nw0N+JED0abYMFCa4x0xKSst1ojost9n
 hC+GrDgNAmNX6arG56ZkdjDX2LNi8r08OLbr0nQ5rfQtDbe4q4AyI6X5Q w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="389652779"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="389652779"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 19:14:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="830822485"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="830822485"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 19:14:13 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 19:14:12 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 19:14:12 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 19:14:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMtgbNXg+WVqj0nPb7qz5579N2Tf6fFRv2oeiw/vtS0VmN8QVUEeJUEDJi1o6Rk0bJUItCz79tpPeRfuBSyoPsHgcPvzlY4EeGP5jVDdidOcax/zX2icnwTgpocuV5uE3XiBvdi0d5D4fjk/cddPGOJA8tlK8Q5EK2HwxJqPjK6ArppEEV7vDGSbcRxXMI5KVGZrtrq2R6iP3jm0Kpy1L6bhNlNalMfvDPTmnoyVkAFfsuhFRmWVVlAZaI6/LIgMpvaUDlXGRz9WC3f7t1AIUFrglnnz+YlWanaGTEd99UJAZda5vYgQAIhyVJU7sVWlSHLUxJEG8x+YA+8MVY8Qjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHSbBGVlibLye1AbB5I7hKBQZb78wwBItvUbSf4qoQM=;
 b=GmcciDKWcGa/kpaJpMrKxtORmB6COKrwPqkgOYdKSB7HItvPbTNP51pJJ4OUJuAs5EOvH5YPM0gZX9OQXWZ0Fk1Tx8vLgXoBmpBqaP/PlbtmSAP2ILjlgC4RyYJQzplpWY036HeOv2rWuFnYBbrc1MxrWp5E3rlJuUVNoWeNaqYD7wJMKOgosRNTDtfWgO909pAg6R7RtfkUhy6jcyuKX5wlw/OQP3OCBUXGaNyYEYGbQl1Sd5aKjycTu3oDBUI+NW1ve/29pQL1Q6z3NsEuy6SpAIenPn+1y6E9hX+8/uZjJdyEnmMNS78K3wxDQjlgODJkswxl+6LxJPyPR8mRXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN0PR11MB5986.namprd11.prod.outlook.com (2603:10b6:208:371::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 03:14:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 03:14:04 +0000
Date: Tue, 14 Nov 2023 22:13:59 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Paz Zcharya <pazz@chromium.org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display: Fix phys_base to be
 relative not absolute
Message-ID: <ZVQ3d8FFqxsy0OX7@intel.com>
References: <20231105172718.18673-1-pazz@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231105172718.18673-1-pazz@chromium.org>
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN0PR11MB5986:EE_
X-MS-Office365-Filtering-Correlation-Id: cfb259b8-89e5-4d85-736d-08dbe588ec3e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Y6cftXAWvyri7aqKp6afdI9jG5q4lKOSti+PFfzMI9EIb8YkJZlecosH05K+78vzLEDSU6kkzHjyalRjck5z3mTK2KlEXsJLZ+o7D19RfjBSLicn7FGwnCjbLqVOsveDZ6Ym+F29LkjrvAdRsAQpvTcmNhDeY06noYnaFJmfaup02HNWop9t2Sm217IEN+wI8hAMPXQXNcLGGD5Qf7Xco3B2jXl1NMrX+INvZzjGy5q+Tdxhmn7q9/Zj3Sw0b4bbsCNGOsVoxgoWOok/9c2FAWlqAAWXemYZvNWDgUPKV2wziyOLDIDEa/KBT/+1Le0ILOelkdUAAO8DII8iPpogE6T25b0NYtfiDJr1OEROyHO+LtwdN41cxPl8CiN5FLZQqudIcKtDYabeaSsPnhI44ntd4KggVXTLz2J7Hfc4yEIOR7nXG1m5COPyv1DBM6ZvAQbnhvnozrcDUsv8hCbux6Lx2aawu9Fc1yKXBEjeF5KzPZTADurG2eC4rVVeAYcDPWyPTJV1cYvjMyWBy4YztjygtR9dAcEwiQlbV7dSPOcIZjsO/q+Sbl7BzfKaP2I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(346002)(136003)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(36756003)(86362001)(82960400001)(83380400001)(38100700002)(107886003)(26005)(6512007)(478600001)(6666004)(6486002)(2616005)(6506007)(54906003)(4326008)(6916009)(8936002)(66946007)(66476007)(66556008)(316002)(7416002)(8676002)(41300700001)(5660300002)(44832011)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EUe9PChdaTlz5vZkcX1ioFd7tNhVW2sYc6yUXICilkqgChORAsUd6bc0hgvR?=
 =?us-ascii?Q?yPXK532SE3PYfEiKhnmlIeCTrHMiaVlk8w4TohTwmsTE4k5nU2wbo3g4Yv6h?=
 =?us-ascii?Q?U7Xm21pczYvZZfonYok0mtYnUuW3RntM+nlR/9irN2LMGfiWqJUyFU0/KrQm?=
 =?us-ascii?Q?Cd0c9jlyGZsrozupLIF7REyuN+GVCqamDwXhnC6GfpfACi/tgBjo8+TdDhGD?=
 =?us-ascii?Q?2tOxu7cCqBGHN3ZInOylVHgwQ/4L7aWRAQK8RulbEDHR/5Ux9NRNF5BIy7IW?=
 =?us-ascii?Q?lh91E0bUN5UbzltXK0R24Mavdv9XYlHSEe90yTS8MaQ/qvmU0X9gjfM4LVYH?=
 =?us-ascii?Q?KLBW1k9jA/s7/auMhOxlkpfoAvwAkDW5gFJZ3yxvEoD0PhpA4yXchQt2eYwK?=
 =?us-ascii?Q?QQiBwvpsR8b0ft3GeXbRNTid8mMXtHZ9XNHJSClogAl84piwxR1GodR8rwuQ?=
 =?us-ascii?Q?5d1PzY6AjVdKdQEXgVa3MHanVeub+igPOYyxwLXQUrUVuTH9hKLLRfOjyH3h?=
 =?us-ascii?Q?r5rQoyzF895cApvM4jgm6lPKvtpawBauOuRW4hIIC4SDBla+exL970EB27qL?=
 =?us-ascii?Q?lXupOcUv/aMVGGhn1rwsUwnxIqdq6jLWwk4L78fRjkIEw989YPhfj5Ej5xB2?=
 =?us-ascii?Q?vaGdhzjhQfVjSH3gvq+0i0Bu9ao8rLHcJRA2ls+Dx8ld0zTmOXl3p1c7ATJP?=
 =?us-ascii?Q?Mv5qPBQq3LE7tdII+zB8X+TL2kJ6dKGFfxZoYSMRNqqijLRP+ITahCgL3kWC?=
 =?us-ascii?Q?bRf3NCnJIqXtvxzyZyhyzcMmHV7QRiH036Tni3qg1RsKGfIkP0N7zygHCPNO?=
 =?us-ascii?Q?dfiBZxr6Qr81/i9dd02o125NnjSiIcVYopk6W0KySUUl81CJexhNRj7Y4AnD?=
 =?us-ascii?Q?y/3CrNRCAe2wkPXMDwYqvpU5z/pSCYtX4lXR4RQGn9yQU/khEtyGtLNd4wFl?=
 =?us-ascii?Q?VdzUhahpR6syEUL1LZQ96DAB9W9JzzVd9Mcoii3wNoxD/DMDuBtQn8P5tM8W?=
 =?us-ascii?Q?o5AxEFzVs0aF5UFPlCaGuJ5uiSerkDK2irKBgSyPSsGob84q0ZNFoGW5mfnk?=
 =?us-ascii?Q?3hwleZaCb/prfOAlyqsGwxjmZ5HaKKSbFqUMCc44zH+4v+TxF4I5NpYQjXw/?=
 =?us-ascii?Q?o3MnzpLqL4UXcq4f7CL5G6bdE7eDyGiM4/zM9JtaTf+5mxURX1UuPqE2h6sm?=
 =?us-ascii?Q?PZ4s3hu05+mN1i+nIukbm+3go8vgQD4QK+7FqedDVIuk7JbdRk4hJGDXlH97?=
 =?us-ascii?Q?/7U/Wdt6YhOmYTrIjA1yoWp3WlzWYyzWWdgv48VrHQBx4AD72Amz9CMOf3Vf?=
 =?us-ascii?Q?12B5MrQJuQSEinp57Rbflv1FiSvHJcaZ9W4wDNb2E443jOMol1o5okry3hNM?=
 =?us-ascii?Q?yaZdVHsuPBGi0PnH+3eoaYgx+1nbPYIGYN3alt7ut12Qy/05z7SLmzX9gl6R?=
 =?us-ascii?Q?Bd5+HOvb1ajNB19IKsj40oxCEy/gYdbDFSAKOkgSEtcgBN1/mp9n5ckuL25z?=
 =?us-ascii?Q?I+odyoBvYb5RWXV48Ql1I+YJUVbVdMeCD1zqc6rdDSiezd0BWKvFvvQ22kOR?=
 =?us-ascii?Q?8FwBiMfIr8gL/bYrHW4WxmUeqq30RBDTuwiEyPsh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb259b8-89e5-4d85-736d-08dbe588ec3e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 03:14:04.8184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LYPS7w0j3bWFJ3WoNeRZFjNNA7ozRKD4iMxp7az2juBjdJOYY5MzAYBTVGUu28sMp+g6N9/SfqXy9jEfzmYKRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5986
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Subrata Banik <subratabanik@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, matthew.auld@intel.com, Marcin
 Wojtas <mwojtas@chromium.org>, Drew Davenport <ddavenport@chromium.org>, Nirmoy
 Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 05, 2023 at 05:27:03PM +0000, Paz Zcharya wrote:
> Fix the value of variable `phys_base` to be the relative offset in
> stolen memory, and not the absolute offset of the GSM.

to me it looks like the other way around. phys_base is the physical
base address for the frame_buffer. Setting it to zero doesn't seem
to make that relative. And also doesn't look right.

> 
> Currently, the value of `phys_base` is set to "Surface Base Address,"
> which in the case of Meter Lake is 0xfc00_0000.

I don't believe this is a fixed value. IIRC this comes from the register
set by video bios, where the idea is to reuse the fb that was used so
far.

With this in mind I don't understand how that could overflow. Maybe
the size of the stolen is not right? maybe the size? maybe different
memory region?

> This causes the
> function `i915_gem_object_create_region_at` to fail in line 128, when
> it attempts to verify that the range does not overflow:
> 
> if (range_overflows(offset, size, resource_size(&mem->region)))
>       return ERR_PTR(-EINVAL);
> 
> where:
>   offset = 0xfc000000
>   size = 0x8ca000
>   mem->region.end + 1 = 0x4400000
>   mem->region.start = 0x800000
>   resource_size(&mem->region) = 0x3c00000
> 
> call stack:
>   i915_gem_object_create_region_at
>   initial_plane_vma
>   intel_alloc_initial_plane_obj
>   intel_find_initial_plane_obj
>   intel_crtc_initial_plane_config
> 
> Looking at the flow coming next, we see that `phys_base` is only used
> once, in function `_i915_gem_object_stolen_init`, in the context of
> the offset *in* the stolen memory. Combining that with an
> examinination of the history of the file seems to indicate the
> current value set is invalid.
> 
> call stack (functions using `phys_base`)
>   _i915_gem_object_stolen_init
>   __i915_gem_object_create_region
>   i915_gem_object_create_region_at
>   initial_plane_vma
>   intel_alloc_initial_plane_obj
>   intel_find_initial_plane_obj
>   intel_crtc_initial_plane_config
> 
> [drm:_i915_gem_object_stolen_init] creating preallocated stolen
> object: stolen_offset=0x0000000000000000, size=0x00000000008ca000
> 
> Signed-off-by: Paz Zcharya <pazz@chromium.org>
> ---
> 
>  drivers/gpu/drm/i915/display/intel_plane_initial.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> index a55c09cbd0e4..e696cb13756a 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> @@ -90,7 +90,7 @@ initial_plane_vma(struct drm_i915_private *i915,
>  			"Using phys_base=%pa, based on initial plane programming\n",
>  			&phys_base);
>  	} else {
> -		phys_base = base;
> +		phys_base = 0;
>  		mem = i915->mm.stolen_region;
>  	}
>  
> -- 
> 2.42.0.869.gea05f2083d-goog
> 
