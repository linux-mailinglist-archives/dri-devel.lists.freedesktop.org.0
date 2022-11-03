Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF29C61853F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 17:50:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF5510E73B;
	Thu,  3 Nov 2022 16:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162B310E713;
 Thu,  3 Nov 2022 16:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667494190; x=1699030190;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Qv32NgkVAiNePnQefXtUxaoQmzpE0UFDRFggTaUovWM=;
 b=fIXFkb9/v0GXYgVkz0ib31pdfXEIWAGX2DNGmYDNWe/Cl/3bNw3SIGMz
 28DRbaP6X0f1LpVhS2CZIx1hfhthGyQc5BNO7pRagEdySbMmjRxYR0aaw
 hUbMZ15wMbrh7k8AiiNTkdVchvR15mhEJnAkNQDmvBC09k66LxIa6wnc7
 4yr3k6Yvhyr6CbjbLPgflOEKVR01DbVeqmP0gatgos3Z22NR9hliOzbQM
 EiWUcqvLjjgFvgcprcTzUtfHc26ceKegJfb799BM+Pwh+jbadse9lpHeI
 si/DrvIRL0PhMKg66aZvyk2WQNP9i/GTjrLmxPqkieYhXNcZg81yeBXr1 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="311473412"
X-IronPort-AV: E=Sophos;i="5.96,134,1665471600"; d="scan'208";a="311473412"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 09:49:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="703743470"
X-IronPort-AV: E=Sophos;i="5.96,134,1665471600"; d="scan'208";a="703743470"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 03 Nov 2022 09:49:47 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 3 Nov 2022 09:49:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 3 Nov 2022 09:49:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 3 Nov 2022 09:49:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFGLYYJVmuu8yzMvqwdVr7a3aZEpauqWT8K2tyqSGLmRSb6gVtipFakvJh2/+aGvGiZDgcDUtoWaxkxZOk/y0gjIDKigiJjr9RLGbdSJWKcXOqAMzPwA8CdrQWuM+e7elYb4CxsoNUe1K4zZxwhR/cKdMA4sUhkUkEK9R1LUWYMzYiMvg1YwaEE/GKWgkVdLctLzLVL0DkA0ouGzISe89KSobFFCAkwEB/ehzeUdTgabG6hCFqE3sLWzIYw+WriZDYZOIfEG4VY4s6o9sMRDF5rq10KaMmfcH21c09QDdBcR0v70mctvsNjRoXp2VE7X6nPNkwpO1TMZIg+3eVgtkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gKbxe5xTNJxRMOFNks2zT1naw3XAjsOYriC38GZCk0=;
 b=Ik1SyN6MoXAjdvlwskYNS7lxBEhsejA3oGMOgba+UVoTAyzSD+93IIDWyVZnrosQQljFxIEpQ7AOsEhL8ohyU4y7AH31i9EAtso0HYx08mFo4Sv15vqEZ1c8VY0jEu6k3+GTFuAt6x4SW8i+dQX3Qcmpab+Q0s3eb1HaeLWOsbaYMgwE9np4r4q3wDgO7F+IbxSUkXz3w+8qrfkL0hagZ0zqjsuGSgmxPstd20E1mpCVCR7e/Sfy5y/GhB/VszhKFh0blV41zaDKLflgdUeIkHqlQxFhSu/ro8BXA2JoOTWC8KY7eQ6ZCUhCy0tYJV3LLTCskILjfVYC6rxajtghvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by MW4PR11MB7150.namprd11.prod.outlook.com (2603:10b6:303:213::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Thu, 3 Nov
 2022 16:49:44 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::5236:c530:cc10:68f]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::5236:c530:cc10:68f%4]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 16:49:44 +0000
Date: Thu, 3 Nov 2022 09:49:38 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>
Subject: Re: [PATCH 3/9] drm/i915: Use kmap_local_page() in
 gem/i915_gem_shmem.c
Message-ID: <Y2PxImhTMtLijeab@iweiny-desk3>
References: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
 <20221017093726.2070674-4-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221017093726.2070674-4-zhao1.liu@linux.intel.com>
