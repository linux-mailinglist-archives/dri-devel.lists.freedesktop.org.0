Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3EAA44EE7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 22:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021D510E7F9;
	Tue, 25 Feb 2025 21:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XWAHsd8y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD0F10E7F7;
 Tue, 25 Feb 2025 21:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740519058; x=1772055058;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bOSLvedESgIzVyUpvm/nsweK9hTA0rUOpfK2Y6FsnFk=;
 b=XWAHsd8yB7ZobfjRFX9jeNqwkZg1F6ldLppiJBB4OFfRqVWP/aamgjM/
 9IgPUcL60R4VEjVPjJ8PCoGeoe/NI8Ysa89x80IeLWFcOwTg1TT6VXA3r
 A0vPqd8qDcie8dTvXZwse017thb83w1FuLdDKLyc+m9N2l6DushwjPO/H
 AweBqCrXRPkkv0WnK7gfEa9Dr6dJOJFVTNmvLp8HOZHZTz+zvunLDiQ9m
 NQNBo2XqC1uZm9Ph7r7jsoYTZP3gNXHiG2ocHDcyAjPFQYTzEh96jMB6r
 NQ5hc+NoHIAxvhryRBmf1Pw5fS1rM/bqsmbLhrqjcLDbSW2/aHMSuKcY/ g==;
X-CSE-ConnectionGUID: 0U6HCE/wTeKY/J3mZzy3vA==
X-CSE-MsgGUID: A0ESHgZhQ/6GLbLkJbpKYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="51561942"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="51561942"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 13:30:55 -0800
X-CSE-ConnectionGUID: P5mUz+3jTVeJGiXZh6o0tQ==
X-CSE-MsgGUID: kPdA+XPHSp2sRwvyEpNxmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117003842"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2025 13:30:56 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Feb 2025 13:30:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 13:30:54 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 13:30:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1oMElFITqoZnQT2dpWDUcWa3IQc536I/l9kZkvnQuNTgxfaocdMFrg71x//cNEi7z0HcLL7NsPETo/DFcrhCyGAUWNJYXiHOeInouC4QicPQjTuILMfUqDNpd23j1Rx471Z3Cu9QPz9ASuu4Umz6L6GsOym/SJuHiOobajYqlShcY6rs6w06MgX40vEqy21iMz4eAKr+HWAv5MyONlR9zt7XIKfdfmLHaeeFPwDga5Y8Xz9yqoFRjdXQygas4/xukJsXvYXUBGb9G57TZF9o+US2Mmkm/BXiu5MOkcls0ivFNK1xZdLxbcObccgxzafk9luGgA0+vYYw4SeV32znA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEcWyx0IhCrZ/zZf00vSpA8jneRCh/YOdZ8be2NgHjM=;
 b=PrlGQh0SoTD5k7uUCj6bqebln684AFUWSr1NYpuHVqAxjmzscfFJOyO81g49zjjJb843d+Muj/TDEp1GiGIkxMmvM0v86C6Ud5/XbAnTpjS5BxMFddrvuZVSZjkzGeEUqO4wNbhj/v4Cv9qLfGRWRO9YmsolzQjQB2jwrHZmrddeoJ5HRQYJl4fJ7e/Ht1nv0e2lItmjOOxxPx2+es3l67677QK7BoyTYO9G1cy4nwSyT4zMVOhhxod2kQdT77zf660ETw/6Z6kWuudyOqoZfa5UWiWLqIvkQb5pieu9yIgQz/BpKNGyLWombv1eT0Hdr2zVWpKIQtgJ93lSV9pmlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4635.namprd11.prod.outlook.com (2603:10b6:303:2c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Tue, 25 Feb
 2025 21:30:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 21:30:51 +0000
Date: Tue, 25 Feb 2025 13:31:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tvrtko.ursulin@igalia.com>, <lucas.demarchi@intel.com>,
 <dri-devel@lists.freedesktop.org>, <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 6/6] drm/xe/xe_query: Add support for per-drm-client
 reset stat querying
