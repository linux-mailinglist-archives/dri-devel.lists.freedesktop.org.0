Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D70CA67C1E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 19:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9ED10E4B6;
	Tue, 18 Mar 2025 18:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DP2FB0wO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0819710E1A9;
 Tue, 18 Mar 2025 18:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742323061; x=1773859061;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rBOQmmT1ocC8B5FQwzDnjKCBl3hjZMUTL2p+XmTeuTA=;
 b=DP2FB0wOvYgDVz/JUwZBvCaqsGR71VkoSk1WZ2MHSp0Vki1boxT8eD0/
 Y/UEE5U6TztiFkAP9oaHUHgZXnta5mtEGitaYx8NGyb+gAkLesqnTDBtb
 CFSI+tm/7PvNUok6m/PvLgwsCHYg1QfpptbRd9jKn+uAo9smyl1mCzsS6
 X3uyYz2EghAx9xImZxiuC3wU6yji7gkaCDYiwhc33C0jOn9R2iANW4X4e
 xVcOLjHDrFKVWf14rGvYDjkQMcMi0tn+WQiKlxwjSIEILK61g9Lsrpf+0
 PaHW6IH2Z6C7p/57tA+NTwXEfvs/3SAxUkt114Is/CAmoIarPAYAH1KRn Q==;
X-CSE-ConnectionGUID: DSX2RszcQhernr9ynQWA8w==
X-CSE-MsgGUID: hsNJpMEQS0W4OQwHJtQ4JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43219681"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="43219681"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 11:37:38 -0700
X-CSE-ConnectionGUID: z3KL7bD7S6Kcr2mCZsd4+g==
X-CSE-MsgGUID: xMX3JIPPSBqvl1p9dpqptA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="145527233"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa002.fm.intel.com with ESMTP; 18 Mar 2025 11:37:36 -0700
Received: from [10.245.252.130] (unknown [10.245.252.130])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 2D86F34964;
 Tue, 18 Mar 2025 18:37:33 +0000 (GMT)
Message-ID: <2fde337b-3c41-413c-ba16-fe2e4879e980@intel.com>
Date: Tue, 18 Mar 2025 19:37:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/6] drm/xe/xe_gt_pagefault: Move pagefault struct to
 header
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 intel-xe@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, michal.mrozek@intel.com
References: <20250318171146.78571-1-jonathan.cavitt@intel.com>
 <20250318171146.78571-3-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250318171146.78571-3-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 18.03.2025 18:11, Jonathan Cavitt wrote:
> Move the pagefault struct from xe_gt_pagefault.c to the
> xe_gt_pagefault_types.h header file, along with the associated enum values.
> 
> v2:
> - Normalize names for common header (Matt Brost)
> 
> v3:
> - s/Migrate/Move (Michal W)
> - s/xe_pagefault/xe_gt_pagefault (Michal W)
> - Create new header file, xe_gt_pagefault_types.h (Michal W)
> - Add kernel docs (Michal W)
> 
> v4:
> - Fix includes usage (Michal W)
> - Reference Bspec (Michal W)
> 
> Bspec: 77412
> 

keep all tags together

> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c       | 42 +++------------
>  drivers/gpu/drm/xe/xe_gt_pagefault_types.h | 61 ++++++++++++++++++++++
>  2 files changed, 69 insertions(+), 34 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 3240890aac07..37b4ab5135a8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -14,6 +14,7 @@
>  #include "abi/guc_actions_abi.h"
>  #include "xe_bo.h"
>  #include "xe_gt.h"
> +#include "xe_gt_pagefault_types.h"
>  #include "xe_gt_stats.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_guc.h"
> @@ -23,33 +24,6 @@
>  #include "xe_trace_bo.h"
>  #include "xe_vm.h"
>  
> -struct pagefault {
> -	u64 page_addr;
> -	u32 asid;
> -	u16 pdata;
> -	u8 vfid;
> -	u8 access_type;
> -	u8 fault_type;
> -	u8 fault_level;
> -	u8 engine_class;
> -	u8 engine_instance;
> -	u8 fault_unsuccessful;
> -	bool trva_fault;
> -};
> -
> -enum access_type {
> -	ACCESS_TYPE_READ = 0,
> -	ACCESS_TYPE_WRITE = 1,
> -	ACCESS_TYPE_ATOMIC = 2,
> -	ACCESS_TYPE_RESERVED = 3,
> -};
> -
> -enum fault_type {
> -	NOT_PRESENT = 0,
> -	WRITE_ACCESS_VIOLATION = 1,
> -	ATOMIC_ACCESS_VIOLATION = 2,
> -};
> -
>  struct acc {
>  	u64 va_range_base;
>  	u32 asid;
> @@ -61,9 +35,9 @@ struct acc {
>  	u8 engine_instance;
>  };
>  
> -static bool access_is_atomic(enum access_type access_type)
> +static bool access_is_atomic(enum xe_gt_pagefault_access_type access_type)
>  {
> -	return access_type == ACCESS_TYPE_ATOMIC;
> +	return access_type == XE_GT_PAGEFAULT_ACCESS_TYPE_ATOMIC;
>  }
>  
>  static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
> @@ -205,7 +179,7 @@ static struct xe_vm *asid_to_vm(struct xe_device *xe, u32 asid)
>  	return vm;
>  }
>  
> -static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> +static int handle_pagefault(struct xe_gt *gt, struct xe_gt_pagefault *pf)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_vm *vm;
> @@ -237,7 +211,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  		goto unlock_vm;
>  	}
>  
> -	if (xe_vma_read_only(vma) && pf->access_type != ACCESS_TYPE_READ) {
> +	if (xe_vma_read_only(vma) && pf->access_type != XE_GT_PAGEFAULT_ACCESS_TYPE_READ) {
>  		err = -EPERM;
>  		goto unlock_vm;
>  	}
> @@ -271,7 +245,7 @@ static int send_pagefault_reply(struct xe_guc *guc,
>  	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>  }
>  
> -static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
> +static void print_pagefault(struct xe_device *xe, struct xe_gt_pagefault *pf)
>  {
>  	drm_dbg(&xe->drm, "\n\tASID: %d\n"
>  		 "\tVFID: %d\n"
> @@ -291,7 +265,7 @@ static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
>  
>  #define PF_MSG_LEN_DW	4
>  
> -static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
> +static bool get_pagefault(struct pf_queue *pf_queue, struct xe_gt_pagefault *pf)
>  {
>  	const struct xe_guc_pagefault_desc *desc;
>  	bool ret = false;
> @@ -378,7 +352,7 @@ static void pf_queue_work_func(struct work_struct *w)
>  	struct xe_gt *gt = pf_queue->gt;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_guc_pagefault_reply reply = {};
> -	struct pagefault pf = {};
> +	struct xe_gt_pagefault pf = {};
>  	unsigned long threshold;
>  	int ret;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault_types.h b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> new file mode 100644
> index 000000000000..55c598c4a1bc
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022-2025 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_PAGEFAULT_TYPES_H_
> +#define _XE_GT_PAGEFAULT_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +/**
> + * struct xe_gt_pagefault - Structure of pagefaults returned by the
> + * pagefault handler
> + */
> +struct xe_gt_pagefault {
> +	/** @page_addr: faulted address of this pagefault */
> +	u64 page_addr;
> +	/** @asid: ASID of this pagefault */
> +	u32 asid;
> +	/** @pdata: PDATA of this pagefault */
> +	u16 pdata;
> +	/** @vfid: VFID of this pagefault */
> +	u8 vfid;
> +	/**
> +	 * @access_type: access type of this pagefault, as a value
> +	 * from xe_gt_pagefault_access_type
> +	 */
> +	u8 access_type;
> +	/**
> +	 * @fault_type: fault type of this pagefault, as a value
> +	 * from xe_gt_pagefault_fault_type
> +	 */
> +	u8 fault_type;
> +	/** @fault_level: fault level of this pagefault */
> +	u8 fault_level;
> +	/** @engine_class: engine class this pagefault was reported on */
> +	u8 engine_class;
> +	/** @engine_instance: engine instance this pagefault was reported on */
> +	u8 engine_instance;
> +	/** @fault_unsuccessful: flag for if the pagefault recovered or not */
> +	u8 fault_unsuccessful;
> +	/** @prefetch: unused */
> +	bool prefetch;
> +	/** @trva_fault: is set if this is a TRTT fault */
> +	bool trva_fault;
> +};
> +
> +enum xe_gt_pagefault_access_type {
> +	XE_GT_PAGEFAULT_ACCESS_TYPE_READ = 0,
> +	XE_GT_PAGEFAULT_ACCESS_TYPE_WRITE = 1,
> +	XE_GT_PAGEFAULT_ACCESS_TYPE_ATOMIC = 2,
> +	XE_GT_PAGEFAULT_ACCESS_TYPE_RESERVED = 3,
> +};
> +
> +enum xe_gt_pagefault_fault_type {
> +	XE_GT_PAGEFAULT_TYPE_NOT_PRESENT = 0,
> +	XE_GT_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION = 1,
> +	XE_GT_PAGEFAULT_TYPE_ATOMIC_ACCESS_VIOLATION = 2,
> +};

as those two enums seems to be reflecting HW definitions, IMO they
should be defined separately from the SW definitions

most of the HW definitions we keep in the regs/ folder, even if not
being pure register definitions, see:
 - xe_bars.h
 - xe_lrc_layout.h
 - xe_gtt_defs.h

we can add page faults defs to new regs/xe_pagefault_desc.h *) file,
additionally we can define there format of the page fault descriptor,
and remove it from the xe_guc_fwif.h, as GuC seems to pass data in HW
format anyway

or maybe @MattR has a better idea where these defs should go


*) please don't be tempted to use regs/xe_pf_desc.h since we want to use
"PF" term only to mean "Physical Function", not "page fault" ;)

> +
> +#endif