X-ClientProxiedBy: BYAPR02CA0049.namprd02.prod.outlook.com
 (2603:10b6:a03:54::26) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|MW4PR11MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e30eb40-7fe3-4c8e-72dc-08dabdbb68a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B67s2AcNTRpSYcR03mwRu9IDkTi265S/N7rOPNP4BTtqDenYeERd3PrWBGDumJ8gwfLOGSTi/gVr8WYXrXAJPIUMp99UaR+AfpD5zFnWPujXCYDkbaB5SedeY6VlnxfNhXdaDpqzi0NXir+DbmJH8aAPxJLx4MJnkYM/5Is94pUIBoBCGmeiXcoXZThMxURfW+uGb3MHca4ueAKZf+1drlJ0OFTKb0iHkcVDuEetdeLhSXmPuOoByobAV1qBHxFKfHb5Yzx+Q6ncqhxydz0tADu7ywrlGS165mZ+s8ANLCzKbeKyOJH5KmO6vXdVBMf+Um5KWyeqkvKb0ej3HdSUYjaQcGIzZ7TCPwtWi5Q2YtVffyU9KC08yrbr7BuyVOtopeVunjuBnyaDOEVhWCz//GkoWfkpz7XuKzBwxBppKn3ixjAqEDYNyamDfCSZt4Wt8+QrufjNf5GyrM+msLXdjwLNougMKj2eMbNmNr39tVE1EYqPlLyvDhOIZbacI0wnKaElhdSVcpCTAyiXIaUBQuDNZy1o64eYcJx4ym+6Hm3VirJIMFSxOknNavv/1eegty86s6VM5pUuqnmygFvYQ9XTs1xNMf9FtMGbKPc2Bnz8bApd7ii73tBrwXM4NmzZP3BybUVLTAgJ//yjEtcbxBYcMPWjwAcaUy/Q0pcyRGZIk/gk3P0U92W4EVJMweDJphNE1S86VK+EYw4Byp9OvvATBhRANcX9nPvmBr+8ypQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(346002)(366004)(136003)(376002)(396003)(39860400002)(451199015)(82960400001)(966005)(54906003)(66946007)(38100700002)(66556008)(8676002)(6916009)(4326008)(66476007)(33716001)(186003)(316002)(7416002)(5660300002)(83380400001)(2906002)(41300700001)(26005)(6486002)(478600001)(9686003)(8936002)(86362001)(44832011)(6666004)(6506007)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V8BPV7LFzscsihnWiQnA2YfRDqcKya2rtbpwxyb0ltfuzVFZHI+yC/ewyQHG?=
 =?us-ascii?Q?j00pV7hI6PjuXGabHuLKUNfeYHJbTJ4tXxkyVMdVDbvtCg+u30/TYvDbhEM7?=
 =?us-ascii?Q?Ci9FifgH06j0IIwifKbul8BP8RrMhbtM3Uq9+U+tseh3ahHQpxb3web1Yu71?=
 =?us-ascii?Q?ajvqzqo0QsafIAinhW/sN6/OYwLnYBE5VTz/AhBWA8q7U/cAHeqG8m5ZFG6z?=
 =?us-ascii?Q?xur1xzn39pUMw+LVbfyvcLdvbR2orsNLeGjl5mSxlX6aANT0Rx8jYz/tNsoJ?=
 =?us-ascii?Q?qc22e2gK3cnhI4tuAFXgHfTkd0Yd/eGxWBdgkvSB5vmujSScqNU0HWpMrpl+?=
 =?us-ascii?Q?l2+CcY3Si0jk1clNoRb6mDi7WojAqAjxGWlBRrNLBAoId/RLTD1iDuR/hOui?=
 =?us-ascii?Q?aVE5CvY0QA8MhBoBc9kCSqOwxRGLE87ZxABjp3wOZ5Pn7poA+8fhNDI6WIcp?=
 =?us-ascii?Q?14nGISEgW2sR7ZSrhu3h1rHCPXgfKdsgs+IWQLrCppub3UvHCYaSjgXbZv2F?=
 =?us-ascii?Q?ZN1W3K86Wnobyo0Qlk5NINFqAWZHr3d1P2HH+S10VYgZjWIsztt1qZLZk1nc?=
 =?us-ascii?Q?xe7wZlMMxGLzJgVH2wq7sz6nPKHTLIYPFF76yeErNk3+1GsAYvv0vqhDiLEk?=
 =?us-ascii?Q?ubYpr0uFpnG9xSyOyfxZ8iTyFAQ6DXKMyCkBeqJCsDRatMrFVbDdlBfg1f6J?=
 =?us-ascii?Q?/7zgvORo14mhMkW1eIfezfSyhc5HxhOD9BjDki1cHy26zH8Er1lYg/tWREDF?=
 =?us-ascii?Q?1RMiMbvPLtUsrYt4R2hStsXnLcjY+zPpWNHtt1VjpYFIK6cE5Y4O5xdhcVan?=
 =?us-ascii?Q?hJyNXOwinUtyS+5633iJsyxWJcmPrXTbUIqZWxZ3In+QFevyrRh4j2rIs93J?=
 =?us-ascii?Q?9l4q7FIm9l/jvU7luwtj7OZ1kwixQGKX6nCu8jkZCTo5XSO9B7B5GKKWUeVQ?=
 =?us-ascii?Q?VMlnXa8udr+b1a584FQFfLElv0X6yriQ8eYvEVDiOK5UMmJXjTd/vf8CZyLC?=
 =?us-ascii?Q?g0UDQPKcr8fS0H8GVNzq6N9v2byiMFyyZ137VU7sJ5N1nYnATr6lHPR8ahiR?=
 =?us-ascii?Q?SSU2M7QAZjdoTOZB643Q/tz9nIBGUCu7eOALPDrRuMrciSV3izEVbUVORCF4?=
 =?us-ascii?Q?UmkVR15woOGI7IWc3A3bnvsc9XYoScWdHZxZA9QVZaET5yOq6SXXujY0Z+Xa?=
 =?us-ascii?Q?B8egsGCmOlAa0l2yGp7vX2Zf4ov061On9TCapz6FxrTpOJiS8HvMMyv1jr/o?=
 =?us-ascii?Q?fylqSXRaBkxd7SXPs0xr6LHzazcC0wMKuE7olH5qJPRFb/gWOo/skiFSP9WP?=
 =?us-ascii?Q?/0xlwDU6IyYbzDoQjHih60aLvjIw6+Wtmo5VXHuatN1wJqXUtdG0D/wjLQ2A?=
 =?us-ascii?Q?8Qb3nPvzUyf+vh8sWDuRAGzuWp0FcP5nxd8ZUJla5AQzehs3i4+gqOz9zsoJ?=
 =?us-ascii?Q?DFEhHKNq0VbnkqeDgMd4FXEmzMk1GULpGdI0tMJtcsmbLfSWycXCoq8mPF7d?=
 =?us-ascii?Q?vVMr01EOh0xF8XrmwAGFso+NoTPxAAr/VUOmKZRrcMVe4jfs1ODudgLHvXgi?=
 =?us-ascii?Q?W1zEiPIb38e8OdPKaIT0jqWeawWtTv+z15ssufBi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e30eb40-7fe3-4c8e-72dc-08dabdbb68a8
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 16:49:44.0625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Az6nSjTcst9otVl99n0BOnqeMMw3zMSjV7sWzS/ygNfbWez1PIlDjg1faJtKhA9Tzplz2CTXevez/I4yid/PfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7150
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "Fabio M .
 De Francesco" <fmdefrancesco@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Zhao Liu <zhao1.liu@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 17, 2022 at 05:37:19PM +0800, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> The use of kmap_atomic() is being deprecated in favor of
