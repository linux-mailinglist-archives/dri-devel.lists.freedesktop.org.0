Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4179A67F2E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 23:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800DE10E1E3;
	Tue, 18 Mar 2025 22:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D9iZLW8r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3515810E1E3;
 Tue, 18 Mar 2025 22:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742335313; x=1773871313;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PVlR4YsiXkqBpggpJCLu+fcs1ZZe2FCTZztnsANQ7KU=;
 b=D9iZLW8r6dy1AsQLI/VgrUFmDCvzC1Zs/9/xh3mDIkULcVG0Wu1Bqzsw
 RMmzLnXSqOOxGPO80OC1cvBXMeom3uD7YERHFH6cgh3klxVBanjz3Svt+
 /uLY4zFM3eJxGBh0/4qPK94UQ7clEU+CTnQBQOkrhmuczGtZAj7YWIPeK
 UMH9hQqtdnv1MMkk6Kzs6s9mdCH9eXyR6BrDV/opauUAxgSxym/zQKFsS
 4xuBaf4GmJl0KMg356Piy5Ofr2qo/wPrmeB+NTJPtCKSV2k8cfy9nBo0n
 +nTUC/BfwpWF5+KA1Z3N/cVsmT/pCtUvgNO58XAKvD6sE6mfk19O48/mS Q==;
X-CSE-ConnectionGUID: ZUyfen85QxuvKClxW06alg==
X-CSE-MsgGUID: bacYTaQhTeCPwAipEeIrfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="54880493"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; d="scan'208";a="54880493"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 15:01:52 -0700
X-CSE-ConnectionGUID: U/9q/N6wQ5W21JEpBK1siw==
X-CSE-MsgGUID: 9gB95h9AQ4eZX8XLRDLHlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; d="scan'208";a="122863438"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 18 Mar 2025 15:01:50 -0700
Received: from [10.245.252.130] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.252.130])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 9791634F10;
 Tue, 18 Mar 2025 22:01:47 +0000 (GMT)
Message-ID: <4ac8d993-ecc2-4283-9e4b-1da29e0e56ac@intel.com>
Date: Tue, 18 Mar 2025 23:01:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/6] drm/xe/xe_gt_pagefault: Move pagefault struct to
 header
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Gupta, saurabhg" <saurabhg.gupta@intel.com>,
 "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Zhang, Jianxun" <jianxun.zhang@intel.com>,
 "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>
References: <20250318171146.78571-1-jonathan.cavitt@intel.com>
 <20250318171146.78571-3-jonathan.cavitt@intel.com>
 <2fde337b-3c41-413c-ba16-fe2e4879e980@intel.com>
 <CH0PR11MB5444C42CD2CE0F56FA1CE680E5DE2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB5444C42CD2CE0F56FA1CE680E5DE2@CH0PR11MB5444.namprd11.prod.outlook.com>
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



