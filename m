Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CC7B2B25A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 22:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115BA10E032;
	Mon, 18 Aug 2025 20:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dxhi79nY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5EB10E032;
 Mon, 18 Aug 2025 20:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755548899; x=1787084899;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q7advG6JQH2n6jwEBpZdsMHsKmuaVCzCaOAP6ooQwcI=;
 b=Dxhi79nYVCMXy1Dw5taHGlTAO60SQw74/rthlWqJF2iDh05n+aScLw3o
 sq5mOSIHNSM0sJZm7lSeVGKhcZ2jb3fpC5hDCBPsBWlOUcTnwAzOPE3rc
 vXUB2YkmR/otisifJdLCtZo3/j3tEZcFIMOsrclM2JJIw2Y2Fe6UG3Fc/
 apZhQo80RylAIaBxjNh0doHZ8i4kqOKFW1QQFMa6c/gWuDoOaq0beImYa
 9whP4JwRm3u8nDtDNuLrNlSFNYiraAqMYhQ7F5TBEM9bAR/j69nY41LLE
 SqiWJcrS6mQyJcngpJ5GWNCSoUEo83zopiUytriaDl2wico9fg8TB2zna Q==;
X-CSE-ConnectionGUID: E8n5qGOhRHOF5mE0HcO87A==
X-CSE-MsgGUID: tAvZ0UCoQpyaQMDBdm/bjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="60408223"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="60408223"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 13:28:18 -0700
X-CSE-ConnectionGUID: DJWmmLC8SSGR4Q7P8zwUHg==
X-CSE-MsgGUID: sf/yaiIRQ2aEeo7EtR8YkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="166835978"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 13:28:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 13:28:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 13:28:17 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.72)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 13:28:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+X78Lr/z8lZOUo0gfV64BHcOIsvXOjVhoW3U6Joollch1H3/qMQ0R5jVTfU4ByAZznI82ATvH6AJQggYLwNaL/Eg5xKn9gWrkz3oowQ+q9Bg/cQphYiB7+grSs4My8Pe91ks0TYwgWiwlasMCqAak341TMhfbJJrECt1rj1hC3CocJJZoNwZnR4EATDa2NNljRsLkXbRYNQhJftQqU7zaG0AiBVZFQ6YgG0GBg3dIBSV/xway6S2Fz6UNNQNrFiICy1PCeJVUWLLC8vM4mJ4dhjX65k0qbrN+cpqvbrYu7GzV3TDKGt8COLrDGFXVCxhFVkN+0QqkiIuogHDWya1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4f3Jiz6eHcR2/46/bFlCVI0g3dfvrBbp5wnUCtOrTo=;
 b=Mvn5kR27NdOD9spxREYMQ5JwxiWn26+Avqe5fZZG8xRkddqyGtMS7/Tst8gQmXT3ZMiw/nBeH0Sm4xb32z+oqByWZWKopnbTijCP/4rXRVy6q31WrNk4maUOHH4G7nJO2pFebDncGwbQKO26+NKdR1wbsU+29xryozBnCG4dwGZOBI0g6RuVXxLef09IkwBF97V6LGY0AkdDjOqildlDQSpwtKCUsfO985DnsU25FhjP5zK4/KdykBKV4t1C21krb6VyOvevKRjMaPxZ53U+Sz2O1wVpG4/mXKOiE70E9rhteyGpEwbYchnhyWvsSx1Kv7mHo7FzZJMcGICjitq3yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA0PR11MB7403.namprd11.prod.outlook.com (2603:10b6:208:431::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 20:28:14 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 20:28:14 +0000
Date: Mon, 18 Aug 2025 16:28:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v7 00/24] MADVISE FOR XE
Message-ID: <aKOM2YDOKAH5OQea@intel.com>
References: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR13CA0140.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::25) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA0PR11MB7403:EE_
X-MS-Office365-Filtering-Correlation-Id: 347a23bc-ee46-4b60-2847-08ddde95c1e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O2IQJx4WLg5gAesN0d+xCOkQnVv6fHu8RNjZuEygVioLftMfI5xgNFFykA6E?=
 =?us-ascii?Q?leKaq+s0HlgwXJUyYHcCIR93CyxnS5zSSrb1BpH2zQnRb6pmY7fYMDsbusUS?=
 =?us-ascii?Q?6M40lWxPkWfu5+xDf1rRRc9XqjeTMpu7zQAiplBLK7CsbOltO1/oL4iq/nIz?=
 =?us-ascii?Q?1Uh7bJyHPrXeo7TeMWXTKhsivkaT5gHO2i9+2r02q78QAFU1joSNYwy3FsN4?=
 =?us-ascii?Q?Wk9TD65Rnn02gxEyjO1cZDIYuaY2c7ZJrLx8KgxlRTcCACPM68zE6qRFt0fS?=
 =?us-ascii?Q?PvL5NkAEblaIsztq++EANvEZORY5Q/A0CntB0fwTLI48WgBKTdj2Ae7mGLBV?=
 =?us-ascii?Q?d5oBxrnlHauMkEyW8vdeld6ZYkulx4AvqX3B9vv9ZUeGa0DGwo4ekwUpSASY?=
 =?us-ascii?Q?fJ5aTnGUBp+nAZWlH3QKbWSE7UpWtyqH6+PmOYnfM3JIK4BxdRePjgy50idy?=
 =?us-ascii?Q?HQibqUS8lSIv/LEhh2NljUQsq5H+xFd356W5gJP3JEe8C0SJKTEZPYfRkdkh?=
 =?us-ascii?Q?N+RRR56gpQ/ws6X6cEFiqZQl7Lpm8hHTyb8NOOMPss7wUd9xZl4DWVjr80/z?=
 =?us-ascii?Q?ZhjhnnEYLhRDoftSy4Xm4AvdpJ9I97KQ+g8piSfzWYfFyLGdC4H9HhFtC9lp?=
 =?us-ascii?Q?alUGEWzHq9vBx+JR7ayegfg3SLg5Jmqi3R2E92nBKhQl42I4PcmzGcfQr/u0?=
 =?us-ascii?Q?ESspk/tnhi8C9MU2xHzNs/MRej3Xd5vQiWaqn+LUWNCQUHX9DVocRXqwoBVC?=
 =?us-ascii?Q?X8TM8e/AlNoe7YoPyTASs5/W9fVxzxZ/7TM8uNuSm3hkZa0h4/Re2WP6BKs7?=
 =?us-ascii?Q?CvglbXUwQaw9eTz0CTNl85VYWe7aoUvG7b5hxn49alS0+3LTd/cWxe0pQNFV?=
 =?us-ascii?Q?e399ajdXrWYH7ZftA46+WMDe2KynnZB3o5jbkXLNNWLaQTjpBoT+qP7WdbHL?=
 =?us-ascii?Q?YjZmoZ+A7uesE63aS5lVufpCP5t9xaihfFpnMUVq8Pg/5anrg8QsMI2gV0Tf?=
 =?us-ascii?Q?1Fys0cPxb8NCae946njqEoZ8t8+46AeTcv1dDlv+t5qJj861VIZE3+pqfI14?=
 =?us-ascii?Q?Bj8KMftMIUunUIKgTn7buEdI4w1e/z5v5F/WPjnZeZvbHmnsmGtVV5Q9FXse?=
 =?us-ascii?Q?SxfAB358qvyxiEbu0xIT6igfJDjUWQxWKO1zIDDdY6chVULDyjscNmPuw2GU?=
 =?us-ascii?Q?j/ZfMUoHwId9w4jKa7CmdjdjaFN7q5n9m/7kiZpsPFNOkldoD9E8tyVtCOnq?=
 =?us-ascii?Q?i2JKHZ+F7j+uwJXevQoWrdx3fjW54FnJjKWO43TQzqA9fS4RyYch1iHovE+N?=
 =?us-ascii?Q?66gR/Q5Bn7gfJniqXL7S3m2QoT2T6i4rtJWaUexLTi7EGTtBATQcNxm83aRd?=
 =?us-ascii?Q?Ul/MHe0VPZ2Da54f6i/jTJ60XSOwcySmJoRE4oPci7o9QFVd21+rLMuz+bjJ?=
 =?us-ascii?Q?jzv5041gOsk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZGHn/2GGAxWNYUZ0WnNtrtu3qBASqJfptMi/XFbfe7LxiGgZRB/MI6eFIZrc?=
 =?us-ascii?Q?LUiOWJKwWnFr909v+N0jvmbr7tYl8uuhepwAQHXyaO91zwba7ljMFq9d8bJp?=
 =?us-ascii?Q?I0mBq6tmXlYVSKRhAhOmn0anpH+4tHyuBtPmTvXuqItVVLOMSAGShmR4g50I?=
 =?us-ascii?Q?93HTZbnTEckEsmavQ+IgQ+IMFewfA1riJGnPO40LniPRw8eyXcabdQRDGjX1?=
 =?us-ascii?Q?BJ91k5t+wHXD3CmKHRit2PxgaSMz9l0/YW/pnz9zI3rz4lDG10viMir7aOjA?=
 =?us-ascii?Q?d07IOWzjtMVr+mRuKr9h1x7go+B2mLOoKnHz3x5j2T9sEhMYpSJx4kmJ8G1I?=
 =?us-ascii?Q?qVxx+PO/1/67a8K9GfhrEyLAtBpcU/8XvtduIt2mBtixdz3/18ypsNxQjjFN?=
 =?us-ascii?Q?fCzrCII0hitUwqh0/qI6jWc93lMgecw7RiXRfQkYN1wGr6Flf29Tg5fsxCvR?=
 =?us-ascii?Q?qEDzRowaBv3RoEd29RSFoPN4z8Ga/17UiLDeG6t/wmOw0yHQVZwh6KpetZex?=
 =?us-ascii?Q?jKHJ2MfFCTQX/g3cyPopwLay6iZ6D0eH4NDnw+TWAunmo37LmuGzEhO0ewl8?=
 =?us-ascii?Q?e2okUWWzh7MRIfxFxYutrgIQ85D8u74TzW2WPvOWPt5297gMka1u7bxqgrkg?=
 =?us-ascii?Q?a2OIPrNee1GkiaP0UlgbpkP7Bog8+27JagTgeJThgNbCaR3uINiJwBkQVOzH?=
 =?us-ascii?Q?vQel3+OpIngtj2lRzheCbp7AZ4g3O0qEFkrgPC62UZjEkrvt4ek6lp8KJB3Y?=
 =?us-ascii?Q?R0a0WO8S375yDWRhDQeikF3qq7G6fgyqlc5YPurs82PtYr2UP1OscwjrxNUH?=
 =?us-ascii?Q?6i7b3b8PkEK/Lc29O8VAAs6EMZ5PGJ5yWG3i+4wxzWeSGzkV6v5RTQKAolzG?=
 =?us-ascii?Q?j5Pn2DSh8W1FlP2KWz2/W1aYhdIozz+z0E9wsF0XKqMyDWJdWA4vfCTysrYe?=
 =?us-ascii?Q?0YDMqpc8DdcZPVFoxmJjYw9G2RS2922XbclQIuwEbMTkIKa+9XpdhyiuNwXp?=
 =?us-ascii?Q?vdg04kvdrs6yLS2OjiC1B77DDocU3w4lCvidnwYpQkRnHKjjJqVd8EoG/ShJ?=
 =?us-ascii?Q?4Y+RKhOKGxdQdtzZ7np/qkl0rHbjBYkevjU0lhWj4oLXiWugxYE+A5Pn6LMA?=
 =?us-ascii?Q?uMYPL7rZuhYzm85bQ5zTcH4yoViyDrHiIh3A0dr7YLq/fPc3dpT8wrsdYm8b?=
 =?us-ascii?Q?OsDhE4PA6Jm5HIew45Edl1W6x0B8NzTXettCi2q1D90Hec7FbA9AgEexGMHd?=
 =?us-ascii?Q?LAKY+NG9qhUyF8Ek0ZhiwwhbL3ah1KyiDsiPGdN1mkOE+EZHQeWFqOIo0M/X?=
 =?us-ascii?Q?TOEnQSso6f0UdzmhSYrSfdJa8D/MFKZnC/lfN3YnmXTPaFUuXNdLh+N9YB2X?=
 =?us-ascii?Q?NqOxlvjz1L1uuwfVo6FrdkeHjk74WWEGCNiGJb/J5/koCK+3rQnwg/MFUnQQ?=
 =?us-ascii?Q?pRD4oC3sB99hZJUXZu/ESnIyOJg5KjNGrlZfczu2PkA+YHA49iZmo4OJ1MEw?=
 =?us-ascii?Q?ftD+yd29VN+BtoQuoatcW/Y+swNBF0u2kfnFLs3pyO47IXkXOUcTt2nvbnh1?=
 =?us-ascii?Q?Fv4GPTLQ0wSynSyeWZ9Mta0QPRt5v75sxaGYHWpx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 347a23bc-ee46-4b60-2847-08ddde95c1e2
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 20:28:14.3012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gYbnHrq0NtRgQ4DtRJN3Sn0BcYRxA3EuB0aozm7k2uXbiii0AfF2imNPluPVG7bf5aAQiDOzwBau8fPsKCQ+ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7403
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

