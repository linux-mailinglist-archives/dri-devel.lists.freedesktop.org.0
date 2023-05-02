Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B336F3ECE
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 10:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFC610E4B0;
	Tue,  2 May 2023 08:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C372210E4AF;
 Tue,  2 May 2023 08:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683014890; x=1714550890;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FFo04ejcEfBQsjRzv8phLLKVLyWLMKg+NrA5f184rqw=;
 b=nYENcmhLnaMLk5uUjUhldwirTkPTgX1b3u6AWteZo2sYNW2lFNAryHuf
 mS7rihY3vIiLlGq4tEgFICPhkhoe0knaXMMLnKgx5KDFeBnF4dG+NZ/xo
 bFWHIpMfjU3BWL0tUl2vazD9K6rhCHVJ+fmTL43uEvAiox0VRXKR1Kgic
 AqE7zgl24THz8v7hskU5UGI4HyioA9pAc3TveTMCJDgC03mZ+fgrS3vNB
 kyi7zrb8UxL5XjNcYwpoPKUFB+ZMO9Zk8WFsBRgLRuqtkMvkTx1fa7Wyu
 2tK7OPCLltagdJ+bAFIycZldCJYCi9coarpVlMSsryMV1Uhrw3g3aL/UL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="411471168"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; d="scan'208";a="411471168"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 01:07:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="942352112"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; d="scan'208";a="942352112"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 02 May 2023 01:07:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 01:07:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 01:07:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 2 May 2023 01:07:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 2 May 2023 01:07:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdGpyIayT2BNe9pPA7/U27pQme1tKHeWOwF9qUZ/xT3jP/LpymdyJqDT21G4ifw2gkdMwkMXcjDjAr9f7Cki7M6NoXK9axpsxXMV5T8SDdysEu/qNY4Z7iBI0sx6msgbnDi3fU4MRhuRN11axV+alZTsDXMa/iuGwMHDh63zD9uNVrKemlHstTZNCugg95UhGS+nA8KWh34DZmeyoX4BLL6K2rcP6sDYrzvyzxZvMMlH8TxQ8cLSt1zNFGhOm2SUrmQqNlwvYDXa9bRDTNJ+5xCIjyJGNmkwtNMPBQncvhTZVbiaJTCdilvH2a/lnAgn4Be7p422MFsMMZFLnhI6Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EwPsOcw09a1VqKivk0wO6W0+Eg1/8gtyaHd+JW4Zvs=;
 b=eTOb7U5Z32FpFdq5f0Kur6lOzqFWgy6UCkN21wP1nUipOcprqT4jcCWFvf1Ze1uKo4hwcu1KjEjwQcOXFSnIkMOJgUHb2zXPoJw0KKeehjV19ne9xnwzyCTTuMhgWiKfugBKCuXz7+jpQYmvmJ+LqDKBk+3LaRq8WUbAc/O4xZh2KYR2ShbGpz33tWzlIUZAWiQdmBpIrLzqtUU+WA/JVHg468M/4c3NYuOwj5ewC0psVC3UFFSwSOTPoEo6MDmd5yMbz/rtw0/Ilob3VmTzdpMkVA8rHeIshe7YE600szxEw1BRBoKJZTR8/Hdgbo84xk0+LSTpfrr6Y2HCw1px/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6752.namprd11.prod.outlook.com (2603:10b6:806:264::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 08:07:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 08:07:46 +0000
Date: Tue, 2 May 2023 08:07:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-xe] [PATCH 13/14] drm/xe: Convert VM print to snapshot
 capture and print.
Message-ID: <ZFDEw8CsavTGV/mi@DUT025-TGLU.fm.intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
 <20230426205713.512695-14-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230426205713.512695-14-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0074.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6752:EE_
