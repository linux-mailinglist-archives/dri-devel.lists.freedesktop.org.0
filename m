Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52448C6B0ED
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 18:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C2A10E1C9;
	Tue, 18 Nov 2025 17:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ckMmb6LK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E0C10E1C9;
 Tue, 18 Nov 2025 17:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763488410; x=1795024410;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rjVlshu1HsrTrC53R/ZoMBHWuTosXJVo84Q4NO/WkfA=;
 b=ckMmb6LK+3HleFp0WGelOTU233VNYQJFu3pF/Ikje1RNNDWnu/E3VFYw
 IST5p27lRYNwAyWc9DebmL4FNEAQZo+EMXd6nwDqlhEodb8M4oTvzYQK1
 PmPMYKCuAuPM5fkV12uIX8wqzsahG9f9PSKd0ruUx7RDiO2QC44umM9pN
 xrml2ELNyjA0Y8u/5rQIrD7Pm48IefJ/TC2OtYSuJaf+NiUKqkxnZ7Vtm
 VV7ZjFSnmVxzHyXWy6EITtJAjYS+fdO79UIg9W31UB37XrnWO96Jqayid
 z33xEBw3kh1tzjSbhacfpQT6rk9rDa5cIJlRuGz5OBUlUQ4y9EsTIqBor Q==;
X-CSE-ConnectionGUID: fSyh1dWQTVSELpD7kL+LnA==
X-CSE-MsgGUID: yONUHpf5RM2/mqI5L+C3tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65678747"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65678747"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 09:53:30 -0800
X-CSE-ConnectionGUID: 7kexA9HUSgezN6cx1c+YGA==
X-CSE-MsgGUID: jrAADm3uSUy0JDWCuaq5VQ==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 09:53:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 09:53:28 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 09:53:28 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 09:53:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSBSwRp2I52IYxULOIb33cR7SrtICqQ81Xn09DRTai0MhQfeGKV0Pb3/grpXN5w6iEbaS3RGw2bzl4gs4YjWhrSBh2d7YUxMl5nDldZHsU/W+gyRxfJZPO5Kflv6wFLhekFCAuQpepNgZJTNrVfjS4OxzIh+uFcQD5RxKHZFWZVi5tPz7Q9IRfguX7ISudoNc1gQuZU91eTrU//YFXpZg9nWTaoiZ9ZhvtaBGi/WNlwdURCOn5tnIbRfn/LHp517ApstlMplhBLRJfMLnxh2NS3JN46OXUjeLl3YGxu2uougEJ9Rb9QK5zpJqTsHw18YIcjIxcnNmnBexFA4GpL6Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtYqGoDD6sqSKH9G6re+hHv55v2UetHgYsHWpZE3jus=;
 b=mEuvJbCAsB9r23Jr2DV0NZklypzl8LkYJnx85nUEUlbDJibnb2zYq4wrdqenMP5Nydv44HF7wHHcR6pUDGpkIxULs2KT6E7TLOuiQpCMTzxuoZGCuu38Cv7NjwG1aDq+2ba783k9LaiH+67X0RtZL7KMxuad6WyoVrWCTUZ3CMxWv9PYW8VF6vnNZoTM4siQR0uZgljat0ccVC+YpRU5rMuXhBhvAQwEXfJp7Bn/asxhIsVfwl3H9nruhQP1BtrGKUpuiIguBM2xzCPw/RkIv2nm6oi2fQjYwbKJg5IJd+Fi/5lGpYkK/9SFgNmQVcG60wNCu5sAMgEEVDMgEmULzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7093.namprd11.prod.outlook.com (2603:10b6:510:217::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 17:53:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 17:53:25 +0000
Date: Tue, 18 Nov 2025 09:53:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 3/7] drm/xe: Add dedicated message lock
Message-ID: <aRyykmPa99pbV928@lstrano-desk.jf.intel.com>
References: <20251016204826.284077-1-matthew.brost@intel.com>
 <20251016204826.284077-4-matthew.brost@intel.com>
 <aRt-dj6gAyP5y4TC@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aRt-dj6gAyP5y4TC@nvishwa1-desk>