On 18.03.2025 21:12, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com> 
> Sent: Tuesday, March 18, 2025 11:38 AM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedesktop.org; Roper, Matthew D <matthew.d.roper@intel.com>
> Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Brost, Matthew <matthew.brost@intel.com>; Zhang, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedesktop.org; Mrozek, Michal <michal.mrozek@intel.com>
> Subject: Re: [PATCH v9 2/6] drm/xe/xe_gt_pagefault: Move pagefault struct to header
>>
>> On 18.03.2025 18:11, Jonathan Cavitt wrote:
>>> Move the pagefault struct from xe_gt_pagefault.c to the
>>> xe_gt_pagefault_types.h header file, along with the associated enum values.
>>>
>>> v2:
>>> - Normalize names for common header (Matt Brost)
>>>
>>> v3:
>>> - s/Migrate/Move (Michal W)
>>> - s/xe_pagefault/xe_gt_pagefault (Michal W)
>>> - Create new header file, xe_gt_pagefault_types.h (Michal W)
>>> - Add kernel docs (Michal W)
>>>
>>> v4:
>>> - Fix includes usage (Michal W)
>>> - Reference Bspec (Michal W)
>>>
>>> Bspec: 77412
>>>
>>
>> keep all tags together
>>
>>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_gt_pagefault.c       | 42 +++------------
>>>  drivers/gpu/drm/xe/xe_gt_pagefault_types.h | 61 ++++++++++++++++++++++
>>>  2 files changed, 69 insertions(+), 34 deletions(-)
>>>  create mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault_types.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>> index 3240890aac07..37b4ab5135a8 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>> @@ -14,6 +14,7 @@
>>>  #include "abi/guc_actions_abi.h"
>>>  #include "xe_bo.h"
>>>  #include "xe_gt.h"
>>> +#include "xe_gt_pagefault_types.h"
>>>  #include "xe_gt_stats.h"
>>>  #include "xe_gt_tlb_invalidation.h"
>>>  #include "xe_guc.h"
>>> @@ -23,33 +24,6 @@
>>>  #include "xe_trace_bo.h"
>>>  #include "xe_vm.h"
>>>  
>>> -struct pagefault {
>>> -	u64 page_addr;
>>> -	u32 asid;
>>> -	u16 pdata;
>>> -	u8 vfid;
>>> -	u8 access_type;
>>> -	u8 fault_type;
>>> -	u8 fault_level;
>>> -	u8 engine_class;
>>> -	u8 engine_instance;
>>> -	u8 fault_unsuccessful;
>>> -	bool trva_fault;
>>> -};
>>> -
>>> -enum access_type {
>>> -	ACCESS_TYPE_READ = 0,
>>> -	ACCESS_TYPE_WRITE = 1,
>>> -	ACCESS_TYPE_ATOMIC = 2,
>>> -	ACCESS_TYPE_RESERVED = 3,
>>> -};
>>> -
>>> -enum fault_type {
>>> -	NOT_PRESENT = 0,
>>> -	WRITE_ACCESS_VIOLATION = 1,
>>> -	ATOMIC_ACCESS_VIOLATION = 2,
>>> -};
>>> -
>>>  struct acc {
>>>  	u64 va_range_base;
>>>  	u32 asid;
>>> @@ -61,9 +35,9 @@ struct acc {
>>>  	u8 engine_instance;
>>>  };
>>>  
>>> -static bool access_is_atomic(enum access_type access_type)
>>> +static bool access_is_atomic(enum xe_gt_pagefault_access_type access_type)
>>>  {
>>> -	return access_type == ACCESS_TYPE_ATOMIC;
>>> +	return access_type == XE_GT_PAGEFAULT_ACCESS_TYPE_ATOMIC;
>>>  }
>>>  
>>>  static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
>>> @@ -205,7 +179,7 @@ static struct xe_vm *asid_to_vm(struct xe_device *xe, u32 asid)
>>>  	return vm;
>>>  }
>>>  
>>> -static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>>> +static int handle_pagefault(struct xe_gt *gt, struct xe_gt_pagefault *pf)
>>>  {
>>>  	struct xe_device *xe = gt_to_xe(gt);
>>>  	struct xe_vm *vm;
>>> @@ -237,7 +211,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>>>  		goto unlock_vm;
>>>  	}
>>>  
>>> -	if (xe_vma_read_only(vma) && pf->access_type != ACCESS_TYPE_READ) {
>>> +	if (xe_vma_read_only(vma) && pf->access_type != XE_GT_PAGEFAULT_ACCESS_TYPE_READ) {
>>>  		err = -EPERM;
>>>  		goto unlock_vm;
>>>  	}
>>> @@ -271,7 +245,7 @@ static int send_pagefault_reply(struct xe_guc *guc,
>>>  	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>>>  }
>>>  
>>> -static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
>>> +static void print_pagefault(struct xe_device *xe, struct xe_gt_pagefault *pf)
>>>  {
>>>  	drm_dbg(&xe->drm, "\n\tASID: %d\n"
>>>  		 "\tVFID: %d\n"
>>> @@ -291,7 +265,7 @@ static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
>>>  
>>>  #define PF_MSG_LEN_DW	4
>>>  
>>> -static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
>>> +static bool get_pagefault(struct pf_queue *pf_queue, struct xe_gt_pagefault *pf)
>>>  {
>>>  	const struct xe_guc_pagefault_desc *desc;
>>>  	bool ret = false;
>>> @@ -378,7 +352,7 @@ static void pf_queue_work_func(struct work_struct *w)
>>>  	struct xe_gt *gt = pf_queue->gt;
>>>  	struct xe_device *xe = gt_to_xe(gt);
>>>  	struct xe_guc_pagefault_reply reply = {};
>>> -	struct pagefault pf = {};
>>> +	struct xe_gt_pagefault pf = {};
>>>  	unsigned long threshold;
>>>  	int ret;
>>>  
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault_types.h b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
>>> new file mode 100644
>>> index 000000000000..55c598c4a1bc
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
>>> @@ -0,0 +1,61 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2022-2025 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_GT_PAGEFAULT_TYPES_H_
>>> +#define _XE_GT_PAGEFAULT_TYPES_H_
>>> +
>>> +#include <linux/types.h>
>>> +
>>> +/**
>>> + * struct xe_gt_pagefault - Structure of pagefaults returned by the
>>> + * pagefault handler
>>> + */
>>> +struct xe_gt_pagefault {
>>> +	/** @page_addr: faulted address of this pagefault */
>>> +	u64 page_addr;
>>> +	/** @asid: ASID of this pagefault */
>>> +	u32 asid;
>>> +	/** @pdata: PDATA of this pagefault */
>>> +	u16 pdata;
>>> +	/** @vfid: VFID of this pagefault */
>>> +	u8 vfid;
>>> +	/**
>>> +	 * @access_type: access type of this pagefault, as a value
>>> +	 * from xe_gt_pagefault_access_type
>>> +	 */
>>> +	u8 access_type;
>>> +	/**
>>> +	 * @fault_type: fault type of this pagefault, as a value
>>> +	 * from xe_gt_pagefault_fault_type
>>> +	 */
>>> +	u8 fault_type;
>>> +	/** @fault_level: fault level of this pagefault */
>>> +	u8 fault_level;
>>> +	/** @engine_class: engine class this pagefault was reported on */
>>> +	u8 engine_class;
>>> +	/** @engine_instance: engine instance this pagefault was reported on */
>>> +	u8 engine_instance;
>>> +	/** @fault_unsuccessful: flag for if the pagefault recovered or not */
>>> +	u8 fault_unsuccessful;
>>> +	/** @prefetch: unused */
>>> +	bool prefetch;
>>> +	/** @trva_fault: is set if this is a TRTT fault */
>>> +	bool trva_fault;
>>> +};
>>> +
>>> +enum xe_gt_pagefault_access_type {
>>> +	XE_GT_PAGEFAULT_ACCESS_TYPE_READ = 0,
>>> +	XE_GT_PAGEFAULT_ACCESS_TYPE_WRITE = 1,
>>> +	XE_GT_PAGEFAULT_ACCESS_TYPE_ATOMIC = 2,
>>> +	XE_GT_PAGEFAULT_ACCESS_TYPE_RESERVED = 3,
>>> +};
>>> +
>>> +enum xe_gt_pagefault_fault_type {
>>> +	XE_GT_PAGEFAULT_TYPE_NOT_PRESENT = 0,
>>> +	XE_GT_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION = 1,
>>> +	XE_GT_PAGEFAULT_TYPE_ATOMIC_ACCESS_VIOLATION = 2,
>>> +};
>>
>> as those two enums seems to be reflecting HW definitions, IMO they
>> should be defined separately from the SW definitions
>>
>> most of the HW definitions we keep in the regs/ folder, even if not
>> being pure register definitions, see:
>>  - xe_bars.h
>>  - xe_lrc_layout.h
>>  - xe_gtt_defs.h
>>
>> we can add page faults defs to new regs/xe_pagefault_desc.h *) file,
>> additionally we can define there format of the page fault descriptor,
>> and remove it from the xe_guc_fwif.h, as GuC seems to pass data in HW
>> format anyway
> 
> For clarification, when I move these enum definitions to the regs folder,

I'm not sure that "move as-is" would be ok

right now most (all?) hardware definitions are using #define not the
non-anonymous enums, also I would try to follow names used in the Bspec:

#define FLT_TYPE_NOT_PRESENT_FAULT		0u
#define FLT_TYPE_WRITE_ACCESS_VIOLATION		1u
#define FLT_TYPE_ATOMIC_ACCESS_VIOLATION	2u

#define ACC_TYPE_READ_ACCESS			0u
...

so the "Normalize names for common header" request does not apply for
them, only name of struct xe_gt_pagefault must be aligned

> I'm going to assume you want me to include the created header file as
> an includes in the relevant .c files, 

you likely need only few of these HW defs in xe_gt_pagefault.c

in other places only struct definition is needed (which does not have
any of these "enums" on board)

> and not just staple it into
> xe_gt_pagefault.h or xe_gt_pagefault_types.h.  Is this correct?

the rule is:
if you don't need any of these defs in .h, don't include them there

> 
> -Jonathan Cavitt
> 
>>
>> or maybe @MattR has a better idea where these defs should go
>>
>>
>> *) please don't be tempted to use regs/xe_pf_desc.h since we want to use
>> "PF" term only to mean "Physical Function", not "page fault" ;)
>>
>>> +
>>> +#endif
>>
>>

