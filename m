Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506EAC6BE6A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 23:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAFE10E20E;
	Tue, 18 Nov 2025 22:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYgV5A5k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9421B10E205;
 Tue, 18 Nov 2025 22:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763506477; x=1795042477;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6pwMkH13TYDg5ZQfmBuMP2xTmiUpGWMDlim0tA9Cw7s=;
 b=KYgV5A5kxm87/UUUUo4XW0Psp5Y5tnWpcH4nl6bBAmXpLzpFdQJq4BIU
 +ZpU5/CR6LIufp3Jxilnx/POFHOuDAPd40SVSaJV3PpTFKCKbk+mvrn9h
 tqaSpRS8MzkZ0g/YSQmFAEVPLqIERJ4uhOZoSTQsHKTkN3DuxPV4F7Hcf
 /SlUa3CQ0NcoHT9BAG4qmveW6laBed3ke46oRAuFJz4sZapufvXE5FACV
 hlZdewct40owmBwtcl5CD64B8XMh7FbLktZ1Ci0S84NHDfT5FTOWoBOhJ
 jiM8doMopOgnjMOTD3nNuACBI9M7wy9ct2ewrqkYkf59rFf32WOwiUVVT A==;
X-CSE-ConnectionGUID: 8tBBpSZ1TECTpSg473nZqA==
X-CSE-MsgGUID: NwmYyHtjQWWMWjIHe7i8lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="69393735"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="69393735"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 14:54:37 -0800
X-CSE-ConnectionGUID: sUkXQRstSl+Ozv/ymmC9Sg==
X-CSE-MsgGUID: 2vsd4NVLQlSuJWgs/IXgFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="195813374"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 14:54:37 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 14:54:36 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 14:54:36 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 14:54:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODEkzM3dXZiwFAeTj4m+e6WtbVeKOVXupfbmObyW/h+MXBnToK7guKzGiDJgcmJTlejqHl403dQwdxtfZep9sGNxzDYegNA52hJH/NkRcYmK2SjqIL0lCRrvC9RMDkbQSWHen0aaxaHJWDd682qgnzwYDuzSafdtj8QYDVG4Sb704tyXl/Nood1Hp7EEmeo+ujo078JNSt6cS4+XR4xxBOifkDa32UEdk13BsKokU4sbmZ+SxQ4/rXd/3yAHP4ekopoz774u/+EKDXfrIBDrEOBJTqEAbaTMdt0btWdGqa8grLTGtazKLlPcy+hnVDeFXnAnTS2uqChCKqLlkyId9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxecodgTfVDIVUPKlXf07G1ouoApTIqFONzGeUSHPhg=;
 b=vAQDSiem2yGgep5nHSeQ+aV/CW5PoH/QkH5w1/QCq0IvAqDX75yztvME1mOLdXDt/eV1YyOJ7vWPCyA+yJWtVhq1+HVahLpmoEeN1s7XtWMvjq1eWYz/AyyachtUJkQuTkFVryc5vvah95QWNrcA+h+9FF+noVYGt9yeX+PT+R7kfxCnDuFMyP5dpaUd4fxc+uQmGUH1J8Kvt2H/CFUZsvh46OLUBnlI34hCWEqKfhCRngi0fm3tX3bFjv2MJ2WdA9CKGVu1ZrZ+lRpqPqpQi1cKl8g4v80g+xqaBIvXYjr6SXd/YSB9ZsSSI6ySgoqXrM06M9oSHdY7qa7m+emisg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7788.namprd11.prod.outlook.com (2603:10b6:8:f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Tue, 18 Nov
 2025 22:54:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 22:54:32 +0000
Date: Tue, 18 Nov 2025 14:54:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 4/7] drm/xe: Stop abusing DRM scheduler internals
Message-ID: <aRz5JaVk5AbPSmik@lstrano-desk.jf.intel.com>
References: <20251016204826.284077-1-matthew.brost@intel.com>
 <20251016204826.284077-5-matthew.brost@intel.com>
 <aRwUrtpXAHi547AS@nvishwa1-desk>
 <aRy0BEOpxjFjJvbC@lstrano-desk.jf.intel.com>
 <aRziYhQ4ZWI6zVE6@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aRziYhQ4ZWI6zVE6@nvishwa1-desk>
