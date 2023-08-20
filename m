Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBF7781C45
	for <lists+dri-devel@lfdr.de>; Sun, 20 Aug 2023 05:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA4B10E0DE;
	Sun, 20 Aug 2023 03:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE2910E0D0;
 Sun, 20 Aug 2023 03:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692503086; x=1724039086;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4TAFfstcThoQwJSzW/GbrfXCDo4BnB655aEW6JqqMLk=;
 b=D5cmPUD7YyLb1dBU91CWIJt/vRf0jD0ecf/3Mh9pauEGddT3hFTdNVVi
 AnJ5T+iAE97QBfxyP9x9Grt6Ux1kPGpcm8yP0EZ0sFz4A5aleRHZhkVBx
 DsaXabEexczdxQW+HQOpf0+jAN1WVWgGidINAXjPPpYKpcH2ec6NML7U7
 SM/4bayEJQ7lS6udS+GGl2qNPr6MownAfko3OS5AyflZpGPtkeGYI3OuX
 wca+6GHsgZvh+0chGOagJlLvCyse/1Y+tNC7oNzRRkrlBFpAom5h8oB94
 zspW9dkgtEyJ/v3Le64D/oPp7vJi//8Q3ERWhO0NknuGTXApedbD2NnQp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10807"; a="363521852"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="363521852"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2023 20:44:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10807"; a="859112744"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="859112744"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 19 Aug 2023 20:44:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 19 Aug 2023 20:44:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 19 Aug 2023 20:44:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sat, 19 Aug 2023 20:44:45 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sat, 19 Aug 2023 20:44:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+pyZ1MFIwQ+AHp4BLR+Un4I5N6WvOpft2kQvLKrXwEJ7ZcTN6r0xGLKNw6nrNN223KRqyij8OOqivP8DsiauRRoMTFSnvCHUVM68uBB7+ecT1Rvd6YpwY9tRVsph9jhTZH3bVqQaKY/4sPQfbEAnNXkPtyR5KVc16cB4mUy4bjuCwvcsmEbOm8pFNbzCEODfORWkUDBRFQQGZbSv6HyLp+1Maj58bAp18BVp5cPonni+Si9Fa77W4UbTyLPQhAockZNr7CFYjAldnOxPBvqtVMDIthKaBUsH9we8ITdQn36aoeUAV47S3l+ZvnKCdYxRFKb4yP2es8V+5jil6c9Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ghhX6FI+Nfrn2DOT4pzh11n3cC/c3++cIXIOUnRh2E=;
 b=FuZIQ6Xmh65Xjz6aF36PWG2XSjNdkKh+S/vgKurhcFdi8YgZ1K5MgcP1/z5FIRASCGaqdcqEinlAYNt/R7aj9wLc9XagPjk38kalqJYaY2hWAc3w0Xd4PKKRRZdtK/CQ0BgRdafubjx4l3cGRjQWyYwJl6iNd1h9TPV4EoE/8vhkV8RJIgnvIdLGW+I/RhAh6csjfpiQIdC7a26fo0B+mcxx6ZyWnEzt/nyG71+1llWEv1Z7hnxzpXrKFzP0Eo1BSeuy2yi/Hv7LUpBn0mU6OcZtpDaT1w1bzCfa9p0kHTGznLnziezT5Ogk4IouYk7e36SGKppYC08zS0gvE1UmCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7572.namprd11.prod.outlook.com (2603:10b6:510:27b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Sun, 20 Aug
 2023 03:44:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69%5]) with mapi id 15.20.6699.020; Sun, 20 Aug 2023
 03:44:35 +0000
