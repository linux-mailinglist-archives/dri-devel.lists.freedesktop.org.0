Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C11059483F9
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 23:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB78B10E294;
	Mon,  5 Aug 2024 21:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BptL3cMA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3580110E280;
 Mon,  5 Aug 2024 21:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722892385; x=1754428385;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=66kpLVTbnUWRzhG23wZc/dRqwxkXpyZ2rKCnJw7NcYM=;
 b=BptL3cMA/r8GaGXWRN/SdBibd13LeeeqxWuKtdFTe4BCemo/JpNXs0wp
 X26w6R3zAf7WJqBKKGL8UZRdMtW29msG37GiYCc2o16Ipfe3nBZmBDkNp
 FqOSJssu4WSrFsf4A7UKWO/6y8VFjhL54QEWI5rDMtGLuT+sFsfqxNfP5
 4Z0MFj7icsLjukQtzN+DHncxBqe8k3pvxO/8/azWFwUUWWh6It73K8SDB
 HowFLUFXpMK1LxjvQ47WcZIOiIM7buz5wsowuA1DPopzQtI5Cskc+/YCL
 EasQO/Q1Ue4EHDaZO1ajYCDJAR+FGhT/i+NStXxPcSP/lUvCttnm+HSTL g==;
X-CSE-ConnectionGUID: wbvAcp4zRVuaeHe9cXy8eA==
X-CSE-MsgGUID: kUWVWss/TI+EwUGbWQhbsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="32259945"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="32259945"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 14:13:05 -0700
X-CSE-ConnectionGUID: 6nFvcJ6qQAuqKr83eoAjEA==
X-CSE-MsgGUID: oNY+7fiMQZa2cYetd8URYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="55974980"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Aug 2024 14:13:03 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 14:13:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 14:13:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 14:13:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aessU0xZUbM9eVWbl7QrMy09XAFtNWjOOE0dpOAOIcQ5Cb9DC2e9JDGFEliSMpdNA0h56cQNs/3v+jtchz3JDFVEJWPhdcOCTNVKYlKDLQFgQXBMMKRZHIUNFyPhR437mLrvbBjXNSRkepP+1yE0jRYRSu+hT8tp/WWANJDu4PG3YVMxTnUDisOLZNx1o5H6rIO2O2IpNkRgsx/L/Ul3h9HURKzpgPYGSe3hmOdX5/ScW3tHVHKsG0ivhv3/8J868fVHGPabAcgttbLmw8Rs6/OLhWEHupIbSvfADjQDuEeUqOBbx5L/dG7QB2tKzPYF4vd1ZxIhY6HDGF8KVcJfoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+LOmJJT10azrq2dsObPpo69CZse6PdNqpx0WDA6/W4=;
 b=hC1NJtudKySoGM5NQ950Cb/ED47yQsNQlGASW+Y5KcvSXPBzJBSnStQkBLJhTnLhRBNouA/hKL1RIp5Xew9oOGI3rlIvqPToYtH0LLbqmdZJBmgs06YRFMOBOwS4QqBMvu2Aj6xDPalqdISohB+NWpZWiZa3U16itaIHC73prg1z+ETjNfh49Atzz8qeoOHCpkVHtqIgIxVFySYrGtfancIYNdqMwvPg+zHfEshaM9OSfP9FgBjAjbcWY6AIomlb2YyIf7b83ilZu9t+g9z8EDzAOolKoKpmyFbZwwCa11oRcK1b7mo8ztKta//0ptrxw0elHC+LQalPj6woTERfqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by BL3PR11MB6458.namprd11.prod.outlook.com (2603:10b6:208:3bd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Mon, 5 Aug
 2024 21:12:59 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 21:12:59 +0000
Date: Mon, 5 Aug 2024 17:12:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Jann Horn <jannh@chromium.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Jann Horn <jannh@google.com>, Chris Wilson <chris.p.wilson@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>, Andi Shyti
 <andi.shyti@kernel.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/gem: Adjust vma offset for framebuffer mmap
 offset
Message-ID: <ZrFAVle8pw3Wm0wH@intel.com>
References: <20240802083850.103694-1-andi.shyti@linux.intel.com>
 <20240802083850.103694-2-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240802083850.103694-2-andi.shyti@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0032.namprd04.prod.outlook.com
 (2603:10b6:303:6a::7) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|BL3PR11MB6458:EE_