X-ClientProxiedBy: MW4PR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:303:8c::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: 83e7b81a-e39e-46cf-64c9-08de26f5704d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a3Kyvx76WaoCbNu6Mzw1NpVCfU4VJZIYuJw2LGS8y0YwkbI2XcGuKZqbXd7A?=
 =?us-ascii?Q?l8HwpUJf9vsFynjwc/VSWZ6aIXQTFjkt6FN7clD8XH6lk4DD84A7NheJHjaX?=
 =?us-ascii?Q?DnIThheodim5IFe3qbuYGvGX/GXpxCyQOPpmSrtSl4KDtfh/5Vfkt23yhJFj?=
 =?us-ascii?Q?IprSHiR0PFbLhz0RTXUC82snbnPtY+bt0FQhTKY1M+oS+PYPYFy3rvNB0C6b?=
 =?us-ascii?Q?lXbesWcS6Uc3oJM1gXWIxpK8VyDmWDEqkSKBViOzyQkcGe948wvQOtNhyOXS?=
 =?us-ascii?Q?MNR5NsYIegTP/SXR5CHgIfhbv1tIgSVdI58neq57S3J5KtBtKISaVzoufe5q?=
 =?us-ascii?Q?+l23wdcBq1TsGIn1JzcOSKEpnNspm9fQphuPKZZgcls0/CalOhpw85HwhVmU?=
 =?us-ascii?Q?ujYb61fqEjJMsyb07Wki22k+w+TPW45IXu3Uf2zUS22iFehZwlJukIVJpm3g?=
 =?us-ascii?Q?NBVlsYtklUIUaPyeBncrLMchwV6saB/EvNUdPXDIrNtFpfuxXpHirgDsuKuF?=
 =?us-ascii?Q?NAmj6dlgtFmTzwug9LpFZu5fKOZVatKLaeU+MXLN3vnY9q48rM9LRECyiUnA?=
 =?us-ascii?Q?wOMOsorzeIN8NxoYJQ/Z4l1IfD9Ak/Gq5xElf5vilGO/Amd1kiiIxb2nJMuk?=
 =?us-ascii?Q?3Q4dWy0obaKBqaG+W4hIFYD6p6ezIesvyKP29iQATtNPsGiIug2rVDgELeWg?=
 =?us-ascii?Q?AhP0tXofapr1a4Ok/xNaXCuiqcZr4hq6u2qb7c9O/L7KuyQpKJ4Yh37V9/7E?=
 =?us-ascii?Q?blHSODStU5MmJAzv4N5EHJGYqwB0chSYXfUbTg21pkKk3A9UbtN5TP7gGYr+?=
 =?us-ascii?Q?N2Ha06vR+96vCSCFUBzc6gy7MR+bel/EdxGJggFurZmTUWBH2wtqnHZa57Yo?=
 =?us-ascii?Q?75e/xNde+omDw1oLvXq8w9uqVCcMyaD2nD4yrujXLX4bIrGK5I4UjiwNQnlM?=
 =?us-ascii?Q?w1K54Ajn9P45KLlOziFYbBJeOCXDjqMkzYMTAge/ueRwWOU9CiAYYx8TWekJ?=
 =?us-ascii?Q?14doU9aO/1CuMAV4nXbr9FiH5yY3Cyv2duZsfwg8AvGtcty8uAU62179AJHK?=
 =?us-ascii?Q?04w6VJJU85Y3hSiC9J1CUF76SdO5mPgDzpPjvbrHJ49mFnEDwdOhZnQytcm4?=
 =?us-ascii?Q?nMvY67qQKeTzO7jiW+RutjxhFiDe+8bxFE4wbZ5LjDRu6ZHeFKyyzji60/+x?=
 =?us-ascii?Q?0qolWRga6OtuGD0Lf25AQ32m+vtUCa/E+JkeB0SwiYCVcWrAOqFRmjYrT/xp?=
 =?us-ascii?Q?PqQh9wxoSpqdsmjgSDflWW5UaIkCLLQr7QnkzZWaJDFsrxA/cvd9ZST0gDf2?=
 =?us-ascii?Q?ZgpYQbJXHDLtgI70t0N4EebdGKB/EHVbW9vWd4oQeeDptwL5hY9YnnQWlJ0r?=
 =?us-ascii?Q?GYSXzhsjxY2PoWzy1ohGLyxhi0dYgO3OxyB41sGCeo6dSiDFHL2JU+5O7na3?=
 =?us-ascii?Q?N11hrVLct0IHeE517UCxEmLvXazWVBYf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AMwtbcbgNJFQ295EAGcd22KKkVMkxAQ2eG1MRrbGLh1KruWg8XIeiS/LR3yt?=
 =?us-ascii?Q?QPayxDQRw+BN9fYp/BGTwc6HwHXmT3SomEGnGU5gMtLP1PxsMl7Q9V2DuoVs?=
 =?us-ascii?Q?eHDf1Li/WfGgg1uSmUX3o4s7IP03OpTW/zOc4vy0+dvY3bzX2uhqc8bWZepq?=
 =?us-ascii?Q?6OZezMWsKedOLJ7m//Gkt+PlFlNyQdT3pSUYH2Dr28CdBgMhxArCqqRZsV/b?=
 =?us-ascii?Q?ZRbYw1/D3U8ZQBaoDU1uKdzkPhrpbfojguB8OT8YDZFG4jboik7bFdKgda5e?=
 =?us-ascii?Q?ZiIosDYMrf/o3NlFlzXc+4nfW+3Tz7ycVV27gFN7coCz0xkQcxM/e8QwUVuw?=
 =?us-ascii?Q?L2itRAGFlQQCbNsuQroTM4ewQyIfjAPN3TOndv4JxK+UNXAk6D4vRL0ONReu?=
 =?us-ascii?Q?ovdbAq0Bwdy9F1iKAG1kpa8IHQiUN1Immql+t6PqERvPHJVi7bRo0fEGJmTe?=
 =?us-ascii?Q?XsZi/BVDjGTkF39vBNFZFeaKb+16S4Kks9ohCefrW880JMv9YB0Abu7iPnaS?=
 =?us-ascii?Q?1WQ/TzTAkFXFfxXCJQZNuZ0Si1AvwVo582ehRPuMEw5X2Eo93qXaCf9EQm6R?=
 =?us-ascii?Q?2Ntk1yGJ237RmWzPxPeGAj5hsnf0W+W3Oc3X0un+G1XPj0o0OS+TxJ4YwZHv?=
 =?us-ascii?Q?ONX8MzuCCg8yggeuF3ebLnzWMumBuZa4XyHV6JNenGB3yWE7ZU2NEpGPSgp9?=
 =?us-ascii?Q?919CBm4ihjZq7F2Q69pWrr74iP1cBnlma7fO1XC1BQiNKG+ZpSyOM22T7QDP?=
 =?us-ascii?Q?sVAM48vmVikM1SQTY6EY3bnRUbptTR5We8N/lJ3f1eoHRtIfe6uMzS223bML?=
 =?us-ascii?Q?QoGQyS73nLlMO/krmPB0hkgw76HFDxF5ngOlEGIowiIQYFYyIXyf04KNRucj?=
 =?us-ascii?Q?zyWQUjgRFtcn1jyFAUv1e+l4J8E/nK0JD+4GCexCaj2VH5LOvn2QNCQXI2DH?=
 =?us-ascii?Q?BDgjAKLwmjNP1Qv3W8K68zTq1tAi8/JVqF/VCg3vYHjcLMDgWwKXH6tfIWbq?=
 =?us-ascii?Q?fV5DOnoglEN5fY4zSdPvZI5cmSXSvxAdI10yMxb9FkhNjUc+kHPTMtNrFCcl?=
 =?us-ascii?Q?yU0NE2EMCbCx8ZWHqEhXW7X0hENGPRXUFWfr+DeeNN9mAgSKhcclEvnLSbqa?=
 =?us-ascii?Q?MpcgnEhWo/g4WLyY4RyyHOiXJoy3Fyd4x9J9/DQVl+JqoFOKBpcXIvEIUL6R?=
 =?us-ascii?Q?qyzUeP5/3XIQ8o9Tz+GRCdl304j3mYMYjmtiqIdoc2Ft9NnDaIvHLn+Xm2u1?=
 =?us-ascii?Q?tarVuLrUNSrG8kYooy4032rOrFvQdhDjyjNVtEmYNwi6ebvna66sEzCK//6w?=
 =?us-ascii?Q?kUuZv81VQPlb8ZgjyvEJXN5RxVui7NpOf+KYY3tZ4qsl030R9CuuA5c1ULKN?=
 =?us-ascii?Q?18rv0G0RdkKS7pAIKAF0QCY1N+f1uIWuhEM75+4XdDhAO3F7ph5ngR5iT5OO?=
 =?us-ascii?Q?979i00MBqzYrdGKJ7FYaQzsruqNhE8dG2S2q+JoyoaGF+q1K/WLDmhoRo0HN?=
 =?us-ascii?Q?UuyifR8V9/emfSUaUsbiWlJYOJBYTU0CdpkAS5XmA63ER/Fc3UXvdh6fh/RY?=
 =?us-ascii?Q?ur2NzeGH8wNOE+U2R84QyVrdUVRLpIJpGg5T/0/E6t1Ymn/wqC9a+k+iCJtk?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e7b81a-e39e-46cf-64c9-08de26f5704d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 22:54:32.7907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9lebDl2fnYmS3KLzdXvjg6ViuXnhHsCyHPTrQqYfYUgaumvmT3JISBGwijGrgpBwieVal50X4auU4R5BhbwthQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7788
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

