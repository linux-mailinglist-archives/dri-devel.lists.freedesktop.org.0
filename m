Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E06476F3E94
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 09:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F4310E4A9;
	Tue,  2 May 2023 07:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85BF10E37D;
 Tue,  2 May 2023 07:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683013843; x=1714549843;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xFLqdncz7sDzQ6S+NbLOM8lbvn38PAunma4Zv9bxDIs=;
 b=NcR4FuN2og5C99yjcMRX4Mu1ztfIJCdr1L2v6B5NvgHOJidSYI2Ezoab
 eAurSDZwfqgT9BjexDJzbz5t3xKpwkOR0KyQyNPk8HuDnlSBn3V13hHEk
 WGaw+HhQpDTaRJ7HbpjnAgRICDKlHt3gFwVsamHK0dQfFmqdX87+MxtM0
 b8MkzjWFE0rMFVfanwrGbbiOoPtIA5CbyxZ2Ie4NgJiedVOACDw9YHWnG
 hoRXFu6KjGxlFUXPJCVAadzxTIb+WmzelauWvu9GfN6kHibTaE1bZ4GWo
 sOqehnnqqEpOAJWYH8s9WPtRc6mcw6I8nZyud/EZAuxugm8uaH25cTaa6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="434651736"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; d="scan'208";a="434651736"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 00:50:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="673544917"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; d="scan'208";a="673544917"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 02 May 2023 00:50:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 00:50:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 2 May 2023 00:50:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 2 May 2023 00:50:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IR1yRllQEgThWjv7pD0X4Ix8k7bnzwAMocMYeLz+ki1XuOkAlU2O8BcteE5P7+4RBrNhnjJ9h8kxL6+iJNP82QGln0CAWXt3t4BcyKvHYsfNckMsPmIxhjvKEW1ILcfU+C6J0NKW04wx+eM38c7CV/DjmjCX/O3p2/jX5qb5kOv6Tmgkn0lWM5vXo3l0Kf0hplGNRU9plydOPL/NiMVGtxgp7EqJO3YOIM/syUQWE8brx0oTgxv5rMENQi4vMJMZIg+uSyM9Z/8uNlUzQcg8rgleKTDaSg/PJZObI98Cj2HECdQY7wQGQIGpFn1k8mtn/sxDCn6hEsD8RwJIP5TADw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7af6MvFszEOc6+onMLEYwlIAnFiACK8SmuVSEoLFJQ=;
 b=Lyr0TYu3DPHykp6IIwiJOpI1SK49nDY6qKHVSIHqiVoOqMMpBzRWyGlssHrFd9kRxHI9Utx1SzLLd4bpC1RIkX4J36DmFSmZOtp/9HNT7ABN7LMImoixpBJrHUYEH/A/7u7ZUVGGJLyz3PHyK6uk+8+Akor9V4kiSxZqByEH3WK4zmOk7Oi3jPQdhCXXhY+/eb9YENQX7V7orjOMk/QH77D7VPsFVX5j+auu5oZKOg2IexoclSqqormoAMMLMYxFl/HU+CMMSQT3KXBbrU+xu7DSAYZEany900eoWnoO5hi4LLH7GUps4A7SFESvg/+VhU0JA8iDtfXqkPR1mpucRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7503.namprd11.prod.outlook.com (2603:10b6:a03:4c8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 07:50:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 07:50:38 +0000
Date: Tue, 2 May 2023 07:50:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-xe] [PATCH 13/14] drm/xe: Convert VM print to snapshot
 capture and print.
Message-ID: <ZFDAvjkDSirLwzvJ@DUT025-TGLU.fm.intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
 <20230426205713.512695-14-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230426205713.512695-14-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:74::37) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7503:EE_