X-MS-Office365-Filtering-Correlation-Id: bb287e65-dbf0-44f3-02ae-08dcb5936201
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S3TpWMoFRIMW3k/VVe4l06Jm9WSOLXrhBB+eA1OpVD5oJjwo67aC+ctt48hz?=
 =?us-ascii?Q?p5VxTqv4oaNvClUAXeuqc4g18jOK27Unc1P2IwTx3ROP8cG5MDrhomGhtkSt?=
 =?us-ascii?Q?bxLV3HW7zzPCHoar0L8lOwHs2C6BQrvx7AJbhG/4eBKQIzGZWcvo3fQyZ36Y?=
 =?us-ascii?Q?C/aQSbxgYqkuRsvvW/WON7Lur+UlVPetzOw8LK9mvOCBOPP04QBR+lxY6t7t?=
 =?us-ascii?Q?QDAkGl/XpC7DejCL3lqZp29pFCZq/E4u64DFEaonTyyGoTO6M3vrOPbL/tpA?=
 =?us-ascii?Q?mdx4Ez7cyPEAPCCZg0iUPPl2cBz3EZwOKyLZfnM7NGeJIWaNZj60bNFs4BJQ?=
 =?us-ascii?Q?J7dOmSCGLKTYLoAL9+0e0DZaj2Ef+gvbMPctnR2CMqhpEtAEKBKsTh9ic3in?=
 =?us-ascii?Q?xzLgEQe/EzKlE/y5kngu7pr4jeIL3UPPBIJM/1tl1rzkycSV7uXXrFV+nhj4?=
 =?us-ascii?Q?xO6F8YQI/3MQASu2UEC95bwks/+B4vwzRZb+vcpdeveq2guHa8nN2RniHb5N?=
 =?us-ascii?Q?2SLnH/dvhtedaSIT3tu/uyiEib8Ryifv0RZeECkeRyC/UzQNFDz5a+6V2j3v?=
 =?us-ascii?Q?nYcF44MDDY4S5crGzX6Irvd5dIAzbvOOowGOywY3mjNz4giO+LQ0nxnZAGhK?=
 =?us-ascii?Q?NduAN7YMHeBYVplrw9b6fuYXhnMwQtmgONPPFcXE5DMUcJm5CCuuzZKp7qgn?=
 =?us-ascii?Q?SW7V1A7xkuOCuf59kjpkvWjJaHmtvjwfDd1c16MfJa95XSiNTdp4PGwm47Q5?=
 =?us-ascii?Q?w/aLpK49/wuvn/gQ9qunk6gwNFYI0SrOG48f6oXgnokLxUhoYJFEi075S0NV?=
 =?us-ascii?Q?fMtLD11TjgefJ7IbvBihatcmk+90Pt8NOEsBVmqaO1YvtAMhYxOafzf4dYdX?=
 =?us-ascii?Q?XzTzAuIP1UnkmLQeE3AC1YD8vKLPJbiyIQN3jiLqnbEK7oefYGzawsnG68tS?=
 =?us-ascii?Q?O/yx87UvgWK5Dlu/wG4M4fsI1NBkKQIudJznb16sbnOoejHQBXdRjYC1Y0f/?=
 =?us-ascii?Q?nRvNQpQHafFjwY8olBe0lXgDuNBjRF6214JYmhNGCnriuhqvHknvE5IKQQC0?=
 =?us-ascii?Q?6SA/Ufe3M+vpMQaszwqSrnsGKqQir4p8WShLBMn/x+5DfwMUhWiAfNch+f2J?=
 =?us-ascii?Q?3TkpytTFnkE5LM8t5SEHhEetoNUTWfyWa/qKodtodNQHZ5ZNjWV60zNptDRx?=
 =?us-ascii?Q?SO4/d7l1fSk+65hlUwd7k7ijYA5byRHATMGDslPsqhRZAH5qNlNopFQ9My87?=
 =?us-ascii?Q?b9s++xE14uXK8gGIh76FyaDLDPT9t90Dav1yrKua2/AeerHfL6vPEtYzynkv?=
 =?us-ascii?Q?Tnb2DDgS8uV6VrQGwGbkyAymw63SiUs9I2fofEvUbun1Ag=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6DAGPbUOc80/qZD1OfJty9BEJoJ6/ynXkc6Fbt7zSukxlZq46Fujk54jVoe9?=
 =?us-ascii?Q?P5Kmq5HTywS53G8q0Ma3epmatTwyp4WwQEDv3/xiv3MIvT2KR0VkZZcnk7Fl?=
 =?us-ascii?Q?5Dj3uOBQSQukjDlCxl0PZvMnVCI/Lpd3fV6bBeeiE+tfdMu7KPHj19ydnsjq?=
 =?us-ascii?Q?zncLP0IJcZUETEz5LKBjSit5plZlsqlQ1pupC+u1AGUHoSP5nnitpArzRMu5?=
 =?us-ascii?Q?rBEu8a8NtYrZ4NJ9Yk7BuDd8jjouYSiJlxWSB3IQAvu2g28UTlpi4EgReKDi?=
 =?us-ascii?Q?AiCA9XSlve2nkJrFg3RKpmTRpxLVArnsjNoFcNMX8Bk1k2zh2UJmtpEfshiN?=
 =?us-ascii?Q?kPWvlo/pxVd5vR46IY9Z8OOmSAlNhx10A31OOgOrlLxZoDcOvzNmTMg7Laqt?=
 =?us-ascii?Q?5/vI2/q7wigCwDUVT84qRL/FcJ6RAXyKrhlmZ+7GdoRqagiNbTAVqDa4ig/2?=
 =?us-ascii?Q?YwNuQgBFaoVqHCTPxpQdK5Vh28eVCX22DOx3gwEwpPw/Mgw68LAnsCLY+67S?=
 =?us-ascii?Q?l/Y3QOqkqIRMVVr0YzkWDj5J/EvqkCpWK+n6nH3LkdR9o/xxZmheAhbX9XX1?=
 =?us-ascii?Q?Rb57Gj3VL1bMjAwkiaaGo77uyeUMYc/xXp8FVmy/dmXTmCV0WfRP0wcgZOFt?=
 =?us-ascii?Q?g8gFPBtPYYj+naysxO1M4nK2Q20bKaVrA4NrLoO/wOxB9MFVp/4W7BKFdOF3?=
 =?us-ascii?Q?tEBWOVOMF/l3ON00DP1LYEhnc4HkvOWouH5JLHEuoHXPnI4j+gDLI3OB7eBO?=
 =?us-ascii?Q?WcB7sDhd5vl7/VB/hN3dU0QnXk+0GMegVKuLDYQgIJozsBzOodYlsYgAgmrs?=
 =?us-ascii?Q?RofNBug6EQL1Rjy6iJfCvoTqmFCMm9QpLr+Yu6PyAqdt+vuNm7gHuh2uopX+?=
 =?us-ascii?Q?J2qxREFDn7euqb6WKWwRoJODxYwGVFiW9aQlzeWVXpnaMG1fVMusvIjl8055?=
 =?us-ascii?Q?h33vrhrCcZ2PjY1va9hD3FtNEzTPzMmiQt6S5/HqzOj5KItctpnWhE2AEvMv?=
 =?us-ascii?Q?avCBjGheKkRSBKMcd4Y9m7nIg2W44zX94bXLhD+tpZYEV4f4sY/5A3+rPYhy?=
 =?us-ascii?Q?JxjSsQrqeUqxPi9H9pPMvy4gRknDDobcTT6FUbao9E61TsXw4Le1uMCHsn2A?=
 =?us-ascii?Q?Cwouo4aqJ9kLadkCLnTpUOJgdiZAw1yvlvby+diaIkzJNmjhNgCUR4vaEYEJ?=
 =?us-ascii?Q?EKyoyaC6fzySfbZtDxxCHXalhq4TDUSKw2ySu4Lp8GDTTNyJx+Joirhv4iNs?=
 =?us-ascii?Q?DkTxtxtiJFihotchM3WNPdUg76X5tJucsQQXR84ldVgK9XFSg3TPrWxjJcvH?=
 =?us-ascii?Q?1OzOAqTUju2zKvP7XCmVtoJB7WCjk043Jpk4HEj6sH8zAckRdoNn1gyjnwO2?=
 =?us-ascii?Q?QgwXFe9MT/eYX/Y/ubak57uepJ7jOwMBWNcJSkrVzhHQ4vIofjtk4WzLgBv6?=
 =?us-ascii?Q?cKSny2UzrWyeYOWoETsnZkKxOMWhvRXq3dRWjvZNJU3/GUxcbn8bGA7tDn3L?=
 =?us-ascii?Q?AcObamqeYeMuWEs77grXyOl8OWSAFw2Bm4AqXjq2JMOryj9H0WvW+/e/vJmB?=
 =?us-ascii?Q?5iWLkoUQie+9G1mO8Vha1NJqXhahGC855+KOrdNrbo20o+C+eqc66SsPJCMA?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb287e65-dbf0-44f3-02ae-08dcb5936201
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 21:12:59.3038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n3XD/HYk2H0BDPqbSl2zx/JTW2wGp4LKaT1GVZ/2JrrFq67Ppcym2T/+z4k++H7vwCYrCUTJTSvjyPLFR7FlTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6458
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

On Fri, Aug 02, 2024 at 10:38:49AM +0200, Andi Shyti wrote:
> When mapping a framebuffer object, the virtual memory area (VMA)
> offset ('vm_pgoff') should be adjusted by the start of the
> 'vma_node' associated with the object. This ensures that the VMA
> offset is correctly aligned with the corresponding offset within
> the GGTT aperture.
> 
> Increment vm_pgoff by the start of the vma_node with the offset=
> provided by the user.
> 
> Suggested-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index a2195e28b625..ce10dd259812 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -1084,6 +1084,8 @@ int i915_gem_fb_mmap(struct drm_i915_gem_object *obj, struct vm_area_struct *vma
>  		mmo = mmap_offset_attach(obj, mmap_type, NULL);
>  		if (IS_ERR(mmo))
>  			return PTR_ERR(mmo);
> +
> +		vma->vm_pgoff += drm_vma_node_start(&mmo->vma_node);
>  	}
>  
>  	/*
> -- 
> 2.45.2
> 