Date: Sun, 20 Aug 2023 03:43:29 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 3/4] drm/xe/vm: Perform accounting of userptr pinned pages
Message-ID: <ZOGL4bY8NvFrDP6O@DUT025-TGLU.fm.intel.com>
References: <20230818150845.96679-1-thomas.hellstrom@linux.intel.com>
 <20230818150845.96679-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230818150845.96679-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0152.namprd05.prod.outlook.com
 (2603:10b6:a03:339::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 7379c32d-1711-4b89-1a8d-08dba12fc50b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fdygvqJMumQyLR5zX7Vsl1LTDsa+8fpO9nDNRQIkQHm2CE3zNKpuZCBidQVv/+oFA0pGv7LiSCScDv4NT1QOwpmckPTjsLhhA5grkz0RBNP9l1qL0lL60v2z/4gNW3rKu3loA23S80Ig+pAJ54yJ24IDYcy1CeLvbAqWR6hMgpnboZtU4+k7bzMDcKvBFmXLug+2OdhM4a6jR2QUfqy7ipS9ZouJ9us2EFl7Pf+q3W/AfC8lH/XmlB9r1WYfSfI67N+uBpT+bki4g4gR5OnM5kKKHnRKdBIALuEbRyQb+i5Nq9jAJi2cauU+Hcp20dsHNBfOrWYxPMaDdU5cF0w0rM8HXenB2QC/dtRhLcMemuc46JX+0xdtGoHJfGr67nvDlzGFbuxCqPRmlpKGCg4FQJeWWngJhwLDa9zRFZGnXwTGoqmwtVn3KUCYpTI8Sbr02LlKiU9PJzzra/x8lQrpqYn3ZzjrByYDHv/4IrZInjseDmLFTfAdYxeGWk+xYNjFxGvANenZlAHlYv9jyu+YfkKj8TB9j0eOkf8T72P3eOTc3GJ+Z1fMDzMkyHW6G9v2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199024)(1800799009)(186009)(86362001)(44832011)(5660300002)(15650500001)(41300700001)(316002)(2906002)(66946007)(6916009)(66556008)(54906003)(66476007)(8936002)(4326008)(8676002)(478600001)(82960400001)(6666004)(6486002)(38100700002)(6506007)(6512007)(26005)(66574015)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RpmhLL2hVcYg6Yro4LI/wtEGT1nSjNwhEekjc03DXCWOXEHqoAOWiD0ihj?=
 =?iso-8859-1?Q?VsZ0srwKyOqTISaJEcorSVNtyOfnBxKOiWltHR6SNFNEOfHx18hflQpi1V?=
 =?iso-8859-1?Q?/M7ZOYESbE0puPxRVeU3+6eBenv0WbfSedn/kZnX1fWHyxCmet/AiMs+39?=
 =?iso-8859-1?Q?sF1EV4gfNLpaHCquob0GLsjBBss3eMEjWERwUs+pmVMZ1q3CxU0l+wIBgu?=
 =?iso-8859-1?Q?3SKebEHA3JjJox6t/Am1qTPN2dOA/N7nHuMQa45ugS9YbDPOtXNYU8yReC?=
 =?iso-8859-1?Q?K+tANkz0yqllLYi1eAPV8aRPX55I88u2bu2iW+xS4ELi8tqK1vh/TGSQOi?=
 =?iso-8859-1?Q?U5JW7F5th+PzFXWQYx8uhUIITpSGl0OCmzqlADKWBwAQqiVHz3nJmOJ/ZA?=
 =?iso-8859-1?Q?4rppBAEoTsHQhkCqUsiq8dO+tBf8n2rVBqKptgYvIrbN2jamGPHunyHjk0?=
 =?iso-8859-1?Q?7DF8JFxa+0MAl0Nf/5s1rqi5eiEQvebyiT/4FPy0W7Dd15qT/bBmQ94B95?=
 =?iso-8859-1?Q?63RDSRndvyZYwc8KzzTdM+Qd8ul9fe7wcro7QLQOrQlxefwDpYbCGcKTYE?=
 =?iso-8859-1?Q?Im755wCofCupu4KKDgF4ink8vxDqI34ToJmNEm9nHr9IL3CuFOkkn6jj2q?=
 =?iso-8859-1?Q?t1LNMTlqV5WO0sZM8cO9Jqu+5scRm8ebZRO5WqmpP0Zf9uCNvcS8oBKJRY?=
 =?iso-8859-1?Q?/fw7VqRr/Wo8ME86QOhmjY7dCIHgtnQY/3VGRIihgMbTj6JwX0WYZSR009?=
 =?iso-8859-1?Q?Z+xFiDWOvr+07FitOWmNvG+4VNYRTaS/AECli0UcpSDh2RBZLKsDl7+kgv?=
 =?iso-8859-1?Q?Cq+roMfr2VFxPo2LFMUJnRWx3LdFuVVfzwomMQqYvDUyfMHGBNAtgzYdHh?=
 =?iso-8859-1?Q?kLM/8+4fXilcQqmLKWvyX7Ud/d7+fx87Tq39eba4rRKfGU1QSvsOUgAoal?=
 =?iso-8859-1?Q?5krZK87kxM4cfmibEV6nttwDO5FXaaOkd5P4J/hqz2UuuSGk7NKLizar87?=
 =?iso-8859-1?Q?w3brzhr+WGp379H/RAUZq1haULgmL/3m+pFhBrunnI/y56dBK8IQ9KH7qj?=
 =?iso-8859-1?Q?OFUH/lmF/1Rq9+PuHHLn3CfRCLfo/yMyRP2JK3VW/8rdaplKatYX5a1PYf?=
 =?iso-8859-1?Q?XL+swxKNNCTe6NeYU5shOTwL4Rj9VoRp12yRBK0q3FfQQhj9r0gS9/x1ck?=
 =?iso-8859-1?Q?9llp3dLZkVhna/YnUfjwnDo6cyFvk+7hxs2OUyd8GBHCMVkSMjdzhl8EcV?=
 =?iso-8859-1?Q?QrfWfKOX5QARn80bREttpd4YR9LQwL5/LZS1uEny0NvEBmLYp0m6VW3ABG?=
 =?iso-8859-1?Q?fWYneeEZAmlG7Rxb8fXO3Iz/Vq7ovMfIUo0PTJwQ7pv6aGsJ7wGUPOHXiy?=
 =?iso-8859-1?Q?WPz08hmuBxQzzSg/SbDN/kMSpqhy5dgmdGtt8DfuaAaTPviKyHoMV1A1Zy?=
 =?iso-8859-1?Q?9Gr9AozEhNszUPMumvcUsiIkJx854OdAYEHIrA45fy8hC1vy2NnoUAYL7+?=
 =?iso-8859-1?Q?OozyEKGW7EtkPDQM20M6N8myhqxs/mvi+7A5WTssWrUYGjwV4wif0nAlws?=
 =?iso-8859-1?Q?IqaqUwq4OyULyuKq9RqUiGoNlNWVgWWYtZTXmsMVGM/gINTUVcfrQRUv0m?=
 =?iso-8859-1?Q?sXprRpmh9evQV4rMiu5RE3Eu8hwWO+/lcC3e36sMrpSubfKuZc3/PpPg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7379c32d-1711-4b89-1a8d-08dba12fc50b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2023 03:44:35.2116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oleEcJ6XMm7RjXggTWxaPwkpm8rcT2qVPd7hWd4y0/yGyJnIXO2+ZvSn3DJIkaxE/zedjL3AyoKvgNHVp+Hykg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7572
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
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 18, 2023 at 05:08:44PM +0200, Thomas Hellström wrote:
> Account these pages against RLIMIT_MEMLOCK following how RDMA does this
> with CAP_IPC_LOCK bypassing the limit.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Patch LGTM but nits on naming + possible assert.

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 43 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index ecbcad696b60..d9c000689002 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -34,6 +34,33 @@
>  
>  #define TEST_VM_ASYNC_OPS_ERROR
>  
> +/*
> + * Perform userptr PIN accounting against RLIMIT_MEMLOCK for now, similarly
> + * to how RDMA does this.
> + */
> +static int xe_vma_mlock_alloc(struct xe_vma *vma, unsigned long num_pages)
> +{

xe_vma_userptr_mlock_alloc? or maybe even xe_vma_userptr_mlock_reserve?

> +	unsigned long lock_limit, new_pinned;
> +	struct mm_struct *mm = vma->userptr.notifier.mm;
> +

This be a candidate to use the new aseert macros to ensure that the vma
is a userptr + pinned? Not sure if that merged yet.

> +	if (!can_do_mlock())
> +		return -EPERM;
> +
> +	lock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
> +	new_pinned = atomic64_add_return(num_pages, &mm->pinned_vm);
> +	if (new_pinned > lock_limit && !capable(CAP_IPC_LOCK)) {
> +		atomic64_sub(num_pages, &mm->pinned_vm);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static void xe_vma_mlock_free(struct xe_vma *vma, unsigned long num_pages)
> +{

xe_vma_userptr_mlock_free? or maybe even xe_vma_userptr_mlock_release?

Same for the assert here.

Anyways, I'll leave addressing these nits up to you, with that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +	atomic64_sub(num_pages, &vma->userptr.notifier.mm->pinned_vm);
> +}
> +
>  /**
>   * xe_vma_userptr_check_repin() - Advisory check for repin needed
>   * @vma: The userptr vma
> @@ -89,9 +116,17 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>  					    !read_only);
>  		pages = vma->userptr.pinned_pages;
>  	} else {
> +		if (xe_vma_is_pinned(vma)) {
> +			ret = xe_vma_mlock_alloc(vma, num_pages);
> +			if (ret)
> +				return ret;
> +		}
> +
>  		pages = kvmalloc_array(num_pages, sizeof(*pages), GFP_KERNEL);
> -		if (!pages)
> -			return -ENOMEM;
> +		if (!pages) {
> +			ret = -ENOMEM;
> +			goto out_account;
> +		}
>  	}
>  
>  	pinned = ret = 0;
> @@ -187,6 +222,9 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>  mm_closed:
>  	kvfree(pages);
>  	vma->userptr.pinned_pages = NULL;
> +out_account:
> +	if (xe_vma_is_pinned(vma))
> +		xe_vma_mlock_free(vma, num_pages);
>  	return ret;
>  }
>  
> @@ -1004,6 +1042,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>  			unpin_user_pages_dirty_lock(vma->userptr.pinned_pages,
>  						    vma->userptr.num_pinned,
>  						    !read_only);
> +			xe_vma_mlock_free(vma, xe_vma_size(vma) >> PAGE_SHIFT);
>  			kvfree(vma->userptr.pinned_pages);
>  		}
>  
> -- 
> 2.41.0
> 
