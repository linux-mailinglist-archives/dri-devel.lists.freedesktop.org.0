Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 148856E149E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 20:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2465B10EBD8;
	Thu, 13 Apr 2023 18:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E2010EBD6;
 Thu, 13 Apr 2023 18:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681411892; x=1712947892;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=57ZnAIaJORGRbUOvcBjur76X38O25/A1LZl6Ot3sCxI=;
 b=XANtrekuzI0NT53E0XhCV0jSYUUF9EX2jSxXSb9rtFeytsbLCPZX5eTo
 5FqjBP54S8bDAvJoUVAqEe9m2Cdt6xa0zQJXaFA8DGeluAoongFfqeioi
 PnjnyDfsF2yaQn5oXZVAxQ3xduiTBYXmlJPKMKuMBvQHOnz1HTz73RCTx
 txrqCx4N72GxkpS1MVRdgOeSWC8jNSQyx5FG7ljjafpi367UfJMMsxMWJ
 ttltdun43PxzWOtdw8Yf41WEYR4m1RQvsJnCsYo9n3mk6ZKRS4lpzsfBA
 MRbG9bipdvLDxb1gMJtsZ/a13IHhWxbi8Aci3R07XukevWlRM+6oP9vz2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="341772194"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="341772194"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 11:51:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="758803884"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="758803884"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 13 Apr 2023 11:51:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 11:51:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 13 Apr 2023 11:51:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 13 Apr 2023 11:51:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+T6gohmJsfuHM89Dp+I0BZZF0wEtYyleY0cKAME/UEnE59wBFSPk4lbuPYAP+YjMLd9wPe3y4mNsTS3x1e/RcHgwVxETeqeLxRrhm5MX+0ggv41x778pmLT8Cd3lM02HofbckOLmG9CY9jjgV6R+HOkTKX6ndwmWEDWGxY8lLNu5ZyX/kAskKWn9sId8xAoJu5eIr9HA0I0iC/7g2hvY/kYj26u3Kg55oATNBjZ1l4MR3MAFBefS16W1d4EzWDB/NB0yD/CwjWmOIWRwMdMKLBBFC4iZBZY3sU4N8PEOBSKQVaUnzFT0FH+5BXWiU3TukHj6Jqp5EwAdn7+SqIOnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hrqRLRHaSgzqKqlaFC/VUjvnPPW92IwhWGMTo4n7t48=;
 b=E9DPY2UaSnBV72GBaWbGg77m4uqIKkoEe5LJNMd343891evslmuMtLl8hFgqt/AR6hI3Sh4NBaBiHzaFysHX7NiHJf5KX9LwE61Zn5sXZC7cIkVCtGhbpVPSs4wzB6LLkDAPbgF9O4ONTlQ1OnDpXBR9pS747UpzsRRk3FIdeExhqxE5NImEQV+D1ApzdJXZY0fTBsISKyAGgxu2bP+oOWl9k0uTORU1fauCZPxJpTB0wVkQgD6y7O2e4/EX54M6EZhKi8HqfJRscChrlhJDWUwA5/ztkrMpJDLf0P6S+QbZmY7hEju/ims1bLp0+OLBWIty3gb3VV3/6ez+8cflpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by MW4PR11MB7005.namprd11.prod.outlook.com (2603:10b6:303:22e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 18:51:28 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d%6]) with mapi id 15.20.6277.031; Thu, 13 Apr 2023
 18:51:28 +0000
