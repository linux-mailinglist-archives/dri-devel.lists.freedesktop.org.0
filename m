Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B3AA616FE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 18:01:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209BD10E357;
	Fri, 14 Mar 2025 17:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WGPmRdDZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4306E10E357;
 Fri, 14 Mar 2025 17:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741971707; x=1773507707;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7WR3QLFRhyKTjKNl1cGDjhuRiJgihF7wTOqYv1oucAk=;
 b=WGPmRdDZcU/7SGv1d9G83vJ8g3zc6ewnzCJL7th8GY33qSpCqYfBhREd
 74q7o15kMMJNsdOrhLDvGxKcyYiHo1+ZBoXJkJ1zoKu4U5OHWh8ACHOKl
 W6WTIAXlg0M3rYY6hdsNJgjtu+B2y+7259PrcNEeOPAjEXhIN/xCebYOQ
 YEcJsvaCKbqJFQ4VYFkpWkm4/QDeCjzADjK6tWFriGCz0gX181y0FN7D+
 YMsD3ssf35rlfUtgBrtw0yYvOxFmlisnhq98LoiiV+IcU2Rs/mB8K/sPQ
 tAQzingqSs3TPUUX4y8uI/F2s/R8VldL5e/o6uWQaw+RFCnUXY7t2BORJ Q==;
X-CSE-ConnectionGUID: y80zgfm8RuSkZrQStRM7HA==
X-CSE-MsgGUID: UU/uZZK8Tl6NXdktwvFjUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="68496976"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68496976"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 10:01:46 -0700
X-CSE-ConnectionGUID: nWB9TUZxSdaG/4MkUef6Zg==
X-CSE-MsgGUID: O9hmMCosR/WK0UxeAMcoHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121826430"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 14 Mar 2025 10:01:44 -0700
Received: from [10.245.97.41] (unknown [10.245.97.41])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8C69233EA0;
 Fri, 14 Mar 2025 17:01:42 +0000 (GMT)
Message-ID: <9d85d2bb-1f64-4d6c-9982-a2d23cbbac32@intel.com>
Date: Fri, 14 Mar 2025 18:01:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/6] drm/xe/xe_gt_pagefault: Move pagefault struct to
 header
To: Jonathan Cavitt <jonathan.cavitt@intel.com>, intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, michal.mzorek@intel.com
References: <20250313183415.133863-1-jonathan.cavitt@intel.com>
 <20250313183415.133863-3-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250313183415.133863-3-jonathan.cavitt@intel.com>
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



On 13.03.2025 19:34, Jonathan Cavitt wrote:
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
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> ---

...

> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.h b/drivers/gpu/drm/xe/xe_gt_pagefault.h
> index 839c065a5e4c..69b700c4915a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.h
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.h
> @@ -8,6 +8,8 @@
>  
>  #include <linux/types.h>
>  
> +#include "xe_gt_pagefault_types.h"

it's not needed here, move it to .c

> +
>  struct xe_gt;
>  struct xe_guc;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault_types.h b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> new file mode 100644
> index 000000000000..90b7085d4b8e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022-2025 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_PAGEFAULT_TYPES_H_
> +#define _XE_GT_PAGEFAULT_TYPES_H_
> +

don't forget to

#include <linux/types.h>

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

btw, IIRC the VFID from the descriptor will be zero'ed
does it make sense to keep it here?

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
> +/**
> + * enum xe_gt_pagefault_access_type - Access type reported to the xe_gt_pagefault
> + * struct.  Saved to xe_gt_pagefault@access_type

this seems to be copied from G2H descriptor as-is.
so shouldn't this be part of the GuC ABI?
or based on HW ABI if GuC is just a proxy

> + */
> +enum xe_gt_pagefault_access_type {
> +	XE_GT_PAGEFAULT_ACCESS_TYPE_READ = 0,
> +	XE_GT_PAGEFAULT_ACCESS_TYPE_WRITE = 1,
> +	XE_GT_PAGEFAULT_ACCESS_TYPE_ATOMIC = 2,
> +	XE_GT_PAGEFAULT_ACCESS_TYPE_RESERVED = 3,
> +};
> +
> +/**
> + * enum xe_gt_pagefault_fault_type - Fault type reported to the xe_gt_pagefault
> + * struct.  Saved to xe_gt_pagefault@fault_type

ditto

> + */
> +enum xe_gt_pagefault_fault_type {
> +	XE_GT_PAGEFAULT_TYPE_NOT_PRESENT = 0,
> +	XE_GT_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION = 1,
> +	XE_GT_PAGEFAULT_TYPE_ATOMIC_ACCESS_VIOLATION = 2,
> +};
> +
> +#endif