X-MS-Office365-Filtering-Correlation-Id: 14759320-c55a-4ade-2d08-08db4ae1eb21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iNJVgmoQNzw1jH7odHVcnmvydOGOVrS2nMbWJDM1MXzs1iIUkqiJXzSaSHQDhDzVfot/pUt47HOxTPT3YsM8buCqBwMXWUOhRnPt2L2c1fombbFESChlIqCLDFLZgwUmOScRqjh2ZFmdZP2b67VzdVIVZKlHfnt6ItMxUiDwRkWgFmO1P24ZhN2FPFOA5gkpKnxLZsHCxp7DV5z0LqzJR2W4P5uvjckg7I+rJoVuLEoww8S4oDCMhIzXvx902Y1Fn0Skb7VCMBPncExnJLSJJvoTpkMwwzRUVzZImQaUBvhHNE3+xNbpgDAeFAdksE6LRHOvl2RKkmZBeNJoxOIx3WHtlepEttBVnNUeodbbJ/G0Zy+6MmhWmrIP736lnHoHqqqzEMoENIXTiWxosLOf+AcKXyLzZPVGQZdaXVHRcFFq8lv5j96Ay0M47+gSnKLN/w8JQxFUNHHxwa2btbc/qXwUnyIvoPnJkRxMS6soLKo7dN6hH3al7VCI4txJSdYvvvND16f3zEDuGgFZmK4mFs9ZXoxtYpRc9SZQacs73lRTq9tMac79WAxlCmd2hJDJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199021)(6666004)(26005)(6512007)(6506007)(6486002)(316002)(2906002)(66476007)(66556008)(66946007)(450100002)(4326008)(6636002)(5660300002)(86362001)(6862004)(8676002)(8936002)(44832011)(82960400001)(41300700001)(38100700002)(186003)(478600001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xdlXaJK4oyByfBz7oLyBXY8N1Z5l/n8xWxSgbDiYOYmqcDHr7GCMgDbAyrov?=
 =?us-ascii?Q?fxmY3Fs3pkMD/lUuzOT00THssIR5/z4TEYA9vsI2ulKbJaiLYJcT9QlyIEh5?=
 =?us-ascii?Q?w5kn/Vg3EHEFJqOOHqXyovnGRhzzOL1nnSKHtPXQnVsbrkEhwNSAhLmwtzxl?=
 =?us-ascii?Q?Rd5sLoJFmih3SZH171mwP95EvZOaeMe63zINB6xdRT0nDF5rJhH3UV5/Irov?=
 =?us-ascii?Q?UswsPa1z9F7VmgNaPwVNG8C8P2suJwq+lV8jV8aHC0/s+pmCyhuoEmZ8Bf+u?=
 =?us-ascii?Q?m3EPZAlUFDWTBjQ2/4QqKWbpPIrcXc0S1XBGPvQL2SDsOdqLuNjntQ/SHC9g?=
 =?us-ascii?Q?lJyN8Q92C4UJOqTbcKU8vLWrcILwPc2hlZLhRuE23a2hv2FS+xMsyQW0ViCA?=
 =?us-ascii?Q?gxj7RmYldyrsFq60kxjurQZwlBed+CV6Bbid5gMho1MItzY7Cq4iyAAl0pT1?=
 =?us-ascii?Q?UvhPFpHSTCDc/7UGAhs/bnBvwmMjtOHMtGNM55ae2xeFugI4ooLQIj86JJAJ?=
 =?us-ascii?Q?o89+NF2IgbGCbwljmK1yJ7StQjz8Zwc9yEZqhYwZSfoRzRHXLaFHwSSQ1lCq?=
 =?us-ascii?Q?3QsAU5qWJzqXxl02AC+3JxgiizhNH/6/h4PpU6jpBQ+A8yskLnd5vQW31eCe?=
 =?us-ascii?Q?FOWbLPvhJpiIv9P9burHvZ3bFB1gyj1ndYwSqRCWMEmH/nuZHcYIBWRA10E/?=
 =?us-ascii?Q?nVt0mdyKnpCuMfe5CHTs6dTp2QVIWX3GAq2j6IuzPh5rd1ElVx5z7do3s30v?=
 =?us-ascii?Q?+IgwX2dnz7QdXOeIwJM8pVziYzdy+oRXFx7NtogiUNdKSZGXg3TRUIAmVTk4?=
 =?us-ascii?Q?XlRfEI92DfqjYbejlct0+Gjo/EBeBOzPAVDS8cxjL3nYmu+PfnkbAoNbKr5F?=
 =?us-ascii?Q?CaBZTE0daTfBTGJbVQAeEL4Sus/8XUKgdU816HcaQNjbgdFKdzjSzEbJ9Pbq?=
 =?us-ascii?Q?k28/bo+d+vPzfY0pccUMaC/1FNQkPS46+NC/oA6mMghTOj4+0Jt43Ps90hPx?=
 =?us-ascii?Q?ePANsqtYTonuXgcHvVLXN3cf2+XdmugqMv95kYDyJ3GqWNZwnstIaf/bPCnE?=
 =?us-ascii?Q?EAVHeNmvuCatkh8ye1dUTGvW+24oSu0PZA9Pooo+SOQzYKwFqHF3AGx6ZuQB?=
 =?us-ascii?Q?f88SmgBuQ9q9yrEOxAYu7PwWyXA3RxCnKhyUQ8jy8XO7p2fY/frIaHYxHYzm?=
 =?us-ascii?Q?pgNSNgmKQ1XStMF6v8iDhq/z+c3N9vuXxPl1De8V3uRNZOURk+XIHNczcE0B?=
 =?us-ascii?Q?xmcaXNQ8o6yQXICjA5R0Z5RdmkpSCaXP5+IeI+o9kMEGrRe0gesyRSqEe6CS?=
 =?us-ascii?Q?S+3EuhalfHAKd61Ii3s+TWCFclhx4eIZYBnB3FGTrK25bz/tm0rOyzhQmvot?=
 =?us-ascii?Q?ELfjqy0QqMeAPO4U+h0wushNHr0cv1EX3BSHRauuXwb0ADQuEZx/XAn7R7p3?=
 =?us-ascii?Q?nlmqZy5V3AsZu1c9OCMrNditV8ugIJbH13BNiylRkzy56Qxy8sHGVsrr7cJD?=
 =?us-ascii?Q?J+b22WO/4j4LPXKJXnNCs9gD/GRqn5Dqau0Zk2tIrv+XGgPRpiqifRq4R3O/?=
 =?us-ascii?Q?qJV+/IOM14DFim6X8U2AArfxYNomgiAtS8Xa5BRq9ny5J26uFu14xHMDNxhD?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14759320-c55a-4ade-2d08-08db4ae1eb21
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 07:50:37.9263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMziQ3kI1KQECgUhPv8EO6gFJMXCsT4JUjTT2uSTj954Pl5G0APMD0NRtyAB64FtbTWU444NB9OkxtsKyPtL9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7503
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

This is an example of a patch I'd like staged behind the GPUVA changes
as GPUVA will change all of this...

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