On Tue, Nov 18, 2025 at 01:17:22PM -0800, Niranjana Vishwanathapura wrote:
> On Tue, Nov 18, 2025 at 09:59:32AM -0800, Matthew Brost wrote:
> > On Mon, Nov 17, 2025 at 10:39:42PM -0800, Niranjana Vishwanathapura wrote:
> > > On Thu, Oct 16, 2025 at 01:48:23PM -0700, Matthew Brost wrote:
> > > > Use new pending job list iterator and new helper functions in Xe to
> > > > avoid reaching into DRM scheduler internals.
> > > >
> > > > Part of this change involves removing pending jobs debug information
> > > > from debugfs and devcoredump. As agreed, the pending job list should
> > > > only be accessed when the scheduler is stopped. However, it's not
> > > > straightforward to determine whether the scheduler is stopped from the
> > > > shared debugfs/devcoredump code path. Additionally, the pending job list
> > > > provides little useful information, as pending jobs can be inferred from
> > > > seqnos and ring head/tail positions. Therefore, this debug information
> > > > is being removed.
> > > >
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_gpu_scheduler.c    |  4 +-
> > > > drivers/gpu/drm/xe/xe_gpu_scheduler.h    | 34 +++--------
> > > > drivers/gpu/drm/xe/xe_guc_submit.c       | 74 ++++--------------------
> > > > drivers/gpu/drm/xe/xe_guc_submit_types.h | 11 ----
> > > > drivers/gpu/drm/xe/xe_hw_fence.c         | 16 -----
> > > > drivers/gpu/drm/xe/xe_hw_fence.h         |  2 -
> > > > 6 files changed, 20 insertions(+), 121 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > > index f4f23317191f..9c8004d5dd91 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > > @@ -7,7 +7,7 @@
> > > >
> > > > static void xe_sched_process_msg_queue(struct xe_gpu_scheduler *sched)
> > > > {
> > > > -	if (!READ_ONCE(sched->base.pause_submit))
> > > > +	if (!drm_sched_is_stopped(&sched->base))
> > > > 		queue_work(sched->base.submit_wq, &sched->work_process_msg);
> > > > }
> > > >
> > > > @@ -43,7 +43,7 @@ static void xe_sched_process_msg_work(struct work_struct *w)
> > > > 		container_of(w, struct xe_gpu_scheduler, work_process_msg);
> > > > 	struct xe_sched_msg *msg;
> > > >
> > > > -	if (READ_ONCE(sched->base.pause_submit))
> > > > +	if (drm_sched_is_stopped(&sched->base))
> > > > 		return;
> > > >
> > > > 	msg = xe_sched_get_msg(sched);
> > > > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > > > index b971b6b69419..583372a78140 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > > > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > > > @@ -55,14 +55,10 @@ static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
> > > > {
> > > > 	struct drm_sched_job *s_job;
> > > >
> > > > -	list_for_each_entry(s_job, &sched->base.pending_list, list) {
> > > > -		struct drm_sched_fence *s_fence = s_job->s_fence;
> > > > -		struct dma_fence *hw_fence = s_fence->parent;
> > > > -
> > > > +	drm_sched_for_each_pending_job(s_job, &sched->base, NULL)
> > > > 		if (to_xe_sched_job(s_job)->skip_emit ||
> > > > -		    (hw_fence && !dma_fence_is_signaled(hw_fence)))
> > > > +		    !drm_sched_job_is_signaled(s_job))
> > > > 			sched->base.ops->run_job(s_job);
> > > > -	}
> > > > }
> > > >
> > > > static inline bool
> > > > @@ -71,14 +67,6 @@ xe_sched_invalidate_job(struct xe_sched_job *job, int threshold)
> > > > 	return drm_sched_invalidate_job(&job->drm, threshold);
> > > > }
> > > >
> > > > -static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
> > > > -					    struct xe_sched_job *job)
> > > > -{
> > > > -	spin_lock(&sched->base.job_list_lock);
> > > > -	list_add(&job->drm.list, &sched->base.pending_list);
> > > > -	spin_unlock(&sched->base.job_list_lock);
> > > > -}
> > > > -
> > > > /**
> > > >  * xe_sched_first_pending_job() - Find first pending job which is unsignaled
> > > >  * @sched: Xe GPU scheduler
> > > > @@ -88,21 +76,13 @@ static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
> > > > static inline
> > > > struct xe_sched_job *xe_sched_first_pending_job(struct xe_gpu_scheduler *sched)
> > > > {
> > > > -	struct xe_sched_job *job, *r_job = NULL;
> > > > -
> > > > -	spin_lock(&sched->base.job_list_lock);
> > > > -	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
> > > > -		struct drm_sched_fence *s_fence = job->drm.s_fence;
> > > > -		struct dma_fence *hw_fence = s_fence->parent;
> > > > +	struct drm_sched_job *job;
> > > >
> > > > -		if (hw_fence && !dma_fence_is_signaled(hw_fence)) {
> > > > -			r_job = job;
> > > > -			break;
> > > > -		}
> > > > -	}
> > > > -	spin_unlock(&sched->base.job_list_lock);
> > > > +	drm_sched_for_each_pending_job(job, &sched->base, NULL)
> > > > +		if (!drm_sched_job_is_signaled(job))
> > > > +			return to_xe_sched_job(job);
> > > >
> > > > -	return r_job;
> > > > +	return NULL;
> > > > }
> > > >
> > > > static inline int
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index 0ef67d3523a7..680696efc434 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -1032,7 +1032,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> > > > 	struct xe_exec_queue *q = ge->q;
> > > > 	struct xe_guc *guc = exec_queue_to_guc(q);
> > > > 	struct xe_gpu_scheduler *sched = &ge->sched;
> > > > -	struct xe_sched_job *job;
> > > > +	struct drm_sched_job *job;
> > > > 	bool wedged = false;
> > > >
> > > > 	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
> > > > @@ -1091,16 +1091,10 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> > > > 	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
> > > > 		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
> > > >
> > > > -	xe_hw_fence_irq_stop(q->fence_irq);
> > > > +	drm_sched_for_each_pending_job(job, &sched->base, NULL)
> > > > +		xe_sched_job_set_error(to_xe_sched_job(job), -ECANCELED);
> > > >
> > > > 	xe_sched_submission_start(sched);
> > > > -
> > > > -	spin_lock(&sched->base.job_list_lock);
> > > > -	list_for_each_entry(job, &sched->base.pending_list, drm.list)
> > > > -		xe_sched_job_set_error(job, -ECANCELED);
> > > > -	spin_unlock(&sched->base.job_list_lock);
> > > > -
> > > > -	xe_hw_fence_irq_start(q->fence_irq);
> > > > }
> > > >
> > > > #define ADJUST_FIVE_PERCENT(__t)	mul_u64_u32_div(__t, 105, 100)
> > > > @@ -1219,7 +1213,7 @@ static enum drm_gpu_sched_stat
> > > > guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > > > {
> > > > 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> > > > -	struct xe_sched_job *tmp_job;
> > > > +	struct drm_sched_job *tmp_job;
> > > > 	struct xe_exec_queue *q = job->q;
> > > > 	struct xe_gpu_scheduler *sched = &q->guc->sched;
> > > > 	struct xe_guc *guc = exec_queue_to_guc(q);
> > > > @@ -1228,7 +1222,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > > > 	unsigned int fw_ref;
> > > > 	int err = -ETIME;
> > > > 	pid_t pid = -1;
> > > > -	int i = 0;
> > > > 	bool wedged = false, skip_timeout_check;
> > > >
> > > > 	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_lr(q));
> > > > @@ -1395,28 +1388,15 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > > > 		__deregister_exec_queue(guc, q);
> > > > 	}
> > > >
> > > > -	/* Stop fence signaling */
> > > > -	xe_hw_fence_irq_stop(q->fence_irq);
> > > > +	/* Mark all outstanding jobs as bad, thus completing them */
> > > > +	xe_sched_job_set_error(job, err);
> > > 
> > > This setting error for this timed out job is newly added.
> > > Why was it not there before and being added now?
> > > 
> > 
> > Because the TDR job was added back into the pending list first, so in
> > fact we did set the error on the job.
> > 
> 
> Ok, got it. Thanks.
> 
> > > > +	drm_sched_for_each_pending_job(tmp_job, &sched->base, NULL)
> > > > +		xe_sched_job_set_error(to_xe_sched_job(tmp_job), -ECANCELED);
> > > >
> > > > -	/*
> > > > -	 * Fence state now stable, stop / start scheduler which cleans up any
> > > > -	 * fences that are complete
> > > > -	 */
> > > > -	xe_sched_add_pending_job(sched, job);
> > > 
> > > Why xe_sched_add_pending_job() was there before?
> > > 
> > 
> > We (DRM scheduler maintainers agreed drivers shouldn't touch the pending
> > list), below returning DRM_GPU_SCHED_STAT_NO_HANG defers this step to
> > the DRM scheduler core.
> > 
> > > > 	xe_sched_submission_start(sched);
> > > > -
> > > > 	xe_guc_exec_queue_trigger_cleanup(q);
> > > 
> > > Why do we need to trigger cleanup again here?
> > > 
> > 
> > This is existing code and it should only be called once in this
> > function. At this point in time, we don't know if the TDR fired
> > naturally with a normal timeout value or if we are already in process of
> > cleaning up. If it is the former, then we switch to cleanup immediately
> > mode which is why this call is needed.
> > 
> > > >
> > > > -	/* Mark all outstanding jobs as bad, thus completing them */
> > > > -	spin_lock(&sched->base.job_list_lock);
> > > > -	list_for_each_entry(tmp_job, &sched->base.pending_list, drm.list)
> > > > -		xe_sched_job_set_error(tmp_job, !i++ ? err : -ECANCELED);
> > > > -	spin_unlock(&sched->base.job_list_lock);
> > > > -
> > > > -	/* Start fence signaling */
> > > > -	xe_hw_fence_irq_start(q->fence_irq);
> > > > -
> > > > -	return DRM_GPU_SCHED_STAT_RESET;
> > > > +	return DRM_GPU_SCHED_STAT_NO_HANG;
> > > 
> > > This is error case. So, why return is changed to NO_HANG?
> > > 
> > 
> > See above, this how we can delete xe_sched_add_pending_job.
> > 
> 
> Ok, returning NO_HANG here so that drm scheduler adds the job
> back into the pending list. It is bit confusing to reader as
> to why we return NO_HANG even the case of a hang (error)
> condition here. May be a comment will help.
> 