On Thu, Aug 14, 2025 at 04:29:26PM +0530, Himal Prasad Ghimiray wrote:
> -v8
> Define new function in gpuvm for madvise
> Fix tile check in ops_create

Please re-send this series again. But this time, ensure that dri-devel
is in the --to= of the series!

In 8 revisions, it looks like not a single time it was sent completely
to dri-devel. Big changes like this needs to be pretty visible.

Ensure to get all the appropriate acks in all the relevant patches as
well after resending to dri-devel.

Thanks,
Rodrigo.

> 
> -v7
> Change gpuvm layering on gpuvm_map_req struct
> Fix EAGAIN return on garbage collector splitting vma
> 
> -v6
> Rebase on gpuvm patches
> Address review comments
> 
> -v5
> Restore attributes to default after free from userspace
> Add defragment worker to merge cpu mirror vma with default attributes
> Avoid using VMA in uapi
> address review comments
> 
> -v4:
> fix atomic policies
> fix attribute copy
> address review comments
> 
> Provides a user API to assign attributes like pat_index, atomic
> operation type, and preferred location for SVM ranges.
> The Kernel Mode Driver (KMD) may split existing VMAs to cover input
> ranges, assign user-provided attributes, and invalidate existing PTEs so
> that the next page fault/prefetch can use the new attributes.
> 
> Boris Brezillon (2):
>   drm/gpuvm: Pass map arguments through a struct
>   drm/gpuvm: Kill drm_gpuva_init()
> 
> Himal Prasad Ghimiray (22):
>   drm/gpuvm: Introduce drm_gpuvm_madvise_ops_create
>   drm/xe/uapi: Add madvise interface
>   drm/xe/vm: Add attributes struct as member of vma
>   drm/xe/vma: Move pat_index to vma attributes
>   drm/xe/vma: Modify new_vma to accept struct xe_vma_mem_attr as
>     parameter
>   drm/gpusvm: Make drm_gpusvm_for_each_* macros public
>   drm/xe/svm: Split system allocator vma incase of madvise call
>   drm/xe: Allow CPU address mirror VMA unbind with gpu bindings for
>     madvise
>   drm/xe/svm: Add xe_svm_ranges_zap_ptes_in_range() for PTE zapping
>   drm/xe: Implement madvise ioctl for xe
>   drm/xe/svm: Add svm ranges migration policy on atomic access
>   drm/xe/madvise: Update migration policy based on preferred location
>   drm/xe/svm: Support DRM_XE_SVM_MEM_RANGE_ATTR_PAT memory attribute
>   drm/xe/uapi: Add flag for consulting madvise hints on svm prefetch
>   drm/xe/svm: Consult madvise preferred location in prefetch
>   drm/xe/bo: Add attributes field to xe_bo
>   drm/xe/bo: Update atomic_access attribute on madvise
>   drm/xe/madvise: Skip vma invalidation if mem attr are unchanged
>   drm/xe/vm: Add helper to check for default VMA memory attributes
>   drm/xe: Reset VMA attributes to default in SVM garbage collector
>   drm/xe: Enable madvise ioctl for xe
>   drm/xe/uapi: Add UAPI for querying VMA count and memory attributes
> 
>  drivers/gpu/drm/drm_gpusvm.c           | 122 ++-----
>  drivers/gpu/drm/drm_gpuvm.c            | 287 ++++++++++++----
>  drivers/gpu/drm/imagination/pvr_vm.c   |  15 +-
>  drivers/gpu/drm/msm/msm_gem_vma.c      |  33 +-
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c |  11 +-
>  drivers/gpu/drm/panthor/panthor_mmu.c  |  13 +-
>  drivers/gpu/drm/xe/Makefile            |   1 +
>  drivers/gpu/drm/xe/xe_bo.c             |  29 +-
>  drivers/gpu/drm/xe/xe_bo_types.h       |   8 +
>  drivers/gpu/drm/xe/xe_device.c         |   4 +
>  drivers/gpu/drm/xe/xe_gt_pagefault.c   |  35 +-
>  drivers/gpu/drm/xe/xe_pt.c             |  39 ++-
>  drivers/gpu/drm/xe/xe_svm.c            | 254 ++++++++++++--
>  drivers/gpu/drm/xe/xe_svm.h            |  23 ++
>  drivers/gpu/drm/xe/xe_vm.c             | 438 ++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_vm.h             |  10 +-
>  drivers/gpu/drm/xe/xe_vm_madvise.c     | 445 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm_madvise.h     |  15 +
>  drivers/gpu/drm/xe/xe_vm_types.h       |  57 +++-
>  include/drm/drm_gpusvm.h               |  70 ++++
>  include/drm/drm_gpuvm.h                |  38 ++-
>  include/uapi/drm/xe_drm.h              | 274 +++++++++++++++
>  22 files changed, 1922 insertions(+), 299 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
>  create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h
> 
> -- 
> 2.34.1
> 