X-MS-Office365-Filtering-Correlation-Id: f70e3082-56e8-45ea-c759-08db4ae45009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FRAq986m9vLsn63+7SihaPH5GCQxEM0yCuEtPyftNOYJNRjL78Vo3c0xGIwroi700ohpe/qAz8wR2gRwdn9fjRkpQbnWBVY5UWiCaEG6DklCUUXQ6gTrG0wGklotFCoMMPiyxVBemT/4ESfd0YL+Ld1fntX8+mGMdhXYjHVHL0LZBmLGT+6Zz2ASD2ieelwlZQU21TPvIi16Fisz6XK/0BAMV6TwBHj5Pd4Iw2TSvUPgbSB8fMLEEV3IzWifthn4zcMh4v7Kdf14xsLBVaYEJVx+54SwBv76kGNYlSJkC3q372aGearSjoyVMNx6taug66KpH5PfmL0Ir9XX+QaEMmfhvJVKu+gdq4UMmX0xk3oixUZZHKHjyyO/zwwTjYM8PrZc2bVDiLBG4ZcQnNQj+anDwA0i7CJkplHTvausatReN4pP27fMuL3lpqCFrBnuh4nNSRUfI58FseSHQouZnWa3TosV5gZ47rRjS4KVQKR6Ry+rUfNu1dcAr+X8NdWKqFT28a6wWYQPvYY0nymi18vlAmhsGx0REnNpztkhSMwvGkhVC7BEs/2H2bX6JV08
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199021)(5660300002)(44832011)(86362001)(26005)(186003)(83380400001)(6506007)(82960400001)(6512007)(38100700002)(478600001)(8936002)(6862004)(6666004)(6486002)(316002)(450100002)(41300700001)(4326008)(6636002)(8676002)(66556008)(66946007)(66476007)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X1iCAk2jspPIKJhL33Booa6JoKuy98iL2I++iX9t8fMW1XcfG04F0jftXwY0?=
 =?us-ascii?Q?FXWWOfnn2Gfj4DzM7ufcjDBFofHC3nh0LhPJZu64iNohbfjH0J3gmjaFCaBw?=
 =?us-ascii?Q?7ik7osfe7Ss2b1DeRjXdNE6ChPd3cEh63hc6jOh9oRILys4DSMl1Tu7NHKmI?=
 =?us-ascii?Q?BNUhVqZJNTKDsf4wev4MLZgE25OgNLKwBq49knaTVCsLb0Yi8kzld1ZtP2hT?=
 =?us-ascii?Q?rSEg8oOS5OB5p6LbPTNksJH2mUN7oMFeED7B0UC0/r5xClinpf0OXZ5YF7bt?=
 =?us-ascii?Q?qDmRIc6jHnM8nLpDURwX70PHaWgLIw96nQAepQoCO63xbtgxzeuJntWFV3Qg?=
 =?us-ascii?Q?f+/LiaSOHBVvec2kGaqDyW4ClTL43PxerTZ1Uv9poi9q3rKqpJXgaI1lYsjP?=
 =?us-ascii?Q?jFv8puB5gKfy1q31OYDewpWDUPsEjoZtx7kfPOEYcSo2B8y7K560GaVGUaHE?=
 =?us-ascii?Q?E1SoRrcapJzFLF+7vck7FaJxoyU00oEBmUmmt3LE8wkWCKKQ2mDT7mSUcRsh?=
 =?us-ascii?Q?aF/tKs+dzF0qZb+4zucwY+z1Uf/Cybj5ZNP25JvLmgebhVYS1RSn5akzfac7?=
 =?us-ascii?Q?exv6V7jrhwJhxAy71QZA33EwOagJ+qG1wyK4v7nbsuA9+rYw3UF839HMsMZo?=
 =?us-ascii?Q?1YVt9Pysn6VGW5K7o1mMpqryVdg0l2oF/mD0wNycONeBv5ooU/xOwQPxZV7f?=
 =?us-ascii?Q?3+lYDtl/iqMh3B8c/uv7XFR0Fx5fXcHUNMm6HxcAxWYdib4y8ns+vOXN237A?=
 =?us-ascii?Q?k1nLYQ0ySy2tJl6WZ77Hx8HC73YcLKPzjgQIKsCMedmuvFcuiphwnOKWhPCx?=
 =?us-ascii?Q?j4dYXlZKWtcvHcNRD2arrj6/tTqqKVBnRUneZdFeqjT77nKOlzGZs2cAv33i?=
 =?us-ascii?Q?8zIV0zTpgNeGetgnvoMVdFRMxRgUr3KGqdSw9Qp2o5GbktwcQxcymhcXXE+9?=
 =?us-ascii?Q?X9lnih8854Pk+hcemmkP4NdeXdrPyTjkZicHd9Oy7RIyxHqp6wE6v0mZZaOV?=
 =?us-ascii?Q?V8jWJxlm3dnSrY3W3ojgbIHMtNlAwIaDfwRjveArY5YD4sr00EbpFkD+9sBd?=
 =?us-ascii?Q?8m4n63xYMyJkfxa76F3lI6DhsxH9iblqpEmctL6xNk9h6jcRwtqqJLnSwaRj?=
 =?us-ascii?Q?FcNDlmC2Ot9eHJG+936UnlQZqwLcYKizBETdrVZ7Subv1Ukp1amG+YXLt8Sk?=
 =?us-ascii?Q?jT+vQpd4yZewNkIkWh4dMhcSUJHMpcy2SOEgz5Mt9h90W2ggfZ2OJ6Jef6zf?=
 =?us-ascii?Q?hvpBfcV5vIhPziUmPQPRHvhI0kcHUxHhIroK8ZjIvYlGIRz80GxxYtsEioDO?=
 =?us-ascii?Q?MlHbsyVgo0iilZxWKTzVXgzOkRYK/YGM45KPlFpSapXneFWC5I/w/Kk5fAzm?=
 =?us-ascii?Q?ZFOJq0+ZLIdu6bwxu8Hr959dJ7Gb42sPoGsHG8PVIoH/SmxixlZT8xSvvA7S?=
 =?us-ascii?Q?yWU94Wasgo5DP4vjvgJAOR6zQtIpP1xmUzufskeGEZkYGtkCvwqCcuo4ZYPn?=
 =?us-ascii?Q?1YEhs/gkSVY9nYyslU4+BnxS/hLStq9hCpAP4S02IJm7oqdGfJSfFhOhrlyc?=
 =?us-ascii?Q?zGL2kJKDzV6xHE37bFLl5mZCFrKVHQVecFczT7l1J0vMC2I0AscclOISFWnW?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f70e3082-56e8-45ea-c759-08db4ae45009
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 08:07:46.2059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AhoIRW9M5KpYuKbkfupoxUFe3+0Y1MvERZmoB+1Np/DhcW/8W5HlnibLl+Hyd0GwtLoCMV9DoucMPXRxs1jDdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6752
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 26, 2023 at 04:57:12PM -0400, Rodrigo Vivi wrote:
> The goal is to allow for a snapshot capture to be taken at the time
> of the crash, while the print out can happen at a later time through
> the exposed devcoredump virtual device.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Also thinking out loud here, at some point we are going to need a hook
to dump the entire contexts of the VMAs...