This is in the DRM scheduler doc, but will add comment here too.

Matt

> Niranjana
> 
> > > Niranjana
> > > 
> > > >
> > > > sched_enable:
> > > > 	set_exec_queue_pending_tdr_exit(q);
> > > > @@ -2244,7 +2224,7 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
> > > > 	struct drm_sched_job *s_job;
> > > > 	struct xe_sched_job *job = NULL;
> > > >
> > > > -	list_for_each_entry(s_job, &sched->base.pending_list, list) {
> > > > +	drm_sched_for_each_pending_job(s_job, &sched->base, NULL) {
> > > > 		job = to_xe_sched_job(s_job);
> > > >
> > > > 		xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
> > > > @@ -2349,7 +2329,7 @@ void xe_guc_submit_unpause(struct xe_guc *guc)
> > > > 		 * created after resfix done.
> > > > 		 */
> > > > 		if (q->guc->id != index ||
> > > > -		    !READ_ONCE(q->guc->sched.base.pause_submit))
> > > > +		    !drm_sched_is_stopped(&q->guc->sched.base))
> > > > 			continue;
> > > >
> > > > 		guc_exec_queue_unpause(guc, q);
> > > > @@ -2771,30 +2751,6 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
> > > > 	if (snapshot->parallel_execution)
> > > > 		guc_exec_queue_wq_snapshot_capture(q, snapshot);
> > > >
> > > > -	spin_lock(&sched->base.job_list_lock);
> > > > -	snapshot->pending_list_size = list_count_nodes(&sched->base.pending_list);
> > > > -	snapshot->pending_list = kmalloc_array(snapshot->pending_list_size,
> > > > -					       sizeof(struct pending_list_snapshot),
> > > > -					       GFP_ATOMIC);
> > > > -
> > > > -	if (snapshot->pending_list) {
> > > > -		struct xe_sched_job *job_iter;
> > > > -
> > > > -		i = 0;
> > > > -		list_for_each_entry(job_iter, &sched->base.pending_list, drm.list) {
> > > > -			snapshot->pending_list[i].seqno =
> > > > -				xe_sched_job_seqno(job_iter);
> > > > -			snapshot->pending_list[i].fence =
> > > > -				dma_fence_is_signaled(job_iter->fence) ? 1 : 0;
> > > > -			snapshot->pending_list[i].finished =
> > > > -				dma_fence_is_signaled(&job_iter->drm.s_fence->finished)
> > > > -				? 1 : 0;
> > > > -			i++;
> > > > -		}
> > > > -	}
> > > > -
> > > > -	spin_unlock(&sched->base.job_list_lock);
> > > > -
> > > > 	return snapshot;
> > > > }
> > > >
> > > > @@ -2852,13 +2808,6 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
> > > >
> > > > 	if (snapshot->parallel_execution)
> > > > 		guc_exec_queue_wq_snapshot_print(snapshot, p);
> > > > -
> > > > -	for (i = 0; snapshot->pending_list && i < snapshot->pending_list_size;
> > > > -	     i++)
> > > > -		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
> > > > -			   snapshot->pending_list[i].seqno,
> > > > -			   snapshot->pending_list[i].fence,
> > > > -			   snapshot->pending_list[i].finished);
> > > > }
> > > >
> > > > /**
> > > > @@ -2881,7 +2830,6 @@ void xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *s
> > > > 			xe_lrc_snapshot_free(snapshot->lrc[i]);
> > > > 		kfree(snapshot->lrc);
> > > > 	}
> > > > -	kfree(snapshot->pending_list);
> > > > 	kfree(snapshot);
> > > > }
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
> > > > index dc7456c34583..0b08c79cf3b9 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
> > > > @@ -61,12 +61,6 @@ struct guc_submit_parallel_scratch {
> > > > 	u32 wq[WQ_SIZE / sizeof(u32)];
> > > > };
> > > >
> > > > -struct pending_list_snapshot {
> > > > -	u32 seqno;
> > > > -	bool fence;
> > > > -	bool finished;
> > > > -};
> > > > -
> > > > /**
> > > >  * struct xe_guc_submit_exec_queue_snapshot - Snapshot for devcoredump
> > > >  */
> > > > @@ -134,11 +128,6 @@ struct xe_guc_submit_exec_queue_snapshot {
> > > > 		/** @wq: Workqueue Items */
> > > > 		u32 wq[WQ_SIZE / sizeof(u32)];
> > > > 	} parallel;
> > > > -
> > > > -	/** @pending_list_size: Size of the pending list snapshot array */
> > > > -	int pending_list_size;
> > > > -	/** @pending_list: snapshot of the pending list info */
> > > > -	struct pending_list_snapshot *pending_list;
> > > > };
> > > >
> > > > #endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
> > > > index b2a0c46dfcd4..e65dfcdfdbc5 100644
> > > > --- a/drivers/gpu/drm/xe/xe_hw_fence.c
> > > > +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
> > > > @@ -110,22 +110,6 @@ void xe_hw_fence_irq_run(struct xe_hw_fence_irq *irq)
> > > > 	irq_work_queue(&irq->work);
> > > > }
> > > >
> > > > -void xe_hw_fence_irq_stop(struct xe_hw_fence_irq *irq)
> > > > -{
> > > > -	spin_lock_irq(&irq->lock);
> > > > -	irq->enabled = false;
> > > > -	spin_unlock_irq(&irq->lock);
> > > > -}
> > > > -
> > > > -void xe_hw_fence_irq_start(struct xe_hw_fence_irq *irq)
> > > > -{
> > > > -	spin_lock_irq(&irq->lock);
> > > > -	irq->enabled = true;
> > > > -	spin_unlock_irq(&irq->lock);
> > > > -
> > > > -	irq_work_queue(&irq->work);
> > > > -}
> > > > -
> > > > void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
> > > > 			  struct xe_hw_fence_irq *irq, const char *name)
> > > > {
> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
> > > > index f13a1c4982c7..599492c13f80 100644
> > > > --- a/drivers/gpu/drm/xe/xe_hw_fence.h
> > > > +++ b/drivers/gpu/drm/xe/xe_hw_fence.h
> > > > @@ -17,8 +17,6 @@ void xe_hw_fence_module_exit(void);
> > > > void xe_hw_fence_irq_init(struct xe_hw_fence_irq *irq);
> > > > void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq);
> > > > void xe_hw_fence_irq_run(struct xe_hw_fence_irq *irq);
> > > > -void xe_hw_fence_irq_stop(struct xe_hw_fence_irq *irq);
> > > > -void xe_hw_fence_irq_start(struct xe_hw_fence_irq *irq);
> > > >
> > > > void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
> > > > 			  struct xe_hw_fence_irq *irq, const char *name);
> > > > --
> > > > 2.34.1
> > > >