X-ClientProxiedBy: MW4PR03CA0200.namprd03.prod.outlook.com
 (2603:10b6:303:b8::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: 65ea82fc-c756-47e8-693e-08de26cb5f4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IJuWocDi+7g0LSJxpbA6JkxzBNaH48dx7if5IvIUBo9eKalj+6T0G96PclXo?=
 =?us-ascii?Q?m7FrPpaBRwicRb42GhZ4+cCbd1YF2lyFfs8lhnWUTbNbTReDkqxGR7uBd/M5?=
 =?us-ascii?Q?Ly9e3cDFE433D+oDWaRx6oy+U4G4xVNfPAtfazE4IR/sngpczc1szVl2Xosa?=
 =?us-ascii?Q?DzJzgv0+uuJ3PbRci9eKIsOOYYEA4Bq6kPkPNYJbty4qMoeeIjeAgS80R7rf?=
 =?us-ascii?Q?4t5CoNUjFJvsDnKt2QpCVOUScCcqdK3Q856uMfGdJzNpuYz2EeLsniH+TOmh?=
 =?us-ascii?Q?4wAQu6/UMPQkrfkCN32j3y3ilLgvWgkUd7dL6jpDSpVUy7paVRn7o3LxoFxw?=
 =?us-ascii?Q?+qPov1OWJ0tqoMXGI+UZjj7qvkq/rj8D/CWqUazShW6ULBHQ5bw7q9dz7sJo?=
 =?us-ascii?Q?XYhj8dUAeOODnrvTZenB4ae2v8R49kj2f2ApzTUP8bGz2gHuYHldhg0wtvlP?=
 =?us-ascii?Q?7mzzQjLdYUcHSCdb2pYRCLtv08uFmMSnKK1iLgCw1kRCP9uneUs7R+dLAGlI?=
 =?us-ascii?Q?Xozta1UuRpOaZMmwYhiz/JXmllqErwjX9Lhgi9OPJHQ9vtN3I8hmbPe3/lPb?=
 =?us-ascii?Q?HHkkpTdz9ZJaadPyfNIdI1hm/LeFVL8BXQTu0KuFjEDTpuevwOwCuhS8YkL7?=
 =?us-ascii?Q?zCwB+M/EuWMa+rLcdbX9jUifBGDL6f0iCZ5zyBpMz183R2rhZKlnUSvsWutL?=
 =?us-ascii?Q?Yc/FxyuIeaSXCWLYVMEIImacxzxTgeW6TVkm7Q2m5kay3pbSLFjuvoyp9W4N?=
 =?us-ascii?Q?hj/cuhxyT7+raxIqngL2Zd8xMvv5R3tGeiw0pof/zphKhDtywKhdTZyegzDB?=
 =?us-ascii?Q?KrnqdGDwUir3X0izMKvl62CtAjApjZa36qrVXXC6q+nf0dTMBZL+k1SXn15Q?=
 =?us-ascii?Q?4SzvXmPZikupnUnCo/IH/4h9/Br0bzdJL4UznnFgtb6ZHmt8jXIEFIwDi6LD?=
 =?us-ascii?Q?lZFxollk1SYh60Oj3PZFFwAqFEO/gvKlNWAMzyYGBsNv15ozXopc7dmNeBLZ?=
 =?us-ascii?Q?DfAY9PkEbxI7C7uaiInEYQ4/KoaO6t5BdiE3+rzutjOG5KbxsWBh66ifAswR?=
 =?us-ascii?Q?ux3mUKRHQwpCu4qOjmP8JcCdIG+4QVZYtcKZ+aEfWbPP/6meMbMuVUwJqf3u?=
 =?us-ascii?Q?TOnS6JfEroGd1h9X/pii9Qi2EExdOrUWzNrQAplI58ZkcepXMjlf8EvLJooG?=
 =?us-ascii?Q?krUmOzNIWRzwnHyu2E0BjPfbNJQ/jPum1yeeL5V8z0A2NrO7nVehtqUGlMnM?=
 =?us-ascii?Q?mPOyaSCwhp3FqA8Ie69LCbfH6HB3cgm+SvQUS7IGgVWLJd0Dq6z2VRBjuk52?=
 =?us-ascii?Q?EYMW6UPDeF+yoC7bkwlUWF+KLMEEidT3WNrHf6Uc7kM7u6G7R4njRzO00V4f?=
 =?us-ascii?Q?Ma849JFhM/2+In1AaIwwMuXBxaMDVBH/bAIgZ3u0dAsWO0Wr+AksYcYaazpx?=
 =?us-ascii?Q?4SH6gdRxomCKoh784TgGL3OmJ9vqyw8B?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n2q8VZy5asCejJ4NdvLXpW1PPJhOqESrIEeORYwfo4YIglZ1yo8FkmAgYPp9?=
 =?us-ascii?Q?gFY7GjQln3VEH6YFHWg5yaiVd4Xsfmka3wdy7OG3/DkStu4V92TZJ4jPjilo?=
 =?us-ascii?Q?7gGoCdlryfDYJZuLhx931OJL9GrFpRTdFNpgAjqgRtyQu42Q1DNs29MOW/VU?=
 =?us-ascii?Q?LJeM+ZIWQeQB8DohBAMhphsgP+JEmp3HqkENlvQNRP37kaGOO1KyefDODWbY?=
 =?us-ascii?Q?+7rzhyU+igPl96taxR1FgnKagcszHGiWu13Avr80EFwPmGfNwJvl4rKUPPHK?=
 =?us-ascii?Q?CmxsR1o1xTKqExLQb+KxhWF+yjsVNPdAms8eyqzHr2V9Tb9ZiIc2Xe+kOy5x?=
 =?us-ascii?Q?9GLamOHKgKlP7bvKcr91VXi8Z5vSFNHsVh2lVuOWi/5xnM3HjyY0GPQJ4rSg?=
 =?us-ascii?Q?cmkcEF1JC9O9+CEKXa0+Y7M13PaRjZjueuysgtwkv751VMYd3CFEghmIKcdS?=
 =?us-ascii?Q?by8IqDCL7/AdRUX9ECfUH/OGuCA7qYFAKht7mFN9wWHv9vjTZSiS9AeXFh4Q?=
 =?us-ascii?Q?1Df3F9OkfL0LE6vRKLvycBFZAcXrEPetmnzTrXbzo2qiXYzChllzlz3ItbA5?=
 =?us-ascii?Q?Id+m15thXtyz1MsuTNzY+4XC3rqANCarBizC0dux4NI71h/vFsyX6Qxa2GUr?=
 =?us-ascii?Q?d8+wACzT5oln3BNICgQsUVqbCX67WqZLowMlJG5pjrLOOa1x32R58fx23X/B?=
 =?us-ascii?Q?p79LINUpBQeRE+eaotiHZ39UYdEepcZroO0L1itfw4nPsIhiQlFnMrrT2PIn?=
 =?us-ascii?Q?BQwIQqm2GG3YhZKBvesRoceVpvhNjgZGCjL+bLhiMuzjcSdPqoqohG0YhxJz?=
 =?us-ascii?Q?fq+o3TcPpxtc1z/Oe/SECtM5VGWc/y5WmKSJJMfTDJ2hx/i8Dt00N6+4KHFW?=
 =?us-ascii?Q?EFdLWC1nsmx0mqPU5FZ+cIyKYVyxfGf86ksdrZvBsBmIY4Dm6fx0uPHtJzLn?=
 =?us-ascii?Q?H26VViphaZC5Koen1tXf9sQ1sT19IZMk84cFJH6yDPQ/w6wV6iwgr+fjsJHT?=
 =?us-ascii?Q?ibaYNpk+SAQSMSvHg+WplM7uHDTBW/t2kWdrgPXt8Z+yqnC0eV2WhLwmP0ML?=
 =?us-ascii?Q?797FYkHotES7gH/pZACVUl7TVvvhgMQcGAHD2AGmYUtJ8LJyg/O/+jvGTFm9?=
 =?us-ascii?Q?pSXrAvDY3GRKLlZCZ/leTFto6W2Rt306EyZf3BPWGuZKT5XzQflFhkNZKl4V?=
 =?us-ascii?Q?ClnVj8v2GONU6mTBLqAFQIyaC0qDorzQcqMtq7g1bIDvEQ4bbrOBiFCiLL5J?=
 =?us-ascii?Q?bxNYPtggYIn/I26qcB+NHKTz645RC5UohWEUGeWYqVybqcyauShdvvL14ABg?=
 =?us-ascii?Q?r5tdiU8SSlBbwyKjBbKg4bQ2UsL2BSFy6AssNlcvqsFRUgGUUPr1nF1kWtt1?=
 =?us-ascii?Q?HztJiuG/N/7limmvhTDCoLoqlUVdS/oAXMMb6XOp6IxMW1BFaoHVESAySzn7?=
 =?us-ascii?Q?Mcu8jN+dSyk9pbE3Y6Sszc4f/qaCXotDkbMQBz4IsS+V/uR5b9Jii/xniZc0?=
 =?us-ascii?Q?qFbJvyEYXQR7M/o6FQ88AZrzTGsJzK7uwsfLZlarIqufCatQ8uYIT5vkXdwY?=
 =?us-ascii?Q?/ilHx1HezEqAUyT5JxPCvTcF40F8olAseQycKDQIQb2bGGYVzIV12yPvEKsP?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ea82fc-c756-47e8-693e-08de26cb5f4f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 17:53:25.3553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wNPWvRbf0AasmBi/7P+q4PPlzNlQ5/Ux+eB2OKn78T5D+40VKt7GckAcaup8FBHv3K2iSNtj1Tf+7LidlbnA0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7093
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

On Mon, Nov 17, 2025 at 11:58:46AM -0800, Niranjana Vishwanathapura wrote:
> On Thu, Oct 16, 2025 at 01:48:22PM -0700, Matthew Brost wrote:
> > Stop abusing DRM scheduler job list lock for messages, add dedicated
> > message lock.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> LGTM.
> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> 

Going to send this out on its own for CI and merge. Thanks for the review.

Matt

> > ---
> > drivers/gpu/drm/xe/xe_gpu_scheduler.c       | 5 +++--
> > drivers/gpu/drm/xe/xe_gpu_scheduler.h       | 4 ++--
> > drivers/gpu/drm/xe/xe_gpu_scheduler_types.h | 2 ++
> > 3 files changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > index f91e06d03511..f4f23317191f 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > @@ -77,6 +77,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
> > 	};
> > 
> > 	sched->ops = xe_ops;
> > +	spin_lock_init(&sched->msg_lock);
> > 	INIT_LIST_HEAD(&sched->msgs);
> > 	INIT_WORK(&sched->work_process_msg, xe_sched_process_msg_work);
> > 
> > @@ -117,7 +118,7 @@ void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
> > void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
> > 			     struct xe_sched_msg *msg)
> > {
> > -	lockdep_assert_held(&sched->base.job_list_lock);
> > +	lockdep_assert_held(&sched->msg_lock);
> > 
> > 	list_add_tail(&msg->link, &sched->msgs);
> > 	xe_sched_process_msg_queue(sched);
> > @@ -131,7 +132,7 @@ void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
> > void xe_sched_add_msg_head(struct xe_gpu_scheduler *sched,
> > 			   struct xe_sched_msg *msg)
> > {
> > -	lockdep_assert_held(&sched->base.job_list_lock);
> > +	lockdep_assert_held(&sched->msg_lock);
> > 
> > 	list_add(&msg->link, &sched->msgs);
> > 	xe_sched_process_msg_queue(sched);
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > index 9955397aaaa9..b971b6b69419 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > @@ -33,12 +33,12 @@ void xe_sched_add_msg_head(struct xe_gpu_scheduler *sched,
> > 
> > static inline void xe_sched_msg_lock(struct xe_gpu_scheduler *sched)
> > {
> > -	spin_lock(&sched->base.job_list_lock);
> > +	spin_lock(&sched->msg_lock);
> > }
> > 
> > static inline void xe_sched_msg_unlock(struct xe_gpu_scheduler *sched)
> > {
> > -	spin_unlock(&sched->base.job_list_lock);
> > +	spin_unlock(&sched->msg_lock);
> > }
> > 
> > static inline void xe_sched_stop(struct xe_gpu_scheduler *sched)
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> > index 6731b13da8bb..63d9bf92583c 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> > @@ -47,6 +47,8 @@ struct xe_gpu_scheduler {
> > 	const struct xe_sched_backend_ops	*ops;
> > 	/** @msgs: list of messages to be processed in @work_process_msg */
> > 	struct list_head			msgs;
> > +	/** @msg_lock: Message lock */
> > +	spinlock_t				msg_lock;
> > 	/** @work_process_msg: processes messages */
> > 	struct work_struct		work_process_msg;
> > };
> > -- 
> > 2.34.1
> > 