> kmap_local_page()[1].
> 
> The main difference between atomic and local mappings is that local
> mappings doesn't disable page faults or preemption.
> 
> In drm/i915/gem/i915_gem_shmem.c, the function shmem_pwrite() need to
> disable pagefault to eliminate the potential recursion fault[2]. But
> here __copy_from_user_inatomic() doesn't need to disable preemption and
> local mapping is valid for sched in/out.
> 
> So it can use kmap_local_page() / kunmap_local() with
> pagefault_disable() / pagefault_enable() to replace atomic mapping.
> 
> [1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com
> [2]: https://patchwork.freedesktop.org/patch/295840/
> 
> Suggested-by: Ira Weiny <ira.weiny@intel.com>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
> Suggested by credits:
>   Ira: Referred to his suggestions about keeping pagefault_disable().
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index f42ca1179f37..e279a3e30c02 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -472,11 +472,13 @@ shmem_pwrite(struct drm_i915_gem_object *obj,
>  		if (err < 0)
>  			return err;
>  
> -		vaddr = kmap_atomic(page);
> +		vaddr = kmap_local_page(page);
> +		pagefault_disable();
>  		unwritten = __copy_from_user_inatomic(vaddr + pg,
>  						      user_data,
>  						      len);
> -		kunmap_atomic(vaddr);
> +		pagefault_enable();
> +		kunmap_local(vaddr);
>  
>  		err = aops->write_end(obj->base.filp, mapping, offset, len,
>  				      len - unwritten, page, data);
> -- 
> 2.34.1
> 