Message-ID: <Z742y/VNDcnUoyb0@lstrano-desk.jf.intel.com>
References: <20250220203832.130430-1-jonathan.cavitt@intel.com>
 <20250220203832.130430-7-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250220203832.130430-7-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR04CA0245.namprd04.prod.outlook.com
 (2603:10b6:303:88::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4635:EE_
X-MS-Office365-Filtering-Correlation-Id: f42876ca-560f-4c4b-b1fc-08dd55e3ad83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tnyz4mkU/OkNYYyjGL7Qy4MdXQQL2Ab7Q+gGywql5Szkqvi6EnxkdLZD6ImM?=
 =?us-ascii?Q?uADzOu59zkKGo2iEDn8/Gr3UuUdWMutSRfEQIAyEEbqRHcDYqlpR3OKWizLR?=
 =?us-ascii?Q?7cfZIwFGAZdartb7XpAXeUB0TLrEKkNm/pzFqFj9d6lGLeCb60m4zyNW1xon?=
 =?us-ascii?Q?LErl3S2iibwvyBzCj7zAd1iERnYgsqLwYkgIfqsQMpna1z71sRGRFxNHCleJ?=
 =?us-ascii?Q?uPXzS2B8FwBbEWnBS6k94Q31fIYSqu/zXi4ruKyy0hkUzdP09IlbixFSLJqp?=
 =?us-ascii?Q?RhOVv2+CMUYkk8zoPi8BjodOZD4Fbn/s+13CTA19tuv2sPIOia1EIIvcWeO9?=
 =?us-ascii?Q?9r+jjxroCWeVEB7xn1x/g3yuXWqUPEInA52KXkRis8JW4B+jp8QoH68bEhze?=
 =?us-ascii?Q?X+ilwlBUH1/0KBmhHQQU7dO/s1T4FOzf0B6/RKKakN2mpFEw+1A1bAPkkLOe?=
 =?us-ascii?Q?KeQf0dMnsItCHE+WofVoqfB1/kVczixcUOKC32pzRBcI8dGTf7y51K6nYs7d?=
 =?us-ascii?Q?jH5LrGJZzKWx7PY5uPlzz5vuIgytdw37D3XE91v7f0Wx/7gyRX68sPmHs8vD?=
 =?us-ascii?Q?X555zu/nr7OIIVhY2zphbqnVeSKL1WGDEsg6VWr4BrsBIy1QKSY5iNZKFsQ+?=
 =?us-ascii?Q?7rrJrSQJkqiAcdA3Fx7GfTCgTkJAKVkxu82t/gFgo6GCsxDSj+aDCLV+iMGf?=
 =?us-ascii?Q?jHzP+l0ncOMye5dO4RhxW+HYLLvBsSqT3qLIkKQOmlo5xF9fwfZE0WrKpvzy?=
 =?us-ascii?Q?ReGN6HmCjiMshsdXHzYUC4Hsg8KjBL6P+qpnPK0K6nZfXOzspxqDjqveRTVt?=
 =?us-ascii?Q?m8bu+K7Ej6BUyTsM+zZx6wSEye0IMIpCoq8bHc+V3PeJ2Vlci/7OjJX4MDq4?=
 =?us-ascii?Q?fP5n10oo7Gz8fy4veR5zB+eJUfY0X1NpKYcqckb+lHNTmkQngl01wKCxiNOY?=
 =?us-ascii?Q?LpYtJICKhjzYVpmV6VogQVA8pjSHEIvdJjisTqLisojOZ7WNuJzcJ0MIhZB+?=
 =?us-ascii?Q?DINBnvGtML9sgV7/z4Cz+fRDseZwclRU/cr1P4h9NzNhbzxfM+0X1XxVK5Iu?=
 =?us-ascii?Q?R/UzDcZCng62hNuruFqVcd3V2hO5X4JRNBveaJPYjeYcBmtf+byHn8eElwV+?=
 =?us-ascii?Q?j0R75LvPEvKy/ERZo94qTwAbGipO0JG+EVd98n3C8Hb4YQ/wTMkWKGWIbsDu?=
 =?us-ascii?Q?e3YE2OSeRhZAMEqvvsQJ+vuvDYX6AX0CzAC9IAh1OWzBRFmED6C9tLY3rtw9?=
 =?us-ascii?Q?O5tFHZP46uJ8Cpwe8Ij8HqnKMX7qj38eGLLQnZJPW84qtZ0c+HXJRJjN15Xc?=
 =?us-ascii?Q?D5JYvwJ6Rw38EmaQ3TbkK7FTzcnQhVOlHCaStV5WRTcI63/+Iu9SskQYfbrF?=
 =?us-ascii?Q?ik3oDFt2HZL4Oijui1rgjaCav8EZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TASuyby3CrJiygJ1vO966S1ZVwyroGZnwPpoVxl+zNTC86MsmRs0NBswrK1F?=
 =?us-ascii?Q?meSHt1ofwhLdHaJQf8HxegT/oBFWxMYtv3WLXGbH8OUIjjldYdTtg4X/Pjzz?=
 =?us-ascii?Q?Yo2vCZ/OzYvsuMkC4DDLoxFMIUDVxcOR1+RMWwN6+2hkuAx0rRqjReTEkPcx?=
 =?us-ascii?Q?xS1Kyer6Pc8yK+sSpg1tE0Ck9oQP48BejNs+wlPFlR1p7onc+oB/sJ9hKLNQ?=
 =?us-ascii?Q?wTfRI5aYrHxGWdZKkgzkcit0qqaitLIYxzzhvnfE+2QVFPimik85MKCTZeRO?=
 =?us-ascii?Q?BiSP6lv2ZvZbRL5jxxuAQHoD1eVziS/ghTEhmT3rfEfh/NeTPy/Bpp0JrwcR?=
 =?us-ascii?Q?GgN5IzQjWT3etbsj77HLfSa6EX0fybWwjHwuXJA94qktos3RvH3pvyJdyi/T?=
 =?us-ascii?Q?DHcqo+huFsAOtZhpjonFYXrjd4PojGin157WVePWUQJaXEwVCv5Tx6F/qrCk?=
 =?us-ascii?Q?f091CCwDie8IGXSMR8pLbuSXXk/EEqQaU/l0no3kAerZLHayBxRxtB7H4GxA?=
 =?us-ascii?Q?2xgWOFk0cKWE9WHCmAGsLb8dgBjD6hm2SsPkDrWHgQSLJnEKNExHZJiprNqO?=
 =?us-ascii?Q?adffKnsQqD0QQulmEntzC7YhiCVVMwvgoAfE0AWoM9C1hL7QG2kHOnrQpNt+?=
 =?us-ascii?Q?T4KG3SW9UaaOZohckdORP1ItDyJMcW0i8g1eb3uY3r0L5iFlfKSBqizIhs2T?=
 =?us-ascii?Q?/XB9mA1mdHJoUHM67w37y3yEkiKvvwJrcHHDapxQ50LrDxtQQsxyWeYT0rdw?=
 =?us-ascii?Q?n4GyWhyiswMv2eM14hmH6pBJXi803bnWKW/Ar85Bmn5LpNU/foaA3mV/dQR7?=
 =?us-ascii?Q?XznZV7Bl6dlf4EQDPiKdpHe9CJDULV856tTZUwL6T80sBAgK7gX+AW0bVofH?=
 =?us-ascii?Q?v39QtMLg3TI4/8WvJIUY/BVST8J/8MXMBH+CEE1kkVqV9bp57l03JuGj6cIp?=
 =?us-ascii?Q?yOQ3C+cMc4hOabb6si6Zv0z+I/XL/6hWT2o90UAT2x04qiaI/OIUcWAD7Y1q?=
 =?us-ascii?Q?EvIBMhDUmcuRQvIPkvMLR4m+oeKMJzKLuiiSGLIf4mFE5aI2CYBsAp961A+1?=
 =?us-ascii?Q?aeOLe/YkFDDxHjMbPvhMKPWpQ66VvxMAQwsRawMjngGgxr1yI6m5+SSWWHQN?=
 =?us-ascii?Q?O6PxtpS7sJyVF0P2ztLlwzn6sL0guWvz+XEG9KVtVQilspYuBjn/Cr/MZUni?=
 =?us-ascii?Q?iPnDlqm+c3uOPfjLWfcH7/X3LlgKhd0Wv5MmvWxH1XMWdW9cXxNahaO9J/kk?=
 =?us-ascii?Q?Tb78uZ6zKnMajWcCB9u0fRKRxzwDJpjlxFhi4bYQmHHOhJCG4IsykbRTKAup?=
 =?us-ascii?Q?cLzFCBxHsg5P79HbcaRn2WLflRnECZfoveK9WHWVR2vX+S/7A3RZtfQvx+bI?=
 =?us-ascii?Q?L1h/XmOKX6q6/MqIb/3vPYnnpOIFhFbcz6DWxUqaXFO7SvRd3/nm3ht2tEMW?=
 =?us-ascii?Q?R8EKUXcigBubiwKEicjK2wiAb1kcAjKIM99Aa1+5qmi6aGiaJL1t1f+zMs1B?=
 =?us-ascii?Q?AhWmdVtZ15b9Uasy1aBdGNEarWXYJXGy6/ZyyZ0YZXd/rpNsEbSu/FmN9+SF?=
 =?us-ascii?Q?XL3EqdUtBDzLsq0dG0BD2i0YRMMM9SWda2susD5Nwj395nj9wZid27Nf4gFq?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f42876ca-560f-4c4b-b1fc-08dd55e3ad83
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 21:30:51.5097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SOwW0JgHSnek/QYOL1YrKPsN7Y7+M+Q8K0wUPaVlBxnmVEJiQWYIN0389zOCmL4FpWMYITMcLvx+si8A2Z2K0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4635
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

On Thu, Feb 20, 2025 at 08:38:32PM +0000, Jonathan Cavitt wrote:
> Add support for userspace to query per drm client reset stats via the
> query ioctl.  This includes the number of engine resets the drm client
> has observed, as well as a list of up to the last 50 relevant exec
> queue bans and their associated causal pagefaults (if they exists).
> 
> v2: Report EOPNOTSUPP if CONFIG_PROC_FS is not set in the kernel
>     config, as it is required to trace the reset count and exec
>     queue bans.
> 

So where is requirement coming from, it looks an awfully like a lot
VLK-67429 which is supporting the VK fault extension [1] which is being
discussed. Do you have non-IGT user space that uses this? That user
space seems to indicate we should attach this inform to the VM not the
exec queue which would mean the whole assoicating fault to exec queue
dance can be dropped.

[1] https://registry.khronos.org/vulkan/specs/latest/man/html/VK_EXT_device_fault.html  

> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_query.c | 70 +++++++++++++++++++++++++++++++++++
>  include/uapi/drm/xe_drm.h     | 50 +++++++++++++++++++++++++
>  2 files changed, 120 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 3aad4737bfec..671bc4270b93 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -16,10 +16,12 @@
>  #include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_drm_client.h"
>  #include "xe_exec_queue.h"
>  #include "xe_force_wake.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
> +#include "xe_gt_pagefault.h"
>  #include "xe_guc_hwconfig.h"
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
> @@ -740,6 +742,73 @@ static int query_pxp_status(struct xe_device *xe,
>  	return 0;
>  }
>  
> +static size_t calc_reset_stats_size(struct xe_drm_client *client)
> +{
> +	size_t size = sizeof(struct drm_xe_query_reset_stats);
> +#ifdef CONFIG_PROC_FS
> +	spin_lock(&client->blame_lock);
> +	size += sizeof(struct drm_xe_exec_queue_ban) * client->blame_len;
> +	spin_lock(&client->blame_lock);
> +#endif
> +	return size;
> +}
> +
> +static int query_reset_stats(struct xe_device *xe,
> +			     struct drm_xe_device_query *query,
> +			     struct drm_file *file)
> +{
> +	void __user *query_ptr = u64_to_user_ptr(query->data);
> +	struct drm_xe_query_reset_stats resp;
> +	struct xe_file *xef = to_xe_file(file);
> +	struct xe_drm_client *client = xef->client;
> +	struct blame *b;
> +	size_t size = calc_reset_stats_size(client);
> +	int i = 0;
> +
> +#ifdef CONFIG_PROC_FS
> +	if (query->size == 0) {
> +		query->size = size;
> +		return 0;
> +	} else if (XE_IOCTL_DBG(xe, query->size != size)) {

Worth noting this can race if a fault occurs between first query and
second. Perhaps returning -EINVAL is fine though. Another option could
be just return a truncated number of faults. In practice only likely
only 1 fault occured before the exec queue is banned if only fatal page
faults are recorded. 


> +		return -EINVAL;
> +	}
> +
> +	if (copy_from_user(&resp, query_ptr, size))
> +		return -EFAULT;
> +
> +	resp.reset_count = atomic_read(&client->reset_count);
> +
> +	spin_lock(&client->blame_lock);
> +	resp.ban_count = client->blame_len;
> +	list_for_each_entry(b, &client->blame_list, list) {
> +		struct drm_xe_exec_queue_ban *ban = &resp.ban_list[i++];
> +		struct pagefault *pf = b->pf;
> +
> +		ban->exec_queue_id = b->exec_queue_id;
> +		ban->pf_found = pf ? 1 : 0;
> +		if (!pf)
> +			continue;
> +
> +		ban->access_type = pf->access_type;
> +		ban->fault_type = pf->fault_type;
> +		ban->vfid = pf->vfid;
> +		ban->asid = pf->asid;
> +		ban->pdata = pf->pdata;
> +		ban->engine_class = xe_to_user_engine_class[pf->engine_class];
> +		ban->engine_instance = pf->engine_instance;
> +		ban->fault_addr = pf->page_addr;
> +	}
> +	spin_unlock(&client->blame_lock);
> +
> +	if (copy_to_user(query_ptr, &resp, size))
> +		return -EFAULT;
> +
> +	return 0;
> +#else
> +	return -EOPNOTSUPP;
> +#endif
> +}
> +
>  static int (* const xe_query_funcs[])(struct xe_device *xe,
>  				      struct drm_xe_device_query *query,
>  				      struct drm_file *file) = {
> @@ -753,6 +822,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
>  	query_uc_fw_version,
>  	query_oa_units,
>  	query_pxp_status,
> +	query_reset_stats,
>  };
>  
>  int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 892f54d3aa09..ffeb2a79e084 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -682,6 +682,7 @@ struct drm_xe_query_pxp_status {
>   *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
>   *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
>   *  - %DRM_XE_DEVICE_QUERY_PXP_STATUS
> + *  - %DRM_XE_DEVICE_QUERY_RESET_STATS
>   *
>   * If size is set to 0, the driver fills it with the required size for
>   * the requested type of data to query. If size is equal to the required
> @@ -735,6 +736,7 @@ struct drm_xe_device_query {
>  #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
>  #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
>  #define DRM_XE_DEVICE_QUERY_PXP_STATUS		9
> +#define DRM_XE_DEVICE_QUERY_RESET_STATS		10
>  	/** @query: The type of data to query */
>  	__u32 query;
>  
> @@ -1845,6 +1847,54 @@ enum drm_xe_pxp_session_type {
>  	DRM_XE_PXP_TYPE_HWDRM = 1,
>  };
>  
> +/**
> + * struct drm_xe_exec_queue_ban - Per drm client exec queue ban info returned
> + * from @DRM_XE_DEVICE_QUERY_RESET_STATS query.  Includes the exec queue ID and
> + * all associated pagefault information, if relevant.
> + */
> +struct drm_xe_exec_queue_ban {
> +	/** @exec_queue_id: ID of banned exec queue */
> +	__u32 exec_queue_id;
> +	/**
> +	 * @pf_found: whether or not the ban is associated with a pagefault.
> +	 * If not, all pagefault data will default to 0 and will not be relevant.
> +	 */
> +	__u8 pf_found;
> +	/** @access_type: access type of associated pagefault */
> +	__u8 access_type;
> +	/** @fault_type: fault type of associated pagefault */
> +	__u8 fault_type;
> +	/** @vfid: VFID of associated pagefault */
> +	__u8 vfid;
> +	/** @asid: ASID of associated pagefault */
> +	__u32 asid;
> +	/** @pdata: PDATA of associated pagefault */
> +	__u16 pdata;
> +	/** @engine_class: engine class of associated pagefault */
> +	__u8 engine_class;
> +	/** @engine_instance: engine instance of associated pagefault */
> +	__u8 engine_instance;
> +	/** @fault_addr: faulted address of associated pagefault */
> +	__u64 fault_addr;

This looks way to much like the current hardware implementation for a
uAPI. We need to abstract this a bit so if the hardware changes the uAPI
stiil works. Also always include extra bits for future expansion too. So
I'd start with 'what are UMD requirements for the information it needs'
and develop an interface based on that. The ask 'what could the future
UMD requirements be' and make sure the interface can extended to meet
those.

> +};
> +
> +/**
> + * struct drm_xe_query_reset_stats - Per drm client reset stats query.
> + */
> +struct drm_xe_query_reset_stats {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +	/** @reset_count: Number of times the drm client has observed an engine reset */
> +	__u64 reset_count;
> +	/** @ban_count: number of exec queue bans saved by the drm client */
> +	__u64 ban_count;

Both of the above values are always 0 or 1, right? u64 might be a bit
much then.

Matt

> +	/**
> +	 * @ban_list: flexible array of struct drm_xe_exec_queue_ban, reporting all
> +	 * observed exec queue bans on the drm client.
> +	 */
> +	struct drm_xe_exec_queue_ban ban_list[];
> +};
> +
>  /* ID of the protected content session managed by Xe when PXP is active */
>  #define DRM_XE_PXP_HWDRM_DEFAULT_SESSION 0xf
>  
> -- 
> 2.43.0
> 