I can think of a few options.

1. Flag on the VM creation, dump the entire VM.
2. Flag on VM binds, dump VMAs with the flag set.
3. Have both options.

Thoughts?

Matt

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c |   2 +-
>  drivers/gpu/drm/xe/xe_vm.c         | 137 +++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_vm.h         |   6 +-
>  drivers/gpu/drm/xe/xe_vm_types.h   |  18 ++++
>  4 files changed, 143 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 74659d0a69b3..ac98bc1843e8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -753,7 +753,7 @@ static void simple_error_capture(struct xe_engine *e)
>  				continue;
>  			xe_hw_engine_print(hwe, &p);
>  		}
> -		xe_analyze_vm(&p, e->vm, e->gt->info.id);
> +		xe_vm_print(&p, e->vm, e->gt->info.id);
>  		xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
>  		dma_fence_end_signalling(cookie);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 4cffdb84680a..075640dbdff0 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3369,38 +3369,139 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  	return 0;
>  }
>  
> -int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
> +/**
> + * xe_vm_snapshot_capture - Take a quick snapshot of the HW Engine.
> + * @vm: Xe VM
> + * @gt_id: GT id number
> + *
> + * This can be printed out in a later stage like during dev_coredump
> + * analysis.
> + *
> + * Returns: a Xe VM snapshot object that must be freed by the
> + * 	    caller, using `xe_vm_snapshot_free`.
> + */
> +struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm, int gt_id)
>  {
> +	struct xe_vm_snapshot *snapshot;
>  	struct rb_node *node;
> -	bool is_vram;
> -	uint64_t addr;
> +	int i = 0;
> +
> +	snapshot = kzalloc(sizeof(struct xe_vm_snapshot), GFP_ATOMIC);
> +
> +	if (!down_read_trylock(&vm->lock))
> +		return snapshot;
> +
> +	snapshot->acquired = true;
> +
> +	for (node = rb_first(&vm->vmas); node; node = rb_next(node))
> +		snapshot->num_nodes++;
> +
> +	snapshot->vm_nodes = kmalloc_array(snapshot->num_nodes,
> +					   sizeof(struct vm_node_snapshot),
> +					   GFP_ATOMIC);
>  
> -	if (!down_read_trylock(&vm->lock)) {
> -		drm_printf(p, " Failed to acquire VM lock to dump capture");
> -		return 0;
> -	}
>  	if (vm->pt_root[gt_id]) {
> -		addr = xe_bo_addr(vm->pt_root[gt_id]->bo, 0, GEN8_PAGE_SIZE, &is_vram);
> -		drm_printf(p, " VM root: A:0x%llx %s\n", addr, is_vram ? "VRAM" : "SYS");
> +		snapshot->vm_root = kzalloc(sizeof(struct vm_node_snapshot),
> +				      GFP_ATOMIC);
> +		snapshot->vm_root->addr = xe_bo_addr(vm->pt_root[gt_id]->bo, 0,
> +					       GEN8_PAGE_SIZE,
> +					       &snapshot->vm_root->is_vram);
>  	}
>  
>  	for (node = rb_first(&vm->vmas); node; node = rb_next(node)) {
>  		struct xe_vma *vma = to_xe_vma(node);
> -		bool is_userptr = xe_vma_is_userptr(vma);
> +		snapshot->vm_nodes[i].is_userptr = xe_vma_is_userptr(vma);
>  
> -		if (is_userptr) {
> +		if (snapshot->vm_nodes[i].is_userptr) {
>  			struct xe_res_cursor cur;
>  
> -			xe_res_first_sg(vma->userptr.sg, 0, GEN8_PAGE_SIZE, &cur);
> -			addr = xe_res_dma(&cur);
> +			xe_res_first_sg(vma->userptr.sg, 0, GEN8_PAGE_SIZE,
> +					&cur);
> +			snapshot->vm_nodes[i].addr = xe_res_dma(&cur);
>  		} else {
> -			addr = xe_bo_addr(vma->bo, 0, GEN8_PAGE_SIZE, &is_vram);
> +			snapshot->vm_nodes[i].addr = xe_bo_addr(vma->bo, 0,
> +							  GEN8_PAGE_SIZE,
> +							  &snapshot->vm_nodes[i].is_vram);
>  		}
> -		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
> -			   vma->start, vma->end, vma->end - vma->start + 1ull,
> -			   addr, is_userptr ? "USR" : is_vram ? "VRAM" : "SYS");
> +		snapshot->vm_nodes[i].vma.start = vma->start;
> +		snapshot->vm_nodes[i].vma.end = vma->end;
> +		i++;
>  	}
>  	up_read(&vm->lock);
>  
> -	return 0;
> +	return snapshot;
> +}
> +
> +/**
> + * xe_vm_snapshot_print - Print out a given Xe HW Engine snapshot.
> + * @snapshot: Xe VM snapshot object.
> + * @p: drm_printer where it will be printed out.
> + *
> + * This function prints out a given Xe HW Engine snapshot object.
> + */
> +void xe_vm_snapshot_print(struct xe_vm_snapshot *snapshot,
> +			  struct drm_printer *p)
> +{
> +	int i;
> +
> +	if (!snapshot)
> +		return;
> +
> +	if (!snapshot->acquired) {
> +		drm_printf(p, " Failed to acquire VM lock to dump capture");
> +		return;
> +	}
> +
> +	if (snapshot->vm_root) {
> +		drm_printf(p, " VM root: A:0x%llx %s\n",
> +			   snapshot->vm_root->addr,
> +			   snapshot->vm_root->is_vram ? "VRAM" : "SYS");
> +	}
> +
> +	for (i = 0; snapshot->vm_nodes && i < snapshot->num_nodes; i++)
> +		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
> +			   snapshot->vm_nodes[i].vma.start,
> +			   snapshot->vm_nodes[i].vma.end,
> +			   snapshot->vm_nodes[i].vma.end -
> +			   snapshot->vm_nodes[i].vma.start + 1ull,
> +			   snapshot->vm_nodes[i].addr,
> +			   snapshot->vm_nodes[i].is_userptr ?
> +			   "USR" : snapshot->vm_nodes[i].is_vram ?
> +			   "VRAM" : "SYS");
> +}
> +
> +/**
> + * xe_vm_snapshot_free - Free all allocated objects for a given snapshot.
> + * @snapshot: Xe VM snapshot object.
> + *
> + * This function free all the memory that needed to be allocated at capture
> + * time.
> + */
> +void xe_vm_snapshot_free(struct xe_vm_snapshot *snapshot)
> +{
> +	if (!snapshot)
> +		return;
> +
> +	if (snapshot->vm_root)
> +		kfree(snapshot->vm_root);
> +	if (snapshot->vm_nodes)
> +		kfree(snapshot->vm_nodes);
> +	kfree(snapshot);
> +}
> +
> +/**
> + * xe_vm_print - Xe VM Print.
> + * @p: drm_printer
> + * @vm: Xe VM
> + * @gt_id: GT id number
> + *
> + * This function quickly capture a snapshot and immediately print it out.
> + */
> +void xe_vm_print(struct drm_printer *p, struct xe_vm *vm, int gt_id)
> +{
> +	struct xe_vm_snapshot *snapshot;
> +
> +	snapshot = xe_vm_snapshot_capture(vm, gt_id);
> +	xe_vm_snapshot_print(snapshot, p);
> +	xe_vm_snapshot_free(snapshot);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 748dc16ebed9..924884b36469 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -145,7 +145,11 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
>  void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
>  			     enum dma_resv_usage usage);
>  
> -int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id);
> +struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm, int gt_id);
> +void xe_vm_snapshot_print(struct xe_vm_snapshot *snapshot,
> +			  struct drm_printer *p);
> +void xe_vm_snapshot_free(struct xe_vm_snapshot *snapshot);
> +void xe_vm_print(struct drm_printer *p, struct xe_vm *vm, int gt_id);
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
>  #define vm_dbg drm_dbg
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index fada7896867f..18e79b6a2182 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -149,6 +149,24 @@ struct xe_vma {
>  	} extobj;
>  };
>  
> +
> +struct vm_node_snapshot {
> +	bool is_userptr;
> +	bool is_vram;
> +	struct {
> +		u64 start;
> +		u64 end;
> +	} vma;
> +	u64 addr;
> +};
> +
> +struct xe_vm_snapshot {
> +	bool acquired;
> +	struct vm_node_snapshot *vm_root;
> +	struct vm_node_snapshot *vm_nodes;
> +	int num_nodes;
> +};
> +
>  struct xe_device;
>  
>  #define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
> -- 
> 2.39.2
> 