Date: Thu, 13 Apr 2023 11:51:20 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v10 00/23] drm/i915/vm_bind: Add VM_BIND functionality
Message-ID: <ZDhPKLpis6XRj2hC@nvishwa1-DESK>
References: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BYAPR06CA0012.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::25) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|MW4PR11MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: daf04076-3f31-47e3-0277-08db3c50166a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o1Bt+i01g5WU4MvylDp5hEMqvm6JpAp/geljX6OSZ+98qtKZ57NqSFYUgruUy/z5dz3S2c1C9hc0ktw71x6yhCkzj5HvQVeyrbyCpnD3WJnrd+hEnbQZ7frNy5B0rHr+u9FzHTFJqOHl/AUzYuMk/gIn1jyWN9VG8ZE8zEM/+cIO7D+5xRibKQfysAkjOZ9Q/kVaFNQjb4sVpVpauOzBOaZfbj66Z/zGnnrlnx6bSd8tLOcGewQ7P+T9s+BA3MtdwOLV6PP6JdtB96EebZolMoKN5QZIqeYF6oQt+jp3SBsBwGoWl5UslknOa0R6d1+r6x4X0l6KE4FCENzMKXvrRpGD7F1/7XiObkaZmBSSLoCPgxgaHNVVRXBCZGJSs6I+j6v/VpWzsobQnhukir38pUj864dVBaYL9v8IpjWrfjUJ2glvAqd3R0bvcVwNVE0kUHagkQRSveePkMWxTEymVMLpWbG9URRazJAFMvqspqc0yw2yqlV8zHxrPTxq31pOKHEa4T1HzxFY7vKziBaf/3X2w6NXBOMdhz9eobpzOiLYh3licBalB+EF9GQXV+0TsBtO5RosFvxUIl7yfufETw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(366004)(396003)(39860400002)(376002)(346002)(451199021)(8676002)(38100700002)(5660300002)(44832011)(2906002)(86362001)(8936002)(4326008)(316002)(66946007)(82960400001)(41300700001)(66556008)(66476007)(966005)(83380400001)(6506007)(26005)(9686003)(33716001)(186003)(6512007)(6486002)(478600001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tFock/vl7wMNBrJNb9AzHHEfTc5wnTq6mKEMV4xyrYAzdrGL/ljNWoBXXUnX?=
 =?us-ascii?Q?m1hYLcpnGt/9r9cDfB9L2c7Tnj9l+a90OfII717Fa6e0/l9CBu7MaLjZgHe5?=
 =?us-ascii?Q?HIpEXtPPcDgzzYM9+0xob6ROFsxQKqHPPb93OnhYJMFkyPfkJtZNnuHmgPWJ?=
 =?us-ascii?Q?pbmaroll41aCXV30IVXtE+hfDOkVbMIzUUpjJc3oGoH8fhwAWGXdlhGV2wTu?=
 =?us-ascii?Q?eHCQ4l8MuIdylWHxaZednlmXJfnjRWH/fDbh+2XPtkRx58B3n80KQNgASMjk?=
 =?us-ascii?Q?veuNqc3F67ymIwcQvFDtVUZ7paokLNK06xmGcUcckU9o8vBwnrMaUasxavFJ?=
 =?us-ascii?Q?nhHxgXGWnx5xJoCrIDealurvQBjGVgBYnZskR/USYLaQsxqTd3GHSAEBxvN/?=
 =?us-ascii?Q?WzQmAzA8mGdtnZAHng6XjVrg2d4Y33j84cDldHKrj080XILlG/2Hx8LloFmn?=
 =?us-ascii?Q?YNRc1TcFnd7r/Dm8j61knXpFRMDGPbN29RScgs/8wJg7D3TUjD1gXWcnGiG9?=
 =?us-ascii?Q?7pflmPuaEZNhcsLpReXDJM4maPVWCF0zuu6UZYPQy0VvjrRTjH8QL7zz7Ftt?=
 =?us-ascii?Q?saG3DNHea0nfRAaH2aHYCHCr2rrKA9USdoAFXLIO0tkdbChaQnbNiFr2ABKi?=
 =?us-ascii?Q?QO6uRW6iFAeGdBY4etkhoOv6NnhYpPENj0VSuZL5X19k2IUwNoetkoEEPYGA?=
 =?us-ascii?Q?qP0fkKcv3jopBqu+R6rRtRHcj3I12MYPrjqHjlSeQy+qYo2qbVQDShd5lA5f?=
 =?us-ascii?Q?u6Y+gFIGDnvbM+YD/3hbdhjD0StOQgeHA1g5XgTMokBfGZG30dxfqSKef/Rt?=
 =?us-ascii?Q?r/WFz9E/cFD6bkiq8j1h6EdffzQwXi4/3taDhkbAXaG38eZ/K7zBvDp51S3A?=
 =?us-ascii?Q?6rjwW3se9b8+wxfJ4h5fDcdVPzvyAs3VgvP474SsHoEcve0fD6ST+fh2TVIn?=
 =?us-ascii?Q?p2rewWj81pMBwDYRIJHUQViwPf2+Jo6imVUnmonlAYjDmUEsSgARL0twj6q6?=
 =?us-ascii?Q?GN22F3XDo89l1tieJdoZn+yxFuQD09lYkgiNbiRIi84V+bnVaEZFn7s1sviG?=
 =?us-ascii?Q?DwxJO8KI516ba8BZsqK+m9a4h2Iuyb0YfZbXzt/r5+50UbZmXMR/P790c5aM?=
 =?us-ascii?Q?5yITyvNcF7kXvjSS6FyqoQxIb2UjXN1R7S6hWb0Mdk5wvOkGeBRQbEndOxJs?=
 =?us-ascii?Q?wN04Rx/hBzy/BpWcKV16IY6kT/cJrpIHbg8NtSl/SKjJcdC5/tyjqtOWaQw7?=
 =?us-ascii?Q?rLpWhtska0dEH/BuvA/Hcx2Y13V94AhmRYELkb2qa2LCwORB4miDKM1d1OGX?=
 =?us-ascii?Q?uKyOKf/EiPr+Tla0d9FFgmuPcd8qafHG0gP+4FCzJKZ2CysiE3dJu43tH6ex?=
 =?us-ascii?Q?40M3X/h8NnBCJkuf/HHkJacI71E7VlOFio4eAnJ1DRv2Ls60RO2zDg6FYOw/?=
 =?us-ascii?Q?mOWwvRCoJ+3enCgMQ6405ekanYJCy1SNEV48mucg/wmKb+wh+K3DaZUx6hXG?=
 =?us-ascii?Q?RRVb4Q6J7yZn51hAAAgBR1CEf7EyHVVfGjIL+QpSHw4ExisgJLBwGefBVCCb?=
 =?us-ascii?Q?ahTCzECArsz/PVevePqgXsA+BkycJPtvtCSf7arpXcBqppvxRwGPfymb/nxU?=
 =?us-ascii?Q?gcDisTV+1Z7sw9ewrt3HZJ0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: daf04076-3f31-47e3-0277-08db3c50166a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 18:51:27.9961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hlzkjGaeqPHpUfdQfdeElZ8/b9fF2uhGF54zhEkNto9BQd0mi2NUqIYk2rwQ8BoBCzlRo2VyFCfOsoFYY3sRVj/8BaxVac4FOWAICoEFQPpdDqjisWQuLJg93oRVpCAL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7005
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, airlied@redhat.com, michal.mrozek@intel.com,
 lionel.g.landwerlin@intel.com, carl.zhang@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com,
 kenneth.w.graunke@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 17, 2023 at 11:15:46PM -0800, Niranjana Vishwanathapura wrote:
>DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind GEM
>buffer objects (BOs) or sections of a BOs at specified GPU virtual
>addresses on a specified address space (VM). Multiple mappings can map
>to the same physical pages of an object (aliasing). These mappings (also
>referred to as persistent mappings) will be persistent across multiple
>GPU submissions (execbuf calls) issued by the UMD, without user having
>to provide a list of all required mappings during each submission (as
>required by older execbuf mode).
>
>This patch series support VM_BIND version 1, as described by the param
>I915_PARAM_VM_BIND_VERSION.
>
>Add new execbuf3 ioctl (I915_GEM_EXECBUFFER3) which only works in
>vm_bind mode. The vm_bind mode only works with this new execbuf3 ioctl.
>The new execbuf3 ioctl will not have any execlist support and all the
>legacy support like relocations etc., are removed.
>
>NOTEs:
>* It is based on below VM_BIND design+uapi rfc.
>  Documentation/gpu/rfc/i915_vm_bind.rst
>
>* The IGT RFC series is posted as,
>  [PATCH i-g-t v10 0/19] vm_bind: Add VM_BIND validation support
>
>v2: Address various review comments
>v3: Address review comments and other fixes
>v4: Remove vm_unbind out fence uapi which is not supported yet,
>    replace vm->vm_bind_mode check with i915_gem_vm_is_vm_bind_mode()
>v5: Render kernel-doc, use PIN_NOEVICT, limit vm_bind support to
>    non-recoverable faults
>v6: Rebased, minor fixes, add reserved fields to drm_i915_gem_vm_bind,
>    add new patch for async vm_unbind support
>v7: Rebased, minor cleanups as per review feedback
>v8: Rebased, add capture support
>v9: Address capture support feedback from v8
>v10: Properly handle vma->resource for mappings with capture request
>
>Test-with: 20230118071350.17498-1-niranjana.vishwanathapura@intel.com
>
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>

Hi,

It has become clear that we have a long way towards fully featured implementation of VM_BIND in i915.
Examples of the many challenges include integration with display, integration with userspace drivers,
a rewrite of all the i915 IGTs to support execbuf3, alignment with DRM GPU VA manager[1] etc.

We are stopping further VM_BIND upstreaming efforts in i915 so we can accelerate the merge plan
for the new drm/xe driver[2] which has been designed for VM_BIND from the beginning.

Since we are not proceeding further with this i915 VM_BIND patch series, the MTL support needed for
setting the MOCS and PAT settings in an immutable way at buffer creation time has been posted in a
separate series[3] under review.

Thanks for all your feedback on this series which is much appreciated.

Regards,
Niranjana

[1] https://www.spinics.net/lists/nouveau/msg11069.html  
[2] https://www.spinics.net/lists/dri-devel/msg390882.html 
[3] https://patchwork.freedesktop.org/series/115980/

>Niranjana Vishwanathapura (23):
>  drm/i915/vm_bind: Expose vm lookup function
>  drm/i915/vm_bind: Add __i915_sw_fence_await_reservation()
>  drm/i915/vm_bind: Expose i915_gem_object_max_page_size()
>  drm/i915/vm_bind: Support partially mapped vma resource
>  drm/i915/vm_bind: Add support to create persistent vma
>  drm/i915/vm_bind: Implement bind and unbind of object
>  drm/i915/vm_bind: Support for VM private BOs
>  drm/i915/vm_bind: Add support to handle object evictions
>  drm/i915/vm_bind: Support persistent vma activeness tracking
>  drm/i915/vm_bind: Add out fence support
>  drm/i915/vm_bind: Abstract out common execbuf functions
>  drm/i915/vm_bind: Use common execbuf functions in execbuf path
>  drm/i915/vm_bind: Implement I915_GEM_EXECBUFFER3 ioctl
>  drm/i915/vm_bind: Update i915_vma_verify_bind_complete()
>  drm/i915/vm_bind: Expose i915_request_await_bind()
>  drm/i915/vm_bind: Handle persistent vmas in execbuf3
>  drm/i915/vm_bind: userptr dma-resv changes
>  drm/i915/vm_bind: Limit vm_bind mode to non-recoverable contexts
>  drm/i915/vm_bind: Add uapi for user to enable vm_bind_mode
>  drm/i915/vm_bind: Render VM_BIND documentation
>  drm/i915/vm_bind: Async vm_unbind support
>  drm/i915/vm_bind: Properly build persistent map sg table
>  drm/i915/vm_bind: Support capture of persistent mappings
>
> Documentation/gpu/i915.rst                    |  78 +-
> drivers/gpu/drm/i915/Makefile                 |   3 +
> drivers/gpu/drm/i915/gem/i915_gem_context.c   |  43 +-
> drivers/gpu/drm/i915/gem/i915_gem_context.h   |  17 +
> drivers/gpu/drm/i915/gem/i915_gem_create.c    |  72 +-
> drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   6 +
> .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 522 +----------
> .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 872 ++++++++++++++++++
> .../drm/i915/gem/i915_gem_execbuffer_common.c | 671 ++++++++++++++
> .../drm/i915/gem/i915_gem_execbuffer_common.h |  76 ++
> drivers/gpu/drm/i915/gem/i915_gem_ioctls.h    |   2 +
> drivers/gpu/drm/i915/gem/i915_gem_object.c    |   3 +
> drivers/gpu/drm/i915/gem/i915_gem_object.h    |   2 +
> .../gpu/drm/i915/gem/i915_gem_object_types.h  |   6 +
> drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |  19 +
> drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  30 +
> .../drm/i915/gem/i915_gem_vm_bind_object.c    | 463 ++++++++++
> drivers/gpu/drm/i915/gt/intel_gtt.c           |  22 +
> drivers/gpu/drm/i915/gt/intel_gtt.h           |  28 +
> drivers/gpu/drm/i915/i915_driver.c            |   4 +
> drivers/gpu/drm/i915/i915_drv.h               |   2 +
> drivers/gpu/drm/i915/i915_gem.c               |  14 +-
> drivers/gpu/drm/i915/i915_gem_gtt.c           |  39 +
> drivers/gpu/drm/i915/i915_gem_gtt.h           |   3 +
> drivers/gpu/drm/i915/i915_getparam.c          |   3 +
> drivers/gpu/drm/i915/i915_gpu_error.c         |  52 +-
> drivers/gpu/drm/i915/i915_sw_fence.c          |  28 +-
> drivers/gpu/drm/i915/i915_sw_fence.h          |  23 +-
> drivers/gpu/drm/i915/i915_vma.c               | 301 +++++-
> drivers/gpu/drm/i915/i915_vma.h               |  70 +-
> drivers/gpu/drm/i915/i915_vma_types.h         |  43 +
> include/uapi/drm/i915_drm.h                   | 281 +++++-
> 32 files changed, 3245 insertions(+), 553 deletions(-)
> create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
> create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.c
> create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.h
> create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
> create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>
>-- 
>2.21.0.rc0.32.g243a4c7e27
>
